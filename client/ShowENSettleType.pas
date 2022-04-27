
unit ShowENSettleType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENSettleTypeController, AdvObj ;


type
    TfrmENSettleTypeShow = class(TChildForm)  
    HTTPRIOENSettleType: THTTPRIO;
    ImageList1: TImageList;
    sgENSettleType: TAdvStringGrid;
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
    procedure sgENSettleTypeTopLeftChanged(Sender: TObject);
    procedure sgENSettleTypeDblClick(Sender: TObject);
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
 frmENSettleTypeShow : TfrmENSettleTypeShow;
 // ENSettleTypeObj: ENSettleType;
 // ENSettleTypeFilterObj: ENSettleTypeFilter;
  
  
implementation

uses Main, EditENSettleType, EditENSettleTypeFilter;


{$R *.dfm}

var
  //frmENSettleTypeShow : TfrmENSettleTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSettleTypeHeaders: array [1..3] of String =
        ( 'Код'
          ,'Тип місцевості (місто/село)'
          ,'Коефіцієнт'
        );
   

procedure TfrmENSettleTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENSettleTypeShow:=nil;
  inherited;
end;


procedure TfrmENSettleTypeShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENSettleTypeShow.FormShow(Sender: TObject);
var
  TempENSettleType: ENSettleTypeControllerSoapPort;
  i: Integer;
  ENSettleTypeList: ENSettleTypeShortList;
begin
  SetGridHeaders(ENSettleTypeHeaders, sgENSettleType.ColumnHeaders);
  ColCount:=100;
  TempENSettleType :=  HTTPRIOENSettleType as ENSettleTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSettleTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSettleTypeList := TempENSettleType.getScrollableFilteredList(ENSettleTypeFilter(FilterObject),0,ColCount);
  LastCount:=High(ENSettleTypeList.list);

  if LastCount > -1 then
     sgENSettleType.RowCount:=LastCount+2
  else
     sgENSettleType.RowCount:=2;

   with sgENSettleType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSettleTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSettleTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSettleTypeList.list[i].name;
        if ENSettleTypeList.list[i].coef = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENSettleTypeList.list[i].coef.DecimalString;
        LastRow:=i+1;
        sgENSettleType.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENSettleType.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENSettleType.RowCount > selectedRow then
      sgENSettleType.Row := selectedRow
    else
      sgENSettleType.Row := sgENSettleType.RowCount - 1;
    end
    else
      sgENSettleType.Row:=1;   
end;


procedure TfrmENSettleTypeShow.sgENSettleTypeTopLeftChanged(Sender: TObject);
var
  TempENSettleType: ENSettleTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENSettleTypeList: ENSettleTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSettleType.TopRow + sgENSettleType.VisibleRowCount) = ColCount
  then
    begin
      TempENSettleType :=  HTTPRIOENSettleType as ENSettleTypeControllerSoapPort;
      CurrentRow:=sgENSettleType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSettleTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSettleTypeList := TempENSettleType.getScrollableFilteredList(ENSettleTypeFilter(FilterObject),ColCount-1, 100);


  sgENSettleType.RowCount:=sgENSettleType.RowCount+100;
  LastCount:=High(ENSettleTypeList.list);
  with sgENSettleType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSettleTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSettleTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSettleTypeList.list[i].name;
        if ENSettleTypeList.list[i].coef = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENSettleTypeList.list[i].coef.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSettleType.Row:=CurrentRow-5;
   sgENSettleType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSettleTypeShow.sgENSettleTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSettleType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENSettleTypeShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENSettleType.RowCount-1 do
   for j:=0 to sgENSettleType.ColCount-1 do
     sgENSettleType.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENSettleTypeShow.actViewExecute(Sender: TObject);
var 
  TempENSettleType: ENSettleTypeControllerSoapPort;
begin
  TempENSettleType := HTTPRIOENSettleType as ENSettleTypeControllerSoapPort;
  try
    ENSettleTypeObj := TempENSettleType.getObject(StrToInt(sgENSettleType.Cells[0,sgENSettleType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSettleType.Row;
  frmENSettleTypeEdit:=TfrmENSettleTypeEdit.Create(Application, dsView);
  
  try
    frmENSettleTypeEdit.ShowModal;
  finally
    frmENSettleTypeEdit.Free;
    frmENSettleTypeEdit:=nil;
  end;

  if sgENSettleType.RowCount > selectedRow then
    sgENSettleType.Row := selectedRow
  else
    sgENSettleType.Row := sgENSettleType.RowCount - 1;
  
end;


procedure TfrmENSettleTypeShow.actEditExecute(Sender: TObject);
var 
  TempENSettleType: ENSettleTypeControllerSoapPort;
begin
  TempENSettleType := HTTPRIOENSettleType as ENSettleTypeControllerSoapPort;
  try
    ENSettleTypeObj := TempENSettleType.getObject(StrToInt(sgENSettleType.Cells[0,sgENSettleType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSettleType.Row;
  frmENSettleTypeEdit:=TfrmENSettleTypeEdit.Create(Application, dsEdit);
  
  try
    if frmENSettleTypeEdit.ShowModal= mrOk then
      begin
        //TempENSettleType.save(ENSettleTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSettleTypeEdit.Free;
    frmENSettleTypeEdit:=nil;
  end;

  if sgENSettleType.RowCount > selectedRow then
    sgENSettleType.Row := selectedRow
  else
    sgENSettleType.Row := sgENSettleType.RowCount - 1;
  
end;


procedure TfrmENSettleTypeShow.actDeleteExecute(Sender: TObject);
Var TempENSettleType: ENSettleTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSettleType := HTTPRIOENSettleType as ENSettleTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSettleType.Cells[0,sgENSettleType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип місцевості (місто/село)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSettleType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSettleTypeShow.actInsertExecute(Sender: TObject);
// Var TempENSettleType: ENSettleTypeControllerSoapPort; 
begin
  // TempENSettleType := HTTPRIOENSettleType as ENSettleTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSettleTypeObj:=ENSettleType.Create;
  SetNullIntProps(ENSettleTypeObj);
  SetNullXSProps(ENSettleTypeObj);

   //ENSettleTypeObj.coef:= TXSDecimal.Create;


  try
    frmENSettleTypeEdit:=TfrmENSettleTypeEdit.Create(Application, dsInsert);
    try
      if frmENSettleTypeEdit.ShowModal = mrOk then
      begin
        if ENSettleTypeObj<>nil then
            //TempENSettleType.add(ENSettleTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSettleTypeEdit.Free;
      frmENSettleTypeEdit:=nil;
    end;
  finally
    ENSettleTypeObj.Free;
  end;
end;


procedure TfrmENSettleTypeShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENSettleTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENSettleTypeFilterEdit:=TfrmENSettleTypeFilterEdit.Create(Application, dsInsert);
  try
    ENSettleTypeFilterObj := ENSettleTypeFilter.Create;
    SetNullIntProps(ENSettleTypeFilterObj);
    SetNullXSProps(ENSettleTypeFilterObj);

    if frmENSettleTypeFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENSettleTypeFilter.Create;
      FilterObject := ENSettleTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSettleTypeFilterEdit.Free;
    frmENSettleTypeFilterEdit:=nil;
  end;}
end;


procedure TfrmENSettleTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.