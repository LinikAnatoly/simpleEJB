
unit ShowENTravelSheetStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTravelSheetStatusController, AdvObj ;


type
  TfrmENTravelSheetStatusShow = class(TChildForm)  
  HTTPRIOENTravelSheetStatus: THTTPRIO;
    ImageList1: TImageList;
    sgENTravelSheetStatus: TAdvStringGrid;
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
procedure sgENTravelSheetStatusTopLeftChanged(Sender: TObject);
procedure sgENTravelSheetStatusDblClick(Sender: TObject);
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
 frmENTravelSheetStatusShow : TfrmENTravelSheetStatusShow;
 // ENTravelSheetStatusObj: ENTravelSheetStatus;
 // ENTravelSheetStatusFilterObj: ENTravelSheetStatusFilter;
  
  
implementation

uses Main, EditENTravelSheetStatus, EditENTravelSheetStatusFilter;


{$R *.dfm}

var
  //frmENTravelSheetStatusShow : TfrmENTravelSheetStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTravelSheetStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmENTravelSheetStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTravelSheetStatusShow:=nil;
    inherited;
  end;


procedure TfrmENTravelSheetStatusShow.FormShow(Sender: TObject);
var
  TempENTravelSheetStatus: ENTravelSheetStatusControllerSoapPort;
  i: Integer;
  ENTravelSheetStatusList: ENTravelSheetStatusShortList;
  begin
  SetGridHeaders(ENTravelSheetStatusHeaders, sgENTravelSheetStatus.ColumnHeaders);
  ColCount:=100;
  TempENTravelSheetStatus :=  HTTPRIOENTravelSheetStatus as ENTravelSheetStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTravelSheetStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTravelSheetStatusList := TempENTravelSheetStatus.getScrollableFilteredList(ENTravelSheetStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTravelSheetStatusList.list);

  if LastCount > -1 then
     sgENTravelSheetStatus.RowCount:=LastCount+2
  else
     sgENTravelSheetStatus.RowCount:=2;

   with sgENTravelSheetStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTravelSheetStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTravelSheetStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENTravelSheetStatusList.list[i].name;
        LastRow:=i+1;
        sgENTravelSheetStatus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTravelSheetStatus.Row:=1;
end;

procedure TfrmENTravelSheetStatusShow.sgENTravelSheetStatusTopLeftChanged(Sender: TObject);
var
  TempENTravelSheetStatus: ENTravelSheetStatusControllerSoapPort;
  i,CurrentRow: Integer;
  ENTravelSheetStatusList: ENTravelSheetStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTravelSheetStatus.TopRow + sgENTravelSheetStatus.VisibleRowCount) = ColCount
  then
    begin
      TempENTravelSheetStatus :=  HTTPRIOENTravelSheetStatus as ENTravelSheetStatusControllerSoapPort;
      CurrentRow:=sgENTravelSheetStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTravelSheetStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTravelSheetStatusList := TempENTravelSheetStatus.getScrollableFilteredList(ENTravelSheetStatusFilter(FilterObject),ColCount-1, 100);



  sgENTravelSheetStatus.RowCount:=sgENTravelSheetStatus.RowCount+100;
  LastCount:=High(ENTravelSheetStatusList.list);
  with sgENTravelSheetStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTravelSheetStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTravelSheetStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENTravelSheetStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTravelSheetStatus.Row:=CurrentRow-5;
   sgENTravelSheetStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTravelSheetStatusShow.sgENTravelSheetStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTravelSheetStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTravelSheetStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTravelSheetStatus.RowCount-1 do
   for j:=0 to sgENTravelSheetStatus.ColCount-1 do
     sgENTravelSheetStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTravelSheetStatusShow.actViewExecute(Sender: TObject);
Var TempENTravelSheetStatus: ENTravelSheetStatusControllerSoapPort;
begin
 TempENTravelSheetStatus := HTTPRIOENTravelSheetStatus as ENTravelSheetStatusControllerSoapPort;
   try
     ENTravelSheetStatusObj := TempENTravelSheetStatus.getObject(StrToInt(sgENTravelSheetStatus.Cells[0,sgENTravelSheetStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTravelSheetStatusEdit:=TfrmENTravelSheetStatusEdit.Create(Application, dsView);
  try
    frmENTravelSheetStatusEdit.ShowModal;
  finally
    frmENTravelSheetStatusEdit.Free;
    frmENTravelSheetStatusEdit:=nil;
  end;
end;

procedure TfrmENTravelSheetStatusShow.actEditExecute(Sender: TObject);
Var TempENTravelSheetStatus: ENTravelSheetStatusControllerSoapPort;
begin
 TempENTravelSheetStatus := HTTPRIOENTravelSheetStatus as ENTravelSheetStatusControllerSoapPort;
   try
     ENTravelSheetStatusObj := TempENTravelSheetStatus.getObject(StrToInt(sgENTravelSheetStatus.Cells[0,sgENTravelSheetStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTravelSheetStatusEdit:=TfrmENTravelSheetStatusEdit.Create(Application, dsEdit);
  try
    if frmENTravelSheetStatusEdit.ShowModal= mrOk then
      begin
        //TempENTravelSheetStatus.save(ENTravelSheetStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTravelSheetStatusEdit.Free;
    frmENTravelSheetStatusEdit:=nil;
  end;
end;

procedure TfrmENTravelSheetStatusShow.actDeleteExecute(Sender: TObject);
Var TempENTravelSheetStatus: ENTravelSheetStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTravelSheetStatus := HTTPRIOENTravelSheetStatus as ENTravelSheetStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTravelSheetStatus.Cells[0,sgENTravelSheetStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статус подорожнього листа) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTravelSheetStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTravelSheetStatusShow.actInsertExecute(Sender: TObject);
Var TempENTravelSheetStatus: ENTravelSheetStatusControllerSoapPort;
begin
  TempENTravelSheetStatus := HTTPRIOENTravelSheetStatus as ENTravelSheetStatusControllerSoapPort;
  ENTravelSheetStatusObj:=ENTravelSheetStatus.Create;



  try
    frmENTravelSheetStatusEdit:=TfrmENTravelSheetStatusEdit.Create(Application, dsInsert);
    try
      if frmENTravelSheetStatusEdit.ShowModal = mrOk then
      begin
        if ENTravelSheetStatusObj<>nil then
            //TempENTravelSheetStatus.add(ENTravelSheetStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTravelSheetStatusEdit.Free;
      frmENTravelSheetStatusEdit:=nil;
    end;
  finally
    ENTravelSheetStatusObj.Free;
  end;
end;

procedure TfrmENTravelSheetStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTravelSheetStatusShow.actFilterExecute(Sender: TObject);
begin
{frmENTravelSheetStatusFilterEdit:=TfrmENTravelSheetStatusFilterEdit.Create(Application, dsInsert);
  try
    ENTravelSheetStatusFilterObj := ENTravelSheetStatusFilter.Create;
    SetNullIntProps(ENTravelSheetStatusFilterObj);
    SetNullXSProps(ENTravelSheetStatusFilterObj);

    if frmENTravelSheetStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTravelSheetStatusFilter.Create;
      FilterObject := ENTravelSheetStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTravelSheetStatusFilterEdit.Free;
    frmENTravelSheetStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmENTravelSheetStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.