
unit ShowENRegForSupplierItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENRegForSupplierItemController, AdvObj ;


type
    TfrmENRegForSupplierItemShow = class(TChildForm)  
    HTTPRIOENRegForSupplierItem: THTTPRIO;
    ImageList1: TImageList;
    sgENRegForSupplierItem: TAdvStringGrid;
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
    procedure sgENRegForSupplierItemTopLeftChanged(Sender: TObject);
    procedure sgENRegForSupplierItemDblClick(Sender: TObject);
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
 // ENRegForSupplierItemObj: ENRegForSupplierItem;
 // ENRegForSupplierItemFilterObj: ENRegForSupplierItemFilter;
  frmENRegForSupplierItemShow: TfrmENRegForSupplierItemShow;
  
implementation

uses Main, EditENRegForSupplierItem, EditENRegForSupplierItemFilter;


{$R *.dfm}

var
  //frmENRegForSupplierItemShow : TfrmENRegForSupplierItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENRegForSupplierItemHeaders: array [1..15] of String =
        ( 'Код'
          ,'eic код'
          ,'UID'
          ,'Запланована дата'
          ,'Дата виконання'
          ,'Опис'
          ,'Номер калькуляції'
          ,'Назва калькуляції'
          ,'Вартість робіт без ПДВ, грн.'
          ,'ПДВ, грн.'
          ,'Вартість робіт з ПДВ, грн.'
          ,'Код строки реєстру з DataHub'
          ,'Примітка'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmENRegForSupplierItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENRegForSupplierItemShow:=nil;
  inherited;
end;


procedure TfrmENRegForSupplierItemShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENRegForSupplierItemShow.FormShow(Sender: TObject);
var
  TempENRegForSupplierItem: ENRegForSupplierItemControllerSoapPort;
  i: Integer;
  ENRegForSupplierItemList: ENRegForSupplierItemShortList;
begin
  SetGridHeaders(ENRegForSupplierItemHeaders, sgENRegForSupplierItem.ColumnHeaders);
  ColCount:=100;
  TempENRegForSupplierItem :=  HTTPRIOENRegForSupplierItem as ENRegForSupplierItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENRegForSupplierItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENRegForSupplierItemList := TempENRegForSupplierItem.getScrollableFilteredList(ENRegForSupplierItemFilter(FilterObject),0,ColCount);
  LastCount:=High(ENRegForSupplierItemList.list);

  if LastCount > -1 then
     sgENRegForSupplierItem.RowCount:=LastCount+2
  else
     sgENRegForSupplierItem.RowCount:=2;

   with sgENRegForSupplierItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENRegForSupplierItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENRegForSupplierItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENRegForSupplierItemList.list[i].recordpointEic;
        Cells[2,i+1] := ENRegForSupplierItemList.list[i].customerUid;
        if ENRegForSupplierItemList.list[i].datePlanned = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENRegForSupplierItemList.list[i].datePlanned);
        if ENRegForSupplierItemList.list[i].dateComplete = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(ENRegForSupplierItemList.list[i].dateComplete);
        Cells[5,i+1] := ENRegForSupplierItemList.list[i].description;
        Cells[6,i+1] := ENRegForSupplierItemList.list[i].calcNumber;
        Cells[7,i+1] := ENRegForSupplierItemList.list[i].calcName;
        if ENRegForSupplierItemList.list[i].costWithoutVAT = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := ENRegForSupplierItemList.list[i].costWithoutVAT.DecimalString;
        if ENRegForSupplierItemList.list[i].costVAT = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := ENRegForSupplierItemList.list[i].costVAT.DecimalString;
        if ENRegForSupplierItemList.list[i].costWithVAT = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := ENRegForSupplierItemList.list[i].costWithVAT.DecimalString;
        if ENRegForSupplierItemList.list[i].dhDisconnectionCode = Low(Integer) then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := IntToStr(ENRegForSupplierItemList.list[i].dhDisconnectionCode);
        Cells[12,i+1] := ENRegForSupplierItemList.list[i].commentGen;
        Cells[13,i+1] := ENRegForSupplierItemList.list[i].userGen;
        if ENRegForSupplierItemList.list[i].dateEdit = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := XSDateTimeWithDate2String(ENRegForSupplierItemList.list[i].dateEdit);
        LastRow:=i+1;
        sgENRegForSupplierItem.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENRegForSupplierItem.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENRegForSupplierItem.RowCount > selectedRow then
      sgENRegForSupplierItem.Row := selectedRow
    else
      sgENRegForSupplierItem.Row := sgENRegForSupplierItem.RowCount - 1;
    end
    else
      sgENRegForSupplierItem.Row:=1;   
end;


procedure TfrmENRegForSupplierItemShow.sgENRegForSupplierItemTopLeftChanged(Sender: TObject);
var
  TempENRegForSupplierItem: ENRegForSupplierItemControllerSoapPort;
  i,CurrentRow: Integer;
  ENRegForSupplierItemList: ENRegForSupplierItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENRegForSupplierItem.TopRow + sgENRegForSupplierItem.VisibleRowCount) = ColCount
  then
    begin
      TempENRegForSupplierItem :=  HTTPRIOENRegForSupplierItem as ENRegForSupplierItemControllerSoapPort;
      CurrentRow:=sgENRegForSupplierItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENRegForSupplierItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENRegForSupplierItemList := TempENRegForSupplierItem.getScrollableFilteredList(ENRegForSupplierItemFilter(FilterObject),ColCount-1, 100);


  sgENRegForSupplierItem.RowCount:=sgENRegForSupplierItem.RowCount+100;
  LastCount:=High(ENRegForSupplierItemList.list);
  with sgENRegForSupplierItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENRegForSupplierItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENRegForSupplierItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENRegForSupplierItemList.list[i].recordpointEic;
        Cells[2,i+CurrentRow] := ENRegForSupplierItemList.list[i].customerUid;
        if ENRegForSupplierItemList.list[i].datePlanned = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(ENRegForSupplierItemList.list[i].datePlanned);
        if ENRegForSupplierItemList.list[i].dateComplete = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDate2String(ENRegForSupplierItemList.list[i].dateComplete);
        Cells[5,i+CurrentRow] := ENRegForSupplierItemList.list[i].description;
        Cells[6,i+CurrentRow] := ENRegForSupplierItemList.list[i].calcNumber;
        Cells[7,i+CurrentRow] := ENRegForSupplierItemList.list[i].calcName;
        if ENRegForSupplierItemList.list[i].costWithoutVAT = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := ENRegForSupplierItemList.list[i].costWithoutVAT.DecimalString;
        if ENRegForSupplierItemList.list[i].costVAT = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := ENRegForSupplierItemList.list[i].costVAT.DecimalString;
        if ENRegForSupplierItemList.list[i].costWithVAT = nil then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := ENRegForSupplierItemList.list[i].costWithVAT.DecimalString;
        if ENRegForSupplierItemList.list[i].dhDisconnectionCode = Low(Integer) then
          Cells[11,i+CurrentRow] := ''
        else
          Cells[11,i+CurrentRow] := IntToStr(ENRegForSupplierItemList.list[i].dhDisconnectionCode);
        Cells[12,i+CurrentRow] := ENRegForSupplierItemList.list[i].commentGen;
        Cells[13,i+CurrentRow] := ENRegForSupplierItemList.list[i].userGen;
        if ENRegForSupplierItemList.list[i].dateEdit = nil then
          Cells[14,i+CurrentRow] := ''
        else
          Cells[14,i+CurrentRow] := XSDateTimeWithDate2String(ENRegForSupplierItemList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENRegForSupplierItem.Row:=CurrentRow-5;
   sgENRegForSupplierItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENRegForSupplierItemShow.sgENRegForSupplierItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENRegForSupplierItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENRegForSupplierItemShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENRegForSupplierItem.RowCount-1 do
   for j:=0 to sgENRegForSupplierItem.ColCount-1 do
     sgENRegForSupplierItem.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENRegForSupplierItemShow.actViewExecute(Sender: TObject);
var 
  TempENRegForSupplierItem: ENRegForSupplierItemControllerSoapPort;
begin
  TempENRegForSupplierItem := HTTPRIOENRegForSupplierItem as ENRegForSupplierItemControllerSoapPort;
  try
    ENRegForSupplierItemObj := TempENRegForSupplierItem.getObject(StrToInt(sgENRegForSupplierItem.Cells[0,sgENRegForSupplierItem.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENRegForSupplierItem.Row;
  frmENRegForSupplierItemEdit:=TfrmENRegForSupplierItemEdit.Create(Application, dsView);
  
  try
    frmENRegForSupplierItemEdit.ShowModal;
  finally
    frmENRegForSupplierItemEdit.Free;
    frmENRegForSupplierItemEdit:=nil;
  end;

  if sgENRegForSupplierItem.RowCount > selectedRow then
    sgENRegForSupplierItem.Row := selectedRow
  else
    sgENRegForSupplierItem.Row := sgENRegForSupplierItem.RowCount - 1;
  
end;


procedure TfrmENRegForSupplierItemShow.actEditExecute(Sender: TObject);
var 
  TempENRegForSupplierItem: ENRegForSupplierItemControllerSoapPort;
begin
  TempENRegForSupplierItem := HTTPRIOENRegForSupplierItem as ENRegForSupplierItemControllerSoapPort;
  try
    ENRegForSupplierItemObj := TempENRegForSupplierItem.getObject(StrToInt(sgENRegForSupplierItem.Cells[0,sgENRegForSupplierItem.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENRegForSupplierItem.Row;
  frmENRegForSupplierItemEdit:=TfrmENRegForSupplierItemEdit.Create(Application, dsEdit);
  
  try
    if frmENRegForSupplierItemEdit.ShowModal= mrOk then
      begin
        //TempENRegForSupplierItem.save(ENRegForSupplierItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENRegForSupplierItemEdit.Free;
    frmENRegForSupplierItemEdit:=nil;
  end;

  if sgENRegForSupplierItem.RowCount > selectedRow then
    sgENRegForSupplierItem.Row := selectedRow
  else
    sgENRegForSupplierItem.Row := sgENRegForSupplierItem.RowCount - 1;
  
end;


procedure TfrmENRegForSupplierItemShow.actDeleteExecute(Sender: TObject);
Var TempENRegForSupplierItem: ENRegForSupplierItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempENRegForSupplierItem := HTTPRIOENRegForSupplierItem as ENRegForSupplierItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgENRegForSupplierItem.Cells[0,sgENRegForSupplierItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Строка реєстру підключень/відключень для відшкодування Постачальником) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENRegForSupplierItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENRegForSupplierItemShow.actInsertExecute(Sender: TObject);
// Var TempENRegForSupplierItem: ENRegForSupplierItemControllerSoapPort; 
begin
  // TempENRegForSupplierItem := HTTPRIOENRegForSupplierItem as ENRegForSupplierItemControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENRegForSupplierItemObj:=ENRegForSupplierItem.Create;
  SetNullIntProps(ENRegForSupplierItemObj);
  SetNullXSProps(ENRegForSupplierItemObj);

   //ENRegForSupplierItemObj.datePlanned:= TXSDate.Create;
   //ENRegForSupplierItemObj.dateComplete:= TXSDate.Create;
   //ENRegForSupplierItemObj.costWithoutVAT:= TXSDecimal.Create;
   //ENRegForSupplierItemObj.costVAT:= TXSDecimal.Create;
   //ENRegForSupplierItemObj.costWithVAT:= TXSDecimal.Create;
   //ENRegForSupplierItemObj.dateAdd:= TXSDateTime.Create;
   
   //ENRegForSupplierItemObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENRegForSupplierItemEdit:=TfrmENRegForSupplierItemEdit.Create(Application, dsInsert);
    try
      if frmENRegForSupplierItemEdit.ShowModal = mrOk then
      begin
        if ENRegForSupplierItemObj<>nil then
            //TempENRegForSupplierItem.add(ENRegForSupplierItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENRegForSupplierItemEdit.Free;
      frmENRegForSupplierItemEdit:=nil;
    end;
  finally
    ENRegForSupplierItemObj.Free;
  end;
end;


procedure TfrmENRegForSupplierItemShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENRegForSupplierItemShow.actFilterExecute(Sender: TObject);
begin
{frmENRegForSupplierItemFilterEdit:=TfrmENRegForSupplierItemFilterEdit.Create(Application, dsInsert);
  try
    ENRegForSupplierItemFilterObj := ENRegForSupplierItemFilter.Create;
    SetNullIntProps(ENRegForSupplierItemFilterObj);
    SetNullXSProps(ENRegForSupplierItemFilterObj);

    if frmENRegForSupplierItemFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENRegForSupplierItemFilter.Create;
      FilterObject := ENRegForSupplierItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENRegForSupplierItemFilterEdit.Free;
    frmENRegForSupplierItemFilterEdit:=nil;
  end;}
end;


procedure TfrmENRegForSupplierItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.