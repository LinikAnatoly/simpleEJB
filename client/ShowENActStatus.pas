
unit ShowENActStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENActStatusController, AdvObj ;


type
  TfrmENActStatusShow = class(TChildForm)  
  HTTPRIOENActStatus: THTTPRIO;
    ImageList1: TImageList;
    sgENActStatus: TAdvStringGrid;
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
procedure sgENActStatusTopLeftChanged(Sender: TObject);
procedure sgENActStatusDblClick(Sender: TObject);
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
 frmENActStatusShow : TfrmENActStatusShow;
 // ENActStatusObj: ENActStatus;
 // ENActStatusFilterObj: ENActStatusFilter;
  
  
implementation

uses Main, EditENActStatus, EditENActStatusFilter;


{$R *.dfm}

var
  //frmENActStatusShow : TfrmENActStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENActStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Статус наряд завдання'
        );
   

procedure TfrmENActStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENActStatusShow:=nil;
    inherited;
  end;


procedure TfrmENActStatusShow.FormShow(Sender: TObject);
var
  TempENActStatus: ENActStatusControllerSoapPort;
  i: Integer;
  ENActStatusList: ENActStatusShortList;
  begin
  SetGridHeaders(ENActStatusHeaders, sgENActStatus.ColumnHeaders);
  ColCount:=100;
  TempENActStatus :=  HTTPRIOENActStatus as ENActStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENActStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENActStatusList := TempENActStatus.getScrollableFilteredList(ENActStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(ENActStatusList.list);

  if LastCount > -1 then
     sgENActStatus.RowCount:=LastCount+2
  else
     sgENActStatus.RowCount:=2;

   with sgENActStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENActStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENActStatusList.list[i].name;
        LastRow:=i+1;
        sgENActStatus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENActStatus.Row:=1;
end;

procedure TfrmENActStatusShow.sgENActStatusTopLeftChanged(Sender: TObject);
var
  TempENActStatus: ENActStatusControllerSoapPort;
  i,CurrentRow: Integer;
  ENActStatusList: ENActStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENActStatus.TopRow + sgENActStatus.VisibleRowCount) = ColCount
  then
    begin
      TempENActStatus :=  HTTPRIOENActStatus as ENActStatusControllerSoapPort;
      CurrentRow:=sgENActStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENActStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENActStatusList := TempENActStatus.getScrollableFilteredList(ENActStatusFilter(FilterObject),ColCount-1, 100);



  sgENActStatus.RowCount:=sgENActStatus.RowCount+100;
  LastCount:=High(ENActStatusList.list);
  with sgENActStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENActStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENActStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENActStatus.Row:=CurrentRow-5;
   sgENActStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENActStatusShow.sgENActStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENActStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENActStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENActStatus.RowCount-1 do
   for j:=0 to sgENActStatus.ColCount-1 do
     sgENActStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENActStatusShow.actViewExecute(Sender: TObject);
Var TempENActStatus: ENActStatusControllerSoapPort;
begin
 TempENActStatus := HTTPRIOENActStatus as ENActStatusControllerSoapPort;
   try
     ENActStatusObj := TempENActStatus.getObject(StrToInt(sgENActStatus.Cells[0,sgENActStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENActStatusEdit:=TfrmENActStatusEdit.Create(Application, dsView);
  try
    frmENActStatusEdit.ShowModal;
  finally
    frmENActStatusEdit.Free;
    frmENActStatusEdit:=nil;
  end;
end;

procedure TfrmENActStatusShow.actEditExecute(Sender: TObject);
Var TempENActStatus: ENActStatusControllerSoapPort;
begin
 TempENActStatus := HTTPRIOENActStatus as ENActStatusControllerSoapPort;
   try
     ENActStatusObj := TempENActStatus.getObject(StrToInt(sgENActStatus.Cells[0,sgENActStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENActStatusEdit:=TfrmENActStatusEdit.Create(Application, dsEdit);
  try
    if frmENActStatusEdit.ShowModal= mrOk then
      begin
        //TempENActStatus.save(ENActStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENActStatusEdit.Free;
    frmENActStatusEdit:=nil;
  end;
end;

procedure TfrmENActStatusShow.actDeleteExecute(Sender: TObject);
Var TempENActStatus: ENActStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempENActStatus := HTTPRIOENActStatus as ENActStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgENActStatus.Cells[0,sgENActStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статус наряд завдання) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENActStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENActStatusShow.actInsertExecute(Sender: TObject);
Var TempENActStatus: ENActStatusControllerSoapPort;
begin
  TempENActStatus := HTTPRIOENActStatus as ENActStatusControllerSoapPort;
  ENActStatusObj:=ENActStatus.Create;



  try
    frmENActStatusEdit:=TfrmENActStatusEdit.Create(Application, dsInsert);
    try
      if frmENActStatusEdit.ShowModal = mrOk then
      begin
        if ENActStatusObj<>nil then
            //TempENActStatus.add(ENActStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENActStatusEdit.Free;
      frmENActStatusEdit:=nil;
    end;
  finally
    ENActStatusObj.Free;
  end;
end;

procedure TfrmENActStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENActStatusShow.actFilterExecute(Sender: TObject);
begin
{frmENActStatusFilterEdit:=TfrmENActStatusFilterEdit.Create(Application, dsEdit);
  try
    ENActStatusFilterObj := ENActStatusFilter.Create;
    SetNullIntProps(ENActStatusFilterObj);
    SetNullXSProps(ENActStatusFilterObj);

    if frmENActStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENActStatusFilter.Create;
      FilterObject := ENActStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENActStatusFilterEdit.Free;
    frmENActStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmENActStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.