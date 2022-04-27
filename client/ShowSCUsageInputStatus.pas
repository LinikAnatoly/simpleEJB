
unit ShowSCUsageInputStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  SCUsageInputStatusController, AdvObj ;


type
  TfrmSCUsageInputStatusShow = class(TChildForm)  
  HTTPRIOSCUsageInputStatus: THTTPRIO;
    ImageList1: TImageList;
    sgSCUsageInputStatus: TAdvStringGrid;
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
procedure sgSCUsageInputStatusTopLeftChanged(Sender: TObject);
procedure sgSCUsageInputStatusDblClick(Sender: TObject);
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

var
 frmSCUsageInputStatusShow : TfrmSCUsageInputStatusShow;
 // SCUsageInputStatusObj: SCUsageInputStatus;
 // SCUsageInputStatusFilterObj: SCUsageInputStatusFilter;
  
  
implementation

uses Main, EditSCUsageInputStatus, EditSCUsageInputStatusFilter;


{$R *.dfm}

var
  //frmSCUsageInputStatusShow : TfrmSCUsageInputStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  SCUsageInputStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmSCUsageInputStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmSCUsageInputStatusShow:=nil;
    inherited;
  end;


procedure TfrmSCUsageInputStatusShow.FormShow(Sender: TObject);
var
  TempSCUsageInputStatus: SCUsageInputStatusControllerSoapPort;
  i: Integer;
  SCUsageInputStatusList: SCUsageInputStatusShortList;
  begin
  SetGridHeaders(SCUsageInputStatusHeaders, sgSCUsageInputStatus.ColumnHeaders);
  ColCount:=100;
  TempSCUsageInputStatus :=  HTTPRIOSCUsageInputStatus as SCUsageInputStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := SCUsageInputStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  SCUsageInputStatusList := TempSCUsageInputStatus.getScrollableFilteredList(SCUsageInputStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(SCUsageInputStatusList.list);

  if LastCount > -1 then
     sgSCUsageInputStatus.RowCount:=LastCount+2
  else
     sgSCUsageInputStatus.RowCount:=2;

   with sgSCUsageInputStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if SCUsageInputStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(SCUsageInputStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := SCUsageInputStatusList.list[i].name;
        LastRow:=i+1;
        sgSCUsageInputStatus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgSCUsageInputStatus.Row:=1;
end;

procedure TfrmSCUsageInputStatusShow.sgSCUsageInputStatusTopLeftChanged(Sender: TObject);
var
  TempSCUsageInputStatus: SCUsageInputStatusControllerSoapPort;
  i,CurrentRow: Integer;
  SCUsageInputStatusList: SCUsageInputStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgSCUsageInputStatus.TopRow + sgSCUsageInputStatus.VisibleRowCount) = ColCount
  then
    begin
      TempSCUsageInputStatus :=  HTTPRIOSCUsageInputStatus as SCUsageInputStatusControllerSoapPort;
      CurrentRow:=sgSCUsageInputStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := SCUsageInputStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  SCUsageInputStatusList := TempSCUsageInputStatus.getScrollableFilteredList(SCUsageInputStatusFilter(FilterObject),ColCount-1, 100);



  sgSCUsageInputStatus.RowCount:=sgSCUsageInputStatus.RowCount+100;
  LastCount:=High(SCUsageInputStatusList.list);
  with sgSCUsageInputStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if SCUsageInputStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(SCUsageInputStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := SCUsageInputStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgSCUsageInputStatus.Row:=CurrentRow-5;
   sgSCUsageInputStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmSCUsageInputStatusShow.sgSCUsageInputStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgSCUsageInputStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmSCUsageInputStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgSCUsageInputStatus.RowCount-1 do
   for j:=0 to sgSCUsageInputStatus.ColCount-1 do
     sgSCUsageInputStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmSCUsageInputStatusShow.actViewExecute(Sender: TObject);
Var TempSCUsageInputStatus: SCUsageInputStatusControllerSoapPort;
begin
 TempSCUsageInputStatus := HTTPRIOSCUsageInputStatus as SCUsageInputStatusControllerSoapPort;
   try
     SCUsageInputStatusObj := TempSCUsageInputStatus.getObject(StrToInt(sgSCUsageInputStatus.Cells[0,sgSCUsageInputStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmSCUsageInputStatusEdit:=TfrmSCUsageInputStatusEdit.Create(Application, dsView);
  try
    frmSCUsageInputStatusEdit.ShowModal;
  finally
    frmSCUsageInputStatusEdit.Free;
    frmSCUsageInputStatusEdit:=nil;
  end;
end;

procedure TfrmSCUsageInputStatusShow.actEditExecute(Sender: TObject);
Var TempSCUsageInputStatus: SCUsageInputStatusControllerSoapPort;
begin
 TempSCUsageInputStatus := HTTPRIOSCUsageInputStatus as SCUsageInputStatusControllerSoapPort;
   try
     SCUsageInputStatusObj := TempSCUsageInputStatus.getObject(StrToInt(sgSCUsageInputStatus.Cells[0,sgSCUsageInputStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmSCUsageInputStatusEdit:=TfrmSCUsageInputStatusEdit.Create(Application, dsEdit);
  try
    if frmSCUsageInputStatusEdit.ShowModal= mrOk then
      begin
        //TempSCUsageInputStatus.save(SCUsageInputStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmSCUsageInputStatusEdit.Free;
    frmSCUsageInputStatusEdit:=nil;
  end;
end;

procedure TfrmSCUsageInputStatusShow.actDeleteExecute(Sender: TObject);
Var TempSCUsageInputStatus: SCUsageInputStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempSCUsageInputStatus := HTTPRIOSCUsageInputStatus as SCUsageInputStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgSCUsageInputStatus.Cells[0,sgSCUsageInputStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статус ОЗ1) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempSCUsageInputStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmSCUsageInputStatusShow.actInsertExecute(Sender: TObject);
Var TempSCUsageInputStatus: SCUsageInputStatusControllerSoapPort;
begin
  TempSCUsageInputStatus := HTTPRIOSCUsageInputStatus as SCUsageInputStatusControllerSoapPort;
  SCUsageInputStatusObj:=SCUsageInputStatus.Create;



  try
    frmSCUsageInputStatusEdit:=TfrmSCUsageInputStatusEdit.Create(Application, dsInsert);
    try
      if frmSCUsageInputStatusEdit.ShowModal = mrOk then
      begin
        if SCUsageInputStatusObj<>nil then
            //TempSCUsageInputStatus.add(SCUsageInputStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmSCUsageInputStatusEdit.Free;
      frmSCUsageInputStatusEdit:=nil;
    end;
  finally
    SCUsageInputStatusObj.Free;
  end;
end;

procedure TfrmSCUsageInputStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmSCUsageInputStatusShow.actFilterExecute(Sender: TObject);
begin
{frmSCUsageInputStatusFilterEdit:=TfrmSCUsageInputStatusFilterEdit.Create(Application, dsInsert);
  try
    SCUsageInputStatusFilterObj := SCUsageInputStatusFilter.Create;
    SetNullIntProps(SCUsageInputStatusFilterObj);
    SetNullXSProps(SCUsageInputStatusFilterObj);

    if frmSCUsageInputStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := SCUsageInputStatusFilter.Create;
      FilterObject := SCUsageInputStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmSCUsageInputStatusFilterEdit.Free;
    frmSCUsageInputStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmSCUsageInputStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.