
unit ShowRQFKOrderItem2EstimateItemStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQFKOrderItem2EstimateItemStatusController ;


type
  TfrmRQFKOrderItem2EstimateItemStatusShow = class(TChildForm)  
  HTTPRIORQFKOrderItem2EstimateItemStatus: THTTPRIO;
    ImageList1: TImageList;
    sgRQFKOrderItem2EstimateItemStatus: TAdvStringGrid;
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
procedure sgRQFKOrderItem2EstimateItemStatusTopLeftChanged(Sender: TObject);
procedure sgRQFKOrderItem2EstimateItemStatusDblClick(Sender: TObject);
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
 // RQFKOrderItem2EstimateItemStatusObj: RQFKOrderItem2EstimateItemStatus;
 // RQFKOrderItem2EstimateItemStatusFilterObj: RQFKOrderItem2EstimateItemStatusFilter;
  
  
implementation

uses Main, EditRQFKOrderItem2EstimateItemStatus, EditRQFKOrderItem2EstimateItemStatusFilter;


{$R *.dfm}

var
  //frmRQFKOrderItem2EstimateItemStatusShow : TfrmRQFKOrderItem2EstimateItemStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQFKOrderItem2EstimateItemStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип зв_язку'
        );
   

procedure TfrmRQFKOrderItem2EstimateItemStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQFKOrderItem2EstimateItemStatusShow:=nil;
    inherited;
  end;


procedure TfrmRQFKOrderItem2EstimateItemStatusShow.FormShow(Sender: TObject);
var
  TempRQFKOrderItem2EstimateItemStatus: RQFKOrderItem2EstimateItemStatusControllerSoapPort;
  i: Integer;
  RQFKOrderItem2EstimateItemStatusList: RQFKOrderItem2EstimateItemStatusShortList;
  begin
  SetGridHeaders(RQFKOrderItem2EstimateItemStatusHeaders, sgRQFKOrderItem2EstimateItemStatus.ColumnHeaders);
  ColCount:=100;
  TempRQFKOrderItem2EstimateItemStatus :=  HTTPRIORQFKOrderItem2EstimateItemStatus as RQFKOrderItem2EstimateItemStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQFKOrderItem2EstimateItemStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQFKOrderItem2EstimateItemStatusList := TempRQFKOrderItem2EstimateItemStatus.getScrollableFilteredList(RQFKOrderItem2EstimateItemStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(RQFKOrderItem2EstimateItemStatusList.list);

  if LastCount > -1 then
     sgRQFKOrderItem2EstimateItemStatus.RowCount:=LastCount+2
  else
     sgRQFKOrderItem2EstimateItemStatus.RowCount:=2;

   with sgRQFKOrderItem2EstimateItemStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQFKOrderItem2EstimateItemStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQFKOrderItem2EstimateItemStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQFKOrderItem2EstimateItemStatusList.list[i].name;
        LastRow:=i+1;
        sgRQFKOrderItem2EstimateItemStatus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQFKOrderItem2EstimateItemStatus.Row:=1;
end;

procedure TfrmRQFKOrderItem2EstimateItemStatusShow.sgRQFKOrderItem2EstimateItemStatusTopLeftChanged(Sender: TObject);
var
  TempRQFKOrderItem2EstimateItemStatus: RQFKOrderItem2EstimateItemStatusControllerSoapPort;
  i,CurrentRow: Integer;
  RQFKOrderItem2EstimateItemStatusList: RQFKOrderItem2EstimateItemStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQFKOrderItem2EstimateItemStatus.TopRow + sgRQFKOrderItem2EstimateItemStatus.VisibleRowCount) = ColCount
  then
    begin
      TempRQFKOrderItem2EstimateItemStatus :=  HTTPRIORQFKOrderItem2EstimateItemStatus as RQFKOrderItem2EstimateItemStatusControllerSoapPort;
      CurrentRow:=sgRQFKOrderItem2EstimateItemStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQFKOrderItem2EstimateItemStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQFKOrderItem2EstimateItemStatusList := TempRQFKOrderItem2EstimateItemStatus.getScrollableFilteredList(RQFKOrderItem2EstimateItemStatusFilter(FilterObject),ColCount-1, 100);



  sgRQFKOrderItem2EstimateItemStatus.RowCount:=sgRQFKOrderItem2EstimateItemStatus.RowCount+100;
  LastCount:=High(RQFKOrderItem2EstimateItemStatusList.list);
  with sgRQFKOrderItem2EstimateItemStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQFKOrderItem2EstimateItemStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQFKOrderItem2EstimateItemStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQFKOrderItem2EstimateItemStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQFKOrderItem2EstimateItemStatus.Row:=CurrentRow-5;
   sgRQFKOrderItem2EstimateItemStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQFKOrderItem2EstimateItemStatusShow.sgRQFKOrderItem2EstimateItemStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQFKOrderItem2EstimateItemStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQFKOrderItem2EstimateItemStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQFKOrderItem2EstimateItemStatus.RowCount-1 do
   for j:=0 to sgRQFKOrderItem2EstimateItemStatus.ColCount-1 do
     sgRQFKOrderItem2EstimateItemStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQFKOrderItem2EstimateItemStatusShow.actViewExecute(Sender: TObject);
Var TempRQFKOrderItem2EstimateItemStatus: RQFKOrderItem2EstimateItemStatusControllerSoapPort;
begin
 TempRQFKOrderItem2EstimateItemStatus := HTTPRIORQFKOrderItem2EstimateItemStatus as RQFKOrderItem2EstimateItemStatusControllerSoapPort;
   try
     RQFKOrderItem2EstimateItemStatusObj := TempRQFKOrderItem2EstimateItemStatus.getObject(StrToInt(sgRQFKOrderItem2EstimateItemStatus.Cells[0,sgRQFKOrderItem2EstimateItemStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQFKOrderItem2EstimateItemStatusEdit:=TfrmRQFKOrderItem2EstimateItemStatusEdit.Create(Application, dsView);
  try
    frmRQFKOrderItem2EstimateItemStatusEdit.ShowModal;
  finally
    frmRQFKOrderItem2EstimateItemStatusEdit.Free;
    frmRQFKOrderItem2EstimateItemStatusEdit:=nil;
  end;
end;

procedure TfrmRQFKOrderItem2EstimateItemStatusShow.actEditExecute(Sender: TObject);
Var TempRQFKOrderItem2EstimateItemStatus: RQFKOrderItem2EstimateItemStatusControllerSoapPort;
begin
 TempRQFKOrderItem2EstimateItemStatus := HTTPRIORQFKOrderItem2EstimateItemStatus as RQFKOrderItem2EstimateItemStatusControllerSoapPort;
   try
     RQFKOrderItem2EstimateItemStatusObj := TempRQFKOrderItem2EstimateItemStatus.getObject(StrToInt(sgRQFKOrderItem2EstimateItemStatus.Cells[0,sgRQFKOrderItem2EstimateItemStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQFKOrderItem2EstimateItemStatusEdit:=TfrmRQFKOrderItem2EstimateItemStatusEdit.Create(Application, dsEdit);
  try
    if frmRQFKOrderItem2EstimateItemStatusEdit.ShowModal= mrOk then
      begin
        //TempRQFKOrderItem2EstimateItemStatus.save(RQFKOrderItem2EstimateItemStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQFKOrderItem2EstimateItemStatusEdit.Free;
    frmRQFKOrderItem2EstimateItemStatusEdit:=nil;
  end;
end;

procedure TfrmRQFKOrderItem2EstimateItemStatusShow.actDeleteExecute(Sender: TObject);
Var TempRQFKOrderItem2EstimateItemStatus: RQFKOrderItem2EstimateItemStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQFKOrderItem2EstimateItemStatus := HTTPRIORQFKOrderItem2EstimateItemStatus as RQFKOrderItem2EstimateItemStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQFKOrderItem2EstimateItemStatus.Cells[0,sgRQFKOrderItem2EstimateItemStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статус звя_язку ордера с материалом) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQFKOrderItem2EstimateItemStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQFKOrderItem2EstimateItemStatusShow.actInsertExecute(Sender: TObject);
Var TempRQFKOrderItem2EstimateItemStatus: RQFKOrderItem2EstimateItemStatusControllerSoapPort;
begin
  TempRQFKOrderItem2EstimateItemStatus := HTTPRIORQFKOrderItem2EstimateItemStatus as RQFKOrderItem2EstimateItemStatusControllerSoapPort;
  RQFKOrderItem2EstimateItemStatusObj:=RQFKOrderItem2EstimateItemStatus.Create;



  try
    frmRQFKOrderItem2EstimateItemStatusEdit:=TfrmRQFKOrderItem2EstimateItemStatusEdit.Create(Application, dsInsert);
    try
      if frmRQFKOrderItem2EstimateItemStatusEdit.ShowModal = mrOk then
      begin
        if RQFKOrderItem2EstimateItemStatusObj<>nil then
            //TempRQFKOrderItem2EstimateItemStatus.add(RQFKOrderItem2EstimateItemStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQFKOrderItem2EstimateItemStatusEdit.Free;
      frmRQFKOrderItem2EstimateItemStatusEdit:=nil;
    end;
  finally
    RQFKOrderItem2EstimateItemStatusObj.Free;
  end;
end;

procedure TfrmRQFKOrderItem2EstimateItemStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQFKOrderItem2EstimateItemStatusShow.actFilterExecute(Sender: TObject);
begin
{frmRQFKOrderItem2EstimateItemStatusFilterEdit:=TfrmRQFKOrderItem2EstimateItemStatusFilterEdit.Create(Application, dsEdit);
  try
    RQFKOrderItem2EstimateItemStatusFilterObj := RQFKOrderItem2EstimateItemStatusFilter.Create;
    SetNullIntProps(RQFKOrderItem2EstimateItemStatusFilterObj);
    SetNullXSProps(RQFKOrderItem2EstimateItemStatusFilterObj);

    if frmRQFKOrderItem2EstimateItemStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQFKOrderItem2EstimateItemStatusFilter.Create;
      FilterObject := RQFKOrderItem2EstimateItemStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQFKOrderItem2EstimateItemStatusFilterEdit.Free;
    frmRQFKOrderItem2EstimateItemStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmRQFKOrderItem2EstimateItemStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.