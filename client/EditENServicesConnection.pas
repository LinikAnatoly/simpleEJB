unit EditENServicesConnection;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
    EnergyproController, EnergyproController2, ENServicesObjectController, ENPlanWorkController,
    ExtCtrls, TB2Item, TB2Dock, TB2Toolbar , ShowENServicesConnection, ENTechConditionsServicesController,
    Planner, ENPriconnectionDataController,ENPlanWorkStatusController,
    AdvObj, ENCalc2ConnectTariffController, ShowRQOrg, ShowRQOrgRschet,
    RQOrgController, RQOrgRschetController, ENTechAgreement2ServicesObjectController,
    AdvToolBar, ENPlanWork2ClassificationTypeController, Clipbrd, ENSOTechParamsController, EditDFDocAttachment,
    ShellAPI, ENDocAttachment2ENServicesObjectController, EditENPrintPlanTaskConnection, EditENFaxMessage,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, EditENPlanWorkAddInfo, UserController
  , Math, ENSOValuesController, ENSOBillController, ENPayment2SOController
  , ENRecordPointBytController, ENRecordPointPromController, WFPackController,
  Generics.Collections,
  FACalculationController, EditFACalculation, CCGlobal, Mask;

const
    ADDITIONAL_AGREEMENT_OVERLOADING = 1;
    ADDITIONAL_AGREEMENT_MATERIALS_DELAY = 2;
    ADDITIONAL_AGREEMENT_PROJECT_CHANGINGS = 3;

    BILL_SUM_WITH_VAT_COLUMN_INDEX = 3;
    BILL_SUM_WITHOUT_VAT_COLUMN_INDEX = 4;
    BILL_SUM_VAT_COLUMN_INDEX = 5;

    PAYMENT_SUM_WITH_VAT_COLUMN_INDEX = 2;
    PAYMENT_SUM_WITHOUT_VAT_COLUMN_INDEX = 3;
    PAYMENT_SUM_VAT_COLUMN_INDEX = 4;

type
    TfrmENServicesConnectionEdit = class(TDialogForm)
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
    spbENElementElement: TSpeedButton;
    lblENElementElementName: TLabel;
    spbContractNumberSelect: TSpeedButton;
    lblContractNumberServices: TLabel;
    lblDateEdit: TLabel;
    edtContractNumber: TEdit;
    edtContractDateServices: TDateTimePicker;
    edtFinDocID: TEdit;
    edtCommentGen: TMemo;
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
    lblContragentBankMfo: TLabel;
    edtContragentBankAccount: TEdit;
    edtContragentBankName: TEdit;
    edtContragentBankMfo: TEdit;
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
    actPrintCalculation: TAction;
    HTTPRIOENPlanWork2ClassificationType: THTTPRIO;
    pnlDistance: TPanel;
    edtContractServicesDistance: TEdit;
    lblContractServicesDistance: TLabel;
    lblStatus: TLabel;
    edtStatus: TEdit;
    actBudgetApproved: TAction;
    tbRecalcDistance: TToolButton;
    HTTPRIOENPlanWork: THTTPRIO;
    gbExecutorInfo: TGroupBox;
    rgContragentType: TRadioGroup;
    lblWarrantFIO: TLabel;
    edtWarrantFIO: TEdit;
    lblWarrantNumber: TLabel;
    edtWarrantNumber: TEdit;
    spbWarrantNumber: TSpeedButton;
    tsActs: TTabSheet;
    Panel1: TPanel;
    tbActions: TTBToolbar;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem47: TTBItem;
    TBItem7: TTBItem;
    TBItem46: TTBItem;
    Panel2: TPanel;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem8: TTBItem;
    Splitter2: TSplitter;
    actViewENActIncome: TAction;
    actViewENAct: TAction;
    actUpdateENActIncome: TAction;
    actUpdateENAct: TAction;
    HTTPRIOENAct: THTTPRIO;
    lblCode: TLabel;
    edtCode: TEdit;
    grpENRecordPoint: TGroupBox;
    lblContractServicesSumma: TLabel;
    edtContractServicesSumma: TEdit;
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
    HTTPRIOTKClassification2ENDepartment: THTTPRIO;
    pnl2: TPanel;
    sgENPlanWork2ClassificationType: TAdvStringGrid;
    spl2: TSplitter;
    sgENPlanWorkItem: TAdvStringGrid;
    lbl8: TLabel;
    edtDepartmentForServices: TEdit;
    btnENDepartmentDepartment: TSpeedButton;
    actInsertTimeLine: TAction;
    HTTPRIOENDeliveryTimePlan: THTTPRIO;
    lblDeliveryOneWay: TLabel;
    lblContragentObjectWork: TLabel;
    edtContragentObjectWork: TEdit;
    lblTechConditionsNumber: TLabel;
    edtTechConditionsNumber: TEdit;
    spbTechConditions: TSpeedButton;
    lblTechConditionsDate: TLabel;
    edtTechConditionsDate: TDateTimePicker;
    HTTPRIOENTechConditionsObjects: THTTPRIO;
    Label6: TLabel;
    rgPayable: TRadioGroup;
    chbIsCustomerMaterials: TCheckBox;
    actActTransferSave: TAction;
    actActTransferPrint: TAction;
    actActTransferMoveToFK: TAction;
    actActTransferUnMoveToFK: TAction;
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
    edtConnectionTariffName: TEdit;
    edtConnectionTariffValue: TEdit;
    Label20: TLabel;
    edtResponsiblePerson: TEdit;
    lblExecutionTerm: TLabel;
    edtExecutionTerm: TEdit;
    cbBuildersArea: TCheckBox;
    alContragents: TActionList;
    actViewContragent: TAction;
    actInsertContragent: TAction;
    actDeleteContragent: TAction;
    actEditContragent: TAction;
    actUpdateContragent: TAction;
    actENActIncomeTechConditionsPrint: TAction;
    gbContragents: TGroupBox;
    HTTPRIOENTechConditionsServices: THTTPRIO;
    HTTPRIOENElement: THTTPRIO;
    HTTPRIOENConnectionTariff: THTTPRIO;
    HTTPRIOENConnectionTariffEntry: THTTPRIO;
    HTTPRIOENTechCondResponsibles: THTTPRIO;
    HTTPRIOENPriconnectionData: THTTPRIO;
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
    chkBaseStation: TCheckBox;
    cbSmallArchFrm: TCheckBox;
    actViewUnitedGroup: TAction;
    HTTPRIOENUnitedGroupConnections: THTTPRIO;
    HTTPRIOENSubstation04: THTTPRIO;
    HTTPRIOENUnitedGroup2TechCondServices: THTTPRIO;
    actEditUnitedGroup: TAction;
    actUpdateUnitedGroup: TAction;
    sgENActIncomeTechConditions: TAdvStringGrid;
    alActs: TActionList;
    actViewIncome: TAction;
    actInsertIncome: TAction;
    actDeleteIncome: TAction;
    actEditIncome: TAction;
    actUpdateIncome: TAction;
    actFilterIncome: TAction;
    actNoFilterIncome: TAction;
    actUpdateActHoz: TAction;
    actUpdateServicesFromSide: TAction;
    actViewActHoz: TAction;
    actViewActFromSide: TAction;
    actSignaturedTechIncome: TAction;
    actUnSignaturedTechIncome: TAction;
    actCloseTechIncome: TAction;
    actUnCloseTechIncome: TAction;
    HTTPRIOENActIncomeTechConditions: THTTPRIO;
    pmUnitedGroups: TPopupMenu;
    miAddUnitedGroups: TMenuItem;
    miDeleteUnitedGroups: TMenuItem;
    miAddToExistGroup: TMenuItem;
    pcActs: TPageControl;
    tsActsHoz: TTabSheet;
    sgENAct: TAdvStringGrid;
    tsActsServicesFromSide: TTabSheet;
    sgRQFKOrder: TAdvStringGrid;
    HTTPRIORQFKOrder: THTTPRIO;
    actUpdateENActs: TAction;
    TBItem13: TTBItem;
    pmActsIncome: TPopupMenu;
    miView: TMenuItem;
    miInsert: TMenuItem;
    miDelete: TMenuItem;
    miEdit: TMenuItem;
    miUpdate: TMenuItem;
    miFilter: TMenuItem;
    miNoFilter: TMenuItem;
    MenuItem2: TMenuItem;
    miSignaturedTechIncome: TMenuItem;
    miUnSignaturedTechIncome: TMenuItem;
    micloseTechIncome: TMenuItem;
    miUnCloseTechIncome: TMenuItem;
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
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    HTTPRIOENPayment2SO: THTTPRIO;
    actRecalcDisrance: TAction;
    actCopyPlan: TAction;
    chbIsDisconnectionNeeded: TCheckBox;
    edt2ConnectionTariffName: TEdit;
    edt2ConnectionTariffValue: TEdit;
    cbIsUse2Tariffs: TCheckBox;
    lblPower2Tariffs: TLabel;
    edtSumma1Tariff: TEdit;
    edtSumma2Tariff: TEdit;
    N11: TMenuItem;
    miPreConfirm: TMenuItem;
    miConfirm: TMenuItem;
    miUndoConfirm: TMenuItem;
    actPreConfirm: TAction;
    actConfirm: TAction;
    actUndoConfirm: TAction;
    tsENTechAgreement: TTabSheet;
    gbPartner: TGroupBox;
    lblTKMaterialsMaterialName: TLabel;
    edtRQOrgOrgName: TEdit;
    spbRQOrgOrg: TSpeedButton;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edtRschet: TEdit;
    edtBank: TEdit;
    edtMfo: TEdit;
    lblTechContractNumber: TLabel;
    edtTechContractNumber: TEdit;
    spbTechContractNumber: TSpeedButton;
    lblObjectName: TLabel;
    edtObjectName: TMemo;
    lblCostWorks: TLabel;
    lblBasisForAction: TLabel;
    edtCostWorks: TEdit;
    edtBasisForAction: TMemo;
    gbAct: TGroupBox;
    btnPrintTechAgreement: TButton;
    btnSaveTechAgreement: TButton;
    btnPrintActTechAgreement: TButton;
    gbWarrantAgreement: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    spbAgreementWarrant: TSpeedButton;
    edtAgreementWarrantFIO: TEdit;
    edtAgreementWarrantNumber: TEdit;
    gbWarrantActTechAgreement: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    spbActWarrantNumber: TSpeedButton;
    edtActWarrantFIO: TEdit;
    edtActWarrantNumber: TEdit;
    lblActNumber: TLabel;
    lblActDate: TLabel;
    edtActDate: TDateTimePicker;
    edtActNumber: TEdit;
    HTTPRIOENTechAgreement2ServicesObject: THTTPRIO;
    gbPlanForServices: TGroupBox;
    Panel8: TPanel;
    TBToolbar4: TTBToolbar;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    TBItem16: TTBItem;
    TBItem17: TTBItem;
    TBItem19: TTBItem;
    sgPlanForServices: TAdvStringGrid;
    actCreatingPlanForServices: TAction;
    actViewPlanForServices: TAction;
    actEditPlanForServices: TAction;
    actDeletePlanForServices: TAction;
    actEditENAct: TAction;
    edtCustomPlanDate: TDateTimePicker;
    gbPrint: TGroupBox;
    btnAccompanyingSheet1: TButton;
    btnPrintContract: TButton;
    HTTPRIOENDocAttachment: THTTPRIO;
    HTTPRIOCNPack: THTTPRIO;
    HTTPRIOENDepartment: THTTPRIO;
    chkGeograhicFarObject: TCheckBox;
    btnAgreeTechTermsPrepare: TButton;
    tsGrantOfLand: TTabSheet;
    gbActGL: TGroupBox;
    lbl10: TLabel;
    lbl11: TLabel;
    grp2: TGroupBox;
    lbl12: TLabel;
    lbl13: TLabel;
    spbActWarrantNumberGL: TSpeedButton;
    edtActWarrantFIOGL: TEdit;
    edtActWarrantNumberGL: TEdit;
    edtActDateGL: TDateTimePicker;
    edtActNumberGL: TEdit;
    btnSaveTechAgreementGL: TButton;
    btnPrintTechAgreementGL: TButton;
    btnPrintActTechAgreementGL: TButton;
    grp3: TGroupBox;
    lblTKMaterialsMaterialNameGL: TLabel;
    spbRQOrgOrgGL: TSpeedButton;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lblTechContractNumberGL: TLabel;
    spbTechContractNumberGL: TSpeedButton;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    edtRQOrgOrgNameGL: TEdit;
    edtRschetGL: TEdit;
    edtBankGL: TEdit;
    edtMfoGL: TEdit;
    edtTechContractNumberGL: TEdit;
    edtObjectNameGL: TMemo;
    edtCostWorksGL: TEdit;
    edtBasisForActionGL: TMemo;
    grp4: TGroupBox;
    lbl22: TLabel;
    lbl23: TLabel;
    spbAgreementWarrantGL: TSpeedButton;
    edtAgreementWarrantFIOGL: TEdit;
    edtAgreementWarrantNumberGL: TEdit;
    gbPlanForServicesGL: TGroupBox;
    pnl4: TPanel;
    TBToolbar5: TTBToolbar;
    TBItem20: TTBItem;
    TBItem21: TTBItem;
    TBItem22: TTBItem;
    TBItem23: TTBItem;
    TBItem24: TTBItem;
    sgPlanForServicesGL: TAdvStringGrid;
    actCreatingPlanForServicesGL: TAction;
    actViewPlanForServicesGL: TAction;
    actEditPlanForServicesGL: TAction;
    actDeletePlanForServicesGL: TAction;
    edtCostWorksNDSGL: TEdit;
    Label14: TLabel;
    edtArea: TEdit;
    Label19: TLabel;
    cbbExecutorTax: TComboBox;
    lbl14: TLabel;
    edtPartnerPosition: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    edtPartnerFIO: TEdit;
    pmAccSheet: TPopupMenu;
    miAccompanyingSheet1: TMenuItem;
    miAccompanyingSheet2: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N211: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    miAccompanyingSheet4: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N110: TMenuItem;
    N20: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N111: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N112: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N113: TMenuItem;
    N41: TMenuItem;
    N210: TMenuItem;
    N213: TMenuItem;
    N214: TMenuItem;
    N215: TMenuItem;
    N216: TMenuItem;
    HTTPRIOENServicesFromSideObject: THTTPRIO;
    tsContractForProject: TTabSheet;
    gbPartnerProject: TGroupBox;
    lblOrgNameProject: TLabel;
    spbOrgNameProject: TSpeedButton;
    lblRschetOrgProject: TLabel;
    lblBankOrgProject: TLabel;
    lblMfoOrgProject: TLabel;
    lblContractNumberProject: TLabel;
    spbContractNumberProject: TSpeedButton;
    lblCostWorksProject: TLabel;
    lblBasisForActionProject: TLabel;
    edtOrgNameProject: TEdit;
    edtRschetOrgProject: TEdit;
    edtBankOrgProject: TEdit;
    edtMfoOrgProject: TEdit;
    edtContractNumberProject: TEdit;
    edtCostWorksProject: TEdit;
    edtBasisForActionProject: TMemo;
    grpWarrantAgreementProject: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    spbAgreementWarrantNumberProject: TSpeedButton;
    edtAgreementWarrantFIOProject: TEdit;
    edtAgreementWarrantNumberProject: TEdit;
    btnSaveAgreementProject: TButton;
    btnPrintAgreementProject: TButton;
    gbPlanForServicesProject: TGroupBox;
    Panel9: TPanel;
    TBToolbar6: TTBToolbar;
    TBItem25: TTBItem;
    TBItem26: TTBItem;
    TBItem27: TTBItem;
    TBItem28: TTBItem;
    TBItem29: TTBItem;
    sgPlanForServicesProject: TAdvStringGrid;
    actCreatingPlanForServicesProject: TAction;
    actViewPlanForServicesProject: TAction;
    actEditPlanForServicesProject: TAction;
    actDeletePlanForServicesProject: TAction;
    chkPrintTechTermsDate: TCheckBox;
    Button1: TButton;
    Label23: TLabel;
    edtPartnerAddress: TEdit;
    N42: TMenuItem;
    miAccompanyingSheetForAdditionalAgreement2: TMenuItem;
    miAccompanyingSheetForAdditionalAgreement1: TMenuItem;
    miAccompanyingSheet10: TMenuItem;
    gbNecessityBuilding: TGroupBox;
    Panel10: TPanel;
    TBToolbar7: TTBToolbar;
    TBItem30: TTBItem;
    TBItem31: TTBItem;
    TBItem32: TTBItem;
    TBItem33: TTBItem;
    TBItem34: TTBItem;
    sgENContragent: TAdvStringGrid;
    Panel11: TPanel;
    TBToolbar8: TTBToolbar;
    TBItem39: TTBItem;
    ilNecessityBuilding: TImageList;
    actlstNecessityBuilding: TActionList;
    actViewNecessityBuilding: TAction;
    actInsertNecessityBuilding: TAction;
    actDeleteNecessityBuilding: TAction;
    actEditNecessityBuilding: TAction;
    actUpdateNecessityBuilding: TAction;
    actFilterNecessityBuilding: TAction;
    actNoFilterNecessityBuilding: TAction;
    pmNecessityBuilding: TPopupMenu;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    sgENNecessityBuilding: TAdvStringGrid;
    HTTPRIOENNecessityBuilding: THTTPRIO;
    PopupMenu2: TPopupMenu;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    Button2: TButton;
    tsNode: TTabSheet;
    ImageListCCState: TImageList;
    ImageListCC: TImageList;
    pmMainTree: TPopupMenu;
    btnTreeRefresh: TMenuItem;
    btnTreeCollapse: TMenuItem;
    MenuItem30: TMenuItem;
    btnNodeNameToClipboard: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    gbButtons: TGroupBox;
    sgENSO2Node: TAdvStringGrid;
    grpCCNodeTree: TGroupBox;
    MainTree: TTreeView;
    HTTPRIOCCNodeExt: THTTPRIO;
    HTTPRIOCCNode: THTTPRIO;
    HTTPRIOENSO2Node: THTTPRIO;
    HTTPRIOENSO2NodeType: THTTPRIO;
    HTTPRIOENSOValues: THTTPRIO;
    pmSOValues: TPopupMenu;
    MenuItem36: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem38: TMenuItem;
    MenuItem39: TMenuItem;
    alSOValues: TActionList;
    actInsertSOVal: TAction;
    actDeleteSOVal: TAction;
    actEditSOVal: TAction;
    actUpdateSOVal: TAction;
    gbPriconnectionData: TGroupBox;
    lblConnectionPowerPlaces: TLabel;
    spbENElement: TSpeedButton;
    lblConnectionPowerSecondary: TLabel;
    spbENElementSecondary: TSpeedButton;
    btnCalculatePaySum: TButton;
    btnPrintCalculate: TButton;
    edtENElementName: TEdit;
    edtENElementNameSecondary: TEdit;
    btnCalculatePaySumSecondary: TButton;
    gbTechParams: TGroupBox;
    lblENConnectionLevelLevelRefName: TLabel;
    edtENConnectionLevelLevelRefName: TEdit;
    spbENConnectionLevelLevelRef: TSpeedButton;
    lblENPowerReliabilityCategoryCategoryRefName: TLabel;
    edtENPowerReliabilityCategoryCategoryRefName: TEdit;
    spbENPowerReliabilityCategoryCategoryRef: TSpeedButton;
    spbENConnectionPowerPointPowerPointRef: TSpeedButton;
    edtENConnectionPowerPointPowerPointRefName: TEdit;
    lblENConnectionPowerPointPowerPointRefName: TLabel;
    lblENConnectionPhasityPhasityRefName: TLabel;
    edtENConnectionPhasityPhasityRefName: TEdit;
    spbENConnectionPhasityPhasityRef: TSpeedButton;
    spbLineType: TSpeedButton;
    edtLineType: TEdit;
    lblLineType: TLabel;
    lblInstallationType: TLabel;
    edtInstallationType: TEdit;
    spbInstallationType: TSpeedButton;
    spbLocationType: TSpeedButton;
    edtLocationType: TEdit;
    lblLocationType: TLabel;
    btnSaveTechParams: TButton;
    spbLevelClear: TSpeedButton;
    spbPhasityClear: TSpeedButton;
    spbPowerReliabilityClear: TSpeedButton;
    spbConnectionPowerPointClear: TSpeedButton;
    spbInstallationTypeClear: TSpeedButton;
    spbLineTypeClear: TSpeedButton;
    spbLocationTypeClear: TSpeedButton;
    edtSubstationBuildSum: TEdit;
    Label24: TLabel;
    Label25: TLabel;
    edtCalcSum: TEdit;
    Label26: TLabel;
    lblClosestDistance: TLabel;
    edtClosestDistance: TEdit;
    HTTPRIOENSOTechParams: THTTPRIO;
    btnDistrAgree: TButton;
    HTTPRIOENSO2DistrAgree: THTTPRIO;
    miAccompanyingSheet11: TMenuItem;
    miAccompanyingSheet12: TMenuItem;
    tsENDocAttachment: TTabSheet;
    actAttachment: TActionList;
    actAddAttachments: TAction;
    actLoadAttachments: TAction;
    actDeleteAttachments: TAction;
    actEditAttachments: TAction;
    ToolBar7: TToolBar;
    ToolButton23: TToolButton;
    btnAddAttachments: TToolButton;
    ToolButton28: TToolButton;
    ToolButton29: TToolButton;
    sgENDocAttachment: TAdvStringGrid;
    HTTPRIOCNAttachment: THTTPRIO;
    btnPrintPlanTaskConnection: TButton;
    grpPlans: TGroupBox;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    ToolButton16: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    ToolButton17: TToolButton;
    ToolButton22: TToolButton;
    sgENPlanWork: TAdvStringGrid;
    Splitter1: TSplitter;
    Label9: TLabel;
    sgENSelectedPlanItems: TAdvStringGrid;
    Splitter7: TSplitter;
    pmPrintContract: TPopupMenu;
    N61: TMenuItem;
    N62: TMenuItem;
    N63: TMenuItem;
    MenuItem90: TMenuItem;
    MenuItem91: TMenuItem;
    pmSO2Node: TPopupMenu;
    MenuItem40: TMenuItem;
    miAccompanyingSheetAdditionalAgreementAccountPayNoStandart1: TMenuItem;
    miAccompanyingSheetAdditionalAgreementAccountPayNoStandart2: TMenuItem;
    pmPrintBill: TPopupMenu;
    N73: TMenuItem;
    N74: TMenuItem;
    btnCNV: TToolButton;
    pmPlanTaskFaxMessage: TPopupMenu;
    N75: TMenuItem;
    N76: TMenuItem;
    TBItem9: TTBItem;
    N77: TMenuItem;
    gbSO2Node: TGroupBox;
    sgENSO2NodeOthers: TAdvStringGrid;
    GroupBox4: TGroupBox;
    btnSearchInTree: TButton;
    btnShowSO2NodesChild: TButton;
    pmSO2NodeOthers: TPopupMenu;
    MenuItem31: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem35: TMenuItem;
    MenuItem41: TMenuItem;
    N78: TMenuItem;
    btnSubstation: TButton;
    actViewSOVal: TAction;
    IdFTP1: TIdFTP;
    tsPowerReserve: TTabSheet;
    grpPowerReserve: TGroupBox;
    splPowerReserve: TSplitter;
    grpPowerReserveItems: TGroupBox;
    pmPowerReserve: TPopupMenu;
    MenuItem43: TMenuItem;
    MenuItem44: TMenuItem;
    MenuItem46: TMenuItem;
    HTTPRIOENCalcPowerReserve: THTTPRIO;
    alPowerReserve: TActionList;
    actInsertPowerReserve: TAction;
    actDeletePowerReserve: TAction;
    actUpdatePowerReserve: TAction;
    sgENCalcPowerReserve: TAdvStringGrid;
    ToolBar6: TToolBar;
    ToolButton31: TToolButton;
    ToolButton32: TToolButton;
    ToolButton34: TToolButton;
    sgENCalcPowerReserveItem: TAdvStringGrid;
    HTTPRIOENCalcPowerReserveItem: THTTPRIO;
    ToolBar8: TToolBar;
    ToolButton35: TToolButton;
    ToolButton36: TToolButton;
    ToolButton38: TToolButton;
    pmPowerReserveItems: TPopupMenu;
    MenuItem47: TMenuItem;
    MenuItem48: TMenuItem;
    MenuItem50: TMenuItem;
    alPowerReserveItems: TActionList;
    actInsertPowerReserveItem: TAction;
    actDeletePowerReserveItem: TAction;
    actUpdatePowerReserveItem: TAction;
    btnGeneratePowerReserve: TToolButton;
    actGeneratePowerReserve: TAction;
    btnPrintReserve: TToolButton;
    btnPrintSO2NodesLinks: TButton;
    HTTPRIOCCElementData: THTTPRIO;
    lblENServicesContractStatusCaption: TLabel;
    HTTPRIOENServicesContractStatus: THTTPRIO;
    lblENServicesContractStatus: TLabel;
    btnTransliterate: TToolButton;
    actSaveFinexecutDepartment: TAction;
    HTTPRIOAuth: THTTPRIO;
    miChangeFinexecutorForPlan: TMenuItem;
    tsSheets4SO: TTabSheet;
    ToolBar9: TToolBar;
    ToolButton30: TToolButton;
    ToolButton33: TToolButton;
    ToolButton37: TToolButton;
    ToolButton39: TToolButton;
    ToolButton40: TToolButton;
    sgENSheets4SO: TAdvStringGrid;
    HTTPRIOENSheets4SO: THTTPRIO;
    pmSheets4SO: TPopupMenu;
    MenuItem42: TMenuItem;
    MenuItem45: TMenuItem;
    MenuItem49: TMenuItem;
    MenuItem51: TMenuItem;
    MenuItem52: TMenuItem;
    alSheets4SO: TActionList;
    actViewSheet4SO: TAction;
    actInsertSheet4SO: TAction;
    actDeleteSheet4SO: TAction;
    actEditSheet4SO: TAction;
    actUpdateSheet4SO: TAction;
    miInvertSelectionCheckboxes: TMenuItem;
    actViewDFDocBySheet4SO: TAction;
    ToolButton41: TToolButton;
    HTTPRIODFDoc: THTTPRIO;
    N80: TMenuItem;
    N81: TMenuItem;
    N217: TMenuItem;
    N82: TMenuItem;
    actCreateNewSheet4SO: TAction;
    actPrintSheet4SO: TAction;
    ToolButton42: TToolButton;
    ToolButton43: TToolButton;
    N83: TMenuItem;
    N84: TMenuItem;
    gbLandLeaseAgreement: TGroupBox;
    ToolBar10: TToolBar;
    gbBills: TGroupBox;
    pnlBills: TPanel;
    tbBills: TTBToolbar;
    TBItem10: TTBItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBItem40: TTBItem;
    TBItem41: TTBItem;
    TBItem42: TTBItem;
    sgENSOBill: TAdvStringGrid;
    gbPayments: TGroupBox;
    ToolBarPayment: TToolBar;
    btnViewPayment: TToolButton;
    btnInsertPayment: TToolButton;
    ToolButton44: TToolButton;
    ToolButton46: TToolButton;
    ToolButton47: TToolButton;
    btnDeletePayment: TToolButton;
    btnEditPayment: TToolButton;
    btnUpdatePayment: TToolButton;
    sgENPayment2SO: TAdvStringGrid;
    HTTPRIOENSOBill: THTTPRIO;
    actionListBills: TActionList;
    actViewENSOBill: TAction;
    actAddENSOBill: TAction;
    actRemoveENSOBill: TAction;
    ToolButton49: TToolButton;
    ToolBar11: TToolBar;
    ToolButton48: TToolButton;
    sgENSOLeaseAgreement: TAdvStringGrid;
    HTTPRIOFINContracts: THTTPRIO;
    alLandLeaseAgreement: TActionList;
    actAddLandLeaseAgreement: TAction;
    actViewLandLeaseAgreement: TAction;
    actDeleteLandLeaseAgreement: TAction;
    actUpdateLandLeaseAgreement: TAction;
    actEditENSOBill: TAction;
    actUpdateENSOBill: TAction;
    actPrintENSOBill: TAction;
    actViewLandLeaseAgreementFinCol: TAction;
    HTTPRIOENSOLeaseAgreement: THTTPRIO;
    pcDohovoryPidryadu: TPageControl;
    tsDohovoryPidryadu: TTabSheet;
    tsDohovorPidryaduForDevPKD: TTabSheet;
    gbSOContract: TGroupBox;
    ToolBar12: TToolBar;
    ToolButton50: TToolButton;
    ToolButton51: TToolButton;
    ToolButton52: TToolButton;
    ToolButton53: TToolButton;
    ToolBar13: TToolBar;
    ToolButton54: TToolButton;
    ToolButton55: TToolButton;
    sgENSOContract: TAdvStringGrid;
    alENSOContract: TActionList;
    actInsertENSOContract: TAction;
    actViewtENSOContract: TAction;
    actDeleteatENSOContract: TAction;
    actUpdateENSOContract: TAction;
    actViewENSOContactFinCol: TAction;
    actInsertFinDocIdFromENPlanWork: TAction;
    HTTPRIOENSOContract: THTTPRIO;
    tsBills: TTabSheet;
    sgENRecordPoint: TAdvStringGrid;
    HTTPRIOENRecordPointByt: THTTPRIO;
    HTTPRIOENRecordPointProm: THTTPRIO;
    tsENSOValues: TTabSheet;
    grpSOValues: TGroupBox;
    sgENSOValues: TAdvStringGrid;
    ToolBar5: TToolBar;
    btnView: TToolButton;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    ToolButton27: TToolButton;
    GroupBox1: TGroupBox;
    lblConnectionSource: TLabel;
    mmoConnectionSource: TMemo;
    Label7: TLabel;
    lblConnectionPowerPoint: TLabel;
    mmoConnectionPowerPlaces: TMemo;
    mmoConnectionPowerPoint: TMemo;
    mmoConnectionPowerPointNum: TMemo;
    mmoConnectionPowerPlacesNum: TMemo;
    mmoConnectionSourceNum: TMemo;
    lblConnectionSourceNum: TLabel;
    lblConnectionPowerPointNum: TLabel;
    lblConnectionPowerPlacesNum: TLabel;
    lblENDepartmentDepartmentName: TLabel;
    edtENDepartmentDepartmentName: TEdit;
    spbENDepartmentDepartment: TSpeedButton;
    edtContractDateFinal: TDateTimePicker;
    lblContractDateFinal: TLabel;
    lblContractDate: TLabel;
    gbTechnicalParameters: TGroupBox;
    lblContractServicesPower: TLabel;
    edtContractServicesPower: TEdit;
    lblEPVoltageNominalVoltagenominalName: TLabel;
    spbEPVoltageNominalVoltagenominal: TSpeedButton;
    edtEPVoltageNominalVoltagenominalName: TEdit;
    lblCustomerMailingAddress: TLabel;
    lblPostCode: TLabel;
    edtPostCode: TEdit;
    edtCustomerMailingAddress: TMemo;
    N12: TMenuItem;
    miAdditionalAgreement1: TMenuItem;
    miAdditionalAgreement2: TMenuItem;
    miAdditionalAgreement3: TMenuItem;
    N13: TMenuItem;
    miAccompanyingSheetDistributionContract: TMenuItem;
    miAccompanyingSheetDistributionAddAgreement: TMenuItem;
    N14: TMenuItem;
    btnMeteringReport: TButton;
    miAccompanyingSheetBillFinal: TMenuItem;
    HTTPRIOWFPack2ServicesObject: THTTPRIO;
    HTTPRIOWFPack: THTTPRIO;
    tsFACalc: TTabSheet;
    sgFACalculation: TAdvStringGrid;
    ToolBar14: TToolBar;
    ToolButton56: TToolButton;
    ToolButton57: TToolButton;
    ToolButton58: TToolButton;
    ToolButton59: TToolButton;
    ToolButton60: TToolButton;
    HTTPRIOFACalculation: THTTPRIO;
    pmFACalc: TPopupMenu;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem53: TMenuItem;
    MenuItem54: TMenuItem;
    MenuItem55: TMenuItem;
    MenuItem56: TMenuItem;
    MenuItem57: TMenuItem;
    alFACalc: TActionList;
    actFAView: TAction;
    actFAInsert: TAction;
    actFADelete: TAction;
    actFAEdit: TAction;
    actFAUpdate: TAction;
    btnSetBuhStatus: TButton;
    spbCustomerWarrant: TSpeedButton;
    dtpContractTerm: TDateTimePicker;
    lblContractTerm: TLabel;
    grpFinResult: TGroupBox;
    mmoFinResult: TMemo;
    edtClosestDistance2: TEdit;
    lblClosestDistance2: TLabel;
    lblCityType: TLabel;
    edtCityTypeName: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    edtCityName: TEdit;
    Label1: TLabel;
    mmoObject4ClosestDistnceName: TMemo;
    mmoObject4ClosestDistnceName2: TMemo;
    Label5: TLabel;
    edtInfoDistance: TEdit;
    actSaveAttachmentAs: TAction;
    dlgSave: TSaveDialog;
    ToolButton61: TToolButton;
    miAccompanyingSheetToATechnicalSolution: TMenuItem;
    miAccompanyingSheetToAccount: TMenuItem;
    miAccompanyingSheetPetition: TMenuItem;
    alCommunicationWithServicesOnSide: TActionList;
    actViewSOCalculation: TAction;
    actAddBindCalculationToConnection: TAction;
    actRemoveBindCalculationToConnection: TAction;
    HTTPRIOENElement2ENElement: THTTPRIO;
    N15: TMenuItem;
    N16: TMenuItem;
    lblWarningSecurityZone: TLabel;
    miIssue: TMenuItem;
    btnRemovePlanFromTechCond: TToolButton;
    N25: TMenuItem;
    HTTPRIODFDocServiceNote: THTTPRIO;
    lblDisclaimerServices: TLabel;
    lblDemographicCode: TLabel;
    edtDemographicCode: TMaskEdit;
    edtOwnershipRecordNumber: TEdit;
    edtRealEstateRegNumber: TEdit;
    lblOwnershipRecordNumber: TLabel;
    lblRealEstateRegNumber: TLabel;
    grpAdditionalAgreements: TGroupBox;
    sgFINAdditionalAgreements: TAdvStringGrid;
    miAccompanyingSheetWorkAcceptance: TMenuItem;
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
    procedure btnPrintBillClick(Sender: TObject);
    procedure actBudgetApprovedExecute(Sender: TObject);
    procedure actUpdateObject(Sender: TObject);
    procedure spbWarrantNumberClick(Sender: TObject);
    procedure actViewENActExecute(Sender: TObject);
    procedure actViewENActIncomeExecute(Sender: TObject);
    procedure edtContractServicesPowerChange(Sender: TObject);
    procedure actPrintKoshtorisExecute(Sender: TObject);
    procedure actPrintCalcNkreExecute(Sender: TObject);
    procedure cbbBasisTypeChange(Sender: TObject);
    procedure btnPostingsClick(Sender: TObject);

    procedure sgDepartmentClick(Sender: TObject);
    procedure edtReservedTimeStartChange(Sender: TObject);

    function getSumTimeWorkForCalculation(codePlan : Integer):Double;
    procedure chkTUClick(Sender: TObject);
    procedure rgContragentTypeClick(Sender: TObject);
    procedure spbTechConditionsClick(Sender: TObject);
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
    procedure sgENPlanWorkRightClickCell(Sender: TObject; ARow,
      ACol: Integer);
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
    procedure actEditCalculationExecute(Sender: TObject);
    procedure cbBuildersAreaClick(Sender: TObject);
    procedure btnPrintFactCalcClick(Sender: TObject);
    procedure btnPrintBillForPrepaymentClick(Sender: TObject);
    procedure cbSmallArchFrmClick(Sender: TObject);
    procedure chkBaseStationClick(Sender: TObject);
    procedure actViewIncomeExecute(Sender: TObject);
    procedure actInsertIncomeExecute(Sender: TObject);
    procedure actDeleteIncomeExecute(Sender: TObject);
    procedure actEditIncomeExecute(Sender: TObject);
    procedure actUpdateIncomeExecute(Sender: TObject);
    procedure actUpdateActHozExecute(Sender: TObject);
    procedure actUpdateServicesFromSideExecute(Sender: TObject);
    procedure actUpdateENActsExecute(Sender: TObject);
    procedure spbENElementSecondaryClick(Sender: TObject);
    procedure actENActIncomeTechConditionsPrintExecute(Sender: TObject);
    procedure pmActsIncomePopup(Sender: TObject);
    procedure actSignaturedTechIncomeExecute(Sender: TObject);
    procedure actUnSignaturedTechIncomeExecute(Sender: TObject);
    procedure actCloseTechIncomeExecute(Sender: TObject);
    procedure actUnCloseTechIncomeExecute(Sender: TObject);
    procedure actLoadUnitedGroupsExecute(Sender: TObject);
    procedure actInsertPaymentExecute(Sender: TObject);
    procedure actDeletePaymentExecute(Sender: TObject);
    procedure actEditPaymentExecute(Sender: TObject);
    procedure ActViewPaymentExecute(Sender: TObject);
    procedure actRecalcDisranceExecute(Sender: TObject);
    procedure ToolButton17Click(Sender: TObject);
    procedure actCopyPlanExecute(Sender: TObject);
    procedure cbIsUse2TariffsClick(Sender: TObject);
    procedure actPreConfirmExecute(Sender: TObject);
    procedure actConfirmExecute(Sender: TObject);
    procedure actUndoConfirmExecute(Sender: TObject);
    procedure pmPlansPopup(Sender: TObject);
    procedure btnSaveTechAgreementClick(Sender: TObject);
    procedure spbRQOrgOrgClick(Sender: TObject);
    procedure btnPrintTechAgreementClick(Sender: TObject);
    procedure spbAgreementWarrantClick(Sender: TObject);
    procedure spbTechContractNumberClick(Sender: TObject);
    procedure spbActWarrantNumberClick(Sender: TObject);
    procedure btnPrintActTechAgreementClick(Sender: TObject);
    procedure actCreatingPlanForServicesExecute(Sender: TObject);
    procedure actViewPlanForServicesExecute(Sender: TObject);
    procedure actEditPlanForServicesExecute(Sender: TObject);
    procedure TBItem19Click(Sender: TObject);
    procedure actDeletePlanForServicesExecute(Sender: TObject);
    procedure actEditENActExecute(Sender: TObject);
    procedure mniAccompanyingSheet1_sign1DeputyTechDirClick(Sender: TObject);
    procedure mniAccompanyingSheet1_signTechDirClick(Sender: TObject);
    procedure mniAccompanyingSheet2_sign1DeputyTechDirClick(Sender: TObject);
    procedure mniAccompanyingSheet2_signTechDirClick(Sender: TObject);
    procedure mniAccompanyingSheet3_sign1DeputyTechDirClick(Sender: TObject);
    procedure mniAccompanyingSheet3_signTechDirClick(Sender: TObject);
    procedure btnAccompanyingSheet1Click(Sender: TObject);
    procedure mniAccompanyingSheet4_sign1DeputyTechDirClick(Sender: TObject);
    procedure mniAccompanyingSheet4_signTechDirClick(Sender: TObject);
    procedure mniAccompanyingSheet1_signOtherClick(Sender: TObject);
    procedure mniAccompanyingSheet4_signOtherClick(Sender: TObject);
    procedure mniAccompanyingSheet2_signOtherClick(Sender: TObject);
    procedure mniAccompanyingSheet3_signOtherClick(Sender: TObject);
    procedure mniAccompanyingSheet1_signDeputyTechDirConnectionClick(
      Sender: TObject);
    procedure mniAccompanyingSheet4_signDeputyTechDirConnectionClick(
      Sender: TObject);
    procedure mniAccompanyingSheet2_signDeputyTechDirConnectionClick(
      Sender: TObject);
    procedure mniAccompanyingSheet3_signDeputyTechDirConnectionClick(
      Sender: TObject);
    procedure btnPrintContractSupplyClick(Sender: TObject);
    procedure btnPrintContractUseClick(Sender: TObject);
    procedure mniAccompanyingSheet5_signDeputyTechDirConnectionClick(
      Sender: TObject);
    procedure mniAccompanyingSheet5_signTechDirClick(Sender: TObject);
    procedure mniAccompanyingSheet5_sign1DeputyTechDirClick(Sender: TObject);
    procedure mniAccompanyingSheet5_signOtherClick(Sender: TObject);
    procedure btnAgreeTechTermsPrepareClick(Sender: TObject);
    procedure SetAgreeTechTermsPrepareBtnVisible;
    procedure chkGeograhicFarObjectClick(Sender: TObject);
    procedure spbTechContractNumberGLClick(Sender: TObject);
    procedure spbRQOrgOrgGLClick(Sender: TObject);
    procedure spbAgreementWarrantGLClick(Sender: TObject);
    procedure spbActWarrantNumberGLClick(Sender: TObject);
    procedure btnSaveTechAgreementGLClick(Sender: TObject);
    procedure actCreatingPlanForServicesGLExecute(Sender: TObject);
    procedure TBItem24Click(Sender: TObject);
    procedure actViewPlanForServicesGLExecute(Sender: TObject);
    procedure actEditPlanForServicesGLExecute(Sender: TObject);
    procedure actDeletePlanForServicesGLExecute(Sender: TObject);
    procedure btnPrintTechAgreementGLClick(Sender: TObject);
    procedure btnPrintActTechAgreementGLClick(Sender: TObject);
    procedure mniAccompanyingSheet6_signDeputyTechDirConnectionClick(
      Sender: TObject);
    procedure mniAccompanyingSheet6_sign1DeputyTechDirClick(Sender: TObject);
    procedure mniAccompanyingSheet6_signOtherClick(Sender: TObject);
    procedure mniAccompanyingSheet6_signTechDirClick(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N211Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N212Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N110Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N111Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N112Click(Sender: TObject);
    procedure N36Click(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N113Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure N216Click(Sender: TObject);
    procedure N215Click(Sender: TObject);
    procedure N214Click(Sender: TObject);
    procedure N213Click(Sender: TObject);
    procedure pcActsChange(Sender: TObject);
    procedure spbContractNumberProjectClick(Sender: TObject);
    procedure spbOrgNameProjectClick(Sender: TObject);
    procedure spbAgreementWarrantNumberProjectClick(Sender: TObject);
    procedure btnSaveAgreementProjectClick(Sender: TObject);
    procedure btnPrintAgreementProjectClick(Sender: TObject);
    procedure actCreatingPlanForServicesProjectExecute(Sender: TObject);
    procedure TBItem29Click(Sender: TObject);
    procedure actViewPlanForServicesProjectExecute(Sender: TObject);
    procedure actEditPlanForServicesProjectExecute(Sender: TObject);
    procedure actDeletePlanForServicesProjectExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure miAccompanyingSheetForAdditionalAgreement1Click(Sender: TObject);
    procedure miAccompanyingSheetForAdditionalAgreement2Click(Sender: TObject);
    procedure actInsertNecessityBuildingExecute(Sender: TObject);
    procedure actUpdateNecessityBuildingExecute(Sender: TObject);
    procedure actViewNecessityBuildingExecute(Sender: TObject);
    procedure actDeleteNecessityBuildingExecute(Sender: TObject);
    procedure sgENNecessityBuildingDblClick(Sender: TObject);
    procedure actEditNecessityBuildingExecute(Sender: TObject);
    procedure N49Click(Sender: TObject);
    procedure N50Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure N52Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnSearchInTreeClick(Sender: TObject);
    procedure ShowNodeInTree(NodeCode: Integer);
    procedure UpdateMainTreeTop();
    procedure UpdateMainTreeBranch(parentNode: TTreeNode);
    procedure btnTreeRefreshClick(Sender: TObject);
    procedure btnTreeCollapseClick(Sender: TObject);
    procedure btnNodeNameToClipboardClick(Sender: TObject);
    procedure MenuItem33Click(Sender: TObject);
    procedure updateNodes;
    procedure MainTreeAdvancedCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; Stage: TCustomDrawStage;
      var PaintImages, DefaultDraw: Boolean);
    procedure MainTreeExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure MainTreeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sgENSO2NodeClick(Sender: TObject);
        procedure updateSOValues;
    procedure actInsertSOValExecute(Sender: TObject);
    procedure actDeleteSOValExecute(Sender: TObject);
    procedure actEditSOValExecute(Sender: TObject);
    procedure spbENConnectionLevelLevelRefClick(Sender: TObject);
    procedure spbENPowerReliabilityCategoryCategoryRefClick(Sender: TObject);
    procedure spbENConnectionPowerPointPowerPointRefClick(Sender: TObject);
    procedure spbENConnectionPhasityPhasityRefClick(Sender: TObject);
    procedure spbLineTypeClick(Sender: TObject);
    procedure spbInstallationTypeClick(Sender: TObject);
    procedure spbLocationTypeClick(Sender: TObject);
    procedure spbLevelClearClick(Sender: TObject);
    procedure spbPowerReliabilityClearClick(Sender: TObject);
    procedure spbConnectionPowerPointClearClick(Sender: TObject);
    procedure spbPhasityClearClick(Sender: TObject);
    procedure spbLineTypeClearClick(Sender: TObject);
    procedure spbInstallationTypeClearClick(Sender: TObject);
    procedure spbLocationTypeClearClick(Sender: TObject);
    procedure btnSaveTechParamsClick(Sender: TObject);
    procedure btnDistrAgreeClick(Sender: TObject);
    procedure N54Click(Sender: TObject);
    procedure N55Click(Sender: TObject);
    procedure N56Click(Sender: TObject);
    procedure N60Click(Sender: TObject);
    procedure N59Click(Sender: TObject);
    procedure N58Click(Sender: TObject);
    procedure actLoadAttachmentsExecute(Sender: TObject);
    procedure actAddAttachmentsExecute(Sender: TObject);
    procedure actDeleteAttachmentsExecute(Sender: TObject);
    procedure btnPrintPlanTaskConnectionClick(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure btnPrintContractClick(Sender: TObject);
    procedure N62Click(Sender: TObject);
    procedure MenuItem90Click(Sender: TObject);
    procedure MenuItem91Click(Sender: TObject);
    procedure MenuItem40Click(Sender: TObject);
    procedure N67Click(Sender: TObject);
    procedure N66Click(Sender: TObject);
    procedure N69Click(Sender: TObject);
    procedure N68Click(Sender: TObject);
    procedure N70Click(Sender: TObject);
    procedure N71Click(Sender: TObject);
    procedure N114Click(Sender: TObject);
    procedure N72Click(Sender: TObject);
    procedure N73Click(Sender: TObject);
    procedure N74Click(Sender: TObject);
    procedure btnCNVClick(Sender: TObject);
    procedure N76Click(Sender: TObject);
    procedure N75Click(Sender: TObject);
    procedure TBItem9Click(Sender: TObject);
    procedure N77Click(Sender: TObject);
    procedure MainTreeClick(Sender: TObject);
    procedure btnShowSO2NodesChildClick(Sender: TObject);
    procedure MenuItem31Click(Sender: TObject);
    procedure MenuItem35Click(Sender: TObject);
    procedure MenuItem41Click(Sender: TObject);
    procedure N79Click(Sender: TObject);
    procedure btnPrintSO2NodesLinksClick(Sender: TObject);
    procedure actViewSOValExecute(Sender: TObject);
    procedure sgENSOValuesDblClick(Sender: TObject);
    procedure actInsertPowerReserveExecute(Sender: TObject);
    procedure actDeletePowerReserveExecute(Sender: TObject);
    procedure actUpdatePowerReserveItemExecute(Sender: TObject);
    procedure actDeletePowerReserveItemExecute(Sender: TObject);
    procedure actInsertPowerReserveItemExecute(Sender: TObject);
    procedure sgENCalcPowerReserveClick(Sender: TObject);
    procedure actGeneratePowerReserveExecute(Sender: TObject);
    procedure btnPrintReserveClick(Sender: TObject);
    procedure btnSubstationClick(Sender: TObject);
    procedure btnTransliterateClick(Sender: TObject);
    procedure actSaveFinexecutDepartmentExecute(Sender: TObject);
    procedure actViewSheet4SOExecute(Sender: TObject);
    procedure actInsertSheet4SOExecute(Sender: TObject);
    procedure actDeleteSheet4SOExecute(Sender: TObject);
    procedure actEditSheet4SOExecute(Sender: TObject);
    procedure miInvertSelectionCheckboxesClick(Sender: TObject);
    procedure actViewDFDocBySheet4SOExecute(Sender: TObject);
    procedure N217Click(Sender: TObject);
    procedure sgENSOValuesColumnSizing(Sender: TObject; ACol,
      ColumnSize: Integer);
    procedure actViewENSOBillExecute(Sender: TObject);
    procedure actAddENSOBillExecute(Sender: TObject);
    procedure actRemoveENSOBillExecute(Sender: TObject);
    procedure actEditENSOBillExecute(Sender: TObject);
    procedure N82Click(Sender: TObject);
    procedure actCreateNewSheet4SOExecute(Sender: TObject);
    procedure actUpdateENSOBillExecute(Sender: TObject);
    procedure actPrintENSOBillExecute(Sender: TObject);

    procedure actPrintSheet4SOExecute(Sender: TObject);
    procedure actViewLandLeaseAgreementExecute(Sender: TObject);
    procedure updateSOLeaseAgreement;
    procedure actDeleteLandLeaseAgreementExecute(Sender: TObject);
    procedure actUpdateLandLeaseAgreementExecute(Sender: TObject);
    procedure actAddLandLeaseAgreementExecute(Sender: TObject);
    procedure actViewLandLeaseAgreementFinColExecute(Sender: TObject);
    procedure sgENSOLeaseAgreementDblClick(Sender: TObject);
    procedure updateENSOContract;
    procedure actInsertENSOContractExecute(Sender: TObject);
    procedure actViewtENSOContractExecute(Sender: TObject);
    procedure actDeleteatENSOContractExecute(Sender: TObject);
    procedure actUpdateENSOContractExecute(Sender: TObject);
    procedure actViewENSOContactFinColExecute(Sender: TObject);
    procedure sgENSOContractDblClick(Sender: TObject);
    procedure actInsertFinDocIdFromENPlanWorkExecute(Sender: TObject);
    procedure miAccompanyingSheet1Click(Sender: TObject);
    procedure spbEPVoltageNominalVoltagenominalClick(Sender: TObject);
    procedure miAdditionalAgreement1Click(Sender: TObject);
    procedure miAdditionalAgreement2Click(Sender: TObject);
    procedure miAdditionalAgreement3Click(Sender: TObject);
    procedure sgENSOBillGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure sgENPayment2SOGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure btnMeteringReportClick(Sender: TObject);
    procedure actFAInsertExecute(Sender: TObject);
    procedure actFADeleteExecute(Sender: TObject);
    procedure actFAViewExecute(Sender: TObject);
    procedure actFAEditExecute(Sender: TObject);
    procedure btnSetBuhStatusClick(Sender: TObject);
    procedure spbCustomerWarrantClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure actSaveAttachmentAsExecute(Sender: TObject);
    procedure btnRemovePlanFromTechCondClick(Sender: TObject);
    procedure makeDFServiceNoteFromReport(reportName: String; argNames, args: ArrayOfString; reportType: String);


  private
    { Private declarations }
    connectionPowerPoint: string;
    isVisitClient : Boolean;
    isJobsByTime  : Boolean;
    substation04Code, attachmentCode, departmentCode : Integer;
    attachmentName: string;
    techConObjectsBuilding, techConObjectsAddress: string;

    checkWarrant: Boolean;

    ENTechConditionsServicesObj: ENTechConditionsServices;

    ENTechAgreement2Services : ENTechAgreement2ServicesObject;
    ENTechAgreement2ServicesGL : ENTechAgreement2ServicesObject;
    ENTechAgreement2ServicesProject: ENTechAgreement2ServicesObject;
    personalInfo: PersonalServicesInfo;

    ENSOTechParamsObject : ENSOTechParams;

    procedure SetFormCaption(elementCode: Integer);

    procedure SetActTransferVisibilityByStatus(servicesObjectStatus: Integer);

    function CheckCountersByClassifications(): Boolean;
    procedure SetCountersVisibility();

    //procedure LoadENTechConditionsServicesObj(ENTechConditionsServicesObj: ENTechConditionsServices);
    procedure LoadENTechConditionsServices();
    function FillENTechConditionsServices(): boolean;

    procedure LoadUnitedGroupsForENLine04();
    procedure LoadUnitedGroupsForENSubstation04();
    procedure LoadUnitedGroupsForENLine10();
    procedure LoadUnitedGroupsForENSubstation35();
    procedure LoadUnitedGroups();

    procedure LoadENTechAgreement2Services();
    procedure LoadENTechAgreement2ServicesGL();
    procedure LoadENTechAgreement2ServicesProject();
    procedure updatePlanForServicesGrid;
    procedure updatePlanForServicesGridGL;
    procedure updatePlanForServicesGridProject;


    procedure LoadENSOTechParams();
    function saveReqs():Boolean;

    //function getContragentsCount(techConditionsServicesCode: Integer): Integer;
    function getContragentsCount(): Integer;

    procedure plansPopup(plan: ENPlanWork);
    //Вывод на экран в формате *.pdf сопроводительного листа к договору
    procedure showAccompanyingSheetJRXML( //Присоединения или проекту
      reportPath, //Путь к файлу отчёта *.jasper (скомпилированного из *.jrxml)
      strSigner, //ФИО подписанта
      strSignerPost: String); //Должность подписанта

    function checkDocAttachment(): Boolean;

    // SUPP-71866 Общая функция для вызова додатковых угод
    procedure MakeAdditionalAgreement(agreementType : Integer);

    { 06.07.2018 Получить лист калькуляций для текущего договора }
    function getCalculationList : ENPlanWork2ClassificationTypeShortList;
    { 06.07.2018 Возвращает true если хотя бы одна калькуляция
    по договору рассчитывается по новому}
    function isTKCalcKindNew : Boolean;

    procedure updateSO2NodeBySelectedNode;
    procedure updateSO2NodeByChildNodes;

    procedure updatePowerReserve;
    procedure updatePowerReserveItems;
    procedure updateRelatedAgrees;
    procedure updateSheets4SO;
    procedure updateBills;
    procedure updatePayments;
    procedure updateFACalculation;

    function getENSOValuesList(soValuesTypes
      : ENSOValuesController.ArrayOfInteger = nil) : ENSOValuesShortList;
    function getENSOBillList : ENSOBillShortList;
    function getENPayment2SOList : ENPayment2SOShortList;
    procedure refreshENServicesConnectionObj;
    procedure updateENRecordPoints;
    function getENRecordPointBytList : ENRecordPointBytShortList;
    function getENRecordPointPromList : ENRecordPointPromShortList;
    function getPlansList(filter : ENPlanWorkFilter = nil) : ENPlanWorkShortList;

    function getWFPack(): WFPack;
    procedure updateENSOCalculationToSOConnectionBind;
    function getSumRQFKOrder: Double;
  public
    { Public declarations }
    planCode : Integer;
    DepartmentForServicesCode : Integer;
    tempDeliveryOneWay : Integer;

    //PRIC-155
    contNumServ: String;
    priconnections : Boolean;
    isNotCalculated : Boolean;

    primarySubstationElCode : Integer;
    isNotCalculatedSecondary : Boolean;
    isAttachmentTablActive : Boolean;
    powerCategory : Boolean;

  end;

  TUnitedGroupType = (ugtUnknown, ugtL04d1, ugtL04d2, ugtL04d3, ugtTP04, ugtL10d1, ugtL10d2, ugtL10d3, ugtL10d4, ugtPS35);


var
  frmENServicesConnectionEdit: TfrmENServicesConnectionEdit;
  ENServicesConnectionObj: ENServicesObject;
  dataSecondary : ENPriconnectionData;

  ENCalc2ConnectTariffObj : ENCalc2ConnectTariff;

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

  ENGroupHeaders: array [1..5] of String =
        ( 'Код'
          ,'Група'
          ,'Найменування Замовника'
          ,'№ договору'
          ,'Код пакету'
        );
        
  iColCount, iLastCount, ColCount, LastCount, LastRow : Integer;
  iLastRow: Integer = 1;

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

  ENNecessityBuildingHeaders: array [1..8] of String =
        ( 'Код'
          ,'Тип об`єкта'
          ,'Номінальна напруга'
          ,'Кількість об`єктів (шт.) / довжина (км.)'
          ,'Вартість робіт (грн.)'
          ,'Опис'
          ,'Дата зміни'
          ,'Користувач, який вніс зміни'
        );


  nodeColCount, nodeLastCount: Integer;
  nodeLastRow: Integer = 1;
  ENSO2NodeHeaders: array [1..34] of String =
        ( 'Код'
          ,'код об''єкта'
          ,'назва об''єкта'
          ,'код опори'
          ,'назва опори'
          ,'потужність'
          ,'потужність існуюча'
          ,'точка забезп.потужн.ТУ'
          ,'точка приєднання ТУ'
          ,'Роботи безпосередньо по приєднанню'
          ,'опис точки'
          ,'приймає участь у розрахунку резерва'
          ,'Тип точки'
          ,'Номер\дата договору'
          ,'Найменування договору'
          ,'Статус договору'
          ,'об''єкт приэднання'
          ,'адреса об''єкту приэднання'
          ,'напруга'
          ,'напруга існуюча'
          ,'підрозділ'
          ,'№ТУ'
          ,'дата ТУ'
          ,'тип приєднання'
          ,'фактична дата підключення'
          ,'назва Ф04'
          ,'назва ТП10(6)/04'
          ,'назва Ф10(6)'
          ,'назва ПС35/10(6)'
          ,'назва Ф35'
          ,'назва ПС150'
          ,'назва Ф150'
          ,'Користувач, який змінив запис'
          ,'Дата зміни'
        );

  soValColCount, soValLastCount: Integer;
  soValLastRow: Integer = 1;
  ENSOValuesHeaders: array [1..7] of String =
        ( 'Код'
          ,'Найменування реквізиту'
          ,'Дата'
          ,'Текстове значення'
          , 'Категорія'
          ,'Користувач, який змінив запис'
          ,'Дата зміни'
        );

  prColCount, prLastCount: Integer;
  prLastRow: Integer = 1;
  ENCalcPowerReserveHeaders: array [1..7] of String =
        ( 'Код'
          ,'Ток фазы, А'
          ,'Дата и время замера'
          ,'Назва трансформатора'
          ,'Тип трансформатора'
          ,'Потужність, кВА'
          ,'Найменування підстанції 10 - 6 / 0.4 кВ'
        );

  priColCount, priLastCount: Integer;
  priLastRow: Integer = 1;
  ENCalcPowerReserveItemHeaders: array [1..5] of String =
       ( 'Код'
          ,'Номер і дата договору'
          ,'Замовник'
          ,'Номер і дата ТУ'
          ,'Користувач, який вніс зміни'
        );

  FINAdditionalAgreementHeaders: array [1 .. 6] of String = (
    'Код',
    '№ п/п',
    '№ додаткової угоди',
    'Дата реєстрації додаткової угоди',
    'Сумма договора: Собственная',
    'Предмет договора'
  );

  ENSheets4SOColCount, ENSheets4SOLastCount: Integer;
  ENSheets4SOLastRow: Integer = 1;
  ENSheets4SOHeaders: array [1..8] of String =
        ( 'Код'
          ,'Номер'
          ,'Назва'
          ,'Дата листа'
          ,'Кількість днів (подовження строку)'
          ,'Тип листа'
          ,'Користувач, який змінив запис'
          ,'Дата ост. зміни'
        );

    ENSOLeaseAgreementHeaders: array [1..5] of String =
        ( 'Код'
          ,'Номер договору'
          ,'Дата договору'
          ,'Найменування партнера'
          ,'PK договору у фін.кол'
        );

    ENSOContractHeaders: array [1..6] of String =
        ( 'Код'
          ,'Номер договору у фін.кол.'
          ,'Дата договору у фін.кол.'
          ,'Найменування партнера у фін.кол.'
          ,'Примітка договору у фін.кол.'
          ,'PK договору у фін.кол'
        );
  ENSOBillHeaders: array [1..8] of String =
        ( 'Код'
          ,'Номер рахунку'
          ,'Дата рахунку'
          ,'Всього з ПДВ, грн.'
          ,'Сума без ПДВ, грн.'
          ,'ПДВ, грн.'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
  FACalcColCount, FACalcLastCount: Integer;
  FACalcLastRow: Integer = 1;

  contract_standart_connection_20or100 : Integer;

  ENServicesCalculationHeaders: array [1..19] of String =
        ( 'Код'
          ,'Порядковий № дог.'
          ,'Дата дог.(порядковий)'
          ,'№ дог. фін.кол.'
          ,'Дата дог. фін.кол.'
          ,'Замовник'
          ,'Код замовника'
          ,'Тип замовника'
          ,'Підрозділ'
          ,'Тип договору'
          ,'Статус договору'
          ,'Бух. статус'
          ,'Примітка'
					,'Адреса замовника'
					,'Сума оплати (з НДС)'
					,'Сума дохода (з НДС)'
          {,'пользователь внесший изменение'
          ,'дата последнего изменения'}
          ,'Гранична дата виконання робіт'
          ,'Кількість днів затримки(з вини споживача) '
          ,'Макс. термін виконання(дні)'
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

  UNITEDGROUPS_COLS_WITH_BOLD_BORDERS: array [1..13] of Integer = (2, 5, 8, 11, 14, 17, 21, 24, 27, 30, 33, 36, 40);

implementation

uses
  ShowENDepartment, ENDepartmentController, ShowENElement, ENElementController,
  DMReportsUnit, ShowFINServicesObject, ENConsts, Main,
  ENServicesContragentTypeController, ENServicesContractTypeController,
  EditENPlanWorkItem, ENPlanWorkItemController, ENEstimateItemController,
  {ENPlanWorkController, }EditENPlanWork2ClassificationType,
  ENServicesContractStatusController,
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
  CNTechTermsController, EditENPriconnectionData, ENConnectionTariffController,
  ENConnectionTariffEntryController, ENTechCondResponsiblesController,
  ENContragentController, ENPlanWorkFormController, EditENContragent,
  ENTechContragentFormController, ENTechContragentTypeController,
  ShowENConnectionTariff, EntechConditionsServicesEditSumBill,
  EditENUnitedGroup2TechCondServices, ENUnitedGroupConnectionsController,
  ENSubstation04Controller, ENServicesFromSideObjectController,
  ENActIncomeTechConditionsController, EditENActIncomeTechConditions,
  ENLine04Controller, ENLine10Controller, ENSubstation150Controller,
  ENConnectionKindController, EditAddUnitedGroup,
  ShowENUnitedGroupConnections, RQFKOrderController,
  RQFKOrderKindController, EditENPayment2SO,
  EditRecalcDistanceServicesConnection,ShowENPlanWork,ENPlanWorkStateController,
  EditCopyPlanPriconnections, AccompanyingSheet, DataModuleReportsContract,
  ContractReports, ENDocAttachmentController, ENDocAttachmentStatusController,
  printAgreeUseElectricity, ENTechAgr2SOKindController, ENSettingsConsts,
  ENNecessityBuildingController, EditENNecessityBuilding, CCNodeController,
  CCNodeExtController, ShowCCNode, EditCCNodeFilter, ENSO2NodeController,
  ENSO2NodeTypeController, EditENSOValues,
  ShowENConnectionLevel, ENConnectionLevelController,
  ENPowerReliabilityCategoryController, ShowENPowerReliabilityCategory,
  ENConnectionPowerPointController, ShowENConnectionPowerPoint,
  ENConnectionPhasityController, ShowENConnectionPhasity,
  ShowENConnectionLineType, ENConnectionLineTypeController,
  ENConnectionInstallationTypeController, ShowENConnectionInstallationType,
  ENConnectionLocationTypeController, ShowENConnectionLocationType,
  EditENDistributionAgree, ENSO2DistrAgreeController, EditENSO2Node,
  CNAttachmentController, EditENTechConditionsObjects, printTechConditions,
  ENDocAttachmentServerController, ENCalcPowerReserveController,
  ENCalcPowerReserveItemController, EditENCalcPowerReserve,
  EditENCalcPowerReserveItem, PrintBindingSelectedNode, CCElementDataController,
  CCNodeTypeController, EditENSubstation04, ENSheets4SOController,
  EditENSheets4SO, ENSOValuesTypeController, ShowDocumentManagement,
  DFDocController, DFConsts, EditDFDocOutbox,
  FINContractsController, EditFINServicesObject,
  EditENSOLeaseAgreement, ENSOLeaseAgreementController
  ,EditENSOContract, ENSOContractController, EditENSOBill,
  ENSheets4SOTypeController, BaseUtilsUnit,
  CCReportController, CCDMReportUnit, WFPack2ServicesObjectController,
  AddFACalculation, ShowENCustomerWarrant, ENCustomerWarrantController,
  ShowENConnectionCityType, ENConnectionCityTypeController, bindSOCalculationToSOConnection,
  ENElement2ENElementController, EditENServicesCalculation,
  DFDocServiceNoteController;



{$R *.dfm}

const
  DFDOC_CODE_INDEX = 0;
  DFDOCTYPE_CODE_INDEX = 1;
  ENATTACHMENT_CODE_INDEX = 3;
  ENSHEETS4SOTYPE_CODE_INDEX = 4;


procedure TfrmENServicesConnectionEdit.updateFACalculation;
var
  TempFACalculation: FACalculationControllerSoapPort;
  i: Integer;
  FACalculationList: FACalculationShortList;
  FACalcFilter : FACalculationFilter;
  begin
  //SetGridHeaders(FACalculationHeaders, sgFACalculation.ColumnHeaders);
  ClearGrid(sgFACalculation);
  TempFACalculation :=  HTTPRIOFACalculation as FACalculationControllerSoapPort;

  FACalcFilter := FACalculationFilter.Create;
  SetNullIntProps(FACalcFilter);
  SetNullXSProps(FACalcFilter);
  FACalcFilter.ensoCode := ENServicesConnectionObj.code;

  FACalculationList := TempFACalculation.getScrollableFilteredList(FACalcFilter,0,-1);

  FACalcLastCount:=High(FACalculationList.list);

  if FACalcLastCount > -1 then
     sgFACalculation.RowCount:=FACalcLastCount+2
  else
     sgFACalculation.RowCount:=2;

   with sgFACalculation do
    for i:=0 to FACalcLastCount do
      begin
        Application.ProcessMessages;
        if FACalculationList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(FACalculationList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := FACalculationList.list[i].res;
        Cells[2,i+1] := FACalculationList.list[i].periodName;
        Cells[3,i+1] := FACalculationList.list[i].nodeTxt;
        if FACalculationList.list[i].billing_Inflow = Low(Integer) then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := IntToStr(FACalculationList.list[i].billing_Inflow);
        if FACalculationList.list[i].calc_WP = Low(Integer) then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := IntToStr(FACalculationList.list[i].calc_WP);
        if FACalculationList.list[i].calc_WP_Byt = Low(Integer) then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := IntToStr(FACalculationList.list[i].calc_WP_Byt);
        if FACalculationList.list[i].calc_WP_Prom = Low(Integer) then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := IntToStr(FACalculationList.list[i].calc_WP_Prom);
        if FACalculationList.list[i].calc_WP_Ordered = Low(Integer) then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := IntToStr(FACalculationList.list[i].calc_WP_Ordered);
        if FACalculationList.list[i].calc_Losses = Low(Integer) then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := IntToStr(FACalculationList.list[i].calc_Losses);
        if FACalculationList.list[i].calc_WP_Unbalance = Low(Integer) then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := IntToStr(FACalculationList.list[i].calc_WP_Unbalance);
        if FACalculationList.list[i].typerefCode = Low(Integer) then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := FACalculationList.list[i].typerefName;
        if FACalculationList.list[i].statusrefCode = Low(Integer) then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := FACalculationList.list[i].statusrefName;
        if FACalculationList.list[i].withSwitches = Low(Integer) then
          Cells[13,i+1] := ''
        else
          Cells[13,i+1] := IntToStr(FACalculationList.list[i].withSwitches);
        Cells[14,i+1] := FACalculationList.list[i].usergen;
        if FACalculationList.list[i].dategen = nil then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := XSDateTimeWithDate2String(FACalculationList.list[i].dategen);
        Cells[16,i+1] := FACalculationList.list[i].comment;

        FACalcLastRow:=i+1;
        sgFACalculation.RowCount:=FACalcLastRow+1;
      end;
   FACalcColCount:=ColCount+1;
   sgFACalculation.Row:=1;
end;


function TfrmENServicesConnectionEdit.getENRecordPointBytList : ENRecordPointBytShortList;
var
planList : ENPlanWorkShortList;
plan : ENPlanWorkShort;
elementList : TList<Integer>;
TempENRecordPointByt : ENRecordPointBytControllerSoapPort;
filter : ENRecordPointBytFilter;
planFilter : ENPlanWorkFilter;
list, tmpList : ENRecordPointBytShortList;
item : ENRecordPointBytShort;
arr : ENRecordPointBytController.ArrayOfENRecordPointBytShort;
isAccountCodeExistsInList : Boolean;
begin
  TempENRecordPointByt := HTTPRIOENRecordPointByt as ENRecordPointBytControllerSoapPort;
  planFilter := ENPlanWorkFilter.Create;
  SetNullXSProps(planFilter);
  SetNullIntProps(planFilter);
  planFilter.conditionSQL := 'EXISTS (SELECT FROM enelement AS el1 WHERE el1.code = ENPLANWORK.ELEMENTREFCODE ' +
    'AND el1.typerefcode = ' + IntToStr(ENConsts.EN_BYT) + ')';
  planList := Self.getPlansList(planFilter);
  elementList := TList<Integer>.Create;
  for plan in planList.list do elementList.add(plan.elementRefCode);
  if elementList.Count = 0 then elementList.add(Low(Integer));

  filter := ENRecordPointBytFilter.Create;
  SetNullXSProps(filter);
  SetNullIntProps(filter);
  filter.conditionSQL := 'ENRECORDPOINTBYT.ELEMENTCODE IN (' + BaseUtils.listOfIntegers2String(elementList, ',') + ')';
  tmpList := TempENRecordPointByt.getScrollableFilteredList(filter, 0, -1);
  list := tmpList;
  // SUPP-90291 Если на договоре задан лицевой, которого нет в списке точек учета из планов
  // для этого договора, то он будет вытягиваться отдельно
  if ENServicesConnectionObj.personalAccountCode > 0 then begin
    isAccountCodeExistsInList := False;
    if ENServicesConnectionObj.contragentTypeRef.code
          in [ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL] then begin
          for item in list.list do begin
            if item.rpCode = ENServicesConnectionObj.personalAccountCode then begin
              isAccountCodeExistsInList := True;
              Break;
            end;
          end;
          if not isAccountCodeExistsInList then begin
            filter := ENRecordPointBytFilter.Create;
            SetNullXSProps(filter);
            SetNullIntProps(filter);
            filter.rpCode := ENServicesConnectionObj.personalAccountCode;
            filter.conditionSQL := 'EXISTS (SELECT FROM endepartment2epren as deep1 ' +
            ' INNER JOIN enelement AS el1 ON deep1.renrefcode = el1.renrefcode ' +
            ' WHERE el1.code = ENRECORDPOINTBYT.ELEMENTCODE ' +
            ' AND deep1.departmentrefcode = ' + IntToStr(ENTechConditionsServicesObj.department.code) +
            ')';
            tmpList := TempENRecordPointByt.getScrollableFilteredList(filter, 0, -1);
            arr := Copy(list.list, 0, Length(list.list));
            list.totalCount := list.totalCount + 1;
            SetLength(arr, list.totalCount);
            if tmpList.totalCount > 0 then begin
              arr[list.totalCount - 1] := tmpList.list[0];
            end else begin
              item := ENRecordPointBytShort.Create;
              SetNullXSProps(item);
              SetNullIntProps(item);
              item.accountNumber := ENServicesConnectionObj.personalAccountNumber;
              item.renName := ENTechConditionsServicesObj.department.name;
              arr[list.totalCount - 1] := item;
            end;
            list.list := arr;
          end;
    end;

  end;

  Result := list;
end;

function TfrmENServicesConnectionEdit.getENRecordPointPromList : ENRecordPointPromShortList;
var
planList : ENPlanWorkShortList;
plan : ENPlanWorkShort;
elementList : TList<Integer>;
TempENRecordPointProm : ENRecordPointPromControllerSoapPort;
filter : ENRecordPointPromFilter;
planFilter : ENPlanWorkFilter;
list, tmpList : ENRecordPointPromShortList;
isAccountCodeExistsInList : Boolean;
arr : ENRecordPointPromController.ArrayOfENRecordPointPromShort;
item : ENRecordPointPromShort;
begin
  TempENRecordPointProm := HTTPRIOENRecordPointProm as ENRecordPointPromControllerSoapPort;
  planFilter := ENPlanWorkFilter.Create;
  SetNullXSProps(planFilter);
  SetNullIntProps(planFilter);
  planFilter.conditionSQL := 'EXISTS (SELECT FROM enelement AS el1 WHERE el1.code = ENPLANWORK.ELEMENTREFCODE ' +
    'AND el1.typerefcode = ' + IntToStr(ENConsts.EN_PROM) + ')';
  planList := Self.getPlansList(planFilter);
  elementList := TList<Integer>.Create;
  for plan in planList.list do elementList.add(plan.elementRefCode);
  if elementList.Count = 0 then elementList.add(Low(Integer));

  filter := ENRecordPointPromFilter.Create;
  SetNullXSProps(filter);
  SetNullIntProps(filter);
  filter.conditionSQL := 'ENRECORDPOINTPROM.ELEMENTCODE IN (' + BaseUtils.listOfIntegers2String(elementList, ',') + ')';
  tmpList := TempENRecordPointProm.getScrollableFilteredList(filter, 0, -1);
  list := tmpList;

    // SUPP-90291 Если на договоре задан лицевой, которого нет в списке точек учета из планов
  // для этого договора, то он будет вытягиваться отдельно
  if ENServicesConnectionObj.personalAccountCode > 0 then begin
    if not (ENServicesConnectionObj.contragentTypeRef.code
          in [ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL]) then begin
          isAccountCodeExistsInList := False;
          for item in list.list do begin
            if item.accountCode = ENServicesConnectionObj.personalAccountCode then begin
              isAccountCodeExistsInList := True;
              Break;
            end;
          end;
          if not isAccountCodeExistsInList then begin
            arr := Copy(list.list, 0, Length(list.list));
            list.totalCount := list.totalCount + 1;
            SetLength(arr, list.totalCount);
            item := ENRecordPointPromShort.Create;
            SetNullXSProps(item);
            SetNullIntProps(item);
            item.accountNumber := ENServicesConnectionObj.personalAccountNumber;
            item.renName := ENTechConditionsServicesObj.department.name;
            arr[list.totalCount - 1] := item;
            list.list := arr;
          end;
    end;
  end;
  Result := list;
end;

procedure TfrmENServicesConnectionEdit.updateENRecordPoints;
var
  bytList : ENRecordPointBytShortList;
  promList : ENRecordPointPromShortList;
  byt : ENRecordPointBytShort;
  prom : ENRecordPointPromShort;
  count : Integer;
begin
  sgENRecordPoint.clear;
  SetGridHeaders(['Код', 'EIC', 'Тип лічильника'
    , 'Серійний номер лічильника', 'Дата встановлення'
    , 'Дата початку споживання', 'Номер особового рахунку', 'Найменування'
    , 'РЕЗ і ЕМ']
    , sgENRecordPoint.ColumnHeaders);
    sgENRecordPoint.AutoSizeRow(0);

    bytList := Self.getENRecordPointBytList;
    promList := Self.getENRecordPointPromList;
    if bytList.totalCount + promList.totalCount > 0 then begin
      sgENRecordPoint.RowCount := bytList.totalCount + promList.totalCount + 1;
    end else begin
      sgENRecordPoint.RowCount := 2;
    end;

    count := 0;
    for byt in bytList.list do begin
      with sgENRecordPoint do begin
        count := count + 1;
        Cells[0, count] := IntToStr(byt.code);
        Cells[1, count] := byt.codeEIC;
        Cells[2, count] := byt.counterType;
        Cells[3, count] := byt.serialNumber;
        if Assigned(byt.dateCounterInst) then Cells[4, count] := XSDate2String(byt.dateCounterInst);
        if Assigned(byt.dateFirstConsumption) then begin
          Cells[5, count] := XSDate2String(byt.dateFirstConsumption);
        end else begin
          Cells[5, count] := '';
        end;
        Cells[6, count] := byt.accountNumber;
        Cells[7, count] := byt.name;
        Cells[8, count] := byt.renName;

      end;
    end;
    for prom in promList.list do begin
      with sgENRecordPoint do begin
        count := count + 1;
        Cells[0, count] := IntToStr(prom.code);
        Cells[1, count] := prom.codeEIC;
        Cells[2, count] := prom.counterType;
        Cells[3, count] := prom.counterNumber;
        if Assigned(prom.dateCounterInst) then Cells[4, count] := XSDate2String(prom.dateCounterInst);
        if Assigned(prom.dateFirstConsumption) then begin
          Cells[5, count] := XSDate2String(prom.dateFirstConsumption);
        end else begin
          Cells[5, count] := '';
        end;
        Cells[6, count] := prom.accountNumber;
        Cells[7, count] := prom.accountName;
        Cells[8, count] := prom.renName;

      end;
    end;
    sgENRecordPoint.Row := 1;
end;

procedure TfrmENServicesConnectionEdit.updateSheets4SO;
var
  TempENSheets4SO: ENSheets4SOControllerSoapPort;
  i: Integer;
  ENSheets4SOList: ENSheets4SOShortList;
  ENSheets4SOFil :  ENSheets4SOFilter;
begin
  ClearGrid(sgENSheets4SO);
  SetGridHeaders(ENSheets4SOHeaders, sgENSheets4SO.ColumnHeaders);

  TempENSheets4SO :=  HTTPRIOENSheets4SO as ENSheets4SOControllerSoapPort;

     ENSheets4SOFil := ENSheets4SOFilter.Create;
     SetNullIntProps(ENSheets4SOFil);
     SetNullXSProps(ENSheets4SOFil);
     ENSheets4SOFil.servicesobject := ENServicesObjectRef.Create;
     ENSheets4SOFil.servicesobject.code := ENServicesConnectionObj.code;

  ENSheets4SOList := TempENSheets4SO.getScrollableFilteredList(ENSheets4SOFil, 0, -1);

  if High(ENSheets4SOList.list) > -1 then
     sgENSheets4SO.RowCount := High(ENSheets4SOList.list) + 2
  else
     sgENSheets4SO.RowCount := 2;

  with sgENSheets4SO do
    for i := 0 to High(ENSheets4SOList.list) do
      begin
        if ENSheets4SOList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENSheets4SOList.list[i].code)
        else
          Cells[0,i+1] := '';
        Cells[1,i+1] := ENSheets4SOList.list[i].numbergen;
        Cells[2,i+1] := ENSheets4SOList.list[i].name;
        if ENSheets4SOList.list[i].dateGen = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENSheets4SOList.list[i].dateGen);
        if ENSheets4SOList.list[i].dayscnt = Low(Integer) then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := IntToStr(ENSheets4SOList.list[i].dayscnt);
        Cells[5,i+1] := ENSheets4SOList.list[i].sheet4sotypeName;
        Cells[6,i+1] := ENSheets4SOList.list[i].userGen;
        if ENSheets4SOList.list[i].dateEdit = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDate2String(ENSheets4SOList.list[i].dateEdit);

        Objects[DFDOC_CODE_INDEX,        i + 1] := TObject(ENSheets4SOList.list[i].dfDocCode);
        Objects[DFDOCTYPE_CODE_INDEX,    i + 1] := TObject(ENSheets4SOList.list[i].dfDocTypeCode);
        Objects[ENATTACHMENT_CODE_INDEX, i + 1] := TObject(ENSheets4SOList.list[i].attachmentCode);
        Objects[ENSHEETS4SOTYPE_CODE_INDEX, i + 1] := TObject(ENSheets4SOList.list[i].sheet4sotypeCode);

        //sgENSheets4SO.RowCount := i + 2;
      end;

    sgENSheets4SO.Row := 1;

    sgENSheets4SO.FixedFont.Style := [fsBold];
end;

procedure TfrmENServicesConnectionEdit.updatePowerReserve;
var
  i: Integer;
  TempENCalcPowerReserve: ENCalcPowerReserveControllerSoapPort;
  ENCalcPowerReserveList: ENCalcPowerReserveShortList;
  powerReserveFilter : ENCalcPowerReserveFilter;
begin
   ClearGrid(sgENCalcPowerReserve);

  SetGridHeaders(ENCalcPowerReserveHeaders, sgENCalcPowerReserve.ColumnHeaders);
  TempENCalcPowerReserve :=  HTTPRIOENCalcPowerReserve as ENCalcPowerReserveControllerSoapPort;

   powerReserveFilter := ENCalcPowerReserveFilter.Create;
   SetNullIntProps(powerReserveFilter);
   SetNullXSProps(powerReserveFilter);

   powerReserveFilter.servicesobjectRef := ENServicesObjectRef.Create;
   powerReserveFilter.servicesobjectRef.code := ENServicesConnectionObj.code;

  ENCalcPowerReserveList := TempENCalcPowerReserve.getScrollableFilteredList(powerReserveFilter,0,-1);
  prLastCount:=High(ENCalcPowerReserveList.list);

  if prLastCount > -1 then
     sgENCalcPowerReserve.RowCount:=prLastCount+2
  else
     sgENCalcPowerReserve.RowCount:=2;

   with sgENCalcPowerReserve do
    for i:=0 to prLastCount do
      begin
        Application.ProcessMessages;
        if ENCalcPowerReserveList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENCalcPowerReserveList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENCalcPowerReserveList.list[i].gvalues;

        if ENCalcPowerReserveList.list[i].gdate = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENCalcPowerReserveList.list[i].gdate);

        Cells[3,i+1] := ENCalcPowerReserveList.list[i].trname;
        Cells[4,i+1] := ENCalcPowerReserveList.list[i].trtypename;

        if ENCalcPowerReserveList.list[i].trnominalpower <> Low(Integer) then
        Cells[5,i+1] := IntToStr(ENCalcPowerReserveList.list[i].trnominalpower)
        else
        Cells[5,i+1] := '';

        Cells[6,i+1] := ENCalcPowerReserveList.list[i].subsname;

        prLastRow:=i+1;
        sgENCalcPowerReserve.RowCount:=prLastRow+1;
      end;

    prColCount:=prColCount+1;
    sgENCalcPowerReserve.Row:=1;

end;


procedure TfrmENServicesConnectionEdit.updatePowerReserveItems;
var
  TempENCalcPowerReserveItem: ENCalcPowerReserveItemControllerSoapPort;
  i, powerReserveCode: Integer;
  ENCalcPowerReserveItemList: ENCalcPowerReserveItemShortList;
  priFilter : ENCalcPowerReserveItemFilter;
begin
  ClearGrid(sgENCalcPowerReserveItem);

  SetGridHeaders(ENCalcPowerReserveItemHeaders, sgENCalcPowerReserveItem.ColumnHeaders);

  TempENCalcPowerReserveItem :=  HTTPRIOENCalcPowerReserveItem as ENCalcPowerReserveItemControllerSoapPort;

  try
     powerReserveCode := StrToInt(sgENCalcPowerReserve.Cells[0,sgENCalcPowerReserve.Row]);
   except
   on EConvertError do Exit;
  end;

     priFilter := ENCalcPowerReserveItemFilter.Create;
     SetNullIntProps(priFilter);
     SetNullXSProps(priFilter);
     priFilter.calcPowerReserveRef := ENCalcPowerReserveRef.Create;
     priFilter.calcPowerReserveRef.code := powerReserveCode;
     priFilter.orderBySQL := ' socontragentname';

  ENCalcPowerReserveItemList := TempENCalcPowerReserveItem.getScrollableFilteredList(priFilter,0,-1);
  priLastCount:=High(ENCalcPowerReserveItemList.list);

  if priLastCount > -1 then
     sgENCalcPowerReserveItem.RowCount:=priLastCount+2
  else
     sgENCalcPowerReserveItem.RowCount:=2;

   with sgENCalcPowerReserveItem do
    for i:=0 to priLastCount do
      begin
        Application.ProcessMessages;
        if ENCalcPowerReserveItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENCalcPowerReserveItemList.list[i].code)
        else
        Cells[0,i+1] := '';

        AddCheckBox(1, i+1, false, false);
        Cells[1,i+1] := ENCalcPowerReserveItemList.list[i].soContract;
        Cells[2,i+1] := ENCalcPowerReserveItemList.list[i].soContragentName;

        Cells[3,i+1] := ENCalcPowerReserveItemList.list[i].techconditions;


        Cells[4,i+1] := ENCalcPowerReserveItemList.list[i].userGen;
        if ENCalcPowerReserveItemList.list[i].dateEdit = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDateTimeWithDate2String(ENCalcPowerReserveItemList.list[i].dateEdit);

        priLastRow:=i+1;
        sgENCalcPowerReserveItem.RowCount:=priLastRow+1;
      end;

    sgENCalcPowerReserveItem.Row:=1;
end;

procedure TfrmENServicesConnectionEdit.updateSO2NodeBySelectedNode;
var
  TempENSO2Node: ENSO2NodeControllerSoapPort;
  i, nodeCode: Integer;
  ENSO2NodeList: ENSO2NodeShortList;
  so2nodeFilter : ENSO2NodeFilter;
begin

  ClearGrid(sgENSO2NodeOthers);
  SetGridHeaders(ENSO2NodeHeaders, sgENSO2NodeOthers.ColumnHeaders);
  TempENSO2Node :=  HTTPRIOENSO2Node as ENSO2NodeControllerSoapPort;

  if MainTree.Selected = nil then
    exit;

   try
    nodeCode:=CCNodeExtShort(MainTree.Selected.Data).code;
   except
    on EConvertError do Exit;
   end;

   so2nodeFilter := ENSO2NodeFilter.Create;
   SetNullIntProps(so2nodeFilter);
   SetNullXSProps(so2nodeFilter);
   so2nodeFilter.ccNodeCode := nodeCode;

  ENSO2NodeList := TempENSO2Node.getScrollableFilteredList(so2nodeFilter,0,-1);
  nodeLastCount:=High(ENSO2NodeList.list);

  if nodeLastCount > -1 then
     sgENSO2NodeOthers.RowCount:=nodeLastCount+2
  else
     sgENSO2NodeOthers.RowCount:=2;

   with sgENSO2NodeOthers do
    for i:=0 to nodeLastCount do
      begin

        Application.ProcessMessages;
        if ENSO2NodeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSO2NodeList.list[i].code)
        else
        Cells[0,i+1] := '';

        AddCheckBox(1, i+1, false, false);

        if ENSO2NodeList.list[i].ccNodeCode = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(ENSO2NodeList.list[i].ccNodeCode);

          Cells[2,i+1] := ENSO2NodeList.list[i].ccelementdataname;

        if ENSO2NodeList.list[i].ccTowerCode = Low(Integer) then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := IntToStr(ENSO2NodeList.list[i].ccTowerCode);

          Cells[4,i+1] := ENSO2NodeList.list[i].towerName;

          if ENSO2NodeList.list[i].power <> nil then
          Cells[5,i+1] := ENSO2NodeList.list[i].power.DecimalString
          else
          Cells[5,i+1] := '';

          if ENSO2NodeList.list[i].tc_currpower <> nil then
          Cells[6,i+1] := ENSO2NodeList.list[i].tc_currpower.DecimalString
          else
          Cells[6,i+1] := '';

          Cells[7,i+1] := ENSO2NodeList.list[i].tc_conpowpoint;         //19
          Cells[8,i+1] := ENSO2NodeList.list[i].tc_conpowplaces;       //20
          Cells[9,i+1] := ENSO2NodeList.list[i].work_directly_on_joining;

          Cells[10,i+1] := ENSO2NodeList.list[i].description;

          if (ENSO2NodeList.list[i].isCalc = 1) then
          Cells[11,i+1] := 'Так'
        else
          Cells[11,i+1] := '';

          Cells[12,i+1] := ENSO2NodeList.list[i].so2nodeTypeName;

          Cells[13,i+1] := ENSO2NodeList.list[i].servicesobjectContractNumberServices + '\' +
                          ENSO2NodeList.list[i].servicesobjectContractNumber + ' від ' +
                          XSDate2String(ENSO2NodeList.list[i].servicesobjectContractDateServices);

          Cells[14,i+1] := ENSO2NodeList.list[i].servicesobjectContragentName;
          //Статус договору
          Cells[15,i+1] := ENSO2NodeList.list[i].servicesobjectContractStatusRefName;

          Cells[16,i+1] := ENSO2NodeList.list[i].tc_building;
          Cells[17,i+1] := ENSO2NodeList.list[i].tc_address;

          if ENSO2NodeList.list[i].tc_servvoltage <> nil then
          Cells[18,i+1] := ENSO2NodeList.list[i].tc_servvoltage.DecimalString
          else
          Cells[18,i+1] := '';

          if ENSO2NodeList.list[i].tc_currvoltage <> nil then
          Cells[19,i+1] := ENSO2NodeList.list[i].tc_currvoltage.DecimalString
          else
          Cells[19,i+1] := '';

          Cells[20,i+1] := ENSO2NodeList.list[i].dep_name;
          Cells[21,i+1] := ENSO2NodeList.list[i].tc_number;
          if ENSO2NodeList.list[i].tc_dategen <> nil then
            Cells[22,i+1] := XSDate2String(ENSO2NodeList.list[i].tc_dategen)
          else
            Cells[22,i+1] := '';
          Cells[23,i+1] := ENSO2NodeList.list[i].connectionkindname;
          if ENSO2NodeList.list[i].fact_conn_date <> nil then
            Cells[24,i+1] := XSDate2String(ENSO2NodeList.list[i].fact_conn_date)
          else
            Cells[24,i+1] := '';
          Cells[25,i+1] := ENSO2NodeList.list[i].f04;
          Cells[26,i+1] := ENSO2NodeList.list[i].s10;
          Cells[27,i+1] := ENSO2NodeList.list[i].f10;
          Cells[28,i+1] := ENSO2NodeList.list[i].s35;
          Cells[29,i+1] := ENSO2NodeList.list[i].f35;
          Cells[30,i+1] := ENSO2NodeList.list[i].s150;
          Cells[31,i+1] := ENSO2NodeList.list[i].f150;

         Cells[32,i+1] := ENSO2NodeList.list[i].userGen;

        if ENSO2NodeList.list[i].dateEdit = nil then
          Cells[33,i+1] := ''
        else
          Cells[33,i+1] := XSDateTimeWithDate2String(ENSO2NodeList.list[i].dateEdit);

        Objects[0,i+1] := TObject(ENSO2NodeList.list[i].servicesobjectCode);

        LastRow:=i+1;
        sgENSO2NodeOthers.RowCount:=LastRow+1;

      end;

    nodeColCount:=nodeColCount+1;
    sgENSO2NodeOthers.Row:=1;
end;

procedure TfrmENServicesConnectionEdit.LoadENSOTechParams;
  var
  soParamsFilter : ENSOTechParamsFilter;
  TempENSOTechParams : ENSOTechParamsControllerSoapPort;
  soTechParamsArr : ENSOTechParamsController.ArrayOfInteger;
  soTechParamsShortObj : ENSOTechParamsShort;
begin

  soParamsFilter := ENSOTechParamsFilter.Create;
  SetNullIntProps(soParamsFilter);
  SetNullXSProps(soParamsFilter);

  soParamsFilter.servicesobject := ENServicesObjectRef.Create;
  soParamsFilter.servicesobject.code := ENServicesConnectionObj.code;

  TempENSOTechParams := HTTPRIOENSOTechParams as ENSOTechParamsControllerSoapPort;
  soTechParamsArr := TempENSOTechParams.getScrollableFilteredCodeArray(soParamsFilter, 0, -1);

  if High(soTechParamsArr) > -1 then
  begin
    try
      ENSOTechParamsObject := TempENSOTechParams.getObject(soTechParamsArr[0]);
      soTechParamsShortObj :=  TempENSOTechParams.getShortObject(ENSOTechParamsObject.code);
    except
      on EConvertError do Exit;
    end;

    edtENConnectionLevelLevelRefName.Text := soTechParamsShortObj.levelRefName;
    edtENPowerReliabilityCategoryCategoryRefName.Text := soTechParamsShortObj.categoryRefName;
    edtENConnectionPowerPointPowerPointRefName.Text := soTechParamsShortObj.powerPointRefName;
    edtENConnectionPhasityPhasityRefName.Text := soTechParamsShortObj.phasityRefName;
    edtLineType.Text := soTechParamsShortObj.lineTypeRefName;
    edtInstallationType.Text := soTechParamsShortObj.installationTypeRefName;
    edtLocationType.Text := soTechParamsShortObj.locationTypeRefName;
    edtCityTypeName.Text :=  soTechParamsShortObj.cityTypeRefName;

    if (ENSOTechParamsObject.substationBuildSum <> nil) then
      edtSubstationBuildSum.Text := ENSOTechParamsObject.substationBuildSum.decimalString
    else
      edtSubstationBuildSum.Text := '';

    if (ENSOTechParamsObject.calculationSum <> nil) then
      edtCalcSum.Text := ENSOTechParamsObject.calculationSum.decimalString
    else
      edtCalcSum.Text := '';

    edtClosestDistance.Text := IntToStr(ENSOTechParamsObject.closestDistance);

    if ENSOTechParamsObject.closestDistance2 = LOW_INT then
    edtClosestDistance2.Text := '0'
    else
    edtClosestDistance2.Text := IntToStr(ENSOTechParamsObject.closestDistance2);

        if ENSOTechParamsObject.infoDistance2 = LOW_INT then
    edtInfoDistance.Text := '0'
    else
    edtInfoDistance.Text := IntToStr(ENSOTechParamsObject.infoDistance2);

    edtCityName.Text := ENSOTechParamsObject.cityTypeName;
    MakeMultiline(mmoObject4ClosestDistnceName.Lines,ENSOTechParamsObject.object4closestDistanceName);
    MakeMultiline(mmoObject4ClosestDistnceName2.Lines,ENSOTechParamsObject.object4closestDistance2Name);

  end;
end;

 function TfrmENServicesConnectionEdit.getENSOValuesList(soValuesTypes
  : ENSOValuesController.ArrayOfInteger = nil) : ENSOValuesShortList;
 var
  TempENSOValues: ENSOValuesControllerSoapPort;
  ENSOValuesList: ENSOValuesShortList;
  soValuesFilter : ENSOValuesFilter;
 begin
    TempENSOValues :=  HTTPRIOENSOValues as ENSOValuesControllerSoapPort;
    soValuesFilter := ENSOValuesFilter.Create;
    SetNullIntProps(soValuesFilter);
    SetNullXSProps(soValuesFilter);
    soValuesFilter.servicesobject := ENServicesObjectRef.Create;
    soValuesFilter.servicesobject.code := ENServicesConnectionObj.code;
    soValuesFilter.soValuesTypes := soValuesTypes;
    soValuesFilter.orderBySQL := 'ENSOVALUESTYPECATEGORY.NAME ASC';
    ENSOValuesList := TempENSOValues.getScrollableFilteredList(soValuesFilter,0,-1);
    Result := ENSOValuesList;
 end;

 procedure TfrmENServicesConnectionEdit.updateSOValues;
var
  i: Integer;
  ENSOValuesList : ENSOValuesShortList;
begin

  ClearGrid(sgENSOValues);
  SetGridHeaders(ENSOValuesHeaders, sgENSOValues.ColumnHeaders);


  ENSOValuesList := getENSOValuesList;
  soValLastCount:=High(ENSOValuesList.list);

  if soValLastCount > -1 then
     sgENSOValues.RowCount:=soValLastCount+2
  else
     sgENSOValues.RowCount:=2;

   with sgENSOValues do
    for i:=0 to soValLastCount do
      begin
        Application.ProcessMessages;
        if ENSOValuesList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSOValuesList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := ENSOValuesList.list[i].soValuesTypeName;

        if ENSOValuesList.list[i].dateVal = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDateTimeWithoutTime2String(ENSOValuesList.list[i].dateVal);
        Cells[3,i+1] := ENSOValuesList.list[i].strVal;
        Cells[4,i+1] := ENSOValuesList.list[i].typeCategoryRefName;
        Cells[5,i+1] := ENSOValuesList.list[i].userGen;
        if ENSOValuesList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDateTimeWithDate2String(ENSOValuesList.list[i].dateEdit);

        if ((ENSOValuesList.list[i].soValuesTypeCode = ENCONNECTIONKIND_STANDART_20) or
            (ENSOValuesList.list[i].soValuesTypeCode = ENCONNECTIONKIND_STANDART_100))then
            contract_standart_connection_20or100 := ENSOValuesList.list[i].soValuesTypeCode;

        soValLastRow:=i+1;
        sgENSOValues.RowCount:=soValLastRow+1;
      end;

    soValColCount:=soValColCount+1;
    sgENSOValues.Row:=1;
    sgENSOValues.AutoSizeRows(True);

end;

procedure TfrmENServicesConnectionEdit.updateENSOContract;
var
  TempENSOContract: ENSOContractControllerSoapPort;
  i: Integer;
  ENSOContractList: ENSOContractShortList;
  ENSOCFilter : ENSOContractFilter;
begin

  ClearGrid(sgENSOContract);
  SetGridHeaders(ENSOContractHeaders, sgENSOContract.ColumnHeaders);
  TempENSOContract :=  HTTPRIOENSOContract as ENSOContractControllerSoapPort;

   ENSOCFilter := ENSOContractFilter.Create;
   SetNullIntProps(ENSOCFilter);
   SetNullXSProps(ENSOCFilter);
   ENSOCFilter.servicesObjectRef := ENServicesObjectRef.Create;
   ENSOCFilter.servicesObjectRef.code := ENServicesConnectionObj.code;

  ENSOContractList := TempENSOContract.getScrollableFilteredList(ENSOCFilter,0,-1);
  soValLastCount:=High(ENSOContractList.list);

  if soValLastCount > -1 then
     sgENSOContract.RowCount:=soValLastCount+2
  else
     sgENSOContract.RowCount:=2;

   with sgENSOContract do
    for i:=0 to soValLastCount do
      begin
        Application.ProcessMessages;
        if ENSOContractList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSOContractList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSOContractList.list[i].numContractFinCol;
        Cells[2,i+1] := XSDate2String(ENSOContractList.list[i].dateContractFinCol);
        Cells[3,i+1] := ENSOContractList.list[i].namePartnerFinCol;
        Cells[4,i+1] := ENSOContractList.list[i].noteContrcatFinCol;
        Cells[5,i+1] := IntToStr(ENSOContractList.list[i].finDocID);

        soValLastRow:=i+1;
        sgENSOContract.RowCount:=soValLastRow+1;
      end;

    soValColCount:=soValColCount+1;
    sgENSOContract.Row:=1;

end;

procedure TfrmENServicesConnectionEdit.updateSOLeaseAgreement;
var
  TempENSOLeaseAgreement: ENSOLeaseAgreementControllerSoapPort;
  i: Integer;
  ENSOLeaseAgreementList: ENSOLeaseAgreementShortList;
  ENSOLAFilter : ENSOLeaseAgreementFilter;
begin

  ClearGrid(sgENSOLeaseAgreement);
  SetGridHeaders(ENSOLeaseAgreementHeaders, sgENSOLeaseAgreement.ColumnHeaders);
  TempENSOLeaseAgreement :=  HTTPRIOENSOLeaseAgreement as ENSOLeaseAgreementControllerSoapPort;

   ENSOLAFilter := ENSOLeaseAgreementFilter.Create;
   SetNullIntProps(ENSOLAFilter);
   SetNullXSProps(ENSOLAFilter);
   ENSOLAFilter.servicesObjectRef := ENServicesObjectRef.Create;
   ENSOLAFilter.servicesObjectRef.code := ENServicesConnectionObj.code;

  ENSOLeaseAgreementList := TempENSOLeaseAgreement.getScrollableFilteredList(ENSOLAFilter,0,-1);
  soValLastCount:=High(ENSOLeaseAgreementList.list);

  if soValLastCount > -1 then
     sgENSOLeaseAgreement.RowCount:=soValLastCount+2
  else
     sgENSOLeaseAgreement.RowCount:=2;

   with sgENSOLeaseAgreement do
    for i:=0 to soValLastCount do
      begin
        Application.ProcessMessages;
        if ENSOLeaseAgreementList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSOLeaseAgreementList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSOLeaseAgreementList.list[i].numContract;
        Cells[2,i+1] := XSDate2String(ENSOLeaseAgreementList.list[i].dateContract);
        Cells[3,i+1] := ENSOLeaseAgreementList.list[i].namePartner;
        Cells[4,i+1] := IntToStr(ENSOLeaseAgreementList.list[i].finDocID);

        soValLastRow:=i+1;
        sgENSOLeaseAgreement.RowCount:=soValLastRow+1;
      end;

    soValColCount:=soValColCount+1;
    sgENSOLeaseAgreement.Row:=1;

end;

procedure TfrmENServicesConnectionEdit.updateNodes;
var
  TempENSO2Node: ENSO2NodeControllerSoapPort;
  i: Integer;
  ENSO2NodeList: ENSO2NodeShortList;
  so2nodeFilter : ENSO2NodeFilter;
begin

  ClearGrid(sgENSO2Node);
  SetGridHeaders(ENSO2NodeHeaders, sgENSO2Node.ColumnHeaders);
  TempENSO2Node :=  HTTPRIOENSO2Node as ENSO2NodeControllerSoapPort;

  so2nodeFilter := ENSO2NodeFilter.Create;
  SetNullIntProps(so2nodeFilter);
  SetNullXSProps(so2nodeFilter);
  so2nodeFilter.servicesobject := ENServicesObjectRef.Create;
  so2nodeFilter.servicesobject.code := ENServicesConnectionObj.code;

  ENSO2NodeList := TempENSO2Node.getScrollableFilteredList(so2nodeFilter,0,-1);
  nodeLastCount:=High(ENSO2NodeList.list);

  if nodeLastCount > -1 then
     sgENSO2Node.RowCount:=nodeLastCount+2
  else
     sgENSO2Node.RowCount:=2;

   with sgENSO2Node do
    for i:=0 to nodeLastCount do
      begin
        Application.ProcessMessages;
        if ENSO2NodeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSO2NodeList.list[i].code)
        else
        Cells[0,i+1] := '';

        if ENSO2NodeList.list[i].ccNodeCode = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(ENSO2NodeList.list[i].ccNodeCode);

          Cells[2,i+1] := ENSO2NodeList.list[i].ccelementdataname;

          if ENSO2NodeList.list[i].ccTowerCode = Low(Integer) then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := IntToStr(ENSO2NodeList.list[i].ccTowerCode);

          Cells[4,i+1] := ENSO2NodeList.list[i].towerName;

          if ENSO2NodeList.list[i].power <> nil then
          Cells[5,i+1] := ENSO2NodeList.list[i].power.DecimalString
          else
          Cells[5,i+1] := '';

          Cells[6,i+1] := ENSO2NodeList.list[i].description;

          if (ENSO2NodeList.list[i].isCalc = 1) then
          Cells[7,i+1] := 'Так'
        else
          Cells[7,i+1] := '';

          Cells[8,i+1] := ENSO2NodeList.list[i].servicesobjectContractNumberServices + '\' +
                          ENSO2NodeList.list[i].servicesobjectContractNumber + ' від ' +
                          XSDate2String(ENSO2NodeList.list[i].servicesobjectContractDateServices);

        Cells[9,i+1] := ENSO2NodeList.list[i].servicesobjectContragentName;

        Cells[10,i+1] := ENSO2NodeList.list[i].so2nodeTypeName;

        Cells[11,i+1] := ENSO2NodeList.list[i].userGen;
        if ENSO2NodeList.list[i].dateEdit = nil then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := XSDateTimeWithDate2String(ENSO2NodeList.list[i].dateEdit);
        LastRow:=i+1;
        sgENSO2Node.RowCount:=LastRow+1;

      end;

    nodeColCount:=nodeColCount+1;
    sgENSO2Node.Row:=1;
end;

function TfrmENServicesConnectionEdit.isTKCalcKindNew : Boolean;
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

function TfrmENServicesConnectionEdit.getCalculationList : ENPlanWork2ClassificationTypeShortList;
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
        IntToStr(ENServicesConnectionObj.element.code) + ' and p.kindcode = ' + IntToStr(ENPLANWORKKIND_CALCULATION) + ')';
    end
    else begin
      plan2ctFilter.planRef := ENPlanWorkRef.Create;
      plan2ctFilter.planRef.code := planCode;
    end;

    ENPlanWork2ClassificationTypeList := TempENPlanWork2ClassificationType.getScrollableFilteredList(plan2ctFilter, 0, -1);

  Result := ENPlanWork2ClassificationTypeList;
end;

procedure TfrmENServicesConnectionEdit.SetAgreeTechTermsPrepareBtnVisible;
begin
  if (DialogState <> dsView) then
  btnAgreeTechTermsPrepare.Visible :=
    cbBuildersArea.Checked or chkBaseStation.Checked
    or cbSmallArchFrm.Checked or chkGeograhicFarObject.Checked;
end;


procedure TfrmENServicesConnectionEdit.FormShow(Sender: TObject);
var
  warrant : ENWarrant;
  TempENPlanWork2ClassificationType: ENPlanWork2ClassificationTypeControllerSoapPort;
  plan2ctFilter: ENPlanWork2ClassificationTypeFilter;
  plan2ctList: ENPlanWork2ClassificationTypeShortList;
  TempTKClassificationType: TKClassificationTypeControllerSoapPort;
  ctObj: TKClassificationType;

  TempENServicesObject: ENServicesObjectControllerSoapPort;
  soFilter: ENServicesObjectFilter;
  soList : ENServicesObjectShortList;

  TempENDepartment: ENDepartmentControllerSoapPort;
  departmentFilter: ENDepartmentFilter;
  departmentList: ENDepartmentShortList;

  TempENTechConditionsServices: ENTechConditionsServicesControllerSoapPort;
  tcServicesFilter: ENTechConditionsServicesFilter;
  tcServicesArr: ENTechConditionsServicesController.ArrayOfInteger;
  isByt: Boolean;
  ENTechCondObj : ENTechConditionsObjects;
  TempENTechConditionsObjects: ENTechConditionsObjectsControllerSoapPort;
  TempENServicesContractStatus: ENServicesContractStatusControllerSoapPort;
  ENServContStatus : ENServicesContractStatus;

  sum_by_act, paySum : Double;
begin
  SetAgreeTechTermsPrepareBtnVisible;
  lblConnectionPowerSecondary.Visible := False;
  edtENElementNameSecondary.Visible := False;
  spbENElementSecondary.Visible := False;
  btnCalculatePaySumSecondary.Visible := False;
  gbPriconnectionData.Height := 96;
 // tsPowerReserve.TabVisible := false;

  chkTU.Visible := (not priconnections);
  tsPriconnection.TabVisible := priconnections;

  spbCustomerWarrant.Visible := True;

  if priconnections then
  begin
    checkWarrant := false;
  end;

  HideControls([lblContractServicesSumma, edtContractServicesSumma], priconnections);

  isJobsByTime:= False;
  isVisitClient:= False;

  DepartmentForServicesCode := -1;

  SetGridHeaders(ENPlanWorkHeaders, sgPlanForServices.ColumnHeaders);
  SetGridHeaders(ENPlanWorkHeaders, sgPlanForServicesGL.ColumnHeaders);
  SetGridHeaders(ENPlanWorkItemHeaders, sgENPlanWorkItem.ColumnHeaders);
  SetGridHeaders(TKClassificationTypeHeaders, sgENPlanWork2ClassificationType.ColumnHeaders);
  SetGridHeaders(ENPlanWorkHeaders, sgENPlanWork.ColumnHeaders);
  SetGridHeaders(ENActHeaders, sgENAct.ColumnHeaders);
  SetGridHeaders(RQFKOrderHeaders, sgRQFKOrder.ColumnHeaders);
  //SetGridHeaders(ENActIncomeHeaders, sgENActIncome.ColumnHeaders);
  SetGridHeaders(ENActIncomeTechConditionsHeaders, sgENActIncomeTechConditions.ColumnHeaders);
  SetGridHeaders(ENGiveCounterHeaders, sgENGiveCounter.ColumnHeaders);
  SetGridHeaders(TKClassificationTypeHeaders, sgENClassificationsWithCounters.ColumnHeaders);
  SetGridHeaders(ENPlanWorkItemHeaders, sgENSelectedPlanItems.ColumnHeaders);

  DisableControls([edtWarrantNumber, edtWarrantFIO,
    edtFinDocID, edtContractServicesSumma,
    edtName, edtPartnerCode, edtContractNumber, edtContractDateFin,
    edtCommentGen, edtTechConditionsDate,
    chkBaseStation, chbIsSea,
    edtTechContractNumber, edtRQOrgOrgName, edtRschet, edtBank, edtMfo,
    edtAgreementWarrantNumber, edtAgreementWarrantFIO,
    edtContractNumberProject, edtOrgNameProject, edtRschetOrgProject, edtBankOrgProject, edtMfoOrgProject,
    edtAgreementWarrantNumberProject, edtAgreementWarrantFIOProject]);

  btnPrintContract.Visible := false;
  grpPlans.Visible := false;
  tsActs.TabVisible := false;
  tsCounters.TabVisible := false;

  DisableActions([actBudgetApproved, actEditSheet4SO]);
  HideActions([actEditSheet4SO]);

  SetFloatStyle([edtContractServicesSumma, edtCostWorks, edtCostWorksProject
    , edtClosestDistance, edtCalcSum, edtSubstationBuildSum, edtContractServicesPower
    , edtPostCode, edtEPVoltageNominalVoltagenominalName]);
  if isAttachmentTablActive = true then
      pcCalculation.ActivePage := tsENDocAttachment
  else
      pcCalculation.ActivePage := tsGeneral;
  pcActs.ActivePage := tsActsHoz;

  if (DialogState = dsInsert) then
  begin
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
      , chkBaseStation
      , spbENConnectionLevelLevelRef, spbLevelClear
      , spbENConnectionPowerPointPowerPointRef ,  spbConnectionPowerPointClear
      , spbENConnectionPhasityPhasityRef, spbPhasityClear
      , spbENPowerReliabilityCategoryCategoryRef, spbPowerReliabilityClear
      , spbLineType, spbLineTypeClear
      , spbInstallationType, spbInstallationTypeClear
      , spbLocationType, spbLocationTypeClear
      , edtClosestDistance, edtCalcSum, edtSubstationBuildSum
      , edtEPVoltageNominalVoltagenominalName
      , spbEPVoltageNominalVoltagenominal
       ]);

    DisableActions([ actFilter, actNoFilter, actBudgetApproved]);

    DisableActions([actInsertCounter, actEditCounter, actDeleteCounter]);

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
      ,edtFinDocID
      ,edtContractServicesDistance
      ,edtWarrantNumber
      ,edtDepartmentForServices
     ]);

    SetFloatStyle([edtContractServicesDistance]);
  end;

  DisableControls([edtCode ,edtCommentGen ]);

  if (DialogState = dsEdit) then
  begin
      DisableControls([spbENDepartmentDepartment], false);
      DisableControls([edtContractNumber]);
      DenyBlankValues([edtENDepartmentDepartmentName]);

      DisableControls([mmoConnectionPowerPlaces, mmoConnectionPowerPoint, mmoConnectionPowerPlacesNum,
                      mmoConnectionPowerPointNum, mmoConnectionSource, mmoConnectionSourceNum]);

      ///// 28.07.10
      if ENServicesConnectionObj.finDocID = LOW_INT then
      begin
        DisableControls([{edtContractNumber, }spbContractNumberSelect], false);
        DenyBlankValues([edtContractNumber]);
      end;
      /////

      ///// 16.05.13 NET-4235
      // btnPrintFactCalc.Visible := (ENServicesConnectionObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT);
      /////
  end;

  if DialogState = dsInsert then
      edtContractNumberServices.Text := 'Auto';

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    LoadENTechAgreement2Services;
    LoadENTechAgreement2ServicesGL;
    LoadENTechAgreement2ServicesProject;
    LoadENSOTechParams;

    planCode := DMReports.getPlanCodeForCalculationByElement(ENServicesConnectionObj.element.code);

    if  ENServicesConnectionObj.warrantRef.code <> LOW_INT then
    begin
      warrant := DMReports.getWarrantByCode(ENServicesConnectionObj.warrantRef.code);

      edtWarrantNumber.Text := warrant.numbergen;
      edtWarrantFIO.Text := warrant.warrantFIO;
    end;


    if (ENServicesConnectionObj.contractStatusRef.code <= ENSERVICESOBJECTSTATUS_CANCELED) then
    begin
      pcCalculation.ActivePage := tsListWork;
      tsGeneral.TabVisible := False;
      tsPriconnection.TabVisible := False;
      gbPayments.Visible := False;
      gbBills.Visible := False;
    end;

    if (ENServicesConnectionObj.contractStatusRef.code <= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
    begin
      tsBills.TabVisible := False;
    end;
          

    if (ENServicesConnectionObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
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
             if ctObj.isNotLicensedActivity = 1 then
             begin
               //if ENServicesConnectionObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT then
               //  btnPrintBillForPrepayment.Visible := true
               //else
               // SUPP-88724 btnPrintBill.Visible := true;
             end;
         end;
       end;
       /////

       SetCountersVisibility();
    end;


    ////////// Служебка Бакланова от 21.02.12, завизированная Новицкой -
    // можно печатать счет, кошторис, акт приема-передачи, если договор в статусе "Кошторис затверджений"

    if (ENServicesConnectionObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
    begin
      grpPlans.Visible := true;
      tsActs.TabVisible := true;
    end;
    //////////


    ////////////////////////////////////////////////////////////////////////////
    // 24.04.13 Все action'ы теперь разделены
    DisableActions([actInsertPlan, actDeletePlan, actEditPlan,
                    actClosePlan, actUnClosePlan, {actFinishPlan, actUndoFinishPlan,}
                    actInsertEstimateItem, actDeleteEstimateItem, actEditEstimateItem,
                    actEditENPlanWorkItem]);

    if (ENServicesConnectionObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
    begin
      DisableActions([actInsertCalculation, actDeleteCalculation, actEditCalculation]);

      if not (ENServicesConnectionObj.contractStatusRef.code in [ENSERVICESOBJECTSTATUS_COMPLETED,
                                                             ENSERVICESOBJECTSTATUS_TERMINATED]) then
      begin
        //if (DialogState = dsEdit) and (ENServicesConnectionObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
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
          if ENServicesConnectionObj.statusRef.code <> ENSERVICESOBJECT_FINSTATUS_CLOSED then
            DisableActions([actInsertPlan, actDeletePlan, actEditPlan,
                            actClosePlan, actUnClosePlan], false);
        end;

      end;

    end; // if (ENServicesConnectionObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED)

    if (DialogState = dsEdit) and (ENServicesConnectionObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_DRAFT) then
      DisableActions([actInsertEstimateItem, actDeleteEstimateItem, actEditEstimateItem], false);
    ////////////////////////////////////////////////////////////////////////////


    if ENServicesConnectionObj.contractTypeRef <> nil then
      if ENServicesConnectionObj.contractTypeRef.code > LOW_INT then
        chkTU.Checked := (ENServicesConnectionObj.contractTypeRef.code = ENSERVICESOBJECTTYPE_TU);

    {
    HideControls([lblCNPack, edtCNPackCode, spbCNPack, memCNSubsystem,
      lblEPVoltageNominalVoltagenominalName,
      edtEPVoltageNominalVoltagenominalName,
      spbEPVoltageNominalVoltagenominal, chkBaseStation], not chkTU.Checked);
    }

    HideControls([lblEPVoltageNominalVoltagenominalName,
      edtEPVoltageNominalVoltagenominalName,
      spbEPVoltageNominalVoltagenominal{, chkBaseStation}], (not chkTU.Checked) and (not priconnections));


    /// Пока скроем кнопки "Печать договора" и "Печать счета"
    // HideControls([btnPrintContract, btnPrintBill], priconnections);


    ///////
    {
    if DialogState = dsEdit then
      if ENServicesConnectionObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_COMPLETED then
        DisableActions();
    }
    ///////

    edtCode.Text := IntToStr(ENServicesConnectionObj.code);

    if (ENServicesConnectionObj.contractNumber <> '') then
       edtContractNumber.Text := ENServicesConnectionObj.contractNumber
    else
       edtContractNumber.Text := ENServicesConnectionObj.contractNumberServices;

    if ENServicesConnectionObj.contractDateServices <> nil then
    begin
      edtContractDateServices.DateTime:=EncodeDate(ENServicesConnectionObj.contractDateServices.Year,ENServicesConnectionObj.contractDateServices.Month,ENServicesConnectionObj.contractDateServices.Day);
      edtContractDateServices.checked := true;
    end
    else
    begin
      edtContractDateServices.DateTime:=SysUtils.Date;
      edtContractDateServices.checked := false;
    end;

    cbbBasisType.ItemIndex := -1;

    if (ENServicesConnectionObj.basisType <> nil ) then
    begin
     {
     case StrToInt(ENServicesConnectionObj.basisType.DecimalString) of
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
        cbbBasisType.ItemIndex := StrToInt(ENServicesConnectionObj.basisType.DecimalString);
      except
        on EConvertError do cbbBasisType.ItemIndex := -1;
      end;

      if (ENServicesConnectionObj.basisType.DecimalString <> '3') and ( DialogState = dsEdit ) then
      begin
        DisableControls([edtWarrantContrAgentFIO , edtWarrantContrAgentNumber , edtWarrantContrAgentDate]);
        spbCustomerWarrant.Visible := True;
      end;

      if (cbbBasisType.ItemIndex = ENTECHCONDITIONSSERVICES_BASISTYPE_WARRANT) then
        spbCustomerWarrant.Visible := True;

    end else
    begin
       DisableControls([edtWarrantContrAgentFIO , edtWarrantContrAgentNumber , edtWarrantContrAgentDate]);
       cbbBasisType.ItemIndex := 0;
       spbCustomerWarrant.Visible := True;
    end;

    if ENServicesConnectionObj.contractDate <> nil then
    begin
      edtContractDateFin.DateTime:=EncodeDate(ENServicesConnectionObj.contractDate.Year,ENServicesConnectionObj.contractDate.Month,ENServicesConnectionObj.contractDate.Day);
      edtContractDateFin.checked := true;
    end;

    edtContragentName.Text := ENServicesConnectionObj.contragentName;
    MakeMultiline(edtContragentAddress.Lines, ENServicesConnectionObj.contragentAddress);
    MakeMultiline(edtContragentAddressWork.Lines, ENServicesConnectionObj.contragentAddressWork);
    MakeMultiline(edtContragentPassport.Lines, ENServicesConnectionObj.contragentPassport);
    edtContragentOkpo.Text := ENServicesConnectionObj.contragentOkpo;
    edtContragentBossName.Text := ENServicesConnectionObj.contragentBossName;
    edtContragentBankName.Text := ENServicesConnectionObj.contragentBankName;
    edtContragentBankAccount.Text := ENServicesConnectionObj.contragentBankAccount;
    edtContragentBankMfo.Text := ENServicesConnectionObj.contragentBankMfo;
    edtENDepartmentDepartmentName.Text := ENServicesConnectionObj.department.name;
    MakeMultiline(edtCommentGen.Lines, ENServicesConnectionObj.commentGen);

    edtName.Text := ENServicesConnectionObj.name;
    edtPartnerCode.Text := ENServicesConnectionObj.partnerCode;
    edtFinDocCode.Text := ENServicesConnectionObj.finDocCode;

    edtWarrantContrAgentNumber.Text := ENServicesConnectionObj.warrantNumber;
    edtWarrantContrAgentFIO.Text := ENServicesConnectionObj.warrantFIO;

    edtDemographicCode.Text := ENServicesConnectionObj.demographicCode;
    edtRealEstateRegNumber.Text := ENServicesConnectionObj.realEstateRegNumber;
    edtOwnershipRecordNumber.Text := ENServicesConnectionObj.ownershipRecordNumber;

    if ENServicesConnectionObj.warrantDate <> nil then
    begin
      edtWarrantContrAgentDate.DateTime:=EncodeDate(ENServicesConnectionObj.warrantDate.Year,ENServicesConnectionObj.warrantDate.Month,ENServicesConnectionObj.warrantDate.Day);
      edtWarrantContrAgentDate.checked := true;
    end;

    if ( ENServicesConnectionObj.finDocID <> Low(Integer) ) then
       edtFinDocID.Text := IntToStr(ENServicesConnectionObj.finDocID)
    else
       edtFinDocID.Text := '';

    if ( ENServicesConnectionObj.contractServicesSumma <> nil ) then
       edtContractServicesSumma.Text := ENServicesConnectionObj.contractServicesSumma.decimalString
    else
       edtContractServicesSumma.Text := '';

    if ( ENServicesConnectionObj.contractServicesDistance <> nil ) then
       edtContractServicesDistance.Text := ENServicesConnectionObj.contractServicesDistance.decimalString
    else
       edtContractServicesDistance.Text := '';

    edtContragentPosition.Text := ENServicesConnectionObj.contragentPosition;
    MakeMultiline(edtCustomerMailingAddress.Lines, ENServicesConnectionObj.customerMailingAddress);


    edtPostCode.Text := ENServicesConnectionObj.postCode;

    if ENServicesConnectionObj.tension_point <> nil then begin
      edtEPVoltageNominalVoltagenominalName.Text := ENServicesConnectionObj.tension_point.DecimalString;
    end;

    if ENServicesConnectionObj.executeWorkDate <> nil then
      begin
        edtExecuteWorkDate.DateTime:=EncodeDate(ENServicesConnectionObj.executeWorkDate.Year,ENServicesConnectionObj.executeWorkDate.Month,ENServicesConnectionObj.executeWorkDate.Day);
        edtExecuteWorkDate.checked := true;
      end
    else
      begin
        edtExecuteWorkDate.DateTime:=SysUtils.Date;
        edtExecuteWorkDate.checked := false;
      end;
    if ENServicesConnectionObj.timeStart <> nil then
      begin
        edtTimeStart.DateTime:= EncodeTime(ENServicesConnectionObj.timeStart.Hour,ENServicesConnectionObj.timeStart.Minute, 0, 0);
        //EncodeDate(ENTravelSheetObj.timeStart.Year,ENTravelSheetObj.timeStart.Month,ENTravelSheetObj.timeStart.Day);
        edtTimeStart.checked := true;
      end
      else
      begin
        edtTimeStart.DateTime:=SysUtils.Date;
        edtTimeStart.checked := false;
      end;

      if ENServicesConnectionObj.timeFinal <> nil then
      begin
        edtTimeFinal.DateTime:= EncodeTime(ENServicesConnectionObj.timeFinal.Hour,ENServicesConnectionObj.timeFinal.Minute, 0, 0);
         //EncodeDate(ENTravelSheetObj.timeFinal.Year,ENTravelSheetObj.timeFinal.Month,ENTravelSheetObj.timeFinal.Day);
        edtTimeFinal.checked := true;
      end
      else
      begin
        edtTimeFinal.DateTime:=SysUtils.Date;
        edtTimeFinal.checked := false;
      end;

      edtContragentPhoneNumber.Text := ENServicesConnectionObj.contragentPhoneNumber;
      edtContragentObjectWork.Text := ENServicesConnectionObj.contragentObjectWork;

      rgContragentType.ItemIndex:= ENServicesConnectionObj.contragentTypeRef.code-1;
      rgPayable.ItemIndex:= ENServicesConnectionObj.isNoPay;
     // тех условия
      edtTechConditionsNumber.Text := ENServicesConnectionObj.techConObjects.numberGen;
      chkPrintTechTermsDate.Checked :=
        (Pos('EWF', edtTechConditionsNumber.Text) = 0);
    if ENServicesConnectionObj.techConObjects.dateGen <> nil then
    begin
      edtTechConditionsDate.DateTime := EncodeDate(ENServicesConnectionObj.techConObjects.dateGen.Year,ENServicesConnectionObj.techConObjects.dateGen.Month,ENServicesConnectionObj.techConObjects.dateGen.Day);
      edtTechConditionsDate.checked := true;
    end;

    /////////////////////////////
    // 21.09.12 NET-3079
    chbIsCustomerMaterials.Checked := (ENServicesConnectionObj.isCustomerMaterials = ENSERVICESOBJECT_ISCUSTOMERMATERIALS);


    // 10.01.13 NET-4159
    //if ENServicesConnectionObj.resposible <> '' then
    //  edtENResponsible.Text := ENServicesConnectionObj.resposiblePosition + ' ' + ENServicesConnectionObj.resposible;
    edtENResponsible.Text := ENServicesConnectionObj.resposible;
    edtENResponsiblePosition.Text := ENServicesConnectionObj.resposiblePosition;

    //planCode := DMReports.getPlanCodeForCalculationByElement(ENServicesConnectionObj.element.code);
    ////////
    SetFormCaption(ENServicesConnectionObj.element.code);
    ////////

      //edtENElementElementName.Text := ENServicesConnectionObj.element.name;
    DisableControls([edtDepartmentForServices,btnENDepartmentDepartment]);

    if ENServicesConnectionObj.department.code <> LOW_INT then
       begin
         DepartmentForServicesCode:= ENServicesConnectionObj.department.code;
         edtDepartmentForServices.Text := ENServicesConnectionObj.department.shortName;
       end;

     // объект Ту по контрагенту
    TempENTechConditionsObjects :=  HTTPRIOENTechConditionsObjects as ENTechConditionsObjectsControllerSoapPort;

    if ENServicesConnectionObj.techConObjects.code <> LOW_INT then
    begin
        ENTechCondObj:= TempENTechConditionsObjects.getObject(ENServicesConnectionObj.techConObjects.code);
        if ENTechCondObj <> nil then
        begin
            MakeMultiline(mmoConnectionPowerPlaces.Lines,ENTechCondObj.connectionPowerPlaces);
            MakeMultiline(mmoConnectionPowerPoint.Lines,ENTechCondObj.connectionPowerPoint);
            MakeMultiline(mmoConnectionPowerPlacesNum.Lines,ENTechCondObj.connectionPowerPlacesNum);
            MakeMultiline(mmoConnectionPowerPointNum.Lines,ENTechCondObj.connectionPowerPointNum);
            MakeMultiline(mmoConnectionSource.Lines,ENTechCondObj.connectionSource);
            MakeMultiline(mmoConnectionSourceNum.Lines,ENTechCondObj.connectionSourceNum);

            if ENTechCondObj.securityZone = ENTECHCONDITIONSOBJECT_SECURITYZONE_YES then
               lblWarningSecurityZone.Visible := true;

        end;
    end;

    TempENServicesContractStatus :=  HTTPRIOENServicesContractStatus as ENServicesContractStatusControllerSoapPort;

    if ENServicesConnectionObj.contractStatusRef.code <> LOW_INT then
    begin
        ENServContStatus := TempENServicesContractStatus.getObject(ENServicesConnectionObj.contractStatusRef.code);
        if ENServContStatus <> nil then
           lblENServicesContractStatus.Caption := ENServContStatus.name;
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
         HideControls([lblExecuteWorkDate , edtExecuteWorkDate  , lblTimeStart  , lblTimeStart2  ,  edtTimeStart  , lblTimeFinal3  , edtTimeFinal  ,  lblDeliveryOneWay ],false);
         DisableControls([spbENDepartmentDepartment]);
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
           ' where so2tc.servicesobjectrefcode = ' + IntToStr(ENServicesConnectionObj.code) + ')';

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

    isByt := (ENServicesConnectionObj.contragentTypeRef.code = ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL);
    if (isByt) then
    begin
      //btnPrintContractSupply.Visible := False;
    end;

       //////////////////////////// 10.06.13 NET-4237
       // Вытягиваем связанные договора по группам
       LoadUnitedGroups;
       ////////////////////////////
       pcCalculationChange(Sender);
  end;

  if DialogState = dsEdit then
  begin
    if ((chkTU.Checked) and (rgContragentType.ItemIndex = 1) ) then
         DisableControls([edtContragentObjectWork],false)
    else
         DisableControls([edtContragentObjectWork],True);
  end;
 //end;
    DisableControls([edtDepartmentForServices]);
    DenyBlankValues([edtDepartmentForServices]);

  checkWarrant := true;

 // Отображение фин.результати договора
  if (DialogState = dsEdit) or (DialogState = dsView) then
       begin
         TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

         soFilter := ENServicesObjectFilter.Create;
         SetNullIntProps(soFilter);
         SetNullXSProps(soFilter);

         soFilter.code := ENServicesConnectionObj.code;

         soList := TempENServicesObject.getEasyShortList(soFilter, 0, -1);

         if soList.totalCount > 0 then
         begin
           if soList.list[0].sum_by_act = nil then
           sum_by_act := 0
           else
           sum_by_act := StrToFloat(soList.list[0].sum_by_act.DecimalString);

           if soList.list[0].paySum = nil then
           paySum := 0
           else
           paySum := StrToFloat(soList.list[0].paySum.DecimalString);

           mmoFinResult.Lines.Add('Фін.результат = Сума оплати - сума видаткових актів');
           mmoFinResult.Lines.Add(FloatToStr(paySum - sum_by_act - getSumRQFKOrder) +
           ' = ' + FloatToStr(paySum) + ' - ' + FloatToStr(sum_by_act)+
           ' - ' + FloatToStr(getSumRQFKOrder));
         end;
       end;

       //SUPP-94412
       HideControls([gbAdditional, gbPriconnectionData
       , Label20, edtResponsiblePerson]);

  if (ENServicesConnectionObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_DISCLAIMER) then
    begin
      DisableControls([ToolButton17, btnRemovePlanFromTechCond, ToolButton4, ToolButton16, ToolButton6, ToolButton7, ToolButton8, ToolButton22 ]);
      lblDisclaimerServices.Width := 666;
      lblDisclaimerServices.Caption := 'Увага! Замовник надав відмову від ТУ. ' +
      ' Роботи мають бути завершені. Для можливості планування робіт зверніться до Департаменту з технічних приєднань';
      lblDisclaimerServices.Visible := True;
    end;

end;


function TfrmENServicesConnectionEdit.saveReqs : Boolean;
var TempENServicesObject: ENServicesObjectControllerSoapPort;
     TempENTechConditionsObjects: ENTechConditionsObjectsControllerSoapPort;
begin


    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    if (ENServicesConnectionObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
    begin

     if edtcontractDateFin.checked then
     begin
       if ENServicesConnectionObj.contractDate = nil then
          ENServicesConnectionObj.contractDate := TXSDate.Create;
       ENServicesConnectionObj.contractDate.XSToNative(GetXSDate(edtcontractDateFin.DateTime));
     end
     else begin
        Application.MessageBox(PChar('Введите дату договора!'),PChar('Внимание!'), MB_ICONWARNING);
        ENServicesConnectionObj.contractDate := nil;
        pcCalculation.ActivePage := tsGeneral;
        if edtcontractDateFin.CanFocus then
          edtcontractDateFin.SetFocus;
        Result := False;
        Exit;
     end;

     if edtcontractDateServices.checked then
     begin
       if ENServicesConnectionObj.contractDateServices = nil then
          ENServicesConnectionObj.contractDateServices := TXSDate.Create;
       ENServicesConnectionObj.contractDateServices.XSToNative(GetXSDate(edtcontractDateServices.DateTime));
     end
     else begin
        Application.MessageBox(PChar('Введите дату договора!'),PChar('Внимание!'), MB_ICONWARNING);
        ENServicesConnectionObj.contractDateServices := nil;
        pcCalculation.ActivePage := tsGeneral;
        if edtcontractDateServices.CanFocus then
          edtcontractDateServices.SetFocus;
          Result := False;
        Exit;
     end;
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
        Result := False;
       Exit;
     end;
   end;
   //////////////////////////////////////

    if (ENServicesConnectionObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_DRAFT) then
      ENServicesConnectionObj.name := ' '
    else
      ENServicesConnectionObj.name := edtName.Text; // контрагент из фин договора


     ENServicesConnectionObj.partnerCode := edtPartnerCode.Text;

     ENServicesConnectionObj.finDocCode := edtFinDocCode.Text;

     if ( edtFinDocID.Text <> '' ) then
       ENServicesConnectionObj.finDocID := StrToInt(edtFinDocID.Text)
     else
       ENServicesConnectionObj.finDocID := Low(Integer) ;

     ENServicesConnectionObj.commentGen := edtCommentGen.Text;

     ENServicesConnectionObj.contractNumberServices := edtContractNumberServices.Text; // наш
     ENServicesConnectionObj.contractNumber := edtContractNumber.Text;

     ENServicesConnectionObj.contragentName := edtContragentName.Text; // контрагент услуги

     ENServicesConnectionObj.contragentAddress := edtContragentAddress.Text;
     ENServicesConnectionObj.contragentAddressWork := edtContragentAddressWork.Text;

     ENServicesConnectionObj.contragentOkpo := edtContragentOkpo.Text;

     ENServicesConnectionObj.contragentBankAccount := edtContragentBankAccount.Text;

     ENServicesConnectionObj.contragentBankName := edtContragentBankName.Text;

     ENServicesConnectionObj.contragentBankMfo := edtContragentBankMfo.Text;
     ENServicesConnectionObj.contragentBossName := edtContragentBossName.Text;
     ENServicesConnectionObj.contragentPassport := edtContragentPassport.Text;
     ENServicesConnectionObj.contragentTypeRef := ENServicesContragentTypeRef.Create;
     ENServicesConnectionObj.contragentTypeRef.code := rgContragentType.ItemIndex+1;
     ENServicesConnectionObj.contractTypeRef := ENServicesContractTypeRef.Create ;

     ENServicesConnectionObj.isNoPay := rgPayable.ItemIndex;
     ENServicesConnectionObj.contragentPosition := edtContragentPosition.Text;
     ENServicesConnectionObj.customerMailingAddress := edtCustomerMailingAddress.Text;
     ENServicesConnectionObj.postCode := edtPostCode.Text;

     if edtContractServicesPower.Text <> '' then
       ENServicesConnectionObj.contractServicesPower.decimalString := edtContractServicesPower.Text
     else
       ENServicesConnectionObj.contractServicesPower := nil;

     if (ENServicesConnectionObj.contractServicesSumma = nil ) then
     ENServicesConnectionObj.contractServicesSumma := TXSDecimal.Create;
     if edtContractServicesSumma.Text <> '' then
       ENServicesConnectionObj.contractServicesSumma.decimalString := edtContractServicesSumma.Text
     else
       ENServicesConnectionObj.contractServicesSumma := nil;

     if (ENServicesConnectionObj.contractServicesPower = nil ) then
       ENServicesConnectionObj.contractServicesPower := TXSDecimal.Create;

     if (ENServicesConnectionObj.contractServicesDistance = nil ) then
       ENServicesConnectionObj.contractServicesDistance := TXSDecimal.Create;
     if edtContractServicesDistance.Text <> '' then
       ENServicesConnectionObj.contractServicesDistance.decimalString := edtContractServicesDistance.Text
     else
       ENServicesConnectionObj.contractServicesDistance := nil;

     if (ENServicesConnectionObj.contractServicesDay = nil ) then
       ENServicesConnectionObj.contractServicesDay := TXSDecimal.Create;

      ENServicesConnectionObj.warrantNumber := edtWarrantContrAgentNumber.Text;
      ENServicesConnectionObj.warrantFIO := edtWarrantContrAgentFIO.Text;

      if edtWarrantContrAgentDate.checked then
      begin
        if ENServicesConnectionObj.warrantDate = nil then
        ENServicesConnectionObj.warrantDate := TXSDate.Create;
        ENServicesConnectionObj.warrantDate.XSToNative(GetXSDate(edtWarrantContrAgentDate.DateTime));
      end
      else
      ENServicesConnectionObj.warrantDate := nil;

      if (ENServicesConnectionObj.basisType = nil ) then
     ENServicesConnectionObj.basisType := TXSDecimal.Create;
     if ( (cbbBasisType.ItemIndex <> -1 ) and  (cbbBasisType.ItemIndex <> 0) ) then
       ENServicesConnectionObj.basisType.decimalString := IntToStr(cbbBasisType.itemIndex)
     else
       ENServicesConnectionObj.basisType := nil;


     // 12.04.2013 +++ для присоединений тип договора уже есть!!!
     // if chkTU.Checked then
     //   ENServicesConnectionObj.contractTypeRef.code := ENSERVICESOBJECTTYPE_TU // тех условия
     if (priconnections) then
       ENServicesConnectionObj.contractTypeRef.code := ENSERVICESOBJECTTYPE_CONNECTION
     else
       if not chkTU.Checked then
         ENServicesConnectionObj.contractTypeRef.code := ENSERVICESOBJECTTYPE_OTHER  // не тех условия
       else
         ENServicesConnectionObj.contractTypeRef.code := ENSERVICESOBJECTTYPE_TU;


     if edtdateEdit.checked then
     begin
       if ENServicesConnectionObj.dateEdit = nil then
          ENServicesConnectionObj.dateEdit := TXSDate.Create;
       ENServicesConnectionObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENServicesConnectionObj.dateEdit := nil;

       if edtexecuteWorkDate.checked then
     begin
       if ENServicesConnectionObj.executeWorkDate = nil then
          ENServicesConnectionObj.executeWorkDate := TXSDate.Create;
       ENServicesConnectionObj.executeWorkDate.XSToNative(GetXSDate(edtexecuteWorkDate.DateTime));
     end
     else
       ENServicesConnectionObj.executeWorkDate := nil;

     if edttimeStart.checked then
     begin
       if ENServicesConnectionObj.timeStart = nil then
          ENServicesConnectionObj.timeStart := TXSDateTime.Create;
         ENServicesConnectionObj.timeStart.XSToNative(GetXSDateTime(edttimeStart.DateTime));
     end
     else
       ENServicesConnectionObj.timeStart := nil;

     if edttimeFinal.checked then
     begin
       if ENServicesConnectionObj.timeFinal = nil then
          ENServicesConnectionObj.timeFinal := TXSDateTime.Create;
       ENServicesConnectionObj.timeFinal.XSToNative(GetXSDateTime(edttimeFinal.DateTime));
     end
     else
       ENServicesConnectionObj.timeFinal := nil;

    ENServicesConnectionObj.contragentPhoneNumber := edtContragentPhoneNumber.Text;
    ENServicesConnectionObj.contragentObjectWork :=  edtContragentObjectWork.Text;

    // 21.09.12 NET-3079
    ENServicesConnectionObj.isCustomerMaterials := Ord(chbIsCustomerMaterials.Checked);
    // Если признак использования материалов заказчика сбросили, то нужно очистить
    // номер и дату акта приема-передачи
    if not chbIsCustomerMaterials.Checked then
    begin
      ENServicesConnectionObj.actTransferNumber := '';
      ENServicesConnectionObj.actTransferDate := nil;
    end;

    ENServicesConnectionObj.resposible := edtENResponsible.Text;
    ENServicesConnectionObj.resposiblePosition := edtENResponsiblePosition.Text;

    //PRIC-552
    if ENServicesConnectionObj.tension_point = nil then
      ENServicesConnectionObj.tension_point := TXSDecimal.Create;
    if edtEPVoltageNominalVoltagenominalName.Text <> '' then
      ENServicesConnectionObj.tension_point.DecimalString :=
        edtEPVoltageNominalVoltagenominalName.Text
    else
      ENServicesConnectionObj.tension_point := nil;

    if chkBaseStation.Checked then
      ENServicesConnectionObj.baseStation := 1
    else
      ENServicesConnectionObj.baseStation := low(Integer);

    ENServicesConnectionObj.demographicCode := edtDemographicCode.Text;
    ENServicesConnectionObj.realEstateRegNumber := edtRealEstateRegNumber.Text;
    ENServicesConnectionObj.ownershipRecordNumber := edtOwnershipRecordNumber.Text;

    if DialogState = dsEdit then
    begin

        // SUPP-42302...
        if (ENTechConditionsServicesObj = nil) then
        begin
          Application.MessageBox(PChar('Відсутній зв''язок договору з технічними умовами!!!' + #13#10 +
            'Перевірте укладання договору в EnergyWorkFlow!!!'),PChar('Внимание!'), MB_ICONWARNING);
            Result := False;
          Exit;
        end;

        if not FillENTechConditionsServices then
        begin
          Result := False;
          Exit;
        end;

        //SUPP-96241
        if ENServicesConnectionObj.techConObjects.code <> LOW_INT then
        begin
            TempENTechConditionsObjects := HTTPRIOENTechConditionsObjects as ENTechConditionsObjectsControllerSoapPort;
            try
                ENTechConditionsObjectsObj := TempENTechConditionsObjects.getObject(ENServicesConnectionObj.techConObjects.code);
            except
                on EConvertError do Exit;
            end;

            ENTechConditionsObjectsObj.customer := edtContragentName.Text;
            ENTechConditionsObjectsObj.address := edtContragentAddressWork.Text;

            TempENTechConditionsObjects.save(ENTechConditionsObjectsObj);
        end;

        TempENServicesObject.saveForCalculation(ENServicesConnectionObj, ENTechConditionsServicesObj);
        Result := True;

 end;
end;


procedure TfrmENServicesConnectionEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
begin

  if (ModalResult = mrOk) and (DialogState = dsEdit) then
    if (ENServicesConnectionObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) and

   not NoBlankValues([
      edtContractNumberServices
      ,edtContragentName
      ,edtENDepartmentDepartmentName
     ])  then
   begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
   end
   else
     if not saveReqs then
     Action:=caNone;

  ENPriconnectionDataObj := nil;
end;

procedure TfrmENServicesConnectionEdit.btnENDepartmentDepartmentClick(Sender : TObject);
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
              // if ENServicesConnectionObj.department = nil then ENServicesConnectionObj.department := ENDepartment.Create();
               DepartmentForServicesCode := ENDepartmentShort(tvDep.Selected.Data).code;
               edtDepartmentForServices.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
              // if  ENServicesConnectionObj.element = nil then  ENServicesConnectionObj.element := ENElement.Create;
              // if  ENServicesConnectionObj.element.renRef = nil then ENServicesConnectionObj.element.renRef := EPRenRef.Create;
              // ENServicesConnectionObj.element.renRef.code := StrToInt(DMReports.getEPRenByDepartmentCode(ENServicesConnectionObj.department.code));
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;



procedure TfrmENServicesConnectionEdit.btnENElementElementClick(Sender : TObject);
var
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENServicesConnectionObj.element = nil then ENServicesConnectionObj.element := ENElement.Create();
               ENServicesConnectionObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;



procedure TfrmENServicesConnectionEdit.btnMeteringReportClick(Sender: TObject);
var
  request: CCReportRequestEx;
  argNames, args: ArrayOfString;
  reportName : String;
  showDetails : String;
begin

  if MainTree.Selected = nil then
  begin
     ShowMessage('Оберіть вузел дерева об''єктів CallCentre');
     exit;
  end;

  case CCNodeExtShort(MainTree.Selected.Data).nodetypeCode of
  1,3,5,7:
      begin
        SetLength(argNames,1);
        SetLength(args,1);
        argNames[0] := 'feederCode';
        args[0] := IntToStr(CCNodeExtShort(MainTree.Selected.Data).code);

        reportName:='/com/ksoe/callcenter/reports/Metering/MeteringFeeder.jasper';
      end;
  2,4,6:
      begin
        case Application.MessageBox(PChar('Включить в отчет замеры фидеров ?'),
                        PChar('Внимание !'),MB_ICONQUESTION+MB_YESNOCANCEL+MB_DEFBUTTON1) of
        IDYES:  showDetails:='1';
        IDNO:   showDetails:='0';
        IDCANCEL: Exit;
        end;

        SetLength(argNames,2);
        SetLength(args,2);
        argNames[0] := 'substationCode';
        args[0] := IntToStr(CCNodeExtShort(MainTree.Selected.Data).code);
        argNames[1] := 'showDetails';
        args[1] := showDetails;

        reportName:='/com/ksoe/callcenter/reports/Metering/MeteringSubstation.jasper';
      end
  else Exit;
  end;

  request := CCReportRequestEx.Create;
  request.argNames:=argNames;
  request.args:=args;
  request.resultType:=Low(Integer);
  request.reportCode := 0;
  request.funcName := reportName;

  CCDMReport.makeGeneralReportPDF('MeteringReport', request, 'xls');

end;

procedure TfrmENServicesConnectionEdit.btnContractNumberSelectClick(Sender: TObject);
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


procedure TfrmENServicesConnectionEdit.spbCustomerWarrantClick(Sender: TObject);
var
  servicesObjectCode: Integer;
  frmENCustomerWarrantShow: TfrmENCustomerWarrantShow;
  customerWarrantFilter: ENCustomerWarrantFilter;
  TempENServicesObject: ENServicesObjectControllerSoapPort;
begin
  inherited;
  customerWarrantFilter := ENCustomerWarrantFilter.Create();
  SetNullXSProps(customerWarrantFilter);
  SetNullIntProps(customerWarrantFilter);

  customerWarrantFilter.servicesObjectRef := ENServicesObjectRef.Create;
  customerWarrantFilter.servicesObjectRef.code := ENServicesConnectionObj.code;
  servicesObjectCode := ENServicesConnectionObj.code;

  frmENCustomerWarrantShow := TfrmENCustomerWarrantShow.Create(Application, fmNormal, customerWarrantFilter);
  frmENCustomerWarrantShow.servicesObjectCode := ENServicesConnectionObj.code;
  try
    with frmENCustomerWarrantShow do
      if ShowModal = mrOk then
      begin
        try
          //
          //
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENCustomerWarrantShow.Free;
  end;

  // обновить договор
  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  ENServicesConnectionObj := TempENServicesObject.getObject(servicesObjectCode);

  edtWarrantContrAgentFIO.Text := ENServicesConnectionObj.warrantFIO;
  edtWarrantContrAgentNumber.Text := ENServicesConnectionObj.warrantNumber;

  if ENServicesConnectionObj.warrantDate <> nil then
  begin
    edtWarrantContrAgentDate.DateTime := EncodeDate(ENServicesConnectionObj.warrantDate.Year,ENServicesConnectionObj.warrantDate.Month,ENServicesConnectionObj.warrantDate.Day);
    edtWarrantContrAgentDate.Checked := True;
  end;

end;


procedure TfrmENServicesConnectionEdit.spbContractNumberProjectClick(Sender: TObject);
var
  frmFINServicesObjectShow: TfrmFINServicesObjectShow;
  f: ENServicesObjectFilter;
begin
  inherited;
  f := ENServicesObjectFilter.Create();
  SetNullXSProps(f);
  SetNullIntProps(f);

  if (ENTechAgreement2ServicesProject <> nil) and (ENTechAgreement2ServicesProject.partnerCode <> '') then
  begin
    f.conditionSQL := ' a.io_flag = ''B'' and p.code = ''' + ENTechAgreement2ServicesProject.partnerCode + '''';
    f.partnerCode := ENTechAgreement2ServicesProject.partnerCode;
  end
  else
  begin
    Application.MessageBox(PChar('Оберіть виконавця!!!'),PChar('Увага!!!'),MB_ICONWARNING+MB_OK);
    Exit;
  end;

  frmFINServicesObjectShow := TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
  frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
  try
    with frmFINServicesObjectShow do
      if ShowModal = mrOk then
      begin
        try
          edtContractNumberProject.Text := '№ ' + GetReturnValue(sgFINServicesObject, 1) + ' від ' + GetReturnValue(sgFINServicesObject, 2);
          ENTechAgreement2ServicesProject.contractNumber := GetReturnValue(sgFINServicesObject, 1);
          ENTechAgreement2ServicesProject.contractDate := TXSDate.Create;
          ENTechAgreement2ServicesProject.contractDate.XSToNative(GetXSDate( StrToDate(GetReturnValue(sgFINServicesObject, 2)) ));
          ENTechAgreement2ServicesProject.finDocCode  := GetReturnValue(sgFINServicesObject, 5);
          ENTechAgreement2ServicesProject.finDocId := StrToInt(GetReturnValue(sgFINServicesObject, 6));
          ENTechAgreement2ServicesProject.commentGen := GetReturnValue(sgFINServicesObject, 7);

          // SUPP-26898... 05.12.2014...
          //if (ENTechAgreement2Services.partnerCode = FK_PARTNERCODE_BRІLYUKS) then
          //  edtBasisForAction.Text := 'Директора Грисевича Дмитра Володимировича, що діє на підставі Статуту, ' +
          //    'а також інженера з технічного нагляду за будівництвом Грисевича Д.В., ' +
          //    'що діє на підставі Кваліфікаційного Сертифікату №002683 Серія ІТ від 06.08.2013року (№2005 в Реестрі), Наказу № 4 -ОК,';

        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmFINServicesObjectShow.Free;
  end;
end;


procedure TfrmENServicesConnectionEdit.spbContractNumberSelectClick(
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

   if (edtContractNumber.Text <> '') then
     f.contractNumber := edtContractNumber.Text
   else
     f.contractNumber := '-1';

   //f.conditionSQL := 'a.io_flag = ''S'' and a.agree_group_id in (205, 342, 319, 88, 201, 218, 303, 198, 50, 206, 338, 44)';
   f.conditionSQL := 'a.io_flag = ''S'' and a.agree_group_id in (' + AGREES_GROUPS_IDS + ')';

   frmFINServicesObjectShow:=TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_CUSTOMER;
   try
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin
            try
{
        Cells[1,i+1] := EN
   begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    if (ENServicesConnectionObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
    begin
ServicesObjectList.list[i].contractNumber;
        if ENServicesObjectList.list[i].contractDate = nil then
          Cells[2,i+1] := ''
      end
      else
      begin
        edtContractDateFin.DateTime:=SysUtils.Date;
        edtContractDateFin.checked := false;
      end;

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

procedure TfrmENServicesConnectionEdit.spbENConnectionLevelLevelRefClick(
  Sender: TObject);
var
   frmENConnectionLevelShow: TfrmENConnectionLevelShow;
begin
   frmENConnectionLevelShow:=TfrmENConnectionLevelShow.Create(Application,fmNormal);
   try
      with frmENConnectionLevelShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSOTechParamsObject = nil then ENSOTechParamsObject := ENSOTechParams.Create;
               if ENSOTechParamsObject.levelRef = nil then ENSOTechParamsObject.levelRef := ENConnectionLevelRef.Create();
               ENSOTechParamsObject.levelRef.code := StrToInt(GetReturnValue(sgENConnectionLevel,0));
               edtENConnectionLevelLevelRefName.Text:=GetReturnValue(sgENConnectionLevel,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENConnectionLevelShow.Free;
   end;
end;

procedure TfrmENServicesConnectionEdit.spbENConnectionPhasityPhasityRefClick(
  Sender: TObject);
var
   frmENConnectionPhasityShow: TfrmENConnectionPhasityShow;
begin
   frmENConnectionPhasityShow:=TfrmENConnectionPhasityShow.Create(Application,fmNormal);
   try
      with frmENConnectionPhasityShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSOTechParamsObject = nil then ENSOTechParamsObject := ENSOTechParams.Create;
               if ENSOTechParamsObject.phasityRef = nil then ENSOTechParamsObject.phasityRef := ENConnectionPhasityRef.Create();
               ENSOTechParamsObject.phasityRef.code := StrToInt(GetReturnValue(sgENConnectionPhasity,0));
               edtENConnectionPhasityPhasityRefName.Text:=GetReturnValue(sgENConnectionPhasity,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENConnectionPhasityShow.Free;
   end;
end;

procedure TfrmENServicesConnectionEdit.spbENConnectionPowerPointPowerPointRefClick(
  Sender: TObject);
var
   frmENConnectionPowerPointShow: TfrmENConnectionPowerPointShow;
begin
   frmENConnectionPowerPointShow:=TfrmENConnectionPowerPointShow.Create(Application,fmNormal);
   try
      with frmENConnectionPowerPointShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSOTechParamsObject = nil then ENSOTechParamsObject := ENSOTechParams.Create;
               if ENSOTechParamsObject.powerPointRef = nil then ENSOTechParamsObject.powerPointRef := ENConnectionPowerPointRef.Create();
               ENSOTechParamsObject.powerPointRef.code := StrToInt(GetReturnValue(sgENConnectionPowerPoint,0));
               edtENConnectionPowerPointPowerPointRefName.Text:=GetReturnValue(sgENConnectionPowerPoint,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENConnectionPowerPointShow.Free;
   end;
end;

procedure TfrmENServicesConnectionEdit.spbENDepartmentDepartmentClick(
  Sender: TObject);
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
               if ENServicesConnectionObj.department = nil then ENServicesConnectionObj.department := ENDepartment.Create();
               ENServicesConnectionObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
               if  ENServicesConnectionObj.element = nil then  ENServicesConnectionObj.element := ENElement.Create;
               if  ENServicesConnectionObj.element.renRef = nil then ENServicesConnectionObj.element.renRef := EPRenRef.Create;
               ENServicesConnectionObj.element.renRef.code := StrToInt(DMReports.getEPRenByDepartmentCode(ENServicesConnectionObj.department.code));
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENServicesConnectionEdit.actUpdateExecute(Sender: TObject);
begin
  inherited;
  pcCalculationChange(Sender);
end;

procedure TfrmENServicesConnectionEdit.actViewExecute(Sender: TObject);
Var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    //TempENPlanWork: ENPlanWorkControllerSoapPort;
    TempENEstimateItem : ENEstimateItemControllerSoapPort;
    //tPlan: ENPlanWork;
    //objCode: Integer;
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


end;


procedure TfrmENServicesConnectionEdit.pcActsChange(Sender: TObject);
begin
  inherited;
  actUpdateENActsExecute(Sender);
end;


function TfrmENServicesConnectionEdit.getPlansList(filter : ENPlanWorkFilter) : ENPlanWorkShortList;
var
  strTechCondPlanCodes: String;
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  list : ENPlanWorkShortList;

begin
  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  if not Assigned(filter) then begin
    filter := ENPlanWorkFilter.Create;
    SetNullIntProps(filter);
    SetNullXSProps(filter);
  end;

    strTechCondPlanCodes := '-1';
    if ENTechConditionsServicesObj <> nil then
      if ENTechConditionsServicesObj.code <> LOW_INT then
        strTechCondPlanCodes := DMReports.getStrCodePlanFromENtechCond2enplanwork(ENTechConditionsServicesObj.code);

    if Length(filter.conditionSQL) <> 0 then filter.conditionSQL := filter.conditionSQL + ' and ';
    filter.conditionSQL := filter.conditionSQL + '(enplanwork.elementrefcode = ' + IntToStr(ENServicesConnectionObj.element.code) +
                               ' or enplanwork.code in (' + strTechCondPlanCodes + '))';
    list := TempENPlanWork.getScrollableFilteredList(filter, 0, -1);
    Result := list;
end;

procedure TfrmENServicesConnectionEdit.pcCalculationChange(
  Sender: TObject);
var
  TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
  planItemFilter: ENPlanWorkItemFilter;
  i,LastCountM: Integer;
  ENPlanWorkItemList: ENPlanWorkItemShortList;
  vNormOfTime, vCountGen: Double;
  /////
  TempENPlanWork2ClassificationType : ENPlanWork2ClassificationTypeControllerSoapPort;
  plan2ctFilter : ENPlanWork2ClassificationTypeFilter;
  ENPlanWork2ClassificationTypeList : ENPlanWork2ClassificationTypeShortList;
  LastCount, LastRow: Integer;
  /////
  ENPlanWorkList : ENPlanWorkShortList;
  n: Integer;
  /////
  TempENAct: ENActControllerSoapPort;
  actFilter: ENActFilter;
  ENActList: ENActShortList;
  actDate: String;

  TempENEstimateItem : ENEstimateItemControllerSoapPort;
  estimateItemFilter : ENEstimateItemFilter;
  ENEstimateItemList : ENEstimateItemShortList;

  ENPayment2SOList: ENPayment2SOShortList;
  //Вкладення
  TempENDocAttachment : ENDocAttachmentControllerSoapPort;
  ENDocAttachmentList : ENDocAttachmentShortList;
  docAttachmentFilter : ENDocAttachmentFilter;

  TempENActIncomeTechConditions : ENActIncomeTechConditionsControllerSoapPort;
  ENActIncomeTechConditionsObj: ENActIncomeTechConditions;
begin

  if (pcCalculation.ActivePage = tsFACalc) then
  begin
    updateFACalculation;
  end;


  if (pcCalculation.ActivePage = tsSheets4SO) then
  begin
    updateSheets4SO;
  end;

    if (pcCalculation.ActivePage = tsPowerReserve) then
  begin
     updatePowerReserve;
     updatePowerReserveItems;
  end;

  if (pcCalculation.ActivePage = tsNode) then
  begin
     updateNodes;
     sgENSO2NodeClick(Sender);
  end;


  if (pcCalculation.ActivePage = tsGrantOfLand) then
  begin
    SetFloatStyle([edtCostWorksGL, edtCostWorksNDSGL, edtArea]);
    DisableControls([edtArea, cbbExecutorTax, edtObjectNameGL, edtBasisForActionGL, edtCostWorksGL, edtCostWorksNDSGL, edtActNumberGL, edtActDateGL, edtPartnerPosition, edtPartnerFIO, dtpContractTerm], False);
    DenyBlankValues([edtArea, cbbExecutorTax, edtObjectNameGL, edtBasisForActionGL, edtCostWorksGL, edtCostWorksNDSGL, edtActNumberGL, edtPartnerPosition, edtPartnerFIO]);

    updatePlanForServicesGridGL;
  end;

  if (pcCalculation.ActivePage = tsENTechAgreement) then
  begin
    SetFloatStyle(edtCostWorks);
    DisableControls([edtObjectName, edtBasisForAction, edtCostWorks, edtActNumber, edtActDate], False);
    DenyBlankValues([edtObjectName, edtBasisForAction, edtCostWorks, edtActNumber]);

    updatePlanForServicesGrid;
  end;

  if (pcCalculation.ActivePage = tsContractForProject) then
  begin
    DisableControls([edtBasisForActionProject], False);
    DenyBlankValues([edtBasisForActionProject]);

    updatePlanForServicesGridProject;
    updateENSOContract;
  end;

  if (ENServicesConnectionObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_CLOSED) then
      DisableActions([actInsertCalculation, actEditCalculation, actRecalcDisrance,
	    actInsertPlan, actDeletePlan, actEditPlan, actInsertPayment, actDeletePayment, actEditPayment])
  else DisableActions([actInsertCalculation, actEditCalculation, actRecalcDisrance,
	    actInsertPlan, actDeletePlan, actEditPlan, actInsertPayment, actDeletePayment, actEditPayment], False);

  if pcCalculation.ActivePage = tsGeneral then begin
   updateENRecordPoints;
  end;

  if pcCalculation.ActivePage = tsENSOValues then begin
     updateSOValues;
     updateRelatedAgrees;
  end;

  if pcCalculation.ActivePage = tsGrantOfLand then
   updateSOLeaseAgreement;


  if pcCalculation.ActivePage = tsListWork then
  begin
    ////////////////////////////////////////////////////////////////////////////
    ClearGrid(sgENPlanWork2ClassificationType);

    if planCode = LOW_INT then Exit;

    TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;

    ENPlanWork2ClassificationTypeList := Self.getCalculationList;

    LastCount := High(ENPlanWork2ClassificationTypeList.list);

    if LastCount > -1 then

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
        IntToStr(ENServicesConnectionObj.element.code) + ' and p.kindcode = ' + IntToStr(ENPLANWORKKIND_CALCULATION) + ')';
    end
    else begin
      if planItemFilter.planRef = nil then planItemFilter.planRef := ENPlanWorkRef.Create;
      planItemFilter.planRef.code := planCode; //DMReports.getPlanCodeByElement(ENServicesConnectionObj.element.code); // выбрать по коду элемента код плана  ENPlanWorkObj.code;
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

     ClearGrid(sgENPlanWork);

    if ENServicesConnectionObj = nil then Exit;
    if ENServicesConnectionObj.element = nil then Exit;
    if ENServicesConnectionObj.element.code = LOW_INT then Exit;



    ENPlanWorkList := Self.getPlansList;

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


  end; // if pcCalculation.ActivePage = tsListWork


  if pcCalculation.ActivePage = tsActs then
  begin

    actUpdateIncomeExecute(sender);
    actUpdateActHozExecute(sender);

    TempENActIncomeTechConditions := HTTPRIOENActIncomeTechConditions as ENActIncomeTechConditionsControllerSoapPort;
    try
      ENActIncomeTechConditionsObj := TempENActIncomeTechConditions.getObject(StrToInt(sgENActIncomeTechConditions.Cells[0,sgENActIncomeTechConditions.Row]));
    except
     on EConvertError do Exit;
    end;

    if (ENActIncomeTechConditionsObj <> nil) and (ENActIncomeTechConditionsObj.statusRef <> nil) then
       if (ENActIncomeTechConditionsObj.statusRef.code = ENACTINCOMESTATUS_CLOSED) then
         DisableActions([actInsertIncome, actEditIncome, actDeleteIncome])
       else DisableActions([actInsertIncome, actEditIncome, actDeleteIncome], False);


    if (ENTechConditionsServicesObj.techCondServicesStatus.code = ENTECHCONDITIONSSERVICES_STATUS_COMPLETED) then
    begin
      HideActions([actInsertIncome, actDeleteIncome, actEditIncome]);
      DisableActions([actInsertIncome, actDeleteIncome, actEditIncome]);
    end;


  end; // if pcCalculation.ActivePage = tsActs

  if pcCalculation.ActivePage = tsBills then begin
    updateBills;
    updatePayments;
  end;


  if pcCalculation.ActivePage = tsCounters then
  begin
    ClearGrid(sgENClassificationsWithCounters);

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
      ' from endcttchmnt2nsrvcsbjct da2so where da2so.servicesobjectrefcode = ' + IntToStr(ENServicesConnectionObj.code) + ')';
    docAttachmentFilter.orderBySQL := 'dateadd desc';
    //ENDocAttachmentList := TempENDocAttachment.getScrollableFilteredList(docAttachmentFilter,0,-1);
    ENDocAttachmentList := TempENDocAttachment.getScrollableFilteredListRestricted(ENServicesConnectionObj.code, docAttachmentFilter, 0, -1);

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
          Cells[3,i+1] := ENDocAttachmentList.list[i].typeRefName;
          Cells[4,i+1] := ENDocAttachmentList.list[i].userAdd;
          if ENDocAttachmentList.list[i].dateAdd = nil then
            Cells[5,i+1] := ''
          else
            Cells[5,i+1] := XSDateTimeWithDate2String(ENDocAttachmentList.list[i].dateAdd);
          Cells[6,i+1] := ENDocAttachmentList.list[i].userGen;
          if ENDocAttachmentList.list[i].dateEdit = nil then
            Cells[7,i+1] := ''
          else
            Cells[7,i+1] := XSDateTimeWithDate2String(ENDocAttachmentList.list[i].dateEdit);

          LastRow:=i+1;
          sgENDocAttachment.RowCount:=LastRow+1;
        end;
     sgENDocAttachment.Cells[0,0] := 'Код';
     sgENDocAttachment.Cells[1,0] := 'Коментар';
     sgENDocAttachment.Cells[2,0] := 'Посилання на файл';
     sgENDocAttachment.Cells[3,0] := 'Тип вкладення';
     sgENDocAttachment.Cells[4,0] := 'Користувач якій добавив';
     sgENDocAttachment.Cells[5,0] := 'Дата додавання';
     sgENDocAttachment.Cells[6,0] := 'Користувач якій редагува';
     sgENDocAttachment.Cells[7,0] := 'Дата редагування';
     ColCount:=ColCount+1;
     sgENDocAttachment.Row:=1;
  end;

end;


procedure TfrmENServicesConnectionEdit.FormCreate(Sender: TObject);
begin
  inherited;
  planCode := LOW_INT;
  priconnections := false;
  checkWarrant := true;
  isNotCalculated := True;
  isNotCalculatedSecondary := True;
  powerCategory := False;
  primarySubstationElCode := LOW_INT;
  departmentCode := LOW_INT;
  techConObjectsBuilding := '';
  techConObjectsAddress := '';
  connectionPowerPoint := '';
end;


procedure TfrmENServicesConnectionEdit.actPrintCalculationExecute( Sender: TObject);
var argNames, args: EnergyproController.ArrayOfString;
    reportName: String;
    Licensed : Integer;

   TempENPlanWork2ClassificationType: ENPlanWork2ClassificationTypeControllerSoapPort;
   //plan2ctFilter: ENPlanWork2ClassificationTypeFilter;
   //ENPlanWork2ClassificationTypeList: ENPlanWork2ClassificationTypeShortList;
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


  SetLength(argNames, 2);
  SetLength(args, 2);

  argNames[0] := 'plancode';
  argNames[1] := 'reportType';

  if (DialogState = dsInsert) then
     args[0] := IntToStr(planCode)
  else
    // 20.09.2013 +++ для присоединений не то пальто....  ;)
    // args[0] := IntToStr(DMReports.getPlanCodeForCalculationByElement(ENServicesConnectionObj.element.code));
  begin
    if (pw2ctObj = nil) then Exit;
    args[0] := IntToStr(pw2ctObj.planRef.code);
  end;

  args[1] := '4';


  if Licensed = ISNOTLICENSEDACTIVITY_NKRE  then  // лицензированые работы НКРЕ
     reportName := '201109/ActCalcAdditionalWorkG_NKRE/ActCalc'
  else if Licensed = ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT  then
     reportName := '201109/ActCalcAdditionalWorkG/ActCalc_notlicensed/ActCalc_notlicensed'
  else if ( (Licensed <> ISNOTLICENSEDACTIVITY_NKRE) and (Licensed <> ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT) ) then
     reportName := '201109/ActCalcAdditionalWorkG/ActCalc';

  makeReport(reportName , argNames , args , 'xls');
end;

procedure TfrmENServicesConnectionEdit.actPrintENSOBillExecute(Sender: TObject);
var argNames, args: EnergyproController.ArrayOfString;
    reportName, pathFileName: String;
    copystr: String;
    billCode : Integer;
begin
  if ENServicesConnectionObj = nil then Exit;
  if ENServicesConnectionObj.contractTypeRef = nil then Exit;
  if ENServicesConnectionObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesConnectionObj.calcTypeRef = nil then Exit;
  if ENServicesConnectionObj.calcTypeRef.code = LOW_INT then Exit;

  /////
  if ENServicesConnectionObj.contractStatusRef = nil then Exit;

  if ENServicesConnectionObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

  ///// 14.05.13 NET-4235
  if (ENServicesConnectionObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT) then
  begin
    // Печать расчета - только при статусах "Работы выполнены" и "Оплаченный"
    if (ENServicesConnectionObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_COMPLETED) and
       (ENServicesConnectionObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_PAID) then
      raise Exception.Create('NET-4235 Для друку остаточного рахунку договір повинен мати статус "Роботи виконані" або "Сплачений"!');
  end;
  /////

  if ENServicesConnectionObj.contractTypeRef.code <> ENSERVICESOBJECTTYPE_CONNECTION then
  begin
    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'soCode';
    args[0] := IntToStr(ENServicesConnectionObj.code);

    if (ENServicesConnectionObj.calcTypeRef.code <> ENSERVICESOBJECT_CALCTYPE_BY_FACT) then begin
    {06.07.2018 Для нового расчета будет печататься новая форма счета
      с учетом НДС для каждой калькуляции}
      if Self.isTKCalcKindNew then begin
        reportName := 'Services/Bill/rah_calc_new';
      end else begin
        reportName := 'Services/Bill/rah';
      end;
    end else begin
      reportName := 'Services/Bill/rahFinal';
    end;
    //SUPP-84438
    if Application.MessageBox(PChar('Додати у "Вкладення"?'),
        PChar('Внимание!'),MB_ICONQUESTION+ MB_YESNO) = IDYES then
    begin
         pathFileName := makeReport(reportName, argNames, args, 'pdf');
         ENDocAttachmentObj := ENDocAttachment.Create;
         ENDocAttachment2ENServices := ENDocAttachment2ENServicesObject.Create;
         try
            frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
            frmDFDocAttachmentEdit.soCode := ENServicesConnectionObj.code;
            frmDFDocAttachmentEdit.edtFileName.Text := pathFileName;
            frmDFDocAttachmentEdit.edtCommentGen.Text := '';
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
    end
    else
        makeReport(reportName, argNames, args, 'pdf');
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
    if (ENTechConditionsServicesObj.connectionKindRef.code <> ENCONNECTIONKIND_STANDART) and
       (ENTechConditionsServicesObj.connectionKindRef.code <> ENCONNECTIONKIND_NO_STANDART_READY_MADE) then
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

              //SUPP-84438
              if Application.MessageBox(PChar('Додати у "Вкладення"?'),
                  PChar('Внимание!'),MB_ICONQUESTION+ MB_YESNO) = IDYES then
              begin
                   pathFileName := makeReport(reportName, argNames, args, 'pdf');
                   ENDocAttachmentObj := ENDocAttachment.Create;
                   ENDocAttachment2ENServices := ENDocAttachment2ENServicesObject.Create;
                   try
                      frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
                      frmDFDocAttachmentEdit.soCode := ENServicesConnectionObj.code;
                      frmDFDocAttachmentEdit.edtFileName.Text := pathFileName;
                      frmDFDocAttachmentEdit.edtCommentGen.Text := '';
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
              end
              else
                  makeReport(reportName, argNames, args, 'pdf');
        end;
      finally
       frmEntechConditionsServicesEditSumBill.Free;
      end;
    end else
    begin
      SetLength(argNames, 1);
      SetLength(args, 1);

      argNames[0] := 'billCode';

    try
      billCode := StrToInt(sgENSOBill.Cells[0,sgENSOBill.Row]);
    except
      on EConvertError do Exit;
    end;

    args[0] := IntToStr(billCode);

      reportName := 'TechConditions/billByStandartConnections';
      //SUPP-84438
      if Application.MessageBox(PChar('Додати у "Вкладення"?'),
          PChar('Внимание!'),MB_ICONQUESTION+ MB_YESNO) = IDYES then
      begin
           pathFileName := makeReport(reportName, argNames, args, 'pdf');
           ENDocAttachmentObj := ENDocAttachment.Create;
           ENDocAttachment2ENServices := ENDocAttachment2ENServicesObject.Create;
           try
              frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
              frmDFDocAttachmentEdit.soCode := ENServicesConnectionObj.code;
              frmDFDocAttachmentEdit.edtFileName.Text := pathFileName;
              frmDFDocAttachmentEdit.edtCommentGen.Text := '';
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
      end
      else
          makeReport(reportName, argNames, args, 'pdf');
    end;
  end;
end;

procedure TfrmENServicesConnectionEdit.SetFormCaption(elementCode: Integer);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
    //servicesObj: ENServicesObject;
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


procedure TfrmENServicesConnectionEdit.btnPrintActTechAgreementClick(Sender: TObject);
var
  argNames, args : EnergyproController.ArrayOfString;
  reportName : String;
begin
  inherited;
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'servicesObjectCode';
  args[0] := IntToStr(ENServicesConnectionObj.code);

  reportName := 'TechConditions/TechAgreement/act';
  makeReport(reportName, argNames, args, 'pdf');
end;


procedure TfrmENServicesConnectionEdit.btnPrintActTechAgreementGLClick(
  Sender: TObject);
var
  argNames, args : EnergyproController.ArrayOfString;
  reportName : String;
begin
  inherited;
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'servicesObjectCode';
  args[0] := IntToStr(ENServicesConnectionObj.code);

  reportName := 'TechConditions/GrantOfLand/act';
  makeReport(reportName, argNames, args, 'pdf');
end;


procedure TfrmENServicesConnectionEdit.btnPrintAgreementProjectClick(Sender: TObject);
var
  argNames, args : EnergyproController.ArrayOfString;
  reportName : String;
  TempENServicesObject: ENServicesObjectControllerSoapPort;
begin
  inherited;

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'servicesObjectCode';
  args[0] := IntToStr(ENServicesConnectionObj.code);

  reportName := 'TechConditions/TechAgreement/agreeProject';
  makeReport(reportName, argNames, args, 'pdf');
end;


procedure TfrmENServicesConnectionEdit.btnPrintBillClick(Sender: TObject);
var
    menuPoint: TPoint;
begin
{
    menuPoint := gbPrint.ClientToScreen(Point(btnPrintBill.Left,
                btnPrintBill.Top + btnPrintBill.Height));
    pmPrintBill.Popup(menuPoint.X, menuPoint.Y);
}
end;


procedure TfrmENServicesConnectionEdit.actBudgetApprovedExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := ENServicesConnectionObj.code;
  except
    on EConvertError do Exit;
  end;

  if (ENServicesConnectionObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
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


procedure TfrmENServicesConnectionEdit.actUpdateObject(Sender: TObject);
Var TempServicesObject: ENServicesObjectControllerSoapPort;
    //ObjCode: Integer;
begin
  if pcCalculation.ActivePage = tsListWork then
  begin
    TempServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
    ENServicesConnectionObj := TempServicesObject.getObject(ENServicesConnectionObj.code);
    actUpdateExecute(Sender);
  end;
end;

procedure TfrmENServicesConnectionEdit.actUpdatePowerReserveItemExecute(
  Sender: TObject);
begin
  inherited;
   updatePowerReserveItems;
end;

procedure TfrmENServicesConnectionEdit.spbWarrantNumberClick(
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
     f.departmentRef.code := ENServicesConnectionObj.department.code;
     f.conditionSQL := ' warrantstatusrefcode = 0';

     frmENWarrantShow := TfrmENWarrantShow.Create(Application,fmNormal, f);
     DisableActions([frmENWarrantShow.actNoFilter]);

     try
        with frmENWarrantShow do
          if ShowModal = mrOk then
          begin
              try

                 ENServicesConnectionObj.warrantRef := ENWarrantRef.Create();
                 ENServicesConnectionObj.warrantRef.code := StrToInt(GetReturnValue(sgENWarrant,0));

                  //////////////////////////////////////////////////////
                  ///   проверка даты доверенности с датой договора  ///
                  ///     суммы в доверенности с суммой договора     ///
                  //////////////////////////////////////////////////////

                  if  ENServicesConnectionObj.warrantRef.code <> LOW_INT then
                  begin
                    warrant := DMReports.getWarrantByCode(ENServicesConnectionObj.warrantRef.code);

                    datContract.XSToNative(GetXSDate(Self.edtContractDateServices.DateTime));
                    dtdatContract := EncodeDate(datContract.Year, datContract.Month, datContract.Day);
                    dtdatWarrant := EncodeDate(warrant.dateFinal.Year, warrant.dateFinal.Month, warrant.dateFinal.Day);

                    if (warrant.warrantStatusRef.code = WARRANT_INVALID) then
                    begin
                      Application.MessageBox(PChar('Довіреність недійсна!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                        edtWarrantNumber.Text := '';
                        edtWarrantFIO.Text := '';
                        ENServicesConnectionObj.warrantRef.code := LOW_INT;
                      Exit;
                    end;

                    if (dtdatContract > dtdatWarrant) then
                    begin
                      Application.MessageBox(PChar('Термін дії довіреності закінчився!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                        edtWarrantNumber.Text := '';
                        edtWarrantFIO.Text := '';
                        ENServicesConnectionObj.warrantRef.code := LOW_INT;
                      Exit;
                    end;

                    if (StrToFloat(ENServicesConnectionObj.contractServicesSumma.DecimalString) > StrToFloat(warrant.maxSum.DecimalString)) then
                    begin
                      Application.MessageBox(PChar('Сума у договорі перевищує гранічну суму у довіреності!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                        edtWarrantNumber.Text := '';
                        edtWarrantFIO.Text := '';
                        ENServicesConnectionObj.warrantRef.code := LOW_INT;
                      Exit;
                    end;

                    if (edtContractServicesPower.Text <> '') then
                    begin
                      if (StrToFloat(edtContractServicesPower.Text) > warrant.power) then
                      begin
                        Application.MessageBox(PChar('Потужність у договорі перевищує потужність у довіреності!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                          edtWarrantNumber.Text := '';
                          edtWarrantFIO.Text := '';
                          ENServicesConnectionObj.warrantRef.code := LOW_INT;
                        Exit;
                      end;
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
      if ENServicesConnectionObj.department = nil then
      begin
        Application.MessageBox(PChar('Спочатку оберіть підрозділ!'), PChar('Увага !'), MB_ICONWARNING);
        edtENDepartmentDepartmentName.SetFocus;
        Exit;
      end;

      if ENServicesConnectionObj.department.code = LOW_INT then
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
       f.departmentRef.code := ENServicesConnectionObj.department.code;

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
          (ENServicesConnectionObj.department.code = ENDEPARTMENT_HGES) then
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

                 ENServicesConnectionObj.warrantRef := ENWarrantRef.Create();
                 ENServicesConnectionObj.warrantRef.code := StrToInt(GetReturnValue(sgENWarrant,0));

                  //////////////////////////////////////////////////////
                  ///   проверка даты доверенности с датой договора  ///
                  ///     суммы в доверенности с суммой договора     ///
                  //////////////////////////////////////////////////////

                  if ENServicesConnectionObj.warrantRef.code <> LOW_INT then
                  begin
                    warrant := DMReports.getWarrantByCode(ENServicesConnectionObj.warrantRef.code);

                    datContract.XSToNative(GetXSDate(Self.edtContractDateServices.DateTime));
                    dtdatContract := EncodeDate(datContract.Year, datContract.Month, datContract.Day);
                    dtdatWarrant := EncodeDate(warrant.dateFinal.Year, warrant.dateFinal.Month, warrant.dateFinal.Day);

                    if (warrant.warrantStatusRef.code = WARRANT_INVALID) then
                    begin
                      Application.MessageBox(PChar('Довіреність недійсна!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                        edtWarrantNumber.Text := '';
                        edtWarrantFIO.Text := '';
                        ENServicesConnectionObj.warrantRef.code := LOW_INT;
                      Exit;
                    end;

                    if (dtdatContract > dtdatWarrant) then
                    begin
                      Application.MessageBox(PChar('Термін дії довіреності закінчився!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                        edtWarrantNumber.Text := '';
                        edtWarrantFIO.Text := '';
                        ENServicesConnectionObj.warrantRef.code := LOW_INT;
                      Exit;
                    end;



                    if (edtTyServicesPower.Text <> '') then
                    begin
                      if (StrToFloat(edtTyServicesPower.Text) > warrant.power) then
                      begin
                        Application.MessageBox(PChar('Потужність у договорі перевищує потужність у довіреності!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                          edtWarrantNumber.Text := '';
                          edtWarrantFIO.Text := '';
                          ENServicesConnectionObj.warrantRef.code := LOW_INT;
                        Exit;
                      end;
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

  end; // if not priconnections .. else
end;


procedure TfrmENServicesConnectionEdit.SpeedButton1Click(Sender: TObject);
var
   frmENConnectionCityTypeShow: TfrmENConnectionCityTypeShow;
begin
   frmENConnectionCityTypeShow:=TfrmENConnectionCityTypeShow.Create(Application,fmNormal);
   try
      with frmENConnectionCityTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSOTechParamsObject = nil then ENSOTechParamsObject := ENSOTechParams.Create;
               if ENSOTechParamsObject.cityTypeRef = nil then
               ENSOTechParamsObject.cityTypeRef := ENConnectionCityTypeRef.Create();
               ENSOTechParamsObject.cityTypeRef.code := StrToInt(GetReturnValue(sgENConnectionCityType,0));
               edtCityTypeName.Text:=GetReturnValue(sgENConnectionCityType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENConnectionCityTypeShow.Free;
   end;
end;

procedure TfrmENServicesConnectionEdit.SpeedButton2Click(Sender: TObject);
begin
  inherited;
   ENSOTechParamsObject.cityTypeRef := nil;
   edtCityTypeName.Text := '';
end;

procedure TfrmENServicesConnectionEdit.spbLocationTypeClearClick(Sender: TObject);
begin
  inherited;
   ENSOTechParamsObject.locationTypeRef := nil;
   edtLocationType.Text := '';
end;

procedure TfrmENServicesConnectionEdit.spbPhasityClearClick(Sender: TObject);
begin
  inherited;
   ENSOTechParamsObject.phasityRef := nil;
   edtENConnectionPhasityPhasityRefName.Text := '';
end;

procedure TfrmENServicesConnectionEdit.spbConnectionPowerPointClearClick(Sender: TObject);
begin
  inherited;
   ENSOTechParamsObject.powerPointRef := nil;
   edtENConnectionPowerPointPowerPointRefName.Text := '';
end;

procedure TfrmENServicesConnectionEdit.TBItem19Click(Sender: TObject);
begin
  inherited;
  updatePlanForServicesGrid;
end;


procedure TfrmENServicesConnectionEdit.TBItem24Click(Sender: TObject);
begin
  inherited;
  updatePlanForServicesGridGL;
end;


procedure TfrmENServicesConnectionEdit.TBItem29Click(Sender: TObject);
begin
  inherited;
  updatePlanForServicesGridProject;
end;


procedure TfrmENServicesConnectionEdit.TBItem9Click(Sender: TObject);
Var TempENTechConditionsObjects: ENTechConditionsObjectsControllerSoapPort;
 Var TempENContragent: ENContragentControllerSoapPort;
begin

   TempENContragent := HTTPRIOENContragent as ENContragentControllerSoapPort;
   try
     ENContragentObj := TempENContragent.getObject(StrToInt(sgENContragent.Cells[0,sgENContragent.Row]));
   except
   on EConvertError do Exit;
  end;

 TempENTechConditionsObjects := HTTPRIOENTechConditionsObjects as ENTechConditionsObjectsControllerSoapPort;
   try
     ENTechConditionsObjectsObj := TempENTechConditionsObjects.getObject(ENContragentObj.techConObjects.code);
   except
   on EConvertError do Exit;
  end;
  frmENTechConditionsObjectsEdit:=TfrmENTechConditionsObjectsEdit.Create(Application, dsEdit);
  frmENTechConditionsObjectsEdit.techConditionsCode := ENTechConditionsServicesObj.code;
  frmENTechConditionsObjectsEdit.servicesObjectCode := ENServicesConnectionObj.code;
  try
    if frmENTechConditionsObjectsEdit.ShowModal= mrOk then
      begin
        actUpdateContragentExecute(Sender);
        if ENTechConditionsObjectsObj.securityZone = ENTECHCONDITIONSOBJECT_SECURITYZONE_YES then
             lblWarningSecurityZone.Visible := true
        else
             lblWarningSecurityZone.Visible := false;
      end;
  finally
    frmENTechConditionsObjectsEdit.Free;
    frmENTechConditionsObjectsEdit:=nil;
  end;
end;

procedure TfrmENServicesConnectionEdit.ToolButton17Click(Sender: TObject);
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

  planFilter.conditionSQL := ' elementrefcode in (select enelement.code from enelement where enelement.typerefcode in (7,8))';



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
           TempENPlanWork.addPlan2TechConditions(plan,ENTechConditionsServicesObj.code);
        end;

        actUpdateExecute(Sender);
      end;
    finally
      frmENPlanWorkShow.Free;
      frmENPlanWorkShow:=nil;
    end;



end;

procedure TfrmENServicesConnectionEdit.actViewENActExecute(Sender: TObject);
var
  TempENAct: ENActControllerSoapPort;
begin
  if (pcActs.ActivePage = tsActsHoz) then
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
end;


procedure TfrmENServicesConnectionEdit.actViewENActIncomeExecute(
  Sender: TObject);
var
  argNames, args: EnergyproController.ArrayOfString;
  reportName: String;
begin
  ///// 14.05.13 NET-4235
  // Печать акта приема-передачи - только при статусах "Работы выполнены" и "Оплаченный" (для НОВЫХ договоров)
  if ENServicesConnectionObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT then
    if (ENServicesConnectionObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_COMPLETED) and
       (ENServicesConnectionObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_PAID) then
      raise Exception.Create('NET-4235 Для друку акту прийому-передачі договір повинен мати статус "Роботи виконані" або "Сплачений"!');
  /////

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'ContractCode';
  args[0] := IntToStr(ENServicesConnectionObj.code);

  if ENServicesConnectionObj.calcTypeRef.code <> ENSERVICESOBJECT_CALCTYPE_BY_FACT then
    reportName := '201109/ActCalcAdditionalWorkG/ActPriPer'
  else
    reportName := '201109/ActCalcAdditionalWorkG/ActPriPer2';

  makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmENServicesConnectionEdit.actViewENSOContactFinColExecute(
  Sender: TObject);
Var TempFINContracts: FINContractsControllerSoapPort;
begin
  frmFINServicesObjectEdit := TfrmFINServicesObjectEdit.Create(Application, dsView);
  try
    TempFINContracts := HTTPRIOFINContracts as FINContractsControllerSoapPort;
    try
      frmFINServicesObjectEdit.FINContractsObj := TempFINContracts.getObjectFromFK(StrToInt(sgENSOContract.Cells[5,sgENSOContract.Row]));
    except
      on EConvertError do Exit;
    end;

    frmFINServicesObjectEdit.ShowModal;
  finally
    frmFINServicesObjectEdit.Free;
    frmFINServicesObjectEdit := nil;
  end;
end;

procedure TfrmENServicesConnectionEdit.actViewENSOBillExecute(Sender: TObject);
Var TempENSOBill: ENSOBillControllerSoapPort;
begin
 TempENSOBill := HTTPRIOENSOBill as ENSOBillControllerSoapPort;
   try
     ENSOBillObj := TempENSOBill.getObject(StrToInt(sgENSOBill.Cells[0,sgENSOBill.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSOBillEdit:=TfrmENSOBillEdit.Create(Application, dsView);
  try
    if frmENSOBillEdit.ShowModal= mrOk then
      begin
        Self.actUpdateENSOBillExecute(Sender);
      end;
  finally
    frmENSOBillEdit.Free;
    frmENSOBillEdit:=nil;
  end;
end;

procedure TfrmENServicesConnectionEdit.edtContractServicesPowerChange(
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


procedure TfrmENServicesConnectionEdit.actPrintKoshtorisExecute(
 Sender: TObject);
var argNames, args: EnergyproController.ArrayOfString;
   reportName: String;
   Licensed : Integer;

   TempENPlanWork2ClassificationType: ENPlanWork2ClassificationTypeControllerSoapPort;
   //plan2ctFilter: ENPlanWork2ClassificationTypeFilter;
   //ENPlanWork2ClassificationTypeList: ENPlanWork2ClassificationTypeShortList;
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

 SetLength(argNames, 2);
 SetLength(args, 2);

 argNames[0] := 'plancode';
 argNames[1] := 'reportType';

 if (DialogState = dsInsert) then
    args[0] := IntToStr(planCode)
 else
    // 20.09.2013 +++ для присоединений не то пальто....  ;)
    // args[0] := IntToStr(DMReports.getPlanCodeForCalculationByElement(ENServicesConnectionObj.element.code));
  begin
    if (pw2ctObj = nil) then Exit;
    args[0] := IntToStr(pw2ctObj.planRef.code);
  end;
  args[1] := '4';


  if Licensed = ISNOTLICENSEDACTIVITY_NKRE  then  // лицензированые работы НКРЕ
     reportName := '201109/ActCalcAdditionalWorkG_NKRE/ActCalcOnlyRemainingcost'
  else if Licensed = ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT  then
     reportName := '201109/ActCalcAdditionalWorkG/ActCalc_notlicensed/ActCalc_trt_ntlcd_f6'
  else if ( (Licensed <> ISNOTLICENSEDACTIVITY_NKRE) and (Licensed <> ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT) ) then
     reportName := '201109/ActCalcAdditionalWorkG/ActCalcOnlyRemainingcost';
  
  makeReport(reportName , argNames , args , 'xls');
end;


procedure TfrmENServicesConnectionEdit.actPrintSheet4SOExecute(Sender: TObject);
var
  ObjCode, attachmentCode: Integer;
begin
  try
    ObjCode := StrToInt(sgENSheets4SO.Cells[0, sgENSheets4SO.Row]);
  except
    on EConvertError do Exit;
  end;

  attachmentCode := Integer(sgENSheets4SO.Objects[ENATTACHMENT_CODE_INDEX, sgENSheets4SO.Row]);
  if attachmentCode <= 0 then Exit;
  DMReports.openENAttachment(attachmentCode, true);
end;

procedure TfrmENServicesConnectionEdit.actPreConfirmExecute(Sender: TObject);
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


procedure TfrmENServicesConnectionEdit.actPrintCalcNkreExecute(
  Sender: TObject);
var argNames, args: EnergyproController.ArrayOfString;
    reportName: String;
    ENPlanWork2ClassificationTypeCode : Integer;
    TempENPlanWork2ClassificationType: ENPlanWork2ClassificationTypeControllerSoapPort;
    pw2ctObj: ENPlanWork2ClassificationType;
    TempTKClassificationType: TKClassificationTypeControllerSoapPort;
    TKClassificationTypef: TKClassificationTypeFilter;
    TKClassificationTypeList: TKClassificationTypeShortList;
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
      args[0] := IntToStr(DMReports.getPlanCodeForCalculationByElement(ENServicesConnectionObj.element.code));

   argNames[1] := 'licenzed';
   args[1] := IntToStr(Licensed);

   reportName := 'Calculation/ActCalc_Form1_NKRE';
   makeReport(reportName , argNames , args , 'pdf');

   reportName := 'Calculation/ActCalc_Form4_NKRE';
   makeReport(reportName , argNames , args , 'pdf');
end;


procedure TfrmENServicesConnectionEdit.cbbBasisTypeChange(Sender: TObject);
begin
  if cbbBasisType.ItemIndex <> 3 then
  begin
    DisableControls([edtWarrantContrAgentFIO , edtWarrantContrAgentNumber , edtWarrantContrAgentDate]);
    edtWarrantContrAgentNumber.Text := '';
    edtWarrantContrAgentFIO.Text:= '';
    edtWarrantContrAgentDate.Checked:= False;
    spbCustomerWarrant.Visible := True;
  end else
  begin
    DisableControls([edtWarrantContrAgentFIO , edtWarrantContrAgentNumber , edtWarrantContrAgentDate], False);
    spbCustomerWarrant.Visible := True;
  end;
end;


procedure TfrmENServicesConnectionEdit.btnPostingsClick(Sender: TObject);
begin
  frmPostingsEdit := TfrmPostingsEdit.Create(Application, dsInsert);
  try
    frmPostingsEdit.servicesObjectCode := ENServicesConnectionObj.code;
    frmPostingsEdit.priconnection := True;
    if ENServicesConnectionObj.isNoPay = ENConsts.ENSERVICESOBJECT_ISNOPAY then
    begin
      HideControls([frmPostingsEdit.lblGridDescription, frmPostingsEdit.sgProvs,
                    frmPostingsEdit.sgProvErrorsDetailed, frmPostingsEdit.btnGetPostingsList]);
    end;
    frmPostingsEdit.ShowModal;
  finally
    frmPostingsEdit.Free;
  end;

  pcCalculationChange(Sender);
end;

procedure TfrmENServicesConnectionEdit.spbPowerReliabilityClearClick(
  Sender: TObject);
begin
  inherited;
   ENSOTechParamsObject.categoryRef := nil;
   edtENPowerReliabilityCategoryCategoryRefName.Text := '';
end;

procedure TfrmENServicesConnectionEdit.sgDepartmentClick(Sender: TObject);
//var i : integer;
    //strCodeActiveDepartment : string;
    //state : Boolean;

    //TempTKVirtualBrigade: TKVirtualBrigadeControllerSoapPort;
    //TempTKVirtualBrigadeFilter: TKVirtualBrigadeFilter;
    //vi: Integer;
    //TKVirtualBrigadeList: TKVirtualBrigadeShortList;
    //LastCount : Integer;
    //LastRow : Integer;

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
       TKVirtualBrigadeList := TempTKVirtualBrigade.getScrollableFilteredListForServices(TempTKVirtualBrigadeFilter,0,-1 , DateToStr(edtReservedDate.DateTime) , ENServicesConnectionObj.code ,strCodeActiveDepartment );


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

procedure TfrmENServicesConnectionEdit.btnNodeNameToClipboardClick(
  Sender: TObject);
begin
  inherited;
    if MainTree.Selected=nil then exit;
  Clipboard.SetTextBuf(PChar(CCNodeExtShort(MainTree.Selected.Data).name));
end;

procedure TfrmENServicesConnectionEdit.edtReservedTimeStartChange(
  Sender: TObject);
begin

end;
// сумма времени из техкарт котрые выбраны в калькуляции   
function TfrmENServicesConnectionEdit.getSumTimeWorkForCalculation(codePlan : Integer):Double;
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


function TfrmENServicesConnectionEdit.getWFPack: WFPack;
var
  TempWFPack2Services: WFPack2ServicesObjectControllerSoapPort;
  wfPack2ServicesFilter: WFPack2ServicesObjectFilter;
  wfPack2ServicesList : WFPack2ServicesObjectShortList;
  TempWFPack: WFPackControllerSoapPort;
begin
  Result := nil;

  if DialogState = dsInsert then Exit;
  if ENServicesConnectionObj = nil then Exit;
  if ENServicesConnectionObj.code = LOW_INT then Exit;

  wfPack2ServicesFilter :=  WFPack2ServicesObjectFilter.Create;
  SetNullIntProps(wfPack2ServicesFilter);
  SetNullXSProps(wfPack2ServicesFilter);
  wfPack2ServicesFilter.soCode := ENServicesConnectionObj.code;

  TempWFPack2Services :=  HTTPRIOWFPack2ServicesObject as WFPack2ServicesObjectControllerSoapPort;
  wfPack2ServicesList := TempWFPack2Services.getScrollableFilteredList(wfPack2ServicesFilter, 0, -1);

  if High(wfPack2ServicesList.list) < 0 then Exit;

  if High(wfPack2ServicesList.list) > 0 then
    raise Exception.Create('В привязке Объектов договоров на Присоединение с пакетами из WorkFlow найдено больше одной связи!');

  TempWFPack := HTTPRIOWFPack as WFPackControllerSoapPort;
  Result := TempWFPack.getObject(wfPack2ServicesList.list[0].packCode);
end;

procedure TfrmENServicesConnectionEdit.btnSaveAgreementProjectClick(Sender: TObject);
var
  TempENTechAgreement2ServicesObject: ENTechAgreement2ServicesObjectControllerSoapPort;
begin
  inherited;
  if not NoBlankValues([edtOrgNameProject]) then
  begin
    Application.MessageBox(PChar('Не обрано виконавця послуги!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
    Exit;
  end
  else
  {
  if not NoBlankValues([edtCostWorks]) then
  begin
    Application.MessageBox(PChar('Відсутня вартість робіт(послуг)!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
    Exit;
  end
  else
  }
  begin
    TempENTechAgreement2ServicesObject := HTTPRIOENTechAgreement2ServicesObject as ENTechAgreement2ServicesObjectControllerSoapPort;

    ENTechAgreement2ServicesProject.techAgrKindRef := ENTechAgr2SOKindRef.Create;
    ENTechAgreement2ServicesProject.techAgrKindRef.code := ENTECHAGRKIND_PKD;

    ENTechAgreement2ServicesProject.basisForAction := edtBasisForActionProject.Text;

    if (ENTechAgreement2ServicesProject.costWorks = nil) then
      ENTechAgreement2ServicesProject.costWorks := TXSDecimal.Create;
    if edtCostWorksProject.Text <> '' then
      ENTechAgreement2ServicesProject.costWorks.decimalString := edtCostWorksProject.Text
    else
      ENTechAgreement2ServicesProject.costWorks := nil;


    if (ENTechAgreement2ServicesProject.code = low(Integer)) then
      TempENTechAgreement2ServicesObject.add(ENTechAgreement2ServicesProject)
    else
      TempENTechAgreement2ServicesObject.save(ENTechAgreement2ServicesProject);


    LoadENTechAgreement2ServicesProject;
    updatePlanForServicesGridProject;
  end;
end;


procedure TfrmENServicesConnectionEdit.btnSaveTechAgreementClick(Sender: TObject);
var
  TempENTechAgreement2ServicesObject : ENTechAgreement2ServicesObjectControllerSoapPort;
begin
  inherited;
  if not NoBlankValues([edtRQOrgOrgName]) then
  begin
    Application.MessageBox(PChar('Не обрано виконавця послуги!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
    Exit;
  end
  else
  if not NoBlankValues([edtCostWorks]) then
  begin
    Application.MessageBox(PChar('Відсутня вартість робіт(послуг)!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
    Exit;
  end
  else
  begin
    TempENTechAgreement2ServicesObject := HTTPRIOENTechAgreement2ServicesObject as ENTechAgreement2ServicesObjectControllerSoapPort;

    ENTechAgreement2Services.techAgrKindRef := ENTechAgr2SOKindRef.Create;
    ENTechAgreement2Services.techAgrKindRef.code := ENTECHAGRKIND_TA;

    ENTechAgreement2Services.objectName := edtObjectName.Text;
    ENTechAgreement2Services.basisForAction := edtBasisForAction.Text;

    if (ENTechAgreement2Services.costWorks = nil) then
      ENTechAgreement2Services.costWorks := TXSDecimal.Create;
    if edtCostWorks.Text <> '' then
      ENTechAgreement2Services.costWorks.decimalString := edtCostWorks.Text
    else
      ENTechAgreement2Services.costWorks := nil;

    if (edtActNumber.Text <> '') then
      ENTechAgreement2Services.actNumber := edtActNumber.Text;

    if (edtactDate.Checked) then
    begin
      if ENTechAgreement2Services.actDate = nil then
        ENTechAgreement2Services.actDate := TXSDate.Create;
      ENTechAgreement2Services.actDate.XSToNative(GetXSDate(edtactDate.DateTime));
    end
    else
      ENTechAgreement2Services.actDate := nil;

    if (ENTechAgreement2Services.code = low(Integer)) then
      TempENTechAgreement2ServicesObject.add(ENTechAgreement2Services)
    else
      TempENTechAgreement2ServicesObject.save(ENTechAgreement2Services);

    LoadENTechAgreement2Services;
  end;
end;


procedure TfrmENServicesConnectionEdit.btnSaveTechAgreementGLClick(
  Sender: TObject);
var
  TempENTechAgreement2ServicesObject : ENTechAgreement2ServicesObjectControllerSoapPort;
begin
  inherited;
  if not NoBlankValues([edtRQOrgOrgNameGL]) then
  begin
    Application.MessageBox(PChar('Не обрано виконавця послуги!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
    Exit;
  end
  else
  if not NoBlankValues([edtCostWorksGL, edtCostWorksNDSGL]) then
  begin
    Application.MessageBox(PChar('Відсутня вартість робіт(послуг)!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
    Exit;
  end
  else
  begin
    TempENTechAgreement2ServicesObject := HTTPRIOENTechAgreement2ServicesObject as ENTechAgreement2ServicesObjectControllerSoapPort;

    ENTechAgreement2ServicesGL.techAgrKindRef := ENTechAgr2SOKindRef.Create;
    ENTechAgreement2ServicesGL.techAgrKindRef.code := ENTECHAGRKIND_GL;

    ENTechAgreement2ServicesGL.objectName := edtObjectNameGL.Text;
    ENTechAgreement2ServicesGL.basisForAction := edtBasisForActionGL.Text;

    ENTechAgreement2ServicesGL.executorTaxType := cbbExecutorTax.Text;
    ENTechAgreement2ServicesGL.partnerPosition := edtPartnerPosition.Text;
    ENTechAgreement2ServicesGL.partnerFIO := edtPartnerFIO.Text;

    if (ENTechAgreement2ServicesGL.area = nil) then
      ENTechAgreement2ServicesGL.area := TXSDecimal.Create;
    if edtArea.Text <> '' then
      ENTechAgreement2ServicesGL.area.decimalString := edtArea.Text
    else
      ENTechAgreement2ServicesGL.area := nil;

    if (ENTechAgreement2ServicesGL.costWorks = nil) then
      ENTechAgreement2ServicesGL.costWorks := TXSDecimal.Create;
    if edtCostWorksGL.Text <> '' then
      ENTechAgreement2ServicesGL.costWorks.decimalString := edtCostWorksGL.Text
    else
      ENTechAgreement2ServicesGL.costWorks := nil;

    if (ENTechAgreement2ServicesGL.costWorksNDS = nil) then
      ENTechAgreement2ServicesGL.costWorksNDS := TXSDecimal.Create;
    if edtCostWorksGL.Text <> '' then
      ENTechAgreement2ServicesGL.costWorksNDS.decimalString := edtCostWorksNDSGL.Text
    else
      ENTechAgreement2ServicesGL.costWorksNDS := nil;

    if (edtActNumberGL.Text <> '') then
      ENTechAgreement2ServicesGL.actNumber := edtActNumberGL.Text;

    if (edtActDateGL.Checked) then
    begin
      if ENTechAgreement2ServicesGL.actDate = nil then
        ENTechAgreement2ServicesGL.actDate := TXSDate.Create;
      ENTechAgreement2ServicesGL.actDate.XSToNative(GetXSDate(edtActDateGL.DateTime));
    end
    else
      ENTechAgreement2ServicesGL.actDate := nil;

    if (dtpContractTerm.Checked) then
    begin
      if ENTechAgreement2ServicesGL.contractTerm = nil then
        ENTechAgreement2ServicesGL.contractTerm := TXSDate.Create;
      ENTechAgreement2ServicesGL.contractTerm.XSToNative(GetXSDate(dtpContractTerm.DateTime));
    end
    else
      ENTechAgreement2ServicesGL.contractTerm := nil;

    if (ENTechAgreement2ServicesGL.code = low(Integer)) then
      TempENTechAgreement2ServicesObject.add(ENTechAgreement2ServicesGL)
    else
      TempENTechAgreement2ServicesObject.save(ENTechAgreement2ServicesGL);

    LoadENTechAgreement2ServicesGL;
  end;
end;

procedure TfrmENServicesConnectionEdit.btnSearchInTreeClick(Sender: TObject);
var
  frmCCNodeFilterEdit: TfrmCCNodeFilterEdit;
  frmCCNodeShow: TfrmCCNodeShow;
  i: Integer;
  NodeObj: CCNode;
  TempCCNode: CCNodeControllerSoapPort;
begin
    frmCCNodeFilterEdit := TfrmCCNodeFilterEdit.Create(Application, dsInsert);

    try
      if frmCCNodeFilterEdit.ShowModal <> mrOk then exit
    finally
      frmCCNodeFilterEdit.Free;
      frmCCNodeFilterEdit := nil;
    end;

   frmCCNodeShow:=TfrmCCNodeShow.Create(Application,fmNormal,CCNodeFilterObj);
   TempCCNode:=HTTPRIOCCNode as CCNodeControllerSoapPort;
   try
      with frmCCNodeShow do
      begin
           i:= ShowModal;

           if i = mrOk then
           begin
             try
               NodeObj:=TempCCNode.getObject(StrToInt(GetReturnValue(sgCCNode,0)));
             except
               on EConvertError do Exit;
             end;
           end
             else Exit;
      end;
    finally
      frmCCNodeShow.Free;
   end;

   if NodeObj=nil then Exit;

   ShowNodeInTree(NodeObj.code);
   MainTreeClick(Sender);
end;


procedure TfrmENServicesConnectionEdit.btnSetBuhStatusClick(Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
begin
  inherited;
    if Application.MessageBox(PChar('Ви дійсно бажаєте змінити статус на проведений?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=IDYES then begin
        TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
        TempENServicesObject.changeBuhStatusToClosedByBuh(ENServicesConnectionObj.code);
        ENServicesConnectionObj :=  TempENServicesObject.getObject(ENServicesConnectionObj.code);
        Application.MessageBox(PChar('Статус на проведений змінено!'), PChar('Повідомлення'), MB_ICONINFORMATION);
        DialogState := dsView;
        Self.FormShow(Sender);
    end;
end;

procedure TfrmENServicesConnectionEdit.btnShowSO2NodesChildClick(
  Sender: TObject);
begin
  inherited;
  updateSO2NodeByChildNodes;
end;

procedure TfrmENServicesConnectionEdit.updateSO2NodeByChildNodes;
var
  TempENSO2Node: ENSO2NodeControllerSoapPort;
  TempCCNodeExt: CCNodeExtControllerSoapPort;
  i: Integer;
  ENSO2NodeList: ENSO2NodeShortList;
  so2nodeFilter : ENSO2NodeFilter;
  intCodesList: CCNodeExtController.ArrayOfInteger;
  strCodesList: String;
begin

  if MainTree.Selected = nil then
  begin
     ShowMessage('Виберіть точку приєднання з дерева об''єктів CallCentre');
     exit;
  end;

  ClearGrid(sgENSO2NodeOthers);
  SetGridHeaders(ENSO2NodeHeaders, sgENSO2NodeOthers.ColumnHeaders);
  TempENSO2Node :=  HTTPRIOENSO2Node as ENSO2NodeControllerSoapPort;
  TempCCNodeExt:= HTTPRIOCCNodeExt as  CCNodeExtControllerSoapPort;


    intCodesList := TempCCNodeExt.getChildNodesCodeArray(CCNodeExtShort(MainTree.Selected.Data).code);
    for i:=0 to High(intCodesList) do
    begin
        if strCodesList <> '' then strCodesList := strCodesList + ', ';
        strCodesList := strCodesList + IntToStr(intCodesList[i]);
    end;

   so2nodeFilter := ENSO2NodeFilter.Create;
   SetNullIntProps(so2nodeFilter);
   SetNullXSProps(so2nodeFilter);

    if strCodesList <> '' then
    begin // если есть связанные планы
     so2nodeFilter.conditionSQL := 'ccnodecode in (' + strCodesList + ')';
    end;


  ENSO2NodeList := TempENSO2Node.getScrollableFilteredList(so2nodeFilter,0,-1);
  nodeLastCount:=High(ENSO2NodeList.list);

  if nodeLastCount > -1 then
     sgENSO2NodeOthers.RowCount:=nodeLastCount+2
  else
     sgENSO2NodeOthers.RowCount:=2;

   with sgENSO2NodeOthers do
    for i:=0 to nodeLastCount do
      begin

        Application.ProcessMessages;
        if ENSO2NodeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSO2NodeList.list[i].code)
        else
        Cells[0,i+1] := '';

        AddCheckBox(1, i+1, false, false);

        if ENSO2NodeList.list[i].ccNodeCode = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(ENSO2NodeList.list[i].ccNodeCode);

          Cells[2,i+1] := ENSO2NodeList.list[i].ccelementdataname;

          if ENSO2NodeList.list[i].power <> nil then
          Cells[3,i+1] := ENSO2NodeList.list[i].power.DecimalString
          else
          Cells[3,i+1] := '';

          if ENSO2NodeList.list[i].tc_currpower <> nil then
          Cells[4,i+1] := ENSO2NodeList.list[i].tc_currpower.DecimalString
          else
          Cells[4,i+1] := '';

          Cells[5,i+1] := ENSO2NodeList.list[i].tc_conpowpoint;         //19
          Cells[6,i+1] := ENSO2NodeList.list[i].tc_conpowplaces;       //20
          Cells[7,i+1] := ENSO2NodeList.list[i].work_directly_on_joining;

          Cells[8,i+1] := ENSO2NodeList.list[i].description;

          if (ENSO2NodeList.list[i].isCalc = 1) then
          Cells[9,i+1] := 'Так'
        else
          Cells[9,i+1] := '';

          Cells[10,i+1] := ENSO2NodeList.list[i].so2nodeTypeName;

          Cells[11,i+1] := ENSO2NodeList.list[i].servicesobjectContractNumberServices + '\' +
                          ENSO2NodeList.list[i].servicesobjectContractNumber + ' від ' +
                          XSDate2String(ENSO2NodeList.list[i].servicesobjectContractDateServices);

          Cells[12,i+1] := ENSO2NodeList.list[i].servicesobjectContragentName;
          //Статус договору
          Cells[13,i+1] := ENSO2NodeList.list[i].servicesobjectContractStatusRefName;

          Cells[14,i+1] := ENSO2NodeList.list[i].tc_building;
          Cells[15,i+1] := ENSO2NodeList.list[i].tc_address;

          if ENSO2NodeList.list[i].tc_servvoltage <> nil then
          Cells[16,i+1] := ENSO2NodeList.list[i].tc_servvoltage.DecimalString
          else
          Cells[16,i+1] := '';

          if ENSO2NodeList.list[i].tc_currvoltage <> nil then
          Cells[17,i+1] := ENSO2NodeList.list[i].tc_currvoltage.DecimalString
          else
          Cells[17,i+1] := '';

          Cells[18,i+1] := ENSO2NodeList.list[i].dep_name;
          Cells[19,i+1] := ENSO2NodeList.list[i].tc_number;
          if ENSO2NodeList.list[i].tc_dategen <> nil then
            Cells[20,i+1] := XSDate2String(ENSO2NodeList.list[i].tc_dategen)
          else
            Cells[20,i+1] := '';
          Cells[21,i+1] := ENSO2NodeList.list[i].connectionkindname;
          if ENSO2NodeList.list[i].fact_conn_date <> nil then
            Cells[22,i+1] := XSDate2String(ENSO2NodeList.list[i].fact_conn_date)
          else
            Cells[22,i+1] := '';
          Cells[23,i+1] := ENSO2NodeList.list[i].f04;
          Cells[24,i+1] := ENSO2NodeList.list[i].s10;
          Cells[25,i+1] := ENSO2NodeList.list[i].f10;
          Cells[26,i+1] := ENSO2NodeList.list[i].s35;
          Cells[27,i+1] := ENSO2NodeList.list[i].f35;
          Cells[28,i+1] := ENSO2NodeList.list[i].s150;
          Cells[29,i+1] := ENSO2NodeList.list[i].f150;

         Cells[30,i+1] := ENSO2NodeList.list[i].userGen;

        if ENSO2NodeList.list[i].dateEdit = nil then
          Cells[31,i+1] := ''
        else
          Cells[31,i+1] := XSDateTimeWithDate2String(ENSO2NodeList.list[i].dateEdit);

        Objects[0,i+1] := TObject(ENSO2NodeList.list[i].servicesobjectCode);

        LastRow:=i+1;
        sgENSO2NodeOthers.RowCount:=LastRow+1;

      end;

    nodeColCount:=nodeColCount+1;
    sgENSO2NodeOthers.Row:=1;
end;



procedure TfrmENServicesConnectionEdit.btnTransliterateClick(Sender: TObject);
var
  TempCNAttachment : CNAttachmentControllerSoapPort;

begin
  inherited;
  TempCNAttachment := HTTPRIOCNAttachment as CNAttachmentControllerSoapPort;

    TempCNAttachment.transliterateAtt(ENServicesConnectionObj.code);

end;

procedure TfrmENServicesConnectionEdit.btnTreeCollapseClick(Sender: TObject);
begin
  inherited;
      MainTree.FullCollapse;
end;


procedure TfrmENServicesConnectionEdit.btnTreeRefreshClick(Sender: TObject);
begin
  inherited;
      UpdateMainTreeTop;
end;

procedure TfrmENServicesConnectionEdit.ShowNodeInTree(NodeCode: Integer);
var
    NodeExtObj: CCNodeExt;
    TreeNodeObj: TTreeNode;
    TempCCNode: CCNodeControllerSoapPort;
    nodesTree: CCNodeShortList;
    nodesFilter: CCNodeFilter;
    i: Integer;
    res: string;
begin
        TempCCNode:= HTTPRIOCCNode as CCNodeControllerSoapPort;

        if TempCCNode.getObject(NodeCode)=nil then
        begin
           ShowMessage('В поточний час такого об''єкта не існує.');
           Exit;
        end;

        if MainTree.Items.Count=0 then UpdateMainTreeTop;

        nodesFilter:= CCNodeFilter.Create;
        SetNullIntProps(nodesFilter);
        SetNullXSProps(nodesFilter);
        nodesFilter.conditionSQL:='ccnode.code in (select sit.nodewithallparents('+intToStr(NodeCode)+'))';
        //nodesFilter.orderBySQL:='ccnode.nodetypecode';
        nodesFilter.orderBySQL:='(select count(*) from sit.nodewithallparents(ccnode.code))';
        nodesTree:=TempCCNode.getScrollableFilteredList(nodesFilter,0,-1);

        for i:=0 to High(nodesTree.list) do
        begin
           if i=0 then
              TreeNodeObj:=MainTree.Items[0]
           else
              TreeNodeObj:=TreeNodeObj.getFirstChild;

           while TreeNodeObj <> nil do
           begin
             NodeExtObj:=CCNodeExt(TreeNodeObj.Data);
             if NodeExtObj.code<>nodesTree.list[i].code then
             begin
                TreeNodeObj:=TreeNodeObj.GetNextSibling;
             end
             else
             begin
               if TreeNodeObj.Count=0 then UpdateMainTreeBranch(TreeNodeObj);
               Break;
             end;
           end;

           if TreeNodeObj=nil then
           begin
             ShowMessage('Об''єкта немає в списку. Спробуйте оновити дерево або змінити фільтрацію');
             Exit;
           end;
        end;

        MainTree.Selected:=TreeNodeObj;
        MainTree.SetFocus;
end;

procedure TfrmENServicesConnectionEdit.UpdateMainTreeBranch(parentNode: TTreeNode);
var
  TempCCNodeExt: CCNodeExtControllerSoapPort;
  CCNodeExtList: CCNodeExtShortList;
  CCNodeExtFilterObj: CCNodeExtFilter;
  currNode: TTreeNode;
  i,j: Integer;
begin
  if parentNode.Count>0 then Exit;

  MainTree.Items.BeginUpdate;

  TempCCNodeExt :=  HTTPRIOCCNodeExt as CCNodeExtControllerSoapPort;
  CCNodeExtFilterObj := CCNodeExtFilter.Create;
  SetNullIntProps(CCNodeExtFilterObj);
  SetNullXSProps(CCNodeExtFilterObj);

  CCNodeExtFilterObj.conditionSQL:=
     ' ccnode.parentnodecode='+IntToStr(CCNodeExtShort(parentNode.Data).code)+
     ' or ccnode.parentnormalcode='+IntToStr(CCNodeExtShort(parentNode.Data).code);
  if CCNodeExtShort(parentNode.Data).isGroup=1 then
     CCNodeExtFilterObj.conditionSQL:=CCNodeExtFilterObj.conditionSQL+
     ' or ccnode.code in (select nodecode from ccnode2nodegroup n2g where n2g.nodegrpcode='+IntToStr(CCNodeExtShort(parentNode.Data).code)+')';

  CCNodeExtFilterObj.orderBySQL := 'ccnode.voltage desc, nodeisgroup(ccnode.code) desc, ccnode.name';
  CCNodeExtList := TempCCNodeExt.getScrollableFilteredList(CCNodeExtFilterObj, 0, -1);

  for i:=0 to High(CCNodeExtList.list) do
  begin
    currNode := MainTree.Items.AddChildObject(parentNode,CCNodeExtList.list[i].name,pointer(CCNodeExtList.list[i]));
    if CCNodeExtList.list[i].countChildren>0 then currNode.HasChildren:=true;
    if CCNodeExtList.list[i].isGroup=1 then
       currNode.ImageIndex:=9
    else
    if StrToFloat(CCNodeExtList.list[i].voltage.DecimalString)>150 then
       currNode.ImageIndex:=CCNodeExtList.list[i].nodetypeCode+9
    else
       currNode.ImageIndex:=CCNodeExtList.list[i].nodetypeCode;
    currNode.StateIndex:=-1;
    currNode.ExpandedImageIndex:=currNode.ImageIndex;
    currNode.SelectedIndex:=currNode.ImageIndex;
  end;

  if parentNode.Count=0 then parentNode.HasChildren:=False;

  MainTree.Items.EndUpdate;

end;



procedure TfrmENServicesConnectionEdit.UpdateMainTreeTop();
var
  TempCCNodeExt: CCNodeExtControllerSoapPort;
  CCNodeExtList: CCNodeExtShortList;
  CCNodeExtFilterObj: CCNodeExtFilter;
  currNode: TTreeNode;
  i,j: Integer;
begin
  MainTree.Items.BeginUpdate;

  if MainTree.Items.Count>0 then
  begin
      currNode:=MainTree.Items[0];
      while currNode <> nil do
      begin
         if  assigned(currNode.Data) then Dispose(currNode.Data);
         currNode:=currNode.GetNext;
      end;
  end;

  MainTree.OnChange:=nil;

  MainTree.Items.Clear;

  TempCCNodeExt :=  HTTPRIOCCNodeExt as CCNodeExtControllerSoapPort;
  CCNodeExtFilterObj := CCNodeExtFilter.Create;
  SetNullIntProps(CCNodeExtFilterObj);
  SetNullXSProps(CCNodeExtFilterObj);

  CCNodeExtFilterObj.conditionSQL:='ccnode.parentnodecode is null and ccnode.code not in (select r.code from ccren r)';
  CCNodeExtFilterObj.orderBySQL := 'ccnode.voltage desc, ccnode.name';
  CCNodeExtList := TempCCNodeExt.getScrollableFilteredList(CCNodeExtFilterObj, 0, -1);

  for i:=0 to High(CCNodeExtList.list) do
  begin
    currNode := MainTree.Items.AddObject(nil,CCNodeExtList.list[i].name,pointer(CCNodeExtList.list[i]));
    if CCNodeExtList.list[i].countChildren>0 then currNode.HasChildren:=true;
    if StrToFloat(CCNodeExtList.list[i].voltage.DecimalString)>150 then
       currNode.ImageIndex:=CCNodeExtList.list[i].nodetypeCode+9
    else
       currNode.ImageIndex:=CCNodeExtList.list[i].nodetypeCode;
    currNode.StateIndex:=-1;
    currNode.ExpandedImageIndex:=currNode.ImageIndex;
    currNode.SelectedIndex:=currNode.ImageIndex;
  end;

  MainTree.Items.EndUpdate;

end;

procedure TfrmENServicesConnectionEdit.Button1Click(Sender: TObject);
var
  argNames, args: EnergyproController.ArrayOfString;
  reportName, pathFileName : String;
  isWithoutCapitalCosts, isWithoutZeroPayment : Integer;
  // Признак необходимо ли выбирать договора с признаком село или город
  // значения:
  //  0 - все договора
  //  1 - город
  //  2 - село
  isCityVillage : Integer;
  // Признак необходимо ли выбирать договора с определнном типом присоединения
  // значения:
  //  0 - все договора
  //  1 - стандартное
  //  2 - нестандартное
  isStandardNonStandard : Integer;
begin

  inherited;

  isWithoutCapitalCosts := 0;
  isWithoutZeroPayment := 0;
  isCityVillage := 0;
  isStandardNonStandard := 0;


  // Установка параметров
  SetLength(argNames, 7);
  SetLength(args, 7);

  argNames[0] := 'dateStart';
  argNames[1] := 'dateFinal';
  argNames[2] := 'isWithoutCapitalCosts';
  argNames[3] := 'isWithoutZeroPayment';
  argNames[4] := 'isCityVillage';
  argNames[5] := 'isStandardNonStandard';
  argNames[6] := 'tcsCode';

  args[0] := '01.01.2010';
  args[1] := '01.01.2099';
  args[2] := IntToStr(isWithoutCapitalCosts);
  args[3] := IntToStr(isWithoutZeroPayment);
  args[4] := IntToStr(isCityVillage);
  args[5] := IntToStr(isStandardNonStandard);
  args[6] := IntToStr(ENTechConditionsServicesObj.code);

  reportName := 'Services/ConnectionFactCost/ConnectionFactCost';

  //SUPP-84438
  if Application.MessageBox(PChar('Додати у "Вкладення"?'),
     PChar('Внимание!'),MB_ICONQUESTION+ MB_YESNO) = IDYES then
  begin
     pathFileName :=  makeReport(reportName, argNames, args, 'xls');
     ENDocAttachmentObj := ENDocAttachment.Create;
     ENDocAttachment2ENServices := ENDocAttachment2ENServicesObject.Create;
     try
        frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
        frmDFDocAttachmentEdit.soCode := ENServicesConnectionObj.code;
        frmDFDocAttachmentEdit.edtFileName.Text := pathFileName;
        frmDFDocAttachmentEdit.edtCommentGen.Text := '';
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
    end
    else
       makeReport(reportName, argNames, args, 'xls');
end;

procedure TfrmENServicesConnectionEdit.Button2Click(Sender: TObject);
var argNames, args: EnergyproController.ArrayOfString;
    reportName, pathFileName: String;

  TempENSOValues: ENSOValuesControllerSoapPort;
  ENSOValuesList: ENSOValuesShortList;
  soValuesFilter : ENSOValuesFilter;
  TempENTechConditionsObjects: ENTechConditionsObjectsControllerSoapPort;
begin

  TempENTechConditionsObjects := HTTPRIOENTechConditionsObjects as ENTechConditionsObjectsControllerSoapPort;
  try
     ENTechConditionsObjectsObj := TempENTechConditionsObjects.getObject(ENServicesConnectionObj.techConObjects.code);
   except
   on EConvertError do Exit;
  end;

  if not Assigned(frmPrintTechConditions) then
    frmPrintTechConditions := TfrmPrintTechConditions.Create(Owner);
    frmPrintTechConditions.edtTechConditionStr.Text := 'визначити проєктом';
  try

    if frmPrintTechConditions.ShowModal = mrOk then
      begin

          SetLength(argNames, 2);
          SetLength(args, 2);

          argNames[0] := 'agreeCode';
          args[0] := IntToStr(ENTechConditionsServicesObj.code);

          argNames[1] := 'techCondStr';
          args[1] := frmPrintTechConditions.edtTechConditionStr.Text;

          //SUPP-88213
          TempENSOValues :=  HTTPRIOENSOValues as ENSOValuesControllerSoapPort;

           soValuesFilter := ENSOValuesFilter.Create;
           SetNullIntProps(soValuesFilter);
           SetNullXSProps(soValuesFilter);
           soValuesFilter.servicesobject := ENServicesObjectRef.Create;
           soValuesFilter.servicesobject.code := ENServicesConnectionObj.code;
           soValuesFilter.soValuesType := ENSOValuesTypeRef.Create;
           soValuesFilter.soValuesType.code := ENDATE_NUMBER_REGISTRATION_STATEMENT;

          ENSOValuesList := TempENSOValues.getScrollableFilteredList(soValuesFilter,0,-1);
          soValLastCount:=High(ENSOValuesList.list);

          if soValLastCount <= -1 then
          begin
             Application.MessageBox(PChar('Додайте дату та номер реєстрації заяви.'),
                  PChar('Увага!'), MB_ICONWARNING);
             Exit;
          end;

           if (EncodeDate(ENSOValuesList.list[0].dateVal.Year, ENSOValuesList.list[0].dateVal.Month,
                          ENSOValuesList.list[0].dateVal.Day) >= EncodeDate(2019,12,9)) then
              reportName :=  'TechConditions/NewConnection_09122019/techConditions';

          if (EncodeDate(ENSOValuesList.list[0].dateVal.Year, ENSOValuesList.list[0].dateVal.Month,
                          ENSOValuesList.list[0].dateVal.Day) < EncodeDate(2019,12,9)) then
              reportName :=  'TechConditions/NewConnection_022019/techConditions';

          if (EncodeDate(ENSOValuesList.list[0].dateVal.Year, ENSOValuesList.list[0].dateVal.Month,
                          ENSOValuesList.list[0].dateVal.Day) >= EncodeDate(2020,07,1)) then
          begin
               if ENTechConditionsObjectsObj.securityZone = ENTECHCONDITIONSOBJECT_SECURITYZONE_YES then
                  begin
                    reportName :=  'TechConditions/NewConnection_01072020/techConditions';
                  end
                  else
                    reportName :=  'TechConditions/NewConnection_09122019/techConditions';
          end;

          //SUPP-84438
          if Application.MessageBox(PChar('Додати у "Вкладення"?'),
              PChar('Внимание!'),MB_ICONQUESTION+ MB_YESNO) = IDYES then
          begin
               pathFileName := makeReport(reportName, argNames, args, 'pdf');
               ENDocAttachmentObj := ENDocAttachment.Create;
               ENDocAttachment2ENServices := ENDocAttachment2ENServicesObject.Create;
               try
                  frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
                  frmDFDocAttachmentEdit.soCode := ENServicesConnectionObj.code;
                  frmDFDocAttachmentEdit.edtFileName.Text := pathFileName;
                  frmDFDocAttachmentEdit.edtCommentGen.Text := '';
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
          end
          else
              makeReport(reportName, argNames, args, 'pdf');
      end;
  finally
    frmPrintTechConditions.Free;
    frmPrintTechConditions := nil;
  end;
end;

procedure TfrmENServicesConnectionEdit.btnPrintSO2NodesLinksClick(Sender: TObject);
var argNames, args: EnergyproController.ArrayOfString;
    reportName: String;
    frmPrintBindingSelectedNode: TfrmPrintBindingSelectedNode;
begin
          if MainTree.Selected = nil then
          begin
                ShowMessage('Виберіть точку приєднання з дерева об''єктів CallCentre');
                exit;
          end;

          SetLength(argNames, 5);
          SetLength(args, 5);

          argNames[0] := 'ccNodeCode';
          argNames[1] := 'startDateGen';
          argNames[2] := 'endDateGen';
          argNames[3] := 'startFactDateConn';
          argNames[4] := 'endFactDateConn';

          args[0] := IntToStr(CCNodeExtShort(MainTree.Selected.Data).code);

          frmPrintBindingSelectedNode := TfrmPrintBindingSelectedNode.Create(Application);
          try
             if frmPrintBindingSelectedNode.ShowModal = mrOk then
             begin
                  if frmPrintBindingSelectedNode.edtDateTUStart.Checked then
                    args[1] := DateToStr(frmPrintBindingSelectedNode.edtDateTUStart.Date)
                  else
                    args[1] :='';
                  if frmPrintBindingSelectedNode.edtDateTUEnd.Checked then
                    args[2] := DateToStr(frmPrintBindingSelectedNode.edtDateTUEnd.Date)
                  else
                    args[2] :='';
                  if frmPrintBindingSelectedNode.edtFactDateConnStart.Checked then
                    args[3] := DateToStr(frmPrintBindingSelectedNode.edtFactDateConnStart.Date)
                  else
                    args[3] :='';
                  if frmPrintBindingSelectedNode.edtFactDateConnEnd.Checked then
                    args[4] := DateToStr(frmPrintBindingSelectedNode.edtFactDateConnEnd.Date)
                  else
                    args[4] :='';
             end;
          finally
              frmPrintBindingSelectedNode.Close;
              frmPrintBindingSelectedNode.Free;
          end;

          reportName :=  'TechConditions/NewConnection_022019/connectionSO2NodeLinks';
          makeReport(reportName , argNames , args , 'xls');
end;

procedure TfrmENServicesConnectionEdit.btnDistrAgreeClick(Sender: TObject);
var
  TempENSO2DistrAgree: ENSO2DistrAgreeControllerSoapPort;
  TempENContragent :  ENContragentControllerSoapPort;
  so2distrFilter : ENSO2DistrAgreeFilter;
  so2distrList : ENSO2DistrAgreeShortList;
  ENContragentFilt : ENContragentFilter;
  ENContragentList : ENContragentShortList;
  existDistr : Boolean;
  dState : TDialogState;
  so2distrCode : Integer;
  techConObjectsCode : Integer;
begin

  dState := dsView;
  so2distrCode := LOW_INT;

  begin
    TempENContragent :=  HTTPRIOENContragent as ENContragentControllerSoapPort;

    ENContragentFilt := ENContragentFilter.Create;
    SetNullIntProps(ENContragentFilt);
    SetNullXSProps(ENContragentFilt);

    ENContragentFilt.techCondServicesRef := ENTechConditionsServicesRef.Create;
    ENContragentFilt.techCondServicesRef.code := ENTechConditionsServicesObj.code;

    ENContragentList := TempENContragent.getScrollableFilteredList(ENContragentFilter(ENContragentFilt),0,-1);

    LastCount:=High(ENContragentList.list);

    if (ENContragentList.totalCount > 0) then
    begin
      techConObjectsCode := ENContragentList.list[0].techConObjectsCode;
    end;
  end;

  begin
    TempENSO2DistrAgree := HTTPRIOENSO2DistrAgree as ENSO2DistrAgreeControllerSoapPort;

     so2distrFilter := ENSO2DistrAgreeFilter.Create;
     SetNullIntProps(so2distrFilter);
     SetNullXSProps(so2distrFilter);
     so2distrFilter.servicesobject := ENServicesObjectRef.Create;
     so2distrFilter.servicesobject.code := ENServicesConnectionObj.code;
     so2distrList := TempENSO2DistrAgree.getScrollableFilteredList(so2distrFilter, 0, -1);

     if so2distrList.totalCount > 0
     then
       begin
       dState := dsEdit;
       so2distrCode := so2distrList.list[0].code;
       end
     else dState := dsInsert;

  end;

  try
    frmENDistributionAgreeEdit := TfrmENDistributionAgreeEdit.Create(Application, dState);

    frmENDistributionAgreeEdit.soCode := ENServicesConnectionObj.code;
    frmENDistributionAgreeEdit.tcsCode := ENTechConditionsServicesObj.code;
    frmENDistributionAgreeEdit.so2distrCode := so2distrCode;
    frmENDistributionAgreeEdit.personalAccountNumber := ENServicesConnectionObj.personalAccountNumber;
    frmENDistributionAgreeEdit.techConObjectsCode := techConObjectsCode;
    frmENDistributionAgreeEdit.ShowModal;

  finally
    frmENDistributionAgreeEdit.Free;
  end;
end;

procedure TfrmENServicesConnectionEdit.btnPrintContractClick(Sender: TObject);
var
    menuPoint: TPoint;
begin
    menuPoint := gbPrint.ClientToScreen(Point(btnPrintContract.Left,
                btnPrintContract.Top + btnPrintContract.Height));
    pmPrintContract.Popup(menuPoint.X, menuPoint.Y);
end;

procedure TfrmENServicesConnectionEdit.btnPrintContractSupplyClick(Sender: TObject);
var
  existsData: Boolean;
begin
  inherited;
  existsData := checkDocAttachment;

  DMReportsContract := TDMReportsContract.Create(Application);
  try
    frmContractReports := TfrmContractReports.Create(Application, dsEdit);
    try
      if (not existsData) then
      begin

        if (personalInfo <> nil) and (personalInfo.rpName <> '') then
          frmContractReports.edtContractNumber.Text := personalInfo.rpName
        else frmContractReports.edtContractNumber.Text := '____';

        frmContractReports.edtClientName.Text := edtContragentName.Text;
        frmContractReports.edtClientDocs.Text := cbbBasisType.Text;
        frmContractReports.edtClientPosition.Text := edtContragentPosition.Text;
        frmContractReports.edtClientPosition2.Text := edtContragentPosition.Text;
        frmContractReports.edtClientFIO.Text := edtContragentBossName.Text;
        frmContractReports.edtClientFIO2.Text := edtContragentBossName.Text;
        frmContractReports.edtClientAddress.Text := edtContragentAddress.Text;
        frmContractReports.edtClientEDRPOU.Text := edtContragentOkpo.Text;
        frmContractReports.edtClientBankAccount.Text := edtContragentBankAccount.Text;
        frmContractReports.edtClientBankName.Text := edtContragentBankName.Text;
        frmContractReports.edtClientBankMFO.Text := edtContragentBankMfo.Text;

        frmContractReports.edtClientDocs2.Text := cbbBasisType.Text;

        /////////////////////////////////////////////////////////////
        frmContractReports.edtPlace.Text := 'м.Херсон';
        frmContractReports.edtContractDate.Text := '"__"_________';
        frmContractReports.edtREN.Text := DMReports.getSettingValueByKey(ENSettingsConsts.COMPANY_SHORTNAME);
        frmContractReports.edtSupplierPosition.Text :=
          'Заступника директора технічного ';
        frmContractReports.edtSupplierPosition2.Text :=
          'Заступник директора технічного ';
        frmContractReports.edtSupplierFIO.Text :=
          'Кічіянца Володимира Андрійовича';
        frmContractReports.edtSupplierFIO2.Text := 'Кічіянц В.А.';
        frmContractReports.edtBase.Text :=
          'довіреності № 07/008-16 від 23.12.2015р.';

        frmContractReports.edtSupplierAddress.Text :=
          'вул. Пестеля, 5, м. Херсон, 73003';
        frmContractReports.edtSupplierEDRPOU.Text := '38151729';
        frmContractReports.edtSupplierPhone.Text := '48-06-20';
        frmContractReports.edtSupplierFax.Text := '';

        frmContractReports.edtD1Jan.Text := '1000';
        frmContractReports.edtD1Feb.Text := '1000';
        frmContractReports.edtD1Mar.Text := '1000';
        frmContractReports.edtD1Apr.Text := '1000';
        frmContractReports.edtD1May.Text := '1000';
        frmContractReports.edtD1Jun.Text := '1000';
        frmContractReports.edtD1Jul.Text := '1000';
        frmContractReports.edtD1Aug.Text := '1000';
        frmContractReports.edtD1Sep.Text := '1000';
        frmContractReports.edtD1Oct.Text := '1000';
        frmContractReports.edtD1Nov.Text := '1000';
        frmContractReports.edtD1Dec.Text := '1000';

        frmContractReports.edtD2DayMeasurement28.Text := '28';
        frmContractReports.edtD2DayMeasurement29.Text := '29';
        frmContractReports.edtD2DayMeasurement30.Text := '30';
        frmContractReports.edtD2DayMeasurement31.Text := '31';

        frmContractReports.edtD8Turn1Energy.Text := 'участь приймає';
        frmContractReports.edtD8Turn2Energy.Text := 'участь приймає';
        frmContractReports.edtD8Turn3Energy.Text := 'участь приймає';
        frmContractReports.edtD8Turn4Energy.Text := 'участь приймає';
        frmContractReports.edtD8Turn5Energy.Text := 'участь приймає';
        frmContractReports.edtD8Turn1Power.Text := 'участь приймає';
        frmContractReports.edtD8Turn2Power.Text := 'участь приймає';
        frmContractReports.edtD8Turn3Power.Text := 'участь приймає';
        frmContractReports.edtD8Turn4Power.Text := 'участь приймає';
        frmContractReports.edtD8Turn5Power.Text := 'участь приймає';
        /////////////////////////////////////////////////////////////

      end;

      frmContractReports.edtPowerConnected.Text := edtContractServicesPower.Text;
      frmContractReports.techConObjectsBuilding := techConObjectsBuilding;
      frmContractReports.techConObjectsAddress := techConObjectsAddress;

      frmContractReports.iniFileExists := existsData;
      frmContractReports.attachmentCode := attachmentCode;
      frmContractReports.attachmentName := attachmentName;
      frmContractReports.soCode := ENServicesConnectionObj.code;

      frmContractReports.ShowModal;
    finally
      frmContractReports.Free;
    end;

  finally
    DMReportsContract.Free;
  end;
end;


procedure TfrmENServicesConnectionEdit.btnPrintContractUseClick(Sender: TObject);
begin
  inherited;
  try
    frmPrintAgreeUseElectricity := TfrmPrintAgreeUseElectricity.Create(Application, dsInsert);

    frmPrintAgreeUseElectricity.soCode := ENServicesConnectionObj.code;
    frmPrintAgreeUseElectricity.tcSoCode := ENTechConditionsServicesObj.code;
    frmPrintAgreeUseElectricity.departmentCode := departmentCode;
    frmPrintAgreeUseElectricity.servicesPower := edtContractServicesPower.Text;
    frmPrintAgreeUseElectricity.voltageNominal := edtEPVoltageNominalVoltagenominalName.Text;

    frmPrintAgreeUseElectricity.ShowModal;

  finally
    frmPrintAgreeUseElectricity.Free;
  end;
end;


procedure TfrmENServicesConnectionEdit.chkTUClick(Sender: TObject);
begin
      if ((chkTU.Checked) and (rgContragentType.ItemIndex = 1) ) then

         DisableControls([edtContragentObjectWork],false)
    else
     begin
         DisableControls([edtContragentObjectWork],True);
         edtContragentObjectWork.Text := '';
     end;
    if DialogState = dsView then
       DisableControls([edtContragentObjectWork],True);
    HideControls([lblEPVoltageNominalVoltagenominalName,
      edtEPVoltageNominalVoltagenominalName,
      spbEPVoltageNominalVoltagenominal, chkBaseStation], not chkTU.Checked);
end;

procedure TfrmENServicesConnectionEdit.rgContragentTypeClick(
  Sender: TObject);
begin
 // inherited;
    if ((chkTU.Checked ) and (rgContragentType.ItemIndex = 1 )) then

         DisableControls([edtContragentObjectWork],false)
    else
     begin
         DisableControls([edtContragentObjectWork],True);
         edtContragentObjectWork.Text := '';
     end;

     if DialogState = dsView then
       DisableControls([edtContragentObjectWork],True);
end;

procedure TfrmENServicesConnectionEdit.spbTechConditionsClick(
  Sender: TObject);
var
  frmENTechConditionsObjectsShow: TfrmENTechConditionsObjectsShow;
  //TempENTechConditionsObjects: ENTechConditionsObjectsControllerSoapPort;

  //tcFilter : ENTechConditionsObjectsFilter;
  //TUObject : ENTechConditionsObjects;
begin
  frmENTechConditionsObjectsShow := TfrmENTechConditionsObjectsShow.Create(Application, fmNormal);
  try
    with frmENTechConditionsObjectsShow do
    if ShowModal = mrOk then
    begin
      edtTechConditionsNumber.Text := GetReturnValue(sgENTechConditionsObjects, 1);
      edtTechConditionsDate.DateTime := StrToDateTime(GetReturnValue(sgENTechConditionsObjects, 2));
      ENServicesConnectionObj.techConObjects.code := StrToInt(GetReturnValue(sgENTechConditionsObjects, 0));

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


procedure TfrmENServicesConnectionEdit.spbTechContractNumberClick(Sender: TObject);
var
  frmFINServicesObjectShow : TfrmFINServicesObjectShow;
  f : ENServicesObjectFilter;
begin
  inherited;
  f := ENServicesObjectFilter.Create();
  SetNullXSProps(f);
  SetNullIntProps(f);

  if (ENTechAgreement2Services <> nil) and (ENTechAgreement2Services.partnerCode <> '') then
  begin
    f.conditionSQL := ' a.io_flag = ''B'' and p.code = ''' + ENTechAgreement2Services.partnerCode + '''';
    f.partnerCode := ENTechAgreement2Services.partnerCode;
  end
  else
  begin
    Application.MessageBox(PChar('Оберіть виконавця!!!'),PChar('Увага!!!'),MB_ICONWARNING+MB_OK);
    Exit;
  end;

  frmFINServicesObjectShow := TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
  frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
  try
    with frmFINServicesObjectShow do
      if ShowModal = mrOk then
      begin
        try
          edtTechContractNumber.Text := '№ ' + GetReturnValue(sgFINServicesObject, 1) + ' від ' + GetReturnValue(sgFINServicesObject, 2);
          ENTechAgreement2Services.contractNumber := GetReturnValue(sgFINServicesObject, 1);
          ENTechAgreement2Services.contractDate := TXSDate.Create;
          ENTechAgreement2Services.contractDate.XSToNative(GetXSDate( StrToDate(GetReturnValue(sgFINServicesObject, 2)) ));
          ENTechAgreement2Services.finDocCode  := GetReturnValue(sgFINServicesObject, 5);
          ENTechAgreement2Services.finDocId := StrToInt(GetReturnValue(sgFINServicesObject, 6));
          ENTechAgreement2Services.commentGen := GetReturnValue(sgFINServicesObject, 7);

          // SUPP-26898... 05.12.2014...
          if (ENTechAgreement2Services.partnerCode = FK_PARTNERCODE_BRІLYUKS) then
            edtBasisForAction.Text := 'Директора Грисевича Дмитра Володимировича, що діє на підставі Статуту, ' +
              'а також інженера з технічного нагляду за будівництвом Грисевича Д.В., ' +
              'що діє на підставі Кваліфікаційного Сертифікату №002683 Серія ІТ від 06.08.2013року (№2005 в Реестрі), Наказу № 4 -ОК,';

        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmFINServicesObjectShow.Free;
  end;
end;


procedure TfrmENServicesConnectionEdit.spbTechContractNumberGLClick(
  Sender: TObject);
var
  frmFINServicesObjectShow : TfrmFINServicesObjectShow;
  f : ENServicesObjectFilter;
begin
  inherited;
  f := ENServicesObjectFilter.Create();
  SetNullXSProps(f);
  SetNullIntProps(f);

  if (ENTechAgreement2ServicesGL <> nil) and (ENTechAgreement2ServicesGL.partnerCode <> '') then
  begin
    f.conditionSQL := ' a.io_flag = ''B'' and p.code = ''' + ENTechAgreement2ServicesGL.partnerCode + '''';
    f.partnerCode := ENTechAgreement2ServicesGL.partnerCode;
  end
  else
  begin
    Application.MessageBox(PChar('Оберіть виконавця!!!'),PChar('Увага!!!'),MB_ICONWARNING+MB_OK);
    Exit;
  end;

  frmFINServicesObjectShow := TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
  frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
  try
    with frmFINServicesObjectShow do
      if ShowModal = mrOk then
      begin
        try
          edtTechContractNumberGL.Text := '№ ' + GetReturnValue(sgFINServicesObject, 1) + ' від ' + GetReturnValue(sgFINServicesObject, 2);
          ENTechAgreement2ServicesGL.contractNumber := GetReturnValue(sgFINServicesObject, 1);
          ENTechAgreement2ServicesGL.contractDate := TXSDate.Create;
          ENTechAgreement2ServicesGL.contractDate.XSToNative(GetXSDate( StrToDate(GetReturnValue(sgFINServicesObject, 2)) ));
          ENTechAgreement2ServicesGL.finDocCode  := GetReturnValue(sgFINServicesObject, 5);
          ENTechAgreement2ServicesGL.finDocId := StrToInt(GetReturnValue(sgFINServicesObject, 6));
          ENTechAgreement2ServicesGL.commentGen := GetReturnValue(sgFINServicesObject, 7);

        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmFINServicesObjectShow.Free;
  end;
end;

procedure TfrmENServicesConnectionEdit.spbLevelClearClick(
  Sender: TObject);
begin
  inherited;
   ENSOTechParamsObject.levelRef := nil;
   edtENConnectionLevelLevelRefName.Text := '';
end;


procedure TfrmENServicesConnectionEdit.SetActTransferVisibilityByStatus(servicesObjectStatus: Integer);
begin
end;

procedure TfrmENServicesConnectionEdit.actActTransferPrintExecute(
  Sender: TObject);
var
  argNames, args: EnergyproController.ArrayOfString;
  reportName: String;
begin
  SetLength(argNames, 1);
  SetLength(args, 1);

  argnames[0] := 'servicesObjectCode';
  args[0] := IntToStr(ENServicesConnectionObj.code);

  reportName := '201109/ActTransferForServices/Act';
  makeReport(reportName, argNames, args, 'xls');
end;

procedure TfrmENServicesConnectionEdit.actActTransferMoveToFKExecute(
  Sender: TObject);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
    tmpObj: ENServicesObject;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте провести Акт приймання-передачі?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK then
    Exit;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  TempENServicesObject.moveActTransferToFK(ENServicesConnectionObj.code);

  Application.MessageBox(PChar('Акт проведено!'), PChar('Інформація'), MB_ICONINFORMATION);

  tmpObj := TempENServicesObject.getObject(ENServicesConnectionObj.code);
  SetActTransferVisibilityByStatus(tmpObj.statusRef.code);
end;

procedure TfrmENServicesConnectionEdit.actActTransferUnMoveToFKExecute(
  Sender: TObject);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
    tmpObj: ENServicesObject;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити проведення Акту приймання-передачі?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK then
    Exit;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  TempENServicesObject.unMoveActTransferToFK(ENServicesConnectionObj.code);

  Application.MessageBox(PChar('Проведення акту відмінено!'), PChar('Інформація'), MB_ICONINFORMATION);

  tmpObj := TempENServicesObject.getObject(ENServicesConnectionObj.code);
  SetActTransferVisibilityByStatus(tmpObj.statusRef.code);
end;



function TfrmENServicesConnectionEdit.CheckCountersByClassifications(): Boolean;
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


procedure TfrmENServicesConnectionEdit.SetCountersVisibility;
begin
  tsCounters.TabVisible := false;

  if (ENServicesConnectionObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
  begin
    ///// 10.01.13 NET-4159
    // Отображение вкладки "Лічильники, що передаються Замовником".
    // Если счетчики уже вкинуты, отображаем вкладку в любом случае,
    // если нет, и статус договора "Кошторис затверджений" - смотрим,
    // есть ли в нем калькуляции с признаком "Передача лічильника замовником до Метрології",
    // тогда отображаем вкладку
    if DMReports.CheckCounters(ENServicesConnectionObj.code) then
      tsCounters.TabVisible := true
    else
      if ENServicesConnectionObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_BUDGETAPPROVED then
      begin
        if CheckCountersByClassifications then
          tsCounters.TabVisible := true;
      end;
    /////
  end;
end;

procedure TfrmENServicesConnectionEdit.actUpdateCountersExecute(
  Sender: TObject);
var i, plan2ctCode: Integer;
    TempENGiveCounter: ENGiveCounterControllerSoapPort;
    ENGiveCounterFilterObj: ENGiveCounterFilter;
    ENGiveCounterList: ENGiveCounterShortList;
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
  ENGiveCounterFilterObj.servicesObjectRef.code := ENServicesConnectionObj.code;

  ENGiveCounterFilterObj.plan2ClTypeRef := ENPlanWork2ClassificationTypeRef.Create;
  ENGiveCounterFilterObj.plan2ClTypeRef.code := plan2ctCode;

  TempENGiveCounter := HTTPRIOENGiveCounter as ENGiveCounterControllerSoapPort;

  ENGiveCounterList := TempENGiveCounter.getScrollableFilteredList(ENGiveCounterFilterObj, 0, -1);

  if High(ENGiveCounterList.list) > -1 then
    sgENGiveCounter.RowCount := High(ENGiveCounterList.list) + 2
  else
    sgENGiveCounter.RowCount := 2;

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
      Cells[3,i+1] := ENGiveCounterList.list[i].commentGen;
      sgENGiveCounter.RowCount := i + 2;
    end;

  sgENGiveCounter.Row := 1;
end;

procedure TfrmENServicesConnectionEdit.actInsertCounterExecute(
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
    ENGiveCounterObj.servicesObjectRef.code := ENServicesConnectionObj.code;
    ENGiveCounterObj.plan2ClTypeRef := ENPlanWork2ClassificationTypeRef.Create;
    ENGiveCounterObj.plan2ClTypeRef.code := plan2ctCode;

    frmENGiveCounterEdit := TfrmENGiveCounterEdit.Create(Application, dsInsert);
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

procedure TfrmENServicesConnectionEdit.actEditCounterExecute(
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

procedure TfrmENServicesConnectionEdit.actDeleteCounterExecute(
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

procedure TfrmENServicesConnectionEdit.actViewCounterExecute(
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
  try
    frmENGiveCounterEdit.ShowModal;
  finally
    frmENGiveCounterEdit.Free;
    frmENGiveCounterEdit:=nil;
  end;
end;

procedure TfrmENServicesConnectionEdit.actViewDFDocBySheet4SOExecute(
  Sender: TObject);
var
  //frmDFDocManagement: TfrmDocumentManagementShow;
  ObjCode, dfDocCode: Integer;
  //docFilter: DFDocFilter;
  TempDFDoc: DFDocControllerSoapPort;
  doc: DFDoc;
begin
  try
    ObjCode := StrToInt(sgENSheets4SO.Cells[0, sgENSheets4SO.Row]);
  except
    on EConvertError do Exit;
  end;

  dfDocCode := Integer(sgENSheets4SO.Objects[DFDOC_CODE_INDEX, sgENSheets4SO.Row]);
  if dfDocCode <= 0 then Exit;

{
  docFilter := DFDocFilter.Create;
  SetNullIntProps(docFilter);
  SetNullXSProps(docFilter);
  docFilter.code := dfDocCode;

  frmDFDocManagement := TfrmDocumentManagementShow.Create(Application, fmNormal);
  try
    frmDFDocManagement.generalSearchFilter := docFilter;
    Application.Tag := ENConsts.CONFIG_CALLCENTER_CLIENT_VERSION;
    frmDFDocManagement.ShowModal;
  finally
    frmDFDocManagement.Free;
    frmDFDocManagement := nil;
  end;
}

  TempDFDoc := HTTPRIODFDoc as DFDocControllerSoapPort;
  doc := TempDFDoc.getObject(dfDocCode);

  if (doc.docTypeRef.code = DFDOCTYPE_OUTBOX) then
  begin
    DFDocOutBoxObj := DMReports.getOutBoxByDocCode(dfDocCode);
    if (DFDocOutBoxObj = nil) then Exit;

    frmDFDocOutBoxEdit := TfrmDFDocOutBoxEdit.Create(Application, dsView);
    try
      frmDFDocOutBoxEdit.ShowModal;
    finally
      frmDFDocOutBoxEdit.Free;
      frmDFDocOutBoxEdit := nil;
    end;
  end;
end;

procedure TfrmENServicesConnectionEdit.sgENCalcPowerReserveClick(
  Sender: TObject);
begin
  inherited;
  updatePowerReserveItems;
end;

procedure TfrmENServicesConnectionEdit.sgENClassificationsWithCountersClick(
  Sender: TObject);
begin
  actUpdateCountersExecute(Sender);
end;


procedure TfrmENServicesConnectionEdit.sgENNecessityBuildingDblClick(Sender: TObject);
begin
  inherited;
  actViewNecessityBuildingExecute(Sender);
end;


procedure TfrmENServicesConnectionEdit.spbENResponsibleClick(
  Sender: TObject);
var
   frmFINWorkerShow: TfrmFINWorkerShow;
   f : FINWorkerFilter;
   //plan : ENPlanWork;
   //TempFINWorker: FINWorkerControllerSoapPort;
   {
   eType : Integer;
   NVZType: String;
   IsNVZ: Boolean;
   }
begin
  {
  inherited;

      if planCode = LOW_INT then
      begin
        Application.MessageBox(PChar('Робітник додається з плану!!!'), PChar('Увага !'),MB_ICONWARNING);
        exit;
      end;

      plan := DMReports.getPlanByCode(planCode);

      eType := DMReports.getElementByCode(plan.elementRef.code).typeRef.code;
   }

   {
   if not edtContractDateServices.Checked then
   begin
     Application.MessageBox(PChar('Спочатку вкажіть дату договору!'), PChar('Увага !'), MB_ICONWARNING);
     pcCalculation.ActivePage := tsGeneral;
     edtContractDateServices.SetFocus;
     Exit;
   end;
   }

   f :=FINWorkerFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);


   // Вся Метрология
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

     {
     if self.isDriver = false then
        frmFINWorkerShow.humenKindCode := ENHUMENITEMKIND_ELTEH
     else
        frmFINWorkerShow.humenKindCode := ENHUMENITEMKIND_DRIVER;
     }
     
    DisableActions([frmFINWorkerShow.actInsert, frmFINWorkerShow.actEdit, frmFINWorkerShow.actDelete]);

    with frmFINWorkerShow do
      if ShowModal = mrOk then
      begin
        ENServicesConnectionObj.resposible := GetReturnValue(sgFINWorker, 1);
        ENServicesConnectionObj.resposibleTabNumber := GetReturnValue(sgFINWorker, 2);
        ENServicesConnectionObj.resposiblePosition := GetReturnValue(sgFINWorker, 3);
        //edtENResponsible.Text := ENServicesConnectionObj.resposiblePosition + ' ' + ENServicesConnectionObj.resposible;
        edtENResponsible.Text := ENServicesConnectionObj.resposible;
        edtENResponsiblePosition.Text := ENServicesConnectionObj.resposiblePosition;
      end;
  finally
    frmFINWorkerShow.Free;
  end;
end;

procedure TfrmENServicesConnectionEdit.spbEPVoltageNominalVoltagenominalClick(
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

procedure TfrmENServicesConnectionEdit.showAccompanyingSheetJRXML(
  reportPath, strSigner, strSignerPost: String); //SUPP-32425. Сопроводительные
var //листы к договору присоединения дополнены параметрами должность и ФИО
  argNames, args : EnergyproController.ArrayOfString; //подписанта, ФИО и телефон исполнителя
  reportName, pathFileName : String; //Путь к файлу *.jrxml-отчёта
  //existPerformer,  //Присутствие в отчёте параметров ИСПОЛНИТЕЛЬ, его ТЕЛЕФОН
  //existSigner: Boolean; //Присутствие параметров ФИО и ДОЛЖНОСТЬ ПОДПИСАНТА
  argCnt: Integer; //Количество параметров отчёта
begin
  //argCnt := 1;

  //Определение присутствия строковых параметров ФИО, ДОЛЖНОСТЬ ПОДПИСАНТА
  //existSigner :=
  //  (reportPath = 'TechConditions/accompanyingSheet/accompanyingSheet4')
  //  or (reportPath = 'TechConditions/accompanyingSheet/accompanyingSheet3')
  //  or (reportPath = 'TechConditions/accompanyingSheet/accompanyingSheet2')
  //  or (reportPath = 'TechConditions/accompanyingSheet/accompanyingSheet1');

  //Определение присутствия в отчёте строковых параметров ИСПОЛНИТЕЛЬ, ТЕЛЕФОН
  //existPerformer := existSigner
  //  or (reportPath =
  //    'TechConditions/accompanyingSheet/accompanyingSheet4_signTechDir')
  //  or (reportPath =
  //    'TechConditions/accompanyingSheet/accompanyingSheet3_signTechDir')
  //  or (reportPath =
  //    'TechConditions/accompanyingSheet/accompanyingSheet2_signTechDir')
  //  or (reportPath =
  //    'TechConditions/accompanyingSheet/accompanyingSheet1_signTechDir');

  //if existPerformer then
  //  argCnt := argCnt + 2;

  //if existSigner then
  //  argCnt := argCnt + 2;

  //SetLength(argNames, argCnt);
  //SetLength(args, argCnt);

  if not Assigned(frmAccompanyingSheet) then
    frmAccompanyingSheet := TfrmAccompanyingSheet.Create(Owner);
  try
    frmAccompanyingSheet.mmoSigner.Text := strSigner;
    frmAccompanyingSheet.mmoSignerPost.Text := strSignerPost;
    if frmAccompanyingSheet.ShowModal = mrOk then
      begin
        if reportPath = 'TechConditions/accompanyingSheet/accompanyingSheet3' then
          argCnt := 6 //SUPP-45503
        else
          argCnt := 5;

        SetLength(argNames, argCnt);
        SetLength(args, argCnt);

        argNames[0] := 'agreeCode';
        args[0] := IntToStr(ENServicesConnectionObj.code);

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
        //  end; //if existPerformer then

        //if existSigner then
        //  begin
             argNames[3] := 'signer';
             if frmAccompanyingSheet.mmoSigner.Text <> '' then
               args[3] := frmAccompanyingSheet.mmoSigner.Text
             else
               args[3] := 'В.Д. Гончаров';

             argNames[4] := 'signerPost';
             if frmAccompanyingSheet.mmoSignerPost.Text <> '' then
               args[4] := frmAccompanyingSheet.mmoSignerPost.Text
             else
               args[4] := 'Перший заступник директора технічного';

             if argCnt >= 6 then //SUPP-45503
               begin
                 argNames[5] := 'departmentgenitive';
                 {
                 if rgAccompanyingSheet.ItemIndex = 1 then //SUPP-46324
                   args[5] := AutoChange(edtENDepartmentDepartmentName.Text, 'ий', 'ого');
                 if args[5] = '' then
                   args[5] := DMReports.getSettingValueByKey(ENSettingsConsts.COMPANY_SHORTNAME);
                 }
                 args[5] := AutoChange(edtENDepartmentDepartmentName.Text, 'ий', 'ого');
               end;
        //  end; //if existPerformer then

        reportName := reportPath;
        //SUPP-84438
        if Application.MessageBox(PChar('Додати у "Вкладення"?'),
            PChar('Внимание!'),MB_ICONQUESTION+ MB_YESNO) = IDYES then
        begin
             pathFileName := makeReport(reportName, argNames, args, 'pdf');
             ENDocAttachmentObj := ENDocAttachment.Create;
             ENDocAttachment2ENServices := ENDocAttachment2ENServicesObject.Create;
             try
                frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
                frmDFDocAttachmentEdit.soCode := ENServicesConnectionObj.code;
                frmDFDocAttachmentEdit.edtFileName.Text := pathFileName;
                frmDFDocAttachmentEdit.edtCommentGen.Text := '';
                try
                   frmDFDocAttachmentEdit.ShowModal;
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
        end
        else
          makeReport(reportName, argNames, args, 'pdf');
      end; //if frmAccompanyingSheet.ShowModal = mrOk then
  finally
    frmAccompanyingSheet.Free;
    frmAccompanyingSheet := nil;
  end;
end;

procedure TfrmENServicesConnectionEdit.miAccompanyingSheet1Click(
  Sender: TObject);
var sheetTypeCode, i: Integer;
  TempENSOValues: ENSOValuesControllerSoapPort;
  ENSOValuesList: ENSOValuesShortList;
  soValuesFilter : ENSOValuesFilter;
begin
  sheetTypeCode := (Sender as TMenuItem).Tag;

  if sheetTypeCode <= 0 then
  begin
    Application.MessageBox(PChar('Не вдалося визначити тип супровідного листа!'),
                           PChar('Увага !'), MB_ICONERROR + MB_OK);
    Exit;
  end;

  ENSheets4SOObj := ENSheets4SO.Create;
  SetNullIntProps(ENSheets4SOObj);
  SetNullXSProps(ENSheets4SOObj);

  ENSheets4SOObj.sheet4sotype := ENSheets4SOTypeRef.Create;
  ENSheets4SOObj.sheet4sotype.code := sheetTypeCode; //ENSHEETS4SOTYPE_ACCOMPANYINGSHEET1;
  ENSheets4SOObj.servicesobject := ENServicesObjectRef.Create;
  ENSheets4SOObj.servicesobject.code := ENServicesConnectionObj.code;

  try
    frmENSheets4SOEdit := TfrmENSheets4SOEdit.Create(Application, dsInsert);
    try
      if sheetTypeCode = ENSHEETS4SOTYPE_PETITION then
      begin
           TempENSOValues :=  HTTPRIOENSOValues as ENSOValuesControllerSoapPort;

           soValuesFilter := ENSOValuesFilter.Create;
           SetNullIntProps(soValuesFilter);
           SetNullXSProps(soValuesFilter);
           soValuesFilter.servicesobject := ENServicesObjectRef.Create;
           soValuesFilter.servicesobject.code := ENServicesConnectionObj.code;
           soValuesFilter.conditionSQL := ' ENSOVALUESTYPE.CODE IN (31,32,33,36)';

          ENSOValuesList := TempENSOValues.getScrollableFilteredList(soValuesFilter,0,-1);
          soValLastCount:=High(ENSOValuesList.list);

          if soValLastCount <= -1 then
          begin
                Application.MessageBox(PChar('Додайте всі необхідні додаткові реквізити!'),
                    PChar('Увага!'), MB_ICONWARNING);
                Exit;
          end;
          for i:=0 to soValLastCount do
          begin
                if ENSOValuesList.list[i].soValuesTypeCode = ENSOVALUESTYPE_NAME_LAND_MANAGER then
                    frmENSheets4SOEdit.edtRecipient.Text := ENSOValuesList.list[i].strVal;
                if ENSOValuesList.list[i].soValuesTypeCode = ENSOVALUESTYPE_POST_ADDRESS_LAND_MANAGER then
                    frmENSheets4SOEdit.edtRecipientAddress.Text := ENSOValuesList.list[i].strVal;
          end;
     end;
      if frmENSheets4SOEdit.ShowModal = mrOk then
      begin
        // Откроем сразу вкладку "Листи"
        pcCalculation.ActivePage := tsSheets4SO;
        updateSheets4SO;
      end;
    finally
      frmENSheets4SOEdit.Free;
      frmENSheets4SOEdit := nil;
    end;
  finally
    ENSheets4SOObj.Free;
  end;
end;


procedure TfrmENServicesConnectionEdit.miInvertSelectionCheckboxesClick(
  Sender: TObject);
var
  TempENCalcPowerReserveItem: ENCalcPowerReserveItemControllerSoapPort;
  i, powerReserveCode: Integer;
  ENCalcPowerReserveItemList: ENCalcPowerReserveItemShortList;
  priFilter : ENCalcPowerReserveItemFilter;
  state_: boolean;
begin
  SetGridHeaders(ENCalcPowerReserveItemHeaders, sgENCalcPowerReserveItem.ColumnHeaders);

  TempENCalcPowerReserveItem :=  HTTPRIOENCalcPowerReserveItem as ENCalcPowerReserveItemControllerSoapPort;

  try
     powerReserveCode := StrToInt(sgENCalcPowerReserve.Cells[0,sgENCalcPowerReserve.Row]);
   except
   on EConvertError do Exit;
  end;

     priFilter := ENCalcPowerReserveItemFilter.Create;
     SetNullIntProps(priFilter);
     SetNullXSProps(priFilter);
     priFilter.calcPowerReserveRef := ENCalcPowerReserveRef.Create;
     priFilter.calcPowerReserveRef.code := powerReserveCode;
     priFilter.orderBySQL := ' socontragentname';

  ENCalcPowerReserveItemList := TempENCalcPowerReserveItem.getScrollableFilteredList(priFilter,0,-1);
  priLastCount:=High(ENCalcPowerReserveItemList.list);

  if priLastCount > -1 then
     sgENCalcPowerReserveItem.RowCount:=priLastCount+2
  else
     sgENCalcPowerReserveItem.RowCount:=2;

   with sgENCalcPowerReserveItem do
    for i:=0 to priLastCount do
      begin
        Application.ProcessMessages;
        if ENCalcPowerReserveItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENCalcPowerReserveItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        sgENCalcPowerReserveItem.GetCheckBoxState(1,i+1,state_);
        if state_ then
          state_ := false
        else
          state_ := true;
        AddCheckBox(1, i+1, state_, false);
        Cells[1,i+1] := ENCalcPowerReserveItemList.list[i].soContract;
        Cells[2,i+1] := ENCalcPowerReserveItemList.list[i].soContragentName;

        Cells[3,i+1] := ENCalcPowerReserveItemList.list[i].techconditions;

        Cells[4,i+1] := ENCalcPowerReserveItemList.list[i].userGen;
        if ENCalcPowerReserveItemList.list[i].dateEdit = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDateTimeWithDate2String(ENCalcPowerReserveItemList.list[i].dateEdit);

        priLastRow:=i+1;
        sgENCalcPowerReserveItem.RowCount:=priLastRow+1;
      end;

    sgENCalcPowerReserveItem.Row:=1;
end;

procedure
  TfrmENServicesConnectionEdit.mniAccompanyingSheet1_sign1DeputyTechDirClick(
    Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet1',
    'В.Д. Гончаров', 'Перший заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.mniAccompanyingSheet1_signDeputyTechDirConnectionClick(
  Sender: TObject);
begin
  showAccompanyingSheetJRXML( //http://jira:8080/browse/SUPP-39916
    'TechConditions/accompanyingSheet/accompanyingSheet1',
    'В.А. Кічіянц', 'Заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.mniAccompanyingSheet1_signOtherClick(
  Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet1', '', '');
end;

procedure TfrmENServicesConnectionEdit.mniAccompanyingSheet1_signTechDirClick(
  Sender: TObject);
begin
  //showAccompanyingSheetJRXML(
  //  'TechConditions/accompanyingSheet/accompanyingSheet1_signTechDir');
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet1',
    'В.А. Гетманов', 'Директор технічний');
end;

procedure
  TfrmENServicesConnectionEdit.mniAccompanyingSheet2_sign1DeputyTechDirClick(
    Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet2',
    'В.Д. Гончаров', 'Перший заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.mniAccompanyingSheet2_signDeputyTechDirConnectionClick(
  Sender: TObject);
begin
  showAccompanyingSheetJRXML( //http://jira:8080/browse/SUPP-39916
    'TechConditions/accompanyingSheet/accompanyingSheet2',
    'В.А. Кічіянц', 'Заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.mniAccompanyingSheet2_signOtherClick(
  Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet2', '', '');
end;

procedure TfrmENServicesConnectionEdit.mniAccompanyingSheet2_signTechDirClick(
  Sender: TObject);
begin
  //showAccompanyingSheetJRXML(
  //  'TechConditions/accompanyingSheet/accompanyingSheet2_signTechDir');
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet2',
    'В.А. Гетманов', 'Директор технічний');
end;

procedure
  TfrmENServicesConnectionEdit.mniAccompanyingSheet3_sign1DeputyTechDirClick(
    Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet3',
    'В.Д. Гончаров', 'Перший заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.mniAccompanyingSheet3_signDeputyTechDirConnectionClick(
  Sender: TObject);
begin
  showAccompanyingSheetJRXML( //http://jira:8080/browse/SUPP-39916
    'TechConditions/accompanyingSheet/accompanyingSheet3',
    'В.А. Кічіянц', 'Заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.mniAccompanyingSheet3_signOtherClick(
  Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet3', '', '');
end;

procedure TfrmENServicesConnectionEdit.mniAccompanyingSheet3_signTechDirClick(
  Sender: TObject);
begin
  //showAccompanyingSheetJRXML(
  //  'TechConditions/accompanyingSheet/accompanyingSheet3_signTechDir');
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet3',
    'В.А. Гетманов', 'Директор технічний');
end;

procedure
  TfrmENServicesConnectionEdit.mniAccompanyingSheet4_sign1DeputyTechDirClick(
    Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet4',
    'В.Д. Гончаров', 'Перший заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.mniAccompanyingSheet4_signDeputyTechDirConnectionClick(
  Sender: TObject);
begin
  showAccompanyingSheetJRXML( //http://jira:8080/browse/SUPP-39916
    'TechConditions/accompanyingSheet/accompanyingSheet4',
    'В.А. Кічіянц', 'Заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.mniAccompanyingSheet4_signOtherClick(
  Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet4', '', '');
end;

procedure TfrmENServicesConnectionEdit.mniAccompanyingSheet4_signTechDirClick(
  Sender: TObject);
begin
  inherited;
  showAccompanyingSheetJRXML( //http://jira:8080/browse/SUPP-39916
    'TechConditions/accompanyingSheet/accompanyingSheet5',
    'В.А. Кічіянц', 'Заступник директора технічного');
end;


procedure TfrmENServicesConnectionEdit.mniAccompanyingSheet5_sign1DeputyTechDirClick(
  Sender: TObject);
begin
  inherited;
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet5',
    'В.Л. Мануйленко', 'Перший заступник директора технічного');
end;


procedure TfrmENServicesConnectionEdit.mniAccompanyingSheet5_signDeputyTechDirConnectionClick(
  Sender: TObject);
begin
  inherited;
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet5',
    'В.А. Кічіянц', 'Заступник директора технічного');
end;


procedure TfrmENServicesConnectionEdit.mniAccompanyingSheet5_signOtherClick(
  Sender: TObject);
begin
  inherited;
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet5', '', '');
end;


procedure TfrmENServicesConnectionEdit.mniAccompanyingSheet5_signTechDirClick(
  Sender: TObject);
begin
  inherited;
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet5',
    'В.Д. Гончаров', 'Директор технічний');
end;


procedure TfrmENServicesConnectionEdit.mniAccompanyingSheet6_sign1DeputyTechDirClick(
  Sender: TObject);
begin
  inherited;
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet6',
    'В.Л. Мануйленко', 'Перший заступник директора технічного');
end;


procedure TfrmENServicesConnectionEdit.mniAccompanyingSheet6_signDeputyTechDirConnectionClick(
  Sender: TObject);
begin
  inherited;
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet6',
    'В.А. Кічіянц', 'Заступник директора технічного');
end;


procedure TfrmENServicesConnectionEdit.mniAccompanyingSheet6_signOtherClick(
  Sender: TObject);
begin
  inherited;
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet6', '', '');
end;


procedure TfrmENServicesConnectionEdit.mniAccompanyingSheet6_signTechDirClick(
  Sender: TObject);
begin
  inherited;
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet6',
    'В.Д. Гончаров', 'Директор технічний');
end;


procedure TfrmENServicesConnectionEdit.N110Click(Sender: TObject);
begin
   showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet5',
    'В.Л. Мануйленко', 'Перший заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.N111Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet6',
    'В.Л. Мануйленко', 'Перший заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.N112Click(Sender: TObject);
begin
   showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet7',
    'В.Л. Мануйленко', 'Перший заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.N113Click(Sender: TObject);
begin
   showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet8',
    'В.Л. Мануйленко', 'Перший заступник директора технічного');

end;

procedure TfrmENServicesConnectionEdit.N114Click(Sender: TObject);
begin
   showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheetAdditionalAgreementAccountPayNoStandart2',
    'В.Л. Мануйленко', 'Перший заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.N69Click(Sender: TObject);
begin
     showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheetAdditionalAgreementAccountPayNoStandart1',
    'В.Л. Мануйленко', 'Перший заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.N70Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheetAdditionalAgreementAccountPayNoStandart2',
    'В.Д. Гончаров', 'Директор технічний');
end;

procedure TfrmENServicesConnectionEdit.N71Click(Sender: TObject);
begin
 showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheetAdditionalAgreementAccountPayNoStandart2',
    'В.А. Кічіянц', 'Заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.N72Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheetAdditionalAgreementAccountPayNoStandart2', '', '');
end;

procedure TfrmENServicesConnectionEdit.N73Click(Sender: TObject);
var argNames, args: EnergyproController.ArrayOfString;
    reportName, pathFileName: String;
    copystr: String;
begin
  if ENServicesConnectionObj = nil then Exit;
  if ENServicesConnectionObj.contractTypeRef = nil then Exit;
  if ENServicesConnectionObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesConnectionObj.calcTypeRef = nil then Exit;
  if ENServicesConnectionObj.calcTypeRef.code = LOW_INT then Exit;

  /////
  if ENServicesConnectionObj.contractStatusRef = nil then Exit;

  if ENServicesConnectionObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

  ///// 14.05.13 NET-4235
  if (ENServicesConnectionObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT) then
  begin
    // Печать расчета - только при статусах "Работы выполнены" и "Оплаченный"
    if (ENServicesConnectionObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_COMPLETED) and
       (ENServicesConnectionObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_PAID) then
      raise Exception.Create('NET-4235 Для друку остаточного рахунку договір повинен мати статус "Роботи виконані" або "Сплачений"!');
  end;
  /////

  if ENServicesConnectionObj.contractTypeRef.code <> ENSERVICESOBJECTTYPE_CONNECTION then
  begin
    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'soCode';
    args[0] := IntToStr(ENServicesConnectionObj.code);

    if (ENServicesConnectionObj.calcTypeRef.code <> ENSERVICESOBJECT_CALCTYPE_BY_FACT) then begin
    {06.07.2018 Для нового расчета будет печататься новая форма счета
      с учетом НДС для каждой калькуляции}
      if Self.isTKCalcKindNew then begin
        reportName := 'Services/Bill/rah_calc_new';
      end else begin
        reportName := 'Services/Bill/rah';
      end;
    end else begin
      reportName := 'Services/Bill/rahFinal';
    end;
    //SUPP-84438
    if Application.MessageBox(PChar('Додати у "Вкладення"?'),
        PChar('Внимание!'),MB_ICONQUESTION+ MB_YESNO) = IDYES then
    begin
         pathFileName := makeReport(reportName, argNames, args, 'pdf');
         ENDocAttachmentObj := ENDocAttachment.Create;
         ENDocAttachment2ENServices := ENDocAttachment2ENServicesObject.Create;
         try
            frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
            frmDFDocAttachmentEdit.soCode := ENServicesConnectionObj.code;
            frmDFDocAttachmentEdit.edtFileName.Text := pathFileName;
            frmDFDocAttachmentEdit.edtCommentGen.Text := '';
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
    end
    else
        makeReport(reportName, argNames, args, 'pdf');
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
    if (ENTechConditionsServicesObj.connectionKindRef.code <> ENCONNECTIONKIND_STANDART) and
       (ENTechConditionsServicesObj.connectionKindRef.code <> ENCONNECTIONKIND_NO_STANDART_READY_MADE) then
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

              //SUPP-84438
              if Application.MessageBox(PChar('Додати у "Вкладення"?'),
                  PChar('Внимание!'),MB_ICONQUESTION+ MB_YESNO) = IDYES then
              begin
                   pathFileName := makeReport(reportName, argNames, args, 'pdf');
                   ENDocAttachmentObj := ENDocAttachment.Create;
                   ENDocAttachment2ENServices := ENDocAttachment2ENServicesObject.Create;
                   try
                      frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
                      frmDFDocAttachmentEdit.soCode := ENServicesConnectionObj.code;
                      frmDFDocAttachmentEdit.edtFileName.Text := pathFileName;
                      frmDFDocAttachmentEdit.edtCommentGen.Text := '';
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
              end
              else
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
      //SUPP-84438
      if Application.MessageBox(PChar('Додати у "Вкладення"?'),
          PChar('Внимание!'),MB_ICONQUESTION+ MB_YESNO) = IDYES then
      begin
           pathFileName := makeReport(reportName, argNames, args, 'pdf');
           ENDocAttachmentObj := ENDocAttachment.Create;
           ENDocAttachment2ENServices := ENDocAttachment2ENServicesObject.Create;
           try
              frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
              frmDFDocAttachmentEdit.soCode := ENServicesConnectionObj.code;
              frmDFDocAttachmentEdit.edtFileName.Text := pathFileName;
              frmDFDocAttachmentEdit.edtCommentGen.Text := '';
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
      end
      else
          makeReport(reportName, argNames, args, 'pdf');
    end;
  end;
end;

procedure TfrmENServicesConnectionEdit.N74Click(Sender: TObject);
var argNames, args: EnergyproController.ArrayOfString;
    reportName, pathFileName: String;
begin
    if ENServicesConnectionObj = nil then Exit;

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'agreeCode';
    args[0] := IntToStr(ENTechConditionsServicesObj.code);

    reportName := 'TechConditions/billPayNoStandartConnection';
    //SUPP-84438
    if Application.MessageBox(PChar('Додати у "Вкладення"?'),
        PChar('Внимание!'),MB_ICONQUESTION+ MB_YESNO) = IDYES then
    begin
         pathFileName := makeReport(reportName, argNames, args, 'pdf');
         ENDocAttachmentObj := ENDocAttachment.Create;
         ENDocAttachment2ENServices := ENDocAttachment2ENServicesObject.Create;
         try
            frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
            frmDFDocAttachmentEdit.soCode := ENServicesConnectionObj.code;
            frmDFDocAttachmentEdit.edtFileName.Text := pathFileName;
            frmDFDocAttachmentEdit.edtCommentGen.Text := '';
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
    end
    else
        makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmENServicesConnectionEdit.N75Click(Sender: TObject);
var
   argNames, args : EnergyproController.ArrayOfString; //Параметри
   reportName : String; //Путь к файлу *.jrxml-отчёта
   pathFileName : String;
   argCnt: Integer; //Количество параметров отчёта
begin
  frmEditENFaxMessage := TfrmEditENFaxMessage.Create(Application, dsEdit);
  try
    if frmEditENFaxMessage.ShowModal = mrOk then
      begin
        reportName := 'TechConditions/connectionFaxMessage';
        argCnt :=11;
        SetLength(argNames, argCnt);
        SetLength(args, argCnt);

        argNames[0] := 'agreeCode';
        args[0] := IntToStr(ENServicesConnectionObj.code);
        argNames[1] := 'urgently';
        if frmEditENFaxMessage.ChBxQuickly.Checked = True then
           args[1] := 'true'
        else
          args[1] := 'false';
        argNames[2] := 'forFamiliarization';
        if frmEditENFaxMessage.ChBxAcquaintance.Checked = True then
           args[2] := 'true'
        else
          args[2] := 'false';
        argNames[3] := 'confirmReceipt';
        if frmEditENFaxMessage.ChBxConfirmReceipt.Checked = True then
           args[3] := 'true'
        else
          args[3] := 'false';
        argNames[4] := 'returnWithLabels';
        if frmEditENFaxMessage.ChBxReturnMarks.Checked = True then
           args[4] := 'true'
        else
          args[4] := 'false';
        argNames[5] := 'signer';
        if frmEditENFaxMessage.edtSigner.Text <> '' then
           args[5] := frmEditENFaxMessage.edtSigner.Text
        else
          args[5] := '';
        argNames[6] := 'signerPost';
        if frmEditENFaxMessage.memPost.Text <> '' then
           args[6] := frmEditENFaxMessage.memPost.Text
        else
          args[6] := '';
        argNames[7] := 'availabilityData';
        if frmEditENFaxMessage.memRegNumContract_SPL_PP.Text <> '' then
           args[7] := frmEditENFaxMessage.memRegNumContract_SPL_PP.Text
        else
          args[7] := '';
        argNames[8] := 'contactPhone';
        if frmEditENFaxMessage.edtContactTel.Text <> '' then
           args[8] := frmEditENFaxMessage.edtContactTel.Text
        else
          args[8] := '';
        argNames[9] := 'additionalInformation';
        if frmEditENFaxMessage.memRemark.Text <> '' then
           args[9] := frmEditENFaxMessage.memRemark.Text
        else
          args[9] := '';
        argNames[10] := 'faxNumber';
        if frmEditENFaxMessage.edtFaxNum.Text <> '' then
           args[10] := frmEditENFaxMessage.edtFaxNum.Text
        else
          args[10] := '';

        //SUPP-84438
        if Application.MessageBox(PChar('Додати у "Вкладення"?'),
            PChar('Внимание!'),MB_ICONQUESTION+ MB_YESNO) = IDYES then
        begin
             pathFileName := makeReport(reportName, argNames, args, 'pdf');
             ENDocAttachmentObj := ENDocAttachment.Create;
             ENDocAttachment2ENServices := ENDocAttachment2ENServicesObject.Create;
             try
                frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
                frmDFDocAttachmentEdit.soCode := ENServicesConnectionObj.code;
                frmDFDocAttachmentEdit.edtFileName.Text := pathFileName;
                frmDFDocAttachmentEdit.edtCommentGen.Text := '';
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
        end
        else
            makeReport(reportName, argNames, args, 'pdf');
      end; //if frmEditENFaxMessage.ShowModal = mrOk then
  finally
    frmEditENFaxMessage.Free;
    frmEditENFaxMessage := nil;
  end;
end;

procedure TfrmENServicesConnectionEdit.N76Click(Sender: TObject);
var
   argNames, args : EnergyproController.ArrayOfString; //Параметри
   reportName, pathFileName : String; //Путь к файлу *.jrxml-отчёта
   argCnt: Integer; //Количество параметров отчёта
begin
  frmEditENPrintPlanTaskConnection := TfrmEditENPrintPlanTaskConnection.Create(Application, dsEdit);
  try
    if frmEditENPrintPlanTaskConnection.ShowModal = mrOk then
      begin
        reportName := 'TechConditions/enPrintPlanTaskConnection';
        argCnt :=13;
        SetLength(argNames, argCnt);
        SetLength(args, argCnt);

        argNames[0] := 'ensoCode';
        args[0] := IntToStr(ENServicesConnectionObj.code);
        argNames[1] := 'verifedPost';
        if frmEditENPrintPlanTaskConnection.mmoVerifedPost.Text <> '' then
           args[1] := frmEditENPrintPlanTaskConnection.mmoVerifedPost.Text
        else
          args[1] := '';
        argNames[2] := 'verifed';
        if frmEditENPrintPlanTaskConnection.edtVerifed.Text <> '' then
           args[2] := frmEditENPrintPlanTaskConnection.edtVerifed.Text
        else
          args[2] := '';
        argNames[3] := 'startworkdate';
        if frmEditENPrintPlanTaskConnection.dtpStartWorkDate.Checked then
           args[3] := DateToStr(frmEditENPrintPlanTaskConnection.dtpStartWorkDate.Date)
        else
          args[3] := '';
        argNames[4] := 'finishworkdate';
        if frmEditENPrintPlanTaskConnection.dtpFinishWorkDate.Checked then
           args[4] := DateToStr(frmEditENPrintPlanTaskConnection.dtpFinishWorkDate.Date)
        else
          args[4] := '';
        argNames[5] := 'signerPost';
        if frmEditENPrintPlanTaskConnection.mmoSignerPost.Text <> '' then
           args[5] := frmEditENPrintPlanTaskConnection.mmoSignerPost.Text
        else
          args[5] := '';
        argNames[6] := 'signerPost2';
        if frmEditENPrintPlanTaskConnection.mmoSignerPost2.Text <> '' then
           args[6] := frmEditENPrintPlanTaskConnection.mmoSignerPost2.Text
        else
          args[6] := '';
        argNames[7] := 'signerPost3';
        if frmEditENPrintPlanTaskConnection.mmoSignerPost3.Text <> '' then
           args[7] := frmEditENPrintPlanTaskConnection.mmoSignerPost3.Text
        else
          args[7] := '';
        argNames[8] := 'signer';
        if frmEditENPrintPlanTaskConnection.edtSigner.Text <> '' then
           args[8] := frmEditENPrintPlanTaskConnection.edtSigner.Text
        else
          args[8] := '';
        argNames[9] := 'signer2';
        if frmEditENPrintPlanTaskConnection.cbNames.Text <> '' then
           args[9] := frmEditENPrintPlanTaskConnection.cbNames.Text
        else
          args[9] := '';
        argNames[10] := 'signer3';
        if frmEditENPrintPlanTaskConnection.edtSigner3.Text <> '' then
           args[10] := frmEditENPrintPlanTaskConnection.edtSigner3.Text
        else
          args[10] := '';
        argNames[11] := 'permitDocumentation';
        if frmEditENPrintPlanTaskConnection.cbPermitDocumentation.Text <> '' then
           args[11] := frmEditENPrintPlanTaskConnection.cbPermitDocumentation.Text
        else
          args[11] := '';
        argNames[12] := 'otherText';
        if frmEditENPrintPlanTaskConnection.mmoOtherText.Text <> '' then
           args[12] := frmEditENPrintPlanTaskConnection.mmoOtherText.Text
        else
          args[12] := '';

         makeDFServiceNoteFromReport(reportName, argNames, args, 'pdf');
      end;
  finally
    frmEditENPrintPlanTaskConnection.Free;
    frmEditENPrintPlanTaskConnection := nil;
  end;
end;

procedure TfrmENServicesConnectionEdit.makeDFServiceNoteFromReport(reportName: String; argNames, args: EnergyproController.ArrayOfString; reportType: String);
var
  TempDFDocServiceNote: DFDocServiceNoteControllerSoapPort;
  request: EPReportRequestEx;
begin
  request := EPReportRequestEx.Create;
  try
    request.reportCode := 0;
    request.funcName := '/com/ksoe/energynet/reports/' + reportName + '.jasper';

    request.argNames := argNames;
    request.args := args;
    request.resultType := Low(Integer);
    request.reportType := reportType;

    TempDFDocServiceNote := HTTPRIODFDocServiceNote as DFDocServiceNoteControllerSoapPort;
    TempDFDocServiceNote.addServiceNoteFromReport(request);

  finally
    request.Free;
  end;
end;

procedure TfrmENServicesConnectionEdit.N77Click(Sender: TObject);
var
  TempENSO2Node: ENSO2NodeControllerSoapPort;
begin
  TempENSO2Node := HTTPRIOENSO2Node as ENSO2NodeControllerSoapPort;
  try
    ENSO2NodeObj := TempENSO2Node.getObject(StrToInt(sgENSO2Node.Cells[0,sgENSO2Node.Row]));
  except
    on EConvertError do Exit;
  end;

  try
    frmENSO2NodeEdit:=TfrmENSO2NodeEdit.Create(Application, dsEdit);
    frmENSO2NodeEdit.DisableControls([frmENSO2NodeEdit.edtCcNodeCode, frmENSO2NodeEdit.edtServicesName, frmENSO2NodeEdit.edtCCTowerCode]);
    try
      if frmENSO2NodeEdit.ShowModal = mrOk then
      begin
        if ENSO2NodeObj<>nil then
            updateNodes;
      end;
    finally
      frmENSO2NodeEdit.Free;
      frmENSO2NodeEdit:=nil;
    end;
  finally
    ENSO2NodeObj.Free;
  end;
end;

procedure TfrmENServicesConnectionEdit.N79Click(Sender: TObject);
Var TempENServicesCalculation: ENServicesObjectControllerSoapPort;
begin
  TempENServicesCalculation := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  try
    ENServicesConnectionObj := TempENServicesCalculation.getObject(Integer(sgENSO2NodeOthers.Objects[0,sgENSO2NodeOthers.Row]));

  except
    on EConvertError do Exit;
  end;


  frmENServicesConnectionEdit:=TfrmENServicesConnectionEdit.Create(Application, dsView);
  if (priconnections)
     then frmENServicesConnectionEdit.priconnections := True;

  try
    if frmENServicesConnectionEdit.ShowModal= mrOk then
      begin

      end;

  finally
    frmENServicesConnectionEdit.Free;
    frmENServicesConnectionEdit:=nil;
  end;
end;

procedure TfrmENServicesConnectionEdit.N82Click(Sender: TObject);
var argNames, args, reportNames: EnergyproController.ArrayOfString;
  pathFileName: String;
  i: Integer;
  TempENServicesObject: ENServicesObjectControllerSoapPort;
  TempENSOValues: ENSOValuesControllerSoapPort;
  ENSOValuesList: ENSOValuesShortList;
  soValuesFilter : ENSOValuesFilter;
begin
    SetLength(argNames, 2);
    SetLength(args, 2);
    SetLength(reportNames, 2);

    argNames[0] := 'agreeCode';
    args[0] := IntToStr(ENTechConditionsServicesObj.code);

    argNames[1] := 'printTechTermsDate';
    if chkPrintTechTermsDate.Checked then args[1] := 'True'
    else args[1] := 'False';

    TempENSOValues :=  HTTPRIOENSOValues as ENSOValuesControllerSoapPort;

    soValuesFilter := ENSOValuesFilter.Create;
    SetNullIntProps(soValuesFilter);
    SetNullXSProps(soValuesFilter);
    soValuesFilter.servicesobject := ENServicesObjectRef.Create;
    soValuesFilter.servicesobject.code := ENServicesConnectionObj.code;
    soValuesFilter.soValuesType := ENSOValuesTypeRef.Create;
    soValuesFilter.soValuesType.code := ENDATE_NUMBER_REGISTRATION_STATEMENT;

    ENSOValuesList := TempENSOValues.getScrollableFilteredList(soValuesFilter,0,-1);
    soValLastCount:=High(ENSOValuesList.list);

     if soValLastCount <= -1 then
     begin
          Application.MessageBox(PChar('Додайте дату та номер реєстрації заяви.'),
              PChar('Увага!'), MB_ICONWARNING);
          Exit;
     end;

     if (EncodeDate(ENSOValuesList.list[0].dateVal.Year, ENSOValuesList.list[0].dateVal.Month,
                          ENSOValuesList.list[0].dateVal.Day) < EncodeDate(2019,12,9)) then
    begin
          if ((StrToDate(XSDate2String(ENServicesConnectionObj.contractDateServices)) >= EncodeDate(2018, 4, 19)) and
              (StrToDate(XSDate2String(ENServicesConnectionObj.techConObjects.dateGen)) >= EncodeDate(2019, 1, 22))) then
          begin
            if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART) then
              reportNames[0] := 'TechConditions/NewConnection_022019/agree_standart_connection'
            else
               begin
                Application.MessageBox(PChar('Ця розрахункова формула вартості для приєднання, яке є стандартним!'),PChar('Увага!'), MB_ICONWARNING);
                Exit;
            end;
          end
          else
          if ((StrToDate(XSDate2String(ENServicesConnectionObj.contractDateServices)) >= EncodeDate(2018, 4, 19)) and
             (StrToDate(XSDate2String(ENServicesConnectionObj.techConObjects.dateGen)) < EncodeDate(2019, 1, 22))) then
          begin
            if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART) then
              reportNames[0] := 'TechConditions/NewConnection/agree_standart_connection'
            else
            begin
                Application.MessageBox(PChar('Ця розрахункова формула вартості для приєднання, яке є стандартним!'),PChar('Увага!'), MB_ICONWARNING);
                Exit;
            end;
          end
          else
          begin
            if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART) then
              reportNames[0] := 'TechConditions/agree_standart_connection'
            else
            begin
                Application.MessageBox(PChar('Ця розрахункова формула вартості для приєднання, яке є стандартним!'),PChar('Увага!'), MB_ICONWARNING);
                Exit;
            end;
          end;
    end;

    if (EncodeDate(ENSOValuesList.list[0].dateVal.Year, ENSOValuesList.list[0].dateVal.Month,
                          ENSOValuesList.list[0].dateVal.Day) >= EncodeDate(2019,12,9)) then
    begin
           if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART) then
           begin
                  reportNames[0] := 'TechConditions/NewConnection_09122019/agree_standart_connection';
           end;
    end;


    for i := 0 to High(reportNames) do
    begin
          if Application.MessageBox(PChar('Додати у "Вкладення"?'),
              PChar('Внимание!'),MB_ICONQUESTION+ MB_YESNO) = IDYES then
          begin
                 pathFileName := makeReport(reportNames[i], argNames, args, 'pdf');
                 ENDocAttachmentObj := ENDocAttachment.Create;
                 ENDocAttachment2ENServices := ENDocAttachment2ENServicesObject.Create;
                 try
                    frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
                    frmDFDocAttachmentEdit.soCode := ENServicesConnectionObj.code;
                    frmDFDocAttachmentEdit.edtFileName.Text := pathFileName;
                    frmDFDocAttachmentEdit.edtCommentGen.Text := '';
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
          end
          else
                makeReport(reportNames[i], argNames, args, 'pdf');
    end;

end;

procedure TfrmENServicesConnectionEdit.N14Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML( //http://jira:8080/browse/SUPP-39916
    'TechConditions/accompanyingSheet/accompanyingSheet2',
    'В.А. Кічіянц', 'Заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.N15Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet2',
    'В.Л. Мануйленко', 'Перший заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.N16Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet2',
    'В.Д. Гончаров', 'Директор технічний');
end;

procedure TfrmENServicesConnectionEdit.N17Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet2', '', '');
end;

procedure TfrmENServicesConnectionEdit.N19Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet5',
    'В.А. Кічіянц', 'Заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.N20Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet5',
    'В.Д. Гончаров', 'Директор технічний');
end;

procedure TfrmENServicesConnectionEdit.N211Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet3',
    'В.Л. Мануйленко', 'Перший заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.N212Click(Sender: TObject);
begin
    showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet4',
    'В.Л. Мануйленко', 'Перший заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.N213Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet9', '', '');
end;

procedure TfrmENServicesConnectionEdit.N214Click(Sender: TObject);
begin
         showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet9',
    'В.Л. Мануйленко', 'Перший заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.N215Click(Sender: TObject);
begin
      showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet9',
    'В.А. Кічіянц', 'Заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.N216Click(Sender: TObject);
begin
 showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet9',
    'В.Д. Гончаров', 'Директор технічний');
end;

procedure TfrmENServicesConnectionEdit.N217Click(Sender: TObject);
var argNames, args: EnergyproController.ArrayOfString;
    reportName, pathFileName: String;
soValues : ENSOValuesShortList;
isNewCalc : Boolean;
begin
 if ENServicesConnectionObj = nil then Exit;

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'agreeCode';
    args[0] := IntToStr(ENTechConditionsServicesObj.code);

        soValues := getENSOValuesList(ENSOValuesController.ArrayOfInteger.Create(ENSOVALUES_CONTRACT_REGISTRATION_DATE));

        if soValues.totalCount > 0 then
        begin
            if StrToDateTime(XSDateTimeWithDate2String(soValues.list[0].dateVal)) >= EncodeDateTime(2020, 7, 1, 0, 0, 0, 0)
              then  isNewCalc := True
              else isNewCalc := False;
        end
         else isNewCalc := False;

     if isNewCalc = True then
     begin
        reportName := 'TechConditions/additionalAgreements/01072020/dodatok2AdditionalAgreementContract'
     end
    else if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART) then
        reportName := 'TechConditions/additionalAgreements/dodatok2AdditionalAgreementContract'
    else
    begin
        Application.MessageBox(PChar('Ця розрахункова формула вартості для приєднання, яке є стандартним!'),PChar('Увага!'), MB_ICONWARNING);
        Exit;
    end;

    //SUPP-84438
    if Application.MessageBox(PChar('Додати у "Вкладення"?'),
        PChar('Внимание!'),MB_ICONQUESTION+ MB_YESNO) = IDYES then
    begin
         pathFileName := makeReport(reportName, argNames, args, 'pdf');
         ENDocAttachmentObj := ENDocAttachment.Create;
         ENDocAttachment2ENServices := ENDocAttachment2ENServicesObject.Create;
         try
            frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
            frmDFDocAttachmentEdit.soCode := ENServicesConnectionObj.code;
            frmDFDocAttachmentEdit.edtFileName.Text := pathFileName;
            frmDFDocAttachmentEdit.edtCommentGen.Text := '';
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
    end
    else
        makeReport(reportName, argNames, args, 'pdf');

end;

procedure TfrmENServicesConnectionEdit.N22Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML( //http://jira:8080/browse/SUPP-39916
    'TechConditions/accompanyingSheet/accompanyingSheet3',
    'В.А. Кічіянц', 'Заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.N23Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet3',
    'В.Д. Гончаров', 'Директор технічний');
end;

procedure TfrmENServicesConnectionEdit.N24Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet3', '', '');
end;

procedure TfrmENServicesConnectionEdit.N26Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML( //http://jira:8080/browse/SUPP-39916
    'TechConditions/accompanyingSheet/accompanyingSheet4',
    'В.А. Кічіянц', 'Заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.N27Click(Sender: TObject);
begin
    showAccompanyingSheetJRXML( //http://jira:8080/browse/SUPP-39916
    'TechConditions/accompanyingSheet/accompanyingSheet4',
    'В.Д. Гончаров', 'Директор технічний');
end;

procedure TfrmENServicesConnectionEdit.N28Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet4', '', '');
end;

procedure TfrmENServicesConnectionEdit.N29Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet5', '', '');
end;

procedure TfrmENServicesConnectionEdit.N31Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet6',
    'В.А. Кічіянц', 'Заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.N32Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet6',
    'В.Д. Гончаров', 'Директор технічний');
end;

procedure TfrmENServicesConnectionEdit.N33Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet6', '', '');
end;

procedure TfrmENServicesConnectionEdit.N35Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet7', '', '');
end;

procedure TfrmENServicesConnectionEdit.N36Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet7',
    'В.Д. Гончаров', 'Директор технічний');
end;

procedure TfrmENServicesConnectionEdit.N37Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet7',
    'В.А. Кічіянц', 'Заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.N39Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet8', '', '');
end;

procedure TfrmENServicesConnectionEdit.N40Click(Sender: TObject);
begin
      showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet8',
    'В.Д. Гончаров', 'Директор технічний');
end;

procedure TfrmENServicesConnectionEdit.N41Click(Sender: TObject);
begin
      showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet8',
    'В.А. Кічіянц', 'Заступник директора технічного');

end;

procedure TfrmENServicesConnectionEdit.miAccompanyingSheetForAdditionalAgreement2Click(Sender: TObject);
begin
  inherited;
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheetForAdditionalAgreement2',
    'В.А. Кічіянц', 'Заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.miAdditionalAgreement1Click(
  Sender: TObject);
begin
  MakeAdditionalAgreement(ADDITIONAL_AGREEMENT_MATERIALS_DELAY);
end;

procedure TfrmENServicesConnectionEdit.miAdditionalAgreement2Click(
  Sender: TObject);
begin
  MakeAdditionalAgreement(ADDITIONAL_AGREEMENT_PROJECT_CHANGINGS);
end;

procedure TfrmENServicesConnectionEdit.miAdditionalAgreement3Click(
  Sender: TObject);
begin
  MakeAdditionalAgreement(ADDITIONAL_AGREEMENT_OVERLOADING);
end;

procedure TfrmENServicesConnectionEdit.miAccompanyingSheetForAdditionalAgreement1Click(Sender: TObject);
begin
  inherited;
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheetForAdditionalAgreement1',
    'В.А. Кічіянц', 'Заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.N49Click(Sender: TObject);
begin
      showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet10',
    'В.Д. Гончаров', 'Директор технічний');
end;

procedure TfrmENServicesConnectionEdit.N50Click(Sender: TObject);
begin
  inherited;
      showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet10',
    'В.А. Кічіянц', 'Заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.N51Click(Sender: TObject);
begin
  inherited;
      showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet10',
    'В.Л. Мануйленко', 'Перший заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.N52Click(Sender: TObject);
begin
  inherited;
           showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet10',
    '', '');
end;

procedure TfrmENServicesConnectionEdit.N54Click(Sender: TObject);
begin
  inherited;
   showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet11',
    'В.Д. Гончаров', 'Директор технічний');
end;

procedure TfrmENServicesConnectionEdit.N55Click(Sender: TObject);
begin
  inherited;
      showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet11',
    'В.А. Кічіянц', 'Заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.N56Click(Sender: TObject);
begin
  inherited;
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet11', '', '');
end;

procedure TfrmENServicesConnectionEdit.N58Click(Sender: TObject);
begin
  inherited;
    showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet12', '', '');
end;

procedure TfrmENServicesConnectionEdit.N59Click(Sender: TObject);
begin
  inherited;
        showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet12',
    'В.А. Кічіянц', 'Заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.N60Click(Sender: TObject);
begin
  inherited;
     showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet12',
    'В.Д. Гончаров', 'Директор технічний');
end;

procedure TfrmENServicesConnectionEdit.N61Click(Sender: TObject);
var argNames, args: EnergyproController.ArrayOfString;
    reportName, pathFileName: String;

  //TempTKClassification2ENDepartment: TKClassification2ENDepartmentControllerSoapPort;
  //i: Integer;
  //TKClass2DepFilter : TKClassification2ENDepartmentFilter;
  //TKClassification2ENDepartmentList: TKClassification2ENDepartmentShortList;

  //isReservedWorks : Boolean;
  //isVisitClient : Boolean;
  codePlanStr : string;
  isApprovProjectDoc : Boolean;
    TempENPlanWork2ClassificationType: ENPlanWork2ClassificationTypeControllerSoapPort;
    plan2ctFilter: ENPlanWork2ClassificationTypeFilter;
    plan2ctList: ENPlanWork2ClassificationTypeShortList;
    TempENServicesObject: ENServicesObjectControllerSoapPort;
  TempENSOValues: ENSOValuesControllerSoapPort;
  ENSOValuesList: ENSOValuesShortList;
  soValuesFilter : ENSOValuesFilter;
begin
  if ENServicesConnectionObj = nil then Exit;
  if ENServicesConnectionObj.contractTypeRef = nil then Exit;
  if ENServicesConnectionObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesConnectionObj.calcTypeRef = nil then Exit;
  if ENServicesConnectionObj.calcTypeRef.code = LOW_INT then Exit;

  /////
  if ENServicesConnectionObj.contractStatusRef = nil then Exit;

  if ENServicesConnectionObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

  if ENServicesConnectionObj.contractTypeRef.code <> ENSERVICESOBJECTTYPE_CONNECTION then
  begin

     isApprovProjectDoc:= False;
     codePlanStr:= '';
     codePlanStr:= IntToStr(DMReports.getPlanCodeForCalculationByElement(ENServicesConnectionObj.element.code));
   { // определим по класификациям в договоре есть ли там класификации для которых резервируется время (для них печатаются иные формы договоров.)
     TempTKClassification2ENDepartment :=  HTTPRIOTKClassification2ENDepartment as TKClassification2ENDepartmentControllerSoapPort;

       TKClass2DepFilter := TKClassification2ENDepartmentFilter.Create;
       SetNullIntProps(TKClass2DepFilter);
       SetNullXSProps(TKClass2DepFilter);

       TKClass2DepFilter.isJobsByTime := 1;
       TKClass2DepFilter.endepartmentRef := ENDepartment.Create;
       TKClass2DepFilter.endepartmentRef.code := ENServicesConnectionObj.department.code;
       TKClass2DepFilter.conditionSQL := 'TKCLASSIFICTN2NDPRTMNT.CLASSIFICATIONTYPERFCD in (Select p2c.classificationtyperfcd from enplanwork2classfctntp p2c where p2c.planrefcode =  ' +  codePlanStr + ' ) ';
       TKClassification2ENDepartmentList := TempTKClassification2ENDepartment.getScrollableFilteredList(TKClassification2ENDepartmentFilter(TKClass2DepFilter),0,-1);

     if  High(TKClassification2ENDepartmentList.list) > -1 then
         isReservedWorks  := True;
     // определим работа выполняется на месте или едем к заказчику
       TKClass2DepFilter := TKClassification2ENDepartmentFilter.Create;
       SetNullIntProps(TKClass2DepFilter);
       SetNullXSProps(TKClass2DepFilter);

       TKClass2DepFilter.isVisitClient := 1;
       TKClass2DepFilter.endepartmentRef := ENDepartment.Create;
       TKClass2DepFilter.endepartmentRef.code := ENServicesConnectionObj.department.code;
       TKClass2DepFilter.conditionSQL := 'TKCLASSIFICTN2NDPRTMNT.CLASSIFICATIONTYPERFCD in (Select p2c.classificationtyperfcd from enplanwork2classfctntp p2c where p2c.planrefcode =  ' +  codePlanStr + ' ) ';
       TKClassification2ENDepartmentList := TempTKClassification2ENDepartment.getScrollableFilteredList(TKClassification2ENDepartmentFilter(TKClass2DepFilter),0,-1);

     if  High(TKClassification2ENDepartmentList.list) > -1 then
         isVisitClient  := True;  }

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

    argNames[0] := 'plancode';
    args[0] := codePlanStr;

    if isJobsByTime then
    begin
        if FormatDateTime('hh:mm',edtTimeStart.DateTime) = '00:00' then
           begin
             Application.MessageBox(PChar('Неможливо надрукувати договір. Треба визначити інтервал часу прибуття (З) !'),PChar('Внимание!'), MB_ICONWARNING);
             Exit;
           end;
        if FormatDateTime('hh:mm',edtTimeFinal.DateTime) = '00:00' then
           begin
             Application.MessageBox(PChar('Неможливо надрукувати договір. Треба визначити інтервал часу прибуття (ПО) !'),PChar('Внимание!'), MB_ICONWARNING);
             Exit;
           end;
    end;


    // если обычные работы
    if not isJobsByTime then
    begin
        if isApprovProjectDoc = False then
        begin
          if ENServicesConnectionObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_CALCULATION then
          begin
            //if (rgContragentType.ItemIndex = 0) then
            if ENServicesConnectionObj.contragentTypeRef.code in [ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL,
                                                              ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL_NOREZIDENT] then
              reportName := 'Services/Agree/d_fiz'
            else
              reportName := 'Services/Agree/d1';
          end
          else begin
            //if (rgContragentType.ItemIndex = 0) then
            if ENServicesConnectionObj.contragentTypeRef.code in [ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL,
                                                              ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL_NOREZIDENT] then
            begin
              if (StrToDate(XSDate2String(ENServicesConnectionObj.contractDateServices)) >= EncodeDate(2013, 9, 17)) then
                reportName := 'Services/Agree/agree_fiz_17092013/d_fiz2'
              else
                reportName := 'Services/Agree/d_fiz2';
            end

            else if ENServicesConnectionObj.contragentTypeRef.code = ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET then
              reportName := 'Services/Agree/d1_yur_budjet'
            else
              reportName := 'Services/Agree/d1_yur_notbudjet';
          end;
        end
        else begin

           if ENServicesConnectionObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_CALCULATION then
             reportName := 'Services/Agree/dApprovProjectDoc'
           else begin
             if ENServicesConnectionObj.contragentTypeRef.code = ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET then
               reportName := 'Services/Agree/dApprovProjectDoc_budjet'
             else
               reportName := 'Services/Agree/dApprovProjectDoc_notbudjet';
           end;
        end;


    end;

    // если работы с резервированием времени
    if  ((isJobsByTime ) and ( isVisitClient )) then
    begin

      if ENServicesConnectionObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_CALCULATION then
      begin
        //if (rgContragentType.ItemIndex = 0) then
        if ENServicesConnectionObj.contragentTypeRef.code in [ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL,
                                                          ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL_NOREZIDENT] then
          reportName := 'Services/AgreeByTime/d_fiz'
        else
          reportName := 'Services/AgreeByTime/d1';
      end
      else begin
        //if (rgContragentType.ItemIndex = 0) then
        if ENServicesConnectionObj.contragentTypeRef.code in [ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL,
                                                          ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL_NOREZIDENT] then

          begin
            if (StrToDate(XSDate2String(ENServicesConnectionObj.contractDateServices)) >= EncodeDate(2013, 9, 17)) then
              reportName := 'Services/AgreeByTime/agree_fiz_17092013/d_fiz2'
            else
              reportName := 'Services/AgreeByTime/d_fiz2';
          end

        else if ENServicesConnectionObj.contragentTypeRef.code = ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET then
          reportName := 'Services/AgreeByTime/d1_yur_budjet'
        else
          reportName := 'Services/AgreeByTime/d1_yur_notbudjet';
      end;

    end;


    //  надання послуг з погодження проектної документації

     TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    // перед печатью договоров проверим правильно ли подвязали счетчики под класификации если это классификации такие что для их выполнения нужно передавать счетчик


     TempENServicesObject.checkGiveCounters(ENServicesConnectionObj.code);

     //SUPP-84438
     if Application.MessageBox(PChar('Додати у "Вкладення"?'),
        PChar('Внимание!'),MB_ICONQUESTION+ MB_YESNO) = IDYES then
     begin
          pathFileName := makeReport(reportName, argNames, args, 'pdf');
          ENDocAttachmentObj := ENDocAttachment.Create;
          ENDocAttachment2ENServices := ENDocAttachment2ENServicesObject.Create;
          try
             frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
             frmDFDocAttachmentEdit.soCode := ENServicesConnectionObj.code;
             frmDFDocAttachmentEdit.edtFileName.Text := pathFileName;
             frmDFDocAttachmentEdit.edtCommentGen.Text := '';
             try
                frmDFDocAttachmentEdit.ShowModal;
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
        end
        else
            makeReport(reportName, argNames, args, 'pdf');
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

    SetLength(argNames, 2);
    SetLength(args, 2);

    argNames[0] := 'agreeCode';
    args[0] := IntToStr(ENTechConditionsServicesObj.code);

    argNames[1] := 'printTechTermsDate';
    if chkPrintTechTermsDate.Checked then args[1] := 'True'
    else args[1] := 'False';

    //SUPP-88213
    TempENSOValues :=  HTTPRIOENSOValues as ENSOValuesControllerSoapPort;

     soValuesFilter := ENSOValuesFilter.Create;
     SetNullIntProps(soValuesFilter);
     SetNullXSProps(soValuesFilter);
     soValuesFilter.servicesobject := ENServicesObjectRef.Create;
     soValuesFilter.servicesobject.code := ENServicesConnectionObj.code;
     soValuesFilter.soValuesType := ENSOValuesTypeRef.Create;
     soValuesFilter.soValuesType.code := ENDATE_NUMBER_REGISTRATION_STATEMENT;

    ENSOValuesList := TempENSOValues.getScrollableFilteredList(soValuesFilter,0,-1);
    soValLastCount:=High(ENSOValuesList.list);

     if soValLastCount <= -1 then
     begin
          Application.MessageBox(PChar('Додайте дату та номер реєстрації заяви.'),
              PChar('Увага!'), MB_ICONWARNING);
          Exit;
     end;


    if (EncodeDate(ENSOValuesList.list[0].dateVal.Year, ENSOValuesList.list[0].dateVal.Month,
                          ENSOValuesList.list[0].dateVal.Day) < EncodeDate(2019,12,9)) then
    begin
          if ((StrToDate(XSDate2String(ENServicesConnectionObj.contractDateServices)) >= EncodeDate(2018, 4, 19)) and
              (StrToDate(XSDate2String(ENServicesConnectionObj.techConObjects.dateGen)) >= EncodeDate(2019, 1, 22))) then
          begin
            if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART) then
              reportName := 'TechConditions/NewConnection_022019/agree_standart_connection'
            else if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_NO_STANDART) then
              reportName := 'TechConditions/NewConnection_022019/agree_no_standart_connection'
            else if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_NO_STANDART_READY_MADE) then
              reportName := 'TechConditions/NewConnection_022019/agree_no_standart_connection_ready_made'
          end
          else
          if ((StrToDate(XSDate2String(ENServicesConnectionObj.contractDateServices)) >= EncodeDate(2018, 4, 19)) and
             (StrToDate(XSDate2String(ENServicesConnectionObj.techConObjects.dateGen)) < EncodeDate(2019, 1, 22))) then
          begin
            if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART) then
              reportName := 'TechConditions/NewConnection/agree_standart_connection'
            else if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_NO_STANDART) then
              reportName := 'TechConditions/NewConnection/agree_no_standart_connection'
            else if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_NO_STANDART_READY_MADE) then
              reportName := 'TechConditions/NewConnection/agree_no_standart_connection_ready_made'
          end
          else
          begin
            if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART) then
              reportName := 'TechConditions/agree_standart_connection'
            else if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_NO_STANDART) then
              reportName := 'TechConditions/agree_no_standart_connection'
          end;
    end;

    if (EncodeDate(ENSOValuesList.list[0].dateVal.Year, ENSOValuesList.list[0].dateVal.Month,
                          ENSOValuesList.list[0].dateVal.Day) >= EncodeDate(2019,12,9)) then
    begin
           if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART) then
              reportName := 'TechConditions/NewConnection_09122019/agree_standart_connection'
           else if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_NO_STANDART) then
              reportName := 'TechConditions/NewConnection_09122019/agree_no_standart_connection'
           else if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_NO_STANDART_READY_MADE) then
              reportName := 'TechConditions/NewConnection_09122019/agree_no_standart_connection_ready_made'
    end;

    //SUPP-93010
    if (EncodeDate(ENSOValuesList.list[0].dateVal.Year, ENSOValuesList.list[0].dateVal.Month,
                          ENSOValuesList.list[0].dateVal.Day) >= EncodeDate(2020,7,1)) then
    begin
           if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_NO_STANDART) then
              reportName := 'TechConditions/NewConnection_01072020/agree_no_standart_connection'
           else if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_NO_STANDART_READY_MADE) then
              reportName := 'TechConditions/NewConnection_01072020/agree_no_standart_connection_ready_made'
           else if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART) then
              reportName := 'TechConditions/NewConnection_01072020/agree_standart_connection'
    end;

    //SUPP-84438
    if Application.MessageBox(PChar('Додати у "Вкладення"?'),
        PChar('Внимание!'),MB_ICONQUESTION+ MB_YESNO) = IDYES then
    begin
         pathFileName := makeReport(reportName, argNames, args, 'pdf');
         ENDocAttachmentObj := ENDocAttachment.Create;
         ENDocAttachment2ENServices := ENDocAttachment2ENServicesObject.Create;
         try
            frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
            frmDFDocAttachmentEdit.soCode := ENServicesConnectionObj.code;
            frmDFDocAttachmentEdit.edtFileName.Text := pathFileName;
            frmDFDocAttachmentEdit.edtCommentGen.Text := '';
            try
               frmDFDocAttachmentEdit.ShowModal;
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
    end
    else
        makeReport(reportName, argNames, args, 'pdf');
  end;
end;

procedure TfrmENServicesConnectionEdit.N62Click(Sender: TObject);
var argNames, args: EnergyproController.ArrayOfString;
    reportName, pathFileName: String;
begin
    if ENServicesConnectionObj = nil then Exit;

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'agreeCode';
    args[0] := IntToStr(ENServicesConnectionObj.code);

    if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_NO_STANDART) then
        reportName := 'TechConditions/additionalAgreements/dodatok1AdditionalAgreementContract'
    else
    begin
        Application.MessageBox(PChar('Ця розрахункова формула вартості для приєднання, яке є не стандартним!'),PChar('Увага!'), MB_ICONWARNING);
        Exit;
    end;

    //SUPP-84438
    if Application.MessageBox(PChar('Додати у "Вкладення"?'),
        PChar('Внимание!'),MB_ICONQUESTION+ MB_YESNO) = IDYES then
    begin
         pathFileName := makeReport(reportName, argNames, args, 'pdf');
         ENDocAttachmentObj := ENDocAttachment.Create;
         ENDocAttachment2ENServices := ENDocAttachment2ENServicesObject.Create;
         try
            frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
            frmDFDocAttachmentEdit.soCode := ENServicesConnectionObj.code;
            frmDFDocAttachmentEdit.edtFileName.Text := pathFileName;
            frmDFDocAttachmentEdit.edtCommentGen.Text := '';
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
    end
    else
        makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmENServicesConnectionEdit.N66Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheetAdditionalAgreementAccountPayNoStandart1',
    'В.А. Кічіянц', 'Заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.N67Click(Sender: TObject);
begin
 showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheetAdditionalAgreementAccountPayNoStandart1',
    'В.Д. Гончаров', 'Директор технічний');
end;

procedure TfrmENServicesConnectionEdit.N68Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheetAdditionalAgreementAccountPayNoStandart1', '', '');
end;

procedure TfrmENServicesConnectionEdit.MainTreeAdvancedCustomDrawItem(
  Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
  Stage: TCustomDrawStage; var PaintImages, DefaultDraw: Boolean);
begin
  if (Node.Parent<>nil) and (CCNodeExtShort(Node.Parent.Data).isGroup=1) then
  begin
    // От группы
    if CCNodeExtShort(Node.Data).parentnodeCode = CCNodeExtShort(Node.Parent.Parent.Data).code then
    begin
       // Узел в составе группы
       if (CCNodeExtShort(Node.Data).parentnodeCode<>CCNodeExtShort(Node.Data).parentnormalCode) then
       begin
          // причем находится в оперативном переключении
          Sender.Canvas.Font.Color := TColor($0080FF)
       end
    end
    else
       // Узла нет в составе группы
       Sender.Canvas.Font.Color := TColor($CCBBBB);
  end
  else
  begin
    // От обычного узла
    if (Node.Parent<>nil) and (CCNodeExtShort(Node.Data).parentnodeCode<>CCNodeExtShort(Node.Data).parentnormalCode) {and not (cdsSelected in State)} then
    begin
      if CCNodeExtShort(Node.Data).parentnodeCode = CCNodeExtShort(Node.Parent.Data).code then
        // Узел в оперативном переключении, текущее положение
        Sender.Canvas.Font.Color := TColor($0080FF)
      else
        // Узел в оперативном переключении, положение по схеме норм. реж.
        Sender.Canvas.Font.Color := TColor($CCBBBB);
    end;
  end;

  //if not (cdsSelected in State) then
  if CCNodeExtShort(Node.Data).isOff in [0,1] then
  case CCNodeExtShort(Node.Data).isOff of
    1: begin
      //Sender.Canvas.Brush.Color:= TColor($C1C4FF);
      Node.StateIndex:=1;
    end;
    0: begin
      //Sender.Canvas.Brush.Color:= TColor($AAE8EE);
      Node.StateIndex:=2;
    end;
  end
  else
  if CCNodeExtShort(Node.Data).probablyOff in [0,1] then
  case CCNodeExtShort(Node.Data).probablyOff of
    1: begin
      Node.StateIndex:=3;
    end;
    0: begin
      Node.StateIndex:=4;
    end;
  end
  else
    Node.StateIndex:=-1;
end;

procedure TfrmENServicesConnectionEdit.MainTreeClick(Sender: TObject);
begin
  inherited;
   updateSO2NodeBySelectedNode;
end;

procedure TfrmENServicesConnectionEdit.MainTreeExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  inherited;
    UpdateMainTreeBranch(Node);
end;

procedure TfrmENServicesConnectionEdit.MainTreeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   Item: TTreeNode;
begin
   Item := MainTree.GetNodeAt(X, Y);
   if Assigned(Item) then
   Item.Selected := True
end;

procedure TfrmENServicesConnectionEdit.MakeAdditionalAgreement(agreementType : Integer);
var
argNames, args : EnergyproController.ArrayOfString;
pathFileName: String;
begin
  SetLength(argNames, 2);
  SetLength(args, 2);
  argNames[0] := 'servicesObjectCode';
  argNames[1] := 'agreementType';
  args[0] := IntToStr(ENServicesConnectionObj.code);
  args[1] := IntToStr(agreementType);
  //SUPP-84438
  if Application.MessageBox(PChar('Додати у "Вкладення"?'),
     PChar('Внимание!'),MB_ICONQUESTION+ MB_YESNO) = IDYES then
  begin
       pathFileName := makeReport('TechConditions/additionalAgreements/AdditionalAgreement', argNames, args, 'pdf');
       ENDocAttachmentObj := ENDocAttachment.Create;
       ENDocAttachment2ENServices := ENDocAttachment2ENServicesObject.Create;
       try
          frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
          frmDFDocAttachmentEdit.soCode := ENServicesConnectionObj.code;
          frmDFDocAttachmentEdit.edtFileName.Text := pathFileName;
          frmDFDocAttachmentEdit.edtCommentGen.Text := '';
          try
             frmDFDocAttachmentEdit.ShowModal;
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
  end
  else
       makeReport('TechConditions/additionalAgreements/AdditionalAgreement', argNames, args, 'pdf');
end;

procedure TfrmENServicesConnectionEdit.btnAccompanyingSheet1Click(
  Sender: TObject);
begin
  pmAccSheet.Popup(
    gbPrint.Left - gbPrint.Width * 2,
    btnAccompanyingSheet1.Top + 2 * btnAccompanyingSheet1.Height);
end;

procedure TfrmENServicesConnectionEdit.btnActPriPerCountersClick(Sender: TObject);
var argNames, args: EnergyproController.ArrayOfString;
    reportName: String;
begin
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'enservicesobjectcode';
  args[0] := IntToStr(ENServicesConnectionObj.code);

  reportName :=  'Calculation/ActPriPerCounters';
  makeReport(reportName , argNames , args , 'pdf');
end;


procedure TfrmENServicesConnectionEdit.btnAgreeTechTermsPrepareClick(Sender: TObject);
var
  TempENServicesObject: ENServicesObjectControllerSoapPort;
  soCode, soNewCode: Integer;
  distance : TXSDecimal;
  createTU : Boolean;
begin
  createTU := False;
  soCode := ENServicesConnectionObj.code;
  soNewCode := 0;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    frmRecalcDistanceServicesConnectionEdit := TfrmRecalcDistanceServicesConnectionEdit.Create(Application, dsEdit);
    try
      frmRecalcDistanceServicesConnectionEdit.priconnections := False;
      frmRecalcDistanceServicesConnectionEdit.distance := TXSDecimal.Create;
      frmRecalcDistanceServicesConnectionEdit.distance.DecimalString := edtContractServicesDistance.Text;

      if frmRecalcDistanceServicesConnectionEdit.ShowModal= mrOk then
      begin
        distance := frmRecalcDistanceServicesConnectionEdit.distance;
        createTU := True;
      end;
    finally
      frmRecalcDistanceServicesConnectionEdit.Free;
      frmRecalcDistanceServicesConnectionEdit := nil;
    end;

  if createTU then begin
    try
      soNewCode := TempENServicesObject.copyTechTermsPrepareServiceObject(ENServicesConnectionObj.code, distance);
    except
      on EConvertError do Exit;
    end;
  end;

  if soNewCode > 0 then
  begin
    Application.MessageBox(PChar(
	    'На базе закрытого договора Присоединения' + #13#10 + 
		'создан договор Подготовки Технических Условий !'),
	  PChar('Внимание !'), MB_ICONINFORMATION + MB_OK);

    ModalResult := mrOk;
  end else
    ModalResult := mrCancel;
end;


procedure TfrmENServicesConnectionEdit.spbActWarrantNumberClick(Sender: TObject);
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
  try
    power := StrToFloat(edtContractServicesPower.Text);
  except
    on EConvertError do power := 0;
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
    f.departmentRef.code := ENServicesConnectionObj.department.code;

    if (rgContragentType.ItemIndex in [ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET,
                                      ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NONBUDGET,
                                      ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL_NOREZIDENT,
                                      ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NOREZIDENT]) and
      (ENServicesConnectionObj.department.code = ENDEPARTMENT_HGES) then
    begin
      f.departmentRef.code := ENDEPARTMENT_KSOE;
    end;
  end;

  if chbIsSea.Checked then
  begin
    f.departmentRef := ENDepartmentRef.Create();
    f.departmentRef.code := ENDEPARTMENT_KSOE;
  end;

  f.conditionSQL := ' warrantstatusrefcode = 0 and power >= ' + FloatToStr(power);

  frmENWarrantShow := TfrmENWarrantShow.Create(Application,fmNormal, f);
  DisableActions([frmENWarrantShow.actNoFilter]);

  try
    with frmENWarrantShow do
      if ShowModal = mrOk then
      begin
        try
          if ENTechAgreement2Services = nil then ENTechAgreement2Services := ENTechAgreement2ServicesObject.Create;

          ENTechAgreement2Services.actWarrantRef := ENWarrantRef.Create();
          ENTechAgreement2Services.actWarrantRef.code := StrToInt(GetReturnValue(sgENWarrant,0));

          //////////////////////////////////////////////////////
          ///   проверка даты доверенности с датой договора  ///
          ///     суммы в доверенности с суммой договора     ///
          //////////////////////////////////////////////////////

          if ENTechAgreement2Services.actWarrantRef.code <> LOW_INT then
          begin
            warrant := DMReports.getWarrantByCode(ENTechAgreement2Services.actWarrantRef.code);

            datContract.XSToNative(GetXSDate(Self.edtContractDateServices.DateTime));
            dtdatContract := EncodeDate(datContract.Year, datContract.Month, datContract.Day);
            dtdatWarrant := EncodeDate(warrant.dateFinal.Year, warrant.dateFinal.Month, warrant.dateFinal.Day);

            if (warrant.warrantStatusRef.code = WARRANT_INVALID) then
            begin
              Application.MessageBox(PChar('Довіреність недійсна!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                edtActWarrantNumber.Text := '';
                edtActWarrantFIO.Text := '';
                ENTechAgreement2Services.actWarrantRef.code := LOW_INT;
              Exit;
            end;

            if (dtdatContract > dtdatWarrant) then
            begin
              Application.MessageBox(PChar('Термін дії довіреності закінчився!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                edtActWarrantNumber.Text := '';
                edtActWarrantFIO.Text := '';
                ENTechAgreement2Services.actWarrantRef.code := LOW_INT;
              Exit;
            end;
          end;

          edtActWarrantNumber.Text := GetReturnValue(sgENWarrant,1);
          edtActWarrantFIO.Text := GetReturnValue(sgENWarrant,3);

        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENWarrantShow.Free;
  end;
end;


procedure TfrmENServicesConnectionEdit.spbActWarrantNumberGLClick(
  Sender: TObject);
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
  try
    power := StrToFloat(edtContractServicesPower.Text);
  except
    on EConvertError do power := 0;
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
    f.departmentRef.code := ENServicesConnectionObj.department.code;

    if (rgContragentType.ItemIndex in [ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET,
                                      ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NONBUDGET,
                                      ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL_NOREZIDENT,
                                      ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NOREZIDENT]) and
      (ENServicesConnectionObj.department.code = ENDEPARTMENT_HGES) then
    begin
      f.departmentRef.code := ENDEPARTMENT_KSOE;
    end;
  end;

  if chbIsSea.Checked then
  begin
    f.departmentRef := ENDepartmentRef.Create();
    f.departmentRef.code := ENDEPARTMENT_KSOE;
  end;

  f.conditionSQL := ' warrantstatusrefcode = 0 and power >= ' + FloatToStr(power);

  frmENWarrantShow := TfrmENWarrantShow.Create(Application,fmNormal, f);
  DisableActions([frmENWarrantShow.actNoFilter]);

  try
    with frmENWarrantShow do
      if ShowModal = mrOk then
      begin
        try
          if ENTechAgreement2ServicesGL = nil then ENTechAgreement2ServicesGL := ENTechAgreement2ServicesObject.Create;

          ENTechAgreement2ServicesGL.actWarrantRef := ENWarrantRef.Create();
          ENTechAgreement2ServicesGL.actWarrantRef.code := StrToInt(GetReturnValue(sgENWarrant,0));

          //////////////////////////////////////////////////////
          ///   проверка даты доверенности с датой договора  ///
          ///     суммы в доверенности с суммой договора     ///
          //////////////////////////////////////////////////////

          if ENTechAgreement2ServicesGL.actWarrantRef.code <> LOW_INT then
          begin
            warrant := DMReports.getWarrantByCode(ENTechAgreement2ServicesGL.actWarrantRef.code);

            datContract.XSToNative(GetXSDate(Self.edtContractDateServices.DateTime));
            dtdatContract := EncodeDate(datContract.Year, datContract.Month, datContract.Day);
            dtdatWarrant := EncodeDate(warrant.dateFinal.Year, warrant.dateFinal.Month, warrant.dateFinal.Day);

            if (warrant.warrantStatusRef.code = WARRANT_INVALID) then
            begin
              Application.MessageBox(PChar('Довіреність недійсна!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                edtActWarrantNumberGL.Text := '';
                edtActWarrantFIOGL.Text := '';
                ENTechAgreement2ServicesGL.actWarrantRef.code := LOW_INT;
              Exit;
            end;

            if (dtdatContract > dtdatWarrant) then
            begin
              Application.MessageBox(PChar('Термін дії довіреності закінчився!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                edtActWarrantNumberGL.Text := '';
                edtActWarrantFIOGL.Text := '';
                ENTechAgreement2ServicesGL.actWarrantRef.code := LOW_INT;
              Exit;
            end;
          end;

          edtActWarrantNumberGL.Text := GetReturnValue(sgENWarrant,1);
          edtActWarrantFIOGL.Text := GetReturnValue(sgENWarrant,3);

        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENWarrantShow.Free;
  end;
end;


procedure TfrmENServicesConnectionEdit.spbAgreementWarrantClick(Sender: TObject);
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
  try
    power := StrToFloat(edtContractServicesPower.Text);
  except
    on EConvertError do power := 0;
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
    f.departmentRef.code := ENServicesConnectionObj.department.code;

    if (rgContragentType.ItemIndex in [ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET,
                                      ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NONBUDGET,
                                      ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL_NOREZIDENT,
                                      ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NOREZIDENT]) and
      (ENServicesConnectionObj.department.code = ENDEPARTMENT_HGES) then
    begin
      f.departmentRef.code := ENDEPARTMENT_KSOE;
    end;
  end;

  if chbIsSea.Checked then
  begin
    f.departmentRef := ENDepartmentRef.Create();
    f.departmentRef.code := ENDEPARTMENT_KSOE;
  end;

  f.conditionSQL := ' warrantstatusrefcode = 0 and power >= ' + FloatToStr(power);

  frmENWarrantShow := TfrmENWarrantShow.Create(Application,fmNormal, f);
  DisableActions([frmENWarrantShow.actNoFilter]);

  try
    with frmENWarrantShow do
      if ShowModal = mrOk then
      begin
        try
          if ENTechAgreement2Services = nil then ENTechAgreement2Services := ENTechAgreement2ServicesObject.Create;

          ENTechAgreement2Services.agreementWarrantRef := ENWarrantRef.Create();
          ENTechAgreement2Services.agreementWarrantRef.code := StrToInt(GetReturnValue(sgENWarrant,0));

          //////////////////////////////////////////////////////
          ///   проверка даты доверенности с датой договора  ///
          ///     суммы в доверенности с суммой договора     ///
          //////////////////////////////////////////////////////

          if ENTechAgreement2Services.agreementWarrantRef.code <> LOW_INT then
          begin
            warrant := DMReports.getWarrantByCode(ENTechAgreement2Services.agreementWarrantRef.code);

            datContract.XSToNative(GetXSDate(Self.edtContractDateServices.DateTime));
            dtdatContract := EncodeDate(datContract.Year, datContract.Month, datContract.Day);
            dtdatWarrant := EncodeDate(warrant.dateFinal.Year, warrant.dateFinal.Month, warrant.dateFinal.Day);

            if (warrant.warrantStatusRef.code = WARRANT_INVALID) then
            begin
              Application.MessageBox(PChar('Довіреність недійсна!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                edtAgreementWarrantNumber.Text := '';
                edtAgreementWarrantFIO.Text := '';
                ENTechAgreement2Services.agreementWarrantRef.code := LOW_INT;
              Exit;
            end;

            if (dtdatContract > dtdatWarrant) then
            begin
              Application.MessageBox(PChar('Термін дії довіреності закінчився!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                edtAgreementWarrantNumber.Text := '';
                edtAgreementWarrantFIO.Text := '';
                ENTechAgreement2Services.agreementWarrantRef.code := LOW_INT;
              Exit;
            end;
          end;

          edtAgreementWarrantNumber.Text := GetReturnValue(sgENWarrant,1);
          edtAgreementWarrantFIO.Text := GetReturnValue(sgENWarrant,3);

        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENWarrantShow.Free;
  end;
end;


procedure TfrmENServicesConnectionEdit.spbAgreementWarrantGLClick(
  Sender: TObject);
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
  try
    power := StrToFloat(edtContractServicesPower.Text);
  except
    on EConvertError do power := 0;
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
    f.departmentRef.code := ENServicesConnectionObj.department.code;

    if (rgContragentType.ItemIndex in [ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET,
                                      ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NONBUDGET,
                                      ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL_NOREZIDENT,
                                      ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NOREZIDENT]) and
      (ENServicesConnectionObj.department.code = ENDEPARTMENT_HGES) then
    begin
      f.departmentRef.code := ENDEPARTMENT_KSOE;
    end;
  end;

  if chbIsSea.Checked then
  begin
    f.departmentRef := ENDepartmentRef.Create();
    f.departmentRef.code := ENDEPARTMENT_KSOE;
  end;

  f.conditionSQL := ' warrantstatusrefcode = 0 and power >= ' + FloatToStr(power);

  frmENWarrantShow := TfrmENWarrantShow.Create(Application,fmNormal, f);
  DisableActions([frmENWarrantShow.actNoFilter]);

  try
    with frmENWarrantShow do
      if ShowModal = mrOk then
      begin
        try
          if ENTechAgreement2ServicesGL = nil then ENTechAgreement2ServicesGL := ENTechAgreement2ServicesObject.Create;

          ENTechAgreement2ServicesGL.agreementWarrantRef := ENWarrantRef.Create();
          ENTechAgreement2ServicesGL.agreementWarrantRef.code := StrToInt(GetReturnValue(sgENWarrant,0));

          //////////////////////////////////////////////////////
          ///   проверка даты доверенности с датой договора  ///
          ///     суммы в доверенности с суммой договора     ///
          //////////////////////////////////////////////////////

          if ENTechAgreement2ServicesGL.agreementWarrantRef.code <> LOW_INT then
          begin
            warrant := DMReports.getWarrantByCode(ENTechAgreement2ServicesGL.agreementWarrantRef.code);

            datContract.XSToNative(GetXSDate(Self.edtContractDateServices.DateTime));
            dtdatContract := EncodeDate(datContract.Year, datContract.Month, datContract.Day);
            dtdatWarrant := EncodeDate(warrant.dateFinal.Year, warrant.dateFinal.Month, warrant.dateFinal.Day);

            if (warrant.warrantStatusRef.code = WARRANT_INVALID) then
            begin
              Application.MessageBox(PChar('Довіреність недійсна!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                edtAgreementWarrantNumberGL.Text := '';
                edtAgreementWarrantFIOGL.Text := '';
                ENTechAgreement2ServicesGL.agreementWarrantRef.code := LOW_INT;
              Exit;
            end;

            if (dtdatContract > dtdatWarrant) then
            begin
              Application.MessageBox(PChar('Термін дії довіреності закінчився!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                edtAgreementWarrantNumberGL.Text := '';
                edtAgreementWarrantFIOGL.Text := '';
                ENTechAgreement2ServicesGL.agreementWarrantRef.code := LOW_INT;
              Exit;
            end;
          end;

          edtAgreementWarrantNumberGL.Text := GetReturnValue(sgENWarrant,1);
          edtAgreementWarrantFIOGL.Text := GetReturnValue(sgENWarrant,3);

        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENWarrantShow.Free;
  end;
end;


procedure TfrmENServicesConnectionEdit.spbAgreementWarrantNumberProjectClick(Sender: TObject);
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
  try
    power := StrToFloat(edtContractServicesPower.Text);
  except
    on EConvertError do power := 0;
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
    f.departmentRef.code := ENServicesConnectionObj.department.code;

    if (rgContragentType.ItemIndex in [ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET,
                                      ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NONBUDGET,
                                      ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL_NOREZIDENT,
                                      ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NOREZIDENT]) and
      (ENServicesConnectionObj.department.code = ENDEPARTMENT_HGES) then
    begin
      f.departmentRef.code := ENDEPARTMENT_KSOE;
    end;
  end;

  if chbIsSea.Checked then
  begin
    f.departmentRef := ENDepartmentRef.Create();
    f.departmentRef.code := ENDEPARTMENT_KSOE;
  end;

  f.conditionSQL := ' warrantstatusrefcode = 0 and power >= ' + FloatToStr(power);

  frmENWarrantShow := TfrmENWarrantShow.Create(Application,fmNormal, f);
  DisableActions([frmENWarrantShow.actNoFilter]);

  try
    with frmENWarrantShow do
      if ShowModal = mrOk then
      begin
        try
          if ENTechAgreement2ServicesProject = nil then ENTechAgreement2ServicesProject := ENTechAgreement2ServicesObject.Create;

          ENTechAgreement2ServicesProject.agreementWarrantRef := ENWarrantRef.Create();
          ENTechAgreement2ServicesProject.agreementWarrantRef.code := StrToInt(GetReturnValue(sgENWarrant,0));

          //////////////////////////////////////////////////////
          ///   проверка даты доверенности с датой договора  ///
          ///     суммы в доверенности с суммой договора     ///
          //////////////////////////////////////////////////////

          if ENTechAgreement2ServicesProject.agreementWarrantRef.code <> LOW_INT then
          begin
            warrant := DMReports.getWarrantByCode(ENTechAgreement2ServicesProject.agreementWarrantRef.code);

            datContract.XSToNative(GetXSDate(Self.edtContractDateServices.DateTime));
            dtdatContract := EncodeDate(datContract.Year, datContract.Month, datContract.Day);
            dtdatWarrant := EncodeDate(warrant.dateFinal.Year, warrant.dateFinal.Month, warrant.dateFinal.Day);

            if (warrant.warrantStatusRef.code = WARRANT_INVALID) then
            begin
              Application.MessageBox(PChar('Довіреність недійсна!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                edtAgreementWarrantNumberProject.Text := '';
                edtAgreementWarrantFIOProject.Text := '';
                ENTechAgreement2ServicesProject.agreementWarrantRef.code := LOW_INT;
              Exit;
            end;

            if (dtdatContract > dtdatWarrant) then
            begin
              Application.MessageBox(PChar('Термін дії довіреності закінчився!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                edtAgreementWarrantNumberProject.Text := '';
                edtAgreementWarrantFIOProject.Text := '';
                ENTechAgreement2ServicesProject.agreementWarrantRef.code := LOW_INT;
              Exit;
            end;
          end;

          edtAgreementWarrantNumberProject.Text := GetReturnValue(sgENWarrant,1);
          edtAgreementWarrantFIOProject.Text := GetReturnValue(sgENWarrant,3);

        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENWarrantShow.Free;
  end;
end;


procedure TfrmENServicesConnectionEdit.spbCNPackClick(Sender: TObject);
var frmCNPackShow: TfrmCNPackShow; f: CNPackFilter; condition: String;
begin
  if DialogState = dsView then Exit;
  f := CNPackFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  condition := '';
  //Для договоров подготовки ТУ фильтранем пакет по № договора о подготовке ТУ
  if ENServicesConnectionObj.contractTypeRef.code = ENSERVICESOBJECTTYPE_TU then
    begin
      if ENServicesConnectionObj.contractNumberServices <> '' then
        begin
          condition := '(p.reg_num_tu_creation_contract like ''%' +
            ENServicesConnectionObj.contractNumberServices + '%''';
          if ENServicesConnectionObj.contractNumber <> '' then
            condition := condition
              + ' or p.reg_num_tu_creation_contract like ''%'
              + ENServicesConnectionObj.contractNumber + '%''';
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
            ENServicesConnectionObj.cnPackCode :=
              StrToInt(GetReturnValue(sgCNPack, 1));
            if ENServicesConnectionObj.cnSubsystemTypeRef = nil then
              ENServicesConnectionObj.cnSubsystemTypeRef :=
                CNSubsystemTypeRef.Create;
            ENServicesConnectionObj.cnSubsystemTypeRef.code :=
              Integer(sgCNPack.Objects[4, sgCNPack.Row]);
          except
            on EConvertError do Exit;
          end;
        end;
    end;
  finally
    frmCNPackShow.Free;
  end;
end;

procedure TfrmENServicesConnectionEdit.spbInstallationTypeClearClick(
  Sender: TObject);
begin
  inherited;
   ENSOTechParamsObject.installationTypeRef := nil;
   edtInstallationType.Text := '';
end;

procedure TfrmENServicesConnectionEdit.spbInstallationTypeClick(
  Sender: TObject);
var
   frmENConnectionInstallationTypeShow: TfrmENConnectionInstallationTypeShow;
begin
   frmENConnectionInstallationTypeShow:=TfrmENConnectionInstallationTypeShow.Create(Application,fmNormal);
   try
      with frmENConnectionInstallationTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSOTechParamsObject = nil then ENSOTechParamsObject := ENSOTechParams.Create;
               if ENSOTechParamsObject.installationTypeRef = nil then
               ENSOTechParamsObject.installationTypeRef := ENConnectionInstallationTypeRef.Create();
               ENSOTechParamsObject.installationTypeRef.code := StrToInt(GetReturnValue(sgENConnectionInstallationType,0));
               edtInstallationType.Text:=GetReturnValue(sgENConnectionInstallationType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENConnectionInstallationTypeShow.Free;
   end;
end;

procedure TfrmENServicesConnectionEdit.spbLineTypeClearClick(Sender: TObject);
begin
  inherited;
   ENSOTechParamsObject.lineTypeRef := nil;
   edtLineType.Text := '';
end;

procedure TfrmENServicesConnectionEdit.spbLineTypeClick(Sender: TObject);
var
   frmENConnectionLineTypeShow: TfrmENConnectionLineTypeShow;
begin
   frmENConnectionLineTypeShow:=TfrmENConnectionLineTypeShow.Create(Application,fmNormal);
   try
      with frmENConnectionLineTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSOTechParamsObject = nil then ENSOTechParamsObject := ENSOTechParams.Create;
               if ENSOTechParamsObject.lineTypeRef = nil then
               ENSOTechParamsObject.lineTypeRef := ENConnectionLineTypeRef.Create();
               ENSOTechParamsObject.lineTypeRef.code := StrToInt(GetReturnValue(sgENConnectionLineType,0));
               edtLineType.Text:=GetReturnValue(sgENConnectionLineType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENConnectionLineTypeShow.Free;
   end;
end;

procedure TfrmENServicesConnectionEdit.spbLocationTypeClick(Sender: TObject);
var
   frmENConnectionLocationTypeShow: TfrmENConnectionLocationTypeShow;
begin
   frmENConnectionLocationTypeShow:=TfrmENConnectionLocationTypeShow.Create(Application,fmNormal);
   try
      with frmENConnectionLocationTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSOTechParamsObject = nil then ENSOTechParamsObject := ENSOTechParams.Create;
               if ENSOTechParamsObject.locationTypeRef = nil then
               ENSOTechParamsObject.locationTypeRef := ENConnectionLocationTypeRef.Create();
               ENSOTechParamsObject.locationTypeRef.code := StrToInt(GetReturnValue(sgENConnectionLocationType,0));
               edtLocationType.Text:=GetReturnValue(sgENConnectionLocationType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENConnectionLocationTypeShow.Free;
   end;
end;

procedure TfrmENServicesConnectionEdit.spbOrgNameProjectClick(Sender: TObject);
var
  orgId : Integer;
  frmRQOrgShow : TfrmRQOrgShow;
  //TempRQOrg : RQOrgControllerSoapPort;
  frmRQOrgRschetShow : TfrmRQOrgRschetShow;
  //TempRQOrgRschet : RQOrgRschetControllerSoapPort;
  partnerCode: String;
begin
  inherited;

  if ENTechAgreement2ServicesProject = nil then
    begin
      ENTechAgreement2ServicesProject := ENTechAgreement2ServicesObject.Create;
      ENTechAgreement2ServicesProject.code := LOW_INT;
    end;

  SetNullXSProps(ENTechAgreement2ServicesProject);
  SetNullIntProps(ENTechAgreement2ServicesProject);

  edtContractNumberProject.Text := '';
  ENTechAgreement2ServicesProject.contractNumber := '';
  ENTechAgreement2ServicesProject.contractDate := TXSDate.Create;
  ENTechAgreement2ServicesProject.contractDate := nil;
  ENTechAgreement2ServicesProject.finDocCode := '';
  ENTechAgreement2ServicesProject.finDocId := Low(Integer);
  ENTechAgreement2ServicesProject.commentGen := '';


  frmRQOrgShow := TfrmRQOrgShow.Create(Application,fmNormal);
  frmRQOrgShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
  try
    with frmRQOrgShow do
      if ShowModal = mrOk then
      begin
        try
          if ENTechAgreement2ServicesProject = nil then ENTechAgreement2ServicesProject := ENTechAgreement2ServicesObject.Create;
          if ENTechAgreement2ServicesProject.servicesObjectRef = nil then
            ENTechAgreement2ServicesProject.servicesObjectRef := ENServicesObjectRef.Create;

          ENTechAgreement2ServicesProject.servicesObjectRef.code := ENServicesConnectionObj.code;

          edtOrgNameProject.Text := GetReturnValue(sgRQOrg,1);

          ENTechAgreement2ServicesProject.partnerCode := GetReturnValue(sgRQOrg,8);
          ENTechAgreement2ServicesProject.partnerName := GetReturnValue(sgRQOrg,1);
          ENTechAgreement2ServicesProject.partnerOkpo := GetReturnValue(sgRQOrg,2);

          orgId := StrToInt(GetReturnValue(sgRQOrg,0));
          //partnerCode := GetReturnValue(sgRQOrg,8);
          partnerCode := GetReturnValue(sgRQOrg,25);
        except
          on EConvertError do Exit;
        end;

        if (orgId <> Low_Int) then
        begin
          frmRQOrgRschetShow := TfrmRQOrgRschetShow.Create(Application,fmNormal);
          try
            frmRQOrgRschetShow.FilterObject := RQOrgRschetFilter.Create;
            SetNullIntProps(frmRQOrgRschetShow.FilterObject);
            SetNullXSProps(frmRQOrgRschetShow.FilterObject);
            RQOrgRschetFilter(frmRQOrgRschetShow.FilterObject).orgId := orgId;
            RQOrgRschetFilter(frmRQOrgRschetShow.FilterObject).axOrgAccount := partnerCode;
            frmRQOrgRschetShow.Caption := 'Розрахункові рахунки';
            DisableActions([frmRQOrgRschetShow.actNoFilter], true);

            with frmRQOrgRschetShow do
               if ShowModal = mrOk then
               begin
                 try
                   edtRschetOrgProject.Text := GetReturnValue(sgRQOrgRschet,1);
                   edtMfoOrgProject.Text := GetReturnValue(sgRQOrgRschet,3);
                   edtBankOrgProject.Text := GetReturnValue(sgRQOrgRschet,2);

                   ENTechAgreement2ServicesProject.bankName := edtBankOrgProject.Text;
                   ENTechAgreement2ServicesProject.bankMfo := edtMfoOrgProject.Text;
                   ENTechAgreement2ServicesProject.bankRSchet := edtRschetOrgProject.Text;
                 except
                   on EConvertError do Exit;
                 end;
               end;
          finally
            frmRQOrgRschetShow.Free;
          end;
        end;
      end;
  finally
    frmRQOrgShow.Free;
  end;
end;


procedure TfrmENServicesConnectionEdit.spbRQOrgOrgClick(Sender: TObject);
var
  orgId : Integer;
  frmRQOrgShow : TfrmRQOrgShow;
  //TempRQOrg : RQOrgControllerSoapPort;
  frmRQOrgRschetShow : TfrmRQOrgRschetShow;
  //TempRQOrgRschet : RQOrgRschetControllerSoapPort;
  partnerCode: String;
begin
  inherited;

  if ENTechAgreement2Services = nil then
  begin
   ENTechAgreement2Services := ENTechAgreement2ServicesObject.Create;
   ENTechAgreement2Services.code := LOW_INT;
  end;

  edtTechContractNumber.Text := '';
  ENTechAgreement2Services.contractNumber := '';
  ENTechAgreement2Services.contractDate := TXSDate.Create;
  ENTechAgreement2Services.contractDate := nil;
  ENTechAgreement2Services.finDocCode := '';
  ENTechAgreement2Services.finDocId := Low(Integer);
  ENTechAgreement2Services.commentGen := '';


  frmRQOrgShow := TfrmRQOrgShow.Create(Application,fmNormal);
  frmRQOrgShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
  try
    with frmRQOrgShow do
      if ShowModal = mrOk then
      begin
        try
          if ENTechAgreement2Services = nil then ENTechAgreement2Services := ENTechAgreement2ServicesObject.Create;
          if ENTechAgreement2Services.servicesObjectRef = nil then
            ENTechAgreement2Services.servicesObjectRef := ENServicesObjectRef.Create;

          ENTechAgreement2Services.servicesObjectRef.code := ENServicesConnectionObj.code;

          ENTechAgreement2Services.finDocID := LOW_INT;

          edtRQOrgOrgName.Text := GetReturnValue(sgRQOrg,1);

          ENTechAgreement2Services.partnerCode := GetReturnValue(sgRQOrg,8);
          ENTechAgreement2Services.partnerName := GetReturnValue(sgRQOrg,1);
          ENTechAgreement2Services.partnerOkpo := GetReturnValue(sgRQOrg,2);

          orgId := StrToInt(GetReturnValue(sgRQOrg,0));
          //partnerCode := GetReturnValue(sgRQOrg,8);
          partnerCode := GetReturnValue(sgRQOrg,25);
        except
          on EConvertError do Exit;
        end;

        if (orgId <> Low_Int) then
        begin
          frmRQOrgRschetShow := TfrmRQOrgRschetShow.Create(Application,fmNormal);
          try
            frmRQOrgRschetShow.FilterObject := RQOrgRschetFilter.Create;
            SetNullIntProps(frmRQOrgRschetShow.FilterObject);
            SetNullXSProps(frmRQOrgRschetShow.FilterObject);
            RQOrgRschetFilter(frmRQOrgRschetShow.FilterObject).orgId := orgId;
            RQOrgRschetFilter(frmRQOrgRschetShow.FilterObject).axOrgAccount := partnerCode;
            frmRQOrgRschetShow.Caption := 'Розрахункові рахунки';
            DisableActions([frmRQOrgRschetShow.actNoFilter], true);

            with frmRQOrgRschetShow do
               if ShowModal = mrOk then
               begin
                 try
                   edtRschet.Text := GetReturnValue(sgRQOrgRschet,1);
                   edtMfo.Text := GetReturnValue(sgRQOrgRschet,3);
                   edtBank.Text := GetReturnValue(sgRQOrgRschet,2);

                   ENTechAgreement2Services.bankName := edtBank.Text;
                   ENTechAgreement2Services.bankMfo := edtMfo.Text;
                   ENTechAgreement2Services.bankRSchet := edtRschet.Text;
                 except
                   on EConvertError do Exit;
                 end;
               end;
          finally
            frmRQOrgRschetShow.Free;
          end;
        end;

      end;

  finally
    frmRQOrgShow.Free;
  end;
end;


procedure TfrmENServicesConnectionEdit.spbRQOrgOrgGLClick(Sender: TObject);
var
  orgId : Integer;
  frmRQOrgShow : TfrmRQOrgShow;
  //TempRQOrg : RQOrgControllerSoapPort;
  frmRQOrgRschetShow : TfrmRQOrgRschetShow;
  //TempRQOrgRschet : RQOrgRschetControllerSoapPort;
  partnerCode: String;
begin
  inherited;

  if ENTechAgreement2ServicesGL = nil then
  begin
    ENTechAgreement2ServicesGL := ENTechAgreement2ServicesObject.Create;
    ENTechAgreement2ServicesGL.code := LOW_INT;
  end;

  edtTechContractNumberGL.Text := '';
  ENTechAgreement2ServicesGL.contractNumber := '';
  ENTechAgreement2ServicesGL.contractDate := TXSDate.Create;
  ENTechAgreement2ServicesGL.contractDate := nil;
  ENTechAgreement2ServicesGL.finDocCode := '';
  ENTechAgreement2ServicesGL.finDocId := Low(Integer);
  ENTechAgreement2ServicesGL.commentGen := '';


  frmRQOrgShow := TfrmRQOrgShow.Create(Application,fmNormal);
  frmRQOrgShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
  try
    with frmRQOrgShow do
      if ShowModal = mrOk then
      begin
        try
          if ENTechAgreement2ServicesGL = nil then ENTechAgreement2ServicesGL := ENTechAgreement2ServicesObject.Create;
          if ENTechAgreement2ServicesGL.servicesObjectRef = nil then
            ENTechAgreement2ServicesGL.servicesObjectRef := ENServicesObjectRef.Create;

          ENTechAgreement2ServicesGL.servicesObjectRef.code := ENServicesConnectionObj.code;

          ENTechAgreement2ServicesGL.finDocID := LOW_INT;

          edtRQOrgOrgNameGL.Text := GetReturnValue(sgRQOrg,1);

          ENTechAgreement2ServicesGL.partnerCode := GetReturnValue(sgRQOrg,8);
          ENTechAgreement2ServicesGL.partnerName := GetReturnValue(sgRQOrg,1);
          ENTechAgreement2ServicesGL.partnerOkpo := GetReturnValue(sgRQOrg,2);
          ENTechAgreement2ServicesGL.partnerAddress := GetReturnValue(sgRQOrg,5);
          edtPartnerAddress.Text := ENTechAgreement2ServicesGL.partnerAddress;

          orgId := StrToInt(GetReturnValue(sgRQOrg,0));
          //partnerCode := GetReturnValue(sgRQOrg,8);
          partnerCode := GetReturnValue(sgRQOrg,25);
        except
          on EConvertError do Exit;
        end;

        if (orgId <> Low_Int) then
        begin
          frmRQOrgRschetShow := TfrmRQOrgRschetShow.Create(Application,fmNormal);
          try
            frmRQOrgRschetShow.FilterObject := RQOrgRschetFilter.Create;
            SetNullIntProps(frmRQOrgRschetShow.FilterObject);
            SetNullXSProps(frmRQOrgRschetShow.FilterObject);
            RQOrgRschetFilter(frmRQOrgRschetShow.FilterObject).orgId := orgId;
            RQOrgRschetFilter(frmRQOrgRschetShow.FilterObject).axOrgAccount := partnerCode;
            frmRQOrgRschetShow.Caption := 'Розрахункові рахунки';
            DisableActions([frmRQOrgRschetShow.actNoFilter], true);

            with frmRQOrgRschetShow do
               if ShowModal = mrOk then
               begin
                 try
                   edtRschetGL.Text := GetReturnValue(sgRQOrgRschet,1);
                   edtMfoGL.Text := GetReturnValue(sgRQOrgRschet,3);
                   edtBankGL.Text := GetReturnValue(sgRQOrgRschet,2);

                   ENTechAgreement2ServicesGL.bankName := edtBankGL.Text;
                   ENTechAgreement2ServicesGL.bankMfo := edtMfoGL.Text;
                   ENTechAgreement2ServicesGL.bankRSchet := edtRschetGL.Text;
                 except
                   on EConvertError do Exit;
                 end;
               end;
          finally
            frmRQOrgRschetShow.Free;
          end;
        end;

      end;

  finally
    frmRQOrgShow.Free;
  end;
end;

procedure TfrmENServicesConnectionEdit.spbENElementClick(Sender: TObject);
var
  frmENElementShow : TfrmENElementShow;
  f : ENElementFilter;
  //invNum, depName : String;
  //depCode : Integer;
  //depShort : ENDepartmentShort;
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
          primarySubstationElCode := ENPriconnectionDataObj.elementRef.code;
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENElementShow.Free;
  end;
end;

procedure TfrmENServicesConnectionEdit.LoadENTechConditionsServices{(ENTechConditionsServicesObj: ENTechConditionsServices)};
var
  //i : Integer;
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

  calcTariff1ShortObj : ENConnectionTariffShort;
  calcTariff2ShortObj : ENConnectionTariffShort;

  tariffEntry1: ENConnectionTariffEntry;
  tariffEntry2: ENConnectionTariffEntry;
begin
  if ENTechConditionsServicesObj = nil then
    raise Exception.Create('NET-4231 Не знайдено зв''язаний об''єкт [ENTechConditionsServices]!');

  SetGridHeaders(ENContragentHeaders, sgENContragent.ColumnHeaders);

  //DisableControls([edtENTechConditionsServicesTypeTechCondServicesTypeName,
  //                 edtResponsiblePerson, edtENElementName]);


  SetFloatStyle([edtTyServicesSumma, edtTyServicesPower, edtTySummaGen, edtTySummaVat]);

  //****************************************************************************

  if (ENTechConditionsServicesObj.isUse2Tariffs = ENTECHCONDITIONS_ISUSE2TARIFFS_YES) then
    cbIsUse2Tariffs.Checked := True;

  if (cbIsUse2Tariffs.Checked) then
    HideControls([edt2ConnectionTariffName, edt2ConnectionTariffValue,
      lblPower2Tariffs, edtSumma1Tariff, edtSumma2Tariff], False)
  else
    HideControls([edt2ConnectionTariffName, edt2ConnectionTariffValue,
      lblPower2Tariffs, edtSumma1Tariff, edtSumma2Tariff]);

  {gbConnectionTariff.Visible := ((ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION)
       and (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART));}

  cbBuildersArea.Visible := (ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION);

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

  gbPayments.Visible := (
             (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_NO_STANDART)
          or (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART)
          or (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_NO_STANDART_READY_MADE));
  gbBills.Visible := gbPayments.Visible;
  //tsBills.TabVisible := gbPayments.Visible;


  tsENTechAgreement.TabVisible := ((ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_NO_STANDART)
          or (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART));

  miAccompanyingSheetBillFinal.Visible := (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART);

  if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_NO_STANDART)
    then  DisableControls([edtTySummaGen, edtTySummaVat]);

  if ((ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION)
       and (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART)) then
  begin
    DisableControls([edtTySummaGen, edtTySummaVat, edtConnectionTariffName, edtConnectionTariffValue, edtTyServicesSumma,
        edt2ConnectionTariffName, edt2ConnectionTariffValue]);
    DenyBlankValues([edtConnectionTariffName, edtConnectionTariffValue, edt2ConnectionTariffName, edt2ConnectionTariffValue]);
  end;

  if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_NO_STANDART) then
    HideControls([lblExecutionTerm, edtExecutionTerm]);

  DisableControls([edtTySummaGen, edtTySummaVat, edtConnectionTariffName, edtConnectionTariffValue,
      edt2ConnectionTariffName, edt2ConnectionTariffValue, edtSumma1Tariff, edtSumma2Tariff]);

  // SUPP-12289... 07.04.2014...
  // +++ печать сопроводительных листов только для стандартного/нестандартного присоединений
//  if (ENTechConditionsServicesObj.connectionKindRef.code =
//    ENCONNECTIONKIND_GENERAL_CONNECTION)
//  or (ENTechConditionsServicesObj.connectionKindRef.code =
//    ENCONNECTIONKIND_UNDEFINED)
//  then
//    HideControls([btnAccompanyingSheet1{,
//      btnPrintContractSupply}]);

  //****************************************************************************

  if DialogState = dsView then
  begin
    DisableControls([
       edtConnectionTariffName
      , edtConnectionTariffValue
      , edt2ConnectionTariffName
      , edt2ConnectionTariffValue
      , edtSumma1Tariff
      , edtSumma2Tariff
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
    // 17.06.2013 +++ проверка категории энергоснабжения
    // для II - й подключение и расчет от двух источников
    powerCategory := DMReports.checkPowerCategory(ENTechConditionsServicesObj.code);
    if (powerCategory) then
    begin
      lblConnectionPowerSecondary.Visible := True;
      edtENElementNameSecondary.Visible := True;
      spbENElementSecondary.Visible := True;
      btnCalculatePaySumSecondary.Visible := True;
      gbPriconnectionData.Height := 153;

      // проверка наличия расчета по основному источнику
      ENPriconnectionDataObj := DMReports.getPriconnectionDataPrimarySubstation(ENTechConditionsServicesObj.code, PRIMARY_SUBSTATION);
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
             //DisableControls([spbENElement]);
             isNotCalculated := True;
             primarySubstationElCode := eList.list[0].code;
           end;

         finally
           eFilter.Free;
         end;
      end;

      // проверка наличия расчета по резервному источнику
      dataSecondary := ENPriconnectionData.Create;
      dataSecondary := DMReports.getPriconnectionDataPrimarySubstation(ENTechConditionsServicesObj.code, SECONDARY_SUBSTATION);
      if (dataSecondary <> nil) then
      begin
         eFilter := ENElementFilter.Create;
         try
           TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;
           SetNullIntProps(eFilter);
           SetNullXSProps(eFilter);
           eFilter.code := dataSecondary.elementRef.code;
           eList := TempENElement.getScrollableFilteredList(eFilter,0,-1);

           if (eList.totalCount > 0) then
           begin
             edtENElementNameSecondary.Text := eList.list[0].objectName + ', інв.№ ' + eList.list[0].objectInvNumber;
             // DisableControls([spbENElementSecondary]);
             isNotCalculatedSecondary := True;
           end;

         finally
           eFilter.Free;
         end;
      end;

    end else
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
             //DisableControls([spbENElement]);
             isNotCalculated := True;
           end;

         finally
           eFilter.Free;
         end;
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

           if powerCategory then
             primarySubstationElCode := substationList.list[0].elementCode;

           // при перевыборе ТП - очистить....
           //ENPriconnectionDataObj := nil;
           // if ENPriconnectionDataObj = nil then ENPriconnectionDataObj := ENPriconnectionData.Create;
           ENPriconnectionDataObj := ENPriconnectionData.Create;
           //if ENPriconnectionDataObj.elementRef = nil then ENPriconnectionDataObj.elementRef := ENElementRef.Create;
           ENPriconnectionDataObj.elementRef := ENElementRef.Create;
           ENPriconnectionDataObj.elementRef.code := substationList.list[0].elementCode;
         end;

       finally
         substationFilter.Free;
       end;
    end;



      TempENConnectionTariff := HTTPRIOENConnectionTariff as ENConnectionTariffControllerSoapPort;
      TempENConnectionTariffEntry := HTTPRIOENConnectionTariffEntry as ENConnectionTariffEntryControllerSoapPort;

      // применяется два тарифа
      if (ENTechConditionsServicesObj.isUse2Tariffs = ENTECHCONDITIONS_ISUSE2TARIFFS_YES) then
      begin
        ENCalc2ConnectTariffObj := DMReports.getCalc2TariffByTechCondCode(ENTechConditionsServicesObj.code);

        if (ENCalc2ConnectTariffObj <> nil) then
        begin
          // 1-й тариф
          if (ENServicesConnectionObj.techConObjects.dateGen = nil) then
            calcTariff1ShortObj := TempENConnectionTariff.getShortObject(
              TempENConnectionTariffEntry.getObject(ENCalc2ConnectTariffObj.tariffEntry1Ref.code).tariffRef.code)
          else
            calcTariff1ShortObj := TempENConnectionTariff.getShortObject(
            TempENConnectionTariffEntry.getObject(
              ENCalc2ConnectTariffObj.tariffEntry1Ref.code).tariffRef.code, ENServicesConnectionObj.techConObjects.dateGen);

          if calcTariff1ShortObj <> nil then
          begin
            tariffEntry1 := TempENConnectionTariffEntry.getObject(ENCalc2ConnectTariffObj.tariffEntry1Ref.code);

            edtConnectionTariffName.Text := calcTariff1ShortObj.name;
            edtConnectionTariffValue.Text := tariffEntry1.value.DecimalString;
          end;

          // 2-й тариф
          if (ENServicesConnectionObj.techConObjects.dateGen = nil) then
            calcTariff2ShortObj := TempENConnectionTariff.getShortObject(
              TempENConnectionTariffEntry.getObject(ENCalc2ConnectTariffObj.tariffEntry2Ref.code).tariffRef.code)
          else
            calcTariff2ShortObj := TempENConnectionTariff.getShortObject(
            TempENConnectionTariffEntry.getObject(
              ENCalc2ConnectTariffObj.tariffEntry2Ref.code).tariffRef.code, ENServicesConnectionObj.techConObjects.dateGen);

          if calcTariff2ShortObj <> nil then
          begin
            tariffEntry2 := TempENConnectionTariffEntry.getObject(ENCalc2ConnectTariffObj.tariffEntry2Ref.code);

            edt2ConnectionTariffName.Text := calcTariff2ShortObj.name;
            edt2ConnectionTariffValue.Text := tariffEntry2.value.DecimalString;
          end;

          if ENCalc2ConnectTariffObj.summa1Tariff <> nil then
          edtSumma1Tariff.Text := ENCalc2ConnectTariffObj.summa1Tariff.DecimalString;
          if ENCalc2ConnectTariffObj.summa2Tariff <> nil then
          edtSumma2Tariff.Text := ENCalc2ConnectTariffObj.summa2Tariff.DecimalString;

        end;
      end else
      begin
        if (ENTechConditionsServicesObj.tariffEntryRef <> nil) and (ENTechConditionsServicesObj.tariffEntryRef.code <> Low(Integer)) then
        begin
          if (ENServicesConnectionObj.techConObjects.dateGen = nil) then
            ENConnectionTariffShortObj := TempENConnectionTariff.getShortObject(
              TempENConnectionTariffEntry.getObject(ENTechConditionsServicesObj.tariffEntryRef.code).tariffRef.code)
          else
            ENConnectionTariffShortObj := TempENConnectionTariff.getShortObject(
            TempENConnectionTariffEntry.getObject(
              ENTechConditionsServicesObj.tariffEntryRef.code).tariffRef.code, ENServicesConnectionObj.techConObjects.dateGen);

          if ENConnectionTariffShortObj <> nil then
          begin
            tariffEntry1 := TempENConnectionTariffEntry.getObject(ENTechConditionsServicesObj.tariffEntryRef.code);

            edtConnectionTariffName.Text := ENConnectionTariffShortObj.name;
            edtConnectionTariffValue.Text := tariffEntry1.value.DecimalString;
          end;
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

    chbIsDisconnectionNeeded.Checked := (ENTechConditionsServicesObj.isDisconnectionNeeded = 1);

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

    if ( ENServicesConnectionObj.contractServicesPower <> nil ) then
       edtContractServicesPower.Text := ENServicesConnectionObj.contractServicesPower.decimalString
    else
       edtContractServicesPower.Text := '';

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
    actUpdateNecessityBuildingExecute(Self);
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

procedure TfrmENServicesConnectionEdit.actUpdateContragentExecute(
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

  if (ENContragentList.totalCount > 0) then
  begin
    techConObjectsBuilding := ENContragentList.list[0].techConObjectsBuilding;
    techConObjectsAddress := ENContragentList.list[0].techConObjectsAddress;
  end;

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


procedure TfrmENServicesConnectionEdit.btnCalculatePaySumClick(
  Sender: TObject);
var
  TempENPriconnectionData : ENPriconnectionDataControllerSoapPort;
  TempENTechConditionsServices : ENTechConditionsServicesControllerSoapPort;
  servicesCalculateObj : ENTechConditionsServices;
begin

  // 27.03.2018... +++ приказ № 226 от 26.03.2018...
  // открыт расчет...  удельная стоимость = 0...
  
  // SUPP-60828... 29.03.2017
  // .... у договорах про приєднання, яке не є стандартним, котрі зареєстровані 22.11.2016р або пізніше.....
  {
  if (StrToDate(XSDate2String(ENServicesConnectionObj.contractDateServices)) >= EncodeDate(2016, 11, 22)) then
  begin
    Application.MessageBox(PChar('У зв’язку з тим, що Національною комісією не затверджено питому вартість приєднання, яке не є стандартним, розрахунок плата за приєднання заблоковано!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;
  }

  if (ENPriconnectionDataObj <> nil) then
  begin
    TempENPriconnectionData := HTTPRIOENPriconnectionData as ENPriconnectionDataControllerSoapPort;

    if (powerCategory) then
      ENPriconnectionDataObj := TempENPriconnectionData
         .getCalculationDataObject(primarySubstationElCode, ENTechConditionsServicesObj.code, PRIMARY_SUBSTATION)
    else
    if (ENPriconnectionDataObj.powerMaxCurrent = nil) then
      ENPriconnectionDataObj := TempENPriconnectionData
         .getCalculationDataObject(ENPriconnectionDataObj.elementRef.code, ENTechConditionsServicesObj.code, PRIMARY_SUBSTATION);

    if ENPriconnectionDataObj.techCondServRef = nil then ENPriconnectionDataObj.techCondServRef := ENTechConditionsServicesRef.Create();
      ENPriconnectionDataObj.techCondServRef.code := ENTechConditionsServicesObj.code;

    // if (powerCategory) then
      ENPriconnectionDataObj.isPrimarySubstation := PRIMARY_SUBSTATION;

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


procedure TfrmENServicesConnectionEdit.btnCNVClick(Sender: TObject);
var
  TempCNAttachment : CNAttachmentControllerSoapPort;

begin
  inherited;
  TempCNAttachment := HTTPRIOCNAttachment as CNAttachmentControllerSoapPort;

    TempCNAttachment.convertAtt(ENServicesConnectionObj.code);

end;

procedure TfrmENServicesConnectionEdit.btnPrintCalculateClick(
  Sender: TObject);
var
  tcsObject : ENTechConditionsServices;
  TempENTechConditionsServices : ENTechConditionsServicesControllerSoapPort;
  argNames, args : EnergyproController.ArrayOfString;
  reportName : String;
  isSolidary : Boolean;
begin

  // 27.03.2018... +++ приказ № 226 от 26.03.2018...
  // открыт расчет...  удельная стоимость = 0...

  // SUPP-60828... 29.03.2017
  // .... у договорах про приєднання, яке не є стандартним, котрі зареєстровані 22.11.2016р або пізніше.....
  {
  if (StrToDate(XSDate2String(ENServicesConnectionObj.contractDateServices)) >= EncodeDate(2016, 11, 22)) then
  begin
    Application.MessageBox(PChar('У зв’язку з тим, що Національною комісією не затверджено питому вартість приєднання, яке не є стандартним, розрахунок плата за приєднання заблоковано!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;
  }

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

  if (powerCategory) then
  begin
    if (tcsObject.calcTypeRef.code = CONNECTIONCALCTYPE_NOT_ABOVE_RESERVE) then
      reportName := 'TechConditions/Connection/2category/ConnectionCostNotAboveReserve'
    else
       reportName := 'TechConditions/Connection/2category/ConnectionCost';
  end else

  // NET-4419... +++ типа солидарное без необходимости реконструкции источника питания...
  if (isSolidary) and (tcsObject.calcTypeRef.code = CONNECTIONCALCTYPE_NOT_ABOVE_RESERVE) then
  begin
    reportName := 'TechConditions/Connection/UnionGroupConnectionCostNotAboveReserve';
  end else
  begin
    if (tcsObject.calcTypeRef.code = CONNECTIONCALCTYPE_NOT_ABOVE_RESERVE) then
      reportName := 'TechConditions/Connection/ConnectionCostNotAboveReserve'
    /// 08.07.13 Солидарные потерялись
    else
    if (isSolidary) then reportName := 'TechConditions/Connection/UnionGroupConnectionCost'
    ///
    else
      reportName := 'TechConditions/Connection/ConnectionCost';
  end;

  makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmENServicesConnectionEdit.FormDestroy(Sender: TObject);
begin
  if Assigned(ENTechConditionsServicesObj) then
    ENTechConditionsServicesObj.Free;
  inherited;
end;

procedure TfrmENServicesConnectionEdit.sgENPayment2SOGetAlignment(
  Sender: TObject; ARow, ACol: Integer; var HAlign: TAlignment;
  var VAlign: TVAlignment);
begin
  inherited;
  if (ARow > 0) and (ACol in [PAYMENT_SUM_WITH_VAT_COLUMN_INDEX, PAYMENT_SUM_WITHOUT_VAT_COLUMN_INDEX, PAYMENT_SUM_VAT_COLUMN_INDEX]) then begin
    HAlign := taRightJustify;
  end;
end;

procedure TfrmENServicesConnectionEdit.sgENPlanWorkClick(Sender: TObject);
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

function TfrmENServicesConnectionEdit.getContragentsCount: Integer;
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

procedure TfrmENServicesConnectionEdit.actViewContragentExecute(
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

procedure TfrmENServicesConnectionEdit.actInsertContragentExecute(
  Sender: TObject);
//var TempENContragent: ENContragentControllerSoapPort;
  //contragentsFilter: ENContragentFilter;
  //contragentsArr: ENContragentController.ArrayOfInteger;
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

procedure TfrmENServicesConnectionEdit.actDeleteContragentExecute(
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

procedure TfrmENServicesConnectionEdit.actEditContragentExecute(
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

function TfrmENServicesConnectionEdit.FillENTechConditionsServices(): boolean;
var TempENTechConditionsServices: ENTechConditionsServicesControllerSoapPort;
    contragentsCount: Integer;
    ENTechCondResponsiblesObj: ENTechCondResponsibles;
begin

  if ENTechConditionsServicesObj = nil then
    //raise Exception.Create('NET-4231 Не знайдено зв''язаний об''єкт [ENTechConditionsServices]!');
    Exit;

  if ENTechConditionsServicesObj.code = LOW_INT then
    //raise Exception.Create('NET-4231 Не знайдено зв''язаний об''єкт [ENTechConditionsServices]!');
    Exit;

    if not NoBlankValues([
        edtContractNumber
        , edtContractDateServices
        , edtENDepartmentDepartmentName
        , edtTyServicesPower
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
         ENTechConditionsServicesObj.smallArchFrm :=
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

       ////// 26.06.13
       ENTechConditionsServicesObj.finContractNumber := edtContractNumber.Text;

       if edtContractDateFin.Checked then
       begin
         if ENTechConditionsServicesObj.finContractDate = nil then
            ENTechConditionsServicesObj.finContractDate := TXSDate.Create;
         ENTechConditionsServicesObj.finContractDate.XSToNative(GetXSDate(edtContractDateFin.DateTime));
       end
       else
         ENTechConditionsServicesObj.finContractDate := nil;

       ENTechConditionsServicesObj.partnerName := edtName.Text; // контрагент из фин договора
       ENTechConditionsServicesObj.partnerCode := edtPartnerCode.Text;
       ENTechConditionsServicesObj.finDocCode := edtFinDocCode.Text;
       if ( edtFinDocID.Text <> '' ) then
         ENTechConditionsServicesObj.finDocID := StrToInt(edtFinDocID.Text)
       else
         ENTechConditionsServicesObj.finDocID := Low(Integer) ;
       ENTechConditionsServicesObj.finCommentGen := edtCommentGen.Text;
       /////

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

      /////

      ENTechConditionsServicesObj.isSea := Ord(chbIsSea.Checked);
      ENTechConditionsServicesObj.isDisconnectionNeeded := Ord(chbIsDisconnectionNeeded.Checked);

      ENTechConditionsServicesObj.isUse2Tariffs := Ord(cbIsUse2Tariffs.Checked);

      Result := true;
    end;
end;



procedure TfrmENServicesConnectionEdit.sgENPlanWorkRightClickCell(
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

procedure TfrmENServicesConnectionEdit.sgENSO2NodeClick(Sender: TObject);
Var
  ccNodeCode: Integer;
begin
   try
     ccNodeCode := StrToInt(sgENSO2Node.Cells[1,sgENSO2Node.Row]);
   except
   on EConvertError do Exit;
  end;
  ShowNodeInTree(ccNodeCode);
  MainTreeClick(Sender);
end;

procedure TfrmENServicesConnectionEdit.sgENSOBillGetAlignment(Sender: TObject;
  ARow, ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  inherited;
  if (ARow > 0) and (ACol in [BILL_SUM_WITH_VAT_COLUMN_INDEX, BILL_SUM_WITHOUT_VAT_COLUMN_INDEX, BILL_SUM_VAT_COLUMN_INDEX]) then begin
    HAlign := taRightJustify;
  end;
end;

procedure TfrmENServicesConnectionEdit.sgENSOContractDblClick(Sender: TObject);
begin
  inherited;
  actViewtENSOContractExecute(Sender);
end;

procedure TfrmENServicesConnectionEdit.sgENSOLeaseAgreementDblClick(Sender: TObject);
begin
  inherited;
    actViewLandLeaseAgreementExecute(Sender);
end;

procedure TfrmENServicesConnectionEdit.sgENSOValuesColumnSizing(Sender: TObject;
  ACol, ColumnSize: Integer);
begin
  inherited;
  sgENSOValues.AutoSizeRows(True);
end;

procedure TfrmENServicesConnectionEdit.sgENSOValuesDblClick(Sender: TObject);
begin
  inherited;
  actViewSOValExecute(Sender);
end;

procedure TfrmENServicesConnectionEdit.plansPopup(plan: ENPlanWork);
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

  if not (ENServicesConnectionObj.contractStatusRef.code in [ENSERVICESOBJECTSTATUS_COMPLETED,
                                                         ENSERVICESOBJECTSTATUS_TERMINATED]) then
  begin
    if (ENServicesConnectionObj.statusRef.code <> ENSERVICESOBJECT_FINSTATUS_CLOSED) and
       (ENServicesConnectionObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
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


procedure TfrmENServicesConnectionEdit.actEditPlanExecute(Sender: TObject);
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  tPlan: ENPlanWork;
  ObjCode: Integer;
  act: ENAct;
begin
  begin
    try
      ObjCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]);
    except
      on EConvertError do Exit;
    end;

    tPlan := DMReports.getPlanByCode(ObjCode);

    if tPlan = nil then Exit;

    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;


    if (tPlan.kind.code = ENPLANWORKKIND_FACT) then
    begin
      act := DMReports.getActByPlan(ObjCode);
      if (act.code <> LOW_INT) then
      begin
        Application.MessageBox(PChar('Цей факт включено до Акту!'),
          PChar('Увага!'), MB_ICONWARNING);
        Exit;
      end;
    end;

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
    try
      //SUPP-4339
      frmENPlanWorkEdit.isPriconnection := (
        ENServicesConnectionObj.contractTypeRef.code =
        ENSERVICESOBJECTTYPE_CONNECTION);
      frmENPlanWorkEdit.soElementCode := ENServicesConnectionObj.element.code;
          
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


procedure TfrmENServicesConnectionEdit.actEditPlanForServicesExecute(Sender: TObject);
var
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  tPlan : ENPlanWork;
  ObjCode : Integer;
begin
  inherited;
  try
    ObjCode := StrToInt(sgPlanForServices.Cells[0, sgPlanForServices.Row]);
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
  try
    //SUPP-4339
    frmENPlanWorkEdit.isPriconnection := (
      ENServicesConnectionObj.contractTypeRef.code =
      ENSERVICESOBJECTTYPE_CONNECTION);
    frmENPlanWorkEdit.soElementCode := ENServicesConnectionObj.element.code;

    frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(ObjCode);

    if (tPlan.kind.code = ENPLANWORKKIND_CURRENT) then
      frmENPlanWorkEdit.isTechAgreement := True;

    if frmENPlanWorkEdit.ShowModal = mrOk then
    begin
      updatePlanForServicesGrid;
    end;
  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit:=nil;
  end;
end;


procedure TfrmENServicesConnectionEdit.actEditPlanForServicesGLExecute(
  Sender: TObject);
var
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  tPlan : ENPlanWork;
  ObjCode : Integer;
begin
  inherited;
  try
    ObjCode := StrToInt(sgPlanForServicesGL.Cells[0, sgPlanForServicesGL.Row]);
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
  try
    //SUPP-4339
    frmENPlanWorkEdit.isPriconnection := (
      ENServicesConnectionObj.contractTypeRef.code =
      ENSERVICESOBJECTTYPE_CONNECTION);
    frmENPlanWorkEdit.soElementCode := ENServicesConnectionObj.element.code;

    frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(ObjCode);

    if (tPlan.kind.code = ENPLANWORKKIND_CURRENT) then
      frmENPlanWorkEdit.isTechAgreement := True;

    if frmENPlanWorkEdit.ShowModal = mrOk then
    begin
      updatePlanForServicesGridGL;
    end;
  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit:=nil;
  end;
end;


procedure TfrmENServicesConnectionEdit.actEditPlanForServicesProjectExecute(Sender: TObject);
var
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  tPlan : ENPlanWork;
  ObjCode : Integer;
begin
  inherited;
  try
    ObjCode := StrToInt(sgPlanForServicesProject.Cells[0, sgPlanForServicesProject.Row]);
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
  try
    //SUPP-4339
    frmENPlanWorkEdit.isPriconnection := (
      ENServicesConnectionObj.contractTypeRef.code =
      ENSERVICESOBJECTTYPE_CONNECTION);
    frmENPlanWorkEdit.soElementCode := ENServicesConnectionObj.element.code;

    frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(ObjCode);

    // SUPP-67561... +++ услуги для договоров подряда на выполнение ПКД...
    frmENPlanWorkEdit.isServicesProject := True;

    if (tPlan.kind.code = ENPLANWORKKIND_CURRENT) then
      frmENPlanWorkEdit.isTechAgreement := True;

    if frmENPlanWorkEdit.ShowModal = mrOk then
    begin
      updatePlanForServicesGridProject;
    end;
  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit:=nil;
  end;

  LoadENTechAgreement2ServicesProject;
  updatePlanForServicesGridProject;
end;


procedure TfrmENServicesConnectionEdit.actEditSheet4SOExecute(Sender: TObject);
var
  TempENSheets4SO: ENSheets4SOControllerSoapPort;
begin
  // Пока прикроем редактирование
  EXIT;

  TempENSheets4SO := HTTPRIOENSheets4SO as ENSheets4SOControllerSoapPort;
  try
    ENSheets4SOObj := TempENSheets4SO.getObject(StrToInt(sgENSheets4SO.Cells[0,sgENSheets4SO.Row]));
  except
    on EConvertError do Exit;
  end;

  selectedRow := sgENSheets4SO.Row;
  frmENSheets4SOEdit:=TfrmENSheets4SOEdit.Create(Application, dsEdit);

  try
    if frmENSheets4SOEdit.ShowModal= mrOk then
      begin
        //TempENSheets4SO.save(ENSheets4SOObj);
        updateSheets4SO;
      end;
  finally
    frmENSheets4SOEdit.Free;
    frmENSheets4SOEdit:=nil;
  end;
end;

procedure TfrmENServicesConnectionEdit.actEditSOValExecute(Sender: TObject);
var
  TempENSOValues: ENSOValuesControllerSoapPort;
begin
  TempENSOValues := HTTPRIOENSOValues as ENSOValuesControllerSoapPort;
  try
    ENSOValuesObj := TempENSOValues.getObject(StrToInt(sgENSOValues.Cells[0,sgENSOValues.Row]));
  except
    on EConvertError do Exit;
  end;

  selectedRow := sgENSOValues.Row;
  frmENSOValuesEdit:=TfrmENSOValuesEdit.Create(Application, dsEdit);

  try
    if frmENSOValuesEdit.ShowModal= mrOk then
      begin
        updateSOValues;
      end;
  finally
    frmENSOValuesEdit.Free;
    frmENSOValuesEdit:=nil;
  end;

  if sgENSOValues.RowCount > selectedRow then
    sgENSOValues.Row := selectedRow
  else
    sgENSOValues.Row := sgENSOValues.RowCount - 1;

end;

procedure TfrmENServicesConnectionEdit.actViewPlanExecute(
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



   frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsView);

   if (tPlan.typeRef.code = ENPLANWORKTYPE_TRANSPORT) and (tPlan.stateRef.code = ENPLANWORKSTATE_GSM) then
    frmENPlanWorkEdit.isTransport := true;

   if (tPlan.typeRef.code = ENPLANWORKTYPE_SIZ) then
    frmENPlanWorkEdit.isSiz := true;

    //SUPP-4339
      frmENPlanWorkEdit.isPriconnection := (
        ENServicesConnectionObj.contractTypeRef.code =
        ENSERVICESOBJECTTYPE_CONNECTION);

      frmENPlanWorkEdit.soElementCode := ENServicesConnectionObj.element.code;

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


procedure TfrmENServicesConnectionEdit.actViewPlanForServicesExecute(Sender: TObject);
var
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  tPlan : ENPlanWork;
  objCode : Integer;
begin
  inherited;
  try
    objCode:=StrToInt(sgPlanForServices.Cells[0, sgPlanForServices.row] );
  except
    on EConvertError do Exit;
  end;

  tPlan := DMReports.getPlanByCode( objCode );

  if tPlan = nil then
  begin
    exit;
  end;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsView);

  if (tPlan.typeRef.code = ENPLANWORKTYPE_TRANSPORT) and (tPlan.stateRef.code = ENPLANWORKSTATE_GSM) then
    frmENPlanWorkEdit.isTransport := true;

  if (tPlan.typeRef.code = ENPLANWORKTYPE_SIZ) then
    frmENPlanWorkEdit.isSiz := true;

  //SUPP-4339
  frmENPlanWorkEdit.isPriconnection := (ENServicesConnectionObj.contractTypeRef.code = ENSERVICESOBJECTTYPE_CONNECTION);

  frmENPlanWorkEdit.soElementCode := ENServicesConnectionObj.element.code;

  try
    try
      frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(objCode);
    except
      on EConvertError do Exit;
    end;

    frmENPlanWorkEdit.ShowModal;

  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit:=nil;
  end;
end;


procedure TfrmENServicesConnectionEdit.actViewPlanForServicesGLExecute(
  Sender: TObject);
var
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  tPlan : ENPlanWork;
  objCode : Integer;
begin
  inherited;
  try
    objCode:=StrToInt(sgPlanForServicesGL.Cells[0, sgPlanForServicesGL.row] );
  except
    on EConvertError do Exit;
  end;

  tPlan := DMReports.getPlanByCode( objCode );

  if tPlan = nil then
  begin
    exit;
  end;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsView);

  if (tPlan.typeRef.code = ENPLANWORKTYPE_TRANSPORT) and (tPlan.stateRef.code = ENPLANWORKSTATE_GSM) then
    frmENPlanWorkEdit.isTransport := true;

  if (tPlan.typeRef.code = ENPLANWORKTYPE_SIZ) then
    frmENPlanWorkEdit.isSiz := true;

  //SUPP-4339
  frmENPlanWorkEdit.isPriconnection := (ENServicesConnectionObj.contractTypeRef.code = ENSERVICESOBJECTTYPE_CONNECTION);

  frmENPlanWorkEdit.soElementCode := ENServicesConnectionObj.element.code;

  try
    try
      frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(objCode);
    except
      on EConvertError do Exit;
    end;

    frmENPlanWorkEdit.ShowModal;

  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit:=nil;
  end;
end;


procedure TfrmENServicesConnectionEdit.actViewPlanForServicesProjectExecute(Sender: TObject);
var
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  tPlan : ENPlanWork;
  objCode : Integer;
begin
  inherited;
  try
    objCode:=StrToInt(sgPlanForServicesProject.Cells[0, sgPlanForServicesProject.row] );
  except
    on EConvertError do Exit;
  end;

  tPlan := DMReports.getPlanByCode( objCode );

  if tPlan = nil then
  begin
    exit;
  end;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsView);

  if (tPlan.typeRef.code = ENPLANWORKTYPE_TRANSPORT) and (tPlan.stateRef.code = ENPLANWORKSTATE_GSM) then
    frmENPlanWorkEdit.isTransport := true;

  if (tPlan.typeRef.code = ENPLANWORKTYPE_SIZ) then
    frmENPlanWorkEdit.isSiz := true;

  //SUPP-4339
  frmENPlanWorkEdit.isPriconnection := (ENServicesConnectionObj.contractTypeRef.code = ENSERVICESOBJECTTYPE_CONNECTION);

  frmENPlanWorkEdit.soElementCode := ENServicesConnectionObj.element.code;

  try
    try
      frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(objCode);
    except
      on EConvertError do Exit;
    end;

    frmENPlanWorkEdit.ShowModal;

  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit:=nil;
  end;
end;


procedure TfrmENServicesConnectionEdit.actViewSheet4SOExecute(Sender: TObject);
var
  TempENSheets4SO: ENSheets4SOControllerSoapPort;
begin
  TempENSheets4SO := HTTPRIOENSheets4SO as ENSheets4SOControllerSoapPort;
  try
    ENSheets4SOObj := TempENSheets4SO.getObject(StrToInt(sgENSheets4SO.Cells[0,sgENSheets4SO.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENSheets4SOEdit:=TfrmENSheets4SOEdit.Create(Application, dsView);

  try
    frmENSheets4SOEdit.ShowModal;
  finally
    frmENSheets4SOEdit.Free;
    frmENSheets4SOEdit:=nil;
  end;

  updateSheets4SO;
end;

procedure TfrmENServicesConnectionEdit.actViewSOValExecute(Sender: TObject);
var
  TempENSOValues: ENSOValuesControllerSoapPort;
begin
  TempENSOValues := HTTPRIOENSOValues as ENSOValuesControllerSoapPort;
  try
    ENSOValuesObj := TempENSOValues.getObject(StrToInt(sgENSOValues.Cells[0,sgENSOValues.Row]));
  except
    on EConvertError do Exit;
  end;

  selectedRow := sgENSOValues.Row;
  frmENSOValuesEdit:=TfrmENSOValuesEdit.Create(Application, dsView);

  try
    frmENSOValuesEdit.ShowModal;
  finally
    frmENSOValuesEdit.Free;
    frmENSOValuesEdit:=nil;
  end;

  if sgENSOValues.RowCount > selectedRow then
    sgENSOValues.Row := selectedRow
  else
    sgENSOValues.Row := sgENSOValues.RowCount - 1;

end;

procedure TfrmENServicesConnectionEdit.actViewtENSOContractExecute(
  Sender: TObject);
var
  TempENSOContract: ENSOContractControllerSoapPort;
begin
  TempENSOContract := HTTPRIOENSOContract as ENSOContractControllerSoapPort;
  try
    ENSOContractObj := TempENSOContract.getObject(StrToInt(sgENSOContract.Cells[0,sgENSOContract.Row]));
  except
    on EConvertError do Exit;
  end;

  selectedRow := sgENSOContract.Row;
  frmENSOContractEdit:=TfrmENSOContractEdit.Create(Application, dsView);

  try
    frmENSOContractEdit.ShowModal;
  finally
    frmENSOContractEdit.Free;
    frmENSOContractEdit:=nil;
  end;

  if sgENSOContract.RowCount > selectedRow then
    sgENSOContract.Row := selectedRow
  else
    sgENSOContract.Row := sgENSOContract.RowCount - 1;

end;

procedure TfrmENServicesConnectionEdit.actInsertPlanExecute(
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

  if ENServicesConnectionObj.contractDateServices = nil then
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
    frmENPlanWorkEdit.ENPlanWorkObj.dateStart.XSToNative(GetXSDate(EncodeDate(ENServicesConnectionObj.contractDateServices.Year,
                                                                              ENServicesConnectionObj.contractDateServices.Month, 1)));

    frmENPlanWorkEdit.ENPlanWorkObj.departmentRef := ENDepartmentRef.Create;
    frmENPlanWorkEdit.ENPlanWorkObj.departmentRef.code := ENServicesConnectionObj.department.code; //ENTechConditionsServicesObj.department.code;
    frmENPlanWorkEdit.edtDepartment.Text := ENServicesConnectionObj.department.name; //ENTechConditionsServicesObj.department.name;

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
    frmENPlanWorkEdit.ENPlanWorkObj.priConnectionNumber := ENServicesConnectionObj.contractNumberServices; //ENTechConditionsServicesObj.contractNumber;
    frmENPlanWorkEdit.edtPriConnectionNumber.Text := ENServicesConnectionObj.contractNumberServices; //ENTechConditionsServicesObj.contractNumber;
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

       //frmENPlanWorkEdit.ENPlanWorkObj.commentGen := '№' + {tcList.list[0].contractNumber +} ENServicesConnectionObj.contractNumberServices +
       //                                              ' від ' + XSDate2String(tcList.list[0].contractDate) + ' р.' +
       //                                              ' (' + tcList.list[0].contragentName + ')';

       frmENPlanWorkEdit.ENPlanWorkObj.commentGen := '№' + {tcList.list[0].contractNumber +} ENServicesConnectionObj.contractNumberServices +
                                                     ' від ' + XSDate2String(ENServicesConnectionObj.contractDateServices) + ' р.' +
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

procedure TfrmENServicesConnectionEdit.actInsertPowerReserveExecute(
  Sender: TObject);
begin
  ENCalcPowerReserveObj:=ENCalcPowerReserve.Create;
  SetNullIntProps(ENCalcPowerReserveObj);
  SetNullXSProps(ENCalcPowerReserveObj);

  ENCalcPowerReserveObj.servicesobjectRef := ENServicesObjectRef.Create;
  ENCalcPowerReserveObj.servicesobjectRef.code := ENServicesConnectionObj.code;

  try
    frmENCalcPowerReserveEdit:=TfrmENCalcPowerReserveEdit.Create(Application, dsInsert);
    try
      if frmENCalcPowerReserveEdit.ShowModal = mrOk then
      begin
        if ENCalcPowerReserveObj<>nil then
            //TempENCalcPowerReserve.add(ENCalcPowerReserveObj);
          updatePowerReserve;
          updatePowerReserveItems;
      end;
    finally
      frmENCalcPowerReserveEdit.Free;
      frmENCalcPowerReserveEdit:=nil;
    end;
  finally
    ENCalcPowerReserveObj.Free;
  end;
end;

procedure TfrmENServicesConnectionEdit.actInsertPowerReserveItemExecute(
  Sender: TObject);
var TempENCalcPowerReserveItem: ENCalcPowerReserveItemControllerSoapPort;
begin
  TempENCalcPowerReserveItem := HTTPRIOENCalcPowerReserveItem as ENCalcPowerReserveItemControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENCalcPowerReserveItemObj:=ENCalcPowerReserveItem.Create;
  SetNullIntProps(ENCalcPowerReserveItemObj);
  SetNullXSProps(ENCalcPowerReserveItemObj);

  try
    frmENCalcPowerReserveItemEdit:=TfrmENCalcPowerReserveItemEdit.Create(Application, dsInsert);
    try
      try
         if ENCalcPowerReserveItemObj.calcPowerReserveRef = nil then
            ENCalcPowerReserveItemObj.calcPowerReserveRef := ENCalcPowerReserveRef.Create;
         ENCalcPowerReserveItemObj.calcPowerReserveRef.code := StrToInt(sgENCalcPowerReserve.Cells[0,sgENCalcPowerReserve.Row]);

       except
       on EConvertError do Exit;
       end;
      frmENCalcPowerReserveItemEdit.codeSO := ENServicesConnectionObj.code;
      if frmENCalcPowerReserveItemEdit.ShowModal = mrOk then
      begin
        if ENCalcPowerReserveItemObj<>nil then
            TempENCalcPowerReserveItem.add(ENCalcPowerReserveItemObj);
        updatePowerReserveItems;
      end;
    finally
      frmENCalcPowerReserveItemEdit.Free;
      frmENCalcPowerReserveItemEdit:=nil;
    end;
  finally
    ENCalcPowerReserveItemObj.Free;
  end;
end;

procedure TfrmENServicesConnectionEdit.actInsertSheet4SOExecute(
  Sender: TObject);
begin
  if (ENTechConditionsServicesObj = nil) or (ENTechConditionsServicesObj.connectionKindRef = nil) then
    raise Exception.Create('Не вдалося визначити тип приєднання!');

  if (ENTechConditionsServicesObj.connectionKindRef.code <> ENCONNECTIONKIND_STANDART) and
     (ENTechConditionsServicesObj.connectionKindRef.code <> ENCONNECTIONKIND_NO_STANDART) and
     (ENTechConditionsServicesObj.connectionKindRef.code <> ENCONNECTIONKIND_NO_STANDART_READY_MADE) then
    raise Exception.Create('Не визначений тип приєднання!');

  if not DMReports.checkLandSheetStageForServicesObject(ENServicesConnectionObj.code) then
  begin
    Application.MessageBox(PChar('Для створення листа спочатку потрібно внести додатковий реквізит' + #13#10 +
                                 '"Номер стадії відведення земельної ділянки" (значення від 1 до 5)!'),
                           PChar('Увага !'), MB_ICONWARNING + MB_OK);
    Exit;
  end;

  ENSheets4SOObj:=ENSheets4SO.Create;
  SetNullIntProps(ENSheets4SOObj);
  SetNullXSProps(ENSheets4SOObj);
  ENSheets4SOObj.servicesobject := ENServicesObjectRef.Create;
  ENSheets4SOObj.servicesobject.code := ENServicesConnectionObj.code;

  try
    frmENSheets4SOEdit := TfrmENSheets4SOEdit.Create(Application, dsInsert);
    try
      if frmENSheets4SOEdit.ShowModal = mrOk then
      begin
        if ENSheets4SOObj <> nil then
          updateSheets4SO;
      end;
    finally
      frmENSheets4SOEdit.Free;
      frmENSheets4SOEdit := nil;
    end;
  finally
    ENSheets4SOObj.Free;
  end;
end;

procedure TfrmENServicesConnectionEdit.actInsertSOValExecute(Sender: TObject);
begin
  // TempENSOValues := HTTPRIOENSOValues as ENSOValuesControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSOValuesObj:=ENSOValues.Create;
  SetNullIntProps(ENSOValuesObj);
  SetNullXSProps(ENSOValuesObj);
  ENSOValuesObj.servicesobject := ENServicesObjectRef.Create;
  ENSOValuesObj.servicesobject.code := ENServicesConnectionObj.code;

  try
    frmENSOValuesEdit:=TfrmENSOValuesEdit.Create(Application, dsInsert);
    try
      if frmENSOValuesEdit.ShowModal = mrOk then
      begin
        if ENSOValuesObj<>nil then
            //TempENSOValues.add(ENSOValuesObj);
            updateSOValues;
      end;
    finally
      frmENSOValuesEdit.Free;
      frmENSOValuesEdit:=nil;
    end;
  finally
    ENSOValuesObj.Free;
  end;
end;

procedure TfrmENServicesConnectionEdit.actDeletePlanExecute(
  Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
  ObjCode : Integer; //eType : Integer;
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


procedure TfrmENServicesConnectionEdit.actDeletePlanForServicesExecute(Sender: TObject);
var
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  ObjCode: Integer; //eType : Integer;
  tPlan : ENPlanWork;
begin
  inherited;
  try
    ObjCode := StrToInt(sgPlanForServices.Cells[0,sgPlanForServices.Row]);
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
    Application.MessageBox(PChar('План затверджений!'), PChar('Увага'), MB_ICONWARNING);
    exit;
  end;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  if Application.MessageBox(PChar('Вы действительно хотите удалить (План робіт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENPlanWork.remove(ObjCode);
    updatePlanForServicesGrid;
  end;

end;


procedure TfrmENServicesConnectionEdit.actDeletePlanForServicesGLExecute(
  Sender: TObject);
var
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  ObjCode: Integer; //eType : Integer;
  tPlan : ENPlanWork;
begin
  inherited;
  try
    ObjCode := StrToInt(sgPlanForServicesGL.Cells[0,sgPlanForServicesGL.Row]);
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
    Application.MessageBox(PChar('План затверджений!'), PChar('Увага'), MB_ICONWARNING);
    exit;
  end;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  if Application.MessageBox(PChar('Вы действительно хотите удалить (План робіт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENPlanWork.remove(ObjCode);
    updatePlanForServicesGridGL;
  end;

end;


procedure TfrmENServicesConnectionEdit.actDeletePlanForServicesProjectExecute(Sender: TObject);
var
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  ObjCode, eType : Integer;
  tPlan : ENPlanWork;
begin
  inherited;
  try
    ObjCode := StrToInt(sgPlanForServicesProject.Cells[0,sgPlanForServicesProject.Row]);
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
    Application.MessageBox(PChar('План затверджений!'), PChar('Увага'), MB_ICONWARNING);
    exit;
  end;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  if Application.MessageBox(PChar('Вы действительно хотите удалить (План робіт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENPlanWork.remove(ObjCode);
    updatePlanForServicesGridProject;
  end;

  LoadENTechAgreement2ServicesProject;
end;


procedure TfrmENServicesConnectionEdit.actDeletePowerReserveExecute(
  Sender: TObject);
Var TempENCalcPowerReserve: ENCalcPowerReserveControllerSoapPort;
  ObjCode: Integer;
begin
 TempENCalcPowerReserve := HTTPRIOENCalcPowerReserve as ENCalcPowerReserveControllerSoapPort;
   try
     ObjCode := StrToInt(sgENCalcPowerReserve.Cells[0,sgENCalcPowerReserve.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Расчет резерва для присоединения) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENCalcPowerReserve.remove(ObjCode);
      updatePowerReserve;
      updatePowerReserveItems;
  end;
end;

procedure TfrmENServicesConnectionEdit.actDeletePowerReserveItemExecute(
  Sender: TObject);
Var TempENCalcPowerReserveItem: ENCalcPowerReserveItemControllerSoapPort;
  ObjCode,i: Integer;
  state_, isSel : boolean;
begin
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Строки для расчета резерва для присоединения) ?'),
                   PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

  TempENCalcPowerReserveItem := HTTPRIOENCalcPowerReserveItem as ENCalcPowerReserveItemControllerSoapPort;

  state_ := false;
  isSel := false;

    for i:=1 to sgENCalcPowerReserveItem.RowCount - 1 do
  begin
     sgENCalcPowerReserveItem.GetCheckBoxState(1,i,state_);
     if state_ then
     begin
       isSel := true;
     end;

  end;

    if not isSel then
  begin
     Application.MessageBox(PChar('Виберіть хоча б одну строку!!!'), PChar('Увага !'),MB_ICONWARNING);
     Exit;
  end;

  for i:=1 to sgENCalcPowerReserveItem.RowCount - 1 do
      begin
         sgENCalcPowerReserveItem.GetCheckBoxState(1,i,state_);
         if state_ then
         begin
            try
              ObjCode := StrToInt(sgENCalcPowerReserveItem.Cells[0,i]);
             except
             on EConvertError do Exit;
             end;
         TempENCalcPowerReserveItem.remove(ObjCode);
         end;
      end;
  end;
   updatePowerReserveItems;
end;

procedure TfrmENServicesConnectionEdit.actDeleteSheet4SOExecute(
  Sender: TObject);
Var TempENSheets4SO: ENSheets4SOControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSheets4SO := HTTPRIOENSheets4SO as ENSheets4SOControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSheets4SO.Cells[0,sgENSheets4SO.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Вихідні листи для договорів)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSheets4SO.remove(ObjCode);
      updateSheets4SO;
  end;

end;

procedure TfrmENServicesConnectionEdit.actDeleteSOValExecute(Sender: TObject);
Var TempENSOValues: ENSOValuesControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSOValues := HTTPRIOENSOValues as ENSOValuesControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSOValues.Cells[0,sgENSOValues.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Значения для ServicesObject) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSOValues.remove(ObjCode);
      updateSOValues;
  end;
end;

procedure TfrmENServicesConnectionEdit.actClosePlanExecute(
  Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    //ENPlanWorkList: ENPlanWorkShortList;
    //ENPlanWorkFilterObj: ENPlanWorkFilter;
    //ObjCode: Integer;
    //ENPlanWorkObj: ENPlanWork;
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

procedure TfrmENServicesConnectionEdit.actUnClosePlanExecute(
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

procedure TfrmENServicesConnectionEdit.actFADeleteExecute(Sender: TObject);
Var TempFACalculation: FACalculationControllerSoapPort;
  ObjCode: Integer;
begin
 TempFACalculation := HTTPRIOFACalculation as FACalculationControllerSoapPort;
   try
     ObjCode := StrToInt(sgFACalculation.Cells[0,sgFACalculation.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Расчет пофидерного анализа) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempFACalculation.remove(ObjCode);
      updateFACalculation;
  end;
end;

procedure TfrmENServicesConnectionEdit.actFAEditExecute(Sender: TObject);
Var TempFACalculation: FACalculationControllerSoapPort;
begin
 TempFACalculation := HTTPRIOFACalculation as FACalculationControllerSoapPort;
   try
     FACalculationObj := TempFACalculation.getObject(StrToInt(sgFACalculation.Cells[0,sgFACalculation.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFACalculationEdit:=TfrmFACalculationEdit.Create(Application, dsEdit);
  try
    if frmFACalculationEdit.ShowModal= mrOk then
      begin
        updateFACalculation;
      end;
  finally
    frmFACalculationEdit.Free;
    frmFACalculationEdit:=nil;
  end;
end;

procedure TfrmENServicesConnectionEdit.actFAInsertExecute(Sender: TObject);
var
  TempENSO2Node: ENSO2NodeControllerSoapPort;
  i, nodeCode: Integer;
  ENSO2NodeList: ENSO2NodeShortList;
  so2nodeFilter : ENSO2NodeFilter;
  NodeObj: CCNode;
  TempCCNode: CCNodeControllerSoapPort;
begin

  TempENSO2Node :=  HTTPRIOENSO2Node as ENSO2NodeControllerSoapPort;

  so2nodeFilter := ENSO2NodeFilter.Create;
  SetNullIntProps(so2nodeFilter);
  SetNullXSProps(so2nodeFilter);
  so2nodeFilter.servicesobject := ENServicesObjectRef.Create;
  so2nodeFilter.servicesobject.code := ENServicesConnectionObj.code;

  ENSO2NodeList := TempENSO2Node.getScrollableFilteredList(so2nodeFilter,0,-1);

  TempCCNode:=HTTPRIOCCNode as CCNodeControllerSoapPort;
  NodeObj:=TempCCNode.getObject(ENSO2NodeList.list[0].ccNodeCode);

  FACalculationObj:=FACalculation.Create;
  SetNullIntProps(FACalculationObj);
  SetNullXSProps(FACalculationObj);
  FACalculationObj.nodeCode:=NodeObj.code;
  FACalculationObj.nodeTxt:=NodeObj.name;
  FACalculationObj.nodetype:=CCNodeTypeRef.Create;
  FACalculationObj.nodetype.code:=NodeObj.nodetype.code;

  try
    frmFACalculationAdd:=TfrmFACalculationAdd.Create(Application, dsInsert);
    frmFACalculationAdd.isForServices := True;
    frmFACalculationAdd.edtRes.Text:=NodeObj.res;

    frmFACalculationAdd.rbOneFeeder.Checked:=True;
    frmFACalculationAdd.chkCreateEmpty.Checked:=False;
    frmFACalculationAdd.chkLosses2Unbalance.Checked:=True;
    frmFACalculationAdd.chkWithSwitches.Checked:=False;

    DisableControls([
     frmFACalculationAdd.rbAllRen, frmFACalculationAdd.rbOneRen, frmFACalculationAdd.rbOneFeeder,
     frmFACalculationAdd.sbRes, frmFACalculationAdd.btnNodeSelect, frmFACalculationAdd.btnENSO,
     frmFACalculationAdd.chkLosses2Unbalance, frmFACalculationAdd.chkWithSwitches]);
    DisableControls([frmFACalculationAdd.edtITumbler, frmFACalculationAdd.edtENSOcode], false);

    frmFACalculationAdd.edtENSOcode.Text := IntToStr(ENServicesConnectionObj.code);
    frmFACalculationAdd.edtNodeCode.Text := IntToStr(NodeObj.code);
    frmFACalculationAdd.edtNodeTxt.Text := NodeObj.name;

    try
      if frmFACalculationAdd.ShowModal = mrOk then
      begin
        if FACalculationObj<>nil then
            //TempFACalculation.add(FACalculationObj);
            updateFACalculation;
      end;
    finally
      frmFACalculationAdd.Free;
      frmFACalculationAdd:=nil;
    end;
  finally
    FACalculationObj.Free;
  end;
end;

procedure TfrmENServicesConnectionEdit.actFAViewExecute(Sender: TObject);
Var TempFACalculation: FACalculationControllerSoapPort;
begin
 TempFACalculation := HTTPRIOFACalculation as FACalculationControllerSoapPort;
   try
     FACalculationObj := TempFACalculation.getObject(StrToInt(sgFACalculation.Cells[0,sgFACalculation.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFACalculationEdit:=TfrmFACalculationEdit.Create(Application, dsView);
  try
    frmFACalculationEdit.ShowModal;
  finally
    frmFACalculationEdit.Free;
    frmFACalculationEdit:=nil;
  end;
end;

procedure TfrmENServicesConnectionEdit.actFinishPlanExecute(
  Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    //ENPlanWorkList: ENPlanWorkShortList;
    //ENPlanWorkFilterObj: ENPlanWorkFilter;
    //ObjCode: Integer;
    //ENPlanWorkObj: ENPlanWork;
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


procedure TfrmENServicesConnectionEdit.actGeneratePowerReserveExecute(
  Sender: TObject);
Var TempENCalcPowerReserve: ENCalcPowerReserveControllerSoapPort;
    powerReserveObj : ENCalcPowerReserve;
begin
 TempENCalcPowerReserve := HTTPRIOENCalcPowerReserve as ENCalcPowerReserveControllerSoapPort;

   powerReserveObj := ENCalcPowerReserve.Create;
   powerReserveObj.servicesobjectRef := ENServicesObjectRef.Create;
   powerReserveObj.servicesobjectRef.code := ENServicesConnectionObj.code;

  if Application.MessageBox(PChar('Вы действительно хотите сформировать\переформировать Расчет резерва ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENCalcPowerReserve.generatePowerReserve(powerReserveObj);
      updatePowerReserve;
      updatePowerReserveItems;
  end;
end;

procedure TfrmENServicesConnectionEdit.actUndoConfirmExecute(Sender: TObject);
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


procedure TfrmENServicesConnectionEdit.actUndoFinishPlanExecute(
  Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    //ENPlanWorkList: ENPlanWorkShortList;
    //ENPlanWorkFilterObj: ENPlanWorkFilter;
    //ObjCode: Integer;
    //ENPlanWorkObj: ENPlanWork;
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


procedure TfrmENServicesConnectionEdit.actEditENActExecute(Sender: TObject);
var
  TempENAct: ENActControllerSoapPort;
begin
  inherited;

  if (pcActs.ActivePage = tsActsHoz) then
  begin
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

end;


procedure TfrmENServicesConnectionEdit.actEditENPlanWorkItemExecute(
  Sender: TObject);
Var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
begin
  if not priconnections then Exit;

  if ENServicesConnectionObj = nil then Exit;
  if ENServicesConnectionObj.contractTypeRef = nil then Exit;
  if ENServicesConnectionObj.contractTypeRef.code <> ENSERVICESOBJECTTYPE_CONNECTION then Exit;

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

procedure TfrmENServicesConnectionEdit.actEditENSOBillExecute(Sender: TObject);
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
        Self.actUpdateENSOBillExecute(Sender);
      end;
  finally
    frmENSOBillEdit.Free;
    frmENSOBillEdit:=nil;
  end;
end;

procedure TfrmENServicesConnectionEdit.actInsertCalculationExecute(
  Sender: TObject);
Var
  //TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
  TempENPlanWork2ClassificationType: ENPlanWork2ClassificationTypeControllerSoapPort;
  //TempENEstimateItem : ENEstimateItemControllerSoapPort;
  //plan2ctFilter : ENPlanWork2ClassificationTypeFilter;
  //ENPlanWork2ClassificationTypeList: ENPlanWork2ClassificationTypeShortList;
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

      frmENPlanWork2ClassificationTypeEdit.distance := TXSDecimal.Create;
      frmENPlanWork2ClassificationTypeEdit.distance.DecimalString := edtContractServicesDistance.Text;
      frmENPlanWork2ClassificationTypeEdit.codeDepartmentForServicesObject := DepartmentForServicesCode;
      frmENPlanWork2ClassificationTypeEdit.edtDepartmentForServices.Text := edtDepartmentForServices.Text;

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

procedure TfrmENServicesConnectionEdit.actInsertENSOContractExecute(
  Sender: TObject);
begin
  ENSOContractObj := ENSOContract.Create;

  SetNullIntProps(ENSOContractObj);
  SetNullXSProps(ENSOContractObj);
  ENSOContractObj.servicesObjectRef := ENServicesObjectRef.Create;
  ENSOContractObj.servicesObjectRef.code := ENServicesConnectionObj.code;

  try
    frmENSOContractEdit:=TfrmENSOContractEdit.Create(Application, dsInsert);
    try
      if frmENSOContractEdit.ShowModal = mrOk then
      begin
        if frmENSOContractEdit<>nil then
            updateENSOContract;
      end;
    finally
      frmENSOContractEdit.Free;
      frmENSOContractEdit:=nil;
    end;
  finally
    ENSOContractObj.Free;
    ENSOContractObj := nil;
  end;
end;

procedure TfrmENServicesConnectionEdit.actInsertEstimateItemExecute(
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
             (ENPlanWork2ClassificationTypeObj, ENServicesConnectionObj.contractServicesDistance,
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

procedure TfrmENServicesConnectionEdit.actDeleteatENSOContractExecute(
  Sender: TObject);
Var TempENSOContract: ENSOContractControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSOContract := HTTPRIOENSOContract as ENSOContractControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSOContract.Cells[0,sgENSOContract.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Связку ServicesObject с Фин. Кол.(Договор Аренды)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSOContract.remove(ObjCode);
      updateENSOContract;
  end;
end;

procedure TfrmENServicesConnectionEdit.actDeleteAttachmentsExecute(
  Sender: TObject);
var
  TempENDocAttachment: ENDocAttachmentControllerSoapPort;
  ObjCode, wfPackCode: Integer;
  wfPackObj: WFPack;
begin
  TempENDocAttachment := HTTPRIOENDocAttachment as ENDocAttachmentControllerSoapPort;
  try
    ObjCode := StrToInt(sgENDocAttachment.Cells[0, sgENDocAttachment.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Вы действительно хотите удалить (Вложение документа) ?'),
                            PChar('Внимание !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    wfPackCode := LOW_INT;
    wfPackObj := getWFPack();
    if wfPackObj <> nil then
      wfPackCode := wfPackObj.code;

    if wfPackCode > 0 then
      TempENDocAttachment.remove(ObjCode, wfPackCode)
    else
      TempENDocAttachment.remove(ObjCode);

    pcCalculationChange(Sender);
  end;
end;

procedure TfrmENServicesConnectionEdit.actDeleteCalculationExecute(
  Sender: TObject);
Var TempENPlanWorkItem : ENPlanWorkItemControllerSoapPort;
    //TempENPlanWork2ClassificationType : ENPlanWork2ClassificationTypeControllerSoapPort;
    //plan2ctFilter : ENPlanWork2ClassificationTypeFilter;
    //ENPlanWork2ClassificationTypeList : ENPlanWork2ClassificationTypeShortList;
    ObjCode: Integer;

    TempENPlanWork : ENPlanWorkControllerSoapPort;
    //plan : ENPlanWork;
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
    //Self.Close;
    ModalResult := mrCancel;
    Exit;

    // обновисть грид
    // .UpdateGrid(Sender);
  end;

  actUpdateExecute(Sender);

end;

procedure TfrmENServicesConnectionEdit.actEditCalculationExecute(
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

end;

procedure TfrmENServicesConnectionEdit.cbBuildersAreaClick(
  Sender: TObject);
begin

  if (not cbBuildersArea.Checked) then
  begin
    ENTechConditionsServicesObj.tariffEntryRef := nil;
    ENCalc2ConnectTariffObj := nil;
    edtConnectionTariffName.Text := '';
    edtConnectionTariffValue.Text := '';
    edtSumma1Tariff.Text := '';
    edtSumma2Tariff.Text := '';
  end;

  if (cbBuildersArea.Checked) then
    edtTyServicesSumma.Text := '0';

  SetAgreeTechTermsPrepareBtnVisible;
end;


procedure TfrmENServicesConnectionEdit.cbIsUse2TariffsClick(Sender: TObject);
begin
  inherited;
  if (cbIsUse2Tariffs.Checked) then
    HideControls([edt2ConnectionTariffName, edt2ConnectionTariffValue,
      lblPower2Tariffs, edtSumma1Tariff, edtSumma2Tariff], False)
  else
    HideControls([edt2ConnectionTariffName, edt2ConnectionTariffValue,
      lblPower2Tariffs, edtSumma1Tariff, edtSumma2Tariff]);
end;


procedure TfrmENServicesConnectionEdit.btnPrintFactCalcClick(
  Sender: TObject);
var
  argNames, args: EnergyproController.ArrayOfString;
  reportName: String;
begin
  if (ENServicesConnectionObj.calcTypeRef.code <> ENSERVICESOBJECT_CALCTYPE_BY_FACT) then Exit;

  /////
  if ENServicesConnectionObj.contractStatusRef = nil then Exit;

  if ENServicesConnectionObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////
    
  ///// 14.05.13 NET-4235
  // Печать расчета - только при статусах "Работы выполнены" и "Оплаченный"
  if (ENServicesConnectionObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_COMPLETED) and
     (ENServicesConnectionObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_PAID) then
    raise Exception.Create('NET-4235 Для друку розрахунку остаточної вартості договір повинен мати статус "Роботи виконані" або "Сплачений"!');
  /////

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'servicesObjectCode';
  args[0] := IntToStr(ENServicesConnectionObj.code);

  reportName := '201109/ActCalcAdditionalWorkG_NKRE/ActCalc_ServicesFactCalc';

  makeReport(reportName, argNames, args, 'xls');
end;


procedure TfrmENServicesConnectionEdit.btnPrintPlanTaskConnectionClick(
  Sender: TObject);
var
    menuPoint: TPoint;
begin
    menuPoint := gbPrint.ClientToScreen(Point(btnPrintPlanTaskConnection.Left,
                btnPrintPlanTaskConnection.Top + btnPrintPlanTaskConnection.Height));
    pmPlanTaskFaxMessage.Popup(menuPoint.X, menuPoint.Y);
end;

procedure TfrmENServicesConnectionEdit.btnPrintReserveClick(Sender: TObject);
var
  argNames, args : EnergyproController.ArrayOfString;
  reportName : String;
begin


  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'soCode';
  args[0] := IntToStr(ENServicesConnectionObj.code);

  reportName := 'TechConditions/PowerReserve/powerReserve';

  makeReport(reportName, argNames, args, 'xls');
end;

procedure TfrmENServicesConnectionEdit.btnSubstationClick(
  Sender: TObject);
var
  i, j: Integer;
  TempCCElementData: CCElementDataControllerSoapPort;
  ccElementList: CCElementDataShortList;
  ccElementFilter: CCElementDataFilter;
  TempENSubstation04: ENSubstation04ControllerSoapPort;
begin

  if MainTree.Selected = nil then
  begin
     ShowMessage('Оберіть вузел дерева об''єктів CallCentre');
     exit;
  end;

  // сделаем пока только для подстанций
  if CCNodeExtShort(MainTree.Selected.Data).nodetypeCode <> 6 then
  Exit;

  TempCCElementData :=  HTTPRIOCCElementData as CCElementDataControllerSoapPort;

  ccElementFilter := CCElementDataFilter.Create;
  SetNullIntProps(ccElementFilter);
  SetNullXSProps(ccElementFilter);

  ccElementFilter.code:=CCNodeExtShort(MainTree.Selected.Data).code;
  ccElementFilter.nodetype := CCNodeTypeRef.Create;
  ccElementFilter.nodetype.code := 6;
  ccElementFilter.orderBySQL:='name';

  ccElementList := TempCCElementData.getScrollableFilteredList(ccElementFilter,0,-1);

  if ccElementList.totalCount > 0 then
  begin

    try
       ENSubstation04Obj := DMReports.getSubstation04ByElement(ccElementList.list[0].elementCode);
     except
     on EConvertError do Exit;
    end;

    frmENSubstation04Edit:=TfrmENSubstation04Edit.Create(Application, dsView);
    try
      frmENSubstation04Edit.ShowModal;
    finally
      frmENSubstation04Edit.Free;
      frmENSubstation04Edit:=nil;
    end;

  end;
end;

procedure TfrmENServicesConnectionEdit.btnPrintTechAgreementClick(Sender: TObject);
var
  argNames, args : EnergyproController.ArrayOfString;
  reportName : String;
begin
  inherited;
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'servicesObjectCode';
  args[0] := IntToStr(ENServicesConnectionObj.code);

  reportName := 'TechConditions/TechAgreement/agree';
  makeReport(reportName, argNames, args, 'pdf');
end;


procedure TfrmENServicesConnectionEdit.btnPrintTechAgreementGLClick(
  Sender: TObject);
var
  argNames, args : EnergyproController.ArrayOfString;
  reportName : String;
begin
  inherited;
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'servicesObjectCode';
  args[0] := IntToStr(ENServicesConnectionObj.code);

  reportName := 'TechConditions/GrantOfLand/agree';
  makeReport(reportName, argNames, args, 'pdf');
  reportName := 'TechConditions/GrantOfLand/plan';
  makeReport(reportName, argNames, args, 'pdf');
  reportName := 'TechConditions/GrantOfLand/protocol';
  makeReport(reportName, argNames, args, 'pdf');

end;

procedure TfrmENServicesConnectionEdit.btnRemovePlanFromTechCondClick(
  Sender: TObject);
Var
TempENPlanWork : ENPlanWorkControllerSoapPort;
plan : ENPlanWork;
objCode : Integer;
begin

  try
    objCode:=StrToInt( sgENPlanWork.Cells[0, sgENPlanWork.row] );
  except
    on EConvertError do Exit;
  end;

  plan := DMReports.getPlanByCode( objCode );

  if plan = nil then
  begin
      exit;
  end;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

   if (plan<>nil) then begin
       TempENPlanWork.removePlanFromTechConditions(plan,ENTechConditionsServicesObj.code);
    actUpdateExecute(Sender);
   end;

end;

procedure TfrmENServicesConnectionEdit.btnPrintBillForPrepaymentClick(
  Sender: TObject);
var argNames, args: EnergyproController.ArrayOfString;
    reportName: String;
begin
  if (ENServicesConnectionObj.calcTypeRef.code <> ENSERVICESOBJECT_CALCTYPE_BY_FACT) then Exit;
  if (ENServicesConnectionObj.contragentTypeRef.code = ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET) then Exit;

  /////
  if ENServicesConnectionObj.contractStatusRef = nil then Exit;

  if ENServicesConnectionObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'plancode';
  args[0] := IntToStr(DMReports.getPlanCodeForCalculationByElement(ENServicesConnectionObj.element.code));

  reportName := 'Services/Bill/rah';

  makeReport(reportName , argNames , args , 'pdf');
end;


procedure TfrmENServicesConnectionEdit.cbSmallArchFrmClick(
  Sender: TObject);
begin

  if (not cbSmallArchFrm.Checked) then
  begin
    ENTechConditionsServicesObj.tariffEntryRef := nil;
    ENCalc2ConnectTariffObj := nil;
    edtConnectionTariffName.Text := '';
    edtConnectionTariffValue.Text := '';
    edtSumma1Tariff.Text := '';
    edtSumma2Tariff.Text := '';
  end;

  if (cbSmallArchFrm.Checked)
  and (ENTechConditionsServicesObj.connectionKindRef.code =
    ENCONNECTIONKIND_STANDART)
  then
    edtTyServicesSumma.Text := '0';
  SetAgreeTechTermsPrepareBtnVisible;
end;


procedure TfrmENServicesConnectionEdit.chkBaseStationClick(
  Sender: TObject);
begin
  if ENTechConditionsServicesObj <> nil then
    if ENTechConditionsServicesObj.connectionKindRef <> nil then
      begin

        if (not chkBaseStation.Checked) then
        begin
          ENTechConditionsServicesObj.tariffEntryRef := nil;
          ENCalc2ConnectTariffObj := nil;
          edtConnectionTariffName.Text := '';
          edtConnectionTariffValue.Text := '';
          edtSumma1Tariff.Text := '';
          edtSumma2Tariff.Text := '';
        end;

        if (chkBaseStation.Checked)
          and (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART)
        then
          edtTyServicesSumma.Text := '0';
      end;
  SetAgreeTechTermsPrepareBtnVisible;
end;


procedure TfrmENServicesConnectionEdit.chkGeograhicFarObjectClick(
  Sender: TObject);
begin
  SetAgreeTechTermsPrepareBtnVisible;
end;

procedure TfrmENServicesConnectionEdit.actViewIncomeExecute(
  Sender: TObject);
Var TempENActIncomeTechConditions: ENActIncomeTechConditionsControllerSoapPort;
begin
  TempENActIncomeTechConditions := HTTPRIOENActIncomeTechConditions as ENActIncomeTechConditionsControllerSoapPort;
  frmENActIncomeTechConditionsEdit := TfrmENActIncomeTechConditionsEdit.Create(Application, dsView);
  try
    try
      frmENActIncomeTechConditionsEdit.ENActIncomeTechConditionsObj := TempENActIncomeTechConditions.getObject(StrToInt(sgENActIncomeTechConditions.Cells[0,sgENActIncomeTechConditions.Row]));
    except
      on EConvertError do Exit;
    end;
    frmENActIncomeTechConditionsEdit.ShowModal;
  finally
    frmENActIncomeTechConditionsEdit.Free;
    frmENActIncomeTechConditionsEdit:=nil;
  end;
end;


procedure TfrmENServicesConnectionEdit.actViewLandLeaseAgreementExecute(
  Sender: TObject);
var
  TempENSOLeaseAgreement: ENSOLeaseAgreementControllerSoapPort;
begin
  TempENSOLeaseAgreement := HTTPRIOENSOLeaseAgreement as ENSOLeaseAgreementControllerSoapPort;
  try
    ENSOLeaseAgreementObj := TempENSOLeaseAgreement.getObject(StrToInt(sgENSOLeaseAgreement.Cells[0,sgENSOLeaseAgreement.Row]));
  except
    on EConvertError do Exit;
  end;

  selectedRow := sgENSOLeaseAgreement.Row;
  frmENSOLeaseAgreementEdit:=TfrmENSOLeaseAgreementEdit.Create(Application, dsView);

  try
    frmENSOLeaseAgreementEdit.ShowModal;
  finally
    frmENSOLeaseAgreementEdit.Free;
    frmENSOLeaseAgreementEdit:=nil;
  end;

  if sgENSOLeaseAgreement.RowCount > selectedRow then
    sgENSOLeaseAgreement.Row := selectedRow
  else
    sgENSOLeaseAgreement.Row := sgENSOLeaseAgreement.RowCount - 1;

end;

procedure TfrmENServicesConnectionEdit.actViewLandLeaseAgreementFinColExecute(
  Sender: TObject);
Var TempFINContracts: FINContractsControllerSoapPort;
begin
  frmFINServicesObjectEdit := TfrmFINServicesObjectEdit.Create(Application, dsView);
  try
    TempFINContracts := HTTPRIOFINContracts as FINContractsControllerSoapPort;
    try
      frmFINServicesObjectEdit.FINContractsObj := TempFINContracts.getObjectFromFK(StrToInt(sgENSOLeaseAgreement.Cells[4,sgENSOLeaseAgreement.Row]));
    except
      on EConvertError do Exit;
    end;

    frmFINServicesObjectEdit.ShowModal;
  finally
    frmFINServicesObjectEdit.Free;
    frmFINServicesObjectEdit := nil;
  end;
end;

procedure TfrmENServicesConnectionEdit.actViewNecessityBuildingExecute(Sender: TObject);
var
  TempENNecessityBuilding: ENNecessityBuildingControllerSoapPort;
begin
  inherited;
  TempENNecessityBuilding := HTTPRIOENNecessityBuilding as ENNecessityBuildingControllerSoapPort;
  try
    ENNecessityBuildingObj := TempENNecessityBuilding.getObject(StrToInt(sgENNecessityBuilding.Cells[0,sgENNecessityBuilding.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENNecessityBuildingEdit := TfrmENNecessityBuildingEdit.Create(Application, dsView);

  try
    frmENNecessityBuildingEdit.ShowModal;
  finally
    frmENNecessityBuildingEdit.Free;
    frmENNecessityBuildingEdit:=nil;
  end;
end;


procedure TfrmENServicesConnectionEdit.actInsertIncomeExecute(
  Sender: TObject);
begin
  frmENActIncomeTechConditionsEdit := TfrmENActIncomeTechConditionsEdit.Create(Application, dsInsert);
  try
    frmENActIncomeTechConditionsEdit.ENActIncomeTechConditionsObj := ENActIncomeTechConditions.Create;
    frmENActIncomeTechConditionsEdit.EnTechConditionsServicesCode := ENTechConditionsServicesObj.code;
    frmENActIncomeTechConditionsEdit.departmentCode := ENTechConditionsServicesObj.department.code;
    frmENActIncomeTechConditionsEdit.soCode := ENServicesConnectionObj.code;

    if frmENActIncomeTechConditionsEdit.ShowModal = mrOk then
    begin
      if (frmENActIncomeTechConditionsEdit.ENActIncomeTechConditionsObj <> nil) then
        actUpdateIncomeExecute(Sender);
    end;
  finally
    frmENActIncomeTechConditionsEdit.Free;
    frmENActIncomeTechConditionsEdit:=nil;
  end;
end;


procedure TfrmENServicesConnectionEdit.actInsertNecessityBuildingExecute(Sender: TObject);
begin
  inherited;
  ENNecessityBuildingObj := ENNecessityBuilding.Create;
  SetNullIntProps(ENNecessityBuildingObj);
  SetNullXSProps(ENNecessityBuildingObj);

  ENNecessityBuildingObj.servicesObjectRef := ENServicesObjectRef.Create;
  ENNecessityBuildingObj.servicesObjectRef.code := ENServicesConnectionObj.code;

  try
    frmENNecessityBuildingEdit := TfrmENNecessityBuildingEdit.Create(Application, dsInsert);
    try
      if frmENNecessityBuildingEdit.ShowModal = mrOk then
      begin
        if ENNecessityBuildingObj <> nil then
          actUpdateNecessityBuildingExecute(Self);
      end;
    finally
      frmENNecessityBuildingEdit.Free;
      frmENNecessityBuildingEdit := nil;
    end;
  finally
    ENNecessityBuildingObj.Free;
  end;
end;


procedure TfrmENServicesConnectionEdit.actDeleteIncomeExecute(
  Sender: TObject);
var
   TempENActIncomeTechConditions: ENActIncomeTechConditionsControllerSoapPort;
   ObjCode : Integer;
begin
  TempENActIncomeTechConditions := HTTPRIOENActIncomeTechConditions as ENActIncomeTechConditionsControllerSoapPort;
  try
    ObjCode := StrToInt(sgENActIncomeTechConditions.Cells[0,sgENActIncomeTechConditions.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Прибутковий акт на договір про виконання ТУ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENActIncomeTechConditions.remove(ObjCode);
    actUpdateIncomeExecute(Sender);
  end;
end;


procedure TfrmENServicesConnectionEdit.actDeleteLandLeaseAgreementExecute(
  Sender: TObject);
Var TempENSOLeaseAgreement: ENSOLeaseAgreementControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSOLeaseAgreement := HTTPRIOENSOLeaseAgreement as ENSOLeaseAgreementControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSOLeaseAgreement.Cells[0,sgENSOLeaseAgreement.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Связку ServicesObject с Фин. Кол.(Договор Аренды)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSOLeaseAgreement.remove(ObjCode);
      updateSOLeaseAgreement;
  end;
end;


procedure TfrmENServicesConnectionEdit.actDeleteNecessityBuildingExecute(Sender: TObject);
var
  ObjCode: Integer;
  TempENNecessityBuilding: ENNecessityBuildingControllerSoapPort;
begin
  inherited;
  TempENNecessityBuilding := HTTPRIOENNecessityBuilding as ENNecessityBuildingControllerSoapPort;
  try
    ObjCode := StrToInt(sgENNecessityBuilding.Cells[0,sgENNecessityBuilding.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Вы действительно хотите удалить (Необхідність будівництва об`єктів для договору про приєднання) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENNecessityBuilding.remove(ObjCode);
    actUpdateNecessityBuildingExecute(Sender);
  end;
end;


procedure TfrmENServicesConnectionEdit.actEditIncomeExecute(
  Sender: TObject);
Var TempENActIncomeTechConditions: ENActIncomeTechConditionsControllerSoapPort;
begin
  TempENActIncomeTechConditions := HTTPRIOENActIncomeTechConditions as ENActIncomeTechConditionsControllerSoapPort;
  frmENActIncomeTechConditionsEdit := TfrmENActIncomeTechConditionsEdit.Create(Application, dsEdit);
  try
    try
      frmENActIncomeTechConditionsEdit.ENActIncomeTechConditionsObj := TempENActIncomeTechConditions.getObject(StrToInt(sgENActIncomeTechConditions.Cells[0,sgENActIncomeTechConditions.Row]));
    except
      on EConvertError do Exit;
    end;
    frmENActIncomeTechConditionsEdit.EnTechConditionsServicesCode := ENTechConditionsServicesObj.code;
    frmENActIncomeTechConditionsEdit.departmentCode := ENTechConditionsServicesObj.department.code;
    frmENActIncomeTechConditionsEdit.soCode := ENServicesConnectionObj.code;
    if frmENActIncomeTechConditionsEdit.ShowModal= mrOk then
    begin
      actUpdateIncomeExecute(Sender);
    end;
  finally
    frmENActIncomeTechConditionsEdit.Free;
    frmENActIncomeTechConditionsEdit:=nil;
  end;
end;


procedure TfrmENServicesConnectionEdit.actEditNecessityBuildingExecute(Sender: TObject);
var
  TempENNecessityBuilding: ENNecessityBuildingControllerSoapPort;
begin
  inherited;
  TempENNecessityBuilding := HTTPRIOENNecessityBuilding as ENNecessityBuildingControllerSoapPort;
  try
    ENNecessityBuildingObj := TempENNecessityBuilding.getObject(StrToInt(sgENNecessityBuilding.Cells[0,sgENNecessityBuilding.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENNecessityBuildingEdit := TfrmENNecessityBuildingEdit.Create(Application, dsEdit);
  try
    if frmENNecessityBuildingEdit.ShowModal= mrOk then
    begin
      actUpdateNecessityBuildingExecute(Sender);
    end;
  finally
    frmENNecessityBuildingEdit.Free;
    frmENNecessityBuildingEdit:=nil;
  end;
end;


procedure TfrmENServicesConnectionEdit.actUpdateIncomeExecute(
  Sender: TObject);
Var TempENActIncomeTechConditions: ENActIncomeTechConditionsControllerSoapPort;
   ENActIncomeFilter :  ENActIncomeTechConditionsFilter;
   ENActIncomeTechConditionsList: ENActIncomeTechConditionsShortList;
   i, LastCount: Integer;
begin
  if ENTechConditionsServicesObj = nil then
    raise Exception.Create('NET-4231 Не знайдено зв''язаний об''єкт [ENTechConditionsServices]!');

  if ENTechConditionsServicesObj.code = LOW_INT then
    raise Exception.Create('NET-4231 Не знайдено зв''язаний об''єкт [ENTechConditionsServices]!');

  TempENActIncomeTechConditions := HTTPRIOENActIncomeTechConditions as ENActIncomeTechConditionsControllerSoapPort;
  ClearGrid(sgENActIncomeTechConditions);

  ENActIncomeFilter := ENActIncomeTechConditionsFilter.Create;
  SetNullIntProps(ENActIncomeFilter);
  SetNullXSProps(ENActIncomeFilter);
  ENActIncomeFilter.techCondServicesRef := ENTechConditionsServicesRef.Create;
  ENActIncomeFilter.techCondServicesRef.code := ENTechConditionsServicesObj.code;

  ENActIncomeTechConditionsList:= TempENActIncomeTechConditions.getScrollableFilteredList(ENActIncomeFilter,0,-1);

  LastCount:=High(ENActIncomeTechConditionsList.list);

  if LastCount > -1 then
     sgENActIncomeTechConditions.RowCount:=LastCount+2
  else
     sgENActIncomeTechConditions.RowCount:=2;

  with sgENActIncomeTechConditions do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActIncomeTechConditionsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENActIncomeTechConditionsList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENActIncomeTechConditionsList.list[i].numbergen;
        if ENActIncomeTechConditionsList.list[i].dategen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENActIncomeTechConditionsList.list[i].dategen);
        if ENActIncomeTechConditionsList.list[i].actDateStart = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENActIncomeTechConditionsList.list[i].actDateStart);
        if ENActIncomeTechConditionsList.list[i].actDateEnd = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(ENActIncomeTechConditionsList.list[i].actDateEnd);
        if ENActIncomeTechConditionsList.list[i].summaGen = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENActIncomeTechConditionsList.list[i].summaGen.DecimalString;
        if ENActIncomeTechConditionsList.list[i].summaVat = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := ENActIncomeTechConditionsList.list[i].summaVat.DecimalString;

        Cells[7,i+1] := ENActIncomeTechConditionsList.list[i].statusRefName;

        LastRow:=i+1;
        sgENActIncomeTechConditions.RowCount:=LastRow+1;
      end;

  ColCount:=ColCount+1;
  
  sgENActIncomeTechConditions.Row:=1;
end;


procedure TfrmENServicesConnectionEdit.actUpdateLandLeaseAgreementExecute(
  Sender: TObject);
begin
  inherited;
   updateSOLeaseAgreement;
end;

procedure TfrmENServicesConnectionEdit.actUpdateNecessityBuildingExecute(Sender: TObject);
var
  i: Integer;
  TempENNecessityBuilding: ENNecessityBuildingControllerSoapPort;
  necessityBuildingFilter: ENNecessityBuildingFilter;
  ENNecessityBuildingList: ENNecessityBuildingShortList;
begin
  inherited;
  SetGridHeaders(ENNecessityBuildingHeaders, sgENNecessityBuilding.ColumnHeaders);
  ClearGrid(sgENNecessityBuilding);
  TempENNecessityBuilding := HTTPRIOENNecessityBuilding as ENNecessityBuildingControllerSoapPort;

  necessityBuildingFilter := ENNecessityBuildingFilter.Create;
  SetNullIntProps(necessityBuildingFilter);
  SetNullXSProps(necessityBuildingFilter);
  necessityBuildingFilter.servicesObjectRef := ENServicesObjectRef.Create;
  necessityBuildingFilter.servicesObjectRef.code := ENServicesConnectionObj.code;

  ENNecessityBuildingList := TempENNecessityBuilding.getScrollableFilteredList(necessityBuildingFilter, 0, -1);
  LastCount:=High(ENNecessityBuildingList.list);

  if LastCount > -1 then
    sgENNecessityBuilding.RowCount:=LastCount+2
  else
    sgENNecessityBuilding.RowCount:=2;

  with sgENNecessityBuilding do
  for i:=0 to LastCount do
    begin
      Application.ProcessMessages;
      if ENNecessityBuildingList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENNecessityBuildingList.list[i].code)
      else
        Cells[0,i+1] := '';

      Cells[1,i+1] := ENNecessityBuildingList.list[i].elementTypeRefName;
      Cells[2,i+1] := ENNecessityBuildingList.list[i].voltageNominalValue;

      if ENNecessityBuildingList.list[i].countGen = nil then
        Cells[3,i+1] := ''
      else
        Cells[3,i+1] := ENNecessityBuildingList.list[i].countGen.DecimalString;

      if ENNecessityBuildingList.list[i].summaGen = nil then
        Cells[4,i+1] := ''
      else
        Cells[4,i+1] := ENNecessityBuildingList.list[i].summaGen.DecimalString;

      Cells[5,i+1] := ENNecessityBuildingList.list[i].description;

      if ENNecessityBuildingList.list[i].dateEdit = nil then
        Cells[6,i+1] := ''
      else
        Cells[6,i+1] := XSDateTimeWithDate2String(ENNecessityBuildingList.list[i].dateEdit);

      Cells[7,i+1] := ENNecessityBuildingList.list[i].userGen;

      LastRow:=i+1;
      sgENNecessityBuilding.RowCount:=LastRow+1;
    end;

  ColCount:=ColCount+1;
  sgENNecessityBuilding.Row:=1;
end;


procedure TfrmENServicesConnectionEdit.LoadUnitedGroupsForENLine04;
begin

end;

procedure TfrmENServicesConnectionEdit.LoadUnitedGroupsForENSubstation04;
begin

end;

procedure TfrmENServicesConnectionEdit.LoadUnitedGroupsForENLine10;

begin

end;

procedure TfrmENServicesConnectionEdit.LoadUnitedGroupsForENSubstation35;

begin

end;

procedure TfrmENServicesConnectionEdit.MenuItem12Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML( //http://jira:8080/browse/SUPP-39916
    'TechConditions/accompanyingSheet/accompanyingSheet1',
    'В.А. Кічіянц', 'Заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.MenuItem13Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet1',
    'В.Л. Мануйленко', 'Перший заступник директора технічного');
end;

procedure TfrmENServicesConnectionEdit.MenuItem14Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet1',
    'В.Д. Гончаров', 'Директор технічний');
end;

procedure TfrmENServicesConnectionEdit.MenuItem15Click(Sender: TObject);
begin
  showAccompanyingSheetJRXML(
    'TechConditions/accompanyingSheet/accompanyingSheet1', '', '');
end;

procedure TfrmENServicesConnectionEdit.MenuItem31Click(Sender: TObject);
Var
  ccNodeCode: Integer;
begin
   try
     ccNodeCode := StrToInt(sgENSO2NodeOthers.Cells[1,sgENSO2NodeOthers.Row]);
   except
   on EConvertError do Exit;
  end;
  ShowNodeInTree(ccNodeCode);
  updateSO2NodeBySelectedNode;
end;

procedure TfrmENServicesConnectionEdit.MenuItem33Click(Sender: TObject);

begin
    if  Application.MessageBox(PChar('Вы действительно хотите выбрать точку присоединения?!'),
      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2) = IDOK then
    begin
      ENSO2NodeObj:=ENSO2Node.Create;
      SetNullIntProps(ENSO2NodeObj);
      SetNullXSProps(ENSO2NodeObj);

      ENSO2NodeObj.ccNodeCode := CCNodeExtShort(MainTree.Selected.Data).code;
      ENSO2NodeObj.servicesobject := ENServicesObjectRef.Create;
      ENSO2NodeObj.servicesobject.code := ENServicesConnectionObj.code;
      ENSO2NodeObj.power := TXSDecimal.Create;
      ENSO2NodeObj.power.decimalString := edtTyServicesPower.Text;

      try
        frmENSO2NodeEdit:=TfrmENSO2NodeEdit.Create(Application, dsInsert);
        frmENSO2NodeEdit.edtCcNodeCode.Text := IntToStr(ENSO2NodeObj.ccNodeCode);
        frmENSO2NodeEdit.edtServicesName.Text :=  ENServicesConnectionObj.contractNumberServices + ' | ' + ENServicesConnectionObj.contragentName;
        frmENSO2NodeEdit.edtPower.Text := ENSO2NodeObj.power.decimalString;
        DisableControls([frmENSO2NodeEdit.edtCcNodeCode, frmENSO2NodeEdit.edtServicesName, frmENSO2NodeEdit.spbENServicesObject, frmENSO2NodeEdit.edtCCTowerCode]);

        try
          if frmENSO2NodeEdit.ShowModal = mrOk then
          begin
            if ENSO2NodeObj<>nil then
                updateNodes;
          end;
        finally
          frmENSO2NodeEdit.Free;
          frmENSO2NodeEdit:=nil;
        end;
      finally
        ENSO2NodeObj.Free;
      end;

    end;

end;

procedure TfrmENServicesConnectionEdit.MenuItem35Click(Sender: TObject);
var
  TempENSO2Node: ENSO2NodeControllerSoapPort;
begin
  TempENSO2Node := HTTPRIOENSO2Node as ENSO2NodeControllerSoapPort;
  try
    ENSO2NodeObj := TempENSO2Node.getObject(StrToInt(sgENSO2NodeOthers.Cells[0,sgENSO2NodeOthers.Row]));
  except
    on EConvertError do Exit;
  end;

  try
    frmENSO2NodeEdit:=TfrmENSO2NodeEdit.Create(Application, dsEdit);
    frmENSO2NodeEdit.DisableControls([frmENSO2NodeEdit.edtCcNodeCode, frmENSO2NodeEdit.edtServicesName]);
    try
      if frmENSO2NodeEdit.ShowModal = mrOk then
      begin
        if ENSO2NodeObj<>nil then
            updateSO2NodeBySelectedNode;
      end;
    finally
      frmENSO2NodeEdit.Free;
      frmENSO2NodeEdit:=nil;
    end;
  finally
    ENSO2NodeObj.Free;
  end;
end;

procedure TfrmENServicesConnectionEdit.MenuItem40Click(Sender: TObject);
Var TempENSO2Node: ENSO2NodeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSO2Node := HTTPRIOENSO2Node as ENSO2NodeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSO2Node.Cells[0,sgENSO2Node.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Связка ServicesObject с узлом дерева CallCentre) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSO2Node.remove(ObjCode);
      updateNodes;
  end;
end;

procedure TfrmENServicesConnectionEdit.MenuItem41Click(Sender: TObject);
Var TempENSO2Node: ENSO2NodeControllerSoapPort;
    i , ObjCode: integer;
    state_, isSel : boolean;
begin
 TempENSO2Node := HTTPRIOENSO2Node as ENSO2NodeControllerSoapPort;

  if Application.MessageBox(PChar('Вы действительно хотите удалить выбранные строки (Связка ServicesObject с узлом дерева CallCentre) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

      state_ := false;
      isSel := false;

      for i:=1 to sgENSO2NodeOthers.RowCount - 1 do
      begin
         sgENSO2NodeOthers.GetCheckBoxState(1,i,state_);
         if state_ then
         begin
           isSel := true;
         end;
      end;

      if not isSel then
      begin
         Application.MessageBox(PChar('Виберіть хоча б одну точку !!!'), PChar('Увага !'),MB_ICONWARNING);
         Exit;
      end;


      for i:=1 to sgENSO2NodeOthers.RowCount - 1 do
      begin
         sgENSO2NodeOthers.GetCheckBoxState(1,i,state_);
         if state_ then
         begin

            try
              ObjCode := StrToInt( sgENSO2NodeOthers.Cells[0, i ]);
            except
              on EConvertError do Exit;
            end;

           TempENSO2Node.remove(ObjCode);


         end;
      end;

       updateSO2NodeBySelectedNode;
   end;

end;

procedure TfrmENServicesConnectionEdit.MenuItem90Click(Sender: TObject);
var argNames, args: EnergyproController.ArrayOfString;
    reportName, pathFileName: String;
begin
    if ENServicesConnectionObj = nil then Exit;

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'agreeCode';
    args[0] := IntToStr(ENServicesConnectionObj.code);

    reportName := 'TechConditions/additionalAgreements/additionalAgreementWithoutWork';

    //SUPP-84438
    if Application.MessageBox(PChar('Додати у "Вкладення"?'),
        PChar('Внимание!'),MB_ICONQUESTION+ MB_YESNO) = IDYES then
    begin
         pathFileName := makeReport(reportName, argNames, args, 'pdf');
         ENDocAttachmentObj := ENDocAttachment.Create;
         ENDocAttachment2ENServices := ENDocAttachment2ENServicesObject.Create;
         try
            frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
            frmDFDocAttachmentEdit.soCode := ENServicesConnectionObj.code;
            frmDFDocAttachmentEdit.edtFileName.Text := pathFileName;
            frmDFDocAttachmentEdit.edtCommentGen.Text := '';
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
    end
    else
        makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmENServicesConnectionEdit.MenuItem91Click(Sender: TObject);
var argNames, args: EnergyproController.ArrayOfString;
    reportName, pathFileName: String;
begin
    if ENServicesConnectionObj = nil then Exit;

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'agreeCode';
    args[0] := IntToStr(ENServicesConnectionObj.code);

    reportName := 'TechConditions/additionalAgreements/additionalAgreementWithWork';

    //SUPP-84438
    if Application.MessageBox(PChar('Додати у "Вкладення"?'),
        PChar('Внимание!'),MB_ICONQUESTION+ MB_YESNO) = IDYES then
    begin
         pathFileName := makeReport(reportName, argNames, args, 'pdf');
         ENDocAttachmentObj := ENDocAttachment.Create;
         ENDocAttachment2ENServices := ENDocAttachment2ENServicesObject.Create;
         try
            frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
            frmDFDocAttachmentEdit.soCode := ENServicesConnectionObj.code;
            frmDFDocAttachmentEdit.edtFileName.Text := pathFileName;
            frmDFDocAttachmentEdit.edtCommentGen.Text := '';
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
    end
    else
        makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmENServicesConnectionEdit.actSaveAttachmentAsExecute(
  Sender: TObject);
var
  i : Integer;
  TempENDocAttachment : ENDocAttachmentControllerSoapPort;
  result, fname, fileName, dir, ftpDir, fileExt: string;
  ftpClient: TIdFTP;
  FileNames: TStrings;
  fileSize: Integer;
  att : ENDocAttachment;
  serv : ENDocAttachmentServer;
begin
  inherited;
  TempENDocAttachment := HTTPRIOENDocAttachment as ENDocAttachmentControllerSoapPort;
  try
    ENDocAttachmentObj := TempENDocAttachment.getObject(StrToInt(sgENDocAttachment.Cells[0,sgENDocAttachment.Row]));
    att := DMReports.getENDocAttachmentByCode(ENDocAttachmentObj.code);
    if att = nil then Exit;
    serv := DMReports.getENDocAttachmentServerByCode(att.serverRef.code);
    if serv = nil then Exit;
  except
    on EConvertError do Exit;
  end;

  fileName := ExtractFileName(att.fileLink);
  fileExt := StringReplace(ExtractFileExt(att.fileLink), '.', '', [rfReplaceAll]);
  FileNames := TStringList.Create;

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

  dlgSave.InitialDir := 'C:\';
  dlgSave.Filter := '*.' + fileExt;
  dlgSave.DefaultExt := fileExt;
  dlgSave.FilterIndex := 1;
  dlgSave.FileName := fname;

  if dlgSave.Execute then
  begin
    if CopyFile(PChar(ExtractFilePath(Application.ExeName) + TempReportsPath + fname), PChar(dlgSave.FileName), False) then
      ShowMessage('Файл сохранен: ' + dlgSave.FileName);
  end;

end;

procedure TfrmENServicesConnectionEdit.actSaveFinexecutDepartmentExecute(
  Sender: TObject);

Var TempENPlanWork: ENPlanWorkControllerSoapPort;
tPlan : ENPlanWork;

  ObjCode: Integer;

  ///// 05.08.10 ВРЕМЕННО !!!
  TempUser: UserControllerSoapPort;
  UserObj: User;
  allowEdit: Boolean;
  /////

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

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  selectedRow := sgENPlanWork.Row;

  frmENPlanWorkAddInfoEdit:=TfrmENPlanWorkAddInfoEdit.Create(Application, dsEdit);
  frmENPlanWorkAddInfoEdit.Caption := 'Зміна виконавця робіт';
  frmENPlanWorkAddInfoEdit.HideControls( [frmENPlanWorkAddInfoEdit.edtDateStart, frmENPlanWorkAddInfoEdit.edtDateFinal ,
                                             frmENPlanWorkAddInfoEdit.lblDateStart  , frmENPlanWorkAddInfoEdit.lblDateFinal , frmENPlanWorkAddInfoEdit.gbPlanMOL]);
  frmENPlanWorkAddInfoEdit.isChangeExecutorDepartment:= True;
  frmENPlanWorkAddInfoEdit.gbPlanMOL.Visible := False;

  try
    ///// 05.08.10 ВРЕМЕННО !!!
    allowEdit := false;

    if (tPlan.departmentRef.code = 15) or (tPlan.departmentRef.code = 16) then
    begin
      TempUser := HTTPRIOAuth as UserControllerSoapPort;
      UserObj := TempUser.getCurrent;
      if ((tPlan.departmentRef.code = 15) and (UserObj.domain = 'root.gor')) or
         ((tPlan.departmentRef.code = 16) and (UserObj.domain = 'root.kal')) then
        allowEdit := true;
    end;
    /////

     try
       frmENPlanWorkAddInfoEdit.planObj := TempENPlanWork.getObject(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
     except
     on EConvertError do Exit;
    end;

    if frmENPlanWorkAddInfoEdit.ShowModal= mrOk then
      begin
         pcCalculationChange(Sender);
      end;

        if  sgENPlanWork.RowCount > selectedRow then
           sgENPlanWork.Row := selectedRow
        else
           sgENPlanWork.Row :=  sgENPlanWork.RowCount-1;

  finally
    frmENPlanWorkAddInfoEdit.Free;
    frmENPlanWorkAddInfoEdit := nil;
  end;

end;

procedure TfrmENServicesConnectionEdit.actAddAttachmentsExecute(
  Sender: TObject);
begin
  inherited;
  ENDocAttachmentObj := ENDocAttachment.Create;
  ENDocAttachment2ENServices := ENDocAttachment2ENServicesObject.Create;
  try
    frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
    frmDFDocAttachmentEdit.soCode := ENServicesConnectionObj.code;
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

procedure TfrmENServicesConnectionEdit.actAddLandLeaseAgreementExecute(
  Sender: TObject);
begin
  ENSOLeaseAgreementObj:= ENSOLeaseAgreement.Create;

  SetNullIntProps(ENSOLeaseAgreementObj);
  SetNullXSProps(ENSOLeaseAgreementObj);
  ENSOLeaseAgreementObj.servicesObjectRef := ENServicesObjectRef.Create;
  ENSOLeaseAgreementObj.servicesObjectRef.code := ENServicesConnectionObj.code;

  try
    frmENSOLeaseAgreementEdit:=TfrmENSOLeaseAgreementEdit.Create(Application, dsInsert);
    try
      if frmENSOLeaseAgreementEdit.ShowModal = mrOk then
      begin
        if frmENSOLeaseAgreementEdit<>nil then
            //TempENSOValues.add(ENSOValuesObj);
            updateSOLeaseAgreement;
      end;
    finally
      frmENSOLeaseAgreementEdit.Free;
      frmENSOLeaseAgreementEdit:=nil;
    end;
  finally
    ENSOLeaseAgreementObj.Free;
    ENSOLeaseAgreementObj := nil;
  end;

end;


procedure TfrmENServicesConnectionEdit.actAddENSOBillExecute(Sender: TObject);
var sumTotal, sumCoeff, sumBills, sumPayments, maxSum : Double;
soValues : ENSOValuesShortList;
ENSOBillList : ENSOBillShortList;
ENPayment2SOList : ENPayment2SOShortList;
ENSOBillItem : ENSOBillShort;
ENSOPaymentItem : ENPayment2SOShort;
  ENConnectionTariffShortObj : ENConnectionTariffShort;
  TempENConnectionTariff : ENConnectionTariffControllerSoapPort;
  TempENConnectionTariffEntry : ENConnectionTariffEntryControllerSoapPort;
  calcTariff1ShortObj : ENConnectionTariffShort;
  tariffEntry1: ENConnectionTariffEntry;
  connectionTariffValue, powerContract, sumVat, sumGen : Double;
begin
  ENSOBillObj:=ENSOBill.Create;

  ENSOBillObj.servicesObjectRef := ENServicesObjectRef.Create;
  ENSOBillObj.servicesObjectRef.code := ENServicesConnectionObj.code;

  ENSOBillList := getENSOBillList;
  ENPayment2SOList := getENPayment2SOList;

  sumBills := 0;  sumPayments := 0; maxSum := 0; sumTotal := 0;

    if Assigned(ENTechConditionsServicesObj)
      and Assigned(ENTechConditionsServicesObj.tySummaGen) then begin
      sumTotal := RoundTo(StrToFloat(ENTechConditionsServicesObj.tySummaGen.DecimalString)
      , -2);
    end;


  if (ENSOBillList.totalCount = 0)
    and (ENPayment2SOList.totalCount = 0) then begin
      //SUPP-93088
      soValues := getENSOValuesList(ENSOValuesController.ArrayOfInteger.Create(ENDATE_NUMBER_REGISTRATION_STATEMENT
                                      ,ENCONNECTIONKIND_NO_STANDART_ACCOUNT_POWER_50));
      if (soValues.totalCount = 2) then
      begin
          if (soValues.list[0].soValuesTypeCode = ENDATE_NUMBER_REGISTRATION_STATEMENT)
            and (EncodeDate(soValues.list[0].dateVal.Year, soValues.list[0].dateVal.Month,
                      soValues.list[0].dateVal.Day) >= EncodeDate(2020,7,1))  then
          begin
              if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_NO_STANDART)or
                  (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_NO_STANDART_READY_MADE) then
              begin
                    TempENConnectionTariff := HTTPRIOENConnectionTariff as ENConnectionTariffControllerSoapPort;
                    TempENConnectionTariffEntry := HTTPRIOENConnectionTariffEntry as ENConnectionTariffEntryControllerSoapPort;

                    // применяется два тарифа
                    if (ENTechConditionsServicesObj.isUse2Tariffs = ENTECHCONDITIONS_ISUSE2TARIFFS_YES) then
                    begin
                      ENCalc2ConnectTariffObj := DMReports.getCalc2TariffByTechCondCode(ENTechConditionsServicesObj.code);

                      if (ENCalc2ConnectTariffObj <> nil) then
                      begin
                          // 1-й тариф
                          if (ENServicesConnectionObj.techConObjects.dateGen = nil) then
                            calcTariff1ShortObj := TempENConnectionTariff.getShortObject(
                              TempENConnectionTariffEntry.getObject(ENCalc2ConnectTariffObj.tariffEntry1Ref.code).tariffRef.code)
                          else
                            calcTariff1ShortObj := TempENConnectionTariff.getShortObject(
                            TempENConnectionTariffEntry.getObject(
                              ENCalc2ConnectTariffObj.tariffEntry1Ref.code).tariffRef.code, ENServicesConnectionObj.techConObjects.dateGen);

                          if calcTariff1ShortObj <> nil then
                          begin
                            tariffEntry1 := TempENConnectionTariffEntry.getObject(ENCalc2ConnectTariffObj.tariffEntry1Ref.code);
                            connectionTariffValue := StrToFloat(tariffEntry1.value.DecimalString);
                          end;
                      end;
                    end else
                    begin
                      if (ENTechConditionsServicesObj.tariffEntryRef <> nil) and (ENTechConditionsServicesObj.tariffEntryRef.code <> Low(Integer)) then
                      begin
                          if (ENServicesConnectionObj.techConObjects.dateGen = nil) then
                            ENConnectionTariffShortObj := TempENConnectionTariff.getShortObject(
                              TempENConnectionTariffEntry.getObject(ENTechConditionsServicesObj.tariffEntryRef.code).tariffRef.code)
                          else
                            ENConnectionTariffShortObj := TempENConnectionTariff.getShortObject(
                            TempENConnectionTariffEntry.getObject(
                              ENTechConditionsServicesObj.tariffEntryRef.code).tariffRef.code, ENServicesConnectionObj.techConObjects.dateGen);

                          if ENConnectionTariffShortObj <> nil then
                          begin
                            tariffEntry1 := TempENConnectionTariffEntry.getObject(ENTechConditionsServicesObj.tariffEntryRef.code);
                            connectionTariffValue := StrToFloat(tariffEntry1.value.DecimalString);
                          end;
                      end;
                    end;

                    powerContract := StrToFloat(ENTechConditionsServicesObj.tyServicesPower.DecimalString);
                    //Сума без ПДВ, грн. (50%)
                    sumGen := RoundTo((connectionTariffValue * powerContract * 0.5)*1000, -2);
                    //ПДВ, грн.
                    sumVat :=  RoundTo(sumGen * 0.2, -2);
                    //Всього з ПДВ, грн.
                    sumTotal := RoundTo(sumGen + sumVat, -2);
              end;
          end;
      end else
      begin
          soValues := getENSOValuesList(ENSOValuesController.ArrayOfInteger.Create(ENCONNECTIONKIND_STANDART_20
            ,ENCONNECTIONKIND_STANDART_100));

          sumCoeff := 1;
          if (soValues.totalCount = 1)
            and (soValues.list[0].soValuesTypeCode = ENCONNECTIONKIND_STANDART_20) then begin
               sumCoeff := 0.2;
          end;
          sumTotal := RoundTo(sumTotal * sumCoeff, -2);
      end;

  end else begin
    for ENSOBillItem in ENSOBillList.list do
      sumBills := sumBills + RoundTo(StrToFloat(ENSOBillItem.sumTotal.DecimalString), -2);
    for ENSOPaymentItem in ENPayment2SOList.list do
      sumPayments := sumPayments + RoundTo(StrToFloat(ENSOPaymentItem.sumTotal.DecimalString), -2);

      if sumPayments > sumBills then begin
        maxSum := sumPayments;
      end else begin
        maxSum := sumBills;
      end;
      sumTotal := sumTotal - maxSum;
      if sumTotal < 0 then sumTotal := 0;
  end;

  try

    frmENSOBillEdit:=TfrmENSOBillEdit.Create(Application, dsInsert, sumTotal);
    try
      if frmENSOBillEdit.ShowModal = mrOk then
      begin
        if ENSOBillObj<>nil then
            Self.actUpdateENSOBillExecute(Sender);
      end;
    finally
      frmENSOBillEdit.Free;
      frmENSOBillEdit:=nil;
    end;
  finally
    ENSOBillObj.Free;
  end;
end;

procedure TfrmENServicesConnectionEdit.actUpdateActHozExecute(
  Sender: TObject);
var
  TempENAct: ENActControllerSoapPort;
  actFilter: ENActFilter;
  act2Filter: ENActFilter;
  ENActList: ENActShortList;
  ENAct2List: ENActShortList;
  actDate: String;
  i, LastCount, LastCount2, rowCount2 : Integer; //LastRow: Integer;
begin
  ClearGrid(sgENAct);

  if ENServicesConnectionObj = nil then Exit;
  if ENServicesConnectionObj.element = nil then Exit;
  if ENServicesConnectionObj.element.code = LOW_INT then Exit;

  actDate := '';
    
  TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

  actFilter := ENActFilter.Create;
  SetNullIntProps(actFilter);
  SetNullXSProps(actFilter);
  actFilter.element := ENElement.Create;
  actFilter.element.code := ENServicesConnectionObj.element.code;

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


  if (ENTechConditionsServicesObj <> nil) then
    LastCount2 := High(ENAct2List.list)
  else
    LastCount2 := -1;

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
      if ENActList.list[i].dateGen = nil then
        Cells[2,i+1] := ''
      else
        Cells[2,i+1] := XSDate2String(ENActList.list[i].dateGen);

      if (i = 0) then
        actDate := Cells[2, i + 1];

      Cells[3,i+1] := ENActList.list[i].finMolName;
      Cells[4,i+1] := ENActList.list[i].actTypeRefName;
      Cells[5,i+1] := ENActList.list[i].statusRefName;

      sgENAct.RowCount := i + 2;
    end;

    if (ENTechConditionsServicesObj <> nil) then
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
          if ENAct2List.list[i].dateGen = nil then
            Cells[2,i+rowCount2] := ''
          else
            Cells[2,i+rowCount2] := XSDate2String(ENAct2List.list[i].dateGen);

          if (i = 0) then
            actDate := Cells[2, i + 1+rowCount2];

          Cells[3,i+rowCount2] := ENAct2List.list[i].finMolName;
          Cells[4,i+rowCount2] := ENAct2List.list[i].actTypeRefName;
          Cells[5,i+rowCount2] := ENAct2List.list[i].statusRefName;
        end;
    end;


  sgENAct.Row := 1;
end;

procedure TfrmENServicesConnectionEdit.actUpdateServicesFromSideExecute(
  Sender: TObject);
 var
  TempRQFKOrder: RQFKOrderControllerSoapPort;
  i, LastCount, LastRow: Integer;
  RQFKOrderList: RQFKOrderShortList;
  FKOrderFilter : RQFKOrderFilter;
begin
    sgRQFKOrder.ColumnHeaders[3] := 'Код постачальника';
    sgRQFKOrder.ColumnHeaders[4] := 'Постачальник';
    sgRQFKOrder.ColWidths[4] := 400;
    sgRQFKOrder.ColumnHeaders[5] := 'сума (без ПДВ)';
    sgRQFKOrder.ColWidths[6] := 0;
    sgRQFKOrder.ColWidths[8] := 0;
    sgRQFKOrder.ColWidths[9] := 0;
    sgRQFKOrder.ColWidths[10] := 0;
    sgRQFKOrder.ColWidths[11] := 0;
    sgRQFKOrder.ColWidths[12] := 0;

     TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

     FKOrderFilter := RQFKOrderFilter.Create;
     SetNullIntProps(FKOrderFilter);
     SetNullXSProps(FKOrderFilter);

     FKOrderFilter.kind := RQFKOrderKind.Create;
     FKOrderFilter.kind.code := RQFKORDER_KIND_SERVICES_FROM_SIDE;
     FKOrderFilter.conditionSQL := ' code in ( select rf2pl.fkordercode from rqfkorder2planfact rf2pl ' +
                                   ' where rf2pl.plancode in ( ' +
                                   ' select ct2pl.planrefcode from entechcond2planwork ct2pl ' +
				   ' where ct2pl.techconservicesrefcode = ' + IntToStr(ENTechConditionsServicesObj.code) + ' ) ) ' ;


     RQFKOrderList := TempRQFKOrder.getScrollableFilteredListNoSegr(RQFKOrderFilter(FKOrderFilter),0,-1);

  LastCount:=High(RQFKOrderList.list);

  if LastCount > -1 then
     sgRQFKOrder.RowCount:=LastCount+2
  else
     sgRQFKOrder.RowCount:=2;

   with sgRQFKOrder do
    for i:=0 to LastCount do
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

        if RQFKOrderFilter(FKOrderFilter).kind.code in [RQFKORDER_KIND_PRIHOD_POSTAVKA, RQFKORDER_KIND_PRIHOD_BUFET, RQFKORDER_KIND_SERVICES_FROM_SIDE] then
          Cells[3,i+1] := RQFKOrderList.list[i].orgOkpo
        else
          Cells[3,i+1] := RQFKOrderList.list[i].molInCode;

        if RQFKOrderFilter(FKOrderFilter).kind.code in [RQFKORDER_KIND_PRIHOD_POSTAVKA, RQFKORDER_KIND_PRIHOD_BUFET, RQFKORDER_KIND_SERVICES_FROM_SIDE] then
          Cells[4,i+1] := RQFKOrderList.list[i].orgName
        else
          Cells[4,i+1] := RQFKOrderList.list[i].molInName;

        if RQFKOrderFilter(FKOrderFilter).kind.code in [RQFKORDER_KIND_SERVICES_FROM_SIDE] then
          Cells[5,i+1] := RQFKOrderList.list[i].sumWithoutNds.DecimalString
        else
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

       

        LastRow:=i+1;
        sgRQFKOrder.RowCount:=LastRow+1;
      end;
   //ColCount:=ColCount+1;
   sgRQFKOrder.Row:=1;
end;


procedure TfrmENServicesConnectionEdit.actUpdateENActsExecute(
  Sender: TObject);
begin
  actUpdateActHozExecute(Sender);
  actUpdateServicesFromSideExecute(Sender);
end;


procedure TfrmENServicesConnectionEdit.actUpdateENSOContractExecute(
  Sender: TObject);
begin
  inherited;
  updateENSOContract;
end;
procedure TfrmENServicesConnectionEdit.actUpdateENSOBillExecute(
  Sender: TObject);
begin
  updateBills;
end;


procedure TfrmENServicesConnectionEdit.spbENElementSecondaryClick(Sender: TObject);
var
  frmENElementShow : TfrmENElementShow;
  f : ENElementFilter;
  //invNum, depName : String;
  //depCode : Integer;
  //depShort : ENDepartmentShort;
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
        dataSecondary := nil;
        if dataSecondary = nil then dataSecondary := ENPriconnectionData.Create;
        if dataSecondary.elementRef = nil then dataSecondary.elementRef := ENElementRef.Create;
          dataSecondary.elementRef.code := StrToInt(GetReturnValue(sgENElement,0));
          edtENElementNameSecondary.Text := GetReturnValue(sgENElement,1) + ', інв.№ ' + GetReturnValue(sgENElement,3);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENElementShow.Free;
  end;
end;

procedure TfrmENServicesConnectionEdit.spbENPowerReliabilityCategoryCategoryRefClick(
  Sender: TObject);
var
   frmENPowerReliabilityCategoryShow: TfrmENPowerReliabilityCategoryShow;
begin
   frmENPowerReliabilityCategoryShow:=TfrmENPowerReliabilityCategoryShow.Create(Application,fmNormal);
   try
      with frmENPowerReliabilityCategoryShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSOTechParamsObject = nil then ENSOTechParamsObject := ENSOTechParams.Create;
               if ENSOTechParamsObject.categoryRef = nil then ENSOTechParamsObject.categoryRef := ENPowerReliabilityCategoryRef.Create();
               ENSOTechParamsObject.categoryRef.code := StrToInt(GetReturnValue(sgENPowerReliabilityCategory,0));
               edtENPowerReliabilityCategoryCategoryRefName.Text :=
               GetReturnValue(sgENPowerReliabilityCategory,1) + ' - ' + GetReturnValue(sgENPowerReliabilityCategory,2);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENPowerReliabilityCategoryShow.Free;
   end;
end;

procedure TfrmENServicesConnectionEdit.btnSaveTechParamsClick(Sender: TObject);
var
    TempENSOTechParams : ENSOTechParamsControllerSoapPort;
    TempENServicesObject : ENServicesObjectControllerSoapPort;
begin
  inherited;

    TempENSOTechParams := HTTPRIOENSOTechParams as ENSOTechParamsControllerSoapPort;

    if ENSOTechParamsObject = nil then ENSOTechParamsObject := ENSOTechParams.Create;

    ENSOTechParamsObject.servicesobject := ENServicesObjectRef.Create;
    ENSOTechParamsObject.servicesobject.code := ENServicesConnectionObj.code;

    if (ENSOTechParamsObject.substationBuildSum = nil) then
      ENSOTechParamsObject.substationBuildSum := TXSDecimal.Create;
    if edtSubstationBuildSum.Text <> '' then
      ENSOTechParamsObject.substationBuildSum.decimalString := edtSubstationBuildSum.Text
    else
      ENSOTechParamsObject.substationBuildSum := nil;

    if (ENSOTechParamsObject.calculationSum = nil) then
      ENSOTechParamsObject.calculationSum := TXSDecimal.Create;
    if edtCalcSum.Text <> '' then
      ENSOTechParamsObject.calculationSum.decimalString := edtCalcSum.Text
    else
      ENSOTechParamsObject.calculationSum := nil;

    if (edtClosestDistance.Text <> '') then
      ENSOTechParamsObject.closestDistance := StrToInt(edtClosestDistance.Text);

    if (edtClosestDistance2.Text <> '') then
      ENSOTechParamsObject.closestDistance2 := StrToInt(edtClosestDistance2.Text);

    if (edtInfoDistance.Text <> '') then
      ENSOTechParamsObject.infoDistance2 := StrToInt(edtInfoDistance.Text);

    if (edtCityName.Text <> '') then
      ENSOTechParamsObject.cityTypeName := edtCityName.Text;

    if mmoObject4ClosestDistnceName.Text <> '' then
     ENSOTechParamsObject.object4closestDistanceName := mmoObject4ClosestDistnceName.Text;

     if mmoObject4ClosestDistnceName2.Text <> '' then
     ENSOTechParamsObject.object4closestDistance2Name := mmoObject4ClosestDistnceName2.Text;

    if not saveReqs then Exit;

    if ((ENSOTechParamsObject.code = low(Integer)) or (ENSOTechParamsObject.code <= 0)) then
      TempENSOTechParams.add(ENSOTechParamsObject)
    else
      TempENSOTechParams.save(ENSOTechParamsObject);

    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
    ENServicesConnectionObj := TempENServicesObject.getObject(ENServicesConnectionObj.code);
    LoadENSOTechParams;

    TempENSOTechParams.calcTarif(ENSOTechParamsObject);

    FormShow(Sender);

    pcCalculation.ActivePage := tsPriconnection;


end;

procedure TfrmENServicesConnectionEdit.actENActIncomeTechConditionsPrintExecute(
  Sender: TObject);
var
  argNames, args: EnergyproController.ArrayOfString;
  reportName: String;
  //sumPeredplata : Double;
  actCode: Integer;
  TempENActIncomeTechConditions: ENActIncomeTechConditionsControllerSoapPort;
  ENActIncomeTechConditionsObj: ENActIncomeTechConditions;
begin
  try
    actCode := StrToInt(sgENActIncomeTechConditions.Cells[0, sgENActIncomeTechConditions.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENActIncomeTechConditions := HTTPRIOENActIncomeTechConditions as ENActIncomeTechConditionsControllerSoapPort;
  ENActIncomeTechConditionsObj := TempENActIncomeTechConditions.getObject(actCode);

  if DMReports.printReportsForObject(ENActIncomeTechConditionsObj, true) then Exit;

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'codeAct';
  args[0] := IntToStr(actCode); //sgENActIncomeTechConditions.Cells[0, sgENActIncomeTechConditions.Row];

  if (ENTechConditionsServicesObj.contragentForm.code = ENTECHCONDITIONSSERVICES_FORM_SOLIDARITY) then
    reportName := 'TechConditions/ActPriPerSolidary'
  else
    reportName := 'TechConditions/ActPriPer';

  makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmENServicesConnectionEdit.pmActsIncomePopup(Sender: TObject);
var
  TempENActIncomeTechConditions : ENActIncomeTechConditionsControllerSoapPort;
  ENActIncomeTechConditionsObj: ENActIncomeTechConditions;
begin

   TempENActIncomeTechConditions  := HTTPRIOENActIncomeTechConditions as ENActIncomeTechConditionsControllerSoapPort;
   try
     ENActIncomeTechConditionsObj := TempENActIncomeTechConditions.getObject(StrToInt(sgENActIncomeTechConditions.Cells[0,sgENActIncomeTechConditions.Row]));
   except
   on EConvertError do Exit;
  end;

   if ENActIncomeTechConditionsObj.statusRef <> nil then
    if ENActIncomeTechConditionsObj.statusRef.code <> 0 then
       begin
         // на подписание
         actSignaturedTechIncome.Enabled :=   ( ENActIncomeTechConditionsObj.statusRef.code = ENACT_GOOD  );
         // отмена подписания
         actUnSignaturedTechIncome.Enabled :=   ( ENActIncomeTechConditionsObj.statusRef.code = ENACT_SIGNATURE  );
         // проведение акта
         actCloseTechIncome.Enabled :=   ( ENActIncomeTechConditionsObj.statusRef.code = ENACT_SIGNATURE  );
         // отмена проведения акта
         actUnCloseTechIncome.Enabled :=   ( ENActIncomeTechConditionsObj.statusRef.code = ENACT_CLOSED  );
       end;
end;


procedure TfrmENServicesConnectionEdit.pmPlansPopup(Sender: TObject);
var
  plan : ENPlanWork;
  planCode : Integer; //elementType : Integer;
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

  // изменение исполнителя и подразделения
  actSaveFinexecutDepartment.Enabled := (plan.kind.code in [ ENPLANWORKKIND_CURRENT, ENPLANWORKKIND_NPZ] ) and
                                  (plan.status.code <> ENPLANWORKSTATUS_GOOD);

end;


procedure TfrmENServicesConnectionEdit.actSignaturedTechIncomeExecute(
  Sender: TObject);
var
  TempENActIncomeTechConditions: ENActIncomeTechConditionsControllerSoapPort;
  ENActIncomeTechConditionsObj: ENActIncomeTechConditions;
begin

   TempENActIncomeTechConditions  := HTTPRIOENActIncomeTechConditions as ENActIncomeTechConditionsControllerSoapPort;
   try
     ENActIncomeTechConditionsObj := TempENActIncomeTechConditions.getObject(StrToInt(sgENActIncomeTechConditions.Cells[0,sgENActIncomeTechConditions.Row]));
   except
   on EConvertError do Exit;
  end;
   if ENActIncomeTechConditionsObj.statusRef <> nil then
    if ENActIncomeTechConditionsObj.statusRef.code = ENACT_GOOD then
   begin
      if Application.MessageBox(PChar('Вы действительно хотите изменить статус у Акта "На подписании"?'),
                        PChar('Внимание!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
      begin
          // Проверка корректности проводок
          if not DMReports.checkMoveToFK(ENServicesConnectionObj.code) then Exit;

          TempENActIncomeTechConditions.signaturedTech(ENActIncomeTechConditionsObj.code);
          actUpdateIncomeExecute(Sender);
          Application.MessageBox(PChar('Статус изменен..!'),PChar('Внимание!'),MB_ICONINFORMATION);

      end;
   end;


end;

procedure TfrmENServicesConnectionEdit.actUnSignaturedTechIncomeExecute(
  Sender: TObject);
var
  TempENActIncomeTechConditions: ENActIncomeTechConditionsControllerSoapPort;
  ENActIncomeTechConditionsObj: ENActIncomeTechConditions;
begin

   TempENActIncomeTechConditions  := HTTPRIOENActIncomeTechConditions as ENActIncomeTechConditionsControllerSoapPort;

    try
     ENActIncomeTechConditionsObj := TempENActIncomeTechConditions.getObject(StrToInt(sgENActIncomeTechConditions.Cells[0,sgENActIncomeTechConditions.Row]));
   except
   on EConvertError do Exit;
  end;
  
   if ENActIncomeTechConditionsObj.statusRef <> nil then
    if ENActIncomeTechConditionsObj.statusRef.code = ENACT_SIGNATURE then
   begin
      if Application.MessageBox(PChar('Вы действительно хотите перевести статус Акта в "Черновой"?'),
                        PChar('Внимание!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
      begin
          TempENActIncomeTechConditions.unSignaturedTech(ENActIncomeTechConditionsObj.code);
          actUpdateIncomeExecute(Sender);
          Application.MessageBox(PChar('Статус изменен..!'),PChar('Внимание!'),MB_ICONINFORMATION);
      end;
   end;


end;

procedure TfrmENServicesConnectionEdit.actCloseTechIncomeExecute(
  Sender: TObject);
var
  TempENActIncomeTechConditions: ENActIncomeTechConditionsControllerSoapPort;
  ENActIncomeTechConditionsObj: ENActIncomeTechConditions;
begin

   TempENActIncomeTechConditions  := HTTPRIOENActIncomeTechConditions as ENActIncomeTechConditionsControllerSoapPort;
   try
     ENActIncomeTechConditionsObj := TempENActIncomeTechConditions.getObject(StrToInt(sgENActIncomeTechConditions.Cells[0,sgENActIncomeTechConditions.Row]));
   except
   on EConvertError do Exit;
  end;
   if ENActIncomeTechConditionsObj.statusRef <> nil then
    if ENActIncomeTechConditionsObj.statusRef.code = ENACT_SIGNATURE then
   begin
      if Application.MessageBox(PChar('При проведении доходного акта расходные акты со статусом "На підписанні"  и акты подряда со статусом "Складений"  будут проводиться в ФК,  Вы действительно хотите провести Акт ?'),
                        PChar('Внимание!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
      begin
          TempENActIncomeTechConditions.closeTech(ENActIncomeTechConditionsObj.code);
          actUpdateIncomeExecute(Sender);
          actUpdateActHozExecute(Sender);
          Application.MessageBox(PChar('Статус изменен..!'),PChar('Внимание!'),MB_ICONINFORMATION);

      end;
   end;


end;


procedure TfrmENServicesConnectionEdit.actConfirmExecute(Sender: TObject);
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


procedure TfrmENServicesConnectionEdit.actCopyPlanExecute(Sender: TObject);
var planCode : Integer;
begin
  inherited;
  try
    planCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  frmCopyPlanPriconnectionsEdit := TfrmCopyPlanPriconnectionsEdit.Create(Application, dsInsert);
  try
    frmCopyPlanPriconnectionsEdit.oldPlanCode := planCode;

    if frmCopyPlanPriconnectionsEdit.ShowModal = mrOk then
    begin
      actUpdateExecute(Sender);
    end;

  finally
    frmCopyPlanPriconnectionsEdit.Free;
    frmCopyPlanPriconnectionsEdit := nil;
  end;
end;


procedure TfrmENServicesConnectionEdit.actCreateNewSheet4SOExecute(
  Sender: TObject);
var
  TempENSheets4SO: ENSheets4SOControllerSoapPort;
  previousSheetCode, previousSheetTypeCode: Integer;
begin
  try
    previousSheetCode := StrToInt(sgENSheets4SO.Cells[0, sgENSheets4SO.Row]);
  except
    on EConvertError do Exit;
  end;

  previousSheetTypeCode := Integer(sgENSheets4SO.Objects[ENSHEETS4SOTYPE_CODE_INDEX, sgENSheets4SO.Row]);
  if previousSheetTypeCode <= 0 then Exit;

  if previousSheetTypeCode <> ENSHEETS4SOTYPE_LAND_SHEET then
  begin
    Application.MessageBox(PChar('Ця функція використовується тільки для листів про відведення земельних ділянок!'),
                           PChar('Увага !'), MB_ICONWARNING + MB_OK);
    Exit;
  end;

  if not DMReports.checkLandSheetStageForServicesObject(ENServicesConnectionObj.code) then
  begin
    Application.MessageBox(PChar('Для створення листа спочатку потрібно внести додатковий реквізит' + #13#10 +
                                 '"Номер стадії відведення земельної ділянки" (значення від 1 до 5)!'),
                           PChar('Увага !'), MB_ICONWARNING + MB_OK);
    Exit;
  end;

  ENSheets4SOObj := ENSheets4SO.Create;
  SetNullIntProps(ENSheets4SOObj);
  SetNullXSProps(ENSheets4SOObj);
  ENSheets4SOObj.servicesobject := ENServicesObjectRef.Create;
  ENSheets4SOObj.servicesobject.code := ENServicesConnectionObj.code;

  try
    frmENSheets4SOEdit := TfrmENSheets4SOEdit.Create(Application, dsInsert);
    try
      frmENSheets4SOEdit.Caption := frmENSheets4SOEdit.Caption + ' (договір № ' + ENServicesConnectionObj.contractNumberServices + ')';
      frmENSheets4SOEdit.previousSheetCode := previousSheetCode;

      if frmENSheets4SOEdit.ShowModal = mrOk then
      begin
        if ENSheets4SOObj <> nil then
          updateSheets4SO;
      end;
    finally
      frmENSheets4SOEdit.Free;
      frmENSheets4SOEdit := nil;
    end;
  finally
    ENSheets4SOObj.Free;
  end;
end;

procedure TfrmENServicesConnectionEdit.actCreatingPlanForServicesExecute(Sender: TObject);
var
  planCode : Integer;
  TempENPlanWork : ENPlanWorkControllerSoapPort;
begin
  inherited;
  if (ENTechAgreement2Services = nil) then Exit;
  if (ENTechAgreement2Services.finDocID = LOW_INT) then Exit;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  try
    planCode := TempENPlanWork.creatingPlanForServicesByTechAgreement(ENTechAgreement2Services.finDocID, ENTechConditionsServicesObj.code);
  except
    on EConvertError do Exit
  end;

  LoadENTechAgreement2Services;
  updatePlanForServicesGrid;
end;


procedure TfrmENServicesConnectionEdit.actCreatingPlanForServicesGLExecute(
  Sender: TObject);
var
  planCode : Integer;
  TempENPlanWork : ENPlanWorkControllerSoapPort;
begin
  inherited;
  if (ENTechAgreement2ServicesGL = nil) then Exit;
  if (ENTechAgreement2ServicesGL.finDocID = LOW_INT) then Exit;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  try
    planCode := TempENPlanWork.creatingPlanForServicesByTechAgreement(ENTechAgreement2ServicesGL.finDocID, ENTechConditionsServicesObj.code);
  except
    on EConvertError do Exit
  end;

  LoadENTechAgreement2ServicesGL;
  updatePlanForServicesGridGL;
end;


procedure TfrmENServicesConnectionEdit.actCreatingPlanForServicesProjectExecute(Sender: TObject);
var
  planCode : Integer;
  TempENPlanWork : ENPlanWorkControllerSoapPort;
begin
  inherited;
  if (ENTechAgreement2ServicesProject = nil) then Exit;
  if (ENTechAgreement2ServicesProject.finDocID = LOW_INT) then Exit;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  try
    planCode := TempENPlanWork.creatingPlanForServicesByTechAgreement(ENTechAgreement2ServicesProject.finDocID, ENTechConditionsServicesObj.code);
  except
    on EConvertError do Exit
  end;

  LoadENTechAgreement2ServicesProject;
  updatePlanForServicesGridProject;
end;


procedure TfrmENServicesConnectionEdit.actUnCloseTechIncomeExecute(
  Sender: TObject);
var
  TempENActIncomeTechConditions: ENActIncomeTechConditionsControllerSoapPort;
  ENActIncomeTechConditionsObj: ENActIncomeTechConditions;
begin

   TempENActIncomeTechConditions  := HTTPRIOENActIncomeTechConditions as ENActIncomeTechConditionsControllerSoapPort;
   try
     ENActIncomeTechConditionsObj := TempENActIncomeTechConditions.getObject(StrToInt(sgENActIncomeTechConditions.Cells[0,sgENActIncomeTechConditions.Row]));
   except
   on EConvertError do Exit;
  end;
   if ENActIncomeTechConditionsObj.statusRef <> nil then
    if ENActIncomeTechConditionsObj.statusRef.code = ENACT_CLOSED then
   begin
      if Application.MessageBox(PChar('При отмене проведения доходного акта расходные акты со статусом "Проведений в ФінКол" перейдут в статус "На підписанні" , а акты подряда в статус "Складений" , Вы действительно хотите отменить проведение Акта ?'),
                        PChar('Внимание!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
      begin
          TempENActIncomeTechConditions.unCloseTech(ENActIncomeTechConditionsObj.code);
          actUpdateIncomeExecute(Sender);
          actUpdateActHozExecute(Sender);
          Application.MessageBox(PChar('Статус изменен..!'),PChar('Внимание!'),MB_ICONINFORMATION);

      end;
   end;


end;

procedure TfrmENServicesConnectionEdit.LoadUnitedGroups;
begin
  LoadUnitedGroupsForENLine04;
  LoadUnitedGroupsForENSubstation04;
  LoadUnitedGroupsForENLine10;
  LoadUnitedGroupsForENSubstation35;
end;

procedure TfrmENServicesConnectionEdit.actLoadAttachmentsExecute(
  Sender: TObject);
begin
  try
    DMReports.openENAttachment(StrToInt(sgENDocAttachment.Cells[0, sgENDocAttachment.Row]));
  except
    on EConvertError do Exit;
  end;
end;

procedure TfrmENServicesConnectionEdit.actLoadUnitedGroupsExecute(
  Sender: TObject);
begin
  LoadUnitedGroups;
end;

procedure TfrmENServicesConnectionEdit.actInsertPaymentExecute(
  Sender: TObject);
begin
  inherited;
   ENPayment2SOObj:=ENPayment2SO.Create;

   ENPayment2SOObj.dateGen:= TXSDate.Create;
   ENPayment2SOObj.sumTotal:= TXSDecimal.Create;
   ENPayment2SOObj.sumGen:= TXSDecimal.Create;
   ENPayment2SOObj.sumVat:= TXSDecimal.Create;

   ENPayment2SOObj.servicesObjectRef := ENServicesObjectRef.Create;
   ENPayment2SOObj.servicesObjectRef.Code :=  ENServicesConnectionObj.code;

  try
		frmENPayment2SOEdit:=TfrmENPayment2SOEdit.Create(Application, dsInsert);
		frmENPayment2SOEdit.calctyperefcode :=  ENServicesConnectionObj.calcTypeRef.code;
    try
      if frmENPayment2SOEdit.ShowModal = mrOk then
      begin
        if ENPayment2SOObj<>nil then
            pcCalculationChange(Self);
            refreshENServicesConnectionObj;
      end;
    finally
      frmENPayment2SOEdit.Free;
      frmENPayment2SOEdit:=nil;
    end;
  finally
    ENPayment2SOObj.Free;
  end;
end;

procedure TfrmENServicesConnectionEdit.actDeletePaymentExecute(
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
      refreshENServicesConnectionObj;
  end;
end;

procedure TfrmENServicesConnectionEdit.actEditPaymentExecute(
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
	frmENPayment2SOEdit.calctyperefcode :=  ENServicesConnectionObj.calcTypeRef.code;
  try
    if frmENPayment2SOEdit.ShowModal= mrOk then
      begin
        pcCalculationChange(Self);
        refreshENServicesConnectionObj;
      end;
  finally
    frmENPayment2SOEdit.Free;
    frmENPayment2SOEdit:=nil;
  end;
end;

procedure TfrmENServicesConnectionEdit.ActViewPaymentExecute(
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
	frmENPayment2SOEdit.calctyperefcode := ENServicesConnectionObj.calcTypeRef.code;
  try
    frmENPayment2SOEdit.ShowModal;

  finally
    frmENPayment2SOEdit.Free;
    frmENPayment2SOEdit := nil;
  end;
end;

procedure TfrmENServicesConnectionEdit.actRecalcDisranceExecute(Sender: TObject);
var
  TempENPlanWork2ClassificationType : ENPlanWork2ClassificationTypeControllerSoapPort;
begin

  TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;

  try
    classificationTypeObj := TempENPlanWork2ClassificationType.getObject(StrToInt(sgENPlanWork2ClassificationType.Cells[0, sgENPlanWork2ClassificationType.Row]));
  except
    on EConvertError do Exit;
  end;

  frmRecalcDistanceServicesConnectionEdit := TfrmRecalcDistanceServicesConnectionEdit.Create(Application, dsEdit);

  try
    if (priconnections)
      then frmRecalcDistanceServicesConnectionEdit.priconnections := True;

    frmRecalcDistanceServicesConnectionEdit.distance := TXSDecimal.Create;
    frmRecalcDistanceServicesConnectionEdit.distance.DecimalString := edtContractServicesDistance.Text;
    frmRecalcDistanceServicesConnectionEdit.codeDepartmentForServicesObject := DepartmentForServicesCode;
    frmRecalcDistanceServicesConnectionEdit.sObj := ENServicesConnectionObj;

    if frmRecalcDistanceServicesConnectionEdit.ShowModal = mrOk then
    begin
      actUpdateExecute(Sender);
      edtContractServicesDistance.Text := frmRecalcDistanceServicesConnectionEdit.distance.DecimalString;
    end;

  finally
    frmRecalcDistanceServicesConnectionEdit.Free;
    frmRecalcDistanceServicesConnectionEdit:=nil;
  end;
end;


procedure TfrmENServicesConnectionEdit.actRemoveENSOBillExecute(
  Sender: TObject);
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
      Self.actUpdateENSOBillExecute(Sender);
  end;
end;


procedure TfrmENServicesConnectionEdit.LoadENTechAgreement2ServicesGL;
var
  techAgreement2ServicesFilter : ENTechAgreement2ServicesObjectFilter;
  TempENTechAgreement2ServicesObject : ENTechAgreement2ServicesObjectControllerSoapPort;
  tcArr : ENTechAgreement2ServicesObjectController.ArrayOfInteger;
  agreementWarrant : ENWarrant;
  actWarrant : ENWarrant;
begin
  DisableControls([gbActGL, gbPlanForServicesGL]);

  techAgreement2ServicesFilter := ENTechAgreement2ServicesObjectFilter.Create;
  SetNullIntProps(techAgreement2ServicesFilter);
  SetNullXSProps(techAgreement2ServicesFilter);

  techAgreement2ServicesFilter.servicesObjectRef := ENServicesObjectRef.Create;
  techAgreement2ServicesFilter.servicesObjectRef.code := ENServicesConnectionObj.code;
  techAgreement2ServicesFilter.techAgrKindRef := ENTechAgr2SOKindRef.Create;
  techAgreement2ServicesFilter.techAgrKindRef.code := ENTECHAGRKIND_GL;

  TempENTechAgreement2ServicesObject := HTTPRIOENTechAgreement2ServicesObject as ENTechAgreement2ServicesObjectControllerSoapPort;
  tcArr := TempENTechAgreement2ServicesObject.getScrollableFilteredCodeArray(techAgreement2ServicesFilter, 0, -1);

  if High(tcArr) > -1 then
  begin
    try
      ENTechAgreement2ServicesGL := TempENTechAgreement2ServicesObject.getObject(tcArr[0]);
    except
      on EConvertError do Exit;
    end;

    DisableControls([gbActGL, gbPlanForServicesGL], ENTechAgreement2ServicesGL.finDocID = LOW_INT);

    if length(ENTechAgreement2ServicesGL.contractNumber) > 0 then
    begin
      edtTechContractNumberGL.Text := '№ ' + ENTechAgreement2ServicesGL.contractNumber + ' від ' + DateToStr(EncodeDate(ENTechAgreement2ServicesGL.contractDate.Year,ENTechAgreement2ServicesGL.contractDate.Month,ENTechAgreement2ServicesGL.contractDate.Day));
    end;

    edtRQOrgOrgNameGL.Text := ENTechAgreement2ServicesGL.partnerName;
    edtPartnerAddress.Text :=  ENTechAgreement2ServicesGL.partnerAddress;
    edtRschetGL.Text := ENTechAgreement2ServicesGL.bankRSchet;
    edtBankGL.Text := ENTechAgreement2ServicesGL.bankName;
    edtMfoGL.Text := ENTechAgreement2ServicesGL.bankMfo;

    if (Length(ENTechAgreement2ServicesGL.executorTaxType) > 30) then
    cbbExecutorTax.ItemIndex := 1
    else
    cbbExecutorTax.ItemIndex := 0;

    MakeMultiline(edtObjectNameGL.Lines, ENTechAgreement2ServicesGL.objectName);
    MakeMultiline(edtBasisForActionGL.Lines, ENTechAgreement2ServicesGL.basisForAction);

    if (ENTechAgreement2ServicesGL.area <> nil) then
      edtArea.Text := ENTechAgreement2ServicesGL.area.decimalString
    else
      edtArea.Text := '';

    if (ENTechAgreement2ServicesGL.costWorks <> nil) then
      edtCostWorksGL.Text := ENTechAgreement2ServicesGL.costWorks.decimalString
    else
      edtCostWorksGL.Text := '';

    if (ENTechAgreement2ServicesGL.costWorksNDS <> nil) then
      edtCostWorksNDSGL.Text := ENTechAgreement2ServicesGL.costWorksNDS.decimalString
    else
      edtCostWorksNDSGL.Text := '';

    edtPartnerPosition.Text := ENTechAgreement2ServicesGL.partnerPosition;
    edtPartnerFIO.Text := ENTechAgreement2ServicesGL.partnerFIO;


    if (ENTechAgreement2ServicesGL.agreementWarrantRef.code <> LOW_INT) then
    begin
      agreementWarrant := DMReports.getWarrantByCode(ENTechAgreement2ServicesGL.agreementWarrantRef.code);
      edtAgreementWarrantNumberGL.Text := agreementWarrant.numbergen;
      edtAgreementWarrantFIOGL.Text := agreementWarrant.warrantFIO;
    end;

    edtActNumberGL.Text := ENTechAgreement2ServicesGL.actNumber;
    if ENTechAgreement2ServicesGL.actDate <> nil then
    begin
      edtActDateGL.DateTime:=EncodeDate(ENTechAgreement2ServicesGL.actDate.Year,ENTechAgreement2ServicesGL.actDate.Month,ENTechAgreement2ServicesGL.actDate.Day);
      edtActDateGL.checked := true;
    end
    else
    begin
      edtActDateGL.DateTime:=SysUtils.Date;
      edtActDateGL.checked := false;
    end;

    if (ENTechAgreement2ServicesGL.actWarrantRef.code <> LOW_INT) then
    begin
      actWarrant := DMReports.getWarrantByCode(ENTechAgreement2ServicesGL.actWarrantRef.code);
      edtActWarrantNumberGL.Text := actWarrant.numbergen;
      edtActWarrantFIOGL.Text := actWarrant.warrantFIO;
    end;

    if ENTechAgreement2ServicesGL.contractTerm <> nil then
    begin
      dtpContractTerm.DateTime:=EncodeDate(ENTechAgreement2ServicesGL.contractTerm.Year,ENTechAgreement2ServicesGL.contractTerm.Month,ENTechAgreement2ServicesGL.contractTerm.Day);
      dtpContractTerm.checked := true;
    end
    else
    begin
      dtpContractTerm.DateTime:=SysUtils.Date;
      dtpContractTerm.checked := false;
    end;

  end;

end;


procedure TfrmENServicesConnectionEdit.LoadENTechAgreement2Services;
var
  techAgreement2ServicesFilter : ENTechAgreement2ServicesObjectFilter;
  TempENTechAgreement2ServicesObject : ENTechAgreement2ServicesObjectControllerSoapPort;
  tcArr : ENTechAgreement2ServicesObjectController.ArrayOfInteger;
  agreementWarrant : ENWarrant;
  actWarrant : ENWarrant;
begin
  DisableControls([gbAct, gbPlanForServices]);

  techAgreement2ServicesFilter := ENTechAgreement2ServicesObjectFilter.Create;
  SetNullIntProps(techAgreement2ServicesFilter);
  SetNullXSProps(techAgreement2ServicesFilter);

  techAgreement2ServicesFilter.servicesObjectRef := ENServicesObjectRef.Create;
  techAgreement2ServicesFilter.servicesObjectRef.code := ENServicesConnectionObj.code;
  techAgreement2ServicesFilter.techAgrKindRef := ENTechAgr2SOKindRef.Create;
  techAgreement2ServicesFilter.techAgrKindRef.code := ENTECHAGRKIND_TA;

  TempENTechAgreement2ServicesObject := HTTPRIOENTechAgreement2ServicesObject as ENTechAgreement2ServicesObjectControllerSoapPort;
  tcArr := TempENTechAgreement2ServicesObject.getScrollableFilteredCodeArray(techAgreement2ServicesFilter, 0, -1);

  if High(tcArr) > -1 then
  begin
    try
      ENTechAgreement2Services := TempENTechAgreement2ServicesObject.getObject(tcArr[0]);
    except
      on EConvertError do Exit;
    end;

    DisableControls([gbAct, gbPlanForServices], ENTechAgreement2Services.finDocID = LOW_INT);

    if length(ENTechAgreement2Services.contractNumber) > 0 then
    begin
      edtTechContractNumber.Text := '№ ' + ENTechAgreement2Services.contractNumber + ' від ' + DateToStr(EncodeDate(ENTechAgreement2Services.contractDate.Year,ENTechAgreement2Services.contractDate.Month,ENTechAgreement2Services.contractDate.Day));
    end;

    edtRQOrgOrgName.Text := ENTechAgreement2Services.partnerName;
    edtRschet.Text := ENTechAgreement2Services.bankRSchet;
    edtBank.Text := ENTechAgreement2Services.bankName;
    edtMfo.Text := ENTechAgreement2Services.bankMfo;

    MakeMultiline(edtObjectName.Lines, ENTechAgreement2Services.objectName);
    MakeMultiline(edtBasisForAction.Lines, ENTechAgreement2Services.basisForAction);

    if (ENTechAgreement2Services.costWorks <> nil) then
      edtCostWorks.Text := ENTechAgreement2Services.costWorks.decimalString
    else
      edtCostWorks.Text := '';

    if (ENTechAgreement2Services.agreementWarrantRef.code <> LOW_INT) then
    begin
      agreementWarrant := DMReports.getWarrantByCode(ENTechAgreement2Services.agreementWarrantRef.code);
      edtAgreementWarrantNumber.Text := agreementWarrant.numbergen;
      edtAgreementWarrantFIO.Text := agreementWarrant.warrantFIO;
    end;

    edtActNumber.Text := ENTechAgreement2Services.actNumber;
    if ENTechAgreement2Services.actDate <> nil then
    begin
      edtActDate.DateTime:=EncodeDate(ENTechAgreement2Services.actDate.Year,ENTechAgreement2Services.actDate.Month,ENTechAgreement2Services.actDate.Day);
      edtActDate.checked := true;
    end
    else
    begin
      edtActDate.DateTime:=SysUtils.Date;
      edtActDate.checked := false;
    end;

    if (ENTechAgreement2Services.actWarrantRef.code <> LOW_INT) then
    begin
      actWarrant := DMReports.getWarrantByCode(ENTechAgreement2Services.actWarrantRef.code);
      edtActWarrantNumber.Text := actWarrant.numbergen;
      edtActWarrantFIO.Text := actWarrant.warrantFIO;
    end;
  end;
end;


procedure TfrmENServicesConnectionEdit.LoadENTechAgreement2ServicesProject;
var
  techAgreement2ServicesFilter : ENTechAgreement2ServicesObjectFilter;
  TempENTechAgreement2ServicesObject : ENTechAgreement2ServicesObjectControllerSoapPort;
  tcArr : ENTechAgreement2ServicesObjectController.ArrayOfInteger;
  agreementWarrant : ENWarrant;
  actWarrant : ENWarrant;
begin
  DisableControls([gbPlanForServicesProject]);
  edtCostWorksProject.Text := '0';
  HideControls([btnPrintAgreementProject]);

  techAgreement2ServicesFilter := ENTechAgreement2ServicesObjectFilter.Create;
  SetNullIntProps(techAgreement2ServicesFilter);
  SetNullXSProps(techAgreement2ServicesFilter);

  techAgreement2ServicesFilter.servicesObjectRef := ENServicesObjectRef.Create;
  techAgreement2ServicesFilter.servicesObjectRef.code := ENServicesConnectionObj.code;
  techAgreement2ServicesFilter.techAgrKindRef := ENTechAgr2SOKindRef.Create;
  techAgreement2ServicesFilter.techAgrKindRef.code := ENTECHAGRKIND_PKD;

  TempENTechAgreement2ServicesObject := HTTPRIOENTechAgreement2ServicesObject as ENTechAgreement2ServicesObjectControllerSoapPort;
  tcArr := TempENTechAgreement2ServicesObject.getScrollableFilteredCodeArray(techAgreement2ServicesFilter, 0, -1);

  if High(tcArr) > -1 then
  begin
    try
      ENTechAgreement2ServicesProject := TempENTechAgreement2ServicesObject.getObject(tcArr[0]);
    except
      on EConvertError do Exit;
    end;

    DisableControls([gbPlanForServicesProject], ENTechAgreement2ServicesProject.finDocID = LOW_INT);

    if length(ENTechAgreement2ServicesProject.contractNumber) > 0 then
    begin
      edtContractNumberProject.Text := '№ ' + ENTechAgreement2ServicesProject.contractNumber
        + ' від ' + DateToStr(EncodeDate(ENTechAgreement2ServicesProject.contractDate.Year, ENTechAgreement2ServicesProject.contractDate.Month, ENTechAgreement2ServicesProject.contractDate.Day));
    end;

    edtOrgNameProject.Text := ENTechAgreement2ServicesProject.partnerName;
    edtRschetOrgProject.Text := ENTechAgreement2ServicesProject.bankRSchet;
    edtBankOrgProject.Text := ENTechAgreement2ServicesProject.bankName;
    edtMfoOrgProject.Text := ENTechAgreement2ServicesProject.bankMfo;

    MakeMultiline(edtBasisForActionProject.Lines, ENTechAgreement2ServicesProject.basisForAction);

    if (ENTechAgreement2ServicesProject.costWorks <> nil) then
      edtCostWorksProject.Text := ENTechAgreement2ServicesProject.costWorks.decimalString
    else
      edtCostWorksProject.Text := '0';

    if (ENTechAgreement2ServicesProject.agreementWarrantRef.code <> LOW_INT) then
    begin
      agreementWarrant := DMReports.getWarrantByCode(ENTechAgreement2ServicesProject.agreementWarrantRef.code);
      edtAgreementWarrantNumberProject.Text := agreementWarrant.numbergen;
      edtAgreementWarrantFIOProject.Text := agreementWarrant.warrantFIO;
    end;

    {
    edtActNumber.Text := ENTechAgreement2ServicesProject.actNumber;
    if ENTechAgreement2ServicesProject.actDate <> nil then
    begin
      edtActDate.DateTime:=EncodeDate(ENTechAgreement2ServicesProject.actDate.Year,ENTechAgreement2ServicesProject.actDate.Month,ENTechAgreement2ServicesProject.actDate.Day);
      edtActDate.checked := true;
    end
    else
    begin
      edtActDate.DateTime:=SysUtils.Date;
      edtActDate.checked := false;
    end;
    }

    {
    if (ENTechAgreement2ServicesProject.actWarrantRef.code <> LOW_INT) then
    begin
      actWarrant := DMReports.getWarrantByCode(ENTechAgreement2ServicesProject.actWarrantRef.code);
      edtActWarrantNumber.Text := actWarrant.numbergen;
      edtActWarrantFIO.Text := actWarrant.warrantFIO;
    end;
    }
  end;
end;


procedure TfrmENServicesConnectionEdit.updatePlanForServicesGridGL;
var
  i, n : Integer;
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  planFilter : ENPlanWorkFilter;
  ENPlanWorkList : ENPlanWorkShortList;
  TempENServicesFromSideObject: ENServicesFromSideObjectControllerSoapPort;
  servicesFS: ENServicesFromSideObject;
begin
  ClearGrid(sgPlanForServicesGL);
  if (ENTechAgreement2ServicesGL = nil) then Exit;
  if (ENTechAgreement2ServicesGL.finDocID = LOW_INT) then Exit;

  if (ENTechAgreement2ServicesGL.servicesFromSideRef <> nil) then
  if (ENTechAgreement2ServicesGL.servicesFromSideRef.code <> Low(Integer)) then
  begin
    TempENServicesFromSideObject := HTTPRIOENServicesFromSideObject as ENServicesFromSideObjectControllerSoapPort;
    servicesFS := TempENServicesFromSideObject.getObject(ENTechAgreement2ServicesGL.servicesFromSideRef.code);
  end;

  planFilter := ENPlanWorkFilter.Create;
  SetNullIntProps(planFilter);
  SetNullXSProps(planFilter);

  if (ENTechAgreement2ServicesGL.servicesFromSideRef <> nil) and (ENTechAgreement2ServicesGL.servicesFromSideRef.code <> Low(Integer)) then
    planFilter.conditionSQL := ' enplanwork.elementrefcode = ' + IntToStr(servicesFS.element.code) +
      ' or enplanwork.servicesfsidefinid = ' + IntToStr(ENTechAgreement2ServicesGL.finDocID)
  else
    planFilter.conditionSQL := ' enplanwork.servicesfsidefinid = ' + IntToStr(ENTechAgreement2ServicesGL.finDocID);


  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(planFilter, 0, -1);

  LastCount := High(ENPlanWorkList.list);

  if LastCount > -1 then
    sgPlanForServicesGL.RowCount := LastCount + 2
  else
    sgPlanForServicesGL.RowCount := 2;

  with sgPlanForServicesGL do
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

        if ENPlanWorkList.list[i].yearOriginal > 0 then
        begin
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

        sgPlanForServicesGL.RowCount := i + 2;
      end;

   sgPlanForServicesGL.Row := 1;
end;


procedure TfrmENServicesConnectionEdit.updatePlanForServicesGrid;
var
  i, n : Integer;
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  planFilter : ENPlanWorkFilter;
  ENPlanWorkList : ENPlanWorkShortList;
  servicesFS: ENServicesFromSideObject;
  TempENServicesFromSideObject: ENServicesFromSideObjectControllerSoapPort;
begin
  ClearGrid(sgPlanForServices);
  if (ENTechAgreement2Services = nil) then Exit;
  if (ENTechAgreement2Services.finDocID = LOW_INT) then Exit;

  if (ENTechAgreement2Services.servicesFromSideRef <> nil) then
  if (ENTechAgreement2Services.servicesFromSideRef.code <> Low(Integer)) then
  begin
    TempENServicesFromSideObject := HTTPRIOENServicesFromSideObject as ENServicesFromSideObjectControllerSoapPort;
    servicesFS := TempENServicesFromSideObject.getObject(ENTechAgreement2Services.servicesFromSideRef.code);
  end;

  planFilter := ENPlanWorkFilter.Create;
  SetNullIntProps(planFilter);
  SetNullXSProps(planFilter);

  if (ENTechAgreement2Services.servicesFromSideRef <> nil) and (ENTechAgreement2Services.servicesFromSideRef.code <> Low(Integer)) then
    planFilter.conditionSQL := ' enplanwork.elementrefcode = ' + IntToStr(servicesFS.element.code) +
      ' or enplanwork.servicesfsidefinid = ' + IntToStr(ENTechAgreement2Services.finDocID)
  else
    planFilter.conditionSQL := ' enplanwork.servicesfsidefinid = ' + IntToStr(ENTechAgreement2Services.finDocID);

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(planFilter, 0, -1);

  LastCount := High(ENPlanWorkList.list);

  if LastCount > -1 then
    sgPlanForServices.RowCount := LastCount + 2
  else
    sgPlanForServices.RowCount := 2;

  with sgPlanForServices do
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

        if ENPlanWorkList.list[i].yearOriginal > 0 then
        begin
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

        sgPlanForServices.RowCount := i + 2;
      end;

   sgPlanForServices.Row := 1;
end;


procedure TfrmENServicesConnectionEdit.updatePlanForServicesGridProject;
var
  i, n : Integer;
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  planFilter : ENPlanWorkFilter;
  ENPlanWorkList : ENPlanWorkShortList;
  servicesFS: ENServicesFromSideObject;
  TempENServicesFromSideObject: ENServicesFromSideObjectControllerSoapPort;
begin
  ClearGrid(sgPlanForServicesProject);
  if (ENTechAgreement2ServicesProject = nil) then Exit;
  if (ENTechAgreement2ServicesProject.finDocID = LOW_INT) then Exit;

  if (ENTechAgreement2ServicesProject.servicesFromSideRef <> nil) then
  if (ENTechAgreement2ServicesProject.servicesFromSideRef.code <> Low(Integer)) then
  begin
    TempENServicesFromSideObject := HTTPRIOENServicesFromSideObject as ENServicesFromSideObjectControllerSoapPort;
    servicesFS := TempENServicesFromSideObject.getObject(ENTechAgreement2ServicesProject.servicesFromSideRef.code);
  end;

  planFilter := ENPlanWorkFilter.Create;
  SetNullIntProps(planFilter);
  SetNullXSProps(planFilter);

  if (ENTechAgreement2ServicesProject.servicesFromSideRef <> nil) and (ENTechAgreement2ServicesProject.servicesFromSideRef.code <> Low(Integer)) then
    planFilter.conditionSQL := ' enplanwork.elementrefcode = ' + IntToStr(servicesFS.element.code) +
      ' or enplanwork.servicesfsidefinid = ' + IntToStr(ENTechAgreement2ServicesProject.finDocID)
  else
    planFilter.conditionSQL := ' enplanwork.servicesfsidefinid = ' + IntToStr(ENTechAgreement2ServicesProject.finDocID);

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(planFilter, 0, -1);

  LastCount := High(ENPlanWorkList.list);

  if LastCount > -1 then
  begin
    DisableControls([spbOrgNameProject]);
    HideControls([btnPrintAgreementProject], False);
    if (edtContractNumberProject.Text = '') then
      DisableControls([spbContractNumberProject], False)
    else
      DisableControls([spbContractNumberProject]);
  end else
  begin
    HideControls([btnPrintAgreementProject]);
    DisableControls([spbOrgNameProject, spbContractNumberProject], False);
  end;

  if LastCount > -1 then
    sgPlanForServicesProject.RowCount := LastCount + 2
  else
    sgPlanForServicesProject.RowCount := 2;

  with sgPlanForServicesProject do
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

        if ENPlanWorkList.list[i].yearOriginal > 0 then
        begin
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

        sgPlanForServicesProject.RowCount := i + 2;
      end;

   sgPlanForServicesProject.Row := 1;
end;



function TfrmENServicesConnectionEdit.checkDocAttachment(): Boolean;
var
  i : Integer;
  TempENDocAttachment : ENDocAttachmentControllerSoapPort;
  fRes, fname, fileName : string;
  res : TStrings;
  docAttachmentFilter: ENDocAttachmentFilter;
  ENDocAttachmentList: ENDocAttachmentShortList;
  docAttachment: ENDocAttachment;
begin
  Result := False;
  attachmentCode := LOW_INT;
  TempENDocAttachment := HTTPRIOENDocAttachment as ENDocAttachmentControllerSoapPort;

  docAttachmentFilter := ENDocAttachmentFilter.Create;
  SetNullIntProps(docAttachmentFilter);
  SetNullXSProps(docAttachmentFilter);

  docAttachmentFilter.status := ENDocAttachmentStatusRef.Create;
  docAttachmentFilter.status.code := ENDOCATTACHMENTSTATUS_ACTIVE;

  docAttachmentFilter.conditionSQL := ' endocattachment.code in (select da2so.docattachmentrefcode '+
      ' from endcttchmnt2nsrvcsbjct da2so ' +
      ' where da2so.kindrefcode = ' + IntToStr(ENATTACHMENT2SERVICESKIND_SYSTEM_DOC) +
      '  and da2so.servicesobjectrefcode = ' + IntToStr(ENServicesConnectionObj.code) + ')';

  ENDocAttachmentList := TempENDocAttachment.getScrollableFilteredList(docAttachmentFilter,0,-1);

  if (ENDocAttachmentList.totalCount > 0) then
  begin
    TempENDocAttachment := HTTPRIOENDocAttachment as ENDocAttachmentControllerSoapPort;
    docAttachment := TempENDocAttachment.getObject(ENDocAttachmentList.list[0].code);

    attachmentCode := docAttachment.code;
    fRes := TempENDocAttachment.readObject(docAttachment.code);
    fileName := ExtractFileName(docAttachment.fileLink);

    i := LastDelimiter('/' + PathDelim + DriveDelim, fileName);
    if (i > 0) and (fileName[i] = '/') then
      fname := Copy(fileName, i+1, MaxInt)
    else fname := '';

    attachmentName := fname;

    res := TStringList.Create;

    try
      res.Add(Trim(fRes));
    if not DirectoryExists(ExtractFilePath(Application.ExeName)+TempReportsPath) then
        CreateDir(ExtractFilePath(Application.ExeName)+TempReportsPath);
      res.SaveToFile(ExtractFilePath(Application.ExeName)+TempReportsPath+fname+'.b64');
    finally
      res.Free;
    end;

    DMReports.Decode(ExtractFilePath(Application.ExeName)+TempReportsPath+fname,(''));
    SysUtils.DeleteFile(ExtractFilePath(Application.ExeName)+TempReportsPath+fname+'.b64');

    Result := True;
  end;

end;

procedure TfrmENServicesConnectionEdit.updateRelatedAgrees();
var
    TempENServicesObject: ENServicesObjectControllerSoapPort;
    i : Integer;
    ENServicesObjectList: ENServicesObjectShortList;
    servicesObjFilter: ENServicesObjectFilter;
begin
    sgFINAdditionalAgreements.Clear;
    SetGridHeaders(FINAdditionalAgreementHeaders, sgFINAdditionalAgreements.ColumnHeaders);

    TempENServicesObject := HTTPRIOENServicesObject as   ENServicesObjectControllerSoapPort;
    servicesObjFilter := ENServicesObjectFilter.Create;

    SetNullIntProps(servicesObjFilter);
    SetNullXSProps(servicesObjFilter);
    servicesObjFilter.conditionSQL := 'a.parent_id = ' + IntToStr(ENServicesConnectionObj.finDocID);

    ENServicesObjectList := TempENServicesObject.getContractList(servicesObjFilter, 0, -1, false, true, true);

    LastCount := High(ENServicesObjectList.list);

    if LastCount > -1 then
      sgFINAdditionalAgreements.RowCount := LastCount + 2
    else
      sgFINAdditionalAgreements.RowCount := 2;

    with sgFINAdditionalAgreements do
      for i := 0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENServicesObjectList.list[i].finDocID <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(ENServicesObjectList.list[i].finDocID)
        else
          Cells[0, i + 1] := '';
        if ENServicesObjectList.list[i].contractNumber <> '' then
          Cells[1, i + 1] := IntToStr(i+1)
        else
          Cells[1, i + 1] := '';
        Cells[2, i + 1] := ENServicesObjectList.list[i].finDocCode;

        if ENServicesObjectList.list[i].contractRegDate <> nil then
          Cells[3, i + 1] :=
            XSDate2String(ENServicesObjectList.list[i].contractRegDate)
        else
          Cells[3, i + 1] := '';

        if ENServicesObjectList.list[i].contractSumma <> nil then
          Cells[4, i + 1] := ENServicesObjectList.list[i].contractSumma.DecimalString
        else
          Cells[4, i + 1] := '';

        Cells[5, i + 1] := ENServicesObjectList.list[i].commentGen;

        Objects[0, i + 1] := ENServicesObjectList.list[i];

        LastRow := i + 1;
        sgFINAdditionalAgreements.RowCount := LastRow + 1;
      end;
    sgFINAdditionalAgreements.Row := 1;

end;


function TfrmENServicesConnectionEdit.getENPayment2SOList : ENPayment2SOShortList;
var
  TempENPayment2SO : ENPayment2SOControllerSoapPort;
  FilterPayment2SO : ENPayment2SOFilter;
  ENPayment2SOList : ENPayment2SOShortList;
begin
  TempENPayment2SO :=  HTTPRIOENPayment2SO as ENPayment2SOControllerSoapPort;
  FilterPayment2SO := ENPayment2SOFilter.Create;
  SetNullIntProps(FilterPayment2SO);
  SetNullXSProps(FilterPayment2SO);
  FilterPayment2SO.servicesObjectRef := ENServicesObjectRef.Create;
  FilterPayment2SO.servicesObjectRef.code :=  ENServicesConnectionObj.code;
  ENPayment2SOList := TempENPayment2SO.getScrollableFilteredList(FilterPayment2SO, 0, -1);
  Result := ENPayment2SOList;
end;

function TfrmENServicesConnectionEdit.getENSOBillList : ENSOBillShortList;
var
  TempENSOBill: ENSOBillControllerSoapPort;
  ENSOBillList: ENSOBillShortList;
  billFilter : ENSOBillFilter;
begin
  TempENSOBill :=  HTTPRIOENSOBill as ENSOBillControllerSoapPort;
  billFilter := ENSOBillFilter.Create;
  SetNullIntProps(billFilter);
  SetNullXSProps(billFilter);

  billFilter.servicesObjectRef := ENServicesObjectRef.Create;
  billFilter.servicesObjectRef.code := ENServicesConnectionObj.code;
  billFilter.orderBySQL := 'ENSOBILL.DATEGEN DESC';
  ENSOBillList := TempENSOBill.getScrollableFilteredList(billFilter, 0, -1);
  Result := ENSOBillList;
end;

procedure TfrmENServicesConnectionEdit.refreshENServicesConnectionObj;
var
  TempENServicesObject : ENServicesObjectControllerSoapPort;
begin
   TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
   ENServicesConnectionObj := TempENServicesObject.getObject(ENServicesConnectionObj.code);
end;

procedure TfrmENServicesConnectionEdit.updatePayments;
var
  ENPayment2SOList : ENPayment2SOShortList;
  i : Integer;
  sumWithVAT, sumWithoutVAT, sumVAT, tmp : Double;
begin
    /// оплаты
    sgENPayment2SO.Clear;
    SetGridHeaders(ENPayment2SOHeaders, sgENPayment2SO.ColumnHeaders);

    sumWithVAT := 0; sumWithoutVAT := 0; sumVAT := 0;

    if ENServicesConnectionObj = nil then Exit;
    if ENServicesConnectionObj.element = nil then Exit;
    if ENServicesConnectionObj.element.code = LOW_INT then Exit;

    iColCount := -1;
    ENPayment2SOList := getENPayment2SOList;

    iLastCount := High(ENPayment2SOList.list);

    if iLastCount > -1 then
      sgENPayment2SO.RowCount := iLastCount + 3
    else
      sgENPayment2SO.RowCount := 3;

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
          Cells[PAYMENT_SUM_WITH_VAT_COLUMN_INDEX,i+1] := ''
        else begin
          tmp := RoundTo(StrToFloat(ENPayment2SOList.list[i].sumTotal.DecimalString), -2);
          Cells[PAYMENT_SUM_WITH_VAT_COLUMN_INDEX,i+1] := SeparateThousands(FormatFloat('0.00', tmp));
          sumWithVAT := sumWithVAT + tmp;
        end;
        if ENPayment2SOList.list[i].sumGen = nil then
          Cells[PAYMENT_SUM_WITHOUT_VAT_COLUMN_INDEX,i+1] := ''
        else begin
          tmp := RoundTo(StrToFloat(ENPayment2SOList.list[i].sumGen.DecimalString), -2);
          Cells[PAYMENT_SUM_WITHOUT_VAT_COLUMN_INDEX,i+1] := SeparateThousands(FormatFloat('0.00', tmp));
          sumWithoutVAT := sumWithoutVAT + tmp;
        end;

        if ENPayment2SOList.list[i].sumVat = nil then
          Cells[PAYMENT_SUM_VAT_COLUMN_INDEX,i+1] := ''
        else begin
          tmp := RoundTo(StrToFloat(ENPayment2SOList.list[i].sumVat.DecimalString), -2);
          Cells[PAYMENT_SUM_VAT_COLUMN_INDEX,i+1] := SeparateThousands(FormatFloat('0.00', tmp));
          sumVAT := sumVAT + tmp;
        end;

        Cells[5,i+1] := ENPayment2SOList.list[i].paymentTypeRefName;

        Cells[6,i+1] := ENPayment2SOList.list[i].userGen;

        if ENPayment2SOList.list[i].dateEdit = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDateTimeWithDate2String(ENPayment2SOList.list[i].dateEdit);

         iLastRow := i + 1;
       end;

     iColCount := iColCount + 1;
     sgENPayment2SO.Row := 1;

     // Итоговые суммы
      with sgENPayment2SO do begin
        Cells[1, RowCount - 1] := 'Підсумок';
        Cells[PAYMENT_SUM_WITH_VAT_COLUMN_INDEX, RowCount - 1] := SeparateThousands(FormatFloat('0.00', sumWithVAT));
        Cells[PAYMENT_SUM_WITHOUT_VAT_COLUMN_INDEX, RowCount - 1] := SeparateThousands(FormatFloat('0.00', sumWithoutVAT));
        Cells[PAYMENT_SUM_VAT_COLUMN_INDEX, RowCount - 1] := SeparateThousands(FormatFloat('0.00', sumVAT));
        CellProperties[1, RowCount - 1].FontStyle := CellProperties[1, RowCount - 1].FontStyle  + [fsBold];
        CellProperties[PAYMENT_SUM_WITH_VAT_COLUMN_INDEX, RowCount - 1].FontStyle := CellProperties[PAYMENT_SUM_WITH_VAT_COLUMN_INDEX, RowCount - 1].FontStyle  + [fsBold];
        CellProperties[PAYMENT_SUM_WITHOUT_VAT_COLUMN_INDEX, RowCount - 1].FontStyle := CellProperties[PAYMENT_SUM_WITHOUT_VAT_COLUMN_INDEX, RowCount - 1].FontStyle  + [fsBold];
        CellProperties[PAYMENT_SUM_VAT_COLUMN_INDEX, RowCount - 1].FontStyle := CellProperties[PAYMENT_SUM_VAT_COLUMN_INDEX, RowCount - 1].FontStyle  + [fsBold];

      end;

     /// оплаты
end;
procedure TfrmENServicesConnectionEdit.updateBills;
Var
  i: Integer;
  ENSOBillList: ENSOBillShortList;
  LastRow : Integer;
  sumWithoutVAT, sumVAT, sumWithVAT, tmp : Double;
begin

    sgENSOBill.Clear;
    sgENSOBill.RowCount := 3;
    SetGridHeaders(ENSOBillHeaders, sgENSOBill.ColumnHeaders);

    sumWithoutVAT := 0; sumVAT := 0; SumWithVAT := 0;

  ENSOBillList := getENSOBillList;
  sgENSOBill.RowCount := sgENSOBill.RowCount + ENSOBillList.totalCount;
  if ENSOBillList.totalCount > 0 then
    sgENSOBill.RowCount := sgENSOBill.RowCount - 1;


   with sgENSOBill do
    for i:=0 to ENSOBillList.totalCount - 1 do
      begin
        Application.ProcessMessages;
        LastRow := i + 1;
        if ENSOBillList.list[i].code <> Low(Integer) then
        Cells[0, LastRow] := IntToStr(ENSOBillList.list[i].code)
        else
        Cells[0, LastRow] := '';
        Cells[1, LastRow] := ENSOBillList.list[i].numberGen;
        if ENSOBillList.list[i].dateGen = nil then
          Cells[2, LastRow] := ''
        else
          Cells[2, LastRow] := XSDate2String(ENSOBillList.list[i].dateGen);
        if ENSOBillList.list[i].sumTotal = nil then
          Cells[BILL_SUM_WITH_VAT_COLUMN_INDEX, LastRow] := ''
        else begin
          tmp := RoundTo(StrToFloat(ENSOBillList.list[i].sumTotal.DecimalString), -2);
          Cells[BILL_SUM_WITH_VAT_COLUMN_INDEX, LastRow] := SeparateThousands(FormatFloat('0.00', tmp));
          sumWithVAT := sumWithVAT + tmp;
        end;
        if ENSOBillList.list[i].sumGen = nil then
          Cells[BILL_SUM_WITHOUT_VAT_COLUMN_INDEX, LastRow] := ''
        else begin
          tmp := RoundTo(StrToFloat(ENSOBillList.list[i].sumGen.DecimalString), -2);
          Cells[BILL_SUM_WITHOUT_VAT_COLUMN_INDEX, LastRow] := SeparateThousands(FormatFloat('0.00', tmp));
          sumWithoutVAT := sumWithoutVAT + tmp;
        end;
        if ENSOBillList.list[i].sumVat = nil then
          Cells[BILL_SUM_VAT_COLUMN_INDEX, LastRow] := ''
        else begin
          tmp := RoundTo(StrToFloat(ENSOBillList.list[i].sumVat.DecimalString), -2);
          Cells[BILL_SUM_VAT_COLUMN_INDEX, LastRow] := SeparateThousands(FormatFloat('0.00', tmp));
          sumVAT := sumVAT + tmp;
        end;
        Cells[6, LastRow] := ENSOBillList.list[i].userGen;
        if ENSOBillList.list[i].dateEdit = nil then
          Cells[7, LastRow] := ''
        else
          Cells[7, LastRow] := XSDateTimeWithDate2String(ENSOBillList.list[i].dateEdit);
      end;
      sgENSOBill.Row := 1;

      // Итоговые суммы
      with sgENSOBill do begin
        Cells[1, RowCount - 1] := 'Підсумок';
        Cells[BILL_SUM_WITH_VAT_COLUMN_INDEX, RowCount - 1] := SeparateThousands(FormatFloat('0.00', sumWithVAT));
        Cells[BILL_SUM_WITHOUT_VAT_COLUMN_INDEX, RowCount - 1] := SeparateThousands(FormatFloat('0.00', sumWithoutVAT));
        Cells[BILL_SUM_VAT_COLUMN_INDEX, RowCount - 1] := SeparateThousands(FormatFloat('0.00', sumVAT));
        CellProperties[1, RowCount - 1].FontStyle := CellProperties[1, RowCount - 1].FontStyle  + [fsBold];
        CellProperties[BILL_SUM_WITH_VAT_COLUMN_INDEX, RowCount - 1].FontStyle := CellProperties[BILL_SUM_WITH_VAT_COLUMN_INDEX, RowCount - 1].FontStyle  + [fsBold];
        CellProperties[BILL_SUM_WITHOUT_VAT_COLUMN_INDEX, RowCount - 1].FontStyle := CellProperties[BILL_SUM_WITHOUT_VAT_COLUMN_INDEX, RowCount - 1].FontStyle  + [fsBold];
        CellProperties[BILL_SUM_VAT_COLUMN_INDEX, RowCount - 1].FontStyle := CellProperties[BILL_SUM_VAT_COLUMN_INDEX, RowCount - 1].FontStyle  + [fsBold];
      end;



end;

procedure TfrmENServicesConnectionEdit.actInsertFinDocIdFromENPlanWorkExecute(
  Sender: TObject);
var
  TempENSOContract: ENSOContractControllerSoapPort;
begin
  TempENSOContract := HTTPRIOENSOContract as ENSOContractControllerSoapPort;
  TempENSOContract.addFinDocIdFromENPlanWork(ENServicesConnectionObj.code,
  ENServicesConnectionObj.element.code, ENTechConditionsServicesObj.code);
  updateENSOContract;

{var
  planCode : Integer;
  TempENPlanWork : ENPlanWorkControllerSoapPort;
begin
  inherited;
  if (ENTechAgreement2ServicesGL = nil) then Exit;
  if (ENTechAgreement2ServicesGL.finDocID = LOW_INT) then Exit;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  try
    planCode := TempENPlanWork.creatingPlanForServicesByTechAgreement(ENTechAgreement2ServicesGL.finDocID, ENTechConditionsServicesObj.code);
  except
    on EConvertError do Exit
  end;

  LoadENTechAgreement2ServicesGL;
  updatePlanForServicesGridGL;   }
end;

procedure TfrmENServicesConnectionEdit.updateENSOCalculationToSOConnectionBind;
begin

end;

function TfrmENServicesConnectionEdit.getSumRQFKOrder: Double;
var
  TempRQFKOrder: RQFKOrderControllerSoapPort;
  i, LastCount, LastRow: Integer;
  RQFKOrderList: RQFKOrderShortList;
  FKOrderFilter : RQFKOrderFilter;
  sumRQFKOrder: Double;
begin
  Result := 0;
  if ENTechConditionsServicesObj = nil then Exit;
  if ENTechConditionsServicesObj.code = Low(Integer) then Exit;


     TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

     FKOrderFilter := RQFKOrderFilter.Create;
     SetNullIntProps(FKOrderFilter);
     SetNullXSProps(FKOrderFilter);

     FKOrderFilter.kind := RQFKOrderKind.Create;
     FKOrderFilter.kind.code := RQFKORDER_KIND_SERVICES_FROM_SIDE;
     FKOrderFilter.conditionSQL := ' code in ( select rf2pl.fkordercode from rqfkorder2planfact rf2pl ' +
                                   ' where rf2pl.plancode in ( ' +
                                   ' select ct2pl.planrefcode from entechcond2planwork ct2pl ' +
				   ' where ct2pl.techconservicesrefcode = ' + IntToStr(ENTechConditionsServicesObj.code) + ' ) ) ' ;


     RQFKOrderList := TempRQFKOrder.getScrollableFilteredListNoSegr(RQFKOrderFilter(FKOrderFilter),0,-1);

    LastCount:=High(RQFKOrderList.list);

    sumRQFKOrder := 0;

    for i:=0 to LastCount do
    begin
      if RQFKOrderList.list[i].sumWithoutNds <> nil then
        sumRQFKOrder := sumRQFKOrder + StrToFloat(RQFKOrderList.list[i].sumWithoutNds.DecimalString)
      else
        sumRQFKOrder := sumRQFKOrder + 0;
    end;

    Result := sumRQFKOrder;

end;




end.

