
unit ShowENTCOValuesType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENTCOValuesTypeController ;


type
    TfrmENTCOValuesTypeShow = class(TChildForm)  
    HTTPRIOENTCOValuesType: THTTPRIO;
    ImageList1: TImageList;
    sgENTCOValuesType: TAdvStringGrid;
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
    procedure sgENTCOValuesTypeTopLeftChanged(Sender: TObject);
    procedure sgENTCOValuesTypeDblClick(Sender: TObject);
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
  frmENTCOValuesTypeShow: TfrmENTCOValuesTypeShow;
  
  
implementation

uses Main, EditENTCOValuesType, EditENTCOValuesTypeFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTCOValuesTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Наименование'
        );
   

procedure TfrmENTCOValuesTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENTCOValuesTypeShow:=nil;
  inherited;
end;


procedure TfrmENTCOValuesTypeShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENTCOValuesTypeShow.FormShow(Sender: TObject);
var
  TempENTCOValuesType: ENTCOValuesTypeControllerSoapPort;
  i: Integer;
  ENTCOValuesTypeList: ENTCOValuesTypeShortList;
begin
  SetGridHeaders(ENTCOValuesTypeHeaders, sgENTCOValuesType.ColumnHeaders);
  ColCount:=100;
  TempENTCOValuesType :=  HTTPRIOENTCOValuesType as ENTCOValuesTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTCOValuesTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTCOValuesTypeList := TempENTCOValuesType.getScrollableFilteredList(ENTCOValuesTypeFilter(FilterObject),0,ColCount);
  LastCount:=High(ENTCOValuesTypeList.list);

  if LastCount > -1 then
     sgENTCOValuesType.RowCount:=LastCount+2
  else
     sgENTCOValuesType.RowCount:=2;

   with sgENTCOValuesType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTCOValuesTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTCOValuesTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENTCOValuesTypeList.list[i].name;
        LastRow:=i+1;
        sgENTCOValuesType.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENTCOValuesType.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENTCOValuesType.RowCount > selectedRow then
      sgENTCOValuesType.Row := selectedRow
    else
      sgENTCOValuesType.Row := sgENTCOValuesType.RowCount - 1;
    end
    else
      sgENTCOValuesType.Row:=1;   
end;


procedure TfrmENTCOValuesTypeShow.sgENTCOValuesTypeTopLeftChanged(Sender: TObject);
var
  TempENTCOValuesType: ENTCOValuesTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENTCOValuesTypeList: ENTCOValuesTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTCOValuesType.TopRow + sgENTCOValuesType.VisibleRowCount) = ColCount
  then
    begin
      TempENTCOValuesType :=  HTTPRIOENTCOValuesType as ENTCOValuesTypeControllerSoapPort;
      CurrentRow:=sgENTCOValuesType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTCOValuesTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTCOValuesTypeList := TempENTCOValuesType.getScrollableFilteredList(ENTCOValuesTypeFilter(FilterObject),ColCount-1, 100);


  sgENTCOValuesType.RowCount:=sgENTCOValuesType.RowCount+100;
  LastCount:=High(ENTCOValuesTypeList.list);
  with sgENTCOValuesType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTCOValuesTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTCOValuesTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENTCOValuesTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTCOValuesType.Row:=CurrentRow-5;
   sgENTCOValuesType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTCOValuesTypeShow.sgENTCOValuesTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTCOValuesType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENTCOValuesTypeShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENTCOValuesType.RowCount-1 do
   for j:=0 to sgENTCOValuesType.ColCount-1 do
     sgENTCOValuesType.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENTCOValuesTypeShow.actViewExecute(Sender: TObject);
var 
  TempENTCOValuesType: ENTCOValuesTypeControllerSoapPort;
begin
  TempENTCOValuesType := HTTPRIOENTCOValuesType as ENTCOValuesTypeControllerSoapPort;
  try
    ENTCOValuesTypeObj := TempENTCOValuesType.getObject(StrToInt(sgENTCOValuesType.Cells[0,sgENTCOValuesType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENTCOValuesType.Row;
  frmENTCOValuesTypeEdit:=TfrmENTCOValuesTypeEdit.Create(Application, dsView);
  
  try
    frmENTCOValuesTypeEdit.ShowModal;
  finally
    frmENTCOValuesTypeEdit.Free;
    frmENTCOValuesTypeEdit:=nil;
  end;

  if sgENTCOValuesType.RowCount > selectedRow then
    sgENTCOValuesType.Row := selectedRow
  else
    sgENTCOValuesType.Row := sgENTCOValuesType.RowCount - 1;
  
end;


procedure TfrmENTCOValuesTypeShow.actEditExecute(Sender: TObject);
var 
  TempENTCOValuesType: ENTCOValuesTypeControllerSoapPort;
begin
  TempENTCOValuesType := HTTPRIOENTCOValuesType as ENTCOValuesTypeControllerSoapPort;
  try
    ENTCOValuesTypeObj := TempENTCOValuesType.getObject(StrToInt(sgENTCOValuesType.Cells[0,sgENTCOValuesType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENTCOValuesType.Row;
  frmENTCOValuesTypeEdit:=TfrmENTCOValuesTypeEdit.Create(Application, dsEdit);
  
  try
    if frmENTCOValuesTypeEdit.ShowModal= mrOk then
      begin
        //TempENTCOValuesType.save(ENTCOValuesTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTCOValuesTypeEdit.Free;
    frmENTCOValuesTypeEdit:=nil;
  end;

  if sgENTCOValuesType.RowCount > selectedRow then
    sgENTCOValuesType.Row := selectedRow
  else
    sgENTCOValuesType.Row := sgENTCOValuesType.RowCount - 1;
  
end;


procedure TfrmENTCOValuesTypeShow.actDeleteExecute(Sender: TObject);
Var TempENTCOValuesType: ENTCOValuesTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTCOValuesType := HTTPRIOENTCOValuesType as ENTCOValuesTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTCOValuesType.Cells[0,sgENTCOValuesType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Тип значений для TechConditionsObjcts)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTCOValuesType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTCOValuesTypeShow.actInsertExecute(Sender: TObject);
// Var TempENTCOValuesType: ENTCOValuesTypeControllerSoapPort; 
begin
  // TempENTCOValuesType := HTTPRIOENTCOValuesType as ENTCOValuesTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENTCOValuesTypeObj:=ENTCOValuesType.Create;
  SetNullIntProps(ENTCOValuesTypeObj);
  SetNullXSProps(ENTCOValuesTypeObj);



  try
    frmENTCOValuesTypeEdit:=TfrmENTCOValuesTypeEdit.Create(Application, dsInsert);
    try
      if frmENTCOValuesTypeEdit.ShowModal = mrOk then
      begin
        if ENTCOValuesTypeObj<>nil then
            //TempENTCOValuesType.add(ENTCOValuesTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTCOValuesTypeEdit.Free;
      frmENTCOValuesTypeEdit:=nil;
    end;
  finally
    ENTCOValuesTypeObj.Free;
  end;
end;


procedure TfrmENTCOValuesTypeShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENTCOValuesTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENTCOValuesTypeFilterEdit:=TfrmENTCOValuesTypeFilterEdit.Create(Application, dsInsert);
  try
    ENTCOValuesTypeFilterObj := ENTCOValuesTypeFilter.Create;
    SetNullIntProps(ENTCOValuesTypeFilterObj);
    SetNullXSProps(ENTCOValuesTypeFilterObj);

    if frmENTCOValuesTypeFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENTCOValuesTypeFilter.Create;
      FilterObject := ENTCOValuesTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTCOValuesTypeFilterEdit.Free;
    frmENTCOValuesTypeFilterEdit:=nil;
  end;}
end;


procedure TfrmENTCOValuesTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.