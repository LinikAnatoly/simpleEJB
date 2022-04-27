
unit ShowENMolStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENMolStatusController, AdvObj ;


type
  TfrmENMolStatusShow = class(TChildForm)  
  HTTPRIOENMolStatus: THTTPRIO;
    ImageList1: TImageList;
    sgENMolStatus: TAdvStringGrid;
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
procedure sgENMolStatusTopLeftChanged(Sender: TObject);
procedure sgENMolStatusDblClick(Sender: TObject);
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
 frmENMolStatusShow : TfrmENMolStatusShow;
 // ENMolStatusObj: ENMolStatus;
 // ENMolStatusFilterObj: ENMolStatusFilter;
  
  
implementation

uses Main, EditENMolStatus, EditENMolStatusFilter;


{$R *.dfm}

var
  //frmENMolStatusShow : TfrmENMolStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENMolStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Статус МВО'
        );
   

procedure TfrmENMolStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENMolStatusShow:=nil;
    inherited;
  end;


procedure TfrmENMolStatusShow.FormShow(Sender: TObject);
var
  TempENMolStatus: ENMolStatusControllerSoapPort;
  i: Integer;
  ENMolStatusList: ENMolStatusShortList;
  begin
  SetGridHeaders(ENMolStatusHeaders, sgENMolStatus.ColumnHeaders);
  ColCount:=100;
  TempENMolStatus :=  HTTPRIOENMolStatus as ENMolStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENMolStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMolStatusList := TempENMolStatus.getScrollableFilteredList(ENMolStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(ENMolStatusList.list);

  if LastCount > -1 then
     sgENMolStatus.RowCount:=LastCount+2
  else
     sgENMolStatus.RowCount:=2;

   with sgENMolStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMolStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENMolStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENMolStatusList.list[i].name;
        LastRow:=i+1;
        sgENMolStatus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENMolStatus.Row:=1;
end;

procedure TfrmENMolStatusShow.sgENMolStatusTopLeftChanged(Sender: TObject);
var
  TempENMolStatus: ENMolStatusControllerSoapPort;
  i,CurrentRow: Integer;
  ENMolStatusList: ENMolStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENMolStatus.TopRow + sgENMolStatus.VisibleRowCount) = ColCount
  then
    begin
      TempENMolStatus :=  HTTPRIOENMolStatus as ENMolStatusControllerSoapPort;
      CurrentRow:=sgENMolStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENMolStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMolStatusList := TempENMolStatus.getScrollableFilteredList(ENMolStatusFilter(FilterObject),ColCount-1, 100);



  sgENMolStatus.RowCount:=sgENMolStatus.RowCount+100;
  LastCount:=High(ENMolStatusList.list);
  with sgENMolStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMolStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENMolStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENMolStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENMolStatus.Row:=CurrentRow-5;
   sgENMolStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENMolStatusShow.sgENMolStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENMolStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENMolStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENMolStatus.RowCount-1 do
   for j:=0 to sgENMolStatus.ColCount-1 do
     sgENMolStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENMolStatusShow.actViewExecute(Sender: TObject);
Var TempENMolStatus: ENMolStatusControllerSoapPort;
begin
 TempENMolStatus := HTTPRIOENMolStatus as ENMolStatusControllerSoapPort;
   try
     ENMolStatusObj := TempENMolStatus.getObject(StrToInt(sgENMolStatus.Cells[0,sgENMolStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMolStatusEdit:=TfrmENMolStatusEdit.Create(Application, dsView);
  try
    frmENMolStatusEdit.ShowModal;
  finally
    frmENMolStatusEdit.Free;
    frmENMolStatusEdit:=nil;
  end;
end;

procedure TfrmENMolStatusShow.actEditExecute(Sender: TObject);
Var TempENMolStatus: ENMolStatusControllerSoapPort;
begin
 TempENMolStatus := HTTPRIOENMolStatus as ENMolStatusControllerSoapPort;
   try
     ENMolStatusObj := TempENMolStatus.getObject(StrToInt(sgENMolStatus.Cells[0,sgENMolStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMolStatusEdit:=TfrmENMolStatusEdit.Create(Application, dsEdit);
  try
    if frmENMolStatusEdit.ShowModal= mrOk then
      begin
        //TempENMolStatus.save(ENMolStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENMolStatusEdit.Free;
    frmENMolStatusEdit:=nil;
  end;
end;

procedure TfrmENMolStatusShow.actDeleteExecute(Sender: TObject);
Var TempENMolStatus: ENMolStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempENMolStatus := HTTPRIOENMolStatus as ENMolStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgENMolStatus.Cells[0,sgENMolStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статус МВО) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENMolStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENMolStatusShow.actInsertExecute(Sender: TObject);
Var TempENMolStatus: ENMolStatusControllerSoapPort;
begin
  TempENMolStatus := HTTPRIOENMolStatus as ENMolStatusControllerSoapPort;
  ENMolStatusObj:=ENMolStatus.Create;



  try
    frmENMolStatusEdit:=TfrmENMolStatusEdit.Create(Application, dsInsert);
    try
      if frmENMolStatusEdit.ShowModal = mrOk then
      begin
        if ENMolStatusObj<>nil then
            //TempENMolStatus.add(ENMolStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENMolStatusEdit.Free;
      frmENMolStatusEdit:=nil;
    end;
  finally
    ENMolStatusObj.Free;
  end;
end;

procedure TfrmENMolStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENMolStatusShow.actFilterExecute(Sender: TObject);
begin
{frmENMolStatusFilterEdit:=TfrmENMolStatusFilterEdit.Create(Application, dsInsert);
  try
    ENMolStatusFilterObj := ENMolStatusFilter.Create;
    SetNullIntProps(ENMolStatusFilterObj);
    SetNullXSProps(ENMolStatusFilterObj);

    if frmENMolStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENMolStatusFilter.Create;
      FilterObject := ENMolStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENMolStatusFilterEdit.Free;
    frmENMolStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmENMolStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.