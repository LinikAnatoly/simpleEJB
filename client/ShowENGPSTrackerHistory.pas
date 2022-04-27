
unit ShowENGPSTrackerHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENGPSTrackerHistoryController, AdvObj ;


type
    TfrmENGPSTrackerHistoryShow = class(TChildForm)  
    HTTPRIOENGPSTrackerHistory: THTTPRIO;
    ImageList1: TImageList;
    sgENGPSTrackerHistory: TAdvStringGrid;
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
    procedure sgENGPSTrackerHistoryTopLeftChanged(Sender: TObject);
    procedure sgENGPSTrackerHistoryDblClick(Sender: TObject);
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
   class function chooseFromList : ENGPSTrackerHistoryShort; stdcall; static;
 end;


var
  frmENGPSTrackerHistoryShow: TfrmENGPSTrackerHistoryShow;
  
  
implementation

uses Main, EditENGPSTrackerHistory, EditENGPSTrackerHistoryFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENGPSTrackerHistoryHeaders: array [1..8] of String =
        ( 'Код'
          ,'Дата початку періоду'
          ,'Дата закінчення періоду'
          ,'Рестраційний номер трекеру'
          ,'Номер телефону SIM-карти'
          ,'код  SIM-карти'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   
class function TfrmENGPSTrackerHistoryShow.chooseFromList : ENGPSTrackerHistoryShort;
var
  f1 : ENGPSTrackerHistoryFilter;
  frmENGPSTrackerHistoryShow : TfrmENGPSTrackerHistoryShow;
  selected : ENGPSTrackerHistoryShort;
begin
  inherited;
     selected := nil;
     f1 := ENGPSTrackerHistoryFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENGPSTrackerHistoryShow := TfrmENGPSTrackerHistoryShow.Create(Application, fmNormal, f1);
       try
          with frmENGPSTrackerHistoryShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENGPSTrackerHistoryShort(sgENGPSTrackerHistory.Objects[0, sgENGPSTrackerHistory.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENGPSTrackerHistoryShow.Free;
       end;
end;

procedure TfrmENGPSTrackerHistoryShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENGPSTrackerHistoryShow:=nil;
  inherited;
end;


procedure TfrmENGPSTrackerHistoryShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENGPSTrackerHistoryShow.FormShow(Sender: TObject);
var
  TempENGPSTrackerHistory: ENGPSTrackerHistoryControllerSoapPort;
  i: Integer;
  ENGPSTrackerHistoryList: ENGPSTrackerHistoryShortList;
begin
  SetGridHeaders(ENGPSTrackerHistoryHeaders, sgENGPSTrackerHistory.ColumnHeaders);
  ColCount:=100;
  TempENGPSTrackerHistory :=  HTTPRIOENGPSTrackerHistory as ENGPSTrackerHistoryControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENGPSTrackerHistoryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENGPSTrackerHistoryList := TempENGPSTrackerHistory.getScrollableFilteredList(ENGPSTrackerHistoryFilter(FilterObject),0,ColCount);
  LastCount:=High(ENGPSTrackerHistoryList.list);

  if LastCount > -1 then
     sgENGPSTrackerHistory.RowCount:=LastCount+2
  else
     sgENGPSTrackerHistory.RowCount:=2;

   with sgENGPSTrackerHistory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENGPSTrackerHistoryList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENGPSTrackerHistoryList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENGPSTrackerHistoryList.list[i].dateStart = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(ENGPSTrackerHistoryList.list[i].dateStart);
        Objects[0, i+1] := ENGPSTrackerHistoryList.list[i];
        if ENGPSTrackerHistoryList.list[i].dateFinal = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENGPSTrackerHistoryList.list[i].dateFinal);
        Objects[0, i+1] := ENGPSTrackerHistoryList.list[i];
        Cells[3,i+1] := ENGPSTrackerHistoryList.list[i].reg_id;
        Objects[0, i+1] := ENGPSTrackerHistoryList.list[i];
        Cells[4,i+1] := ENGPSTrackerHistoryList.list[i].phoneNumber;
        Objects[0, i+1] := ENGPSTrackerHistoryList.list[i];
        Cells[5,i+1] := ENGPSTrackerHistoryList.list[i].cardNumber;
        Objects[0, i+1] := ENGPSTrackerHistoryList.list[i];
        Cells[6,i+1] := ENGPSTrackerHistoryList.list[i].userGen;
        Objects[0, i+1] := ENGPSTrackerHistoryList.list[i];
        if ENGPSTrackerHistoryList.list[i].dateEdit = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDateTimeWithDate2String(ENGPSTrackerHistoryList.list[i].dateEdit);
        Objects[0, i+1] := ENGPSTrackerHistoryList.list[i];
        LastRow:=i+1;
        sgENGPSTrackerHistory.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENGPSTrackerHistory.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENGPSTrackerHistory.RowCount > selectedRow then
      sgENGPSTrackerHistory.Row := selectedRow
    else
      sgENGPSTrackerHistory.Row := sgENGPSTrackerHistory.RowCount - 1;
    end
    else
      sgENGPSTrackerHistory.Row:=1;   
end;


procedure TfrmENGPSTrackerHistoryShow.sgENGPSTrackerHistoryTopLeftChanged(Sender: TObject);
var
  TempENGPSTrackerHistory: ENGPSTrackerHistoryControllerSoapPort;
  i,CurrentRow: Integer;
  ENGPSTrackerHistoryList: ENGPSTrackerHistoryShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENGPSTrackerHistory.TopRow + sgENGPSTrackerHistory.VisibleRowCount) = ColCount
  then
    begin
      TempENGPSTrackerHistory :=  HTTPRIOENGPSTrackerHistory as ENGPSTrackerHistoryControllerSoapPort;
      CurrentRow:=sgENGPSTrackerHistory.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENGPSTrackerHistoryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENGPSTrackerHistoryList := TempENGPSTrackerHistory.getScrollableFilteredList(ENGPSTrackerHistoryFilter(FilterObject),ColCount-1, 100);


  sgENGPSTrackerHistory.RowCount:=sgENGPSTrackerHistory.RowCount+100;
  LastCount:=High(ENGPSTrackerHistoryList.list);
  with sgENGPSTrackerHistory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENGPSTrackerHistoryList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENGPSTrackerHistoryList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENGPSTrackerHistoryList.list[i].dateStart = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := XSDate2String(ENGPSTrackerHistoryList.list[i].dateStart);
        Objects[0, i+CurrentRow] := ENGPSTrackerHistoryList.list[i];
        if ENGPSTrackerHistoryList.list[i].dateFinal = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENGPSTrackerHistoryList.list[i].dateFinal);
        Objects[0, i+CurrentRow] := ENGPSTrackerHistoryList.list[i];
        Cells[3,i+CurrentRow] := ENGPSTrackerHistoryList.list[i].reg_id;
        Objects[0, i+CurrentRow] := ENGPSTrackerHistoryList.list[i];
        Cells[4,i+CurrentRow] := ENGPSTrackerHistoryList.list[i].phoneNumber;
        Objects[0, i+CurrentRow] := ENGPSTrackerHistoryList.list[i];
        Cells[5,i+CurrentRow] := ENGPSTrackerHistoryList.list[i].cardNumber;
        Objects[0, i+CurrentRow] := ENGPSTrackerHistoryList.list[i];
        Cells[6,i+CurrentRow] := ENGPSTrackerHistoryList.list[i].userGen;
        Objects[0, i+CurrentRow] := ENGPSTrackerHistoryList.list[i];
        if ENGPSTrackerHistoryList.list[i].dateEdit = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := XSDateTimeWithDate2String(ENGPSTrackerHistoryList.list[i].dateEdit);
        Objects[0, i+CurrentRow] := ENGPSTrackerHistoryList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENGPSTrackerHistory.Row:=CurrentRow-5;
   sgENGPSTrackerHistory.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENGPSTrackerHistoryShow.sgENGPSTrackerHistoryDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENGPSTrackerHistory,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENGPSTrackerHistoryShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENGPSTrackerHistory.RowCount-1 do
   for j:=0 to sgENGPSTrackerHistory.ColCount-1 do
     sgENGPSTrackerHistory.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENGPSTrackerHistoryShow.actViewExecute(Sender: TObject);
var 
  TempENGPSTrackerHistory: ENGPSTrackerHistoryControllerSoapPort;
begin
  TempENGPSTrackerHistory := HTTPRIOENGPSTrackerHistory as ENGPSTrackerHistoryControllerSoapPort;
  try
    ENGPSTrackerHistoryObj := TempENGPSTrackerHistory.getObject(StrToInt(sgENGPSTrackerHistory.Cells[0, sgENGPSTrackerHistory.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENGPSTrackerHistoryEdit := TfrmENGPSTrackerHistoryEdit.Create(Application, dsView);
  try
    frmENGPSTrackerHistoryEdit.ShowModal;
  finally
    frmENGPSTrackerHistoryEdit.Free;
    frmENGPSTrackerHistoryEdit := nil;
  end;
end;


procedure TfrmENGPSTrackerHistoryShow.actEditExecute(Sender: TObject);
var 
  TempENGPSTrackerHistory: ENGPSTrackerHistoryControllerSoapPort;
begin
  TempENGPSTrackerHistory := HTTPRIOENGPSTrackerHistory as ENGPSTrackerHistoryControllerSoapPort;
  try
    ENGPSTrackerHistoryObj := TempENGPSTrackerHistory.getObject(StrToInt(sgENGPSTrackerHistory.Cells[0,sgENGPSTrackerHistory.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENGPSTrackerHistory.Row;
  frmENGPSTrackerHistoryEdit:=TfrmENGPSTrackerHistoryEdit.Create(Application, dsEdit);
  
  try
    if frmENGPSTrackerHistoryEdit.ShowModal= mrOk then
      begin
        //TempENGPSTrackerHistory.save(ENGPSTrackerHistoryObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENGPSTrackerHistoryEdit.Free;
    frmENGPSTrackerHistoryEdit:=nil;
  end;

  if sgENGPSTrackerHistory.RowCount > selectedRow then
    sgENGPSTrackerHistory.Row := selectedRow
  else
    sgENGPSTrackerHistory.Row := sgENGPSTrackerHistory.RowCount - 1;
  
end;


procedure TfrmENGPSTrackerHistoryShow.actDeleteExecute(Sender: TObject);
Var TempENGPSTrackerHistory: ENGPSTrackerHistoryControllerSoapPort;
  ObjCode: Integer;
begin
 TempENGPSTrackerHistory := HTTPRIOENGPSTrackerHistory as ENGPSTrackerHistoryControllerSoapPort;
   try
     ObjCode := StrToInt(sgENGPSTrackerHistory.Cells[0,sgENGPSTrackerHistory.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Історія встановлення трекеру GPS)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENGPSTrackerHistory.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENGPSTrackerHistoryShow.actInsertExecute(Sender: TObject);
// Var TempENGPSTrackerHistory: ENGPSTrackerHistoryControllerSoapPort; 
begin
  // TempENGPSTrackerHistory := HTTPRIOENGPSTrackerHistory as ENGPSTrackerHistoryControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENGPSTrackerHistoryObj:=ENGPSTrackerHistory.Create;
  SetNullIntProps(ENGPSTrackerHistoryObj);
  SetNullXSProps(ENGPSTrackerHistoryObj);

   //ENGPSTrackerHistoryObj.dateStart:= TXSDate.Create;
   //ENGPSTrackerHistoryObj.dateFinal:= TXSDate.Create;
   //ENGPSTrackerHistoryObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENGPSTrackerHistoryEdit:=TfrmENGPSTrackerHistoryEdit.Create(Application, dsInsert);
    try
      if frmENGPSTrackerHistoryEdit.ShowModal = mrOk then
      begin
        if ENGPSTrackerHistoryObj<>nil then
            //TempENGPSTrackerHistory.add(ENGPSTrackerHistoryObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENGPSTrackerHistoryEdit.Free;
      frmENGPSTrackerHistoryEdit:=nil;
    end;
  finally
    ENGPSTrackerHistoryObj.Free;
  end;
end;


procedure TfrmENGPSTrackerHistoryShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENGPSTrackerHistoryShow.actFilterExecute(Sender: TObject);
begin
{frmENGPSTrackerHistoryFilterEdit:=TfrmENGPSTrackerHistoryFilterEdit.Create(Application, dsInsert);
  try
    ENGPSTrackerHistoryFilterObj := ENGPSTrackerHistoryFilter.Create;
    SetNullIntProps(ENGPSTrackerHistoryFilterObj);
    SetNullXSProps(ENGPSTrackerHistoryFilterObj);

    if frmENGPSTrackerHistoryFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENGPSTrackerHistoryFilter.Create;
      FilterObject := ENGPSTrackerHistoryFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENGPSTrackerHistoryFilterEdit.Free;
    frmENGPSTrackerHistoryFilterEdit:=nil;
  end;}
end;


procedure TfrmENGPSTrackerHistoryShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.