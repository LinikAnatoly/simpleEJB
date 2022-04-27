
unit ShowENRegForSupplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENRegForSupplierController, AdvObj ;


type
    TfrmENRegForSupplierShow = class(TChildForm)  
    HTTPRIOENRegForSupplier: THTTPRIO;
    ImageList1: TImageList;
    sgENRegForSupplier: TAdvStringGrid;
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
    procedure sgENRegForSupplierTopLeftChanged(Sender: TObject);
    procedure sgENRegForSupplierDblClick(Sender: TObject);
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
 // ENRegForSupplierObj: ENRegForSupplier;
 // ENRegForSupplierFilterObj: ENRegForSupplierFilter;
  frmENRegForSupplierShow: TfrmENRegForSupplierShow;
  
implementation

uses Main, EditENRegForSupplier, EditENRegForSupplierFilter;


{$R *.dfm}

var
  //frmENRegForSupplierShow : TfrmENRegForSupplierShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENRegForSupplierHeaders: array [1..9] of String =
        ( 'Код'
          ,'№ реєстру'
          ,'Дата з'
          ,'Дата по'
          ,'Постачальник'
          ,'Статус'
          ,'Примітка'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmENRegForSupplierShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENRegForSupplierShow:=nil;
  inherited;
end;


procedure TfrmENRegForSupplierShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENRegForSupplierShow.FormShow(Sender: TObject);
var
  TempENRegForSupplier: ENRegForSupplierControllerSoapPort;
  i: Integer;
  ENRegForSupplierList: ENRegForSupplierShortList;
begin
  SetGridHeaders(ENRegForSupplierHeaders, sgENRegForSupplier.ColumnHeaders);
  ColCount:=100;
  TempENRegForSupplier :=  HTTPRIOENRegForSupplier as ENRegForSupplierControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENRegForSupplierFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENRegForSupplierList := TempENRegForSupplier.getScrollableFilteredList(ENRegForSupplierFilter(FilterObject),0,ColCount);
  LastCount:=High(ENRegForSupplierList.list);

  if LastCount > -1 then
     sgENRegForSupplier.RowCount:=LastCount+2
  else
     sgENRegForSupplier.RowCount:=2;

   with sgENRegForSupplier do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENRegForSupplierList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENRegForSupplierList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENRegForSupplierList.list[i].numberGen;
        if ENRegForSupplierList.list[i].dateFrom = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENRegForSupplierList.list[i].dateFrom);
        if ENRegForSupplierList.list[i].dateTo = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENRegForSupplierList.list[i].dateTo);
        {
        if ENRegForSupplierList.list[i].supplierCode = Low(Integer) then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := IntToStr(ENRegForSupplierList.list[i].supplierCode);
        }
        Cells[4,i+1] := ENRegForSupplierList.list[i].supplierName;
        Cells[5,i+1] := ENRegForSupplierList.list[i].statusRefName;
        Cells[6,i+1] := ENRegForSupplierList.list[i].commentGen;
        Cells[7,i+1] := ENRegForSupplierList.list[i].userGen;
        if ENRegForSupplierList.list[i].dateEdit = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := XSDateTimeWithDate2String(ENRegForSupplierList.list[i].dateEdit);
        LastRow:=i+1;
        sgENRegForSupplier.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENRegForSupplier.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENRegForSupplier.RowCount > selectedRow then
      sgENRegForSupplier.Row := selectedRow
    else
      sgENRegForSupplier.Row := sgENRegForSupplier.RowCount - 1;
    end
    else
      sgENRegForSupplier.Row:=1;   
end;


procedure TfrmENRegForSupplierShow.sgENRegForSupplierTopLeftChanged(Sender: TObject);
var
  TempENRegForSupplier: ENRegForSupplierControllerSoapPort;
  i,CurrentRow: Integer;
  ENRegForSupplierList: ENRegForSupplierShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENRegForSupplier.TopRow + sgENRegForSupplier.VisibleRowCount) = ColCount
  then
    begin
      TempENRegForSupplier :=  HTTPRIOENRegForSupplier as ENRegForSupplierControllerSoapPort;
      CurrentRow:=sgENRegForSupplier.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENRegForSupplierFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENRegForSupplierList := TempENRegForSupplier.getScrollableFilteredList(ENRegForSupplierFilter(FilterObject),ColCount-1, 100);


  sgENRegForSupplier.RowCount:=sgENRegForSupplier.RowCount+100;
  LastCount:=High(ENRegForSupplierList.list);
  with sgENRegForSupplier do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENRegForSupplierList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENRegForSupplierList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENRegForSupplierList.list[i].numberGen;
        if ENRegForSupplierList.list[i].dateFrom = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENRegForSupplierList.list[i].dateFrom);
        if ENRegForSupplierList.list[i].dateTo = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(ENRegForSupplierList.list[i].dateTo);
        {
        if ENRegForSupplierList.list[i].supplierCode = Low(Integer) then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := IntToStr(ENRegForSupplierList.list[i].supplierCode);
        }
        Cells[4,i+CurrentRow] := ENRegForSupplierList.list[i].supplierName;
        Cells[5,i+CurrentRow] := ENRegForSupplierList.list[i].statusRefName;
        Cells[6,i+CurrentRow] := ENRegForSupplierList.list[i].commentGen;
        Cells[7,i+CurrentRow] := ENRegForSupplierList.list[i].userGen;
        if ENRegForSupplierList.list[i].dateEdit = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := XSDateTimeWithDate2String(ENRegForSupplierList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENRegForSupplier.Row:=CurrentRow-5;
   sgENRegForSupplier.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENRegForSupplierShow.sgENRegForSupplierDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENRegForSupplier,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENRegForSupplierShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENRegForSupplier.RowCount-1 do
   for j:=0 to sgENRegForSupplier.ColCount-1 do
     sgENRegForSupplier.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENRegForSupplierShow.actViewExecute(Sender: TObject);
var 
  TempENRegForSupplier: ENRegForSupplierControllerSoapPort;
begin
  TempENRegForSupplier := HTTPRIOENRegForSupplier as ENRegForSupplierControllerSoapPort;
  try
    ENRegForSupplierObj := TempENRegForSupplier.getObject(StrToInt(sgENRegForSupplier.Cells[0,sgENRegForSupplier.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENRegForSupplier.Row;
  frmENRegForSupplierEdit:=TfrmENRegForSupplierEdit.Create(Application, dsView);
  
  try
    frmENRegForSupplierEdit.ShowModal;
  finally
    frmENRegForSupplierEdit.Free;
    frmENRegForSupplierEdit:=nil;
  end;

  if sgENRegForSupplier.RowCount > selectedRow then
    sgENRegForSupplier.Row := selectedRow
  else
    sgENRegForSupplier.Row := sgENRegForSupplier.RowCount - 1;
  
end;


procedure TfrmENRegForSupplierShow.actEditExecute(Sender: TObject);
var 
  TempENRegForSupplier: ENRegForSupplierControllerSoapPort;
begin
  TempENRegForSupplier := HTTPRIOENRegForSupplier as ENRegForSupplierControllerSoapPort;
  try
    ENRegForSupplierObj := TempENRegForSupplier.getObject(StrToInt(sgENRegForSupplier.Cells[0,sgENRegForSupplier.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENRegForSupplier.Row;
  frmENRegForSupplierEdit:=TfrmENRegForSupplierEdit.Create(Application, dsEdit);
  
  try
    if frmENRegForSupplierEdit.ShowModal= mrOk then
      begin
        //TempENRegForSupplier.save(ENRegForSupplierObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENRegForSupplierEdit.Free;
    frmENRegForSupplierEdit:=nil;
  end;

  if sgENRegForSupplier.RowCount > selectedRow then
    sgENRegForSupplier.Row := selectedRow
  else
    sgENRegForSupplier.Row := sgENRegForSupplier.RowCount - 1;
  
end;


procedure TfrmENRegForSupplierShow.actDeleteExecute(Sender: TObject);
Var TempENRegForSupplier: ENRegForSupplierControllerSoapPort;
  ObjCode: Integer;
begin
 TempENRegForSupplier := HTTPRIOENRegForSupplier as ENRegForSupplierControllerSoapPort;
   try
     ObjCode := StrToInt(sgENRegForSupplier.Cells[0,sgENRegForSupplier.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Реєстр підключень/відключень для відшкодування Постачальником) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENRegForSupplier.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENRegForSupplierShow.actInsertExecute(Sender: TObject);
// Var TempENRegForSupplier: ENRegForSupplierControllerSoapPort; 
begin
  // TempENRegForSupplier := HTTPRIOENRegForSupplier as ENRegForSupplierControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENRegForSupplierObj:=ENRegForSupplier.Create;
  SetNullIntProps(ENRegForSupplierObj);
  SetNullXSProps(ENRegForSupplierObj);

   //ENRegForSupplierObj.dateFrom:= TXSDate.Create;
   //ENRegForSupplierObj.dateTo:= TXSDate.Create;
   //ENRegForSupplierObj.dateAdd:= TXSDateTime.Create;
   
   //ENRegForSupplierObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENRegForSupplierEdit:=TfrmENRegForSupplierEdit.Create(Application, dsInsert);
    try
      if frmENRegForSupplierEdit.ShowModal = mrOk then
      begin
        if ENRegForSupplierObj<>nil then
            //TempENRegForSupplier.add(ENRegForSupplierObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENRegForSupplierEdit.Free;
      frmENRegForSupplierEdit:=nil;
    end;
  finally
    ENRegForSupplierObj.Free;
  end;
end;


procedure TfrmENRegForSupplierShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENRegForSupplierShow.actFilterExecute(Sender: TObject);
begin
{frmENRegForSupplierFilterEdit:=TfrmENRegForSupplierFilterEdit.Create(Application, dsInsert);
  try
    ENRegForSupplierFilterObj := ENRegForSupplierFilter.Create;
    SetNullIntProps(ENRegForSupplierFilterObj);
    SetNullXSProps(ENRegForSupplierFilterObj);

    if frmENRegForSupplierFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENRegForSupplierFilter.Create;
      FilterObject := ENRegForSupplierFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENRegForSupplierFilterEdit.Free;
    frmENRegForSupplierFilterEdit:=nil;
  end;}
end;


procedure TfrmENRegForSupplierShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.