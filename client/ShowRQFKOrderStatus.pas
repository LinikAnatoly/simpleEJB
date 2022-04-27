
unit ShowRQFKOrderStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns,
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQFKOrderStatusController, AdvObj ;

type
  TProcChooseRQFKOrderStatusHandler = reference to procedure(selectedObj: RQFKOrderStatusShort);

type
  TfrmRQFKOrderStatusShow = class(TChildForm)  
  HTTPRIORQFKOrderStatus: THTTPRIO;
    ImageList1: TImageList;
    sgRQFKOrderStatus: TAdvStringGrid;
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
procedure sgRQFKOrderStatusTopLeftChanged(Sender: TObject);
procedure sgRQFKOrderStatusDblClick(Sender: TObject);
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
   class procedure chooseFromList(filter : RQFKOrderStatusFilter; proc: TProcChooseRQFKOrderStatusHandler); stdcall; static;
 end;

var
 frmRQFKOrderStatusShow : TfrmRQFKOrderStatusShow;
 // RQFKOrderStatusObj: RQFKOrderStatus;
 // RQFKOrderStatusFilterObj: RQFKOrderStatusFilter;
  
  
implementation

uses Main, EditRQFKOrderStatus, EditRQFKOrderStatusFilter;


{$R *.dfm}

var
  //frmRQFKOrderStatusShow : TfrmRQFKOrderStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQFKOrderStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Вид ордеру'
        );
   

class procedure TfrmRQFKOrderStatusShow.chooseFromList(filter: RQFKOrderStatusFilter; proc: TProcChooseRQFKOrderStatusHandler);
var
  frmRQFKOrderStatusShow: TfrmRQFKOrderStatusShow;
  f : RQFKOrderStatusFilter;
  selectedObj : RQFKOrderStatusShort;
begin
  f := RQFKOrderStatusFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  if filter <> nil then f := filter;
  

  frmRQFKOrderStatusShow:=TfrmRQFKOrderStatusShow.Create(Application,fmNormal, f);
  try
    with frmRQFKOrderStatusShow do begin
      DisableActions([actInsert, actEdit, actDelete, actFilter, actNoFilter]);
      if ShowModal = mrOk then
      begin
        try
            selectedObj := RQFKOrderStatusShort(sgRQFKOrderStatus.Objects[0, sgRQFKOrderStatus.Row]);
            proc(selectedObj);
        except
           on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmRQFKOrderStatusShow.Free;
  end;
end;

procedure TfrmRQFKOrderStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQFKOrderStatusShow:=nil;
    inherited;
  end;


procedure TfrmRQFKOrderStatusShow.FormShow(Sender: TObject);
var
  TempRQFKOrderStatus: RQFKOrderStatusControllerSoapPort;
  i: Integer;
  RQFKOrderStatusList: RQFKOrderStatusShortList;
  begin
  SetGridHeaders(RQFKOrderStatusHeaders, sgRQFKOrderStatus.ColumnHeaders);
  ColCount:=100;
  TempRQFKOrderStatus :=  HTTPRIORQFKOrderStatus as RQFKOrderStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQFKOrderStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQFKOrderStatusList := TempRQFKOrderStatus.getScrollableFilteredList(RQFKOrderStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(RQFKOrderStatusList.list);

  if LastCount > -1 then
     sgRQFKOrderStatus.RowCount:=LastCount+2
  else
     sgRQFKOrderStatus.RowCount:=2;

   with sgRQFKOrderStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQFKOrderStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQFKOrderStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQFKOrderStatusList.list[i].name;
        LastRow:=i+1;
        sgRQFKOrderStatus.RowCount:=LastRow+1;

        Objects[0,i+1] := RQFKOrderStatusList.list[i];
      end;
   ColCount:=ColCount+1;
   sgRQFKOrderStatus.Row:=1;
end;

procedure TfrmRQFKOrderStatusShow.sgRQFKOrderStatusTopLeftChanged(Sender: TObject);
var
  TempRQFKOrderStatus: RQFKOrderStatusControllerSoapPort;
  i,CurrentRow: Integer;
  RQFKOrderStatusList: RQFKOrderStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQFKOrderStatus.TopRow + sgRQFKOrderStatus.VisibleRowCount) = ColCount
  then
    begin
      TempRQFKOrderStatus :=  HTTPRIORQFKOrderStatus as RQFKOrderStatusControllerSoapPort;
      CurrentRow:=sgRQFKOrderStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQFKOrderStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQFKOrderStatusList := TempRQFKOrderStatus.getScrollableFilteredList(RQFKOrderStatusFilter(FilterObject),ColCount-1, 100);



  sgRQFKOrderStatus.RowCount:=sgRQFKOrderStatus.RowCount+100;
  LastCount:=High(RQFKOrderStatusList.list);
  with sgRQFKOrderStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQFKOrderStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQFKOrderStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQFKOrderStatusList.list[i].name;
          LastRow:=i+CurrentRow;

        Objects[0,i+CurrentRow] := RQFKOrderStatusList.list[i];
      end;
   ColCount:=ColCount+100;
   sgRQFKOrderStatus.Row:=CurrentRow-5;
   sgRQFKOrderStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQFKOrderStatusShow.sgRQFKOrderStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQFKOrderStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQFKOrderStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQFKOrderStatus.RowCount-1 do
   for j:=0 to sgRQFKOrderStatus.ColCount-1 do
     sgRQFKOrderStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQFKOrderStatusShow.actViewExecute(Sender: TObject);
Var TempRQFKOrderStatus: RQFKOrderStatusControllerSoapPort;
begin
 TempRQFKOrderStatus := HTTPRIORQFKOrderStatus as RQFKOrderStatusControllerSoapPort;
   try
     RQFKOrderStatusObj := TempRQFKOrderStatus.getObject(StrToInt(sgRQFKOrderStatus.Cells[0,sgRQFKOrderStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQFKOrderStatusEdit:=TfrmRQFKOrderStatusEdit.Create(Application, dsView);
  try
    frmRQFKOrderStatusEdit.ShowModal;
  finally
    frmRQFKOrderStatusEdit.Free;
    frmRQFKOrderStatusEdit:=nil;
  end;
end;

procedure TfrmRQFKOrderStatusShow.actEditExecute(Sender: TObject);
Var TempRQFKOrderStatus: RQFKOrderStatusControllerSoapPort;
begin
 TempRQFKOrderStatus := HTTPRIORQFKOrderStatus as RQFKOrderStatusControllerSoapPort;
   try
     RQFKOrderStatusObj := TempRQFKOrderStatus.getObject(StrToInt(sgRQFKOrderStatus.Cells[0,sgRQFKOrderStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQFKOrderStatusEdit:=TfrmRQFKOrderStatusEdit.Create(Application, dsEdit);
  try
    if frmRQFKOrderStatusEdit.ShowModal= mrOk then
      begin
        //TempRQFKOrderStatus.save(RQFKOrderStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQFKOrderStatusEdit.Free;
    frmRQFKOrderStatusEdit:=nil;
  end;
end;

procedure TfrmRQFKOrderStatusShow.actDeleteExecute(Sender: TObject);
Var TempRQFKOrderStatus: RQFKOrderStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQFKOrderStatus := HTTPRIORQFKOrderStatus as RQFKOrderStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQFKOrderStatus.Cells[0,sgRQFKOrderStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статус ордеру) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQFKOrderStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQFKOrderStatusShow.actInsertExecute(Sender: TObject);
Var TempRQFKOrderStatus: RQFKOrderStatusControllerSoapPort;
begin
  TempRQFKOrderStatus := HTTPRIORQFKOrderStatus as RQFKOrderStatusControllerSoapPort;
  RQFKOrderStatusObj:=RQFKOrderStatus.Create;



  try
    frmRQFKOrderStatusEdit:=TfrmRQFKOrderStatusEdit.Create(Application, dsInsert);
    try
      if frmRQFKOrderStatusEdit.ShowModal = mrOk then
      begin
        if RQFKOrderStatusObj<>nil then
            //TempRQFKOrderStatus.add(RQFKOrderStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQFKOrderStatusEdit.Free;
      frmRQFKOrderStatusEdit:=nil;
    end;
  finally
    RQFKOrderStatusObj.Free;
  end;
end;

procedure TfrmRQFKOrderStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQFKOrderStatusShow.actFilterExecute(Sender: TObject);
begin
{frmRQFKOrderStatusFilterEdit:=TfrmRQFKOrderStatusFilterEdit.Create(Application, dsEdit);
  try
    RQFKOrderStatusFilterObj := RQFKOrderStatusFilter.Create;
    SetNullIntProps(RQFKOrderStatusFilterObj);
    SetNullXSProps(RQFKOrderStatusFilterObj);

    if frmRQFKOrderStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQFKOrderStatusFilter.Create;
      FilterObject := RQFKOrderStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQFKOrderStatusFilterEdit.Free;
    frmRQFKOrderStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmRQFKOrderStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.