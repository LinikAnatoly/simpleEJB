
unit ShowENRegForSupplierType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENRegForSupplierTypeController, AdvObj ;


type
    TfrmENRegForSupplierTypeShow = class(TChildForm)  
    HTTPRIOENRegForSupplierType: THTTPRIO;
    ImageList1: TImageList;
    sgENRegForSupplierType: TAdvStringGrid;
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
    procedure sgENRegForSupplierTypeTopLeftChanged(Sender: TObject);
    procedure sgENRegForSupplierTypeDblClick(Sender: TObject);
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
 // ENRegForSupplierTypeObj: ENRegForSupplierType;
 // ENRegForSupplierTypeFilterObj: ENRegForSupplierTypeFilter;
  frmENRegForSupplierTypeShow : TfrmENRegForSupplierTypeShow;
  
implementation

uses Main, EditENRegForSupplierType, EditENRegForSupplierTypeFilter;


{$R *.dfm}

var
  //frmENRegForSupplierTypeShow : TfrmENRegForSupplierTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENRegForSupplierTypeHeaders: array [1..3] of String =
        ( 'Код'
          ,'Назва'
          ,'Опис'
        );
   

procedure TfrmENRegForSupplierTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENRegForSupplierTypeShow:=nil;
  inherited;
end;


procedure TfrmENRegForSupplierTypeShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENRegForSupplierTypeShow.FormShow(Sender: TObject);
var
  TempENRegForSupplierType: ENRegForSupplierTypeControllerSoapPort;
  i: Integer;
  ENRegForSupplierTypeList: ENRegForSupplierTypeShortList;
begin
  SetGridHeaders(ENRegForSupplierTypeHeaders, sgENRegForSupplierType.ColumnHeaders);

  DisableActions([actInsert, actDelete, actEdit]);

  ColCount:=100;
  TempENRegForSupplierType :=  HTTPRIOENRegForSupplierType as ENRegForSupplierTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENRegForSupplierTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENRegForSupplierTypeList := TempENRegForSupplierType.getScrollableFilteredList(ENRegForSupplierTypeFilter(FilterObject),0,ColCount);
  LastCount:=High(ENRegForSupplierTypeList.list);

  if LastCount > -1 then
     sgENRegForSupplierType.RowCount:=LastCount+2
  else
     sgENRegForSupplierType.RowCount:=2;

   with sgENRegForSupplierType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENRegForSupplierTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENRegForSupplierTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENRegForSupplierTypeList.list[i].name;
        Cells[2,i+1] := ENRegForSupplierTypeList.list[i].description;
        LastRow:=i+1;
        sgENRegForSupplierType.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENRegForSupplierType.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENRegForSupplierType.RowCount > selectedRow then
      sgENRegForSupplierType.Row := selectedRow
    else
      sgENRegForSupplierType.Row := sgENRegForSupplierType.RowCount - 1;
    end
    else
      sgENRegForSupplierType.Row:=1;   
end;


procedure TfrmENRegForSupplierTypeShow.sgENRegForSupplierTypeTopLeftChanged(Sender: TObject);
var
  TempENRegForSupplierType: ENRegForSupplierTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENRegForSupplierTypeList: ENRegForSupplierTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENRegForSupplierType.TopRow + sgENRegForSupplierType.VisibleRowCount) = ColCount
  then
    begin
      TempENRegForSupplierType :=  HTTPRIOENRegForSupplierType as ENRegForSupplierTypeControllerSoapPort;
      CurrentRow:=sgENRegForSupplierType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENRegForSupplierTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENRegForSupplierTypeList := TempENRegForSupplierType.getScrollableFilteredList(ENRegForSupplierTypeFilter(FilterObject),ColCount-1, 100);


  sgENRegForSupplierType.RowCount:=sgENRegForSupplierType.RowCount+100;
  LastCount:=High(ENRegForSupplierTypeList.list);
  with sgENRegForSupplierType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENRegForSupplierTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENRegForSupplierTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENRegForSupplierTypeList.list[i].name;
        Cells[2,i+CurrentRow] := ENRegForSupplierTypeList.list[i].description;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENRegForSupplierType.Row:=CurrentRow-5;
   sgENRegForSupplierType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENRegForSupplierTypeShow.sgENRegForSupplierTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENRegForSupplierType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENRegForSupplierTypeShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENRegForSupplierType.RowCount-1 do
   for j:=0 to sgENRegForSupplierType.ColCount-1 do
     sgENRegForSupplierType.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENRegForSupplierTypeShow.actViewExecute(Sender: TObject);
var 
  TempENRegForSupplierType: ENRegForSupplierTypeControllerSoapPort;
begin
  TempENRegForSupplierType := HTTPRIOENRegForSupplierType as ENRegForSupplierTypeControllerSoapPort;
  try
    ENRegForSupplierTypeObj := TempENRegForSupplierType.getObject(StrToInt(sgENRegForSupplierType.Cells[0,sgENRegForSupplierType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENRegForSupplierType.Row;
  frmENRegForSupplierTypeEdit:=TfrmENRegForSupplierTypeEdit.Create(Application, dsView);
  
  try
    frmENRegForSupplierTypeEdit.ShowModal;
  finally
    frmENRegForSupplierTypeEdit.Free;
    frmENRegForSupplierTypeEdit:=nil;
  end;

  if sgENRegForSupplierType.RowCount > selectedRow then
    sgENRegForSupplierType.Row := selectedRow
  else
    sgENRegForSupplierType.Row := sgENRegForSupplierType.RowCount - 1;
  
end;


procedure TfrmENRegForSupplierTypeShow.actEditExecute(Sender: TObject);
var 
  TempENRegForSupplierType: ENRegForSupplierTypeControllerSoapPort;
begin
  TempENRegForSupplierType := HTTPRIOENRegForSupplierType as ENRegForSupplierTypeControllerSoapPort;
  try
    ENRegForSupplierTypeObj := TempENRegForSupplierType.getObject(StrToInt(sgENRegForSupplierType.Cells[0,sgENRegForSupplierType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENRegForSupplierType.Row;
  frmENRegForSupplierTypeEdit:=TfrmENRegForSupplierTypeEdit.Create(Application, dsEdit);
  
  try
    if frmENRegForSupplierTypeEdit.ShowModal= mrOk then
      begin
        //TempENRegForSupplierType.save(ENRegForSupplierTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENRegForSupplierTypeEdit.Free;
    frmENRegForSupplierTypeEdit:=nil;
  end;

  if sgENRegForSupplierType.RowCount > selectedRow then
    sgENRegForSupplierType.Row := selectedRow
  else
    sgENRegForSupplierType.Row := sgENRegForSupplierType.RowCount - 1;
  
end;


procedure TfrmENRegForSupplierTypeShow.actDeleteExecute(Sender: TObject);
Var TempENRegForSupplierType: ENRegForSupplierTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENRegForSupplierType := HTTPRIOENRegForSupplierType as ENRegForSupplierTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENRegForSupplierType.Cells[0,sgENRegForSupplierType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип реєстру для відшкодування Постачальником) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENRegForSupplierType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENRegForSupplierTypeShow.actInsertExecute(Sender: TObject);
// Var TempENRegForSupplierType: ENRegForSupplierTypeControllerSoapPort; 
begin
  // TempENRegForSupplierType := HTTPRIOENRegForSupplierType as ENRegForSupplierTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENRegForSupplierTypeObj:=ENRegForSupplierType.Create;
  SetNullIntProps(ENRegForSupplierTypeObj);
  SetNullXSProps(ENRegForSupplierTypeObj);



  try
    frmENRegForSupplierTypeEdit:=TfrmENRegForSupplierTypeEdit.Create(Application, dsInsert);
    try
      if frmENRegForSupplierTypeEdit.ShowModal = mrOk then
      begin
        if ENRegForSupplierTypeObj<>nil then
            //TempENRegForSupplierType.add(ENRegForSupplierTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENRegForSupplierTypeEdit.Free;
      frmENRegForSupplierTypeEdit:=nil;
    end;
  finally
    ENRegForSupplierTypeObj.Free;
  end;
end;


procedure TfrmENRegForSupplierTypeShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENRegForSupplierTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENRegForSupplierTypeFilterEdit:=TfrmENRegForSupplierTypeFilterEdit.Create(Application, dsInsert);
  try
    ENRegForSupplierTypeFilterObj := ENRegForSupplierTypeFilter.Create;
    SetNullIntProps(ENRegForSupplierTypeFilterObj);
    SetNullXSProps(ENRegForSupplierTypeFilterObj);

    if frmENRegForSupplierTypeFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENRegForSupplierTypeFilter.Create;
      FilterObject := ENRegForSupplierTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENRegForSupplierTypeFilterEdit.Free;
    frmENRegForSupplierTypeFilterEdit:=nil;
  end;}
end;


procedure TfrmENRegForSupplierTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.