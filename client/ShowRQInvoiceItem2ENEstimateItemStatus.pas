
unit ShowRQInvoiceItem2ENEstimateItemStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQInvoiceItem2ENEstimateItemStatusController ;


type
  TfrmRQInvoiceItem2ENEstimateItemStatusShow = class(TChildForm)  
  HTTPRIORQInvoiceItem2ENEstimateItemStatus: THTTPRIO;
    ImageList1: TImageList;
    sgRQInvoiceItem2ENEstimateItemStatus: TAdvStringGrid;
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
procedure sgRQInvoiceItem2ENEstimateItemStatusTopLeftChanged(Sender: TObject);
procedure sgRQInvoiceItem2ENEstimateItemStatusDblClick(Sender: TObject);
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
 // RQInvoiceItem2ENEstimateItemStatusObj: RQInvoiceItem2ENEstimateItemStatus;
 // RQInvoiceItem2ENEstimateItemStatusFilterObj: RQInvoiceItem2ENEstimateItemStatusFilter;
  
  
implementation

uses Main, EditRQInvoiceItem2ENEstimateItemStatus, EditRQInvoiceItem2ENEstimateItemStatusFilter;


{$R *.dfm}

var
  //frmRQInvoiceItem2ENEstimateItemStatusShow : TfrmRQInvoiceItem2ENEstimateItemStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQInvoiceItem2ENEstimateItemStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Наименование ед. изм.'
        );
   

procedure TfrmRQInvoiceItem2ENEstimateItemStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQInvoiceItem2ENEstimateItemStatusShow:=nil;
    inherited;
  end;


procedure TfrmRQInvoiceItem2ENEstimateItemStatusShow.FormShow(Sender: TObject);
var
  TempRQInvoiceItem2ENEstimateItemStatus: RQInvoiceItem2ENEstimateItemStatusControllerSoapPort;
  i: Integer;
  RQInvoiceItem2ENEstimateItemStatusList: RQInvoiceItem2ENEstimateItemStatusShortList;
  begin
  SetGridHeaders(RQInvoiceItem2ENEstimateItemStatusHeaders, sgRQInvoiceItem2ENEstimateItemStatus.ColumnHeaders);
  ColCount:=100;
  TempRQInvoiceItem2ENEstimateItemStatus :=  HTTPRIORQInvoiceItem2ENEstimateItemStatus as RQInvoiceItem2ENEstimateItemStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQInvoiceItem2ENEstimateItemStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQInvoiceItem2ENEstimateItemStatusList := TempRQInvoiceItem2ENEstimateItemStatus.getScrollableFilteredList(RQInvoiceItem2ENEstimateItemStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(RQInvoiceItem2ENEstimateItemStatusList.list);

  if LastCount > -1 then
     sgRQInvoiceItem2ENEstimateItemStatus.RowCount:=LastCount+2
  else
     sgRQInvoiceItem2ENEstimateItemStatus.RowCount:=2;

   with sgRQInvoiceItem2ENEstimateItemStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQInvoiceItem2ENEstimateItemStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQInvoiceItem2ENEstimateItemStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQInvoiceItem2ENEstimateItemStatusList.list[i].name;
        LastRow:=i+1;
        sgRQInvoiceItem2ENEstimateItemStatus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQInvoiceItem2ENEstimateItemStatus.Row:=1;
end;

procedure TfrmRQInvoiceItem2ENEstimateItemStatusShow.sgRQInvoiceItem2ENEstimateItemStatusTopLeftChanged(Sender: TObject);
var
  TempRQInvoiceItem2ENEstimateItemStatus: RQInvoiceItem2ENEstimateItemStatusControllerSoapPort;
  i,CurrentRow: Integer;
  RQInvoiceItem2ENEstimateItemStatusList: RQInvoiceItem2ENEstimateItemStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQInvoiceItem2ENEstimateItemStatus.TopRow + sgRQInvoiceItem2ENEstimateItemStatus.VisibleRowCount) = ColCount
  then
    begin
      TempRQInvoiceItem2ENEstimateItemStatus :=  HTTPRIORQInvoiceItem2ENEstimateItemStatus as RQInvoiceItem2ENEstimateItemStatusControllerSoapPort;
      CurrentRow:=sgRQInvoiceItem2ENEstimateItemStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQInvoiceItem2ENEstimateItemStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQInvoiceItem2ENEstimateItemStatusList := TempRQInvoiceItem2ENEstimateItemStatus.getScrollableFilteredList(RQInvoiceItem2ENEstimateItemStatusFilter(FilterObject),ColCount-1, 100);



  sgRQInvoiceItem2ENEstimateItemStatus.RowCount:=sgRQInvoiceItem2ENEstimateItemStatus.RowCount+100;
  LastCount:=High(RQInvoiceItem2ENEstimateItemStatusList.list);
  with sgRQInvoiceItem2ENEstimateItemStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQInvoiceItem2ENEstimateItemStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQInvoiceItem2ENEstimateItemStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQInvoiceItem2ENEstimateItemStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQInvoiceItem2ENEstimateItemStatus.Row:=CurrentRow-5;
   sgRQInvoiceItem2ENEstimateItemStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQInvoiceItem2ENEstimateItemStatusShow.sgRQInvoiceItem2ENEstimateItemStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQInvoiceItem2ENEstimateItemStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQInvoiceItem2ENEstimateItemStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQInvoiceItem2ENEstimateItemStatus.RowCount-1 do
   for j:=0 to sgRQInvoiceItem2ENEstimateItemStatus.ColCount-1 do
     sgRQInvoiceItem2ENEstimateItemStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQInvoiceItem2ENEstimateItemStatusShow.actViewExecute(Sender: TObject);
Var TempRQInvoiceItem2ENEstimateItemStatus: RQInvoiceItem2ENEstimateItemStatusControllerSoapPort;
begin
 TempRQInvoiceItem2ENEstimateItemStatus := HTTPRIORQInvoiceItem2ENEstimateItemStatus as RQInvoiceItem2ENEstimateItemStatusControllerSoapPort;
   try
     RQInvoiceItem2ENEstimateItemStatusObj := TempRQInvoiceItem2ENEstimateItemStatus.getObject(StrToInt(sgRQInvoiceItem2ENEstimateItemStatus.Cells[0,sgRQInvoiceItem2ENEstimateItemStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQInvoiceItem2ENEstimateItemStatusEdit:=TfrmRQInvoiceItem2ENEstimateItemStatusEdit.Create(Application, dsView);
  try
    frmRQInvoiceItem2ENEstimateItemStatusEdit.ShowModal;
  finally
    frmRQInvoiceItem2ENEstimateItemStatusEdit.Free;
    frmRQInvoiceItem2ENEstimateItemStatusEdit:=nil;
  end;
end;

procedure TfrmRQInvoiceItem2ENEstimateItemStatusShow.actEditExecute(Sender: TObject);
Var TempRQInvoiceItem2ENEstimateItemStatus: RQInvoiceItem2ENEstimateItemStatusControllerSoapPort;
begin
 TempRQInvoiceItem2ENEstimateItemStatus := HTTPRIORQInvoiceItem2ENEstimateItemStatus as RQInvoiceItem2ENEstimateItemStatusControllerSoapPort;
   try
     RQInvoiceItem2ENEstimateItemStatusObj := TempRQInvoiceItem2ENEstimateItemStatus.getObject(StrToInt(sgRQInvoiceItem2ENEstimateItemStatus.Cells[0,sgRQInvoiceItem2ENEstimateItemStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQInvoiceItem2ENEstimateItemStatusEdit:=TfrmRQInvoiceItem2ENEstimateItemStatusEdit.Create(Application, dsEdit);
  try
    if frmRQInvoiceItem2ENEstimateItemStatusEdit.ShowModal= mrOk then
      begin
        //TempRQInvoiceItem2ENEstimateItemStatus.save(RQInvoiceItem2ENEstimateItemStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQInvoiceItem2ENEstimateItemStatusEdit.Free;
    frmRQInvoiceItem2ENEstimateItemStatusEdit:=nil;
  end;
end;

procedure TfrmRQInvoiceItem2ENEstimateItemStatusShow.actDeleteExecute(Sender: TObject);
Var TempRQInvoiceItem2ENEstimateItemStatus: RQInvoiceItem2ENEstimateItemStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQInvoiceItem2ENEstimateItemStatus := HTTPRIORQInvoiceItem2ENEstimateItemStatus as RQInvoiceItem2ENEstimateItemStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQInvoiceItem2ENEstimateItemStatus.Cells[0,sgRQInvoiceItem2ENEstimateItemStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статусы связи строк накладной с материалами) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQInvoiceItem2ENEstimateItemStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQInvoiceItem2ENEstimateItemStatusShow.actInsertExecute(Sender: TObject);
Var TempRQInvoiceItem2ENEstimateItemStatus: RQInvoiceItem2ENEstimateItemStatusControllerSoapPort;
begin
  TempRQInvoiceItem2ENEstimateItemStatus := HTTPRIORQInvoiceItem2ENEstimateItemStatus as RQInvoiceItem2ENEstimateItemStatusControllerSoapPort;
  RQInvoiceItem2ENEstimateItemStatusObj:=RQInvoiceItem2ENEstimateItemStatus.Create;



  try
    frmRQInvoiceItem2ENEstimateItemStatusEdit:=TfrmRQInvoiceItem2ENEstimateItemStatusEdit.Create(Application, dsInsert);
    try
      if frmRQInvoiceItem2ENEstimateItemStatusEdit.ShowModal = mrOk then
      begin
        if RQInvoiceItem2ENEstimateItemStatusObj<>nil then
            //TempRQInvoiceItem2ENEstimateItemStatus.add(RQInvoiceItem2ENEstimateItemStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQInvoiceItem2ENEstimateItemStatusEdit.Free;
      frmRQInvoiceItem2ENEstimateItemStatusEdit:=nil;
    end;
  finally
    RQInvoiceItem2ENEstimateItemStatusObj.Free;
  end;
end;

procedure TfrmRQInvoiceItem2ENEstimateItemStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQInvoiceItem2ENEstimateItemStatusShow.actFilterExecute(Sender: TObject);
begin
{frmRQInvoiceItem2ENEstimateItemStatusFilterEdit:=TfrmRQInvoiceItem2ENEstimateItemStatusFilterEdit.Create(Application, dsEdit);
  try
    RQInvoiceItem2ENEstimateItemStatusFilterObj := RQInvoiceItem2ENEstimateItemStatusFilter.Create;
    SetNullIntProps(RQInvoiceItem2ENEstimateItemStatusFilterObj);
    SetNullXSProps(RQInvoiceItem2ENEstimateItemStatusFilterObj);

    if frmRQInvoiceItem2ENEstimateItemStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQInvoiceItem2ENEstimateItemStatusFilter.Create;
      FilterObject := RQInvoiceItem2ENEstimateItemStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQInvoiceItem2ENEstimateItemStatusFilterEdit.Free;
    frmRQInvoiceItem2ENEstimateItemStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmRQInvoiceItem2ENEstimateItemStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.