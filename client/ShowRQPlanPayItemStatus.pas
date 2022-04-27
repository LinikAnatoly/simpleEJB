
unit ShowRQPlanPayItemStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQPlanPayItemStatusController ;


type
  TfrmRQPlanPayItemStatusShow = class(TChildForm)  
  HTTPRIORQPlanPayItemStatus: THTTPRIO;
    ImageList1: TImageList;
    sgRQPlanPayItemStatus: TAdvStringGrid;
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
procedure sgRQPlanPayItemStatusTopLeftChanged(Sender: TObject);
procedure sgRQPlanPayItemStatusDblClick(Sender: TObject);
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
 // RQPlanPayItemStatusObj: RQPlanPayItemStatus;
 // RQPlanPayItemStatusFilterObj: RQPlanPayItemStatusFilter;
  
  
implementation

uses Main, EditRQPlanPayItemStatus, EditRQPlanPayItemStatusFilter;


{$R *.dfm}

var
  //frmRQPlanPayItemStatusShow : TfrmRQPlanPayItemStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQPlanPayItemStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'наименование статуса'
        );
   

procedure TfrmRQPlanPayItemStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQPlanPayItemStatusShow:=nil;
    inherited;
  end;


procedure TfrmRQPlanPayItemStatusShow.FormShow(Sender: TObject);
var
  TempRQPlanPayItemStatus: RQPlanPayItemStatusControllerSoapPort;
  i: Integer;
  RQPlanPayItemStatusList: RQPlanPayItemStatusShortList;
  begin
  SetGridHeaders(RQPlanPayItemStatusHeaders, sgRQPlanPayItemStatus.ColumnHeaders);
  ColCount:=100;
  TempRQPlanPayItemStatus :=  HTTPRIORQPlanPayItemStatus as RQPlanPayItemStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQPlanPayItemStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPlanPayItemStatusList := TempRQPlanPayItemStatus.getScrollableFilteredList(RQPlanPayItemStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(RQPlanPayItemStatusList.list);

  if LastCount > -1 then
     sgRQPlanPayItemStatus.RowCount:=LastCount+2
  else
     sgRQPlanPayItemStatus.RowCount:=2;

   with sgRQPlanPayItemStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPlanPayItemStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQPlanPayItemStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQPlanPayItemStatusList.list[i].name;
        LastRow:=i+1;
        sgRQPlanPayItemStatus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQPlanPayItemStatus.Row:=1;
end;

procedure TfrmRQPlanPayItemStatusShow.sgRQPlanPayItemStatusTopLeftChanged(Sender: TObject);
var
  TempRQPlanPayItemStatus: RQPlanPayItemStatusControllerSoapPort;
  i,CurrentRow: Integer;
  RQPlanPayItemStatusList: RQPlanPayItemStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQPlanPayItemStatus.TopRow + sgRQPlanPayItemStatus.VisibleRowCount) = ColCount
  then
    begin
      TempRQPlanPayItemStatus :=  HTTPRIORQPlanPayItemStatus as RQPlanPayItemStatusControllerSoapPort;
      CurrentRow:=sgRQPlanPayItemStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQPlanPayItemStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPlanPayItemStatusList := TempRQPlanPayItemStatus.getScrollableFilteredList(RQPlanPayItemStatusFilter(FilterObject),ColCount-1, 100);



  sgRQPlanPayItemStatus.RowCount:=sgRQPlanPayItemStatus.RowCount+100;
  LastCount:=High(RQPlanPayItemStatusList.list);
  with sgRQPlanPayItemStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPlanPayItemStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQPlanPayItemStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQPlanPayItemStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQPlanPayItemStatus.Row:=CurrentRow-5;
   sgRQPlanPayItemStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQPlanPayItemStatusShow.sgRQPlanPayItemStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQPlanPayItemStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQPlanPayItemStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQPlanPayItemStatus.RowCount-1 do
   for j:=0 to sgRQPlanPayItemStatus.ColCount-1 do
     sgRQPlanPayItemStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQPlanPayItemStatusShow.actViewExecute(Sender: TObject);
Var TempRQPlanPayItemStatus: RQPlanPayItemStatusControllerSoapPort;
begin
 TempRQPlanPayItemStatus := HTTPRIORQPlanPayItemStatus as RQPlanPayItemStatusControllerSoapPort;
   try
     RQPlanPayItemStatusObj := TempRQPlanPayItemStatus.getObject(StrToInt(sgRQPlanPayItemStatus.Cells[0,sgRQPlanPayItemStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPlanPayItemStatusEdit:=TfrmRQPlanPayItemStatusEdit.Create(Application, dsView);
  try
    frmRQPlanPayItemStatusEdit.ShowModal;
  finally
    frmRQPlanPayItemStatusEdit.Free;
    frmRQPlanPayItemStatusEdit:=nil;
  end;
end;

procedure TfrmRQPlanPayItemStatusShow.actEditExecute(Sender: TObject);
Var TempRQPlanPayItemStatus: RQPlanPayItemStatusControllerSoapPort;
begin
 TempRQPlanPayItemStatus := HTTPRIORQPlanPayItemStatus as RQPlanPayItemStatusControllerSoapPort;
   try
     RQPlanPayItemStatusObj := TempRQPlanPayItemStatus.getObject(StrToInt(sgRQPlanPayItemStatus.Cells[0,sgRQPlanPayItemStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPlanPayItemStatusEdit:=TfrmRQPlanPayItemStatusEdit.Create(Application, dsEdit);
  try
    if frmRQPlanPayItemStatusEdit.ShowModal= mrOk then
      begin
        //TempRQPlanPayItemStatus.save(RQPlanPayItemStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQPlanPayItemStatusEdit.Free;
    frmRQPlanPayItemStatusEdit:=nil;
  end;
end;

procedure TfrmRQPlanPayItemStatusShow.actDeleteExecute(Sender: TObject);
Var TempRQPlanPayItemStatus: RQPlanPayItemStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQPlanPayItemStatus := HTTPRIORQPlanPayItemStatus as RQPlanPayItemStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQPlanPayItemStatus.Cells[0,sgRQPlanPayItemStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статус строки плана оплат (счета,оплаты,приходы) ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPlanPayItemStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQPlanPayItemStatusShow.actInsertExecute(Sender: TObject);
// Var TempRQPlanPayItemStatus: RQPlanPayItemStatusControllerSoapPort; 
begin
  // TempRQPlanPayItemStatus := HTTPRIORQPlanPayItemStatus as RQPlanPayItemStatusControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQPlanPayItemStatusObj:=RQPlanPayItemStatus.Create;



  try
    frmRQPlanPayItemStatusEdit:=TfrmRQPlanPayItemStatusEdit.Create(Application, dsInsert);
    try
      if frmRQPlanPayItemStatusEdit.ShowModal = mrOk then
      begin
        if RQPlanPayItemStatusObj<>nil then
            //TempRQPlanPayItemStatus.add(RQPlanPayItemStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQPlanPayItemStatusEdit.Free;
      frmRQPlanPayItemStatusEdit:=nil;
    end;
  finally
    RQPlanPayItemStatusObj.Free;
  end;
end;

procedure TfrmRQPlanPayItemStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQPlanPayItemStatusShow.actFilterExecute(Sender: TObject);
begin
{frmRQPlanPayItemStatusFilterEdit:=TfrmRQPlanPayItemStatusFilterEdit.Create(Application, dsInsert);
  try
    RQPlanPayItemStatusFilterObj := RQPlanPayItemStatusFilter.Create;
    SetNullIntProps(RQPlanPayItemStatusFilterObj);
    SetNullXSProps(RQPlanPayItemStatusFilterObj);

    if frmRQPlanPayItemStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQPlanPayItemStatusFilter.Create;
      FilterObject := RQPlanPayItemStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQPlanPayItemStatusFilterEdit.Free;
    frmRQPlanPayItemStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmRQPlanPayItemStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.