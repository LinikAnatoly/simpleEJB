
unit ShowENConnectionInstallationType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENConnectionInstallationTypeController, AdvObj ;


type
    TfrmENConnectionInstallationTypeShow = class(TChildForm)  
    HTTPRIOENConnectionInstallationType: THTTPRIO;
    ImageList1: TImageList;
    sgENConnectionInstallationType: TAdvStringGrid;
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
    procedure sgENConnectionInstallationTypeTopLeftChanged(Sender: TObject);
    procedure sgENConnectionInstallationTypeDblClick(Sender: TObject);
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
 // ENConnectionInstallationTypeObj: ENConnectionInstallationType;
 // ENConnectionInstallationTypeFilterObj: ENConnectionInstallationTypeFilter;
  
  
implementation

uses Main, EditENConnectionInstallationType, EditENConnectionInstallationTypeFilter;


{$R *.dfm}

var
  frmENConnectionInstallationTypeShow : TfrmENConnectionInstallationTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENConnectionInstallationTypeHeaders: array [1..3] of String =
        ( 'Код'
          ,'Найменування типу електроустановки приєднання'
          ,'Коефіцієнт'
        );
   

procedure TfrmENConnectionInstallationTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENConnectionInstallationTypeShow:=nil;
  inherited;
end;


procedure TfrmENConnectionInstallationTypeShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENConnectionInstallationTypeShow.FormShow(Sender: TObject);
var
  TempENConnectionInstallationType: ENConnectionInstallationTypeControllerSoapPort;
  i: Integer;
  ENConnectionInstallationTypeList: ENConnectionInstallationTypeShortList;
begin
  SetGridHeaders(ENConnectionInstallationTypeHeaders, sgENConnectionInstallationType.ColumnHeaders);
  ColCount:=100;
  TempENConnectionInstallationType :=  HTTPRIOENConnectionInstallationType as ENConnectionInstallationTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENConnectionInstallationTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENConnectionInstallationTypeList := TempENConnectionInstallationType.getScrollableFilteredList(ENConnectionInstallationTypeFilter(FilterObject),0,ColCount);
  LastCount:=High(ENConnectionInstallationTypeList.list);

  if LastCount > -1 then
     sgENConnectionInstallationType.RowCount:=LastCount+2
  else
     sgENConnectionInstallationType.RowCount:=2;

   with sgENConnectionInstallationType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENConnectionInstallationTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENConnectionInstallationTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENConnectionInstallationTypeList.list[i].name;
        if ENConnectionInstallationTypeList.list[i].coef = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENConnectionInstallationTypeList.list[i].coef.DecimalString;
        LastRow:=i+1;
        sgENConnectionInstallationType.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENConnectionInstallationType.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENConnectionInstallationType.RowCount > selectedRow then
      sgENConnectionInstallationType.Row := selectedRow
    else
      sgENConnectionInstallationType.Row := sgENConnectionInstallationType.RowCount - 1;
    end
    else
      sgENConnectionInstallationType.Row:=1;   
end;


procedure TfrmENConnectionInstallationTypeShow.sgENConnectionInstallationTypeTopLeftChanged(Sender: TObject);
var
  TempENConnectionInstallationType: ENConnectionInstallationTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENConnectionInstallationTypeList: ENConnectionInstallationTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENConnectionInstallationType.TopRow + sgENConnectionInstallationType.VisibleRowCount) = ColCount
  then
    begin
      TempENConnectionInstallationType :=  HTTPRIOENConnectionInstallationType as ENConnectionInstallationTypeControllerSoapPort;
      CurrentRow:=sgENConnectionInstallationType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENConnectionInstallationTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENConnectionInstallationTypeList := TempENConnectionInstallationType.getScrollableFilteredList(ENConnectionInstallationTypeFilter(FilterObject),ColCount-1, 100);


  sgENConnectionInstallationType.RowCount:=sgENConnectionInstallationType.RowCount+100;
  LastCount:=High(ENConnectionInstallationTypeList.list);
  with sgENConnectionInstallationType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENConnectionInstallationTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENConnectionInstallationTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENConnectionInstallationTypeList.list[i].name;
        if ENConnectionInstallationTypeList.list[i].coef = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENConnectionInstallationTypeList.list[i].coef.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENConnectionInstallationType.Row:=CurrentRow-5;
   sgENConnectionInstallationType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENConnectionInstallationTypeShow.sgENConnectionInstallationTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENConnectionInstallationType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENConnectionInstallationTypeShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENConnectionInstallationType.RowCount-1 do
   for j:=0 to sgENConnectionInstallationType.ColCount-1 do
     sgENConnectionInstallationType.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENConnectionInstallationTypeShow.actViewExecute(Sender: TObject);
var 
  TempENConnectionInstallationType: ENConnectionInstallationTypeControllerSoapPort;
begin
  TempENConnectionInstallationType := HTTPRIOENConnectionInstallationType as ENConnectionInstallationTypeControllerSoapPort;
  try
    ENConnectionInstallationTypeObj := TempENConnectionInstallationType.getObject(StrToInt(sgENConnectionInstallationType.Cells[0,sgENConnectionInstallationType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENConnectionInstallationType.Row;
  frmENConnectionInstallationTypeEdit:=TfrmENConnectionInstallationTypeEdit.Create(Application, dsView);
  
  try
    frmENConnectionInstallationTypeEdit.ShowModal;
  finally
    frmENConnectionInstallationTypeEdit.Free;
    frmENConnectionInstallationTypeEdit:=nil;
  end;

  if sgENConnectionInstallationType.RowCount > selectedRow then
    sgENConnectionInstallationType.Row := selectedRow
  else
    sgENConnectionInstallationType.Row := sgENConnectionInstallationType.RowCount - 1;
  
end;


procedure TfrmENConnectionInstallationTypeShow.actEditExecute(Sender: TObject);
var 
  TempENConnectionInstallationType: ENConnectionInstallationTypeControllerSoapPort;
begin
  TempENConnectionInstallationType := HTTPRIOENConnectionInstallationType as ENConnectionInstallationTypeControllerSoapPort;
  try
    ENConnectionInstallationTypeObj := TempENConnectionInstallationType.getObject(StrToInt(sgENConnectionInstallationType.Cells[0,sgENConnectionInstallationType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENConnectionInstallationType.Row;
  frmENConnectionInstallationTypeEdit:=TfrmENConnectionInstallationTypeEdit.Create(Application, dsEdit);
  
  try
    if frmENConnectionInstallationTypeEdit.ShowModal= mrOk then
      begin
        //TempENConnectionInstallationType.save(ENConnectionInstallationTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENConnectionInstallationTypeEdit.Free;
    frmENConnectionInstallationTypeEdit:=nil;
  end;

  if sgENConnectionInstallationType.RowCount > selectedRow then
    sgENConnectionInstallationType.Row := selectedRow
  else
    sgENConnectionInstallationType.Row := sgENConnectionInstallationType.RowCount - 1;
  
end;


procedure TfrmENConnectionInstallationTypeShow.actDeleteExecute(Sender: TObject);
Var TempENConnectionInstallationType: ENConnectionInstallationTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENConnectionInstallationType := HTTPRIOENConnectionInstallationType as ENConnectionInstallationTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENConnectionInstallationType.Cells[0,sgENConnectionInstallationType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип електроустановки приєднання) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENConnectionInstallationType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENConnectionInstallationTypeShow.actInsertExecute(Sender: TObject);
// Var TempENConnectionInstallationType: ENConnectionInstallationTypeControllerSoapPort; 
begin
  // TempENConnectionInstallationType := HTTPRIOENConnectionInstallationType as ENConnectionInstallationTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENConnectionInstallationTypeObj:=ENConnectionInstallationType.Create;
  SetNullIntProps(ENConnectionInstallationTypeObj);
  SetNullXSProps(ENConnectionInstallationTypeObj);

   //ENConnectionInstallationTypeObj.coef:= TXSDecimal.Create;


  try
    frmENConnectionInstallationTypeEdit:=TfrmENConnectionInstallationTypeEdit.Create(Application, dsInsert);
    try
      if frmENConnectionInstallationTypeEdit.ShowModal = mrOk then
      begin
        if ENConnectionInstallationTypeObj<>nil then
            //TempENConnectionInstallationType.add(ENConnectionInstallationTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENConnectionInstallationTypeEdit.Free;
      frmENConnectionInstallationTypeEdit:=nil;
    end;
  finally
    ENConnectionInstallationTypeObj.Free;
  end;
end;


procedure TfrmENConnectionInstallationTypeShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENConnectionInstallationTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENConnectionInstallationTypeFilterEdit:=TfrmENConnectionInstallationTypeFilterEdit.Create(Application, dsInsert);
  try
    ENConnectionInstallationTypeFilterObj := ENConnectionInstallationTypeFilter.Create;
    SetNullIntProps(ENConnectionInstallationTypeFilterObj);
    SetNullXSProps(ENConnectionInstallationTypeFilterObj);

    if frmENConnectionInstallationTypeFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENConnectionInstallationTypeFilter.Create;
      FilterObject := ENConnectionInstallationTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENConnectionInstallationTypeFilterEdit.Free;
    frmENConnectionInstallationTypeFilterEdit:=nil;
  end;}
end;


procedure TfrmENConnectionInstallationTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.