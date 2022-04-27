
unit ShowENSO2NodeType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENSO2NodeTypeController, AdvObj ;


type
    TfrmENSO2NodeTypeShow = class(TChildForm)  
    HTTPRIOENSO2NodeType: THTTPRIO;
    ImageList1: TImageList;
    sgENSO2NodeType: TAdvStringGrid;
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
    procedure sgENSO2NodeTypeTopLeftChanged(Sender: TObject);
    procedure sgENSO2NodeTypeDblClick(Sender: TObject);
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

//var
 // ENSO2NodeTypeObj: ENSO2NodeType;
 // ENSO2NodeTypeFilterObj: ENSO2NodeTypeFilter;
  
  
implementation

uses Main, EditENSO2NodeType, EditENSO2NodeTypeFilter;


{$R *.dfm}

var
  frmENSO2NodeTypeShow : TfrmENSO2NodeTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSO2NodeTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Наименование'
        );
   

procedure TfrmENSO2NodeTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENSO2NodeTypeShow:=nil;
  inherited;
end;


procedure TfrmENSO2NodeTypeShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENSO2NodeTypeShow.FormShow(Sender: TObject);
var
  TempENSO2NodeType: ENSO2NodeTypeControllerSoapPort;
  i: Integer;
  ENSO2NodeTypeList: ENSO2NodeTypeShortList;
begin
  SetGridHeaders(ENSO2NodeTypeHeaders, sgENSO2NodeType.ColumnHeaders);
  ColCount:=100;
  TempENSO2NodeType :=  HTTPRIOENSO2NodeType as ENSO2NodeTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSO2NodeTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSO2NodeTypeList := TempENSO2NodeType.getScrollableFilteredList(ENSO2NodeTypeFilter(FilterObject),0,ColCount);
  LastCount:=High(ENSO2NodeTypeList.list);

  if LastCount > -1 then
     sgENSO2NodeType.RowCount:=LastCount+2
  else
     sgENSO2NodeType.RowCount:=2;

   with sgENSO2NodeType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSO2NodeTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSO2NodeTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSO2NodeTypeList.list[i].name;
        LastRow:=i+1;
        sgENSO2NodeType.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENSO2NodeType.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENSO2NodeType.RowCount > selectedRow then
      sgENSO2NodeType.Row := selectedRow
    else
      sgENSO2NodeType.Row := sgENSO2NodeType.RowCount - 1;
    end
    else
      sgENSO2NodeType.Row:=1;   
end;


procedure TfrmENSO2NodeTypeShow.sgENSO2NodeTypeTopLeftChanged(Sender: TObject);
var
  TempENSO2NodeType: ENSO2NodeTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENSO2NodeTypeList: ENSO2NodeTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSO2NodeType.TopRow + sgENSO2NodeType.VisibleRowCount) = ColCount
  then
    begin
      TempENSO2NodeType :=  HTTPRIOENSO2NodeType as ENSO2NodeTypeControllerSoapPort;
      CurrentRow:=sgENSO2NodeType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSO2NodeTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSO2NodeTypeList := TempENSO2NodeType.getScrollableFilteredList(ENSO2NodeTypeFilter(FilterObject),ColCount-1, 100);


  sgENSO2NodeType.RowCount:=sgENSO2NodeType.RowCount+100;
  LastCount:=High(ENSO2NodeTypeList.list);
  with sgENSO2NodeType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSO2NodeTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSO2NodeTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSO2NodeTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSO2NodeType.Row:=CurrentRow-5;
   sgENSO2NodeType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSO2NodeTypeShow.sgENSO2NodeTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSO2NodeType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENSO2NodeTypeShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENSO2NodeType.RowCount-1 do
   for j:=0 to sgENSO2NodeType.ColCount-1 do
     sgENSO2NodeType.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENSO2NodeTypeShow.actViewExecute(Sender: TObject);
var 
  TempENSO2NodeType: ENSO2NodeTypeControllerSoapPort;
begin
  TempENSO2NodeType := HTTPRIOENSO2NodeType as ENSO2NodeTypeControllerSoapPort;
  try
    ENSO2NodeTypeObj := TempENSO2NodeType.getObject(StrToInt(sgENSO2NodeType.Cells[0,sgENSO2NodeType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSO2NodeType.Row;
  frmENSO2NodeTypeEdit:=TfrmENSO2NodeTypeEdit.Create(Application, dsView);
  
  try
    frmENSO2NodeTypeEdit.ShowModal;
  finally
    frmENSO2NodeTypeEdit.Free;
    frmENSO2NodeTypeEdit:=nil;
  end;

  if sgENSO2NodeType.RowCount > selectedRow then
    sgENSO2NodeType.Row := selectedRow
  else
    sgENSO2NodeType.Row := sgENSO2NodeType.RowCount - 1;
  
end;


procedure TfrmENSO2NodeTypeShow.actEditExecute(Sender: TObject);
var 
  TempENSO2NodeType: ENSO2NodeTypeControllerSoapPort;
begin
  TempENSO2NodeType := HTTPRIOENSO2NodeType as ENSO2NodeTypeControllerSoapPort;
  try
    ENSO2NodeTypeObj := TempENSO2NodeType.getObject(StrToInt(sgENSO2NodeType.Cells[0,sgENSO2NodeType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSO2NodeType.Row;
  frmENSO2NodeTypeEdit:=TfrmENSO2NodeTypeEdit.Create(Application, dsEdit);
  
  try
    if frmENSO2NodeTypeEdit.ShowModal= mrOk then
      begin
        //TempENSO2NodeType.save(ENSO2NodeTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSO2NodeTypeEdit.Free;
    frmENSO2NodeTypeEdit:=nil;
  end;

  if sgENSO2NodeType.RowCount > selectedRow then
    sgENSO2NodeType.Row := selectedRow
  else
    sgENSO2NodeType.Row := sgENSO2NodeType.RowCount - 1;
  
end;


procedure TfrmENSO2NodeTypeShow.actDeleteExecute(Sender: TObject);
Var TempENSO2NodeType: ENSO2NodeTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSO2NodeType := HTTPRIOENSO2NodeType as ENSO2NodeTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSO2NodeType.Cells[0,sgENSO2NodeType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип связки ServicesObject с узлом дерева CallCentre) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSO2NodeType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSO2NodeTypeShow.actInsertExecute(Sender: TObject);
// Var TempENSO2NodeType: ENSO2NodeTypeControllerSoapPort; 
begin
  // TempENSO2NodeType := HTTPRIOENSO2NodeType as ENSO2NodeTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSO2NodeTypeObj:=ENSO2NodeType.Create;
  SetNullIntProps(ENSO2NodeTypeObj);
  SetNullXSProps(ENSO2NodeTypeObj);



  try
    frmENSO2NodeTypeEdit:=TfrmENSO2NodeTypeEdit.Create(Application, dsInsert);
    try
      if frmENSO2NodeTypeEdit.ShowModal = mrOk then
      begin
        if ENSO2NodeTypeObj<>nil then
            //TempENSO2NodeType.add(ENSO2NodeTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSO2NodeTypeEdit.Free;
      frmENSO2NodeTypeEdit:=nil;
    end;
  finally
    ENSO2NodeTypeObj.Free;
  end;
end;


procedure TfrmENSO2NodeTypeShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENSO2NodeTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENSO2NodeTypeFilterEdit:=TfrmENSO2NodeTypeFilterEdit.Create(Application, dsInsert);
  try
    ENSO2NodeTypeFilterObj := ENSO2NodeTypeFilter.Create;
    SetNullIntProps(ENSO2NodeTypeFilterObj);
    SetNullXSProps(ENSO2NodeTypeFilterObj);

    if frmENSO2NodeTypeFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENSO2NodeTypeFilter.Create;
      FilterObject := ENSO2NodeTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSO2NodeTypeFilterEdit.Free;
    frmENSO2NodeTypeFilterEdit:=nil;
  end;}
end;


procedure TfrmENSO2NodeTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.