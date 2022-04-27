
unit ShowENBuildingStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENBuildingStatusController, AdvObj ;


type
    TfrmENBuildingStatusShow = class(TChildForm)  
    HTTPRIOENBuildingStatus: THTTPRIO;
    ImageList1: TImageList;
    sgENBuildingStatus: TAdvStringGrid;
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
    procedure sgENBuildingStatusTopLeftChanged(Sender: TObject);
    procedure sgENBuildingStatusDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
   selectedRow: Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;


var
  frmENBuildingStatusShow: TfrmENBuildingStatusShow;
  
  
implementation

uses Main, EditENBuildingStatus, EditENBuildingStatusFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENBuildingStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Статус документу Нове будівництво'
        );
   

procedure TfrmENBuildingStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENBuildingStatusShow:=nil;
  inherited;
end;


procedure TfrmENBuildingStatusShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENBuildingStatusShow.FormShow(Sender: TObject);
var
  TempENBuildingStatus: ENBuildingStatusControllerSoapPort;
  i: Integer;
  ENBuildingStatusList: ENBuildingStatusShortList;
begin
  SetGridHeaders(ENBuildingStatusHeaders, sgENBuildingStatus.ColumnHeaders);
  ColCount:=100;
  TempENBuildingStatus :=  HTTPRIOENBuildingStatus as ENBuildingStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENBuildingStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBuildingStatusList := TempENBuildingStatus.getScrollableFilteredList(ENBuildingStatusFilter(FilterObject),0,ColCount);
  LastCount:=High(ENBuildingStatusList.list);

  if LastCount > -1 then
     sgENBuildingStatus.RowCount:=LastCount+2
  else
     sgENBuildingStatus.RowCount:=2;

   with sgENBuildingStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBuildingStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENBuildingStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENBuildingStatusList.list[i].name;
        LastRow:=i+1;
        sgENBuildingStatus.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENBuildingStatus.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENBuildingStatus.RowCount > selectedRow then
      sgENBuildingStatus.Row := selectedRow
    else
      sgENBuildingStatus.Row := sgENBuildingStatus.RowCount - 1;
    end
    else
      sgENBuildingStatus.Row:=1;   
end;


procedure TfrmENBuildingStatusShow.sgENBuildingStatusTopLeftChanged(Sender: TObject);
var
  TempENBuildingStatus: ENBuildingStatusControllerSoapPort;
  i,CurrentRow: Integer;
  ENBuildingStatusList: ENBuildingStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENBuildingStatus.TopRow + sgENBuildingStatus.VisibleRowCount) = ColCount
  then
    begin
      TempENBuildingStatus :=  HTTPRIOENBuildingStatus as ENBuildingStatusControllerSoapPort;
      CurrentRow:=sgENBuildingStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENBuildingStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBuildingStatusList := TempENBuildingStatus.getScrollableFilteredList(ENBuildingStatusFilter(FilterObject),ColCount-1, 100);


  sgENBuildingStatus.RowCount:=sgENBuildingStatus.RowCount+100;
  LastCount:=High(ENBuildingStatusList.list);
  with sgENBuildingStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBuildingStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENBuildingStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENBuildingStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENBuildingStatus.Row:=CurrentRow-5;
   sgENBuildingStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENBuildingStatusShow.sgENBuildingStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENBuildingStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENBuildingStatusShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENBuildingStatus.RowCount-1 do
   for j:=0 to sgENBuildingStatus.ColCount-1 do
     sgENBuildingStatus.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENBuildingStatusShow.actViewExecute(Sender: TObject);
var 
  TempENBuildingStatus: ENBuildingStatusControllerSoapPort;
begin
  TempENBuildingStatus := HTTPRIOENBuildingStatus as ENBuildingStatusControllerSoapPort;
  try
    ENBuildingStatusObj := TempENBuildingStatus.getObject(StrToInt(sgENBuildingStatus.Cells[0,sgENBuildingStatus.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENBuildingStatus.Row;
  frmENBuildingStatusEdit:=TfrmENBuildingStatusEdit.Create(Application, dsView);
  
  try
    frmENBuildingStatusEdit.ShowModal;
  finally
    frmENBuildingStatusEdit.Free;
    frmENBuildingStatusEdit:=nil;
  end;

  if sgENBuildingStatus.RowCount > selectedRow then
    sgENBuildingStatus.Row := selectedRow
  else
    sgENBuildingStatus.Row := sgENBuildingStatus.RowCount - 1;
  
end;


procedure TfrmENBuildingStatusShow.actEditExecute(Sender: TObject);
var 
  TempENBuildingStatus: ENBuildingStatusControllerSoapPort;
begin
  TempENBuildingStatus := HTTPRIOENBuildingStatus as ENBuildingStatusControllerSoapPort;
  try
    ENBuildingStatusObj := TempENBuildingStatus.getObject(StrToInt(sgENBuildingStatus.Cells[0,sgENBuildingStatus.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENBuildingStatus.Row;
  frmENBuildingStatusEdit:=TfrmENBuildingStatusEdit.Create(Application, dsEdit);
  
  try
    if frmENBuildingStatusEdit.ShowModal= mrOk then
      begin
        //TempENBuildingStatus.save(ENBuildingStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENBuildingStatusEdit.Free;
    frmENBuildingStatusEdit:=nil;
  end;

  if sgENBuildingStatus.RowCount > selectedRow then
    sgENBuildingStatus.Row := selectedRow
  else
    sgENBuildingStatus.Row := sgENBuildingStatus.RowCount - 1;
  
end;


procedure TfrmENBuildingStatusShow.actDeleteExecute(Sender: TObject);
Var TempENBuildingStatus: ENBuildingStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempENBuildingStatus := HTTPRIOENBuildingStatus as ENBuildingStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgENBuildingStatus.Cells[0,sgENBuildingStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Статус Нове будівництво)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENBuildingStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENBuildingStatusShow.actInsertExecute(Sender: TObject);
// Var TempENBuildingStatus: ENBuildingStatusControllerSoapPort; 
begin
  // TempENBuildingStatus := HTTPRIOENBuildingStatus as ENBuildingStatusControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENBuildingStatusObj:=ENBuildingStatus.Create;
  SetNullIntProps(ENBuildingStatusObj);
  SetNullXSProps(ENBuildingStatusObj);



  try
    frmENBuildingStatusEdit:=TfrmENBuildingStatusEdit.Create(Application, dsInsert);
    try
      if frmENBuildingStatusEdit.ShowModal = mrOk then
      begin
        if ENBuildingStatusObj<>nil then
            //TempENBuildingStatus.add(ENBuildingStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENBuildingStatusEdit.Free;
      frmENBuildingStatusEdit:=nil;
    end;
  finally
    ENBuildingStatusObj.Free;
  end;
end;


procedure TfrmENBuildingStatusShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENBuildingStatusShow.actFilterExecute(Sender: TObject);
begin
{frmENBuildingStatusFilterEdit:=TfrmENBuildingStatusFilterEdit.Create(Application, dsInsert);
  try
    ENBuildingStatusFilterObj := ENBuildingStatusFilter.Create;
    SetNullIntProps(ENBuildingStatusFilterObj);
    SetNullXSProps(ENBuildingStatusFilterObj);

    if frmENBuildingStatusFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENBuildingStatusFilter.Create;
      FilterObject := ENBuildingStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENBuildingStatusFilterEdit.Free;
    frmENBuildingStatusFilterEdit:=nil;
  end;}
end;


procedure TfrmENBuildingStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.