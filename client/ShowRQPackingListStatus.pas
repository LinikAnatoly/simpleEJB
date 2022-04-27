
unit ShowRQPackingListStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQPackingListStatusController ;


type
  TfrmRQPackingListStatusShow = class(TChildForm)  
  HTTPRIORQPackingListStatus: THTTPRIO;
    ImageList1: TImageList;
    sgRQPackingListStatus: TAdvStringGrid;
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
procedure sgRQPackingListStatusTopLeftChanged(Sender: TObject);
procedure sgRQPackingListStatusDblClick(Sender: TObject);
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
 // RQPackingListStatusObj: RQPackingListStatus;
 // RQPackingListStatusFilterObj: RQPackingListStatusFilter;
  
  
implementation

uses Main, EditRQPackingListStatus, EditRQPackingListStatusFilter;


{$R *.dfm}

var
  //frmRQPackingListStatusShow : TfrmRQPackingListStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQPackingListStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Наименование статуса'
        );
   

procedure TfrmRQPackingListStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQPackingListStatusShow:=nil;
    inherited;
  end;


procedure TfrmRQPackingListStatusShow.FormShow(Sender: TObject);
var
  TempRQPackingListStatus: RQPackingListStatusControllerSoapPort;
  i: Integer;
  RQPackingListStatusList: RQPackingListStatusShortList;
  begin
  SetGridHeaders(RQPackingListStatusHeaders, sgRQPackingListStatus.ColumnHeaders);
  ColCount:=100;
  TempRQPackingListStatus :=  HTTPRIORQPackingListStatus as RQPackingListStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQPackingListStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPackingListStatusList := TempRQPackingListStatus.getScrollableFilteredList(RQPackingListStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(RQPackingListStatusList.list);

  if LastCount > -1 then
     sgRQPackingListStatus.RowCount:=LastCount+2
  else
     sgRQPackingListStatus.RowCount:=2;

   with sgRQPackingListStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPackingListStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQPackingListStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQPackingListStatusList.list[i].name;
        LastRow:=i+1;
        sgRQPackingListStatus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQPackingListStatus.Row:=1;
end;

procedure TfrmRQPackingListStatusShow.sgRQPackingListStatusTopLeftChanged(Sender: TObject);
var
  TempRQPackingListStatus: RQPackingListStatusControllerSoapPort;
  i,CurrentRow: Integer;
  RQPackingListStatusList: RQPackingListStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQPackingListStatus.TopRow + sgRQPackingListStatus.VisibleRowCount) = ColCount
  then
    begin
      TempRQPackingListStatus :=  HTTPRIORQPackingListStatus as RQPackingListStatusControllerSoapPort;
      CurrentRow:=sgRQPackingListStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQPackingListStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPackingListStatusList := TempRQPackingListStatus.getScrollableFilteredList(RQPackingListStatusFilter(FilterObject),ColCount-1, 100);



  sgRQPackingListStatus.RowCount:=sgRQPackingListStatus.RowCount+100;
  LastCount:=High(RQPackingListStatusList.list);
  with sgRQPackingListStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPackingListStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQPackingListStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQPackingListStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQPackingListStatus.Row:=CurrentRow-5;
   sgRQPackingListStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQPackingListStatusShow.sgRQPackingListStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQPackingListStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQPackingListStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQPackingListStatus.RowCount-1 do
   for j:=0 to sgRQPackingListStatus.ColCount-1 do
     sgRQPackingListStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQPackingListStatusShow.actViewExecute(Sender: TObject);
Var TempRQPackingListStatus: RQPackingListStatusControllerSoapPort;
begin
 TempRQPackingListStatus := HTTPRIORQPackingListStatus as RQPackingListStatusControllerSoapPort;
   try
     RQPackingListStatusObj := TempRQPackingListStatus.getObject(StrToInt(sgRQPackingListStatus.Cells[0,sgRQPackingListStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPackingListStatusEdit:=TfrmRQPackingListStatusEdit.Create(Application, dsView);
  try
    frmRQPackingListStatusEdit.ShowModal;
  finally
    frmRQPackingListStatusEdit.Free;
    frmRQPackingListStatusEdit:=nil;
  end;
end;

procedure TfrmRQPackingListStatusShow.actEditExecute(Sender: TObject);
Var TempRQPackingListStatus: RQPackingListStatusControllerSoapPort;
begin
 TempRQPackingListStatus := HTTPRIORQPackingListStatus as RQPackingListStatusControllerSoapPort;
   try
     RQPackingListStatusObj := TempRQPackingListStatus.getObject(StrToInt(sgRQPackingListStatus.Cells[0,sgRQPackingListStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPackingListStatusEdit:=TfrmRQPackingListStatusEdit.Create(Application, dsEdit);
  try
    if frmRQPackingListStatusEdit.ShowModal= mrOk then
      begin
        //TempRQPackingListStatus.save(RQPackingListStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQPackingListStatusEdit.Free;
    frmRQPackingListStatusEdit:=nil;
  end;
end;

procedure TfrmRQPackingListStatusShow.actDeleteExecute(Sender: TObject);
Var TempRQPackingListStatus: RQPackingListStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQPackingListStatus := HTTPRIORQPackingListStatus as RQPackingListStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQPackingListStatus.Cells[0,sgRQPackingListStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статусы погрузочной ведомости) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPackingListStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQPackingListStatusShow.actInsertExecute(Sender: TObject);
// Var TempRQPackingListStatus: RQPackingListStatusControllerSoapPort; 
begin
  // TempRQPackingListStatus := HTTPRIORQPackingListStatus as RQPackingListStatusControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQPackingListStatusObj:=RQPackingListStatus.Create;



  try
    frmRQPackingListStatusEdit:=TfrmRQPackingListStatusEdit.Create(Application, dsInsert);
    try
      if frmRQPackingListStatusEdit.ShowModal = mrOk then
      begin
        if RQPackingListStatusObj<>nil then
            //TempRQPackingListStatus.add(RQPackingListStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQPackingListStatusEdit.Free;
      frmRQPackingListStatusEdit:=nil;
    end;
  finally
    RQPackingListStatusObj.Free;
  end;
end;

procedure TfrmRQPackingListStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQPackingListStatusShow.actFilterExecute(Sender: TObject);
begin
{frmRQPackingListStatusFilterEdit:=TfrmRQPackingListStatusFilterEdit.Create(Application, dsInsert);
  try
    RQPackingListStatusFilterObj := RQPackingListStatusFilter.Create;
    SetNullIntProps(RQPackingListStatusFilterObj);
    SetNullXSProps(RQPackingListStatusFilterObj);

    if frmRQPackingListStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQPackingListStatusFilter.Create;
      FilterObject := RQPackingListStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQPackingListStatusFilterEdit.Free;
    frmRQPackingListStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmRQPackingListStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.