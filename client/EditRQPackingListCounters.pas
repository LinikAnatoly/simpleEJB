
unit EditRQPackingListCounters;

interface

uses
  Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
  Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
  DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, RQPackingListController, RQPackingListItemController,
  CheckLst, TB2Item, TB2Dock, TB2Toolbar, ENConsts, AdvObj, ShowENEPRen;

type
  TfrmRQPackingListCountersEdit = class(TDialogForm)

    lblCode : TLabel;
	edtCode : TEdit;
    lblNumberGen : TLabel;
    edtNumberGen: TEdit;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblMolFromCode : TLabel;
    edtMolFrom: TEdit;
    lblMolToCode : TLabel;
    edtMolTo: TEdit;
    lblPackerFIO : TLabel;
    edtPacker: TEdit;


  HTTPRIORQPackingList: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    HTTPRIOENDepartment: THTTPRIO;
    spbMolFrom: TSpeedButton;
    spbMolTo: TSpeedButton;
    spbPacker: TSpeedButton;
    edtDepartment: TEdit;
    lblDepartment: TLabel;
    spbDepartment: TSpeedButton;
    HTTPRIORQPackingListItem: THTTPRIO;
    imageList1: TImageList;
    alRQPackingListItem: TActionList;
    actRQPackingListItemInsert: TAction;
    actRQPackingListItemDelete: TAction;
    actRQPackingListItemUpdate: TAction;
    pmRQPackingListItem: TPopupMenu;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    btnPrint: TSpeedButton;
    HTTPRIORQPackingList2FKOrder: THTTPRIO;
    HTTPRIORQFKOrder: THTTPRIO;
    actSelectAll: TAction;
    actEraseAll: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    actUpdateQuantity: TAction;
    N3: TMenuItem;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    HTTPRIOEPRen: THTTPRIO;
    spbEPRenClear: TSpeedButton;
    lblAccountingType: TLabel;
    cbTKAccountingType: TComboBox;
    HTTPRIORQFKOrderItem: THTTPRIO;
    pcRQPackingListCounters: TPageControl;
    tbItems: TTabSheet;
    gbPackingListItem: TGroupBox;
    sgRQPackingListItem: TAdvStringGrid;
    TBToolbar1: TTBToolbar;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBToolbar2: TTBToolbar;
    TBControlItem1: TTBControlItem;
    TBControlItem5: TTBControlItem;
    TBControlItem2: TTBControlItem;
    TBControlItem3: TTBControlItem;
    TBControlItem4: TTBControlItem;
    btnAddNewCounters: TSpeedButton;
    btnSavePaletes: TSpeedButton;
    btnGenerateOrders: TSpeedButton;
    btnRemoveOrders: TSpeedButton;
    btnAddBUCounters: TSpeedButton;
    tbBoxes: TTabSheet;
    gbBoxes: TGroupBox;
    GroupBox1: TGroupBox;
    barBoxes: TTBToolbar;
    TBItem3: TTBItem;
    TBItem6: TTBItem;
    TBToolbar3: TTBToolbar;
    TBItem9: TTBItem;
    TBItem10: TTBItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    sgRQBox: TAdvStringGrid;
    sgCounters: TAdvStringGrid;
    spbMassPrinting: TSpeedButton;
    gbRQPackingList2FKOrder: TGroupBox;
    sgRQPackingList2FKOrder: TAdvStringGrid;
    HTTPRIORQBox: THTTPRIO;
    HTTPRIORQBoxItem: THTTPRIO;
    lblCountCounters: TLabel;
    lblCountBoxes: TLabel;
    actRemoveBox: TAction;
    actUpdateBoxes: TAction;
    actUpdateCounters: TAction;
    actSelectAllCounters: TAction;
    actUnDoSelectAllCounters: TAction;
    actRemoveCounters: TAction;
    actPrintBoxes: TAction;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    actSetZones: TAction;
    btnPrintBoxesList: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbDepartmentClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbMolFromClick(Sender: TObject);
    procedure spbMolToClick(Sender: TObject);
    procedure spbPackerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPrintPackingStatementClick(Sender: TObject);
    procedure actRQPackingListItemDeleteExecute(Sender: TObject);
    procedure actRQPackingListItemUpdateExecute(Sender: TObject);
    procedure sgRQPackingListItemCellValidate(Sender: TObject; ACol,
      ARow: Integer; var Value: String; var Valid: Boolean);
    procedure btnSavePaletesClick(Sender: TObject);
    procedure btnGenerateOrdersClick(Sender: TObject);
    procedure btnRemoveOrdersClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure sgRQPackingList2FKOrderDblClick(Sender: TObject);
    procedure spbMassPrintingClick(Sender: TObject);
    procedure actSelectAllExecute(Sender: TObject);
    procedure actEraseAllExecute(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure btnAddNewCountersClick(Sender: TObject);
    procedure btnAddBUCountersClick(Sender: TObject);
    procedure printingOZ(fkItemCode : Integer);
    procedure updateBoxes;
    procedure updateCounters;
    procedure updateCountCounters;
    procedure updateCountBoxes;
    procedure pcRQPackingListCountersChange(Sender: TObject);
    procedure sgRQBoxClick(Sender: TObject);
    procedure sgCountersClick(Sender: TObject);
    procedure actRemoveBoxExecute(Sender: TObject);
    procedure actUpdateBoxesExecute(Sender: TObject);
    procedure actUpdateCountersExecute(Sender: TObject);
    procedure actSelectAllCountersExecute(Sender: TObject);
    procedure actUnDoSelectAllCountersExecute(Sender: TObject);
    procedure actRemoveCountersExecute(Sender: TObject);
    procedure actPrintBoxesExecute(Sender: TObject);
    procedure actSetZonesExecute(Sender: TObject);
    procedure btnPrintBoxesListClick(Sender: TObject);

  
  private
  { Private declarations }
  totalCountCounters : Integer;
  totalCountBoxes : Integer;

    procedure  updatePackingItem;
    procedure updateOrders;

  public
    { Public declarations }
    departmentCode : Integer; // код подразделения для ведомости
    epRenCode : Integer; // код РЭСа
    materialCode : Integer; // код материала для ведомости
    molFromCode, molFromName, molToCode, molToName : String; // коды и наименования МОЛов отправителя и получателя
    packerFIO, packerTabnumber, packerPosition : String; //  упаковщик
    RQPackingListObj: RQPackingList;
end;

var
  frmRQPackingListCountersEdit: TfrmRQPackingListCountersEdit;


  RQPackingListItemHeaders: array [1..16] of String =
        ( 'Код'
          ,'Наименование материала'
          ,'Зона хранения'
          ,'Наименование единицы изменения'
          ,'Необходимое количество'
          ,'Фактическое количество'
          ,'П1'
          ,'П1, кол-во'
          ,'П2'
          ,'П2, кол-во'
          ,'П3'
          ,'П3, кол-во'
          ,'П4'
          ,'П4, кол-во'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );

   RQPackingList2FKOrderHeaders: array [1..9] of String =
        ( 'Код'
          ,'Номер ордеру'
          ,'Дата ордеру'
          ,'Код відправника'
          ,'ПІБ відправника'
          ,'Код одержувача'
          ,'ПІБ одержувача'
          ,'Вид'
          ,'Статус'
        );

  SCCounterHeaders: array [1..3] of String =
        ( 'Код'
          , 'Інв. №'
          , 'Найменування'
        );

  RQBoxHeaders: array [1..4] of String =
        ( 'Код'
          , 'Номер'
          , 'Місце зберігання'
          , 'Кількість'
        );


implementation

   uses
     ShowENDepartment
  , ENDepartmentController
  , TKMaterialsController
  , ShowTKMaterials
  , ShowFINMol
  , ShowFINWorker
  , DMReportsUnit
  , RQPackingList2FKOrderController
  , RQFKOrderController
  , EditRQFKOrder
  , TKAccountingTypeController
  , ShowSCOrder
  , SCOrderController
  , SCOrderKindController
  , EditScanningCounters
  , RQFKOrderItemController
  , RQBoxController
  , RQBoxItemController
  , RQStorageZoneController
  , ShowRQStorageZone
  , SCMolController
  , ShowSCMol;
{uses
    EnergyproController, EnergyproController2, RQPackingListController  ;
}
{$R *.dfm}

procedure TfrmRQPackingListCountersEdit.updateCountBoxes;
begin
  lblCountBoxes.Visible := (totalCountBoxes > 0);
  lblCountBoxes.Caption := IntToStr(totalCountBoxes);
end;
procedure TfrmRQPackingListCountersEdit.updateCountCounters;
var
temp : Integer;
begin
    temp := 0;

  try
    temp:= sgCounters.Row;
  except
    on EConvertError do Exit;
  end;
  lblCountCounters.Visible := (totalCountCounters > 0);
  lblCountCounters.Caption := IntToStr(temp) + ' / ' + IntToStr(totalCountCounters);

end;
procedure TfrmRQPackingListCountersEdit.updateCounters;
var
TempBoxItems: RQBoxItemControllerSoapPort;
LastCount, LastRow, i, boxCode : Integer;
boxItemList : RQBoxItemShortList;
boxItemFilter : RQBoxItemFilter;
begin
  sgCounters.Clear;
  SetGridHeaders(SCCounterHeaders, sgCounters.ColumnHeaders);

  totalCountCounters := 0;

  try
    boxCode:=StrToInt(GetReturnValue(sgRQBox,0));
  except
    on EConvertError do Exit;
  end;

  TempBoxItems := HTTPRIORQBoxItem as RQBoxItemControllerSoapPort;

  boxItemFilter := RQBoxItemFilter.Create;
  SetNullXSProps(boxItemFilter);
  SetNullIntProps(boxItemFilter);
  boxItemFilter.boxRef := RQBoxRef.Create;
  boxItemFilter.boxRef.code := boxCode;

  boxItemList := TempBoxItems.getScrollableFilteredList(boxItemFilter, 0, -1);

  LastCount := High(boxItemList.list);

  if LastCount > -1 then
    sgCounters.RowCount:=LastCount+2
  else
    sgCounters.RowCount:=2;

  with sgCounters do
    for i:=0 to LastCount do
      begin
        //Application.ProcessMessages;

      if boxItemList.list[i].code <> Low(Integer) then
          Cells[0,i + 1] := IntToStr(boxItemList.list[i].code)
        else
          Cells[0,i + 1] := '';
        Cells[1, i + 1] := boxItemList.list[i].counterRefInvNumber;
        Cells[2, i + 1] := boxItemList.list[i].counterRefName;

        totalCountCounters := totalCountCounters + 1;

        LastRow:=i+1;
        sgCounters.RowCount:=LastRow+1;
        AddCheckBox(1, i + 1, false, false);
      end;
      sgCounters.Row := 1;

      updateCountCounters;
end;

procedure TfrmRQPackingListCountersEdit.actUnDoSelectAllCountersExecute(
  Sender: TObject);
begin
  inherited;
    checkGrid(sgCounters, 1, false);
end;

procedure TfrmRQPackingListCountersEdit.updateBoxes;
var
TempRQBox : RQBoxControllerSoapPort;
boxFilter : RQBoxFilter;
boxList : RQBoxShortList;
LastCount, LastRow, i : Integer;
begin
  sgRQBox.Clear;
  SetGridHeaders(RQBoxHeaders, sgRQBox.ColumnHeaders);

  TempRQBox := HTTPRIORQBox as RQBoxControllerSoapPort;

  totalCountBoxes := 0;

  boxFilter := RQBoxFilter.Create;
  SetNullXSProps(boxFilter);
  SetNullIntProps(boxFilter);
  boxFilter.conditionSQL := ' EXISTS (SELECT 1 FROM rqbox2rqpackinglistitm as bopl1 ' +
                            ' inner join rqpackinglistitem as pli1 on bopl1.packinglistitemrefcode = pli1.code ' +
                            ' where pli1.packinglistrefcode = ' + IntToStr(RQPackingListObj.code) +
                            ' and bopl1.boxrefcode = RQBOX.CODE)';


  boxList := TempRQBox.getScrollableFilteredList(boxFilter,0,-1);

    LastCount := High(boxList.list);

   if LastCount > -1 then
     sgRQBox.RowCount:=LastCount+2
   else
     sgRQBox.RowCount:=2;

      with sgRQBox do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if boxList.list[i].code <> Low(Integer) then
          Cells[0,i + 1] := IntToStr(boxList.list[i].code)
        else
          Cells[0,i + 1] := '';
        Cells[1, i + 1] := boxList.list[i].numberGen;

        Cells[2, i + 1] := boxList.list[i].storageZoneRefName;
        if(boxList.list[i].countGen = nil) then
          Cells[3, i + 1] := ''
        else
          Cells[3, i + 1] := boxList.list[i].countGen.DecimalString;

          totalCountBoxes := totalCountBoxes + 1;

        LastRow:=i+1;
        sgRQBox.RowCount:=LastRow+1;
        AddCheckBox(2, i + 1, false, false);
      end;
      sgRQBox.Row := 1;

      updateCountBoxes;
      updateCounters;
end;

procedure TfrmRQPackingListCountersEdit.updateOrders;
var
  TempRQPackingList2FKOrder : RQPackingList2FKOrderControllerSoapPort;
  packingList2orderList : RQPackingList2FKOrderShortList;
  packingList2orderFilter : RQPackingList2FKOrderFilter;
  packingListCode, i, LastCount, LastRow, z : Integer;
  TempRQFKOrder : RQFKOrderControllerSoapPort;
  orderList : RQFKOrderShortList;
  orderFilter : RQFKOrderFilter;
  orderCodes : String;

begin

  sgRQPackingList2FKOrder.Clear;
  SetGridHeaders(RQPackingList2FKOrderHeaders, sgRQPackingList2FKOrder.ColumnHeaders);

  TempRQPackingList2FKOrder :=  HTTPRIORQPackingList2FKOrder as RQPackingList2FKOrderControllerSoapPort;

  packingList2orderFilter := RQPackingList2FKOrderFilter.Create;
  SetNullIntProps(packingList2orderFilter);
  SetNullXSProps(packingList2orderFilter);
  packingList2orderFilter.packingListRef := RQPackingListRef.Create;
  packingList2orderFilter.packingListRef.code := Self.RQPackingListObj.code;
  packingList2orderFilter.conditionSQL := ' not exists (select rqfkorder.code from rqfkorder where rqfkorder.kindcode = 30 and rqfkorder.code = fkorderrefcode)';

  packingList2orderList := TempRQPackingList2FKOrder.getScrollableFilteredList(packingList2orderFilter,0,-1);

  orderCodes := '';
  for z := 0 to packingList2orderList.totalCount - 1 do
  begin
         if Length(orderCodes) = 0 then orderCodes := IntToStr(packingList2orderList.list[z].fkorderRefCode)
         else orderCodes := orderCodes + ', ' +  IntToStr(packingList2orderList.list[z].fkorderRefCode);
  end;

  if Length(orderCodes) = 0 then orderCodes := 'null';

  orderFilter := RQFKOrderFilter.Create;
  SetNullXSProps(orderFilter);
  SetNullIntProps(orderFilter);
  orderFilter.conditionSQL := 'RQFKORDER.CODE IN (' + orderCodes + ')';

  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  orderList := TempRQFKOrder.getScrollableFilteredList(orderFilter, 0, -1);

  LastCount := High(orderList.list);
 
   if LastCount > -1 then
     sgRQPackingList2FKOrder.RowCount:=LastCount+2
   else
     sgRQPackingList2FKOrder.RowCount:=2;

      with sgRQPackingList2FKOrder do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if orderList.list[i].code <> Low(Integer) then
          Cells[0,i + 1] := IntToStr(orderList.list[i].code)
        else
          Cells[0,i + 1] := '';
        Cells[1, i + 1] := orderList.list[i].numberDoc;

        if orderList.list[i].dateGen = nil then
            Cells[2, i + 1] := ''
        else
            Cells[2, i + 1] := XSDate2String(orderList.list[i].dateGen);

        Cells[3, i + 1] := orderList.list[i].molInCode;
        Cells[4, i + 1] := orderList.list[i].molInName;

        Cells[5, i + 1] := orderList.list[i].molOutCode;
        Cells[6, i + 1] := orderList.list[i].molOutName;

        Cells[7, i + 1] := orderList.list[i].kindName;
        Cells[8, i + 1] := orderList.list[i].statusName;

        Objects[0, i+1] :=  TObject(orderList.list[i].code);
        LastRow:=i+1;
        sgRQPackingList2FKOrder.RowCount:=LastRow+1;
      end;
      sgRQPackingList2FKOrder.Row := 1;
end;

procedure  TfrmRQPackingListCountersEdit.updatePackingItem;
var
  TempRQPackingListItem: RQPackingListItemControllerSoapPort;
  i, LastCount, LastRow: Integer;
  pliList: RQPackingListItemShortList;
  pliFilter : RQPackingListItemFilter;
  begin

  ClearGrid(sgRQPackingListItem);

  SetGridHeaders(RQPackingListItemHeaders, sgRQPackingListItem.ColumnHeaders);

  sgRQPackingListItem.Options := sgRQPackingListItem.Options - [goColMoving];
  sgRQPackingListItem.Options := sgRQPackingListItem.Options + [goEditing];
   
  pliFilter := RQPackingListItemFilter.Create;
  SetNullIntProps(pliFilter);
  SetNullXSProps(pliFilter);
  pliFilter.packingListRef := RQPackingListRef.Create;
  pliFilter.packingListRef.code := Self.RQPackingListObj.code;

  TempRQPackingListitem :=  HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;
  pliList := TempRQPackingListItem.getScrollableFilteredListForEdit(pliFilter,0,-1);

  LastCount:=High(pliList.list);

  if LastCount > -1 then
     sgRQPackingListItem.RowCount:=LastCount+2
  else
     sgRQPackingListItem.RowCount:=2;

   with sgRQPackingListItem do
    for i:=0 to LastCount do
      begin
        // Application.ProcessMessages;
        if pliList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(pliList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := pliList.list[i].materialName;
        AddCheckBox(1,i+1, false, false);

        Cells[2,i+1] := pliList.list[i].storageZoneRefName;
        CellProperties[2, i+1].ReadOnly := True;

        Cells[3,i+1] := pliList.list[i].measurementName;
        CellProperties[3, i+1].ReadOnly := true;

        if pliList.list[i].countGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := pliList.list[i].countGen.DecimalString;
        CellProperties[4, i+1].ReadOnly := true;
        Colors[4, i+1] := clYellow;

        if pliList.list[i].countFact = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := pliList.list[i].countFact.DecimalString;
        CellProperties[5, i+1].ReadOnly := True;

        Cells[6,i+1] := pliList.list[i].namepaletcol1;
        CellProperties[6, i+1].ReadOnly := false;
        Colors[6, i+1] := clCream;

        if pliList.list[i].countpaletcol1 = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := pliList.list[i].countpaletcol1.DecimalString;

        CellProperties[7, i+1].ReadOnly := false;
        Colors[7, i+1] := clYellow;

        Cells[8,i+1] := pliList.list[i].namepaletcol2;

        CellProperties[8, i+1].ReadOnly := false;
        Colors[8, i+1] := clCream;

        if pliList.list[i].countpaletcol2 = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := pliList.list[i].countpaletcol2.DecimalString;

        CellProperties[9, i+1].ReadOnly := false;
        Colors[9, i+1] := clYellow;

          Cells[10,i+1] := pliList.list[i].namepaletcol3;

        CellProperties[10, i+1].ReadOnly := false;
        Colors[10, i+1] := clCream;

        if pliList.list[i].countpaletcol3 = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := pliList.list[i].countpaletcol3.DecimalString;

        CellProperties[11, i+1].ReadOnly := false;
        Colors[11, i+1] := clYellow;

          Cells[12,i+1] := pliList.list[i].namepaletcol4;

        CellProperties[12, i+1].ReadOnly := false;
        Colors[12, i+1] := clCream;

        if pliList.list[i].countpaletcol4 = nil then
          Cells[13,i+1] := ''
        else
          Cells[13,i+1] := pliList.list[i].countpaletcol4.DecimalString;

        CellProperties[13, i+1].ReadOnly := false;
        Colors[13, i+1] := clYellow;

        Cells[14,i+1] := pliList.list[i].userGen;;
        CellProperties[14, i+1].ReadOnly := true;

        if pliList.list[i].dateEdit = nil then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := XSDate2String(pliList.list[i].dateEdit);
        CellProperties[15, i+1].ReadOnly := True;
        LastRow:=i+1;
        sgRQPackingListItem.RowCount:=LastRow+1;
      end;
   sgRQPackingListItem.Row:=1;

end;


procedure TfrmRQPackingListCountersEdit.FormShow(Sender: TObject);
var
  TempENDepartment:  ENDepartmentControllerSoapPort;
  TempRQPackListItem : RQPackingListItemControllerSoapPort;
  packingListItemFilter : RQPackingListItemFilter;
  packingListItemList : RQPackingListItemShortList;
  ENDepartmentObj: ENDepartment;
  budget, materialGroup : TStrings;
  bi, bi2, mi, mi2: Integer;
  TempEPRen : EPRenControllerSoapPort;
  EPRenObject : EPRen;
begin
  pcRQPackingListCounters.ActivePage := tbItems;
  DisableControls([edtCode]);

  HideControls([btnPrint, spbMassPrinting]);

  DisableControls([edtEPRenName]);

  DisableControls([btnAddNewCounters, btnAddBUCounters, btnSavePaletes, btnGenerateOrders, btnRemoveOrders], False);

  if DialogState = dsInsert then
  begin
   HideControls([ gbPackingListItem, btnPrint, spbMassPrinting, gbRQPackingList2FKOrder]);
  end;

  if DialogState = dsView then
  begin
     DisableControls([spbPacker]);
     DisableActions([actRQPackingListItemDelete, actRQPackingListItemInsert, actRemoveCounters, actRemoveBox, actSetZones]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberGen
      ,edtDateGen
      ,edtMolTo
      ,edtMolFrom
     ]);
     DisableControls([edtMolFrom, edtMolTo, edtPacker, edtDepartment]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

     packingListItemFilter := RQPackingListItemFilter.Create;
     SetNullIntProps(packingListItemFilter);
     SetNullXSProps(packingListItemFilter);
     packingListItemFilter.packingListRef := RQPackingListRef.Create;
     packingListItemFilter.packingListRef.code := Self.RQPackingListObj.code;
     TempRQPackListItem := HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;
     packingListItemList := TempRQPackListItem.getScrollableFilteredListForEdit(packingListItemFilter,0,1);

     if (((DialogState = dsEdit) and (packingListItemList.totalCount > 0))
          or (DialogState = dsView)) then
     begin
       DisableControls([spbMolFrom, spbMolTo, spbDepartment, edtDateGen, edtNumberGen, spbEPRen, spbEPRenClear, spbPacker]);
       DisableControls([spbMolTo, edtDateGen], DialogState <> dsEdit);
       ///HideControls([btnPrint],false);

     end;

     HideControls([btnPrintBoxesList], RQPackingListObj.statusRef.code <> RQPACKINGLIST_STATUS_CREATED_ORDERS);

//     if ((DialogState = dsEdit) and (packingListItemList.totalCount = 0))
//     then DisableControls([edtDateStart, edtDateFinal,
//                        spbSelectAllBudgets, spbClearAllBudgets,
//                        spbSelectAllGroupMaterials, spbClearAllGroupMaterials,
//                        btnPrintPackingStatement],False);

     if ((packingListItemList.totalCount = 0) and (Self.RQPackingListObj.statusRef.code = ENConsts.RQPACKINGLIST_STATUS_GOOD))
     then DisableControls([btnPrint]);

     if (Self.RQPackingListObj.statusRef.code = ENConsts.RQPACKINGLIST_STATUS_GOOD) then
     begin
     DisableControls([btnSavePaletes, btnGenerateOrders, btnRemoveOrders, btnPrint]);
     end;

     DisableControls([btnRemoveOrders], not (RQPackingListObj.statusRef.code = ENConsts.RQPACKINGLIST_STATUS_CREATED_ORDERS));

     //if (RQPackingListObj.statusRef.code = ENConsts.RQPACKINGLIST_STATUS_RESERVED) then
     //begin
     //DisableControls([btnAddNewCounters, btnAddBUCounters, btnRemoveOrders]);
     //DisableControls([btnSavePaletes,btnGenerateOrders],(DialogState <> dsEdit));
     //end;

     DisableControls([btnPrint], (packingListItemList.totalCount = 0) or (Self.RQPackingListObj.statusRef.code = ENConsts.RQPACKINGLIST_STATUS_GOOD));

     if (Self.RQPackingListObj.statusRef.code = ENConsts.RQPACKINGLIST_STATUS_CREATED_ORDERS)  then
     begin
     DisableControls([btnAddBUCounters, btnAddNewCounters, btnSavePaletes, btnGenerateOrders]);
     DisableControls([btnRemoveOrders], DialogState <> dsEdit);
     end;

     DisableActions([actUpdateQuantity], ((Self.RQPackingListObj.statusRef.code <> ENConsts.RQPACKINGLIST_STATUS_RESERVED) or (DialogState = dsView)));
     HideControls([spbMassPrinting], Self.RQPackingListObj.statusRef.code <> ENConsts.RQPACKINGLIST_STATUS_CREATED_ORDERS);


      edtCode.Text := IntToStr(Self.RQPackingListObj.code);
      edtNumberGen.Text := Self.RQPackingListObj.numberGen;
      if Self.RQPackingListObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(RQPackingListObj.dateGen.Year,Self.RQPackingListObj.dateGen.Month,Self.RQPackingListObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;

    edtMolFrom.Text := Self.RQPackingListObj.molFromCode + ' ' + Self.RQPackingListObj.molFromName;
    molFromCode :=  Self.RQPackingListObj.molFromCode;
    molFromName :=  Self.RQPackingListObj.molFromName;
    edtMolTo.Text := Self.RQPackingListObj.molToCode + ' ' + Self.RQPackingListObj.molToName;
    molToCode := Self.RQPackingListObj.molToCode;
    molToName := Self.RQPackingListObj.molToName;

    packerFIO := Self.RQPackingListObj.packerFIO;
    packerTabnumber := Self.RQPackingListObj.packerTabNumber;
    packerPosition := Self.RQPackingListObj.packerPosition;
    if  ((packerFIO <> '') and (packerTabnumber <> '') and (packerPosition <> ''))
    then edtPacker.Text := Self.RQPackingListObj.packerFIO + ' таб.№' + Self.RQPackingListObj.packerTabNumber + ' посада:' + Self.RQPackingListObj.packerPosition;

    departmentCode := Self.RQPackingListObj.departmentRef.code;
    if departmentCode > 0  then
    begin
      TempENDepartment:= HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
      ENDepartmentObj := TempENDepartment.getObject(departmentCode);
      edtDepartment.Text := ENDepartmentObj.shortName;
    end;

    if (Self.RQPackingListObj.renRef <> nil) then
      epRenCode := Self.RQPackingListObj.renRef.code;
    if epRenCode > -1 then
    begin
      TempEPRen := HTTPRIOEPRen as EPRenControllerSoapPort;
      EPRenObject := TempEPRen.getObject(epRenCode);
      edtEPRenName.Text := EPRenObject.name;
    end;

      DisableControls([cbTKAccountingType]);

      cbTKAccountingType.ItemIndex := RQPackingListObj.accountingTypeRef.code - 1;

     updatePackingItem;
     updateOrders;
  end;
end;



procedure TfrmRQPackingListCountersEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPackingList: RQPackingListControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumberGen
      ,edtDateGen
      ,edtMolTo
      ,edtMolFrom
      ,edtDepartment
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQPackingList := HTTPRIORQPackingList as RQPackingListControllerSoapPort;

     RQPackingListObj.numberGen := edtNumberGen.Text; 

     if edtdateGen.checked then
     begin
       if RQPackingListObj.dateGen = nil then
          RQPackingListObj.dateGen := TXSDate.Create;
       RQPackingListObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       RQPackingListObj.dateGen := nil;

     RQPackingListObj.molFromCode := molFromCode;
     RQPackingListObj.molFromName := molFromName;
     RQPackingListObj.molToCode := molToCode;
     RQPackingListObj.molToName := molToName;
     RQPackingListObj.packerFIO := packerFIO;
     RQPackingListObj.packerTabNumber := packerTabnumber;
     RQPackingListObj.packerPosition := packerPosition;

     RQPackingListObj.departmentRef := ENDepartmentRef.Create;
     RQPackingListObj.departmentRef.code := departmentCode;

     if (epRenCode <> -1) then
     begin
       RQPackingListObj.renRef := EPRenRef.Create;
       RQPackingListObj.renRef.code := epRenCode;
     end else
       RQPackingListObj.renRef := nil;

    RQPackingListObj.accountingTypeRef := TKAccountingTypeRef.Create;
    RQPackingListObj.accountingTypeRef.code := cbTKAccountingType.ItemIndex + 1;

    if DialogState = dsInsert then
    begin
      RQPackingListObj.code:=low(Integer);
      TempRQPackingList.add(RQPackingListObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQPackingList.save(RQPackingListObj);
    end;
  end;
end;


procedure TfrmRQPackingListCountersEdit.spbDepartmentClick(Sender: TObject);
var
  frmENDepartmentShow: TfrmENDepartmentShow;
  f : ENDepartmentFilter;
begin
  f := ENDepartmentFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      with frmENDepartmentShow do begin

        if ShowModal = mrOk then
        begin
          departmentCode := ENDepartmentShort(tvDep.Selected.Data).code;
          edtDepartment.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmRQPackingListCountersEdit.spbEPRenClearClick(Sender: TObject);
begin
  inherited;
  epRenCode := -1;
  edtEPRenName.Text := '';
  if RQPackingListObj.renRef = nil then RQPackingListObj.renRef := EPRenRef.Create();
  RQPackingListObj.renRef.code := -1;
end;


procedure TfrmRQPackingListCountersEdit.spbEPRenClick(Sender: TObject);
var
  frmEPRenShow : TfrmENEPRenShow;
begin
  inherited;
  frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
  try
    with frmEPRenShow do
    if ShowModal = mrOk then
    begin
      try
        if RQPackingListObj.renRef = nil then RQPackingListObj.renRef := EPRenRef.Create();
        RQPackingListObj.renRef.code := StrToInt(GetReturnValue(sgEPRen,0));
        epRenCode := StrToInt(GetReturnValue(sgEPRen,0));
        edtEPRenName.Text:=GetReturnValue(sgEPRen,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmEPRenShow.Free;
  end;
end;


procedure TfrmRQPackingListCountersEdit.spbMolFromClick(Sender: TObject);
var
  frmFINMolShow : TfrmFINMolShow;
  isCounters : Boolean;

  f : SCMolFilter;
  frmSCMolShow : TfrmSCMolShow;

begin
  inherited;

      isCounters := False;

      if DialogState = dsInsert then begin
        isCounters := (cbTKAccountingType.ItemIndex + 1 = TK_ACCOUNTINGTYPE_COUNTER);
      end else begin
        isCounters := (RQPackingListObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_COUNTER);
      end;

      if isCounters then begin
      try
          f := SCMolFilter.Create;
          SetNullXSProps(f);
          SetNullIntProps(f);
          frmSCMolShow:=TfrmSCMolShow.Create(Application,fmNormal, f);
          with frmSCMolShow do
          begin
            DisableActions([ actEdit, actInsert ]);
            if ShowModal = mrOk then
            begin
                try
                   molFromCode := GetReturnValue(sgSCMol,0);
                   molFromName := GetReturnValue(sgSCMol,2);
                   edtMolFrom.Text := molFromCode + ' ' + molFromName;
                except
                   on EConvertError do Exit;
                end;
            end;
          end;
       finally
          frmSCMolShow.Free;
       end;
      end else begin
       frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal);

       try

          with frmFINMolShow do begin
            DisableActions([ actEdit, actInsert ]);
            if ShowModal = mrOk then
            begin
                try
                   molFromCode  := GetReturnValue(sgFINMol,0);
                   molFromName := GetReturnValue(sgFINMol,1);
                   edtMolFrom.Text := GetReturnValue(sgFINMol,0) + ' ' + GetReturnValue(sgFINMol,1);
                except
                   on EConvertError do Exit;
                end;
            end;
          end;
       finally
          frmFINMolShow.Free;
       end;
      end;

end;

procedure TfrmRQPackingListCountersEdit.spbMolToClick(Sender: TObject);
var
  frmFINMolShow : TfrmFINMolShow;
  TempENDepartment: ENDepartmentControllerSoapPort;
  ENDepartmentList: ENDepartmentShortList;
  depFilter : ENDepartmentFilter;

  isCounters : Boolean;

  f : SCMolFilter;
  frmSCMolShow : TfrmSCMolShow;
begin
  inherited;

      isCounters := False;

      if DialogState = dsInsert then begin
        isCounters := (cbTKAccountingType.ItemIndex + 1 = TK_ACCOUNTINGTYPE_COUNTER);
      end else begin
        isCounters := (RQPackingListObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_COUNTER);
      end;

      if isCounters then begin
        try
          f := SCMolFilter.Create;
          SetNullXSProps(f);
          SetNullIntProps(f);
          frmSCMolShow:=TfrmSCMolShow.Create(Application,fmNormal, f);
          with frmSCMolShow do
          begin
            DisableActions([ actEdit, actInsert ]);
            if ShowModal = mrOk then
            begin
                try
                   molToCode := GetReturnValue(sgSCMol,0);
                   molToName := GetReturnValue(sgSCMol,2);
                   edtMolTo.Text := molToCode + ' ' + molToName;
                except
                   on EConvertError do Exit;
                end;
            end;
          end;
        finally
          frmSCMolShow.Free;
        end;
      end else begin
       frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal);

       try

          with frmFINMolShow do begin
            DisableActions([ actEdit, actInsert ]);
            if ShowModal = mrOk then
            begin
                try
                   molToCode  := GetReturnValue(sgFINMol,0);
                   molToName := GetReturnValue(sgFINMol,1);
                   edtMolTo.Text := GetReturnValue(sgFINMol,0) + ' ' + GetReturnValue(sgFINMol,1);
                except
                   on EConvertError do Exit;
                end;

            end;
          end;
       finally
          frmFINMolShow.Free;
       end;
      end;

      depFilter := ENDepartmentFilter.Create;
      SetNullIntProps(depFilter);
      SetNullXSProps(depFilter);
      depFilter.conditionSQL := ' code in (select m2d.departmentrefcode from enmol a, enmol2department m2d, ' +
                                             ' endepartment2epren d2r where  a.statusrefcode = 1 ' +
                                             ' and m2d.molcode = a.code ' +
                                             ' and a.fincode = ' + '''' + molToCode + '''' +
                                             ' and m2d.departmentrefcode = d2r.departmentrefcode ' +
                                             ' and d2r.finrencode::text = substring(a.fincode,1,2))';
      TempENDepartment:= HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
      ENDepartmentList := TempENDepartment.getScrollableFilteredList(depFilter,0,1);

      if ENDepartmentList.totalCount > 0 then
      begin
        edtDepartment.Text := ENDepartmentList.list[0].shortName;
        departmentCode := ENDepartmentList.list[0].code;
      end;
end;

procedure TfrmRQPackingListCountersEdit.spbPackerClick(Sender: TObject);
var 
   frmFINWorkerShow: TfrmFINWorkerShow;
begin

   frmFINWorkerShow:=TfrmFINWorkerShow.Create(Application,fmNormal);
   try
      with frmFINWorkerShow do
      begin
        DisableActions([actInsert, actEdit, actDelete]);
        if ShowModal = mrOk then
        begin
              packerFIO := GetReturnValue(sgFINWorker,1);
              packerTabnumber := GetReturnValue(sgFINWorker,2);
              packerPosition := GetReturnValue(sgFINWorker,3);
              edtPacker.Text :=  GetReturnValue(sgFINWorker,1) + ' таб.№' +
              GetReturnValue(sgFINWorker,2) + ' посада:' + GetReturnValue(sgFINWorker,3);
        end;
      end;
   finally
      frmFINWorkerShow.Free;
   end;
end;

procedure TfrmRQPackingListCountersEdit.FormCreate(Sender: TObject);
begin
  inherited;
  departmentCode := 0;
  epRenCode := -1;
  materialCode := -1;
  molFromCode := '';
  molFromName := '';
  molToCode := '';
  molToName := '';
  packerFIO := '';
  packerTabnumber := '';
  packerPosition := '';

  edtDateGen.Date := Date();

end;

procedure TfrmRQPackingListCountersEdit.btnPrintPackingStatementClick(
  Sender: TObject);
  var
   TempRQPackingList : RQPackingListControllerSoapPort;
   TempRQPackingListItem : RQPackingListItemControllerSoapPort;
   strGroupmaterials , strBudget, depCodes : String;
   groupOrMaterial, i : Integer;
begin
  inherited;

//  if not NoBlankValues([
//      edtDateStart
//      ,edtDateFinal
//     ])  then
//  begin
//           Application.MessageBox(PChar('Необхідно обрати дати для формування відомості !')
//            ,PChar('Увага !'),MB_ICONWARNING+MB_OK);
//          Exit;
//  end;



    TempRQPackingListItem:= HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;
    TempRQPackingListItem.addStringAutomatic(RQPackingListObj, groupOrMaterial);
    TempRQPackingList:= HTTPRIORQPackingList as RQPackingListControllerSoapPort;
    RQPackingListObj :=  TempRQPackingList.getObject(RQPackingListObj.code);
    Application.MessageBox(PChar('Строки созданы!'),
                    PChar('Внимание !'),MB_OK);
    Self.FormShow(Sender);


end;

procedure TfrmRQPackingListCountersEdit.actPrintBoxesExecute(Sender: TObject);
var
i, ObjCode : Integer;
reportName : String;
args, argNames : ArrayOfString;
begin
  inherited;
    reportName := 'warehouseMaterialsMovement/counterBoxReport';
    SetLength(args, 1);
    SetLength(argNames, 1);
    argNames[0] := 'boxCode';
    for  i:=1 to sgRQBox.RowCount - 1 do
    begin
        try
          ObjCode := StrToInt(sgRQBox.Cells[0,i]);
          args[0] := IntToStr(ObjCode);
        except
        on EConvertError do Exit;
        end;
        makeReport(reportName, argNames, args, 'pdf');
    end;
end;

procedure TfrmRQPackingListCountersEdit.actRemoveBoxExecute(Sender: TObject);
var
TempRQBox : RQBoxControllerSoapPort;
ObjCode : Integer;
begin
  inherited;
  TempRQBox := HTTPRIORQBox as RQBoxControllerSoapPort;
  try
    ObjCode := StrToInt(sgRQBox.Cells[0, sgRQBox.Row]);
  except on EConvertError do Exit;
  end;
   if Application.MessageBox(PChar('Ви дійсно бажаєте видалити коробку ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
      TempRQBox.remove(ObjCode, RQPackingListObj.code);
      updateBoxes;
      updateCountCounters;
    end;

end;

procedure TfrmRQPackingListCountersEdit.actRemoveCountersExecute(
  Sender: TObject);
Var
TempRQBoxItem: RQBoxItemControllerSoapPort;
    TempRQPackingList: RQPackingListControllerSoapPort;
  ObjCode, i, Count : Integer;
  state, isSel : Boolean;
  arrayOfCodes : RQBoxItemController.ArrayOfInteger;
begin
  inherited;

  Count := 0;

  isSel := False;

  for i:=1 to sgCounters.RowCount - 1 do
  begin
     sgCounters.GetCheckBoxState(1,i,state);
     if state then
     begin
       Count := Count + 1;
       isSel := true;
     end;
  end;

  SetLength(arrayOfCodes, Count);

  if not isSel then
  begin
     Application.MessageBox(PChar('Виберіть хоча б одну строку!!!'), PChar('Увага !'),MB_ICONWARNING);
     Exit;
  end;

  TempRQBoxItem := HTTPRIORQBoxItem as RQBoxItemControllerSoapPort;

  Count := 0;

     if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Лічильники) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
    for  i:=1 to sgCounters.RowCount - 1 do
    begin
      sgCounters.GetCheckBoxState(1,i,state);
      if state then
        begin
        try
          ObjCode := StrToInt(sgCounters.Cells[0,i]);
          arrayOfCodes[Count] := ObjCode;
          Count := Count + 1;
        except
        on EConvertError do Exit;
        end;
      end;
    end;
      TempRQBoxItem.remove(arrayOfCodes, RQPackingListObj.code);
      updateBoxes;
      updateCountCounters;
    end;
end;

procedure TfrmRQPackingListCountersEdit.actRQPackingListItemDeleteExecute(
  Sender: TObject);
Var TempRQPackingListItem: RQPackingListItemControllerSoapPort;
    TempRQPackingList: RQPackingListControllerSoapPort;
  ObjCode, i: Integer;
  state, isSel : Boolean;
begin

  state := false;
  isSel := false;

  for i:=1 to sgRQPackingListItem.RowCount - 1 do
  begin
     sgRQPackingListItem.GetCheckBoxState(1,i,state);
     if state then
     begin
       isSel := true;
     end;
  end;

  if not isSel then
  begin
     Application.MessageBox(PChar('Виберіть хоча б одну строку відомості!!!'), PChar('Увага !'),MB_ICONWARNING);
     Exit;
  end;

 TempRQPackingListItem := HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;

   if Application.MessageBox(PChar('Вы действительно хотите удалить (Строки пакувальної відомісті) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
    for  i:=1 to sgRQPackingListItem.RowCount - 1 do
    begin
      sgRQPackingListItem.GetCheckBoxState(1,i,state);
      if state then
        begin
        try
        ObjCode := StrToInt(sgRQPackingListItem.Cells[0,i]);
        except
        on EConvertError do Exit;
        end;
        TempRQPackingListItem.remove(ObjCode);
      end;
    end;
    end;
 TempRQPackingList := HTTPRIORQPackingList as RQPackingListControllerSoapPort;
 Self.RQPackingListObj := TempRQPackingList.getObject(RQPackingListObj.code);
 Self.FormShow(Sender);
end;

procedure TfrmRQPackingListCountersEdit.actRQPackingListItemUpdateExecute(
  Sender: TObject);
begin
  inherited;
   updatePackingItem;
end;

procedure TfrmRQPackingListCountersEdit.sgRQPackingListItemCellValidate(
  Sender: TObject; ACol, ARow: Integer; var Value: String;
  var Valid: Boolean);
var suggestedQuantity, userQuantity, u7, u9, u11, u13: Double;
    state: Boolean;
begin
  if ((ACol <> 4) and (ACol <> 7) and (ACol <> 9) and
      (ACol <> 11) and (ACol <> 13))  then Exit;

  suggestedQuantity := 0;
  try
    if sgRQPackingListItem.Cells[5, ARow] <> '' then
      suggestedQuantity := StrToFloat(sgRQPackingListItem.Cells[5, ARow]);
  except
    on EConvertError do suggestedQuantity := 0;
  end;

  userQuantity := 0;
  try
    userQuantity := StrToFloat(Value);
  except
    on EConvertError do
    begin
      Application.MessageBox(PChar('Неприпустиме значення: "' + Value + '"!'), PChar('Помилка!'), MB_ICONERROR);
      Value := FloatToStr(suggestedQuantity);
      Valid := false;
      Exit;
    end;
  end;

  if userQuantity < 0 then
  begin
    Application.MessageBox(PChar('Неприпустиме значення: "' + Value + '"!'), PChar('Помилка!'), MB_ICONERROR);
    Value := FloatToStr(suggestedQuantity);
    Valid := false;
    Exit;
  end;

  if ACol = 4 then
  begin
  if userQuantity > suggestedQuantity then
  begin
    Application.MessageBox(PChar('Максимальна припустима кількість: ' + FloatToStr(suggestedQuantity) + '!'), PChar('Помилка!'), MB_ICONERROR);
    Value := FloatToStr(suggestedQuantity);
    Valid := false;
  end;
  end;

  if ((ACol = 7) or (ACol = 9) or
      (ACol = 11) or (ACol = 13)) then
  begin

   if sgRQPackingListItem.Cells[7, ARow] <> '' then
      u7 := StrToFloat(sgRQPackingListItem.Cells[7, ARow]);
   if sgRQPackingListItem.Cells[9, ARow] <> '' then
      u9 := StrToFloat(sgRQPackingListItem.Cells[9, ARow]);
   if sgRQPackingListItem.Cells[11, ARow] <> '' then
      u11 := StrToFloat(sgRQPackingListItem.Cells[11, ARow]);
   if sgRQPackingListItem.Cells[13, ARow] <> '' then
      u13 := StrToFloat(sgRQPackingListItem.Cells[13, ARow]);

  userQuantity :=  u7 + u9 + u11 + u13;

  if userQuantity > suggestedQuantity then
  begin
    Application.MessageBox(PChar('Максимальна припустима кількість: ' + FloatToStr(suggestedQuantity) + '!'), PChar('Помилка!'), MB_ICONERROR);
    Value := FloatToStr(suggestedQuantity);
    Valid := false;
  end;
  end;
end;

procedure TfrmRQPackingListCountersEdit.btnSavePaletesClick(Sender: TObject);
Var TempRQPackingListItem: RQPackingListItemControllerSoapPort;
    pliArr : ArrayOfRQPackingListItemShort;
    i, count: Integer ;
    s:string;
    TempRQPackingList: RQPackingListControllerSoapPort;

begin

 TempRQPackingListItem := HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;



  if Application.MessageBox(PChar('Вы действительно хотите разнести данные по палетам?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

           setLength(pliArr,0);

         for i:= 1 to sgRQPackingListItem.RowCount-1 do
           begin
             count := High(pliArr)+1;
             setLength(pliArr,count+1);
             pliArr[count] := RQPackingListItemShort.Create;
             pliArr[count].code := StrToInt(sgRQPackingListItem.Cells[0,i]);
             pliArr[count].materialName := sgRQPackingListItem.Cells[1,i];
             pliArr[count].packingListRefCode := RQPackingListObj.code;
             pliArr[count].countGen := TXSDecimal.Create;
             pliArr[count].countGen.DecimalString := Trim(sgRQPackingListItem.Cells[4,i]);
             pliArr[count].countFact := TXSDecimal.Create;
             pliArr[count].countFact.DecimalString := Trim(sgRQPackingListItem.Cells[5,i]);
             if sgRQPackingListItem.Cells[7,i] = '' then
             pliArr[count].countPaletCol1 := nil
             else begin
             pliArr[count].countPaletCol1 := TXSDecimal.Create;
             pliArr[count].countPaletCol1.DecimalString := Trim(sgRQPackingListItem.Cells[7,i]);
             end;
             if sgRQPackingListItem.Cells[9,i] = '' then
             pliArr[count].countPaletCol2 := nil
             else begin
             pliArr[count].countPaletCol2 := TXSDecimal.Create;
             pliArr[count].countPaletCol2.DecimalString := Trim(sgRQPackingListItem.Cells[9,i]);
             end;
             if sgRQPackingListItem.Cells[11,i] = '' then
             pliArr[count].countPaletCol3 := nil
             else begin
             pliArr[count].countPaletCol3 := TXSDecimal.Create;
             pliArr[count].countPaletCol3.DecimalString := Trim(sgRQPackingListItem.Cells[11,i]);
             end;
             if sgRQPackingListItem.Cells[13,i] = '' then
             pliArr[count].countPaletCol4 := nil
             else begin
             pliArr[count].countPaletCol4 := TXSDecimal.Create;
             pliArr[count].countPaletCol4.DecimalString := Trim(sgRQPackingListItem.Cells[13,i]);
             end;
             pliArr[count].namePaletCol1 := trim(sgRQPackingListItem.Cells[6,i]);
             pliArr[count].namePaletCol2 := trim(sgRQPackingListItem.Cells[8,i]);
             pliArr[count].namePaletCol3 := trim(sgRQPackingListItem.Cells[10,i]);
             pliArr[count].namePaletCol4 := trim(sgRQPackingListItem.Cells[12,i]);
           end;
         ///
      TempRQPackingListItem.savePackingItems(pliArr);
      TempRQPackingList:= HTTPRIORQPackingList as RQPackingListControllerSoapPort;
      RQPackingListObj :=  TempRQPackingList.getObject(RQPackingListObj.code);
      Self.FormShow(Sender);
      Application.MessageBox(PChar('Кількість по палетах рознесена!'),
                    PChar('Внимание !'),MB_OK);
  end;
end;

procedure TfrmRQPackingListCountersEdit.btnAddBUCountersClick(Sender: TObject);
var scanCounter : TfrmScanningCountersEdit;
TempRQPackingList : RQPackingListControllerSoapPort;
begin
  inherited;
  scanCounter := TfrmScanningCountersEdit.Create(Application, dsInsert);
  scanCounter.rqPackingListCode := RQPackingListObj.code;
  scanCounter.molCode := RQPackingListObj.molFromCode;
  scanCounter.dateGen := RQPackingListObj.dateGen;
  scanCounter.ShowModal;
  TempRQPackingList := HTTPRIORQPackingList as RQPackingListControllerSoapPort;
  Self.RQPackingListObj := TempRQPackingList.getObject(Self.RQPackingListObj.code);
  Self.FormShow(Sender);
end;

procedure TfrmRQPackingListCountersEdit.btnAddNewCountersClick(Sender: TObject);
var
   frmSCOrderShow :  TfrmSCOrderShow;
   f : SCOrderFilter;
   podrOUT : string;
   scOrderCode : Integer;
   TempRQPackingListItem : RQPackingListItemControllerSoapPort;
   TempRQPackingList : RQPackingListControllerSoapPort;
begin
  inherited;

  TempRQPackingListItem := HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;

   f := SCOrderFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   podrOUT := '0' + Copy(RQPackingListObj.molToCode, 0, 2);


   f.kindRef := SCOrderKindRef.create;
   f.kindRef.code := SCORDERKIND_FOR_PRIHOD;

   f.podrCode := podrOUT ;

   // бортануть уже переданные ?? как??
   f.conditionSQL := 'sccode not in (select so.sccode from scinvoice i, rqfkorderitem oi, rqfkorder o, scorder so ' +
                     ' where o.code = oi.fkorderrefcode and o.kindcode in (' + IntToStr(RQFKORDER_KIND_RASHOD_OE2REM) + ', ' + IntToStr(RQFKORDER_KIND_PACKING_ORDER) + ') and i.fkorderitemrefcode = oi.code ' +
                     ' and i.code = so.invoicerefcode ' +
                     ' and so.kindrefcode =  ' + IntToStr(SCORDERKIND_FOR_MOVE) +
                     ' and so.sccode is not null ' + // 07.09.11 Из-за наллов (непроведенные накладные) ничего не выбирается вообще!!!
                     ' and so.podrcode = ''' + podrOUT + ''')';
   {удаляются счетчики приходованные для абонентов}
   f.conditionSQL := f.conditionSQL + ' and not exists (select from rqfkorder as fo1 ' +
                      ' inner join rqfkorderitem as fi1 on fo1.code = fi1.fkorderrefcode ' +
                      ' inner join scinvoice as inv1 on fi1.code = inv1.fkorderitemrefcode ' +
                      ' inner join scorder as o1 on inv1.code = o1.invoicerefcode ' +
                      ' inner join enservicesbjct2rqfkrdr as sofo1 on fo1.code = sofo1.fkorderrefcode ' +
                      ' where o1.code = SCORDER.CODE)';

   frmSCOrderShow:=TfrmSCOrderShow.Create(Application,fmNormal, f);
   try
      frmSCOrderShow.DisableActions([frmSCOrderShow.actInsert, frmSCOrderShow.actDelete, frmSCOrderShow.actEdit,
                                     frmSCOrderShow.actFilter, frmSCOrderShow.actNoFilter]);
      with frmSCOrderShow do
      begin
        if ShowModal = mrOk then
        begin
            try
                scOrderCode := StrToInt(GetReturnValue(sgSCOrder,0));
                      if Application.MessageBox(PChar('Ви дійсно бажаєте додати лічильники по рознарядці?'),
                      PChar('Внимание !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK
                      then
                      begin
                        frmSCOrderShow.Close;
                        Exit;
                          end;
                TempRQPackingListItem.addNewCountersBySCOrderCode(RQPackingListObj.code, scOrderCode);
                TempRQPackingList := HTTPRIORQPackingList as RQPackingListControllerSoapPort;
                Self.RQPackingListObj := TempRQPackingList.getObject(Self.RQPackingListObj.code);
                Self.FormShow(Sender);
                Application.MessageBox(PChar('Лічильники додані!'),
                    PChar('Внимание !'),MB_OK);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmSCOrderShow.Free;
   end;

end;

procedure TfrmRQPackingListCountersEdit.btnGenerateOrdersClick(Sender: TObject);
Var TempRQPackingListItem: RQPackingListItemControllerSoapPort;
    TempRQPackingList: RQPackingListControllerSoapPort;
begin
  inherited;
  if Application.MessageBox(PChar('Вы действительно хотите сформировать ордера?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
  TempRQPackingListItem := HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;
  TempRQPackingListItem.createChildOrdersByPackingList(RQPackingListObj.code);
  TempRQPackingList:= HTTPRIORQPackingList as RQPackingListControllerSoapPort;
  RQPackingListObj :=  TempRQPackingList.getObject(RQPackingListObj.code);
  Self.FormShow(Sender);
  Application.MessageBox(PChar('Ордера сформированы!'),
                    PChar('Внимание !'),MB_OK);
  end;


end;

procedure TfrmRQPackingListCountersEdit.btnRemoveOrdersClick(Sender: TObject);
Var TempRQPackingListItem: RQPackingListItemControllerSoapPort;
    TempRQPackingList:RQPackingListControllerSoapPort;
begin
  inherited;
  if Application.MessageBox(PChar('Вы действительно хотите удалить сформированные ордера и все разнесенные строки ведомости?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
  TempRQPackingListItem := HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;
  TempRQPackingListItem.removeOrdersByPackingList(RQPackingListObj.code);
  TempRQPackingList:= HTTPRIORQPackingList as RQPackingListControllerSoapPort;
  RQPackingListObj :=  TempRQPackingList.getObject(RQPackingListObj.code);
  Self.FormShow(Sender);
  Application.MessageBox(PChar('Всі сформовані ордера видалені!'),
                    PChar('Внимание !'),MB_OK);
  end;
end;

procedure TfrmRQPackingListCountersEdit.btnPrintBoxesListClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;

begin
    inherited;

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'packingListCode';
    args[0] := IntToStr(RQPackingListObj.code);

    reportName := 'warehouseMaterialsMovement/boxesList';

    makeReport(reportName, argNames, args, 'pdf');

end;

procedure TfrmRQPackingListCountersEdit.btnPrintClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;

begin

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'packingListCode';
    args[0] := IntToStr(RQPackingListObj.code);

    reportName := 'warehouseMaterialsMovement/packingSlipByCode';

    makeReport(reportName, argNames, args, 'xls');

end;

procedure TfrmRQPackingListCountersEdit.sgCountersClick(Sender: TObject);
begin
  inherited;
  updateCountCounters;
end;

procedure TfrmRQPackingListCountersEdit.sgRQBoxClick(Sender: TObject);
begin
  inherited;
  updateCounters;
end;

procedure TfrmRQPackingListCountersEdit.sgRQPackingList2FKOrderDblClick(
  Sender: TObject);
Var TempRQFKOrder: RQFKOrderControllerSoapPort;
begin
  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  frmRQFKOrderEdit:=TfrmRQFKOrderEdit.Create(Application, dsView);

  try
    try
      frmRQFKOrderEdit.RQFKOrderObj := TempRQFKOrder.getObject(Integer(sgRQPackingList2FKOrder.Objects[0,sgRQPackingList2FKOrder.Row]));
      if frmRQFKOrderEdit.RQFKOrderObj = nil then Exit;
    except
      on EConvertError do Exit;
    end;

    if (frmRQFKOrderEdit.ShowModal = mrOk) then
      begin
      end;

  finally
    frmRQFKOrderEdit.Free;
    frmRQFKOrderEdit:=nil;
  end;

end;

procedure TfrmRQPackingListCountersEdit.spbMassPrintingClick(Sender: TObject);
var
  TempRQPackingList2FKOrder : RQPackingList2FKOrderControllerSoapPort;
  TempRQPackingList : RQPackingListControllerSoapPort;
  TempRQFKOrder : RQFKOrderControllerSoapPort;

  packingList2FKOrderFilter : RQPackingList2FKOrderFilter;
  fkOrderFilter : RQFKOrderFilter;
  packingList : RQPackingListFilter;

  packingList2FKOrderList : RQPackingList2FKOrderShortList;
  fkOrderList : RQFKOrderShortList;

  i, j : Integer;
  reportName, reportXlsOrPdf : String;
  argNames, args: ArrayOfString;
  palletNumbers : ArrayOfString;
  RQFKOrderItemFilterObj : RQFKOrderItemFilter;
  TempRQFKOrderItem : RQFKOrderItemControllerSoapPort;
  fkOrderItemList : RQFKOrderItemShortList;
  fkOrder: RQFKOrder;
begin
    reportXlsOrPdf := 'xls';
    TempRQPackingList := HTTPRIORQPackingList as RQPackingListControllerSoapPort;
    TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

    // Вытаскивание и печать всех ордеров связанных с ведомостью, но только не 30го вида
    fkOrderFilter := RQFKOrderFilter.Create;
    SetNullXSProps(fkOrderFilter);
    SetNullIntProps(fkOrderFilter);



    fkOrderFilter.conditionSQL := ' EXISTS (select code From rqpackinglist2fkorder as pcfo where pcfo.packinglistrefcode = ' + IntToStr(RQPackingListObj.code) + ' and pcfo.fkorderrefcode = RQFKORDER.CODE) AND RQFKORDER.KINDCODE <> ' + IntToStr(RQFKORDER_KIND_PACKING_ORDER);

    fkOrderList := TempRQFKOrder.getScrollableFilteredList(fkOrderFilter, 0, -1);

    for i := 0 to fkOrderList.totalCount - 1 do
    begin
       // 05.07.2021 Печатаем по-новому (вся логика формирования репортов - на серваке)
       fkOrder := TempRQFKOrder.getObjectNoSegr(fkOrderList.list[i].code);
       if DMReports.printReportsForObject(fkOrder) then Continue;

        if (Self.RQPackingListObj.accountingTypeRef.code = ENConsts.TK_ACCOUNTINGTYPE_TMC) then begin
            if  fkOrderList.list[i].kindCode = RQFKORDER_KIND_RASHOD_OE2REM then
            begin
                reportName := 'RepOrder/RQFKOrder/RQFKOrderOut';
            end
            else
              if fkOrderList.list[i].kindCode = RQFKORDER_KIND_RASHOD_MNMA then
              begin
                reportName := 'RepOrder/Rashod_MNMA_Out/OZ-1';
              end;

              SetLength(argNames, 1);
              SetLength(args, 1);

              argnames[0] := 'orderCode';
              args[0] := IntToStr( fkOrderList.list[i].code );

              makeReport(reportName, argNames, args, reportXlsOrPdf);
        end else
            if Self.RQPackingListObj.accountingTypeRef.code = ENConsts.TK_ACCOUNTINGTYPE_COUNTER then begin
                      RQFKOrderItemFilterObj := RQFKOrderItemFilter.Create;
                      SetNullIntProps(RQFKOrderItemFilterObj);
                      SetNullXSProps(RQFKOrderItemFilterObj);
                      RQFKOrderItemFilterObj.fkOrderRef := RQFKOrderRef.Create;
                      RQFKOrderItemFilterObj.fkOrderRef.code := fkOrderList.list[i].code;

                      TempRQFKOrderItem :=  HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
                      fkOrderItemList := TempRQFKOrderItem.getScrollableFilteredList(RQFKOrderItemFilterObj,0,-1);
                      for j:=0 to High(fkOrderItemList.list) do
                      begin
                        printingOZ(fkOrderItemList.list[i].code);
                      end;
            end;
    end;

    // Вытаскивание всех номеров палет и печатание акта-приема передачи палет и
    // упаковочных листов
    palletNumbers := TempRQPackingList.getPalletNumbers(RQPackingListObj.code);

    if (palletNumbers = nil) or (Length(palletNumbers) = 0) then
    begin
      Application.MessageBox(PChar('Не найдено палеты для упаковочно-погрузочной ведомости'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Exit;
    end;

    SetLength(argNames, 2);
    SetLength(args, 2);

    argNames[0] := 'packingListCode';
    argNames[1] := 'palletNumber';

    args[0] := IntToStr(RQPackingListObj.code);

    for i := 0 to Length(palletNumbers) - 1 do
    begin
         args[1] := palletNumbers[i];

         // Акт приема передачи палет
         reportName := 'RepOrder/RepPallet/ActPalletPriPer';
         makeReport(reportName, argNames, args, 'pdf');
         // Пакувальний лист
         if(Self.RQPackingListObj.accountingTypeRef.code = ENConsts.TK_ACCOUNTINGTYPE_TMC) then
          reportName := 'warehouseMaterialsMovement/packingList'
         else
          reportName := 'warehouseMaterialsMovement/packingListCounters';

         makeReport(reportName, argNames, args, 'xls');
    end;

end;

procedure TfrmRQPackingListCountersEdit.actSelectAllCountersExecute(
  Sender: TObject);
begin
  inherited;
    checkGrid(sgCounters, 1, true);
end;

procedure TfrmRQPackingListCountersEdit.actSelectAllExecute(Sender: TObject);
begin
    checkGrid(sgRQPackingListItem, 1, true);
end;

procedure TfrmRQPackingListCountersEdit.actSetZonesExecute(Sender: TObject);
var
  TempRQBox : RQBoxControllerSoapPort;
  zoneFilter: RQStorageZoneFilter;
  frmRQStorageZoneShow: TfrmRQStorageZoneShow;
  Count, i : Integer;
  isSel, state : Boolean;
  box : RQBox;
begin
  inherited;

  TempRQBox := HTTPRIORQBox as RQBoxControllerSoapPort;

  Count := 0;

  isSel := False;
  state := False;

  for i:=1 to sgRQBox.RowCount - 1 do
  begin
     sgRQBox.GetCheckBoxState(2,i,state);
     if state then
     begin
       Count := Count + 1;
       isSel := true;
     end;
  end;

  if not isSel then
  begin
     Application.MessageBox(PChar('Виберіть хоча б одну коробку!!!'), PChar('Увага !'),MB_ICONWARNING);
     Exit;
  end;

  // Hash
  zoneFilter := RQStorageZoneFilter.Create;
  SetNullIntProps(zoneFilter);
  SetNullXSProps(zoneFilter);

    zoneFilter.conditionSQL :=
    //  05.10.2012 +++ склад на документе == складу зоны хранения
    ' rqstoragezone.code in ' +
    ' (select sm.zonerefcode from rqstorage2enmol2zone sm ' +
    '  where sm.molrefcode in ' +
    '    (select m.code from enmol m where m.fincode = ''' + RQPackingListObj.molToCode + ''')) ';
  zoneFilter.orderBySQL := 'rqstoragezone.name';

  frmRQStorageZoneShow := TfrmRQStorageZoneShow.Create(Application, fmNormal, zoneFilter);
  try
    frmRQStorageZoneShow.DisableActions([frmRQStorageZoneShow.actInsert,
                                         frmRQStorageZoneShow.actDelete,
                                         frmRQStorageZoneShow.actEdit]);
    with frmRQStorageZoneShow do
      if ShowModal = mrOk then
      begin
        try
            for  i:=1 to sgRQBox.RowCount - 1 do
            begin
                box := TempRQBox.getObject(StrToInt(sgRQBox.Cells[0,i]));
                box.storageZoneRef.code := StrToInt(GetReturnValue(sgRQStorageZone, 0));
                TempRQBox.save(box);
            end;

            updateBoxes;


        except
           on EConvertError do Exit;
        end;
      end;
  finally
    frmRQStorageZoneShow.Free;
  end;

end;

procedure TfrmRQPackingListCountersEdit.actUpdateBoxesExecute(Sender: TObject);
begin
  inherited;
  updateBoxes;
end;

procedure TfrmRQPackingListCountersEdit.actUpdateCountersExecute(
  Sender: TObject);
begin
  inherited;
  updateCounters;
end;

procedure TfrmRQPackingListCountersEdit.actEraseAllExecute(Sender: TObject);
begin
    checkGrid(sgRQPackingListItem, 1, false);
end;

procedure TfrmRQPackingListCountersEdit.pcRQPackingListCountersChange(
  Sender: TObject);
begin
  inherited;
  if pcRQPackingListCounters.ActivePage = tbBoxes then begin
    updateBoxes;
  end else if pcRQPackingListCounters.ActivePage = tbItems then begin
    updatePackingItem;
  end;

end;

procedure TfrmRQPackingListCountersEdit.printingOZ(fkItemCode : Integer);
var
  i : Integer;
  argNames, args: ArrayOfString;
  reportName: String;
begin

   SetLength(argNames, 1);
   SetLength(args, 1);

   argnames[0] := 'codeoz';
   args[0] := IntToStr( fkItemCode );
   reportName := 'Counters/VN_PER/Counters_vn_per';

   makeReport(reportName, argNames, args, 'xls');

end;



end.
