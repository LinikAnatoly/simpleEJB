unit EditENEstimateItem;

interface

uses
  Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
  Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
  DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, ENEstimateItemController,
  ExtCtrls, TB2Item, TB2Dock, TB2Toolbar, AdvObj, RQFKOrderController,
  RQFKOrderKindController, RQFKOrderItemController, EditRQFKOrder,
  RQBillController, EditRQBill;

type
  TfrmENEstimateItemEdit = class(TDialogForm)

  HTTPRIOENEstimateItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    HTTPRIOSpr_matherial: THTTPRIO;
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    pcEstimateItms: TPageControl;
    tsMatherials: TTabSheet;
    lblCountGen: TLabel;
    lblCountFact: TLabel;
    lblCommentGen: TLabel;
    Label1: TLabel;
    lblEnPlan: TLabel;
    spbPlan: TSpeedButton;
    lblPlanItem: TLabel;
    spbPlanItem: TSpeedButton;
    spbMaterialName: TSpeedButton;
    lblMeasurement: TLabel;
    edtCountGen: TEdit;
    edtCountFact: TEdit;
    edtCommentGen: TEdit;
    edtMaterialName: TEdit;
    edtPlanItem: TEdit;
    edtPlan: TEdit;
    tsWorkers: TTabSheet;
    tsFINMaterials: TTabSheet;
    sgFINMaterials: TAdvStringGrid;
    HTTPRIOFINMaterials: THTTPRIO;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    tbActions: TTBToolbar;
    btnView: TTBItem;
    btnAdd: TTBItem;
    TBItem47: TTBItem;
    TBItem7: TTBItem;
    TBItem46: TTBItem;
    lblENEstimateItemKind: TLabel;
    cbENEstimateItemKind: TComboBox;
    edtCode: TEdit;
    edtDeliveryTime: TEdit;
    lblDeliveryTime: TLabel;
    lblDeliveryTimeBySPR: TLabel;
    cbEstimateItemStatus: TComboBox;
    lblEstimateItemStatus: TLabel;
    tsMarkers: TTabSheet;
    sgMarks: TAdvStringGrid;
    HTTPRIOMarkEstimate: THTTPRIO;
    MarksAction: TActionList;
    actMarkView: TAction;
    actMarkAdd: TAction;
    Action3: TAction;
    actMarkDelete: TAction;
    actMarkRefresh: TAction;
    tbMarkAction: TTBToolbar;
    btnMarkView: TTBItem;
    btnMarkAdd: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    btnMarkRefresh: TTBItem;
    tsRQOrder: TTabSheet;
    tsRQBill: TTabSheet;
    tsRQFKOrder: TTabSheet;
    grpRQOrder: TGroupBox;
    sgRQOrder: TAdvStringGrid;
    spl1: TSplitter;
    grpRQOrderItem: TGroupBox;
    sgRQOrderItem: TAdvStringGrid;
    HTTPRIORQOrder: THTTPRIO;
    HTTPRIORQOrderItem: THTTPRIO;
    actRQOrderView: TAction;
    actRQOrderItemView: TAction;
    edtUseWorkTime: TEdit;
    lblUseWorkTime: TLabel;
    lblUseWorkTime2: TLabel;
    lblTKAccountingTypeName: TLabel;
    cbTKAccountingType: TComboBox;
    lblNomenclature: TLabel;
    edtNomeclature: TEdit;
    edtNomenclatureCode: TEdit;
    spbOSSelect: TSpeedButton;
    spbNomenclatureClear: TSpeedButton;
    edtCost: TEdit;
    lblCost: TLabel;
    chbIsCreateObject: TCheckBox;
    chbIsMainForRefinement: TCheckBox;
    HTTPRIOENMarkEstimate: THTTPRIO;
    lblLinkWriteOffMaterial: TLabel;
    edtLinkWriteOffMaterial: TEdit;
    btnLinkWriteOffMaterial: TSpeedButton;
    btnClearLinkWriteOffMaterial: TSpeedButton;
    lblPrice: TLabel;
    edtPrice: TEdit;
    lblDeliveryTimeServices: TLabel;
    HTTPRIORQOrderItem2ENEstimateItem: THTTPRIO;
    lblOrder: TLabel;
    edtAccount: TEdit;
    lblAccount: TLabel;
    cbIsUseVAT: TCheckBox;
    tsPlanPay: TTabSheet;
    actViewPlanPay: TAction;
    actInsertPlanPay: TAction;
    actEditPlanPay: TAction;
    actDeletePlanPay: TAction;
    actUpdatePlanPay: TAction;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem8: TTBItem;
    sgENEstimateItemPlanPay: TAdvStringGrid;
    HTTPRIOENEstimateItemPlanPay: THTTPRIO;
    pnlRQFKOrderItem: TPanel;
    gbRQFKOrderItem: TGroupBox;
    sgRQFKOrderItem: TAdvStringGrid;
    sgRQFKOrder: TAdvStringGrid;
    Splitter2: TSplitter;
    HTTPRIORQFKOrder: THTTPRIO;
    HTTPRIORQFKOrderItem: THTTPRIO;
    TBToolbar2: TTBToolbar;
    TBItem9: TTBItem;
    TBItem13: TTBItem;
    TBControlItem1: TTBControlItem;
    Splitter1: TSplitter;
    TBControlItem2: TTBControlItem;
    chkPrihod: TCheckBox;
    TBToolbar3: TTBToolbar;
    TBItem10: TTBItem;
    TBItem11: TTBItem;
    sgRQBill: TAdvStringGrid;
    HTTPRIORQBill: THTTPRIO;
    HTTPRIOTmaterial: THTTPRIO;
    lblDivCodeName: TLabel;
    edtDivCodeName: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    spbDivSelect: TSpeedButton;
    spbDivClear: TSpeedButton;
    tsOwnProduction: TTabSheet;
    sgOwnProduction: TAdvStringGrid;
    TBToolbar4: TTBToolbar;
    TBItem12: TTBItem;
    TBItem14: TTBItem;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbMaterialNameClick(Sender: TObject);
    procedure spbPlanItemClick(Sender: TObject);
    procedure rgPlansClick(Sender: TObject);
    procedure pcEstimateItmsChange(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure btnMarkAddClick(Sender: TObject);
    procedure btnMarkRefreshClick(Sender: TObject);
    procedure actRQOrderViewExecute(Sender: TObject);
    procedure actRQOrderItemViewExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actMarkDeleteExecute(Sender: TObject);
    procedure spbOSSelectClick(Sender: TObject);
    procedure spbNomenclatureClearClick(Sender: TObject);
    procedure chbIsCreateObjectClick(Sender: TObject);
    procedure btnLinkWriteOffMaterialClick(Sender: TObject);
    procedure btnClearLinkWriteOffMaterialClick(Sender: TObject);
    procedure actInsertPlanPayExecute(Sender: TObject);
    procedure actUpdatePlanPayExecute(Sender: TObject);
    procedure actViewPlanPayExecute(Sender: TObject);
    procedure actDeletePlanPayExecute(Sender: TObject);
    procedure actEditPlanPayExecute(Sender: TObject);
    procedure chkPrihodClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure sgRQFKOrderClick(Sender: TObject);
    procedure spbDivSelectClick(Sender: TObject);
    procedure spbDivClearClick(Sender: TObject);

  
  private
    { Private declarations }
    finMaterialParentCode: Integer;
    divCode4Order, divName4Order : string;
    nn: String;
    procedure UpdatePlanPayList;
    procedure UpdateOwnProductionList;
  public
    { Public declarations }
    ENPlanWorkCode: Integer;
    ENPlanWorkItemCode: Integer;
    ENPlanWorkItemName: String;
    /// 01.08.10
    isForOrder, isSiz, checkCost, inServices , isWriteOff_OZ: Boolean;
    ///
    isForClosedPlan : Boolean;

    DismountFromEstimate : Integer;
    transformatorsForRaw : Boolean;

    procedure UpdateGrid(Sender: TObject);
    procedure UpdateItemGrid();
  end;

var
  frmENEstimateItemEdit: TfrmENEstimateItemEdit;
  ENEstimateItemObj: ENEstimateItem;

  FINMaterialsHeaders: array [1..14] of String =
        ( 'Код'
          ,'Номенклатурний №'
          ,'Назва'
          ,'Одиниці віиміру'
          ,'ФИО МОЛа'
          ,'название поставщика'
          ,'Дата поставки'
          ,'описание поставки'
          ,'...'
          ,'...'
          ,'Ціна розрахункова'
          ,'Кількість матеріалу'
          ,'Ціна матеріалу'
          ,'Вартість матеріалу'
        );

  MarksHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );

  RQOrderHeaders: array [1..13] of String =
        ( 'Код'
          ,'№ заявки'
          ,'№ проекта'
          ,'Період'//'Період (місяць)'
          ,'Дата складання'
          ,'Підрозділ'
          ,'Вид заявки'
          ,'Тип заявки'
          ,'Вид ресурса'
          ,'Бюджетотримач'
          ,'Сума (з ПДВ)'
          ,'Статус'
          ,'користувач'
        );

  RQOrderItemHeaders: array [1..15] of String =
        ( 'Код'
          , '№'
          , 'Код ДДС' 
          , 'Матеріал(Довідник)'
          , 'Од. виміру(Довідник)'
          //,'Назва матеріалу (Текст)'
          //,'Од. виміру (Текст)'

          ,'Кількість'
          ,'Ціна (з ПДВ)'
          ,'Сума (з ПДВ)'
          
          ,'Строк поставки'
          , 'Запл.дата сплати'
          , 'Запл.дата постачання'

          //,'ціна без ПДВ'
          //,'ПДВ'
          //,'Сума'
          //,'Сума ПДВ'

          ,'Кількість первинна'
          ,'Постачальник'
          ,'№ та дата договору'
          ,'Примітка'
          //,'Користувач'
        );

  ENEstimateItemPlanPayHeaders: array [1..4] of String =
        ( 'Код'
          ,'Вид сплати'
          ,'Відсоток сплати'
          ,'Дата сплати'
        );

  RQFKOrderHeaders: array [1..19] of String =
        ( 'Код'
          ,'Вид ордеру'
          ,'Номер'
          ,'Дата документу'
          ,'Код відправника'
          ,'ПІБ відправника'
          ,'Код одержувача'
          ,'ПІБ одержувача'
          ,'Статус'
          ,'Код експедитора'
          ,'ПІБ експедитора'
          ,'№ доручення'
          ,'Дата доручення'
          ,'ПІБ в дорученні'
          ,'Загальна вага, кг'
          ,'Створив'
          ,'Дата ств.'
          ,'Змінив'
          ,'Дата зміни'
        );

  RQFKOrderItemHeaders: array [1..12] of String =
        ( 'Код'
          ,'Норм. матеріал'
          ,'Норм. од.виміру'
          ,'Ном. номер матеріалу'
          ,'Назва матеріалу'
          ,'Од.виміру'
          ,'кількість'
          ,'ціна'
          ,'Сума'
          ,'Вага, кг'
          ,'Дж.фін.'
          ,''
        );

  RQBillHeaders: array [1..10] of String =
        ( 'Код'
          ,'Номер'
          ,'Номер проекта'
          ,'Дата рахунку'
          ,'Сума (з ПДВ)'
          ,'постачальник'
          ,'№ договору/дата'
          ,'статус рахунку'
          ,'стан рахунку'
          ,'користувач який вніс зміни'
        );

  OwnProductionHeaders: array [1..10] of String =
        ( 'Код'
          ,'Рік плану'
          ,'Місяць плану'
          ,'Дата початку робіт'
          ,'Вид плану'
          ,'Статус'
          ,'Початк. місяць та рік плану (до перенесення)'
          ,'Номер наряда'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
        );

implementation

uses
  ShowENEstimateItem
  , TKMaterialsController
  , ShowTKMaterials
  , ENPlanWorkController
  , ENPlanWorkItemController
  , ShowENPlanWorkItem
  , ENEstimateItemTypeController
  , ENConsts
  , DMReportsUnit
  , FINMaterialsController
  //, ShowFINMaterialsData
  //, EditFINMaterialsData
  //, ENActController
  , ENEstimateItemKindController
  , ENEstimateItemStatusController
  , ENMarkEstimateController
  , RQOrderItemController
  , RQOrderController
  , EditRQOrder
  , EditRQOrderItem
  , TKAccountingTypeController
  , ShowTMaterial
  , TmaterialController
  , FINMaterialsStatusController
  , ENMarkController
  //, EditENPlanWriteOffProtection
  , ShowFINMaterials
  , EditENMarkEstimate
  , RQOrderItem2ENEstimateItemController
  , ShowFKAccount
  , FKAccountController
  , EditENEstimateItemPlanPay, ENEstimateItemPlanPayController,
  ShowTEMPNomenclatures, ShowFINMol, EditENPlanWork
  , FINMolController;


{uses  
    EnergyproController, EnergyproController2, ENEstimateItemController  ;
}
{$R *.dfm}

procedure TfrmENEstimateItemEdit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
    Spr_matherialObj: TKMaterials;
    Spr_matherialFilterObj: TKMaterialsFilter;
    Spr_matherialList : TKMaterialsShortList;

    TempENPlanWork: ENPlanWorkControllerSoapPort;
    //ENPlanWorkObj: ENPlanWork;
    ENPlanWorkFilterObj: ENPlanWorkFilter;
    ENPlanWorkList: ENPlanWorkShortList;

    TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    //ENPlanWorkItemObj: ENPlanWorkItem;
    ENPlanWorkItemFilterObj: ENPlanWorkItemFilter;
    ENPlanWorkItemList: ENPlanWorkItemShortList;
    //actObj : ENAct;

  TempFINMaterials: FINMaterialsControllerSoapPort;
  FINMaterialsList: FINMaterialsShortList;
  finMaterialFilter : FINMaterialsFilter;
  FINMaterialsObj, FINMaterialsParentObj : FINMaterials;

  meFilter : ENMarkEstimateFilter;
  meList : ENMarkEstimateShortList;
  TempENMarkEstimate: ENMarkEstimateControllerSoapPort;

  Tempesti: ENEstimateItemControllerSoapPort;
  estiList: ENEstimateItemShortList;
  estiFilter : ENEstimateItemFilter;
  //estiObj : ENEstimateItem;

  plan: ENPlanWork;

  TempRQOrderItem2ENEstimateItem: RQOrderItem2ENEstimateItemControllerSoapPort;
  ieFilter: RQOrderItem2ENEstimateItemFilter;
  ieList: RQOrderItem2ENEstimateItemShortList;

  TempRQOrder: RQOrderControllerSoapPort;
  orderFilter: RQOrderFilter;
  orderList: RQOrderShortList;

  ownProductionFilterObj: ENPlanWorkFilter;
  ownProductionArr: ENPlanWorkController.ArrayOfInteger;
begin
  SetGridHeaders(ENEstimateItemPlanPayHeaders, sgENEstimateItemPlanPay.ColumnHeaders);
  SetGridHeaders(RQFKOrderHeaders, sgRQFKOrder.ColumnHeaders);
  SetGridHeaders(RQFKOrderItemHeaders, sgRQFKOrderItem.ColumnHeaders);
  SetGridHeaders(RQBillHeaders, sgRQBill.ColumnHeaders);
  SetGridHeaders(OwnProductionHeaders, sgOwnProduction.ColumnHeaders);

  tsWorkers.TabVisible := false;
  tsFINMaterials.TabVisible := false;
  tsPlanPay.TabVisible := false;
  tsOwnProduction.TabVisible := false;

  // DEBUG!!!
  // tsBill.TabVisible := false;
  // tsRQFKOrder.TabVisible := false;

  SetFloatStyle([edtCost, edtPrice]);
  DenyBlankValues([edtCost, edtPrice]);
  HideControls([lblCost, edtCost, chbIsCreateObject, chbIsMainForRefinement, lblPrice, edtPrice, lblDeliveryTimeServices, lblOrder, lblAccount, edtAccount]);
  DisableControls([edtLinkWriteOffMaterial]);

  lblOrder.Font.Color := clRed;

  // демонтаж + номенклатуры :(
  if ((DialogState = dsView) or (DialogState = dsEdit)) then
  begin
    SetFloatStyle([edtAccount, edtPrice]);
    if (DialogState = dsView) then
      DisableControls([spbOSSelect, spbNomenclatureClear]);

    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
    plan := DMReports.getPlanByEstimateCode(ENEstimateItemObj.code);

    // Вкладку "Графік планових платежів" отображаем только на месячных планах и только для типа "Материалы"
    if (plan.kind.code = ENPLANWORKKIND_CURRENT) and (ENEstimateItemObj.kindRef.code in [ENESTIMATEITEMKIND_MATERIALS, ENESTIMATEITEMKIND_SERVICES]) then
      tsPlanPay.TabVisible := true;

    // NET-4415 Вкладку "Плани на виготовлення" отображаем только для месячных и годовых планов и только для материалов со статусом "Власне виробництво"
    if ((plan.kind.code = ENPLANWORKKIND_CURRENT) or (plan.kind.code = ENPLANWORKKIND_YEAR)) and
       (ENEstimateItemObj.statusRef.code = ENESTIMATEITEMSTATUS_OWN_PRODUCTION) then
      tsOwnProduction.TabVisible := true
    else if ((plan.kind.code = ENPLANWORKKIND_CURRENT) or (plan.kind.code = ENPLANWORKKIND_YEAR)) then
    begin
      // 04.09.2015 Когда материал, бывший в статусе "Власне виробництво" уже изготовлен и оприходован, его статус изменяется на "У наявності",
      // и мы перестаем показывать вкладку, хотя должны!!!

      // Ищем связанный план на изготовление
      ownProductionFilterObj := ENPlanWorkFilter.Create;
      SetNullIntProps(ownProductionFilterObj);
      SetNullXSProps(ownProductionFilterObj);

      ownProductionFilterObj.conditionSQL :=
          ' ENPLANWORK.CODE in ' +
          '   (select ep.planrefcode ' +
          '      from enestimateitem2plan ep ' +
          '     where ep.estimateitemrefcode = ' + IntToStr(ENEstimateItemObj.code) +
          '       and ep.typerefcode = ' + IntToStr(ENESTIMATEITEM2PLANTYPE_OWN_PRODUCTION) + ')';

      ownProductionArr := TempENPlanWork.getFilteredCodeArray(ownProductionFilterObj);

      tsOwnProduction.TabVisible := High(ownProductionArr) >= 0;
    end;



      if (
          (ENEstimateItemObj.kindRef.code in [ ENESTIMATEITEMKIND_DISMOUNT, ENESTIMATEITEMKIND_REFINEMENT,
                                               ENESTIMATEITEMKIND_PRODUCED, ENESTIMATEITEMKIND_CUSTOMER_MATERIALS ])
          //and ((DialogState = dsView) or (DialogState = dsEdit))
          and (ENEstimateItemObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_TMC)
          ) then
      begin

          finMaterialFilter := FINMaterialsFilter.Create;
          SetNullIntProps(finMaterialFilter);
          SetNullXSProps(finMaterialFilter);

          finMaterialFilter.statusRef := FINMaterialsStatusRef.Create;
          finMaterialFilter.statusRef.code := FINMATERIALSSTATUS_GOOD;

          finMaterialFilter.estimateItemRef := ENEstimateItemRef.Create;
          finMaterialFilter.estimateItemRef.code := ENEstimateItemObj.code;

          TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

          FINMaterialsList := TempFINMaterials.getScrollableFilteredList(finMaterialFilter,0,-1);
          if High(FINMaterialsList.list) > -1 then
          begin
            FINMaterialsObj := TempFINMaterials.getObject(FINMaterialsList.list[0].code);
            edtNomeclature.Text :=  FINMaterialsObj.mat_name + ' ' + FINMaterialsObj.nn;
            edtAccount.Text := FINMaterialsObj.bal_sch;
            edtNomenclatureCode.Text := IntToStr(FINMaterialsObj.mat_id );
            nn := FINMaterialsObj.nn;
            if edtDivCodeName.Visible then begin
              divCode4Order := FINMaterialsObj.div_code;
              divName4Order := FINMaterialsObj.div_name;
              edtDivCodeName.Text := divCode4Order + ' ' + divName4Order;
            end;

          end;

          ///// ВЫТЯНЕМ НАЗВАНИЕ СВЯЗАННОГО МАТЕРИАЛА (КОТОРЫЙ СПИСЫВАЕТСЯ)
          //TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
          //plan := DMReports.getPlanByEstimateCode(ENEstimateItemObj.code);
          // plan := TempENPlanWork.getObject(ENPlanWorkCode);

          // Для списания средств защиты
          if plan.typeRef.code = ENPLANWORKTYPE_WRITEOFF_PROTECTION then
          begin
            estiFilter := ENEstimateItemFilter.Create;
            SetNullIntProps(estiFilter);
            SetNullXSProps(estiFilter);
            estiFilter.kindRef := ENEstimateItemKindRef.Create;
            estiFilter.kindRef.code := ENESTIMATEITEMKIND_MATERIALS;
            estiFilter.planRef := ENPlanWorkRef.Create;
            estiFilter.planRef.code := ENEstimateItemObj.planRef.code;
            estiFilter.conditionSQL := ' ENESTIMATEITEM.CODE in ( select e2e.estimateiteminrefcode  ' +
                                                                  ' from enestimateitem2nstmttm e2e ' +
                                                                  ' where e2e.estimateitemoutrefcode = ' + IntToStr(ENEstimateItemObj.code) +
                                                                  ' and e2e.typerefcode = ' +  IntToStr(ENESTIMATEITEM2ENESTIMATEITEM_TYPE_UNMOUNT_WRITE_OFF) + ' ) ';

            Tempesti :=  HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

            estiList := Tempesti.getScrollableFilteredList(estiFilter,0,-1);
            if High(estiList.list) > -1 then
            begin
              //estiObj := Tempesti.getObject(estiList.list[0].code);
              edtLinkWriteOffMaterial.text := estiList.list[0].materialRefName;
              dismountFromEstimate := estiList.list[0].code; //estiObj.code;
            end;

            tsWorkers.TabVisible:= False;
            tsMarkers.TabVisible:= False;
            tsRQOrder.TabVisible:= False;
          end
          // Для списания всех остальных МБП и МНМА
          else if (plan.stateRef.code in [ENPLANWORKSTATE_MATERIALS_MBP
                                          , ENPLANWORKSTATE_MATERIALS_MNMA
                                          , ENPLANWORKSTATE_MATERIALS_MBP_INSTRUMENTS
                                          ,ENPLANWORKSTATE_MATERIALS_TMC]) then
          begin
            if FINMaterialsObj <> nil then
              if FINMaterialsObj.parentRef <> nil then
                if FINMaterialsObj.parentRef.code <> LOW_INT then  // FINMaterialsParentObj
                begin
                  FINMaterialsParentObj := TempFINMaterials.getObject(FINMaterialsObj.parentRef.code);
                  if FINMaterialsParentObj <> nil then
                  begin
                    edtLinkWriteOffMaterial.Text := FINMaterialsParentObj.mat_name + ' ' + FINMaterialsParentObj.nn;
                    finMaterialParentCode := FINMaterialsParentObj.code;
                  end;
                end;
          end;
          /////

      end;
  end;

  HideControls([lblNomenclature, edtNomeclature, spbOSSelect, spbNomenclatureClear],
               not ((ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_DISMOUNT) or (ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_REFINEMENT) or (ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_PRODUCED))
               );

  // SUPP-6823
  HideControls([lblAccount, edtAccount],
                 not ((ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_DISMOUNT) or (ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_REFINEMENT) or (ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_PRODUCED))
  );

  ///// 06.11.12 NET-3079
  if ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_CUSTOMER_MATERIALS then
    HideControls([lblNomenclature, edtNomeclature, spbOSSelect, spbNomenclatureClear,
                  lblPrice, edtPrice, lblAccount, edtAccount], false);
  /////

	if (ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_DISMOUNT) then
	    HideControls([lblPrice,edtPrice],false);

  DisableControls([edtNomeclature]);

  HideControls([lblCost, edtCost], not (ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_REFINEMENT));

  /// добавим выбор МОЛа для прихода изготовленных изделий
  ///  (ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_PRODUCED)
  HideControls([lblDivCodeName, edtDivCodeName, spbDivSelect, spbDivClear]
    , not (ENEstimateItemObj.kindRef.code in [ENESTIMATEITEMKIND_PRODUCED, ENESTIMATEITEMKIND_REFINEMENT]));
  DisableControls(edtDivCodeName);

  ///// 05.12.11
  { ******************
  if frmENPlanWriteOffProtectionEdit <> nil then
  begin
   if (DialogState = dsView) then
   DisableControls([btnLinkWriteOffMaterial, btnClearLinkWriteOffMaterial]);

   HideControls([lbl1, edtLinkWriteOffMaterial, btnLinkWriteOffMaterial , btnClearLinkWriteOffMaterial], not (frmENPlanWriteOffProtectionEdit.ENPlanWorkObj.typeRef.code = ENPLANWORKTYPE_WRITEOFF_PROTECTION  ));


  end;
  ****************** }
   if (DialogState = dsView) then
     DisableControls([btnLinkWriteOffMaterial, btnClearLinkWriteOffMaterial]);

  HideControls([lblLinkWriteOffMaterial, edtLinkWriteOffMaterial,
                btnLinkWriteOffMaterial, btnClearLinkWriteOffMaterial]);
  /////

{ нах оно тут было? ;)
if (DialogState = dsView) or (DialogState = dsEdit) then
begin
  actObj := DMReports.getActByPlan(ENEstimateItemObj.planRef.code);
  if actObj.code = LOW_INT then
    tsFINMaterials.TabVisible := false
  else
    tsFINMaterials.TabVisible := true;
end;
}

  if not (isSiz) then HideControls([lblUseWorkTime, lblUseWorkTime2, edtUseWorkTime]);

  pcEstimateItms.ActivePage := tsMatherials;
  HideControls([edtDeliveryTime, lblDeliveryTime, lblEstimateItemStatus, cbEstimateItemStatus]);

  SetFloatStyle([edtCountGen, edtCountFact]);
  // SetIntStyle([edtDeliveryTime]);
  //SetFloatStyle(edtDeliveryTime);

  DisableControls([edtMaterialName, edtPlan, edtPlanItem, cbENEstimateItemKind]);

  HideControls([lblEnPlan, edtPlan, spbPlan, lblPlanItem, edtPlanItem, spbPlanItem]);

  lblDeliveryTimeBySPR.Caption:='';

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin

  DenyBlankValues([edtDivCodeName], ENEstimateItemObj.kindRef.code <> ENESTIMATEITEMKIND_PRODUCED);

    DenyBlankValues([
      {edtCountGen}

      //,
      edtCountFact
      , edtMaterialName
     ]);
  end;

  if DialogState = dsView then
    DisableControls([edtPlan, edtPlanItem, spbPlan, spbPlanItem, cbIsUseVAT, spbDivSelect, spbDivClear]);

  // тип учета залочим вааще .. пока? ;)
  DisableControls([cbTKAccountingType]);

  if DialogState = dsInsert then
  begin
      HideControls([lblEstimateItemStatus, cbEstimateItemStatus], false);

      HideControls([chbIsCreateObject], ENEstimateItemObj.kindRef.code <> ENESTIMATEITEMKIND_DISMOUNT );

      cbIsUseVAT.Checked := True;

      if isForClosedPlan then
      begin
        ///// 02.03.12 Теперь вместо статуса "У наявності" будет ставиться статус "Непотрібно замовляти"
        cbEstimateItemStatus.ItemIndex := 1;
        DisableControls([cbEstimateItemStatus]);
      end;

      if ENEstimateItemObj.kindRef = nil then
      begin
        ENEstimateItemObj.kindRef := ENEstimateItemKindRef.Create;
        ENEstimateItemObj.kindRef.code := ENESTIMATEITEMKIND_MATERIALS;
      end;
      {
      else begin
        if ENEstimateItemObj.kindRef.code > LOW_INT then
           cbENEstimateItemKind.ItemIndex := ENEstimateItemObj.kindRef.code - 1;
      end;
      }

      // попрячем Табы ...
      tsRQOrder.TabVisible := False;
      tsRQBill.TabVisible := False;
      tsRQFKOrder.TabVisible := False;
      tsPlanPay.TabVisible := false;
  end;

  if DialogState = dsView then
   DisableActions([actMarkView, actMarkAdd, actMarkRefresh]);

  if DialogState = dsInsert then
     tsMarkers.TabVisible := false;

  if ((inServices) and ((DialogState = dsEdit) or (DialogState = dsView))) then
    begin
      SetFloatStyle([edtCost]);
      DenyBlankValues([edtCost], not (DialogState = dsView));
      DisableControls([edtCountFact]);
      HideControls([lblCost, edtCost], False);
      lblCost.Top := 144;
      edtCost.Top := 142;
    end;


  //if DialogState = dsInsert then
  //begin
{
    if ENPlanWorkCode > 0 then
    begin
      HideControls([  lblEnPlan, edtPlan, spbPlan ], false);

      TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
      //ENPlanWorkObj := TempENPlanWork.getObject(ENEstimateItemObj.planRef.code);

      ENPlanWorkFilterObj := ENPlanWorkFilter.Create;
      try
        SetNullIntProps(ENPlanWorkFilterObj);
        SetNullXSProps(ENPlanWorkFilterObj);

        ENPlanWorkFilterObj.code := ENPlanWorkCode;

        //ENPlanWorkList := TempENPlanWork.getFilteredList(ENPlanWorkFilterObj);
        ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(ENPlanWorkFilterObj, 0, -1);

        if ENPlanWorkList <> nil then
          if ENPlanWorkList.list <> nil then
            if High(ENPlanWorkList.list) >= 0 then
            begin
              edtPlan.Text := ENPlanWorkList.list[0].objectName;
              //rgPlans.ItemIndex := 0;
              //rgPlansClick(Sender);
            end;
      finally
        ENPlanWorkFilterObj.Free;
      end;
    end;
}

    if ENEstimateItemObj.planRef <> nil then
      if ENEstimateItemObj.planRef.code <> LOW_INT then
      begin

        HideControls([  lblEnPlan, edtPlan, spbPlan ], false);

        TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
        //ENPlanWorkObj := TempENPlanWork.getObject(ENEstimateItemObj.planRef.code);

        ENPlanWorkFilterObj := ENPlanWorkFilter.Create;
        try
          SetNullIntProps(ENPlanWorkFilterObj);
          SetNullXSProps(ENPlanWorkFilterObj);

          ENPlanWorkFilterObj.code := ENEstimateItemObj.planRef.code;

          //ENPlanWorkList := TempENPlanWork.getFilteredList(ENPlanWorkFilterObj);
          ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(ENPlanWorkFilterObj, 0, -1);

          if ENPlanWorkList <> nil then
            if ENPlanWorkList.list <> nil then
              if High(ENPlanWorkList.list) >= 0 then
              begin
                edtPlan.Text := ENPlanWorkList.list[0].objectName;
                if  ENPlanWorkList.list[0].kindCode = ENPLANWORKKIND_CURRENT then
                  HideControls([edtDeliveryTime, lblDeliveryTime], false);

                if ((ENPlanWorkList.list[0].stateRefCode = ENPLANWORKSTATE_REFINEMENT_BY_CONTRACT) or (ENPlanWorkList.list[0].stateRefCode = ENPLANWORKSTATE_REFINEMENT))
                  and (ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_MATERIALS) then
                begin
                  HideControls([chbIsMainForRefinement], False);
                  chbIsMainForRefinement.Checked := False;

                  if (DialogState <> dsInsert) then
                  begin
                    meFilter := ENMarkEstimateFilter.Create;
                    SetNullIntProps(meFilter);
                    SetNullXSProps(meFilter);
                    meFilter.estimateItem := ENEstimateItem.Create;
                    meFilter.estimateItem.code := ENEstimateItemObj.code;
                    meFilter.mark := ENMark.Create();
                    meFilter.mark.code := ENMARK_MAIN4REFINEMENT;
                    TempENMarkEstimate :=  HTTPRIOENMarkEstimate as ENMarkEstimateControllerSoapPort;
                    meList := TempENMarkEstimate.getScrollableFilteredList(meFilter, 0, -1);
                    if ( meList.totalCount > 0) then
                    begin
                      chbIsMainForRefinement.Checked := True;
                    end;
                  end;

                end;

                //////// 05.12.11
                // Демонтаж при списании МНМА или МБП - показываем поле для привязки основного материала
                if (ENPlanWorkList.list[0].stateRefCode in
                [ENPLANWORKSTATE_MATERIALS_MNMA
                , ENPLANWORKSTATE_MATERIALS_MBP
                , ENPLANWORKSTATE_MATERIALS_MBP_INSTRUMENTS
                , ENPLANWORKSTATE_MATERIALS_TMC])
                  and (ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_DISMOUNT) then
                HideControls([lblLinkWriteOffMaterial, edtLinkWriteOffMaterial,
                              btnLinkWriteOffMaterial, btnClearLinkWriteOffMaterial], false);


                ////////

                // Если списание средств защиты скрываем Статус материала т.к он в статусе введен в эксплуатацию.
                if ENPlanWorkList.list[0].typeRefCode = ENPLANWORKTYPE_WRITEOFF_PROTECTION  then
                   begin
                   cbEstimateItemStatus.ItemIndex:= 2;
                   DisableControls([cbEstimateItemStatus]);
                   // скрываем табы
                   tsWorkers.TabVisible:= False;
                   tsMarkers.TabVisible:= False;
                   tsRQOrder.TabVisible:= False;

                   end;

              end;
        finally
          ENPlanWorkFilterObj.Free;
        end;
      end;

    //if ENPlanWorkItemCode > 0 then
    begin
      //rgPlans.ItemIndex := 1;
      //rgPlansClick(Sender);

    ///***
    HideControls([edtPlanItem, lblPlanItem, spbPlanItem], false);
    DisableControls([edtPlanItem]);

    DenyBlankValues([edtPlanItem]);
    ///***

    if ENEstimateItemObj.planItemRef <> nil then
      if ENEstimateItemObj.planItemRef.code <> Low(Integer) then
      begin

       HideControls([  lblPlanItem , edtPlanItem, spbPlanItem ], false );
       edtPlanItem.Text := ENPlanWorkItemName;

        TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
        //ENPlanWorkItemObj := TempENPlanWorkItem.getObject(ENEstimateItemObj.planItemRef.code);

        ENPlanWorkItemFilterObj := ENPlanWorkItemFilter.Create;
        try
          SetNullIntProps(ENPlanWorkItemFilterObj);
          SetNullXSProps(ENPlanWorkItemFilterObj);

          ENPlanWorkItemFilterObj.code := ENEstimateItemObj.planItemRef.code;

          //ENPlanWorkItemList := TempENPlanWorkItem.getFilteredList(ENPlanWorkItemFilterObj);
          ENPlanWorkItemList := TempENPlanWorkItem.getScrollableFilteredList(ENPlanWorkItemFilterObj, 0, -1);

          if ENPlanWorkItemList <> nil then
            if ENPlanWorkItemList.list <> nil then
              if High(ENPlanWorkItemList.list) >= 0 then
                edtPlanItem.Text := ENPlanWorkItemList.list[0].kartaRefName;
        finally
          ENPlanWorkItemFilterObj.Free;
        end;
      end;
    end;

  //end;


  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if (ENEstimateItemObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_SERVICES) then
    begin
      HideControls([lblDeliveryTimeServices], False);
      lblDeliveryTimeServices.Left := 152;
    end;

    if (isSiz) then
      begin
        DisableControls([edtCode, edtPlanItem, spbPlanItem]);
        SetIntStyle(edtUseWorkTime);
      end
    else
      begin
        DisableControls([edtCode, edtMaterialName, spbMaterialName, edtPlanItem, spbPlanItem]);
      end;

    edtCode.Text := IntToStr(ENEstimateItemObj.code);

    cbTKAccountingType.ItemIndex := -1;
    if ENEstimateItemObj.accountingTypeRef <> nil then
    begin
      if ENEstimateItemObj.accountingTypeRef.code > LOW_INT then
        cbTKAccountingType.ItemIndex := ENEstimateItemObj.accountingTypeRef.code - 1;
    end;

    if ENEstimateItemObj.materialRef <> nil then
      if ENEstimateItemObj.materialRef.code <> Low(Integer) then
      begin
        TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
        Spr_matherialFilterObj := TKMaterialsFilter.Create;
        SetNullIntProps(Spr_matherialFilterObj);
        Spr_matherialFilterObj.code := ENEstimateItemObj.materialRef.code;
        Spr_matherialList := TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
        if  ( Spr_matherialList.totalCount > 0 ) then
        begin
           lblMeasurement.Caption := 'од.виміру : '+Spr_matherialList.list[0].measurementName;
           edtMaterialName.Text := Spr_matherialList.list[0].name;
           if Spr_matherialList.list[0].deliveryDate <> LOW_INT then
             lblDeliveryTimeBySPR.Caption := 'строк постачання у довіднику : ' + IntToStr(Spr_matherialList.list[0].deliveryDate) + ' днів'
           else
             lblDeliveryTimeBySPR.Caption := 'строк постачання у довіднику : ---- днів';
        end
        else
        begin
           lblMeasurement.Caption := 'од.виміру : -- ';
           edtMaterialName.Text := '';
           lblDeliveryTimeBySPR.Caption:='';
        end;

      end;

    if ( ENEstimateItemObj.countGen <> nil ) then
       edtCountGen.Text := ENEstimateItemObj.countGen.decimalString
    else
       edtCountGen.Text := '';

    if ( ENEstimateItemObj.countFact <> nil ) then
       edtCountFact.Text := ENEstimateItemObj.countFact.decimalString
    else
       edtCountFact.Text := '';

    edtCommentGen.Text := ENEstimateItemObj.commentGen;

    if ENEstimateItemObj.kindRef <> nil then
    begin
        if ENEstimateItemObj.kindRef.code > LOW_INT then
           cbENEstimateItemKind.ItemIndex := ENEstimateItemObj.kindRef.code - 1;
    end;

    if ( ENEstimateItemObj.deliveryTime <> Low(Integer) ) then
       edtDeliveryTime.Text := IntToStr(ENEstimateItemObj.deliveryTime)
    else
       edtDeliveryTime.Text := '';

    if ( ENEstimateItemObj.useWorkTime <> Low(Integer) ) then
      case ENEstimateItemObj.useWorkTime of
      101 : edtUseWorkTime.Text := 'Черг.';
      102 : edtUseWorkTime.Text := 'До використання';
      103 : edtUseWorkTime.Text := 'До зносу';
      else
       edtUseWorkTime.Text := IntToStr(ENEstimateItemObj.useWorkTime)
      end
    else
       edtUseWorkTime.Text := '';

    if ( ENEstimateItemObj.cost <> nil ) then
       edtCost.Text := ENEstimateItemObj.cost.decimalString
    else
       edtCost.Text := '';

    if ( ENEstimateItemObj.price <> nil ) then
       edtPrice.Text := ENEstimateItemObj.price.DecimalString
    else
       edtPrice.Text := '';

    if (ENEstimateItemObj.isUseVAT = ENESTIMATEITEM_DONTUSEVAT) then
      cbIsUseVAT.Checked := False
    else
      cbIsUseVAT.Checked := True;

    ////////// 28.01.13 NET-4204
    if (ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_MATERIALS) and (ENEstimateItemObj.code > LOW_INT) then
    begin
      ieFilter := RQOrderItem2ENEstimateItemFilter.Create;
      SetNullIntProps(ieFilter);
      SetNullXSProps(ieFilter);

      ieFilter.estimateItem := ENEstimateItem.Create;
      ieFilter.estimateItem.code := ENEstimateItemObj.code;

      TempRQOrderItem2ENEstimateItem := HTTPRIORQOrderItem2ENEstimateItem as RQOrderItem2ENEstimateItemControllerSoapPort;
      ieList := TempRQOrderItem2ENEstimateItem.getScrollableFilteredList(ieFilter, 0, -1);

      lblOrder.Visible := false;

      if ieList.totalCount > 0 then
      begin
        if ieList.list[0].typeRefCode = RQORDERITEM2ENESTIMATEITEMTYPE_MANUAL then
        begin
          orderFilter := RQOrderFilter.Create;
          SetNullIntProps(orderFilter);
          SetNullXSProps(orderFilter);

          orderFilter.conditionSQL := 'code in (' +
                                        ' select o.code ' +
                                        '   from rqorderitem2enestimttm ie, rqorderitem oi, rqorder o ' +
                                        '  where ie.estimateitemcode = ' + IntToStr(ENEstimateItemObj.code) +
                                        '    and ie.orderitemcode = oi.code ' +
                                        '    and oi.orderrefcode = o.code ' +
                                        '    and o.kindrefcode = ' + IntToStr(RQORDER_KIND_OE_PLANNED_AUTO) + ')';

          TempRQOrder := HTTPRIORQOrder as RQOrderControllerSoapPort;
          orderList := TempRQOrder.getScrollableFilteredList(orderFilter, 0, -1);
          if orderList.totalCount > 0 then
          begin
            lblOrder.Caption := 'Цей матеріал доданий ВРУЧНУ у планову заявку № ' + orderList.list[0].numberDoc;
            if orderList.list[0].orderPeriod <> nil then
              lblOrder.Caption := lblOrder.Caption + ' (період: ' +
                                  DateToStr(EncodeDate(orderList.list[0].orderPeriod.Year,
                                                       orderList.list[0].orderPeriod.Month,
                                                       orderList.list[0].orderPeriod.Day)) + ')';
            lblOrder.Visible := true;
          end;
        end;
      end;
    end;
    //////////
 end;

  DisableControls([edtCountGen, edtPlan, spbPlan]);
end;



procedure TfrmENEstimateItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  eType , nomenclatureCode : Integer;
  account : String; // Счет для приходуемых от акта материалов (доработка, демонтаж, изготовление и пр.)
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  plan : ENPlanWork;
begin
	if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtMaterialName
			//,edtCountGen
      ,edtCountFact
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
      if (DialogState = dsEdit) then
      begin
          if not NoBlankValues([edtCountGen]) then
          begin
            Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
            Action := caNone;
            Exit;
          end;
       end;

      if cbTKAccountingType.ItemIndex > -1 then
      begin
        if ENEstimateItemObj.accountingTypeRef = nil then ENEstimateItemObj.accountingTypeRef := TKAccountingTypeRef.Create;
        ENEstimateItemObj.accountingTypeRef.code := cbTKAccountingType.ItemIndex + 1;
      end
      else
      begin
					 Application.MessageBox(PChar('Укажите тип учета мат-ла !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
           Action:=caNone;
           Exit;
      end;

      // NET-2172 Задание ПТО от 12.06.2012
      // опять разрешаем.......
			{if cbENEstimateItemKind.ItemIndex + 1 = ENESTIMATEITEMKIND_DISMOUNT then
      begin
        if edtNomeclature.Text = '' then
        begin
          Application.MessageBox(PChar('Добавление демонтированных материалов без привязки номенклатуры запрещено !' + #13#10 +
                                       'Выберите номенклатуру !'), PChar('Внимание !'), MB_ICONWARNING);
					edtNomeclature.SetFocus;
          Action := caNone;
          Exit;
				end;
			end;}

      plan := DMReports.getPlanByCode(ENEstimateItemObj.planRef.code);
      if plan = nil then
      begin
           Application.MessageBox(PChar('План не знайдено :( '),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
           Action:=caNone;
           Exit;
      end;

      ///// 06.11.12 NET-3079
      // При добавлении материала заказчика на месячном плане
      // обязательными полями являются номенклатура из ФК и цена!!!
      if plan.kind.code = ENPLANWORKKIND_CURRENT then
        if ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_CUSTOMER_MATERIALS then
          if not NoBlankValues([edtNomeclature, edtPrice]) then
          begin
            Application.MessageBox(PChar('Пустые поля недопустимы !'), PChar('Внимание !'), MB_ICONWARNING);
            Action := caNone;
            Exit;
          end;
      /////


      eType := DMReports.getElementTypeByPlan(ENEstimateItemObj.planRef.code);
      // такаж фигня в Сервере ...
      if not ( eType in [EN_PURCHASES_OBJECT , EN_PURCHASES_NO_OBJECT, EN_WRITING_NO_OBJECT, EN_WRITING_NO_OBJECT_RESTOCKING, EN_GIFT_NO_OBJECT, EN_AVR16_NO_OBJECT] ) then
      begin

        if (plan.stateRef.code <> ENPLANWORKSTATE_REFINEMENT_BY_CONTRACT) and (plan.stateRef.code <> ENPLANWORKSTATE_REFINEMENT)
             and (plan.stateRef.code <> ENPLANWORKSTATE_SALE_PRODUCTS) then
         begin
          if (
              (ENEstimateItemObj.kindRef.code <> ENESTIMATEITEMKIND_PRODUCED) {Для виготовлених не надо указывать работу}
               and   ( not isWriteOff_OZ )) {  для списания тоже не указываем пункт плана }
              then
            if not NoBlankValues([edtPlanItem]) then
            begin
              Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
              Action := caNone;
              Exit;
            end;
        end;

      end;


    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

     if (ENEstimateItemObj.countGen = nil ) then
       ENEstimateItemObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       ENEstimateItemObj.countGen.decimalString := edtCountGen.Text 
     else
       //ENEstimateItemObj.countGen := nil;
       ENEstimateItemObj.countGen.DecimalString := '0'; // ??

     if (ENEstimateItemObj.countFact = nil ) then
       ENEstimateItemObj.countFact := TXSDecimal.Create;
     if edtCountFact.Text <> '' then
       ENEstimateItemObj.countFact.decimalString := edtCountFact.Text 
     else
       ENEstimateItemObj.countFact := nil;

     ENEstimateItemObj.commentGen := edtCommentGen.Text; 

     if ( edtDeliveryTime.Text <> '' ) then
       ENEstimateItemObj.deliveryTime := StrToInt(edtDeliveryTime.Text)
     else
       ENEstimateItemObj.deliveryTime := Low(Integer) ;


     if ( edtUseWorkTime.Text <> '' ) then
     begin
       if edtUseWorkTime.Text='Черг' then  ENEstimateItemObj.useWorkTime := StrToInt('101');
       if edtUseWorkTime.Text='До використання' then  ENEstimateItemObj.useWorkTime := StrToInt('102');
       if edtUseWorkTime.Text='До зносу' then  ENEstimateItemObj.useWorkTime := StrToInt('103');
     end;

     if ( edtUseWorkTime.Text <> '' ) and (ENEstimateItemObj.useWorkTime <100) then
       ENEstimateItemObj.useWorkTime := StrToInt(edtUseWorkTime.Text)
     else
       if ( edtUseWorkTime.Text <> '' ) and (ENEstimateItemObj.useWorkTime >100) then
          ENEstimateItemObj.useWorkTime := ENEstimateItemObj.useWorkTime

     else
       ENEstimateItemObj.useWorkTime := Low(Integer);


    if (cbIsUseVAT.Checked) then
      ENEstimateItemObj.isUseVAT := ENESTIMATEITEM_USEVAT
    else
      ENEstimateItemObj.isUseVAT := ENESTIMATEITEM_DONTUSEVAT;



     // 13.12.2011 +++ для "Услуг со стороны" стоимость работ/услуг обязательна
    if (inServices) { NET-2318 and (StrToFloat(edtCost.Text) = 0))} then
     begin

       if edtCost.Text <> '' then
       begin
          if StrToFloat(edtCost.Text) = 0 then
          begin
            Application.MessageBox(PChar('Вкажіть вартість послуги!!!'),PChar('Увага!!!'),MB_ICONWARNING+MB_OK);
            Action := caNone;
            Exit;
          end;
       end
       else
          begin
            Application.MessageBox(PChar('Вкажіть вартість послуги!!!'),PChar('Увага!!!'),MB_ICONWARNING+MB_OK);
            Action := caNone;
            Exit;
          end;
     end;

     // стоимость ...
     if (ENEstimateItemObj.cost = nil ) then
       ENEstimateItemObj.cost := TXSDecimal.Create;
     if edtCost.Text <> '' then
       ENEstimateItemObj.cost.decimalString := edtCost.Text
     else
       ENEstimateItemObj.cost := nil;


            // определим тип элемента по коду
            // и вызовм НУЖНЫЙ метод ... - чтоб левые юзера не планировали на правые обьекты

      if ENPlanWorkCode > 0 then
      begin
        if ENEstimateItemObj.planRef = nil then
          ENEstimateItemObj.planRef := ENPlanWorkRef.Create;
        ENEstimateItemObj.planRef.code := ENPlanWorkCode;
      end;


      if edtNomenclatureCode.Text = '' then
        nomenclatureCode := LOW_INT
      else
        nomenclatureCode := StrToInt(edtNomenclatureCode.Text);

      account := edtAccount.Text;

     ///// 07.11.12 NET-3079 При добавлении материалов заказчика цена вводится вручную на клиенте
     if (ENEstimateItemObj.price = nil) then
       ENEstimateItemObj.price := TXSDecimal.Create;
     if edtPrice.Text <> '' then
       ENEstimateItemObj.price.DecimalString := edtPrice.Text
     else
       ENEstimateItemObj.price := nil;
    /////

    ///// SUPP-5053
    if (ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_DISMOUNT) then
    begin
        if (ENEstimateItemObj.price = nil) then
        begin
            Application.MessageBox(PChar('Вкажіть ціну!!!'),PChar('Увага!!!'),MB_ICONWARNING+MB_OK);
            Action := caNone;
            Exit;
        end;
    end;
    /////

    if DialogState = dsInsert then
    begin
      ENEstimateItemObj.code:=low(Integer);

      ///// {Для проставления статуса "На складе ХОЭ" при добавлении материала}
      ///// 02.03.12 Теперь вместо статуса "У наявності" будет ставиться статус "Непотрібно замовляти"
      if cbEstimateItemStatus.ItemIndex = 1 then
      begin
        // проверим права
        TempENEstimateItem.changeStatus(LOW_INT, LOW_INT);

        if ENEstimateItemObj.statusRef = nil then
          ENEstimateItemObj.statusRef := ENEstimateItemStatusRef.Create;
        /// 02.03.12 Теперь вместо статуса "У наявності" будет ставиться статус "Непотрібно замовляти"
        //*** ENEstimateItemObj.statusRef.code := ENESTIMATEITEMSTATUS_PRESENT;
        ENEstimateItemObj.statusRef.code := ENESTIMATEITEMSTATUS_UNUSED;
      end;
      /////

      // 19.11.14 NET-4415
      if cbEstimateItemStatus.ItemIndex = 3 then
      begin
        ENEstimateItemObj.statusRef := ENEstimateItemStatusRef.Create;
        ENEstimateItemObj.statusRef.code := ENESTIMATEITEMSTATUS_OWN_PRODUCTION;
      end;

      if ENPlanWorkItemCode > 0 then
      begin
        if ENEstimateItemObj.planItemRef = nil then
          ENEstimateItemObj.planItemRef := ENPlanWorkItemRef.Create;
        ENEstimateItemObj.planItemRef.code := ENPlanWorkItemCode;
      end;
      {
      if ENEstimateItemObj.typeRef = nil then
        ENEstimateItemObj.typeRef := ENEstimateItemTypeRef.Create;
      ENEstimateItemObj.typeRef.code := ENESTIMATEITEMTYPE_MANUAL;
      }
            {
            case eType of
              1,2,3 : TempENEstimateItem.addBySRS(ENEstimateItemObj);
              5 : TempENEstimateItem.addBySVES(ENEstimateItemObj);
              6 : TempENEstimateItem.addBySPS(ENEstimateItemObj);
              7 : TempENEstimateItem.addByByt(ENEstimateItemObj);
              8 : TempENEstimateItem.addByProm(ENEstimateItemObj);
              else
              begin
                Application.MessageBox(PChar('Невідомий тип Об"єкту !!!'), PChar('Помилка'), MB_ICONERROR);
                exit;
              end;
            end;
            }

      if isForClosedPlan then
        TempENEstimateItem.addInClosedPlan(ENEstimateItemObj)
      else
      begin

        // если оприходование при списании МБП и МНМА (средств защиты и не только)
        // 05.12.11 if ((ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_DISMOUNT) and (plan.typeRef.code = ENPLANWORKTYPE_WRITEOFF_PROTECTION )) then

        ///// 06.12.11
        {
        if (ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_DISMOUNT) and
           ((plan.stateRef.code = ENPLANWORKSTATE_MATERIALS_MBP) or (plan.stateRef.code = ENPLANWORKSTATE_MATERIALS_MNMA)) then
          TempENEstimateItem.addUnmountForWriteOff(ENEstimateItemObj, nomenclatureCode, Ord(chbIsCreateObject.Checked), DismountFromEstimate)
        else
        if ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_DISMOUNT then
          TempENEstimateItem.addUnmount(ENEstimateItemObj, nomenclatureCode, Ord(chbIsCreateObject.Checked))
        }
				if (ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_DISMOUNT) then
				begin
          if plan.typeRef.code = ENPLANWORKTYPE_WRITEOFF_PROTECTION then
            TempENEstimateItem.addUnmountForWriteOff(ENEstimateItemObj, nomenclatureCode, nn, 0, DismountFromEstimate, account)
          else if (plan.stateRef.code in [ENPLANWORKSTATE_MATERIALS_MBP, ENPLANWORKSTATE_MATERIALS_MBP_INSTRUMENTS]) or (plan.stateRef.code = ENPLANWORKSTATE_MATERIALS_MNMA) then
            TempENEstimateItem.addUnmountForWriteOff_MBP_MNMA(ENEstimateItemObj, nomenclatureCode, nn, 0, finMaterialParentCode, account)
          else if plan.elementRef.code = ENELEMENTCODE_COUNTERS_WRITE_OFF then
            TempENEstimateItem.addUnmountCountersWriteOff(ENEstimateItemObj, nomenclatureCode, nn, Ord(chbIsCreateObject.Checked), account)
					else
						TempENEstimateItem.addUnmount(ENEstimateItemObj, nomenclatureCode, nn, Ord(chbIsCreateObject.Checked), finMaterialParentCode, account);
        end
				/////
				else
        if ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_REFINEMENT then
        begin
          if not NoBlankValues([edtCost]) then
          begin
            Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
            Action := caNone;
            Exit;
          end;
          if Length(Trim(divCode4Order)) > 0 then begin
            TempENEstimateItem.addRefinement(ENEstimateItemObj, nomenclatureCode, nn, account, divCode4Order);
          end else begin
            TempENEstimateItem.addRefinement(ENEstimateItemObj, nomenclatureCode, nn, account);
          end;
        end
        else
        if ((plan.stateRef.code = ENPLANWORKSTATE_REFINEMENT_BY_CONTRACT) or (plan.stateRef.code = ENPLANWORKSTATE_REFINEMENT))
           and (ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_MATERIALS)
           and (chbIsMainForRefinement.Checked)
           and (plan.kind.code = ENPLANWORKKIND_CURRENT)
        then
        begin
          TempENEstimateItem.add4Refinement(ENEstimateItemObj);
        end
        else
        if ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_PRODUCED then
        begin
           if plan.stateRef.code <> ENConsts.ENPLANWORKSTATE_SIDEWORKS then
             begin
             if divCode4Order = '' then
             begin
                Application.MessageBox(PChar('Оберіть МОЛа для оприбуткування!!!'), PChar('Помилка'), MB_ICONERROR);
                Action := caNone;
             end
             else
             TempENEstimateItem.addProduced(ENEstimateItemObj, nomenclatureCode, nn, account, divCode4Order, divName4Order)
             end
           else
             TempENEstimateItem.addProduced4Services(ENEstimateItemObj, nomenclatureCode, nn, account);
        end
        else
        ////////////////////////////////////////////////////////////////////////
        // 08.11.12 NET-3079
        if (ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_CUSTOMER_MATERIALS) and
           (plan.kind.code = ENPLANWORKKIND_CURRENT) then
        begin
          TempENEstimateItem.addCustomerMaterial(ENEstimateItemObj, nomenclatureCode, nn, account);
        end
        ////////////////////////////////////////////////////////////////////////
        else
          TempENEstimateItem.add(ENEstimateItemObj);

      end;

    end
    else
    if DialogState = dsEdit then
    begin
    {
      if ENEstimateItemObj.typeRef = nil then
        ENEstimateItemObj.typeRef := ENEstimateItemTypeRef.Create;
      ENEstimateItemObj.typeRef.code := ENESTIMATEITEMTYPE_MANUAL; // ??
    }
    {
            case eType of
              1,2,3 : TempENEstimateItem.saveBySRS(ENEstimateItemObj);
              5 : TempENEstimateItem.saveBySVES(ENEstimateItemObj);
              6 : TempENEstimateItem.saveBySPS(ENEstimateItemObj);
              7 : TempENEstimateItem.saveByByt(ENEstimateItemObj);
              8 : TempENEstimateItem.saveByProm(ENEstimateItemObj);
              else
              begin
                Application.MessageBox(PChar('Невідомий тип Об"єкту !!!'), PChar('Помилка'), MB_ICONERROR);
                exit;
              end;
            end;
            }

      {
      /// 01.08.10
      // Уже не надо !!! МТС передумал и переубедил СВЭС :-)
      if isForOrder then
        TempENEstimateItem.saveForOrder(ENEstimateItemObj)
      else
      ///
      }

        // если оприходование при списании МБП и МНМА (средств защиты и не только)
        // 05.12.11 if ((ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_DISMOUNT) and (plan.typeRef.code = ENPLANWORKTYPE_WRITEOFF_PROTECTION )) then

        ///// 06.12.11
        {
        if (ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_DISMOUNT) and
           ((plan.stateRef.code = ENPLANWORKSTATE_MATERIALS_MBP) or (plan.stateRef.code = ENPLANWORKSTATE_MATERIALS_MNMA)) then
          TempENEstimateItem.saveUnmountForWriteOff(ENEstimateItemObj, nomenclatureCode,  DismountFromEstimate)
        else
        if ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_DISMOUNT then
        begin
          TempENEstimateItem.saveUnmount(ENEstimateItemObj, nomenclatureCode);
        end
        }

        if (transformatorsForRaw) then
        begin
          TempENEstimateItem.save(ENEstimateItemObj, account);
        end else

        if (ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_DISMOUNT) then
        begin
          if plan.typeRef.code = ENPLANWORKTYPE_WRITEOFF_PROTECTION then
            TempENEstimateItem.saveUnmountForWriteOff(ENEstimateItemObj, nomenclatureCode, nn, DismountFromEstimate, account)
          else if (plan.stateRef.code in [ENPLANWORKSTATE_MATERIALS_MBP, ENPLANWORKSTATE_MATERIALS_MBP_INSTRUMENTS]) or (plan.stateRef.code = ENPLANWORKSTATE_MATERIALS_MNMA) then
            TempENEstimateItem.saveUnmountForWriteOff_MBP_MNMA(ENEstimateItemObj, nomenclatureCode, nn, account)
          else
            TempENEstimateItem.saveUnmount(ENEstimateItemObj, nomenclatureCode, nn, account);
        end
        /////

        else
        if ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_REFINEMENT then
        begin
          if not NoBlankValues([edtCost]) then
          begin
            Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
            Action := caNone;
            Exit;
          end;
          if Length(Trim(divCode4Order)) > 0 then begin
            TempENEstimateItem.saveRefinement(ENEstimateItemObj, nomenclatureCode, nn, account, divCode4Order);
          end else begin
            TempENEstimateItem.saveRefinement(ENEstimateItemObj, nomenclatureCode, nn, account);
          end;
        end
        else
        if (plan.stateRef.code = ENPLANWORKSTATE_REFINEMENT_BY_CONTRACT)
           and (ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_MATERIALS)
           //and (chbIsMainForRefinement.Checked)
           and (plan.kind.code = ENPLANWORKKIND_CURRENT)
        then
        begin
          TempENEstimateItem.save4Refinement(ENEstimateItemObj, ord(chbIsMainForRefinement.Checked));
        end
        else
        if ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_PRODUCED then
        begin
           if plan.stateRef.code <> ENConsts.ENPLANWORKSTATE_SIDEWORKS then
             begin
             if divCode4Order = '' then
             begin
                Application.MessageBox(PChar('Оберіть МОЛа для оприбуткування!!!'), PChar('Помилка'), MB_ICONERROR);
                Action := caNone;
             end
             else
                TempENEstimateItem.saveProduced(ENEstimateItemObj, nomenclatureCode, nn, account, divCode4Order, divName4Order)
                end
             else
                TempENEstimateItem.saveProduced4Services(ENEstimateItemObj, nomenclatureCode, nn, account)
        end
        else
        ////////////////////////////////////////////////////////////////////////
        // 08.11.12 NET-3079
        if (ENEstimateItemObj.kindRef.code = ENESTIMATEITEMKIND_CUSTOMER_MATERIALS) and
           (plan.kind.code = ENPLANWORKKIND_CURRENT) then
        begin
          TempENEstimateItem.saveCustomerMaterial(ENEstimateItemObj, nomenclatureCode, nn, account);
        end
        ////////////////////////////////////////////////////////////////////////
        else
        begin
          TempENEstimateItem.save(ENEstimateItemObj);
        end;
    end;
  end;
end;


procedure TfrmENEstimateItemEdit.sgRQFKOrderClick(Sender: TObject);
begin
  inherited;
  UpdateItemGrid();
end;


procedure TfrmENEstimateItemEdit.spbDivClearClick(Sender: TObject);
begin
  inherited;
 divCode4Order := '';
 divName4Order := '';
 edtDivCodeName.Text := '';
end;

procedure TfrmENEstimateItemEdit.spbDivSelectClick(Sender: TObject);
var
 selectedFinMol : FINMolShort;
begin
   selectedFinMol := TfrmFINMolShow.chooseFromList();
   if Assigned(selectedFinMol) then begin
    divCode4Order := selectedFinMol.id;
    divName4Order := selectedFinMol.text;
    edtDivCodeName.Text := divCode4Order + ' ' + divName4Order;
   end;
end;

procedure TfrmENEstimateItemEdit.spbMaterialNameClick(Sender: TObject);
var frmSpr_matherialShow: TfrmTKMaterialsShow;
mtFilter : TKMaterialsFilter;
fMaterial: TMaterialFilter;
TempTMat : TmaterialControllerSoapPort;
TmaterialList: TmaterialShortList;
begin
  if DialogState = dsView then Exit;
  {
  mtFilter := TKMaterialsFilter.Create;
  SetNullIntProps(mtFilter);
  SetNullXSProps(mtFilter);

  mtFilter.conditionSQL := 'parentrefcode is null';
  mtFilter.orderBySQL := ' tk1.name'; // в ДАО в запросе пробит алиас tk1 !!!
  }

  if (isSiz) then
    begin
      mtFilter := TKMaterialsFilter.Create;
      SetNullIntProps(mtFilter);
      SetNullXSProps(mtFilter);
      mtFilter.conditionSQL := ' tk1.parentrefcode = ' + IntToStr(ENEstimateItemObj.materialRef.code);
      mtFilter.orderBySQL := ' tk1.name';

      frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal, mtFilter);
    end
  else
    frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);//, mtFilter);

  try
    with frmSpr_matherialShow do
    begin
      // NET-73 Закрываем любое редактирование материалов (оставляем только просмотр)
      // (для редактирования есть отдельный клиент!)
      DisableActions([actInsert, actEdit, actDelete]);

      DenyGroupSelection := true;

      if ShowModal = mrOk then
      begin
        try
          if (checkCost) and (TKMaterialsShort(tvDep.Selected.Data).cost = nil) then
          begin
            Application.MessageBox(PChar('На матеріалі не вказана вартість!!!'), PChar('Увага!'),MB_ICONQUESTION+MB_OK);
            exit;
          end else
            begin
            if ENEstimateItemObj.materialRef = nil then ENEstimateItemObj.materialRef := TKMaterialsRef.Create;
            ENEstimateItemObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code; //StrToInt(GetReturnValue(sgSpr_matherial, 0));
            edtMaterialName.Text := TKMaterialsShort(tvDep.Selected.Data).name ; //GetReturnValue(sgSpr_matherial, 1);
            lblMeasurement.Caption := 'од.виміру : '+ TKMaterialsShort(tvDep.Selected.Data).measurementName ;//GetReturnValue(sgSpr_matherial, 2);

            if TKMaterialsShort(tvDep.Selected.Data).accountingTypeRefCode <> LOW_INT then
              cbTKAccountingType.ItemIndex := TKMaterialsShort(tvDep.Selected.Data).accountingTypeRefCode - 1
            else
              cbTKAccountingType.ItemIndex := 0;

            // если установлена эталонная номенклатура, то подставим её в поля с номенклатурой
            if Length(TKMaterialsShort(tvDep.Selected.Data).etalonNn) > 0 then
            begin
              TempTMat := HTTPRIOTmaterial as TmaterialControllerSoapPort;
              fMaterial := TMaterialFilter.Create;
              SetNullIntProps(fMaterial);
              SetNullXSProps(fMaterial);
              fMaterial.nn := TKMaterialsShort(tvDep.Selected.Data).etalonNn;

              TmaterialList := TempTMat.getScrollableFilteredList(fMaterial,0,-1);

              if (TmaterialList.totalCount <> 1) then exit;

               edtNomeclature.Text := TmaterialList.list[0].name + ' ном.номер ' + TmaterialList.list[0].nn;
               edtNomenclatureCode.Text := IntToStr(TmaterialList.list[0].id);
               nn := TmaterialList.list[0].nn;

               if edtAccount.Text = '' then edtAccount.Text := TmaterialList.list[0].bal_sch;

               if TmaterialList.list[0].cost <> nil then
                 if edtPrice.Text = '' then edtPrice.Text := TmaterialList.list[0].cost.DecimalString;

            end;

            end
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

procedure TfrmENEstimateItemEdit.spbPlanItemClick(Sender: TObject);
var frmENPlanWorkItemShow: TfrmENPlanWorkItemShow;
    ENPlanWorkItemFilterObj: ENPlanWorkItemFilter;
begin
  if DialogState = dsView then Exit;

  ENPlanWorkItemFilterObj := ENPlanWorkItemFilter.Create;
  SetNullIntProps(ENPlanWorkItemFilterObj);
  SetNullXSProps(ENPlanWorkItemFilterObj);

  ENPlanWorkItemFilterObj.planRef := ENPlanWorkRef.Create;
  if DialogState = dsInsert then
  begin
    if ENPlanWorkCode > 0 then
      ENPlanWorkItemFilterObj.planRef.code := ENPlanWorkCode
    else
      Exit;
  end
  else
    ENPlanWorkItemFilterObj.planRef.code := ENEstimateItemObj.planRef.code;

  // +++ 27.12.2011  нельзя добавлять материалы под услуги со стороны
  ENPlanWorkItemFilterObj.conditionSQL := 'countGen <> 0 and TKTECHCARDSOURCE.CODE <> ' + IntToStr(TKTECHCARDSOURCE_SERVICES_FROM_SIDE);

  frmENPlanWorkItemShow := TfrmENPlanWorkItemShow.Create(Application, fmNormal, ENPlanWorkItemFilterObj);

  try
    DisableActions([frmENPlanWorkItemShow.actInsert, frmENPlanWorkItemShow.actEdit, frmENPlanWorkItemShow.actDelete,
                    frmENPlanWorkItemShow.actNoFilter, frmENPlanWorkItemShow.actFilter]);

    with frmENPlanWorkItemShow do
      if ShowModal = mrOk then
      begin
        try
          if ENEstimateItemObj.planItemRef = nil then ENEstimateItemObj.planItemRef := ENPlanWorkItemRef.Create;
          ENEstimateItemObj.planItemRef.code := StrToInt(GetReturnValue(sgENPlanWorkItem, 0));
          edtPlanItem.Text := GetReturnValue(sgENPlanWorkItem, 1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENPlanWorkItemShow.Free;
  end;
end;

procedure TfrmENEstimateItemEdit.rgPlansClick(Sender: TObject);
begin
{
  if rgPlans.ItemIndex = 0 then
  begin
    HideControls([edtPlan, spbPlan], false);
    HideControls([edtPlanItem, spbPlanItem]);
  end
  else
  begin
    HideControls([edtPlan, spbPlan]);
    HideControls([edtPlanItem, spbPlanItem], false);
  end;
 }

end;

procedure TfrmENEstimateItemEdit.pcEstimateItmsChange(Sender: TObject);
var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  i, LastCount: Integer;
  FINMaterialsList: FINMaterialsShortList;
  finMaterialFilter : FINMaterialsFilter;

  TempMarkEstimate : ENMarkEstimateControllerSoapPort;
  ENMarkEstimateList : ENMarkEstimateShortList;
  enMarkEstFilter : ENMarkEstimateFilter;

  RQOrderFilterObj : RQOrderFilter;
  RQOrderItemFilterObj : RQOrderItemFilter;

  TempRQOrder: RQOrderControllerSoapPort;
  RQOrderList: RQOrderShortList;

  TempRQOrderItem: RQOrderItemControllerSoapPort;
  RQOrderItemList: RQOrderItemShortList;

  objCodeCondition : String;

  TempRQFKOrder : RQFKOrderControllerSoapPort;
  RQFKOrderList : RQFKOrderShortList;
  fkOrderFilter : RQFKOrderFilter;

  TempRQBill : RQBillControllerSoapPort;
  RQBillList : RQBillShortList;
  billFilter : RQBillFilter;

begin
  inherited;
  if pcEstimateItms.ActivePage = tsFINMaterials then
  begin
    FormatSettings.DecimalSeparator := '.';
    SetGridHeaders(FINMaterialsHeaders, sgFINMaterials.ColumnHeaders);
    TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

    //if finMaterialFilter = nil then
    begin
       finMaterialFilter := FINMaterialsFilter.Create;
       SetNullIntProps(finMaterialFilter);
       SetNullXSProps(finMaterialFilter);
    end;

    finMaterialFilter.estimateItemRef := ENEstimateItemRef.Create;
    finMaterialFilter.estimateItemRef.code := ENEstimateItemObj.code;

    FINMaterialsList := TempFINMaterials.getScrollableFilteredList(finMaterialFilter,0,-1);


    //LastCount:=High(FINMaterialsList.list);

    if High(FINMaterialsList.list) > -1 then
       sgFINMaterials.RowCount:= High(FINMaterialsList.list) + 2
    else
       sgFINMaterials.RowCount:=2;

     with sgFINMaterials do
      for i:=0 to High(FINMaterialsList.list)  do
        begin
          Application.ProcessMessages;
          if FINMaterialsList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(FINMaterialsList.list[i].code)
          else
          Cells[0,i+1] := '';
          Cells[1,i+1] := FINMaterialsList.list[i].nn;
          Cells[2,i+1] := FINMaterialsList.list[i].mat_name;
          Cells[3,i+1] := FINMaterialsList.list[i].mu_name;
          Cells[4,i+1] := FINMaterialsList.list[i].div_name;
          Cells[5,i+1] := FINMaterialsList.list[i].partner_name;
          if FINMaterialsList.list[i].doc_date = nil then
            Cells[6,i+1] := ''
          else
            Cells[6,i+1] := XSDate2String(FINMaterialsList.list[i].doc_date);
          Cells[7,i+1] := FINMaterialsList.list[i].party_discription;
          Cells[8,i+1] := FINMaterialsList.list[i].rest_purpose_name;
          Cells[9,i+1] := FINMaterialsList.list[i].frc_name;
          if FINMaterialsList.list[i].calc_price = nil then
            Cells[10,i+1] := ''
          else
            Cells[10,i+1] := FINMaterialsList.list[i].calc_price.DecimalString;
          if FINMaterialsList.list[i].quantity = nil then
            Cells[11,i+1] := ''
          else
            Cells[11,i+1] := FINMaterialsList.list[i].quantity.DecimalString;
          if FINMaterialsList.list[i].price = nil then
            Cells[12,i+1] := ''
          else
            Cells[12,i+1] := FINMaterialsList.list[i].price.DecimalString;
          if FINMaterialsList.list[i].cost = nil then
            Cells[13,i+1] := ''
          else
            Cells[13,i+1] := FINMaterialsList.list[i].cost.DecimalString;
          //LastRow:=i+1;
          sgFINMaterials.RowCount:=i+2;
        end;
     //ColCount:=ColCount+1;
     sgFINMaterials.Row:=1;
  end;


  if pcEstimateItms.ActivePage = tsMarkers then
  begin
    SetGridHeaders(MarksHeaders, sgMarks.ColumnHeaders);
    TempMarkEstimate := HTTPRIOMarkEstimate as ENMarkEstimateControllerSoapPort;

     begin
      enMarkEstFilter := ENMarkEstimateFilter.Create;
      SetNullIntProps(enMarkEstFilter);
      SetNullXSProps(enMarkEstFilter);
     end;

      enMarkEstFilter.estimateItem := ENEstimateItem.Create;
      enMarkEstFilter.estimateItem.code := ENEstimateItemObj.code;

    try
      ENMarkEstimateList := TempMarkEstimate.getScrollableFilteredList(enMarkEstFilter,0,-1);
    finally
      enMarkEstFilter.Free;
    end;

    if High(ENMarkEstimateList.list) > -1 then
       sgMarks.RowCount:= High(ENMarkEstimateList.list) + 2
    else
       sgMarks.RowCount:=2;

    with sgMarks do
      for i:=0 to High(ENMarkEstimateList.list)  do
        begin
           Application.ProcessMessages;
           Cells[0,i+1] := IntToStr(ENMarkEstimateList.list[i].code);
           Cells[1,i+1] := ENMarkEstimateList.list[i].markName;

           sgMarks.RowCount:=i+2;
        end;
      sgMarks.Row:=1;
  end;

      if pcEstimateItms.ActivePage = tsRQOrder then
      begin
        ClearGrids([sgRQOrder, sgRQOrderItem]);
        SetGridHeaders(RQOrderHeaders, sgRQOrder.ColumnHeaders);
        SetGridHeaders(RQOrderItemHeaders, sgRQOrderItem.ColumnHeaders);

        TempRQOrder :=  HTTPRIORQOrder as RQOrderControllerSoapPort;
        TempRQOrderItem :=  HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;

        RQOrderItemFilterObj := RQOrderItemFilter.Create;
        SetNullIntProps(RQOrderItemFilterObj);
        SetNullXSProps(RQOrderItemFilterObj);
        RQOrderItemFilterObj.material := TKMaterials.Create;
        RQOrderItemFilterObj.material.code := ENEstimateItemObj.materialRef.code;
        RQOrderItemFilterObj.conditionSQL := 'rqorderitem.code in '
                    +'(select qq.orderitemcode from rqorderitem2enestimttm qq where qq.estimateitemcode  = '
                    + IntToStr(ENEstimateItemObj.code) +')';
        RQOrderItemList := TempRQOrderItem.getScrollableFilteredList(RQOrderItemFilterObj, 0, -1);

        RQOrderFilterObj := RQOrderFilter.Create;
        SetNullXSProps(RQOrderFilterObj);
        SetNullIntProps(RQOrderFilterObj);
        RQOrderFilterObj.conditionSQL := 'rqorder.code in (select rqorderitem.orderrefcode from rqorderitem where rqorderitem.code in '
                    +'(select qq.orderitemcode from rqorderitem2enestimttm qq where qq.estimateitemcode  = '
                    + IntToStr(ENEstimateItemObj.code) +'))';
        RQOrderList := TempRQOrder.getScrollableFilteredList(RQOrderFilterObj, 0, -1);

        LastCount:=High(RQOrderList.list);

        if LastCount > -1 then
           sgRQOrder.RowCount:=LastCount+2
        else
           sgRQOrder.RowCount:=2;

         with sgRQOrder do
          for i:=0 to LastCount do
            begin

              if RQOrderList.list[i].code <> Low(Integer) then
              Cells[0,i+1] := IntToStr(RQOrderList.list[i].code)
              else
              Cells[0,i+1] := '';
              Cells[1,i+1] := RQOrderList.list[i].numberDoc;
              Cells[2,i+1] := RQOrderList.list[i].numberProject;
              if RQOrderList.list[i].orderPeriod = nil then
                Cells[3,i+1] := ''
              else
                //Cells[3,i+1] := XSDate2String(RQOrderList.list[i].orderPeriod);
                Cells[3,i+1] := MonthesNames[RQOrderList.list[i].orderPeriod.Month] + ' ' +
                                IntToStr(RQOrderList.list[i].orderPeriod.Year) + ' р.';

              if RQOrderList.list[i].dateGen = nil then
                Cells[4,i+1] := ''
              else
                Cells[4,i+1] := XSDate2String(RQOrderList.list[i].dateGen);

              Cells[5, i + 1] := RQOrderList.list[i].departmentRefShortName;
              Cells[6, i + 1] := RQOrderList.list[i].rqOrderFormName;
              Cells[7, i + 1] := RQOrderList.list[i].rqOrderTypeName;
              Cells[8, i + 1] := RQOrderList.list[i].rqOrderResourceName;
              Cells[9, i + 1] := RQOrderList.list[i].budgetRefShortName;

              Colors[9, i + 1] := clYellow;

              if RQOrderList.list[i].sumGen <> nil then
                //Cells[10, i + 1] := RQOrderList.list[i].sumGen.DecimalString
                Cells[10, i + 1] := SeparateThousands(RQOrderList.list[i].sumGen.DecimalString)
              else
                Cells[10, i + 1] := '0.00';

              Alignments[10, i + 1] := taRightJustify;
              Colors[10, i + 1] := $0080FF80;

              Cells[11, i + 1] := RQOrderList.list[i].statusRefName;

              Cells[12, i + 1] := RQOrderList.list[i].userGen;
      {
              Application.ProcessMessages;
              if RQOrderList.list[i].code <> Low(Integer) then
              Cells[0,i+1] := IntToStr(RQOrderList.list[i].code)
              else
              Cells[0,i+1] := '';
              Cells[1,i+1] := RQOrderList.list[i].numberDoc;
              Cells[2,i+1] := RQOrderList.list[i].numberProject;
              if RQOrderList.list[i].orderPeriod = nil then
                Cells[3,i+1] := ''
              else
                Cells[3,i+1] := XSDate2String(RQOrderList.list[i].orderPeriod);
              if RQOrderList.list[i].dateGen = nil then
                Cells[4,i+1] := ''
              else
                Cells[4,i+1] := XSDate2String(RQOrderList.list[i].dateGen);
              Cells[5,i+1] := RQOrderList.list[i].userGen;
      }
              sgRQOrder.RowCount:=i+2;
            end;
         sgRQOrder.Row:=1;

        ////// СТРОКА ЗАЯВКИ
        if High(RQOrderItemList.list) > -1 then
           sgRQOrderItem.RowCount:=High(RQOrderItemList.list)+2
        else
           sgRQOrderItem.RowCount:=2;

         with sgRQOrderItem do
          for i:=0 to High(RQOrderItemList.list) do
            begin
              Application.ProcessMessages;
              if RQOrderItemList.list[i].code <> Low(Integer) then
              Cells[0,i+1] := IntToStr(RQOrderItemList.list[i].code)
              else
              Cells[0,i+1] := '';

              Cells[1,i+1] := IntToStr(i + 1);
              Cells[2,i+1] := RQOrderItemList.list[i].ddsCodesTxtCode;

              //AddCheckBox(3, i+1, false, false);

              Cells[3,i+1] :=  RQOrderItemList.list[i].materialName + ' (код ДК: ' + RQOrderItemList.list[i].materialIdentId + ')';
              Cells[4,i+1] :=  RQOrderItemList.list[i].measurementName;

              //Cells[5,i+1] := RQOrderItemList.list[i].materialNameTxt;
              //Cells[6,i+1] := RQOrderItemList.list[i].measurementNameTxt;


              if RQOrderItemList.list[i].countFact = nil then
                Cells[5,i+1] := ''
              else
                //Cells[5,i+1] := RQOrderItemList.list[i].countFact.DecimalString;
                Cells[5,i+1] := SeparateThousands(RQOrderItemList.list[i].countFact.DecimalString);

              Alignments[5, i + 1] := taRightJustify;

              if RQOrderItemList.list[i].priceWithNds = nil then
                Cells[6,i+1] := ''
              else
                //Cells[6,i+1] := RQOrderItemList.list[i].priceWithNds.DecimalString;
                Cells[6,i+1] := SeparateThousands(RQOrderItemList.list[i].priceWithNds.DecimalString);

              Alignments[6, i + 1] := taRightJustify;
              Colors[6, i + 1] := $0080FF80;

              /////
              //itemSum := 0;

              if RQOrderItemList.list[i].sumGen = nil then
                Cells[7,i+1] := ''
              else begin
                //Cells[7,i+1] := RQOrderItemList.list[i].sumGen.DecimalString;
                Cells[7,i+1] := SeparateThousands(RQOrderItemList.list[i].sumGen.DecimalString);
                {try
                  itemSum := StrToFloat(RQOrderItemList.list[i].sumGen.DecimalString);
                except
                  itemSum := 0;
                end;}
              end;

              Alignments[7, i + 1] := taRightJustify;

              //totalSum := totalSum + itemSum;
              /////


              if RQOrderItemList.list[i].deliveryTime = LOW_INT then
                 Cells[8, i+1] := ''
              else
                Cells[8, i+1] := IntToStr(RQOrderItemList.list[i].deliveryTime);


              if RQOrderItemList.list[i].plannedDatePays = nil then
                  Cells[9, i+1] := ''
              else
                  Cells[9, i+1] := DateToStr ( EncodeDate(RQOrderItemList.list[i].plannedDatePays.Year,RQOrderItemList.list[i].plannedDatePays.Month,RQOrderItemList.list[i].plannedDatePays.Day) );

              if RQOrderItemList.list[i].plannedDateDelivery = nil then
                  Cells[10, i+1] := ''
              else
                  Cells[10, i+1] := DateToStr ( EncodeDate(RQOrderItemList.list[i].plannedDateDelivery.Year,RQOrderItemList.list[i].plannedDateDelivery.Month,RQOrderItemList.list[i].plannedDateDelivery.Day) );

              {
              if RQOrderItemList.list[i].priceWithoutNds = nil then
                Cells[7,i+1] := ''
              else
                Cells[7,i+1] := RQOrderItemList.list[i].priceWithoutNds.DecimalString;
              if RQOrderItemList.list[i].nds = nil then
                Cells[8,i+1] := ''
              else
                Cells[8,i+1] := RQOrderItemList.list[i].nds.DecimalString;
              if RQOrderItemList.list[i].sumWithoutNds = nil then
                Cells[9,i+1] := ''
              else
                Cells[9,i+1] := RQOrderItemList.list[i].sumWithoutNds.DecimalString;
              if RQOrderItemList.list[i].sumNds = nil then
                Cells[10,i+1] := ''
              else
                Cells[10,i+1] := RQOrderItemList.list[i].sumNds.DecimalString;
              }

              if RQOrderItemList.list[i].countGen = nil then
                Cells[11,i+1] := ''
              else
                Cells[11,i+1] := RQOrderItemList.list[i].countGen.DecimalString;

              Cells[12,i+1] := RQOrderItemList.list[i].orgName;

              if RQOrderItemList.list[i].contractDate <> nil then
                Cells[13, i+1] := RQOrderItemList.list[i].contractNumber + ' від ' + DateToStr ( EncodeDate(RQOrderItemList.list[i].contractDate.Year,RQOrderItemList.list[i].contractDate.Month,RQOrderItemList.list[i].contractDate.Day) )
              else begin
                ///// 23.12.10
                // Разрешаем вводить руками (не выбирая из ФК)!
                //Cells[13, i+1] := '';
                Cells[13, i+1] := RQOrderItemList.list[i].contractNumber;
              end;


              Cells[14,i+1] := RQOrderItemList.list[i].commentGen;
              //Cells[8,i+1] := RQOrderItemList.list[i].userGen;

              //LastRow:=i+1;
              sgRQOrderItem.RowCount:=High(RQOrderItemList.list)+2;

          end;
       //ColCount:=ColCount+1;
       sgRQOrderItem.Row:=1;
      end;

  if pcEstimateItms.ActivePage = tsPlanPay then
  begin
    UpdatePlanPayList;
  end;

  //----------------- tsRQFKOrder
  if (pcEstimateItms.ActivePage = tsRQFKOrder) then
  begin

    DisableControls([chkPrihod], False);

    ClearGrid(sgRQFKOrder);
    ClearGrid(sgRQFKOrderItem);
    TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

    fkOrderFilter := RQFKOrderFilter.Create;
    SetNullIntProps(fkOrderFilter);
    SetNullXSProps(fkOrderFilter);

    if (not chkPrihod.Checked) then
    begin
      fkOrderFilter.kind := RQFKOrderKind.Create;
      fkOrderFilter.kind.code := RQFKORDER_KIND_PRIHOD_POSTAVKA;
    end;

    fkOrderFilter.conditionSQL :=
    ' rqfkorder.code in (select foi.fkorderrefcode from rqfkorderitem foi where foi.code in (' +
    ' select foi2ei.fkorderitemrefcode from rqfkorderitem2enstmttm foi2ei ' +
    ' where foi2ei.estimateitemcode = ' + IntToStr(ENEstimateItemObj.code) + ' ) )';

    fkOrderFilter.orderBySQL := 'dategen desc, statuscode desc';

    RQFKOrderList := TempRQFKOrder.getScrollableFilteredList(fkOrderFilter, 0, -1);

    if High(RQFKOrderList.list) > -1 then
      sgRQFKOrder.RowCount := High(RQFKOrderList.list) + 2
    else
      sgRQFKOrder.RowCount := 2;

    with sgRQFKOrder do
    for i:=0 to High(RQFKOrderList.list) do
      begin
        Application.ProcessMessages;

        if RQFKOrderList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQFKOrderList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := RQFKOrderList.list[i].kindName;
        Cells[2,i+1] := RQFKOrderList.list[i].numberDoc;

        if RQFKOrderList.list[i].dateGen = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(RQFKOrderList.list[i].dateGen);

        if RQFKOrderList.list[i].kindCode in [RQFKORDER_KIND_PRIHOD_POSTAVKA, RQFKORDER_KIND_PRIHOD_BUFET, RQFKORDER_KIND_SERVICES_FROM_SIDE] then
          Cells[4,i+1] := RQFKOrderList.list[i].orgOkpo
        else
          Cells[4,i+1] := RQFKOrderList.list[i].molInCode;

        if RQFKOrderList.list[i].kindCode in [RQFKORDER_KIND_PRIHOD_POSTAVKA, RQFKORDER_KIND_PRIHOD_BUFET, RQFKORDER_KIND_SERVICES_FROM_SIDE] then
          Cells[5,i+1] := RQFKOrderList.list[i].orgName
        else
          Cells[5,i+1] := RQFKOrderList.list[i].molInName;

        if RQFKOrderList.list[i].kindCode in [RQFKORDER_KIND_SERVICES_FROM_SIDE] then
          Cells[6,i+1] := RQFKOrderList.list[i].sumWithoutNds.DecimalString
        else if (RQFKOrderList.list[i].kindCode = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT) then
          Cells[6,i+1] := RQFKOrderList.list[i].orgOkpo
        else
          Cells[6,i+1] := RQFKOrderList.list[i].molOutCode;

        if (RQFKOrderList.list[i].kindCode = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT) then
          Cells[7,i+1] := RQFKOrderList.list[i].orgName
        else
          Cells[7,i+1] := RQFKOrderList.list[i].molOutName;

        Cells[8, i+1] := RQFKOrderList.list[i].statusName;
        Cells[9,i+1] := RQFKOrderList.list[i].expeditorCode;
        Cells[10,i+1] := RQFKOrderList.list[i].expeditorName;

        Cells[11,i+1] := RQFKOrderList.list[i].warrantNumber;

        if RQFKOrderList.list[i].warrantDate = nil then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := XSDate2String(RQFKOrderList.list[i].warrantDate);

        Cells[13,i+1] := RQFKOrderList.list[i].warrantFIO;

        if RQFKOrderList.list[i].totalWeight = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := RQFKOrderList.list[i].totalWeight.DecimalString;

        Cells[15,i+1] := RQFKOrderList.list[i].userAdd;

        if RQFKOrderList.list[i].dateAdd = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := XSDateTimeWithDate2String(RQFKOrderList.list[i].dateAdd);

        Cells[17,i+1] := RQFKOrderList.list[i].userGen;

        if RQFKOrderList.list[i].dateEdit = nil then
          Cells[18,i+1] := ''
        else
          Cells[18,i+1] := XSDateTimeWithDate2String(RQFKOrderList.list[i].dateEdit);

        sgRQFKOrder.RowCount := i + 2;
      end;

    sgRQFKOrder.Row:=1;

    UpdateItemGrid();
  end;
  // END ---------------------- tsRQFKOrder

  //----------------- tsRQBills
  if pcEstimateItms.ActivePage = tsRQBill then
  begin

    billFilter := RQBillFilter.Create;
    SetNullIntProps(billFilter);
    SetNullXSProps(billFilter);

    billFilter.conditionSQL :=
      ' rqbill.code in ( ' +
      ' select bi.billrefcode from rqbillitem bi where bi.code in ( ' +
      ' select bi2ei.billitemcode from rqbillitem2enestimattm bi2ei ' +
      ' where bi2ei.estimateitemcode = ' + IntToStr(ENEstimateItemObj.code) + ' ) )';

    TempRQBill := HTTPRIORQBill as RQBillControllerSoapPort;
    RQBillList := TempRQBill.getScrollableFilteredList(billFilter, 0, -1);

    if High(RQBillList.list) > -1 then
       sgRQBill.RowCount := High(RQBillList.list) + 2
    else
       sgRQBill.RowCount := 2;

    with sgRQBill do
      for i := 0 to High(RQBillList.list) do
      begin
        Application.ProcessMessages;

        if RQBillList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(RQBillList.list[i].code)
        else
          Cells[0,i+1] := '';
        Cells[1,i+1] := RQBillList.list[i].numberDoc;
        Cells[2,i+1] := RQBillList.list[i].numberProject;
        if RQBillList.list[i].dateGen = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(RQBillList.list[i].dateGen);

        if RQBillList.list[i].sumGen = nil then
          Cells[4,i+1] := ''
        else begin
          Cells[4,i+1] := SeparateThousands(RQBillList.list[i].sumGen.DecimalString);
        end;

        Alignments[4, i + 1] := taRightJustify;
        Colors[4, i + 1] := $0080FF80;

        Cells[5,i+1] := RQBillList.list[i].orgName;

        if RQBillList.list[i].contractDate <> nil then
          Cells[6, i+1] := RQBillList.list[i].contractNumber + ' від ' + DateToStr(EncodeDate(RQBillList.list[i].contractDate.Year,RQBillList.list[i].contractDate.Month,RQBillList.list[i].contractDate.Day))
        else
          Cells[6, i+1] := '';

        Cells[7,i+1] := RQBillList.list[i].statusRefName;
        Cells[8,i+1] := RQBillList.list[i].state;
        Cells[9,i+1] := RQBillList.list[i].userGen;
        sgRQBill.RowCount := i + 2;
      end;

      sgRQBill.Row := 1;
  end;
  // END ---------------------- tsRQBills

  if pcEstimateItms.ActivePage = tsOwnProduction then
  begin
    UpdateOwnProductionList;
  end;
end;


procedure TfrmENEstimateItemEdit.actDeletePlanPayExecute(Sender: TObject);
Var TempENEstimateItemPlanPay: ENEstimateItemPlanPayControllerSoapPort;
    ObjCode: Integer;
begin
  TempENEstimateItemPlanPay := HTTPRIOENEstimateItemPlanPay as ENEstimateItemPlanPayControllerSoapPort;
  try
    ObjCode := StrToInt(sgENEstimateItemPlanPay.Cells[0, sgENEstimateItemPlanPay.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити запис ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENEstimateItemPlanPay.remove(ObjCode);
    UpdatePlanPayList;
  end;
end;

procedure TfrmENEstimateItemEdit.actEditPlanPayExecute(Sender: TObject);
Var TempENEstimateItemPlanPay: ENEstimateItemPlanPayControllerSoapPort;
begin
  TempENEstimateItemPlanPay := HTTPRIOENEstimateItemPlanPay as ENEstimateItemPlanPayControllerSoapPort;

  try
    ENEstimateItemPlanPayObj := TempENEstimateItemPlanPay.getObject(StrToInt(sgENEstimateItemPlanPay.Cells[0, sgENEstimateItemPlanPay.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENEstimateItemPlanPayEdit := TfrmENEstimateItemPlanPayEdit.Create(Application, dsEdit);
  try
    if frmENEstimateItemPlanPayEdit.ShowModal = mrOk then
    begin
      UpdatePlanPayList;
    end;
  finally
    frmENEstimateItemPlanPayEdit.Free;
    frmENEstimateItemPlanPayEdit := nil;
  end;
end;

procedure TfrmENEstimateItemEdit.actInsertExecute(Sender: TObject);
//var
   //frmFINMaterialsDataEdit : TfrmFINMaterialsDataEdit;
begin
{
    это все переехало в общий список материалов ...
    
   frmFINMaterialsDataEdit:= TfrmFINMaterialsDataEdit.Create(Application,dsInsert);
   try
      frmFINMaterialsDataEdit.planCode := ENEstimateItemObj.planRef.code;
      frmFINMaterialsDataEdit.estimateCode := ENEstimateItemObj.code;

      frmFINMaterialsDataEdit.edtTKMaterial.Text := edtMaterialName.Text ;
      frmFINMaterialsDataEdit.edtTKCount.Text := ENEstimateItemObj.countGen.DecimalString ;

      with frmFINMaterialsDataEdit do
        if ShowModal = mrOk then
        begin
            try


            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINMaterialsDataEdit.Free;
   end;
}

end;

{ форма материалов ...

procedure TfrmENEstimateItemEdit.actInsertExecute(Sender: TObject);
var
  frmFINMaterialsDataShow : TfrmFINMaterialsDataShow;
  f : FINMaterialsFilter;
  m : FINMaterials ;
  TempFINMaterials: FINMaterialsControllerSoapPort;
begin



   frmFINMaterialsDataShow:= TfrmFINMaterialsDataShow.Create(Application,fmNormal);
   try
      //FINMaterialsO
      frmFINMaterialsDataShow.balansNumberCondition := '';
      frmFINMaterialsDataShow.molCode := '';
      frmFINMaterialsDataShow.materialCondition := '';
      frmFINMaterialsDataShow.finDocCode := low(Integer);
      frmFINMaterialsDataShow.dateDoc := TXSDate.Create;
      frmFINMaterialsDataShow.dateDoc.XSToNative(GetXSDate(Date));


      with frmFINMaterialsDataShow do
        if ShowModal = mrOk then
        begin
            try
               //if ENWorkerObj.manningTable = nil then ENWorkerObj.manningTable := ENManningTable.Create();
               //ENWorkerObj.manningTable.code := StrToInt(GetReturnValue(sgENManningTable,0));
               //edtENManningTableManningTableName.Text:=GetReturnValue(sgENManningTable,1);

               m := FINMaterials.Create;
               SetNullIntProps(m);
               SetNullXSProps(m);
               m.estimateItemRef := ENEstimateItemRef.Create;
               m.estimateItemRef.code := ENEstimateItemObj.code;

               m.mat_id :=  StrToInt(GetReturnValue(sgFINMaterials,0));
               m.nn := GetReturnValue(sgFINMaterials,3);

               TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;
               TempFINMaterials.add(m);

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINMaterialsDataShow.Free;
   end;

end;
}


procedure TfrmENEstimateItemEdit.btnMarkAddClick(Sender: TObject);
var
  TempMarkEstimate : ENMarkEstimateControllerSoapPort;
  MarkEstimateObj : ENMarkEstimate;
begin
  if ENEstimateItemObj = nil then Exit;
  
  TempMarkEstimate := HTTPRIOMarkEstimate as ENMarkEstimateControllerSoapPort;
  MarkEstimateObj := ENMarkEstimate.Create;

  try
    frmENMarkEstimateEdit:=TfrmENMarkEstimateEdit.Create(Application, dsInsert);
    EditENMarkEstimate.estimateCode := ENEstimateItemObj.code;
    try
      if frmENMarkEstimateEdit.ShowModal = mrOk then
      begin
        if MarkEstimateObj <> nil then
          //TempMarkEstimate.add(MarkEstimateObj);
          UpdateGrid(Sender);
      end;
    finally
      frmENMarkEstimateEdit.Free;
      frmENMarkEstimateEdit:=nil;
    end;
  finally
    MarkEstimateObj.Free;
  end;
end;


procedure TfrmENEstimateItemEdit.UpdateGrid(Sender: TObject);
var
  i: Integer;
  TempMarkEstimate : ENMarkEstimateControllerSoapPort;
  ENMarkEstimateList : ENMarkEstimateShortList;
  enMarkEstFilter : ENMarkEstimateFilter;

begin
//
//----------------- tsMarkers
    if pcEstimateItms.ActivePage = tsMarkers then
      begin
        SetGridHeaders(MarksHeaders, sgMarks.ColumnHeaders);
        TempMarkEstimate := HTTPRIOMarkEstimate as ENMarkEstimateControllerSoapPort;

         begin
          enMarkEstFilter := ENMarkEstimateFilter.Create;
          SetNullIntProps(enMarkEstFilter);
          SetNullXSProps(enMarkEstFilter);
         end;

          enMarkEstFilter.estimateItem := ENEstimateItem.Create;
          enMarkEstFilter.estimateItem.code := ENEstimateItemObj.code;

        try
          ENMarkEstimateList := TempMarkEstimate.getScrollableFilteredList(enMarkEstFilter,0,-1);
        finally
          enMarkEstFilter.Free;
        end;

        if High(ENMarkEstimateList.list) > -1 then
           sgMarks.RowCount:= High(ENMarkEstimateList.list) + 2
        else
           sgMarks.RowCount:=2;

        with sgMarks do
          for i:=0 to High(ENMarkEstimateList.list) do
            begin
               Application.ProcessMessages;
               Cells[0,i+1] := IntToStr(ENMarkEstimateList.list[i].code);
               Cells[1,i+1] := ENMarkEstimateList.list[i].markName;

               sgMarks.RowCount:=i+2;
            end;
          sgMarks.Row:=1;
      end;
// END ---------------------- tsMarkers

end;


procedure TfrmENEstimateItemEdit.UpdatePlanPayList;
var
  TempENEstimateItemPlanPay: ENEstimateItemPlanPayControllerSoapPort;
  i: Integer;
  ENEstimateItemPlanPayList: ENEstimateItemPlanPayShortList;
  planPayFilter: ENEstimateItemPlanPayFilter;
begin
  ClearGrid(sgENEstimateItemPlanPay);

  if DialogState = dsInsert then
    Exit;

  TempENEstimateItemPlanPay := HTTPRIOENEstimateItemPlanPay as ENEstimateItemPlanPayControllerSoapPort;

  planPayFilter := ENEstimateItemPlanPayFilter.Create;
  SetNullIntProps(planPayFilter);
  SetNullXSProps(planPayFilter);

  planPayFilter.estimateItemRef := ENEstimateItemRef.Create;
  planPayFilter.estimateItemRef.code := ENEstimateItemObj.code;

  planPayFilter.orderBySQL := 'enestimateitemplanpay.datepay, enestimateitemplanpay.typepayrefcode';

  ENEstimateItemPlanPayList := TempENEstimateItemPlanPay.getScrollableFilteredList(planPayFilter, 0, -1);

  if High(ENEstimateItemPlanPayList.list) > -1 then
    sgENEstimateItemPlanPay.RowCount := High(ENEstimateItemPlanPayList.list) + 2
  else
    sgENEstimateItemPlanPay.RowCount := 2;

  with sgENEstimateItemPlanPay do
    for i := 0 to High(ENEstimateItemPlanPayList.list) do
    begin
      Application.ProcessMessages;
      if ENEstimateItemPlanPayList.list[i].code <> Low(Integer) then
        Cells[0, i + 1] := IntToStr(ENEstimateItemPlanPayList.list[i].code)
      else
        Cells[0, i + 1] := '';
      Cells[1, i + 1] := ENEstimateItemPlanPayList.list[i].typePayRefName;
      if ENEstimateItemPlanPayList.list[i].percentPay = nil then
        Cells[2, i + 1] := ''
      else
        Cells[2, i + 1] := ENEstimateItemPlanPayList.list[i].percentPay.DecimalString;
      if ENEstimateItemPlanPayList.list[i].datePay = nil then
        Cells[3, i + 1] := ''
      else
        Cells[3, i + 1] := XSDate2String(ENEstimateItemPlanPayList.list[i].datePay);
      sgENEstimateItemPlanPay.RowCount := i + 2;
    end;

   sgENEstimateItemPlanPay.Row := 1;
end;

procedure TfrmENEstimateItemEdit.btnMarkRefreshClick(Sender: TObject);
begin
  inherited;
UpdateGrid(Sender);
end;


procedure TfrmENEstimateItemEdit.actRQOrderViewExecute(Sender: TObject);
Var TempRQOrder: RQOrderControllerSoapPort;
    ObjCode : Integer;
begin
 TempRQOrder := HTTPRIORQOrder as RQOrderControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQOrder.Cells[0,sgRQOrder.Row]);
   except
   on EConvertError do Exit;
  end;

  frmRQOrderEdit:=TfrmRQOrderEdit.Create(Application, dsView);
  try
    frmRQOrderEdit.RQOrderObj := TempRQOrder.getObject(ObjCode);
    frmRQOrderEdit.ShowModal;
  finally
    frmRQOrderEdit.Free;
    frmRQOrderEdit:=nil;
  end;
end;


procedure TfrmENEstimateItemEdit.actUpdateExecute(Sender: TObject);
begin
  inherited;
  pcEstimateItmsChange(Sender);
end;


procedure TfrmENEstimateItemEdit.actUpdatePlanPayExecute(Sender: TObject);
begin
  UpdatePlanPayList;
end;


procedure TfrmENEstimateItemEdit.actViewExecute(Sender: TObject);
var
  billCode : Integer;
  TempRQFKOrder : RQFKOrderControllerSoapPort;
  TempRQBill : RQBillControllerSoapPort;

  frmViewPlan: TfrmENPlanWorkEdit;
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  ObjCode: Integer;
begin
  inherited;
  // -------------- tsRQFKOrder
  if pcEstimateItms.ActivePage = tsRQFKOrder then
  begin
    TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
    frmRQFKOrderEdit := TfrmRQFKOrderEdit.Create(Application, dsView);

    try
      try
        frmRQFKOrderEdit.RQFKOrderObj := TempRQFKOrder.getObject(StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]));
      except
        on EConvertError do Exit;
      end;

      if (frmRQFKOrderEdit.ShowModal = mrOk)
            and (frmRQFKOrderEdit.RQFKOrderObj.kind.code = RQFKORDER_KIND_SERVICES_FROM_SIDE) then
        begin
          UpdateGrid(Sender);
        end;

    finally
      frmRQFKOrderEdit.Free;
      frmRQFKOrderEdit:=nil;
    end;
  end;
  // END -------------- tsRQFKOrder

  // -------------- tsRQBill
  if pcEstimateItms.ActivePage = tsRQBill then
  begin
    TempRQBill := HTTPRIORQBill as RQBillControllerSoapPort;
    try
      billCode := StrToInt(sgRQBill.Cells[0,sgRQBill.Row]);
    except
      on EConvertError do Exit;
    end;

    frmRQBillEdit := TfrmRQBillEdit.Create(Application, dsView);
    try
      frmRQBillEdit.RQBillObj := TempRQBill.getObject(billCode);
      frmRQBillEdit.ShowModal;
    finally
      frmRQBillEdit.Free;
      frmRQBillEdit:=nil;
    end;
  end;
  // END -------------- tsRQBill

  // -------------- tsOwnProduction
  if pcEstimateItms.ActivePage = tsOwnProduction then
  begin
    try
      ObjCode := StrToInt(sgOwnProduction.Cells[0, sgOwnProduction.Row]);
    except
      on EConvertError do Exit;
    end;

    frmViewPlan := TfrmENPlanWorkEdit.Create(Application, dsView);
    try
      TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
      frmViewPlan.ENPlanWorkObj := ENPlanWork.Create;
      frmViewPlan.ENPlanWorkObj := TempENPlanWork.getObject(ObjCode);

      //frmViewPlan.Caption := 'Пов''язаний план';
      frmViewPlan.ShowModal;
    finally
      frmViewPlan.Free;
      frmViewPlan := nil;
    end;
  end;
  // END -------------- tsOwnProduction
end;


procedure TfrmENEstimateItemEdit.actViewPlanPayExecute(Sender: TObject);
Var TempENEstimateItemPlanPay: ENEstimateItemPlanPayControllerSoapPort;
begin
  TempENEstimateItemPlanPay := HTTPRIOENEstimateItemPlanPay as ENEstimateItemPlanPayControllerSoapPort;

  try
    ENEstimateItemPlanPayObj := TempENEstimateItemPlanPay.getObject(StrToInt(sgENEstimateItemPlanPay.Cells[0, sgENEstimateItemPlanPay.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENEstimateItemPlanPayEdit := TfrmENEstimateItemPlanPayEdit.Create(Application, dsView);
  try
    frmENEstimateItemPlanPayEdit.ShowModal;
  finally
    frmENEstimateItemPlanPayEdit.Free;
    frmENEstimateItemPlanPayEdit := nil;
  end;
end;

procedure TfrmENEstimateItemEdit.actRQOrderItemViewExecute(
  Sender: TObject);
Var
 TempRQOrderItem: RQOrderItemControllerSoapPort;
 //ObjCode: Integer;
begin
   TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
   try
     RQOrderItemObj := TempRQOrderItem.getObject(StrToInt(sgRQOrderItem.Cells[0,sgRQOrderItem.Row]));
   except
     on EConvertError do Exit;
   end;
   frmRQOrderItemEdit:=TfrmRQOrderItemEdit.Create(Application, dsView);
   try
     frmRQOrderItemEdit.orderKindCode := LOW_INT; //RQOrderObj.kindRef.code;
     frmRQOrderItemEdit.ShowModal;
   finally
     frmRQOrderItemEdit.Free;
     frmRQOrderItemEdit:=nil;
   end;
end;

procedure TfrmENEstimateItemEdit.FormCreate(Sender: TObject);
begin
  inherited;

  isForClosedPlan := False;

  DismountFromEstimate := LOW_INT;
  finMaterialParentCode := LOW_INT;

  divCode4Order := '';
  divName4Order := '';

  nn := '';
end;

procedure TfrmENEstimateItemEdit.actInsertPlanPayExecute(Sender: TObject);
begin
  ENEstimateItemPlanPayObj := ENEstimateItemPlanPay.Create;
  try
    ENEstimateItemPlanPayObj.estimateItemRef := ENEstimateItemRef.Create;
    ENEstimateItemPlanPayObj.estimateItemRef.code := ENEstimateItemObj.code;

    frmENEstimateItemPlanPayEdit := TfrmENEstimateItemPlanPayEdit.Create(Application, dsInsert);
    try
      if frmENEstimateItemPlanPayEdit.ShowModal = mrOk then
      begin
        if ENEstimateItemPlanPayObj <> nil then
          UpdatePlanPayList;
      end;
    finally
      frmENEstimateItemPlanPayEdit.Free;
      frmENEstimateItemPlanPayEdit := nil;
    end;
  finally
    ENEstimateItemPlanPayObj.Free;
  end;
end;

procedure TfrmENEstimateItemEdit.actMarkDeleteExecute(Sender: TObject);
Var TempMarkEstimate: ENMarkEstimateControllerSoapPort;
  ObjCode: Integer;
begin

 TempMarkEstimate := HTTPRIOMarkEstimate as ENMarkEstimateControllerSoapPort;
   try
     ObjCode := StrToInt(sgMarks.Cells[0,sgMarks.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Зв_язок меркерів з матеріалами на планах) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempMarkEstimate.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENEstimateItemEdit.spbOSSelectClick(Sender: TObject);
var
  frmTMatherialShow: TfrmTMaterialShow;
  fMaterial: TMaterialFilter;
begin
  inherited;
    fMaterial := TMaterialFilter.Create;
    SetNullIntProps(fMaterial);
    SetNullXSProps(fMaterial);


    //fMaterial.conditionSQL := 'TMATHERIAL.STATUS = ''A''';
    fMaterial.status := 'A';
    fMaterial.orderBySQL :=  'TMATHERIAL.NAME';

    frmTMatherialShow := TfrmTMaterialShow.Create(Application, fmNormal, fMaterial);
    try
      frmTMatherialShow.ShowFilter := true;

      with frmTMatherialShow do
        if ShowModal = mrOk then
        begin
          try
            edtNomeclature.Text := GetReturnValue(sgTMaterial,3) + ' ном.номер ' + GetReturnValue(sgTMaterial,1);
            edtNomenclatureCode.Text := GetReturnValue(sgTMaterial,0);
            nn := GetReturnValue(sgTMaterial,1);
            if edtAccount.Text = '' then edtAccount.Text := GetReturnValue(sgTMaterial, 2);
            if edtPrice.Text = '' then edtPrice.Text := GetReturnValue(sgTMaterial, 6);
          except
            on EConvertError do Exit;
          end;
        end;
    finally
      frmTMatherialShow.Free;
    end;

end;

procedure TfrmENEstimateItemEdit.spbNomenclatureClearClick(
  Sender: TObject);
begin
  inherited;
  edtNomeclature.Text := '';
  edtNomenclatureCode.Text := '';
  nn := '';
  edtAccount.Text := '';
end;

procedure TfrmENEstimateItemEdit.chbIsCreateObjectClick(Sender: TObject);
begin
  inherited;
  
  if chbIsCreateObject.Checked then
  begin
        if Application.MessageBox(PChar('Ви дійсно бажаєте додати об_ект "Обладнання у Ремонті" для передачі у ремонт ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2) <> IDOK then
        begin
            chbIsCreateObject.Checked := False;
        end;
  end;

end;


procedure TfrmENEstimateItemEdit.chkPrihodClick(Sender: TObject);
begin
  inherited;
  pcEstimateItmsChange(Sender);
end;


procedure TfrmENEstimateItemEdit.btnLinkWriteOffMaterialClick(
  Sender: TObject);
var
  frmEnEstimateitemShow: TfrmEnEstimateitemShow;
  //TempENEstimateItem: ENEstimateItemControllerSoapPort;
  //ENEstimateItemList: ENEstimateItemShortList;
  fLinkEstimate: ENEstimateItemFilter;

  TempENPlanWork: ENPlanWorkControllerSoapPort;
  plan: ENPlanWork;

  finMatFilter: FINMaterialsFilter;
  frmFINMaterialsShow: TfrmFINMaterialsShow;
begin
  if ENPlanWorkCode <= 0 then
    raise Exception.Create('Невідомий план!');

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  plan := TempENPlanWork.getObject(ENPlanWorkCode);

  // Для списания средств защиты
  if plan.typeRef.code = ENPLANWORKTYPE_WRITEOFF_PROTECTION then
  begin

    fLinkEstimate := ENEstimateItemFilter.Create;
    SetNullIntProps(fLinkEstimate);
    SetNullXSProps(fLinkEstimate);

    if  fLinkEstimate.planRef = nil then
    fLinkEstimate.planRef :=  ENPlanWorkRef.Create;
    ///// 05.12.11
    // fLinkEstimate.planRef.code := frmENPlanWriteOffProtectionEdit.ENPlanWorkObj.code;
    fLinkEstimate.planRef.code := ENPlanWorkCode; //ENEstimateItemObj.planRef.code;
    /////
    fLinkEstimate.kindRef:= ENEstimateItemKindRef.Create;
    fLinkEstimate.kindRef.code := ENESTIMATEITEMKIND_MATERIALS;


    frmEnEstimateitemShow := TfrmEnEstimateitemShow.Create(Application, fmNormal, fLinkEstimate);

     try
        DisableActions([frmEnEstimateitemShow.actInsert, frmEnEstimateitemShow.actEdit, frmEnEstimateitemShow.actDelete,
                    frmEnEstimateitemShow.actNoFilter, frmEnEstimateitemShow.actFilter, frmEnEstimateitemShow.actView , frmEnEstimateitemShow.actUpdate]);
      with frmEnEstimateitemShow do
        if ShowModal = mrOk then
        begin
          try
            edtLinkWriteOffMaterial.Text := GetReturnValue(sgENEstimateItem,1);
            DismountFromEstimate := StrToInt(GetReturnValue(sgENEstimateItem,0));
          except
            on EConvertError do Exit;
          end;
        end;
    finally
      frmEnEstimateitemShow.Free;
    end;

  end // if plan.typeRef.code = ENPLANWORKTYPE_WRITEOFF_PROTECTION

  // Для списания всех остальных МБП и МНМА
  else if (plan.stateRef.code in [ENPLANWORKSTATE_MATERIALS_MBP
                                  , ENPLANWORKSTATE_MATERIALS_MBP_INSTRUMENTS
                                  , ENPLANWORKSTATE_MATERIALS_MNMA
                                  , ENPLANWORKSTATE_MATERIALS_TMC]) then
  begin
    finMatFilter := FINMaterialsFilter.Create;
    SetNullIntProps(finMatFilter);
    SetNullXSProps(finMatFilter);

    finMatFilter.statusRef := FINMaterialsStatusRef.Create;
    finMatFilter.statusRef.code := FINMATERIALSSTATUS_GOOD;
    finMatFilter.conditionSQL :=
      ' finmaterials.estimateitemrefcode in ' +
      ' (select ei.code from enestimateitem ei ' +
      '   where ei.planrefcode = ' + IntToStr(ENPlanWorkCode) +
      '     and ei.kindrefcode = ' + IntToStr(ENESTIMATEITEMKIND_MATERIALS) + ')';

    frmFINMaterialsShow := TfrmFINMaterialsShow.Create(Application, fmNormal, finMatFilter);
    try
      DisableActions([frmFINMaterialsShow.actView, frmFINMaterialsShow.actInsert,
                      frmFINMaterialsShow.actEdit, frmFINMaterialsShow.actDelete,
                      frmFINMaterialsShow.actNoFilter, frmFINMaterialsShow.actFilter]);
      with frmFINMaterialsShow do
        if ShowModal = mrOk then
        begin
          try
            edtLinkWriteOffMaterial.Text := GetReturnValue(sgFINMaterials, 2) + ' ' + GetReturnValue(sgFINMaterials, 1);
            finMaterialParentCode := StrToInt(GetReturnValue(sgFINMaterials, 0));
          except
            on EConvertError do Exit;
          end;
        end;
    finally
      frmFINMaterialsShow.Free;
    end;

  end;
end;

procedure TfrmENEstimateItemEdit.btnClearLinkWriteOffMaterialClick(
  Sender: TObject);
begin
  inherited;

  edtLinkWriteOffMaterial.Text := '';
  DismountFromEstimate := LOW_INT;
  finMaterialParentCode := LOW_INT;
end;


procedure TfrmENEstimateItemEdit.UpdateItemGrid();
var
  i : Integer;
  TempRQFKOrderItem : RQFKOrderItemControllerSoapPort;
  RQFKOrderItemList : RQFKOrderItemShortList;
  itemFilter : RQFKOrderItemFilter;
  orderCode, itemLastCount : Integer;
begin
  ClearGrid(sgRQFKOrderItem);

  try
    orderCode := StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]);
  except
    on EConvertError do Exit;
  end;

  TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;

  itemfilter := RQFKOrderItemFilter.Create;
  SetNullIntProps(itemfilter);
  SetNullXSProps(itemfilter);
  itemFilter.fkOrderRef := RQFKOrderRef.Create;
  itemFilter.fkOrderRef.code := orderCode;

  RQFKOrderItemList := TempRQFKOrderItem.getScrollableFilteredList(itemFilter,0,-1);

  itemLastCount:=High(RQFKOrderItemList.list);

  if itemLastCount > -1 then
     sgRQFKOrderItem.RowCount:=itemLastCount+2
  else
     sgRQFKOrderItem.RowCount:=2;

   with sgRQFKOrderItem do
    for i:=0 to itemLastCount do
      begin
        // Application.ProcessMessages;
        if RQFKOrderItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQFKOrderItemList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1, i+1] := RQFKOrderItemList.list[i].materialName;
        Cells[2, i+1] := RQFKOrderItemList.list[i].measurementName;
        Cells[3, i+1] := RQFKOrderItemList.list[i].nomenclatureNum;
        Cells[4, i+1] := RQFKOrderItemList.list[i].nomenclatureName;
        Cells[5, i+1] := RQFKOrderItemList.list[i].nomenclatureUnitName;
        if RQFKOrderItemList.list[i].countGen = nil then
          Cells[6,i+1] := ''
        else
        begin
          Cells[6,i+1] := RQFKOrderItemList.list[i].countGen.DecimalString;
        end;

        if RQFKOrderItemList.list[i].priceWithoutNds = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := RQFKOrderItemList.list[i].priceWithoutNds.DecimalString;

        if RQFKOrderItemList.list[i].sumWithoutNds = nil then
          Cells[8,i+1] := ''
        else
        begin
          Cells[8,i+1] := RQFKOrderItemList.list[i].sumWithoutNds.DecimalString;
        end;

        if (RQFKOrderItemList.list[i].weight = nil) then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := RQFKOrderItemList.list[i].weight.DecimalString;

        Cells[10,i+1] := RQFKOrderItemList.list[i].fundingTypeStr;

        sgRQFKOrderItem.RowCount:=i+2;
      end;
   sgRQFKOrderItem.Row:=1;
end;


procedure TfrmENEstimateItemEdit.UpdateOwnProductionList;
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  linkedPlansList: ENPlanWorkShortList;
  linkedPlansFilterObj, ownProductionFilterObj: ENPlanWorkFilter;
  intCodesList, ownProductionArr: ENPlanWorkController.ArrayOfInteger;
  strCodesList: String;
  i, planCodeOwnProduction: Integer;
begin
  ClearGrid(sgOwnProduction);
  planCodeOwnProduction := LOW_INT;

  if DialogState = dsInsert then Exit;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  //// Ищем связанный план на изготовление
  ownProductionFilterObj := ENPlanWorkFilter.Create;
  SetNullIntProps(ownProductionFilterObj);
  SetNullXSProps(ownProductionFilterObj);

  ownProductionFilterObj.conditionSQL :=
      ' ENPLANWORK.CODE in ' +
      '   (select ep.planrefcode ' +
      '      from enestimateitem2plan ep ' +
      '     where ep.estimateitemrefcode = ' + IntToStr(ENEstimateItemObj.code) +
      '       and ep.typerefcode = ' + IntToStr(ENESTIMATEITEM2PLANTYPE_OWN_PRODUCTION) + ')';

  ownProductionArr := TempENPlanWork.getFilteredCodeArray(ownProductionFilterObj);

  if High(ownProductionArr) < 0 then Exit;

  planCodeOwnProduction := ownProductionArr[0];

  if planCodeOwnProduction = LOW_INT then Exit;
  /////

  ///// Если нашли связанный план на изготовление, выбираем все планы, связанные с ним
  // (по тому же принципу, как и на вкладке "Зв'язані плани" на форме редактирования планов)
  linkedPlansFilterObj := ENPlanWorkFilter.Create;
  SetNullIntProps(linkedPlansFilterObj);
  SetNullXSProps(linkedPlansFilterObj);

  linkedPlansFilterObj.conditionSQL := 'code in (' +
    ' select plannewrefcode from enplancorrecthistory where planrefcode = '
        + IntToStr(planCodeOwnProduction) + // 1. Все дочерние. Сработает, если это - "корневой" план
    ' union ' +
    ' select ' + IntToStr(planCodeOwnProduction) + ' as planrefcode ' + // 2. Добавим себя
    ' union ' +
    ' select planrefcode from enplancorrecthistory where plannewrefcode = '
        + IntToStr(planCodeOwnProduction) + // 3. Присоедим "корневой", если это дочерний план
    ' union ' +
    ' select plannewrefcode from enplancorrecthistory where planrefcode in '+
    ' (select planrefcode from enplancorrecthistory where plannewrefcode = '
        + IntToStr(planCodeOwnProduction) + ')' + // 4. Все планы с таким же "корневым"
    ' )';

  intCodesList := TempENPlanWork.getFilteredCodeArray(linkedPlansFilterObj);

  strCodesList := '';

  for i := 0 to High(intCodesList) do
  begin
    if strCodesList <> '' then strCodesList := strCodesList + ', ';
    strCodesList := strCodesList + IntToStr(intCodesList[i]);
  end;

  if strCodesList <> '' then
  begin // если есть связанные планы
    linkedPlansFilterObj.conditionSQL := 'code in (' + strCodesList + ')';
    linkedPlansFilterObj.orderBySQL := ' kindcode, datestart, code';

    linkedPlansList := TempENPlanWork.getScrollableFilteredList(linkedPlansFilterObj, 0, -1);

    if High(linkedPlansList.list) > -1 then
       sgOwnProduction.RowCount := High(linkedPlansList.list) + 2
    else
       sgOwnProduction.RowCount := 2;

    with sgOwnProduction do
      for i := 0 to High(linkedPlansList.list) do
      begin
        Application.ProcessMessages;
        if linkedPlansList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(linkedPlansList.list[i].code)
        else
          Cells[0,i+1] := '';
        if linkedPlansList.list[i].yearGen <> Low(Integer) then
          Cells[1,i+1] := IntToStr(linkedPlansList.list[i].yearGen)
        else
          Cells[1,i+1] := '';
        if linkedPlansList.list[i].monthGen <> Low(Integer) then
          Cells[2,i+1] := MonthesNames[linkedPlansList.list[i].monthGen]
        else
          Cells[2,i+1] := '';
        if linkedPlansList.list[i].dateStart = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(linkedPlansList.list[i].dateStart);
        Cells[4,i+1] := linkedPlansList.list[i].kindName;
        Cells[5,i+1] := linkedPlansList.list[i].statusName;
        Cells[6,i+1] := '';
        if linkedPlansList.list[i].yearOriginal > 0 then
        begin
          if linkedPlansList.list[i].monthOriginal > 0 then
            Cells[6,i+1] := MonthesNames[linkedPlansList.list[i].monthOriginal] + ' ' +
                            IntToStr(linkedPlansList.list[i].yearOriginal);
        end;
        Cells[7,i+1] := linkedPlansList.list[i].workOrderNumber;
        Cells[8,i+1] := linkedPlansList.list[i].userGen;
        if linkedPlansList.list[i].dateEdit = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := XSDate2String(linkedPlansList.list[i].dateEdit);
      end;

    sgOwnProduction.Row := 1;

  end; // если были связанные планы
  /////
end;

end.
