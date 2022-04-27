
unit ShowRQInvoiceStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQInvoiceStatusController ;


type
  TfrmRQInvoiceStatusShow = class(TChildForm)  
  HTTPRIORQInvoiceStatus: THTTPRIO;
    ImageList1: TImageList;
    sgRQInvoiceStatus: TAdvStringGrid;
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
procedure sgRQInvoiceStatusTopLeftChanged(Sender: TObject);
procedure sgRQInvoiceStatusDblClick(Sender: TObject);
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
 // RQInvoiceStatusObj: RQInvoiceStatus;
 // RQInvoiceStatusFilterObj: RQInvoiceStatusFilter;
  
  
implementation

uses Main, EditRQInvoiceStatus, EditRQInvoiceStatusFilter;


{$R *.dfm}

var
  //frmRQInvoiceStatusShow : TfrmRQInvoiceStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQInvoiceStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Статус накладної'
        );
   

procedure TfrmRQInvoiceStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQInvoiceStatusShow:=nil;
    inherited;
  end;


procedure TfrmRQInvoiceStatusShow.FormShow(Sender: TObject);
var
  TempRQInvoiceStatus: RQInvoiceStatusControllerSoapPort;
  i: Integer;
  RQInvoiceStatusList: RQInvoiceStatusShortList;
  begin
  SetGridHeaders(RQInvoiceStatusHeaders, sgRQInvoiceStatus.ColumnHeaders);
  ColCount:=100;
  TempRQInvoiceStatus :=  HTTPRIORQInvoiceStatus as RQInvoiceStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQInvoiceStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQInvoiceStatusList := TempRQInvoiceStatus.getScrollableFilteredList(RQInvoiceStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(RQInvoiceStatusList.list);

  if LastCount > -1 then
     sgRQInvoiceStatus.RowCount:=LastCount+2
  else
     sgRQInvoiceStatus.RowCount:=2;

   with sgRQInvoiceStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQInvoiceStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQInvoiceStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQInvoiceStatusList.list[i].name;
        LastRow:=i+1;
        sgRQInvoiceStatus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQInvoiceStatus.Row:=1;
end;

procedure TfrmRQInvoiceStatusShow.sgRQInvoiceStatusTopLeftChanged(Sender: TObject);
var
  TempRQInvoiceStatus: RQInvoiceStatusControllerSoapPort;
  i,CurrentRow: Integer;
  RQInvoiceStatusList: RQInvoiceStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQInvoiceStatus.TopRow + sgRQInvoiceStatus.VisibleRowCount) = ColCount
  then
    begin
      TempRQInvoiceStatus :=  HTTPRIORQInvoiceStatus as RQInvoiceStatusControllerSoapPort;
      CurrentRow:=sgRQInvoiceStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQInvoiceStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQInvoiceStatusList := TempRQInvoiceStatus.getScrollableFilteredList(RQInvoiceStatusFilter(FilterObject),ColCount-1, 100);



  sgRQInvoiceStatus.RowCount:=sgRQInvoiceStatus.RowCount+100;
  LastCount:=High(RQInvoiceStatusList.list);
  with sgRQInvoiceStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQInvoiceStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQInvoiceStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQInvoiceStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQInvoiceStatus.Row:=CurrentRow-5;
   sgRQInvoiceStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQInvoiceStatusShow.sgRQInvoiceStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQInvoiceStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQInvoiceStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQInvoiceStatus.RowCount-1 do
   for j:=0 to sgRQInvoiceStatus.ColCount-1 do
     sgRQInvoiceStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQInvoiceStatusShow.actViewExecute(Sender: TObject);
Var TempRQInvoiceStatus: RQInvoiceStatusControllerSoapPort;
begin
 TempRQInvoiceStatus := HTTPRIORQInvoiceStatus as RQInvoiceStatusControllerSoapPort;
   try
     RQInvoiceStatusObj := TempRQInvoiceStatus.getObject(StrToInt(sgRQInvoiceStatus.Cells[0,sgRQInvoiceStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQInvoiceStatusEdit:=TfrmRQInvoiceStatusEdit.Create(Application, dsView);
  try
    frmRQInvoiceStatusEdit.ShowModal;
  finally
    frmRQInvoiceStatusEdit.Free;
    frmRQInvoiceStatusEdit:=nil;
  end;
end;

procedure TfrmRQInvoiceStatusShow.actEditExecute(Sender: TObject);
Var TempRQInvoiceStatus: RQInvoiceStatusControllerSoapPort;
begin
 TempRQInvoiceStatus := HTTPRIORQInvoiceStatus as RQInvoiceStatusControllerSoapPort;
   try
     RQInvoiceStatusObj := TempRQInvoiceStatus.getObject(StrToInt(sgRQInvoiceStatus.Cells[0,sgRQInvoiceStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQInvoiceStatusEdit:=TfrmRQInvoiceStatusEdit.Create(Application, dsEdit);
  try
    if frmRQInvoiceStatusEdit.ShowModal= mrOk then
      begin
        //TempRQInvoiceStatus.save(RQInvoiceStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQInvoiceStatusEdit.Free;
    frmRQInvoiceStatusEdit:=nil;
  end;
end;

procedure TfrmRQInvoiceStatusShow.actDeleteExecute(Sender: TObject);
Var TempRQInvoiceStatus: RQInvoiceStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQInvoiceStatus := HTTPRIORQInvoiceStatus as RQInvoiceStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQInvoiceStatus.Cells[0,sgRQInvoiceStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статус накладної (создана/отраб и т.д.)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQInvoiceStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQInvoiceStatusShow.actInsertExecute(Sender: TObject);
Var TempRQInvoiceStatus: RQInvoiceStatusControllerSoapPort;
begin
  TempRQInvoiceStatus := HTTPRIORQInvoiceStatus as RQInvoiceStatusControllerSoapPort;
  RQInvoiceStatusObj:=RQInvoiceStatus.Create;



  try
    frmRQInvoiceStatusEdit:=TfrmRQInvoiceStatusEdit.Create(Application, dsInsert);
    try
      if frmRQInvoiceStatusEdit.ShowModal = mrOk then
      begin
        if RQInvoiceStatusObj<>nil then
            //TempRQInvoiceStatus.add(RQInvoiceStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQInvoiceStatusEdit.Free;
      frmRQInvoiceStatusEdit:=nil;
    end;
  finally
    RQInvoiceStatusObj.Free;
  end;
end;

procedure TfrmRQInvoiceStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQInvoiceStatusShow.actFilterExecute(Sender: TObject);
begin
{frmRQInvoiceStatusFilterEdit:=TfrmRQInvoiceStatusFilterEdit.Create(Application, dsEdit);
  try
    RQInvoiceStatusFilterObj := RQInvoiceStatusFilter.Create;
    SetNullIntProps(RQInvoiceStatusFilterObj);
    SetNullXSProps(RQInvoiceStatusFilterObj);

    if frmRQInvoiceStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQInvoiceStatusFilter.Create;
      FilterObject := RQInvoiceStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQInvoiceStatusFilterEdit.Free;
    frmRQInvoiceStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmRQInvoiceStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.