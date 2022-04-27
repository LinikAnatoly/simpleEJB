
unit ShowENActIncomeStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENActIncomeStatusController ;


type
  TfrmENActIncomeStatusShow = class(TChildForm)  
  HTTPRIOENActIncomeStatus: THTTPRIO;
    ImageList1: TImageList;
    sgENActIncomeStatus: TAdvStringGrid;
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
procedure sgENActIncomeStatusTopLeftChanged(Sender: TObject);
procedure sgENActIncomeStatusDblClick(Sender: TObject);
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
 // ENActIncomeStatusObj: ENActIncomeStatus;
 // ENActIncomeStatusFilterObj: ENActIncomeStatusFilter;
  
  
implementation

uses Main, EditENActIncomeStatus, EditENActIncomeStatusFilter;


{$R *.dfm}

var
  //frmENActIncomeStatusShow : TfrmENActIncomeStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENActIncomeStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Статус прибуткового акту'
        );
   

procedure TfrmENActIncomeStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENActIncomeStatusShow:=nil;
    inherited;
  end;


procedure TfrmENActIncomeStatusShow.FormShow(Sender: TObject);
var
  TempENActIncomeStatus: ENActIncomeStatusControllerSoapPort;
  i: Integer;
  ENActIncomeStatusList: ENActIncomeStatusShortList;
  begin
  SetGridHeaders(ENActIncomeStatusHeaders, sgENActIncomeStatus.ColumnHeaders);
  ColCount:=100;
  TempENActIncomeStatus :=  HTTPRIOENActIncomeStatus as ENActIncomeStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENActIncomeStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENActIncomeStatusList := TempENActIncomeStatus.getScrollableFilteredList(ENActIncomeStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(ENActIncomeStatusList.list);

  if LastCount > -1 then
     sgENActIncomeStatus.RowCount:=LastCount+2
  else
     sgENActIncomeStatus.RowCount:=2;

   with sgENActIncomeStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActIncomeStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENActIncomeStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENActIncomeStatusList.list[i].name;
        LastRow:=i+1;
        sgENActIncomeStatus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENActIncomeStatus.Row:=1;
end;

procedure TfrmENActIncomeStatusShow.sgENActIncomeStatusTopLeftChanged(Sender: TObject);
var
  TempENActIncomeStatus: ENActIncomeStatusControllerSoapPort;
  i,CurrentRow: Integer;
  ENActIncomeStatusList: ENActIncomeStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENActIncomeStatus.TopRow + sgENActIncomeStatus.VisibleRowCount) = ColCount
  then
    begin
      TempENActIncomeStatus :=  HTTPRIOENActIncomeStatus as ENActIncomeStatusControllerSoapPort;
      CurrentRow:=sgENActIncomeStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENActIncomeStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENActIncomeStatusList := TempENActIncomeStatus.getScrollableFilteredList(ENActIncomeStatusFilter(FilterObject),ColCount-1, 100);



  sgENActIncomeStatus.RowCount:=sgENActIncomeStatus.RowCount+100;
  LastCount:=High(ENActIncomeStatusList.list);
  with sgENActIncomeStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActIncomeStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENActIncomeStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENActIncomeStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENActIncomeStatus.Row:=CurrentRow-5;
   sgENActIncomeStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENActIncomeStatusShow.sgENActIncomeStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENActIncomeStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENActIncomeStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENActIncomeStatus.RowCount-1 do
   for j:=0 to sgENActIncomeStatus.ColCount-1 do
     sgENActIncomeStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENActIncomeStatusShow.actViewExecute(Sender: TObject);
Var TempENActIncomeStatus: ENActIncomeStatusControllerSoapPort;
begin
 TempENActIncomeStatus := HTTPRIOENActIncomeStatus as ENActIncomeStatusControllerSoapPort;
   try
     ENActIncomeStatusObj := TempENActIncomeStatus.getObject(StrToInt(sgENActIncomeStatus.Cells[0,sgENActIncomeStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENActIncomeStatusEdit:=TfrmENActIncomeStatusEdit.Create(Application, dsView);
  try
    frmENActIncomeStatusEdit.ShowModal;
  finally
    frmENActIncomeStatusEdit.Free;
    frmENActIncomeStatusEdit:=nil;
  end;
end;

procedure TfrmENActIncomeStatusShow.actEditExecute(Sender: TObject);
Var TempENActIncomeStatus: ENActIncomeStatusControllerSoapPort;
begin
 TempENActIncomeStatus := HTTPRIOENActIncomeStatus as ENActIncomeStatusControllerSoapPort;
   try
     ENActIncomeStatusObj := TempENActIncomeStatus.getObject(StrToInt(sgENActIncomeStatus.Cells[0,sgENActIncomeStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENActIncomeStatusEdit:=TfrmENActIncomeStatusEdit.Create(Application, dsEdit);
  try
    if frmENActIncomeStatusEdit.ShowModal= mrOk then
      begin
        //TempENActIncomeStatus.save(ENActIncomeStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENActIncomeStatusEdit.Free;
    frmENActIncomeStatusEdit:=nil;
  end;
end;

procedure TfrmENActIncomeStatusShow.actDeleteExecute(Sender: TObject);
Var TempENActIncomeStatus: ENActIncomeStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempENActIncomeStatus := HTTPRIOENActIncomeStatus as ENActIncomeStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgENActIncomeStatus.Cells[0,sgENActIncomeStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статус прибуткового акту) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENActIncomeStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENActIncomeStatusShow.actInsertExecute(Sender: TObject);
Var TempENActIncomeStatus: ENActIncomeStatusControllerSoapPort;
begin
  TempENActIncomeStatus := HTTPRIOENActIncomeStatus as ENActIncomeStatusControllerSoapPort;
  ENActIncomeStatusObj:=ENActIncomeStatus.Create;



  try
    frmENActIncomeStatusEdit:=TfrmENActIncomeStatusEdit.Create(Application, dsInsert);
    try
      if frmENActIncomeStatusEdit.ShowModal = mrOk then
      begin
        if ENActIncomeStatusObj<>nil then
            //TempENActIncomeStatus.add(ENActIncomeStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENActIncomeStatusEdit.Free;
      frmENActIncomeStatusEdit:=nil;
    end;
  finally
    ENActIncomeStatusObj.Free;
  end;
end;

procedure TfrmENActIncomeStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENActIncomeStatusShow.actFilterExecute(Sender: TObject);
begin
{frmENActIncomeStatusFilterEdit:=TfrmENActIncomeStatusFilterEdit.Create(Application, dsInsert);
  try
    ENActIncomeStatusFilterObj := ENActIncomeStatusFilter.Create;
    SetNullIntProps(ENActIncomeStatusFilterObj);
    SetNullXSProps(ENActIncomeStatusFilterObj);

    if frmENActIncomeStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENActIncomeStatusFilter.Create;
      FilterObject := ENActIncomeStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENActIncomeStatusFilterEdit.Free;
    frmENActIncomeStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmENActIncomeStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.