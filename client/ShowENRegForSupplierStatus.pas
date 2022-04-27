
unit ShowENRegForSupplierStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENRegForSupplierStatusController, AdvObj ;


type
    TfrmENRegForSupplierStatusShow = class(TChildForm)  
    HTTPRIOENRegForSupplierStatus: THTTPRIO;
    ImageList1: TImageList;
    sgENRegForSupplierStatus: TAdvStringGrid;
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
    procedure sgENRegForSupplierStatusTopLeftChanged(Sender: TObject);
    procedure sgENRegForSupplierStatusDblClick(Sender: TObject);
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
   selectedRow : Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 // ENRegForSupplierStatusObj: ENRegForSupplierStatus;
 // ENRegForSupplierStatusFilterObj: ENRegForSupplierStatusFilter;
  frmENRegForSupplierStatusShow : TfrmENRegForSupplierStatusShow;
  
  
implementation

uses Main, EditENRegForSupplierStatus, EditENRegForSupplierStatusFilter;


{$R *.dfm}

var
  //frmENRegForSupplierStatusShow : TfrmENRegForSupplierStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENRegForSupplierStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmENRegForSupplierStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENRegForSupplierStatusShow:=nil;
  inherited;
end;


procedure TfrmENRegForSupplierStatusShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENRegForSupplierStatusShow.FormShow(Sender: TObject);
var
  TempENRegForSupplierStatus: ENRegForSupplierStatusControllerSoapPort;
  i: Integer;
  ENRegForSupplierStatusList: ENRegForSupplierStatusShortList;
begin
  SetGridHeaders(ENRegForSupplierStatusHeaders, sgENRegForSupplierStatus.ColumnHeaders);
  ColCount:=100;
  TempENRegForSupplierStatus :=  HTTPRIOENRegForSupplierStatus as ENRegForSupplierStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENRegForSupplierStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENRegForSupplierStatusList := TempENRegForSupplierStatus.getScrollableFilteredList(ENRegForSupplierStatusFilter(FilterObject),0,ColCount);
  LastCount:=High(ENRegForSupplierStatusList.list);

  if LastCount > -1 then
     sgENRegForSupplierStatus.RowCount:=LastCount+2
  else
     sgENRegForSupplierStatus.RowCount:=2;

   with sgENRegForSupplierStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENRegForSupplierStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENRegForSupplierStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENRegForSupplierStatusList.list[i].name;
        LastRow:=i+1;
        sgENRegForSupplierStatus.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENRegForSupplierStatus.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENRegForSupplierStatus.RowCount > selectedRow then
      sgENRegForSupplierStatus.Row := selectedRow
    else
      sgENRegForSupplierStatus.Row := sgENRegForSupplierStatus.RowCount - 1;
    end
    else
      sgENRegForSupplierStatus.Row:=1;   
end;


procedure TfrmENRegForSupplierStatusShow.sgENRegForSupplierStatusTopLeftChanged(Sender: TObject);
var
  TempENRegForSupplierStatus: ENRegForSupplierStatusControllerSoapPort;
  i,CurrentRow: Integer;
  ENRegForSupplierStatusList: ENRegForSupplierStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENRegForSupplierStatus.TopRow + sgENRegForSupplierStatus.VisibleRowCount) = ColCount
  then
    begin
      TempENRegForSupplierStatus :=  HTTPRIOENRegForSupplierStatus as ENRegForSupplierStatusControllerSoapPort;
      CurrentRow:=sgENRegForSupplierStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENRegForSupplierStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENRegForSupplierStatusList := TempENRegForSupplierStatus.getScrollableFilteredList(ENRegForSupplierStatusFilter(FilterObject),ColCount-1, 100);


  sgENRegForSupplierStatus.RowCount:=sgENRegForSupplierStatus.RowCount+100;
  LastCount:=High(ENRegForSupplierStatusList.list);
  with sgENRegForSupplierStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENRegForSupplierStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENRegForSupplierStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENRegForSupplierStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENRegForSupplierStatus.Row:=CurrentRow-5;
   sgENRegForSupplierStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENRegForSupplierStatusShow.sgENRegForSupplierStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENRegForSupplierStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENRegForSupplierStatusShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENRegForSupplierStatus.RowCount-1 do
   for j:=0 to sgENRegForSupplierStatus.ColCount-1 do
     sgENRegForSupplierStatus.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENRegForSupplierStatusShow.actViewExecute(Sender: TObject);
var 
  TempENRegForSupplierStatus: ENRegForSupplierStatusControllerSoapPort;
begin
  TempENRegForSupplierStatus := HTTPRIOENRegForSupplierStatus as ENRegForSupplierStatusControllerSoapPort;
  try
    ENRegForSupplierStatusObj := TempENRegForSupplierStatus.getObject(StrToInt(sgENRegForSupplierStatus.Cells[0,sgENRegForSupplierStatus.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENRegForSupplierStatus.Row;
  frmENRegForSupplierStatusEdit:=TfrmENRegForSupplierStatusEdit.Create(Application, dsView);
  
  try
    frmENRegForSupplierStatusEdit.ShowModal;
  finally
    frmENRegForSupplierStatusEdit.Free;
    frmENRegForSupplierStatusEdit:=nil;
  end;

  if sgENRegForSupplierStatus.RowCount > selectedRow then
    sgENRegForSupplierStatus.Row := selectedRow
  else
    sgENRegForSupplierStatus.Row := sgENRegForSupplierStatus.RowCount - 1;
  
end;


procedure TfrmENRegForSupplierStatusShow.actEditExecute(Sender: TObject);
var 
  TempENRegForSupplierStatus: ENRegForSupplierStatusControllerSoapPort;
begin
  TempENRegForSupplierStatus := HTTPRIOENRegForSupplierStatus as ENRegForSupplierStatusControllerSoapPort;
  try
    ENRegForSupplierStatusObj := TempENRegForSupplierStatus.getObject(StrToInt(sgENRegForSupplierStatus.Cells[0,sgENRegForSupplierStatus.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENRegForSupplierStatus.Row;
  frmENRegForSupplierStatusEdit:=TfrmENRegForSupplierStatusEdit.Create(Application, dsEdit);
  
  try
    if frmENRegForSupplierStatusEdit.ShowModal= mrOk then
      begin
        //TempENRegForSupplierStatus.save(ENRegForSupplierStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENRegForSupplierStatusEdit.Free;
    frmENRegForSupplierStatusEdit:=nil;
  end;

  if sgENRegForSupplierStatus.RowCount > selectedRow then
    sgENRegForSupplierStatus.Row := selectedRow
  else
    sgENRegForSupplierStatus.Row := sgENRegForSupplierStatus.RowCount - 1;
  
end;


procedure TfrmENRegForSupplierStatusShow.actDeleteExecute(Sender: TObject);
Var TempENRegForSupplierStatus: ENRegForSupplierStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempENRegForSupplierStatus := HTTPRIOENRegForSupplierStatus as ENRegForSupplierStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgENRegForSupplierStatus.Cells[0,sgENRegForSupplierStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статус реєстру для відшкодування Постачальником) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENRegForSupplierStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENRegForSupplierStatusShow.actInsertExecute(Sender: TObject);
// Var TempENRegForSupplierStatus: ENRegForSupplierStatusControllerSoapPort; 
begin
  // TempENRegForSupplierStatus := HTTPRIOENRegForSupplierStatus as ENRegForSupplierStatusControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENRegForSupplierStatusObj:=ENRegForSupplierStatus.Create;
  SetNullIntProps(ENRegForSupplierStatusObj);
  SetNullXSProps(ENRegForSupplierStatusObj);



  try
    frmENRegForSupplierStatusEdit:=TfrmENRegForSupplierStatusEdit.Create(Application, dsInsert);
    try
      if frmENRegForSupplierStatusEdit.ShowModal = mrOk then
      begin
        if ENRegForSupplierStatusObj<>nil then
            //TempENRegForSupplierStatus.add(ENRegForSupplierStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENRegForSupplierStatusEdit.Free;
      frmENRegForSupplierStatusEdit:=nil;
    end;
  finally
    ENRegForSupplierStatusObj.Free;
  end;
end;


procedure TfrmENRegForSupplierStatusShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENRegForSupplierStatusShow.actFilterExecute(Sender: TObject);
begin
{frmENRegForSupplierStatusFilterEdit:=TfrmENRegForSupplierStatusFilterEdit.Create(Application, dsInsert);
  try
    ENRegForSupplierStatusFilterObj := ENRegForSupplierStatusFilter.Create;
    SetNullIntProps(ENRegForSupplierStatusFilterObj);
    SetNullXSProps(ENRegForSupplierStatusFilterObj);

    if frmENRegForSupplierStatusFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENRegForSupplierStatusFilter.Create;
      FilterObject := ENRegForSupplierStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENRegForSupplierStatusFilterEdit.Free;
    frmENRegForSupplierStatusFilterEdit:=nil;
  end;}
end;


procedure TfrmENRegForSupplierStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.