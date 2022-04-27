
unit EditRQOrder;

interface

uses
  Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
  Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
  DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, RQOrderController, RQOrderItemController,
  DateUtils, ExtCtrls,  tmsAdvGridExcel, AdvObj, xmldom, XMLIntf, msxmldom, XMLDoc,
  RQFKOrderController, EditRQFKOrder, RQFKOrderItemController,
  RQFKOrderKindController, RQApprovedCostController
	;

type
  TfrmRQOrderEdit = class(TDialogForm)
    pcRQOrder: TPageControl;
    tsRQOrder: TTabSheet;
    lblNumberDoc: TLabel;
    lblNumberProject: TLabel;
    lblOrderPeriod: TLabel;
    lblDateGen: TLabel;

    lblCommentGen: TLabel;
    lblUserGen: TLabel;
    lblDateEdit: TLabel;
    spbENDepartmentDepartmentRef: TSpeedButton;
    lblENDepartmentDepartmentRefName: TLabel;
    spbENDepartmentBudgetRef: TSpeedButton;
    lblENDepartmentBudgetRefName: TLabel;
    spbRQOrderTypeRqOrderType: TSpeedButton;
    lblRQOrderTypeRqOrderTypeName: TLabel;
    spbRQOrderFormRqOrderForm: TSpeedButton;
    lblRQOrderFormRqOrderFormName: TLabel;
    spbRQOrderResourceRqOrderResource: TSpeedButton;
    lblRQOrderResourceRqOrderResourceName: TLabel;
    edtNumberDoc: TEdit;
    edtNumberProject: TEdit;
    edtOrderPeriod: TDateTimePicker;
    edtDateGen: TDateTimePicker;
    edtCommentGen: TMemo;
    edtUserGen: TEdit;
    edtDateEdit: TDateTimePicker;
    edtENDepartmentDepartmentRefName: TEdit;
    edtENDepartmentBudgetRefName: TEdit;
    edtRQOrderTypeRqOrderTypeName: TEdit;
    edtRQOrderFormRqOrderFormName: TEdit;
    edtRQOrderResourceRqOrderResourceName: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIORQOrder: THTTPRIO;
    tsRQOrderItems: TTabSheet;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    sgRQOrderItem: TAdvStringGrid;
    tsRQOrderDepartment: TTabSheet;
    tsRQOrderBudget: TTabSheet;
    ToolBar2: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ToolBar3: TToolBar;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    sgRQOrderDepartment: TAdvStringGrid;
    sgRQOrderBudget: TAdvStringGrid;
    lblCode: TLabel;
    edtCode: TEdit;
    btnTDExport: TButton;
    HTTPRIORQMaterials: THTTPRIO;
    actTDExcel: TAction;
    actTDExport: TAction;
    pnlTotal: TPanel;
    Label4: TLabel;
    pnlTotalSum: TPanel;
    btnPrintOffert: TButton;
    actTDExcelDecoding: TAction;
    btnCreateItems: TButton;
    spbDeparmentClear: TSpeedButton;
    Panel1: TPanel;
    edtMaterialName: TEdit;
    spbMaterialName: TSpeedButton;
    Label3: TLabel;
    spbMaterialsClear: TSpeedButton;
    gbPrintsBtn: TGroupBox;
    btnTDExcel: TButton;
    btnTDExcelDecoding: TButton;
    chkGr_mat: TCheckBox;
    actPrintOffertFromSelected: TAction;
    N5: TMenuItem;
    N9: TMenuItem;
    btnPrintTD2Komplekt: TButton;
    lblFilterDescription: TLabel;
    actEditContract: TAction;
    N10: TMenuItem;
    N11: TMenuItem;
    aeExcel: TAdvGridExcelIO;
    actRQOrderItemsExportExcel: TAction;
    N12: TMenuItem;
    Excel1: TMenuItem;
    tsRQBills: TTabSheet;
    ToolBar4: TToolBar;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    sgRQBill: TAdvStringGrid;
    HTTPRIORQBill: THTTPRIO;
    pnlTotalBills: TPanel;
    Label1: TLabel;
    pnlTotalSumBills: TPanel;
    edtExportContractNumber: TEdit;
    lblExportContractNumber: TLabel;
    actPrintStringOrder: TAction;
    N13: TMenuItem;
    pnlLegend: TPanel;
    Shape1: TShape;
    Label2: TLabel;
    btnAxaptaExport: TButton;
    xmlRQOrder: TXMLDocument;
    N14: TMenuItem;
    actBindToAxapta: TAction;
    Axapt1: TMenuItem;
    HTTPRIOTKMaterials: THTTPRIO;
    HTTPRIOENServicesObject: THTTPRIO;
    chbKEPOnly: TCheckBox;
    actExpToAX: TAction;
    ExpToAX: TMenuItem;
    actSelectAll: TAction;
    actClearAll: TAction;
    N15: TMenuItem;
    N16: TMenuItem;
    btnOrderExecuteWork: TButton;
    btnPrintOrderByAgree: TButton;
    chbPriceAndCostIsShown: TCheckBox;
    chbPrintOnlyForOneAgree: TCheckBox;
    chbIsInBill: TCheckBox;
    chbOnlyCheckedStrings: TCheckBox;
    btnPrintMaterialsDistribution: TButton;
    actEditDDSCodes: TAction;
    N17: TMenuItem;
    btnUpdatePaymentDateOrderedByOrgName: TButton;
    actIsPAID: TAction;
    actisNOPAID: TAction;
    ShapePaid: TShape;
    lblPaid: TLabel;
    N18: TMenuItem;
    pmPaid: TMenuItem;
    pmNoPaid: TMenuItem;
    actChangeStatusOrderItem: TAction;
    mniChangStatusOrderItem: TMenuItem;
    HTTPRIORQOrderItem: THTTPRIO;
    tsRQFKOrder: TTabSheet;
    pnlRQFKOrderItem: TPanel;
    gbRQFKOrderItem: TGroupBox;
    sgRQFKOrderItem: TAdvStringGrid;
    sgRQFKOrder: TAdvStringGrid;
    spl1: TSplitter;
    HTTPRIORQFKOrder: THTTPRIO;
    HTTPRIORQFKOrderItem: THTTPRIO;
    ToolBar5: TToolBar;
    ToolButton23: TToolButton;
    ToolButton27: TToolButton;
    Splitter1: TSplitter;
    chkPrihod: TCheckBox;
    lblRQOrderCreationMethod: TLabel;
    edtRQOrderCreationMethod: TEdit;
    HTTPRIORQOrderCreationMethod: THTTPRIO;
    actConfirmVendorPrice: TAction;
    miConfirmVendorPrice: TMenuItem;
    HTTPRIORQApprovedCost: THTTPRIO;
    pnlCountersLegend: TPanel;
    Shape3: TShape;
    lblSumLegend: TLabel;
    Label5: TLabel;
    actCreateOffers: TAction;
    miCreateOffers: TMenuItem;
    tsRQOffers: TTabSheet;
    HTTPRIORQOfferItem: THTTPRIO;
    alOffers: TActionList;
    actViewOfferItem: TAction;
    actInsertOfferItem: TAction;
    actDeleteOfferItem: TAction;
    actEditOfferItem: TAction;
    actUpdateOfferItem: TAction;
    pmOffersItems: TPopupMenu;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    actCheckAllOfferItems: TAction;
    actUncheckAllOfferItems: TAction;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    HTTPRIORQOffer: THTTPRIO;
    GroupBox1: TGroupBox;
    sgRQOfferItem: TAdvStringGrid;
    ToolBar7: TToolBar;
    ToolButton25: TToolButton;
    ToolButton30: TToolButton;
    ToolButton31: TToolButton;
    ToolButton32: TToolButton;
    GroupBox2: TGroupBox;
    sgRQOffer: TAdvStringGrid;
    ToolBar6: TToolBar;
    ToolButton24: TToolButton;
    ToolButton26: TToolButton;
    ToolButton28: TToolButton;
    ToolButton29: TToolButton;
    actViewOffer: TAction;
    actInsertOffer: TAction;
    actDeleteOffer: TAction;
    actEditOffer: TAction;
    actUpdateOffer: TAction;
    pmOffers: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    btnAddCountersServices: TButton;
    actConfirmPriceVRTU: TAction;
    miConfirmPriceVRTU: TMenuItem;
    actViewPriceVRTU: TAction;
    miViewPriceVRTU: TMenuItem;
    N19: TMenuItem;
    actConfirmPriceVRTUNoControl: TAction;
    miConfirmPriceVRTUNoControl: TMenuItem;
    shpSumLegendNoControl: TShape;
    lblSumLegendNoControl: TLabel;
    actEditDDSCode: TAction;
    rgRestPurposeType: TRadioGroup;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENDepartmentDepartmentRefClick(Sender : TObject);
  procedure spbENDepartmentBudgetRefClick(Sender : TObject);
  procedure spbRQOrderTypeRqOrderTypeClick(Sender : TObject);
  procedure spbRQOrderFormRqOrderFormClick(Sender : TObject);
  procedure spbRQOrderResourceRqOrderResourceClick(Sender : TObject);
    procedure pcRQOrderChange(Sender: TObject);
    procedure edtOrderPeriodExit(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actTDExcelExecute(Sender: TObject);
    procedure actTDExportExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPrintOffertClick(Sender: TObject);
    procedure actTDExcelDecodingExecute(Sender: TObject);
    procedure btnCreateItemsClick(Sender: TObject);
    procedure spbDeparmentClearClick(Sender: TObject);
    procedure spbMaterialsClearClick(Sender: TObject);
    procedure spbMaterialNameClick(Sender: TObject);
    procedure actPrintOffertFromSelectedExecute(Sender: TObject);
    procedure btnPrintTD2KomplektClick(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure actEditContractExecute(Sender: TObject);
    procedure actRQOrderItemsExportExcelExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure actPrintStringOrderExecute(Sender: TObject);
    procedure btnAxaptaExportClick(Sender: TObject);
    procedure actBindToAxaptaExecute(Sender: TObject);
    procedure ExpToAXClick(Sender: TObject);
    procedure actSelectAllExecute(Sender: TObject);
    procedure actClearAllExecute(Sender: TObject);
    procedure btnOrderExecuteWorkClick(Sender: TObject);
    procedure btnPrintOrderByAgreeClick(Sender: TObject);
    procedure sgRQOrderItemCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure chbPrintOnlyForOneAgreeClick(Sender: TObject);
    procedure btnPrintMaterialsDistributionClick(Sender: TObject);
    procedure actEditDDSCodesExecute(Sender: TObject);
    procedure btnUpdatePaymentDateOrderedByOrgNameClick(Sender: TObject);
    procedure actIsPAIDExecute(Sender: TObject);
    procedure actisNOPAIDExecute(Sender: TObject);
    procedure actChangeStatusOrderItemExecute(
      Sender: TObject);
    procedure sgRQFKOrderClick(Sender: TObject);
    procedure chkPrihodClick(Sender: TObject);
    procedure actConfirmVendorPriceExecute(Sender: TObject);
    procedure actCreateOffersExecute(Sender: TObject);
    procedure actViewOfferItemExecute(Sender: TObject);
    procedure actEditOfferItemExecute(Sender: TObject);
    procedure actUpdateOfferItemExecute(Sender: TObject);
    procedure actDeleteOfferItemExecute(Sender: TObject);
    procedure actCheckAllOfferItemsExecute(Sender: TObject);
    procedure actUncheckAllOfferItemsExecute(Sender: TObject);
    procedure actViewOfferExecute(Sender: TObject);
    procedure actUpdateOfferExecute(Sender: TObject);
    procedure actEditOfferExecute(Sender: TObject);
    procedure actDeleteOfferExecute(Sender: TObject);
    procedure btnAddCountersServicesClick(Sender: TObject);
    procedure actConfirmPriceVRTUExecute(Sender: TObject);
    procedure actViewPriceVRTUExecute(Sender: TObject);
    procedure actConfirmPriceVRTUNoControlExecute(Sender: TObject);
    procedure actEditDDSCodeExecute(Sender: TObject);

  private
    { Private declarations }
    selectedItemIndex: Integer;
    selectedItemsList : TList;
    isOrderForVRTU: Boolean;
    procedure BuildRQOrderItemFilter;
    procedure ClearRQOrderItemFilter;
    function getApprovedCostBySelectedItem(isForVRTU: Boolean = false; index: Integer = -1): RQApprovedCost;
	public
		{ Public declarations }
		materialGroupCode : Integer;
		materialName: String;
		contractNumber: String;
		isWithoutContracts: Boolean;

		responsibleCode: Integer;
		responsibleName: String;

		typePayCode: Integer;

    orgName : String;

    budgetCode : Integer;
    budgetName : String;

    RQOrderObj: RQOrder;

    procedure UpdateGrid(Sender: TObject);
    procedure UpdateItemGrid();

    procedure UpdateOfferItemsList();
    procedure UpdateOffersList();
end;

var
  frmRQOrderEdit: TfrmRQOrderEdit;


  RQOrderItemHeaders: array [1..21] of String =
        ( 'Код'
          , '№'
          , 'Код ДДС'

          , 'Бюджетотримач'

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
          ,'№ проекту договору'

          //,'Примітка'
          ,'Відп. особа'
          //,'Користувач'

					,'Примітка'
					,'Вид оплати'
					,'Значення'
          ,'Зміни або план закупівель №'
        );

  RQOrderDepartmentHeaders: array [1..12] of String =
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
          ,'Статус'
          ,'Користувач'
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

{
  RQOfferItemHeaders: array [1..17] of String =
        ( 'Код'
          ,'Назва матеріалу на момент формування'
          ,'Од. виміру матеріалу на момент формування'
          ,'Назва матеріалу у пропозиції постачальника'
          ,'Од. виміру матеріалу у пропозиції постачальника'
          ,'Код статті РГК'
          ,'Кількість'
          ,'Ціна без ПДВ'
          ,'Ціна з ПДВ'
          ,'Сума без ПДВ'
          ,'Сума з ПДВ'
          ,'Примітка'
          ,'Планова дата постачання'
          ,'Користувач, який створив запис'
          ,'Дата створення'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
}
  RQOfferItemHeaders: array [1..9] of String =
        ( 'Код'
          ,'Постачальник'
          ,'E-mail'
          ,'Код РГК'
          ,'Назва матеріалу'
          ,'Од. виміру'
          ,'Кількість'
          ,'Ціна з ПДВ'
          ,'Планова дата постачання'
        );

  RQOfferHeaders: array [1..8] of String =
        ( 'Код'
          //,'Номер'
          //,'Номер проекта'
          //,'Дата складання'
          //,'E-mail постачальника'
          ,'Постачальник'
          ,'E-mail'
          ,'Статус'
          ,'Користувач, який створив запис'
          ,'Дата створення'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );

	RQOrderItemFilterObj : RQOrderItemFilter;

const
  // Если вдруг в гриде поменяются местами столбцы (RQOrderDepartmentHeaders),
  // то достаточно изменить их индекс в этих константах
  DEPARTMENT_COL_NUMBER = 5; // № столбца 'Підрозділ'
  // А это для другого грида (RQOrderItemHeaders),
  MATERIAL_COL_NUMBER   = 4; // № столбца 'Матеріал(Довідник)'


 // не понятно как оно тут очутилось ScreenWidth: LongInt = 995; {Я разрабатывал мою форму в режиме 800x600.}
 // не понятно как оно тут очутилось   ScreenHeight: LongInt = 600;

implementation

uses
  ShowENDepartment
  ,ENDepartmentController
  //,ShowENDepartment
  //,ENDepartmentController
  ,ShowRQOrderType
  ,RQOrderTypeController
  ,ShowRQOrderForm
  ,RQOrderFormController
  ,ShowRQOrderResource
  ,RQOrderResourceController
, ENDepartmentTypeController, ENConsts,
  RQOrderStatusController, EditMaterialsParametersOut,
  ShowRQOrder, RQOrderKindController, DMReportsUnit, Globals,
  RQDDSCodesController, StrUtils, RQMaterialsController
  ,RQMaterials2TKMaterialsController, ShowTKMaterials, EditRQOrderItem,
  TKMaterialsController, EditRQOrderItemFilter, EditRQOrderChangeContract,
  RQOrgController, ShellAPI, RQBillController, EditRQBill, EditTKMaterials,
  ENServicesObjectController, EditRQOrderItemServices,
  ENResponsiblesController, ShowRQDDSCodes , RQOrderItemTypePayController,
  ChangeStatusOrderItem,
  RQOrderItemStatusController, RQOrderCreationMethodController,
  AddMaterialToAVZOrder, SetRQApprovedCost, EditRQOrgsForOffer,
  RQOfferItemController, EditRQOfferItem, RQOfferController, EditRQOffer,
  RQApprovedCostStatusController;
{uses
    EnergyproController, EnergyproController2, RQOrderController  ;
}
{$R *.dfm}


procedure TfrmRQOrderEdit.FormShow(Sender: TObject);
var
  TempRQOrderItem: RQOrderItemControllerSoapPort;
  TempRQOrder: RQOrderControllerSoapPort;
  itemList : RQOrderItemShortList;
  itemFilter : RQOrderItemFilter;

  TempRQOrderCreationMethod: RQOrderCreationMethodControllerSoapPort;
  creationMethod: RQOrderCreationMethod;

  //isOrderForVRTU: Boolean;
begin
  //btnAxaptaTest.Visible := (HTTPRIORQOrder.HTTPWebNode.UserName = 'energynet');

  /////
  actCreateOffers.Enabled := (HTTPRIORQOrder.HTTPWebNode.UserName = 'energynet');
  actCreateOffers.Visible := (HTTPRIORQOrder.HTTPWebNode.UserName = 'energynet');
  tsRQOffers.TabVisible := (HTTPRIORQOrder.HTTPWebNode.UserName = 'energynet');
  // Кнопка для автоматического формирования заявки на счетчики
  // (которое срабатывает по таймеру на серваке в конце каждой декады) -
  // для случая, если нужно сформировать ее в любое время по требованию
  btnAddCountersServices.Visible := false; //(HTTPRIORQOrder.HTTPWebNode.UserName = 'energynet');
  /////

  SetGridHeaders(RQFKOrderHeaders, sgRQFKOrder.ColumnHeaders);
  SetGridHeaders(RQFKOrderItemHeaders, sgRQFKOrderItem.ColumnHeaders);

  SetGridHeaders(RQOfferItemHeaders, sgRQOfferItem.ColumnHeaders);
  SetGridHeaders(RQOfferHeaders, sgRQOffer.ColumnHeaders);

  pcRQOrder.ActivePage := tsRQOrder;

  tsRQOrderDepartment.TabVisible := false;
  tsRQOrderBudget.TabVisible := false;

  DisableControls([edtENDepartmentDepartmentRefName, edtENDepartmentBudgetRefName
                   , edtRQOrderTypeRqOrderTypeName, edtRQOrderFormRqOrderFormName, edtRQOrderResourceRqOrderResourceName
                   , edtRQOrderCreationMethod
                   , edtCode ]);

  DisableControls([edtMaterialName]);

  HideControls([rgRestPurposeType], ((DialogState <> dsInsert)
    or (RQOrderObj.creationMethodRef.code <> RQORDER_CREATION_METHOD_AUTO_AVZ)));

  HideControls([gbPrintsBtn, btnTDExcel, btnTDExport, btnPrintOffert, btnTDExcelDecoding, btnPrintTD2Komplekt,
                btnAxaptaExport, chbKEPOnly, btnPrintOrderByAgree, chbPriceAndCostIsShown, chbPrintOnlyForOneAgree,
                chbIsInBill, btnPrintMaterialsDistribution, lblRQOrderCreationMethod, edtRQOrderCreationMethod], (DialogState = dsInsert));
  HideControls([btnCreateItems]);

  DisableActions([actEditContract, actEditDDSCodes], (DialogState <> dsEdit));

   
  SetGridHeaders(RQOrderItemHeaders, sgRQOrderItem.ColumnHeaders);
  if (RQOrderObj.kindRef.code in [RQORDER_KIND_OE_PLANNED_SERVICES, RQORDER_KIND_OE_NOPLANNED_SERVICES]) then
    sgRQOrderItem.ColumnHeaders[4] := 'Послуга (Довідник)'
  else
    HideControls([btnOrderExecuteWork]);

  ///// 15.07.13
  btnUpdatePaymentDateOrderedByOrgName.Visible := false; //(HTTPRIORQOrder.HTTPWebNode.UserName = 'energynet');
  /////
  

  if DialogState = dsEdit then
  begin
       TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
       itemFilter := RQOrderItemFilter.Create;
       SetNullIntProps(itemFilter);
       SetNullXSProps(itemFilter);
       itemFilter.orderRef := RQOrderRef.Create;
       itemFilter.orderRef.code := RQOrderObj.code;

       itemList := TempRQOrderItem.getScrollableFilteredList(itemFilter,0,1);

       DisableControls([spbENDepartmentDepartmentRef, spbENDepartmentBudgetRef
                        , spbRQOrderFormRqOrderForm, spbRQOrderTypeRqOrderType, spbRQOrderResourceRqOrderResource
                        , edtOrderPeriod
                        , spbDeparmentClear ]
                        , (itemList.totalCount > 0));

      if (RQOrderObj.kindRef.code in [RQORDER_KIND_OE_PLANNED_AUTO, RQORDER_KIND_OE_PLANNED_SERVICES]) or
         (RQOrderObj.creationMethodRef.code = RQORDER_CREATION_METHOD_AUTO_AVZ) then
      begin
          HideControls([btnCreateItems], RQOrderObj.statusRef.code = RQORDER_STATUS_WORK_IN_MTS);

          if RQOrderObj.statusRef.code = RQORDER_STATUS_GOOD then
            btnCreateItems.Caption := 'СФОРМУВАТИ строки (матеріали)'
          else
          if RQOrderObj.statusRef.code = RQORDER_STATUS_CREATED then
            btnCreateItems.Caption := 'ВИДАЛИТИ строки (матеріали)'
          else
            HideControls([btnCreateItems]);

      end;

      { 16.03.11 Нафига эта кнопка (btnCreateItems) на внеплановых заявках???
      if RQOrderObj.kindRef.code = RQORDER_KIND_OE_NOPLANNED then
      begin
          //HideControls([btnCreateItems], RQOrderObj.statusRef.code = RQORDER_STATUS_WORK_IN_MTS);

          //if RQOrderObj.statusRef.code = RQORDER_STATUS_GOOD then
          //  btnCreateItems.Caption := 'СФОРМУВАТИ строки (матеріали)'
          //else
          if RQOrderObj.statusRef.code = RQORDER_STATUS_CREATED then
          begin
            btnCreateItems.Caption := 'ВИДАЛИТИ строки (матеріали)';
            HideControls([btnCreateItems], false);
          end;

      end;
      }

  end;
{
  эти виды заявок ушли в горы ...

  if RQOrderObj.kindRef.code = RQORDER_KIND_DEPARTMENT then
    HideControls([btnTDExcel, btnTDExport, pnlTotal, btnPrintOffert ]);

  if RQOrderObj.kindRef.code = RQORDER_KIND_BUDGET then
  begin
      tsRQOrderDepartment.TabVisible := True;
      HideControls([lblENDepartmentDepartmentRefName, edtENDepartmentDepartmentRefName, spbENDepartmentDepartmentRef]);
  end;

  if RQOrderObj.kindRef.code = RQORDER_KIND_OE then
  begin
      tsRQOrderDepartment.TabVisible := True;
      tsRQOrderBudget.TabVisible := True;
      HideControls([lblENDepartmentDepartmentRefName, edtENDepartmentDepartmentRefName, spbENDepartmentDepartmentRef]);
      HideControls([lblENDepartmentBudgetRefName, edtENDepartmentBudgetRefName, spbENDepartmentBudgetRef]);
  end;
}

  DisableControls([spbRQOrderFormRqOrderForm, spbRQOrderResourceRqOrderResource]);
  if (RQOrderObj.kindRef.code in [RQORDER_KIND_OE_PLANNED_AUTO, RQORDER_KIND_OE_PLANNED_SERVICES]) or
     (RQOrderObj.creationMethodRef.code = RQORDER_CREATION_METHOD_AUTO_AVZ) then
  begin
      //tsRQOrderDepartment.TabVisible := True;
      //tsRQOrderBudget.TabVisible := True;
      HideControls([lblENDepartmentDepartmentRefName, edtENDepartmentDepartmentRefName, spbENDepartmentDepartmentRef, spbDeparmentClear]);
      HideControls([lblENDepartmentBudgetRefName, edtENDepartmentBudgetRefName, spbENDepartmentBudgetRef]);
  end;

  if RQOrderObj.creationMethodRef.code = RQORDER_CREATION_METHOD_AUTO_AVZ then
    DisableControls([spbRQOrderTypeRqOrderType]);

  if  (DialogState = dsInsert) then
  begin
    HideControls([lblCode, edtCode, lblExportContractNumber, edtExportContractNumber]);

      RQOrderObj.statusRef := RQOrderStatusRef.Create;
      RQOrderObj.statusRef.code := RQORDER_STATUS_GOOD;

      edtNumberProject.Text := 'Auto';
      edtNumberDoc.Text := 'Auto';

      if RQOrderObj.rqOrderResource = nil then RQOrderObj.rqOrderResource := RQOrderResource.Create();

      if RQOrderObj.kindRef.code = RQORDER_KIND_PRODUCTION then
      begin
          RQOrderObj.rqOrderResource.code := 3; // типа ПРОИЗВОДСТВО
          edtRQOrderResourceRqOrderResourceName.Text := 'Виробництво';

          RQOrderObj.rqOrderType := RQOrderType.Create;
          RQOrderObj.rqOrderType.code := 1;
          edtRQOrderTypeRqOrderTypeName.Text := 'Бюджетна';
      end
      else
      if   (RQOrderObj.kindRef.code in [RQORDER_KIND_OE_PLANNED_SERVICES, RQORDER_KIND_OE_NOPLANNED_SERVICES]) then
      begin
         RQOrderObj.rqOrderResource.code := 2; // Услуги
         edtRQOrderResourceRqOrderResourceName.Text := 'Услуги';
      end
      else
      begin
       RQOrderObj.rqOrderResource.code := 1; // ТМЦ
       edtRQOrderResourceRqOrderResourceName.Text:= 'ТМЦ';
      end;

      if RQOrderObj.kindRef.code in [RQORDER_KIND_OE_PLANNED_AUTO, RQORDER_KIND_OE_PLANNED_SERVICES] then
      begin
          RQOrderObj.rqOrderForm := RQOrderForm.Create;
          RQOrderObj.rqOrderForm.code := RQORDER_FORM_PLANNED;
          edtRQOrderFormRqOrderFormName.Text := 'Планова';
      end;

      if RQOrderObj.kindRef.code in [ RQORDER_KIND_OE_NOPLANNED , RQORDER_KIND_PRODUCTION, RQORDER_KIND_OE_NOPLANNED_SERVICES] then
      begin
          RQOrderObj.rqOrderForm := RQOrderForm.Create;
          RQOrderObj.rqOrderForm.code := RQORDER_FORM_NOTPLANNED;
          edtRQOrderFormRqOrderFormName.Text := 'Позапланова';
      end;

      if RQOrderObj.creationMethodRef.code = RQORDER_CREATION_METHOD_AUTO_AVZ then
      begin
        RQOrderObj.rqOrderType := RQOrderType.Create;
        RQOrderObj.rqOrderType.code := 1;
        edtRQOrderTypeRqOrderTypeName.Text := 'Бюджетна';

        DisableControls([spbRQOrderTypeRqOrderType]);
      end;

      edtDateEdit.DateTime:=SysUtils.Date;
      edtDateEdit.checked := true;

      tsRQOrderItems.TabVisible := false;
      tsRQOrderDepartment.TabVisible := false;
      tsRQOrderBudget.TabVisible := false;

      tsRQBills.TabVisible := False;
      tsRQFKOrder.TabVisible := False;
  end;

  if DialogState = dsView then
  begin
     DisableControls([
       spbENDepartmentDepartmentRef
       ,spbENDepartmentBudgetRef
       ,spbRQOrderTypeRqOrderType
       ,spbRQOrderFormRqOrderForm
       ,spbRQOrderResourceRqOrderResource
       , spbDeparmentClear
       ]);

     DisableActions([actEdit, actInsert, actDelete]);

     // Откроем чекбокс "Тільки позиції "Комплектенергопоставка"" и в режиме просмотра
     // Также чекбоксы  "Відображати стовбці "Ціна" та "Сума" в звіті" и Друк заявки для введенного договору
     DisableControls([chbKEPOnly, chbPriceAndCostIsShown, chbPrintOnlyForOneAgree, chbIsInBill, chbOnlyCheckedStrings], false);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberDoc
      ,edtOrderPeriod
      ,edtDateGen
      ///
      ,edtENDepartmentDepartmentRefName
      ,edtENDepartmentBudgetRefName
      ,edtRQOrderTypeRqOrderTypeName
      ,edtRQOrderFormRqOrderFormName
      ,edtRQOrderResourceRqOrderResourceName
      ///
     ]);
     DisableControls([edtNumberProject]);
   end;

   if RQOrderObj.departmentRef <> nil then
   begin
       if RQOrderObj.departmentRef.code > LOW_INT then
           edtENDepartmentDepartmentRefName.Text := RQOrderObj.departmentRef.name;
   end;

   if RQOrderObj.budgetRef <> nil then
   begin
       if RQOrderObj.budgetRef.code > LOW_INT then
           edtENDepartmentBudgetRefName.Text := RQOrderObj.budgetRef.name;
   end;




  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    // кнопка печать Оферты ...
    //HideControls([btnPrintOffert], RQOrderObj.kindRef.code = RQORDER_KIND_DEPARTMENT);
    //HideControls([btnPrintOffert], RQOrderObj.kindRef.code = RQORDER_KIND_OE_NOPLANNED);

    if RQOrderObj.kindRef.code = RQORDER_KIND_PRODUCTION then
    begin
        HideControls([
                      gbPrintsBtn, btnPrintOffert,
                      lblExportContractNumber, edtExportContractNumber
                      , btnTDExport, btnPrintTD2Komplekt, btnCreateItems
                      ]);
        tsRQBills.TabVisible := False;
    end;

    isOrderForVRTU := false;

    if RQOrderObj.creationMethodRef.code = RQORDER_CREATION_METHOD_MANUAL then
    begin
      TempRQOrder := HTTPRIORQOrder as RQOrderControllerSoapPort;
      isOrderForVRTU := TempRQOrder.isOrderForVRTU(RQOrderObj.code);

      if isOrderForVRTU then
        lblSumLegend.Caption := '- кошторисну ціну затверджено';
    end;

    pnlCountersLegend.Visible := (RQOrderObj.creationMethodRef.code = RQORDER_CREATION_METHOD_AUTO_COUNTERS_SERVICES) or isOrderForVRTU;
    HideControls([shpSumLegendNoControl, lblSumLegendNoControl], not isOrderForVRTU);

    edtCode.Text := IntToStr(RQOrderObj.code);

    edtNumberDoc.Text := RQOrderObj.numberDoc;
    edtNumberProject.Text := RQOrderObj.numberProject;
      if RQOrderObj.orderPeriod <> nil then
      begin
        edtOrderPeriod.DateTime:=EncodeDate(RQOrderObj.orderPeriod.Year,RQOrderObj.orderPeriod.Month,RQOrderObj.orderPeriod.Day);
        edtOrderPeriod.checked := true;
      end
      else
      begin
        edtOrderPeriod.DateTime:=SysUtils.Date;
        edtOrderPeriod.checked := false;
      end;
      if RQOrderObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(RQOrderObj.dateGen.Year,RQOrderObj.dateGen.Month,RQOrderObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;
    MakeMultiline(edtCommentGen.Lines, RQOrderObj.commentGen);
    edtUserGen.Text := RQOrderObj.userGen;
      if RQOrderObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQOrderObj.dateEdit.Year,RQOrderObj.dateEdit.Month,RQOrderObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;


    if RQOrderObj.creationMethodRef <> nil then
      if RQOrderObj.creationMethodRef.code <> LOW_INT then
      begin
        TempRQOrderCreationMethod := HTTPRIORQOrderCreationMethod as RQOrderCreationMethodControllerSoapPort;
        creationMethod := TempRQOrderCreationMethod.getObject(RQOrderObj.creationMethodRef.code);

        if creationMethod <> nil then
          edtRQOrderCreationMethod.Text := creationMethod.name;
      end;

    edtRQOrderTypeRqOrderTypeName.Text := RQOrderObj.rqOrderType.name;
    edtRQOrderFormRqOrderFormName.Text := RQOrderObj.rqOrderForm.name;
    edtRQOrderResourceRqOrderResourceName.Text := RQOrderObj.rqOrderResource.name;

  end;

  DisableControls([chkGr_mat], False);
  DisableControls([edtExportContractNumber], False);
end;



procedure TfrmRQOrderEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrder: RQOrderControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if (not NoBlankValues([
      edtNumberDoc
      ,edtOrderPeriod
      ///
      ,edtRQOrderTypeRqOrderTypeName
      ,edtRQOrderFormRqOrderFormName
      ,edtRQOrderResourceRqOrderResourceName
      ///
     ]))
     {
      or
  ((RQOrderObj.kindRef.code = RQORDER_KIND_DEPARTMENT) and
   (not NoBlankValues([edtENDepartmentDepartmentRefName, edtENDepartmentBudgetRefName]))) or
  ((RQOrderObj.kindRef.code = RQORDER_KIND_BUDGET) and
   (not NoBlankValues([edtENDepartmentBudgetRefName])))
   }
  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin

    TempRQOrder := HTTPRIORQOrder as RQOrderControllerSoapPort;


     RQOrderObj.numberDoc := edtNumberDoc.Text; 

     RQOrderObj.numberProject := edtNumberProject.Text; 

     if edtorderPeriod.checked then
     begin 
       if RQOrderObj.orderPeriod = nil then
          RQOrderObj.orderPeriod := TXSDate.Create;
       RQOrderObj.orderPeriod.XSToNative(GetXSDate(edtorderPeriod.DateTime));
     end
     else
       RQOrderObj.orderPeriod := nil;

     if edtdateGen.checked then
     begin 
       if RQOrderObj.dateGen = nil then
          RQOrderObj.dateGen := TXSDate.Create;
       RQOrderObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       RQOrderObj.dateGen := nil;

     RQOrderObj.commentGen := edtCommentGen.Text; 

     RQOrderObj.userGen := edtUserGen.Text; 

     if edtdateEdit.checked then
     begin 
       if RQOrderObj.dateEdit = nil then
          RQOrderObj.dateEdit := TXSDate.Create;
       RQOrderObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       RQOrderObj.dateEdit := nil;

    if DialogState = dsInsert then
    begin
      if RQOrderObj.kindRef.code = RQORDER_KIND_OE_PLANNED_AUTO then
        if (Application.MessageBox(PChar('Сформувати планову заявку? Це може зайняти деякий час ...'), PChar('Увага !'), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2)) <> ID_YES then
          Exit;

      if RQOrderObj.creationMethodRef.code = RQORDER_CREATION_METHOD_AUTO_AVZ then
        if (Application.MessageBox(PChar('Сформувати заявку на поповнення АВЗ? Це може зайняти деякий час ...'), PChar('Увага !'), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2)) <> ID_YES then
          Exit;

      RQOrderObj.code:=low(Integer);
{
      if RQOrderObj.kindRef.code = RQORDER_KIND_DEPARTMENT then
         TempRQOrder.addDepartment(RQOrderObj)
      else
      if RQOrderObj.kindRef.code = RQORDER_KIND_BUDGET then
         TempRQOrder.addBudget(RQOrderObj)
      else
      if RQOrderObj.kindRef.code = RQORDER_KIND_OE then
         TempRQOrder.addOE(RQOrderObj)
      else
      begin
}
      if RQOrderObj.kindRef.code = RQORDER_KIND_OE_PLANNED_AUTO then
         TempRQOrder.addOEPlannedAuto(RQOrderObj)
      else
      if RQOrderObj.kindRef.code = RQORDER_KIND_OE_NOPLANNED then
      begin
        if RQOrderObj.creationMethodRef.code = RQORDER_CREATION_METHOD_MANUAL then
          TempRQOrder.addOENoPlanned(RQOrderObj)
        else if RQOrderObj.creationMethodRef.code = RQORDER_CREATION_METHOD_AUTO_AVZ then
          TempRQOrder.addReplenishmentAVZ(RQOrderObj, rgRestPurposeType.ItemIndex = 0)
        else
          raise Exception.Create('Невідомий метод створення заявки!');
      end
      else
        if RQOrderObj.kindRef.code = RQORDER_KIND_OE_PLANNED_SERVICES then
         TempRQOrder.addOEPlannedServices(RQOrderObj)
      else
        if RQOrderObj.kindRef.code = RQORDER_KIND_OE_NOPLANNED_SERVICES then
         TempRQOrder.addOENOPlannedServices(RQOrderObj)
      else
      if RQOrderObj.kindRef.code = RQORDER_KIND_PRODUCTION then
         TempRQOrder.addProduction(RQOrderObj)
      else
          ShowMessage('Error in RQOrderObj.kind ...');
      //end;
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQOrder.save(RQOrderObj);
    end;
  end;
end;


procedure TfrmRQOrderEdit.spbENDepartmentDepartmentRefClick(Sender : TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
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
               if RQOrderObj.departmentRef = nil then RQOrderObj.departmentRef := ENDepartment.Create();
               RQOrderObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentRefName.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;



procedure TfrmRQOrderEdit.spbENDepartmentBudgetRefClick(Sender : TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin

   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.typeRef := ENDepartmentTypeRef.Create;
   f.typeRef.code := ENDEPARTMENTTYPE_BUDGET;
   f.conditionSQL := ' parentrefcode is null';

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal,f);
   try
      with frmENDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               if RQOrderObj.budgetRef = nil then RQOrderObj.budgetRef := ENDepartment.Create();
               //RQOrderObj.departmentRef.code := StrToInt(GetReturnValue(sgENDepartment,0));
               //edtENDepartmentDepartmentRefName.Text:=GetReturnValue(sgENDepartment,1);
               RQOrderObj.budgetRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentBudgetRefName.Text:=ENDepartmentShort(tvDep.Selected.Data).shortName ;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;
end;



procedure TfrmRQOrderEdit.spbRQOrderTypeRqOrderTypeClick(Sender : TObject);
var 
   frmRQOrderTypeShow: TfrmRQOrderTypeShow;
begin
   frmRQOrderTypeShow:=TfrmRQOrderTypeShow.Create(Application,fmNormal);
   try
      with frmRQOrderTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if RQOrderObj.rqOrderType = nil then RQOrderObj.rqOrderType := RQOrderType.Create();
               RQOrderObj.rqOrderType.code := StrToInt(GetReturnValue(sgRQOrderType,0));
               edtRQOrderTypeRqOrderTypeName.Text:=GetReturnValue(sgRQOrderType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQOrderTypeShow.Free;
   end;
end;



procedure TfrmRQOrderEdit.spbRQOrderFormRqOrderFormClick(Sender : TObject);
var 
   frmRQOrderFormShow: TfrmRQOrderFormShow;
begin
   frmRQOrderFormShow:=TfrmRQOrderFormShow.Create(Application,fmNormal);
   try
      with frmRQOrderFormShow do
        if ShowModal = mrOk then
        begin
            try
               if RQOrderObj.rqOrderForm = nil then RQOrderObj.rqOrderForm := RQOrderForm.Create();
               RQOrderObj.rqOrderForm.code := StrToInt(GetReturnValue(sgRQOrderForm,0));
               edtRQOrderFormRqOrderFormName.Text:=GetReturnValue(sgRQOrderForm,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQOrderFormShow.Free;
   end;
end;



procedure TfrmRQOrderEdit.spbRQOrderResourceRqOrderResourceClick(Sender : TObject);
var 
   frmRQOrderResourceShow: TfrmRQOrderResourceShow;
begin
   frmRQOrderResourceShow:=TfrmRQOrderResourceShow.Create(Application,fmNormal);
   try
      with frmRQOrderResourceShow do
        if ShowModal = mrOk then
        begin
            try
               if RQOrderObj.rqOrderResource = nil then RQOrderObj.rqOrderResource := RQOrderResource.Create();
               RQOrderObj.rqOrderResource.code := StrToInt(GetReturnValue(sgRQOrderResource,0));
               edtRQOrderResourceRqOrderResourceName.Text:=GetReturnValue(sgRQOrderResource,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQOrderResourceShow.Free;
   end;
end;



procedure TfrmRQOrderEdit.pcRQOrderChange(Sender: TObject);
Var i, j: Integer;
begin

{
 for i:=1 to sgRQOrderItem.RowCount-1 do
   for j:=0 to sgRQOrderItem.ColCount-1 do
     sgRQOrderItem.Cells[j,i]:='';
 sgRQOrderItem.RowCount := 2;
 //sgRQOrderItem.RemoveCheckBox(3, 1);
 sgRQOrderItem.RemoveCheckBox(MATERIAL_COL_NUMBER, 1);
 }
 
{
 for i:=1 to sgRQOrderDepartment.RowCount-1 do
   for j:=0 to sgRQOrderDepartment.ColCount-1 do
     sgRQOrderDepartment.Cells[j,i]:='';

 for i:=1 to sgRQOrderBudget.RowCount-1 do
   for j:=0 to sgRQOrderBudget.ColCount-1 do
     sgRQOrderBudget.Cells[j,i]:='';
}
 // Если переходят на вкладку "Строки заявки", то лист
 // с введенными данными уничтожается и данные для отчета
 // нужно будет заносить заново
  if (pcRQOrder.ActivePage = tsRQOrderItems) then  selectedItemsList := nil;
 if (pcRQOrder.ActivePage = tsRQOrderItems) and (Sender = pcRQOrder) then
 begin

  // Если поставлен флажок "Тільки за відміченними строками", то строки
  // отфильтруются по этому номеру договора
  if chbOnlyCheckedStrings.Checked then
  begin
    contractNumber := edtExportContractNumber.Text;
    if Length(contractNumber) = 0 then
    begin
      pcRQOrder.ActivePage := tsRQOrder;
      Application.MessageBox(PChar('Введіть № договору (для експорту)!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      Exit;
    end;
  end;
 end;

 if ((pcRQOrder.ActivePage = tsRQBills) or (pcRQOrder.ActivePage = tsRQOrder)) then
      selectedItemIndex := sgRQOrderItem.Row;

  if pcRQOrder.ActivePage = tsRQOrderItems then
    DisableActions([actChangeStatusOrderItem] , false )
  else
    DisableActions([actChangeStatusOrderItem] );

  UpdateGrid(Sender);
end;


procedure TfrmRQOrderEdit.UpdateGrid(Sender: TObject);
var
  i, j : Integer;

  TempRQOrderItem: RQOrderItemControllerSoapPort;
  RQOrderItemList: RQOrderItemShortList;
  //RQOrderItemFilterObj : RQOrderItemFilter;

  TempRQOrder: RQOrderControllerSoapPort;
  RQOrderList: RQOrderShortList;
  RQOrderFilterObj : RQOrderFilter;

  totalSum, itemSum, totalSumBills, itemSumBills : Double;
  condition, strOrderItemsCodes : String;

  TempRQBill: RQBillControllerSoapPort;
  RQBillList: RQBillShortList;
  RQBillFilterObj: RQBillFilter;
  state, selected : Boolean;

  TempRQFKOrder : RQFKOrderControllerSoapPort;
  RQFKOrderList : RQFKOrderShortList;
  fkOrderFilter : RQFKOrderFilter;

begin
//
//----------------- tsRQOrderItems
  if pcRQOrder.ActivePage = tsRQOrderItems then
  begin

      for i:=1 to sgRQOrderItem.RowCount-1 do
        for j:=0 to sgRQOrderItem.ColCount-1 do
          sgRQOrderItem.Cells[j,i]:='';
      sgRQOrderItem.RowCount := 2;
      sgRQOrderItem.RemoveCheckBox(MATERIAL_COL_NUMBER, 1);

      totalSum := 0;
      FormatSettings.DecimalSeparator := '.';

      sgRQOrderItem.SetFocus;

      TempRQOrderItem :=  HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;

      {
      if RQOrderItemFilterObj = nil then
      begin
        RQOrderItemFilterObj := RQOrderItemFilter.Create;
        SetNullIntProps(RQOrderItemFilterObj);
        SetNullXSProps(RQOrderItemFilterObj);

        if materialGroupCode > LOW_INT then
          RQOrderItemFilterObj.conditionSQL := 'tkmaterials.rootgrouprefcode = ' + IntToStr(materialGroupCode);
      end;

      RQOrderItemFilterObj.orderRef := RQOrderRef.Create;
      RQOrderItemFilterObj.orderRef.code := RQOrderObj.code;

      if materialGroupCode > LOW_INT then
      begin
        condition := RQOrderItemFilterObj.conditionSQL; //'tkmaterials.rootgrouprefcode = ' + IntToStr(materialGroupCode);
        AddCondition(condition, 'tkmaterials.rootgrouprefcode = ' + IntToStr(materialGroupCode));
        RQOrderItemFilterObj.conditionSQL := condition;
      end;

      RQOrderItemFilterObj.orderBySQL := 'TKMATERIALS.NAME';
      }

      BuildRQOrderItemFilter;

      RQOrderItemList := TempRQOrderItem.getScrollableFilteredList(RQOrderItemFilterObj,0,-1);

      //LastCount:=High(RQOrderItemList.list);

      if High(RQOrderItemList.list) > -1 then
         sgRQOrderItem.RowCount:=High(RQOrderItemList.list)+2
      else
         sgRQOrderItem.RowCount:=2;

       with sgRQOrderItem do
        for i:=0 to High(RQOrderItemList.list) do
          begin
            Application.ProcessMessages;

            { // 28.08.13 Что ж это мы красим в серый, а потом во втором ифе перекрашиваем опять в белый???
            if RQOrderItemList.list[i].statusRefCode = RQORDERITEM_STATUS_CANCELED then
               sgRQOrderItem.RowColor[i + 1] := clSilver
            else
               sgRQOrderItem.RowColor[i + 1] := clWindow;

            if RQOrderItemList.list[i].isPaid = RQORDERITEM_STATE_PAID then
               sgRQOrderItem.RowColor[i + 1] := clYellow
            else
               sgRQOrderItem.RowColor[i + 1] := clWindow;
            }
            {
            if RQOrderItemList.list[i].statusRefCode = RQORDERITEM_STATUS_CANCELED then
               sgRQOrderItem.RowColor[i + 1] := clSilver
            else if RQOrderItemList.list[i].isPaid = RQORDERITEM_STATE_PAID then
               sgRQOrderItem.RowColor[i + 1] := clYellow
            else
               sgRQOrderItem.RowColor[i + 1] := clWindow;
            }
            if RQOrderItemList.list[i].isPaid = RQORDERITEM_STATE_PAID then
               sgRQOrderItem.RowColor[i + 1] := clYellow
            else if RQOrderItemList.list[i].statusRefCode = RQORDERITEM_STATUS_CANCELED then
               sgRQOrderItem.RowColor[i + 1] := clSilver
            else
               sgRQOrderItem.RowColor[i + 1] := clWindow;

            if RQOrderItemList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(RQOrderItemList.list[i].code)
            else
            Cells[0,i+1] := '';

            Cells[1,i+1] := IntToStr(i + 1);




            // Выделим привязанные материалы жирным
            if RQOrderItemList.list[i].axMaterialsRefCode > LOW_INT then
            begin
              //Cells[1,i+1] := Cells[1,i+1] + '*';
              //sgRQOrderItem.CellProperties[2,i+1].BrushStyle := bsSolid;
              //sgRQOrderItem.CellProperties[2,i+1].BorderWidth := 4;
              CellProperties[4,i+1].FontStyle := CellProperties[4,i+1].FontStyle + [fsBold];
            end;

            Cells[2,i+1] := RQOrderItemList.list[i].ddsCodesTxtCode;

            //if RQOrderItemList.list[i].axMaterialsRefCode > LOW_INT then
            //  sgRQOrderItem.Colors[2,i+1] := $0080FF80;

            Cells[3,i+1] := RQOrderItemList.list[i].budgetRefShortName;

            AddCheckBox(MATERIAL_COL_NUMBER, i+1, false, false);

            Cells[4,i+1] :=  RQOrderItemList.list[i].materialName + ' (код ДК: ' + RQOrderItemList.list[i].materialIdentId + ')';
            Cells[5,i+1] :=  RQOrderItemList.list[i].measurementName;

            //Cells[6,i+1] := RQOrderItemList.list[i].materialNameTxt;
            //Cells[7,i+1] := RQOrderItemList.list[i].measurementNameTxt;


            if RQOrderItemList.list[i].countFact = nil then
              Cells[6,i+1] := ''
            else
              //Cells[7,i+1] := RQOrderItemList.list[i].countFact.DecimalString;
              Cells[6,i+1] := SeparateThousands(RQOrderItemList.list[i].countFact.DecimalString);

            Alignments[6, i + 1] := taRightJustify;

            if RQOrderItemList.list[i].priceWithNds = nil then
              Cells[7,i+1] := ''
            else
              //Cells[8,i+1] := RQOrderItemList.list[i].priceWithNds.DecimalString;
              Cells[7,i+1] := SeparateThousands(RQOrderItemList.list[i].priceWithNds.DecimalString);

            Alignments[7, i + 1] := taRightJustify;
            Colors[7, i + 1] := $0080FF80;

            /////
            itemSum := 0;

            if RQOrderItemList.list[i].sumGen = nil then
              Cells[8,i+1] := ''
            else begin
              //Cells[8,i+1] := RQOrderItemList.list[i].sumGen.DecimalString;
              Cells[8,i+1] := SeparateThousands(RQOrderItemList.list[i].sumGen.DecimalString);
              try
                itemSum := StrToFloat(RQOrderItemList.list[i].sumGen.DecimalString);
              except
                itemSum := 0;
              end;
            end;

            Alignments[8, i + 1] := taRightJustify;

            /// Если по строке заявки на закупку счетчиков цена утверждена, выделяем сумму цветом
            /// (или если по строке заявки ВРТУ утверждена сметная цена)
            if RQOrderItemList.list[i].approvedCostStatusCode = RQAPPROVEDCOST_APPROVED then
              Colors[8, i + 1] := $0080FF80;
            ///

            /// Если по строке заявки ВРТУ сметная цена утверждена без контроля цены приобретения
            if RQOrderItemList.list[i].approvedCostStatusCode = RQAPPROVEDCOST_APPROVED_NO_CONTROL then
              Colors[8, i + 1] := $F0CAA6;
            ///

            totalSum := totalSum + itemSum;
            /////


            if RQOrderItemList.list[i].deliveryTime = LOW_INT then
              Cells[9, i+1] := ''
            else
              Cells[9, i+1] := IntToStr(RQOrderItemList.list[i].deliveryTime);


            if RQOrderItemList.list[i].plannedDatePays = nil then
                Cells[10, i+1] := ''
            else
                Cells[10, i+1] := DateToStr ( EncodeDate(RQOrderItemList.list[i].plannedDatePays.Year,RQOrderItemList.list[i].plannedDatePays.Month,RQOrderItemList.list[i].plannedDatePays.Day) );

            if RQOrderItemList.list[i].plannedDateDelivery = nil then
                Cells[11, i+1] := ''
            else
                Cells[11, i+1] := DateToStr ( EncodeDate(RQOrderItemList.list[i].plannedDateDelivery.Year,RQOrderItemList.list[i].plannedDateDelivery.Month,RQOrderItemList.list[i].plannedDateDelivery.Day) );




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
              Cells[12,i+1] := ''
            else
              Cells[12,i+1] := RQOrderItemList.list[i].countGen.DecimalString;

            Cells[13,i+1] := RQOrderItemList.list[i].orgName;

            if RQOrderItemList.list[i].contractDate <> nil then
              Cells[14, i+1] := RQOrderItemList.list[i].contractNumber + ' від ' + DateToStr ( EncodeDate(RQOrderItemList.list[i].contractDate.Year,RQOrderItemList.list[i].contractDate.Month,RQOrderItemList.list[i].contractDate.Day) )
            else begin
              ///// 23.12.10
              // Разрешаем вводить руками (не выбирая из ФК)!
              //Cells[14, i+1] := '';
              Cells[14, i+1] := RQOrderItemList.list[i].contractNumber;
            end;

            Cells[15,i+1] := RQOrderItemList.list[i].agreeDocNum;
            Cells[16,i+1] := RQOrderItemList.list[i].responsiblesRefFIO;
						Cells[17,i+1] := RQOrderItemList.list[i].commentGen;
						Cells[18,i+1] := RQOrderItemList.list[i].typePayRefName ;

						if RQOrderItemList.list[i].paymentValue <> Low(Integer) then

						Cells[19,i+1] := IntToStr(RQOrderItemList.list[i].paymentValue)
						else
						Cells[19,i+1] := '';

            Cells[20,i+1] := RQOrderItemList.list[i].purchaseInfoByOrderItem;

            Objects[1,i+1] := TObject(RQOrderItemList.list[i].materialCode);

            Objects[2,i+1] := TObject(RQOrderItemList.list[i].approvedCostStatusCode);

            //LastRow:=i+1;
            sgRQOrderItem.RowCount:=High(RQOrderItemList.list)+2;

          end;
       //ColCount:=ColCount+1;
       if selectedItemIndex <> 0 then
        begin
        if sgRQOrderItem.RowCount > selectedItemIndex then
           sgRQOrderItem.Row := selectedItemIndex
        else
           sgRQOrderItem.Row := sgRQOrderItem.RowCount - 1;
        end
        else
        sgRQOrderItem.Row:=1;

    pnlTotalSum.Caption := SeparateThousands(FloatToStr(Conv(totalSum, 2)));
  end;
// END ---------------------- tsRQOrderItems


{

// ---------   tsRQOrderDepartment  -----------------
  if pcRQOrder.ActivePage = tsRQOrderDepartment then
  begin
       SetGridHeaders(RQOrderDepartmentHeaders, sgRQOrderDepartment.ColumnHeaders);

       TempRQOrder :=  HTTPRIORQOrder as RQOrderControllerSoapPort;

       RQOrderFilterObj := RQOrderFilter.Create;
       SetNullXSProps(RQOrderFilterObj);
       SetNullIntProps(RQOrderFilterObj);

       //RQOrderFilterObj.budgetRef := ENDepartment.Create;
       //RQOrderFilterObj.budgetRef.code := RQOrderObj.budgetRef.code;
       RQOrderFilterObj.kindRef := RQOrderKindRef.Create;
       RQOrderFilterObj.kindRef.code := RQORDER_KIND_DEPARTMENT;

       if (RQOrderObj.kindRef.code = RQORDER_KIND_OE) then
          RQOrderFilterObj.conditionSQL := 'rqorder.code in (select dep.orderincode from rqorder2order dep , rqorder2order budg where dep.orderoutcode = budg.orderincode and budg.orderoutcode = '+ IntToStr(RQOrderObj.code) +')';

       if (RQOrderObj.kindRef.code = RQORDER_KIND_BUDGET) then
          RQOrderFilterObj.conditionSQL := 'rqorder.code in (select rqorder2order.orderincode from rqorder2order where rqorder2order.orderoutcode = '+ IntToStr(RQOrderObj.code) +')';


       RQOrderList := TempRQOrder.getScrollableFilteredList(RQOrderFilterObj,0,-1);

      //LastCount:=High(RQOrderList.list);

      if High(RQOrderList.list) > -1 then
         sgRQOrderDepartment.RowCount:=High(RQOrderList.list)+2
      else
         sgRQOrderDepartment.RowCount:=2;

       with sgRQOrderDepartment do
        for i:=0 to High(RQOrderList.list) do
          begin

            if RQOrderList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(RQOrderList.list[i].code)
            else
            Cells[0,i+1] := '';
            Cells[1,i+1] := RQOrderList.list[i].numberDoc;
            Cells[2,i+1] := RQOrderList.list[i].numberProject;
            if RQOrderList.list[i].orderPeriod  = nil then
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
            Cells[10, i + 1] := RQOrderList.list[i].statusRefName;

            Cells[11,i+1] := RQOrderList.list[i].userGen;

            sgRQOrderDepartment.RowCount:=High(RQOrderList.list)+2;
          end;
       sgRQOrderDepartment.Row:=1;


  end;
// --------- end  tsRQOrderDepartment  -----------------

}

{
// ---------   tsRQOrderBudget  -----------------
  if pcRQOrder.ActivePage = tsRQOrderBudget then
  begin
       SetGridHeaders(RQOrderDepartmentHeaders, sgRQOrderBudget.ColumnHeaders);
       // для заявок бюджетодержателей прячем столбец "Підрозділ" (он все равно пустой)
       sgRQOrderBudget.ColWidths[DEPARTMENT_COL_NUMBER] := 0;

       TempRQOrder :=  HTTPRIORQOrder as RQOrderControllerSoapPort;

       RQOrderFilterObj := RQOrderFilter.Create;
       SetNullXSProps(RQOrderFilterObj);
       SetNullIntProps(RQOrderFilterObj);

       //RQOrderFilterObj.budgetRef := ENDepartment.Create;
       //RQOrderFilterObj.budgetRef.code := RQOrderObj.budgetRef.code;

       RQOrderFilterObj.kindRef := RQOrderKindRef.Create;
       RQOrderFilterObj.kindRef.code := RQORDER_KIND_BUDGET;
       RQOrderFilterObj.conditionSQL := 'rqorder.code in (select rqorder2order.orderincode from rqorder2order where rqorder2order.orderoutcode = '+ IntToStr(RQOrderObj.code) +')';

       RQOrderList := TempRQOrder.getScrollableFilteredList(RQOrderFilterObj,0,-1);

      //LastCount:=High(RQOrderList.list);

      if High(RQOrderList.list) > -1 then
         sgRQOrderBudget.RowCount:=High(RQOrderList.list)+2
      else
         sgRQOrderBudget.RowCount:=2;

       with sgRQOrderBudget do
        for i:=0 to High(RQOrderList.list) do
          begin

            if RQOrderList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(RQOrderList.list[i].code)
            else
            Cells[0,i+1] := '';
            Cells[1,i+1] := RQOrderList.list[i].numberDoc;
            Cells[2,i+1] := RQOrderList.list[i].numberProject;
            if RQOrderList.list[i].orderPeriod  = nil then
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
            Cells[10, i + 1] := RQOrderList.list[i].statusRefName;

            Cells[11,i+1] := RQOrderList.list[i].userGen;

            sgRQOrderBudget.RowCount:=High(RQOrderList.list)+2;
          end;
       sgRQOrderBudget.Row:=1;


  end;
// --------- end  tsRQOrderBudget  -----------------
}


  //----------------- tsRQBills
  if pcRQOrder.ActivePage = tsRQBills then
  begin

      for i := 1 to sgRQOrderItem.RowCount - 1 do
      begin
        sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER, i, selected);
        if selected then break;
      end;

      strOrderItemsCodes := '';
      state := false;

      for i := 1 to sgRQOrderItem.RowCount - 1 do
      begin
        sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER, i, state);
        if state then
          AddListPos(strOrderItemsCodes, sgRQOrderItem.Cells[0, i]);
      end;

      //totalSum := 0;
      FormatSettings.DecimalSeparator := '.';

      SetGridHeaders(RQBillHeaders, sgRQBill.ColumnHeaders);

      for i:=1 to sgRQBill.RowCount-1 do
        for j:=0 to sgRQBill.ColCount-1 do
          sgRQBill.Cells[j,i]:='';
      sgRQBill.RowCount := 2;

      RQBillFilterObj := RQBillFilter.Create;
      SetNullIntProps(RQBillFilterObj);
      SetNullXSProps(RQBillFilterObj);

      if (strOrderItemsCodes <> '') then
      RQBillFilterObj.conditionSQL :=
         'RQBILL.CODE in (select distinct bi.billrefcode from rqbillitem bi where bi.code in ( ' +
         ' select b2o.billitemrefcode from rqbillitem2orderitem b2o ' +
         ' where b2o.orderitemrefcode in (' + strOrderItemsCodes + ')))'
      else
      RQBillFilterObj.conditionSQL :=
         'RQBILL.CODE in (SELECT RQORDER2BILL.BILLREFCODE FROM RQORDER2BILL ' +
         ' WHERE RQORDER2BILL.ORDERREFCODE = ' + IntToStr(RQOrderObj.code) + ')';

      TempRQBill := HTTPRIORQBill as RQBillControllerSoapPort;

      RQBillList := TempRQBill.getScrollableFilteredList(RQBillFilterObj, 0, -1);

      //LastCount:=High(RQBillList.list);

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

          /////
          itemSumBills := 0;

          if RQBillList.list[i].sumGen = nil then
            Cells[4,i+1] := ''
          else begin
            Cells[4,i+1] := SeparateThousands(RQBillList.list[i].sumGen.DecimalString);
            try
              itemSumBills := StrToFloat(RQBillList.list[i].sumGen.DecimalString);
            except
              itemSumBills := 0;
            end;
          end;

          totalSumBills := totalSumBills + itemSumBills;
          /////

          {
          if RQBillList.list[i].sumGen = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := SeparateThousands(RQBillList.list[i].sumGen.DecimalString);
          }

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

    pnlTotalSumBills.Caption := SeparateThousands(FloatToStr(Conv(totalSumBills, 2)));
  end;
  // END ---------------------- tsRQBills

  //----------------- tsRQFKOrder
  if (pcRQOrder.ActivePage = tsRQFKOrder) then
  begin

    for i := 1 to sgRQOrderItem.RowCount - 1 do
    begin
      sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER, i, selected);
      if selected then break;
    end;

    strOrderItemsCodes := '';
    state := false;

    for i := 1 to sgRQOrderItem.RowCount - 1 do
    begin
      sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER, i, state);
      if state then
        AddListPos(strOrderItemsCodes, sgRQOrderItem.Cells[0, i]);
    end;

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

    if (strOrderItemsCodes <> '') then
      fkOrderFilter.conditionSQL :=
      ' rqfkorder.code in (select foi.fkorderrefcode from rqfkorderitem foi where foi.code in (' +
      ' select foi2ei.fkorderitemrefcode from rqfkorderitem2enstmttm foi2ei where foi2ei.estimateitemcode in ( ' +
      ' select oi2ei.estimateitemcode from rqorderitem2enestimttm oi2ei where oi2ei.orderitemcode in ( ' + strOrderItemsCodes + ' ) ) ) )'
    else
      fkOrderFilter.conditionSQL :=
      ' rqfkorder.code in (select foi.fkorderrefcode from rqfkorderitem foi where foi.code in (' +
      ' select foi2ei.fkorderitemrefcode from rqfkorderitem2enstmttm foi2ei where foi2ei.estimateitemcode in ( ' +
      ' select oi2ei.estimateitemcode from rqorderitem2enestimttm oi2ei where oi2ei.orderitemcode in ( ' +
      ' select oi.code from rqorderitem oi where oi.orderrefcode = ' + IntToStr(RQOrderObj.code) + ' ) ) ) )';

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

  //--------------------------- tsRQOffers
  if (pcRQOrder.ActivePage = tsRQOffers) then
  begin
    UpdateOfferItemsList;
    UpdateOffersList;
  end;
  // END ---------------------- tsRQOffers
end;


procedure TfrmRQOrderEdit.UpdateItemGrid();
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


procedure TfrmRQOrderEdit.UpdateOfferItemsList;
var
  TempRQOfferItem: RQOfferItemControllerSoapPort;
  i, j, LastCount: Integer;
  RQOfferItemList: RQOfferItemShortList;
begin
  ClearGrid(sgRQOfferItem);

  if DialogState = dsInsert then Exit;

  TempRQOfferItem := HTTPRIORQOfferItem as RQOfferItemControllerSoapPort;

  RQOfferItemList := TempRQOfferItem.getOfferItemsListForOrder(RQOrderObj.code);

  LastCount := High(RQOfferItemList.list);

  if LastCount > -1 then
     sgRQOfferItem.RowCount := LastCount + 2
  else
     sgRQOfferItem.RowCount := 2;

  with sgRQOfferItem do
    for i := 0 to LastCount do
    begin
      (*
        Application.ProcessMessages;
        if RQOfferItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQOfferItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQOfferItemList.list[i].materialNameGen;
        Cells[2,i+1] := RQOfferItemList.list[i].measurementNameGen;
        Cells[3,i+1] := RQOfferItemList.list[i].materialNameOffer;
        Cells[4,i+1] := RQOfferItemList.list[i].measurementNameOffer;
        Cells[5,i+1] := RQOfferItemList.list[i].ddsTxtCode;
        if RQOfferItemList.list[i].countFact = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := RQOfferItemList.list[i].countFact.DecimalString;
        if RQOfferItemList.list[i].priceWithoutNds = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := RQOfferItemList.list[i].priceWithoutNds.DecimalString;
        if RQOfferItemList.list[i].priceWithNds = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := RQOfferItemList.list[i].priceWithNds.DecimalString;

        {
        if RQOfferItemList.list[i].sumWithoutNds = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := RQOfferItemList.list[i].sumWithoutNds.DecimalString;
        if RQOfferItemList.list[i].sumGen = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := RQOfferItemList.list[i].sumGen.DecimalString;
        }
        Cells[9,i+1] := RQOfferItemList.list[i].offerRefOrgName;
        Cells[10,i+1] := RQOfferItemList.list[i].offerRefEmail;

        Cells[11,i+1] := RQOfferItemList.list[i].commentGen;
        if RQOfferItemList.list[i].plannedDateDelivery = nil then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := XSDate2String(RQOfferItemList.list[i].plannedDateDelivery);
        Cells[13,i+1] := RQOfferItemList.list[i].userAdd;
        if RQOfferItemList.list[i].dateAdd = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := XSDateTimeWithDate2String(RQOfferItemList.list[i].dateAdd);
        Cells[15,i+1] := RQOfferItemList.list[i].userGen;
        if RQOfferItemList.list[i].dateEdit = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := XSDateTimeWithDate2String(RQOfferItemList.list[i].dateEdit);
        sgRQOfferItem.RowCount:=i+2;
      *)

{
        ( 'Код'
          ,'Постачальник'
          ,'E-mail'
          ,'Код РГК'
          ,'Назва матеріалу'
          ,'Од. виміру'
          ,'Кількість'
          ,'Ціна з ПДВ'
          ,'Планова дата постачання'
        );
}
      Application.ProcessMessages;
      if RQOfferItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQOfferItemList.list[i].code)
      else
        Cells[0,i+1] := '';

      Cells[1,i+1] := RQOfferItemList.list[i].offerRefOrgName;
      Cells[2,i+1] := RQOfferItemList.list[i].offerRefEmail;

      if RQOfferItemList.list[i].code = Low(Integer) then
      begin
        Cells[3,i+1] := RQOfferItemList.list[i].ddsTxtCode;
        Cells[4,i+1] := RQOfferItemList.list[i].materialNameGen;
        Cells[5,i+1] := RQOfferItemList.list[i].measurementNameGen;

        if RQOfferItemList.list[i].countFact = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := SeparateThousands(RQOfferItemList.list[i].countFact.DecimalString);

        Alignments[6, i + 1] := taRightJustify;

        //CellProperties[3,i+1].FontStyle := CellProperties[3,i+1].FontStyle + [fsBold];
        for j := 0 to ColCount - 1 do
          CellProperties[j, i + 1].FontStyle := CellProperties[j, i + 1].FontStyle + [fsBold];
      end
      else begin
        AddCheckBox(1, i + 1, false, false);

        Cells[3,i+1] := '';
        Cells[4,i+1] := RQOfferItemList.list[i].materialNameOffer;
        Cells[5,i+1] := RQOfferItemList.list[i].measurementNameOffer;
        Cells[6,i+1] := '';

        //CellProperties[3,i+1].FontStyle := CellProperties[3,i+1].FontStyle - [fsBold];
        for j := 0 to ColCount - 1 do
          CellProperties[j, i + 1].FontStyle := CellProperties[j, i + 1].FontStyle - [fsBold];
      end;

      if RQOfferItemList.list[i].priceWithNds = nil then
        Cells[7,i+1] := ''
      else
        Cells[7,i+1] := SeparateThousands(RQOfferItemList.list[i].priceWithNds.DecimalString);

      Alignments[7, i + 1] := taRightJustify;
      Colors[7, i + 1] := $0080FF80;

      if RQOfferItemList.list[i].plannedDateDelivery = nil then
        Cells[8,i+1] := ''
      else
        Cells[8,i+1] := XSDate2String(RQOfferItemList.list[i].plannedDateDelivery);

      Objects[0,i+1] := TObject(RQOfferItemList.list[i].offerRefCode);
      Objects[1,i+1] := TObject(RQOfferItemList.list[i].orderItemRefCode);
    end;

   sgRQOfferItem.Row := 1;
end;

procedure TfrmRQOrderEdit.UpdateOffersList;
var
  TempRQOffer: RQOfferControllerSoapPort;
  i, j, LastCount: Integer;
  RQOfferList: RQOfferShortList;
  offerFilter: RQOfferFilter;
begin
  ClearGrid(sgRQOffer);

  if DialogState = dsInsert then Exit;

  TempRQOffer := HTTPRIORQOffer as RQOfferControllerSoapPort;

  offerFilter := RQOfferFilter.Create;
  SetNullIntProps(offerFilter);
  SetNullXSProps(offerFilter);

  offerFilter.orderRef := RQOrderRef.Create;
  offerFilter.orderRef.code := RQOrderObj.code;

  RQOfferList := TempRQOffer.getScrollableFilteredList(offerFilter, 0, -1);

  LastCount := High(RQOfferList.list);

  if LastCount > -1 then
    sgRQOffer.RowCount := LastCount + 2
  else
    sgRQOffer.RowCount := 2;

  with sgRQOffer do
    for i := 0 to LastCount do
    begin
      Application.ProcessMessages;

      if RQOfferList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQOfferList.list[i].code)
      else
        Cells[0,i+1] := '';
      //Cells[1,i+1] := RQOfferList.list[i].numberDoc;
      //Cells[2,i+1] := RQOfferList.list[i].numberProject;

      Cells[1,i+1] := RQOfferList.list[i].orgRefName;

      AddCheckBox(1, i + 1, false, false);

      for j := 0 to ColCount - 1 do
        CellProperties[j, i + 1].FontStyle := CellProperties[j, i + 1].FontStyle - [fsBold];

      Cells[2,i+1] := RQOfferList.list[i].email;

      Cells[3,i+1] := RQOfferList.list[i].statusRefName;

      Cells[4,i+1] := RQOfferList.list[i].userAdd;
      if RQOfferList.list[i].dateAdd = nil then
        Cells[5,i+1] := ''
      else
        Cells[5,i+1] := XSDateTimeWithDate2String(RQOfferList.list[i].dateAdd);

      Cells[6,i+1] := RQOfferList.list[i].userGen;
      if RQOfferList.list[i].dateEdit = nil then
        Cells[7,i+1] := ''
      else
        Cells[7,i+1] := XSDateTimeWithDate2String(RQOfferList.list[i].dateEdit);

      sgRQOffer.RowCount := i + 2;
   end;

   sgRQOffer.Row := 1;
end;

procedure TfrmRQOrderEdit.edtOrderPeriodExit(Sender: TObject);
var
tmpDate : TDateTime;
begin
  inherited;
  tmpDate := edtOrderPeriod.DateTime ; //EncodeDate(ENActObj.dateGen.Year,ENActObj.dateGen.Month,ENActObj.dateGen.Day);
  edtOrderPeriod.DateTime := EncodeDate( YearOf(tmpDate) , MonthOf(tmpDate) ,1); ; //firstDay(tmpDate);
end;

procedure TfrmRQOrderEdit.actUncheckAllOfferItemsExecute(Sender: TObject);
begin
  CheckGrid(sgRQOfferItem, 1, false);
end;

procedure TfrmRQOrderEdit.actUpdateExecute(Sender: TObject);
begin
  pcRQOrderChange(Sender);
end;

procedure TfrmRQOrderEdit.actUpdateOfferExecute(Sender: TObject);
begin
  UpdateOffersList;
end;

procedure TfrmRQOrderEdit.actUpdateOfferItemExecute(Sender: TObject);
begin
  UpdateOfferItemsList;
end;

procedure TfrmRQOrderEdit.actInsertExecute(Sender: TObject);
var
 i, j: Integer;

 // TempRQOrderItem: RQOrderItemControllerSoapPort;
 frmMaterialsParametersOutEdit: TfrmMaterialsParametersOutEdit;

 f : RQOrderFilter;
 TempRQOrder_: RQOrderControllerSoapPort;
 RQOrderList: RQOrderShortList;
 frmOrderShow : TfrmRQOrderShow;

 // countFact : TXSDecimal;
begin


//---------------------------------
//--------  tsRQOrderItems

    if pcRQOrder.ActivePage = tsRQOrderItems then
    begin
       {
       if RQOrderObj.kindRef.code <> RQORDER_KIND_DEPARTMENT then
       begin
           ShowMessage('Матреіали додаються тільки у заявку Підрозділів ...??');
           exit;
       end;
       }


       if RQOrderObj.kindRef.code in [RQORDER_KIND_OE_PLANNED_AUTO, RQORDER_KIND_OE_PLANNED_SERVICES] then
       begin
        ShowMessage('Додавати вручну можна тільки на позаплановій заявці ...');
        Exit;
       end;

      if (RQOrderObj.creationMethodRef.code = ENConsts.RQORDER_CREATION_METHOD_AUTO_AVZ) then
      begin
        frmAddMaterialToAVZOrderEdit := TfrmAddMaterialToAVZOrderEdit.Create(Application, dsInsert);

        try
          frmAddMaterialToAVZOrderEdit.orderCode := RQOrderObj.code;
          SetFloatStyle(frmAddMaterialToAVZOrderEdit.edtCountFact);

          if frmAddMaterialToAVZOrderEdit.ShowModal = mrOk then
          begin
            //if frmAddMaterialToAVZOrderEdit.materialCode <> ENConsts.LOW_INT then
            //    begin
                  {
                  countFact := TXSDecimal.Create;
                  countFact.DecimalString := frmAddMaterialToAVZOrderEdit.edtCountFact.Text;
                  TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
                  TempRQOrderItem.addMaterialToAVZOrder(RQOrderObj.code,
                                                        frmAddMaterialToAVZOrderEdit.materialCode,
                                                        countFact,
                                                        frmAddMaterialToAVZOrderEdit.budgetCode,
                                                        frmAddMaterialToAVZOrderEdit.departmentCode);
                  }
            UpdateGrid(Sender);
             //   end;
          end;
       finally
         frmAddMaterialToAVZOrderEdit.Free;
       end;
      end

      else

      begin
      try
        frmMaterialsParametersOutEdit := TfrmMaterialsParametersOutEdit.Create(Application, dsInsert);
        try
{
        frmMaterialsParametersOutEdit.RQOrderItemObj := RQOrderItem.Create;
         frmMaterialsParametersOutEdit.RQOrderItemObj.countGen:= TXSDecimal.Create;
         frmMaterialsParametersOutEdit.RQOrderItemObj.countFact:= TXSDecimal.Create;
         frmMaterialsParametersOutEdit.RQOrderItemObj.priceWithoutNds:= TXSDecimal.Create;
         frmMaterialsParametersOutEdit.RQOrderItemObj.nds:= TXSDecimal.Create;
         frmMaterialsParametersOutEdit.RQOrderItemObj.sumWithoutNds:= TXSDecimal.Create;
         frmMaterialsParametersOutEdit.RQOrderItemObj.sumNds:= TXSDecimal.Create;
         frmMaterialsParametersOutEdit.RQOrderItemObj.sumGen:= TXSDecimal.Create;
         frmMaterialsParametersOutEdit.RQOrderItemObj.dateEdit:= TXSDate.Create;

         frmMaterialsParametersOutEdit.RQOrderItemObj.orderRef :=  RQOrderRef.Create;
         frmMaterialsParametersOutEdit.RQOrderItemObj.orderRef.code := RQOrderObj.code;
}

         frmMaterialsParametersOutEdit.departmentCode := RQOrderObj.departmentRef.code;
         frmMaterialsParametersOutEdit.departmentName :=  RQOrderObj.departmentRef.name;

         frmMaterialsParametersOutEdit.budgetCode :=  RQOrderObj.budgetRef.code;
         frmMaterialsParametersOutEdit.budgetName := RQOrderObj.budgetRef.name;
         frmMaterialsParametersOutEdit.orderCode := RQOrderObj.code;
         frmMaterialsParametersOutEdit.orderKind := RQOrderObj.kindRef.code;
         frmMaterialsParametersOutEdit.orderType := RQOrderObj.rqOrderType.code;

         if RQOrderObj.kindRef.code = RQORDER_KIND_PRODUCTION then
         begin
            frmMaterialsParametersOutEdit.chbOnlyOtherPurchases.Checked := True;
            DisableControls([frmMaterialsParametersOutEdit.chbOnlyOtherPurchases]);
         end;

         if RQOrderObj.kindRef.code = RQORDER_KIND_OE_NOPLANNED_SERVICES then
         begin
            DisableControls([frmMaterialsParametersOutEdit.chbOnlyOtherPurchases]);
            HideControls([frmMaterialsParametersOutEdit.chbOnlyOtherPurchases]);
            frmMaterialsParametersOutEdit.Caption := 'Редагування послуг';
            frmMaterialsParametersOutEdit.btnShowEstimates.Caption := 'Вибрати послуги --->';
         end;

        //try
          if frmMaterialsParametersOutEdit.ShowModal = mrOk then
          begin
            if RQOrderItemObj<>nil then
                //TempRQOrderItem.add(RQOrderItemObj);
                //UpdateGrid(Sender);
          end;
        finally
          frmMaterialsParametersOutEdit.Free;
          frmMaterialsParametersOutEdit:=nil;
        end;
      finally
        //RQOrderItemObj.Free;
      end;
      end;


{
      TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
      RQOrderItemObj:=RQOrderItem.Create;

       RQOrderItemObj.countGen:= TXSDecimal.Create;
       RQOrderItemObj.countFact:= TXSDecimal.Create;
       RQOrderItemObj.priceWithoutNds:= TXSDecimal.Create;
       RQOrderItemObj.nds:= TXSDecimal.Create;
       RQOrderItemObj.sumWithoutNds:= TXSDecimal.Create;
       RQOrderItemObj.sumNds:= TXSDecimal.Create;
       RQOrderItemObj.sumGen:= TXSDecimal.Create;
       RQOrderItemObj.dateEdit:= TXSDate.Create;

       RQOrderItemObj.orderRef :=  RQOrderRef.Create;
       RQOrderItemObj.orderRef.code := RQOrderObj.code;

      try
        frmRQOrderItemEdit:=TfrmRQOrderItemEdit.Create(Application, dsInsert);
        try
          if frmRQOrderItemEdit.ShowModal = mrOk then
          begin
            if RQOrderItemObj<>nil then
                //TempRQOrderItem.add(RQOrderItemObj);
                UpdateGrid(Sender);
          end;
        finally
          frmRQOrderItemEdit.Free;
          frmRQOrderItemEdit:=nil;
        end;
      finally
        RQOrderItemObj.Free;
      end;
}
    end;
// END tsRQOrderItems ----------------


// --------  tsRQOrderDepartment
// при добавлении - включаеться заявки в связь ...
{
  if pcRQOrder.ActivePage = tsRQOrderDepartment then
  begin
  if RQOrderObj.kindRef.code = RQORDER_KIND_OE then
  begin
      ShowMessage('Заявки Підрозділів додаються у Бюджетну ..');

      exit;
  end;

      frmOrderShow := TfrmRQOrderShow.Create(Application, fmNormal);
      //frmRQOrderShow :=  TfrmRQOrderShow.Create(Application, fmNormal, RQOrderFilterObj);
   try

      frmOrderShow.tmpFilter := RQOrderFilter.Create;
      SetNullIntProps(frmOrderShow.tmpFilter);
      SetNullXSProps(frmOrderShow.tmpFilter);

      frmOrderShow.tmpFilter.kindRef := RQOrderKindRef.Create;
      frmOrderShow.tmpFilter.kindRef.code := RQORDER_KIND_DEPARTMENT;

      frmOrderShow.tmpFilter.statusRef := RQOrderStatusRef.Create;
      frmOrderShow.tmpFilter.statusRef.code := RQORDER_STATUS_WORK_IN_MTS;

      frmOrderShow.tmpFilter.budgetRef := ENDepartment.Create;
      frmOrderShow.tmpFilter.budgetRef.code := RQOrderObj.budgetRef.code;

      frmOrderShow.tmpFilter.orderPeriod := TXSDate.Create;
      frmOrderShow.tmpFilter.orderPeriod := RQOrderObj.orderPeriod;

      // включать бюджетную только в бюджетную ... Инвест в Инвест
      frmOrderShow.tmpFilter.rqOrderType := RQOrderType.Create();
      frmOrderShow.tmpFilter.rqOrderType.code :=  RQOrderObj.rqOrderType.code;

      frmOrderShow.tmpFilter.conditionSQL := 'rqorder.code not in (select qq.orderincode from rqorder2order qq)';

      //with frmRQOrderShow do
      begin
        DisableActions([ frmOrderShow.actInsert, frmOrderShow.actEdit, frmOrderShow.actDelete , frmOrderShow.actFilter, frmOrderShow.actNoFilter]);
        if frmOrderShow.ShowModal = mrOk then
        begin
            // закинем в связку , там же перекинем материалы ...
            TempRQOrder_ :=  HTTPRIORQOrder as RQOrderControllerSoapPort;
            j := StrToInt( frmOrderShow.sgRQOrder.Cells[0,frmOrderShow.sgRQOrder.Row]);
            TempRQOrder_.addRQOrderDepartmentInBudget(RQOrderObj.code, j );
        end;
      end;
    finally
      frmOrderShow.Free;
      //RQOrderFilterObj.Free;
   end;

  end;
// -------- end tsRQOrderDepartment
}


{

// --------  tsRQOrderBudget
// при добавлении - включаеться заявки в связь ...
  if pcRQOrder.ActivePage = tsRQOrderBudget then
  begin


      frmOrderShow := TfrmRQOrderShow.Create(Application, fmNormal);
      //frmRQOrderShow :=  TfrmRQOrderShow.Create(Application, fmNormal, RQOrderFilterObj);
   try

      frmOrderShow.tmpFilter := RQOrderFilter.Create;
      SetNullIntProps(frmOrderShow.tmpFilter);
      SetNullXSProps(frmOrderShow.tmpFilter);

      frmOrderShow.tmpFilter.kindRef := RQOrderKindRef.Create;
      frmOrderShow.tmpFilter.kindRef.code := RQORDER_KIND_BUDGET;

      frmOrderShow.tmpFilter.statusRef := RQOrderStatusRef.Create;
      frmOrderShow.tmpFilter.statusRef.code := RQORDER_STATUS_WORK_IN_MTS;

      frmOrderShow.tmpFilter.budgetRef := ENDepartment.Create;
      frmOrderShow.tmpFilter.budgetRef.code := RQOrderObj.budgetRef.code;

      // включать бюджетную только в бюджетную ... Инвест в Инвест
      frmOrderShow.tmpFilter.rqOrderType := RQOrderType.Create();
      frmOrderShow.tmpFilter.rqOrderType.code :=  RQOrderObj.rqOrderType.code;
            
      frmOrderShow.tmpFilter.orderPeriod := TXSDate.Create;
      frmOrderShow.tmpFilter.orderPeriod := RQOrderObj.orderPeriod;

      frmOrderShow.tmpFilter.conditionSQL := 'rqorder.code not in (select qq.orderincode from rqorder2order qq)';

      //with frmRQOrderShow do
      begin
        DisableActions([ frmOrderShow.actInsert, frmOrderShow.actEdit, frmOrderShow.actDelete , frmOrderShow.actFilter, frmOrderShow.actNoFilter]);
        if frmOrderShow.ShowModal = mrOk then
        begin
            // закинем в связку , там же перекинем материалы ...
            TempRQOrder_ :=  HTTPRIORQOrder as RQOrderControllerSoapPort;
            j := StrToInt( frmOrderShow.sgRQOrder.Cells[0,frmOrderShow.sgRQOrder.Row]);
            TempRQOrder_.addRQOrderBudgetInOE(RQOrderObj.code, j );
        end;
      end;
    finally
      frmOrderShow.Free;
      //RQOrderFilterObj.Free;
   end;

  end;
// -------- end tsRQOrderBudget
}

  UpdateGrid(Sender);
  
end;

procedure TfrmRQOrderEdit.actisNOPAIDExecute(Sender: TObject);
var
  orderitemArr : ArrayOfRQOrderItemShort;
  TempRQOrderItem :  RQOrderitemControllerSoapPort;

 i, count, c: Integer ;
 state, isSel : Boolean;
begin
  inherited;
 TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;

 setLength(orderitemArr,0);

 state := false;
  isSel := false;
  count := 0;

  for i:=1 to sgRQOrderItem.RowCount - 1 do
  begin
     sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER,i,state);
     if state then
     begin
       isSel := true;
     end;
  end;

  if not isSel then
  begin
     Application.MessageBox(PChar('Виберіть хоча б одну строку заявки !!!'), PChar('Увага !'),MB_ICONWARNING);
     Exit;
  end;

  if Application.MessageBox(PChar('Вы действительно пометить строки как не оплаченые ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
    for  i:=1 to sgRQOrderItem.RowCount - 1 do
    begin
      sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER,i,state);
      if state then
        begin
        try
        count := High(orderitemArr)+1;
        setLength(orderitemArr,count+1);
        orderitemArr[count] := RQOrderItemShort.Create;
        orderitemArr[count].code := StrToInt(sgRQOrderItem.Cells[0,i]);
        except
        on EConvertError do Exit;
        end;
      end;
    end;
       TempRQOrderItem.nopaid(orderitemArr);
    end;
    actUpdateExecute(Sender);

end;

procedure TfrmRQOrderEdit.actIsPAIDExecute(Sender: TObject);
var
  orderitemArr : ArrayOfRQOrderItemShort;
  TempRQOrderItem :  RQOrderitemControllerSoapPort;

 i, count, c: Integer ;
 state, isSel : Boolean;
begin
  inherited;
 TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;

 setLength(orderitemArr,0);

 state := false;
  isSel := false;
  count := 0;

  for i:=1 to sgRQOrderItem.RowCount - 1 do
  begin
     sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER,i,state);
     if state then
     begin
       isSel := true;
     end;
  end;

  if not isSel then
  begin
     Application.MessageBox(PChar('Виберіть хоча б одну строку заявки !!!'), PChar('Увага !'),MB_ICONWARNING);
     Exit;
  end;

  if Application.MessageBox(PChar('Вы действительно пометить строки как оплаченые ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
    for  i:=1 to sgRQOrderItem.RowCount - 1 do
    begin
      sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER,i,state);
      if state then
        begin
        try
        count := High(orderitemArr)+1;
        setLength(orderitemArr,count+1);
        orderitemArr[count] := RQOrderItemShort.Create;
        orderitemArr[count].code := StrToInt(sgRQOrderItem.Cells[0,i]);;
        except
        on EConvertError do Exit;
        end;
      end;
    end;
       TempRQOrderItem.paid(orderitemArr);
    end;
    actUpdateExecute(Sender);

end;

procedure TfrmRQOrderEdit.actDeleteExecute(Sender: TObject);
Var
  TempRQOrderItem: RQOrderItemControllerSoapPort;
  TempRQOrder: RQOrderControllerSoapPort;
  ObjCode: Integer;
begin
  inherited;
  // -------------- tsRQOrderItems

  if pcRQOrder.ActivePage = tsRQOrderItems then
  begin

    if RQOrderObj.kindRef.code = RQORDER_KIND_OE_PLANNED_AUTO then
    begin
      ShowMessage('Видаляти вручну можна тільки на позаплановій ...');
      Exit;
    end;

    if RQOrderObj.creationMethodRef.code = RQORDER_CREATION_METHOD_AUTO_AVZ then
    begin
      ShowMessage('Видаляти позиції вручну на цій заявці неможна!');
      Exit;
    end;


    TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
    try
      ObjCode := StrToInt(sgRQOrderItem.Cells[0,sgRQOrderItem.Row]);
    except
      on EConvertError do Exit;
    end;

    selectedItemIndex := sgRQOrderItem.Row;

    if Application.MessageBox(PChar('Ви дійсно бажаєте видалити пункт заявки ?'),
                      PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        TempRQOrderItem.remove(ObjCode);
        //UpdateGrid(Sender);
        //pcRQOrderChange(Sender);
    end;
  end;
  //-------------------   tsRQOrderItems

{
  // -----------  tsRQOrderDepartment
  if pcRQOrder.ActivePage = tsRQOrderDepartment then
  begin
     if RQOrderObj.kindRef.code = RQORDER_KIND_OE then
     begin
         ShowMessage('Заявки Підрозділів видаляються з Бюджетної ..');

         exit;
     end;

     TempRQOrder := HTTPRIORQOrder as RQOrderControllerSoapPort;
       try
         ObjCode := StrToInt(sgRQOrderDepartment.Cells[0,sgRQOrderDepartment.Row]);
       except
       on EConvertError do Exit;
      end;
      if Application.MessageBox(PChar('Ви дійсно бажаєте видалити Заявку Підрозділа ?'),
                        PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
      begin
          TempRQOrder.removeRQOrderDepartmentFromBudget (ObjCode);
      end;
  end;
  // -- end tsRQOrderDepartment
}

{

  // -------------  tsRQOrderBudget
  if pcRQOrder.ActivePage = tsRQOrderBudget then
  begin
     TempRQOrder := HTTPRIORQOrder as RQOrderControllerSoapPort;
       try
         ObjCode := StrToInt(sgRQOrderBudget.Cells[0,sgRQOrderBudget.Row]);
       except
       on EConvertError do Exit;
      end;
      if Application.MessageBox(PChar('Ви дійсно бажаєте видалити Заявку Бюджетотримача ?'),
                        PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
      begin
          TempRQOrder.removeRQOrderBudgetFromOE(ObjCode);
      end;
  end;
}

  pcRQOrderChange(Sender);

  if pcRQOrder.ActivePage = tsRQOrderItems then
  begin
    if sgRQOrderItem.RowCount > selectedItemIndex then
      sgRQOrderItem.Row := selectedItemIndex
    else
      sgRQOrderItem.Row := sgRQOrderItem.RowCount - 1;
  end;  
end;

procedure TfrmRQOrderEdit.actDeleteOfferExecute(Sender: TObject);
Var
  TempRQOffer: RQOfferControllerSoapPort;
  ObjCode: Integer;
  i: Integer;
  state: Boolean;
begin
  state := false;

  for i := 1 to sgRQOffer.RowCount - 1 do
  begin
    sgRQOffer.GetCheckBoxState(1, i, state);
    if state then
      break;
  end;

  if not state then
  begin
    Application.MessageBox(PChar('Оберіть хоча б одну строку!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити ВСІ вибрані оферти ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempRQOffer := HTTPRIORQOffer as RQOfferControllerSoapPort;

    state := false;

    for i := 1 to sgRQOffer.RowCount - 1 do
    begin
      sgRQOffer.GetCheckBoxState(1, i, state);

      if state then
      begin
        try
          ObjCode := StrToInt(sgRQOffer.Cells[0, i]);
        except
          on EConvertError do continue;
        end;

        TempRQOffer.remove(ObjCode);
      end;
    end;

    actUpdateOfferExecute(Sender);
    actUpdateOfferItemExecute(Sender);
  end;
end;

procedure TfrmRQOrderEdit.actDeleteOfferItemExecute(Sender: TObject);
Var
  TempRQOfferItem: RQOfferItemControllerSoapPort;
  ObjCode: Integer;
  i: Integer;
  state: Boolean;
begin
  state := false;

  for i := 1 to sgRQOfferItem.RowCount - 1 do
  begin
    sgRQOfferItem.GetCheckBoxState(1, i, state);
    if state then
      break;
  end;

  if not state then
  begin
    Application.MessageBox(PChar('Оберіть хоча б одну строку!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити ВСІ вибрані позиції оферт ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempRQOfferItem := HTTPRIORQOfferItem as RQOfferItemControllerSoapPort;

    state := false;

    for i := 1 to sgRQOfferItem.RowCount - 1 do
    begin
      sgRQOfferItem.GetCheckBoxState(1, i, state);

      if state then
      begin
        try
          ObjCode := StrToInt(sgRQOfferItem.Cells[0, i]);
        except
          on EConvertError do continue;
        end;

        TempRQOfferItem.remove(ObjCode);
      end;
    end;

    actUpdateOfferItemExecute(Sender);
    actUpdateOfferExecute(Sender);
  end;
end;

procedure TfrmRQOrderEdit.actViewExecute(Sender: TObject);
Var
 TempRQOrderItem: RQOrderItemControllerSoapPort;
 frm : TfrmRQOrderEdit;
 TempRQOrder: RQOrderControllerSoapPort;

 ObjCode : Integer;
 TempRQBill: RQBillControllerSoapPort;

 TempRQFKOrder : RQFKOrderControllerSoapPort;

begin
  inherited;
  // -------------- tsRQOrderItems
  if pcRQOrder.ActivePage = tsRQOrderItems then
  begin
     if RQOrderObj.kindRef.code in [RQORDER_KIND_OE_NOPLANNED_SERVICES,  RQORDER_KIND_OE_PLANNED_SERVICES]
     then
     begin
       TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
       try
         RQOrderItemSObj := TempRQOrderItem.getObject(StrToInt(sgRQOrderItem.Cells[0,sgRQOrderItem.Row]));
       except
        on EConvertError do Exit;
       end;

      frmRQOrderItemServicesEdit := TfrmRQOrderItemServicesEdit.Create(Application, dsView);
      frmRQOrderItemServicesEdit.Temporder := RQOrderObj;
       try
        frmRQOrderItemServicesEdit.orderKindCode := RQOrderObj.kindRef.code;
        frmRQOrderItemServicesEdit.ShowModal;
       finally
        frmRQOrderItemServicesEdit.Free;
        frmRQOrderItemServicesEdit:=nil
       end;
     end

     else
     begin
       TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
       try
        RQOrderItemObj := TempRQOrderItem.getObject(StrToInt(sgRQOrderItem.Cells[0,sgRQOrderItem.Row]));
       except
        on EConvertError do Exit;
       end;

      frmRQOrderItemEdit:=TfrmRQOrderItemEdit.Create(Application, dsView);
      frmRQOrderItemEdit.Temporder := RQOrderObj;
       try
         frmRQOrderItemEdit.orderKindCode := RQOrderObj.kindRef.code;
         frmRQOrderItemEdit.creationMethodCode := RQOrderObj.creationMethodRef.code;
         frmRQOrderItemEdit.ShowModal;
       finally
         frmRQOrderItemEdit.Free;
         frmRQOrderItemEdit:=nil;
       end;
     end; 
  end;
  // --------  tsRQOrderItems

  // -------------- tsRQOrderBills
  if pcRQOrder.ActivePage = tsRQBills then
  begin
    TempRQBill := HTTPRIORQBill as RQBillControllerSoapPort;
    try
      ObjCode := StrToInt(sgRQBill.Cells[0,sgRQBill.Row]);
    except
      on EConvertError do Exit;
    end;

    frmRQBillEdit := TfrmRQBillEdit.Create(Application, dsView);
    try
      frmRQBillEdit.RQBillObj := TempRQBill.getObject(ObjCode);
      frmRQBillEdit.ShowModal;
    finally
      frmRQBillEdit.Free;
      frmRQBillEdit:=nil;
    end;
  end;
  // --------  tsRQOrderBills

  // -------------- tsRQFKOrder
  if pcRQOrder.ActivePage = tsRQFKOrder then
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

{

  // --------- tsRQOrderBudget / Department
  if (pcRQOrder.ActivePage = tsRQOrderBudget) or (pcRQOrder.ActivePage = tsRQOrderDepartment) then
  begin

        try
          if pcRQOrder.ActivePage = tsRQOrderBudget then
           ObjCode := StrToInt(sgRQOrderBudget.Cells[0, sgRQOrderBudget.Row]);
          if pcRQOrder.ActivePage = tsRQOrderDepartment then
           ObjCode := StrToInt(sgRQOrderDepartment.Cells[0, sgRQOrderDepartment.Row]);
        except
          on EConvertError do Exit;
        end;

      TempRQOrder := HTTPRIORQOrder as RQOrderControllerSoapPort;
      frm := TfrmRQOrderEdit.Create(Application, dsView);

      try
        frm.RQOrderObj := TempRQOrder.getObject(ObjCode);
        frm.ShowModal;
      finally
        frm.Free;
      end;
  end;
}

end;

procedure TfrmRQOrderEdit.actViewOfferExecute(Sender: TObject);
Var TempRQOffer: RQOfferControllerSoapPort;
begin
  frmRQOfferEdit := TfrmRQOfferEdit.Create(Application, dsView);
  try
    TempRQOffer := HTTPRIORQOffer as RQOfferControllerSoapPort;
    try
      frmRQOfferEdit.RQOfferObj := TempRQOffer.getObject(StrToInt(sgRQOffer.Cells[0, sgRQOffer.Row]));
    except
      on EConvertError do Exit;
    end;

    frmRQOfferEdit.ShowModal;
  finally
    frmRQOfferEdit.Free;
    frmRQOfferEdit := nil;
  end;
end;

procedure TfrmRQOrderEdit.actViewOfferItemExecute(Sender: TObject);
Var TempRQOfferItem: RQOfferItemControllerSoapPort;
begin
  frmRQOfferItemEdit := TfrmRQOfferItemEdit.Create(Application, dsView);
  try
    //frmRQOfferItemEdit.RQOfferItemObj := TempRQOfferItem.getObject(ObjCode);
    TempRQOfferItem := HTTPRIORQOfferItem as RQOfferItemControllerSoapPort;
    try
      frmRQOfferItemEdit.RQOfferItemObj := TempRQOfferItem.getObject(StrToInt(sgRQOfferItem.Cells[0, sgRQOfferItem.Row]));
    except
      on EConvertError do Exit;
    end;

    frmRQOfferItemEdit.ShowModal;
  finally
    frmRQOfferItemEdit.Free;
    frmRQOfferItemEdit := nil;
  end;
end;

procedure TfrmRQOrderEdit.actViewPriceVRTUExecute(Sender: TObject);
var
  TempRQApprovedCost : RQApprovedCostControllerSoapPort;
  approvedCost : RQApprovedCost;
  approvedCostFilter : RQApprovedCostFilter;

  orderItemCode : Integer;
  orderItem : RQOrderItem;
  TempRQOrderItem : RQOrderItemControllerSoapPort;
  approvedCostList : RQApprovedCostShortList;
begin
  TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
  try
    orderItemCode := StrToInt(sgRQOrderItem.Cells[0,sgRQOrderItem.Row]);
    orderItem := TempRQOrderItem.getObject(orderItemCode);
  except
    on EConvertError do Exit;
  end;

  approvedCost := Self.getApprovedCostBySelectedItem(true);

  if approvedCost = nil then
  begin
    approvedCost := RQApprovedCost.Create;
    SetNullIntProps(approvedCost);
    SetNullXSProps(approvedCost);

    approvedCost.rqOrderItemRef := RQOrderItemRef.Create;
    approvedCost.rqOrderItemRef.code := orderItemCode;

    approvedCost.approvedCostStatusRef := RQApprovedCostStatusRef.Create;
    approvedCost.approvedCostStatusRef.code := ENConsts.RQAPPROVEDCOST_GOOD;
  end;

  if approvedCost.countGen = nil then
    approvedCost.countGen := TXSDecimal.Create;
  approvedCost.countGen.DecimalString := orderItem.countFact.DecimalString;

  if approvedCost.approvedCostStatusRef.code = ENConsts.RQAPPROVEDCOST_APPROVED then
  begin

    frmSetRQApprovedCost := TfrmSetRQApprovedCost.Create(Application, dsView);
    try
      frmSetRQApprovedCost.Caption := 'Перегляд кошторисної ціни';
      frmSetRQApprovedCost.lblPrice.Caption := 'Кошторисна ціна (без ПДВ)';
      frmSetRQApprovedCost.lblPriceVAT.Caption := 'Кошторисна ціна (з ПДВ)';
      frmSetRQApprovedCost.approvedCost := approvedCost;

      frmSetRQApprovedCost.ShowModal;
    finally
      frmSetRQApprovedCost.Free;
      frmSetRQApprovedCost := nil;
    end;

  end
  else
    Application.MessageBox(PChar('Кошторисну ціну для обраної строки не затверджено!'),
                           PChar('Увага !'), MB_ICONINFORMATION);
end;

procedure TfrmRQOrderEdit.actEditExecute(Sender: TObject);
Var
 TempRQOrderItem: RQOrderItemControllerSoapPort;
begin
  // -------------- tsRQOrderItems

  if pcRQOrder.ActivePage = tsRQOrderItems then
  begin

      selectedItemIndex := sgRQOrderItem.Row;

      if RQOrderObj.kindRef.code in [RQORDER_KIND_OE_NOPLANNED_SERVICES,  RQORDER_KIND_OE_PLANNED_SERVICES]
      then
      begin

         TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
          try
             RQOrderItemSObj := TempRQOrderItem.getObject(StrToInt(sgRQOrderItem.Cells[0,sgRQOrderItem.Row]));
           except
           on EConvertError do Exit;
          end;

         frmRQOrderItemServicesEdit:= TfrmRQOrderItemServicesEdit.Create(Application, dsEdit);
         try

            frmRQOrderItemServicesEdit.Temporder := RQOrderObj;

           if (RQOrderObj.kindRef.code = RQORDER_KIND_OE_PLANNED_AUTO) or
              (RQOrderObj.statusRef.code = RQORDER_STATUS_WORK_IN_MTS)
           then
           begin
              frmRQOrderItemServicesEdit.DisableActions([frmRQOrderItemServicesEdit.actInsert, frmRQOrderItemServicesEdit.actDelete]);
           end;

           if  RQOrderObj.statusRef.code <> RQORDER_STATUS_WORK_IN_MTS then
           begin
              frmRQOrderItemServicesEdit.DisableActions([frmRQOrderItemServicesEdit.actEditCount, frmRQOrderItemServicesEdit.actMove]);
           end;

           frmRQOrderItemServicesEdit.orderKindCode := RQOrderObj.kindRef.code;
           frmRQOrderItemServicesEdit.ShowModal;
         finally
           frmRQOrderItemServicesEdit.Free;
           frmRQOrderItemServicesEdit:=nil;
         end;
     end

      else
      begin

        TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
        try
           RQOrderItemObj := TempRQOrderItem.getObject(StrToInt(sgRQOrderItem.Cells[0,sgRQOrderItem.Row]));
         except
           on EConvertError do Exit;
        end;

      frmRQOrderItemEdit:=TfrmRQOrderItemEdit.Create(Application, dsEdit);


      try

      frmRQOrderItemEdit.Temporder := RQOrderObj;

       if (RQOrderObj.kindRef.code = RQORDER_KIND_OE_PLANNED_AUTO) or
          (RQOrderObj.statusRef.code = RQORDER_STATUS_WORK_IN_MTS)
       then
       begin
          frmRQOrderItemEdit.DisableActions([frmRQOrderItemEdit.actInsert, frmRQOrderItemEdit.actDelete]);
       end;

       ///// 25.01.13 NET-4204 Теперь будут вручную докидывать материалы и в плановую заявку
       if (RQOrderObj.kindRef.code = RQORDER_KIND_OE_PLANNED_AUTO) then
       begin
         frmRQOrderItemEdit.DisableActions([frmRQOrderItemEdit.actInsert, frmRQOrderItemEdit.actDelete], false);

         // Если статус строки "Непотрібно замовляти", дисейблим добавление/удаление материалов из строки
         if RQOrderItemObj.statusRef <> nil then
           if RQOrderItemObj.statusRef.code <> LOW_INT then
             if RQOrderItemObj.statusRef.code = RQORDERITEM_STATUS_CANCELED then
               frmRQOrderItemEdit.DisableActions([frmRQOrderItemEdit.actInsert, frmRQOrderItemEdit.actDelete]);
       end;
       /////

       ///// 30.10.14 NET-4395 Из строки заявки на пополнение АВЗ можно отдельно удалить материал, добавленный вручную
       if (RQOrderObj.creationMethodRef.code = RQORDER_CREATION_METHOD_AUTO_AVZ) then
       begin
         frmRQOrderItemEdit.DisableActions([frmRQOrderItemEdit.actDelete], false);

         // Если статус строки "Непотрібно замовляти", дисейблим добавление/удаление материалов из строки
         if RQOrderItemObj.statusRef <> nil then
           if RQOrderItemObj.statusRef.code <> LOW_INT then
             if RQOrderItemObj.statusRef.code = RQORDERITEM_STATUS_CANCELED then
               frmRQOrderItemEdit.DisableActions([frmRQOrderItemEdit.actInsert, frmRQOrderItemEdit.actDelete]);
       end;
       /////

       if  RQOrderObj.statusRef.code <> RQORDER_STATUS_WORK_IN_MTS then
       begin
          frmRQOrderItemEdit.DisableActions([frmRQOrderItemEdit.actEditCount, frmRQOrderItemEdit.actMove]);
       end;

        frmRQOrderItemEdit.orderKindCode := RQOrderObj.kindRef.code;
        frmRQOrderItemEdit.creationMethodCode := RQOrderObj.creationMethodRef.code;
        frmRQOrderItemEdit.ShowModal;
      finally
        frmRQOrderItemEdit.Free;
        frmRQOrderItemEdit:=nil;
        end;
      end;
  end;
  // --------  tsRQOrderItems

  
  pcRQOrderChange(Sender);

  
  if pcRQOrder.ActivePage = tsRQOrderItems then
  begin
    if sgRQOrderItem.RowCount > selectedItemIndex then
      sgRQOrderItem.Row := selectedItemIndex
    else
      sgRQOrderItem.Row := sgRQOrderItem.RowCount - 1;
  end;


end;

procedure TfrmRQOrderEdit.actEditOfferExecute(Sender: TObject);
Var TempRQOffer: RQOfferControllerSoapPort;
begin
  frmRQOfferEdit := TfrmRQOfferEdit.Create(Application, dsEdit);
  try
    TempRQOffer := HTTPRIORQOffer as RQOfferControllerSoapPort;
    try
      frmRQOfferEdit.RQOfferObj := TempRQOffer.getObject(StrToInt(sgRQOffer.Cells[0, sgRQOffer.Row]));
    except
      on EConvertError do Exit;
    end;

    if frmRQOfferEdit.ShowModal = mrOk then
    begin
      //actUpdateOfferExecute(Sender);
    end;

    // Обновляем все в любом случае, потому что при редактировании оферты
    // могут удалить с нее все строки вместе с ней самой
    actUpdateOfferExecute(Sender);
    actUpdateOfferItemExecute(Sender);
  finally
    frmRQOfferEdit.Free;
    frmRQOfferEdit := nil;
  end;
end;

procedure TfrmRQOrderEdit.actEditOfferItemExecute(Sender: TObject);
Var TempRQOfferItem: RQOfferItemControllerSoapPort;
begin
  frmRQOfferItemEdit := TfrmRQOfferItemEdit.Create(Application, dsEdit);
  try
    TempRQOfferItem := HTTPRIORQOfferItem as RQOfferItemControllerSoapPort;
    try
      frmRQOfferItemEdit.RQOfferItemObj := TempRQOfferItem.getObject(StrToInt(sgRQOfferItem.Cells[0, sgRQOfferItem.Row]));
    except
      on EConvertError do Exit;
    end;

    if frmRQOfferItemEdit.ShowModal = mrOk then
    begin
      actUpdateOfferItemExecute(Sender);
    end;
  finally
    frmRQOfferItemEdit.Free;
    frmRQOfferItemEdit := nil;
  end;
end;

procedure TfrmRQOrderEdit.actCreateOffersExecute(Sender: TObject);
var
  //strOrderItemsCodes: String;
  selected, state: Boolean;
  i, materialCode, itemCode, orderItemsCount: Integer;
  orderItemsCodes: RQOrderItemController.ArrayOfInteger;
begin
  selected := false;

  materialCode := LOW_INT;

  for i := 1 to sgRQOrderItem.RowCount - 1 do
  begin
    sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER, i, selected);
    if selected then
    begin
      materialCode := Integer(sgRQOrderItem.Objects[1, i]);
      if materialCode = 0 then
        materialCode := LOW_INT;
      break;
    end;
  end;

  if not selected then // Если не выбрана ни одна строка
  begin
    Application.MessageBox(PChar('Оберіть позиції заявки, для яких потрібно сформувати оферти!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if materialCode = LOW_INT then
    raise Exception.Create('Не заданий код матеріалу!');

  //strOrderItemsCodes := '';

  SetLength(orderItemsCodes, 0);

  state := false;

  for i := 1 to sgRQOrderItem.RowCount - 1 do
  begin
    sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER, i, state);

    if state then
    begin
      try
        itemCode := StrToInt(sgRQOrderItem.Cells[0, i]);
      except
        on EConvertError do Continue;
      end;

      //AddListPos(strOrderItemsCodes, sgRQOrderItem.Cells[0, i]);

      orderItemsCount := High(orderItemsCodes) + 1;
      SetLength(orderItemsCodes, orderItemsCount + 1);
      orderItemsCodes[orderItemsCount] := itemCode;
    end;
  end;

  //if strOrderItemsCodes = '' then
  if High(orderItemsCodes) = -1 then
  begin
    Application.MessageBox(PChar('Оберіть позиції заявки, для яких потрібно сформувати оферти!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  frmRQOrgsForOfferEdit := TfrmRQOrgsForOfferEdit.Create(Application, dsInsert);
  try
    frmRQOrgsForOfferEdit.materialCode := materialCode;
    frmRQOrgsForOfferEdit.orderItemsCodes := orderItemsCodes;

    if frmRQOrgsForOfferEdit.ShowModal = mrOk then
    begin
      if tsRQOffers.TabVisible then
      begin
        pcRQOrder.ActivePage := tsRQOffers;
        pcRQOrderChange(Sender);
      end;
    end;
  finally
    frmRQOrgsForOfferEdit.Free;
  end;
end;

procedure TfrmRQOrderEdit.FormDestroy(Sender: TObject);
begin
  inherited;
  if assigned(RQOrderObj) then RQOrderObj.Free; 
end;

procedure TfrmRQOrderEdit.actTDExcelExecute(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  SetLength(argNames, 3);
  SetLength(args, 3);

  argNames[0] := 'PcodeOrder';
  args[0] := IntToStr(RQOrderObj.code);

  argNames[1] := 'pr_par_mat';
  if chkGr_mat.Checked = True then
  args[1] := '1'
  else
  args[1] := '0';

  argNames[2] := 'pr_ke';
  args[2] := '0';





  reportName := 'RepOrder/rep_order_full/rep_order_full';
  makeReport(reportName, argNames, args, 'xls');
end;

procedure TfrmRQOrderEdit.actTDExportExecute(Sender: TObject);

  function ReplaceQuotationMarks(str: String): String;
  begin
    Result := str;

    if pos('"', str) > 0 then
      Result := '"' + AnsiReplaceText(str, '"', '""') + '"';
  end;

var
  i: Integer;

  TempRQOrderItem: RQOrderItemControllerSoapPort;
  RQOrderItemList: RQOrderItemShortList;
  RQOrderItemFilterObj : RQOrderItemFilter;
  itemList: TStringList;
  str, AppPath, ExportPath, fileName, strOrderType, strOrderForm, contractNumber, condition: String;

  // хитрая подмена !!!!  меняется СУЩНОСТЬ !!! с  RQMaterials на  RQMaterials2TKMaterials
  TempRQMaterials: RQMaterialsControllerSoapPort;
  RQMaterialsFilterObj: RQMaterialsFilter;
  RQMaterialsList: RQMaterialsShortList;

  //TempRQMaterials: RQMaterials2TKMaterialsControllerSoapPort;
  //RQMaterialsFilterObj: RQMaterials2TKMaterialsFilter;
  //RQMaterialsList: RQMaterials2TKMaterialsShortList;
  strName: String;

  isBinded: Boolean;
begin
  TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;

  RQOrderItemFilterObj := RQOrderItemFilter.Create;
  SetNullIntProps(RQOrderItemFilterObj);
  SetNullXSProps(RQOrderItemFilterObj);

  RQOrderItemFilterObj.orderRef := RQOrderRef.Create;
  RQOrderItemFilterObj.orderRef.code := RQOrderObj.code;

  condition := '';
  /////////////
  // 12.09.2011  не включаем строки со статусом <<<Втрачено необхідність>>>
  /////////////
  AddCondition(condition, 'rqorderitem.statusrefcode = ' + IntToStr(RQORDERITEM_STATUS_GOOD) + '');

  if edtExportContractNumber.Text <> '' then
  begin
    contractNumber := edtExportContractNumber.Text;
    AddCondition(condition, 'UPPER(rqorderitem.contractnumber) like UPPER(''' + ToLike(contractNumber) + ''')');
  end;

  RQOrderItemFilterObj.conditionSQL := condition;

  RQOrderItemList := TempRQOrderItem.getScrollableFilteredList(RQOrderItemFilterObj,0,-1);

  if High(RQOrderItemList.list) = -1 then
  begin
    Application.MessageBox(PChar('Данная заявка не содержит материалов!' + #13#10 +
                                 'Экспорт прерван!'),
                           PChar('Внимание!'), MB_ICONWARNING);
    Exit;
  end;

  itemList := TStringList.Create;
  try
    for i:=0 to High(RQOrderItemList.list) do
    begin
      Application.ProcessMessages;

      str := '';

      // 1 - код ДДС
      str := str + AnsiReplaceText(RQOrderItemList.list[i].ddsCodesTxtCode, ' ', '') + #9 +
      // 2 - код ДДС
                   AnsiReplaceText(RQOrderItemList.list[i].ddsCodesTxtCode, ' ', '') + #9;

      /////// Вытягиваем материал из СвитПрофовского справочника (по связке)
      // AS немного не так .. появились КОЭФ перевода одних ед. измерения матр-лов в другие
      // надо брать из RQMaterials2TKMaterials ... там есть хитрый КОЭФициент ;) ...

       // хитрая подмена !!!!  меняется СУЩНОСТЬ !!! с  RQMaterials на  RQMaterials2TKMaterials
       // блин .. ПРЕДУМАЛИ .. остаеться все как и было ;)

      TempRQMaterials := HTTPRIORQMaterials as RQMaterialsControllerSoapPort;

      RQMaterialsFilterObj := RQMaterialsFilter.Create;
      SetNullIntProps(RQMaterialsFilterObj);
      SetNullXSProps(RQMaterialsFilterObj);

      //RQMaterialsFilterObj.tkMaterials.code := RQOrderItemList.list[i].materialCode;

      RQMaterialsFilterObj.conditionSQL := 'RQMATERIALS.CODE in (select RQMATERIALS2TKMATERILS.RQMATERIALSCODE from RQMATERIALS2TKMATERILS where RQMATERIALS2TKMATERILS.TKMATERIALSCODE = '+ IntToStr(RQOrderItemList.list[i].materialCode) +')';
      RQMaterialsList := TempRQMaterials.getScrollableFilteredList(RQMaterialsFilterObj, 0, -1);

      { Что делать, если выбранных материалов больше 1 или нет вообще ??
      if (RQMaterialsList.totalCount > 1) then
      begin
        ShowMessage('Один материал имеет несколько материалов для Заказа ...');
      end;

      if (RQMaterialsList.totalCount = 0) then
      begin
        ...
      end;
      }

      isBinded := false;

      //if RQMaterialsList.totalCount = 1 then
      if RQMaterialsList.totalCount >= 1 then  // если > 1, то берем 1-й из развязки ??
        if RQMaterialsList.list[0] <> nil then
        begin
          // 3 - код материала
          str := str + IntToStr(RQMaterialsList.list[0].code) + #9;

          // 4 - наименование материала
          strName := ReplaceQuotationMarks(RQMaterialsList.list[0].name);
          //str := str + ReplaceQuotationMarks(RQMaterialsList.list[0].name) + #9;
          str := str + Copy(strName, 1, 200) + #9;

          // 5 - наименование единицы измерения (сокращенное)
          str := str + ReplaceQuotationMarks(RQMaterialsList.list[0].measurementShortName) + #9;
          
          // 6 - наименование единицы измерения (полное)
          str := str + ReplaceQuotationMarks(RQMaterialsList.list[0].measurementName) + #9;

          isBinded := true;
        end;

      // Если развязки материалов нет, вставляем наш материал (?)  
      if not isBinded then
      begin
        // 3 - код материала
        str := str + IntToStr(RQOrderItemList.list[i].materialCode) + #9;

        // 4 - наименование материала
        strName := ReplaceQuotationMarks(RQOrderItemList.list[i].materialName);
        //str := str + ReplaceQuotationMarks(RQOrderItemList.list[i].materialName) + #9;
        str := str + Copy(strName, 1, 200) + #9;

        // 5 - наименование единицы измерения (сокращенное)
        str := str + ReplaceQuotationMarks(RQOrderItemList.list[i].measurementName) + #9;
        
        // 6 - наименование единицы измерения (полное)
        str := str + ReplaceQuotationMarks(RQOrderItemList.list[i].measurementName) + #9;
      end;
      ///////

      // 7 - кол-во материала
      if RQOrderItemList.list[i].countFact <> nil then
        str := str + RQOrderItemList.list[i].countFact.DecimalString + #9
      else
        str := str + #9;

      // 8 - цена материала (с НДС)
      if RQOrderItemList.list[i].priceWithNds <> nil then
        str := str + RQOrderItemList.list[i].priceWithNds.DecimalString + #9
      else
        str := str + #9;

      // 9 - поставщик
      str := str + ReplaceQuotationMarks(RQOrderItemList.list[i].orgName) + #9;

      // 10 - приоритет
      str := str + 'Средний' + #9; // Priority !!

      // 11 - признак КЭ/ОЭ
      // Если поставщик - ДП "КОМПЛЕКТЭНЕРГО", то ставим "КЭ", иначе "ОЭ"
      if RQOrderItemList.list[i].orgOkpo = RQ_KE_OKPO then
        str := str + 'КЭ' + #9
      else
        str := str + 'ОЭ' + #9;

      // 12 - примечание
      str := str + ReplaceQuotationMarks(RQOrderItemList.list[i].commentGen);

      itemList.Add(str);
    end;

    ///// Формируем имя файла
    fileName := 'Заявка';
    strOrderType := '';
    strOrderForm := '';

    if RQOrderObj.rqOrderType <> nil then
    begin
      if RQOrderObj.rqOrderType.code = RQORDER_TYPE_BUDGET then
        strOrderType := 'Б';
      if RQOrderObj.rqOrderType.code = RQORDER_TYPE_INVEST then
        strOrderType := 'И';
    end;

    if RQOrderObj.rqOrderForm <> nil then
    begin
      if RQOrderObj.rqOrderForm.code = RQORDER_FORM_PLANNED then
        strOrderForm := 'П';
      if RQOrderObj.rqOrderForm.code = RQORDER_FORM_NOTPLANNED then
        strOrderForm := 'В';
    end;

   // if contractNumber <> '' then
   //  fileName := fileName + '_' + strOrderType + '_' + strOrderForm + '_ХОЭ_' + RQOrderObj.numberDoc {+ '_' + contractNumber } + '.txt'
   // else
     fileName := fileName + '_' + strOrderType + '_' + strOrderForm + '_ХОЭ_' + RQOrderObj.numberDoc + '.txt';

    /////
    AppPath := ExtractFilePath(Application.ExeName);
    ExportPath := AppPath + RQOrderExportPath + 'Заявка\';
    if not DirectoryExists(AppPath + RQOrderExportPath) then
      CreateDir(AppPath + RQOrderExportPath);
    if not DirectoryExists(ExportPath) then
      CreateDir(ExportPath);

    itemList.SaveToFile(ExportPath + fileName);

    Application.MessageBox(PChar('Экспорт успешно завершен!' + #13#10 +
                                 'Заявка сохранена в файл "' + ExportPath + fileName + '" !'),
                           PChar('Сообщение'), MB_ICONINFORMATION);
  finally
    itemList.Free;
  end;
end;


procedure TfrmRQOrderEdit.FormCreate(Sender: TObject);
begin
  selectedItemIndex := 1;
  selectedItemsList := nil;
{
  materialGroupCode := LOW_INT;
  materialName := '';
  contractNumber := '';
  isWithoutContracts := false;

  responsibleCode := LOW_INT;
  responsibleName := '';
}

  isOrderForVRTU := false;

  ClearRQOrderItemFilter;
end;


procedure TfrmRQOrderEdit.btnPrintOffertClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName , identid2015 , temp: String;
  mtList : TKMaterialsShortList;
  i : Integer;
begin
  SetLength(argNames, 3);
  SetLength(args, 3);

  argNames[0] := 'PcodeOrder';
  args[0] := IntToStr(RQOrderObj.code);

  argNames[1] := 'identid2015_4_length_sql';
  argNames[2] := 'identid2015_4_length';


  if ((RQOrderObj.kindRef.code = RQORDER_KIND_OE_PLANNED_SERVICES) or( RQOrderObj.kindRef.code = RQORDER_KIND_OE_NOPLANNED_SERVICES)) then
   begin
    reportName := 'RepOrder/rep_order_aferta_services';
    makeReport(reportName, argNames, args, 'xls');
   end
  else
  begin
      reportName := 'RepOrder/rep_order_aferta';
      identid2015:= '';
      mtList := DMReports.getTKmaterialsListFromRQOrder(RQOrderObj.code);
      for i:=0 to High(mtList.list) do
      begin
        Application.ProcessMessages;
        temp:= copy(mtList.list[i].identid2015,1,4);

        if ((identid2015='') or ( Pos( temp , identid2015 ) = 0  ) ) then
          begin
            args[1] := ' and substring(tm.identid2015,1,4) = ' + chr(39) + copy(mtList.list[i].identid2015,1,4) + chr(39);
            args[2] :=   '/'+ copy(mtList.list[i].identid2015,1,4) ;
            makeReport(reportName, argNames, args, 'xls');
            identid2015:= identid2015 + ' ' +  copy(mtList.list[i].identid2015,1,4);
          end;


      end;
  end;


end;

procedure TfrmRQOrderEdit.actTDExcelDecodingExecute(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin


     SetLength(argNames, 14);
      SetLength(args, 14);



      argnames[0] := 'YearRaznar';
      args[0] :=  '3000';

      argnames[1] := 'MonthRaznar';
      args[1] :=  '1';

      argnames[2] := 'renCode';
      args[2] := '0';

      argnames[3] := 'renName';
      args[3] := '';

      argnames[4] := 'budgName';
      args[4] := '';

      argnames[5] := 'budgCode';
      args[5] := '0';



       argnames[6] := 'MonthVvod';
       args[6] :=  '0';


       argnames[7] := 'YearVvod';

       args[7] := '0';


       argnames[8] := 'zayakind';
       args[8] := '0';



       argnames[9] := 'orderstatus';
       args[9] := '0';

       argnames[10] := 'orderform';  // вид заявки
       args[10] := '0';  // плановые +  внеплановые

        argnames[11]:= 'ordertype';
        args[11] := '0';

     argNames[12] := 'PcodeOrder';
     args[12] := IntToStr(RQOrderObj.code);

     argNames[13] := 'pr_par_mat';
     if chkGr_mat.Checked = True then
        args[13] := '1'
     else
        args[13] := '0';

    reportName:= '';
    reportName := 'RepOrder/rep_order_decoding';
    makeReport(reportName, argNames, args, 'xls');

end;

procedure TfrmRQOrderEdit.btnCreateItemsClick(Sender: TObject);
var
   TempRQOrder: RQOrderControllerSoapPort;
begin

   TempRQOrder := HTTPRIORQOrder as RQOrderControllerSoapPort;

   if RQOrderObj.statusRef.code = RQORDER_STATUS_GOOD then
   begin
      if Application.MessageBox( PChar('Ви дійсно бажаєте сформувати строки (матеріали)?? Це може зайняти деякий час ...'),
                                PChar('Увага !'), MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
      begin
         if RQOrderObj.creationMethodRef.code = RQORDER_CREATION_METHOD_MANUAL then
         begin
           if RQOrderObj.kindRef.code = RQORDER_KIND_OE_PLANNED_SERVICES  then
              TempRQOrder.createOEPlannedServicesItems(RQOrderObj.code)
           else
              TempRQOrder.createOEPlannedAutoItems(RQOrderObj.code);
         end
         else if RQOrderObj.creationMethodRef.code = RQORDER_CREATION_METHOD_AUTO_AVZ then
           TempRQOrder.createReplenishmentAVZItems(RQOrderObj.code)
         else
           raise Exception.Create('Невідомий метод створення заявки!');

          ShowMessage('Строки сформовані ...');
          RQOrderObj := TempRQOrder.getObject(RQOrderObj.code);
          Self.FormShow(Sender);
          Exit;
      end;
   end;

   if RQOrderObj.statusRef.code = RQORDER_STATUS_CREATED then
   begin
      if Application.MessageBox( PChar('Ви дійсно бажаєте видалити строки (матеріали)?? Усі змінені дані в строках будуть видалені ...'),
                                PChar('Увага !'), MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
      begin
        /////
        if RQOrderObj.creationMethodRef.code = RQORDER_CREATION_METHOD_MANUAL then
        begin
          if RQOrderObj.kindRef.code = RQORDER_KIND_OE_PLANNED_SERVICES then
            TempRQOrder.removeOEPlannedAutoServicesItems(RQOrderObj.code)
          else
            TempRQOrder.removeOEPlannedAutoItems(RQOrderObj.code);
        end

        else if RQOrderObj.creationMethodRef.code = RQORDER_CREATION_METHOD_AUTO_AVZ then
          TempRQOrder.removeReplenishmentAVZItems(RQOrderObj.code)

        else
          raise Exception.Create('Невідомий метод створення заявки!');
        /////

        ShowMessage('Строки видалені ...');
        RQOrderObj := TempRQOrder.getObject(RQOrderObj.code);
        Self.FormShow(Sender);
        Exit;
      end;
   end;

end;

procedure TfrmRQOrderEdit.spbDeparmentClearClick(Sender: TObject);
begin
  inherited;
  edtENDepartmentDepartmentRefName.Text := '';
  if RQOrderObj.departmentRef = nil then RQOrderObj.departmentRef := ENDepartment.Create;
  RQOrderObj.departmentRef.code := LOW_INT;
end;

procedure TfrmRQOrderEdit.spbMaterialsClearClick(Sender: TObject);
begin
  inherited;
  edtMaterialName.Text := '';
  materialGroupCode := LOW_INT;
  Self.actUpdateExecute(Sender);
end;

procedure TfrmRQOrderEdit.spbMaterialNameClick(Sender: TObject);
var
 frmSpr_matherialShow: TfrmTKMaterialsShow;
 //mtFilter : TKMaterialsFilter;

begin
  frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);//, mtFilter);
  try
    with frmSpr_matherialShow do
    begin
      // NET-73 Закрываем любое редактирование материалов (оставляем только просмотр)
      // (для редактирования есть отдельный клиент!)
      DisableActions([actInsert, actEdit, actDelete]);
      
      if ShowModal = mrOk then
      begin
        try
          materialGroupCode := TKMaterialsShort(tvDep.Selected.Data).code;
          edtMaterialName.Text :=  TKMaterialsShort(tvDep.Selected.Data).name ;
        except
          on EConvertError do Exit;
        end;

        Self.actUpdateExecute(Sender);

      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;

end;

procedure TfrmRQOrderEdit.actPrintOffertFromSelectedExecute(
  Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName, strOrderItemsCodes: String;
  selected, state: Boolean;
  i: Integer;
begin
  selected := false;

  for i := 1 to sgRQOrderItem.RowCount - 1 do
  begin
    sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER, i, selected);
    if selected then break;
  end;

  if not selected then // Если не выбрана ни одна строка
  begin
    Application.MessageBox(PChar('Оберіть позиції заявки, для яких потрібно надрукувати оферту!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  strOrderItemsCodes := '';

  state := false;

  for i := 1 to sgRQOrderItem.RowCount - 1 do
  begin
    sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER, i, state);

    if state then
      AddListPos(strOrderItemsCodes, sgRQOrderItem.Cells[0, i]);
  end;

  if strOrderItemsCodes = '' then
  begin
    Application.MessageBox(PChar('Оберіть позиції заявки, для яких потрібно надрукувати оферту!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;  
  end;

  SetLength(argNames, 2);
  SetLength(args, 2);

  argNames[0] := 'PcodeOrder';
  args[0] := IntToStr(RQOrderObj.code);

  argNames[1] := 'orderItemsCodes';
  args[1] := 'and ri.code in (' + strOrderItemsCodes + ')';

  reportName := 'RepOrder/rep_order_oferta_MTS';
  makeReport(reportName, argNames, args, 'xls');
end;

procedure TfrmRQOrderEdit.btnPrintTD2KomplektClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  SetLength(argNames, 3);
  SetLength(args, 3);

  argNames[0] := 'PcodeOrder';
  args[0] := IntToStr(RQOrderObj.code);

  argNames[1] := 'pr_par_mat';
  args[1] := '1';

  argNames[2] := 'pr_ke';
  args[2] := '1';

 // reportName := 'RepOrder/rep_order_KE';
  reportName := 'RepOrder/rep_order_full/rep_order_full';
  makeReport(reportName, argNames, args, 'xls');
end;

procedure TfrmRQOrderEdit.actFilterExecute(Sender: TObject);
var condition: String;
begin
	if pcRQOrder.ActivePage = tsRQOrderItems then
  begin
    frmRQOrderItemFilterEdit:=TfrmRQOrderItemFilterEdit.Create(Application, dsInsert);
    try
      {if RQOrderItemFilterObj = nil then
      begin
        RQOrderItemFilterObj := RQOrderItemFilter.Create;
        SetNullIntProps(RQOrderItemFilterObj);
        SetNullXSProps(RQOrderItemFilterObj);
			end;}

      if frmRQOrderItemFilterEdit.ShowModal = mrOk then
      begin
        //BuildRQOrderItemFilter;

				materialName := frmRQOrderItemFilterEdit.edtMaterialName.Text;
				contractNumber := frmRQOrderItemFilterEdit.edtContractNumber.Text;
        isWithoutContracts := frmRQOrderItemFilterEdit.chbWithoutContracts.Checked;

				responsibleCode := frmRQOrderItemFilterEdit.responsibleCode;
        responsibleName := frmRQOrderItemFilterEdit.responsibleName;

				orgName := frmRQOrderItemFilterEdit.edtRQOrg.Text;

				typePayCode := frmRQOrderItemFilterEdit.typePayCode;

        budgetCode := frmRQOrderItemFilterEdit.budgetCode;
        budgetName := frmRQOrderItemFilterEdit.edtENBudgetName.Text;

        actUpdateExecute(Sender);
      end;
    finally
      frmRQOrderItemFilterEdit.Free;
      frmRQOrderItemFilterEdit:=nil;
    end;
  end;
end;

procedure TfrmRQOrderEdit.BuildRQOrderItemFilter;
var condition, strFilter: String;
begin
  RQOrderItemFilterObj := RQOrderItemFilter.Create;
  SetNullIntProps(RQOrderItemFilterObj);
  SetNullXSProps(RQOrderItemFilterObj);

  RQOrderItemFilterObj.orderRef := RQOrderRef.Create;
  RQOrderItemFilterObj.orderRef.code := RQOrderObj.code;

  condition := '';
  strFilter := '';
  lblFilterDescription.Caption := '';

  if materialGroupCode > LOW_INT then
    //RQOrderItemFilterObj.conditionSQL := 'tkmaterials.rootgrouprefcode = ' + IntToStr(materialGroupCode);
    condition := 'tkmaterials.rootgrouprefcode = ' + IntToStr(materialGroupCode);

  if materialName <> '' then
  begin
    AddCondition(condition, 'UPPER(tkmaterials.name) like UPPER(''' + ToLike(materialName) + ''')');
    AddListPos(strFilter, 'Матеріал: ' + materialName);
  end;

  if contractNumber <> '' then
  begin
    AddCondition(condition, 'UPPER(rqorderitem.contractnumber) like UPPER(''' + ToLike(contractNumber) + ''')');
    AddListPos(strFilter, '№ договору: ' + contractNumber);
  end;

  if responsibleCode > LOW_INT then
  begin
    RQOrderItemFilterObj.responsiblesRef := ENResponsiblesRef.Create;
    RQOrderItemFilterObj.responsiblesRef.code := responsibleCode;
    AddListPos(strFilter, 'відп. особа: ' + responsibleName);
  end;

  if isWithoutContracts then
  begin
    AddCondition(condition, 'rqorderitem.contractnumber is null');
    AddListPos(strFilter, '  матеріали без договорів');
  end;

  if strFilter <> '' then
    lblFilterDescription.Caption := 'КРИТЕРІЇ ПОШУКУ:   ' + strFilter
  else
    lblFilterDescription.Caption := '';

  {
  if materialGroupCode > LOW_INT then
  begin
    condition := RQOrderItemFilterObj.conditionSQL; //'tkmaterials.rootgrouprefcode = ' + IntToStr(materialGroupCode);
    AddCondition(condition, 'tkmaterials.rootgrouprefcode = ' + IntToStr(materialGroupCode));
    RQOrderItemFilterObj.conditionSQL := condition;
  end;
  }

  if orgname <> '' then
  begin
		if RQorderItemFilterObj.org = nil then
		 begin RQorderItemFilterObj.org := RQOrg.Create;
					 SetNullXSProps(RQorderItemFilterObj.org);
					 SetNullIntProps(RQorderItemFilterObj.org);
		 end;
		RQorderItemFilterObj.org.name := orgname;
	end;

  if typePayCode > 0 then
    begin
       if RQorderItemFilterObj.typePayRef =  nil then
        begin
           RQorderItemFilterObj.typePayRef := RQOrderItemTypePayRef.Create();
           SetNullXSProps(RQorderItemFilterObj.typePayRef);
           SetNullIntProps(RQorderItemFilterObj.typePayRef);
        end;
       RQorderItemFilterObj.typePayRef.code := typePayCode;
       //AddCondition(condition, 'rqorderitem.typepayrefcode = ' +  IntToStr(typePayCode) );
    end;


  if budgetCode > 0 then
  begin
    if RQorderItemFilterObj.budgetRef =  nil then
    begin
      RQorderItemFilterObj.budgetRef := ENDepartmentRef.Create;
      SetNullXSProps(RQorderItemFilterObj.budgetRef);
      SetNullIntProps(RQorderItemFilterObj.budgetRef);
    end;
    RQorderItemFilterObj.budgetRef.code := budgetCode;
  end;


  RQOrderItemFilterObj.conditionSQL := condition;

  RQOrderItemFilterObj.orderBySQL := 'RQDDSCODES.TXTCODE, TKMATERIALS.NAME';

end;


procedure TfrmRQOrderEdit.actNoFilterExecute(Sender: TObject);
begin
{
  materialGroupCode := LOW_INT;
  edtMaterialName.Text := '';
  materialName := '';
  contractNumber := '';
  isWithoutContracts := false;
}
  ClearRQOrderItemFilter;

  actUpdateExecute(Sender);
end;

procedure TfrmRQOrderEdit.actEditContractExecute(Sender: TObject);
var
  strOrderItemsCodes: String;
  selected, state: Boolean;
  i, orderItemCode, tmpOrgCode: Integer;
  RQOrderItemObj: RQOrderItem;
  TempRQOrderItem: RQOrderItemControllerSoapPort;
begin
  selected := false;

  for i := 1 to sgRQOrderItem.RowCount - 1 do
  begin
    sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER, i, selected);
    if selected then break;
  end;

  if not selected then // Если не выбрана ни одна строка
  begin
    Application.MessageBox(PChar('Оберіть позиції заявки!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  state := false;

  TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;

  frmRQOrderChangeContractEdit := TfrmRQOrderChangeContractEdit.Create(Application, dsInsert);
  try
    if frmRQOrderChangeContractEdit.ShowModal = mrOk then
    begin
      if frmRQOrderChangeContractEdit.org = nil then
      begin
        Application.MessageBox(PChar('Помилка при виборі постачальника!'),
                               PChar('Увага!'), MB_ICONERROR);
        Exit;
      end;

      for i := 1 to sgRQOrderItem.RowCount - 1 do
      begin
        sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER, i, state);

        if state then
        begin
          try
            orderItemCode := StrToInt(sgRQOrderItem.Cells[0, i]);
          except
            on EConvertError do Continue;
          end;

          RQOrderItemObj := TempRQOrderItem.getObject(orderItemCode);
          if RQOrderItemObj <> nil then
          begin
            {
            ////////// Поставщик
            if RQOrderItemObj.org = nil then RQOrderItemObj.org := RQOrg.Create();
            SetNullIntProps(RQOrderItemObj.org);
            SetNullXSProps(RQOrderItemObj.org);

            RQOrderItemObj.org.id := frmRQOrderChangeContractEdit.org.id;
            RQOrderItemObj.org.codeorg := frmRQOrderChangeContractEdit.org.codeorg;
            RQOrderItemObj.org.name := frmRQOrderChangeContractEdit.org.name;
            RQOrderItemObj.org.ukr_name := frmRQOrderChangeContractEdit.org.ukr_name;
            RQOrderItemObj.org.okpo := frmRQOrderChangeContractEdit.org.okpo;
            RQOrderItemObj.org.nalog_num := frmRQOrderChangeContractEdit.org.nalog_num;
            RQOrderItemObj.org.svidet_num := frmRQOrderChangeContractEdit.org.svidet_num;
            RQOrderItemObj.org.adr := frmRQOrderChangeContractEdit.org.adr;
            RQOrderItemObj.org.tel := frmRQOrderChangeContractEdit.org.tel;
            RQOrderItemObj.org.country := frmRQOrderChangeContractEdit.org.country;
            RQOrderItemObj.org.region := frmRQOrderChangeContractEdit.org.region;
            RQOrderItemObj.org.ministry := frmRQOrderChangeContractEdit.org.ministry;
            RQOrderItemObj.org.ownership := frmRQOrderChangeContractEdit.org.ownership;
            RQOrderItemObj.org.type_ := frmRQOrderChangeContractEdit.org.type_;
            RQOrderItemObj.org.master_code := frmRQOrderChangeContractEdit.org.master_code;

            if frmRQOrderChangeContractEdit.org.date_svidet <> nil then
            begin
              RQOrderItemObj.org.date_svidet := TXSDate.Create;
              RQOrderItemObj.org.date_svidet.XSToNative(GetXSDate(EncodeDate(frmRQOrderChangeContractEdit.org.date_svidet.Year,
                                                                             frmRQOrderChangeContractEdit.org.date_svidet.Month,
                                                                             frmRQOrderChangeContractEdit.org.date_svidet.Day
                                                                             )));
            end;

            if frmRQOrderChangeContractEdit.org.likv_date <> nil then
            begin
              RQOrderItemObj.org.likv_date := TXSDate.Create;
              RQOrderItemObj.org.likv_date.XSToNative(GetXSDate(EncodeDate(frmRQOrderChangeContractEdit.org.likv_date.Year,
                                                                           frmRQOrderChangeContractEdit.org.likv_date.Month,
                                                                           frmRQOrderChangeContractEdit.org.likv_date.Day
                                                                           )));
            end;

            if frmRQOrderChangeContractEdit.org.date_nalogform <> nil then
            begin
              RQOrderItemObj.org.date_nalogform := TXSDate.Create;
              RQOrderItemObj.org.date_nalogform.XSToNative(GetXSDate(EncodeDate(frmRQOrderChangeContractEdit.org.date_nalogform.Year,
                                                                                frmRQOrderChangeContractEdit.org.date_nalogform.Month,
                                                                                frmRQOrderChangeContractEdit.org.date_nalogform.Day
                                                                                )));
            end;

            RQOrderItemObj.org.except_flag := frmRQOrderChangeContractEdit.org.except_flag;
            RQOrderItemObj.org.likv_flag := frmRQOrderChangeContractEdit.org.likv_flag;
            RQOrderItemObj.org.budget_flag := frmRQOrderChangeContractEdit.org.budget_flag;

            RQOrderItemObj.org.id_nalogform := frmRQOrderChangeContractEdit.org.id_nalogform;
            RQOrderItemObj.org.adr_legal := frmRQOrderChangeContractEdit.org.adr_legal;
            RQOrderItemObj.org.Primechan := frmRQOrderChangeContractEdit.org.Primechan;

            ///// 06.12.2016 MDAX-441
            RQOrderItemObj.org.axOrgCode := frmRQOrderChangeContractEdit.org.axOrgCode;
            RQOrderItemObj.org.axOrgId := frmRQOrderChangeContractEdit.org.axOrgId;
            /////
            //////////
            }
            RQOrderItemObj.org := DMReports.copyOrg(frmRQOrderChangeContractEdit.org, RQOrderItemObj.org);

            ////////// Договор
            if frmRQOrderChangeContractEdit.finDocID > LOW_INT then
            begin
              RQOrderItemObj.contractNumber := frmRQOrderChangeContractEdit.contractNumber;
              RQOrderItemObj.contractDate := TXSDate.Create;
              RQOrderItemObj.contractDate.XSToNative(GetXSDate(frmRQOrderChangeContractEdit.contractDate));
              RQOrderItemObj.finDocCode := frmRQOrderChangeContractEdit.finDocCode;
              RQOrderItemObj.finDocID := frmRQOrderChangeContractEdit.finDocID;
            end
            else begin
              ///// 23.12.10
              // RQOrderItemObj.contractNumber := '';
              // Разрешаем вводить руками (не выбирая из ФК)!
              RQOrderItemObj.contractNumber := frmRQOrderChangeContractEdit.contractNumber;
              /////
              RQOrderItemObj.contractDate := nil;
              RQOrderItemObj.finDocCode := '';
              RQOrderItemObj.finDocID := LOW_INT;
            end;
            //////////

            ////////// Отв. лицо
            ///////
            // 23.10.12 NET-3387 Теперь отв. лицо выбирается из развязки с материалом (на сервере)!!!
            {
            if frmRQOrderChangeContractEdit.responsibleCode > LOW_INT then
            begin
              if RQOrderItemObj.responsiblesRef = nil then RQOrderItemObj.responsiblesRef := ENResponsiblesRef.Create;
              RQOrderItemObj.responsiblesRef.code := frmRQOrderChangeContractEdit.responsibleCode;
            end
            else begin
              RQOrderItemObj.responsiblesRef := nil;
            end;
            }
            ///////
            //////////
          end;

          TempRQOrderItem.save(RQOrderItemObj);


        end; // if state
      end; // for i := 1 to sgRQOrderItem.RowCount - 1

      actUpdateExecute(Sender);
    end; // if frmRQOrderChangeContractEdit.ShowModal = mrOk
  finally
    frmRQOrderChangeContractEdit.Free;
  end;

end;

procedure TfrmRQOrderEdit.actRQOrderItemsExportExcelExecute(
  Sender: TObject);
var AppPath, FileName: String;
    OldCursor: TCursor;
begin
  if RQOrderObj = nil then Exit;

  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;

    AppPath := ExtractFilePath(Application.ExeName);
    if not DirectoryExists(AppPath + TempReportsPath) then
      CreateDir(AppPath + TempReportsPath);
    FileName := AppPath + TempReportsPath + GetFileName('Матеріали_(фільтр)_заявка_№_' + StringReplace(RQOrderObj.numberDoc, ' ', '_',
                          [rfReplaceAll, rfIgnoreCase]) + '_') + '.xls';

    aeExcel.XLSExport(FileName);
    ShellExecute(0,
                 PChar('open'),
                 PChar('"' + FileName + '"'),
                 nil,
                 nil,
                 SW_SHOWMAXIMIZED);
  finally
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmRQOrderEdit.PopupMenu1Popup(Sender: TObject);
var
  TempRQOrderItem: RQOrderItemControllerSoapPort;
  oiObj: RQOrderItem;
  approvedCost: RQApprovedCost;
  approvedCostStatus: Integer;
begin
  TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;

  try
    oiObj := TempRQOrderItem.getObject(StrToInt(sgRQOrderItem.Cells[0, sgRQOrderItem.Row]));
  except
    on EConvertError do Exit;
  end;

  DisableActions([actFilter, actNoFilter, actPrintOffertFromSelected, actPrintStringOrder,
                  {actEditContract, }actRQOrderItemsExportExcel, actBindToAxapta, actExpToAX],
                 pcRQOrder.ActivePage <> tsRQOrderItems);

  //DisableActions([actEditContract, actBindToAxapta], ((DialogState <> dsEdit) or (pcRQOrder.ActivePage <> tsRQOrderItems)));
  DisableActions([actEditContract], ((DialogState <> dsEdit) or (pcRQOrder.ActivePage <> tsRQOrderItems)));
  DisableActions([actBindToAxapta], (pcRQOrder.ActivePage <> tsRQOrderItems));
  DisableActions([actExpToAX], (pcRQOrder.ActivePage <> tsRQOrderItems));
  // Метод затвердити ціну для постачальника доступен пользователю при работе
  // с заявками, которые автоматически сформировались для закупки счетчиков на
  // услуги на стороны
  actConfirmVendorPrice.Visible := (RQOrderObj.creationMethodRef.code = RQORDER_CREATION_METHOD_AUTO_COUNTERS_SERVICES);
  if RQOrderObj.creationMethodRef.code = RQORDER_CREATION_METHOD_AUTO_COUNTERS_SERVICES then begin
    if getApprovedCostBySelectedItem.approvedCostStatusRef.code = ENConsts.RQAPPROVEDCOST_GOOD then begin
      actConfirmVendorPrice.Caption := 'Затвердити ціну постачальника';
    end else begin
      actConfirmVendorPrice.Caption := 'Відмінити затвердження ціни постачальника';
    end;
  end;

  // Утверждение сметной цены ВРТУ
  actConfirmPriceVRTU.Visible := isOrderForVRTU;
  if isOrderForVRTU then
  begin
    approvedCost := getApprovedCostBySelectedItem(true);
    if approvedCost = nil then
      actConfirmPriceVRTU.Caption := 'Затвердити кошторисну ціну'
    else begin
      if approvedCost.approvedCostStatusRef.code = ENConsts.RQAPPROVEDCOST_GOOD then
        actConfirmPriceVRTU.Caption := 'Затвердити кошторисну ціну'
      else if approvedCost.approvedCostStatusRef.code = ENConsts.RQAPPROVEDCOST_APPROVED then
        actConfirmPriceVRTU.Caption := 'Відмінити затвердження кошторисної ціни'
      else if approvedCost.approvedCostStatusRef.code = ENConsts.RQAPPROVEDCOST_APPROVED_NO_CONTROL then
        actConfirmPriceVRTU.Visible := false;
    end;
  end;

  // Просмотр сметной цены ВРТУ
  approvedCostStatus := Integer(sgRQOrderItem.Objects[2, sgRQOrderItem.Row]);
  actViewPriceVRTU.Visible := isOrderForVRTU and (approvedCostStatus = RQAPPROVEDCOST_APPROVED);

  // Утверждение сметной цены ВРТУ без контроля цены приобретения
  actConfirmPriceVRTUNoControl.Visible := isOrderForVRTU and
                                          (approvedCostStatus <> RQAPPROVEDCOST_APPROVED_NO_CONTROL) {and
                                          (HTTPRIORQOrder.HTTPWebNode.UserName = 'energynet')};

  actCreateOffers.Visible := (RQOrderObj.statusRef.code = RQORDER_STATUS_WORK_IN_MTS);

  /////
  if (HTTPRIORQOrder.HTTPWebNode.UserName <> 'energynet') then
    actCreateOffers.Visible := false;
  /////
  /// NET-4529 - нужно скрыть менюху тут ... договор и поставщик теперь меняется на строке заявке путем привязки позиций строк заявки с договором . encontractitem . механизм закупок
  // actEditContract.Visible := False;

  // Салыгин сказал  2016,09,05 для строк заявки с бюджетодержателю   АГВ и если код ддс = 221530 даем вводить договора
  // if ((oiObj.budgetRef.code =  ENConsts.ENBUDGET_AGV) and ( StringReplace(oiObj.ddsCodes.txtCode, ' ', '', [rfReplaceAll])   = '221530' ) ) then
  //  begin
  //  actEditContract.Visible := True;
  //  actEditContract.Enabled := True;
  //  end;
//     07.09.2016 на клиенте откроем меню смены дог и поставщ - проверка есть на серваке - все могут менять поставщ а агв и дог может

  ///
end;

procedure TfrmRQOrderEdit.actPrintStringOrderExecute(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName, strOrderItemsCodes: String;
  selected, state: Boolean;
  i: Integer;
begin
  selected := false;

  for i := 1 to sgRQOrderItem.RowCount - 1 do
  begin
    sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER, i, selected);
    if selected then break;
  end;

  if not selected then // Если не выбрана ни одна строка
  begin
    Application.MessageBox(PChar('Оберіть позиції заявки, для яких потрібно надрукувати звіт!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  strOrderItemsCodes := '';

  state := false;

  for i := 1 to sgRQOrderItem.RowCount - 1 do
  begin
    sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER, i, state);

    if state then
      AddListPos(strOrderItemsCodes, sgRQOrderItem.Cells[0, i]);
  end;

  if strOrderItemsCodes = '' then
  begin
    Application.MessageBox(PChar('Оберіть позиції заявки, для яких потрібно надрукувати звіт!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  SetLength(argNames, 2);
  SetLength(args, 2);

  argNames[0] := 'PcodeOrder';
  args[0] := IntToStr(RQOrderObj.code);

  argNames[1] := 'orderItemsCodes';
  args[1] := 'and ri.code in (' + strOrderItemsCodes + ')';

  reportName := 'RepOrder/rep_string_by_order';
  makeReport(reportName, argNames, args, 'xls');
end;

procedure TfrmRQOrderEdit.btnAddCountersServicesClick(Sender: TObject);
var
  TempRQOrder: RQOrderControllerSoapPort;
  orderCode: Integer;
begin
  TempRQOrder := HTTPRIORQOrder as RQOrderControllerSoapPort;
  orderCode := TempRQOrder.addCountersServices();
  Application.MessageBox(PChar('Сформовано заявку з кодом ' + IntToStr(orderCode)), PChar('Інформація'), MB_ICONINFORMATION);
end;

procedure TfrmRQOrderEdit.btnAxaptaExportClick(Sender: TObject);

  function ReplaceQuotationMarks(str: String): String;
  begin
    Result := str;

    if pos('"', str) > 0 then
      Result := '"' + AnsiReplaceText(str, '"', '""') + '"';
  end;

var
  i : Integer;
  TempRQOrderItem: RQOrderItemControllerSoapPort;
  RQOrderItemList: RQOrderItemShortList;
  RQOrderItemFilterObj : RQOrderItemFilter;
  itemList: TStringList;
  str, AppPath, ExportPath, fileName, strOrderType, strOrderForm, contractNumber, condition: String;

  TempENServicesObject: ENServicesObjectControllerSoapPort;
  agreeList: ENServicesObjectShortList;
  agreeFilter: ENServicesObjectFilter;

  {
  // хитрая подмена !!!!  меняется СУЩНОСТЬ !!! с  RQMaterials на  RQMaterials2TKMaterials
  TempRQMaterials: RQMaterialsControllerSoapPort;
  RQMaterialsFilterObj: RQMaterialsFilter;
  RQMaterialsList: RQMaterialsShortList;
  }

  //TempRQMaterials: RQMaterials2TKMaterialsControllerSoapPort;
  //RQMaterialsFilterObj: RQMaterials2TKMaterialsFilter;
  //RQMaterialsList: RQMaterials2TKMaterialsShortList;

  strName: String;
  xml: TStringList;

  isBinded: Boolean;

  packNode, requestNode, stringsNode, itemNode, nameNode: IXMLNode;

  budgCode, itemID, requestNum: Integer;
begin
  TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;

  RQOrderItemFilterObj := RQOrderItemFilter.Create;
  SetNullIntProps(RQOrderItemFilterObj);
  SetNullXSProps(RQOrderItemFilterObj);

  RQOrderItemFilterObj.orderRef := RQOrderRef.Create;
  RQOrderItemFilterObj.orderRef.code := RQOrderObj.code;

  condition := '';
  /////////////
  // 12.09.2011  не включаем строки со статусом <<<Втрачено необхідність>>>
  /////////////
  AddCondition(condition, 'rqorderitem.statusrefcode = ' + IntToStr(RQORDERITEM_STATUS_GOOD) + '');

  if edtExportContractNumber.Text <> '' then
  begin
    contractNumber := edtExportContractNumber.Text;
    AddCondition(condition, 'UPPER(rqorderitem.contractnumber) like UPPER(''' + ToLike(contractNumber) + ''')');
  end;

  if chbKEPOnly.Checked then
  begin
    AddCondition(condition, 'rqorderitem.orgcode in (select rqorg.code from rqorg where rqorg.codeorg = ''05Д9'')');
  end;

  RQOrderItemFilterObj.conditionSQL := condition;
  
  RQOrderItemFilterObj.orderBySQL := 'rqorderitem.budgetrefcode';

  RQOrderItemList := TempRQOrderItem.getScrollableFilteredList(RQOrderItemFilterObj,0,-1);

  if High(RQOrderItemList.list) = -1 then
  begin
    Application.MessageBox(PChar('Данная заявка не содержит материалов!' + #13#10 +
                                 'Экспорт прерван!'),
                           PChar('Внимание!'), MB_ICONWARNING);
    Exit;
  end;

  ////////////////////////////////////////////////////////
  AppPath := ExtractFilePath(Application.ExeName);
  ExportPath := AppPath + RQOrderExportPath + 'Заявка\';
  if not DirectoryExists(AppPath + RQOrderExportPath) then
    CreateDir(AppPath + RQOrderExportPath);
  if not DirectoryExists(ExportPath) then
    CreateDir(ExportPath);

  ///// Формируем имя файла
  //fileName := 'TestAX.xml';
  fileName := 'Заявка';
  strOrderType := '';
  strOrderForm := '';

  if RQOrderObj.rqOrderType <> nil then
  begin
    if RQOrderObj.rqOrderType.code = RQORDER_TYPE_BUDGET then
      strOrderType := 'Б';
    if RQOrderObj.rqOrderType.code = RQORDER_TYPE_INVEST then
      strOrderType := 'И';
  end;

  if RQOrderObj.rqOrderForm <> nil then
  begin
    if RQOrderObj.rqOrderForm.code = RQORDER_FORM_PLANNED then
      strOrderForm := 'П';
    if RQOrderObj.rqOrderForm.code = RQORDER_FORM_NOTPLANNED then
      strOrderForm := 'В';
  end;

 // if contractNumber <> '' then
 //  fileName := fileName + '_' + strOrderType + '_' + strOrderForm + '_ХОЭ_' + RQOrderObj.numberDoc {+ '_' + contractNumber } + '.xml'
 // else
  fileName := fileName + '_' + strOrderType + '_' + strOrderForm + '_ХОЭ_' + RQOrderObj.numberDoc + '.xml';
  /////

  xmlRQOrder.Active := false;
  xmlRQOrder.XML.Clear;
  xmlRQOrder.Active := true;

  // 27.08.2013... +++ В ХЕ свойство отвалилось !!!!
  // xmlRQOrder.Encoding := 'windows-1251'; // 04.11.11 Вот так надо кодировку указывать !!!!!

  //stringsNode := xmlRQOrder.AddChild('strings');
  packNode := xmlRQOrder.AddChild('pack');

//  xmlRQOrder.DocumentElement.AddChild('matherials');

  budgCode := LOW_INT;

  requestNum := 0;

  for i := 0 to High(RQOrderItemList.list) do
  begin
    if RQOrderItemList.list[i].budgetRefCode = LOW_INT then
      raise Exception.Create('Невідомий Бюджетотримач для строки заявки! Код строки: ' + IntToStr(RQOrderItemList.list[i].code));

    if RQOrderItemList.list[i].budgetRefCode <> budgCode then
    begin
      budgCode := RQOrderItemList.list[i].budgetRefCode;
      //budgNode := xmlRQOrder.AddChild('SERVICE_NAME');

      // Номер заявки
      inc(requestNum);

      requestNode := packNode.AddChild('request');

      requestNode.AddChild('NDOC').Text := IntToStr(requestNum);

      if RQOrderObj.orderPeriod <> nil then
        requestNode.AddChild('DT').Text := DateToStr(EncodeDate(RQOrderObj.orderPeriod.Year,
                                                                RQOrderObj.orderPeriod.Month,
                                                                RQOrderObj.orderPeriod.Day))
      else
        raise Exception.Create('Не вказано період заявки!');

      // Признак плановости: 0 - срочная (внеплановая), 1 - плановая
      if RQOrderObj.rqOrderForm.code = RQORDER_FORM_NOTPLANNED then
        requestNode.AddChild('PLAN').Text := '0'
      else if RQOrderObj.rqOrderForm.code = RQORDER_FORM_PLANNED then
        requestNode.AddChild('PLAN').Text := '1'
      else
        raise Exception.Create('Ця форма заявки не підтримується!');

      // Признак бюджетности: 0 - инвестпрограмма, 1 - бюджетная
      if RQOrderObj.rqOrderType.code = RQORDER_TYPE_INVEST then
        requestNode.AddChild('BUDG').Text := '0'
      else if RQOrderObj.rqOrderType.code = RQORDER_TYPE_BUDGET then
        requestNode.AddChild('BUDG').Text := '1'
      else
        raise Exception.Create('Цей тип заявки не підтримується!');

      requestNode.AddChild('ORG').Text := 'main_kh';

      requestNode.AddChild('SERVICE_CODE').Text := RQOrderItemList.list[i].budgetRefCFOCode;
      //budgNode.Text := RQOrderItemList.list[i].budgetRefShortName;
      //requestNode.AddChild('SERVICE_NAME').Text := RQOrderItemList.list[i].budgetRef ShortName
      requestNode.AddChild('SERVICE_NAME').Text := RQOrderItemList.list[i].budgetRefShortName;

      requestNode.AddChild('BUDGET_LINE_CODE').Text := AnsiReplaceText(RQOrderItemList.list[i].ddsCodesTxtCode, ' ', '');
      requestNode.AddChild('BUDGET_LINE_NAME').Text := RQOrderItemList.list[i].ddsCodesName;

      stringsNode := requestNode.AddChild('strings');

      itemID := 0;
    end;

    // Номер строки заявки
    inc(itemID);

    itemNode := stringsNode.AddChild('string');
    itemNode.AddChild('ID').Text := IntToStr(itemID);
    itemNode.AddChild('ID_AX').Text := RQOrderItemList.list[i].axMaterialsRefForeign_link_code;
    //nameNode := itemNode.AddChild('NAME');
    //nameNode.Text := RQOrderItemList.list[i].materialName;
    itemNode.AddChild('NAME').Text := RQOrderItemList.list[i].axMaterialsRefName_al; //RQOrderItemList.list[i].axMaterialsRefName; //RQOrderItemList.list[i].materialName;
    itemNode.AddChild('DESC').Text := RQOrderItemList.list[i].commentGen;


    itemNode.AddChild('ED_IZM').Text :=  TempRQOrderItem.getMeasurementForAX(RQOrderItemList.list[i].measurementName ,RQOrderItemList.list[i].axMaterialsRefMesure_text);
    //RQOrderItemList.list[i].axMaterialsRefMesure_text; //RQOrderItemList.list[i].measurementName;

    // Новое требование: вместо кода контрагента необходимо передавать его код ОКПО
    itemNode.AddChild('VENDOR_CODE').Text := RQOrderItemList.list[i].orgOkpo; //RQOrderItemList.list[i].orgCodeorg;
    itemNode.AddChild('VENDOR_NAME').Text := RQOrderItemList.list[i].orgName;

    itemNode.AddChild('AGREE_NUM').Text := RQOrderItemList.list[i].contractNumber; //finDocCode;
    ///// 04.11.11 Будем пока вытягивать данные по договору из ФК
    {
    if RQOrderItemList.list[i].contractDate <> nil then
    begin
      itemNode.AddChild('AGREE_IN_DATE').Text := XSDate2String(RQOrderItemList.list[i].contractDate);
      itemNode.AddChild('AGREE_REG_DATE').Text := XSDate2String(RQOrderItemList.list[i].contractDate);
    end
    else begin
      itemNode.AddChild('AGREE_IN_DATE').Text := '';
      itemNode.AddChild('AGREE_REG_DATE').Text := '';
    end;
    }
    if RQOrderItemList.list[i].finDocID > LOW_INT then
    begin
      TempENServicesObject :=  HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

      agreeFilter := ENServicesObjectFilter.Create;
      SetNullIntProps(agreeFilter);
      SetNullXSProps(agreeFilter);

      agreeFilter.finDocID := RQOrderItemList.list[i].finDocID;
      agreeList := TempENServicesObject.getContractList(agreeFilter, 0, -1);

      if agreeList.totalCount = 0 then
        raise Exception.Create('Договір з кодом ' + IntToStr(agreeFilter.finDocID) +
                               ' не знайдено в довіднику договорів ФінКолекції!' + #13#10 +
                               '(Код строки заявки: ' + IntToStr(RQOrderItemList.list[i].code) + ')');

      if agreeList.list[0] = nil then
        raise Exception.Create('Договір з кодом ' + IntToStr(agreeFilter.finDocID) +
                               ' не знайдено в довіднику договорів ФінКолекції!' + #13#10 +
                               '(Код строки заявки: ' + IntToStr(RQOrderItemList.list[i].code) + ')');

      if agreeList.list[0].contractDate <> nil then
        itemNode.AddChild('AGREE_IN_DATE').Text := XSDate2String(agreeList.list[0].contractDate)
      else
        itemNode.AddChild('AGREE_IN_DATE').Text := '';

      if agreeList.list[0].contractRegDate <> nil then
        itemNode.AddChild('AGREE_REG_DATE').Text := XSDate2String(agreeList.list[0].contractRegDate)
      else
        itemNode.AddChild('AGREE_REG_DATE').Text := '';

      if agreeList.list[0].contractStartDate <> nil then
        itemNode.AddChild('AGREE_START_DATE').Text := XSDate2String(agreeList.list[0].contractStartDate)
      else
        itemNode.AddChild('AGREE_START_DATE').Text := '';

      itemNode.AddChild('AGREE_DESCRIPTION').Text := agreeList.list[0].commentGen;
    end // if RQOrderItemList.list[i].finDocID > LOW_INT
    else begin
      if RQOrderItemList.list[i].contractDate <> nil then
        itemNode.AddChild('AGREE_IN_DATE').Text := XSDate2String(RQOrderItemList.list[i].contractDate)
      else
        itemNode.AddChild('AGREE_IN_DATE').Text := '';

      itemNode.AddChild('AGREE_REG_DATE').Text := '';
      itemNode.AddChild('AGREE_START_DATE').Text := '';
      itemNode.AddChild('AGREE_DESCRIPTION').Text := '';
    end;

    /////

    itemNode.AddChild('QUANTITY').Text := RQOrderItemList.list[i].countFact.DecimalString;
    itemNode.AddChild('SUMMA').Text := RQOrderItemList.list[i].sumGen.DecimalString;
    itemNode.AddChild('PRICE').Text := RQOrderItemList.list[i].priceWithNds.DecimalString;
    itemNode.AddChild('BASIC_PRICE').Text := RQOrderItemList.list[i].priceWithoutNds.DecimalString;
  end;

  //xmlRQOrder.Active := false;
  //xmlRQOrder.XML.Text := '<?xml version="1.0" encoding="windows-1251" ?>' + #13#10 + xmlRQOrder.XML.Text;

  //xmlRQOrder.Active := true;
  //***** xmlRQOrder.SaveToFile(ExportPath + fileName); *****//

  //xmlRQOrder.Active := false;


  // 04.11.11
  xml := TStringList.Create;
  try
    xml.Add('<?xml version="1.0" encoding="windows-1251" ?>');
    xml.Add(xmlRQOrder.XML.Text);
    xml.SaveToFile(ExportPath + fileName);
  finally
    xml.Free;
  end;

  // xmlRQOrder.XML.SaveToFile(ExportPath + fileName);
  xmlRQOrder.Active := false;

  Application.MessageBox(PChar('Экспорт успешно завершен!' + #13#10 +
                               'Заявка сохранена в файл "' + ExportPath + fileName + '" !'),
                         PChar('Сообщение'), MB_ICONINFORMATION);
end;

procedure TfrmRQOrderEdit.actBindToAxaptaExecute(Sender: TObject);
var materialCode, orderItemCode: Integer;
    orderItemObj: RQOrderItem;
    TempTKMaterials: TKMaterialsControllerSoapPort;
    TempRQOrderItem: RQOrderItemControllerSoapPort;
begin
  TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;

  try
    orderItemCode := StrToInt(sgRQOrderItem.Cells[0, sgRQOrderItem.Row]);
    //orderItemObj := TempRQOrderItem.getObject(StrToInt(sgRQOrderItem.Cells[0, sgRQOrderItem.Row]));
    orderItemObj := TempRQOrderItem.getObject(orderItemCode);
  except
    on EConvertError do Exit;
  end;

  TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
  TKMaterialsObj := TempTKMaterials.getObject(orderItemObj.material.code);

  frmTKMaterialsEdit := TfrmTKMaterialsEdit.Create(Application, dsEdit);
  try
    frmTKMaterialsEdit.isBindToAxapta := true;
    //frmTKMaterialsEdit.DisableControls([frmTKMaterialsEdit.edtName]);
    //frmTKMaterialsEdit.DisableControls(frmTKMaterialsEdit);
    frmTKMaterialsEdit.DisableControls(frmTKMaterialsEdit.tsGeneral);


		frmTKMaterialsEdit.DisableControls([frmTKMaterialsEdit.spbTKAXMaterials,
																				frmTKMaterialsEdit.grpMaterialsLinks,
																				frmTKMaterialsEdit.grpIdent,
																				frmTKMaterialsEdit.btnOk,
																				frmTKMaterialsEdit.btnCancel], false);
		frmTKMaterialsEdit.DisableControls([frmTKMaterialsEdit.spbTKParentName, frmTKMaterialsEdit.CheckBox1,
																				frmTKMaterialsEdit.chbIsGroup]);


		if frmTKMaterialsEdit.ShowModal = mrOk then
		begin
      // Выделим привязанные материалы жирным
      sgRQOrderItem.CellProperties[4, sgRQOrderItem.Row].FontStyle := sgRQOrderItem.CellProperties[4, sgRQOrderItem.Row].FontStyle - [fsBold];
      orderItemObj := TempRQOrderItem.getObject(orderItemCode);
      if orderItemObj.material.axMaterialsRef <> nil then
        if orderItemObj.material.axMaterialsRef.code > LOW_INT then
          sgRQOrderItem.CellProperties[4, sgRQOrderItem.Row].FontStyle := sgRQOrderItem.CellProperties[4, sgRQOrderItem.Row].FontStyle + [fsBold];
    end;
  finally
    frmTKMaterialsEdit.Free;
  end;
end;

procedure TfrmRQOrderEdit.ExpToAXClick(Sender: TObject);
var
  str, AppPath, ExportPath, fileName, strOrderType, strOrderForm, contractNumber, condition, strOrderItemsCodes: String;
  selected, state: Boolean;
  i: Integer;

  TempRQOrderItem: RQOrderItemControllerSoapPort;
  RQOrderItemList: RQOrderItemShortList;
  RQOrderItemFilterObj : RQOrderItemFilter;
  itemList: TStringList;


  TempENServicesObject: ENServicesObjectControllerSoapPort;
  agreeList: ENServicesObjectShortList;
  agreeFilter: ENServicesObjectFilter;

  strName: String;
  xml: TStringList;

  isBinded: Boolean;

  packNode, requestNode, stringsNode, itemNode, nameNode: IXMLNode;

  budgCode, itemID, requestNum: Integer;

begin
  selected := false;

  for i := 1 to sgRQOrderItem.RowCount - 1 do
  begin
    sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER, i, selected);
    if selected then break;
  end;

  if not selected then // Если не выбрана ни одна строка
  begin
    Application.MessageBox(PChar('Не вибрана жодна позиція заявки!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  strOrderItemsCodes := '';

  state := false;

  for i := 1 to sgRQOrderItem.RowCount - 1 do
  begin
    sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER, i, state);

    if state then
      AddListPos(strOrderItemsCodes, sgRQOrderItem.Cells[0, i]);
  end;

  if strOrderItemsCodes = '' then
  begin
    Application.MessageBox(PChar('Не вибрана жодна позиція заявки!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;

  RQOrderItemFilterObj := RQOrderItemFilter.Create;
  SetNullIntProps(RQOrderItemFilterObj);
  SetNullXSProps(RQOrderItemFilterObj);

  condition := '';

  /// Среди выбраных строк экспортируем только "Необходимые" строки у которых поставщик Комплектэнергопоставка

  AddCondition(condition, 'rqorderitem.statusrefcode = ' + IntToStr(RQORDERITEM_STATUS_GOOD) + '');
  AddCondition(condition, 'rqorderitem.orgcode in (select rqorg.code from rqorg where rqorg.codeorg = ''05Д9'')');

  AddCondition(condition, 'rqorderitem.code in ('+ strOrderItemsCodes + ')');

  RQOrderItemFilterObj.conditionSQL := condition;

  RQOrderItemFilterObj.orderBySQL := 'rqorderitem.budgetrefcode';

  RQOrderItemList := TempRQOrderItem.getScrollableFilteredList(RQOrderItemFilterObj,0,-1);

   AppPath := ExtractFilePath(Application.ExeName);
  ExportPath := AppPath + RQOrderExportPath + 'Заявка_доп_строки\';
  if not DirectoryExists(AppPath + RQOrderExportPath) then
    CreateDir(AppPath + RQOrderExportPath);
  if not DirectoryExists(ExportPath) then
    CreateDir(ExportPath);

  ///// Формируем имя файла
  //fileName := 'TestAX.xml';
  fileName := 'Заявка_доп_строки';
  strOrderType := '';
  strOrderForm := '';

  if RQOrderObj.rqOrderType <> nil then
  begin
    if RQOrderObj.rqOrderType.code = RQORDER_TYPE_BUDGET then
      strOrderType := 'Б';
    if RQOrderObj.rqOrderType.code = RQORDER_TYPE_INVEST then
      strOrderType := 'И';
  end;

  if RQOrderObj.rqOrderForm <> nil then
  begin
    if RQOrderObj.rqOrderForm.code = RQORDER_FORM_PLANNED then
      strOrderForm := 'П';
    if RQOrderObj.rqOrderForm.code = RQORDER_FORM_NOTPLANNED then
      strOrderForm := 'В';
  end;

  fileName := fileName + '_' + strOrderType + '_' + strOrderForm + '_ХОЭ_' + RQOrderObj.numberDoc + '.xml';

  xmlRQOrder.Active := false;
  xmlRQOrder.XML.Clear;
  xmlRQOrder.Active := true;

  // 27.08.2013... +++ В ХЕ свойство отвалилось !!!!
  // xmlRQOrder.Encoding := 'windows-1251'; // 04.11.11 Вот так надо кодировку указывать !!!!!


  packNode := xmlRQOrder.AddChild('pack');

  budgCode := LOW_INT;

  requestNum := 0;

  for i := 0 to High(RQOrderItemList.list) do
  begin
    if RQOrderItemList.list[i].budgetRefCode = LOW_INT then
      raise Exception.Create('Невідомий Бюджетотримач для строки заявки! Код строки: ' + IntToStr(RQOrderItemList.list[i].code));

    if RQOrderItemList.list[i].budgetRefCode <> budgCode then
    begin
      budgCode := RQOrderItemList.list[i].budgetRefCode;
      //budgNode := xmlRQOrder.AddChild('SERVICE_NAME');

      // Номер заявки
      inc(requestNum);

      requestNode := packNode.AddChild('request');

      requestNode.AddChild('NDOC').Text := IntToStr(requestNum);

      if RQOrderObj.orderPeriod <> nil then
        requestNode.AddChild('DT').Text := DateToStr(EncodeDate(RQOrderObj.orderPeriod.Year,
                                                                RQOrderObj.orderPeriod.Month,
                                                                RQOrderObj.orderPeriod.Day))
      else
        raise Exception.Create('Не вказано період заявки!');

      // Признак плановости: 0 - срочная (внеплановая), 1 - плановая
      if RQOrderObj.rqOrderForm.code = RQORDER_FORM_NOTPLANNED then
        requestNode.AddChild('PLAN').Text := '0'
      else if RQOrderObj.rqOrderForm.code = RQORDER_FORM_PLANNED then
        requestNode.AddChild('PLAN').Text := '1'
      else
        raise Exception.Create('Ця форма заявки не підтримується!');

      // Признак бюджетности: 0 - инвестпрограмма, 1 - бюджетная
      if RQOrderObj.rqOrderType.code = RQORDER_TYPE_INVEST then
        requestNode.AddChild('BUDG').Text := '0'
      else if RQOrderObj.rqOrderType.code = RQORDER_TYPE_BUDGET then
        requestNode.AddChild('BUDG').Text := '1'
      else
        raise Exception.Create('Цей тип заявки не підтримується!');

      requestNode.AddChild('ORG').Text := 'main_kh';

      requestNode.AddChild('SERVICE_CODE').Text := RQOrderItemList.list[i].budgetRefCFOCode;
      //budgNode.Text := RQOrderItemList.list[i].budgetRefShortName;
      //requestNode.AddChild('SERVICE_NAME').Text := RQOrderItemList.list[i].budgetRef ShortName
      requestNode.AddChild('SERVICE_NAME').Text := RQOrderItemList.list[i].budgetRefShortName;

      requestNode.AddChild('BUDGET_LINE_CODE').Text := AnsiReplaceText(RQOrderItemList.list[i].ddsCodesTxtCode, ' ', '');
      requestNode.AddChild('BUDGET_LINE_NAME').Text := RQOrderItemList.list[i].ddsCodesName;

      stringsNode := requestNode.AddChild('strings');

      itemID := 0;
    end;

    // Номер строки заявки
    inc(itemID);

    itemNode := stringsNode.AddChild('string');
    itemNode.AddChild('ID').Text := IntToStr(itemID);
    itemNode.AddChild('ID_AX').Text := RQOrderItemList.list[i].axMaterialsRefForeign_link_code;
    //nameNode := itemNode.AddChild('NAME');
    //nameNode.Text := RQOrderItemList.list[i].materialName;
    itemNode.AddChild('NAME').Text := RQOrderItemList.list[i].axMaterialsRefName_al; //RQOrderItemList.list[i].axMaterialsRefName; //RQOrderItemList.list[i].materialName;
    itemNode.AddChild('DESC').Text := RQOrderItemList.list[i].commentGen;
    itemNode.AddChild('ED_IZM').Text :=  TempRQOrderItem.getMeasurementForAX(RQOrderItemList.list[i].measurementName ,RQOrderItemList.list[i].axMaterialsRefMesure_text);

    // Новое требование: вместо кода контрагента необходимо передавать его код ОКПО
    itemNode.AddChild('VENDOR_CODE').Text := RQOrderItemList.list[i].orgOkpo; //RQOrderItemList.list[i].orgCodeorg;
    itemNode.AddChild('VENDOR_NAME').Text := RQOrderItemList.list[i].orgName;

    itemNode.AddChild('AGREE_NUM').Text := RQOrderItemList.list[i].contractNumber; //finDocCode;

    ///// 04.11.11 Будем пока вытягивать данные по договору из ФК
    if RQOrderItemList.list[i].finDocID > LOW_INT then
    begin
      TempENServicesObject :=  HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

      agreeFilter := ENServicesObjectFilter.Create;
      SetNullIntProps(agreeFilter);
      SetNullXSProps(agreeFilter);

      agreeFilter.finDocID := RQOrderItemList.list[i].finDocID;
      agreeList := TempENServicesObject.getContractList(agreeFilter, 0, -1);

      if agreeList.totalCount = 0 then
        raise Exception.Create('Договір з кодом ' + IntToStr(agreeFilter.finDocID) +
                               ' не знайдено в довіднику договорів ФінКолекції!' + #13#10 +
                               '(Код строки заявки: ' + IntToStr(RQOrderItemList.list[i].code) + ')');

      if agreeList.list[0] = nil then
        raise Exception.Create('Договір з кодом ' + IntToStr(agreeFilter.finDocID) +
                               ' не знайдено в довіднику договорів ФінКолекції!' + #13#10 +
                               '(Код строки заявки: ' + IntToStr(RQOrderItemList.list[i].code) + ')');

      if agreeList.list[0].contractDate <> nil then
        itemNode.AddChild('AGREE_IN_DATE').Text := XSDate2String(agreeList.list[0].contractDate)
      else
        itemNode.AddChild('AGREE_IN_DATE').Text := '';

      if agreeList.list[0].contractRegDate <> nil then
        itemNode.AddChild('AGREE_REG_DATE').Text := XSDate2String(agreeList.list[0].contractRegDate)
      else
        itemNode.AddChild('AGREE_REG_DATE').Text := '';

      if agreeList.list[0].contractStartDate <> nil then
        itemNode.AddChild('AGREE_START_DATE').Text := XSDate2String(agreeList.list[0].contractStartDate)
      else
        itemNode.AddChild('AGREE_START_DATE').Text := '';

      itemNode.AddChild('AGREE_DESCRIPTION').Text := agreeList.list[0].commentGen;
    end // if RQOrderItemList.list[i].finDocID > LOW_INT
    else begin
      if RQOrderItemList.list[i].contractDate <> nil then
        itemNode.AddChild('AGREE_IN_DATE').Text := XSDate2String(RQOrderItemList.list[i].contractDate)
      else
        itemNode.AddChild('AGREE_IN_DATE').Text := '';

      itemNode.AddChild('AGREE_REG_DATE').Text := '';
      itemNode.AddChild('AGREE_START_DATE').Text := '';
      itemNode.AddChild('AGREE_DESCRIPTION').Text := '';
    end;

    /////

    itemNode.AddChild('QUANTITY').Text := RQOrderItemList.list[i].countFact.DecimalString;
    itemNode.AddChild('SUMMA').Text := RQOrderItemList.list[i].sumGen.DecimalString;
    itemNode.AddChild('PRICE').Text := RQOrderItemList.list[i].priceWithNds.DecimalString;
    itemNode.AddChild('BASIC_PRICE').Text := RQOrderItemList.list[i].priceWithoutNds.DecimalString;
  end;


  // 04.11.11
  xml := TStringList.Create;
  try
    xml.Add('<?xml version="1.0" encoding="windows-1251" ?>');
    xml.Add(xmlRQOrder.XML.Text);
    xml.SaveToFile(ExportPath + fileName);
  finally
    xml.Free;
  end;


  // xmlRQOrder.XML.SaveToFile(ExportPath + fileName);
  xmlRQOrder.Active := false;

  Application.MessageBox(PChar('Экспорт успешно завершен!' + #13#10 +
                               'Заявка сохранена в файл "' + ExportPath + fileName + '" !'),
                         PChar('Сообщение'), MB_ICONINFORMATION);
end;

procedure TfrmRQOrderEdit.actSelectAllExecute(Sender: TObject);
var
  i, ObjCode : Integer;
begin
  checkGrid(sgRQOrderItem, MATERIAL_COL_NUMBER, true);

  selectedItemsList := nil;
  selectedItemsList := TList.Create;

  for i := 1 to sgRQOrderItem.RowCount - 1 do begin
      try
        ObjCode := StrToInt(sgRQOrderItem.Cells[0,i]);
      except on EConvertError do Exit;
      end;
      selectedItemsList.Add(Ptr(ObjCode));
  end;
end;

procedure TfrmRQOrderEdit.actChangeStatusOrderItemExecute(
  Sender: TObject);
  var
    RQOrderItObj: RQOrderItem;
  TempRQOrderItem: RQOrderItemControllerSoapPort;
  orderItems : RQOrderItemShortList;
  codes : RQOrderItemController.ArrayOfInteger;
  filter : RQOrderItemFilter;
  i : Integer;
begin
 // inherited;
     frmChangeStatusOrderItem := TfrmChangeStatusOrderItem.Create(Application, dsInsert);
      TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
  try

    if ((selectedItemsList = nil) or (selectedItemsList.Count = 0)) then begin
      Application.MessageBox(PChar('Не обрані строки заявки'),PChar('Увага !'),MB_ICONWARNING+MB_OK); Exit;
    end;

    if frmChangeStatusOrderItem.ShowModal = mrOk then
    begin
         RQOrderItObj := RQOrderItem.Create;
         SetNullXSProps(RQOrderItObj);
         SetNullIntProps(RQOrderItObj);

         RQOrderItObj.statusRef := RQOrderItemStatusRef.Create;
         RQOrderItObj.statusRef.code := frmChangeStatusOrderItem.cbRQOrderItemStatus.ItemIndex + 1;
         RQOrderItObj.statusReason := frmChangeStatusOrderItem.edtStatusReason.Text;

         filter := RQOrderItemFilter.Create;
         SetNullXSProps(filter);
         SetNullIntProps(filter);

         filter.conditionSQL := 'RQORDERITEM.CODE IN (' + getStringTListOfIntegers(selectedItemsList, ',') + ')';


         orderItems := TempRQOrderItem.getScrollableFilteredList(filter, 0, -1);
         if((not Assigned(orderItems)) or (orderItems.totalCount = 0)) then Exit;

         SetLength(codes, orderItems.totalCount);
         for i := 0 to orderItems.totalCount - 1 do codes[i] := orderItems.list[i].code;
           

         if Application.MessageBox(PChar(Format('Ви дійсно бажаєте змінити статус %d строкам заявки на ''%s''?'
            , [orderItems.totalCount, frmChangeStatusOrderItem.cbRQOrderItemStatus.Text])),
                    PChar('Увага!'),MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=IDYES then begin
            TempRQOrderItem.changeStatusOrderItem(RQOrderItObj, codes);
            actUpdateExecute(Sender);
            Application.MessageBox(PChar(Format('%d строкам заявки змінено статус на ''%s''!', [orderItems.totalCount
              , frmChangeStatusOrderItem.cbRQOrderItemStatus.Text])), PChar('Повідомлення'), MB_ICONINFORMATION);


         end;
    end;
  finally
     frmChangeStatusOrderItem.Free;
  end;
end;

procedure TfrmRQOrderEdit.actCheckAllOfferItemsExecute(Sender: TObject);
begin
  CheckGrid(sgRQOfferItem, 1, true);
end;

procedure TfrmRQOrderEdit.actClearAllExecute(Sender: TObject);
var
  index, i, ObjCode : Integer;
begin
  checkGrid(sgRQOrderItem, MATERIAL_COL_NUMBER, false);

  selectedItemsList := nil;
  selectedItemsList := TList.Create;

  for i := 1 to sgRQOrderItem.RowCount - 1 do begin
      try
        ObjCode := StrToInt(sgRQOrderItem.Cells[0,i]);
      except on EConvertError do Exit;
      end;
      index := selectedItemsList.IndexOf(Ptr(ObjCode));
      if index <> -1 then
        selectedItemsList.Delete(index);
  end;
end;

procedure TfrmRQOrderEdit.actConfirmPriceVRTUExecute(Sender: TObject);
var
  TempRQApprovedCost : RQApprovedCostControllerSoapPort;
  approvedCost : RQApprovedCost;
  approvedCostFilter : RQApprovedCostFilter;

  orderItemCode : Integer;
  orderItem : RQOrderItem;
  TempRQOrderItem : RQOrderItemControllerSoapPort;
  approvedCostList : RQApprovedCostShortList;
begin
  TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
  try
    orderItemCode := StrToInt(sgRQOrderItem.Cells[0, sgRQOrderItem.Row]);
    orderItem := TempRQOrderItem.getObject(orderItemCode);
  except
    on EConvertError do Exit;
  end;

  approvedCost := Self.getApprovedCostBySelectedItem(true);

  if approvedCost = nil then
  begin
    approvedCost := RQApprovedCost.Create;
    SetNullIntProps(approvedCost);
    SetNullXSProps(approvedCost);

    approvedCost.rqOrderItemRef := RQOrderItemRef.Create;
    approvedCost.rqOrderItemRef.code := orderItemCode;

    approvedCost.approvedCostStatusRef := RQApprovedCostStatusRef.Create;
    approvedCost.approvedCostStatusRef.code := ENConsts.RQAPPROVEDCOST_GOOD;
  end;

  if approvedCost.countGen = nil then
    approvedCost.countGen := TXSDecimal.Create;
  approvedCost.countGen.DecimalString := orderItem.countFact.DecimalString;

  TempRQApprovedCost := HTTPRIORQApprovedCost as RQApprovedCostControllerSoapPort;

  if approvedCost.approvedCostStatusRef.code = ENConsts.RQAPPROVEDCOST_GOOD then
  begin

    frmSetRQApprovedCost := TfrmSetRQApprovedCost.Create(Application, dsEdit);
    try
      frmSetRQApprovedCost.Caption := 'Встановлення кошторисної ціни';
      frmSetRQApprovedCost.lblPrice.Caption := 'Кошторисна ціна (без ПДВ)';
      frmSetRQApprovedCost.lblPriceVAT.Caption := 'Кошторисна ціна (з ПДВ)';
      frmSetRQApprovedCost.DisableControls([frmSetRQApprovedCost.edtCountGen]);
      frmSetRQApprovedCost.approvedCost := approvedCost;

      if frmSetRQApprovedCost.ShowModal = mrOk then
      begin
        TempRQApprovedCost.confirmCostVRTU(frmSetRQApprovedCost.approvedCost);
        UpdateGrid(Sender);
      end;
    finally
      frmSetRQApprovedCost.Free;
      frmSetRQApprovedCost := nil;
    end;

  end
  else begin
    if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити затвердження кошторисної ціни для обраної строки?'),
                              PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
    begin
      TempRQApprovedCost.undoConfirmCostVRTU(approvedCost.code);
      UpdateGrid(Sender);
    end;
  end;

end;

procedure TfrmRQOrderEdit.actConfirmPriceVRTUNoControlExecute(Sender: TObject);
var
  TempRQApprovedCost: RQApprovedCostControllerSoapPort;
  approvedCost: RQApprovedCost;
  approvedCostFilter: RQApprovedCostFilter;

  i, orderItemCode: Integer;
  orderItem: RQOrderItem;
  TempRQOrderItem: RQOrderItemControllerSoapPort;
  approvedCostList: RQApprovedCostShortList;

  selected, state: Boolean;
begin
  selected := false;

  for i := 1 to sgRQOrderItem.RowCount - 1 do
  begin
    sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER, i, selected);
    if selected then break;
  end;

  if not selected then // Если не выбрана ни одна строка
  begin
    Application.MessageBox(PChar('Оберіть позиції заявки!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте затвердити кошторисну ціну (без контролю ціни придбання) для ВСІХ обраних строк?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;

  state := false;

  TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;

  for i := 1 to sgRQOrderItem.RowCount - 1 do
  begin
    sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER, i, state);

    if state then
    begin
      try
        orderItemCode := StrToInt(sgRQOrderItem.Cells[0, i]);
        orderItem := TempRQOrderItem.getObject(orderItemCode);
      except
        on EConvertError do Exit;
      end;

      approvedCost := Self.getApprovedCostBySelectedItem(true, i);

      if approvedCost = nil then
      begin
        approvedCost := RQApprovedCost.Create;
        SetNullIntProps(approvedCost);
        SetNullXSProps(approvedCost);

        approvedCost.rqOrderItemRef := RQOrderItemRef.Create;
        approvedCost.rqOrderItemRef.code := orderItemCode;

        approvedCost.approvedCostStatusRef := RQApprovedCostStatusRef.Create;
        approvedCost.approvedCostStatusRef.code := ENConsts.RQAPPROVEDCOST_GOOD;
      end;

      if approvedCost.countGen = nil then
        approvedCost.countGen := TXSDecimal.Create;
      approvedCost.countGen.DecimalString := orderItem.countFact.DecimalString;

      if approvedCost.priceWithoutNds = nil then
        approvedCost.priceWithoutNds := TXSDecimal.Create;
      approvedCost.priceWithoutNds.DecimalString := orderItem.priceWithoutNds.DecimalString;

      TempRQApprovedCost := HTTPRIORQApprovedCost as RQApprovedCostControllerSoapPort;
      TempRQApprovedCost.confirmCostVRTUNoControl(approvedCost);

    end; // if state

  end; // for i := 1 to sgRQOrderItem.RowCount - 1

  actUpdateExecute(Sender);
end;

procedure TfrmRQOrderEdit.actConfirmVendorPriceExecute(Sender: TObject);
var
  TempRQApprovedCost : RQApprovedCostControllerSoapPort;
  approvedCost : RQApprovedCost;
  approvedCostFilter : RQApprovedCostFilter;

  orderItemCode : Integer;
  orderItem : RQOrderItem;
  TempRQOrderItem : RQOrderItemControllerSoapPort;
  approvedCostList : RQApprovedCostShortList;
  formApprovedCost : TfrmSetRQApprovedCost;
begin
  inherited;

  TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
  try
    orderItemCode := StrToInt(sgRQOrderItem.Cells[0,sgRQOrderItem.Row]);
    orderItem := TempRQOrderItem.getObject(orderItemCode);
  except
    on EConvertError do Exit;
  end;

  approvedCost := Self.getApprovedCostBySelectedItem;
  approvedCost.countGen.decimalString := orderItem.countFact.DecimalString;

  TempRQApprovedCost := HTTPRIORQApprovedCost as RQApprovedCostControllerSoapPort;

  if approvedCost.approvedCostStatusRef.code = ENConsts.RQAPPROVEDCOST_GOOD then begin

    formApprovedCost := TfrmSetRQApprovedCost.Create(Application, dsInsert);
    formApprovedCost.approvedCost := approvedCost;

    if formApprovedCost.ShowModal = mrOk then begin
      TempRQApprovedCost.confirmCost(formApprovedCost.approvedCost);
      UpdateGrid(Sender);
    end;
  end else begin
      if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити затвердження ціни постачальника для обраної строки ?'),
                      PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
      TempRQApprovedCost.undoConfirmCost(approvedCost.code);
      UpdateGrid(Sender);
    end;

    // haha
  end;

end;

procedure TfrmRQOrderEdit.ClearRQOrderItemFilter;
begin
  materialGroupCode := LOW_INT;
  edtMaterialName.Text := '';
  materialName := '';
  orgName := '';
  contractNumber := '';
  isWithoutContracts := false;

  responsibleCode := LOW_INT;
	responsibleName := '';

	typePayCode:= LOW_INT;

  budgetCode := LOW_INT;
  budgetName := '';
end;

procedure TfrmRQOrderEdit.btnOrderExecuteWorkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'PcodeOrder';
  args[0] := IntToStr(RQOrderObj.code);

   reportName := 'order/orderExecuteWork';
   makeReport(reportName, argNames, args, 'xls');
end;

procedure TfrmRQOrderEdit.btnPrintOrderByAgreeClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName, condition, orderItemCodes : String;
  TempRQOrderItem : RQOrderItemControllerSoapPort;
  orderItemFilter : RQOrderItemFilter;
  orderItemList : RQOrderItemShortList;
  i : Integer;
  finDocIdList : TList;
  finDocNumberList : TStringList;
  finDocNumber : String;

  frmWaitForm : TForm;  // Форма ожидания
  lblWait : TLabel; // лейбл ожидания
begin
  try
    Application.ProcessMessages;
    TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
    orderItemFilter := RQOrderItemFilter.Create;
    SetNullXSProps(orderItemFilter);
    SetNullIntProps(orderItemFilter);
    orderItemFilter.orderRef := RQOrderRef.Create;
    orderItemFilter.orderRef.code := RQOrderObj.code;

    if chbPrintOnlyForOneAgree.Checked = true then
    begin
        finDocNumber := edtExportContractNumber.Text;
        if finDocNumber = '' then
        begin
          Application.MessageBox(PChar('Введіть № договору (для експорту)!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
          Exit;
        end;
    end;

    if (chbOnlyCheckedStrings.Checked) and (chbPrintOnlyForOneAgree.Checked = false) then
    begin
          // Такого условия быть не должно
          Application.MessageBox(PChar('Error'),PChar('Увага !'),MB_ICONWARNING+MB_OK); Exit;
    end;

    {Если поставлен флажок "Друкувати заявки на які є рахунки", то будут печататься строки, на кот. есть счета}
    if not chbIsInBill.Checked then
          condition := ' NOT EXISTS (select bioi.orderitemrefcode from rqbillitem2orderitem as bioi where bioi.orderitemrefcode = RQORDERITEM.CODE)';

    if (chbOnlyCheckedStrings.Checked) and ((selectedItemsList = nil) or (selectedItemsList.Count = 0)) then begin
      Application.MessageBox(PChar('Не обрані строки заявки'),PChar('Увага !'),MB_ICONWARNING+MB_OK); Exit;
    end;
    if (chbOnlyCheckedStrings.Checked) then
    if Length(condition) = 0 then
      condition := 'RQORDERITEM.CODE IN (' + getStringTListOfIntegers(selectedItemsList, ',') + ')'
    else
      condition := condition + ' AND RQORDERITEM.CODE IN (' + getStringTListOfIntegers(selectedItemsList, ',') + ')';
    {Дописывание условия на то что поле договора не null}
    if condition <> '' then
      condition := condition + ' AND RQORDERITEM.FINDOCID IS NOT NULL '
    else
      condition := ' RQORDERITEM.FINDOCID IS NOT NULL ';

    {Дописывание условия на статус строки не равен непотрібно замовляти}
    if condition <> '' then
      condition := condition + ' AND RQORDERITEM.STATUSREFCODE <> ' + IntToStr(RQORDERITEM_STATUS_CANCELED)
    else
      condition := ' RQORDERITEM.STATUSREFCODE <> ' + IntToStr(RQORDERITEM_STATUS_CANCELED);

    if chbPrintOnlyForOneAgree.Checked = true then
    begin
      orderItemFilter.contractNumber := finDocNumber;
    end;

    orderItemFilter.conditionSQL := condition;

    orderItemList := TempRQOrderItem.getScrollableFilteredList(orderItemFilter, 0, -1);

    if orderItemList.totalCount = 0 then
    begin
      if chbPrintOnlyForOneAgree.Checked = true then
                       Application.MessageBox(PChar('Не знайдено строк з договором № ' + finDocNumber +
                        ', або на всі строки з цим договором вже були зроблені рахунки!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      Exit;
    end;
    finDocIdList := TList.Create;
    finDocNumberList := TStringList.Create;

    for i := 0 to orderItemList.totalCount - 1 do
    begin
      if (finDocIdList.IndexOf(Ptr(orderItemList.list[i].finDocID)) = -1) and (orderItemList.list[i].finDocID <> Low(Integer)) then
      begin
          finDocIdList.Add(Ptr(orderItemList.list[i].finDocID));
          finDocNumberList.Add(orderItemList.list[i].finDocCode);
      end;
      if Length(orderItemCodes) > 0 then
        orderItemCodes := orderItemCodes + ', ' +  IntToStr(orderItemList.list[i].code)
      else
        orderItemCodes := IntToStr(orderItemList.list[i].code);
    end;

    SetLength(argNames, 3);
    SetLength(args, 3);

    argNames[0] := 'PcodeOrder';
    args[0] := IntToStr(RQOrderObj.code);

    argNames[1] := 'orderItemCodes';
    args[1] := ' AND ri.code in (' + orderItemCodes + ')';

    if chbPriceAndCostIsShown.Checked then
      reportName := 'RepOrder/rep_string_by_agree/rep_string_by_agree'
    else
      reportName := 'RepOrder/rep_string_by_agree/rep_string_by_agree_wpc';

    frmWaitForm := nil;
    lblWait := nil;

    for i := 0 to finDocIdList.Count -1 do begin
       {if frmWaitForm = nil then frmWaitForm := TForm.Create(Application);
       frmWaitForm.Position := poDesktopCenter;
       frmWaitForm.BorderIcons := frmWaitForm.BorderIcons - [biMinimize] - [biMaximize];
       if lblWait = nil then lblWait := TLabel.Create(frmWaitForm);

       with lblWait do
       begin
          Parent := frmWaitForm;
          Caption := 'Опрацьовано ' + IntToStr(i + 1) + ' з ' + IntToStr(finDocIdList.Count) + ' договорів';
          frmWaitForm.Width := 50 + Width;
          frmWaitForm.Height  := 50 + Height;
          Visible := True;
       end;

       if frmWaitForm.Visible = False then
        frmWaitForm.Show;}

       argNames[2] := 'findocid';
       args[2] := IntToStr(Integer(finDocIDList[i]));
       makeReport(reportName, argNames, args, 'pdf', 'Договор_'+ finDocNumberList[i]);
    end;

  finally
    if finDocIdList <> nil then begin finDocIdList.Free; finDocIdList := nil; end;
    if finDocNumberList <> nil then begin finDocNumberList.Free; finDocNumberList := nil;end;
    if frmWaitForm <> nil then begin frmWaitForm.Destroy; frmWaitForm := nil; end;
  end;
end;


procedure TfrmRQOrderEdit.sgRQFKOrderClick(Sender: TObject);
begin
  inherited;
  UpdateItemGrid();
end;


procedure TfrmRQOrderEdit.sgRQOrderItemCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
  var
ObjCode, index : Integer;
begin
  inherited;
  // Считывание кода строки
  try
    ObjCode := StrToInt(sgRQOrderItem.Cells[0, ARow]);
  except
  on EConvertError do Exit;
  end;

  if State then
  begin
    // Создание списка отмеченных строк если
    if selectedItemsList = nil then selectedItemsList := TList.Create;
    // Добавление в список отмеченной строки
    selectedItemsList.Add(Ptr(ObjCode));
  end
  else
  begin
    // Считывание индекса удаляемого элемента
    index := selectedItemsList.IndexOf(Ptr(ObjCode));
    // Удаление объекта по индексу
    if index <> -1 then
      selectedItemsList.Delete(index);
  end;
end;

procedure TfrmRQOrderEdit.chbPrintOnlyForOneAgreeClick(Sender: TObject);
begin
  inherited;

  // Если поставлен флажок, то появляется еще один флажок - "Тільки за відміченними строками"
  if chbPrintOnlyForOneAgree.Checked then
  begin
    chbOnlyCheckedStrings.Visible := True;
  end
  else
  begin
    chbOnlyCheckedStrings.Checked := false;
    chbOnlyCheckedStrings.Visible := false;
  end;
end;


procedure TfrmRQOrderEdit.chkPrihodClick(Sender: TObject);
begin
  inherited;
  pcRQOrderChange(Sender);
end;


procedure TfrmRQOrderEdit.btnPrintMaterialsDistributionClick(
  Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName, condition, orderItemCodes : String;
  TempRQOrderItem : RQOrderItemControllerSoapPort;
  orderItemFilter : RQOrderItemFilter;
  orderItemList : RQOrderItemShortList;
  i : Integer;
  finDocIdList : TList;
  finDocNumberList : TStringList;
  finDocNumber : String;


begin
  inherited;
    try

      Application.ProcessMessages;
      TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
      orderItemFilter := RQOrderItemFilter.Create;
      SetNullXSProps(orderItemFilter);
      SetNullIntProps(orderItemFilter);
      orderItemFilter.orderRef := RQOrderRef.Create;
      orderItemFilter.orderRef.code := RQOrderObj.code;

      finDocNumber := edtExportContractNumber.Text;
      if finDocNumber = '' then
      begin
        Application.MessageBox(PChar('Введіть № договору (для експорту)!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
        Exit;
      end;

      {Если поставлен флажок "Друкувати заявки на які є рахунки", то будут печататься строки, на кот. есть счета}
      if not chbIsInBill.Checked then
          condition := ' NOT EXISTS (select bioi.orderitemrefcode from rqbillitem2orderitem as bioi where bioi.orderitemrefcode = RQORDERITEM.CODE)';

       if (chbOnlyCheckedStrings.Checked) and ((selectedItemsList = nil) or (selectedItemsList.Count = 0)) then begin
      Application.MessageBox(PChar('Не обрані строки заявки'),PChar('Увага !'),MB_ICONWARNING+MB_OK); Exit;
    end;
    if (chbOnlyCheckedStrings.Checked) then
    if Length(condition) = 0 then
      condition := 'RQORDERITEM.CODE IN (' + getStringTListOfIntegers(selectedItemsList, ',') + ')'
    else
      condition := condition + ' AND RQORDERITEM.CODE IN (' + getStringTListOfIntegers(selectedItemsList, ',') + ')';
    {Дописывание условия на то что поле договора не null}
    if condition <> '' then
      condition := condition + ' AND RQORDERITEM.FINDOCID IS NOT NULL '
    else
      condition := ' RQORDERITEM.FINDOCID IS NOT NULL ';

    {Дописывание условия на статус строки не равен непотрібно замовляти}
    if condition <> '' then
      condition := condition + ' AND RQORDERITEM.STATUSREFCODE <> ' + IntToStr(RQORDERITEM_STATUS_CANCELED)
    else
      condition := ' RQORDERITEM.STATUSREFCODE <> ' + IntToStr(RQORDERITEM_STATUS_CANCELED);

    orderItemFilter.contractNumber := finDocNumber;


    orderItemFilter.conditionSQL := condition;

    orderItemList := TempRQOrderItem.getScrollableFilteredList(orderItemFilter, 0, -1);

    finDocIdList := TList.Create;
    finDocNumberList := TStringList.Create;

    for i := 0 to orderItemList.totalCount - 1 do
    begin
      if (finDocIdList.IndexOf(Ptr(orderItemList.list[i].finDocID)) = -1) and (orderItemList.list[i].finDocID <> Low(Integer)) then
      begin
          finDocIdList.Add(Ptr(orderItemList.list[i].finDocID));
          finDocNumberList.Add(orderItemList.list[i].finDocCode);
      end;
      if Length(orderItemCodes) > 0 then
        orderItemCodes := orderItemCodes + ', ' +  IntToStr(orderItemList.list[i].code)
      else
        orderItemCodes := IntToStr(orderItemList.list[i].code);
    end;

    SetLength(argNames, 3);
    SetLength(args, 3);

    argNames[0] := 'PcodeOrder';
    args[0] := IntToStr(RQOrderObj.code);

    argNames[1] := 'orderItemCodes';
    args[1] := ' AND ri.code in (' + orderItemCodes + ')';

    reportName := 'RepOrder/rep_string_by_agree/materialsDistribution';

    for i := 0 to finDocIdList.Count -1 do begin
       argNames[2] := 'findocid';
       args[2] := IntToStr(Integer(finDocIDList[i]));
       makeReport(reportName, argNames, args, 'pdf');
    end;

  finally
    if finDocIdList <> nil then begin finDocIdList.Free; finDocIdList := nil; end;
    if finDocNumberList <> nil then begin finDocNumberList.Free; finDocNumberList := nil;end;
  end;
    

end;

procedure TfrmRQOrderEdit.actEditDDSCodeExecute(Sender: TObject);
var
  selected, state : Boolean;
  i, orderItemCode : Integer;
  RQOrderItemObj : RQOrderItem;
  TempRQOrderItem : RQOrderItemControllerSoapPort;
  frmRQDDSCodesShow : TfrmRQDDSCodesShow;
  ddsFilter : RQDDSCodesFilter;
begin
  selected := false;

  for i := 1 to sgRQOrderItem.RowCount - 1 do
  begin
    sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER, i, selected);
    if selected then break;
  end;

  if not selected then // Если не выбрана ни одна строка
  begin
    Application.MessageBox(PChar('Оберіть позиції заявки!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  state := false;

  TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;

  ddsFilter := RQDDSCodesFilter.Create;
  SetNullIntProps(ddsFilter);
  SetNullXSProps(ddsFilter);
  ddsFilter.isActual := 1;
  ddsFilter.conditionSQL := 'q1.PARENTDDSCODESREFCODE is null';

  frmRQDDSCodesShow:=TfrmRQDDSCodesShow.Create(Application,fmNormal,ddsFilter);
  try

    with frmRQDDSCodesShow do
      if ShowModal = mrOk then
      begin
        if tvDDSCodes.Selected = nil then Exit;
        if tvDDSCodes.Selected.Data = nil then Exit;

        try
          for i := 1 to sgRQOrderItem.RowCount - 1 do
          begin
            sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER, i, state);

            if state then
            begin
              try
                orderItemCode := StrToInt(sgRQOrderItem.Cells[0, i]);
              except
                on EConvertError do Continue;
              end;

              RQOrderItemObj := TempRQOrderItem.getObject(orderItemCode);

              if (RQOrderItemObj <> nil) then
              begin
                 if RQOrderItemObj.ddsCodes = nil then RQOrderItemObj.ddsCodes := RQDDSCodes.Create();
                    RQOrderItemObj.ddsCodes.code := RQDDSCodesShort(tvDDSCodes.Selected.Data).code;
              end;

              TempRQOrderItem.editDDSCode(RQOrderItemObj);
            end;
          end;

        except
           on EConvertError do Exit;
        end;
      end;
  finally
    frmRQDDSCodesShow.Free;
  end;

  actUpdateExecute(Sender);

end;

procedure TfrmRQOrderEdit.actEditDDSCodesExecute(Sender: TObject);
var
  selected, state : Boolean;
  i, orderItemCode : Integer;
  RQOrderItemObj : RQOrderItem;
  TempRQOrderItem : RQOrderItemControllerSoapPort;
  frmRQDDSCodesShow : TfrmRQDDSCodesShow;
  ddsFilter : RQDDSCodesFilter;
begin
  selected := false;

  for i := 1 to sgRQOrderItem.RowCount - 1 do
  begin
    sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER, i, selected);
    if selected then break;
  end;

  if not selected then // Если не выбрана ни одна строка
  begin
    Application.MessageBox(PChar('Оберіть позиції заявки!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  state := false;

  TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;

  ddsFilter := RQDDSCodesFilter.Create;
  SetNullIntProps(ddsFilter);
  SetNullXSProps(ddsFilter);
  ddsFilter.isActual := 1;
  ddsFilter.conditionSQL := 'q1.PARENTDDSCODESREFCODE is null';

  frmRQDDSCodesShow:=TfrmRQDDSCodesShow.Create(Application,fmNormal,ddsFilter);
  try

    with frmRQDDSCodesShow do
      if ShowModal = mrOk then
      begin
        if tvDDSCodes.Selected = nil then Exit;
        if tvDDSCodes.Selected.Data = nil then Exit;

        try
          for i := 1 to sgRQOrderItem.RowCount - 1 do
          begin
            sgRQOrderItem.GetCheckBoxState(MATERIAL_COL_NUMBER, i, state);

            if state then
            begin
              try
                orderItemCode := StrToInt(sgRQOrderItem.Cells[0, i]);
              except
                on EConvertError do Continue;
              end;

              RQOrderItemObj := TempRQOrderItem.getObject(orderItemCode);

              if (RQOrderItemObj <> nil) then
              begin
                 if RQOrderItemObj.ddsCodes = nil then RQOrderItemObj.ddsCodes := RQDDSCodes.Create();
                    RQOrderItemObj.ddsCodes.code := RQDDSCodesShort(tvDDSCodes.Selected.Data).code;
              end;

              TempRQOrderItem.save(RQOrderItemObj);
            end;
          end;

        except
           on EConvertError do Exit;
        end;
      end;
  finally
    frmRQDDSCodesShow.Free;
  end;

  actUpdateExecute(Sender);

end;

procedure TfrmRQOrderEdit.btnUpdatePaymentDateOrderedByOrgNameClick(
  Sender: TObject);
var TempRQOrder: RQOrderControllerSoapPort;
begin
  EXIT; // Не используется!!!
  
  if DialogState = dsInsert then Exit;
  
  TempRQOrder := HTTPRIORQOrder as RQOrderControllerSoapPort;
  TempRQOrder.updatePaymentDateOrderedByOrgName(RQOrderObj.code);

  actUpdateExecute(Sender);
end;

//function TfrmRQOrderEdit.getApprovedCostBySelectedItem: RQApprovedCost;
function TfrmRQOrderEdit.getApprovedCostBySelectedItem(isForVRTU: Boolean = false; index: Integer = -1): RQApprovedCost;
var
  TempRQApprovedCost : RQApprovedCostControllerSoapPort;
  approvedCost : RQApprovedCost;
  approvedCostFilter : RQApprovedCostFilter;

  orderItemCode, gridRow : Integer;
  approvedCostList : RQApprovedCostShortList;
begin
  inherited;

  TempRQApprovedCost := HTTPRIORQApprovedCost as RQApprovedCostControllerSoapPort;
  //TempRQApprovedCost.
  //approvedCost := TempRQApprovedCost.getObject();

  if index = -1 then
    gridRow := sgRQOrderItem.Row
  else
    gridRow := index;

  //orderItemCode := StrToInt(sgRQOrderItem.Cells[0, sgRQOrderItem.Row]);
  orderItemCode := StrToInt(sgRQOrderItem.Cells[0, gridRow]);

  approvedCostFilter := RQApprovedCostFilter.Create;
  SetNullXSProps(approvedCostFilter);
  SetNullIntProps(approvedCostFilter);
  approvedCostFilter.rqOrderItemRef := RQOrderItemRef.Create;
  approvedCostFilter.rqOrderItemRef.code := orderItemCode;

  approvedCostList := TempRQApprovedCost.getScrollableFilteredList(approvedCostFilter, 0, -1);

  if approvedCostList.totalCount = 0 then
  begin
    // Если утверждается сметная цена материала для ВРТУ
    if isForVRTU then
      Result := nil
    else
      Application.MessageBox(PChar('Помилка у кількості! Перезаведіть заявку!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Exit;
  end;

  approvedCost := TempRQApprovedCost.getObject(approvedCostList.list[0].code);

  Result := approvedCost;
end;

end.
