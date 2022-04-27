
unit ShowENCalcAdditionalItemType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENCalcAdditionalItemTypeController, AdvObj ;


type
    TfrmENCalcAdditionalItemTypeShow = class(TChildForm)  
    HTTPRIOENCalcAdditionalItemType: THTTPRIO;
    ImageList1: TImageList;
    sgENCalcAdditionalItemType: TAdvStringGrid;
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
    procedure sgENCalcAdditionalItemTypeTopLeftChanged(Sender: TObject);
    procedure sgENCalcAdditionalItemTypeDblClick(Sender: TObject);
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
 frmENCalcAdditionalItemTypeShow : TfrmENCalcAdditionalItemTypeShow;
 // ENCalcAdditionalItemTypeObj: ENCalcAdditionalItemType;
 // ENCalcAdditionalItemTypeFilterObj: ENCalcAdditionalItemTypeFilter;
  
  
implementation

uses Main, EditENCalcAdditionalItemType, EditENCalcAdditionalItemTypeFilter;


{$R *.dfm}

var
  //frmENCalcAdditionalItemTypeShow : TfrmENCalcAdditionalItemTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENCalcAdditionalItemTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Найменування'
        );
   

procedure TfrmENCalcAdditionalItemTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENCalcAdditionalItemTypeShow:=nil;
  inherited;
end;


procedure TfrmENCalcAdditionalItemTypeShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENCalcAdditionalItemTypeShow.FormShow(Sender: TObject);
var
  TempENCalcAdditionalItemType: ENCalcAdditionalItemTypeControllerSoapPort;
  i: Integer;
  ENCalcAdditionalItemTypeList: ENCalcAdditionalItemTypeShortList;
begin
  SetGridHeaders(ENCalcAdditionalItemTypeHeaders, sgENCalcAdditionalItemType.ColumnHeaders);
  ColCount:=100;
  TempENCalcAdditionalItemType :=  HTTPRIOENCalcAdditionalItemType as ENCalcAdditionalItemTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENCalcAdditionalItemTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCalcAdditionalItemTypeList := TempENCalcAdditionalItemType.getScrollableFilteredList(ENCalcAdditionalItemTypeFilter(FilterObject),0,ColCount);
  LastCount:=High(ENCalcAdditionalItemTypeList.list);

  if LastCount > -1 then
     sgENCalcAdditionalItemType.RowCount:=LastCount+2
  else
     sgENCalcAdditionalItemType.RowCount:=2;

   with sgENCalcAdditionalItemType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCalcAdditionalItemTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENCalcAdditionalItemTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENCalcAdditionalItemTypeList.list[i].name;
        LastRow:=i+1;
        sgENCalcAdditionalItemType.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENCalcAdditionalItemType.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENCalcAdditionalItemType.RowCount > selectedRow then
      sgENCalcAdditionalItemType.Row := selectedRow
    else
      sgENCalcAdditionalItemType.Row := sgENCalcAdditionalItemType.RowCount - 1;
    end
    else
      sgENCalcAdditionalItemType.Row:=1;   
end;


procedure TfrmENCalcAdditionalItemTypeShow.sgENCalcAdditionalItemTypeTopLeftChanged(Sender: TObject);
var
  TempENCalcAdditionalItemType: ENCalcAdditionalItemTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENCalcAdditionalItemTypeList: ENCalcAdditionalItemTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENCalcAdditionalItemType.TopRow + sgENCalcAdditionalItemType.VisibleRowCount) = ColCount
  then
    begin
      TempENCalcAdditionalItemType :=  HTTPRIOENCalcAdditionalItemType as ENCalcAdditionalItemTypeControllerSoapPort;
      CurrentRow:=sgENCalcAdditionalItemType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENCalcAdditionalItemTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCalcAdditionalItemTypeList := TempENCalcAdditionalItemType.getScrollableFilteredList(ENCalcAdditionalItemTypeFilter(FilterObject),ColCount-1, 100);


  sgENCalcAdditionalItemType.RowCount:=sgENCalcAdditionalItemType.RowCount+100;
  LastCount:=High(ENCalcAdditionalItemTypeList.list);
  with sgENCalcAdditionalItemType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCalcAdditionalItemTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENCalcAdditionalItemTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENCalcAdditionalItemTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENCalcAdditionalItemType.Row:=CurrentRow-5;
   sgENCalcAdditionalItemType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENCalcAdditionalItemTypeShow.sgENCalcAdditionalItemTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENCalcAdditionalItemType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENCalcAdditionalItemTypeShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENCalcAdditionalItemType.RowCount-1 do
   for j:=0 to sgENCalcAdditionalItemType.ColCount-1 do
     sgENCalcAdditionalItemType.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENCalcAdditionalItemTypeShow.actViewExecute(Sender: TObject);
var 
  TempENCalcAdditionalItemType: ENCalcAdditionalItemTypeControllerSoapPort;
begin
  TempENCalcAdditionalItemType := HTTPRIOENCalcAdditionalItemType as ENCalcAdditionalItemTypeControllerSoapPort;
  try
    ENCalcAdditionalItemTypeObj := TempENCalcAdditionalItemType.getObject(StrToInt(sgENCalcAdditionalItemType.Cells[0,sgENCalcAdditionalItemType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENCalcAdditionalItemType.Row;
  frmENCalcAdditionalItemTypeEdit:=TfrmENCalcAdditionalItemTypeEdit.Create(Application, dsView);
  
  try
    frmENCalcAdditionalItemTypeEdit.ShowModal;
  finally
    frmENCalcAdditionalItemTypeEdit.Free;
    frmENCalcAdditionalItemTypeEdit:=nil;
  end;

  if sgENCalcAdditionalItemType.RowCount > selectedRow then
    sgENCalcAdditionalItemType.Row := selectedRow
  else
    sgENCalcAdditionalItemType.Row := sgENCalcAdditionalItemType.RowCount - 1;
  
end;


procedure TfrmENCalcAdditionalItemTypeShow.actEditExecute(Sender: TObject);
var 
  TempENCalcAdditionalItemType: ENCalcAdditionalItemTypeControllerSoapPort;
begin
  TempENCalcAdditionalItemType := HTTPRIOENCalcAdditionalItemType as ENCalcAdditionalItemTypeControllerSoapPort;
  try
    ENCalcAdditionalItemTypeObj := TempENCalcAdditionalItemType.getObject(StrToInt(sgENCalcAdditionalItemType.Cells[0,sgENCalcAdditionalItemType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENCalcAdditionalItemType.Row;
  frmENCalcAdditionalItemTypeEdit:=TfrmENCalcAdditionalItemTypeEdit.Create(Application, dsEdit);
  
  try
    if frmENCalcAdditionalItemTypeEdit.ShowModal= mrOk then
      begin
        //TempENCalcAdditionalItemType.save(ENCalcAdditionalItemTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENCalcAdditionalItemTypeEdit.Free;
    frmENCalcAdditionalItemTypeEdit:=nil;
  end;

  if sgENCalcAdditionalItemType.RowCount > selectedRow then
    sgENCalcAdditionalItemType.Row := selectedRow
  else
    sgENCalcAdditionalItemType.Row := sgENCalcAdditionalItemType.RowCount - 1;
  
end;


procedure TfrmENCalcAdditionalItemTypeShow.actDeleteExecute(Sender: TObject);
Var TempENCalcAdditionalItemType: ENCalcAdditionalItemTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENCalcAdditionalItemType := HTTPRIOENCalcAdditionalItemType as ENCalcAdditionalItemTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENCalcAdditionalItemType.Cells[0,sgENCalcAdditionalItemType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип додаткових параметрів для розрахунку послуг) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENCalcAdditionalItemType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENCalcAdditionalItemTypeShow.actInsertExecute(Sender: TObject);
// Var TempENCalcAdditionalItemType: ENCalcAdditionalItemTypeControllerSoapPort; 
begin
  // TempENCalcAdditionalItemType := HTTPRIOENCalcAdditionalItemType as ENCalcAdditionalItemTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENCalcAdditionalItemTypeObj:=ENCalcAdditionalItemType.Create;
  SetNullIntProps(ENCalcAdditionalItemTypeObj);
  SetNullXSProps(ENCalcAdditionalItemTypeObj);



  try
    frmENCalcAdditionalItemTypeEdit:=TfrmENCalcAdditionalItemTypeEdit.Create(Application, dsInsert);
    try
      if frmENCalcAdditionalItemTypeEdit.ShowModal = mrOk then
      begin
        if ENCalcAdditionalItemTypeObj<>nil then
            //TempENCalcAdditionalItemType.add(ENCalcAdditionalItemTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENCalcAdditionalItemTypeEdit.Free;
      frmENCalcAdditionalItemTypeEdit:=nil;
    end;
  finally
    ENCalcAdditionalItemTypeObj.Free;
  end;
end;


procedure TfrmENCalcAdditionalItemTypeShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENCalcAdditionalItemTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENCalcAdditionalItemTypeFilterEdit:=TfrmENCalcAdditionalItemTypeFilterEdit.Create(Application, dsInsert);
  try
    ENCalcAdditionalItemTypeFilterObj := ENCalcAdditionalItemTypeFilter.Create;
    SetNullIntProps(ENCalcAdditionalItemTypeFilterObj);
    SetNullXSProps(ENCalcAdditionalItemTypeFilterObj);

    if frmENCalcAdditionalItemTypeFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENCalcAdditionalItemTypeFilter.Create;
      FilterObject := ENCalcAdditionalItemTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENCalcAdditionalItemTypeFilterEdit.Free;
    frmENCalcAdditionalItemTypeFilterEdit:=nil;
  end;}
end;


procedure TfrmENCalcAdditionalItemTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.