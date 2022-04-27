
unit ShowENServices2CalcAdditionalItems;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENServices2CalcAdditionalItemsController, AdvObj ;


type
    TfrmENServices2CalcAdditionalItemsShow = class(TChildForm)  
    HTTPRIOENServices2CalcAdditionalItems: THTTPRIO;
    ImageList1: TImageList;
    sgENServices2CalcAdditionalItems: TAdvStringGrid;
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
    procedure sgENServices2CalcAdditionalItemsTopLeftChanged(Sender: TObject);
    procedure sgENServices2CalcAdditionalItemsDblClick(Sender: TObject);
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
 // ENServices2CalcAdditionalItemsObj: ENServices2CalcAdditionalItems;
 // ENServices2CalcAdditionalItemsFilterObj: ENServices2CalcAdditionalItemsFilter;
  
  
implementation

uses Main, EditENServices2CalcAdditionalItems, EditENServices2CalcAdditionalItemsFilter;


{$R *.dfm}

var
  //frmENServices2CalcAdditionalItemsShow : TfrmENServices2CalcAdditionalItemsShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENServices2CalcAdditionalItemsHeaders: array [1..4] of String =
        ( 'Код'
          ,'Сумма'
          ,'кол-во'
          ,'Примечание'
        );
   

procedure TfrmENServices2CalcAdditionalItemsShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENServices2CalcAdditionalItemsShow:=nil;
  inherited;
end;


procedure TfrmENServices2CalcAdditionalItemsShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENServices2CalcAdditionalItemsShow.FormShow(Sender: TObject);
var
  TempENServices2CalcAdditionalItems: ENServices2CalcAdditionalItemsControllerSoapPort;
  i: Integer;
  ENServices2CalcAdditionalItemsList: ENServices2CalcAdditionalItemsShortList;
begin
  SetGridHeaders(ENServices2CalcAdditionalItemsHeaders, sgENServices2CalcAdditionalItems.ColumnHeaders);
  ColCount:=100;
  TempENServices2CalcAdditionalItems :=  HTTPRIOENServices2CalcAdditionalItems as ENServices2CalcAdditionalItemsControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENServices2CalcAdditionalItemsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENServices2CalcAdditionalItemsList := TempENServices2CalcAdditionalItems.getScrollableFilteredList(ENServices2CalcAdditionalItemsFilter(FilterObject),0,ColCount);
  LastCount:=High(ENServices2CalcAdditionalItemsList.list);

  if LastCount > -1 then
     sgENServices2CalcAdditionalItems.RowCount:=LastCount+2
  else
     sgENServices2CalcAdditionalItems.RowCount:=2;

   with sgENServices2CalcAdditionalItems do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENServices2CalcAdditionalItemsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENServices2CalcAdditionalItemsList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENServices2CalcAdditionalItemsList.list[i].summa = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENServices2CalcAdditionalItemsList.list[i].summa.DecimalString;
        if ENServices2CalcAdditionalItemsList.list[i].countgen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENServices2CalcAdditionalItemsList.list[i].countgen.DecimalString;
        Cells[3,i+1] := ENServices2CalcAdditionalItemsList.list[i].comment;
        LastRow:=i+1;
        sgENServices2CalcAdditionalItems.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENServices2CalcAdditionalItems.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENServices2CalcAdditionalItems.RowCount > selectedRow then
      sgENServices2CalcAdditionalItems.Row := selectedRow
    else
      sgENServices2CalcAdditionalItems.Row := sgENServices2CalcAdditionalItems.RowCount - 1;
    end
    else
      sgENServices2CalcAdditionalItems.Row:=1;   
end;


procedure TfrmENServices2CalcAdditionalItemsShow.sgENServices2CalcAdditionalItemsTopLeftChanged(Sender: TObject);
var
  TempENServices2CalcAdditionalItems: ENServices2CalcAdditionalItemsControllerSoapPort;
  i,CurrentRow: Integer;
  ENServices2CalcAdditionalItemsList: ENServices2CalcAdditionalItemsShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENServices2CalcAdditionalItems.TopRow + sgENServices2CalcAdditionalItems.VisibleRowCount) = ColCount
  then
    begin
      TempENServices2CalcAdditionalItems :=  HTTPRIOENServices2CalcAdditionalItems as ENServices2CalcAdditionalItemsControllerSoapPort;
      CurrentRow:=sgENServices2CalcAdditionalItems.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENServices2CalcAdditionalItemsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENServices2CalcAdditionalItemsList := TempENServices2CalcAdditionalItems.getScrollableFilteredList(ENServices2CalcAdditionalItemsFilter(FilterObject),ColCount-1, 100);


  sgENServices2CalcAdditionalItems.RowCount:=sgENServices2CalcAdditionalItems.RowCount+100;
  LastCount:=High(ENServices2CalcAdditionalItemsList.list);
  with sgENServices2CalcAdditionalItems do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENServices2CalcAdditionalItemsList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENServices2CalcAdditionalItemsList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENServices2CalcAdditionalItemsList.list[i].summa = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENServices2CalcAdditionalItemsList.list[i].summa.DecimalString;
        if ENServices2CalcAdditionalItemsList.list[i].countgen = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENServices2CalcAdditionalItemsList.list[i].countgen.DecimalString;
        Cells[3,i+CurrentRow] := ENServices2CalcAdditionalItemsList.list[i].comment;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENServices2CalcAdditionalItems.Row:=CurrentRow-5;
   sgENServices2CalcAdditionalItems.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENServices2CalcAdditionalItemsShow.sgENServices2CalcAdditionalItemsDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENServices2CalcAdditionalItems,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENServices2CalcAdditionalItemsShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENServices2CalcAdditionalItems.RowCount-1 do
   for j:=0 to sgENServices2CalcAdditionalItems.ColCount-1 do
     sgENServices2CalcAdditionalItems.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENServices2CalcAdditionalItemsShow.actViewExecute(Sender: TObject);
var 
  TempENServices2CalcAdditionalItems: ENServices2CalcAdditionalItemsControllerSoapPort;
begin
  TempENServices2CalcAdditionalItems := HTTPRIOENServices2CalcAdditionalItems as ENServices2CalcAdditionalItemsControllerSoapPort;
  try
    ENServices2CalcAdditionalItemsObj := TempENServices2CalcAdditionalItems.getObject(StrToInt(sgENServices2CalcAdditionalItems.Cells[0,sgENServices2CalcAdditionalItems.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENServices2CalcAdditionalItems.Row;
  frmENServices2CalcAdditionalItemsEdit:=TfrmENServices2CalcAdditionalItemsEdit.Create(Application, dsView);
  
  try
    frmENServices2CalcAdditionalItemsEdit.ShowModal;
  finally
    frmENServices2CalcAdditionalItemsEdit.Free;
    frmENServices2CalcAdditionalItemsEdit:=nil;
  end;

  if sgENServices2CalcAdditionalItems.RowCount > selectedRow then
    sgENServices2CalcAdditionalItems.Row := selectedRow
  else
    sgENServices2CalcAdditionalItems.Row := sgENServices2CalcAdditionalItems.RowCount - 1;
  
end;


procedure TfrmENServices2CalcAdditionalItemsShow.actEditExecute(Sender: TObject);
var 
  TempENServices2CalcAdditionalItems: ENServices2CalcAdditionalItemsControllerSoapPort;
begin
  TempENServices2CalcAdditionalItems := HTTPRIOENServices2CalcAdditionalItems as ENServices2CalcAdditionalItemsControllerSoapPort;
  try
    ENServices2CalcAdditionalItemsObj := TempENServices2CalcAdditionalItems.getObject(StrToInt(sgENServices2CalcAdditionalItems.Cells[0,sgENServices2CalcAdditionalItems.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENServices2CalcAdditionalItems.Row;
  frmENServices2CalcAdditionalItemsEdit:=TfrmENServices2CalcAdditionalItemsEdit.Create(Application, dsEdit);
  
  try
    if frmENServices2CalcAdditionalItemsEdit.ShowModal= mrOk then
      begin
        //TempENServices2CalcAdditionalItems.save(ENServices2CalcAdditionalItemsObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENServices2CalcAdditionalItemsEdit.Free;
    frmENServices2CalcAdditionalItemsEdit:=nil;
  end;

  if sgENServices2CalcAdditionalItems.RowCount > selectedRow then
    sgENServices2CalcAdditionalItems.Row := selectedRow
  else
    sgENServices2CalcAdditionalItems.Row := sgENServices2CalcAdditionalItems.RowCount - 1;
  
end;


procedure TfrmENServices2CalcAdditionalItemsShow.actDeleteExecute(Sender: TObject);
Var TempENServices2CalcAdditionalItems: ENServices2CalcAdditionalItemsControllerSoapPort;
  ObjCode: Integer;
begin
 TempENServices2CalcAdditionalItems := HTTPRIOENServices2CalcAdditionalItems as ENServices2CalcAdditionalItemsControllerSoapPort;
   try
     ObjCode := StrToInt(sgENServices2CalcAdditionalItems.Cells[0,sgENServices2CalcAdditionalItems.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Зв’язок договору послуг з додатковими параметрами розрахунку) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENServices2CalcAdditionalItems.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENServices2CalcAdditionalItemsShow.actInsertExecute(Sender: TObject);
// Var TempENServices2CalcAdditionalItems: ENServices2CalcAdditionalItemsControllerSoapPort; 
begin
  // TempENServices2CalcAdditionalItems := HTTPRIOENServices2CalcAdditionalItems as ENServices2CalcAdditionalItemsControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENServices2CalcAdditionalItemsObj:=ENServices2CalcAdditionalItems.Create;
  SetNullIntProps(ENServices2CalcAdditionalItemsObj);
  SetNullXSProps(ENServices2CalcAdditionalItemsObj);

   //ENServices2CalcAdditionalItemsObj.summa:= TXSDecimal.Create;
   //ENServices2CalcAdditionalItemsObj.countgen:= TXSDecimal.Create;


  try
    frmENServices2CalcAdditionalItemsEdit:=TfrmENServices2CalcAdditionalItemsEdit.Create(Application, dsInsert);
    try
      if frmENServices2CalcAdditionalItemsEdit.ShowModal = mrOk then
      begin
        if ENServices2CalcAdditionalItemsObj<>nil then
            //TempENServices2CalcAdditionalItems.add(ENServices2CalcAdditionalItemsObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENServices2CalcAdditionalItemsEdit.Free;
      frmENServices2CalcAdditionalItemsEdit:=nil;
    end;
  finally
    ENServices2CalcAdditionalItemsObj.Free;
  end;
end;


procedure TfrmENServices2CalcAdditionalItemsShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENServices2CalcAdditionalItemsShow.actFilterExecute(Sender: TObject);
begin
{frmENServices2CalcAdditionalItemsFilterEdit:=TfrmENServices2CalcAdditionalItemsFilterEdit.Create(Application, dsInsert);
  try
    ENServices2CalcAdditionalItemsFilterObj := ENServices2CalcAdditionalItemsFilter.Create;
    SetNullIntProps(ENServices2CalcAdditionalItemsFilterObj);
    SetNullXSProps(ENServices2CalcAdditionalItemsFilterObj);

    if frmENServices2CalcAdditionalItemsFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENServices2CalcAdditionalItemsFilter.Create;
      FilterObject := ENServices2CalcAdditionalItemsFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENServices2CalcAdditionalItemsFilterEdit.Free;
    frmENServices2CalcAdditionalItemsFilterEdit:=nil;
  end;}
end;


procedure TfrmENServices2CalcAdditionalItemsShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.