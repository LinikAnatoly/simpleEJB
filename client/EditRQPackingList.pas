
unit EditRQPackingList;

interface

uses
  Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
  Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
  DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, RQPackingListController, RQPackingListItemController,
  CheckLst, TB2Item, TB2Dock, TB2Toolbar, ENConsts, AdvObj, ShowENEPRen;

type
  TfrmRQPackingListEdit = class(TDialogForm)

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
    gbPackingStatementParameteres: TGroupBox;
    lblBudget: TLabel;
    lblEndDate: TLabel;
    lblPlanPeriod: TLabel;
    lblStartDate: TLabel;
    lblMaterialsGroups: TLabel;
    spbSelectAllBudgets: TSpeedButton;
    spbClearAllBudgets: TSpeedButton;
    spbSelectAllGroupMaterials: TSpeedButton;
    spbClearAllGroupMaterials: TSpeedButton;
    edtDateFinal: TDateTimePicker;
    edtDateStart: TDateTimePicker;
    ListMaterialsGroups: TCheckListBox;
    ListBudget: TCheckListBox;
    HTTPRIOENDepartment: THTTPRIO;
    HTTPRIOTKMaterials: THTTPRIO;
    spbMolFrom: TSpeedButton;
    spbMolTo: TSpeedButton;
    spbPacker: TSpeedButton;
    edtDepartment: TEdit;
    lblDepartment: TLabel;
    spbDepartment: TSpeedButton;
    HTTPRIORQPackingListItem: THTTPRIO;
    btnPrintPackingStatement: TButton;
    gbPackingListItem: TGroupBox;
    sgRQPackingListItem: TAdvStringGrid;
    TBToolbar1: TTBToolbar;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    imageList1: TImageList;
    alRQPackingListItem: TActionList;
    actRQPackingListItemDelete: TAction;
    actRQPackingListItemUpdate: TAction;
    pmRQPackingListItem: TPopupMenu;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    TBToolbar2: TTBToolbar;
    TBControlItem1: TTBControlItem;
    btnGenerateItems: TSpeedButton;
    TBControlItem2: TTBControlItem;
    btnSavePaletes: TSpeedButton;
    TBControlItem3: TTBControlItem;
    btnGenerateOrders: TSpeedButton;
    TBControlItem4: TTBControlItem;
    btnRemoveOrders: TSpeedButton;
    btnPrint: TSpeedButton;
    spbPrintReport: TSpeedButton;
    gbRQPackingList2FKOrder: TGroupBox;
    sgRQPackingList2FKOrder: TAdvStringGrid;
    HTTPRIORQPackingList2FKOrder: THTTPRIO;
    HTTPRIORQFKOrder: THTTPRIO;
    spbMassPrinting: TSpeedButton;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    actSelectAll: TAction;
    actEraseAll: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    actUpdateQuantity: TAction;
    TBItem6: TTBItem;
    N3: TMenuItem;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    HTTPRIOEPRen: THTTPRIO;
    spbEPRenClear: TSpeedButton;
    lblAccountingType: TLabel;
    cbTKAccountingType: TComboBox;
    actMakeOnePalete: TAction;
    TBItem7: TTBItem;
    lblENElement: TLabel;
    ListENElement: TListBox;
    spbAddENElement: TSpeedButton;
    spbRemoveENElement: TSpeedButton;
    actRQPackingListItemEdit: TAction;
    HTTPRIOENElement: THTTPRIO;
    actAddENElement: TAction;
    actRemoveENElement: TAction;
    actRQPackingListItemView: TAction;
    TBItem8: TTBItem;
    lblGeograph: TLabel;
    edtGeograph: TEdit;
    btnGeograph: TSpeedButton;
    btnGeographClear: TSpeedButton;
    btn1: TSpeedButton;
    HTTPRIOENGeographicDepartment: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbDepartmentClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbSelectAllBudgetsClick(Sender: TObject);
    procedure spbClearAllBudgetsClick(Sender: TObject);
    procedure spbSelectAllGroupMaterialsClick(Sender: TObject);
    procedure spbClearAllGroupMaterialsClick(Sender: TObject);
    procedure spbMolFromClick(Sender: TObject);
    procedure spbMolToClick(Sender: TObject);
    procedure spbPackerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPrintPackingStatementClick(Sender: TObject);
    procedure actRQPackingListItemDeleteExecute(Sender: TObject);
    procedure actRQPackingListItemUpdateExecute(Sender: TObject);
    procedure sgRQPackingListItemCellValidate(Sender: TObject; ACol,
      ARow: Integer; var Value: String; var Valid: Boolean);
    procedure sgRQPackingListItemSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure btnSavePaletesClick(Sender: TObject);
    procedure btnGenerateItemsClick(Sender: TObject);
    procedure btnGenerateOrdersClick(Sender: TObject);
    procedure btnRemoveOrdersClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure spbPrintReportClick(Sender: TObject);
    procedure sgRQPackingList2FKOrderDblClick(Sender: TObject);
    procedure spbMassPrintingClick(Sender: TObject);
    procedure actSelectAllExecute(Sender: TObject);
    procedure actEraseAllExecute(Sender: TObject);
    procedure actUpdateQuantityExecute(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure actMakeOnePaleteExecute(Sender: TObject);
    procedure actRQPackingListItemEditExecute(Sender: TObject);
    procedure fillListENElement;
    procedure actAddENElementExecute(Sender: TObject);
    procedure actRemoveENElementExecute(Sender: TObject);
    procedure actRQPackingListItemViewExecute(Sender: TObject);
	procedure openRQPackingListItem(mode : TDialogState);
    procedure btn1Click(Sender: TObject);
    procedure btnGeographClick(Sender: TObject);
    procedure btnGeographClearClick(Sender: TObject);


  private
  { Private declarations }
    isMolForStorage : Boolean;
    procedure fillBudgets;
    procedure fillMaterialsGroups;
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
    geoDepartmentcode : Integer;
end;

var
  frmRQPackingListEdit: TfrmRQPackingListEdit;

  RQPackingListItemMolStorageHeaders: array [1..16] of String =
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

    RQPackingListItemMolNotStorageHeaders: array [1..7] of String =
        ( 'Код'
          ,'Наименование материала'
          ,'Наименование единицы изменения'
          ,'Необходимое количество'
          ,'Фактическое количество'
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
  , SCMolController
  , ShowSCMol
  , FINMolController, EditRQPackingListItem
  , ENElementController
  , ShowENElement, ShowENGeographicDepartment, ENGeographicDepartmentController;
{uses
    EnergyproController, EnergyproController2, RQPackingListController  ;
}
{$R *.dfm}

procedure TfrmRQPackingListEdit.openRQPackingListItem(mode : TDialogState);
var
  TempRQPackingListItem: RQPackingListItemControllerSoapPort;
  objCode : Integer;
begin
  inherited;
  try
    objCode := StrToInt(sgRQPackingListItem.Cells[0,sgRQPackingListItem.Row]);
  except on EConvertError do Exit;
  end;

  TempRQPackingListItem := HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;
  RQPackingListItemObj := TempRQPackingListItem.getObject(objCode);
        frmRQPackingListItemEdit:=TfrmRQPackingListItemEdit.Create(Application, mode);
      try
        frmRQPackingListItemEdit.ShowModal;
        if mode = dsEdit then
          begin
            updatePackingItem;
          end;
      finally
        frmRQPackingListItemEdit.Free;
        frmRQPackingListItemEdit:=nil;
      end;
end;

procedure TfrmRQPackingListEdit.actAddENElementExecute(Sender: TObject);
var
  selectedObj : ENElementShort;
  i : Integer;
  strName : String;
begin
  inherited;
  selectedObj := TfrmENElementShow.chooseFromList();
  if Assigned(selectedObj) then begin
    strName := 'Інв.№ ' + selectedObj.objectInvNumber + ' - ' + selectedObj.objectName;
     For i:=0 to ListENElement.Count -1  do begin
        if Integer( ListENElement.Items.Objects[i] ) = selectedObj.code then begin
         Application.MessageBox(PChar('Об''єкт ' + strName + ' вже доданий у лист')
         , PChar('Повідомлення'), MB_ICONINFORMATION);
         Exit;
        end;
    End;
    ListENElement.Items.AddObject(strName, TObject( selectedObj.code )  );
  end;
end;

procedure TfrmRQPackingListEdit.fillListENElement;
var strElementCodes : String;
elementCodes : TStringList;
i : Integer;
TempENElement : ENElementControllerSoapPort;
filter : ENElementFilter;
list : ENElementShortList;
begin
	if (not Assigned(RQPackingListObj)) 
		or (RQPackingListObj.code = Low(Integer))
		or (Length(RQPackingListObj.elementString) = 0)		then Exit;
		
	TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;
	
	filter := ENElementFilter.Create;
	SetNullXSProps(filter);
	SetNullIntProps(filter);
	filter.conditionSQL := 'ENELEMENT.CODE in (' + RQPackingListObj.elementString + ')';
	list := TempENElement.getScrollableFilteredList(filter, 0, -1);
	ListENElement.Items.Clear;
	for i := 0 to Length(list.list) - 1 do begin
		ListENElement.Items.AddObject('Інв.№ ' + list.list[i].objectInvNumber + ' - ' + list.list[i].objectName , TObject( list.list[i].code )  );
	end;
end;
procedure TfrmRQPackingListEdit.updateOrders;
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
  packingList2orderFilter.packingListRef.code := RQPackingListObj.code;
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

procedure  TfrmRQPackingListEdit.updatePackingItem;
var
  TempRQPackingListItem: RQPackingListItemControllerSoapPort;
  i, LastCount, LastRow: Integer;
  pliList: RQPackingListItemShortList;
  pliFilter : RQPackingListItemFilter;
  columnIndex : Integer;
  begin

  ClearGrid(sgRQPackingListItem);

  if Self.isMolForStorage then begin
    sgRQPackingListItem.ColCount := 16;
    SetGridHeaders(RQPackingListItemMolStorageHeaders, sgRQPackingListItem.ColumnHeaders);
  end else begin
    sgRQPackingListItem.ColCount := 7;
    sgRQPackingListItem.ColWidths[1] := 500;
    SetGridHeaders(RQPackingListItemMolNotStorageHeaders, sgRQPackingListItem.ColumnHeaders);
  end;

  sgRQPackingListItem.Options := sgRQPackingListItem.Options - [goColMoving];
  sgRQPackingListItem.Options := sgRQPackingListItem.Options + [goEditing];

  pliFilter := RQPackingListItemFilter.Create;
  SetNullIntProps(pliFilter);
  SetNullXSProps(pliFilter);
  pliFilter.packingListRef := RQPackingListRef.Create;
  pliFilter.packingListRef.code := RQPackingListObj.code;

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
        columnIndex := 0;
        // Application.ProcessMessages;
        if pliList.list[i].code <> Low(Integer) then
        Cells[columnIndex,i+1] := IntToStr(pliList.list[i].code)
        else
        Cells[columnIndex,i+1] := '';
        Inc(columnIndex);

        Cells[columnIndex,i+1] := pliList.list[i].materialName;
        AddCheckBox(columnIndex,i+1, false, false);
        Inc(columnIndex);

        if Self.isMolForStorage then begin
          Cells[columnIndex,i+1] := pliList.list[i].storageZoneRefName;
          CellProperties[columnIndex, i+1].ReadOnly := True;
          Inc(columnIndex);
        end;

        Cells[columnIndex,i+1] := pliList.list[i].measurementName;
        CellProperties[columnIndex, i+1].ReadOnly := true;
        Inc(columnIndex);

        if pliList.list[i].countGen = nil then
          Cells[columnIndex,i+1] := ''
        else
          Cells[columnIndex,i+1] := pliList.list[i].countGen.DecimalString;
        CellProperties[columnIndex, i+1].ReadOnly := true;
        Colors[columnIndex, i+1] := clYellow;
        Inc(columnIndex);

        if pliList.list[i].countFact = nil then
          Cells[columnIndex,i+1] := ''
        else
          Cells[columnIndex,i+1] := pliList.list[i].countFact.DecimalString;
        CellProperties[columnIndex, i+1].ReadOnly := True;
        Inc(columnIndex);

        if Self.isMolForStorage then begin
          Cells[columnIndex,i+1] := pliList.list[i].namepaletcol1;
          CellProperties[columnIndex, i+1].ReadOnly := false;
          Colors[columnIndex, i+1] := clCream;
          Inc(columnIndex);

          if pliList.list[i].countpaletcol1 = nil then
            Cells[columnIndex,i+1] := ''
          else
            Cells[columnIndex,i+1] := pliList.list[i].countpaletcol1.DecimalString;
          CellProperties[columnIndex, i+1].ReadOnly := false;
          Colors[columnIndex, i+1] := clYellow;
          Inc(columnIndex);

          Cells[columnIndex,i+1] := pliList.list[i].namepaletcol2;
          CellProperties[columnIndex, i+1].ReadOnly := false;
          Colors[columnIndex, i+1] := clCream;
          Inc(columnIndex);

          if pliList.list[i].countpaletcol2 = nil then
            Cells[columnIndex,i+1] := ''
          else
            Cells[columnIndex,i+1] := pliList.list[i].countpaletcol2.DecimalString;
          CellProperties[columnIndex, i+1].ReadOnly := false;
          Colors[columnIndex, i+1] := clYellow;
          Inc(columnIndex);

          Cells[columnIndex,i+1] := pliList.list[i].namepaletcol3;
          CellProperties[columnIndex, i+1].ReadOnly := false;
          Colors[columnIndex, i+1] := clCream;
          Inc(columnIndex);

          if pliList.list[i].countpaletcol3 = nil then
            Cells[columnIndex,i+1] := ''
          else
            Cells[columnIndex,i+1] := pliList.list[i].countpaletcol3.DecimalString;
          CellProperties[columnIndex, i+1].ReadOnly := false;
          Colors[columnIndex, i+1] := clYellow;
          Inc(columnIndex);

          Cells[columnIndex,i+1] := pliList.list[i].namepaletcol4;
          CellProperties[columnIndex, i+1].ReadOnly := false;
          Colors[columnIndex, i+1] := clCream;
          Inc(columnIndex);

          if pliList.list[i].countpaletcol4 = nil then
            Cells[columnIndex,i+1] := ''
          else
            Cells[columnIndex,i+1] := pliList.list[i].countpaletcol4.DecimalString;
          CellProperties[columnIndex, i+1].ReadOnly := false;
          Colors[columnIndex, i+1] := clYellow;
          Inc(columnIndex);
        end;

        Cells[columnIndex,i+1] := pliList.list[i].userGen;
        CellProperties[columnIndex, i+1].ReadOnly := true;
        Inc(columnIndex);

        if pliList.list[i].dateEdit = nil then
          Cells[columnIndex,i+1] := ''
        else
          Cells[columnIndex,i+1] := XSDate2String(pliList.list[i].dateEdit);
        CellProperties[columnIndex, i+1].ReadOnly := True;
        LastRow:=i+1;
        sgRQPackingListItem.RowCount:=LastRow+1;
      end;
   sgRQPackingListItem.Row:=1;

end;


procedure TfrmRQPackingListEdit.FormShow(Sender: TObject);
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
  TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
  ENGeographicDepartmentObj : ENGeographicDepartment;
begin
  DisableControls([edtCode , edtGeograph ]);
  departmentCode := LOW_INT;
  //HideControls([lblEPRenName, edtEPRenName, spbEPRen]);



  DisableControls([edtEPRenName]);

  if DialogState = dsInsert then
  begin
   HideControls([gbPackingStatementParameteres, gbPackingListItem, btnPrint, spbPrintReport, spbMassPrinting, gbRQPackingList2FKOrder]);
  end;

  if DialogState = dsView then
  begin
     DisableControls([spbPacker]);
     DisableActions([actRQPackingListItemDelete,actRQPackingListItemEdit]);
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


        // geodept
      TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
    try
     if (RQPackingListObj.geoDepartmentRef.code <> LOW_INT) then
      begin
       ENGeographicDepartmentObj := TempENGeographicDepartment.getObject( RQPackingListObj.geoDepartmentRef.code );
       if (ENGeographicDepartmentObj <> nil ) then begin
           geoDepartmentcode:= ENGeographicDepartmentObj.code;
           edtGeograph.Text := ENGeographicDepartmentObj.name;
       end;
      end;
    except
      on EConvertError do Exit;
    end;

     Self.isMolForStorage := DMReports.isMolForStorage(RQPackingListObj.molFromCode);
     packingListItemFilter := RQPackingListItemFilter.Create;
     SetNullIntProps(packingListItemFilter);
     SetNullXSProps(packingListItemFilter);
     packingListItemFilter.packingListRef := RQPackingListRef.Create;
     packingListItemFilter.packingListRef.code := RQPackingListObj.code;
     TempRQPackListItem := HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;
     packingListItemList := TempRQPackListItem.getScrollableFilteredListForEdit(packingListItemFilter,0,1);
	 
	 fillListENElement;

     DisableControls([btnGenerateItems, spbMolTo, edtDateGen],DialogState <> dsEdit);
     if DialogState = dsEdit then begin
           DisableControls([spbMolTo], RQPackingListObj.statusRef.code > RQPACKINGLIST_STATUS_RESERVED);
     end;

     if (((DialogState = dsEdit) and (packingListItemList.totalCount > 0))
          or (DialogState = dsView)) then
     begin
       DisableControls([spbMolFrom, spbDepartment, edtDateStart, edtDateFinal,
                        spbSelectAllBudgets, spbClearAllBudgets,
                        spbSelectAllGroupMaterials, spbClearAllGroupMaterials,
                        btnPrintPackingStatement, edtNumberGen, spbEPRen, spbEPRenClear, spbPacker]);

       // SUPP-60894 Не для МОЛов Центральных складах не нужно печатать
       // ведомость
       if Self.isMolForStorage then begin
          HideControls([btnPrint, spbPrintReport],false);
       end else begin
          HideControls([spbPrintReport], false);
       end;
     end;



     if ((DialogState = dsEdit) and (packingListItemList.totalCount = 0))
     then DisableControls([edtDateStart, edtDateFinal,
                        spbSelectAllBudgets, spbClearAllBudgets,
                        spbSelectAllGroupMaterials, spbClearAllGroupMaterials,
                        btnPrintPackingStatement],False);

     if ((packingListItemList.totalCount = 0) and (RQPackingListObj.statusRef.code = ENConsts.RQPACKINGLIST_STATUS_GOOD))
     then DisableControls([btnGenerateItems, btnPrint]);

     if (RQPackingListObj.statusRef.code = ENConsts.RQPACKINGLIST_STATUS_GOOD) then
     begin
      DisableControls([btnSavePaletes, btnGenerateOrders, btnRemoveOrders, btnPrint]);
      actMakeOnePalete.Visible := false;
     end;


     if (RQPackingListObj.statusRef.code = ENConsts.RQPACKINGLIST_STATUS_RESERVED) then
     begin
      DisableControls([btnGenerateItems, btnRemoveOrders]);
      DisableControls([btnSavePaletes,btnGenerateOrders],(DialogState <> dsEdit));
      actMakeOnePalete.Visible := (Self.isMolForStorage) and (DialogState = dsEdit);
     end;

     if not Self.isMolforStorage then begin
      DisableControls([btnSavePaletes]);
      {SUPP-60846 Для РЭСов кнопка будет называться просто без слова Массово}
      spbMassPrinting.Caption := 'Печать ' + Chr(10) + ' документов';
     end;

     DisableControls([btnPrint], (packingListItemList.totalCount = 0) or (RQPackingListObj.statusRef.code = ENConsts.RQPACKINGLIST_STATUS_GOOD));

     if (RQPackingListObj.statusRef.code = ENConsts.RQPACKINGLIST_STATUS_CREATED_ORDERS)  then begin
       DisableControls([btnGenerateItems, btnSavePaletes, btnGenerateOrders]);
       DisableControls([btnRemoveOrders], DialogState <> dsEdit);
       actMakeOnePalete.Visible := false;
     end;

     DisableActions([actUpdateQuantity], ((RQPackingListObj.statusRef.code <> ENConsts.RQPACKINGLIST_STATUS_RESERVED) or (DialogState = dsView)));
     HideControls([spbMassPrinting], RQPackingListObj.statusRef.code <> ENConsts.RQPACKINGLIST_STATUS_CREATED_ORDERS);


//    ----   Заполним ЛистБоксы для Бюджетодержателей  и Материалов

     budget := TStringList.Create;
     Split(budget, RQPackingListObj.budgetString, ',');

     for bi:=0 to ListBudget.Count-1 do
      begin
          for bi2:=0 to budget.Count-1 do
         begin
           if IntToStr(Integer( ListBudget.Items.Objects[bi])) = Trim(budget.Strings[bi2]) then
           begin
            ListBudget.Checked[bi] := True;
            Continue;
           end
         end;
       if packingListItemList.totalCount > 0 then
       ListBudget.ItemEnabled[bi] := False
       else
        ListBudget.ItemEnabled[bi] := True;
      end;

     materialGroup := TStringList.Create;
     Split(materialGroup, RQPackingListObj.materialString, ',');

     for mi:=0 to ListMaterialsGroups.Count-1 do
      begin
          for mi2:=0 to materialGroup.Count-1 do
         begin
           if IntToStr(Integer( ListMaterialsGroups.Items.Objects[mi])) = Trim(materialGroup.Strings[mi2]) then
           begin
            ListMaterialsGroups.Checked[mi] := True;
            Continue;
           end
         end;
       if packingListItemList.totalCount > 0 then
       ListMaterialsGroups.ItemEnabled[mi] := False
       else
       ListMaterialsGroups.ItemEnabled[mi] := True;
      end;

      DisableActions([actAddENElement, actRemoveENElement], packingListItemList.totalCount > 0);

//    ----

      edtCode.Text := IntToStr(RQPackingListObj.code);
      edtNumberGen.Text := RQPackingListObj.numberGen;
      if RQPackingListObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(RQPackingListObj.dateGen.Year,RQPackingListObj.dateGen.Month,RQPackingListObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;

    edtMolFrom.Text := RQPackingListObj.molFromCode + ' ' + RQPackingListObj.molFromName;
    molFromCode :=  RQPackingListObj.molFromCode;
    molFromName :=  RQPackingListObj.molFromName;
    edtMolTo.Text := RQPackingListObj.molToCode + ' ' + RQPackingListObj.molToName;
    molToCode := RQPackingListObj.molToCode;
    molToName := RQPackingListObj.molToName;

    packerFIO := RQPackingListObj.packerFIO;
    packerTabnumber := RQPackingListObj.packerTabNumber;
    packerPosition := RQPackingListObj.packerPosition;
    if  ((packerFIO <> '') and (packerTabnumber <> '') and (packerPosition <> ''))
    then edtPacker.Text := RQPackingListObj.packerFIO + ' таб.№' + RQPackingListObj.packerTabNumber + ' посада:' + RQPackingListObj.packerPosition;

    departmentCode := RQPackingListObj.departmentRef.code;
    if departmentCode > 0  then
    begin
      TempENDepartment:= HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
      ENDepartmentObj := TempENDepartment.getObject(departmentCode);
      edtDepartment.Text := ENDepartmentObj.shortName;
    end;

    if (RQPackingListObj.renRef <> nil) then
      epRenCode := RQPackingListObj.renRef.code;
    if epRenCode > -1 then
    begin
      TempEPRen := HTTPRIOEPRen as EPRenControllerSoapPort;
      EPRenObject := TempEPRen.getObject(epRenCode);
      edtEPRenName.Text := EPRenObject.name;
    end;

      if RQPackingListObj.dateStart <> nil then
      begin
        edtDateStart.DateTime:=EncodeDate(RQPackingListObj.dateStart.Year,RQPackingListObj.dateStart.Month,RQPackingListObj.dateStart.Day);
        edtDateStart.checked := true;
      end
      else
      begin
        edtDateStart.DateTime:=SysUtils.Date;
        edtDateStart.checked := false;
      end;
      if RQPackingListObj.dateFinal <> nil then
      begin
        edtDateFinal.DateTime:=EncodeDate(RQPackingListObj.dateFinal.Year,RQPackingListObj.dateFinal.Month,RQPackingListObj.dateFinal.Day);
        edtDateFinal.checked := true;
      end
      else
      begin
        edtDateFinal.DateTime:=SysUtils.Date;
        edtDateFinal.checked := false;
      end;

      DisableControls([cbTKAccountingType]);

      cbTKAccountingType.ItemIndex := RQPackingListObj.accountingTypeRef.code - 1;

     updatePackingItem;
     updateOrders;
  end;
end;



procedure TfrmRQPackingListEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
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

     if ((departmentCode = LOW_INT) and (geoDepartmentcode = LOW_INT)) then
     begin
      Application.MessageBox(PChar('Оберіть підрозділ або географічний підрозділ !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
      end;

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

     if (geoDepartmentcode <> LOW_INT) then
     begin
       RQPackingListObj.geoDepartmentRef := ENGeographicDepartmentRef.Create;
       RQPackingListObj.geoDepartmentRef.code :=  geoDepartmentcode;
     end else
       RQPackingListObj.geoDepartmentRef := nil;

     if (epRenCode <> -1) then
     begin
       RQPackingListObj.renRef := EPRenRef.Create;
       RQPackingListObj.renRef.code := epRenCode;
     end else
       RQPackingListObj.renRef := nil;

     if edtdateStart.checked then
     begin
       if RQPackingListObj.dateStart = nil then
          RQPackingListObj.dateStart := TXSDate.Create;
       RQPackingListObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));
     end
     else
       RQPackingListObj.dateStart := nil;

     if edtdateFinal.checked then
     begin 
       if RQPackingListObj.dateFinal = nil then
          RQPackingListObj.dateFinal := TXSDate.Create;
       RQPackingListObj.dateFinal.XSToNative(GetXSDate(edtdateFinal.DateTime));
     end
     else
       RQPackingListObj.dateFinal := nil;

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


procedure TfrmRQPackingListEdit.spbDepartmentClick(Sender: TObject);
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

procedure TfrmRQPackingListEdit.spbEPRenClearClick(Sender: TObject);
begin
  inherited;
  epRenCode := -1;
  edtEPRenName.Text := '';
  if RQPackingListObj.renRef = nil then RQPackingListObj.renRef := EPRenRef.Create();
  RQPackingListObj.renRef.code := -1;
end;


procedure TfrmRQPackingListEdit.spbEPRenClick(Sender: TObject);
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


procedure TfrmRQPackingListEdit.spbSelectAllBudgetsClick(Sender: TObject);
var
  i : Integer;
begin
  inherited;
     For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] = false then
           ListBudget.Checked[i] := true;
    End;
end;

procedure TfrmRQPackingListEdit.spbClearAllBudgetsClick(Sender: TObject);
var
  i : Integer;
begin
  inherited;
     For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] = True then
           ListBudget.Checked[i] := False;

    End;
end;

procedure TfrmRQPackingListEdit.spbSelectAllGroupMaterialsClick(
  Sender: TObject);
var
  i : Integer;
begin
  inherited;

     For i:=0 to ListMaterialsGroups.Count -1  do
    Begin
       if  ListMaterialsGroups.Checked[i] = false then
           ListMaterialsGroups.Checked[i] := true;
    End;

end;

procedure TfrmRQPackingListEdit.spbClearAllGroupMaterialsClick(
  Sender: TObject);
var
  i : Integer;
begin
  inherited;

       For i:=0 to ListMaterialsGroups.Count -1  do
    Begin
       if  ListMaterialsGroups.Checked[i] = true then
           ListMaterialsGroups.Checked[i] := false;
    End;

end;

procedure TfrmRQPackingListEdit.fillBudgets;
var
  TempTKBudget: ENDepartmentControllerSoapPort;
  bi: Integer;
  ENDepartmentList: ENDepartmentShortList;
  departmentfilter : ENDepartmentFilter;
begin
  // заполняем список бюджетодержателей

     departmentfilter := ENDepartmentFilter.Create;
     SetNullIntProps(departmentfilter);
     SetNullXSProps(departmentfilter);

     departmentfilter.conditionSQL := '  typerefcode = 200 and parentrefcode is not null ';



     TempTKBudget:= HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
     ENDepartmentList := TempTKBudget.getScrollableFilteredList(departmentfilter,0,-1);
     ListBudget.Items.Clear;

     for bi:=0 to High(ENDepartmentList.list) do
      begin

        ListBudget.Items.AddObject(ENDepartmentList.list[bi].shortName  , TObject( ENDepartmentList.list[bi].code )  );
      end;

end;

procedure TfrmRQPackingListEdit.fillMaterialsGroups;
var

  TempTKMaterials: TKMaterialsControllerSoapPort;
  TKMaterialsList: TKMaterialsShortList;
  materialsfilter : TkMaterialsFilter;
  i : Integer;
begin
    {заполняем группы материалов}

     materialsfilter := TKMaterialsFilter.Create;
     SetNullIntProps(materialsfilter);
     SetNullXSProps(materialsfilter);

     materialsfilter.conditionSQL := 'tk1.parentrefcode is null and tk1.measurementcode is not null';
     materialsfilter.orderBySQL := 'TK1.NAME';


     TempTKMaterials:= HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
     TKMaterialsList := TempTKMaterials.getScrollableFilteredList(materialsfilter,0,-1);
     ListMaterialsGroups.Items.Clear;

    for i:=0 to High(TKMaterialsList.list) do
      begin
        ListMaterialsGroups.Items.AddObject(TKMaterialsList.list[i].name , TObject( TKMaterialsList.list[i].code )  );
      end;
end;

procedure TfrmRQPackingListEdit.spbMolFromClick(Sender: TObject);
var
  frmFINMolShow : TfrmFINMolShow;
  isCounters : Boolean;

  f : SCMolFilter;
  frmSCMolShow : TfrmSCMolShow;
  selectedSCMol : SCMolShort;
  selectedFinMol : FINMolShort;
begin
  inherited;

      isCounters := False;

      if DialogState = dsInsert then begin
        isCounters := (cbTKAccountingType.ItemIndex + 1 = TK_ACCOUNTINGTYPE_COUNTER);
      end else begin
        isCounters := (RQPackingListObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_COUNTER);
      end;

      if isCounters then begin
        selectedSCMol := TfrmSCMolShow.chooseFromList;
        if Assigned(selectedSCMol) then begin
            molFromCode := selectedSCMol.kod_mol;
            molFromName := selectedSCMol.name_mol;
            edtMolFrom.Text := molFromCode + ' ' + molFromName;
        end;
      end else begin
        selectedFinMol := TfrmFINMolShow.chooseFromList();
        if Assigned(selectedFinMol) then begin
            molFromCode := selectedFinMol.id;
            molFromName := selectedFinMol.text;
            edtMolFrom.Text := molFromCode + ' ' + molFromName;
        end;
      end;

end;

procedure TfrmRQPackingListEdit.spbMolToClick(Sender: TObject);
var
  frmFINMolShow : TfrmFINMolShow;
  TempENDepartment: ENDepartmentControllerSoapPort;
  ENDepartmentList: ENDepartmentShortList;
  depFilter : ENDepartmentFilter;
  isCounters : Boolean;
  frmSCMolShow : TfrmSCMolShow;
  selectedSCMol : SCMolShort;
  selectedFinMol : FINMolShort;

  TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
  ENGeoDepartmentList: ENGeographicDepartmentShortList;
  geodepFilter : ENGeographicDepartmentFilter;
begin
  inherited;

      isCounters := False;

      if DialogState = dsInsert then begin
        isCounters := (cbTKAccountingType.ItemIndex + 1 = TK_ACCOUNTINGTYPE_COUNTER);
      end else begin
        isCounters := (RQPackingListObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_COUNTER);
      end;

      if isCounters then begin
        selectedSCMol := TfrmSCMolShow.chooseFromList();
        if Assigned(selectedSCMol) then begin
          molToCode := selectedSCMol.kod_mol;
				  molToName := selectedSCMol.name_mol;
				  edtMolTo.Text := molToCode + ' ' + molToName;
        end;
      end else begin
        selectedFinMol := TfrmFINMolShow.chooseFromList();
        if Assigned(selectedFinMol) then begin
            molToCode := selectedFinMol.id;
            molToName := selectedFinMol.text;
            edtMolTo.Text := molToCode + ' ' + molToName;
        end;
      end;
	  
	  {SUPP-102083}
	 { if (Assigned(RQPackingListObj)) and (Assigned(RQPackingListObj.statusRef))
		and (RQPackingListObj.statusRef.code <> RQPACKINGLIST_STATUS_GOOD) then Exit;

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
      end; }

      // автоматически определить географическое подразделение при наличии связки
       if ((Assigned(RQPackingListObj)) and (Assigned(RQPackingListObj.statusRef))
		and (RQPackingListObj.statusRef.code <> RQPACKINGLIST_STATUS_GOOD) ) then Exit
      else
      begin
        geodepFilter := ENGeographicDepartmentFilter.Create;
        SetNullIntProps(geodepFilter);
        SetNullXSProps(geodepFilter);
        geodepFilter.conditionSQL := '  code in (select m2gd.geodepartmentcode from enmol a, enmol2geodepartment m2gd  where  a.statusrefcode = 1 ' +
                                              '  and m2gd.molcode = a.code   ' +
                                              '  and a.fincode = ' + '''' + molToCode + '''' +
                                              '  ) ';
        TempENGeographicDepartment:= HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
        ENGeoDepartmentList := TempENGeographicDepartment.getScrollableFilteredList(geodepFilter,0,1);

        if ENGeoDepartmentList.totalCount > 0 then
        begin
          edtGeograph.Text := ENGeoDepartmentList.list[0].name;
          geoDepartmentcode := ENGeoDepartmentList.list[0].code;
        end;
      end;

end;

procedure TfrmRQPackingListEdit.spbPackerClick(Sender: TObject);
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

procedure TfrmRQPackingListEdit.FormCreate(Sender: TObject);
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

  fillBudgets;
  fillMaterialsGroups;
end;

procedure TfrmRQPackingListEdit.btnPrintPackingStatementClick(
  Sender: TObject);
  var
   TempRQPackingList : RQPackingListControllerSoapPort;
   TempRQPackingListItem : RQPackingListItemControllerSoapPort;
   strGroupmaterials , strBudget, depCodes, strElementCodes : String;
   groupOrMaterial, i : Integer;
begin
  inherited;

  if not NoBlankValues([
      edtDateStart
      ,edtDateFinal
     ])  then
  begin
           Application.MessageBox(PChar('Необхідно обрати дати для формування відомості !')
            ,PChar('Увага !'),MB_ICONWARNING+MB_OK);
          Exit;
  end;

  if edtDateStart.checked then
     begin
       if RQPackingListObj.dateStart = nil then
          RQPackingListObj.dateStart := TXSDate.Create;
       RQPackingListObj.dateStart.XSToNative(GetXSDate(edtDateStart.DateTime));
     end
     else
       RQPackingListObj.dateStart := nil;

    if edtDateFinal.checked then
     begin
       if RQPackingListObj.dateFinal = nil then
          RQPackingListObj.dateFinal := TXSDate.Create;
       RQPackingListObj.dateFinal.XSToNative(GetXSDate(edtDateFinal.DateTime));
     end
     else
       RQPackingListObj.dateFinal := nil;


   For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] then
        if strBudget <>  '' then
           strBudget := strBudget + ' , ' + IntToStr(  Integer( ListBudget.Items.Objects[i] ) )
         else
           strBudget := strBudget + IntToStr(  Integer( ListBudget.Items.Objects[i] ) ) ;
    End;

    if trim(strBudget) <> ''  then
    RQPackingListObj.budgetString := strBudget
    else
    begin
           Application.MessageBox(PChar('Необхідно обрати Бюджетотримачей для формування відомості !')
            ,PChar('Увага !'),MB_ICONWARNING+MB_OK);
          Exit;
    end;


     For i:=0 to ListMaterialsGroups.Count -1  do
    Begin
       if  ListMaterialsGroups.Checked[i] then
        if strGroupmaterials <>  '' then
           strGroupmaterials := strGroupmaterials + ' , ' + IntToStr(  Integer( ListMaterialsGroups.Items.Objects[i] ) )
         else
           strGroupmaterials := strGroupmaterials + IntToStr(  Integer( ListMaterialsGroups.Items.Objects[i] ) ) ;

    End;

     if (( trim(strGroupmaterials) = '' ) and  ( materialCode = -1 )) then
     begin
           Application.MessageBox(PChar('Необхідно обрати групи матеріалів або матеріал !')
            ,PChar('Увага !'),MB_ICONWARNING+MB_OK);
          Exit;
     end;

    if materialCode <> -1 then
        begin
        strGroupmaterials :=  IntToStr(materialCode);
        groupOrMaterial := 0;
        end;

    if (( trim(strGroupmaterials) <> '' ) and  ( materialCode = -1 )) then
        begin
         strGroupmaterials := strGroupmaterials;
         groupOrMaterial := 1;
        end;
		
   For i:=0 to ListENElement.Count -1  do
    Begin
        if strElementCodes <>  '' then
           strElementCodes := strElementCodes + ' , ' + IntToStr(  Integer( ListENElement.Items.Objects[i] ) )
         else
           strElementCodes := strElementCodes + IntToStr(  Integer( ListENElement.Items.Objects[i] ) ) ;
    End;

    RQPackingListObj.materialString :=  strGroupmaterials;
	  RQPackingListObj.elementString :=  strElementCodes;

    TempRQPackingListItem:= HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;
    TempRQPackingListItem.addStringAutomatic(RQPackingListObj, groupOrMaterial);
    TempRQPackingList:= HTTPRIORQPackingList as RQPackingListControllerSoapPort;
    RQPackingListObj :=  TempRQPackingList.getObject(RQPackingListObj.code);
    Application.MessageBox(PChar('Строки созданы!'),
                    PChar('Внимание !'),MB_OK);
    Self.FormShow(Sender);


end;

procedure TfrmRQPackingListEdit.actMakeOnePaleteExecute(Sender: TObject);
var
paleteNumber : String;
i : Integer;
begin
  inherited;
  if Application.MessageBox(PChar('Вы действительно хотите проставить все количество для одной палеты?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then begin
    paleteNumber := InputBox('EnergyNet', 'Введіть номер палети', '1');
    for i:= 1 to sgRQPackingListItem.RowCount-1 do begin
      sgRQPackingListItem.Cells[6,i] := paleteNumber;
      sgRQPackingListItem.Cells[7,i] := sgRQPackingListItem.Cells[5,i];
      sgRQPackingListItem.Cells[8,i] := '';
      sgRQPackingListItem.Cells[9,i] := '';
      sgRQPackingListItem.Cells[10,i] := '';
      sgRQPackingListItem.Cells[11,i] := '';
      sgRQPackingListItem.Cells[12,i] := '';
      sgRQPackingListItem.Cells[13,i] := '';
    end;
    Application.MessageBox(PChar('Номер палеты и количества проставлены!'),
                    PChar('Внимание !'),MB_OK);
  end;
end;

procedure TfrmRQPackingListEdit.actRemoveENElementExecute(Sender: TObject);
begin
  inherited;
  if ListENElement.ItemIndex >= 0 then begin
    ListENElement.Items.Delete(ListENElement.ItemIndex);
  end;
end;

procedure TfrmRQPackingListEdit.actRQPackingListItemDeleteExecute(
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
 RQPackingListObj := TempRQPackingList.getObject(RQPackingListObj.code);
 Self.FormShow(Sender);
end;

procedure TfrmRQPackingListEdit.actRQPackingListItemEditExecute(
  Sender: TObject);
begin
	Self.openRQPackingListItem(dsEdit);
end;

procedure TfrmRQPackingListEdit.actRQPackingListItemUpdateExecute(
  Sender: TObject);
begin
  inherited;
   updatePackingItem;
end;

procedure TfrmRQPackingListEdit.actRQPackingListItemViewExecute(
  Sender: TObject);
begin
  inherited;
  Self.openRQPackingListItem(dsView);
end;

procedure TfrmRQPackingListEdit.sgRQPackingListItemCellValidate(
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

procedure TfrmRQPackingListEdit.sgRQPackingListItemSelectCell(
  Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
// if ((ACol = 4) or (ACol = 1)) then
// begin
// sgRQPackingListItem.Options :=  sgRQPackingListItem.Options + [goEditing];
// sgRQPackingListItem.CellProperties[Acol, ARow+1].ReadOnly := False;
// end
// else
// begin
//  sgRQPackingListItem.Options :=  sgRQPackingListItem.Options - [goEditing];
// sgRQPackingListItem.CellProperties[Acol, ARow+1].ReadOnly := True;
// end;


end;

procedure TfrmRQPackingListEdit.btnSavePaletesClick(Sender: TObject);
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

procedure TfrmRQPackingListEdit.btn1Click(Sender: TObject);
begin
  edtDepartment.Text := '';
  departmentCode := LOW_INT;

end;

procedure TfrmRQPackingListEdit.btnGenerateItemsClick(Sender: TObject);
  Var TempRQPackingListItem: RQPackingListItemControllerSoapPort;
      TempRQPackingList: RQPackingListControllerSoapPort;
begin
  inherited;
  if Application.MessageBox(PChar('Вы действительно хотите зарезервировать материалы по ведомости?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempRQPackingListItem := HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;
    TempRQPackingListItem.findRemainsAndReservAutomaticForRQPackingList(RQPackingListObj.code);
    TempRQPackingList:= HTTPRIORQPackingList as RQPackingListControllerSoapPort;
    RQPackingListObj :=  TempRQPackingList.getObject(RQPackingListObj.code);
    Self.FormShow(Sender);
    Application.MessageBox(PChar('Материалы зарезервированы!'),
                      PChar('Внимание !'),MB_OK);
  end;


end;

procedure TfrmRQPackingListEdit.btnGenerateOrdersClick(Sender: TObject);
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

procedure TfrmRQPackingListEdit.btnGeographClearClick(Sender: TObject);
begin
  geoDepartmentcode := LOW_INT;
  edtGeograph.Text := '';

end;

procedure TfrmRQPackingListEdit.btnGeographClick(Sender: TObject);
var
   frmENGeographicDepartmentShow: TfrmENGeographicDepartmentShow;
   Filter : ENGeographicDepartmentFilter;
   selected : ENGeographicDepartmentShort;
begin
  Filter := ENGeographicDepartmentFilter.Create;
  SetNullIntProps(Filter);
  SetNullXSProps(Filter);

  if ( departmentCode <> LOW_INT )   then //rencode
   Filter.conditionSQL :=  ' ENGEOGRAPHICDEPARTMENT.CODE in  ' +
                           ' (select ee.geodepartmentrefcode from engeodep2endepartment ee ' +
                           ' where ee.departmentrefcode  in ( '+ IntToStr(departmentCode) +')'  +
                           ' ) ';

  frmENGeographicDepartmentShow := TfrmENGeographicDepartmentShow.Create(Application, fmNormal, Filter);
  try
      with frmENGeographicDepartmentShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENGeographicDepartmentShort(sgENGeographicDepartment.Objects[0, sgENGeographicDepartment.Row]);
                except
                   on EConvertError do begin  Exit; end;
                end;
                 geoDepartmentcode := selected.code;
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

procedure TfrmRQPackingListEdit.btnRemoveOrdersClick(Sender: TObject);
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

procedure TfrmRQPackingListEdit.btnPrintClick(Sender: TObject);
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

procedure TfrmRQPackingListEdit.spbPrintReportClick(Sender: TObject);
var
 argNames, args : ArrayOfString;
  reportName : String;
  i : integer;
  strGroupmaterials , strBudget, depCodes : String;
  TempENDepartment : ENDepartmentControllerSoapPort;

begin

    reportName := 'warehouseMaterialsMovement/packingSlipBroadened';  // broadened-версия отчета отлчиается только доп. аналитикой (выводится пидроздил, наименование и инв. номер объекта плана)

  {Установка длины массивов параметров отчетов}
  SetLength(argNames, 1);
  SetLength(args, 1);
  {Установка дат планов}
  argNames[0] := 'packingListCode';

  args[0] := IntToStr(RQPackingListObj.code);


    {Формирование отчета}
    makeReport(reportName, argNames, args, 'xls');

end;

procedure TfrmRQPackingListEdit.sgRQPackingList2FKOrderDblClick(
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

procedure TfrmRQPackingListEdit.spbMassPrintingClick(Sender: TObject);
var
  TempRQPackingList2FKOrder : RQPackingList2FKOrderControllerSoapPort;
  TempRQPackingList : RQPackingListControllerSoapPort;
  TempRQFKOrder : RQFKOrderControllerSoapPort;

  packingList2FKOrderFilter : RQPackingList2FKOrderFilter;
  fkOrderFilter : RQFKOrderFilter;
  packingList : RQPackingListFilter;

  packingList2FKOrderList : RQPackingList2FKOrderShortList;
  fkOrderList : RQFKOrderShortList;
  fkOrder: RQFKOrder;

  i : Integer;
  reportName, reportXlsOrPdf : String;
  argNames, args: ArrayOfString;
  palletNumbers : ArrayOfString;

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
    end;

    if Self.isMolForStorage then begin
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
             reportName := 'warehouseMaterialsMovement/packingList';
             makeReport(reportName, argNames, args, 'xls');
        end;
    end;
end;

procedure TfrmRQPackingListEdit.actSelectAllExecute(Sender: TObject);
begin
    checkGrid(sgRQPackingListItem, 1, true);
end;

procedure TfrmRQPackingListEdit.actEraseAllExecute(Sender: TObject);
begin
    checkGrid(sgRQPackingListItem, 1, false);
end;


procedure TfrmRQPackingListEdit.actUpdateQuantityExecute(Sender: TObject);
var
  objCode : Integer;
  newQty : TXSDecimal;
  oldQty : String;
  oldQtySingle, newQtySingle : Single;
  TempRQPackingListItem : RQPackingListItemControllerSoapPort;

begin
  inherited;
  try
    objCode := StrToInt(sgRQPackingListItem.Cells[0,sgRQPackingListItem.Row]);
    if Self.isMolForStorage then begin
      oldQty := sgRQPackingListItem.Cells[5, sgRQPackingListItem.Row];
    end else begin
      oldQty := sgRQPackingListItem.Cells[4, sgRQPackingListItem.Row];
    end;
  except on EConvertError do Exit;
  end;

  oldQtySingle := StrToFloat(oldQty);
  newQty := TXSDecimal.Create;
  if not InputQuery('EnergyNet', 'Введіть нову кількість', oldQty) then begin
    Exit;
  end;

  newQty.DecimalString := oldQty;

  try
    newQtySingle := StrToFloat(newQty.DecimalString);
  except on EConvertError do
    begin
      Application.MessageBox(PChar('Неправильний формат числа: ' + newQty.DecimalString),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      Exit;
    end;
  end;

  if newQtySingle <= 0 then
  begin
    Application.MessageBox(PChar('Нова кількість повинна бути більше ніж 0'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
    Exit;
  end;

  if oldQtySingle - newQtySingle = 0 then Exit
  else
  begin
      TempRQPackingListItem := HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;
      TempRQPackingListItem.updateFactQuantity(ObjCode, newQty);
      Self.FormShow(Sender);
  end;

end;


end.
