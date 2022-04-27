
unit ShowSCCounterStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  SCCounterStatusController, AdvObj ;


type
  TfrmSCCounterStatusShow = class(TChildForm)  
  HTTPRIOSCCounterStatus: THTTPRIO;
    ImageList1: TImageList;
    sgSCCounterStatus: TAdvStringGrid;
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
procedure sgSCCounterStatusTopLeftChanged(Sender: TObject);
procedure sgSCCounterStatusDblClick(Sender: TObject);
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
 frmSCCounterStatusShow : TfrmSCCounterStatusShow;
 // SCCounterStatusObj: SCCounterStatus;
 // SCCounterStatusFilterObj: SCCounterStatusFilter;
  
  
implementation

uses Main, EditSCCounterStatus, EditSCCounterStatusFilter;


{$R *.dfm}

var
  //frmSCCounterStatusShow : TfrmSCCounterStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  SCCounterStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmSCCounterStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmSCCounterStatusShow:=nil;
    inherited;
  end;


procedure TfrmSCCounterStatusShow.FormShow(Sender: TObject);
var
  TempSCCounterStatus: SCCounterStatusControllerSoapPort;
  i: Integer;
  SCCounterStatusList: SCCounterStatusShortList;
  begin
  SetGridHeaders(SCCounterStatusHeaders, sgSCCounterStatus.ColumnHeaders);
  ColCount:=100;
  TempSCCounterStatus :=  HTTPRIOSCCounterStatus as SCCounterStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := SCCounterStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  SCCounterStatusList := TempSCCounterStatus.getScrollableFilteredList(SCCounterStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(SCCounterStatusList.list);

  if LastCount > -1 then
     sgSCCounterStatus.RowCount:=LastCount+2
  else
     sgSCCounterStatus.RowCount:=2;

   with sgSCCounterStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if SCCounterStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(SCCounterStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := SCCounterStatusList.list[i].name;
        LastRow:=i+1;
        sgSCCounterStatus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgSCCounterStatus.Row:=1;
end;

procedure TfrmSCCounterStatusShow.sgSCCounterStatusTopLeftChanged(Sender: TObject);
var
  TempSCCounterStatus: SCCounterStatusControllerSoapPort;
  i,CurrentRow: Integer;
  SCCounterStatusList: SCCounterStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgSCCounterStatus.TopRow + sgSCCounterStatus.VisibleRowCount) = ColCount
  then
    begin
      TempSCCounterStatus :=  HTTPRIOSCCounterStatus as SCCounterStatusControllerSoapPort;
      CurrentRow:=sgSCCounterStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := SCCounterStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  SCCounterStatusList := TempSCCounterStatus.getScrollableFilteredList(SCCounterStatusFilter(FilterObject),ColCount-1, 100);



  sgSCCounterStatus.RowCount:=sgSCCounterStatus.RowCount+100;
  LastCount:=High(SCCounterStatusList.list);
  with sgSCCounterStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if SCCounterStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(SCCounterStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := SCCounterStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgSCCounterStatus.Row:=CurrentRow-5;
   sgSCCounterStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmSCCounterStatusShow.sgSCCounterStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgSCCounterStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmSCCounterStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgSCCounterStatus.RowCount-1 do
   for j:=0 to sgSCCounterStatus.ColCount-1 do
     sgSCCounterStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmSCCounterStatusShow.actViewExecute(Sender: TObject);
Var TempSCCounterStatus: SCCounterStatusControllerSoapPort;
begin
 TempSCCounterStatus := HTTPRIOSCCounterStatus as SCCounterStatusControllerSoapPort;
   try
     SCCounterStatusObj := TempSCCounterStatus.getObject(StrToInt(sgSCCounterStatus.Cells[0,sgSCCounterStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmSCCounterStatusEdit:=TfrmSCCounterStatusEdit.Create(Application, dsView);
  try
    frmSCCounterStatusEdit.ShowModal;
  finally
    frmSCCounterStatusEdit.Free;
    frmSCCounterStatusEdit:=nil;
  end;
end;

procedure TfrmSCCounterStatusShow.actEditExecute(Sender: TObject);
Var TempSCCounterStatus: SCCounterStatusControllerSoapPort;
begin
 TempSCCounterStatus := HTTPRIOSCCounterStatus as SCCounterStatusControllerSoapPort;
   try
     SCCounterStatusObj := TempSCCounterStatus.getObject(StrToInt(sgSCCounterStatus.Cells[0,sgSCCounterStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmSCCounterStatusEdit:=TfrmSCCounterStatusEdit.Create(Application, dsEdit);
  try
    if frmSCCounterStatusEdit.ShowModal= mrOk then
      begin
        //TempSCCounterStatus.save(SCCounterStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmSCCounterStatusEdit.Free;
    frmSCCounterStatusEdit:=nil;
  end;
end;

procedure TfrmSCCounterStatusShow.actDeleteExecute(Sender: TObject);
Var TempSCCounterStatus: SCCounterStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempSCCounterStatus := HTTPRIOSCCounterStatus as SCCounterStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgSCCounterStatus.Cells[0,sgSCCounterStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статус лічю для SC) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempSCCounterStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmSCCounterStatusShow.actInsertExecute(Sender: TObject);
Var TempSCCounterStatus: SCCounterStatusControllerSoapPort;
begin
  TempSCCounterStatus := HTTPRIOSCCounterStatus as SCCounterStatusControllerSoapPort;
  SCCounterStatusObj:=SCCounterStatus.Create;



  try
    frmSCCounterStatusEdit:=TfrmSCCounterStatusEdit.Create(Application, dsInsert);
    try
      if frmSCCounterStatusEdit.ShowModal = mrOk then
      begin
        if SCCounterStatusObj<>nil then
            //TempSCCounterStatus.add(SCCounterStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmSCCounterStatusEdit.Free;
      frmSCCounterStatusEdit:=nil;
    end;
  finally
    SCCounterStatusObj.Free;
  end;
end;

procedure TfrmSCCounterStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmSCCounterStatusShow.actFilterExecute(Sender: TObject);
begin
{frmSCCounterStatusFilterEdit:=TfrmSCCounterStatusFilterEdit.Create(Application, dsInsert);
  try
    SCCounterStatusFilterObj := SCCounterStatusFilter.Create;
    SetNullIntProps(SCCounterStatusFilterObj);
    SetNullXSProps(SCCounterStatusFilterObj);

    if frmSCCounterStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := SCCounterStatusFilter.Create;
      FilterObject := SCCounterStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmSCCounterStatusFilterEdit.Free;
    frmSCCounterStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmSCCounterStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.