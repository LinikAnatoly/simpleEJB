
unit ShowENAutoTiresHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENAutoTiresHistoryController ;


type
  TfrmENAutoTiresHistoryShow = class(TChildForm)  
  HTTPRIOENAutoTiresHistory: THTTPRIO;
    ImageList1: TImageList;
    sgENAutoTiresHistory: TAdvStringGrid;
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
procedure sgENAutoTiresHistoryTopLeftChanged(Sender: TObject);
procedure sgENAutoTiresHistoryDblClick(Sender: TObject);
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
 // ENAutoTiresHistoryObj: ENAutoTiresHistory;
 // ENAutoTiresHistoryFilterObj: ENAutoTiresHistoryFilter;
  
  
implementation

uses Main, EditENAutoTiresHistory, EditENAutoTiresHistoryFilter;


{$R *.dfm}

var
  //frmENAutoTiresHistoryShow : TfrmENAutoTiresHistoryShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENAutoTiresHistoryHeaders: array [1..5] of String =
        ( 'Код'
          ,'дата монтажа'
          ,'дата демонтажа'
          ,'пробег'
          ,'причина выхода из эксплуатации'
        );
   

procedure TfrmENAutoTiresHistoryShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENAutoTiresHistoryShow:=nil;
    inherited;
  end;


procedure TfrmENAutoTiresHistoryShow.FormShow(Sender: TObject);
var
  TempENAutoTiresHistory: ENAutoTiresHistoryControllerSoapPort;
  i: Integer;
  ENAutoTiresHistoryList: ENAutoTiresHistoryShortList;
  begin
  SetGridHeaders(ENAutoTiresHistoryHeaders, sgENAutoTiresHistory.ColumnHeaders);
  ColCount:=100;
  TempENAutoTiresHistory :=  HTTPRIOENAutoTiresHistory as ENAutoTiresHistoryControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENAutoTiresHistoryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAutoTiresHistoryList := TempENAutoTiresHistory.getScrollableFilteredList(ENAutoTiresHistoryFilter(FilterObject),0,ColCount);


  LastCount:=High(ENAutoTiresHistoryList.list);

  if LastCount > -1 then
     sgENAutoTiresHistory.RowCount:=LastCount+2
  else
     sgENAutoTiresHistory.RowCount:=2;

   with sgENAutoTiresHistory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAutoTiresHistoryList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENAutoTiresHistoryList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENAutoTiresHistoryList.list[i].installDate = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(ENAutoTiresHistoryList.list[i].installDate);
        if ENAutoTiresHistoryList.list[i].uninstallDate = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENAutoTiresHistoryList.list[i].uninstallDate);
        if ENAutoTiresHistoryList.list[i].distance = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENAutoTiresHistoryList.list[i].distance.DecimalString;
        Cells[4,i+1] := ENAutoTiresHistoryList.list[i].replacementReason;
        LastRow:=i+1;
        sgENAutoTiresHistory.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENAutoTiresHistory.Row:=1;
end;

procedure TfrmENAutoTiresHistoryShow.sgENAutoTiresHistoryTopLeftChanged(Sender: TObject);
var
  TempENAutoTiresHistory: ENAutoTiresHistoryControllerSoapPort;
  i,CurrentRow: Integer;
  ENAutoTiresHistoryList: ENAutoTiresHistoryShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENAutoTiresHistory.TopRow + sgENAutoTiresHistory.VisibleRowCount) = ColCount
  then
    begin
      TempENAutoTiresHistory :=  HTTPRIOENAutoTiresHistory as ENAutoTiresHistoryControllerSoapPort;
      CurrentRow:=sgENAutoTiresHistory.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENAutoTiresHistoryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAutoTiresHistoryList := TempENAutoTiresHistory.getScrollableFilteredList(ENAutoTiresHistoryFilter(FilterObject),ColCount-1, 100);



  sgENAutoTiresHistory.RowCount:=sgENAutoTiresHistory.RowCount+100;
  LastCount:=High(ENAutoTiresHistoryList.list);
  with sgENAutoTiresHistory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAutoTiresHistoryList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENAutoTiresHistoryList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENAutoTiresHistoryList.list[i].installDate = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := XSDate2String(ENAutoTiresHistoryList.list[i].installDate);
        if ENAutoTiresHistoryList.list[i].uninstallDate = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENAutoTiresHistoryList.list[i].uninstallDate);
        if ENAutoTiresHistoryList.list[i].distance = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := ENAutoTiresHistoryList.list[i].distance.DecimalString;
        Cells[4,i+CurrentRow] := ENAutoTiresHistoryList.list[i].replacementReason;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENAutoTiresHistory.Row:=CurrentRow-5;
   sgENAutoTiresHistory.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENAutoTiresHistoryShow.sgENAutoTiresHistoryDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENAutoTiresHistory,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENAutoTiresHistoryShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENAutoTiresHistory.RowCount-1 do
   for j:=0 to sgENAutoTiresHistory.ColCount-1 do
     sgENAutoTiresHistory.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENAutoTiresHistoryShow.actViewExecute(Sender: TObject);
Var TempENAutoTiresHistory: ENAutoTiresHistoryControllerSoapPort;
begin
 TempENAutoTiresHistory := HTTPRIOENAutoTiresHistory as ENAutoTiresHistoryControllerSoapPort;
   try
     ENAutoTiresHistoryObj := TempENAutoTiresHistory.getObject(StrToInt(sgENAutoTiresHistory.Cells[0,sgENAutoTiresHistory.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAutoTiresHistoryEdit:=TfrmENAutoTiresHistoryEdit.Create(Application, dsView);
  try
    frmENAutoTiresHistoryEdit.ShowModal;
  finally
    frmENAutoTiresHistoryEdit.Free;
    frmENAutoTiresHistoryEdit:=nil;
  end;
end;

procedure TfrmENAutoTiresHistoryShow.actEditExecute(Sender: TObject);
Var TempENAutoTiresHistory: ENAutoTiresHistoryControllerSoapPort;
begin
 TempENAutoTiresHistory := HTTPRIOENAutoTiresHistory as ENAutoTiresHistoryControllerSoapPort;
   try
     ENAutoTiresHistoryObj := TempENAutoTiresHistory.getObject(StrToInt(sgENAutoTiresHistory.Cells[0,sgENAutoTiresHistory.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAutoTiresHistoryEdit:=TfrmENAutoTiresHistoryEdit.Create(Application, dsEdit);
  try
    if frmENAutoTiresHistoryEdit.ShowModal= mrOk then
      begin
        //TempENAutoTiresHistory.save(ENAutoTiresHistoryObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENAutoTiresHistoryEdit.Free;
    frmENAutoTiresHistoryEdit:=nil;
  end;
end;

procedure TfrmENAutoTiresHistoryShow.actDeleteExecute(Sender: TObject);
Var TempENAutoTiresHistory: ENAutoTiresHistoryControllerSoapPort;
  ObjCode: Integer;
begin
 TempENAutoTiresHistory := HTTPRIOENAutoTiresHistory as ENAutoTiresHistoryControllerSoapPort;
   try
     ObjCode := StrToInt(sgENAutoTiresHistory.Cells[0,sgENAutoTiresHistory.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (История Автопокрышки) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENAutoTiresHistory.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENAutoTiresHistoryShow.actInsertExecute(Sender: TObject);
Var TempENAutoTiresHistory: ENAutoTiresHistoryControllerSoapPort;
begin
  TempENAutoTiresHistory := HTTPRIOENAutoTiresHistory as ENAutoTiresHistoryControllerSoapPort;
  ENAutoTiresHistoryObj:=ENAutoTiresHistory.Create;

   //ENAutoTiresHistoryObj.installDate:= TXSDate.Create;
   //ENAutoTiresHistoryObj.uninstallDate:= TXSDate.Create;
   //ENAutoTiresHistoryObj.distance:= TXSDecimal.Create;


  try
    frmENAutoTiresHistoryEdit:=TfrmENAutoTiresHistoryEdit.Create(Application, dsInsert);
    try
      if frmENAutoTiresHistoryEdit.ShowModal = mrOk then
      begin
        if ENAutoTiresHistoryObj<>nil then
            //TempENAutoTiresHistory.add(ENAutoTiresHistoryObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENAutoTiresHistoryEdit.Free;
      frmENAutoTiresHistoryEdit:=nil;
    end;
  finally
    ENAutoTiresHistoryObj.Free;
  end;
end;

procedure TfrmENAutoTiresHistoryShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENAutoTiresHistoryShow.actFilterExecute(Sender: TObject);
begin
{frmENAutoTiresHistoryFilterEdit:=TfrmENAutoTiresHistoryFilterEdit.Create(Application, dsInsert);
  try
    ENAutoTiresHistoryFilterObj := ENAutoTiresHistoryFilter.Create;
    SetNullIntProps(ENAutoTiresHistoryFilterObj);
    SetNullXSProps(ENAutoTiresHistoryFilterObj);

    if frmENAutoTiresHistoryFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENAutoTiresHistoryFilter.Create;
      FilterObject := ENAutoTiresHistoryFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENAutoTiresHistoryFilterEdit.Free;
    frmENAutoTiresHistoryFilterEdit:=nil;
  end;}
end;

procedure TfrmENAutoTiresHistoryShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.