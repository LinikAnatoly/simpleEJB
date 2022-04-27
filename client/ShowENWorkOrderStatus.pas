
unit ShowENWorkOrderStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENWorkOrderStatusController, AdvObj ;


type
  TfrmENWorkOrderStatusShow = class(TChildForm)  
  HTTPRIOENWorkOrderStatus: THTTPRIO;
    ImageList1: TImageList;
    sgENWorkOrderStatus: TAdvStringGrid;
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
procedure sgENWorkOrderStatusTopLeftChanged(Sender: TObject);
procedure sgENWorkOrderStatusDblClick(Sender: TObject);
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
 frmENWorkOrderStatusShow : TfrmENWorkOrderStatusShow;
 // ENWorkOrderStatusObj: ENWorkOrderStatus;
 // ENWorkOrderStatusFilterObj: ENWorkOrderStatusFilter;
  
  
implementation

uses Main, EditENWorkOrderStatus, EditENWorkOrderStatusFilter;


{$R *.dfm}

var
  //frmENWorkOrderStatusShow : TfrmENWorkOrderStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENWorkOrderStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Статус наряд завдання'
        );
   

procedure TfrmENWorkOrderStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENWorkOrderStatusShow:=nil;
    inherited;
  end;


procedure TfrmENWorkOrderStatusShow.FormShow(Sender: TObject);
var
  TempENWorkOrderStatus: ENWorkOrderStatusControllerSoapPort;
  i: Integer;
  ENWorkOrderStatusList: ENWorkOrderStatusShortList;
  begin
  SetGridHeaders(ENWorkOrderStatusHeaders, sgENWorkOrderStatus.ColumnHeaders);
  ColCount:=100;
  TempENWorkOrderStatus :=  HTTPRIOENWorkOrderStatus as ENWorkOrderStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENWorkOrderStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENWorkOrderStatusList := TempENWorkOrderStatus.getScrollableFilteredList(ENWorkOrderStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(ENWorkOrderStatusList.list);

  if LastCount > -1 then
     sgENWorkOrderStatus.RowCount:=LastCount+2
  else
     sgENWorkOrderStatus.RowCount:=2;

   with sgENWorkOrderStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENWorkOrderStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENWorkOrderStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENWorkOrderStatusList.list[i].name;
        LastRow:=i+1;
        sgENWorkOrderStatus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENWorkOrderStatus.Row:=1;
end;

procedure TfrmENWorkOrderStatusShow.sgENWorkOrderStatusTopLeftChanged(Sender: TObject);
var
  TempENWorkOrderStatus: ENWorkOrderStatusControllerSoapPort;
  i,CurrentRow: Integer;
  ENWorkOrderStatusList: ENWorkOrderStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENWorkOrderStatus.TopRow + sgENWorkOrderStatus.VisibleRowCount) = ColCount
  then
    begin
      TempENWorkOrderStatus :=  HTTPRIOENWorkOrderStatus as ENWorkOrderStatusControllerSoapPort;
      CurrentRow:=sgENWorkOrderStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENWorkOrderStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENWorkOrderStatusList := TempENWorkOrderStatus.getScrollableFilteredList(ENWorkOrderStatusFilter(FilterObject),ColCount-1, 100);



  sgENWorkOrderStatus.RowCount:=sgENWorkOrderStatus.RowCount+100;
  LastCount:=High(ENWorkOrderStatusList.list);
  with sgENWorkOrderStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENWorkOrderStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENWorkOrderStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENWorkOrderStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENWorkOrderStatus.Row:=CurrentRow-5;
   sgENWorkOrderStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENWorkOrderStatusShow.sgENWorkOrderStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENWorkOrderStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENWorkOrderStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENWorkOrderStatus.RowCount-1 do
   for j:=0 to sgENWorkOrderStatus.ColCount-1 do
     sgENWorkOrderStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENWorkOrderStatusShow.actViewExecute(Sender: TObject);
Var TempENWorkOrderStatus: ENWorkOrderStatusControllerSoapPort;
begin
 TempENWorkOrderStatus := HTTPRIOENWorkOrderStatus as ENWorkOrderStatusControllerSoapPort;
   try
     ENWorkOrderStatusObj := TempENWorkOrderStatus.getObject(StrToInt(sgENWorkOrderStatus.Cells[0,sgENWorkOrderStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENWorkOrderStatusEdit:=TfrmENWorkOrderStatusEdit.Create(Application, dsView);
  try
    frmENWorkOrderStatusEdit.ShowModal;
  finally
    frmENWorkOrderStatusEdit.Free;
    frmENWorkOrderStatusEdit:=nil;
  end;
end;

procedure TfrmENWorkOrderStatusShow.actEditExecute(Sender: TObject);
Var TempENWorkOrderStatus: ENWorkOrderStatusControllerSoapPort;
begin
 TempENWorkOrderStatus := HTTPRIOENWorkOrderStatus as ENWorkOrderStatusControllerSoapPort;
   try
     ENWorkOrderStatusObj := TempENWorkOrderStatus.getObject(StrToInt(sgENWorkOrderStatus.Cells[0,sgENWorkOrderStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENWorkOrderStatusEdit:=TfrmENWorkOrderStatusEdit.Create(Application, dsEdit);
  try
    if frmENWorkOrderStatusEdit.ShowModal= mrOk then
      begin
        //TempENWorkOrderStatus.save(ENWorkOrderStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENWorkOrderStatusEdit.Free;
    frmENWorkOrderStatusEdit:=nil;
  end;
end;

procedure TfrmENWorkOrderStatusShow.actDeleteExecute(Sender: TObject);
Var TempENWorkOrderStatus: ENWorkOrderStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempENWorkOrderStatus := HTTPRIOENWorkOrderStatus as ENWorkOrderStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgENWorkOrderStatus.Cells[0,sgENWorkOrderStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статус наряд завдання) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENWorkOrderStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENWorkOrderStatusShow.actInsertExecute(Sender: TObject);
Var TempENWorkOrderStatus: ENWorkOrderStatusControllerSoapPort;
begin
  TempENWorkOrderStatus := HTTPRIOENWorkOrderStatus as ENWorkOrderStatusControllerSoapPort;
  ENWorkOrderStatusObj:=ENWorkOrderStatus.Create;



  try
    frmENWorkOrderStatusEdit:=TfrmENWorkOrderStatusEdit.Create(Application, dsInsert);
    try
      if frmENWorkOrderStatusEdit.ShowModal = mrOk then
      begin
        if ENWorkOrderStatusObj<>nil then
            //TempENWorkOrderStatus.add(ENWorkOrderStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENWorkOrderStatusEdit.Free;
      frmENWorkOrderStatusEdit:=nil;
    end;
  finally
    ENWorkOrderStatusObj.Free;
  end;
end;

procedure TfrmENWorkOrderStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENWorkOrderStatusShow.actFilterExecute(Sender: TObject);
begin
{frmENWorkOrderStatusFilterEdit:=TfrmENWorkOrderStatusFilterEdit.Create(Application, dsEdit);
  try
    ENWorkOrderStatusFilterObj := ENWorkOrderStatusFilter.Create;
    SetNullIntProps(ENWorkOrderStatusFilterObj);
    SetNullXSProps(ENWorkOrderStatusFilterObj);

    if frmENWorkOrderStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENWorkOrderStatusFilter.Create;
      FilterObject := ENWorkOrderStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENWorkOrderStatusFilterEdit.Free;
    frmENWorkOrderStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmENWorkOrderStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.