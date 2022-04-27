
unit ShowENTransportOrderStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTransportOrderStatusController, AdvObj ;


type
  TfrmENTransportOrderStatusShow = class(TChildForm)  
  HTTPRIOENTransportOrderStatus: THTTPRIO;
    ImageList1: TImageList;
    sgENTransportOrderStatus: TAdvStringGrid;
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
procedure sgENTransportOrderStatusTopLeftChanged(Sender: TObject);
procedure sgENTransportOrderStatusDblClick(Sender: TObject);
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

var
 frmENTransportOrderStatusShow : TfrmENTransportOrderStatusShow;
 // ENTransportOrderStatusObj: ENTransportOrderStatus;
 // ENTransportOrderStatusFilterObj: ENTransportOrderStatusFilter;
  
  
implementation

uses Main, EditENTransportOrderStatus, EditENTransportOrderStatusFilter;


{$R *.dfm}

var
  //frmENTransportOrderStatusShow : TfrmENTransportOrderStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTransportOrderStatusHeaders: array [1..1] of String =
        ( 'Код'
        );
   

procedure TfrmENTransportOrderStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTransportOrderStatusShow:=nil;
    inherited;
  end;


procedure TfrmENTransportOrderStatusShow.FormShow(Sender: TObject);
var
  TempENTransportOrderStatus: ENTransportOrderStatusControllerSoapPort;
  i: Integer;
  ENTransportOrderStatusList: ENTransportOrderStatusShortList;
  begin
  SetGridHeaders(ENTransportOrderStatusHeaders, sgENTransportOrderStatus.ColumnHeaders);
  ColCount:=100;
  TempENTransportOrderStatus :=  HTTPRIOENTransportOrderStatus as ENTransportOrderStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTransportOrderStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransportOrderStatusList := TempENTransportOrderStatus.getScrollableFilteredList(ENTransportOrderStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTransportOrderStatusList.list);

  if LastCount > -1 then
     sgENTransportOrderStatus.RowCount:=LastCount+2
  else
     sgENTransportOrderStatus.RowCount:=2;

   with sgENTransportOrderStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransportOrderStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTransportOrderStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        LastRow:=i+1;
        sgENTransportOrderStatus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTransportOrderStatus.Row:=1;
end;

procedure TfrmENTransportOrderStatusShow.sgENTransportOrderStatusTopLeftChanged(Sender: TObject);
var
  TempENTransportOrderStatus: ENTransportOrderStatusControllerSoapPort;
  i,CurrentRow: Integer;
  ENTransportOrderStatusList: ENTransportOrderStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTransportOrderStatus.TopRow + sgENTransportOrderStatus.VisibleRowCount) = ColCount
  then
    begin
      TempENTransportOrderStatus :=  HTTPRIOENTransportOrderStatus as ENTransportOrderStatusControllerSoapPort;
      CurrentRow:=sgENTransportOrderStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTransportOrderStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransportOrderStatusList := TempENTransportOrderStatus.getScrollableFilteredList(ENTransportOrderStatusFilter(FilterObject),ColCount-1, 100);



  sgENTransportOrderStatus.RowCount:=sgENTransportOrderStatus.RowCount+100;
  LastCount:=High(ENTransportOrderStatusList.list);
  with sgENTransportOrderStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransportOrderStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTransportOrderStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTransportOrderStatus.Row:=CurrentRow-5;
   sgENTransportOrderStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTransportOrderStatusShow.sgENTransportOrderStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTransportOrderStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTransportOrderStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTransportOrderStatus.RowCount-1 do
   for j:=0 to sgENTransportOrderStatus.ColCount-1 do
     sgENTransportOrderStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTransportOrderStatusShow.actViewExecute(Sender: TObject);
Var TempENTransportOrderStatus: ENTransportOrderStatusControllerSoapPort;
begin
 TempENTransportOrderStatus := HTTPRIOENTransportOrderStatus as ENTransportOrderStatusControllerSoapPort;
   try
     ENTransportOrderStatusObj := TempENTransportOrderStatus.getObject(StrToInt(sgENTransportOrderStatus.Cells[0,sgENTransportOrderStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransportOrderStatusEdit:=TfrmENTransportOrderStatusEdit.Create(Application, dsView);
  try
    frmENTransportOrderStatusEdit.ShowModal;
  finally
    frmENTransportOrderStatusEdit.Free;
    frmENTransportOrderStatusEdit:=nil;
  end;
end;

procedure TfrmENTransportOrderStatusShow.actEditExecute(Sender: TObject);
Var TempENTransportOrderStatus: ENTransportOrderStatusControllerSoapPort;
begin
 TempENTransportOrderStatus := HTTPRIOENTransportOrderStatus as ENTransportOrderStatusControllerSoapPort;
   try
     ENTransportOrderStatusObj := TempENTransportOrderStatus.getObject(StrToInt(sgENTransportOrderStatus.Cells[0,sgENTransportOrderStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransportOrderStatusEdit:=TfrmENTransportOrderStatusEdit.Create(Application, dsEdit);
  try
    if frmENTransportOrderStatusEdit.ShowModal= mrOk then
      begin
        //TempENTransportOrderStatus.save(ENTransportOrderStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTransportOrderStatusEdit.Free;
    frmENTransportOrderStatusEdit:=nil;
  end;
end;

procedure TfrmENTransportOrderStatusShow.actDeleteExecute(Sender: TObject);
Var TempENTransportOrderStatus: ENTransportOrderStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTransportOrderStatus := HTTPRIOENTransportOrderStatus as ENTransportOrderStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTransportOrderStatus.Cells[0,sgENTransportOrderStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статус заявки на транспорт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTransportOrderStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTransportOrderStatusShow.actInsertExecute(Sender: TObject);
Var TempENTransportOrderStatus: ENTransportOrderStatusControllerSoapPort;
begin
  TempENTransportOrderStatus := HTTPRIOENTransportOrderStatus as ENTransportOrderStatusControllerSoapPort;
  ENTransportOrderStatusObj:=ENTransportOrderStatus.Create;



  try
    frmENTransportOrderStatusEdit:=TfrmENTransportOrderStatusEdit.Create(Application, dsInsert);
    try
      if frmENTransportOrderStatusEdit.ShowModal = mrOk then
      begin
        if ENTransportOrderStatusObj<>nil then
            //TempENTransportOrderStatus.add(ENTransportOrderStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTransportOrderStatusEdit.Free;
      frmENTransportOrderStatusEdit:=nil;
    end;
  finally
    ENTransportOrderStatusObj.Free;
  end;
end;

procedure TfrmENTransportOrderStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTransportOrderStatusShow.actFilterExecute(Sender: TObject);
begin
{frmENTransportOrderStatusFilterEdit:=TfrmENTransportOrderStatusFilterEdit.Create(Application, dsInsert);
  try
    ENTransportOrderStatusFilterObj := ENTransportOrderStatusFilter.Create;
    SetNullIntProps(ENTransportOrderStatusFilterObj);
    SetNullXSProps(ENTransportOrderStatusFilterObj);

    if frmENTransportOrderStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTransportOrderStatusFilter.Create;
      FilterObject := ENTransportOrderStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTransportOrderStatusFilterEdit.Free;
    frmENTransportOrderStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmENTransportOrderStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.