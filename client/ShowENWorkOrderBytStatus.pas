
unit ShowENWorkOrderBytStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENWorkOrderBytStatusController, AdvObj ;


type
  TfrmENWorkOrderBytStatusShow = class(TChildForm)  
  HTTPRIOENWorkOrderBytStatus: THTTPRIO;
    ImageList1: TImageList;
    sgENWorkOrderBytStatus: TAdvStringGrid;
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
procedure sgENWorkOrderBytStatusTopLeftChanged(Sender: TObject);
procedure sgENWorkOrderBytStatusDblClick(Sender: TObject);
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
 // ENWorkOrderBytStatusObj: ENWorkOrderBytStatus;
 // ENWorkOrderBytStatusFilterObj: ENWorkOrderBytStatusFilter;
  
  
implementation

uses Main, EditENWorkOrderBytStatus, EditENWorkOrderBytStatusFilter;


{$R *.dfm}

var
  //frmENWorkOrderBytStatusShow : TfrmENWorkOrderBytStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENWorkOrderBytStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Наименование'
        );
   

procedure TfrmENWorkOrderBytStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENWorkOrderBytStatusShow:=nil;
    inherited;
  end;


procedure TfrmENWorkOrderBytStatusShow.FormShow(Sender: TObject);
var
  TempENWorkOrderBytStatus: ENWorkOrderBytStatusControllerSoapPort;
  i: Integer;
  ENWorkOrderBytStatusList: ENWorkOrderBytStatusShortList;
begin
  SetGridHeaders(ENWorkOrderBytStatusHeaders, sgENWorkOrderBytStatus.ColumnHeaders);

  DisableActions([actInsert, actEdit, actDelete]);

  ColCount:=100;

  TempENWorkOrderBytStatus := HTTPRIOENWorkOrderBytStatus as ENWorkOrderBytStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENWorkOrderBytStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENWorkOrderBytStatusList := TempENWorkOrderBytStatus.getScrollableFilteredList(ENWorkOrderBytStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(ENWorkOrderBytStatusList.list);

  if LastCount > -1 then
     sgENWorkOrderBytStatus.RowCount:=LastCount+2
  else
     sgENWorkOrderBytStatus.RowCount:=2;

   with sgENWorkOrderBytStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENWorkOrderBytStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENWorkOrderBytStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENWorkOrderBytStatusList.list[i].name;
        LastRow:=i+1;
        sgENWorkOrderBytStatus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENWorkOrderBytStatus.Row:=1;
end;

procedure TfrmENWorkOrderBytStatusShow.sgENWorkOrderBytStatusTopLeftChanged(Sender: TObject);
var
  TempENWorkOrderBytStatus: ENWorkOrderBytStatusControllerSoapPort;
  i,CurrentRow: Integer;
  ENWorkOrderBytStatusList: ENWorkOrderBytStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENWorkOrderBytStatus.TopRow + sgENWorkOrderBytStatus.VisibleRowCount) = ColCount
  then
    begin
      TempENWorkOrderBytStatus :=  HTTPRIOENWorkOrderBytStatus as ENWorkOrderBytStatusControllerSoapPort;
      CurrentRow:=sgENWorkOrderBytStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENWorkOrderBytStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENWorkOrderBytStatusList := TempENWorkOrderBytStatus.getScrollableFilteredList(ENWorkOrderBytStatusFilter(FilterObject),ColCount-1, 100);



  sgENWorkOrderBytStatus.RowCount:=sgENWorkOrderBytStatus.RowCount+100;
  LastCount:=High(ENWorkOrderBytStatusList.list);
  with sgENWorkOrderBytStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENWorkOrderBytStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENWorkOrderBytStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENWorkOrderBytStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENWorkOrderBytStatus.Row:=CurrentRow-5;
   sgENWorkOrderBytStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENWorkOrderBytStatusShow.sgENWorkOrderBytStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENWorkOrderBytStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENWorkOrderBytStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENWorkOrderBytStatus.RowCount-1 do
   for j:=0 to sgENWorkOrderBytStatus.ColCount-1 do
     sgENWorkOrderBytStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENWorkOrderBytStatusShow.actViewExecute(Sender: TObject);
Var TempENWorkOrderBytStatus: ENWorkOrderBytStatusControllerSoapPort;
begin
 TempENWorkOrderBytStatus := HTTPRIOENWorkOrderBytStatus as ENWorkOrderBytStatusControllerSoapPort;
   try
     ENWorkOrderBytStatusObj := TempENWorkOrderBytStatus.getObject(StrToInt(sgENWorkOrderBytStatus.Cells[0,sgENWorkOrderBytStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENWorkOrderBytStatusEdit:=TfrmENWorkOrderBytStatusEdit.Create(Application, dsView);
  try
    frmENWorkOrderBytStatusEdit.ShowModal;
  finally
    frmENWorkOrderBytStatusEdit.Free;
    frmENWorkOrderBytStatusEdit:=nil;
  end;
end;

procedure TfrmENWorkOrderBytStatusShow.actEditExecute(Sender: TObject);
Var TempENWorkOrderBytStatus: ENWorkOrderBytStatusControllerSoapPort;
begin
 TempENWorkOrderBytStatus := HTTPRIOENWorkOrderBytStatus as ENWorkOrderBytStatusControllerSoapPort;
   try
     ENWorkOrderBytStatusObj := TempENWorkOrderBytStatus.getObject(StrToInt(sgENWorkOrderBytStatus.Cells[0,sgENWorkOrderBytStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENWorkOrderBytStatusEdit:=TfrmENWorkOrderBytStatusEdit.Create(Application, dsEdit);
  try
    if frmENWorkOrderBytStatusEdit.ShowModal= mrOk then
      begin
        //TempENWorkOrderBytStatus.save(ENWorkOrderBytStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENWorkOrderBytStatusEdit.Free;
    frmENWorkOrderBytStatusEdit:=nil;
  end;
end;

procedure TfrmENWorkOrderBytStatusShow.actDeleteExecute(Sender: TObject);
Var TempENWorkOrderBytStatus: ENWorkOrderBytStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempENWorkOrderBytStatus := HTTPRIOENWorkOrderBytStatus as ENWorkOrderBytStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgENWorkOrderBytStatus.Cells[0,sgENWorkOrderBytStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статуси змінних завдань для Енергозбуту) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENWorkOrderBytStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENWorkOrderBytStatusShow.actInsertExecute(Sender: TObject);
// Var TempENWorkOrderBytStatus: ENWorkOrderBytStatusControllerSoapPort; 
begin
  // TempENWorkOrderBytStatus := HTTPRIOENWorkOrderBytStatus as ENWorkOrderBytStatusControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENWorkOrderBytStatusObj:=ENWorkOrderBytStatus.Create;



  try
    frmENWorkOrderBytStatusEdit:=TfrmENWorkOrderBytStatusEdit.Create(Application, dsInsert);
    try
      if frmENWorkOrderBytStatusEdit.ShowModal = mrOk then
      begin
        if ENWorkOrderBytStatusObj<>nil then
            //TempENWorkOrderBytStatus.add(ENWorkOrderBytStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENWorkOrderBytStatusEdit.Free;
      frmENWorkOrderBytStatusEdit:=nil;
    end;
  finally
    ENWorkOrderBytStatusObj.Free;
  end;
end;

procedure TfrmENWorkOrderBytStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENWorkOrderBytStatusShow.actFilterExecute(Sender: TObject);
begin
{frmENWorkOrderBytStatusFilterEdit:=TfrmENWorkOrderBytStatusFilterEdit.Create(Application, dsInsert);
  try
    ENWorkOrderBytStatusFilterObj := ENWorkOrderBytStatusFilter.Create;
    SetNullIntProps(ENWorkOrderBytStatusFilterObj);
    SetNullXSProps(ENWorkOrderBytStatusFilterObj);

    if frmENWorkOrderBytStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENWorkOrderBytStatusFilter.Create;
      FilterObject := ENWorkOrderBytStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENWorkOrderBytStatusFilterEdit.Free;
    frmENWorkOrderBytStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmENWorkOrderBytStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.