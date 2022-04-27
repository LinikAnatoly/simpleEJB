unit EditENServicesCalculation;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ShellAPI,
    EnergyproController, EnergyproController2, ENServicesObjectController, ENPlanWorkController,
    ExtCtrls, TB2Item, TB2Dock, TB2Toolbar , ShowENServicesCalculation, ENTechConditionsServicesController,
    Planner, ENDelayServicesController , AdvObj,
    ENTransferDate2ServicesObjectController,
    ENDocAttachment2ENServicesObjectController, ENDocAttachmentController,
    EditDFDocAttachment, ENDocAttachmentStatusController, ENServicesObject2FKInfoController,
    EditENServicesObject2FKInfo, ENPlanWork2ClassificationTypeController , CCRecordPointController,
    IdFTP, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
    IdExplicitTLSClientServerBase ;


type tpTechCardCalculation = record
  calcSystemCode: Integer; //системный код калькляции
  calcBookkeepingCode: string; //бухгалтерский шифр калькляции
  calcTextValue: string; //содержание калькуляции в технической карте
  calcIncluded: Boolean; //участие калькуляции в плане
end;

type
  TfrmENServicesCalculationEdit = class(TDialogForm)
    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIOENServicesObject: THTTPRIO;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actUpdate: TAction;
    actFilter: TAction;
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
    grpBankRekvizit: TGroupBox;
    lblContragentBankAccount: TLabel;
    lblContragentBankName: TLabel;
    edtContragentBankAccount: TEdit;
    edtContragentBankName: TEdit;
    edtContractDateFin: TDateTimePicker;
    edtName: TEdit;
    edtPartnerCode: TEdit;
    edtFinDocCode: TEdit;
    edtDateEdit: TDateTimePicker;
    tsListWork: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton45: TToolButton;
    btnPrintContract: TButton;
    btnPrintBill: TButton;
    actPrintCalculation: TAction;
    HTTPRIOENPlanWork2ClassificationType: THTTPRIO;
    pnlDistance: TPanel;
    edtContractServicesDistance: TEdit;
    lblContractServicesDistance: TLabel;
    lblStatus: TLabel;
    edtStatus: TEdit;
    actBudgetApproved: TAction;
    tbBudgetApproved: TToolButton;
    btnInsertCalculationDevelopmentRMB: TButton;
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
    lblWarrantPosition: TLabel;
    edtWarrantFIO: TEdit;
    edtWarrantPosition: TEdit;
    lblMaxSum: TLabel;
    lblPower: TLabel;
    lblName: TLabel;
    edtMaxSum: TEdit;
    edtPower: TEdit;
    lblWarrantNumber: TLabel;
    edtWarrantNumber: TEdit;
    spbWarrantNumber: TSpeedButton;
    edtWarrantName: TMemo;
    tsActs: TTabSheet;
    Panel1: TPanel;
		sgENActIncome: TAdvStringGrid;
    Panel2: TPanel;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem8: TTBItem;
    Splitter2: TSplitter;
    sgENAct: TAdvStringGrid;
    actViewENActIncome: TAction;
    actViewENAct: TAction;
    actUpdateENActIncome: TAction;
    actUpdateENAct: TAction;
    HTTPRIOENAct: THTTPRIO;
    lblCode: TLabel;
    edtCode: TEdit;
    gbCNData: TGroupBox;
    chkTU: TCheckBox;
    gbWarrantContrAgent: TGroupBox;
    edtWarrantContrAgentNumber: TEdit;
    edtWarrantContrAgentFIO: TEdit;
    edtWarrantContrAgentDate: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ToolButton3: TToolButton;
    actPrintKoshtoris: TAction;
    pmPlanWork2ClassificationType: TPopupMenu;
    miPrintCalcNkre: TMenuItem;
    actPrintCalcNkre: TAction;
    cbbBasisType: TComboBox;
    lblBasisType: TLabel;
    btnPostings: TButton;
    HTTPRIOTKClassificationType: THTTPRIO;
    lblContragentAddressWork: TLabel;
    edtContragentAddressWork: TMemo;
    tsEstimateItems: TTabSheet;
    tlb1: TToolBar;
    btn1: TToolButton;
    btn2: TToolButton;
    btn3: TToolButton;
    btn4: TToolButton;
    btn5: TToolButton;
    btn6: TToolButton;
    
    btn7: TToolButton;
    sgENEstimateItem: TAdvStringGrid;
    HTTPRIOENEstimateItem: THTTPRIO;
    lblContragentPosition: TLabel;
    edtContragentPosition: TEdit;
    edtExecuteWorkDate: TDateTimePicker;
    lblExecuteWorkDate: TLabel;
    lblTimeStart: TLabel;
    edtTimeStart: TDateTimePicker;
    edtTimeFinal: TDateTimePicker;
    edtContragentPhoneNumber: TEdit;
    lbl1: TLabel;
    lblTimeStart2: TLabel;
    lblTimeFinal3: TLabel;
    lbl2: TLabel;
    edtExecutorPhoneNumber: TEdit;
    HTTPRIOTKClassification2ENDepartment: THTTPRIO;
    pnl1: TPanel;
    spl1: TSplitter;
    pnl2: TPanel;
    sgENPlanWork2ClassificationType: TAdvStringGrid;
    spl2: TSplitter;
    sgENPlanWorkItem: TAdvStringGrid;
    pnl3: TPanel;
    edtReservedDate: TDateTimePicker;
    lbl3: TLabel;
    lbl4: TLabel;
    edtReservedTimeStart: TDateTimePicker;
    lbl5: TLabel;
    lbl6: TLabel;
    edtReservedTimeFinal: TDateTimePicker;
    lbl7: TLabel;
    sgDepartment: TAdvStringGrid;
    lbl8: TLabel;
    edtDepartmentForServices: TEdit;
    btnENDepartmentDepartment: TSpeedButton;
    HTTPRIOTKVirtualBrigade: THTTPRIO;
    Planner1: TPlanner;
    btnInsertExecuteDate: TButton;
    actInsertTimeLine: TAction;
    lbl9: TLabel;
    sgBrigadeInDepartment: TAdvStringGrid;
    HTTPRIOENTimeLine: THTTPRIO;
    HTTPRIOENDeliveryTimePlan: THTTPRIO;
    lblDeliveryTimeTo: TLabel;
    lblDeliveryTimeFrom: TLabel;
    edtDeliveryTimeTo: TDateTimePicker;
    edtDeliveryTimeFrom: TDateTimePicker;
    btnRemoveExecutedDate: TButton;
    lblDeliveryOneWay: TLabel;
    btnFindTime: TButton;
    lblContragentObjectWork: TLabel;
    edtContragentObjectWork: TEdit;
    HTTPRIOENTechConditionsObjects: THTTPRIO;
    Label6: TLabel;
    rgPayable: TRadioGroup;
    chbIsCustomerMaterials: TCheckBox;
    gbActTransfer: TGroupBox;
    Label7: TLabel;
    edtActTransferNumber: TEdit;
    Label8: TLabel;
    dtpActTransferDate: TDateTimePicker;
    TBToolbar2: TTBToolbar;
    actActTransferSave: TAction;
    actActTransferPrint: TAction;
    actActTransferMoveToFK: TAction;
    actActTransferUnMoveToFK: TAction;
    TBItem9: TTBItem;
    TBItem10: TTBItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    sgCustomerMaterialsFin: TAdvStringGrid;
    HTTPRIOFINMaterials: THTTPRIO;
    tsCounters: TTabSheet;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    sgENClassificationsWithCounters: TAdvStringGrid;
    ToolBar3: TToolBar;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    sgENGiveCounter: TAdvStringGrid;
    HTTPRIOENGiveCounter: THTTPRIO;
    lblENResponsible: TLabel;
    edtENResponsible: TEdit;
    spbENResponsible: TSpeedButton;
    actViewCounter: TAction;
    actInsertCounter: TAction;
    actDeleteCounter: TAction;
    actEditCounter: TAction;
    actUpdateCounters: TAction;
    pmCounters: TPopupMenu;
    N5: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    edtENResponsiblePosition: TEdit;
    btnActPriPerCounters: TButton;
    lblCNPack: TLabel;
    edtCNPackCode: TEdit;
    spbCNPack: TSpeedButton;
    memCNSubsystem: TMemo;
    lblEPVoltageNominalVoltagenominalName: TLabel;
    edtEPVoltageNominalVoltagenominalName: TEdit;
    spbEPVoltageNominalVoltagenominal: TSpeedButton;
    HTTPRIOCNTechTerms: THTTPRIO;
    tsPriconnection: TTabSheet;
    gb4: TGroupBox;
    gbAdditional: TGroupBox;
    lblENTechConditionsServicesTypeTechCondServicesTypeName: TLabel;
    lblCommentServicesGen: TLabel;
    lblENTechContragentFormContragentFormName: TLabel;
    edtENTechConditionsServicesTypeTechCondServicesTypeName: TEdit;
    Memo1: TMemo;
    cbbENTechContragentFormContragentFormName: TComboBox;
    gbGeneral: TGroupBox;
    lbltysummagen: TLabel;
    lbltysummavat: TLabel;
    lblTyServicesPower: TLabel;
    lblTyServicesSumma: TLabel;
    edtTySummaVat: TEdit;
    edtTySummaGen: TEdit;
    edtTyServicesPower: TEdit;
    edtTyServicesSumma: TEdit;
    gbConnectionTariff: TGroupBox;
    spbConnectionTariffValus: TSpeedButton;
    edtConnectionTariffName: TEdit;
    edtConnectionTariffValue: TEdit;
    Label20: TLabel;
    edtResponsiblePerson: TEdit;
    lblExecutionTerm: TLabel;
    edtExecutionTerm: TEdit;
    lblContractDateFinal: TLabel;
    edtContractDateFinal: TDateTimePicker;
    cbBuildersArea: TCheckBox;
    gbPriconnectionData: TGroupBox;
    lblConnectionPowerPlaces: TLabel;
    spbENElement: TSpeedButton;
    btnCalculatePaySum: TButton;
    btnPrintCalculate: TButton;
    edtENElementName: TEdit;
    alContragents: TActionList;
    actViewContragent: TAction;
    actInsertContragent: TAction;
    actDeleteContragent: TAction;
    actEditContragent: TAction;
    actUpdateContragent: TAction;
    actENActIncomeTechConditionsPrint: TAction;
    gbContragents: TGroupBox;
    pnlContragents: TPanel;
    sgENContragent: TAdvStringGrid;
    tlb3: TToolBar;
    btnView1: TToolButton;
    btnInsert: TToolButton;
    btnDelete: TToolButton;
    btnEdit: TToolButton;
    btnUpdate: TToolButton;
    HTTPRIOENTechConditionsServices: THTTPRIO;
    HTTPRIOENElement: THTTPRIO;
    HTTPRIOENConnectionTariff: THTTPRIO;
    HTTPRIOENConnectionTariffEntry: THTTPRIO;
    HTTPRIOENTechCondResponsibles: THTTPRIO;
    HTTPRIOENPriconnectionData: THTTPRIO;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Label9: TLabel;
    sgENSelectedPlanItems: TAdvStringGrid;
    ToolButton16: TToolButton;
    HTTPRIOENContragent: THTTPRIO;
    chbIsSea: TCheckBox;
    alPlans: TActionList;
    actViewPlan: TAction;
    actInsertPlan: TAction;
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
    pmPlanWorkItems: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    actEditENPlanWorkItem: TAction;
    actInsertCalculation: TAction;
    actInsertEstimateItem: TAction;
    actDeleteCalculation: TAction;
    actDeleteEstimateItem: TAction;
    actEditCalculation: TAction;
    actEditEstimateItem: TAction;
    btnPrintBillForPrepayment: TButton;
    btnPrintFactCalc: TButton;
    chkBaseStation: TCheckBox;
    cbSmallArchFrm: TCheckBox;
		actViewUnitedGroup: TAction;
    HTTPRIOENUnitedGroupConnections: THTTPRIO;
    HTTPRIOENSubstation04: THTTPRIO;
    HTTPRIOENUnitedGroup2TechCondServices: THTTPRIO;
    actEditUnitedGroup: TAction;
    actUpdateUnitedGroup: TAction;
    pmUnitedGroups: TPopupMenu;
    miAddUnitedGroups: TMenuItem;
    aUnitedGroups: TActionList;
    actAddUnitedGroup: TAction;
    actDeleteUnitedGroup: TAction;
    miDeleteUnitedGroups: TMenuItem;
    actAddToExistGroup: TAction;
    miAddToExistGroup: TMenuItem;
    tsPayment: TTabSheet;
    HTTPRIOENPayment2SO: THTTPRIO;
    ActionListPayment: TActionList;
    ActViewPayment: TAction;
    actInsertPayment: TAction;
    actDeletePayment: TAction;
    actEditPayment: TAction;
    actUpdatePayment: TAction;
    actFilterPayment: TAction;
    actNoFilterPayment: TAction;
    PopupMenuPayment: TPopupMenu;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    
    sgENPayment2SO: TAdvStringGrid;
    ToolBarPayment: TToolBar;
    btnViewPayment: TToolButton;
    btnInsertPayment: TToolButton;
    btnDeletePayment: TToolButton;
    btnEditPayment: TToolButton;
    btnUpdatePayment: TToolButton;
    tsDelay: TTabSheet;
    Panel4: TPanel;
    ToolBar5: TToolBar;
    ToolButton17: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    sgENDelayServices: TAdvStringGrid;
    HTTPRIOENDelayServices: THTTPRIO;
    PopupMenu2: TPopupMenu;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    alDelay: TActionList;
    actViewDelay: TAction;
    actInsertDelay: TAction;
    actDeleteDelay: TAction;
    actEditDelay: TAction;
    actUpdateDelay: TAction;
    ImageList2: TImageList;
    gbReconnectionTU: TGroupBox;
    cbIsReconnection: TCheckBox;
    edtPersonalAccountNumber: TEdit;
    lblPersonalAccount: TLabel;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    chbIsNewConnection: TCheckBox;
    lblIsNewConnection: TLabel;
    lblIsReconnection: TLabel;
    gbTransferDate: TGroupBox;
    HTTPRIOENTransferDate2ServicesObject: THTTPRIO;
    lblIssueDate: TLabel;
    edtIssueDate: TDateTimePicker;
    lblReturnDate: TLabel;
    edtReturnDate: TDateTimePicker;
    btnSaveENTransferDate: TButton;
    HTTPRIOTKTransport: THTTPRIO;
    tsENDocAttachment: TTabSheet;
    actAttachment: TActionList;
    actAddAttachments: TAction;
    actLoadAttachments: TAction;
    actDeleteAttachments: TAction;
    actEditAttachments: TAction;
    ImageList3: TImageList;
    ToolBar6: TToolBar;
    ToolButton26: TToolButton;
    btnAddAttachments: TToolButton;
    ToolButton28: TToolButton;
    ToolButton29: TToolButton;
    sgENDocAttachment: TAdvStringGrid;
    HTTPRIOENDocAttachment: THTTPRIO;
    lblPayInfo: TLabel;
    N11: TMenuItem;
    miAddActFailure: TMenuItem;
    actAddActFailure: TAction;
    actDeleteActFailure: TAction;
    actEditActFailure: TAction;
    miDeleteActFailure: TMenuItem;
    miEditActFailure: TMenuItem;
    HTTPRIOENPlanWork2ActFailure: THTTPRIO;
    sgENActFailure: TAdvStringGrid;
    lblActFailure: TLabel;
    HTTPRIOENActFailure: THTTPRIO;
    actEditAct: TAction;
    btnValidateProfitability: TButton;
    cbCountersZoneType: TComboBox;
    lblCountersZoneType: TLabel;
    btnSetBuhStatus: TButton;
    tsCounterForService: TTabSheet;
    sgSCCounter: TAdvStringGrid;
    HTTPRIOSCCounter: THTTPRIO;
    edtCustomPlanDate: TDateTimePicker;
    actInsertCalculationDevelopmentRMB: TAction;
    actInsertCalculationConcordanceRMB: TAction;
    btnInsertCalculationConcordanceRMB: TButton;
    HTTPRIOTKFINWorkType: THTTPRIO;
    Label11: TLabel;
    lblKVED: TLabel;
    ToolBar7: TToolBar;
    ToolButton27: TToolButton;
    ToolButton30: TToolButton;
    aCounter: TActionList;
    actUnbindCounterToServicesObject: TAction;
    actBindCounterToServicesObject: TAction;
    tsCalcItems: TTabSheet;
    ToolBar8: TToolBar;
    ToolButton31: TToolButton;
    ToolButton32: TToolButton;
    ToolButton33: TToolButton;
    ToolButton34: TToolButton;
    ToolButton35: TToolButton;
    sgENServices2CalcAdditionalItems: TAdvStringGrid;
    HTTPRIOENServices2CalcAdditionalItems: THTTPRIO;
    alCalcAdditionalItems: TActionList;
    actViewCAI: TAction;
    actInsertCAI: TAction;
    actDeleteCAI: TAction;
    actEditCAI: TAction;
    actUpdateCAI: TAction;
    pmCalcAdditionalItems: TPopupMenu;
    MenuItem11: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    tsServicesObject2FKInfo: TTabSheet;
    ToolBar9: TToolBar;
    ToolButton36: TToolButton;
    btnInsertService2FKInfo: TToolButton;
    btnDeleteService2FKInfo: TToolButton;
    btnEditService2FKInfo: TToolButton;
    ToolButton40: TToolButton;
    ToolButton41: TToolButton;
    ToolButton42: TToolButton;
    ImageListService2FKInfo: TImageList;
    ActionListService2FKInfo: TActionList;
    actViewService2FKInfo: TAction;
    actInsertService2FKInfo: TAction;
    actDeleteService2FKInfo: TAction;
    actEditService2FKInfo: TAction;
    actUpdateService2FKInfo: TAction;
    PopupMenuService2FKInfo: TPopupMenu;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    sgENServicesObject2FKInfo: TAdvStringGrid;
    HTTPRIOENServicesObject2FKInfo: THTTPRIO;
    btnPhoneFormat: TSpeedButton;
    sgENActIncomeServices: TAdvStringGrid;
    actlstActs: TActionList;
    actViewIncome: TAction;
    actInsertIncome: TAction;
    actDeleteIncome: TAction;
    actEditIncome: TAction;
    actUpdateIncome: TAction;
    TBToolbar3: TTBToolbar;
    TBItem13: TTBItem;
    TBItem14: TTBItem;
    TBItem16: TTBItem;
    TBItem17: TTBItem;
    HTTPRIOENActIncomeServices: THTTPRIO;
    gbActIncomeCreatMetod: TGroupBox;
    btnChangeCreatMetod: TButton;
    cbActIncomeCreatMetod: TComboBox;
    actChangeCreatMetod: TAction;
    lbleic: TLabel;
    edteic: TEdit;
    spbeic: TSpeedButton;
    HTTPRIOCCRecordPoint: THTTPRIO;
    IdFTP1: TIdFTP;
    tsServicesConsumer: TTabSheet;
    sgDocumentManagement: TAdvStringGrid;
    HTTPRIODFDocServicesConsumer: THTTPRIO;
    actViewServicesConsumer: TAction;
    gbServicesInfo: TGroupBox;
    edtRegionalType: TComboBox;
    lblRegionalType: TLabel;
    edtContractServicesDay: TEdit;
    Label1: TLabel;
    edtContractServicesPower: TEdit;
    lblContractServicesPower: TLabel;
    edtContractServicesSumma: TEdit;
    lblContractServicesSumma: TLabel;
    edtCommentServicesGen: TMemo;
    lblPriConnectionNumber: TLabel;
    spbTechConditions: TSpeedButton;
    edtTechConditionsNumber: TEdit;
    lblTechConditionsNumber: TLabel;
    edtTechConditionsDate: TDateTimePicker;
    Label5: TLabel;
    Label10: TLabel;
    edtEmail: TEdit;
    btnSaveWarrant: TButton;
    HTTPRIOENWarrant: THTTPRIO;
    spbChoosePersonalInfo: TSpeedButton;
    HTTPRIOENRecordPointByt: THTTPRIO;
    HTTPRIOENRecordPointProm: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);

  procedure btnENDepartmentDepartmentClick(Sender : TObject);
  procedure btnENElementElementClick(Sender : TObject);
    procedure btnContractNumberSelectClick(Sender: TObject);
    procedure spbContractNumberSelectClick(Sender: TObject);
    procedure spbENDepartmentDepartmentClick(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure pcCalculationChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actPrintCalculationExecute(Sender: TObject);
    procedure btnPrintContractClick(Sender: TObject);
    procedure btnPrintBillClick(Sender: TObject);
    procedure actBudgetApprovedExecute(Sender: TObject);
    procedure actUpdateObject(Sender: TObject);
    //procedure Button1Click(Sender: TObject);
    procedure spbWarrantNumberClick(Sender: TObject);
    procedure actViewENActExecute(Sender: TObject);
    procedure edtContractServicesPowerChange(Sender: TObject);
    procedure actPrintKoshtorisExecute(Sender: TObject);
    procedure actPrintCalcNkreExecute(Sender: TObject);
    procedure cbbBasisTypeChange(Sender: TObject);
    procedure btnPostingsClick(Sender: TObject);
    procedure updateRezervedView();
    procedure RenderPlanner();

    procedure sgDepartmentClick(Sender: TObject);
    procedure btnInsertExecuteDateClick(Sender: TObject);
    procedure sgBrigadeInDepartmentClick(Sender: TObject);
    procedure sgBrigadeInDepartmentCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sgDepartmentCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure edtReservedTimeStartChange(Sender: TObject);

    function getSumTimeWorkForCalculation(codePlan : Integer):Double;
    procedure edtReservedTimeStartExit(Sender: TObject);
    procedure edtReservedDateExit(Sender: TObject);
    function checkOtherTimeLine():Boolean ;
    procedure edtReservedDateChange(Sender: TObject);
    procedure btnRemoveExecutedDateClick(Sender: TObject);
    procedure btnFindTimeClick(Sender: TObject);
    procedure chkTUClick(Sender: TObject);
    procedure rgContragentTypeClick(Sender: TObject);
    procedure spbTechConditionsClick(Sender: TObject);
    procedure chbIsCustomerMaterialsClick(Sender: TObject);
    procedure actActTransferSaveExecute(Sender: TObject);
    procedure actActTransferPrintExecute(Sender: TObject);
    procedure actActTransferMoveToFKExecute(Sender: TObject);
    procedure actActTransferUnMoveToFKExecute(Sender: TObject);
    procedure actUpdateCountersExecute(Sender: TObject);
    procedure actInsertCounterExecute(Sender: TObject);
    procedure actEditCounterExecute(Sender: TObject);
    procedure actDeleteCounterExecute(Sender: TObject);
    procedure actViewCounterExecute(Sender: TObject);
    procedure sgENClassificationsWithCountersClick(Sender: TObject);
    procedure spbENResponsibleClick(Sender: TObject);
    procedure btnActPriPerCountersClick(Sender: TObject);
    procedure spbCNPackClick(Sender: TObject);
    procedure spbEPVoltageNominalVoltagenominalClick(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure actUpdateContragentExecute(Sender: TObject);
    procedure btnCalculatePaySumClick(Sender: TObject);
    procedure btnPrintCalculateClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sgENPlanWorkClick(Sender: TObject);
    procedure actViewContragentExecute(Sender: TObject);
    procedure actInsertContragentExecute(Sender: TObject);
    procedure actDeleteContragentExecute(Sender: TObject);
    procedure actEditContragentExecute(Sender: TObject);
    procedure spbConnectionTariffValusClick(Sender: TObject);
    procedure sgENPlanWorkRightClickCell(Sender: TObject; ARow,
      ACol: Integer);
    procedure edtTyServicesPowerChange(Sender: TObject);
    procedure actEditPlanExecute(Sender: TObject);
    procedure actViewPlanExecute(Sender: TObject);
    procedure actInsertPlanExecute(Sender: TObject);
    procedure actDeletePlanExecute(Sender: TObject);
    procedure actClosePlanExecute(Sender: TObject);
    procedure actUnClosePlanExecute(Sender: TObject);
    procedure actFinishPlanExecute(Sender: TObject);
    procedure actUndoFinishPlanExecute(Sender: TObject);
    procedure actEditENPlanWorkItemExecute(Sender: TObject);
    procedure actInsertCalculationExecute(Sender: TObject);
    procedure actInsertEstimateItemExecute(Sender: TObject);
    procedure actDeleteCalculationExecute(Sender: TObject);
    procedure actDeleteEstimateItemExecute(Sender: TObject);
    procedure actEditCalculationExecute(Sender: TObject);
    procedure actEditEstimateItemExecute(Sender: TObject);
    procedure cbBuildersAreaClick(Sender: TObject);
    procedure btnPrintFactCalcClick(Sender: TObject);
    procedure btnPrintBillForPrepaymentClick(Sender: TObject);
    procedure cbSmallArchFrmClick(Sender: TObject);
    procedure chkBaseStationClick(Sender: TObject);
    procedure actInsertPaymentExecute(Sender: TObject);
    procedure actEditPaymentExecute(Sender: TObject);
    procedure actDeletePaymentExecute(Sender: TObject);
    procedure ActViewPaymentExecute(Sender: TObject);
    procedure actInsertDelayExecute(Sender: TObject);
    procedure actDeleteDelayExecute(Sender: TObject);
    procedure actEditDelayExecute(Sender: TObject);
    procedure actViewDelayExecute(Sender: TObject);
    procedure cbIsReconnectionClick(Sender: TObject);
    procedure chbIsNewConnectionClick(Sender: TObject);
    procedure cbIsReconnectionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSaveENTransferDateClick(Sender: TObject);
    procedure actAddAttachmentsExecute(Sender: TObject);
    procedure actLoadAttachmentsExecute(Sender: TObject);
    procedure actDeleteAttachmentsExecute(Sender: TObject);
    procedure sgENDocAttachmentDblClick(Sender: TObject);
    procedure actAddActFailureExecute(Sender: TObject);
    procedure actEditActFailureExecute(Sender: TObject);
    procedure actDeleteActFailureExecute(Sender: TObject);
    procedure actEditActExecute(Sender: TObject);
    procedure btnValidateProfitabilityClick(Sender: TObject);
    procedure btnSetBuhStatusClick(Sender: TObject);
    procedure actInsertCalculationDevelopmentRMBExecute(Sender: TObject);
    procedure actInsertCalculationConcordanceRMBExecute(Sender: TObject);
    procedure actBindCounterToServicesObjectExecute(Sender: TObject);
    procedure actUnbindCounterToServicesObjectExecute(Sender: TObject);
    procedure actUpdateCAIExecute(Sender: TObject);
    procedure actInsertCAIExecute(Sender: TObject);
    procedure actViewCAIExecute(Sender: TObject);
    procedure actDeleteCAIExecute(Sender: TObject);
    procedure actEditCAIExecute(Sender: TObject);
    procedure actViewService2FKInfoExecute(Sender: TObject);
    procedure actInsertService2FKInfoExecute(Sender: TObject);
    procedure actDeleteService2FKInfoExecute(Sender: TObject);
    procedure actUpdateService2FKInfoExecute(Sender: TObject);
    procedure actEditService2FKInfoExecute(Sender: TObject);
    procedure btnPhoneFormatClick(Sender: TObject);
    procedure TBItem13Click(Sender: TObject);
    procedure actViewIncomeExecute(Sender: TObject);
    procedure actInsertIncomeExecute(Sender: TObject);
    procedure actDeleteIncomeExecute(Sender: TObject);
    procedure actEditIncomeExecute(Sender: TObject);
    procedure sgENActIncomeServicesDblClick(Sender: TObject);
    procedure actChangeCreatMetodExecute(Sender: TObject);
    procedure cbActIncomeCreatMetodChange(Sender: TObject);
    procedure spbeicClick(Sender: TObject);
    procedure lblIsNewConnectionClick(Sender: TObject);
    procedure lblIsReconnectionClick(Sender: TObject);
    procedure setReadMode(Sender: TObject);
    procedure loadServicesConsumer(Sender: TObject);
    procedure actViewServicesConsumerExecute(Sender: TObject);
    procedure sgDocumentManagementDblClick(Sender: TObject);
    procedure clearWarrantData();
    procedure btnSaveWarrantClick(Sender: TObject);
    procedure spbChoosePersonalInfoClick(Sender: TObject);

  private
    { Private declarations }
    ENTransferDate2ServicesObjectObj : ENTransferDate2ServicesObject;

    requiredEIC: Boolean;
    showTransportRoute : Boolean;
    isVisitClient : Boolean;
    // Передача счетчика абонентом на баланс предприятия
    isGiveCounterToBalance : Boolean;
		isJobsByTime  : Boolean;
		substation04Code : Integer;
    // Переменная, кот. указывает можно ли по открытому договору определить
    // биллинговый IP-адрес
    isAvailableBillingIPAddress : Boolean;
    // Есть ли в договоре работа по присоединению
    isWorkConnection : Boolean;
    // Есть ли в договоре работа по замене счетчика (переход на многотарифный учет)
    replaceCounter : Boolean;
    // Есть ли в договоре работа по параметризации счетчика (переход на многотарифный учет)
    parameterizationCounter : Boolean;
    // Есть ли в договоре работа использующая пломбы
    isContainsKSU : Boolean;

    // Есть ли в договоре работа по проектированию внутренних сетей
    innerNetProject : Boolean;
    checkWarrant: Boolean;
    changeActIncomeCreatMetod: Boolean;

    ENTechConditionsServicesObj: ENTechConditionsServices;

    procedure SetFormCaption(elementCode: Integer);

    procedure SetActTransferVisibilityByStatus(servicesObjectStatus: Integer);
    procedure updateCustomerMaterialsFinGrid;

    function CheckCountersByClassifications(): Boolean;
    procedure SetCountersVisibility();

    //procedure LoadENTechConditionsServicesObj(ENTechConditionsServicesObj: ENTechConditionsServices);
    procedure LoadENTechConditionsServices();
    function FillENTechConditionsServices(): boolean;
    procedure calcSum();

    //function getContragentsCount(techConditionsServicesCode: Integer): Integer;
    function getContragentsCount(): Integer;

    procedure plansPopup(plan: ENPlanWork);

    procedure initializeConnectionsCheckBoxes();
    procedure showHidePersonalAccountFields();
    function isAvailableBillingIP(departmentRefCode : Integer) : Boolean;

    procedure updateActFailure();
    procedure techCardCalculationGroupInsert ( //Добавление группы калькуляций
      vTechCardCalculation: array of tpTechCardCalculation);
    procedure LoadActIncome();

    function checkChangeActIncomeCreatMetod() : Boolean;

    { 06.07.2018 Получить лист калькуляций для текущего договора }
    function getCalculationList : ENPlanWork2ClassificationTypeShortList;
    { 06.07.2018 Возвращает true если хотя бы одна калькуляция
    по договору рассчитывается по новому}
    function isTKCalcKindNew : Boolean;

    function getReconnectionTUVisibility(contragentTypeCode: Integer): Boolean;
    procedure setPersonalServicesInfo(personalInfo : PersonalServicesInfo);
    function getBytOrProm : Boolean;
  public
    { Public declarations }
		planCode : Integer;
    DepartmentForServicesCode : Integer;
    tempDeliveryOneWay : Integer;

    //PRIC-155
    contNumServ: String;
    priconnections : Boolean;
		isNotCalculated : Boolean;
  end;



var
  frmENServicesCalculationEdit: TfrmENServicesCalculationEdit;
  ENServicesObjectObj: ENServicesObject;

  isReimbursement: Boolean = False;
  selectedRow : Integer;

	accBudgetString: array [1..5] of String = ('3521', '3522', '3541', '3542', '3717');

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

  ENActHeaders: array [1..6] of String =
        ( 'Код'
          ,'Номер акту'
          ,'Дата акту'
          ,'ФИО мола с фин.кол.'
          ,'Тип'
          ,'Статус'
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

  ENGiveCounterHeaders: array [1..4] of String =
        ( 'Код'
          ,'Тип лічильника'
          ,'Заводський № лічильника'
          ,'Примітка'
        );

  ENGiveCounterHeadersForIncome: array [1..9] of String =
        ( 'Код'
          ,'Тип лічильника'
          ,'Заводський № лічильника'
          ,'Вартість'
          ,'Вартість з ПДВ'
          ,'МВО для оприбуткування'
          ,'Фазність'
          ,'Дата виготовлення'
          ,'Примітка'
        );

   ENContragentHeaders: array [1..16] of String =
  ( 'Код'
    ,'Замовник'
    ,'Адреса замовника'
    ,'Адрес места проведения работ'
    ,'Посада замовника'
    ,'ОКПО(ІПН) замовника'
    ,'Розрахунковий рахунок замовника'
    ,'Найменування банку замовника'
    ,'МФО банку замовника'
    ,'Керівник'
    ,'Паспортні дані замовника'
    ,'Дата довіреності замовника'
    ,'№ довіреності замовника'
    ,'П.І.Б довіреної особи замовника'
    ,'Паспортні дані довіреної особи замовника'
    ,'Адреса довіреної особи замовника'
  );

  ENUnitedGroup2TechCondServicesHeaders: array [1..41] of String =
        ( 'Код'
          ,'Код договору'
          ,'Замовник'
          ,'№ з.п. / № дог. фін.кол.'
          ,'Потужність, кВ'
          ,'інв. № лінії 0,4 кВ'
          ,'Назва лінії 0,4 кВ'
          ,'Влін (індивідуальна), тис. грн.'
          ,'№ групи (ділянка 1)'
          ,'Опис групи (ділянка 1)'
          ,'Влін (ділянка 1), тис. грн.'
          ,'№ групи (ділянка 2)'
          ,'Опис групи (ділянка 2)'
          ,'Влін (ділянка 2), тис. грн.'
          ,'№ групи (ділянка 3)'
          ,'Опис групи (ділянка 3)'
          ,'Влін (ділянка 3), тис. грн.'
          ,'№ групи (ТП 10/0,4 кВ)'
          ,'Опис групи (ТП 10/0,4 кВ)'
          ,'інв. № ТП 10/0,4 кВ'
          ,'Назва ТП 10/0,4 кВ'
          ,'інв. № лінії 6-10 кВ'
					,'Назва лінії 6-10 кВ'
          ,'Влін (індивідуальна), тис. грн.'
          ,'№ групи (ділянка 1)'
          ,'Опис групи (ділянка 1)'
          ,'Влін (ділянка 1), тис. грн.'
          ,'№ групи (ділянка 2)'
          ,'Опис групи (ділянка 2)'
          ,'Влін (ділянка 2), тис. грн.'
          ,'№ групи (ділянка 3)'
          ,'Опис групи (ділянка 3)'
          ,'Влін (ділянка 3), тис. грн.'
          ,'№ групи (ділянка 4)'
          ,'Опис групи (ділянка 4)'
          ,'Влін (ділянка 4), тис. грн.'
          ,'№ групи ПС 35'
          ,'Опис групи (ПС 35 кВ)'
          ,'інв. № ПС 35 кВ'
          ,'Назва ПС 35 кВ'
          ,'Вартість приєднання, тис. грн.'
        );
        
  iColCount, iLastCount, ColCount, LastCount, LastRow : Integer;

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

     ENDelayServicesHeaders: array [1..7] of String =
        ( 'Код'
          ,'Дата начала задержки'
          ,'Дата окончания задержки'
          ,'Количество календар. дней'
          ,'Количество рабоч. дней'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );


     ENDocAttachmentHeaders: array [1..7] of String =
            ( 'Код'
              ,'Коментар до вкладення'
              ,'Посилання на файл'
              ,'Користувач, що додав вкладення'
              ,'Дата додавання'
              ,'Користувач, що змінив вкладення'
              ,'Дата зміни'
            );

  iLastRow: Integer = 1;


  ENActFailureHeaders: array [1..8] of String =
        ( 'Код'
          ,'Номер акта'
          ,'Дата акту'
          ,'Коментар '
          ,'Користувач, що додав акт'
          ,'Дата додавання'
          ,'Користувач, який змінив акт'
          ,'Дата зміни'
        );

        SCCounterHeaders: array [1..7] of String =
        (  'Інв. номер'
          ,'Найменування  лічільника'
          ,'Заводский номер'
          ,'код МОЛа'
          ,'Найменування МОЛа'
          ,'счет'
          ,'Примітка'
        );

  CAIColCount, CAILastCount: Integer;
  CAILastRow: Integer = 1;
  ENServices2CalcAdditionalItemsHeaders: array [1..5] of String =
        ( 'Код'
          , 'Найменування пункту розрахунку'
          ,'Сумма'
          ,'кол-во'
          ,'Примечание'
        );


  ENServicesObject2FKInfoHeaders: array [1..3] of String =
  ( 'Код'
    ,'Прибутковий акт '
    ,'Вид послуг на сторону(шаблон проводок ФК)'
  );

  DocumentManagementHeaders: array [1..11] of String =
    ( 'Код'
      ,'Документ'
      ,'Дата реєстрації'
      ,'Опис документа'
      ,'Замовник'
      ,'Адреса'
      ,'о/р'
      ,'№ договору'
      ,'Підрозділ'
      ,'Поточний стан завдання'
      ,'Тип споживача'
    );



const
  UNITEDGROUPL04D1_COL_NUMBER = 8;   // № столбца '№ групи (ділянка 1) линии 0,4'
  UNITEDGROUPL04D2_COL_NUMBER = 11;  // № столбца '№ групи (ділянка 2) линии 0,4''
  UNITEDGROUPL04D3_COL_NUMBER = 14;  // № столбца '№ групи (ділянка 3) линии 0,4''
  UNITEDGROUPTP04_COL_NUMBER = 17;   // № столбца групи (ТП 10/0,4 кВ)
  UNITEDGROUPL10D1_COL_NUMBER = 24;  // № столбца '№ групи (ділянка 1) линии 6-10'
  UNITEDGROUPL10D2_COL_NUMBER = 27;  // № столбца '№ групи (ділянка 2) линии 6-10'
  UNITEDGROUPL10D3_COL_NUMBER = 30;  // № столбца '№ групи (ділянка 3) линии 6-10'
  UNITEDGROUPL10D4_COL_NUMBER = 33;  // № столбца '№ групи (ділянка 4) линии 6-10'
  UNITEDGROUPPS35_COL_NUMBER = 36;   // № столбца групи (ПС 35 кВ)

implementation

uses
  ShowENDepartment, ENDepartmentController, ShowENElement, ENElementController,
  DMReportsUnit, ShowFINServicesObject, ENConsts,
  ENServicesContragentTypeController, ENServicesContractTypeController,
  EditENPlanWorkItem, ENPlanWorkItemController, ENEstimateItemController,
  {ENPlanWorkController, }EditENPlanWork2ClassificationType, ENServicesContractStatusController,
  ShowENWarrant, ENWarrantController,
  EditENPlanWork, ENPlanWorkKindController, ENActController, EditENAct,
  EditPostings, TKClassificationTypeController, ENEstimateItemKindController,
  EditENEstimateItem , TKClassification2ENDepartmentController,
  TKVirtualBrigadeController , ENTimeLineController,
  DateUtils , ENDeliveryTimePlanController, ENTechConditionsObjectsController, 
  ShowENTechConditionsObjects, FINMaterialsController,
  FINMaterialsStatusController, ENGiveCounterController, EditENGiveCounter,
  ShowFINWorker, FINWorkerController, CNPackController, ShowCNPack,
  CNSubsystemTypeController, Globals, ShowEPVoltageNominal,
  CNTechTermsController, EditENPriconnectionData,
  ENPriconnectionDataController, ENConnectionTariffController,
  ENConnectionTariffEntryController, ENTechCondResponsiblesController,
  ENContragentController, ENPlanWorkFormController, EditENContragent,
  ENTechContragentFormController, ENTechContragentTypeController,
  ShowENConnectionTariff, EntechConditionsServicesEditSumBill,
	{EditENUnitedGroupConnections, }
  EditENUnitedGroup2TechCondServices, ENUnitedGroupConnectionsController,
	ENSubstation04Controller, EditAddUnitedGroup, Contnrs, ShowENUnitedGroupConnections,
	ENPayment2SOController  , EditENPayment2SO, EditENDelayServices,
  ENDepartment2EPRenController, TKTransportController,
  ENPlanWork2ActFailureController, EditENPlanWork2ActFailure,
  ENActFailureController, SCCounterController, TechCardCalculationGroup,
  ENSettingsConsts, TKFINWorkTypeController, ShowScanCounters, ScanCountersController,
  ENServices2CalcAdditionalItemsController, EditENServices2CalcAdditionalItems,
  ENPlanWorkClose, PhoneFormatter,
  ENActIncomeServicesController, EditENActIncomeServices, ShowCCRecordPointLite,
  ENDocAttachmentServerController
  , DFDocServicesConsumerController
  , EditDFDocServicesConsumer
  , DFDocServicesConsumerKindController
  , Main
  , ShowENRecordPointByt, ENRecordPointBytController
  , ShowENRecordPointProm, ENRecordPointPromController
  , EditBindCounterToENServicesObject
  , SCMolController
;



{$R *.dfm}


var vCnSubsystemTypeRefCode: Integer;

function TfrmENServicesCalculationEdit.isTKCalcKindNew : Boolean;
var
ENPlanWork2ClassificationTypeList : ENPlanWork2ClassificationTypeShortList;
ENPlanWork2ClassificationTypeShortObj : ENPlanWork2ClassificationTypeShort;
res_ : Boolean;
begin
    ENPlanWork2ClassificationTypeList := Self.getCalculationList;
    res_ := false;
    for ENPlanWork2ClassificationTypeShortObj in ENPlanWork2ClassificationTypeList.list do begin
      if ENPlanWork2ClassificationTypeShortObj.calcKindRefCode in [TKCALCKIND_NEW, TKCALCKIND_NEW2]  then begin
        res_ := true;
	      Break;
      end;
    end;
    Result := res_;
end;

procedure TfrmENServicesCalculationEdit.lblIsNewConnectionClick(
  Sender: TObject);
begin
  chbIsNewConnection.Checked := not chbIsNewConnection.Checked;
end;

procedure TfrmENServicesCalculationEdit.lblIsReconnectionClick(Sender: TObject);
begin
  cbIsReconnection.Checked := not cbIsReconnection.Checked;
end;

function TfrmENServicesCalculationEdit.getCalculationList : ENPlanWork2ClassificationTypeShortList;
var
  ENPlanWork2ClassificationTypeList : ENPlanWork2ClassificationTypeShortList;
  TempENPlanWork2ClassificationType : ENPlanWork2ClassificationTypeControllerSoapPort;
  plan2ctFilter : ENPlanWork2ClassificationTypeFilter;
begin
    if planCode = LOW_INT then Exit;

    TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;

    plan2ctFilter := ENPlanWork2ClassificationTypeFilter.Create;
    SetNullIntProps(plan2ctFilter);
    SetNullXSProps(plan2ctFilter);

    if priconnections then
    begin
      plan2ctFilter.conditionSQL := 'planrefcode in (select p.code from enplanwork p where p.elementrefcode = ' +
        IntToStr(ENServicesObjectObj.element.code) + ' and p.kindcode = ' + IntToStr(ENPLANWORKKIND_CALCULATION) + ')';
    end
    else begin
      plan2ctFilter.planRef := ENPlanWorkRef.Create;
      plan2ctFilter.planRef.code := planCode;
    end;

    ENPlanWork2ClassificationTypeList := TempENPlanWork2ClassificationType.getScrollableFilteredList(plan2ctFilter, 0, -1);

  Result := ENPlanWork2ClassificationTypeList;
end;

procedure TfrmENServicesCalculationEdit.updateActFailure();
var
  TempENActFailure: ENActFailureControllerSoapPort;
  i: Integer;
  ENActFailureList: ENActFailureShortList;
  actFailFilter : ENActFailureFilter;
  begin

  ClearGrid(sgENActFailure);
  SetGridHeaders(ENActFailureHeaders, sgENActFailure.ColumnHeaders);
  ColCount:=100;
  TempENActFailure :=  HTTPRIOENActFailure as ENActFailureControllerSoapPort;

  actFailFilter := ENActFailureFilter.Create;
  SetNullIntProps(actFailFilter);
  SetNullXSProps(actFailFilter);

  actFailFilter.conditionSQL := ' code in ( ' +
             'select p2f.actfailurerefcode from enplanwork2actfailure p2f where p2f.planrefcode in (' +
             'select p.code from enplanwork p where p.elementrefcode = (' +
             'select so.elementcode from enservicesobject so where so.code = ' + IntToStr(ENServicesObjectObj.code) + ')))';

  ENActFailureList := TempENActFailure.getScrollableFilteredList(actFailFilter,0,ColCount);


  LastCount:=High(ENActFailureList.list);

  if LastCount > -1 then
     sgENActFailure.RowCount:=LastCount+2
  else
     sgENActFailure.RowCount:=2;

   with sgENActFailure do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActFailureList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENActFailureList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENActFailureList.list[i].numberGen;
        if ENActFailureList.list[i].dateAct = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDateTimeWithDate2String(ENActFailureList.list[i].dateAct);
        Cells[3,i+1] := ENActFailureList.list[i].commentGen;
        Cells[4,i+1] := ENActFailureList.list[i].userAdd;
        if ENActFailureList.list[i].dateAdd = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDateTimeWithDate2String(ENActFailureList.list[i].dateAdd);
        Cells[6,i+1] := ENActFailureList.list[i].userGen;
        if ENActFailureList.list[i].dateEdit = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDateTimeWithDate2String(ENActFailureList.list[i].dateEdit);
        LastRow:=i+1;
        sgENActFailure.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENActFailure.Row:=1;
end;


procedure TfrmENServicesCalculationEdit.FormShow(Sender: TObject);
var
  warrant : ENWarrant;
  TempENPlanWork2ClassificationType: ENPlanWork2ClassificationTypeControllerSoapPort;
  plan2ctFilter: ENPlanWork2ClassificationTypeFilter;
  plan2ctList: ENPlanWork2ClassificationTypeShortList;
  TempTKClassificationType: TKClassificationTypeControllerSoapPort;
  ctObj: TKClassificationType;
  TempTKFINWorkType: TKFINWorkTypeControllerSoapPort;

  TempTKClassification2ENDepartment: TKClassification2ENDepartmentControllerSoapPort;
  TempTKClassification2ENDepartmentFilter : TKClassification2ENDepartmentFilter;
  TempTKClassification2ENDepartmentList : TKClassification2ENDepartmentShortList;

  LastCountVb , vi, i: Integer;

  TempENTimeLine: ENTimeLineControllerSoapPort;
  ti: Integer;
  ENTimeLineList: ENTimeLineShortList;
  tempENTimeLineFilter : ENTimeLineFilter;

  TempCNTechTerms: CNTechTermsControllerSoapPort;
  CNTechTermsFilterObj: CNTechTermsFilter;
  CNTechTermsList: CNTechTermsShortList;

  TempENTechConditionsServices: ENTechConditionsServicesControllerSoapPort;
  //tcServicesObj: ENTechConditionsServices;
  tcServicesFilter: ENTechConditionsServicesFilter;
  tcServicesArr: ENTechConditionsServicesController.ArrayOfInteger;

  TempENServicesObject : ENServicesObjectControllerSoapPort;

  TempENTransferDate2ServicesObject : ENTransferDate2ServicesObjectControllerSoapPort;
  ENTransferDate2ServicesObjectList : ENTransferDate2ServicesObjectShortList;
  transferDate2ServicesObjectFilter : ENTransferDate2ServicesObjectFilter;
  transferArr : ENTransferDate2ServicesObjectController.ArrayOfInteger;
  usersAllowedToChangeDateOnInsert : TStringList;
  paySum : Double;
begin

  btnSaveWarrant.Visible := False;
  DisableControls([ edteic ]);

  // изменение метода формирования доходного акта возможно до передачи проводок
  // и при отсутствии нескольких доходных актов
  if (DialogState = dsView) or (DialogState = dsEdit) then
    changeActIncomeCreatMetod := checkChangeActIncomeCreatMetod();


  tsServicesConsumer.TabVisible := False;
  tsCalcItems.TabVisible := (DialogState <> dsInsert);
  tsCounterForService.TabVisible := False;
  tsDelay.TabVisible := False;
  tsPayment.TabVisible := False; // вкладку с оплатами не показываем (отобразим если надо ниже)
  chkTU.Visible := (not priconnections);
  tsPriconnection.TabVisible := priconnections;

  lblCountersZoneType.Visible := False;
  cbCountersZoneType.Visible := False;

  tsENDocAttachment.TabVisible := False;

  lblPayInfo.Visible := False;

  DisableActions([actInsertIncome, actEditIncome, actDeleteIncome]);

  usersAllowedToChangeDateOnInsert := TStringList.Create;
  usersAllowedToChangeDateOnInsert.CommaText := DMReports.getSettingValueByKey(ENSettingsConsts.USERS_ALLOWED_TO_CHANGE_DATE_WHEN_INSERTING_CONTRACTS);

  if ((usersAllowedToChangeDateOnInsert.IndexOf(HTTPRIOENServicesObject.HTTPWebNode.UserName) <> -1) and (DialogState = dsInsert)) then
  HideControls([edtCustomPlanDate],false);

  if priconnections then
  begin
    DisableControls([spbCNPack]);
    checkWarrant := false;
	end;

	HideControls([lblContractServicesSumma, edtContractServicesSumma], priconnections);

  isJobsByTime:= False;
  isVisitClient:= False;
  if not (EditENServicesCalculation.isReimbursement or chkTU.Checked) then
	  DepartmentForServicesCode := -1;
	SetGridHeaders(ENPlanWorkItemHeaders, sgENPlanWorkItem.ColumnHeaders);
	SetGridHeaders(TKClassificationTypeHeaders, sgENPlanWork2ClassificationType.ColumnHeaders);
  SetGridHeaders(ENPlanWorkHeaders, sgENPlanWork.ColumnHeaders);
  SetGridHeaders(ENActHeaders, sgENAct.ColumnHeaders);
  SetGridHeaders(ENActIncomeHeaders, sgENActIncome.ColumnHeaders);
	SetGridHeaders(CustomerFINMaterialsShortHeaders, sgCustomerMaterialsFin.ColumnHeaders);
  SetGridHeaders(TKClassificationTypeHeaders, sgENClassificationsWithCounters.ColumnHeaders);
  SetGridHeaders(ENPlanWorkItemHeaders, sgENSelectedPlanItems.ColumnHeaders);

  SetGridHeaders(ENDocAttachmentHeaders, sgENDocAttachment.ColumnHeaders);
  
  DisableControls([edtWarrantNumber, edtWarrantFIO, edtWarrantPosition,
    edtWarrantName, edtPower, edtMaxSum, edtFinDocID, edtContractServicesSumma,
    edtName, edtPartnerCode, edtContractNumber, edtContractDateFin,
    edtCommentGen, edtTechConditionsDate, edtCNPackCode, memCNSubsystem,
    {chkBaseStation,} chbIsSea
    {,edtENResponsible}]);

  btnPrintContract.Visible := false;
  btnPrintBill.Visible := false;
  tsPlans.TabVisible := false;
  tsActs.TabVisible := false;
  tsEstimateItems.TabVisible := False;
  tsCounters.TabVisible := false;
  btnActPriPerCounters.Visible := False;

  btnPrintFactCalc.Visible := false;
  btnPrintBillForPrepayment.Visible := false;

  /////
  // NET-3079
  // chbIsCustomerMaterials.Visible := false;
  // chbIsCustomerMaterials.Visible := (HTTPRIOENServicesObject.HTTPWebNode.UserName = 'energynet');
  /////

  // DEBUG !!!!
  //btnValidateProfitability.Visible := (HTTPRIOENServicesObject.HTTPWebNode.UserName = 'energynet');

  gbActTransfer.Visible := false;

  DisableActions([actBudgetApproved]);
  tbBudgetApproved.Caption := '';
  tbBudgetApproved.ImageIndex := -1;

  SetFloatStyle([edtContractServicesSumma, edtContractServicesPower,
    edtContractServicesDay, edtEPVoltageNominalVoltagenominalName]);

//  if ENServicesObjectObj.isNoPay = ENConsts.ENSERVICESOBJECT_ISNOPAY then
//  begin
//    HideControls([Panel1, sgENActIncome]);
//  end;

  gbTransferDate.Visible := False;

  pcCalculation.ActivePage := tsGeneral;

  vCnSubsystemTypeRefCode := 0; //Инициализация
  if ENServicesObjectObj.cnSubsystemTypeRef <> nil then
    vCnSubsystemTypeRefCode := ENServicesObjectObj.cnSubsystemTypeRef.code;
  
  if (DialogState = dsInsert) and (vCnSubsystemTypeRefCode <> SS_REIMBURSEMENT)
  then    
    begin //и не Возмещение затрат по выносу
      pcCalculation.ActivePage := tsListWork;
      tsGeneral.TabVisible := False;
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
      , spbTechConditions
      , spbENResponsible
      , spbCNPack
      , chkBaseStation
      , edtEPVoltageNominalVoltagenominalName
      , spbEPVoltageNominalVoltagenominal
      , spbChoosePersonalInfo
      , spbeic
      //, gbActTransfer
      //, btnActTransferSave
      //, btnActTransferMoveToFK
      //, btnCalculatePaySum
      //, btnPrintCalculate
       ]);

    DisableActions([{actInsert, actEdit, actDelete, } actFilter, actNoFilter,
                    {actEditPlan, }actBudgetApproved]);

    DisableActions([actInsertCounter, actEditCounter, actDeleteCounter]);

    DisableControls([edtActTransferNumber, dtpActTransferDate], false);

    DisableActions([actInsertContragent, actEditContragent, actDeleteContragent]);

    DisableActions([actInsertEstimateItem, actDeleteEstimateItem, actEditEstimateItem]);

    DisableActions([actInsertPlan, actEditPlan, actDeletePlan,
                    actClosePlan, actUnClosePlan{, actFinishPlan, actUndoFinishPlan}]);

    DisableActions([actInsertCalculation, actDeleteCalculation, actEditCalculation, actEditENPlanWorkItem]);
  end;

  DisableControls([edtENDepartmentDepartmentName, edtContractNumberServices, edtStatus]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtContractNumber
      ,edtContractDateServices
      ,edtContragentName
      ,edtENDepartmentDepartmentName
      ,edtContragentAddress
      ,edtContragentAddressWork
      ,edtFinDocID
      ,edtContractServicesDistance
      ,edtWarrantNumber
      ,edtDepartmentForServices
      ,edtPersonalAccountNumber
      ,edteic
     ]);

    SetFloatStyle([edtContractServicesDistance]);
  end;

  DisableControls([edtCode ,edtCommentGen ]);

  if (DialogState = dsEdit) then
  begin
      DisableControls([spbENDepartmentDepartment], (replaceCounter or parameterizationCounter));
      DisableControls([edtContractNumber]);
      DenyBlankValues([edtENDepartmentDepartmentName]);

      ///// 28.07.10
			if ENServicesObjectObj.finDocID = LOW_INT then
      begin
        DisableControls([{edtContractNumber, }spbContractNumberSelect], false);
        DenyBlankValues([edtContractNumber]);
      end;
      /////

      ///// 16.05.13 NET-4235
      // btnPrintFactCalc.Visible := (ENServicesObjectObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT);
      /////
  end;

  if (DialogState = dsInsert) and (vCnSubsystemTypeRefCode <> SS_REIMBURSEMENT) 
  then edtContractNumberServices.Text := 'Auto'
  else if edtContractNumberServices.Text = '' then
    edtContractNumberServices.Text := 'Auto';

  if  DialogState = dsEdit then
  begin
    if (ENServicesObjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_DRAFT) then
     begin
        actBudgetApproved.Enabled := true;
        tbBudgetApproved.Caption := 'Затвердити';
        tbBudgetApproved.ImageIndex := 0;
     end;

    if (ENServicesObjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
     begin
        actBudgetApproved.Enabled := true;
        tbBudgetApproved.Caption := 'Відмінити';
        tbBudgetApproved.ImageIndex := 0;
     end;
  end;



  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    loadServicesConsumer(Sender);

    // NET-4422... 04.02.2015... +++ работа по замене счетчика (переход на многотарифный учет)
    replaceCounter := DMReports.checkReplaceCounterServices(ENServicesObjectObj.element.code);
    // +++ работы по параметризации счетчика (переход на многотарифный учет)
    parameterizationCounter := DMReports.checkParameterizationCounterServices(ENServicesObjectObj.element.code);

    if (DialogState = dsEdit) then
      DisableControls([spbENDepartmentDepartment], (replaceCounter or parameterizationCounter));

    if (ENServicesObjectObj.contractTypeRef.code = ENSERVICESOBJECTTYPE_TU) then
      btnValidateProfitability.Visible := False;

    if (ENServicesObjectObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_CLOSED_BY_BUH) then
      DisableControls([btnPostings]);

    // NET-4425...  если договор подписан, выводим информацию об оплате
    if (ENServicesObjectObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_SIGNED) then
    begin
      paySum := DMReports.getPaySumByServicesObject(ENServicesObjectObj.code);
      if (paySum >= 0) then
      begin
        lblPayInfo.Visible := True;
        lblPayInfo.Caption := 'Сплачено: ' + FloatToStr(paySum) + ' грн.';
        lblPayInfo.Font.Color := clGreen;
      end else
      begin
        lblPayInfo.Visible := True;
        lblPayInfo.Caption := 'Оплата відсутня!!!';
        lblPayInfo.Font.Color := clRed;
      end;
    end;

    if (ENServicesObjectObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
      tsDelay.TabVisible := True;

    edtPersonalAccountNumber.Text := ENServicesObjectObj.personalAccountNumber;
    edteic.Text:= ENServicesObjectObj.codeEIC;

    if (ENServicesObjectObj.reconnectionTU = SERVICESOBJECT_RECONNECTIONTU) then
    begin
      //edtPersonalAccountNumber.Text := ENServicesObjectObj.personalAccountNumber;
      cbIsReconnection.Checked := True;
      //edteic.Text:= ENServicesObjectObj.codeEIC;
    end else
    begin
      HideControls([lblPersonalAccount, edtPersonalAccountNumber, spbChoosePersonalInfo, lbleic, edteic, spbeic]);

      if ENServicesObjectObj.reconnectionTU = SERVICESOBJECT_NEWCONNECTIONTU then
      begin
           chbIsNewConnection.Checked := true;
      end;
    end;


		if ENServicesObjectObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT then
      btnPrintBill.Caption := 'Друк остаточного рахунку'
    else
      btnPrintBill.Caption := 'Друк рахунку';

    planCode := DMReports.getPlanCodeForCalculationByElement(ENServicesObjectObj.element.code);


    // типа услуги по перевозке...
    if (planCode > LOW_INT) then
    begin
      TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;

      plan2ctFilter := ENPlanWork2ClassificationTypeFilter.Create;
      SetNullIntProps(plan2ctFilter);
      SetNullXSProps(plan2ctFilter);

      plan2ctFilter.planRef := ENPlanWorkRef.Create;
      plan2ctFilter.planRef.code := planCode;

      plan2ctList := TempENPlanWork2ClassificationType.getScrollableFilteredList(plan2ctFilter, 0, -1);

      if (plan2ctList.totalCount > 0) then
      begin
        for i := 0 to High(plan2ctList.list) do
        begin
          if (plan2ctList.list[i].classificationTypeRefCode = TKCLASSIFICATIONTYPE_TRANSIT_SERVICE) then
            showTransportRoute := True;
        end;
      end;
    end;


    if  ENServicesObjectObj.warrantRef.code <> LOW_INT then
    begin
      warrant := DMReports.getWarrantByCode(ENServicesObjectObj.warrantRef.code);

      edtWarrantNumber.Text := warrant.numbergen;
      edtWarrantFIO.Text := warrant.warrantFIO;
      edtWarrantPosition.Text := warrant.warrantPosition;
      MakeMultiline(edtWarrantName.Lines, warrant.name);
      edtPower.Text := IntToStr(warrant.power);
      edtMaxSum.Text := warrant.maxSum.DecimalString;
    end;


    if (ENServicesObjectObj.contractStatusRef.code <= 
      ENSERVICESOBJECTSTATUS_CANCELED) 
    and (vCnSubsystemTypeRefCode <> SS_REIMBURSEMENT) then    
      begin //и не Возмещение затрат по выносу
        pcCalculation.ActivePage := tsListWork;
        tsGeneral.TabVisible := False;
      end;
          
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
    isGiveCounterToBalance := TempENServicesObject.isGiveCounterOnBalanceByServicesObjectCode(ENServicesObjectObj.code);

    if Self.isGiveCounterToBalance then begin
      SetGridHeaders(ENGiveCounterHeadersForIncome, sgENGiveCounter.ColumnHeaders);
    end else begin
      SetGridHeaders(ENGiveCounterHeaders, sgENGiveCounter.ColumnHeaders);
    end;

    if (ENServicesObjectObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
    begin
       DisableControls([edtContractServicesDistance]);

       //DisableActions([actInsert, actEdit, actDelete]);
       DisableActions([actInsertCalculation, actInsertPlan, actInsertEstimateItem,
                       actEditCalculation, actEditPlan, actEditEstimateItem, actEditENPlanWorkItem,
                       actDeleteCalculation, actDeletePlan, actDeleteEstimateItem]);

       btnPrintContract.Visible := true;
       tsGeneral.TabVisible := true;
       //tsPlans.TabVisible := true;

       /////
       // Для нелицензионных работ (аренда транспорта) показываем кнопку "Друк рахунку"
       if planCode > LOW_INT then
       begin
         TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;

         plan2ctFilter := ENPlanWork2ClassificationTypeFilter.Create;
         SetNullIntProps(plan2ctFilter);
         SetNullXSProps(plan2ctFilter);

         plan2ctFilter.planRef := ENPlanWorkRef.Create;
         plan2ctFilter.planRef.code := planCode;

         plan2ctList := TempENPlanWork2ClassificationType.getScrollableFilteredList(plan2ctFilter, 0, -1);

         if plan2ctList.totalCount > 0 then
         begin
           TempTKClassificationType := HTTPRIOTKClassificationType as TKClassificationTypeControllerSoapPort;
           ctObj := TempTKClassificationType.getObject(plan2ctList.list[0].classificationTypeRefCode);
           if ctObj <> nil then
           begin
             if ctObj.isNotLicensedActivity = 1 then
             begin
               if ENServicesObjectObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT then
                 //  VS 10.12.2014 - только после подписания договора....
                 btnPrintBillForPrepayment.Visible := (ENServicesObjectObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_SIGNED)
               else
                 btnPrintBill.Visible := true;
             end;
           TempTKFINWorkType := HTTPRIOTKFINWorkType as TKFINWorkTypeControllerSoapPort;
           lblKVED.Visible := True;
           lblKVED.Caption := 'Квед - ' + TempTKFINWorkType.getObject(ctObj.finWorkType.code).kved;

           end;
         end;
       end;
       /////

       SetCountersVisibility();

       if ENServicesObjectObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT then
       begin
				 HideControls([btnPrintBill, btnPrintFactCalc],
                      (ENServicesObjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_COMPLETED) and
											(ENServicesObjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_PAID) and
											(ENServicesObjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_CLOSE));
       end;

        // 10.01.2014 NET - 4295 Открывается редактирование лицевого на форме договора
        isAvailableBillingIPAddress := Self.isAvailableBillingIP(ENServicesObjectObj.department.code);

        isWorkConnection := TempENServicesObject.checkWorks(ENServicesObjectObj.code);
        isContainsKSU := TempENServicesObject.isContainsKSU(ENServicesObjectObj.code);

        if (replaceCounter or parameterizationCounter) then
        begin
          cbCountersZoneType.ItemIndex := ENServicesObjectObj.countersZoneType - 1;

          if (cbCountersZoneType.ItemIndex > -1) then
            DisableControls([cbCountersZoneType]);
        end;

        if (replaceCounter) then
          tsCounterForService.TabVisible := True;


       // SUPP-31364
       innerNetProject  :=  DMReports.checkInnerNetProject(ENServicesObjectObj.element.code);

       if getReconnectionTUVisibility(ENServicesObjectObj.contragentTypeRef.code) then
       begin
         HideControls([gbReconnectionTU], false);

         if (replaceCounter or parameterizationCounter) then
         begin
           lblCountersZoneType.Visible := True;
           cbCountersZoneType.Visible := True;
         end;
       end;
       // 10.01.2014 Конец - NET-4295
    end;


    gbReconnectionTU.Visible :=
      (ENServicesObjectObj.personalAccountCode <> Low(Integer)) or (ENServicesObjectObj.reconnectionTU <> Low(Integer));
    btnValidateProfitability.Visible := (ENServicesObjectObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_PAID);



    // 09.07.2020... +++ редактирование чернового договора по заявке с сайта
    if (DialogState = dsEdit) and (ENServicesObjectObj.createdFromSite = YES)
        and (ENServicesObjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_DRAFT) then
    begin
      tsGeneral.TabVisible := True;
      pcCalculation.ActivePage := tsGeneral;

      DisableControls([edtContractServicesDistance], False);

      DisableActions([actInsertCalculation, actInsertPlan, actInsertEstimateItem,
        actEditCalculation, actEditPlan, actEditEstimateItem, actEditENPlanWorkItem,
        actDeleteCalculation, actDeletePlan, actDeleteEstimateItem], False);

      if (replaceCounter or parameterizationCounter) then
      begin
        lblCountersZoneType.Visible := True;
        cbCountersZoneType.Visible := True;
        cbCountersZoneType.ItemIndex := ENServicesObjectObj.countersZoneType - 1;
      end;

      if (replaceCounter) then
        tsCounterForService.TabVisible := True;

      SetCountersVisibility();

    end;



    ////////// Служебка Бакланова от 21.02.12, завизированная Новицкой -
    // можно печатать счет, кошторис, акт приема-передачи, если договор в статусе "Кошторис затверджений"
    {************************
    if (ENServicesObjectObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_SIGNED) then
    begin
      btnPrintBill.Visible := true;
      tsPlans.TabVisible := true;
      tsActs.TabVisible := true;
    end;
    **************************}
    if (ENServicesObjectObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
    begin
      tsPlans.TabVisible := true;
      tsActs.TabVisible := true;
      tsENDocAttachment.TabVisible := True;

      if ENServicesObjectObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT then
        //  VS 10.12.2014 - только после подписания договора....
        btnPrintBillForPrepayment.Visible := (ENServicesObjectObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_SIGNED)
      else
        btnPrintBill.Visible := true;
    end;
    //////////

    // NET-4159...
    // кнопка печати акта приема-передачи отображается только после оплаты
    // SUPP-1009...
    // кнопка печати акта приема-передачи отображается только после подписания Кошторисa

    if (DMReports.CheckCounters(ENServicesObjectObj.code)
          and (ENServicesObjectObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED)) then
       btnActPriPerCounters.Visible := True;


     /////
     // Для нелицензионных работ с черновым Кошторисом показываем вкладку "Материалы"

     if (planCode > LOW_INT) and (ENServicesObjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_DRAFT) then
     begin
       TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;

       plan2ctFilter := ENPlanWork2ClassificationTypeFilter.Create;
       SetNullIntProps(plan2ctFilter);
       SetNullXSProps(plan2ctFilter);

       plan2ctFilter.planRef := ENPlanWorkRef.Create;
       plan2ctFilter.planRef.code := planCode;

       plan2ctList := TempENPlanWork2ClassificationType.getScrollableFilteredList(plan2ctFilter, 0, -1);

       if plan2ctList.totalCount > 0 then
       begin
         TempTKClassificationType := HTTPRIOTKClassificationType as TKClassificationTypeControllerSoapPort;
         ctObj := TempTKClassificationType.getObject(plan2ctList.list[0].classificationTypeRefCode);
         if ctObj <> nil then
           if ctObj.isNotLicensedActivity > 1 then
           begin
              tsEstimateItems.TabVisible := True;
              pcCalculation.ActivePage := tsListWork;
           end
       end;
     end;

     /////


    ////////////////////////////////////////////////////////////////////////////
    // 24.04.13 Все action'ы теперь разделены
    DisableActions([actInsertPlan, actDeletePlan, actEditPlan,
                    actClosePlan, actUnClosePlan, {actFinishPlan, actUndoFinishPlan,}
                    actInsertEstimateItem, actDeleteEstimateItem, actEditEstimateItem,
                    actEditENPlanWorkItem]);

    if (ENServicesObjectObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
    begin
      DisableActions([actInsertCalculation, actDeleteCalculation, actEditCalculation]);

      if not (ENServicesObjectObj.contractStatusRef.code in [ENSERVICESOBJECTSTATUS_COMPLETED,
                                                             ENSERVICESOBJECTSTATUS_TERMINATED]) then
      begin
        //if (DialogState = dsEdit) and (ENServicesObjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
        //  DisableActions([actInsertEstimateItem, actDeleteEstimateItem, actEditEstimateItem], false);

        //if priconnections then
        //  DisableActions([actInsertPlan, actInsertCalculation,
        //                  actDeletePlan{, actDeleteCalculation},
        //                  actEditPlan, actEditCalculation, actEditENPlanWorkItem], false); // Калькуляции удалять не будем, только обнулять

        if priconnections then
        begin
          DisableActions([actInsertCalculation{, actDeleteCalculation},
                          actEditCalculation, actEditENPlanWorkItem], false); // Калькуляции удалять не будем, только обнулять

          // С планами даем работать только если договор не проведен в ФК
          if ENServicesObjectObj.statusRef.code <> ENSERVICESOBJECT_FINSTATUS_CLOSED then
            DisableActions([actInsertPlan, actDeletePlan, actEditPlan,
                            actClosePlan, actUnClosePlan], false);
        end;

      end;

    end; // if (ENServicesObjectObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED)

    if (DialogState = dsEdit) and (ENServicesObjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_DRAFT) then
      DisableActions([actInsertEstimateItem, actDeleteEstimateItem, actEditEstimateItem], false);
    ////////////////////////////////////////////////////////////////////////////


    if ENServicesObjectObj.contractTypeRef <> nil then
      if ENServicesObjectObj.contractTypeRef.code > LOW_INT then
        chkTU.Checked := (ENServicesObjectObj.contractTypeRef.code = ENSERVICESOBJECTTYPE_TU);

    {
    HideControls([lblCNPack, edtCNPackCode, spbCNPack, memCNSubsystem,
      lblEPVoltageNominalVoltagenominalName,
      edtEPVoltageNominalVoltagenominalName,
      spbEPVoltageNominalVoltagenominal, chkBaseStation], not chkTU.Checked);
    }

    HideControls([lblCNPack, edtCNPackCode, spbCNPack, memCNSubsystem,
      lblEPVoltageNominalVoltagenominalName,
      edtEPVoltageNominalVoltagenominalName,
      spbEPVoltageNominalVoltagenominal{, chkBaseStation}], (not chkTU.Checked) and (not priconnections));

    /// Пока скроем кнопки "Печать договора" и "Печать счета"
    // HideControls([btnPrintContract, btnPrintBill], priconnections);


    ///////
    {
    if DialogState = dsEdit then
      if ENServicesObjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_COMPLETED then
        DisableActions();
    }
    ///////


    if ENServicesObjectObj.cnPackCode <> low(Integer) then
      begin
        edtCNPackCode.Text := IntToStr(ENServicesObjectObj.cnPackCode);
        if ENServicesObjectObj.cnSubsystemTypeRef <> nil then
          if (ENServicesObjectObj.cnSubsystemTypeRef.code <> low(Integer))
          and not CheckValueInArray(ENServicesObjectObj.cnSubsystemTypeRef.code,
            [SS_PHYSPERSON, //Поставка электроэнергии бытовому сектору
            SS_REIMBURSEMENT]) //Возмещение затрат по выносу электросетей
          then 
            begin
              TempCNTechTerms :=
                HTTPRIOCNTechTerms as CNTechTermsControllerSoapPort;
              CNTechTermsFilterObj := CNTechTermsFilter.Create;
              SetNullIntProps(CNTechTermsFilterObj);
              SetNullXSProps(CNTechTermsFilterObj);
              CNTechTermsFilterObj.subsystemRef := CNSubsystemTypeRef.Create;
              CNTechTermsFilterObj.subsystemRef.code :=
                ENServicesObjectObj.cnSubsystemTypeRef.code;
              //CNTechTermsFilterObj.cnPackRef := CNPackRef.Create;

              case ENServicesObjectObj.cnSubsystemTypeRef.code of
                SS_CONNECTION                 :
                  begin
                    memCNSubsystem.Text := 'Присоединение';
                    CNTechTermsFilterObj.conditionSQL :=
                      'cn_techterms.id_pack = ' +
                      IntToStr(ENServicesObjectObj.cnPackCode);
                  end;
                SS_TECHTERMS                  :
                  memCNSubsystem.Text := 'Согласование абонентских ТУ';
                SS_NEWCONNECTION              :
                  begin
                    memCNSubsystem.Text := 'Присоединение с 01.08.2010 г.';
                    CNTechTermsFilterObj.conditionSQL :=
                      'ncn_techterms.id_pack = ' +
                      IntToStr(ENServicesObjectObj.cnPackCode);
                  end;
                SS_CONNECTION_20110314        :
                  begin
                    memCNSubsystem.Text := 'Присоединение с 14.03.2011 г.';
                    CNTechTermsFilterObj.conditionSQL :=
                      'cn_20110314_techterms.id_pack = ' +
                      IntToStr(ENServicesObjectObj.cnPackCode);
                  end;
                SS_ELECTRICINSTALLACCESSPOWER :
                  begin
                    memCNSubsystem.Text := 'Присоединение с 01.03.2013 г.';
                    CNTechTermsFilterObj.conditionSQL :=
                      'eap_techterms.id_pack = ' +
                      IntToStr(ENServicesObjectObj.cnPackCode);
                  end;
                SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER :
                  begin
                    memCNSubsystem.Text := 'Присоединение с 19.04.2018 г.';
                    CNTechTermsFilterObj.conditionSQL :=
                      'adso_techterms.id_pack = ' +
                      IntToStr(ENServicesObjectObj.cnPackCode);
                  end;
              end; //case ENServicesObjectObj.cnSubsystemTypeRef.code of

              CNTechTermsList := TempCNTechTerms.getScrollableFilteredList(
                CNTechTermsFilterObj, 0, -1);
              if CNTechTermsList.totalCount > 0 then
                begin
                  if CNTechTermsList.list[0].tension_point <> nil then
                    begin
                      edtEPVoltageNominalVoltagenominalName.Text :=
                        CNTechTermsList.list[0].tension_point.DecimalString;

                      if ENServicesObjectObj.tension_point = nil then
                        ENServicesObjectObj.tension_point := TXSDecimal.Create;
                      ENServicesObjectObj.tension_point.DecimalString :=
                        CNTechTermsList.list[0].tension_point.DecimalString;

                    end
                  else
                    edtEPVoltageNominalVoltagenominalName.Text := '';
                  chkBaseStation.Checked :=
                    (CNTechTermsList.list[0].baseStation = 1);
                  ENServicesObjectObj.baseStation :=
                    CNTechTermsList.list[0].baseStation;
                end;

            end; //if ENServicesObjectObj.cnSubsystemTypeRef.code <> low(Integer) then
      end; //if ENServicesObjectObj.cnPackCode <> low(Integer) then

    edtCode.Text := IntToStr(ENServicesObjectObj.code);

    if (ENServicesObjectObj.contractNumber <> '') then
       edtContractNumber.Text := ENServicesObjectObj.contractNumber
    else
       edtContractNumber.Text := ENServicesObjectObj.contractNumberServices;

    if ENServicesObjectObj.contractDateServices <> nil then
    begin
      edtContractDateServices.DateTime:=EncodeDate(ENServicesObjectObj.contractDateServices.Year,ENServicesObjectObj.contractDateServices.Month,ENServicesObjectObj.contractDateServices.Day);
      edtContractDateServices.checked := true;
    end
    else
    begin
      edtContractDateServices.DateTime:=SysUtils.Date;
      edtContractDateServices.checked := false;
    end;

    cbbBasisType.ItemIndex := -1;

    if (ENServicesObjectObj.basisType <> nil ) then
      begin
       {
       case StrToInt(ENServicesObjectObj.basisType.DecimalString) of
             1 : cbbBasisType.ItemIndex := 1;
             2 : cbbBasisType.ItemIndex := 2;
             3 : cbbBasisType.ItemIndex := 3;
             4 : cbbBasisType.ItemIndex := 4;
             5 : cbbBasisType.ItemIndex := 5;
             6 : cbbBasisType.ItemIndex := 6;
             7 : cbbBasisType.ItemIndex := 7;
             8 : cbbBasisType.ItemIndex := 8;
             9 : cbbBasisType.ItemIndex := 9;

       else
            cbbBasisType.ItemIndex := -1;
       end;
       }
       try
         cbbBasisType.ItemIndex := StrToInt(ENServicesObjectObj.basisType.DecimalString);
       except
         on EConvertError do cbbBasisType.ItemIndex := -1;
       end;

            if (ENServicesObjectObj.basisType.DecimalString <> '3') and ( DialogState = dsEdit ) then
             DisableControls([edtWarrantContrAgentFIO , edtWarrantContrAgentNumber , edtWarrantContrAgentDate]);


      end

    else
      begin
       DisableControls([edtWarrantContrAgentFIO , edtWarrantContrAgentNumber , edtWarrantContrAgentDate]);
       cbbBasisType.ItemIndex := 0;
      end;

    if ENServicesObjectObj.contractDate <> nil then
    begin
      edtContractDateFin.DateTime:=EncodeDate(ENServicesObjectObj.contractDate.Year,ENServicesObjectObj.contractDate.Month,ENServicesObjectObj.contractDate.Day);
      edtContractDateFin.checked := true;
    end;

    edtContragentName.Text := ENServicesObjectObj.contragentName;
    MakeMultiline(edtContragentAddress.Lines, ENServicesObjectObj.contragentAddress);
    MakeMultiline(edtContragentAddressWork.Lines, ENServicesObjectObj.contragentAddressWork);
    MakeMultiline(edtContragentPassport.Lines, ENServicesObjectObj.contragentPassport);
    edtContragentOkpo.Text := ENServicesObjectObj.contragentOkpo;
    edtContragentBossName.Text := ENServicesObjectObj.contragentBossName;
    edtContragentBankName.Text := ENServicesObjectObj.contragentBankName;
    edtContragentBankAccount.Text := ENServicesObjectObj.contragentBankAccount;
    // edtContragentBankMfo.Text := ENServicesObjectObj.contragentBankMfo;
    edtENDepartmentDepartmentName.Text := ENServicesObjectObj.department.name;
    MakeMultiline(edtCommentGen.Lines, ENServicesObjectObj.commentGen);

    edtName.Text := ENServicesObjectObj.name;
    edtPartnerCode.Text := ENServicesObjectObj.partnerCode;
    edtFinDocCode.Text := ENServicesObjectObj.finDocCode;

    edtWarrantContrAgentNumber.Text := ENServicesObjectObj.warrantNumber;
    edtWarrantContrAgentFIO.Text := ENServicesObjectObj.warrantFIO;

    if ENServicesObjectObj.warrantDate <> nil then
    begin
      edtWarrantContrAgentDate.DateTime:=EncodeDate(ENServicesObjectObj.warrantDate.Year,ENServicesObjectObj.warrantDate.Month,ENServicesObjectObj.warrantDate.Day);
      edtWarrantContrAgentDate.checked := true;
    end;

    if (ENServicesObjectObj.regionalType <> Low(Integer)) then
       edtRegionalType.ItemIndex := ENServicesObjectObj.regionalType
    else
       edtRegionalType.ItemIndex := 0;

    if ( ENServicesObjectObj.finDocID <> Low(Integer) ) then
       edtFinDocID.Text := IntToStr(ENServicesObjectObj.finDocID)
    else
       edtFinDocID.Text := '';

    if ( ENServicesObjectObj.contractServicesSumma <> nil ) then
       edtContractServicesSumma.Text := ENServicesObjectObj.contractServicesSumma.decimalString
    else
       edtContractServicesSumma.Text := '';

    if ( ENServicesObjectObj.contractServicesPower <> nil ) then
       edtContractServicesPower.Text := ENServicesObjectObj.contractServicesPower.decimalString
    else
       edtContractServicesPower.Text := '';

    MakeMultiline(edtCommentServicesGen.Lines, ENServicesObjectObj.commentServicesGen);

    if ( ENServicesObjectObj.contractServicesDistance <> nil ) then
       edtContractServicesDistance.Text := ENServicesObjectObj.contractServicesDistance.decimalString
    else
       edtContractServicesDistance.Text := '';

    if ( ENServicesObjectObj.contractServicesDay <> nil ) then
       edtContractServicesDay.Text := ENServicesObjectObj.contractServicesDay.decimalString
    else
       edtContractServicesDay.Text := '';

    edtContragentPosition.Text := ENServicesObjectObj.contragentPosition;

    if ENServicesObjectObj.executeWorkDate <> nil then
      begin
        edtExecuteWorkDate.DateTime:=EncodeDate(ENServicesObjectObj.executeWorkDate.Year,ENServicesObjectObj.executeWorkDate.Month,ENServicesObjectObj.executeWorkDate.Day);
        edtExecuteWorkDate.checked := true;
      end
    else
      begin
        edtExecuteWorkDate.DateTime:=SysUtils.Date;
        edtExecuteWorkDate.checked := false;
      end;
    if ENServicesObjectObj.timeStart <> nil then
      begin
        edtTimeStart.DateTime:= EncodeTime(ENServicesObjectObj.timeStart.Hour,ENServicesObjectObj.timeStart.Minute, 0, 0);
        //EncodeDate(ENTravelSheetObj.timeStart.Year,ENTravelSheetObj.timeStart.Month,ENTravelSheetObj.timeStart.Day);
        edtTimeStart.checked := true;
      end
      else
      begin
        edtTimeStart.DateTime:=SysUtils.Date;
        edtTimeStart.checked := false;
      end;

      if ENServicesObjectObj.timeFinal <> nil then
      begin
        edtTimeFinal.DateTime:= EncodeTime(ENServicesObjectObj.timeFinal.Hour,ENServicesObjectObj.timeFinal.Minute, 0, 0);
         //EncodeDate(ENTravelSheetObj.timeFinal.Year,ENTravelSheetObj.timeFinal.Month,ENTravelSheetObj.timeFinal.Day);
        edtTimeFinal.checked := true;
      end
      else
      begin
        edtTimeFinal.DateTime:=SysUtils.Date;
        edtTimeFinal.checked := false;
      end;

    edtEmail.Text := ENServicesObjectObj.customerEmail;
    edtContragentPhoneNumber.Text := ENServicesObjectObj.contragentPhoneNumber;
    edtExecutorPhoneNumber.Text := ENServicesObjectObj.executorPhoneNumber;
    edtContragentObjectWork.Text := ENServicesObjectObj.contragentObjectWork;

    rgContragentType.ItemIndex:= ENServicesObjectObj.contragentTypeRef.code-1;
    rgPayable.ItemIndex:= ENServicesObjectObj.isNoPay;
    // тех условия
    edtTechConditionsNumber.Text := ENServicesObjectObj.techConObjects.numberGen;

    cbActIncomeCreatMetod.ItemIndex := ENServicesObjectObj.actIncomeCreatMetodRef.code - 1;

    if ENServicesObjectObj.techConObjects.dateGen <> nil then
		begin
      edtTechConditionsDate.DateTime := EncodeDate(ENServicesObjectObj.techConObjects.dateGen.Year,ENServicesObjectObj.techConObjects.dateGen.Month,ENServicesObjectObj.techConObjects.dateGen.Day);
      edtTechConditionsDate.checked := true;
    end;

    /////////////////////////////
    // 21.09.12 NET-3079
    chbIsCustomerMaterials.Checked := (ENServicesObjectObj.isCustomerMaterials = ENSERVICESOBJECT_ISCUSTOMERMATERIALS);
    HideControls([gbActTransfer], (not chbIsCustomerMaterials.Checked));

    if (ENServicesObjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_SIGNED) and
       (ENServicesObjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_PAID) then
    begin
      HideControls([gbActTransfer]);
    end;

    if (chbIsCustomerMaterials.Checked) then
    begin
      {
      btnActTransferSave.Visible := (ENServicesObjectObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_GOOD);
      btnActTransferMoveToFK.Visible := (ENServicesObjectObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_GOOD);
      btnActTransferUnMoveToFK.Visible := (ENServicesObjectObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_ACT_TRANSFER_CLOSED);
      }
      SetActTransferVisibilityByStatus(ENServicesObjectObj.statusRef.code);

      if gbActTransfer.Visible then
        updateCustomerMaterialsFinGrid;
    end;

    edtActTransferNumber.Text := ENServicesObjectObj.actTransferNumber;

    if ENServicesObjectObj.actTransferDate <> nil then
    begin
      dtpActTransferDate.DateTime := EncodeDate(ENServicesObjectObj.actTransferDate.Year,
                                                ENServicesObjectObj.actTransferDate.Month,
                                                ENServicesObjectObj.actTransferDate.Day);
      dtpActTransferDate.Checked := true;
    end
    else
    begin
      dtpActTransferDate.DateTime := SysUtils.Date;
      dtpActTransferDate.Checked := false;
    end;
    ///////////////////////////////////

    // 10.01.13 NET-4159
    //if ENServicesObjectObj.resposible <> '' then
    //  edtENResponsible.Text := ENServicesObjectObj.resposiblePosition + ' ' + ENServicesObjectObj.resposible;
    edtENResponsible.Text := ENServicesObjectObj.resposible;
    edtENResponsiblePosition.Text := ENServicesObjectObj.resposiblePosition;

    //planCode := DMReports.getPlanCodeForCalculationByElement(ENServicesObjectObj.element.code);
    ////////
    SetFormCaption(ENServicesObjectObj.element.code);
    ////////
    pcCalculationChange(Sender);

      //edtENElementElementName.Text := ENServicesObjectObj.element.name;
    DisableControls([edtDepartmentForServices,btnENDepartmentDepartment]);

    if ENServicesObjectObj.department.code <> LOW_INT then
       begin
         DepartmentForServicesCode:= ENServicesObjectObj.department.code;
         edtDepartmentForServices.Text := ENServicesObjectObj.department.shortName;
       end;



    // Проверим если класификации временые резервируемые то отображаем поля для резерва времени
       if planCode > LOW_INT then
       begin
         TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;

         plan2ctFilter := ENPlanWork2ClassificationTypeFilter.Create;
         SetNullIntProps(plan2ctFilter);
         SetNullXSProps(plan2ctFilter);

         plan2ctFilter.planRef := ENPlanWorkRef.Create;
         plan2ctFilter.planRef.code := planCode;

         plan2ctList := TempENPlanWork2ClassificationType.getScrollableFilteredList(plan2ctFilter, 0, -1);

         if plan2ctList.totalCount > 0 then
         begin
            if  plan2ctList.list[0].isJobsByTime = 1 then
                isJobsByTime := True
            else
                isJobsByTime := False;
            if  plan2ctList.list[0].isVisitClient = 1 then
                isVisitClient := True
            else
                isVisitClient := False;
         end;
       end;

       if isjobsbytime then
       begin
         HideControls([lblExecuteWorkDate , edtExecuteWorkDate  , lblTimeStart  , lblTimeStart2  ,  edtTimeStart  , lblTimeFinal3  , edtTimeFinal , btnPrintBill  ,  lblDeliveryOneWay ],false);
         DisableControls([spbENDepartmentDepartment]);

         if ENServicesObjectObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT then
         begin
           //  VS 10.12.2014 - только после подписания договора....
           btnPrintBillForPrepayment.Visible := (ENServicesObjectObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_SIGNED);
					 HideControls([btnPrintBill, btnPrintFactCalc],
                        (ENServicesObjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_COMPLETED) and
												(ENServicesObjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_PAID) and
												(ENServicesObjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_CLOSE) );
         end;
       end;

       DisableControls([edtExecuteWorkDate  , edtTimeStart  , edtTimeFinal ]);

       //////////////////////////// 13.04.13 NET-4231
       // Вытягиваем связанный объект ENTechConditionsServices
       if priconnections then
       begin
         tcServicesFilter := ENTechConditionsServicesFilter.Create;
         SetNullIntProps(tcServicesFilter);
         SetNullXSProps(tcServicesFilter);
         tcServicesFilter.conditionSQL := 'code in ' +
           '(select so2tc.techcondservrefcode from enservicesobject2techcondtnsservices so2tc ' +
           ' where so2tc.servicesobjectrefcode = ' + IntToStr(ENServicesObjectObj.code) + ')';

         TempENTechConditionsServices := HTTPRIOENTechConditionsServices as ENTechConditionsServicesControllerSoapPort;
         tcServicesArr := TempENTechConditionsServices.getScrollableFilteredCodeArray(tcServicesFilter, 0, -1);
         if High(tcServicesArr) > -1 then
         begin
           //tcServicesObj := TempENTechConditionsServices.getObject(tcServicesArr[0]);
           ENTechConditionsServicesObj := TempENTechConditionsServices.getObject(tcServicesArr[0]);
           //LoadENTechConditionsServicesObj(tcServicesObj);
           LoadENTechConditionsServices;
         end;
       end;
       ////////////////////////////

      // NET-4407... 04.10.2014 +++ Вытягиваем даты приема/передачи акта
      gbTransferDate.Visible := (ENServicesObjectObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_SIGNED);
      DisableControls([edtIssueDate, edtReturnDate], False);
      edtIssueDate.DateTime := SysUtils.Date;
      edtIssueDate.checked := False;
      edtReturnDate.DateTime := SysUtils.Date;
      edtReturnDate.checked := False;

      transferDate2ServicesObjectFilter := ENTransferDate2ServicesObjectFilter.Create;
      SetNullIntProps(transferDate2ServicesObjectFilter);
      SetNullXSProps(transferDate2ServicesObjectFilter);
      transferDate2ServicesObjectFilter.servicesObjectRef := ENServicesObjectRef.Create;
      transferDate2ServicesObjectFilter.servicesObjectRef.code := ENServicesObjectObj.code;

      TempENTransferDate2ServicesObject := HTTPRIOENTransferDate2ServicesObject as ENTransferDate2ServicesObjectControllerSoapPort;
      transferArr := TempENTransferDate2ServicesObject.getScrollableFilteredCodeArray(transferDate2ServicesObjectFilter, 0, -1);
      if High(transferArr) > -1 then
      begin
        try
          ENTransferDate2ServicesObjectObj := TempENTransferDate2ServicesObject.getObject(transferArr[0]);
        except
          on EConvertError do Exit;
        end;

        if (ENTransferDate2ServicesObjectObj <> nil) then
        begin
          if ENTransferDate2ServicesObjectObj.issueDate <> nil then
          begin
            edtIssueDate.DateTime:=EncodeDate(ENTransferDate2ServicesObjectObj.issueDate.Year,ENTransferDate2ServicesObjectObj.issueDate.Month,ENTransferDate2ServicesObjectObj.issueDate.Day);
            edtIssueDate.checked := True;
          end
          else
          begin
            edtIssueDate.DateTime:=SysUtils.Date;
            edtIssueDate.checked := False;
          end;
          if ENTransferDate2ServicesObjectObj.returnDate <> nil then
          begin
            edtReturnDate.DateTime:=EncodeDate(ENTransferDate2ServicesObjectObj.returnDate.Year,ENTransferDate2ServicesObjectObj.returnDate.Month,ENTransferDate2ServicesObjectObj.returnDate.Day);
            edtReturnDate.checked := True;
          end
          else
          begin
            edtReturnDate.DateTime:=SysUtils.Date;
            edtReturnDate.checked := False;
          end;
        end;
      end;

  end;
  { NET-4574 eic код точки учета услуги на сторону , определились убрать єту проверку
  if DialogState = dsEdit then
  begin
    if ((chkTU.Checked) and (rgContragentType.ItemIndex = 1) ) then
         DisableControls([edtContragentObjectWork],false)
    else
         DisableControls([edtContragentObjectWork],True);
  end;
  }
 //end;
    DisableControls([edtDepartmentForServices]);
    DenyBlankValues([edtDepartmentForServices]);

  checkWarrant := true;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    // NET-4235 Для бюджетников счета на предоплату не печатаются
    if (ENServicesObjectObj.contragentTypeRef.code = ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET) then
      btnPrintBillForPrepayment.Visible := false;
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    // NET-4249 оплаты
			if  ENServicesObjectObj.contractStatusRef.code <>  ENSERVICESOBJECTSTATUS_DRAFT then
		 // SUPP-4588 решено отображать вкладку для договоров по услугам на сторону по новой и старой методике  а также присоединениям   if  ENServicesObjectObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT then // расчет по новой методике 05,2013
					if  not (ENServicesObjectObj.contractTypeRef.code in [  ENSERVICESOBJECTTYPE_SALE ,
																																	ENSERVICESOBJECTTYPE_SALE_PAYMENT_SCHEDULE
																																	// SUPP-4588 отображаем для присоединений тоже  , ENSERVICESOBJECTTYPE_CONNECTION
																																	] ) then
          tsPayment.TabVisible := True;

  end;


  if ENServicesObjectObj.isNoPay = ENCOnsts.ENSERVICESOBJECT_ISNOPAY then
    HideControls([btnPrintBillForPrepayment, btnPrintFactCalc , btnPrintBill ]);

   /// tezzzt скроем пока что
   tsServicesObject2FKInfo.TabVisible:= false;


  // метод формирования доходного акта
  DisableActions([actChangeCreatMetod]);
  if (changeActIncomeCreatMetod) then
  begin
    cbActIncomeCreatMetod.Enabled := True;
  end else
  begin
    cbActIncomeCreatMetod.Enabled := False;
    HideControls([btnChangeCreatMetod]);
  end;


  // при наличии прав можно изменить доверенность...
  if (DialogState = dsView) and changeWarrant then
  begin
    if (ENServicesObjectObj.contractStatusRef.code
        in [ ENSERVICESOBJECTSTATUS_BUDGETAPPROVED, ENSERVICESOBJECTSTATUS_SIGNED, ENSERVICESOBJECTSTATUS_PAID,
             ENSERVICESOBJECTSTATUS_COMPLETED, ENSERVICESOBJECTSTATUS_PREPAID ]) then
    begin
      btnSaveWarrant.Visible := True;
      DisableControls([spbWarrantNumber], False);
    end;
  end;


  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if (ENServicesObjectObj.contractStatusRef.code
        in [ENSERVICESOBJECTSTATUS_CANCELED, ENSERVICESOBJECTSTATUS_TERMINATED, ENSERVICESOBJECTSTATUS_DISCLAIMER]) then

        setReadMode(Sender);
  end;

end;


procedure TfrmENServicesCalculationEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
	acc : String;
	i : Integer;
	accValidationOk : Boolean;

begin
	//if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if (ModalResult = mrOk) 
    and ((DialogState = dsEdit)
      or ((DialogState = dsInsert))
        and (vCnSubsystemTypeRefCode = SS_REIMBURSEMENT)) then

  if (ENServicesObjectObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) and
   /////////

   not NoBlankValues([
      edtContractNumberServices
      ,edtContragentName
      ///// 28.07.10
      //,edtPartnerCode
      //,edtFinDocCode
      //,edtFinDocID
      /////
      ,edtContragentAddress
      ,edtContragentAddressWork
      ,edtENDepartmentDepartmentName
     ])  then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end else

  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    if (ENServicesObjectObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED)
        or (ENServicesObjectObj.createdFromSite = YES) then
    begin

      if edtcontractDateFin.Checked then
      begin
        if ENServicesObjectObj.contractDate = nil then
          ENServicesObjectObj.contractDate := TXSDate.Create;
        ENServicesObjectObj.contractDate.XSToNative(GetXSDate(edtcontractDateFin.DateTime));
      end
      else begin
        Application.MessageBox(PChar('Введите дату договора!'),PChar('Внимание!'), MB_ICONWARNING);
        Action := caNone;
        ENServicesObjectObj.contractDate := nil;
        pcCalculation.ActivePage := tsGeneral;
        if edtcontractDateFin.CanFocus then
          edtcontractDateFin.SetFocus;
        Exit;
      end;


      //** SUPP-99483... 07.04.2021... +++ проверяем если обязательный EIC */
      if( (Trim(edtPersonalAccountNumber.Text) <> '' ) and  ( Trim(edteic.Text) = '' ) and requiredEIC ) then
      begin
        Application.MessageBox(PChar('Заповніть EIC точки обліку'),PChar('Внимание!'), MB_ICONWARNING);
        if edteic.CanFocus then
          edteic.SetFocus;
        Action := caNone;
        Exit;
      end;

      if((gbReconnectionTU.Visible)) then
      begin

        //NET-4295
        if((cbIsReconnection.Checked) and (ENServicesObjectObj.personalAccountCode = Low(Integer))) then
        begin
            Application.MessageBox(PChar('Заповніть обліковий рахунок та оберіть точку обліку нажавши на кнопку із біноклем!'),PChar('Внимание!'), MB_ICONWARNING);
            Action := caNone;
            Exit;
        end;
        if((not cbIsReconnection.Checked) and (not chbIsNewConnection.Checked)) then
        begin
            Application.MessageBox(PChar('Для цього договору необхідно визначити параметр - або підключення нового абонента, або підключення вже існуючого у розділі "Нове або повторне підключення споживача"'),PChar('Внимание!'), MB_ICONWARNING);
            Action := caNone;
            Exit;
        end;

        { 26.11.2019 Не будем сбрасывать
        if(ENServicesObjectObj.reconnectionTU = SERVICESOBJECT_NEWCONNECTIONTU) then
        begin
            ENServicesObjectObj.personalAccountCode := Low(Integer);
            ENServicesObjectObj.personalAccountNumber := '';
        end;
        }

        if (replaceCounter or parameterizationCounter) then
        begin
          if (cbCountersZoneType.ItemIndex = -1) then
          begin
            Application.MessageBox(PChar('Для цього договору необхідно визначити тип зони лічильника!'),PChar('Внимание!'), MB_ICONWARNING);
            Action := caNone;
            Exit;
          end;

          ENServicesObjectObj.countersZoneType := cbCountersZoneType.ItemIndex + 1;
        end;

      end
      else
      begin
        ENServicesObjectObj.personalAccountCode := Low(Integer);
        ENServicesObjectObj.personalAccountNumber := '';
        ENServicesObjectObj.reconnectionTU := Low(Integer);
        ENServicesObjectObj.countersZoneType := Low(Integer);
      end;

      if edtcontractDateServices.checked then
      begin
        if ENServicesObjectObj.contractDateServices = nil then
          ENServicesObjectObj.contractDateServices := TXSDate.Create;
        ENServicesObjectObj.contractDateServices.XSToNative(GetXSDate(edtcontractDateServices.DateTime));
      end
      else begin
        Application.MessageBox(PChar('Введите дату договора!'),PChar('Внимание!'), MB_ICONWARNING);
        Action := caNone;
        ENServicesObjectObj.contractDateServices := nil;
        pcCalculation.ActivePage := tsGeneral;

        if edtcontractDateServices.CanFocus then
          edtcontractDateServices.SetFocus;
        Exit;
      end;
    end;

    if (rgPayable.ItemIndex = -1) then
    begin
      Application.MessageBox(PChar('Укажите признак платный договор или безоплатный!'),PChar('Внимание!'), MB_ICONWARNING);
      Action := caNone;
      Exit;
    end;


   //////////////////////////////////////
   if (priconnections) then
   begin
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
   //////////////////////////////////////

    if (ENServicesObjectObj.contractStatusRef.code = 
      ENSERVICESOBJECTSTATUS_DRAFT) 
    and (vCnSubsystemTypeRefCode <> SS_REIMBURSEMENT)
    then ENServicesObjectObj.name := ' '
    else ENServicesObjectObj.name := edtName.Text; // контрагент из фин договора


     ENServicesObjectObj.contractNumberServices := edtContractNumberServices.Text; // наш
     ENServicesObjectObj.contragentName := edtContragentName.Text; // контрагент услуги

     ENServicesObjectObj.contragentAddress := edtContragentAddress.Text;
     ENServicesObjectObj.contragentAddressWork := edtContragentAddressWork.Text;

     ENServicesObjectObj.contragentOkpo := edtContragentOkpo.Text; 

     ENServicesObjectObj.contragentBankAccount := edtContragentBankAccount.Text;

     ENServicesObjectObj.contragentBankName := edtContragentBankName.Text;

     // ENServicesObjectObj.contragentBankMfo := edtContragentBankMfo.Text;
     ENServicesObjectObj.contragentBossName := edtContragentBossName.Text;
     ENServicesObjectObj.contragentPassport := edtContragentPassport.Text;
     ENServicesObjectObj.contragentTypeRef := ENServicesContragentTypeRef.Create;
     ENServicesObjectObj.contragentTypeRef.code := rgContragentType.ItemIndex+1;
     ENServicesObjectObj.contractTypeRef := ENServicesContractTypeRef.Create ;

     ENServicesObjectObj.isNoPay := rgPayable.ItemIndex;
     ENServicesObjectObj.contragentPosition := edtContragentPosition.Text;

     if (ENServicesObjectObj.contractServicesSumma = nil ) then
     ENServicesObjectObj.contractServicesSumma := TXSDecimal.Create;
     if edtContractServicesSumma.Text <> '' then
       ENServicesObjectObj.contractServicesSumma.decimalString := edtContractServicesSumma.Text
     else
       ENServicesObjectObj.contractServicesSumma := nil;

     if (ENServicesObjectObj.contractServicesPower = nil ) then
       ENServicesObjectObj.contractServicesPower := TXSDecimal.Create;
     if edtContractServicesPower.Text <> '' then
       ENServicesObjectObj.contractServicesPower.decimalString := edtContractServicesPower.Text
     else
       ENServicesObjectObj.contractServicesPower := nil;

     ENServicesObjectObj.commentServicesGen := edtCommentServicesGen.Text;

     if (ENServicesObjectObj.contractServicesDistance = nil ) then
       ENServicesObjectObj.contractServicesDistance := TXSDecimal.Create;
     if edtContractServicesDistance.Text <> '' then
       ENServicesObjectObj.contractServicesDistance.decimalString := edtContractServicesDistance.Text
     else
       ENServicesObjectObj.contractServicesDistance := nil;

     if (ENServicesObjectObj.contractServicesDay = nil ) then
       ENServicesObjectObj.contractServicesDay := TXSDecimal.Create;
     if edtContractServicesDay.Text <> '' then
       ENServicesObjectObj.contractServicesDay.decimalString := edtContractServicesDay.Text
     else
       ENServicesObjectObj.contractServicesDay := nil;


      ENServicesObjectObj.warrantNumber := edtWarrantContrAgentNumber.Text;
      ENServicesObjectObj.warrantFIO := edtWarrantContrAgentFIO.Text;

      if edtWarrantContrAgentDate.checked then
      begin
        if ENServicesObjectObj.warrantDate = nil then
        ENServicesObjectObj.warrantDate := TXSDate.Create;
        ENServicesObjectObj.warrantDate.XSToNative(GetXSDate(edtWarrantContrAgentDate.DateTime));
      end
      else
      ENServicesObjectObj.warrantDate := nil;

      if (edtRegionalType.ItemIndex <> 0) then
         ENServicesObjectObj.regionalType := edtRegionalType.ItemIndex
      else
         ENServicesObjectObj.regionalType := LOW_INT;

      if (ENServicesObjectObj.basisType = nil ) then
     ENServicesObjectObj.basisType := TXSDecimal.Create;
     if ( (cbbBasisType.ItemIndex <> -1 ) and  (cbbBasisType.ItemIndex <> 0) ) then
       ENServicesObjectObj.basisType.decimalString := IntToStr(cbbBasisType.itemIndex)
     else
       ENServicesObjectObj.basisType := nil;


     // 12.04.2013 +++ для присоединений тип договора уже есть!!!  
     // if chkTU.Checked then
     //   ENServicesObjectObj.contractTypeRef.code := ENSERVICESOBJECTTYPE_TU // тех условия
     if (priconnections) then
       ENServicesObjectObj.contractTypeRef.code := ENSERVICESOBJECTTYPE_CONNECTION
     else
       if not chkTU.Checked then
         ENServicesObjectObj.contractTypeRef.code := ENSERVICESOBJECTTYPE_OTHER  // не тех условия
       else
         ENServicesObjectObj.contractTypeRef.code := ENSERVICESOBJECTTYPE_TU;

     {begin
       ENServicesObjectObj.contractTypeRef.code := ENSERVICESOBJECTTYPE_OTHER;  // не тех условия
       ENServicesObjectObj.cnPackCode := low(Integer);
       ENServicesObjectObj.cnSubsystemTypeRef.code := low(Integer);
     end;}

    // ENServicesObjectObj.userGen := edtUserGen.Text;

     if edtdateEdit.checked then
     begin 
       if ENServicesObjectObj.dateEdit = nil then
          ENServicesObjectObj.dateEdit := TXSDate.Create;
       ENServicesObjectObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENServicesObjectObj.dateEdit := nil;

       if edtexecuteWorkDate.checked then
     begin 
       if ENServicesObjectObj.executeWorkDate = nil then
          ENServicesObjectObj.executeWorkDate := TXSDate.Create;
       ENServicesObjectObj.executeWorkDate.XSToNative(GetXSDate(edtexecuteWorkDate.DateTime));
     end
     else
       ENServicesObjectObj.executeWorkDate := nil;

     if edttimeStart.checked then
     begin
       if ENServicesObjectObj.timeStart = nil then
          ENServicesObjectObj.timeStart := TXSDateTime.Create;
         ENServicesObjectObj.timeStart.XSToNative(GetXSDateTime(edttimeStart.DateTime));
     end
     else
       ENServicesObjectObj.timeStart := nil;

     if edttimeFinal.checked then
     begin
       if ENServicesObjectObj.timeFinal = nil then
          ENServicesObjectObj.timeFinal := TXSDateTime.Create;
       ENServicesObjectObj.timeFinal.XSToNative(GetXSDateTime(edttimeFinal.DateTime));
     end
     else
       ENServicesObjectObj.timeFinal := nil;

    ENServicesObjectObj.customerEmail := edtEmail.Text;
    ENServicesObjectObj.contragentPhoneNumber := edtContragentPhoneNumber.Text;
    ENServicesObjectObj.executorPhoneNumber := edtExecutorPhoneNumber.Text;
    ENServicesObjectObj.contragentObjectWork :=  edtContragentObjectWork.Text;

    // 21.09.12 NET-3079
    ENServicesObjectObj.isCustomerMaterials := Ord(chbIsCustomerMaterials.Checked);
    // Если признак использования материалов заказчика сбросили, то нужно очистить
    // номер и дату акта приема-передачи
    if not chbIsCustomerMaterials.Checked then
    begin
      ENServicesObjectObj.actTransferNumber := '';
      ENServicesObjectObj.actTransferDate := nil;
    end;

    ENServicesObjectObj.resposible := edtENResponsible.Text;
    ENServicesObjectObj.resposiblePosition := edtENResponsiblePosition.Text;

    //PRIC-552
    if ENServicesObjectObj.tension_point = nil then
      ENServicesObjectObj.tension_point := TXSDecimal.Create;
    if edtEPVoltageNominalVoltagenominalName.Text <> '' then
      ENServicesObjectObj.tension_point.DecimalString :=
        edtEPVoltageNominalVoltagenominalName.Text
    else
      ENServicesObjectObj.tension_point := nil;
    if chkBaseStation.Checked then
      ENServicesObjectObj.baseStation := 1
    else
			ENServicesObjectObj.baseStation := low(Integer);

				 if (rgContragentType.ItemIndex = 1) then
				begin
				acc := copy(Trim(edtContragentBankAccount.Text),1, 4);
				accValidationOk := False;

				if Length(acc) < 4 then
				accValidationOk := False
				else
				begin
				 for i:=Low(accBudgetString) to High(accBudgetString) do
					 begin
						 if 	(acc <> accBudgetString[i]) then Continue
						 else
							 begin
							 accValidationOk := True;
							 Break;
							 end;
					 end;
         end;

//			 SUPP-83795	 if accValidationOk = false  then
//				 begin
//				  Application.MessageBox(PChar('Рахунок для БЮДЖЕТних організацій повинен починатись з 3521, 3522, 3541,3542 або 3717!'), PChar('Увага!'), MB_ICONWARNING);
//					edtContragentBankAccount.SetFocus;
//					Action := caNone;
//					Exit;
//				 end;

				end;

        // SUPP-11567 Чаплинка. 20.01.2014. Сообщение в EnergyNet - невідома ознака село-місто для договору
        if ENServicesObjectObj.personalAccountCode <> LOW_INT then
        begin
            if ENServicesObjectObj.regionalType = LOW_INT then
            begin
				          Application.MessageBox(PChar('Оберіть ознаку місто / село якщо був обран обліковий рахунок для договору!'), PChar('Увага!'), MB_ICONWARNING);
					        edtRegionalType.SetFocus;
					        Action := caNone;
					        Exit;
            end;
        end;


    if edtcontractDateServices.Checked then
    begin
      if ENServicesObjectObj.contractDateServices = nil then
        ENServicesObjectObj.contractDateServices := TXSDate.Create;
      ENServicesObjectObj.contractDateServices.XSToNative(GetXSDate(edtcontractDateServices.DateTime));
    end;


    if DialogState = dsInsert then
    begin      
      ENServicesObjectObj.code:=low(Integer);      
      TempENServicesObject.addForCalculation(ENServicesObjectObj);      
    end
    else
    if DialogState = dsEdit then
    begin
      //TempENServicesObject.save(ENServicesObjectObj);

      if not (priconnections) then
        TempENServicesObject.saveForCalculation(ENServicesObjectObj)
      else begin
        if not FillENTechConditionsServices then
        begin
          Action := caNone;
					Exit;
				end;
        TempENServicesObject.saveForCalculation(ENServicesObjectObj, ENTechConditionsServicesObj);
      end;
      //SaveENTechConditionsServices;
    end;
  end;

  ENPriconnectionDataObj := nil;
end;

procedure TfrmENServicesCalculationEdit.btnENDepartmentDepartmentClick(Sender : TObject);
var frmENDepartmentShow: TfrmENDepartmentShow; f : ENDepartmentFilter;
begin
  f := ENDepartmentFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  //f.typeRef := ENDepartmentTypeRef.Create;
  //f.typeRef.code := 0; // предприятие ХОЕ ... ENDEPARTMENTTYPE_DEPARTMENT;
  //f.conditionSQL := ' parentrefcode is null';
  //f.conditionSQL :=
  f.code := 1;
  frmENDepartmentShow := TfrmENDepartmentShow.Create(Application, fmNormal, f);
  try
    frmENDepartmentShow.isShowAll := true;
    with frmENDepartmentShow do
      begin
        // DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
          begin
            try
              // if ENServicesObjectObj.department = nil then ENServicesObjectObj.department := ENDepartment.Create();
              DepartmentForServicesCode := ENDepartmentShort(tvDep.Selected.Data).code;
              edtDepartmentForServices.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
              // if  ENServicesObjectObj.element = nil then  ENServicesObjectObj.element := ENElement.Create;
              // if  ENServicesObjectObj.element.renRef = nil then ENServicesObjectObj.element.renRef := EPRenRef.Create;
              // ENServicesObjectObj.element.renRef.code := StrToInt(DMReports.getEPRenByDepartmentCode(ENServicesObjectObj.department.code));
            except
              on EConvertError do Exit;
            end;
          end;
      end;
  finally
    frmENDepartmentShow.Free;
  end;
end;

procedure TfrmENServicesCalculationEdit.btnENElementElementClick(Sender : TObject);
var
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENServicesObjectObj.element = nil then ENServicesObjectObj.element := ENElement.Create();
               ENServicesObjectObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;



procedure TfrmENServicesCalculationEdit.btnContractNumberSelectClick(Sender: TObject);
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
   f.contractNumber := edtContractNumber.Text;
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

procedure TfrmENServicesCalculationEdit.spbContractNumberSelectClick(
  Sender: TObject);
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

   if (ENServicesObjectObj.partnerCode <> '') then
     f.partnerCode := ENServicesObjectObj.partnerCode
   else
   begin
     f.contractNumber := '-1';
     f.partnerCode := '-1';
   end;

   // f.conditionSQL := 'a.io_flag = ''S'' and a.agree_group_id in (205, 342, 319, 88, 201, 218, 303, 198, 50, 206, 338, 44)';
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

                ENServicesObjectObj.name := edtName.Text;
                ENServicesObjectObj.contractNumber := edtContractNumber.Text;
                ENServicesObjectObj.contractDate := TXSDate.Create;
                ENServicesObjectObj.contractDate.XSToNative(GetXSDate(edtcontractDateFin.DateTime));
                ENServicesObjectObj.partnerCode := edtPartnerCode.Text;
                ENServicesObjectObj.finDocCode := edtFinDocCode.Text;
                ENServicesObjectObj.finDocID := StrToInt(edtFinDocID.Text);
                ENServicesObjectObj.commentGen := edtCommentGen.Text;


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

procedure TfrmENServicesCalculationEdit.spbeicClick(Sender: TObject);
var
  TempCCRecordPointLite: CCRecordPointControllerSoapPort;
  RecordPointFilterObj: CCRecordPointFilter;
  RecordPointList: CCRecordPointShortList;
  RecordPointObj: CCRecordPoint;
  elementRenCodeForCC : Integer;

  TempCCRecordPoint: CCRecordPointControllerSoapPort;
  i: Integer;
  CCRecordPointList: CCRecordPointShortList;
  ccRpObjFil: CCRecordPointFilter;
  condition: string;
  begin
  inherited;

        elementRenCodeForCC:= ENServicesObjectObj.element.renRef.code;
        if elementRenCodeForCC = 21 then
           elementRenCodeForCC := 9;


        RecordPointFilterObj:=CCRecordPointFilter.Create;
        SetNullIntProps(RecordPointFilterObj);
        SetNullXSProps(RecordPointFilterObj);

        condition := '';



        condition := ' cccustomer.res = ( select r.res from ccren r where r.code in ( '+ IntToStr(elementRenCodeForCC) +' ) ) and ' +
                              '  CCCUSTOMER.accountnumber = ' + Chr(39) + edtPersonalAccountNumber.Text + Chr(39);


        if( ENServicesObjectObj.personalAccountUid <> '')
        then
        begin
           condition := ' cccustomer.uid = ' + chr(39) + ENServicesObjectObj.personalAccountUid + chr(39) + ' and ' +
                              '  CCCUSTOMER.accountnumber = ' + Chr(39) + edtPersonalAccountNumber.Text + Chr(39) ;
        end
        else
        begin
          condition := ' cccustomer.res = ( select r.res from ccren r where r.code in ( '+ IntToStr(elementRenCodeForCC) +' ) ) and ' +
                              '  CCCUSTOMER.accountnumber = ' + Chr(39) + edtPersonalAccountNumber.Text + Chr(39);
        end;

        RecordPointFilterObj.conditionSQL := condition ;
        RecordPointFilterObj.orderBySQL := ' ccrecordpoint.eic ';

        /// фильтранем по фильтру с РЕСом сперва, и если не найдем EIC коды в разрезе РЕСов
        ///  тогда повторно выберем EIC коды без фильтра по РЕС
        TempCCRecordPoint :=  HTTPRIOCCRecordPoint as CCRecordPointControllerSoapPort;

        ccRpObjFil := CCRecordPointFilter.Create;
        SetNullIntProps(ccRpObjFil);
        SetNullXSProps(ccRpObjFil);

        ccRpObjFil := RecordPointFilterObj;

        CCRecordPointList := TempCCRecordPoint.getScrollableFilteredList(ccRpObjFil,0,-1);

        if (High(CCRecordPointList.list)) =-1
        then
        begin
         RecordPointFilterObj.conditionSQL := ' CCCUSTOMER.accountnumber = ' + Chr(39) + edtPersonalAccountNumber.Text + Chr(39) ;
         RecordPointFilterObj.orderBySQL := ' ccrecordpoint.eic ';
        end;


        frmCCRecordPointShowLite:=TfrmCCRecordPointShowLite.Create(Application,fmNormal, RecordPointFilterObj);
        TempCCRecordPointLite :=  HTTPRIOCCRecordPoint as CCRecordPointControllerSoapPort;
   try
      with frmCCRecordPointShowLite do begin
        if ShowModal = mrOk then
        begin
            try

               edteic.Text := GetReturnValue(sgCCRecordPoint,8);
               edtContragentName.Text := GetReturnValue(sgCCRecordPoint,2);
               edtContragentAddress.Lines.Clear;
               MakeMultiline(edtContragentAddress.Lines, Trim(GetReturnValue(sgCCRecordPoint,3)));
               edtContragentAddress.SelStart:= 0;
               edtContragentAddress.SelLength:= 0;
               edtContragentObjectWork.Text:= GetReturnValue(sgCCRecordPoint,4);
               edtContragentAddressWork.Lines.Clear;
               MakeMultiline(edtContragentAddressWork.Lines, Trim(GetReturnValue(sgCCRecordPoint,5)));


               edtContragentAddressWork.SelStart:= 0;
               edtContragentAddressWork.SelLength:= 0;

               ENServicesObjectObj.codeEIC := trim(edteic.Text);

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmCCRecordPointShowLite.Free;
   end;
end;

procedure TfrmENServicesCalculationEdit.spbENDepartmentDepartmentClick(
  Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
   oldPersonalAccountCode : Integer;
   personalInfo : PersonalServicesInfo;
   TempENServicesObject : ENServicesObjectControllerSoapPort;
   isByt : Boolean;
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
               if ENServicesObjectObj.department = nil then ENServicesObjectObj.department := ENDepartment.Create();
               ENServicesObjectObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
               if  ENServicesObjectObj.element = nil then  ENServicesObjectObj.element := ENElement.Create;
               if  ENServicesObjectObj.element.renRef = nil then ENServicesObjectObj.element.renRef := EPRenRef.Create;
               ENServicesObjectObj.element.renRef.code := StrToInt(DMReports.getEPRenByDepartmentCode(ENServicesObjectObj.department.code));
            except
               on EConvertError do Exit;
            end;

          clearWarrantData;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

   gbReconnectionTU.Visible := getReconnectionTUVisibility(rgContragentType.ItemIndex + 1);

   if (replaceCounter or parameterizationCounter) then
   begin
     lblCountersZoneType.Visible := True;
     cbCountersZoneType.Visible := True;
   end;

    // NET-4295 Сброс кода лицевого счета, чтобы при изменении подразделения
    // юр. не получилось так, что лицевой счет для бывшего подразделения
    // сохранится для нового
   oldPersonalAccountCode := ENServicesObjectObj.personalAccountCode;
   ENServicesObjectObj.personalAccountCode := Low(Integer);
   if(oldPersonalAccountCode <> Low(Integer)) and (Length(Trim(ENServicesObjectObj.personalAccountUid)) > 0) then begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
    isByt := Self.getBytOrProm;
    personalInfo := TempENServicesObject.getPersonalAccountInfo('', ENServicesObjectObj.personalAccountUid, ENServicesObjectObj.department.code, isByt);
    Self.setPersonalServicesInfo(personalInfo);
   end;
end;


procedure TfrmENServicesCalculationEdit.actUpdateExecute(Sender: TObject);
begin
  inherited;
  pcCalculationChange(Self);
end;


procedure TfrmENServicesCalculationEdit.actViewExecute(Sender: TObject);
Var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    TempENPlanWork: ENPlanWorkControllerSoapPort;
    TempENEstimateItem : ENEstimateItemControllerSoapPort;
    tPlan: ENPlanWork;
    objCode: Integer;
    TempENPayment2SO: ENPayment2SOControllerSoapPort;
begin
  if pcCalculation.ActivePage = tsListWork then
  begin

    TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
    try
      ENPlanWorkItemObj := TempENPlanWorkItem.getObject(StrToInt(sgENPlanWorkItem.Cells[0,sgENPlanWorkItem.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENPlanWorkItemEdit:=TfrmENPlanWorkItemEdit.Create(Application, dsView);

    try

      frmENPlanWorkItemEdit.lblMeasure.Caption := 'Вимірювач : ' + sgENPlanWorkItem.Cells[8,sgENPlanWorkItem.Row] + ' /  Од.виміру : ' + sgENPlanWorkItem.Cells[9,sgENPlanWorkItem.Row];
      if frmENPlanWorkItemEdit.ShowModal= mrOk then
      begin
        //TempENLine04.save(ENLine04Obj);
        //UpdateGrid(Sender);
      end;
    finally
      frmENPlanWorkItemEdit.Free;
      frmENPlanWorkItemEdit:=nil;
    end;
  end; // if pcCalculation.ActivePage = tsListWork

  {
  if pcCalculation.ActivePage = tsPlans then
  begin
    try
      objCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]);
    except
      on EConvertError do Exit;
    end;

    tPlan := DMReports.getPlanByCode(objCode);
    if tPlan = nil then Exit;

    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsView);
    try
      frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(objCode);
      frmENPlanWorkEdit.ShowModal;
    finally
      frmENPlanWorkEdit.Free;
      frmENPlanWorkEdit:=nil;
    end;
  end; // if pcCalculation.ActivePage = tsPlans
  }
  
  // -----------------------------------------------
  if pcCalculation.ActivePage = tsEstimateItems then
  begin
    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    try
      ENEstimateItemObj := TempENEstimateItem.getObject(StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]));

    except
      on EConvertError do Exit;
    end;

    frmENEstimateItemEdit := TfrmENEstimateItemEdit.Create(Application, dsView);

    try
      if frmENEstimateItemEdit.ShowModal= mrOk then
      begin
        //TempENLine04.save(ENLine04Obj);
        //UpdateGrid(Sender);
      end;
    finally
      frmENEstimateItemEdit.Free;
      frmENEstimateItemEdit := nil;
    end;
  end;
  // pcCalculation.ActivePage = tsEstimateItems

  // -------------------------------------------------

  if pcCalculation.ActivePage = tsPayment then
  begin
      TempENPayment2SO := HTTPRIOENPayment2SO as ENPayment2SOControllerSoapPort;
       try
         ENPayment2SOObj := TempENPayment2SO.getObject(StrToInt(sgENPayment2SO.Cells[0,sgENPayment2SO.Row]));
       except
       on EConvertError do Exit;
      end;
      frmENPayment2SOEdit:=TfrmENPayment2SOEdit.Create(Application, dsView);
      try
        frmENPayment2SOEdit.ShowModal;
      finally
        frmENPayment2SOEdit.Free;
        frmENPayment2SOEdit:=nil;
      end;
  end;
end;


procedure TfrmENServicesCalculationEdit.actViewIncomeExecute(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
  TempENActIncomeServices: ENActIncomeServicesControllerSoapPort;
begin
  inherited;

  // метод формирования доходгого акта
  if (ENServicesObjectObj.actIncomeCreatMetodRef.code = ENACTINCOME_CREAT_METOD_MORE_ONE) then
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

    LoadActIncome;

  end else
  begin
    ///// 14.05.13 NET-4235
    // Печать акта приема-передачи - только при статусах "Работы выполнены" и "Оплаченный" (для НОВЫХ договоров)
    if ENServicesObjectObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT then
      if (ENServicesObjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_COMPLETED) and
         (ENServicesObjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_PAID) and
         (ENServicesObjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_CLOSE ) then
        raise Exception.Create('NET-4235 Для друку акту прийому-передачі договір повинен мати статус "Роботи виконані" або "Сплачений" або "Закритий"!');
    /////

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'ContractCode';
    args[0] := IntToStr(ENServicesObjectObj.code);

    if ENServicesObjectObj.code = 1017013602 then
      reportName := '!_services_92569/ActPriPer'
    else
      reportName := '201109/ActCalcAdditionalWorkG/ActAccept';

    makeReport(reportName, argNames, args, 'pdf');
  end;
end;


procedure TfrmENServicesCalculationEdit.pcCalculationChange(
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
  LastCount, LastRow, LastCount2, rowCount2 : Integer;
  ENPlanWork2ClassificationTypeList: ENPlanWork2ClassificationTypeShortList;
  /////
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  planFilter: ENPlanWorkFilter;
  ENPlanWorkList: ENPlanWorkShortList;
  n: Integer;
  /////
  TempENAct: ENActControllerSoapPort;
  actFilter: ENActFilter;
  act2Filter: ENActFilter;
  ENActList: ENActShortList;
  ENAct2List: ENActShortList;
  actDate: String;

  TempENEstimateItem : ENEstimateItemControllerSoapPort;
  estimateItemFilter : ENEstimateItemFilter;
  ENEstimateItemList : ENEstimateItemShortList;

  strTechCondPlanCodes: String;

  TempENPayment2SO: ENPayment2SOControllerSoapPort;
  ENPayment2SOList: ENPayment2SOShortList;
  FilterPayment2SO : ENPayment2SOFilter;


  TempENDelayServices: ENDelayServicesControllerSoapPort;
  z: Integer;
  ENDelayServicesList: ENDelayServicesShortList;
  DelayFilter: ENDelayServicesFilter;

  TempENDocAttachment : ENDocAttachmentControllerSoapPort;
  ENDocAttachmentList : ENDocAttachmentShortList;
  docAttachmentFilter : ENDocAttachmentFilter;

  TempSCCounter: SCCounterControllerSoapPort;
  SCCounterList: SCCounterShortList;
  FilterSCCounter : SCCounterFilter;
  LastCount_SCCounter , LastRow_SCCounter : Integer;

  userHasRightToBindCounterManually : Boolean;

begin
  actInsertCalculationDevelopmentRMB.Visible :=
    EditENServicesCalculation.isReimbursement
    and (pcCalculation.ActivePage = tsListWork);
  actInsertCalculationConcordanceRMB.Visible :=
    actInsertCalculationDevelopmentRMB.Visible;
  if (pcCalculation.ActivePage = tsCounterForService ) then
  begin
    SetGridHeaders(SCCounterHeaders, sgSCCounter.ColumnHeaders);
    ColCount:=100;
    TempSCCounter :=  HTTPRIOSCCounter as SCCounterControllerSoapPort;

    ClearGrid(sgSCCounter);

    FilterSCCounter := SCCounterFilter.Create;
    SetNullIntProps(FilterSCCounter);
    SetNullXSProps(FilterSCCounter);

    SCCounterList := TempSCCounter.getCounterForServicesObject(ENServicesObjectObj.code, false);


    LastCount_SCCounter:=High(SCCounterList.list);

    if LastCount_SCCounter > -1 then
       sgSCCounter.RowCount:=LastCount_SCCounter+2
    else
       sgSCCounter.RowCount:=2;

     with sgSCCounter do
      for i:=0 to LastCount_SCCounter do
        begin
          Application.ProcessMessages;

          Cells[0,i+1] := SCCounterList.list[i].invNumber;
          Cells[1,i+1] := SCCounterList.list[i].name;
          Cells[2,i+1] := SCCounterList.list[i].buildNumber;
          Cells[3,i+1] := SCCounterList.list[i].molCode;
          Cells[4,i+1] := SCCounterList.list[i].counterType;
          Cells[5,i+1] := SCCounterList.list[i].account;
          Cells[6,i+1] := SCCounterList.list[i].kindRefName;


           LastRow_SCCounter:=i+1;
          sgSCCounter.RowCount:=LastRow_SCCounter+1;
        end;
     sgSCCounter.Row:=1;
  end;

  if (pcCalculation.ActivePage = tsENDocAttachment) then
  begin
    clearGrid(sgENDocAttachment);

    TempENDocAttachment := HTTPRIOENDocAttachment as ENDocAttachmentControllerSoapPort;

    docAttachmentFilter := ENDocAttachmentFilter.Create;
    SetNullIntProps(docAttachmentFilter);
    SetNullXSProps(docAttachmentFilter);

    docAttachmentFilter.status := ENDocAttachmentStatusRef.Create;
    docAttachmentFilter.status.code := ENDOCATTACHMENTSTATUS_ACTIVE;

    docAttachmentFilter.conditionSQL := ' code in (select da2so.docattachmentrefcode '+
      ' from endcttchmnt2nsrvcsbjct da2so where da2so.servicesobjectrefcode = ' + IntToStr(ENServicesObjectObj.code) + ')';

    ENDocAttachmentList := TempENDocAttachment.getScrollableFilteredList(docAttachmentFilter,0,-1);

    LastCount := High(ENDocAttachmentList.list);

    if LastCount > -1 then
       sgENDocAttachment.RowCount:=LastCount+2
    else
       sgENDocAttachment.RowCount:=2;

     with sgENDocAttachment do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if ENDocAttachmentList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENDocAttachmentList.list[i].code)
          else
          Cells[0,i+1] := '';
          Cells[1,i+1] := ENDocAttachmentList.list[i].commentGen;
          Cells[2,i+1] := ENDocAttachmentList.list[i].fileLink;
          Cells[3,i+1] := ENDocAttachmentList.list[i].userAdd;
          if ENDocAttachmentList.list[i].dateAdd = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := XSDateTimeWithDate2String(ENDocAttachmentList.list[i].dateAdd);
          Cells[5,i+1] := ENDocAttachmentList.list[i].userGen;
          if ENDocAttachmentList.list[i].dateEdit = nil then
            Cells[6,i+1] := ''
          else
            Cells[6,i+1] := XSDateTimeWithDate2String(ENDocAttachmentList.list[i].dateEdit);

          LastRow:=i+1;
          sgENDocAttachment.RowCount:=LastRow+1;
        end;
     ColCount:=ColCount+1;
     sgENDocAttachment.Row:=1;
  end;


  if pcCalculation.ActivePage = tsDelay then
  begin
  cleargrid(sgENDelayServices);
  SetGridHeaders(ENDelayServicesHeaders, sgENDelayServices.ColumnHeaders);
  ColCount:=100;
  TempENDelayServices :=  HTTPRIOENDelayServices as ENDelayServicesControllerSoapPort;

     DelayFilter := ENDelayServicesFilter.Create;
     SetNullIntProps(DelayFilter);
     SetNullXSProps(DelayFilter);
     DelayFilter.servicesObjectRef := ENServicesObjectRef.Create;
     DelayFilter.servicesObjectRef.code := ENServicesObjectObj.code;

  ENDelayServicesList := TempENDelayServices.getScrollableFilteredList(DelayFilter,0,ColCount);


  LastCount:=High(ENDelayServicesList.list);

  if LastCount > -1 then
     sgENDelayServices.RowCount:=LastCount+2
  else
     sgENDelayServices.RowCount:=2;

{
        ( 'Код'
          ,'Дата начала задержки'
          ,'Дата окончания задержки'
          ,'Количество календар. дней'
          ,'Количество рабоч. дней'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );

}

   with sgENDelayServices do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDelayServicesList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENDelayServicesList.list[i].code)
        else
          Cells[0,i+1] := '';
        if ENDelayServicesList.list[i].dateStart = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(ENDelayServicesList.list[i].dateStart);
        if ENDelayServicesList.list[i].dateFinal = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENDelayServicesList.list[i].dateFinal);

        if ENDelayServicesList.list[i].calendarDaysCount <> Low(Integer) then
          Cells[3,i+1] := IntToStr(ENDelayServicesList.list[i].calendarDaysCount)
        else
          Cells[3,i+1] := '';

        if ENDelayServicesList.list[i].workDaysCount <> Low(Integer) then
          Cells[4,i+1] := IntToStr(ENDelayServicesList.list[i].workDaysCount)
        else
          Cells[4,i+1] := '';

        Cells[5,i+1] := ENDelayServicesList.list[i].userGen;

        if ENDelayServicesList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDateTimeWithDate2String(ENDelayServicesList.list[i].dateEdit);
        LastRow:=i+1;
        sgENDelayServices.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENDelayServices.Row:=1;

  end;
{
  if ENServicesObjectObj <> nil then
  begin
    if (ENServicesObjectObj.contractStatusRef <> nil) and (ENServicesObjectObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) and
       (pcCalculation.ActivePage <> tsPlans) then
      DisableActions([actInsert])
    else begin
      if (DialogState = dsEdit) and (pcCalculation.ActivePage = tsEstimateItems) then
        DisableActions([actInsert], False);
      if (DialogState = dsEdit) and (pcCalculation.ActivePage = tsPlans) and (priconnections) then
        DisableActions([actInsert], False);
    end;
  end
  else begin
    if (DialogState = dsEdit) and (pcCalculation.ActivePage = tsEstimateItems) then
      DisableActions([actInsert], False);
    if (DialogState = dsEdit) and (pcCalculation.ActivePage = tsPlans) and (priconnections) then
      DisableActions([actInsert], False);
  end;

  if (DialogState = dsEdit) and (pcCalculation.ActivePage = tsPlans) and (priconnections) then
    DisableActions([actInsertPlan], False)
  else
    DisableActions([actInsertPlan]);
}

  // if (DialogState = dsEdit) and (pcCalculation.ActivePage = tsPlans) and (priconnections) then DisableActions([actInsert], False);

  if pcCalculation.ActivePage = tsListWork then
  begin
    ////////////////////////////////////////////////////////////////////////////
    ClearGrid(sgENPlanWork2ClassificationType);

    if planCode = LOW_INT then Exit;

    TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;

    ENPlanWork2ClassificationTypeList := Self.getCalculationList;

    LastCount := High(ENPlanWork2ClassificationTypeList.list);

    if LastCount > -1 then
      begin
       sgENPlanWork2ClassificationType.RowCount := LastCount+2;
          ////////////////////////////////////////////////////////////////////////////
          // проверяем калькуляции в договоре (если такие что резервируется под них время то отображаем поля и показываем свободное время на день )
           if ENPlanWork2ClassificationTypeList.list[i].isJobsByTime = 1  then
              updateRezervedView();
       end
    else
       sgENPlanWork2ClassificationType.RowCount := 2;

     with sgENPlanWork2ClassificationType do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if ENPlanWork2ClassificationTypeList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(ENPlanWork2ClassificationTypeList.list[i].code)
          else
            Cells[0,i+1] := '';

          Cells[1,i+1] := ENPlanWork2ClassificationTypeList.list[i].classificationTypeRefKod;
          Cells[2,i+1] := ENPlanWork2ClassificationTypeList.list[i].classificationTypeRefName;

          if ENPlanWork2ClassificationTypeList.list[i].countGen = nil then
            Cells[3,i+1] := ''
          else
            Cells[3,i+1] := ENPlanWork2ClassificationTypeList.list[i].countGen.DecimalString;

          /////
          try
            RowColor[i+1] := clWindow;

            // Если калькуляция с нулевым кол-вом, выделяем строку цветом
            if ENPlanWork2ClassificationTypeList.list[i].countGen <> nil then
              if StrToFloat(ENPlanWork2ClassificationTypeList.list[i].countGen.DecimalString) = 0 then
                RowColor[i+1] := clTeal; //clRed;
          except
          end;
          /////

          LastRow:=i+1;
          sgENPlanWork2ClassificationType.RowCount:=LastRow+1;
        end;

       //ColCount:=ColCount+1;
       sgENPlanWork2ClassificationType.Row:=1;
    ////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////
    ClearGrid(sgENPlanWorkItem);
    if planCode = LOW_INT then Exit;

    //DisableActions([actInsert,  actEdit, actDelete, actFilter, actNoFilter], not (DialogState in [dsEdit, dsInsert]) );


    iColCount:=-1;


    if planItemFilter = nil then
    begin
       planItemFilter := ENPlanWorkItemFilter.Create;
       SetNullIntProps(planItemFilter);
       SetNullXSProps(planItemFilter);
    end;

    //if DialogState in ([dsEdit, dsView]) then
    //begin

    if priconnections then
    begin
      planItemFilter.conditionSQL := 'planrefcode in (select p.code from enplanwork p where p.elementrefcode = ' +
        IntToStr(ENServicesObjectObj.element.code) + ' and p.kindcode = ' + IntToStr(ENPLANWORKKIND_CALCULATION) + ')';
    end
    else begin
      if planItemFilter.planRef = nil then planItemFilter.planRef := ENPlanWorkRef.Create;
      planItemFilter.planRef.code := planCode; //DMReports.getPlanCodeByElement(ENServicesObjectObj.element.code); // выбрать по коду элемента код плана  ENPlanWorkObj.code;
    end;

    planItemFilter.orderBySQL := ' enplanworkitem.kartarefcode';

    TempENPlanWorkItem :=  HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
    try

    ENPlanWorkItemList := TempENPlanWorkItem.getScrollableFilteredList(planItemFilter,0,-1);
    except
      on E: Exception do ShowMessage (E.Message);

    end;

    iLastCount:=High(ENPlanWorkItemList.list);

    if iLastCount > -1 then
       sgENPlanWorkItem.RowCount:=iLastCount+2
    else
       sgENPlanWorkItem.RowCount:=2;

     with sgENPlanWorkItem do
      for i:=0 to iLastCount do
        begin
          Application.ProcessMessages;
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
            
            // Если работа с нулевым кол-вом, выделяем строку цветом
            if ENPlanWorkItemList.list[i].countGen <> nil then
              if StrToFloat(ENPlanWorkItemList.list[i].countGen.DecimalString) = 0 then
                RowColor[i+1] := clTeal; //clRed;
          except
          end;
          /////

          iLastRow:=i+1;
          sgENPlanWorkItem.RowCount:=iLastRow+1;
        end;

    //end;
     iColCount:=iColCount+1;
     sgENPlanWorkItem.Row:=1;

//       SUPP-77213 скрыть печать кошториса
      if ENServicesObjectObj.isNoPay = ENCOnsts.ENSERVICESOBJECT_ISNOPAY then
       HideControls([ ToolButton45 , ToolButton3  ]);


  end; // if pcCalculation.ActivePage = tsListWork

  if pcCalculation.ActivePage = tsPlans then
  begin
    ClearGrid(sgENPlanWork);

    if ENServicesObjectObj = nil then Exit;
    if ENServicesObjectObj.element = nil then Exit;
    if ENServicesObjectObj.element.code = LOW_INT then Exit;

    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    planFilter := ENPlanWorkFilter.Create;
    SetNullIntProps(planFilter);
    SetNullXSProps(planFilter);

    //planFilter.elementRef := ENElementRef.Create;
    //planFilter.elementRef.code := ENServicesObjectObj.element.code;

    {
    planFilter.conditionSQL := '(enplanwork.elementrefcode = ' + IntToStr(ENServicesObjectObj.element.code) +
                               ' or enplanwork.code in ' +
                               '( ' +
                               ' select tc2p.planrefcode ' +
                               ' from entechcond2planwork tc2p, enservicesobject2techcondtnsservices so2tc ' +
                               ' where tc2p.techconservicesrefcode = so2tc.techcondservrefcode ' +
                               '   and so2tc.servicesobjectrefcode = ' + IntToStr(ENServicesObjectObj.code) +
                               '))';
    }

    strTechCondPlanCodes := '-1';

    if ENTechConditionsServicesObj <> nil then
      if ENTechConditionsServicesObj.code <> LOW_INT then
        strTechCondPlanCodes := DMReports.getStrCodePlanFromENtechCond2enplanwork(ENTechConditionsServicesObj.code);

    planFilter.conditionSQL := '(enplanwork.elementrefcode = ' + IntToStr(ENServicesObjectObj.element.code) +
                               ' or enplanwork.code in (' + strTechCondPlanCodes + '))';


    ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(planFilter, 0, -1);

    LastCount := High(ENPlanWorkList.list);

    if LastCount > -1 then
      sgENPlanWork.RowCount := LastCount + 2
    else
      sgENPlanWork.RowCount := 2;

    with sgENPlanWork do
      for i := 0 to LastCount do
        begin
          Application.ProcessMessages;

          n := 0;

          if ENPlanWorkList.list[i].code <> Low(Integer) then
            Cells[n,i+1] := IntToStr(ENPlanWorkList.list[i].code)
          else
            Cells[n,i+1] := '';
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].objectName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].invNumber;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].renRefName;
          inc(n);

          if ENPlanWorkList.list[i].yearGen <> Low(Integer) then
            Cells[n,i+1] := IntToStr(ENPlanWorkList.list[i].yearGen)
          else
            Cells[n,i+1] := '';
          inc(n);

          if ENPlanWorkList.list[i].monthGen <> Low(Integer) then
            //Cells[4,i+1] := IntToStr(ENPlanWorkList.list[i].monthGen)
            Cells[n,i+1] := MonthesNames[ENPlanWorkList.list[i].monthGen]
          else
            Cells[n,i+1] := '';
          inc(n);

          if ENPlanWorkList.list[i].dateStart = nil then
            Cells[n,i+1] := ''
          else
            Cells[n,i+1] := XSDate2String(ENPlanWorkList.list[i].dateStart);
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].typeRefName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].stateRefShortName;
          inc(n);


          Cells[n,i+1] := ENPlanWorkList.list[i].kindName ;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].statusName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].departmentRefShortName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].budgetRefShortName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].responsibilityRefShortName;
          inc(n);

          Cells[n,i+1] := '';

          //if ENPlanWorkList.list[i].yearOriginal <> Low(Integer) then
          if ENPlanWorkList.list[i].yearOriginal > 0 then
          begin
            //if ENPlanWorkList.list[i].monthOriginal <> Low(Integer) then
            if ENPlanWorkList.list[i].monthOriginal > 0 then
              Cells[n,i+1] := MonthesNames[ENPlanWorkList.list[i].monthOriginal] + ' ' +
                              IntToStr(ENPlanWorkList.list[i].yearOriginal);
          end
          else
            Cells[n,i+1] := '';
          inc(n);
          /////

          Cells[n,i+1] := ENPlanWorkList.list[i].workOrderNumber;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].userGen;
          inc(n);

          if ENPlanWorkList.list[i].dateEdit = nil then
            Cells[n,i+1] := ''
          else
            Cells[n,i+1] := XSDate2String(ENPlanWorkList.list[i].dateEdit);
          inc(n);

          //Objects[0,i+1] := ENPlanWorkShort.Create;
          //Objects[0,i+1] := TObject(ENPlanWorkList.list[i]); //TObject(ENPlanWorkList.list[i].statusCode);

          //LastRow := i + 1;
          sgENPlanWork.RowCount := i + 2; //LastRow + 1;
        end;
     //ColCount:=ColCount+1;
     sgENPlanWork.Row := 1;

     sgENPlanWorkClick(Sender);

     updateActFailure();
  end; // if pcCalculation.ActivePage = tsPlans

  if pcCalculation.ActivePage = tsActs then
  begin
    ClearGrid(sgENAct);

    if ENServicesObjectObj = nil then Exit;
    if ENServicesObjectObj.element = nil then Exit;
    if ENServicesObjectObj.element.code = LOW_INT then Exit;    

    actDate := '';
    
    TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

    actFilter := ENActFilter.Create;
    SetNullIntProps(actFilter);
    SetNullXSProps(actFilter);
    actFilter.element := ENElement.Create;
    actFilter.element.code := ENServicesObjectObj.element.code;

    if (priconnections) and (ENTechConditionsServicesObj <> nil) then
    begin
      act2Filter := ENActFilter.Create;
      SetNullIntProps(act2Filter);
      SetNullXSProps(act2Filter);
      act2Filter.conditionSQL := ' code in ( select a.code from enact a where a.code in ( ' +
           '	 select a2pl.actrefcode from enact2enplanwork a2pl  ' +
           '	 where a2pl.plancode in ( ' +
           '	  select ct2pl.planrefcode from entechcond2planwork ct2pl ' +
           '	   where ct2pl.techconservicesrefcode = '  + IntToStr(ENTechConditionsServicesObj.code)  + ' ) ) ' +
                             '          and a.code not in (select ff.actcode from rqfkorder2planfact ff )) ' ;

      ENAct2List := TempENAct.getScrollableFilteredList(act2Filter, 0, -1);
    end;


    ENActList := TempENAct.getScrollableFilteredList(actFilter, 0, -1);

    LastCount := High(ENActList.list);

    if (priconnections) and (ENTechConditionsServicesObj <> nil) then LastCount2 := High(ENAct2List.list);

    if LastCount > -1 then
      sgENAct.RowCount := LastCount + 2
    else
      sgENAct.RowCount := 2;

    with sgENAct do
      for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENActList.list[i].code)
        else
          Cells[0,i+1] := '';
        Cells[1,i+1] := ENActList.list[i].numberGen;
        if ENActList.list[i].dateAct = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENActList.list[i].dateAct);

        if (i = 0) then
          actDate := Cells[2, i + 1];

        Cells[3,i+1] := ENActList.list[i].finMolName;
        Cells[4,i+1] := ENActList.list[i].actTypeRefName;
        Cells[5,i+1] := ENActList.list[i].statusRefName;

        sgENAct.RowCount := i + 2;
      end;

      if (priconnections) and (ENTechConditionsServicesObj <> nil) then
      begin
         if LastCount = -1 then
           rowCount2 := 1
         else rowCount2 := sgENAct.RowCount;

         sgENAct.RowCount := sgENAct.RowCount + LastCount2 + 1;

         with sgENAct do
          for i:=0 to LastCount2 do
          begin
            Application.ProcessMessages;
            if ENAct2List.list[i].code <> Low(Integer) then
              Cells[0,i+rowCount2] := IntToStr(ENAct2List.list[i].code)
            else
              Cells[0,i+rowCount2] := '';
            Cells[1,i+rowCount2] := ENAct2List.list[i].numberGen;
            if ENAct2List.list[i].dateAct = nil then
              Cells[2,i+rowCount2] := ''
            else
              Cells[2,i+rowCount2] := XSDate2String(ENAct2List.list[i].dateAct);

            if (i = 0) then
              actDate := Cells[2, i + 1+rowCount2];

            Cells[3,i+rowCount2] := ENAct2List.list[i].finMolName;
            Cells[4,i+rowCount2] := ENAct2List.list[i].actTypeRefName;
            Cells[5,i+rowCount2] := ENAct2List.list[i].statusRefName;
          end;
      end;


    sgENAct.Row := 1;

    /////
    ClearGrid(sgENActIncome);

    // метод формирования доходгого акта
    DisableActions([actChangeCreatMetod]);
    cbActIncomeCreatMetod.ItemIndex := ENServicesObjectObj.actIncomeCreatMetodRef.code - 1;

    if (ENServicesObjectObj.actIncomeCreatMetodRef.code = ENACTINCOME_CREAT_METOD_SINGLE) then
    begin
      sgENActIncome.Visible := True;
      sgENActIncomeServices.Visible := False;

      with sgENActIncome do
      begin
        Cells[1, 1] := ENServicesObjectObj.contractNumberServices + '/' + ENServicesObjectObj.contractNumber;
        Cells[2, 1] := actDate;
      end;
    end else
    begin
      sgENActIncome.Visible := False;
      sgENActIncomeServices.Visible := True;
      LoadActIncome();
    end;

  end; // if pcCalculation.ActivePage = tsActs



  //------------------------------------------------
  if pcCalculation.ActivePage = tsEstimateItems then
  begin
    SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);
    ClearGrid(sgENEstimateItem);

    if ENServicesObjectObj = nil then Exit;
    if ENServicesObjectObj.element = nil then Exit;
    if ENServicesObjectObj.element.code = LOW_INT then Exit;

    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    planFilter := ENPlanWorkFilter.Create;
    SetNullIntProps(planFilter);
    SetNullXSProps(planFilter);

    planFilter.elementRef := ENElementRef.Create;
    planFilter.elementRef.code := ENServicesObjectObj.element.code;
    planFilter.kind := ENPlanWorkKind.Create;
    planFilter.kind.code := ENPLANWORKKIND_CALCULATION;

    ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(planFilter, 0, -1);

    iColCount := -1;
    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

    estimateItemFilter := ENEstimateItemFilter.Create;
    SetNullIntProps(estimateItemFilter);
    SetNullXSProps(estimateItemFilter);

    if estimateItemFilter.planRef = nil then estimateItemFilter.planRef := ENPlanWorkRef.Create;
    ///// 21.09.12
    // Что это за фигня такая?? Тут же "i" нигде не определено!!!
    // estimateItemFilter.planRef.code := ENPlanWorkList.list[i].code;
    if ENPlanWorkList.totalCount > 0 then
      estimateItemFilter.planRef.code := ENPlanWorkList.list[0].code
    else
      estimateItemFilter.planRef.code := -1; // чтобы ничего не выбралось
    /////

    if estimateItemFilter.kindRef = nil then estimateItemFilter.kindRef := ENEstimateItemKindRef.Create;
    estimateItemFilter.kindRef.code := ENESTIMATEITEMKIND_MATERIALS;

    ////
    estimateItemFilter.orderBySQL := 'KR.TECHKARTNUMBER, SM.NAME, ENESTIMATEITEMTYPE.CODE';
    ////

    ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(estimateItemFilter, 0, -1);

    iLastCount := High(ENEstimateItemList.list);

    if iLastCount > -1 then
      sgENEstimateItem.RowCount := iLastCount + 2
    else
      sgENEstimateItem.RowCount := 2;

     with sgENEstimateItem do
       for i := 0 to iLastCount do
       begin
         Application.ProcessMessages;

         if ENEstimateItemList.list[i].code <> Low(Integer) then
           Cells[0,i+1] := IntToStr(ENEstimateItemList.list[i].code)
         else
           Cells[0,i+1] := '';

         AddCheckBox(1, i+1, false, false);

         Cells[1,i+1] := ENEstimateItemList.list[i].materialRefName;

         if ENEstimateItemList.list[i].countGen = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := ENEstimateItemList.list[i].countGen.DecimalString;

         if ENEstimateItemList.list[i].countFact = nil then
           Cells[3,i+1] := ''
         else
           Cells[3,i+1] := ENEstimateItemList.list[i].countFact.DecimalString;

         Cells[4,i+1] := ENEstimateItemList.list[i].measureType;
         Cells[5,i+1] := ENEstimateItemList.list[i].kartaNum;
         Cells[6,i+1] := ENEstimateItemList.list[i].kartaRefName;
         Cells[7,i+1] := ENEstimateItemList.list[i].typeRefName;
         Cells[8,i+1] := ENEstimateItemList.list[i].statusRefName;
         Cells[9,i+1] := ENEstimateItemList.list[i].userGen;

         if ENEstimateItemList.list[i].dateEdit = nil then
           Cells[10,i+1] := ''
         else
           Cells[10,i+1] := XSDate2String(ENEstimateItemList.list[i].dateEdit);

           RowColor[i+1] := clWindow;

           // Выделяем цветом ручной ввод
           if ENEstimateItemList.list[i].typeRefCode in [ENESTIMATEITEMTYPE_CORRECTED, ENESTIMATEITEMTYPE_MANUAL_BY_PLANITEM]  then
             RowColor[i+1] := clMoneyGreen; //$EBFFF5

           // Выделяем цветом строки, относящиеся ко всей смете
           if ENEstimateItemList.list[i].typeRefCode in [ENESTIMATEITEMTYPE_MANUAL_BY_PLAN]  then
             RowColor[i+1] := clYellow;

         Objects[0,i+1] := TObject(ENEstimateItemList.list[i].typeRefCode);
         Objects[1,i+1] := TObject(ENEstimateItemList.list[i].statusRefCode);
         Objects[2,i+1] := TObject(ENEstimateItemList.list[i].accountingTypeRefCode);

         iLastRow := i + 1;
         sgENEstimateItem.RowCount := iLastRow + 1;
       end;

     iColCount := iColCount + 1;
     sgENEstimateItem.Row := 1;
  end;   // pcCalculation.ActivePage = tsEstimateItems

  if pcCalculation.ActivePage = tsCounters then
  begin
    ClearGrid(sgENClassificationsWithCounters);
	
	//SUPP-66815
	userHasRightToBindCounterManually := ((DMReports.checkUsersGroup(GROUP_ADMIN)) or (DMReports.checkUsersGroup(GROUP_BIND_COUNTERS_MANUALLY_TO_SERVICES_OBJECT)));
	actBindCounterToServicesObject.Visible := userHasRightToBindCounterManually;
	actUnbindCounterToServicesObject.Visible := userHasRightToBindCounterManually;
	actBindCounterToServicesObject.Enabled := userHasRightToBindCounterManually;
	actUnbindCounterToServicesObject.Enabled := userHasRightToBindCounterManually;

    if planCode = LOW_INT then Exit;

    TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;

    plan2ctFilter := ENPlanWork2ClassificationTypeFilter.Create;
    SetNullIntProps(plan2ctFilter);
    SetNullXSProps(plan2ctFilter);

    plan2ctFilter.planRef := ENPlanWorkRef.Create;
    plan2ctFilter.planRef.code := planCode;

    plan2ctFilter.conditionSQL := 'coalesce(TKCLASSIFICATIONTYPE.ISGIVECOUNTER, 0) > 0';

    ENPlanWork2ClassificationTypeList := TempENPlanWork2ClassificationType.getScrollableFilteredList(plan2ctFilter, 0, -1);

    if High(ENPlanWork2ClassificationTypeList.list) > -1 then
      sgENClassificationsWithCounters.RowCount := High(ENPlanWork2ClassificationTypeList.list) + 2
    else
      sgENClassificationsWithCounters.RowCount := 2;

    with sgENClassificationsWithCounters do
      for i := 0 to High(ENPlanWork2ClassificationTypeList.list) do
      begin
        Application.ProcessMessages;
        if ENPlanWork2ClassificationTypeList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENPlanWork2ClassificationTypeList.list[i].code)
        else
          Cells[0,i+1] := '';

        Cells[1,i+1] := ENPlanWork2ClassificationTypeList.list[i].classificationTypeRefKod;
        Cells[2,i+1] := ENPlanWork2ClassificationTypeList.list[i].classificationTypeRefName;

        if ENPlanWork2ClassificationTypeList.list[i].countGen = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENPlanWork2ClassificationTypeList.list[i].countGen.DecimalString;

        sgENClassificationsWithCounters.RowCount:=i+2;
      end;

    sgENClassificationsWithCounters.Row := 1;
    sgENClassificationsWithCountersClick(Sender);
  end; // if pcCalculation.ActivePage = tsCounters

    if pcCalculation.ActivePage = tsCalcItems then
     begin
      actUpdateCAIExecute(Sender);
     end;

  if pcCalculation.ActivePage = tsPayment then
  begin
    SetGridHeaders(ENPayment2SOHeaders, sgENPayment2SO.ColumnHeaders);
    ClearGrid(sgENPayment2SO);

    if ENServicesObjectObj = nil then Exit;
    if ENServicesObjectObj.element = nil then Exit;
    if ENServicesObjectObj.element.code = LOW_INT then Exit;

    
    TempENPayment2SO :=  HTTPRIOENPayment2SO as ENPayment2SOControllerSoapPort;


     FilterPayment2SO := ENPayment2SOFilter.Create;
     SetNullIntProps(FilterPayment2SO);
     SetNullXSProps(FilterPayment2SO);

     FilterPayment2SO.servicesObjectRef := ENServicesObjectRef.Create;
     FilterPayment2SO.servicesObjectRef.code :=  ENServicesObjectObj.code;

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
  end;   // pcCalculation.ActivePage = tsEstimateItems

  if pcCalculation.ActivePage = tsServicesObject2FKInfo then
     begin
       actUpdateService2FKInfoExecute(Sender);
     end;


end;

procedure TfrmENServicesCalculationEdit.FormCreate(Sender: TObject);
begin
  inherited;
	planCode := LOW_INT;
  priconnections := false;
  checkWarrant := true;
	isNotCalculated := True;
 // При создании формы параметр возможности определения биллингового
 // ip адреса будет сетиться ложным, он опредилиться позже, если введено подразделение
  isAvailableBillingIPAddress := False;
  isWorkConnection := False;
  showTransportRoute := False;
  replaceCounter := False;
  innerNetProject := False;
  isContainsKSU := False;
  parameterizationCounter := False;
  changeActIncomeCreatMetod := False;
  requiredEIC := True;
end;


procedure TfrmENServicesCalculationEdit.actPrintCalculationExecute( Sender: TObject);
var argNames, args: ArrayOfString;
		reportName: String;
    Licensed : Integer;

   TempENPlanWork2ClassificationType: ENPlanWork2ClassificationTypeControllerSoapPort;
   plan2ctFilter: ENPlanWork2ClassificationTypeFilter;
   ENPlanWork2ClassificationTypeList: ENPlanWork2ClassificationTypeShortList;
   ENPlanWork2ClassificationTypeCode : Integer;
   pw2ctObj: ENPlanWork2ClassificationType;

  TempTKClassificationType: TKClassificationTypeControllerSoapPort;
  //i: Integer;
  TKClassificationTypeList: TKClassificationTypeShortList;
  TKClassificationTypef: TKClassificationTypeFilter;

begin
  // проверка лиценз работа или нет

/////////////// по другому перешифровать какой вид дейтельности это по коду объекта  связки
          ENPlanWork2ClassificationTypeCode := StrToInt(sgENPlanWork2ClassificationType.Cells[0, sgENPlanWork2ClassificationType.Row]);
          TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;
          pw2ctObj := TempENPlanWork2ClassificationType.getObject(ENPlanWork2ClassificationTypeCode);
           if pw2ctObj <> nil then
             TempTKClassificationType :=  HTTPRIOTKClassificationType as TKClassificationTypeControllerSoapPort;
             TKClassificationTypeF := TKClassificationTypeFilter.Create;
             SetNullIntProps(TKClassificationTypeF);
             SetNullXSProps(TKClassificationTypeF);
             TKClassificationTypeF.code := pw2ctObj.classificationTypeRef.code;
             TKClassificationTypeList := TempTKClassificationType.getScrollableFilteredList(TKClassificationTypeF,0,-1);
             //Licensed := TKClassificationTypeList.list[i].isnotlicensedactivity;
             Licensed := TKClassificationTypeList.list[0].isnotlicensedactivity;



  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'soCode';

  if (DialogState = dsInsert) then
     begin
     ENServicesObjectObj := DMReports.getServicesObjectByPlanCode(planCode);
     args[0] := IntToStr(ENServicesObjectObj.code);
     end
  else
     args[0] := IntToStr(ENServicesObjectObj.code);

  if Licensed = ISNOTLICENSEDACTIVITY_NKRE  then  // лицензированые работы НКРЕ
     reportName := '201109/ActCalcAdditionalWorkG_NKRE/ActCalc'
  else if Licensed = ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT  then
     reportName := '201109/ActCalcAdditionalWorkG/ActCalc_notlicensed/ActCalc_notlicensed'
  else if ( (Licensed <> ISNOTLICENSEDACTIVITY_NKRE) and (Licensed <> ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT) ) then
     reportName := '201109/ActCalcAdditionalWorkG/ActCalc';

  makeReport(reportName , argNames , args , 'xls');
end;

procedure TfrmENServicesCalculationEdit.SetFormCaption(elementCode: Integer);
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

      if (priconnections) then
        Self.Caption := 'Приєднання. Договір № ' + servicesObjList.list[0].contractNumberServices
      else
        Self.Caption := 'Роботи на сторону. Договір № ' + servicesObjList.list[0].contractNumberServices;

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

 
procedure TfrmENServicesCalculationEdit.btnPrintContractClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;

  TempTKClassification2ENDepartment: TKClassification2ENDepartmentControllerSoapPort;
  i: Integer;
  TKClass2DepFilter : TKClassification2ENDepartmentFilter;
  TKClassification2ENDepartmentList: TKClassification2ENDepartmentShortList;
  
  //isReservedWorks : Boolean;
  //isVisitClient : Boolean;
  codePlanStr : string;
  isApprovProjectDoc : Boolean;
    TempENPlanWork2ClassificationType: ENPlanWork2ClassificationTypeControllerSoapPort;
    plan2ctFilter: ENPlanWork2ClassificationTypeFilter;
    plan2ctList: ENPlanWork2ClassificationTypeShortList;
		TempENServicesObject: ENServicesObjectControllerSoapPort;
begin
	if ENServicesObjectObj = nil then Exit;
  if ENServicesObjectObj.contractTypeRef = nil then Exit;
  if ENServicesObjectObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesObjectObj.calcTypeRef = nil then Exit;
  if ENServicesObjectObj.calcTypeRef.code = LOW_INT then Exit;

  /////
  if ENServicesObjectObj.contractStatusRef = nil then Exit;

  if ENServicesObjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

   if ENServicesObjectObj.contractDateServices = nil then
    raise Exception.Create('Введіть дату договору!');

  if ENServicesObjectObj.contractTypeRef.code <> ENSERVICESOBJECTTYPE_CONNECTION then
  begin

     replaceCounter := DMReports.checkReplaceCounterServices(ENServicesObjectObj.element.code);

     isApprovProjectDoc:= False;
     codePlanStr:= ''; 
     codePlanStr:= IntToStr(DMReports.getPlanCodeForCalculationByElement(ENServicesObjectObj.element.code));


         // признак если есть в договоре класификации у которых родительская класификация =  узгодження проектної документації
				 if codePlanStr <> '' then
				 begin
					 TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;

					 plan2ctFilter := ENPlanWork2ClassificationTypeFilter.Create;
					 SetNullIntProps(plan2ctFilter);
					 SetNullXSProps(plan2ctFilter);

					 plan2ctFilter.planRef := ENPlanWorkRef.Create;
					 plan2ctFilter.planRef.code := StrToInt(codePlanStr);
					 plan2ctFilter.conditionSQL := ' classificationtyperfcd in ( select tc.code  from  tkclassificationtype tc   where tc.parentrefcode = 500003578 )  ';
					 plan2ctList := TempENPlanWork2ClassificationType.getScrollableFilteredList(plan2ctFilter, 0, -1);

					 if plan2ctList.totalCount > 0 then
						 isApprovProjectDoc:= True;
				 end;


    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'soCode';
    args[0] := IntToStr(ENServicesObjectObj.code);

    // по умолчанию печатаем стандартную форму договора
    reportName := 'Services/4Services/agree';

    if codePlanStr = '1018431447' then
    reportName := '!_services_92569/d1';

    //  надання послуг з погодження проектної документації
    if isApprovProjectDoc then
    begin
        if ENServicesObjectObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_CALCULATION then
             reportName := 'Services/Agree/dApprovProjectDoc'
           else begin
             if ENServicesObjectObj.contragentTypeRef.code = ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET then
               reportName := 'Services/Agree/dApprovProjectDoc_budjet'
             else
               reportName := 'Services/Agree/dApprovProjectDoc_notbudjet';
           end;
    argNames[0] := 'plancode';
    args[0] := codePlanStr;
    end;

     TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    // перед печатью договоров проверим правильно ли подвязали счетчики под класификации если это классификации такие что для их выполнения нужно передавать счетчик
      TempENServicesObject.checkGiveCounters(ENServicesObjectObj.code);

      makeReport(reportName , argNames , args , 'pdf');

  end
  else begin
    if ENTechConditionsServicesObj.code = LOW_INT then Exit;

    if ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_UNDEFINED then
    begin
      Application.MessageBox(PChar('Ще не визначений тип договору (Стандартне/Нестандартне приєднання)!'),
                             PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;

    if (ENTechConditionsServicesObj.connectionKindRef.code <>
      ENCONNECTIONKIND_GENERAL_CONNECTION)
    and (ENTechConditionsServicesObj.contractDateFinal = nil) then //(not edtContractDateFinal.Checked) then //SUPP-2609
      begin
        Application.MessageBox(PChar('Не заповнена кінцева дата дії договору.'),
          PChar('Увага!'), MB_ICONWARNING);
        pcCalculation.ActivePage := tsPriconnection;
        if edtContractDateFinal.CanFocus then
          edtContractDateFinal.SetFocus;
        Exit;
      end;

    if getContragentsCount() = 0 then
    begin
      Application.MessageBox(PChar('Спочатку потрібно ввести Замовників!'),
                             PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;
    /////////////////

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'agreeCode';
    args[0] := IntToStr(ENTechConditionsServicesObj.code);

    if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART) then
      reportName := 'TechConditions/agree_standart_connection'

    //NET-4223
    else if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_NO_STANDART) then
      reportName := 'TechConditions/agree_no_standart_connection'

    else if (ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_PROJECT)
          and (ENTechConditionsServicesObj.contragentForm.code = ENTECHCONDITIONSSERVICES_FORM_SOLIDARITY) then
      reportName := 'TechConditions/solidary_agree_project_providing'
    else if (ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION)
          and (ENTechConditionsServicesObj.contragentForm.code = ENTECHCONDITIONSSERVICES_FORM_SOLIDARITY) then
      reportName := 'TechConditions/solidary_agree_building_providing'

    else if ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_PROJECT then
      reportName := 'TechConditions/agree_project_providing'
    else if ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION then
      reportName := 'TechConditions/agree_building_providing';

    makeReport(reportName, argNames, args, 'pdf');
  
  end;
end;



procedure TfrmENServicesCalculationEdit.btnPrintBillClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
    copystr: String;
begin
  if ENServicesObjectObj = nil then Exit;
  if ENServicesObjectObj.contractTypeRef = nil then Exit;
  if ENServicesObjectObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesObjectObj.calcTypeRef = nil then Exit;
  if ENServicesObjectObj.calcTypeRef.code = LOW_INT then Exit;

  /////
  if ENServicesObjectObj.contractStatusRef = nil then Exit;

  if ENServicesObjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

  ///// 14.05.13 NET-4235
  if (ENServicesObjectObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT) then
  begin
    // Печать расчета - только при статусах "Работы выполнены" и "Оплаченный"
    if (ENServicesObjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_COMPLETED) and
			 (ENServicesObjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_PAID) and
			 (ENServicesObjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_CLOSE)	then
      raise Exception.Create('NET-4235 Для друку остаточного рахунку договір повинен мати статус "Роботи виконані" або "Сплачений"!');
  end;
  /////

  if ENServicesObjectObj.contractTypeRef.code <> ENSERVICESOBJECTTYPE_CONNECTION then
  begin
    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'soCode';
    args[0] := IntToStr(ENServicesObjectObj.code);

    if (ENServicesObjectObj.calcTypeRef.code <> ENSERVICESOBJECT_CALCTYPE_BY_FACT) then
      {06.07.2018 Для нового расчета будет печататься новая форма счета
      с учетом НДС для каждой калькуляции}
      if Self.isTKCalcKindNew then begin
        reportName := 'Services/Bill/rah_calc_new';
      end else begin
        reportName := 'Services/Bill/rah';
      end
    else begin
      reportName := 'Services/Bill/rahFinal';
    end;

    makeReport(reportName , argNames , args , 'pdf');
  end
  else begin
    if ENTechConditionsServicesObj.code = LOW_INT then Exit;

    if ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_UNDEFINED then
    begin
      Application.MessageBox(PChar('Ще не визначений тип договору (Стандартне/Нестандартне приєднання)!'),
                             PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;
        
    if getContragentsCount() = 0 then
    begin
      Application.MessageBox(PChar('Спочатку потрібно ввести Замовників!'),
                             PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;

    if ENTechConditionsServicesObj.tySummaGen = nil then
    begin
      Application.MessageBox(PChar('Введіть суму за договором!'),
                             PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;

    // SUPP-1536... +++ возможность печати счетов по договорам на присоединение
    if (ENTechConditionsServicesObj.connectionKindRef.code <> ENCONNECTIONKIND_STANDART) then
    begin
      // откроем форму для заведения суммы по счету..

      frmEntechConditionsServicesEditSumBill := TfrmEntechConditionsServicesEditSumBill.Create(Application, dsEdit);

      copystr:= Copy(edtTyServicesSumma.Text , 1 , 4);
      // если есть сумма предоплаты ставим  эту сумму иначе сумму по договору .
      if ((copystr <> '0') and (copystr <> '0.0') and  (copystr <> '0.00') and  (copystr <> '') ) then
       frmEntechConditionsServicesEditSumBill.edtSum.Text := edtTyServicesSumma.Text
      else
      begin
      copystr:= Copy(edtTySummaGen.Text , 1 , 4);
      if ((copystr <> '0') and (copystr <> '0.0') and  (copystr <> '0.00') and  (copystr <> '') ) then
       frmEntechConditionsServicesEditSumBill.edtSum.Text := edtTySummaGen.Text
      end;


      try
        if frmEntechConditionsServicesEditSumBill.ShowModal = mrOK then
        begin
              SetLength(argNames, 2);
              SetLength(args, 2);

              argNames[0] := 'agreeCode';
              args[0] := IntToStr(ENTechConditionsServicesObj.code);

              argNames[1] := 'billSum'; // сумма в счете ( предоплата или полная )
              args[1] := frmEntechConditionsServicesEditSumBill.edtSum.Text;

              reportName := 'TechConditions/billByTU';

              makeReport(reportName, argNames, args, 'pdf');
        end;
      finally
       frmEntechConditionsServicesEditSumBill.Free;
      end;
    end else
    begin
      SetLength(argNames, 1);
      SetLength(args, 1);

      argNames[0] := 'agreeCode';
      args[0] := IntToStr(ENTechConditionsServicesObj.code);

      reportName := 'TechConditions/billByStandartConnections';
      makeReport(reportName, argNames, args, 'pdf');
    end;
  end;
end;


procedure TfrmENServicesCalculationEdit.actBindCounterToServicesObjectExecute(
  Sender: TObject);
  var scObj : ScanCountersShort;
  TempENServicesObject : ENServicesObjectControllerSoapPort;
  ignorePrice : Boolean;
  mol : SCMolShort;
begin
  inherited;
  frmBindCounterToENServicesObjectEdit := TfrmBindCounterToENServicesObjectEdit.Create(Application, dsInsert);
  frmBindCounterToENServicesObjectEdit.SetServicesObject(ENServicesObjectObj);
  if frmBindCounterToENServicesObjectEdit.ShowModal = mrOk then begin
    scObj := frmBindCounterToENServicesObjectEdit.GetCounter;
    if scObj = nil then begin
      Exit;
    end;
    if Application.MessageBox(PChar(Format('Ви дійсно бажаєте прив''язати лічильник інв № %s до договору № %s?'
    , [scObj.invNumber, ENServicesObjectObj.contractNumberServices])),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then begin
      TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
      mol := frmBindCounterToENServicesObjectEdit.GetMol();
      ignorePrice := frmBindCounterToENServicesObjectEdit.GetIgnorePrice;
      if Assigned(mol) then
        TempENServicesObject.bindCounterToServicesObject(scObj.invNumber, ENServicesObjectObj, ignorePrice, true, mol.kod_mol)
      else
        TempENServicesObject.bindCounterToServicesObject(scObj.invNumber, ENServicesObjectObj, ignorePrice, true);
      Self.pcCalculationChange(Sender);
      Application.MessageBox(PChar(Format('Прив''язка лічильника інв. № %s до договору № %s виконана'
        , [scObj.invNumber, ENServicesObjectObj.contractNumberServices])), PChar('Повідомлення'), MB_ICONINFORMATION);
  end;
  end;


end;

procedure TfrmENServicesCalculationEdit.actBudgetApprovedExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := ENServicesObjectObj.code;
  except
    on EConvertError do Exit;
  end;

  if (ENServicesObjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
  begin
    if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити затвердження кошторису ?'),
                      PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
      TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
      TempENServicesObject.unBudgetApproved(objCode);
      Application.MessageBox(PChar('Затвердження відмінено...'), PChar('Повідомлення'), MB_ICONINFORMATION);

      actUpdateObject(Sender);
      edtStatus.Text := 'Чорновий';
      FormShow(Sender);
    end;
  end
  else

  if Application.MessageBox(PChar('Ви дійсно бажаєте затвердити кошторис ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
    TempENServicesObject.budgetApproved(objCode, planCode);
    Application.MessageBox(PChar('Кошторис затверджено ...'), PChar('Повідомлення'), MB_ICONINFORMATION);

    actUpdateObject(Sender);
    edtStatus.Text := 'Кошторис затверджений';
    FormShow(Sender);
  end;

end;


procedure TfrmENServicesCalculationEdit.actUpdateObject(Sender: TObject);
Var TempServicesObject: ENServicesObjectControllerSoapPort;
    ObjCode: Integer;
begin
  if pcCalculation.ActivePage = tsListWork then
  begin
    TempServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
    ENServicesObjectObj := TempServicesObject.getObject(ENServicesObjectObj.code);
    actUpdateExecute(Sender);
  end;
end;

procedure TfrmENServicesCalculationEdit.actUpdateService2FKInfoExecute(
  Sender: TObject);
var
  TempENServicesObject2FKInfo: ENServicesObject2FKInfoControllerSoapPort;
  i: Integer;
  ENServicesObject2FKInfoList: ENServicesObject2FKInfoShortList;
  l, j: Integer;
  s2fkinfoFilter : ENServicesObject2FKInfoFilter;

begin
  for l:=1 to sgENServicesObject2FKInfo.RowCount-1 do
   for j:=0 to sgENServicesObject2FKInfo.ColCount-1 do
     sgENServicesObject2FKInfo.Cells[j,l]:='';

  SetGridHeaders(ENServicesObject2FKInfoHeaders, sgENServicesObject2FKInfo.ColumnHeaders);
  ColCount:=100;
  TempENServicesObject2FKInfo :=  HTTPRIOENServicesObject2FKInfo as ENServicesObject2FKInfoControllerSoapPort;


     s2fkinfoFilter := ENServicesObject2FKInfoFilter.Create;
     SetNullIntProps(s2fkinfoFilter);
     SetNullXSProps(s2fkinfoFilter);

     s2fkinfoFilter.servicesObjectRef := ENServicesObjectRef.Create;

     s2fkinfoFilter.servicesObjectRef.code := ENServicesObjectObj.code;

//  ENServicesObject2FKInfoList := TempENServicesObject2FKInfo.getScrollableFilteredList(ENServicesObject2FKInfoFilter(s2fkinfoFilter),0,ColCount);
  ENServicesObject2FKInfoList := TempENServicesObject2FKInfo.getScrollableFilteredList(s2fkinfoFilter,0,ColCount);
  LastCount:=High(ENServicesObject2FKInfoList.list);

  if LastCount > -1 then
     sgENServicesObject2FKInfo.RowCount:=LastCount+2
  else
     sgENServicesObject2FKInfo.RowCount:=2;

   with sgENServicesObject2FKInfo do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENServicesObject2FKInfoList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENServicesObject2FKInfoList.list[i].code)
        else
        Cells[0,i+1] := '';

        if ENServicesObject2FKInfoList.list[i].isIncomeAct = Low(Integer) then
          Cells[1,i+1] := 'Відсутній'
        else
        begin
          if ENServicesObject2FKInfoList.list[i].isIncomeAct > 0  then
           Cells[1,i+1] := 'В наявності'
          else
           Cells[1,i+1] := 'Відсутній';
        end;


         Cells[2,i+1]:= ENServicesObject2FKInfoList.list[i].servicesObjectKindFKRefName;
        LastRow:=i+1;
        sgENServicesObject2FKInfo.RowCount:=LastRow+1;
      end;

    ColCount:=ColCount+1;
    sgENServicesObject2FKInfo.Row:=1;

    if selectedRow <> 0 then
    begin
    if sgENServicesObject2FKInfo.RowCount > selectedRow then
      sgENServicesObject2FKInfo.Row := selectedRow
    else
      sgENServicesObject2FKInfo.Row := sgENServicesObject2FKInfo.RowCount - 1;
    end
    else
      sgENServicesObject2FKInfo.Row:=1;
end;

procedure TfrmENServicesCalculationEdit.spbWarrantNumberClick(
  Sender: TObject);
var frmENWarrantShow : TfrmENWarrantShow;
    f : ENWarrantFilter;
    warrant : ENWarrant;
    datContract, datWarrant : TXSDate;
    dtdatContract, dtdatWarrant : TDateTime;
    power: Double;
begin
  if not priconnections then
  begin
     datContract := TXSDate.Create;
     datWarrant := TXSDate.Create;

     f := ENWarrantFilter.Create();
     SetNullXSProps(f);
     SetNullIntProps(f);
     f.departmentRef := ENDepartmentRef.Create();
     f.departmentRef.code := ENServicesObjectObj.department.code;
     f.conditionSQL := ' warrantstatusrefcode = 0';

     frmENWarrantShow := TfrmENWarrantShow.Create(Application,fmNormal, f);
     DisableActions([frmENWarrantShow.actNoFilter]);

     try
        with frmENWarrantShow do
          if ShowModal = mrOk then
          begin
              try

                 ENServicesObjectObj.warrantRef := ENWarrantRef.Create();
                 ENServicesObjectObj.warrantRef.code := StrToInt(GetReturnValue(sgENWarrant,0));

                  //////////////////////////////////////////////////////
                  ///   проверка даты доверенности с датой договора  ///
                  ///     суммы в доверенности с суммой договора     ///
                  //////////////////////////////////////////////////////

                  if  ENServicesObjectObj.warrantRef.code <> LOW_INT then
                  begin
                    warrant := DMReports.getWarrantByCode(ENServicesObjectObj.warrantRef.code);

                    datContract.XSToNative(GetXSDate(frmENServicesCalculationEdit.edtContractDateServices.DateTime));
                    dtdatContract := EncodeDate(datContract.Year, datContract.Month, datContract.Day);
                    dtdatWarrant := EncodeDate(warrant.dateFinal.Year, warrant.dateFinal.Month, warrant.dateFinal.Day);

                    if (warrant.warrantStatusRef.code = WARRANT_INVALID) then
                    begin
                      Application.MessageBox(PChar('Довіреність недійсна!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);

                      clearWarrantData;
                      Exit;
                    end;

                    if (dtdatContract > dtdatWarrant) then
                    begin
                      Application.MessageBox(PChar('Термін дії довіреності закінчився!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);

                      clearWarrantData;
                      Exit;
                    end;

                    if (StrToFloat(ENServicesObjectObj.contractServicesSumma.DecimalString) > StrToFloat(warrant.maxSum.DecimalString)) then
                    begin
                      Application.MessageBox(PChar('Сума у договорі перевищує гранічну суму у довіреності!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);

                      clearWarrantData;
                      Exit;
                    end;

                    if (edtContractServicesPower.Text <> '') then
                    begin
                      if (StrToFloat(edtContractServicesPower.Text) > warrant.power) then
                      begin
                        Application.MessageBox(PChar('Потужність у договорі перевищує суму у довіреності!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);

                        clearWarrantData;
                        Exit;
                      end;
                    end;

                  end;

                  edtWarrantNumber.Text := GetReturnValue(sgENWarrant,1);
                  edtWarrantFIO.Text := GetReturnValue(sgENWarrant,3);
                  edtWarrantPosition.Text := GetReturnValue(sgENWarrant,4);
                  edtWarrantName.Text := GetReturnValue(sgENWarrant,2);
                  edtPower.Text := GetReturnValue(sgENWarrant,7);
                  edtMaxSum.Text := GetReturnValue(sgENWarrant,8);

              except
                 on EConvertError do Exit;
              end;
          end;
     finally
        frmENWarrantShow.Free;
     end;

  end // if not priconnections 
  else begin
    power := 0;
    try
      power := StrToFloat(edtContractServicesPower.Text);
    except
      on EConvertError do power := 0;
    end;

    if power = 0 then
    begin
      Application.MessageBox(PChar('Спочатку введіть потужність за договором!'), PChar('Увага !'), MB_ICONWARNING);
      edtContractServicesPower.SetFocus;
      Exit;
    end;

    if power <= 5 then
    begin
      if ENServicesObjectObj.department = nil then
      begin
        Application.MessageBox(PChar('Спочатку оберіть підрозділ!'), PChar('Увага !'), MB_ICONWARNING);
        edtENDepartmentDepartmentName.SetFocus;
        Exit;
      end;

      if ENServicesObjectObj.department.code = LOW_INT then
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
       f.departmentRef.code := ENServicesObjectObj.department.code;

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
          (ENServicesObjectObj.department.code = ENDEPARTMENT_HGES) then
       begin
         f.departmentRef.code := ENDEPARTMENT_KSOE;
       end;
     end;

     if chbIsSea.Checked then
     begin
       f.departmentRef := ENDepartmentRef.Create();
       f.departmentRef.code := ENDEPARTMENT_KSOE;
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

                 ENServicesObjectObj.warrantRef := ENWarrantRef.Create();
                 ENServicesObjectObj.warrantRef.code := StrToInt(GetReturnValue(sgENWarrant,0));

                  //////////////////////////////////////////////////////
                  ///   проверка даты доверенности с датой договора  ///
                  ///     суммы в доверенности с суммой договора     ///
                  //////////////////////////////////////////////////////

                  if ENServicesObjectObj.warrantRef.code <> LOW_INT then
                  begin
                    warrant := DMReports.getWarrantByCode(ENServicesObjectObj.warrantRef.code);

                    datContract.XSToNative(GetXSDate(Self.edtContractDateServices.DateTime));
                    dtdatContract := EncodeDate(datContract.Year, datContract.Month, datContract.Day);
                    dtdatWarrant := EncodeDate(warrant.dateFinal.Year, warrant.dateFinal.Month, warrant.dateFinal.Day);

                    if (warrant.warrantStatusRef.code = WARRANT_INVALID) then
                    begin
                      Application.MessageBox(PChar('Довіреність недійсна!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);

                      clearWarrantData;
                      Exit;
                    end;

                    if (dtdatContract > dtdatWarrant) then
                    begin
                      Application.MessageBox(PChar('Термін дії довіреності закінчився!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);

                      clearWarrantData;
                      Exit;
                    end;



                    if (edtTyServicesPower.Text <> '') then
                    begin
                      if (StrToFloat(edtTyServicesPower.Text) > warrant.power) then
                      begin
                        Application.MessageBox(PChar('Потужність у договорі перевищує суму у довіреності!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);

                        clearWarrantData;
                        Exit;
                      end;
                    end;

                  end;

                  edtWarrantNumber.Text := GetReturnValue(sgENWarrant,1);
                  edtWarrantFIO.Text := GetReturnValue(sgENWarrant,3);
                  edtWarrantPosition.Text := GetReturnValue(sgENWarrant,4);
                  edtWarrantName.Text := GetReturnValue(sgENWarrant,2);
                  edtPower.Text := GetReturnValue(sgENWarrant,7);
                  edtMaxSum.Text := GetReturnValue(sgENWarrant,8);

              except
                 on EConvertError do Exit;
              end;
          end;
     finally
        frmENWarrantShow.Free;
     end;

  end; // if not priconnections .. else
end;



procedure TfrmENServicesCalculationEdit.TBItem13Click(Sender: TObject);
begin
  inherited;

end;

{procedure TfrmENServicesCalculationEdit.Button1Click(Sender: TObject);
begin
Var TempServicesObject: ENServicesObjectControllerSoapPort;
    TempENPlanWork: ENPlanWorkControllerSoapPort;
    newPlanCode: Integer;
    newPlan: ENPlanWork;
begin
  if planCode = LOW_INT then Exit;

  TempServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  newPlanCode := TempServicesObject.closePlanWorkForCalculation(planCode);

  newPlan := DMReports.getPlanByCode(newPlanCode);

  if newPlan = nil then
    Exit;

  frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsEdit);
  try
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
    frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(newPlanCode);
    frmENPlanWorkEdit.ShowModal;
  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit := nil;
  end;
end;}

procedure TfrmENServicesCalculationEdit.actViewENActExecute(
  Sender: TObject);
Var TempENAct: ENActControllerSoapPort;
begin
   TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

   frmENActEdit:=TfrmENActEdit.Create(Application, dsView);
   try
     try
       frmENActEdit.ENActObj := TempENAct.getObject(StrToInt(sgENAct.Cells[0, sgENAct.Row]));
     except
       on EConvertError do Exit;
     end;

     if frmENActEdit.ShowModal in [mrOk, mrYes] then
     begin
       //TempENAct.save(ENActObj);
       //UpdateGrid(Sender);
       actUpdateExecute(Sender);
     end;
   finally
     frmENActEdit.Free;
     frmENActEdit:=nil;
   end;
end;


procedure TfrmENServicesCalculationEdit.edtContractServicesPowerChange(
  Sender: TObject);
begin
  inherited;

  if checkWarrant then 
    if edtWarrantNumber.Text = '' then
    begin
      Application.MessageBox(PChar('Спочатку треба вибрати довіреність!'),
                             PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;

end;


procedure TfrmENServicesCalculationEdit.actPrintKoshtorisExecute(
 Sender: TObject);
var argNames, args: ArrayOfString;
   reportName: String;
   Licensed : Integer;

   TempENPlanWork2ClassificationType: ENPlanWork2ClassificationTypeControllerSoapPort;
   plan2ctFilter: ENPlanWork2ClassificationTypeFilter;
   ENPlanWork2ClassificationTypeList: ENPlanWork2ClassificationTypeShortList;
   ENPlanWork2ClassificationTypeCode : Integer;
   pw2ctObj: ENPlanWork2ClassificationType;

   TempTKClassificationType: TKClassificationTypeControllerSoapPort;
   //i: Integer;
   TKClassificationTypeList: TKClassificationTypeShortList;
   TKClassificationTypef: TKClassificationTypeFilter;

begin

// проверка лиценз работа или нет

/////////////// по другому перешифровать какой вид дейтельности это по коду объекта  связки
          ENPlanWork2ClassificationTypeCode := StrToInt(sgENPlanWork2ClassificationType.Cells[0, sgENPlanWork2ClassificationType.Row]);
          TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;
          pw2ctObj := TempENPlanWork2ClassificationType.getObject(ENPlanWork2ClassificationTypeCode);
           if pw2ctObj <> nil then
             TempTKClassificationType :=  HTTPRIOTKClassificationType as TKClassificationTypeControllerSoapPort;
             TKClassificationTypeF := TKClassificationTypeFilter.Create;
             SetNullIntProps(TKClassificationTypeF);
             SetNullXSProps(TKClassificationTypeF);
             TKClassificationTypeF.code := pw2ctObj.classificationTypeRef.code;
             TKClassificationTypeList := TempTKClassificationType.getScrollableFilteredList(TKClassificationTypeF,0,-1);
             //Licensed := TKClassificationTypeList.list[i].isnotlicensedactivity;
             Licensed := TKClassificationTypeList.list[0].isnotlicensedactivity;

 SetLength(argNames, 1);
 SetLength(args, 1);

 argNames[0] := 'soCode';
 if (DialogState = dsInsert) then
    begin
    ENServicesObjectObj := DMReports.getServicesObjectByPlanCode(planCode);
    args[0] := IntToStr(ENServicesObjectObj.code);
    end
 else
    args[0] := IntToStr(ENServicesObjectObj.code);

  if Licensed = ISNOTLICENSEDACTIVITY_NKRE  then  // лицензированые работы НКРЕ
     reportName := '201109/ActCalcAdditionalWorkG_NKRE/ActCalcOnlyRemainingcost'
  else if Licensed = ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT  then
     reportName := '201109/ActCalcAdditionalWorkG/ActCalc_trt_ntlcd_so'
  else if ( (Licensed <> ISNOTLICENSEDACTIVITY_NKRE) and (Licensed <> ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT) ) then
     reportName := '201109/ActCalcAdditionalWorkG/ActCalcOnlyRemainingcost';

  makeReport(reportName , argNames , args , 'xls');
end;


procedure TfrmENServicesCalculationEdit.actPrintCalcNkreExecute(
  Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
    ENPlanWork2ClassificationTypeCode : Integer;
    TempENPlanWork2ClassificationType: ENPlanWork2ClassificationTypeControllerSoapPort;
    pw2ctObj: ENPlanWork2ClassificationType;
    TempTKClassificationType: TKClassificationTypeControllerSoapPort;
    TKClassificationTypef: TKClassificationTypeFilter;
    TKClassificationTypeList: TKClassificationTypeShortList;

    TempTKTransport : TKTransportControllerSoapPort;
    transportFilter : TKTransportFilter;
    transportList : TKTransportShortList;
    i : Integer;

    Licensed : Integer;
begin

     Licensed := ISNOTLICENSEDACTIVITY_NKRE;

    // проверка лиценз работа или нет
          ENPlanWork2ClassificationTypeCode := StrToInt(sgENPlanWork2ClassificationType.Cells[0, sgENPlanWork2ClassificationType.Row]);
          TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;
          pw2ctObj := TempENPlanWork2ClassificationType.getObject(ENPlanWork2ClassificationTypeCode);
           if pw2ctObj <> nil then
             TempTKClassificationType :=  HTTPRIOTKClassificationType as TKClassificationTypeControllerSoapPort;
             TKClassificationTypeF := TKClassificationTypeFilter.Create;
             SetNullIntProps(TKClassificationTypeF);
             SetNullXSProps(TKClassificationTypeF);
             TKClassificationTypeF.code := pw2ctObj.classificationTypeRef.code;
             TKClassificationTypeList := TempTKClassificationType.getScrollableFilteredList(TKClassificationTypeF,0,-1);
             Licensed := TKClassificationTypeList.list[0].isnotlicensedactivity;

   SetLength(argNames, 2);
   SetLength(args, 2);

   argNames[0] := 'plancode';

   if (DialogState = dsInsert) then
      args[0] := IntToStr(planCode)
   else
      args[0] := IntToStr(DMReports.getPlanCodeForCalculationByElement(ENServicesObjectObj.element.code));

   argNames[1] := 'licenzed';
   args[1] := IntToStr(Licensed);

   if (Assigned(pw2ctObj) and Assigned(pw2ctObj.calcKindRef) and (pw2ctObj.calcKindRef.code = TKCALCKIND_NEW)) then begin
      reportName := 'Calculation/ActCalc_Form2_NKRE';
      makeReport(reportName , argNames , args , 'pdf');

      reportName := 'Calculation/ActCalc_Form1_NKRE_new';
      makeReport(reportName , argNames , args , 'pdf');
   end else begin

     if (Assigned(pw2ctObj) and Assigned(pw2ctObj.calcKindRef) and (pw2ctObj.calcKindRef.code = TKCALCKIND_NEW2)) then begin
       reportName := 'Calculation/ActCalc_Form1_NKRE_new';
     end else begin
       reportName := 'Calculation/ActCalc_Form1_NKRE';
     end;
     makeReport(reportName , argNames , args , 'pdf');

     if (Assigned(pw2ctObj) and Assigned(pw2ctObj.calcKindRef) and (pw2ctObj.calcKindRef.code = TKCALCKIND_NEW2)) then begin
       reportName := 'Calculation/ActCalc_Form2_NKRE';
     end else begin
       reportName := 'Calculation/ActCalc_Form4_NKRE';
     end;
     makeReport(reportName , argNames , args , 'pdf');



     transportFilter := TKTransportFilter.Create;
     SetNullXSProps(transportFilter);
     SetNulLIntProps(transportFilter);
     transportFilter.conditionSQL := ' exists (select 1 from encalctransportusagehr cthu1 where cthu1.tktransportrefcode = TKTRANSPORT.CODE and cthu1.planrefcode = ' + IntToStr(planCode) + ')';

     argNames[0] := 'plancode';
     argNames[1] := 'transportCode';

     TempTKTransport := HTTPRIOTKTransport as TKTransportControllerSoapPort;
     transportList := TempTKTransport.getScrollableFilteredList(transportFilter, 0, -1);
     for i := 0 to transportList.totalCount - 1 do begin
        args[1] := IntToStr(transportList.list[i].code);
        reportName := 'Calculation/ActCalc_Form1_Transport';
        makeReport(reportName , argNames , args , 'pdf');
        reportName := 'Calculation/ActCalc_Form1_TransportNoFuel';
        makeReport(reportName , argNames , args , 'pdf');
     end;
   end;
end;


procedure TfrmENServicesCalculationEdit.cbActIncomeCreatMetodChange(Sender: TObject);
begin
  inherited;
  if ENServicesObjectObj.actIncomeCreatMetodRef.code <> (cbActIncomeCreatMetod.ItemIndex+1) then
    DisableActions([actChangeCreatMetod], False)
  else
    DisableActions([actChangeCreatMetod]);
end;


procedure TfrmENServicesCalculationEdit.cbbBasisTypeChange(
  Sender: TObject);
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

procedure TfrmENServicesCalculationEdit.btnPhoneFormatClick(Sender: TObject);
var
   frmPhoneFormatter: TfrmPhoneFormatter;

begin

   frmPhoneFormatter:=TfrmPhoneFormatter.Create(Application,dsEdit);
   try
      with frmPhoneFormatter do
        if ShowModal = mrOk then
        begin
            try
             edtContragentPhoneNumber.Text := '';

             if Length(additionalPhone)>0 then
                   begin
                     edtContragentPhoneNumber.Text := mobilePhoneNumber + ';' + additionalPhone;
                   end
             else
                edtContragentPhoneNumber.Text := mobilePhoneNumber;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmPhoneFormatter.Free;
   end;
end;

procedure TfrmENServicesCalculationEdit.btnPostingsClick(Sender: TObject);
begin
  frmPostingsEdit := TfrmPostingsEdit.Create(Application, dsInsert);
  try
    frmPostingsEdit.servicesObjectCode := ENServicesObjectObj.code;
    if ENServicesObjectObj.isNoPay = ENConsts.ENSERVICESOBJECT_ISNOPAY then
    begin
      HideControls([frmPostingsEdit.lblGridDescription, frmPostingsEdit.sgProvs,
                    frmPostingsEdit.sgProvErrorsDetailed, frmPostingsEdit.btnGetPostingsList]);
    end;
    frmPostingsEdit.ShowModal;
  finally
    frmPostingsEdit.Free;
  end;
end;

procedure TfrmENServicesCalculationEdit.updateRezervedView();
var
    TempENPlanWork2ClassificationType: ENPlanWork2ClassificationTypeControllerSoapPort;
    plan2ctFilter: ENPlanWork2ClassificationTypeFilter;
    plan2ctList: ENPlanWork2ClassificationTypeShortList;

    TempENTimeLine: ENTimeLineControllerSoapPort;
    ti: Integer;
    ENTimeLineList: ENTimeLineShortList;
    tempENTimeLineFilter : ENTimeLineFilter;

    TempTKClassification2ENDepartment: TKClassification2ENDepartmentControllerSoapPort;
    TempTKClassification2ENDepartmentFilter : TKClassification2ENDepartmentFilter;
    TempTKClassification2ENDepartmentList : TKClassification2ENDepartmentShortList;

    LastCountVb , vi , codeServicesObject: Integer;

    TempENServicesObject: ENServicesObjectControllerSoapPort;
    servicesObj: ENServicesObject;
    servicesObjFilter: ENServicesObjectFilter;
    servicesObjList: ENServicesObjectShortList;

    TempENDeliveryTimePlan: ENDeliveryTimePlanControllerSoapPort;
    di: Integer;
    ENDeliveryTimePlanList: ENDeliveryTimePlanShortList;
    TempENDeliveryTimePlanFilter : ENDeliveryTimePlanFilter;

begin
      codeServicesObject:=0;
    // Проверим если класификации временые резервируемые то отображаем поля для резерва времени
       if planCode > LOW_INT then
       begin
         TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;

         plan2ctFilter := ENPlanWork2ClassificationTypeFilter.Create;
         SetNullIntProps(plan2ctFilter);
         SetNullXSProps(plan2ctFilter);



         plan2ctFilter.planRef := ENPlanWorkRef.Create;
         plan2ctFilter.planRef.code := planCode;

         plan2ctList := TempENPlanWork2ClassificationType.getScrollableFilteredList(plan2ctFilter, 0, -1);

         if plan2ctList.totalCount > 0 then
         begin
            if  plan2ctList.list[0].isJobsByTime = 1 then
                isJobsByTime := True
            else
                isJobsByTime := False;
            if  plan2ctList.list[0].isVisitClient = 1 then
                isVisitClient := True
            else
                isVisitClient := False;
         end;

         if ENServicesObjectObj.code <> 0 then
            codeServicesObject := ENServicesObjectObj.code
         else
         // если код сервис 0 то поищем по фильтру
         begin
             TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
              servicesObjFilter := ENServicesObjectFilter.Create;
              SetNullIntProps(servicesObjFilter);
              SetNullXSProps(servicesObjFilter);
              servicesObjFilter.conditionSQL := ' ENSERVICESOBJECT.CODE in ( select so.code  from enservicesobject so , enplanwork p  ' +
                            ' where so.elementcode = p.elementrefcode ' +
                            '   and p.kindcode = 5 ' +
                            '   and p.code = ' + IntToStr(planCode)  + ')';

              servicesObjList := TempENServicesObject.getEasyShortList(servicesObjFilter, 0, -1);
              if servicesObjList.totalCount > 0 then
                 codeServicesObject := servicesObjList.list[0].code;
         end;
       end;
       // если класификация временно резервируемая то выводим уже привязаные подразделения для выполнения  + доступные
       if isJobsByTime then
        begin
                // Время на доставку в один конец если проставлены километры
                if edtContractServicesDistance.Text <> '0' then
                begin
                  TempENDeliveryTimePlan :=  HTTPRIOENDeliveryTimePlan as ENDeliveryTimePlanControllerSoapPort;
                  TempENDeliveryTimePlanFilter := ENDeliveryTimePlanFilter.Create;
                  SetNullIntProps(TempENDeliveryTimePlanFilter);
                  SetNullXSProps(TempENDeliveryTimePlanFilter);

                  TempENDeliveryTimePlanFilter.planWorkRef := ENPlanWorkRef.Create;
                  TempENDeliveryTimePlanFilter.planWorkRef.code := planCode;
                  ENDeliveryTimePlanList := TempENDeliveryTimePlan.getScrollableFilteredList(TempENDeliveryTimePlanFilter,0,-1);
                  if High(ENDeliveryTimePlanList.list) > -1 then


                  tempDeliveryOneWay:= trunc( StrToFloat(ENDeliveryTimePlanList.list[0].deliveryTimePlan.DecimalString) * 60 / 2 ) ;
                  if tempDeliveryOneWay <= 60 then
                  lblDeliveryOneWay.Caption:= 'Доставка в один бік: ' +  FloatToStr(tempDeliveryOneWay) + ' хв.';
                  if tempDeliveryOneWay > 60 then
                  lblDeliveryOneWay.Caption:= 'Доставка в один бік: ' + IntToStr((tempDeliveryOneWay div 60)) + ' год. ' +
                                              IntToStr((tempDeliveryOneWay - ((tempDeliveryOneWay div 60)*60)) )  + ' хв.' ;


                 end
                 else
                 lblDeliveryOneWay.Caption:= 'Доставка в один бік: 0 хв.';



                // вытянем если есть дату выполнения работ (из сервис Обжекта ) и время выполнения


                   tempENTimeLineFilter := ENTimeLineFilter.Create;
                   SetNullIntProps(tempENTimeLineFilter);
                   SetNullXSProps(tempENTimeLineFilter);

                tempENTimeLineFilter.servicesObjectRef := ENServicesObjectObj.Create;
                tempENTimeLineFilter.servicesObjectRef.code := codeServicesObject {ENServicesObjectObj.code} ;
                TempENTimeLine :=  HTTPRIOENTimeLine as ENTimeLineControllerSoapPort;
                ENTimeLineList := TempENTimeLine.getScrollableFilteredList(tempENTimeLineFilter,0,-1);
                if High(ENTimeLineList.list) > -1 then
                begin
                   if ENTimeLineList.list[0].dateGen <> nil then
                    begin
                      edtReservedDate.DateTime:=EncodeDate(ENTimeLineList.list[0].dateGen.Year,ENTimeLineList.list[0].dateGen.Month,ENTimeLineList.list[0].dateGen.Day);
                      edtReservedDate.checked := true;
                      //23.04
                      Planner1.Mode.Day:= ENTimeLineList.list[0].dateGen.Day;
                      Planner1.Mode.Month:= ENTimeLineList.list[0].dateGen.Month;
                      Planner1.Mode.Year:= ENTimeLineList.list[0].dateGen.Year;

                    end
                    else
                    begin
                      edtReservedDate.DateTime:=SysUtils.Date;
                      edtReservedDate.checked := false;
                    end;

                    if ENTimeLineList.list[0].timeStart <> nil then
                    begin
                      edtReservedTimeStart.DateTime:=EncodeDateTime(ENTimeLineList.list[0].timeStart.Year,
                                                                    ENTimeLineList.list[0].timeStart.Month,
                                                                    ENTimeLineList.list[0].timeStart.Day,
                                                                    ENTimeLineList.list[0].timeStart.Hour,
                                                                    ENTimeLineList.list[0].timeStart.Minute,
                                                                    ENTimeLineList.list[0].timeStart.Second,
                                                                    ENTimeLineList.list[0].timeStart.Millisecond
                                                                    );
                      edtReservedTimeStart.checked := true;
                    end
                    else
                    begin
                      edtReservedTimeStart.DateTime:=SysUtils.Date;
                      edtReservedTimeStart.checked := false;
                    end;
                    if ENTimeLineList.list[0].timeFinal <> nil then
                    begin
                      edtReservedTimeFinal.DateTime:=EncodeDateTime(ENTimeLineList.list[0].timeFinal.Year,
                                                                    ENTimeLineList.list[0].timeFinal.Month,
                                                                    ENTimeLineList.list[0].timeFinal.Day,
                                                                    ENTimeLineList.list[0].timeFinal.Hour,
                                                                    ENTimeLineList.list[0].timeFinal.Minute,
                                                                    ENTimeLineList.list[0].timeFinal.Second,
                                                                    ENTimeLineList.list[0].timeFinal.Millisecond
                                                                    );
                      edtReservedTimeFinal.checked := true;
                    end
                    else
                    begin
                      edtReservedTimeFinal.DateTime:=SysUtils.Date;
                      edtReservedTimeFinal.checked := false;
                    end;
                    // время выезда
                    if ENTimeLineList.list[0].timeMoveToObject <> nil then
                    begin
                      edtDeliveryTimeTo.DateTime:=EncodeDateTime(ENTimeLineList.list[0].timeMoveToObject.Year,
                                                                    ENTimeLineList.list[0].timeMoveToObject.Month,
                                                                    ENTimeLineList.list[0].timeMoveToObject.Day,
                                                                    ENTimeLineList.list[0].timeMoveToObject.Hour,
                                                                    ENTimeLineList.list[0].timeMoveToObject.Minute,
                                                                    ENTimeLineList.list[0].timeMoveToObject.Second,
                                                                    ENTimeLineList.list[0].timeMoveToObject.Millisecond
                                                                    );
                      edtDeliveryTimeTo.checked := true;
                    end
                    else
                    begin
                      edtDeliveryTimeTo.DateTime:=SysUtils.Date;
                      edtDeliveryTimeTo.checked := false;
                      
                    end;
                    // время возвращения
                    if ENTimeLineList.list[0].timeMoveOfObject <> nil then
                    begin
                      edtDeliveryTimeFrom.DateTime:=EncodeDateTime(ENTimeLineList.list[0].timeMoveOfObject.Year,
                                                                    ENTimeLineList.list[0].timeMoveOfObject.Month,
                                                                    ENTimeLineList.list[0].timeMoveOfObject.Day,
                                                                    ENTimeLineList.list[0].timeMoveOfObject.Hour,
                                                                    ENTimeLineList.list[0].timeMoveOfObject.Minute,
                                                                    ENTimeLineList.list[0].timeMoveOfObject.Second,
                                                                    ENTimeLineList.list[0].timeMoveOfObject.Millisecond
                                                                    );
                      edtDeliveryTimeFrom.checked := true;
                    end
                    else
                    begin
                      edtDeliveryTimeFrom.DateTime:=SysUtils.Date;
                      edtDeliveryTimeFrom.checked := false;
                    end;

                end
                else
                 begin
                      // если нету временных данных под договор
                      edtReservedDate.DateTime:=SysUtils.Date;
                      edtReservedDate.checked := false;
                      edtReservedTimeStart.DateTime:=SysUtils.Date;
                      edtReservedTimeStart.Checked := False;
                      edtReservedTimeFinal.Checked := True;
                      edtDeliveryTimeTo.Checked := True;
                      edtDeliveryTimeFrom.Checked := True;
                      DisableControls([edtReservedTimeFinal, edtDeliveryTimeTo , edtDeliveryTimeFrom ])
                 end;

                TempTKClassification2ENDepartment  := HTTPRIOTKClassification2ENDepartment  as TKClassification2ENDepartmentControllerSoapPort;


                TempTKClassification2ENDepartmentList :=  TempTKClassification2ENDepartment.getScrollableFilteredListForServices({ENServicesObjectObj.code} codeServicesObject );
                // иначе поищем сервис обжект по коду плана



                 if High(TempTKClassification2ENDepartmentList.list) > -1 then
                  begin
                    // заполняем грид с подразделениями
                     LastCountVb:= High(TempTKClassification2ENDepartmentList.list);
                     sgDepartment.Clear;
                     SetGridHeaders(sgDepartmentHeaders, sgDepartment.ColumnHeaders);

                      if LastCountVb > -1 then
                         sgDepartment.RowCount:=LastCountVb+2
                      else
                         sgDepartment.RowCount:=2;

                     with sgDepartment do
                      for vi:=0 to LastCountVb do
                        begin
                          Application.ProcessMessages;
                          if TempTKClassification2ENDepartmentList.list[vi].brigadeRefCode <> Low(Integer) then
                          Cells[0,vi+1] := IntToStr(TempTKClassification2ENDepartmentList.list[vi].brigadeRefCode)
                          else
                          Cells[0,vi+1] := '';
                          if TempTKClassification2ENDepartmentList.list[vi].countJobsOneTime = 1 then
                          AddCheckBox(1, vi+1, true, false)
                          else
                          AddCheckBox(1, vi+1, false, false);

                          Cells[1,vi+1] := TempTKClassification2ENDepartmentList.list[vi].brigadeRefShortName;

                          Cells[2,vi+1] := TempTKClassification2ENDepartmentList.list[vi].endepartmentRefShortName;

                        end;
                      // отображаем бригады для выбраных подразделений
                      sgDepartmentCheckBoxClick(sgDepartment,1,1,False);
                      // рисуем временную диаграмму
                     // RenderPlanner; 
                  end;
                  // покажем элементы для резервирования времени
                  HideControls([ lbl3 , edtReservedDate , lbl4 , lbl5 , edtReservedTimeStart , lbl6 , edtReservedTimeFinal ,
                                 lblDeliveryTimeTo , edtDeliveryTimeTo , lblDeliveryTimeFrom , edtDeliveryTimeFrom ,
                                 lbl7 , sgDepartment , lbl9 , sgBrigadeInDepartment  , btnInsertExecuteDate , btnRemoveExecutedDate  , Planner1 , lblDeliveryOneWay  , btnFindTime ],false);
                    // отменим возможность менять значение расстояния или РЕСа
                  DisableControls([edtContractServicesDistance,btnENDepartmentDepartment, edtReservedTimeFinal  , edtDeliveryTimeTo  , edtDeliveryTimeFrom ]);
                  if DialogState = dsView then
                  DisableControls([btnInsertExecuteDate,sgDepartment , sgBrigadeInDepartment  , btnRemoveExecutedDate  , btnFindTime ]);

        end;


end;

procedure TfrmENServicesCalculationEdit.RenderPlanner();
  var
  i  , codeServicesObject:Integer;
  codeStrBrigade : string;
  di : Integer;
  stateBrig : Boolean;

    TempTKVirtualBrigade: TKVirtualBrigadeControllerSoapPort;
    TempTKVirtualBrigadeFilter: TKVirtualBrigadeFilter;
    vi: Integer;
    TKVirtualBrigadeList: TKVirtualBrigadeShortList;
    LastCountBrigade : Integer;

    TempENTimeLine: ENTimeLineControllerSoapPort;
    ENTimeLineList: ENTimeLineShortList;
    TlnFilter : ENTimeLineFilter;
    tln :Integer;

    soObject: EnServicesObject;

    TempEnServicesObject: EnServicesObjectControllerSoapPort;
    servicesObj: ENServicesObject;
    servicesObjFilter: ENServicesObjectFilter;
    servicesObjList: ENServicesObjectShortList;

  begin

      //   if ENServicesObjectObj.code <> 0 then
     //       codeServicesObject := ENServicesObjectObj.code
     // y    else
         // если код сервис 0 то поищем по фильтру
   begin
             TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
              servicesObjFilter := ENServicesObjectFilter.Create;
              SetNullIntProps(servicesObjFilter);
              SetNullXSProps(servicesObjFilter);
              servicesObjFilter.conditionSQL := ' ENSERVICESOBJECT.CODE in ( select so.code  from enservicesobject so , enplanwork p  ' +
                            ' where so.elementcode = p.elementrefcode ' +
                            '   and p.kindcode = 5 ' +
                            '   and p.code = ' + IntToStr(planCode)  + ')';

              servicesObjList := TempENServicesObject.getEasyShortList(servicesObjFilter, 0, -1);
              if servicesObjList.totalCount > 0 then
                 servicesObj :=  TempEnServicesObject.getObject( servicesObjList.list[0].code)
              else servicesObj :=  TempEnServicesObject.getObject( ENServicesObjectObj.code);
              codeServicesObject:= servicesObj.code;
   end;

               frmENServicesCalculationEdit.Planner1.Items.Clear;
               frmENServicesCalculationEdit.Planner1.Positions:= 1;
               Planner1.Header.Captions.Clear;
               frmENServicesCalculationEdit.Planner1.ItemGap:= -1;
               
     // из грида бригады в подразделении вычитаем выбраные позиции бригад и для них разрисуем загрузку на выбраную дату выполнения
        if edtReservedDate.checked then
        begin
          codeStrBrigade := '';
          For di := 0 to sgBrigadeInDepartment.RowCount do
           begin
              stateBrig := False;
              sgBrigadeInDepartment.GetCheckBoxState(1, di+1,stateBrig);
             if (( sgBrigadeInDepartment.Cells[0,di+1]  <> '' )  and  ( stateBrig ))then

             if codeStrBrigade <> '' then
             codeStrBrigade := codeStrBrigade + ' , ' +   sgBrigadeInDepartment.Cells[0,di+1]
             else
             codeStrBrigade := sgBrigadeInDepartment.Cells[0,di+1] ;
           end;
           if codeStrBrigade <> '' then
           begin

                   TempTKVirtualBrigade :=  HTTPRIOTKVirtualBrigade as TKVirtualBrigadeControllerSoapPort;

                   TempTKVirtualBrigadeFilter := TKVirtualBrigadeFilter.Create;
                   SetNullIntProps(TempTKVirtualBrigadeFilter);
                   SetNullXSProps(TempTKVirtualBrigadeFilter);

               TempTKVirtualBrigadeFilter.conditionSQL := ' TKVIRTUALBRIGADE.CODE in ( ' + codeStrBrigade + ' ) ' +
                                                          ' and  to_date(' + chr(39) +  DateToStr(edtReservedDate.datetime) + chr(39) + ',' + chr(39) + 'dd.mm.yyyy' + chr(39) + ')' +
                                                          ' not between coalesce(TKVIRTUALBRIGADE.LOCKDATE,'+chr(39)+'01.01.3000'+chr(39)+')' +
                                                  '  and coalesce(TKVIRTUALBRIGADE.LOCKDATEFINAL,'+chr(39)+'01.01.3000'+chr(39)+')  '   ;
               TKVirtualBrigadeList := TempTKVirtualBrigade.getScrollableFilteredList(TempTKVirtualBrigadeFilter,0,-1);
               LastCountBrigade:=High(TKVirtualBrigadeList.list);

               frmENServicesCalculationEdit.Planner1.Items.Clear;
               frmENServicesCalculationEdit.Planner1.Positions:= LastCountBrigade+2;
               Planner1.Header.Captions.Clear;
               Planner1.Header.Captions.Add('');
               //Planner1.


               for vi:=0 to LastCountBrigade do
                 begin

                     // создаем строку в планере под каждую бригаду
                        Planner1.Header.Captions.Add(TKVirtualBrigadeList.list[vi].nameCompound) ;
                        Planner1.Header.ShowHint := True;


                        Planner1.Header.ShowHint := True;
                       // по выбраной бригаде и дате выполнения отображаем загрузку бригад по всем договорам

                           TlnFilter := ENTimeLineFilter.Create;
                           SetNullIntProps(TlnFilter);
                           SetNullXSProps(TlnFilter);

                        TlnFilter.virtualBrigadeRef := TKVirtualBrigade.Create;
                        TlnFilter.virtualBrigadeRef.code :=  TKVirtualBrigadeList.list[vi].code;
                        TlnFilter.dateGen := TXSDate.Create;
                        TlnFilter.dateGen.XSToNative(GetXSDate(edtReservedDate.DateTime));
                        TlnFilter.conditionSQL := 'ENSERVICESOBJECT.CODE <> ' + IntToStr( {ENServicesObjectObj.code} codeServicesObject );

                        TempENTimeLine :=  HTTPRIOENTimeLine as ENTimeLineControllerSoapPort;
                        ENTimeLineList := TempENTimeLine.getScrollableFilteredList(TlnFilter,0,-1);
                        TempEnServicesObject := HTTPRIOENServicesObject as EnServicesObjectControllerSoapPort;
                        // по бригаде выберем ее часы работы в этот день
                          for  tln:= 0 to High(ENTimeLineList.list)  do
                          begin
                                Application.ProcessMessages;
                                soObject := TempEnServicesObject.getObject(ENTimeLineList.list[tln].servicesObjectRefCode);
                                //  время в пути до объекта

                             // If  FormatDateTime('hh' , ENTimeLineList.list[tln].timeMoveToObject.AsDateTime ) <> '00' then
                             if  ((FormatDateTime('hh:mm',ENTimeLineList.list[tln].timeMoveToObject.AsDateTime) <> '00:00' )
                                 and ( FormatDateTime('hh:mm',ENTimeLineList.list[tln].timeStart.AsDateTime) <> '00:00' )) then
                                 with frmENServicesCalculationEdit.Planner1.CreateItem do
                                  begin
                                    ReadOnly := true;
                                    FixedPos := true;
                                    FixedPosition := true;
                                    FixedSize := true;
                                    FixedTime := true;

                                    itempos := vi;
                                    ItemStartTime :=  EncodeDateTime( ENTimeLineList.list[tln].timeMoveToObject.Year,
                                                                      ENTimeLineList.list[tln].timeMoveToObject.Month,
                                                                      ENTimeLineList.list[tln].timeMoveToObject.Day,
                                                                      ENTimeLineList.list[tln].timeMoveToObject.Hour,
                                                                      ENTimeLineList.list[tln].timeMoveToObject.Minute,
                                                                      0,0);
                                    ItemEndTime :=  EncodeDateTime( ENTimeLineList.list[tln].timeStart.Year,
                                                                      ENTimeLineList.list[tln].timeStart.Month,
                                                                      ENTimeLineList.list[tln].timeStart.Day,
                                                                      ENTimeLineList.list[tln].timeStart.Hour,
                                                                      ENTimeLineList.list[tln].timeStart.Minute,
                                                                      0,0);

                                    if  soObject <> nil then
                                     Text.Text := 'Дог.№. ' +    soObject.contractNumberServices + ' : Доставка до замовника' +
                                                  ' : з ' + FormatDateTime('hh.mm', ItemStartTime ) + ' до ' + FormatDateTime('hh.mm', ItemEndTime )
                                    else
                                    Text.Text := ' Доставка до замовника' +
                                                  ' : з ' + FormatDateTime('hh.mm', ItemStartTime ) + ' до ' + FormatDateTime('hh.mm', ItemEndTime );
                                    Font.Size:= 4;
                                    Color:= clYellow;
                                    CaptionType:= ctTimeText;
                                    CaptionFont.Size:= 6;
                                    Shape:= psRect;
                                    TrackVisible:= False;
                                    Shadow:= False;
                                    AutoSize:= False;

                                  end;
                                // время пребывания на объекте
                                if  ((FormatDateTime('hh:mm',ENTimeLineList.list[tln].timeStart.AsDateTime) <> '00:00' )
                                 and ( FormatDateTime('hh:mm',ENTimeLineList.list[tln].timeFinal.AsDateTime) <> '00:00' )) then
                            With frmENServicesCalculationEdit.Planner1.CreateItem do
                               Begin
                                  ReadOnly := true;
                                  FixedPos := true;
                                  FixedPosition := true;
                                  FixedSize := true;
                                  FixedTime := true;

                                  //ItemStartTime := edtReservedTimeStart.DateTime;
                                  //ItemEndTime :=  edtReservedTimeFinal.DateTime;
                                  itempos := vi;
                                  ItemStartTime :=  EncodeDateTime(ENTimeLineList.list[tln].timeStart.Year,
                                                                    ENTimeLineList.list[tln].timeStart.Month,
                                                                    ENTimeLineList.list[tln].timeStart.Day,
                                                                    ENTimeLineList.list[tln].timeStart.Hour,
                                                                    ENTimeLineList.list[tln].timeStart.Minute,
                                                                    ENTimeLineList.list[tln].timeStart.Second,
                                                                    ENTimeLineList.list[tln].timeStart.Millisecond
                                                                    );
                                  ItemEndTime :=  EncodeDateTime(ENTimeLineList.list[tln].timeFinal.Year,
                                                                    ENTimeLineList.list[tln].timeFinal.Month,
                                                                    ENTimeLineList.list[tln].timeFinal.Day,
                                                                    ENTimeLineList.list[tln].timeFinal.Hour,
                                                                    ENTimeLineList.list[tln].timeFinal.Minute,
                                                                    ENTimeLineList.list[tln].timeFinal.Second,
                                                                    ENTimeLineList.list[tln].timeFinal.Millisecond
                                                                   );
                                 if  soObject <> nil then
                                     Text.Text := 'Дог.№. ' +    soObject.contractNumberServices + ' : Перебування на об`єкті'  +
                                                  ' : з ' + FormatDateTime('hh.mm', ItemStartTime ) + ' до ' + FormatDateTime('hh.mm', ItemEndTime )
                                 else
                                    Text.Text := ' Перебування на об`єкті' +
                                                  ' : з ' + FormatDateTime('hh.mm', ItemStartTime ) + ' до ' + FormatDateTime('hh.mm', ItemEndTime );
                                    Font.Size:= 4;
                                    Color:= clGreen;
                                    CaptionType:= ctTimeText;
                                    CaptionFont.Size:= 6;
                                    Shape:= psRect;
                                    TrackVisible:= False;
                                    Shadow:= False;
                                 end;
                              //  время в пути c объекта
                              if  ((FormatDateTime('hh:mm',ENTimeLineList.list[tln].timeFinal.AsDateTime) <> '00:00' )
                                 and ( FormatDateTime('hh:mm',ENTimeLineList.list[tln].timeMoveOfObject.AsDateTime) <> '00:00' )) then
                                 with frmENServicesCalculationEdit.Planner1.CreateItem do
                                  begin
                                    ReadOnly := true;
                                    FixedPos := true;
                                    FixedPosition := true;
                                    FixedSize := true;
                                    FixedTime := true;
                                    
                                    itempos := vi;
                                    ItemStartTime :=  EncodeDateTime(ENTimeLineList.list[tln].timeFinal.Year,
                                                                    ENTimeLineList.list[tln].timeFinal.Month,
                                                                    ENTimeLineList.list[tln].timeFinal.Day,
                                                                    ENTimeLineList.list[tln].timeFinal.Hour,
                                                                    ENTimeLineList.list[tln].timeFinal.Minute,
                                                                    0,
                                                                    0
                                                                   );
                                    ItemEndTime :=  EncodeDateTime(ENTimeLineList.list[tln].timeMoveOfObject.Year,
                                                                    ENTimeLineList.list[tln].timeMoveOfObject.Month,
                                                                    ENTimeLineList.list[tln].timeMoveOfObject.Day,
                                                                    ENTimeLineList.list[tln].timeMoveOfObject.Hour,
                                                                    ENTimeLineList.list[tln].timeMoveOfObject.Minute,
                                                                    0,
                                                                    0
                                                                   );
                                    if  soObject <> nil then
                                     Text.Text := 'Дог.№. ' +    soObject.contractNumberServices + ' : Повернення на базу' +
                                                  ' : з ' + FormatDateTime('hh.mm', ItemStartTime ) + ' до ' + FormatDateTime('hh.mm', ItemEndTime )
                                    else
                                    Text.Text := ' Повернення на базу' +
                                                  ' : з ' + FormatDateTime('hh.mm', ItemStartTime ) + ' до ' + FormatDateTime('hh.mm', ItemEndTime );
                                    Font.Size:= 4;
                                    Color:= clYellow;
                                    CaptionType:= ctTimeText;
                                    CaptionFont.Size:= 6;
                                    Shape:= psRect;
                                    TrackVisible:= False;
                                    Shadow:= False;
                                  end;

                               
                           end;

                           // после прорисовки с листа вствим итемы для текущего договора если дата интервала времени чекнута
                            // создаем колонки времени отображающие время ОБЕДА
                            if ((vi <> -1 ) and (edtReservedTimeStart.Checked = True )) then
                             begin
                                 //  время в пути до объекта

                               if  ((FormatDateTime('hh:mm',edtDeliveryTimeTo.DateTime) <> '00:00' )
                                 and ( FormatDateTime('hh:mm',edtReservedTimeStart.DateTime) <> '00:00' )) then
                                 with frmENServicesCalculationEdit.Planner1.CreateItem do
                                  begin
                                    ReadOnly := true;
                                    FixedPos := true;
                                    FixedPosition := true;
                                    FixedSize := true;
                                    FixedTime := true;
                                    
                                    itempos := vi;
                                    ItemStartTime :=  EncodeDateTime( YearOf(edtReservedDate.DateTime),
                                                                      MonthOf(edtReservedDate.DateTime),
                                                                      DayOf(edtReservedDate.DateTime),
                                                                      HourOf(edtDeliveryTimeTo.DateTime),
                                                                      MinuteOf(edtDeliveryTimeTo.DateTime),
                                                                      0,0); //  edtDeliveryTimeTo.DateTime;
                                    ItemEndTime :=  EncodeDateTime( YearOf(edtReservedDate.DateTime),
                                                                      MonthOf(edtReservedDate.DateTime),
                                                                      DayOf(edtReservedDate.DateTime),
                                                                      HourOf(edtReservedTimeStart.DateTime),
                                                                      MinuteOf(edtReservedTimeStart.DateTime),
                                                                      0,0); //edtReservedTimeStart.DateTime;
                                   // if ENServicesObjectObj.code = 0 then
                                    Text.Text := 'Дог.№. ' + servicesObj.contractNumberServices + ' : Доставка до замовника' +
                                                  ' : з ' + FormatDateTime('hh.mm', ItemStartTime ) + ' до ' + FormatDateTime('hh.mm', ItemEndTime );
                                   // else
                                   // Text.Text := 'Дог.№. ' + ENServicesObjectObj.contractNumberServices + ' : Доставка до замовника' +
                                   //               ' : з ' + FormatDateTime('hh.mm', ItemStartTime ) + ' до ' + FormatDateTime('hh.mm', ItemEndTime );

                                    Font.Size:= 4;
                                    Color:= clYellow;
                                    CaptionType:= ctTimeText;
                                    CaptionFont.Size:= 6;
                                    Shape:= psRect;
                                    TrackVisible:= False;
                                    Shadow:= False;
                                    
                                  end;
                                  // интервал пребывания на объекте
                                  if  ((FormatDateTime('hh:mm',edtReservedTimeStart.DateTime) <> '00:00' )
                                  and ( FormatDateTime('hh:mm',edtReservedTimeFinal.DateTime) <> '00:00' )) then
                                 with frmENServicesCalculationEdit.Planner1.CreateItem do
                                  begin
                                    ReadOnly := true;
                                    FixedPos := true;
                                    FixedPosition := true;
                                    FixedSize := true;
                                    FixedTime := true;
                                    
                                    itempos := vi;
                                    ItemStartTime :=  EncodeDateTime( YearOf(edtReservedDate.DateTime),
                                                                      MonthOf(edtReservedDate.DateTime),
                                                                      DayOf(edtReservedDate.DateTime),
                                                                      HourOf(edtReservedTimeStart.DateTime),
                                                                      MinuteOf(edtReservedTimeStart.DateTime),
                                                                      0,0); // edtReservedTimeStart.DateTime;
                                    ItemEndTime :=  EncodeDateTime( YearOf(edtReservedDate.DateTime),
                                                                      MonthOf(edtReservedDate.DateTime),
                                                                      DayOf(edtReservedDate.DateTime),
                                                                      HourOf(edtReservedTimeFinal.DateTime),
                                                                      MinuteOf(edtReservedTimeFinal.DateTime),
                                                                      0,0);// edtReservedTimeFinal.DateTime;
                                   // if ENServicesObjectObj.code = 0 then
                                    Text.Text := 'Дог.№. ' + servicesObj.contractNumberServices + ' : Перебування на об`єкті' +
                                                  ' : з ' + FormatDateTime('hh.mm', ItemStartTime ) + ' до ' + FormatDateTime('hh.mm', ItemEndTime );
                                   // else
                                   // Text.Text := 'Дог.№. ' + ENServicesObjectObj.contractNumberServices + ' : Перебування на об`єкті' +
                                   //               ' : з ' + FormatDateTime('hh.mm', ItemStartTime ) + ' до ' + FormatDateTime('hh.mm', ItemEndTime );

                                    Font.Size:= 4;
                                    Color:= clGreen;
                                    CaptionType:= ctTimeText;
                                    CaptionFont.Size:= 6;
                                    Shape:= psRect;
                                    TrackVisible:= False;
                                    Shadow:= False;


                                  end;
                                  //  время в пути c объекта
                                  if  ((FormatDateTime('hh:mm',edtReservedTimeFinal.DateTime) <> '00:00' )
                                  and ( FormatDateTime('hh:mm',edtDeliveryTimeFrom.DateTime) <> '00:00' )) then
                                 with frmENServicesCalculationEdit.Planner1.CreateItem do
                                  begin
                                    ReadOnly := true;
                                    FixedPos := true;
                                    FixedPosition := true;
                                    FixedSize := true;
                                    FixedTime := true;
                                    
                                    itempos := vi;
                                    ItemStartTime :=  EncodeDateTime( YearOf(edtReservedDate.DateTime),
                                                                      MonthOf(edtReservedDate.DateTime),
                                                                      DayOf(edtReservedDate.DateTime),
                                                                      HourOf(edtReservedTimeFinal.DateTime),
                                                                      MinuteOf(edtReservedTimeFinal.DateTime),
                                                                      0,0); // edtReservedTimeFinal.DateTime;
                                    ItemEndTime :=  EncodeDateTime( YearOf(edtReservedDate.DateTime),
                                                                      MonthOf(edtReservedDate.DateTime),
                                                                      DayOf(edtReservedDate.DateTime),
                                                                      HourOf(edtDeliveryTimeFrom.DateTime),
                                                                      MinuteOf(edtDeliveryTimeFrom.DateTime),
                                                                      0,0); // edtDeliveryTimeFrom.DateTime;
                                   // if ENServicesObjectObj.code = 0 then
                                    Text.Text := 'Дог.№. ' + servicesObj.contractNumberServices + ' : Повернення на базу' +
                                                  ' : з ' + FormatDateTime('hh.mm', ItemStartTime ) + ' до ' + FormatDateTime('hh.mm', ItemEndTime );
                                   // else
                                   // Text.Text := 'Дог.№. ' + ENServicesObjectObj.contractNumberServices + ' : Повернення на базу' +
                                   //               ' : з ' + FormatDateTime('hh.mm', ItemStartTime ) + ' до ' + FormatDateTime('hh.mm', ItemEndTime );

                                    Font.Size:= 4;
                                    Color:= clYellow;
                                    CaptionType:= ctTimeText;
                                    CaptionFont.Size:= 6;
                                    Shape:= psRect;
                                    TrackVisible:= False;
                                    Shadow:= False;
                                  end;
                              end;

                           // создаем колонки времени отображающие время ОБЕДА
                            if vi <> -1  then
                             begin
                                 with frmENServicesCalculationEdit.Planner1.CreateItem do
                                  begin
                                    ReadOnly := true;
                                    FixedPos := true;
                                    FixedPosition := true;
                                    FixedSize := true;
                                    FixedTime := true;

                                    itempos := vi;
                                    ItemStartTime :=  EncodeDateTime( YearOf(edtReservedDate.DateTime), // ENTimeLineList.list[0].timeStart.Year,
                                                                      MonthOf(edtReservedDate.DateTime), //ENTimeLineList.list[0].timeStart.Month,
                                                                      DayOf(edtReservedDate.DateTime), //ENTimeLineList.list[0].timeStart.Day,
                                                                      12,
                                                                      12,
                                                                      0,
                                                                      0
                                                                      );
                                    ItemEndTime :=  EncodeDateTime(YearOf(edtReservedDate.DateTime), // ENTimeLineList.list[0].timeStart.Year,
                                                                      MonthOf(edtReservedDate.DateTime), //ENTimeLineList.list[0].timeStart.Month,
                                                                      DayOf(edtReservedDate.DateTime), //ENTimeLineList.list[0].timeStart.Day,
                                                                      13,
                                                                      0,
                                                                      0,
                                                                      0
                                                                     );
                                    Text.Text := 'ОБІД З 12.12 ПО 13.00' ;
                                    Font.Size:= 6;
                                    Color:= clGreen;
                                  end;
                              end;
//                                  frmENServicesCalculationEdit.Planner1.Header.Height:= 100;
//                                  frmENServicesCalculationEdit.Planner1.Header.TextHeight := 100;
//                                  frmENServicesCalculationEdit.Planner1.Header.Font.Size:= 6;
//                                  frmENServicesCalculationEdit.Planner1.Display.DisplayScale := 2;
                                //  frmENServicesCalculationEdit.Planner1.Header.Captions[vi+1] := TKVirtualBrigadeList.list[vi].nameCompound ;
                 end;

              //    frmENServicesCalculationEdit.Planner1.Header.Height:= 200;
              //    frmENServicesCalculationEdit.Planner1.Header.TextHeight := 200;
              //    frmENServicesCalculationEdit.Planner1.Header.Font.Size:= 6;
              //    frmENServicesCalculationEdit.Planner1.Display.DisplayScale := 20;
                  // frmENServicesCalculationEdit.Planner1.UpdateNVI;
           end;




     end;
  end;
 

procedure TfrmENServicesCalculationEdit.sgDepartmentClick(Sender: TObject);
  var
    i : integer;
    strCodeActiveDepartment : string;
    state : Boolean;

    TempTKVirtualBrigade: TKVirtualBrigadeControllerSoapPort;
    TempTKVirtualBrigadeFilter: TKVirtualBrigadeFilter;
    vi: Integer;
    TKVirtualBrigadeList: TKVirtualBrigadeShortList;
    LastCount : Integer;
    LastRow : Integer;

begin
  {inherited;

   // выбрать доступные бригады по чекнутым подразделениям
   For i := 0 to sgDepartment.RowCount do
   begin
      state := False;
   sgDepartment.GetCheckBoxState(1, i+1,state);
     if (( sgDepartment.Cells[0,i+1]  <> '' )  and  ( state ))then

    if strCodeActiveDepartment <> '' then
    strCodeActiveDepartment := strCodeActiveDepartment + ' , ' +   sgDepartment.Cells[0,i+1]
    else
    strCodeActiveDepartment := sgDepartment.Cells[0,i+1] ;


   end;
    // сформировали строку с кодами подразделений и под них показываем бригады активные в этот период(    )
    sgBrigadeInDepartment.Clear;
    sgBrigadeInDepartment.RowCount:=2;
    SetGridHeaders(TKVirtualBrigadeHeaders, sgBrigadeInDepartment.ColumnHeaders);
   if strCodeActiveDepartment <> '' then
    begin
        LastRow:= 1;   
        TempTKVirtualBrigade :=  HTTPRIOTKVirtualBrigade as TKVirtualBrigadeControllerSoapPort;

        if TempTKVirtualBrigadeFilter = nil then
        begin
           TempTKVirtualBrigadeFilter := TKVirtualBrigadeFilter.Create;
           SetNullIntProps(TempTKVirtualBrigadeFilter);
           SetNullXSProps(TempTKVirtualBrigadeFilter);
        end;

        
       // TKVirtualBrigadeList := TempTKVirtualBrigade.getScrollableFilteredList(TKVirtualBrigadeFilter(TempTKVirtualBrigadeFilter),0,-1);
       TKVirtualBrigadeList := TempTKVirtualBrigade.getScrollableFilteredListForServices(TempTKVirtualBrigadeFilter,0,-1 , DateToStr(edtReservedDate.DateTime) , ENServicesObjectObj.code ,strCodeActiveDepartment );


        LastCount:=High(TKVirtualBrigadeList.list);

        if LastCount > -1 then
           sgBrigadeInDepartment.RowCount:=LastCount+2
        else
           sgBrigadeInDepartment.RowCount:=2;

         with sgBrigadeInDepartment do
          for i:=0 to LastCount do
            begin
              Application.ProcessMessages;
              if TKVirtualBrigadeList.list[i].code <> Low(Integer) then
              Cells[0,i+1] := IntToStr(TKVirtualBrigadeList.list[i].code)
              else
              Cells[0,i+1] := '';

              Cells[1,i+1] := TKVirtualBrigadeList.list[i].nameCompound;
              if TKVirtualBrigadeList.list[i].pr = 1 then
               AddCheckBox(1, i+1, true, false)
              else
               AddCheckBox(1, i+1, false, false);

              LastRow:=i+1;
              sgBrigadeInDepartment.RowCount:=LastRow+1;
            end;

         sgBrigadeInDepartment.Row:=1;


    end;
        RenderPlanner;   }
end;


procedure TfrmENServicesCalculationEdit.sgDocumentManagementDblClick(Sender: TObject);
begin
  inherited;
  actViewServicesConsumerExecute(Sender);
end;


procedure TfrmENServicesCalculationEdit.btnInsertExecuteDateClick(Sender: TObject);
var TempENTimeLine: ENTimeLineControllerSoapPort;
    TempENServicesObject: ENServicesObjectControllerSoapPort;
tllist : ENTimeLineShortList;
tlArr :  ArrayOfENTimeLineShort;
tlObj : ENTimeLineShort;
soObj : ENServicesObject;
n , i  : Integer;
state : Boolean;

    TempENDeliveryTimePlan: ENDeliveryTimePlanControllerSoapPort;
    di, rep: Integer;
    ENDeliveryTimePlanList: ENDeliveryTimePlanShortList;
    TempENDeliveryTimePlanFilter : ENDeliveryTimePlanFilter;
    SumTimeWork : Double;
    beginTimeWork : TDateTime; // день время с которого начинается обработка услуг на сторону
    startLunch : TDateTime;    // дата время начала обеда
    finalLunch : TDateTime;    // дата время окончания обеда
    finalTimeWork : TDateTime; // день время по которое разрешано резервировать время для виконання послуг
    soContractDate, soReservedTimeDate, replaceCounterDatePeriod : TDateTime;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте затвердити дату / час виконання робіт для бригад ?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;


  if FormatDateTime('hh:mm',edtReservedTimeStart.DateTime) = '00:00' then
     begin
       Application.MessageBox(PChar('Не вказано інтервал часу прибуття виконавця (З) !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
       Exit;
     end;

   if FormatDateTime('hh:mm',edtReservedTimeFinal.DateTime) = '00:00' then
     begin
       Application.MessageBox(PChar('Не вказано інтервал часу прибуття виконавця (ПО) !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
       Exit;
     end;
   if  ((FormatDateTime('hh:mm',edtDeliveryTimeTo.DateTime) = '00:00') or ( FormatDateTime('hh:mm',edtDeliveryTimeFrom.DateTime) = '00:00' ))  then
     begin
       Application.MessageBox(PChar('Помилка в часі прибуття виконавця !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
       Exit;
     end;


  if not NoBlankValues([
     edtReservedDate , edtReservedTimeStart , edtReservedTimeFinal ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы (Дата/время выполнения работ) !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Exit;
  end
  else
    begin
      TempENTimeLine := HTTPRIOENTimeLine as ENTimeLineControllerSoapPort;


      // проверка перед инсертом
      // SUPP - 53893 там где работы с приходованием счетчика абонента не нужно такого ограничения
         if (replaceCounter) and (not isGiveCounterToBalance) then begin
           soContractDate := EncodeDateTime(YearOf(edtContractDateServices.DateTime),
                                            MonthOf(edtContractDateServices.DateTime),
                                            DayOf(edtContractDateServices.datetime), 0,0,0,0 );
           soReservedTimeDate := EncodeDateTime(YearOf(edtReservedDate.DateTime),
                                            MonthOf(edtReservedDate.DateTime),
                                            DayOf(edtReservedDate.datetime), 0,0,0,0 );

           rep:= DaysBetween( soContractDate, soReservedTimeDate);
          if (DaysBetween( soContractDate, soReservedTimeDate) <= 10) then
          begin
            Application.MessageBox(PChar('Дата виконання робіт на встановлення багатофункційних приладів обліку ' +
                                         ' не може бути ближче ніж 10 днів з дати складання договору на послуги!' +
                                         ' Дата договору: ' + FormatDateTime('dd.mm.yyyy',soContractDate) +
                                         ' Обрана дата виконання робіт: ' + FormatDateTime('dd.mm.yyyy',soReservedTimeDate)),PChar('Внимание!'), MB_ICONWARNING);
              edtReservedTimeStart.SetFocus;
              Exit;
          end;

         end;


         beginTimeWork:=   EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(StrToDateTime(MIN_TIME_FOR_REZERVED_CALCULATION)) ,
                                                    MinuteOf(StrToDateTime(MIN_TIME_FOR_REZERVED_CALCULATION)),
                                                    0,
                                                    0) ;
         if DayOfWeek(edtReservedDate.DateTime)  = 6 then // пятница
         finalTimeWork:=   EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                          MonthOf(edtReservedDate.datetime) ,
                                                          DayOf(edtReservedDate.datetime) ,
                                                          HourOf(StrToDateTime(TIME_END_FRIDAY_DAY)) ,
                                                          MinuteOf(StrToDateTime(TIME_END_FRIDAY_DAY)),
                                                          0,
                                                          0) ;
         if DayOfWeek(edtReservedDate.DateTime)  <> 6 then // не пятница
         finalTimeWork:=   EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                          MonthOf(edtReservedDate.datetime) ,
                                                          DayOf(edtReservedDate.datetime) ,
                                                          HourOf(StrToDateTime(TIME_END_WORKING_DAY)) ,
                                                          MinuteOf(StrToDateTime(TIME_END_WORKING_DAY)),
                                                          0,
                                                          0) ;
              // если интервал времени С меньше чем  время beginTimeWork
         if edtReservedTimeStart.DateTime <  beginTimeWork then
         begin
              Application.MessageBox(PChar('Час інтервалу прибуття виконавця "З" не може бути меншим ніж ' + FormatDateTime('t', beginTimeWork) + ' !!!'),PChar('Внимание!'), MB_ICONWARNING);
              edtReservedTimeFinal.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                          MonthOf(edtReservedDate.datetime) ,
                                                          DayOf(edtReservedDate.datetime) ,
                                                          0,
                                                          0,
                                                          0,
                                                          0) ;
              edtReservedTimeStart.SetFocus;
              Exit;
         end;
         // если интервал времени С больше чем  время по которое разрешано резервировать время для виконання послуг
         if edtReservedTimeStart.DateTime >  finalTimeWork then
         begin
              Application.MessageBox(PChar('Час інтервалу прибуття виконавця "З" не може бути більшим ніж ' + FormatDateTime('t', finalTimeWork) + ' !!!'),PChar('Внимание!'), MB_ICONWARNING);
              edtReservedTimeFinal.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                          MonthOf(edtReservedDate.datetime) ,
                                                          DayOf(edtReservedDate.datetime) ,
                                                          0 ,
                                                          0,
                                                          0,
                                                          0) ;
              edtDeliveryTimeFrom.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                          MonthOf(edtReservedDate.datetime) ,
                                                          DayOf(edtReservedDate.datetime) ,
                                                          0 ,
                                                          0,
                                                          0,
                                                          0) ;
              edtReservedTimeStart.SetFocus;
              Exit;
         end;

         startLunch:=   EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(StrToDateTime(TIME_LUNCH_START)) ,
                                                    MinuteOf(StrToDateTime(TIME_LUNCH_START)),
                                                    0,
                                                    0) ;
         finalLunch:=   EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                          MonthOf(edtReservedDate.datetime) ,
                                                          DayOf(edtReservedDate.datetime) ,
                                                          HourOf(StrToDateTime(TIME_LUNCH_FINAL)) ,
                                                          MinuteOf(StrToDateTime(TIME_LUNCH_FINAL)),
                                                          0,
                                                          0) ;


         // если интервал времени С находится в пределах времени обеда 
         if ((edtReservedTimeStart.DateTime >  startLunch) and ( edtReservedTimeStart.DateTime <  finalLunch )) then
         begin
              Application.MessageBox(PChar('Час інтервалу прибуття виконавця "З" не може бути в межах часу обідньої перерви !!!'),PChar('Внимание!'), MB_ICONWARNING);
              edtReservedTimeFinal.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                          MonthOf(edtReservedDate.datetime) ,
                                                          DayOf(edtReservedDate.datetime) ,
                                                          0 ,
                                                          0,
                                                          0,
                                                          0) ;
              edtReservedTimeStart.SetFocus;
              Exit;
         end;
   
         // если интервал времени С равен времени начала обеда
         if edtReservedTimeStart.DateTime =  startLunch then
         begin
              Application.MessageBox(PChar('Час інтервалу прибуття виконавця "З" не може дорівнювати часу початку обідньої перерви !!!'),PChar('Внимание!'), MB_ICONWARNING);
              edtReservedTimeFinal.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                          MonthOf(edtReservedDate.datetime) ,
                                                          DayOf(edtReservedDate.datetime) ,
                                                          0 ,
                                                          0,
                                                          0,
                                                          0) ;
              edtReservedTimeStart.SetFocus;
              Exit;
         end;

                // если то время во сколько должен выехать исполнитель меньше времени beginTimeWork
         if edtDeliveryTimeTo.DateTime <  beginTimeWork then
         begin
              Application.MessageBox(PChar('Час виїзду виконавця на об`єкт не повинен бути менше ніж ' + FormatDateTime('t', beginTimeWork) + ' . Змінюйте Інтервал часу "З" !!!'),PChar('Внимание!'), MB_ICONWARNING);
              edtDeliveryTimeTo.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                          MonthOf(edtReservedDate.datetime) ,
                                                          DayOf(edtReservedDate.datetime) ,
                                                          0 ,
                                                          0,
                                                          0,
                                                          0) ;
              edtReservedTimeFinal.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                          MonthOf(edtReservedDate.datetime) ,
                                                          DayOf(edtReservedDate.datetime) ,
                                                          0 ,
                                                          0,
                                                          0,
                                                          0) ;
             edtDeliveryTimeFrom.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                          MonthOf(edtReservedDate.datetime) ,
                                                          DayOf(edtReservedDate.datetime) ,
                                                          0 ,
                                                          0,
                                                          0,
                                                          0) ;
              Exit;
         end;
          // если время выезда находится в периоде обеда
         if ((edtDeliveryTimeTo.DateTime >  startLunch) and ( edtDeliveryTimeTo.DateTime <  finalLunch )) then
         begin
              Application.MessageBox(PChar('Час виїзду виконавця на об`єкт не може бути в межах часу обідньої перерви !!!'),PChar('Внимание!'), MB_ICONWARNING);
              edtReservedTimeFinal.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                          MonthOf(edtReservedDate.datetime) ,
                                                          DayOf(edtReservedDate.datetime) ,
                                                          0 ,
                                                          0,
                                                          0,
                                                          0) ;
             edtDeliveryTimeTo.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                          MonthOf(edtReservedDate.datetime) ,
                                                          DayOf(edtReservedDate.datetime) ,
                                                          HourOf(edtReservedTimeStart.datetime) ,
                                                          MinuteOf(edtReservedTimeStart.datetime) ,
                                                          0,
                                                          0) ;
              edtReservedTimeStart.SetFocus;
              Exit;
         end;

         // проверим что бы время выполнения с учетом доставки  на текущем договоре не пересеклось с временами бригад которые задействованы на других объектах
       if  checkOtherTimeLine = false then
        begin
          Application.MessageBox(PChar('На цей час бригада задіяна на іншому об`єкті !!!'),PChar('Внимание!'), MB_ICONWARNING);
          exit;
        end;
      // end проверки перед инсертом

          n := 0;
          state := false;
          for i := 1 to sgBrigadeInDepartment.RowCount - 1 do
          begin
            sgBrigadeInDepartment.GetCheckBoxState(1, i, state);
            if state then
            begin
               n := n + 1;
            end;
          end;

          tlList := ENTimeLineShortList.Create;
          tlList.totalCount := 0;
          SetLength(tlArr, n);
          n := 0;

          state := false;

          for i := 1 to sgBrigadeInDepartment.RowCount - 1 do
          begin
            sgBrigadeInDepartment.GetCheckBoxState(1, i, state);
            if state then
            begin
               tlObj := ENTimeLineShort.Create;
               SetNullIntProps(tlObj);
               SetNullXSProps(tlObj);

               tlObj.dateGen := TXSDate.Create;
               tlObj.dateGen.XSToNative(GetXSDate(edtReservedDate.DateTime));
               tlObj.timeStart := TXSDateTime.Create;
               tlObj.timeStart.XSToNative(GetXSDateTime(edtReservedTimeStart.DateTime));
               tlObj.timeFinal := TXSDateTime.Create;
               tlObj.timeFinal.XSToNative(GetXSDateTime(edtReservedTimeFinal.DateTime));
               tlObj.timeMoveToObject := TXSDateTime.Create;
               tlObj.timeMoveToObject.XSToNative(GetXSDateTime(edtDeliveryTimeTo.DateTime));
               tlObj.timeMoveOfObject := TXSDateTime.Create;
               tlObj.timeMoveOfObject.XSToNative(GetXSDateTime(edtDeliveryTimeFrom.DateTime));
               tlObj.virtualBrigadeRefCode := StrToInt(sgBrigadeInDepartment.cells[0,i]);

               tlArr[n] := tlObj;
               n := n + 1;

            end;
          end;

          
            if (High(tlArr) >= 0) then
            begin

              TempENTimeLine.addTimeLine(ENServicesObjectObj,tlArr);
              Application.MessageBox(PChar('Збережено!'), PChar('Повідомлення'), MB_ICONINFORMATION);

            end
      else
           begin
                Application.MessageBox(PChar('Треба обрати бригаду для виконання робіт !!!'),PChar('Внимание!'), MB_ICONWARNING);
                Exit;
           end;


  end;

end;

procedure TfrmENServicesCalculationEdit.sgBrigadeInDepartmentClick(
  Sender: TObject);
begin
//  inherited;
//    RenderPlanner;
end;

procedure TfrmENServicesCalculationEdit.sgBrigadeInDepartmentCheckBoxClick(
  Sender: TObject; ACol, ARow: Integer; State: Boolean);
begin
  inherited;

  RenderPlanner; 

end;

procedure TfrmENServicesCalculationEdit.sgDepartmentCheckBoxClick(
  Sender: TObject; ACol, ARow: Integer; State: Boolean);
 var
    i  , codeServicesObject: integer;
    strCodeActiveDepartment : string;
    vstate : Boolean;

    TempTKVirtualBrigade: TKVirtualBrigadeControllerSoapPort;
    TempTKVirtualBrigadeFilter: TKVirtualBrigadeFilter;
    vi: Integer;
    TKVirtualBrigadeList: TKVirtualBrigadeShortList;
    LastCount : Integer;
    LastRow : Integer;

    TempENServicesObject: ENServicesObjectControllerSoapPort;
    servicesObj: ENServicesObject;
    servicesObjFilter: ENServicesObjectFilter;
    servicesObjList: ENServicesObjectShortList;
begin
  inherited;

        if ENServicesObjectObj.code <> 0 then
            codeServicesObject := ENServicesObjectObj.code
         else
         // если код сервис 0 то поищем по фильтру
         begin
             TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
              servicesObjFilter := ENServicesObjectFilter.Create;
              SetNullIntProps(servicesObjFilter);
              SetNullXSProps(servicesObjFilter);
              servicesObjFilter.conditionSQL := ' ENSERVICESOBJECT.CODE in ( select so.code  from enservicesobject so , enplanwork p  ' +
                            ' where so.elementcode = p.elementrefcode ' +
                            '   and p.kindcode = 5 ' +
                            '   and p.code = ' + IntToStr(planCode)  + ')';

              servicesObjList := TempENServicesObject.getEasyShortList(servicesObjFilter, 0, -1);
              if servicesObjList.totalCount > 0 then
                 codeServicesObject := servicesObjList.list[0].code;
         end;

   // выбрать доступные бригады по чекнутым подразделениям
   For i := 0 to sgDepartment.RowCount do
   begin
      vstate := False;
   sgDepartment.GetCheckBoxState(1, i+1,vstate);
     if (( sgDepartment.Cells[0,i+1]  <> '' )  and  ( vstate ))then

    if strCodeActiveDepartment <> '' then
    strCodeActiveDepartment := strCodeActiveDepartment + ' , ' +   sgDepartment.Cells[0,i+1]
    else
    strCodeActiveDepartment := sgDepartment.Cells[0,i+1] ;


   end;
    // сформировали строку с кодами подразделений и под них показываем бригады активные в этот период(    )
    sgBrigadeInDepartment.Clear;
    sgBrigadeInDepartment.RowCount:=2;
    SetGridHeaders(TKVirtualBrigadeHeaders, sgBrigadeInDepartment.ColumnHeaders);
   if strCodeActiveDepartment <> '' then
    begin
        LastRow:= 1;   
        TempTKVirtualBrigade :=  HTTPRIOTKVirtualBrigade as TKVirtualBrigadeControllerSoapPort;


           TempTKVirtualBrigadeFilter := TKVirtualBrigadeFilter.Create;
           SetNullIntProps(TempTKVirtualBrigadeFilter);
           SetNullXSProps(TempTKVirtualBrigadeFilter);


        
       // TKVirtualBrigadeList := TempTKVirtualBrigade.getScrollableFilteredList(TKVirtualBrigadeFilter(TempTKVirtualBrigadeFilter),0,-1);
       TKVirtualBrigadeList := TempTKVirtualBrigade.getScrollableFilteredListForServices(TempTKVirtualBrigadeFilter,0,-1 , DateToStr(edtReservedDate.DateTime) , {ENServicesObjectObj.code} codeServicesObject ,strCodeActiveDepartment );


        LastCount:=High(TKVirtualBrigadeList.list);

        if LastCount > -1 then
           sgBrigadeInDepartment.RowCount:=LastCount+2
        else
           sgBrigadeInDepartment.RowCount:=2;

         with sgBrigadeInDepartment do
          for i:=0 to LastCount do
            begin
              Application.ProcessMessages;
              if TKVirtualBrigadeList.list[i].code <> Low(Integer) then
              Cells[0,i+1] := IntToStr(TKVirtualBrigadeList.list[i].code)
              else
              Cells[0,i+1] := '';

              Cells[1,i+1] := TKVirtualBrigadeList.list[i].nameCompound;
              if TKVirtualBrigadeList.list[i].pr = 1 then
               AddCheckBox(1, i+1, true, false)
              else
               AddCheckBox(1, i+1, false, false);

              LastRow:=i+1;
              sgBrigadeInDepartment.RowCount:=LastRow+1;
            end;

         sgBrigadeInDepartment.Row:=1;


    end;
        RenderPlanner;
end;

procedure TfrmENServicesCalculationEdit.edtReservedTimeStartChange(
  Sender: TObject);
  var
    TempENDeliveryTimePlan: ENDeliveryTimePlanControllerSoapPort;
    di: Integer;
    ENDeliveryTimePlanList: ENDeliveryTimePlanShortList;
    TempENDeliveryTimePlanFilter : ENDeliveryTimePlanFilter;
    SumTimeWork : Double;
    beginTimeWork : TDateTime; // день время с которого начинается обработка услуг на сторону
    startLunch : TDateTime;    // дата время начала обеда
    finalLunch : TDateTime;    // дата время окончания обеда
    finalTimeWork : TDateTime; // день время по которое разрешано резервировать время для виконання послуг
begin
  {

 if not edtReservedDate.Checked then

    begin
        Application.MessageBox(PChar('Оберіть спочатку дату виконання робіт по договору  !!!'),PChar('Внимание!'), MB_ICONWARNING);
        edtReservedTimeStart.Checked:= False;
        Exit;
    end
 else
 begin
       // сбрасываем значения времени кроме начала выполнения в 00 мин 00 сек.
       edtDeliveryTimeTo.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0 ,
                                                    0,
                                                    0,
                                                    0) ;
        edtReservedTimeFinal.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0 ,
                                                    0,
                                                    0,
                                                    0) ;
       edtDeliveryTimeFrom.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0 ,
                                                    0,
                                                    0,
                                                    0) ;

    beginTimeWork:=   EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(StrToDateTime(MIN_TIME_FOR_REZERVED_CALCULATION)) ,
                                                    MinuteOf(StrToDateTime(MIN_TIME_FOR_REZERVED_CALCULATION)),
                                                    0,
                                                    0) ;
   if DayOfWeek(edtReservedDate.DateTime)  = 6 then // пятница
   finalTimeWork:=   EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(StrToDateTime(TIME_END_FRIDAY_DAY)) ,
                                                    MinuteOf(StrToDateTime(TIME_END_FRIDAY_DAY)),
                                                    0,
                                                    0) ;
   if DayOfWeek(edtReservedDate.DateTime)  <> 6 then // не пятница
   finalTimeWork:=   EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(StrToDateTime(TIME_END_WORKING_DAY)) ,
                                                    MinuteOf(StrToDateTime(TIME_END_WORKING_DAY)),
                                                    0,
                                                    0) ;
   // приведем период З к дате выполнения работ и времени которое вводит пользователь и секунды в ноль
   edtReservedTimeStart.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(edtReservedTimeStart.DateTime) ,
                                                    MinuteOf(edtReservedTimeStart.DateTime),
                                                    0,
                                                    0) ;
  // если интервал времени С меньше чем  время beginTimeWork
   if edtReservedTimeStart.DateTime <  beginTimeWork then
   begin
        Application.MessageBox(PChar('Час інтервалу прибуття виконавця "З" не може бути меншим ніж ' + FormatDateTime('t', beginTimeWork) + ' !!!'),PChar('Внимание!'), MB_ICONWARNING);
        edtReservedTimeFinal.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0,
                                                    0,
                                                    0,
                                                    0) ;
        Exit;
   end;
   // если интервал времени С больше чем  время по которое разрешано резервировать время для виконання послуг
   if edtReservedTimeStart.DateTime >  finalTimeWork then
   begin
        Application.MessageBox(PChar('Час інтервалу прибуття виконавця "З" не може бути більшим ніж ' + FormatDateTime('t', finalTimeWork) + ' !!!'),PChar('Внимание!'), MB_ICONWARNING);
        edtReservedTimeFinal.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0 ,
                                                    0,
                                                    0,
                                                    0) ;
        edtDeliveryTimeFrom.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0 ,
                                                    0,
                                                    0,
                                                    0) ;
        Exit;
   end;
 // сумарное время(продолжительность) выполнения работ по калькуляции
  SumTimeWork := getSumTimeWorkForCalculation(planCode);
 // определим время интервала выполнения работ ПО (с учетом переноса на время обеда и с проверкой на конец дня
 // также проверить что бы дата интервала "З" была не больше чем за Время определенное константой  до конца рабочего дня   )
  edtReservedTimeFinal.DateTime :=   TimeOf( edtReservedTimeStart.DateTime) + SumTimeWork / 24 ;
  edtReservedTimeFinal.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(edtReservedTimeFinal.DateTime) ,
                                                    MinuteOf(edtReservedTimeFinal.DateTime),
                                                    0,
                                                    0) ;

   startLunch:=   EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(StrToDateTime(TIME_LUNCH_START)) ,
                                                    MinuteOf(StrToDateTime(TIME_LUNCH_START)),
                                                    0,
                                                    0) ;
   finalLunch:=   EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(StrToDateTime(TIME_LUNCH_FINAL)) ,
                                                    MinuteOf(StrToDateTime(TIME_LUNCH_FINAL)),
                                                    0,
                                                    0) ;


   // если интервал времени С находится в пределах времени обеда запрещаем такое время ставить
   if ((edtReservedTimeStart.DateTime >  startLunch) and ( edtReservedTimeStart.DateTime <  finalLunch )) then
   begin
        Application.MessageBox(PChar('Час інтервалу прибуття виконавця "З" не може бути в межах часу обідньої перерви !!!'),PChar('Внимание!'), MB_ICONWARNING);
        edtReservedTimeFinal.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0 ,
                                                    0,
                                                    0,
                                                    0) ;
        Exit;
   end;
   // если интервал времени С равен времени начала обеда то говорим об этом
   if edtReservedTimeStart.DateTime =  startLunch then
   begin
        Application.MessageBox(PChar('Час інтервалу прибуття виконавця "З" не може дорівнювати часу початку обідньої перерви !!!'),PChar('Внимание!'), MB_ICONWARNING);
        edtReservedTimeFinal.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0 ,
                                                    0,
                                                    0,
                                                    0) ;
        Exit;
   end;
   // если интервал ПО перекрывает время обеда то перенести часть времени на после обед
   if (( edtReservedTimeFinal.DateTime >  startLunch ) and ( edtReservedTimeStart.DateTime <  startLunch )) then
    begin
      edtReservedTimeFinal.DateTime:=  finalLunch + (SumTimeWork / 24) - (startLunch - edtReservedTimeStart.DateTime);
      edtReservedTimeFinal.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(edtReservedTimeFinal.DateTime) ,
                                                    MinuteOf(edtReservedTimeFinal.DateTime),
                                                    0,
                                                    0) ;
    end;

 // расчет времени во сколько должен выехать исполнитель на объект что бы добраться к тому времени что указали в значении Интервала С
                // время проезда бригад до объекта endeliverytimeplan
                  TempENDeliveryTimePlan :=  HTTPRIOENDeliveryTimePlan as ENDeliveryTimePlanControllerSoapPort;
                  TempENDeliveryTimePlanFilter := ENDeliveryTimePlanFilter.Create;
                  SetNullIntProps(TempENDeliveryTimePlanFilter);
                  SetNullXSProps(TempENDeliveryTimePlanFilter);

                  TempENDeliveryTimePlanFilter.planWorkRef := ENPlanWorkRef.Create;
                  TempENDeliveryTimePlanFilter.planWorkRef.code := planCode;
                  ENDeliveryTimePlanList := TempENDeliveryTimePlan.getScrollableFilteredList(TempENDeliveryTimePlanFilter,0,-1);
                  if High(ENDeliveryTimePlanList.list) > -1 then
                  edtDeliveryTimeTo.DateTime :=  // FloatToStr( StrToFloat(ENDeliveryTimePlanList.list[0].deliveryTimePlan.DecimalString) / 2 )  ;
                      TimeOf( edtReservedTimeStart.DateTime) -
                               ( StrToFloat(ENDeliveryTimePlanList.list[0].deliveryTimePlan.DecimalString) / 2 ) /24;
                  edtDeliveryTimeTo.DateTime := EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(edtDeliveryTimeTo.DateTime) ,
                                                    MinuteOf(edtDeliveryTimeTo.DateTime),
                                                    0,
                                                    0) ;
   // если то время во сколько должен выехать исполнитель меньше времени beginTimeWork
   if edtDeliveryTimeTo.DateTime <  beginTimeWork then
   begin
        Application.MessageBox(PChar('Час виїзду виконавця на об`єкт не повинен бути менше ніж ' + FormatDateTime('t', beginTimeWork) + ' . Змінюйте Інтервал часу "З" !!!'),PChar('Внимание!'), MB_ICONWARNING);
        edtDeliveryTimeTo.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0 ,
                                                    0,
                                                    0,
                                                    0) ;
        edtReservedTimeFinal.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0 ,
                                                    0,
                                                    0,
                                                    0) ;
       edtDeliveryTimeFrom.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0 ,
                                                    0,
                                                    0,
                                                    0) ;
        Exit;
   end;
   // расчет времени возвращения исполнителя с объекта
     if ((HourOf(edtReservedTimeFinal.DateTime)  <> 0 ) and ( MinuteOf(edtReservedTimeFinal.DateTime) <> 0 )) then
       begin
         edtDeliveryTimeFrom.DateTime :=  TimeOf( edtReservedTimeFinal.DateTime) +
                               ( StrToFloat(ENDeliveryTimePlanList.list[0].deliveryTimePlan.DecimalString) / 2 ) /24;
         // год месячц день ставим корректным
         edtDeliveryTimeFrom.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(edtDeliveryTimeFrom.DateTime) ,
                                                    MinuteOf(edtDeliveryTimeFrom.DateTime),
                                                    0,
                                                    0) ;
       end;

    // если работы такие что ехать к заказчику не нада тогда обнуляем время выезда исполнтеля и прибытия
     if not isVisitClient then
      begin
        edtDeliveryTimeTo.DateTime := EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0 ,
                                                    0,
                                                    0,
                                                    0) ;
        edtDeliveryTimeTo.Checked:=False;

        edtDeliveryTimeFrom.DateTime := EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0 ,
                                                    0,
                                                    0,
                                                    0) ;
        edtDeliveryTimeFrom.Checked:=False;
        DisableControls([edtDeliveryTimeTo,edtDeliveryTimeFrom , lblDeliveryTimeTo , lblDeliveryTimeFrom]);
      end;


 end;  }
end;
// сумма времени из техкарт котрые выбраны в калькуляции   
function TfrmENServicesCalculationEdit.getSumTimeWorkForCalculation(codePlan : Integer):Double;
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


procedure TfrmENServicesCalculationEdit.edtReservedTimeStartExit(
  Sender: TObject);
  var
    TempENDeliveryTimePlan: ENDeliveryTimePlanControllerSoapPort;
    di: Integer;
    ENDeliveryTimePlanList: ENDeliveryTimePlanShortList;
    TempENDeliveryTimePlanFilter : ENDeliveryTimePlanFilter;
    SumTimeWork : Double;
    beginTimeWork : TDateTime; // день время с которого начинается обработка услуг на сторону
    startLunch : TDateTime;    // дата время начала обеда
    finalLunch : TDateTime;    // дата время окончания обеда
    finalTimeWork : TDateTime; // день время по которое разрешано резервировать время для виконання послуг

    TotHor :double;
    temptime : TDateTime;
begin


 if not edtReservedDate.Checked  then

    begin
        Application.MessageBox(PChar('Оберіть спочатку дату виконання робіт по договору  !!!'),PChar('Внимание!'), MB_ICONWARNING);
        edtReservedTimeStart.Checked:= False;
        edtReservedDate.SetFocus;
        Exit;
    end
 else
 if FormatDateTime('hh:mm',edtReservedTimeStart.DateTime) <> '00:00' then 
 begin
       // сбрасываем значения времени кроме начала выполнения в 00 мин 00 сек.
       edtDeliveryTimeTo.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0 ,
                                                    0,
                                                    0,
                                                    0) ;
        edtReservedTimeFinal.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0 ,
                                                    0,
                                                    0,
                                                    0) ;
       edtDeliveryTimeFrom.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0 ,
                                                    0,
                                                    0,
                                                    0) ;

    beginTimeWork:=   EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(StrToDateTime(MIN_TIME_FOR_REZERVED_CALCULATION)) ,
                                                    MinuteOf(StrToDateTime(MIN_TIME_FOR_REZERVED_CALCULATION)),
                                                    0,
                                                    0) ;
   if DayOfWeek(edtReservedDate.DateTime)  = 6 then // пятница
   finalTimeWork:=   EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(StrToDateTime(TIME_END_FRIDAY_DAY)) ,
                                                    MinuteOf(StrToDateTime(TIME_END_FRIDAY_DAY)),
                                                    0,
                                                    0) ;
   if DayOfWeek(edtReservedDate.DateTime)  <> 6 then // не пятница
   finalTimeWork:=   EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(StrToDateTime(TIME_END_WORKING_DAY)) ,
                                                    MinuteOf(StrToDateTime(TIME_END_WORKING_DAY)),
                                                    0,
                                                    0) ;
   // приведем период З к дате выполнения работ и времени которое вводит пользователь и секунды в ноль
   edtReservedTimeStart.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(edtReservedTimeStart.DateTime) ,
                                                    MinuteOf(edtReservedTimeStart.DateTime),
                                                    0,
                                                    0) ;
  // если интервал времени С меньше чем  время beginTimeWork
   if edtReservedTimeStart.DateTime <  beginTimeWork then
   begin
        Application.MessageBox(PChar('Час інтервалу прибуття виконавця "З" не може бути меншим ніж ' + FormatDateTime('t', beginTimeWork) + ' !!!'),PChar('Внимание!'), MB_ICONWARNING);
        edtReservedTimeFinal.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0,
                                                    0,
                                                    0,
                                                    0) ;
        edtReservedTimeStart.SetFocus;
        Exit;
   end;
   // если интервал времени С больше чем  время по которое разрешано резервировать время для виконання послуг
   if edtReservedTimeStart.DateTime >  finalTimeWork then
   begin
        Application.MessageBox(PChar('Час інтервалу прибуття виконавця "З" не може бути більшим ніж ' + FormatDateTime('t', finalTimeWork) + ' !!!'),PChar('Внимание!'), MB_ICONWARNING);
        edtReservedTimeFinal.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0 ,
                                                    0,
                                                    0,
                                                    0) ;
        edtDeliveryTimeFrom.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0 ,
                                                    0,
                                                    0,
                                                    0) ;
        edtReservedTimeStart.SetFocus;
        Exit;
   end;
 // сумарное время(продолжительность) выполнения работ по калькуляции
  SumTimeWork := getSumTimeWorkForCalculation(planCode);
 // определим время интервала выполнения работ ПО (с учетом переноса на время обеда и с проверкой на конец дня
 // также проверить что бы дата интервала "З" была не больше чем за Время определенное константой  до конца рабочего дня   )
  edtReservedTimeFinal.DateTime :=   TimeOf( edtReservedTimeStart.DateTime) + SumTimeWork / 24 ;
  edtReservedTimeFinal.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(edtReservedTimeFinal.DateTime) ,
                                                    MinuteOf(edtReservedTimeFinal.DateTime),
                                                    0,
                                                    0) ;

   startLunch:=   EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(StrToDateTime(TIME_LUNCH_START)) ,
                                                    MinuteOf(StrToDateTime(TIME_LUNCH_START)),
                                                    0,
                                                    0) ;
   finalLunch:=   EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(StrToDateTime(TIME_LUNCH_FINAL)) ,
                                                    MinuteOf(StrToDateTime(TIME_LUNCH_FINAL)),
                                                    0,
                                                    0) ;


   // если интервал времени С находится в пределах времени обеда 
   if ((edtReservedTimeStart.DateTime >  startLunch) and ( edtReservedTimeStart.DateTime <  finalLunch )) then
   begin
        Application.MessageBox(PChar('Час інтервалу прибуття виконавця "З" не може бути в межах часу обідньої перерви !!!'),PChar('Внимание!'), MB_ICONWARNING);
        edtReservedTimeFinal.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0 ,
                                                    0,
                                                    0,
                                                    0) ;
        edtReservedTimeStart.SetFocus;
        Exit;
   end;
   
   // если интервал времени С равен времени начала обеда 
   if edtReservedTimeStart.DateTime =  startLunch then
   begin
        Application.MessageBox(PChar('Час інтервалу прибуття виконавця "З" не може дорівнювати часу початку обідньої перерви !!!'),PChar('Внимание!'), MB_ICONWARNING);
        edtReservedTimeFinal.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0 ,
                                                    0,
                                                    0,
                                                    0) ;
        edtReservedTimeStart.SetFocus;
        Exit;
   end;
   // если интервал ПО перекрывает время обеда то перенести часть времени на после обед
   if (( edtReservedTimeFinal.DateTime >  startLunch ) and ( edtReservedTimeStart.DateTime <  startLunch )) then
    begin
      edtReservedTimeFinal.DateTime:=  finalLunch + (SumTimeWork / 24) - (startLunch - edtReservedTimeStart.DateTime);
      edtReservedTimeFinal.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(edtReservedTimeFinal.DateTime) ,
                                                    MinuteOf(edtReservedTimeFinal.DateTime),
                                                    0,
                                                    0) ;
    end;

 // расчет времени во сколько должен выехать исполнитель на объект что бы добраться к тому времени что указали в значении Интервала С
                // время проезда бригад до объекта endeliverytimeplan
                  TempENDeliveryTimePlan :=  HTTPRIOENDeliveryTimePlan as ENDeliveryTimePlanControllerSoapPort;
                  TempENDeliveryTimePlanFilter := ENDeliveryTimePlanFilter.Create;
                  SetNullIntProps(TempENDeliveryTimePlanFilter);
                  SetNullXSProps(TempENDeliveryTimePlanFilter);

                  TempENDeliveryTimePlanFilter.planWorkRef := ENPlanWorkRef.Create;
                  TempENDeliveryTimePlanFilter.planWorkRef.code := planCode;
                  ENDeliveryTimePlanList := TempENDeliveryTimePlan.getScrollableFilteredList(TempENDeliveryTimePlanFilter,0,-1);
                  if High(ENDeliveryTimePlanList.list) > -1 then
                  TotHor := (StrToFloat(ENDeliveryTimePlanList.list[0].deliveryTimePlan.DecimalString) / 2 ) /24;
                    if (TotHor - Trunc(TotHor)) > 0.9999 then
                        TotHor := Round(TotHor);
                  temptime :=  EncodeDateTime( YearOf(edtReservedTimeStart.DateTime) ,
                                                    MonthOf(edtReservedTimeStart.DateTime) ,
                                                    DayOf(edtReservedTimeStart.DateTime) ,
                                                    HourOf(edtReservedTimeStart.DateTime) ,
                                                    MinuteOf(edtReservedTimeStart.DateTime),
                                                    0,
                                                    0) ;
                  temptime :=  temptime + TotHor;
                  temptime :=  EncodeDateTime( YearOf(temptime) ,
                                                    MonthOf(temptime) ,
                                                    DayOf(temptime) ,
                                                    HourOf(temptime) ,
                                                    MinuteOf(temptime),
                                                    0,
                                                    0) ;
                 edtDeliveryTimeTo.DateTime :=   IncMinute(edtReservedTimeStart.DateTime , - tempDeliveryOneWay);
                 // Y   edtDeliveryTimeTo.DateTime :=  IncMinute( edtReservedTimeStart.DateTime , -MinutesBetween(temptime , edtReservedTimeStart.DateTime));

                  edtDeliveryTimeTo.DateTime := EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(edtDeliveryTimeTo.DateTime) ,
                                                    MinuteOf(edtDeliveryTimeTo.DateTime),
                                                    0,
                                                    0) ;
               //   ShowMessage( DateTimeToStr(edtDeliveryTimeTo.DateTime) + ' ' + DateTimeToStr(edtReservedTimeStart.DateTime));
                 //- edtDeliveryTimeTo.DateTime := IncMinute( edtReservedTimeStart.DateTime , -MinutesBetween(edtDeliveryTimeTo.DateTime , edtReservedTimeStart.DateTime));


                //-  ShowMessage( DateTimeToStr(edtDeliveryTimeTo.DateTime) );
   // если то время во сколько должен выехать исполнитель меньше времени beginTimeWork
   if edtDeliveryTimeTo.DateTime <  beginTimeWork then
   begin
        Application.MessageBox(PChar('Час виїзду виконавця на об`єкт не повинен бути менше ніж ' + FormatDateTime('t', beginTimeWork) + ' . Змінюйте Інтервал часу "З" !!!'),PChar('Внимание!'), MB_ICONWARNING);
        edtDeliveryTimeTo.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0 ,
                                                    0,
                                                    0,
                                                    0) ;
        edtReservedTimeFinal.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0 ,
                                                    0,
                                                    0,
                                                    0) ;
       edtDeliveryTimeFrom.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0 ,
                                                    0,
                                                    0,
                                                    0) ;
        Exit;
   end;
    // если время выезда находится в периоде обеда
   if ((edtDeliveryTimeTo.DateTime >  startLunch) and ( edtDeliveryTimeTo.DateTime <  finalLunch )) then
   begin
        Application.MessageBox(PChar('Час виїзду виконавця на об`єкт не може бути в межах часу обідньої перерви !!!'),PChar('Внимание!'), MB_ICONWARNING);
        edtReservedTimeFinal.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0 ,
                                                    0,
                                                    0,
                                                    0) ;
       edtDeliveryTimeTo.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(edtReservedTimeStart.datetime) ,
                                                    MinuteOf(edtReservedTimeStart.datetime) ,
                                                    0,
                                                    0) ;
        edtReservedTimeStart.SetFocus;
        Exit;
   end;



   // расчет времени возвращения исполнителя с объекта
   /////  if ((HourOf(edtReservedTimeFinal.DateTime)  <> 0 ) and ( MinuteOf(edtReservedTimeFinal.DateTime) <> 0 )) then // ЗАЧЕМ ЭТО??? А если тут, например, 11:00?
   /////  begin
         edtDeliveryTimeFrom.DateTime :=  TimeOf( edtReservedTimeFinal.DateTime) +
                               ( StrToFloat(ENDeliveryTimePlanList.list[0].deliveryTimePlan.DecimalString) / 2 ) /24;
         // год месячц день ставим корректным
         edtDeliveryTimeFrom.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(edtDeliveryTimeFrom.DateTime) ,
                                                    MinuteOf(edtDeliveryTimeFrom.DateTime),
                                                    0,
                                                    0) ;
   /////  end;

    // если работы такие что ехать к заказчику не нада тогда время выезда = НАЧАЛО ИНТЕРВАЛА  прибытия исполнителя а время возвращения = конец интервала по выполнению работ.
     if not isVisitClient then
      begin
        edtDeliveryTimeTo.DateTime := EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(edtReservedTimeStart.DateTime) ,
                                                    MinuteOf(edtReservedTimeStart.DateTime),
                                                    0,
                                                    0) ;
        edtDeliveryTimeTo.Checked:=False;

        edtDeliveryTimeFrom.DateTime := EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(edtReservedTimeFinal.DateTime) ,
                                                    MinuteOf(edtReservedTimeFinal.DateTime),
                                                    0,
                                                    0) ;
        edtDeliveryTimeFrom.Checked:=False;
        DisableControls([edtDeliveryTimeTo,edtDeliveryTimeFrom , lblDeliveryTimeTo , lblDeliveryTimeFrom]);
      end;

      // проверим что бы время выполнения с учетом доставки  на текущем договоре не пересеклось с временами бригад которые задействованы на других объектах
       if  checkOtherTimeLine = false then
        begin
          Application.MessageBox(PChar('На цей час бригада задіяна на іншому об`єкті !!!'),PChar('Внимание!'), MB_ICONWARNING);
          exit;
        end;


 end;
 // перерисуем временные интервалы
  RenderPlanner;
end;

procedure TfrmENServicesCalculationEdit.edtReservedDateExit(
  Sender: TObject);
begin
 // inherited;
   RenderPlanner;
end;

function TfrmENServicesCalculationEdit.checkOtherTimeLine():Boolean;
var
    TempTKVirtualBrigade: TKVirtualBrigadeControllerSoapPort;
    TempTKVirtualBrigadeFilter: TKVirtualBrigadeFilter;
    vi: Integer;
    TKVirtualBrigadeList: TKVirtualBrigadeShortList;
    LastCountBrigade : Integer;

    tempENTimeLine: ENTimeLineControllerSoapPort;
    tl: Integer;
    ENTimeLineList: ENTimeLineShortList;
    tempENTimeLineFilter : ENTimeLineFilter;
    i , codeServicesObject : integer;
    codeStrVirtualBrigade : string;
    stateVirtualBrig : Boolean;

    timeLineStart : TDateTime;
    timeLineFinal : TDateTime;

    TempENServicesObject: ENServicesObjectControllerSoapPort;
    servicesObj: ENServicesObject;
    servicesObjFilter: ENServicesObjectFilter;
    servicesObjList: ENServicesObjectShortList;

    retunState : Boolean;
begin
        retunState := True;
         if ENServicesObjectObj.code <> 0 then
            codeServicesObject := ENServicesObjectObj.code
         else
         // если код сервис 0 то поищем по фильтру
         begin
             TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
              servicesObjFilter := ENServicesObjectFilter.Create;
              SetNullIntProps(servicesObjFilter);
              SetNullXSProps(servicesObjFilter);
              servicesObjFilter.conditionSQL := ' ENSERVICESOBJECT.CODE in ( select so.code  from enservicesobject so , enplanwork p  ' +
                            ' where so.elementcode = p.elementrefcode ' +
                            '   and p.kindcode = 5 ' +
                            '   and p.code = ' + IntToStr(planCode)  + ')';

              servicesObjList := TempENServicesObject.getEasyShortList(servicesObjFilter, 0, -1);
              if servicesObjList.totalCount > 0 then
                 codeServicesObject := servicesObjList.list[0].code;
         end;
  // определяем список выбраных бригад
   codeStrVirtualBrigade := '';
   if edtReservedDate.checked then
        begin

          For i := 0 to sgBrigadeInDepartment.RowCount do
           begin
              stateVirtualBrig := False;
              sgBrigadeInDepartment.GetCheckBoxState(1, i+1,stateVirtualBrig);
             if (( sgBrigadeInDepartment.Cells[0,i+1]  <> '' )  and  ( stateVirtualBrig ))then    
              if codeStrVirtualBrigade <> '' then
               codeStrVirtualBrigade := codeStrVirtualBrigade + ' , ' +   sgBrigadeInDepartment.Cells[0,i+1]
              else
              codeStrVirtualBrigade := sgBrigadeInDepartment.Cells[0,i+1] ;
           end;
    end;

     if codeStrVirtualBrigade <> '' then
     begin


      tempENTimeLineFilter := ENTimeLineFilter.Create;
      SetNullIntProps(tempENTimeLineFilter);
      SetNullXSProps(tempENTimeLineFilter);

      tempENTimeLineFilter.conditionSQL := ' ENSERVICESOBJECT.CODE <> ' + IntToStr( codeServicesObject{ENServicesObjectObj.code})  + ' and  ENTIMELINE.VIRTUALBRIGADEREFCODE in (' + codeStrVirtualBrigade + ')' ;
      tempENTimeLineFilter.dateGen := TXSDate.Create;
      tempENTimeLineFilter.dateGen.XSToNative(GetXSDate(edtReservedDate.DateTime));
      TempENTimeLine :=  HTTPRIOENTimeLine as ENTimeLineControllerSoapPort;
      ENTimeLineList := TempENTimeLine.getScrollableFilteredList(tempENTimeLineFilter,0,-1);
      if High(ENTimeLineList.list) > -1 then
      for tl:=0 to High(ENTimeLineList.list) do
        begin
           // определим со строки тайм лайн начало и конец периода занятости бригады
           // период начала =  время доставки на объект , если нет доставки тогда период начала = время начала выполнения работ
           // период окончания = время возращения с объекта , если нету времени возврата тогда период окончания = время окончания работ


           timeLineStart := EncodeDateTime(ENTimeLineList.list[tl].timeMoveToObject.Year ,
                                           ENTimeLineList.list[tl].timeMoveToObject.Month ,
                                           ENTimeLineList.list[tl].timeMoveToObject.Day ,
                                           ENTimeLineList.list[tl].timeMoveToObject.Hour ,
                                           ENTimeLineList.list[tl].timeMoveToObject.Minute ,
                                           0 ,
                                           0 );
          timeLineFinal := EncodeDateTime(ENTimeLineList.list[tl].timeMoveOfObject.Year ,
                                           ENTimeLineList.list[tl].timeMoveOfObject.Month ,
                                           ENTimeLineList.list[tl].timeMoveOfObject.Day ,
                                           ENTimeLineList.list[tl].timeMoveOfObject.Hour ,
                                           ENTimeLineList.list[tl].timeMoveOfObject.Minute ,
                                           0 ,
                                           0 );
           if edtDeliveryTimeTo.DateTime = timeLineStart then
          begin
            // Application.MessageBox(PChar('На цей час бригада задіяна на іншому об`єкті !!!'),PChar('Внимание!'), MB_ICONWARNING);
            retunState:= False;
           end;

           if ((edtDeliveryTimeTo.DateTime > timeLineStart ) and (edtDeliveryTimeTo.DateTime < timeLineFinal )) then
          begin
            // Application.MessageBox(PChar('На цей час бригада задіяна на іншому об`єкті !!!'),PChar('Внимание!'), MB_ICONWARNING);
            retunState:= False;
           end;

           if ((edtDeliveryTimeFrom.DateTime > timeLineStart ) and (edtDeliveryTimeFrom.DateTime < timeLineFinal )) then
           begin
            // Application.MessageBox(PChar('На цей час бригада задіяна на іншому об`єкті !!!'),PChar('Внимание!'), MB_ICONWARNING);
            retunState:= False;
           end;

           if (( edtDeliveryTimeTo.DateTime < timeLineStart ) and   (edtDeliveryTimeFrom.DateTime > timeLineFinal )) then
           begin
            // Application.MessageBox(PChar('На цей час бригада задіяна на іншому об`єкті !!!'),PChar('Внимание!'), MB_ICONWARNING);
            retunState:= False;
           end;

        end;

    end;
    result := retunState;
end;


procedure TfrmENServicesCalculationEdit.edtReservedDateChange(
  Sender: TObject);
begin
  inherited;
     edtReservedTimeStartExit(self);
end;

procedure TfrmENServicesCalculationEdit.btnRemoveExecutedDateClick(
  Sender: TObject);
var TempENTimeLine: ENTimeLineControllerSoapPort;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити дату / час виконання робіт для бригад ?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;

   TempENTimeLine := HTTPRIOENTimeLine as ENTimeLineControllerSoapPort;
   TempENTimeLine.removeTimeLine(ENServicesObjectObj);

   Application.MessageBox(PChar('Видалено!'), PChar('Повідомлення'), MB_ICONINFORMATION);

   updateRezervedView;

   // сбрасываем значения времени кроме начала выполнения в 00 мин 00 сек.
       edtDeliveryTimeTo.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0 ,
                                                    0,
                                                    0,
                                                    0) ;
        edtReservedTimeFinal.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0 ,
                                                    0,
                                                    0,
                                                    0) ;
       edtDeliveryTimeFrom.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    0 ,
                                                    0,
                                                    0,
                                                    0) ;

end;


procedure TfrmENServicesCalculationEdit.btnSaveENTransferDateClick(Sender: TObject);
var
  TempENTransferDate2ServicesObject : ENTransferDate2ServicesObjectControllerSoapPort;
begin
  inherited;
  TempENTransferDate2ServicesObject := HTTPRIOENTransferDate2ServicesObject as ENTransferDate2ServicesObjectControllerSoapPort;

  if (ENTransferDate2ServicesObjectObj = nil) then
  begin
    ENTransferDate2ServicesObjectObj := ENTransferDate2ServicesObject.Create;
    ENTransferDate2ServicesObjectObj.code := LOW_INT;
    if ENTransferDate2ServicesObjectObj.servicesObjectRef = nil then
      ENTransferDate2ServicesObjectObj.servicesObjectRef := ENServicesObjectRef.Create();
    ENTransferDate2ServicesObjectObj.servicesObjectRef.code := ENServicesObjectObj.code;
  end;

  if edtissueDate.checked then
  begin
   if ENTransferDate2ServicesObjectObj.issueDate = nil then
      ENTransferDate2ServicesObjectObj.issueDate := TXSDateTime.Create;
   ENTransferDate2ServicesObjectObj.issueDate.XSToNative(GetXSDate(edtissueDate.DateTime));
  end
  else
   ENTransferDate2ServicesObjectObj.issueDate := nil;

  if edtreturnDate.checked then
  begin
   if ENTransferDate2ServicesObjectObj.returnDate = nil then
      ENTransferDate2ServicesObjectObj.returnDate := TXSDateTime.Create;
   ENTransferDate2ServicesObjectObj.returnDate.XSToNative(GetXSDate(edtreturnDate.DateTime));
  end
  else
   ENTransferDate2ServicesObjectObj.returnDate := nil;


  if edtdateEdit.checked then
  begin
   if ENTransferDate2ServicesObjectObj.dateEdit = nil then
      ENTransferDate2ServicesObjectObj.dateEdit := TXSDateTime.Create;
   ENTransferDate2ServicesObjectObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
  end
  else
   ENTransferDate2ServicesObjectObj.dateEdit := nil;

  TempENTransferDate2ServicesObject.save(ENTransferDate2ServicesObjectObj);
end;


procedure TfrmENServicesCalculationEdit.btnSaveWarrantClick(Sender: TObject);
var
  TempENWarrant: ENWarrantControllerSoapPort;
begin
  inherited;
  if ENServicesObjectObj = nil then Exit;
  if ENServicesObjectObj.code = Low(Integer) then Exit;
  if ENServicesObjectObj.warrantRef = nil then Exit;
  if ENServicesObjectObj.warrantRef.code = Low(Integer) then Exit;

  TempENWarrant := HTTPRIOENWarrant as ENWarrantControllerSoapPort;
  TempENWarrant.changeWarrant(ENServicesObjectObj.code, ENServicesObjectObj.warrantRef.code);

  Application.MessageBox(PChar('Довіреність збережена'), PChar('Повідомлення'), MB_ICONINFORMATION);
end;


procedure TfrmENServicesCalculationEdit.btnSetBuhStatusClick(Sender: TObject);
 var
  TempENServicesObject : ENServicesObjectControllerSoapPort;
begin
  inherited;
    if Application.MessageBox(PChar('Ви дійсно бажаєте змінити статус на проведений?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=IDYES then begin
        TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
        TempENServicesObject.changeBuhStatusToClosedByBuh(ENServicesObjectObj.code);
        ENServicesObjectObj :=  TempENServicesObject.getObject(ENServicesObjectObj.code);
        Application.MessageBox(PChar('Статус на проведений змінено!'), PChar('Повідомлення'), MB_ICONINFORMATION);
        DialogState := dsView;
        Self.FormShow(Sender);
    end;
end;

procedure TfrmENServicesCalculationEdit.btnValidateProfitabilityClick(Sender: TObject);
var
  TempENServicesObject : ENServicesObjectControllerSoapPort;
  notFinishWorks, forcedRecalcServicesFact, validateProfitability : Boolean;
  argNames, args: ArrayOfString;
  reportName: String;
  Licensed : Integer;
  TKClassificationTypeList: TKClassificationTypeShortList;
  TempTKClassificationType: TKClassificationTypeControllerSoapPort;
  TKClassificationTypef: TKClassificationTypeFilter;
  TempENPlanWork2ClassificationType : ENPlanWork2ClassificationTypeControllerSoapPort;
  plan2ctFilter : ENPlanWork2ClassificationTypeFilter;
  plan2ctList : ENPlanWork2ClassificationTypeShortList;

begin
  inherited;
  // проверка вид работ (лиценз нелиценз транспорт)


     TempTKClassificationType :=  HTTPRIOTKClassificationType as TKClassificationTypeControllerSoapPort;
   TKClassificationTypeF := TKClassificationTypeFilter.Create;
   SetNullIntProps(TKClassificationTypeF);
   SetNullXSProps(TKClassificationTypeF);
   TKClassificationTypeF.conditionSQL := ' tk.code in ( ' +
                                         ' Select p2c.classificationtyperfcd from enservicesobject so , enplanwork p, enplanwork2classfctntp p2c ' +
                                         '  where so.code = ' + IntToStr(ENServicesObjectObj.code) +
                                         '  and so.elementcode = p.elementrefcode ' +
                                         '  and p.kindcode = 5 ' +
                                         '  and p2c.planrefcode = p.code ) ' ;
   TKClassificationTypeList := TempTKClassificationType.getScrollableFilteredList(TKClassificationTypeF,0,-1);
   Licensed := TKClassificationTypeList.list[0].isnotlicensedactivity;

   // по услугам на транспорт формируется без пересчета акта
 if Licensed <> ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT then
  begin
     // SUPP-74378  if (ENServicesObjectObj.calcTypeRef.code <> ENSERVICESOBJECT_CALCTYPE_BY_FACT) then Exit;
      if ENServicesObjectObj.contractStatusRef = nil then Exit;
      if ENServicesObjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
        raise Exception.Create('Цей договір скасовано!');
  end;


  // проверить статус акта и договора....
  // если акт на подписании или договор уже в статусе "Работи выполненны" - вызываем сразу отчет...

  // делаем расчет без изменения статуса договора и акта
  notFinishWorks := True;
  forcedRecalcServicesFact := False;
  validateProfitability := False;

  if (
     (ENServicesObjectObj.statusRef.code <>  ENSERVICESOBJECT_FINSTATUS_CLOSED)
     and (ENServicesObjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_COMPLETED)
     and (ENServicesObjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_TERMINATED)
     and (ENServicesObjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_DISCLAIMER)
     and (ENServicesObjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_CLOSE)
     ) then
  begin
   TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
   TempENServicesObject.finishWorks(ENServicesObjectObj.code, notFinishWorks, forcedRecalcServicesFact, validateProfitability);
  end;

  // вызываем отчет tezt
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'plancode';
  args[0] := IntToStr(DMReports.getPlanCodeForCalculationByElement(ENServicesObjectObj.element.code));

      if Licensed <> ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT then
       reportName := 'analysRentabServices/analysRentabServices'
      else
       reportName := 'analysRentabServices/analysRentabServicesTransport';

      TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;
      plan2ctFilter := ENPlanWork2ClassificationTypeFilter.Create;
      SetNullIntProps(plan2ctFilter);
      SetNullXSProps(plan2ctFilter);
      plan2ctFilter.conditionSQL := ' enplanwork2classfctntp.planrefcode = ' + args[0];

      plan2ctList := TempENPlanWork2ClassificationType.getScrollableFilteredList(plan2ctFilter, 0, -1);

      if (plan2ctList.totalCount > 0) then
        begin
           if ((plan2ctList.list[0].calcKindRefCode = ENConsts.TKCALCKIND_NEW ) or
               (plan2ctList.list[0].calcKindRefCode = ENConsts.TKCALCKIND_NEW2 )
              ) then
          if Licensed <> ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT  then begin
            reportName := 'analysRentabServices/analysRentabServicesForNew';
          end;
        end;



  makeReport(reportName, argNames, args, 'xls');

end;


procedure TfrmENServicesCalculationEdit.btnFindTimeClick(Sender: TObject);
var
  TempTKVirtualBrigade: TKVirtualBrigadeControllerSoapPort;
    TempTKVirtualBrigadeFilter: TKVirtualBrigadeFilter;
    vi: Integer;
    TKVirtualBrigadeList: TKVirtualBrigadeShortList;
    LastCountBrigade : Integer;

    tempENTimeLine: ENTimeLineControllerSoapPort;
    tl: Integer;
    ENTimeLineList: ENTimeLineShortList;
    tempENTimeLineFilter : ENTimeLineFilter;
    i , codeServicesObject : integer;
    codeStrVirtualBrigade : string;
    stateVirtualBrig : Boolean;

    timeLineStart : TDateTime;
    timeLineFinal : TDateTime;

    TempENServicesObject: ENServicesObjectControllerSoapPort;
    servicesObj: ENServicesObject;
    servicesObjFilter: ENServicesObjectFilter;
    servicesObjList: ENServicesObjectShortList;

    TempENDeliveryTimePlan: ENDeliveryTimePlanControllerSoapPort;
    ENDeliveryTimePlanList: ENDeliveryTimePlanShortList;
    TempENDeliveryTimePlanFilter : ENDeliveryTimePlanFilter;
    SumTimeWork : Double;
    beginTimeWork : TDateTime; // день время с которого начинается обработка услуг на сторону
    startLunch : TDateTime;    // дата время начала обеда
    finalLunch : TDateTime;    // дата время окончания обеда
    finalTimeWork : TDateTime; // день время по которое разрешано резервировать время для виконання послуг

    TempReservedTimeStart , TempReservedTimeFinal , TempDeliveryTimeTo , TempDeliveryTimeFrom : TDateTime;

    TLList: ENTimeLineShortList;
    TLFilter : ENTimeLineFilter;
    TimeFound : Boolean; // время определено да/нет
begin

  TimeFound := False;
  if ENServicesObjectObj.code <> 0 then
      codeServicesObject := ENServicesObjectObj.code
  else
  // если код сервис 0 то поищем по фильтру
  begin
     TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
      servicesObjFilter := ENServicesObjectFilter.Create;
      SetNullIntProps(servicesObjFilter);
      SetNullXSProps(servicesObjFilter);
      servicesObjFilter.conditionSQL := ' ENSERVICESOBJECT.CODE in ( select so.code  from enservicesobject so , enplanwork p  ' +
                    ' where so.elementcode = p.elementrefcode ' +
                    '   and p.kindcode = 5 ' +
                    '   and p.code = ' + IntToStr(planCode)  + ')';

      servicesObjList := TempENServicesObject.getEasyShortList(servicesObjFilter, 0, -1);
      if servicesObjList.totalCount > 0 then
         codeServicesObject := servicesObjList.list[0].code;
  end;
  // определяем список выбраных бригад
  codeStrVirtualBrigade := '';
  if edtReservedDate.checked then
    begin

      For i := 0 to sgBrigadeInDepartment.RowCount do
       begin
          stateVirtualBrig := False;
          sgBrigadeInDepartment.GetCheckBoxState(1, i+1,stateVirtualBrig);
         if (( sgBrigadeInDepartment.Cells[0,i+1]  <> '' )  and  ( stateVirtualBrig ))then
          if codeStrVirtualBrigade <> '' then
           codeStrVirtualBrigade := codeStrVirtualBrigade + ' , ' +   sgBrigadeInDepartment.Cells[0,i+1]
          else
          codeStrVirtualBrigade := sgBrigadeInDepartment.Cells[0,i+1] ;
       end;
  end;

          // ПРОВЕРИМ ЕСЛИ ПОД ЭТОТ ДОГОВОР УЖЕ ВРЕМЯ ОПРЕДЕЛЕНО ТОГДА НЕ ИЩЕМ ВРЕМЯ ПУСТЬ ВЫНОСЯТ СПЕРВА ИЛИ МЕНЯЮТ ВРУЧНУЮ ВРЕМЯ
            TLFilter:= ENTimeLineFilter.Create;
            SetNullIntProps(TLFilter);
            SetNullXSProps(TLFilter);
            TLFilter.servicesObjectRef := ENServicesObject.Create;
            TLFilter.servicesObjectRef.code := codeServicesObject;

            TempENTimeLine :=  HTTPRIOENTimeLine as ENTimeLineControllerSoapPort;
            TLList := TempENTimeLine.getScrollableFilteredList(TLFilter,0,-1);
            // НЕ НАШЛИ ТАЙМ ЛАЙНЫ КОТОРЫЕ ПЕРЕСЕКАЮТСЯ С ВРЕМЕНЕМ КОТОРОЕ ХОТИМ ВСТАВИТЬ ЗНАЧИТ ПОДСТАВЛЯЕМ В ДАТА ЕДИТЫ ЗНАЧЕНИЯ ВРЕМЕНИ КОТОРЫЕ
            if  High(TLList.list) > -1 then
            begin
              Application.MessageBox(PChar('По договору вже зарезервовано дата \ час виконання робіт. Видаліть дату \ час виконання робіт або змінюйте вручну  !!!'),PChar('Внимание!'), MB_ICONWARNING);
              Exit;
            end;

 // по выбраным бригадам проверим на выбранный день их загруженность и ищем в какой период поставить выполения данных работ.
 if codeStrVirtualBrigade <> '' then
 begin
  // время проезда бригад до объекта endeliverytimeplan
    TempENDeliveryTimePlan :=  HTTPRIOENDeliveryTimePlan as ENDeliveryTimePlanControllerSoapPort;
    TempENDeliveryTimePlanFilter := ENDeliveryTimePlanFilter.Create;
    SetNullIntProps(TempENDeliveryTimePlanFilter);
    SetNullXSProps(TempENDeliveryTimePlanFilter);

    TempENDeliveryTimePlanFilter.planWorkRef := ENPlanWorkRef.Create;
    TempENDeliveryTimePlanFilter.planWorkRef.code := planCode;
    ENDeliveryTimePlanList := TempENDeliveryTimePlan.getScrollableFilteredList(TempENDeliveryTimePlanFilter,0,-1);
    // сумарное время(продолжительность) выполнения работ по калькуляции
  SumTimeWork := getSumTimeWorkForCalculation(planCode);
    //
    // ВРЕМЯ В ФОРМАТЕ DATETIME ОБЕДА
    startLunch:=   EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(StrToDateTime(TIME_LUNCH_START)) ,
                                                    MinuteOf(StrToDateTime(TIME_LUNCH_START)),
                                                    0,
                                                    0) ;
   finalLunch:=   EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(StrToDateTime(TIME_LUNCH_FINAL)) ,
                                                    MinuteOf(StrToDateTime(TIME_LUNCH_FINAL)),
                                                    0,
                                                    0) ;
   if DayOfWeek(edtReservedDate.DateTime)  = 6 then // пятница
         finalTimeWork:=   EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                          MonthOf(edtReservedDate.datetime) ,
                                                          DayOf(edtReservedDate.datetime) ,
                                                          HourOf(StrToDateTime(TIME_END_FRIDAY_DAY)) ,
                                                          MinuteOf(StrToDateTime(TIME_END_FRIDAY_DAY)),
                                                          0,
                                                          0) ;
   if DayOfWeek(edtReservedDate.DateTime)  <> 6 then // не пятница
         finalTimeWork:=   EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                          MonthOf(edtReservedDate.datetime) ,
                                                          DayOf(edtReservedDate.datetime) ,
                                                          HourOf(StrToDateTime(TIME_END_WORKING_DAY)) ,
                                                          MinuteOf(StrToDateTime(TIME_END_WORKING_DAY)),
                                                          0,
                                                          0) ;
  tempENTimeLineFilter := ENTimeLineFilter.Create;
  SetNullIntProps(tempENTimeLineFilter);
  SetNullXSProps(tempENTimeLineFilter);
  tempENTimeLineFilter.conditionSQL := ' ENTIMELINE.VIRTUALBRIGADEREFCODE in (' + codeStrVirtualBrigade + ')' ;
  tempENTimeLineFilter.dateGen := TXSDate.Create;
  tempENTimeLineFilter.dateGen.XSToNative(GetXSDate(edtReservedDate.DateTime));
  tempENTimeLineFilter.orderBySQL := 'timestart';

  TempENTimeLine :=  HTTPRIOENTimeLine as ENTimeLineControllerSoapPort;
  ENTimeLineList := TempENTimeLine.getScrollableFilteredList(tempENTimeLineFilter,0,-1);
  If High(ENTimeLineList.list) > -1 then
   begin
     // >> ДО ЦИКЛА  ПРОВЕРИМ МОЖНО ЛИ ВСТАВИТЬ ВРЕМЯ ДО ПЕРВОГО ТАЙМ ЛАЙН В ЭТОТ ДЕНЬ (типа с начала дня)
        begin
          // ПРЕДПОЛАГАЕМОЕ ВРЕМЯ НАЧАЛА ВЫЕЗДА БРИГАДЫ ИЛИ НАЧАЛА ВЫПОЛНЕНИЯ РАБОТ
          TempDeliveryTimeTo:= EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(StrToDateTime(MIN_TIME_FOR_REZERVED_CALCULATION)) ,
                                                    MinuteOf(StrToDateTime(MIN_TIME_FOR_REZERVED_CALCULATION)),
                                                    0,
                                                    0) ;
          TempReservedTimeStart:= TempDeliveryTimeTo + ( StrToFloat(ENDeliveryTimePlanList.list[0].deliveryTimePlan.DecimalString) / 2 ) /24;
          TempReservedTimeStart:= EncodeDateTime( YearOf(TempReservedTimeStart) ,
                                                    MonthOf(TempReservedTimeStart) ,
                                                    DayOf(TempReservedTimeStart) ,
                                                    HourOf(TempReservedTimeStart) ,
                                                    MinuteOf(TempReservedTimeStart),
                                                    0,
                                                    0) ;

          TempReservedTimeFinal:= TempReservedTimeStart + SumTimeWork / 24 ;
          TempReservedTimeFinal:= EncodeDateTime( YearOf(TempReservedTimeFinal) ,
                                                    MonthOf(TempReservedTimeFinal) ,
                                                    DayOf(TempReservedTimeFinal) ,
                                                    HourOf(TempReservedTimeFinal) ,
                                                    MinuteOf(TempReservedTimeFinal),
                                                    0,
                                                    0) ;
          // если интервал ПО перекрывает время обеда то перенести часть времени на после обед
           if (( TempReservedTimeFinal >  startLunch ) and ( TempReservedTimeStart <  startLunch )) then
            begin
              TempReservedTimeFinal:=  finalLunch + (SumTimeWork / 24) - (startLunch - edtReservedTimeStart.DateTime);
              TempReservedTimeFinal:=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                            MonthOf(edtReservedDate.datetime) ,
                                                            DayOf(edtReservedDate.datetime) ,
                                                            HourOf(TempReservedTimeFinal) ,
                                                            MinuteOf(TempReservedTimeFinal),
                                                            0,
                                                            0) ;
            end;
          TempDeliveryTimeFrom :=  TempReservedTimeFinal + ( StrToFloat(ENDeliveryTimePlanList.list[0].deliveryTimePlan.DecimalString) / 2 ) /24;
          TempDeliveryTimeFrom :=  EncodeDateTime( YearOf(TempDeliveryTimeFrom) ,
                                                    MonthOf(TempDeliveryTimeFrom) ,
                                                    DayOf(TempDeliveryTimeFrom) ,
                                                    HourOf(TempDeliveryTimeFrom) ,
                                                    MinuteOf(TempDeliveryTimeFrom),
                                                    0,
                                                    0) ;
         //  ПРОВЕРИТЬ ЧТО БЫ ВРЕМЯ ВОЗВРАЩЕНИЯ С ОБЪЕКТА КОТОРОЕ ТОКА ШТО ПОСЧИТАЛИ НЕ НАЕЗЖАЛО НА КАКОЙ ТО СОСЕДНИЙ ТАЙМ ЛАЙН В ЭТОТ ДЕНЬ если не наезжает тогда ставим в едиты на форме время посчитанное иначе ниче не делаем.

            TLFilter:= ENTimeLineFilter.Create;
            SetNullIntProps(TLFilter);
            SetNullXSProps(TLFilter);
            TLFilter.conditionSQL := ' ENTIMELINE.VIRTUALBRIGADEREFCODE in (' + codeStrVirtualBrigade + ')' +
                                    ' AND ( to_timestamp( ' + '''' +DateTimeToStr( TempDeliveryTimeFrom ) + ''''+','+ ''''+ 'DD.MM.YYYY HH24:MI:SS'+ '''' + ') between ENTIMELINE.TIMEMOVETOOBJECT  and  ENTIMELINE.timemoveofobject ' +
                                    ' or to_timestamp(' + '''' + DateTimeToStr( TempDeliveryTimeTo ) + '''' + ',' + '''' + 'DD.MM.YYYY HH24:MI:SS' + '''' + ') between ENTIMELINE.TIMEMOVETOOBJECT  and  ENTIMELINE.timemoveofobject ' +
                                    ' or ( to_timestamp(' + '''' + DateTimeToStr( TempDeliveryTimeFrom ) + '''' + ',' + '''' + 'DD.MM.YYYY HH24:MI:SS' + '''' + ') <= ENTIMELINE.TIMEMOVETOOBJECT and to_timestamp(' + '''' + DateTimeToStr( TempDeliveryTimeTo ) + '''' + ',' + '''' + 'DD.MM.YYYY HH24:MI:SS'+ '''' + ')  >=  ENTIMELINE.timemoveofobject ) ' +
                                    ' or ( ENTIMELINE.TIMEMOVETOOBJECT between to_timestamp(' + '''' + DateTimeToStr( TempDeliveryTimeTo ) + '''' + ',' + '''' + 'DD.MM.YYYY HH24:MI:SS' + '''' + ') and to_timestamp( ' + '''' + DateTimeToStr( TempDeliveryTimeFrom ) + '''' + ',' + '''' + 'DD.MM.YYYY HH24:MI:SS' + '''' + ') )' +
                                    ' or ( ENTIMELINE.timemoveofobject between to_timestamp(' + '''' + DateTimeToStr( TempDeliveryTimeTo ) + '''' + ',' + '''' + 'DD.MM.YYYY HH24:MI:SS' + '''' + ') and to_timestamp( ' + '''' + DateTimeToStr( TempDeliveryTimeFrom ) + '''' + ',' + '''' + 'DD.MM.YYYY HH24:MI:SS' + '''' + ') )' +
                                    ')';
            TLFilter.dateGen := TXSDate.Create;
            TLFilter.dateGen.XSToNative(GetXSDate(edtReservedDate.DateTime));
            TLFilter.orderBySQL := 'timestart';

            TempENTimeLine :=  HTTPRIOENTimeLine as ENTimeLineControllerSoapPort;
            TLList := TempENTimeLine.getScrollableFilteredList(TLFilter,0,-1);
            // НЕ НАШЛИ ТАЙМ ЛАЙНЫ КОТОРЫЕ ПЕРЕСЕКАЮТСЯ С ВРЕМЕНЕМ КОТОРОЕ ХОТИМ ВСТАВИТЬ ЗНАЧИТ ПОДСТАВЛЯЕМ В ДАТА ЕДИТЫ ЗНАЧЕНИЯ ВРЕМЕНИ КОТОРЫЕ
            // ОПРЕДЕДЛИЛИ ВЫШЕ
            if  High(TLList.list) = -1 then
            begin
              edtReservedTimeStart.DateTime := TempReservedTimeStart;
              edtReservedTimeFinal.DateTime := TempReservedTimeFinal;
              edtDeliveryTimeTo.DateTime :=  TempDeliveryTimeTo;
              edtDeliveryTimeFrom.DateTime := TempDeliveryTimeFrom;
              TimeFound := True;
            end;

        end;
      //  << КОНЕЦ ПРОВЕРКИ С НАЧАЛА ДНЯ
      // ЕСЛИ ВНАЧАЛЕ ДНЯ НЕ ПОЛУЧИЛОСЬ ВТУЛИТЬ ВРЕМЯ ТОГДА ПЫТАЕМСЯ ВТУЛИТЬ ПОСЛЕ КАКОГО ТО ТАЙМ ЛАЙНА НА ЭТОТ ДЕНЬ
    if TimeFound = False then
    for tl:=0 to High(ENTimeLineList.list) do
      begin
         /// ПРЕДПОЛАГАЕМОЕ ВРЕМЯ ВЫЕЗДА НА ОБЪЕКТ ПО ТЕКУЩЕМУ ДОГОВОРУ = ВРЕМЯ ВОЗВРАЩЕНИЯ БРИГАДЫ С ПРЕДЫДУЩЕГО ОБЪЕКТА + 1 МИНУТА
         TempDeliveryTimeTo  := EncodeDateTime(ENTimeLineList.list[0].timeMoveOfObject.Year,
                                                                    ENTimeLineList.list[tl].timeMoveOfObject.Month,
                                                                    ENTimeLineList.list[tl].timeMoveOfObject.Day,
                                                                    ENTimeLineList.list[tl].timeMoveOfObject.Hour,
                                                                    ENTimeLineList.list[tl].timeMoveOfObject.Minute,
                                                                    0,
                                                                    0
                                                                    );
         TempDeliveryTimeTo := IncMinute(TempDeliveryTimeTo , 1);
         TempReservedTimeStart:= TempDeliveryTimeTo + ( StrToFloat(ENDeliveryTimePlanList.list[0].deliveryTimePlan.DecimalString) / 2 ) /24;
         TempReservedTimeStart:= EncodeDateTime( YearOf(TempReservedTimeStart) ,
                                                    MonthOf(TempReservedTimeStart) ,
                                                    DayOf(TempReservedTimeStart) ,
                                                    HourOf(TempReservedTimeStart) ,
                                                    MinuteOf(TempReservedTimeStart),
                                                    0,
                                                    0) ;
         TempReservedTimeFinal:= TempReservedTimeStart + SumTimeWork / 24 ;
         TempReservedTimeFinal:= EncodeDateTime( YearOf(TempReservedTimeFinal) ,
                                                    MonthOf(TempReservedTimeFinal) ,
                                                    DayOf(TempReservedTimeFinal) ,
                                                    HourOf(TempReservedTimeFinal) ,
                                                    MinuteOf(TempReservedTimeFinal),
                                                    0,
                                                    0) ;
          // если интервал ПО перекрывает время обеда то перенести часть времени на после обед
           if (( TempReservedTimeFinal >  startLunch ) and ( TempReservedTimeStart <  startLunch )) then
            begin
              TempReservedTimeFinal:=  finalLunch + (SumTimeWork / 24) - (startLunch - TempReservedTimeStart);
              TempReservedTimeFinal:=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                            MonthOf(edtReservedDate.datetime) ,
                                                            DayOf(edtReservedDate.datetime) ,
                                                            HourOf(TempReservedTimeFinal) ,
                                                            MinuteOf(TempReservedTimeFinal),
                                                            0,
                                                            0) ;
            end;
          TempDeliveryTimeFrom :=  TempReservedTimeFinal + ( StrToFloat(ENDeliveryTimePlanList.list[0].deliveryTimePlan.DecimalString) / 2 ) /24;
          TempDeliveryTimeFrom :=  EncodeDateTime( YearOf(TempDeliveryTimeFrom) ,
                                                    MonthOf(TempDeliveryTimeFrom) ,
                                                    DayOf(TempDeliveryTimeFrom) ,
                                                    HourOf(TempDeliveryTimeFrom) ,
                                                    MinuteOf(TempDeliveryTimeFrom),
                                                    0,
                                                    0) ;
//                 ShowMessage( DateTimeToStr(TempDeliveryTimeTo) + ' ' +
//                              DateTimeToStr(TempReservedTimeStart) + ' ' +
//                              DateTimeToStr(TempReservedTimeFinal) +  ' ' +
//                              DateTimeToStr(TempDeliveryTimeFrom)  );
           //  ПРОВЕРИТЬ ЧТО БЫ ВРЕМЯ ВОЗВРАЩЕНИЯ С ОБЪЕКТА КОТОРОЕ ТОКА ШТО ПОСЧИТАЛИ НЕ НАЕЗЖАЛО НА КАКОЙ ТО СОСЕДНИЙ ТАЙМ ЛАЙН В ЭТОТ ДЕНЬ если не наезжает тогда ставим в едиты на форме время посчитанное иначе ниче не делаем.

            TLFilter:= ENTimeLineFilter.Create;
            SetNullIntProps(TLFilter);
            SetNullXSProps(TLFilter);
            TLFilter.conditionSQL := ' ENTIMELINE.VIRTUALBRIGADEREFCODE in (' + codeStrVirtualBrigade + ')' +
                                    ' AND ( to_timestamp( ' + '''' +DateTimeToStr( TempDeliveryTimeFrom ) + ''''+','+ ''''+ 'DD.MM.YYYY HH24:MI:SS'+ '''' + ') between ENTIMELINE.TIMEMOVETOOBJECT  and  ENTIMELINE.timemoveofobject ' +
                                    ' or to_timestamp(' + '''' + DateTimeToStr( TempDeliveryTimeTo ) + '''' + ',' + '''' + 'DD.MM.YYYY HH24:MI:SS' + '''' + ') between ENTIMELINE.TIMEMOVETOOBJECT  and  ENTIMELINE.timemoveofobject ' +
                                    ' or ( to_timestamp(' + '''' + DateTimeToStr( TempDeliveryTimeFrom ) + '''' + ',' + '''' + 'DD.MM.YYYY HH24:MI:SS' + '''' + ') <= ENTIMELINE.TIMEMOVETOOBJECT and to_timestamp(' + '''' + DateTimeToStr( TempDeliveryTimeTo ) + '''' + ',' + '''' + 'DD.MM.YYYY HH24:MI:SS'+ '''' + ')  >=  ENTIMELINE.timemoveofobject ) ' +
                                    ' or ( ENTIMELINE.TIMEMOVETOOBJECT between to_timestamp(' + '''' + DateTimeToStr( TempDeliveryTimeTo ) + '''' + ',' + '''' + 'DD.MM.YYYY HH24:MI:SS' + '''' + ') and to_timestamp( ' + '''' + DateTimeToStr( TempDeliveryTimeFrom ) + '''' + ',' + '''' + 'DD.MM.YYYY HH24:MI:SS' + '''' + ') )' +
                                    ' or ( ENTIMELINE.timemoveofobject between to_timestamp(' + '''' + DateTimeToStr( TempDeliveryTimeTo ) + '''' + ',' + '''' + 'DD.MM.YYYY HH24:MI:SS' + '''' + ') and to_timestamp( ' + '''' + DateTimeToStr( TempDeliveryTimeFrom ) + '''' + ',' + '''' + 'DD.MM.YYYY HH24:MI:SS' + '''' + ') )' +
                                    ')';
            TLFilter.dateGen := TXSDate.Create;
            TLFilter.dateGen.XSToNative(GetXSDate(edtReservedDate.DateTime));
            TLFilter.orderBySQL := 'timestart';

            TempENTimeLine :=  HTTPRIOENTimeLine as ENTimeLineControllerSoapPort;
            TLList := TempENTimeLine.getScrollableFilteredList(TLFilter,0,-1);
            // НЕ НАШЛИ ТАЙМ ЛАЙНЫ КОТОРЫЕ ПЕРЕСЕКАЮТСЯ С ВРЕМЕНЕМ КОТОРОЕ ХОТИМ ВСТАВИТЬ ЗНАЧИТ ПОДСТАВЛЯЕМ В ДАТА ЕДИТЫ ЗНАЧЕНИЯ ВРЕМЕНИ КОТОРЫЕ

            // если интервал времени С больше чем  время по которое разрешано резервировать время для виконання послуг

          if TempReservedTimeStart <  finalTimeWork then
             if  High(TLList.list) = -1 then
            begin
              edtReservedTimeStart.DateTime := TempReservedTimeStart;
              edtReservedTimeFinal.DateTime := TempReservedTimeFinal;
              edtDeliveryTimeTo.DateTime :=  TempDeliveryTimeTo;
              edtDeliveryTimeFrom.DateTime := TempDeliveryTimeFrom;
              TimeFound := True;
              // edtReservedTimeStart.Checked:= False;
            end;

      end;
   end
  else
  // если по выбраным бригадам нет зарезервированого времени на дату тогда интервал исполнения
  // работ(учитывая доставку) предлагаем поставить в начало периода разрешенного для резервирования
  begin
     // время выезда бригад на объект ставим равную МИНИМАЛЬНОМУ ВРЕМЕНИ С КОТОРОГО НАЧИНАЕТСЯ РАСЧЕТ РЕЗЕРВИРОВАНИЯ ВРЕМЕНИ ПО ВРЕМЕННЫМ КАЛЬКУЛЯЦИЯМ .
     edtDeliveryTimeTo.DateTime:=   EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(StrToDateTime(MIN_TIME_FOR_REZERVED_CALCULATION)) ,
                                                    MinuteOf(StrToDateTime(MIN_TIME_FOR_REZERVED_CALCULATION)),
                                                    0,
                                                    0) ;
    // Интервал С прибытия бригад на объект = время ввыезда + время в дороге
   edtReservedTimeStart.DateTime :=
        TimeOf(edtDeliveryTimeTo.DateTime) + ( StrToFloat(ENDeliveryTimePlanList.list[0].deliveryTimePlan.DecimalString) / 2 ) /24;
    edtReservedTimeStart.DateTime :=   EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(edtReservedTimeStart.DateTime) ,
                                                    MinuteOf(edtReservedTimeStart.DateTime),
                                                    0,
                                                    0) ;
   // edtReservedTimeStart.Checked:= False;
    // определим время интервала выполнения работ ПО (с учетом переноса на время обеда и с проверкой на конец дня
    // также проверить что бы дата интервала "З" была не больше чем за Время определенное константой  до конца рабочего дня   )
  edtReservedTimeFinal.DateTime :=   TimeOf( edtReservedTimeStart.DateTime) + SumTimeWork / 24 ;
  edtReservedTimeFinal.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(edtReservedTimeFinal.DateTime) ,
                                                    MinuteOf(edtReservedTimeFinal.DateTime),
                                                    0,
                                                    0) ;


   // если интервал ПО перекрывает время обеда то перенести часть времени на после обед
   if (( edtReservedTimeFinal.DateTime >  startLunch ) and ( edtReservedTimeStart.DateTime <  startLunch )) then
    begin
      edtReservedTimeFinal.DateTime:=  finalLunch + (SumTimeWork / 24) - (startLunch - edtReservedTimeStart.DateTime);
      edtReservedTimeFinal.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(edtReservedTimeFinal.DateTime) ,
                                                    MinuteOf(edtReservedTimeFinal.DateTime),
                                                    0,
                                                    0) ;
    end;

    // ВРЕМЯ ВОЗВРАЩЕНИЯ ИСПОЛНИТЕЛЯ С ОБЪЕКТА
     if ((HourOf(edtReservedTimeFinal.DateTime)  <> 0 ) and ( MinuteOf(edtReservedTimeFinal.DateTime) >= 0 )) then
       begin
         edtDeliveryTimeFrom.DateTime :=  TimeOf( edtReservedTimeFinal.DateTime) +
                               ( StrToFloat(ENDeliveryTimePlanList.list[0].deliveryTimePlan.DecimalString) / 2 ) /24;
         // ГОД МЕСЯЦ ДЕНЬ СТАВИМ КОРРЕКТНЫМ
         edtDeliveryTimeFrom.DateTime :=  EncodeDateTime( YearOf(edtReservedDate.datetime) ,
                                                    MonthOf(edtReservedDate.datetime) ,
                                                    DayOf(edtReservedDate.datetime) ,
                                                    HourOf(edtDeliveryTimeFrom.DateTime) ,
                                                    MinuteOf(edtDeliveryTimeFrom.DateTime),
                                                    0,
                                                    0) ;
       end;
       TimeFound := True;
  end;

 end;
   if TimeFound = false then
    begin
     Application.MessageBox(PChar('На вказану дату немає вільних проміжків часу для резервування. Змінюйте дату виконання  !!!'),PChar('Внимание!'), MB_ICONWARNING);
     Exit;
    end
   else
   RenderPlanner; 
 end;


procedure TfrmENServicesCalculationEdit.chkTUClick(Sender: TObject);
begin
    { NET-4574 eic код точки учета услуги на сторону , определились убрать єту проверку  if ((chkTU.Checked) and (rgContragentType.ItemIndex = 1) ) then

         DisableControls([edtContragentObjectWork],false)
    else
     begin
         DisableControls([edtContragentObjectWork],True);
         edtContragentObjectWork.Text := '';
     end; }
    if DialogState = dsView then
       DisableControls([edtContragentObjectWork],True);
    HideControls([lblCNPack, edtCNPackCode, spbCNPack, memCNSubsystem,
      lblEPVoltageNominalVoltagenominalName,
      edtEPVoltageNominalVoltagenominalName,
      spbEPVoltageNominalVoltagenominal, chkBaseStation], not chkTU.Checked);
end;

procedure TfrmENServicesCalculationEdit.rgContragentTypeClick(
	Sender: TObject);
	var
	acc : String;
	i : Integer;
	accValidationOk : Boolean;
  TempENServicesObject : ENServicesObjectControllerSoapPort;
begin
 // inherited;

 { NET-4574 eic код точки учета услуги на сторону , определились убрать єту проверку
    if ((chkTU.Checked ) and (rgContragentType.ItemIndex = 1 )) then

				 DisableControls([edtContragentObjectWork],false)
    else
		 begin
         DisableControls([edtContragentObjectWork],True);
				 edtContragentObjectWork.Text := '';
		 end;
    }

     TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

     gbReconnectionTU.Visible := getReconnectionTUVisibility(rgContragentType.ItemIndex + 1);

      if (replaceCounter or parameterizationCounter) then
      begin
        lblCountersZoneType.Visible := True;
        cbCountersZoneType.Visible := True;
        //rgContragentType.ItemIndex := 0;
        //DisableControls([rgContragentType]);
      end;

     // NET-4295 Сброс кода лицевого счета, чтобы при изменении лицевого счета с физ. на
     // юр. не получилось так, что лицевой счет для бытового потребителя
     // сохранится для юридического в договоре

     // 29.10.2019 personalAccountCode скидывался в любом слуаче при открытии формы на просмотр редактирование
     // потому добавлю условие чо если меняется тип контрагента только потом скидывать и edtPersonalAccountNumber также
    if (gbReconnectionTU.Visible) then
    begin
     if rgContragentType.ItemIndex <> ENServicesObjectObj.contragentTypeRef.code-1 then
          begin
           ENServicesObjectObj.personalAccountCode := Low(Integer);
           ENServicesObjectObj.personalAccountNumber:= '';
           edtPersonalAccountNumber.Text:= '';
           edteic.Text:= '';
           ENServicesObjectObj.codeEIC:= '';
          end;
    end;

		 if DialogState = dsView then
			 DisableControls([edtContragentObjectWork],True);

		 if (rgContragentType.ItemIndex = 1) then
				begin
				acc := copy(Trim(edtContragentBankAccount.Text),1, 4);
				accValidationOk := False;

				if Length(acc) < 4 then
				accValidationOk := False
				else
				begin
				 for i:=Low(accBudgetString) to High(accBudgetString) do
					 begin
						 if 	(acc <> accBudgetString[i]) then Continue
						 else
							 begin
							 accValidationOk := True;
							 Break;
							 end;
					 end;
         end;

//			 SUPP-83795	 if accValidationOk = false  then
//				 begin
//				  Application.MessageBox(PChar('Рахунок для БЮДЖЕТних організацій повинен починатись з 3521, 3522, 3541,3542 або 3717!'), PChar('Увага!'), MB_ICONWARNING);
//					edtContragentBankAccount.SetFocus;
//					rgContragentType.ItemIndex := ENServicesObjectObj.contragentTypeRef.code-1;
//					Exit;
//				 end;

				end;

end;

procedure TfrmENServicesCalculationEdit.spbTechConditionsClick(
  Sender: TObject);
var
  frmENTechConditionsObjectsShow: TfrmENTechConditionsObjectsShow;
  TempENTechConditionsObjects: ENTechConditionsObjectsControllerSoapPort;

  tcFilter : ENTechConditionsObjectsFilter;
  TUObject : ENTechConditionsObjects;
begin
  frmENTechConditionsObjectsShow := TfrmENTechConditionsObjectsShow.Create(Application, fmNormal);
  try
    with frmENTechConditionsObjectsShow do
    if ShowModal = mrOk then
    begin
      edtTechConditionsNumber.Text := GetReturnValue(sgENTechConditionsObjects, 1);
      edtTechConditionsDate.DateTime := StrToDateTime(GetReturnValue(sgENTechConditionsObjects, 2));
      ENServicesObjectObj.techConObjects.code := StrToInt(GetReturnValue(sgENTechConditionsObjects, 0));

      //edtCustomer.Text := GetReturnValue(sgENTechConditionsObjects, 3);

      //ENContragentObj.techConObjects := ENTechConditionsObjects.Create;
      //ENContragentObj.techConObjects.code := StrToInt(GetReturnValue(sgENTechConditionsObjects, 0));

      //edtContragentName.Text := GetReturnValue(sgENTechConditionsObjects, 3);
      //edtBuilding.Text := GetReturnValue( sgENTechConditionsObjects, 4);
      //MakeMultiline(edtContragentAddressWork.Lines, GetReturnValue(sgENTechConditionsObjects, 5));
      //MakeMultiline(edtAdressObject.Lines, GetReturnValue(sgENTechConditionsObjects, 5));
      //edtTyServicesPower.Text := GetReturnValue(sgENTechConditionsObjects, 6);
      //edtTyCurrentPower.Text := GetReturnValue(sgENTechConditionsObjects, 7);
    end;
  finally
    frmENTechConditionsObjectsShow.Free;
  end;
end;


procedure TfrmENServicesCalculationEdit.chbIsCustomerMaterialsClick(
  Sender: TObject);
begin
  HideControls([gbActTransfer], (not chbIsCustomerMaterials.Checked));

  if not chbIsCustomerMaterials.Checked then
  begin
    // Это сбрасывать не надо, а то при нажатии на OK сохранятся пустые поля.
    // А мы должны сохранять изменения акта приема-передачи только по нажатию
    // кнопки (btnActTransferSave) в соответствующем групбоксе
    //ENServicesObjectObj.actTransferNumber := '';
    //ENServicesObjectObj.actTransferDate := nil;

    edtActTransferNumber.Text := '';
    dtpActTransferDate.DateTime := SysUtils.Date;
    dtpActTransferDate.Checked := false;
  end;
end;

procedure TfrmENServicesCalculationEdit.chbIsNewConnectionClick(
  Sender: TObject);
begin
  inherited;
  if (chbIsNewConnection.Checked) then
  begin
    ENServicesObjectObj.reconnectionTU := SERVICESOBJECT_NEWCONNECTIONTU;
    initializeConnectionsCheckBoxes;
  end
  else
    showHidePersonalAccountFields;
end;

procedure TfrmENServicesCalculationEdit.SetActTransferVisibilityByStatus(servicesObjectStatus: Integer);
begin
{
  btnActTransferSave.Visible := (ENServicesObjectObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_GOOD);
  btnActTransferMoveToFK.Visible := (ENServicesObjectObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_GOOD);
  btnActTransferUnMoveToFK.Visible := (ENServicesObjectObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_ACT_TRANSFER_CLOSED);
}

  // btnActTransferSave.Visible := (servicesObjectStatus = ENSERVICESOBJECT_FINSTATUS_GOOD);
  // btnActTransferMoveToFK.Visible := (servicesObjectStatus = ENSERVICESOBJECT_FINSTATUS_GOOD);
  // btnActTransferUnMoveToFK.Visible := (servicesObjectStatus = ENSERVICESOBJECT_FINSTATUS_ACT_TRANSFER_CLOSED);

  actActTransferSave.Visible := (servicesObjectStatus = ENSERVICESOBJECT_FINSTATUS_GOOD);
  actActTransferMoveToFK.Visible := (servicesObjectStatus = ENSERVICESOBJECT_FINSTATUS_GOOD);
  actActTransferUnMoveToFK.Visible := (servicesObjectStatus = ENSERVICESOBJECT_FINSTATUS_ACT_TRANSFER_CLOSED);

  DisableControls([edtActTransferNumber, dtpActTransferDate], (servicesObjectStatus <> ENSERVICESOBJECT_FINSTATUS_GOOD));
end;

procedure TfrmENServicesCalculationEdit.actActTransferSaveExecute(
  Sender: TObject);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
    actTransferDate: TXSDate;
begin
  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

  if edtActTransferNumber.Text = '' then
	begin
		Application.MessageBox(PChar('Введіть номер акта приймання-передачі!'), PChar('Увага!'), MB_ICONWARNING);
		edtActTransferNumber.SetFocus;
		Exit;
	end;

  if dtpActTransferDate.Checked then
  begin
    actTransferDate := TXSDate.Create;
    actTransferDate.XSToNative(GetXSDate(dtpActTransferDate.DateTime));
  end
  else begin
    Application.MessageBox(PChar('Введіть дату акта приймання-передачі!'), PChar('Увага!'), MB_ICONWARNING);
    dtpActTransferDate.SetFocus;
    Exit;
  end;

  TempENServicesObject.updateActTransfer(ENServicesObjectObj.code, edtActTransferNumber.Text, actTransferDate);

  // Нужно засетить в объект, потому что иначе при обычном сохранении уйдет это все в сад...
  ENServicesObjectObj.actTransferNumber := edtActTransferNumber.Text;
  if dtpActTransferDate.Checked then
  begin
    ENServicesObjectObj.actTransferDate := TXSDate.Create;
    ENServicesObjectObj.actTransferDate.XSToNative(GetXSDate(dtpActTransferDate.DateTime));
  end;

  Application.MessageBox(PChar('Акт збережено!'), PChar('Інформація'), MB_ICONINFORMATION);
end;

procedure TfrmENServicesCalculationEdit.actActTransferPrintExecute(
  Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  SetLength(argNames, 1);
  SetLength(args, 1);

  argnames[0] := 'servicesObjectCode';
  args[0] := IntToStr(ENServicesObjectObj.code);

  reportName := '201109/ActTransferForServices/Act';
  makeReport(reportName, argNames, args, 'xls');
end;

procedure TfrmENServicesCalculationEdit.actActTransferMoveToFKExecute(
  Sender: TObject);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
    tmpObj: ENServicesObject;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте провести Акт приймання-передачі?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK then
    Exit;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  TempENServicesObject.moveActTransferToFK(ENServicesObjectObj.code);

  Application.MessageBox(PChar('Акт проведено!'), PChar('Інформація'), MB_ICONINFORMATION);

  tmpObj := TempENServicesObject.getObject(ENServicesObjectObj.code);
  SetActTransferVisibilityByStatus(tmpObj.statusRef.code);
end;

procedure TfrmENServicesCalculationEdit.actActTransferUnMoveToFKExecute(
  Sender: TObject);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
    tmpObj: ENServicesObject;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити проведення Акту приймання-передачі?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK then
    Exit;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  TempENServicesObject.unMoveActTransferToFK(ENServicesObjectObj.code);

  Application.MessageBox(PChar('Проведення акту відмінено!'), PChar('Інформація'), MB_ICONINFORMATION);

  tmpObj := TempENServicesObject.getObject(ENServicesObjectObj.code);
  SetActTransferVisibilityByStatus(tmpObj.statusRef.code);
end;

procedure TfrmENServicesCalculationEdit.updateCustomerMaterialsFinGrid;
var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  i: Integer;
  finList: FINMaterialsShortList; 
  finFilter : FINMaterialsFilter;
begin
  ClearGrid(sgCustomerMaterialsFin);

  finFilter := FINMaterialsFilter.Create;
  SetNullIntProps(finFilter);
  SetNullXSProps(finFilter);

  finFilter.statusRef := FINMaterialsStatusRef.Create;
  finFilter.statusRef.code := FINMATERIALSSTATUS_GOOD;
  finFilter.conditionSQL := ' finmaterials.code in (' +
                            '  select ' +
                            '    fm.code ' +
                            '  from ' +
                            '    finmaterials fm, enservicesobject so, enplanwork p, enestimateitem ei ' +
                            '  where so.elementcode = p.elementrefcode ' +
                            '    and ei.planrefcode = p.code ' +
                            '    and fm.estimateitemrefcode = ei.code ' +
                            '    and p.kindcode = ' + IntToStr(ENPLANWORKKIND_CURRENT) +
                            '    and ei.kindrefcode = ' + IntToStr(ENESTIMATEITEMKIND_CUSTOMER_MATERIALS) +
                            '    and so.code = ' + IntToStr(ENServicesObjectObj.code) + ')';

  TempFINMaterials := HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

  finList := TempFINMaterials.getScrollableFilteredList(finFilter, 0, -1);

  if High(finList.list) > -1 then
    sgCustomerMaterialsFin.RowCount := High(finList.list) + 2
  else
    sgCustomerMaterialsFin.RowCount := 2;

  with sgCustomerMaterialsFin do
    for i := 0 to High(finList.list) do
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

      if finList.list[i].calc_price = nil then
        Cells[5,i+1] := ''
      else
        Cells[5,i+1] := finList.list[i].calc_price.DecimalString;

      if finList.list[i].cost = nil then
        Cells[6,i+1] := ''
      else
        Cells[6,i+1] := finList.list[i].cost.DecimalString;

      Cells[7,i+1] := finList.list[i].div_name;

      Cells[8,i+1] := finList.list[i].rest_purpose_name;

      Cells[9,i+1] := finList.list[i].partner_name;

      if finList.list[i].doc_date = nil then
        Cells[10,i+1] := ''
      else
        Cells[10,i+1] := XSDate2String(finList.list[i].doc_date);

      Cells[11,i+1] := finList.list[i].party_discription;

      Cells[12,i+1] := IntToStr(finList.list[i].party_id);

      Cells[13, i+1] := finList.list[i].userGen;

      if finList.list[i].dateEdit <> nil then
        Cells[14, i+1] := XSDateTimeWithDate2String(finList.list[i].dateEdit)
      else
        Cells[14, i+1] := '';

      sgCustomerMaterialsFin.RowCount:= i + 2;
    end;

  sgCustomerMaterialsFin.Row:=1;
end;

function TfrmENServicesCalculationEdit.CheckCountersByClassifications(): Boolean;
var TempENPlanWork2ClassificationType: ENPlanWork2ClassificationTypeControllerSoapPort;
    plan2ctFilter: ENPlanWork2ClassificationTypeFilter;
    //ctArr: ENPlanWork2ClassificationTypeController.ArrayOfInteger;
    plan2ctList: ENPlanWork2ClassificationTypeShortList;
begin
  Result := false;

  if planCode = LOW_INT then Exit;

  TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;

  plan2ctFilter := ENPlanWork2ClassificationTypeFilter.Create;
  SetNullIntProps(plan2ctFilter);
  SetNullXSProps(plan2ctFilter);

  plan2ctFilter.planRef := ENPlanWorkRef.Create;
  plan2ctFilter.planRef.code := planCode;

  plan2ctFilter.conditionSQL := 'coalesce(TKCLASSIFICATIONTYPE.ISGIVECOUNTER, 0) > 0';

  //ctArr := TempENPlanWork2ClassificationType.getScrollableFilteredCodeArray(plan2ctFilter, 0, -1);
  plan2ctList := TempENPlanWork2ClassificationType.getScrollableFilteredList(plan2ctFilter, 0, -1);

  if High(plan2ctList.list) > -1 then
    Result := true;
end;


procedure TfrmENServicesCalculationEdit.SetCountersVisibility;
begin
  tsCounters.TabVisible := false;

  // 13.07.2020... SUPP-92950... +++ черновой договор по заявке с сайта...
  if (ENServicesObjectObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED)
        or ( (ENServicesObjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_DRAFT) and (ENServicesObjectObj.createdFromSite = YES) ) then
  begin
    ///// 10.01.13 NET-4159
    // Отображение вкладки "Лічильники, що передаються Замовником".
    // Если счетчики уже вкинуты, отображаем вкладку в любом случае,
    // если нет, и статус договора "Кошторис затверджений" - смотрим,
    // есть ли в нем калькуляции с признаком "Передача лічильника замовником до Метрології",
    // тогда отображаем вкладку
    if DMReports.CheckCounters(ENServicesObjectObj.code) then
      tsCounters.TabVisible := true
    else
      // 13.07.2020... SUPP-92950... +++ черновой договор по заявке с сайта...
      if (ENServicesObjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_BUDGETAPPROVED)
            or ( (ENServicesObjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_DRAFT) and (ENServicesObjectObj.createdFromSite = YES) ) then
      begin
        if CheckCountersByClassifications then
          tsCounters.TabVisible := true;
      end;
    /////
  end;
end;

procedure TfrmENServicesCalculationEdit.actUpdateCountersExecute(
  Sender: TObject);
var i, plan2ctCode, commentGenCol : Integer;
    TempENGiveCounter: ENGiveCounterControllerSoapPort;
    ENGiveCounterFilterObj: ENGiveCounterFilter;
    ENGiveCounterList: ENGiveCounterShortList;
    cost, vat, costWithVat : Extended;
begin
  ClearGrid(sgENGiveCounter);
  
  try
    plan2ctCode := StrToInt(sgENClassificationsWithCounters.Cells[0, sgENClassificationsWithCounters.Row]);
  except
    on EConvertError do Exit;
  end;

  ENGiveCounterFilterObj := ENGiveCounterFilter.Create;
  SetNullIntProps(ENGiveCounterFilterObj);
  SetNullXSProps(ENGiveCounterFilterObj);

  ENGiveCounterFilterObj.servicesObjectRef := ENServicesObjectRef.Create;
  ENGiveCounterFilterObj.servicesObjectRef.code := ENServicesObjectObj.code;

  ENGiveCounterFilterObj.plan2ClTypeRef := ENPlanWork2ClassificationTypeRef.Create;
  ENGiveCounterFilterObj.plan2ClTypeRef.code := plan2ctCode;

  TempENGiveCounter := HTTPRIOENGiveCounter as ENGiveCounterControllerSoapPort;

  ENGiveCounterList := TempENGiveCounter.getScrollableFilteredList(ENGiveCounterFilterObj, 0, -1);

  if High(ENGiveCounterList.list) > -1 then
    sgENGiveCounter.RowCount := High(ENGiveCounterList.list) + 2
  else
    sgENGiveCounter.RowCount := 2;

  if Self.isGiveCounterToBalance then begin
    commentGenCol := 8;
  end else begin
    commentGenCol := 3;
    sgENGiveCounter.HideColumn(4);
    sgENGiveCounter.HideColumn(5);
    sgENGiveCounter.HideColumn(6);
    sgENGiveCounter.HideColumn(7);
    sgENGiveCounter.HideColumn(8);
  end;

  with sgENGiveCounter do
    for i := 0 to High(ENGiveCounterList.list) do
    begin
      Application.ProcessMessages;

      if ENGiveCounterList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENGiveCounterList.list[i].code)
      else
          Cells[0,i+1] := '';
      Cells[1,i+1] := ENGiveCounterList.list[i].counterType;
      Cells[2,i+1] := ENGiveCounterList.list[i].serialNumber;



      if Self.isGiveCounterToBalance then begin
        if ENGiveCounterList.list[i].cost <> nil then begin
          Cells[3,i+1] := ENGiveCounterList.list[i].cost.DecimalString;
          cost := StrToFloat(ENGiveCounterList.list[i].cost.DecimalString);
        end else begin
          Cells[3,i+1] := '';
          cost := 0;
        end;

        if ENGiveCounterList.list[i].vat <> nil then begin
          vat := StrToFloat(ENGiveCounterList.list[i].vat.DecimalString);
        end else begin
          vat := 0;
        end;

        costWithVat := cost + vat;
        Cells[4,i+1] := FloatTostr(costWithVat);

        Cells[5,i+1] := ENGiveCounterList.list[i].molCode + ' ' + ENGiveCounterList.list[i].molName;
		
		if ENGiveCounterList.list[i].phasity <> Low(Integer) then begin
			Cells[6,i+1] := IntToStr(ENGiveCounterList.list[i].phasity) + '-фазний';
		end else begin
      Cells[6,i+1] := '';
    end;
		
		if ENGiveCounterList.list[i].dateBuild = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDate2String(ENGiveCounterList.list[i].dateBuild);
      end;

      Cells[commentGenCol,i+1] := ENGiveCounterList.list[i].commentGen;

      sgENGiveCounter.RowCount := i + 2;
    end;

  sgENGiveCounter.Row := 1;
end;

procedure TfrmENServicesCalculationEdit.actInsertCounterExecute(
  Sender: TObject);
var plan2ctCode: Integer;
begin
  try
    plan2ctCode := StrToInt(sgENClassificationsWithCounters.Cells[0, sgENClassificationsWithCounters.Row]);
  except
    on EConvertError do Exit;
  end;
  
  ENGiveCounterObj := ENGiveCounter.Create;
  try
    ENGiveCounterObj.servicesObjectRef := ENServicesObjectRef.Create;
    ENGiveCounterObj.servicesObjectRef.code := ENServicesObjectObj.code;
    ENGiveCounterObj.plan2ClTypeRef := ENPlanWork2ClassificationTypeRef.Create;
    ENGiveCounterObj.plan2ClTypeRef.code := plan2ctCode;

    frmENGiveCounterEdit := TfrmENGiveCounterEdit.Create(Application, dsInsert);
    frmENGiveCounterEdit.isGiveCounterToBalance := isGiveCounterToBalance;

    try
      if frmENGiveCounterEdit.ShowModal = mrOk then
      begin
        if ENGiveCounterObj <> nil then
          actUpdateCountersExecute(Sender);
      end;
    finally
      frmENGiveCounterEdit.Free;
      frmENGiveCounterEdit := nil;
    end;
  finally
    ENGiveCounterObj.Free;
  end;
end;

procedure TfrmENServicesCalculationEdit.actInsertDelayExecute(Sender: TObject);
begin
  ENDelayServicesObj := ENDelayServices.Create;
  ENDelayServicesObj.servicesObjectRef := ENServicesObjectRef.Create;
  ENDelayServicesObj.servicesObjectRef.code := ENServicesObjectObj.code;

  try
    frmENDelayServicesEdit := TfrmENDelayServicesEdit.Create(Application, dsInsert);
    try
      if frmENDelayServicesEdit.ShowModal = mrOk then
      begin
        if ENDelayServicesObj <> nil then
          pcCalculationChange(Sender);
      end;
    finally
      frmENDelayServicesEdit.Free;
      frmENDelayServicesEdit := nil;
    end;
  finally
    ENDelayServicesObj.Free;
  end;
end;

procedure TfrmENServicesCalculationEdit.actEditCounterExecute(
  Sender: TObject);
Var TempENGiveCounter: ENGiveCounterControllerSoapPort;
begin
 TempENGiveCounter := HTTPRIOENGiveCounter as ENGiveCounterControllerSoapPort;
   try
     ENGiveCounterObj := TempENGiveCounter.getObject(StrToInt(sgENGiveCounter.Cells[0,sgENGiveCounter.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENGiveCounterEdit:=TfrmENGiveCounterEdit.Create(Application, dsEdit);
  frmENGiveCounterEdit.isGiveCounterToBalance := isGiveCounterToBalance;
  try
    if frmENGiveCounterEdit.ShowModal= mrOk then
      begin
        actUpdateCountersExecute(Sender);
      end;
  finally
    frmENGiveCounterEdit.Free;
    frmENGiveCounterEdit:=nil;
  end;
end;

procedure TfrmENServicesCalculationEdit.actEditDelayExecute(Sender: TObject);
Var TempENDelayServices: ENDelayServicesControllerSoapPort;
begin
  TempENDelayServices := HTTPRIOENDelayServices as ENDelayServicesControllerSoapPort;

  try
    ENDelayServicesObj := TempENDelayServices.getObject(StrToInt(sgENDelayServices.Cells[0, sgENDelayServices.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENDelayServicesEdit := TfrmENDelayServicesEdit.Create(Application, dsEdit);
  try
    if frmENDelayServicesEdit.ShowModal = mrOk then
    begin
      pcCalculationChange(Sender);
    end;
  finally
    frmENDelayServicesEdit.Free;
    frmENDelayServicesEdit := nil;
  end;
end;

procedure TfrmENServicesCalculationEdit.actDeleteCounterExecute(
  Sender: TObject);
Var TempENGiveCounter: ENGiveCounterControllerSoapPort;
    ObjCode: Integer;
begin
  TempENGiveCounter := HTTPRIOENGiveCounter as ENGiveCounterControllerSoapPort;
  try
    ObjCode := StrToInt(sgENGiveCounter.Cells[0,sgENGiveCounter.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити запис ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENGiveCounter.remove(ObjCode);
    actUpdateCountersExecute(Sender);
  end;
end;

procedure TfrmENServicesCalculationEdit.actDeleteDelayExecute(Sender: TObject);
Var TempENDelayServices: ENDelayServicesControllerSoapPort;
    ObjCode: Integer;
begin
  TempENDelayServices := HTTPRIOENDelayServices as ENDelayServicesControllerSoapPort;

  try
    ObjCode := StrToInt(sgENDelayServices.Cells[0, sgENDelayServices.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Вы действительно хотите удалить запись ?'),
                            PChar('Внимание !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENDelayServices.remove(ObjCode);
    pcCalculationChange(Sender);
  end;
end;

procedure TfrmENServicesCalculationEdit.actViewCounterExecute(
  Sender: TObject);
Var TempENGiveCounter: ENGiveCounterControllerSoapPort;
begin
 TempENGiveCounter := HTTPRIOENGiveCounter as ENGiveCounterControllerSoapPort;
   try
     ENGiveCounterObj := TempENGiveCounter.getObject(StrToInt(sgENGiveCounter.Cells[0,sgENGiveCounter.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENGiveCounterEdit:=TfrmENGiveCounterEdit.Create(Application, dsView);
  frmENGiveCounterEdit.isGiveCounterToBalance := isGiveCounterToBalance;
  try
    frmENGiveCounterEdit.ShowModal;
  finally
    frmENGiveCounterEdit.Free;
    frmENGiveCounterEdit:=nil;
  end;
end;

procedure TfrmENServicesCalculationEdit.actViewDelayExecute(Sender: TObject);
Var TempENDelayServices: ENDelayServicesControllerSoapPort;
begin
  TempENDelayServices := HTTPRIOENDelayServices as ENDelayServicesControllerSoapPort;
  try
    ENDelayServicesObj := TempENDelayServices.getObject(StrToInt(sgENDelayServices.Cells[0, sgENDelayServices.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENDelayServicesEdit := TfrmENDelayServicesEdit.Create(Application, dsView);
  try
    frmENDelayServicesEdit.ShowModal;
  finally
    frmENDelayServicesEdit.Free;
    frmENDelayServicesEdit := nil;
  end;
end;


procedure TfrmENServicesCalculationEdit.sgENActIncomeServicesDblClick(Sender: TObject);
begin
  inherited;
  actViewIncomeExecute(Sender);
end;


procedure TfrmENServicesCalculationEdit.sgENClassificationsWithCountersClick(
  Sender: TObject);
begin
  actUpdateCountersExecute(Sender);
end;


procedure TfrmENServicesCalculationEdit.sgENDocAttachmentDblClick(
  Sender: TObject);
begin
  inherited;
  actLoadAttachmentsExecute(Sender);
end;


procedure TfrmENServicesCalculationEdit.spbENResponsibleClick(
  Sender: TObject);
var
  frmFINWorkerShow: TfrmFINWorkerShow;
  f : FINWorkerFilter;
  TempFINWorker: FINWorkerControllerSoapPort;
begin
  f :=FINWorkerFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);


  // MDAX-441
  if DMReports.UsesMDAXData then
    f.conditionSQL := ' hrmorganizationid like ''027%'''
  else
    // Вся Метрология !!!!!!!!!!!!
    f.conditionSQL := 'pd.Podr_Id in (665, 807, 806, 669, 668, 667, 670, 671)';


  frmFINWorkerShow := TfrmFINWorkerShow.Create(Application, fmNormal, f);
  try

    if edtContractDateServices.Checked then
    begin
      frmFINWorkerShow.dateGet := TXSDate.Create;
      frmFINWorkerShow.dateGet.XSToNative(GetXSDate(edtContractDateServices.DateTime));
    end
    else
      frmFINWorkerShow.dateGet := nil;

    DisableActions([frmFINWorkerShow.actInsert, frmFINWorkerShow.actEdit, frmFINWorkerShow.actDelete]);

    with frmFINWorkerShow do
      if ShowModal = mrOk then
      begin
        ENServicesObjectObj.resposible := GetReturnValue(sgFINWorker, 1);
        ENServicesObjectObj.resposibleTabNumber := GetReturnValue(sgFINWorker, 2);
        ENServicesObjectObj.resposiblePosition := GetReturnValue(sgFINWorker, 3);
        //edtENResponsible.Text := ENServicesObjectObj.resposiblePosition + ' ' + ENServicesObjectObj.resposible;
        edtENResponsible.Text := ENServicesObjectObj.resposible;
        edtENResponsiblePosition.Text := ENServicesObjectObj.resposiblePosition;
      end;
  finally
    frmFINWorkerShow.Free;
  end;
end;

procedure TfrmENServicesCalculationEdit.btnActPriPerCountersClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'enservicesobjectcode';
  args[0] := IntToStr(ENServicesObjectObj.code);

  reportName :=  'Calculation/ActPriPerCounters';
  makeReport(reportName , argNames , args , 'pdf');
end;

procedure TfrmENServicesCalculationEdit.spbChoosePersonalInfoClick(
  Sender: TObject);
var
  isByt : Boolean;
  TempENRecordPointByt : ENRecordPointBytControllerSoapPort;
  TempENRecordPointProm : ENRecordPointPromControllerSoapPort;
  promFilter : ENRecordPointPromFilter;
  bytFilter : ENRecordPointBytFilter;
  prom : ENRecordPointProm;
  selectedProm : ENRecordPointPromShort;
  byt : ENRecordPointByt;
  selectedByt : ENRecordPointBytShort;
  personalInfo : PersonalServicesInfo;
  accountNumber : String;
  TempENServicesObject : ENServicesObjectControllerSoapPort;
  TempENDepartment2EPRen : ENDepartment2EPRenControllerSoapPort;
  dep2RenFilter : ENDepartment2EPRenFilter;
  dep2RenList : ENDepartment2EPRenShortList;
  depCode : Integer;
  uid : WideString;
begin
  inherited;

  accountNumber := '';
  if (edtPersonalAccountNumber.Text = '') then
  begin
    Application.MessageBox(PChar('Не введено особовий рахунок!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
    edtPersonalAccountNumber.SetFocus;
    Exit;
  end;

  isByt := Self.getBytOrProm;

  if isByt then begin
    bytFilter := ENRecordPointBytFilter.Create;
    SetNullXSProps(bytFilter);
    SetNullIntProps(bytFilter);
    bytFilter.accountNumber := edtPersonalAccountNumber.Text;
    selectedByt := TfrmENRecordPointBytShow.chooseFromList(bytFilter);
    if Assigned(selectedByt) then begin
      TempENRecordPointByt := HTTPRIOENRecordPointByt as ENRecordPointBytControllerSoapPort;
      byt := TempENRecordPointByt.getObject(selectedByt.code);
      accountNumber := byt.accountNumber;
      depCode := byt.element.renRef.code;
    end;
  end else begin
    promFilter := ENRecordPointPromFilter.Create;
    SetNullXSProps(promFilter);
    SetNullIntProps(promFilter);
    promFilter.accountNumber := edtPersonalAccountNumber.Text;
    selectedProm := TfrmENRecordPointPromShow.chooseFromList(promFilter);
    if Assigned(selectedProm) then begin
      TempENRecordPointProm := HTTPRIOENRecordPointProm as ENRecordPointPromControllerSoapPort;
      prom := TempENRecordPointProm.getObject(selectedProm.code);
      accountNumber := prom.accountNumber;
      depCode := prom.element.renRef.code;
    end;
  end;
  TempENDepartment2EPRen := HTTPRIOENDepartment2EPRen AS ENDepartment2EPRenControllerSoapPort;
  if Length(accountNumber) = 0 then Exit;
  if not (depCode in [ENConsts.REN_RM_NORTH
    , ENConsts.REN_RM_EAST, ENConsts.REN_RM_SOUTH, ENConsts.REN_RM_WEST, ENConsts.REN_RM_CENTER]) then begin
      dep2RenFilter := ENDepartment2EPRenFilter.Create;
      SetNullXSProps(dep2RenFilter);
      SetNullIntProps(dep2RenFilter);
      //dep2RenFilter.renRef := EPRenRef.Create;
      //dep2RenFilter.renRef.code := depCode;
      dep2RenFilter.conditionSQL := Format('ENDEPARTMENT2EPREN.CODE IN (SELECT deep.code FROM endepartment2epren AS deep WHERE deep.renrefcode = %d ' +
          ' AND EXISTS (SELECT FROM endepartment2epren AS deep1 WHERE deep1.departmentrefcode = deep.departmentrefcode AND deep1.renrefcode in (%d,%d,%d,%d,%d)))'
          , [depCode, ENConsts.REN_RM_NORTH, ENConsts.REN_RM_EAST, ENConsts.REN_RM_SOUTH, ENConsts.REN_RM_WEST, ENConsts.REN_RM_CENTER]);

      dep2RenList := TempENDepartment2EPRen.getScrollableFilteredList(dep2RenFilter, 0, -1);
      if dep2RenList.totalCount = 0 then Exit;
      depCode := dep2RenList.list[0].departmentRefCode;
    end else begin
      dep2RenFilter := ENDepartment2EPRenFilter.Create;
      SetNullXSProps(dep2RenFilter);
      SetNullIntProps(dep2RenFilter);
      dep2RenFilter.renRef := EPRenRef.Create;
      dep2RenFilter.renRef.code := depCode;
      dep2RenList := TempENDepartment2EPRen.getScrollableFilteredList(dep2RenFilter, 0, -1);
      if dep2RenList.totalCount = 0 then Exit;
      depCode := dep2RenList.list[0].departmentRefCode;
    end;

  if isByt then begin
    uid := TempENRecordPointByt.getPersonalAccountUidByCode(byt.rpCode, depCode);
  end else begin
    uid := TempENRecordPointProm.getPersonalAccountUidByCode(prom.accountCode, depCode);
  end;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  if Length(uid) <> 0 then begin
      personalInfo := TempENServicesObject.getPersonalAccountInfo('', uid, depCode, isByt);
  end else begin
      personalInfo := TempENServicesObject.getPersonalAccountInfo(accountNumber, depCode, isByt);
  end;
  Self.setPersonalServicesInfo(personalInfo);
end;

procedure TfrmENServicesCalculationEdit.setPersonalServicesInfo(personalInfo : PersonalServicesInfo);
begin
 if (personalInfo <> nil) and (personalInfo.rpCode <> LOW_INT) then begin
    ENServicesObjectObj.reconnectionTU := SERVICESOBJECT_RECONNECTIONTU;
    ENServicesObjectObj.personalAccountCode := personalInfo.rpCode;
    ENServicesObjectObj.personalAccountNumber := personalInfo.rpName;
    ENServicesObjectObj.personalAccountUid := personalInfo.rpUid;

    if personalInfo.eic <> '' then
    begin
      ENServicesObjectObj.codeEIC := personalInfo.eic;
      edteic.Text := personalInfo.eic;
    end;

    edtContragentName.Text := personalInfo.fioLine;
    edtContragentAddress.Text := personalInfo.addressLine;
    edtContragentOkpo.Text := personalInfo.identCode;
  //  edtContragentPhoneNumber.Text := personalInfo.phone;

    // Эти поля есть возможность заполнить только для физ. лиц
    if(rgContragentType.ItemIndex + 1 = ENConsts.ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL) then
    begin
          edtContragentAddressWork.Text := personalInfo.addressLine;
          edtContragentPassport.Text := personalInfo.passportLine;
          edtContragentBossName.Text := personalInfo.fioLine;
          edtRegionalType.ItemIndex := personalInfo.isurban;
    end;

  end;
end;

procedure TfrmENServicesCalculationEdit.spbCNPackClick(Sender: TObject);
var frmCNPackShow: TfrmCNPackShow; f: CNPackFilter; condition: String;
begin
  if DialogState = dsView then Exit;
  f := CNPackFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  condition := '';
  //Для договоров подготовки ТУ фильтранем пакет по № договора о подготовке ТУ
  if ENServicesObjectObj.contractTypeRef.code = ENSERVICESOBJECTTYPE_TU then
    begin
      if ENServicesObjectObj.contractNumberServices <> '' then
        begin
          condition := '(p.reg_num_tu_creation_contract like ''%' +
            ENServicesObjectObj.contractNumberServices + '%''';
          if ENServicesObjectObj.contractNumber <> '' then
            condition := condition
              + ' or p.reg_num_tu_creation_contract like ''%'
              + ENServicesObjectObj.contractNumber + '%''';
          condition := condition + ')';
        end;
    end;
  AddCondition(condition, ' p.id_pack_status <> 1000', false);
  f.conditionSQL := condition;

  frmCNPackShow := TfrmCNPackShow.Create(Application, fmNormal, f);
  try
    with frmCNPackShow do
    begin
      // Даем возможность фильтровать
      //if contractNumber <> '' then
      //  DisableActions([actFilter, actNoFilter]);
      if ShowModal = mrOk then
        begin
          try
            ENServicesObjectObj.cnPackCode :=
              StrToInt(GetReturnValue(sgCNPack, 1));
            if ENServicesObjectObj.cnSubsystemTypeRef = nil then
              ENServicesObjectObj.cnSubsystemTypeRef :=
                CNSubsystemTypeRef.Create;
            ENServicesObjectObj.cnSubsystemTypeRef.code :=
              Integer(sgCNPack.Objects[4, sgCNPack.Row]);
            edtCNPackCode.Text := GetReturnValue(sgCNPack, 1);
            memCNSubsystem.Text := GetReturnValue(sgCNPack, 4);
          except
            on EConvertError do Exit;
          end;
        end;
    end;
  finally
    frmCNPackShow.Free;
  end;
end;

procedure TfrmENServicesCalculationEdit.spbEPVoltageNominalVoltagenominalClick(
  Sender: TObject);
var frmEPVoltageNominalShow: TfrmEPVoltageNominalShow;
  EPVoltageNominalFilterObj: EPVoltageNominalFilter;
begin
  EPVoltageNominalFilterObj := EPVoltageNominalFilter.Create;
  SetNullIntProps(EPVoltageNominalFilterObj);
  SetNullXSProps(EPVoltageNominalFilterObj);

  frmEPVoltageNominalShow := TfrmEPVoltageNominalShow.Create(
    Application, fmNormal, EPVoltageNominalFilterObj);
  try
    with frmEPVoltageNominalShow do
      if ShowModal = mrOk then
        begin
          try
            edtEPVoltageNominalVoltagenominalName.Text :=
              FloatToStr(StrToFloat(GetReturnValue(sgMain, 1)) * 1000);
          except
            on EConvertError do Exit;
          end;
        end;
  finally
    frmEPVoltageNominalShow.Free;
  end;
end;


procedure TfrmENServicesCalculationEdit.spbENElementClick(Sender: TObject);
var
  frmENElementShow : TfrmENElementShow;
  f : ENElementFilter;
  invNum, depName : String;
  depCode : Integer;
  depShort : ENDepartmentShort;
begin
  f := ENElementFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.orderBySQL := 'typerefcode';

  frmENElementShow := TfrmENElementShow.Create(Application, fmNormal, f);
  frmENElementShow.isPriconnection := true;
  try
    with frmENElementShow do
    if ShowModal = mrOk then
    begin
      try
        // при перевыборе ТП - очистить.... 
        ENPriconnectionDataObj := nil;
        if ENPriconnectionDataObj = nil then ENPriconnectionDataObj := ENPriconnectionData.Create;
        if ENPriconnectionDataObj.elementRef = nil then ENPriconnectionDataObj.elementRef := ENElementRef.Create;
          ENPriconnectionDataObj.elementRef.code := StrToInt(GetReturnValue(sgENElement,0));
          edtENElementName.Text := GetReturnValue(sgENElement,1) + ', інв.№ ' + GetReturnValue(sgENElement,3);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENElementShow.Free;
  end;
end;

procedure TfrmENServicesCalculationEdit.LoadENTechConditionsServices{(ENTechConditionsServicesObj: ENTechConditionsServices)};
var
  i : Integer;
  TempENElement : ENElementControllerSoapPort;
  eFilter : ENElementFilter;
  eList : ENElementShortList;

  ENConnectionTariffShortObj : ENConnectionTariffShort;
  TempENConnectionTariff : ENConnectionTariffControllerSoapPort;
  TempENConnectionTariffEntry : ENConnectionTariffEntryControllerSoapPort;

  TempENTechCondResponsibles: ENTechCondResponsiblesControllerSoapPort;
  ENTechCondResponsiblesObj: ENTechCondResponsibles;

  substationFilter : ENSubstation04Filter;
  substationList : ENSubstation04ShortList;
  TempSubstation : ENSubstation04ControllerSoapPort;

begin
  if ENTechConditionsServicesObj = nil then
    raise Exception.Create('NET-4231 Не знайдено зв''язаний об''єкт [ENTechConditionsServices]!');

  SetGridHeaders(ENContragentHeaders, sgENContragent.ColumnHeaders);

  //DisableControls([edtENTechConditionsServicesTypeTechCondServicesTypeName,
  //                 edtResponsiblePerson, edtENElementName]);


  SetFloatStyle([edtTyServicesSumma, edtTyServicesPower, edtTySummaGen, edtTySummaVat]);

  //****************************************************************************
  
  gbConnectionTariff.Visible := ((ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION)
       and (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART));

  {cbBuildersArea.Visible := ((ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION)
       and (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART));}

  cbBuildersArea.Visible := (ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION);

  chkBaseStation.Visible := (ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION);

  cbSmallArchFrm.Visible := (ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION);

  //NET-4223. Пункты договора о Нестандартном присоединении 3.2.4, 7.1 указывают на конечную дату действия договора.
  //Поле также необходимо и для договоров о Стандартном присоединении. Для договоров о реализации ТУ старого образца
  //конечную дату действия договора указывать не надо
  edtContractDateFinal.Visible := ((ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION)
       and (ENTechConditionsServicesObj.connectionKindRef.code <> ENCONNECTIONKIND_GENERAL_CONNECTION));

  lblContractDateFinal.Visible := ((ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION)
       and (ENTechConditionsServicesObj.connectionKindRef.code <> ENCONNECTIONKIND_GENERAL_CONNECTION));

  gbPriconnectionData.Visible :=
     ((ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_NO_STANDART) and (DialogState <> dsInsert));

  if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_NO_STANDART)
    then  DisableControls([edtTySummaGen, edtTySummaVat]);

  if ((ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION)
       and (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART)) then
  begin
    DisableControls([edtTySummaGen, edtTySummaVat, edtConnectionTariffName, edtConnectionTariffValue, edtTyServicesSumma]);
    DenyBlankValues([edtConnectionTariffName, edtConnectionTariffValue]);
  end;

  if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_NO_STANDART) then
    HideControls([lblExecutionTerm, edtExecutionTerm]);

  DisableControls([edtTySummaGen, edtTySummaVat, edtConnectionTariffName, edtConnectionTariffValue{, edtTyServicesPower}]);
  //****************************************************************************

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
       spbConnectionTariffValus
       //,spbENElement
      , edtConnectionTariffName
      , edtConnectionTariffValue
      , spbConnectionTariffValus
       ]);
    DisableActions([actInsertContragent, actEditContragent, actDeleteContragent]);
  end;

  {
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtContractNumber
      ,edtContractDate
      , cbbENTechContragentFormContragentFormName
      , edtENDepartmentDepartmentName
      , edtTyServicesPower
      , edtCNPackCode
      , edtExecutionTerm
     ]);

   end;
  }
  
  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    ENPriconnectionDataObj := DMReports.getPriconnectionDataByServicesCode(ENTechConditionsServicesObj.code);
    if (ENPriconnectionDataObj <> nil) then
    begin
       eFilter := ENElementFilter.Create;
       try
         TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;
         SetNullIntProps(eFilter);
         SetNullXSProps(eFilter);
         eFilter.code := ENPriconnectionDataObj.elementRef.code;
         eList := TempENElement.getScrollableFilteredList(eFilter,0,-1);

         if (eList.totalCount > 0) then
         begin
           edtENElementName.Text := eList.list[0].objectName + ', інв.№ ' + eList.list[0].objectInvNumber;
           DisableControls([spbENElement]);
           isNotCalculated := False;
         end;

       finally
         eFilter.Free;
       end;
    end;

    if (ENTechConditionsServicesObj.s04Ref.code <> LOW_INT) then
    begin
       substationFilter := ENSubstation04Filter.Create;
       try
         TempSubstation := HTTPRIOENSubstation04 as ENSubstation04ControllerSoapPort;
         SetNullIntProps(substationFilter);
         SetNullXSProps(substationFilter);
         substationFilter.code := ENTechConditionsServicesObj.s04Ref.code;
         substationList := TempSubstation.getScrollableFilteredList(substationFilter,0,-1);

         if (substationList.totalCount > 0) then
         begin
           edtENElementName.Text := substationList.list[0].name + ', інв.№ ' + substationList.list[0].invNumber;
           substation04Code := substationList.list[0].code;

           // при перевыборе ТП - очистить....
           ENPriconnectionDataObj := nil;
            if ENPriconnectionDataObj = nil then ENPriconnectionDataObj := ENPriconnectionData.Create;
            if ENPriconnectionDataObj.elementRef = nil then ENPriconnectionDataObj.elementRef := ENElementRef.Create;
               ENPriconnectionDataObj.elementRef.code := substationList.list[0].elementCode;
         end;

       finally
         substationFilter.Free;
       end;
    end;



      if ((ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION)
         and (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART)) then
      begin
        try
          if (ENTechConditionsServicesObj.tariffEntryRef <> nil) and (ENTechConditionsServicesObj.tariffEntryRef.code <> Low(Integer)) then
          begin
            TempENConnectionTariff := HTTPRIOENConnectionTariff as ENConnectionTariffControllerSoapPort;
            TempENConnectionTariffEntry := HTTPRIOENConnectionTariffEntry as ENConnectionTariffEntryControllerSoapPort;
            ENConnectionTariffShortObj := TempENConnectionTariff.getShortObject(TempENConnectionTariffEntry.getObject(ENTechConditionsServicesObj.tariffEntryRef.code).tariffRef.code);

            if ENConnectionTariffShortObj <> nil then
            begin
              edtConnectionTariffName.Text := ENConnectionTariffShortObj.name;
              edtConnectionTariffValue.Text := ENConnectionTariffShortObj.value.DecimalString;
            end;
          end;
        finally
        end;
      end;

      if (ENTechConditionsServicesObj.buildersArea = ENTECHCONDITIONS_BUILDERSAREA_YES) then
      begin
        cbBuildersArea.Checked := True;
        // SUPP-1240... +++ для строй.площадок - оставить выбор тарифа, сумма при этом нулевая..
        // gbConnectionTariff.Visible := False;
      end;

      //Заполняется раньше - из ТУ EnergyWorkFlow, но всё же дополнительно:
      if not chkBaseStation.Checked then
        chkBaseStation.Checked := (ENTechConditionsServicesObj.baseStation =
          ENTECHCONDITIONS_BASESTATION_YES);

      cbSmallArchFrm.Checked := (ENTechConditionsServicesObj.smallArchFrm =
        ENTECHCONDITIONS_SMALLARCHFRM_YES);

      chbIsSea.Checked := (ENTechConditionsServicesObj.isSea = 1);

      {
      edtCode.Text := IntToStr(ENTechConditionsServicesObj.code);
      edtContractNumber.Text := ENTechConditionsServicesObj.contractNumber;
      if ENTechConditionsServicesObj.contractDate <> nil then
      begin
        edtContractDate.DateTime := EncodeDate(
          ENTechConditionsServicesObj.contractDate.Year,
          ENTechConditionsServicesObj.contractDate.Month,
          ENTechConditionsServicesObj.contractDate.Day);
        edtContractDate.checked := true;
      end
      else
      begin
        edtContractDate.DateTime:=SysUtils.Date;
        edtContractDate.checked := false;
      end;
      }
      
      if (ENTechConditionsServicesObj.contractDateFinal <> nil) then
        begin
          edtContractDateFinal.DateTime := EncodeDate(
            ENTechConditionsServicesObj.contractDateFinal.Year,
            ENTechConditionsServicesObj.contractDateFinal.Month,
            ENTechConditionsServicesObj.contractDateFinal.Day);
          edtContractDateFinal.checked := true;
        end
      else {if (edtContractDate.Checked) and (edtContractDateFinal.Visible) then
        begin
          edtContractDateFinal.Date := EncodeDate(YearOf(edtContractDate.Date) + 2,
                                                  MonthOf(edtContractDate.Date),
                                                  DayOf(edtContractDate.Date)); //StrToDate(strDate);
          edtContractDateFinal.Checked := True;
        end
      else } begin
        edtContractDateFinal.DateTime := SysUtils.Date;
        edtContractDateFinal.checked := false;
      end;




    if ( ENTechConditionsServicesObj.tyServicesSumma <> nil ) then
       edtTyServicesSumma.Text := ENTechConditionsServicesObj.tyServicesSumma.decimalString
    else
       edtTyServicesSumma.Text := '';
    if ( ENTechConditionsServicesObj.tyServicesPower <> nil ) then
       edtTyServicesPower.Text := ENTechConditionsServicesObj.tyServicesPower.decimalString
    else
       edtTyServicesPower.Text := '';
    //MakeMultiline(edtCommentServicesGen.Lines, ENTechConditionsServicesObj.commentServicesGen);


    edtENTechConditionsServicesTypeTechCondServicesTypeName.Text := ENTechConditionsServicesObj.techCondServicesType.name;
    // edtENTechContragentFormContragentFormName.Text := ENTechConditionsServicesObj.contragentForm.name;

        if ENTechConditionsServicesObj.contragentForm <> nil  then
          begin
           cbbENTechContragentFormContragentFormName.ItemIndex:=  ENTechConditionsServicesObj.contragentForm.code-1;

          end

        else
          begin
           cbbENTechContragentFormContragentFormName.ItemIndex := 0;
          end;




    if ( ENTechConditionsServicesObj.tySummaGen <> nil ) then
       edttysummagen.Text := ENTechConditionsServicesObj.tySummaGen.decimalString
    else
       edttysummagen.Text:= '';
    if ( ENTechConditionsServicesObj.tySummaVat<> nil ) then
       edttysummavat.Text := ENTechConditionsServicesObj.tySummaVat.decimalString
    else
       edttysummavat.Text:= '';




    edtExecutionTerm.Text := ENTechConditionsServicesObj.executionTerm;

    //*** edtResponsiblePerson.Text := ENTechConditionsServicesObj.responsibleFIO;
    if ENTechConditionsServicesObj.techCondResponsiblesRef <> nil then
      if ENTechConditionsServicesObj.techCondResponsiblesRef.code <> LOW_INT then
      begin
        TempENTechCondResponsibles := HTTPRIOENTechCondResponsibles as ENTechCondResponsiblesControllerSoapPort;
        ENTechCondResponsiblesObj := TempENTechCondResponsibles.getObject(ENTechConditionsServicesObj.techCondResponsiblesRef.code);
        if ENTechCondResponsiblesObj <> nil then
        begin
          edtResponsiblePerson.Text := ENTechCondResponsiblesObj.responsibleFIO;
        end;
      end;

    {
    if ENTechConditionsServicesObj.contragentTypeRef <> nil then
      if ENTechConditionsServicesObj.contragentTypeRef.code <> LOW_INT then
        rgContragentType.ItemIndex := ENTechConditionsServicesObj.contragentTypeRef.code - 1;
    }
    
    actUpdateContragentExecute(Self);
  end;

  if (DialogState = dsInsert) then
  begin
    cbbENTechContragentFormContragentFormName.ItemIndex:= 0;

    //HideControls([btnPrintContract, gbContragents, btnPrintBill]);

    edtTyServicesSumma.Text := '0.00';
    //edtContractNumber.Text := 'AUTO';
  end;

    //pcTechConditionServices.ActivePage := tsMain;
    //pc1.ActivePage := ts1;
    //TBItem1.Action :=  actViewActHoz;

end;

procedure TfrmENServicesCalculationEdit.actUpdateCAIExecute(Sender: TObject);
var
  TempENServices2CalcAdditionalItems: ENServices2CalcAdditionalItemsControllerSoapPort;
  i,j,z: Integer;
  ENServices2CalcAdditionalItemsList: ENServices2CalcAdditionalItemsShortList;
  CAIFilter :  ENServices2CalcAdditionalItemsFilter;
begin

   for z:=1 to sgENServices2CalcAdditionalItems.RowCount-1 do
   for j:=0 to sgENServices2CalcAdditionalItems.ColCount-1 do
     sgENServices2CalcAdditionalItems.Cells[j,z]:='';

  SetGridHeaders(ENServices2CalcAdditionalItemsHeaders, sgENServices2CalcAdditionalItems.ColumnHeaders);
  TempENServices2CalcAdditionalItems :=  HTTPRIOENServices2CalcAdditionalItems as ENServices2CalcAdditionalItemsControllerSoapPort;

     CAIFilter := ENServices2CalcAdditionalItemsFilter.Create;
     SetNullIntProps(CAIFilter);
     SetNullXSProps(CAIFilter);
     CAIFilter.servicesObjectRef := ENServicesObjectRef.Create;
     CAIFilter.servicesObjectRef.code := ENServicesObjectObj.code;


  ENServices2CalcAdditionalItemsList := TempENServices2CalcAdditionalItems.getScrollableFilteredList(CAIFilter,0,-1);
  CAILastCount:=High(ENServices2CalcAdditionalItemsList.list);

  if CAILastCount > -1 then
     sgENServices2CalcAdditionalItems.RowCount:=CAILastCount+2
  else
     sgENServices2CalcAdditionalItems.RowCount:=2;

   with sgENServices2CalcAdditionalItems do
    for i:=0 to CAILastCount do
      begin
        Application.ProcessMessages;
        if ENServices2CalcAdditionalItemsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENServices2CalcAdditionalItemsList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := ENServices2CalcAdditionalItemsList.list[i].calcAdditionalItemTypeRefName;

        if ENServices2CalcAdditionalItemsList.list[i].summa = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENServices2CalcAdditionalItemsList.list[i].summa.DecimalString;
        if ENServices2CalcAdditionalItemsList.list[i].countgen = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENServices2CalcAdditionalItemsList.list[i].countgen.DecimalString;
        Cells[4,i+1] := ENServices2CalcAdditionalItemsList.list[i].comment;

        CAILastRow:=i+1;
        sgENServices2CalcAdditionalItems.RowCount:=CAILastRow+1;
      end;

    CAIColCount:=CAIColCount+1;
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

procedure TfrmENServicesCalculationEdit.actUpdateContragentExecute(
  Sender: TObject);
var
  TempENContragent: ENContragentControllerSoapPort;
  i, LastCount: Integer;
  ENContragentList: ENContragentShortList;
  ENContragentFilt : ENContragentFilter;
begin
  if ENTechConditionsServicesObj = nil then
    raise Exception.Create('NET-4231 Не знайдено зв''язаний об''єкт [ENTechConditionsServices]!');

  if ENTechConditionsServicesObj.code = LOW_INT then
    raise Exception.Create('NET-4231 Не знайдено зв''язаний об''єкт [ENTechConditionsServices]!');
    
  ClearGrid(sgENContragent);

  TempENContragent :=  HTTPRIOENContragent as ENContragentControllerSoapPort;

  ENContragentFilt := ENContragentFilter.Create;
  SetNullIntProps(ENContragentFilt);
  SetNullXSProps(ENContragentFilt);

  ENContragentFilt.techCondServicesRef := ENTechConditionsServicesRef.Create;
  ENContragentFilt.techCondServicesRef.code := ENTechConditionsServicesObj.code;

  ENContragentList := TempENContragent.getScrollableFilteredList(ENContragentFilter(ENContragentFilt),0,-1);

  LastCount:=High(ENContragentList.list);

  if LastCount > -1 then
     sgENContragent.RowCount:=LastCount+2
  else
     sgENContragent.RowCount:=2;

   with sgENContragent do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENContragentList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENContragentList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENContragentList.list[i].contragentName;
        Cells[2,i+1] := ENContragentList.list[i].contragentAddress;
        Cells[3,i+1] := ENContragentList.list[i].contragentAddressWork;
        Cells[4,i+1] := ENContragentList.list[i].contragentPosition;
        Cells[5,i+1] := ENContragentList.list[i].contragentOkpo;
        Cells[6,i+1] := ENContragentList.list[i].contragentBankAccount;
        Cells[7,i+1] := ENContragentList.list[i].contragentBankName;
        Cells[8,i+1] := ENContragentList.list[i].contragentBankMfo;
        Cells[9,i+1] := ENContragentList.list[i].contragentBossName;
        Cells[10,i+1] := ENContragentList.list[i].contragentPassport;
        if ENContragentList.list[i].warrantDate = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := XSDate2String(ENContragentList.list[i].warrantDate);
        Cells[12,i+1] := ENContragentList.list[i].warrantNumber;
        Cells[13,i+1] := ENContragentList.list[i].warrantFIO;
        Cells[14,i+1] := ENContragentList.list[i].warrantPassport;
        Cells[15,i+1] := ENContragentList.list[i].warrantAddress;
        //LastRow:=i+1;
        sgENContragent.RowCount := i+2;
      end;
   //ColCount:=ColCount+1;
   sgENContragent.Row:=1;

end;

procedure TfrmENServicesCalculationEdit.btnCalculatePaySumClick(
  Sender: TObject);
var
  TempENPriconnectionData : ENPriconnectionDataControllerSoapPort;
  TempENTechConditionsServices : ENTechConditionsServicesControllerSoapPort;
  servicesCalculateObj : ENTechConditionsServices;
begin
  if ENTechConditionsServicesObj = nil then
    raise Exception.Create('NET-4231 Не знайдено зв''язаний об''єкт [ENTechConditionsServices]!');

  if (ENPriconnectionDataObj <> nil) then
  begin
    TempENPriconnectionData := HTTPRIOENPriconnectionData as ENPriconnectionDataControllerSoapPort;
    if (ENPriconnectionDataObj.powerMaxCurrent = nil) then
      ENPriconnectionDataObj := TempENPriconnectionData
         .getCalculationDataObject(ENPriconnectionDataObj.elementRef.code, ENTechConditionsServicesObj.code, PRIMARY_SUBSTATION);

    if ENPriconnectionDataObj.techCondServRef = nil then ENPriconnectionDataObj.techCondServRef := ENTechConditionsServicesRef.Create();
      ENPriconnectionDataObj.techCondServRef.code := ENTechConditionsServicesObj.code;
  end else
  begin
    Application.MessageBox(PChar('Спочатку потрібно обрати місце забезпечення потужності об’єкта Замовника!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;


  if (isNotCalculated) then
    frmENPriconnectionDataEdit := TfrmENPriconnectionDataEdit.Create(Application, dsEdit)
  else frmENPriconnectionDataEdit := TfrmENPriconnectionDataEdit.Create(Application, Self.DialogState);


  try
    frmENPriconnectionDataEdit.elementCode := ENPriconnectionDataObj.elementRef.code;
    frmENPriconnectionDataEdit.edtPowerContractNewTU.Text := edtTyServicesPower.Text;

    if frmENPriconnectionDataEdit.ShowModal = mrOk then
      begin
      end;
  except
    on EConvertError do Exit;
  end;

  TempENTechConditionsServices := HTTPRIOENTechConditionsServices as ENTechConditionsServicesControllerSoapPort;
  servicesCalculateObj := TempENTechConditionsServices.getObject(ENTechConditionsServicesObj.code);
  if servicesCalculateObj.tySummaGen <> nil then
    edtTySummaGen.Text := servicesCalculateObj.tySummaGen.DecimalString;
  if servicesCalculateObj.tySummaVat <> nil then
    edtTySummaVat.Text := servicesCalculateObj.tySummaVat.DecimalString;
  if servicesCalculateObj.tyServicesSumma <> nil then
    edtTyServicesSumma.Text := servicesCalculateObj.tyServicesSumma.DecimalString;

end;


procedure TfrmENServicesCalculationEdit.btnPrintCalculateClick(
  Sender: TObject);
var
  tcsObject : ENTechConditionsServices;
  TempENTechConditionsServices : ENTechConditionsServicesControllerSoapPort;
  argNames, args : ArrayOfString;
  reportName : String;
  isSolidary : Boolean;
begin

  if ENTechConditionsServicesObj = nil then
    raise Exception.Create('NET-4231 Не знайдено зв''язаний об''єкт [ENTechConditionsServices]!');

  TempENTechConditionsServices := HTTPRIOENTechConditionsServices as ENTechConditionsServicesControllerSoapPort;
  tcsObject := TempENTechConditionsServices.getObject(ENTechConditionsServicesObj.code);

  // 05.06.2013 +++ проверка солидарности договора (одновременное участие в присоединении)
  isSolidary := DMReports.checkSolidaryConnections(tcsObject.code);

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'tcsCode';
  args[0] := IntToStr(tcsObject.code);

  if (tcsObject.calcTypeRef.code = CONNECTIONCALCTYPE_NOT_ABOVE_RESERVE) then
    reportName := 'TechConditions/Connection/ConnectionCostNotAboveReserve'

  else if (isSolidary) then reportName := 'TechConditions/Connection/UnionGroupConnectionCost'

  else reportName := 'TechConditions/Connection/ConnectionCost';

  makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmENServicesCalculationEdit.FormDestroy(Sender: TObject);
begin
  if Assigned(ENTechConditionsServicesObj) then
    ENTechConditionsServicesObj.Free;
  inherited;
end;

procedure TfrmENServicesCalculationEdit.sgENPlanWorkClick(Sender: TObject);
var
  TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  plan: ENPlanWork;
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

    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
    plan := TempENPlanWork.getObject(pCode);
    if ((plan.status.code = ENPLANWORKSTATUS_GOOD)
        and (plan.kind.code <> ENPLANWORKKIND_CALCULATION) and (plan.kind.code <> ENPLANWORKKIND_CALCULATION_SINGLE)) then
      DisableActions([actEditPlan], False)
    else DisableActions([actEditPlan]);

    
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

function TfrmENServicesCalculationEdit.getContragentsCount: Integer;
var
  TempENContragent: ENContragentControllerSoapPort;
  contragentsFilter: ENContragentFilter;
  contragentsArr: ENContragentController.ArrayOfInteger;
begin
  Result := 0;

  if ENTechConditionsServicesObj = nil then
    Exit;  

  if ENTechConditionsServicesObj.code = LOW_INT then
    Exit;

  TempENContragent := HTTPRIOENContragent as ENContragentControllerSoapPort;

  contragentsFilter := ENContragentFilter.Create;
  SetNullIntProps(contragentsFilter);
  SetNullXSProps(contragentsFilter);

  contragentsFilter.techCondServicesRef := ENTechConditionsServicesRef.Create;
  contragentsFilter.techCondServicesRef.code := ENTechConditionsServicesObj.code; //techConditionsServicesCode;

  contragentsArr := TempENContragent.getScrollableFilteredCodeArray(contragentsFilter, 0, -1);

  Result := High(contragentsArr) + 1;
end;

function TfrmENServicesCalculationEdit.getReconnectionTUVisibility(contragentTypeCode: Integer): Boolean;
begin
  Result := false;
  if ENServicesObjectObj = nil then Exit;

  if not isAvailableBillingIPAddress then
    isAvailableBillingIPAddress := isAvailableBillingIP(ENServicesObjectObj.department.code);

  Result := ((isWorkConnection or replaceCounter or parameterizationCounter or isContainsKSU or (ENServicesObjectObj.personalAccountCode <> LOW_INT))
            and (isAvailableBillingIPAddress)
            and (contragentTypeCode in [ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL, ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NONBUDGET,
                                        ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET]));
end;

procedure TfrmENServicesCalculationEdit.actViewCAIExecute(Sender: TObject);
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

procedure TfrmENServicesCalculationEdit.actViewContragentExecute(
  Sender: TObject);
var TempENContragent: ENContragentControllerSoapPort;
begin
 TempENContragent := HTTPRIOENContragent as ENContragentControllerSoapPort;
   try
     ENContragentObj := TempENContragent.getObject(StrToInt(sgENContragent.Cells[0,sgENContragent.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENContragentEdit:=TfrmENContragentEdit.Create(Application, dsView);
  try
    frmENContragentEdit.ShowModal;
  finally
    frmENContragentEdit.Free;
    frmENContragentEdit:=nil;
  end;
end;

procedure TfrmENServicesCalculationEdit.actInsertContragentExecute(
  Sender: TObject);
var
  TempENContragent: ENContragentControllerSoapPort;
  contragentsFilter: ENContragentFilter;
  contragentsArr: ENContragentController.ArrayOfInteger;
begin
  if ENTechConditionsServicesObj = nil then
    raise Exception.Create('NET-4231 Не знайдено зв''язаний об''єкт [ENTechConditionsServices]!');

  if ENTechConditionsServicesObj.code = LOW_INT then
    raise Exception.Create('NET-4231 Не знайдено зв''язаний об''єкт [ENTechConditionsServices]!');

  ///// Если договор индивидуальный, то добавлять больше одного контрагента нельзя
  if (ENTechConditionsServicesObj.contragentForm.code = ENTECHCONDITIONSSERVICES_FORM_INDIVIDUAL) then
  begin
    if getContragentsCount() > 0 then
    begin
      Application.MessageBox(PChar('В індивідуальних договорах може бути лише один замовник! Змініть вид договора на "Солідарний"!'),
                             PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;
  end;
  /////

  // TempENContragent := HTTPRIOENContragent as ENContragentControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENContragentObj:=ENContragent.Create;
  SetNullIntProps(ENContragentObj);
  SetNullXSProps(ENContragentObj);

   //ENContragentObj.warrantDate:= TXSDate.Create;
  ENContragentObj.techCondServicesRef := ENTechConditionsServicesRef.Create;
  ENContragentObj.techCondServicesRef.code := ENTechConditionsServicesObj.code;

  try
    frmENContragentEdit:=TfrmENContragentEdit.Create(Application, dsInsert);

    if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART) then
      frmENContragentEdit.standartConnections := True;

    try
      if frmENContragentEdit.ShowModal = mrOk then
      begin
        if ENContragentObj<>nil then
        begin
            //TempENContragent.add(ENContragentObj);
            actUpdateContragentExecute(Sender);
            {
            // Если кол-во заказчиков > 1, автоматом ставим вид договора "Солидарный", иначе - индивидуальный
            if getContragentsCount(ENTechConditionsServicesObj.code) > 1 then
              cbbENTechContragentFormContragentFormName.ItemIndex := ENTECHCONDITIONSSERVICES_FORM_SOLIDARITY
            else
              cbbENTechContragentFormContragentFormName.ItemIndex := ENTECHCONDITIONSSERVICES_FORM_INDIVIDUAL;
            }
        end;
      end;
    finally
      frmENContragentEdit.Free;
      frmENContragentEdit:=nil;
    end;
  finally
    ENContragentObj.Free;
  end;
end;

procedure TfrmENServicesCalculationEdit.actDeleteContragentExecute(
  Sender: TObject);
Var TempENContragent: ENContragentControllerSoapPort;
  ObjCode: Integer;
begin
 TempENContragent := HTTPRIOENContragent as ENContragentControllerSoapPort;
   try
     ObjCode := StrToInt(sgENContragent.Cells[0,sgENContragent.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Замовник) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENContragent.remove(ObjCode);
      actUpdateContragentExecute(Sender);
      {
      // Если кол-во заказчиков > 1, автоматом ставим вид договора "Солидарный", иначе - индивидуальный
      if getContragentsCount(ENTechConditionsServicesObj.code) > 1 then
        cbbENTechContragentFormContragentFormName.ItemIndex := ENTECHCONDITIONSSERVICES_FORM_SOLIDARITY
      else
        cbbENTechContragentFormContragentFormName.ItemIndex := ENTECHCONDITIONSSERVICES_FORM_INDIVIDUAL;
      }
  end;
end;

procedure TfrmENServicesCalculationEdit.actEditContragentExecute(
  Sender: TObject);
Var TempENContragent: ENContragentControllerSoapPort;
begin
 TempENContragent := HTTPRIOENContragent as ENContragentControllerSoapPort;
   try
     ENContragentObj := TempENContragent.getObject(StrToInt(sgENContragent.Cells[0,sgENContragent.Row]));
   except
   on EConvertError do Exit;
  end;

  frmENContragentEdit := TfrmENContragentEdit.Create(Application, dsEdit);

  if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART) then
    frmENContragentEdit.standartConnections := True;

  try
    if frmENContragentEdit.ShowModal= mrOk then
      begin
        //TempENContragent.save(ENContragentObj);
        actUpdateContragentExecute(Sender);
      end;
  finally
    frmENContragentEdit.Free;
    frmENContragentEdit:=nil;
  end;
end;

function TfrmENServicesCalculationEdit.FillENTechConditionsServices(): boolean;
var TempENTechConditionsServices: ENTechConditionsServicesControllerSoapPort;
    contragentsCount: Integer;
    ENTechCondResponsiblesObj: ENTechCondResponsibles;
begin
  Result := true;
  //EXIT; // ПОКА НЕ ПРОВЕРЯЕМ ПОЛЯ

  if ENTechConditionsServicesObj = nil then
    //raise Exception.Create('NET-4231 Не знайдено зв''язаний об''єкт [ENTechConditionsServices]!');
    Exit;

  if ENTechConditionsServicesObj.code = LOW_INT then
    //raise Exception.Create('NET-4231 Не знайдено зв''язаний об''єкт [ENTechConditionsServices]!');
    Exit;

  if (ModalResult = mrOk) and ((DialogState = dsEdit) {or (DialogState = dsInsert)}) then
    if not NoBlankValues([
        edtContractNumber
        //edtTechConditionsNumber   ,
        , edtContractDateServices
        //, edtContractDateFinal //SUPP-2609
        //edtContragentName
        , edtENDepartmentDepartmentName
        , edtTyServicesPower
        , edtCNPackCode
        //, edtExecutionTerm
       ])  then
    begin
        Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
        ModalResult := mrNone;
        Result := false;
        Exit;
    end
    else

    begin

      if (not edtContractDateFinal.Checked) and
         //(ENTechConditionsServicesObj.connectionKindRef.code <> ENCONNECTIONKIND_GENERAL_CONNECTION) //SUPP-2609
         (not (ENTechConditionsServicesObj.connectionKindRef.code in [ENCONNECTIONKIND_GENERAL_CONNECTION,
                                                                      ENCONNECTIONKIND_UNDEFINED])) then
      begin
        Application.MessageBox(PChar('Введіть кінцеву дату дії договору!'), PChar('Увага!'), MB_ICONWARNING);
        pcCalculation.ActivePage := tsPriconnection;
        edtContractDateFinal.SetFocus;
        ModalResult := mrNone;
        Result := false;
        Exit;
      end;

      if ((ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION)
           and (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART)) then
           // SUPP-1240... +++ для строй.площадок - оставить выбор тарифа, сумма при этом нулевая..
           // and (not cbBuildersArea.Checked) ) then
      begin
        if not NoBlankValues([edtConnectionTariffName, edtConnectionTariffValue])  then
        begin
          Application.MessageBox(PChar('Оберіть ставку плати за стандартне приєднання !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
          pcCalculation.ActivePage := tsPriconnection;
          ModalResult := mrNone;
          Result := false;
          Exit;
        end
      end;

      if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART) then
        if (edtExecutionTerm.Text = '') then
        begin
          Application.MessageBox(PChar('Введіть термін виконання договору!'), PChar('Увага !'), MB_ICONWARNING);
          pcCalculation.ActivePage := tsPriconnection;
          edtExecutionTerm.SetFocus;
          ModalResult := mrNone;
          Result := false;
          Exit;
        end;

      if rgContragentType.ItemIndex = -1 then
      begin
        Application.MessageBox(PChar('Оберіть тип контрагента!'),
                               PChar('Увага!'), MB_ICONWARNING);
        pcCalculation.ActivePage := tsGeneral;
        ModalResult := mrNone;
        Result := false;
        Exit;
      end;

      if (DialogState = dsEdit) then
      begin
        ///// Если договор индивидуальный, то добавлять больше одного контрагента нельзя
        if (cbbENTechContragentFormContragentFormName.ItemIndex + 1 = ENTECHCONDITIONSSERVICES_FORM_INDIVIDUAL) then
        begin
          contragentsCount := getContragentsCount();

          if contragentsCount > 1 then
          begin
            Application.MessageBox(PChar('В індивідуальних договорах може бути лише один замовник! Змініть вид договора на "Солідарний"!'),
                                   PChar('Увага!'), MB_ICONWARNING);
            ModalResult := mrNone;
            Result := false;
            Exit;
          end;
        end;
        /////
      end;

       TempENTechConditionsServices := HTTPRIOENTechConditionsServices as ENTechConditionsServicesControllerSoapPort;

       if (cbBuildersArea.Checked) then
         ENTechConditionsServicesObj.buildersArea := ENTECHCONDITIONS_BUILDERSAREA_YES
       else ENTechConditionsServicesObj.buildersArea := ENTECHCONDITIONS_BUILDERSAREA_NO;

       if (chkBaseStation.Checked) then
         ENTechConditionsServicesObj.baseStation :=
           ENTECHCONDITIONS_BASESTATION_YES
       else
         ENTechConditionsServicesObj.baseStation :=
           ENTECHCONDITIONS_BASESTATION_NO;

       if (cbSmallArchFrm.Checked) then
         ENTechConditionsServicesObj.smallArchFrm :=
           ENTECHCONDITIONS_SMALLARCHFRM_YES
       else
         ENTechConditionsServicesObj.baseStation :=
           ENTECHCONDITIONS_SMALLARCHFRM_NO;

       if (edtContractDateFinal.checked) then
       begin
         if ENTechConditionsServicesObj.contractDateFinal = nil then
            ENTechConditionsServicesObj.contractDateFinal := TXSDate.Create;
         ENTechConditionsServicesObj.contractDateFinal.XSToNative(GetXSDate(edtContractDateFinal.DateTime));
       end
       else
         ENTechConditionsServicesObj.contractDateFinal := nil;


       ENTechConditionsServicesObj.contractNumber := edtContractNumberServices.Text;

       if edtContractDateServices.checked then
       begin
         if ENTechConditionsServicesObj.contractDate = nil then
            ENTechConditionsServicesObj.contractDate := TXSDate.Create;
         ENTechConditionsServicesObj.contractDate.XSToNative(GetXSDate(edtContractDateServices.DateTime));
       end
       else
         ENTechConditionsServicesObj.contractDate := nil;



       if (ENTechConditionsServicesObj.tyServicesSumma = nil ) then
         ENTechConditionsServicesObj.tyServicesSumma := TXSDecimal.Create;
       if edtTyServicesSumma.Text <> '' then
         ENTechConditionsServicesObj.tyServicesSumma.decimalString := edtTyServicesSumma.Text 
       else
         ENTechConditionsServicesObj.tyServicesSumma := nil;

       if (ENTechConditionsServicesObj.tyServicesPower = nil ) then
         ENTechConditionsServicesObj.tyServicesPower := TXSDecimal.Create;
       if edtTyServicesPower.Text <> '' then
         ENTechConditionsServicesObj.tyServicesPower.decimalString := edtTyServicesPower.Text
       else
         ENTechConditionsServicesObj.tyServicesPower := nil;

       ENTechConditionsServicesObj.commentServicesGen := edtCommentServicesGen.Text;

       ENTechConditionsServicesObj.contragentForm := ENTechContragentForm.Create;
       ENTechConditionsServicesObj.contragentForm.code := cbbENTechContragentFormContragentFormName.ItemIndex+1;


       if (ENTechConditionsServicesObj.tysummagen = nil ) then
         ENTechConditionsServicesObj.tysummagen := TXSDecimal.Create;
        if edttysummagen.Text <> '' then
         ENTechConditionsServicesObj.tysummagen.decimalString := edttysummagen.Text
       else
         ENTechConditionsServicesObj.tysummagen := nil;
       if (ENTechConditionsServicesObj.tysummavat = nil ) then
         ENTechConditionsServicesObj.tysummavat := TXSDecimal.Create;
         if edttysummavat.Text <> '' then
         ENTechConditionsServicesObj.tysummavat.decimalString := edttysummavat.Text
       else
         ENTechConditionsServicesObj.tysummavat := nil;

      ENTechConditionsServicesObj.executionTerm := edtExecutionTerm.Text;

      if ENTechConditionsServicesObj.contragentTypeRef = nil then
        ENTechConditionsServicesObj.contragentTypeRef := ENTechContragentTypeRef.Create;

      case rgContragentType.ItemIndex + 1 of
        {1, 4: }
        ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL,
        ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL_NOREZIDENT:
          ENTechConditionsServicesObj.contragentTypeRef.code := ENTECHCONTRAGENT_TYPE_PHYSICAL;

        {2, 3, 5: }
        ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET,
        ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NONBUDGET,
        ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NOREZIDENT:
          ENTechConditionsServicesObj.contragentTypeRef.code := ENTECHCONTRAGENT_TYPE_JURIDICAL;
      end;
      //ENTechConditionsServicesObj.contragentTypeRef.code := rgContragentType.ItemIndex + 1;

      ///// 23.03.12 Пытаемся определить ответственное лицо по мощности и подразделению в договоре
      // 17.07.12 NET-2498
      //ENTechCondResponsiblesObj := TempENTechConditionsServices.getResponsiblePerson(ENTechConditionsServicesObj.tyServicesPower,
      //                                                                               ENTechConditionsServicesObj.department.code);
      ENTechCondResponsiblesObj := TempENTechConditionsServices.getResponsiblePerson(ENTechConditionsServicesObj);
      if ENTechCondResponsiblesObj = nil then
      begin
        Application.MessageBox(PChar('За вказаними Вами потужністю та підрозділом неможливо визначити відповідальну особу!'),
                               PChar('Увага!'), MB_ICONWARNING);
        ModalResult := mrNone;
        Result := false;
        Exit;
      end;

      if ENTechCondResponsiblesObj.code = LOW_INT then
      begin
        Application.MessageBox(PChar('За вказаними Вами потужністю та підрозділом неможливо визначити відповідальну особу!'),
                               PChar('Увага!'), MB_ICONWARNING);
        ModalResult := mrNone;
        Result := false;
        Exit;
      end;

      ENTechConditionsServicesObj.techCondResponsiblesRef := ENTechCondResponsiblesRef.Create;
      ENTechConditionsServicesObj.techCondResponsiblesRef.code := ENTechCondResponsiblesObj.code;
      edtResponsiblePerson.Text := ENTechCondResponsiblesObj.responsibleFIO;
      /////

      ENTechConditionsServicesObj.isSea := Ord(chbIsSea.Checked);

      {
      if DialogState = dsInsert then
      begin
        ENTechConditionsServicesObj.code:=low(Integer);
        techConditionsServicesCode := TempENTechConditionsServices.add(ENTechConditionsServicesObj);
      end
      else

      if DialogState = dsEdit then
      begin
        TempENTechConditionsServices.save(ENTechConditionsServicesObj);
      end;
      }
    end;
end;

procedure TfrmENServicesCalculationEdit.calcSum();
var curr_nds , curr_nds_coeff : Double;
begin
  edtTySummaGen.Text := '0';
  edtTySummaVat.Text := '0';
  edtTyServicesSumma.Text := '0';

  if ENTechConditionsServicesObj = nil then Exit;
  if ENTechConditionsServicesObj.connectionKindRef = nil then Exit;

  if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART) then
    if (edtConnectionTariffValue.Text <> '') and (edtTyServicesPower.Text <> '')
        //SUPP-1240... +++ для строй.площадок, базовых станций мобильной связи,
        //малых архитектруных форм - оставить выбор тарифа,
        //сумма при этом нулевая..
         and (not cbBuildersArea.Checked)
         and (not chkBaseStation.Checked)
         and (not cbSmallArchFrm.Checked)
         then
    begin
      { NET-4284  ндс определим по дате договора
      edtTySummaGen.Text := FloatToStr( conv(StrToFloat(edtTyServicesPower.Text) * StrToFloat(edtConnectionTariffValue.Text)*1000*1..2, 2) );
      edtTySummaVat.Text := FloatToStr( conv(StrToFloat(edtTySummaGen.Text) / 6 , 2) );
      }
      curr_nds:=   DMReports.getStandartKoefInPeriod(ENSTANDARDCONST_PDV , ENServicesObjectObj.contractDateServices.AsDate );
      curr_nds_coeff := curr_nds / 100 + 1;
      edtTySummaGen.Text := FloatToStr( conv(StrToFloat(edtTyServicesPower.Text) * StrToFloat(edtConnectionTariffValue.Text)*1000*curr_nds_coeff, 2) );
      edtTySummaVat.Text := FloatToStr( conv(StrToFloat(edtTySummaGen.Text) - (StrToFloat(edtTySummaGen.Text) / curr_nds_coeff ) , 2) );

      edtTyServicesSumma.Text := edtTySummaGen.Text;
    end else
    begin
      edtTySummaGen.Text := '0';
      edtTySummaVat.Text := '0';
      edtTyServicesSumma.Text := '0';
    end;
end;

procedure TfrmENServicesCalculationEdit.spbConnectionTariffValusClick(
  Sender: TObject);
var
  frmENConnectionTariffShow : TfrmENConnectionTariffShow;
  ENConnectionTariffShortObj : ENConnectionTariffShort;
  TempENConnectionTariff : ENConnectionTariffControllerSoapPort;
begin
   TempENConnectionTariff := HTTPRIOENConnectionTariff as ENConnectionTariffControllerSoapPort;

   frmENConnectionTariffShow := TfrmENConnectionTariffShow.Create(Application,fmNormal);
   try
      with frmENConnectionTariffShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTechConditionsServicesObj.tariffEntryRef = nil then ENTechConditionsServicesObj.tariffEntryRef := ENConnectionTariffEntryRef.Create;

               edtConnectionTariffName.Text := GetReturnValue(sgENConnectionTariff, 1);
               edtConnectionTariffValue.Text := GetReturnValue(sgENConnectionTariff, 2);

               ENConnectionTariffShortObj := TempENConnectionTariff.getShortObject(StrToInt(GetReturnValue(sgENConnectionTariff, 0)));
               ENTechConditionsServicesObj.tariffEntryRef.code := ENConnectionTariffShortObj.tariffEntryCode;

               calcSum();
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENConnectionTariffShow.Free;
   end;
end;

procedure TfrmENServicesCalculationEdit.sgENPlanWorkRightClickCell(
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

procedure TfrmENServicesCalculationEdit.edtTyServicesPowerChange(
  Sender: TObject);
begin
  calcSum();
end;

procedure TfrmENServicesCalculationEdit.plansPopup(plan: ENPlanWork);
var allowCloseUnclose: Boolean;
begin
  if plan = nil then
  begin
    Exit;
  end;

//  DisableActions([actClosePlan, actUnClosePlan], false);
//  HideActions([actClosePlan, actUnClosePlan], false);

  DisableActions([actAddActFailure, actDeleteActFailure, actEditActFailure]);

  if (plan.kind.code = ENPLANWORKKIND_NPZ) then
      DisableActions([actAddActFailure, actDeleteActFailure, actEditActFailure],false);

  DisableActions([actClosePlan, actUnClosePlan]);

  allowCloseUnclose := false;

  if not (ENServicesObjectObj.contractStatusRef.code in [ENSERVICESOBJECTSTATUS_COMPLETED,
                                                         ENSERVICESOBJECTSTATUS_TERMINATED]) then
  begin
    if (ENServicesObjectObj.statusRef.code <> ENSERVICESOBJECT_FINSTATUS_CLOSED) and
       (ENServicesObjectObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
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

{*******************************************************************************
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

                           ///// 11.08.10

                           // надо прикрыть такое, потому что Олег Василенко
                           // сегодня спокойно попатчил свой уже утвержденный
                           // текущий план, воспользовавшись данной фишкой ;-)
                           // (а этот план уже запретил редактировать ОМТС)

                            or
                            (plan.status.code = ENPLANWORKSTATUS_LOCKED)

                           /////
                          );
   end
   else
   begin
      actUndoConfirm.Enabled := ((plan.kind.code = ENPLANWORKKIND_YEAR) and (plan.yearGen = ENPLANWORK_YEAR_GOOD));
   end;



  // перенос сроков залочим ;)
  actMovePlan.Enabled :=   (plan.kind.code = ENPLANWORKKIND_CURRENT) and
                           ((plan.status.code = ENPLANWORKSTATUS_GOOD) or (plan.status.code = ENPLANWORKSTATUS_LOCKED));


  // изменение дат и исполнителя !!!
  actSaveAddInfo.Enabled := (plan.kind.code in [ ENPLANWORKKIND_CURRENT, ENPLANWORKKIND_NPZ] ) and
                            (plan.status.code <> ENPLANWORKSTATUS_GOOD);
*******************************************************************************}

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

procedure TfrmENServicesCalculationEdit.actEditPlanExecute(
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
        //and
        //not ( tPlan.kind.code in [ENPLANWORKKIND_CURRENT ])
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
    frmENPlanWorkEdit.showTransportRoute := showTransportRoute;

    try
      //SUPP-4339
      frmENPlanWorkEdit.isPriconnection := (
        ENServicesObjectObj.contractTypeRef.code =
        ENSERVICESOBJECTTYPE_CONNECTION);
      frmENPlanWorkEdit.soElementCode := ENServicesObjectObj.element.code;

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


procedure TfrmENServicesCalculationEdit.actEditService2FKInfoExecute(
  Sender: TObject);
var
  TempENServicesObject2FKInfo: ENServicesObject2FKInfoControllerSoapPort;
begin
  TempENServicesObject2FKInfo := HTTPRIOENServicesObject2FKInfo as ENServicesObject2FKInfoControllerSoapPort;
  try
    ENServicesObject2FKInfoObj := TempENServicesObject2FKInfo.getObject(StrToInt(sgENServicesObject2FKInfo.Cells[0,sgENServicesObject2FKInfo.Row]));
  except
    on EConvertError do Exit;
  end;

  selectedRow := sgENServicesObject2FKInfo.Row;
  frmENServicesObject2FKInfoEdit:=TfrmENServicesObject2FKInfoEdit.Create(Application, dsEdit);

  try
    if frmENServicesObject2FKInfoEdit.ShowModal= mrOk then
      begin
        //TempENServicesObject2FKInfo.save(ENServicesObject2FKInfoObj);
        actUpdateService2FKInfoExecute(Sender);
      end;
  finally
    frmENServicesObject2FKInfoEdit.Free;
    frmENServicesObject2FKInfoEdit:=nil;
  end;

  if sgENServicesObject2FKInfo.RowCount > selectedRow then
    sgENServicesObject2FKInfo.Row := selectedRow
  else
    sgENServicesObject2FKInfo.Row := sgENServicesObject2FKInfo.RowCount - 1;

end;

procedure TfrmENServicesCalculationEdit.actViewPlanExecute(Sender: TObject);
var
  TempENPlanWork : ENPlanWorkControllerSoapPort;
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


  //ShowMessage( ENPlanWorkShort(sgENPlanWork.Objects[0,sgENPlanWork.Row]).statusName );
  //if  Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) <> ENPLANWORKSTATUS_GOOD then
  {if not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION])

      and
      not ( tPlan.kind.code in [ENPLANWORKKIND_CURRENT ])
  then
  begin
      Application.MessageBox(PChar('План затверджений або видалений !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;}


   TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

   frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsView);
   frmENPlanWorkEdit.showTransportRoute := showTransportRoute;

   if (tPlan.typeRef.code = ENPLANWORKTYPE_TRANSPORT) and (tPlan.stateRef.code = ENPLANWORKSTATE_GSM) then
    frmENPlanWorkEdit.isTransport := true;

   if (tPlan.typeRef.code = ENPLANWORKTYPE_SIZ) then
    frmENPlanWorkEdit.isSiz := true;

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

procedure TfrmENServicesCalculationEdit.actViewService2FKInfoExecute(
  Sender: TObject);
var
  TempENServicesObject2FKInfo: ENServicesObject2FKInfoControllerSoapPort;
begin
  TempENServicesObject2FKInfo := HTTPRIOENServicesObject2FKInfo as ENServicesObject2FKInfoControllerSoapPort;
  try
    ENServicesObject2FKInfoObj := TempENServicesObject2FKInfo.getObject(StrToInt(sgENServicesObject2FKInfo.Cells[0,sgENServicesObject2FKInfo.Row]));
  except
    on EConvertError do Exit;
  end;

  selectedRow := sgENServicesObject2FKInfo.Row;
  frmENServicesObject2FKInfoEdit:=TfrmENServicesObject2FKInfoEdit.Create(Application, dsView);

  try
    frmENServicesObject2FKInfoEdit.ShowModal;
  finally
    frmENServicesObject2FKInfoEdit.Free;
    frmENServicesObject2FKInfoEdit:=nil;
  end;

  if sgENServicesObject2FKInfo.RowCount > selectedRow then
    sgENServicesObject2FKInfo.Row := selectedRow
  else
    sgENServicesObject2FKInfo.Row := sgENServicesObject2FKInfo.RowCount - 1;

end;


procedure TfrmENServicesCalculationEdit.actViewServicesConsumerExecute(Sender: TObject);
var
  TempDFDocServicesConsumer: DFDocServicesConsumerControllerSoapPort;
begin
  inherited;
  TempDFDocServicesConsumer := HTTPRIODFDocServicesConsumer as DFDocServicesConsumerControllerSoapPort;

  try
    DFDocServicesConsumerObj := TempDFDocServicesConsumer.getObject(StrToInt(sgDocumentManagement.Cells[0,sgDocumentManagement.Row]));
  except
    on EConvertError do Exit;
  end;

  frmDFDocServicesConsumerEdit := TfrmDFDocServicesConsumerEdit.Create(Application, dsView);
  try
    frmDFDocServicesConsumerEdit.ShowModal;
  finally
    frmDFDocServicesConsumerEdit.Free;
    frmDFDocServicesConsumerEdit:=nil;
  end;
end;


procedure TfrmENServicesCalculationEdit.actInsertPlanExecute(
  Sender: TObject);
var
  TempEnPlanwork: ENPlanWorkControllerSoapPort;
  //y, m, d: Word;
  TempENTechConditionsServices: ENTechConditionsServicesControllerSoapPort;
  tcFilter: ENTechConditionsServicesFilter;
  tcList: ENTechConditionsServicesShortList;
begin
  if DialogState = dsInsert then Exit;

  //if ENTechConditionsServicesObj = nil then Exit;
  //if ENTechConditionsServicesObj.code = LOW_INT then Exit;

  if ENTechConditionsServicesObj = nil then
    raise Exception.Create('NET-4231 Не знайдено зв''язаний об''єкт [ENTechConditionsServices]!');

  if ENTechConditionsServicesObj.code = LOW_INT then
    raise Exception.Create('NET-4231 Не знайдено зв''язаний об''єкт [ENTechConditionsServices]!');

  if getContragentsCount() = 0 then
  begin
    Application.MessageBox(PChar('Спочатку потрібно ввести Замовників!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if ENServicesObjectObj.contractDateServices = nil then
  begin
    Application.MessageBox(PChar('Спочатку введіть дату договору!'),
                           PChar('Увага!'), MB_ICONWARNING);
    if edtContractDateServices.CanFocus then edtContractDateServices.SetFocus;
    Exit;
  end;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsInsert);

  try
    frmENPlanWorkEdit.isTechConditions := True;

    frmENPlanWorkEdit.techCondServicesType := ENTechConditionsServicesObj.techCondServicesType.code;
    if ENTechConditionsServicesObj.connectionKindRef.code <> low(Integer) then
      frmENPlanWorkEdit.connectionKind :=
        ENTechConditionsServicesObj.connectionKindRef.code
    else
      frmENPlanWorkEdit.connectionKind := ENCONNECTIONKIND_GENERAL_CONNECTION;

    frmENPlanWorkEdit.techCondServicesObjCode := ENTechConditionsServicesObj.code;

    frmENPlanWorkEdit.ENPlanWorkObj := ENPlanWork.Create;
    frmENPlanWorkEdit.ENPlanWorkObj.kind := ENPlanWorkKind.Create;
    frmENPlanWorkEdit.ENPlanWorkObj.kind.code := ENPLANWORKKIND_CURRENT;
    frmENPlanWorkEdit.cbPlanWorkKind.ItemIndex := ENPLANWORKKIND_CURRENT -1;
    frmENPlanWorkEdit.cbPlanWorkKind.Enabled := False;

    frmENPlanWorkEdit.ENPlanWorkObj.monthGen := ENTechConditionsServicesObj.contractDate.Month;
    frmENPlanWorkEdit.edtMonthGen.ItemIndex := ENTechConditionsServicesObj.contractDate.Month - 1;

    frmENPlanWorkEdit.ENPlanWorkObj.dateStart := TXSDate.Create;
    //frmENPlanWorkEdit.ENPlanWorkObj.dateStart.XSToNative(GetXSDate(EncodeDate(ENTechConditionsServicesObj.contractDate.Year, ENTechConditionsServicesObj.contractDate.Month, 1)));
    frmENPlanWorkEdit.ENPlanWorkObj.dateStart.XSToNative(GetXSDate(EncodeDate(ENServicesObjectObj.contractDateServices.Year,
                                                                              ENServicesObjectObj.contractDateServices.Month, 1)));

    frmENPlanWorkEdit.ENPlanWorkObj.departmentRef := ENDepartmentRef.Create;
    frmENPlanWorkEdit.ENPlanWorkObj.departmentRef.code := ENServicesObjectObj.department.code; //ENTechConditionsServicesObj.department.code;
    frmENPlanWorkEdit.edtDepartment.Text := ENServicesObjectObj.department.name; //ENTechConditionsServicesObj.department.name;

    frmENPlanWorkEdit.ENPlanWorkObj.budgetRef := ENDepartmentRef.Create;
    frmENPlanWorkEdit.ENPlanWorkObj.budgetRef.code := ENBUDGET_VRTUVD;
    frmENPlanWorkEdit.edtENBudgetName.Text := 'ВРТУВД';

    frmENPlanWorkEdit.ENPlanWorkObj.responsibilityRef := ENDepartmentRef.Create;
    frmENPlanWorkEdit.ENPlanWorkObj.responsibilityRef.code := ENRESPONSIBILITY_VRTUVD;
    frmENPlanWorkEdit.edtResponsibility.Text := 'ВРТУВД';

    frmENPlanWorkEdit.ENPlanWorkObj.formRef := ENPlanWorkFormRef.Create;
    frmENPlanWorkEdit.ENPlanWorkObj.formRef.code := ENPLANWORKFORM_NOPLANNED;
    frmENPlanWorkEdit.cbENPlanWorkFormName.ItemIndex := ENPLANWORKFORM_NOPLANNED - 1;

   { NET-1997 в план кидаем номер договора ФИН если тип договора реализация                     
    if ENTechConditionsServicesObj.techCondServicesType.code = 2  then
    begin
    frmENPlanWorkEdit.ENPlanWorkObj.priConnectionNumber := ENTechConditionsServicesObj.fincontractNumber;
    frmENPlanWorkEdit.edtPriConnectionNumber.Text := ENTechConditionsServicesObj.finContractNumber;
    end
    else
    begin  }
    frmENPlanWorkEdit.ENPlanWorkObj.priConnectionNumber := ENServicesObjectObj.contractNumberServices; //ENTechConditionsServicesObj.contractNumber;
    frmENPlanWorkEdit.edtPriConnectionNumber.Text := ENServicesObjectObj.contractNumberServices; //ENTechConditionsServicesObj.contractNumber;
   { end; }



    ///// Генерим примечание
    TempENTechConditionsServices := HTTPRIOENTechConditionsServices as ENTechConditionsServicesControllerSoapPort;

    // Чтобы получить красивый список Заказчиков (через зпт.), дернем лист
    tcFilter := ENTechConditionsServicesFilter.Create;
    SetNullIntProps(tcFilter);
    SetNullXSProps(tcFilter);
    tcFilter.code := ENTechConditionsServicesObj.code;

    tcList := TempENTechConditionsServices.getScrollableFilteredList(tcFilter, 0, 1); // по коду будет только 1
    if tcList.totalCount > 0 then
    begin
{       NET-1997
       if ENTechConditionsServicesObj.techCondServicesType.code = 2  then
        frmENPlanWorkEdit.ENPlanWorkObj.commentGen := '№' + tcList.list[0].fincontractNumber +
                                                     ' від ' + XSDate2String(tcList.list[0].fincontractDate) + ' р.' +
                                                     ' (' + tcList.list[0].contragentName + ')'
       else}

       //frmENPlanWorkEdit.ENPlanWorkObj.commentGen := '№' + {tcList.list[0].contractNumber +} ENServicesObjectObj.contractNumberServices +
       //                                              ' від ' + XSDate2String(tcList.list[0].contractDate) + ' р.' +
       //                                              ' (' + tcList.list[0].contragentName + ')';

       frmENPlanWorkEdit.ENPlanWorkObj.commentGen := '№' + {tcList.list[0].contractNumber +} ENServicesObjectObj.contractNumberServices +
                                                     ' від ' + XSDate2String(ENServicesObjectObj.contractDateServices) + ' р.' +
                                                     ' (' + tcList.list[0].contragentName + ')';

       frmENPlanWorkEdit.edtCommentGen.Text := frmENPlanWorkEdit.ENPlanWorkObj.commentGen;
    end;
    /////

    if frmENPlanWorkEdit.ShowModal = mrOk then
    begin
      //actUpdatePlanExecute(Sender);
      actUpdateExecute(Sender);
    end;

    

  finally
  end;
end;


procedure TfrmENServicesCalculationEdit.actInsertService2FKInfoExecute(
  Sender: TObject);
// Var TempENServicesObject2FKInfo: ENServicesObject2FKInfoControllerSoapPort;
begin
  // TempENServicesObject2FKInfo := HTTPRIOENServicesObject2FKInfo as ENServicesObject2FKInfoControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENServicesObject2FKInfoObj:=ENServicesObject2FKInfo.Create;
  SetNullIntProps(ENServicesObject2FKInfoObj);
  SetNullXSProps(ENServicesObject2FKInfoObj);



  try
    frmENServicesObject2FKInfoEdit:=TfrmENServicesObject2FKInfoEdit.Create(Application, dsInsert);

       ENServicesObject2FKInfoObj.servicesObjectRef := ENServicesObjectRef.Create;
       ENServicesObject2FKInfoObj.servicesObjectRef.code:= ENServicesObjectObj.code;

    try
      if frmENServicesObject2FKInfoEdit.ShowModal = mrOk then
      begin
        if ENServicesObject2FKInfoObj<>nil then
            //TempENServicesObject2FKInfo.add(ENServicesObject2FKInfoObj);
            actUpdateService2FKInfoExecute(Sender);
      end;
    finally
      frmENServicesObject2FKInfoEdit.Free;
      frmENServicesObject2FKInfoEdit:=nil;
    end;
  finally
    ENServicesObject2FKInfoObj.Free;
  end;
end;

procedure TfrmENServicesCalculationEdit.actLoadAttachmentsExecute(Sender: TObject);
var
  i : Integer;
  result, fname, fileName, dir, ftpDir : string;
  ftpClient: TIdFTP;
  FileNames: TStrings;
  fileSize: Integer;
  att : ENDocAttachment;
  serv : ENDocAttachmentServer;
begin
  inherited;
  FileNames := TStringList.Create;

  try
    att := DMReports.getENDocAttachmentByCode(StrToInt(sgENDocAttachment.Cells[0,sgENDocAttachment.Row]));
    if att = nil then Exit;
    serv := DMReports.getENDocAttachmentServerByCode(att.serverRef.code);
    if serv = nil then Exit;
  except
    on EConvertError do Exit;
  end;

  fileName := ExtractFileName(att.fileLink);
  dir :=  ExtractFilePath(StringReplace(att.fileLink, '/', '\', [rfReplaceAll]));
  ftpDir := StringReplace(dir, '\', '/', [rfReplaceAll]);

  i := LastDelimiter('/' + PathDelim + DriveDelim, fileName);
  if (i > 0) and (fileName[i] = '/') then
    fname := Copy(fileName, i+1, MaxInt) else
    fname := '';

  ftpClient := TIdFTP.create(nil);
  try

    with ftpClient do begin
      Host:= serv.serverIp;
      Username:= serv.userName;
      Password:= serv.userPass;
    end;

    ftpClient.Connect();

    ftpClient.Passive := True;
    ftpClient.BeginWork(wmRead);
    ftpClient.ChangeDir('/'+ftpDir);
    ftpClient.List(FileNames, '', False);

    if not DirectoryExists(ExtractFilePath(Application.ExeName)+TempReportsPath) then
      CreateDir(ExtractFilePath(Application.ExeName)+TempReportsPath);

    with ftpClient.DirectoryListing do for i := 0 to Count - 1 do
    begin
      fileSize := ftpClient.Size(ftpClient.DirectoryListing[0].FileName);
      ftpClient.Get(ftpClient.DirectoryListing[0].FileName, ExtractFilePath(Application.ExeName)+TempReportsPath+fname, True, False);
    end;

    ftpClient.Disconnect();
  finally
    ftpClient.Free;
  end;

  ShellExecute(0,PChar('open'),PChar('"' + ExtractFilePath(Application.ExeName)+TempReportsPath+fname + '"'),
                nil,nil,SW_SHOWMAXIMIZED);
end;


procedure TfrmENServicesCalculationEdit.actDeletePlanExecute(
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

procedure TfrmENServicesCalculationEdit.actDeleteService2FKInfoExecute(
  Sender: TObject);
Var TempENServicesObject2FKInfo: ENServicesObject2FKInfoControllerSoapPort;
  ObjCode: Integer;
begin
 TempENServicesObject2FKInfo := HTTPRIOENServicesObject2FKInfo as ENServicesObject2FKInfoControllerSoapPort;
   try
     ObjCode := StrToInt(sgENServicesObject2FKInfo.Cells[0,sgENServicesObject2FKInfo.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Данные для ФК проводок( оказанные услуги ) ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENServicesObject2FKInfo.remove(ObjCode);
      actUpdateService2FKInfoExecute(Sender);
  end;
end;


procedure TfrmENServicesCalculationEdit.actChangeCreatMetodExecute(Sender: TObject);
var
  creatMetodCode: Integer;
  TempENServicesObject: ENServicesObjectControllerSoapPort;
begin
  inherited;
  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  creatMetodCode := cbActIncomeCreatMetod.ItemIndex + 1;

  if Application.MessageBox(PChar('Ви дійсно бажаєте змінити метод формування прибуткового акту?'),
        PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject.changeActIncomeCreatMetod(ENServicesObjectObj.code, creatMetodCode);

    ENServicesObjectObj.actIncomeCreatMetodRef.code := creatMetodCode;
    pcCalculationChange(Sender);
  end;
end;


procedure TfrmENServicesCalculationEdit.actClosePlanExecute(
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


      if (tPlan.kind.code = ENPLANWORKKIND_CURRENT) then
    begin

      frmPlanWorkClose := TfrmPlanWorkClose.Create(Application, dsEdit);
      frmPlanWorkClose.plan  := tPlan;

      try
        if frmPlanWorkClose.ShowModal = mrOk then
        begin
          Application.MessageBox(PChar('План затверджено!'), PChar('Повідомлення'), MB_ICONINFORMATION);
          actUpdateExecute(Sender);
        end;

      finally
        frmPlanWorkClose.Free;
        frmPlanWorkClose := nil;
      end;

    end
    else

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

procedure TfrmENServicesCalculationEdit.actUnbindCounterToServicesObjectExecute(
  Sender: TObject);
var
  TempENServicesObject : ENServicesObjectControllerSoapPort;
  invNumber : String;
begin
  inherited;
  invNumber := sgSCCounter.Cells[0,sgSCCounter.Row];
  if ((Length(Trim(invNumber)) = 0)) then Exit;

  if Application.MessageBox(PChar(Format('Ви дійсно бажаєте відмінити прив''язку лічильника інв № %s від договору № %s?'
    , [invNumber, ENServicesObjectObj.contractNumberServices])),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
      TempENServicesObject.bindCounterToServicesObject(invNumber, ENServicesObjectObj, true, false);
      Self.pcCalculationChange(Sender);
      Application.MessageBox(PChar(Format('Прив''язка лічильника інв. № %s від договору № %s відмінена'
      , [invNumber, ENServicesObjectObj.contractNumberServices])), PChar('Повідомлення'), MB_ICONINFORMATION);
  end;

end;

procedure TfrmENServicesCalculationEdit.actUnClosePlanExecute(
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

procedure TfrmENServicesCalculationEdit.actFinishPlanExecute(
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

procedure TfrmENServicesCalculationEdit.actUndoFinishPlanExecute(
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

procedure TfrmENServicesCalculationEdit.actEditENPlanWorkItemExecute(
  Sender: TObject);
Var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
begin
  if not priconnections then Exit;

  if ENServicesObjectObj = nil then Exit;
  if ENServicesObjectObj.contractTypeRef = nil then Exit;
  if ENServicesObjectObj.contractTypeRef.code <> ENSERVICESOBJECTTYPE_CONNECTION then Exit;

  if pcCalculation.ActivePage = tsListWork then
  begin

    TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
    try
      ENPlanWorkItemObj := TempENPlanWorkItem.getObject(StrToInt(sgENPlanWorkItem.Cells[0,sgENPlanWorkItem.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENPlanWorkItemEdit:=TfrmENPlanWorkItemEdit.Create(Application, dsEdit);

    try
      frmENPlanWorkItemEdit.priconnections := true;

      frmENPlanWorkItemEdit.lblMeasure.Caption := 'Вимірювач : ' + sgENPlanWorkItem.Cells[8,sgENPlanWorkItem.Row] + ' /  Од.виміру : ' + sgENPlanWorkItem.Cells[9,sgENPlanWorkItem.Row];
      if frmENPlanWorkItemEdit.ShowModal= mrOk then
      begin
        //TempENLine04.save(ENLine04Obj);
        //UpdateGrid(Sender);
        actUpdateExecute(Sender);
      end;
    finally
      frmENPlanWorkItemEdit.Free;
      frmENPlanWorkItemEdit:=nil;
    end;
  end; // if pcCalculation.ActivePage = tsListWork
end;

procedure TfrmENServicesCalculationEdit.actInsertCAIExecute(Sender: TObject);
// Var TempENServices2CalcAdditionalItems: ENServices2CalcAdditionalItemsControllerSoapPort;
begin
  // TempENServices2CalcAdditionalItems := HTTPRIOENServices2CalcAdditionalItems as ENServices2CalcAdditionalItemsControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENServices2CalcAdditionalItemsObj:=ENServices2CalcAdditionalItems.Create;
  SetNullIntProps(ENServices2CalcAdditionalItemsObj);
  SetNullXSProps(ENServices2CalcAdditionalItemsObj);

   ENServices2CalcAdditionalItemsObj.servicesObjectRef := ENServicesObjectRef.Create;
   ENServices2CalcAdditionalItemsObj.servicesObjectRef.code := ENServicesObjectObj.code;

  try
    frmENServices2CalcAdditionalItemsEdit:=TfrmENServices2CalcAdditionalItemsEdit.Create(Application, dsInsert);
    try
      if frmENServices2CalcAdditionalItemsEdit.ShowModal = mrOk then
      begin
        if ENServices2CalcAdditionalItemsObj<>nil then
            //TempENServices2CalcAdditionalItems.add(ENServices2CalcAdditionalItemsObj);
            actUpdateCAIExecute(Sender);
      end;
    finally
      frmENServices2CalcAdditionalItemsEdit.Free;
      frmENServices2CalcAdditionalItemsEdit:=nil;
    end;
  finally
    ENServices2CalcAdditionalItemsObj.Free;
  end;
end;

procedure TfrmENServicesCalculationEdit.actInsertCalculationConcordanceRMBExecute(
  Sender: TObject);
const calculationConcordanceRMB: array [0..2] of tpTechCardCalculation = (
  (calcSystemCode: 2; //00 значение мантисы - количество элементов с первого
   calcBookkeepingCode: 'Розділ 1. Роботи технічного напрямку';
   calcTextValue: 'Узгодження проектно-кошторисної документації (ПКД) ' +
   'вішкодування витрат з виносу ліній електромереж передбачає ' +
   'пов''язані з ліцензованою діяльністю 1.3.01 калькуляції:';
   calcIncluded: False),
  (calcSystemCode: 2140010182; //системный код калькляции
   calcBookkeepingCode: '1.3.0101'; //01 элемент массива
   calcTextValue:
   'Узгодження ПКД на будівництво або реконструкцію електричних мереж ' +
   'ПАТ "ЕК"Херсонобленерго" напругою до 1 кВ 1 категорія РЕМ';
   calcIncluded: False),
  (calcSystemCode: 2140010183; //системный код калькляции
   calcBookkeepingCode: '1.3.0102'; //02 элемент массива
   calcTextValue:
   'Узгодження ПКД на будівництво або реконструкцію електричних мереж ' +
   'ПАТ "ЕК"Херсонобленерго" напругою вище 1 кВ 1 категорія РЕМ';
   calcIncluded: False));
var strMSG: string; i, vCalculationSize: Integer;
begin
  techCardCalculationGroupInsert(calculationConcordanceRMB);
end;

procedure
  TfrmENServicesCalculationEdit.actInsertCalculationDevelopmentRMBExecute(
    Sender: TObject);
const calculationDevelopmentRMB: array [0..17] of tpTechCardCalculation = (
  (calcSystemCode: 17; //00 значение мантисы - количество элементов с первого
   calcBookkeepingCode: 'Розділ 1. Роботи технічного напрямку' +
   '1.1. Ремонт і технічне обслуговування електричних мереж';
   calcTextValue: 'Розроблення проектно-кошторисної документації (ПКД) ' +
   'вішкодування витрат з виносу ліній електромереж передбачає ' +
   'не пов''язані з ліцензованою діяльністю 1.1.05 калькуляції:';
   calcIncluded: False),
  (calcSystemCode: 2140009457;
   calcBookkeepingCode: '1.1.05010101'; //01 элемент массива
   calcTextValue: 'Виготовлення ПКД улаштування відгалудження ' +
   'від опори ПЛ-0.4 кВ до ввідно-розподільчого пристрою';
   calcIncluded: False),
  (calcSystemCode: 2140009458;
   calcBookkeepingCode: '1.1.05010102'; //02 элемент массива
   calcTextValue: 'Виготовлення ПКД реконструкції ПЛ-0.4 кВ довжиною до 1 км';
   calcIncluded: False),
  (calcSystemCode: 2140009459;
   calcBookkeepingCode: '1.1.05010103'; //03 элемент массива
   calcTextValue: 'Виготовлення ПКД улаштування відгалудження ' +
   'від опори ПЛ-0.4 кВ з встановленням ввідно-облікового пристрою';
   calcIncluded: False),
  (calcSystemCode: 2140009460;
   calcBookkeepingCode: '1.1.05010104'; //04 элемент массива
   calcTextValue: 'Виготовлення ПКД будівництва ПЛ-0.4 кВ довжиною до 1 км';
   calcIncluded: False),
  (calcSystemCode: 2140009461;
   calcBookkeepingCode: '1.1.05010105'; //05 элемент массива
   calcTextValue:
   'Виготовлення ПКД реконструкції існуючого ввідно-облікового пристрою';
   calcIncluded: False),
  (calcSystemCode: 2140009462;
   calcBookkeepingCode: '1.1.05010201'; //06 элемент массива
   calcTextValue:
   'Виготовлення ПКД реконструкції ПЛ-6(10) кВ із встановленням ' +
   'роз''єднувача на існуючій опорі';
   calcIncluded: False),
  (calcSystemCode: 2140009463;
   calcBookkeepingCode: '1.1.05010202'; //07 элемент массива
   calcTextValue:
   'Виготовлення ПКД реконструкції ПЛ-6(10) кВ довжиною до 1 км';
   calcIncluded: False),
  (calcSystemCode: 2140009464;
   calcBookkeepingCode: '1.1.05010203'; //08 элемент массива
   calcTextValue:
   'Виготовлення ПКД реконструкції ПЛ-6(10) кВ із встановленням ' +
   'роз''єднувача на опорі, що проектується';
   calcIncluded: False),
  (calcSystemCode: 2140009465;
   calcBookkeepingCode: '1.1.05010204'; //09 элемент массива
   calcTextValue:
   'Виготовлення ПКД будівництва ПЛ-6(10) кВ довжиною до 1 км';
   calcIncluded: False),
  (calcSystemCode: 2140009467;
   calcBookkeepingCode: '1.1.05020101'; //10 элемент массива
   calcTextValue:
   'Виготовлення ПКД будівництва або реконструкції КЛ-0.4 кВ довжиною до 1 км';
   calcIncluded: False),
  (calcSystemCode: 2140009469;
   calcBookkeepingCode: '1.1.05020201'; //11 элемент массива
   calcTextValue:
   'Виготовлення ПКД будівництва або реконструкції КЛ-6(10) кВ ' +
   'довжиною до 1 км';
   calcIncluded: False),
  (calcSystemCode: 2140009473;
   calcBookkeepingCode: '1.1.05030101'; //12 элемент массива
   calcTextValue:
   'Виготовлення ПКД реконструкції електрообладнання ТП-6(10)/0.4 кВ ' +
   'із заміною або встановленням додаткової панелі типу ЩО в РП-0.4 кВ';
   calcIncluded: False),
  (calcSystemCode: 2140009474;
   calcBookkeepingCode: '1.1.05030102'; //13 элемент массива
   calcTextValue:
   'Виготовлення ПКД реконструкції електрообладнання ТП-6(10)/0.4 кВ ' +
   'із заміною додаткового комутаційного апарату в РП-0.4 кВ';
   calcIncluded: False),
  (calcSystemCode: 2140009475;
   calcBookkeepingCode: '1.1.05030103'; //14 элемент массива
   calcTextValue:
   'Виготовлення ПКД реконструкції електрообладнання ТП-6(10)/0.4 кВ ' +
   'із заміною силового трансформатора';
   calcIncluded: False),
  (calcSystemCode: 2140009476;
   calcBookkeepingCode: '1.1.05030201'; //15 элемент массива
   calcTextValue: 'Виготовлення проектно-кошторисної документації ' +
   'на будівництво або повну заміну КТП-6(10)/0.4 кВ';
   calcIncluded: False),
  (calcSystemCode: 2140009477;
   calcBookkeepingCode: '1.1.05030301'; //16 элемент массива
   calcTextValue: 'Виготовлення ПКД реконструкції електрообладнання ' +
   'РП-6(10) кВ, ТП-6(10)/0.4 кВ, ПС-35/6(10) кВ із заміною ' +
   'або встановленням додаткової високовольтної комірки';
   calcIncluded: False),
  (calcSystemCode: 2140009478;
   calcBookkeepingCode: '1.1.05030302'; //17 элемент массива
   calcTextValue: 'Виготовлення ПКД реконструкції електрообладнання ' +
   'РП-6(10) кВ, ТП-6(10)/0.4 кВ, ПС-35/6(10) кВ із заміною ' +
   'або встановленням додаткової високовольтної комірки (з урахуванням РЗА)';
   calcIncluded: False));
begin
  techCardCalculationGroupInsert(calculationDevelopmentRMB);
end;

procedure TfrmENServicesCalculationEdit.techCardCalculationGroupInsert (
  vTechCardCalculation: array of tpTechCardCalculation);
var i, vCalculationSize: Integer; //strMSG: string;
  TempENPlanWork2ClassificationType:
    ENPlanWork2ClassificationTypeControllerSoapPort;
  TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
  vDistance: TXSDecimal; vCustomPlanDate: TXSDate;
  vTechCardCalculationIncluded: array of Boolean;
begin
  vCalculationSize := vTechCardCalculation[0].calcSystemCode;

  {strMSG := vTechCardCalculation[0].calcTextValue;
  for i := 1 to vCalculationSize do
    begin
      strMSG := strMSG + #13#10 +
        vTechCardCalculation[i].calcBookkeepingCode + ' - ' +
        vTechCardCalculation[i].calcTextValue;
      if i = vCalculationSize then strMSG := strMSG + '.'
      else strMSG := strMSG + ';'
    end;

  if Application.MessageBox(PChar(strMSG), PChar('Додати групу калькуляцій?'),
    MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK
  then Exit;}

  if not Assigned(frmTechCardCalculationGroup) then
  frmTechCardCalculationGroup :=
    TfrmTechCardCalculationGroup.Create(Application);

  with frmTechCardCalculationGroup do //SUPP-48157. Заполнение в таблицу
    for i := 1 to vCalculationSize do //преложения калькуляций
      begin
        if i > 1 then
          sgTechCardCalculationGroup.AddRow;
        sgTechCardCalculationGroup.Cells[0, i] :=
          IntToStr(vTechCardCalculation[i].calcSystemCode);
        sgTechCardCalculationGroup.Cells[1, i] :=
          vTechCardCalculation[i].calcBookkeepingCode;
        sgTechCardCalculationGroup.Cells[2, i] :=
          vTechCardCalculation[i].calcTextValue;
        sgTechCardCalculationGroup.AddCheckBox(3, i, False,
          vTechCardCalculation[i].calcIncluded);
      end;

  try
    if frmTechCardCalculationGroup.ShowModal = mrOk then //SUPP-48157
      for i := 1 to vCalculationSize do //Указание необходимых калькуляций
       frmTechCardCalculationGroup.sgTechCardCalculationGroup.GetCheckBoxState(
         3, i, vTechCardCalculationIncluded[i]);
  finally
    frmTechCardCalculationGroup.Free;
    frmTechCardCalculationGroup := nil;
  end;

  if not NoBlankValues([edtContractServicesDistance]) then
    begin
      edtContractServicesDistance.Text := '0';
      Application.MessageBox(PChar('Введіть, будь ласка, відстань для ' +
          'розрахунку транспортних витрат ' +
          '(якщо транспорт не потрібний, залиште 0).'),
        PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;

  if DepartmentForServicesCode = -1 then
    begin
      Application.MessageBox(PChar('Оберіть спочатку підрозділ.'),
        PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;

  vDistance := TXSDecimal.Create;
  vDistance.DecimalString := edtContractServicesDistance.Text;

  if edtCustomPlanDate.Checked then
    begin
     if vCustomPlanDate = nil then
        vCustomPlanDate := TXSDate.Create;
        vCustomPlanDate.XSToNative(GetXSDate(edtCustomPlanDate.DateTime));
    end
  else
    begin
      vCustomPlanDate := nil;
      vCustomPlanDate := TXSDate.Create;
      edtCustomPlanDate.DateTime := SysUtils.Date;
      edtCustomPlanDate.Checked := True;
      vCustomPlanDate.XSToNative(GetXSDate(edtCustomPlanDate.DateTime));
    end;

  for i := 1 to vCalculationSize do
    if vTechCardCalculationIncluded[i] then
      begin
        ENPlanWork2ClassificationTypeObj := ENPlanWork2ClassificationType.Create;
        try

          ENPlanWork2ClassificationTypeObj.classificationTypeRef :=
            TKclassificationTypeRef.Create;
          ENPlanWork2ClassificationTypeObj.classificationTypeRef.code :=
            vTechCardCalculation[i].calcSystemCode;

          ENPlanWork2ClassificationTypeObj.planRef := ENPlanWorkRef.Create;
          ENPlanWork2ClassificationTypeObj.planRef.code := planCode;

          TempENPlanWorkItem :=
            HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;

          ENPlanWork2ClassificationTypeObj.countGen := TXSDecimal.Create;
          ENPlanWork2ClassificationTypeObj.countGen.decimalString := '1';
          ENPlanWork2ClassificationTypeObj.commentGen := 'SUPP-48157';
          ENPlanWork2ClassificationTypeObj.machineHours := TXSDecimal.Create;
          ENPlanWork2ClassificationTypeObj.machineHours.decimalString := '0';
          ENPlanWork2ClassificationTypeObj.relocationKm := nil;
          ENPlanWork2ClassificationTypeObj.transportationLoad := nil;
          ENPlanWork2ClassificationTypeObj.isPrintOnKmOrMH := 0;
          ENPlanWork2ClassificationTypeObj.costWorksContractor := nil;
          ENPlanWork2ClassificationTypeObj.isJobsByTime := Low(Integer);
          ENPlanWork2ClassificationTypeObj.isVisitClient := Low(Integer);

          ENPlanWork2ClassificationTypeObj.code :=
            TempENPlanWorkItem.addPlanWorkItemsByClassificationTypeForCalculation2(
            ENPlanWork2ClassificationTypeObj,
            vDistance,
            frmENServicesCalculationEdit.DepartmentForServicesCode,
            False, //priconnections
            vCustomPlanDate);

          if (planCode = LOW_INT) then
            begin
              TempENPlanWork2ClassificationType :=
                HTTPRIOENPlanWork2ClassificationType
                as ENPlanWork2ClassificationTypeControllerSoapPort;
              ENPlanWork2ClassificationTypeObj :=
                TempENPlanWork2ClassificationType.getObject(
                  ENPlanWork2ClassificationTypeObj.code);
              planCode := ENPlanWork2ClassificationTypeObj.planRef.code;
              SetFormCaption(DMReports.getElementCodeByPlanCode(planCode));
            end;
        finally
          ENPlanWork2ClassificationTypeObj.Free;
        end;
      end; //for i := 1 to vCalculationSize do

  actUpdateExecute(nil);
end;

procedure TfrmENServicesCalculationEdit.actInsertCalculationExecute(
  Sender: TObject);
Var
  TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
  TempENPlanWork2ClassificationType: ENPlanWork2ClassificationTypeControllerSoapPort;
  TempENEstimateItem : ENEstimateItemControllerSoapPort;
  plan2ctFilter : ENPlanWork2ClassificationTypeFilter;
  ENPlanWork2ClassificationTypeList: ENPlanWork2ClassificationTypeShortList;
begin
  if not NoBlankValues([edtContractServicesDistance]) then
  begin
    Application.MessageBox(PChar('Введіть відстань для розрахунку транспортних витрат (якщо транспорт не потрібний, введіть 0)!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if DepartmentForServicesCode = -1 then
  begin
    Application.MessageBox(PChar('Оберіть спочатку підрозділ!!!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;
  ENPlanWork2ClassificationTypeObj := ENPlanWork2ClassificationType.Create;
  //ENPlanWork2ClassificationTypeObj.countGen:= TXSDecimal.Create;
  //ENPlanWork2ClassificationTypeObj.dateEdit:= TXSDate.Create;
  ENPlanWork2ClassificationTypeObj.planRef := ENPlanWorkRef.Create;
  ENPlanWork2ClassificationTypeObj.planRef.code := LOW_INT;


  try
    frmENPlanWork2ClassificationTypeEdit := TfrmENPlanWork2ClassificationTypeEdit.Create(Application, dsInsert);
    if (priconnections)
      then frmENPlanWork2ClassificationTypeEdit.priconnections := True;

    try
      ENPlanWork2ClassificationTypeObj.planRef.code := planCode;

    if edtCustomPlanDate.Checked then
     begin
       if frmENPlanWork2ClassificationTypeEdit.customPlanDate = nil then
          frmENPlanWork2ClassificationTypeEdit.customPlanDate  := TXSDate.Create;
          frmENPlanWork2ClassificationTypeEdit.customPlanDate.XSToNative(GetXSDate(edtCustomPlanDate.DateTime));
     end
     else
     begin
          frmENPlanWork2ClassificationTypeEdit.customPlanDate := nil;
          frmENPlanWork2ClassificationTypeEdit.customPlanDate := TXSDate.Create;
          edtCustomPlanDate.DateTime := SysUtils.Date;
          edtCustomPlanDate.Checked:=True;
          frmENPlanWork2ClassificationTypeEdit.customPlanDate.XSToNative(GetXSDate(edtCustomPlanDate.DateTime));
     end;

      frmENPlanWork2ClassificationTypeEdit.distance := TXSDecimal.Create;
      frmENPlanWork2ClassificationTypeEdit.distance.DecimalString := edtContractServicesDistance.Text;
      frmENPlanWork2ClassificationTypeEdit.codeDepartmentForServicesObject := DepartmentForServicesCode;

      if frmENPlanWork2ClassificationTypeEdit.ShowModal = mrOk then
      begin
        if ENPlanWork2ClassificationTypeObj <> nil then
        begin
          //TempENPlanWork2ClassificationType.add(ENPlanWork2ClassificationTypeObj);
          //UpdateGrid(Sender);
          if (planCode = LOW_INT) then
          begin
            TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;
            ENPlanWork2ClassificationTypeObj := TempENPlanWork2ClassificationType.getObject(ENPlanWork2ClassificationTypeObj.code);
            planCode := ENPlanWork2ClassificationTypeObj.planRef.code;

            ///////
            SetFormCaption(DMReports.getElementCodeByPlanCode(planCode));
            ///////
          end;



          actUpdateExecute(Sender);
        end;
      end;
    finally
      frmENPlanWork2ClassificationTypeEdit.Free;
      frmENPlanWork2ClassificationTypeEdit := nil;
    end;
  finally
    ENPlanWork2ClassificationTypeObj.Free;
  end;
end;

procedure TfrmENServicesCalculationEdit.actInsertEstimateItemExecute(
  Sender: TObject);
Var
  TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
  TempENPlanWork2ClassificationType: ENPlanWork2ClassificationTypeControllerSoapPort;
  TempENEstimateItem : ENEstimateItemControllerSoapPort;
  plan2ctFilter : ENPlanWork2ClassificationTypeFilter;
  ENPlanWork2ClassificationTypeList: ENPlanWork2ClassificationTypeShortList;  
begin
  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
  ENEstimateItemObj := ENEstimateItem.Create;

  ENEstimateItemObj.countGen := TXSDecimal.Create;
  ENEstimateItemObj.countFact := TXSDecimal.Create;
  ENEstimateItemObj.dateEdit := TXSDate.Create;

  ENEstimateItemObj.planRef := ENPlanWorkRef.Create;
  ENEstimateItemObj.planRef.code := plancode;

  ENEstimateItemObj.kindRef := ENEstimateItemKindRef.Create;
  ENEstimateItemObj.kindRef.code := ENESTIMATEITEMKIND_MATERIALS;



  try
    frmENEstimateItemEdit := TfrmENEstimateItemEdit.Create(Application, dsInsert);
    frmENEstimateItemEdit.ENPlanWorkCode := plancode;
    frmENEstimateItemEdit.checkCost := True;
    DisableControls([frmENEstimateItemEdit.cbEstimateItemStatus]);


    try
      if frmENEstimateItemEdit.ShowModal = mrOk then
      begin
        if ENEstimateItemObj <> nil then
          begin
            TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;

            plan2ctFilter := ENPlanWork2ClassificationTypeFilter.Create;
            SetNullIntProps(plan2ctFilter);
            SetNullXSProps(plan2ctFilter);

            plan2ctFilter.planRef := ENPlanWorkRef.Create;
            plan2ctFilter.planRef.code := planCode;
            plan2ctFilter.conditionSQL := ' classificationtyperfcd in (select t.classificationtypecode from enplanworkitem pi, tktechcard t ' +
            ' where pi.kartarefcode = t.code and pi.code = ' + IntToStr(ENEstimateItemObj.planItemRef.code) +
            ' and pi.planrefcode = ' + IntToStr(plancode) + ')';

            ENPlanWork2ClassificationTypeList := TempENPlanWork2ClassificationType.getScrollableFilteredList(plan2ctFilter, 0, -1);
            ENPlanWork2ClassificationTypeObj := TempENPlanWork2ClassificationType.getObject(ENPlanWork2ClassificationTypeList.list[0].code);

            TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
            TempENPlanWorkItem.savePlanWorkItemsByClassificationTypeForCalculationNotLicensed2
             (ENPlanWork2ClassificationTypeObj, ENServicesObjectObj.contractServicesDistance,
              ENPlanWork2ClassificationTypeObj.machineHours , DepartmentForServicesCode);

           actUpdateExecute(Sender);
          end;
      end;
    finally
      frmENEstimateItemEdit.Free;
      frmENEstimateItemEdit := nil;
    end;
  finally
    ENEstimateItemObj.Free;
  end;
end;


procedure TfrmENServicesCalculationEdit.actInsertIncomeExecute(Sender: TObject);
var
  actIncomeServicesCode: Integer;
  TempENActIncomeServices: ENActIncomeServicesControllerSoapPort;
begin
  inherited;
  actIncomeServicesCode := Low(Integer);
  if ENServicesObjectObj = nil then Exit;
  if ENServicesObjectObj.code = Low(Integer) then Exit;

  ENActIncomeServicesObj := ENActIncomeServices.Create;
  ENActIncomeServicesObj.servicesObjectRef := ENServicesObjectRef.Create;
  ENActIncomeServicesObj.servicesObjectRef.code := ENServicesObjectObj.code;

  try
    frmENActIncomeServicesEdit := TfrmENActIncomeServicesEdit.Create(Application, dsInsert);
    frmENActIncomeServicesEdit.edtNumberGen.Text :=
      ENServicesObjectObj.contractNumberServices + '/' + ENServicesObjectObj.contractNumber;
    DisableControls([frmENActIncomeServicesEdit.edtNumberGen]);
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


procedure TfrmENServicesCalculationEdit.actDeleteActFailureExecute(
  Sender: TObject);
Var TempENPlanWork2ENActFailure : ENPlanWork2ActFailureControllerSoapPort;
    p2afList : ENPlanWork2ActFailureShortList;
    p2afFilter : ENPlanWork2ActFailureFilter;
  ObjCode, planCode : Integer;

begin
  try
    planCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENPlanWork2ENActFailure := HTTPRIOENPlanWork2ActFailure as ENPlanWork2ActFailureControllerSoapPort;

  p2afFilter :=  ENPlanWork2ActFailureFilter.Create;
  SetNullIntProps(p2afFilter);
  SetNullXSProps(p2afFilter);

  p2afFilter.planRef := ENPlanWorkRef.Create;
  p2afFilter.planRef.code := planCode;

  p2afList := TempENPlanWork2ENActFailure.getScrollableFilteredList(p2afFilter,0,-1);

  if p2afList.totalCount = 0 then
  begin
      Application.MessageBox(PChar('Для цього плану не знайдено актів невиконання !'), PChar('Увага'), MB_ICONERROR);
      exit;
  end
  else
  begin
     ObjCode := TempENPlanWork2ENActFailure.getObject(p2afList.list[0].code).code;

  if Application.MessageBox(PChar('Вы действительно хотите удалить (акт невиконання) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

      TempENPlanWork2ENActFailure.remove(ObjCode);
      pcCalculationChange(self);

  end;
  end;

end;

procedure TfrmENServicesCalculationEdit.actDeleteAttachmentsExecute(Sender: TObject);
var
  TempENDocAttachment : ENDocAttachmentControllerSoapPort;
  ObjCode : Integer;
begin
  inherited;
  TempENDocAttachment := HTTPRIOENDocAttachment as ENDocAttachmentControllerSoapPort;
  try
    ObjCode := StrToInt(sgENDocAttachment.Cells[0,sgENDocAttachment.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Вложение документа) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENDocAttachment.remove(ObjCode);
    pcCalculationChange(Sender);
  end;
end;


procedure TfrmENServicesCalculationEdit.actDeleteCAIExecute(Sender: TObject);
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
  end;
end;

procedure TfrmENServicesCalculationEdit.actDeleteCalculationExecute(
  Sender: TObject);
Var TempENPlanWorkItem : ENPlanWorkItemControllerSoapPort;
    TempENPlanWork2ClassificationType : ENPlanWork2ClassificationTypeControllerSoapPort;
    plan2ctFilter : ENPlanWork2ClassificationTypeFilter;
    ENPlanWork2ClassificationTypeList : ENPlanWork2ClassificationTypeShortList;
    ObjCode: Integer;

    TempENPlanWork : ENPlanWorkControllerSoapPort;
    plan : ENPlanWork;
    ENPlanWorkList: ENPlanWorkShortList;
    filterPlan : ENPlanWorkFilter;
begin
  TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;

  try
    ObjCode := StrToInt(sgENPlanWork2ClassificationType.Cells[0, sgENPlanWork2ClassificationType.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Вы действительно хотите удалить запись ?'),
                            PChar('Внимание!'),
                            MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
  Exit;

  TempENPlanWorkItem.removePlanWorkItemsByClassificationTypeForCalculation(ObjCode);

  {
  selectedRow := sgENPlanWorkItem.Row;
  TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;

  try
    ObjCode := StrToInt(sgENPlanWorkItem.Cells[0,sgENPlanWorkItem.Row]);
  except
    on EConvertError do Exit;
  end;



    TempENPlanWorkItem.removeForCalculation(ObjCode);

    ClearGrid(sgENPlanWorkItem);
    pcCalculationChange(self);

      if  sgENPlanWorkItem.RowCount > selectedRow then
         sgENPlanWorkItem.Row := selectedRow - 1
      else
         sgENPlanWorkItem.Row :=  sgENPlanWorkItem.RowCount-1;

   }

   // закрываем форму если договор удален и план удален сервером при удалении последней работы в договоре

  TempENPlanWork  := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  filterPlan := ENPlanWorkFilter.Create;
  SetNullIntProps(filterPlan);
  SetNullXSProps(filterPlan);
  filterPlan.code := planCode;
  ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(filterPlan, 0, -1);
  if ENPlanWorkList.totalCount = 0 then
  begin
    //frmENServicesCalculationEdit.Close;
    ModalResult := mrCancel;
    Exit;

    // обновисть грид
    // .UpdateGrid(Sender);
  end;

  actUpdateExecute(Sender);

end;

procedure TfrmENServicesCalculationEdit.actDeleteEstimateItemExecute(
  Sender: TObject);
var TempENEstimateItem: ENEstimateItemControllerSoapPort;
    TempENPlanWork2ClassificationType : ENPlanWork2ClassificationTypeControllerSoapPort;
    plan2ctFilter : ENPlanWork2ClassificationTypeFilter;
    ENPlanWork2ClassificationTypeList : ENPlanWork2ClassificationTypeShortList;
    TempENPlanWorkItem : ENPlanWorkItemControllerSoapPort;
    planItemCode: Integer;
begin
  if Integer(sgENEstimateItem.Objects[0,sgENEstimateItem.Row]) in [ENESTIMATEITEMTYPE_AUTO] then
  begin
    Application.MessageBox(PChar('Цей матеріaл не видаляється !!!'), PChar('Увага!'),MB_ICONQUESTION+MB_OK);
    exit;
  end;

  if Integer(sgENEstimateItem.Objects[0,sgENEstimateItem.Row]) in [ENESTIMATEITEMTYPE_MANUAL_BY_PLANITEM] then
  begin
    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    try
      ENEstimateItemObj := TempENEstimateItem.getObject(StrToInt(sgENEstimateItem.Cells[0,sgENEstimateItem.Row]));
      planItemCode := ENEstimateItemObj.planItemRef.code;
    except
      on EConvertError do Exit;
    end;

    if Application.MessageBox(PChar('Ви дійсно бажаєте видалити цей матеріал?'),
                      PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
      TempENEstimateItem.remove(ENEstimateItemObj.code);

      TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;

      plan2ctFilter := ENPlanWork2ClassificationTypeFilter.Create;
      SetNullIntProps(plan2ctFilter);
      SetNullXSProps(plan2ctFilter);

      plan2ctFilter.planRef := ENPlanWorkRef.Create;
      plan2ctFilter.planRef.code := planCode;
      plan2ctFilter.conditionSQL := ' classificationtyperfcd in (select t.classificationtypecode from enplanworkitem pi, tktechcard t ' +
      ' where pi.kartarefcode = t.code and pi.code = ' + IntToStr(planItemCode) +
      ' and pi.planrefcode = ' + IntToStr(plancode) + ')';

      ENPlanWork2ClassificationTypeList := TempENPlanWork2ClassificationType.getScrollableFilteredList(plan2ctFilter, 0, -1);
      ENPlanWork2ClassificationTypeObj := TempENPlanWork2ClassificationType.getObject(ENPlanWork2ClassificationTypeList.list[0].code);

      TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
      TempENPlanWorkItem.savePlanWorkItemsByClassificationTypeForCalculationNotLicensed2
         (ENPlanWork2ClassificationTypeObj, ENServicesObjectObj.contractServicesDistance,
          ENPlanWork2ClassificationTypeObj.machineHours , DepartmentForServicesCode);

      actUpdateExecute(Sender);
    end;
  end;
end;


procedure TfrmENServicesCalculationEdit.actDeleteIncomeExecute(Sender: TObject);
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


procedure TfrmENServicesCalculationEdit.actEditActExecute(Sender: TObject);
var
  TempENAct: ENActControllerSoapPort;
begin
  inherited;
  TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

  frmENActEdit := TfrmENActEdit.Create(Application, dsEdit);
  try
    try
      frmENActEdit.ENActObj := TempENAct.getObject(StrToInt(sgENAct.Cells[0,sgENAct.Row]));
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


procedure TfrmENServicesCalculationEdit.actEditActFailureExecute(
  Sender: TObject);

 Var TempENPlanWork2ENActFailure : ENPlanWork2ActFailureControllerSoapPort;
    p2afList : ENPlanWork2ActFailureShortList;
    p2afFilter : ENPlanWork2ActFailureFilter;
    planCode : Integer;

begin
  try
    planCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENPlanWork2ENActFailure := HTTPRIOENPlanWork2ActFailure as ENPlanWork2ActFailureControllerSoapPort;

  p2afFilter :=  ENPlanWork2ActFailureFilter.Create;
  SetNullIntProps(p2afFilter);
  SetNullXSProps(p2afFilter);

  p2afFilter.planRef := ENPlanWorkRef.Create;
  p2afFilter.planRef.code := planCode;

  p2afList := TempENPlanWork2ENActFailure.getScrollableFilteredList(p2afFilter,0,-1);

  if p2afList.totalCount = 0 then
  begin
      Application.MessageBox(PChar('Для цього плану не знайдено актів невиконання !'), PChar('Увага'), MB_ICONERROR);
      exit;
  end
  else
begin

   try
     ENPlanWork2ActFailureObj := TempENPlanWork2ENActFailure.getObject(p2afList.list[0].code);
   except
   on EConvertError do Exit;
  end;

  frmENPlanWork2ActFailureEdit := TfrmENPlanWork2ActFailureEdit.Create(Application, dsEdit);
     try
      if frmENPlanWork2ActFailureEdit.ShowModal = mrOk then
      begin
        pcCalculationChange(self);
      end;
    finally
      frmENPlanWork2ActFailureEdit.Free;
      frmENPlanWork2ActFailureEdit:=nil;
    end;
end;
end;

procedure TfrmENServicesCalculationEdit.actEditCAIExecute(Sender: TObject);
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

procedure TfrmENServicesCalculationEdit.actEditCalculationExecute(
  Sender: TObject);
Var TempENPlanWork2ClassificationType: ENPlanWork2ClassificationTypeControllerSoapPort;
begin
  if not NoBlankValues([edtContractServicesDistance]) then
  begin
    Application.MessageBox(PChar('Введіть відстань для розрахунку транспортних витрат (якщо транспорт не потрібний, введіть 0)!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;
  
  TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;
  try
    ENPlanWork2ClassificationTypeObj := TempENPlanWork2ClassificationType.getObject(StrToInt(sgENPlanWork2ClassificationType.Cells[0, sgENPlanWork2ClassificationType.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENPlanWork2ClassificationTypeEdit := TfrmENPlanWork2ClassificationTypeEdit.Create(Application, dsEdit);
  try
    if (priconnections)
      then frmENPlanWork2ClassificationTypeEdit.priconnections := True;
        
    frmENPlanWork2ClassificationTypeEdit.distance := TXSDecimal.Create;
    frmENPlanWork2ClassificationTypeEdit.distance.DecimalString := edtContractServicesDistance.Text;
    frmENPlanWork2ClassificationTypeEdit.codeDepartmentForServicesObject := DepartmentForServicesCode;
    if frmENPlanWork2ClassificationTypeEdit.ShowModal = mrOk then
    begin
      //TempENPlanWork2ClassificationType.save(ENPlanWork2ClassificationTypeObj);
      //UpdateGrid(Sender);
      actUpdateExecute(Sender);
    end;
  finally
    frmENPlanWork2ClassificationTypeEdit.Free;
    frmENPlanWork2ClassificationTypeEdit:=nil;
  end;


  {
  TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
  try
    ENPlanWorkItemObj := TempENPlanWorkItem.getObject(StrToInt(sgENPlanWorkItem.Cells[0,sgENPlanWorkItem.Row]));
  except
    on EConvertError do Exit;
  end;

  selectedRow := sgENPlanWorkItem.Row;
  frmENPlanWorkItemEdit:=TfrmENPlanWorkItemEdit.Create(Application, dsEdit);
  frmENPlanWorkItemEdit.isCalculation := true;

  try

    frmENPlanWorkItemEdit.lblMeasure.Caption := 'Вимірювач : ' + sgENPlanWorkItem.Cells[8,sgENPlanWorkItem.Row] + ' /  Од.виміру : ' + sgENPlanWorkItem.Cells[9,sgENPlanWorkItem.Row];

    if frmENPlanWorkItemEdit.ShowModal= mrOk then
      begin

        ClearGrid(sgENPlanWorkItem);
        pcCalculationChange(self);
      end;

      if  sgENPlanWorkItem.RowCount > selectedRow then
         sgENPlanWorkItem.Row := selectedRow
      else
         sgENPlanWorkItem.Row :=  sgENPlanWorkItem.RowCount-1;
  finally
    frmENPlanWorkItemEdit.Free;
    frmENPlanWorkItemEdit:=nil;
  end;
  }
end;

procedure TfrmENServicesCalculationEdit.actEditEstimateItemExecute(
  Sender: TObject);
Var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    TempENPlanWork2ClassificationType: ENPlanWork2ClassificationTypeControllerSoapPort;
    TempENEstimateItem : ENEstimateItemControllerSoapPort;
    plan2ctFilter : ENPlanWork2ClassificationTypeFilter;
    ENPlanWork2ClassificationTypeList : ENPlanWork2ClassificationTypeShortList;
    state_, isSel : boolean;
    i : integer;
begin
  state_ := false;
  isSel := false;

  for i:=1 to sgENEstimateItem.RowCount - 1 do
    begin
       sgENEstimateItem.GetCheckBoxState(1,i,state_);
       if state_ then
       begin
         isSel := true;
         if Integer(sgENEstimateItem.Objects[0,sgENEstimateItem.Row]) in [ENESTIMATEITEMTYPE_AUTO ] then
         begin
           Application.MessageBox(PChar('Цей матеріaл не редагується !!!'), PChar('Увага !'), MB_ICONWARNING);
           Exit;
         end;
       end;
    end;

   if not isSel then
   begin
     Application.MessageBox(PChar('Виберіть хоча б один матеріал !!!'), PChar('Увага !'),MB_ICONWARNING);
     Exit;
   end;

   TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
   try
     ENEstimateItemObj := TempENEstimateItem.getObject(StrToInt(sgENEstimateItem.Cells[0,sgENEstimateItem.Row]));
   except
     on EConvertError do Exit;
   end;

    try
      frmENEstimateItemEdit := TfrmENEstimateItemEdit.Create(Application, dsEdit);
      frmENEstimateItemEdit.ENPlanWorkCode := plancode;

      try
        if frmENEstimateItemEdit.ShowModal = mrOk then
        begin
          if ENEstimateItemObj <> nil then
            begin
              TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;

              plan2ctFilter := ENPlanWork2ClassificationTypeFilter.Create;
              SetNullIntProps(plan2ctFilter);
              SetNullXSProps(plan2ctFilter);

              plan2ctFilter.planRef := ENPlanWorkRef.Create;
              plan2ctFilter.planRef.code := planCode;
              plan2ctFilter.conditionSQL := ' classificationtyperfcd in (select t.classificationtypecode from enplanworkitem pi, tktechcard t ' +
              ' where pi.kartarefcode = t.code and pi.code = ' + IntToStr(ENEstimateItemObj.planItemRef.code) +
              ' and pi.planrefcode = ' + IntToStr(plancode) + ')';

              ENPlanWork2ClassificationTypeList := TempENPlanWork2ClassificationType.getScrollableFilteredList(plan2ctFilter, 0, -1);
              ENPlanWork2ClassificationTypeObj := TempENPlanWork2ClassificationType.getObject(ENPlanWork2ClassificationTypeList.list[0].code);

              TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
              TempENPlanWorkItem.savePlanWorkItemsByClassificationTypeForCalculationNotLicensed2
             (ENPlanWork2ClassificationTypeObj, ENServicesObjectObj.contractServicesDistance,
              ENPlanWork2ClassificationTypeObj.machineHours , DepartmentForServicesCode);

             actUpdateExecute(Sender);
            end;
        end;
      finally
        frmENEstimateItemEdit.Free;
        frmENEstimateItemEdit := nil;
      end;
    finally
      ENEstimateItemObj.Free;
    end;
end;


procedure TfrmENServicesCalculationEdit.actEditIncomeExecute(Sender: TObject);
begin
  inherited;
//
//
end;


procedure TfrmENServicesCalculationEdit.cbBuildersAreaClick(
  Sender: TObject);
begin
  if (cbBuildersArea.Checked) then
    edtTyServicesSumma.Text := '0';

  edtTyServicesPowerChange(Sender);
end;


procedure TfrmENServicesCalculationEdit.cbIsReconnectionClick(Sender: TObject);
begin
  if (cbIsReconnection.Checked) then
  begin
    HideControls([lblPersonalAccount, edtPersonalAccountNumber, spbChoosePersonalInfo
      , lbleic, edteic, spbeic], False);
    ENServicesObjectObj.reconnectionTU := SERVICESOBJECT_RECONNECTIONTU;
    initializeConnectionsCheckBoxes;
  end else
  begin
    HideControls([lblPersonalAccount, edtPersonalAccountNumber, spbChoosePersonalInfo
      , lbleic, edteic, spbeic], True);
    if (not chbIsNewConnection.Checked) then
    begin
      ENServicesObjectObj.reconnectionTU := LOW_INT;
      ENServicesObjectObj.personalAccountCode := LOW_INT;
      ENServicesObjectObj.personalAccountNumber := '';
    end;
  end;
end;


procedure TfrmENServicesCalculationEdit.cbIsReconnectionKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if(chbIsNewConnection.Checked) then chbIsNewConnection.State := cbUnchecked;

end;

procedure TfrmENServicesCalculationEdit.btnPrintFactCalcClick(
  Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  if (ENServicesObjectObj.calcTypeRef.code <> ENSERVICESOBJECT_CALCTYPE_BY_FACT) then Exit;

  /////
  if ENServicesObjectObj.contractStatusRef = nil then Exit;

  if ENServicesObjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////
    
  ///// 14.05.13 NET-4235
  // Печать расчета - только при статусах "Работы выполнены" и "Оплаченный"
  if (ENServicesObjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_COMPLETED) and
		 (ENServicesObjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_PAID)  and
		 (ENServicesObjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_CLOSE) then
    raise Exception.Create('NET-4235 Для друку розрахунку остаточної вартості договір повинен мати статус "Роботи виконані" або "Сплачений" або "Закритий"!');
  /////

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'servicesObjectCode';
  args[0] := IntToStr(ENServicesObjectObj.code);

  reportName := '201109/ActCalcAdditionalWorkG_NKRE/ActCalc_ServicesFactCalc';

  makeReport(reportName, argNames, args, 'xls');
end;

procedure TfrmENServicesCalculationEdit.btnPrintBillForPrepaymentClick(
  Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  if (ENServicesObjectObj.calcTypeRef.code <> ENSERVICESOBJECT_CALCTYPE_BY_FACT) then Exit;
  if (ENServicesObjectObj.contragentTypeRef.code = ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET) then Exit;

  /////
  if ENServicesObjectObj.contractStatusRef = nil then Exit;

  if ENServicesObjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'soCode';
  args[0] := IntToStr(ENServicesObjectObj.code);

  reportName := 'Services/Bill/rah';

  makeReport(reportName , argNames , args , 'pdf');
end;


procedure TfrmENServicesCalculationEdit.cbSmallArchFrmClick(
  Sender: TObject);
begin
  if ENTechConditionsServicesObj <> nil then
    if ENTechConditionsServicesObj.connectionKindRef <> nil then
      if (cbSmallArchFrm.Checked)
      and (ENTechConditionsServicesObj.connectionKindRef.code =
        ENCONNECTIONKIND_STANDART)
      then
        begin
          edtTyServicesSumma.Text := '0';
          edtTyServicesPowerChange(Sender);
        end;
end;

procedure TfrmENServicesCalculationEdit.chkBaseStationClick(
  Sender: TObject);
begin
  if ENTechConditionsServicesObj <> nil then
    if ENTechConditionsServicesObj.connectionKindRef <> nil then
      if (chkBaseStation.Checked)
      and (ENTechConditionsServicesObj.connectionKindRef.code =
        ENCONNECTIONKIND_STANDART)
      then
        begin
          edtTyServicesSumma.Text := '0';
          edtTyServicesPowerChange(Sender);
        end;
end;


procedure TfrmENServicesCalculationEdit.actAddAttachmentsExecute(Sender: TObject);
begin
  inherited;
  ENDocAttachmentObj := ENDocAttachment.Create;
  ENDocAttachment2ENServices := ENDocAttachment2ENServicesObject.Create;
  try
    frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
    frmDFDocAttachmentEdit.soCode := ENServicesObjectObj.code;
    try
      if frmDFDocAttachmentEdit.ShowModal = mrOk then
      begin
        if ENDocAttachmentObj <> nil then
          pcCalculationChange(Sender);
      end;
    finally
      frmDFDocAttachmentEdit.Free;
      frmDFDocAttachmentEdit:=nil;
    end;
  finally
    ENDocAttachmentObj.Free;
    ENDocAttachmentObj := nil;
    ENDocAttachment2ENServices.Free;
    ENDocAttachment2ENServices := nil;
  end;
end;


procedure TfrmENServicesCalculationEdit.showHidePersonalAccountFields;
begin
  // Если выбран один из чекбоксов "Особовий рахунок" или "Новий споживач",
  // отображаем поля для ввода лицевого и EIC
  if (cbIsReconnection.Checked) or (chbIsNewConnection.Checked) then
    HideControls([lblPersonalAccount, edtPersonalAccountNumber
      , spbChoosePersonalInfo, lbleic, edteic, spbeic], False)
  else begin
    HideControls([lblPersonalAccount, edtPersonalAccountNumber
      , spbChoosePersonalInfo, lbleic, edteic, spbeic]);
    ClearControls([edtPersonalAccountNumber, edteic]);
    ENServicesObjectObj.reconnectionTU := LOW_INT;
    ENServicesObjectObj.personalAccountCode := LOW_INT;
    ENServicesObjectObj.personalAccountNumber := '';
    ENServicesObjectObj.codeEIC := '';
  end;
end;

procedure TfrmENServicesCalculationEdit.actInsertPaymentExecute(
  Sender: TObject);
begin
  inherited;
   ENPayment2SOObj:=ENPayment2SO.Create;

   ENPayment2SOObj.dateGen:= TXSDate.Create;
   ENPayment2SOObj.sumTotal:= TXSDecimal.Create;
   ENPayment2SOObj.sumGen:= TXSDecimal.Create;
   ENPayment2SOObj.sumVat:= TXSDecimal.Create;

   ENPayment2SOObj.servicesObjectRef := ENServicesObjectRef.Create;
   ENPayment2SOObj.servicesObjectRef.Code :=  ENServicesObjectObj.code; 


  try
		frmENPayment2SOEdit:=TfrmENPayment2SOEdit.Create(Application, dsInsert);
		frmENPayment2SOEdit.calctyperefcode :=  ENServicesObjectObj.calcTypeRef.code;
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

procedure TfrmENServicesCalculationEdit.actEditPaymentExecute(
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
	frmENPayment2SOEdit.calctyperefcode :=  ENServicesObjectObj.calcTypeRef.code;
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

procedure TfrmENServicesCalculationEdit.actDeletePaymentExecute(
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

procedure TfrmENServicesCalculationEdit.ActViewPaymentExecute(
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
	frmENPayment2SOEdit.calctyperefcode := ENServicesObjectObj.calcTypeRef.code;
  try
    frmENPayment2SOEdit.ShowModal;

  finally
    frmENPayment2SOEdit.Free;
    frmENPayment2SOEdit := nil;
  end;
end;

procedure TfrmENServicesCalculationEdit.initializeConnectionsCheckBoxes;
begin
  // NET-4295 Процедура для инициализации двух чекбоксов - повторное и новое подключение
  if (ENServicesObjectObj.reconnectionTU <> LOW_INT) then begin
    if (ENServicesObjectObj.reconnectionTU = SERVICESOBJECT_RECONNECTIONTU) then
    begin
        if chbIsNewConnection.Checked then chbIsNewConnection.Checked := False;
    end;
    if (ENServicesObjectObj.reconnectionTU = SERVICESOBJECT_NEWCONNECTIONTU) then
    begin
        if cbIsReconnection.Checked then cbIsReconnection.Checked := False;
    end;
  end;

  showHidePersonalAccountFields();
end;

function TfrmENServicesCalculationEdit.isAvailableBillingIP(departmentRefCode : Integer) : Boolean;
var
    TempENDepartment2EPRen : ENDepartment2EPRenControllerSoapPort;
    deepFilter : ENDepartment2EPRenFilter;
    deepList : ENDepartment2EPRenShortList;
begin

    // Функция возвращает можно ли по подразделению определить биллинговый IP-адрес
    TempENDepartment2EPRen := HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
    deepFilter := ENDepartment2EPRenFilter.Create;
    SetNullIntProps(deepFilter);
    SetNulLXSProps(deepFilter);
    deepFilter.departmentRef := ENDepartmentRef.Create;
    deepFilter.departmentRef.code := ENServicesObjectObj.department.code;
    deepFilter.conditionSQL := ' billingserverip is not null ';
    deepList := TempENDepartment2EPRen.getScrollableFilteredList(deepFilter, 0, -1);
    if(deepList.totalCount > 0 ) then
    begin
        Result := True;
    end
    else
      Result := False;
end;


procedure TfrmENServicesCalculationEdit.LoadActIncome();
var
  i: Integer;
  TempENActIncomeServices: ENActIncomeServicesControllerSoapPort;
  ENActIncomeServicesList: ENActIncomeServicesShortList;
  actIncomeFilter: ENActIncomeServicesFilter;
begin
  btnPostings.Visible := False;
  btnSetBuhStatus.Visible := False;
  DisableActions([actInsertIncome, actEditIncome, actDeleteIncome], False);

  SetGridHeaders(ENActIncomeServicesHeaders, sgENActIncomeServices.ColumnHeaders);
  ClearGrid(sgENActIncomeServices);
  TempENActIncomeServices := HTTPRIOENActIncomeServices as ENActIncomeServicesControllerSoapPort;

  actIncomeFilter := ENActIncomeServicesFilter.Create;
  SetNullIntProps(actIncomeFilter);
  SetNullXSProps(actIncomeFilter);
  actIncomeFilter.servicesObjectRef := ENServicesObjectRef.Create;
  actIncomeFilter.servicesObjectRef.code := ENServicesObjectObj.code;

  ENActIncomeServicesList := TempENActIncomeServices.getScrollableFilteredList(actIncomeFilter, 0, -1);
  LastCount := High(ENActIncomeServicesList.list);

  if LastCount > -1 then
    sgENActIncomeServices.RowCount:=LastCount+2
  else
    sgENActIncomeServices.RowCount:=2;

   with sgENActIncomeServices do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if ENActIncomeServicesList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENActIncomeServicesList.list[i].code)
        else
          Cells[0,i+1] := '';

        Cells[1,i+1] := ENActIncomeServicesList.list[i].numberGen;

        if ENActIncomeServicesList.list[i].dateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENActIncomeServicesList.list[i].dateGen);

        if ENActIncomeServicesList.list[i].actDateStart = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENActIncomeServicesList.list[i].actDateStart);

        if ENActIncomeServicesList.list[i].actDateEnd = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(ENActIncomeServicesList.list[i].actDateEnd);

        if ENActIncomeServicesList.list[i].summaGen = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENActIncomeServicesList.list[i].summaGen.DecimalString;

        if ENActIncomeServicesList.list[i].summaVat = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := ENActIncomeServicesList.list[i].summaVat.DecimalString;

        Cells[7,i+1] := ENActIncomeServicesList.list[i].statusRefName;

        LastRow:=i+1;
        sgENActIncomeServices.RowCount:=LastRow+1;
      end;

end;


function TfrmENServicesCalculationEdit.checkChangeActIncomeCreatMetod(): Boolean;
var
  TempENActIncomeServices: ENActIncomeServicesControllerSoapPort;
  ENActIncomeServicesList: ENActIncomeServicesShortList;
  actIncomeFilter: ENActIncomeServicesFilter;
begin
  changeActIncomeCreatMetod := False;
  if (ENServicesObjectObj.statusRef.code = ENSERVICESOBJECTSTATUS_DRAFT) then changeActIncomeCreatMetod := True;

  TempENActIncomeServices := HTTPRIOENActIncomeServices as ENActIncomeServicesControllerSoapPort;

  actIncomeFilter := ENActIncomeServicesFilter.Create;
  SetNullIntProps(actIncomeFilter);
  SetNullXSProps(actIncomeFilter);
  actIncomeFilter.servicesObjectRef := ENServicesObjectRef.Create;
  actIncomeFilter.servicesObjectRef.code := ENServicesObjectObj.code;

  ENActIncomeServicesList := TempENActIncomeServices.getScrollableFilteredList(actIncomeFilter, 0, -1);
  if (ENActIncomeServicesList.totalCount > 0) then changeActIncomeCreatMetod := False;

  Result := changeActIncomeCreatMetod;
end;


procedure TfrmENServicesCalculationEdit.setReadMode(Sender: TObject);
var
  i: Integer;
begin

  for i:=0 to ComponentCount-1 do
  begin
    if (Components[i] is TActionList) then
     TActionList(Components[i]).State := asSuspended;
  end;

  btnSaveENTransferDate.Visible := False;
  btnValidateProfitability.Visible := False;
  btnSaveWarrant.Visible := False;

  if (ENServicesObjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_CANCELED) then
  begin
    tsGeneral.TabVisible := True;
    tsPlans.TabVisible := True;
    tsActs.TabVisible := True;
    tsENDocAttachment.TabVisible := True;
    pcCalculation.ActivePage := tsGeneral;
  end;

  if (ENServicesObjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED) then
  begin
    ActionListPayment.State := asNormal;
  end;
end;


procedure TfrmENServicesCalculationEdit.loadServicesConsumer(Sender: TObject);
var
  i, r: Integer;
  isServicesConsumer: Boolean;
  docServicesConsumerFilter: DFDocServicesConsumerFilter;
  TempDFDocServicesConsumer: DFDocServicesConsumerControllerSoapPort;
  DFDocServicesConsumerList: DFDocServicesConsumerShortList;
  servicesConsumer: DFDocServicesConsumer;
  servicesConsumerKind: DFDocServicesConsumerKind;
begin
  if ENServicesObjectObj = nil then Exit;
  if ENServicesObjectObj.code = Low(Integer) then Exit;

  SetGridHeaders(DocumentManagementHeaders, sgDocumentManagement.ColumnHeaders);
  isServicesConsumer := DMReports.checkServicesConsumer(ENServicesObjectObj.code);

  if isServicesConsumer then
  begin
    tsServicesConsumer.TabVisible := True;

    TempDFDocServicesConsumer := HTTPRIODFDocServicesConsumer as DFDocServicesConsumerControllerSoapPort;

    docServicesConsumerFilter := DFDocServicesConsumerFilter.Create;
    SetNullIntProps(docServicesConsumerFilter);
    SetNullXSProps(docServicesConsumerFilter);

    docServicesConsumerFilter.conditionSQL := ' dfdocservicesconsumer.doccode = ( ' +
        ' select d.parentrefcode ' +
        '   from dfdoc2enservicesobject d2s, dfdoc d ' +
        '  where d.code = d2s.docrefcode ' +
        '    and d2s.servicesobjectcode = ' + IntToStr(ENServicesObjectObj.code) + ' )';


    DFDocServicesConsumerList := TempDFDocServicesConsumer.getScrollableFilteredList(docServicesConsumerFilter, 0, -1);
    LastCount := High(DFDocServicesConsumerList.list);


    //** SUPP-99483... 07.04.2021... +++ проверяем если обязательный EIC */
    if LastCount > -1 then
    begin
      try

        servicesConsumer := TempDFDocServicesConsumer.getObject(DFDocServicesConsumerList.list[0].code);
        servicesConsumerKind := DMReports.getServicesKindByServicesConsumerCode(servicesConsumer.code);

        if servicesConsumerKind.requiredEIC = NO then
          requiredEIC := False;

      except
        on EConvertError do Exit;
      end;
    end;


    if LastCount > -1 then
      sgDocumentManagement.RowCount:=LastCount+2
    else
      sgDocumentManagement.RowCount:=2;

    with sgDocumentManagement do
    for i:=0 to LastCount do
      begin
        // Application.ProcessMessages;

        if DFDocServicesConsumerList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(DFDocServicesConsumerList.list[i].code)
        else
          Cells[0,i+1] := '';

        Cells[1,i+1] := DFDocServicesConsumerList.list[i].docDocNum;

        if DFDocServicesConsumerList.list[i].dateRegistration = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDateTimeWithDate2String(DFDocServicesConsumerList.list[i].dateRegistration);

        Cells[3,i+1] := DFDocServicesConsumerList.list[i].docName;
        Cells[4,i+1] := DFDocServicesConsumerList.list[i].docCustomerName;
        Cells[5,i+1] := DFDocServicesConsumerList.list[i].docCustomerAddress;
        Cells[6,i+1] := DFDocServicesConsumerList.list[i].personalAccountUid;
        Cells[7,i+1] := DFDocServicesConsumerList.list[i].personalAccount;
        Cells[8,i+1] := DFDocServicesConsumerList.list[i].departmentRefName;
        Cells[9,i+1] := DFDocServicesConsumerList.list[i].currentStatusName;
        Cells[10,i+1] := DFDocServicesConsumerList.list[i].consumerTypeRefName;

        if DFDocServicesConsumerList.list[i].isRed > 0 then
        begin
          with sgDocumentManagement do
          for r:=0 to sgDocumentManagement.ColCount-1 do
            begin
              FontStyles[r,i+1] := FontStyles[r,i+1] + [fsBold];
              sgDocumentManagement.RowFontColor[i + 1] := clRed;
            end;
        end else
        begin
          with sgDocumentManagement do
          for r:=0 to sgDocumentManagement.ColCount-1 do
            begin
              FontStyles[r,i+1] := FontStyles[r,i+1] - [fsBold];
              sgDocumentManagement.RowFontColor[i + 1] := clWindowText;
            end;
        end;

        LastRow:=i+1;
        sgDocumentManagement.RowCount:=LastRow+1;
      end;

  end;
end;


procedure TfrmENServicesCalculationEdit.clearWarrantData();
begin
  edtWarrantNumber.Text := '';
  edtWarrantFIO.Text := '';
  edtWarrantPosition.Text := '';
  edtWarrantName.Text := '';
  edtPower.Text := '';
  edtMaxSum.Text := '';
  ENServicesObjectObj.warrantRef.code := LOW_INT;
end;

procedure TfrmENServicesCalculationEdit.actAddActFailureExecute(
  Sender: TObject);
  var
  TempENPlanWork2ENActFailure : ENPlanWork2ActFailureControllerSoapPort;
  p2afList : ENPlanWork2ActFailureShortList;
  p2afFilter : ENPlanWork2ActFailureFilter;
  planCode : Integer;
begin
  inherited;

  try
    planCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENPlanWork2ENActFailure := HTTPRIOENPlanWork2ActFailure as ENPlanWork2ActFailureControllerSoapPort;

  p2afFilter :=  ENPlanWork2ActFailureFilter.Create;
  SetNullIntProps(p2afFilter);
  SetNullXSProps(p2afFilter);

  p2afFilter.planRef := ENPlanWorkRef.Create;
  p2afFilter.planRef.code := planCode;

  p2afList := TempENPlanWork2ENActFailure.getScrollableFilteredList(p2afFilter,0,-1);

  if p2afList.totalCount > 0 then
  begin
      Application.MessageBox(PChar('Для цього плану вже э акт невиконання ! Редагуйте його!'), PChar('Увага'), MB_ICONERROR);
      try
     ENPlanWork2ActFailureObj := TempENPlanWork2ENActFailure.getObject(p2afList.list[0].code);
   except
   on EConvertError do Exit;
  end;

  frmENPlanWork2ActFailureEdit := TfrmENPlanWork2ActFailureEdit.Create(Application, dsEdit);
     try
      if frmENPlanWork2ActFailureEdit.ShowModal = mrOk then
      begin
      pcCalculationChange(self);
      end;
    finally
      frmENPlanWork2ActFailureEdit.Free;
      frmENPlanWork2ActFailureEdit:=nil;
    end;
  end
  else

  begin

  frmENPlanWork2ActFailureEdit := TfrmENPlanWork2ActFailureEdit.Create(Application, dsInsert);
     try

     frmENPlanWork2ActFailureEdit.planCode := planCode;

     ENActFailureObj := ENActFailure.Create;
     ENPlanWork2ActFailureObj := ENPlanWork2ActFailure.Create;

     SetNullIntProps(ENActFailureObj);
     SetNullXSProps(ENActFailureObj);

     SetNullIntProps(ENPlanWork2ActFailureObj);
     SetNullXSProps(ENPlanWork2ActFailureObj);

      if frmENPlanWork2ActFailureEdit.ShowModal = mrOk then
      begin
         pcCalculationChange(self);
      end;
    finally
      frmENPlanWork2ActFailureEdit.Free;
      frmENPlanWork2ActFailureEdit:=nil;
    end;
  end;

end;

function TfrmENServicesCalculationEdit.getBytOrProm : Boolean;
var isByt : Boolean;
begin
    isByt := False;
    if rgContragentType.ItemIndex + 1 = ENConsts.ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL then
      isByt := True
    else
    begin
      if rgContragentType.ItemIndex + 1 IN [ENConsts.ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET, ENConsts.ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NONBUDGET] then
        isByt := False
        else
        begin
          // Такого быть не должно
          raise Exception.Create('Помилка при визначенні юр / фіз (тип контрагента)');
        end;
    end;
    Result := isByt;
end;


end.

