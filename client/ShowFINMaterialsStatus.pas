
unit ShowFINMaterialsStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  FINMaterialsStatusController ;


type
  TfrmFINMaterialsStatusShow = class(TChildForm)  
  HTTPRIOFINMaterialsStatus: THTTPRIO;
    ImageList1: TImageList;
    sgFINMaterialsStatus: TAdvStringGrid;
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
procedure sgFINMaterialsStatusTopLeftChanged(Sender: TObject);
procedure sgFINMaterialsStatusDblClick(Sender: TObject);
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
 // FINMaterialsStatusObj: FINMaterialsStatus;
 // FINMaterialsStatusFilterObj: FINMaterialsStatusFilter;
  
  
implementation

uses Main, EditFINMaterialsStatus, EditFINMaterialsStatusFilter;


{$R *.dfm}

var
  //frmFINMaterialsStatusShow : TfrmFINMaterialsStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  FINMaterialsStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Статус наряд завдання'
        );
   

procedure TfrmFINMaterialsStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmFINMaterialsStatusShow:=nil;
    inherited;
  end;


procedure TfrmFINMaterialsStatusShow.FormShow(Sender: TObject);
var
  TempFINMaterialsStatus: FINMaterialsStatusControllerSoapPort;
  i: Integer;
  FINMaterialsStatusList: FINMaterialsStatusShortList;
  begin
  SetGridHeaders(FINMaterialsStatusHeaders, sgFINMaterialsStatus.ColumnHeaders);
  ColCount:=100;
  TempFINMaterialsStatus :=  HTTPRIOFINMaterialsStatus as FINMaterialsStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := FINMaterialsStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FINMaterialsStatusList := TempFINMaterialsStatus.getScrollableFilteredList(FINMaterialsStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(FINMaterialsStatusList.list);

  if LastCount > -1 then
     sgFINMaterialsStatus.RowCount:=LastCount+2
  else
     sgFINMaterialsStatus.RowCount:=2;

   with sgFINMaterialsStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINMaterialsStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(FINMaterialsStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := FINMaterialsStatusList.list[i].name;
        LastRow:=i+1;
        sgFINMaterialsStatus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgFINMaterialsStatus.Row:=1;
end;

procedure TfrmFINMaterialsStatusShow.sgFINMaterialsStatusTopLeftChanged(Sender: TObject);
var
  TempFINMaterialsStatus: FINMaterialsStatusControllerSoapPort;
  i,CurrentRow: Integer;
  FINMaterialsStatusList: FINMaterialsStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgFINMaterialsStatus.TopRow + sgFINMaterialsStatus.VisibleRowCount) = ColCount
  then
    begin
      TempFINMaterialsStatus :=  HTTPRIOFINMaterialsStatus as FINMaterialsStatusControllerSoapPort;
      CurrentRow:=sgFINMaterialsStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := FINMaterialsStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FINMaterialsStatusList := TempFINMaterialsStatus.getScrollableFilteredList(FINMaterialsStatusFilter(FilterObject),ColCount-1, 100);



  sgFINMaterialsStatus.RowCount:=sgFINMaterialsStatus.RowCount+100;
  LastCount:=High(FINMaterialsStatusList.list);
  with sgFINMaterialsStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINMaterialsStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(FINMaterialsStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := FINMaterialsStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgFINMaterialsStatus.Row:=CurrentRow-5;
   sgFINMaterialsStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmFINMaterialsStatusShow.sgFINMaterialsStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgFINMaterialsStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmFINMaterialsStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgFINMaterialsStatus.RowCount-1 do
   for j:=0 to sgFINMaterialsStatus.ColCount-1 do
     sgFINMaterialsStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmFINMaterialsStatusShow.actViewExecute(Sender: TObject);
Var TempFINMaterialsStatus: FINMaterialsStatusControllerSoapPort;
begin
 TempFINMaterialsStatus := HTTPRIOFINMaterialsStatus as FINMaterialsStatusControllerSoapPort;
   try
     FINMaterialsStatusObj := TempFINMaterialsStatus.getObject(StrToInt(sgFINMaterialsStatus.Cells[0,sgFINMaterialsStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINMaterialsStatusEdit:=TfrmFINMaterialsStatusEdit.Create(Application, dsView);
  try
    frmFINMaterialsStatusEdit.ShowModal;
  finally
    frmFINMaterialsStatusEdit.Free;
    frmFINMaterialsStatusEdit:=nil;
  end;
end;

procedure TfrmFINMaterialsStatusShow.actEditExecute(Sender: TObject);
Var TempFINMaterialsStatus: FINMaterialsStatusControllerSoapPort;
begin
 TempFINMaterialsStatus := HTTPRIOFINMaterialsStatus as FINMaterialsStatusControllerSoapPort;
   try
     FINMaterialsStatusObj := TempFINMaterialsStatus.getObject(StrToInt(sgFINMaterialsStatus.Cells[0,sgFINMaterialsStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINMaterialsStatusEdit:=TfrmFINMaterialsStatusEdit.Create(Application, dsEdit);
  try
    if frmFINMaterialsStatusEdit.ShowModal= mrOk then
      begin
        //TempFINMaterialsStatus.save(FINMaterialsStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmFINMaterialsStatusEdit.Free;
    frmFINMaterialsStatusEdit:=nil;
  end;
end;

procedure TfrmFINMaterialsStatusShow.actDeleteExecute(Sender: TObject);
Var TempFINMaterialsStatus: FINMaterialsStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempFINMaterialsStatus := HTTPRIOFINMaterialsStatus as FINMaterialsStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgFINMaterialsStatus.Cells[0,sgFINMaterialsStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статус резервированного материала) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempFINMaterialsStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmFINMaterialsStatusShow.actInsertExecute(Sender: TObject);
Var TempFINMaterialsStatus: FINMaterialsStatusControllerSoapPort;
begin
  TempFINMaterialsStatus := HTTPRIOFINMaterialsStatus as FINMaterialsStatusControllerSoapPort;
  FINMaterialsStatusObj:=FINMaterialsStatus.Create;



  try
    frmFINMaterialsStatusEdit:=TfrmFINMaterialsStatusEdit.Create(Application, dsInsert);
    try
      if frmFINMaterialsStatusEdit.ShowModal = mrOk then
      begin
        if FINMaterialsStatusObj<>nil then
            //TempFINMaterialsStatus.add(FINMaterialsStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmFINMaterialsStatusEdit.Free;
      frmFINMaterialsStatusEdit:=nil;
    end;
  finally
    FINMaterialsStatusObj.Free;
  end;
end;

procedure TfrmFINMaterialsStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmFINMaterialsStatusShow.actFilterExecute(Sender: TObject);
begin
{frmFINMaterialsStatusFilterEdit:=TfrmFINMaterialsStatusFilterEdit.Create(Application, dsEdit);
  try
    FINMaterialsStatusFilterObj := FINMaterialsStatusFilter.Create;
    SetNullIntProps(FINMaterialsStatusFilterObj);
    SetNullXSProps(FINMaterialsStatusFilterObj);

    if frmFINMaterialsStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := FINMaterialsStatusFilter.Create;
      FilterObject := FINMaterialsStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmFINMaterialsStatusFilterEdit.Free;
    frmFINMaterialsStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmFINMaterialsStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.