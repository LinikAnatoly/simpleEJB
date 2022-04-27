
unit ShowENBuildingCommissionType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENBuildingCommissionTypeController, AdvObj ;


type
    TfrmENBuildingCommissionTypeShow = class(TChildForm)  
    HTTPRIOENBuildingCommissionType: THTTPRIO;
    ImageList1: TImageList;
    sgENBuildingCommissionType: TAdvStringGrid;
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
    procedure sgENBuildingCommissionTypeTopLeftChanged(Sender: TObject);
    procedure sgENBuildingCommissionTypeDblClick(Sender: TObject);
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
  frmENBuildingCommissionTypeShow: TfrmENBuildingCommissionTypeShow;
  
  
implementation

uses Main, EditENBuildingCommissionType, EditENBuildingCommissionTypeFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENBuildingCommissionTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Найменування'
        );
   

procedure TfrmENBuildingCommissionTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENBuildingCommissionTypeShow:=nil;
  inherited;
end;


procedure TfrmENBuildingCommissionTypeShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENBuildingCommissionTypeShow.FormShow(Sender: TObject);
var
  TempENBuildingCommissionType: ENBuildingCommissionTypeControllerSoapPort;
  i: Integer;
  ENBuildingCommissionTypeList: ENBuildingCommissionTypeShortList;
begin
  SetGridHeaders(ENBuildingCommissionTypeHeaders, sgENBuildingCommissionType.ColumnHeaders);
  ColCount:=100;
  TempENBuildingCommissionType :=  HTTPRIOENBuildingCommissionType as ENBuildingCommissionTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENBuildingCommissionTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBuildingCommissionTypeList := TempENBuildingCommissionType.getScrollableFilteredList(ENBuildingCommissionTypeFilter(FilterObject),0,ColCount);
  LastCount:=High(ENBuildingCommissionTypeList.list);

  if LastCount > -1 then
     sgENBuildingCommissionType.RowCount:=LastCount+2
  else
     sgENBuildingCommissionType.RowCount:=2;

   with sgENBuildingCommissionType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBuildingCommissionTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENBuildingCommissionTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENBuildingCommissionTypeList.list[i].name;
        LastRow:=i+1;
        sgENBuildingCommissionType.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENBuildingCommissionType.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENBuildingCommissionType.RowCount > selectedRow then
      sgENBuildingCommissionType.Row := selectedRow
    else
      sgENBuildingCommissionType.Row := sgENBuildingCommissionType.RowCount - 1;
    end
    else
      sgENBuildingCommissionType.Row:=1;   
end;


procedure TfrmENBuildingCommissionTypeShow.sgENBuildingCommissionTypeTopLeftChanged(Sender: TObject);
var
  TempENBuildingCommissionType: ENBuildingCommissionTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENBuildingCommissionTypeList: ENBuildingCommissionTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENBuildingCommissionType.TopRow + sgENBuildingCommissionType.VisibleRowCount) = ColCount
  then
    begin
      TempENBuildingCommissionType :=  HTTPRIOENBuildingCommissionType as ENBuildingCommissionTypeControllerSoapPort;
      CurrentRow:=sgENBuildingCommissionType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENBuildingCommissionTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBuildingCommissionTypeList := TempENBuildingCommissionType.getScrollableFilteredList(ENBuildingCommissionTypeFilter(FilterObject),ColCount-1, 100);


  sgENBuildingCommissionType.RowCount:=sgENBuildingCommissionType.RowCount+100;
  LastCount:=High(ENBuildingCommissionTypeList.list);
  with sgENBuildingCommissionType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBuildingCommissionTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENBuildingCommissionTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENBuildingCommissionTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENBuildingCommissionType.Row:=CurrentRow-5;
   sgENBuildingCommissionType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENBuildingCommissionTypeShow.sgENBuildingCommissionTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENBuildingCommissionType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENBuildingCommissionTypeShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENBuildingCommissionType.RowCount-1 do
   for j:=0 to sgENBuildingCommissionType.ColCount-1 do
     sgENBuildingCommissionType.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENBuildingCommissionTypeShow.actViewExecute(Sender: TObject);
var 
  TempENBuildingCommissionType: ENBuildingCommissionTypeControllerSoapPort;
begin
  TempENBuildingCommissionType := HTTPRIOENBuildingCommissionType as ENBuildingCommissionTypeControllerSoapPort;
  try
    ENBuildingCommissionTypeObj := TempENBuildingCommissionType.getObject(StrToInt(sgENBuildingCommissionType.Cells[0,sgENBuildingCommissionType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENBuildingCommissionType.Row;
  frmENBuildingCommissionTypeEdit:=TfrmENBuildingCommissionTypeEdit.Create(Application, dsView);
  
  try
    frmENBuildingCommissionTypeEdit.ShowModal;
  finally
    frmENBuildingCommissionTypeEdit.Free;
    frmENBuildingCommissionTypeEdit:=nil;
  end;

  if sgENBuildingCommissionType.RowCount > selectedRow then
    sgENBuildingCommissionType.Row := selectedRow
  else
    sgENBuildingCommissionType.Row := sgENBuildingCommissionType.RowCount - 1;
  
end;


procedure TfrmENBuildingCommissionTypeShow.actEditExecute(Sender: TObject);
var 
  TempENBuildingCommissionType: ENBuildingCommissionTypeControllerSoapPort;
begin
  TempENBuildingCommissionType := HTTPRIOENBuildingCommissionType as ENBuildingCommissionTypeControllerSoapPort;
  try
    ENBuildingCommissionTypeObj := TempENBuildingCommissionType.getObject(StrToInt(sgENBuildingCommissionType.Cells[0,sgENBuildingCommissionType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENBuildingCommissionType.Row;
  frmENBuildingCommissionTypeEdit:=TfrmENBuildingCommissionTypeEdit.Create(Application, dsEdit);
  
  try
    if frmENBuildingCommissionTypeEdit.ShowModal= mrOk then
      begin
        //TempENBuildingCommissionType.save(ENBuildingCommissionTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENBuildingCommissionTypeEdit.Free;
    frmENBuildingCommissionTypeEdit:=nil;
  end;

  if sgENBuildingCommissionType.RowCount > selectedRow then
    sgENBuildingCommissionType.Row := selectedRow
  else
    sgENBuildingCommissionType.Row := sgENBuildingCommissionType.RowCount - 1;
  
end;


procedure TfrmENBuildingCommissionTypeShow.actDeleteExecute(Sender: TObject);
Var TempENBuildingCommissionType: ENBuildingCommissionTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENBuildingCommissionType := HTTPRIOENBuildingCommissionType as ENBuildingCommissionTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENBuildingCommissionType.Cells[0,sgENBuildingCommissionType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (тип - члени комісії , прийняв або здав)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENBuildingCommissionType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENBuildingCommissionTypeShow.actInsertExecute(Sender: TObject);
// Var TempENBuildingCommissionType: ENBuildingCommissionTypeControllerSoapPort; 
begin
  // TempENBuildingCommissionType := HTTPRIOENBuildingCommissionType as ENBuildingCommissionTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENBuildingCommissionTypeObj:=ENBuildingCommissionType.Create;
  SetNullIntProps(ENBuildingCommissionTypeObj);
  SetNullXSProps(ENBuildingCommissionTypeObj);



  try
    frmENBuildingCommissionTypeEdit:=TfrmENBuildingCommissionTypeEdit.Create(Application, dsInsert);
    try
      if frmENBuildingCommissionTypeEdit.ShowModal = mrOk then
      begin
        if ENBuildingCommissionTypeObj<>nil then
            //TempENBuildingCommissionType.add(ENBuildingCommissionTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENBuildingCommissionTypeEdit.Free;
      frmENBuildingCommissionTypeEdit:=nil;
    end;
  finally
    ENBuildingCommissionTypeObj.Free;
  end;
end;


procedure TfrmENBuildingCommissionTypeShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENBuildingCommissionTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENBuildingCommissionTypeFilterEdit:=TfrmENBuildingCommissionTypeFilterEdit.Create(Application, dsInsert);
  try
    ENBuildingCommissionTypeFilterObj := ENBuildingCommissionTypeFilter.Create;
    SetNullIntProps(ENBuildingCommissionTypeFilterObj);
    SetNullXSProps(ENBuildingCommissionTypeFilterObj);

    if frmENBuildingCommissionTypeFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENBuildingCommissionTypeFilter.Create;
      FilterObject := ENBuildingCommissionTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENBuildingCommissionTypeFilterEdit.Free;
    frmENBuildingCommissionTypeFilterEdit:=nil;
  end;}
end;


procedure TfrmENBuildingCommissionTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.