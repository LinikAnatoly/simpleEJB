
unit ShowENCalcPowerReserveItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENCalcPowerReserveItemController, AdvObj ;


type
    TfrmENCalcPowerReserveItemShow = class(TChildForm)  
    HTTPRIOENCalcPowerReserveItem: THTTPRIO;
    ImageList1: TImageList;
    sgENCalcPowerReserveItem: TAdvStringGrid;
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
    procedure sgENCalcPowerReserveItemTopLeftChanged(Sender: TObject);
    procedure sgENCalcPowerReserveItemDblClick(Sender: TObject);
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
 // ENCalcPowerReserveItemObj: ENCalcPowerReserveItem;
 // ENCalcPowerReserveItemFilterObj: ENCalcPowerReserveItemFilter;
  
  
implementation

uses Main, EditENCalcPowerReserveItem, EditENCalcPowerReserveItemFilter;


{$R *.dfm}

var
  //frmENCalcPowerReserveItemShow : TfrmENCalcPowerReserveItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENCalcPowerReserveItemHeaders: array [1..3] of String =
        ( 'Код'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmENCalcPowerReserveItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENCalcPowerReserveItemShow:=nil;
  inherited;
end;


procedure TfrmENCalcPowerReserveItemShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENCalcPowerReserveItemShow.FormShow(Sender: TObject);
var
  TempENCalcPowerReserveItem: ENCalcPowerReserveItemControllerSoapPort;
  i: Integer;
  ENCalcPowerReserveItemList: ENCalcPowerReserveItemShortList;
begin
  SetGridHeaders(ENCalcPowerReserveItemHeaders, sgENCalcPowerReserveItem.ColumnHeaders);
  ColCount:=100;
  TempENCalcPowerReserveItem :=  HTTPRIOENCalcPowerReserveItem as ENCalcPowerReserveItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENCalcPowerReserveItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCalcPowerReserveItemList := TempENCalcPowerReserveItem.getScrollableFilteredList(ENCalcPowerReserveItemFilter(FilterObject),0,ColCount);
  LastCount:=High(ENCalcPowerReserveItemList.list);

  if LastCount > -1 then
     sgENCalcPowerReserveItem.RowCount:=LastCount+2
  else
     sgENCalcPowerReserveItem.RowCount:=2;

   with sgENCalcPowerReserveItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCalcPowerReserveItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENCalcPowerReserveItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENCalcPowerReserveItemList.list[i].userGen;
        if ENCalcPowerReserveItemList.list[i].dateEdit = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDateTimeWithDate2String(ENCalcPowerReserveItemList.list[i].dateEdit);
        LastRow:=i+1;
        sgENCalcPowerReserveItem.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENCalcPowerReserveItem.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENCalcPowerReserveItem.RowCount > selectedRow then
      sgENCalcPowerReserveItem.Row := selectedRow
    else
      sgENCalcPowerReserveItem.Row := sgENCalcPowerReserveItem.RowCount - 1;
    end
    else
      sgENCalcPowerReserveItem.Row:=1;   
end;


procedure TfrmENCalcPowerReserveItemShow.sgENCalcPowerReserveItemTopLeftChanged(Sender: TObject);
var
  TempENCalcPowerReserveItem: ENCalcPowerReserveItemControllerSoapPort;
  i,CurrentRow: Integer;
  ENCalcPowerReserveItemList: ENCalcPowerReserveItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENCalcPowerReserveItem.TopRow + sgENCalcPowerReserveItem.VisibleRowCount) = ColCount
  then
    begin
      TempENCalcPowerReserveItem :=  HTTPRIOENCalcPowerReserveItem as ENCalcPowerReserveItemControllerSoapPort;
      CurrentRow:=sgENCalcPowerReserveItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENCalcPowerReserveItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCalcPowerReserveItemList := TempENCalcPowerReserveItem.getScrollableFilteredList(ENCalcPowerReserveItemFilter(FilterObject),ColCount-1, 100);


  sgENCalcPowerReserveItem.RowCount:=sgENCalcPowerReserveItem.RowCount+100;
  LastCount:=High(ENCalcPowerReserveItemList.list);
  with sgENCalcPowerReserveItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCalcPowerReserveItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENCalcPowerReserveItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENCalcPowerReserveItemList.list[i].userGen;
        if ENCalcPowerReserveItemList.list[i].dateEdit = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDateTimeWithDate2String(ENCalcPowerReserveItemList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENCalcPowerReserveItem.Row:=CurrentRow-5;
   sgENCalcPowerReserveItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENCalcPowerReserveItemShow.sgENCalcPowerReserveItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENCalcPowerReserveItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENCalcPowerReserveItemShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENCalcPowerReserveItem.RowCount-1 do
   for j:=0 to sgENCalcPowerReserveItem.ColCount-1 do
     sgENCalcPowerReserveItem.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENCalcPowerReserveItemShow.actViewExecute(Sender: TObject);
var 
  TempENCalcPowerReserveItem: ENCalcPowerReserveItemControllerSoapPort;
begin
  TempENCalcPowerReserveItem := HTTPRIOENCalcPowerReserveItem as ENCalcPowerReserveItemControllerSoapPort;
  try
    ENCalcPowerReserveItemObj := TempENCalcPowerReserveItem.getObject(StrToInt(sgENCalcPowerReserveItem.Cells[0,sgENCalcPowerReserveItem.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENCalcPowerReserveItem.Row;
  frmENCalcPowerReserveItemEdit:=TfrmENCalcPowerReserveItemEdit.Create(Application, dsView);
  
  try
    frmENCalcPowerReserveItemEdit.ShowModal;
  finally
    frmENCalcPowerReserveItemEdit.Free;
    frmENCalcPowerReserveItemEdit:=nil;
  end;

  if sgENCalcPowerReserveItem.RowCount > selectedRow then
    sgENCalcPowerReserveItem.Row := selectedRow
  else
    sgENCalcPowerReserveItem.Row := sgENCalcPowerReserveItem.RowCount - 1;
  
end;


procedure TfrmENCalcPowerReserveItemShow.actEditExecute(Sender: TObject);
var 
  TempENCalcPowerReserveItem: ENCalcPowerReserveItemControllerSoapPort;
begin
  TempENCalcPowerReserveItem := HTTPRIOENCalcPowerReserveItem as ENCalcPowerReserveItemControllerSoapPort;
  try
    ENCalcPowerReserveItemObj := TempENCalcPowerReserveItem.getObject(StrToInt(sgENCalcPowerReserveItem.Cells[0,sgENCalcPowerReserveItem.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENCalcPowerReserveItem.Row;
  frmENCalcPowerReserveItemEdit:=TfrmENCalcPowerReserveItemEdit.Create(Application, dsEdit);
  
  try
    if frmENCalcPowerReserveItemEdit.ShowModal= mrOk then
      begin
        //TempENCalcPowerReserveItem.save(ENCalcPowerReserveItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENCalcPowerReserveItemEdit.Free;
    frmENCalcPowerReserveItemEdit:=nil;
  end;

  if sgENCalcPowerReserveItem.RowCount > selectedRow then
    sgENCalcPowerReserveItem.Row := selectedRow
  else
    sgENCalcPowerReserveItem.Row := sgENCalcPowerReserveItem.RowCount - 1;
  
end;


procedure TfrmENCalcPowerReserveItemShow.actDeleteExecute(Sender: TObject);
Var TempENCalcPowerReserveItem: ENCalcPowerReserveItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempENCalcPowerReserveItem := HTTPRIOENCalcPowerReserveItem as ENCalcPowerReserveItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgENCalcPowerReserveItem.Cells[0,sgENCalcPowerReserveItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Строки для расчет резерва для присоединения) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENCalcPowerReserveItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENCalcPowerReserveItemShow.actInsertExecute(Sender: TObject);
// Var TempENCalcPowerReserveItem: ENCalcPowerReserveItemControllerSoapPort; 
begin
  // TempENCalcPowerReserveItem := HTTPRIOENCalcPowerReserveItem as ENCalcPowerReserveItemControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENCalcPowerReserveItemObj:=ENCalcPowerReserveItem.Create;
  SetNullIntProps(ENCalcPowerReserveItemObj);
  SetNullXSProps(ENCalcPowerReserveItemObj);

   //ENCalcPowerReserveItemObj.dateAdd:= TXSDateTime.Create;
   
   //ENCalcPowerReserveItemObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENCalcPowerReserveItemEdit:=TfrmENCalcPowerReserveItemEdit.Create(Application, dsInsert);
    try
      if frmENCalcPowerReserveItemEdit.ShowModal = mrOk then
      begin
        if ENCalcPowerReserveItemObj<>nil then
            //TempENCalcPowerReserveItem.add(ENCalcPowerReserveItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENCalcPowerReserveItemEdit.Free;
      frmENCalcPowerReserveItemEdit:=nil;
    end;
  finally
    ENCalcPowerReserveItemObj.Free;
  end;
end;


procedure TfrmENCalcPowerReserveItemShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENCalcPowerReserveItemShow.actFilterExecute(Sender: TObject);
begin
{frmENCalcPowerReserveItemFilterEdit:=TfrmENCalcPowerReserveItemFilterEdit.Create(Application, dsInsert);
  try
    ENCalcPowerReserveItemFilterObj := ENCalcPowerReserveItemFilter.Create;
    SetNullIntProps(ENCalcPowerReserveItemFilterObj);
    SetNullXSProps(ENCalcPowerReserveItemFilterObj);

    if frmENCalcPowerReserveItemFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENCalcPowerReserveItemFilter.Create;
      FilterObject := ENCalcPowerReserveItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENCalcPowerReserveItemFilterEdit.Free;
    frmENCalcPowerReserveItemFilterEdit:=nil;
  end;}
end;


procedure TfrmENCalcPowerReserveItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.