
unit ShowENEstimateItemStatusHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENEstimateItemStatusHistoryController ;


type
  TfrmENEstimateItemStatusHistoryShow = class(TChildForm)  
  HTTPRIOENEstimateItemStatusHistory: THTTPRIO;
    ImageList1: TImageList;
    sgENEstimateItemStatusHistory: TAdvStringGrid;
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
procedure sgENEstimateItemStatusHistoryTopLeftChanged(Sender: TObject);
procedure sgENEstimateItemStatusHistoryDblClick(Sender: TObject);
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
 // ENEstimateItemStatusHistoryObj: ENEstimateItemStatusHistory;
 // ENEstimateItemStatusHistoryFilterObj: ENEstimateItemStatusHistoryFilter;
  
  
implementation

uses Main, EditENEstimateItemStatusHistory, EditENEstimateItemStatusHistoryFilter;


{$R *.dfm}

var
  //frmENEstimateItemStatusHistoryShow : TfrmENEstimateItemStatusHistoryShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENEstimateItemStatusHistoryHeaders: array [1..3] of String =
        ( 'Код'
          ,'признак последнего состояния'
          ,'дата последнего изменения'
        );
   

procedure TfrmENEstimateItemStatusHistoryShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENEstimateItemStatusHistoryShow:=nil;
    inherited;
  end;


procedure TfrmENEstimateItemStatusHistoryShow.FormShow(Sender: TObject);
var
  TempENEstimateItemStatusHistory: ENEstimateItemStatusHistoryControllerSoapPort;
  i: Integer;
  ENEstimateItemStatusHistoryList: ENEstimateItemStatusHistoryShortList;
  begin
  SetGridHeaders(ENEstimateItemStatusHistoryHeaders, sgENEstimateItemStatusHistory.ColumnHeaders);
  ColCount:=100;
  TempENEstimateItemStatusHistory :=  HTTPRIOENEstimateItemStatusHistory as ENEstimateItemStatusHistoryControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENEstimateItemStatusHistoryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENEstimateItemStatusHistoryList := TempENEstimateItemStatusHistory.getScrollableFilteredList(ENEstimateItemStatusHistoryFilter(FilterObject),0,ColCount);


  LastCount:=High(ENEstimateItemStatusHistoryList.list);

  if LastCount > -1 then
     sgENEstimateItemStatusHistory.RowCount:=LastCount+2
  else
     sgENEstimateItemStatusHistory.RowCount:=2;

   with sgENEstimateItemStatusHistory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENEstimateItemStatusHistoryList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENEstimateItemStatusHistoryList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENEstimateItemStatusHistoryList.list[i].isLast = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(ENEstimateItemStatusHistoryList.list[i].isLast);
        if ENEstimateItemStatusHistoryList.list[i].dateEdit = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDateTimeWithDate2String(ENEstimateItemStatusHistoryList.list[i].dateEdit);
        LastRow:=i+1;
        sgENEstimateItemStatusHistory.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENEstimateItemStatusHistory.Row:=1;
end;

procedure TfrmENEstimateItemStatusHistoryShow.sgENEstimateItemStatusHistoryTopLeftChanged(Sender: TObject);
var
  TempENEstimateItemStatusHistory: ENEstimateItemStatusHistoryControllerSoapPort;
  i,CurrentRow: Integer;
  ENEstimateItemStatusHistoryList: ENEstimateItemStatusHistoryShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENEstimateItemStatusHistory.TopRow + sgENEstimateItemStatusHistory.VisibleRowCount) = ColCount
  then
    begin
      TempENEstimateItemStatusHistory :=  HTTPRIOENEstimateItemStatusHistory as ENEstimateItemStatusHistoryControllerSoapPort;
      CurrentRow:=sgENEstimateItemStatusHistory.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENEstimateItemStatusHistoryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENEstimateItemStatusHistoryList := TempENEstimateItemStatusHistory.getScrollableFilteredList(ENEstimateItemStatusHistoryFilter(FilterObject),ColCount-1, 100);



  sgENEstimateItemStatusHistory.RowCount:=sgENEstimateItemStatusHistory.RowCount+100;
  LastCount:=High(ENEstimateItemStatusHistoryList.list);
  with sgENEstimateItemStatusHistory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENEstimateItemStatusHistoryList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENEstimateItemStatusHistoryList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENEstimateItemStatusHistoryList.list[i].isLast = Low(Integer) then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := IntToStr(ENEstimateItemStatusHistoryList.list[i].isLast);
        if ENEstimateItemStatusHistoryList.list[i].dateEdit = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDateTimeWithDate2String(ENEstimateItemStatusHistoryList.list[i].dateEdit);		  
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENEstimateItemStatusHistory.Row:=CurrentRow-5;
   sgENEstimateItemStatusHistory.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENEstimateItemStatusHistoryShow.sgENEstimateItemStatusHistoryDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENEstimateItemStatusHistory,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENEstimateItemStatusHistoryShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENEstimateItemStatusHistory.RowCount-1 do
   for j:=0 to sgENEstimateItemStatusHistory.ColCount-1 do
     sgENEstimateItemStatusHistory.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENEstimateItemStatusHistoryShow.actViewExecute(Sender: TObject);
Var TempENEstimateItemStatusHistory: ENEstimateItemStatusHistoryControllerSoapPort;
begin
 TempENEstimateItemStatusHistory := HTTPRIOENEstimateItemStatusHistory as ENEstimateItemStatusHistoryControllerSoapPort;
   try
     ENEstimateItemStatusHistoryObj := TempENEstimateItemStatusHistory.getObject(StrToInt(sgENEstimateItemStatusHistory.Cells[0,sgENEstimateItemStatusHistory.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENEstimateItemStatusHistoryEdit:=TfrmENEstimateItemStatusHistoryEdit.Create(Application, dsView);
  try
    frmENEstimateItemStatusHistoryEdit.ShowModal;
  finally
    frmENEstimateItemStatusHistoryEdit.Free;
    frmENEstimateItemStatusHistoryEdit:=nil;
  end;
end;

procedure TfrmENEstimateItemStatusHistoryShow.actEditExecute(Sender: TObject);
Var TempENEstimateItemStatusHistory: ENEstimateItemStatusHistoryControllerSoapPort;
begin
 TempENEstimateItemStatusHistory := HTTPRIOENEstimateItemStatusHistory as ENEstimateItemStatusHistoryControllerSoapPort;
   try
     ENEstimateItemStatusHistoryObj := TempENEstimateItemStatusHistory.getObject(StrToInt(sgENEstimateItemStatusHistory.Cells[0,sgENEstimateItemStatusHistory.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENEstimateItemStatusHistoryEdit:=TfrmENEstimateItemStatusHistoryEdit.Create(Application, dsEdit);
  try
    if frmENEstimateItemStatusHistoryEdit.ShowModal= mrOk then
      begin
        //TempENEstimateItemStatusHistory.save(ENEstimateItemStatusHistoryObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENEstimateItemStatusHistoryEdit.Free;
    frmENEstimateItemStatusHistoryEdit:=nil;
  end;
end;

procedure TfrmENEstimateItemStatusHistoryShow.actDeleteExecute(Sender: TObject);
Var TempENEstimateItemStatusHistory: ENEstimateItemStatusHistoryControllerSoapPort;
  ObjCode: Integer;
begin
 TempENEstimateItemStatusHistory := HTTPRIOENEstimateItemStatusHistory as ENEstimateItemStatusHistoryControllerSoapPort;
   try
     ObjCode := StrToInt(sgENEstimateItemStatusHistory.Cells[0,sgENEstimateItemStatusHistory.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Історія статусів матеріалів) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENEstimateItemStatusHistory.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENEstimateItemStatusHistoryShow.actInsertExecute(Sender: TObject);
Var TempENEstimateItemStatusHistory: ENEstimateItemStatusHistoryControllerSoapPort;
begin
  TempENEstimateItemStatusHistory := HTTPRIOENEstimateItemStatusHistory as ENEstimateItemStatusHistoryControllerSoapPort;
  ENEstimateItemStatusHistoryObj:=ENEstimateItemStatusHistory.Create;

   ENEstimateItemStatusHistoryObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENEstimateItemStatusHistoryEdit:=TfrmENEstimateItemStatusHistoryEdit.Create(Application, dsInsert);
    try
      if frmENEstimateItemStatusHistoryEdit.ShowModal = mrOk then
      begin
        if ENEstimateItemStatusHistoryObj<>nil then
            //TempENEstimateItemStatusHistory.add(ENEstimateItemStatusHistoryObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENEstimateItemStatusHistoryEdit.Free;
      frmENEstimateItemStatusHistoryEdit:=nil;
    end;
  finally
    ENEstimateItemStatusHistoryObj.Free;
  end;
end;

procedure TfrmENEstimateItemStatusHistoryShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENEstimateItemStatusHistoryShow.actFilterExecute(Sender: TObject);
begin
{frmENEstimateItemStatusHistoryFilterEdit:=TfrmENEstimateItemStatusHistoryFilterEdit.Create(Application, dsEdit);
  try
    ENEstimateItemStatusHistoryFilterObj := ENEstimateItemStatusHistoryFilter.Create;
    SetNullIntProps(ENEstimateItemStatusHistoryFilterObj);
    SetNullXSProps(ENEstimateItemStatusHistoryFilterObj);

    if frmENEstimateItemStatusHistoryFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENEstimateItemStatusHistoryFilter.Create;
      FilterObject := ENEstimateItemStatusHistoryFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENEstimateItemStatusHistoryFilterEdit.Free;
    frmENEstimateItemStatusHistoryFilterEdit:=nil;
  end;}
end;

procedure TfrmENEstimateItemStatusHistoryShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.