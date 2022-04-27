unit EditRQFKOrder;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
 	  EnergyproController, EnergyproController2, RQFKOrderController, ExtCtrls,
    TB2Item, TB2Dock, TB2Toolbar, RQFKOrder2FinServicesController, FKProvObjectController ,SCInvoiceController,
    ENServicesObjectController, AdvObj, RQFKOrder2FKOrderController,
    RQFKOrder2FKOrderTypeController, RQOrderController, RQBillController, DFDocSignerController,
    User2StaffingController;

type
  TfrmRQFKOrderEdit = class(TDialogForm)
  
    lblCode : TLabel;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;


  HTTPRIORQFKOrder: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    pcRQFKOrder: TPageControl;
    tsRQFKOrder: TTabSheet;
    GroupBox1: TGroupBox;
    lblNumberDoc: TLabel;
    lblDateGen: TLabel;
    edtNumberDoc: TEdit;
    edtDateGen: TDateTimePicker;
    gbAddInfo: TGroupBox;
    spbRQFKOrderKindKind: TSpeedButton;
    lblRQFKOrderKindKindName: TLabel;
    spbRQFKOrderStatusStatus: TSpeedButton;
    lblRQFKOrderStatusStatusName: TLabel;
    edtRQFKOrderKindKindName: TEdit;
    edtRQFKOrderStatusStatusName: TEdit;
    tsRQFKOrderItems: TTabSheet;
    sgRQFKOrderItem: TAdvStringGrid;
    HTTPRIORQFKOrderItem: THTTPRIO;
    ImageList1: TImageList;
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
    gbWarrant: TGroupBox;
    lblWarrantDate: TLabel;
    lblWarrantNumber: TLabel;
    edtWarrantNumber: TEdit;
    edtWarrantDate: TDateTimePicker;
    lblWarrantFIO: TLabel;
    gbMOLOut: TGroupBox;
    lblMolCode: TLabel;
    edtMolOutCode: TEdit;
    spbPlanMOL: TSpeedButton;
    edtMolOutName: TEdit;
    lblMolName: TLabel;
    gbMOLIn: TGroupBox;
    Label1: TLabel;
    edtMOLInCode: TEdit;
    spbMOLIn: TSpeedButton;
    Label2: TLabel;
    edtMOLInName: TEdit;
    lblENDepartmentDepartmentName: TLabel;
    edtENDepartmentDepartmentName: TEdit;
    spbENDepartmentDepartment: TSpeedButton;
    gbExpeditor: TGroupBox;
    lblExpeditorCode: TLabel;
    lblExpeditorName: TLabel;
    edtExpeditorName: TEdit;
    edtExpeditorCode: TEdit;
    spbExpeditor: TSpeedButton;
    btnPrintOrder: TButton;
    gbOrg: TGroupBox;
    lblRQOrgOrgName: TLabel;
    edtRQOrgOrgName: TEdit;
    spbRQOrgOrg: TSpeedButton;
    edtWarrantFIO_: TComboBox;
    pnlTotal: TPanel;
    pnlTotalSum: TPanel;
    lblTotal: TLabel;
    gbDocInfo: TGroupBox;
    lblSumWithoutNds: TLabel;
    edtSumWithoutNds: TEdit;
    lblSumNds: TLabel;
    edtSumNds: TEdit;
    edtSum: TEdit;
    lblNdsPecent: TLabel;
    edtNdsPercent: TComboBox;
    HTTPRIORQFKOrderItem2ENEstimateItem: THTTPRIO;
    gbFINMaterials: TGroupBox;
    sgENFINMaterials: TAdvStringGrid;
    HTTPRIOFINMaterials: THTTPRIO;
    tbActions: TTBToolbar;
    TBItem7: TTBItem;
    TBItem46: TTBItem;
    actFINUpdate: TAction;
    actFINDelete: TAction;
    gbShipment: TGroupBox;
    edtDateShipment: TDateTimePicker;
    lblDateShipment: TLabel;
    lblTKTransportRealTransportRealName: TLabel;
    edtTKTransportRealTransportRealName: TEdit;
    spbTKTransportRealTransportReal: TSpeedButton;
    edtGosNumber: TEdit;
    spbTKTransportRealClear: TSpeedButton;
    edtCode: TEdit;
    Label3: TLabel;
    lblTKAccountingTypeName: TLabel;
    cbTKAccountingType: TComboBox;
    edtCommentGen: TMemo;
    lblCommentGen: TLabel;
    sgSCCounter: TAdvStringGrid;
    HTTPRIOSCCounter: THTTPRIO;
    actPrintOZ: TAction;
    tbPrintOZ: TToolButton;
    addFromBill: TAction;
    tbAddFromBill: TToolButton;
    tsRQFKOrderOut: TTabSheet;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    ToolButton9: TToolButton;
    sgRQFKOrder: TAdvStringGrid;
    lblAccount: TLabel;
    edtAccount: TEdit;
    spbAccount: TSpeedButton;
    HTTPRIOSCInvoice: THTTPRIO;
    HTTPRIORQFKOrder2FinServices: THTTPRIO;
    tsFinServices: TTabSheet;
    gbFinServices: TGroupBox;
    tsFKOrderPostings: TTabSheet;
    gbFKOrderPostings: TGroupBox;
    sgFKOrderProvs: TAdvStringGrid;
    sgFKProvErrorsDetailed: TAdvStringGrid;
    btnDeleteFromFK: TButton;
    btnMoveToFK: TButton;
    btnGetPostingsList: TButton;
    btnDeleteProv: TButton;
    HTTPRIOFKProvObject: THTTPRIO;
    gbBankingServices: TGroupBox;
    lblBankingServices: TLabel;
    cbBankingServices: TComboBox;
    lblDatePosting: TLabel;
    edtDatePosting: TDateTimePicker;
    btnChangeDatePosting: TButton;
    btnPrintOrderTwoUnits: TButton;
    HTTPRIOENDepartment: THTTPRIO;
    lblDescription: TLabel;
    edtDescription: TEdit;
    spbDescription: TSpeedButton;
    HTTPRIORQFKBSDescription: THTTPRIO;
    lblDatePostings: TLabel;
    edtDatePostings: TDateTimePicker;
    HTTPRIOENMol: THTTPRIO;
    lblPercentProfits: TLabel;
    edtPercentProfits: TEdit;
    actRemoveFromTransportRoutes: TAction;
    ToolButton3: TToolButton;
    gbFinServicesGeneral: TGroupBox;
    gbIncludeCosts: TGroupBox;
    lblDepartment: TLabel;
    spbDepartment: TSpeedButton;
    spbDepartmentClear: TSpeedButton;
    edtDepartment: TEdit;
    gbKau1476: TGroupBox;
    spbKau1476: TSpeedButton;
    spbKau1476Clear: TSpeedButton;
    edtKau1476: TEdit;
    edtKauName1476: TEdit;
    cbIsTax: TComboBox;
    lblIsTax: TLabel;
    gbTaxDetails: TGroupBox;
    lblTaxInvoiceNumber: TLabel;
    lblTaxInvoiceDateGen: TLabel;
    edtTaxInvoiceNumber: TEdit;
    edtTaxInvoiceDateGen: TDateTimePicker;
    lblTaxBook: TLabel;
    edtTaxBookId: TEdit;
    edtTaxBook: TEdit;
    lblCostItem: TLabel;
    edtCostItem: TEdit;
    edtCostItemId: TEdit;
    lblTaxRate: TLabel;
    edtTaxRateId: TEdit;
    edtTaxRateName: TEdit;
    lblAccountingGroup: TLabel;
    edtAccountingGroupId: TEdit;
    edtAccountingGroup: TEdit;
    spbTaxBook: TSpeedButton;
    spbTaxBookClear: TSpeedButton;
    spbCostItem: TSpeedButton;
    spbCostItemClear: TSpeedButton;
    spbTaxRate: TSpeedButton;
    spbTaxRateClear: TSpeedButton;
    spbAccountingGroup: TSpeedButton;
    spbAccountingGroupClear: TSpeedButton;
    edtTaxRate: TEdit;
    gbTransferTax: TGroupBox;
    cbIsTransferTax: TCheckBox;
    Label4: TLabel;
    cbTaxDocType: TComboBox;
    HTTPRIOv_Trade_Doc_Type: THTTPRIO;
    cbIsRefinementTax: TCheckBox;
    spbGetTaxNumber: TSpeedButton;
    lblRQStorage: TLabel;
    edtRQStorage: TEdit;
    spbRQStorage: TSpeedButton;
    HTTPRIORQStorage: THTTPRIO;
    HTTPRIORQStorage2ENMol: THTTPRIO;
    tbSaveStorageZone: TToolButton;
    actSaveStorageZone: TAction;
    actEditOSData: TAction;
    N5: TMenuItem;
    N9: TMenuItem;
    HTTPRIORQFKOrderItem2OSData: THTTPRIO;
    actViewOSData: TAction;
    N10: TMenuItem;
    actSelectAll: TAction;
    actClearAll: TAction;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    pnlOSSum: TPanel;
    pnlOSCount: TPanel;
    lblOSCount: TLabel;
    lblOSSum: TLabel;
    chbIsPalletized: TCheckBox;
    edtPalletNumber: TEdit;
    actAddZoneChangingFromOrder: TAction;
    N14: TMenuItem;
    N15: TMenuItem;
    tsServicesFromSide: TTabSheet;
    ToolBar3: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton10: TToolButton;
    sgActsServicesFS: TAdvStringGrid;
    HTTPRIORQFKOrder2FKOrder: THTTPRIO;
    chbIsByOrder: TCheckBox;
    edtOrderInfo: TEdit;
    tsRQOrder: TTabSheet;
    ToolBar4: TToolBar;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    sgRQOrder: TAdvStringGrid;
    HTTPRIORQOrder: THTTPRIO;
    tsRQBill: TTabSheet;
    TBToolbar3: TTBToolbar;
    TBItem10: TTBItem;
    TBItem11: TTBItem;
    sgRQBill: TAdvStringGrid;
    HTTPRIORQBill: THTTPRIO;
    gbKau2494: TGroupBox;
    spbKau2494: TSpeedButton;
    spbKau2494Clear: TSpeedButton;
    edtKau2494: TEdit;
    edtKauName2494: TEdit;
    edtDateDelivery: TDateTimePicker;
    lblDateDelivery: TLabel;
    sgSCSeal: TAdvStringGrid;
    actSetSealInfo: TAction;
    mniN16: TMenuItem;
    actSetSealInfo1: TMenuItem;
    actDivideItem: TAction;
    actDivideItem1: TMenuItem;
    HTTPRIOSCSeal: THTTPRIO;
    HTTPRIOSCOrder: THTTPRIO;
    GroupBox3: TGroupBox;
    spbDimensionPurpose30900: TSpeedButton;
    spbDimensionPurpose30900_Clear: TSpeedButton;
    edtDimensionPurposeNum30900: TEdit;
    edtDescriptDimensionPurpose30900: TEdit;
    GroupBox2: TGroupBox;
    spbAssetObject: TSpeedButton;
    spbAssetObjectClear: TSpeedButton;
    edtAssetAccount: TEdit;
    edtAssetName: TEdit;
    sgAXLedgerTrans: TAdvStringGrid;
    HTTPRIOAXLedgerTrans: THTTPRIO;
    HTTPRIORQFKOrder2Prov: THTTPRIO;
    HTTPRIORQActCounterExpertise: THTTPRIO;
    tsProvodki: TTabSheet;
    gbProvodki: TGroupBox;
    sgProvodki: TAdvStringGrid;
    btnChangeDatePostings: TButton;
    HTTPRIOENEstimateItem: THTTPRIO;
    spbRQFKOrderType: TSpeedButton;
    edtRQFKOrderTypeName: TEdit;
    lblRQFKOrderType: TLabel;
    tsDFDoc: TTabSheet;
    actClearDFDocSigners: TAction;
    gbDFDocSigners: TGroupBox;
    gbDFDocs: TGroupBox;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    sgDFDocSigners: TAdvStringGrid;
    ToolBar18: TToolBar;
    ToolButton95: TToolButton;
    ToolButton101: TToolButton;
    sgDFDocs: TAdvStringGrid;
    actViewDFDoc: TAction;
    actUpdateDFDocs: TAction;
    spbWarrantNumber: TSpeedButton;
    edtWarrantFIO: TEdit;
    lblGeoDepartment: TLabel;
    edtGeoDepartment: TEdit;
    spbGeoDepartment: TSpeedButton;
    HTTPRIOENGeographicDepartment: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbRQFKOrderKindKindClick(Sender : TObject);
  procedure spbRQFKOrderStatusStatusClick(Sender : TObject);
  procedure spbRQOrgOrgClick(Sender : TObject);
    procedure spbPlanMOLClick(Sender: TObject);
    procedure pcRQFKOrderChange(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure spbMOLInClick(Sender: TObject);
    procedure spbENDepartmentDepartmentClick(Sender: TObject);
    procedure spbExpeditorClick(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure btnPrintOrderClick(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure edtSumWithoutNdsChange(Sender: TObject);
    procedure removeItem(itemCode : Integer; orderKind : Integer);
    procedure actUpdateExecute(Sender: TObject);
    procedure updateFINMaterialsGrid();
    procedure sgRQFKOrderItemClick(Sender: TObject);
    procedure actFINUpdateExecute(Sender: TObject);
    procedure actFINDeleteExecute(Sender: TObject);
    procedure spbTKTransportRealTransportRealClick(Sender: TObject);
    procedure spbTKTransportRealClearClick(Sender: TObject);
    procedure edtDateGenChange(Sender: TObject);

    procedure updateSCCounterGrid();
    procedure  updateSCSealGrid();
    procedure actPrintOZExecute(Sender: TObject);
    procedure printingOZ(fkItemCode : Integer; scOrderCode : Integer);
    procedure tbAddFromBillClick(Sender: TObject);
    procedure spbAccountClick(Sender: TObject);
    procedure spbKau1476Click(Sender: TObject);
    procedure spbKau1476ClearClick(Sender: TObject);
    procedure getFKOrderPostingsList(fkOrderCode: Integer);
    procedure getStatus(fkOrderCode: Integer);
    procedure btnDeleteFromFKClick(Sender: TObject);
    procedure btnGetPostingsListClick(Sender: TObject);
    procedure btnMoveToFKClick(Sender: TObject);
    procedure changeGridDescription(isError: Boolean);
    procedure sgFKOrderProvsClick(Sender: TObject);
    procedure btnChangeDatePostingClick(Sender: TObject);
    procedure btnPrintOrderTwoUnitsClick(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure spbDescriptionClick(Sender: TObject);
    procedure spbDepartmentClearClick(Sender: TObject);
    procedure actRemoveFromTransportRoutesExecute(Sender: TObject);
    procedure spbTaxBookClick(Sender: TObject);
    procedure spbTaxBookClearClick(Sender: TObject);
    procedure spbCostItemClick(Sender: TObject);
    procedure spbCostItemClearClick(Sender: TObject);
    procedure spbTaxRateClick(Sender: TObject);
    procedure spbTaxRateClearClick(Sender: TObject);
    procedure spbAccountingGroupClick(Sender: TObject);
    procedure spbAccountingGroupClearClick(Sender: TObject);
    procedure cbIsTransferTaxClick(Sender: TObject);
    procedure spbGetTaxNumberClick(Sender: TObject);
    procedure spbRQStorageClick(Sender: TObject);
    procedure cbTKAccountingTypeChange(Sender: TObject);
    procedure actSaveStorageZoneExecute(Sender: TObject);
    procedure actEditOSDataExecute(Sender: TObject);
    procedure actViewOSDataExecute(Sender: TObject);
    procedure actSelectAllExecute(Sender: TObject);
    procedure actClearAllExecute(Sender: TObject);
    procedure sgRQFKOrderItemCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure chbIsPalletizedClick(Sender: TObject);
    procedure actAddZoneChangingFromOrderExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure edtNdsPercentChange(
      Sender: TObject);
    procedure chbIsByOrderClick(Sender: TObject);
    procedure spbKau2494Click(Sender: TObject);
    procedure spbKau2494ClearClick(Sender: TObject);
    procedure sgSCCounterTopLeftChanged(Sender: TObject);
    procedure actSetSealInfoExecute(Sender: TObject);
    procedure actDivideItemExecute(Sender: TObject);
    procedure spbDimensionPurpose30900Click(Sender: TObject);
    procedure spbDimensionPurpose30900_ClearClick(Sender: TObject);
    procedure spbAssetObjectClick(Sender: TObject);
    procedure spbAssetObjectClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
	procedure updateProvodkiGrid;
    procedure btnChangeDatePostingsClick(Sender: TObject);
    procedure spbRQFKOrderTypeClick(Sender: TObject);
    procedure actClearDFDocSignersExecute(Sender: TObject);
    procedure actUpdateDFDocsExecute(Sender: TObject);
    procedure actViewDFDocExecute(Sender: TObject);
    procedure spbWarrantNumberClick(Sender: TObject);
    procedure spbGeoDepartmentClick(Sender: TObject);

  private
    { Private declarations }
    selectedItemIndex: Integer;
    isStorageOrMOLChanged: Boolean;
    procedure RecalcOSLines();
    // Функция подходит ли ордер для палет, если да то открываются некоторые поля
    function isRQFKOrderForPallet(obj : RQFKOrder) : Boolean;
    // Функция подходит ли ордер для работы с зонами хранения, если да то открываются некоторые поля
    function isRQFKOrderForStorage(obj : RQFKOrder) : Boolean;
{   Нужно ли жесткие проверки привязки склада на ордере True - подходит, False - не подходит }
    function isRQFKOrderForStorageSeriously(obj : RQFKOrder) : Boolean;
    function isRQFKOrderFromRQActCounterExpertise(obj : RQFKOrder) : Boolean;

    procedure getPostingsListAX(servicesObjectCode: Integer);
    function hasZabalansCounters() : Boolean;
    function hasCustomerMaterials : Boolean;
    {Переподтягивает ордер из базы данных и отображает его на форме}
    procedure RefreshRQFKOrder;

    procedure initDFDocsTab;
    procedure initDFDocSignersGrid(setDefaultSigners: Boolean = true);
    procedure loadDFDocSigners;
    function getDFDocSignersForSaving(var dfDocSigners: ArrayOfDFDocSigner): Boolean;
    procedure updateDFDocs;
  public
    { Public declarations }
    RQFKOrderObj : RQFKOrder;
    invoiceCode : Integer;
    provResult: FKProvResult;
    servicesObject : ENServicesObject;
    isAllocationList : Boolean;
    procedure UpdateGrid(Sender: TObject);
    procedure printOrder; overload;
    procedure printOrder(fkOrderCode: Integer); overload;
  end;

procedure printReportRQFKOrderActCustomerMaterialsTransfer(fkOrder : RQFKOrder);

var
  frmRQFKOrderEdit: TfrmRQFKOrderEdit;
  // RQFKOrderObj: RQFKOrder;
  RQFKOrder2FinObj : RQFKOrder2FinServices;

  RQFKOrderItemHeaders: array [1..14] of String =
        ( 'Код'
          ,'Норм. матеріал'
          ,'Норм. од.виміру'
          ,'Ном. номер матеріалу'
          ,'Назва матеріалу'
          ,'Од.виміру'
          ,'кількість'
          ,'ціна'
          ,'Сума'
          ,''
          ,'Вага, кг'
          ,''
          ,'Місце зберігання'
          ,'Тип фінансування'
        );

    RQFKOrderItemPrihodOSHeaders: array [1..14] of String =
        ( 'Код'
          ,'Норм. матеріал'
          ,'Норм. од.виміру'
          ,'Ном. номер матеріалу'
          ,'Назва матеріалу'
          ,'Од.виміру'
          ,'кількість'
          ,'ціна'
          ,'Сума'
          ,'Сума ПДВ'
          ,'Вага, кг'
          ,''
          ,'Місце зберігання'
          ,'Тип фінансування'
        );

   RQFKOrderItemSealHeaders: array [1..14] of String =
        ( 'Код'
          ,'Норм. матеріал'
          ,'Норм. од.виміру'
          ,''
          ,'Назва матеріалу'
          ,'Серія та номер'
          ,'кількість'
          ,'ціна'
          ,'Сума'
          ,'Сума ПДВ'
          ,'Вага, кг'
          ,''
          ,'Місце зберігання'
          ,'Тип фінансування'
        );

    RQFKOrderItemBufetHeaders: array [1..13] of String =
        ( 'Код'
          ,'Норм. матеріал'
          ,'Норм. од.виміру'
          ,'Ном. номер матеріалу'
          ,'Назва матеріалу'
          ,'Од.виміру'
          ,'кількість'
          ,'ціна'
          ,'Сума'
          ,''
          ,'Вага, кг'
          ,''
          ,'Строк реалізації'
        );

  FINMaterialsShortHeaders: array [1..16] of String =
        ( 'Код'
          ,'Матеріал'
          ,'Од. виміру'
          ,'Номенклатурний номер'
          ,'Кількість'
          ,'Ціна'
          ,'Вартість'
          ,'код,назва ЦФВ'
          ,'МОЛ'
          ,'Призначення залишку'
          ,'Постачальник'
          ,'Дата постачання'
          ,'Опис постачання'
          ,'код партії'
          //,'тип строки кошторису'
          ,'користувач, що вніс зміни'
          ,'дата останньої зміни'
        );

  SCCounterHeaders: array [1..16] of String =
        ( 'Код'
          ,'Інв. №'
          ,'Найменування'
          ,'Заводський №'
          ,'Рахунок'
          ,'Підрозділ'
          ,'Код МВО'
          ,'Дата приходу'
          ,'Дата випуску'
          ,'Дата повірки'
          ,'Вартість'
          ,'Код зі ScanCounters'
          ,'Тип лічильника'
          ,'№ наряду на встановлення'
          ,'Показники'
          ,'Дата останньої зміни'
        );

  SCSealHeaders: array [1..16] of String =
        ( 'Код'
          ,'Інв. №'
          ,'Найменування'
          ,'Заводський №'
          ,'Рахунок'
          ,'Підрозділ'
          ,'Код МВО'
          ,'Дата приходу'
          ,'Дата випуску'
          ,'Дата повірки'
          ,'Вартість'
          ,'Код зі ScanCounters'
          ,'Тип лічильника'
          ,'№ наряду на встановлення'
          ,'Показники'
          ,'Дата останньої зміни'
        );

  RQFKOrderHeaders: array [1..17] of String =
        ( 'Код'
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
          ,'Створив'
          ,'Дата ств.'
          ,'Змінив'
          ,'Дата зміни'

        );

  FKOrderBadProvHeaders: array [1..12] of String =
        ('Код'
         ,'Дата'
         ,'Цех (К)'
         ,'Счет (К)'
         ,'Субсчет (К)'
         ,'КАУ (К)'
         ,'Цех (Д)'
         ,'Счет (Д)'
         ,'Субсчет (Д)'
         ,'КАУ (Д)'
         ,'Сумма'
         ,'Примечание'
        );

  FKOrderProvErrorDetailedHeaders: array [1..2] of String =
        ('Код'
         ,'Ошибки'
        );


  RQFKOrderItemHeadersForWriteOff: array [1..4] of String =
        ( 'Код'
          ,'Норм. матеріал'
          ,'Рахунок'
          ,'Кількість'
        );

  ActsServicesFSHeaders: array [1..11] of String =
        ( 'Код'
          ,'Номер'
          ,'Дата документу'
          ,'Код постачальника'
          ,'Постачальник'
          ,'сума (без ПДВ)'
          ,'Статус'
          ,'Створив'
          ,'Дата ств.'
          ,'Змінив'
          ,'Дата зміни'
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

        AXLedgerTransHeaders: array [1..33] of String =
        ( 'Код'
          ,'Дата проводки'
          ,'Сумма '
          ,'Счет ГК'
          ,'"Подразделение"(Д)'
          ,'"Центр затрат"(Д)'
          ,'"Цель"(Д)'
          ,'"Счет"(Д)'
          ,'"договор"(Д)'
          ,'"цфо"(Д)'
          ,'"ФР"(Д)'
          ,'"ДДС"(Д)'
          ,'"Назначение"(Д) '
          ,'"Основание"(Д) '
          ,'"Документ-основание"(Д)'
          ,'"Основное средство"(Д)'
          ,'"Присоединение"(Д)'

          ,'Корр.счёт'
          ,'"Подразделение"(К)'
          ,'"Центр затрат"(К)'
          ,'"Цель"(К)'
          ,'"Счет"(К)'
          ,'"договор"(К)'
          ,'"цфо"(К)'
          ,'"ФР"(К)'
          ,'"ДДС"(К)'
          ,'"Назначение"(К) '
          ,'"Основание"(К) '
          ,'"Документ-основание"(К)'
          ,'"Основное средство"(К)'
          ,'"Присоединение"(К)'

          ,'Текст проводки'
          ,'Код операции'
        );

  sgSCCounterColCount, sgSCCounterLastCount: Integer;
  sgSCCounterLastRow: Integer = 1;

  sgSCSealColCount, sgSCSealLastCount: Integer;
  sgSCSealLastRow: Integer = 1;

implementation

uses
  ShowRQFKOrderKind
  ,RQFKOrderKindController
  ,ShowRQFKOrderStatus
  ,RQFKOrderStatusController
  ,ShowRQOrg
  ,RQOrgController
, ShowFINMol, FINMolController, RQFKOrderItemController, EditRQFKOrderItem,
  ShowENDepartment, ENDepartmentController, ENConsts,
  EditMaterialsRQFKOrderOut, DMReportsUnit, EditMaterialsIn,
  RQFKOrderItem2ENEstimateItemController
  ,FINMaterialsController
  ,FINMaterialsStatusController
  ,ShowTKtransportReal
  , TKTransportRealController
  , TKAccountingTypeController
  , EditMaterialsRQFKOrderOutSCCounter, SCCounterController,
  SCCounterKindController, EditBillItemInOrder, SCMolController, ShowSCMol,
  EditMaterialsRQFKOrderOutE2E, ShowFKAccount, FKAccountController,
  ShowKau, KauController, RQFKBankingServicesTypeController,
  ShowRQFKBSDescription, RQFKBSDescriptionController, ENMolController, ENMolTypeController,
  SOAPHTTPTrans, OSMolController, ShowOSMol, ShowOSPodr,
  ShowBookKind,
  ShowTrade_TaxWage,
  ShowAcc_Obj_Types,
  ShowExpenseItem,
  OSPodrController ,
  v_Trade_Doc_TypeController,
  ShowRQStorage,
  RQStorageController,
  RQStorage2ENMolController,
  RQStorageZoneController, ShowRQStorageZone
 , EditOSData, RQFKOrderItem2OSDataController,
  EditMaterialsRQFKOrderOSExpl
  , EditMaterialsRQFKOrderZoneChanging
  , ShowRQFKOrder, EditServicesIn
  , EditMaterialsRQFKOrderWithoutEstimates
  , EditRQOrder
  , EditScanningCounters, EditRQBill, EditSealInfo, EditItemDivider,
  EditMaterialsRQFKOrderOutSCSeal, SCSealController, SCOrderController,
  ShowAXDimensionsKS, AXDimensionsKSController, ShowAXRassetTable,
  AXRassetTableController, AXLedgerTransController, RQFKOrder2ProvController
  , RQActCounterExpertiseController, ENSettingsConsts, FinancialUtilsUnit
  , ENEstimateItemController, ShowRQFKOrderType, RQFKOrderTypeController,
  DFConsts, ShowENWarrant, ENWarrantController, ENWarrantTypeController, ShowDocumentManagement,
  ShowENGeographicDepartment, ENGeographicDepartmentController;

{uses  
    EnergyproController, EnergyproController2, RQFKOrderController  ;
}
{$R *.dfm}

procedure printReportRQFKOrderActCustomerMaterialsTransfer(fkOrder : RQFKOrder);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  if not Assigned(fkOrder) then Exit;


  SetLength(argNames, 2);
  SetLength(args, 2);

  argnames[0] := 'fkOrderCode';
  args[0] := IntToStr(fkOrder.code);

  argnames[1] := 'reportType';
  args[1] := IntToStr(2);

  reportName := '201109/ActTransferForServices/Act';
  makeReport(reportName, argNames, args, 'xls');
end;

procedure TfrmRQFKOrderEdit.RefreshRQFKOrder;
var
  TempRQFKOrderController : RQFKOrderControllerSoapPort;
  tempActivePage : TTabSheet;
begin
    if((not Assigned(RQFKOrderObj)) or (RQFKOrderObj.code = Low(Integer))) then Exit;
    TempRQFKOrderController := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
    RQFKOrderObj := TempRQFKOrderController.getObject(RQFKOrderObj.code);
    tempActivePage := pcRQFKOrder.ActivePage;
   	Self.FormShow(nil);
  	pcRQFKOrder.ActivePage := tempActivePage;
end;

procedure TfrmRQFKOrderEdit.updateProvodkiGrid;
var i: Integer;
    TempRQFKOrderController : RQFKOrderControllerSoapPort;
    fkProvList : FKProvObjectShortList;
begin
  sgProvodki.Clear;
  SetGridHeaders(FKOrderBadProvHeaders, sgProvodki.ColumnHeaders);

  TempRQFKOrderController := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

  try
    fkProvList := TempRQFKOrderController.getFKOrderPostingsList(RQFKOrderObj.code, true);
  except
    on EConvertError do Exit;
  end;

  HideControls([gbFKOrderPostings], False);

  if High(fkProvList.list) > -1 then
    sgProvodki.RowCount := High(fkProvList.list) + 2
  else
    sgProvodki.RowCount := 2;

  with sgProvodki do
    for i := 0 to High(fkProvList.list) do
    begin
       if fkProvList.list[i].id <> Low(Integer) then
        Cells[0,i+1] := IntToStr(fkProvList.list[i].id)
      else
        Cells[0,i+1] := '';
      if fkProvList.list[i].dt_prov = nil then
        Cells[1,i+1] := ''
      else
        Cells[1,i+1] := XSDate2String(fkProvList.list[i].dt_prov);
      Cells[2,i+1] := fkProvList.list[i].bal_ceh;
      Cells[3,i+1] := fkProvList.list[i].bal_sch;
      Cells[4,i+1] := fkProvList.list[i].bal_sub_sch;
      Cells[5,i+1] := fkProvList.list[i].bal_kau;
      Cells[6,i+1] := fkProvList.list[i].kor_ceh;
      Cells[7,i+1] := fkProvList.list[i].kor_sch;
      Cells[8,i+1] := fkProvList.list[i].kor_sub_sch;
      Cells[9,i+1] := fkProvList.list[i].kor_kau;
      if fkProvList.list[i].summa = nil then
        Cells[10,i+1] := ''
      else
        Cells[10,i+1] := fkProvList.list[i].summa.DecimalString;
      Cells[11,i+1] := fkProvList.list[i].primechan;
    end;
end;

function TfrmRQFKOrderEdit.hasCustomerMaterials : Boolean;
var
	TempRQFKOrderItem : RQFKOrderItemControllerSoapPort;
	TempRQFKOrderItem2ENEstimateItem : RQFKOrderItem2ENEstimateItemControllerSoapPort;
	TempENEstimateItem : ENEstimateItemControllerSoapPort;

	listItem : RQFKOrderItemShortList;
	listLinks : RQFKOrderItem2ENEStimateItemShortList;
	listEstimates : ENEStimateItemShortList;

	filterItem : RQFKOrderItemFilter;
	filterLinks : RQFKOrderItem2ENEStimateItemFilter;
	filterEstimates : ENEstimateItemFilter;

	res : Boolean;
begin
	res := false;
	TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
	TempRQFKOrderItem2ENEstimateItem := HTTPRIORQFKOrderItem2ENEstimateItem as RQFKOrderItem2ENEstimateItemControllerSoapPort;
	TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

	filterItem := RQFKOrderItemFilter.Create;
	filterLinks := RQFKOrderItem2ENEStimateItemFilter.Create;
	filterEstimates := ENEstimateItemFilter.Create;

	SetNullXSProps(filterItem);
	SetNullIntProps(filterItem);
	SetNullXSProps(filterLinks);
	SetNullIntProps(filterLinks);
	SetNullXSProps(filterEstimates);
	SetNullIntProps(filterEstimates);

	filterItem.fkOrderRef := RQFKOrderRef.Create;
	filterItem.fkOrderRef.code := RQFKOrderObj.code;

	listItem := TempRQFKOrderItem.getScrollableFilteredList(filterItem, 0, 1);
	if listItem.totalCount > 0 then begin
		filterLinks.fkOrderItemRef := RQFKorderItemRef.Create;
		filterLinks.fkOrderItemRef.code := listItem.list[0].code;
		listLinks := TempRQFKOrderItem2ENEstimateItem.getScrollableFilteredList(filterLinks, 0, 1);
		if listLinks.totalCount > 0 then begin
			filterEstimates.code := listLinks.list[0].estimateItemCode;
			listEstimates := TempENEstimateItem.getScrollableFilteredList(filterEstimates, 0, 1);
			res := (listEstimates.totalCount > 0)
        and (listEstimates.list[0].kindRefCode = ENESTIMATEITEMKIND_CUSTOMER_MATERIALS);
		end;
	end;
	Result := res;
end;

function TfrmRQFKOrderEdit.hasZabalansCounters() : Boolean;
var
	TempRQFKOrderItem : RQFKOrderItemControllerSoapPort;
	filter : RQFKOrderItemFilter;
  zabalansAccounts : String;
begin
	if (not Assigned(RQFKOrderObj)) or (RQFKOrderObj.code = Low(Integer)) then begin
	  raise Exception.Create('Немає ордеру для обробки');
	end;
	TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
	filter := RQFKOrderItemFilter.Create;
	SetNullXSProps(filter);
	SetNullIntProps(filter);
	filter.fkOrderRef := RQFKOrderRef.Create;
	filter.fkOrderRef.code := RQFKOrderObj.code;
  zabalansAccounts := '''' + DMReports.getSettingValueByKey(ENSettingsConsts.ACCOUNT_FOR_CUSTOMER_COUNTER_EXPERTISE) + '''';
  zabalansAccounts := zabalansAccounts + ', ' + '''' + DMReports.getSettingValueByKey(ENSettingsConsts.ACCOUNT_FOR_CUSTOMER_COUNTER_VERIFICATION) + '''';
	filter.conditionSQL := 'exists (select 1 from SCINVOICE as inv1 where inv1.FKORDERITEMREFCODE = RQFKORDERITEM.CODE and inv1.SUBACCOUNTCODE in (' + zabalansAccounts + '))';
	Result := TempRQFKOrderItem.getScrollableFilteredList(filter, 0, 1).totalCount > 0;
end;

procedure TfrmRQFKOrderEdit.FormShow(Sender: TObject);
var
  TempRQStorage : RQStorageControllerSoapPort;
  TempENGeographicDepartment:  ENGeographicDepartmentControllerSoapPort;
  geoDep: ENGeographicDepartment;
  curr_nds, curr_nds_low : Double;
begin
  pcRQFKOrder.ActivePage := tsRQFKOrder;

  DisableControls([spbRQFKOrderKindKind, spbRQFKOrderStatusStatus,
                   edtRQFKOrderKindKindName, edtRQFKOrderStatusStatusName,
                   edtRQFKOrderTypeName, edtWarrantNumber, edtWarrantDate, edtWarrantFIO]);

  DisableControls([edtMOLInCode, edtMOLInName, edtMolOutCode, edtMolOutName,
                   edtENDepartmentDepartmentName, edtGeoDepartment,
                   edtExpeditorCode, edtExpeditorName, edtRQOrgOrgName,
                   edtCode
                   , edtTKTransportRealTransportRealName, edtGosNumber
                   , edtAccount
                   , edtRQStorage
                   ]);

  // NET-4542 Скрытие этих двух действий для ордеров ведомости с клиента
  DisableActions([actInsert, actEdit], isAllocationList);

  SetFloatStyle([edtSumWithoutNds, edtSumNds, edtSum]);

  HideControls([tbPrintOZ, tbAddFromBill, lblAccount, edtAccount, spbAccount]);

  RQFKOrder2FinObj := nil;

  tsRQBill.TabVisible := ((RQFKOrderObj.kind.code in [RQFKORDER_KIND_PRIHOD_POSTAVKA
    , RQFKORDER_KIND_PRIHOD_BUFET]) and ((DialogState = dsView) or (DialogState = dsEdit)));

  tsRQFKOrderOut.TabVisible := false;
  tsFinServices.TabVisible := False;
  tsFKOrderPostings.TabVisible := False;
  tsProvodki.TabVisible := False;

  tsServicesFromSide.TabVisible := (not (DialogState = dsInsert)) and (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2OUT);
  tsRQOrder.TabVisible := (not (DialogState = dsInsert)) and (RQFKOrderObj.kind.code = RQFKORDER_KIND_AVAR_OUT);

  SetGridHeaders(RQBillHeaders, sgRQBill.ColumnHeaders);
  SetGridHeaders(ActsServicesFSHeaders, sgActsServicesFS.ColumnHeaders);
  SetGridHeaders(RQOrderHeaders, sgRQOrder.ColumnHeaders);

  HideControls([lblPercentProfits, edtPercentProfits], (RQFKOrderObj.kind.code <> RQFKORDER_KIND_SALE_PRODUCTS));
  HideControls([tbSaveStorageZone], (not isRQFKOrderForStorage(RQFKOrderObj)));
  DisableActions([actSaveStorageZone], (DialogState <> dsEdit));

  HideControls([lblOSCount, lblOSSum, pnlOSCount, pnlOSSum]);

  if not isRQFKOrderForStorage(RQFKOrderObj) then
  begin
    HideControls([lblRQStorage, edtRQStorage, spbRQStorage], True);
    lblMolCode.Top := 19;
    lblMolName.Top := 19;
    lblENDepartmentDepartmentName.Top := 19;
    edtMolOutCode.Top := 15;
    spbPlanMOL.Top := 15;
    edtMolOutName.Top := 15;
    edtENDepartmentDepartmentName.Top := 15;
    spbENDepartmentDepartment.Top := 15;

    lblGeoDepartment.Top := 15;
    edtGeoDepartment.Top := 15;
    spbGeoDepartment.Top := 15;

    gbMOLOut.Height := 50;
  end;

  // спрячем всё, что не касается КСУ
  if (DialogState <> dsInsert) then
   if (RQFKOrderObj.accountingTypeRef.code in [TK_ACCOUNTINGTYPE_TMC, TK_ACCOUNTINGTYPE_COUNTER,
                                              TK_ACCOUNTINGTYPE_OS, TK_ACCOUNTINGTYPE_SERVICES])
  then
      DisableActions([actSetSealInfo, actDivideItem]);

             ///// доступное значение ндс по периоду счета
             // если на вставку или редактирование то тянем процент ндс коотрый действует в периоде
             edtNdsPercent.Clear;
             if ((DialogState = dsInsert) or (  DialogState = dsEdit )) then begin
             curr_nds:=   DMReports.getStandartKoefInPeriod(ENSTANDARDCONST_PDV , edtDateGen.DateTime );
			 curr_nds_low :=   DMReports.getStandartKoefInPeriod(ENSTANDARDCONST_PDV_LOW, edtDateGen.DateTime );
             edtNdsPercent.AddItem('0',nil);
			 edtNdsPercent.AddItem(FloatToStr(curr_nds_low),nil);
             edtNdsPercent.AddItem(FloatToStr(curr_nds),nil);

              if ((RQFKOrderObj.ndsPercent > 0 ) or (DialogState = dsInsert)) then
				if RQFKOrderObj.ndsPercent = Trunc(curr_nds_low) then begin
					edtNdsPercent.ItemIndex := 1;
				end else begin
					edtNdsPercent.ItemIndex := edtNdsPercent.Items.Count - 1;
				end
              else
                 edtNdsPercent.ItemIndex := 0;
             end;
             if DialogState = dsView then
               begin
                 if RQFKOrderObj.ndsPercent = low(Integer) then
                    edtNdsPercent.AddItem('0',nil)
                 else
                    edtNdsPercent.AddItem(IntToStr(RQFKOrderObj.ndsPercent),nil);
                 edtNdsPercent.ItemIndex := 0;
               end;


  // Признак палетной передачи
  HideControls([chbIsPalletized, edtPalletNumber]);
  if (isRQFKOrderForPallet(RQFKOrderObj)) then
  begin
        HideControls([chbIsPalletized, edtPalletNumber], False);
  end;

  Case RQFKOrderObj.kind.code of
  RQFKORDER_KIND_WRITEOFFCOUNTERS :
      SetGridHeaders(RQFKOrderItemHeadersForWriteOff, sgRQFKOrderItem.ColumnHeaders);
  RQFKORDER_KIND_PRIHOD_BUFET :
      SetGridHeaders(RQFKOrderItemBufetHeaders, sgRQFKOrderItem.ColumnHeaders);
  RQFKORDER_KIND_PRIHOD_POSTAVKA :
      begin
        //// SUPP-4564
        if (DialogState <> dsInsert) then
        begin
        if (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_OS) then
          SetGridHeaders(RQFKOrderItemPrihodOSHeaders, sgRQFKOrderItem.ColumnHeaders)
        else if (RQFKOrderObj.accountingTypeRef.code in
                 [TK_ACCOUNTINGTYPE_SEAL, TK_ACCOUNTINGTYPE_IMP, TK_ACCOUNTINGTYPE_HOLO]) then
          SetGridHeaders(RQFKOrderItemSealHeaders, sgRQFKOrderItem.ColumnHeaders)
        else
            SetGridHeaders(RQFKOrderItemHeaders, sgRQFKOrderItem.ColumnHeaders);
        end;
        //// SUPP-4564
      end;
  else
      SetGridHeaders(RQFKOrderItemHeaders, sgRQFKOrderItem.ColumnHeaders);
  end;


  SetGridHeaders(RQFKOrderHeaders, sgRQFKOrder.ColumnHeaders);

  SetGridHeaders(FKOrderBadProvHeaders, sgFKOrderProvs.ColumnHeaders);
  SetGridHeaders(FKOrderProvErrorDetailedHeaders, sgFKProvErrorsDetailed.ColumnHeaders);

  SetGridHeaders(AXLedgerTransHeaders, sgAXLedgerTrans.ColumnHeaders);


  if DialogState <> dsInsert then
   if (RQFKOrderObj.accountingTypeRef.code in [TK_ACCOUNTINGTYPE_SEAL, TK_ACCOUNTINGTYPE_IMP, TK_ACCOUNTINGTYPE_HOLO])
      and (RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA)  then
      begin
       sgRQFKOrderItem.ColWidths[1] := 0;
       sgRQFKOrderItem.ColWidths[2] := 0;
       sgRQFKOrderItem.ColWidths[3] := 0;       /// туцтуцтуц
       sgRQFKOrderItem.ColWidths[4] := 300;
       sgRQFKOrderItem.ColWidths[5] := 200;
       sgRQFKOrderItem.ColWidths[11] := 0;

      end;


  //// SUPP-4564 Прячется поле "Сумма ПДВ" не для приходных ордеров с ОС
  if(DialogState <> dsInsert) then
    if (RQFKOrderObj.accountingTypeRef.code <> TK_ACCOUNTINGTYPE_OS)
      or (RQFKOrderObj.kind.code <> RQFKORDER_KIND_PRIHOD_POSTAVKA)  then
      sgRQFKOrderItem.ColWidths[9] := 0;

  if (RQFKOrderObj.kind.code = RQFKORDER_KIND_SERVICES_FROM_SIDE) then
  begin
    sgRQFKOrderItem.ColWidths[1] := 450;
    sgRQFKOrderItem.ColumnHeaders[1] := 'Назва послуги';
    sgRQFKOrderItem.ColWidths[2] := 0;
    sgRQFKOrderItem.ColWidths[3] := 0;
    sgRQFKOrderItem.ColWidths[4] := 0;
    sgRQFKOrderItem.ColWidths[5] := 0;
    sgRQFKOrderItem.ColWidths[9] := 0;
    sgRQFKOrderItem.ColWidths[10] := 0;
    sgRQFKOrderItem.HideColumn(sgRQFKOrderItem.ColumnHeaders.IndexOf('Місце зберігання'));

    gbFINMaterials.Visible := false;
    HideControls([lblDatePostings, edtDatePostings], False);
    //lblDatePostinsg.Left := 510;
    //edtDatePostings.Left := 605;
  end;

  if (DialogState <> dsInsert) then
  if (RQFKOrderObj.kind.code = RQFKORDER_KIND_OS_EXPL) or
     (RQFKOrderObj.kind.code = RQFKORDER_KIND_OS_MOVEMENT)
     or ((RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2OUT) and
          (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_OS)) then
  begin
    sgRQFKOrderItem.ColumnHeaders[3] := 'Інв. №';
    sgRQFKOrderItem.ColumnHeaders[4] := 'Назва осн. засобу';
    sgRQFKOrderItem.ColWidths[2] := 0;
    sgRQFKOrderItem.ColWidths[4] := 300;
    sgRQFKOrderItem.ColWidths[5] := 0;
    sgRQFKOrderItem.ColWidths[6] := 0;
    sgRQFKOrderItem.ColWidths[7] := 0;
    sgRQFKOrderItem.ColWidths[8] := 0;

    HideControls([lblTotal, pnlTotalSum]);
  end;

  {
  if RQFKOrderFilter(FilterObject).kind.code in [RQFKORDER_KIND_PRIHOD_POSTAVKA, RQFKORDER_KIND_PRIHOD_BUFET, RQFKORDER_KIND_SERVICES_FROM_SIDE] then
  begin
    sgRQFKOrder.ColumnHeaders[3] := 'Код постачальника';
    sgRQFKOrder.ColumnHeaders[4] := 'Постачальник';
  end;

  if RQFKOrderFilter(FilterObject).kind.code = RQFKORDER_KIND_SERVICES_FROM_SIDE then
  begin
    sgRQFKOrder.ColWidths[4] := 400;
    sgRQFKOrder.ColumnHeaders[5] := 'сума (без ПДВ)';
    sgRQFKOrder.ColWidths[6] := 0;
    sgRQFKOrder.ColWidths[8] := 0;
    sgRQFKOrder.ColWidths[9] := 0;
    sgRQFKOrder.ColWidths[10] := 0;
    sgRQFKOrder.ColWidths[11] := 0;
    sgRQFKOrder.ColWidths[12] := 0;
    sgRQFKOrder.ColWidths[13] := 0;
  end;
  }

  if (RQFKOrderObj.kind.code = RQFKORDER_KIND_SALE_PRODUCTS) then
  begin
    sgRQFKOrderItem.ColumnHeaders[7] := 'відп. ціна';
  end;

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
       spbWarrantNumber
      ,edtRQFKOrderKindKindName
      ,spbRQFKOrderKindKind
      ,edtRQFKOrderStatusStatusName
      ,spbRQFKOrderStatusStatus
      ,edtRQOrgOrgName
      ,spbRQOrgOrg

      , spbMOLIn, spbPlanMOL, spbENDepartmentDepartment, spbGeoDepartment, spbExpeditor
      , edtRQFKOrderKindKindName, edtRQFKOrderStatusStatusName

      ,edtNumberDoc
      ,edtDateGen

      ,spbAccount

      , spbKau1476, spbKau1476Clear, spbKau2494, spbKau2494Clear
      , spbDepartment, spbDescription, spbDepartmentClear, edtDatePostings

      , spbTaxBook, spbTaxBookClear, spbCostItem, spbCostItemClear, spbGetTaxNumber
      , spbTaxRate, spbTaxRateClear, spbAccountingGroup, spbAccountingGroupClear

      , edtRQStorage, spbRQStorage

      // залочено выше ... , edtTKTransportRealTransportRealName, edtGosNumber // , spbTKTransportRealTransportReal, spbTKTransportRealClear
       , spbAssetObject , spbAssetObjectClear , spbDimensionPurpose30900 , spbDimensionPurpose30900_Clear,
             edtRQFKOrderTypeName
      ,spbRQFKOrderType
       ]);
     DisableControls([edtDateShipment], false);

     DisableActions([actInsert, actEdit, actDelete, actFINDelete, actSetSealInfo, actDivideItem]);
  end;


  if (DialogState = dsInsert) then
  begin
      edtNumberDoc.Text := 'Auto';
      //DisableControls([edtNumberDoc]);
      HideControls([gbAddInfo, btnPrintOrder, btnPrintOrderTwoUnits 
	  , lblDateDelivery , edtDateDelivery]);

      // типа с ходу МОЛ - Кульминская СКЛАД ХОЕ - 1801
      //edtMolOutCode.Text := '1801';

      tsRQFKOrderItems.TabVisible := false;
      tsRQFKOrderOut.TabVisible := false;
      tsFinServices.TabVisible := False;
      tsFKOrderPostings.TabVisible := False;
	  tsProvodki.TabVisible := False;
      // при добавлении нового ордера - признак паллеты по-умолчанию включен
      if (isRQFKOrderForPallet(RQFKOrderObj)) then
        chbIsPalletized.Checked := True;


  end;

// -------------------------
{
  if (DialogState = dsEdit) then
  begin
    if RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM then
    begin
      DisableControls([edtDateGen, edtNumberDoc]);
    end;
  end;
}
// -------------------------------------

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin

    DenyBlankValues([
      edtNumberDoc
      ,edtDateGen
      ,edtMolOutCode
      ,edtMolOutName
      , edtENDepartmentDepartmentName
     ]);

   if (RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_BUFET) then
    begin
      DenyBlankValues([edtSumWithoutNds, edtSumNds, edtSum, edtRQOrgOrgName]);
      HideControls([tbAddFromBill], false);
      DisableActions([addFromBill], false);
    end;


    //if (isRQFKOrderForStorage(RQFKOrderObj)) then
    //begin
    //  DenyBlankValues([edtRQStorage]);
    //end;


    if RQFKOrderObj.kind.code in [RQFKORDER_KIND_RASHOD_OE2REM, RQFKORDER_KIND_RASHOD_OE2OUT,
                                  RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT, RQFKORDER_KIND_RASHOD_E2E ,
								  RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE , RQFKORDER_KIND_LOADEXPL_MBP , RQFKORDER_KIND_LOADEXPL_MNMA,
                  RQFKORDER_KIND_MBP, RQFKORDER_KIND_MNMA, RQFKORDER_KIND_RASHOD_MNMA,
                  RQFKORDER_KIND_RASHOD_BUFET, RQFKORDER_KIND_SALE_PRODUCTS, RQFKORDER_KIND_RASHOD_GIFT,
                  RQFKORDER_KIND_OS_EXPL, RQFKORDER_KIND_OS_MOVEMENT, RQFKORDER_KIND_RASHOD_TO_STORAGE,
                  RQFKORDER_KIND_ZONE_CHANGING, RQFKORDER_KIND_AVAR_OUT, RQFKORDER_KIND_AVAR_IN] then
    begin
      DenyBlankValues([edtMOLInCode, edtMOLInName, edtENDepartmentDepartmentName]);
    end;

    if RQFKOrderObj.kind.code in [RQFKORDER_KIND_MBP, RQFKORDER_KIND_MNMA, RQFKORDER_KIND_RASHOD_MNMA, RQFKORDER_KIND_RASHOD_TO_STORAGE] then
    begin
      DenyBlankValues([edtAccount]);
    end;

    if RQFKOrderObj.kind.code = RQFKORDER_KIND_SERVICES_FROM_SIDE then
    begin
      DenyBlankValues([edtSumWithoutNds, edtSumNds, edtSum, edtRQOrgOrgName]);
    end;

    if (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT) then
    begin
      HideControls([gbMOLOut, gbShipment]);
      DenyBlankValues([edtMOLInCode, edtMOLInName, edtRQOrgOrgName]);
      DisableControls([cbTKAccountingType]);
      HideControls([gbOrg], False);
    end;

    if RQFKOrderObj.kind.code in [RQFKORDER_KIND_MNMA, RQFKORDER_KIND_OS_EXPL] then
    begin
      DenyBlankValues([edtGeoDepartment]);
    end;

    // Палетная поставка
    if (isRQFKOrderForPallet(RQFKOrderObj)) then
      DenyBlankValues([edtPalletNumber]);

  end;


  if (RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_BUFET) then
  begin
    HideControls([gbMOLIn]);
    Caption := 'Прибутковий ордер';
    HideControls([lblENDepartmentDepartmentName, edtENDepartmentDepartmentName, spbENDepartmentDepartment,
                  lblGeoDepartment, edtGeoDepartment, spbGeoDepartment
                 , gbShipment
                 ]);
  end;

  if  RQFKOrderObj.kind.code in [RQFKORDER_KIND_RASHOD_OE2REM, RQFKORDER_KIND_RASHOD_OE2OUT,
                                 RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT, RQFKORDER_KIND_RASHOD_E2E,
                                 RQFKORDER_KIND_RASHOD_TRANZIT2OPERATIVE, RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE,
                                 RQFKORDER_KIND_RASHOD_BUFET, RQFKORDER_KIND_RASHOD_RETURN_PRODUCT,
                                 RQFKORDER_KIND_SALE_PRODUCTS, RQFKORDER_KIND_RASHOD_GIFT,
                                 RQFKORDER_KIND_OS_EXPL, RQFKORDER_KIND_OS_MOVEMENT, RQFKORDER_KIND_RASHOD_TO_STORAGE,
                                 RQFKORDER_KIND_ZONE_CHANGING, RQFKORDER_KIND_AVAR_OUT, RQFKORDER_KIND_AVAR_IN
                                 , RQFKORDER_KIND_OUT_FUEL] then
  begin
    HideControls([gbWarrant, {gbAddInfo, }gbDocInfo, gbOrg]);
    Caption := 'Видатковий ордер';

    DisableControls([spbMOLIn, spbPlanMOL, edtNumberDoc], (DialogState <> dsInsert));
  end;

  // SUPP-45740 Можно изменить МОЛ-получателя при редактировании расходного ордера
  if RQFKOrderObj.kind.code in [RQFKORDER_KIND_RASHOD_OE2REM, RQFKORDER_KIND_RASHOD_OE2OUT,
                                 RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT, RQFKORDER_KIND_RASHOD_E2E,
                                 RQFKORDER_KIND_RASHOD_TRANZIT2OPERATIVE, RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE,
                                 RQFKORDER_KIND_RASHOD_BUFET, RQFKORDER_KIND_RASHOD_RETURN_PRODUCT,
                                 RQFKORDER_KIND_SALE_PRODUCTS, RQFKORDER_KIND_RASHOD_GIFT,
                                 RQFKORDER_KIND_OS_EXPL, RQFKORDER_KIND_OS_MOVEMENT, RQFKORDER_KIND_RASHOD_TO_STORAGE,
                                 RQFKORDER_KIND_ZONE_CHANGING, RQFKORDER_KIND_AVAR_OUT, RQFKORDER_KIND_AVAR_IN,
                                 RQFKORDER_KIND_OUT_FUEL]
   then
  begin
    DisableControls([spbPlanMOL], not (DialogState in [dsInsert, dsEdit]));
  end;


  if  RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT then
  begin
    DisableControls([cbTKAccountingType]);
    HideControls([gbShipment, gbWarrant, gbExpeditor, btnPrintOrder]);
    Caption := 'Переміщення у Транзит (з Опер. запасу)';
  end;

  if  RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE then
  begin
    DisableControls([cbTKAccountingType]);
    HideControls([gbShipment, gbWarrant, gbExpeditor]);
    btnPrintOrder.Caption := 'Друк акту';
    Caption := 'Переміщення із зміною одиниці виміру';
  end;

  if  RQFKOrderObj.kind.code in [RQFKORDER_KIND_AVAR_IN, RQFKORDER_KIND_AVAR_OUT] then
  begin
    DisableControls([cbTKAccountingType]);
    HideControls([gbShipment, gbWarrant, gbExpeditor]);
    btnPrintOrder.Visible := False;
    if (RQFKOrderObj.kind.code = RQFKORDER_KIND_AVAR_IN) then
      Caption := 'Введення матеріалів у аварійний запас'
    else
      Caption := 'Виведення матеріалів з аварійного запасу';
  end;

  if  RQFKOrderObj.kind.code in [RQFKORDER_KIND_OUT_FUEL] then begin
    DisableControls([cbTKAccountingType]);
    HideControls([gbShipment, gbWarrant, gbExpeditor]);
  end;

  if  RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_E2E then
  begin
    DisableControls([cbTKAccountingType]);
    HideControls([gbShipment, gbWarrant, gbExpeditor, btnPrintOrder]);
    Caption := 'Перенесення матеріалів у Транзиті між об''єктами';
    if (DialogState <> dsInsert) then
      tsRQFKOrderOut.TabVisible := true;
  end;

  if  RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_TRANZIT2OPERATIVE then
  begin
    DisableControls([cbTKAccountingType]);
    HideControls([gbShipment, gbWarrant, gbExpeditor, btnPrintOrder]);
    Caption := 'Автоматичне переміщення з Транзиту в Опер. запас';
  end;

  if  RQFKOrderObj.kind.code in [RQFKORDER_KIND_LOADEXPL_MBP ] then
  begin
    DisableControls([cbTKAccountingType]);
    HideControls([gbWarrant, {gbAddInfo, }gbDocInfo, gbOrg]);
    Caption := 'Введення в експлуатацію спец.одягу (МБП)';

    DisableControls([spbMOLIn,  edtNumberDoc], (DialogState <> dsInsert));
    HideControls([gbWarrant,gbShipment,gbExpeditor]);

  end;

  if  RQFKOrderObj.kind.code in [RQFKORDER_KIND_LOADEXPL_MNMA] then
  begin
    DisableControls([cbTKAccountingType]);
    HideControls([gbWarrant, {gbAddInfo, }gbDocInfo, gbOrg]);
    Caption := 'Введення в експлуатацію спец.одягу (МНМА)';

    DisableControls([spbMOLIn,  edtNumberDoc], (DialogState <> dsInsert));
    HideControls([gbWarrant,gbShipment,gbExpeditor]);

  end;

  if RQFKOrderObj.kind.code in [RQFKORDER_KIND_MBP] then
  begin
    DisableControls([cbTKAccountingType]);
    HideControls([gbWarrant, {gbAddInfo, }gbDocInfo, gbOrg]);
    HideControls([lblAccount, edtAccount, spbAccount], false);
    Caption := 'Введення в експлуатацію МБП';

    DisableControls([spbMOLIn, edtNumberDoc], (DialogState <> dsInsert));
  end;

  if RQFKOrderObj.kind.code in [RQFKORDER_KIND_MNMA] then
  begin
    DisableControls([cbTKAccountingType]);
    HideControls([gbWarrant, {gbAddInfo, }gbDocInfo, gbOrg]);
    HideControls([lblAccount, edtAccount, spbAccount], false);
    Caption := 'Введення в експлуатацію МНМА';

    DisableControls([spbMOLIn, edtNumberDoc], (DialogState <> dsInsert));
  end;

  if RQFKOrderObj.kind.code in [RQFKORDER_KIND_RASHOD_MNMA] then
  begin
    DisableControls([cbTKAccountingType]);
    HideControls([gbWarrant, {gbAddInfo, }gbDocInfo, gbOrg]);
    HideControls([lblAccount, edtAccount, spbAccount], false);
    Caption := 'Внутрішнє переміщення МНМА';

    DisableControls([spbMOLIn, edtNumberDoc], (DialogState <> dsInsert));
  end;

  if RQFKOrderObj.kind.code in [RQFKORDER_KIND_RASHOD_TO_STORAGE] then
  begin
    HideControls([gbWarrant, gbDocInfo, gbOrg]);
    HideControls([lblAccount, edtAccount, spbAccount], false);
    Caption := 'Внутрішнє переміщення (на Центральний склад)';

    DisableControls([spbMOLIn, edtNumberDoc], (DialogState <> dsInsert));
  end;

  if RQFKOrderObj.kind.code in [RQFKORDER_KIND_ZONE_CHANGING] then
  begin
    HideControls([gbWarrant, {gbAddInfo, }gbDocInfo, gbOrg]);
    Caption := 'Зміна місця зберігання';

    DisableControls([spbMOLIn, edtNumberDoc], (DialogState <> dsInsert));
    // В любом случае не даем выбирать МОЛ-отправителя
    DisableControls([spbMolIn]);
  end;

  if RQFKOrderObj.kind.code = RQFKORDER_KIND_SERVICES_FROM_SIDE then
  begin
    DisableControls([cbTKAccountingType]);
    cbTKAccountingType.ItemIndex := 3; // Послуги
    HideControls([gbMOLOut, gbMOLIn, gbShipment, gbWarrant, gbAddInfo, gbExpeditor, btnPrintOrder]);
    Caption := 'Акт виконаних робіт та послуг';
    tsRQFKOrder.Caption := 'Акт';
    tsRQFKOrderItems.Caption := 'Строки акту';
    DisableControls([edtDateGen, edtNumberDoc], (DialogState <> dsInsert));
  end;


  if (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT) then
  begin
    HideControls([gbMOLOut, gbShipment]);
    DenyBlankValues([edtMOLInCode, edtMOLInName, edtRQOrgOrgName]);
    DisableControls([cbTKAccountingType]);
    HideControls([gbOrg], False);
    DisableControls([spbRQOrgOrg], (DialogState <> dsInsert));
  end;


  if (RQFKOrderObj.kind.code = RQFKORDER_KIND_SALE_PRODUCTS) then
  begin
    DenyBlankValues([edtSumWithoutNds, edtSumNds, edtSum, edtNdsPercent, edtPercentProfits]);
    HideControls([gbDocInfo], False);
    HideControls([gbAddInfo, btnPrintOrder]);

    // при создании 10% по умолчанию......
    if (DialogState = dsInsert) then edtPercentProfits.Text := '10';
  end;

  if RQFKOrderObj.kind.code = RQFKORDER_KIND_OS_EXPL then
  begin
    ///// 08.02.13 МОЛ-получатель может отличаться от МОЛа-отправителя
    //DisableControls([cbTKAccountingType, spbPlanMOL]);
    DisableControls([cbTKAccountingType]);
    /////
    HideControls([gbShipment, gbWarrant, gbExpeditor{, btnPrintOrder}]);
    Caption := 'Введення в експлуатацію ОЗ';
  end;

  if RQFKOrderObj.kind.code = RQFKORDER_KIND_OS_MOVEMENT then
  begin
    DisableControls([cbTKAccountingType{, spbPlanMOL}]);
    //HideControls([gbShipment, gbWarrant, gbExpeditor, btnPrintOrder]);
    HideControls([gbShipment, gbExpeditor], false);
    Caption := 'Внутрішнє переміщення ОЗ';
  end;

  //////////////////////////////////////////////////
  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    // Признак "Згідно наказу" и поле с описанием пока открываем на редактирование для любых ордеров, кроме проведенных
    DisableControls([chbIsByOrder, edtOrderInfo], (not (RQFKOrderObj.status.code in [RQFKORDER_STATUS_GOOD, RQFKORDER_STATUS_CREATED])));

      if (RQFKOrderObj.kind.code <> RQFKORDER_KIND_SERVICES_FROM_SIDE) then
      begin
        	// SUPP-71121 открывается кнопка для изменения даты проведения
	        HideControls([btnChangeDatePostings], (RQFKOrderObj.status.code in [RQFKORDER_STATUS_GOOD, RQFKORDER_STATUS_IN_FK
            , RQFKORDER_STATUS_OS_IN_FK, RQFKORDER_STATUS_COUNTER_IN_FK ]));

            HideControls([edtDatePostings, lblDatePostings], false);

	        DisableControls([edtDatePostings, btnChangeDatePostings], (not btnChangeDatePostings.Visible));
      end;

    // SUPP-70367
    HideActions([actInsert], ((RQFKOrderObj.kind.code in [RQFKORDER_KIND_PRIHOD_BUFET, RQFKORDER_KIND_PRIHOD_POSTAVKA])
      and (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_TMC)));


    // нефиг менять ТИП ... что зашло - то и будет ..
    DisableControls([cbTKAccountingType]);
    DisableControls([edtAccount, spbAccount]);

    DisableActions([actEditOSData, actViewOSData, actSelectAll, actClearAll]);
    HideActions([actEditOSData, actViewOSData, actSelectAll, actClearAll]);

    if (RQFKOrderObj.kind.code = RQFKORDER_KIND_SERVICES_FROM_SIDE)
         or (RQFKOrderObj.kind.code = RQFKORDER_KIND_SALE_PRODUCTS) then
    begin

       tsFinServices.TabVisible := True;
       tsFKOrderPostings.TabVisible := True;

       if ((RQFKOrderObj.kind.code = RQFKORDER_KIND_SALE_PRODUCTS)
              and (RQFKOrderObj.status.code = RQFKORDER_STATUS_GOOD)) then
       begin
         tsFinServices.TabVisible := False;
         tsFKOrderPostings.TabVisible := False;
       end;
       

       if (RQFKOrderObj.kind.code = RQFKORDER_KIND_SERVICES_FROM_SIDE) then
       begin
         gbTaxDetails.Visible := False;
       end else
       begin
         gbFinServicesGeneral.Visible := False;
         gbBankingServices.Visible := False;
       end;

       // 23.02.2012 +++ разрешаем редактировать бух.атрибуты на акте со статусом "Складений"
       if ((DialogState = dsEdit) and (RQFKOrderObj.status.code in [RQFKORDER_STATUS_CREATED, RQFKORDER_STATUS_IN_WORK_ON_WAREHOUSE])) then
       begin
         pcRQFKOrder.ActivePage := tsFinServices;
         DisableControls([tsRQFKOrder {, tsRQFKOrderItems ((( зачем все так сразу и скрывать, я ж не могу посмотреть строки } ] );
         DisableActions([actInsert , actEdit , actDelete , addFromBill]);
         pcRQFKOrderChange(Sender);
       end;

    end;

    // Палетная информация
    if (RQFKOrderObj.isPalletized = RQFKORDER_ISPALLETIZED_TRUE) then
      chbIsPalletized.Checked := True
    else
    begin
      chbIsPalletized.Checked := False;
      HideControls([edtPalletNumber]);
    end;

    edtPalletNumber.Text := RQFKOrderObj.palletNumber;

    ////// Признак "Згідно наказу"
    chbIsByOrder.Checked := (RQFKOrderObj.isByOrder = RQFKORDER_ISBYORDER_TRUE);
    edtOrderInfo.Text := RQFKOrderObj.orderInfo;
    edtOrderInfo.Visible := chbIsByOrder.Checked;
    //////

    // кнопка печати ОЗ ..
    if  (RQFKOrderObj.kind.code in [RQFKORDER_KIND_RASHOD_OE2REM , RQFKORDER_KIND_RASHOD_OE2OUT ,
             RQFKORDER_KIND_WRITEOFFCOUNTERS, RQFKORDER_KIND_RASHOD_RETURN_PRODUCT, RQFKORDER_KIND_RASHOD_GIFT])
        and (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_COUNTER)
    then
    begin
      HideControls([tbPrintOZ], False);
    end;

    // 10.04.2012 +++ возврат товара
    if (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT) then
    begin
      HideControls([gbMOLOut, gbShipment]);
      HideControls([gbOrg], False);
    end;

    if RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_TMC then
        HideControls([sgSCCounter, sgSCSeal])
    else
    if RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_COUNTER then
        HideControls([sgENFINMaterials, sgSCSeal])
    else
    if  RQFKOrderObj.accountingTypeRef.code in [TK_ACCOUNTINGTYPE_SEAL, TK_ACCOUNTINGTYPE_IMP, TK_ACCOUNTINGTYPE_HOLO] then
        HideControls([sgENFINMaterials, sgSCCounter]);


    /////
    if ((RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA) or
        //(RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM) or
        (RQFKOrderObj.kind.code = RQFKORDER_KIND_OS_MOVEMENT) or
        (RQFKOrderObj.kind.code = RQFKORDER_KIND_OS_EXPL) or
        ((RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2OUT) and
          (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_OS))) and
       (RQFKOrderObj.status.code = RQFKORDER_STATUS_CREATED) and
       (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_OS) then
    begin
      //tsOSData.TabVisible := true;
      //if HTTPRIORQFKOrder.HTTPWebNode.UserName = 'energynet' then {***}
      //begin
        DisableActions([actEditOSData, actSelectAll, actClearAll], false);
        HideActions([actEditOSData, actSelectAll, actClearAll], false);
        if (RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA) then
          HideControls([lblOSCount, lblOSSum, pnlOSCount, pnlOSSum], false);
      //end;
    end;

    if ((RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA) or
        //(RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM) or
        (RQFKOrderObj.kind.code = RQFKORDER_KIND_OS_MOVEMENT) or
        (RQFKOrderObj.kind.code = RQFKORDER_KIND_OS_EXPL) or
        ((RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2OUT) and
          (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_OS))) and
       (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_OS) then
    begin
      //if HTTPRIORQFKOrder.HTTPWebNode.UserName = 'energynet' then {***}
      //begin
        DisableActions([actViewOSData], false);
        HideActions([actViewOSData], false);
      //end;
    end;
    /////

    edtCode.Text := IntToStr(RQFKOrderObj.code);
    edtNumberDoc.Text := RQFKOrderObj.numberDoc;

	  SetDateFieldForDateTimePicker(edtDateGen, RQFKOrderObj.dateGen);
    // SUPP-72121 Перенос отображения даты проведения в раздел общий для всех видов
    // ордеров (не только акты выполненных услуг)
    SetDateFieldForDateTimePicker(edtDatePostings, RQFKOrderObj.datePosting);

    edtMolOutCode.Text := RQFKOrderObj.molOutCode;
    edtMolOutName.Text := RQFKOrderObj.molOutName;
    edtWarrantNumber.Text := RQFKOrderObj.warrantNumber; 
	SetDateFieldForDateTimePicker(edtWarrantDate, RQFKOrderObj.warrantDate);
    edtWarrantFIO.Text := RQFKOrderObj.warrantFIO;
	SetDateFieldForDateTimePicker(edtDateEdit, RQFKOrderObj.dateEdit);

    if RQFKOrderObj.storageRef <> nil then
    if RQFKOrderObj.storageRef.code <> low(Integer) then
    begin
      TempRQStorage := HTTPRIORQStorage as RQStorageControllerSoapPort;
      edtRQStorage.Text := TempRQStorage.getObject(RQFKOrderObj.storageRef.code).name;
    end;

    if RQFKOrderObj.geoDepartmentRef <> nil then
      if RQFKOrderObj.geoDepartmentRef.code <> LOW_INT then
      begin
        TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
        geoDep := TempENGeographicDepartment.getObject(RQFKOrderObj.geoDepartmentRef.code);
        if geoDep <> nil then
          edtGeoDepartment.Text := geoDep.name;
      end;

    edtUserGen.Text := RQFKOrderObj.userGen;

    edtRQFKOrderKindKindName.Text := RQFKOrderObj.kind.name;
    edtRQFKOrderStatusStatusName.Text := RQFKOrderObj.status.name;
    edtRQOrgOrgName.Text := RQFKOrderObj.org.name;
    edtENDepartmentDepartmentName.Text := RQFKOrderObj.department.name;

    edtMolInCode.Text := RQFKOrderObj.molInCode; 
    edtMolInName.Text := RQFKOrderObj.molInName; 
    edtExpeditorCode.Text := RQFKOrderObj.expeditorCode;
    edtExpeditorName.Text := RQFKOrderObj.expeditorName;

    if RQFKOrderObj.typeRef <> nil then
    edtRQFKOrderTypeName.Text := RQFKOrderObj.typeRef.name;

    if (RQFKOrderObj.percentProfits <> nil) then
      edtPercentProfits.Text := RQFKOrderObj.percentProfits.decimalString
    else
      edtPercentProfits.Text := '';

    if ( RQFKOrderObj.sumWithoutNds <> nil ) then
       edtSumWithoutNds.Text := RQFKOrderObj.sumWithoutNds.decimalString
    else
       edtSumWithoutNds.Text := '';

    if ( RQFKOrderObj.sumNds <> nil ) then
       edtSumNds.Text := RQFKOrderObj.sumNds.decimalString
    else
       edtSumNds.Text := '';

    //edtSum.Text :=  FloatToStr(StrToFloat(edtSumWithoutNds.Text) + StrToFloat(edtSumNds.Text));

//    if ( RQFKOrderObj.ndsPercent <> Low(Integer) ) then
//    begin
//       if RQFKOrderObj.ndsPercent = 20 then
//          edtNdsPercent.ItemIndex := 1
//       else
//          edtNdsPercent.ItemIndex := 0;
//
//       //edtNdsPercent.Text := IntToStr(RQFKOrderObj.ndsPercent)
//
//    end
//    else
//       edtNdsPercent.ItemIndex := -1;

      SetDateFieldForDateTimePicker(edtDateShipment, RQFKOrderObj.dateShipment);

      edtTKTransportRealTransportRealName.Text := RQFKOrderObj.transportReal.name;
      edtGosNumber.Text := RQFKOrderObj.transportReal.gosNumber;

    cbTKAccountingType.ItemIndex := -1;
    if RQFKOrderObj.accountingTypeRef <> nil then
    begin
      if RQFKOrderObj.accountingTypeRef.code > LOW_INT then
        cbTKAccountingType.ItemIndex := RQFKOrderObj.accountingTypeRef.code - 1;
    end;

    ////// Для приходных ордеров ОС - подразделение будет выбираться бухгалтером из справочника ФК
    if (RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA) and (cbTKAccountingType.ItemIndex + 1 = TK_ACCOUNTINGTYPE_OS) then
    begin
      if RQFKOrderObj.status.code <> RQFKORDER_STATUS_GOOD then
        HideControls([lblENDepartmentDepartmentName, edtENDepartmentDepartmentName, spbENDepartmentDepartment], false);

      //if RQFKOrderObj.status.code = RQFKORDER_STATUS_CREATED then
      //  DisableControls([spbENDepartmentDepartment], false)
      DisableControls([spbENDepartmentDepartment], (not (RQFKOrderObj.status.code in [RQFKORDER_STATUS_CREATED, RQFKORDER_STATUS_IN_WORK_ON_WAREHOUSE])));

      if (RQFKOrderObj.kod_podr <> '') then
        edtENDepartmentDepartmentName.Text := RQFKOrderObj.kod_podr + ' ' + RQFKOrderObj.name_podr;
    end;
    //////

    ////// Для внутренних перемещений и ввода в эксплуатацию ОС - подразделение будет выбираться бухгалтером из справочника ФК
    if (RQFKOrderObj.kind.code = RQFKORDER_KIND_OS_MOVEMENT) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_OS_EXPL) or
        ((RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2OUT) and (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_OS))
    then
    begin
      if RQFKOrderObj.status.code <> RQFKORDER_STATUS_GOOD then
        HideControls([lblENDepartmentDepartmentName, edtENDepartmentDepartmentName, spbENDepartmentDepartment], false);

      //if RQFKOrderObj.status.code = RQFKORDER_STATUS_CREATED then
      //  DisableControls([spbENDepartmentDepartment], false)
      DisableControls([spbENDepartmentDepartment], (RQFKOrderObj.status.code <> RQFKORDER_STATUS_CREATED));

      // Для скдадених/проведених выводим подразделение из ОС, для остальных будет из EN
      if (RQFKOrderObj.status.code <> RQFKORDER_STATUS_GOOD) then
      begin
        if (RQFKOrderObj.kod_podr <> '') then
          edtENDepartmentDepartmentName.Text := RQFKOrderObj.kod_podr + ' ' + RQFKOrderObj.name_podr
        else
          edtENDepartmentDepartmentName.Text := '';
      end;
    end;
    //////

    MakeMultiline(edtCommentGen.Lines, RQFKOrderObj.commentGen);

    edtAccount.Text := RQFKOrderObj.account;


    /// дата поставки материалов
	SetDateFieldForDateTimePicker(edtDateDelivery, RQFKOrderObj.dateDelivery);

      DisableControls([edtDateDelivery]);

      if ( not (RQFKOrderObj.kind.code in ([RQFKORDER_KIND_PRIHOD_POSTAVKA, RQFKORDER_KIND_PRIHOD_BUFET])) ) then
        HideControls([edtDateDelivery, lblDateDelivery]);

	// SUPP-70367 
	if (RQFKOrderObj.status.code = RQFKORDER_STATUS_IN_FK) 
		and (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_TMC) then begin
		tsProvodki.TabVisible := true;
		// Не нужно показывать две вкладки вместе
		if tsFKOrderPostings.TabVisible then begin
			tsProvodki.TabVisible := false;
		end;
	end;

  end;

  if RQFKOrderObj.kind.code =  RQFKORDER_KIND_WRITEOFFCOUNTERS then
      begin
        HideControls([gbOrg , gbExpeditor,gbAddInfo,gbWarrant,gbShipment , gbMOLOut , lblNdsPecent , edtNdsPercent]);
        gbMOLIn.Caption := '';
        Label1.Caption:= 'Код МОЛ';
        Label2.Caption:= 'Назва МОЛ';
        lblCode.Visible:= False;
        frmRQFKOrderEdit.Caption:= 'Списання лічильників';
        frmRQFKOrderEdit.cbTKAccountingType.ItemIndex:= 1;
        DisableControls([cbTKAccountingType]);
        sgRQFKOrderItem.ColCount:= 4;

         if (DialogState = dsInsert) then
         begin
          pcRQFKOrder.Height:= 200;
          btnOk.Top := 250;
          btnCancel.Top := 250;
          Label3.Top:= 250;
          edtCode.Top:= 250;
          frmRQFKOrderEdit.Height:= 350;
         end;

         // не даем менять дату документа на редактирование и мол
         if (DialogState = dsEdit) then
         DisableControls([edtDateGen , spbMOLIn]);
      end;
      if RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM then
         HideControls([btnPrintOrderTwoUnits],false);

  initDFDocsTab;
end;



procedure TfrmRQFKOrderEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQFKOrder: RQFKOrderControllerSoapPort;
    TempRQFKOrder2Fin : RQFKOrder2FinServicesControllerSoapPort;
    sumNds: Double;
    dfDocSigners: ArrayOfDFDocSigner;
begin

  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  //RQFKOrderObj.dateEdit := nil;
  //RQFKOrderObj.dateAdd := nil;

  // сохраним КУСОК с авто и датой отгрузки
  if (ModalResult = mrOk) and (DialogState = dsView) then
  begin

    if (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_BUFET) then
    begin
        if edtDateShipment.Checked then
        begin
           if edtDateShipment.DateTime < edtDateGen.DateTime then
           begin
               Application.MessageBox(PChar('Мабуть дата відгрузки не повинна бути меншою за дату Ордера ?'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
               Action:=caNone;
               Exit;
           end;
        end;
    end;

    if ((RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA) and (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_OS)) or
       (RQFKOrderObj.kind.code = RQFKORDER_KIND_OS_EXPL) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_OS_MOVEMENT) or
       ((RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2OUT) and
          (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_OS)) then
    begin
       // 19.09.12 Для приходов ОС изменяем подразделение из ОС (только для ордеров в статусе "Складений")
       TempRQFKOrder.updateOSPodr(RQFKOrderObj);
    end
    else begin
      if edtdateShipment.checked then
      begin
        if RQFKOrderObj.dateShipment = nil then
          RQFKOrderObj.dateShipment := TXSDate.Create;
        RQFKOrderObj.dateShipment.XSToNative(GetXSDate(edtdateShipment.DateTime));
      end
      else
        RQFKOrderObj.dateShipment := nil;

      ////// Признак "Згідно наказу"
      if (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2OUT) then
      begin
        RQFKOrderObj.isByOrder := Ord(chbIsByOrder.Checked);
        RQFKOrderObj.orderInfo := edtOrderInfo.Text;
      end;
      //////

      //////
      if (DMReports.isSignable(RQFKOrderObj))
        and (not DMReports.checkDFDocSigners(sgDFDocSigners)) then
      begin
        Application.MessageBox(PChar('Потрібно вказати всіх підписантів!'), PChar('Увага !'), MB_ICONWARNING + MB_OK);
        pcRQFKOrder.ActivePage := tsDFDoc;
        Action := caNone;
        Exit;
      end;

      SetLength(dfDocSigners, 0);

      if DMReports.isSignable(RQFKOrderObj) then
      begin
        if not getDFDocSignersForSaving(dfDocSigners) then
        begin
          Action := caNone;
          Exit;
        end;
      end;
      /////

      if High(dfDocSigners) > -1 then
        TempRQFKOrder.save(RQFKOrderObj, dfDocSigners)
      else
        TempRQFKOrder.save(RQFKOrderObj);
    end;
  end;

  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then

  if (RQFKOrderObj.kind.code <> RQFKORDER_KIND_SERVICES_FROM_SIDE)
       and (RQFKOrderObj.kind.code <> RQFKORDER_KIND_RASHOD_RETURN_PRODUCT)
        and (not NoBlankValues([edtNumberDoc, edtMolOutCode, edtMolOutName, edtdateGen])) then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
      Exit;
  end
  else

  if (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT)
        and (not NoBlankValues([edtNumberDoc, edtMOLInCode, edtRQOrgOrgName, edtdateGen])) then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
      Exit;
  end
  else

  //if (isRQFKOrderForStorage(RQFKOrderObj))
  //      and (cbTKAccountingType.ItemIndex + 1 = TK_ACCOUNTINGTYPE_TMC)
  //      and (not NoBlankValues([edtRQStorage])) then
  //begin
  //    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
  //    Action:=caNone;
  //    Exit;
  //end
  //else

  //////
  if (DMReports.isSignable(RQFKOrderObj))
    and (not DMReports.checkDFDocSigners(sgDFDocSigners)) then
  begin
    Application.MessageBox(PChar('Потрібно вказати всіх підписантів!'), PChar('Увага !'), MB_ICONWARNING + MB_OK);
    pcRQFKOrder.ActivePage := tsDFDoc;
    Action := caNone;
    Exit;
  end
  else
  /////

  begin
    if ((RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_BUFET)) and (
      not NoBlankValues([
        edtSumWithoutNds
        ,edtSumNds
        ,edtSum
        ,edtRQOrgOrgName
       ])) then
    begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
      Exit;
    end;

    if ((RQFKOrderObj.kind.code = RQFKORDER_KIND_MNMA) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_OS_EXPL)) and (
      not NoBlankValues([edtGeoDepartment])) then
    begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
      Exit;
    end;

    if ((RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2OUT) or
        (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_E2E) or
        (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE) or
        (RQFKOrderObj.kind.code = RQFKORDER_KIND_LOADEXPL_MBP) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_LOADEXPL_MNMA) or
        (RQFKOrderObj.kind.code = RQFKORDER_KIND_MBP) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_MNMA)
        or (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_MNMA)
        or (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_BUFET)
        or (RQFKOrderObj.kind.code = RQFKORDER_KIND_SALE_PRODUCTS)
        or (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_GIFT)
        or (RQFKOrderObj.kind.code = RQFKORDER_KIND_OS_EXPL)
        or (RQFKOrderObj.kind.code = RQFKORDER_KIND_OS_MOVEMENT)
        or (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_TO_STORAGE)
        or (RQFKOrderObj.kind.code = RQFKORDER_KIND_ZONE_CHANGING)
        or (RQFKOrderObj.kind.code = RQFKORDER_KIND_OUT_FUEL)
        or (RQFKOrderObj.kind.code = RQFKORDER_KIND_AVAR_OUT)
        or (RQFKOrderObj.kind.code = RQFKORDER_KIND_AVAR_IN)
        )
      and (
      not NoBlankValues([
        edtMOLInCode
        ,edtMOLInName
        ,edtENDepartmentDepartmentName
       ])) then
    begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
      Exit;
    end;

    if (isRQFKOrderForStorage(RQFKOrderObj))
       {16.05.2019 для приходов эта проверка не осуществляется, т.к. приходы пользователи
         должны иметь возможность делать не только для складов, но и на обычные МОЛ}
      and (RQFKOrderObj.kind.code <> RQFKORDER_KIND_PRIHOD_POSTAVKA)
      and ((RQFKOrderObj.storageRef = nil) or (RQFKOrderObj.storageRef.code = LOW_INT)) then
    begin
      Application.MessageBox(PChar('На ордері не вказано склад!'), PChar('Увага!'), MB_ICONWARNING);
      Action:=caNone;
      Exit;
    end;

    if (
        (RQFKOrderObj.kind.code = RQFKORDER_KIND_MBP) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_MNMA) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_MNMA)
       )
      and
      (not NoBlankValues([edtAccount])) then
    begin
      Application.MessageBox(PChar('Оберіть рахунок !'), PChar('Увага !'), MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
    end;

    if ((RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2OUT)
         or (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_BUFET) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_GIFT)
         or (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_TO_STORAGE)) then
    begin
        if edtDateShipment.Checked then
        begin
           if edtDateShipment.DateTime < edtDateGen.DateTime then
           begin
               Application.MessageBox(PChar('Мабуть дата відгрузки не повинна бути меншою за дату Ордера ?'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
               Action:=caNone;
               Exit;
           end;
        end;
    end;

    // Номер палеты
    if(isRQFKOrderForPallet(RQFKOrderObj)) then
    begin
      if chbIsPalletized.Checked then
      begin
          if (edtPalletNumber.Text = '') or (Length(edtPalletNumber.Text) = 0) then
          begin
               Application.MessageBox(PChar('Введіть номер палети'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
               Action:=caNone;
               Exit;
          end
          else
          begin
            RQFKOrderObj.palletNumber := edtPalletNumber.Text;
          end;
      end
      else
        RQFKOrderObj.palletNumber := '';
    end;

    if (RQFKOrderObj.kind.code = RQFKORDER_KIND_SERVICES_FROM_SIDE)
      and (not NoBlankValues([edtNumberDoc, edtDateGen, edtSumWithoutNds, edtSumNds, edtSum, edtRQOrgOrgName])) then
    begin
        Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
        Action:=caNone;
        Exit;
    end;

    SetLength(dfDocSigners, 0);

    if DMReports.isSignable(RQFKOrderObj) then
    begin
      if not getDFDocSignersForSaving(dfDocSigners) then
      begin
        Action := caNone;
        Exit;
      end;
    end;

    if (edtDatePostings.checked) then
    begin
      if RQFKOrderObj.datePosting = nil then
         RQFKOrderObj.datePosting := TXSDate.Create;
      RQFKOrderObj.datePosting.XSToNative(GetXSDate(edtDatePostings.DateTime));
    end;


    // 24.09.2012 +++ для реализации ТМЦ, если указан признак передачи в Трэйд,
    // обязательны для заполнения налоговые реквизиты
    if (RQFKOrderObj.kind.code = RQFKORDER_KIND_SALE_PRODUCTS)
         and (cbIsTransferTax.Checked = True)
         and (not NoBlankValues([edtTaxInvoiceNumber, edtTaxInvoiceDateGen, edtTaxBook, edtCostItem,
                edtTaxRateName, edtAccountingGroup])) then
    begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
      Exit;
    end;

    if (RQFKOrderObj.kind.code = RQFKORDER_KIND_SALE_PRODUCTS)
         and (cbIsTransferTax.Checked = True)
         and (cbIsRefinementTax.Checked) and (cbTaxDocType.ItemIndex = -1) then
    begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
      Exit;
    end;

     //номер генериться НЕ автоматом .. + в ФК поле
     {в ФК закидываем первые 10 символов ...
     if Length(edtNumberDoc.Text) > 10  then
     begin
         Application.MessageBox(PChar('Номер Ордера у ФінКоллекції не може бути більше за 10 символів'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
         Action:=caNone;
         Exit;
     end;
     }

     RQFKOrderObj.numberDoc := edtNumberDoc.Text;

     if edtdateGen.checked then
     begin 
       if RQFKOrderObj.dateGen = nil then
          RQFKOrderObj.dateGen := TXSDate.Create;
       RQFKOrderObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       RQFKOrderObj.dateGen := nil;

     RQFKOrderObj.molOutCode := edtMolOutCode.Text;

     RQFKOrderObj.molOutName := edtMolOutName.Text;

     RQFKOrderObj.warrantNumber := edtWarrantNumber.Text; 

     if edtwarrantDate.checked then
     begin
       if RQFKOrderObj.warrantDate = nil then
          RQFKOrderObj.warrantDate := TXSDate.Create;
       RQFKOrderObj.warrantDate.XSToNative(GetXSDate(edtwarrantDate.DateTime));
     end
     else
       RQFKOrderObj.warrantDate := nil;

     RQFKOrderObj.warrantFIO := Trim(edtWarrantFIO.Text);

     if (RQFKOrderObj.sumWithoutNds = nil ) then
       RQFKOrderObj.sumWithoutNds := TXSDecimal.Create;
     if edtSumWithoutNds.Text <> '' then
       RQFKOrderObj.sumWithoutNds.decimalString := edtSumWithoutNds.Text
     else
       RQFKOrderObj.sumWithoutNds := nil;

     if (RQFKOrderObj.sumNds = nil ) then
       RQFKOrderObj.sumNds := TXSDecimal.Create;
     if edtSumNds.Text <> '' then
       RQFKOrderObj.sumNds.decimalString := edtSumNds.Text
     else
       RQFKOrderObj.sumNds := nil;

     if ( edtNdsPercent.Text <> '' ) then
       RQFKOrderObj.ndsPercent := StrToInt(edtNdsPercent.Text)
     else
       RQFKOrderObj.ndsPercent := Low(Integer) ;

     ///// 02.09.13 Проверка на соответствие ставки НДС по документу и суммы НДС
     //    (т.е. чтобы не ставили, например, сумму НДС = 200 грн., а ставку НДС - 0%)
     if (RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_BUFET) then
     begin
       sumNds := 0;

       try
         sumNds := StrToFloat(edtSumNds.Text);
       except
         on EConvertError do
         begin
           Application.MessageBox(PChar('Неприпустиме значення в полі "Сума ПДВ по документу" !'), PChar('Увага !'), MB_ICONWARNING+MB_OK);
           if edtSumNds.CanFocus then
             edtSumNds.SetFocus;
           Action := caNone;
           Exit;
         end;
       end;

       if (sumNds > 0) and (RQFKOrderObj.ndsPercent <= 0) then
       begin
         Application.MessageBox(PChar('Значення в полі "Ставка ПДВ по документу" не відповідає значенню "Сума ПДВ по документу" !'), PChar('Увага !'), MB_ICONWARNING+MB_OK);
         if edtSumNds.CanFocus then
           edtSumNds.SetFocus;
         Action := caNone;
         Exit;
       end;

       if (sumNds = 0) and (RQFKOrderObj.ndsPercent > 0) then
       begin
         Application.MessageBox(PChar('Значення в полі "Ставка ПДВ по документу" не відповідає значенню "Сума ПДВ по документу" !'), PChar('Увага !'), MB_ICONWARNING+MB_OK);
         if edtSumNds.CanFocus then
           edtSumNds.SetFocus;
         Action := caNone;
         Exit;
       end;
     end;
     /////

     if edtdateShipment.checked then
     begin
       if RQFKOrderObj.dateShipment = nil then
          RQFKOrderObj.dateShipment := TXSDate.Create;
       RQFKOrderObj.dateShipment.XSToNative(GetXSDate(edtdateShipment.DateTime));
     end
     else
       RQFKOrderObj.dateShipment := nil;


      if cbTKAccountingType.ItemIndex > -1 then
      begin
        if RQFKOrderObj.accountingTypeRef = nil then RQFKOrderObj.accountingTypeRef := TKAccountingTypeRef.Create;
        RQFKOrderObj.accountingTypeRef.code := cbTKAccountingType.ItemIndex + 1;
      end
      else
      begin
           Application.MessageBox(PChar('Укажите тип учета мат-ла !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
           Action:=caNone;
           Exit;
      end;

      RQFKOrderObj.commentGen := edtCommentGen.Text;

      if (RQFKOrderObj.kind.code = RQFKORDER_KIND_SALE_PRODUCTS) then
      begin

        if (RQFKOrderObj.percentProfits = nil ) then
          RQFKOrderObj.percentProfits := TXSDecimal.Create;
        if edtPercentProfits.Text <> '' then
          RQFKOrderObj.percentProfits.decimalString := edtPercentProfits.Text
        else
          RQFKOrderObj.percentProfits := nil;

      end;
      if chbIsPalletized.Checked then
        RQFKOrderObj.isPalletized := RQFKORDER_ISPALLETIZED_TRUE
      else
        RQFKOrderObj.isPalletized := RQFKORDER_ISPALLETIZED_FALSE;

      ////// Признак "Згідно наказу"
      RQFKOrderObj.isByOrder := Ord(chbIsByOrder.Checked);
      RQFKOrderObj.orderInfo := edtOrderInfo.Text;
      //////


    if DialogState = dsInsert then
    begin
      RQFKOrderObj.code := Low(Integer);

	    if (RQFKOrderObj.kind.code = RQFKORDER_KIND_SALE_PRODUCTS) then
		    TempRQFKOrder.addForSale(RQFKOrderObj, servicesObject.code)
      else
      if RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_E2E then
        // TempRQFKOrder.addE2E(RQFKOrderObj)
        begin
          ShowMessage('Цей функціонал більше не використовується!');
          Exit;
        end
      else
      if RQFKOrderObj.kind.code = RQFKORDER_KIND_SERVICES_FROM_SIDE then
        TempRQFKOrder.addServicesFS(RQFKOrderObj)
      else
      if (RQFKOrderObj.kind.code = RQFKORDER_KIND_ZONE_CHANGING) then
        TempRQFKOrder.addZoneChanging(RQFKOrderObj)
      else
      if (RQFKOrderObj.kind.code = RQFKORDER_KIND_AVAR_OUT) then
        TempRQFKOrder.addAvarOut(RQFKOrderObj)
      else
      if (RQFKOrderObj.kind.code = RQFKORDER_KIND_AVAR_IN) then
        TempRQFKOrder.addAvarIn(RQFKOrderObj)
      else begin
        if High(dfDocSigners) > -1 then
          TempRQFKOrder.add(RQFKOrderObj, dfDocSigners)
        else
          TempRQFKOrder.add(RQFKOrderObj);
      end;

    end
    else
    if DialogState = dsEdit then
    begin
      if (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_E2E) then
      begin
        // TempRQFKOrder.saveE2E(RQFKOrderObj);
        ShowMessage('Цей функціонал більше не використовується!');
        Exit;
      end
      else
      if (RQFKOrderObj.kind.code = RQFKORDER_KIND_SERVICES_FROM_SIDE) then
        TempRQFKOrder.saveServicesFS(RQFKOrderObj)
      else
      if (RQFKOrderObj.kind.code = RQFKORDER_KIND_ZONE_CHANGING) then
        TempRQFKOrder.saveZoneChanging(RQFKOrderObj)
      else
      if (RQFKOrderObj.kind.code = RQFKORDER_KIND_AVAR_OUT) then
        TempRQFKOrder.saveAvarOut(RQFKOrderObj)
      else
      if (RQFKOrderObj.kind.code = RQFKORDER_KIND_AVAR_IN) then
        TempRQFKOrder.saveAvarIn(RQFKOrderObj)
      else begin
        if High(dfDocSigners) > -1 then
          TempRQFKOrder.save(RQFKOrderObj, dfDocSigners)
        else
          TempRQFKOrder.save(RQFKOrderObj);
      end;

      if (RQFKOrderObj.kind.code = RQFKORDER_KIND_SERVICES_FROM_SIDE)
           or (RQFKOrderObj.kind.code = RQFKORDER_KIND_SALE_PRODUCTS) then
      // Вставка связки со справочными данными из Фин. Кол.
      begin
         if (RQFKOrder2FinObj = nil) then
         begin
           RQFKOrder2FinObj := RQFKOrder2FinServices.Create;
           RQFKOrder2FinObj.code := LOW_INT;
         end;

         if (RQFKOrder2FinObj.fkOrderRef = nil) then RQFKOrder2FinObj.fkOrderRef := RQFKOrderRef.Create;
         RQFKOrder2FinObj.fkOrderRef.code := RQFKOrderObj.code;

         TempRQFKOrder2Fin := HTTPRIORQFKOrder2FinServices as RQFKOrder2FinServicesControllerSoapPort;

         if cbIsTax.ItemIndex > -1 then
           RQFKOrder2FinObj.isTax := cbIsTax.ItemIndex;

         if RQFKOrder2FinObj.fkBankingServicesTypeRef = nil then
           RQFKOrder2FinObj.fkBankingServicesTypeRef := RQFKBankingServicesTypeRef.Create();
           RQFKOrder2FinObj.fkBankingServicesTypeRef.code := cbBankingServices.ItemIndex + 1;

         if (RQFKOrder2FinObj.departmentRef <> nil) and (RQFKOrder2FinObj.departmentRef.code <> LOW_INT) then
           RQFKOrder2FinObj.departmentRef.code := RQFKOrder2FinObj.departmentRef.code
         else
           RQFKOrder2FinObj.departmentRef := nil;

         if edtTaxInvoiceDateGen.checked then
         begin
           if RQFKOrder2FinObj.taxInvoiceDateGen = nil then
              RQFKOrder2FinObj.taxInvoiceDateGen := TXSDate.Create;
           RQFKOrder2FinObj.taxInvoiceDateGen.XSToNative(GetXSDate(edtTaxInvoiceDateGen.DateTime));
         end
         else
           RQFKOrder2FinObj.taxInvoiceDateGen := nil;

         RQFKOrder2FinObj.taxInvoiceNumber := edtTaxInvoiceNumber.Text;

         if (RQFKOrder2FinObj.taxBookId <> LOW_INT) then
           RQFKOrder2FinObj.taxBookId := RQFKOrder2FinObj.taxBookId
         else
           RQFKOrder2FinObj.taxBookId := LOW_INT;

         if (RQFKOrder2FinObj.costItemId <> LOW_INT) then
           RQFKOrder2FinObj.costItemId := RQFKOrder2FinObj.costItemId
         else
           RQFKOrder2FinObj.costItemId := LOW_INT;

         if (RQFKOrder2FinObj.taxRateId <> LOW_INT) then
           RQFKOrder2FinObj.taxRateId := RQFKOrder2FinObj.taxRateId
         else
           RQFKOrder2FinObj.taxRateId := LOW_INT;

         if (RQFKOrder2FinObj.accountingGroupId <> LOW_INT) then
           RQFKOrder2FinObj.accountingGroupId := RQFKOrder2FinObj.accountingGroupId
         else
           RQFKOrder2FinObj.accountingGroupId := LOW_INT;

         if (cbIsTransferTax.Checked)
            then RQFKOrder2FinObj.isTransferTax := 1
         else RQFKOrder2FinObj.isTransferTax := 0;

         if (cbIsRefinementTax.Checked)
            then RQFKOrder2FinObj.isRefinementTax := 1
         else RQFKOrder2FinObj.isRefinementTax := 0;

         if (cbTaxDocType.ItemIndex <> -1) then
         begin
           RQFKOrder2FinObj.tradeDocTypeCode := Integer(cbTaxDocType.Items.Objects[cbTaxDocType.ItemIndex]);
           RQFKOrder2FinObj.tradeDocTypeName := cbTaxDocType.Items[cbTaxDocType.itemIndex];
         end else
         begin
           RQFKOrder2FinObj.tradeDocTypeCode := LOW_INT;
           RQFKOrder2FinObj.tradeDocTypeName := '';
         end;

         if RQFKOrder2FinObj.code <> Low_INT then
         begin
            TempRQFKOrder2Fin.save(RQFKOrder2FinObj)
         end else
         begin
            TempRQFKOrder2Fin.add(RQFKOrder2FinObj)
         end;
      end;
    end;

  end;
end;



procedure TfrmRQFKOrderEdit.FormCreate(Sender: TObject);
begin
  inherited;
  isStorageOrMOLChanged := false;
  selectedItemIndex := 1;
end;

procedure TfrmRQFKOrderEdit.UpdateGrid(Sender: TObject);
var

  TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
  RQFKOrderItemList: RQFKOrderItemShortList;
  RQFKOrderItemFilterObj : RQFKOrderItemFilter;
  i: Integer;
{
  TempRQOrderItem: RQOrderItemControllerSoapPort;
  RQOrderItemList: RQOrderItemShortList;
  RQOrderItemFilterObj : RQOrderItemFilter;

  TempRQOrder: RQOrderControllerSoapPort;
  RQOrderList: RQOrderShortList;
  RQOrderFilterObj : RQOrderFilter;
}
  totalSum, itemSum: Double;
  vatSum, sum, itemCount: Double;

  TempRQFKOrder: RQFKOrderControllerSoapPort;
  RQFKOrderList: RQFKOrderShortList;
  RQFKOrderFilterObj : RQFKOrderFilter;

  TempSCInvoice: SCInvoiceControllerSoapPort;
  scInvFilter : SCInvoiceFilter;
  scInvList : SCInvoiceShortList;
begin
         sum := 0;
         FormatSettings.DecimalSeparator := '.';

    if pcRQFKOrder.ActivePage = tsRQFKOrderItems then
    begin
         //// !!!
         if (RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_BUFET) or
            (RQFKOrderObj.accountingTypeRef.code in [TK_ACCOUNTINGTYPE_OS]) then
         begin
             HideControls([gbFINMaterials]);
         end;

         RQFKOrderItemFilterObj := RQFKOrderItemFilter.Create;
         SetNullIntProps(RQFKOrderItemFilterObj);
         SetNullXSProps(RQFKOrderItemFilterObj);
         RQFKOrderItemFilterObj.fkOrderRef := RQFKOrderRef.Create;
         RQFKOrderItemFilterObj.fkOrderRef.code := RQFKOrderObj.code;

         TempRQFKOrderItem :=  HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
         //SetGridHeaders(RQFKOrderItemHeaders, sgRQFKOrderItem.ColumnHeaders);

          RQFKOrderItemList := TempRQFKOrderItem.getScrollableFilteredList(RQFKOrderItemFilterObj,0,-1);


            //LastCount:=High(RQFKOrderItemList.list);

            if High(RQFKOrderItemList.list) > -1 then
               sgRQFKOrderItem.RowCount:=High(RQFKOrderItemList.list)+2
            else
              begin
               ClearGrid(sgRQFKOrderItem);
               sgRQFKOrderItem.RowCount:=2;
              end;

             with sgRQFKOrderItem do
              for i:=0 to High(RQFKOrderItemList.list) do
                begin

                    Application.ProcessMessages;
                  if RQFKOrderObj.kind.code <>  RQFKORDER_KIND_WRITEOFFCOUNTERS then
                   begin
                    if RQFKOrderItemList.list[i].code <> Low(Integer) then
                    Cells[0,i+1] := IntToStr(RQFKOrderItemList.list[i].code)
                    else
                    Cells[0,i+1] := '';

                    Cells[1, i+1] := RQFKOrderItemList.list[i].materialName;

                    if (isRQFKOrderForStorage(RQFKOrderObj)) then
                      AddCheckBox(1, i+1, false, false);

                    ///// 15.01.13 Используется для основных средств
                    if (RQFKOrderObj.kind.code = RQFKORDER_KIND_OS_EXPL) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_OS_MOVEMENT)
                    or  ((RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2OUT) and
                        (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_OS)) then
                      Objects[1, i + 1] := TObject(RQFKOrderItemList.list[i].nomenclatureCode);
                    /////

                    if ( ( (RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA) or
                           //(RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM) or
                           (RQFKOrderObj.kind.code = RQFKORDER_KIND_OS_MOVEMENT) or
                           (RQFKOrderObj.kind.code = RQFKORDER_KIND_OS_EXPL) or
                           ((RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2OUT) and
                            (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_OS))) and
                        (RQFKOrderObj.status.code in [RQFKORDER_STATUS_CREATED, RQFKORDER_STATUS_IN_WORK_ON_WAREHOUSE]) and
                        (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_OS) ) then
                      //if HTTPRIORQFKOrder.HTTPWebNode.UserName = 'energynet' then {***}
                        AddCheckBox(1, i+1, false, false);

                    Cells[2, i+1] := RQFKOrderItemList.list[i].measurementName;
                    Cells[3, i+1] := RQFKOrderItemList.list[i].nomenclatureNum;
                    //  для пломб будем склеивать наименование из нескольких полей
                    if (RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA) and
                       (RQFKOrderObj.accountingTypeRef.code in [TK_ACCOUNTINGTYPE_SEAL,
                        TK_ACCOUNTINGTYPE_IMP, TK_ACCOUNTINGTYPE_HOLO])  then
                    Cells[4, i+1] := RQFKOrderItemList.list[i].materialName + ' ' +
                                     RQFKOrderItemList.list[i].sealName + ' ' +
                                     RQFKOrderItemList.list[i].sealColor
                    else
                    Cells[4, i+1] := RQFKOrderItemList.list[i].nomenclatureName;
                    // для пломб в это поле будем выводить серию и стартовый номер в коробке
                    if (RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA) and
                       (RQFKOrderObj.accountingTypeRef.code in [TK_ACCOUNTINGTYPE_SEAL,
                        TK_ACCOUNTINGTYPE_IMP, TK_ACCOUNTINGTYPE_HOLO])  then
                    begin
                        if RQFKOrderItemList.list[i].sealNumberStart <> LOW_INT  then
                        Cells[5, i+1] := RQFKOrderItemList.list[i].sealSeriesStart + ' №' +
                                     IntToStr(RQFKOrderItemList.list[i].sealNumberStart)
                        else
                        Cells[5, i+1] := RQFKOrderItemList.list[i].sealSeriesStart
                    end

                    else
                    Cells[5, i+1] := RQFKOrderItemList.list[i].nomenclatureUnitName;

                    if RQFKOrderItemList.list[i].countGen = nil then
                      Cells[6,i+1] := ''
                    else
                    begin
                      Cells[6,i+1] := RQFKOrderItemList.list[i].countGen.DecimalString;
                    end;


                    if (RQFKOrderObj.kind.code = RQFKORDER_KIND_SALE_PRODUCTS) then
                    begin
                      if (RQFKOrderItemList.list[i].sellingPriceWithoutNds = nil) then
                        Cells[7,i+1] := ''
                      else
                        Cells[7,i+1] := RQFKOrderItemList.list[i].sellingPriceWithoutNds.DecimalString;

                      if (RQFKOrderItemList.list[i].sellingCostWithoutNds = nil) then
                        Cells[8,i+1] := ''
                      else
                      begin
                        Cells[8,i+1] := RQFKOrderItemList.list[i].sellingCostWithoutNds.DecimalString;
                        sum := sum +  StrToFloat(RQFKOrderItemList.list[i].sellingCostWithoutNds.DecimalString);
                      end;
                    end else
                    begin
                      if ((RQFKOrderItemList.list[i].priceWithoutNds = nil) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_WRITEOFFCOUNTERS)) then
                        Cells[7,i+1] := ''
                      else
                        Cells[7,i+1] := RQFKOrderItemList.list[i].priceWithoutNds.DecimalString;

                      if ((RQFKOrderItemList.list[i].sumWithoutNds = nil) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_WRITEOFFCOUNTERS)) then
                        Cells[8,i+1] := ''
                      else
                      begin
                        Cells[8,i+1] := RQFKOrderItemList.list[i].sumWithoutNds.DecimalString;
                        sum := sum +  StrToFloat(RQFKOrderItemList.list[i].sumWithoutNds.DecimalString);
                      end;
                    end;

                    if ((RQFKOrderItemList.list[i].sumNds = nil) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_WRITEOFFCOUNTERS)) then
                        Cells[9,i+1] := ''
                      else
                        Cells[9,i+1] := RQFKOrderItemList.list[i].sumNds.DecimalString;

                    if (RQFKOrderItemList.list[i].weight = nil) then
                      Cells[10,i+1] := ''
                    else
                      Cells[10,i+1] := RQFKOrderItemList.list[i].weight.DecimalString;

                      if (isRQFKOrderForStorage(RQFKOrderObj))
                          or (RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_BUFET) then
                        if (RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_BUFET) then
                          if RQFKOrderItemList.list[i].dateRealiz <> nil then
                             Cells[12,i+1] :=DateToStr(EncodeDate(
                             RQFKOrderItemList.list[i].dateRealiz.Year,
                             RQFKOrderItemList.list[i].dateRealiz.Month,
                            RQFKOrderItemList.list[i].dateRealiz.Day))
                          else
                            Cells[12,i+1] := ''
                        else
                          Cells[12, i+1] := RQFKOrderItemList.list[i].storageZoneShortName;

                      Cells[13, i+1] := RQFKOrderItemList.list[i].fundingTypeStr;





  {
                    if RQFKOrderItemList.list[i].finCode = Low(Integer) then
                      Cells[1,i+1] := ''
                    else
                      Cells[1,i+1] := IntToStr(RQFKOrderItemList.list[i].finCode);
                    if RQFKOrderItemList.list[i].nomenclatureCode = Low(Integer) then
                      Cells[2,i+1] := ''
                    else
                      Cells[2,i+1] := IntToStr(RQFKOrderItemList.list[i].nomenclatureCode);
                    Cells[3,i+1] := RQFKOrderItemList.list[i].nomenclatureNum;
                    Cells[4,i+1] := RQFKOrderItemList.list[i].nomenclatureBalSch;
                    Cells[5,i+1] := RQFKOrderItemList.list[i].nomenclatureName;
                    if RQFKOrderItemList.list[i].nomenclatureUnitCode = Low(Integer) then
                      Cells[6,i+1] := ''
                    else
                      Cells[6,i+1] := IntToStr(RQFKOrderItemList.list[i].nomenclatureUnitCode);
                    Cells[7,i+1] := RQFKOrderItemList.list[i].nomenclatureUnitName;
                    if RQFKOrderItemList.list[i].countGen = nil then
                      Cells[8,i+1] := ''
                    else
                      Cells[8,i+1] := RQFKOrderItemList.list[i].countGen.DecimalString;
  }
  {
                    if RQFKOrderItemList.list[i].price = nil then
                      Cells[9,i+1] := ''
                    else
                      Cells[9,i+1] := RQFKOrderItemList.list[i].price.DecimalString;
  }
  {
                    if RQFKOrderItemList.list[i].sumGen = nil then
                      Cells[10,i+1] := ''
                    else
                      Cells[10,i+1] := RQFKOrderItemList.list[i].sumGen.DecimalString;
                    Cells[11,i+1] := RQFKOrderItemList.list[i].userGen;
  }
                    end
                    else
                    begin
                          // отображаем строки для списания счетчиков
                          if RQFKOrderItemList.list[i].code <> Low(Integer) then
                        Cells[0,i+1] := IntToStr(RQFKOrderItemList.list[i].code)
                        else
                        Cells[0,i+1] := '';

                        Cells[1, i+1] := RQFKOrderItemList.list[i].materialName;
                         // выберем счет из инвойсов
                            TempSCInvoice := HTTPRIOSCInvoice as SCInvoiceControllerSoapPort;
                            scInvFilter := SCInvoiceFilter.Create;
                             SetNullXSProps(scInvFilter);
                             SetNullIntProps(scInvFilter);
                             scInvFilter.fkOrderItemRef := RQFKOrderItemRef.Create;
                             scInvFilter.fkOrderItemRef.code := RQFKOrderItemList.list[i].code;
                             scInvList := TempSCInvoice.getScrollableFilteredList(scInvFilter, 0, -1);
                             if scInvList.totalCount >= 0 then
                                Cells[2, i+1] := scInvList.list[0].subaccountcode; // счет из разнарядки
                        if RQFKOrderItemList.list[i].countGen = nil then
                          Cells[3,i+1] := ''
                        else
                        begin
                          Cells[3,i+1] := RQFKOrderItemList.list[i].countGen.DecimalString;
                        end;
                    end;
                    //LastRow:=i+1;
                    sgRQFKOrderItem.RowCount:= i + 2;

                end;
             //ColCount:=ColCount+1;
             sgRQFKOrderItem.Row:=1;
             //pnlTotalSum.Caption := FloatToStr(sum);
             pnlTotalSum.Caption := SeparateThousands(FloatToStr(sum));

        Application.ProcessMessages;
        sgRQFKOrderItemClick(Sender);

        if selectedItemIndex <> 0 then
        begin
        if sgRQFKOrderItem.RowCount > selectedItemIndex then
           sgRQFKOrderItem.Row := selectedItemIndex
        else
           sgRQFKOrderItem.Row := sgRQFKOrderItem.RowCount - 1;
        end
        else
        sgRQFKOrderItem.Row:=1;
    end;


  if pcRQFKOrder.ActivePage = tsRQFKOrderOut then
  begin
    ClearGrid(sgRQFKOrder);

    TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

    RQFKOrderFilterObj := RQFKOrderFilter.Create;
    SetNullIntProps(RQFKOrderFilterObj);
    SetNullXSProps(RQFKOrderFilterObj);

    RQFKOrderFilterObj.conditionSQL := 'code in (' +
      'select o2o.fkorderoutrefcode from rqfkorder2fkorder o2o ' +
      'where o2o.fkorderinrefcode = ' + IntToStr(RQFKOrderObj.code) + ')';

    RQFKOrderFilterObj.orderBySQL := 'dategen desc, statuscode desc';

    RQFKOrderList := TempRQFKOrder.getScrollableFilteredList(RQFKOrderFilterObj, 0, -1);

    if High(RQFKOrderList.list) > -1 then
       sgRQFKOrder.RowCount := High(RQFKOrderList.list) + 2
    else
       sgRQFKOrder.RowCount := 2;

     with sgRQFKOrder do
      for i := 0 to High(RQFKOrderList.list) do
        begin
          Application.ProcessMessages;
          if RQFKOrderList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(RQFKOrderList.list[i].code)
          else
          Cells[0,i+1] := '';
          Cells[1,i+1] := RQFKOrderList.list[i].numberDoc;
          if RQFKOrderList.list[i].dateGen = nil then
            Cells[2,i+1] := ''
          else
            Cells[2,i+1] := XSDate2String(RQFKOrderList.list[i].dateGen);

          Cells[3,i+1] := RQFKOrderList.list[i].molInCode;

          Cells[4,i+1] := RQFKOrderList.list[i].molInName;

          Cells[5,i+1] := RQFKOrderList.list[i].molOutCode;
          Cells[6,i+1] := RQFKOrderList.list[i].molOutName;
          Cells[7, i+1] := RQFKOrderList.list[i].statusName;
          Cells[8,i+1] := RQFKOrderList.list[i].expeditorCode;
          Cells[9,i+1] := RQFKOrderList.list[i].expeditorName;
          Cells[10,i+1] := RQFKOrderList.list[i].warrantNumber;
          if RQFKOrderList.list[i].warrantDate = nil then
            Cells[11,i+1] := ''
          else
            Cells[11,i+1] := XSDate2String(RQFKOrderList.list[i].warrantDate);
          Cells[12,i+1] := RQFKOrderList.list[i].warrantFIO;

          Cells[13,i+1] := RQFKOrderList.list[i].userAdd;
          if RQFKOrderList.list[i].dateAdd = nil then
            Cells[14,i+1] := ''
          else
            Cells[14,i+1] := XSDateTimeWithDate2String(RQFKOrderList.list[i].dateAdd);

          Cells[15,i+1] := RQFKOrderList.list[i].userGen;
          if RQFKOrderList.list[i].dateEdit = nil then
            Cells[16,i+1] := ''
          else
            Cells[16,i+1] := XSDateTimeWithDate2String(RQFKOrderList.list[i].dateEdit);

          sgRQFKOrder.RowCount := i + 2;
        end;

     sgRQFKOrder.Row := 1;
    
  end;
end;

procedure TfrmRQFKOrderEdit.spbRQFKOrderKindKindClick(Sender : TObject);
var
   frmRQFKOrderKindShow: TfrmRQFKOrderKindShow;
begin
   frmRQFKOrderKindShow:=TfrmRQFKOrderKindShow.Create(Application,fmNormal);
   try
      with frmRQFKOrderKindShow do
        if ShowModal = mrOk then
        begin
            try
               if RQFKOrderObj.kind = nil then RQFKOrderObj.kind := RQFKOrderKind.Create();
               RQFKOrderObj.kind.code := StrToInt(GetReturnValue(sgRQFKOrderKind,0));
               edtRQFKOrderKindKindName.Text:=GetReturnValue(sgRQFKOrderKind,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQFKOrderKindShow.Free;
   end;
end;



procedure TfrmRQFKOrderEdit.spbRQFKOrderStatusStatusClick(Sender : TObject);
var
   frmRQFKOrderStatusShow: TfrmRQFKOrderStatusShow;
begin
   frmRQFKOrderStatusShow:=TfrmRQFKOrderStatusShow.Create(Application,fmNormal);
   try
      with frmRQFKOrderStatusShow do
        if ShowModal = mrOk then
        begin
            try
               if RQFKOrderObj.status = nil then RQFKOrderObj.status := RQFKOrderStatus.Create();
               RQFKOrderObj.status.code := StrToInt(GetReturnValue(sgRQFKOrderStatus,0));
               edtRQFKOrderStatusStatusName.Text:=GetReturnValue(sgRQFKOrderStatus,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQFKOrderStatusShow.Free;
   end;
end;



procedure TfrmRQFKOrderEdit.spbRQFKOrderTypeClick(Sender: TObject);
var
   frmRQFKOrderTypeShow: TfrmRQFKOrderTypeShow;
begin
   frmRQFKOrderTypeShow:=TfrmRQFKOrderTypeShow.Create(Application,fmNormal);
   try
      with frmRQFKOrderTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if RQFKOrderObj.typeRef = nil then RQFKOrderObj.typeRef := RQFKOrderType.Create();
               RQFKOrderObj.typeRef.code := StrToInt(GetReturnValue(sgRQFKOrderType,0));
               edtRQFKOrderTypeName.Text:=GetReturnValue(sgRQFKOrderType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQFKOrderTypeShow.Free;
   end;
end;

procedure TfrmRQFKOrderEdit.spbRQOrgOrgClick(Sender : TObject);
var 
   frmRQOrgShow: TfrmRQOrgShow;
   sDate, lDate, nDate: String;
   tmpOrg: RQOrg;
begin
{
   frmRQOrgShow := TfrmRQOrgShow.Create(Application,fmNormal);
   frmRQOrgShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmRQOrgShow do
        if ShowModal = mrOk then
        begin
            try
               if RQFKOrderObj.org = nil then
               begin
                 RQFKOrderObj.org := RQOrg.Create();
                 SetNullIntProps(RQFKOrderObj.org);
                 SetNullXSProps(RQFKOrderObj.org);
               end;
               edtRQOrgOrgName.Text := GetReturnValue(sgRQOrg,1);
               RQFKOrderObj.org.id := StrToInt(GetReturnValue(sgRQOrg,0)); // по ИД будем смотреть на серваке ...
               RQFKOrderObj.org.codeorg := GetReturnValue(sgRQOrg,8);
               RQFKOrderObj.org.name := GetReturnValue(sgRQOrg,1);
               RQFKOrderObj.org.ukr_name := GetReturnValue(sgRQOrg,9);
               RQFKOrderObj.org.okpo := GetReturnValue(sgRQOrg,2);
               RQFKOrderObj.org.nalog_num := GetReturnValue(sgRQOrg,3);
               RQFKOrderObj.org.svidet_num := GetReturnValue(sgRQOrg,4);
               RQFKOrderObj.org.adr := GetReturnValue(sgRQOrg,5);
               RQFKOrderObj.org.tel := GetReturnValue(sgRQOrg,6);
               RQFKOrderObj.org.country := GetReturnValue(sgRQOrg,10);
               RQFKOrderObj.org.region := GetReturnValue(sgRQOrg,11);
               RQFKOrderObj.org.ministry := GetReturnValue(sgRQOrg,12);
               RQFKOrderObj.org.ownership := StrToInt(GetReturnValue(sgRQOrg,13));
               RQFKOrderObj.org.type_ := GetReturnValue(sgRQOrg,14);
               RQFKOrderObj.org.master_code := GetReturnValue(sgRQOrg,15);

               //RQFKOrderObj.org.date_svidet := TXSDate.Create;
               //RQFKOrderObj.org.likv_date := TXSDate.Create;
               //RQFKOrderObj.org.dateNalogform := TXSDate.Create;

               sDate := GetReturnValue(sgRQOrg,16);
                 if sDate <> '' then
                   begin
                    RQFKOrderObj.org.date_svidet := TXSDate.Create;
                    RQFKOrderObj.org.date_svidet.XSToNative(GetXSDate(StrToDate(sDate)));
                   end;
               lDate := GetReturnValue(sgRQOrg,17);
                 if lDate <> '' then
                   begin
                    RQFKOrderObj.org.likv_date := TXSDate.Create;
                    RQFKOrderObj.org.likv_date.XSToNative(GetXSDate(StrToDate(lDate)));
                   end;

               RQFKOrderObj.org.except_flag := GetReturnValue(sgRQOrg,18);
               RQFKOrderObj.org.likv_flag := GetReturnValue(sgRQOrg,19);
               RQFKOrderObj.org.budget_flag := GetReturnValue(sgRQOrg,20);

               nDate := GetReturnValue(sgRQOrg,21);
                 if nDate <> '' then
                   begin
                    RQFKOrderObj.org.date_nalogform := TXSDate.Create;
                    RQFKOrderObj.org.date_nalogform.XSToNative(GetXSDate(StrToDate(nDate)));
                   end;

               RQFKOrderObj.org.id_nalogform := StrToInt(GetReturnValue(sgRQOrg,22));
               RQFKOrderObj.org.adr_legal := GetReturnValue(sgRQOrg,23);
               RQFKOrderObj.org.Primechan := GetReturnValue(sgRQOrg,7);



               edtRQOrgOrgName.Text:=GetReturnValue(sgRQOrg,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQOrgShow.Free;
   end;
}

  if DMReports.selectRQOrg(tmpOrg, AX_CONTRAGENT_TYPE_VENDOR, RQFKOrderObj.org) then
  begin
    RQFKOrderObj.org := tmpOrg;
    edtRQOrgOrgName.Text := RQFKOrderObj.org.name;
  end;
end;



procedure TfrmRQFKOrderEdit.spbPlanMOLClick(Sender: TObject);
var
  i : Integer;
  f : FINMolFilter;
  frmFINMolShow : TfrmFINMolShow;

  molSel : boolean;

  f1 : SCMolFilter;
  frmSCMolShow : TfrmSCMolShow;

  fOS : OSMolFilter;
  frmOSMolShow : TfrmOSMolShow;

  TempENMol : ENMolControllerSoapPort;
  ENMolList : ENMolShortList;
  filterMol : ENMolFilter;
  molCodes : string;

begin

  molCodes := '';

  if (isRQFKOrderForStorageSeriously(RQFKOrderObj))
       and (cbTKAccountingType.ItemIndex + 1 = TK_ACCOUNTINGTYPE_TMC) then
  if (RQFKOrderObj.storageRef = nil) or (RQFKOrderObj.storageRef.code = LOW_INT) then
  begin
    Application.MessageBox(PChar('Выберите Склад!!!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Exit;
  end;

       if (isRQFKOrderForStorage(RQFKOrderObj)
       and (not ((RQFKOrderObj.storageRef = nil) or (RQFKOrderObj.storageRef.code = LOW_INT)))
       ) then begin
    try
      filterMol := ENMolFilter.Create;
      SetNullIntProps(filterMol);
      SetNullXSProps(filterMol);

      filterMol.conditionSQL := ' code in (' +
         'select em.molrefcode from rqstorage2enmol em where em.storagerefcode = ' + IntToStr(RQFKOrderObj.storageRef.code) + ')';

      TempENMol := HTTPRIOENMol as ENMolControllerSoapPort;
      ENMolList := TempENMol.getScrollableFilteredList(ENMolFilter(filterMol), 0, -1);

      molCodes := '';

      if (ENMolList.totalCount = 0) then
      begin
        Application.MessageBox(PChar('Ошибка при определении МОЛа!!! Заполните справочник складов!!!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
        Exit;
      end;

      for i := 0 to ENMolList.totalCount - 1 do
      begin
        AddListPos(molCodes, ''''+ ENMolList.list[i].finCode+'''');
      end;
    except
      on EConvertError do Exit;
    end;

       end;

  // 04.10.2012 +++ для приходов ТМЦ
  // по складу фильтруем по связке в EnergyNET МОЛа, потом в ФК......
  if (cbTKAccountingType.ItemIndex + 1 = TK_ACCOUNTINGTYPE_TMC) then
  begin
    if (molCodes <> '') then
    begin
      f := FINMolFilter.Create;
      SetNullXSProps(f);
      SetNullIntProps(f);
      f.state := 1;
      //f.conditionSQL := ' UMC_DBA.TDIVISION.ID in (' + molCodes + ')';
      DMReports.generateMOLFilter(f, molCodes);
      frmFINMolShow := TfrmFINMolShow.Create(Application, fmNormal, f);
      DisableActions([frmFINMolShow.actFilter, frmFINMolShow.actNoFilter]);
    end else
    begin
      f := FINMolFilter.Create;
      SetNullXSProps(f);
      SetNullIntProps(f);
      f.state := 1;
      frmFINMolShow := TfrmFINMolShow.Create(Application, fmNormal, f);
    end;

    try
      frmFINMolShow.isFiltered := true;

      with frmFINMolShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
          try
            RQFKOrderObj.molOutCode := GetReturnValue(sgFINMol,0);
            RQFKOrderObj.molOutName := GetReturnValue(sgFINMol,1);

            edtMolOutName.Text := RQFKOrderObj.molOutName;
            edtMolOutCode.Text := RQFKOrderObj.molOutCode;

            isStorageOrMOLChanged := true;
          except
            on EConvertError do Exit;
          end;
        end;
      end;
    finally
      frmFINMolShow.Free;
    end;
  end else

  if ( (cbTKAccountingType.ItemIndex + 1)  in [TK_ACCOUNTINGTYPE_TMC{, TK_ACCOUNTINGTYPE_OS }]) then
  begin
     f := FINMolFilter.Create;
     SetNullXSProps(f);
     SetNullIntProps(f);
     f.state := 1; // ???? ?????? ?????????? ...

     //f.text := edtMolOutCode.Text;
     //f.id := edtMolOutCode.Text;

       frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

       try

          // оно типа ТУТ отфильтровано ...
          //if length(f.conditionSQL) > 0 then
            frmFINMolShow.isFiltered := true;

          with frmFINMolShow do begin
            DisableActions([ actEdit, actInsert ]);
            if ShowModal = mrOk then
            begin
                try

                   RQFKOrderObj.molOutCode := GetReturnValue(sgFINMol,0);
                   RQFKOrderObj.molOutName := GetReturnValue(sgFINMol,1);

                   edtMolOutName.Text := RQFKOrderObj.molOutName;  //GetReturnValue(sgFINMol,0);
                   edtMolOutCode.Text := RQFKOrderObj.molOutCode;

                   isStorageOrMOLChanged := true;
                except
                   on EConvertError do Exit;
                end;
            end;
          end;
       finally
          frmFINMolShow.Free;
       end;

   end;

  if ( cbTKAccountingType.ItemIndex + 1 in [TK_ACCOUNTINGTYPE_COUNTER, TK_ACCOUNTINGTYPE_SEAL,
                                            TK_ACCOUNTINGTYPE_IMP, TK_ACCOUNTINGTYPE_HOLO]) then
  begin
     f1 := SCMolFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     if(molCodes <> '') then begin
       f1.conditionSQL := 'SCMOL.KOD_MOL IN (' + molCodes + ')';
     end;
     //f.state := 1; // ???? ?????? ?????????? ...

     //f.text := edtMolInCode.Text;

       frmSCMolShow:=TfrmSCMolShow.Create(Application,fmNormal, f1);

       try

          // оно типа ТУТ отфильтровано ...
          //if length(f.conditionSQL) > 0 then
          //  frmSCMolShow.isFiltered := true;

          with frmSCMolShow do
          begin
            DisableActions([ actEdit, actInsert ]);
            if ShowModal = mrOk then
            begin
                try

                   RQFKOrderObj.molOutCode := GetReturnValue(sgSCMol,0);
                   RQFKOrderObj.molOutName := GetReturnValue(sgSCMol,3) + ' ' + GetReturnValue(sgSCMol,2);

                   edtMolOutName.Text := RQFKOrderObj.molOutName;  //GetReturnValue(sgFINMol,0);
                   edtMolOutCode.Text := RQFKOrderObj.molOutCode;

                   isStorageOrMOLChanged := true;
                except
                   on EConvertError do Exit;
                end;
            end;
          end;
       finally
          frmSCMolShow.Free;
       end;
  end;

  if (cbTKAccountingType.ItemIndex + 1 = TK_ACCOUNTINGTYPE_OS) then
  begin
     fOS := OSMolFilter.Create;
     SetNullXSProps(fOS);
     SetNullIntProps(fOS);
     //f.state := 1; // ???? ?????? ?????????? ...

     //f.text := edtMolInCode.Text;

       frmOSMolShow := TfrmOSMolShow.Create(Application, fmNormal, fOS);

       try

          // оно типа ТУТ отфильтровано ...
          //if length(f.conditionSQL) > 0 then
          //  frmSCMolShow.isFiltered := true;

          with frmOSMolShow do
          begin
            DisableActions([ actEdit, actInsert ]);
            if ShowModal = mrOk then
            begin
                try

                   RQFKOrderObj.molOutCode := GetReturnValue(sgOSMol,0);
                   RQFKOrderObj.molOutName := GetReturnValue(sgOSMol,2);

                   edtMolOutName.Text := RQFKOrderObj.molOutName;  //GetReturnValue(sgFINMol,0);
                   edtMolOutCode.Text := RQFKOrderObj.molOutCode;

                   ///// 23.07.12 NET-801
                   // При изменении кода МОЛа очищаем подразделение, т.к. его номер должен соответствовать коду МОЛа
                   // (или наоборот)
                   RQFKOrderObj.kod_podr := '';
                   RQFKOrderObj.name_podr := '';
                   /////

                   isStorageOrMOLChanged := true;
                except
                   on EConvertError do Exit;
                end;
            end;
          end;
       finally
          frmOSMolShow.Free;
       end;
  end;

  // Для этих видов ордеров совпадает МОЛ-получатель с МОЛ-отправителем
  if RQFKOrderObj.kind.code in [RQFKORDER_KIND_ZONE_CHANGING] then
  begin
    edtMolInName.Text := RQFKOrderObj.molOutName;
    edtMolInCode.Text := RQFKOrderObj.molOutCode;
    RQFKOrderObj.molInCode := RQFKOrderObj.molOutCode;
    RQFKOrderObj.molInName := RQFKOrderObj.molOutName;
  end;

  // После выбора МОЛа проинициализируем дефолтных подписантов
  if ((DialogState = dsInsert) or (DialogState = dsEdit)) and
     (DMReports.isSignable(RQFKOrderObj)) then
    initDFDocSignersGrid;
end;

procedure TfrmRQFKOrderEdit.pcRQFKOrderChange(Sender: TObject);
var i, j, idx : Integer;
  TempRQFKOrder2Fin : RQFKOrder2FinServicesControllerSoapPort;
  f : RQFKOrder2FinServicesFilter;
  f2sArr : RQFKOrder2FinServicesController.ArrayOfInteger;
  TempENDepartment : ENDepartmentControllerSoapPort;
  TempRQFKBSDescription : RQFKBSDescriptionControllerSoapPort;

  Tempv_Trade_Doc_Type : v_Trade_Doc_TypeControllerSoapPort;
  docTypeFilter : v_Trade_Doc_TypeFilter;
  docTypeList : v_Trade_Doc_TypeShortList;

  TempRQFKOrder : RQFKOrderControllerSoapPort;
  RQFKOrderFilterObj : RQFKOrderFilter;
  RQFKOrderList : RQFKOrderShortList;

  TempRQOrder : RQOrderControllerSoapPort;
  orderFilter : RQOrderFilter;
  orderList : RQOrderShortList;

  TempRQBill : RQBillControllerSoapPort;
  RQBillList : RQBillShortList;
  billFilter : RQBillFilter;
begin

  if ((pcRQFKOrder.ActivePage = tsServicesFromSide) and (DialogState = dsView)) then
    DisableActions([actInsert, actDelete], False)
  else if (DialogState = dsView) then
    DisableActions([actInsert, actEdit, actDelete, actFINDelete]);


  // -- tsRQOrder
  if (pcRQFKOrder.ActivePage = tsRQOrder) then
  begin
    ClearGrid(sgRQOrder);
    TempRQOrder := HTTPRIORQOrder as RQOrderControllerSoapPort;

    orderFilter := RQOrderFilter.Create;
    SetNullIntProps(orderFilter);
    SetNullXSProps(orderFilter);

    orderFilter.conditionSQL :=
      'rqorder.code in (select f2o.rqorderrefcode ' +
      ' from rqfkorder2rqorder f2o where f2o.fkorderrefcode = ' + IntToStr(RQFKOrderObj.code) + ')';
    orderFilter.orderBySQL := 'dategen desc';

    orderList := TempRQOrder.getScrollableFilteredList(orderFilter, 0, -1);

    if High(orderList.list) > -1 then
       sgRQOrder.RowCount := High(orderList.list) + 2
    else
       sgRQOrder.RowCount := 2;

    with sgRQOrder do
    for i := 0 to High(orderList.list) do
    begin
      Application.ProcessMessages;
      if orderList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(orderList.list[i].code)
      else
        Cells[0,i+1] := '';

      Cells[1,i+1] := orderList.list[i].numberDoc;
      Cells[2,i+1] := orderList.list[i].numberProject;

      if orderList.list[i].orderPeriod = nil then
        Cells[3,i+1] := ''
      else
        Cells[3,i+1] := MonthesNames[orderList.list[i].orderPeriod.Month] + ' ' +
                        IntToStr(orderList.list[i].orderPeriod.Year) + ' р.';

      if orderList.list[i].dateGen = nil then
        Cells[4,i+1] := ''
      else
        Cells[4,i+1] := XSDate2String(orderList.list[i].dateGen);

      Cells[5, i + 1] := orderList.list[i].departmentRefShortName;
      Cells[6, i + 1] := orderList.list[i].rqOrderFormName;
      Cells[7, i + 1] := orderList.list[i].rqOrderTypeName;
      Cells[8, i + 1] := orderList.list[i].rqOrderResourceName;
      Cells[9, i + 1] := orderList.list[i].budgetRefShortName;

      Colors[9, i + 1] := clYellow;

      if orderList.list[i].sumGen <> nil then
        Cells[10, i + 1] := SeparateThousands(orderList.list[i].sumGen.DecimalString)
      else
        Cells[10, i + 1] := '0.00';

      Alignments[10, i + 1] := taRightJustify;
      Colors[10, i + 1] := $0080FF80;

      Cells[11, i + 1] := orderList.list[i].statusRefName;
      Cells[12, i + 1] := orderList.list[i].userGen;

      sgRQOrder.RowCount := i + 2;
    end;

    sgRQOrder.Row := 1;
  end;


  // -- tsServicesFromSide
  if (pcRQFKOrder.ActivePage = tsServicesFromSide) then
  begin
    ClearGrid(sgActsServicesFS);
    TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

    RQFKOrderFilterObj := RQFKOrderFilter.Create;
    SetNullIntProps(RQFKOrderFilterObj);
    SetNullXSProps(RQFKOrderFilterObj);

    RQFKOrderFilterObj.conditionSQL := 'code in (' +
      ' select f.fkorderoutrefcode from rqfkorder2fkorder f ' +
      ' where f.typerefcode = ' + IntToStr(RQFKORDER2FKORDERTYPE_DP_2_SERVICESFROMSIDE) +
      ' and f.fkorderinrefcode = ' + IntToStr(RQFKOrderObj.code) + ')';

    RQFKOrderFilterObj.orderBySQL := 'dategen desc, statuscode desc';

    RQFKOrderList := TempRQFKOrder.getScrollableFilteredList(RQFKOrderFilterObj, 0, -1);

    if High(RQFKOrderList.list) > -1 then
       sgActsServicesFS.RowCount := High(RQFKOrderList.list) + 2
    else
       sgActsServicesFS.RowCount := 2;

     with sgActsServicesFS do
      for i := 0 to High(RQFKOrderList.list) do
        begin
          Application.ProcessMessages;
          if RQFKOrderList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(RQFKOrderList.list[i].code)
          else
          Cells[0,i+1] := '';
          Cells[1,i+1] := RQFKOrderList.list[i].numberDoc;
          if RQFKOrderList.list[i].dateGen = nil then
            Cells[2,i+1] := ''
          else
            Cells[2,i+1] := XSDate2String(RQFKOrderList.list[i].dateGen);

          Cells[3,i+1] := RQFKOrderList.list[i].orgOkpo;
          Cells[4,i+1] := RQFKOrderList.list[i].orgName;
          Cells[5,i+1] := RQFKOrderList.list[i].sumWithoutNds.DecimalString;
          Cells[6,i+1] := RQFKOrderList.list[i].statusName;
          Cells[7,i+1] := RQFKOrderList.list[i].userAdd;

          if RQFKOrderList.list[i].dateAdd = nil then
            Cells[8,i+1] := ''
          else
            Cells[8,i+1] := XSDateTimeWithDate2String(RQFKOrderList.list[i].dateAdd);

          Cells[9,i+1] := RQFKOrderList.list[i].userGen;

          if RQFKOrderList.list[i].dateEdit = nil then
            Cells[10,i+1] := ''
          else
            Cells[10,i+1] := XSDateTimeWithDate2String(RQFKOrderList.list[i].dateEdit);

          sgActsServicesFS.RowCount := i + 2;
        end;

     sgActsServicesFS.Row := 1;
  end;

  if pcRQFKOrder.ActivePage = tsFinServices then
  begin
    ///////////////////////////////
    cbTaxDocType.Clear;

    docTypeFilter := v_Trade_Doc_TypeFilter.Create;
    SetNullIntProps(docTypeFilter);

    Tempv_Trade_Doc_Type := HTTPRIOv_Trade_Doc_Type as v_Trade_Doc_TypeControllerSoapPort;

    docTypeList := Tempv_Trade_Doc_Type.getScrollableFilteredList(docTypeFilter,0,-1);
    for i:=0 to docTypeList.totalCount-1 do
    begin
      cbTaxDocType.Items.AddObject(docTypeList.list[i].name, TObject(docTypeList.list[i].code));
    end;

    cbTaxDocType.DropDownCount := docTypeList.totalCount + 1;
    ///////////////////////////////

    cbIsTax.ItemIndex := -1;

    HideControls([gbFinServices], True);

    if (DialogState = dsEdit) then
    begin
      DisableControls([edtKau1476, edtKauName1476, edtKau2494, edtKauName2494,
         edtTaxBookId, edtTaxBook, edtCostItemId, edtCostItem,
         edtTaxRateId, edtTaxRateName, edtTaxRate, edtAccountingGroup, edtAccountingGroupId,
         edtAssetAccount, edtAssetName,
         edtDimensionPurposeNum30900, edtDescriptDimensionPurpose30900  ]);
      DenyBlankValues([edtKau1476, edtKauName1476, edtKau2494, edtKauName2494, edtCostItemId, edtCostItem,
         edtTaxBookId, edtTaxBook, edtTaxInvoiceNumber, edtTaxInvoiceDateGen,
         edtTaxRateId, edtTaxRateName, edtTaxRate, edtAccountingGroup, edtAccountingGroupId
         ]);
    end;

    f := RQFKOrder2FinServicesFilter.Create();
    SetNullXSProps(f);
    SetNullIntProps(f);
    f.fkOrderRef := RQFKOrderRef.Create;
    f.fkOrderRef.code := RQFKOrderObj.code;

    TempRQFKOrder2Fin := HTTPRIORQFKOrder2FinServices as RQFKOrder2FinServicesControllerSoapPort;

    try
      f2sArr := TempRQFKOrder2Fin.getScrollableFilteredCodeArray(f, 0, -1);
      if High(f2sArr) > -1 then
          RQFKOrder2FinObj := TempRQFKOrder2Fin.getObject(f2sArr[0]);
    except
      on EConvertError do Exit;
    end;

    HideControls([gbFinServices], False);

    if (RQFKOrder2FinObj <> nil) then
    begin
      edtKau1476.Text := RQFKOrder2FinObj.kau_1476;
      edtKauName1476.Text := RQFKOrder2FinObj.name_1476;

      edtKau2494.Text := RQFKOrder2FinObj.kau_2494;
      edtKauName2494.Text := RQFKOrder2FinObj.name_2494;


      if (RQFKOrder2FinObj.isTransferTax = 1) then
        cbIsTransferTax.Checked := True
      else
        cbIsTransferTax.Checked := False;

      if (RQFKOrder2FinObj.isRefinementTax = 1) then
        cbIsRefinementTax.Checked := True
      else
        cbIsRefinementTax.Checked := False;


      //if (RQFKOrder2FinObj.tradeDocTypeCode <> LOW_INT) then
      //begin
        idx := -1;
        for i:=0 to cbTaxDocType.Items.Count-1 do
        begin
           if (Integer(cbTaxDocType.Items.Objects[i])= RQFKOrder2FinObj.tradeDocTypeCode)
              then idx := i;
        end;
        cbTaxDocType.ItemIndex := idx;
      //end;


      if (RQFKOrder2FinObj <> nil) and (RQFKOrder2FinObj.isTax <> Low(Integer)) then
        cbIsTax.ItemIndex := RQFKOrder2FinObj.isTax
      else
        cbIsTax.ItemIndex := -1;

      if (RQFKOrder2FinObj <> nil) and
            ((RQFKOrder2FinObj.departmentRef <> nil) and (RQFKOrder2FinObj.departmentRef.code <> Low(Integer))) then
        // дернуть департмент
       begin
         TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
         edtDepartment.Text := TempENDepartment.getObject(RQFKOrder2FinObj.departmentRef.code).shortName;
       end;

      if (RQFKOrder2FinObj.descriptionRef <> nil) and (RQFKOrder2FinObj.descriptionRef.code <> Low(Integer)) then
      begin
        TempRQFKBSDescription := HTTPRIORQFKBSDescription as RQFKBSDescriptionControllerSoapPort;
        edtDescription.Text := TempRQFKBSDescription.getObject(RQFKOrder2FinObj.descriptionRef.code).name;
      end;

      if (RQFKOrder2FinObj.fkBankingServicesTypeRef <> nil)
            and (RQFKOrder2FinObj.fkBankingServicesTypeRef.code <> Low(Integer)) then
        cbBankingServices.ItemIndex := RQFKOrder2FinObj.fkBankingServicesTypeRef.code - 1
      else
        cbBankingServices.ItemIndex := -1;


       ////////////////  налоговые реквизиты  ////////////////
       edtTaxInvoiceNumber.Text := RQFKOrder2FinObj.taxInvoiceNumber;
	   
	   SetDateFieldForDateTimePicker(edtTaxInvoiceDateGen, RQFKOrder2FinObj.taxInvoiceDateGen);

       edtTaxBook.Text := RQFKOrder2FinObj.taxBook;
       if (RQFKOrder2FinObj.taxBookId <> LOW_INT) then
          edtTaxBookId.Text := IntToStr(RQFKOrder2FinObj.taxBookId)
       else
          edtTaxBookId.Text := '';

       edtCostItem.Text := RQFKOrder2FinObj.costItem;
       if (RQFKOrder2FinObj.costItemId <> LOW_INT) then
          edtCostItemId.Text := IntToStr(RQFKOrder2FinObj.costItemId)
       else
          edtCostItemId.Text := '';

       edtTaxBook.Text := RQFKOrder2FinObj.taxBook;
       if (RQFKOrder2FinObj.taxBookId <> LOW_INT) then
          edtTaxBookId.Text := IntToStr(RQFKOrder2FinObj.taxBookId)
       else
          edtTaxBookId.Text := '';

       edtTaxRateName.Text := RQFKOrder2FinObj.taxRateName;
       if (RQFKOrder2FinObj.taxRateId <> LOW_INT) then
          edtTaxRateId.Text := IntToStr(RQFKOrder2FinObj.taxRateId)
       else
          edtTaxRateId.Text := '';
       if (RQFKOrder2FinObj.taxRate <> LOW_INT) then
          edtTaxRate.Text := IntToStr(RQFKOrder2FinObj.taxRate)
       else
          edtTaxRate.Text := '';

       edtAccountingGroup.Text := RQFKOrder2FinObj.accountingGroup;
       if (RQFKOrder2FinObj.accountingGroupId <> LOW_INT) then
          edtAccountingGroupId.Text := IntToStr(RQFKOrder2FinObj.accountingGroupId)
       else
          edtAccountingGroupId.Text := '';

       edtDimensionPurposeNum30900.Text := RQFKOrder2FinObj.purposeNumAX;
       edtDescriptDimensionPurpose30900.Text := RQFKOrder2FinObj.purposeDescriptionAX;

       edtAssetAccount.Text := RQFKOrder2FinObj.assetNumAX;
       edtAssetName.Text := RQFKOrder2FinObj.assetDescriptionAX;
       ///////////////////////////////////////////////////////

    end;

  end;

  if pcRQFKOrder.ActivePage = tsFKOrderPostings then
  begin
    HideControls([btnMoveToFK, btnDeleteFromFK, lblDatePosting, edtDatePosting, btnChangeDatePosting]);
    if RQFKOrderObj.code > LOW_INT then
    begin
      getFKOrderPostingsList(RQFKOrderObj.code);
      getStatus(RQFKOrderObj.code);


      getPostingsListAX(RQFKOrderObj.code);

    end;
  end;
  
    if pcRQFKOrder.ActivePage = tsProvodki then
  begin
    updateProvodkiGrid;
  end;


  //----------------- tsRQBills
  if pcRQFKOrder.ActivePage = tsRQBill then
  begin
    ClearGrid(sgRQBill);
    billFilter := RQBillFilter.Create;
    SetNullIntProps(billFilter);
    SetNullXSProps(billFilter);

    billFilter.conditionSQL :=
      ' rqbill.code in ( ' +
      ' select distinct b.billrefcode from rqbillitem b where b.code in ( ' +
      '   select bi2ei.billitemcode from rqbillitem2enestimattm bi2ei ' +
      '   where bi2ei.estimateitemcode in ( ' +
      '      select foi2ei.estimateitemcode ' +
      '      from rqfkorderitem2enstmttm foi2ei ' +
      '      where foi2ei.fkorderitemrefcode in ( ' +
      ' select i.code from rqfkorderitem i where i.fkorderrefcode = ' + IntToStr(RQFKOrderObj.code) + ' ) ) ) )';

    TempRQBill := HTTPRIORQBill as RQBillControllerSoapPort;
    RQBillList := TempRQBill.getScrollableFilteredList(billFilter, 0, 100);

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

  if (pcRQFKOrder.ActivePage = tsDFDoc) then
  begin
    updateDFDocs;
  end;

  {
  for i:=1 to sgRQFKOrderItem.RowCount-1 do
    for j:=0 to sgRQFKOrderItem.ColCount-1 do
      sgRQFKOrderItem.Cells[j,i]:='';
  }

  ClearGrid(sgRQFKOrderItem);

  UpdateGrid(Sender);
end;

procedure TfrmRQFKOrderEdit.actViewDFDocExecute(Sender: TObject);
begin
  ShowDocumentManagement.openDFDocForViewFromGrid(RQFKOrderObj, Self, sgDFDocs);
end;

procedure TfrmRQFKOrderEdit.actViewExecute(Sender: TObject);
var
  oldCode, rqOrderCode, billCode : Integer;
  TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
  TempRQFKOrder: RQFKOrderControllerSoapPort;
  frmRQFKOrderViev : TfrmRQFKOrderEdit;
  TempRQOrder : RQOrderControllerSoapPort;
  TempRQBill : RQBillControllerSoapPort;
begin

  // -- tsRQOrder
  if (pcRQFKOrder.ActivePage = tsRQOrder) then
  begin
    TempRQOrder := HTTPRIORQOrder as RQOrderControllerSoapPort;
    try
      rqOrderCode := StrToInt(sgRQOrder.Cells[0,sgRQOrder.Row]);
    except
      on EConvertError do Exit;
    end;

    frmRQOrderEdit:=TfrmRQOrderEdit.Create(Application, dsView);
    try
      frmRQOrderEdit.RQOrderObj := TempRQOrder.getObject(rqOrderCode);
      frmRQOrderEdit.ShowModal;
    finally
      frmRQOrderEdit.Free;
      frmRQOrderEdit:=nil;
    end;
  end;


  // -- tsServicesFromSide
  if (pcRQFKOrder.ActivePage = tsServicesFromSide) then
  begin
    TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
    frmRQFKOrderViev := TfrmRQFKOrderEdit.Create(Application, dsView);

    try
      try
        frmRQFKOrderViev.RQFKOrderObj := TempRQFKOrder.getObject(StrToInt(sgActsServicesFS.Cells[0,sgActsServicesFS.Row]));
      except
        on EConvertError do Exit;
      end;

      if (frmRQFKOrderViev.ShowModal = mrOk)
            and (frmRQFKOrderViev.RQFKOrderObj.kind.code = RQFKORDER_KIND_SERVICES_FROM_SIDE) then
        begin
          UpdateGrid(Sender);
        end;
    finally
      frmRQFKOrderViev.Free;
      frmRQFKOrderViev:=nil;
    end;

  end;

  if pcRQFKOrder.ActivePage = tsRQFKOrderItems then
  begin
    TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;

    try
      RQFKOrderItemObj := TempRQFKOrderItem.getObject(StrToInt(sgRQFKOrderItem.Cells[0,sgRQFKOrderItem.Row]));
    except
      on EConvertError do Exit;
    end;

    frmRQFKOrderItemEdit:=TfrmRQFKOrderItemEdit.Create(Application, dsView);
    try

      frmRQFKOrderItemEdit.kindCode :=  RQFKOrderObj.kind.code;
      frmRQFKOrderItemEdit.accountingType := RQFKOrderObj.accountingTypeRef.code;
      frmRQFKOrderItemEdit.statusCode := RQFKOrderObj.status.code;
      frmRQFKOrderItemEdit.orgID := RQFKOrderObj.org.id;
      frmRQFKOrderItemEdit.numberDoc := RQFKOrderObj.numberDoc;

      frmRQFKOrderItemEdit.ShowModal;
    finally
      frmRQFKOrderItemEdit.Free;
      frmRQFKOrderItemEdit:=nil;
    end;
  end;

  if pcRQFKOrder.ActivePage = tsRQFKOrderOut then
  begin
    oldCode := LOW_INT;

    if RQFKOrderObj <> nil then
    oldCode := RQFKOrderObj.code;

    TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
    try
      RQFKOrderObj := TempRQFKOrder.getObject(StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]));
    except
      on EConvertError do Exit;
    end;

    try
      frmRQFKOrderEdit:=TfrmRQFKOrderEdit.Create(Application, dsView);
      try
        frmRQFKOrderEdit.ShowModal;
      finally
        frmRQFKOrderEdit.Free;
        frmRQFKOrderEdit:=nil;
      end;
    finally
    if oldCode > LOW_INT then
      RQFKOrderObj := TempRQFKOrder.getObject(oldCode);
    end;
  end;

  // -------------- tsRQBill
  if pcRQFKOrder.ActivePage = tsRQBill then
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

end;

procedure TfrmRQFKOrderEdit.actEditExecute(Sender: TObject);
Var TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
begin
 TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
   try
     RQFKOrderItemObj := TempRQFKOrderItem.getObject(StrToInt(sgRQFKOrderItem.Cells[0,sgRQFKOrderItem.Row]));
   except
   on EConvertError do Exit;
  end;

  selectedItemIndex := sgRQFKOrderItem.Row;

  // Если изменили склад или МОЛа-получателя, нужно вначале пересохранить ордер
  // (потому что при выборе мест хранения на строках, они будут фильтроваться по новому складу/МОЛу)!!!
  if isStorageOrMOLChanged then
  begin
    Application.MessageBox(PChar('Після зміни отримувача потрібно спочатку зберегти ордер!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  frmRQFKOrderItemEdit:=TfrmRQFKOrderItemEdit.Create(Application, dsEdit);

  try
    frmRQFKOrderItemEdit.kindCode := RQFKOrderObj.kind.code;
    frmRQFKOrderItemEdit.accountingType := RQFKOrderObj.accountingTypeRef.code;
    frmRQFKOrderItemEdit.statusCode := RQFKOrderObj.status.code;
    frmRQFKOrderItemEdit.orgID := RQFKOrderObj.org.id;
    frmRQFKOrderItemEdit.codeOrg := RQFKOrderObj.org.codeorg;
    frmRQFKOrderItemEdit.numberDoc := RQFKOrderObj.numberDoc;
    frmRQFKOrderItemEdit.molOutCode := RQFKOrderObj.molOutCode;


    if (RQFKOrderObj.storageRef <> nil) then
      frmRQFKOrderItemEdit.storageCode := RQFKOrderObj.storageRef.code;

    if frmRQFKOrderItemEdit.ShowModal= mrOk then
      begin
        //TempRQFKOrderItem.save(RQFKOrderItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQFKOrderItemEdit.Free;
    frmRQFKOrderItemEdit:=nil;
  end;

  actUpdateExecute(Sender);
end;

procedure TfrmRQFKOrderEdit.spbMOLInClick(Sender: TObject);
var
 i : Integer;

 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;
 molSel : boolean;

 f1 : SCMolFilter;
 frmSCMolShow : TfrmSCMolShow;

 fOS : OSMolFilter;
 frmOSMolShow : TfrmOSMolShow;

 TempENMol : ENMolControllerSoapPort;
 ENMolList : ENMolShortList;
 filterMol : ENMolFilter;
 tmpCode, molCodes : String;

begin

  if ( (cbTKAccountingType.ItemIndex + 1)  in [TK_ACCOUNTINGTYPE_TMC{, TK_ACCOUNTINGTYPE_OS }]) then
  begin
     f := FINMolFilter.Create;
     SetNullXSProps(f);
     SetNullIntProps(f);
     f.state := 1; // ???? ?????? ?????????? ...

     //f.text := edtMolInCode.Text;

     if (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT) then
     begin
       filterMol := ENMolFilter.Create;
       SetNullIntProps(filterMol);
       SetNullXSProps(filterMol);

       filterMol.typeRef := ENMolTypeRef.Create;
       filterMol.typeRef.code := ENMOLTYPE_STOREKEEPER_CENTRAL;

       TempENMol :=  HTTPRIOENMol as ENMolControllerSoapPort;
       ENMolList := TempENMol.getScrollableFilteredList(ENMolFilter(filterMol),0,-1);

       molCodes := '';

       for i := 0 to ENMolList.totalCount - 1 do begin
         tmpCode := ENMolList.list[i].finCode;
         {SUPP-62547 добавил вставку одинарных кавычек}
         AddListPos(molCodes, '''' + tmpCode + '''');
       end;

       //f.conditionSQL := ' UMC_DBA.TDIVISION.ID in (' + molCodes + ')';
       DMReports.generateMOLFilter(f, molCodes);
     end;

     // 02.08.2012 +++ для продажи товаров только кладовщики
     if (RQFKOrderObj.kind.code = RQFKORDER_KIND_SALE_PRODUCTS) then
     begin
       filterMol := ENMolFilter.Create;
       SetNullIntProps(filterMol);
       SetNullXSProps(filterMol);

       filterMol.conditionSQL := ' ENMOL.TYPEREFCODE in (' + IntToStr(ENMOLTYPE_STOREKEEPER) + ','
               + IntToStr(ENMOLTYPE_STOREKEEPER_CENTRAL) + ')';

       TempENMol :=  HTTPRIOENMol as ENMolControllerSoapPort;
       ENMolList := TempENMol.getScrollableFilteredList(ENMolFilter(filterMol),0,-1);

       molCodes := '';

       for i := 0 to ENMolList.totalCount - 1 do begin
         tmpCode := ENMolList.list[i].finCode;
         {SUPP-62547 добавил вставку одинарных кавычек}
         AddListPos(molCodes, '''' + tmpCode + '''');
       end;

       //f.conditionSQL := ' UMC_DBA.TDIVISION.ID in (' + molCodes + ')';
       DMReports.generateMOLFilter(f, molCodes);
     end;


     frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

     if (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT) then
       DisableActions([frmFINMolShow.actFilter, frmFINMolShow.actNoFilter]);

       try

          // оно типа ТУТ отфильтровано ...
          //if length(f.conditionSQL) > 0 then
            frmFINMolShow.isFiltered := true;

          with frmFINMolShow do begin
            DisableActions([ actEdit, actInsert ]);
            if ShowModal = mrOk then
            begin
                try

                   RQFKOrderObj.molInCode := GetReturnValue(sgFINMol,0);
                   RQFKOrderObj.molInName := GetReturnValue(sgFINMol,1);

                   edtMolInName.Text := RQFKOrderObj.molInName;  //GetReturnValue(sgFINMol,0);
                   edtMolInCode.Text := RQFKOrderObj.molInCode;

                   // Отправитель и Получатель для этих типов ордеров совпадают
                   if RQFKOrderObj.kind.code in [RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT, RQFKORDER_KIND_RASHOD_E2E,
                                                 RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE,
                                                 RQFKORDER_KIND_LOADEXPL_MBP, RQFKORDER_KIND_LOADEXPL_MNMA
                                                 , RQFKORDER_KIND_WRITEOFFCOUNTERS
                                                 , RQFKORDER_KIND_SALE_PRODUCTS
                                                 , RQFKORDER_KIND_ZONE_CHANGING
                                                 , RQFKORDER_KIND_AVAR_OUT
                                                 , RQFKORDER_KIND_AVAR_IN] then
                   begin
                     RQFKOrderObj.molOutCode := GetReturnValue(sgFINMol,0);
                     RQFKOrderObj.molOutName := GetReturnValue(sgFINMol,1);

                     edtMolOutName.Text := RQFKOrderObj.molOutName;  //GetReturnValue(sgFINMol,0);
                     edtMolOutCode.Text := RQFKOrderObj.molOutCode;
                   end;



                except
                   on EConvertError do Exit;
                end;
            end;
          end;
       finally
          frmFINMolShow.Free;
       end;

   end;

  if ( cbTKAccountingType.ItemIndex + 1 in [TK_ACCOUNTINGTYPE_COUNTER, TK_ACCOUNTINGTYPE_SEAL,
                                            TK_ACCOUNTINGTYPE_IMP, TK_ACCOUNTINGTYPE_HOLO]) then
  begin
     f1 := SCMolFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     //f.state := 1; // ???? ?????? ?????????? ...

     //f.text := edtMolInCode.Text;

       frmSCMolShow:=TfrmSCMolShow.Create(Application,fmNormal, f1);

       try

          // оно типа ТУТ отфильтровано ...
          //if length(f.conditionSQL) > 0 then
          //  frmSCMolShow.isFiltered := true;

          with frmSCMolShow do
          begin
            DisableActions([ actEdit, actInsert ]);
            if ShowModal = mrOk then
            begin
                try

                   RQFKOrderObj.molInCode := GetReturnValue(sgSCMol,0);
                   RQFKOrderObj.molInName := GetReturnValue(sgSCMol,2);

                   edtMolInName.Text := RQFKOrderObj.molInName;  //GetReturnValue(sgFINMol,0);
                   edtMolInCode.Text := RQFKOrderObj.molInCode;


                    // Отправитель и Получатель для этих типов ордеров совпадают
                   if RQFKOrderObj.kind.code in [ RQFKORDER_KIND_WRITEOFFCOUNTERS  ] then
                   begin
                     RQFKOrderObj.molOutCode := RQFKOrderObj.molInCode;
                     RQFKOrderObj.molOutName := RQFKOrderObj.molInName;

                     edtMolOutName.Text := RQFKOrderObj.molInName;
                     edtMolOutCode.Text := RQFKOrderObj.molInCode;
                   end;

                except
                   on EConvertError do Exit;
                end;
            end;
          end;
       finally
          frmSCMolShow.Free;
       end;
  end;

  if (cbTKAccountingType.ItemIndex + 1 = TK_ACCOUNTINGTYPE_OS) then
  begin
     fOS := OSMolFilter.Create;
     SetNullXSProps(fOS);
     SetNullIntProps(fOS);
     //f.state := 1; // ???? ?????? ?????????? ...

     //f.text := edtMolInCode.Text;

       frmOSMolShow := TfrmOSMolShow.Create(Application, fmNormal, fOS);

       try

          // оно типа ТУТ отфильтровано ...
          //if length(f.conditionSQL) > 0 then
          //  frmSCMolShow.isFiltered := true;

          with frmOSMolShow do
          begin
            DisableActions([ actEdit, actInsert ]);
            if ShowModal = mrOk then
            begin
                try

                   RQFKOrderObj.molInCode := GetReturnValue(sgOSMol,0);
                   RQFKOrderObj.molInName := GetReturnValue(sgOSMol,2);

                   edtMOLInName.Text := RQFKOrderObj.molInName;  //GetReturnValue(sgFINMol,0);
                   edtMOLInCode.Text := RQFKOrderObj.molInCode;

                   ///// 23.07.12 NET-801
                   // При изменении кода МОЛа очищаем подразделение, т.к. его номер должен соответствовать коду МОЛа
                   // (или наоборот)
                   RQFKOrderObj.kod_podr := '';
                   RQFKOrderObj.name_podr := '';
                   /////

                   // Отправитель и Получатель для этих типов ордеров совпадают
                   // 08.02.13 Совпадают по умолчанию! Но для ввода ОС в экспл. получатель может отличаться от отправителя
                   if RQFKOrderObj.kind.code in [RQFKORDER_KIND_OS_EXPL] then
                   begin
                     RQFKOrderObj.molOutCode := RQFKOrderObj.molInCode;
                     RQFKOrderObj.molOutName := RQFKOrderObj.molInName;

                     edtMolOutName.Text := RQFKOrderObj.molInName;
                     edtMolOutCode.Text := RQFKOrderObj.molInCode;
                   end;

                except
                   on EConvertError do Exit;
                end;
            end;
          end;
       finally
          frmOSMolShow.Free;
       end;
  end;

  // После выбора МОЛа проинициализируем дефолтных подписантов
  if ((DialogState = dsInsert) or (DialogState = dsEdit)) and
     (DMReports.isSignable(RQFKOrderObj)) then
    initDFDocSignersGrid;
end;

procedure TfrmRQFKOrderEdit.spbENDepartmentDepartmentClick(
  Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;

   frmOSPodrShow: TfrmOSPodrShow;
   podrFilter: OSPodrFilter;
   strMolOutPodr: String;
begin
  if ((cbTKAccountingType.ItemIndex + 1 = TK_ACCOUNTINGTYPE_OS) and
      (RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA))
     or
     (((RQFKOrderObj.kind.code = RQFKORDER_KIND_OS_MOVEMENT) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_OS_EXPL)
       or ((RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2OUT) and (cbTKAccountingType.ItemIndex + 1 = TK_ACCOUNTINGTYPE_OS))) and
      ((DialogState <> dsInsert) and (RQFKOrderObj.status.code in [RQFKORDER_STATUS_CREATED, RQFKORDER_STATUS_IN_WORK_ON_WAREHOUSE]))) then
  begin
    // Фильтруем подразделение по первым двум цифрам МОЛа
    strMolOutPodr := Copy(RQFKOrderObj.molOutCode, 1, 2);
    podrFilter := OSPodrFilter.Create;
    SetNullIntProps(podrFilter);
    SetNullXSProps(podrFilter);
    podrFilter.conditionSQL := 'substr(kod_podr, 2, 2) = ''' + strMolOutPodr + '''';

    frmOSPodrShow := TfrmOSPodrShow.Create(Application, fmNormal, podrFilter);
    try
      frmOSPodrShow.DisableActions([frmOSPodrShow.actFilter, frmOSPodrShow.actNoFilter]);
      with frmOSPodrShow do
      begin
        if ShowModal = mrOk then
        begin
          RQFKOrderObj.kod_podr := GetReturnValue(sgOSPodr, 1);
          RQFKOrderObj.name_podr := GetReturnValue(sgOSPodr, 2);
          edtENDepartmentDepartmentName.Text := RQFKOrderObj.kod_podr + ' ' + RQFKOrderObj.name_podr;
        end;
      end;
    finally
      frmOSPodrShow.Free;
    end;

  end
  else begin
     f := ENDepartmentFilter.Create;
     SetNullIntProps(f);
     SetNullXSProps(f);
     //f.typeRef := ENDepartmentTypeRef.Create;
     //f.typeRef.code := 0; // предприятие ХОЕ ... ENDEPARTMENTTYPE_DEPARTMENT;
     //f.conditionSQL := ' parentrefcode is null';
     //f.conditionSQL :=

     f.code := 1;

     frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
     try
        frmENDepartmentShow.isShowAll := true;
        with frmENDepartmentShow do begin
     //     DisableActions([ actNoFilter, actEdit, actInsert ]);
          if ShowModal = mrOk then
          begin
              try
                 if RQFKOrderObj.department = nil then RQFKOrderObj.department := ENDepartment.Create();
                 RQFKOrderObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
                 edtENDepartmentDepartmentName.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
              except
                 on EConvertError do Exit;
              end;
          end;
        end;
     finally
        frmENDepartmentShow.Free;
     end;
  end;
end;

procedure TfrmRQFKOrderEdit.spbExpeditorClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;
{
   TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;
  //plan : ENPlanWork;

  ENMOL2PlanWorkObj: ENMOL2PlanWork;
  TempENMOL2PlanWork: ENMOL2PlanWorkControllerSoapPort;
  ENMOL2PlanWorkFilterObj : ENMOL2PlanWorkFilter;
  ENMOL2PlanWorkList: ENMOL2PlanWorkShortList;
}
  molSel : boolean;

begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // ???? ?????? ?????????? ...
 
 f.text := edtMolOutCode.Text;

   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

   try

      // оно типа ТУТ отфильтровано ...
      //if length(f.conditionSQL) > 0 then
        frmFINMolShow.isFiltered := true;

      with frmFINMolShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try

               RQFKOrderObj.expeditorCode := GetReturnValue(sgFINMol,0);
               RQFKOrderObj.expeditorName := GetReturnValue(sgFINMol,1);

               edtExpeditorName.Text := RQFKOrderObj.expeditorName;  //GetReturnValue(sgFINMol,0);
               edtExpeditorCode.Text := RQFKOrderObj.expeditorCode;


            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;

end;

procedure TfrmRQFKOrderEdit.actInsertExecute(Sender: TObject);
var
 i, j : Integer;
 frmMaterialsRQFKOrderOutEdit : TfrmMaterialsRQFKOrderOutEdit;
 frmMaterialsRQFKOrderOutSCCounterEdit : TfrmMaterialsRQFKOrderOutSCCounterEdit;
 frmMaterialsRQFKOrderOutSCSealEdit : TfrmMaterialsRQFKOrderOutSCSealEdit;
 frmMaterialsRQFKOrderZoneChangingEdit : TfrmMaterialsRQFKOrderZoneChangingEdit;
 frmMaterialsRQFKOrderWithoutEstimatesEdit : TfrmMaterialsRQFKOrderWithoutEstimatesEdit;
 //TempRQInvoiceItem: RQInvoiceItemControllerSoapPort;
 frmMaterialsInEdit: TfrmMaterialsInEdit;
 frmServicesInEdit: TfrmServicesInEdit;
 frmScanningCountersEdit : TfrmScanningCountersEdit;

 isNeededAnotherForm: Boolean;

 fkOrderFilter : RQFKOrderFilter;
 frmRQFKOrderServicesFS : TfrmRQFKOrderShow;
 TempRQFKOrder2FKOrder : RQFKOrder2FKOrderControllerSoapPort;
 rqFKOrder2FKOrderObj : RQFKOrder2FKOrder;
begin

  // -- tsServicesFromSide
  if (pcRQFKOrder.ActivePage = tsServicesFromSide) then
  begin
    fkOrderFilter := RQFKOrderFilter.Create;
    SetNullIntProps(fkOrderFilter);
    SetNullXSProps(fkOrderFilter);

    fkOrderFilter.kind := RQFKOrderKind.Create;
    fkOrderFilter.kind.code := RQFKORDER_KIND_SERVICES_FROM_SIDE;

    frmRQFKOrderServicesFS := TfrmRQFKOrderShow.Create(Application, fmNormal, fkOrderFilter);

    try
      frmRQFKOrderServicesFS.Caption := 'Акти виконаних робіт та послуг';
      frmRQFKOrderServicesFS.UpdateCaption;

      with frmRQFKOrderServicesFS do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
          try
            rqFKOrder2FKOrderObj := RQFKOrder2FKOrder.Create;

            rqFKOrder2FKOrderObj.typeRef := RQFKOrder2FKOrderTypeRef.Create;
            rqFKOrder2FKOrderObj.typeRef.code := RQFKORDER2FKORDERTYPE_DP_2_SERVICESFROMSIDE;

            rqFKOrder2FKOrderObj.fkOrderInRef := RQFKOrderRef.Create;
            rqFKOrder2FKOrderObj.fkOrderInRef.code := RQFKOrderObj.code;

            rqFKOrder2FKOrderObj.fkOrderOutRef := RQFKOrderRef.Create;
            rqFKOrder2FKOrderObj.fkOrderOutRef.code := StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]);

            TempRQFKOrder2FKOrder := HTTPRIORQFKOrder2FKOrder as RQFKOrder2FKOrderControllerSoapPort;
            TempRQFKOrder2FKOrder.add(rqFKOrder2FKOrderObj);

          except
             on EConvertError do Exit;
          end;
        end;
      end;
    finally
      frmRQFKOrderServicesFS.Free;
    end;

    actUpdateExecute(Sender);
  end;

  if (pcRQFKOrder.ActivePage = tsRQFKOrderItems) then
  begin
    isNeededAnotherForm := False;

    if (RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_BUFET) then
    begin
        //ShowMessage('Краще використовуйте складання з рахунків!..');
        Application.MessageBox(PChar('Краще використовуйте складання з рахунків!..'),
                               PChar('Увага !'), MB_ICONINFORMATION);
        //Exit;

        try
          if RQFKOrderObj.org = nil then
          begin
              ShowMessage('Вкажіть постачальника ...');
              Exit;
          end;
          if  RQFKOrderObj.org.code = LOW_INT then
          begin
              ShowMessage('Вкажіть постачальника ...');
              Exit;
          end;

          frmMaterialsInEdit := TfrmMaterialsInEdit.Create(Application, dsInsert);
          frmMaterialsInEdit.Caption := 'Редагування матеріалів у накладній';
          frmMaterialsInEdit.invoiceCode := RQFKOrderObj.code;
          frmMaterialsInEdit.kindCode:=RQFKOrderObj.kind.code;
          frmMaterialsInEdit.isBill := false;
          // тип учета мат-лов ...
          frmMaterialsInEdit.accountingTypeCode := RQFKOrderObj.accountingTypeRef.code;

          frmMaterialsInEdit.orgId := RQFKOrderObj.org.id;

          ////  16.01.2012
          frmMaterialsInEdit.billType := RQBILL_TYPE_TMC;

          if RQFKOrderObj.storageRef <> nil then
            frmMaterialsInEdit.storageCode := RQFKOrderObj.storageRef.code;

          frmMaterialsInEdit.MOLCode := RQFKOrderObj.molOutCode;

          ////

          try
            if frmMaterialsInEdit.ShowModal = mrOk then
            begin
              //if RQOrderItemObj<>nil then
                  //TempRQOrderItem.add(RQOrderItemObj);
                  //UpdateGrid(Sender);
            end;
          finally
            frmMaterialsInEdit.Free;
            frmMaterialsInEdit:=nil;
          end;
        finally
        end;
    end;

    if (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2OUT)
         or (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_BUFET)
         or (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT)
         or (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_GIFT)
         or (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_TO_STORAGE)
         or (RQFKOrderObj.kind.code = RQFKORDER_KIND_OUT_FUEL) then begin


      if  ((RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2OUT)
            or (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_BUFET)
            or (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT)
            or (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_GIFT)
            or (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_TO_STORAGE)
            or (RQFKOrderObj.kind.code = RQFKORDER_KIND_OUT_FUEL))
              and (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_TMC)
      then
      begin
        frmMaterialsRQFKOrderOutEdit := TfrmMaterialsRQFKOrderOutEdit.Create(Application, dsInsert);
        try

            if ((RQFKOrderObj.kind.code = RQFKORDER_KIND_OUT_FUEL) or
                (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2OUT)) then
            begin
              frmMaterialsRQFKOrderOutEdit.isFuel := 1;
              frmMaterialsRQFKOrderOutEdit.rgSearch.ItemIndex := 1;
            //  frmMaterialsRQFKOrderOutEdit.rgSearch.Enabled := False;
            end;

           if (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT) then
             frmMaterialsRQFKOrderOutEdit.partnerCode := RQFKOrderObj.org.codeorg;

           frmMaterialsRQFKOrderOutEdit.rqFKOrderCode := RQFKOrderObj.code;
           frmMaterialsRQFKOrderOutEdit.MOLCode := RQFKOrderObj.molInCode;
           frmMaterialsRQFKOrderOutEdit.masterMOLCode := RQFKOrderObj.molOutCode;
           frmMaterialsRQFKOrderOutEdit.edtFINMol.Text := RQFKOrderObj.molInCode + ' ' + RQFKOrderObj.molInName ;

           if (RQFKOrderObj.department <> nil ) then
           begin
             if (RQFKOrderObj.department.code > LOW_INT ) then
             begin
              frmMaterialsRQFKOrderOutEdit.departmentCode :=  RQFKOrderObj.department.code;
              frmMaterialsRQFKOrderOutEdit.departmentName :=  RQFKOrderObj.department.name;
              //frmMaterialsRQFKOrderOutEdit.DisableControls([frmMaterialsRQFKOrderOutEdit.spbDepartment]);
             end;
           end;

           if RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_BUFET then
           begin
             frmMaterialsRQFKOrderOutEdit.rgSearch.Visible := False;
           end;

           if frmMaterialsRQFKOrderOutEdit.ShowModal = mrOK then
           begin
               UpdateGrid(Sender);
           end;
        finally
            frmMaterialsRQFKOrderOutEdit.Free;
            frmMaterialsRQFKOrderOutEdit := nil;
        end;
      end;



      if  (RQFKOrderObj.kind.code in [RQFKORDER_KIND_RASHOD_OE2REM]) and
           (RQFKOrderObj.accountingTypeRef.code in [TK_ACCOUNTINGTYPE_SEAL, TK_ACCOUNTINGTYPE_IMP, TK_ACCOUNTINGTYPE_HOLO]) then
      begin
        frmMaterialsRQFKOrderOutSCSealEdit := TfrmMaterialsRQFKOrderOutSCSealEdit.Create(Application, dsInsert);
        try
           frmMaterialsRQFKOrderOutSCSealEdit.rqFKOrderCode := RQFKOrderObj.code;
           frmMaterialsRQFKOrderOutSCSealEdit.MOLCode := RQFKOrderObj.molInCode;
           frmMaterialsRQFKOrderOutSCSealEdit.masterMOLCode := RQFKOrderObj.molOutCode;
           frmMaterialsRQFKOrderOutSCSealEdit.accountingType := RQFKOrderObj.accountingTypeRef.code;
           ///////////
           frmMaterialsRQFKOrderOutSCSealEdit.edtFinMolCode.Text := RQFKOrderObj.molInCode;
            frmMaterialsRQFKOrderOutSCSealEdit.edtFinMolName.Text := RQFKOrderObj.molInName;
           ////////////


           if (RQFKOrderObj.department <> nil ) then
           begin
             if (RQFKOrderObj.department.code > LOW_INT ) then
             begin
              frmMaterialsRQFKOrderOutSCSealEdit.departmentCode :=  RQFKOrderObj.department.code;
              frmMaterialsRQFKOrderOutSCSealEdit.departmentName :=  RQFKOrderObj.department.name;
              //frmMaterialsRQFKOrderOutEdit.DisableControls([frmMaterialsRQFKOrderOutEdit.spbDepartment]);
             end;
           end;

           if frmMaterialsRQFKOrderOutSCSealEdit.ShowModal = mrOK then
           begin
               UpdateGrid(Sender);
           end;
        finally
            frmMaterialsRQFKOrderOutSCSealEdit.Free;
            frmMaterialsRQFKOrderOutSCSealEdit := nil;
        end;
      end;



      if  (RQFKOrderObj.kind.code in [RQFKORDER_KIND_RASHOD_OE2REM, RQFKORDER_KIND_RASHOD_TO_STORAGE]) and (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_COUNTER) then
      begin
        frmMaterialsRQFKOrderOutSCCounterEdit := TfrmMaterialsRQFKOrderOutSCCounterEdit.Create(Application, dsInsert);
        try
           frmMaterialsRQFKOrderOutSCCounterEdit.rqFKOrderCode := RQFKOrderObj.code;
           frmMaterialsRQFKOrderOutSCCounterEdit.MOLCode := RQFKOrderObj.molInCode;
           frmMaterialsRQFKOrderOutSCCounterEdit.masterMOLCode := RQFKOrderObj.molOutCode;

           ///////////
           frmMaterialsRQFKOrderOutSCCounterEdit.edtFinMolCode.Text := RQFKOrderObj.molInCode;
            frmMaterialsRQFKOrderOutSCCounterEdit.edtFinMolName.Text := RQFKOrderObj.molInName;
           ////////////


           if (RQFKOrderObj.department <> nil ) then
           begin
             if (RQFKOrderObj.department.code > LOW_INT ) then
             begin
              frmMaterialsRQFKOrderOutSCCounterEdit.departmentCode :=  RQFKOrderObj.department.code;
              frmMaterialsRQFKOrderOutSCCounterEdit.departmentName :=  RQFKOrderObj.department.name;
              //frmMaterialsRQFKOrderOutEdit.DisableControls([frmMaterialsRQFKOrderOutEdit.spbDepartment]);
             end;
           end;

           if frmMaterialsRQFKOrderOutSCCounterEdit.ShowModal = mrOK then
           begin
               UpdateGrid(Sender);
           end;
        finally
            frmMaterialsRQFKOrderOutSCCounterEdit.Free;
            frmMaterialsRQFKOrderOutSCCounterEdit := nil;
        end;
      end;
    end;

    ///
    ///  перемещение в транзит
    ///
    if (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT) then
    begin
      frmMaterialsRQFKOrderOutEdit := TfrmMaterialsRQFKOrderOutEdit.Create(Application, dsInsert);
        try
           frmMaterialsRQFKOrderOutEdit.rqFKOrderCode := RQFKOrderObj.code;
           frmMaterialsRQFKOrderOutEdit.MOLCode := RQFKOrderObj.molInCode;
           frmMaterialsRQFKOrderOutEdit.masterMOLCode := RQFKOrderObj.molOutCode;
           frmMaterialsRQFKOrderOutEdit.edtFINMol.Text := RQFKOrderObj.molInCode + ' ' + RQFKOrderObj.molInName ;

           frmMaterialsRQFKOrderOutEdit.rgSearch.Visible := False;
         
           if (RQFKOrderObj.department <> nil ) then
           begin
             if (RQFKOrderObj.department.code > LOW_INT ) then
             begin
              frmMaterialsRQFKOrderOutEdit.departmentCode :=  RQFKOrderObj.department.code;
              frmMaterialsRQFKOrderOutEdit.departmentName :=  RQFKOrderObj.department.name;
             end;
           end;

           if frmMaterialsRQFKOrderOutEdit.ShowModal = mrOK then
           begin
               UpdateGrid(Sender);
           end;
        finally
            frmMaterialsRQFKOrderOutEdit.Free;
            frmMaterialsRQFKOrderOutEdit := nil;
        end;
    end;

    ///
    ///  перемещение между объектами
    ///
    if (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_E2E) then
    begin
      frmMaterialsRQFKOrderOutE2EEdit := TfrmMaterialsRQFKOrderOutE2EEdit.Create(Application, dsInsert);
        try
           frmMaterialsRQFKOrderOutE2EEdit.rqFKOrderCode := RQFKOrderObj.code;
           frmMaterialsRQFKOrderOutE2EEdit.MOLCode := RQFKOrderObj.molInCode;
           frmMaterialsRQFKOrderOutE2EEdit.masterMOLCode := RQFKOrderObj.molOutCode;
           frmMaterialsRQFKOrderOutE2EEdit.edtFINMol.Text := RQFKOrderObj.molInCode + ' ' + RQFKOrderObj.molInName ;

           //frmMaterialsRQFKOrderOutE2EEdit.rgSearch.Visible := False;
           //frmMaterialsRQFKOrderOutE2EEdit.chbIsTranzit.Visible := False;

           if (RQFKOrderObj.department <> nil ) then
           begin
             if (RQFKOrderObj.department.code > LOW_INT ) then
             begin
              frmMaterialsRQFKOrderOutE2EEdit.departmentCode :=  RQFKOrderObj.department.code;
              frmMaterialsRQFKOrderOutE2EEdit.departmentName :=  RQFKOrderObj.department.name;
             end;
           end;

           if frmMaterialsRQFKOrderOutE2EEdit.ShowModal = mrOK then
           begin
               UpdateGrid(Sender);
           end;
        finally
            frmMaterialsRQFKOrderOutE2EEdit.Free;
            frmMaterialsRQFKOrderOutE2EEdit := nil;
        end;
    end;

    // Изменение единицы измерения

    if (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE) then
    begin
      // 28.02.2017 Закрываем создание актов перевода единиц измерения (будет использоваться функционал Аксапты)
      Application.MessageBox(PChar('Цей функціонал більше не використовується!'), PChar('Увага!'), MB_ICONWARNING);
      Exit;

      frmMaterialsRQFKOrderOutEdit := TfrmMaterialsRQFKOrderOutEdit.Create(Application, dsInsert);
        try
           frmMaterialsRQFKOrderOutEdit.rqFKOrderCode := RQFKOrderObj.code;
           frmMaterialsRQFKOrderOutEdit.MOLCode := RQFKOrderObj.molInCode;
           frmMaterialsRQFKOrderOutEdit.masterMOLCode := RQFKOrderObj.molOutCode;
           frmMaterialsRQFKOrderOutEdit.edtFINMol.Text := RQFKOrderObj.molInCode + ' ' + RQFKOrderObj.molInName ;

           //frmMaterialsRQFKOrderOutEdit.rgSearch.Visible := False;
           //frmMaterialsRQFKOrderOutEdit.chbIsTranzit.Visible := False;

           if (RQFKOrderObj.department <> nil ) then
           begin
             if (RQFKOrderObj.department.code > LOW_INT ) then
             begin
              frmMaterialsRQFKOrderOutEdit.departmentCode :=  RQFKOrderObj.department.code;
              frmMaterialsRQFKOrderOutEdit.departmentName :=  RQFKOrderObj.department.name;
             end;
           end;

           if frmMaterialsRQFKOrderOutEdit.ShowModal = mrOK then
           begin
               UpdateGrid(Sender);
           end;
        finally
            frmMaterialsRQFKOrderOutEdit.Free;
            frmMaterialsRQFKOrderOutEdit := nil;
        end;
    end;


    //ввод в эксплуатацию МБП и МНМА

    if (RQFKOrderObj.kind.code = RQFKORDER_KIND_LOADEXPL_MBP) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_LOADEXPL_MNMA) or
       (RQFKOrderObj.kind.code = RQFKORDER_KIND_MBP) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_MNMA) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_MNMA) then
    begin

      if (RQFKOrderObj.kind.code = RQFKORDER_KIND_MBP) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_MNMA)
        or (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_MNMA) then
        if RQFKOrderObj.account = '' then
        begin
          Application.MessageBox(PChar('Спочатку оберіть рахунок!'),
                                 PChar('Увага!'), MB_ICONWARNING);
        end;


      //if  ((RQFKOrderObj.kind.code = RQFKORDER_KIND_LOADEXPL_MBP) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_LOADEXPL_MNMA)) ?? Это условие как бы лишее... оно все равно проверяется на строчку выше
      //  and (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_TMC)
      if (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_TMC) then
      begin
        frmMaterialsRQFKOrderOutEdit := TfrmMaterialsRQFKOrderOutEdit.Create(Application, dsInsert);
        try
           frmMaterialsRQFKOrderOutEdit.rqFKOrderCode := RQFKOrderObj.code;
           frmMaterialsRQFKOrderOutEdit.MOLCode := RQFKOrderObj.molInCode;
           frmMaterialsRQFKOrderOutEdit.masterMOLCode := RQFKOrderObj.molOutCode;
           frmMaterialsRQFKOrderOutEdit.edtFINMol.Text := RQFKOrderObj.molInCode + ' ' + RQFKOrderObj.molInName ;

           if (RQFKOrderObj.department <> nil ) then
           begin
             if (RQFKOrderObj.department.code > LOW_INT ) then
             begin
              frmMaterialsRQFKOrderOutEdit.departmentCode :=  RQFKOrderObj.department.code;
              frmMaterialsRQFKOrderOutEdit.departmentName :=  RQFKOrderObj.department.name;
              //frmMaterialsRQFKOrderOutEdit.DisableControls([frmMaterialsRQFKOrderOutEdit.spbDepartment]);
             end;
           end;


           if frmMaterialsRQFKOrderOutEdit.ShowModal = mrOK then
           begin
               UpdateGrid(Sender);
           end;
        finally
            frmMaterialsRQFKOrderOutEdit.Free;
            frmMaterialsRQFKOrderOutEdit := nil;
        end;
      end;


    end;

    // Изменение мест хранения

      if ((RQFKOrderObj.kind.code = RQFKORDER_KIND_ZONE_CHANGING) and (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_TMC)) then
    begin
      frmMaterialsRQFKOrderZoneChangingEdit := TfrmMaterialsRQFKOrderZoneChangingEdit.Create(Application, dsInsert);
        try
           frmMaterialsRQFKOrderZoneChangingEdit.rqFKOrderCode := RQFKOrderObj.code;
           frmMaterialsRQFKOrderZoneChangingEdit.MOLCode := RQFKOrderObj.molInCode;
           frmMaterialsRQFKOrderZoneChangingEdit.masterMOLCode := RQFKOrderObj.molOutCode;
           frmMaterialsRQFKOrderZoneChangingEdit.edtFINMol.Text := RQFKOrderObj.molInCode + ' ' + RQFKOrderObj.molInName ;

           if (RQFKOrderObj.department <> nil ) then
           begin
             if (RQFKOrderObj.department.code > LOW_INT ) then
             begin
              frmMaterialsRQFKOrderZoneChangingEdit.departmentCode :=  RQFKOrderObj.department.code;
              frmMaterialsRQFKOrderZoneChangingEdit.departmentName :=  RQFKOrderObj.department.name;
             end;
           end;

           if frmMaterialsRQFKOrderZoneChangingEdit.ShowModal = mrOK then
           begin
              if frmMaterialsRQFKOrderZoneChangingEdit.isNeededAnotherForm = True then
              begin
                frmMaterialsRQFKOrderOutEdit := TfrmMaterialsRQFKOrderOutEdit.Create(Application, dsInsert);
                try
                  frmMaterialsRQFKOrderOutEdit.rqFKOrderCode := RQFKOrderObj.code;
                  frmMaterialsRQFKOrderOutEdit.MOLCode := RQFKOrderObj.molInCode;
                  frmMaterialsRQFKOrderOutEdit.masterMOLCode := RQFKOrderObj.molOutCode;
                  frmMaterialsRQFKOrderOutEdit.departmentCode :=  RQFKOrderObj.department.code;
                  frmMaterialsRQFKOrderOutEdit.departmentName :=  RQFKOrderObj.department.name;
                  frmMaterialsRQFKOrderOutEdit.edtFINMol.Text := RQFKOrderObj.molInCode + ' ' + RQFKOrderObj.molInName ;
                  if frmMaterialsRQFKOrderOutEdit.ShowModal = mrOK then begin
                    UpdateGrid(Sender);
                  end;
                finally
                  frmMaterialsRQFKOrderOutEdit.Free;
                  frmMaterialsRQFKOrderOutEdit := nil;
                end;
              end
              else
                UpdateGrid(Sender);
            end;
        finally
           frmMaterialsRQFKOrderZoneChangingEdit.Free;
           frmMaterialsRQFKOrderZoneChangingEdit := nil;
        end;

    end;
    if ((RQFKOrderObj.kind.code = RQFKORDER_KIND_ZONE_CHANGING) and (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_COUNTER)) then
    begin
      frmScanningCountersEdit := TfrmScanningCountersEdit.Create(Application, dsInsert);
      try
           frmScanningCountersEdit.rqFKOrderCode := RQFKOrderObj.code;
           frmScanningCountersEdit.molCode := RQFKOrderObj.molInCode;
           frmScanningCountersEdit.dateGen := RQFKOrderObj.dateGen;
           if frmScanningCountersEdit.ShowModal = mrOK then begin
              UpdateGrid(Sender);
           end;
      finally
           frmScanningCountersEdit.Free;
           frmScanningCountersEdit := nil;
      end;
    end;

    if (RQFKOrderObj.kind.code in [RQFKORDER_KIND_AVAR_IN, RQFKORDER_KIND_AVAR_OUT]) then
    begin
           frmMaterialsRQFKOrderWithoutEstimatesEdit := TfrmMaterialsRQFKOrderWithoutEstimatesEdit.Create(Application, dsInsert);
           try
           frmMaterialsRQFKOrderWithoutEstimatesEdit.rqFKOrderCode := RQFKOrderObj.code;
           frmMaterialsRQFKOrderWithoutEstimatesEdit.MOLCode := RQFKOrderObj.molInCode;
           frmMaterialsRQFKOrderWithoutEstimatesEdit.masterMOLCode := RQFKOrderObj.molOutCode;
           frmMaterialsRQFKOrderWithoutEstimatesEdit.edtFINMol.Text := RQFKOrderObj.molInCode + ' ' + RQFKOrderObj.molInName ;
           if (RQFKOrderObj.department <> nil ) then
           begin
             if (RQFKOrderObj.department.code > LOW_INT ) then
             begin
              frmMaterialsRQFKOrderWithoutEstimatesEdit.departmentCode :=  RQFKOrderObj.department.code;
              frmMaterialsRQFKOrderWithoutEstimatesEdit.departmentName :=  RQFKOrderObj.department.name;
             end;
           end;
           if frmMaterialsRQFKOrderWithoutEstimatesEdit.ShowModal = mrOK then
           begin
           end;
           UpdateGrid(Sender);
           finally
               frmMaterialsRQFKOrderWithoutEstimatesEdit.Free;
               frmMaterialsRQFKOrderWithoutEstimatesEdit := nil;
           end;



    end;

     // списание счетчиков
     if  (RQFKOrderObj.kind.code = RQFKORDER_KIND_WRITEOFFCOUNTERS) and (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_COUNTER) then
      begin
        frmMaterialsRQFKOrderOutSCCounterEdit := TfrmMaterialsRQFKOrderOutSCCounterEdit.Create(Application, dsInsert);
        try
           frmMaterialsRQFKOrderOutSCCounterEdit.rqFKOrderCode := RQFKOrderObj.code;
           frmMaterialsRQFKOrderOutSCCounterEdit.MOLCode := RQFKOrderObj.molInCode;
           frmMaterialsRQFKOrderOutSCCounterEdit.masterMOLCode := RQFKOrderObj.molOutCode;

           ///////////
           frmMaterialsRQFKOrderOutSCCounterEdit.edtFinMolCode.Text := RQFKOrderObj.molInCode;
           frmMaterialsRQFKOrderOutSCCounterEdit.edtFinMolName.Text := RQFKOrderObj.molInName;

           frmMaterialsRQFKOrderOutSCCounterEdit.Height:=  400;
           frmMaterialsRQFKOrderOutSCCounterEdit.Caption:= 'Списання лічильників';
           ////////////


           if (RQFKOrderObj.department <> nil ) then
           begin
             if (RQFKOrderObj.department.code > LOW_INT ) then
             begin
              frmMaterialsRQFKOrderOutSCCounterEdit.departmentCode :=  RQFKOrderObj.department.code;
              frmMaterialsRQFKOrderOutSCCounterEdit.departmentName :=  RQFKOrderObj.department.name;
             end;
           end;

           if frmMaterialsRQFKOrderOutSCCounterEdit.ShowModal = mrOK then
           begin
               UpdateGrid(Sender);
           end;
        finally
            frmMaterialsRQFKOrderOutSCCounterEdit.Free;
            frmMaterialsRQFKOrderOutSCCounterEdit := nil;
        end;
      end;

    // акт на услуги со стороны
    if RQFKOrderObj.kind.code = RQFKORDER_KIND_SERVICES_FROM_SIDE then
    begin
        //ShowMessage('Краще використовуйте складання з рахунків!..');
        //Application.MessageBox(PChar('Краще використовуйте складання з рахунків!..'),
        //                       PChar('Увага !'), MB_ICONINFORMATION);
        //Exit;

        try
          if RQFKOrderObj.org = nil then
          begin
              ShowMessage('Вкажіть постачальника ...');
              Exit;
          end;
          if  RQFKOrderObj.org.code = LOW_INT then
          begin
              ShowMessage('Вкажіть постачальника ...');
              Exit;
          end;

          frmServicesInEdit := TfrmServicesInEdit.Create(Application, dsInsert);
          frmServicesInEdit.Caption := 'Редагування послуг в акті';
          frmServicesInEdit.invoiceCode := RQFKOrderObj.code;
          frmServicesInEdit.isBill := false;
          // тип учета мат-лов ...
          frmServicesInEdit.accountingTypeCode := RQFKOrderObj.accountingTypeRef.code;

          frmServicesInEdit.orgId := RQFKOrderObj.org.id;

          ////  17.01.2012
          frmServicesInEdit.billType := RQBILL_TYPE_SERVICES;
          ////

          try
            if frmServicesInEdit.ShowModal = mrOk then
            begin
              //if RQOrderItemObj<>nil then
                  //TempRQOrderItem.add(RQOrderItemObj);
                  //UpdateGrid(Sender);
            end;
          finally
            frmServicesInEdit.Free;
            frmServicesInEdit:=nil;
          end;
        finally
        end;
    end;

    //  реализация товаров
    if (RQFKOrderObj.kind.code = RQFKORDER_KIND_SALE_PRODUCTS) then
    begin
        frmMaterialsRQFKOrderOutEdit := TfrmMaterialsRQFKOrderOutEdit.Create(Application, dsInsert);
        try

           frmMaterialsRQFKOrderOutEdit.elementCode := servicesObject.element.code;
           frmMaterialsRQFKOrderOutEdit.elementName := servicesObject.contractNumberServices;
           frmMaterialsRQFKOrderOutEdit.edtENElementName.Text := servicesObject.contractNumberServices;
           DisableControls([frmMaterialsRQFKOrderOutEdit.spbENElement, frmMaterialsRQFKOrderOutEdit.spbENElementClear,
              frmMaterialsRQFKOrderOutEdit.spbDepartment, frmMaterialsRQFKOrderOutEdit.spbDepartmentClear,
              frmMaterialsRQFKOrderOutEdit.spbENBudget, frmMaterialsRQFKOrderOutEdit.spbENBudgetClear]);

           // frmMaterialsRQFKOrderOutEdit.rgSearch.Visible := False;
           // frmMaterialsRQFKOrderOutEdit.chbIsTranzit.Visible := False;

           frmMaterialsRQFKOrderOutEdit.rqFKOrderCode := RQFKOrderObj.code;
           frmMaterialsRQFKOrderOutEdit.MOLCode := RQFKOrderObj.molInCode;
           frmMaterialsRQFKOrderOutEdit.masterMOLCode := RQFKOrderObj.molOutCode;
           frmMaterialsRQFKOrderOutEdit.edtFINMol.Text := RQFKOrderObj.molInCode + ' ' + RQFKOrderObj.molInName ;

           if (RQFKOrderObj.department <> nil ) then
           begin
             if (RQFKOrderObj.department.code > LOW_INT ) then
             begin
               frmMaterialsRQFKOrderOutEdit.departmentCode :=  RQFKOrderObj.department.code;
               frmMaterialsRQFKOrderOutEdit.departmentName :=  RQFKOrderObj.department.name;
             end;
           end;

           if frmMaterialsRQFKOrderOutEdit.ShowModal = mrOK then
           begin
               UpdateGrid(Sender);
           end;
        finally
            frmMaterialsRQFKOrderOutEdit.Free;
            frmMaterialsRQFKOrderOutEdit := nil;
        end;
    end;

  ////////////////////////////////////////////////////////////////////////////////
    // 10.12.12 Ввод ОС в эксплуатацию
    // 03.01.13 + Внутреннее перемещение ОС
    if (RQFKOrderObj.kind.code = RQFKORDER_KIND_OS_EXPL) or
       (RQFKOrderObj.kind.code = RQFKORDER_KIND_OS_MOVEMENT)
       or ((RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2OUT) and
          (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_OS)) then
    begin
      frmMaterialsRQFKOrderOSExplEdit := TfrmMaterialsRQFKOrderOSExplEdit.Create(Application, dsInsert);
      try
        frmMaterialsRQFKOrderOSExplEdit.MOLCode := RQFKOrderObj.molInCode;
        frmMaterialsRQFKOrderOSExplEdit.masterMOLCode := RQFKOrderObj.molOutCode;

        frmMaterialsRQFKOrderOSExplEdit.rqFKOrderCode := RQFKOrderObj.code;
        frmMaterialsRQFKOrderOSExplEdit.rqFKOrderKind := RQFKOrderObj.kind.code;

        if (RQFKOrderObj.department <> nil) then
        begin
          if (RQFKOrderObj.department.code > LOW_INT) then
          begin
            frmMaterialsRQFKOrderOSExplEdit.departmentCode := RQFKOrderObj.department.code;
            frmMaterialsRQFKOrderOSExplEdit.departmentName := RQFKOrderObj.department.name;
          end;
        end;

        // frmMaterialsRQFKOrderOSExplEdit.edtFINMol.Text := RQFKOrderObj.molInCode + ' ' + RQFKOrderObj.molInName ;

        if frmMaterialsRQFKOrderOSExplEdit.ShowModal = mrOK then
        begin
          UpdateGrid(Sender);
        end;
      finally
        frmMaterialsRQFKOrderOSExplEdit.Free;
        frmMaterialsRQFKOrderOSExplEdit := nil;
      end;
    end;
  ////////////////////////////////////////////////////////////////////////////////

    actUpdateExecute(Sender);
  end;
   // 23.05.2018 Из-за изменения суммы без НДС при добавлении/удалении
   // строки ордера приходится теперь перечитывать и сам ордер на форме
   RefreshRQFKOrder;
end;



procedure TfrmRQFKOrderEdit.btnPrintOrderClick(Sender: TObject);
begin
  Self.printOrder;
end;


procedure TfrmRQFKOrderEdit.actDeleteExecute(Sender: TObject);
var
  ObjCode, fkOrderOutCode, fkOrder2RQFKOrderCode : Integer;
  TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
  TempRQFKOrder2FKOrder : RQFKOrder2FKOrderControllerSoapPort;
  fkOrder2RQFKOrderFilter : RQFKOrder2FKOrderFilter;
  fkOrder2RQFKOrderArr : RQFKOrder2FKOrderController.ArrayOfInteger;
begin

  // -- tsServicesFromSide
  if (pcRQFKOrder.ActivePage = tsServicesFromSide) then
  begin
    TempRQFKOrder2FKOrder := HTTPRIORQFKOrder2FKOrder as RQFKOrder2FKOrderControllerSoapPort;
    try
      fkOrderOutCode := StrToInt(sgActsServicesFS.Cells[0,sgActsServicesFS.Row]);
    except
    on EConvertError do Exit;
    end;

    fkOrder2RQFKOrderFilter := RQFKOrder2FKOrderFilter.Create;
    SetNullIntProps(fkOrder2RQFKOrderFilter);
    SetNullXSProps(fkOrder2RQFKOrderFilter);

    fkOrder2RQFKOrderFilter.fkOrderInRef := RQFKOrderRef.Create;
    fkOrder2RQFKOrderFilter.fkOrderInRef.code := RQFKOrderObj.code;
    fkOrder2RQFKOrderFilter.fkOrderOutRef := RQFKOrderRef.Create;
    fkOrder2RQFKOrderFilter.fkOrderOutRef.code := fkOrderOutCode;

    fkOrder2RQFKOrderArr := TempRQFKOrder2FKOrder.getScrollableFilteredCodeArray(fkOrder2RQFKOrderFilter, 0, -1);
    if High(fkOrder2RQFKOrderArr) > -1 then
      fkOrder2RQFKOrderCode := fkOrder2RQFKOrderArr[0];

    if Application.MessageBox(PChar('Вы действительно хотите удалить (Зв`язок актів вик. робіт з ордером)?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
      TempRQFKOrder2FKOrder.remove(fkOrder2RQFKOrderCode);
      actUpdateExecute(Sender);
    end;
  end;


  if (pcRQFKOrder.ActivePage = tsRQFKOrderItems) then
  begin
    TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;

    try
      ObjCode := StrToInt(sgRQFKOrderItem.Cells[0, sgRQFKOrderItem.Row]);
    except
      on EConvertError do Exit;
    end;

    if Application.MessageBox(PChar('Ви дійсно бажаєте видалити строку накладної ?'),
                              PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
    begin
       if (RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_BUFET) then
       begin
           TempRQFKOrderItem.removePrihod(ObjCode);
       end
       else
       if (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM) then
       begin
           //TempRQFKOrderItem.removeOE2REM(ObjCode);
           removeItem(objCode, RQFKORDER_KIND_RASHOD_OE2REM);
       end
       else

       if ((RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2OUT) and
          (RQFKOrderObj.accountingTypeRef.code <> TK_ACCOUNTINGTYPE_OS))  then
       begin
           //TempRQFKOrderItem.removeOE2REM(ObjCode);
           removeItem(objCode, RQFKORDER_KIND_RASHOD_OE2OUT);
       end
       else

       if RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_REM2MOL then
       begin
           //TempRQFKOrderItem.removeREM2MOL(ObjCode);
           removeItem(objCode, RQFKORDER_KIND_RASHOD_REM2MOL);
       end
       else

       if RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT then
       begin
           removeItem(objCode, RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT);
       end
       else

       if RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE then
       begin
           removeItem(objCode, RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE);
       end
       else

       if RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_E2E then
       begin
           removeItem(objCode, RQFKORDER_KIND_RASHOD_E2E);
       end
       else
       if (RQFKOrderObj.kind.code = RQFKORDER_KIND_LOADEXPL_MBP) then
       begin
           removeItem(objCode, RQFKORDER_KIND_LOADEXPL_MBP);
       end
       else
       if (RQFKOrderObj.kind.code = RQFKORDER_KIND_LOADEXPL_MNMA) then
       begin
           removeItem(objCode, RQFKORDER_KIND_LOADEXPL_MNMA);
       end
       else
       /////
       if (RQFKOrderObj.kind.code = RQFKORDER_KIND_MBP) then
       begin
           removeItem(objCode, RQFKORDER_KIND_MBP);
       end
       else
       if (RQFKOrderObj.kind.code = RQFKORDER_KIND_MNMA) then
       begin
           removeItem(objCode, RQFKORDER_KIND_MNMA);
       end
       else
       if (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_MNMA) then
       begin
           removeItem(objCode, RQFKORDER_KIND_RASHOD_MNMA);
       end
       else
       /////
       if (RQFKOrderObj.kind.code = RQFKORDER_KIND_SERVICES_FROM_SIDE) then
       begin
            TempRQFKOrderItem.removePrihod(ObjCode);
       end
       else
       if (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_BUFET) then
       begin
            removeItem(objCode, RQFKORDER_KIND_RASHOD_BUFET);
       end
       else
        if (RQFKOrderObj.kind.code = RQFKORDER_KIND_WRITEOFFCOUNTERS) then
       begin
           removeItem(objCode, RQFKORDER_KIND_WRITEOFFCOUNTERS);
       end

       else
       if (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT) then
       begin
           removeItem(objCode, RQFKORDER_KIND_RASHOD_RETURN_PRODUCT);
       end

       else if (RQFKOrderObj.kind.code = RQFKORDER_KIND_SALE_PRODUCTS) then
       begin
           removeItem(objCode, RQFKORDER_KIND_RASHOD_OE2REM);
       end

       else if (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_GIFT) then
       begin
           removeItem(objCode, RQFKORDER_KIND_RASHOD_GIFT);
       end

       else if (RQFKOrderObj.kind.code = RQFKORDER_KIND_OS_EXPL) then
       begin
         TempRQFKOrderItem.removeOSExplItem(ObjCode);
       end

       else if (RQFKOrderObj.kind.code = RQFKORDER_KIND_OS_MOVEMENT) or
          ((RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2OUT) and
          (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_OS)) then
       begin
         TempRQFKOrderItem.removeOSMovementItem(ObjCode);
       end

       else if (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_TO_STORAGE) then
       begin
           removeItem(objCode, RQFKORDER_KIND_RASHOD_TO_STORAGE);
       end

       else if (RQFKOrderObj.kind.code = RQFKORDER_KIND_ZONE_CHANGING) then
       begin
           removeItem(objCode, RQFKORDER_KIND_ZONE_CHANGING);
       end

       else if (RQFKOrderObj.kind.code = RQFKORDER_KIND_OUT_FUEL) then
       begin
           TempRQFKOrderItem.removeOutFuelItem(objCode);
       end
       else if {NET-4400}(RQFKOrderObj.kind.code = RQFKORDER_KIND_AVAR_OUT) then
       begin
           TempRQFKOrderItem.removeAvarOutItem(objCode);
       end
       else if {NET-4400}(RQFKOrderObj.kind.code = RQFKORDER_KIND_AVAR_IN) then
       begin
           TempRQFKOrderItem.removeAvarInItem(objCode);
       end
       else
           ShowMessage('Unknown KIND ...');

       actUpdateExecute(Sender);
    end;
  end;
  // 23.05.2018 Из-за изменения суммы без НДС при добавлении/удалении
  // строки ордера приходится теперь перечитывать и сам ордер на форме
  RefreshRQFKOrder;
end;

procedure TfrmRQFKOrderEdit.actDivideItemExecute(Sender: TObject);
Var TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
begin
 frmItemDivider :=TfrmItemDivider.Create(Application, dsEdit);
  try

      TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
      try
         frmItemDivider.RQFKOIObj := TempRQFKOrderItem.getObject(StrToInt(sgRQFKOrderItem.Cells[0,sgRQFKOrderItem.Row]));
       except
       on EConvertError do Exit;
      end;

    if frmItemDivider.ShowModal = mrOk then
      begin
        UpdateGrid(Sender);
      end;

  finally
    frmItemDivider.Free;
    frmItemDivider:=nil;
  end;

  actUpdateExecute(Sender);
end;

procedure TfrmRQFKOrderEdit.removeItem(itemCode : Integer; orderKind : Integer);
var
   TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
   TempRQFKOrderItem2ENEstimateItem: RQFKOrderItem2ENEstimateItemControllerSoapPort;
   f : RQFKOrderItem2ENEstimateItemFilter;
   l : RQFKOrderItem2ENEstimateItemShortList;
begin

    TempRQFKOrderItem2ENEstimateItem := HTTPRIORQFKOrderItem2ENEstimateItem as RQFKOrderItem2ENEstimateItemControllerSoapPort;
    f := RQFKOrderItem2ENEstimateItemFilter.Create;
    SetNullIntProps(f);
    SetNullXSProps(f);
    f.fkOrderItemRef := RQFKOrderItemRef.Create;
    f.fkOrderItemRef.code := itemCode;
    l := TempRQFKOrderItem2ENEstimateItem.getScrollableFilteredList(f, 0, -1);
    if l.totalCount > 0 then
    begin
      if Application.MessageBox(PChar('Є прив''язані матеріали з ФК ! Все одно видалити строку ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2) <> IDOK then  EXIT;
    end;
    
    TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;

    if (orderKind = RQFKORDER_KIND_RASHOD_OE2REM)
         or (orderKind = RQFKORDER_KIND_RASHOD_BUFET)
         or (orderKind = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT) then

      if RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_COUNTER then
        TempRQFKOrderItem.removeCSCountersByFKItemCode(itemCode)
      else
      if ((RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_SEAL) or
          (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_IMP) or
          (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_HOLO)) then
        TempRQFKOrderItem.removeSCSealsByFKItemCode(itemCode)
      else
        TempRQFKOrderItem.removeOE2REMItem(itemCode, isAllocationList)

    else
    if orderKind = RQFKORDER_KIND_RASHOD_OE2OUT then
      TempRQFKOrderItem.removeOE2REMItem(itemCode)
    else
    if orderKind = RQFKORDER_KIND_RASHOD_REM2MOL then
      TempRQFKOrderItem.removeREM2MOLItem(itemCode)

    else
    if orderKind = RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT then
      TempRQFKOrderItem.removeOperative2Tranzit(itemCode, isAllocationList)
    else
    if orderKind = RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE then
      TempRQFKOrderItem.removeMeasurementChange(itemCode)

    else
    if orderKind = RQFKORDER_KIND_RASHOD_E2E then
      TempRQFKOrderItem.removeE2E(itemCode)

    else
    if orderKind = RQFKORDER_KIND_LOADEXPL_MBP then
       TempRQFKOrderItem.removeLoadMBPItem(itemCode)
    else
    if orderKind = RQFKORDER_KIND_LOADEXPL_MNMA then
       TempRQFKOrderItem.removeLoadMNMAItem(itemCode)

    else
    if orderKind = RQFKORDER_KIND_MBP then
       TempRQFKOrderItem.removeMBPItem(itemCode)
    else
    if orderKind = RQFKORDER_KIND_MNMA then
       TempRQFKOrderItem.removeMNMAItem(itemCode)
    else
    if orderKind = RQFKORDER_KIND_WRITEOFFCOUNTERS then
       TempRQFKOrderItem.removeCSCountersByFKItemCodeWriteOff(itemCode)
    else
        if orderKind = RQFKORDER_KIND_RASHOD_MNMA then
       TempRQFKOrderItem.removeOutMNMAItem(itemCode)
    else
    if orderKind = RQFKORDER_KIND_RASHOD_GIFT then
       TempRQFKOrderItem.removeGiftItem(itemCode)

    else
    if orderKind = RQFKORDER_KIND_RASHOD_TO_STORAGE then
       TempRQFKOrderItem.removeStorageItem(itemCode, isAllocationList)
    else
    if orderKind = RQFKORDER_KIND_ZONE_CHANGING then
       TempRQFKOrderItem.removeZoneChangingItem(itemCode)
    else
    if orderKind = RQFKORDER_KIND_AVAR_OUT then
       TempRQFKOrderItem.removeAvarOutItem(itemCode)
    else
    if orderKind = RQFKORDER_KIND_AVAR_IN then
       TempRQFKOrderItem.removeAvarInItem(itemCode)
    else
      ShowMessage('error in kindCode');

end;

procedure TfrmRQFKOrderEdit.edtSumWithoutNdsChange(Sender: TObject);
var sumNds, sumWithoutNds : Double;
date : TDateTime;
begin
  try
    sumWithoutNds := StrToFloat(edtSumWithoutNds.Text);
  except
    on EConvertError do
      sumWithoutNds := 0;
  end;

  if (Sender = edtSumWithoutNds) and (Length(edtNdsPercent.Text) > 0) then begin
    if edtDateGen.Checked then date := edtDateGen.DateTime else date := Now();
    FinancialUtilsUnit.calculateVat(edtSumWithoutNds, edtSumNds, date, True, False, StrToFloat(edtNdsPercent.Text));
  end;

  try
    sumNds := StrToFloat(edtSumNds.Text);
  except
    on EConvertError do
      sumNds := 0;
  end;

  edtSum.Text := FloatToStr(Conv(sumWithoutNds + sumNds, 2));
end;

procedure TfrmRQFKOrderEdit.actUpdateDFDocsExecute(Sender: TObject);
begin
  updateDFDocs;
end;

procedure TfrmRQFKOrderEdit.actUpdateExecute(Sender: TObject);
begin
  inherited;
  pcRQFKOrderChange(Sender);
end;


procedure TfrmRQFKOrderEdit.updateDFDocs;
begin
  if DialogState = dsInsert then Exit;
  if RQFKOrderObj = nil then Exit;
  if RQFKOrderObj.code = LOW_INT then Exit;

  DMReports.fillDFDocsGrid(RQFKOrderObj, Self, sgDFDocs);
end;

procedure TfrmRQFKOrderEdit.updateFINMaterialsGrid();
var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  j,i, objCode : Integer;
  finList: FINMaterialsShortList; //List_;
  finFilter : FINMaterialsFilter;
begin
   for i:=1 to sgENFINMaterials.RowCount-1 do
     for j:=0 to sgENFINMaterials.ColCount-1 do
       sgENFINMaterials.Cells[j,i]:='';

  SetGridHeaders(FINMaterialsShortHeaders, sgENFINMaterials.ColumnHeaders);

   try
     objCode := StrToInt(sgRQFKOrderItem.Cells[0,sgRQFKOrderItem.Row]);
   except
   on EConvertError do Exit;
  end;

  finFilter := FINMaterialsFilter.Create;
  SetNullIntProps(finFilter);
  SetNullXSProps(finFilter);

  //finFilter.statusRef := FINMaterialsStatusRef.Create;
  //finFilter.statusRef.code := FINMATERIALSSTATUS_GOOD;

  finFilter.conditionSQL := 'finmaterials.statusrefcode in (' +
                             IntToStr(FINMATERIALSSTATUS_GOOD) + ', ' + IntToStr(FINMATERIALSSTATUS_MOVED) + ', ' +
                             IntToStr(CORRECTREASON_MOVE_TO_FACT) +
                            ') and finmaterials.code in '+
                            '(select RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE from RQFKORDERITEM2ENSTMTTM ' +
                            ' where RQFKORDERITEM2ENSTMTTM.FKORDERITEMREFCODE = ' + IntToStr(objCode) + ')';

  TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

  finList := TempFINMaterials.getScrollableFilteredList(finFilter,0,-1);

  if High(finList.list) > -1 then
     sgENFINMaterials.RowCount:=High(finList.list)+2
  else
     sgENFINMaterials.RowCount:=2;

   with sgENFINMaterials do
    for i:=0 to High(finList.list) do
      begin
        Application.ProcessMessages;
        if finList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(finList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := finList.list[i].mat_name;
        Cells[2,i+1] := finList.list[i].mu_name;
        Cells[3,i+1] := finList.list[i].nn;

        if finList.list[i].quantity = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := finList.list[i].quantity.DecimalString;

{перенесено в калк_прайс

        if finList.list[i].price = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := finList.list[i].price.DecimalString;
}
        if finList.list[i].calc_price = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := finList.list[i].calc_price.DecimalString;

        if finList.list[i].cost = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := finList.list[i].cost.DecimalString;

        Cells[7, i+1] := IntToStr(finList.list[i].frc_code) + ' ' + finList.list[i].frc_name;

        Cells[8,i+1] := finList.list[i].div_name;

        Cells[9,i+1] := finList.list[i].rest_purpose_name;

        Cells[10,i+1] := finList.list[i].partner_name;

        if finList.list[i].doc_date = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := XSDate2String(finList.list[i].doc_date);

        Cells[12,i+1] := finList.list[i].party_discription;

        Cells[13,i+1] := IntToStr(finList.list[i].party_id);

        Cells[14, i+1] := finList.list[i].userGen ;

        if finList.list[i].dateEdit <> nil then
          Cells[15, i+1] := XSDateTimeWithDate2String(finList.list[i].dateEdit)
        else
          Cells[15, i+1] := '';

        {
        Cells[5,i+1] := finList.list[i].partner_name;
        if FINMaterialsList.list[i].doc_date = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDate2String(FINMaterialsList.list[i].doc_date);
        Cells[7,i+1] := FINMaterialsList.list[i].party_discription;
        if FINMaterialsList.list[i].rest_purpose_id = Low(Integer) then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := IntToStr(FINMaterialsList.list[i].rest_purpose_id);
        Cells[9,i+1] := FINMaterialsList.list[i].rest_purpose_name;
        if FINMaterialsList.list[i].rest_purpose_type_id = Low(Integer) then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := IntToStr(FINMaterialsList.list[i].rest_purpose_type_id);
        if FINMaterialsList.list[i].budget_core_id = Low(Integer) then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := IntToStr(FINMaterialsList.list[i].budget_core_id);
        if FINMaterialsList.list[i].frc_code = Low(Integer) then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := IntToStr(FINMaterialsList.list[i].frc_code);
        Cells[13,i+1] := FINMaterialsList.list[i].frc_name;
        if FINMaterialsList.list[i].calc_price = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := FINMaterialsList.list[i].calc_price.DecimalString;
        if FINMaterialsList.list[i].quantity = nil then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := FINMaterialsList.list[i].quantity.DecimalString;
        if FINMaterialsList.list[i].price = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := FINMaterialsList.list[i].price.DecimalString;
        if FINMaterialsList.list[i].cost = nil then
          Cells[17,i+1] := ''
        else
          Cells[17,i+1] := FINMaterialsList.list[i].cost.DecimalString;
        Cells[18,i+1] := FINMaterialsList.list[i].bal_sch;
        LastRow:=i+1;
        }
        sgENFINMaterials.RowCount:= i + 2;
      end;
   //ColCount:=ColCount+1;
   sgENFINMaterials.Row:=1;

end;



procedure  TfrmRQFKOrderEdit.updateSCSealGrid();
var
  i: Integer;
  TempSCSeal: SCSealControllerSoapPort;
  SCSealList: SCSealShortList;
  sealFilter: SCSealFilter;
  objCode : Integer;
begin
  SetGridHeaders(SCSealHeaders, sgSCSeal.ColumnHeaders);
  ClearGrid(sgSCSeal);

  try
    objCode := StrToInt(sgRQFKOrderItem.Cells[0,sgRQFKOrderItem.Row]);
  except
    on EConvertError do Exit;
  end;

    sealFilter := SCSealFilter.Create;
    SetNullIntProps(sealFilter);
    SetNullXSProps(sealFilter);

    sealFilter.conditionSQL := 'code in (select qq.scsealrefcode from rqfkorderitem2enstmttm qq where qq.fkorderitemrefcode = ' + IntToStr(objCode) + ')';

    TempSCSeal := HTTPRIOSCSeal as SCSealControllerSoapPort;
    SCSealList := TempSCSeal.getScrollableFilteredList(sealFilter, 0, -1);

    sgSCSealLastCount := High(SCSealList.list);

    if sgSCSealLastCount > -1 then
      sgSCSeal.RowCount := sgSCSealLastCount+2
    else
      sgSCSeal.RowCount := 2;

     with sgSCSeal do
      for i:=0 to sgSCSealLastCount do
        begin
          //Application.ProcessMessages;
          if SCSealList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(SCSealList.list[i].code)
          else
            Cells[0,i+1] := '';
          Cells[1,i+1] := SCSealList.list[i].invNumber;
          Cells[2,i+1] := SCSealList.list[i].name;
          Cells[3,i+1] := SCSealList.list[i].buildNumber;
          Cells[4,i+1] := SCSealList.list[i].account;
          Cells[5,i+1] := SCSealList.list[i].departmetFKCode;
          Cells[6,i+1] := SCSealList.list[i].molCode;
          if SCSealList.list[i].dateIn = nil then
            Cells[7,i+1] := ''
          else
            Cells[7,i+1] := XSDate2String(SCSealList.list[i].dateIn);
          if SCSealList.list[i].dateBuild = nil then
            Cells[8,i+1] := ''
          else
            Cells[8,i+1] := XSDate2String(SCSealList.list[i].dateBuild);

          if SCSealList.list[i].cost = nil then
            Cells[9,i+1] := ''
          else
            Cells[9,i+1] := SCSealList.list[i].cost.DecimalString;
          if SCSealList.list[i].scCode = Low(Integer) then
            Cells[10,i+1] := ''
          else
            Cells[10,i+1] := IntToStr(SCSealList.list[i].scCode);
          Cells[11,i+1] := SCSealList.list[i].typeRefName;
          Cells[12,i+1] := SCSealList.list[i].installOrderNumber;

          if SCSealList.list[i].dateEdit = nil then
            Cells[13,i+1] := ''
          else
            Cells[13,i+1] := XSDateTimeWithDate2String(SCSealList.list[i].dateEdit);

          sgSCSealLastRow := i+1;
          sgSCSeal.RowCount := sgSCSealLastRow+1;
        end;
     sgSCSealColCount:=sgSCSealColCount+1;
     sgSCCounter.Row:=1;
end;

procedure  TfrmRQFKOrderEdit.updateSCCounterGrid();
var
  i: Integer;
  TempSCCounter: SCCounterControllerSoapPort;
  SCCounterList: SCCounterShortList;
  counterFilter: SCCounterFilter;
  objCode : Integer;
  TempRQFKOrder: RQFKOrderControllerSoapPort;
  RQFKOrderList: RQFKOrderShortList;
  RQFKOrderFilterObj : RQFKOrderFilter;
begin
  SetGridHeaders(SCCounterHeaders, sgSCCounter.ColumnHeaders);
  ClearGrid(sgSCCounter);
  sgSCCounterColCount := 100;

  try
    objCode := StrToInt(sgRQFKOrderItem.Cells[0,sgRQFKOrderItem.Row]);
  except
    on EConvertError do Exit;
  end;

    counterFilter := SCCounterFilter.Create;
    SetNullIntProps(counterFilter);
    SetNullXSProps(counterFilter);
    counterFilter.kindRef := SCCounterKindRef.Create;
    // проверим кинд ордера  
    TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

    RQFKOrderFilterObj := RQFKOrderFilter.Create;
    SetNullIntProps(RQFKOrderFilterObj);
    SetNullXSProps(RQFKOrderFilterObj);

    RQFKOrderFilterObj.conditionSQL := ' code in ( select r.code  from rqfkorderitem ri , rqfkorder r ' +
                                       ' where ri.code = ' + IntToStr(objCode) +
                                       '   and ri.fkorderrefcode = r.code ' +
                                       '   limit 1 ) ';
    RQFKOrderList := TempRQFKOrder.getScrollableFilteredList(RQFKOrderFilterObj, 0, -1);

    if High(RQFKOrderList.list) > -1 then
       if RQFKOrderList.list[0].kindCode = RQFKORDER_KIND_WRITEOFFCOUNTERS then
        counterFilter.kindRef.code := SCCOUNTERKIND_FOR_WRITINGOFF
       else if RQFKOrderList.list[0].kindCode = RQFKORDER_KIND_ZONE_CHANGING then
          counterFilter.kindRef.code := SCCOUNTERKIND_FOR_ZONECHANGING
        else
          counterFilter.kindRef.code := SCCOUNTERKIND_FOR_MOVE;

    counterFilter.conditionSQL := 'code in (select qq.sccounterrefcode from rqfkorderitem2enstmttm qq where qq.fkorderitemrefcode = ' + IntToStr(objCode) + ')';

    TempSCCounter := HTTPRIOSCCounter as SCCounterControllerSoapPort;
    SCCounterList := TempSCCounter.getScrollableFilteredList(counterFilter, 0, sgSCCounterColCount);

    sgSCCounterLastCount := High(SCCounterList.list);

    if sgSCCounterLastCount > -1 then
      sgSCCounter.RowCount := sgSCCounterLastCount+2
    else
      sgSCCounter.RowCount := 2;

     with sgSCCounter do
      for i:=0 to sgSCCounterLastCount do
        begin
          //Application.ProcessMessages;
          if SCCounterList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(SCCounterList.list[i].code)
          else
            Cells[0,i+1] := '';
          Cells[1,i+1] := SCCounterList.list[i].invNumber;
          Cells[2,i+1] := SCCounterList.list[i].name;
          Cells[3,i+1] := SCCounterList.list[i].buildNumber;
          Cells[4,i+1] := SCCounterList.list[i].account;
          Cells[5,i+1] := SCCounterList.list[i].departmetFKCode;
          Cells[6,i+1] := SCCounterList.list[i].molCode;
          if SCCounterList.list[i].dateIn = nil then
            Cells[7,i+1] := ''
          else
            Cells[7,i+1] := XSDate2String(SCCounterList.list[i].dateIn);
          if SCCounterList.list[i].dateBuild = nil then
            Cells[8,i+1] := ''
          else
            Cells[8,i+1] := XSDate2String(SCCounterList.list[i].dateBuild);
          if SCCounterList.list[i].dateCheck = nil then
            Cells[9,i+1] := ''
          else
            Cells[9,i+1] := XSDate2String(SCCounterList.list[i].dateCheck);
          if SCCounterList.list[i].cost = nil then
            Cells[10,i+1] := ''
          else
            Cells[10,i+1] := SCCounterList.list[i].cost.DecimalString;
          if SCCounterList.list[i].scCode = Low(Integer) then
            Cells[11,i+1] := ''
          else
            Cells[11,i+1] := IntToStr(SCCounterList.list[i].scCode);
          Cells[12,i+1] := SCCounterList.list[i].counterType;
          Cells[13,i+1] := SCCounterList.list[i].installOrderNumber;
          Cells[14,i+1] := SCCounterList.list[i].reading;
          if SCCounterList.list[i].dateEdit = nil then
            Cells[15,i+1] := ''
          else
            Cells[15,i+1] := XSDateTimeWithDate2String(SCCounterList.list[i].dateEdit);

          sgSCCounterLastRow := i+1;
          sgSCCounter.RowCount := sgSCCounterLastRow+1;
        end;
     sgSCCounterColCount:=sgSCCounterColCount+1;
     sgSCCounter.Row:=1;
end;


procedure TfrmRQFKOrderEdit.sgRQFKOrderItemClick(Sender: TObject);
begin
  inherited;

  if (RQFKOrderObj.kind.code <> RQFKORDER_KIND_PRIHOD_POSTAVKA ) and (RQFKOrderObj.kind.code <> RQFKORDER_KIND_PRIHOD_BUFET) then
  begin

    if RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_TMC then
    begin
      gbFINMaterials.Caption := 'Матеріали з Фин.Кол.';
      updateFINMaterialsGrid();
    end;
    if RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_COUNTER then
    begin
      gbFINMaterials.Caption := 'Лічильники';
      updateSCCounterGrid();
    end;
    if RQFKOrderObj.accountingTypeRef.code in [TK_ACCOUNTINGTYPE_SEAL, TK_ACCOUNTINGTYPE_IMP, TK_ACCOUNTINGTYPE_HOLO] then
    begin
      gbFINMaterials.Caption := 'ПЛОМБИ, ІМП, ГОЛОГРАМИ';
      updateSCSealGrid();
    end;

  end;
end;

procedure TfrmRQFKOrderEdit.sgSCCounterTopLeftChanged(Sender: TObject);
var
  i, CurrentRow : Integer;
  TempSCCounter: SCCounterControllerSoapPort;
  SCCounterList: SCCounterShortList;
  counterFilter: SCCounterFilter;
  stringGrid : TAdvStringGrid;
  objCode : Integer;
  TempRQFKOrder: RQFKOrderControllerSoapPort;
  RQFKOrderList: RQFKOrderShortList;
  RQFKOrderFilterObj : RQFKOrderFilter;
begin
  inherited;
  if sgSCCounterLastCount < 99 then Exit;
  if (sgSCCounter.TopRow + sgSCCounter.VisibleRowCount) = sgSCCounterColCount
  then
  begin
    CurrentRow := sgSCCounter.RowCount;

    try
      objCode := StrToInt(sgRQFKOrderItem.Cells[0,sgRQFKOrderItem.Row]);
    except
      on EConvertError do Exit;
    end;

    counterFilter := SCCounterFilter.Create;
    SetNullIntProps(counterFilter);
    SetNullXSProps(counterFilter);
    counterFilter.kindRef := SCCounterKindRef.Create;
    // проверим кинд ордера
    TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

    RQFKOrderFilterObj := RQFKOrderFilter.Create;
    SetNullIntProps(RQFKOrderFilterObj);
    SetNullXSProps(RQFKOrderFilterObj);

    RQFKOrderFilterObj.conditionSQL := ' code in ( select r.code  from rqfkorderitem ri , rqfkorder r ' +
                                       ' where ri.code = ' + IntToStr(objCode) +
                                       '   and ri.fkorderrefcode = r.code ' +
                                       '   limit 1 ) ';
    RQFKOrderList := TempRQFKOrder.getScrollableFilteredList(RQFKOrderFilterObj, 0, -1);

    if High(RQFKOrderList.list) > -1 then
       if RQFKOrderList.list[0].kindCode = RQFKORDER_KIND_WRITEOFFCOUNTERS then
        counterFilter.kindRef.code := SCCOUNTERKIND_FOR_WRITINGOFF
       else if RQFKOrderList.list[0].kindCode = RQFKORDER_KIND_ZONE_CHANGING then
          counterFilter.kindRef.code := SCCOUNTERKIND_FOR_ZONECHANGING
        else
          counterFilter.kindRef.code := SCCOUNTERKIND_FOR_MOVE;

    counterFilter.conditionSQL := 'code in (select qq.sccounterrefcode from rqfkorderitem2enstmttm qq where qq.fkorderitemrefcode = ' + IntToStr(objCode) + ')';

    TempSCCounter := HTTPRIOSCCounter as SCCounterControllerSoapPort;
    SCCounterList := TempSCCounter.getScrollableFilteredList(counterFilter, sgSCCounterColCount-1, 100);

    sgSCCounter.RowCount := sgSCCounter.RowCount+100;
    sgSCCounterLastCount := High(SCCounterList.list);

    with sgSCCounter do
      for i:=0 to sgSCCounterLastCount do
        begin
          if SCCounterList.list[i].code <> Low(Integer) then
            Cells[0,i+CurrentRow] := IntToStr(SCCounterList.list[i].code)
          else
            Cells[0,i+CurrentRow] := '';

          Cells[1,i+CurrentRow] := SCCounterList.list[i].invNumber;
          Cells[2,i+CurrentRow] := SCCounterList.list[i].name;
          Cells[3,i+CurrentRow] := SCCounterList.list[i].buildNumber;
          Cells[4,i+CurrentRow] := SCCounterList.list[i].account;
          Cells[5,i+CurrentRow] := SCCounterList.list[i].departmetFKCode;
          Cells[6,i+CurrentRow] := SCCounterList.list[i].molCode;

          if SCCounterList.list[i].dateIn = nil then
            Cells[7,i+CurrentRow] := ''
          else
            Cells[7,i+CurrentRow] := XSDate2String(SCCounterList.list[i].dateIn);
          if SCCounterList.list[i].dateBuild = nil then
            Cells[8,i+CurrentRow] := ''
          else
            Cells[8,i+CurrentRow] := XSDate2String(SCCounterList.list[i].dateBuild);
          if SCCounterList.list[i].dateCheck = nil then
            Cells[9,i+CurrentRow] := ''
          else
            Cells[9,i+CurrentRow] := XSDate2String(SCCounterList.list[i].dateCheck);
          if SCCounterList.list[i].cost = nil then
            Cells[10,i+CurrentRow] := ''
          else
            Cells[10,i+CurrentRow] := SCCounterList.list[i].cost.DecimalString;
          if SCCounterList.list[i].scCode = Low(Integer) then
            Cells[11,i+CurrentRow] := ''
          else
            Cells[11,i+CurrentRow] := IntToStr(SCCounterList.list[i].scCode);

          Cells[12,i+CurrentRow] := SCCounterList.list[i].counterType;
          Cells[13,i+CurrentRow] := SCCounterList.list[i].installOrderNumber;
          Cells[14,i+CurrentRow] := SCCounterList.list[i].reading;

          if SCCounterList.list[i].dateEdit = nil then
            Cells[15,i+CurrentRow] := ''
          else
            Cells[15,i+CurrentRow] := XSDateTimeWithDate2String(SCCounterList.list[i].dateEdit);

          sgSCCounterLastRow:=i+CurrentRow;
        end;

     sgSCCounterColCount:=sgSCCounterColCount+100;
     sgSCCounter.Row:=CurrentRow-5;
     sgSCCounter.RowCount:=sgSCCounterLastRow+1;
    end;
end;


procedure TfrmRQFKOrderEdit.actFINUpdateExecute(Sender: TObject);
begin
  inherited;
  if (RQFKOrderObj.kind.code <> RQFKORDER_KIND_PRIHOD_POSTAVKA) and (RQFKOrderObj.kind.code <> RQFKORDER_KIND_PRIHOD_BUFET) then
    updateFINMaterialsGrid();
end;

procedure TfrmRQFKOrderEdit.actFINDeleteExecute(Sender: TObject);
var
  objCode , fkItemCode : Integer;
  TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
begin
  inherited;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити строку ??'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

    objCode := LOW_INT;


    try

      if rqFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_TMC then
        objCode := StrToInt(sgENFINMaterials.Cells[0, sgENFINMaterials.Row]);

      if rqFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_COUNTER then
      begin
        objCode := StrToInt(sgSCCounter.Cells[0, sgSCCounter.Row]);
        //fkItemCode := StrToInt(sgRQFKOrderItem.Cells[0, sgRQFKOrderItem.Row]);
      end;

      if rqFKOrderObj.accountingTypeRef.code in [TK_ACCOUNTINGTYPE_SEAL, TK_ACCOUNTINGTYPE_IMP, TK_ACCOUNTINGTYPE_HOLO] then
      begin
        objCode := StrToInt(sgSCSeal.Cells[0, sgSCSeal.Row]);
      end;

      if (rqFKOrderObj.kind.code = RQFKORDER_KIND_SALE_PRODUCTS) then
        fkItemCode := StrToInt(sgRQFKOrderItem.Cells[0, sgRQFKOrderItem.Row]);

    except
      on EConvertError do Exit;
    end;

    TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
    if  (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM)
          or (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2OUT)
          or (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT) then
    begin
      if rqFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_TMC then begin
        if isAllocationList then begin
            TempRQFKOrderItem.removeREM2MOL(objCode, rqFKOrderObj.code, true);
        end else begin
            TempRQFKOrderItem.removeOE2REM(objCode, rqFKOrderObj.code);
        end;


      end;

      if rqFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_COUNTER then
        TempRQFKOrderItem.removeCSCountersByCounterCode(objCode, rqFKOrderObj.code);

      if RQFKOrderObj.accountingTypeRef.code in [TK_ACCOUNTINGTYPE_SEAL,
                          TK_ACCOUNTINGTYPE_IMP, TK_ACCOUNTINGTYPE_HOLO] then
        TempRQFKOrderItem.removeSCSeals(objCode, rqFKOrderObj.code);

    end

    else
    if (rqFKOrderObj.kind.code = RQFKORDER_KIND_SALE_PRODUCTS) then
      TempRQFKOrderItem.removeOE2REM(objCode, rqFKOrderObj.code, fkItemCode)
    else
    if (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_REM2MOL) then
      TempRQFKOrderItem.removeREM2MOL(objCode, rqFKOrderObj.code)
    else
    if (rqFKOrderObj.kind.code = RQFKORDER_KIND_LOADEXPL_MBP) then
      TempRQFKOrderItem.removeLoadMBP(objCode, rqFKOrderObj.code)
    else
    if (rqFKOrderObj.kind.code = RQFKORDER_KIND_LOADEXPL_MNMA) then
      TempRQFKOrderItem.removeLoadMNMA(objCode, rqFKOrderObj.code)
    else
    /////
    if (rqFKOrderObj.kind.code = RQFKORDER_KIND_MBP) then
      TempRQFKOrderItem.removeMBP(objCode, rqFKOrderObj.code)
    else
    if (rqFKOrderObj.kind.code = RQFKORDER_KIND_MNMA) then
      TempRQFKOrderItem.removeMNMA(objCode, rqFKOrderObj.code)
    else
    if (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_MNMA) then
      TempRQFKOrderItem.removeOutMNMA(objCode, rqFKOrderObj.code)
    else
    if (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_GIFT) then
      TempRQFKOrderItem.removeGift(objCode, rqFKOrderObj.code)
    /////
    else
    if (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_BUFET) then
      TempRQFKOrderItem.removeOE2REM(objCode, rqFKOrderObj.code)

    else
     if  (rqFKOrderObj.kind.code = RQFKORDER_KIND_WRITEOFFCOUNTERS) then
    begin
      if rqFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_COUNTER then
        TempRQFKOrderItem.removeCSCountersByCounterCode(objCode, rqFKOrderObj.code);
    end
    else
    if (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_TO_STORAGE) then
      TempRQFKOrderItem.removeToStorage(objCode, rqFKOrderObj.code)
    else
    if (rqFKOrderObj.kind.code = RQFKORDER_KIND_ZONE_CHANGING) then
    begin
      if rqFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_COUNTER then
            TempRQFKOrderItem.removeCSCountersByCounterCode(objCode, rqFKOrderObj.code)
      else
            TempRQFKOrderItem.removeZoneChanging(objCode, rqFKOrderObj.code);
    end
    else
    if (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_E2E) then
      TempRQFKOrderItem.removeE2E(objCode, rqFKOrderObj.code)
    else
    if {SUPP-10917}(rqFKOrderObj.kind.code = RQFKORDER_KIND_OUT_FUEL) then
      TempRQFKOrderItem.removeOutFuel(objCode, rqFKOrderObj.code)
    else
    if {NET-4400}(rqFKOrderObj.kind.code = RQFKORDER_KIND_AVAR_OUT) then
      TempRQFKOrderItem.removeAvarOut(objCode, rqFKOrderObj.code)
    else
    if {NET-4400}(rqFKOrderObj.kind.code = RQFKORDER_KIND_AVAR_IN) then
      TempRQFKOrderItem.removeAvarIn(objCode, rqFKOrderObj.code)
    else
      ShowMessage('На таком ордере непонятно что делать ....');

    //updateFINMaterialsGrid;
    UpdateGrid(Sender);
  end;

  RefreshRQFKOrder;

end;

procedure TfrmRQFKOrderEdit.spbTKTransportRealTransportRealClick(
  Sender: TObject);
var
   frmTKTransportRealShow: TfrmTKTransportRealShow;
begin
   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal);
   try
      with frmTKTransportRealShow do
        if ShowModal = mrOk then
        begin
            try
               if RQFKOrderObj.transportReal = nil then RQFKOrderObj.transportReal := TKTransportReal.Create();
               RQFKOrderObj.transportReal.code := StrToInt(GetReturnValue(sgTKTransportReal,0));
               edtTKTransportRealTransportRealName.Text:=GetReturnValue(sgTKTransportReal,1);
               edtGosNumber.Text :=  GetReturnValue(sgTKTransportReal,3);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTransportRealShow.Free;
   end;
end;

procedure TfrmRQFKOrderEdit.spbWarrantNumberClick(Sender: TObject);
var frmENWarrantShow : TfrmENWarrantShow;
    f : ENWarrantFilter;
    warrant : ENWarrant;
    datContract, datWarrant : TXSDate;
    dtdatContract, dtdatWarrant : TDateTime;
    power: Double;
begin

     datContract := TXSDate.Create;
     datWarrant := TXSDate.Create;

     f := ENWarrantFilter.Create();
     SetNullXSProps(f);
     SetNullIntProps(f);
    

     f.warrantTypeRef := ENWarrantTypeRef.Create;
     f.warrantTypeRef.code := ENConsts.ENWARRANT_TYPE_RQFKORDER;

     if Length(f.conditionSQL) = 0 then
     f.conditionSQL := '  warrantstatusrefcode = 0'
     else
     f.conditionSQL := f.conditionSQL + ' and warrantstatusrefcode = 0';

     frmENWarrantShow := TfrmENWarrantShow.Create(Application,fmNormal, f);
     frmENWarrantShow.Caption:='Довіренність ';
     DisableActions([frmENWarrantShow.actNoFilter , frmENWarrantShow.actDelete]);
     frmENWarrantShow.enwarrantTypeCode :=  ENConsts.ENWARRANT_TYPE_RQFKORDER;


     try
        with frmENWarrantShow do
          if ShowModal = mrOk then
          begin
              try

                 edtWarrantNumber.Text :=  GetReturnValue(sgENWarrant,1);
                 edtWarrantFIO.Text := GetReturnValue(sgENWarrant,3);
                 edtWarrantDate.DateTime := StrToDate(GetReturnValue(sgENWarrant,9));
                 //edtWarrantFIO.Text := GetReturnValue(sgENWarrant.Objects[1],2);

                 
              except
                 on EConvertError do Exit;
              end;
          end;
     finally
        frmENWarrantShow.Free;
     end;



end;

procedure TfrmRQFKOrderEdit.spbDimensionPurpose30900Click(Sender: TObject);
var
   frmAXDimensionsKSShow : TfrmAXDimensionsKSShow;
   f : AXDimensionsKSfilter;
begin
  inherited;
  f := AXDimensionsKSfilter.Create();
  SetNullXSProps(f);
  SetNullIntProps(f);
  f.dimensionCode := 'PURPOSE';
  f.num := '30900*';

  frmAXDimensionsKSShow := TfrmAXDimensionsKSShow.Create(Application, fmNormal, f);
  DisableActions([frmAXDimensionsKSShow.actInsert,
   frmAXDimensionsKSShow.actDelete,
   frmAXDimensionsKSShow.actEdit,
   frmAXDimensionsKSShow.actUpdate,
   frmAXDimensionsKSShow.actFilter,
   frmAXDimensionsKSShow. actNoFilter]);


  try
    with frmAXDimensionsKSShow do
      if ShowModal = mrOk then
      begin
        try
          edtDimensionPurposeNum30900.Text := GetReturnValue(sgAXDimensionsKS, 1);
          edtDescriptDimensionPurpose30900.Text := GetReturnValue(sgAXDimensionsKS, 2);
          if RQFKOrder2FinObj = nil then
                begin
                  RQFKOrder2FinObj := RQFKOrder2FinServices.Create;
                  RQFKOrder2FinObj.code := LOW_INT;
                end;
          RQFKOrder2FinObj.purposeNumAX := edtDimensionPurposeNum30900.Text;
          RQFKOrder2FinObj.purposeDescriptionAX := edtDescriptDimensionPurpose30900.Text;
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmAXDimensionsKSShow.Free;
  end;
end;

procedure TfrmRQFKOrderEdit.spbDimensionPurpose30900_ClearClick(
  Sender: TObject);
begin
  inherited;
   RQFKOrder2FinObj.purposeNumAX := '';
   RQFKOrder2FinObj.purposeDescriptionAX := '';
   edtDimensionPurposeNum30900.Text:= '';
   edtDescriptDimensionPurpose30900.Text:= '';
end;

procedure TfrmRQFKOrderEdit.spbTKTransportRealClearClick(Sender: TObject);
begin
  //inherited;
  RQFKOrderObj.transportReal.code := LOW_INT;
  edtTKTransportRealTransportRealName.Text := '';
  edtGosNumber.Text := '';

end;

procedure TfrmRQFKOrderEdit.edtDateGenChange(Sender: TObject);
 var curr_nds, curr_nds_low : Double;
 itemIndex : Integer;
begin
  inherited;
  if (not edtDateShipment.Checked) then
  begin
     edtDateShipment.DateTime := edtDateGen.DateTime + 1;
     edtDateShipment.Checked := true;
  end
  else
  begin
      if edtDateShipment.DateTime <= edtDateGen.DateTime then
      edtDateShipment.DateTime := edtDateGen.DateTime + 1;
  end;

   // если меняем дату счета то тянем процент ндс который действует в периоде
			 itemIndex := edtNdsPercent.ItemIndex;
             curr_nds := DMReports.getStandartKoefInPeriod(ENSTANDARDCONST_PDV, edtDateGen.DateTime );
             curr_nds_low := DMReports.getStandartKoefInPeriod(ENSTANDARDCONST_PDV_LOW, edtDateGen.DateTime );
			 edtNdsPercent.Clear;
             edtNdsPercent.AddItem('0',nil);
			 edtNdsPercent.AddItem(FloatToStr(curr_nds_low),nil);
             edtNdsPercent.AddItem(FloatToStr(curr_nds),nil);
			 if (itemIndex > -1) and (edtNdsPercent.Items.Count > itemIndex) then begin
				edtNdsPercent.ItemIndex := itemIndex;
			 end else begin
				edtNdsPercent.ItemIndex := edtNdsPercent.Items.Count - 1;			 
			 end;
end;

procedure TfrmRQFKOrderEdit.edtNdsPercentChange(
  Sender: TObject);
  var sumWithoutNds : Double;
begin
  inherited;

    try
    sumWithoutNds := StrToFloat(edtSumWithoutNds.Text);
  except
    on EConvertError do
      sumWithoutNds := 0;
  end;

    if edtNdsPercent.Text = '0' then
     edtSumNds.Text := '0'
    else
    begin
       edtSum.Text := FloatToStr(Conv( sumWithoutNds * (1 + ( StrToFloat(edtNdsPercent.Text) /100 )) ,2)  ) ;
       edtSumNds.Text := FloatToStr(StrToFloat(edtSum.Text) - sumWithoutNds );
    end;
end;

procedure TfrmRQFKOrderEdit.actPrintOZExecute(Sender: TObject);
var
  i , brr, objCode : Integer;
  TempSCOrder : SCOrderControllerSoapPort;
  scOrdFilter : SCOrderFilter;
  scOrdList : SCOrderShortList;

begin
  inherited;

  try
     objCode := StrToInt(sgRQFKOrderItem.Cells[0,sgRQFKOrderItem.Row]);
   except
     on EConvertError do Exit;
  end;

  // для каждого СКОрдера будем печатать свою ОЗ на перемещение
     scOrdFilter := SCOrderFilter.Create;
     SetNullIntProps(scOrdFilter);
     SetNullXSProps(scOrdFilter);
     scOrdFilter.conditionSQL := ' code in ( ' +
    ' select sco.code from scorder sco, scinvoice sci ' +
    ' where sco.invoicerefcode = sci.code ' +
    ' and sci.fkorderitemrefcode = ' + IntToStr(objCode) + ' )';

    TempSCOrder :=  HTTPRIOSCOrder as SCOrderControllerSoapPort;
    scOrdList := TempSCOrder.getScrollableFilteredList(scOrdFilter, 0, -1);

    for brr := 0 to High(scOrdList.list) do
    begin
      printingOZ(objCode, scOrdList.list[brr].code);
    end;

end;

procedure TfrmRQFKOrderEdit.printingOZ(fkItemCode : Integer; scOrderCode : Integer);
var
  i : Integer;
  argNames, args: ArrayOfString;
  reportName: String;
begin

   SetLength(argNames, 2);
   SetLength(args, 2);

   argnames[0] := 'codeoz';
   args[0] := IntToStr( fkItemCode );

   argNames[1] := 'scordercode';
   args[1] := IntToStr(scOrderCode);
   reportName := 'Counters/VN_PER/Counters_vn_per';

   makeReport(reportName, argNames, args, 'xls');

end;



procedure TfrmRQFKOrderEdit.tbAddFromBillClick(Sender: TObject);
var
 frmMaterialsRQFKOrderOutEdit : TfrmMaterialsRQFKOrderOutEdit;
 frmMaterialsRQFKOrderOutSCCounterEdit : TfrmMaterialsRQFKOrderOutSCCounterEdit;
 i,j: Integer;
 frmBillItemInOrderEdit: TfrmBillItemInOrderEdit;

begin

  if (RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_BUFET) then
  begin
      try
        if RQFKOrderObj.org = nil then
        begin
            ShowMessage('Вкажіть постачальника ...');
            Exit;
        end;
        if  RQFKOrderObj.org.code = LOW_INT then
        begin
            ShowMessage('Вкажіть постачальника ...');
            Exit;
        end;

        frmBillItemInOrderEdit := TfrmBillItemInOrderEdit.Create(Application, dsInsert);
        frmBillItemInOrderEdit.Caption := 'Матеріали з рахунків у накладній';
        frmBillItemInOrderEdit.invoiceCode := RQFKOrderObj.code;
        frmBillItemInOrderEdit.isBill := false;
        // тип учета мат-лов ...
        frmBillItemInOrderEdit.accountingTypeCode := RQFKOrderObj.accountingTypeRef.code;

        frmBillItemInOrderEdit.orgId := RQFKOrderObj.org.id;
        if RQFKOrderObj.storageRef <> nil then
          frmBillItemInOrderEdit.storageCode := RQFKOrderObj.storageRef.code;

        frmBillItemInOrderEdit.MOLCode := RQFKOrderObj.molOutCode;

        try
          if frmBillItemInOrderEdit.ShowModal = mrOk then
          begin
            //if RQOrderItemObj<>nil then
                //TempRQOrderItem.add(RQOrderItemObj);
                //UpdateGrid(Sender);
          end;
        finally
          frmBillItemInOrderEdit.Free;
          frmBillItemInOrderEdit:=nil;
        end;
      finally
      end;
  end;

  actUpdateExecute(Sender);
end;

procedure TfrmRQFKOrderEdit.spbAccountClick(Sender: TObject);
var frmFKAccountShow: TfrmFKAccountShow;
    accountFilter: FKAccountFilter;
begin
  accountFilter := FKAccountFilter.Create;
  SetNullIntProps(accountFilter);
  SetNullXSProps(accountFilter);

  if (RQFKOrderObj.kind.code = RQFKORDER_KIND_MBP) then
    accountFilter.conditionSQL := 's.sch = ''22'''
  else
  if (RQFKOrderObj.kind.code = RQFKORDER_KIND_MNMA) then
    accountFilter.conditionSQL := 's.sch = ''15'''
  else if (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_MNMA) then
    accountFilter.conditionSQL := 's.sch in (''15'', ''11'')'
  else if (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_TO_STORAGE) then
    accountFilter.conditionSQL := 's.sch in (''15'', ''11'')'
  else
    raise Exception.Create('Цей тип ордеру не підтримується!');

  frmFKAccountShow := TfrmFKAccountShow.Create(Application, fmNormal, accountFilter);
  try
    frmFKAccountShow.DisableActions([frmFKAccountShow.actView,
                                     frmFKAccountShow.actInsert,
                                     frmFKAccountShow.actDelete,
                                     frmFKAccountShow.actEdit,
                                     frmFKAccountShow.actFilter,
                                     frmFKAccountShow.actNoFilter]);
    with frmFKAccountShow do
      if ShowModal = mrOk then
      begin
        RQFKOrderObj.account := GetReturnValue(sgFKAccount, 1);
        edtAccount.Text := GetReturnValue(sgFKAccount, 1);
      end;
  finally
    frmFKAccountShow.Free;
  end;
end;

procedure TfrmRQFKOrderEdit.spbKau1476Click(Sender: TObject);
var
   frmKauShow : TfrmKauShow;
   f : KauFilter;
begin
   f := KauFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);
   //f.kau_table_id := 1476;
   f.kau_table_id := 2753;  // по заданию Юрковского поменять справочники из ФК

   frmKauShow := TfrmKauShow.Create(Application, fmNormal, f);
   DisableActions([frmKauShow.actInsert, frmKauShow.actEdit,
        frmKauShow.actDelete, frmKauShow.actView], true);

   try
      with frmKauShow do
        if ShowModal = mrOk then
        begin
            try
                edtKau1476.Text := GetReturnValue(sgKau, 2);
                edtKauName1476.Text := GetReturnValue(sgKau, 3);

                if RQFKOrder2FinObj = nil then
                begin
                  RQFKOrder2FinObj := RQFKOrder2FinServices.Create;
                  RQFKOrder2FinObj.code := LOW_INT;
                end;

                RQFKOrder2FinObj.kau_table_id_1476 := StrToInt(GetReturnValue(sgKau, 1));
                RQFKOrder2FinObj.kau_1476 := edtKau1476.Text;
                RQFKOrder2FinObj.name_1476 := edtKauName1476.Text;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmKauShow.Free;
   end;

end;


procedure TfrmRQFKOrderEdit.spbKau2494ClearClick(Sender: TObject);
begin
  inherited;
  edtKau2494.Text := '';
  edtKauName2494.Text := '';
  RQFKOrder2FinObj.kau_table_id_2494 := LOW_INT;
  RQFKOrder2FinObj.kau_2494 := '';
  RQFKOrder2FinObj.name_2494 := '';
end;


procedure TfrmRQFKOrderEdit.spbKau2494Click(Sender: TObject);
var
   frmKauShow : TfrmKauShow;
   f : KauFilter;
begin
  inherited;
  f := KauFilter.Create();
  SetNullXSProps(f);
  SetNullIntProps(f);
  f.kau_table_id := 2494;

  frmKauShow := TfrmKauShow.Create(Application, fmNormal, f);
  DisableActions([frmKauShow.actInsert, frmKauShow.actEdit,
      frmKauShow.actDelete, frmKauShow.actView], true);

  try
    with frmKauShow do
      if ShowModal = mrOk then
      begin
        try
          edtKau2494.Text := GetReturnValue(sgKau, 2);
          edtKauName2494.Text := GetReturnValue(sgKau, 3);
          RQFKOrder2FinObj.kau_table_id_2494 := StrToInt(GetReturnValue(sgKau, 1));
          RQFKOrder2FinObj.kau_2494 := edtKau2494.Text;
          RQFKOrder2FinObj.name_2494 := edtKauName2494.Text;
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmKauShow.Free;
  end;
end;


procedure TfrmRQFKOrderEdit.spbKau1476ClearClick(Sender: TObject);
begin
  inherited;
     edtKau1476.Text := '';
     edtKauName1476.Text := '';
     RQFKOrder2FinObj.kau_table_id_1476 := LOW_INT;
     RQFKOrder2FinObj.kau_1476 := '';
     RQFKOrder2FinObj.name_1476 := '';
end;

function TfrmRQFKOrderEdit.getDFDocSignersForSaving(var dfDocSigners: ArrayOfDFDocSigner): Boolean;
begin
  Result := DMReports.getDFDocSignersForSaving(RQFKOrderObj, Self, sgDFDocSigners, dfDocSigners);
end;

procedure TfrmRQFKOrderEdit.getFKOrderPostingsList(fkOrderCode: Integer);
var i: Integer;
    TempRQFKOrderController : RQFKOrderControllerSoapPort;
    fkProvList : FKProvObjectShortList;
begin
  ClearGrid(sgFKOrderProvs);
  ClearGrid(sgFKProvErrorsDetailed);

  if RQFKOrderObj.code = LOW_INT then Exit;
  HideControls([gbFKOrderPostings], True);

  TempRQFKOrderController := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

  try
    fkProvList := TempRQFKOrderController.getFKOrderPostingsList(RQFKOrderObj.code);
  except
    on EConvertError do Exit;
  end;

  HideControls([gbFKOrderPostings], False);

  if High(fkProvList.list) > -1 then
    sgFKOrderProvs.RowCount := High(fkProvList.list) + 2
  else
    sgFKOrderProvs.RowCount := 2;

  with sgFKOrderProvs do
    for i := 0 to High(fkProvList.list) do
    begin
       if fkProvList.list[i].id <> Low(Integer) then
        Cells[0,i+1] := IntToStr(fkProvList.list[i].id)
      else
        Cells[0,i+1] := '';
      if fkProvList.list[i].dt_prov = nil then
        Cells[1,i+1] := ''
      else
        Cells[1,i+1] := XSDate2String(fkProvList.list[i].dt_prov);
      Cells[2,i+1] := fkProvList.list[i].bal_ceh;
      Cells[3,i+1] := fkProvList.list[i].bal_sch;
      Cells[4,i+1] := fkProvList.list[i].bal_sub_sch;
      Cells[5,i+1] := fkProvList.list[i].bal_kau;
      Cells[6,i+1] := fkProvList.list[i].kor_ceh;
      Cells[7,i+1] := fkProvList.list[i].kor_sch;
      Cells[8,i+1] := fkProvList.list[i].kor_sub_sch;
      Cells[9,i+1] := fkProvList.list[i].kor_kau;
      if fkProvList.list[i].summa = nil then
        Cells[10,i+1] := ''
      else
        Cells[10,i+1] := fkProvList.list[i].summa.DecimalString;
      Cells[11,i+1] := fkProvList.list[i].primechan;
    end;
end;

procedure TfrmRQFKOrderEdit.btnDeleteFromFKClick(Sender: TObject);
var TempRQFKOrderController: RQFKOrderControllerSoapPort;
begin
  if RQFKOrderObj.code = LOW_INT then Exit;

  if (RQFKOrderObj.status.code <> RQFKORDER_STATUS_IN_FK) then
  begin
    Application.MessageBox(PChar('Цей Акт ще не проведений!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте ВІДМІНИТИ проведення документів у Фін. Колекції ?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;

  TempRQFKOrderController := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  TempRQFKOrderController.deletePostingFromFK(RQFKOrderObj.code , 1 );

  Application.MessageBox(PChar('Документи відмінено!'), PChar('Інформація'), MB_ICONINFORMATION);

  getStatus(RQFKOrderObj.code);
  getFKOrderPostingsList(RQFKOrderObj.code);
  getPostingsListAx(RQFKOrderObj.code);
end;

procedure TfrmRQFKOrderEdit.btnGetPostingsListClick(Sender: TObject);
begin
  getFKOrderPostingsList(RQFKOrderObj.code);
  getPostingsListAx(RQFKOrderObj.code);
end;

procedure TfrmRQFKOrderEdit.getStatus(fkOrderCode: Integer);
var TempRQFKOrderController: RQFKOrderControllerSoapPort;
begin
  HideControls([btnMoveToFK, btnDeleteFromFK]);

  if RQFKOrderObj.code > LOW_INT then
  begin
    TempRQFKOrderController := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
    RQFKOrderObj := TempRQFKOrderController.getObject(RQFKOrderObj.code);
	
	SetDateFieldForDateTimePicker(edtDatePosting, RQFKOrderObj.datePosting);
	
    if RQFKOrderObj.status.code in [RQFKORDER_STATUS_CREATED, RQFKORDER_STATUS_IN_WORK_ON_WAREHOUSE] then
    begin
      HideControls([btnMoveToFK, btnChangeDatePosting, lblDatePosting, edtDatePosting], false);
      HideControls([btnDeleteFromFK]);
      DisableControls([edtDatePosting], false);
    end;

    if RQFKOrderObj.status.code = RQFKORDER_STATUS_IN_FK then
    begin
      HideControls([btnMoveToFK, btnChangeDatePosting]);
      HideControls([btnDeleteFromFK, lblDatePosting, edtDatePosting], false);
      btnDeleteFromFK.Left := 16;
      DisableControls([edtDatePosting], true);
    end;

  end;
 
end;


procedure TfrmRQFKOrderEdit.btnMoveToFKClick(Sender: TObject);
var TempRQFKOrderController: RQFKOrderControllerSoapPort;
    i: Integer;
    provList: FKProvObjectShortList;
begin
  if RQFKOrderObj = nil then Exit;
  if RQFKOrderObj.code = LOW_INT then Exit;

  if (RQFKOrderObj.status.code = RQFKORDER_STATUS_IN_FK) then
  begin
    Application.MessageBox(PChar('Цей акт вже проведений!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте ПРОВЕСТИ документи в Фін. Колекції ?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;



  TempRQFKOrderController := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

  if (RQFKOrderObj.kind.code = RQFKORDER_KIND_SALE_PRODUCTS) then
    provResult := TempRQFKOrderController.movePostingToFKForSale(RQFKOrderObj.code)
  else
    provResult := TempRQFKOrderController.movePostingToFK(RQFKOrderObj.code , 1);


  ClearGrid(sgFKOrderProvs);
  ClearGrid(sgFKProvErrorsDetailed);

  if provResult <> nil then
    if provResult.partId = LOW_INT then
    begin
      changeGridDescription(true);

      if High(provResult.badProvList.list) > -1 then
        sgFKOrderProvs.RowCount := High(provResult.badProvList.list) + 2
      else
        sgFKOrderProvs.RowCount := 2;

      with sgFKOrderProvs do
        for i := 0 to High(provResult.badProvList.list) do
        begin
          if provResult.badProvList.list[i].id <> Low(Integer) then
            Cells[0,i+1] := IntToStr(provResult.badProvList.list[i].id)
          else
            Cells[0,i+1] := '';
          if provResult.badProvList.list[i].dt_prov = nil then
            Cells[1,i+1] := ''
          else
            Cells[1,i+1] := XSDate2String(provResult.badProvList.list[i].dt_prov);
          Cells[2,i+1] := provResult.badProvList.list[i].bal_ceh;
          Cells[3,i+1] := provResult.badProvList.list[i].bal_sch;
          Cells[4,i+1] := provResult.badProvList.list[i].bal_sub_sch;
          Cells[5,i+1] := provResult.badProvList.list[i].bal_kau;
          Cells[6,i+1] := provResult.badProvList.list[i].kor_ceh;
          Cells[7,i+1] := provResult.badProvList.list[i].kor_sch;
          Cells[8,i+1] := provResult.badProvList.list[i].kor_sub_sch;
          Cells[9,i+1] := provResult.badProvList.list[i].kor_kau;
          if provResult.badProvList.list[i].summa = nil then
            Cells[10,i+1] := ''
          else
            Cells[10,i+1] := provResult.badProvList.list[i].summa.DecimalString;
          Cells[11,i+1] := provResult.badProvList.list[i].primechan;

        end; // for i := 0 to High(provResult.badProvList.list)

        sgFKOrderProvsClick(Sender);
    end // if provResult.partId = LOW_INT
    else begin
      changeGridDescription(false);
      getFKOrderPostingsList(RQFKOrderObj.code);

      Application.MessageBox(PChar('Документи проведено! Код пачки проводок: ' + IntToStr(provResult.partId)),
                             PChar('Інформація'), MB_ICONINFORMATION);
    end; // else

  getStatus(RQFKOrderObj.code);

//  ShowMessage('FINISHED !!! ' + IntToStr(provResult.partId));

  getPostingsListAx(RQFKOrderObj.code);

end;

procedure TfrmRQFKOrderEdit.changeGridDescription(isError: Boolean);
begin
  if not isError then
  begin
    gbFKOrderPostings.Caption := 'Список проводок';
    gbFKOrderPostings.Font.Color := clWindowText;
  end
  else begin
    gbFKOrderPostings.Caption := 'Список ошибочных проводок';
    gbFKOrderPostings.Font.Color := clRed;
  end;

  sgFKProvErrorsDetailed.Visible := isError;
end;

procedure TfrmRQFKOrderEdit.sgFKOrderProvsClick(Sender: TObject);
var provId, i, j: Integer;
begin
  ClearGrid(sgFKProvErrorsDetailed);

  try
    provId := StrToInt(sgFKOrderProvs.Cells[0, sgFKOrderProvs.Row]);
  except
    on EConvertError do Exit;
  end;

  if provResult = nil then Exit;
  if provResult.partId > LOW_INT then Exit;

  for i := 0 to High(provResult.badProvList.list) do
  begin
    if provResult.badProvList.list[i].id = provId then
    begin
      if High(provResult.badProvList.list[i].detailedList.list) > -1 then
        sgFKProvErrorsDetailed.RowCount := High(provResult.badProvList.list[i].detailedList.list) + 2
      else
        sgFKProvErrorsDetailed.RowCount := 2;

      with sgFKProvErrorsDetailed do
        for j := 0 to High(provResult.badProvList.list[i].detailedList.list) do
        begin
          if provResult.badProvList.list[i].detailedList.list[j].prov_id <> Low(Integer) then
            Cells[0,j+1] := IntToStr(provResult.badProvList.list[i].detailedList.list[j].prov_id)
          else
            Cells[0,j+1] := '';
          Cells[1,j+1] := provResult.badProvList.list[i].detailedList.list[j].err_mes;
        end;

      break;
    end;
  end;

end;

procedure TfrmRQFKOrderEdit.btnChangeDatePostingClick(Sender: TObject);
var TempRQFKOrderController: RQFKOrderControllerSoapPort;
begin
  if RQFKOrderObj = nil then Exit;
  if RQFKOrderObj.code = LOW_INT then Exit;

  if Application.MessageBox(PChar('Ви дійсно бажаєте змінити дату проведення документа?'),
          PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
  Exit;

  TempRQFKOrderController := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

  if (not NoBlankValues([edtDatePosting])) then
  begin
    Application.MessageBox(PChar('Вкажіть дату!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
    Exit;
  end else
  begin
    RQFKOrderObj.datePosting := TXSDate.Create;
    RQFKOrderObj.datePosting.XSToNative(GetXSDate(edtDatePosting.DateTime));
    TempRQFKOrderController.changeDatePosting(RQFKOrderObj);
  end;

  getStatus(RQFKOrderObj.code);
  
end;


procedure TfrmRQFKOrderEdit.btnChangeDatePostingsClick(Sender: TObject);
var TempRQFKOrderController: RQFKOrderControllerSoapPort;
begin
  if RQFKOrderObj = nil then Exit;
  if RQFKOrderObj.code = LOW_INT then Exit;

  if Application.MessageBox(PChar('Ви дійсно бажаєте змінити дату проведення документа?'),
          PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
  Exit;

  TempRQFKOrderController := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

  if (not NoBlankValues([edtDatePostings])) then
  begin
    Application.MessageBox(PChar('Вкажіть дату!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
    Exit;
  end else
  begin
    RQFKOrderObj.datePosting := TXSDate.Create;
    RQFKOrderObj.datePosting.XSToNative(GetXSDate(edtDatePostings.DateTime));
    TempRQFKOrderController.changeDatePosting(RQFKOrderObj);
  end;

  RefreshRQFKOrder;
  Application.MessageBox(PChar('Дату проведення успішно змінено!'), PChar('Повідомлення'), MB_ICONINFORMATION);
end;

procedure TfrmRQFKOrderEdit.btnPrintOrderTwoUnitsClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;

begin
   SetLength(argNames, 1);
   SetLength(args, 1);

   argnames[0] := 'orderCode';
   args[0] := IntToStr( RQFKOrderObj.code );

   if RQFKOrderObj.kind.code in [RQFKORDER_KIND_RASHOD_OE2REM] then
      begin
          reportName := 'RepOrder/RQFKOrder/RQFKOrderOutTwoUnits';
          makeReport(reportName, argNames, args, 'xls');
      end ;

end;

procedure TfrmRQFKOrderEdit.spbDepartmentClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.code := 1;

   frmENDepartmentShow := TfrmENDepartmentShow.Create(Application,fmNormal, f);

   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
        if ShowModal = mrOk then
        begin
            try
               if RQFKOrder2FinObj = nil then
               begin
                 RQFKOrder2FinObj := RQFKOrder2FinServices.Create;
                 RQFKOrder2FinObj.code := LOW_INT;
               end;

               if RQFKOrder2FinObj.departmentRef = nil then RQFKOrder2FinObj.departmentRef := ENDepartmentRef.Create();
               RQFKOrder2FinObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtDepartment.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmRQFKOrderEdit.spbDescriptionClick(Sender: TObject);
var
   frmRQFKBSDescriptionShow : TfrmRQFKBSDescriptionShow;
   f : RQFKBSDescriptionFilter;
begin
   f := RQFKBSDescriptionFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);

   frmRQFKBSDescriptionShow := TfrmRQFKBSDescriptionShow.Create(Application, fmNormal, f);
   DisableActions([frmRQFKBSDescriptionShow.actInsert, frmRQFKBSDescriptionShow.actEdit,
        frmRQFKBSDescriptionShow.actDelete, frmRQFKBSDescriptionShow.actView], true);

   try
      with frmRQFKBSDescriptionShow do
        if ShowModal = mrOk then
        begin
            try
                edtDescription.Text := GetReturnValue(sgRQFKBSDescription, 1);

                if RQFKOrder2FinObj = nil then
                begin
                  RQFKOrder2FinObj := RQFKOrder2FinServices.Create;
                  RQFKOrder2FinObj.code := LOW_INT;
                end;

                RQFKOrder2FinObj.descriptionRef := RQFKBSDescriptionRef.Create;
                RQFKOrder2FinObj.descriptionRef.code := StrToInt(GetReturnValue(sgRQFKBSDescription, 0));

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQFKBSDescriptionShow.Free;
   end;
end;

procedure TfrmRQFKOrderEdit.spbDepartmentClearClick(Sender: TObject);
begin
  inherited;
     edtDepartment.Text := '';
     RQFKOrder2FinObj.departmentRef := nil;
end;


procedure TfrmRQFKOrderEdit.actRemoveFromTransportRoutesExecute(
  Sender: TObject);
var TempRQFKOrderController: RQFKOrderControllerSoapPort;
begin
  if RQFKOrderObj = nil then Exit;
  if RQFKOrderObj.code = LOW_INT then Exit;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити цю накладну з усіх маршрутів?'),
          PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
  Exit;

  TempRQFKOrderController := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  TempRQFKOrderController.removeFromTransportRoutes(RQFKOrderObj.code);

  Application.MessageBox(PChar('Накладну видалено з маршрутів!'),
          PChar('Інформація'), MB_ICONINFORMATION);
end;


procedure TfrmRQFKOrderEdit.spbTaxBookClick(Sender: TObject);
var
   frmBookKindShow : TfrmBookKindShow;
begin
   frmBookKindShow := TfrmBookKindShow.Create(Application, fmNormal);
   DisableActions([frmBookKindShow.actInsert, frmBookKindShow.actEdit,
        frmBookKindShow.actDelete, frmBookKindShow.actView], true);
   try
      with frmBookKindShow do
        if ShowModal = mrOk then
        begin
            try
                edtTaxBookId.Text := GetReturnValue(sgBookKind, 1);
                edtTaxBook.Text := GetReturnValue(sgBookKind, 2);

                if RQFKOrder2FinObj = nil then
                begin
                  RQFKOrder2FinObj := RQFKOrder2FinServices.Create;
                  RQFKOrder2FinObj.code := LOW_INT;
                end;

                RQFKOrder2FinObj.taxBookId := StrToInt(GetReturnValue(sgBookKind, 1));
                RQFKOrder2FinObj.taxBook := edtTaxBook.Text;
                RQFKOrder2FinObj.taxBookSymb := GetReturnValue(sgBookKind, 3);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmBookKindShow.Free;
   end;
end;


procedure TfrmRQFKOrderEdit.spbTaxBookClearClick(Sender: TObject);
begin
  if RQFKOrder2FinObj = nil then RQFKOrder2FinObj := RQFKOrder2FinServices.Create;
  edtTaxBookId.Text := '';
  edtTaxBook.Text := '';
  RQFKOrder2FinObj.taxBookId := LOW_INT;
  RQFKOrder2FinObj.taxBook := '';
  RQFKOrder2FinObj.taxBookSymb := '';
end;

procedure TfrmRQFKOrderEdit.spbCostItemClick(Sender: TObject);
var
   frmExpenseItemShow : TfrmExpenseItemShow;
begin
   frmExpenseItemShow := TfrmExpenseItemShow.Create(Application, fmNormal);
   DisableActions([frmExpenseItemShow.actInsert, frmExpenseItemShow.actEdit,
        frmExpenseItemShow.actDelete, frmExpenseItemShow.actView], true);
   try
      with frmExpenseItemShow do
        if ShowModal = mrOk then
        begin
            try
                edtCostItemId.Text := GetReturnValue(sgExpenseItem, 0);
                edtCostItem.Text := GetReturnValue(sgExpenseItem, 1);

                if RQFKOrder2FinObj = nil then
                begin
                  RQFKOrder2FinObj := RQFKOrder2FinServices.Create;
                  RQFKOrder2FinObj.code := LOW_INT;
                end;

                RQFKOrder2FinObj.costItemId := StrToInt(GetReturnValue(sgExpenseItem, 0));
                RQFKOrder2FinObj.costItem := edtCostItem.Text;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmExpenseItemShow.Free;
   end;
end;

procedure TfrmRQFKOrderEdit.spbCostItemClearClick(Sender: TObject);
begin
  edtCostItemId.Text := '';
  edtCostItem.Text := '';
  RQFKOrder2FinObj.costItemId := LOW_INT;
  RQFKOrder2FinObj.costItem := '';
end;

procedure TfrmRQFKOrderEdit.spbTaxRateClick(Sender: TObject);
var
   frmTrade_TaxWageShow : TfrmTrade_TaxWageShow;
begin
   frmTrade_TaxWageShow := TfrmTrade_TaxWageShow.Create(Application, fmNormal);
   DisableActions([frmTrade_TaxWageShow.actInsert, frmTrade_TaxWageShow.actEdit,
        frmTrade_TaxWageShow.actDelete, frmTrade_TaxWageShow.actView], true);
   try
      with frmTrade_TaxWageShow do
        if ShowModal = mrOk then
        begin
            try
                edtTaxRateId.Text := GetReturnValue(sgTrade_TaxWage, 0);
                edtTaxRateName.Text := GetReturnValue(sgTrade_TaxWage, 1);
                edtTaxRate.Text := GetReturnValue(sgTrade_TaxWage, 2);

                if RQFKOrder2FinObj = nil then
                begin
                  RQFKOrder2FinObj := RQFKOrder2FinServices.Create;
                  RQFKOrder2FinObj.code := LOW_INT;
                end;

                RQFKOrder2FinObj.taxRateId := StrToInt(GetReturnValue(sgTrade_TaxWage, 0));
                RQFKOrder2FinObj.taxRateName := edtTaxRateName.Text;
                RQFKOrder2FinObj.taxRate := StrToInt(GetReturnValue(sgTrade_TaxWage, 2));        
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTrade_TaxWageShow.Free;
   end;
end;

procedure TfrmRQFKOrderEdit.spbTaxRateClearClick(Sender: TObject);
begin
  edtTaxRate.Text := '';
  edtTaxRateName.Text := '';
  edtTaxRateId.Text := '';
  RQFKOrder2FinObj.taxRateId := LOW_INT;
  RQFKOrder2FinObj.taxRate := LOW_INT;
  RQFKOrder2FinObj.taxRateName := '';
end;


procedure TfrmRQFKOrderEdit.spbAccountingGroupClick(Sender: TObject);
var
   frmAcc_Obj_TypesShow : TfrmAcc_Obj_TypesShow;
begin
   frmAcc_Obj_TypesShow := TfrmAcc_Obj_TypesShow.Create(Application, fmNormal);
   DisableActions([frmAcc_Obj_TypesShow.actInsert, frmAcc_Obj_TypesShow.actEdit,
        frmAcc_Obj_TypesShow.actDelete, frmAcc_Obj_TypesShow.actView], true);
   try
      with frmAcc_Obj_TypesShow do
        if ShowModal = mrOk then
        begin
            try
                edtAccountingGroupId.Text := GetReturnValue(sgAcc_Obj_Types, 1);
                edtAccountingGroup.Text := GetReturnValue(sgAcc_Obj_Types, 2);

                if RQFKOrder2FinObj = nil then
                begin
                  RQFKOrder2FinObj := RQFKOrder2FinServices.Create;
                  RQFKOrder2FinObj.code := LOW_INT;
                end;

                RQFKOrder2FinObj.accountingGroupId := StrToInt(GetReturnValue(sgAcc_Obj_Types, 1));
                RQFKOrder2FinObj.accountingGroup := edtAccountingGroup.Text;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmAcc_Obj_TypesShow.Free;
   end;
end;

procedure TfrmRQFKOrderEdit.spbAssetObjectClearClick(Sender: TObject);
begin
  inherited;
   RQFKOrder2FinObj.assetNumAX := '';
   RQFKOrder2FinObj.assetDescriptionAX := '';
   edtAssetAccount.Text:= '';
   edtAssetName.Text:= '';
end;

procedure TfrmRQFKOrderEdit.spbAssetObjectClick(Sender: TObject);
var
   frmAXRassetTableShow : TfrmAXRassetTableShow;
   f : AXRassetTableFilter;
begin
  inherited;
  f := AXRassetTableFilter.Create();
  SetNullXSProps(f);
  SetNullIntProps(f);
  f.assetGroup := '151*';  // группа ОС
  f.status := MDAX_ASSET_STATUS_NOACQUISITION;  // выбор запланированных ОС

  frmAXRassetTableShow := TfrmAXRassetTableShow.Create(Application, fmNormal, f);
  DisableActions([frmAXRassetTableShow.actInsert,
   frmAXRassetTableShow.actDelete,
   frmAXRassetTableShow.actEdit,
   frmAXRassetTableShow.actUpdate,
 //  frmAXRassetTableShow.actFilter,
   frmAXRassetTableShow.actNoFilter]);

  try
    with frmAXRassetTableShow do
      if ShowModal = mrOk then
      begin
        try
          edtAssetAccount.Text := GetReturnValue(sgAXRassetTable, 1);
          edtAssetName.Text := GetReturnValue(sgAXRassetTable, 2);
          if RQFKOrder2FinObj = nil then
                begin
                  RQFKOrder2FinObj := RQFKOrder2FinServices.Create;
                  RQFKOrder2FinObj.code := LOW_INT;
                end;

          RQFKOrder2FinObj.assetNumAX := edtAssetAccount.Text;
          RQFKOrder2FinObj.assetDescriptionAX := edtAssetName.Text;
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmAXRassetTableShow.Free;
  end;
end;

procedure TfrmRQFKOrderEdit.spbAccountingGroupClearClick(Sender: TObject);
begin
  edtAccountingGroupId.Text := '';
  edtAccountingGroup.Text := '';
  RQFKOrder2FinObj.accountingGroupId := LOW_INT;
  RQFKOrder2FinObj.accountingGroup := '';
end;

procedure TfrmRQFKOrderEdit.cbIsTransferTaxClick(Sender: TObject);
begin
 if (cbIsTransferTax.Checked = False) then
     cbTaxDocType.ItemIndex := -1;
end;

procedure TfrmRQFKOrderEdit.spbGeoDepartmentClick(Sender: TObject);
var
  frmENGeographicDepartmentShow: TfrmENGeographicDepartmentShow;
begin
  frmENGeographicDepartmentShow := TfrmENGeographicDepartmentShow.Create(Application, fmNormal);
  try
    frmENGeographicDepartmentShow.DisableActions([frmENGeographicDepartmentShow.actInsert,
                                                  frmENGeographicDepartmentShow.actDelete,
                                                  frmENGeographicDepartmentShow.actEdit]);
    with frmENGeographicDepartmentShow do
    begin
      if ShowModal = mrOk then
      begin
        try
          RQFKOrderObj.geoDepartmentRef := ENGeographicDepartmentRef.Create;
          RQFKOrderObj.geoDepartmentRef.code := StrToInt(GetReturnValue(sgENGeographicDepartment, 0));
          edtGeoDepartment.Text := GetReturnValue(sgENGeographicDepartment, 1);
        except
           on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENGeographicDepartmentShow.Free;
  end;
end;

procedure TfrmRQFKOrderEdit.spbGetTaxNumberClick(Sender: TObject);
var
  TempRQFKOrderController: RQFKOrderControllerSoapPort;
  taxNumber : string;
begin
    if ((edtTaxBook.Text = '') and (not edtTaxInvoiceDateGen.Checked)) then
    begin
      Application.MessageBox(PChar('Для отримання номеру вкажіть дату та оберіть книгу!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
      Exit;
    end else
    begin
      RQFKOrder2FinObj.taxInvoiceDateGen := TXSDate.Create;
      RQFKOrder2FinObj.taxInvoiceDateGen.XSToNative(GetXSDate(edtTaxInvoiceDateGen.DateTime));

      TempRQFKOrderController := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
      taxNumber := TempRQFKOrderController.getFinTaxNumber(RQFKOrder2FinObj.taxInvoiceDateGen);
      edtTaxInvoiceNumber.Text := taxNumber+'/'+RQFKOrder2FinObj.taxBookSymb;
    end;

end;

procedure TfrmRQFKOrderEdit.spbRQStorageClick(Sender: TObject);
var
   frmRQStorageShow : TfrmRQStorageShow;
begin
   frmRQStorageShow := TfrmRQStorageShow.Create(Application,fmNormal);
   try
      with frmRQStorageShow do
        if ShowModal = mrOk then
        begin
            try
               if RQFKOrderObj.storageRef = nil then RQFKOrderObj.storageRef := RQStorageRef.Create();
               RQFKOrderObj.storageRef.code := StrToInt(GetReturnValue(sgRQStorage,0));
               edtRQStorage.Text := GetReturnValue(sgRQStorage,1);

               // При изменении склада на ордере скинем МОЛов, потому что они связаны со складом!!!
              edtMolInCode.Text := '';
              edtMolInName.Text := '';
              edtMolOutCode.Text := '';
              edtMolOutName.Text := '';
              RQFKOrderObj.molInCode := '';
              RQFKOrderObj.molInName := '';
              RQFKOrderObj.molOutCode := '';
              RQFKOrderObj.molOutName := '';

              isStorageOrMOLChanged := true;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQStorageShow.Free;
   end;
end;

procedure TfrmRQFKOrderEdit.cbTKAccountingTypeChange(Sender: TObject);
begin

  if (isRQFKOrderForStorage(RQFKOrderObj))
       and (cbTKAccountingType.ItemIndex + 1 in
       [TK_ACCOUNTINGTYPE_TMC, TK_ACCOUNTINGTYPE_COUNTER,
        TK_ACCOUNTINGTYPE_SEAL, TK_ACCOUNTINGTYPE_IMP, TK_ACCOUNTINGTYPE_HOLO]) then
  begin
    HideControls([lblRQStorage, edtRQStorage, spbRQStorage], False);
    lblMolCode.Top := 48;
    lblMolName.Top := 48;
    lblENDepartmentDepartmentName.Top := 48;
    edtMolOutCode.Top := 45;
    spbPlanMOL.Top := 45;
    edtMolOutName.Top := 45;
    edtENDepartmentDepartmentName.Top := 45;
    spbENDepartmentDepartment.Top := 45;

    lblGeoDepartment.Top := 44;
    edtGeoDepartment.Top := 45;
    spbGeoDepartment.Top := 45;

    gbMOLOut.Height := 76;
    edtMolOutCode.Text := '';
    edtMolOutName.Text := '';
    edtRQStorage.Text := '';
    RQFKOrderObj.molOutCode := '';
    RQFKOrderObj.molOutName := '';
    RQFKOrderObj.storageRef := nil;
  end else
  begin
    HideControls([lblRQStorage, edtRQStorage, spbRQStorage], True);
    lblMolCode.Top := 19;
    lblMolName.Top := 19;
    lblENDepartmentDepartmentName.Top := 19;
    edtMolOutCode.Top := 15;
    spbPlanMOL.Top := 15;
    edtMolOutName.Top := 15;
    edtENDepartmentDepartmentName.Top := 15;
    spbENDepartmentDepartment.Top := 15;

    lblGeoDepartment.Top := 15;
    edtGeoDepartment.Top := 15;
    spbGeoDepartment.Top := 15;

    gbMOLOut.Height := 50;
    edtMolOutCode.Text := '';
    edtMolOutName.Text := '';
    edtRQStorage.Text := '';
    RQFKOrderObj.molOutCode := '';
    RQFKOrderObj.molOutName := '';
    RQFKOrderObj.storageRef := nil;
  end;

  RQFKOrderObj.molOutCode := '';
  RQFKOrderObj.molOutName := '';
  ClearControls([edtMolOutCode, edtMolOutName]);

  if RQFKOrderObj.accountingTypeRef = nil then
    RQFKOrderObj.accountingTypeRef := TKAccountingTypeRef.Create;
  RQFKOrderObj.accountingTypeRef.code := cbTKAccountingType.ItemIndex + 1;

  initDFDocsTab;
end;

(*
procedure TfrmRQFKOrderEdit.actEditOSDataExecute(Sender: TObject);
Var TempRQFKOrderItem2OSData: RQFKOrderItem2OSDataControllerSoapPort;
    TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
    itemCode: Integer;
    osDataFilter: RQFKOrderItem2OSDataFilter;
    osDataList: RQFKOrderItem2OSDataShortList;
    itemObj: RQFKOrderItem;
begin
  try
    itemCode := StrToInt(sgRQFKOrderItem.Cells[0, sgRQFKOrderItem.Row]);
    TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
    itemObj := TempRQFKOrderItem.getObject(itemCode);
  except
    on EConvertError do Exit;
  end;

  frmOSDataEdit := TfrmOSDataEdit.Create(Application, dsEdit);
  try
    frmOSDataEdit.OSData := nil;
    frmOSDataEdit.orderStatusCode := RQFKOrderObj.status.code;
    if itemObj.sumWithoutNds <> nil then
      frmOSDataEdit.sumWithoutNds := itemObj.sumWithoutNds.DecimalString
    else
      frmOSDataEdit.sumWithoutNds := '';

    osDataFilter := RQFKOrderItem2OSDataFilter.Create;
    SetNullIntProps(osDataFilter);
    SetNullXSProps(osDataFilter);

    osDataFilter.fkOrderItemRef := RQFKOrderItemRef.Create;
    osDataFilter.fkOrderItemRef.code := itemCode;

    TempRQFKOrderItem2OSData := HTTPRIORQFKOrderItem2OSData as RQFKOrderItem2OSDataControllerSoapPort;

    osDataList := TempRQFKOrderItem2OSData.getScrollableFilteredList(osDataFilter, 0, -1);
    if osDataList.totalCount > 0 then
    begin
      if osDataList.list[0] <> nil then
        if osDataList.list[0].code > LOW_INT then
          frmOSDataEdit.OSData := TempRQFKOrderItem2OSData.getObject(osDataList.list[0].code);
    end
    else
      frmOSDataEdit.OSData := nil;

    frmOSDataEdit.ShowModal;
  finally
    frmOSDataEdit.Free;
  end;

end;
*)

procedure TfrmRQFKOrderEdit.actEditOSDataExecute(Sender: TObject);
Var TempRQFKOrderItem2OSData: RQFKOrderItem2OSDataControllerSoapPort;
    TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
    TempRQFKOrder: RQFKOrderControllerSoapPort;
    //itemCode: Integer;
    osDataFilter: RQFKOrderItem2OSDataFilter;
    osDataList: RQFKOrderItem2OSDataShortList;
    itemObj: RQFKOrderItem;
    i, arrLength, num_un: Integer;
    //itemCodesArr: RQFKOrderItem2OSDataController.ArrayOfInteger;
    state, isSel: Boolean;
    buhDate: TXSDate;
begin
  state := false;
  isSel := false;

  for i := 1 to sgRQFKOrderItem.RowCount - 1 do
  begin
    sgRQFKOrderItem.GetCheckBoxState(1, i, state);
    if state then
    begin
      isSel := true;
      break;
    end;
  end;

  if not isSel then
  begin
    Application.MessageBox(PChar('Виберіть хоча б одну строку !'), PChar('Увага !'), MB_ICONWARNING);
    Exit;
  end;

  {
  if Application.MessageBox(PChar('Ви дійсно бажаєте змінити бух. дані для ВСІХ обраних строк ордеру?'),
                            PChar('Увага !'),
                            MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;
  }
  //TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
  //TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;



  TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;

  frmOSDataEdit := TfrmOSDataEdit.Create(Application, dsEdit);
  try
    for i := 1 to sgRQFKOrderItem.RowCount - 1 do
    begin
      sgRQFKOrderItem.GetCheckBoxState(1, i, state);
      if state then
      begin
        try
          arrLength := High(frmOSDataEdit.itemCodesArr) + 1;
          SetLength(frmOSDataEdit.itemCodesArr, arrLength + 1);
          frmOSDataEdit.itemCodesArr[arrLength] := StrToInt(sgRQFKOrderItem.Cells[0, i]);
          //itemObj := TempRQFKOrderItem.getObject(itemCode);
          //planWorkItemObj := TempENPlanWorkItem.getObject(StrToInt(sgENPlanWorkItem.Cells[0, i]));

          frmOSDataEdit.num_un := Integer(sgRQFKOrderItem.Objects[1, i]);
        except
          on EConvertError do Exit;
        end;
      end;
    end;

    if High(frmOSDataEdit.itemCodesArr) = -1 then
    begin
      Application.MessageBox(PChar('Виберіть хоча б одну строку !'), PChar('Увага !'), MB_ICONWARNING);
      Exit;
    end;

    frmOSDataEdit.OSData := nil;

    frmOSDataEdit.orderStatusCode := RQFKOrderObj.status.code;
    frmOSDataEdit.orderKindCode := RQFKOrderObj.kind.code;

    itemObj := TempRQFKOrderItem.getObject(frmOSDataEdit.itemCodesArr[0]);

    if itemObj.sumWithoutNds <> nil then
      frmOSDataEdit.sumWithoutNds := itemObj.sumWithoutNds.DecimalString
    else
      frmOSDataEdit.sumWithoutNds := '';

    /////
    TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

    buhDate := TempRQFKOrder.getCurrentBuhDate();

    if buhDate <> nil then
      frmOSDataEdit.buhDate := DateToStr(EncodeDate(buhDate.Year, buhDate.Month, buhDate.Day));
    /////

    osDataFilter := RQFKOrderItem2OSDataFilter.Create;
    SetNullIntProps(osDataFilter);
    SetNullXSProps(osDataFilter);

    osDataFilter.fkOrderItemRef := RQFKOrderItemRef.Create;
    osDataFilter.fkOrderItemRef.code := frmOSDataEdit.itemCodesArr[0];

    TempRQFKOrderItem2OSData := HTTPRIORQFKOrderItem2OSData as RQFKOrderItem2OSDataControllerSoapPort;

    osDataList := TempRQFKOrderItem2OSData.getScrollableFilteredList(osDataFilter, 0, -1);
    if osDataList.totalCount > 0 then
    begin
      if osDataList.list[0] <> nil then
        if osDataList.list[0].code > LOW_INT then
          frmOSDataEdit.OSData := TempRQFKOrderItem2OSData.getObject(osDataList.list[0].code);
    end
    else
      frmOSDataEdit.OSData := nil;

    frmOSDataEdit.ShowModal;
  finally
    frmOSDataEdit.Free;
  end;
end;


procedure TfrmRQFKOrderEdit.actViewOSDataExecute(Sender: TObject);
Var TempRQFKOrderItem2OSData: RQFKOrderItem2OSDataControllerSoapPort;
    itemCode: Integer;
    osDataFilter: RQFKOrderItem2OSDataFilter;
    osDataList: RQFKOrderItem2OSDataShortList;
begin
  try
    itemCode := StrToInt(sgRQFKOrderItem.Cells[0,sgRQFKOrderItem.Row]);
  except
    on EConvertError do Exit;
  end;

  frmOSDataEdit := TfrmOSDataEdit.Create(Application, dsView);
  try
    frmOSDataEdit.OSData := nil;

    frmOSDataEdit.orderStatusCode := RQFKOrderObj.status.code;
    frmOSDataEdit.orderKindCode := RQFKOrderObj.kind.code;

    osDataFilter := RQFKOrderItem2OSDataFilter.Create;
    SetNullIntProps(osDataFilter);
    SetNullXSProps(osDataFilter);

    osDataFilter.fkOrderItemRef := RQFKOrderItemRef.Create;
    osDataFilter.fkOrderItemRef.code := itemCode;

    TempRQFKOrderItem2OSData := HTTPRIORQFKOrderItem2OSData as RQFKOrderItem2OSDataControllerSoapPort;

    osDataList := TempRQFKOrderItem2OSData.getScrollableFilteredList(osDataFilter, 0, -1);
    if osDataList.totalCount > 0 then
    begin
      if osDataList.list[0] <> nil then
        if osDataList.list[0].code > LOW_INT then
          frmOSDataEdit.OSData := TempRQFKOrderItem2OSData.getObject(osDataList.list[0].code);
    end
    else
      frmOSDataEdit.OSData := nil;

    frmOSDataEdit.ShowModal;
  finally
    frmOSDataEdit.Free;
  end;
end;

procedure TfrmRQFKOrderEdit.actSelectAllExecute(Sender: TObject);
begin
  CheckGrid(sgRQFKOrderItem, 1, true);
  RecalcOSLines();
end;

procedure TfrmRQFKOrderEdit.actSetSealInfoExecute(Sender: TObject);
Var TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
begin
 frmSealInfo :=TfrmSealInfo.Create(Application, dsEdit);
  try

      TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
      try
         frmSealInfo.RQFKOIObj := TempRQFKOrderItem.getObject(StrToInt(sgRQFKOrderItem.Cells[0,sgRQFKOrderItem.Row]));
         frmSealInfo.fkOrderObj := RQFKOrderObj;
       except
       on EConvertError do Exit;
      end;

    if frmSealInfo.ShowModal = mrOk then
      begin
        UpdateGrid(Sender);
      end;

  finally
    frmSealInfo.Free;
    frmSealInfo:=nil;
  end;

  actUpdateExecute(Sender);
end;

procedure TfrmRQFKOrderEdit.actClearAllExecute(Sender: TObject);
begin
  CheckGrid(sgRQFKOrderItem, 1, false);
  RecalcOSLines();
end;

procedure TfrmRQFKOrderEdit.actClearDFDocSignersExecute(Sender: TObject);
begin
  if DialogState = dsView then Exit;

  initDFDocSignersGrid(false);
end;

procedure TfrmRQFKOrderEdit.RecalcOSLines();
var i: Integer;
    vState: Boolean;
    totalOSSum, totalOSCount, vOSSum, vOSCount: Double;
begin
  vState := false;
  totalOSSum := 0;
  totalOSCount := 0;

  for i := 1 to sgRQFKOrderItem.RowCount - 1 do
  begin
    sgRQFKOrderItem.GetCheckBoxState(1, i, vState);

    if vState then
    begin
      try
        vOSCount := StrToFloat(sgRQFKOrderItem.Cells[6, i]);
      except
        on EConvertError do vOSCount := 0;
      end;

      try
        vOSSum := StrToFloat(sgRQFKOrderItem.Cells[8, i]);
      except
        on EConvertError do vOSSum := 0;
      end;

      totalOSSum := totalOSSum + vOSSum;
      totalOSCount := totalOSCount + vOSCount;
    end; // if vState

  end; // for i := 1 to sgRQFKOrderItem.RowCount - 1

  pnlOSCount.Caption := SeparateThousands(FloatToStr(totalOSCount));
  pnlOSSum.Caption := SeparateThousands(FloatToStr(totalOSSum));
end;

procedure TfrmRQFKOrderEdit.sgRQFKOrderItemCheckBoxClick(Sender: TObject;
  ACol, ARow: Integer; State: Boolean);
begin
  RecalcOSLines();
end;

procedure TfrmRQFKOrderEdit.chbIsByOrderClick(Sender: TObject);
begin
  edtOrderInfo.Visible := chbIsByOrder.Checked;
  if not chbIsByOrder.Checked then
    edtOrderInfo.Text := '';
end;

procedure TfrmRQFKOrderEdit.chbIsPalletizedClick(Sender: TObject);
begin
  inherited;
  HideControls([edtPalletNumber], (not chbIsPalletized.Checked));
  if (not chbIsPalletized.Checked) then edtPalletNumber.Text := '';
end;

{Возвращает подходит ли расходный ордер для палетного вывоза, True - подходит, False - не подходит }
function TfrmRQFKOrderEdit.isRQFKOrderForPallet(obj : RQFKOrder) : Boolean;
var
output : Boolean;
begin
    if (obj.kind.code in [RQFKORDER_KIND_RASHOD_OE2REM, RQFKORDER_KIND_RASHOD_MNMA]) then
        output := True
    else
        output := False;

    Result := output;
end;

{Возвращает подходит ли ордер для работы с местами хранения, True - подходит, False - не подходит }
function TfrmRQFKOrderEdit.isRQFKOrderForStorage(obj : RQFKOrder) : Boolean;
var
output : Boolean;
begin
    if (obj.kind.code in [RQFKORDER_KIND_RASHOD_TO_STORAGE, RQFKORDER_KIND_PRIHOD_POSTAVKA, RQFKORDER_KIND_ZONE_CHANGING]) then
        output := True
    else
        output := False;

    Result := output;
end;

{Нужно ли жесткие проверки привязки склада на ордере True - подходит, False - не подходит }
function TfrmRQFKOrderEdit.isRQFKOrderForStorageSeriously(obj : RQFKOrder) : Boolean;
var
output : Boolean;
begin
    if (obj.kind.code in [RQFKORDER_KIND_ZONE_CHANGING]) then
        output := True
    else
        output := False;

    Result := output;
end;

function TfrmRQFKOrderEdit.isRQFKOrderFromRQActCounterExpertise(obj : RQFKOrder) : Boolean;
var
TempRQAct : RQActCounterExpertiseControllerSoapPort;
filter : RQActCounterExpertiseFilter;
begin
    TempRQAct := HTTPRIORQActCounterExpertise as RQActCounterExpertiseControllerSoapPort;
    filter := RQActCounterExpertiseFilter.Create;
    filter.fkOrder := RQFKOrderRef.Create;
    SetNullXSProps(filter);
    SetNullIntProps(filter);
    filter.fkOrder.code := RQFKOrderObj.code;
    Result := Length(TempRQAct.getScrollableFilteredCodeArray(filter, 0, 1)) > 0;
end;

procedure TfrmRQFKOrderEdit.loadDFDocSigners;
begin
  DMReports.loadDFDocSigners(RQFKOrderObj, Self, sgDFDocSigners);
end;

procedure TfrmRQFKOrderEdit.initDFDocSignersGrid(setDefaultSigners: Boolean = true);
begin
  DMReports.initDFDocSignersGrid(RQFKOrderObj, Self, sgDFDocSigners, setDefaultSigners);
end;

procedure TfrmRQFKOrderEdit.initDFDocsTab;
begin
  tsDFDoc.TabVisible := false;
  DisableActions([actClearDFDocSigners], DialogState = dsView);

  if RQFKOrderObj = nil then Exit;

  if DMReports.isSignable(RQFKOrderObj) then
  begin
    tsDFDoc.TabVisible := true;
    DMReports.setComponentPropsForDFDocsTab(Self, sgDFDocs, sgDFDocSigners);

    // При добавлении ордера вкладку с подписантами будем отображать
    // только для приходов (для остальных - при редактировании)
    if (DialogState = dsInsert) then
    begin
      if (RQFKOrderObj.kind.code in [RQFKORDER_KIND_PRIHOD_POSTAVKA,
                                     RQFKORDER_KIND_PRIHOD_BUFET]) then
        initDFDocSignersGrid
      else
        tsDFDoc.TabVisible := false;
    end;

    if (DialogState = dsEdit) or (DialogState = dsView) then
      loadDFDocSigners;
  end;
end;

procedure TfrmRQFKOrderEdit.actSaveStorageZoneExecute(Sender: TObject);
var
  i, storageZoneCode : Integer;
  selected : Boolean;
  zoneFilter : RQStorageZoneFilter;
  frmRQStorageZoneShow : TfrmRQStorageZoneShow;
  TempRQFKOrderItem : RQFKOrderItemControllerSoapPort;
  orderItem : RQFKOrderItem;
begin
    if DialogState <> dsEdit then Exit;

    selected := false;

    for i := 1 to sgRQFKOrderItem.RowCount - 1 do
    begin
      sgRQFKOrderItem.GetCheckBoxState(1, i, selected);
      if selected then break;
    end;

    if not selected then // Если не выбрана ни одна строка
    begin
      Application.MessageBox(PChar('Оберіть строки!!!'),
                             PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;

    if (RQFKOrderObj.storageRef = nil) or (RQFKOrderObj.storageRef.code = LOW_INT) then
    begin
      Application.MessageBox(PChar('На ордері не вказано склад!'), PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;

    // Если изменили склад или МОЛа-получателя, нужно вначале пересохранить ордер
    // (потому что при выборе мест хранения на строках, они будут фильтроваться по новому складу/МОЛу)!!!
    if isStorageOrMOLChanged then
    begin
      Application.MessageBox(PChar('Після зміни отримувача потрібно спочатку зберегти ордер!'), PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;

    zoneFilter := RQStorageZoneFilter.Create;
    SetNullIntProps(zoneFilter);
    SetNullXSProps(zoneFilter);

    zoneFilter.conditionSQL :=
      ' rqstoragezone.storagecode = ' + IntToStr(RQFKOrderObj.storageRef.code) +
      ' and rqstoragezone.code in ' +
      ' (select sm.zonerefcode from rqstorage2enmol2zone sm ' +
      '  where sm.molrefcode in ' +
      '    (select m.code from enmol m where m.fincode = ''' + RQFKOrderObj.molOutCode + ''')) ';
    zoneFilter.orderBySQL := 'rqstoragezone.name';

    storageZoneCode := Low_Int;
    frmRQStorageZoneShow := TfrmRQStorageZoneShow.Create(Application, fmNormal, zoneFilter);
    try
      frmRQStorageZoneShow.DisableActions([frmRQStorageZoneShow.actInsert,
                                           frmRQStorageZoneShow.actDelete,
                                           frmRQStorageZoneShow.actEdit]);
      with frmRQStorageZoneShow do
        if ShowModal = mrOk then
        begin
          try
            storageZoneCode := StrToInt(GetReturnValue(sgRQStorageZone, 0));
          except
             on EConvertError do Exit;
          end;
        end;
    finally
      frmRQStorageZoneShow.Free;
    end;


    selected := false;
    for i := 1 to sgRQFKOrderItem.RowCount - 1 do
    begin
      sgRQFKOrderItem.GetCheckBoxState(1, i, selected);

      if selected then
      begin
        TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
        orderItem :=  TempRQFKOrderItem.getObject(StrToInt(sgRQFKOrderItem.Cells[0, i]));

        if orderItem.zoneRef = nil then orderItem.zoneRef := RQStorageZoneRef.Create();
        orderItem.zoneRef.code := storageZoneCode;

        TempRQFKOrderItem.save(orderItem);
      end;

    end;

    UpdateGrid(Sender);
end;
procedure TfrmRQFKOrderEdit.actAddZoneChangingFromOrderExecute(
  Sender: TObject);
var
  TempRQFKOrderItem : RQFKOrderItemControllerSoapPort;
  TempRQFKOrder : RQFKOrderControllerSoapPort;
  frmRQFKOrderShow : TfrmRQFKOrderShow;
  frmRQFKOrderKindShow : TfrmRQFKOrderKindShow;
  orderFilter : RQFKOrderFilter;
  orderKindFilter : RQFKOrderKindFilter;
  orderKind : Integer;
  orderFromCode : Integer;
  orderFrom : RQFKOrder;
  strNumber : String;
begin
  inherited;
  TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

  orderKindFilter := RQFKOrderKindFilter.Create;
  SetNullXSProps(orderKindFilter);
  SetNullIntProps(orderKindFilter);
  orderKindFilter.conditionSQL := ' RQFKORDERKIND.CODE IN (' + IntToStr(RQFKORDER_KIND_RASHOD_TO_STORAGE) + ', ' + IntToStr(RQFKORDER_KIND_RASHOD_OE2REM) + ')';
  


  orderKind := LOW_INT;

    frmRQFKOrderKindShow := TfrmRQFKOrderKindShow.Create(Application, fmNormal, orderKindFilter);
  try
    with frmRQFKOrderKindShow do begin
      DisableActions([ActEdit, ActUpdate, actInsert, actDelete,actView,actFilter,actNoFilter]);
      if ShowModal = mrOk then
      begin
        try
          orderKind := StrToInt(GetReturnValue(sgRQFKOrderKind,0));
        except
        on EConvertError do Exit;
        end;
    end;
    end;
  finally
  end;
  {Если не выбран вид ордера - то процедура покидается}
  if orderKind = Low(Integer) then Exit;

  orderFromCode := LOW_INT;

  orderFilter := RQFKOrderFilter.Create;
  SetNullXSProps(orderFilter);
  SetNullIntProps(orderFilter);
  orderFilter.kind := RQFKOrderKind.Create;
  orderFilter.kind.code := orderKind;

  frmRQFKOrderShow := TfrmRQFKOrderShow.Create(Application, fmNormal, orderFilter);
  try
    with frmRQFKOrderShow do begin
      DisableActions([ActEdit, ActUpdate, actInsert, actDelete]);
      if ShowModal = mrOk then
      begin
        try
          orderFromCode := StrToInt(GetReturnValue(sgRQFKOrder,0));
        except
        on EConvertError do Exit;
        end;
    end;
    end;
  finally
  end;
  {Если не выбран ордер - то процедура покидается}
  if orderFromCode = Low(Integer) then Exit;
  orderFrom := TempRQFKOrder.getObject(orderFromCode);
  strNumber := orderFrom.numberDoc;
    if Application.MessageBox(PChar('Ви дійсно бажаєте додати строки з ордеру № ' + strNumber + '?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin

      TempRQFKOrderItem.addZoneChangingFromOrder(RQFKOrderObj.code, orderFromCode);

      actUpdateExecute(Sender);
    end;

end;

procedure TfrmRQFKOrderEdit.PopupMenu1Popup(Sender: TObject);
begin
  inherited;

  if (RQFKOrderObj.kind.code <> RQFKORDER_KIND_ZONE_CHANGING) or (DialogState = dsView) then
  begin
    actAddZoneChangingFromOrder.Visible := false;
    actAddZoneChangingFromOrder.Enabled := false;
  end;
end;

procedure TfrmRQFKOrderEdit.printOrder;
var
  argNames, args: ArrayOfString;
  reportName: String;
  reportXlsOrPdf : String;

  TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
  RQFKOrderItemList: RQFKOrderItemShortList;
  RQFKOrderItemFilterObj : RQFKOrderItemFilter;
  i, brr, docCode: Integer;
  isBrigadeZZ : Boolean;

  TempRQFKOrder: RQFKOrderControllerSoapPort;
  buhDate, datePosting: TXSDate;
  tmpBuhDate, tmpDatePosting: TDate;
  tmpRQFKOrderObj: RQFKOrder;

  TempRQFKOrderItem2OSData: RQFKOrderItem2OSDataControllerSoapPort;

  TempSCOrder : SCOrderControllerSoapPort;
  scOrdFilter : SCOrderFilter;
  scOrdList : SCOrderShortList;

  osDataFilter: RQFKOrderItem2OSDataFilter;
  osDataList: RQFKOrderItem2OSDataShortList;
  debetAccount: String;

  reportsList: ArrayOfEPReportRequestEx;
begin
  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

  // 13.11.2020 Приходы будем печатать по-новому (а потом и все остальные типы ордеров)
  if DMReports.printReportsForObject(RQFKOrderObj) then Exit;

     // по дефолту все печатные формы в xls (SUPP-3957)
     reportXlsOrPdf := 'xls';

     isBrigadeZZ := False;

    if  (RQFKOrderObj.kind.code in [RQFKORDER_KIND_RASHOD_OE2REM , RQFKORDER_KIND_RASHOD_OE2OUT, RQFKORDER_KIND_RASHOD_TO_STORAGE])
        and (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_COUNTER)
    then
    begin

        if Self.hasZabalansCounters() then begin
          SetLength(argNames, 1);
          SetLength(args, 1);
          argNames[0] := 'orderCode';
          args[0] := IntToStr( RQFKOrderObj.code );
          reportName := 'RepOrder/RQFKOrder/actCounterExpertise';
          makeReport(reportName, argNames, args, 'xls');
        end else begin
         RQFKOrderItemFilterObj := RQFKOrderItemFilter.Create;
         SetNullIntProps(RQFKOrderItemFilterObj);
         SetNullXSProps(RQFKOrderItemFilterObj);
         RQFKOrderItemFilterObj.fkOrderRef := RQFKOrderRef.Create;
         RQFKOrderItemFilterObj.fkOrderRef.code := RQFKOrderObj.code;

         TempRQFKOrderItem :=  HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
         SetGridHeaders(RQFKOrderItemHeaders, sgRQFKOrderItem.ColumnHeaders);

          RQFKOrderItemList := TempRQFKOrderItem.getScrollableFilteredList(RQFKOrderItemFilterObj,0,-1);
          for i:=0 to High(RQFKOrderItemList.list) do
          begin
             // для каждого СКОрдера будем печатать свою ОЗ на перемещение
             scOrdFilter := SCOrderFilter.Create;
             SetNullIntProps(scOrdFilter);
             SetNullXSProps(scOrdFilter);
             scOrdFilter.conditionSQL := ' code in ( ' +
            ' select sco.code from scorder sco, scinvoice sci ' +
            ' where sco.invoicerefcode = sci.code ' +
            ' and sci.fkorderitemrefcode = ' + IntToStr(RQFKOrderItemList.list[i].code) + ' )';

            TempSCOrder :=  HTTPRIOSCOrder as SCOrderControllerSoapPort;
            scOrdList := TempSCOrder.getScrollableFilteredList(scOrdFilter, 0, -1);

            for brr := 0 to High(scOrdList.list) do
            begin
              printingOZ(RQFKOrderItemList.list[i].code, scOrdList.list[brr].code);
            end;

          end;
        end;




    end
    else
    begin

       SetLength(argNames, 1);
       SetLength(args, 1);

       argNames[0] := 'orderCode';
       args[0] := IntToStr( RQFKOrderObj.code );
       if (RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA) or (RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_BUFET) then
       begin
          if RQFKOrderObj.status.code = RQFKORDER_STATUS_GOOD then
          begin
            Application.MessageBox(PChar('Надрукувати можливо тільки складений або проведений прибутковий ордер!'),
                                   PChar('Увага !'), MB_ICONWARNING);
            Exit;
          end;

          if hasCustomerMaterials then begin
              printReportRQFKOrderActCustomerMaterialsTransfer(RQFKOrderObj);
              Exit;
          end;

          if (RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_BUFET) then
						reportName := 'RepOrder/RQFKOrder/RQFKOrderIn'

          else
          if (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_OS) then
					if ((( RQFKOrderObj.dateGen.Year = 2013 ) AND
            ( RQFKOrderObj.dateGen.Month >= 8 )) or	( RQFKOrderObj.dateGen.Year > 2013 )) then
						reportName := 'RepOrder/RQFKOrder/01082013/RQFKOrderOSIn'
						else
						reportName := 'RepOrder/RQFKOrder/RQFKOrderOSIn'
          else

          if (RQFKOrderObj.accountingTypeRef.code in [TK_ACCOUNTINGTYPE_SEAL,
                      TK_ACCOUNTINGTYPE_IMP, TK_ACCOUNTINGTYPE_HOLO]
          ) then
						reportName := 'RepOrder/RQFKOrder/01082013/RQFKOrderInSeal'

					else
					if ((( RQFKOrderObj.dateGen.Year = 2013 ) AND
            ( RQFKOrderObj.dateGen.Month >= 8 )) or	( RQFKOrderObj.dateGen.Year > 2013 )) then
   						if (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_COUNTER) and (Self.isRQFKOrderFromRQActCounterExpertise(RQFKOrderObj)) then
	      					reportName := 'RepOrder/RQFKOrder/actCounterExpertise'
              else
                  reportName := 'RepOrder/RQFKOrder/01082013/RQFKOrderIn'
						else
						reportName := 'RepOrder/RQFKOrder/RQFKOrderIn'
			 end
			 else
       if  ( (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM) and (RQFKOrderObj.accountingTypeRef.code in [TK_ACCOUNTINGTYPE_SEAL,
                      TK_ACCOUNTINGTYPE_IMP, TK_ACCOUNTINGTYPE_HOLO])) then
       begin
          reportName := 'RepOrder/RQFKOrder/RQFKOrderSealOut';
       end
       else
       // 05.12.11 Ввод в экспл. МБП - так же, как и обычный расходный ордер
       if  ((RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_TO_STORAGE) and (RQFKOrderObj.account = '')) or(
          RQFKOrderObj.kind.code in [RQFKORDER_KIND_RASHOD_OE2REM, RQFKORDER_KIND_MBP, RQFKORDER_KIND_RASHOD_BUFET, RQFKORDER_KIND_OUT_FUEL]) then
       begin
                      reportName := 'RepOrder/RQFKOrder/RQFKOrderOut';
       end
       else
       if  ((RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2OUT) and
           (RQFKOrderObj.accountingTypeRef.code <> TK_ACCOUNTINGTYPE_OS))
       then
       begin
          reportName := '201109/ActToOrderOut/Act';  // перенесли еще раз папку Актов
       end
       else
       if  RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_GIFT then
       begin
          reportName := '201109/ActToOrderGift/Act';  // перенесли еще раз папку Актов
       end
       else
       if  RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE then
       begin
          if RQFKOrderObj.status.code = RQFKORDER_STATUS_IN_FK then
            reportName := '201109/ActChangeMeasurement/Act_prov'
          else
            reportName := '201109/ActChangeMeasurement/Act'
       end
       else
       if RQFKOrderObj.kind.code in ([RQFKORDER_KIND_LOADEXPL_MBP, RQFKORDER_KIND_LOADEXPL_MNMA]) then
       begin
         // если МНМА то еще напечатать АКТ
          if RQFKOrderObj.kind.code = RQFKORDER_KIND_LOADEXPL_MNMA then
          //if RQFKOrderObj.kind.code in [RQFKORDER_KIND_LOADEXPL_MNMA, RQFKORDER_KIND_MNMA] then
          begin
            reportName := 'RepOrder/Load_in_Exploitation/OZ-1';
            makeReport(reportName, argNames, args, 'xls');
          end;
          //  makeReport('RepOrder/Load_in_Exploitation/OZ-1', argNames, args, 'xls');
          ///
         RQFKOrderItemFilterObj := RQFKOrderItemFilter.Create;
         SetNullIntProps(RQFKOrderItemFilterObj);
         SetNullXSProps(RQFKOrderItemFilterObj);
         RQFKOrderItemFilterObj.conditionSQL := ' RQFKORDERITEM.CODE in  ( select fri.code from rqfkorderitem2enstmttm fri2en ,  rqfkorderitem fri  , enestimateitem eni , enplanwork p ' +
				       '	where fri.fkorderrefcode  = ' + IntToStr(RQFKOrderObj.code) +
 				       '	  and fri.code = fri2en.fkorderitemrefcode ' +
 				       '	  and fri2en.estimateitemcode = eni.code ' +
				       '	  and eni.planrefcode = p.code ' +
                                       '          and p.kindcode = 2 ' +
				       '	  and p.staterefcode = ' + IntToStr(ENPLANWORKSTATE_BSZ)  + ' ) ';

         TempRQFKOrderItem :=  HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;

          RQFKOrderItemList := TempRQFKOrderItem.getScrollableFilteredList(RQFKOrderItemFilterObj,0,-1);
          isBrigadeZZ := ( High(RQFKOrderItemList.list) > -1 );
          ////
          if isBrigadeZZ then
            reportName := 'RepOrder/Load_in_Exploitation/load_in_exp_MBP_MNMA2' // ведомость по вводу в эксплуатацию без привязки к обектам (работники)
          else
            reportName := 'RepOrder/Load_in_Exploitation/load_in_exp_MBP_MNMA';  // ведомости по вводу в эксплуатацию
       end
       else
       if RQFKOrderObj.kind.code = RQFKORDER_KIND_MNMA then
       begin
         reportName := 'RepOrder/Load_in_Exploitation/OZ-1';
       end
       else
       if (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_MNMA) or ((RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_TO_STORAGE) and (RQFKOrderObj.account <> '')) then
       begin
         reportName := 'RepOrder/Rashod_MNMA_Out/OZ-1';
       end

       else
       if RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT then
       begin
          reportName := 'RepOrder/RQFKOrder/RQFKOrderOutReturn';
       end

       else
       if (RQFKOrderObj.kind.code in [RQFKORDER_KIND_OS_EXPL, RQFKORDER_KIND_OS_MOVEMENT])
       or ((RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2OUT) and (RQFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_OS)) then
       begin

        if RQFKOrderObj.typeRef <> nil then
        if RQFKOrderObj.typeRef.code = RQFKORDER_TYPE_ZVT  then
        begin
         reportName := 'RepOrder/RQFKOrder/RQFKOrderOSOut/RQFKOrderOSOut';
         makeReport(reportName, argNames, args, 'xls');
         exit;
        end;

         if RQFKOrderObj.kind.code = RQFKORDER_KIND_OS_EXPL then
         begin
           if RQFKOrderObj.status.code = RQFKORDER_STATUS_GOOD then
           begin
             Application.MessageBox(PChar('Спочатку переведіть ордер у статус "Складений"!'),
                                    PChar('Увага !'), MB_ICONWARNING);
             Exit;
           end;

           if RQFKOrderObj.status.code in [RQFKORDER_STATUS_CREATED, RQFKORDER_STATUS_IN_WORK_ON_WAREHOUSE] then
           begin
             // datePosting у ордера сетится при его переводе в статус "Складений".
             // Перед печатью сверяем, не изменилась ли текущая бух. дата в ОС после складання ордера.
             // Если изменилась, то ордер необходимо перепечатать, т.к. эта дата выводится при печати
             // (в столбце "Дата введення в експлуатацію")

             // Перечитаем объект (вдруг он успел измениться)
             tmpRQFKOrderObj := TempRQFKOrder.getObject(RQFKOrderObj.code);

             buhDate := TempRQFKOrder.getCurrentBuhDate();
             //datePosting := RQFKOrderObj.datePosting;
             datePosting := tmpRQFKOrderObj.datePosting;

             tmpBuhDate := EncodeDate(buhDate.Year, buhDate.Month, buhDate.Day);
             tmpDatePosting := EncodeDate(datePosting.Year, datePosting.Month, datePosting.Day);

             if tmpDatePosting <> tmpBuhDate then
             begin
               Application.MessageBox(PChar('NET-3770 В модулі "Облік ОЗ" Фін. Колекції змінився місяць!' + #13#10 +
                                            'Потрібно відмінити складання документу, скласти документ ще раз та знов його надрукувати' + #13#10 +
                                            '(тому що зміниться дата введення в експлуатацію ОЗ, яка є реквізитом документу)!'),
                                      PChar('Увага !'), MB_ICONWARNING);
               Exit;
             end;
           end;
         end;

         // Для ввода в эксплуатацию и внутр. перемещения ОС печатается отдельный документ для каждой строки (каждого ОС)
         RQFKOrderItemFilterObj := RQFKOrderItemFilter.Create;
         SetNullIntProps(RQFKOrderItemFilterObj);
         SetNullXSProps(RQFKOrderItemFilterObj);
         RQFKOrderItemFilterObj.fkOrderRef := RQFKOrderRef.Create;
         RQFKOrderItemFilterObj.fkOrderRef.code := RQFKOrderObj.code;

         TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;

         RQFKOrderItemList := TempRQFKOrderItem.getScrollableFilteredList(RQFKOrderItemFilterObj, 0, -1);

         reportName := 'RepOrder/RQFKOrder/RQFKOrderOSOZ1';

         SetLength(argNames, 2);
         SetLength(args, 2);

         TempRQFKOrderItem2OSData := HTTPRIORQFKOrderItem2OSData as RQFKOrderItem2OSDataControllerSoapPort;

         for i := 0 to High(RQFKOrderItemList.list) do
         begin
           /////////////////////////////////////////////////////////////////////
           if RQFKOrderObj.kind.code = RQFKORDER_KIND_OS_EXPL then
           begin
             osDataFilter := RQFKOrderItem2OSDataFilter.Create;
             SetNullIntProps(osDataFilter);
             SetNullXSProps(osDataFilter);

             osDataFilter.fkOrderItemRef := RQFKOrderItemRef.Create;
             osDataFilter.fkOrderItemRef.code := RQFKOrderItemList.list[i].code;

             debetAccount := '';

             osDataList := TempRQFKOrderItem2OSData.getScrollableFilteredList(osDataFilter, 0, -1);
             if osDataList.totalCount > 0 then
               if osDataList.list[0] <> nil then
                 debetAccount := osDataList.list[0].kod_subsch;

             // Для 12-х счетов - другая форма (это НЕМАТЕРИАЛЬНЫЕ АКТИВЫ)
             if Copy(debetAccount, 1, 2) = '12' then
               reportName := 'RepOrder/RQFKOrder/RQFKOrderOSNA1';

             // Если ОС оприходовано на счет 1540, то это тоже НЕМАТЕРИАЛЬНЫЕ АКТИВЫ
             if RQFKOrderItemList.list[i].nomenclatureBalSch = '1540' then
               reportName := 'RepOrder/RQFKOrder/RQFKOrderOSNA1';
           end;

           /////////////////////////////////////////////////////////////////////
           ///
           argnames[1] := 'orderItemCode';
           args[1] := IntToStr(RQFKOrderItemList.list[i].code);

           makeReport(reportName, argNames, args, 'xls');
         end;

       end

       else if (RQFKOrderObj.kind.code = RQFKORDER_KIND_WRITEOFFCOUNTERS)
        and (Self.isRQFKOrderFromRQActCounterExpertise(RQFKOrderObj)) then begin
         reportName := 'RepOrder/RQFKOrder/actCounterExpertise';
         SetLength(argNames, 1);
         SetLength(args, 1);
         argnames[0] := 'orderCode';
         args[0] := IntToStr(RQFKOrderObj.code);
       end else

       begin
         ShowMessage('Непонятный тип ордера ;)');
         Exit;
       end;


       if not (RQFKOrderObj.kind.code in [RQFKORDER_KIND_OS_EXPL, RQFKORDER_KIND_OS_MOVEMENT]) then
         makeReport(reportName, argNames, args, reportXlsOrPdf);

       // Распечатка актов приема передачи палет
       if (isRQFKOrderForPallet(RQFKOrderObj))
          and (RQFKOrderObj.isPalletized = RQFKORDER_ISPALLETIZED_TRUE) then
       begin
            reportName := 'RepOrder/RepPallet/printPalletActs';
            argnames[0] := 'orderCode';
            args[0] := IntToStr(RQFKOrderObj.code);
            makeReport(reportName, argNames, args, 'pdf');

            reportName := 'RepOrder/RepPallet/packingList';
            argnames[0] := 'orderCode';
            args[0] := IntToStr(RQFKOrderObj.code);
            makeReport(reportName, argNames, args, 'xls');

       end;
   end;

end;

procedure TfrmRQFKOrderEdit.printOrder(fkOrderCode: Integer);
var
  TempRQFKOrder : RQFKOrderControllerSoapPort;
begin 
  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  RQFKOrderObj := TempRQFKOrder.getObjectNoSegr(fkOrderCode);
  Self.printOrder;
end;

procedure TfrmRQFKOrderEdit.getPostingsListAX(servicesObjectCode: Integer);
var i: Integer;
    TempENServicesObjectController: ENServicesObjectControllerSoapPort;
    provList: AXLedgerTransShortList;
    TempAXLedgerTransController : AXLedgerTransControllerSoapPort;
    voucher: String;
    TempRqfkorder2provController  : RQFKOrder2ProvControllerSoapPort;
    rf2provFilter : RQFKOrder2ProvFilter;
    rf2provList : RQFKOrder2ProvShortList;

begin
  ClearGrid(sgAXLedgerTrans);

  if servicesObjectCode = LOW_INT then Exit;

  TempAXLedgerTransController := HTTPRIOAXLedgerTrans as AXLedgerTransControllerSoapPort;
  TempRqfkorder2provController := HTTPRIORQFKOrder2Prov as RQFKOrder2ProvControllerSoapPort;

  rf2provFilter := RQFKOrder2ProvFilter.Create;
  SetNullIntProps(rf2provFilter);
  SetNullXSProps(rf2provFilter);

  rf2provFilter.fkorderRef := RQFKOrderRef.Create;
  rf2provFilter.fkorderRef.code := RQFKOrderObj.code;

  rf2provList :=  TempRqfkorder2provController.getScrollableFilteredList(rf2provFilter,0,-1);

  if rf2provList.totalCount = 0 then
   Exit;

  voucher := rf2provList.list[0].voucher;
  if voucher <> '' then
  begin
  provList := TempAXLedgerTransController.getPostingByVoucher(voucher);

  if High(provList.list) > -1 then
    sgAXLedgerTrans.RowCount := High(provList.list) + 2
  else
    sgAXLedgerTrans.RowCount := 2;

  with sgAXLedgerTrans do
    for i := 0 to High(provList.list) do
    begin

      if provList.list[i].transDate = nil then
        Cells[1,i+1] := ''
      else
        Cells[1,i+1] := XSDate2String(provList.list[i].transDate);

      Cells[2,i+1] := provList.list[i].amountCur.DecimalString;
      Cells[3,i+1] := provList.list[i].accountNum;

      Cells[4,i+1] := provList.list[i].accountDimension1;
      Cells[5,i+1] := provList.list[i].accountDimension2;
      Cells[6,i+1] := provList.list[i].accountDimension3;
      Cells[7,i+1] := provList.list[i].accountDimension4;
      Cells[8,i+1] := provList.list[i].accountDimension5;
      Cells[9,i+1] := provList.list[i].accountDimension6;
      Cells[10,i+1] := provList.list[i].accountDimension7;
      Cells[11,i+1] := provList.list[i].accountDimension8;
      Cells[12,i+1] := provList.list[i].accountDimension9;
      Cells[13,i+1] := provList.list[i].accountDimension10;
      Cells[14,i+1] := provList.list[i].accountDimension11;
      Cells[15,i+1] := provList.list[i].accountDimension12;
      Cells[16,i+1] := provList.list[i].accountDimension13;

      Cells[17,i+1] := provList.list[i].offsetAccountNum;

      Cells[18,i+1] := provList.list[i].corAccountDimension1;
      Cells[19,i+1] := provList.list[i].corAccountDimension2;
      Cells[20,i+1] := provList.list[i].corAccountDimension3;
      Cells[21,i+1] := provList.list[i].corAccountDimension4;
      Cells[22,i+1] := provList.list[i].corAccountDimension5;
      Cells[23,i+1] := provList.list[i].corAccountDimension6;
      Cells[24,i+1] := provList.list[i].corAccountDimension7;
      Cells[25,i+1] := provList.list[i].corAccountDimension8;
      Cells[26,i+1] := provList.list[i].corAccountDimension9;
      Cells[27,i+1] := provList.list[i].corAccountDimension10;
      Cells[28,i+1] := provList.list[i].corAccountDimension11;
      Cells[29,i+1] := provList.list[i].corAccountDimension12;
      Cells[30,i+1] := provList.list[i].corAccountDimension13;


      Cells[31,i+1] := provList.list[i].ledgerTxt;
      Cells[32,i+1] := provList.list[i].voucher;



    end;
  end;
end;

end.
