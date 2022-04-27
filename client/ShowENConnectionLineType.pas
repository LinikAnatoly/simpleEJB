
unit ShowENConnectionLineType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENConnectionLineTypeController, AdvObj ;


type
    TfrmENConnectionLineTypeShow = class(TChildForm)  
    HTTPRIOENConnectionLineType: THTTPRIO;
    ImageList1: TImageList;
    sgENConnectionLineType: TAdvStringGrid;
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
    procedure sgENConnectionLineTypeTopLeftChanged(Sender: TObject);
    procedure sgENConnectionLineTypeDblClick(Sender: TObject);
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
 // ENConnectionLineTypeObj: ENConnectionLineType;
 // ENConnectionLineTypeFilterObj: ENConnectionLineTypeFilter;
  
  
implementation

uses Main, EditENConnectionLineType, EditENConnectionLineTypeFilter;


{$R *.dfm}

var
  frmENConnectionLineTypeShow : TfrmENConnectionLineTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENConnectionLineTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Найменування типу лінії приєднання'
        );
   

procedure TfrmENConnectionLineTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENConnectionLineTypeShow:=nil;
  inherited;
end;


procedure TfrmENConnectionLineTypeShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENConnectionLineTypeShow.FormShow(Sender: TObject);
var
  TempENConnectionLineType: ENConnectionLineTypeControllerSoapPort;
  i: Integer;
  ENConnectionLineTypeList: ENConnectionLineTypeShortList;
begin
  SetGridHeaders(ENConnectionLineTypeHeaders, sgENConnectionLineType.ColumnHeaders);
  ColCount:=100;
  TempENConnectionLineType :=  HTTPRIOENConnectionLineType as ENConnectionLineTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENConnectionLineTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENConnectionLineTypeList := TempENConnectionLineType.getScrollableFilteredList(ENConnectionLineTypeFilter(FilterObject),0,ColCount);
  LastCount:=High(ENConnectionLineTypeList.list);

  if LastCount > -1 then
     sgENConnectionLineType.RowCount:=LastCount+2
  else
     sgENConnectionLineType.RowCount:=2;

   with sgENConnectionLineType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENConnectionLineTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENConnectionLineTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENConnectionLineTypeList.list[i].name;
        LastRow:=i+1;
        sgENConnectionLineType.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENConnectionLineType.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENConnectionLineType.RowCount > selectedRow then
      sgENConnectionLineType.Row := selectedRow
    else
      sgENConnectionLineType.Row := sgENConnectionLineType.RowCount - 1;
    end
    else
      sgENConnectionLineType.Row:=1;   
end;


procedure TfrmENConnectionLineTypeShow.sgENConnectionLineTypeTopLeftChanged(Sender: TObject);
var
  TempENConnectionLineType: ENConnectionLineTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENConnectionLineTypeList: ENConnectionLineTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENConnectionLineType.TopRow + sgENConnectionLineType.VisibleRowCount) = ColCount
  then
    begin
      TempENConnectionLineType :=  HTTPRIOENConnectionLineType as ENConnectionLineTypeControllerSoapPort;
      CurrentRow:=sgENConnectionLineType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENConnectionLineTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENConnectionLineTypeList := TempENConnectionLineType.getScrollableFilteredList(ENConnectionLineTypeFilter(FilterObject),ColCount-1, 100);


  sgENConnectionLineType.RowCount:=sgENConnectionLineType.RowCount+100;
  LastCount:=High(ENConnectionLineTypeList.list);
  with sgENConnectionLineType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENConnectionLineTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENConnectionLineTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENConnectionLineTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENConnectionLineType.Row:=CurrentRow-5;
   sgENConnectionLineType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENConnectionLineTypeShow.sgENConnectionLineTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENConnectionLineType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENConnectionLineTypeShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENConnectionLineType.RowCount-1 do
   for j:=0 to sgENConnectionLineType.ColCount-1 do
     sgENConnectionLineType.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENConnectionLineTypeShow.actViewExecute(Sender: TObject);
var 
  TempENConnectionLineType: ENConnectionLineTypeControllerSoapPort;
begin
  TempENConnectionLineType := HTTPRIOENConnectionLineType as ENConnectionLineTypeControllerSoapPort;
  try
    ENConnectionLineTypeObj := TempENConnectionLineType.getObject(StrToInt(sgENConnectionLineType.Cells[0,sgENConnectionLineType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENConnectionLineType.Row;
  frmENConnectionLineTypeEdit:=TfrmENConnectionLineTypeEdit.Create(Application, dsView);
  
  try
    frmENConnectionLineTypeEdit.ShowModal;
  finally
    frmENConnectionLineTypeEdit.Free;
    frmENConnectionLineTypeEdit:=nil;
  end;

  if sgENConnectionLineType.RowCount > selectedRow then
    sgENConnectionLineType.Row := selectedRow
  else
    sgENConnectionLineType.Row := sgENConnectionLineType.RowCount - 1;
  
end;


procedure TfrmENConnectionLineTypeShow.actEditExecute(Sender: TObject);
var 
  TempENConnectionLineType: ENConnectionLineTypeControllerSoapPort;
begin
  TempENConnectionLineType := HTTPRIOENConnectionLineType as ENConnectionLineTypeControllerSoapPort;
  try
    ENConnectionLineTypeObj := TempENConnectionLineType.getObject(StrToInt(sgENConnectionLineType.Cells[0,sgENConnectionLineType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENConnectionLineType.Row;
  frmENConnectionLineTypeEdit:=TfrmENConnectionLineTypeEdit.Create(Application, dsEdit);
  
  try
    if frmENConnectionLineTypeEdit.ShowModal= mrOk then
      begin
        //TempENConnectionLineType.save(ENConnectionLineTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENConnectionLineTypeEdit.Free;
    frmENConnectionLineTypeEdit:=nil;
  end;

  if sgENConnectionLineType.RowCount > selectedRow then
    sgENConnectionLineType.Row := selectedRow
  else
    sgENConnectionLineType.Row := sgENConnectionLineType.RowCount - 1;
  
end;


procedure TfrmENConnectionLineTypeShow.actDeleteExecute(Sender: TObject);
Var TempENConnectionLineType: ENConnectionLineTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENConnectionLineType := HTTPRIOENConnectionLineType as ENConnectionLineTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENConnectionLineType.Cells[0,sgENConnectionLineType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип лінії приєднання) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENConnectionLineType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENConnectionLineTypeShow.actInsertExecute(Sender: TObject);
// Var TempENConnectionLineType: ENConnectionLineTypeControllerSoapPort; 
begin
  // TempENConnectionLineType := HTTPRIOENConnectionLineType as ENConnectionLineTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENConnectionLineTypeObj:=ENConnectionLineType.Create;
  SetNullIntProps(ENConnectionLineTypeObj);
  SetNullXSProps(ENConnectionLineTypeObj);



  try
    frmENConnectionLineTypeEdit:=TfrmENConnectionLineTypeEdit.Create(Application, dsInsert);
    try
      if frmENConnectionLineTypeEdit.ShowModal = mrOk then
      begin
        if ENConnectionLineTypeObj<>nil then
            //TempENConnectionLineType.add(ENConnectionLineTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENConnectionLineTypeEdit.Free;
      frmENConnectionLineTypeEdit:=nil;
    end;
  finally
    ENConnectionLineTypeObj.Free;
  end;
end;


procedure TfrmENConnectionLineTypeShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENConnectionLineTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENConnectionLineTypeFilterEdit:=TfrmENConnectionLineTypeFilterEdit.Create(Application, dsInsert);
  try
    ENConnectionLineTypeFilterObj := ENConnectionLineTypeFilter.Create;
    SetNullIntProps(ENConnectionLineTypeFilterObj);
    SetNullXSProps(ENConnectionLineTypeFilterObj);

    if frmENConnectionLineTypeFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENConnectionLineTypeFilter.Create;
      FilterObject := ENConnectionLineTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENConnectionLineTypeFilterEdit.Free;
    frmENConnectionLineTypeFilterEdit:=nil;
  end;}
end;


procedure TfrmENConnectionLineTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.