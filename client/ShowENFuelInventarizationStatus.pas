
unit ShowENFuelInventarizationStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENFuelInventarizationStatusController ;


type
  TfrmENFuelInventarizationStatusShow = class(TChildForm)  
  HTTPRIOENFuelInventarizationStatus: THTTPRIO;
    ImageList1: TImageList;
    sgENFuelInventarizationStatus: TAdvStringGrid;
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
procedure sgENFuelInventarizationStatusTopLeftChanged(Sender: TObject);
procedure sgENFuelInventarizationStatusDblClick(Sender: TObject);
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
 // ENFuelInventarizationStatusObj: ENFuelInventarizationStatus;
 // ENFuelInventarizationStatusFilterObj: ENFuelInventarizationStatusFilter;
  
  
implementation

uses Main, EditENFuelInventarizationStatus, EditENFuelInventarizationStatusFilter;


{$R *.dfm}

var
  //frmENFuelInventarizationStatusShow : TfrmENFuelInventarizationStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENFuelInventarizationStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Найменування статусу'
        );
   

procedure TfrmENFuelInventarizationStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENFuelInventarizationStatusShow:=nil;
    inherited;
  end;


procedure TfrmENFuelInventarizationStatusShow.FormShow(Sender: TObject);
var
  TempENFuelInventarizationStatus: ENFuelInventarizationStatusControllerSoapPort;
  i: Integer;
  ENFuelInventarizationStatusList: ENFuelInventarizationStatusShortList;
  begin
  SetGridHeaders(ENFuelInventarizationStatusHeaders, sgENFuelInventarizationStatus.ColumnHeaders);
  ColCount:=100;
  TempENFuelInventarizationStatus :=  HTTPRIOENFuelInventarizationStatus as ENFuelInventarizationStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENFuelInventarizationStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENFuelInventarizationStatusList := TempENFuelInventarizationStatus.getScrollableFilteredList(ENFuelInventarizationStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(ENFuelInventarizationStatusList.list);

  if LastCount > -1 then
     sgENFuelInventarizationStatus.RowCount:=LastCount+2
  else
     sgENFuelInventarizationStatus.RowCount:=2;

   with sgENFuelInventarizationStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFuelInventarizationStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENFuelInventarizationStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENFuelInventarizationStatusList.list[i].name;
        LastRow:=i+1;
        sgENFuelInventarizationStatus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENFuelInventarizationStatus.Row:=1;
end;

procedure TfrmENFuelInventarizationStatusShow.sgENFuelInventarizationStatusTopLeftChanged(Sender: TObject);
var
  TempENFuelInventarizationStatus: ENFuelInventarizationStatusControllerSoapPort;
  i,CurrentRow: Integer;
  ENFuelInventarizationStatusList: ENFuelInventarizationStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENFuelInventarizationStatus.TopRow + sgENFuelInventarizationStatus.VisibleRowCount) = ColCount
  then
    begin
      TempENFuelInventarizationStatus :=  HTTPRIOENFuelInventarizationStatus as ENFuelInventarizationStatusControllerSoapPort;
      CurrentRow:=sgENFuelInventarizationStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENFuelInventarizationStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENFuelInventarizationStatusList := TempENFuelInventarizationStatus.getScrollableFilteredList(ENFuelInventarizationStatusFilter(FilterObject),ColCount-1, 100);



  sgENFuelInventarizationStatus.RowCount:=sgENFuelInventarizationStatus.RowCount+100;
  LastCount:=High(ENFuelInventarizationStatusList.list);
  with sgENFuelInventarizationStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFuelInventarizationStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENFuelInventarizationStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENFuelInventarizationStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENFuelInventarizationStatus.Row:=CurrentRow-5;
   sgENFuelInventarizationStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENFuelInventarizationStatusShow.sgENFuelInventarizationStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENFuelInventarizationStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENFuelInventarizationStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENFuelInventarizationStatus.RowCount-1 do
   for j:=0 to sgENFuelInventarizationStatus.ColCount-1 do
     sgENFuelInventarizationStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENFuelInventarizationStatusShow.actViewExecute(Sender: TObject);
Var TempENFuelInventarizationStatus: ENFuelInventarizationStatusControllerSoapPort;
begin
 TempENFuelInventarizationStatus := HTTPRIOENFuelInventarizationStatus as ENFuelInventarizationStatusControllerSoapPort;
   try
     ENFuelInventarizationStatusObj := TempENFuelInventarizationStatus.getObject(StrToInt(sgENFuelInventarizationStatus.Cells[0,sgENFuelInventarizationStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENFuelInventarizationStatusEdit:=TfrmENFuelInventarizationStatusEdit.Create(Application, dsView);
  try
    frmENFuelInventarizationStatusEdit.ShowModal;
  finally
    frmENFuelInventarizationStatusEdit.Free;
    frmENFuelInventarizationStatusEdit:=nil;
  end;
end;

procedure TfrmENFuelInventarizationStatusShow.actEditExecute(Sender: TObject);
Var TempENFuelInventarizationStatus: ENFuelInventarizationStatusControllerSoapPort;
begin
 TempENFuelInventarizationStatus := HTTPRIOENFuelInventarizationStatus as ENFuelInventarizationStatusControllerSoapPort;
   try
     ENFuelInventarizationStatusObj := TempENFuelInventarizationStatus.getObject(StrToInt(sgENFuelInventarizationStatus.Cells[0,sgENFuelInventarizationStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENFuelInventarizationStatusEdit:=TfrmENFuelInventarizationStatusEdit.Create(Application, dsEdit);
  try
    if frmENFuelInventarizationStatusEdit.ShowModal= mrOk then
      begin
        //TempENFuelInventarizationStatus.save(ENFuelInventarizationStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENFuelInventarizationStatusEdit.Free;
    frmENFuelInventarizationStatusEdit:=nil;
  end;
end;

procedure TfrmENFuelInventarizationStatusShow.actDeleteExecute(Sender: TObject);
Var TempENFuelInventarizationStatus: ENFuelInventarizationStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempENFuelInventarizationStatus := HTTPRIOENFuelInventarizationStatus as ENFuelInventarizationStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgENFuelInventarizationStatus.Cells[0,sgENFuelInventarizationStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Строка інвентарізації палива) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENFuelInventarizationStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENFuelInventarizationStatusShow.actInsertExecute(Sender: TObject);
// Var TempENFuelInventarizationStatus: ENFuelInventarizationStatusControllerSoapPort; 
begin
  // TempENFuelInventarizationStatus := HTTPRIOENFuelInventarizationStatus as ENFuelInventarizationStatusControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENFuelInventarizationStatusObj:=ENFuelInventarizationStatus.Create;



  try
    frmENFuelInventarizationStatusEdit:=TfrmENFuelInventarizationStatusEdit.Create(Application, dsInsert);
    try
      if frmENFuelInventarizationStatusEdit.ShowModal = mrOk then
      begin
        if ENFuelInventarizationStatusObj<>nil then
            //TempENFuelInventarizationStatus.add(ENFuelInventarizationStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENFuelInventarizationStatusEdit.Free;
      frmENFuelInventarizationStatusEdit:=nil;
    end;
  finally
    ENFuelInventarizationStatusObj.Free;
  end;
end;

procedure TfrmENFuelInventarizationStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENFuelInventarizationStatusShow.actFilterExecute(Sender: TObject);
begin
{frmENFuelInventarizationStatusFilterEdit:=TfrmENFuelInventarizationStatusFilterEdit.Create(Application, dsInsert);
  try
    ENFuelInventarizationStatusFilterObj := ENFuelInventarizationStatusFilter.Create;
    SetNullIntProps(ENFuelInventarizationStatusFilterObj);
    SetNullXSProps(ENFuelInventarizationStatusFilterObj);

    if frmENFuelInventarizationStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENFuelInventarizationStatusFilter.Create;
      FilterObject := ENFuelInventarizationStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENFuelInventarizationStatusFilterEdit.Free;
    frmENFuelInventarizationStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmENFuelInventarizationStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.