unit EditENServicesShift;

interface

uses
    Windows, Generics.Collections, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
    EnergyproController, EnergyproController2, ENServicesObjectController, ENPlanWorkController,
    ExtCtrls, TB2Item, TB2Dock, TB2Toolbar , ShowENServicesShift, Planner, ENPlanWorkStatusController,
    AdvObj, ShowRQOrg, ShowRQOrgRschet, ENCottageController, ENRentPeriod2ServicesController,
    PlannerMonthView, DBPlannerMonthView, PlannerCal, FKProvObjectController, ENElement2ENElementController
    , ENServicesCostController, ENActController, ENActIncomeServicesController
    , EditENActIncomeServices, RQFKOrderController;

type
    TfrmENServicesShiftEdit = class(TDialogForm)
    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIOENServicesObject: THTTPRIO;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actUpdate: TAction;
    actFilterPlan: TAction;
    actNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    pcCalculation: TPageControl;
    tsGeneral: TTabSheet;
    lblContractNumber: TLabel;
    lblContractDateServices: TLabel;
    lblFinDocID: TLabel;
    lblCommentGen: TLabel;
    spbENDepartmentDepartment: TSpeedButton;
    lblENDepartmentDepartmentName: TLabel;
    spbENElementElement: TSpeedButton;
    lblENElementElementName: TLabel;
    spbContractNumberSelect: TSpeedButton;
    lblContractNumberServices: TLabel;
    lblDateEdit: TLabel;
    edtContractNumber: TEdit;
    edtContractDateServices: TDateTimePicker;
    edtFinDocID: TEdit;
    edtCommentGen: TMemo;
    edtENDepartmentDepartmentName: TEdit;
    edtENElementElementName: TEdit;
    edtContractNumberServices: TEdit;
    grpContragentInfo: TGroupBox;
    lblContragentName: TLabel;
    lblContragentAddress: TLabel;
    lblContragentOkpo: TLabel;
    lblContragentPassport: TLabel;
    lblContragentBossName: TLabel;
    edtContragentName: TEdit;
    edtContragentAddress: TMemo;
    edtContragentOkpo: TEdit;
    edtContragentPassport: TMemo;
    edtContragentBossName: TEdit;
    edtContractDateFin: TDateTimePicker;
    edtName: TEdit;
    edtPartnerCode: TEdit;
    edtFinDocCode: TEdit;
    edtDateEdit: TDateTimePicker;
    HTTPRIOENPlanWork: THTTPRIO;
    tsPlans: TTabSheet;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    sgENPlanWork: TAdvStringGrid;
    gbWarrant: TGroupBox;
    rgContragentType: TRadioGroup;
    lblWarrantFIO: TLabel;
    edtWarrantFIO: TEdit;
    lblWarrantNumber: TLabel;
    edtWarrantNumber: TEdit;
    spbWarrantNumber: TSpeedButton;
    tsActs: TTabSheet;
    actViewENAct: TAction;
    actUpdateENAct: TAction;
    HTTPRIOENAct: THTTPRIO;
    lblCode: TLabel;
    edtCode: TEdit;
    HTTPRIOENEstimateItem: THTTPRIO;
    edtExecuteWorkDate: TDateTimePicker;
    lblExecuteWorkDate: TLabel;
    lblTimeStart: TLabel;
    edtTimeStart: TDateTimePicker;
    edtTimeFinal: TDateTimePicker;
    edtContragentPhoneNumber: TEdit;
    lbl1: TLabel;
    lblTimeStart2: TLabel;
    lblTimeFinal3: TLabel;
    HTTPRIOENDeliveryTimePlan: THTTPRIO;
    Label6: TLabel;
    rgPayable: TRadioGroup;
    chbIsCustomerMaterials: TCheckBox;
    HTTPRIOENElement: THTTPRIO;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Label9: TLabel;
    sgENSelectedPlanItems: TAdvStringGrid;
    ToolButton16: TToolButton;
    HTTPRIOENContragent: THTTPRIO;
    alPlans: TActionList;
    actViewPlan: TAction;
    actDeletePlan: TAction;
    actEditPlan: TAction;
    actClosePlan: TAction;
    actUnClosePlan: TAction;
    actFinishPlan: TAction;
    actUndoFinishPlan: TAction;
    pmPlans: TPopupMenu;
    miViewPlan: TMenuItem;
    miEditPlan: TMenuItem;
    miDeletePlan: TMenuItem;
    miN1: TMenuItem;
    miClosePlan: TMenuItem;
    miN2: TMenuItem;
    miUnClosePlan: TMenuItem;
    miN3: TMenuItem;
    miFinishPlan: TMenuItem;
    miUndoFinishPlan: TMenuItem;
    tsPayment: TTabSheet;
    ActionListPayment: TActionList;
    ActViewPayment: TAction;
    actInsertPayment: TAction;
    actDeletePayment: TAction;
    actEditPayment: TAction;
    actUpdatePayment: TAction;
    actFilterPayment: TAction;
    actNoFilterPayment: TAction;
    PopupMenuPayment: TPopupMenu;
    MenuItem3: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    HTTPRIOENPayment2SO: THTTPRIO;
    ToolButton17: TToolButton;
    N11: TMenuItem;
    miPreConfirm: TMenuItem;
    miConfirm: TMenuItem;
    miUndoConfirm: TMenuItem;
    actPreConfirm: TAction;
    actConfirm: TAction;
    actUndoConfirm: TAction;
    gbPayments: TGroupBox;
    ToolBarPayment: TToolBar;
    btnViewPayment: TToolButton;
    btnInsertPayment: TToolButton;
    btnDeletePayment: TToolButton;
    btnEditPayment: TToolButton;
    btnUpdatePayment: TToolButton;
    gbBills: TGroupBox;
    tlbENSOBill: TToolBar;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    actAddBill: TAction;
    actEditBill: TAction;
    actDeleteBill: TAction;
    HTTPRIOENSOBill: THTTPRIO;
    actUpdateBill: TAction;
    GroupBox1: TGroupBox;
    ToolBar4: TToolBar;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton23: TToolButton;
    sgENSOPayBillProv: TAdvStringGrid;
    HTTPRIOENSOPayBillProv: THTTPRIO;
    actCreateNewPostings: TAction;
    actEditPostings: TAction;
    lblContragentPosition: TLabel;
    edtContragentPosition: TEdit;
    cbbBasisType: TComboBox;
    lblBasisType: TLabel;
    grpBankRekvizit: TGroupBox;
    lblContragentBankAccount: TLabel;
    lblContragentBankName: TLabel;
    lblContragentBankMfo: TLabel;
    edtContragentBankAccount: TEdit;
    edtContragentBankName: TEdit;
    edtContragentBankMfo: TEdit;
    pmBill: TPopupMenu;
    miPrintBill: TMenuItem;
    miPrintAct: TMenuItem;
    actEditAct: TAction;
    actViewAct: TAction;
    gbWarrantContrAgent: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtWarrantContrAgentNumber: TEdit;
    edtWarrantContrAgentFIO: TEdit;
    edtWarrantContrAgentDate: TDateTimePicker;
    HTTPRIOENElement2ENElement: THTTPRIO;
    actAddPlan: TAction;
    edtContragentAddressWork: TMemo;
    edtContragentObjectWork: TEdit;
    lblContragentObjectWork: TLabel;
    lblContragentAddressWork: TLabel;
    pmAccSheet: TPopupMenu;
    N12: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem15: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N17: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N24: TMenuItem;
    sgENActIncome: TAdvStringGrid;
    Splitter2: TSplitter;
    Panel2: TPanel;
    TBToolbar1: TTBToolbar;
    tbiViewActs: TTBItem;
    tbiAddActs: TTBItem;
    tbiEditActs: TTBItem;
    tbiRemoveActs: TTBItem;
    tbiUpdateActs: TTBItem;
    gprServicesObjectAdditionalInfo: TGroupBox;
    lblProjectCode: TLabel;
    lblContractServicesSumma: TLabel;
    lblContractServicesSummaVAT: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    lblPriConnectionNumber: TLabel;
    lblContractKind: TLabel;
    lblExecutorPhoneNumber: TLabel;
    edtProjectCode: TEdit;
    edtContractServicesSumma: TEdit;
    edtContractServicesSummaVAT: TEdit;
    edtContractServicesDay: TEdit;
    edtPayDetail: TEdit;
    edtCommentServicesGen: TMemo;
    cbContractKind: TComboBox;
    edtExecutorPhoneNumber: TEdit;
    tsENServicesCost: TTabSheet;
    chbCalcSumsByCalculation: TCheckBox;
    gbENServicesCost: TGroupBox;
    tbENServicesCost: TToolBar;
    tbViewENServicesCost: TToolButton;
    tbAddENServicesCost: TToolButton;
    tbEditENServicesCost: TToolButton;
    tbDeleteENServicesCost: TToolButton;
    tbUpdateENServicesCost: TToolButton;
    sgENServicesCost: TAdvStringGrid;
    actViewENServicesCost: TAction;
    actEditENServicesCost: TAction;
    actAddENServicesCost: TAction;
    gbPrintReports: TGroupBox;
    btnPrintContract4Rent: TButton;
    btnAccLists: TButton;
    actDeleteENServicesCost: TAction;
    actUpdateENServicesCost: TAction;
    HTTPRIOENServicesCost: THTTPRIO;
    sgENActIncomeServices: TAdvStringGrid;
    Panel1: TPanel;
    TBToolbar3: TTBToolbar;
    TBItem13: TTBItem;
    TBItem14: TTBItem;
    TBItem16: TTBItem;
    TBItem17: TTBItem;
    actViewIncome: TAction;
    actInsertIncome: TAction;
    actDeleteIncome: TAction;
    actUpdateIncome: TAction;
    HTTPRIOENActIncomeServices: THTTPRIO;
    actEditIncome: TAction;
    actLinkWithPlan: TAction;
    actCreatePlanFromENServicesCost: TAction;
    tbCreatePlanFromENServicesCost: TToolButton;
    tbUndoCreatePlanFromENServicesCost: TToolButton;
    actUndoCreatePlanFromENServicesCost: TAction;
    pcActs: TPageControl;
    tsENAct: TTabSheet;
    tsRQFKOrder: TTabSheet;
    sgENAct: TAdvStringGrid;
    sgRQFKOrder: TAdvStringGrid;
    HTTPRIORQFKOrder: THTTPRIO;
    actAddAct: TAction;
    actRemoveAct: TAction;
    btnPrint: TToolButton;
    popupMenuPrintCost: TPopupMenu;
    mniPrintCalculationNKRE: TMenuItem;
    mniPrintRemainingCost: TMenuItem;
    HTTPRIOTKCalcCost: THTTPRIO;
    HTTPRIOTKTransport: THTTPRIO;
    HTTPRIOTKClassificationType: THTTPRIO;
    tsCalcAdditionalItems: TTabSheet;
    alCalcAdditionalItems: TActionList;
    actViewCAI: TAction;
    actInsertCAI: TAction;
    actDeleteCAI: TAction;
    actEditCAI: TAction;
    actUpdateCAI: TAction;
    ToolBar8: TToolBar;
    ToolButton31: TToolButton;
    ToolButton32: TToolButton;
    ToolButton33: TToolButton;
    ToolButton34: TToolButton;
    ToolButton35: TToolButton;
    sgENServices2CalcAdditionalItems: TAdvStringGrid;
    HTTPRIOENServices2CalcAdditionalItems: THTTPRIO;
    mniPrintCalculation: TMenuItem;
    actPrintCalculation: TAction;
    actPrintCalculationNKRE: TAction;
    actPrintRemainingCost: TAction;
    actActTransferPrint: TAction;
    actActTransferUnMoveToFK: TAction;
    actActTransferMoveToFK: TAction;
    actActTransferSave: TAction;
    HTTPRIOFINMaterials: THTTPRIO;
    mniPrintAdditionalItems: TMenuItem;
    actPrintAdditionalItems: TAction;
    btnOtherActions: TToolButton;
    pmMenuOtherActions: TPopupMenu;
    mniCheckAllCalculations: TMenuItem;
    mniUndoAllCheck: TMenuItem;
    actCheckAllCalculations: TAction;
    actUndoAllChecksCalculations: TAction;
    tsENActSubContract: TTabSheet;
    sgENActSubContract: TAdvStringGrid;
    tsAdditionalAgreements: TTabSheet;
    tlbAdditionalAgreements: TToolBar;
    tbAdditionalAgreementView: TToolButton;
    tbAdditionalAgreementAdd: TToolButton;
    tbAdditionalAgreementRemove: TToolButton;
    tbAdditionalAgreementEdit: TToolButton;
    tbAdditionalAgreementsUpdate: TToolButton;
    sgENAdditionalAgreement: TAdvStringGrid;
    actUpdateAdditionalAgreements: TAction;
    actAdditionalAgreementInsert: TAction;
    actAdditionalAgreementEdit: TAction;
    actAdditionalAgreementDelete: TAction;
    pmAdditionalAgreements: TPopupMenu;
    mniAdditionalAgreementSign: TMenuItem;
    actAdditionalAgreementSign: TAction;
    actAdditionalAgreementUnsign: TAction;
    mniAdditionalAgreementUnsign: TMenuItem;
    HTTPRIOENAdditionalAgreement: THTTPRIO;
    actAdditionalAgreementView: TAction;
    ToolButton1: TToolButton;
    actFilterAct: TAction;
    TBItem1: TTBItem;
    HTTPRIOENElement2Act: THTTPRIO;
    btnPrintRegistry: TButton;
    tsActContragentMaterialsTransfer: TTabSheet;
    ToolBar1: TToolBar;
    tbActCustomerMaterialsTransferView: TToolButton;
    tbactActCustomerMaterialsTransferInsert: TToolButton;
    tbactActCustomerMaterialsTransferEdit: TToolButton;
    sgActCustomerMaterialsTransfer: TAdvStringGrid;
    actionsActCustomerMaterialsTransfer: TActionList;
    actActCustomerMaterialsTransferView: TAction;
    actActCustomerMaterialsTransferInsert: TAction;
    actActCustomerMaterialsTransferEdit: TAction;
    actActCustomerMaterialsTransferDelete: TAction;
    tbactActCustomerMaterialsTransferDelete: TToolButton;
    actActCustomerMaterialsTransferMove: TAction;
    actActCustomerMaterialsTransferUnMove: TAction;
    tbactActCustomerMaterialsTransferMove: TToolButton;
    tbactActCustomerMaterialsTransferUnMove: TToolButton;
    actActCustomerMaterialsTransferCreate: TAction;
    actActCustomerMaterialsTransferUndoCreate: TAction;
    pmActCustomerMaterialsTransfer: TPopupMenu;
    piActCustomerMaterialsView: TMenuItem;
    mniActCustomerMaterialsInsert: TMenuItem;
    mniActCustomerMaterialsEdit: TMenuItem;
    mniActCustomerMaterialsDelete: TMenuItem;
    mniActCustomerMaterialsMove: TMenuItem;
    mniActCustomerMaterialsUnMove: TMenuItem;
    mniActCustomerMaterialsCreate: TMenuItem;
    mniActCustomerMaterialsUndoCreate: TMenuItem;
    mniActCustomerMaterialsPrint: TMenuItem;
    actActCustomerMaterialsTransferPrint: TAction;
    ToolButton3: TToolButton;
    actActCustomerMaterialsTransferUpdate: TAction;
    tbActTransferCustomerMaterialsUpdate: TToolButton;
    mniActCustomerMaterialsTransferUpdate: TMenuItem;
    actPrintBill: TAction;
    actPrintIncome: TAction;
    btnPrintBill: TToolButton;
    tbENActIncomeServicesPrint: TTBItem;
    actPrintIncome2: TAction;
    sgENSOBill: TAdvStringGrid;
    sgENPayment2SO: TAdvStringGrid;
    pmActs: TPopupMenu;
    miViewAct: TMenuItem;
    miAddAct: TMenuItem;
    miEditAct: TMenuItem;
    miRemoveAct: TMenuItem;
    miUpdateENAct: TMenuItem;
    miFilterAct: TMenuItem;
    actRemoveActFromActServices: TAction;
    N5: TMenuItem;
    miRemoveActFromActServices: TMenuItem;
    tbENActEditIncome: TTBItem;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnENElementElementClick(Sender : TObject);
    procedure btnContractNumberSelectClick(Sender: TObject);
    procedure spbContractNumberSelectClick(Sender: TObject);
    procedure spbENDepartmentDepartmentClick(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure pcCalculationChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbWarrantNumberClick(Sender: TObject);
    procedure actViewENActIncomeExecute(Sender: TObject);
    procedure btnPostingsClick(Sender: TObject);
    function getSumTimeWorkForCalculation(codePlan : Integer):Double;
    procedure sgENPlanWorkClick(Sender: TObject);
    procedure sgENPlanWorkRightClickCell(Sender: TObject; ARow,
      ACol: Integer);
    procedure actEditPlanExecute(Sender: TObject);
    procedure actViewPlanExecute(Sender: TObject);
    procedure actDeletePlanExecute(Sender: TObject);
    procedure actClosePlanExecute(Sender: TObject);
    procedure actUnClosePlanExecute(Sender: TObject);
    procedure actFinishPlanExecute(Sender: TObject);
    procedure actUndoFinishPlanExecute(Sender: TObject);
    procedure btnPrintFactCalcClick(Sender: TObject);
    procedure actInsertPaymentExecute(Sender: TObject);
    procedure actDeletePaymentExecute(Sender: TObject);
    procedure actEditPaymentExecute(Sender: TObject);
    procedure ActViewPaymentExecute(Sender: TObject);
    procedure actPreConfirmExecute(Sender: TObject);
    procedure actConfirmExecute(Sender: TObject);
    procedure actUndoConfirmExecute(Sender: TObject);
    procedure pmPlansPopup(Sender: TObject);
    procedure btnPrintTechAgreementClick(Sender: TObject);
    procedure spbActWarrantNumberClick(Sender: TObject);
    procedure btnPrintActTechAgreementClick(Sender: TObject);
    procedure btnPrintActClick(Sender: TObject);
    procedure actAddBillExecute(Sender: TObject);
    procedure actDeleteBillExecute(Sender: TObject);
    procedure actEditBillExecute(Sender: TObject);
    procedure actUpdateBillExecute(Sender: TObject);
    procedure sgENSOBillClick(Sender: TObject);
    procedure actCreateNewPostingsExecute(Sender: TObject);
    procedure actEditPostingsExecute(Sender: TObject);
    procedure btnPrintContract4RecoveryClick(Sender: TObject);
    procedure actEditActExecute(Sender: TObject);
    procedure actViewActExecute(Sender: TObject);
    procedure btnPrintContract4AgreeClick(Sender: TObject);
    procedure btnPrintContract4AccessClick(Sender: TObject);
    procedure cbbBasisTypeChange(Sender: TObject);
    procedure actAddPlanExecute(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure showAccompanyingSheetJRXML(
     reportPath, strSigner, strSignerPost: String);
    procedure MenuItem15Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure btnAccListsClick(Sender: TObject);
    procedure btnPrintContract4RentClick(Sender: TObject);
    procedure actViewENServicesCostExecute(Sender: TObject);
    procedure actEditENServicesCostExecute(Sender: TObject);
    procedure actAddENServicesCostExecute(Sender: TObject);
    procedure actDeleteENServicesCostExecute(Sender: TObject);
    procedure actUpdateENServicesCostExecute(Sender: TObject);
    procedure updateENServicesCost(reset : Boolean = true);
    procedure openENServicesCostEditForm(DialogState : TDialogState);
    procedure actViewIncomeExecute(Sender: TObject);
    procedure actInsertIncomeExecute(Sender: TObject);
    procedure actDeleteIncomeExecute(Sender: TObject);
    procedure actUpdateIncomeExecute(Sender: TObject);
    procedure updateActIncome(reset : Boolean = true);
    procedure actEditIncomeExecute(Sender: TObject);
    procedure chbCalcSumsByCalculationClick(Sender: TObject);
	procedure updateSumsIfNeeded;
  procedure updateRQFKOrder(reset : Boolean = true);
	procedure readENServicesObjectSumAttributes;
    procedure actLinkWithPlanExecute(Sender: TObject);
    procedure actCreatePlanFromENServicesCostExecute(Sender: TObject);
    procedure actUndoCreatePlanFromENServicesCostExecute(Sender: TObject);
	procedure generatePlans(isGenerate : Boolean);
    procedure edtContractServicesSummaChange(Sender: TObject);
    procedure pcActsChange(Sender: TObject);
    procedure actAddActExecute(Sender: TObject);
    procedure actRemoveActExecute(Sender: TObject);
	function  getSelectedENServicesCost : ENServicesCost;
    procedure actViewCAIExecute(Sender: TObject);
    procedure actInsertCAIExecute(Sender: TObject);
    procedure actDeleteCAIExecute(Sender: TObject);
    procedure actEditCAIExecute(Sender: TObject);
    procedure actUpdateCAIExecute(Sender: TObject);
    procedure actPrintCalculationExecute(Sender: TObject);
    procedure actPrintCalculationNKREExecute(Sender: TObject);
    procedure actPrintRemainingCostExecute(Sender: TObject);
    procedure chbIsCustomerMaterialsClick(Sender: TObject);
    procedure actPrintAdditionalItemsExecute(Sender: TObject);
    procedure popupMenuPrintCostPopup(Sender: TObject);
    procedure actCheckAllCalculationsExecute(Sender: TObject);
    procedure actUndoAllChecksCalculationsExecute(Sender: TObject);
    procedure sgENServices2CalcAdditionalItemsDblClick(Sender: TObject);
    procedure sgENServicesCostDblClick(Sender: TObject);
    procedure actUpdateAdditionalAgreementsExecute(Sender: TObject);
    procedure sgENAdditionalAgreementGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure actAdditionalAgreementSignExecute(Sender: TObject);
    procedure actAdditionalAgreementUnsignExecute(Sender: TObject);
    procedure pmAdditionalAgreementsPopup(Sender: TObject);
    procedure actAdditionalAgreementInsertExecute(Sender: TObject);
    procedure actAdditionalAgreementDeleteExecute(Sender: TObject);
    procedure actAdditionalAgreementEditExecute(Sender: TObject);
    procedure actAdditionalAgreementViewExecute(Sender: TObject);
    procedure tbAdditionalAgreementViewClick(Sender: TObject);
    procedure actUpdateENActExecute(Sender: TObject);
    procedure actFilterPlanExecute(Sender: TObject);
    procedure actFilterActExecute(Sender: TObject);
    procedure sgENPlanWorkTopLeftChanged(Sender: TObject);
    procedure sgENActClick(Sender: TObject);
    procedure sgENActSubContractClick(Sender: TObject);
    procedure sgENActIncomeDblClick(Sender: TObject);
    procedure sgENActIncomeServicesDblClick(Sender: TObject);
    procedure btnPrintRegistryClick(Sender: TObject);
    procedure actActCustomerMaterialsTransferViewExecute(Sender: TObject);
    procedure actActCustomerMaterialsTransferInsertExecute(Sender: TObject);
    procedure actActCustomerMaterialsTransferEditExecute(Sender: TObject);
    procedure actActCustomerMaterialsTransferDeleteExecute(Sender: TObject);
    procedure actActCustomerMaterialsTransferMoveExecute(Sender: TObject);
    procedure actActCustomerMaterialsTransferUnMoveExecute(Sender: TObject);
    procedure actActCustomerMaterialsTransferCreateExecute(Sender: TObject);
    procedure actActCustomerMaterialsTransferUndoCreateExecute(Sender: TObject);
    procedure actActCustomerMaterialsTransferPrintExecute(Sender: TObject);
    procedure pmActCustomerMaterialsTransferPopup(Sender: TObject);
    procedure actActCustomerMaterialsTransferUpdateExecute(Sender: TObject);
    procedure sgActCustomerMaterialsTransferDblClick(Sender: TObject);
    procedure sgActCustomerMaterialsTransferClick(Sender: TObject);
    procedure sgENServicesCostTopLeftChanged(Sender: TObject);
    procedure updateCAI(reset : Boolean = true);
    procedure updateAdditionalAgreements(reset : Boolean = true);
    procedure updateActCustomerMaterialsTransfer(reset : Boolean = true);
    procedure sgENServices2CalcAdditionalItemsTopLeftChanged(Sender: TObject);
    procedure sgENAdditionalAgreementTopLeftChanged(Sender: TObject);
    procedure sgActCustomerMaterialsTransferTopLeftChanged(Sender: TObject);
    procedure sgENSOBillTopLeftChanged(Sender: TObject);
    procedure sgENActSubContractTopLeftChanged(Sender: TObject);
    procedure sgENActTopLeftChanged(Sender: TObject);
    procedure sgRQFKOrderTopLeftChanged(Sender: TObject);
    procedure actPrintBillExecute(Sender: TObject);
    procedure actPrintIncomeExecute(Sender: TObject);
    procedure actPrintIncome2Execute(Sender: TObject);
    procedure sgENActIncomeServicesTopLeftChanged(Sender: TObject);
    procedure actRemoveActFromActServicesExecute(Sender: TObject);

  private
    { Private declarations }
    isVisitClient : Boolean;
    isJobsByTime  : Boolean;
    checkWarrant: Boolean;
    actDate: String;

    planFilter: ENPlanWorkFilter;
    actFilter: ENActFilter;

    procedure SetFormCaption(elementCode: Integer);
    procedure updateBills(reset : Boolean = true);
    procedure updatePayments(Sender: TObject);
    procedure updateProvs(Sender: TObject);

    procedure updateAct(Sender : TObject);
    procedure updateENAct(Sender : TObject; isSubContract : Boolean; grid : TAdvStringGrid; reset : Boolean = true);

    procedure updatePlans(reset : Boolean = true);

    procedure plansPopup(plan: ENPlanWork);
    procedure openSelectedAdditionalAgreement(DialogState : TDialogState);
    procedure signOrUnsignAdditionalAgreement(isSign : Boolean);
    procedure toggleActDeleteAction;
    function checkActIsManuallyAdded(actCode : Integer) : Boolean;

    procedure setActListToGrid(grid : TAdvStringGrid; list : ENActShortList; manuallyAdded : TList<Integer>; startingPoint : Integer);
    function getSelectedActCustomerMaterialsTransfer : RQFKOrder;
    procedure prepareActionsCustomerMaterialsTransfer(fkOrder : RQFKOrder = nil);
    procedure actActCustomerMaterialsTransferStatusChange(status : Integer);
    procedure fillPlanCodesForServices;

  public
    { Public declarations }
    planCode : Integer;
    DepartmentForServicesCode : Integer;
    tempDeliveryOneWay : Integer;

    //PRIC-155
    contNumServ: String;
    shiftLines : Boolean;
    isNotCalculated : Boolean;


  end;


var
  frmENServicesShiftEdit: TfrmENServicesShiftEdit;
  ENServicesShiftObj: ENServicesObject;

  selectedRow : Integer;
  ENPlanWorkItemHeaders: array [1..11] of String =
        ( 'Код'
          ,'Код операції'
          ,'Операція'
          ,'Джерело нормативу'
          ,'Кількість'
          ,'Норма часу на од.'
          ,'Всього часу'
          ,'Час з коеф.'
          ,'Вимірювач'
          ,'Од. виміру'
          ,'Користувач, що вніс зміни'
          //,'Дата останньої зміни'
        );

  TKClassificationTypeHeaders: array [1..4] of String =
        ( 'Код'
          ,'Код роботи'
          ,'Назва'
          ,'Кількість'
        );

  ENPlanWorkHeaders: array [1..18] of String =
        ( 'Код'
          ,'Об''єкт планування'
          ,'Інв. №'
          ,'РЕЗ та ЕМ'
          ,'Рік плану'
          ,'Місяць плану'
          ,'Дата початку робіт'
          //,'Початк. місяць та рік плану (до перенесення)'
          //,'Початк. місяць плану'
          ,'ПідВид робіт'
          ,'Тип акту'
          ,'Вид плану'
          ,'Статус'
          ,'Підрозділ'
          ,'БюджетоТримач'
          ,'Центр відповідальності'
          ,'Початк. місяць та рік плану (до перенесення)'
          //,'Дата складання плану'
          ,'Номер наряда'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
        );

  actColCount, actLastCount: Integer;
    actLastRow: Integer = 1;

  ENActHeaders: array [1..7] of String =
        ( 'Код'
          ,'Номер акту'
          ,'Дата акту'
          ,'ФИО мола с фин.кол.'
          ,'Тип'
          ,'Статус'
          , 'Додано вручну'
          //,'пользователь внесший изменение'
          //,'дата последнего изменения'
        );

  ENActIncomeHeaders: array [1..3] of String =
        ( 'Код'
          ,'Номер акту'
          ,'Дата акту'
        );

  ENEstimateItemHeaders: array [1..11] of String =
        ( 'Код'
          ,'Матеріал'
          ,'Кількість нормативна'
          ,'Кількість скорегована'           // !!! используеться при разноске с ФинКол !!!
          ,'Од. виміру'
          ,'Код роботи'
          ,'Робота'
          ,'Тип строки кошторису'
          ,'Статус'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
        );

   sgDepartmentHeaders : array [1..3] of String = ( 'Код підрозділу'
    , 'Підрозділ'
    , 'РЕМ'
    );

    TKVirtualBrigadeHeaders : array [1..2] of String = ( 'Код бригади'
    , 'Бригада'
    );

  CustomerFINMaterialsShortHeaders: array [1..15] of String =
        ( 'Код'
          ,'Матеріал'
          ,'Од. виміру'
          ,'Номенклатурний номер'
          ,'Кількість'
          ,'Ціна'
          ,'Вартість'
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


  iColCount, iLastCount, ColCount, LastCount, LastRow : Integer;
  iLastRow: Integer = 1;

  plansColCount, plansLastCount: Integer;
  plansLastRow: Integer = 1;

  ENPayment2SOHeaders: array [1..8] of String =
        ( 'Код'
          ,'Дата оплати'
          ,'Всього з ПДВ, грн.'
          ,'Сума без ПДВ, грн.'
          ,'ПДВ, грн.'
          ,'Тип оплати'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );

  ENCottageHeaders: array [1..7] of String =
        ( 'Код'
          ,'№ Котеджу'
          ,'Кількість спальних місць'
          ,'Опис котеджу'
          ,'Коментар'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );

  ENRentPeriod2ServicesHeaders: array [1..3] of String =
        ( 'Код'
          ,'Початок проживання'
          ,'Кінець проживання'
        );

  ENFamilySize2ServicesObjectHeaders: array [1..3] of String =
        ( 'Код'
          ,'П.І.Б члена сім`ї'
          ,'Сімейне відношення'
        );

  ENSOBillHeaders: array [1..7] of String =
        ( 'Код'
          ,'Дата рахунку'
          ,'Всього з ПДВ, грн.'
          ,'Сума без ПДВ, грн.'
          ,'ПДВ, грн.'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );

    pbpColCount, pbpLastCount: Integer;
    pbpLastRow: Integer = 1;

    ENSOPayBillProvHeaders: array [1..4] of String =
        ( 'Код'
          ,'Сумма у рахунку, грн з ПДВ'
          ,'Сумма оплат по рахунку, грн з ПДВ'
          ,'Дата зміни'
        );

    scheduleColCount, scheduleLastCount: Integer;
    scheduleLastRow: Integer = 1;

  ENServicesObject2PaymentScheduleHeaders: array [1..4] of String =
        ( 'Код'
          ,'оплата з'
          ,'оплата по'
          ,'сума оплати'
        );

  soItemColCount, soItemLastCount: Integer;
  soItemLastRow: Integer = 1;
  ENSORentItemsHeaders: array [1..5] of String =
        ( 'Код'
          ,'Назва населеного пункту'
          ,'Адреса'
          ,'Код вулиці з Біллінгу'
          ,'Код РЕСу з Біллінгу'
        );

  soP04ColCount, soP04LastCount: Integer;
  soP04LastRow: Integer = 1;

  soP10ColCount, soP10LastCount: Integer;
  soP10LastRow: Integer = 1;

  ENSORItems2Post10Headers: array [1..3] of String =
        ( 'Код', 'Номер опори', 'Найменування лінії 10'
        );
  ENSORItems2Post04Headers: array [1..3] of String =
        ( 'Код', 'Номер опори', 'Найменування лінії 04'
        );

  ENServicesCostHeaders: array [1..10] of String =
  ( 'Код'
  , 'Дата'
  , 'Номер'
  , 'Кількість'
  , 'Найменування'
  , 'Сума без ПДВ, грн.'
  , 'Сума ПДВ, грн.'
  , 'Сума з ПДВ, грн.'
  , 'Є план'
  , 'КВЕД'
  );

  ENServices2CalcAdditionalItemsHeaders: array [1..5] of String =
        ( 'Код'
          , 'Найменування пункту розрахунку'
          ,'Сумма'
          ,'кол-во'
          ,'Примечание'
        );

  ENAdditionalAgreementHeaders : array [1..7] of String =
        ( 'Код'
          ,'Номер'
          ,'Дата'
          ,'Сума без ПДВ, грн.'
          ,'Сума ПДВ, грн.'
          , 'Автоматичний розрахунок згідно доданих калькуляцій'
          ,'Статус'
        );



implementation

uses
  ShowENDepartment, ENDepartmentController, ShowENElement, ENElementController,
  DMReportsUnit, ShowFINServicesObject, ENConsts, Main,
  ENServicesContragentTypeController, ENServicesContractTypeController,
  EditENPlanWorkItem, ENPlanWorkItemController, ENEstimateItemController,
  {ENPlanWorkController, }EditENPlanWork2ClassificationType,
  ENPlanWork2ClassificationTypeController, ENServicesContractStatusController,
  ShowENWarrant, ENWarrantController,
  EditENPlanWork, ENPlanWorkKindController, EditENAct,
  EditPostings, TKClassificationTypeController, ENEstimateItemKindController,
  EditENEstimateItem , TKClassification2ENDepartmentController,
  TKVirtualBrigadeController , ENTimeLineController,
  DateUtils , ENDeliveryTimePlanController,
  FINMaterialsController,
  FINMaterialsStatusController,
  ShowFINWorker, FINWorkerController,
  Globals, ShowEPVoltageNominal,
  ENContragentController, ENPlanWorkFormController, EditENContragent,
  ENActIncomeTechConditionsController, EditENActIncomeTechConditions,
  ENConnectionKindController,
  RQFKOrderKindController, ENPayment2SOController, EditENPayment2SO,
  EditRecalcDistanceServicesConnection,ShowENPlanWork, ENPlanWorkStateController,
  ShowENCottage, EditENFamilySize2ServicesObject, ENFamilySize2ServicesObjectController,
  ENSOBillController, EditENSOBill, ENSOPayBillProvController,
  EditENSOPayBillProv, EditPostings4Bill, EditENServicesObject2PaymentSchedule,
  ENServicesObject2PaymentScheduleController, ENServicesContractKindController,
  EditENSORentItems, ENSORentItemsController, ENSORItems2Post04Controller,
  ENSORItems2Post10Controller, EditENSORItems2Post10, ShowENSORItems2Post10,
  EditENSORItems2Post04, ShowENPost10OKSN, ENPost10OKSNController,
  ShowENPost04OKSN, ENPost04OKSNController, ShowENServicesObject
  , ENElement2ENElementTypeController, printAgreeRentTU, AccompanyingSheet,
  EditENServicesCost, BaseUtilsUnit
  , EditENPlanWorkAttributes, ENPlanWorkTypeController, ShowRQFKOrder,
  EditRQFKOrder, TKTransportController, TKCalcCostController
  , ENServices2CalcAdditionalItemsController
  , EditENServices2CalcAdditionalItems
  , ENAdditionalAgreementController
  , EditENAdditionalAgreement, EditENPlanWorkFilter, EditENActFilter
  , ENElement2ActController, ENElement2ActTypeController, ShowENAct, TKAccountingTypeController, EditChooseTXSDate,
  ENDateRangeWithDepartmentFormUnit, FinancialUtilsUnit;

{uses
    EnergyproController, EnergyproController2, ENServicesObjectController  ;
}
{$R *.dfm}
//  var
//  planItemFilter: ENPlanWorkItemFilter;

const PAGE_SIZE : Integer = 100;

var servicesContractKindCodes : TList<Integer>;

procedure TfrmENServicesShiftEdit.setActListToGrid(grid : TAdvStringGrid; list : ENActShortList; manuallyAdded : TList<Integer>; startingPoint : Integer);
var
i, LastCount : Integer;
act : ENActShort;
begin

    LastCount := High(list.list);
    i := startingPoint;

    if LastCount < 0 then Exit;

    with grid do
      for act in list.list do begin
        Application.ProcessMessages;
        if act.code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(act.code)
        else
          Cells[0,i+1] := '';
        Cells[1,i+1] := act.numberGen;
        if act.dateAct = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(act.dateAct);

        Cells[3,i+1] := act.finMolName;
        Cells[4,i+1] := act.actTypeRefName;
        Cells[5,i+1] := act.statusRefName;

        if manuallyAdded.Contains(act.code) then begin
          Cells[6,i+1] := 'Так';
        end;
        i := i + 1;
      end;

end;

function TfrmENServicesShiftEdit.checkActIsManuallyAdded(actCode : Integer) : Boolean;
var
	TempENelement2Act : ENelement2ActControllerSoapPort;
	filter : ENElement2ActFilter;
	arr : ENelement2ActController.ArrayOfInteger;
begin
			TempENElement2Act := HTTPRIOENElement2Act as ENelement2ActControllerSoapPort;
			filter := ENElement2ActFilter.Create;
			SetNullXSProps(filter);
			SetNullIntProps(filter);
			filter.typeRef := ENElement2ActTypeRef.Create;
			filter.typeRef.code := ENELEMENT2ACTTYPE_SERVICES_WORKS;
			filter.elementRef := ENElementRef.Create;
			filter.elementRef.code := ENServicesShiftObj.element.code;
			filter.actRef := ENActRef.Create;
			filter.actRef.code := actCode;
			arr := TempENelement2Act.getScrollableFilteredCodeArray(filter, 0, 1);
      Result := Length(arr) > 0;
end;

procedure TfrmENServicesShiftEdit.toggleActDeleteAction;
var
	row, actCode : Integer;
  grid : TAdvStringGrid;
  isManuallyAdded : Boolean;
begin
	HideActions([actRemoveAct]);
	DisableActions([actRemoveAct]);
  if pcActs.ActivePage = tsRQFKOrder then begin
	  HideActions([actRemoveAct], false);
	  DisableActions([actRemoveAct], false);
  end;

	if (pcActs.ActivePage = tsENAct) or (pcActs.ActivePage = tsENActSubContract) then begin
    if pcActs.ActivePage = tsENAct then grid := sgENAct else grid := sgENActSubContract;
    row := grid.Row;
		if (row > 0) and (Length(grid.Cells[0, row]) > 0) then begin
			actCode := StrToInt(grid.Cells[0, row]);
      isManuallyAdded := Self.checkActIsManuallyAdded(actCode);
			HideActions([actRemoveAct], not isManuallyAdded);
			DisableActions([actRemoveAct], not isManuallyAdded);
		end;
	end;


end;



procedure TfrmENServicesShiftEdit.generatePlans(isGenerate : Boolean);
var
  TempENServicesCost : ENServicesCostControllerSoapPort;
  TempENServicesObject : ENServicesObjectControllerSoapPort;
  servicesCost : ENServicesCost;
  chosenIndices : TList<Integer>;
  servicesCosts : TList<ENServicesCost>;
  item, temp : Integer;
  arr : ENServicesCostController.ArrayOfENServicesCost;
  txsIsGenerate : TXSBoolean;
  msgResult, msgQuestion : string;
  formAttributes : TfrmEditENPlanWorkAttributes;
begin
  inherited;
  chosenIndices := BaseUtils.getCheckedIndexes(sgENServicesCost, 1);
  if (not Assigned(chosenIndices)) or (chosenIndices.Count = 0) then begin
    raise Exception.Create('Оберіть хоча б одну калькуляцію');
  end;
  
  if isGenerate then begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
    formAttributes := TfrmEditENPlanWorkAttributes.Create(Application, dsEdit);
    {NET-4572 В этом случае эти группы полей не нужно отображать}
	  formAttributes.gbPriconnectionNumber.Visible := False;
    formAttributes.gbServicesFromSide.Visible := False;
    
	  formAttributes.plan := ENPlanWork.Create;
	  formAttributes.plan.code := Low(Integer);
    formAttributes.plan.elementRef := ENElementRef.Create;
    formAttributes.plan.elementRef.code := ENServicesShiftObj.element.code;
    formAttributes.plan.stateRef := ENPlanWorkStateRef.Create;
    formAttributes.plan.stateRef.code := ENConsts.ENPLANWORKSTATE_SIDEWORKS;
    formAttributes.plan.typeRef := ENPlanWorkTypeRef.Create;
    formAttributes.plan.typeRef.code := ENConsts.ENPLANWORKTYPE_SIDEWORKS;
    formAttributes.plan.budgetRef := ENDepartmentRef.Create;
    formAttributes.plan.budgetRef.code := ENConsts.ENBUDGET_ENERGOSBYT;
    formAttributes.plan.responsibilityRef := ENDepartmentRef.Create;
    formAttributes.plan.responsibilityRef.code := ENRESPONSIBILITY_ENERGOSBYT;
    formAttributes.plan.departmentRef := ENDepartmentRef.Create;
    formAttributes.plan.departmentRef.code := ENServicesShiftObj.department.code;
	if formAttributes.ShowModal <> mrOk then Exit;
    msgQuestion := 'Ви дійсно бажаєте сформувати плани по обраним калькуляціям?';
	msgResult := 'Плани сформовано!';
  end else begin
    msgQuestion := 'Ви дійсно бажаєте видалити сформовані плани по обраним калькуляціям?';
    msgResult := 'Плани видалено!';
  end;
  
  if Application.MessageBox(PChar(msgQuestion),
                    PChar('Увага!'),MB_ICONQUESTION+MB_YESNO)=IDNO then begin
      Exit;
  end;
  
  TempENServicesCost := HTTPRIOENServicesCost as ENServicesCostControllerSoapPort;
  servicesCosts := TList<ENServicesCost>.Create();
  for item in chosenIndices do begin
    temp := StrToInt(sgENServicesCost.Cells[0, item]);
    servicesCosts.add(TEmpENServicesCost.getObject(temp));
  end;
  item := 0;
  SetLength(arr, servicesCosts.Count);
  for servicesCost in servicesCosts do begin
    arr[item] := servicesCost;
	item := item + 1;
  end;
  txsIsGenerate := TXSBoolean.Create;
  txsIsGenerate.asBoolean := isGenerate;
  if isGenerate then begin
    TempENServicesCost.generatePlans(arr, formAttributes.plan, txsIsGenerate);
  end else begin
    TempENServicesCost.generatePlans(arr, txsIsGenerate);
  end;
  Self.updateENServicesCost;
  Application.MessageBox(PChar(msgResult), PChar('Повідомлення'), MB_ICONINFORMATION);
end;

procedure TfrmENServicesShiftEdit.updateSumsIfNeeded;
var
  TempENServicesObject : ENServicesObjectControllerSoapPort;
begin
  if (not Assigned(ENServicesShiftObj)) or (ENServicesShiftObj.code = Low(Integer)) then Exit;
  if (not Assigned(ENServicesShiftObj.calcSumsByCalculations)) or (not ENServicesShiftObj.calcSumsByCalculations.asBoolean) then Exit;
  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  ENServicesShiftObj := TempENServicesObject.getObject(ENServicesShiftObj.code);
  Self.readENServicesObjectSumAttributes;
end;

procedure TfrmENServicesShiftEdit.readENServicesObjectSumAttributes;
begin

    if ( ENServicesShiftObj.contractServicesSumma <> nil ) then
       edtContractServicesSumma.Text := ENServicesShiftObj.contractServicesSumma.decimalString
    else
       edtContractServicesSumma.Text := '';

       if ( ENServicesShiftObj.contractServicesSummaVAT <> nil ) then
       edtContractServicesSummaVAT.Text := ENServicesShiftObj.contractServicesSummaVAT.decimalString
    else
       edtContractServicesSummaVAT.Text := '';
end;

procedure TfrmENServicesShiftEdit.openENServicesCostEditForm(DialogState : TDialogState);
var
  TempENServicesCost : ENServicesCostControllerSoapPort;
begin

  if DialogState = dsInsert then begin
	  ENServicesCostObj := ENServicesCost.Create;
	  ENServicesCostObj.servicesObjectRef := ENServicesObjectRef.Create;
  	ENServicesCostObj.servicesObjectRef.code := ENServicesShiftObj.code;
  end else begin
    TempENServicesCost := HTTPRIOENServicesCost as ENServicesCostControllerSoapPort;
    try
      ENServicesCostObj := TempENServicesCost.getObject(StrToInt(sgENServicesCost.Cells[0,sgENServicesCost.Row]));
    except
      on EConvertError do Exit;
    end;
  end;

  try
    frmENServicesCostEdit := TfrmENServicesCostEdit.Create(Application, DialogState);
    try
      if (frmENServicesCostEdit.ShowModal = mrOk) or (frmENServicesCostEdit.updateForTransport) then
      begin
        if (ENServicesCostObj<>nil) or (frmENServicesCostEdit.updateForTransport) then
            Self.updateENServicesCost;
        Self.updateSumsIfNeeded;
      end;
    finally
      frmENServicesCostEdit.Free;
      frmENServicesCostEdit := nil;
    end;
  finally
    ENServicesCostObj.Free;
  end;
end;

procedure TfrmENServicesShiftEdit.updateENServicesCost(reset : Boolean = true);
var
  TempENServicesCost : ENServicesCostControllerSoapPort;
  i : Integer;
  list : ENServicesCostShortList;
  filter : ENServicesCostFilter;
  LastRow, pageNum, startPoint : Integer;
  begin
  if reset then begin
    sgENServicesCost.Clear;
    sgENServicesCost.RowCount := 2;
    SetGridHeaders(ENServicesCostHeaders, sgENServicesCost.ColumnHeaders);
    pageNum := 0;
    startPoint := 1;
  end else begin
    pageNum := Trunc(sgENServicesCost.RowCount / PAGE_SIZE);
    startPoint := sgENServicesCost.RowCount;
    if (sgENServicesCost.RowCount - 1) Mod PAGE_SIZE <> 0 then Exit;
    if (sgENServicesCost.TopRow + sgENServicesCost.VisibleRowCount) < pageNum * PAGE_SIZE then Exit;
  end;

  TempENServicesCost := HTTPRIOENServicesCost as ENServicesCostControllerSoapPort;
  filter := ENServicesCostFilter.Create;
  SetNullIntProps(filter);
  SetNullXSProps(filter);
  filter.servicesObjectRef := ENServicesObjectRef.Create;
  filter.servicesObjectRef.code := ENServicesShiftObj.code;
  filter.orderBySQL := 'dategen desc, code';
  list := TempENServicesCost.getScrollableFilteredList(filter, (pageNum * PAGE_SIZE), PAGE_SIZE);
  sgENServicesCost.RowCount := sgENServicesCost.RowCount + list.totalCount;
  if (reset) and (list.totalCount > 0) then
    sgENServicesCost.RowCount := sgENServicesCost.RowCount - 1;

  with sgENServicesCost do
    for i:=0 to list.totalCount - 1 do
      begin
        Application.ProcessMessages;
        LastRow:= i + startPoint;
        if list.list[i].code <> Low(Integer) then
		  Cells[0, LastRow] := IntToStr(list.list[i].code)
        else
          Cells[0, LastRow] := '';

        if list.list[i].dateGen = nil then
          Cells[1, LastRow] := ''
        else
          Cells[1, LastRow] := XSDate2String(list.list[i].dateGen);

        Cells[2, LastRow] := list.list[i].tkClassificationTypeRefKod;

        if list.list[i].countGen <> nil then begin
          Cells[3, LastRow] := list.list[i].countGen.DecimalString;
        end else begin
          Cells[3, LastRow] := '';
        end;

        Cells[4, LastRow] := list.list[i].tkClassificationTypeRefName;

		if list.list[i].costWithoutVAT = nil then
          Cells[5, LastRow] := ''
        else
          Cells[5, LastRow] := list.list[i].costWithoutVAT.DecimalString;

		if list.list[i].costVAT = nil then
          Cells[6, LastRow] := ''
        else
          Cells[6, LastRow] := list.list[i].costVAT.DecimalString;

		if list.list[i].costWithVAT = nil then
          Cells[7, LastRow] := ''
        else
          Cells[7, LastRow] := list.list[i].costWithVAT.DecimalString;

		if (list.list[i].planRefCode <> Low(Integer)) then begin
          Cells[8, LastRow] := 'Так'
        end;

    Cells[9, LastRow] := list.list[i].tkClassificationTypeRefKved;

        AddCheckBox(1, LastRow, false, false);

      end;
   if reset then sgENServicesCost.Row := startPoint else sgENServicesCost.Row := startPoint - 1;
end;

procedure TfrmENServicesShiftEdit.updateENAct(Sender : TObject; isSubContract : Boolean; grid : TAdvStringGrid; reset : Boolean = true);
var
  TempENAct: ENActControllerSoapPort;
  //actFilter: ENActFilter;
  ENActList, ENActListManual : ENActShortList;
  filter : ENActFilter;
  i, pageNum, startPoint, LastRow : Integer;
  conditionSQL, primalCondition : String;
  TempENElement2ActController : ENElement2ActControllerSoapPort;
  element2ActFilter : ENElement2ActFilter;
  listItem : ENActShort;
  element2ActList : ENElement2ActShortList;
  element2Act : ENElement2ActShort;
  listElement2ActCodes : TList<Integer>;
begin
    if ENServicesShiftObj = nil then Exit;
    if ENServicesShiftObj.element = nil then Exit;
    if ENServicesShiftObj.element.code = LOW_INT then Exit;

    if reset then begin
      grid.RowCount := 2;
      grid.Clear;
      SetGridHeaders(ENActHeaders, grid.ColumnHeaders);
      pageNum := 0;
      startPoint := 1;
    end else begin
      pageNum := Trunc(grid.RowCount / PAGE_SIZE);
      startPoint := grid.RowCount;
      if (grid.RowCount - 1) Mod PAGE_SIZE <> 0 then begin
        Exit;
      end;
      if (grid.TopRow + grid.VisibleRowCount) < pageNum * PAGE_SIZE then Exit;
    end;

    Self.actDate := '';

    TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

    filter := actFilter;

    if filter = nil then
    begin
      filter := ENActFilter.Create;
      SetNullIntProps(filter);
      SetNullXSProps(filter);
    end;
    filter.orderBySQL := 'ENACT.DATEACT DESC';

    primalCondition := filter.conditionSQL;
    conditionSQL := primalCondition;
    {AddCondition(conditionSQL, ' enact.code in ' +
                               ' (select distinct p2a.actrefcode ' +
                               ' from enservices2plan s2p, enact2enplanwork p2a ' +
                               ' where s2p.servicesobjectrefcode = ' + IntToStr(ENServicesShiftObj.code) +
                               ' and s2p.planrefcode = p2a.plancode)');}
    AddCondition(conditionSQL, Format( 'enact.code in ( ' +
         'select acpw1.actrefcode from enact2enplanwork as acpw1 ' +
         'inner join enservices2plan as sopl1 on acpw1.plancode = sopl1.planrefcode ' +
         'where ' +
         'sopl1.servicesobjectrefcode = %d ' +
         ' ' +
         'union ' +
         ' ' +
         'select acpw1.actrefcode from enplanwork as pw1 ' +
         'inner join enact2enplanwork as acpw1 on pw1.code = acpw1.plancode ' +
         'where ' +
         'pw1.elementrefcode = %d ' +
         ' ' +
         'union ' +
         ' ' +
         'select elac1.actrefcode from enelement2act as elac1 ' +
         'where ' +
         'elac1.elementrefcode = %d ' +
         ') '
         , [ENServicesShiftObj.code, ENServicesShiftObj.element.code
          , ENServicesShiftObj.element.code]));

	  if(isSubContract) then begin
      conditionSQL := conditionSQL + Format(' and enact.acttyperefcode in (%d)', [ENPLANWORKSTATE_TMC_TRANSFER]);
	  end else begin
      conditionSQL := conditionSQL + Format(' and enact.acttyperefcode not in (%d, %d)', [ENPLANWORKSTATE_TMC_TRANSFER, ENPLANWORKSTATE_SERVICES_FROM_OUT]);
	  end;

    filter.conditionSQL := conditionSQL;



    ENActList := TempENAct.getScrollableFilteredList(filter, pageNum * PAGE_SIZE, PAGE_SIZE);

    TempENElement2ActController := HTTPRIOENElement2Act as ENElement2ActControllerSoapPort;

    filter.conditionSQL := primalCondition;

    element2ActFilter := ENElement2ActFilter.Create;
    SetNullXSProps(element2ActFilter);
    SetNullIntProps(element2ActFilter);

    if ENActList.totalCount = 0 then Exit
    else begin
      element2ActFilter.conditionSQL := 'ENELEMENT2ACT.ACTREFCODE IN (' + IntToStr(Low(Integer));
      for listItem  in ENActList.list do begin
         element2ActFilter.conditionSQL := element2ActFilter.conditionSQL + ','
           + IntToStr(listItem.code);
      end;
      element2ActFilter.conditionSQL := element2ActFilter.conditionSQL + ')';
    end;
    element2ActFilter.typeRef := ENElement2ActTypeRef.Create;
    element2ActFilter.typeRef.code := ENELEMENT2ACTTYPE_SERVICES_WORKS;
    element2ActList := TempENElement2ActController.getScrollableFilteredList(element2ActFilter
      , 0, -1);

    listElement2ActCodes := TList<Integer>.Create;
    for element2Act in element2ActList.list do
      listElement2ActCodes.add(element2Act.actRefCode);

    grid.RowCount := grid.RowCount + ENActList.totalCount;
    if (reset) and (ENActList.totalCount > 0) then
      grid.RowCount := grid.RowCount - 1;

    setActListToGrid(grid, ENActList, listElement2ActCodes, startPoint - 1);

    if reset then grid.Row := startPoint else grid.Row := startPoint - 1;

    toggleActDeleteAction;
end;

procedure TfrmENServicesShiftEdit.updateAct(Sender : TObject);
begin

    if ENServicesShiftObj = nil then Exit;
    if ENServicesShiftObj.element = nil then Exit;
    if ENServicesShiftObj.element.code = LOW_INT then Exit;


    ClearGrid(sgENActIncome);

	    if (ENServicesShiftObj.actIncomeCreatMetodRef.code = ENACTINCOME_CREAT_METOD_SINGLE) then
    begin
      sgENActIncome.Visible := True;
      sgENActIncomeServices.Visible := False;
	    DisableActions([actInsertIncome, actEditIncome, actDeleteIncome], True);
      SetGridHeaders(ENActIncomeHeaders, sgENActIncome.ColumnHeaders);
      with sgENActIncome do
      begin
        Cells[1, 1] := ENServicesShiftObj.contractNumberServices + '/' + ENServicesShiftObj.contractNumber;
        Cells[2, 1] := Self.actDate;
      end;
    end else
    begin
      sgENActIncome.Visible := False;
      sgENActIncomeServices.Visible := True;
      updateActIncome();
    end;
end;


procedure  TfrmENServicesShiftEdit.updateProvs(Sender : TObject);
var
  TempENSOPayBillProv: ENSOPayBillProvControllerSoapPort;
  i, billCode: Integer;
  ENSOPayBillProvList: ENSOPayBillProvShortList;
  pbpFilter : ENSOPayBillProvFilter;

  begin

  ClearGrid(sgENSOPayBillProv);
  SetGridHeaders(ENSOPayBillProvHeaders, sgENSOPayBillProv.ColumnHeaders);
  TempENSOPayBillProv :=  HTTPRIOENSOPayBillProv as ENSOPayBillProvControllerSoapPort;

     pbpFilter := ENSOPayBillProvFilter.Create;
     SetNullIntProps(pbpFilter);
     SetNullXSProps(pbpFilter);

     pbpFilter.soBillRef := ENSOBillRef.Create;

     try
     billCode := StrToInt(sgENSOBill.Cells[0,sgENSOBill.Row]);
     except
     on EConvertError do Exit;
     end;

     pbpFilter.soBillRef.code := billCode;

  ENSOPayBillProvList := TempENSOPayBillProv.getScrollableFilteredList(pbpFilter,0,-1);

  pbpLastCount:=High(ENSOPayBillProvList.list);

  if pbpLastCount > -1 then
     sgENSOPayBillProv.RowCount:=pbpLastCount+2
  else
     sgENSOPayBillProv.RowCount:=2;

   with sgENSOPayBillProv do
    for i:=0 to pbpLastCount do
      begin
        Application.ProcessMessages;
        if ENSOPayBillProvList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSOPayBillProvList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSOPayBillProvList.list[i].soBillRefSumTotal.DecimalString;
        Cells[2,i+1] := ENSOPayBillProvList.list[i].payment2soRefSumTotal.DecimalString;
        if ENSOPayBillProvList.list[i].so2ProvRefDatePosting = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENSOPayBillProvList.list[i].so2ProvRefDatePosting);
        pbpLastRow:=i+1;
        sgENSOPayBillProv.RowCount:=pbpLastRow+1;
      end;
   pbpColCount:=pbpColCount+1;
   sgENSOPayBillProv.Row:=1;
end;


procedure  TfrmENServicesShiftEdit.updatePayments(Sender: TObject);
var
  TempENPayment2SO: ENPayment2SOControllerSoapPort;
  ENPayment2SOList: ENPayment2SOShortList;
  FilterPayment2SO : ENPayment2SOFilter;

  i, billCode : Integer;
begin
    SetGridHeaders(ENPayment2SOHeaders, sgENPayment2SO.ColumnHeaders);
    ClearGrid(sgENPayment2SO);

    if ENServicesShiftObj = nil then Exit;
    if ENServicesShiftObj.element = nil then Exit;
    if ENServicesShiftObj.element.code = LOW_INT then Exit;

    TempENPayment2SO :=  HTTPRIOENPayment2SO as ENPayment2SOControllerSoapPort;

     FilterPayment2SO := ENPayment2SOFilter.Create;
     SetNullIntProps(FilterPayment2SO);
     SetNullXSProps(FilterPayment2SO);

     FilterPayment2SO.servicesObjectRef := ENServicesObjectRef.Create;
     FilterPayment2SO.servicesObjectRef.code :=  ENServicesShiftObj.code;

     try
     billCode := StrToInt(sgENSOBill.Cells[0,sgENSOBill.Row]);
     except
     on EConvertError do Exit;
     end;

     FilterPayment2SO.soBillRef := ENSOBillRef.Create;
     FilterPayment2SO.soBillRef.code := billCode;

    iColCount := -1;
    ENPayment2SOList := TempENPayment2SO.getScrollableFilteredList(ENPayment2SOFilter(FilterPayment2SO),0,-1);

    iLastCount := High(ENPayment2SOList.list);

    if iLastCount > -1 then
      sgENPayment2SO.RowCount := iLastCount + 2
    else
      sgENPayment2SO.RowCount := 2;

     with sgENPayment2SO do
       for i := 0 to iLastCount do
       begin
         Application.ProcessMessages;

         if ENPayment2SOList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPayment2SOList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENPayment2SOList.list[i].dateGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(ENPayment2SOList.list[i].dateGen);
        if ENPayment2SOList.list[i].sumTotal = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENPayment2SOList.list[i].sumTotal.DecimalString;
        if ENPayment2SOList.list[i].sumGen = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENPayment2SOList.list[i].sumGen.DecimalString;

        if ENPayment2SOList.list[i].sumVat = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENPayment2SOList.list[i].sumVat.DecimalString;

        Cells[5,i+1] := ENPayment2SOList.list[i].paymentTypeRefName;

        Cells[6,i+1] := ENPayment2SOList.list[i].userGen;

        if ENPayment2SOList.list[i].dateEdit = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDateTimeWithDate2String(ENPayment2SOList.list[i].dateEdit);

         iLastRow := i + 1;
         sgENPayment2SO.RowCount := iLastRow + 1;
       end;

     iColCount := iColCount + 1;
     sgENPayment2SO.Row := 1;

end;

const MAX_PLAN_CODES : Integer = 5000;
var messagePlanExceededWasShown : Boolean = false;
var planCodes : TList<Integer>;
procedure TfrmENServicesShiftEdit.fillPlanCodesForServices;
var
TempENPlanWork : ENPlanWorkControllerSoapPort;
list : ENPlanWorkShortList;
arr : ENPlanWorkController.ArrayOfInteger;
linkCondition, tempCondition, tempOrderBy, condition : String;
planCode : Integer;
tempElementRef : ENElementRef;
begin
  if ((ENServicesShiftObj = nil) or (ENServicesShiftObj.code = Low(Integer))
      or (ENServicesShiftObj.element = nil)
      or (ENServicesShiftObj.element.code = Low(Integer)))
    then Exit;
  if not Assigned(planFilter) then begin
    planFilter := ENPlanWorkFilter.Create;
    SetNullXSProps(planFilter);
    SetNullIntProps(planFilter);
    tempElementRef := nil;
    tempCondition := '';
    tempOrderBy := '';
  end else begin
    tempElementRef := planFilter.elementRef;
    tempCondition := planFilter.conditionSQL;
    condition := planFilter.conditionSQL;
    tempOrderBy := planFilter.orderBySQL;
  end;

  try
    linkCondition := Format('%%s EXISTS (SELECT 1 FROM enservices2plan AS sp1 ' +
      'WHERE sp1.servicesobjectrefcode = %d AND sp1.planrefcode = ENPLANWORK.CODE)'
        , [ENServicesShiftObj.code]);
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
    planCodes := TList<Integer>.Create;
    planFilter.elementRef := ENElementRef.Create;
    planFilter.elementRef.code := ENServicesShiftObj.element.code;
    AddCondition(condition, Format(linkCondition, ['NOT']));
    planFilter.conditionSQL := condition;
    list := TempENPlanWork.getScrollableFilteredList(planFilter, 0, 1);
    planFilter.elementRef := tempElementRef;
    condition := tempCondition;
    planFilter.orderBySQL := Format('ENPLANWORK.YEARGEN DESC, ENPLANWORK.MONTHGEN DESC LIMIT %d', [MAX_PLAN_CODES]);
    if(list.totalCount = 0) then begin
      AddCondition(condition, Format(linkCondition, ['']));
    end else begin
      AddCondition(condition, Format('((ENPLANWORK.ELEMENTREFCODE = %d) OR (%s))'
        , [ENServicesShiftObj.element.code, Format(linkCondition, [''])]));
    end;
    planFilter.conditionSQL := condition;
    arr := TempENPlanWork.getFilteredCodeArray(planFilter);
    for planCode in arr do begin
      planCodes.add(planCode);
    end;
  finally
    planFilter.elementRef := tempElementRef;
    planFilter.conditionSQL := tempCondition;
    planFilter.orderBySQL := tempOrderBy;
  end;
end;
function getPlanCodes(startPosition, quantity : Integer) : ENPlanWorkController.ArrayOfInteger;
var res : ENPlanWorkController.ArrayOfInteger;
list : TList<Integer>;
i : Integer;
begin
  list := TList<Integer>.Create;
  if startPosition >= MAX_PLAN_CODES then begin
    if not messagePlanExceededWasShown then begin
      Application.MessageBox(PChar(Format('Перегляд планів обмежен до %d записів!%s ' +
          'Якщо необхідний план не було знайдено скористайтеся кнопкою "Фільтр".'
            , [MAX_PLAN_CODES, Chr(10)])), PChar('Повідомлення'), MB_ICONWARNING);
      messagePlanExceededWasShown := true;
    end;
  end;

  for i := startPosition to startPosition + quantity - 1 do begin
    if i >= planCodes.Count then Break;
    list.add(planCodes[i]);
  end;
  SetLength(res, list.Count);
  for i := 0 to list.Count - 1 do begin
    res[i] := list[i];
  end;
  Result := res;
end;


procedure TfrmENServicesShiftEdit.updatePlans(reset : Boolean = true);
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  ENPlanWorkList: ENPlanWorkShortList;
  i, n: Integer;
  conditionSQL, tempCondition, strArrCodes : String;
  arrCodes : ENPlanWorkController.ArrayOfInteger;
  LastRow, pageNum, startPoint : Integer;
begin

  if ENServicesShiftObj = nil then Exit;
  if ENServicesShiftObj.element = nil then Exit;
  if ENServicesShiftObj.element.code = LOW_INT then Exit;

  if reset then begin
    sgENPlanWork.Clear;
    sgENPlanWork.RowCount := 2;
    SetGridHeaders(ENPlanWorkHeaders, sgENPlanWork.ColumnHeaders);
    pageNum := 0;
    startPoint := 1;
    fillPlanCodesForServices;
  end else begin
    pageNum := Trunc(sgENPlanWork.RowCount / PAGE_SIZE);
    startPoint := sgENPlanWork.RowCount;
    if (sgENPlanWork.RowCount - 1) Mod PAGE_SIZE <> 0 then Exit;
    if (sgENPlanWork.TopRow + sgENPlanWork.VisibleRowCount) < pageNum * PAGE_SIZE then Exit;
  end;

  if (not Assigned(planCodes)) or (planCodes.Count = 0) then Exit;


  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;



  if planFilter = nil then
  begin
    planFilter := ENPlanWorkFilter.Create;
    SetNullIntProps(planFilter);
    SetNullXSProps(planFilter);
  end;
  planFilter.orderBySQL := 'ENPLANWORK.YEARGEN DESC, ENPLANWORK.MONTHGEN DESC';

  conditionSQL := planFilter.conditionSQL;

  arrCodes := getPlanCodes(pageNum * PAGE_SIZE, PAGE_SIZE);
  if Length(arrCodes) = 0 then Exit
  else begin
    strArrCodes := BaseUtils.arrayOfIntegers2String(arrCodes, ',');
  end;
  AddCondition(conditionSQL, Format('ENPLANWORK.CODE in (%s)', [strArrCodes]));

  tempCondition := planFilter.conditionSQL;
  planFilter.conditionSQL := conditionSQL;
  try
    ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(planFilter, 0, -1);
  finally
    planFilter.conditionSQL := tempCondition;
  end;

  sgENPlanWork.RowCount := sgENPlanWork.RowCount + ENPlanWorkList.totalCount;
  if (reset) and (ENPlanWorkList.totalCount > 0) then
    sgENPlanWork.RowCount := sgENPlanWork.RowCount - 1;

  with sgENPlanWork do
    for i := 0 to ENPlanWorkList.totalCount - 1 do
    begin
      Application.ProcessMessages;
      LastRow := i + startPoint;
      n := 0;

      if ENPlanWorkList.list[i].code <> Low(Integer) then
        Cells[n, LastRow] := IntToStr(ENPlanWorkList.list[i].code)
      else
        Cells[n, LastRow] := '';
      inc(n);

      Cells[n, LastRow] := ENPlanWorkList.list[i].objectName;
      inc(n);

      Cells[n, LastRow] := ENPlanWorkList.list[i].invNumber;
      inc(n);

      Cells[n, LastRow] := ENPlanWorkList.list[i].renRefName;
      inc(n);

      if ENPlanWorkList.list[i].yearGen <> Low(Integer) then
        Cells[n, LastRow] := IntToStr(ENPlanWorkList.list[i].yearGen)
      else
        Cells[n, LastRow] := '';
      inc(n);

      if ENPlanWorkList.list[i].monthGen <> Low(Integer) then
        Cells[n, LastRow] := MonthesNames[ENPlanWorkList.list[i].monthGen]
      else
        Cells[n, LastRow] := '';
      inc(n);

      if ENPlanWorkList.list[i].dateStart = nil then
        Cells[n, LastRow] := ''
      else
        Cells[n, LastRow] := XSDate2String(ENPlanWorkList.list[i].dateStart);
      inc(n);

      Cells[n, LastRow] := ENPlanWorkList.list[i].typeRefName;
      inc(n);

      Cells[n, LastRow] := ENPlanWorkList.list[i].stateRefShortName;
      inc(n);


      Cells[n, LastRow] := ENPlanWorkList.list[i].kindName ;
      inc(n);

      Cells[n, LastRow] := ENPlanWorkList.list[i].statusName;
      inc(n);

      Cells[n, LastRow] := ENPlanWorkList.list[i].departmentRefShortName;
      inc(n);

      Cells[n, LastRow] := ENPlanWorkList.list[i].budgetRefShortName;
      inc(n);

      Cells[n, LastRow] := ENPlanWorkList.list[i].responsibilityRefShortName;
      inc(n);

      Cells[n, LastRow] := '';

      //if ENPlanWorkList.list[i].yearOriginal <> Low(Integer) then
      if ENPlanWorkList.list[i].yearOriginal > 0 then
      begin
        //if ENPlanWorkList.list[i].monthOriginal <> Low(Integer) then
        if ENPlanWorkList.list[i].monthOriginal > 0 then
          Cells[n, LastRow] := MonthesNames[ENPlanWorkList.list[i].monthOriginal] + ' ' +
                          IntToStr(ENPlanWorkList.list[i].yearOriginal);
      end
      else
        Cells[n, LastRow] := '';
      inc(n);
      /////

      Cells[n, LastRow] := ENPlanWorkList.list[i].workOrderNumber;
      inc(n);

      Cells[n, LastRow] := ENPlanWorkList.list[i].userGen;
      inc(n);

      if ENPlanWorkList.list[i].dateEdit = nil then
        Cells[n, LastRow] := ''
      else
        Cells[n, LastRow] := XSDate2String(ENPlanWorkList.list[i].dateEdit);
      inc(n);
    end;
    if reset then sgENPlanWork.Row := startPoint else sgENPlanWork.Row := startPoint - 1;

  sgENPlanWorkClick(nil);
end;

procedure TfrmENServicesShiftEdit.updateBills(reset : Boolean = true);
Var
  TempENSOBill: ENSOBillControllerSoapPort;
  i: Integer;
  ENSOBillList: ENSOBillShortList;
  billFilter : ENSOBillFilter;
  startPoint, LastRow, pageNum : Integer;
begin

  if reset then begin
    sgENSOBill.Clear;
    sgENSOBill.RowCount := 2;
    SetGridHeaders(ENSOBillHeaders, sgENSOBill.ColumnHeaders);
    pageNum := 0;
    startPoint := 1;
  end else begin
    pageNum := Trunc(sgENSOBill.RowCount / PAGE_SIZE);
    startPoint := sgENSOBill.RowCount;
    if (sgENSOBill.RowCount - 1) Mod PAGE_SIZE <> 0 then Exit;
    if (sgENSOBill.TopRow + sgENSOBill.VisibleRowCount) < pageNum * PAGE_SIZE then Exit;
  end;

  TempENSOBill :=  HTTPRIOENSOBill as ENSOBillControllerSoapPort;

  billFilter := ENSOBillFilter.Create;
  SetNullIntProps(billFilter);
  SetNullXSProps(billFilter);

  billFilter.servicesObjectRef := ENServicesObjectRef.Create;
  billFilter.servicesObjectRef.code := ENServicesShiftObj.code;
  billFilter.orderBySQL := 'ENSOBILL.DATEGEN DESC';

  ENSOBillList := TempENSOBill.getScrollableFilteredList(billFilter, pageNum * PAGE_SIZE, PAGE_SIZE);
  sgENSOBill.RowCount := sgENSOBill.RowCount + ENSOBillList.totalCount;
  if (reset) and (ENSOBillList.totalCount > 0) then
    sgENSOBill.RowCount := sgENSOBill.RowCount - 1;


   with sgENSOBill do
    for i:=0 to ENSOBillList.totalCount - 1 do
      begin
        Application.ProcessMessages;
        LastRow := i + startPoint;
        if ENSOBillList.list[i].code <> Low(Integer) then
        Cells[0, LastRow] := IntToStr(ENSOBillList.list[i].code)
        else
        Cells[0, LastRow] := '';
        if ENSOBillList.list[i].dateGen = nil then
          Cells[1, LastRow] := ''
        else
          Cells[1, LastRow] := XSDate2String(ENSOBillList.list[i].dateGen);
        if ENSOBillList.list[i].sumTotal = nil then
          Cells[2, LastRow] := ''
        else
          Cells[2, LastRow] := ENSOBillList.list[i].sumTotal.DecimalString;
        if ENSOBillList.list[i].sumGen = nil then
          Cells[3, LastRow] := ''
        else
          Cells[3, LastRow] := ENSOBillList.list[i].sumGen.DecimalString;
        if ENSOBillList.list[i].sumVat = nil then
          Cells[4, LastRow] := ''
        else
          Cells[4, LastRow] := ENSOBillList.list[i].sumVat.DecimalString;
        Cells[5, LastRow] := ENSOBillList.list[i].userGen;
        if ENSOBillList.list[i].dateEdit = nil then
          Cells[6, LastRow] := ''
        else
          Cells[6, LastRow] := XSDateTimeWithDate2String(ENSOBillList.list[i].dateEdit);
      end;
      if reset then sgENSOBill.Row := startPoint else sgENSOBill.Row := startPoint - 1;

end;


procedure TfrmENServicesShiftEdit.FormShow(Sender: TObject);
var
  warrant : ENWarrant;

begin

  lblCode.Visible := (DialogState <> dsInsert);
  edtCode.Visible := (DialogState <> dsInsert);

  tsCalcAdditionalItems.TabVisible := (DialogState <> dsInsert);

  isJobsByTime:= False;
  isVisitClient:= False;

  DepartmentForServicesCode := -1;

  SetGridHeaders(ENPlanWorkHeaders, sgENPlanWork.ColumnHeaders);
  SetGridHeaders(ENPlanWorkItemHeaders, sgENSelectedPlanItems.ColumnHeaders);

  pcCalculation.ActivePage := tsGeneral;

  DisableControls([edtWarrantNumber, edtWarrantFIO, edtCommentGen,
    edtFinDocID, edtName, edtPartnerCode, edtContractNumber, edtContractDateFin
    ]);

  HideControls([btnPrintContract4Rent, btnPrintRegistry]);

  chbIsCustomerMaterials.Checked := (ENServicesShiftObj.isCustomerMaterials = ENSERVICESOBJECT_ISCUSTOMERMATERIALS);
  if not chbIsCustomerMaterials.Checked then begin
    tsActContragentMaterialsTransfer.TabVisible := False;
  end else begin
    tsActContragentMaterialsTransfer.TabVisible := True;
  end;

  tsPlans.TabVisible := False;
  tsActs.TabVisible := False;
  tsPayment.TabVisible := False;

  tsENServicesCost.TabVisible := ((DialogState <> dsInsert)
    and (ENServicesShiftObj.actIncomeCreatMetodRef.code = ENACTINCOME_CREAT_METOD_MORE_ONE));

  tsAdditionalAgreements.TabVisible := ((DialogState <> dsInsert)
    and (ENServicesShiftObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED));

   SetFloatStyle([edtContractServicesSumma, edtContractServicesSummaVAT, edtContractServicesDay, edtPayDetail]);


  if (DialogState = dsInsert) then
  begin
    pcCalculation.ActivePage := tsGeneral;
    tsGeneral.TabVisible := True;
    HideControls([gbPrintReports]);
  end;

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtENDepartmentDepartmentName
      ,spbENDepartmentDepartment
      ,edtENElementElementName
      ,spbENElementElement
      ,spbContractNumberSelect
      ,rgContragentType
      ,rgPayable
      , edtFinDocID
      , edtContractNumberServices
      , spbWarrantNumber
      ]);

    DisableActions([{actFilter, }actNoFilter]);
	  DisableActions([actInsertCAI, actDeleteCAI, actEditCAI]);

    DisableActions([actEditPlan, actDeletePlan,
                    actClosePlan, actUnClosePlan]);
  end;

  DisableControls([ edtENDepartmentDepartmentName, edtContractNumberServices]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtContractDateServices
      ,edtContragentName
      ,edtENDepartmentDepartmentName
      ,edtFinDocID
      ,edtWarrantNumber
     ]);

  end;

  DisableControls([edtCode ,edtCommentGen ]);

  if (DialogState = dsEdit) then
  begin
      DisableControls([spbENDepartmentDepartment], false);
      DisableControls([edtContractNumber]);
      DenyBlankValues([edtENDepartmentDepartmentName]);

      ///// 28.07.10
      if ENServicesShiftObj.finDocID = LOW_INT then
      begin
        DisableControls([{edtContractNumber, }spbContractNumberSelect], false);
        DenyBlankValues([edtContractNumber]);
      end;
      /////

      ///// 16.05.13 NET-4235
      // btnPrintFactCalc.Visible := (ENServicesShiftObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT);
      /////
  end;

  if DialogState = dsInsert then
     begin
      edtContractNumberServices.Text := 'Auto';

     end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ENServicesShiftObj.actIncomeCreatMetodRef.code = ENACTINCOME_CREAT_METOD_MORE_ONE then
	    HideActions([actEditBill, actDeleteBill])
	  else
      HideActions([actAddPlan, actLinkWithPlan, actDeletePlan], False);

    if ENServicesShiftObj.contractKindRef.code = SERVICES_CONTRACT_KIND_SUPPLIER then
    begin
      HideControls([lblContractKind, cbContractKind]);
      HideControls([btnPrintRegistry], false);
    end;

    planCode := DMReports.getPlanCodeForCalculationByElement(ENServicesShiftObj.element.code);

    if  ENServicesShiftObj.warrantRef.code <> LOW_INT then
    begin
      warrant := DMReports.getWarrantByCode(ENServicesShiftObj.warrantRef.code);

      edtWarrantNumber.Text := warrant.numbergen;
      edtWarrantFIO.Text := warrant.warrantFIO;
    end;

    if (ENServicesShiftObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
    begin

       //DisableActions([actInsert, actEdit, actDelete]);
       DisableActions([ actEditPlan,
                        actDeletePlan]);

       btnPrintContract4Rent.Visible := true;
       tsGeneral.TabVisible := true;

    end;


    if (ENServicesShiftObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
    begin
      tsPlans.TabVisible := true; //(HTTPRIOENPlanWork2ClassificationType.HTTPWebNode.UserName = 'energynet');
      tsActs.TabVisible := false;
      tsPayment.TabVisible := false;
    end;

    if (ENServicesShiftObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_SIGNED) then
    begin
      tsActs.TabVisible := True;
      tsPayment.TabVisible := True;
    end;



    ////////////////////////////////////////////////////////////////////////////
    // 24.04.13 Все action'ы теперь разделены
    DisableActions([actDeletePlan, actEditPlan,
                    actClosePlan, actUnClosePlan]);

    if (ENServicesShiftObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
    begin


      if not (ENServicesShiftObj.contractStatusRef.code in [ENSERVICESOBJECTSTATUS_COMPLETED,
                                                             ENSERVICESOBJECTSTATUS_TERMINATED]) then
      begin

          // С планами даем работать только если договор не проведен в ФК
          if ENServicesShiftObj.statusRef.code <> ENSERVICESOBJECT_FINSTATUS_CLOSED then
            DisableActions([actDeletePlan, actEditPlan,
                            actClosePlan, actUnClosePlan], false);


      end;

    end; // if (ENServicesShiftObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED)

    edtCode.Text := IntToStr(ENServicesShiftObj.code);

    if (ENServicesShiftObj.contractNumber <> '') then
       edtContractNumber.Text := ENServicesShiftObj.contractNumber
    else
       edtContractNumber.Text := ENServicesShiftObj.contractNumberServices;

    if ENServicesShiftObj.contractDateServices <> nil then
    begin
      edtContractDateServices.DateTime:=EncodeDate(ENServicesShiftObj.contractDateServices.Year,ENServicesShiftObj.contractDateServices.Month,ENServicesShiftObj.contractDateServices.Day);
      edtContractDateServices.checked := true;
    end
    else
    begin
      edtContractDateServices.DateTime:=SysUtils.Date;
      edtContractDateServices.checked := false;
    end;

    if ENServicesShiftObj.contractDate <> nil then
    begin
      edtContractDateFin.DateTime:=EncodeDate(ENServicesShiftObj.contractDate.Year,ENServicesShiftObj.contractDate.Month,ENServicesShiftObj.contractDate.Day);
      edtContractDateFin.checked := true;
    end;

    edtContragentName.Text := ENServicesShiftObj.contragentName;
    MakeMultiline(edtContragentAddress.Lines, ENServicesShiftObj.contragentAddress);
    MakeMultiline(edtContragentAddressWork.Lines, ENServicesShiftObj.contragentAddressWork);
    edtContragentObjectWork.Text := ENServicesShiftObj.contragentObjectWork;
    MakeMultiline(edtContragentPassport.Lines, ENServicesShiftObj.contragentPassport);
    edtContragentOkpo.Text := ENServicesShiftObj.contragentOkpo;
    edtContragentBossName.Text := ENServicesShiftObj.contragentBossName;
    edtContragentBankName.Text := ENServicesShiftObj.contragentBankName;
    edtContragentBankAccount.Text := ENServicesShiftObj.contragentBankAccount;
    edtContragentBankMfo.Text := ENServicesShiftObj.contragentBankMfo;
    edtENDepartmentDepartmentName.Text := ENServicesShiftObj.department.name;
    MakeMultiline(edtCommentGen.Lines, ENServicesShiftObj.commentGen);


	Self.readENServicesObjectSumAttributes;

    if ( ENServicesShiftObj.contractServicesDay <> nil ) then
       edtContractServicesDay.Text := ENServicesShiftObj.contractServicesDay.decimalString
    else
       edtContractServicesDay.Text := '';

    edtName.Text := ENServicesShiftObj.name;
    edtPartnerCode.Text := ENServicesShiftObj.partnerCode;
    edtFinDocCode.Text := ENServicesShiftObj.finDocCode;

    if ( ENServicesShiftObj.finDocID <> Low(Integer) ) then
       edtFinDocID.Text := IntToStr(ENServicesShiftObj.finDocID)
    else
       edtFinDocID.Text := '';

    MakeMultiline(edtCommentServicesGen.Lines, ENServicesShiftObj.commentServicesGen);
    edtPayDetail.Text := ENServicesShiftObj.payDetail;

    if ENServicesShiftObj.executeWorkDate <> nil then
      begin
        edtExecuteWorkDate.DateTime:=EncodeDate(ENServicesShiftObj.executeWorkDate.Year,ENServicesShiftObj.executeWorkDate.Month,ENServicesShiftObj.executeWorkDate.Day);
        edtExecuteWorkDate.checked := true;
      end
    else
      begin
        edtExecuteWorkDate.DateTime:=SysUtils.Date;
        edtExecuteWorkDate.checked := false;
      end;
    if ENServicesShiftObj.timeStart <> nil then
      begin
        edtTimeStart.DateTime:= EncodeTime(ENServicesShiftObj.timeStart.Hour,ENServicesShiftObj.timeStart.Minute, 0, 0);
        //EncodeDate(ENTravelSheetObj.timeStart.Year,ENTravelSheetObj.timeStart.Month,ENTravelSheetObj.timeStart.Day);
        edtTimeStart.checked := true;
      end
      else
      begin
        edtTimeStart.DateTime:=SysUtils.Date;
        edtTimeStart.checked := false;
      end;

      if ENServicesShiftObj.timeFinal <> nil then
      begin
        edtTimeFinal.DateTime:= EncodeTime(ENServicesShiftObj.timeFinal.Hour,ENServicesShiftObj.timeFinal.Minute, 0, 0);
         //EncodeDate(ENTravelSheetObj.timeFinal.Year,ENTravelSheetObj.timeFinal.Month,ENTravelSheetObj.timeFinal.Day);
        edtTimeFinal.checked := true;
      end
      else
      begin
        edtTimeFinal.DateTime:=SysUtils.Date;
        edtTimeFinal.checked := false;
      end;

      edtContragentPhoneNumber.Text := ENServicesShiftObj.contragentPhoneNumber;
      edtExecutorPhoneNumber.Text := ENServicesShiftObj.executorPhoneNumber;

      rgContragentType.ItemIndex:= ENServicesShiftObj.contragentTypeRef.code-1;
      rgPayable.ItemIndex:= ENServicesShiftObj.isNoPay;

      edtContragentPosition.Text := ENServicesShiftObj.contragentPosition;

      edtProjectCode.Text := ENServicesShiftObj.projectCode;


      edtWarrantContrAgentNumber.Text := ENServicesShiftObj.warrantNumber;
      edtWarrantContrAgentFIO.Text := ENServicesShiftObj.warrantFIO;

    if ENServicesShiftObj.warrantDate <> nil then
    begin
      edtWarrantContrAgentDate.DateTime:=EncodeDate(ENServicesShiftObj.warrantDate.Year,ENServicesShiftObj.warrantDate.Month,ENServicesShiftObj.warrantDate.Day);
      edtWarrantContrAgentDate.checked := true;
    end;

     cbContractKind.ItemIndex := -1;
     if ((ENServicesShiftObj.contractKindRef <> nil) and
        (ENServicesShiftObj.contractKindRef.code <> LOW_INT)) then
      begin
         cbContractKind.ItemIndex := servicesContractKindCodes.IndexOf(ENServicesShiftObj.contractKindRef.code);
      end;
	  
	  chbCalcSumsByCalculation.Checked := (Assigned(ENServicesShiftObj)) and (Assigned(ENServicesShiftObj.calcSumsByCalculations))
         and (ENServicesShiftObj.calcSumsByCalculations.asBoolean);

    //planCode := DMReports.getPlanCodeForCalculationByElement(ENServicesShiftObj.element.code);
    ////////
    SetFormCaption(ENServicesShiftObj.element.code);
    ////////
    pcCalculationChange(Sender);



    if ENServicesShiftObj.department.code <> LOW_INT then
       begin
         DepartmentForServicesCode:= ENServicesShiftObj.department.code;
       end;

       DisableControls([edtExecuteWorkDate  , edtTimeStart  , edtTimeFinal ]);

    cbbBasisType.ItemIndex := -1;

    if (ENServicesShiftObj.basisType <> nil ) then
    begin
       try
         cbbBasisType.ItemIndex := StrToInt(ENServicesShiftObj.basisType.DecimalString);
       except
         on EConvertError do cbbBasisType.ItemIndex := -1;
       end;

            if (ENServicesShiftObj.basisType.DecimalString <> '3') and ( DialogState = dsEdit ) then
             DisableControls([edtWarrantContrAgentFIO , edtWarrantContrAgentNumber , edtWarrantContrAgentDate]);
      end

    else
      begin
       DisableControls([edtWarrantContrAgentFIO , edtWarrantContrAgentNumber , edtWarrantContrAgentDate]);
       cbbBasisType.ItemIndex := 0;
      end;


  end;


    checkWarrant := true;

end;


procedure TfrmENServicesShiftEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENServicesObject: ENServicesObjectControllerSoapPort;
  startPeriodDate: TXSDate;
  endPeriodDate: TXSDate;
  tabNumber, FIO: string;
begin
  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

  if (ModalResult = mrOk) then
  begin
  if ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  begin

       if not chbCalcSumsByCalculation.Checked then begin
	   if (Length(Trim(edtContractServicesSumma.Text)) = 0) or
	     (Length(Trim(edtContractServicesSummaVAT.Text)) = 0) then begin
            Application.MessageBox(PChar('Введіть сумму за договором та сумму ПДВ!'),PChar('Увага!'), MB_ICONWARNING);
            Action := caNone;
		    Exit;
		 end;
	 end;

    // 21.09.12 NET-3079
    ENServicesShiftObj.isCustomerMaterials := Ord(chbIsCustomerMaterials.Checked);

    // Если признак использования материалов заказчика сбросили, то нужно очистить
    // номер и дату акта приема-передачи
    if (not chbIsCustomerMaterials.Checked) then begin
      ENServicesShiftObj.actTransferNumber := '';
      ENServicesShiftObj.actTransferDate := nil;
    end;

      if DialogState = dsEdit then
      begin
        if edtcontractDateFin.checked then
        begin
          if ENServicesShiftObj.contractDate = nil then
            ENServicesShiftObj.contractDate := TXSDate.Create;
          ENServicesShiftObj.contractDate.XSToNative(GetXSDate(edtcontractDateFin.DateTime));
        end
        else begin
          Application.MessageBox(PChar('Введите дату договора!'),PChar('Внимание!'), MB_ICONWARNING);
          Action := caNone;
          ENServicesShiftObj.contractDate := nil;
          pcCalculation.ActivePage := tsGeneral;
          if edtcontractDateFin.CanFocus then
            edtcontractDateFin.SetFocus;
          Exit;
        end;

        //////////////////////////////////////
         if edtFinDocID.Text = '' then
         begin
           Application.MessageBox(PChar('Привяжите договор из ФинКоллекции!'),PChar('Внимание!'), MB_ICONWARNING);
           pcCalculation.ActivePage := tsGeneral;
           if edtContractNumber.CanFocus then
             edtContractNumber.SetFocus;
           Action := caNone;
           Exit;
         end;

      end;

      if edtcontractDateServices.checked then
        begin
          if ENServicesShiftObj.contractDateServices = nil then
            ENServicesShiftObj.contractDateServices := TXSDate.Create;
          ENServicesShiftObj.contractDateServices.XSToNative(GetXSDate(edtcontractDateServices.DateTime));
        end
        else begin
          Application.MessageBox(PChar('Введите дату договора!'),PChar('Внимание!'), MB_ICONWARNING);
          Action := caNone;
          ENServicesShiftObj.contractDateServices := nil;
          pcCalculation.ActivePage := tsGeneral;
          if edtcontractDateServices.CanFocus then
            edtcontractDateServices.SetFocus;
          Exit;
        end;

      ENServicesShiftObj.name := edtName.Text;

      ENServicesShiftObj.partnerCode := edtPartnerCode.Text;
      ENServicesShiftObj.finDocCode := edtFinDocCode.Text;

      if ( edtFinDocID.Text <> '' ) then
        ENServicesShiftObj.finDocID := StrToInt(edtFinDocID.Text)
      else
        ENServicesShiftObj.finDocID := Low(Integer) ;

      ENServicesShiftObj.commentGen := edtCommentGen.Text;

      ENServicesShiftObj.contractNumberServices := edtContractNumberServices.Text; // наш
      ENServicesShiftObj.contractNumber := edtContractNumber.Text;
      ENServicesShiftObj.contragentName := edtContragentName.Text; // контрагент услуги
      ENServicesShiftObj.contragentAddress := edtContragentAddress.Text;
      ENServicesShiftObj.contragentOkpo := edtContragentOkpo.Text;
      ENServicesShiftObj.contragentPosition := edtContragentPosition.Text;
      ENServicesShiftObj.contragentBankAccount := edtContragentBankAccount.Text;
      ENServicesShiftObj.contragentBankName := edtContragentBankName.Text;
      ENServicesShiftObj.contragentBankMfo := edtContragentBankMfo.Text;

      ENServicesShiftObj.contragentBossName := edtContragentBossName.Text;
      ENServicesShiftObj.contragentPassport := edtContragentPassport.Text;

      ENServicesShiftObj.commentServicesGen := edtCommentServicesGen.Text;
      ENServicesShiftObj.contragentAddressWork := edtContragentAddressWork.Text;
      ENServicesShiftObj.contragentObjectWork :=  edtContragentObjectWork.Text;

      if (ENServicesShiftObj.basisType = nil ) then
     ENServicesShiftObj.basisType := TXSDecimal.Create;
     if ( (cbbBasisType.ItemIndex <> -1 ) and  (cbbBasisType.ItemIndex <> 0) ) then
       ENServicesShiftObj.basisType.decimalString := IntToStr(cbbBasisType.itemIndex)
     else
       ENServicesShiftObj.basisType := nil;


      if edtexecuteWorkDate.checked then
      begin
        if ENServicesShiftObj.executeWorkDate = nil then
          ENServicesShiftObj.executeWorkDate := TXSDate.Create;
        ENServicesShiftObj.executeWorkDate.XSToNative(GetXSDate(edtexecuteWorkDate.DateTime));
      end
      else
        ENServicesShiftObj.executeWorkDate := nil;

      if edttimeStart.checked then
      begin
        if ENServicesShiftObj.timeStart = nil then
          ENServicesShiftObj.timeStart := TXSDateTime.Create;
        ENServicesShiftObj.timeStart.XSToNative(GetXSDateTime(edttimeStart.DateTime));
      end
      else
        ENServicesShiftObj.timeStart := nil;

      if edttimeFinal.checked then
      begin
        if ENServicesShiftObj.timeFinal = nil then
          ENServicesShiftObj.timeFinal := TXSDateTime.Create;
        ENServicesShiftObj.timeFinal.XSToNative(GetXSDateTime(edttimeFinal.DateTime));
      end
      else
        ENServicesShiftObj.timeFinal := nil;

      ENServicesShiftObj.contragentPhoneNumber := edtContragentPhoneNumber.Text;
     ENServicesShiftObj.executorPhoneNumber := edtExecutorPhoneNumber.Text;

     ENServicesShiftObj.projectCode := edtProjectCode.Text;

     if (ENServicesShiftObj.contractServicesSumma = nil ) then
     ENServicesShiftObj.contractServicesSumma := TXSDecimal.Create;
     if edtContractServicesSumma.Text <> '' then
       ENServicesShiftObj.contractServicesSumma.decimalString := edtContractServicesSumma.Text
     else
       ENServicesShiftObj.contractServicesSumma := nil;

     if (ENServicesShiftObj.contractServicesSummaVAT = nil ) then
     ENServicesShiftObj.contractServicesSummaVAT := TXSDecimal.Create;
       if edtContractServicesSummaVAT.Text <> '' then
       ENServicesShiftObj.contractServicesSummaVAT.decimalString := edtContractServicesSummaVAT.Text
     else
       ENServicesShiftObj.contractServicesSummaVAT := nil;

     if (ENServicesShiftObj.contractServicesDay = nil ) then
       ENServicesShiftObj.contractServicesDay := TXSDecimal.Create;
     if edtContractServicesDay.Text <> '' then
       ENServicesShiftObj.contractServicesDay.decimalString := edtContractServicesDay.Text
     else
       ENServicesShiftObj.contractServicesDay := nil;

      ENServicesShiftObj.payDetail := edtPayDetail.Text;

     ENServicesShiftObj.warrantNumber := edtWarrantContrAgentNumber.Text;
      ENServicesShiftObj.warrantFIO := edtWarrantContrAgentFIO.Text;

      if edtWarrantContrAgentDate.checked then
      begin
        if ENServicesShiftObj.warrantDate = nil then
        ENServicesShiftObj.warrantDate := TXSDate.Create;
        ENServicesShiftObj.warrantDate.XSToNative(GetXSDate(edtWarrantContrAgentDate.DateTime));
      end
      else
      ENServicesShiftObj.warrantDate := nil;

     if (ENServicesShiftObj.contractKindRef = nil) then
       ENServicesShiftObj.contractKindRef := ENServicesContractKindRef.Create;
     if ENServicesShiftObj.contractKindRef.code <> SERVICES_CONTRACT_KIND_SUPPLIER then
     begin
       if (cbContractKind.ItemIndex <> -1) then
         ENServicesShiftObj.contractKindRef.code := servicesContractKindCodes[cbContractKind.ItemIndex]
       else
         ENServicesShiftObj.contractKindRef.code := LOW_INT;
     end;

	 ENServicesShiftObj.calcSumsByCalculations := TXSBoolean.Create;
     ENServicesShiftObj.calcSumsByCalculations.asBoolean := chbCalcSumsByCalculation.Checked;


      if DialogState = dsInsert then
      begin
        ENServicesShiftObj.code:=low(Integer);
        TempENServicesObject.addForShiftLines(ENServicesShiftObj);
      end;

      if DialogState = dsEdit then
      begin
        TempENServicesObject.saveForCalculation(ENServicesShiftObj)
      end;

   end;
  end;
end;


procedure TfrmENServicesShiftEdit.btnENElementElementClick(Sender : TObject);
var
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENServicesShiftObj.element = nil then ENServicesShiftObj.element := ENElement.Create();
               ENServicesShiftObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;



procedure TfrmENServicesShiftEdit.btnAccListsClick(Sender: TObject);
begin
    pmAccSheet.Popup(
    btnAccLists.Left + 50,
    btnAccLists.Top + 3*btnAccLists.Height);
end;

procedure TfrmENServicesShiftEdit.btnContractNumberSelectClick(Sender: TObject);
var
   frmFINServicesObjectShow: TfrmFINServicesObjectShow;
   f : ENServicesObjectFilter;
begin

// чуть шо добавть группы если не будут нужных договоров
// в ДАО метод getContractList ... сейчас 205 - лабораторные работы
// !!!!
// уже перехало ... юзаеться в клиенте !!! + в Строках Заявки ...

   f := ENServicesObjectFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);

   if (edtContractNumber.Text <> '') then
     f.contractNumber := edtContractNumber.Text
   else
     f.contractNumber := '-1';

   f.conditionSQL := 'a.io_flag = ''S'' and a.agree_group_id in (205, 342, 319, 88, 201, 218, 303, 198, 50, 206, 338)';

   frmFINServicesObjectShow:=TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_CUSTOMER;
   try
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin
            try
{
        Cells[1,i+1] := ENServicesObjectList.list[i].contractNumber;
        if ENServicesObjectList.list[i].contractDate = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENServicesObjectList.list[i].contractDate);
        Cells[3,i+1] := ENServicesObjectList.list[i].name;
        Cells[4,i+1] := ENServicesObjectList.list[i].partnerCode;
        Cells[5,i+1] := ENServicesObjectList.list[i].finDocCode;
        if ENServicesObjectList.list[i].finDocID = Low(Integer) then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := IntToStr(ENServicesObjectList.list[i].finDocID);
        Cells[7,i+1] := ENServicesObjectList.list[i].commentGen;
}
                edtContractNumber.Text := GetReturnValue(sgFINServicesObject, 1);
                edtContractDateFin.DateTime := StrToDate(GetReturnValue(sgFINServicesObject, 2));
                edtContractDateFin.Checked := true;
                edtContragentName.Text := GetReturnValue(sgFINServicesObject, 3);
                edtFinDocID.Text :=  GetReturnValue(sgFINServicesObject, 6);
                edtCommentGen.Text :=  GetReturnValue(sgFINServicesObject, 7);

                ///// 28.07.10
                DisableControls([edtCode
                                 ,edtContractDateFin
                                 ,edtContragentName
                                 ,edtCommentGen
                                 //,edtContractDateServices //??? че его не было??
                                ]);
                /////
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINServicesObjectShow.Free;
   end;
end;

procedure TfrmENServicesShiftEdit.spbContractNumberSelectClick(
  Sender: TObject);
var
   frmFINServicesObjectShow: TfrmFINServicesObjectShow;
   f : ENServicesObjectFilter;
begin
   f := ENServicesObjectFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);

   if (edtContractNumber.Text <> '') then
     f.contractNumber := edtContractNumber.Text
   else
     f.contractNumber := '-1';

   //f.conditionSQL := 'a.io_flag = ''S'' and a.agree_group_id in (205, 342, 319, 88, 201, 218, 303, 198, 50, 206, 338, 44)';
   f.conditionSQL := 'a.io_flag = ''S'''; // and a.agree_group_id in (' + AGREES_GROUPS_IDS + ')';

   frmFINServicesObjectShow:=TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_CUSTOMER;
   try
    with frmFINServicesObjectShow do
      if ShowModal = mrOk then
      begin
        try
          edtContractNumber.Text := GetReturnValue(sgFINServicesObject, 1);
          edtContractDateFin.DateTime := StrToDate(GetReturnValue(sgFINServicesObject, 2));
          edtContractDateFin.Checked := true;
          edtName.Text := GetReturnValue(sgFINServicesObject, 3);
          edtPartnerCode.Text := GetReturnValue(sgFINServicesObject, 4);
          edtFinDocCode.Text :=  GetReturnValue(sgFINServicesObject, 5);
          edtFinDocID.Text :=  GetReturnValue(sgFINServicesObject, 6);
          edtCommentGen.Text :=  GetReturnValue(sgFINServicesObject, 7);

          if (edtContragentName.Text = '') then
             edtContragentName.Text := GetReturnValue(sgFINServicesObject, 3);

          ///// 28.07.10
          DisableControls([edtCode
                           ,edtContractDateFin
                           ,edtName
                           ,edtPartnerCode
                           ,edtFinDocCode
                           ,edtFinDocID
                           ,edtCommentGen
                           ,edtContractDateFin //??? че его не было??
                          ]);
          /////
        except
          on EConvertError do Exit;
        end;
      end;
   finally
     frmFINServicesObjectShow.Free;
   end;
end;


procedure TfrmENServicesShiftEdit.spbENDepartmentDepartmentClick(
  Sender: TObject);
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
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
        if ShowModal = mrOk then
        begin
            try
               if ENServicesShiftObj.department = nil then ENServicesShiftObj.department := ENDepartment.Create();
               ENServicesShiftObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
               if  ENServicesShiftObj.element = nil then  ENServicesShiftObj.element := ENElement.Create;
               if  ENServicesShiftObj.element.renRef = nil then ENServicesShiftObj.element.renRef := EPRenRef.Create;
               ENServicesShiftObj.element.renRef.code := StrToInt(DMReports.getEPRenByDepartmentCode(ENServicesShiftObj.department.code));
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENServicesShiftEdit.updateAdditionalAgreements(reset : Boolean = true);
var
  TempENAdditionalAgreement : ENAdditionalAgreementControllerSoapPort;
  i : Integer;
  list : ENAdditionalAgreementShortList;
  filter : ENAdditionalAgreementFilter;
  LastRow, pageNum, startPoint : Integer;
begin
  if reset then begin
    sgENAdditionalAgreement.Clear;
    sgENAdditionalAgreement.RowCount := 2;
    SetGridHeaders(ENAdditionalAgreementHeaders, sgENAdditionalAgreement.ColumnHeaders);
    sgENAdditionalAgreement.AutoSizeRow(0);
    pageNum := 0;
    startPoint := 1;
  end else begin
    pageNum := Trunc(sgENAdditionalAgreement.RowCount / PAGE_SIZE);
    startPoint := sgENAdditionalAgreement.RowCount;
    if (sgENAdditionalAgreement.RowCount - 1) Mod PAGE_SIZE <> 0 then Exit;
    if (sgENAdditionalAgreement.TopRow + sgENAdditionalAgreement.VisibleRowCount) < pageNum * PAGE_SIZE then Exit;
  end;

  TempENAdditionalAgreement := HTTPRIOENAdditionalAgreement as ENAdditionalAgreementControllerSoapPort;
  filter := ENAdditionalAgreementFilter.Create;
  SetNullIntProps(filter);
  SetNullXSProps(filter);
  filter.servicesObjectRef := ENServicesObjectRef.Create;
  filter.servicesObjectRef.code := ENServicesShiftObj.code;
  filter.orderBySQL := 'dategen desc';
  list := TempENAdditionalAgreement.getScrollableFilteredList(filter, pageNum * PAGE_SIZE, PAGE_SIZE);
  sgENAdditionalAgreement.RowCount := sgENAdditionalAgreement.RowCount + list.totalCount;
  if (reset) and (list.totalCount > 0) then
    sgENAdditionalAgreement.RowCount := sgENAdditionalAgreement.RowCount - 1;

  with sgENAdditionalAgreement do
    for i:=0 to list.totalCount - 1 do
      begin
        Application.ProcessMessages;
        LastRow := i + startPoint;
        if list.list[i].code <> Low(Integer) then
		  Cells[0, LastRow] := IntToStr(list.list[i].code)
        else
          Cells[0, LastRow] := '';

		Cells[1, LastRow] := list.list[i].numberGen;

        if list.list[i].dateGen = nil then
          Cells[2, LastRow] := ''
        else
          Cells[2, LastRow] := XSDate2String(list.list[i].dateGen);

        if list.list[i].sumWithoutVAT <> nil then begin
          Cells[3, LastRow] := list.list[i].sumWithoutVAT.DecimalString;
        end else begin
          Cells[3, LastRow] := '';
        end;

		if list.list[i].sumVAT <> nil then begin
          Cells[4, LastRow] := list.list[i].sumVAT.DecimalString;
        end else begin
          Cells[4, LastRow] := '';
        end;

		AddCheckBox(5, LastRow, (Assigned(list.list[i].calcSumsByCalculations) And list.list[i].calcSumsByCalculations.asBoolean), false);

		if (Assigned(list.list[i].isSigned) and list.list[i].isSigned.asBoolean) then begin
		  Cells[6, LastRow] := 'Підписано';
		end else begin
		  Cells[6, LastRow] := 'Чорнова';
		end;
      end;
   if reset then sgENAdditionalAgreement.Row := startPoint else sgENAdditionalAgreement.Row := startPoint - 1;
end;


procedure TfrmENServicesShiftEdit.actUpdateAdditionalAgreementsExecute(
  Sender: TObject);
begin
  Self.updateAdditionalAgreements;
end;

procedure TfrmENServicesShiftEdit.actUpdateBillExecute(Sender: TObject);
begin
updateBills;
end;

procedure TfrmENServicesShiftEdit.updateCAI(reset : Boolean = true);
var
  TempENServices2CalcAdditionalItems: ENServices2CalcAdditionalItemsControllerSoapPort;
  i : Integer;
  ENServices2CalcAdditionalItemsList: ENServices2CalcAdditionalItemsShortList;
  CAIFilter :  ENServices2CalcAdditionalItemsFilter;
  pageNum, startPoint, LastRow : Integer;
begin

  if reset then begin
    sgENServices2CalcAdditionalItems.Clear;
    sgENServices2CalcAdditionalItems.RowCount := 2;
    SetGridHeaders(ENServices2CalcAdditionalItemsHeaders, sgENServices2CalcAdditionalItems.ColumnHeaders);
    pageNum := 0;
    startPoint := 1;
  end else begin
    pageNum := Trunc(sgENServices2CalcAdditionalItems.RowCount / PAGE_SIZE);
    startPoint := sgENServices2CalcAdditionalItems.RowCount;
    if (sgENServices2CalcAdditionalItems.RowCount - 1) Mod PAGE_SIZE <> 0 then Exit;
    if (sgENServices2CalcAdditionalItems.TopRow + sgENServices2CalcAdditionalItems.VisibleRowCount) < pageNum * PAGE_SIZE then Exit;
  end;

  TempENServices2CalcAdditionalItems :=  HTTPRIOENServices2CalcAdditionalItems as ENServices2CalcAdditionalItemsControllerSoapPort;

     CAIFilter := ENServices2CalcAdditionalItemsFilter.Create;
     SetNullIntProps(CAIFilter);
     SetNullXSProps(CAIFilter);
     CAIFilter.servicesObjectRef := ENServicesObjectRef.Create;
     CAIFilter.servicesObjectRef.code := ENServicesShiftObj.code;


  ENServices2CalcAdditionalItemsList := TempENServices2CalcAdditionalItems.getScrollableFilteredList(CAIFilter, pageNum * PAGE_SIZE, PAGE_SIZE);
  sgENServices2CalcAdditionalItems.RowCount := sgENServices2CalcAdditionalItems.RowCount + ENServices2CalcAdditionalItemsList.totalCount;
  if (reset) and (ENServices2CalcAdditionalItemsList.totalCount > 0) then
    sgENServices2CalcAdditionalItems.RowCount := sgENServices2CalcAdditionalItems.RowCount - 1;

   with sgENServices2CalcAdditionalItems do
    for i:=0 to ENServices2CalcAdditionalItemsList.totalCount - 1 do
      begin
        Application.ProcessMessages;
        LastRow := i + startPoint;
        if ENServices2CalcAdditionalItemsList.list[i].code <> Low(Integer) then
        Cells[0, LastRow] := IntToStr(ENServices2CalcAdditionalItemsList.list[i].code)
        else
        Cells[0, LastRow] := '';

        Cells[1, LastRow] := ENServices2CalcAdditionalItemsList.list[i].calcAdditionalItemTypeRefName;

        if ENServices2CalcAdditionalItemsList.list[i].summa = nil then
          Cells[2, LastRow] := ''
        else
          Cells[2, LastRow] := ENServices2CalcAdditionalItemsList.list[i].summa.DecimalString;
        if ENServices2CalcAdditionalItemsList.list[i].countgen = nil then
          Cells[3, LastRow] := ''
        else
          Cells[3, LastRow] := ENServices2CalcAdditionalItemsList.list[i].countgen.DecimalString;
        Cells[4, LastRow] := ENServices2CalcAdditionalItemsList.list[i].comment;
      end;
    if reset then sgENServices2CalcAdditionalItems.Row := startPoint else sgENServices2CalcAdditionalItems.Row := startPoint - 1;

end;

procedure TfrmENServicesShiftEdit.actUpdateCAIExecute(Sender: TObject);
begin
  Self.updateCAI;
end;


procedure TfrmENServicesShiftEdit.actUpdateENActExecute(Sender: TObject);
begin
  if pcActs.ActivePage = tsENAct then begin
    Self.updateENAct(Sender, false, sgENAct);
  end else if pcActs.ActivePage = tsENActSubContract then begin
    Self.updateENAct(Sender, true, sgENActSubContract);
  end else if pcActs.ActivePage = tsRQFKOrder then begin
    Self.updateRQFKOrder;
  end;
end;

procedure TfrmENServicesShiftEdit.actUpdateENServicesCostExecute(
  Sender: TObject);
begin
  inherited;
  Self.updateENServicesCost;
end;

procedure TfrmENServicesShiftEdit.actUpdateExecute(Sender: TObject);
begin
  Self.updatePlans;
end;

procedure TfrmENServicesShiftEdit.actUpdateIncomeExecute(Sender: TObject);
begin
  inherited;
  pcCalculationChange(Self);
end;

procedure TfrmENServicesShiftEdit.pcActsChange(Sender: TObject);
begin
  inherited;
  if (pcActs.ActivePage = tsENAct) or (pcActs.ActivePage = tsENActSubContract) then begin
    actFilter := nil;
    HideActions([actEditAct], False);
    DisableActions([actEditAct], False);
  end else if pcActs.ActivePage = tsRQFKOrder then begin
    HideActions([actEditAct]);
    DisableActions([actEditAct]);
  end;
  actUpdateENActExecute(Sender);
end;

procedure TfrmENServicesShiftEdit.updateRQFKOrder(reset : Boolean = true);
var
  TempRQFKOrder: RQFKOrderControllerSoapPort;
  i, LastRow, pageNum, startPoint : Integer;
  RQFKOrderList: RQFKOrderShortList;
  FKOrderFilter : RQFKOrderFilter;
  temp : RQFKOrderController.ArrayOfInteger;
  fkOrderCodes : TList<Integer>;
begin

  if reset then begin
    sgRQFKOrder.RowCount := 2;
    sgRQFKOrder.Clear;
    SetGridHeaders(RQFKOrderHeaders, sgRQFKOrder.ColumnHeaders);
    ShowRQFKOrder.prepareRQFKOrderGridHeadersForServicesFromSide(sgRQFKOrder);
    pageNum := 0;
    startPoint := 1;
  end else begin
    pageNum := Trunc(sgRQFKOrder.RowCount / PAGE_SIZE);
    startPoint := sgRQFKOrder.RowCount;
    if (sgRQFKOrder.RowCount - 1) Mod PAGE_SIZE <> 0 then begin
      Exit;
    end;
    if (sgRQFKOrder.TopRow + sgRQFKOrder.VisibleRowCount) < pageNum * PAGE_SIZE then Exit;
  end;

  fkOrderCodes := TList<Integer>.Create;

  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

  FKOrderFilter := RQFKOrderFilter.Create;
  SetNullIntProps(FKOrderFilter);
  SetNullXSProps(FKOrderFilter);
  FKOrderFilter.orderBySQL := 'RQFKORDER.DATEGEN DESC';

  FKOrderFilter.kind := RQFKOrderKind.Create;
  FKOrderFilter.kind.code := RQFKORDER_KIND_SERVICES_FROM_SIDE;
  FKOrderFilter.conditionSQL := Format( 'RQFKORDER.CODE IN (select sofo.fkorderrefcode  ' +
         'from enservicesbjct2rqfkrdr as sofo  ' +
         'where sofo.servicesobjectrefcode = %d ' +
         ' ' +
         'union ' +
         ' ' +
         'select fopl.fkordercode from rqfkorder2planfact as fopl ' +
         'inner join enservices2plan as sopl on fopl.factcode = sopl.planrefcode ' +
         'where sopl.servicesobjectrefcode = %d ' +
         ' ' +
         'union ' +
         ' ' +
         'select fopl.fkordercode from rqfkorder2planfact as fopl ' +
         'inner join enplanwork as pw on fopl.factcode = pw.code ' +
         'where ' +
         'pw.elementrefcode = %d)'
, [ENServicesShiftObj.code, ENServicesShiftObj.code, ENServicesShiftObj.element.code]);

  temp := TempRQFKOrder.getScrollableFilteredCodeArray(FKOrderFilter, pageNum * PAGE_SIZE, PAGE_SIZE);

  if Length(temp) = 0 then Exit;
  for i in temp do fkOrderCodes.add(i);

  FKOrderFilter.conditionSQL := Format(' RQFKORDER.CODE IN (%s)'
    , [BaseUtils.listOfIntegers2String(fkOrderCodes, ',')]);

  RQFKOrderList := TempRQFKOrder.getScrollableFilteredList(FKOrderFilter,0,-1);

  sgRQFKOrder.RowCount := sgRQFKOrder.RowCount + RQFKOrderList.totalCount;
  if (reset) and (RQFKOrderList.totalCount > 0) then
    sgRQFKOrder.RowCount := sgRQFKOrder.RowCount - 1;

   with sgRQFKOrder do
    for i:=0 to RQFKOrderList.totalCount - 1 do
      begin
        Application.ProcessMessages;
        LastRow := i + startPoint;
        if RQFKOrderList.list[i].code <> Low(Integer) then
        Cells[0, LastRow] := IntToStr(RQFKOrderList.list[i].code)
        else
        Cells[0, LastRow] := '';
        Cells[1, LastRow] := RQFKOrderList.list[i].numberDoc;
        if RQFKOrderList.list[i].dateGen = nil then
          Cells[2, LastRow] := ''
        else
          Cells[2, LastRow] := XSDate2String(RQFKOrderList.list[i].dateGen);

        if RQFKOrderFilter(FKOrderFilter).kind.code in [RQFKORDER_KIND_PRIHOD_POSTAVKA, RQFKORDER_KIND_PRIHOD_BUFET, RQFKORDER_KIND_SERVICES_FROM_SIDE] then
          Cells[3, LastRow] := RQFKOrderList.list[i].orgOkpo
        else
          Cells[3, LastRow] := RQFKOrderList.list[i].molInCode;

        if RQFKOrderFilter(FKOrderFilter).kind.code in [RQFKORDER_KIND_PRIHOD_POSTAVKA, RQFKORDER_KIND_PRIHOD_BUFET, RQFKORDER_KIND_SERVICES_FROM_SIDE] then
          Cells[4, LastRow] := RQFKOrderList.list[i].orgName
        else
          Cells[4, LastRow] := RQFKOrderList.list[i].molInName;

        if RQFKOrderFilter(FKOrderFilter).kind.code in [RQFKORDER_KIND_SERVICES_FROM_SIDE] then
          Cells[5, LastRow] := RQFKOrderList.list[i].sumWithoutNds.DecimalString
        else
          Cells[5, LastRow] := RQFKOrderList.list[i].molOutCode;

        Cells[6, LastRow] := RQFKOrderList.list[i].molOutName;
        Cells[7, LastRow] := RQFKOrderList.list[i].statusName;
        Cells[8, LastRow] := RQFKOrderList.list[i].expeditorCode;
        Cells[9, LastRow] := RQFKOrderList.list[i].expeditorName;

        Cells[10, LastRow] := RQFKOrderList.list[i].warrantNumber;
        if RQFKOrderList.list[i].warrantDate = nil then
          Cells[11, LastRow] := ''
        else
          Cells[11, LastRow] := XSDate2String(RQFKOrderList.list[i].warrantDate);
        Cells[12, LastRow] := RQFKOrderList.list[i].warrantFIO;

        Cells[13, LastRow] := RQFKOrderList.list[i].userAdd;
        if RQFKOrderList.list[i].dateAdd = nil then
          Cells[14, LastRow] := ''
        else
          Cells[14, LastRow] := XSDateTimeWithDate2String(RQFKOrderList.list[i].dateAdd);

        Cells[15, LastRow] := RQFKOrderList.list[i].userGen;
        if RQFKOrderList.list[i].dateEdit = nil then
          Cells[16, LastRow] := ''
        else
          Cells[16, LastRow] := XSDateTimeWithDate2String(RQFKOrderList.list[i].dateEdit);

      end;
      if reset then sgRQFKOrder.Row := startPoint else sgRQFKOrder.Row := startPoint - 1;

end;

procedure TfrmENServicesShiftEdit.pcCalculationChange(
  Sender: TObject);
var
  TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
  planItemFilter: ENPlanWorkItemFilter;
  i,LastCountM: Integer;
  ENPlanWorkItemList: ENPlanWorkItemShortList;
  vNormOfTime, vCountGen: Double;
  /////
  TempENPlanWork2ClassificationType: ENPlanWork2ClassificationTypeControllerSoapPort;
  plan2ctFilter: ENPlanWork2ClassificationTypeFilter;
  LastCount, LastRow: Integer;
  ENPlanWork2ClassificationTypeList: ENPlanWork2ClassificationTypeShortList;
  /////
  TempENAct: ENActControllerSoapPort;
  actFilter: ENActFilter;
  ENActList: ENActShortList;
  actDate: String;

  TempENEstimateItem : ENEstimateItemControllerSoapPort;
  estimateItemFilter : ENEstimateItemFilter;
  ENEstimateItemList : ENEstimateItemShortList;

  TempENActIncomeTechConditions : ENActIncomeTechConditionsControllerSoapPort;
begin
  if pcCalculation.ActivePage = tsPlans then
    Self.actUpdateExecute(Sender);

  if pcCalculation.ActivePage = tsActs then
  begin
    pcActs.ActivePage := tsENAct;
    pcActs.OnChange(Sender);
    updateAct(Sender);
  end;

  //SUPP-5060
  if pcCalculation.ActivePage = tsPayment then
  begin
    Self.actUpdateBillExecute(Sender);
    updatePayments(sender);
    updateProvs(Sender);
  end;

  if pcCalculation.ActivePage = tsENServicesCost then
    Self.updateENServicesCost;

  if pcCalculation.ActivePage = tsCalcAdditionalItems then
    actUpdateCAIExecute(Sender);

  if pcCalculation.ActivePage = tsAdditionalAgreements then
    actUpdateAdditionalAgreementsExecute(Sender);
  if pcCalculation.ActivePage = tsActContragentMaterialsTransfer then
    actActCustomerMaterialsTransferUpdateExecute(Sender);
end;

procedure TfrmENServicesShiftEdit.FormCreate(Sender: TObject);
begin
  inherited;
  planCode := LOW_INT;
  checkWarrant := true;
  isNotCalculated := True;
  planFilter := nil;
  actFilter := nil;
end;


procedure TfrmENServicesShiftEdit.SetFormCaption(elementCode: Integer);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
    servicesObj: ENServicesObject;
    servicesObjFilter: ENServicesObjectFilter;
    servicesObjList: ENServicesObjectShortList;
begin
  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  servicesObjFilter := ENServicesObjectFilter.Create;
  SetNullIntProps(servicesObjFilter);
  SetNullXSProps(servicesObjFilter);
  servicesObjFilter.element := ENElement.Create;
  servicesObjFilter.element.code := elementCode;

  servicesObjList := TempENServicesObject.getEasyShortList(servicesObjFilter, 0, -1);
  if servicesObjList.totalCount > 0 then
    if servicesObjList.list[0].contractNumberServices <> '' then
    begin
      edtContractNumberServices.Text := servicesObjList.list[0].contractNumberServices;

      Self.Caption := 'Договір на виконання робіт № ' + servicesObjList.list[0].contractNumberServices;

      contNumServ := servicesObjList.list[0].contractNumberServices;
      if servicesObjList.list[0].contractDateServices <> nil then
      begin
        Self.Caption := Self.Caption + ' від ' + XSDate2String(servicesObjList.list[0].contractDateServices);
        edtContractDateServices.DateTime := EncodeDate(servicesObjList.list[0].contractDateServices.Year,
                                                       servicesObjList.list[0].contractDateServices.Month,
                                                       servicesObjList.list[0].contractDateServices.Day);
      end;
    end;
end;

 
procedure TfrmENServicesShiftEdit.btnPrintContract4AccessClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  if ENServicesShiftObj = nil then Exit;
  if ENServicesShiftObj.contractTypeRef = nil then Exit;
  if ENServicesShiftObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesShiftObj.calcTypeRef = nil then Exit;
  if ENServicesShiftObj.calcTypeRef.code = LOW_INT then Exit;
  if ENServicesShiftObj.contractStatusRef = nil then Exit;

  if ENServicesShiftObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'soCode';
    args[0] := IntToStr(ENServicesShiftObj.code);

    reportName := 'Services/4Rent/d_access';

    makeReport(reportName, argNames, args, 'pdf');

end;

procedure TfrmENServicesShiftEdit.btnPrintContract4AgreeClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  if ENServicesShiftObj = nil then Exit;
  if ENServicesShiftObj.contractTypeRef = nil then Exit;
  if ENServicesShiftObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesShiftObj.calcTypeRef = nil then Exit;
  if ENServicesShiftObj.calcTypeRef.code = LOW_INT then Exit;
  if ENServicesShiftObj.contractStatusRef = nil then Exit;

  if ENServicesShiftObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'soCode';
    args[0] := IntToStr(ENServicesShiftObj.code);

    reportName := 'Services/4Rent/d_agree';

    makeReport(reportName, argNames, args, 'pdf');

end;

procedure TfrmENServicesShiftEdit.btnPrintContract4RecoveryClick(
  Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  if ENServicesShiftObj = nil then Exit;
  if ENServicesShiftObj.contractTypeRef = nil then Exit;
  if ENServicesShiftObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesShiftObj.calcTypeRef = nil then Exit;
  if ENServicesShiftObj.calcTypeRef.code = LOW_INT then Exit;
  if ENServicesShiftObj.contractStatusRef = nil then Exit;

  if ENServicesShiftObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'soCode';
    args[0] := IntToStr(ENServicesShiftObj.code);

    reportName := 'Services/4Rent/d_recovery';

    makeReport(reportName, argNames, args, 'pdf');

end;


procedure TfrmENServicesShiftEdit.btnPrintContract4RentClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
begin
  inherited;
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'soCode';
  args[0] := IntToStr(ENServicesShiftObj.code);

  reportName := 'Services/4Shift/agree';
  makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmENServicesShiftEdit.btnPrintActClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
  copystr: String;
begin
  inherited;
  if ENServicesShiftObj = nil then Exit;
  if ENServicesShiftObj.contractTypeRef = nil then Exit;
  if ENServicesShiftObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesShiftObj.calcTypeRef = nil then Exit;
  if ENServicesShiftObj.calcTypeRef.code = LOW_INT then Exit;

  /////
  if ENServicesShiftObj.contractStatusRef = nil then Exit;
  if ENServicesShiftObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'soCode';
  args[0] := IntToStr(ENServicesShiftObj.code);

  reportName := '201109/ActDomikiServices/Act21';
  makeReport(reportName , argNames , args , 'pdf');
end;


procedure TfrmENServicesShiftEdit.btnPrintActTechAgreementClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
begin
  inherited;
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'servicesObjectCode';
  args[0] := IntToStr(ENServicesShiftObj.code);

  reportName := 'TechConditions/TechAgreement/act';
  makeReport(reportName, argNames, args, 'pdf');
end;


procedure TfrmENServicesShiftEdit.spbWarrantNumberClick(
  Sender: TObject);
var frmENWarrantShow : TfrmENWarrantShow;
    f : ENWarrantFilter;
    warrant : ENWarrant;
    datContract, datWarrant : TXSDate;
    dtdatContract, dtdatWarrant : TDateTime;
    power: Double;
begin
    power := 0;

    if power <= 5 then
    begin
      if ENServicesShiftObj.department = nil then
      begin
        Application.MessageBox(PChar('Спочатку оберіть підрозділ!'), PChar('Увага !'), MB_ICONWARNING);
        edtENDepartmentDepartmentName.SetFocus;
        Exit;
      end;

      if ENServicesShiftObj.department.code = LOW_INT then
      begin
        Application.MessageBox(PChar('Спочатку оберіть підрозділ!'), PChar('Увага !'), MB_ICONWARNING);
        edtENDepartmentDepartmentName.SetFocus;
        Exit;
      end;
    end;

    datContract := TXSDate.Create;
    datWarrant := TXSDate.Create;

     f := ENWarrantFilter.Create();
     SetNullXSProps(f);
     SetNullIntProps(f);

     // Если мощность до 5 кВт включительно (т.е. РЭСовские ТУ), фильтруем по подразделению
     if power <= 5 then
     begin
       f.departmentRef := ENDepartmentRef.Create();
       f.departmentRef.code := ENServicesShiftObj.department.code;

       // Все юр. лица ХГЭС, независимо от мощности - договора проходят через Облэнерго!!!
       {
       if (rgContragentType.ItemIndex + 1 = ENTECHCONTRAGENT_TYPE_JURIDICAL) and
          (ENTechConditionsServicesObj.department.code = ENDEPARTMENT_HGES) then
       begin
         f.departmentRef.code := ENDEPARTMENT_KSOE;
       end;
       }
       if (rgContragentType.ItemIndex in [ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET,
                                          ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NONBUDGET,
                                          ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL_NOREZIDENT,
                                          ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NOREZIDENT]) and
          (ENServicesShiftObj.department.code = ENDEPARTMENT_HGES) then
       begin
         f.departmentRef.code := ENDEPARTMENT_KSOE;
       end;
     end;

     //f.conditionSQL := ' warrantstatusrefcode = 0';
     f.conditionSQL := ' warrantstatusrefcode = 0 and power >= ' + FloatToStr(power);

     frmENWarrantShow := TfrmENWarrantShow.Create(Application,fmNormal, f);
     DisableActions([frmENWarrantShow.actNoFilter]);

     try
        with frmENWarrantShow do
          if ShowModal = mrOk then
          begin
              try

                 ENServicesShiftObj.warrantRef := ENWarrantRef.Create();
                 ENServicesShiftObj.warrantRef.code := StrToInt(GetReturnValue(sgENWarrant,0));

                  //////////////////////////////////////////////////////
                  ///   проверка даты доверенности с датой договора  ///
                  ///     суммы в доверенности с суммой договора     ///
                  //////////////////////////////////////////////////////

                  if ENServicesShiftObj.warrantRef.code <> LOW_INT then
                  begin
                    warrant := DMReports.getWarrantByCode(ENServicesShiftObj.warrantRef.code);

                    datContract.XSToNative(GetXSDate(Self.edtContractDateServices.DateTime));
                    dtdatContract := EncodeDate(datContract.Year, datContract.Month, datContract.Day);
                    dtdatWarrant := EncodeDate(warrant.dateFinal.Year, warrant.dateFinal.Month, warrant.dateFinal.Day);

                    if (warrant.warrantStatusRef.code = WARRANT_INVALID) then
                    begin
                      Application.MessageBox(PChar('Довіреність недійсна!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                        edtWarrantNumber.Text := '';
                        edtWarrantFIO.Text := '';
                        ENServicesShiftObj.warrantRef.code := LOW_INT;
                      Exit;
                    end;

                    if (dtdatContract > dtdatWarrant) then
                    begin
                      Application.MessageBox(PChar('Термін дії довіреності закінчився!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                        edtWarrantNumber.Text := '';
                        edtWarrantFIO.Text := '';
                        ENServicesShiftObj.warrantRef.code := LOW_INT;
                      Exit;
                    end;

                  end;

                  edtWarrantNumber.Text := GetReturnValue(sgENWarrant,1);
                  edtWarrantFIO.Text := GetReturnValue(sgENWarrant,3);

              except
                 on EConvertError do Exit;
              end;
          end;
     finally
        frmENWarrantShow.Free;
     end;

end;


procedure TfrmENServicesShiftEdit.tbAdditionalAgreementViewClick(
  Sender: TObject);
begin
  inherited;
  openSelectedAdditionalAgreement(dsView);
end;

function TfrmENServicesShiftEdit.getSelectedActCustomerMaterialsTransfer : RQFKOrder;
var
  TempRQFKOrder : RQFKorderControllerSoapPort;
  fkOrder : RQFKOrder;
  grid : TAdvStringGrid;
begin
  grid := sgActCustomerMaterialsTransfer;
  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  try
    fkOrder := TempRQFKOrder.getObjectNoSegr(StrToInt(grid.Cells[0, grid.Row]));
  except
    on EConvertError do fkOrder := nil;
  end;
  Result := fkOrder;
end;




procedure TfrmENServicesShiftEdit.actViewActExecute(Sender: TObject);
Var TempENAct: ENActControllerSoapPort;
TempRQFKOrder : RQFKorderControllerSoapPort;
grid : TAdvStringGrid;
begin
   if (pcActs.ActivePage = tsENAct) or (pcActs.ActivePage = tsENActSubContract) then begin
      if pcActs.ActivePage = tsENAct then grid := sgENAct else grid := sgENActSubContract;

       TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

       frmENActEdit := TfrmENActEdit.Create(Application, dsView);
       try
         try
           frmENActEdit.ENActObj := TempENAct.getObject(StrToInt(grid.Cells[0, grid.Row]));
         except
           on EConvertError do Exit;
         end;

         if frmENActEdit.ShowModal in [mrOk, mrYes] then
         begin
           actUpdateENActExecute(Sender);
         end;
       finally
         frmENActEdit.Free;
         frmENActEdit:=nil;
       end;

   end else if pcActs.ActivePage = tsRQFKOrder then begin
      TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
      frmRQFKOrderEdit := TfrmRQFKOrderEdit.Create(Application, dsView);

      try
        try
          frmRQFKOrderEdit.RQFKOrderObj := TempRQFKOrder.getObjectNoSegr(StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]));
        except
          on EConvertError do Exit;
        end;

        frmRQFKOrderEdit.ShowModal;
      finally
        frmRQFKOrderEdit.Free;
        frmRQFKOrderEdit := nil;
      end;
   end;


end;

procedure TfrmENServicesShiftEdit.actViewCAIExecute(Sender: TObject);
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


procedure TfrmENServicesShiftEdit.actViewENActIncomeExecute(
  Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  ///// 14.05.13 NET-4235
  // Печать акта приема-передачи - только при статусах "Работы выполнены" и "Оплаченный" (для НОВЫХ договоров)
  if ENServicesShiftObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT then
    if (ENServicesShiftObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_COMPLETED) and
       (ENServicesShiftObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_PAID) then
      raise Exception.Create('NET-4235 Для друку акту прийому-передачі договір повинен мати статус "Роботи виконані" або "Сплачений"!');
  /////

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'ContractCode';
  args[0] := IntToStr(ENServicesShiftObj.code);

  if ENServicesShiftObj.calcTypeRef.code <> ENSERVICESOBJECT_CALCTYPE_BY_FACT then
    reportName := '201109/ActCalcAdditionalWorkG/ActPriPer'
  else
    reportName := '201109/ActCalcAdditionalWorkG/ActPriPer2';

  makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmENServicesShiftEdit.actViewENServicesCostExecute(Sender: TObject);
begin
  inherited;
  Self.openENServicesCostEditForm(TDialogState.dsView);
end;

procedure TfrmENServicesShiftEdit.actViewIncomeExecute(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
  TempENActIncomeServices: ENActIncomeServicesControllerSoapPort;
begin
  inherited;

  // метод формирования доходгого акта
  if (ENServicesShiftObj.actIncomeCreatMetodRef.code = ENACTINCOME_CREAT_METOD_MORE_ONE) then
  begin
    TempENActIncomeServices := HTTPRIOENActIncomeServices as ENActIncomeServicesControllerSoapPort;
    try
      ENActIncomeServicesObj := TempENActIncomeServices.getObject(StrToInt(sgENActIncomeServices.Cells[0,sgENActIncomeServices.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENActIncomeServicesEdit := TfrmENActIncomeServicesEdit.Create(Application, dsView);
    try
      frmENActIncomeServicesEdit.ShowModal;
    finally
      frmENActIncomeServicesEdit.Free;
      frmENActIncomeServicesEdit := nil;
    end;

    updateActIncome;

  end else begin
	  ///// 14.05.13 NET-4235
	  // Печать акта приема-передачи - только при статусах "Работы выполнены" и "Оплаченный" (для НОВЫХ договоров)
	  if ENServicesShiftObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT then
		if (ENServicesShiftObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_COMPLETED) and
		   (ENServicesShiftObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_PAID) then
		  raise Exception.Create('NET-4235 Для друку акту прийому-передачі договір повинен мати статус "Роботи виконані" або "Сплачений"!');
	  /////

	  SetLength(argNames, 1);
	  SetLength(args, 1);

	  argNames[0] := 'ContractCode';
	  args[0] := IntToStr(ENServicesShiftObj.code);

	  if ENServicesShiftObj.calcTypeRef.code <> ENSERVICESOBJECT_CALCTYPE_BY_FACT then
		reportName := '201109/ActCalcAdditionalWorkG/ActPriPer'
	  else
		reportName := '201109/ActCalcAdditionalWorkG/ActPriPer2';

	  makeReport(reportName, argNames, args, 'pdf');  
  end;
end;

procedure TfrmENServicesShiftEdit.actPreConfirmExecute(Sender: TObject);
var
  planCode : Integer;
  TempENPlanWork : ENPlanWorkControllerSoapPort;
begin
  inherited;

  try
    planCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте відправити план на ЗАТВЕРДЖЕННЯ ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    TempENPlanWork.preConfirm(planCode);

    Application.MessageBox(PChar('План відправлено ...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    actUpdateExecute(Sender);
  end;
end;


procedure TfrmENServicesShiftEdit.actPrintAdditionalItemsExecute(
  Sender: TObject);
var
REPORT_TYPE : Integer;
argNames, args : ArrayOfString;
reportName : String;
begin

  REPORT_TYPE := 3;

   SetLength(argNames, 3);
   SetLength(args, 3);

   argNames[0] := 'servicesObjectCode';
   argNames[1] := 'reportType';

   args[0] := IntToStr(ENServicesShiftObj.code);
   args[1] := IntToStr(REPORT_TYPE);

  reportName := '201109/ActCalcAdditionalWorkG/ActCalc_Additional_Items';

  makeReport(reportName , argNames , args , 'xls');
end;


procedure TfrmENServicesShiftEdit.actPrintBillExecute(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
    copystr: String;
    billCode : Integer;
begin
  if ENServicesShiftObj = nil then Exit;
  if ENServicesShiftObj.contractTypeRef = nil then Exit;
  if ENServicesShiftObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesShiftObj.calcTypeRef = nil then Exit;
  if ENServicesShiftObj.calcTypeRef.code = LOW_INT then Exit;

  try
     billCode := StrToInt(sgENSOBill.Cells[0,sgENSOBill.Row]);
     except
     on EConvertError do Exit;
     end;

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'billCode';
    args[0] := IntToStr(billCode);

    reportName := 'Services/4Shift/customBill';
    makeReport(reportName , argNames , args , 'pdf');

end;

procedure TfrmENServicesShiftEdit.actPrintCalculationExecute(Sender: TObject);
var
REPORT_TYPE, item : Integer;
selected : TList<Integer>;
selectedServicesCostCodes : TList<Integer>;
servicesCost : ENServicesCost;
calcCost : TKCalcCost;
argNames, args : ArrayOfString;
reportName : String;
TempTKClassificationType : TKClassificationTypeControllerSoapPort;
TempTKCalcCost : TKCalcCostControllerSoapPort;
TempENServicesCost : ENServicesCostControllerSoapPort;
classification : TKClassificationType;
begin

  REPORT_TYPE := 3;

   SetLength(argNames, 3);
   SetLength(args, 3);

   selectedServicesCostCodes := TList<Integer>.Create;

   selected := BaseUtils.getCheckedIndexes(Self.sgENServicesCost, 1);

  if(selected.Count = 0) then begin
	if (sgENServicesCost.Row > 0)
    and (sgENServicesCost.Row < sgENServicesCost.RowCount) then begin
		selected.Add(sgENServicesCost.Row);
	end;
  end;
  if (selected.Count = 0) then begin
		Exit;
  end;

  for item in selected do selectedServicesCostCodes.add(StrToInt(sgENServicesCost.Cells[0, item]));

   TempTKClassificationType := HTTPRIOTKClassificationType as TKClassificationTypeControllerSoapPort;
   TempTKCalcCost := HTTPRIOTKCalcCost as TKCalcCostControllerSoapPort;
   TempENServicesCost := HTTPRIOENServicesCost as ENServicesCostControllerSoapPort;

   servicesCost := TempENServicesCost.getObject(selectedServicesCostCodes[0]);
   calcCost := TempTKCalcCost.getObject(servicesCost.tkCalcCostRef.code);
   if(calcCost = nil) then begin
     Exit;
   end;
   classification := TempTKClassificationType.getObject(calcCost.classificationTypeRef.code);

   argNames[0] := 'servicesCostCodes';
   argNames[1] := 'reportType';

   args[0] := BaseUtils.listOfIntegers2String(selectedServicesCostCodes, ',');
   args[1] := IntToStr(REPORT_TYPE);

  if classification.isnotlicensedactivity = ISNOTLICENSEDACTIVITY_NKRE  then  // лицензированые работы НКРЕ
     reportName := '201109/ActCalcAdditionalWorkG_NKRE/ActCalc'
  else if classification.isnotlicensedactivity = ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT  then
     reportName := '201109/ActCalcAdditionalWorkG/ActCalc_notlicensed/ActCalc_notlicensed'
  else if ( (classification.isnotlicensedactivity <> ISNOTLICENSEDACTIVITY_NKRE) and (classification.isnotlicensedactivity <> ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT) ) then
     reportName := '201109/ActCalcAdditionalWorkG/ActCalc';

  makeReport(reportName , argNames , args , 'xls');
end;


procedure TfrmENServicesShiftEdit.actPrintCalculationNKREExecute(
  Sender: TObject);
var
REPORT_TYPE : Integer;
servicesCost : ENServicesCost;
calcCost : TKCalcCost;
argNames, args : ArrayOfString;
reportName : String;
transportFilter : TKTransportFilter;
transportList : TKTransportShortList;
transport : TKTransportShort;
TempTKTransport : TKTransportControllerSoapPort;
TempTKCalcCost : TKCalcCostControllerSoapPort;
begin

  REPORT_TYPE := 2;

   SetLength(argNames, 3);
   SetLength(args, 3);

   servicesCost := Self.getSelectedENServicesCost();
   
   TempTKCalcCost := HTTPRIOTKCalcCost as TKCalcCostControllerSoapPort;
   calcCost := TempTKCalcCost.getObject(servicesCost.tkCalcCostRef.code);
   if(calcCost = nil) then begin
     Exit;
   end;
   
   if(servicesCost = nil) then begin
	    Exit;
   end;

   argNames[0] := 'calcCostCode';
   argNames[1] := 'reportType';

   args[0] := IntToStr(calcCost.code);
   args[1] := IntToStr(REPORT_TYPE);

   if (Assigned(servicesCost) and Assigned(calcCost.calcKindRef) and (calcCost.calcKindRef.code = TKCALCKIND_NEW)) then begin
      reportName := 'Calculation/ActCalc_Form2_NKRE';
      makeReport(reportName , argNames , args , 'pdf');

      reportName := 'Calculation/ActCalc_Form1_NKRE_new';
      makeReport(reportName , argNames , args , 'pdf');
   end else begin

     if (Assigned(calcCost) and Assigned(calcCost.calcKindRef) and (calcCost.calcKindRef.code = TKCALCKIND_NEW2)) then begin
       reportName := 'Calculation/ActCalc_Form1_NKRE_new';
     end else begin
       reportName := 'Calculation/ActCalc_Form1_NKRE';
     end;
     makeReport(reportName , argNames , args , 'pdf');

     if (Assigned(calcCost) and Assigned(calcCost.calcKindRef) and (calcCost.calcKindRef.code = TKCALCKIND_NEW2)) then begin
       reportName := 'Calculation/ActCalc_Form2_NKRE';
     end else begin
       reportName := 'Calculation/ActCalc_Form4_NKRE';
     end;
     makeReport(reportName , argNames , args , 'pdf');



     transportFilter := TKTransportFilter.Create;
     SetNullXSProps(transportFilter);
     SetNulLIntProps(transportFilter);
     transportFilter.conditionSQL := ' exists (select 1 from tkcalctransport cct1 where cct1.transportrefcode = TKTRANSPORT.CODE and cct1.calccostrefcode = ' + IntToStr(calcCost.code) + ')';

     argNames[0] := 'calcCostCode';
     argNames[1] := 'transportCode';
     argNames[2] := 'reportType';

     args[0] := IntToStr(calcCost.code);
     args[2] := IntToStr(REPORT_TYPE);

     TempTKTransport := HTTPRIOTKTransport as TKTransportControllerSoapPort;
     transportList := TempTKTransport.getScrollableFilteredList(transportFilter, 0, -1);
     for transport in transportList.list do begin
        args[1] := IntToStr(transport.code);
        reportName := 'Calculation/ActCalc_Form1_Transport';
        makeReport(reportName , argNames , args , 'pdf');
        reportName := 'Calculation/ActCalc_Form1_TransportNoFuel';
        makeReport(reportName , argNames , args , 'pdf');
     end;
   end;
end;

{
  Возвращает true если счет был сделан из акта приема-передачи выполненных
  работ выполненных работ false - если счет не связан с актом и был сделан
  вручную
}
function checkIfSOBillWasCreatedByENActIncomeServices(
  TempENSOBillController : ENSOBillControllerSoapPort;
  soBillCode : Integer
) : Boolean;
var
  filter : ENSOBillFilter;
  arr : ENSOBillController.ArrayOfInteger;
begin
  if soBillCode <= 0 then begin
    raise Exception.Create('Помилка у параметрах: неправильний код рахунку');
  end;
  filter := ENSOBillFilter.Create;
  SetNullXSProps(filter);
  SetNullIntProps(filter);
  filter.code := soBillCode;
  filter.conditionSQL := 'EXISTS (SELECT 1 FROM enactincomeservcs2sbll AS q1 WHERE q1.sobillrefcode = ENSOBILL.CODE)';

  arr := TempENSOBillController.getScrollableFilteredCodeArray(filter, 0, 1);

  Result := Length(arr) > 0;
end;

procedure TfrmENServicesShiftEdit.actPrintIncome2Execute(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
  billCode : Integer;
  TempENSOBillController : ENSOBillControllerSoapPort;
  bill : ENSOBill;
begin

 try
     billCode := StrToInt(sgENSOBill.Cells[0,sgENSOBill.Row]);
     except
     on EConvertError do Exit;
     end;

     TempENSOBillController := HTTPRIOENSOBill as ENSOBillControllerSoapPort;

     if checkIfSOBillWasCreatedByENActIncomeServices(TempENSOBillController, billCode) then begin
       bill := TempENSOBillController.getObject(billCode);
       Application.MessageBox(PChar(Format('Рахунок від %s на суму %s грн. був створений автоматично із акту приймання-передачі' +
       ' виконаних робіт. Друк акту необхідно здійснювати із вкладки "Акти"!'
       , [XSDate2String(bill.dateGen), bill.sumTotal.decimalString]))
       , PChar('Увага')
       , MB_ICONWARNING);
       Exit;
     end;

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'billCode';
    args[0] := IntToStr(billCode);

    reportName := 'Services/4Shift/ActPriPer2';

  makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmENServicesShiftEdit.actPrintIncomeExecute(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
  actIncomeServicesCode : Integer;
begin

 try
     actIncomeServicesCode := StrToInt(sgENActIncomeServices.Cells[0, sgENActIncomeServices.Row]);
     except
     on EConvertError do Exit;
     end;

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'actIncomeServicesCode';
    args[0] := IntToStr(actIncomeServicesCode);

    reportName := 'Services/4Shift/ActPriPer2';

  makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmENServicesShiftEdit.actPrintRemainingCostExecute(Sender: TObject);
var
REPORT_TYPE, item : Integer;
selected : TList<Integer>;
selectedServicesCostCodes : TList<Integer>;
servicesCost : ENServicesCost;
calcCost : TKCalcCost;
argNames, args : ArrayOfString;
reportName : String;
TempTKClassificationType : TKClassificationTypeControllerSoapPort;
TempTKCalcCost : TKCalcCostControllerSoapPort;
TempENServicesCost : ENServicesCostControllerSoapPort;
classification : TKClassificationType;
begin

  REPORT_TYPE := 3;

   SetLength(argNames, 3);
   SetLength(args, 3);

   selectedServicesCostCodes := TList<Integer>.Create;

   selected := BaseUtils.getCheckedIndexes(Self.sgENServicesCost, 1);

  if(selected.Count = 0) then begin
	if (sgENServicesCost.Row > 0)
    and (sgENServicesCost.Row < sgENServicesCost.RowCount) then begin
		selected.Add(sgENServicesCost.Row);
	end;
  end;
  if (selected.Count = 0) then begin
		Exit;
  end;

  for item in selected do selectedServicesCostCodes.add(StrToInt(sgENServicesCost.Cells[0, item]));

   TempTKClassificationType := HTTPRIOTKClassificationType as TKClassificationTypeControllerSoapPort;
   TempTKCalcCost := HTTPRIOTKCalcCost as TKCalcCostControllerSoapPort;
   TempENServicesCost := HTTPRIOENServicesCost as ENServicesCostControllerSoapPort;

   servicesCost := TempENServicesCost.getObject(selectedServicesCostCodes[0]);
   calcCost := TempTKCalcCost.getObject(servicesCost.tkCalcCostRef.code);
   if(calcCost = nil) then begin
     Exit;
   end;
   classification := TempTKClassificationType.getObject(calcCost.classificationTypeRef.code);

   argNames[0] := 'servicesCostCodes';
   argNames[1] := 'reportType';

   args[0] := BaseUtils.listOfIntegers2String(selectedServicesCostCodes, ',');
   args[1] := IntToStr(REPORT_TYPE);

  if classification.isnotlicensedactivity = ENConsts.ISNOTLICENSEDACTIVITY_NKRE  then  // лицензированые работы НКРЕ
     reportName := '201109/ActCalcAdditionalWorkG_NKRE/ActCalcOnlyRemainingcost'
  else if classification.isnotlicensedactivity = ENConsts.ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT  then
     reportName := '201109/ActCalcAdditionalWorkG/ActCalc_trt_ntlcd_so'
  else if ( (classification.isnotlicensedactivity <> ENConsts.ISNOTLICENSEDACTIVITY_NKRE) and (classification.isnotlicensedactivity <> ENConsts.ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT) ) then
     reportName := '201109/ActCalcAdditionalWorkG/ActCalcOnlyRemainingcost';

  makeReport(reportName , argNames , args , 'xls');
end;

procedure TfrmENServicesShiftEdit.actRemoveActExecute(Sender: TObject);
var
  TempENServicesObject : ENServicesObjectControllerSoapPort;
  TempRQFKOrder : RQFKOrderControllerSoapPort;
  TempENAct : ENActControllerSoapPort;
  TempENElement2Act : ENElement2ActControllerSoapPort;
  fkOrder : RQFKOrder;
  act : ENAct;
  ObjCode : Integer;
  isLink : TXSBoolean;
begin
  inherited;
  if pcActs.ActivePage = tsRQFKOrder Then begin
    isLink := TXSBoolean.Create;
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
    TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
    try
     ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
    except
     on EConvertError do Exit;
    end;
    fkOrder := TempRQFKOrder.getObjectNoSegr(ObjCode);

    if Application.MessageBox(PChar(Format('Ви дійсно бажаєте відмінити прив''язку ордеру № %s від %s від договору № %s ?'
        ,[fkOrder.numberDoc, XSDate2String(fkOrder.dateGen), ENServicesShiftObj.contractNumberServices])),
                      PChar('Увага!'),MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=IDYES then begin
      isLink.asBoolean := False;
        TempENServicesObject.linkWithRQFKOrder(ENServicesShiftObj.code, fkOrder.code, isLink);
      Self.updateRQFKOrder;
      Application.MessageBox(PChar(Format('Прив''язку ордеру № %s від %s до договору № %s відмінено!'
         , [fkOrder.numberDoc, XSDate2String(fkOrder.dateGen), ENServicesShiftObj.contractNumberServices]))
       , PChar('Повідомлення'), MB_ICONINFORMATION);
    end;
  end else begin
    if (pcActs.ActivePage = tsENAct) or (pcActs.ActivePage = tsENActSubContract) then begin
      TempENElement2Act := HTTPRIOENElement2Act as ENElement2ActControllerSoapPort;
      TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

      try
       if pcActs.ActivePage = tsENAct then begin
         ObjCode := StrToInt(sgENAct.Cells[0,sgENAct.Row]);
       end else begin
         ObjCode := StrToInt(sgENActSubContract.Cells[0,sgENActSubContract.Row]);
       end;
      except on EConvertError do Exit;
      end;

      act := TempENAct.getObject(ObjCode);

      if Application.MessageBox(PChar(Format('Ви дійсно бажаєте відмінити прив''язку акту № %s від %s від договору № %s ?'
        ,[act.numberGen, XSDate2String(act.dateAct), ENServicesShiftObj.contractNumberServices])),
                      PChar('Увага!'),MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=IDYES then begin

        TempENElement2Act.remove(ENServicesShiftObj.element.code, act.code, ENELEMENT2ACTTYPE_SERVICES_WORKS);
        Self.actUpdateENActExecute(Sender);
        Application.MessageBox(PChar(Format('Прив''язку акту № %s від %s до договору № %s відмінено!'
         , [act.numberGen, XSDate2String(act.dateAct), ENServicesShiftObj.contractNumberServices]))
       , PChar('Повідомлення'), MB_ICONINFORMATION);
      end;



    end else begin
      raise Exception.Create('Ошибка! Обратитесь к разработчикам!');
    end;

  end;
end;

procedure TfrmENServicesShiftEdit.actRemoveActFromActServicesExecute(
  Sender: TObject);
var
  TempENActIncomeServices: ENActIncomeServicesControllerSoapPort;
  actCode: Integer;
begin
  if pcActs.ActivePage <> tsENAct then Exit;

  try
    actCode := StrToInt(sgENAct.Cells[0, sgENAct.Row]);
  except
    on EConvertError do Exit;
  end;

  if actCode <= 0 then Exit;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити прив''язку обраного видаткового акту до договору?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;

  TempENActIncomeServices := HTTPRIOENActIncomeServices as ENActIncomeServicesControllerSoapPort;
  TempENActIncomeServices.removeActFromActIncomeServices(actCode);
  actUpdateENActExecute(Sender);
end;

procedure TfrmENServicesShiftEdit.actAdditionalAgreementDeleteExecute(
  Sender: TObject);
var
  TempENAdditionalAgreement : ENAdditionalAgreementControllerSoapPort;
  ObjCode : Integer;
begin
 TempENAdditionalAgreement := HTTPRIOENAdditionalAgreement as ENAdditionalAgreementControllerSoapPort;
   try
     ObjCode := StrToInt(sgENAdditionalAgreement.Cells[0,sgENAdditionalAgreement.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Додаткова угода для договорів послуг на сторону) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENAdditionalAgreement.remove(ObjCode);
      actUpdateAdditionalAgreementsExecute(Sender);
  end;
end;

procedure TfrmENServicesShiftEdit.actAdditionalAgreementEditExecute(
  Sender: TObject);
begin
  openSelectedAdditionalAgreement(dsEdit);
end;

procedure TfrmENServicesShiftEdit.actAdditionalAgreementInsertExecute(
  Sender: TObject);
begin
  ENAdditionalAgreementObj:=ENAdditionalAgreement.Create;
  SetNullIntProps(ENAdditionalAgreementObj);
  SetNullXSProps(ENAdditionalAgreementObj);
  ENAdditionalAgreementObj.servicesObjectRef := ENServicesObjectRef.Create;
  ENAdditionalAgreementObj.servicesObjectRef.code := ENServicesShiftObj.code;
  try
    frmENAdditionalAgreementEdit := TfrmENAdditionalAgreementEdit.Create(Application, dsInsert);
    try
      if frmENAdditionalAgreementEdit.ShowModal = mrOk then
      begin
        if ENAdditionalAgreementObj<>nil then
            actUpdateAdditionalAgreementsExecute(Sender);
      end;
    finally
      frmENAdditionalAgreementEdit.Free;
      frmENAdditionalAgreementEdit:=nil;
    end;
  finally
    ENAdditionalAgreementObj.Free;
  end;
end;

procedure TfrmENServicesShiftEdit.signOrUnsignAdditionalAgreement(isSign : Boolean);
var
  TempENAdditionalAgreement : ENAdditionalAgreementControllerSoapPort;
  ObjCode : Integer;
  additionalAgreement : ENAdditionalAgreement;
  strAction, strQuestion, msgResult : String;
begin
 TempENAdditionalAgreement := HTTPRIOENAdditionalAgreement as ENAdditionalAgreementControllerSoapPort;
   try
     ObjCode := StrToInt(sgENAdditionalAgreement.Cells[0,sgENAdditionalAgreement.Row]);
   except
   on EConvertError do Exit;
  end;
  additionalAgreement := TempENAdditionalAgreement.getObject(ObjCode);
  if isSign then begin
    msgResult := 'Угоду підписано!';
    strAction := 'підписати додаткову угоду';

  end else begin
    msgResult := 'Підписання відмінено!';
    strAction := 'відмінити підписання додаткової угоди';
  end;

  strQuestion := Format('Ви дійсно бажаєте %s № %s від %s?'
      , [strAction
      , additionalAgreement.numberGen
      , XSDate2String(additionalAgreement.dateGen)]);


  if Application.MessageBox(PChar(strQuestion),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENAdditionalAgreement.signOrUnsign(additionalAgreement, isSign);
      actUpdateAdditionalAgreementsExecute(nil);
      Application.MessageBox(PChar(msgResult), PChar('Повідомлення')
        , MB_ICONINFORMATION);
  end;
end;

procedure TfrmENServicesShiftEdit.actAdditionalAgreementSignExecute(
  Sender: TObject);
begin
  inherited;
  Self.signOrUnsignAdditionalAgreement(true);
end;

procedure TfrmENServicesShiftEdit.actAdditionalAgreementUnsignExecute(
  Sender: TObject);
begin
  inherited;
  Self.signOrUnsignAdditionalAgreement(false);
end;

procedure TfrmENServicesShiftEdit.openSelectedAdditionalAgreement(DialogState : TDialogState);
var
  TempENAdditionalAgreement: ENAdditionalAgreementControllerSoapPort;
begin
  TempENAdditionalAgreement := HTTPRIOENAdditionalAgreement as ENAdditionalAgreementControllerSoapPort;
  try
    ENAdditionalAgreementObj := TempENAdditionalAgreement.getObject(StrToInt(sgENAdditionalAgreement.Cells[0,sgENAdditionalAgreement.Row]));
  except
    on EConvertError do Exit;
  end;

  selectedRow := sgENAdditionalAgreement.Row;
  frmENAdditionalAgreementEdit:=TfrmENAdditionalAgreementEdit.Create(Application, DialogState);

  try
    if frmENAdditionalAgreementEdit.ShowModal= mrOk then
      begin
        actUpdateAdditionalAgreementsExecute(nil);
      end;
  finally
    frmENAdditionalAgreementEdit.Free;
    frmENAdditionalAgreementEdit:=nil;
  end;

  if sgENAdditionalAgreement.RowCount > selectedRow then
    sgENAdditionalAgreement.Row := selectedRow
  else
    sgENAdditionalAgreement.Row := sgENAdditionalAgreement.RowCount - 1;

end;


procedure TfrmENServicesShiftEdit.btnPostingsClick(Sender: TObject);
begin
  frmPostingsEdit := TfrmPostingsEdit.Create(Application, dsInsert);
  try
    frmPostingsEdit.servicesObjectCode := ENServicesShiftObj.code;
    frmPostingsEdit.servicesRelaxation := True;
    frmPostingsEdit.ShowModal;
  finally
    frmPostingsEdit.Free;
  end;

  pcCalculationChange(Sender);
end;

procedure TfrmENServicesShiftEdit.actAdditionalAgreementViewExecute(
  Sender: TObject);
begin
  openSelectedAdditionalAgreement(dsView);
end;


// сумма времени из техкарт котрые выбраны в калькуляции   
function TfrmENServicesShiftEdit.getSumTimeWorkForCalculation(codePlan : Integer):Double;
var
  i: Integer;
  TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
  ENPlanWorkItemList: ENPlanWorkItemShortList;
  TempENPlanWorkItemFilter:  ENPlanWorkItemFilter;
  sumTime:Double;
begin
  sumTime:= 0;
  TempENPlanWorkItem :=  HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
  TempENPlanWorkItemFilter := ENPlanWorkItemFilter.Create;
  SetNullIntProps(TempENPlanWorkItemFilter);
  SetNullXSProps(TempENPlanWorkItemFilter);
  TempENPlanWorkItemFilter.planRef := ENPlanWorkRef.Create;
  TempENPlanWorkItemFilter.planRef.code := codePlan;
  TempENPlanWorkItemFilter.conditionSQL := 'ENPLANWORKITEM.COUNTGEN <> 0';

  ENPlanWorkItemList := TempENPlanWorkItem.getScrollableFilteredList(TempENPlanWorkItemFilter,0,-1);



  for i:=0 to High(ENPlanWorkItemList.list) do
  begin
      sumTime:= sumTime +  StrToFloat( ENPlanWorkItemList.list[i].timeGen.decimalString);
  end;

     result := sumTime;
end;

procedure TfrmENServicesShiftEdit.showAccompanyingSheetJRXML(
  reportPath, strSigner, strSignerPost: String);
var
  argNames, args : ArrayOfString;
  reportName : String;
  argCnt: Integer;
begin


  if not Assigned(frmAccompanyingSheet) then
    frmAccompanyingSheet := TfrmAccompanyingSheet.Create(Owner);
  try
    frmAccompanyingSheet.mmoSigner.Text := strSigner;
    frmAccompanyingSheet.mmoSignerPost.Text := strSignerPost;
    if frmAccompanyingSheet.ShowModal = mrOk then
      begin
      argCnt := 5;

        SetLength(argNames, argCnt);
        SetLength(args, argCnt);

        argNames[0] := 'agreeCode';
        args[0] := IntToStr(ENServicesShiftObj.code);

        //if existPerformer then
        //  begin
             argNames[1] := 'performer';
             if frmAccompanyingSheet.mmoPerformer.Text <> '' then
               args[1] := 'Виконавець: ' +
                 frmAccompanyingSheet.mmoPerformer.Text
             else
               args[1] := '';
             argNames[2] := 'performerPhone';
             if frmAccompanyingSheet.mmoPerformerPhone.Text <> '' then
               args[2] := 'Телефон: ' +
                 frmAccompanyingSheet.mmoPerformerPhone.Text
             else
               args[2] := '';

             argNames[3] := 'signer';
             if frmAccompanyingSheet.mmoSigner.Text <> '' then
               args[3] := frmAccompanyingSheet.mmoSigner.Text
             else
               args[3] := '';

             argNames[4] := 'signerPost';
             if frmAccompanyingSheet.mmoSignerPost.Text <> '' then
               args[4] := frmAccompanyingSheet.mmoSignerPost.Text
             else
               args[4] := '';

        reportName := reportPath;
        makeReport(reportName, argNames, args, 'pdf');
      end; //if frmAccompanyingSheet.ShowModal = mrOk then
  finally
    frmAccompanyingSheet.Free;
    frmAccompanyingSheet := nil;
  end;
end;


procedure TfrmENServicesShiftEdit.MenuItem12Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML( //http://jira:8080/browse/SUPP-39916
    'Services/4Shift/accompanyingSheet3',
    'А.М. Тініченко', 'Директор виконавчий ' );
end;

procedure TfrmENServicesShiftEdit.MenuItem15Click(Sender: TObject);
begin
  inherited;
    showAccompanyingSheetJRXML( //http://jira:8080/browse/SUPP-39916
    'Services/4Shift/accompanyingSheet3',
    '', '' );
end;

function  TfrmENServicesShiftEdit.getSelectedENServicesCost : ENServicesCost;
var
  TempENServicesCost : ENServicesCostControllerSoapPort;
  servicesCost : ENServicesCost;
begin
    TempENServicesCost := HTTPRIOENServicesCost as ENServicesCostControllerSoapPort;
    try
      servicesCost := TempENServicesCost.getObject(StrToInt(sgENServicesCost.Cells[0,sgENServicesCost.Row]));
    except
      on EConvertError do servicesCost := nil;
    end;
    Result := servicesCost;
end;

procedure TfrmENServicesShiftEdit.N14Click(Sender: TObject);
begin
  inherited;
    showAccompanyingSheetJRXML( //http://jira:8080/browse/SUPP-39916
    'Services/4Shift/accompanyingSheet2',
    'А.М. Тініченко', 'Директор виконавчий ' );
end;

procedure TfrmENServicesShiftEdit.N17Click(Sender: TObject);
begin
  inherited;
  showAccompanyingSheetJRXML( //http://jira:8080/browse/SUPP-39916
    'Services/4Shift/accompanyingSheet2',
    '', ' ' );
end;

procedure TfrmENServicesShiftEdit.N22Click(Sender: TObject);
begin
  inherited;
    showAccompanyingSheetJRXML( //http://jira:8080/browse/SUPP-39916
    'Services/4Shift/accompanyingSheet1',
    'А.М. Тініченко', 'Директор виконавчий ' );
end;

procedure TfrmENServicesShiftEdit.chbCalcSumsByCalculationClick(
  Sender: TObject);
begin
  inherited;
  if chbCalcSumsByCalculation.Checked then begin
   DisableControls([edtContractServicesSumma, edtContractServicesSummaVAT], True);
   if DialogState = dsInsert then begin
     edtContractServicesSumma.Text := '';
     edtContractServicesSummaVAT.Text := '';
   end;
  end else begin
   DisableControls([edtContractServicesSumma, edtContractServicesSummaVAT], False);
  end;
end;

procedure TfrmENServicesShiftEdit.chbIsCustomerMaterialsClick(Sender: TObject);
begin
  if ((not Assigned(ENServicesShiftObj)) or (ENServicesShiftObj.code = Low(Integer))) then Exit;
  if not chbIsCustomerMaterials.Checked then begin
    tsActContragentMaterialsTransfer.TabVisible := False;
  end else begin
    tsActContragentMaterialsTransfer.TabVisible := True;
  end;

end;

procedure TfrmENServicesShiftEdit.edtContractServicesSummaChange(
  Sender: TObject);
var
 date : TDateTime;
begin
  inherited;
  date := Now();
  if edtContractDateServices.Checked then date := edtContractDateServices.DateTime;
  FinancialUtilsUnit.calculateVat(edtContractServicesSumma, edtContractServicesSummaVAT, date);

end;

procedure TfrmENServicesShiftEdit.N24Click(Sender: TObject);
begin
  inherited;
    showAccompanyingSheetJRXML( //http://jira:8080/browse/SUPP-39916
    'Services/4Shift/accompanyingSheet1',
    '', '' );
end;

procedure TfrmENServicesShiftEdit.cbbBasisTypeChange(Sender: TObject);
begin
    if cbbBasisType.ItemIndex <> 3 then
    begin
    DisableControls([edtWarrantContrAgentFIO , edtWarrantContrAgentNumber , edtWarrantContrAgentDate]);
    edtWarrantContrAgentNumber.Text := '';
    edtWarrantContrAgentFIO.Text:= '';
    edtWarrantContrAgentDate.Checked:= False;
//    edtWarrantContrAgentDate.DateTime :=

    end
    else
    DisableControls([edtWarrantContrAgentFIO , edtWarrantContrAgentNumber , edtWarrantContrAgentDate],false);

end;

procedure SetRQFKOrderShortToGrid(grid : TAdvStringGrid; var rowIndex : Integer; item : RQFKOrderShort);
begin
  with grid do begin
    if item.code <> Low(Integer) then Cells[0, rowIndex] := IntToStr(item.code);
    Cells[1, rowIndex] := item.numberDoc;
    if Assigned(item.dateGen) then Cells[2, rowIndex] := XSDate2String(item.dateGen);
    if Assigned(item.sumWithoutNds) then Cells[3, rowIndex] := item.sumWithoutNds.decimalString;
    Cells[4, rowIndex] := item.statusName;
  end;
  rowIndex := rowIndex + 1;
end;

procedure TfrmENServicesShiftEdit.updateActCustomerMaterialsTransfer(reset : Boolean = true);
var
  TempRQFKOrderController : RQFKOrderControllerSoapPort;
  list : RQFKOrderShortList;
  listItem : RQFKOrderShort;
  filter : RQFKOrderFilter;
  pageNum, startPoint, LastRow, i : Integer;
begin
  if not Assigned(ENServicesShiftObj) then Exit;

  if reset then begin
    sgActCustomerMaterialsTransfer.Clear;
    sgActCustomerMaterialsTransfer.RowCount := 2;
    SetGridHeaders(['Код', 'Номер','Дата', 'Сума (без ПДВ), грн.', 'Статус'], sgActCustomerMaterialsTransfer.ColumnHeaders);
    pageNum := 0;
    startPoint := 1;
  end else begin
    pageNum := Trunc(sgActCustomerMaterialsTransfer.RowCount / PAGE_SIZE);
    startPoint := sgActCustomerMaterialsTransfer.RowCount;
    if (sgActCustomerMaterialsTransfer.RowCount - 1) Mod PAGE_SIZE <> 0 then Exit;
    if (sgActCustomerMaterialsTransfer.TopRow + sgActCustomerMaterialsTransfer.VisibleRowCount) < pageNum * PAGE_SIZE then Exit;
  end;


  TempRQFKOrderController := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  filter := RQFKOrderFilter.Create;
  SetNullXSProps(filter);
  SetNullIntProps(filter);
  filter.kind := RQFKOrderKind.Create;
  filter.kind.code := RQFKORDER_KIND_PRIHOD_POSTAVKA;
  filter.accountingTypeRef := TKAccountingTypeRef.Create;
  filter.accountingTypeRef.code := TK_ACCOUNTINGTYPE_TMC;
  filter.conditionSQL := Format(' EXISTS (SELECT 1 FROM enservicesbjct2rqfkrdr AS sf WHERE sf.fkorderrefcode = RQFKORDER.CODE '
    + ' AND sf.servicesobjectrefcode = %d)', [ENServicesShiftObj.code]);
  filter.orderBySQL := 'RQFKORDER.DATEGEN desc';
  list := TempRQFKOrderController.getScrollableFilteredList(filter, pageNum * PAGE_SIZE, PAGE_SIZE);
  sgActCustomerMaterialsTransfer.RowCount := sgActCustomerMaterialsTransfer.RowCount + list.totalCount;
  if (reset) and (list.totalCount > 0) then
    sgActCustomerMaterialsTransfer.RowCount := sgActCustomerMaterialsTransfer.RowCount - 1;

  i := startPoint;
  with list do for listItem in list do SetRQFKOrderShortToGrid(sgActCustomerMaterialsTransfer, i, listItem);
  if reset then sgActCustomerMaterialsTransfer.Row := startPoint else sgActCustomerMaterialsTransfer.Row := startPoint - 1;

  prepareActionsCustomerMaterialsTransfer;
end;



procedure TfrmENServicesShiftEdit.actActCustomerMaterialsTransferCreateExecute(
  Sender: TObject);
begin
Self.actActCustomerMaterialsTransferStatusChange(RQFKORDER_STATUS_CREATED);
end;

procedure TfrmENServicesShiftEdit.actActCustomerMaterialsTransferDeleteExecute(
  Sender: TObject);
var
  fkOrder, fkOrderOld : RQFKOrder;
  servicesObjectController : ENServicesObjectControllerSoapPort;
begin
  inherited;
  servicesObjectController := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  fkOrderOld := Self.getSelectedActCustomerMaterialsTransfer;
  if not Assigned(fkOrderOld) then Exit;

  fkOrder := RQFKOrder.Create;
  SetNullXSProps(fkOrder);
  SetNullIntProps(fkOrder);
  fkOrder.code := fkOrderOld.code;
  fkOrder.numberDoc := fkOrderOld.numberDoc;

  if Application.MessageBox(PChar(Format('Ви дійсно бажаєте видалити акт приймання-передачі матеріалів замовника № %s?', [fkOrder.numberDoc]))
                    ,PChar('Увага'), MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=IDYES then begin
      servicesObjectController.updateActTransfer(ENServicesShiftObj.code, fkOrder, false);
      Self.actActCustomerMaterialsTransferUpdateExecute(Sender);
      Application.MessageBox(PChar(Format('Акт приймання-передачі № %s видалено!'
        , [fkOrder.numberDoc])), PChar('Повідомлення'), MB_ICONINFORMATION);
  end;
end;

procedure TfrmENServicesShiftEdit.actActCustomerMaterialsTransferEditExecute(
  Sender: TObject);
var
  fkOrder, fkOrderOld : RQFKOrder;
  dateChooseForm : TfrmChooseTXSDate;
  servicesObjectController : ENServicesObjectControllerSoapPort;
begin
  inherited;
  servicesObjectController := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  fkOrderOld := Self.getSelectedActCustomerMaterialsTransfer;
  if not Assigned(fkOrderOld) then Exit;

  fkOrder := RQFKOrder.Create;
  SetNullXSProps(fkOrder);
  SetNullIntProps(fkOrder);

  fkOrder.numberDoc := InputBox('EnergyNet', 'Введіть номер акту', fkOrderOld.numberDoc);

  dateChooseForm := TfrmChooseTXSDate.Create(Application
    , 'Введіть дату акту', 'Введіть дату акту', fkOrderOld.dateGen);

  dateChooseForm.ShowModal;

  fkOrder.dateGen := dateChooseForm.GetValue;

  dateChooseForm.Free;

  if Application.MessageBox(PChar('Ви дійсно бажаєте змінити акт приймання-передачі матеріалів замовника?')
                    , PChar('Увага'), MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=IDYES then begin
      servicesObjectController.updateActTransfer(ENServicesShiftObj.code, fkOrder, true);
      Self.actActCustomerMaterialsTransferUpdateExecute(Sender);
      Application.MessageBox(PChar(Format('Акт приймання-передачі № %s змінено!'
        , [fkOrder.numberDoc])), PChar('Повідомлення'), MB_ICONINFORMATION);
  end;
end;

procedure TfrmENServicesShiftEdit.actActCustomerMaterialsTransferInsertExecute(
  Sender: TObject);
var
  fkOrder : RQFKOrder;
  dateChooseForm : TfrmChooseTXSDate;
  servicesObjectController : ENServicesObjectControllerSoapPort;
begin
  inherited;
  fkOrder := RQFKOrder.Create;
  SetNullXSProps(fkOrder);
  SetNullIntProps(fkOrder);

  fkOrder.numberDoc := InputBox('EnergyNet', 'Введіть номер акту', ENServicesShiftObj.contractNumberServices);

  fkOrder.dateGen := TXSDate.Create;
  fkOrder.dateGen.XSToNative(GetXSDate(Today));

  dateChooseForm := TfrmChooseTXSDate.Create(Application
    , 'Введіть дату акту', 'Введіть дату акту', fkOrder.dateGen);

  dateChooseForm.ShowModal;

  fkOrder.dateGen := dateChooseForm.GetValue;

  dateChooseForm.Free;

  servicesObjectController := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

  if Application.MessageBox(PChar(Format('Ви дійсно бажаєте створити акт приймання-передачі матеріалів замовника № %s?', [fkOrder.numberDoc]))
                    ,PChar('Увага'), MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=IDYES then begin
      servicesObjectController.updateActTransfer(ENServicesShiftObj.code, fkOrder, true);
      Self.actActCustomerMaterialsTransferUpdateExecute(Sender);
      Application.MessageBox(PChar(Format('Акт приймання-передачі № %s створено!'
        , [fkOrder.numberDoc])), PChar('Повідомлення'), MB_ICONINFORMATION);
  end;
end;

procedure TfrmENServicesShiftEdit.actActCustomerMaterialsTransferMoveExecute(
  Sender: TObject);
var
  fkOrderOld, fkOrder : RQFKOrder;
  servicesObjectController : ENServicesObjectControllerSoapPort;
begin
  inherited;
  servicesObjectController := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  fkOrderOld := Self.getSelectedActCustomerMaterialsTransfer;
  if not Assigned(fkOrderOld) then Exit;
  fkOrder := RQFKOrder.Create;
  SetNullXSProps(fkOrder);
  SetNullIntProps(fkOrder);
  fkOrder.code := fkOrderOld.code;
  if Application.MessageBox(PChar(Format('Ви дійсно бажаєте провести акт приймання-передачі матеріалів замовника № %s?', [fkOrderOld.numberDoc]))
                    , PChar('Увага'), MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=IDYES then begin
      servicesObjectController.moveActTransferToFK(fkOrder);
      Self.actActCustomerMaterialsTransferUpdateExecute(Sender);
      Application.MessageBox(PChar(Format('Акт приймання-передачі № %s проведено!'
        , [fkOrderOld.numberDoc])), PChar('Повідомлення'), MB_ICONINFORMATION);
  end;
end;

procedure TfrmENServicesShiftEdit.actActCustomerMaterialsTransferUndoCreateExecute(
  Sender: TObject);
begin
  Self.actActCustomerMaterialsTransferStatusChange(RQFKORDER_STATUS_GOOD);
end;

procedure TfrmENServicesShiftEdit.actActCustomerMaterialsTransferStatusChange(
  status : Integer);
var
  fkOrderOld, fkOrder : RQFKOrder;
  servicesObjectController : ENServicesObjectControllerSoapPort;
  statusTxt, actionTxt : String;
  checkStatus : Boolean;
begin
  inherited;
  if not status in [RQFKORDER_STATUS_GOOD, RQFKORDER_STATUS_CREATED] then begin
    raise Exception.Create(Format('Неправильний статус - %d', [status]));
  end;

  servicesObjectController := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  fkOrderOld := Self.getSelectedActCustomerMaterialsTransfer;

  if not Assigned(fkOrderOld) then Exit;

  checkStatus := (( (status = RQFKORDER_STATUS_GOOD) and (fkOrderOld.status.code = RQFKORDER_STATUS_CREATED) ) or
                  ( (status = RQFKORDER_STATUS_CREATED) and (fkOrderOld.status.code = RQFKORDER_STATUS_GOOD)) );


  if not checkStatus then begin
    if status = RQFKORDER_STATUS_GOOD then begin
      statusTxt := 'складеним';
    end else begin
      statusTxt := 'чорновим';
    end;
    Application.MessageBox(PChar(Format('Акт приймання-передачі № %s повинен бути %s!'
        , [fkOrder.numberDoc, statusTxt])), PChar('Увага!'), MB_ICONERROR);
  end;
  fkOrder := RQFKOrder.Create;
  SetNullXSProps(fkOrder);
  SetNullIntProps(fkOrder);
  fkOrder.code := fkOrderOld.code;
  fkOrder.status := fkOrderOld.status;
  fkOrder.status.code := status;

  if status = RQFKORDER_STATUS_GOOD then actionTxt := 'відмінити складання акту'
  else actionTxt := 'затвердити акт';

  if Application.MessageBox(PChar(Format('Ви дійсно бажаєте %s приймання-передачі матеріалів замовника № %s?', [fkOrderOld.numberDoc, actionTxt]))
                    , PChar('Увага'), MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=IDYES then begin
      servicesObjectController.updateActTransfer(ENServicesShiftObj.code, fkOrder, true);
      Self.actActCustomerMaterialsTransferUpdateExecute(nil);

      if status = RQFKORDER_STATUS_GOOD then actionTxt := Format('Складання акту приймання-передачі № %s відмінено!'
        , [fkOrderOld.numberDoc])
      else actionTxt := Format('Акт приймання-передачі № %s затверджено!'
        , [fkOrderOld.numberDoc]);

      Application.MessageBox(PChar(actionTxt), PChar('Повідомлення'), MB_ICONINFORMATION);
  end;
end;

procedure TfrmENServicesShiftEdit.actActCustomerMaterialsTransferUnMoveExecute(
  Sender: TObject);
var
  fkOrderOld, fkOrder : RQFKOrder;
  servicesObjectController : ENServicesObjectControllerSoapPort;
begin
  inherited;
  servicesObjectController := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  fkOrderOld := Self.getSelectedActCustomerMaterialsTransfer;
  if not Assigned(fkOrderOld) then Exit;
  fkOrder := RQFKOrder.Create;
  SetNullXSProps(fkOrder);
  SetNullIntProps(fkOrder);
  fkOrder.code := fkOrderOld.code;
  if Application.MessageBox(PChar(Format('Ви дійсно бажаєте відмінити проведення акту приймання-передачі матеріалів замовника № %s!', [fkOrderOld.numberDoc]))
                    , PChar('Увага'), MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=IDYES then begin
      servicesObjectController.unMoveActTransferToFK(fkOrder);
      Self.actActCustomerMaterialsTransferUpdateExecute(Sender);
      Application.MessageBox(PChar(Format('Проведення акту приймання-передачі № %s відмінено!'
        , [fkOrderOld.numberDoc])), PChar('Повідомлення'), MB_ICONINFORMATION);
  end;
end;

procedure TfrmENServicesShiftEdit.actActCustomerMaterialsTransferUpdateExecute(
  Sender: TObject);
begin
  inherited;
  updateActCustomerMaterialsTransfer;
end;

procedure TfrmENServicesShiftEdit.actActCustomerMaterialsTransferViewExecute(
  Sender: TObject);
var
  fkOrder : RQFKOrder;
begin
  inherited;
  try
    fkOrder := Self.getSelectedActCustomerMaterialsTransfer;
    if fkOrder = nil then Exit;
    frmRQFKOrderEdit := TfrmRQFKOrderEdit.Create(Application, dsView);
    frmRQFKOrderEdit.RQFKOrderObj := fkOrder;
    frmRQFKOrderEdit.ShowModal;
  finally
    if Assigned(frmRQFKOrderEdit) then frmRQFKOrderEdit.Free;
    frmRQFKOrderEdit := nil;
  end;
end;


procedure TfrmENServicesShiftEdit.actAddActExecute(Sender: TObject);
var
  TempENServicesObject : ENServicesObjectControllerSoapPort;
  TempENElement2Act : ENElement2ActControllerSoapPort;
  element2Act : ENElement2Act;
  fkOrder : RQFKOrderShort;
  act : ENActShort;
  isLink : TXSBoolean;
begin
  inherited;
  if pcActs.ActivePage = tsRQFKOrder then begin

  isLink := TXSBoolean.Create;
  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  fkOrder := TfrmRQFKOrderShow.chooseFromList(RQFKORDER_KIND_SERVICES_FROM_SIDE);
  if Assigned(fkOrder) then begin
    if Application.MessageBox(PChar(Format('Ви дійсно бажаєте прив''язати ордер № %s від %s до договору № %s ?'
			,[fkOrder.numberDoc, XSDate2String(fkOrder.dateGen), ENServicesShiftObj.contractNumberServices])),
                    PChar('Увага!'),MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=IDYES then begin
	  isLink.asBoolean := True;
      TempENServicesObject.linkWithRQFKOrder(ENServicesShiftObj.code, fkOrder.code, isLink);
	  Self.updateRQFKOrder;
	  Application.MessageBox(PChar(Format('Ордер № %s від %s прив''язано до договору № %s!'
	     , [fkOrder.numberDoc, XSDate2String(fkOrder.dateGen), ENServicesShiftObj.contractNumberServices]))
		 , PChar('Повідомлення'), MB_ICONINFORMATION);
    end;
  end;
  end else begin
    TempENElement2Act := HTTPRIOENElement2Act as ENElement2ActControllerSoapPort;
    if (pcActs.ActivePage = tsENAct) or
      (pcActs.ActivePage = tsENActSubContract) then begin
        if pcActs.ActivePage = tsENAct then begin
          act := TfrmENActShow.chooseFromList([]
            , [ENPLANWORKSTATE_TMC_TRANSFER, ENPLANWORKSTATE_SERVICES_FROM_OUT]);
        end else begin
          act := TfrmENActShow.chooseFromList([ENPLANWORKSTATE_TMC_TRANSFER]
            , [ENPLANWORKSTATE_SERVICES_FROM_OUT]);
        end;
        if Assigned(act) then begin
          if Application.MessageBox(PChar(Format('Ви дійсно бажаєте прив''язати акт № %s від %s до договору № %s ?'
			      ,[act.numberGen, XSDate2String(act.dateAct), ENServicesShiftObj.contractNumberServices])),
                    PChar('Увага!'),MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=IDYES then begin
            element2Act := ENElement2Act.Create;
            element2Act.elementRef := ENElementRef.Create;
            element2Act.elementRef.code := ENServicesShiftObj.element.code;
            element2Act.actRef := ENActRef.Create;
            element2Act.actRef.code := act.code;
            element2Act.typeRef := ENElement2ActTypeRef.Create;
            element2Act.typeRef.code := ENELEMENT2ACTTYPE_SERVICES_WORKS;
            TempENElement2Act.add(element2Act);
            Self.actUpdateENActExecute(Sender);
            Application.MessageBox(PChar(Format('Акт № %s від %s прив''язано до договору № %s!'
              , [act.numberGen, XSDate2String(act.dateAct), ENServicesShiftObj.contractNumberServices]))
              , PChar('Повідомлення'), MB_ICONINFORMATION);
          end;
        end;

    end else begin
      raise Exception.Create('Ошибка. Обратитесь к разработчикам!');
    end;
  end;
end;

procedure TfrmENServicesShiftEdit.actAddBillExecute(Sender: TObject);
// Var TempENSOBill: ENSOBillControllerSoapPort;
begin

  Application.MessageBox(PChar('Рахунки додаються автоматично при додаванні прибуткового акту!'), PChar('Повідомлення'), MB_ICONINFORMATION);
  Exit;

  ENSOBillObj:=ENSOBill.Create;

  ENSOBillObj.servicesObjectRef := ENServicesObjectRef.Create;
  ENSOBillObj.servicesObjectRef.code := ENServicesShiftObj.code;

  try
    frmENSOBillEdit:=TfrmENSOBillEdit.Create(Application, dsInsert);
    frmENSOBillEdit.btnGetSumFromActs.Visible := True;
    try
      if frmENSOBillEdit.ShowModal = mrOk then
      begin
        if ENSOBillObj<>nil then
            Self.actUpdateBillExecute(Sender);
      end;
    finally
      frmENSOBillEdit.Free;
      frmENSOBillEdit:=nil;
    end;
  finally
    ENSOBillObj.Free;
  end;
end;



procedure TfrmENServicesShiftEdit.spbActWarrantNumberClick(Sender: TObject);
var
  frmENWarrantShow : TfrmENWarrantShow;
  f : ENWarrantFilter;
  warrant : ENWarrant;
  datContract, datWarrant : TXSDate;
  dtdatContract, dtdatWarrant : TDateTime;
  power: Double;
begin
  inherited;
  power := 0;

  datContract := TXSDate.Create;
  datWarrant := TXSDate.Create;

  f := ENWarrantFilter.Create();
  SetNullXSProps(f);
  SetNullIntProps(f);

  // Если мощность до 5 кВт включительно (т.е. РЭСовские ТУ), фильтруем по подразделению
  if power <= 5 then
  begin
    f.departmentRef := ENDepartmentRef.Create();
    f.departmentRef.code := ENServicesShiftObj.department.code;

    if (rgContragentType.ItemIndex in [ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET,
                                      ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NONBUDGET,
                                      ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL_NOREZIDENT,
                                      ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NOREZIDENT]) and
      (ENServicesShiftObj.department.code = ENDEPARTMENT_HGES) then
    begin
      f.departmentRef.code := ENDEPARTMENT_KSOE;
    end;
  end;

  f.conditionSQL := ' warrantstatusrefcode = 0 and power >= ' + FloatToStr(power);

  frmENWarrantShow := TfrmENWarrantShow.Create(Application,fmNormal, f);
  DisableActions([frmENWarrantShow.actNoFilter]);

  try
    with frmENWarrantShow do
      if ShowModal = mrOk then
      begin
        try
       


        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENWarrantShow.Free;
  end;
end;


procedure TfrmENServicesShiftEdit.sgActCustomerMaterialsTransferClick(
  Sender: TObject);
begin
  inherited;
  prepareActionsCustomerMaterialsTransfer;
end;

procedure TfrmENServicesShiftEdit.sgActCustomerMaterialsTransferDblClick(
  Sender: TObject);
begin
  inherited;
  actActCustomerMaterialsTransferViewExecute(Sender);
end;

procedure TfrmENServicesShiftEdit.sgActCustomerMaterialsTransferTopLeftChanged(
  Sender: TObject);
begin
  inherited;
  Self.updateActCustomerMaterialsTransfer(false);
end;

procedure TfrmENServicesShiftEdit.sgENActClick(Sender: TObject);
begin
  inherited;
  toggleActDeleteAction;
end;

procedure TfrmENServicesShiftEdit.sgENActIncomeDblClick(Sender: TObject);
begin
  inherited;
  Self.actViewIncomeExecute(Sender);
end;

procedure TfrmENServicesShiftEdit.sgENActIncomeServicesDblClick(
  Sender: TObject);
begin
  inherited;
  Self.actViewIncomeExecute(Sender);
end;

procedure TfrmENServicesShiftEdit.sgENActIncomeServicesTopLeftChanged(
  Sender: TObject);
begin
  inherited;
  updateActIncome(false);
end;

procedure TfrmENServicesShiftEdit.sgENActSubContractClick(Sender: TObject);
begin
  inherited;
  toggleActDeleteAction;
end;

procedure TfrmENServicesShiftEdit.sgENActSubContractTopLeftChanged(
  Sender: TObject);
begin
  inherited;
  Self.updateENAct(Sender, true, sgENActSubContract, false);
end;

procedure TfrmENServicesShiftEdit.sgENActTopLeftChanged(Sender: TObject);
begin
  inherited;
  Self.updateENAct(Sender, false, sgENAct, false);
end;

procedure TfrmENServicesShiftEdit.sgENAdditionalAgreementGetAlignment(
  Sender: TObject; ARow, ACol: Integer; var HAlign: TAlignment;
  var VAlign: TVAlignment);
begin
  inherited;
  if ACol = 5 then begin
    HAlign := taCenter;
  end;
end;

procedure TfrmENServicesShiftEdit.sgENAdditionalAgreementTopLeftChanged(
  Sender: TObject);
begin
  inherited;
  Self.updateAdditionalAgreements(false);
end;

procedure TfrmENServicesShiftEdit.sgENPlanWorkClick(Sender: TObject);
var
  TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
  planItemFilter: ENPlanWorkItemFilter;
  i, pCode: Integer;
  ENPlanWorkItemList: ENPlanWorkItemShortList;
  vNormOfTime, vCountGen: Double;
begin
    ////////////////////////////////////////////////////////////////////////////
    ClearGrid(sgENSelectedPlanItems);
    //if planCode = LOW_INT then Exit;

    try
      pCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
    except
      on EConvertError do Exit;
    end;

    //DisableActions([actInsert,  actEdit, actDelete, actFilter, actNoFilter], not (DialogState in [dsEdit, dsInsert]) );


    //iColCount:=-1;


    planItemFilter := ENPlanWorkItemFilter.Create;
    SetNullIntProps(planItemFilter);
    SetNullXSProps(planItemFilter);

    planItemFilter.planRef := ENPlanWorkRef.Create;
    planItemFilter.planRef.code := pCode; 

    planItemFilter.orderBySQL := ' enplanworkitem.kartarefcode';
    TempENPlanWorkItem :=  HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;

    ENPlanWorkItemList := TempENPlanWorkItem.getScrollableFilteredList(planItemFilter,0,-1);

    //iLastCount:=High(ENPlanWorkItemList.list);

    if High(ENPlanWorkItemList.list) > -1 then
       sgENSelectedPlanItems.RowCount := High(ENPlanWorkItemList.list) + 2
    else
       sgENSelectedPlanItems.RowCount := 2;

     with sgENSelectedPlanItems do
      for i := 0 to High(ENPlanWorkItemList.list) do
        begin
          //Application.ProcessMessages;
          if ENPlanWorkItemList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(ENPlanWorkItemList.list[i].code)
          else
            Cells[0,i+1] := '';

          Cells[1,i+1] := ENPlanWorkItemList.list[i].kartaNum;
          Cells[2,i+1] := ENPlanWorkItemList.list[i].kartaRefName;
          Cells[3, i+1] := ENPlanWorkItemList.list[i].sourceName;

          vCountGen := 0;

          if ENPlanWorkItemList.list[i].countGen = nil then
            Cells[4,i+1] := ''
          else begin
            Cells[4,i+1] := ENPlanWorkItemList.list[i].countGen.DecimalString;
            try
              vCountGen := StrToFloat(ENPlanWorkItemList.list[i].countGen.DecimalString);
            except
              vCountGen := 0;
            end;
          end;

          vNormOfTime := 0;

          if ENPlanWorkItemList.list[i].normOfTime = nil then
            Cells[5, i+1] := ''
          else begin
            Cells[5, i+1] := ENPlanWorkItemList.list[i].normOfTime.DecimalString;
            try
              vNormOfTime := StrToFloat(ENPlanWorkItemList.list[i].normOfTime.DecimalString);
            except
              vNormOfTime := 0;
            end;
          end;

          Cells[6,i+1] := FloatToStr(Conv(vNormOfTime * vCountGen, 3));

          if ENPlanWorkItemList.list[i].timeGen <> nil then
            Cells[7, i +1] := ENPlanWorkItemList.list[i].timeGen.DecimalString
          else
            Cells[7, i+1] := '';

          Cells[8, i+1] := ENPlanWorkItemList.list[i].meter;
          Cells[9, i+1] := ENPlanWorkItemList.list[i].measurementUnit;

          Cells[10,i+1] := ENPlanWorkItemList.list[i].userGen;

          {if ENPlanWorkItemList.list[i].dateEdit = nil then
            Cells[9,i+1] := ''
          else
            Cells[9,i+1] := XSDate2String(ENPlanWorkItemList.list[i].dateEdit);}

          //Cells[9,i+1] := FloatToStr(Conv(vNormOfTime * vCountGen, 3));

          /////
          try
            RowColor[i+1] := clWindow;
            
            // Если работа с нулевым кол-вом, выделяем строку красным цветом
            if ENPlanWorkItemList.list[i].countGen <> nil then
              if StrToFloat(ENPlanWorkItemList.list[i].countGen.DecimalString) = 0 then
                RowColor[i+1] := clTeal; //clRed;
          except
          end;
          /////

          sgENSelectedPlanItems.RowCount := i+2;
        end;

     sgENSelectedPlanItems.Row:=1;
end;


procedure TfrmENServicesShiftEdit.sgENPlanWorkRightClickCell(
  Sender: TObject; ARow, ACol: Integer);
var
  plan : ENPlanWork;
  ObjCode : Integer;
begin
  if ARow <= 0 then Exit;

  try
    ObjCode := StrToInt(sgENPlanWork.Cells[0, ARow]);
  except
    on EConvertError do Exit;
  end;

  plan := DMReports.getPlanByCode(ObjCode);
  if plan = nil then
  begin
    Exit;
  end;

  sgENPlanWorkClick(Sender); // Чтобы перечитался список работ из плана

  if (plan.kind.code in [ENPLANWORKKIND_CALCULATION, ENPLANWORKKIND_CALCULATION_SINGLE]) then Exit;

  plansPopup(plan);

  pmPlans.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);

end;

procedure TfrmENServicesShiftEdit.sgENPlanWorkTopLeftChanged(Sender: TObject);
begin
  Self.updatePlans(false);
end;

procedure TfrmENServicesShiftEdit.sgENServices2CalcAdditionalItemsDblClick(
  Sender: TObject);
begin
  inherited;
  Self.actViewCAIExecute(Sender);
end;

procedure TfrmENServicesShiftEdit.sgENServices2CalcAdditionalItemsTopLeftChanged(
  Sender: TObject);
begin
  inherited;
  Self.updateCAI(false);
end;

procedure TfrmENServicesShiftEdit.sgENServicesCostDblClick(Sender: TObject);
begin
  inherited;
  Self.openENServicesCostEditForm(TDialogState.dsView);
end;

procedure TfrmENServicesShiftEdit.sgENServicesCostTopLeftChanged(
  Sender: TObject);
begin
  inherited;
  updateENServicesCost(false);
end;

procedure TfrmENServicesShiftEdit.sgENSOBillClick(Sender: TObject);
begin
  inherited;
  updatePayments(Sender);
  updateProvs(Sender);
end;


procedure TfrmENServicesShiftEdit.sgENSOBillTopLeftChanged(Sender: TObject);
begin
  inherited;
  Self.updateBills(false);
end;

procedure TfrmENServicesShiftEdit.sgRQFKOrderTopLeftChanged(Sender: TObject);
begin
  inherited;
  Self.updateRQFKOrder(false);
end;

procedure TfrmENServicesShiftEdit.plansPopup(plan: ENPlanWork);
var allowCloseUnclose: Boolean;
begin
  if plan = nil then
  begin
    Exit;
  end;

//  DisableActions([actClosePlan, actUnClosePlan], false);
//  HideActions([actClosePlan, actUnClosePlan], false);

  DisableActions([actClosePlan, actUnClosePlan]);

  allowCloseUnclose := false;

  if not (ENServicesShiftObj.contractStatusRef.code in [ENSERVICESOBJECTSTATUS_COMPLETED,
                                                         ENSERVICESOBJECTSTATUS_TERMINATED]) then
  begin
    if (ENServicesShiftObj.statusRef.code <> ENSERVICESOBJECT_FINSTATUS_CLOSED) and
       (ENServicesShiftObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
      //DisableActions([actClosePlan, actUnClosePlan], false);
      allowCloseUnclose := true;
  end;

  miClosePlan.Caption := 'Затвердити План';

  if plan.kind.code = ENPLANWORKKIND_CURRENT then
     miClosePlan.Caption := 'Скласти Завдання-ПЛАН'
  else
  if plan.kind.code = ENPLANWORKKIND_NPZ then
     miClosePlan.Caption := 'Скласти Завдання-ФАКТ'
  else
  if plan.kind.code = ENPLANWORKKIND_FACT then
     miClosePlan.Caption := 'Затвердити Факт, для якого не потрібно формувати Акт ...';//'Затвердити ФАКТ';

  actClosePlan.Enabled := //(plan.kind.code <> ENPLANWORKKIND_FACT) and
                          (
                             ( plan.status.code = ENPLANWORKSTATUS_GOOD) or ( plan.kind.code = ENPLANWORKKIND_CURRENT)
                             // для статусов на корректировке - ограничим на сервере ... and (plan.status.code <> ENPLANWORKSTATUS_PRECONFIRMED)
                           )
                           and (allowCloseUnclose);

  actClosePlan.Visible := actClosePlan.Enabled;


  // planUnclose ...
  actUnClosePlan.Enabled := (
                          (plan.kind.code = ENPLANWORKKIND_NPZ) or (plan.kind.code = ENPLANWORKKIND_FACT)
                        // для 2011 года можно удалять .. ПОКА .. до создания ЗАЯВКИ!!!!
                         or ((plan.kind.code = ENPLANWORKKIND_CURRENT) and (plan.yearGen = 2011))

                         )
                        and (plan.status.code = ENPLANWORKSTATUS_GOOD)
                        and (allowCloseUnclose);

   // отмена утвержденных без Актов .... на сервере чекним есть ли акт ;)
   if  (plan.status.code = ENPLANWORKSTATUS_LOCKED) and (plan.kind.code = ENPLANWORKKIND_FACT) then
   begin
     if allowCloseUnclose then
       actUnClosePlan.Enabled :=  True;
     miUnClosePlan.Caption := 'Відмінити затвердження Факту, для якого не потрібно формувати Акт ...'
   end
   else begin
     miUnClosePlan.Caption := 'Видалити для коригування попереднього';
   end;
  ///// 03.11.11 NET-861
  if plan.kind.code = ENPLANWORKKIND_CURRENT then
  begin
    if plan.status.code <> ENPLANWORKSTATUS_WORKS_FINISHED then
    begin
      actUndoFinishPlan.Enabled := false;
      actUndoFinishPlan.Visible := false;
      actFinishPlan.Enabled := true;
      actFinishPlan.Visible := true;
    end
    else begin
      actFinishPlan.Enabled := false;
      actFinishPlan.Visible := false;
      actUndoFinishPlan.Enabled := true;
      actUndoFinishPlan.Visible := true;
    end;
  end
  else begin
    DisableActions([actFinishPlan, actUndoFinishPlan]);
    HideActions([actFinishPlan, actUndoFinishPlan]);
  end;
  /////

  if (plan.typeRef.code in [ENPLANWORKTYPE_SERVICES_FROM_SIDE, ENPLANWORKTYPE_SERVICES_FROM_SIDE_INVEST]) then
  begin
    DisableActions([actClosePlan, actUnClosePlan{, actConfirm, actPreConfirm}]);
    HideActions([actClosePlan, actUnClosePlan{, actConfirm, actPreConfirm}]);
  end;
end;

procedure TfrmENServicesShiftEdit.actEditPlanExecute(
  Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    tPlan: ENPlanWork;
    ObjCode: Integer;
begin
  if pcCalculation.ActivePage = tsPlans then
  begin
    try
      ObjCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]);
    except
      on EConvertError do Exit;
    end;

    tPlan := DMReports.getPlanByCode(ObjCode);

    if tPlan = nil then Exit;

    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    if (tPlan.status.code = ENPLANWORKSTATUS_PRECONFIRMED) then
    begin
      try
        TempENPlanWork.editPreConfirm(tPlan.code);
      except
        Application.MessageBox(PChar('Цей план можуть коригувати тільки у ХОЕ!'), PChar('Увага!'), MB_ICONWARNING);
        Exit;
      end;
    end;

    if not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION, ENPLANWORKSTATUS_PRECONFIRMED])

    then
    begin
      Application.MessageBox(PChar('План затверджений!'), PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;

    if (tPlan.kind.code = ENPLANWORKKIND_CALCULATION) then
    begin
      Application.MessageBox(PChar('Кошторис не редагується!'), PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;

    frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsEdit);
    try
      //SUPP-4339
      frmENPlanWorkEdit.isPriconnection := (
        ENServicesShiftObj.contractTypeRef.code =
        ENSERVICESOBJECTTYPE_CONNECTION);
      frmENPlanWorkEdit.soElementCode := ENServicesShiftObj.element.code;
          
      frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(ObjCode);

      if frmENPlanWorkEdit.ShowModal = mrOk then
      begin
        //TempENPlanWork.save(ENPlanWorkObj);
        //UpdateGrid(Sender);
        actUpdateExecute(Sender);
      end;
    finally
      frmENPlanWorkEdit.Free;
      frmENPlanWorkEdit:=nil;
    end;
  end; // if pcCalculation.ActivePage = tsPlans
end;


procedure TfrmENServicesShiftEdit.actEditPostingsExecute(Sender: TObject);
Var TempENSOPayBillProv: ENSOPayBillProvControllerSoapPort;
begin
 TempENSOPayBillProv := HTTPRIOENSOPayBillProv as ENSOPayBillProvControllerSoapPort;
   try
     ENSOPayBillProvObj := TempENSOPayBillProv.getObject(StrToInt(sgENSOPayBillProv.Cells[0,sgENSOPayBillProv.Row]));
   except
   on EConvertError do Exit;
  end;

  frmPostings4BillEdit:=TfrmPostings4BillEdit.Create(Application, dsEdit);
  try
    if frmPostings4BillEdit.ShowModal= mrOk then
      begin
        updateProvs(Sender);
      end;
  finally
    frmPostings4BillEdit.Free;
    frmPostings4BillEdit:=nil;
    ENSOPayBillProvObj.Free;
  end;
end;

procedure TfrmENServicesShiftEdit.actViewPlanExecute(
  Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
tPlan : ENPlanWork;
objCode : Integer;
begin

      try
        objCode:=StrToInt( sgENPlanWork.Cells[0, sgENPlanWork.row] );
      except
        on EConvertError do Exit;
      end;


  tPlan := DMReports.getPlanByCode( objCode );

  if tPlan = nil then
  begin
      exit;
  end;

   TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;



   frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsView);

   if (tPlan.typeRef.code = ENPLANWORKTYPE_TRANSPORT) and (tPlan.stateRef.code = ENPLANWORKSTATE_GSM) then
    frmENPlanWorkEdit.isTransport := true;

   if (tPlan.typeRef.code = ENPLANWORKTYPE_SIZ) then
    frmENPlanWorkEdit.isSiz := true;

    //SUPP-4339
      frmENPlanWorkEdit.isPriconnection := (
        ENServicesShiftObj.contractTypeRef.code =
        ENSERVICESOBJECTTYPE_CONNECTION);

      frmENPlanWorkEdit.soElementCode := ENServicesShiftObj.element.code;

   try

     try
       frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject( objCode );
     except
       on EConvertError do Exit;
     end;

     frmENPlanWorkEdit.ShowModal;

   finally
     frmENPlanWorkEdit.Free;
     frmENPlanWorkEdit:=nil;
   end;

end;


procedure TfrmENServicesShiftEdit.actDeletePlanExecute(
  Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
  ObjCode, eType : Integer;
  tPlan : ENPlanWork;
begin
  try
    ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  tPlan := DMReports.getPlanByCode(ObjCode);

  if tPlan = nil then
  begin
      exit;
  end;


  if not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION]) then
  begin
      Application.MessageBox(PChar('План затверджений !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  if Application.MessageBox(PChar('Вы действительно хотите удалить (План робіт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

      TempENPlanWork.remove(ObjCode);

      //actUpdatePlanExecute(Sender);
      actUpdateExecute(Sender);


  end;

end;


procedure TfrmENServicesShiftEdit.actAddENServicesCostExecute(Sender: TObject);
begin
  inherited;
  Self.openENServicesCostEditForm(TDialogState.dsInsert);
end;

procedure TfrmENServicesShiftEdit.actAddPlanExecute(Sender: TObject);
var
  TempEnPlanwork: ENPlanWorkControllerSoapPort;
begin
  if DialogState = dsInsert then Exit;


  if ENServicesShiftObj.contractDateServices = nil then
  begin
    Application.MessageBox(PChar('Спочатку введіть дату договору!'),
                           PChar('Увага!'), MB_ICONWARNING);
    if edtContractDateServices.CanFocus then edtContractDateServices.SetFocus;
    Exit;
  end;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsInsert);

  try
    frmENPlanWorkEdit.isShiftLinesServices := True;

    frmENPlanWorkEdit.servicesObjCode := ENServicesShiftObj.code;

    frmENPlanWorkEdit.ENPlanWorkObj := ENPlanWork.Create;
    frmENPlanWorkEdit.ENPlanWorkObj.kind := ENPlanWorkKind.Create;
    frmENPlanWorkEdit.ENPlanWorkObj.kind.code := ENPLANWORKKIND_CURRENT;
    frmENPlanWorkEdit.cbPlanWorkKind.ItemIndex := ENPLANWORKKIND_CURRENT -1;
    frmENPlanWorkEdit.cbPlanWorkKind.Enabled := False;

    frmENPlanWorkEdit.ENPlanWorkObj.monthGen := ENServicesShiftObj.contractDate.Month;
    frmENPlanWorkEdit.edtMonthGen.ItemIndex := ENServicesShiftObj.contractDate.Month - 1;

    frmENPlanWorkEdit.ENPlanWorkObj.dateStart := TXSDate.Create;
    frmENPlanWorkEdit.ENPlanWorkObj.dateStart.XSToNative(GetXSDate(EncodeDate(ENServicesShiftObj.contractDateServices.Year,
                                                                              ENServicesShiftObj.contractDateServices.Month, 1)));

    frmENPlanWorkEdit.ENPlanWorkObj.departmentRef := ENDepartmentRef.Create;
    frmENPlanWorkEdit.ENPlanWorkObj.departmentRef.code := ENServicesShiftObj.department.code; //ENTechConditionsServicesObj.department.code;
    frmENPlanWorkEdit.edtDepartment.Text := ENServicesShiftObj.department.name; //ENTechConditionsServicesObj.department.name;

    frmENPlanWorkEdit.ENPlanWorkObj.budgetRef := ENDepartmentRef.Create;
    frmENPlanWorkEdit.ENPlanWorkObj.budgetRef.code := ENBUDGET_OKS;
    frmENPlanWorkEdit.edtENBudgetName.Text := 'ВКБ';

    frmENPlanWorkEdit.ENPlanWorkObj.responsibilityRef := ENDepartmentRef.Create;
    frmENPlanWorkEdit.ENPlanWorkObj.responsibilityRef.code := ENRESPONSIBILITY_OKS;
    frmENPlanWorkEdit.edtResponsibility.Text := 'ВКБ';

    frmENPlanWorkEdit.ENPlanWorkObj.formRef := ENPlanWorkFormRef.Create;
    frmENPlanWorkEdit.ENPlanWorkObj.formRef.code := ENPLANWORKFORM_NOPLANNED;
    frmENPlanWorkEdit.cbENPlanWorkFormName.ItemIndex := ENPLANWORKFORM_NOPLANNED - 1;

       frmENPlanWorkEdit.ENPlanWorkObj.commentGen := '№' + ENServicesShiftObj.contractNumberServices +
                                                     ' від ' + XSDate2String(ENServicesShiftObj.contractDateServices) + ' р.' +
                                                     ' (' + ENServicesShiftObj.commentServicesGen + ')';

       frmENPlanWorkEdit.edtCommentGen.Text := frmENPlanWorkEdit.ENPlanWorkObj.commentGen;

    /////

    if frmENPlanWorkEdit.ShowModal = mrOk then
    begin
      //actUpdatePlanExecute(Sender);
      actUpdateExecute(Sender);
    end;

  finally
  end;
end;

procedure TfrmENServicesShiftEdit.actCheckAllCalculationsExecute(
  Sender: TObject);
begin
  inherited;
  checkGrid(sgENServicesCost, 1, true);
end;

procedure TfrmENServicesShiftEdit.actClosePlanExecute(
  Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENPlanWorkList: ENPlanWorkShortList;
    ENPlanWorkFilterObj: ENPlanWorkFilter;
    ObjCode: Integer;
    ENPlanWorkObj: ENPlanWork;
    tPlan : ENPlanWork;
    TempENElement: ENElementControllerSoapPort;
    tEObj:ENElement;
begin


  tPlan := DMReports.getPlanByCode(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
  if tPlan = nil then
  begin
     Application.MessageBox(PChar('План not found !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;

   TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;
   tEObj:=TempENElement.getObject(tPlan.elementRef.code);


  if
    (
      not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION])
    )
    and ( tPlan.kind.code <> ENPLANWORKKIND_CURRENT )
    then
  begin
      Application.MessageBox(PChar('План ВЖЕ затверджений або видалений !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;


  if
 ((
  ((tEObj.typeRef.code=7)or(tEObj.typeRef.code=8))
  and ((tPlan.typeRef.code=100) or (tPlan.typeRef.code=102)
  or (tPlan.typeRef.code=103) or (tPlan.typeRef.code=104))
  and (tPlan.formRef.code=ENPLANWORKFORM_NOPLANNED)
  )

  )
    then
  begin
      Application.MessageBox(PChar('Треба вибрати - Затвердити план(біллінг) або затвердити план з біллінгу !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;



  if Application.MessageBox(PChar('Ви дійсно бажаєте '+ miClosePlan.Caption +' ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

        TempENPlanWork.closePlanWork(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
        Application.MessageBox(PChar('План затверджено !'), PChar('Повідомлення'), MB_ICONINFORMATION);
        //actUpdatePlanExecute(Sender);
        actUpdateExecute(Sender);

  end;


end;

procedure TfrmENServicesShiftEdit.actUnClosePlanExecute(
  Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
ObjCode : Integer;
begin

   try
     ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
   except
     on EConvertError do Exit;
   end;


  if Application.MessageBox(PChar('Ви дійсно бажаєте Відминити затвердження ... ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    TempENPlanWork.openPlanWork(ObjCode);

    Application.MessageBox(PChar('Видалено ...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    //actUpdatePlanExecute(Sender);
    actUpdateExecute(Sender);
  end;

end;

procedure TfrmENServicesShiftEdit.actFilterActExecute(Sender: TObject);
begin
  frmENActFilterEdit := TfrmENActFilterEdit.Create(Application, dsInsert);
  try
    ENActFilterObj := ENActFilter.Create;
    SetNullIntProps(ENActFilterObj);
    SetNullXSProps(ENActFilterObj);

    if frmENActFilterEdit.ShowModal = mrOk then
    begin
      actFilter := ENActFilter.Create;
      actFilter := ENActFilterObj;
      updateENAct(Sender, false, sgENAct);
    end;

    ENActFilterObj := nil;
  finally
    frmENActFilterEdit.Free;
    frmENActFilterEdit := nil;
  end;
end;

procedure TfrmENServicesShiftEdit.actFilterPlanExecute(Sender: TObject);
begin
  frmENPlanWorkFilterEdit := TfrmENPlanWorkFilterEdit.Create(Application, dsInsert);
  try
    ENPlanWorkFilterObj := ENPlanWorkFilter.Create;
    SetNullIntProps(ENPlanWorkFilterObj);
    SetNullXSProps(ENPlanWorkFilterObj);

    if frmENPlanWorkFilterEdit.ShowModal = mrOk then
    begin
      planFilter := ENPlanWorkFilter.Create;
      planFilter := ENPlanWorkFilterObj;
      Self.actUpdateExecute(Sender);
    end;

    ENPlanWorkFilterObj := nil;
  finally
    frmENPlanWorkFilterEdit.Free;
    frmENPlanWorkFilterEdit := nil;
  end;
end;

procedure TfrmENServicesShiftEdit.actFinishPlanExecute(
  Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENPlanWorkList: ENPlanWorkShortList;
    ENPlanWorkFilterObj: ENPlanWorkFilter;
    ObjCode: Integer;
    ENPlanWorkObj: ENPlanWork;
    tPlan: ENPlanWork;
begin
  tPlan := DMReports.getPlanByCode(StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]));
  if tPlan = nil then
  begin
    Application.MessageBox(PChar('План не знайдено !'), PChar('Увага'), MB_ICONWARNING);
    Exit;
  end;

  if tPlan.code <= 0 then
  begin
    Application.MessageBox(PChar('План не знайдено !'), PChar('Увага'), MB_ICONWARNING);
    Exit;
  end;

  if (tPlan.status.code = ENPLANWORKSTATUS_WORKS_FINISHED) then
  begin
    Application.MessageBox(PChar('Цей план вже знаходиться в статусі "Роботи завершені"!'), PChar('Увага'), MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте перевести план у статус "Роботи завершені" ?' + #13#10 +
                                  'Зверніть увагу, що весь Транзит з цього плану буде автоматично переведений в Опер. запас!'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    TempENPlanWork.finishPlanWork(tPlan.code);

    Application.MessageBox(PChar('План переведено у статус "Роботи завершені"!'), PChar('Повідомлення'), MB_ICONINFORMATION);
    //actUpdatePlanExecute(Sender);
    actUpdateExecute(Sender);
  end;
end;


procedure TfrmENServicesShiftEdit.actUndoAllChecksCalculationsExecute(
  Sender: TObject);
begin
  inherited;
  checkGrid(sgENServicesCost, 1, false);
end;

procedure TfrmENServicesShiftEdit.actUndoConfirmExecute(Sender: TObject);
var
  planCode : Integer;
  TempENPlanWork : ENPlanWorkControllerSoapPort;
begin
  inherited;
  try
    planCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте повернути План на доопрацювання ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    TempENPlanWork.undoConfirm(planCode);

    Application.MessageBox(PChar('План повернено ...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    actUpdateExecute(Sender);
  end;
end;


procedure TfrmENServicesShiftEdit.actUndoCreatePlanFromENServicesCostExecute(
  Sender: TObject);
begin
  inherited;
  generatePlans(false);
end;

procedure TfrmENServicesShiftEdit.actUndoFinishPlanExecute(
  Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENPlanWorkList: ENPlanWorkShortList;
    ENPlanWorkFilterObj: ENPlanWorkFilter;
    ObjCode: Integer;
    ENPlanWorkObj: ENPlanWork;
    tPlan: ENPlanWork;
begin
  tPlan := DMReports.getPlanByCode(StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]));
  if tPlan = nil then
  begin
    Application.MessageBox(PChar('План не знайдено !'), PChar('Увага'), MB_ICONWARNING);
    Exit;
  end;

  if tPlan.code <= 0 then
  begin
    Application.MessageBox(PChar('План не знайдено !'), PChar('Увага'), MB_ICONWARNING);
    Exit;
  end;

  if (tPlan.status.code <> ENPLANWORKSTATUS_WORKS_FINISHED) then
  begin
    Application.MessageBox(PChar('Цей план НЕ знаходиться в статусі "Роботи завершені"!'), PChar('Увага'), MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте ВІДМІНИТИ переведення плану в статус "Роботи завершені" ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    TempENPlanWork.undoFinishPlanWork(tPlan.code);

    Application.MessageBox(PChar('План повернено у статус "Затверджений"!'), PChar('Повідомлення'), MB_ICONINFORMATION);
    //actUpdatePlanExecute(Sender);
    actUpdateExecute(Sender);
  end;
end;


procedure TfrmENServicesShiftEdit.actEditActExecute(Sender: TObject);
var
  TempENAct: ENActControllerSoapPort;
  grid : TAdvStringGrid;
begin
  inherited;
  if pcActs.ActivePage = tsENAct then begin
    grid := sgENAct;
  end else if pcActs.ActivePage = tsENActSubContract then begin
    grid := sgENActSubContract;
  end else begin
    raise Exception.Create('error...');
  end;

  TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

  frmENActEdit := TfrmENActEdit.Create(Application, dsEdit);
  try
    try
      frmENActEdit.ENActObj := TempENAct.getObject(StrToInt(grid.Cells[0,grid.Row]));
    except
      on EConvertError do Exit;
    end;

    if (frmENActEdit.ENActObj <> nil) then
    begin
      if (frmENActEdit.ENActObj.statusRef.code = ENACT_REVERSED) then
      begin
        Application.MessageBox(PChar('Акт сторновано ... використовуйте перегляд ...!!!'), PChar('Внимание !'),MB_ICONWARNING);
        exit;
      end;
      if (frmENActEdit.ENActObj.statusRef.code <> ENACT_GOOD) then
      begin
        Application.MessageBox(PChar('Акт На підписанні або вже Проведений ... використовуйте перегляд ...!!!'), PChar('Внимание !'),MB_ICONWARNING);
        exit;
      end;
    end
    else
    begin
      Application.MessageBox(PChar('Акт НЕ знайдено ...'), PChar('Внимание !'),MB_ICONWARNING);
      exit;
    end;

    if frmENActEdit.ShowModal in [mrOk, mrYes] then
    begin
      pcCalculationChange(Sender);
    end;
  finally
    frmENActEdit.Free;
    frmENActEdit:=nil;
  end;
end;

procedure TfrmENServicesShiftEdit.actEditBillExecute(Sender: TObject);
Var TempENSOBill: ENSOBillControllerSoapPort;
begin
 TempENSOBill := HTTPRIOENSOBill as ENSOBillControllerSoapPort;
   try
     ENSOBillObj := TempENSOBill.getObject(StrToInt(sgENSOBill.Cells[0,sgENSOBill.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSOBillEdit:=TfrmENSOBillEdit.Create(Application, dsEdit);
  try
    if frmENSOBillEdit.ShowModal= mrOk then
      begin
        Self.actUpdateBillExecute(Sender);
      end;
  finally
    frmENSOBillEdit.Free;
    frmENSOBillEdit:=nil;
  end;
end;

procedure TfrmENServicesShiftEdit.actEditCAIExecute(Sender: TObject);
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
        actUpdateCAIExecute(Sender);
        Self.updateSumsIfNeeded;
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


procedure TfrmENServicesShiftEdit.actEditENServicesCostExecute(Sender: TObject);
begin
  inherited;
  Self.openENServicesCostEditForm(TDialogState.dsEdit);
end;

procedure TfrmENServicesShiftEdit.actEditIncomeExecute(Sender: TObject);
var
  ObjCode: Integer;
  TempENActIncomeServices: ENActIncomeServicesControllerSoapPort;
begin
  inherited;
  TempENActIncomeServices := HTTPRIOENActIncomeServices as ENActIncomeServicesControllerSoapPort;
  try
    ObjCode := StrToInt(sgENActIncomeServices.Cells[0,sgENActIncomeServices.Row]);
    ENActIncomeServicesObj := TempENActIncomeServices.getObject(ObjCode);
  except
    on EConvertError do Exit;
  end;
  frmENActIncomeServicesEdit := TfrmENActIncomeServicesEdit.Create(Application, dsEdit);
  try
    frmENActIncomeServicesEdit.ShowModal;
  finally
    frmENActIncomeServicesEdit.Free;
    frmENActIncomeServicesEdit := nil;
  end;
end;

procedure TfrmENServicesShiftEdit.actDeleteBillExecute(Sender: TObject);
Var TempENSOBill: ENSOBillControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSOBill := HTTPRIOENSOBill as ENSOBillControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSOBill.Cells[0,sgENSOBill.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Рахунки по договору ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSOBill.remove(ObjCode);
      Self.actUpdateBillExecute(Sender);
  end;
end;

procedure TfrmENServicesShiftEdit.actDeleteCAIExecute(Sender: TObject);
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
      actUpdateCAIExecute(Sender);
      Self.updateSumsIfNeeded;
  end;
end;


procedure TfrmENServicesShiftEdit.actDeleteENServicesCostExecute(
  Sender: TObject);
var
  TempENServicesCost : ENServicesCostControllerSoapPort;
  chosenIndices : TList<Integer>;
  calcCost : ENServicesCost;
  item, temp : Integer;
  arr : ENServicesCostController.ArrayOfInteger;
  txsIsGenerate : TXSBoolean;
  msgResult : string;
begin
  inherited;
  TempENServicesCost := HTTPRIOENServicesCost as ENServicesCostControllerSoapPort;
  chosenIndices := BaseUtils.getCheckedIndexes(sgENServicesCost, 1);
  if not Assigned(chosenIndices) then chosenIndices := TList<Integer>.Create;
  if (chosenIndices.Count = 0) then begin
      chosenIndices.Add(sgENServicesCost.Row);
  end;
  SetLength(arr, chosenIndices.Count);
  temp := 0;
  for item in chosenIndices do begin
    try
      arr[temp] := StrToInt(sgENServicesCost.Cells[0, item]);
      temp := temp + 1;
    except
      on EConvertError do Exit;
    end;
  end;

  if Length(arr) = 1 then begin
    msgResult := 'Розрахунок видалено';
    calcCost := TempENServicesCost.getObject(arr[0]);
    if Application.MessageBox(PChar(Format('Ви дійсно бажаєте видалити розрахунок на дату %s?', [XSDate2String(calcCost.dateGen)])),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then begin
      TempENServicesCost.remove(arr[0]);
      Self.updateENServicesCost;
      Self.updateSumsIfNeeded;
        Application.MessageBox(PChar(msgResult), PChar('Повідомлення'), MB_ICONINFORMATION);
    end;
  end else begin
    msgResult := 'Розрахунки видалено';
    if Application.MessageBox(PChar(Format('Ви дійсно бажаєте видалити %d розрахунки (-ів)?', [Length(arr)])),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then begin
      TempENServicesCost.remove(arr);
      Self.updateENServicesCost;
      Self.updateSumsIfNeeded;
        Application.MessageBox(PChar(msgResult), PChar('Повідомлення'), MB_ICONINFORMATION);
    end;
  end;
end;

procedure TfrmENServicesShiftEdit.actDeleteIncomeExecute(Sender: TObject);
var
  ObjCode: Integer;
  TempENActIncomeServices: ENActIncomeServicesControllerSoapPort;
begin
  inherited;
  TempENActIncomeServices := HTTPRIOENActIncomeServices as ENActIncomeServicesControllerSoapPort;
  try
    ObjCode := StrToInt(sgENActIncomeServices.Cells[0,sgENActIncomeServices.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Прибутковий акт за договором послуг на сторону)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENActIncomeServices.remove(ObjCode);
    pcCalculationChange(Sender);
  end;
end;

procedure TfrmENServicesShiftEdit.btnPrintFactCalcClick(
  Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  if (ENServicesShiftObj.calcTypeRef.code <> ENSERVICESOBJECT_CALCTYPE_BY_FACT) then Exit;

  /////
  if ENServicesShiftObj.contractStatusRef = nil then Exit;

  if ENServicesShiftObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////
    
  ///// 14.05.13 NET-4235
  // Печать расчета - только при статусах "Работы выполнены" и "Оплаченный"
  if (ENServicesShiftObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_COMPLETED) and
     (ENServicesShiftObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_PAID) then
    raise Exception.Create('NET-4235 Для друку розрахунку остаточної вартості договір повинен мати статус "Роботи виконані" або "Сплачений"!');
  /////

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'servicesObjectCode';
  args[0] := IntToStr(ENServicesShiftObj.code);

  reportName := '201109/ActCalcAdditionalWorkG_NKRE/ActCalc_ServicesFactCalc';

  makeReport(reportName, argNames, args, 'xls');
end;


procedure TfrmENServicesShiftEdit.btnPrintRegistryClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
begin
  if DialogState = dsInsert then Exit;

  frmENDateRangeWithDepartment := TfrmENDateRangeWithDepartment.Create(Application, dsInsert);
  try
    // По дефолту предлагаем сформировать за предыдущий месяц
    frmENDateRangeWithDepartment.dtpDateFrom.Date := DateUtils.StartOfTheMonth(IncMonth(Date, -1));
    frmENDateRangeWithDepartment.dtpDateTo.Date := DateUtils.EndOfTheMonth(IncMonth(Date, -1));

    if frmENDateRangeWithDepartment.ShowModal = mrOk then
    begin
      /////// Parameters
      SetLength(argNames, 4);
      SetLength(args, 4);

      argNames[0] := 'servicesObjectCode';
      args[0] := IntToStr(ENServicesShiftObj.code);

      argNames[1] := 'dateStart';
      args[1] := DateToStr(frmENDateRangeWithDepartment.dtpDateFrom.Date);

      argNames[2] := 'dateFinal';
      args[2] := DateToStr(frmENDateRangeWithDepartment.dtpDateTo.Date);

      argNames[3] := 'departmentCode';
      args[3] := IntToStr(frmENDateRangeWithDepartment.departmentCode);
      ///////

      makeReport('Services/4Supplier/registryForSupplier', argNames, args, 'xls');
    end;
  finally
    frmENDateRangeWithDepartment.Free;
  end;
end;

procedure TfrmENServicesShiftEdit.btnPrintTechAgreementClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
begin
  inherited;
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'servicesObjectCode';
  args[0] := IntToStr(ENServicesShiftObj.code);

  reportName := 'TechConditions/TechAgreement/agree';
  makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmENServicesShiftEdit.prepareActionsCustomerMaterialsTransfer(fkOrder : RQFKOrder = nil);
begin
  if not Assigned(fkOrder) then fkOrder := getSelectedActCustomerMaterialsTransfer;

  DisableActions([actActCustomerMaterialsTransferCreate, actActCustomerMaterialsTransferUndoCreate
      , actActCustomerMaterialsTransferMove, actActCustomerMaterialsTransferUnMove]);
    HideActions([actActCustomerMaterialsTransferCreate, actActCustomerMaterialsTransferUndoCreate
      , actActCustomerMaterialsTransferMove, actActCustomerMaterialsTransferUnMove]);

  if not Assigned(fkOrder) then Exit;


  DisableActions([actActCustomerMaterialsTransferMove]
  , (fkOrder.status.code <> RQFKORDER_STATUS_CREATED));
  HideActions([actActCustomerMaterialsTransferMove]
  , (fkOrder.status.code <> RQFKORDER_STATUS_CREATED));

    DisableActions([actActCustomerMaterialsTransferUnMove], (fkOrder.status.code <> RQFKORDER_STATUS_IN_FK));
  HideActions([actActCustomerMaterialsTransferUnMove], (fkOrder.status.code <> RQFKORDER_STATUS_IN_FK));


  DisableActions([actActCustomerMaterialsTransferUndoCreate], (fkOrder.status.code <> RQFKORDER_STATUS_CREATED));
  HideActions([actActCustomerMaterialsTransferUndoCreate], (fkOrder.status.code <> RQFKORDER_STATUS_CREATED));

  DisableActions([actActCustomerMaterialsTransferCreate], (fkOrder.status.code <> RQFKORDER_STATUS_GOOD));
  HideActions([actActCustomerMaterialsTransferCreate], (fkOrder.status.code <> RQFKORDER_STATUS_GOOD));


end;

procedure TfrmENServicesShiftEdit.pmActCustomerMaterialsTransferPopup(
  Sender: TObject);
begin
  inherited;

  prepareActionsCustomerMaterialsTransfer;
end;

procedure TfrmENServicesShiftEdit.pmAdditionalAgreementsPopup(Sender: TObject);
var
  TempENAdditionalAgreement : ENAdditionalAgreementControllerSoapPort;
  ObjCode : Integer;
  additionalAgreement : ENAdditionalAgreement;
  isSigned : Boolean;
begin
  inherited;
  TempENAdditionalAgreement := HTTPRIOENAdditionalAgreement as ENAdditionalAgreementControllerSoapPort;
  try
     ObjCode := StrToInt(sgENAdditionalAgreement.Cells[0,sgENAdditionalAgreement.Row]);
  except
   on EConvertError do Exit;
  end;
  additionalAgreement := TempENAdditionalAgreement.getObject(ObjCode);
  isSigned := (Assigned(additionalAgreement.isSigned) and additionalAgreement.isSigned.asBoolean);

  actAdditionalAgreementSign.Visible := not isSigned;
  actAdditionalAgreementUnsign.Visible := isSigned;
end;

procedure TfrmENServicesShiftEdit.pmPlansPopup(Sender: TObject);
var
  plan : ENPlanWork;
  planCode, elementType : Integer;
begin
  inherited;

  DisableActions([actClosePlan, actConfirm, actPreConfirm], False);
  HideActions([actClosePlan, actConfirm, actPreConfirm], False);

  try
    planCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  plan := DMReports.getPlanByCode(planCode);
  if plan = nil then
  begin
    Exit;
  end;

  miClosePlan.Caption := 'Затвердити План';

  if plan.kind.code = ENPLANWORKKIND_CURRENT then
     miClosePlan.Caption := 'Скласти Завдання ПЛАН'
  else
  if plan.kind.code = ENPLANWORKKIND_NPZ then
     miClosePlan.Caption := 'Скласти Завдання ФАКТ'
  else
  if plan.kind.code = ENPLANWORKKIND_FACT then
     miClosePlan.Caption := 'Затвердити Факт, для якого не потрібно формувати Акт ...';//'Затвердити ФАКТ';

  actClosePlan.Enabled := //(plan.kind.code <> ENPLANWORKKIND_FACT) and
                          (
                             ( plan.status.code = ENPLANWORKSTATUS_GOOD) or ( plan.kind.code = ENPLANWORKKIND_CURRENT)
                             // для статусов на корректировке - ограничим на сервере ... and (plan.status.code <> ENPLANWORKSTATUS_PRECONFIRMED)
                           );

  actClosePlan.Visible := actClosePlan.Enabled;

  // полуУтверждение .. Утверждение .. Отмена Утверждения ....
  actPreConfirm.Enabled := (plan.kind.code = ENPLANWORKKIND_CURRENT) and (plan.status.code = ENPLANWORKSTATUS_GOOD);

  actConfirm.Enabled := (plan.kind.code = ENPLANWORKKIND_CURRENT) and
                         (
                           (plan.status.code = ENPLANWORKSTATUS_PRECONFIRMED)
                           //or (plan.status.code = ENPLANWORKSTATUS_GOOD)
                          );

  if (plan.kind.code = ENPLANWORKKIND_CURRENT)  then
  begin
    actUndoConfirm.Enabled := (plan.kind.code = ENPLANWORKKIND_CURRENT) and
                         (
                           (plan.status.code = ENPLANWORKSTATUS_PRECONFIRMED)
                            or
                            (plan.status.code = ENPLANWORKSTATUS_LOCKED)
                           /////
                          );
  end else
  begin
    actUndoConfirm.Enabled := ((plan.kind.code = ENPLANWORKKIND_YEAR) and (plan.yearGen = ENPLANWORK_YEAR_GOOD));
  end;


  if (plan.typeRef.code in [ENPLANWORKTYPE_SERVICES_FROM_SIDE, ENPLANWORKTYPE_SERVICES_FROM_SIDE_INVEST]) then
  begin
    DisableActions([actClosePlan, actConfirm, actPreConfirm]);
    HideActions([actClosePlan, actConfirm, actPreConfirm]);
  end;

end;


procedure TfrmENServicesShiftEdit.popupMenuPrintCostPopup(Sender: TObject);
var TempENServices2CalcAdditionalItems: ENServices2CalcAdditionalItemsControllerSoapPort;
  ENServices2CalcAdditionalItemsList: ENServices2CalcAdditionalItemsShortList;
  CAIFilter :  ENServices2CalcAdditionalItemsFilter;
begin
  inherited;
  TempENServices2CalcAdditionalItems := HTTPRIOENServices2CalcAdditionalItems as ENServices2CalcAdditionalItemsControllerSoapPort;
  CAIFilter := ENServices2CalcAdditionalItemsFilter.Create;
  SetNullIntProps(CAIFilter);
  SetNullXSProps(CAIFilter);
  CAIFilter.servicesObjectRef := ENServicesObjectRef.Create;
  CAIFilter.servicesObjectRef.code := ENServicesShiftObj.code;
  ENServices2CalcAdditionalItemsList := TempENServices2CalcAdditionalItems.getScrollableFilteredList(CAIFilter,0,-1);

  actPrintAdditionalItems.Enabled := ENServices2CalcAdditionalItemsList.totalCount <> 0;
end;

procedure TfrmENServicesShiftEdit.actConfirmExecute(Sender: TObject);
var
  planCode : Integer;
  TempENPlanWork : ENPlanWorkControllerSoapPort;
begin
  inherited;

  try
   planCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
   on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте ЗАТВЕРДИТИ НПЗ ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    TempENPlanWork.confirm(planCode);

    Application.MessageBox(PChar('План затверджено ...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    actUpdateExecute(Sender);
  end;
end;


procedure TfrmENServicesShiftEdit.actCreateNewPostingsExecute(Sender: TObject);
var
billCode, payment2soCode : Integer;
begin

  ENSOPayBillProvObj := ENSOPayBillProv.Create;
  ENSOPayBillProvObj.soRef := ENServicesObjectRef.Create;
  ENSOPayBillProvObj.soRef.code := ENServicesShiftObj.code;
  ENSOPayBillProvObj.code := LOW_INT;

  try
     billCode := StrToInt(sgENSOBill.Cells[0,sgENSOBill.Row]);
   except
   on EConvertError do Exit;
   end;

   ENSOPayBillProvObj.soBillRef := ENSOBillRef.Create;
   ENSOPayBillProvObj.soBillRef.code := billCode;

try
    frmPostings4BillEdit := TfrmPostings4BillEdit.Create(Application, dsInsert);

    try
      if frmPostings4BillEdit.ShowModal = mrOk then
      begin
         updateProvs(Sender);
        end;

    finally
      frmPostings4BillEdit.Free;
      frmPostings4BillEdit := nil;
    end;

  finally
    ENSOPayBillProvObj.Free;
  end;

end;

procedure TfrmENServicesShiftEdit.actCreatePlanFromENServicesCostExecute(
  Sender: TObject);
begin
  inherited;
  generatePlans(true);
end;


procedure TfrmENServicesShiftEdit.actActCustomerMaterialsTransferPrintExecute(
  Sender: TObject);
var
  fkOrder : RQFKOrder;
begin

  fkOrder := getSelectedActCustomerMaterialsTransfer;
  EditRQFKOrder.printReportRQFKOrderActCustomerMaterialsTransfer(fkOrder);
end;

procedure TfrmENServicesShiftEdit.actInsertCAIExecute(Sender: TObject);
// Var TempENServices2CalcAdditionalItems: ENServices2CalcAdditionalItemsControllerSoapPort;
begin
  // TempENServices2CalcAdditionalItems := HTTPRIOENServices2CalcAdditionalItems as ENServices2CalcAdditionalItemsControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENServices2CalcAdditionalItemsObj:=ENServices2CalcAdditionalItems.Create;
  SetNullIntProps(ENServices2CalcAdditionalItemsObj);
  SetNullXSProps(ENServices2CalcAdditionalItemsObj);

   ENServices2CalcAdditionalItemsObj.servicesObjectRef := ENServicesObjectRef.Create;
   ENServices2CalcAdditionalItemsObj.servicesObjectRef.code := ENServicesShiftObj.code;

  try
    frmENServices2CalcAdditionalItemsEdit:=TfrmENServices2CalcAdditionalItemsEdit.Create(Application, dsInsert);
    try
      if frmENServices2CalcAdditionalItemsEdit.ShowModal = mrOk then
      begin
        if ENServices2CalcAdditionalItemsObj<>nil then
            //TempENServices2CalcAdditionalItems.add(ENServices2CalcAdditionalItemsObj);
            actUpdateCAIExecute(Sender);
            Self.updateSumsIfNeeded;
      end;
    finally
      frmENServices2CalcAdditionalItemsEdit.Free;
      frmENServices2CalcAdditionalItemsEdit:=nil;
    end;
  finally
    ENServices2CalcAdditionalItemsObj.Free;
  end;
end;


procedure TfrmENServicesShiftEdit.actInsertIncomeExecute(Sender: TObject);
var
  actIncomeServicesCode: Integer;
  TempENActIncomeServices: ENActIncomeServicesControllerSoapPort;
begin
  inherited;
  actIncomeServicesCode := Low(Integer);
  if ENServicesShiftObj = nil then Exit;
  if ENServicesShiftObj.code = Low(Integer) then Exit;

  ENActIncomeServicesObj := ENActIncomeServices.Create;
  ENActIncomeServicesObj.servicesObjectRef := ENServicesObjectRef.Create;
  ENActIncomeServicesObj.servicesObjectRef.code := ENServicesShiftObj.code;

  try
    frmENActIncomeServicesEdit := TfrmENActIncomeServicesEdit.Create(Application, dsInsert);
    frmENActIncomeServicesEdit.edtNumberGen.Text :=
      ENServicesShiftObj.contractNumberServices + '/' + ENServicesShiftObj.contractNumber;
    //DisableControls([frmENActIncomeServicesEdit.edtNumberGen]);
    try
      if frmENActIncomeServicesEdit.ShowModal = mrOk then
      begin
        actIncomeServicesCode := frmENActIncomeServicesEdit.actIncomeServicesCode;
        if (ENActIncomeServicesObj <> nil) then
          pcCalculationChange(Sender);
      end;
    finally
      frmENActIncomeServicesEdit.Free;
      frmENActIncomeServicesEdit:=nil;
    end;
  finally
    ENActIncomeServicesObj.Free;
  end;

  if (actIncomeServicesCode <> Low(Integer)) then
  begin
    TempENActIncomeServices := HTTPRIOENActIncomeServices as ENActIncomeServicesControllerSoapPort;
    try
      ENActIncomeServicesObj := TempENActIncomeServices.getObject(actIncomeServicesCode);
    except
      on EConvertError do Exit;
    end;

    frmENActIncomeServicesEdit := TfrmENActIncomeServicesEdit.Create(Application, dsView);

    try
      frmENActIncomeServicesEdit.ShowModal;
    finally
      frmENActIncomeServicesEdit.Free;
      frmENActIncomeServicesEdit:=nil;
    end;
  end;
end;

procedure TfrmENServicesShiftEdit.actInsertPaymentExecute(
  Sender: TObject);
  var billCode : Integer;
begin
  inherited;
   ENPayment2SOObj:=ENPayment2SO.Create;

   ENPayment2SOObj.dateGen:= TXSDate.Create;
   ENPayment2SOObj.sumTotal:= TXSDecimal.Create;
   ENPayment2SOObj.sumGen:= TXSDecimal.Create;
   ENPayment2SOObj.sumVat:= TXSDecimal.Create;

   ENPayment2SOObj.servicesObjectRef := ENServicesObjectRef.Create;
   ENPayment2SOObj.servicesObjectRef.Code :=  ENServicesShiftObj.code;

   try
     billCode := StrToInt(sgENSOBill.Cells[0,sgENSOBill.Row]);
   except
   on EConvertError do Exit;
   end;

   ENPayment2SOObj.soBillRef := ENSOBillRef.Create;
   ENPayment2SOObj.soBillRef.code := billCode;

  try
		frmENPayment2SOEdit:=TfrmENPayment2SOEdit.Create(Application, dsInsert);
		frmENPayment2SOEdit.calctyperefcode :=  ENServicesShiftObj.calcTypeRef.code;
    try
      if frmENPayment2SOEdit.ShowModal = mrOk then
      begin
        if ENPayment2SOObj<>nil then
            pcCalculationChange(Self);
      end;
    finally
      frmENPayment2SOEdit.Free;
      frmENPayment2SOEdit:=nil;
    end;
  finally
    ENPayment2SOObj.Free;
  end;
end;

procedure TfrmENServicesShiftEdit.actLinkWithPlanExecute(Sender: TObject);
Var
TempENPlanWork : ENPlanWorkControllerSoapPort;
planFilter : ENPlanWorkFilter;
plan : ENPlanWork;
begin

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  planFilter := ENPlanWorkFilter.Create;
  SetNullIntProps(planFilter);
  SetNullXSProps(planFilter);


  planFilter.kind := ENPlanWorkKind.Create;
  planFilter.kind.code := ENConsts.ENPLANWORKKIND_FACT;

  planFilter.status := ENPlanWorkStatus.Create();
  planFilter.status.code := ENPLANWORKSTATUS_GOOD;

  try
    frmENPlanWorkShow := TfrmENPlanWorkShow.Create(Application, fmNormal, planFilter);

    DisableActions([ frmENPlanWorkShow.actInsert, frmENPlanWorkShow.actEdit, frmENPlanWorkShow.actDelete,
                       frmENPlanWorkShow.actFilter, frmENPlanWorkShow.actNoFilter, frmENPlanWorkShow.actAddPlanItems
                      ]);
      frmENPlanWorkShow.sgENPlanWork.PopupMenu := nil;
      frmENPlanWorkShow.viewPlanWork:=1;
      frmENPlanWorkShow.isFiltered := false;

      if frmENPlanWorkShow.ShowModal = mrOk then
      begin

      plan:= TempENPlanWork.getObject(StrToInt( frmENPlanWorkShow.GetReturnValue(frmENPlanWorkShow.sgENPlanWork,0)));
        if (plan<>nil) then begin
           TempENPlanWork.addPlan2ShiftLineServices(plan,ENServicesShiftObj.code);
        end;

        actUpdateExecute(Sender);
      end;
    finally
      frmENPlanWorkShow.Free;
      frmENPlanWorkShow:=nil;
    end;
end;

procedure TfrmENServicesShiftEdit.actDeletePaymentExecute(
  Sender: TObject);
Var TempENPayment2SO: ENPayment2SOControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPayment2SO := HTTPRIOENPayment2SO as ENPayment2SOControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPayment2SO.Cells[0,sgENPayment2SO.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Оплати по договору ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPayment2SO.remove(ObjCode);
      pcCalculationChange(Self);
  end;
end;

procedure TfrmENServicesShiftEdit.actEditPaymentExecute(
  Sender: TObject);
Var TempENPayment2SO: ENPayment2SOControllerSoapPort;
begin
 TempENPayment2SO := HTTPRIOENPayment2SO as ENPayment2SOControllerSoapPort;
   try
     ENPayment2SOObj := TempENPayment2SO.getObject(StrToInt(sgENPayment2SO.Cells[0,sgENPayment2SO.Row]));
   except
   on EConvertError do Exit;
  end;
	frmENPayment2SOEdit:=TfrmENPayment2SOEdit.Create(Application, dsEdit);
	frmENPayment2SOEdit.calctyperefcode :=  ENServicesShiftObj.calcTypeRef.code;
  try
    if frmENPayment2SOEdit.ShowModal= mrOk then
      begin
        pcCalculationChange(Self);
      end;
  finally
    frmENPayment2SOEdit.Free;
    frmENPayment2SOEdit:=nil;
  end;
end;

procedure TfrmENServicesShiftEdit.ActViewPaymentExecute(
  Sender: TObject);
Var TempENPayment2SO: ENPayment2SOControllerSoapPort;
begin
 TempENPayment2SO := HTTPRIOENPayment2SO as ENPayment2SOControllerSoapPort;
   try
     ENPayment2SOObj := TempENPayment2SO.getObject(
       StrToInt(sgENPayment2SO.Cells[0, sgENPayment2SO.Row]));
   except
   on EConvertError do Exit;
  end;
	frmENPayment2SOEdit := TfrmENPayment2SOEdit.Create(Application, dsView);
	frmENPayment2SOEdit.calctyperefcode := ENServicesShiftObj.calcTypeRef.code;
  try
    frmENPayment2SOEdit.ShowModal;

  finally
    frmENPayment2SOEdit.Free;
    frmENPayment2SOEdit := nil;
  end;
end;


procedure TfrmENServicesShiftEdit.updateActIncome(reset : Boolean = true);
var
  i, pageNum, startPoint, LastRow : Integer;
  TempENActIncomeServices: ENActIncomeServicesControllerSoapPort;
  ENActIncomeServicesList: ENActIncomeServicesShortList;
  actIncomeFilter: ENActIncomeServicesFilter;
begin
  DisableActions([actInsertIncome, actEditIncome, actDeleteIncome], False);

  if reset then begin
    sgENActIncomeServices.Clear;
    sgENActIncomeServices.RowCount := 2;
    SetGridHeaders(ENActIncomeServicesHeaders, sgENActIncomeServices.ColumnHeaders);
    pageNum := 0;
    startPoint := 1;
  end else begin
    pageNum := Trunc(sgENActIncomeServices.RowCount / PAGE_SIZE);
    startPoint := sgENActIncomeServices.RowCount;
    if (sgENActIncomeServices.RowCount - 1) Mod PAGE_SIZE <> 0 then begin
      Exit;
    end;
    if (sgENActIncomeServices.TopRow + sgENActIncomeServices.VisibleRowCount) < pageNum * PAGE_SIZE then Exit;
  end;

  TempENActIncomeServices := HTTPRIOENActIncomeServices as ENActIncomeServicesControllerSoapPort;

  actIncomeFilter := ENActIncomeServicesFilter.Create;
  SetNullIntProps(actIncomeFilter);
  SetNullXSProps(actIncomeFilter);
  actIncomeFilter.orderBySQL := 'dategen DESC';
  actIncomeFilter.servicesObjectRef := ENServicesObjectRef.Create;
  actIncomeFilter.servicesObjectRef.code := ENServicesShiftObj.code;

  ENActIncomeServicesList := TempENActIncomeServices.getScrollableFilteredList(actIncomeFilter, pageNum * PAGE_SIZE, PAGE_SIZE);

  sgENActIncomeServices.RowCount := sgENActIncomeServices.RowCount + ENActIncomeServicesList.totalCount;
  if (reset) and (ENActIncomeServicesList.totalCount > 0) then
    sgENActIncomeServices.RowCount := sgENActIncomeServices.RowCount - 1;


   with sgENActIncomeServices do
    for i:=0 to ENActIncomeServicesList.totalCount - 1 do
      begin
        Application.ProcessMessages;
        LastRow := i + startPoint;

        if ENActIncomeServicesList.list[i].code <> Low(Integer) then
          Cells[0, LastRow] := IntToStr(ENActIncomeServicesList.list[i].code)
        else
          Cells[0, LastRow] := '';

        Cells[1, LastRow] := ENActIncomeServicesList.list[i].numberGen;

        if ENActIncomeServicesList.list[i].dateGen = nil then
          Cells[2, LastRow] := ''
        else
          Cells[2, LastRow] := XSDate2String(ENActIncomeServicesList.list[i].dateGen);

        if ENActIncomeServicesList.list[i].actDateStart = nil then
          Cells[3, LastRow] := ''
        else
          Cells[3, LastRow] := XSDate2String(ENActIncomeServicesList.list[i].actDateStart);

        if ENActIncomeServicesList.list[i].actDateEnd = nil then
          Cells[4, LastRow] := ''
        else
          Cells[4, LastRow] := XSDate2String(ENActIncomeServicesList.list[i].actDateEnd);

        if ENActIncomeServicesList.list[i].summaGen = nil then
          Cells[5, LastRow] := ''
        else
          Cells[5, LastRow] := ENActIncomeServicesList.list[i].summaGen.DecimalString;

        if ENActIncomeServicesList.list[i].summaVat = nil then
          Cells[6, LastRow] := ''
        else
          Cells[6, LastRow] := ENActIncomeServicesList.list[i].summaVat.DecimalString;

        Cells[7, LastRow] := ENActIncomeServicesList.list[i].statusRefName;
      end;

      if reset then sgENActIncomeServices.Row := startPoint
      else sgENActIncomeServices.Row := startPoint - 1;


end;

initialization

servicesContractKindCodes := TList<Integer>.Create;
servicesContractKindCodes.AddRange([
//   SERVICES_CONTRACT_KIND_COMPANY_OBJ
//  , SERVICES_CONTRACT_KIND_CUSTOMER_OBJ
    SERVICES_CONTRACT_KIND_REMOVAL_LINE_RM_KB
  , SERVICES_CONTRACT_KIND_SERVICES_LUZOD_ASKOE
  , SERVICES_CONTRACT_KIND_INFORMATIONAL
  , SERVICES_CONTRACT_KIND_OTHER_NOT_LICENSED]);

finalization

if Assigned(servicesContractKindCodes) then servicesContractKindCodes.Free;
if Assigned(planCodes) then planCodes.Free;


end.

