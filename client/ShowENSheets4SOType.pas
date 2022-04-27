
unit ShowENSheets4SOType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENSheets4SOTypeController, AdvObj ;


type
    TfrmENSheets4SOTypeShow = class(TChildForm)  
    HTTPRIOENSheets4SOType: THTTPRIO;
    ImageList1: TImageList;
    sgENSheets4SOType: TAdvStringGrid;
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
    procedure sgENSheets4SOTypeTopLeftChanged(Sender: TObject);
    procedure sgENSheets4SOTypeDblClick(Sender: TObject);
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
 frmENSheets4SOTypeShow : TfrmENSheets4SOTypeShow;
 // ENSheets4SOTypeObj: ENSheets4SOType;
 // ENSheets4SOTypeFilterObj: ENSheets4SOTypeFilter;
  
  
implementation

uses Main, EditENSheets4SOType, EditENSheets4SOTypeFilter;


{$R *.dfm}

var
  //frmENSheets4SOTypeShow : TfrmENSheets4SOTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSheets4SOTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmENSheets4SOTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENSheets4SOTypeShow:=nil;
  inherited;
end;


procedure TfrmENSheets4SOTypeShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENSheets4SOTypeShow.FormShow(Sender: TObject);
var
  TempENSheets4SOType: ENSheets4SOTypeControllerSoapPort;
  i: Integer;
  ENSheets4SOTypeList: ENSheets4SOTypeShortList;
begin
  SetGridHeaders(ENSheets4SOTypeHeaders, sgENSheets4SOType.ColumnHeaders);
  ColCount:=100;
  TempENSheets4SOType :=  HTTPRIOENSheets4SOType as ENSheets4SOTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSheets4SOTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSheets4SOTypeList := TempENSheets4SOType.getScrollableFilteredList(ENSheets4SOTypeFilter(FilterObject),0,ColCount);
  LastCount:=High(ENSheets4SOTypeList.list);

  if LastCount > -1 then
     sgENSheets4SOType.RowCount:=LastCount+2
  else
     sgENSheets4SOType.RowCount:=2;

   with sgENSheets4SOType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSheets4SOTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSheets4SOTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSheets4SOTypeList.list[i].name;
        LastRow:=i+1;
        sgENSheets4SOType.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENSheets4SOType.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENSheets4SOType.RowCount > selectedRow then
      sgENSheets4SOType.Row := selectedRow
    else
      sgENSheets4SOType.Row := sgENSheets4SOType.RowCount - 1;
    end
    else
      sgENSheets4SOType.Row:=1;   
end;


procedure TfrmENSheets4SOTypeShow.sgENSheets4SOTypeTopLeftChanged(Sender: TObject);
var
  TempENSheets4SOType: ENSheets4SOTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENSheets4SOTypeList: ENSheets4SOTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSheets4SOType.TopRow + sgENSheets4SOType.VisibleRowCount) = ColCount
  then
    begin
      TempENSheets4SOType :=  HTTPRIOENSheets4SOType as ENSheets4SOTypeControllerSoapPort;
      CurrentRow:=sgENSheets4SOType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSheets4SOTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSheets4SOTypeList := TempENSheets4SOType.getScrollableFilteredList(ENSheets4SOTypeFilter(FilterObject),ColCount-1, 100);


  sgENSheets4SOType.RowCount:=sgENSheets4SOType.RowCount+100;
  LastCount:=High(ENSheets4SOTypeList.list);
  with sgENSheets4SOType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSheets4SOTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSheets4SOTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSheets4SOTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSheets4SOType.Row:=CurrentRow-5;
   sgENSheets4SOType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSheets4SOTypeShow.sgENSheets4SOTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSheets4SOType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENSheets4SOTypeShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENSheets4SOType.RowCount-1 do
   for j:=0 to sgENSheets4SOType.ColCount-1 do
     sgENSheets4SOType.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENSheets4SOTypeShow.actViewExecute(Sender: TObject);
var 
  TempENSheets4SOType: ENSheets4SOTypeControllerSoapPort;
begin
  TempENSheets4SOType := HTTPRIOENSheets4SOType as ENSheets4SOTypeControllerSoapPort;
  try
    ENSheets4SOTypeObj := TempENSheets4SOType.getObject(StrToInt(sgENSheets4SOType.Cells[0,sgENSheets4SOType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSheets4SOType.Row;
  frmENSheets4SOTypeEdit:=TfrmENSheets4SOTypeEdit.Create(Application, dsView);
  
  try
    frmENSheets4SOTypeEdit.ShowModal;
  finally
    frmENSheets4SOTypeEdit.Free;
    frmENSheets4SOTypeEdit:=nil;
  end;

  if sgENSheets4SOType.RowCount > selectedRow then
    sgENSheets4SOType.Row := selectedRow
  else
    sgENSheets4SOType.Row := sgENSheets4SOType.RowCount - 1;
  
end;


procedure TfrmENSheets4SOTypeShow.actEditExecute(Sender: TObject);
var 
  TempENSheets4SOType: ENSheets4SOTypeControllerSoapPort;
begin
  TempENSheets4SOType := HTTPRIOENSheets4SOType as ENSheets4SOTypeControllerSoapPort;
  try
    ENSheets4SOTypeObj := TempENSheets4SOType.getObject(StrToInt(sgENSheets4SOType.Cells[0,sgENSheets4SOType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSheets4SOType.Row;
  frmENSheets4SOTypeEdit:=TfrmENSheets4SOTypeEdit.Create(Application, dsEdit);
  
  try
    if frmENSheets4SOTypeEdit.ShowModal= mrOk then
      begin
        //TempENSheets4SOType.save(ENSheets4SOTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSheets4SOTypeEdit.Free;
    frmENSheets4SOTypeEdit:=nil;
  end;

  if sgENSheets4SOType.RowCount > selectedRow then
    sgENSheets4SOType.Row := selectedRow
  else
    sgENSheets4SOType.Row := sgENSheets4SOType.RowCount - 1;
  
end;


procedure TfrmENSheets4SOTypeShow.actDeleteExecute(Sender: TObject);
Var TempENSheets4SOType: ENSheets4SOTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSheets4SOType := HTTPRIOENSheets4SOType as ENSheets4SOTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSheets4SOType.Cells[0,sgENSheets4SOType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Типи вихідних листів для договорів) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSheets4SOType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSheets4SOTypeShow.actInsertExecute(Sender: TObject);
// Var TempENSheets4SOType: ENSheets4SOTypeControllerSoapPort; 
begin
  // TempENSheets4SOType := HTTPRIOENSheets4SOType as ENSheets4SOTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSheets4SOTypeObj:=ENSheets4SOType.Create;
  SetNullIntProps(ENSheets4SOTypeObj);
  SetNullXSProps(ENSheets4SOTypeObj);



  try
    frmENSheets4SOTypeEdit:=TfrmENSheets4SOTypeEdit.Create(Application, dsInsert);
    try
      if frmENSheets4SOTypeEdit.ShowModal = mrOk then
      begin
        if ENSheets4SOTypeObj<>nil then
            //TempENSheets4SOType.add(ENSheets4SOTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSheets4SOTypeEdit.Free;
      frmENSheets4SOTypeEdit:=nil;
    end;
  finally
    ENSheets4SOTypeObj.Free;
  end;
end;


procedure TfrmENSheets4SOTypeShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENSheets4SOTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENSheets4SOTypeFilterEdit:=TfrmENSheets4SOTypeFilterEdit.Create(Application, dsInsert);
  try
    ENSheets4SOTypeFilterObj := ENSheets4SOTypeFilter.Create;
    SetNullIntProps(ENSheets4SOTypeFilterObj);
    SetNullXSProps(ENSheets4SOTypeFilterObj);

    if frmENSheets4SOTypeFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENSheets4SOTypeFilter.Create;
      FilterObject := ENSheets4SOTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSheets4SOTypeFilterEdit.Free;
    frmENSheets4SOTypeFilterEdit:=nil;
  end;}
end;


procedure TfrmENSheets4SOTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.