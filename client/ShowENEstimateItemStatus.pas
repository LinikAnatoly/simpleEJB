
unit ShowENEstimateItemStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENEstimateItemStatusController ;


type
  TfrmENEstimateItemStatusShow = class(TChildForm)  
  HTTPRIOENEstimateItemStatus: THTTPRIO;
    ImageList1: TImageList;
    sgENEstimateItemStatus: TAdvStringGrid;
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
procedure sgENEstimateItemStatusTopLeftChanged(Sender: TObject);
procedure sgENEstimateItemStatusDblClick(Sender: TObject);
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
 // ENEstimateItemStatusObj: ENEstimateItemStatus;
 // ENEstimateItemStatusFilterObj: ENEstimateItemStatusFilter;
  
  
implementation

uses Main, EditENEstimateItemStatus, EditENEstimateItemStatusFilter;


{$R *.dfm}

var
  //frmENEstimateItemStatusShow : TfrmENEstimateItemStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENEstimateItemStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Статус строки кошторису'
        );
   

procedure TfrmENEstimateItemStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENEstimateItemStatusShow:=nil;
    inherited;
  end;


procedure TfrmENEstimateItemStatusShow.FormShow(Sender: TObject);
var
  TempENEstimateItemStatus: ENEstimateItemStatusControllerSoapPort;
  i: Integer;
  ENEstimateItemStatusList: ENEstimateItemStatusShortList;
  begin
  SetGridHeaders(ENEstimateItemStatusHeaders, sgENEstimateItemStatus.ColumnHeaders);
  ColCount:=100;
  TempENEstimateItemStatus :=  HTTPRIOENEstimateItemStatus as ENEstimateItemStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENEstimateItemStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENEstimateItemStatusList := TempENEstimateItemStatus.getScrollableFilteredList(ENEstimateItemStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(ENEstimateItemStatusList.list);

  if LastCount > -1 then
     sgENEstimateItemStatus.RowCount:=LastCount+2
  else
     sgENEstimateItemStatus.RowCount:=2;

   with sgENEstimateItemStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENEstimateItemStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENEstimateItemStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENEstimateItemStatusList.list[i].name;
        LastRow:=i+1;
        sgENEstimateItemStatus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENEstimateItemStatus.Row:=1;
end;

procedure TfrmENEstimateItemStatusShow.sgENEstimateItemStatusTopLeftChanged(Sender: TObject);
var
  TempENEstimateItemStatus: ENEstimateItemStatusControllerSoapPort;
  i,CurrentRow: Integer;
  ENEstimateItemStatusList: ENEstimateItemStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENEstimateItemStatus.TopRow + sgENEstimateItemStatus.VisibleRowCount) = ColCount
  then
    begin
      TempENEstimateItemStatus :=  HTTPRIOENEstimateItemStatus as ENEstimateItemStatusControllerSoapPort;
      CurrentRow:=sgENEstimateItemStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENEstimateItemStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENEstimateItemStatusList := TempENEstimateItemStatus.getScrollableFilteredList(ENEstimateItemStatusFilter(FilterObject),ColCount-1, 100);



  sgENEstimateItemStatus.RowCount:=sgENEstimateItemStatus.RowCount+100;
  LastCount:=High(ENEstimateItemStatusList.list);
  with sgENEstimateItemStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENEstimateItemStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENEstimateItemStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENEstimateItemStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENEstimateItemStatus.Row:=CurrentRow-5;
   sgENEstimateItemStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENEstimateItemStatusShow.sgENEstimateItemStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENEstimateItemStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENEstimateItemStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENEstimateItemStatus.RowCount-1 do
   for j:=0 to sgENEstimateItemStatus.ColCount-1 do
     sgENEstimateItemStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENEstimateItemStatusShow.actViewExecute(Sender: TObject);
Var TempENEstimateItemStatus: ENEstimateItemStatusControllerSoapPort;
begin
 TempENEstimateItemStatus := HTTPRIOENEstimateItemStatus as ENEstimateItemStatusControllerSoapPort;
   try
     ENEstimateItemStatusObj := TempENEstimateItemStatus.getObject(StrToInt(sgENEstimateItemStatus.Cells[0,sgENEstimateItemStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENEstimateItemStatusEdit:=TfrmENEstimateItemStatusEdit.Create(Application, dsView);
  try
    frmENEstimateItemStatusEdit.ShowModal;
  finally
    frmENEstimateItemStatusEdit.Free;
    frmENEstimateItemStatusEdit:=nil;
  end;
end;

procedure TfrmENEstimateItemStatusShow.actEditExecute(Sender: TObject);
Var TempENEstimateItemStatus: ENEstimateItemStatusControllerSoapPort;
begin
 TempENEstimateItemStatus := HTTPRIOENEstimateItemStatus as ENEstimateItemStatusControllerSoapPort;
   try
     ENEstimateItemStatusObj := TempENEstimateItemStatus.getObject(StrToInt(sgENEstimateItemStatus.Cells[0,sgENEstimateItemStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENEstimateItemStatusEdit:=TfrmENEstimateItemStatusEdit.Create(Application, dsEdit);
  try
    if frmENEstimateItemStatusEdit.ShowModal= mrOk then
      begin
        //TempENEstimateItemStatus.save(ENEstimateItemStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENEstimateItemStatusEdit.Free;
    frmENEstimateItemStatusEdit:=nil;
  end;
end;

procedure TfrmENEstimateItemStatusShow.actDeleteExecute(Sender: TObject);
Var TempENEstimateItemStatus: ENEstimateItemStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempENEstimateItemStatus := HTTPRIOENEstimateItemStatus as ENEstimateItemStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgENEstimateItemStatus.Cells[0,sgENEstimateItemStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статус строки кошторису(заявлено, оплачено, поставлено і т.д.)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENEstimateItemStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENEstimateItemStatusShow.actInsertExecute(Sender: TObject);
Var TempENEstimateItemStatus: ENEstimateItemStatusControllerSoapPort;
begin
  TempENEstimateItemStatus := HTTPRIOENEstimateItemStatus as ENEstimateItemStatusControllerSoapPort;
  ENEstimateItemStatusObj:=ENEstimateItemStatus.Create;



  try
    frmENEstimateItemStatusEdit:=TfrmENEstimateItemStatusEdit.Create(Application, dsInsert);
    try
      if frmENEstimateItemStatusEdit.ShowModal = mrOk then
      begin
        if ENEstimateItemStatusObj<>nil then
            //TempENEstimateItemStatus.add(ENEstimateItemStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENEstimateItemStatusEdit.Free;
      frmENEstimateItemStatusEdit:=nil;
    end;
  finally
    ENEstimateItemStatusObj.Free;
  end;
end;

procedure TfrmENEstimateItemStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENEstimateItemStatusShow.actFilterExecute(Sender: TObject);
begin
{frmENEstimateItemStatusFilterEdit:=TfrmENEstimateItemStatusFilterEdit.Create(Application, dsEdit);
  try
    ENEstimateItemStatusFilterObj := ENEstimateItemStatusFilter.Create;
    SetNullIntProps(ENEstimateItemStatusFilterObj);
    SetNullXSProps(ENEstimateItemStatusFilterObj);

    if frmENEstimateItemStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENEstimateItemStatusFilter.Create;
      FilterObject := ENEstimateItemStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENEstimateItemStatusFilterEdit.Free;
    frmENEstimateItemStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmENEstimateItemStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.