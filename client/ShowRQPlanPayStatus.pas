
unit ShowRQPlanPayStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQPlanPayStatusController ;


type
  TfrmRQPlanPayStatusShow = class(TChildForm)  
  HTTPRIORQPlanPayStatus: THTTPRIO;
    ImageList1: TImageList;
    sgRQPlanPayStatus: TAdvStringGrid;
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
procedure sgRQPlanPayStatusTopLeftChanged(Sender: TObject);
procedure sgRQPlanPayStatusDblClick(Sender: TObject);
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
 // RQPlanPayStatusObj: RQPlanPayStatus;
 // RQPlanPayStatusFilterObj: RQPlanPayStatusFilter;
  
  
implementation

uses Main, EditRQPlanPayStatus, EditRQPlanPayStatusFilter;


{$R *.dfm}

var
  //frmRQPlanPayStatusShow : TfrmRQPlanPayStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQPlanPayStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'наименование статуса'
        );
   

procedure TfrmRQPlanPayStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQPlanPayStatusShow:=nil;
    inherited;
  end;


procedure TfrmRQPlanPayStatusShow.FormShow(Sender: TObject);
var
  TempRQPlanPayStatus: RQPlanPayStatusControllerSoapPort;
  i: Integer;
  RQPlanPayStatusList: RQPlanPayStatusShortList;
  begin
  SetGridHeaders(RQPlanPayStatusHeaders, sgRQPlanPayStatus.ColumnHeaders);
  ColCount:=100;
  TempRQPlanPayStatus :=  HTTPRIORQPlanPayStatus as RQPlanPayStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQPlanPayStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPlanPayStatusList := TempRQPlanPayStatus.getScrollableFilteredList(RQPlanPayStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(RQPlanPayStatusList.list);

  if LastCount > -1 then
     sgRQPlanPayStatus.RowCount:=LastCount+2
  else
     sgRQPlanPayStatus.RowCount:=2;

   with sgRQPlanPayStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPlanPayStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQPlanPayStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQPlanPayStatusList.list[i].name;
        LastRow:=i+1;
        sgRQPlanPayStatus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQPlanPayStatus.Row:=1;
end;

procedure TfrmRQPlanPayStatusShow.sgRQPlanPayStatusTopLeftChanged(Sender: TObject);
var
  TempRQPlanPayStatus: RQPlanPayStatusControllerSoapPort;
  i,CurrentRow: Integer;
  RQPlanPayStatusList: RQPlanPayStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQPlanPayStatus.TopRow + sgRQPlanPayStatus.VisibleRowCount) = ColCount
  then
    begin
      TempRQPlanPayStatus :=  HTTPRIORQPlanPayStatus as RQPlanPayStatusControllerSoapPort;
      CurrentRow:=sgRQPlanPayStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQPlanPayStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPlanPayStatusList := TempRQPlanPayStatus.getScrollableFilteredList(RQPlanPayStatusFilter(FilterObject),ColCount-1, 100);



  sgRQPlanPayStatus.RowCount:=sgRQPlanPayStatus.RowCount+100;
  LastCount:=High(RQPlanPayStatusList.list);
  with sgRQPlanPayStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPlanPayStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQPlanPayStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQPlanPayStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQPlanPayStatus.Row:=CurrentRow-5;
   sgRQPlanPayStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQPlanPayStatusShow.sgRQPlanPayStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQPlanPayStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQPlanPayStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQPlanPayStatus.RowCount-1 do
   for j:=0 to sgRQPlanPayStatus.ColCount-1 do
     sgRQPlanPayStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQPlanPayStatusShow.actViewExecute(Sender: TObject);
Var TempRQPlanPayStatus: RQPlanPayStatusControllerSoapPort;
begin
 TempRQPlanPayStatus := HTTPRIORQPlanPayStatus as RQPlanPayStatusControllerSoapPort;
   try
     RQPlanPayStatusObj := TempRQPlanPayStatus.getObject(StrToInt(sgRQPlanPayStatus.Cells[0,sgRQPlanPayStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPlanPayStatusEdit:=TfrmRQPlanPayStatusEdit.Create(Application, dsView);
  try
    frmRQPlanPayStatusEdit.ShowModal;
  finally
    frmRQPlanPayStatusEdit.Free;
    frmRQPlanPayStatusEdit:=nil;
  end;
end;

procedure TfrmRQPlanPayStatusShow.actEditExecute(Sender: TObject);
Var TempRQPlanPayStatus: RQPlanPayStatusControllerSoapPort;
begin
 TempRQPlanPayStatus := HTTPRIORQPlanPayStatus as RQPlanPayStatusControllerSoapPort;
   try
     RQPlanPayStatusObj := TempRQPlanPayStatus.getObject(StrToInt(sgRQPlanPayStatus.Cells[0,sgRQPlanPayStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPlanPayStatusEdit:=TfrmRQPlanPayStatusEdit.Create(Application, dsEdit);
  try
    if frmRQPlanPayStatusEdit.ShowModal= mrOk then
      begin
        //TempRQPlanPayStatus.save(RQPlanPayStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQPlanPayStatusEdit.Free;
    frmRQPlanPayStatusEdit:=nil;
  end;
end;

procedure TfrmRQPlanPayStatusShow.actDeleteExecute(Sender: TObject);
Var TempRQPlanPayStatus: RQPlanPayStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQPlanPayStatus := HTTPRIORQPlanPayStatus as RQPlanPayStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQPlanPayStatus.Cells[0,sgRQPlanPayStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статусы реестра плановых оплат) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPlanPayStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQPlanPayStatusShow.actInsertExecute(Sender: TObject);
// Var TempRQPlanPayStatus: RQPlanPayStatusControllerSoapPort; 
begin
  // TempRQPlanPayStatus := HTTPRIORQPlanPayStatus as RQPlanPayStatusControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQPlanPayStatusObj:=RQPlanPayStatus.Create;



  try
    frmRQPlanPayStatusEdit:=TfrmRQPlanPayStatusEdit.Create(Application, dsInsert);
    try
      if frmRQPlanPayStatusEdit.ShowModal = mrOk then
      begin
        if RQPlanPayStatusObj<>nil then
            //TempRQPlanPayStatus.add(RQPlanPayStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQPlanPayStatusEdit.Free;
      frmRQPlanPayStatusEdit:=nil;
    end;
  finally
    RQPlanPayStatusObj.Free;
  end;
end;

procedure TfrmRQPlanPayStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQPlanPayStatusShow.actFilterExecute(Sender: TObject);
begin
{frmRQPlanPayStatusFilterEdit:=TfrmRQPlanPayStatusFilterEdit.Create(Application, dsInsert);
  try
    RQPlanPayStatusFilterObj := RQPlanPayStatusFilter.Create;
    SetNullIntProps(RQPlanPayStatusFilterObj);
    SetNullXSProps(RQPlanPayStatusFilterObj);

    if frmRQPlanPayStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQPlanPayStatusFilter.Create;
      FilterObject := RQPlanPayStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQPlanPayStatusFilterEdit.Free;
    frmRQPlanPayStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmRQPlanPayStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.