
unit ShowRQOrderStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQOrderStatusController ;


type
  TfrmRQOrderStatusShow = class(TChildForm)  
  HTTPRIORQOrderStatus: THTTPRIO;
    ImageList1: TImageList;
    sgRQOrderStatus: TAdvStringGrid;
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
procedure sgRQOrderStatusTopLeftChanged(Sender: TObject);
procedure sgRQOrderStatusDblClick(Sender: TObject);
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
 // RQOrderStatusObj: RQOrderStatus;
 // RQOrderStatusFilterObj: RQOrderStatusFilter;
  
  
implementation

uses Main, EditRQOrderStatus, EditRQOrderStatusFilter;


{$R *.dfm}

var
  //frmRQOrderStatusShow : TfrmRQOrderStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQOrderStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Статус заявки'
        );
   

procedure TfrmRQOrderStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQOrderStatusShow:=nil;
    inherited;
  end;


procedure TfrmRQOrderStatusShow.FormShow(Sender: TObject);
var
  TempRQOrderStatus: RQOrderStatusControllerSoapPort;
  i: Integer;
  RQOrderStatusList: RQOrderStatusShortList;
  begin
  SetGridHeaders(RQOrderStatusHeaders, sgRQOrderStatus.ColumnHeaders);
  ColCount:=100;
  TempRQOrderStatus :=  HTTPRIORQOrderStatus as RQOrderStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQOrderStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrderStatusList := TempRQOrderStatus.getScrollableFilteredList(RQOrderStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(RQOrderStatusList.list);

  if LastCount > -1 then
     sgRQOrderStatus.RowCount:=LastCount+2
  else
     sgRQOrderStatus.RowCount:=2;

   with sgRQOrderStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQOrderStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQOrderStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQOrderStatusList.list[i].name;
        LastRow:=i+1;
        sgRQOrderStatus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQOrderStatus.Row:=1;
end;

procedure TfrmRQOrderStatusShow.sgRQOrderStatusTopLeftChanged(Sender: TObject);
var
  TempRQOrderStatus: RQOrderStatusControllerSoapPort;
  i,CurrentRow: Integer;
  RQOrderStatusList: RQOrderStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQOrderStatus.TopRow + sgRQOrderStatus.VisibleRowCount) = ColCount
  then
    begin
      TempRQOrderStatus :=  HTTPRIORQOrderStatus as RQOrderStatusControllerSoapPort;
      CurrentRow:=sgRQOrderStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQOrderStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrderStatusList := TempRQOrderStatus.getScrollableFilteredList(RQOrderStatusFilter(FilterObject),ColCount-1, 100);



  sgRQOrderStatus.RowCount:=sgRQOrderStatus.RowCount+100;
  LastCount:=High(RQOrderStatusList.list);
  with sgRQOrderStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQOrderStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQOrderStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQOrderStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQOrderStatus.Row:=CurrentRow-5;
   sgRQOrderStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQOrderStatusShow.sgRQOrderStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQOrderStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQOrderStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQOrderStatus.RowCount-1 do
   for j:=0 to sgRQOrderStatus.ColCount-1 do
     sgRQOrderStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQOrderStatusShow.actViewExecute(Sender: TObject);
Var TempRQOrderStatus: RQOrderStatusControllerSoapPort;
begin
 TempRQOrderStatus := HTTPRIORQOrderStatus as RQOrderStatusControllerSoapPort;
   try
     RQOrderStatusObj := TempRQOrderStatus.getObject(StrToInt(sgRQOrderStatus.Cells[0,sgRQOrderStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrderStatusEdit:=TfrmRQOrderStatusEdit.Create(Application, dsView);
  try
    frmRQOrderStatusEdit.ShowModal;
  finally
    frmRQOrderStatusEdit.Free;
    frmRQOrderStatusEdit:=nil;
  end;
end;

procedure TfrmRQOrderStatusShow.actEditExecute(Sender: TObject);
Var TempRQOrderStatus: RQOrderStatusControllerSoapPort;
begin
 TempRQOrderStatus := HTTPRIORQOrderStatus as RQOrderStatusControllerSoapPort;
   try
     RQOrderStatusObj := TempRQOrderStatus.getObject(StrToInt(sgRQOrderStatus.Cells[0,sgRQOrderStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrderStatusEdit:=TfrmRQOrderStatusEdit.Create(Application, dsEdit);
  try
    if frmRQOrderStatusEdit.ShowModal= mrOk then
      begin
        //TempRQOrderStatus.save(RQOrderStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQOrderStatusEdit.Free;
    frmRQOrderStatusEdit:=nil;
  end;
end;

procedure TfrmRQOrderStatusShow.actDeleteExecute(Sender: TObject);
Var TempRQOrderStatus: RQOrderStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQOrderStatus := HTTPRIORQOrderStatus as RQOrderStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQOrderStatus.Cells[0,sgRQOrderStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статус заявки (создана/отраб  и т.д.)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQOrderStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQOrderStatusShow.actInsertExecute(Sender: TObject);
Var TempRQOrderStatus: RQOrderStatusControllerSoapPort;
begin
  TempRQOrderStatus := HTTPRIORQOrderStatus as RQOrderStatusControllerSoapPort;
  RQOrderStatusObj:=RQOrderStatus.Create;



  try
    frmRQOrderStatusEdit:=TfrmRQOrderStatusEdit.Create(Application, dsInsert);
    try
      if frmRQOrderStatusEdit.ShowModal = mrOk then
      begin
        if RQOrderStatusObj<>nil then
            //TempRQOrderStatus.add(RQOrderStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQOrderStatusEdit.Free;
      frmRQOrderStatusEdit:=nil;
    end;
  finally
    RQOrderStatusObj.Free;
  end;
end;

procedure TfrmRQOrderStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQOrderStatusShow.actFilterExecute(Sender: TObject);
begin
{frmRQOrderStatusFilterEdit:=TfrmRQOrderStatusFilterEdit.Create(Application, dsEdit);
  try
    RQOrderStatusFilterObj := RQOrderStatusFilter.Create;
    SetNullIntProps(RQOrderStatusFilterObj);
    SetNullXSProps(RQOrderStatusFilterObj);

    if frmRQOrderStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQOrderStatusFilter.Create;
      FilterObject := RQOrderStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQOrderStatusFilterEdit.Free;
    frmRQOrderStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmRQOrderStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.