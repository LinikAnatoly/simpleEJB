
unit ShowRQPurchaseItemAbstractSum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  RQPurchaseItemController, AdvObj ;


type
    TfrmRQPurchaseItemAbstractSumShow = class(TChildForm)  
    HTTPRIORQPurchaseItem: THTTPRIO;
    ImageList1: TImageList;
    sgRQPurchaseItemWithCheckSum: TAdvStringGrid;
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
    procedure sgRQPurchaseItemWithCheckSumTopLeftChanged(Sender: TObject);
    procedure sgRQPurchaseItemWithCheckSumDblClick(Sender: TObject);
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
 // RQPurchaseItemObj: RQPurchaseItem;
 // RQPurchaseItemFilterObj: RQPurchaseItemFilter;
  
  
implementation

uses Main, EditRQPurchaseItem, EditRQPurchaseItemFilter;


{$R *.dfm}

var
  //frmRQPurchaseItemAbstractSumShow : TfrmRQPurchaseItemAbstractSumShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQPurchaseItemHeaders: array [1..19] of String =
        ( 'Код'
          ,'Назва матеріалу/послуги'
          ,'Од. виміру'
          ,'Код ДК 2010'
          ,'Код ДК 2015'
          ,'кількість з планів'
          ,'Кількість для публікації'
          ,'ціна без НДС'
          ,'ціна з НДС'
          ,'Сума без ПДВ'
          ,'Сума з ПДВ '
          ,'ціна без НДС для публікації'
          ,'ціна з НДС для публікації'
          ,'Сума згідно для публікації'
          ,'Сума з ПДВ для публікації'
          ,'Залишкова сума без ПДВ'
          ,'Примітка'
          // ,'Коды обектов при формировании плана/изменений закупок'
          ,'Названия обектов при формировании плана/изменений закупок'
          // ,'пользователь внесший изменение'
          ,'Высвобожденное количество из строки плана закупок'
          //,'Предполагаемая сумма для закупок '
        );
   

procedure TfrmRQPurchaseItemAbstractSumShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmRQPurchaseItemAbstractSumShow:=nil;
  inherited;
end;


procedure TfrmRQPurchaseItemAbstractSumShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmRQPurchaseItemAbstractSumShow.FormShow(Sender: TObject);
var
  TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
  i: Integer;
  RQPurchaseItemList: RQPurchaseItemShortList;
begin
  SetGridHeaders(RQPurchaseItemHeaders, sgRQPurchaseItemWithCheckSum.ColumnHeaders);
  ColCount:=100;
  TempRQPurchaseItem :=  HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQPurchaseItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPurchaseItemList := TempRQPurchaseItem.getScrollableFilteredListForRestAbstractSum(RQPurchaseItemFilter(FilterObject),0,ColCount);
  LastCount:=High(RQPurchaseItemList.list);

  if LastCount > -1 then
     sgRQPurchaseItemWithCheckSum.RowCount:=LastCount+2
  else
     sgRQPurchaseItemWithCheckSum.RowCount:=2;

   with sgRQPurchaseItemWithCheckSum do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPurchaseItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQPurchaseItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQPurchaseItemList.list[i].materialNameGen;
        Cells[2,i+1] := RQPurchaseItemList.list[i].measurementNameGen;
        Cells[3,i+1] := RQPurchaseItemList.list[i].identid2010;
        Cells[4,i+1] := RQPurchaseItemList.list[i].identid2015;
        if RQPurchaseItemList.list[i].countGen = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := RQPurchaseItemList.list[i].countGen.DecimalString;
        if RQPurchaseItemList.list[i].countPurchase = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := RQPurchaseItemList.list[i].countPurchase.DecimalString;
        if RQPurchaseItemList.list[i].priceGenWithoutNds = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := RQPurchaseItemList.list[i].priceGenWithoutNds.DecimalString;
        if RQPurchaseItemList.list[i].priceGenWithNds = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := RQPurchaseItemList.list[i].priceGenWithNds.DecimalString;
        if RQPurchaseItemList.list[i].sumGenWithoutNds = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := RQPurchaseItemList.list[i].sumGenWithoutNds.DecimalString;
        if RQPurchaseItemList.list[i].sumGenWithNds = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := RQPurchaseItemList.list[i].sumGenWithNds.DecimalString;
        if RQPurchaseItemList.list[i].pricePurchaseWithoutNds = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := RQPurchaseItemList.list[i].pricePurchaseWithoutNds.DecimalString;
        if RQPurchaseItemList.list[i].pricePurchaseWithNds = nil then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := RQPurchaseItemList.list[i].pricePurchaseWithNds.DecimalString;
        if RQPurchaseItemList.list[i].sumPurchaseWithoutNds = nil then
          Cells[13,i+1] := ''
        else
          Cells[13,i+1] := RQPurchaseItemList.list[i].sumPurchaseWithoutNds.DecimalString;
        if RQPurchaseItemList.list[i].sumPurchaseWithNds = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := RQPurchaseItemList.list[i].sumPurchaseWithNds.DecimalString;

        if RQPurchaseItemList.list[i].sumPurchaseRest = nil then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := RQPurchaseItemList.list[i].sumPurchaseRest.DecimalString;
          Colors[15, i + 1] := clYellow;

        Cells[16,i+1] := RQPurchaseItemList.list[i].commentGen;
        // Cells[16,i+1] := RQPurchaseItemList.list[i].objectsCodes;
        Cells[17,i+1] := RQPurchaseItemList.list[i].objectsName;
       // Cells[18,i+1] := RQPurchaseItemList.list[i].userGen;
        if RQPurchaseItemList.list[i].countFree = nil then
          Cells[18,i+1] := ''
        else
          Cells[18,i+1] := RQPurchaseItemList.list[i].countFree.DecimalString;

//        if RQPurchaseItemList.list[i].isAbstractSum = Low(Integer) then
//          Cells[20,i+1] := ''
//        else
//          Cells[20,i+1] := IntToStr(RQPurchaseItemList.list[i].isAbstractSum);

        LastRow:=i+1;
        sgRQPurchaseItemWithCheckSum.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgRQPurchaseItemWithCheckSum.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgRQPurchaseItemWithCheckSum.RowCount > selectedRow then
      sgRQPurchaseItemWithCheckSum.Row := selectedRow
    else
      sgRQPurchaseItemWithCheckSum.Row := sgRQPurchaseItemWithCheckSum.RowCount - 1;
    end
    else
      sgRQPurchaseItemWithCheckSum.Row:=1;
end;


procedure TfrmRQPurchaseItemAbstractSumShow.sgRQPurchaseItemWithCheckSumTopLeftChanged(Sender: TObject);
var
  TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
  i,CurrentRow: Integer;
  RQPurchaseItemList: RQPurchaseItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQPurchaseItemWithCheckSum.TopRow + sgRQPurchaseItemWithCheckSum.VisibleRowCount) = ColCount
  then
    begin
      TempRQPurchaseItem :=  HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;
      CurrentRow:=sgRQPurchaseItemWithCheckSum.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQPurchaseItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPurchaseItemList := TempRQPurchaseItem.getScrollableFilteredListForRestAbstractSum(RQPurchaseItemFilter(FilterObject),ColCount-1, 100);


  sgRQPurchaseItemWithCheckSum.RowCount:=sgRQPurchaseItemWithCheckSum.RowCount+100;
  LastCount:=High(RQPurchaseItemList.list);
  with sgRQPurchaseItemWithCheckSum do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPurchaseItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQPurchaseItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQPurchaseItemList.list[i].materialNameGen;
        Cells[2,i+CurrentRow] := RQPurchaseItemList.list[i].measurementNameGen;
        Cells[3,i+CurrentRow] := RQPurchaseItemList.list[i].identid2010;
        Cells[4,i+CurrentRow] := RQPurchaseItemList.list[i].identid2015;
        if RQPurchaseItemList.list[i].countGen = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := RQPurchaseItemList.list[i].countGen.DecimalString;
        if RQPurchaseItemList.list[i].countPurchase = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := RQPurchaseItemList.list[i].countPurchase.DecimalString;
        if RQPurchaseItemList.list[i].priceGenWithoutNds = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := RQPurchaseItemList.list[i].priceGenWithoutNds.DecimalString;
        if RQPurchaseItemList.list[i].priceGenWithNds = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := RQPurchaseItemList.list[i].priceGenWithNds.DecimalString;
        if RQPurchaseItemList.list[i].sumGenWithoutNds = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := RQPurchaseItemList.list[i].sumGenWithoutNds.DecimalString;
        if RQPurchaseItemList.list[i].sumGenWithNds = nil then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := RQPurchaseItemList.list[i].sumGenWithNds.DecimalString;
        if RQPurchaseItemList.list[i].pricePurchaseWithoutNds = nil then
          Cells[11,i+CurrentRow] := ''
        else
          Cells[11,i+CurrentRow] := RQPurchaseItemList.list[i].pricePurchaseWithoutNds.DecimalString;
        if RQPurchaseItemList.list[i].pricePurchaseWithNds = nil then
          Cells[12,i+CurrentRow] := ''
        else
          Cells[12,i+CurrentRow] := RQPurchaseItemList.list[i].pricePurchaseWithNds.DecimalString;
        if RQPurchaseItemList.list[i].sumPurchaseWithoutNds = nil then
          Cells[13,i+CurrentRow] := ''
        else
          Cells[13,i+CurrentRow] := RQPurchaseItemList.list[i].sumPurchaseWithoutNds.DecimalString;
        if RQPurchaseItemList.list[i].sumPurchaseWithNds = nil then
          Cells[14,i+CurrentRow] := ''
        else
          Cells[14,i+CurrentRow] := RQPurchaseItemList.list[i].sumPurchaseWithNds.DecimalString;

        if RQPurchaseItemList.list[i].sumPurchaseRest = nil then
          Cells[15,i+CurrentRow] := ''
        else
          Cells[15,i+CurrentRow] := RQPurchaseItemList.list[i].sumPurchaseRest.DecimalString;

          Colors[9, i + CurrentRow] := clYellow;

        Cells[16,i+CurrentRow] := RQPurchaseItemList.list[i].commentGen;
        // Cells[16,i+1] := RQPurchaseItemList.list[i].objectsCodes;
        Cells[17,i+CurrentRow] := RQPurchaseItemList.list[i].objectsName;
       // Cells[18,i+1] := RQPurchaseItemList.list[i].userGen;
        if RQPurchaseItemList.list[i].countFree = nil then
          Cells[18,i+CurrentRow] := ''
        else
          Cells[18,i+CurrentRow] := RQPurchaseItemList.list[i].countFree.DecimalString;

//        if RQPurchaseItemList.list[i].isAbstractSum = Low(Integer) then
//          Cells[20,i+1] := ''
//        else
//          Cells[20,i+1] := IntToStr(RQPurchaseItemList.list[i].isAbstractSum);

          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQPurchaseItemWithCheckSum.Row:=CurrentRow-5;
   sgRQPurchaseItemWithCheckSum.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQPurchaseItemAbstractSumShow.sgRQPurchaseItemWithCheckSumDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQPurchaseItemWithCheckSum,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmRQPurchaseItemAbstractSumShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgRQPurchaseItemWithCheckSum.RowCount-1 do
   for j:=0 to sgRQPurchaseItemWithCheckSum.ColCount-1 do
     sgRQPurchaseItemWithCheckSum.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmRQPurchaseItemAbstractSumShow.actViewExecute(Sender: TObject);
var 
  TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
begin
  TempRQPurchaseItem := HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;
  try
    RQPurchaseItemObj := TempRQPurchaseItem.getObject(StrToInt(sgRQPurchaseItemWithCheckSum.Cells[0,sgRQPurchaseItemWithCheckSum.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgRQPurchaseItemWithCheckSum.Row;
  frmRQPurchaseItemEdit:=TfrmRQPurchaseItemEdit.Create(Application, dsView);
  
  try
    frmRQPurchaseItemEdit.ShowModal;
  finally
    frmRQPurchaseItemEdit.Free;
    frmRQPurchaseItemEdit:=nil;
  end;

  if sgRQPurchaseItemWithCheckSum.RowCount > selectedRow then
    sgRQPurchaseItemWithCheckSum.Row := selectedRow
  else
    sgRQPurchaseItemWithCheckSum.Row := sgRQPurchaseItemWithCheckSum.RowCount - 1;
  
end;


procedure TfrmRQPurchaseItemAbstractSumShow.actEditExecute(Sender: TObject);
var 
  TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
begin
  TempRQPurchaseItem := HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;
  try
    RQPurchaseItemObj := TempRQPurchaseItem.getObject(StrToInt(sgRQPurchaseItemWithCheckSum.Cells[0,sgRQPurchaseItemWithCheckSum.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgRQPurchaseItemWithCheckSum.Row;
  frmRQPurchaseItemEdit:=TfrmRQPurchaseItemEdit.Create(Application, dsEdit);
  
  try
    if frmRQPurchaseItemEdit.ShowModal= mrOk then
      begin
        //TempRQPurchaseItem.save(RQPurchaseItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQPurchaseItemEdit.Free;
    frmRQPurchaseItemEdit:=nil;
  end;

  if sgRQPurchaseItemWithCheckSum.RowCount > selectedRow then
    sgRQPurchaseItemWithCheckSum.Row := selectedRow
  else
    sgRQPurchaseItemWithCheckSum.Row := sgRQPurchaseItemWithCheckSum.RowCount - 1;
  
end;


procedure TfrmRQPurchaseItemAbstractSumShow.actDeleteExecute(Sender: TObject);
Var TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQPurchaseItem := HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQPurchaseItemWithCheckSum.Cells[0,sgRQPurchaseItemWithCheckSum.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Строки плана закупок по материалам с объемами для закупок) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPurchaseItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQPurchaseItemAbstractSumShow.actInsertExecute(Sender: TObject);
// Var TempRQPurchaseItem: RQPurchaseItemControllerSoapPort; 
begin
  // TempRQPurchaseItem := HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQPurchaseItemObj:=RQPurchaseItem.Create;
  SetNullIntProps(RQPurchaseItemObj);
  SetNullXSProps(RQPurchaseItemObj);

   //RQPurchaseItemObj.countGen:= TXSDecimal.Create;
   //RQPurchaseItemObj.countPurchase:= TXSDecimal.Create;
   //RQPurchaseItemObj.priceGenWithoutNds:= TXSDecimal.Create;
   //RQPurchaseItemObj.priceGenWithNds:= TXSDecimal.Create;
   //RQPurchaseItemObj.sumGenWithoutNds:= TXSDecimal.Create;
   //RQPurchaseItemObj.sumGenWithNds:= TXSDecimal.Create;
   //RQPurchaseItemObj.pricePurchaseWithoutNds:= TXSDecimal.Create;
   //RQPurchaseItemObj.pricePurchaseWithNds:= TXSDecimal.Create;
   //RQPurchaseItemObj.sumPurchaseWithoutNds:= TXSDecimal.Create;
   //RQPurchaseItemObj.sumPurchaseWithNds:= TXSDecimal.Create;
   //RQPurchaseItemObj.dateEdit:= TXSDate.Create;
   //RQPurchaseItemObj.countFree:= TXSDecimal.Create;


  try
    frmRQPurchaseItemEdit:=TfrmRQPurchaseItemEdit.Create(Application, dsInsert);
    try
      if frmRQPurchaseItemEdit.ShowModal = mrOk then
      begin
        if RQPurchaseItemObj<>nil then
            //TempRQPurchaseItem.add(RQPurchaseItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQPurchaseItemEdit.Free;
      frmRQPurchaseItemEdit:=nil;
    end;
  finally
    RQPurchaseItemObj.Free;
  end;
end;


procedure TfrmRQPurchaseItemAbstractSumShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmRQPurchaseItemAbstractSumShow.actFilterExecute(Sender: TObject);
begin
{frmRQPurchaseItemFilterEdit:=TfrmRQPurchaseItemFilterEdit.Create(Application, dsInsert);
  try
    RQPurchaseItemFilterObj := RQPurchaseItemFilter.Create;
    SetNullIntProps(RQPurchaseItemFilterObj);
    SetNullXSProps(RQPurchaseItemFilterObj);

    if frmRQPurchaseItemFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := RQPurchaseItemFilter.Create;
      FilterObject := RQPurchaseItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQPurchaseItemFilterEdit.Free;
    frmRQPurchaseItemFilterEdit:=nil;
  end;}
end;


procedure TfrmRQPurchaseItemAbstractSumShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.