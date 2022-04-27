
unit ShowRQOrderItem2ENEstimateItemStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQOrderItem2ENEstimateItemStatusController ;


type
  TfrmRQOrderItem2ENEstimateItemStatusShow = class(TChildForm)  
  HTTPRIORQOrderItem2ENEstimateItemStatus: THTTPRIO;
    ImageList1: TImageList;
    sgRQOrderItem2ENEstimateItemStatus: TAdvStringGrid;
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
procedure sgRQOrderItem2ENEstimateItemStatusTopLeftChanged(Sender: TObject);
procedure sgRQOrderItem2ENEstimateItemStatusDblClick(Sender: TObject);
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
 // RQOrderItem2ENEstimateItemStatusObj: RQOrderItem2ENEstimateItemStatus;
 // RQOrderItem2ENEstimateItemStatusFilterObj: RQOrderItem2ENEstimateItemStatusFilter;
  
  
implementation

uses Main, EditRQOrderItem2ENEstimateItemStatus, EditRQOrderItem2ENEstimateItemStatusFilter;


{$R *.dfm}

var
  //frmRQOrderItem2ENEstimateItemStatusShow : TfrmRQOrderItem2ENEstimateItemStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQOrderItem2ENEstimateItemStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Наименование ед. изм.'
        );
   

procedure TfrmRQOrderItem2ENEstimateItemStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQOrderItem2ENEstimateItemStatusShow:=nil;
    inherited;
  end;


procedure TfrmRQOrderItem2ENEstimateItemStatusShow.FormShow(Sender: TObject);
var
  TempRQOrderItem2ENEstimateItemStatus: RQOrderItem2ENEstimateItemStatusControllerSoapPort;
  i: Integer;
  RQOrderItem2ENEstimateItemStatusList: RQOrderItem2ENEstimateItemStatusShortList;
  begin
  SetGridHeaders(RQOrderItem2ENEstimateItemStatusHeaders, sgRQOrderItem2ENEstimateItemStatus.ColumnHeaders);
  ColCount:=100;
  TempRQOrderItem2ENEstimateItemStatus :=  HTTPRIORQOrderItem2ENEstimateItemStatus as RQOrderItem2ENEstimateItemStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQOrderItem2ENEstimateItemStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrderItem2ENEstimateItemStatusList := TempRQOrderItem2ENEstimateItemStatus.getScrollableFilteredList(RQOrderItem2ENEstimateItemStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(RQOrderItem2ENEstimateItemStatusList.list);

  if LastCount > -1 then
     sgRQOrderItem2ENEstimateItemStatus.RowCount:=LastCount+2
  else
     sgRQOrderItem2ENEstimateItemStatus.RowCount:=2;

   with sgRQOrderItem2ENEstimateItemStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQOrderItem2ENEstimateItemStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQOrderItem2ENEstimateItemStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQOrderItem2ENEstimateItemStatusList.list[i].name;
        LastRow:=i+1;
        sgRQOrderItem2ENEstimateItemStatus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQOrderItem2ENEstimateItemStatus.Row:=1;
end;

procedure TfrmRQOrderItem2ENEstimateItemStatusShow.sgRQOrderItem2ENEstimateItemStatusTopLeftChanged(Sender: TObject);
var
  TempRQOrderItem2ENEstimateItemStatus: RQOrderItem2ENEstimateItemStatusControllerSoapPort;
  i,CurrentRow: Integer;
  RQOrderItem2ENEstimateItemStatusList: RQOrderItem2ENEstimateItemStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQOrderItem2ENEstimateItemStatus.TopRow + sgRQOrderItem2ENEstimateItemStatus.VisibleRowCount) = ColCount
  then
    begin
      TempRQOrderItem2ENEstimateItemStatus :=  HTTPRIORQOrderItem2ENEstimateItemStatus as RQOrderItem2ENEstimateItemStatusControllerSoapPort;
      CurrentRow:=sgRQOrderItem2ENEstimateItemStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQOrderItem2ENEstimateItemStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrderItem2ENEstimateItemStatusList := TempRQOrderItem2ENEstimateItemStatus.getScrollableFilteredList(RQOrderItem2ENEstimateItemStatusFilter(FilterObject),ColCount-1, 100);



  sgRQOrderItem2ENEstimateItemStatus.RowCount:=sgRQOrderItem2ENEstimateItemStatus.RowCount+100;
  LastCount:=High(RQOrderItem2ENEstimateItemStatusList.list);
  with sgRQOrderItem2ENEstimateItemStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQOrderItem2ENEstimateItemStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQOrderItem2ENEstimateItemStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQOrderItem2ENEstimateItemStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQOrderItem2ENEstimateItemStatus.Row:=CurrentRow-5;
   sgRQOrderItem2ENEstimateItemStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQOrderItem2ENEstimateItemStatusShow.sgRQOrderItem2ENEstimateItemStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQOrderItem2ENEstimateItemStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQOrderItem2ENEstimateItemStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQOrderItem2ENEstimateItemStatus.RowCount-1 do
   for j:=0 to sgRQOrderItem2ENEstimateItemStatus.ColCount-1 do
     sgRQOrderItem2ENEstimateItemStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQOrderItem2ENEstimateItemStatusShow.actViewExecute(Sender: TObject);
Var TempRQOrderItem2ENEstimateItemStatus: RQOrderItem2ENEstimateItemStatusControllerSoapPort;
begin
 TempRQOrderItem2ENEstimateItemStatus := HTTPRIORQOrderItem2ENEstimateItemStatus as RQOrderItem2ENEstimateItemStatusControllerSoapPort;
   try
     RQOrderItem2ENEstimateItemStatusObj := TempRQOrderItem2ENEstimateItemStatus.getObject(StrToInt(sgRQOrderItem2ENEstimateItemStatus.Cells[0,sgRQOrderItem2ENEstimateItemStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrderItem2ENEstimateItemStatusEdit:=TfrmRQOrderItem2ENEstimateItemStatusEdit.Create(Application, dsView);
  try
    frmRQOrderItem2ENEstimateItemStatusEdit.ShowModal;
  finally
    frmRQOrderItem2ENEstimateItemStatusEdit.Free;
    frmRQOrderItem2ENEstimateItemStatusEdit:=nil;
  end;
end;

procedure TfrmRQOrderItem2ENEstimateItemStatusShow.actEditExecute(Sender: TObject);
Var TempRQOrderItem2ENEstimateItemStatus: RQOrderItem2ENEstimateItemStatusControllerSoapPort;
begin
 TempRQOrderItem2ENEstimateItemStatus := HTTPRIORQOrderItem2ENEstimateItemStatus as RQOrderItem2ENEstimateItemStatusControllerSoapPort;
   try
     RQOrderItem2ENEstimateItemStatusObj := TempRQOrderItem2ENEstimateItemStatus.getObject(StrToInt(sgRQOrderItem2ENEstimateItemStatus.Cells[0,sgRQOrderItem2ENEstimateItemStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrderItem2ENEstimateItemStatusEdit:=TfrmRQOrderItem2ENEstimateItemStatusEdit.Create(Application, dsEdit);
  try
    if frmRQOrderItem2ENEstimateItemStatusEdit.ShowModal= mrOk then
      begin
        //TempRQOrderItem2ENEstimateItemStatus.save(RQOrderItem2ENEstimateItemStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQOrderItem2ENEstimateItemStatusEdit.Free;
    frmRQOrderItem2ENEstimateItemStatusEdit:=nil;
  end;
end;

procedure TfrmRQOrderItem2ENEstimateItemStatusShow.actDeleteExecute(Sender: TObject);
Var TempRQOrderItem2ENEstimateItemStatus: RQOrderItem2ENEstimateItemStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQOrderItem2ENEstimateItemStatus := HTTPRIORQOrderItem2ENEstimateItemStatus as RQOrderItem2ENEstimateItemStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQOrderItem2ENEstimateItemStatus.Cells[0,sgRQOrderItem2ENEstimateItemStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статусы связи строк заявки с материалами) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQOrderItem2ENEstimateItemStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQOrderItem2ENEstimateItemStatusShow.actInsertExecute(Sender: TObject);
Var TempRQOrderItem2ENEstimateItemStatus: RQOrderItem2ENEstimateItemStatusControllerSoapPort;
begin
  TempRQOrderItem2ENEstimateItemStatus := HTTPRIORQOrderItem2ENEstimateItemStatus as RQOrderItem2ENEstimateItemStatusControllerSoapPort;
  RQOrderItem2ENEstimateItemStatusObj:=RQOrderItem2ENEstimateItemStatus.Create;



  try
    frmRQOrderItem2ENEstimateItemStatusEdit:=TfrmRQOrderItem2ENEstimateItemStatusEdit.Create(Application, dsInsert);
    try
      if frmRQOrderItem2ENEstimateItemStatusEdit.ShowModal = mrOk then
      begin
        if RQOrderItem2ENEstimateItemStatusObj<>nil then
            //TempRQOrderItem2ENEstimateItemStatus.add(RQOrderItem2ENEstimateItemStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQOrderItem2ENEstimateItemStatusEdit.Free;
      frmRQOrderItem2ENEstimateItemStatusEdit:=nil;
    end;
  finally
    RQOrderItem2ENEstimateItemStatusObj.Free;
  end;
end;

procedure TfrmRQOrderItem2ENEstimateItemStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQOrderItem2ENEstimateItemStatusShow.actFilterExecute(Sender: TObject);
begin
{frmRQOrderItem2ENEstimateItemStatusFilterEdit:=TfrmRQOrderItem2ENEstimateItemStatusFilterEdit.Create(Application, dsEdit);
  try
    RQOrderItem2ENEstimateItemStatusFilterObj := RQOrderItem2ENEstimateItemStatusFilter.Create;
    SetNullIntProps(RQOrderItem2ENEstimateItemStatusFilterObj);
    SetNullXSProps(RQOrderItem2ENEstimateItemStatusFilterObj);

    if frmRQOrderItem2ENEstimateItemStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQOrderItem2ENEstimateItemStatusFilter.Create;
      FilterObject := RQOrderItem2ENEstimateItemStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQOrderItem2ENEstimateItemStatusFilterEdit.Free;
    frmRQOrderItem2ENEstimateItemStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmRQOrderItem2ENEstimateItemStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.