
unit ShowENFuelCardHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENFuelCardHistoryController ;


type
    TfrmENFuelCardHistoryShow = class(TChildForm)  
    HTTPRIOENFuelCardHistory: THTTPRIO;
    ImageList1: TImageList;
    sgENFuelCardHistory: TAdvStringGrid;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENFuelCardHistoryTopLeftChanged(Sender: TObject);
    procedure sgENFuelCardHistoryDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
   selectedRow: Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
   class function chooseFromList : ENFuelCardHistoryShort; stdcall; static;
 end;


var
  frmENFuelCardHistoryShow: TfrmENFuelCardHistoryShow;
  
  
implementation

uses Main, EditENFuelCardHistory, EditENFuelCardHistoryFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENFuelCardHistoryHeaders: array [1..6] of String =
        ( 'Код'
          ,'Дата початку періоду'
          ,'Дата закінчення періоду'
          ,'Рестраційний номер карти'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   
class function TfrmENFuelCardHistoryShow.chooseFromList : ENFuelCardHistoryShort;
var
  f1 : ENFuelCardHistoryFilter;
  frmENFuelCardHistoryShow : TfrmENFuelCardHistoryShow;
  selected : ENFuelCardHistoryShort;
begin
  inherited;
     selected := nil;
     f1 := ENFuelCardHistoryFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENFuelCardHistoryShow := TfrmENFuelCardHistoryShow.Create(Application, fmNormal, f1);
       try
          with frmENFuelCardHistoryShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENFuelCardHistoryShort(sgENFuelCardHistory.Objects[0, sgENFuelCardHistory.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENFuelCardHistoryShow.Free;
       end;
end;

procedure TfrmENFuelCardHistoryShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENFuelCardHistoryShow:=nil;
  inherited;
end;


procedure TfrmENFuelCardHistoryShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENFuelCardHistoryShow.FormShow(Sender: TObject);
var
  TempENFuelCardHistory: ENFuelCardHistoryControllerSoapPort;
  i: Integer;
  ENFuelCardHistoryList: ENFuelCardHistoryShortList;
begin
  SetGridHeaders(ENFuelCardHistoryHeaders, sgENFuelCardHistory.ColumnHeaders);
  ColCount:=100;
  TempENFuelCardHistory :=  HTTPRIOENFuelCardHistory as ENFuelCardHistoryControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENFuelCardHistoryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENFuelCardHistoryList := TempENFuelCardHistory.getScrollableFilteredList(ENFuelCardHistoryFilter(FilterObject),0,ColCount);
  LastCount:=High(ENFuelCardHistoryList.list);

  if LastCount > -1 then
     sgENFuelCardHistory.RowCount:=LastCount+2
  else
     sgENFuelCardHistory.RowCount:=2;

   with sgENFuelCardHistory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFuelCardHistoryList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENFuelCardHistoryList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENFuelCardHistoryList.list[i].dateStart = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(ENFuelCardHistoryList.list[i].dateStart);
        if ENFuelCardHistoryList.list[i].dateFinal = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENFuelCardHistoryList.list[i].dateFinal);
        Cells[3,i+1] := ENFuelCardHistoryList.list[i].reg_id;
        Cells[4,i+1] := ENFuelCardHistoryList.list[i].userGen;
        if ENFuelCardHistoryList.list[i].dateEdit = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDateTimeWithDate2String(ENFuelCardHistoryList.list[i].dateEdit);
		Objects[0, i+1] := ENFuelCardHistoryList.list[i];
        LastRow:=i+1;
        sgENFuelCardHistory.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENFuelCardHistory.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENFuelCardHistory.RowCount > selectedRow then
      sgENFuelCardHistory.Row := selectedRow
    else
      sgENFuelCardHistory.Row := sgENFuelCardHistory.RowCount - 1;
    end
    else
      sgENFuelCardHistory.Row:=1;   
end;


procedure TfrmENFuelCardHistoryShow.sgENFuelCardHistoryTopLeftChanged(Sender: TObject);
var
  TempENFuelCardHistory: ENFuelCardHistoryControllerSoapPort;
  i,CurrentRow: Integer;
  ENFuelCardHistoryList: ENFuelCardHistoryShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENFuelCardHistory.TopRow + sgENFuelCardHistory.VisibleRowCount) = ColCount
  then
    begin
      TempENFuelCardHistory :=  HTTPRIOENFuelCardHistory as ENFuelCardHistoryControllerSoapPort;
      CurrentRow:=sgENFuelCardHistory.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENFuelCardHistoryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENFuelCardHistoryList := TempENFuelCardHistory.getScrollableFilteredList(ENFuelCardHistoryFilter(FilterObject),ColCount-1, 100);


  sgENFuelCardHistory.RowCount:=sgENFuelCardHistory.RowCount+100;
  LastCount:=High(ENFuelCardHistoryList.list);
  with sgENFuelCardHistory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFuelCardHistoryList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENFuelCardHistoryList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENFuelCardHistoryList.list[i].dateStart = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := XSDate2String(ENFuelCardHistoryList.list[i].dateStart);
        if ENFuelCardHistoryList.list[i].dateFinal = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENFuelCardHistoryList.list[i].dateFinal);
        Cells[3,i+CurrentRow] := ENFuelCardHistoryList.list[i].reg_id;
        Cells[4,i+CurrentRow] := ENFuelCardHistoryList.list[i].userGen;
        if ENFuelCardHistoryList.list[i].dateEdit = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := XSDateTimeWithDate2String(ENFuelCardHistoryList.list[i].dateEdit);
		  Objects[0, i+CurrentRow] := ENFuelCardHistoryList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENFuelCardHistory.Row:=CurrentRow-5;
   sgENFuelCardHistory.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENFuelCardHistoryShow.sgENFuelCardHistoryDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENFuelCardHistory,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENFuelCardHistoryShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENFuelCardHistory.RowCount-1 do
   for j:=0 to sgENFuelCardHistory.ColCount-1 do
     sgENFuelCardHistory.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENFuelCardHistoryShow.actViewExecute(Sender: TObject);
var 
  TempENFuelCardHistory: ENFuelCardHistoryControllerSoapPort;
begin
  TempENFuelCardHistory := HTTPRIOENFuelCardHistory as ENFuelCardHistoryControllerSoapPort;
  try
    ENFuelCardHistoryObj := TempENFuelCardHistory.getObject(StrToInt(sgENFuelCardHistory.Cells[0, sgENFuelCardHistory.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENFuelCardHistoryEdit := TfrmENFuelCardHistoryEdit.Create(Application, dsView);
  try
    frmENFuelCardHistoryEdit.ShowModal;
  finally
    frmENFuelCardHistoryEdit.Free;
    frmENFuelCardHistoryEdit := nil;
  end;
end;


procedure TfrmENFuelCardHistoryShow.actEditExecute(Sender: TObject);
var 
  TempENFuelCardHistory: ENFuelCardHistoryControllerSoapPort;
begin
  TempENFuelCardHistory := HTTPRIOENFuelCardHistory as ENFuelCardHistoryControllerSoapPort;
  try
    ENFuelCardHistoryObj := TempENFuelCardHistory.getObject(StrToInt(sgENFuelCardHistory.Cells[0,sgENFuelCardHistory.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENFuelCardHistory.Row;
  frmENFuelCardHistoryEdit:=TfrmENFuelCardHistoryEdit.Create(Application, dsEdit);
  
  try
    if frmENFuelCardHistoryEdit.ShowModal= mrOk then
      begin
        //TempENFuelCardHistory.save(ENFuelCardHistoryObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENFuelCardHistoryEdit.Free;
    frmENFuelCardHistoryEdit:=nil;
  end;

  if sgENFuelCardHistory.RowCount > selectedRow then
    sgENFuelCardHistory.Row := selectedRow
  else
    sgENFuelCardHistory.Row := sgENFuelCardHistory.RowCount - 1;
  
end;


procedure TfrmENFuelCardHistoryShow.actDeleteExecute(Sender: TObject);
Var TempENFuelCardHistory: ENFuelCardHistoryControllerSoapPort;
  ObjCode: Integer;
begin
 TempENFuelCardHistory := HTTPRIOENFuelCardHistory as ENFuelCardHistoryControllerSoapPort;
   try
     ObjCode := StrToInt(sgENFuelCardHistory.Cells[0,sgENFuelCardHistory.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Історія змін по паливним карткам)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENFuelCardHistory.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENFuelCardHistoryShow.actInsertExecute(Sender: TObject);
// Var TempENFuelCardHistory: ENFuelCardHistoryControllerSoapPort; 
begin
  // TempENFuelCardHistory := HTTPRIOENFuelCardHistory as ENFuelCardHistoryControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENFuelCardHistoryObj:=ENFuelCardHistory.Create;
  SetNullIntProps(ENFuelCardHistoryObj);
  SetNullXSProps(ENFuelCardHistoryObj);

   //ENFuelCardHistoryObj.dateStart:= TXSDate.Create;
   //ENFuelCardHistoryObj.dateFinal:= TXSDate.Create;
   //ENFuelCardHistoryObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENFuelCardHistoryEdit:=TfrmENFuelCardHistoryEdit.Create(Application, dsInsert);
    try
      if frmENFuelCardHistoryEdit.ShowModal = mrOk then
      begin
        if ENFuelCardHistoryObj<>nil then
            //TempENFuelCardHistory.add(ENFuelCardHistoryObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENFuelCardHistoryEdit.Free;
      frmENFuelCardHistoryEdit:=nil;
    end;
  finally
    ENFuelCardHistoryObj.Free;
  end;
end;


procedure TfrmENFuelCardHistoryShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENFuelCardHistoryShow.actFilterExecute(Sender: TObject);
begin
{frmENFuelCardHistoryFilterEdit:=TfrmENFuelCardHistoryFilterEdit.Create(Application, dsInsert);
  try
    ENFuelCardHistoryFilterObj := ENFuelCardHistoryFilter.Create;
    SetNullIntProps(ENFuelCardHistoryFilterObj);
    SetNullXSProps(ENFuelCardHistoryFilterObj);

    if frmENFuelCardHistoryFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENFuelCardHistoryFilter.Create;
      FilterObject := ENFuelCardHistoryFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENFuelCardHistoryFilterEdit.Free;
    frmENFuelCardHistoryFilterEdit:=nil;
  end;}
end;


procedure TfrmENFuelCardHistoryShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.