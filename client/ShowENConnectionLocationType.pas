
unit ShowENConnectionLocationType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENConnectionLocationTypeController, AdvObj ;


type
    TfrmENConnectionLocationTypeShow = class(TChildForm)  
    HTTPRIOENConnectionLocationType: THTTPRIO;
    ImageList1: TImageList;
    sgENConnectionLocationType: TAdvStringGrid;
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
    procedure sgENConnectionLocationTypeTopLeftChanged(Sender: TObject);
    procedure sgENConnectionLocationTypeDblClick(Sender: TObject);
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
 // ENConnectionLocationTypeObj: ENConnectionLocationType;
 // ENConnectionLocationTypeFilterObj: ENConnectionLocationTypeFilter;
  
  
implementation

uses Main, EditENConnectionLocationType, EditENConnectionLocationTypeFilter;


{$R *.dfm}

var
  frmENConnectionLocationTypeShow : TfrmENConnectionLocationTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENConnectionLocationTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Найменування типу розташування електроустановки приєднання'
        );
   

procedure TfrmENConnectionLocationTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENConnectionLocationTypeShow:=nil;
  inherited;
end;


procedure TfrmENConnectionLocationTypeShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENConnectionLocationTypeShow.FormShow(Sender: TObject);
var
  TempENConnectionLocationType: ENConnectionLocationTypeControllerSoapPort;
  i: Integer;
  ENConnectionLocationTypeList: ENConnectionLocationTypeShortList;
begin
  SetGridHeaders(ENConnectionLocationTypeHeaders, sgENConnectionLocationType.ColumnHeaders);
  ColCount:=100;
  TempENConnectionLocationType :=  HTTPRIOENConnectionLocationType as ENConnectionLocationTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENConnectionLocationTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENConnectionLocationTypeList := TempENConnectionLocationType.getScrollableFilteredList(ENConnectionLocationTypeFilter(FilterObject),0,ColCount);
  LastCount:=High(ENConnectionLocationTypeList.list);

  if LastCount > -1 then
     sgENConnectionLocationType.RowCount:=LastCount+2
  else
     sgENConnectionLocationType.RowCount:=2;

   with sgENConnectionLocationType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENConnectionLocationTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENConnectionLocationTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENConnectionLocationTypeList.list[i].name;
        LastRow:=i+1;
        sgENConnectionLocationType.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENConnectionLocationType.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENConnectionLocationType.RowCount > selectedRow then
      sgENConnectionLocationType.Row := selectedRow
    else
      sgENConnectionLocationType.Row := sgENConnectionLocationType.RowCount - 1;
    end
    else
      sgENConnectionLocationType.Row:=1;   
end;


procedure TfrmENConnectionLocationTypeShow.sgENConnectionLocationTypeTopLeftChanged(Sender: TObject);
var
  TempENConnectionLocationType: ENConnectionLocationTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENConnectionLocationTypeList: ENConnectionLocationTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENConnectionLocationType.TopRow + sgENConnectionLocationType.VisibleRowCount) = ColCount
  then
    begin
      TempENConnectionLocationType :=  HTTPRIOENConnectionLocationType as ENConnectionLocationTypeControllerSoapPort;
      CurrentRow:=sgENConnectionLocationType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENConnectionLocationTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENConnectionLocationTypeList := TempENConnectionLocationType.getScrollableFilteredList(ENConnectionLocationTypeFilter(FilterObject),ColCount-1, 100);


  sgENConnectionLocationType.RowCount:=sgENConnectionLocationType.RowCount+100;
  LastCount:=High(ENConnectionLocationTypeList.list);
  with sgENConnectionLocationType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENConnectionLocationTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENConnectionLocationTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENConnectionLocationTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENConnectionLocationType.Row:=CurrentRow-5;
   sgENConnectionLocationType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENConnectionLocationTypeShow.sgENConnectionLocationTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENConnectionLocationType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENConnectionLocationTypeShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENConnectionLocationType.RowCount-1 do
   for j:=0 to sgENConnectionLocationType.ColCount-1 do
     sgENConnectionLocationType.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENConnectionLocationTypeShow.actViewExecute(Sender: TObject);
var 
  TempENConnectionLocationType: ENConnectionLocationTypeControllerSoapPort;
begin
  TempENConnectionLocationType := HTTPRIOENConnectionLocationType as ENConnectionLocationTypeControllerSoapPort;
  try
    ENConnectionLocationTypeObj := TempENConnectionLocationType.getObject(StrToInt(sgENConnectionLocationType.Cells[0,sgENConnectionLocationType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENConnectionLocationType.Row;
  frmENConnectionLocationTypeEdit:=TfrmENConnectionLocationTypeEdit.Create(Application, dsView);
  
  try
    frmENConnectionLocationTypeEdit.ShowModal;
  finally
    frmENConnectionLocationTypeEdit.Free;
    frmENConnectionLocationTypeEdit:=nil;
  end;

  if sgENConnectionLocationType.RowCount > selectedRow then
    sgENConnectionLocationType.Row := selectedRow
  else
    sgENConnectionLocationType.Row := sgENConnectionLocationType.RowCount - 1;
  
end;


procedure TfrmENConnectionLocationTypeShow.actEditExecute(Sender: TObject);
var 
  TempENConnectionLocationType: ENConnectionLocationTypeControllerSoapPort;
begin
  TempENConnectionLocationType := HTTPRIOENConnectionLocationType as ENConnectionLocationTypeControllerSoapPort;
  try
    ENConnectionLocationTypeObj := TempENConnectionLocationType.getObject(StrToInt(sgENConnectionLocationType.Cells[0,sgENConnectionLocationType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENConnectionLocationType.Row;
  frmENConnectionLocationTypeEdit:=TfrmENConnectionLocationTypeEdit.Create(Application, dsEdit);
  
  try
    if frmENConnectionLocationTypeEdit.ShowModal= mrOk then
      begin
        //TempENConnectionLocationType.save(ENConnectionLocationTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENConnectionLocationTypeEdit.Free;
    frmENConnectionLocationTypeEdit:=nil;
  end;

  if sgENConnectionLocationType.RowCount > selectedRow then
    sgENConnectionLocationType.Row := selectedRow
  else
    sgENConnectionLocationType.Row := sgENConnectionLocationType.RowCount - 1;
  
end;


procedure TfrmENConnectionLocationTypeShow.actDeleteExecute(Sender: TObject);
Var TempENConnectionLocationType: ENConnectionLocationTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENConnectionLocationType := HTTPRIOENConnectionLocationType as ENConnectionLocationTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENConnectionLocationType.Cells[0,sgENConnectionLocationType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип розташування електроустановки приєднання) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENConnectionLocationType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENConnectionLocationTypeShow.actInsertExecute(Sender: TObject);
// Var TempENConnectionLocationType: ENConnectionLocationTypeControllerSoapPort; 
begin
  // TempENConnectionLocationType := HTTPRIOENConnectionLocationType as ENConnectionLocationTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENConnectionLocationTypeObj:=ENConnectionLocationType.Create;
  SetNullIntProps(ENConnectionLocationTypeObj);
  SetNullXSProps(ENConnectionLocationTypeObj);



  try
    frmENConnectionLocationTypeEdit:=TfrmENConnectionLocationTypeEdit.Create(Application, dsInsert);
    try
      if frmENConnectionLocationTypeEdit.ShowModal = mrOk then
      begin
        if ENConnectionLocationTypeObj<>nil then
            //TempENConnectionLocationType.add(ENConnectionLocationTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENConnectionLocationTypeEdit.Free;
      frmENConnectionLocationTypeEdit:=nil;
    end;
  finally
    ENConnectionLocationTypeObj.Free;
  end;
end;


procedure TfrmENConnectionLocationTypeShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENConnectionLocationTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENConnectionLocationTypeFilterEdit:=TfrmENConnectionLocationTypeFilterEdit.Create(Application, dsInsert);
  try
    ENConnectionLocationTypeFilterObj := ENConnectionLocationTypeFilter.Create;
    SetNullIntProps(ENConnectionLocationTypeFilterObj);
    SetNullXSProps(ENConnectionLocationTypeFilterObj);

    if frmENConnectionLocationTypeFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENConnectionLocationTypeFilter.Create;
      FilterObject := ENConnectionLocationTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENConnectionLocationTypeFilterEdit.Free;
    frmENConnectionLocationTypeFilterEdit:=nil;
  end;}
end;


procedure TfrmENConnectionLocationTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.