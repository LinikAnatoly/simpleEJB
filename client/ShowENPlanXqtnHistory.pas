
unit ShowENPlanXqtnHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENPlanXqtnHistoryController, AdvObj ;


type
    TfrmENPlanXqtnHistoryShow = class(TChildForm)  
    HTTPRIOENPlanXqtnHistory: THTTPRIO;
    ImageList1: TImageList;
    sgENPlanXqtnHistory: TAdvStringGrid;
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
    procedure sgENPlanXqtnHistoryTopLeftChanged(Sender: TObject);
    procedure sgENPlanXqtnHistoryDblClick(Sender: TObject);
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
   class function chooseFromList : ENPlanXqtnHistoryShort; stdcall; static;
 end;


var
  frmENPlanXqtnHistoryShow: TfrmENPlanXqtnHistoryShow;
  
  
implementation

uses Main, EditENPlanXqtnHistory, EditENPlanXqtnHistoryFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPlanXqtnHistoryHeaders: array [1..5] of String =
        ( 'Код'
          ,'Дата встановлення відсотку виконання плану'
          ,'код'
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
        );
   
class function TfrmENPlanXqtnHistoryShow.chooseFromList : ENPlanXqtnHistoryShort;
var
  f1 : ENPlanXqtnHistoryFilter;
  frmENPlanXqtnHistoryShow : TfrmENPlanXqtnHistoryShow;
  selected : ENPlanXqtnHistoryShort;
begin
  inherited;
     selected := nil;
     f1 := ENPlanXqtnHistoryFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENPlanXqtnHistoryShow := TfrmENPlanXqtnHistoryShow.Create(Application, fmNormal, f1);
       try
          with frmENPlanXqtnHistoryShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENPlanXqtnHistoryShort(sgENPlanXqtnHistory.Objects[0, sgENPlanXqtnHistory.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENPlanXqtnHistoryShow.Free;
       end;
end;

procedure TfrmENPlanXqtnHistoryShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENPlanXqtnHistoryShow:=nil;
  inherited;
end;


procedure TfrmENPlanXqtnHistoryShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENPlanXqtnHistoryShow.FormShow(Sender: TObject);
var
  TempENPlanXqtnHistory: ENPlanXqtnHistoryControllerSoapPort;
  i: Integer;
  ENPlanXqtnHistoryList: ENPlanXqtnHistoryShortList;
begin
  SetGridHeaders(ENPlanXqtnHistoryHeaders, sgENPlanXqtnHistory.ColumnHeaders);
  ColCount:=100;
  TempENPlanXqtnHistory :=  HTTPRIOENPlanXqtnHistory as ENPlanXqtnHistoryControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanXqtnHistoryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanXqtnHistoryList := TempENPlanXqtnHistory.getScrollableFilteredList(ENPlanXqtnHistoryFilter(FilterObject),0,ColCount);
  LastCount:=High(ENPlanXqtnHistoryList.list);

  if LastCount > -1 then
     sgENPlanXqtnHistory.RowCount:=LastCount+2
  else
     sgENPlanXqtnHistory.RowCount:=2;

   with sgENPlanXqtnHistory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanXqtnHistoryList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPlanXqtnHistoryList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENPlanXqtnHistoryList.list[i].dateGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(ENPlanXqtnHistoryList.list[i].dateGen);
        Objects[0, i+1] := ENPlanXqtnHistoryList.list[i];
        if ENPlanXqtnHistoryList.list[i].executionPercent = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(ENPlanXqtnHistoryList.list[i].executionPercent);
        Objects[0, i+1] := ENPlanXqtnHistoryList.list[i];
        Cells[3,i+1] := ENPlanXqtnHistoryList.list[i].userGen;
        Objects[0, i+1] := ENPlanXqtnHistoryList.list[i];
        if ENPlanXqtnHistoryList.list[i].dateEdit = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(ENPlanXqtnHistoryList.list[i].dateEdit);
        Objects[0, i+1] := ENPlanXqtnHistoryList.list[i];
        LastRow:=i+1;
        sgENPlanXqtnHistory.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENPlanXqtnHistory.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENPlanXqtnHistory.RowCount > selectedRow then
      sgENPlanXqtnHistory.Row := selectedRow
    else
      sgENPlanXqtnHistory.Row := sgENPlanXqtnHistory.RowCount - 1;
    end
    else
      sgENPlanXqtnHistory.Row:=1;   
end;


procedure TfrmENPlanXqtnHistoryShow.sgENPlanXqtnHistoryTopLeftChanged(Sender: TObject);
var
  TempENPlanXqtnHistory: ENPlanXqtnHistoryControllerSoapPort;
  i,CurrentRow: Integer;
  ENPlanXqtnHistoryList: ENPlanXqtnHistoryShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPlanXqtnHistory.TopRow + sgENPlanXqtnHistory.VisibleRowCount) = ColCount
  then
    begin
      TempENPlanXqtnHistory :=  HTTPRIOENPlanXqtnHistory as ENPlanXqtnHistoryControllerSoapPort;
      CurrentRow:=sgENPlanXqtnHistory.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanXqtnHistoryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanXqtnHistoryList := TempENPlanXqtnHistory.getScrollableFilteredList(ENPlanXqtnHistoryFilter(FilterObject),ColCount-1, 100);


  sgENPlanXqtnHistory.RowCount:=sgENPlanXqtnHistory.RowCount+100;
  LastCount:=High(ENPlanXqtnHistoryList.list);
  with sgENPlanXqtnHistory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanXqtnHistoryList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPlanXqtnHistoryList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENPlanXqtnHistoryList.list[i].dateGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := XSDate2String(ENPlanXqtnHistoryList.list[i].dateGen);
        Objects[0, i+CurrentRow] := ENPlanXqtnHistoryList.list[i];
        if ENPlanXqtnHistoryList.list[i].executionPercent = Low(Integer) then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := IntToStr(ENPlanXqtnHistoryList.list[i].executionPercent);
        Objects[0, i+CurrentRow] := ENPlanXqtnHistoryList.list[i];
        Cells[3,i+CurrentRow] := ENPlanXqtnHistoryList.list[i].userGen;
        Objects[0, i+CurrentRow] := ENPlanXqtnHistoryList.list[i];
        if ENPlanXqtnHistoryList.list[i].dateEdit = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDate2String(ENPlanXqtnHistoryList.list[i].dateEdit);
        Objects[0, i+CurrentRow] := ENPlanXqtnHistoryList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPlanXqtnHistory.Row:=CurrentRow-5;
   sgENPlanXqtnHistory.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPlanXqtnHistoryShow.sgENPlanXqtnHistoryDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPlanXqtnHistory,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENPlanXqtnHistoryShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENPlanXqtnHistory.RowCount-1 do
   for j:=0 to sgENPlanXqtnHistory.ColCount-1 do
     sgENPlanXqtnHistory.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENPlanXqtnHistoryShow.actViewExecute(Sender: TObject);
var 
  TempENPlanXqtnHistory: ENPlanXqtnHistoryControllerSoapPort;
begin
  TempENPlanXqtnHistory := HTTPRIOENPlanXqtnHistory as ENPlanXqtnHistoryControllerSoapPort;
  try
    ENPlanXqtnHistoryObj := TempENPlanXqtnHistory.getObject(StrToInt(sgENPlanXqtnHistory.Cells[0, sgENPlanXqtnHistory.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENPlanXqtnHistoryEdit := TfrmENPlanXqtnHistoryEdit.Create(Application, dsView);
  try
    frmENPlanXqtnHistoryEdit.ShowModal;
  finally
    frmENPlanXqtnHistoryEdit.Free;
    frmENPlanXqtnHistoryEdit := nil;
  end;
end;


procedure TfrmENPlanXqtnHistoryShow.actEditExecute(Sender: TObject);
var
  TempENPlanXqtnHistory: ENPlanXqtnHistoryControllerSoapPort;
begin
  TempENPlanXqtnHistory := HTTPRIOENPlanXqtnHistory as ENPlanXqtnHistoryControllerSoapPort;
  try
    ENPlanXqtnHistoryObj := TempENPlanXqtnHistory.getObject(StrToInt(sgENPlanXqtnHistory.Cells[0,sgENPlanXqtnHistory.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENPlanXqtnHistory.Row;
  frmENPlanXqtnHistoryEdit:=TfrmENPlanXqtnHistoryEdit.Create(Application, dsEdit);
  
  try
    if frmENPlanXqtnHistoryEdit.ShowModal= mrOk then
      begin
        //TempENPlanXqtnHistory.save(ENPlanXqtnHistoryObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPlanXqtnHistoryEdit.Free;
    frmENPlanXqtnHistoryEdit:=nil;
  end;

  if sgENPlanXqtnHistory.RowCount > selectedRow then
    sgENPlanXqtnHistory.Row := selectedRow
  else
    sgENPlanXqtnHistory.Row := sgENPlanXqtnHistory.RowCount - 1;

end;


procedure TfrmENPlanXqtnHistoryShow.actDeleteExecute(Sender: TObject);
Var TempENPlanXqtnHistory: ENPlanXqtnHistoryControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPlanXqtnHistory := HTTPRIOENPlanXqtnHistory as ENPlanXqtnHistoryControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPlanXqtnHistory.Cells[0,sgENPlanXqtnHistory.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Історія відсотків виконання плану робіт)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPlanXqtnHistory.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPlanXqtnHistoryShow.actInsertExecute(Sender: TObject);
// Var TempENPlanXqtnHistory: ENPlanXqtnHistoryControllerSoapPort;
begin
  // TempENPlanXqtnHistory := HTTPRIOENPlanXqtnHistory as ENPlanXqtnHistoryControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENPlanXqtnHistoryObj:=ENPlanXqtnHistory.Create;
  SetNullIntProps(ENPlanXqtnHistoryObj);
  SetNullXSProps(ENPlanXqtnHistoryObj);

   //ENPlanXqtnHistoryObj.dateGen:= TXSDate.Create;
   //ENPlanXqtnHistoryObj.dateEdit:= TXSDate.Create;


  try
    frmENPlanXqtnHistoryEdit:=TfrmENPlanXqtnHistoryEdit.Create(Application, dsInsert);
    try
      if frmENPlanXqtnHistoryEdit.ShowModal = mrOk then
      begin
        if ENPlanXqtnHistoryObj<>nil then
            //TempENPlanXqtnHistory.add(ENPlanXqtnHistoryObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPlanXqtnHistoryEdit.Free;
      frmENPlanXqtnHistoryEdit:=nil;
    end;
  finally
    ENPlanXqtnHistoryObj.Free;
  end;
end;


procedure TfrmENPlanXqtnHistoryShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENPlanXqtnHistoryShow.actFilterExecute(Sender: TObject);
begin
{frmENPlanXqtnHistoryFilterEdit:=TfrmENPlanXqtnHistoryFilterEdit.Create(Application, dsInsert);
  try
    ENPlanXqtnHistoryFilterObj := ENPlanXqtnHistoryFilter.Create;
    SetNullIntProps(ENPlanXqtnHistoryFilterObj);
    SetNullXSProps(ENPlanXqtnHistoryFilterObj);

    if frmENPlanXqtnHistoryFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENPlanXqtnHistoryFilter.Create;
      FilterObject := ENPlanXqtnHistoryFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPlanXqtnHistoryFilterEdit.Free;
    frmENPlanXqtnHistoryFilterEdit:=nil;
  end;}
end;


procedure TfrmENPlanXqtnHistoryShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.