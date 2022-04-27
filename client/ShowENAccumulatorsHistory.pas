
unit ShowENAccumulatorsHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENAccumulatorsHistoryController ;


type
  TfrmENAccumulatorsHistoryShow = class(TChildForm)  
  HTTPRIOENAccumulatorsHistory: THTTPRIO;
    ImageList1: TImageList;
    sgENAccumulatorsHistory: TAdvStringGrid;
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
procedure sgENAccumulatorsHistoryTopLeftChanged(Sender: TObject);
procedure sgENAccumulatorsHistoryDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENAccumulatorsHistoryObj: ENAccumulatorsHistory;
 // ENAccumulatorsHistoryFilterObj: ENAccumulatorsHistoryFilter;
  
  
implementation

uses Main, EditENAccumulatorsHistory, EditENAccumulatorsHistoryFilter;


{$R *.dfm}

var
  //frmENAccumulatorsHistoryShow : TfrmENAccumulatorsHistoryShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENAccumulatorsHistoryHeaders: array [1..5] of String =
        ( 'Код'
          ,'дата установки'
          ,'дата снятия'
          ,'пройдено на данном автомобиле'
          ,'причина выхода из эксплуатации'
        );
   

procedure TfrmENAccumulatorsHistoryShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENAccumulatorsHistoryShow:=nil;
    inherited;
  end;


procedure TfrmENAccumulatorsHistoryShow.FormShow(Sender: TObject);
var
  TempENAccumulatorsHistory: ENAccumulatorsHistoryControllerSoapPort;
  i: Integer;
  ENAccumulatorsHistoryList: ENAccumulatorsHistoryShortList;
  begin
  SetGridHeaders(ENAccumulatorsHistoryHeaders, sgENAccumulatorsHistory.ColumnHeaders);
  ColCount:=100;
  TempENAccumulatorsHistory :=  HTTPRIOENAccumulatorsHistory as ENAccumulatorsHistoryControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENAccumulatorsHistoryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAccumulatorsHistoryList := TempENAccumulatorsHistory.getScrollableFilteredList(ENAccumulatorsHistoryFilter(FilterObject),0,ColCount);


  LastCount:=High(ENAccumulatorsHistoryList.list);

  if LastCount > -1 then
     sgENAccumulatorsHistory.RowCount:=LastCount+2
  else
     sgENAccumulatorsHistory.RowCount:=2;

   with sgENAccumulatorsHistory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAccumulatorsHistoryList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENAccumulatorsHistoryList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENAccumulatorsHistoryList.list[i].installDate = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(ENAccumulatorsHistoryList.list[i].installDate);
        if ENAccumulatorsHistoryList.list[i].uninstallDate = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENAccumulatorsHistoryList.list[i].uninstallDate);
        if ENAccumulatorsHistoryList.list[i].distance = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENAccumulatorsHistoryList.list[i].distance.DecimalString;
        Cells[4,i+1] := ENAccumulatorsHistoryList.list[i].replacementReason;
        LastRow:=i+1;
        sgENAccumulatorsHistory.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENAccumulatorsHistory.Row:=1;
end;

procedure TfrmENAccumulatorsHistoryShow.sgENAccumulatorsHistoryTopLeftChanged(Sender: TObject);
var
  TempENAccumulatorsHistory: ENAccumulatorsHistoryControllerSoapPort;
  i,CurrentRow: Integer;
  ENAccumulatorsHistoryList: ENAccumulatorsHistoryShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENAccumulatorsHistory.TopRow + sgENAccumulatorsHistory.VisibleRowCount) = ColCount
  then
    begin
      TempENAccumulatorsHistory :=  HTTPRIOENAccumulatorsHistory as ENAccumulatorsHistoryControllerSoapPort;
      CurrentRow:=sgENAccumulatorsHistory.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENAccumulatorsHistoryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAccumulatorsHistoryList := TempENAccumulatorsHistory.getScrollableFilteredList(ENAccumulatorsHistoryFilter(FilterObject),ColCount-1, 100);



  sgENAccumulatorsHistory.RowCount:=sgENAccumulatorsHistory.RowCount+100;
  LastCount:=High(ENAccumulatorsHistoryList.list);
  with sgENAccumulatorsHistory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAccumulatorsHistoryList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENAccumulatorsHistoryList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENAccumulatorsHistoryList.list[i].installDate = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := XSDate2String(ENAccumulatorsHistoryList.list[i].installDate);
        if ENAccumulatorsHistoryList.list[i].uninstallDate = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENAccumulatorsHistoryList.list[i].uninstallDate);
        if ENAccumulatorsHistoryList.list[i].distance = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := ENAccumulatorsHistoryList.list[i].distance.DecimalString;
        Cells[4,i+CurrentRow] := ENAccumulatorsHistoryList.list[i].replacementReason;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENAccumulatorsHistory.Row:=CurrentRow-5;
   sgENAccumulatorsHistory.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENAccumulatorsHistoryShow.sgENAccumulatorsHistoryDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENAccumulatorsHistory,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENAccumulatorsHistoryShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENAccumulatorsHistory.RowCount-1 do
   for j:=0 to sgENAccumulatorsHistory.ColCount-1 do
     sgENAccumulatorsHistory.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENAccumulatorsHistoryShow.actViewExecute(Sender: TObject);
Var TempENAccumulatorsHistory: ENAccumulatorsHistoryControllerSoapPort;
begin
 TempENAccumulatorsHistory := HTTPRIOENAccumulatorsHistory as ENAccumulatorsHistoryControllerSoapPort;
   try
     ENAccumulatorsHistoryObj := TempENAccumulatorsHistory.getObject(StrToInt(sgENAccumulatorsHistory.Cells[0,sgENAccumulatorsHistory.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAccumulatorsHistoryEdit:=TfrmENAccumulatorsHistoryEdit.Create(Application, dsView);
  try
    frmENAccumulatorsHistoryEdit.ShowModal;
  finally
    frmENAccumulatorsHistoryEdit.Free;
    frmENAccumulatorsHistoryEdit:=nil;
  end;
end;

procedure TfrmENAccumulatorsHistoryShow.actEditExecute(Sender: TObject);
Var TempENAccumulatorsHistory: ENAccumulatorsHistoryControllerSoapPort;
begin
 TempENAccumulatorsHistory := HTTPRIOENAccumulatorsHistory as ENAccumulatorsHistoryControllerSoapPort;
   try
     ENAccumulatorsHistoryObj := TempENAccumulatorsHistory.getObject(StrToInt(sgENAccumulatorsHistory.Cells[0,sgENAccumulatorsHistory.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAccumulatorsHistoryEdit:=TfrmENAccumulatorsHistoryEdit.Create(Application, dsEdit);
  try
    if frmENAccumulatorsHistoryEdit.ShowModal= mrOk then
      begin
        //TempENAccumulatorsHistory.save(ENAccumulatorsHistoryObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENAccumulatorsHistoryEdit.Free;
    frmENAccumulatorsHistoryEdit:=nil;
  end;
end;

procedure TfrmENAccumulatorsHistoryShow.actDeleteExecute(Sender: TObject);
Var TempENAccumulatorsHistory: ENAccumulatorsHistoryControllerSoapPort;
  ObjCode: Integer;
begin
 TempENAccumulatorsHistory := HTTPRIOENAccumulatorsHistory as ENAccumulatorsHistoryControllerSoapPort;
   try
     ObjCode := StrToInt(sgENAccumulatorsHistory.Cells[0,sgENAccumulatorsHistory.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (История Аккумулятора) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENAccumulatorsHistory.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENAccumulatorsHistoryShow.actInsertExecute(Sender: TObject);
Var TempENAccumulatorsHistory: ENAccumulatorsHistoryControllerSoapPort;
begin
  TempENAccumulatorsHistory := HTTPRIOENAccumulatorsHistory as ENAccumulatorsHistoryControllerSoapPort;
  ENAccumulatorsHistoryObj:=ENAccumulatorsHistory.Create;

   //ENAccumulatorsHistoryObj.installDate:= TXSDate.Create;
   //ENAccumulatorsHistoryObj.uninstallDate:= TXSDate.Create;
   //ENAccumulatorsHistoryObj.distance:= TXSDecimal.Create;


  try
    frmENAccumulatorsHistoryEdit:=TfrmENAccumulatorsHistoryEdit.Create(Application, dsInsert);
    try
      if frmENAccumulatorsHistoryEdit.ShowModal = mrOk then
      begin
        if ENAccumulatorsHistoryObj<>nil then
            //TempENAccumulatorsHistory.add(ENAccumulatorsHistoryObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENAccumulatorsHistoryEdit.Free;
      frmENAccumulatorsHistoryEdit:=nil;
    end;
  finally
    ENAccumulatorsHistoryObj.Free;
  end;
end;

procedure TfrmENAccumulatorsHistoryShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENAccumulatorsHistoryShow.actFilterExecute(Sender: TObject);
begin
{frmENAccumulatorsHistoryFilterEdit:=TfrmENAccumulatorsHistoryFilterEdit.Create(Application, dsInsert);
  try
    ENAccumulatorsHistoryFilterObj := ENAccumulatorsHistoryFilter.Create;
    SetNullIntProps(ENAccumulatorsHistoryFilterObj);
    SetNullXSProps(ENAccumulatorsHistoryFilterObj);

    if frmENAccumulatorsHistoryFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENAccumulatorsHistoryFilter.Create;
      FilterObject := ENAccumulatorsHistoryFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENAccumulatorsHistoryFilterEdit.Free;
    frmENAccumulatorsHistoryFilterEdit:=nil;
  end;}
end;

procedure TfrmENAccumulatorsHistoryShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.