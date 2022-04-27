
unit ShowENDamageRecoveryStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENDamageRecoveryStatusController, AdvObj ;


type
  TfrmENDamageRecoveryStatusShow = class(TChildForm)  
  HTTPRIOENDamageRecoveryStatus: THTTPRIO;
    ImageList1: TImageList;
    sgENDamageRecoveryStatus: TAdvStringGrid;
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
procedure sgENDamageRecoveryStatusTopLeftChanged(Sender: TObject);
procedure sgENDamageRecoveryStatusDblClick(Sender: TObject);
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
 // ENDamageRecoveryStatusObj: ENDamageRecoveryStatus;
 // ENDamageRecoveryStatusFilterObj: ENDamageRecoveryStatusFilter;
  
  
implementation

uses Main, EditENDamageRecoveryStatus, EditENDamageRecoveryStatusFilter;


{$R *.dfm}

var
  //frmENDamageRecoveryStatusShow : TfrmENDamageRecoveryStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENDamageRecoveryStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Найменування статусу'
        );
   

procedure TfrmENDamageRecoveryStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENDamageRecoveryStatusShow:=nil;
    inherited;
  end;


procedure TfrmENDamageRecoveryStatusShow.FormShow(Sender: TObject);
var
  TempENDamageRecoveryStatus: ENDamageRecoveryStatusControllerSoapPort;
  i: Integer;
  ENDamageRecoveryStatusList: ENDamageRecoveryStatusShortList;
  begin
  SetGridHeaders(ENDamageRecoveryStatusHeaders, sgENDamageRecoveryStatus.ColumnHeaders);
  ColCount:=100;
  TempENDamageRecoveryStatus :=  HTTPRIOENDamageRecoveryStatus as ENDamageRecoveryStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENDamageRecoveryStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDamageRecoveryStatusList := TempENDamageRecoveryStatus.getScrollableFilteredList(ENDamageRecoveryStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(ENDamageRecoveryStatusList.list);

  if LastCount > -1 then
     sgENDamageRecoveryStatus.RowCount:=LastCount+2
  else
     sgENDamageRecoveryStatus.RowCount:=2;

   with sgENDamageRecoveryStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDamageRecoveryStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENDamageRecoveryStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENDamageRecoveryStatusList.list[i].name;
        LastRow:=i+1;
        sgENDamageRecoveryStatus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENDamageRecoveryStatus.Row:=1;
end;

procedure TfrmENDamageRecoveryStatusShow.sgENDamageRecoveryStatusTopLeftChanged(Sender: TObject);
var
  TempENDamageRecoveryStatus: ENDamageRecoveryStatusControllerSoapPort;
  i,CurrentRow: Integer;
  ENDamageRecoveryStatusList: ENDamageRecoveryStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENDamageRecoveryStatus.TopRow + sgENDamageRecoveryStatus.VisibleRowCount) = ColCount
  then
    begin
      TempENDamageRecoveryStatus :=  HTTPRIOENDamageRecoveryStatus as ENDamageRecoveryStatusControllerSoapPort;
      CurrentRow:=sgENDamageRecoveryStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENDamageRecoveryStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDamageRecoveryStatusList := TempENDamageRecoveryStatus.getScrollableFilteredList(ENDamageRecoveryStatusFilter(FilterObject),ColCount-1, 100);



  sgENDamageRecoveryStatus.RowCount:=sgENDamageRecoveryStatus.RowCount+100;
  LastCount:=High(ENDamageRecoveryStatusList.list);
  with sgENDamageRecoveryStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDamageRecoveryStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENDamageRecoveryStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENDamageRecoveryStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENDamageRecoveryStatus.Row:=CurrentRow-5;
   sgENDamageRecoveryStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENDamageRecoveryStatusShow.sgENDamageRecoveryStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENDamageRecoveryStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENDamageRecoveryStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENDamageRecoveryStatus.RowCount-1 do
   for j:=0 to sgENDamageRecoveryStatus.ColCount-1 do
     sgENDamageRecoveryStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENDamageRecoveryStatusShow.actViewExecute(Sender: TObject);
Var TempENDamageRecoveryStatus: ENDamageRecoveryStatusControllerSoapPort;
begin
 TempENDamageRecoveryStatus := HTTPRIOENDamageRecoveryStatus as ENDamageRecoveryStatusControllerSoapPort;
   try
     ENDamageRecoveryStatusObj := TempENDamageRecoveryStatus.getObject(StrToInt(sgENDamageRecoveryStatus.Cells[0,sgENDamageRecoveryStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDamageRecoveryStatusEdit:=TfrmENDamageRecoveryStatusEdit.Create(Application, dsView);
  try
    frmENDamageRecoveryStatusEdit.ShowModal;
  finally
    frmENDamageRecoveryStatusEdit.Free;
    frmENDamageRecoveryStatusEdit:=nil;
  end;
end;

procedure TfrmENDamageRecoveryStatusShow.actEditExecute(Sender: TObject);
Var TempENDamageRecoveryStatus: ENDamageRecoveryStatusControllerSoapPort;
begin
 TempENDamageRecoveryStatus := HTTPRIOENDamageRecoveryStatus as ENDamageRecoveryStatusControllerSoapPort;
   try
     ENDamageRecoveryStatusObj := TempENDamageRecoveryStatus.getObject(StrToInt(sgENDamageRecoveryStatus.Cells[0,sgENDamageRecoveryStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDamageRecoveryStatusEdit:=TfrmENDamageRecoveryStatusEdit.Create(Application, dsEdit);
  try
    if frmENDamageRecoveryStatusEdit.ShowModal= mrOk then
      begin
        //TempENDamageRecoveryStatus.save(ENDamageRecoveryStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENDamageRecoveryStatusEdit.Free;
    frmENDamageRecoveryStatusEdit:=nil;
  end;
end;

procedure TfrmENDamageRecoveryStatusShow.actDeleteExecute(Sender: TObject);
Var TempENDamageRecoveryStatus: ENDamageRecoveryStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempENDamageRecoveryStatus := HTTPRIOENDamageRecoveryStatus as ENDamageRecoveryStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDamageRecoveryStatus.Cells[0,sgENDamageRecoveryStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статус акту відшкодування збитків) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDamageRecoveryStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENDamageRecoveryStatusShow.actInsertExecute(Sender: TObject);
// Var TempENDamageRecoveryStatus: ENDamageRecoveryStatusControllerSoapPort; 
begin
  // TempENDamageRecoveryStatus := HTTPRIOENDamageRecoveryStatus as ENDamageRecoveryStatusControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENDamageRecoveryStatusObj:=ENDamageRecoveryStatus.Create;



  try
    frmENDamageRecoveryStatusEdit:=TfrmENDamageRecoveryStatusEdit.Create(Application, dsInsert);
    try
      if frmENDamageRecoveryStatusEdit.ShowModal = mrOk then
      begin
        if ENDamageRecoveryStatusObj<>nil then
            //TempENDamageRecoveryStatus.add(ENDamageRecoveryStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENDamageRecoveryStatusEdit.Free;
      frmENDamageRecoveryStatusEdit:=nil;
    end;
  finally
    ENDamageRecoveryStatusObj.Free;
  end;
end;

procedure TfrmENDamageRecoveryStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENDamageRecoveryStatusShow.actFilterExecute(Sender: TObject);
begin
{frmENDamageRecoveryStatusFilterEdit:=TfrmENDamageRecoveryStatusFilterEdit.Create(Application, dsInsert);
  try
    ENDamageRecoveryStatusFilterObj := ENDamageRecoveryStatusFilter.Create;
    SetNullIntProps(ENDamageRecoveryStatusFilterObj);
    SetNullXSProps(ENDamageRecoveryStatusFilterObj);

    if frmENDamageRecoveryStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENDamageRecoveryStatusFilter.Create;
      FilterObject := ENDamageRecoveryStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENDamageRecoveryStatusFilterEdit.Free;
    frmENDamageRecoveryStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmENDamageRecoveryStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.