//�������������� ���������������� ���������� 10 - 6 / 0,4 ��
unit EditENSubstation04;

interface

uses Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
  GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons, EnergyproController,
  EnergyproController2, ENSubstation04Controller, ExtCtrls, AdvObj, TB2Item,
  TB2Dock, TB2Toolbar, CCElementDataController,
  IdFTP, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, ShellAPI,
  CCDamageLogController, CCGlobal, CCDMReportUnit, CCReportController;

type
    TfrmENSubstation04Edit = class(TDialogForm)

    HTTPRIOENSubstation04: THTTPRIO;
    pcSubstation04: TPageControl;
    tsSubstation04: TTabSheet;
    lblName: TLabel;
    lblNominalPower: TLabel;
    spbEPWorker: TSpeedButton;
    lblEPWorkerName: TLabel;
    lblENLine10Name: TLabel;
    edtName: TEdit;
    edtNominalPower: TEdit;
    edtEPWorkerName: TEdit;
    edtENLine10Name: TEdit;
    HTTPRIOENLine10: THTTPRIO;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    pmEquipSbSt04Lev1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ImageList1: TImageList;
    HTTPRIOENLine04: THTTPRIO;
    lblLastRepairDate: TLabel;
    edtLastRepairDate: TDateTimePicker;
    lblInvNumber: TLabel;
    edtInvNumber: TEdit;
    edtBuhName: TEdit;
    lblBuhName: TLabel;
    lblENSubstationTypeName: TLabel;
    edtENSubstationTypeName: TEdit;
    spbENSubstationType: TSpeedButton;
    lblBelongingType: TLabel;
    lblOwner: TLabel;
    cbBelongingType: TComboBox;
    tsTransformers: TTabSheet;
    ToolBarTramsformer: TToolBar;
    tbViewTransformer: TToolButton;
    tbInsertTransformer: TToolButton;
    tbDeleteTransformer: TToolButton;
    tbEditTransformer: TToolButton;
    tbUpdateTransformer: TToolButton;
    tbFilterTransformer: TToolButton;
    tbNoFilterTransformer: TToolButton;
    sgENTransformer: TAdvStringGrid;
    HTTPRIOENTransformer: THTTPRIO;
    lblSumCntTratformers: TLabel;
    spbEPRen: TSpeedButton;
    edtEPRenName: TEdit;
    lblEPRenName: TLabel;
    lblTRCount: TLabel;
    spbOSSelect: TSpeedButton;
    lblSizCode: TLabel;
    edtSizCode: TEdit;
    lblAddress: TLabel;
    lblYearBuild: TLabel;
    edtYearBuild: TEdit;
    lblYearWorkingStart: TLabel;
    edtYearWorkingStart: TEdit;
    lblNameProject: TLabel;
    edtNameProject: TEdit;
    lblNameBuilder: TLabel;
    edtNameBuilder: TEdit;
    lblChambersQuantity: TLabel;
    edtChambersQuantity: TEdit;
    lblAdditionalData: TLabel;
    edtAdditionalData: TEdit;
    actLineConnectSubstation04: TAction;
    actLineDisconnectSubstation04: TAction;
    tsHighVoltageParty: TTabSheet;
    HTTPRIOENHighVoltageSell: THTTPRIO;
    HTTPRIOENDisconnector: THTTPRIO;
    HTTPRIOENLoadSwitch: THTTPRIO;
    HTTPRIOENFuse: THTTPRIO;
    HTTPRIOENInsulator: THTTPRIO;
    HTTPRIOENArrester: THTTPRIO;
    HTTPRIOENCurrentTransformer: THTTPRIO;
    HTTPRIOENBus: THTTPRIO;
    Label1: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    pnlHighVoltCell: TPanel;
    ToolBar2: TToolBar;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    sgENHighVoltageSell: TAdvStringGrid;
    tsLowVoltageBoard: TTabSheet;
    pnlBoardPanel: TPanel;
    pnlBoardAllienation: TPanel;
    pnlHighVoltageParty: TPanel;
    pcHighVoltageParty: TPageControl;
    tsDisconnector: TTabSheet;
    ToolBar3: TToolBar;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    tbEditDisconnector: TToolButton;
    tbUpdateDisconnector: TToolButton;
    sgENDisconnector: TAdvStringGrid;
    tsLoadSwitch: TTabSheet;
    ToolBar4: TToolBar;
    ToolButton30: TToolButton;
    ToolButton31: TToolButton;
    ToolButton32: TToolButton;
    tbEditLoadSwitch: TToolButton;
    tbUpdateLoadSwitch: TToolButton;
    sgENLoadSwitch: TAdvStringGrid;
    tsFuse: TTabSheet;
    ToolBar5: TToolBar;
    ToolButton37: TToolButton;
    ToolButton38: TToolButton;
    ToolButton39: TToolButton;
    tbEditFuse: TToolButton;
    tbUpdateFuse: TToolButton;
    sgENFuse: TAdvStringGrid;
    tsInsulator: TTabSheet;
    ToolBar6: TToolBar;
    ToolButton44: TToolButton;
    ToolButton45: TToolButton;
    ToolButton46: TToolButton;
    tbEditInsulator: TToolButton;
    tbUpdateInsulator: TToolButton;
    sgENInsulator: TAdvStringGrid;
    tsArrester: TTabSheet;
    ToolBar7: TToolBar;
    ToolButton51: TToolButton;
    ToolButton52: TToolButton;
    ToolButton53: TToolButton;
    tbEditArrester: TToolButton;
    tbUpdateArrester: TToolButton;
    sgENArrester: TAdvStringGrid;
    tsCurrentTransformer: TTabSheet;
    ToolBar8: TToolBar;
    ToolButton58: TToolButton;
    ToolButton59: TToolButton;
    ToolButton60: TToolButton;
    tbEditCurrentTransformer: TToolButton;
    tbUpdateCurrentTransformer: TToolButton;
    sgENCurrentTransformer: TAdvStringGrid;
    tsBus: TTabSheet;
    ToolBar9: TToolBar;
    ToolButton65: TToolButton;
    ToolButton66: TToolButton;
    ToolButton67: TToolButton;
    tbEditBus: TToolButton;
    tbUpdateBus: TToolButton;
    sgENBus: TAdvStringGrid;
    tsMeasurDevice: TTabSheet;
    actViewEquipment: TAction;
    actInsertEquipment: TAction;
    actDeleteEquipment: TAction;
    actEditEquipment: TAction;
    actFilterEquipment: TAction;
    actNoFilterEquipment: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    lblHighVoltageCell: TLabel;
    lblBoardAlienation: TLabel;
    sgENPanel: TAdvStringGrid;
    ToolBar11: TToolBar;
    ToolButton79: TToolButton;
    ToolButton80: TToolButton;
    ToolButton81: TToolButton;
    ToolButton82: TToolButton;
    ToolButton83: TToolButton;
    HTTPRIOENPanel: THTTPRIO;
    HTTPRIOENFuseLVB: THTTPRIO;
    HTTPRIOENMeasurDeviceLVB: THTTPRIO;
    ToolBar12: TToolBar;
    ToolButton86: TToolButton;
    ToolButton87: TToolButton;
    ToolButton88: TToolButton;
    tbEditMeasurDevice: TToolButton;
    tbUpdateMeasurDevice: TToolButton;
    sgENMeasurDevice: TAdvStringGrid;
    HTTPRIOENMeasurDevice: THTTPRIO;
    HTTPRIOENAutomat: THTTPRIO;
    HTTPRIOENMarkBus: THTTPRIO;
    HTTPRIOENBranch: THTTPRIO;
    HTTPRIOENLineCableLVB: THTTPRIO;
    pnlENLine04: TPanel;
    sgENLine04: TAdvStringGrid;
    sgENBranch: TAdvStringGrid;
    HTTPRIOENContactBreaker: THTTPRIO;
    actViewBranch: TAction;
    actInsertBranch: TAction;
    actDeleteBranch: TAction;
    actEditBranch: TAction;
    actFilterBranch: TAction;
    actNoFilterBranch: TAction;
    tsElectricLineSupplies: TTabSheet;
    ToolBarLineSupplies: TToolBar;
    tbViewLineSupplies: TToolButton;
    tbUpdateEquipment: TToolButton;
    pnlElectricLineSuppliesCable: TPanel;
    sgENLineCable: TAdvStringGrid;
    rbENLine10: TRadioButton;
    HTTPRIOENLineCableSupplies: THTTPRIO;
    pnlElectricLineSuppliesAir10: TPanel;
    sgENLine10: TAdvStringGrid;
    rbENLineCable: TRadioButton;
    pcBoardEquipment: TPageControl;
    tsContactBreakerLVB: TTabSheet;
    sgENContactBreaker: TAdvStringGrid;
    ToolBar10: TToolBar;
    ToolButton72: TToolButton;
    ToolButton73: TToolButton;
    ToolButton74: TToolButton;
    tbEditContactBreaker: TToolButton;
    tbUpdateContactBreaker: TToolButton;
    tsFuseLVB: TTabSheet;
    sgENFuseLVB: TAdvStringGrid;
    ToolBar14: TToolBar;
    ToolButton102: TToolButton;
    ToolButton103: TToolButton;
    ToolButton104: TToolButton;
    tbEditFuseLVB: TToolButton;
    tbUpdateFuseLVB: TToolButton;
    tsAutomatLVB: TTabSheet;
    sgENAutomat: TAdvStringGrid;
    ToolBar15: TToolBar;
    ToolButton109: TToolButton;
    ToolButton110: TToolButton;
    ToolButton111: TToolButton;
    tbEditAutomat: TToolButton;
    tbUpdateAutomat: TToolButton;
    tsMeasurDeviceLVB: TTabSheet;
    sgENMeasurDeviceLVB: TAdvStringGrid;
    ToolBar16: TToolBar;
    ToolButton116: TToolButton;
    ToolButton117: TToolButton;
    ToolButton118: TToolButton;
    tbEditMeasurDeviceLVB: TToolButton;
    tbUpdateMeasurDeviceLVB: TToolButton;
    grpHighVoltageEquipment: TGroupBox;
    lblLine10Cnt: TLabel;
    lblLineCableCnt: TLabel;
    lblCntLine10: TLabel;
    lblCntLineCable: TLabel;
    lblBusCnt: TLabel;
    lblMeasurDeviceCnt: TLabel;
    lblCntMeasurDevice: TLabel;
    lblCntBus: TLabel;
    lblArresterCnt: TLabel;
    lblCurrentTRCnt: TLabel;
    lblCntArrester: TLabel;
    lblCntCurrentTR: TLabel;
    lblCntFuse: TLabel;
    lblFuseCnt: TLabel;
    lblCntInsulator: TLabel;
    lblInsulatorCnt: TLabel;
    lblCntDisconnector: TLabel;
    lblCntLoadSwitch: TLabel;
    lblDisconnectorCnt: TLabel;
    lblLoadSwitchCnt: TLabel;
    lblCntHighVoltCell: TLabel;
    lblHighVoltCellCnt: TLabel;
    GroupBox2: TGroupBox;
    lblCntLine04: TLabel;
    lblLine04Cnt: TLabel;
    lblCntLineCableLVB: TLabel;
    lblLineCableLVBcnt: TLabel;
    lblContactBreakerCnt: TLabel;
    lblCntContactBreaker: TLabel;
    lblCntFuseLVB: TLabel;
    lblFuseLVBcnt: TLabel;
    lblCntAutomat: TLabel;
    lblAutomatCnt: TLabel;
    lblCntMeasurDeviceLVB: TLabel;
    lblMeasurDeviceLVBcnt: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    lblCntPanel: TLabel;
    lblPanelCnt: TLabel;
    tbLineConnectSubstation04: TToolButton;
    tbLineDisconnectSubstation04: TToolButton;
    Label2: TLabel;
    BtnPasspSubSt04: TButton;
    actPasspSubSt_6_10_04: TAction;
    spbAddress: TSpeedButton;
    memAddress: TMemo;
    HTTPRIOAddress: THTTPRIO;
    tbEquipTransformer: TToolButton;
    actChangeTransformer: TAction;
    HTTPRIOENTransformerChange: THTTPRIO;
    pmChangeEquipment: TPopupMenu;
    miEquipTransformer: TMenuItem;
    miChangeTransformer: TMenuItem;
    miDemontageTransformer: TMenuItem;
    miMontageTransformer: TMenuItem;
    miHistoryTransformer: TMenuItem;
    actUninstallTransformer: TAction;
    actInstallTransformer: TAction;
    tbEquipDisconnector: TToolButton;
    miEquipDisconnector: TMenuItem;
    miChangeDisconnector: TMenuItem;
    actChangeDisconnector: TAction;
    actUninstallDisconnector: TAction;
    actInstallDisconnector: TAction;
    actChangeLoadSwitch: TAction;
    actUninstallLoadSwitch: TAction;
    actInstallLoadSwitch: TAction;
    actChangeFuse: TAction;
    actUninstallFuse: TAction;
    actInstallFuse: TAction;
    actChangeInsulator: TAction;
    actUninstallInsulator: TAction;
    actInstallInsulator: TAction;
    actChangeArrester: TAction;
    actUninstallArrester: TAction;
    actInstallArrester: TAction;
    actChangeCurrentTransformer: TAction;
    actUninstallCurrentTransformer: TAction;
    actInstallCurrentTransformer: TAction;
    actChangeBus: TAction;
    actUninstallBus: TAction;
    actInstallBus: TAction;
    actChangeMeasurDevice: TAction;
    actUninstallMeasurDevice: TAction;
    actInstallMeasurDevice: TAction;
    actChangeContactBreaker: TAction;
    actUninstallContactBreaker: TAction;
    actInstallContactBreaker: TAction;
    actChangeFuseLVB: TAction;
    actUninstallFuseLVB: TAction;
    actInstallFuseLVB: TAction;
    actChangeAutomat: TAction;
    actUninstallAutomat: TAction;
    actInstallAutomat: TAction;
    actChangeMeasurDeviceLVB: TAction;
    actUninstallMeasurDeviceLVB: TAction;
    actInstallMeasurDeviceLVB: TAction;
    miEquipLoadSwitch: TMenuItem;
    miDemontageDisconnector: TMenuItem;
    miMontageDisconnector: TMenuItem;
    miHistoryDisconnector: TMenuItem;
    miChangeLoadSwitch: TMenuItem;
    miDemontageLoadSwitch: TMenuItem;
    miMontageLoadSwitch: TMenuItem;
    miHistoryLoadSwitch: TMenuItem;
    miEquipFuse: TMenuItem;
    miChangeFuse: TMenuItem;
    miDemontageFuse: TMenuItem;
    miMontageFuse: TMenuItem;
    miHistoryFuse: TMenuItem;
    miEquipInsulator: TMenuItem;
    N5: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    miHistoryInsulator: TMenuItem;
    miEquipArrester: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    miHistoryArrester: TMenuItem;
    miEquipCurrentTransformer: TMenuItem;
    miEquipBus: TMenuItem;
    miEquipMeasurDevice: TMenuItem;
    miEquipContactBreaker: TMenuItem;
    miEquipFuseLVB: TMenuItem;
    miEquipAutomat: TMenuItem;
    miEquipMeasurDeviceLVB: TMenuItem;
    miChangeCurrentTransformer: TMenuItem;
    miDemontageCurrentTransformer: TMenuItem;
    miMontageCurrentTransformer: TMenuItem;
    miHistoryCurrentTransformer: TMenuItem;
    miChangeBus: TMenuItem;
    miUninstallBus: TMenuItem;
    miInstallBus: TMenuItem;
    miHistoryBus: TMenuItem;
    miChangeMeasurDevice: TMenuItem;
    miDemontageMeasurDevice: TMenuItem;
    miMontageMeasurDevice: TMenuItem;
    miHistoryMeasurDevice: TMenuItem;
    miChangeContactBreaker: TMenuItem;
    miDemontageContactBreaker: TMenuItem;
    miMontageContactBreaker: TMenuItem;
    miHistoryContactBreaker: TMenuItem;
    miChangeFuseLVB: TMenuItem;
    miDemontageFuseLVB: TMenuItem;
    miMontageFuseLVB: TMenuItem;
    miHistoryFuseLVB: TMenuItem;
    miChangeAutomat: TMenuItem;
    miDemontageAutomat: TMenuItem;
    miMontageAutomat: TMenuItem;
    miHistoryAutomat: TMenuItem;
    miChangeMeasurDeviceLVB: TMenuItem;
    miDemontageMeasurDeviceLVB: TMenuItem;
    miMontageMeasurDeviceLVB: TMenuItem;
    miHistoryMeasurDeviceLVB: TMenuItem;
    tbEquipLoadSwitch: TToolButton;
    tbEquipFuse: TToolButton;
    tbEquipInsulator: TToolButton;
    tbEquipArrester: TToolButton;
    tbEquipCurrentTransformer: TToolButton;
    tbEquipBus: TToolButton;
    tbEquipMeasurDevice: TToolButton;
    tbEquipContactBreaker: TToolButton;
    tbEquipFuseLVB: TToolButton;
    tbEquipAutomat: TToolButton;
    tbEquipMeasurDeviceLVB: TToolButton;
    pmEquipSbSt04Lev3: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    pmEquipSbSt04Lev2: TPopupMenu;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    HTTPRIOENDisconnectorChange: THTTPRIO;
    HTTPRIOENLoadSwitchChange: THTTPRIO;
    HTTPRIOENFuseChange: THTTPRIO;
    HTTPRIOENInsulatorChange: THTTPRIO;
    HTTPRIOENArresterChange: THTTPRIO;
    HTTPRIOENCurTransformerChange: THTTPRIO;
    HTTPRIOENBusChange: THTTPRIO;
    HTTPRIOENMeasurDevChange: THTTPRIO;
    HTTPRIOENContBreakChange: THTTPRIO;
    HTTPRIOENAutomatChange: THTTPRIO;
    actHistoryTransformer: TAction;
    pnlLowVoltBoard: TPanel;
    sgENLowVoltBoard: TAdvStringGrid;
    HTTPRIOENLowVoltBoard: THTTPRIO;
    chbLowVoltBoard: TCheckBox;
    lblLowVoltBoard: TLabel;
    pnlENAgreeJoint: TPanel;
    HTTPRIOENAgreeJoint: THTTPRIO;
    tbViewAgreeJoint: TToolButton;
    tbInsertAgreeJoint: TToolButton;
    tbEditAgreeJoint: TToolButton;
    lblENAgreeJoint: TLabel;
    tbDeleteAgreeJoint: TToolButton;
    actViewAgreeJoint: TAction;
    actInsertAgreeJoint: TAction;
    actEditAgreeJoint: TAction;
    actDeleteAgreeJoint: TAction;
    sgENAgreeJoint: TAdvStringGrid;
    pmAgreeJoint: TPopupMenu;
    mi: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    lblSafetyPrecautions: TLabel;
    lblENFencing: TLabel;
    spbTkMaterialsLock: TSpeedButton;
    gbLockType: TGroupBox;
    rbLockTypeExternal: TRadioButton;
    rbLockTypeInternal: TRadioButton;
    memTkMaterialsLock: TMemo;
    lblTkMaterialsLock: TLabel;
    rbLockTypeAbsent: TRadioButton;
    HTTPRIOENSafetyPrecautions: THTTPRIO;
    edtENFencing: TEdit;
    HTTPRIOENHighVoltCellSupplies: THTTPRIO;
    tsENActS04: TTabSheet;
    tsENPlanWorkS04: TTabSheet;
    HTTPRIOENAct: THTTPRIO;
    ToolBar13: TToolBar;
    ToolButton2: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    actViewAct: TAction;
    actUpdateAct: TAction;
    actNoFilterAct: TAction;
    actFilterAct: TAction;
    ToolBar17: TToolBar;
    ToolButton3: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton21: TToolButton;
    actViewPlanWork: TAction;
    actUpdatePlanWork: TAction;
    actFilterPlanWork: TAction;
    actNoFilterPlanWork: TAction;
    HTTPRIOAuth: THTTPRIO;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIOENElement: THTTPRIO;
    HTTPRIOENPlanWorkMoveHistory: THTTPRIO;
    pnlENPlanWork: TPanel;
    sgENPlanWork: TAdvStringGrid;
    RadioGroup1: TRadioGroup;
    tsFiderGuage: TTabSheet;
    ToolBar18: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton13: TToolButton;
    ToolButton22: TToolButton;
    ToolButton26: TToolButton;
    ToolButton27: TToolButton;
    ToolButton28: TToolButton;
    HTTPRIOENFiderGuage: THTTPRIO;
    sgENFiderGuage: TAdvStringGrid;
    actS04_TransformerFiderGauge: TAction;
    ToolButton29: TToolButton;
    btnFiderGauge: TBitBtn;
    actViewLowVoltBoard: TAction;
    actEditLowVoltBoard: TAction;
    actUpdateLowVoltBoard: TAction;
    pmLowVoltBoard: TPopupMenu;
    miViewLowVoltBoard: TMenuItem;
    miEditLowVoltBoard: TMenuItem;
    miUpdateLowVoltBoard: TMenuItem;
    actHistoryDisconnector: TAction;
    actHistoryLoadSwitch: TAction;
    actHistoryFuse: TAction;
    actHistoryInsulator: TAction;
    actHistoryArrester: TAction;
    actHistoryCurrentTransformer: TAction;
    actHistoryBus: TAction;
    actHistoryMeasurDevice: TAction;
    actHistoryContactBreaker: TAction;
    actHistoryAutomat: TAction;
    tsWorkFlow: TTabSheet;
    HTTPRIOCNPack: THTTPRIO;
    actUpdateCN: TAction;
    actUpdateSPL_PP: TAction;
    pnlEnergyWorkFlow: TPanel;
    gbConnection: TGroupBox;
    pnlConnectionPack: TPanel;
    sgCNPack: TAdvStringGrid;
    pnlConnectionMovement: TPanel;
    scrlBxConnectionMovement: TScrollBox;
    pntBxConnectionMovement: TPaintBox;
    gbSupply: TGroupBox;
    pnlSPL_PP_Pack: TPanel;
    sgSPL_PP_Pack: TAdvStringGrid;
    pnlEnergyWorkflowTop: TPanel;
    pnlEnergyWorkFlowCurState: TPanel;
    tlBrPackages: TToolBar;
    tbWorkflowPackView: TToolButton;
    tbUpdateWorkflow: TToolButton;
    gbConnectionCurState: TGroupBox;
    gbSupplyCurState: TGroupBox;
    memCNPack: TMemo;
    memSPL_PP_Pack: TMemo;
    pnlReserv: TPanel;
    lblReserv: TLabel;
    edtSumPowerInfluence: TEdit;
    Shape3: TShape;
    Label3: TLabel;
    Shape1: TShape;
    Label4: TLabel;
    Shape2: TShape;
    Shape4: TShape;
    Label5: TLabel;
    Label6: TLabel;
    Shape5: TShape;
    Label7: TLabel;
    btnPricconectionData: TButton;
    Shape6: TShape;
    Label8: TLabel;
    Shape7: TShape;
    Label9: TLabel;
    lblPaintSquare: TLabel;
    edtPaintSquare: TEdit;
    edtOwner: TEdit;
    spbOwner: TSpeedButton;
    HTTPRIOENOwner: THTTPRIO;
    btnS04Reserv: TBitBtn;
    actLoadS04Reserv: TAction;
    tsENInspectionSheet: TTabSheet;
    pmInspectionSheet: TPopupMenu;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    miSendToSigning: TMenuItem;
    miUnSigning: TMenuItem;
    miSigned: TMenuItem;
    miUnSigned: TMenuItem;
    tbActions: TTBToolbar;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem47: TTBItem;
    TBItem7: TTBItem;
    TBItem46: TTBItem;
    sgENInspectionSheet: TAdvStringGrid;
    HTTPRIOENInspectionSheet: THTTPRIO;
    alInspectionSheet: TActionList;
    actViewInspectionSheet: TAction;
    actInsertENInspectionSheet: TAction;
    actDeleteENInspectionSheet: TAction;
    actEditENInspectionSheet: TAction;
    actUpdateENInspectionSheet: TAction;
    actSendToSigning: TAction;
    actUnSigning: TAction;
    actSigned: TAction;
    actUnSigned: TAction;
    rbInspect4: TRadioButton;
    rbInspect2: TRadioButton;
    spbFINExecutor: TSpeedButton;
    edtFINExecutorName: TEdit;
    lblExecuter: TLabel;
    actCopySheet: TAction;
    miCopySheet: TMenuItem;
    tsCCElement: TTabSheet;
    HTTPRIOCCElementData: THTTPRIO;
    sgCCElementData: TAdvStringGrid;
    sgENAct: TAdvStringGrid;
    edtGeograph: TEdit;
    btnGeographClear: TSpeedButton;
    btnGeograph: TSpeedButton;
    lblGeograph: TLabel;
    HTTPRIOENGeographicDepartment: THTTPRIO;
    tsAttachments: TTabSheet;
    ToolBar19: TToolBar;
    btnLoadAttachment: TToolButton;
    btnAddAttachments: TToolButton;
    btnDeleteAttachment: TToolButton;
    btnUpdateAttachments: TToolButton;
    ActionAttachment: TActionList;
    actLoadAttachment: TAction;
    actAddAttachment: TAction;
    actDeleteAttachment: TAction;
    actUpdateAttachments: TAction;
    pmAttachment: TPopupMenu;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    HTTPRIOENDocAttachment: THTTPRIO;
    sgENDocAttachment: TAdvStringGrid;
    tsCCDamageLog: TTabSheet;
    HTTPRIOCCDamageLog: THTTPRIO;
    sgCCDamageLog: TAdvStringGrid;
    tbDamages: TTBToolbar;
    tbiDamagesXLS: TTBItem;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbEPWorkerClick(Sender : TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure pcSubstation04Change(Sender: TObject);
    procedure UpdateGrid(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure spbENSubstationTypeClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure recalcTransformers();
    procedure recalcHighVoltCells();
    procedure recalcDisconnectors();
    procedure recalcLoadSwitches();
    procedure recalcFuses();
    procedure recalcInsulators();
    procedure recalcArresters();
    procedure recalcCurrentTransformers();
    procedure recalcBuses();
    procedure recalcMeasurDevices();
    procedure recalcLines10();
    function recalcLines10HVS(hvsCode: String): Integer;
    procedure recalcLinesCable();
    function recalcLinesCableHVS(hvsCode: String): Integer;
    procedure recalcPanels();
    procedure recalcBranches(branchType: Integer);
    procedure recalcContactBreakers();
    function recalcContactBreakersBr(brCode: String): Integer;
    procedure recalcFusesLVB();
    function recalcFusesBr(brCode: String): Integer;
    procedure recalcAutomates();
    function recalcAutomatesBr(brCode: String): Integer;
    procedure recalcMeasurDevicesLVB();
    procedure spbOSSelectClick(Sender: TObject);
    procedure actLineConnectSubstation04Execute(Sender: TObject);
    procedure actLineDisconnectSubstation04Execute(Sender: TObject);
    procedure pcSubstation04Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure pcHighVoltagePartyChange(Sender: TObject);
    procedure actViewEquipmentExecute(Sender: TObject);
    procedure actInsertEquipmentExecute(Sender: TObject);
    procedure actDeleteEquipmentExecute(Sender: TObject);
    procedure actEditEquipmentExecute(Sender: TObject);
    procedure sgENHighVoltageSellRowChanging(Sender: TObject; OldRow,
      NewRow: Integer; var Allow: Boolean);
    procedure pcBoardEquipmentChange(Sender: TObject);
    procedure actViewBranchExecute(Sender: TObject);
    procedure actDeleteBranchExecute(Sender: TObject);
    procedure actInsertBranchExecute(Sender: TObject);
    procedure actEditBranchExecute(Sender: TObject);
    procedure sgENLine10Click(Sender: TObject);
    procedure sgENLineCableClick(Sender: TObject);
    procedure sgENPanelRowChanging(Sender: TObject; OldRow,
      NewRow: Integer; var Allow: Boolean);
    procedure sgENBranchRowChanging(Sender: TObject; OldRow,
      NewRow: Integer; var Allow: Boolean);
    procedure actPasspSubSt_6_10_04Execute(Sender: TObject);
    procedure spbAddressClick(Sender: TObject);
    procedure actChangeTransformerExecute(Sender: TObject);
    procedure actUninstallTransformerExecute(Sender: TObject);
    procedure actInstallTransformerExecute(Sender: TObject);
    procedure actChangeDisconnectorExecute(Sender: TObject);
    procedure actUninstallDisconnectorExecute(Sender: TObject);
    procedure actInstallDisconnectorExecute(Sender: TObject);
    procedure actChangeLoadSwitchExecute(Sender: TObject);
    procedure actUninstallLoadSwitchExecute(Sender: TObject);
    procedure actInstallLoadSwitchExecute(Sender: TObject);
    procedure actChangeFuseExecute(Sender: TObject);
    procedure actUninstallFuseExecute(Sender: TObject);
    procedure actInstallFuseExecute(Sender: TObject);
    procedure actChangeInsulatorExecute(Sender: TObject);
    procedure actUninstallInsulatorExecute(Sender: TObject);
    procedure actInstallInsulatorExecute(Sender: TObject);
    procedure actChangeArresterExecute(Sender: TObject);
    procedure actUninstallArresterExecute(Sender: TObject);
    procedure actInstallArresterExecute(Sender: TObject);
    procedure actChangeCurrentTransformerExecute(Sender: TObject);
    procedure actUninstallCurrentTransformerExecute(Sender: TObject);
    procedure actInstallCurrentTransformerExecute(Sender: TObject);
    procedure actChangeBusExecute(Sender: TObject);
    procedure actUninstallBusExecute(Sender: TObject);
    procedure actInstallBusExecute(Sender: TObject);
    procedure actChangeMeasurDeviceExecute(Sender: TObject);
    procedure actUninstallMeasurDeviceExecute(Sender: TObject);
    procedure actInstallMeasurDeviceExecute(Sender: TObject);
    procedure actChangeContactBreakerExecute(Sender: TObject);
    procedure actUninstallContactBreakerExecute(Sender: TObject);
    procedure actInstallContactBreakerExecute(Sender: TObject);
    procedure actChangeFuseLVBExecute(Sender: TObject);
    procedure actUninstallFuseLVBExecute(Sender: TObject);
    procedure actInstallFuseLVBExecute(Sender: TObject);
    procedure actChangeAutomatExecute(Sender: TObject);
    procedure actUninstallAutomatExecute(Sender: TObject);
    procedure actInstallAutomatExecute(Sender: TObject);
    procedure actChangeMeasurDeviceLVBExecute(Sender: TObject);
    procedure actUninstallMeasurDeviceLVBExecute(Sender: TObject);
    procedure actInstallMeasurDeviceLVBExecute(Sender: TObject);
    procedure actHistoryTransformerExecute(Sender: TObject);
    procedure chbLowVoltBoardMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure chbLowVoltBoardKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgENLowVoltBoardClick(Sender: TObject);
    procedure sgENBranchMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sgENBranchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgENPanelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sgENPanelKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actViewAgreeJointExecute(Sender: TObject);
    procedure actInsertAgreeJointExecute(Sender: TObject);
    procedure actEditAgreeJointExecute(Sender: TObject);
    procedure actDeleteAgreeJointExecute(Sender: TObject);
    procedure sgENLine10RowChanging(Sender: TObject; OldRow,
      NewRow: Integer; var Allow: Boolean);
    procedure sgENLine10MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sgENLine10KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgENLineCableRowChanging(Sender: TObject; OldRow,
      NewRow: Integer; var Allow: Boolean);
    procedure sgENLineCableMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sgENLineCableKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actFilterActExecute(Sender: TObject);
    procedure actUpdateActExecute(Sender: TObject);
    procedure actViewActExecute(Sender: TObject);
    procedure actNoFilterActExecute(Sender: TObject);
    procedure actViewPlanWorkExecute(Sender: TObject);
    procedure actUpdatePlanWorkExecute(Sender: TObject);
    procedure actFilterPlanWorkExecute(Sender: TObject);
    procedure actNoFilterPlanWorkExecute(Sender: TObject);
    procedure sgENActDblClick(Sender: TObject);
    procedure sgENPlanWorkDblClick(Sender: TObject);
    procedure actS04_TransformerFiderGaugeExecute(Sender: TObject);
    procedure btnFiderGaugeClick(Sender: TObject);
    procedure actViewLowVoltBoardExecute(Sender: TObject);
    procedure actEditLowVoltBoardExecute(Sender: TObject);
    procedure actUpdateLowVoltBoardExecute(Sender: TObject);
    procedure actHistoryDisconnectorExecute(Sender: TObject);
    procedure actHistoryLoadSwitchExecute(Sender: TObject);
    procedure actHistoryFuseExecute(Sender: TObject);
    procedure actHistoryInsulatorExecute(Sender: TObject);
    procedure actHistoryArresterExecute(Sender: TObject);
    procedure actHistoryCurrentTransformerExecute(Sender: TObject);
    procedure actHistoryBusExecute(Sender: TObject);
    procedure actHistoryMeasurDeviceExecute(Sender: TObject);
    procedure actHistoryContactBreakerExecute(Sender: TObject);
    procedure actHistoryAutomatExecute(Sender: TObject);
    procedure sgCNPackRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure actUpdateCNExecute(Sender: TObject);
    procedure actUpdateSPL_PPExecute(Sender: TObject);
    procedure sgSPL_PP_PackRowChanging(Sender: TObject; OldRow,
      NewRow: Integer; var Allow: Boolean);
    procedure btnPricconectionDataClick(Sender: TObject);
    procedure spbOwnerClick(Sender: TObject);
    procedure actLoadS04ReservExecute(Sender: TObject);
    procedure sgENInspectionSheetClick(Sender: TObject);
    procedure sgENInspectionSheetDblClick(Sender: TObject);
    procedure pmInspectionSheetPopup(Sender: TObject);
    procedure actViewInspectionSheetExecute(Sender: TObject);
    procedure actInsertENInspectionSheetExecute(Sender: TObject);
    procedure actDeleteENInspectionSheetExecute(Sender: TObject);
    procedure actEditENInspectionSheetExecute(Sender: TObject);
    procedure actUpdateENInspectionSheetExecute(Sender: TObject);
    procedure actSendToSigningExecute(Sender: TObject);
    procedure actUnSigningExecute(Sender: TObject);
    procedure actSignedExecute(Sender: TObject);
    procedure actUnSignedExecute(Sender: TObject);
    procedure spbFINExecutorClick(Sender: TObject);
    procedure actCopySheetExecute(Sender: TObject);
    procedure LoadCCElement();
    procedure LoadCCDamageLog();
    procedure sgCCElementDataDblClick(Sender: TObject);
    procedure btnGeographClick(Sender: TObject);
    procedure btnGeographClearClick(Sender: TObject);
    procedure actLoadAttachmentExecute(Sender: TObject);
    procedure actAddAttachmentExecute(Sender: TObject);
    procedure actDeleteAttachmentExecute(Sender: TObject);
    procedure actUpdateAttachmentsExecute(Sender: TObject);
    procedure sgCCDamageLogDblClick(Sender: TObject);
    procedure tbiDamagesXLSClick(Sender: TObject);

  private
    { Private declarations }
    procedure LowVoltBoardEquipmentShow; //����������� ������������ ���
    procedure ChangeLVBEquipmentHeaders; //��������� ���������� �������� ���
    procedure LowVoltBoardActionActivate(actEnable: Boolean); //������ ���
    procedure UpdateGridAct(Sender: TObject);
    procedure UpdateGridPW(Sender: TObject);
    procedure updateAttachments();            //���������� ������ ��������
  public
    { Public declarations }

end;

var
  frmENSubstation04Edit: TfrmENSubstation04Edit;
  ENSubstation04Obj: ENSubstation04;
  deviceParty: Integer; //����� ������������ �� ����������

const
  partyHVS = 1; //�������������� �������
  partyLVBP = 2; //������������� �������, ������������� �� ������ �������������� ����
  partyLVBM = 3; //������������� �������, ������� ���� �������������� ����

  //frmENTranformerEdit : TfrmENTranformerEdit;
  //ENTransforemerObj :

implementation

uses
  ShowEPWorker
  , ShowENElement
  , ENElementController
  , ShowENLine10, ENLine10Controller, EditENLine10
  , ShowENLine04, ENLine04Controller, EditENLine04
  , ShowENLineCable, ENLineCableController, EditENLineCable
  , ShowENSubstationType, ENSubstationTypeController, ENOwnerController
  , ENBelongingController
  , ShowENEPRen
  , OSTableController
  , ShowOStable
  , ENTransformerController, EditENTransformer
  , ShowENHighVoltageSell, ENHighVoltageSellController
  , EditENHighVoltageSell, ENDisconnectorController
  , EditENDisconnector, ShowENDisconnector
  , ENLoadSwitchController, EditENLoadSwitch, ShowENLoadSwitch
  , ENFuseController, EditENFuse, ShowENFuse
  , ENInsulatorController, EditENInsulator, ShowENInsulator
  , ENArresterController, EditENArrester, ShowENArrester
  , ENCurrentTransformerController, EditENCurrentTransformer
  , ShowENCurrentTransformer
  , ENMeasurDeviceController, EditENMeasurDevice
  , ENBusController, EditENBus, ShowENBus
  , ENDisconnectorTypeController
  , ENDisconnectorDriveTypeController
  , ENLoadSwitchTypeController
  , ENLoadSwitchDriveTypeController
  , ENFuseTypeController
  , ENInsulatorTypeController
  , ENArresterTypeController
  , ENCurrentTransformerTypeController
  , ENMeasurDeviceTypeController
  , ENArresterSiteController
  , ENLowVoltBoardController, ShowENLowVoltBoard, EditENLowVoltBoard
  , ENPanelController, ShowENPanel, EditENPanel
  , ENPanelTypeController
  , ENBranchController, ShowENBranch, EditENBranch
  , ENContactBreakerController, ShowENContactBreaker, EditENContactBreaker
  , ENAutomatController, ShowENAutomat, EditENAutomat
  , DMReportsUnit
  , EditAddress, AddressController, ProvinceController, RegionController
  , EditENTransformerChange, ENTransformerChangeController
  , EditENDisconnectorChange, ENDisconnectorChangeController
  , EditENLoadSwitchChange, ENLoadSwitchChangeController
  , EditENFuseChange, ENFuseChangeController
  , EditENInsulatorChange, ENInsulatorChangeController
  , EditENArresterChange, ENArresterChangeController
  , EditENCurTransformerChange, ENCurTransformerChangeController
  , EditENBusChange, ENBusChangeController
  , EditENMeasurDevChange, ENMeasurDevChangeController
  , EditENContBreakChange, ENContBreakChangeController
  , EditENAutomatChange, ENAutomatChangeController
  , ShowENTransformerChange
  , ShowENDisconnectorChange
  , ShowENLoadSwitchChange
  , ShowENFuseChange
  , ShowENInsulatorChange
  , ShowENArresterChange
  , ShowENCurTransformerChange
  , ShowENBusChange
  , ShowENMeasurDevChange
  , ShowENContBreakChange
  , ShowENAutomatChange
  , ENAgreeJointController, EditENAgreeJoint
  , ENSafetyPrecautionsController, ENFencingController, ENLockTypeController
  , TKMaterialsController, ENHighVoltCellSuppliesController
  , ENActController, ENPlanWorkController, EditENAct, EditENActFilter
  , EditENPlanWork, EditENPlanWorkFilter, ShowENPlanWork
  , EditENFiderGuage, ENFiderGuageController, FiderGauge
  , EditENPriconnectionData, EditENOwner, ShowENOwner
  , ENInspectionSheetController, EditENInspectionSheet, AddENInspectionSheet,
  ShowENSubstation04, CNPackController, ENConsts, Main, Math,
  ShowFINExecutorTree, FINExecutorController,
  EditCCElementData, ShowENGeographicDepartment,
  ENGeographicDepartmentController,
  ENDocAttachmentController, EditDFDocAttachment,
  ENDocAttachmentServerController, Globals, ENDocAttachmentStatusController,
  EditCCDamageLog;

{$R *.dfm}

var
  S04Activ: Boolean;
  rowCN, selectedPWRow: Integer;
  outerPWCondition: String;
  disableControlsTypePW: TDisableType;
  //frmENLine04Show : TfrmENLine04Show;

  l04Filter : ENLine04Filter;                       //������ ������� ��� ����� 0,4 ��
  t04FilterObject : ENTransformerFilter;            //������ ������� ��� ���������������
  hvsFilterObject: ENHighVoltageSellFilter;         //������ ������� ��� �������������� �����
  dFilterObject: ENDisconnectorFilter;              //������ ������� ��� ��������������
  lsFilterObject: ENLoadSwitchFilter;               //������ ������� ��� ������������ ��������
  fsFilterObject,                                   //������� �������� ��� ��������������� �� ��������������
  fsLvbFilterObject: ENFuseFilter;                  //� ������������� �������� ��������������
  insFilterObject: ENInsulatorFilter;               //������ ������� ��� ���������
  arFilterObject: ENArresterFilter;                 //������ ������� ��� �����������
  ctFilterObject: ENCurrentTransformerFilter;       //������ ������� ��� ��������������� ����
  busFilterObject: ENBusFilter;                     //������ ������� ��� ���
  mdFilterObject,                                   //������� �������� ��� ������������� �������� �� ��������������
  mdLvbFilterObject: ENMeasurDeviceFilter;          //� ������������� �������� ��������������
  brFilterObject: ENBranchFilter;                   //������ ������� ��� ������������� � ��������� ������ (���������� ��������)
  pnlFilterObject: ENPanelFilter;                   //������ ������� ��� �������
  cbFilterObject: ENContactBreakerFilter;           //������ ������� ��� �����������
  amFilterObject: ENAutomatFilter;                  //������ ������� ��� �������������� ������������
  L10FilterObject: ENLine10Filter;                  //������ ������� ��� ����� ������� 6 - 10 ��
  lcsFilterObject: ENLineCableFilter;               //������ ������� ��� ��������� ����� �������
  lvbFilterObject: ENLowVoltBoardFilter;            //������ ������� ��� �������������� ����
  ajFilterObject: ENAgreeJointFilter;               //������ ������� ��� ��������� � ���������� ������������� ������������
  sprFilterObject: ENSafetyPrecautionsFilter;       //������ ������� ��� ��� ������� ������������ ������������� ������
  (*fncFilterObject: ENFencingFilter;               //������ ������� ��� ����������
  lckFilterObject: ENLockTypeFilter;                //������ ������� ��� ����� ������*)
  actFilterObject: ENActFilter;                     //������ ������� ��� �����
  pwFilterObject: ENPlanWorkFilter;                 //������ ������� ��� ������
  fgFilterObject: ENFiderGuageFilter;               //������ ������� ��� ������� ���������� ��������
  cnpFilterObject: CNPackFilter;                    //������ ������� ��� ������� ��������� ������������� I - IV
                                                    //�� � ����� 01.08.2010, � 14.03.2011, � 01.03.2013 ��.
  spl_pp_FilterObject: CNPackFilter;                //������ ������� ��� ������� ��������� �������� ��������������
                                                    //������������ ������������ � �������� ��������

  LastCount, l04ColCount, l04LastCount: Integer;

  l04LastRow: Integer = 1;
  t04ColCount, t04LastCount: Integer;
  t04LastRow: Integer = 1;
  hvsColCount, hvsLastCount: Integer;
  hvsLastRow: Integer = 1;
  dColCount, dLastCount: Integer;
  dLastRow: Integer = 1;
  lsColCount, lsLastCount: Integer;
  lsLastRow: Integer = 1;
  fsColCount, fsLastCount: Integer;
  fsLastRow: Integer = 1;
  insColCount, insLastCount: Integer;
  insLastRow: Integer = 1;
  arColCount, arLastCount: Integer;
  arLastRow: Integer = 1;
  ctColCount, ctLastCount: Integer;
  ctLastRow: Integer = 1;
  busColCount, busLastCount: Integer;
  busLastRow: Integer = 1;
  mdColCount, mdLastCount: Integer;
  mdLastRow: Integer = 1;
  brColCount, brLastCount: Integer;
  brLastRow: Integer = 1;
  pnlColCount, pnlLastCount: Integer;
  pnlLastRow: Integer = 1;
  cbColCount, cbLastCount: Integer;
  cbLastRow: Integer = 1;
  amColCount, amLastCount: Integer;
  amLastRow: Integer = 1;
  fsLvbColCount, fsLvbLastCount: Integer;
  fsLvbLastRow: Integer = 1;
  mdLvbColCount, mdLvbLastCount: Integer;
  mdLvbLastRow: Integer = 1;
  L10ColCount, L10LastCount: Integer;
  L10LastRow: Integer = 1;
  lcsColCount, lcsLastCount: Integer;
  lcsLastRow: Integer = 1;
  lvbColCount, lvbLastCount: Integer;
  lvbLastRow: Integer = 1;
  ajColCount, ajLastCount: Integer;
  ajLastRow: Integer = 1;
  sprLastCount: Integer;
  (*sprLastRow: Integer = 1;
  fncColCount, fncLastCount: Integer;
  fncLastRow: Integer = 1;
  lckColCount, lckLastCount: Integer;
  lckLastRow: Integer = 1;*)
  actColCount, actLastCount: Integer;
  actLastRow: Integer = 1;
  pwColCount, pwLastCount: Integer;
  pwLastRow: Integer = 1;
  fgColCount, fgLastCount: Integer;
  fgLastRow: Integer = 1;
  cnpColCount, cnpLastCount: Integer;
  cnpLastRow: Integer = 1;
  spl_pp_ColCount, spl_pp_LastCount: Integer;
  spl_pp_LastRow: Integer = 1;

  SPL_PP_PackHeaders: array [1..16] of String =
        (  '���'
          ,'��� ������'
          ,'�����'
          ,'��� � ��'
          ,'�����'
          ,'ϳ��������'
          ,'������ ������'
          ,'����'
          ,'г� ��������'
          ,'���������'
          ,'������ ���������'
          ,'�������� ������ ���������'
          ,'���������� � ���.'
          ,'���� �������� ��� ���������� �����������㳿'
          ,'��������� ������ ��� �������'
          ,'�������� ����'
        );

  CNPackHeaders: array [1..26] of String =
        (  '��� ���������'
          ,'��� ������'
          ,'�����'
          ,'��� � ��'
          ,'ϳ��������'
          ,'������ ������'
          ,'����'
          ,'P ��, ���'
          ,'P �������'
          ,'������ ��''����'
          ,'��������� � ���.'
          ,'���� �������� ��� ���������'
          ,'�� �'
          ,'���� ��'
          ,'�������� �� �'
          ,'���� �������� ��� �������� ��'
          ,'������ �'
          ,'���������'
          ,'�������� ����'
          ,'U ��, �'
          ,'U �������'
          ,'�������������'
          ,'����������'
          ,'������ �� �������������'
          ,'���� �����'
          ,'��������� ��'
        );

  ENFiderGuageHeaders: array [1..12] of String =
        ( '���'
          ,'���� � ����� ������'
          ,'�������������'
          ,'����� ������ ������'
          ,'�������������'
          ,'I ����� ����, �'
          ,'I ������ ����, �'
          ,'I ������� ����, �'
          ,'U ����� ����, ��'
          ,'U ������ ����, ��'
          ,'U ������� ����, ��'
          ,'��� ����������, �������������� ������'
        );

  ENActHeaders: array [1..11] of String =
        ( '���'
          ,'����� ����'
          ,'���� ���������� ����'
          ,'���� ����'
          ,'��� ��� / ϲ� � Գ�. ���.'
          ,'���'
          ,'ϳ���� ���� �����'
          ,'������-������'
          ,'������'
          ,'��������� ���� ����������'
          ,'���� ������� ���'
        );

  ENPlanWorkHeaders: array [1..18] of String =
        ( '���'
          ,'��''��� ����������'
          ,'���. �'
          ,'��� �� ��'
          ,'г� �����'
          ,'̳���� �����'
          ,'���� ������� ����'
          //,'������. ����� �� �� ����� (�� �����������)'
          //,'������. ����� �����'
          ,'ϳ���� ����'
          ,'��� ����'
          ,'��� �����'
          ,'������'
          ,'ϳ������'
          ,'�������������'
          ,'����� �������������'
          ,'������. ����� �� �� ����� (�� �����������)'
          //,'���� ��������� �����'
          ,'����� ������'
          ,'����������, �� ��� ����'
          ,'���� �������� ����'
        );

  ENLine04Headers: array [1..8] of String =
        ( '���'
          ,'����������� �����'
          ,'������������ �� 0.4'
          ,'������������� ������������ �� 0.4'
          ,'��������� ������� ��, ��'
          ,'г� ����������'
          ,'г� �������� � ������'
          ,'���� ���������� ���. �������'
        );

  ENTransformerHeaders: array [1..10] of String =
        ( '���'
          ,'��� ��-��'
          ,'�����'
          ,'P, ���'
          ,'���. �����'
          ,'��. ����.'
          ,'U, � �� (���.)'
          ,'U, � �� (���.)'
          ,'�, � �� (���.)'
          ,'�, � �� (���.)'
        );

  ENHighVoltageSellHeaders: array [1..6] of String =
        ( '���'
          ,'���'
          ,'������������'
          ,'�����'
          ,'�������������'
          ,'��� ��������������'
        );

  ENDisconnectorHeaders: array [1..5] of String =
        ( '���'
          ,'���''�������'
          ,'������� ���., ��'
          ,'����� ���., �'
          ,'� �����'
        );
  ENLoadSwitchHeaders: array [1..5] of String =
        ( '���'
          ,'������� ������������'
          ,'������� ���., ��'
          ,'����� ���., �'
          ,'� �����'
        );
  ENFuseHeaders: array [1..4] of String =
        ( '���'
          ,'���������'
          ,'����� ������ �������'
          ,'� �����'
        );
  ENInsulatorHeaders: array [1..4] of String =
        ( '���'
          ,'��������'
          ,'�������, ��'
          ,'� �����'
          //,'ʳ������ ���������'
        );
  ENArresterHeaders: array [1..4] of String =
        ( '���'
          ,'���������'
          ,'̳��� ������������'
          ,'� �����'
        );
  ENCurrentTransformerHeaders: array [1..6] of String =
        ( '���'
          ,'������������� ����'
          ,'���� �������'
          ,'����. �������������'
          ,'��������� �������, ��.'
          ,'� �����'
          //,'ʳ������, ��.'
        );
  ENBusHeaders: array [1..7] of String =
        ( '���'
          ,'����� ����'
          ,'������������ ���������'
          ,'���������, ��.'
          ,'������� ����, �'
          ,'����� ��������� ����'
          ,'� �����'
        );

  ENMeasurDeviceHeaders: array [1..4] of String =
        ( '���'
          ,'������������� ������'
          ,'���������� �'
          ,'� �����'
        );
  ENPanelHeaders: array [1..7] of String =
        ( '���'
          ,'����������'
          ,'����� ������� ���'
          ,'��������� �� ������'
          ,'� ������'
          ,'�������������'
          ,'��� ��������������'
        );
  ENContactBreakerHeaders: array [1..6] of String =
        ( '���'
          ,'���������'
          ,'��� ���., �'
          ,'� ������'
          ,'� �������������'
          ,'��� �������������'
        );
  ENContactBreakerMainTireHeaders: array [1..6] of String =
        ( '���'
          ,'���������'
          ,'����������� ���, �'
          ,'������������'
          ,'�������������'
          ,'��� ��������������'
        );

  ENFuseLVBHeaders: array [1..6] of String =
        ( '���'
          ,'��������������'
          ,'��� ������� �������, �'
          ,'� ������'
          ,'� �������������'
          ,'��� �������������'
        );
  ENFuseLVBMainTireHeaders: array [1..6] of String =
        ( '���'
          ,'��������������'
          ,'��� ������� �������'
          ,'������������'
          ,'�������������'
          ,'��� ��������������'
        );

  ENAutomatHeaders: array [1..7] of String =
        ( '���'
          ,'�������������� �����������'
          ,'��� �������'
          ,'��� ��������� �����������'
          ,'� ������'
          ,'� �������������'
          ,'��� �������������'
        );
  ENAutomatMainTireHeaders: array [1..7] of String =
        ( '���'
          ,'�������������� �����������'
          ,'��� �������'
          ,'��� ��������� �����������'
          ,'������������'
          ,'�������������'
          ,'��� ��������������'
        );

  ENMeasurDeviceLVBHeaders: array [1..7] of String =
        ( '���'
          ,'������������� ������'
          ,'��������� �'
          ,'�����'
          ,'� ������'
          ,'� �������������'
          ,'��� �������������'
        );
  ENMeasurDeviceLVBMainTireHeaders: array [1..7] of String =
        ( '���'
          ,'������������� ������'
          ,'��������� �'
          ,'�����'
          ,'������������'
          ,'�������������'
          ,'��� ��������������'
        );
  ENBranchHeaders: array [1..6] of String =
        ( '���'
          ,'�������� �����'
          ,'�������� �����������'
          ,'��������� ������������'
          ,'� ������'
          ,'� �������������'
        );

  ENLine10Headers: array [1..6] of String =
        ( '���'
          ,'�������� ��� 6-10 ��'
          ,'����������� �'
          ,'������� ���������, ��'
          ,'������� ���������, ��'
          ,'� �����'
        );

  ENLineCableSuppliesHeaders: array [1..6] of String =
        ( '���'
          ,'�������� ���'
          ,'����������� �'
          ,'������� ���������, ��'
          ,'������� ���������, ��'
          ,'� �����'
        );

  ENLowVoltBoardHeaders: array [1..4] of String =
        ( '���'
          ,'������������ ���'
          ,'�������������'
          ,'��� ��������������'
        );

  ENAgreeJointHeaders: array [1..7] of String =
        ( '���'
          ,'����������� �����'
          ,'����� �������� ���'
          ,'���� ���������� �������� ���'
          ,'������ ���������� ��������������'
          ,'�� ���'
          ,'�� ���'
        );

  ENInspectionSheetHeaders: array [1..7] of String =
        ( '���'
          ,'�����'
          ,'��� ������'
          ,'������'
          ,'���� ���������'
          ,'���������� ���� ����� �����'
          ,'���� ���. ����'
        );

  ENDocAttachmentHeaders: array [1..7] of String =
       ( '���'
         ,'�������� �� ���������'
         ,'��������� �� ����'
         ,'����������, �� ����� ���������'
         ,'���� ���������'
         ,'����������, �� ����� ���������'
         ,'���� ����'
       );



procedure TfrmENSubstation04Edit.FormShow(Sender: TObject);
var
  Line10Filter: ENLine10Filter;
  Line10List: ENLine10ShortList;
  TempENLine10: ENLine10ControllerSoapPort;
  TempENOwner: ENOwnerControllerSoapPort;
  TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
  ENGeographicDepartmentObj : ENGeographicDepartment;
begin
  {
  pcSubstation04.Height := //������������ ������� ����������� �����
    grpHighVoltageEquipment.Top + grpHighVoltageEquipment.Height + 50;
  BtnPasspSubSt04.Top := pcSubstation04.Top + pcSubstation04.Height + 20;
  btnPricconectionData.Top := BtnPasspSubSt04.Top;
  pnlReserv.Top := BtnPasspSubSt04.Top;

  btnFiderGauge.Top := BtnPasspSubSt04.Top + BtnPasspSubSt04.Height + 10;
  btnS04Reserv.Top :=
    btnPricconectionData.Top + btnPricconectionData.Height + 10;
  frmENSubstation04Edit.Height := Max(btnS04Reserv.Top + btnS04Reserv.Height,
    pnlReserv.Top + pnlReserv.Height) + 20;
  }

  DisableActions([actSendToSigning, actUnSigning, actSigned, actUnSigned]);

  FormatSettings.DecimalSeparator := '.';
  disableControlsTypePW := dtOther;

  tsFiderGuage.TabVisible := //��������� ������� ������ ���������� ��������
    (HTTPRIOENSubstation04.HTTPWebNode.UserName = 'energynet')
    or (HTTPRIOENSubstation04.HTTPWebNode.UserName = 'promadmin');

  //��������� ������������� �����
  pnlLowVoltBoard.Visible := False; //tsFiderGuage.TabVisible;
  lblLowVoltBoard.Visible := pnlLowVoltBoard.Visible;
  if pnlLowVoltBoard.Visible then
    pnlBoardPanel.Height := 310
  else
    pnlBoardPanel.Height := 370;
  DisableControls([chbLowVoltBoard], not pnlLowVoltBoard.Visible);
  chbLowVoltBoard.Top := pnlBoardPanel.Top + pnlBoardPanel.Height + 10;

  //��������� �������
  tbEquipTransformer.Caption := '�������� ������';
  //������ ������ � ������������� �������������� �����
  tbEditDisconnector.Visible := False;
  tbEquipDisconnector.Caption := '�������� ������';
  tbEquipDisconnector.Top := 2;
  tbUpdateDisconnector.Left :=
    tbEquipDisconnector.Left + tbEquipDisconnector.Width;
  tbEditLoadSwitch.Visible := False;
  tbEquipLoadSwitch.Caption := '�������� ������';
  tbEquipLoadSwitch.Top := tbEquipDisconnector.Top;
  tbUpdateLoadSwitch.Left := tbEquipLoadSwitch.Left + tbEquipLoadSwitch.Width;
  tbEditFuse.Visible := False;
  tbEquipFuse.Caption := '�������� ������';
  tbEquipFuse.Top := tbEquipDisconnector.Top;
  tbUpdateFuse.Left := tbEquipFuse.Left + tbEquipFuse.Width;
  tbEditInsulator.Visible := False;
  tbEquipInsulator.Caption := '�������� ������';
  tbEquipInsulator.Top := tbEquipDisconnector.Top;
  tbUpdateInsulator.Left := tbEquipInsulator.Left + tbEquipInsulator.Width;
  tbEditArrester.Visible := False;
  tbEquipArrester.Caption := '�������� ������';
  tbEquipArrester.Top := tbEquipDisconnector.Top;
  tbUpdateArrester.Left := tbEquipArrester.Left + tbEquipArrester.Width;
  tbEditCurrentTransformer.Visible := False;
  tbEquipCurrentTransformer.Caption := '�������� ������';
  tbEquipCurrentTransformer.Top := tbEquipDisconnector.Top;
  tbUpdateCurrentTransformer.Left :=
    tbEquipCurrentTransformer.Left + tbEquipCurrentTransformer.Width;
  tbEditBus.Visible := False;
  tbEquipBus.Caption := '�������� ������';
  tbEquipBus.Top := tbEquipDisconnector.Top;
  tbUpdateBus.Left := tbEquipBus.Left + tbEquipBus.Width;
  tbEditMeasurDevice.Visible := False;
  tbEquipMeasurDevice.Caption := '�������� ������';
  tbEquipMeasurDevice.Top := tbEquipDisconnector.Top;
  tbUpdateMeasurDevice.Left :=
    tbEquipMeasurDevice.Left + tbEquipMeasurDevice.Width;
  //������ ������ � ������������� �������������� ����
  tbEditContactBreaker.Visible := False;
  tbEquipContactBreaker.Caption := '�������� ������';
  tbEquipContactBreaker.Top := 2;
  tbUpdateContactBreaker.Left :=
    tbEquipContactBreaker.Left + tbEquipContactBreaker.Width;
  
  tbEditFuseLVB.Visible := False;
  tbEquipFuseLVB.Caption := '�������� ������';
  tbEquipFuseLVB.Top := tbEquipContactBreaker.Top;
  tbUpdateFuseLVB.Left := tbEquipFuseLVB.Left + tbEquipFuseLVB.Width;
  tbEditAutomat.Visible := False;
  tbEquipAutomat.Caption := '�������� ������';
  tbEquipAutomat.Top := tbEquipContactBreaker.Top;
  tbUpdateAutomat.Left := tbEquipAutomat.Left + tbEquipAutomat.Width;
  tbEditMeasurDeviceLVB.Visible := False;
  tbEquipMeasurDeviceLVB.Caption := '�������� ������';
  tbEquipMeasurDeviceLVB.Top := tbEquipContactBreaker.Top;
  tbUpdateMeasurDeviceLVB.Left :=
    tbEquipMeasurDeviceLVB.Left + tbEquipMeasurDeviceLVB.Width;

  sgENBranch.ColWidths[4] := 0;
  S04Activ := False;

  DisableControls([edtBuhName, memTkMaterialsLock, edtENFencing,
    edtSumPowerInfluence, edtOwner , edtGeograph ]);
  SetIntStyle([edtChambersQuantity]);
  SetFloatStyle([edtNominalPower, edtPaintSquare]);
  DisableControls([edtEPWorkerName, edtENSubstationTypeName, edtENLine10Name,
    edtEPRenName, edtNominalPower]);
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
    DenyBlankValues([edtName, edtChambersQuantity, edtEPWorkerName,
      edtEPRenName, edtENSubstationTypeName, edtPaintSquare]);

  if (DialogState = dsInsert) then
    begin
      tsLowVoltageBoard.TabVisible := False;
      tsTransformers.TabVisible := False;
      tsHighVoltageParty.TabVisible := False;
      tsLowVoltageBoard.TabVisible := False;
      btnFiderGauge.Visible := False;
    end;

   pcSubstation04.ActivePage := tsSubstation04;

   frmENSubstation04Edit.Width := 996;
   pcSubstation04.Width := 990;
   btnCancel.Left := frmENSubstation04Edit.Width - btnCancel.Width - 25;
   btnOk.Left := btnCancel.Left - btnOk.Width - 10;
   DisableControls([memCNPack, memSPL_PP_Pack]);

   pcHighVoltageParty.ActivePage := tsDisconnector;
   pcBoardEquipment.ActivePage := tsContactBreakerLVB;

  if (DialogState = dsView) then
    begin
      DisableControls([spbEPWorker, spbENSubstationType, spbEPRen, spbOSSelect,
        rbInspect2, rbInspect4, spbOwner , btnGeograph , btnGeographClear ]);
      DisableActions([actInsert, actEdit, actDelete,
        actLineConnectSubstation04, actLineDisconnectSubstation04,
        actInsertEquipment, actDeleteEquipment, actEditEquipment,
        actInsertBranch, actDeleteBranch, actEditBranch, actPasspSubSt_6_10_04,
        actChangeTransformer, actUninstallTransformer, actInstallTransformer,
        actChangeDisconnector, actUninstallDisconnector, actInstallDisconnector,
        actChangeLoadSwitch, actUninstallLoadSwitch, actInstallLoadSwitch,
        actChangeFuse, actUninstallFuse, actInstallFuse,
        actChangeInsulator, actUninstallInsulator, actInstallInsulator,
        actChangeArrester, actUninstallArrester, actInstallArrester,
        actChangeCurrentTransformer, actUninstallCurrentTransformer,
          actInstallCurrentTransformer,
        actChangeBus, actUninstallBus, actInstallBus,
        actChangeMeasurDevice, actUninstallMeasurDevice, actInstallMeasurDevice,
        actChangeContactBreaker, actUninstallContactBreaker,
          actInstallContactBreaker,
        actChangeFuseLVB, actUninstallFuseLVB, actInstallFuseLVB,
        actChangeAutomat, actUninstallAutomat, actInstallAutomat,
        actChangeMeasurDeviceLVB, actUninstallMeasurDeviceLVB,
          actInstallMeasurDeviceLVB,
        actInsertAgreeJoint, actEditAgreeJoint, actDeleteAgreeJoint]);
    end;

   if  (DialogState = dsInsert) then
     edtLastRepairDate.Checked := false;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    DisableControls([spbEPRen, edtEPRenName]);

    edtName.Text := ENSubstation04Obj.name;
    if ENSubstation04Obj.element.geoDepartmentRef <> nil then
      if ENSubstation04Obj.element.geoDepartmentRef.code <> LOW_INT then
       begin
          // geodept
            TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
          try
            ENGeographicDepartmentObj := TempENGeographicDepartment.getObject( ENSubstation04Obj.element.geoDepartmentRef.code );
            edtGeograph.Text := ENGeographicDepartmentObj.name;
          except
            on EConvertError do Exit;
          end;
       end;
    if (ENSubstation04Obj.paintSquare <> nil) then
      edtPaintSquare.Text := ENSubstation04Obj.paintSquare.decimalString
    else
      edtPaintSquare.Text := '';


    edtBuhName.Text := ENSubstation04Obj.buhName;
    edtInvNumber.Text := ENSubstation04Obj.invNumber;

      if ENSubstation04Obj.lastRepairDate <> nil then
      begin
        edtLastRepairDate.DateTime := EncodeDate(
          ENSubstation04Obj.lastRepairDate.Year,
          ENSubstation04Obj.lastRepairDate.Month,
          ENSubstation04Obj.lastRepairDate.Day);
        edtLastRepairDate.checked := true;
      end
      else
      begin
        edtLastRepairDate.DateTime:=SysUtils.Date;
        edtLastRepairDate.checked := false;
      end;


    if ( ENSubstation04Obj.nominalPower <> nil ) then
       edtNominalPower.Text := ENSubstation04Obj.nominalPower.decimalString
    else
       edtNominalPower.Text := '';

    if (ENSubstation04Obj.sizCode <> low(Integer)) then
       edtSizCode.Text := IntToStr(ENSubstation04Obj.sizCode)
    else
       edtSizCode.Text := '';
    memAddress.Text := ENSubstation04Obj.address;
    if ( ENSubstation04Obj.yearBuild <> Low(Integer) ) then
       edtYearBuild.Text := IntToStr(ENSubstation04Obj.yearBuild)
    else
       edtYearBuild.Text := '';
    if ( ENSubstation04Obj.yearWorkingStart <> Low(Integer) ) then
       edtYearWorkingStart.Text := IntToStr(ENSubstation04Obj.yearWorkingStart)
    else
       edtYearWorkingStart.Text := '';
    edtNameProject.Text := ENSubstation04Obj.nameProject;
    edtNameBuilder.Text := ENSubstation04Obj.nameBuilder;
    if ( ENSubstation04Obj.chambersQuantity <> Low(Integer) ) then
       edtChambersQuantity.Text := IntToStr(ENSubstation04Obj.chambersQuantity)
    else
       edtChambersQuantity.Text := '';
    edtAdditionalData.Text := ENSubstation04Obj.additionalData;
    //edtEPWorkerName.Text := ENSubstation04Obj.worker.surname;
    //edtENElementName.Text := ENSubstation04Obj.elementRef.name;

    edtENSubstationTypeName.Text := ENSubstation04Obj.substationType.name;

    if ENSubstation04Obj.ownerRef <> nil then
      if ENSubstation04Obj.ownerRef.code <> Low(Integer) then
      begin
      TempENOwner := HTTPRIOENOwner as ENOwnerControllerSoapPort;
      edtOwner.Text := TempENOwner.getObject(ENSubstation04Obj.ownerRef.code).name;
      end
      else
      edtOwner.Text := ''
    else
     edtOwner.Text := '';

    if ENSubstation04Obj.belongingRef <> nil then
    begin
      cbBelongingType.ItemIndex := ENSubstation04Obj.belongingRef.code;
    end;

    if ENSubstation04Obj.element <> nil then
       if  ENSubstation04Obj.element.renRef <> nil then
           edtEPRenName.Text := ENSubstation04Obj.element.renRef.name
       else
           edtEPRenName.Text := ''
    else
       edtEPRenName.Text := '';

    if ENSubstation04Obj.element.finExecutor <> nil then
      if ENSubstation04Obj.element.finExecutor.code > LOW_INT then
       begin
         edtFINExecutorName.Text := ENSubstation04Obj.element.finExecutor.name;
       end;

    if ENSubstation04Obj.periodInspect <> null then
    begin
      if      ENSubstation04Obj.periodInspect = ENSUBSTATION04_PERIODINSPECT_2 then
         rbInspect2.Checked := True
      else if ENSubstation04Obj.periodInspect = ENSUBSTATION04_PERIODINSPECT_4 then
         rbInspect4.Checked := True
    end;

    recalcTransformers();        //�������� ���������� ���������������
    recalcHighVoltCells();       //�������� ���������� �������������� �����
    recalcDisconnectors();       //�������� ���������� ��������������
    recalcLoadSwitches();        //�������� ���������� ������������ ��������
    recalcFuses();               //�������� ���������� ��������������� �� �������������� �������
    recalcInsulators();          //�������� ���������� ����������
    recalcArresters();           //�������� ���������� �����������
    recalcCurrentTransformers(); //�������� ���������� ��������������� ����
    recalcBuses();               //�������� ���������� ���
    recalcMeasurDevices();       //�������� ���������� ������������� ��������
    recalcLines10();             //�������� ���������� ��������� ����� 6 - 10 �� ������� ����������
    recalcLinesCable();          //�������� ���������� ��������� ����� ������� ����������
    recalcPanels();              //�������� ���������� ������� �� ������������� ����
    recalcBranches(EditENBranch.btLine04);    //�������� ���������� ��������� ��������� ����� 0,4 ��
    recalcBranches(EditENBranch.btLineCable); //�������� ���������� ��������� ������������� ��������� �����
    recalcContactBreakers();     //�������� ���������� �����������
    recalcFusesLVB();            //�������� ���������� ��������������� �� ������������� �������
    recalcAutomates();           //�������� ���������� �������������� ������������
    recalcMeasurDevicesLVB();    //�������� ���������� ������������� ��������

    if ENSubstation04Obj.element.elementInRef.code > Low(Integer) then
      begin
         Line10Filter := ENLine10Filter.Create;
         try
           SetNullIntProps(Line10Filter);
           SetNullXSProps(Line10Filter);
           Line10Filter.element := ENElement.Create;
           Line10Filter.element.code := ENSubstation04Obj.element.elementInRef.code;

           TempENLine10 := HTTPRIOENLine10 as ENLine10ControllerSoapPort;
           Line10List := TempENLine10.getScrollableFilteredList(Line10Filter,0,-1);
           if Line10List.totalCount > 0 then
           begin
               edtENLine10Name.Text := Line10List.list[0].name;
               DisableControls([edtENLine10Name]);
           end;
         finally
           Line10Filter.Free;
         end;
      end
    else
       edtENLine10Name.Text := '';
  end;
end;

procedure TfrmENSubstation04Edit.recalcTransformers();
var
  TempENTransformer: ENTransformerControllerSoapPort;
  ENTransformerListObj: ENTransformerShortList;
  ENTransformerFilterObj : ENTransformerFilter;
  n : integer;
  powerSum : real;
begin
  // ��������� ���-�� ��������������� � �� ��������
  ENTransformerFilterObj := ENTransformerFilter.Create;
  try
    SetNullIntProps(ENTransformerFilterObj);
    SetNullXSProps(ENTransformerFilterObj);

    ENTransformerFilterObj.substation04Ref := ENSubstation04Ref.Create;
    // ����� �� ������� � �� �������� ������� ...
    //ENTranfromerFilterObj.element := ENElement.Create;
    ENTransformerFilterObj.substation04Ref.code := ENSubstation04Obj.code;
    TempENTransformer :=  HTTPRIOENTransformer as ENTransformerControllerSoapPort;

    ENTransformerListObj := TempENTransformer.getScrollableFilteredList(ENTransformerFilterObj,0,-1);

    lblTRCount.Caption := IntToStr(ENTransformerListObj.totalCount);

    powerSum := 0;
    for n:=0 to ENTransformerListObj.totalCount-1 do
      powerSum := powerSum + StrToFloat((ENTransformerListObj.list[n].nominalPower.DecimalString));
    edtNominalPower.Text := FloatToStr(powerSum);
  finally
    ENTransformerFilterObj.Free;
  end;
end;

procedure TfrmENSubstation04Edit.recalcHighVoltCells();
var //������ ���������� �������������� �����
  TempENHighVoltageSell: ENHighVoltageSellControllerSoapPort;
  ENHighVoltageSellListObj: ENHighVoltageSellShortList;
  ENHighVoltageSellFilterObj: ENHighVoltageSellFilter;
begin
  TempENHighVoltageSell :=
    HTTPRIOENHighVoltageSell as ENHighVoltageSellControllerSoapPort;
  try
    ENHighVoltageSellFilterObj := ENHighVoltageSellFilter.Create;

    SetNullIntProps(ENHighVoltageSellFilterObj);
    SetNullXSProps(ENHighVoltageSellFilterObj);

    ENHighVoltageSellFilterObj.conditionSQL := 'ENELEMENT.ELEMENTINREFCODE = ' +
      IntToStr(ENSubstation04Obj.element.code);

    ENHighVoltageSellListObj :=
      TempENHighVoltageSell.getScrollableFilteredList(
        ENHighVoltageSellFilterObj, 0, -1);

    lblHighVoltCellCnt.Caption := IntToStr(ENHighVoltageSellListObj.totalCount);
  finally
    ENHighVoltageSellFilterObj.Free;
    ENHighVoltageSellListObj.Free;
  end;
end;

procedure TfrmENSubstation04Edit.recalcDisconnectors();
var //������ ���������� ��������������
  TempENDisconnector: ENDisconnectorControllerSoapPort;
  ENDisconnectorListObj: ENDisconnectorShortList;
  ENDisconnectorFilterObj: ENDisconnectorFilter;
begin
  TempENDisconnector :=
    HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;
  try
    ENDisconnectorFilterObj := ENDisconnectorFilter.Create;

    SetNullIntProps(ENDisconnectorFilterObj);
    SetNullXSProps(ENDisconnectorFilterObj);

    ENDisconnectorFilterObj.conditionSQL := 'ENELEMENT.ELEMENTINREFCODE = '
      + IntToStr(ENSubstation04Obj.element.code)
      + ' AND COALESCE(ENHIGHVOLTAGESELL.CODE, 0) <> 0';

    ENDisconnectorListObj :=
      TempENDisconnector.getScrollableFilteredList(
        ENDisconnectorFilterObj, 0, -1);

    lblDisconnectorCnt.Caption := IntToStr(ENDisconnectorListObj.totalCount);
  finally
    ENDisconnectorFilterObj.Free;
    ENDisconnectorListObj.Free;
  end;
end;

procedure TfrmENSubstation04Edit.recalcLoadSwitches();
var //������ ���������� ������������ ��������
  TempENLoadSwitch: ENLoadSwitchControllerSoapPort;
  ENLoadSwitchListObj: ENLoadSwitchShortList;
  ENLoadSwitchFilterObj: ENLoadSwitchFilter;
begin
  TempENLoadSwitch :=
    HTTPRIOENLoadSwitch as ENLoadSwitchControllerSoapPort;
  try
    ENLoadSwitchFilterObj := ENLoadSwitchFilter.Create;

    SetNullIntProps(ENLoadSwitchFilterObj);
    SetNullXSProps(ENLoadSwitchFilterObj);

    ENLoadSwitchFilterObj.conditionSQL := 'ENELEMENT.ELEMENTINREFCODE = '
      + IntToStr(ENSubstation04Obj.element.code)
      + ' AND COALESCE(ENHIGHVOLTAGESELL.CODE, 0) <> 0';

    ENLoadSwitchListObj :=
      TempENLoadSwitch.getScrollableFilteredList(
        ENLoadSwitchFilterObj, 0, -1);

    lblLoadSwitchCnt.Caption := IntToStr(ENLoadSwitchListObj.totalCount);
  finally
    ENLoadSwitchFilterObj.Free;
    ENLoadSwitchListObj.Free;
  end;
end;

procedure TfrmENSubstation04Edit.recalcFuses();
var //������ ���������� ���������������
  TempENFuse: ENFuseControllerSoapPort;
  ENFuseListObj: ENFuseShortList;
  ENFuseFilterObj: ENFuseFilter;
begin
  TempENFuse :=
    HTTPRIOENFuse as ENFuseControllerSoapPort;
  try
    ENFuseFilterObj := ENFuseFilter.Create;

    SetNullIntProps(ENFuseFilterObj);
    SetNullXSProps(ENFuseFilterObj);

    ENFuseFilterObj.conditionSQL := 'ENELEMENT.ELEMENTINREFCODE = '
      + IntToStr(ENSubstation04Obj.element.code)
      + ' AND COALESCE(ENHIGHVOLTAGESELL.CODE, 0) <> 0';

    ENFuseListObj :=
      TempENFuse.getScrollableFilteredList(
        ENFuseFilterObj, 0, -1);

    lblFuseCnt.Caption := IntToStr(ENFuseListObj.totalCount);
  finally
    ENFuseFilterObj.Free;
    ENFuseListObj.Free;
  end;
end;

procedure TfrmENSubstation04Edit.recalcInsulators();
var //������ ���������� ����������
  TempENInsulator: ENInsulatorControllerSoapPort;
  ENInsulatorListObj: ENInsulatorShortList;
  ENInsulatorFilterObj: ENInsulatorFilter;
begin
  TempENInsulator :=
    HTTPRIOENInsulator as ENInsulatorControllerSoapPort;
  try
    ENInsulatorFilterObj := ENInsulatorFilter.Create;

    SetNullIntProps(ENInsulatorFilterObj);
    SetNullXSProps(ENInsulatorFilterObj);

    ENInsulatorFilterObj.conditionSQL :=
      'ENELEMENT.ELEMENTINREFCODE = '
      + IntToStr(ENSubstation04Obj.element.code)
      + ' AND COALESCE(ENHIGHVOLTAGESELL.CODE, 0) <> 0';

    ENInsulatorListObj :=
      TempENInsulator.getScrollableFilteredList(
        ENInsulatorFilterObj, 0, -1);

    lblInsulatorCnt.Caption := IntToStr(ENInsulatorListObj.totalCount);
  finally
    ENInsulatorFilterObj.Free;
    ENInsulatorListObj.Free;
  end;
end;

procedure TfrmENSubstation04Edit.recalcArresters();
var //������ ���������� �����������
  TempENArrester: ENArresterControllerSoapPort;
  ENArresterListObj: ENArresterShortList;
  ENArresterFilterObj: ENArresterFilter;
begin
  TempENArrester :=
    HTTPRIOENArrester as ENArresterControllerSoapPort;
  try
    ENArresterFilterObj := ENArresterFilter.Create;

    SetNullIntProps(ENArresterFilterObj);
    SetNullXSProps(ENArresterFilterObj);

    ENArresterFilterObj.conditionSQL :=
      'ENELEMENT.ELEMENTINREFCODE = '
      + IntToStr(ENSubstation04Obj.element.code)
      + ' AND COALESCE(ENHIGHVOLTAGESELL.CODE, 0) <> 0';

    ENArresterListObj :=
      TempENArrester.getScrollableFilteredList(
        ENArresterFilterObj, 0, -1);

    lblArresterCnt.Caption := IntToStr(ENArresterListObj.totalCount);
  finally
    ENArresterFilterObj.Free;
    ENArresterListObj.Free;
  end;
end;

procedure TfrmENSubstation04Edit.recalcCurrentTransformers();
var //������ ���������� ��������������� ����
  TempENCurrentTransformer: ENCurrentTransformerControllerSoapPort;
  ENCurrentTransformerListObj: ENCurrentTransformerShortList;
  ENCurrentTransformerFilterObj: ENCurrentTransformerFilter;
begin
  TempENCurrentTransformer :=
    HTTPRIOENCurrentTransformer as ENCurrentTransformerControllerSoapPort;
  try
    ENCurrentTransformerFilterObj := ENCurrentTransformerFilter.Create;

    SetNullIntProps(ENCurrentTransformerFilterObj);
    SetNullXSProps(ENCurrentTransformerFilterObj);

    ENCurrentTransformerFilterObj.conditionSQL :=
      'ENELEMENT.ELEMENTINREFCODE = '
      + IntToStr(ENSubstation04Obj.element.code)
      + ' AND COALESCE(ENHIGHVOLTAGESELL.CODE, 0) <> 0';

    ENCurrentTransformerListObj :=
      TempENCurrentTransformer.getScrollableFilteredList(
        ENCurrentTransformerFilterObj, 0, -1);

    lblCurrentTRCnt.Caption := IntToStr(ENCurrentTransformerListObj.totalCount);
  finally
    ENCurrentTransformerFilterObj.Free;
    ENCurrentTransformerListObj.Free;
  end;
end;

procedure TfrmENSubstation04Edit.recalcBuses();
var //������ ���������� ���
  TempENBus: ENBusControllerSoapPort;
  ENBusListObj: ENBusShortList;
  ENBusFilterObj: ENBusFilter;
begin
  TempENBus :=
    HTTPRIOENBus as ENBusControllerSoapPort;
  try
    ENBusFilterObj := ENBusFilter.Create;

    SetNullIntProps(ENBusFilterObj);
    SetNullXSProps(ENBusFilterObj);

    ENBusFilterObj.conditionSQL := 'ENELEMENT.ELEMENTINREFCODE = '
      + IntToStr(ENSubstation04Obj.element.code)
      + ' AND COALESCE(ENHIGHVOLTAGESELL.CODE, 0) <> 0';

    ENBusListObj :=
      TempENBus.getScrollableFilteredList(
        ENBusFilterObj, 0, -1);

    lblBusCnt.Caption := IntToStr(ENBusListObj.totalCount);
  finally
    ENBusFilterObj.Free;
    ENBusListObj.Free;
  end;
end;

procedure TfrmENSubstation04Edit.recalcMeasurDevices();
var //������ ���������� ���
  TempENMeasurDevice: ENMeasurDeviceControllerSoapPort;
  ENMeasurDeviceListObj: ENMeasurDeviceShortList;
  ENMeasurDeviceFilterObj: ENMeasurDeviceFilter;
begin
  TempENMeasurDevice :=
    HTTPRIOENMeasurDevice as ENMeasurDeviceControllerSoapPort;
  try
    ENMeasurDeviceFilterObj := ENMeasurDeviceFilter.Create;
    SetNullIntProps(ENMeasurDeviceFilterObj);
    SetNullXSProps(ENMeasurDeviceFilterObj);
    ENMeasurDeviceFilterObj.conditionSQL := 'ENELEMENT.ELEMENTINREFCODE = '
      + IntToStr(ENSubstation04Obj.element.code)
      + ' AND COALESCE(ENHIGHVOLTAGESELL.CODE, 0) <> 0';
    ENMeasurDeviceListObj :=
      TempENMeasurDevice.getScrollableFilteredList(
        ENMeasurDeviceFilterObj, 0, -1);
    lblMeasurDeviceCnt.Caption := IntToStr(ENMeasurDeviceListObj.totalCount);
  finally
    ENMeasurDeviceFilterObj.Free;
    ENMeasurDeviceListObj.Free;
  end;
end;

procedure TfrmENSubstation04Edit.recalcLines10();
var //������ ���������� ��������� ����� 6-10 �� ������� ���������� 6-10/0.4 ��
  (*TempENLine10: ENLine10ControllerSoapPort;
  ENLine10ListObj: ENLine10ShortList;
  ENLine10FilterObj: ENLine10Filter;*)
  TempENHighVoltCellSupplies: ENHighVoltCellSuppliesControllerSoapPort;
  hvcsListObj: ENHighVoltCellSuppliesShortList;
  hvcsFilterObj: ENHighVoltCellSuppliesFilter;
begin
  (*TempENLine10 :=
    HTTPRIOENLine10 as ENLine10ControllerSoapPort;
  try
    ENLine10FilterObj := ENLine10Filter.Create;
    SetNullIntProps(ENLine10FilterObj);
    SetNullXSProps(ENLine10FilterObj);
    ENLine10FilterObj.conditionSQL := 'ENELEMENT.ELEMENTINREFCODE = '
      + IntToStr(ENSubstation04Obj.element.code)
      + ' AND COALESCE(ENHIGHVOLTAGESELL.CODE, 0) <> 0';
    ENLine10ListObj :=
      TempENLine10.getScrollableFilteredList(
        ENLine10FilterObj, 0, -1);
    lblLine10Cnt.Caption := IntToStr(ENLine10ListObj.totalCount);
  finally
    ENLine10FilterObj.Free;
    ENLine10ListObj.Free;
  end;*)
  TempENHighVoltCellSupplies := HTTPRIOENHighVoltCellSupplies
    as ENHighVoltCellSuppliesControllerSoapPort;
  hvcsFilterObj := ENHighVoltCellSuppliesFilter.Create;
  try
    SetNullIntProps(hvcsFilterObj);
    SetNullXSProps(hvcsFilterObj);
    hvcsFilterObj.conditionSQL := ' ENSUBSTATION04.CODE = ' +
      IntToStr(ENSubstation04Obj.code) +
      ' AND COALESCE(ENLINE10.CODE, 0) <> 0';
    hvcsListObj :=
      TempENHighVoltCellSupplies.getScrollableFilteredList(
        hvcsFilterObj, 0, 100);
    try
      lblLine10Cnt.Caption := IntToStr(hvcsListObj.totalCount);
    finally
      hvcsListObj.Free;
      hvcsListObj := Nil;
    end; //try
  finally
    hvcsFilterObj.Free;
    hvcsFilterObj := Nil;
  end; //try
end;

function TfrmENSubstation04Edit.recalcLines10HVS(hvsCode: String): Integer;
var //�������� ���������� ��������� ����� 6-10 �� �� �������������� ������
  (*TempENLine10: ENLine10ControllerSoapPort;
  ENLine10ListObj: ENLine10ShortList;
  ENLine10FilterObj: ENLine10Filter;*)
  TempENHighVoltCellSupplies: ENHighVoltCellSuppliesControllerSoapPort;
  hvcsListObj: ENHighVoltCellSuppliesShortList;
  hvcsFilterObj: ENHighVoltCellSuppliesFilter;
begin
  if Length(hvsCode) = 0 then
    begin
      Result := 0;
      Exit;
    end;
  (*TempENLine10 :=
    HTTPRIOENLine10 as ENLine10ControllerSoapPort;
  try
    ENLine10FilterObj := ENLine10Filter.Create;
    SetNullIntProps(ENLine10FilterObj);
    SetNullXSProps(ENLine10FilterObj);
    ENLine10FilterObj.conditionSQL := 'ENELEMENT.ELEMENTINREFCODE = '
      + IntToStr(ENSubstation04Obj.element.code)
      + ' AND COALESCE(ENHIGHVOLTAGESELL.CODE, 0) = '
      + hvsCode;
    ENLine10ListObj :=
      TempENLine10.getScrollableFilteredList(
        ENLine10FilterObj, 0, -1);
  finally
    Result := ENLine10ListObj.totalCount;
    ENLine10FilterObj.Free;
    ENLine10ListObj.Free;
  end;*)
  TempENHighVoltCellSupplies := HTTPRIOENHighVoltCellSupplies
    as ENHighVoltCellSuppliesControllerSoapPort;
  hvcsFilterObj := ENHighVoltCellSuppliesFilter.Create;
  try
    SetNullIntProps(hvcsFilterObj);
    SetNullXSProps(hvcsFilterObj);
    hvcsFilterObj.conditionSQL := ' ENSUBSTATION04.CODE = ' +
      IntToStr(ENSubstation04Obj.code) +
      ' AND ENHIGHVOLTAGESELL.CODE = ' + hvsCode +
      ' AND COALESCE(ENLINE10.CODE, 0) <> 0';
    hvcsListObj :=
      TempENHighVoltCellSupplies.getScrollableFilteredList(
        hvcsFilterObj, 0, 100);
    try
      Result := hvcsListObj.totalCount;
    finally
      hvcsListObj.Free;
      hvcsListObj := Nil;
    end; //try
  finally
    hvcsFilterObj.Free;
    hvcsFilterObj := Nil;
  end; //try
end;

procedure TfrmENSubstation04Edit.recalcLinesCable();
var //������ ���������� ��������� ����� ������� ���������� 6-10/0.4 ��
  (*TempENLineCable: ENLineCableControllerSoapPort;
  ENLineCableListObj: ENLineCableShortList;
  ENLineCableFilterObj: ENLineCableFilter;*)
  TempENHighVoltCellSupplies: ENHighVoltCellSuppliesControllerSoapPort;
  hvcsListObj: ENHighVoltCellSuppliesShortList;
  hvcsFilterObj: ENHighVoltCellSuppliesFilter;
begin
  (*TempENLineCable :=
    HTTPRIOENLineCableSupplies as ENLineCableControllerSoapPort;
  try
    ENLineCableFilterObj := ENLineCableFilter.Create;
    SetNullIntProps(ENLineCableFilterObj);
    SetNullXSProps(ENLineCableFilterObj);
    ENLineCableFilterObj.conditionSQL := 'ENELEMENT.ELEMENTINREFCODE = '
      + IntToStr(ENSubstation04Obj.element.code)
      + ' AND COALESCE(ENHIGHVOLTAGESELL.CODE, 0) <> 0';
    ENLineCableListObj :=
      TempENLineCable.getScrollableFilteredList(
        ENLineCableFilterObj, 0, -1);
    lblLineCableCnt.Caption := IntToStr(ENLineCableListObj.totalCount);
  finally
    ENLineCableFilterObj.Free;
    ENLineCableListObj.Free;
  end;*)
  TempENHighVoltCellSupplies := HTTPRIOENHighVoltCellSupplies
    as ENHighVoltCellSuppliesControllerSoapPort;
  hvcsFilterObj := ENHighVoltCellSuppliesFilter.Create;
  try
    SetNullIntProps(hvcsFilterObj);
    SetNullXSProps(hvcsFilterObj);
    hvcsFilterObj.conditionSQL := ' ENSUBSTATION04.CODE = ' +
      IntToStr(ENSubstation04Obj.code) +
      ' AND COALESCE(ENLINECABLE.CODE, 0) <> 0';
    hvcsListObj :=
      TempENHighVoltCellSupplies.getScrollableFilteredList(
        hvcsFilterObj, 0, 100);
    try
      lblLineCableCnt.Caption := IntToStr(hvcsListObj.totalCount);
    finally
      hvcsListObj.Free;
      hvcsListObj := Nil;
    end; //try
  finally
    hvcsFilterObj.Free;
    hvcsFilterObj := Nil;
  end; //try
end;

function TfrmENSubstation04Edit.recalcLinesCableHVS(hvsCode: String): Integer;
var //�������� ���������� ��������� ����� ������� �� �������������� ������
  (*TempENLineCable: ENLineCableControllerSoapPort;
  ENLineCableListObj: ENLineCableShortList;
  ENLineCableFilterObj: ENLineCableFilter;*)
  TempENHighVoltCellSupplies: ENHighVoltCellSuppliesControllerSoapPort;
  hvcsListObj: ENHighVoltCellSuppliesShortList;
  hvcsFilterObj: ENHighVoltCellSuppliesFilter;
begin
  if Length(hvsCode) = 0 then
    begin
      Result := 0;
      Exit;
    end;
  (*TempENLineCable :=
    HTTPRIOENLineCableSupplies as ENLineCableControllerSoapPort;
  try
    ENLineCableFilterObj := ENLineCableFilter.Create;
    SetNullIntProps(ENLineCableFilterObj);
    SetNullXSProps(ENLineCableFilterObj);
    ENLineCableFilterObj.conditionSQL := 'ENELEMENT.ELEMENTINREFCODE = '
      + IntToStr(ENSubstation04Obj.element.code)
      + ' AND COALESCE(ENHIGHVOLTAGESELL.CODE, 0) = '
      + hvsCode;
    ENLineCableListObj :=
      TempENLineCable.getScrollableFilteredList(
        ENLineCableFilterObj, 0, -1);
  finally
    Result := ENLineCableListObj.totalCount;
    ENLineCableFilterObj.Free;
    ENLineCableListObj.Free;
  end;*)
  TempENHighVoltCellSupplies := HTTPRIOENHighVoltCellSupplies
    as ENHighVoltCellSuppliesControllerSoapPort;
  hvcsFilterObj := ENHighVoltCellSuppliesFilter.Create;
  try
    SetNullIntProps(hvcsFilterObj);
    SetNullXSProps(hvcsFilterObj);
    hvcsFilterObj.conditionSQL := ' ENSUBSTATION04.CODE = ' +
      IntToStr(ENSubstation04Obj.code) +
      ' AND ENHIGHVOLTAGESELL.CODE = ' + hvsCode +
      ' AND COALESCE(ENLINECABLE.CODE, 0) <> 0';
    hvcsListObj :=
      TempENHighVoltCellSupplies.getScrollableFilteredList(
        hvcsFilterObj, 0, 100);
    try
      Result := hvcsListObj.totalCount;
    finally
      hvcsListObj.Free;
      hvcsListObj := Nil;
    end; //try
  finally
    hvcsFilterObj.Free;
    hvcsFilterObj := Nil;
  end; //try
end;


procedure TfrmENSubstation04Edit.recalcPanels();
var //������ ���������� ������� �� ������������� ����
  TempENPanel: ENPanelControllerSoapPort;
  ENPanelListObj: ENPanelShortList;
  ENPanelFilterObj: ENPanelFilter;
begin
  TempENPanel :=
    HTTPRIOENPanel as ENPanelControllerSoapPort;
  try
    ENPanelFilterObj := ENPanelFilter.Create;
    SetNullIntProps(ENPanelFilterObj);
    SetNullXSProps(ENPanelFilterObj);
    ENPanelFilterObj.conditionSQL := 'ENELEMENT.ELEMENTINREFCODE = '
      + IntToStr(ENSubstation04Obj.element.code);
    ENPanelListObj :=
      TempENPanel.getScrollableFilteredList(
        ENPanelFilterObj, 0, -1);
    lblPanelCnt.Caption := IntToStr(ENPanelListObj.totalCount);
  finally
    ENPanelFilterObj.Free;
    ENPanelListObj.Free;
  end;
end;

procedure TfrmENSubstation04Edit.recalcBranches(branchType: Integer);
var //������ ���������� ��������� �� ���������� ��������� ����� 0,4 ��
  TempENBranch: ENBranchControllerSoapPort; //��� ������������� ��������� �����
  ENBranchListObj: ENBranchShortList; //� ����������� �� brahchType
  ENBranchFilterObj: ENBranchFilter;
begin
  TempENBranch :=
    HTTPRIOENBranch as ENBranchControllerSoapPort;
  try
    ENBranchFilterObj := ENBranchFilter.Create;
    SetNullIntProps(ENBranchFilterObj);
    SetNullXSProps(ENBranchFilterObj);

    ENBranchFilterObj.conditionSQL := 'ENBRANCH.BRANCHTYPEREFCODE = ' +
      IntToStr(branchType) +
      ' AND ENBRANCH.PANELCODE IN (SELECT CODE ' +
      'FROM ENPANEL WHERE ENPANEL.ELEMENTCODE IN ' +
      '(SELECT E.CODE FROM ENELEMENT E WHERE E.ELEMENTINREFCODE = '
        +  IntToStr(ENSubstation04Obj.element.code) + '))';

    ENBranchListObj :=
      TempENBranch.getScrollableFilteredList(
        ENBranchFilterObj, 0, -1);
    case branchType of
      EditENBranch.btLine04:
        lblLine04Cnt.Caption := IntToStr(ENBranchListObj.totalCount);
      EditENBranch.btLineCable:
        lblLineCableLVBcnt.Caption := IntToStr(ENBranchListObj.totalCount);
    end; //case branchType of
  finally
    ENBranchFilterObj.Free;
    ENBranchListObj.Free;
  end;
end;

procedure TfrmENSubstation04Edit.recalcContactBreakers();
var //������ ���������� �����������
  TempENContactBreaker: ENContactBreakerControllerSoapPort;
  ENContactBreakerListObj: ENContactBreakerShortList;
  ENContactBreakerFilterObj: ENContactBreakerFilter;
begin
  TempENContactBreaker :=
    HTTPRIOENContactBreaker as ENContactBreakerControllerSoapPort;
  try
    ENContactBreakerFilterObj := ENContactBreakerFilter.Create;
    SetNullIntProps(ENContactBreakerFilterObj);
    SetNullXSProps(ENContactBreakerFilterObj);
    ENContactBreakerFilterObj.conditionSQL := 'ENELEMENT.ELEMENTINREFCODE = '
      + IntToStr(ENSubstation04Obj.element.code)
      + ' AND (COALESCE(ENBRANCH.CODE, 0) <> 0 OR COALESCE(ENLOWVOLTBOARD.CODE, 0) <> 0)';
    ENContactBreakerListObj :=
      TempENContactBreaker.getScrollableFilteredList(
        ENContactBreakerFilterObj, 0, -1);
    lblContactBreakerCnt.Caption := IntToStr(ENContactBreakerListObj.totalCount);
  finally
    ENContactBreakerFilterObj.Free;
    ENContactBreakerListObj.Free;
  end;
end;

function TfrmENSubstation04Edit.recalcContactBreakersBr(brCode: String): Integer;
var //�������� ���������� ����������� �� �������������
  TempENContactBreaker: ENContactBreakerControllerSoapPort;
  ENContactBreakerListObj: ENContactBreakerShortList;
  ENContactBreakerFilterObj: ENContactBreakerFilter;
begin
  TempENContactBreaker :=
    HTTPRIOENContactBreaker as ENContactBreakerControllerSoapPort;
  try
    ENContactBreakerFilterObj := ENContactBreakerFilter.Create;
    SetNullIntProps(ENContactBreakerFilterObj);
    SetNullXSProps(ENContactBreakerFilterObj);
    ENContactBreakerFilterObj.conditionSQL := 'ENELEMENT.ELEMENTINREFCODE = '
      + IntToStr(ENSubstation04Obj.element.code)
      + ' AND COALESCE(ENBRANCH.CODE, 0) = ' + brCode;
    ENContactBreakerListObj :=
      TempENContactBreaker.getScrollableFilteredList(
        ENContactBreakerFilterObj, 0, -1);
  finally
    Result := ENContactBreakerListObj.totalCount;
    ENContactBreakerFilterObj.Free;
    ENContactBreakerListObj.Free;
  end;
end;

procedure TfrmENSubstation04Edit.recalcFusesLVB();
var //������ ���������� ��������������� �� ������������� �������
  TempENFuseLVB: ENFuseControllerSoapPort;
  ENFuseLVBlistObj: ENFuseShortList;
  ENFuseLVBfilterObj: ENFuseFilter;
begin
  TempENFuseLVB :=
    HTTPRIOENFuseLVB as ENFuseControllerSoapPort;
  try
    ENFuseLVBfilterObj := ENFuseFilter.Create;
    SetNullIntProps(ENFuseLVBfilterObj);
    SetNullXSProps(ENFuseLVBfilterObj);
    ENFuseLVBfilterObj.conditionSQL := 'ENELEMENT.ELEMENTINREFCODE = '
      + IntToStr(ENSubstation04Obj.element.code)
      + ' AND (COALESCE(ENBRANCH.CODE, 0) <> 0 OR COALESCE(ENLOWVOLTBOARD.CODE, 0) <> 0)';
    ENFuseLVBlistObj :=
      TempENFuseLVB.getScrollableFilteredList(
        ENFuseLVBfilterObj, 0, -1);
    lblFuseLVBcnt.Caption := IntToStr(ENFuseLVBlistObj.totalCount);
  finally
    ENFuseLVBfilterObj.Free;
    ENFuseLVBlistObj.Free;
  end;
end;

function TfrmENSubstation04Edit.recalcFusesBr(brCode: String): Integer;
var //�������� ���������� ��������������� �� �������������
  TempENFuseLVB: ENFuseControllerSoapPort;
  ENFuseLVBlistObj: ENFuseShortList;
  ENFuseLVBfilterObj: ENFuseFilter;
begin
  TempENFuseLVB :=
    HTTPRIOENFuseLVB as ENFuseControllerSoapPort;
  try
    ENFuseLVBfilterObj := ENFuseFilter.Create;
    SetNullIntProps(ENFuseLVBfilterObj);
    SetNullXSProps(ENFuseLVBfilterObj);
    ENFuseLVBfilterObj.conditionSQL := 'ENELEMENT.ELEMENTINREFCODE = '
      + IntToStr(ENSubstation04Obj.element.code)
      + ' AND COALESCE(ENBRANCH.CODE, 0) = ' + brCode;
    ENFuseLVBlistObj :=
      TempENFuseLVB.getScrollableFilteredList(
        ENFuseLVBfilterObj, 0, -1);
  finally
    Result := ENFuseLVBlistObj.totalCount;
    ENFuseLVBfilterObj.Free;
    ENFuseLVBlistObj.Free;
  end;
end;

procedure TfrmENSubstation04Edit.recalcAutomates();
var //������ ���������� �������������� ������������
  TempENAutomat: ENAutomatControllerSoapPort;
  ENAutomatListObj: ENAutomatShortList;
  ENAutomatFilterObj: ENAutomatFilter;
begin
  TempENAutomat :=
    HTTPRIOENAutomat as ENAutomatControllerSoapPort;
  try
    ENAutomatFilterObj := ENAutomatFilter.Create;
    SetNullIntProps(ENAutomatFilterObj);
    SetNullXSProps(ENAutomatFilterObj);
    ENAutomatFilterObj.conditionSQL := 'ENELEMENT.ELEMENTINREFCODE = '
      + IntToStr(ENSubstation04Obj.element.code)
      + ' AND (COALESCE(ENBRANCH.CODE, 0) <> 0 OR COALESCE(ENLOWVOLTBOARD.CODE, 0) <> 0)';
    ENAutomatListObj :=
      TempENAutomat.getScrollableFilteredList(
        ENAutomatFilterObj, 0, -1);
    lblAutomatCnt.Caption := IntToStr(ENAutomatListObj.totalCount);
  finally
    ENAutomatFilterObj.Free;
    ENAutomatListObj.Free;
  end;
end;

function TfrmENSubstation04Edit.recalcAutomatesBr(brCode: String): Integer;
var //�������� ���������� �������������� ������������
  TempENAutomat: ENAutomatControllerSoapPort;
  ENAutomatListObj: ENAutomatShortList;
  ENAutomatFilterObj: ENAutomatFilter;
begin
  TempENAutomat :=
    HTTPRIOENAutomat as ENAutomatControllerSoapPort;
  try
    ENAutomatFilterObj := ENAutomatFilter.Create;
    SetNullIntProps(ENAutomatFilterObj);
    SetNullXSProps(ENAutomatFilterObj);
    ENAutomatFilterObj.conditionSQL := 'ENELEMENT.ELEMENTINREFCODE = '
      + IntToStr(ENSubstation04Obj.element.code)
      + ' AND COALESCE(ENBRANCH.CODE, 0) = ' + brCode;
    ENAutomatListObj :=
      TempENAutomat.getScrollableFilteredList(
        ENAutomatFilterObj, 0, -1);
  finally
    Result := ENAutomatListObj.totalCount;
    ENAutomatFilterObj.Free;
    ENAutomatListObj.Free;
  end;
end;

procedure TfrmENSubstation04Edit.recalcMeasurDevicesLVB();
var //������ ���������� ��������� ����� 6 - 10 ��
  TempENMeasurDeviceLVB: ENMeasurDeviceControllerSoapPort;
  ENMeasurDeviceLVBlistObj: ENMeasurDeviceShortList;
  ENMeasurDeviceLVBfilterObj: ENMeasurDeviceFilter;
begin
  TempENMeasurDeviceLVB :=
    HTTPRIOENMeasurDeviceLVB as ENMeasurDeviceControllerSoapPort;
  try
    ENMeasurDeviceLVBfilterObj := ENMeasurDeviceFilter.Create;
    SetNullIntProps(ENMeasurDeviceLVBfilterObj);
    SetNullXSProps(ENMeasurDeviceLVBfilterObj);
    ENMeasurDeviceLVBfilterObj.conditionSQL := 'ENELEMENT.ELEMENTINREFCODE = '
      + IntToStr(ENSubstation04Obj.element.code)
      + ' AND (COALESCE(ENBRANCH.CODE, 0) <> 0 OR COALESCE(ENLOWVOLTBOARD.CODE, 0) <> 0)';
    ENMeasurDeviceLVBlistObj :=
      TempENMeasurDeviceLVB.getScrollableFilteredList(
        ENMeasurDeviceLVBfilterObj, 0, -1);
    lblMeasurDeviceLVBcnt.Caption := IntToStr(ENMeasurDeviceLVBlistObj.totalCount);
  finally
    ENMeasurDeviceLVBfilterObj.Free;
    ENMeasurDeviceLVBlistObj.Free;
  end;
end;

procedure TfrmENSubstation04Edit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubstation04: ENSubstation04ControllerSoapPort;
    Substation04Filter: ENSubstation04Filter;
    Substation04List: ENSubstation04ShortList;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    if not NoBlankValues([edtName {,edtChambersQuantity}])  then
      begin
        Application.MessageBox(PChar('������ ���� �����������!'),
          PChar('��������!'),MB_ICONWARNING + MB_OK);
        Action := caNone;
      end
    else
      begin
        {
        if ENSubstation04Obj.worker <> nil then
        begin
           if ENSubstation04Obj.worker.code = low(Integer) then
           begin
              Application.MessageBox(PChar('������ ����������, �� ����� ������� !'),PChar('����� !'),MB_ICONWARNING + MB_OK);
              if edtEPWorkerName.CanFocus then edtEPWorkerName.SetFocus;
              Action:=caNone;
              Exit;
           end;
        end
        else
        begin
              Application.MessageBox(PChar('������ ����������, �� ����� ������� !'),PChar('����� !'),MB_ICONWARNING + MB_OK);
              if edtEPWorkerName.CanFocus then edtEPWorkerName.SetFocus;
              Action:=caNone;
              Exit;
        end;
        }

        if (edtChambersQuantity.Text <> '') and (lblTRCount.Caption <> '') then
          if StrToInt(edtChambersQuantity.Text) < StrToInt(lblTRCount.Caption) then
            begin
              Application.MessageBox(
                PChar('����� ��� ��������������� �� ������ ���� ������, ��� �����' + #13#10 +
                  '���������������. �������, ����������, ���������� ����������'  + #13#10 +
                  '��� ������� �� ������� "��������������" �������� ��������� ������.'),
                PChar('��������! ������� ������������� �����:'), MB_ICONWARNING + MB_OK);
              edtChambersQuantity.Text := '';
              edtChambersQuantity.SetFocus;
              Action := caNone;
              Exit;
            end;

        if ENSubstation04Obj.element.renRef <> nil then
          begin
           if ENSubstation04Obj.element.renRef.code = low(Integer) then
           begin
             Application.MessageBox(PChar('������ ������� !'),PChar('����� !'), MB_ICONWARNING + MB_OK);
             if edtEPRenName.CanFocus then
               edtEPRenName.SetFocus;
             Action := caNone;
             Exit;
           end;
          end
        else
          begin
            Application.MessageBox(PChar('������ ������� !!'),PChar('����� !'), MB_ICONWARNING + MB_OK);
            if edtEPRenName.CanFocus then edtEPRenName.SetFocus;
            Action:=caNone;
            Abort;
          end;

        TempENSubstation04 := HTTPRIOENSubstation04 as ENSubstation04ControllerSoapPort;

        ///////
        if (edtName.Text <> '') and (edtInvNumber.Text <> '') then
          begin
            Substation04Filter := ENSubstation04Filter.Create;
            try
              SetNullIntProps(Substation04Filter);
              SetNullXSProps(Substation04Filter);

              Substation04Filter.invNumber := Trim(edtInvNumber.Text);
              Substation04Filter.name := Trim(edtName.Text);
              if DialogState = dsEdit then
                Substation04Filter.conditionSQL := 'code <> ' + IntToStr(ENSubstation04Obj.code);

              Substation04List := TempENSubstation04.getScrollableFilteredList(Substation04Filter, 0, -1);
              if Substation04List.totalCount > 0 then
              begin
                Application.MessageBox(PChar('������ � ����� ������ � ����������� ������� ��� ���������� (���: '
                  + IntToStr(Substation04List.list[0].code)
                  + ')!'), PChar('�������� !'), MB_ICONWARNING + MB_OK);
                Action := caNone;
                Exit;
              end;
            finally
              Substation04Filter.Free;
            end;
          end;
        ///////

         ENSubstation04Obj.name := edtName.Text;

         ENSubstation04Obj.buhName := edtBuhName.Text; 

         ENSubstation04Obj.invNumber := edtInvNumber.Text; 

         if edtNominalPower.Text <> '' then
           begin
             if (ENSubstation04Obj.nominalPower = nil ) then
               ENSubstation04Obj.nominalPower := TXSDecimal.Create;
             ENSubstation04Obj.nominalPower.decimalString := edtNominalPower.Text;
           end
         else
            ENSubstation04Obj.nominalPower := nil;

         if edtLastRepairDate.Checked then
           begin
             if ENSubstation04Obj.lastRepairDate = nil then
               ENSubstation04Obj.lastRepairDate := TXSDate.Create;
             ENSubstation04Obj.lastRepairDate.XSToNative(GetXSDate(edtLastRepairDate.DateTime));
           end
         else
           ENSubstation04Obj.lastRepairDate := nil;


         if ENSubstation04Obj.belongingRef = nil then ENSubstation04Obj.belongingRef := ENBelongingRef.Create;
         ENSubstation04Obj.belongingRef.code := cbBelongingType.ItemIndex;

        if ENSubstation04Obj.substationType <> nil then
          begin
            if ENSubstation04Obj.substationType.code = low(Integer) then
              begin
                Application.MessageBox(PChar('������ ��� ��������� !'),PChar('����� !'), MB_ICONWARNING + MB_OK);
                if edtEPWorkerName.CanFocus then edtENSubstationTypeName.SetFocus;
                  Action:=caNone;
                Abort;
              end;
          end
        else
          begin
            Application.MessageBox(PChar('������ ��� ��������� !'),PChar('����� !'), MB_ICONWARNING + MB_OK);
            if edtENSubstationTypeName.CanFocus then
              edtENSubstationTypeName.SetFocus;
            Action:=caNone;
            Abort;
          end;

        if edtSizCode.Text <> '' then
          ENSubstation04Obj.sizCode := StrToInt(edtSizCode.Text)
        else
          ENSubstation04Obj.sizCode := low(Integer);

        ENSubstation04Obj.address := memAddress.Text;
        if ( edtYearBuild.Text <> '' ) then
          ENSubstation04Obj.yearBuild := StrToInt(edtYearBuild.Text)
        else
          ENSubstation04Obj.yearBuild := Low(Integer) ;

        if ( edtYearWorkingStart.Text <> '' ) then
          ENSubstation04Obj.yearWorkingStart := StrToInt(edtYearWorkingStart.Text)
        else
          ENSubstation04Obj.yearWorkingStart := Low(Integer) ;

        ENSubstation04Obj.nameProject := edtNameProject.Text;

        ENSubstation04Obj.nameBuilder := edtNameBuilder.Text;

        if ( edtChambersQuantity.Text <> '' ) then
          ENSubstation04Obj.chambersQuantity := StrToInt(edtChambersQuantity.Text)
        else
          ENSubstation04Obj.chambersQuantity := Low(Integer) ;

        ENSubstation04Obj.additionalData := edtAdditionalData.Text;

        
        if (ENSubstation04Obj.paintSquare = nil) then
          ENSubstation04Obj.paintSquare := TXSDecimal.Create;
        if (edtPaintSquare.Text <> '') then
          ENSubstation04Obj.paintSquare.decimalString := edtPaintSquare.Text
        else
          ENSubstation04Obj.paintSquare := nil;


        if rbInspect2.Checked = True then
            ENSubstation04Obj.periodInspect := ENSUBSTATION04_PERIODINSPECT_2
         else if rbInspect4.Checked = True then
            ENSubstation04Obj.periodInspect := ENSUBSTATION04_PERIODINSPECT_4
         else
         begin
            Application.MessageBox(PChar('������ �������� "����������� ���������� ������ ��" !'),PChar('��������!'),MB_ICONWARNING + MB_OK);
            Action := caNone;
         end;

        if DialogState = dsInsert then
          begin
            ENSubstation04Obj.code:=low(Integer);
            TempENSubstation04.add(ENSubstation04Obj);
          end
        else
          if DialogState = dsEdit then
            begin
              TempENSubstation04.save(ENSubstation04Obj);
            end;



      end;
end;

procedure TfrmENSubstation04Edit.spbEPWorkerClick(Sender : TObject);
var
   frmEPWorkerShow: TfrmEPWorkerShow;
begin
   frmEPWorkerShow:=TfrmEPWorkerShow.Create(Application,fmNormal);
   try
      with frmEPWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubstation04Obj.worker = nil then ENSubstation04Obj.worker := EPWorker.Create();
               ENSubstation04Obj.worker.code := StrToInt(GetReturnValue(sgMain,0));
               edtEPWorkerName.Text:=GetReturnValue(sgMain,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPWorkerShow.Free;
   end;
end;

procedure TfrmENSubstation04Edit.spbFINExecutorClick(Sender: TObject);
var
   frmFINExecutorTreeShow: TfrmFINExecutorTreeShow;
begin
   frmFINExecutorTreeShow:=TfrmFINExecutorTreeShow.Create(Application,fmNormal);
   try
      with frmFINExecutorTreeShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try

               ENSubstation04Obj.element.finExecutor :=
                 DMReports.finExecutorShort2finExecutor(FINExecutorShort(tvDep.Selected.Data),
                                                        DMReports.getFullExecutorName(tvDep.Selected));

               edtFINExecutorName.Text := ENSubstation04Obj.element.finExecutor.name;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINExecutorTreeShow.Free;
   end;
end;

procedure TfrmENSubstation04Edit.actViewExecute(Sender: TObject);
Var
  TempENTransformer: ENTransformerControllerSoapPort;
  TempENHighVoltageSell: ENHighVoltageSellControllerSoapPort;
  TempENPanel: ENPanelControllerSoapPort;
  TempENFiderGuage: ENFiderGuageControllerSoapPort;
  //TempENInspectionSheet: ENInspectionSheetControllerSoapPort; //��������� ���������� �� ������������ ����������
begin
  if pcSubstation04.ActivePage = tsFiderGuage then
    begin //�������� ������� ���������� ��������
      TempENFiderGuage :=
        HTTPRIOENFiderGuage as ENFiderGuageControllerSoapPort;
      try
        ENFiderGuageObj := TempENFiderGuage.getObject(StrToInt(
          sgENFiderGuage.Cells[0, sgENFiderGuage.Row]));
      except
        on EConvertError do Exit;
      end;
      frmENFiderGuageEdit := TfrmENFiderGuageEdit.Create(Application, dsView);
      try
        frmENFiderGuageEdit.codeElemS04 := ENSubstation04Obj.element.code;
        frmENFiderGuageEdit.ShowModal;
      finally
        frmENFiderGuageEdit.Free;
        frmENFiderGuageEdit := nil;
      end;
    end;

  if pcSubstation04.ActivePage = tsLowVoltageBoard then
    begin //�������� �������
      TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
      try
        ENPanelObj :=
          TempENPanel.getObject(
            StrToInt(sgENPanel.Cells[0, sgENPanel.Row]));
      except
        on EConvertError do Exit;
      end;
      frmENPanelEdit := TfrmENPanelEdit.Create(Application, dsView);
      try
        frmENPanelEdit.codeS04 := ENSubstation04Obj.code;
        frmENPanelEdit.ShowModal;
      finally
        frmENPanelEdit.Free;
        frmENPanelEdit := nil;
      end;
    end; //if pcSubstation04.ActivePage = tsLowVoltageBoard then

  if pcSubstation04.ActivePage = tsTransformers then
    begin //�������� ��������������
      TempENTransformer :=
        HTTPRIOENTransformer as ENTransformerControllerSoapPort;
      try
        ENTransformerObj := TempENTransformer.getObject(StrToInt(
          sgENTransformer.Cells[0,sgENTransformer.Row]));
      except
        on EConvertError do Exit;
      end;
      frmENTransformerEdit := TfrmENTransformerEdit.Create(Application, dsView);
      try
        frmENTransformerEdit.edtENSubstation04Name.Text :=
          ENSubstation04Obj.name;
        frmENTransformerEdit.ShowModal;
      finally
        frmENTransformerEdit.Free;
        frmENTransformerEdit := nil;
      end;
    end; //if pcSubstation04.ActivePage = tsTransformers then

  if pcSubstation04.ActivePage = tsHighVoltageParty then
    begin //�������� �������������� ������
      TempENHighVoltageSell :=
        HTTPRIOENHighVoltageSell as ENHighVoltageSellControllerSoapPort;
      try
        ENHighVoltageSellObj :=
          TempENHighVoltageSell.getObject(StrToInt(
            sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]));
      except
        on EConvertError do Exit;
      end;
      frmENHighVoltageSellEdit :=
        TfrmENHighVoltageSellEdit.Create(Application, dsView);
      try
        frmENHighVoltageSellEdit.st04Code := ENSubstation04Obj.code;
        frmENHighVoltageSellEdit.ShowModal;
      finally
        frmENHighVoltageSellEdit.Free;
        frmENHighVoltageSellEdit := nil;
      end;
    end; //if pcSubstation04.ActivePage = tsHighVoltageParty then
end;


procedure TfrmENSubstation04Edit.actViewInspectionSheetExecute(Sender: TObject);
var
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  inherited;
  if pcSubstation04.ActivePage = tsENInspectionSheet then
  begin
    TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
    frmENInspectionSheetEdit := TfrmENInspectionSheetEdit.Create(Application, dsView);

    try
      frmENInspectionSheetEdit.ENInspectionSheetObj := TempENInspectionSheet.getObject(StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]));
    except
      on EConvertError do Exit;
    end;

    try
      if frmENInspectionSheetEdit.ShowModal= mrOk then
      begin
        pcSubstation04Change(Sender);
      end;
    finally
      frmENInspectionSheetEdit.Free;
      frmENInspectionSheetEdit:=nil;
    end;
  end;
end;


procedure TfrmENSubstation04Edit.actViewEquipmentExecute(Sender: TObject);
var TempENDisconnector: ENDisconnectorControllerSoapPort;
  TempENLoadSwitch: ENLoadSwitchControllerSoapPort;
  TempENFuse, TempENFuseLVB: ENFuseControllerSoapPort;
  TempENInsulator: ENInsulatorControllerSoapPort;
  TempENArrester: ENArresterControllerSoapPort;
  TempENCurrentTransformer: ENCurrentTransformerControllerSoapPort;
  TempENBus: ENBusControllerSoapPort;
  TempENMeasurDevice, TempENMeasurDeviceLVB: ENMeasurDeviceControllerSoapPort;
  TempENLine10: ENLine10ControllerSoapPort;
  TempENLineCable: ENLineCableControllerSoapPort;
  TempENContactBreaker: ENContactBreakerControllerSoapPort;
  TempENAutomat: ENAutomatControllerSoapPort;
begin
  if pcSubstation04.ActivePage = tsHighVoltageParty then
    begin //�������� ��������� �� �������������� �������
      if pcHighVoltageParty.ActivePage = tsDisconnector then
        begin //�������� �������������
          TempENDisconnector :=
            HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;
          try
            ENDisconnectorObj :=
              TempENDisconnector.getObject(StrToInt(
                sgENDisconnector.Cells[0, sgENDisconnector.Row]));
          except
            on EConvertError do Exit;
          end;
          frmENDisconnectorEdit :=
            TfrmENDisconnectorEdit.Create(Application, dsView);
          try
            //������� ����� �������������� ������������� � �� 6 - 10 ��
            frmENDisconnectorEdit.lblENLine10.Visible := False;
            frmENDisconnectorEdit.memENLine10.Visible := False;
            frmENDisconnectorEdit.lblENPostRefNubmerGen.Visible := False;
            frmENDisconnectorEdit.edtENPostRefNubmerGen.Visible := False;
            frmENDisconnectorEdit.btnOk.Top :=
              frmENDisconnectorEdit.edtENHighVoltageSellName.Top +
              frmENDisconnectorEdit.edtENHighVoltageSellName.Height + 10;
            frmENDisconnectorEdit.btnCancel.Top :=
              frmENDisconnectorEdit.btnOk.Top;
            frmENDisconnectorEdit.Height := frmENDisconnectorEdit.btnOk.Top +
              frmENDisconnectorEdit.btnOk.Height + 30;
            //����� ����� ��������� �������������
            frmENDisconnectorEdit.ShowModal;
          finally
            frmENDisconnectorEdit.Free;
            frmENDisconnectorEdit := nil;
          end;
        end; //if pcHighVoltageParty.ActivePage = tsDisconnector then

      if pcHighVoltageParty.ActivePage = tsLoadSwitch then
        begin //�������� ����������� ��������
          TempENLoadSwitch :=
            HTTPRIOENLoadSwitch as ENLoadSwitchControllerSoapPort;
          try
            ENLoadSwitchObj :=
              TempENLoadSwitch.getObject(StrToInt(
                sgENLoadSwitch.Cells[0, sgENLoadSwitch.Row]));
          except
            on EConvertError do Exit;
          end;
          frmENLoadSwitchEdit :=
            TfrmENLoadSwitchEdit.Create(Application, dsView);
          try
            frmENLoadSwitchEdit.ShowModal;
          finally
            frmENLoadSwitchEdit.Free;
            frmENLoadSwitchEdit := nil;
          end;
        end; //if pcHighVoltageParty.ActivePage = tsLoadSwitch then

      if pcHighVoltageParty.ActivePage = tsFuse then
        begin //�������� ��������������
          TempENFuse := HTTPRIOENFuse as ENFuseControllerSoapPort;
          try
            ENFuseObj := TempENFuse.getObject(StrToInt(
              sgENFuse.Cells[0, sgENFuse.Row]));
          except
            on EConvertError do Exit;
          end;
          frmENFuseEdit := TfrmENFuseEdit.Create(Application, dsView);
          try
            frmENFuseEdit.codeS04 := ENSubstation04Obj.code;
            if ENSubstation04Obj.element <> nil then
              if ENSubstation04Obj.element.code <> low(Integer) then
                frmENFuseEdit.elementCodeS04 := ENSubstation04Obj.element.code;
            frmENFuseEdit.memENSubstation04.Text := ENSubstation04Obj.name;
            if ENSubstation04Obj.nominalPower <> nil then
              frmENFuseEdit.memENSubstation04.Text :=
                frmENFuseEdit.memENSubstation04.Text + ', P = '
                + ENSubstation04Obj.nominalPower.DecimalString;
            if ENSubstation04Obj.invNumber <> '' then
              frmENFuseEdit.memENSubstation04.Text :=
                frmENFuseEdit.memENSubstation04.Text + ', ���. � '
                + ENSubstation04Obj.invNumber;

            //��������������� ��������� �� ������ ������� �����������
            frmENFuseEdit.lblTransformer.Top := frmENFuseEdit.lblBranch.Top;
            frmENFuseEdit.memTransformer.Top :=
              frmENFuseEdit.memENBranchName.Top;
            frmENFuseEdit.btnOk.Top := frmENFuseEdit.memTransformer.Top
              + frmENFuseEdit.memTransformer.Height + 10;
            frmENFuseEdit.btnCancel.Top :=
              frmENFuseEdit.btnOk.Top;
            frmENFuseEdit.Height := frmENFuseEdit.btnOk.Top
              + frmENFuseEdit.btnOk.Height + 30;

            //�������� ����� ��������� �������������� (�������������� ������)
            frmENFuseEdit.ShowModal;
          finally
            frmENFuseEdit.Free;
            frmENFuseEdit := nil;
          end;
        end; //if pcHighVoltageParty.ActivePage = tsFuse then

      if pcHighVoltageParty.ActivePage = tsInsulator then
        begin //�������� ���������
          TempENInsulator := HTTPRIOENInsulator as ENInsulatorControllerSoapPort;
          try
            ENInsulatorObj := TempENInsulator.getObject(StrToInt(
              sgENInsulator.Cells[0, sgENInsulator.Row]));
          except
            on EConvertError do Exit;
          end;
          frmENInsulatorEdit := TfrmENInsulatorEdit.Create(Application, dsView);
          try
            //������� ����� �������������� ��������� � �� 6 - 10 ��
            frmENInsulatorEdit.lblENLine10.Visible := False;
            frmENInsulatorEdit.memENLine10.Visible := False;
            frmENInsulatorEdit.lblENPostRefNubmerGen.Visible := False;
            frmENInsulatorEdit.edtENPostRefNubmerGen.Visible := False;
            frmENInsulatorEdit.btnOk.Top :=
              frmENInsulatorEdit.edtENHighVoltageSellName.Top +
              frmENInsulatorEdit.edtENHighVoltageSellName.Height + 10;
            frmENInsulatorEdit.btnCancel.Top :=
              frmENInsulatorEdit.btnOk.Top;
            frmENInsulatorEdit.Height := frmENInsulatorEdit.btnOk.Top +
              frmENInsulatorEdit.btnOk.Height + 30;
            //����� ����� ��������� ���������
            frmENInsulatorEdit.ShowModal;
          finally
            frmENInsulatorEdit.Free;
            frmENInsulatorEdit := nil;
          end;
        end; //if pcHighVoltageParty.ActivePage = tsInsulator then

      if pcHighVoltageParty.ActivePage = tsArrester then
        begin //�������� ����������
          TempENArrester := HTTPRIOENArrester as ENArresterControllerSoapPort;
          try
            ENArresterObj := TempENArrester.getObject(StrToInt(
              sgENArrester.Cells[0, sgENArrester.Row]));
          except
            on EConvertError do Exit;
          end;
          frmENArresterEdit := TfrmENArresterEdit.Create(Application, dsView);
          try
            frmENArresterEdit.ShowModal;
          finally
            frmENArresterEdit.Free;
            frmENArresterEdit := nil;
          end;
        end; //if pcHighVoltageParty.ActivePage = tsArrester then

      if pcHighVoltageParty.ActivePage = tsCurrentTransformer then
        begin //�������� �������������� ����
          TempENCurrentTransformer :=
            HTTPRIOENCurrentTransformer as ENCurrentTransformerControllerSoapPort;
          try
            ENCurrentTransformerObj := TempENCurrentTransformer.getObject(StrToInt(
              sgENCurrentTransformer.Cells[0, sgENCurrentTransformer.Row]));
          except
            on EConvertError do Exit;
          end;
          frmENCurrentTransformerEdit :=
            TfrmENCurrentTransformerEdit.Create(Application, dsView);
          try
            frmENCurrentTransformerEdit.ShowModal;
          finally
            frmENCurrentTransformerEdit.Free;
            frmENCurrentTransformerEdit := nil;
          end;
        end; //if pcHighVoltageParty.ActivePage = tsCurrentTransformer then

      if pcHighVoltageParty.ActivePage = tsBus then
        begin //�������� ����
          TempENBus := HTTPRIOENBus as ENBusControllerSoapPort;
          try
            ENBusObj := TempENBus.getObject(StrToInt(
              sgENBus.Cells[0, sgENBus.Row]));
          except
            on EConvertError do Exit;
          end;
          frmENBusEdit := TfrmENBusEdit.Create(Application, dsView);
          try
            frmENBusEdit.ShowModal;
          finally
            frmENBusEdit.Free;
            frmENBusEdit := nil;
          end;
        end; //if pcHighVoltageParty.ActivePage = tsBus then

      if pcHighVoltageParty.ActivePage = tsMeasurDevice then
        begin //�������� �������������� �������
          TempENMeasurDevice :=
            HTTPRIOENMeasurDevice as ENMeasurDeviceControllerSoapPort;
          try
            ENMeasurDeviceObj := TempENMeasurDevice.getObject(StrToInt(
              sgENMeasurDevice.Cells[0, sgENMeasurDevice.Row]));
          except
            on EConvertError do Exit;
          end;
          frmENMeasurDeviceEdit :=
            TfrmENMeasurDeviceEdit.Create(Application, dsView);
          try
            frmENMeasurDeviceEdit.ShowModal;
          finally
            frmENMeasurDeviceEdit.Free;
            frmENMeasurDeviceEdit := nil;
          end;
        end; //if pcHighVoltageParty.ActivePage = tsMeasurDevice then

      if pcHighVoltageParty.ActivePage = tsElectricLineSupplies then
        begin //�������� ����� ������� ����������
          if rbENLine10.Checked then
            begin //�������� ��������� ����� 6 - 10 ��
              TempENLine10 := HTTPRIOENLine10 as ENLine10ControllerSoapPort;
              try
                ENLine10Obj := TempENLine10.getObject(StrToInt(
                  sgENLine10.Cells[0, sgENLine10.Row]));
              except
                on EConvertError do Exit;
              end;
              frmENLine10Edit := TfrmENLine10Edit.Create(Application, dsView);
              try
                frmENLine10Edit.ShowModal;
              finally
                frmENLine10Edit.Free;
                frmENLine10Edit := nil;
              end;
            end
          else //if rbENLineCable.Checked then
            begin //�������� ��������� �����
              TempENLineCable := HTTPRIOENLineCableSupplies as ENLineCableControllerSoapPort;
              try
                ENLineCableObj := TempENLineCable.getObject(StrToInt(
                  sgENLineCable.Cells[0, sgENLineCable.Row]));
              except
                on EConvertError do Exit;
              end;
              frmENLineCableEdit := TfrmENLineCableEdit.Create(Application, dsView);
              try
                frmENLineCableEdit.ShowModal;
              finally
                frmENLineCableEdit.Free;
                frmENLineCableEdit := nil;
              end;
            end;
        end; //if pcHighVoltageParty.ActivePage = tsElectricLineSupplies then
    end //if pcSubstation04.ActivePage = tsHighVoltageParty then
  else if pcSubstation04.ActivePage = tsLowVoltageBoard then
    begin //�������� ��������� �� ������������� �������
      if pcBoardEquipment.ActivePage = tsContactBreakerLVB then
        begin //�������� ���������� �� ������������� �������
          TempENContactBreaker :=
            HTTPRIOENContactBreaker as ENContactBreakerControllerSoapPort;
          try
            ENContactBreakerObj := TempENContactBreaker.getObject(
              StrToInt(sgENContactBreaker.Cells[0,sgENContactBreaker.Row]));
          except
            on EConvertError do Exit;
          end;
          frmENContactBreakerEdit :=
            TfrmENContactBreakerEdit.Create(Application, dsView);
          try
            frmENContactBreakerEdit.codeS04 := ENSubstation04Obj.code;
            if ENSubstation04Obj.element <> nil then
              if ENSubstation04Obj.element.code <> low(Integer) then
                frmENContactBreakerEdit.elementCodeS04 :=
                  ENSubstation04Obj.element.code;
            frmENContactBreakerEdit.ShowModal;
          finally
            frmENContactBreakerEdit.Free;
            frmENContactBreakerEdit := nil;
          end;
        end; //if pcBoardEquipment.ActivePage = tsContactBreakerLVB then
      if pcBoardEquipment.ActivePage = tsFuseLVB then
        begin //�������� �������������� �� ������������� �������
          TempENFuseLVB := HTTPRIOENFuseLVB as ENFuseControllerSoapPort;
          try
            ENFuseObj := TempENFuseLVB.getObject(
              StrToInt(sgENFuseLVB.Cells[0, sgENFuseLVB.Row]));
          except
            on EConvertError do Exit;
          end;
          frmENFuseEdit := TfrmENFuseEdit.Create(Application, dsView);
          try
            frmENFuseEdit.codeS04 := ENSubstation04Obj.code;
            if ENSubstation04Obj.element <> nil then
              if ENSubstation04Obj.element.code <> low(Integer) then
                frmENFuseEdit.elementCodeS04 :=
                  ENSubstation04Obj.element.code;
            frmENFuseEdit.memENSubstation04.Text := ENSubstation04Obj.name;
            if ENSubstation04Obj.nominalPower <> nil then
              frmENFuseEdit.memENSubstation04.Text :=
                frmENFuseEdit.memENSubstation04.Text + ', P = '
                + ENSubstation04Obj.nominalPower.DecimalString;
            if ENSubstation04Obj.invNumber <> '' then
              frmENFuseEdit.memENSubstation04.Text :=
                frmENFuseEdit.memENSubstation04.Text + ', ���. � '
                + ENSubstation04Obj.invNumber;
            frmENFuseEdit.lblENHighVoltageSellName.Visible := False;
            frmENFuseEdit.edtENHighVoltageSellName.Visible := False;
            frmENFuseEdit.spbENHighVoltageSell.Visible := False;
            frmENFuseEdit.lblBranch.Visible := True;
            frmENFuseEdit.memENBranchName.Visible := True;
            frmENFuseEdit.spbENBranch.Visible := True;
            frmENFuseEdit.ShowModal;
          finally
            frmENFuseEdit.Free;
            frmENFuseEdit := nil;
          end;
        end; //if pcBoardEquipment.ActivePage = tsFuseLVB then
      if pcBoardEquipment.ActivePage = tsAutomatLVB then
        begin //�������� ��������������� ����������� �� ������������� �������
          TempENAutomat := HTTPRIOENAutomat as ENAutomatControllerSoapPort;
          try
            ENAutomatObj := TempENAutomat.getObject(
              StrToInt(sgENAutomat.Cells[0, sgENAutomat.Row]));
          except
            on EConvertError do Exit;
          end;
          frmENAutomatEdit := TfrmENAutomatEdit.Create(Application, dsView);
          try
            frmENAutomatEdit.codeS04 := ENSubstation04Obj.code;
            if ENSubstation04Obj.element <> nil then
              if ENSubstation04Obj.element.code <> low(Integer) then
                frmENAutomatEdit.elementCodeS04 :=
                  ENSubstation04Obj.element.code;
            frmENAutomatEdit.ShowModal;
          finally
            frmENAutomatEdit.Free;
            frmENAutomatEdit := nil;
          end;
        end; //if pcBoardEquipment.ActivePage = tsAutomatLVB then

      if pcBoardEquipment.ActivePage = tsMeasurDeviceLVB then
        begin //�������� �������������� ���������� �� ������������� �������
          TempENMeasurDeviceLVB :=
            HTTPRIOENMeasurDeviceLVB as ENMeasurDeviceControllerSoapPort;
          try
            ENMeasurDeviceObj := TempENMeasurDeviceLVB.getObject(
              StrToInt(sgENMeasurDeviceLVB.Cells[0, sgENMeasurDeviceLVB.Row]));
          except
            on EConvertError do Exit;
          end;
          frmENMeasurDeviceEdit :=
            TfrmENMeasurDeviceEdit.Create(Application, dsView);
          try
            frmENMeasurDeviceEdit.codeS04 := ENSubstation04Obj.code;
            if ENSubstation04Obj.element <> nil then
              if ENSubstation04Obj.element.code <> low(Integer) then
                frmENMeasurDeviceEdit.elementCodeS04 :=
                  ENSubstation04Obj.element.code;
            frmENMeasurDeviceEdit.lblENHighVoltageSellName.Visible := False;
            frmENMeasurDeviceEdit.edtENHighVoltageSellName.Visible := False;
            frmENMeasurDeviceEdit.spbENHighVoltageSell.Visible := False;
            frmENMeasurDeviceEdit.lblBranch.Visible := True;
            frmENMeasurDeviceEdit.memENBranchName.Visible := True;
            frmENMeasurDeviceEdit.spbENBranch.Visible := True;
            frmENMeasurDeviceEdit.ShowModal;
          finally
            frmENMeasurDeviceEdit.Free;
            frmENMeasurDeviceEdit := nil;
          end;
        end; //if pcBoardEquipment.ActivePage = tsMeasurDeviceLVB then
    end; //else if pcSubstation04.ActivePage = tsLowVoltageBoard then
end;

procedure TfrmENSubstation04Edit.actInsertExecute(Sender: TObject);
Var TempENTransformer: ENTransformerControllerSoapPort;
  ENTransformerFilterObj: ENTransformerFilter;
  ENTransformerList: ENTransformerShortList;
  strTransformer: String;
  TempENHighVoltageSell: ENHighVoltageSellControllerSoapPort;
  TempENSafetyPrecautions: ENSafetyPrecautionsControllerSoapPort;
  //TempENLowVoltBoard: ENLowVoltBoardControllerSoapPort;
  TempENPanel: ENPanelControllerSoapPort;
begin
  if pcSubstation04.ActivePage = tsFiderGuage then
    begin //���������� ������ ���������� ��������
      ENFiderGuageObj := ENFiderGuage.Create;
      try
        ENFiderGuageObj.substation04 := ENSubstation04Ref.Create;
        ENFiderGuageObj.substation04.code := ENSubstation04Obj.code;
        frmENFiderGuageEdit :=
          TfrmENFiderGuageEdit.Create(Application, dsInsert);
        try
          frmENFiderGuageEdit.codeElemS04 := ENSubstation04Obj.element.code;
          if frmENFiderGuageEdit.ShowModal = mrOk then
          begin
            if ENFiderGuageObj <> nil then
              UpdateGrid(Sender);
          end;
        finally
          frmENFiderGuageEdit.Free;
          frmENFiderGuageEdit := nil;
        end;
      finally
        ENFiderGuageObj.Free;
      end;
    end;

  if pcSubstation04.ActivePage = tsLowVoltageBoard then
    begin (*���������� ������ �������������� ���� ���������� 6 - 10 / 0.4 ��.
      ������������� ��� ������ ����������� ������ �� ������������ � ������ add
      ��������� ����� � ��������������� ���������*)
      TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
      ENPanelObj := ENPanel.Create;
      SetNullIntProps(ENPanelObj);
      SetNullXSProps(ENPanelObj);
      ENPanelObj.element := ENElement.Create;
      ENPanelObj.element.elementInRef := ENElementRef.Create;
      ENPanelObj.element.elementInRef.code := ENSubstation04Obj.element.code;
      ENPanelObj.element.renRef := EPRenRef.Create;
      ENPanelObj.element.renRef.code := ENSubstation04Obj.element.renRef.code;
      try
        frmENPanelEdit := TfrmENPanelEdit.Create(Application, dsInsert);
        try
          frmENPanelEdit.codeS04 := ENSubstation04Obj.code;
          if ENPanelObj.panelType = nil then
            ENPanelObj.panelType := ENPanelType.Create();
          ENPanelObj.panelType.code := 500000000;
          frmENPanelEdit.edtENPanelTypeName.Text := '�� ���������';

          if ENPanelObj.arresterType = nil then
            ENPanelObj.arresterType := ENArresterType.Create();
          ENPanelObj.arresterType.code := 500000000;
          frmENPanelEdit.edtENArresterTypeName.Text := '�� ����������';

          if sgENPanel.Cells[0, 1] = '' then
            frmENPanelEdit.edtName.Text := '������ � 1'
          else frmENPanelEdit.edtName.Text := '������ � ' +
            IntToStr(sgENPanel.RowCount);
          if frmENPanelEdit.ShowModal = mrOk then
          begin
            if ENPanelObj <> nil then
              //TempENPanel.add(ENPanelObj);
              UpdateGrid(Sender);
          end;
        finally
          frmENPanelEdit.Free;
          frmENPanelEdit:=nil;
        end;
      finally
        ENPanelObj.Free;
      end;
    end;

  if pcSubstation04.ActivePage = tsTransformers then
    begin //���������� ��������������, ��������� � ���������� 6 - 10 / 0.4 ��
      if (ENSubstation04Obj.chambersQuantity = Low(Integer)) then
        begin
          pcSubstation04.ActivePageIndex := 0;
          Application.MessageBox(
            PChar('�������, ����������, ���������� ����� ��� ���������������.'),
            PChar('����������� ������:'),MB_ICONINFORMATION);
          edtChambersQuantity.SetFocus;
          Exit;
        end
      else if (StrToInt(lblTRCount.Caption) >= ENSubstation04Obj.chambersQuantity) then
        begin
          pcSubstation04.ActivePageIndex := 0;
          Application.MessageBox(
            PChar('��������� ���������� ����� �� ��������� �������� ��� ���� �������������.'),
            PChar('�� ������� �����:'),MB_ICONINFORMATION);
          edtChambersQuantity.SetFocus;
          Exit;
        end;

      TempENTransformer := HTTPRIOENTransformer as ENTransformerControllerSoapPort;
      ENTransformerObj := ENTransformer.Create;
      SetNullIntProps(ENTransformerObj);
      SetNullXSProps(ENTransformerObj);

      ENTransformerObj.substation04Ref := ENSubstation04Ref.Create;
      ENTransformerObj.substation04Ref.code := ENSubstation04Obj.code;

      ENTransformerObj.element := ENElement.Create;
      ENTransformerObj.element.elementInRef := ENElementRef.Create;
      ENTransformerObj.element.elementInRef.code := ENSubstation04Obj.element.code;

      ENTransformerObj.element.renRef := EPRenRef.Create;
      ENTransformerObj.element.renRef.code := ENSubstation04Obj.element.renRef.code;

      try
        frmENTransformerEdit := TfrmENTransformerEdit.Create(Application, dsInsert);
        frmENTransformerEdit.edtENSubstation04Name.Text := ENSubstation04Obj.name;
        try
          frmENTransformerEdit.edtENSubstation04Name.Text := ENSubstation04Obj.name;
          frmENTransformerEdit.edtEPRenName.Text := ENSubstation04Obj.element.renRef.name;
          if frmENTransformerEdit.ShowModal = mrOk then
            begin
              UpdateGrid(Sender);
              recalcTransformers();
            end;
        finally
          frmENTransformerEdit.Free;
          frmENTransformerEdit:=nil;
        end;
      finally
        ENTransformerObj.Free;
      end;
    end; //if pcSubstation04.ActivePage = tsTransformers then

  if pcSubstation04.ActivePage = tsHighVoltageParty then
    begin //���������� �������������� ������ ��� ���������� 6 - 10 / 0.4 ��
      TempENHighVoltageSell :=
        HTTPRIOENHighVoltageSell as ENHighVoltageSellControllerSoapPort;
      ENHighVoltageSellObj := ENHighVoltageSell.Create;
      SetNullIntProps(ENHighVoltageSellObj);
      SetNullXSProps(ENHighVoltageSellObj);

      ENHighVoltageSellObj.element := ENElement.Create;
      ENHighVoltageSellObj.element.elementInRef := ENElementRef.Create;
      ENHighVoltageSellObj.element.elementInRef.code :=
        ENSubstation04Obj.element.code;
      ENHighVoltageSellObj.element.renRef := EPRenRef.Create;
      ENHighVoltageSellObj.element.renRef.code :=
        ENSubstation04Obj.element.renRef.code;

      strTransformer := '';
      //�������� �������������� �������������� ������
      //� 1-���������������� ����������
      if ENSubstation04Obj.chambersQuantity = 1 then
        begin
          TempENTransformer :=
            HTTPRIOENTransformer as ENTransformerControllerSoapPort;
          ENTransformerFilterObj := ENTransformerFilter.Create;
          SetNullIntProps(ENTransformerFilterObj);
          SetNullXSProps(ENTransformerFilterObj);
          ENTransformerFilterObj.conditionSQL :=
            'SUBSTATION04REFCODE = ' + IntToStr(ENSubstation04Obj.code);
          ENTransformerList := TempENTransformer.getScrollableFilteredList(
            ENTransformerFilterObj, 0, 1);
          try
            if High(ENTransformerList.list) > -1 then
              if ENTransformerList.list[0].code <> Low(Integer) then
                begin
                  if ENHighVoltageSellObj.transformerRef = nil then
                    ENHighVoltageSellObj.transformerRef :=
                      ENTransformerRef.Create;
                  ENHighVoltageSellObj.transformerRef.code :=
                    ENTransformerList.list[0].code;
                  strTransformer := ENTransformerList.list[0].name;
                  if ENTransformerList.list[0].nominalPower <> nil then
                    strTransformer := strTransformer + '. P = ' +
                      ENTransformerList.list[0].nominalPower.DecimalString
                      + ' ���';
                  if ENTransformerList.list[0].transformerTypeCode <>
                    low(Integer)
                  then
                    strTransformer := strTransformer + '. ' +
                      ENTransformerList.list[0].transformerTypeName;
                  if ENTransformerList.list[0].invNumber <> '' then
                    strTransformer := strTransformer + '. ���. � ' +
                      ENTransformerList.list[0].invNumber;
                end;
          finally
            ENTransformerList.Free;
            ENTransformerList := nil;
            ENTransformerFilterObj := nil;
          end;
        end;

      try
        frmENHighVoltageSellEdit :=
          TfrmENHighVoltageSellEdit.Create(Application, dsInsert);
        try
          frmENHighVoltageSellEdit.st04Code := ENSubstation04Obj.code;
          frmENHighVoltageSellEdit.memTransformer.Text := strTransformer;
          if frmENHighVoltageSellEdit.ShowModal = mrOk then
            if ENHighVoltageSellObj <> nil then
              begin
                UpdateGrid(Sender);
                TempENSafetyPrecautions := HTTPRIOENSafetyPrecautions
                  as ENSafetyPrecautionsControllerSoapPort;
                if ENSafetyPrecautionsHVCObj = nil then
                  ENSafetyPrecautionsHVCObj := ENSafetyPrecautions.Create;
                try
                  if ENSafetyPrecautionsHVCObj.substation04Ref = nil then
                    ENSafetyPrecautionsHVCObj.substation04Ref :=
                      ENSubstation04Ref.Create;
                  ENSafetyPrecautionsHVCObj.substation04Ref.code :=
                    ENSubstation04Obj.code;
                  if ENSafetyPrecautionsHVCObj.highVoltageSell = nil then
                    ENSafetyPrecautionsHVCObj.highVoltageSell := ENHighVoltageSellRef.Create;
                  ENSafetyPrecautionsHVCObj.highVoltageSell.code := StrToInt(
                    sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.RowCount - 1]);
                  if ENSafetyPrecautionsHVCObj.fencing = nil then
                    ENSafetyPrecautionsHVCObj.fencing := ENFencing.Create;
                  if frmENHighVoltageSellEdit.cbENFencing.ItemIndex <> -1 then
                    ENSafetyPrecautionsHVCObj.fencing.code :=
                      frmENHighVoltageSellEdit.cbENFencing.ItemIndex;
                  if ENSafetyPrecautionsHVCObj.lockType = nil then
                    ENSafetyPrecautionsHVCObj.lockType := ENLockType.Create;
                  if frmENHighVoltageSellEdit.rbLockTypeAbsent.Checked then
                    ENSafetyPrecautionsHVCObj.lockType.code := 0
                  else if frmENHighVoltageSellEdit.rbLockTypeInternal.Checked then
                    begin
                      ENSafetyPrecautionsHVCObj.lockType.code := 1;
                      if ENSafetyPrecautionsHVCObj.matLockRef = nil then
                        ENSafetyPrecautionsHVCObj.matLockRef := TKMaterialsRef.Create;
                      ENSafetyPrecautionsHVCObj.matLockRef.code := 500017912;
                    end
                  else if frmENHighVoltageSellEdit.rbLockTypeExternal.Checked then
                    begin
                      ENSafetyPrecautionsHVCObj.lockType.code := 2;
                      if ENSafetyPrecautionsHVCObj.matLockRef = nil then
                        ENSafetyPrecautionsHVCObj.matLockRef := TKMaterialsRef.Create;
                      ENSafetyPrecautionsHVCObj.matLockRef.code := 75000735;
                    end;
                  TempENSafetyPrecautions.add(ENSafetyPrecautionsHVCObj);
                finally
                  ENSafetyPrecautionsHVCObj.Free;
                  ENSafetyPrecautionsHVCObj := nil;
                end;
                sgENHighVoltageSell.Row := sgENHighVoltageSell.RowCount - 1;
                recalcHighVoltCells();
              end;
        finally
          frmENHighVoltageSellEdit.Free;
          frmENHighVoltageSellEdit := nil;
        end;
      finally
        ENHighVoltageSellObj.Free;
      end;
    end; //if pcSubstation04.ActivePage = tsHighVoltageParty then
end;


procedure TfrmENSubstation04Edit.actInsertENInspectionSheetExecute(Sender: TObject);
begin
  inherited;
  if pcSubstation04.ActivePage = tsENInspectionSheet then
  begin
    try
      frmENInspectionSheetAdd := TfrmENInspectionSheetAdd.Create(Application, dsInsert);
      frmENInspectionSheetAdd.elementType := ENSubstation04Obj.element.typeRef.code;

      frmENInspectionSheetAdd.ENInspectionSheetObj := ENInspectionSheet.Create;
      SetNullIntProps(frmENInspectionSheetAdd.ENInspectionSheetObj);
      SetNullXSProps(frmENInspectionSheetAdd.ENInspectionSheetObj);

      frmENInspectionSheetAdd.ENInspectionSheetObj.elementRef := ENElementRef.Create;
      frmENInspectionSheetAdd.ENInspectionSheetObj.elementRef.code := ENSubstation04Obj.element.code;
      frmENInspectionSheetAdd.ENInspectionSheetObj.equipmentKind := EQUIPMENTKIND_LOW_VOLTAGE;

      try
        if frmENInspectionSheetAdd.ShowModal = mrOk then
        begin
          if frmENInspectionSheetAdd.ENInspectionSheetObj <> nil then
            pcSubstation04Change(Sender);
        end;
      finally
        frmENInspectionSheetAdd.Free;
        frmENInspectionSheetAdd:=nil;
      end;
    finally
      // ENInspectionSheetObj.Free;
    end;
  end;
end;


procedure TfrmENSubstation04Edit.actInsertEquipmentExecute(Sender: TObject);
var
  TempENDisconnector: ENDisconnectorControllerSoapPort;
  TempENLoadSwitch: ENLoadSwitchControllerSoapPort;
  TempENFuse, TempENFuseLVB: ENFuseControllerSoapPort;
  TempENInsulator: ENInsulatorControllerSoapPort;
  TempENArrester: ENArresterControllerSoapPort;
  TempENCurrentTransformer: ENCurrentTransformerControllerSoapPort;
  TempENBus: ENBusControllerSoapPort;
  TempENMeasurDevice, TempENMeasurDeviceLVB: ENMeasurDeviceControllerSoapPort;
  //TempENLine10: ENLine10ControllerSoapPort;
  //TempENLineCable: ENLineCableControllerSoapPort;
  TempENContactBreaker: ENContactBreakerControllerSoapPort;
  TempENAutomat: ENAutomatControllerSoapPort;
  TempENBranch: ENBranchControllerSoapPort;
  ENBranchObj: ENBranch;
  TempENLowVoltBoard: ENLowVoltBoardControllerSoapPort;
  ENLowVoltBoardObj: ENLowVoltBoard;
begin
  if pcSubstation04.ActivePage = tsHighVoltageParty then
    begin //���������� ��������� �� �������������� ������� ���������� 6 - 10 / 0,4 ��
      if pcHighVoltageParty.ActivePage = tsDisconnector then
        begin //���������� ������������� � ������������ ��������� �������������� ������
          TempENDisconnector :=
            HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;
          ENDisconnectorObj := ENDisconnector.Create;
          SetNullIntProps(ENDisconnectorObj);
          SetNullXSProps(ENDisconnectorObj);

          ENDisconnectorObj.element := ENElement.Create;
          ENDisconnectorObj.element.elementInRef := ENElementRef.Create;
          ENDisconnectorObj.element.elementInRef.code :=
            ENSubstation04Obj.element.code;
          ENDisconnectorObj.element.renRef := EPRenRef.Create;
          ENDisconnectorObj.element.renRef.code :=
            ENSubstation04Obj.element.renRef.code;

          try

            if ENDisconnectorObj.line10Ref <> nil then
              begin
                ENDisconnectorObj.line10Ref.Free;
                ENDisconnectorObj.line10Ref := nil;
              end;

            if ENDisconnectorObj.postRef <> nil then
              begin
                ENDisconnectorObj.postRef.Free;
                ENDisconnectorObj.postRef := nil;
              end;

            if ENDisconnectorObj.highvoltageSell = nil then
              ENDisconnectorObj.highvoltageSell := ENHighVoltageSell.Create();
            ENDisconnectorObj.highvoltageSell.code :=
              StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);

            frmENDisconnectorEdit :=
              TfrmENDisconnectorEdit.Create(Application, dsInsert);

            (*deviceParty := partyHVS; //������������� ��������� �� �������������� �������*)

            try

              (*frmENDisconnectorEdit.edtENDisconnectorTypeName.Text := '�� ����������';
              if ENDisconnectorObj.disconnectorType = nil then
                ENDisconnectorObj.disconnectorType := ENDisconnectorType.Create();
              ENDisconnectorObj.disconnectorType.code := 500000000;

              frmENDisconnectorEdit.edtENDisconnectorDriveTypeName.Text := '�� ����������';
              if ENDisconnectorObj.disconnectordriveType = nil then
                ENDisconnectorObj.disconnectordriveType :=
                  ENDisconnectorDriveType.Create();
              ENDisconnectorObj.disconnectordriveType.code := 500000000;*)

              frmENDisconnectorEdit.spbENHighVoltageSell.Enabled := False;
              frmENDisconnectorEdit.edtENHighVoltageSellName.Text :=
                '������ � ' + sgENHighVoltageSell.Cells[3, sgENHighVoltageSell.Row];
              frmENDisconnectorEdit.edtDispName.Text := '���''�������';

              //������� ����� �������������� ������������� � �� 6 - 10 ��
              frmENDisconnectorEdit.lblENLine10.Visible := False;
              frmENDisconnectorEdit.memENLine10.Visible := False;
              frmENDisconnectorEdit.lblENPostRefNubmerGen.Visible := False;
              frmENDisconnectorEdit.edtENPostRefNubmerGen.Visible := False;
              frmENDisconnectorEdit.btnOk.Top :=
                frmENDisconnectorEdit.edtENHighVoltageSellName.Top +
                frmENDisconnectorEdit.edtENHighVoltageSellName.Height + 10;
              frmENDisconnectorEdit.btnCancel.Top :=
                frmENDisconnectorEdit.btnOk.Top;
              frmENDisconnectorEdit.Height := frmENDisconnectorEdit.btnOk.Top +
                frmENDisconnectorEdit.btnOk.Height + 30;

              //����� ����� ���������� �������������
              if frmENDisconnectorEdit.ShowModal = mrOk then
                if ENDisconnectorObj <> nil then
                  begin
                    UpdateGrid(Sender);
                    recalcDisconnectors();
                  end;
            finally
              frmENDisconnectorEdit.Free;
              frmENDisconnectorEdit := nil;
            end;
          finally
            ENDisconnectorObj.Free;
          end;
        end; //if pcHighVoltageParty.ActivePage = tsDisconnector then

      if pcHighVoltageParty.ActivePage = tsLoadSwitch then
        begin //���������� ����������� �������� � ������������ ��������� �������������� ������
          TempENLoadSwitch :=
            HTTPRIOENLoadSwitch as ENLoadSwitchControllerSoapPort;
          ENLoadSwitchObj := ENLoadSwitch.Create;
          SetNullIntProps(ENLoadSwitchObj);
          SetNullXSProps(ENLoadSwitchObj);

          ENLoadSwitchObj.element := ENElement.Create;
          ENLoadSwitchObj.element.elementInRef := ENElementRef.Create;
          ENLoadSwitchObj.element.elementInRef.code :=
            ENSubstation04Obj.element.code;
          ENLoadSwitchObj.element.renRef := EPRenRef.Create;
          ENLoadSwitchObj.element.renRef.code :=
            ENSubstation04Obj.element.renRef.code;

          try
            if ENLoadSwitchObj.highvoltageSell = nil then
              ENLoadSwitchObj.highvoltageSell := ENHighVoltageSell.Create();
            ENLoadSwitchObj.highvoltageSell.code :=
              StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);

            frmENLoadSwitchEdit :=
              TfrmENLoadSwitchEdit.Create(Application, dsInsert);

            (*deviceParty := partyHVS; //����������� �������� ��������� �� �������������� �������*)
            try
              (*frmENLoadSwitchEdit.edtENLoadSwitchTypeName.Text := '�� ����������';
              if ENLoadSwitchObj.LoadSwitchType = nil then
                ENLoadSwitchObj.LoadSwitchType := ENLoadSwitchType.Create();
              ENLoadSwitchObj.LoadSwitchType.code := 500000000;

              frmENLoadSwitchEdit.edtENLoadSwitchDriveType.Text := '�� ����������';
              if ENLoadSwitchObj.LoadSwitchdriveType = nil then
                ENLoadSwitchObj.LoadSwitchdriveType :=
                  ENLoadSwitchDriveType.Create();
              ENLoadSwitchObj.LoadSwitchdriveType.code := 500000000;*)
              frmENLoadSwitchEdit.edtDispName.Text := '������� ������������';
              frmENLoadSwitchEdit.spbENHighVoltageSell.Enabled := False;
              frmENLoadSwitchEdit.edtENHighVoltageSellName.Text :=
                '������ � ' + sgENHighVoltageSell.Cells[3, sgENHighVoltageSell.Row];

              //���������������� ���������� 10 - 6 / 0,4 �� ����������� ��������
              frmENLoadSwitchEdit.memENSubstation04.Text :=
                ENSubstation04Obj.name;
              if ENSubstation04Obj.nominalPower <> nil then
                frmENLoadSwitchEdit.memENSubstation04.Text :=
                  frmENLoadSwitchEdit.memENSubstation04.Text + ', P = '
                  + ENSubstation04Obj.nominalPower.DecimalString + '���';
              if ENSubstation04Obj.invNumber <> '' then
                frmENLoadSwitchEdit.memENSubstation04.Text :=
                  frmENLoadSwitchEdit.memENSubstation04.Text + ', ���. � '
                  + ENSubstation04Obj.invNumber;

              //�������� ����� ���������� ����������� ��������
              if frmENLoadSwitchEdit.ShowModal = mrOk then
                if ENLoadSwitchObj <> nil then
                  begin
                    UpdateGrid(Sender);
                    recalcLoadSwitches();
                  end;
            finally
              frmENLoadSwitchEdit.Free;
              frmENLoadSwitchEdit := nil;
            end;
          finally
            ENLoadSwitchObj.Free;
          end;
        end; //if pcHighVoltageParty.ActivePage = tsLoadSwitch then

      if pcHighVoltageParty.ActivePage = tsFuse then
        begin //���������� �������������� � ������������ ��������� �������������� ������
          TempENFuse :=
            HTTPRIOENFuse as ENFuseControllerSoapPort;
          ENFuseObj := ENFuse.Create;
          SetNullIntProps(ENFuseObj);
          SetNullXSProps(ENFuseObj);

          ENFuseObj.element := ENElement.Create;
          ENFuseObj.element.elementInRef := ENElementRef.Create;
          ENFuseObj.element.elementInRef.code :=
            ENSubstation04Obj.element.code;
          ENFuseObj.element.renRef := EPRenRef.Create;
          ENFuseObj.element.renRef.code :=
            ENSubstation04Obj.element.renRef.code;

          deviceParty := partyHVS; //�������������� ��������� �� �������������� �������
          try
            frmENFuseEdit := TfrmENFuseEdit.Create(Application, dsInsert);
            try
              frmENFuseEdit.spbENBranch.Enabled := False;
              (*frmENFuseEdit.edtENFuseTypeName.Text := '�� ����������';
              if ENFuseObj.FuseType = nil then
                ENFuseObj.FuseType := ENFuseType.Create();
              ENFuseObj.FuseType.code := 500000000;*)
              frmENFuseEdit.edtDispName.Text := '���������';
              frmENFuseEdit.spbENHighVoltageSell.Enabled := False;
              frmENFuseEdit.edtENHighVoltageSellName.Text :=
                '������ � ' + sgENHighVoltageSell.Cells[3, sgENHighVoltageSell.Row];
              if ENFuseObj.highVoltageSell = nil then
                ENFuseObj.highVoltageSell := ENHighVoltageSell.Create();
              ENFuseObj.highVoltageSell.code :=
                StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);

              frmENFuseEdit.codeS04 := ENSubstation04Obj.code;
              if ENSubstation04Obj.element <> nil then
                if ENSubstation04Obj.element.code <> low(Integer) then
                  frmENFuseEdit.elementCodeS04 :=
                    ENSubstation04Obj.element.code;
              frmENFuseEdit.memENSubstation04.Text := ENSubstation04Obj.name;
              if ENSubstation04Obj.nominalPower <> nil then
                frmENFuseEdit.memENSubstation04.Text :=
                  frmENFuseEdit.memENSubstation04.Text + ', P = '
                  + ENSubstation04Obj.nominalPower.DecimalString;
              if ENSubstation04Obj.invNumber <> '' then
                frmENFuseEdit.memENSubstation04.Text :=
                  frmENFuseEdit.memENSubstation04.Text + ', ���. � '
                  + ENSubstation04Obj.invNumber;

              frmENFuseEdit.memTransformer.Text := //�������������
                sgENHighVoltageSell.Cells[4, sgENHighVoltageSell.Row];

              //��������������� ��������� �� ������ ������� �����������
              frmENFuseEdit.lblTransformer.Top := frmENFuseEdit.lblBranch.Top;
              frmENFuseEdit.memTransformer.Top :=
                frmENFuseEdit.memENBranchName.Top;
              frmENFuseEdit.btnOk.Top := frmENFuseEdit.memTransformer.Top
                + frmENFuseEdit.memTransformer.Height + 10;
              frmENFuseEdit.btnCancel.Top := frmENFuseEdit.btnOk.Top;
              frmENFuseEdit.Height := frmENFuseEdit.btnOk.Top
                + frmENFuseEdit.btnOk.Height + 30;

              //�������� ����� ���������� �������������� (�� ��������������
              if frmENFuseEdit.ShowModal = mrOk then //������)
                if ENFuseObj <> nil then
                  begin
                    UpdateGrid(Sender);
                    recalcFuses();
                  end;
            finally
              frmENFuseEdit.Free;
              frmENFuseEdit := nil;
            end;
          finally
            ENFuseObj.Free;
          end;
        end; //if pcHighVoltageParty.ActivePage = tsFuse then

      if pcHighVoltageParty.ActivePage = tsInsulator then
        begin //���������� ��������� � ������������ ��������� �������������� ������
          TempENInsulator :=
            HTTPRIOENInsulator as ENInsulatorControllerSoapPort;
          ENInsulatorObj := ENInsulator.Create;
          SetNullIntProps(ENInsulatorObj);
          SetNullXSProps(ENInsulatorObj);

          ENInsulatorObj.element := ENElement.Create;
          ENInsulatorObj.element.elementInRef := ENElementRef.Create;
          ENInsulatorObj.element.elementInRef.code :=
            ENSubstation04Obj.element.code;
          ENInsulatorObj.element.renRef := EPRenRef.Create;
          ENInsulatorObj.element.renRef.code :=
            ENSubstation04Obj.element.renRef.code;

          try

            if ENInsulatorObj.highvoltageSell = nil then
              ENInsulatorObj.highvoltageSell := ENHighVoltageSell.Create();
            ENInsulatorObj.highvoltageSell.code :=
              StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);

            if ENInsulatorObj.line10Ref <> nil then
              begin
                ENInsulatorObj.line10Ref.Free;
                ENInsulatorObj.line10Ref := nil;
              end;

            if ENInsulatorObj.postRef <> nil then
              begin
                ENInsulatorObj.postRef.Free;
                ENInsulatorObj.postRef := nil;
              end;

            frmENInsulatorEdit :=
              TfrmENInsulatorEdit.Create(Application, dsInsert);
            (*deviceParty := partyHVS; //�������� ��������� �� �������������� �������*)
            try
              (*frmENInsulatorEdit.edtENInsulatorTypeName.Text := '�� ����������';
              if ENInsulatorObj.InsulatorType = nil then
                ENInsulatorObj.InsulatorType := ENInsulatorType.Create();
              ENInsulatorObj.InsulatorType.code := 500000000;*)

              frmENInsulatorEdit.edtDispName.Text := '��������';
              frmENInsulatorEdit.spbENHighVoltageSell.Enabled := False;
              frmENInsulatorEdit.edtENHighVoltageSellName.Text :=
                '������ � ' + sgENHighVoltageSell.Cells[3, sgENHighVoltageSell.Row];

              //frmENInsulatorEdit.codeS04 := ENSubstation04Obj.code;
              frmENInsulatorEdit.memENSubstation04.Text :=
                ENSubstation04Obj.name;
              if ENSubstation04Obj.nominalPower <> nil then
                frmENInsulatorEdit.memENSubstation04.Text :=
                  frmENInsulatorEdit.memENSubstation04.Text + ', P = '
                  + ENSubstation04Obj.nominalPower.DecimalString;
              if ENSubstation04Obj.invNumber <> '' then
                frmENInsulatorEdit.memENSubstation04.Text :=
                  frmENInsulatorEdit.memENSubstation04.Text + ', ���. � '
                  + ENSubstation04Obj.invNumber;

              //������� ����� �������������� ��������� � �� 6 - 10 ��
              frmENInsulatorEdit.lblENLine10.Visible := False;
              frmENInsulatorEdit.memENLine10.Visible := False;
              frmENInsulatorEdit.lblENPostRefNubmerGen.Visible := False;
              frmENInsulatorEdit.edtENPostRefNubmerGen.Visible := False;
              frmENInsulatorEdit.btnOk.Top :=
                frmENInsulatorEdit.edtENHighVoltageSellName.Top +
                frmENInsulatorEdit.edtENHighVoltageSellName.Height + 10;
              frmENInsulatorEdit.btnCancel.Top :=
                frmENInsulatorEdit.btnOk.Top;
              frmENInsulatorEdit.Height := frmENInsulatorEdit.btnOk.Top +
                frmENInsulatorEdit.btnOk.Height + 30;

              //����� ����� ���������� ���������
              if frmENInsulatorEdit.ShowModal = mrOk then
                if ENInsulatorObj <> nil then
                  begin
                    UpdateGrid(Sender);
                    recalcInsulators();
                  end;
            finally
              frmENInsulatorEdit.Free;
              frmENInsulatorEdit := nil;
            end;
          finally
            ENInsulatorObj.Free;
          end;
        end; //if pcHighVoltageParty.ActivePage = tsInsulator then

      if pcHighVoltageParty.ActivePage = tsArrester then
        begin //���������� ���������� � ������������ ��������� �������������� ������
          TempENArrester :=
            HTTPRIOENArrester as ENArresterControllerSoapPort;
          ENArresterObj := ENArrester.Create;
          SetNullIntProps(ENArresterObj);
          SetNullXSProps(ENArresterObj);

          ENArresterObj.element := ENElement.Create;
          ENArresterObj.element.elementInRef := ENElementRef.Create;
          ENArresterObj.element.elementInRef.code :=
            ENSubstation04Obj.element.code;
          ENArresterObj.element.renRef := EPRenRef.Create;
          ENArresterObj.element.renRef.code :=
            ENSubstation04Obj.element.renRef.code;

          try
            frmENArresterEdit :=
              TfrmENArresterEdit.Create(Application, dsInsert);
            (*deviceParty := partyHVS; //��������� ��������� �� �������������� �������*)
            try
              (*frmENArresterEdit.edtENArresterTypeName.Text := '�� ����������';
              if ENArresterObj.arresterType = nil then
                ENArresterObj.arresterType := ENArresterType.Create();
              ENArresterObj.arresterType.code := 500000000;*)

              frmENArresterEdit.spbENHighVoltageSell.Enabled := False;
              frmENArresterEdit.edtENHighVoltageSellName.Text :=
                '������ � ' + sgENHighVoltageSell.Cells[3, sgENHighVoltageSell.Row];
              frmENArresterEdit.edtDispName.Text := '���������';
              //ENArresterObj.name := frmENArresterEdit.edtDispName.Text;

              if ENArresterObj.arresterSite = nil then
                ENArresterObj.arresterSite := ENArresterSite.Create();
              ENArresterObj.arresterSite.code := 500000000;

              frmENArresterEdit.edtENArresterSiteName.Text := '�� ���������';
              frmENArresterEdit.spbENLowVoltBoard.Enabled := False;
              if ENArresterObj.highvoltageSell = nil then
                ENArresterObj.highvoltageSell := ENHighVoltageSell.Create();
              ENArresterObj.highvoltageSell.code :=
                StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);

              //frmENArresterEdit.codeS04 := ENSubstation04Obj.code;
              frmENArresterEdit.memENSubstation04.Text := ENSubstation04Obj.name;
              if ENSubstation04Obj.nominalPower <> nil then
                frmENArresterEdit.memENSubstation04.Text :=
                  frmENArresterEdit.memENSubstation04.Text + ', P = '
                  + ENSubstation04Obj.nominalPower.DecimalString;
              if ENSubstation04Obj.invNumber <> '' then
                frmENArresterEdit.memENSubstation04.Text :=
                  frmENArresterEdit.memENSubstation04.Text + ', ���. � '
                  + ENSubstation04Obj.invNumber;

              if frmENArresterEdit.ShowModal = mrOk then
                if ENArresterObj <> nil then
                  begin
                    UpdateGrid(Sender);
                    recalcArresters();
                  end;
            finally
              frmENArresterEdit.Free;
              frmENArresterEdit := nil;
            end;
          finally
            ENArresterObj.Free;
          end;
        end; //if pcHighVoltageParty.ActivePage = tsArrester then

      if pcHighVoltageParty.ActivePage = tsCurrentTransformer then
        begin //���������� �������������� ���� � ������������ ��������� �������������� ������
          TempENCurrentTransformer :=
            HTTPRIOENCurrentTransformer as ENCurrentTransformerControllerSoapPort;
          ENCurrentTransformerObj := ENCurrentTransformer.Create;
          SetNullIntProps(ENCurrentTransformerObj);
          SetNullXSProps(ENCurrentTransformerObj);

          ENCurrentTransformerObj.element := ENElement.Create;
          ENCurrentTransformerObj.element.elementInRef := ENElementRef.Create;
          ENCurrentTransformerObj.element.elementInRef.code :=
            ENSubstation04Obj.element.code;
          ENCurrentTransformerObj.element.renRef := EPRenRef.Create;
          ENCurrentTransformerObj.element.renRef.code :=
            ENSubstation04Obj.element.renRef.code;

          try
            frmENCurrentTransformerEdit :=
              TfrmENCurrentTransformerEdit.Create(Application, dsInsert);
            (*deviceParty := partyHVS; //������������� ���� ��������� �� �������������� �������*)
            try
              (*frmENCurrentTransformerEdit.edtENCurrentTransformerTypeName.Text :=
                '�� ����������';
              if ENCurrentTransformerObj.currentTransformerType = nil then
                ENCurrentTransformerObj.currentTransformerType :=
                  ENCurrentTransformerType.Create();
              ENCurrentTransformerObj.currentTransformerType.code := 500000000;*)

              frmENCurrentTransformerEdit.edtDispName.Text :=
                '������������� ����';
              frmENCurrentTransformerEdit.spbENHighVoltageSell.Enabled := False;
              frmENCurrentTransformerEdit.edtENHighVoltageSellName.Text :=
                '������ � ' + sgENHighVoltageSell.Cells[3, sgENHighVoltageSell.Row];
              if ENCurrentTransformerObj.highvoltageSell = nil then
                ENCurrentTransformerObj.highvoltageSell := ENHighVoltageSell.Create();
              ENCurrentTransformerObj.highvoltageSell.code :=
                StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);

              if frmENCurrentTransformerEdit.ShowModal = mrOk then
                if ENCurrentTransformerObj <> nil then
                  begin
                    UpdateGrid(Sender);
                    recalcCurrentTransformers();
                  end;
            finally
              frmENCurrentTransformerEdit.Free;
              frmENCurrentTransformerEdit := nil;
            end;
          finally
            ENCurrentTransformerObj.Free;
          end;
        end; //if pcHighVoltageParty.ActivePage = tsCurrentTransformer then

      if pcHighVoltageParty.ActivePage = tsBus then
        begin //���������� ���� � ������������ ��������� �������������� ������
          TempENBus :=
            HTTPRIOENBus as ENBusControllerSoapPort;
          ENBusObj := ENBus.Create;
          SetNullIntProps(ENBusObj);
          SetNullXSProps(ENBusObj);

          ENBusObj.element := ENElement.Create;
          ENBusObj.element.elementInRef := ENElementRef.Create;
          ENBusObj.element.elementInRef.code :=
            ENSubstation04Obj.element.code;
          ENBusObj.element.renRef := EPRenRef.Create;
          ENBusObj.element.renRef.code :=
            ENSubstation04Obj.element.renRef.code;

          try
            frmENBusEdit :=
              TfrmENBusEdit.Create(Application, dsInsert);
            (*deviceParty := partyHVS; //������������� ���� ��������� �� �������������� �������*)
            try
              (*frmENBusEdit.edtENInsulatorTypeName.Text := '�� ����������';
              ENBusObj.insulatorType := ENInsulatorType.Create();
              ENBusObj.insulatorType.code := 500000000;*)
              frmENBusEdit.edtDispName.Text := '���� ����������';
              frmENBusEdit.spbENHighVoltageSell.Enabled := False;
              frmENBusEdit.edtENHighVoltageSellName.Text := '������ � ' +
                sgENHighVoltageSell.Cells[3, sgENHighVoltageSell.Row];
              if ENBusObj.highvoltageSell = nil then
                ENBusObj.highvoltageSell := ENHighVoltageSell.Create();
              ENBusObj.highvoltageSell.code :=
                StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);
              if frmENBusEdit.ShowModal = mrOk then
                if ENBusObj <> nil then
                  begin
                    UpdateGrid(Sender);
                    recalcBuses();
                  end;
            finally
              frmENBusEdit.Free;
              frmENBusEdit := nil;
            end;
          finally
            ENBusObj.Free;
          end;
        end; //if pcHighVoltageParty.ActivePage = tsBus then

      if pcHighVoltageParty.ActivePage = tsMeasurDevice then
        begin //���������� �������������� ������� � ������������ ��������� �������������� ������
          TempENMeasurDevice :=
            HTTPRIOENMeasurDevice as ENMeasurDeviceControllerSoapPort;
          ENMeasurDeviceObj := ENMeasurDevice.Create;

          SetNullIntProps(ENMeasurDeviceObj);
          SetNullXSProps(ENMeasurDeviceObj);

          ENMeasurDeviceObj.element := ENElement.Create;
          ENMeasurDeviceObj.element.elementInRef := ENElementRef.Create;
          ENMeasurDeviceObj.element.elementInRef.code :=
            ENSubstation04Obj.element.code;
          ENMeasurDeviceObj.element.renRef := EPRenRef.Create;
          ENMeasurDeviceObj.element.renRef.code :=
            ENSubstation04Obj.element.renRef.code;

          deviceParty := partyHVS; //������������� ������ ��������� �� �������������� �������
          try
            frmENMeasurDeviceEdit :=
              TfrmENMeasurDeviceEdit.Create(Application, dsInsert);
            try
              frmENMeasurDeviceEdit.memENBranchName.Enabled := False;
              (*frmENMeasurDeviceEdit.edtENMeasurDeviceType.Text := '�� ����������';
              ENMeasurDeviceObj.measurDeviceType := ENMeasurDeviceType.Create();
              ENMeasurDeviceObj.measurDeviceType.code := 500000000;*)

              frmENMeasurDeviceEdit.edtDispName.Text := '������������ ������';
              frmENMeasurDeviceEdit.spbENHighVoltageSell.Enabled := False;
              frmENMeasurDeviceEdit.edtENHighVoltageSellName.Text := '������ � ' +
                sgENHighVoltageSell.Cells[3, sgENHighVoltageSell.Row];
              frmENMeasurDeviceEdit.spbENBranch.Enabled := False;
              if ENMeasurDeviceObj.highvoltageSell = nil then
                ENMeasurDeviceObj.highvoltageSell := ENHighVoltageSell.Create();
              ENMeasurDeviceObj.highvoltageSell.code :=
                StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);

              frmENMeasurDeviceEdit.memTransformer.Text := //�������������
                sgENHighVoltageSell.Cells[4, sgENHighVoltageSell.Row];

              if frmENMeasurDeviceEdit.ShowModal = mrOk then
                if ENMeasurDeviceObj<>nil then
                  begin
                    UpdateGrid(Sender);
                    recalcMeasurDevices();
                  end;
            finally
              frmENMeasurDeviceEdit.Free;
              frmENMeasurDeviceEdit := nil;
            end;
          finally
            ENMeasurDeviceObj.Free;
          end;
        end; //if pcHighVoltageParty.ActivePage = tsMeasurDevice then

      (*����������� ���������� ��������� � ��������� ����� �� �����
      �������������� ���������� 6 - 10 / 0,4 �� ���������
      �� ��������� ����������� ������� ������������� �������

      if pcHighVoltageParty.ActivePage = tsElectricLineSupplies then
        begin //���������� ����� ������� ����������
          if rbENLine10.Checked then
            begin //���������� ��������� ����� 6 - 10 ��
              TempENLine10 :=
                HTTPRIOENLine10 as ENLine10ControllerSoapPort;
              ENLine10Obj := ENLine10.Create;

              SetNullIntProps(ENLine10Obj);
              SetNullXSProps(ENLine10Obj);

              ENLine10Obj.element := ENElement.Create;
              ENLine10Obj.element.elementInRef := ENElementRef.Create;
              ENLine10Obj.element.elementInRef.code :=
                ENSubstation04Obj.element.code;
              ENLine10Obj.element.renRef := EPRenRef.Create;
              ENLine10Obj.element.renRef.code :=
                ENSubstation04Obj.element.renRef.code;

              try
                frmENLine10Edit :=
                  TfrmENLine10Edit.Create(Application, dsInsert);

                frmENLine10Edit.spbENHighVoltageSell.Enabled := False;
                frmENLine10Edit.edtENHighVoltageSellName.Text := '������ � ' +
                  sgENHighVoltageSell.Cells[3, sgENHighVoltageSell.Row];
                frmENLine10Edit.spbEPRen.Enabled := False;
                frmENLine10Edit.edtEPRenName.Enabled := False;
                frmENLine10Edit.edtEPRenName.Text :=
                  ENSubstation04Obj.element.renRef.name;
                if ENLine10Obj.highvoltageSell = nil then
                  ENLine10Obj.highvoltageSell := ENHighVoltageSellRef.Create();
                ENLine10Obj.highVoltageSell.code :=
                  StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);

                try
                  if frmENLine10Edit.ShowModal = mrOk then
                    if ENLine10Obj<>nil then
                      begin
                        UpdateGrid(Sender);
                        recalcLines10();
                      end;
                finally
                  frmENLine10Edit.Free;
                  frmENLine10Edit := nil;
                end;
              finally
                ENLine10Obj.Free;
              end;
            end
          else //if rbENLineCable.Checked then
            begin //���������� ��������� �����
              TempENLineCable :=
                HTTPRIOENLineCableSupplies as ENLineCableControllerSoapPort;
              ENLineCableObj := ENLineCable.Create;

              SetNullIntProps(ENLineCableObj);
              SetNullXSProps(ENLineCableObj);

              ENLineCableObj.element := ENElement.Create;
              ENLineCableObj.element.elementInRef := ENElementRef.Create;
              ENLineCableObj.element.elementInRef.code :=
                ENSubstation04Obj.element.code;
              ENLineCableObj.element.renRef := EPRenRef.Create;
              ENLineCableObj.element.renRef.code :=
                ENSubstation04Obj.element.renRef.code;

              try
                frmENLineCableEdit :=
                  TfrmENLineCableEdit.Create(Application, dsInsert);

                frmENLineCableEdit.spbENHighVoltageSell.Enabled := False;
                frmENLineCableEdit.edtENHighVoltageSellName.Text := '������ � ' +
                  sgENHighVoltageSell.Cells[3, sgENHighVoltageSell.Row];
                frmENLineCableEdit.spbEPRen.Enabled := False;
                frmENLineCableEdit.edtEPRenName.Enabled := False;
                frmENLineCableEdit.edtEPRenName.Text :=
                  ENSubstation04Obj.element.renRef.name;

                if ENLineCableObj.highvoltageSell = nil then
                  ENLineCableObj.highvoltageSell := ENHighVoltageSellRef.Create();
                ENLineCableObj.highvoltageSell.code :=
                  StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);
                try
                  if frmENLineCableEdit.ShowModal = mrOk then
                    if ENLineCableObj <> nil then
                      begin
                        UpdateGrid(Sender);
                        recalcLinesCable();
                      end;
                finally
                  frmENLineCableEdit.Free;
                  frmENLineCableEdit := nil;
                end;
              finally
                ENLineCableObj.Free;
              end;
            end;
        end; //if pcHighVoltageParty.ActivePage = tsElectricLineSupplies then
        *)
    end //if pcSubstation04.ActivePage = tsHighVoltageParty then
  else if pcSubstation04.ActivePage = tsLowVoltageBoard then
    begin //���������� ��������� �� ������������� ������� ���������� 6 - 10 / 0,4 ��
      if pcBoardEquipment.ActivePage = tsContactBreakerLVB then
        begin //���������� ���������� �� ������������� ������� ����������
          if not (chbLowVoltBoard.Checked) then //���� �� ��������� � ������� ���� �� ����
            if recalcContactBreakersBr(sgENBranch.Cells[0, sgENBranch.Row]) >= 1
            then
              begin
                Application.MessageBox(
                  PChar('����������� �� ����� ���� ������ ������ �� �������������!'),
                  PChar('��������!'), MB_ICONWARNING + MB_OK);
                Exit;
              end;
          TempENContactBreaker :=
            HTTPRIOENContactBreaker as ENContactBreakerControllerSoapPort;
          ENContactBreakerObj := ENContactBreaker.Create;
          SetNullIntProps(ENContactBreakerObj);
          SetNullXSProps(ENContactBreakerObj);
          ENContactBreakerObj.element := ENElement.Create;
          ENContactBreakerObj.element.elementInRef := ENElementRef.Create;
          ENContactBreakerObj.element.elementInRef.code :=
            ENSubstation04Obj.element.code;
          ENContactBreakerObj.element.renRef := EPRenRef.Create;
          ENContactBreakerObj.element.renRef.code :=
            ENSubstation04Obj.element.renRef.code;
          if chbLowVoltBoard.Checked then
            begin //�������� �������������� ����
              ENContactBreakerObj.lvbRef := ENLowVoltBoardRef.Create();
              ENContactBreakerObj.lvbRef.code :=
                StrToInt(sgENLowVoltBoard.Cells[0, sgENLowVoltBoard.Row]);
              deviceParty := partyLVBM; //��������� ��������� �� ������������� ����
            end
          else
            begin //�������� ������������� � ��������� �����
              ENContactBreakerObj.branch := ENBranchRef.Create();
              ENContactBreakerObj.branch.code :=
                StrToInt(sgENBranch.Cells[0, sgENBranch.Row]);
              deviceParty := partyLVBP; //��������� ��������� �� ������ �� ����
            end;
          try
            if chbLowVoltBoard.Checked then
              begin
                TempENLowVoltBoard :=
                  HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
                ENLowVoltBoardObj := TempENLowVoltBoard.getObject(
                  StrToInt(sgENLowVoltBoard.Cells[0, sgENLowVoltBoard.Row]))
              end
            else
              begin
                TempENBranch := HTTPRIOENBranch as ENBranchControllerSoapPort;
                ENBranchObj := TempENBranch.getObject(
                  StrToInt(sgENBranch.Cells[0, sgENBranch.Row]));
              end;
            frmENContactBreakerEdit :=
              TfrmENContactBreakerEdit.Create(Application, dsInsert);
            try
              frmENContactBreakerEdit.codeS04 := ENSubstation04Obj.code;
              if ENSubstation04Obj.element <> nil then
                if ENSubstation04Obj.element.code <> low(Integer) then
                  frmENContactBreakerEdit.elementCodeS04 :=
                    ENSubstation04Obj.element.code;

              frmENContactBreakerEdit.edtDispName.Text := '��������';
              if chbLowVoltBoard.Checked then
                begin
                  frmENContactBreakerEdit.lblBranch.Caption :=
                    '������������ �� ����';
                  frmENContactBreakerEdit.memENBranchName.Text :=
                    ENLowVoltBoardObj.name;
                end
              else
                begin
                  frmENContactBreakerEdit.lblBranch.Caption :=
                    '��������� �����';
                  frmENContactBreakerEdit.memENBranchName.Text :=
                    ENBranchObj.name;
                end;
              if frmENContactBreakerEdit.ShowModal = mrOk then
                if ENContactBreakerObj <> nil then
                  begin
                    UpdateGrid(Sender);
                    recalcContactBreakers();
                  end;
            finally
              ENLowVoltBoardObj.Free;
              ENBranchObj.Free;
              frmENContactBreakerEdit.Free;
              frmENContactBreakerEdit := nil;
            end;

          finally
            ENContactBreakerObj.Free;
          end;
        end //if pcBoardEquipment.ActivePage = tsContactBreakerLVB then
      else if pcBoardEquipment.ActivePage = tsFuseLVB then
        begin //���������� �������������� �� ������������� ������� ����������
          if not (chbLowVoltBoard.Checked) then //���� �� ��������� � ������� ���� �� ����
            if recalcFusesBr(sgENBranch.Cells[0, sgENBranch.Row]) >= 3
            then
              begin
                Application.MessageBox(
                  PChar('��������������� �� ����� ���� ������ ��� �� �������������!'),
                  PChar('��������!'), MB_ICONWARNING + MB_OK);
                Exit;
              end;
          TempENFuseLVB := HTTPRIOENFuse as ENFuseControllerSoapPort;
          ENFuseObj := ENFuse.Create;
          SetNullIntProps(ENFuseObj);
          SetNullXSProps(ENFuseObj);
          ENFuseObj.element := ENElement.Create;
          ENFuseObj.element.elementInRef := ENElementRef.Create;
          ENFuseObj.element.elementInRef.code :=
            ENSubstation04Obj.element.code;
          ENFuseObj.element.renRef := EPRenRef.Create;
          ENFuseObj.element.renRef.code :=
            ENSubstation04Obj.element.renRef.code;
          if chbLowVoltBoard.Checked then
            begin //�������� �������������� ����
              ENFuseObj.lvbRef := ENLowVoltBoardRef.Create();
              ENFuseObj.lvbRef.code :=
                StrToInt(sgENLowVoltBoard.Cells[0, sgENLowVoltBoard.Row]);
              deviceParty := partyLVBM; //�������������� ��������� �� ������������� ����
            end
          else
            begin //�������� ������������� � ��������� �����
              ENFuseObj.branch := ENBranch.Create();
              ENFuseObj.branch.code :=
                StrToInt(sgENBranch.Cells[0, sgENBranch.Row]);
              deviceParty := partyLVBP; //�������������� ��������� �� ������ �� ����
            end;
          try
            if chbLowVoltBoard.Checked then
              begin
                TempENLowVoltBoard :=
                  HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
                ENLowVoltBoardObj := TempENLowVoltBoard.getObject(
                  StrToInt(sgENLowVoltBoard.Cells[0, sgENLowVoltBoard.Row]))
              end
            else
              begin
                TempENBranch := HTTPRIOENBranch as ENBranchControllerSoapPort;
                ENBranchObj := TempENBranch.getObject(
                  StrToInt(sgENBranch.Cells[0, sgENBranch.Row]));
              end;
            frmENFuseEdit := TfrmENFuseEdit.Create(Application, dsInsert);
            try
              frmENFuseEdit.codeS04 := ENSubstation04Obj.code;
              if ENSubstation04Obj.element <> nil then
                if ENSubstation04Obj.element.code <> low(Integer) then
                  frmENFuseEdit.elementCodeS04 :=
                    ENSubstation04Obj.element.code;

              frmENFuseEdit.memENSubstation04.Text := ENSubstation04Obj.name;
              if ENSubstation04Obj.nominalPower <> nil then
                frmENFuseEdit.memENSubstation04.Text :=
                  frmENFuseEdit.memENSubstation04.Text + ', P = '
                  + ENSubstation04Obj.nominalPower.DecimalString;
              if ENSubstation04Obj.invNumber <> '' then
                frmENFuseEdit.memENSubstation04.Text :=
                  frmENFuseEdit.memENSubstation04.Text + ', ���. � '
                  + ENSubstation04Obj.invNumber;
              frmENFuseEdit.edtDispName.Text := '���������';
              frmENFuseEdit.lblENHighVoltageSellName.Visible := False;
              frmENFuseEdit.edtENHighVoltageSellName.Visible := False;
              frmENFuseEdit.spbENHighVoltageSell.Visible := False;
              frmENFuseEdit.lblBranch.Visible := True;
              frmENFuseEdit.memENBranchName.Visible := True;
              frmENFuseEdit.spbENBranch.Visible := True;
              if chbLowVoltBoard.Checked then
                begin
                  frmENFuseEdit.lblBranch.Caption := '������������ �� ����';
                  frmENFuseEdit.memENBranchName.Text := ENLowVoltBoardObj.name;
                end
              else
                begin
                  frmENFuseEdit.lblBranch.Caption := '��������� �����';
                  frmENFuseEdit.memENBranchName.Text := ENBranchObj.name;
                end;
              if frmENFuseEdit.ShowModal = mrOk then
                if ENFuseObj <> nil then
                  begin
                    UpdateGrid(Sender);
                    recalcFusesLVB();
                  end;
            finally
              ENLowVoltBoardObj.Free;
              ENBranchObj.Free;
              frmENFuseEdit.Free;
              frmENFuseEdit := nil;
            end;
          finally
            ENFuseObj.Free;
          end;
        end //else if pcBoardEquipment.ActivePage = tsFuseLVB then
      else if pcBoardEquipment.ActivePage = tsAutomatLVB then
        begin //���������� ��������������� ����������� �� ������������� ������� ����������
          if not (chbLowVoltBoard.Checked) then //���� �� ��������� � ������� ���� �� ����
            if recalcAutomatesBr(sgENBranch.Cells[0, sgENBranch.Row]) >= 1
            then
              begin
                Application.MessageBox(
                  PChar('�������������� ������������ �� ����� ���� ������ ������ �� �������������!'),
                  PChar('��������!'), MB_ICONWARNING + MB_OK);
                Exit;
              end;
          TempENAutomat := HTTPRIOENAutomat as ENAutomatControllerSoapPort;
          ENAutomatObj := ENAutomat.Create;
          SetNullIntProps(ENAutomatObj);
          SetNullXSProps(ENAutomatObj);
          ENAutomatObj.element := ENElement.Create;
          ENAutomatObj.element.elementInRef := ENElementRef.Create;
          ENAutomatObj.element.elementInRef.code :=
            ENSubstation04Obj.element.code;
          ENAutomatObj.element.renRef := EPRenRef.Create;
          ENAutomatObj.element.renRef.code :=
            ENSubstation04Obj.element.renRef.code;
          if chbLowVoltBoard.Checked then
            begin //�������� �������������� ����
              ENAutomatObj.lvbRef := ENLowVoltBoardRef.Create();
              ENAutomatObj.lvbRef.code :=
                StrToInt(sgENLowVoltBoard.Cells[0, sgENLowVoltBoard.Row]);
              deviceParty := partyLVBM; //�������������� ����������� ��������� �� ������������� ����
            end
          else
            begin //�������� ������������� � ��������� �����
              ENAutomatObj.branch := ENBranchRef.Create();
              ENAutomatObj.branch.code :=
                StrToInt(sgENBranch.Cells[0, sgENBranch.Row]);
              deviceParty := partyLVBP; //�������������� ����������� ��������� �� ������ �� ����
            end;
          //ENAutomatObj.markCurrent:= TXSDecimal.Create;
          //ENAutomatObj.thermalSplitterCurrent:= TXSDecimal.Create;
          try
            if chbLowVoltBoard.Checked then
              begin
                TempENLowVoltBoard :=
                  HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
                ENLowVoltBoardObj := TempENLowVoltBoard.getObject(
                  StrToInt(sgENLowVoltBoard.Cells[0, sgENLowVoltBoard.Row]))
              end
            else
              begin
                TempENBranch := HTTPRIOENBranch as ENBranchControllerSoapPort;
                ENBranchObj := TempENBranch.getObject(
                  StrToInt(sgENBranch.Cells[0, sgENBranch.Row]));
              end;
            frmENAutomatEdit := TfrmENAutomatEdit.Create(Application, dsInsert);
            try
              frmENAutomatEdit.codeS04 := ENSubstation04Obj.code;
              if ENSubstation04Obj.element <> nil then
                if ENSubstation04Obj.element.code <> low(Integer) then
                  frmENAutomatEdit.elementCodeS04 :=
                    ENSubstation04Obj.element.code;

              frmENAutomatEdit.edtDispName.Text := '������������ �������';
              if chbLowVoltBoard.Checked then
                begin
                  frmENAutomatEdit.lblBranch.Caption := '������������ �� ����';
                  frmENAutomatEdit.memENBranchName.Text := ENLowVoltBoardObj.name;
                end
              else
                begin
                  frmENAutomatEdit.lblBranch.Caption := '��������� �����';
                  frmENAutomatEdit.memENBranchName.Text := ENBranchObj.name;
                end;
              if frmENAutomatEdit.ShowModal = mrOk then
                if ENAutomatObj <> nil then
                  begin
                    UpdateGrid(Sender);
                    recalcAutomates();
                  end;
            finally
              ENLowVoltBoardObj.Free;
              ENBranchObj.Free;
              frmENAutomatEdit.Free;
              frmENAutomatEdit := nil;
            end;
          finally
            ENAutomatObj.Free;
          end;
        end //else if pcBoardEquipment.ActivePage = tsAutomatLVB then
      else if pcBoardEquipment.ActivePage = tsMeasurDeviceLVB then
        begin //���������� �������������� ���������� �� ������������� ������� ����������
          TempENMeasurDeviceLVB :=
            HTTPRIOENMeasurDevice as ENMeasurDeviceControllerSoapPort;
          ENMeasurDeviceObj := ENMeasurDevice.Create;
          SetNullIntProps(ENMeasurDeviceObj);
          SetNullXSProps(ENMeasurDeviceObj);
          ENMeasurDeviceObj.element := ENElement.Create;
          ENMeasurDeviceObj.element.elementInRef := ENElementRef.Create;
          ENMeasurDeviceObj.element.elementInRef.code :=
            ENSubstation04Obj.element.code;
          ENMeasurDeviceObj.element.renRef := EPRenRef.Create;
          ENMeasurDeviceObj.element.renRef.code :=
            ENSubstation04Obj.element.renRef.code;
          if chbLowVoltBoard.Checked then
            begin //�������� �������������� ����
              ENMeasurDeviceObj.lvbRef := ENLowVoltBoardRef.Create();
              ENMeasurDeviceObj.lvbRef.code :=
                StrToInt(sgENLowVoltBoard.Cells[0, sgENLowVoltBoard.Row]);
              deviceParty := partyLVBM; //������������� ���������� ��������� �� ������������� ����
            end
          else
            begin //�������� ������������� � ��������� �����
              ENMeasurDeviceObj.branch := ENBranch.Create();
              ENMeasurDeviceObj.branch.code :=
                StrToInt(sgENBranch.Cells[0, sgENBranch.Row]);
              deviceParty := partyLVBP; //������������� ���������� ��������� �� ������ �� ����
            end;
          try
            if chbLowVoltBoard.Checked then
              begin
                TempENLowVoltBoard :=
                  HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
                ENLowVoltBoardObj := TempENLowVoltBoard.getObject(
                  StrToInt(sgENLowVoltBoard.Cells[0, sgENLowVoltBoard.Row]))
              end
            else
              begin
                TempENBranch := HTTPRIOENBranch as ENBranchControllerSoapPort;
                ENBranchObj := TempENBranch.getObject(
                  StrToInt(sgENBranch.Cells[0, sgENBranch.Row]));
              end;
            frmENMeasurDeviceEdit :=
              TfrmENMeasurDeviceEdit.Create(Application, dsInsert);
            try
              frmENMeasurDeviceEdit.codeS04 := ENSubstation04Obj.code;
              if ENSubstation04Obj.element <> nil then
                if ENSubstation04Obj.element.code <> low(Integer) then
                  frmENMeasurDeviceEdit.elementCodeS04 :=
                    ENSubstation04Obj.element.code;

              frmENMeasurDeviceEdit.edtDispName.Text := '������������ ������';
              frmENMeasurDeviceEdit.lblENHighVoltageSellName.Visible := False;
              frmENMeasurDeviceEdit.edtENHighVoltageSellName.Visible := False;
              frmENMeasurDeviceEdit.spbENHighVoltageSell.Visible := False;
              frmENMeasurDeviceEdit.lblBranch.Visible := True;
              frmENMeasurDeviceEdit.memENBranchName.Visible := True;
              frmENMeasurDeviceEdit.spbENBranch.Visible := True;
              if chbLowVoltBoard.Checked then
                begin
                  frmENMeasurDeviceEdit.lblBranch.Caption := '������������ �� ����';
                  frmENMeasurDeviceEdit.memENBranchName.Text := ENLowVoltBoardObj.name;
                end
              else
                begin
                  frmENMeasurDeviceEdit.lblBranch.Caption := '��������� �����';
                  frmENMeasurDeviceEdit.memENBranchName.Text := ENBranchObj.name;
                end;
              if frmENMeasurDeviceEdit.ShowModal = mrOk then
                if ENMeasurDeviceObj <> nil then
                  begin
                    recalcMeasurDevicesLVB();
                    UpdateGrid(Sender);
                  end;
            finally
              ENLowVoltBoardObj.Free;
              ENBranchObj.Free;
              frmENMeasurDeviceEdit.Free;
              frmENMeasurDeviceEdit := nil;
            end;
          finally
            ENMeasurDeviceObj.Free;
          end;
        end; //else if pcBoardEquipment.ActivePage = tsMeasurDeviceLVB then
    end; //else if pcSubstation04.ActivePage = tsLowVoltageBoard then
end;

procedure TfrmENSubstation04Edit.pcSubstation04Change(Sender: TObject);
var
  i, n: Integer; Allow: Boolean;
  //TempENLine04: ENLine04ControllerSoapPort;
  //ENLine04List: ENLine04ShortList;
  TempENTransformer: ENTransformerControllerSoapPort;
  ENTransformerList: ENTransformerShortList;
  TempENHighVoltageSell: ENHighVoltageSellControllerSoapPort;
  ENHighVoltageSellList: ENHighVoltageSellShortList;
  TempENBranch: ENBranchControllerSoapPort;
  ENBranchList: ENBranchShortList;
  //ENBranchObj: ENBranch;
  TempENPanel: ENPanelControllerSoapPort;
  ENPanelList: ENPanelShortList;
  //ENPanelObj: ENPanel;
  TempENAct: ENActControllerSoapPort;
  ENActList: ENActShortList;
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  ENPlanWorkList: ENPlanWorkShortList;
  TempENFiderGuage: ENFiderGuageControllerSoapPort;
  ENFiderGuageList: ENFiderGuageShortList;
  strTimeGuage: String;
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
  ENInspectionSheetList: ENInspectionSheetShortList;
  inspectionSheetFilter: ENInspectionSheetFilter;
begin
  pnlReserv.Visible := (pcSubstation04.ActivePage = tsWorkFlow);
  if pcSubstation04.ActivePage = tsWorkFlow then
    begin
      frmENSubstation04Edit.Left := 120;
      frmENSubstation04Edit.Width := 1213;
      pcSubstation04.Width := 1205;
      actUpdateCNExecute(nil);
    end //if pcSubstation04.ActivePage = tsWorkFlow then
  else //if pcSubstation04.ActivePage <> tsWorkFlow then
    begin
      frmENSubstation04Edit.Width := 996;
      pcSubstation04.Width := 990;
    end; //else //if pcSubstation04.ActivePage <> tsWorkFlow then
  btnCancel.Left := frmENSubstation04Edit.Width - btnCancel.Width - 25;
  btnOk.Left := btnCancel.Left - btnOk.Width - 10;
  if pcSubstation04.ActivePage = tsFiderGuage then
    begin //���������� ������ ������� ���������� ��������
      SetGridHeaders(ENFiderGuageHeaders, sgENFiderGuage.ColumnHeaders);
      fgColCount := 100;
      TempENFiderGuage :=
        HTTPRIOENFiderGuage as ENFiderGuageControllerSoapPort;

      fgFilterObject := ENFiderGuageFilter.Create;
      SetNullIntProps(fgFilterObject);
      SetNullXSProps(fgFilterObject);

      fgFilterObject.conditionSQL := 'ENFIDERGUAGE.SUBSTATION04CODE = ' +
        IntToStr(ENSubstation04Obj.code);

      ENFiderGuageList := TempENFiderGuage.getScrollableFilteredList(
        ENFiderGuageFilter(fgFilterObject), 0, fgColCount);

      fgLastCount := High(ENFiderGuageList.list);

      if fgLastCount > -1 then
        sgENFiderGuage.RowCount := fgLastCount + 2
      else
        sgENFiderGuage.RowCount := 2;

        with sgENFiderGuage do
          for i := 0 to fgLastCount do
            begin
              Application.ProcessMessages;
              if ENFiderGuageList.list[i].code <> Low(Integer) then //���
                Cells[0, i + 1] := IntToStr(ENFiderGuageList.list[i].code)
              else
                Cells[0, i + 1] := '';
              strTimeGuage :=
                XSDateTime2String(ENFiderGuageList.list[i].dateGuage);
              if strTimeGuage = '00:00:00' then
                strTimeGuage := '';
              Cells[1, i + 1] := //���� � ����� ������
                XSDate2String(TXSDate(ENFiderGuageList.list[i].dateGuage)) +
                ' ' + strTimeGuage;
              //�������������
              Cells[2, i + 1] := ENFiderGuageList.list[i].transformerName;
              if ENFiderGuageList.list[i].transformerNominalPower <> nil then
                Cells[2, i + 1] := Cells[2, i + 1] + ' P = ' +
                  ENFiderGuageList.list[i
                    ].transformerNominalPower.DecimalString;
              if ENFiderGuageList.list[i].transformerInvNumber <> '' then
                Cells[2, i + 1] := Cells[2, i + 1] + '. ���. � ' +
                  ENFiderGuageList.list[i].transformerInvNumber;
              //������
              (*if ENFiderGuageList.list[i].branchRefCode <> low(Integer) then
                begin
                  TempENBranch := HTTPRIOENBranch as ENBranchControllerSoapPort;
                  ENBranchObj := TempENBranch.getObject(
                    ENFiderGuageList.list[i].branchRefCode);
                  try
                    if ENBranchObj.panel <> nil then
                      if ENBranchObj.panel.code <> low(Integer) then
                        TempENPanel :=
                          HTTPRIOENPanel as ENPanelControllerSoapPort;
                        ENPanelObj :=
                          TempENPanel.getObject(ENBranchObj.panel.code);
                        try
                          Cells[3, i + 1] := ENPanelObj.name;
                        finally
                          ENPanelObj.Free;
                          ENPanelObj := nil;
                        end;
                  finally
                    ENBranchObj.Free;
                    ENBranchObj := nil;
                  end;
                end;*)
              Cells[3, i + 1] := ENFiderGuageList.list[i].panelName; //������
              Cells[4, i + 1] := ENFiderGuageList.list[i].branchRefNumberGen; //� �������������
              if ENFiderGuageList.list[i].currentPhaseYellow = nil then
                Cells[5, i + 1] := '' //��� ����� ����, �
              else
                Cells[5, i + 1] :=
                  ENFiderGuageList.list[i].currentPhaseYellow.DecimalString;
              if ENFiderGuageList.list[i].currentPhaseGreen = nil then
                Cells[6, i + 1] := '' //��� ������ ����, �
              else
                Cells[6, i + 1] :=
                  ENFiderGuageList.list[i].currentPhaseGreen.DecimalString;
              if ENFiderGuageList.list[i].currentPhaseRed = nil then
                Cells[7, i + 1] := '' //��� ������� ����, �
              else
                Cells[7, i + 1] :=
                  ENFiderGuageList.list[i].currentPhaseRed.DecimalString;
              if ENFiderGuageList.list[i].tensionPhaseYellow = nil then
                Cells[8, i + 1] := '' //���������� ����� ����, ��
              else
                Cells[8, i + 1] :=
                  ENFiderGuageList.list[i].tensionPhaseYellow.DecimalString;
              if ENFiderGuageList.list[i].tensionPhaseGreen = nil then
                Cells[9, i + 1] := '' //���������� ������ ����, ��
              else
                Cells[9,i + 1] :=
                  ENFiderGuageList.list[i].tensionPhaseGreen.DecimalString;
              if ENFiderGuageList.list[i].tensionPhaseRed = nil then
                Cells[10, i + 1] := '' //���������� ������� ����, ��
              else
                Cells[10, i + 1] :=
                  ENFiderGuageList.list[i].tensionPhaseRed.DecimalString;
              Cells[11, i + 1] := ENFiderGuageList.list[i].workerSurname;
              if (ENFiderGuageList.list[i].workerName <> '������� ����')
              and (ENFiderGuageList.list[i].workerName <> '')
              then //��� ����������, �������������� ������
                Cells[11, i + 1] := Cells[11, i + 1] + ' ' +
                  ENFiderGuageList.list[i].workerName;
              if (ENFiderGuageList.list[i].workerPatronimic <> '������� ����')
              and (ENFiderGuageList.list[i].workerPatronimic <> '')
              then
                Cells[11, i + 1] := Cells[11, i + 1] + ' ' +
                  ENFiderGuageList.list[i].workerPatronimic;
              fgLastRow := i + 1;
              sgENFiderGuage.RowCount := fgLastRow + 1;
            end;
        fgColCount := fgColCount + 1;
        sgENFiderGuage.Row := 1;
    end;

  if pcSubstation04.ActivePage = tsENActS04 then
    begin //���������� ����� ����������� ����� �� ���������� 6 - 10 / 0.4 ��
      SetGridHeaders(ENActHeaders, sgENAct.ColumnHeaders);
  //    actColCount := 100;
      TempENAct :=  HTTPRIOENAct as ENActControllerSoapPort;

      if actFilterObject = nil then
        begin
           actFilterObject := ENActFilter.Create;
           SetNullIntProps(actFilterObject);
           SetNullXSProps(actFilterObject);
           ENActFilter(actFilterObject).conditionSQL :=
             'ENACT.STATUSREFCODE <> ' + IntToStr(ENACT_CANCELED)
             + 'AND ENACT.ELEMENTCODE = '
             + IntToStr(ENSubstation04Obj.element.code);

          ENActFilter(actFilterObject).orderBySQL := '1 desc';
        end;

      ENActList := TempENAct.getScrollableFilteredList(ENActFilter(actFilterObject), 0, -1);
      try
        actLastCount := High(ENActList.list);
        if actLastCount > -1 then
           sgENAct.RowCount := actLastCount + 2
        else
           sgENAct.RowCount := 2;
        with sgENAct do
          for i := 0 to actLastCount do
            begin
              Application.ProcessMessages;
              if ENActList.list[i].code <> Low(Integer) then
                Cells[0,i + 1] := IntToStr(ENActList.list[i].code)
              else
                Cells[0, i + 1] := '';
              Cells[1, i + 1] := ENActList.list[i].numberGen;
              if ENActList.list[i].dateGen = nil then
                Cells[2, i + 1] := ''
              else
                Cells[2, i + 1] := XSDate2String(ENActList.list[i].dateGen);

              if ENActList.list[i].dateAct = nil then
                Cells[3, i + 1] := ''
              else
                Cells[3, i + 1] := XSDate2String(ENActList.list[i].dateAct);

              Cells[4, i + 1] :=  ENActList.list[i].finMolCode + ' / ' +
                ENActList.list[i].finMolName;

              Cells[5, i + 1] := ENActList.list[i].actTypeRefName;
              Cells[6, i + 1] := ENActList.list[i].planWorkTypeName;

              if ENActList.list[i].humanHours = nil then
                Cells[7, i + 1] := ''
              else
                Cells[7, i + 1] := ENActList.list[i].humanHours.DecimalString;

              Cells[8, i + 1] := ENActList.list[i].statusRefName;
              Cells[9, i + 1] := ENActList.list[i].userGen;
              Cells[10, i + 1] := XSDate2String(ENActList.list[i].dateGen);

              actLastRow := i + 1;
              sgENAct.RowCount := actLastRow + 1;
            end;
        // actColCount := actColCount + 1;
         sgENAct.Row:=1;
      finally
        ENActList.Free;
        actFilterObject.Free;
        actFilterObject := nil;
      end;
    end; //if pcSubstation04.ActivePage = tsENActS04 then

  if pcSubstation04.ActivePage = tsENPlanWorkS04 then
    begin //���������� ������ ���������� ����� �� ���������� 6 - 10 / 0.4 ��
      SetGridHeaders(ENPlanWorkHeaders, sgENPlanWork.ColumnHeaders);
      pwColCount := 100;
      TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
      if pwFilterObject = nil then
        begin
           pwFilterObject := ENPlanWorkFilter.Create;
           SetNullIntProps(pwFilterObject);
           SetNullXSProps(pwFilterObject);
           ENPlanWorkFilter(pwFilterObject).conditionSQL :=
             ' ENPLANWORK.STATUSCODE = ' + IntToStr(ENPLANWORKSTATUS_GOOD)
             + ' AND ENPLANWORK.KINDCODE <> '
             + IntToStr(ENPLANWORKKIND_CALCULATION_SINGLE)
             + 'AND ENPLANWORK.ELEMENTREFCODE = '
             + IntToStr(ENSubstation04Obj.element.code);
           //isPWFiltered := False;
        end;

      (*if not isPWFiltered then
        begin
         //isPWFiltered := true;
         actFilterPlanWorkExecute(Sender);
         Exit;
        end;*)


      ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(
        ENPlanWorkFilter(pwFilterObject), 0, pwColCount);
      try
        pwLastCount := High(ENPlanWorkList.list);
        if pwLastCount > -1 then
          sgENPlanWork.RowCount := pwLastCount + 2
        else
          sgENPlanWork.RowCount := 2;
        with sgENPlanWork do
          for i := 0 to pwLastCount do
            begin
              Application.ProcessMessages;
              n := 0;
              if ENPlanWorkList.list[i].code <> Low(Integer) then
                Cells[n, i + 1] := IntToStr(ENPlanWorkList.list[i].code)
              else
                Cells[n, i + 1] := '';
              inc(n);
              Cells[n, i + 1] := ENPlanWorkList.list[i].objectName;
              inc(n);
              Cells[n, i + 1] := ENPlanWorkList.list[i].invNumber;
              inc(n);
              Cells[n, i + 1] := ENPlanWorkList.list[i].renRefName;
              inc(n);
              if ENPlanWorkList.list[i].yearGen <> Low(Integer) then
                Cells[n, i + 1] := IntToStr(ENPlanWorkList.list[i].yearGen)
              else
                Cells[n, i + 1] := '';
              inc(n);
              if ENPlanWorkList.list[i].monthGen <> Low(Integer) then
                Cells[n, i + 1] :=
                  MonthesNames[ENPlanWorkList.list[i].monthGen]
              else
                Cells[n, i + 1] := '';
              inc(n);
              if ENPlanWorkList.list[i].dateStart = nil then
                Cells[n, i + 1] := ''
              else
                Cells[n, i + 1] :=
                  XSDate2String(ENPlanWorkList.list[i].dateStart);
              inc(n);
              Cells[n, i + 1] := ENPlanWorkList.list[i].typeRefName;
              inc(n);
              Cells[n, i + 1] := ENPlanWorkList.list[i].stateRefShortName;
              inc(n);
              Cells[n, i + 1] := ENPlanWorkList.list[i].kindName ;
              inc(n);
              Cells[n, i + 1] := ENPlanWorkList.list[i].statusName;
              inc(n);
              Cells[n, i + 1] := ENPlanWorkList.list[i].departmentRefShortName;
              inc(n);
              Cells[n, i + 1] := ENPlanWorkList.list[i].budgetRefShortName;
              inc(n);
              Cells[n, i + 1] :=
                ENPlanWorkList.list[i].responsibilityRefShortName;
              inc(n);
              Cells[n, i + 1] := '';
              if ENPlanWorkList.list[i].yearOriginal > 0 then
                begin
                  if ENPlanWorkList.list[i].monthOriginal > 0 then
                    Cells[n, i + 1] :=
                      MonthesNames[ENPlanWorkList.list[i].monthOriginal] + ' '
                      + IntToStr(ENPlanWorkList.list[i].yearOriginal);
                end
              else
                Cells[n, i + 1] := '';
              inc(n);
              Cells[n, i + 1] := ENPlanWorkList.list[i].workOrderNumber;
              inc(n);
              Cells[n, i + 1] := ENPlanWorkList.list[i].userGen;
              inc(n);
              if ENPlanWorkList.list[i].dateEdit = nil then
                Cells[n, i + 1] := ''
              else
                Cells[n, i + 1] :=
                  XSDate2String(ENPlanWorkList.list[i].dateEdit);
              inc(n);
              pwLastRow := i + 1;
              sgENPlanWork.RowCount := pwLastRow + 1;
            end;
         pwColCount := pwColCount + 1;
         sgENPlanWork.Row := 1;
      finally
        ENPlanWorkList.Free;
        pwFilterObject.Free;
        pwFilterObject := nil;
      end;
    end; //if pcSubstation04.ActivePage = tsENPlanWorkS04 then

  if pcSubstation04.ActivePage = tsLowVoltageBoard then
    begin
      //���������� ������ �������
      SetGridHeaders(ENPanelHeaders, sgENPanel.ColumnHeaders);
      pnlColCount := 100;
      TempENPanel :=  HTTPRIOENPanel as ENPanelControllerSoapPort;

      if pnlFilterObject = nil then
      begin
        pnlFilterObject := ENPanelFilter.Create;
        SetNullIntProps(pnlFilterObject);
        SetNullXSProps(pnlFilterObject);
      end;

      pnlFilterObject.conditionSQL :=
        ' ENPANEL.elementcode in (select e.code from enelement e where e.elementinrefcode = '
        +  IntToStr(ENSubstation04Obj.element.code) + ')';

      ENPanelList := TempENPanel.getScrollableFilteredList(
        ENPanelFilter(pnlFilterObject), 0, pnlColCount);

      pnlLastCount:=High(ENPanelList.list);

      if pnlLastCount > -1 then
        sgENPanel.RowCount:=pnlLastCount+2
      else
        sgENPanel.RowCount:=2;

      if (DialogState = dsEdit) then
        begin
          actInsertBranch.Enabled := (pnlLastCount > -1);
          actViewBranch.Enabled := actInsertBranch.Enabled;
          actDeleteBranch.Enabled := actInsertBranch.Enabled;
          actEditBranch.Enabled := actInsertBranch.Enabled;
        end;

      with sgENPanel do
        for i:=0 to pnlLastCount do
          begin
            Application.ProcessMessages;
            if ENPanelList.list[i].code <> Low(Integer) then
              Cells[0, i + 1] := IntToStr(ENPanelList.list[i].code) //��� ������
            else
              Cells[0, i + 1] := '';
            Cells[1, i + 1] := ENPanelList.list[i].panelTypeName; //���������� ������
            Cells[2, i + 1] := ENPanelList.list[i].matBusRefName; //����� ������� ��� ������
            Cells[3, i + 1] := ENPanelList.list[i].matArresterRefName; //��������� �� ������
            Cells[4, i + 1] := ENPanelList.list[i].name; //����� ������

            Cells[5, i + 1] := ENPanelList.list[i].transformerName; //�������������
            if ENPanelList.list[i].transformerNominalPower <> nil then
              if ENPanelList.list[i].transformerNominalPower.DecimalString <> ''
              then
                Cells[5, i + 1] := Cells[5, i + 1] + ', P = '
                  + ENPanelList.list[i].transformerNominalPower.DecimalString
                  + '���';
            if ENPanelList.list[i].transformerInvNumber <> '' then
              Cells[5, i + 1] := Cells[5, i + 1]
                + ENPanelList.list[i].transformerInvNumber;

            if ENPanelList.list[i].transformerCode <> low(Integer) then
              Cells[6, i + 1] := IntToStr(ENPanelList.list[i].transformerCode)
            else
              Cells[6, i + 1] := ''; //��� ��������������

            pnlLastRow := i + 1;
            sgENPanel.RowCount := pnlLastRow + 1;
          end;
      pnlColCount := pnlColCount + 1;
      sgENPanel.Row := 1;

      //���������� ������ �������������
      SetGridHeaders(ENBranchHeaders, sgENBranch.ColumnHeaders);
      brColCount := 100;
      TempENBranch := HTTPRIOENBranch as ENBranchControllerSoapPort;

      if brFilterObject = nil then
      begin
         brFilterObject := ENBranchFilter.Create;
         SetNullIntProps(brFilterObject);
         SetNullXSProps(brFilterObject);
      end;

      (*ENPANEL.ELEMENTCODE, � �� ENBRANCH.ELEMENTCODE, ������ ���
      ����������� ������ ����� ������� ENBRANCH � �������� ENELEMENT*)
      brFilterObject.conditionSQL :=
        ' ENPANEL.elementcode in (select e.code from enelement e '
        + 'where e.elementinrefcode = '
        +  IntToStr(ENSubstation04Obj.element.code) + ')';

      ENBranchList := TempENBranch.getScrollableFilteredList(
        ENBranchFilter(brFilterObject), 0, brColCount);

      brLastCount := High(ENBranchList.list);

      LowVoltBoardActionActivate( //��������� ������ ��������������
        (brLastCount > -1) and (DialogState <> dsView)); //������������ ���

      if brLastCount > -1 then
        sgENBranch.RowCount := brLastCount + 2
      else
        sgENBranch.RowCount := 2;

      with sgENBranch do
        for i:=0 to brLastCount do
          begin
            Application.ProcessMessages;
            if ENBranchList.list[i].code <> Low(Integer) then
              Cells[0, i + 1] := IntToStr(ENBranchList.list[i].code) //��� �������������
            else
              Cells[0, i + 1] := '';
            Cells[1, i + 1] := ENBranchList.list[i].name; //�������� ��������� �����
            Cells[2, i + 1] := ENBranchList.list[i].basicConsumer; //�������� �����������
            Cells[3, i + 1] := ENBranchList.list[i].consumerCategoryRefName; //��������� ������������
            Cells[4, i + 1] := ENBranchList.list[i].panelName; //����� ������
            Cells[5, i + 1] := ENBranchList.list[i].numberGen; //����� �������������
            brLastRow := i + 1;
            sgENBranch.RowCount:=brLastRow+1;
          end;
      brColCount:=brColCount+1;
      sgENBranch.Row:=1;

      //���������� ������������� �������������� ����
      SetGridHeaders(ENLowVoltBoardHeaders, sgENLowVoltBoard.ColumnHeaders);
      actUpdateLowVoltBoardExecute(Sender);
      sgENPanel.OnRowChanging(sgENPanel, 0, sgENPanel.Row, Allow);
      pcBoardEquipment.OnChange(Sender); //���������� ������������ ������������� �������

      //���������� ������ ����� 0,4 ��, ���������� �� ���������� 6 - 10 / 0,4 ��
      {SetGridHeaders(ENLine04Headers, sgENLine04.ColumnHeaders);
      l04ColCount:=100;
      TempENLine04 :=  HTTPRIOENLine04 as ENLine04ControllerSoapPort;

      if l04Filter = nil then
      begin
         l04Filter := ENLine04Filter.Create;
         SetNullIntProps(l04Filter);
         SetNullXSProps(l04Filter);
      end;

      l04Filter.conditionSQL :=
        ' elementcode in (select e.code from enelement e where e.elementinrefcode = '
        +  IntToStr(ENSubstation04Obj.element.code) + ')';

      ENLine04List := TempENLine04.getScrollableFilteredList(l04Filter,0,l04ColCount);


      l04LastCount:=High(ENLine04List.list);

      if l04LastCount > -1 then
         sgENLine04.RowCount:=l04LastCount+2
      else
         sgENLine04.RowCount:=2;

       with sgENLine04 do
        for i:=0 to l04LastCount do
          begin
            Application.ProcessMessages;
            if ENLine04List.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(ENLine04List.list[i].code)
            else
            Cells[0,i+1] := '';
            Cells[1,i+1] := ENLine04List.list[i].invNumber;
            Cells[2,i+1] := ENLine04List.list[i].name;
            Cells[3,i+1] := ENLine04List.list[i].buhName;
            if ENLine04List.list[i].lineLength = nil then
              Cells[4,i+1] := ''
            else
              Cells[4,i+1] := ENLine04List.list[i].lineLength.DecimalString;
            if ENLine04List.list[i].yearBuild = Low(Integer) then
              Cells[5,i+1] := ''
            else
              Cells[5,i+1] := IntToStr(ENLine04List.list[i].yearBuild);
            if ENLine04List.list[i].yearWorkingStart = Low(Integer) then
              Cells[6,i+1] := ''
            else
              Cells[6,i+1] := IntToStr(ENLine04List.list[i].yearWorkingStart);
            if ENLine04List.list[i].lastRepairDate = nil then
              Cells[7,i+1] := ''
            else
              Cells[7,i+1] := XSDate2String(ENLine04List.list[i].lastRepairDate);
            l04LastRow:=i+1;
            sgENLine04.RowCount:=l04LastRow+1;
          end;
           l04ColCount:=l04ColCount+1;
           sgENLine04.Row:=1;}
    end; // pcSubstation04.ActivePage = tsLowVoltageBoard

  if pcSubstation04.ActivePage = tsTransformers then
    begin //���������� ������ ���������������
      if S04Activ then
        begin
          Application.MessageBox(
            PChar('�������, ����������, ���������� ����� ��� ���������������.'),
            PChar('��������! ������ ���� �����������:'),MB_ICONWARNING + MB_OK);
          pcSubstation04.ActivePage := tsSubstation04;
          S04Activ := False;
          edtChambersQuantity.SetFocus;
          Exit;
        end;
      SetGridHeaders(ENTransformerHeaders, sgENTransformer.ColumnHeaders);
      t04ColCount := 100;
      TempENTransformer :=  HTTPRIOENTransformer as ENTransformerControllerSoapPort;

      if t04FilterObject = nil then
        begin
          t04FilterObject := ENTransformerFilter.Create;
          SetNullIntProps(t04FilterObject);
          SetNullXSProps(t04FilterObject);
        end;

      t04FilterObject.substation04Ref := ENSubstation04Ref.Create;
      t04FilterObject.substation04Ref.code := ENSubstation04Obj.code;

      ENTransformerList := TempENTransformer.getScrollableFilteredList(ENTransformerFilter(t04FilterObject),0,t04ColCount);

      t04LastCount:=High(ENTransformerList.list);

      if t04LastCount > -1 then
         sgENTransformer.RowCount:=t04LastCount + 2
      else
         sgENTransformer.RowCount := 2;

      with sgENTransformer do
        for i:=0 to t04LastCount do
          begin
            Application.ProcessMessages;
            if ENTransformerList.list[i].code <> Low(Integer) then
              Cells[0,i+1] := IntToStr(ENTransformerList.list[i].code) //���
            else
              Cells[0,i+1] := '';
            Cells[1,i+1] := ENTransformerList.list[i].transformerTypeName; //��� ��-��
            Cells[2,i+1] := ENTransformerList.list[i].name; //�����
            if ENTransformerList.list[i].nominalPower = nil then
              Cells[3,i+1] := ''
            else
              Cells[3,i+1] := ENTransformerList.list[i].nominalPower.DecimalString; //P, ���
            Cells[4,i+1] := ENTransformerList.list[i].invNumber ; //���. �����
            if ENTransformerList.list[i].ukz = nil then
              Cells[5,i+1] := ''
            else
              Cells[5,i+1] := ENTransformerList.list[i].ukz.DecimalString; //U �.�. %
            if ENTransformerList.list[i].highVoltage = nil then
              Cells[6,i+1] := ''
            else
              Cells[6,i+1] := ENTransformerList.list[i].highVoltage.DecimalString; //U ���., � ��
            if ENTransformerList.list[i].lowVoltage = nil then
              Cells[7,i+1] := ''
            else
              Cells[7,i+1] := ENTransformerList.list[i].lowVoltage.DecimalString; //U ���., � ��
            if ENTransformerList.list[i].highCurrent = nil then
              Cells[8,i+1] := ''
            else
              Cells[8,i+1] := ENTransformerList.list[i].highCurrent.DecimalString; //� ���., � ��
            if ENTransformerList.list[i].lowCurrent = nil then
              Cells[9,i+1] := ''
            else
              Cells[9,i+1] := ENTransformerList.list[i].lowCurrent.DecimalString; //� ���., � ��
            t04LastRow := i + 1;
            sgENTransformer.RowCount := t04LastRow + 1;
          end;
       t04ColCount := t04ColCount + 1;
       sgENTransformer.Row := 1;
    end; //if pcSubstation04.ActivePage = tsTransformers then

  if pcSubstation04.ActivePage = tsHighVoltageParty then
    begin //���������� ������ �������������� �����
      pcHighVoltageParty.OnChange(Sender);
      SetGridHeaders(ENHighVoltageSellHeaders,
        sgENHighVoltageSell.ColumnHeaders);
      hvsColCount := 100;
      TempENHighVoltageSell :=
        HTTPRIOENHighVoltageSell as ENHighVoltageSellControllerSoapPort;

      if hvsFilterObject = nil then
        begin
          hvsFilterObject := ENHighVoltageSellFilter.Create;
          SetNullIntProps(hvsFilterObject);
          SetNullXSProps(hvsFilterObject);
        end;

      hvsFilterObject.conditionSQL :=
        ' ENHIGHVOLTAGESELL.elementcode in (select e.code from enelement e where e.elementinrefcode = '
        +  IntToStr(ENSubstation04Obj.element.code) + ')';

      ENHighVoltageSellList := TempENHighVoltageSell.getScrollableFilteredList(
        ENHighVoltageSellFilter(hvsFilterObject), 0, hvsColCount);

      hvsLastCount := High(ENHighVoltageSellList.list);

      if hvsLastCount > -1 then
        sgENHighVoltageSell.RowCount:=hvsLastCount + 2
      else
        sgENHighVoltageSell.RowCount := 2;

      if (DialogState = dsEdit) then
        begin
          actInsertEquipment.Enabled := (hvsLastCount > -1);
          actViewEquipment.Enabled := actInsertEquipment.Enabled;
          actDeleteEquipment.Enabled := actInsertEquipment.Enabled;
          actEditEquipment.Enabled := actInsertEquipment.Enabled;
          actLineConnectSubstation04.Enabled := actInsertEquipment.Enabled;
          actLineDisconnectSubstation04.Enabled := actInsertEquipment.Enabled;
        end; //if (DialogState = dsInsert) or (DialogState = dsEdit) then

      tbEquipDisconnector.Enabled := actInsertEquipment.Enabled; //������ ������ ��������������
      tbEquipLoadSwitch.Enabled := actInsertEquipment.Enabled; //������ ������ ������������ ��������
      tbEquipFuse.Enabled := actInsertEquipment.Enabled; //������ ������ ��������������� �������������� ������
      tbEquipInsulator.Enabled := actInsertEquipment.Enabled; //������ ������ ����������
      tbEquipArrester.Enabled := actInsertEquipment.Enabled; //������ ������ �����������
      tbEquipCurrentTransformer.Enabled := actInsertEquipment.Enabled; //������ ������ ��������������� ����
      tbEquipBus.Enabled := actInsertEquipment.Enabled; //������ ������ ��� �������������
      tbEquipMeasurDevice.Enabled := actInsertEquipment.Enabled; //������ ������ ����������� �������������� ������


      with sgENHighVoltageSell do
        for i := 0 to hvsLastCount do
          begin
            Application.ProcessMessages;
            if ENHighVoltageSellList.list[i].code <> Low(Integer) then
              Cells[0, i + 1] := IntToStr(ENHighVoltageSellList.list[i].code)
            else
              Cells[0,i + 1] := '';
            Cells[1, i + 1] := ENHighVoltageSellList.list[i].highvoltageTypeName;
            Cells[2, i + 1] := ENHighVoltageSellList.list[i].name;
            Cells[3, i + 1] := ENHighVoltageSellList.list[i].numberGen;

            if ENHighVoltageSellList.list[i].transformerRefCode <> low(Integer)
            then
              begin
                Cells[4, i + 1] :=
                  ENHighVoltageSellList.list[i].transformerRefName;
                if ENHighVoltageSellList.list[i].transformerRefNominalPower
                  <> nil
                then
                  Cells[4, i + 1] := Cells[4, i + 1] + '. P = ' +
                    ENHighVoltageSellList.list[
                      i].transformerRefNominalPower.DecimalString + ' ���';
                if ENHighVoltageSellList.list[i].transformerRefInvNumber <> ''
                then
                  Cells[4, i + 1] := Cells[4, i + 1] + '. ���. � ' +
                    ENHighVoltageSellList.list[i].transformerRefInvNumber;
              Cells[5, i + 1] :=
                IntToStr(ENHighVoltageSellList.list[i].transformerRefCode);
              end
            else
              Cells[5, i + 1] := '';

            hvsLastRow := i + 1;
            sgENHighVoltageSell.RowCount := hvsLastRow + 1;
          end;
      hvsColCount := hvsColCount + 1;
      sgENHighVoltageSell.Row := 1;
      sgENHighVoltageSell.OnRowChanging(sgENHighVoltageSell, 0, sgENHighVoltageSell.Row, Allow);
    end; //if pcSubstation04.ActivePage = tsHighVoltageParty then

    // ENInspectionSheet
    if pcSubstation04.ActivePage = tsENInspectionSheet then
    begin
      SetGridHeaders(ENInspectionSheetHeaders, sgENInspectionSheet.ColumnHeaders);
      ClearGrid(sgENInspectionSheet);
      TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;

      inspectionSheetFilter := ENInspectionSheetFilter.Create;
      SetNullIntProps(inspectionSheetFilter);
      SetNullXSProps(inspectionSheetFilter);

      inspectionSheetFilter.elementRef := ENElementRef.Create;
      inspectionSheetFilter.elementRef.code := ENSubstation04Obj.element.code;

      ENInspectionSheetList := TempENInspectionSheet.getScrollableFilteredList(inspectionSheetFilter, 0, -1);
      LastCount:=High(ENInspectionSheetList.list);

      if LastCount > -1 then
         sgENInspectionSheet.RowCount:=LastCount+2
      else
         sgENInspectionSheet.RowCount:=2;

      with sgENInspectionSheet do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if ENInspectionSheetList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(ENInspectionSheetList.list[i].code)
          else
            Cells[0,i+1] := '';

          Cells[1,i+1] := ENInspectionSheetList.list[i].name;
          Cells[2,i+1] := ENInspectionSheetList.list[i].inspectionKindName;
          Cells[3,i+1] := ENInspectionSheetList.list[i].statusRefName;

          if ENInspectionSheetList.list[i].dateGen = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := XSDate2String(ENInspectionSheetList.list[i].dateGen);

          Cells[5,i+1] := ENInspectionSheetList.list[i].userGen;

          if ENInspectionSheetList.list[i].dateEdit = nil then
            Cells[6,i+1] := ''
          else
            Cells[6,i+1] := XSDate2String(ENInspectionSheetList.list[i].dateEdit);
        end;

      sgENInspectionSheet.Row:=1;

      sgENInspectionSheetClick(sgENInspectionSheet);
    end;

    if pcSubstation04.ActivePage = tsCCElement then
      LoadCCElement();

    if pcSubstation04.ActivePage = tsCCDamageLog then
      LoadCCDamageLog();

    if pcSubstation04.ActivePage = tsAttachments then
    begin;
      SetGridHeaders(ENDocAttachmentHeaders, sgENDocAttachment.ColumnHeaders);
      ClearGrid(sgENDocAttachment);
      updateAttachments;
    end;
end;


procedure TfrmENSubstation04Edit.pcHighVoltagePartyChange(Sender: TObject);
var i: Integer; Allow: Boolean;
  TempENDisconnector: ENDisconnectorControllerSoapPort;
  ENDisconnectorList: ENDisconnectorShortList;
  TempENLoadSwitch: ENLoadSwitchControllerSoapPort;
  ENLoadSwitchList: ENLoadSwitchShortList;
  TempENFuse: ENFuseControllerSoapPort;
  ENFuseList: ENFuseShortList;
  TempENInsulator: ENInsulatorControllerSoapPort;
  ENInsulatorList: ENInsulatorShortList;
  TempENArrester: ENArresterControllerSoapPort;
  ENArresterList: ENArresterShortList;
  TempENCurrentTransformer: ENCurrentTransformerControllerSoapPort;
  ENCurrentTransformerList: ENCurrentTransformerShortList;
  TempENBus: ENBusControllerSoapPort;
  ENBusList: ENBusShortList;
  TempENMeasurDevice: ENMeasurDeviceControllerSoapPort;
  ENMeasurDeviceList: ENMeasurDeviceShortList;
  TempENLine10: ENLine10ControllerSoapPort;
  ENLine10List: ENLine10ShortList;
  TempENLineCable: ENLineCableControllerSoapPort;
  ENLineCableList: ENLineCableShortList;
  TempENAgreeJoint: ENAgreeJointControllerSoapPort;
  ENAgreeJointList: ENAgreeJointShortList;
  TempENHVCS: ENHighVoltCellSuppliesControllerSoapPort;
  ENHVCSList: ENHighVoltCellSuppliesShortList;
  ENHVCSFilterObj: ENHighVoltCellSuppliesFilter;
begin
  if pcHighVoltageParty.ActivePage = tsDisconnector then
    begin //���������� ������ ��������������
      SetGridHeaders(ENDisconnectorHeaders, sgENDisconnector.ColumnHeaders);
      dColCount := 100;
      TempENDisconnector :=
        HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;

      if dFilterObject = nil then
        begin
          dFilterObject := ENDisconnectorFilter.Create;
          SetNullIntProps(dFilterObject);
          SetNullXSProps(dFilterObject);
        end;

      {dFilterObject.conditionSQL :=
        ' ENDISCONNECTOR.ELEMENTCODE IN (SELECT E.CODE FROM ENELEMENT E WHERE E.ELEMENTINREFCODE IN ' +
        '   (SELECT EE.CODE FROM ENELEMENT EE WHERE TYPEREFCODE = 36 AND EE.ELEMENTINREFCODE IN ' +
        '     (SELECT E.CODE FROM ENELEMENT E WHERE E.ELEMENTINREFCODE = '
        +  IntToStr(ENSubstation04Obj.element.code) +')))';}

      dFilterObject.conditionSQL :=
        ' ENDISCONNECTOR.ELEMENTCODE IN (SELECT E.CODE FROM ENELEMENT E WHERE E.ELEMENTINREFCODE = '
        + IntToStr(ENSubstation04Obj.element.code) + ')';

      ENDisconnectorList := TempENDisconnector.getScrollableFilteredList(
        ENDisconnectorFilter(dFilterObject), 0, dColCount);

      dLastCount := High(ENDisconnectorList.list);

      if dLastCount > -1 then
         sgENDisconnector.RowCount := dLastCount + 2
      else
         sgENDisconnector.RowCount := 2;

       with sgENDisconnector do
         for i := 0 to dLastCount do
           begin
             Application.ProcessMessages;
             if ENDisconnectorList.list[i].code <> Low(Integer) then
               Cells[0, i + 1] := IntToStr(ENDisconnectorList.list[i].code)
             else //��� �������������
               Cells[0, i + 1] := '';
             Cells[1, i + 1] := ENDisconnectorList.list[i].materialRefName; //������������� �� ����������� ����������
             //Cells[1, i + 1] := ENDisconnectorList.list[i].disconnectorTypeName; //��� �������������
             if ENDisconnectorList.list[i].ratedVoltage = nil then
               Cells[2, i + 1] := '' //����������� ����������, ��
             else
               Cells[2, i + 1] :=
                 ENDisconnectorList.list[i].ratedVoltage.DecimalString;
             if ENDisconnectorList.list[i].ratedCurrent = nil then
               Cells[3, i + 1] := '' //����������� ���, �
             else
               Cells[3, i + 1] :=
                 ENDisconnectorList.list[i].ratedCurrent.DecimalString;
             Cells[4, i + 1] := ENDisconnectorList.list[i].highvoltageSellNumberGen; //����� ������
             dLastRow := i + 1;
             sgENDisconnector.RowCount := dLastRow + 1;
           end;
       dColCount := dColCount + 1;
       sgENDisconnector.Row := 1;
    end; //if pcHighVoltageParty.ActivePage = tsDisconnector then

  if pcHighVoltageParty.ActivePage = tsLoadSwitch then
    begin //���������� ������ ������������ ��������
      SetGridHeaders(ENLoadSwitchHeaders, sgENLoadSwitch.ColumnHeaders);
      lsColCount := 100;
      TempENLoadSwitch :=
        HTTPRIOENLoadSwitch as ENLoadSwitchControllerSoapPort;

      if lsFilterObject = nil then
        begin
          lsFilterObject := ENLoadSwitchFilter.Create;
          SetNullIntProps(lsFilterObject);
          SetNullXSProps(lsFilterObject);
        end;

      lsFilterObject.conditionSQL :=
        ' ENLOADSWITCH.ELEMENTCODE IN (SELECT E.CODE FROM ENELEMENT E WHERE E.ELEMENTINREFCODE = '
        + IntToStr(ENSubstation04Obj.element.code) + ')';

      ENLoadSwitchList := TempENLoadSwitch.getScrollableFilteredList(
        ENLoadSwitchFilter(lsFilterObject), 0, lsColCount);

      lsLastCount := High(ENLoadSwitchList.list);

      if lsLastCount > -1 then
         sgENLoadSwitch.RowCount := lsLastCount + 2
      else
         sgENLoadSwitch.RowCount := 2;

       with sgENLoadSwitch do
         for i := 0 to lsLastCount do
           begin
             Application.ProcessMessages;
             if ENLoadSwitchList.list[i].code <> Low(Integer) then //���
               Cells[0, i + 1] := IntToStr(ENLoadSwitchList.list[i].code)
             else
               Cells[0, i + 1] := '';
             Cells[1, i + 1] := ENLoadSwitchList.list[i].materialRefName; //����������� �������� �� ����������� ����������
             //Cells[1, i + 1] := ENLoadSwitchList.list[i].loadswitchTypeName; //���
             if ENLoadSwitchList.list[i].ratedVoltage = nil then //������������ ����������, ��
               Cells[2, i + 1] := ''
             else
               Cells[2, i + 1] :=
                 ENLoadSwitchList.list[i].ratedVoltage.DecimalString;
             if ENLoadSwitchList.list[i].ratedCurrent = nil then //����������� ���, �
               Cells[3, i + 1] := ''
             else
               Cells[3, i + 1] :=
                 ENLoadSwitchList.list[i].ratedCurrent.DecimalString;
             Cells[4, i + 1] := ENLoadSwitchList.list[i].highvoltageSellNumberGen; //� ������
             lsLastRow := i + 1;
             sgENLoadSwitch.RowCount := lsLastRow + 1;
           end;
      lsColCount := lsColCount + 1;
      sgENLoadSwitch.Row := 1;
    end; //if pcHighVoltageParty.ActivePage = tsLoadSwitch then

  if pcHighVoltageParty.ActivePage = tsFuse then
    begin //���������� ������ ���������������
      SetGridHeaders(ENFuseHeaders, sgENFuse.ColumnHeaders);
      fsColCount := 100;
      TempENFuse :=
        HTTPRIOENFuse as ENFuseControllerSoapPort;

      if fsFilterObject = nil then
        begin
          fsFilterObject := ENFuseFilter.Create;
          SetNullIntProps(fsFilterObject);
          SetNullXSProps(fsFilterObject);
        end;

      fsFilterObject.conditionSQL :=
        ' ENFUSE.ELEMENTCODE IN (SELECT E.CODE FROM ENELEMENT E WHERE E.ELEMENTINREFCODE = '
        + IntToStr(ENSubstation04Obj.element.code)
        + ') AND COALESCE(ENHIGHVOLTAGESELL.CODE, 0) <> 0';

      ENFuseList := TempENFuse.getScrollableFilteredList(
        ENFuseFilter(fsFilterObject), 0, fsColCount);

      fsLastCount := High(ENFuseList.list);

      if fsLastCount > -1 then
         sgENFuse.RowCount := fsLastCount + 2
      else
         sgENFuse.RowCount := 2;

       with sgENFuse do
         for i := 0 to fsLastCount do
           begin
             Application.ProcessMessages;
             if ENFuseList.list[i].code <> Low(Integer) then //���
               Cells[0, i + 1] := IntToStr(ENFuseList.list[i].code)
             else
               Cells[0, i + 1] := '';
             Cells[1, i + 1] := ENFuseList.list[i].materialRefName; //�������������� �� ����������� ����������
             //Cells[1, i + 1] := ENFuseList.list[i].FuseTypeName; //���
             if ENFuseList.list[i].currentFuse = nil then //��� ������� �������
               Cells[2, i + 1] := ''
             else
               Cells[2, i + 1] :=
                 ENFuseList.list[i].currentFuse.DecimalString;
             Cells[3, i + 1] := ENFuseList.list[i].highvoltageSellNumberGen; //� ������
             lsLastRow := i + 1;
             sgENFuse.RowCount := lsLastRow + 1;
           end;
      lsColCount := lsColCount + 1;
      sgENFuse.Row := 1;
    end; //if pcHighVoltageParty.ActivePage = tsFuse then

  if pcHighVoltageParty.ActivePage = tsInsulator then
    begin //���������� ������ ����������
      SetGridHeaders(ENInsulatorHeaders, sgENInsulator.ColumnHeaders);
      insColCount := 100;
      TempENInsulator :=
        HTTPRIOENInsulator as ENInsulatorControllerSoapPort;

      if insFilterObject = nil then
        begin
          insFilterObject := ENInsulatorFilter.Create;
          SetNullIntProps(insFilterObject);
          SetNullXSProps(insFilterObject);
        end;

      insFilterObject.conditionSQL :=
        ' ENINSULATOR.ELEMENTCODE IN (SELECT E.CODE FROM ENELEMENT E WHERE E.ELEMENTINREFCODE = '
        + IntToStr(ENSubstation04Obj.element.code) + ')';

      ENInsulatorList := TempENInsulator.getScrollableFilteredList(
        ENInsulatorFilter(insFilterObject), 0, insColCount);

      insLastCount := High(ENInsulatorList.list);

      if insLastCount > -1 then
         sgENInsulator.RowCount := insLastCount + 2
      else
         sgENInsulator.RowCount := 2;

      with sgENInsulator do
         for i := 0 to insLastCount do
           begin
             Application.ProcessMessages;
             if ENInsulatorList.list[i].code <> Low(Integer) then //���
               Cells[0, i + 1] := IntToStr(ENInsulatorList.list[i].code)
             else
               Cells[0, i + 1] := '';
             Cells[1, i + 1] := ENInsulatorList.list[i].materialRefName; //�������� �� ����������� ����������
             //Cells[1, i + 1] := ENInsulatorList.list[i].insulatorTypeName; //���
             if ENInsulatorList.list[i].voltage = nil then //����������, ��
               Cells[2, i + 1] := ''
             else
               Cells[2, i + 1] :=
                 ENInsulatorList.list[i].voltage.DecimalString;
             Cells[3, i + 1] := ENInsulatorList.list[i].highvoltageSellNumberGen; //� ������
             {if ENInsulatorList.list[i].numberGen = nil then //����������, ��.
               Cells[4, i + 1] := ''
             else
               Cells[4, i + 1] := ENInsulatorList.list[i].numberGen.DecimalString;}
             insLastRow := i + 1;
             sgENInsulator.RowCount := insLastRow + 1;
           end;
      insColCount := insColCount + 1;
      sgENInsulator.Row := 1;
    end; //if pcHighVoltageParty.ActivePage = tsInsulator then

  if pcHighVoltageParty.ActivePage = tsArrester then
    begin //���������� ������ �����������
      SetGridHeaders(ENArresterHeaders, sgENArrester.ColumnHeaders);
      arColCount := 100;
      TempENArrester :=
        HTTPRIOENArrester as ENArresterControllerSoapPort;

      if arFilterObject = nil then
        begin
          arFilterObject := ENArresterFilter.Create;
          SetNullIntProps(arFilterObject);
          SetNullXSProps(arFilterObject);
        end;

      arFilterObject.conditionSQL :=
        ' ENARRESTER.ELEMENTCODE IN (SELECT E.CODE FROM ENELEMENT E WHERE E.ELEMENTINREFCODE = '
        + IntToStr(ENSubstation04Obj.element.code) + ')';

      ENArresterList := TempENArrester.getScrollableFilteredList(
        ENArresterFilter(arFilterObject), 0, arColCount);

      arLastCount := High(ENArresterList.list);

      if arLastCount > -1 then
         sgENArrester.RowCount := arLastCount + 2
      else
         sgENArrester.RowCount := 2;

      with sgENArrester do
         for i := 0 to arLastCount do
           begin
             Application.ProcessMessages;
             if ENArresterList.list[i].code <> Low(Integer) then //���
               Cells[0, i + 1] := IntToStr(ENArresterList.list[i].code)
             else
               Cells[0, i + 1] := '';
             Cells[1, i + 1] := ENArresterList.list[i].materialRefName; //��������� �� ����������� ����������
             //Cells[1, i + 1] := ENArresterList.list[i].arresterTypeName; //���
             Cells[2, i + 1] := ENArresterList.list[i].arresterSiteName; //����� ���������
             Cells[3, i + 1] := ENArresterList.list[i].highvoltageSellNumberGen; //� ������
             arLastRow := i + 1;
             sgENArrester.RowCount := arLastRow + 1;
           end;
      arColCount := arColCount + 1;
      sgENArrester.Row := 1;
    end; //if pcHighVoltageParty.ActivePage = tsArrester then

  if pcHighVoltageParty.ActivePage = tsCurrentTransformer then
    begin //���������� ������ ��������������� ����
      SetGridHeaders(ENCurrentTransformerHeaders,
        sgENCurrentTransformer.ColumnHeaders);
      ctColCount := 100;
      TempENCurrentTransformer :=
        HTTPRIOENCurrentTransformer as ENCurrentTransformerControllerSoapPort;

      if ctFilterObject = nil then
        begin
          ctFilterObject := ENCurrentTransformerFilter.Create;
          SetNullIntProps(ctFilterObject);
          SetNullXSProps(ctFilterObject);
        end;

      ctFilterObject.conditionSQL :=
        ' ENCURRENTTRANSFORMER.ELEMENTCODE IN (SELECT E.CODE FROM ENELEMENT E WHERE E.ELEMENTINREFCODE = '
        + IntToStr(ENSubstation04Obj.element.code) + ')';

      ENCurrentTransformerList := TempENCurrentTransformer.getScrollableFilteredList(
        ENCurrentTransformerFilter(ctFilterObject), 0, ctColCount);

      ctLastCount := High(ENCurrentTransformerList.list);

      if ctLastCount > -1 then
         sgENCurrentTransformer.RowCount := ctLastCount + 2
      else
         sgENCurrentTransformer.RowCount := 2;

      with sgENCurrentTransformer do
         for i := 0 to ctLastCount do
           begin
             Application.ProcessMessages;
             if ENCurrentTransformerList.list[i].code <> Low(Integer) then //���
               Cells[0, i + 1] := IntToStr(ENCurrentTransformerList.list[i].code)
             else
               Cells[0, i + 1] := '';
             Cells[1, i + 1] := ENCurrentTransformerList.list[i].materialRefName; //������������� ���� �� ����������� ����������
             //Cells[1, i + 1] := ENCurrentTransformerList.list[i].currentTransformerTypeName; //��� �������������� ����
             if ENCurrentTransformerList.list[i].accruracyClass = nil then //���� ��������
               Cells[2, i + 1] := ''
             else
               Cells[2, i + 1] :=
                 ENCurrentTransformerList.list[i].accruracyClass.DecimalString;

             if ENCurrentTransformerList.list[i].coefTransformation = nil then //����������� �������������
               Cells[3, i + 1] := ''
             else
               Cells[3, i + 1] := ENCurrentTransformerList.list[i].coefTransformation.DecimalString;

             if ENCurrentTransformerList.list[i].secondaryWindingsNumber = nil then //�������������� �������
               Cells[4, i + 1] := ''
             else
               Cells[4, i + 1] := ENCurrentTransformerList.list[i].secondaryWindingsNumber.DecimalString;

             Cells[5, i + 1] := ENCurrentTransformerList.list[i].highvoltageSellNumberGen; //� ������

             {if ENCurrentTransformerList.list[i].numberGen = nil then //����������, ��.
               Cells[6, i + 1] := ''
             else
               Cells[6, i + 1] := ENCurrentTransformerList.list[i].numberGen.DecimalString;}

             ctLastRow := i + 1;
             sgENCurrentTransformer.RowCount := ctLastRow + 1;
           end;
      ctColCount := ctColCount + 1;
      sgENCurrentTransformer.Row := 1;
    end; //if pcHighVoltageParty.ActivePage = tsCurrentTransformer then

  if pcHighVoltageParty.ActivePage = tsBus then
    begin //���������� ������ ���
      SetGridHeaders(ENBusHeaders, sgENBus.ColumnHeaders);
      busColCount := 100;
      TempENBus :=
        HTTPRIOENBus as ENBusControllerSoapPort;

      if busFilterObject = nil then
        begin
          busFilterObject := ENBusFilter.Create;
          SetNullIntProps(busFilterObject);
          SetNullXSProps(busFilterObject);
        end;

      busFilterObject.conditionSQL :=
        ' ENBUS.ELEMENTCODE IN (SELECT E.CODE FROM ENELEMENT E WHERE E.ELEMENTINREFCODE = '
        + IntToStr(ENSubstation04Obj.element.code) + ')';

      ENBusList := TempENBus.getScrollableFilteredList(
        ENBusFilter(busFilterObject), 0, busColCount);

      busLastCount := High(ENBusList.list);

      if busLastCount > -1 then
         sgENBus.RowCount := busLastCount + 2
      else
         sgENBus.RowCount := 2;

      with sgENBus do
         for i := 0 to busLastCount do
           begin
             Application.ProcessMessages;
             if ENBusList.list[i].code <> Low(Integer) then //���
               Cells[0, i + 1] := IntToStr(ENBusList.list[i].code)
             else
               Cells[0, i + 1] := '';
             Cells[1, i + 1] := ENBusList.list[i].materialRefName; //����� ���� ������������� �� ����������� ����������
             Cells[2, i + 1] := ENBusList.list[i].matInsulatorRefName; //������������� ��������� �� ����������� ����������
             if ENBusList.list[i].insulatornumberGen = nil then //����������, ��.
               Cells[3, i + 1] := ''
             else
               Cells[3, i + 1] := ENBusList.list[i].insulatornumberGen.DecimalString;
             if ENBusList.list[i].length = nil then //�����, �
               Cells[4, i + 1] := ''
             else
               Cells[4, i + 1] := ENBusList.list[i].length.DecimalString;
             Cells[5, i + 1] := ENBusList.list[i].locationScheme; //����� ������������ ���

             Cells[6, i + 1] := ENBusList.list[i].highvoltageSellNumberGen; //� ������
             //Cells[7, i + 1] := ENBusList.list[i].insulatorTypeName; //��� ��������
             busLastRow := i + 1;
             sgENBus.RowCount := busLastRow + 1;
           end;
      busColCount := busColCount + 1;
      sgENBus.Row := 1;
    end; //if pcHighVoltageParty.ActivePage = tsBus then

  if pcHighVoltageParty.ActivePage = tsMeasurDevice then
    begin //���������� ������ ������������� ��������

      SetGridHeaders(ENMeasurDeviceHeaders, sgENMeasurDevice.ColumnHeaders);
      mdColCount := 100;
      TempENMeasurDevice :=
        HTTPRIOENMeasurDevice as ENMeasurDeviceControllerSoapPort;

      if mdFilterObject = nil then
      begin
         mdFilterObject := ENMeasurDeviceFilter.Create;
         SetNullIntProps(mdFilterObject);
         SetNullXSProps(mdFilterObject);
      end;

      mdFilterObject.conditionSQL :=
        ' ENMEASURDEVICE.ELEMENTCODE IN (SELECT E.CODE FROM ENELEMENT E WHERE E.ELEMENTINREFCODE = '
        + IntToStr(ENSubstation04Obj.element.code)
        + ') AND COALESCE(ENHIGHVOLTAGESELL.CODE, 0) <> 0';

      ENMeasurDeviceList := TempENMeasurDevice.getScrollableFilteredList(
        ENMeasurDeviceFilter(mdFilterObject), 0, mdColCount);

      mdLastCount := High(ENMeasurDeviceList.list);

      if mdLastCount > -1 then
         sgENMeasurDevice.RowCount := mdLastCount+2
      else
         sgENMeasurDevice.RowCount := 2;

       with sgENMeasurDevice do
        for i := 0 to mdLastCount do
          begin
            Application.ProcessMessages;
            if ENMeasurDeviceList.list[i].code <> Low(Integer) then
              Cells[0, i + 1] := IntToStr(ENMeasurDeviceList.list[i].code)
            else
              Cells[0, i + 1] := ''; //��� �������������� �������
            Cells[1, i + 1] := ENMeasurDeviceList.list[i].materialRefName; //������������� ������ �� ����������� ����������
            //Cells[1, i + 1] := ENMeasurDeviceList.list[i].name; //������������
            Cells[2, i + 1] := ENMeasurDeviceList.list[i].workNumber; //��������� �����
            Cells[3, i + 1] := ENMeasurDeviceList.list[i].highvoltageSellNumberGen; //� ������
            mdLastRow := i + 1;
            sgENMeasurDevice.RowCount := mdLastRow + 1;
          end;
       mdColCount := mdColCount + 1;
       sgENMeasurDevice.Row := 1;
    end; //if pcHighVoltageParty.ActivePage = tsMeasurDevice then

  if pcHighVoltageParty.ActivePage = tsElectricLineSupplies then
    begin //���������� ������� ����� ������� ���������� 6 - 10 / 0,4 ��
      //���������� ������ �������� ���������� 6 - 10 / 0,4 �� ��������� ����� 6 - 10 ��
      SetGridHeaders(ENLine10Headers, sgENLine10.ColumnHeaders);
      L10ColCount := 100;
      TempENLine10 :=
        HTTPRIOENLine10 as ENLine10ControllerSoapPort;

      if L10FilterObject = nil then
      begin
         L10FilterObject := ENLine10Filter.Create;
         SetNullIntProps(L10FilterObject);
         SetNullXSProps(L10FilterObject);
         (*��� ������������� �������� ���������� ���������
         SetScrollableFilteredList ���������� �������� ����� ������,
         ������� lcsFilterObject.domain_info ���-�� ������� ���� ...*)
      end;

      L10FilterObject.conditionSQL :=
        'ENLINE10.CODE IN (SELECT HVCS.LINE10REFCODE '
        + 'FROM ENHIGHVOLTCELLSUPPLIES HVCS WHERE HVCS.SUBSTATION04REFCODE = '
        + IntToStr(ENSubstation04Obj.code) + ')';

      ENLine10List := TempENLine10.getScrollableFilteredList(
        ENLine10Filter(L10FilterObject), 0, L10ColCount);

      L10LastCount := High(ENLine10List.list);

      if L10LastCount > -1 then
         sgENLine10.RowCount := L10LastCount+2
      else
         sgENLine10.RowCount := 2;

       with sgENLine10 do
        for i := 0 to L10LastCount do
          begin
            Application.ProcessMessages;
            if ENLine10List.list[i].code <> Low(Integer) then
              Cells[0, i + 1] := IntToStr(ENLine10List.list[i].code)
            else
              Cells[0, i + 1] := ''; //��� �������� ���������� 6 - 10 / 0,4 �� ��������� ����� 6 - 10 ��
            Cells[1, i + 1] := ENLine10List.list[i].name; //������������ ��������� ����� 6 - 10 ��
            Cells[2, i + 1] := ENLine10List.list[i].invNumber; //����������� ����� ��������� ����� 6 - 10 ��
            if ENLine10List.list[i].lineLength = nil then
              Cells[3, i + 1] := '' //������������ ����� �������� ���������� 6 - 10 / 0,4 �� ��������� ����� 6 - 10 ��
            else
              Cells[3, i + 1] := ENLine10List.list[i].lineLength.DecimalString;

            if  ENLine10List.list[i].voltageNominalValue = nil then
              Cells[4, i + 1] := ''
            else
              Cells[4, i + 1] := ENLine10List.list[i].voltageNominalValue.DecimalString;

            TempENHVCS := HTTPRIOENHighVoltCellSupplies
              as ENHighVoltCellSuppliesControllerSoapPort;

            ENHVCSFilterObj := ENHighVoltCellSuppliesFilter.Create;
            try
              SetNullIntProps(ENHVCSFilterObj);
              SetNullXSProps(ENHVCSFilterObj);
              ENHVCSFilterObj.conditionSQL :=
                ' COALESCE(ENHIGHVOLTCELLSUPPLIES.SUBSTATION04REFCODE, 0) = ' +
                IntToStr(ENSubstation04Obj.code) +
                ' AND COALESCE(ENHIGHVOLTCELLSUPPLIES.LINE10REFCODE, 0) = ' +
                IntToStr(ENLine10List.list[i].code);
              ENHVCSList := TempENHVCS.getScrollableFilteredList(
                ENHVCSFilterObj, 0, 1);
              try
                if ENHVCSList.totalCount = 1 then
                  Cells[5, i + 1] := //� �������������� ������
                    ENHVCSList.list[0].highVoltCellRefNumberGen;
              finally
                ENHVCSList.Free;
                ENHVCSList := nil;
              end;
            finally
              ENHVCSFilterObj.Free;
              ENHVCSFilterObj := nil;
            end;

            L10LastRow := i + 1;
            sgENLine10.RowCount := L10LastRow + 1;
          end;
       L10ColCount := L10ColCount + 1;
       sgENLine10.Row := 1;
      //���������� ������ �������� ���������� 6 - 10 / 0,4 �� ��������� �����
      SetGridHeaders(ENLineCableSuppliesHeaders, sgENLineCable.ColumnHeaders);
      lcsColCount := 100;
      TempENLineCable :=
        HTTPRIOENLineCableSupplies as ENLineCableControllerSoapPort;

      if lcsFilterObject = nil then
      begin
         lcsFilterObject := ENLineCableFilter.Create;
         SetNullIntProps(lcsFilterObject);
         SetNullXSProps(lcsFilterObject);
         (*��� ������������� �������� ���������� ���������
         SetScrollableFilteredList ���������� �������� ����� ������,
         ������� lcsFilterObject.domain_info ���-�� ������� ���� ...*)
      end;

      lcsFilterObject.conditionSQL :=
        'ENLINECABLE.CODE IN (SELECT HVCS.LINECABLEREFCODE '
        + 'FROM ENHIGHVOLTCELLSUPPLIES HVCS WHERE HVCS.SUBSTATION04REFCODE = '
        + IntToStr(ENSubstation04Obj.code) + ')';

      ENLineCableList := TempENLineCable.getScrollableFilteredList(
        ENLineCableFilter(lcsFilterObject), 0, lcsColCount);

      lcsLastCount := High(ENLineCableList.list);

      if lcsLastCount > -1 then
         sgENLineCable.RowCount := lcsLastCount+2
      else
         sgENLineCable.RowCount := 2;

      with sgENLineCable do
        for i := 0 to lcsLastCount do
          begin
            Application.ProcessMessages;
            if ENLineCableList.list[i].code <> Low(Integer) then
              Cells[0, i + 1] := IntToStr(ENLineCableList.list[i].code)
            else
              Cells[0, i + 1] := ''; //��� �������� ���������� 6 - 10 / 0,4 �� ��������� ����� 6 - 10 ��
            Cells[1, i + 1] := ENLineCableList.list[i].name; //������������ ��������� ����� 6 - 10 ��
            Cells[2, i + 1] := ENLineCableList.list[i].invNumber; //����������� ����� ��������� ����� 6 - 10 ��
            if ENLineCableList.list[i].lineLength = nil then
              Cells[3, i + 1] := '' //������������ ����� �������� ���������� 6 - 10 / 0,4 �� ��������� ����� 6 - 10 ��
            else
              Cells[3, i + 1] := ENLineCableList.list[i].lineLength.DecimalString;

            if ENLineCableList.list[i].voltageNominalValue = nil then
              Cells[4, i + 1] := ''
            else
              Cells[4, i + 1] := ENLineCableList.list[i].voltageNominalValue.DecimalString;

            TempENHVCS := HTTPRIOENHighVoltCellSupplies
              as ENHighVoltCellSuppliesControllerSoapPort;

            ENHVCSFilterObj := ENHighVoltCellSuppliesFilter.Create;
            try
              SetNullIntProps(ENHVCSFilterObj);
              SetNullXSProps(ENHVCSFilterObj);
              ENHVCSFilterObj.conditionSQL :=
                ' COALESCE(ENHIGHVOLTCELLSUPPLIES.SUBSTATION04REFCODE, 0) = ' +
                IntToStr(ENSubstation04Obj.code) +
                ' AND COALESCE(ENHIGHVOLTCELLSUPPLIES.LINECABLEREFCODE, 0) = ' +
                IntToStr(ENLineCableList.list[i].code);
              ENHVCSList := TempENHVCS.getScrollableFilteredList(
                ENHVCSFilterObj, 0, 1);
              try
                if ENHVCSList.totalCount = 1 then
                  Cells[5, i + 1] := //� �������������� ������
                    ENHVCSList.list[0].highVoltCellRefNumberGen;
              finally
                ENHVCSList.Free;
                ENHVCSList := nil;
              end;
            finally
              ENHVCSFilterObj.Free;
              ENHVCSFilterObj := nil;
            end;

            lcsLastRow := i + 1;
            sgENLineCable.RowCount := lcsLastRow + 1;
          end;
        lcsColCount := lcsColCount + 1;
        sgENLineCable.Row := 1;
      //���������� ������ ��������� � ���������� ������������� ������������,
      //������������������ �� �������� ���������� 6 - 10 / 0,4 �� �����
      SetGridHeaders(ENAgreeJointHeaders, sgENAgreeJoint.ColumnHeaders);
      ajColCount := 100;
      TempENAgreeJoint := HTTPRIOENAgreeJoint as ENAgreeJointControllerSoapPort;
      if ajFilterObject = nil then
        begin
          ajFilterObject := ENAgreeJointFilter.Create;
          SetNullIntProps(ajFilterObject);
          SetNullXSProps(ajFilterObject);
        end;

      ajFilterObject.conditionSQL :=
        ' ENAGREEJOINT.LINE10REFCODE IN (SELECT ENLINE10.CODE FROM ENLINE10 WHERE '
        + 'ENLINE10.CODE IN (SELECT HVCS.LINE10REFCODE '
        + 'FROM ENHIGHVOLTCELLSUPPLIES HVCS WHERE HVCS.SUBSTATION04REFCODE = '
        + IntToStr(ENSubstation04Obj.code)
        + ') AND COALESCE(ENLINE10.HIGHVOLTAGESELLCODE, 0) <> 0) '
        + ' OR '
        + ' ENAGREEJOINT.LINECABLEREFCODE IN (SELECT ENLINECABLE.CODE FROM ENLINECABLE WHERE '
        + 'ENLINECABLE.CODE IN (SELECT HVCS.LINECABLEREFCODE '
        + 'FROM ENHIGHVOLTCELLSUPPLIES HVCS WHERE HVCS.SUBSTATION04REFCODE = '
        + IntToStr(ENSubstation04Obj.code)
        + ') AND COALESCE(ENLINECABLE.HIGHVOLTAGESELLCODE, 0) <> 0)';

      ENAgreeJointList := TempENAgreeJoint.getScrollableFilteredList(
        ENAgreeJointFilter(ajFilterObject), 0, ajColCount);

      ajLastCount:=High(ENAgreeJointList.list);

      if ajLastCount > -1 then
         sgENAgreeJoint.RowCount := ajLastCount + 2
      else
         sgENAgreeJoint.RowCount := 2;

      with sgENAgreeJoint do
        for i := 0 to ajLastCount do
          begin
            Application.ProcessMessages;
            if ENAgreeJointList.list[i].code <> Low(Integer) then
              Cells[0, i + 1] := IntToStr(ENAgreeJointList.list[i].code)
            else
              Cells[0, i + 1] := '';
            Cells[1, i + 1] := ENAgreeJointList.list[i].name;
            Cells[2, i + 1] := ENAgreeJointList.list[i].agreeNum;
            if ENAgreeJointList.list[i].agreeDate = nil then
              Cells[3, i + 1] := ''
            else
              Cells[3, i + 1] := XSDate2String(ENAgreeJointList.list[i].agreeDate);
            Cells[4, i + 1] := ENAgreeJointList.list[i].balanceLim;
            if ENAgreeJointList.list[i].line10RefCode <> Low(Integer) then
              Cells[5, i + 1] := IntToStr(ENAgreeJointList.list[i].line10RefCode);
            if ENAgreeJointList.list[i].lineCableRefCode <> Low(Integer) then
              Cells[6, i + 1] := IntToStr(ENAgreeJointList.list[i].lineCableRefCode);
            ajLastRow := i + 1;
            sgENAgreeJoint.RowCount := ajLastRow + 1;
          end;
      ajColCount := ajColCount + 1;
      sgENAgreeJoint.Row := 1;
    end; //if pcHighVoltageParty.ActivePage = tsElectricLineSupplies then

  sgENHighVoltageSell.OnRowChanging(
    TObject(sgENHighVoltageSell), 0, sgENHighVoltageSell.Row, Allow);

  if pcHighVoltageParty.ActivePage = tsElectricLineSupplies then
    begin
      if (rbENLine10.Checked) and (sgENLine10.Row <> -1) then
        sgENLine10.OnRowChanging(sgENLine10, 0, sgENLine10.Row, Allow)
      else if (*rbENLineCable.Checked and*) (sgENLineCable.Row <> -1) then
        sgENLineCable.OnRowChanging(sgENLineCable, 0, sgENLineCable.Row, Allow);
    end; //if pcHighVoltageParty.ActivePage = tsElectricLineSupplies then

end;

procedure TfrmENSubstation04Edit.pcBoardEquipmentChange(Sender: TObject);
var i: Integer; Allow: Boolean;
  TempENContactBreaker: ENContactBreakerControllerSoapPort;
  ENContactBreakerList: ENContactBreakerShortList;
  TempENFuse: ENFuseControllerSoapPort;
  ENFuseList: ENFuseShortList;
  TempENAutomat: ENAutomatControllerSoapPort;
  ENAutomatList: ENAutomatShortList;
  TempENMeasurDevice: ENMeasurDeviceControllerSoapPort;
  ENMeasurDeviceList: ENMeasurDeviceShortList;
begin
  ChangeLVBEquipmentHeaders;
  if pcBoardEquipment.ActivePage = tsContactBreakerLVB then
    begin //���� ������� ������� "����������" (������������� �������)
      //SetGridHeaders(ENContactBreakerHeaders, sgENContactBreaker.ColumnHeaders);
      cbColCount:=100;
      TempENContactBreaker :=  HTTPRIOENContactBreaker as ENContactBreakerControllerSoapPort;

      if cbFilterObject = nil then
        begin
          cbFilterObject := ENContactBreakerFilter.Create;
          SetNullIntProps(cbFilterObject);
          SetNullXSProps(cbFilterObject);
        end;

      cbFilterObject.conditionSQL :=
        ' ENCONTACTBREAKER.ELEMENTCODE IN (SELECT E.CODE FROM ENELEMENT E WHERE E.ELEMENTINREFCODE = '
        + IntToStr(ENSubstation04Obj.element.code)
        + ') AND (COALESCE(ENBRANCH.CODE, 0) <> 0 OR COALESCE(ENLOWVOLTBOARD.CODE, 0) <> 0)';

      ENContactBreakerList := TempENContactBreaker.getScrollableFilteredList(
        ENContactBreakerFilter(cbFilterObject), 0, cbColCount);
      cbLastCount:=High(ENContactBreakerList.list);

      if cbLastCount > -1 then
         sgENContactBreaker.RowCount := cbLastCount + 2
      else
         sgENContactBreaker.RowCount := 2;

       with sgENContactBreaker do
        for i := 0 to cbLastCount do
          begin
            Application.ProcessMessages;
            if ENContactBreakerList.list[i].code <> Low(Integer) then
              Cells[0, i + 1] := IntToStr(ENContactBreakerList.list[i].code)
            else
              Cells[0, i + 1] := ''; //��� ����������

            Cells[1, i + 1] := ENContactBreakerList.list[i].materialRefName; //��������� �� ����������� ����������� ����������
            if ENContactBreakerList.list[i].current = nil then
              Cells[2, i + 1] := '' //����������� ���
            else
              Cells[2, i + 1] :=
                ENContactBreakerList.list[i].current.DecimalString;
            if ENContactBreakerList.list[i].branchCode <> Low(Integer) then
              begin
                Cells[3, i + 1] := ENContactBreakerList.list[i].panelName; //����� ������
                Cells[4, i + 1] := ENContactBreakerList.list[i].branchNumberGen; //����� �������������
                Cells[5, i + 1] := //��� �������������
                  IntToStr(ENContactBreakerList.list[i].branchCode)
              end
            else
              begin
                Cells[3, i + 1] := '���';
                if ENContactBreakerList.list[i].panelCode <> low(Integer) then
                  Cells[3, i + 1] := Cells[3, i + 1] + '. ' +
                    ENContactBreakerList.list[i].panelName;
                Cells[4, i + 1] := ENContactBreakerList.list[i].transformerName;
                if ENContactBreakerList.list[i].transformerNominalPower <> nil
                then
                  Cells[4, i + 1] := Cells[4, i + 1] + '. P = ' +
                    ENContactBreakerList.list[
                      i].transformerNominalPower.DecimalString + ' ���';
                if ENContactBreakerList.list[i].transformerCode <> low(Integer)
                then //��� ��������������
                  Cells[5, i + 1] :=
                    IntToStr(ENContactBreakerList.list[i].transformerCode)
                else
                  Cells[5, i + 1] := '';
              end;
            cbLastRow := i + 1;
            sgENContactBreaker.RowCount := cbLastRow + 1;
          end;
       cbColCount := cbColCount + 1;
       sgENContactBreaker.Row := 1;
    end; //if pcBoardEquipment.ActivePage = tsContactBreaker then

  if pcBoardEquipment.ActivePage = tsFuseLVB then
    begin //���� ������� ������� "��������������" (������������� �������)
      //SetGridHeaders(ENFuseLVBHeaders, sgENFuseLVB.ColumnHeaders);
      fsLvbColCount:=100;
      TempENFuse :=  HTTPRIOENFuseLVB as ENFuseControllerSoapPort;

      if fsLvbFilterObject = nil then
      begin
         fsLvbFilterObject := ENFuseFilter.Create;
         SetNullIntProps(fsLvbFilterObject);
         SetNullXSProps(fsLvbFilterObject);
      end;

      fsLvbFilterObject.conditionSQL :=
        ' ENFUSE.ELEMENTCODE IN (SELECT E.CODE FROM ENELEMENT E WHERE E.ELEMENTINREFCODE = '
        + IntToStr(ENSubstation04Obj.element.code)
        + ') AND (COALESCE(ENBRANCH.CODE, 0) <> 0 OR COALESCE(ENLOWVOLTBOARD.CODE, 0) <> 0)';

      ENFuseList := TempENFuse.getScrollableFilteredList(
        ENFuseFilter(fsLvbFilterObject), 0, fsLvbColCount);

      fsLvbLastCount := High(ENFuseList.list);

      if fsLvbLastCount > -1 then
         sgENFuseLVB.RowCount := fsLvbLastCount + 2
      else
         sgENFuseLVB.RowCount := 2;

       with sgENFuseLVB do
        for i := 0 to fsLvbLastCount do
          begin
            Application.ProcessMessages;
            if ENFuseList.list[i].code <> Low(Integer) then //��� ��������������
              Cells[0, i + 1] := IntToStr(ENFuseList.list[i].code)
            else
              Cells[0, i + 1] := '';
            Cells[1, i + 1] := ENFuseList.list[i].materialRefName; //�������������� �� ����������� ����������� ����������
            if ENFuseList.list[i].currentFuse = nil then
              Cells[2, i + 1] := '' //��� ������� �������
            else
              Cells[2, i + 1] := ENFuseList.list[i].currentFuse.DecimalString;
            if ENFuseList.list[i].branchCode <> Low(Integer) then
              begin
                Cells[3, i + 1] := ENFuseList.list[i].panelName; //����� ������
                Cells[4, i + 1] := ENFuseList.list[i].branchNumberGen; //����� �������������
                Cells[5, i + 1] := IntToStr(ENFuseList.list[i].branchCode); //��� �������������
              end
            else
              begin
                Cells[3, i + 1] := '���';
                if ENFuseList.list[i].panelCode <> low(Integer) then
                  Cells[3, i + 1] := Cells[3, i + 1] + '. ' +
                    ENFuseList.list[i].panelName;
                Cells[4, i + 1] := ENFuseList.list[i].transformerName;
                if ENFuseList.list[i].transformerNominalPower <> nil
                then
                  Cells[4, i + 1] := Cells[4, i + 1] + '. P = ' +
                    ENFuseList.list[i].transformerNominalPower.DecimalString
                    + ' ���';
                if ENFuseList.list[i].transformerCode <> low(Integer) then
                  Cells[5, i + 1] :=  //��� ��������������
                    IntToStr(ENFuseList.list[i].transformerCode)
                else
                  Cells[5, i + 1] := '';
              end;
            fsLvbLastRow := i + 1;
            sgENFuseLVB.RowCount := fsLvbLastRow + 1;
          end;
       fsLvbColCount := fsLvbColCount + 1;
       sgENFuseLVB.Row := 1;
    end; //if pcBoardEquipment.ActivePage = tsFuseLVB then

  if pcBoardEquipment.ActivePage = tsAutomatLVB then
    begin //���� ������� ������� "��������" (������������� �������)
      //SetGridHeaders(ENAutomatHeaders, sgENAutomat.ColumnHeaders);
      amColCount := 100;
      TempENAutomat := HTTPRIOENAutomat as ENAutomatControllerSoapPort;
      if amFilterObject = nil then
        begin
          amFilterObject := ENAutomatFilter.Create;
          SetNullIntProps(amFilterObject);
          SetNullXSProps(amFilterObject);
        end;
      amFilterObject.conditionSQL :=
        ' ENAUTOMAT.ELEMENTCODE IN (SELECT E.CODE FROM ENELEMENT E WHERE E.ELEMENTINREFCODE = '
        + IntToStr(ENSubstation04Obj.element.code)
        + ') AND (COALESCE(ENBRANCH.CODE, 0) <> 0 OR COALESCE(ENLOWVOLTBOARD.CODE, 0) <> 0)';
      ENAutomatList := TempENAutomat.getScrollableFilteredList(
        ENAutomatFilter(amFilterObject), 0, amColCount);
      amLastCount := High(ENAutomatList.list);
      if amLastCount > -1 then
         sgENAutomat.RowCount := amLastCount + 2
      else
         sgENAutomat.RowCount := 2;
       with sgENAutomat do
        for i := 0 to amLastCount do
          begin
            Application.ProcessMessages;
            if ENAutomatList.list[i].code <> Low(Integer) then
              Cells[0, i + 1] := IntToStr(ENAutomatList.list[i].code)
            else //��� ��������������� �����������
              Cells[0, i + 1] := '';
            Cells[1, i + 1] := ENAutomatList.list[i].materialRefName; //�������������� ����������� �� ����������� ����������� ����������

            if (ENAutomatList.list[i].markCurrent <> nil) then
              Cells[2, i + 1] := ENAutomatList.list[i].markCurrent.decimalString
            else //��� �������
              Cells[2, i + 1] := '';

            if (ENAutomatList.list[i].thermalSplitterCurrent <> nil) then
              Cells[3, i + 1] := ENAutomatList.list[i].thermalSplitterCurrent.decimalString
            else //��� ��������� �����������
              Cells[3, i + 1] := '';

            if ENAutomatList.list[i].branchCode <> Low(Integer) then
              begin
                Cells[4, i + 1] := ENAutomatList.list[i].panelName; //����� ������
                Cells[5, i + 1] := ENAutomatList.list[i].branchNumberGen; //����� �������������
                Cells[6, i + 1] := IntToStr(ENAutomatList.list[i].branchCode); //��� �������������
              end
            else
              begin
                Cells[4, i + 1] := '���';
                if ENAutomatList.list[i].panelCode <> low(Integer) then
                  Cells[4, i + 1] := Cells[4, i + 1] + '. ' +
                    ENAutomatList.list[i].panelName;
                Cells[5, i + 1] := ENAutomatList.list[i].transformerName;
                if ENAutomatList.list[i].transformerNominalPower <> nil
                then
                  Cells[5, i + 1] := Cells[5, i + 1] + '. P = ' +
                    ENAutomatList.list[i].transformerNominalPower.DecimalString
                    + ' ���';
                if ENAutomatList.list[i].transformerCode <> low(Integer) then
                  Cells[6, i + 1] := //��� ��������������
                    IntToStr(ENAutomatList.list[i].transformerCode)
                else
                  Cells[6, i + 1] := '';
              end;
            amLastRow := i + 1;
            sgENAutomat.RowCount := amLastRow + 1;
          end;
       amColCount := amColCount + 1;
       sgENAutomat.Row := 1;
    end; //if pcBoardEquipment.ActivePage = tsAutomat then

  if pcBoardEquipment.ActivePage = tsMeasurDeviceLVB then
    begin //���� ������� ������� "������������� �������" (������������� �������)
      //SetGridHeaders(ENMeasurDeviceLVBHeaders, sgENMeasurDeviceLVB.ColumnHeaders);
      mdLvbColCount:=100;
      TempENMeasurDevice :=
        HTTPRIOENMeasurDevice as ENMeasurDeviceControllerSoapPort;

      if mdLvbFilterObject = nil then
        begin
          mdLvbFilterObject := ENMeasurDeviceFilter.Create;
          SetNullIntProps(mdLvbFilterObject);
          SetNullXSProps(mdLvbFilterObject);
        end;

      mdLvbFilterObject.conditionSQL :=
        ' ENMEASURDEVICE.ELEMENTCODE IN (SELECT E.CODE FROM ENELEMENT E WHERE E.ELEMENTINREFCODE = '
        + IntToStr(ENSubstation04Obj.element.code)
        + ') AND (COALESCE(ENBRANCH.CODE, 0) <> 0 OR COALESCE(ENLOWVOLTBOARD.CODE, 0) <> 0)';

      ENMeasurDeviceList := TempENMeasurDevice.getScrollableFilteredList(
        ENMeasurDeviceFilter(mdLvbFilterObject), 0, mdLvbColCount);
      mdLvbLastCount := High(ENMeasurDeviceList.list);
      if mdLvbLastCount > -1 then
         sgENMeasurDeviceLVB.RowCount := mdLvbLastCount + 2
      else
         sgENMeasurDeviceLVB.RowCount := 2;
       with sgENMeasurDeviceLVB do
        for i := 0 to mdLvbLastCount do
          begin
            Application.ProcessMessages;
            if ENMeasurDeviceList.list[i].code <> Low(Integer) then
              Cells[0,i + 1] := IntToStr(ENMeasurDeviceList.list[i].code)
            else
              Cells[0, i + 1] := ''; //���
            Cells[1, i + 1] := ENMeasurDeviceList.list[i].materialRefName; //������������� ������ �� ����������� ����������� ����������
            Cells[2, i + 1] := ENMeasurDeviceList.list[i].workNumber; //��������� �����
            Cells[3, i + 1] := ENMeasurDeviceList.list[i].scaleName; //�����
            if ENMeasurDeviceList.list[i].branchCode <> Low(Integer) then
              begin
                Cells[4, i + 1] := ENMeasurDeviceList.list[i].panelName; //����� ������
                Cells[5, i + 1] := ENMeasurDeviceList.list[i].branchNumberGen; //����� �������������
                Cells[6, i + 1] := //��� �������������
                  IntToStr(ENMeasurDeviceList.list[i].branchCode);
              end
            else
              begin
                Cells[4, i + 1] := '���';
                if ENMeasurDeviceList.list[i].panelCode <> low(Integer) then
                  Cells[4, i + 1] := Cells[4, i + 1] + '. ' +
                    ENMeasurDeviceList.list[i].panelName;
                Cells[5, i + 1] := ENMeasurDeviceList.list[i].transformerName;
                if ENMeasurDeviceList.list[i].transformerNominalPower <> nil
                then
                  Cells[5, i + 1] := Cells[5, i + 1] + '. P = ' +
                    ENMeasurDeviceList.list[
                      i].transformerNominalPower.DecimalString + ' ���';
                if ENMeasurDeviceList.list[i].transformerCode <> low(Integer)
                then
                  Cells[6, i + 1] := //��� ��������������
                    IntToStr(ENMeasurDeviceList.list[i].transformerCode)
                else
                  Cells[6, i + 1] := '';
              end;
            mdLvbLastRow := i + 1;
            sgENMeasurDeviceLVB.RowCount := mdLvbLastRow + 1;
          end;
       mdLvbColCount := mdLvbColCount + 1;
       sgENMeasurDeviceLVB.Row := 1;
    end; //if pcBoardEquipment.ActivePage = tsMeasurDeviceLVB then
  if chbLowVoltBoard.Checked then
    LowVoltBoardEquipmentShow
  else
    sgENBranch.OnRowChanging(TObject(sgENBranch), 0, sgENBranch.Row, Allow);
end;


procedure TfrmENSubstation04Edit.ChangeLVBEquipmentHeaders;
begin //��������� ���������� �������� ������������ ������������� �������
  if chbLowVoltBoard.Checked then
    begin
      if pcBoardEquipment.ActivePage = tsContactBreakerLVB then
        SetGridHeaders(
          ENContactBreakerMainTireHeaders, sgENContactBreaker.ColumnHeaders)
      else if pcBoardEquipment.ActivePage = tsFuseLVB then
        SetGridHeaders(
          ENFuseLVBMainTireHeaders, sgENFuseLVB.ColumnHeaders)
      else if pcBoardEquipment.ActivePage = tsAutomatLVB then
        SetGridHeaders(
          ENAutomatMainTireHeaders, sgENAutomat.ColumnHeaders)
      else if pcBoardEquipment.ActivePage = tsMeasurDeviceLVB then
        SetGridHeaders(
          ENMeasurDeviceLVBMainTireHeaders, sgENMeasurDeviceLVB.ColumnHeaders);
    end
  else //if not chbLowVoltBoard.Checked then
    begin
      if pcBoardEquipment.ActivePage = tsContactBreakerLVB then
        SetGridHeaders(
          ENContactBreakerHeaders, sgENContactBreaker.ColumnHeaders)
      else if pcBoardEquipment.ActivePage = tsFuseLVB then
        SetGridHeaders(
          ENFuseLVBHeaders, sgENFuseLVB.ColumnHeaders)
      else if pcBoardEquipment.ActivePage = tsAutomatLVB then
        SetGridHeaders(
          ENAutomatHeaders, sgENAutomat.ColumnHeaders)
      else if pcBoardEquipment.ActivePage = tsMeasurDeviceLVB then
        SetGridHeaders(
          ENMeasurDeviceLVBHeaders, sgENMeasurDeviceLVB.ColumnHeaders);
    end;
end;

procedure TfrmENSubstation04Edit.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin

  if pcSubstation04.ActivePage = tsFiderGuage then
    begin //���������� ��������
      for i := 1 to sgENFiderGuage.RowCount - 1 do
        for j := 0 to sgENFiderGuage.ColCount - 1 do
          sgENFiderGuage.Cells[j, i] := '';
    end;

  if pcSubstation04.ActivePage = tsTransformers then
    begin //�������������� ���������� 6 - 10 / 0,4 ��
      for i := 1 to sgENTransformer.RowCount - 1 do
        for j := 0 to sgENTransformer.ColCount - 1 do
          sgENTransformer.Cells[j, i] := '';
    end;

  if pcSubstation04.ActivePage = tsHighVoltageParty then
    begin //�������������� ������ ���������� 6 - 10 / 0,4 ��
      for i := 1 to sgENHighVoltageSell.RowCount - 1 do
        for j := 0 to sgENHighVoltageSell.ColCount - 1 do
          sgENHighVoltageSell.Cells[j, i] := '';
      if pcHighVoltageParty.ActivePage = tsDisconnector then
        begin //������������� �� �������������� ������� ���������� 6 - 10 / 0,4 ��
          for i := 1 to sgENDisconnector.RowCount - 1 do
            for j := 0 to sgENDisconnector.ColCount - 1 do
              sgENDisconnector.Cells[j, i] := '';
        end
      else if pcHighVoltageParty.ActivePage = tsLoadSwitch then
        begin //����������� �������� �� �������������� ������� ���������� 6 - 10 / 0,4 ��
          for i := 1 to sgENLoadSwitch.RowCount - 1 do
            for j := 0 to sgENLoadSwitch.ColCount - 1 do
              sgENLoadSwitch.Cells[j, i] := '';
        end
      else if pcHighVoltageParty.ActivePage = tsFuse then
        begin //�������������� �� �������������� ������� ���������� 6 - 10 / 0,4 ��
          for i := 1 to sgENFuse.RowCount - 1 do
            for j := 0 to sgENFuse.ColCount - 1 do
              sgENFuse.Cells[j, i] := '';
        end
      else if pcHighVoltageParty.ActivePage = tsInsulator then
        begin //��������� �� �������������� ������� ���������� 6 - 10 / 0,4 ��
          for i := 1 to sgENInsulator.RowCount - 1 do
            for j := 0 to sgENInsulator.ColCount - 1 do
              sgENInsulator.Cells[j, i] := '';
        end
      else if pcHighVoltageParty.ActivePage = tsArrester then
        begin //���������� �� �������������� ������� ���������� 6 - 10 / 0,4 ��
          for i := 1 to sgENArrester.RowCount - 1 do
            for j := 0 to sgENArrester.ColCount - 1 do
              sgENArrester.Cells[j, i] := '';
        end
      else if pcHighVoltageParty.ActivePage = tsCurrentTransformer then
        begin //�������������� ���� �� �������������� ������� ���������� 6 - 10 / 0,4 ��
          for i := 1 to sgENCurrentTransformer.RowCount - 1 do
            for j := 0 to sgENCurrentTransformer.ColCount - 1 do
              sgENCurrentTransformer.Cells[j, i] := '';
        end
      else if pcHighVoltageParty.ActivePage = tsBus then
        begin //���� �� �������������� ������� ���������� 6 - 10 / 0,4 ��
          for i := 1 to sgENBus.RowCount - 1 do
            for j := 0 to sgENBus.ColCount - 1 do
              sgENBus.Cells[j, i] := '';
        end
      else if pcHighVoltageParty.ActivePage = tsMeasurDevice then
        begin //������������� ������� �� �������������� ������� ���������� 6 - 10 / 0,4 ��
          for i := 1 to sgENMeasurDevice.RowCount - 1 do
            for j := 0 to sgENMeasurDevice.ColCount - 1 do
              sgENMeasurDevice.Cells[j, i] := '';
        end
      else if pcHighVoltageParty.ActivePage = tsElectricLineSupplies then
        begin //����� ������� �� �������������� ������� ���������� 6 - 10 / 0,4 ��
          for i := 1 to sgENLine10.RowCount - 1 do //��������� ����� 6 - 10 ��
            for j := 0 to sgENLine10.ColCount - 1 do
              sgENLine10.Cells[j, i] := '';
          for i := 1 to sgENLineCable.RowCount - 1 do //��������� ����� �������
            for j := 0 to sgENLineCable.ColCount - 1 do
              sgENLineCable.Cells[j, i] := '';
          for i := 1 to sgENAgreeJoint.RowCount - 1 do //�������� � ���
            for j := 0 to sgENAgreeJoint.ColCount - 1 do
              sgENAgreeJoint.Cells[j,i] := '';
        end;
    end; //if pcSubstation04.ActivePage = tsHighVoltageParty then

  if pcSubstation04.ActivePage = tsLowVoltageBoard then
    begin //������ �������������� ���� ���������� 6 - 10 / 0,4 ��
      for i := 1 to sgENPanel.RowCount - 1 do
        for j := 0 to sgENPanel.ColCount - 1 do
          sgENPanel.Cells[j,i] := '';
      //������������� ��������� �� ������������� ������� �����
      for i := 1 to sgENBranch.RowCount - 1 do
        for j := 0 to sgENBranch.ColCount - 1 do
          sgENBranch.Cells[j,i] := '';

      if pcBoardEquipment.ActivePage = tsContactBreakerLVB then
        begin //���������� �� ������������� ������� ���������� 6 - 10 / 0,4 ��
          for i := 1 to sgENContactBreaker.RowCount - 1 do
            for j := 0 to sgENContactBreaker.ColCount - 1 do
              sgENContactBreaker.Cells[j, i] := '';
        end
      else if pcBoardEquipment.ActivePage = tsFuseLVB then
        begin //�������������� �� ������������� ������� ���������� 6 - 10 / 0,4 ��
          for i := 1 to sgENFuseLVB.RowCount - 1 do
            for j := 0 to sgENFuseLVB.ColCount - 1 do
              sgENFuseLVB.Cells[j, i] := '';
        end
      else if pcBoardEquipment.ActivePage = tsAutomatLVB then
        begin //�������� �� ������������� ������� ���������� 6 - 10 / 0,4 ��
          for i := 1 to sgENAutomat.RowCount - 1 do
            for j := 0 to sgENAutomat.ColCount - 1 do
              sgENAutomat.Cells[j, i] := '';
        end
      else if pcBoardEquipment.ActivePage = tsMeasurDeviceLVB then
        begin //������������� ������� �� ������������� ������� ���������� 6 - 10 / 0,4 ��
          for i := 1 to sgENMeasurDeviceLVB.RowCount - 1 do
            for j := 0 to sgENMeasurDeviceLVB.ColCount - 1 do
              sgENMeasurDeviceLVB.Cells[j, i] := '';
        end
    end; //if pcSubstation04.ActivePage = tsLowVoltageBoard then

  pcSubstation04Change(Sender);
  pcHighVoltagePartyChange(Sender);
  pcBoardEquipmentChange(Sender);
end;


procedure TfrmENSubstation04Edit.actEditExecute(Sender: TObject);
Var TempENTransformer: ENTransformerControllerSoapPort;
  TempENHighVoltageSell: ENHighVoltageSellControllerSoapPort;
  TempENSafetyPrecautions: ENSafetyPrecautionsControllerSoapPort;
  TempENPanel: ENPanelControllerSoapPort;
  TempENFiderGuage: ENFiderGuageControllerSoapPort;
begin
  if pcSubstation04.ActivePage = tsFiderGuage then
    begin //�������������� ���������� � ���������� ��������
      TempENFiderGuage := HTTPRIOENFiderGuage as ENFiderGuageControllerSoapPort;
      try
        ENFiderGuageObj := TempENFiderGuage.getObject(
          StrToInt(sgENFiderGuage.Cells[0, sgENFiderGuage.Row]));
      except
        on EConvertError do Exit;
      end;
      frmENFiderGuageEdit := TfrmENFiderGuageEdit.Create(Application, dsEdit);
      try
        frmENFiderGuageEdit.codeElemS04 := ENSubstation04Obj.element.code;
        if frmENFiderGuageEdit.ShowModal= mrOk then
          UpdateGrid(Sender);
      finally
        frmENFiderGuageEdit.Free;
        frmENFiderGuageEdit := nil;
      end;
    end;

  if pcSubstation04.ActivePage = tsLowVoltageBoard then
    begin //�������������� ������ �������������� ����
     TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
       try
         ENPanelObj := TempENPanel.getObject(StrToInt(sgENPanel.Cells[0,sgENPanel.Row]));
       except
       on EConvertError do Exit;
      end;
      frmENPanelEdit := TfrmENPanelEdit.Create(Application, dsEdit);
      try
        frmENPanelEdit.codeS04 := ENSubstation04Obj.code;
        frmENPanelEdit.pnlBrCnt := brLastCount + 1;
        if frmENPanelEdit.ShowModal= mrOk then
          UpdateGrid(Sender);
      finally
        frmENPanelEdit.Free;
        frmENPanelEdit := nil;
      end;
    end; //if pcSubstation04.ActivePage = tsLowVoltageBoard then

  if pcSubstation04.ActivePage = tsTransformers then
    begin
     TempENTransformer := HTTPRIOENTransformer as ENTransformerControllerSoapPort;
       try
         ENTransformerObj := TempENTransformer.getObject(StrToInt(sgENTransformer.Cells[0,sgENTransformer.Row]));
       except
       on EConvertError do Exit;
      end;
      frmENTransformerEdit:=TfrmENTransformerEdit.Create(Application, dsEdit);
      try
        frmENTransformerEdit.edtENSubstation04Name.Text := ENSubstation04Obj.name;
        if frmENTransformerEdit.ShowModal= mrOk then
          begin
            //TempENTransformer.save(ENTransformerObj);
            recalcTransformers();
            UpdateGrid(Sender);
          end;
      finally
        frmENTransformerEdit.Free;
        frmENTransformerEdit:=nil;
      end;
    end; // if pcSubstation04.ActivePage = tsTransformers

  if pcSubstation04.ActivePage = tsHighVoltageParty then
    begin
      TempENHighVoltageSell :=
        HTTPRIOENHighVoltageSell as ENHighVoltageSellControllerSoapPort;
      try
        ENHighVoltageSellObj :=
          TempENHighVoltageSell.getObject(StrToInt(
            sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]));
      except
        on EConvertError do Exit;
      end;
      frmENHighVoltageSellEdit :=
        TfrmENHighVoltageSellEdit.Create(Application, dsEdit);
      try
        frmENHighVoltageSellEdit.st04Code := ENSubstation04Obj.code;
        if frmENHighVoltageSellEdit.ShowModal= mrOk then
          begin
            TempENSafetyPrecautions := HTTPRIOENSafetyPrecautions
              as ENSafetyPrecautionsControllerSoapPort;
            if ENSafetyPrecautionsHVCObj = nil then
              case codeSPrHVC of
                0:
                  ENSafetyPrecautionsHVCObj := ENSafetyPrecautions.Create;
                else
                  ENSafetyPrecautionsHVCObj :=
                    TempENSafetyPrecautions.getObject(codeSPrHVC);
              end;
            try
              if ENSafetyPrecautionsHVCObj.substation04Ref = nil then
                ENSafetyPrecautionsHVCObj.substation04Ref :=
                  ENSubstation04Ref.Create;
              ENSafetyPrecautionsHVCObj.substation04Ref.code :=
                ENSubstation04Obj.code;
              if ENSafetyPrecautionsHVCObj.highVoltageSell = nil then
                ENSafetyPrecautionsHVCObj.highVoltageSell :=
                  ENHighVoltageSellRef.Create;
              ENSafetyPrecautionsHVCObj.highVoltageSell.code := StrToInt(
                sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);
              if ENSafetyPrecautionsHVCObj.fencing = nil then
                ENSafetyPrecautionsHVCObj.fencing := ENFencing.Create;
              if frmENHighVoltageSellEdit.cbENFencing.ItemIndex <> -1 then
                ENSafetyPrecautionsHVCObj.fencing.code :=
                  frmENHighVoltageSellEdit.cbENFencing.ItemIndex;
              if ENSafetyPrecautionsHVCObj.lockType = nil then
                ENSafetyPrecautionsHVCObj.lockType := ENLockType.Create;
              if ENSafetyPrecautionsHVCObj.matLockRef = nil then
                ENSafetyPrecautionsHVCObj.matLockRef := TKMaterialsRef.Create;
              if frmENHighVoltageSellEdit.rbLockTypeAbsent.Checked then
                begin
                  ENSafetyPrecautionsHVCObj.lockType.code := 0;
                  ENSafetyPrecautionsHVCObj.matLockRef.code := Low(Integer);
                end
              else if frmENHighVoltageSellEdit.rbLockTypeInternal.Checked then
                begin
                  ENSafetyPrecautionsHVCObj.lockType.code := 1;
                  ENSafetyPrecautionsHVCObj.matLockRef.code := 500017912;
                end
              else if frmENHighVoltageSellEdit.rbLockTypeExternal.Checked then
                begin
                  ENSafetyPrecautionsHVCObj.lockType.code := 2;
                  ENSafetyPrecautionsHVCObj.matLockRef.code := 75000735;
                end;
              case codeSPrHVC of
                0:
                  begin
                    ENSafetyPrecautionsHVCObj.code := Low(Integer);
                    TempENSafetyPrecautions.add(ENSafetyPrecautionsHVCObj);
                  end
                else
                  TempENSafetyPrecautions.save(ENSafetyPrecautionsHVCObj);
              end;
            finally
              ENSafetyPrecautionsHVCObj.Free;
              ENSafetyPrecautionsHVCObj := nil;
            end;
            UpdateGrid(Sender);
          end;
      finally
        frmENHighVoltageSellEdit.Free;
        frmENHighVoltageSellEdit := nil;
      end;
    end; //if pcSubstation04.ActivePage = tsHighVoltageParty then
end;


procedure TfrmENSubstation04Edit.actUpdateENInspectionSheetExecute(
  Sender: TObject);
begin
  inherited;
  pcSubstation04Change(Sender);
end;


procedure TfrmENSubstation04Edit.actUpdateExecute(Sender: TObject);
begin
  UpdateGrid(Sender);
end;

procedure TfrmENSubstation04Edit.actNoFilterExecute(Sender: TObject);
begin
  if pcSubstation04.ActivePage = tsLowVoltageBoard then
  begin
    if Assigned(l04Filter) then
    begin
      l04Filter.Free;
      l04Filter := nil;
    end;
  end;

  if pcSubstation04.ActivePage = tsTransformers then
  begin
    if Assigned(t04FilterObject) then
    begin
      t04FilterObject.Free;
      t04FilterObject := nil;
    end;
  end;

  UpdateGrid(Sender);
end;


procedure TfrmENSubstation04Edit.actEditENInspectionSheetExecute(
  Sender: TObject);
var
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  inherited;
  if pcSubstation04.ActivePage = tsENInspectionSheet then
  begin
    TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
    frmENInspectionSheetEdit := TfrmENInspectionSheetEdit.Create(Application, dsEdit);

    try
      frmENInspectionSheetEdit.ENInspectionSheetObj := TempENInspectionSheet.getObject(StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]));
    except
      on EConvertError do Exit;
    end;

    try
      if frmENInspectionSheetEdit.ShowModal= mrOk then
      begin
        pcSubstation04Change(Sender);
      end;
    finally
      frmENInspectionSheetEdit.Free;
      frmENInspectionSheetEdit:=nil;
    end;
  end;
end;


procedure TfrmENSubstation04Edit.actEditEquipmentExecute(Sender: TObject);
var //��������� ���������� ��� �������������� ������������ �������������� �������
  TempENDisconnector: ENDisconnectorControllerSoapPort;
  TempENLoadSwitch: ENLoadSwitchControllerSoapPort;
  TempENFuse: ENFuseControllerSoapPort;
  TempENInsulator: ENInsulatorControllerSoapPort;
  TempENArrester: ENArresterControllerSoapPort;
  TempENCurrentTransformer: ENCurrentTransformerControllerSoapPort;
  TempENBus: ENBusControllerSoapPort;
  TempENMeasurDevice: ENMeasurDeviceControllerSoapPort;
  //TempENLine10: ENLine10ControllerSoapPort;
  //TempENLineCable: ENLineCableControllerSoapPort;
  //��������� ���������� ��� �������������� ������������ ������������� �������
  TempENContactBreaker: ENContactBreakerControllerSoapPort;
  TempENFuseLVB: ENFuseControllerSoapPort;
  TempENAutomat: ENAutomatControllerSoapPort;
  TempENMeasurDeviceLVB: ENMeasurDeviceControllerSoapPort;
begin
  if pcSubstation04.ActivePage = tsHighVoltageParty then
    begin //���� ������� ������� "�������������� �������"
      if pcHighVoltageParty.ActivePage = tsDisconnector then
        begin
          TempENDisconnector :=
            HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;
          try
            ENDisconnectorObj :=
              TempENDisconnector.getObject(StrToInt(
                sgENDisconnector.Cells[0, sgENDisconnector.Row]));
          except
            on EConvertError do Exit;
          end;
          frmENDisconnectorEdit :=
            TfrmENDisconnectorEdit.Create(Application, dsEdit);
          try
            frmENDisconnectorEdit.spbENHighVoltageSell.Enabled := False;

            //������� ����� �������������� ������������� � �� 6 - 10 ��
            frmENDisconnectorEdit.lblENLine10.Visible := False;
            frmENDisconnectorEdit.memENLine10.Visible := False;
            frmENDisconnectorEdit.lblENPostRefNubmerGen.Visible := False;
            frmENDisconnectorEdit.edtENPostRefNubmerGen.Visible := False;
            frmENDisconnectorEdit.btnOk.Top :=
              frmENDisconnectorEdit.edtENHighVoltageSellName.Top +
              frmENDisconnectorEdit.edtENHighVoltageSellName.Height + 10;
            frmENDisconnectorEdit.btnCancel.Top :=
              frmENDisconnectorEdit.btnOk.Top;
            frmENDisconnectorEdit.Height := frmENDisconnectorEdit.btnOk.Top +
              frmENDisconnectorEdit.btnOk.Height + 30;

            //����� ����� �������������� �������������
            if frmENDisconnectorEdit.ShowModal= mrOk then
              begin
                UpdateGrid(Sender);
              end;
          finally
            frmENDisconnectorEdit.Free;
            frmENDisconnectorEdit := nil;
          end;
        end; //if pcHighVoltageParty.ActivePage = tsDisconnector then
    
      if pcHighVoltageParty.ActivePage = tsLoadSwitch then
        begin
          TempENLoadSwitch :=
            HTTPRIOENLoadSwitch as ENLoadSwitchControllerSoapPort;
          try
            ENLoadSwitchObj :=
              TempENLoadSwitch.getObject(StrToInt(
                sgENLoadSwitch.Cells[0, sgENLoadSwitch.Row]));
          except
            on EConvertError do Exit;
          end;
          frmENLoadSwitchEdit :=
            TfrmENLoadSwitchEdit.Create(Application, dsEdit);
          try
            frmENLoadSwitchEdit.spbENHighVoltageSell.Enabled := False;
            if frmENLoadSwitchEdit.ShowModal= mrOk then
              begin
                UpdateGrid(Sender);
              end;
          finally
            frmENLoadSwitchEdit.Free;
            frmENLoadSwitchEdit := nil;
          end;
        end; //if pcHighVoltageParty.ActivePage = tsLoadSwitch then

      if pcHighVoltageParty.ActivePage = tsFuse then
        begin
          TempENFuse :=
            HTTPRIOENFuse as ENFuseControllerSoapPort;
          try
            ENFuseObj :=
              TempENFuse.getObject(StrToInt(
                sgENFuse.Cells[0, sgENFuse.Row]));
          except
            on EConvertError do Exit;
          end;
          deviceParty := partyHVS; //�������������� ��������� �� �������������� �������
          frmENFuseEdit :=
            TfrmENFuseEdit.Create(Application, dsEdit);
          try
            frmENFuseEdit.spbENHighVoltageSell.Enabled := False;
            frmENFuseEdit.spbENBranch.Enabled := False;
            frmENFuseEdit.codeS04 := ENSubstation04Obj.code;
            if ENSubstation04Obj.element <> nil then
              if ENSubstation04Obj.element.code <> low(Integer) then
                frmENFuseEdit.elementCodeS04 :=
                  ENSubstation04Obj.element.code;

            frmENFuseEdit.memENSubstation04.Text := ENSubstation04Obj.name;
            if ENSubstation04Obj.nominalPower <> nil then
              frmENFuseEdit.memENSubstation04.Text :=
                frmENFuseEdit.memENSubstation04.Text + ', P = '
                + ENSubstation04Obj.nominalPower.DecimalString;
            if ENSubstation04Obj.invNumber <> '' then
              frmENFuseEdit.memENSubstation04.Text :=
                frmENFuseEdit.memENSubstation04.Text + ', ���. � '
                + ENSubstation04Obj.invNumber;

            //��������������� ��������� �� ������ ������� �����������
            frmENFuseEdit.lblTransformer.Top := frmENFuseEdit.lblBranch.Top;
            frmENFuseEdit.memTransformer.Top :=
              frmENFuseEdit.memENBranchName.Top;
            frmENFuseEdit.btnOk.Top :=
              frmENFuseEdit.memTransformer.Top
              + frmENFuseEdit.memTransformer.Height + 10;
            frmENFuseEdit.btnCancel.Top := frmENFuseEdit.btnOk.Top;
            frmENFuseEdit.Height := frmENFuseEdit.btnOk.Top
              + frmENFuseEdit.btnOk.Height + 30;

            //�������� ����� �������������� �������������� (�� ��������������
            if frmENFuseEdit.ShowModal= mrOk then //������)
              begin
                UpdateGrid(Sender);
              end;
          finally
            frmENFuseEdit.Free;
            frmENFuseEdit := nil;
          end;
        end; //if pcHighVoltageParty.ActivePage = tsFuse then

      if pcHighVoltageParty.ActivePage = tsInsulator then
        begin
          TempENInsulator :=
            HTTPRIOENInsulator as ENInsulatorControllerSoapPort;
          try
            ENInsulatorObj :=
              TempENInsulator.getObject(StrToInt(
                sgENInsulator.Cells[0, sgENInsulator.Row]));
          except
            on EConvertError do Exit;
          end;
          frmENInsulatorEdit :=
            TfrmENInsulatorEdit.Create(Application, dsEdit);
          try
            frmENInsulatorEdit.spbENHighVoltageSell.Enabled := False;

            //������� ����� �������������� ��������� � �� 6 - 10 ��
            frmENInsulatorEdit.lblENLine10.Visible := False;
            frmENInsulatorEdit.memENLine10.Visible := False;
            frmENInsulatorEdit.lblENPostRefNubmerGen.Visible := False;
            frmENInsulatorEdit.edtENPostRefNubmerGen.Visible := False;
            frmENInsulatorEdit.btnOk.Top :=
              frmENInsulatorEdit.edtENHighVoltageSellName.Top +
              frmENInsulatorEdit.edtENHighVoltageSellName.Height + 10;
            frmENInsulatorEdit.btnCancel.Top :=
              frmENInsulatorEdit.btnOk.Top;
            frmENInsulatorEdit.Height := frmENInsulatorEdit.btnOk.Top +
              frmENInsulatorEdit.btnOk.Height + 30;

            //����� ����� �������������� ���������
            if frmENInsulatorEdit.ShowModal= mrOk then
              begin
                UpdateGrid(Sender);
              end;
          finally
            frmENInsulatorEdit.Free;
            frmENInsulatorEdit := nil;
          end;
        end; //if pcHighVoltageParty.ActivePage = tsInsulator then

      if pcHighVoltageParty.ActivePage = tsArrester then
        begin
          TempENArrester :=
            HTTPRIOENArrester as ENArresterControllerSoapPort;
          try
            ENArresterObj :=
              TempENArrester.getObject(StrToInt(
                sgENArrester.Cells[0, sgENArrester.Row]));
          except
            on EConvertError do Exit;
          end;
          frmENArresterEdit :=
            TfrmENArresterEdit.Create(Application, dsEdit);
          try
            frmENArresterEdit.spbENHighVoltageSell.Enabled := False;
            if frmENArresterEdit.ShowModal= mrOk then
              begin
                UpdateGrid(Sender);
              end;
          finally
            frmENArresterEdit.Free;
            frmENArresterEdit := nil;
          end;
        end; //if pcHighVoltageParty.ActivePage = tsArrester then

      if pcHighVoltageParty.ActivePage = tsCurrentTransformer then
        begin
          TempENCurrentTransformer :=
            HTTPRIOENCurrentTransformer as ENCurrentTransformerControllerSoapPort;
          try
            ENCurrentTransformerObj :=
              TempENCurrentTransformer.getObject(StrToInt(
                sgENCurrentTransformer.Cells[0, sgENCurrentTransformer.Row]));
          except
            on EConvertError do Exit;
          end;
          frmENCurrentTransformerEdit :=
            TfrmENCurrentTransformerEdit.Create(Application, dsEdit);
          try
            frmENCurrentTransformerEdit.spbENHighVoltageSell.Enabled := False;
            if frmENCurrentTransformerEdit.ShowModal= mrOk then
              begin
                UpdateGrid(Sender);
              end;
          finally
            frmENCurrentTransformerEdit.Free;
            frmENCurrentTransformerEdit := nil;
          end;
        end; //if pcHighVoltageParty.ActivePage = tsCurrentTransformer then

      if pcHighVoltageParty.ActivePage = tsBus then
        begin
          TempENBus :=
            HTTPRIOENBus as ENBusControllerSoapPort;
          try
            ENBusObj :=
              TempENBus.getObject(StrToInt(
                sgENBus.Cells[0, sgENBus.Row]));
          except
            on EConvertError do Exit;
          end;
          frmENBusEdit :=
            TfrmENBusEdit.Create(Application, dsEdit);
          try
            frmENBusEdit.spbENHighVoltageSell.Enabled := False;
            if frmENBusEdit.ShowModal= mrOk then
              begin
                UpdateGrid(Sender);
              end;
          finally
            frmENBusEdit.Free;
            frmENBusEdit := nil;
          end;
        end; //if pcHighVoltageParty.ActivePage = tsBus then

      if pcHighVoltageParty.ActivePage = tsMeasurDevice then
        begin
          TempENMeasurDevice :=
            HTTPRIOENMeasurDevice as ENMeasurDeviceControllerSoapPort;
          try
            ENMeasurDeviceObj :=
              TempENMeasurDevice.getObject(StrToInt(
                sgENMeasurDevice.Cells[0, sgENMeasurDevice.Row]));
          except
            on EConvertError do Exit;
          end;
          deviceParty := PartyHVS; //������������� ������ ��������� �� �������������� �������
          frmENMeasurDeviceEdit :=
            TfrmENMeasurDeviceEdit.Create(Application, dsEdit);
          try
            frmENMeasurDeviceEdit.spbENHighVoltageSell.Enabled := False;
            frmENMeasurDeviceEdit.spbENBranch.Enabled := False;
            if frmENMeasurDeviceEdit.ShowModal= mrOk then
              begin
                UpdateGrid(Sender);
              end;
          finally
            frmENMeasurDeviceEdit.Free;
            frmENMeasurDeviceEdit := nil;
          end;
        end; //if pcHighVoltageParty.ActivePage = tsMeasurDevice then

      (*����������� �������������� ��������� � ��������� ����� �� �����
      �������������� ���������� 6 - 10 / 0,4 �� ���������
      �� ��������� ����������� ������� ������������� �������

      if pcHighVoltageParty.ActivePage = tsElectricLineSupplies then
        begin
          if rbENLine10.Checked then
            begin
              TempENLine10 :=
                HTTPRIOENLine10 as ENLine10ControllerSoapPort;
              try
                ENLine10Obj :=
                  TempENLine10.getObject(StrToInt(
                    sgENLine10.Cells[0, sgENLine10.Row]));
              except
                on EConvertError do Exit;
              end;
              frmENLine10Edit :=
                TfrmENLine10Edit.Create(Application, dsEdit);
              frmENLine10Edit.spbENHighVoltageSell.Enabled := False;
              try
                if frmENLine10Edit.ShowModal= mrOk then
                  begin
                    UpdateGrid(Sender);
                  end;
              finally
                frmENLine10Edit.Free;
                frmENLine10Edit := nil;
              end;
            end //if rbENLine10.Checked then
          else //if rbENLineCable.Checked then
            begin
              TempENLineCable :=
                HTTPRIOENLineCableSupplies as ENLineCableControllerSoapPort;
              try
                ENLineCableObj :=
                  TempENLineCable.getObject(StrToInt(
                    sgENLineCable.Cells[0, sgENLineCable.Row]));
              except
                on EConvertError do Exit;
              end;
              frmENLineCableEdit :=
                TfrmENLineCableEdit.Create(Application, dsEdit);
              frmENLineCableEdit.spbENHighVoltageSell.Enabled := False;
              try
                if frmENLineCableEdit.ShowModal= mrOk then
                  begin
                    UpdateGrid(Sender);
                  end;
              finally
                frmENLineCableEdit.Free;
                frmENLineCableEdit := nil;
              end;
            end; //if rbENLineCable.Checked then
        end; //if pcHighVoltageParty.ActivePage = tsElectricLineSupplies then
        *)
    end //if pcSubstation04.ActivePage = tsHighVoltageParty
  else if pcSubstation04.ActivePage = tsLowVoltageBoard then
    begin //���� ������� ������� "������������� ���"
      if pcBoardEquipment.ActivePage = tsContactBreakerLVB then
        begin
          TempENContactBreaker :=
            HTTPRIOENContactBreaker as ENContactBreakerControllerSoapPort;
          try
            ENContactBreakerObj :=
              TempENContactBreaker.getObject(
                StrToInt(sgENContactBreaker.Cells[0, sgENContactBreaker.Row]));
          except
            on EConvertError do Exit;
          end;
          frmENContactBreakerEdit :=
            TfrmENContactBreakerEdit.Create(Application, dsEdit);
          try
            if chbLowVoltBoard.Checked then
              begin //��������� ��������� �� ������������� ����
                frmENContactBreakerEdit.lblBranch.Caption :=
                  '������������ �� ����';
                deviceParty := partyLVBM;
              end
            else
              begin //��������� ��������� �� ������ �� ����
                frmENContactBreakerEdit.lblBranch.Caption := '��������� �����';
                deviceParty := partyLVBP;
              end;
            frmENContactBreakerEdit.codeS04 := ENSubstation04Obj.code;
            if ENSubstation04Obj.element <> nil then
              if ENSubstation04Obj.element.code <> low(Integer) then
                frmENContactBreakerEdit.elementCodeS04 :=
                  ENSubstation04Obj.element.code;

            if frmENContactBreakerEdit.ShowModal = mrOk then
              begin
                UpdateGrid(Sender);
              end;
          finally
            frmENContactBreakerEdit.Free;
            frmENContactBreakerEdit := nil;
          end;
        end
      else if pcBoardEquipment.ActivePage = tsFuseLVB then
        begin
          TempENFuseLVB :=
            HTTPRIOENFuseLVB as ENFuseControllerSoapPort;
          try
            ENFuseObj := TempENFuseLVB.getObject(
              StrToInt(sgENFuseLVB.Cells[0, sgENFuseLVB.Row]));
          except
            on EConvertError do Exit;
          end;
          frmENFuseEdit :=
            TfrmENFuseEdit.Create(Application, dsEdit);
          try
            if chbLowVoltBoard.Checked then
              begin //�������������� ��������� �� ������������� ����
                frmENFuseEdit.lblBranch.Caption := '������������ �� ����';
                deviceParty := partyLVBM;
              end
            else
              begin //�������������� ��������� �� ������ �� ����
                frmENFuseEdit.lblBranch.Caption := '��������� �����';
                deviceParty := partyLVBP;
              end;
            frmENFuseEdit.codeS04 := ENSubstation04Obj.code;
            if ENSubstation04Obj.element <> nil then
              if ENSubstation04Obj.element.code <> low(Integer) then
                frmENFuseEdit.elementCodeS04 :=
                  ENSubstation04Obj.element.code;

            frmENFuseEdit.memENSubstation04.Text := ENSubstation04Obj.name;
            if ENSubstation04Obj.nominalPower <> nil then
              frmENFuseEdit.memENSubstation04.Text :=
                frmENFuseEdit.memENSubstation04.Text + ', P = '
                + ENSubstation04Obj.nominalPower.DecimalString;
            if ENSubstation04Obj.invNumber <> '' then
              frmENFuseEdit.memENSubstation04.Text :=
                frmENFuseEdit.memENSubstation04.Text + ', ���. � '
                + ENSubstation04Obj.invNumber;
            frmENFuseEdit.lblENHighVoltageSellName.Visible := False;
            frmENFuseEdit.edtENHighVoltageSellName.Visible := False;
            frmENFuseEdit.spbENHighVoltageSell.Visible := False;
            frmENFuseEdit.lblBranch.Visible := True;
            frmENFuseEdit.memENBranchName.Visible := True;
            frmENFuseEdit.spbENBranch.Visible := True;
            frmENFuseEdit.spbENHighVoltageSell.Enabled := False;
            if frmENFuseEdit.ShowModal= mrOk then
              begin
                UpdateGrid(Sender);
              end;
          finally
            frmENFuseEdit.Free;
            frmENFuseEdit := nil;
          end;
        end
      else if pcBoardEquipment.ActivePage = tsAutomatLVB then
        begin
          TempENAutomat := HTTPRIOENAutomat as ENAutomatControllerSoapPort;
          try
            ENAutomatObj := TempENAutomat.getObject(StrToInt(
              sgENAutomat.Cells[0, sgENAutomat.Row]));
          except
            on EConvertError do Exit;
          end;
          frmENAutomatEdit := TfrmENAutomatEdit.Create(Application, dsEdit);
          try
            if chbLowVoltBoard.Checked then
              begin //�������������� ����������� ��������� �� ������������� ����
                frmENAutomatEdit.lblBranch.Caption := '������������ �� ����';
                deviceParty := partyLVBM;
              end
            else
              begin //�������������� ����������� ��������� �� ������ �� ����
                frmENAutomatEdit.lblBranch.Caption := '��������� �����';
                deviceParty := partyLVBP;
              end;
            frmENAutomatEdit.codeS04 := ENSubstation04Obj.code;
            if ENSubstation04Obj.element <> nil then
              if ENSubstation04Obj.element.code <> low(Integer) then
                frmENAutomatEdit.elementCodeS04 :=
                  ENSubstation04Obj.element.code;

            if frmENAutomatEdit.ShowModal = mrOk then
              begin
                UpdateGrid(Sender);
              end;
          finally
            frmENAutomatEdit.Free;
            frmENAutomatEdit := nil;
          end;
        end
      else if pcBoardEquipment.ActivePage = tsMeasurDeviceLVB then
        begin
          TempENMeasurDeviceLVB :=
            HTTPRIOENMeasurDeviceLVB as ENMeasurDeviceControllerSoapPort;
          try
            ENMeasurDeviceObj :=
              TempENMeasurDeviceLVB.getObject(
                StrToInt(sgENMeasurDeviceLVB.Cells[0, sgENMeasurDeviceLVB.Row]));
          except
            on EConvertError do Exit;
          end;
          frmENMeasurDeviceEdit :=
            TfrmENMeasurDeviceEdit.Create(Application, dsEdit);
          try
            if chbLowVoltBoard.Checked then
              begin //������������� ���������� ��������� �� ������������� ����
                frmENMeasurDeviceEdit.lblBranch.Caption :=
                  '������������ �� ����';
                deviceParty := partyLVBM;
              end
            else
              begin //������������� ���������� ��������� �� ������ �� ����
                frmENMeasurDeviceEdit.lblBranch.Caption := '��������� �����';
                deviceParty := partyLVBP;
              end;
            frmENMeasurDeviceEdit.codeS04 := ENSubstation04Obj.code;
            if ENSubstation04Obj.element <> nil then
              if ENSubstation04Obj.element.code <> low(Integer) then
                frmENMeasurDeviceEdit.elementCodeS04 :=
                  ENSubstation04Obj.element.code;

            frmENMeasurDeviceEdit.lblENHighVoltageSellName.Visible := False;
            frmENMeasurDeviceEdit.edtENHighVoltageSellName.Visible := False;
            frmENMeasurDeviceEdit.spbENHighVoltageSell.Visible := False;
            frmENMeasurDeviceEdit.lblBranch.Visible := True;
            frmENMeasurDeviceEdit.memENBranchName.Visible := True;
            frmENMeasurDeviceEdit.spbENBranch.Visible := True;
            if frmENMeasurDeviceEdit.ShowModal= mrOk then
              begin
                UpdateGrid(Sender);
              end;
          finally
            frmENMeasurDeviceEdit.Free;
            frmENMeasurDeviceEdit := nil;
          end;
        end;
    end; //else if pcSubstation04.ActivePage = tsLowVoltageBoard
end;

procedure TfrmENSubstation04Edit.actDeleteExecute(Sender: TObject);
Var ObjCode: Integer;
  TempENTransformer: ENTransformerControllerSoapPort;
  TempENHighVoltageSell: ENHighVoltageSellControllerSoapPort;
  TempENSafetyPrecautions: ENSafetyPrecautionsControllerSoapPort;
  IsHighVoltageLeave,    //������� ������������������ �������������� ������ ��� ������� ��������
  IsPanelLeave: Boolean; //������� ������������������� ������ �������������� ���� ��� ������� ��������
  TempENDisconnector: ENDisconnectorControllerSoapPort;
  TempENLoadSwitch: ENLoadSwitchControllerSoapPort;
  TempENFuse: ENFuseControllerSoapPort;
  TempENInsulator: ENInsulatorControllerSoapPort;
  TempENArrester: ENArresterControllerSoapPort;
  TempENCurrentTransformer: ENCurrentTransformerControllerSoapPort;
  TempENBus: ENBusControllerSoapPort;
  TempENMeasurDevice: ENMeasurDeviceControllerSoapPort;
  TempENLine10: ENLine10ControllerSoapPort;
  TempENLineCable: ENLineCableControllerSoapPort;
  TempENPanel: ENPanelControllerSoapPort;
  TempENFiderGuage: ENFiderGuageControllerSoapPort;
  TempENBranch: ENBranchControllerSoapPort;
  ENDisconnectorListObj: ENDisconnectorShortList;
  ENDisconnectorFilterObj: ENDisconnectorFilter;
  ENLoadSwitchListObj: ENLoadSwitchShortList;
  ENLoadSwitchFilterObj: ENLoadSwitchFilter;
  ENFuseListObj: ENFuseShortList;
  ENFuseFilterObj: ENFuseFilter;
  ENInsulatorListObj: ENInsulatorShortList;
  ENInsulatorFilterObj: ENInsulatorFilter;
  ENArresterListObj: ENArresterShortList;
  ENArresterFilterObj: ENArresterFilter;
  ENCurrentTransformerListObj: ENCurrentTransformerShortList;
  ENCurrentTransformerFilterObj: ENCurrentTransformerFilter;
  ENBusListObj: ENBusShortList;
  ENBusFilterObj: ENBusFilter;
  ENMeasurDeviceListObj: ENMeasurDeviceShortList;
  ENMeasurDeviceFilterObj: ENMeasurDeviceFilter;
  ENLine10ListObj: ENLine10ShortList;
  ENLine10FilterObj: ENLine10Filter;
  ENLineCableListObj: ENLineCableShortList;
  ENLineCableFilterObj: ENLineCableFilter;
  //ENPanelListObj: ENPanelShortList;
  //ENPanelFilterObj: ENPanelFilter;
  ENBranchListObj: ENBranchShortList;
  ENBranchFilterObj: ENBranchFilter;
begin
  if pcSubstation04.ActivePage = tsFiderGuage then
    begin //�������� ������ ���������� ��������
      TempENFiderGuage := HTTPRIOENFiderGuage as ENFiderGuageControllerSoapPort;
      try
       ObjCode := StrToInt(sgENFiderGuage.Cells[0, sgENFiderGuage.Row]);
      except
        on EConvertError do Exit;
      end;
      if Application.MessageBox(
        PChar('�� ������������� ������ ������� ������ ���������� �������?'),
        PChar('��������!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2)=IDOK then
      begin
        TempENFiderGuage.remove(ObjCode);
        UpdateGrid(Sender);
      end;
    end;

  if pcSubstation04.ActivePage = tsLowVoltageBoard then
    begin
      TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
      try
        ObjCode := StrToInt(sgENPanel.Cells[0,sgENPanel.Row]);
      except
      on EConvertError do Exit;
    end;
    if Application.MessageBox(
      PChar('�� ������������� ������ ������� ������ �������������� ����?'),
      PChar('�������� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
      begin

        (*��������������� �������� ���������� ������������� ����� � �������
        ��������� ��� ������������� � ������� ������������� �������� ������*)
        TempENBranch :=
          HTTPRIOENBranch as ENBranchControllerSoapPort;
        try
          ENBranchFilterObj := ENBranchFilter.Create;

          SetNullIntProps(ENBranchFilterObj);
          SetNullXSProps(ENBranchFilterObj);

          ENBranchFilterObj.conditionSQL := 'ENBRANCH.PANELCODE = ' +
            sgENPanel.Cells[0, sgENPanel.Row];

          ENBranchListObj :=
            TempENBranch.getScrollableFilteredList(
              ENBranchFilterObj, 0, -1);

          if ENBranchListObj.totalCount > 0 then
            begin
              Application.MessageBox(
                PChar('�������� ������ "' + sgENPanel.Cells[4, sgENPanel.Row]
                  + '" �� �������������� ���������, ' + #13#10
                  + '���� � ��� ������������ �����.'),
                PChar('��������! ��������� ������� ��������:'), MB_ICONWARNING);
              //actNoFilter.Execute;
              IsPanelLeave := True;
            end;
        finally
          ENBranchFilterObj.Free;
          ENBranchListObj.Free;
        end;

        if IsPanelLeave then //����������� �������� ������
          Exit; //� ������ ������� ������������� � ��� �����

        TempENPanel.remove(ObjCode);
        UpdateGrid(Sender);
      end;
    end; //if pcSubstation04.ActivePage = tsLowVoltageBoard then

  if pcSubstation04.ActivePage = tsTransformers then
    begin
     TempENTransformer := HTTPRIOENTransformer as ENTransformerControllerSoapPort;
     try
       ObjCode := StrToInt(sgENTransformer.Cells[0,sgENTransformer.Row]);
     except
     on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('�� ������������� ������ ������� (������� �������������) ?'),
                      PChar('�������� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        TempENTransformer.remove(ObjCode);
        recalcTransformers();
        UpdateGrid(Sender);
    end;
  end; //if pcSubstation04.ActivePage = tsTransformers then

  if pcSubstation04.ActivePage = tsHighVoltageParty then
    begin
      TempENHighVoltageSell :=
        HTTPRIOENHighVoltageSell as ENHighVoltageSellControllerSoapPort;
      try
        ObjCode := StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);
      except
        on EConvertError do Exit;
      end;
      if Application.MessageBox(
        PChar('�� ������������� ������ ������� �������������� ������?'),
        PChar('��������!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
      begin
        IsHighVoltageLeave := False;

        (*��������������� �������� ���������� �������������� � ������� ���������
        ��� ������������� � ������� ������������� �������� �������������� ������*)
        TempENDisconnector :=
          HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;
        try
          ENDisconnectorFilterObj := ENDisconnectorFilter.Create;

          SetNullIntProps(ENDisconnectorFilterObj);
          SetNullXSProps(ENDisconnectorFilterObj);

          ENDisconnectorFilterObj.conditionSQL := 'ENDISCONNECTOR.HIGHVOLTAGESELLCODE = ' +
            sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row];

          ENDisconnectorListObj :=
            TempENDisconnector.getScrollableFilteredList(
              ENDisconnectorFilterObj, 0, -1);

          if ENDisconnectorListObj.totalCount > 0 then
            begin
              Application.MessageBox(
                PChar('�������� ������ � '
                  + sgENHighVoltageSell.Cells[3, sgENHighVoltageSell.Row]
                  + ' �� �������������� ���������, ' + #13#10
                  + '���� � � ������ ������ �������������.'),
                PChar('��������! ��������� ������� ��������:'), MB_ICONWARNING);
              pcHighVoltageParty.ActivePage := tsDisconnector;
              actNoFilter.Execute;
              IsHighVoltageLeave := True;
            end;
        finally
          ENDisconnectorFilterObj.Free;
          ENDisconnectorListObj.Free;
        end;

        if IsHighVoltageLeave then //����������� �������� ������������� ������
          Exit; //� ������ ����������� ��������������

        (*��������������� �������� ���������� ������������ �������� � ����������
        ��� ������������� � ������� ������������� �������� �������������� ������*)
        TempENLoadSwitch :=
          HTTPRIOENLoadSwitch as ENLoadSwitchControllerSoapPort;
        try
          ENLoadSwitchFilterObj := ENLoadSwitchFilter.Create;

          SetNullIntProps(ENLoadSwitchFilterObj);
          SetNullXSProps(ENLoadSwitchFilterObj);

          ENLoadSwitchFilterObj.conditionSQL := 'ENLOADSWITCH.HIGHVOLTAGESELLCODE = ' +
            sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row];

          ENLoadSwitchListObj :=
            TempENLoadSwitch.getScrollableFilteredList(
              ENLoadSwitchFilterObj, 0, -1);

          if ENLoadSwitchListObj.totalCount > 0 then
            begin
              Application.MessageBox(
                PChar('�������� ������ � '
                  + sgENHighVoltageSell.Cells[3, sgENHighVoltageSell.Row]
                  + ' �� �������������� ���������, ' + #13#10
                  + '���� � � ������ ������ ����������� ��������.'),
                PChar('��������! ��������� ������� ��������:'), MB_ICONWARNING);
              pcHighVoltageParty.ActivePage := tsLoadSwitch;
              actNoFilter.Execute;
              IsHighVoltageLeave := True;
            end;
        finally
          ENLoadSwitchFilterObj.Free;
          ENLoadSwitchListObj.Free;
        end;

        if IsHighVoltageLeave then //����������� �������� ������������� ������
          Exit; //� ������ ����������� ������������ ��������

        (*��������������� �������� ���������� ��������������� � ������� ���������
        ��� ������������� � ������� ������������� �������� �������������� ������*)
        TempENFuse :=
          HTTPRIOENFuse as ENFuseControllerSoapPort;
        try
          ENFuseFilterObj := ENFuseFilter.Create;

          SetNullIntProps(ENFuseFilterObj);
          SetNullXSProps(ENFuseFilterObj);

          ENFuseFilterObj.conditionSQL := 'ENFUSE.HIGHVOLTAGESELLCODE = ' +
            sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row];

          ENFuseListObj :=
            TempENFuse.getScrollableFilteredList(
              ENFuseFilterObj, 0, -1);

          if ENFuseListObj.totalCount > 0 then
            begin
              Application.MessageBox(
                PChar('�������� ������ � '
                  + sgENHighVoltageSell.Cells[3, sgENHighVoltageSell.Row]
                  + ' �� �������������� ���������, ' + #13#10
                  + '���� � � ������ ������ ��������������.'),
                PChar('��������! ��������� ������� ��������:'), MB_ICONWARNING);
              pcHighVoltageParty.ActivePage := tsFuse;
              actNoFilter.Execute;
              IsHighVoltageLeave := True;
            end;
        finally
          ENFuseFilterObj.Free;
          ENFuseListObj.Free;
        end;

        if IsHighVoltageLeave then //����������� �������� ������������� ������
          Exit; //� ������ ����������� ���������������

        (*��������������� �������� ���������� ���������� � ������� ���������
        ��� ������������� � ������� ������������� �������� �������������� ������*)
        TempENInsulator :=
          HTTPRIOENInsulator as ENInsulatorControllerSoapPort;
        try
          ENInsulatorFilterObj := ENInsulatorFilter.Create;

          SetNullIntProps(ENInsulatorFilterObj);
          SetNullXSProps(ENInsulatorFilterObj);

          ENInsulatorFilterObj.conditionSQL := 'ENINSULATOR.HIGHVOLTAGESELLCODE = ' +
            sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row];

          ENInsulatorListObj :=
            TempENInsulator.getScrollableFilteredList(
              ENInsulatorFilterObj, 0, -1);

          if ENInsulatorListObj.totalCount > 0 then
            begin
              Application.MessageBox(
                PChar('�������� ������ � '
                  + sgENHighVoltageSell.Cells[3, sgENHighVoltageSell.Row]
                  + ' �� �������������� ���������, ' + #13#10
                  + '���� � � ������ ������ ���������.'),
                PChar('��������! ��������� ������� ��������:'), MB_ICONWARNING);
              pcHighVoltageParty.ActivePage := tsInsulator;
              actNoFilter.Execute;
              IsHighVoltageLeave := True;
            end;
        finally
          ENInsulatorFilterObj.Free;
          ENInsulatorListObj.Free;
        end;

        if IsHighVoltageLeave then //����������� �������� ������������� ������
          Exit; //� ������ ����������� ����������

        (*��������������� �������� ���������� ����������� � ������� ���������
        ��� ������������� � ������� ������������� �������� �������������� ������*)
        TempENArrester :=
          HTTPRIOENArrester as ENArresterControllerSoapPort;
        try
          ENArresterFilterObj := ENArresterFilter.Create;

          SetNullIntProps(ENArresterFilterObj);
          SetNullXSProps(ENArresterFilterObj);

          ENArresterFilterObj.conditionSQL := 'ENARRESTER.HIGHVOLTAGESELLCODE = ' +
            sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row];

          ENArresterListObj :=
            TempENArrester.getScrollableFilteredList(
              ENArresterFilterObj, 0, -1);

          if ENArresterListObj.totalCount > 0 then
            begin
              Application.MessageBox(
                PChar('�������� ������ � '
                  + sgENHighVoltageSell.Cells[3, sgENHighVoltageSell.Row]
                  + ' �� �������������� ���������, ' + #13#10
                  + '���� � � ������ ������ ����������.'),
                PChar('��������! ��������� ������� ��������:'), MB_ICONWARNING);
              pcHighVoltageParty.ActivePage := tsArrester;
              actNoFilter.Execute;
              IsHighVoltageLeave := True;
            end;
        finally
          ENArresterFilterObj.Free;
          ENArresterListObj.Free;
        end;

        if IsHighVoltageLeave then //����������� �������� ������������� ������
          Exit; //� ������ ����������� �����������

        (*��������������� �������� ���������� ��������������� ���� � ����������
        ��� ������������� � ������� ������������� �������� �������������� ������*)
        TempENCurrentTransformer :=
          HTTPRIOENCurrentTransformer as ENCurrentTransformerControllerSoapPort;
        try
          ENCurrentTransformerFilterObj := ENCurrentTransformerFilter.Create;

          SetNullIntProps(ENCurrentTransformerFilterObj);
          SetNullXSProps(ENCurrentTransformerFilterObj);

          ENCurrentTransformerFilterObj.conditionSQL :=
            'ENCURRENTTRANSFORMER.HIGHVOLTAGESELLCODE = ' +
            sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row];

          ENCurrentTransformerListObj :=
            TempENCurrentTransformer.getScrollableFilteredList(
              ENCurrentTransformerFilterObj, 0, -1);

          if ENCurrentTransformerListObj.totalCount > 0 then
            begin
              Application.MessageBox(
                PChar('�������� ������ � '
                  + sgENHighVoltageSell.Cells[3, sgENHighVoltageSell.Row]
                  + ' �� �������������� ���������, ' + #13#10
                  + '���� � � ������ ������ �������������� ����.'),
                PChar('��������! ��������� ������� ��������:'), MB_ICONWARNING);
              pcHighVoltageParty.ActivePage := tsCurrentTransformer;
              actNoFilter.Execute;
              IsHighVoltageLeave := True;
            end;
        finally
          ENCurrentTransformerFilterObj.Free;
          ENCurrentTransformerListObj.Free;
        end;

        if IsHighVoltageLeave then //����������� �������� ������������� ������
          Exit; //� ������ ����������� ��������������� ����

        (*��������������� �������� ���������� ��� � ������� ���������
        ��� ������������� � ������� ������������� �������� �������������� ������*)
        TempENBus :=
          HTTPRIOENBus as ENBusControllerSoapPort;
        try
          ENBusFilterObj := ENBusFilter.Create;

          SetNullIntProps(ENBusFilterObj);
          SetNullXSProps(ENBusFilterObj);

          ENBusFilterObj.conditionSQL := 'ENBUS.HIGHVOLTAGESELLCODE = ' +
            sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row];

          ENBusListObj :=
            TempENBus.getScrollableFilteredList(
              ENBusFilterObj, 0, -1);

          if ENBusListObj.totalCount > 0 then
            begin
              Application.MessageBox(
                PChar('�������� ������ � '
                  + sgENHighVoltageSell.Cells[3, sgENHighVoltageSell.Row]
                  + ' �� �������������� ���������, ' + #13#10
                  + '���� � � ������ ������ ����.'),
                PChar('��������! ��������� ������� ��������:'), MB_ICONWARNING);
              pcHighVoltageParty.ActivePage := tsBus;
              actNoFilter.Execute;
              IsHighVoltageLeave := True;
            end;
        finally
          ENBusFilterObj.Free;
          ENBusListObj.Free;
        end;

        pcHighVoltageParty.Update;

        if IsHighVoltageLeave then //����������� �������� ������������� ������
          Exit; //� ������ ����������� ���

        (*��������������� �������� ���������� ������������� �������� � ������� ���������
        ��� ������������� � ������� ������������� �������� �������������� ������*)
        TempENMeasurDevice :=
          HTTPRIOENMeasurDevice as ENMeasurDeviceControllerSoapPort;
        try
          ENMeasurDeviceFilterObj := ENMeasurDeviceFilter.Create;

          SetNullIntProps(ENMeasurDeviceFilterObj);
          SetNullXSProps(ENMeasurDeviceFilterObj);

          ENMeasurDeviceFilterObj.conditionSQL := 'ENMEASURDEVICE.HIGHVOLTAGESELLCODE = ' +
            sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row];

          ENMeasurDeviceListObj :=
            TempENMeasurDevice.getScrollableFilteredList(
              ENMeasurDeviceFilterObj, 0, -1);

          if ENMeasurDeviceListObj.totalCount > 0 then
            begin
              Application.MessageBox(
                PChar('�������� ������ � '
                  + sgENHighVoltageSell.Cells[3, sgENHighVoltageSell.Row]
                  + ' �� �������������� ���������, ' + #13#10
                  + '���� � � ������ ������ ������������� �������.'),
                PChar('��������! ��������� ������� ��������:'), MB_ICONWARNING);
              pcHighVoltageParty.ActivePage := tsMeasurDevice;
              actNoFilter.Execute;
              IsHighVoltageLeave := True;
            end;
        finally
          ENMeasurDeviceFilterObj.Free;
          ENMeasurDeviceListObj.Free;
        end;

        pcHighVoltageParty.Update;

        if IsHighVoltageLeave then //����������� �������� ������������� ������
          Exit; //� ������ ����������� ������������� ��������

        (*��������������� �������� ���������� ��������� ����� ������� 6 - 10 �� � ������� ���������
        ��� ������������� � ������� ������������� �������� �������������� ������*)
        TempENLine10 :=
          HTTPRIOENLine10 as ENLine10ControllerSoapPort;
        try
          ENLine10FilterObj := ENLine10Filter.Create;

          SetNullIntProps(ENLine10FilterObj);
          SetNullXSProps(ENLine10FilterObj);

          ENLine10FilterObj.conditionSQL := 'ENLINE10.HIGHVOLTAGESELLCODE = ' +
            sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row];

          ENLine10ListObj :=
            TempENLine10.getScrollableFilteredList(
              ENLine10FilterObj, 0, -1);

          if ENLine10ListObj.totalCount > 0 then
            begin
              Application.MessageBox(
                PChar('�������� ������ � '
                  + sgENHighVoltageSell.Cells[3, sgENHighVoltageSell.Row]
                  + ' �� �������������� ���������, ' + #13#10
                  + '���� � � ������ ������ ��������� ����� ������� 6 - 10 ��.'),
                PChar('��������! ��������� ������� ��������:'), MB_ICONWARNING);
              pcHighVoltageParty.ActivePage := tsElectricLineSupplies;
              rbENLine10.Checked := True;
              actNoFilter.Execute;
              IsHighVoltageLeave := True;
            end;
        finally
          ENLine10FilterObj.Free;
          ENLine10ListObj.Free;
        end;

        pcHighVoltageParty.Update;

        if IsHighVoltageLeave then //����������� �������� ������������� ������
          Exit; //� ������ ����������� ��������� ����� ������� 6 - 10 ��

        (*��������������� �������� ���������� ��������� ����� ������� � ������� ���������
        ��� ������������� � ������� ������������� �������� �������������� ������*)
        TempENLineCable :=
          HTTPRIOENLineCableSupplies as ENLineCableControllerSoapPort;
        try
          ENLineCableFilterObj := ENLineCableFilter.Create;

          SetNullIntProps(ENLineCableFilterObj);
          SetNullXSProps(ENLineCableFilterObj);

          ENLineCableFilterObj.conditionSQL := 'ENLINECABLE.HIGHVOLTAGESELLCODE = ' +
            sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row];

          ENLineCableListObj :=
            TempENLineCable.getScrollableFilteredList(
              ENLineCableFilterObj, 0, -1);

          if ENLineCableListObj.totalCount > 0 then
            begin
              Application.MessageBox(
                PChar('�������� ������ � '
                  + sgENHighVoltageSell.Cells[3, sgENHighVoltageSell.Row]
                  + ' �� �������������� ���������, ' + #13#10
                  + '���� � � ������ ������ ��������� ����� �������.'),
                PChar('��������! ��������� ������� ��������:'), MB_ICONWARNING);
              pcHighVoltageParty.ActivePage := tsElectricLineSupplies;
              rbENLineCable.Checked := True;
              actNoFilter.Execute;
              IsHighVoltageLeave := True;
            end;
        finally
          ENLineCableFilterObj.Free;
          ENLineCableListObj.Free;
        end;

        pcHighVoltageParty.Update;

        if IsHighVoltageLeave then //����������� �������� ������������� ������
          Exit //� ������ ����������� ��������� ����� �������
        else
          begin //����� - �������� �������������� ������
            if codeSPrHVC > 0 then
              begin
                TempENSafetyPrecautions := HTTPRIOENSafetyPrecautions
                  as ENSafetyPrecautionsControllerSoapPort;
                TempENSafetyPrecautions.remove(codeSPrHVC);
              end;
            TempENHighVoltageSell.remove(ObjCode);
            recalcHighVoltCells();
            UpdateGrid(Sender);
          end;
      end; //if Application.MessageBox(PChar('�� ������������� ������ ������� �������������� ������?')...

    end; //if pcSubstation04.ActivePage = tsHighVoltageParty then
end;


procedure TfrmENSubstation04Edit.actDeleteENInspectionSheetExecute(Sender: TObject);
var
  sheetCode: Integer;
  TempENInspectionSheet : ENInspectionSheetControllerSoapPort;
begin
  inherited;
  if pcSubstation04.ActivePage = tsENInspectionSheet then
  begin
    TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
    try
      sheetCode := StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]);
    except
      on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('�� ����� ������ �������� (���� ������ ��`���� ����������)?'),
                    PChar('�����!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
      TempENInspectionSheet.remove(sheetCode);
      pcSubstation04Change(Sender);
    end;
  end;
end;



procedure TfrmENSubstation04Edit.actDeleteEquipmentExecute(Sender: TObject);
var ObjCode: Integer;
  //���������� ��� �������� ��������� �������������� �������
  TempENDisconnector: ENDisconnectorControllerSoapPort;
  TempENLoadSwitch: ENLoadSwitchControllerSoapPort;
  TempENFuse: ENFuseControllerSoapPort;
  TempENInsulator: ENInsulatorControllerSoapPort;
  TempENArrester: ENArresterControllerSoapPort;
  TempENCurrentTransformer: ENCurrentTransformerControllerSoapPort;
  TempENBus: ENBusControllerSoapPort;
  TempENMeasurDevice: ENMeasurDeviceControllerSoapPort;
  //TempENLine10: ENLine10ControllerSoapPort;
  //TempENLineCable: ENLineCableControllerSoapPort;
  //ENDisconnectorListObj: ENDisconnectorShortList;
  //ENDisconnectorFilterObj: ENDisconnectorFilter;
  //ENLoadSwitchListObj: ENLoadSwitchShortList;
  //ENLoadSwitchFilterObj: ENLoadSwitchFilter;
  //ENFuseListObj: ENFuseShortList;
  //ENFuseFilterObj: ENFuseFilter;
  //ENInsulatorListObj: ENInsulatorShortList;
  //ENInsulatorFilterObj: ENInsulatorFilter;
  //ENArresterListObj: ENArresterShortList;
  //ENArresterFilterObj: ENArresterFilter;
  //ENCurrentTransformerListObj: ENCurrentTransformerShortList;
  //ENCurrentTransformerFilterObj: ENCurrentTransformerFilter;
  //ENBusListObj: ENBusShortList;
  //ENBusFilterObj: ENBusFilter;
  //ENMeasurDeviceListObj: ENMeasurDeviceShortList;
  //ENMeasurDeviceFilterObj: ENMeasurDeviceFilter;
  //ENLine10ListObj: ENLine10ShortList;
  //ENLine10FilterObj: ENLine10Filter;
  //ENLineCableListObj: ENLineCableShortList;
  //ENLineCableFilterObj: ENLineCableFilter;
  //���������� ��� �������� ��������� ������������� �������
  TempENContactBreaker: ENContactBreakerControllerSoapPort;
  TempENFuseLVB: ENFuseControllerSoapPort;
  TempENAutomat: ENAutomatControllerSoapPort;
  TempENMeasurDeviceLVB: ENMeasurDeviceControllerSoapPort;
begin
  if pcSubstation04.ActivePage = tsHighVoltageParty then
    begin //���� ������� ������� "�������������� �������"
      if pcHighVoltageParty.ActivePage = tsDisconnector then
        begin //�������� �������������
          TempENDisconnector :=
            HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;
          try
            ObjCode := StrToInt(sgENDisconnector.Cells[0, sgENDisconnector.Row]);
          except
            on EConvertError do Exit;
          end;
          if Application.MessageBox(
            PChar('�� ������������� ������ ������� �������������?'),
            PChar('��������!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
              begin
                TempENDisconnector.remove(ObjCode);
                recalcDisconnectors();
                UpdateGrid(Sender);
              end;
        end; //if pcHighVoltageParty.ActivePage = tsDisconnector then

      if pcHighVoltageParty.ActivePage = tsLoadSwitch then
        begin //�������� ����������� ��������
          TempENLoadSwitch :=
            HTTPRIOENLoadSwitch as ENLoadSwitchControllerSoapPort;
          try
            ObjCode := StrToInt(sgENLoadSwitch.Cells[0, sgENLoadSwitch.Row]);
          except
            on EConvertError do Exit;
          end;
          if Application.MessageBox(
            PChar('�� ������������� ������ ������� ����������� ��������?'),
            PChar('��������!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
              begin
                TempENLoadSwitch.remove(ObjCode);
                recalcLoadSwitches();
                UpdateGrid(Sender);
              end;
        end; //if pcHighVoltageParty.ActivePage = tsLoadSwitch then

      if pcHighVoltageParty.ActivePage = tsFuse then
        begin //�������� �������������� � �������������� �������
          TempENFuse :=
            HTTPRIOENFuse as ENFuseControllerSoapPort;
          try
            ObjCode := StrToInt(sgENFuse.Cells[0, sgENFuse.Row]);
          except
            on EConvertError do Exit;
          end;
          if Application.MessageBox(
            PChar('�� ������������� ������ ������� ��������������?'),
            PChar('��������!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
              begin
                TempENFuse.remove(ObjCode);
                recalcFuses();
                UpdateGrid(Sender);
              end;
        end; //if pcHighVoltageParty.ActivePage = tsFuse then

      if pcHighVoltageParty.ActivePage = tsInsulator then
        begin //�������� ���������
          TempENInsulator :=
            HTTPRIOENInsulator as ENInsulatorControllerSoapPort;
          try
            ObjCode := StrToInt(sgENInsulator.Cells[0, sgENInsulator.Row]);
          except
            on EConvertError do Exit;
          end;
          if Application.MessageBox(
            PChar('�� ������������� ������ ������� ��������?'),
            PChar('��������!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
              begin
                TempENInsulator.remove(ObjCode);
                recalcInsulators();
                UpdateGrid(Sender);
              end;
        end; //if pcHighVoltageParty.ActivePage = tsInsulator then

      if pcHighVoltageParty.ActivePage = tsArrester then
        begin //�������� ����������
          TempENArrester :=
            HTTPRIOENArrester as ENArresterControllerSoapPort;
          try
            ObjCode := StrToInt(sgENArrester.Cells[0, sgENArrester.Row]);
          except
            on EConvertError do Exit;
          end;
          if Application.MessageBox(
            PChar('�� ������������� ������ ������� ���������?'),
            PChar('��������!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
              begin
                TempENArrester.remove(ObjCode);
                recalcArresters();
                UpdateGrid(Sender);
              end;
        end; //if pcHighVoltageParty.ActivePage = tsArrester then

      if pcHighVoltageParty.ActivePage = tsCurrentTransformer then
        begin //�������� �������������� ����
          TempENCurrentTransformer :=
            HTTPRIOENCurrentTransformer as ENCurrentTransformerControllerSoapPort;
          try
            ObjCode := StrToInt(sgENCurrentTransformer.Cells[0, sgENCurrentTransformer.Row]);
          except
            on EConvertError do Exit;
          end;
          if Application.MessageBox(
            PChar('�� ������������� ������ ������� ������������� ����?'),
            PChar('��������!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
              begin
                TempENCurrentTransformer.remove(ObjCode);
                recalcCurrentTransformers();
                UpdateGrid(Sender);
              end;
        end; //if pcHighVoltageParty.ActivePage = tsCurrentTransformer then

      if pcHighVoltageParty.ActivePage = tsBus then
        begin //�������� ����
          TempENBus :=
            HTTPRIOENBus as ENBusControllerSoapPort;
          try
            ObjCode := StrToInt(sgENBus.Cells[0, sgENBus.Row]);
          except
            on EConvertError do Exit;
          end;
          if Application.MessageBox(
            PChar('�� ������������� ������ ������� ����?'),
            PChar('��������!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
              begin
                TempENBus.remove(ObjCode);
                recalcBuses();
                UpdateGrid(Sender);
              end;
        end; //if pcHighVoltageParty.ActivePage = tsBus then

      if pcHighVoltageParty.ActivePage = tsMeasurDevice then
        begin //�������� �������������� ������� �������������� �������
          TempENMeasurDevice :=
            HTTPRIOENMeasurDevice as ENMeasurDeviceControllerSoapPort;
          try
            ObjCode := StrToInt(sgENMeasurDevice.Cells[0,sgENMeasurDevice.Row]);
          except
            on EConvertError do Exit;
          end;
          if Application.MessageBox(
            PChar('�� ������������� ������ ������� ������������� ������?'),
            PChar('��������!'), MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2) = IDOK then
          begin
            TempENMeasurDevice.remove(ObjCode);
            recalcMeasurDevices();
            UpdateGrid(Sender);
          end;
        end; //if pcHighVoltageParty.ActivePage = tsMeasurDevice then

      (*����������� �������� ��������� � ��������� ����� �� �����
      �������������� ���������� 6 - 10 / 0,4 �� ���������
      �� ��������� ����������� ������� ������������� �������

      if pcHighVoltageParty.ActivePage = tsElectricLineSupplies then
        begin //�������� ����� ������� ����������
          if rbENLine10.Checked then
            begin //�������� ��������� ���������� ��������� ����� 6 - 10 ��
              TempENLine10 :=
                HTTPRIOENLine10 as ENLine10ControllerSoapPort;
              try
                ObjCode := StrToInt(sgENLine10.Cells[0,sgENLine10.Row]);
              except
                on EConvertError do Exit;
              end;
              if Application.MessageBox(
                PChar('�� ������������� ������ ������� ��������� ����� 6 - 10 ��?'),
                PChar('��������!'), MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2) = IDOK then
              begin
                TempENLine10.remove(ObjCode);
                recalcLines10();
                UpdateGrid(Sender);
              end;
            end
          else //if rbENLineCable.Checked then
            begin //�������� �������� ���������� ��������� �����
              TempENLineCable :=
                HTTPRIOENLineCableSupplies as ENLineCableControllerSoapPort;
              try
                ObjCode := StrToInt(sgENLineCable.Cells[0,sgENLineCable.Row]);
              except
                on EConvertError do Exit;
              end;
              if Application.MessageBox(
                PChar('�� ������������� ������ ������� ��������� �����?'),
                PChar('��������!'), MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2) = IDOK then
              begin
                TempENLineCable.remove(ObjCode);
                recalcLinesCable();
                UpdateGrid(Sender);
              end;
            end;
        end; //if pcHighVoltageParty.ActivePage = tsElectricLineSupplies then
        *)
    end //if pcSubstation04.ActivePage = tsHighVoltageParty then
  else if pcSubstation04.ActivePage = tsLowVoltageBoard then
    begin //���� ������� ������� "������������� ���"
      if pcBoardEquipment.ActivePage = tsContactBreakerLVB then
        begin //�������� ����������
          TempENContactBreaker :=
            HTTPRIOENContactBreaker as ENContactBreakerControllerSoapPort;
          try
            ObjCode := StrToInt(
              sgENContactBreaker.Cells[0, sgENContactBreaker.Row]);
          except
            on EConvertError do Exit;
          end;
          if Application.MessageBox(
            PChar('�� ������������� ������ ������� ���������?'),
            PChar('�������� !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
              begin
                TempENContactBreaker.remove(ObjCode);
                recalcContactBreakers();
                UpdateGrid(Sender);
              end;
        end
      else if pcBoardEquipment.ActivePage = tsFuseLVB then
        begin //�������� �������������� ������������� �������
          TempENFuseLVB :=
            HTTPRIOENFuseLVB as ENFuseControllerSoapPort;
          try
            ObjCode := StrToInt(sgENFuseLVB.Cells[0, sgENFuseLVB.Row]);
          except
            on EConvertError do Exit;
          end;
          if Application.MessageBox(
            PChar('�� ������������� ������ ������� ����������� �� ������������� ������� �������������� ?'),
            PChar('��������!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
              begin
                TempENFuseLVB.remove(ObjCode);
                recalcFusesLVB();
                UpdateGrid(Sender);
              end;
        end
      else if pcBoardEquipment.ActivePage = tsAutomatLVB then
        begin //�������� ��������������� �����������
          TempENAutomat := HTTPRIOENAutomat as ENAutomatControllerSoapPort;
           try
             ObjCode := StrToInt(sgENAutomat.Cells[0, sgENAutomat.Row]);
           except
             on EConvertError do Exit;
           end;
          if Application.MessageBox(
            PChar('�� ������������� ������ ������� �������������� �����������?'),
            PChar('��������!'),
            MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
              begin
                TempENAutomat.remove(ObjCode);
                UpdateGrid(Sender);
              end;
        end
      else if pcBoardEquipment.ActivePage = tsMeasurDeviceLVB then
        begin //�������� �������������� ���������� ������������� �������
          TempENMeasurDeviceLVB :=
            HTTPRIOENMeasurDeviceLVB as ENMeasurDeviceControllerSoapPort;
          try
            ObjCode := StrToInt(
              sgENMeasurDeviceLVB.Cells[0, sgENMeasurDeviceLVB.Row]);
          except
            on EConvertError do Exit;
          end;
          if Application.MessageBox(
            PChar('�� ������������� ������ ������� ������������� ������?'),
            PChar('��������!'),
            MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
              begin
                TempENMeasurDeviceLVB.remove(ObjCode);
                recalcMeasurDevicesLVB();
                UpdateGrid(Sender);
              end;
        end;
    end; //else if pcSubstation04.ActivePage = tsLowVoltageBoard
end;

procedure TfrmENSubstation04Edit.spbENSubstationTypeClick(Sender: TObject);
var
   frmENSubstationTypeShow: TfrmENSubstationTypeShow;
begin
   frmENSubstationTypeShow:=TfrmENSubstationTypeShow.Create(Application,fmNormal);
   try
      with frmENSubstationTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubstation04Obj.substationType = nil then ENSubstation04Obj.substationType := ENSubstationType.Create();
               ENSubstation04Obj.substationType.code := StrToInt(GetReturnValue(sgENSubstationType,0));
               edtENSubstationTypeName.Text:=GetReturnValue(sgENSubstationType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENSubstationTypeShow.Free;
   end;
end;

procedure TfrmENSubstation04Edit.spbEPRenClick(Sender: TObject);
var 
   frmEPRenShow: TfrmENEPRenShow;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubstation04Obj.element.renRef = nil then ENSubstation04Obj.element.renRef := EPRenRef.Create();
               ENSubstation04Obj.element.renRef.code := StrToInt(GetReturnValue(sgEPRen,0));
               edtEPRenName.Text:=GetReturnValue(sgEPRen,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPRenShow.Free;
   end;
end;

procedure TfrmENSubstation04Edit.spbOSSelectClick(Sender: TObject);
var
frmOSTableShow: TfrmOSTableShow;
f : OStableFilter;
begin

     f := OStableFilter.Create;
     SetNullIntProps(f);
     SetNullXSProps(f);
     f.conditionSQL := ' OSTABLE.KOD_VID in (11) '; // ���������� ��� ���.������ � ������ �� �����

     if length(edtInvNumber.Text) > 0 then
       f.kod_inv := '*' + edtInvNumber.Text + '*';

     f.orderBySQL :=  'OSTABLE.STR_NAME';

   frmOSTableShow:=TfrmOSTableShow.Create(Application,fmNormal,f);
   //frmOSTableShow.SendType := 444; /// ��� ������ ....
   try
      with frmOSTableShow do
        if ShowModal = mrOk then
          begin
            try
               //TKElementToFinCollectionObj.fincode := StrToInt(GetReturnValue(sgOSTable,0));
               edtInvNumber.Text :=  GetReturnValue(sgOSTable,2);
               edtBuhName.Text := GetReturnValue(sgOSTable,1);

               DisableControls([edtInvNumber, edtBuhName]);
            except
               on EConvertError do Exit;
            end;
          end;
   finally
      frmOSTableShow.Free;
   end;
end;


procedure TfrmENSubstation04Edit.spbOwnerClick(Sender: TObject);
var
  frmENOwnerShow: TfrmENOwnerShow;
begin
  frmENOwnerShow:=TfrmENOwnerShow.Create(Application, fmNormal);
  try
    with frmENOwnerShow do
    if ShowModal = mrOk then
    begin
      try
        if ENSubstation04Obj.ownerRef = nil then ENSubstation04Obj.ownerRef := ENOwnerRef.Create;

        ENSubstation04Obj.ownerRef.code := StrToInt(GetReturnValue(sgENOwner,0));
        edtOwner.Text:=GetReturnValue(sgENOwner,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENOwnerShow.Free;
  end;
end;


procedure TfrmENSubstation04Edit.tbiDamagesXLSClick(Sender: TObject);
Var
  request: CCReportRequestEx;
  argNames, args: CCReportController.ArrayOfString;
  reportType : String;
begin

    if (ENSubstation04Obj.element=nil) or (ENSubstation04Obj.element.code=Low(Integer)) then
    begin
       Exit;
    end;

    request := CCReportRequestEx.Create;

    SetLength(argNames,2);
    SetLength(args,2);
    request.reportCode := 0;
    argNames[0] := 'nodeCode';
    args[0] := '-1';
    argNames[1] := 'elementCode';
    args[1] := IntToStr(ENSubstation04Obj.element.code);

    request.argNames:=argNames;
    request.args:=args;
    request.resultType:=Low(Integer);

    request.funcName := '/com/ksoe/callcenter/reports/Dispetcher/ByNode_Damages_T32.jasper';
    reportType := 'xls';

    CCDMReport.makeGeneralReportPDF('RequestLog', request, reportType);
end;

procedure TfrmENSubstation04Edit.actLineConnectSubstation04Execute(Sender: TObject);
Var ENLine04FilterObj: ENLine04Filter;
  fENLine04Show: TfrmENLine04Show;
  TempENLine04: ENLine04ControllerSoapPort;
  ENLine10FilterObj: ENLine10Filter;
  fENLine10Show: TfrmENLine10Show;
  TempENLine10: ENLine10ControllerSoapPort;
  ENLineCableFilterObj: ENLineCableFilter;
  fENLineCableShow: TfrmENLineCableShow;
  TempENLineCable: ENLineCableControllerSoapPort;
  renCondition, condition: String; i, cntLine10HVC, cntLineCableHVC: Integer;
  TempENHighVoltCellSupplies: ENHighVoltCellSuppliesControllerSoapPort;
  hvcsObj: ENHighVoltCellSupplies;
begin
  if ENSubstation04Obj = nil then
    begin
      Application.MessageBox(
        PChar('����������� ������ "���������� 6 - 10 / 0,4 ��"!'),
        PChar('��������!'), MB_ICONERROR + MB_OK);
      Exit;
    end
  else if ENSubstation04Obj.element = nil then
    begin
      Application.MessageBox(
        PChar('����������� ������� ������� "���������� 6 - 10 / 0,4 ��"!'),
        PChar('��������!'), MB_ICONERROR + MB_OK);
      Exit;
    end;

  if pcSubstation04.ActivePage = tsHighVoltageParty then
    begin //����� �� ������ ����� ������� ����������
      if rbENLine10.Checked then
        begin //����� �� ������ ��������� ����� 6 - 10 ��
          cntLine10HVC := recalcLines10HVS(
            sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);
          if cntLine10HVC >= 1
          then
            begin
              Application.MessageBox(
                PChar('��������� ����� ������� 6 - 10 �� �� ����� ���� ������ ����� �� ������!'),
                PChar('��������!'), MB_ICONWARNING + MB_OK);
              Exit;
            end;
          ENLine10FilterObj := ENLine10Filter.Create;
          SetNullIntProps(ENLine10FilterObj);
          SetNullXSProps(ENLine10FilterObj);
          (*��� ������������� �������� ���������� ���������
          SetScrollableFilteredList ���������� �������� ����� ������,
          ������� lcsFilterObject.domain_info ���-�� ������� ���� ...*)

          if ENSubstation04Obj.element.renRef <> nil then
            begin
              (*if cntLine10HVC >= 1 then
                begin
                  condition := 'enline10.code not in (';
                  for i := 0 to sgENLine10.RowCount - 1 do
                    if i = sgENLine10.RowCount - 1 then
                      condition := condition +
                        sgENLine10.Cells[0, sgENLine10.Row] + ') '
                    else
                      condition := condition +
                        sgENLine10.Cells[0, sgENLine10.Row] + ', ';
                end //if cntLine10HVC >= 1 then
              else
                condition := '';*)
              condition := '';
              renCondition :=
                ' enline10.elementcode in (select e.code from enelement e where e.renrefcode = '
                + IntToStr(ENSubstation04Obj.element.renRef.code) + ')';
                //+ ' and coalesce(e.elementinrefcode, 0) = 0)';
              if renCondition <> '' then
                AddCondition(condition, renCondition);
              if ENLine10FilterObj.conditionSQL <> '' then
                ENLine10FilterObj.conditionSQL :=
                  ENLine10FilterObj.conditionSQL + ' and ' + condition
              else
                ENLine10FilterObj.conditionSQL := condition;
            end;

          fENLine10Show := TfrmENLine10Show.Create(
            Application, fmNormal, ENLine10FilterObj);

          with fENLine10Show do
            DisableActions([actInsert, actEdit, actDelete, actSchemeList]);
          try
            fENLine10Show.ShowModal;
            if fENLine10Show.ModalResult = mrOk then
              begin
                //���������� �������� ������ � ������� ��������� ����� 6 - 10 ��
                TempENLine10 := HTTPRIOENLine10 as ENLine10ControllerSoapPort;
                try
                  ENLine10Obj := TempENLine10.getObject(StrToInt(
                    fENLine10Show.sgENLine10.Cells[0, fENLine10Show.sgENLine10.Row]));
                  try
                    if ENLine10Obj.element = nil then
                      ENLine10Obj.element := ENElement.Create();
                    ENLine10Obj.element.elementInRef := ENElementRef.Create;
                    ENLine10Obj.element.elementInRef.code := ENSubstation04Obj.element.code;

                    if ENLine10Obj.highVoltageSell = nil then
                      ENLine10Obj.highVoltageSell := ENHighVoltageSellRef.Create();
                    ENLine10Obj.highVoltageSell.code :=
                      StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);

                    TempENLine10.save(ENLine10Obj);
                  except
                     on EConvertError do Exit;
                  end;
                except
                  on EConvertError do Exit;
                end;
                //���������� � ������� ������� �������������� �����
                //���������� �� ��������� ����� 6 - 10 �� �������������� ������
                TempENHighVoltCellSupplies := HTTPRIOENHighVoltCellSupplies
                  as ENHighVoltCellSuppliesControllerSoapPort;
                hvcsObj := ENHighVoltCellSupplies.Create;

                if hvcsObj.substation04Ref = nil then
                  hvcsObj.substation04Ref := ENSubstation04Ref.Create;
                hvcsObj.substation04Ref.code := ENSubstation04Obj.code;

                if ENSubstation04Obj.element <> nil then
                  begin
                    if hvcsObj.s04ElementRef = nil then
                      hvcsObj.s04ElementRef := ENElementRef.Create;
                    hvcsObj.s04ElementRef.code :=
                      ENSubstation04Obj.element.code;
                  end;

                if hvcsObj.highVoltCellRef = nil then
                  hvcsObj.highVoltCellRef := ENHighVoltageSellRef.Create;
                hvcsObj.highVoltCellRef.code := StrToInt(
                  sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);

                if hvcsObj.line10Ref = nil then
                  hvcsObj.line10Ref := ENLine10Ref.Create;
                hvcsObj.line10Ref.code := StrToInt(
                  fENLine10Show.sgENLine10.Cells[
                    0, fENLine10Show.sgENLine10.Row]);
                hvcsObj.name := 'ϳ�������� ' + ENSubstation04Obj.name +
                  ' �������� �� �������� ˳� ';
                if ENLine10Obj <> nil then
                  if ENLine10Obj.element <> nil then
                    if ENLine10Obj.element.code <> Low(Integer) then
                      begin
                        if hvcsObj.powerElementRef = nil then
                          hvcsObj.powerElementRef := ENElementRef.Create;
                        hvcsObj.powerElementRef.code :=
                          ENLine10Obj.element.code;
                        hvcsObj.name := hvcsObj.name + ENLine10Obj.name + ' ';
                      end;
                hvcsObj.name := hvcsObj.name + '����� ������������� ����� � ' +
                  sgENHighVoltageSell.Cells[3, sgENHighVoltageSell.Row];
                TempENHighVoltCellSupplies.add(hvcsObj);
              end;
          finally
            fENLine10Show.Free;
            //�������� ���������� �������� ��������� ����� 6 - 10 ��
            if ENLine10Obj <> nil then
              begin
                recalcLines10();
                UpdateGrid(Sender);
              end;
          end;
        end
      else //if rbENLineCable.Checked then
        begin //����� �� ������ �������� ��������� �����
          cntLineCableHVC := recalcLinesCableHVS(
            sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);
          if cntLineCableHVC >= 2
          then
            begin
              Application.MessageBox(
                PChar('��������� ����� ������� �� ����� ���� ����� ���� �� ������!'),
                PChar('��������!'), MB_ICONWARNING + MB_OK);
              Exit;
            end;

          ENLineCableFilterObj := ENLineCableFilter.Create;
          SetNullIntProps(ENLineCableFilterObj);
          SetNullXSProps(ENLineCableFilterObj);
          (*��� ������������� �������� ���������� ���������
          SetScrollableFilteredList ���������� �������� ����� ������,
          ������� lcsFilterObject.domain_info ���-�� ������� ���� ...*)

          if ENSubstation04Obj.element.renRef <> nil then
            begin
              if cntLineCableHVC >= 1 then
                begin
                  condition := 'enlinecable.code not in (';
                  for i := 0 to sgENLineCable.RowCount - 1 do
                    if i = sgENLineCable.RowCount - 1 then
                      condition := condition +
                        sgENLineCable.Cells[0, sgENLineCable.Row] + ') '
                    else
                      condition := condition +
                        sgENLineCable.Cells[0, sgENLineCable.Row] + ', ';
                end //if cntLineCableHVC >= 1 then
              else
                condition := '';
              renCondition :=
                ' enlinecable.elementcode in (select e.code from enelement e where e.renrefcode = '
                + IntToStr(ENSubstation04Obj.element.renRef.code) + ')';
                //' and coalesce(e.elementinrefcode, 0) = 0)';
              if renCondition <> '' then
                AddCondition(condition, renCondition);
              if ENLineCableFilterObj.conditionSQL <> '' then
                ENLineCableFilterObj.conditionSQL :=
                  ENLineCableFilterObj.conditionSQL + ' and ' + condition
              else
                ENLineCableFilterObj.conditionSQL := condition;
            end;

          fENLineCableShow := TfrmENLineCableShow.Create(
            Application, fmNormal, ENLineCableFilterObj);
          with fENLineCableShow do
            DisableActions([actInsert, actEdit, actDelete, actSchemeList]);
          try
            fENLineCableShow.ShowModal;
            if fENLineCableShow.ModalResult = mrOk then
              begin
                //���������� �������� ������ � ������� ��������� �����
                TempENLineCable := HTTPRIOENLineCableSupplies as ENLineCableControllerSoapPort;
                try
                  ENLineCableObj := TempENLineCable.getObject(StrToInt(
                    fENLineCableShow.sgENLineCable.Cells[0, fENLineCableShow.sgENLineCable.Row]));
                  try
                    if ENLineCableObj.element = nil then
                      ENLineCableObj.element := ENElement.Create();
                    ENLineCableObj.element.elementInRef := ENElementRef.Create;
                    ENLineCableObj.element.elementInRef.code := ENSubstation04Obj.element.code;

                    if ENLineCableObj.highVoltageSell = nil then
                      ENLineCableObj.highVoltageSell := ENHighVoltageSellRef.Create();
                    ENLineCableObj.highVoltageSell.code :=
                      StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);

                    TempENLineCable.save(ENLineCableObj);

                  except
                     on EConvertError do Exit;
                  end;
                except
                  on EConvertError do Exit;
                end;
                //���������� � ������� ������� �������������� �����
                //���������� �� ��������� ����� �������������� ������
                TempENHighVoltCellSupplies := HTTPRIOENHighVoltCellSupplies
                  as ENHighVoltCellSuppliesControllerSoapPort;
                hvcsObj := ENHighVoltCellSupplies.Create;
                if hvcsObj.substation04Ref = nil then
                  hvcsObj.substation04Ref := ENSubstation04Ref.Create;
                hvcsObj.substation04Ref.code := ENSubstation04Obj.code;
                if ENSubstation04Obj.element <> nil then
                  begin
                    if hvcsObj.s04ElementRef = nil then
                      hvcsObj.s04ElementRef := ENElementRef.Create;
                    hvcsObj.s04ElementRef.code :=
                      ENSubstation04Obj.element.code;
                  end;
                if hvcsObj.highVoltCellRef = nil then
                  hvcsObj.highVoltCellRef := ENHighVoltageSellRef.Create;
                hvcsObj.highVoltCellRef.code := StrToInt(
                  sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);
                if hvcsObj.lineCableRef = nil then
                  hvcsObj.lineCableRef := ENlineCableRef.Create;
                hvcsObj.lineCableRef.code := StrToInt(
                  fENlineCableShow.sgENlineCable.Cells[
                    0, fENlineCableShow.sgENlineCable.Row]);
                hvcsObj.name := 'ϳ�������� ' + ENSubstation04Obj.name +
                  ' �������� �� �������� ˳� ';
                if ENlineCableObj <> nil then
                  if ENlineCableObj.element <> nil then
                    if ENlineCableObj.element.code <> Low(Integer) then
                      begin
                        if hvcsObj.powerElementRef = nil then
                          hvcsObj.powerElementRef := ENElementRef.Create;
                        hvcsObj.powerElementRef.code :=
                          ENlineCableObj.element.code;
                        hvcsObj.name := hvcsObj.name + ENlineCableObj.name + ' ';
                      end;
                hvcsObj.name := hvcsObj.name + '����� ������������� ����� � ' +
                  sgENHighVoltageSell.Cells[3, sgENHighVoltageSell.Row];
                TempENHighVoltCellSupplies.add(hvcsObj);
              end;
          finally
            fENLineCableShow.Free;
            //�������� ���������� �������� ��������� �����
            if ENLineCableObj <> nil then
              begin
                recalcLinesCable();
                UpdateGrid(Sender);
              end;
          end;
        end;
    end //if pcSubstation04.ActivePage = tsHighVoltageParty then
  else if pcSubstation04.ActivePage = tsLowVoltageBoard then
    begin //����� �� ������ ����� 0.4 ��
      ENLine04FilterObj := ENLine04Filter.Create;
      SetNullIntProps(ENLine04FilterObj);
      SetNullXSProps(ENLine04FilterObj);
      if ENSubstation04Obj.element.renRef <> nil then
        begin
          renCondition :=
            ' enline04.elementcode in (select e.code from enelement e where e.renrefcode = '
            + IntToStr(ENSubstation04Obj.element.renRef.code) + ')';
          if renCondition <> '' then
            AddCondition(condition, renCondition);
          if ENLine04FilterObj.conditionSQL <> '' then
            ENLine04FilterObj.conditionSQL :=
              ENLine04FilterObj.conditionSQL + ' and ' + condition
          else
            ENLine04FilterObj.conditionSQL := condition;
        end;

      fENLine04Show := TfrmENLine04Show.Create(
        Application, fmNormal, ENLine04FilterObj);
      with fENLine04Show do
        DisableActions([actENLine04Insert, actENLine04Edit, actENLine04Delete,
          actENLine04SchemeList]);
      try
        fENLine04Show.ShowModal;
        if fENLine04Show.ModalResult = mrOk then
          begin
            TempENLine04 := HTTPRIOENLine04 as ENLine04ControllerSoapPort;
            try
              ENLine04Obj := TempENLine04.getObject(StrToInt(
                fENLine04Show.sgENLine04.Cells[0, fENLine04Show.sgENLine04.Row]));
              try
                if ENLine04Obj.element = nil then
                  ENLine04Obj.element := ENElement.Create();
                ENLine04Obj.element.elementInRef := ENElementRef.Create;
                ENLine04Obj.element.elementInRef.code := ENSubstation04Obj.element.code;
                TempENLine04.save(ENLine04Obj);

              except
                 on EConvertError do Exit;
              end;
            except
              on EConvertError do Exit;
            end;
          end;
      finally
        fENLine04Show.Free;
        if ENLine04Obj <> nil then
          UpdateGrid(Sender);
      end;
    end; //else if pcSubstation04.ActivePage = tsLowVoltageBoard then
end;

procedure TfrmENSubstation04Edit.actLineDisconnectSubstation04Execute(
  Sender: TObject);
var TempENLine04: ENLine04ControllerSoapPort;
  TempENLine10: ENLine10ControllerSoapPort;
  TempENLineCable: ENLineCableControllerSoapPort;
  TempENHighVoltCellSupplies: ENHighVoltCellSuppliesControllerSoapPort;
  hvcsListObj: ENHighVoltCellSuppliesShortList;
  hvcsFilterObj: ENHighVoltCellSuppliesFilter;
  strCodeL10, strCodeLineCable: String;
begin
  if pcSubstation04.ActivePage = tsHighVoltageParty then
    begin
      if pcHighVoltageParty.ActivePage = tsElectricLineSupplies then
        begin //����������� ����� ������� �� ���������� 6 - 10 / 0,4 ��
          if rbENLine10.Checked then
            begin //����������� �������� ��������� ����� 6 - 10 �� �� ���������� 6 - 10 / 0,4 ��
              strCodeL10 := sgENLine10.Cells[0, sgENLine10.Row];
              if strCodeL10 <> '' then
                if Application.MessageBox(
                  PChar('�� ������������� ������ ��������� ����� �������� ��������� ����� � �����������?'),
                  PChar('����������� ������� ���������� 6 - 10 / 0,4 �� ��������� �����:'),
                  MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK
                then
                  begin
                    //������� ����, ����������� ��� �������� ��������������
                    //������ � ������� ��������� ����� 6 - 10 ��
                    TempENLine10 :=
                      HTTPRIOENLine10 as ENLine10ControllerSoapPort;
                    try
                      ENLine10Obj := TempENLine10.getObject(
                        StrToInt(strCodeL10));
                      try
                        if ENLine10Obj.element <> nil then
                          if ENLine10Obj.element.elementInRef <> nil then
                            ENLine10Obj.element.elementInRef.code := Low(Integer);
                        if ENLine10Obj.highVoltageSell <> nil then
                          ENLine10Obj.highVoltageSell.code := Low(Integer);
                        TempENLine10.save(ENLine10Obj);
                      except
                         on EConvertError do Exit;
                      end; //try
                    except
                      on EConvertError do Exit;
                    end; //try
                    //�������� �� ������� ������� �������������� ����� ������,
                    //���������� ���� ������ ���������� 6 - 10 / 0.4 ��,
                    //���������� �������������� ������ � ���������
                    //����� 6 - 10 ��, �������� ������ ���������� ����� ������
                    TempENHighVoltCellSupplies := HTTPRIOENHighVoltCellSupplies
                      as ENHighVoltCellSuppliesControllerSoapPort;
                    hvcsFilterObj := ENHighVoltCellSuppliesFilter.Create;
                    try
                      SetNullIntProps(hvcsFilterObj);
                      SetNullXSProps(hvcsFilterObj);
                      hvcsFilterObj.conditionSQL := ' ENSUBSTATION04.CODE = ' +
                        IntToStr(ENSubstation04Obj.code) +
                        ' AND ENHIGHVOLTAGESELL.CODE = ' +
                        sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row] +
                        ' AND ENLINE10.CODE = ' + strCodeL10;
                      hvcsListObj :=
                        TempENHighVoltCellSupplies.getScrollableFilteredList(
                          hvcsFilterObj, 0, 1);
                      try
                        if hvcsListObj.totalCount > 0 then
                          TempENHighVoltCellSupplies.remove(
                            hvcsListObj.list[0].code);
                      finally
                        hvcsListObj.Free;
                        hvcsListObj := Nil;
                      end;
                    finally
                      hvcsFilterObj.Free;
                      hvcsFilterObj := Nil;
                    end; //try
                    //�������� ���������� �������� ��������� ����� 6 - 10 ��
                    if ENLine10Obj <> nil then
                      begin
                        recalcLines10();
                        UpdateGrid(Sender);
                      end;
                  end; //if Application.MessageBox(...
            end
          else //if rbENLineCable.Checked then
            begin //����������� �������� ��������� ����� 6 - 10 �� �� ���������� 6 - 10 / 0,4 ��
              strCodeLineCable := sgENLineCable.Cells[0, sgENLineCable.Row];
              if strCodeLineCable <> '' then
                if Application.MessageBox(
                  PChar('�� ������������� ������ ��������� ����� �������� ��������� ����� � �����������?'),
                  PChar('����������� ������� ���������� 6 - 10 / 0,4 �� ��������� �����:'),
                  MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK
                then
                  begin
                    TempENLineCable := HTTPRIOENLineCableSupplies
                      as ENLineCableControllerSoapPort;
                    try
                      ENLineCableObj := TempENLineCable.getObject(StrToInt(
                        strCodeLineCable));
                      try
                        if ENLineCableObj.element <> nil then
                          if ENLineCableObj.element.elementInRef <> nil then
                            ENLineCableObj.element.elementInRef.code :=
                              Low(Integer);
                        if ENLineCableObj.highVoltageSell <> nil then
                          ENLineCableObj.highVoltageSell.code := Low(Integer);
                        TempENLineCable.save(ENLineCableObj);
                      except
                         on EConvertError do Exit;
                      end;
                    except
                      on EConvertError do Exit;
                    end;
                    //�������� �� ������� ������� �������������� ����� ������,
                    //���������� ���� ������ ���������� 6 - 10 / 0.4 ��,
                    //���������� �������������� ������ � ��������� �����,
                    //�������� ������ ���������� ����� ��������� ������
                    TempENHighVoltCellSupplies := HTTPRIOENHighVoltCellSupplies
                      as ENHighVoltCellSuppliesControllerSoapPort;
                    hvcsFilterObj := ENHighVoltCellSuppliesFilter.Create;
                    try
                      SetNullIntProps(hvcsFilterObj);
                      SetNullXSProps(hvcsFilterObj);
                      hvcsFilterObj.conditionSQL := ' ENSUBSTATION04.CODE = ' +
                        IntToStr(ENSubstation04Obj.code) +
                        ' AND ENHIGHVOLTAGESELL.CODE = ' +
                        sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row] +
                        ' AND ENLINECABLE.CODE = ' + strCodeLineCable;
                      hvcsListObj :=
                        TempENHighVoltCellSupplies.getScrollableFilteredList(
                          hvcsFilterObj, 0, 1);
                      try
                        if hvcsListObj.totalCount > 0 then
                          TempENHighVoltCellSupplies.remove(
                            hvcsListObj.list[0].code);
                      finally
                        hvcsListObj.Free;
                        hvcsListObj := Nil;
                      end;
                    finally
                      hvcsFilterObj.Free;
                      hvcsFilterObj := Nil;
                    end; //try
                    //�������� ���������� �������� ��������� �����
                    if ENLineCableObj <> nil then
                      begin
                        recalcLinesCable();
                        UpdateGrid(Sender);
                      end;
                  end;
            end;
        end; //if pcHighVoltageParty.ActivePage = tsElectricLineSupplies then
    end //if pcSubstation04.ActivePage = tsHighVoltageParty then
  else if (pcSubstation04.ActivePage = tsLowVoltageBoard) and (sgENLine04.RowCount <> 0) then
    begin
      if sgENLine04.Cells[0, sgENLine04.Row] <> '' then
        if Application.MessageBox(
          PChar('�� ������������� ������ ��������� ����� ��������� ����� 0,4 �� � �����������?'),
          PChar('����������� ��������� �� ���������� �� 6 - 10 / 0,4 �� ��������� �����:'),
          MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK
        then
          begin
            TempENLine04 := HTTPRIOENLine04 as ENLine04ControllerSoapPort;
            try
              ENLine04Obj := TempENLine04.getObject(StrToInt(
                sgENLine04.Cells[0, sgENLine04.Row]));
              try
                if ENLine04Obj.element <> nil then
                  if ENLine04Obj.element.elementInRef <> nil then
                    ENLine04Obj.element.elementInRef.code := Low(Integer);
                TempENLine04.save(ENLine04Obj);
              except
                 on EConvertError do Exit;
              end;
            except
              on EConvertError do Exit;
            end;
            if ENLine04Obj <> nil then
              UpdateGrid(Sender);
          end;
    end; //else if (pcSubstation04.ActivePage = tsLowVoltageBoard) and (sgENLine04.RowCount <> 0) then
end;

procedure TfrmENSubstation04Edit.actLoadAttachmentExecute(Sender: TObject);
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

procedure TfrmENSubstation04Edit.actLoadS04ReservExecute(Sender: TObject);
begin
  ShowENSubstation04.LoadS04Reserv(ENSubstation04Obj.code, HTTPRIOCNPack);
end;

procedure TfrmENSubstation04Edit.pcSubstation04Changing(Sender: TObject;
  var AllowChange: Boolean);
var TempENSubstation04: ENSubstation04ControllerSoapPort;
begin
  if (((ENSubstation04Obj.chambersQuantity = low(Integer))
      or (ENSubstation04Obj.chambersQuantity = 0))
    and (edtChambersQuantity.Text = ''))
  or (ENSubstation04Obj.chambersQuantity = StrToInt(edtChambersQuantity.Text))
  then
    Exit;
  if pcSubstation04.ActivePage = tsSubstation04 then
    if (DialogState = dsEdit) then
      begin
        if not NoBlankValues([edtChambersQuantity]) then
          begin
            S04Activ := True;
            Exit;
          end;
        TempENSubstation04 := HTTPRIOENSubstation04 as ENSubstation04ControllerSoapPort;
        if (edtChambersQuantity.Text <> '') then
          ENSubstation04Obj.chambersQuantity := StrToInt(edtChambersQuantity.Text)
        else
          ENSubstation04Obj.chambersQuantity := Low(Integer);
        TempENSubstation04.save(ENSubstation04Obj);

        ENSubstation04Obj := TempENSubstation04.getObject(ENSubstation04Obj.code);
      end;
end;


procedure TfrmENSubstation04Edit.pmInspectionSheetPopup(Sender: TObject);
var
  inspectionSheet: ENInspectionSheet;
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;

  try
    inspectionSheet := TempENInspectionSheet.getObject(StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]));
  except
    on EConvertError do Exit;
  end;

  if inspectionSheet = nil then Exit;
  if inspectionSheet.code = Low(Integer) then Exit;

  actSendToSigning.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_DRAFT);
  actUnSigning.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_ON_SIGNATURE);
  actSigned.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_ON_SIGNATURE);
  actUnSigned.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_SIGNED);
end;


procedure TfrmENSubstation04Edit.sgENHighVoltageSellRowChanging(
  Sender: TObject; OldRow, NewRow: Integer; var Allow: Boolean);
var vASG: TAdvStringGrid; i, j: Integer;
  TempENSafetyPrecautions: ENSafetyPrecautionsControllerSoapPort;
  ENSafetyPrecautionsList: ENSafetyPrecautionsShortList;
begin
  //���������� ������ ���������� ��� ������� ������������
  if TAdvStringGrid(Sender).Cells[0, NewRow] = '' then
    Exit;
  if sprFilterObject = nil then
    begin
       sprFilterObject := ENSafetyPrecautionsFilter.Create;
       SetNullIntProps(sprFilterObject);
       SetNullXSProps(sprFilterObject);
    end;
  //������� ������� � ������ �� ������� ������� ���������� ��� ������� ������������
  sprFilterObject.conditionSQL := ' ENSAFETYPRECAUTIONS.SUBSTATION04REFCODE = '
    + IntToStr(ENSubstation04Obj.code)
    + ' AND ENSAFETYPRECAUTIONS.HIGHVOLTAGESELLCODE = '
    + TAdvStringGrid(Sender).Cells[0, NewRow];

  TempENSafetyPrecautions :=
    HTTPRIOENSafetyPrecautions as ENSafetyPrecautionsControllerSoapPort;
  ENSafetyPrecautionsList := TempENSafetyPrecautions.getScrollableFilteredList(
    ENSafetyPrecautionsFilter(sprFilterObject), 0, 1);
  try
    sprLastCount := High(ENSafetyPrecautionsList.list);
    codeSPrHVC := 0;
    if sprLastCount > -1 then
      begin
        if ENSafetyPrecautionsList.list[sprLastCount].code <> Low(Integer) then
          codeSPrHVC := ENSafetyPrecautionsList.list[sprLastCount].code;
        if ENSafetyPrecautionsList.list[sprLastCount].fencingCode = Low(Integer) then
          begin
            edtENFencing.Text := '³����� �����������';
            gbLockType.Enabled := False;
            rbLockTypeAbsent.Checked := True;
            memTkMaterialsLock.Text := '';
          end
        else
        edtENFencing.Text := ENSafetyPrecautionsList.list[sprLastCount].fencingName;
        if ENSafetyPrecautionsList.list[sprLastCount].lockTypeCode = Low(Integer) then
          rbLockTypeAbsent.Checked := True
        else
          case ENSafetyPrecautionsList.list[sprLastCount].lockTypeCode of
            0: rbLockTypeAbsent.Checked := True;
            1: rbLockTypeInternal.Checked := True;
            2: rbLockTypeExternal.Checked := True;
          end;
        memTkMaterialsLock.Text :=
          ENSafetyPrecautionsList.list[sprLastCount].matLockRefName;
      end
    else
      begin
        edtENFencing.Text := '³����� �����������';
        gbLockType.Enabled := False;
        rbLockTypeAbsent.Checked := True;
        memTkMaterialsLock.Text := '';
      end;
  finally
    ENSafetyPrecautionsList.Free;
    ENSafetyPrecautionsList := nil;
  end;
  //���������� ������ ������������ ��������������� �������

  //���� ���� �������� ��� ����� �������, ���������� �� �������������� ������
  (*if pcHighVoltageParty.ActivePage = tsElectricLineSupplies then
    Exit;*)

  if pcHighVoltageParty.ActivePage = tsDisconnector then
    begin //���� ������� ������� "�������������"
      vASG := sgENDisconnector;
      j := 4;
    end
  else if pcHighVoltageParty.ActivePage = tsLoadSwitch then
    begin //���� ������� ������� "����������� ��������"
      vASG := sgENLoadSwitch;
      j := 4;
    end
  else if pcHighVoltageParty.ActivePage = tsFuse then
    begin //���� ������� ������� "��������������"
      vASG := sgENFuse;
      j := 3;
    end
  else if pcHighVoltageParty.ActivePage = tsInsulator then
    begin //���� ������� ������� "���������"
      vASG := sgENInsulator;
      j := 3;
    end
  else if pcHighVoltageParty.ActivePage = tsArrester then
    begin //���� ������� ������� "����������"
      vASG := sgENArrester;
      j := 3;
    end
  else if pcHighVoltageParty.ActivePage = tsCurrentTransformer then
    begin //���� ������� ������� "�������������� ����"
      vASG := sgENCurrentTransformer;
      j := 5;
    end
  else if pcHighVoltageParty.ActivePage = tsBus then
    begin //���� ������� ������� "����"
      vASG := sgENBus;
      j := 6;
    end
  else if pcHighVoltageParty.ActivePage = tsMeasurDevice then
    begin //���� ������� ������� "������������� �������"
      vASG := sgENMeasurDevice;
      j := 3;
    end
  else if pcHighVoltageParty.ActivePage = tsElectricLineSupplies then
    begin //���� ������� ������� "����� �������"
      for i := 1 to sgENLine10.RowCount - 1 do //������� �� �������� � �������������� ������ ��������� ����� 6 - 10 ��
        if (sgENLine10.Cells[5, i] = TAdvStringGrid(Sender).Cells[3, NewRow]) or (sgENLine10.Cells[5, i] = '') then
          begin
            sgENLine10.RowHeights[i] := 19;
            sgENLine10.Row := i;
          end
        else
          sgENLine10.RowHeights[i] := 0;
      sgENLine10.Update;
      vASG := sgENLineCable;
      j := 5;
    end;
  for i := 1 to vASG.RowCount - 1 do //������� �� ��������� � �������������� ������ ������������
    if vASG.Cells[j, i] = TAdvStringGrid(Sender).Cells[3, NewRow] then
      begin
        vASG.RowHeights[i] := 19;
        vASG.Row := i;
      end
    else
      vASG.RowHeights[i] := 0;
  vASG.Update;
end;


procedure TfrmENSubstation04Edit.actViewBranchExecute(Sender: TObject);
Var TempENBranch: ENBranchControllerSoapPort;
begin
  TempENBranch := HTTPRIOENBranch as ENBranchControllerSoapPort;
  try
    ENBranchObj :=
      TempENBranch.getObject(StrToInt(sgENBranch.Cells[0, sgENBranch.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENBranchEdit := TfrmENBranchEdit.Create(Application, dsView);
  try
    frmENBranchEdit.codeS04 := ENSubstation04Obj.code;
    if ENSubstation04Obj.element.code <> low(Integer) then
      frmENBranchEdit.elementCodeS04 := ENSubstation04Obj.element.code;
    frmENBranchEdit.ShowModal;
  finally
    frmENBranchEdit.Free;
    frmENBranchEdit := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actInsertBranchExecute(Sender: TObject);
Var TempENBranch: ENBranchControllerSoapPort;
  TempENPanel: ENPanelControllerSoapPort;
  tmpENPanelObj: ENPanel;
//TempENLine04: ENLine04ControllerSoapPort;
begin
  if pcSubstation04.ActivePage = tsLowVoltageBoard then
    begin //���������� ���������� ������������� � ������������� �������
      TempENBranch := HTTPRIOENBranch as ENBranchControllerSoapPort;

      ENBranchObj := ENBranch.Create;
      SetNullIntProps(ENBranchObj);
      SetNullXSProps(ENBranchObj);

      //ENBranchObj.branchTypeRef := ENBranchTypeRef.
      try
        frmENBranchEdit := TfrmENBranchEdit.Create(Application, dsInsert);

        try
          frmENBranchEdit.codeS04 := ENSubstation04Obj.code;
          if ENSubstation04Obj.element.code <> low(Integer) then
            frmENBranchEdit.elementCodeS04 := ENSubstation04Obj.element.code;
          TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
          tmpENPanelObj :=
            TempENPanel.getObject(StrToInt(sgENPanel.Cells[0, sgENPanel.Row]));
          if tmpENPanelObj <> nil then
            frmENBranchEdit.edtPanelLVB.Text := tmpENPanelObj.name;
        finally
          tmpENPanelObj.Free;
        end;

        // if ENBranchObj.panel = nil then
        ENBranchObj.panel := ENPanelRef.Create();
        ENBranchObj.panel.code :=
          StrToInt(sgENPanel.Cells[0, sgENPanel.Row]);
        if sgENBranch.Cells[0, 1] = '' then
          frmENBranchEdit.edtNumberGen.Text := '��������� � 1'
        else
          frmENBranchEdit.edtNumberGen.Text := '��������� � ' +
            IntToStr(sgENBranch.RowCount);
        try
          if frmENBranchEdit.ShowModal = mrOk then
            begin
              if ENBranchObj <> nil then
                UpdateGrid(Sender);
            end;
        finally
          frmENBranchEdit.Free;
          frmENBranchEdit := nil;
        end;
      finally
        ENBranchObj.Free;
        recalcBranches(EditENBranch.btLine04);
        recalcBranches(EditENBranch.btLineCable);
      end;

      //���������� ����� 0,4 ��, ����������� �� ���������� 6 - 10 / 0.4 ��
      {TempENLine04 := HTTPRIOENLine04 as ENLine04ControllerSoapPort;
      ENLine04Obj:=ENLine04.Create;

      ENLine04Obj.element := ENElement.Create;
      ENLine04Obj.element.elementInRef := ENElementRef.Create;
      ENLine04Obj.element.elementInRef.code := ENSubstation04Obj.element.code;
      ENLine04Obj.element.renRef := EPRenRef.Create;
      ENLine04Obj.element.renRef.code := ENSubstation04Obj.element.renRef.code;

      ENLine04Obj.dateGen:= TXSDate.Create;

      try
        frmENLine04Edit := TfrmENLine04Edit.Create(Application, dsInsert);

        try
        frmENLine04Edit.edtENSubstation04Name.Text := ENSubstation04Obj.name;
        frmENLine04Edit.edtEPRenName.Text := ENSubstation04Obj.element.renRef.name;

        frmENLine04Edit.DisableControls([frmENLine04Edit.edtENSubstation04Name,
          frmENLine04Edit.spbENSubstation04, frmENLine04Edit.edtEPRenName,
          frmENLine04Edit.spbEPRen]);

          if frmENLine04Edit.ShowModal = mrOk then
          begin
            if ENLine04Obj<>nil then
                //TempENLine04.add(ENLine04Obj);
                UpdateGrid(Sender);
          end;
        finally
          frmENLine04Edit.Free;
          frmENLine04Edit:=nil;
        end;
      finally
        ENLine04Obj.Free;
      end;}
    end; //if pcSubstation04.ActivePage = tsLowVoltageBoard then
end;

procedure TfrmENSubstation04Edit.actDeleteBranchExecute(Sender: TObject);
var ObjCode: Integer;
  TempENBranch: ENBranchControllerSoapPort;
  ENBranchObj: ENBranch;
  TempENLine04: ENLine04ControllerSoapPort;
  ENLine04Obj: ENLine04;
  TempENLineCableLVB: ENLineCableControllerSoapPort;
  ENLineCableLVBObj: ENLineCable;
  IsBranchLeave: Boolean;//������� ������������������ ������������� ��������� ����� ��� ������� ������� ����� � ���
  TempENContactBreaker: ENContactBreakerControllerSoapPort;
  TempENFuseLVB: ENFuseControllerSoapPort;
  TempENAutomat: ENAutomatControllerSoapPort;
  TempENMeasurDeviceLVB: ENMeasurDeviceControllerSoapPort;
  ENContactBreakerListObj: ENContactBreakerShortList;
  ENContactBreakerFilterObj: ENContactBreakerFilter;
  ENFuseLVBListObj: ENFuseShortList;
  ENFuseLVBFilterObj: ENFuseFilter;
  ENAutomatListObj: ENAutomatShortList;
  ENAutomatFilterObj: ENAutomatFilter;
  ENMeasurDeviceLVBListObj: ENMeasurDeviceShortList;
  ENMeasurDeviceLVBFilterObj: ENMeasurDeviceFilter;
begin

  if pcSubstation04.ActivePage = tsLowVoltageBoard then
    begin
      try
        ObjCode := StrToInt(sgENBranch.Cells[0, sgENBranch.Row]);
      except
        on EConvertError do Exit;
      end;
      if Application.MessageBox(
        PChar('�� ������������� ������ ��������� ����� ������������� ������ � �����������?'),
        PChar('�������� !'),MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK
      then
        begin
          IsBranchLeave := False;
		      (*��������������� �������� ���������� ����������� � ������� ���������
          ��� ������������� � ������� ������������� ������� ����� � ������������� ������*)		
          TempENContactBreaker :=
            HTTPRIOENContactBreaker as ENContactBreakerControllerSoapPort;
          try
            ENContactBreakerFilterObj := ENContactBreakerFilter.Create;

            SetNullIntProps(ENContactBreakerFilterObj);
            SetNullXSProps(ENContactBreakerFilterObj);

            ENContactBreakerFilterObj.conditionSQL :=
              'ENCONTACTBREAKER.BRANCHCODE = '
              + sgENBranch.Cells[0, sgENBranch.Row]
              + ' AND ENCONTACTBREAKER.BRANCHCODE IN'
              + ' (SELECT CODE FROM ENBRANCH WHERE PANELCODE = '
              + sgENPanel.Cells[0, sgENPanel.Row] + ')';

            ENContactBreakerListObj :=
              TempENContactBreaker.getScrollableFilteredList(
                ENContactBreakerFilterObj, 0, -1);

            if ENContactBreakerListObj.totalCount > 0 then
              begin
                Application.MessageBox(
                  PChar('������ ���������� � '
                    + sgENBranch.Cells[5, sgENBranch.Row]
                    + ' �� �������������� ���������, ' + #13#10
                    + '���� � ��� ������ ������ ����������.'),
                  PChar('��������! ��������� ������� ��������:'), MB_ICONWARNING);
                pcBoardEquipment.ActivePage := tsContactBreakerLVB;
                //actNoFilter.Execute;
                IsBranchLeave := True;
              end;
          finally
            ENContactBreakerFilterObj.Free;
            ENContactBreakerListObj.Free;
          end;

          if IsBranchLeave then //����������� ������� ����� � ������������� ������
            Exit; //� ������ ����������� �����������

          (*��������������� �������� ���������� ��������������� � ������� ���������
          ��� ������������� � ������� ������������� ������� ����� � ������������� ������*)
          TempENFuseLVB :=
            HTTPRIOENFuseLVB as ENFuseControllerSoapPort;
          try
            ENFuseLVBFilterObj := ENFuseFilter.Create;

            SetNullIntProps(ENFuseLVBFilterObj);
            SetNullXSProps(ENFuseLVBFilterObj);

            ENFuseLVBFilterObj.conditionSQL := 'ENFUSE.BRANCHCODE = '
              + sgENBranch.Cells[0, sgENBranch.Row]
              + ' AND ENFUSE.BRANCHCODE IN'
              + ' (SELECT CODE FROM ENBRANCH WHERE PANELCODE = '
              + sgENPanel.Cells[0, sgENPanel.Row] + ')';

            ENFuseLVBListObj :=
              TempENFuseLVB.getScrollableFilteredList(
                ENFuseLVBFilterObj, 0, -1);

            if ENFuseLVBListObj.totalCount > 0 then
              begin
                Application.MessageBox(
                  PChar('������ ���������� � '
                    + sgENBranch.Cells[5, sgENBranch.Row]
                    + ' �� �������������� ���������, ' + #13#10
                    + '���� � ��� ������ ������ ��������������.'),
                  PChar('��������! ��������� ������� ��������:'), MB_ICONWARNING);
                pcBoardEquipment.ActivePage := tsFuseLVB;
                //actNoFilter.Execute;
                IsBranchLeave := True;
              end;
          finally
            ENFuseLVBFilterObj.Free;
            ENFuseLVBListObj.Free;
          end;

          if IsBranchLeave then //����������� ������� ����� � ������������� ������
            Exit; //� ������ ����������� ���������������

          (*��������������� �������� ���������� �������������� ������������ � ������� ���������
          ��� ������������� � ������� ������������� ������� ����� � ������������� ������*)
          TempENAutomat :=
            HTTPRIOENAutomat as ENAutomatControllerSoapPort;
          try
            ENAutomatFilterObj := ENAutomatFilter.Create;

            SetNullIntProps(ENAutomatFilterObj);
            SetNullXSProps(ENAutomatFilterObj);

            ENAutomatFilterObj.conditionSQL := 'ENAUTOMAT.BRANCHCODE = '
              + sgENBranch.Cells[0, sgENBranch.Row]
              + ' AND ENAUTOMAT.BRANCHCODE IN'
              + ' (SELECT CODE FROM ENBRANCH WHERE PANELCODE = '
              + sgENPanel.Cells[0, sgENPanel.Row] + ')';

            ENAutomatListObj :=
              TempENAutomat.getScrollableFilteredList(
                ENAutomatFilterObj, 0, -1);

            if ENAutomatListObj.totalCount > 0 then
              begin
                Application.MessageBox(
                  PChar('������ ���������� � '
                    + sgENBranch.Cells[5, sgENBranch.Row]
                    + ' �� �������������� ���������, ' + #13#10
                    + '���� � ��� ������ ������ �������������� �����������.'),
                  PChar('��������! ��������� ������� ��������:'), MB_ICONWARNING);
                pcBoardEquipment.ActivePage := tsAutomatLVB;
                //actNoFilter.Execute;
                IsBranchLeave := True;
              end;
          finally
            ENAutomatFilterObj.Free;
            ENAutomatListObj.Free;
          end;

          if IsBranchLeave then //����������� ������� ����� � ������������� ������
            Exit; //� ������ ����������� �������������� ������������

          (*��������������� �������� ���������� ������������� �������� � ������� ���������
          ��� ������������� � ������� ������������� ������� ����� � ������������� ������*)
          TempENMeasurDeviceLVB :=
            HTTPRIOENMeasurDeviceLVB as ENMeasurDeviceControllerSoapPort;
          try
            ENMeasurDeviceLVBFilterObj := ENMeasurDeviceFilter.Create;

            SetNullIntProps(ENMeasurDeviceLVBFilterObj);
            SetNullXSProps(ENMeasurDeviceLVBFilterObj);

            ENMeasurDeviceLVBFilterObj.conditionSQL :=
              'ENMEASURDEVICE.BRANCHCODE = '
              + sgENBranch.Cells[0, sgENBranch.Row]
              + ' AND ENMEASURDEVICE.BRANCHCODE IN'
              + ' (SELECT CODE FROM ENBRANCH WHERE PANELCODE = '
              + sgENPanel.Cells[0, sgENPanel.Row] + ')';

            ENMeasurDeviceLVBListObj :=
              TempENMeasurDeviceLVB.getScrollableFilteredList(
                ENMeasurDeviceLVBFilterObj, 0, -1);

            if ENMeasurDeviceLVBListObj.totalCount > 0 then
              begin
                Application.MessageBox(
                  PChar('������ ���������� � '
                    + sgENBranch.Cells[5, sgENBranch.Row]
                    + ' �� �������������� ���������, ' + #13#10
                    + '���� � ��� ������ ������ ������������� �������.'),
                  PChar('��������! ��������� ������� ��������:'), MB_ICONWARNING);
                pcBoardEquipment.ActivePage := tsMeasurDeviceLVB;
                //actNoFilter.Execute;
                IsBranchLeave := True;
              end;
          finally
            ENMeasurDeviceLVBFilterObj.Free;
            ENMeasurDeviceLVBListObj.Free;
          end;

          if IsBranchLeave then //����������� ������� ����� � ������������� ������
            Exit; //� ������ ����������� ������������� ��������

          try
            TempENBranch := HTTPRIOENBranch as ENBranchControllerSoapPort;
            ENBranchObj := TempENBranch.getObject(ObjCode);

            if ENBranchObj.branchTypeRef.code = 1 then
              begin
                if ENBranchObj.line04Ref <> nil then
                  if ENBranchObj.line04Ref.code <> Low(Integer) then
                    try
                      TempENLine04 :=
                        HTTPRIOENLine04 as ENLine04ControllerSoapPort;
                      ENLine04Obj := TempENLine04.getObject(ENBranchObj.line04Ref.code);
                      if ENLine04Obj.element = nil then
                        ENLine04Obj.element := ENElement.Create();
                      ENLine04Obj.element.elementInRef.code := Low(Integer);
                      TempENLine04.save(ENLine04Obj);
                    finally
                      ENLine04Obj.Free;
                    end;
              end
            else if ENBranchObj.branchTypeRef.code = 2 then
              begin
                if ENBranchObj.lineCableRef <> nil then
                  if ENBranchObj.lineCableRef.code <> Low(Integer) then
                    try
                      TempENLineCableLVB :=
                        HTTPRIOENLineCableLVB as ENLineCableControllerSoapPort;
                      ENLineCableLVBObj := TempENLineCableLVB.getObject(ENBranchObj.lineCableRef.code);
                      if ENLineCableLVBObj.element = nil then
                        ENLineCableLVBObj.element := ENElement.Create();
                      ENLineCableLVBObj.element.elementInRef.code := Low(Integer);
                      TempENLineCableLVB.save(ENLineCableLVBObj);
                    finally
                      ENLineCableLVBObj.Free;
                    end;
              end;
            TempENBranch.remove(ObjCode);
          finally
            ENBranchObj.Free;
            UpdateGrid(Sender);
          end;
        end;
      {TempENLine04 := HTTPRIOENLine04 as ENLine04ControllerSoapPort;
      try
        ObjCode := StrToInt(sgENLine04.Cells[0,sgENLine04.Row]);
      except
        on EConvertError do Exit;
      end;
      if Application.MessageBox(PChar('�� ������������� ������ ������� (�������� ��� 0.4) ?'),
        PChar('�������� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK
      then
        begin
          TempENLine04.remove(ObjCode);
          UpdateGrid(Sender);
        end;}
    end; //if pcSubstation04.ActivePage = tsLowVoltageBoard then
end;

procedure TfrmENSubstation04Edit.actEditBranchExecute(Sender: TObject);
Var TempENBranch: ENBranchControllerSoapPort;
//TempENLine04: ENLine04ControllerSoapPort;
begin
  if pcSubstation04.ActivePage = tsLowVoltageBoard then
    begin
      TempENBranch := HTTPRIOENBranch as ENBranchControllerSoapPort;
      try
        ENBranchObj := TempENBranch.getObject(StrToInt(sgENBranch.Cells[0,sgENBranch.Row]));
      except
        on EConvertError do Exit;
      end;
      frmENBranchEdit := TfrmENBranchEdit.Create(Application, dsEdit);
      try
        frmENBranchEdit.codeS04 := ENSubstation04Obj.code;
        if ENSubstation04Obj.element.code <> low(Integer) then
          frmENBranchEdit.elementCodeS04 := ENSubstation04Obj.element.code;
        if frmENBranchEdit.ShowModal= mrOk then
          UpdateGrid(Sender);
      finally
        frmENBranchEdit.Free;
        frmENBranchEdit := nil;
      end;
      {TempENLine04 := HTTPRIOENLine04 as ENLine04ControllerSoapPort;
       try
         ENLine04Obj := TempENLine04.getObject(StrToInt(sgENLine04.Cells[0,sgENLine04.Row]));
       except
       on EConvertError do Exit;
      end;
      frmENLine04Edit:=TfrmENLine04Edit.Create(Application, dsEdit);

      try
        frmENLine04Edit.DisableControls([frmENLine04Edit.edtENSubstation04Name, frmENLine04Edit.spbENSubstation04]);
        if frmENLine04Edit.ShowModal= mrOk then
          begin
            //TempENLine04.save(ENLine04Obj);
            UpdateGrid(Sender);
          end;
      finally
        frmENLine04Edit.Free;
        frmENLine04Edit:=nil;
      end;}
  end; //   if pcSubstation04.ActivePage = tsLowVoltageBoard then
end;

procedure TfrmENSubstation04Edit.sgENLine10Click(Sender: TObject);
begin
  rbENLine10.Checked := True;
end;

procedure TfrmENSubstation04Edit.sgENLineCableClick(Sender: TObject);
begin
  rbENLineCable.Checked := True;
end;

procedure TfrmENSubstation04Edit.sgENPanelRowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
var i: Integer;
begin
  //������� �� �������� � ������ ������������� �����
  for i := 1 to sgENBranch.RowCount - 1 do
    if sgENBranch.Cells[4, i] = TAdvStringGrid(Sender).Cells[4, NewRow] then
      begin
        sgENBranch.RowHeights[i] := 19;
        sgENBranch.Row := i;
      end
    else
      sgENBranch.RowHeights[i] := 0;
  sgENBranch.Update;

  (*for i := 1 to sgENContactBreaker.RowCount - 1 do
    sgENContactBreaker.RowHeights[i] := 0;

  for i := 1 to sgENFuseLVB.RowCount - 1 do
    sgENFuseLVB.RowHeights[i] := 0;

  for i := 1 to sgENAutomat.RowCount - 1 do
    sgENAutomat.RowHeights[i] := 0;

  for i := 1 to sgENMeasurDeviceLVB.RowCount - 1 do
    sgENMeasurDeviceLVB.RowHeights[i] := 0;*)

  DisableActions([actInsertBranch], (
      (TAdvStringGrid(Sender).Cells[1, NewRow] = '�� ����������')
      or (TAdvStringGrid(Sender).Cells[1, NewRow] = '����� ��������������� ������')
      or (TAdvStringGrid(Sender).Cells[1, NewRow] = '�������� ������')
      or (TAdvStringGrid(Sender).Cells[1, NewRow] =
        '������ ������������� ��������� �������')
      )
    or (DialogState = dsView));

  if (TAdvStringGrid(Sender).Cells[1, NewRow] = '����� ��������������� ������')
  or (TAdvStringGrid(Sender).Cells[1, NewRow] = '�������� ������')
  or (TAdvStringGrid(Sender).Cells[1, NewRow] = '������-���������� ������')
  or (TAdvStringGrid(Sender).Cells[1, NewRow] =
    '������ ������������� ��������� �������')
  or (TAdvStringGrid(Sender).Cells[1, NewRow] = '��� �� ���')
  then
    begin
      for i := 1 to sgENLowVoltBoard.RowCount - 1 do
        if sgENLowVoltBoard.Cells[3, i] = TAdvStringGrid(Sender).Cells[6, NewRow] then
          begin
            sgENLowVoltBoard.Row := i;
            Break;
          end;
      //sgENLowVoltBoard.Update;
      chbLowVoltBoard.Checked := True;
      ChangeLVBEquipmentHeaders;
      LowVoltBoardEquipmentShow;

    end //if TAdvStringGrid(Sender).Cells[1, NewRow] = ...
  else
    sgENBranch.OnRowChanging(TObject(sgENBranch), 0, sgENBranch.Row, Allow);
end;

procedure TfrmENSubstation04Edit.sgENBranchRowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
var vASG: TAdvStringGrid; i, j: Integer;
begin
  if TAdvStringGrid(Sender).RowCount = 0 then
    Exit;
  if pcBoardEquipment.ActivePage = tsContactBreakerLVB then
    begin //���� ������� ������� "����������" (�� ������������� �������)
      vASG := sgENContactBreaker;
      j := 3;
    end
  else if pcBoardEquipment.ActivePage = tsFuseLVB then
    begin //���� ������� ������� "��������������" (�� ������������� �������)
      vASG := sgENFuseLVB;
      j := 3;
    end
  else if pcBoardEquipment.ActivePage = tsAutomatLVB then //���� �������
    begin //������� "�������������� �����������" (�� ������������� �������)
      vASG := sgENAutomat;
      j := 4;
    end
  else if pcBoardEquipment.ActivePage = tsMeasurDeviceLVB then //���� �������
    begin //������� "������������� �������" (�� ������������� �������)
      vASG := sgENMeasurDeviceLVB;
      j := 4;
    end;
  sgENPanel.Update;
  for i := 1 to vASG.RowCount - 1 do //������� �� ������������ � ������������� �� ������ ����� ������������
    if (vASG.Cells[j + 1, i] = TAdvStringGrid(Sender).Cells[5, NewRow])
    and (vASG.Cells[j, i] = TAdvStringGrid(Sender).Cells[4, NewRow])
    and (vASG.Cells[j + 2, i] = TAdvStringGrid(Sender).Cells[0, NewRow]) then //������ �������� �� ���� �������������
      begin
        vASG.RowHeights[i] := 19;
        vASG.Row := i;
      end
    else
      vASG.RowHeights[i] := 0;
  vASG.Update;
end;

procedure TfrmENSubstation04Edit.actPasspSubSt_6_10_04Execute(Sender: TObject);
var
  argNames, args: EnergyProController.ArrayOfString;
  reportName : String;
begin
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'SubStCode';
  args[0] := IntToStr(ENSubstation04Obj.code);

  reportName := 'Passport/SubStation_6_10_04';
  makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmENSubstation04Edit.spbAddressClick(Sender: TObject);
var TempAddress: AddressControllerSoapPort;
begin
  if ENSubstation04Obj.addressRef <> nil then
    if ENSubstation04Obj.addressRef.code <> Low(Integer) then
      begin
        TempAddress := HTTPRIOAddress as AddressControllerSoapPort;
        try
          EditAddress.AddressObj :=
            TempAddress.getObject(ENSubstation04Obj.addressRef.code);
        except
          on EConvertError do Exit;
        end;
      end; //if ENSubstation04Obj.addressRef.code <> Low(Integer) then

  frmAddressEdit := TfrmAddressEdit.Create(Application, dsEdit);
  with frmAddressEdit do
    begin
      Label2.Caption := '����� �������';
      Label6.Caption := '� ��������';
      Label4.Visible := False;
      edtApp.Visible := False;
      spbApp.Visible := False;
      GroupBox1.Visible := False;
      btnOk.Top := edtApp.Top + edtApp.Height + 10;
      btnCancel.Top := btnOk.Top;
      Height := btnOk.Top + btnOk.Height + 40;
      edtProvince.Text := '����������';
      spbProvince.Enabled := False;
      ProvinceCode := 1;
    end; //with frmAddressEdit do

    if frmAddressEdit.ShowModal = mrOk then
      try
        if ENSubstation04Obj.addressRef = nil then
          ENSubstation04Obj.addressRef := AddressRef.Create;
        ENSubstation04Obj.addressRef.code := AddressCode;
        if (RegionCode <> 0) and (RegionCode <> 1) then
          memAddress.Text := RegionName + ' �-�, '
        else if (RegionCode = 1) and (CityCode <> 1) then
          memAddress.Text := RegionName + ', '
        else
          memAddress.Text := '';
        if CityTypeName = '_�������_' then
          CityTypeName := '';
        if StreetTypeName = '_�������_' then
          StreetTypeName := '';
        memAddress.Text := memAddress.Text + CityTypeName + ' ' + CityName + ', '
          + StreetTypeName + ' ' + StreetName + ', ' + House;
      finally
        frmAddressEdit.Free;
        frmAddressEdit := nil;
      end;
end;

(*������ ���������������*)
procedure TfrmENSubstation04Edit.actChangeTransformerExecute(Sender: TObject);
Var TempENTransformerChange: ENTransformerChangeControllerSoapPort;
  TempENTransformer: ENTransformerControllerSoapPort;
begin
  TempENTransformer := HTTPRIOENTransformer as ENTransformerControllerSoapPort;
  try //��������� �������-������������� ��������������
    ENTransformerOldObj := TempENTransformer.getObject(
      StrToInt(sgENTransformer.Cells[0, sgENTransformer.Row]));
  except
    on EConvertError do Exit;
  end;
  //������ � �������� ������ ������������

  TempENTransformerChange :=
    HTTPRIOENTransformerChange as ENTransformerChangeControllerSoapPort;

  ENTransformerChangeObj := ENTransformerChange.Create;

  //ENTransformerChangeObj.installDate:= TXSDate.Create;
  //ENTransformerChangeObj.uninstallDate:= TXSDate.Create;
  //ENTransformerChangeObj.dateWorkOrder:= TXSDate.Create;
  //ENTransformerChangeObj.actDateGen:= TXSDate.Create;
  ENTransformerChangeNewObj := ENTransformerChange.Create;
  if ENTRansformerChangeNewObj.substation04Ref = nil then
    ENTRansformerChangeNewObj.substation04Ref := ENSubstation04Ref.Create;
  ENTRansformerChangeNewObj.substation04Ref.code := ENSubstation04Obj.code;
  try

    frmENTransformerChangeEdit :=
      TfrmENTransformerChangeEdit.Create(Application, dsEdit);
    try
      frmENTransformerChangeEdit.btnOk.ModalResult := mrNone;
      frmENTransformerChangeEdit.btnOk.Action :=
        frmENTransformerChangeEdit.ActnLstChangeEquip.Actions[0];
      frmENTransformerChangeEdit.tsEquipInstall.TabVisible := False;
      frmENTransformerChangeEdit.memName.Text := '������ ��������������';
      if frmENTransformerChangeEdit.ShowModal = mrOk then
        begin
          TempENTransformerChange.changeTransformer(
            ENTransformerOldObj, ENTransformerChangeObj,
            ENTransformerNewObj, ENTransformerChangeNewObj);
          recalcTransformers();
          UpdateGrid(Sender);
        end;
    finally
      frmENTransformerChangeEdit.Free;
      frmENTransformerChangeEdit := nil;
      ENTransformerOldObj.Free;
      ENTransformerOldObj := nil;
      ENTransformerNewObj.Free;
      ENTransformerNewObj := nil;
    end;
  finally
    ENTransformerChangeObj.Free;
    ENTransformerChangeObj := nil;
    ENTransformerChangeNewObj.Free;
    ENTransformerChangeNewObj := nil;
  end;
end;


procedure TfrmENSubstation04Edit.actCopySheetExecute(Sender: TObject);
var
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
  newSheetCode, objCode: Integer;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
  try
    objCode := StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]);
  except
    on EConvertError do Exit;
  end;

  if objCode = Low(Integer) then Exit;

  if Application.MessageBox(PChar('�� ����� ������ �������� (���� ������ ��`���� ����������) ?'),
                    PChar('�������� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    newSheetCode := TempENInspectionSheet.copySheet(objCode);
    Application.MessageBox(PChar('���� ������ ����������! ��� = ' + IntToStr(newSheetCode)), PChar('�����������'), MB_ICONINFORMATION);

    pcSubstation04Change(Sender);
  end;
end;


procedure TfrmENSubstation04Edit.actUninstallTransformerExecute(
  Sender: TObject);
Var TempENTransformerChange: ENTransformerChangeControllerSoapPort;
  TempENTransformer: ENTransformerControllerSoapPort;
begin
  TempENTransformer := HTTPRIOENTransformer as ENTransformerControllerSoapPort;
  try //��������� �������-������������� ��������������
    ENTransformerOldObj := TempENTransformer.getObject(
      StrToInt(sgENTransformer.Cells[0,sgENTransformer.Row]));
  except
    on EConvertError do Exit;
  end;
  //������ � �������� ������ ������������
  TempENTransformerChange :=
    HTTPRIOENTransformerChange as ENTransformerChangeControllerSoapPort;
  ENTransformerChangeObj := ENTransformerChange.Create;
  //ENTransformerChangeObj.installDate:= TXSDate.Create;
  //ENTransformerChangeObj.uninstallDate:= TXSDate.Create;
  //ENTransformerChangeObj.dateWorkOrder:= TXSDate.Create;
  //ENTransformerChangeObj.actDateGen:= TXSDate.Create;
  try
    frmENTransformerChangeEdit :=
      TfrmENTransformerChangeEdit.Create(Application, dsEdit);
    try
      frmENTransformerChangeEdit.btnOk.ModalResult := mrNo;
      frmENTransformerChangeEdit.btnOk.Action :=
        frmENTransformerChangeEdit.ActnLstChangeEquip.Actions[1];
      frmENTransformerChangeEdit.tsEquipInstall.TabVisible := False;
      frmENTransformerChangeEdit.tsEquipInstall.TabVisible := False;
      frmENTransformerChangeEdit.memName.Text := '������ ��������������';

      if frmENTransformerChangeEdit.ShowModal = mrNo then
        begin
          TempENTransformerChange.UninstallTransformer(
            ENTransformerOldObj, ENTransformerChangeObj);
          recalcTransformers();
          UpdateGrid(Sender);
        end;
    finally
      frmENTransformerChangeEdit.Free;
      frmENTransformerChangeEdit := nil;
      ENTransformerOldObj.Free;
      ENTransformerOldObj := nil;
    end;
  finally
    ENTransformerChangeObj.Free;
    ENTransformerChangeObj := nil;
  end;
end;


procedure TfrmENSubstation04Edit.actUnSignedExecute(Sender: TObject);
var
  sheetCode: Integer;
  TempENInspectionSheet : ENInspectionSheetControllerSoapPort;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
  try
    sheetCode := StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('�� ����� ������ ������� ��������� ����� ������?'),
                  PChar('�����!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENInspectionSheet.unSigned(sheetCode);
    pcSubstation04Change(Sender);
  end;
end;


procedure TfrmENSubstation04Edit.actUnSigningExecute(Sender: TObject);
var
  sheetCode: Integer;
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
  try
    sheetCode := StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('�� ����� ������ ��������� ���� ������ � ������ "��������"?'),
                  PChar('�����!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENInspectionSheet.unSigning(sheetCode);
    pcSubstation04Change(Sender);
  end;
end;


procedure TfrmENSubstation04Edit.actInstallTransformerExecute(
  Sender: TObject);
Var TempENTransformerChange: ENTransformerChangeControllerSoapPort;
begin //������ � �������� ������ ������������
  TempENTransformerChange :=
    HTTPRIOENTransformerChange as ENTransformerChangeControllerSoapPort;
  ENTransformerChangeNewObj := ENTransformerChange.Create;
  if ENTRansformerChangeNewObj.substation04Ref = nil then
    ENTRansformerChangeNewObj.substation04Ref := ENSubstation04Ref.Create;
  ENTRansformerChangeNewObj.substation04Ref.code := ENSubstation04Obj.code;
  //ENTransformerChangeNewObj.installDate:= TXSDate.Create;
  //ENTransformerChangeNewObj.uninstallDate:= TXSDate.Create;
  //ENTransformerChangeNewObj.dateWorkOrder:= TXSDate.Create;
  //ENTransformerChangeNewObj.actDateGen:= TXSDate.Create;
  try
    frmENTransformerChangeEdit :=
      TfrmENTransformerChangeEdit.Create(Application, dsEdit);
    try
      frmENTransformerChangeEdit.btnOk.ModalResult := mrYes;
      frmENTransformerChangeEdit.btnOk.Action :=
        frmENTransformerChangeEdit.ActnLstChangeEquip.Actions[2];
      frmENTransformerChangeEdit.tsEquipUninstall.TabVisible := False;
      frmENTransformerChangeEdit.actChooseNewEquip.Enabled := True;
      frmENTransformerChangeEdit.memName.Text := '��������� ��������������';

      if frmENTransformerChangeEdit.ShowModal = mrYes then
        begin
          TempENTransformerChange.InstallTransformer(
            ENTransformerNewObj, ENTransformerChangeNewObj);
          recalcTransformers();
          UpdateGrid(Sender);
        end;
    finally
      frmENTransformerChangeEdit.Free;
      frmENTransformerChangeEdit := nil;
      ENTransformerNewObj.Free;
      ENTransformerNewObj := nil;
    end;
  finally
    ENTransformerChangeNewObj.Free;
    ENTransformerChangeNewObj := nil;
  end;
end;

(*������ ��������������*)
procedure TfrmENSubstation04Edit.actChangeDisconnectorExecute(Sender: TObject);
Var TempENDisconnectorChange: ENDisconnectorChangeControllerSoapPort;
  TempENDisconnector: ENDisconnectorControllerSoapPort;
begin
  TempENDisconnector := HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;
  try //��������� �������-������������� �������������
    ENDisconnectorOldObj := TempENDisconnector.getObject(
      StrToInt(sgENDisconnector.Cells[0, sgENDisconnector.Row]));
  except
    on EConvertError do Exit;
  end;
  //������ � �������� ������ ������������
  TempENDisconnectorChange :=
    HTTPRIOENDisconnectorChange as ENDisconnectorChangeControllerSoapPort;

  ENDisconnectorChangeObj := ENDisconnectorChange.Create;
  ENDisconnectorChangeNewObj := ENDisconnectorChange.Create;

  try
    if ENDisconnectorChangeObj.substation04Ref = nil then
      ENDisconnectorChangeObj.substation04Ref := ENSubstation04Ref.Create;
    ENDisconnectorChangeObj.substation04Ref.code := ENSubstation04Obj.code;

    if ENDisconnectorChangeNewObj.substation04Ref = nil then
      ENDisconnectorChangeNewObj.substation04Ref := ENSubstation04Ref.Create;
    ENDisconnectorChangeNewObj.substation04Ref.code := ENSubstation04Obj.code;
    if ENDisconnectorChangeNewObj.highVoltCellRef = nil then
      ENDisconnectorChangeNewObj.highVoltCellRef := ENHighVoltageSellRef.Create;
    ENDisconnectorChangeNewObj.highVoltCellRef.code := StrToInt(
      sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);
      //ENDisconnectorOldObj.highvoltageSell.code;
    if sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row] <> '' then
      begin
        if ENDisconnectorChangeNewObj.transformerRef = nil then
          ENDisconnectorChangeNewObj.transformerRef := ENTransformerRef.Create;
        ENDisconnectorChangeNewObj.transformerRef.code :=
          StrToInt(sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row]);
      end;

    frmENDisconnectorChangeEdit :=
      TfrmENDisconnectorChangeEdit.Create(Application, dsEdit);
    try
      frmENDisconnectorChangeEdit.btnOk.ModalResult := mrNone;
      frmENDisconnectorChangeEdit.btnOk.Action :=
        frmENDisconnectorChangeEdit.ActnLstChangeEquip.Actions[0];
      frmENDisconnectorChangeEdit.tsEquipInstall.TabVisible := False;
      frmENDisconnectorChangeEdit.memName.Text := '������ �������������';
      if frmENDisconnectorChangeEdit.ShowModal = mrOk then
        begin
          TempENDisconnectorChange.changeDisconnector(
            ENDisconnectorOldObj, ENDisconnectorChangeObj,
            ENDisconnectorNewObj, ENDisconnectorChangeNewObj);
          recalcDisconnectors();
          UpdateGrid(Sender);
        end;
    finally
      frmENDisconnectorChangeEdit.Free;
      frmENDisconnectorChangeEdit := nil;
      ENDisconnectorOldObj.Free;
      ENDisconnectorOldObj := nil;
      ENDisconnectorNewObj.Free;
      ENDisconnectorNewObj := nil;
    end;
  finally
    ENDisconnectorChangeObj.Free;
    ENDisconnectorChangeObj := nil;
    ENDisconnectorChangeNewObj.Free;
    ENDisconnectorChangeNewObj := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actUninstallDisconnectorExecute(
  Sender: TObject);
Var TempENDisconnectorChange: ENDisconnectorChangeControllerSoapPort;
  TempENDisconnector: ENDisconnectorControllerSoapPort;
begin
  TempENDisconnector :=
    HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;
  try //��������� �������-������������� �������������
    ENDisconnectorOldObj := TempENDisconnector.getObject(
      StrToInt(sgENDisconnector.Cells[0, sgENDisconnector.Row]));
  except
    on EConvertError do Exit;
  end;
  //������ � �������� ������ ������������
  TempENDisconnectorChange :=
    HTTPRIOENDisconnectorChange as ENDisconnectorChangeControllerSoapPort;
  ENDisconnectorChangeObj := ENDisconnectorChange.Create;
  try
    if ENDisconnectorChangeObj.substation04Ref = nil then
      ENDisconnectorChangeObj.substation04Ref := ENSubstation04Ref.Create;
    ENDisconnectorChangeObj.substation04Ref.code := ENSubstation04Obj.code;

    frmENDisconnectorChangeEdit :=
      TfrmENDisconnectorChangeEdit.Create(Application, dsEdit);
    try
      frmENDisconnectorChangeEdit.btnOk.ModalResult := mrNo;
      frmENDisconnectorChangeEdit.btnOk.Action :=
        frmENDisconnectorChangeEdit.ActnLstChangeEquip.Actions[1];
      frmENDisconnectorChangeEdit.tsEquipInstall.TabVisible := False;
      frmENDisconnectorChangeEdit.tsEquipInstall.TabVisible := False;
      frmENDisconnectorChangeEdit.memName.Text := '������ �������������';

      if frmENDisconnectorChangeEdit.ShowModal = mrNo then
        begin
          TempENDisconnectorChange.UninstallDisconnector(
            ENDisconnectorOldObj, ENDisconnectorChangeObj);
          recalcDisconnectors();
          UpdateGrid(Sender);
        end;
    finally
      frmENDisconnectorChangeEdit.Free;
      frmENDisconnectorChangeEdit := nil;
      ENDisconnectorOldObj.Free;
      ENDisconnectorOldObj := nil;
    end;
  finally
    ENDisconnectorChangeObj.Free;
    ENDisconnectorChangeObj := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actInstallDisconnectorExecute(
  Sender: TObject);
Var TempENDisconnectorChange: ENDisconnectorChangeControllerSoapPort;
begin //������ � �������� ������ ������������
  TempENDisconnectorChange :=
    HTTPRIOENDisconnectorChange as ENDisconnectorChangeControllerSoapPort;
  ENDisconnectorChangeNewObj := ENDisconnectorChange.Create;

  if ENDisconnectorChangeNewObj.substation04Ref = nil then
    ENDisconnectorChangeNewObj.substation04Ref := ENSubstation04Ref.Create;
  ENDisconnectorChangeNewObj.substation04Ref.code := ENSubstation04Obj.code;
  if ENDisconnectorChangeNewObj.highVoltCellRef = nil then
    ENDisconnectorChangeNewObj.highVoltCellRef := ENHighVoltageSellRef.Create;
  ENDisconnectorChangeNewObj.highVoltCellRef.code :=
    StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);
  if sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row] <> '' then
    begin
      if ENDisconnectorChangeNewObj.transformerRef = nil then
        ENDisconnectorChangeNewObj.transformerRef := ENTransformerRef.Create;
      ENDisconnectorChangeNewObj.transformerRef.code :=
        StrToInt(sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row]);
    end;

  try
    frmENDisconnectorChangeEdit :=
      TfrmENDisconnectorChangeEdit.Create(Application, dsEdit);
    try
      frmENDisconnectorChangeEdit.btnOk.ModalResult := mrYes;
      frmENDisconnectorChangeEdit.btnOk.Action :=
        frmENDisconnectorChangeEdit.ActnLstChangeEquip.Actions[2];
      frmENDisconnectorChangeEdit.tsEquipUninstall.TabVisible := False;
      frmENDisconnectorChangeEdit.actChooseNewEquip.Enabled := True;
      frmENDisconnectorChangeEdit.memName.Text := '��������� �������������';

      if frmENDisconnectorChangeEdit.ShowModal = mrYes then
        begin
          TempENDisconnectorChange.InstallDisconnector(
            ENDisconnectorNewObj, ENDisconnectorChangeNewObj);
          recalcDisconnectors();
          UpdateGrid(Sender);
        end;
    finally
      frmENDisconnectorChangeEdit.Free;
      frmENDisconnectorChangeEdit := nil;
      ENDisconnectorNewObj.Free;
      ENDisconnectorNewObj := nil;
    end;
  finally
    ENDisconnectorChangeNewObj.Free;
    ENDisconnectorChangeNewObj := nil;
  end;
end;

(*������ ������������ ��������*)
procedure TfrmENSubstation04Edit.actChangeLoadSwitchExecute(Sender: TObject);
Var TempENLoadSwitchChange: ENLoadSwitchChangeControllerSoapPort;
  TempENLoadSwitch: ENLoadSwitchControllerSoapPort;
begin
  TempENLoadSwitch := HTTPRIOENLoadSwitch as ENLoadSwitchControllerSoapPort;
  try //��������� �������-������������� ����������� ��������
    ENLoadSwitchOldObj := TempENLoadSwitch.getObject(
      StrToInt(sgENLoadSwitch.Cells[0, sgENLoadSwitch.Row]));
  except
    on EConvertError do Exit;
  end;
  //������ � �������� ������ ������������
  TempENLoadSwitchChange :=
    HTTPRIOENLoadSwitchChange as ENLoadSwitchChangeControllerSoapPort;

  ENLoadSwitchChangeObj := ENLoadSwitchChange.Create;
  ENLoadSwitchChangeNewObj := ENLoadSwitchChange.Create;

  try
    if ENLoadSwitchChangeObj.substation04Ref = nil then
      ENLoadSwitchChangeObj.substation04Ref := ENSubstation04Ref.Create;
    ENLoadSwitchChangeObj.substation04Ref.code := ENSubstation04Obj.code;

    if ENLoadSwitchChangeNewObj.substation04Ref = nil then
      ENLoadSwitchChangeNewObj.substation04Ref := ENSubstation04Ref.Create;
    ENLoadSwitchChangeNewObj.substation04Ref.code := ENSubstation04Obj.code;
    if ENLoadSwitchChangeNewObj.highVoltCellRef = nil then
      ENLoadSwitchChangeNewObj.highVoltCellRef := ENHighVoltageSellRef.Create;
    ENLoadSwitchChangeNewObj.highVoltCellRef.code :=
      StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);
      //ENLoadSwitchOldObj.highvoltageSell.code;
    if sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row] <> '' then
      begin
        if ENLoadSwitchChangeNewObj.transformerRef = nil then
          ENLoadSwitchChangeNewObj.transformerRef := ENTransformerRef.Create;
        ENLoadSwitchChangeNewObj.transformerRef.code :=
          StrToInt(sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row]);
      end;

    frmENLoadSwitchChangeEdit :=
      TfrmENLoadSwitchChangeEdit.Create(Application, dsEdit);
    try
      frmENLoadSwitchChangeEdit.btnOk.ModalResult := mrNone;
      frmENLoadSwitchChangeEdit.btnOk.Action :=
        frmENLoadSwitchChangeEdit.ActnLstChangeEquip.Actions[0];
      frmENLoadSwitchChangeEdit.tsEquipInstall.TabVisible := False;
      frmENLoadSwitchChangeEdit.memName.Text := '������ ����������� ��������';
      if frmENLoadSwitchChangeEdit.ShowModal = mrOk then
        begin
          TempENLoadSwitchChange.changeLoadSwitch(
            ENLoadSwitchOldObj, ENLoadSwitchChangeObj,
            ENLoadSwitchNewObj, ENLoadSwitchChangeNewObj);
          recalcLoadSwitches();
          UpdateGrid(Sender);
        end;
    finally
      frmENLoadSwitchChangeEdit.Free;
      frmENLoadSwitchChangeEdit := nil;
      ENLoadSwitchOldObj.Free;
      ENLoadSwitchOldObj := nil;
      ENLoadSwitchNewObj.Free;
      ENLoadSwitchNewObj := nil;
    end;
  finally
    ENLoadSwitchChangeObj.Free;
    ENLoadSwitchChangeObj := nil;
    ENLoadSwitchChangeNewObj.Free;
    ENLoadSwitchChangeNewObj := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actUninstallLoadSwitchExecute(
  Sender: TObject);
Var TempENLoadSwitchChange: ENLoadSwitchChangeControllerSoapPort;
  TempENLoadSwitch: ENLoadSwitchControllerSoapPort;
begin
  TempENLoadSwitch :=
    HTTPRIOENLoadSwitch as ENLoadSwitchControllerSoapPort;
  try //��������� �������-������������� ����������� ��������
    ENLoadSwitchOldObj := TempENLoadSwitch.getObject(
      StrToInt(sgENLoadSwitch.Cells[0, sgENLoadSwitch.Row]));
  except
    on EConvertError do Exit;
  end;
  //������ � �������� ������ ������������
  TempENLoadSwitchChange :=
    HTTPRIOENLoadSwitchChange as ENLoadSwitchChangeControllerSoapPort;
  ENLoadSwitchChangeObj := ENLoadSwitchChange.Create;
  try
    if ENLoadSwitchChangeObj.substation04Ref = nil then
      ENLoadSwitchChangeObj.substation04Ref := ENSubstation04Ref.Create;
    ENLoadSwitchChangeObj.substation04Ref.code := ENSubstation04Obj.code;

    frmENLoadSwitchChangeEdit :=
      TfrmENLoadSwitchChangeEdit.Create(Application, dsEdit);
    try
      frmENLoadSwitchChangeEdit.btnOk.ModalResult := mrNo;
      frmENLoadSwitchChangeEdit.btnOk.Action :=
        frmENLoadSwitchChangeEdit.ActnLstChangeEquip.Actions[1];
      frmENLoadSwitchChangeEdit.tsEquipInstall.TabVisible := False;
      frmENLoadSwitchChangeEdit.tsEquipInstall.TabVisible := False;
      frmENLoadSwitchChangeEdit.memName.Text := '������ ����������� ��������';

      if frmENLoadSwitchChangeEdit.ShowModal = mrNo then
        begin
          TempENLoadSwitchChange.UninstallLoadSwitch(
            ENLoadSwitchOldObj, ENLoadSwitchChangeObj);
          recalcLoadSwitches();
          UpdateGrid(Sender);
        end;
    finally
      frmENLoadSwitchChangeEdit.Free;
      frmENLoadSwitchChangeEdit := nil;
      ENLoadSwitchOldObj.Free;
      ENLoadSwitchOldObj := nil;
    end;
  finally
    ENLoadSwitchChangeObj.Free;
    ENLoadSwitchChangeObj := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actInstallLoadSwitchExecute(
  Sender: TObject);
Var TempENLoadSwitchChange: ENLoadSwitchChangeControllerSoapPort;
begin //������ � �������� ������ ������������
  TempENLoadSwitchChange :=
    HTTPRIOENLoadSwitchChange as ENLoadSwitchChangeControllerSoapPort;
  ENLoadSwitchChangeNewObj := ENLoadSwitchChange.Create;

  if ENLoadSwitchChangeNewObj.substation04Ref = nil then
    ENLoadSwitchChangeNewObj.substation04Ref := ENSubstation04Ref.Create;
  ENLoadSwitchChangeNewObj.substation04Ref.code := ENSubstation04Obj.code;
  if ENLoadSwitchChangeNewObj.highVoltCellRef = nil then
    ENLoadSwitchChangeNewObj.highVoltCellRef := ENHighVoltageSellRef.Create;
  ENLoadSwitchChangeNewObj.highVoltCellRef.code :=
    StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);
  if sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row] <> '' then
    begin
      if ENLoadSwitchChangeNewObj.transformerRef = nil then
        ENLoadSwitchChangeNewObj.transformerRef := ENTransformerRef.Create;
      ENLoadSwitchChangeNewObj.transformerRef.code :=
        StrToInt(sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row]);
    end;

  try
    frmENLoadSwitchChangeEdit :=
      TfrmENLoadSwitchChangeEdit.Create(Application, dsEdit);
    try
      frmENLoadSwitchChangeEdit.btnOk.ModalResult := mrYes;
      frmENLoadSwitchChangeEdit.btnOk.Action :=
        frmENLoadSwitchChangeEdit.ActnLstChangeEquip.Actions[2];
      frmENLoadSwitchChangeEdit.tsEquipUninstall.TabVisible := False;
      frmENLoadSwitchChangeEdit.actChooseNewEquip.Enabled := True;
      frmENLoadSwitchChangeEdit.memName.Text := '��������� ����������� ��������';

      if frmENLoadSwitchChangeEdit.ShowModal = mrYes then
        begin
          TempENLoadSwitchChange.InstallLoadSwitch(
            ENLoadSwitchNewObj, ENLoadSwitchChangeNewObj);
          recalcLoadSwitches();
          UpdateGrid(Sender);
        end;
    finally
      frmENLoadSwitchChangeEdit.Free;
      frmENLoadSwitchChangeEdit := nil;
      ENLoadSwitchNewObj.Free;
      ENLoadSwitchNewObj := nil;
    end;
  finally
    ENLoadSwitchChangeNewObj.Free;
    ENLoadSwitchChangeNewObj := nil;
  end;
end;

(*������ ��������������� �������������� ������*)
procedure TfrmENSubstation04Edit.actChangeFuseExecute(Sender: TObject);
Var TempENFuseChange: ENFuseChangeControllerSoapPort;
  TempENFuse: ENFuseControllerSoapPort;
begin
  TempENFuse := HTTPRIOENFuse as ENFuseControllerSoapPort;
  try //��������� �������-������������� ��������������
    ENFuseOldObj := TempENFuse.getObject(
      StrToInt(sgENFuse.Cells[0, sgENFuse.Row]));
  except
    on EConvertError do Exit;
  end;
  //������ � �������� ������ ������������
  TempENFuseChange :=
    HTTPRIOENFuseChange as ENFuseChangeControllerSoapPort;

  ENFuseChangeObj := ENFuseChange.Create;
  ENFuseChangeNewObj := ENFuseChange.Create;

  try
    if ENFuseChangeObj.substation04Ref = nil then
      ENFuseChangeObj.substation04Ref := ENSubstation04Ref.Create;
    ENFuseChangeObj.substation04Ref.code := ENSubstation04Obj.code;

    if ENFuseChangeNewObj.substation04Ref = nil then
      ENFuseChangeNewObj.substation04Ref := ENSubstation04Ref.Create;
    ENFuseChangeNewObj.substation04Ref.code := ENSubstation04Obj.code;
    if ENFuseChangeNewObj.highVoltCellRef = nil then
      ENFuseChangeNewObj.highVoltCellRef := ENHighVoltageSellRef.Create;
    ENFuseChangeNewObj.highVoltCellRef.code :=
      StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);
      //ENFuseOldObj.highvoltageSell.code;
    if sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row] <> '' then
      begin
        if ENFuseChangeNewObj.transformerRef = nil then
          ENFuseChangeNewObj.transformerRef := ENTransformerRef.Create;
        ENFuseChangeNewObj.transformerRef.code :=
          StrToInt(sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row]);
      end;

    frmENFuseChangeEdit :=
      TfrmENFuseChangeEdit.Create(Application, dsEdit);
    try
      frmENFuseChangeEdit.btnOk.ModalResult := mrNone;
      frmENFuseChangeEdit.btnOk.Action :=
        frmENFuseChangeEdit.ActnLstChangeEquip.Actions[0];
      frmENFuseChangeEdit.tsEquipInstall.TabVisible := False;
      frmENFuseChangeEdit.memName.Text := '������ ��������������';
      if frmENFuseChangeEdit.ShowModal = mrOk then
        begin
          TempENFuseChange.changeFuse(
            ENFuseOldObj, ENFuseChangeObj,
            ENFuseNewObj, ENFuseChangeNewObj);
          recalcFuses();
          UpdateGrid(Sender);
        end;
    finally
      frmENFuseChangeEdit.Free;
      frmENFuseChangeEdit := nil;
      ENFuseOldObj.Free;
      ENFuseOldObj := nil;
      ENFuseNewObj.Free;
      ENFuseNewObj := nil;
    end;
  finally
    ENFuseChangeObj.Free;
    ENFuseChangeObj := nil;
    ENFuseChangeNewObj.Free;
    ENFuseChangeNewObj := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actUninstallFuseExecute(
  Sender: TObject);
Var TempENFuseChange: ENFuseChangeControllerSoapPort;
  TempENFuse: ENFuseControllerSoapPort;
begin
  TempENFuse :=
    HTTPRIOENFuse as ENFuseControllerSoapPort;
  try //��������� �������-������������� ��������������
    ENFuseOldObj := TempENFuse.getObject(
      StrToInt(sgENFuse.Cells[0, sgENFuse.Row]));
  except
    on EConvertError do Exit;
  end;
  //������ � �������� ������ ������������
  TempENFuseChange :=
    HTTPRIOENFuseChange as ENFuseChangeControllerSoapPort;
  ENFuseChangeObj := ENFuseChange.Create;
  try
    if ENFuseChangeObj.substation04Ref = nil then
      ENFuseChangeObj.substation04Ref := ENSubstation04Ref.Create;
    ENFuseChangeObj.substation04Ref.code := ENSubstation04Obj.code;

    frmENFuseChangeEdit :=
      TfrmENFuseChangeEdit.Create(Application, dsEdit);
    try
      frmENFuseChangeEdit.btnOk.ModalResult := mrNo;
      frmENFuseChangeEdit.btnOk.Action :=
        frmENFuseChangeEdit.ActnLstChangeEquip.Actions[1];
      frmENFuseChangeEdit.tsEquipInstall.TabVisible := False;
      frmENFuseChangeEdit.tsEquipInstall.TabVisible := False;
      frmENFuseChangeEdit.memName.Text := '������ ��������������';

      if frmENFuseChangeEdit.ShowModal = mrNo then
        begin
          TempENFuseChange.UninstallFuse(
            ENFuseOldObj, ENFuseChangeObj);
          recalcFuses();
          UpdateGrid(Sender);
        end;
    finally
      frmENFuseChangeEdit.Free;
      frmENFuseChangeEdit := nil;
      ENFuseOldObj.Free;
      ENFuseOldObj := nil;
    end;
  finally
    ENFuseChangeObj.Free;
    ENFuseChangeObj := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actInstallFuseExecute(
  Sender: TObject);
Var TempENFuseChange: ENFuseChangeControllerSoapPort;
begin //������ � �������� ������ ������������
  TempENFuseChange :=
    HTTPRIOENFuseChange as ENFuseChangeControllerSoapPort;
  ENFuseChangeNewObj := ENFuseChange.Create;

  if ENFuseChangeNewObj.substation04Ref = nil then
    ENFuseChangeNewObj.substation04Ref := ENSubstation04Ref.Create;
  ENFuseChangeNewObj.substation04Ref.code := ENSubstation04Obj.code;
  if ENFuseChangeNewObj.highVoltCellRef = nil then
    ENFuseChangeNewObj.highVoltCellRef := ENHighVoltageSellRef.Create;
  ENFuseChangeNewObj.highVoltCellRef.code :=
    StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);
  if sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row] <> '' then
    begin
      if ENFuseChangeNewObj.transformerRef = nil then
        ENFuseChangeNewObj.transformerRef := ENTransformerRef.Create;
      ENFuseChangeNewObj.transformerRef.code :=
        StrToInt(sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row]);
    end;

  try
    frmENFuseChangeEdit :=
      TfrmENFuseChangeEdit.Create(Application, dsEdit);
    try
      frmENFuseChangeEdit.btnOk.ModalResult := mrYes;
      frmENFuseChangeEdit.btnOk.Action :=
        frmENFuseChangeEdit.ActnLstChangeEquip.Actions[2];
      frmENFuseChangeEdit.tsEquipUninstall.TabVisible := False;
      frmENFuseChangeEdit.actChooseNewEquip.Enabled := True;
      frmENFuseChangeEdit.memName.Text := '��������� ��������������';

      if frmENFuseChangeEdit.ShowModal = mrYes then
        begin
          TempENFuseChange.InstallFuse(
            ENFuseNewObj, ENFuseChangeNewObj);
          recalcFuses();
          UpdateGrid(Sender);
        end;
    finally
      frmENFuseChangeEdit.Free;
      frmENFuseChangeEdit := nil;
      ENFuseNewObj.Free;
      ENFuseNewObj := nil;
    end;
  finally
    ENFuseChangeNewObj.Free;
    ENFuseChangeNewObj := nil;
  end;
end;

(*������ ����������*)
procedure TfrmENSubstation04Edit.actChangeInsulatorExecute(Sender: TObject);
Var TempENInsulatorChange: ENInsulatorChangeControllerSoapPort;
  TempENInsulator: ENInsulatorControllerSoapPort;
begin
  TempENInsulator := HTTPRIOENInsulator as ENInsulatorControllerSoapPort;
  try //��������� �������-������������� ���������
    ENInsulatorOldObj := TempENInsulator.getObject(
      StrToInt(sgENInsulator.Cells[0, sgENInsulator.Row]));
  except
    on EConvertError do Exit;
  end;
  //������ � �������� ������ ������������
  TempENInsulatorChange :=
    HTTPRIOENInsulatorChange as ENInsulatorChangeControllerSoapPort;

  ENInsulatorChangeObj := ENInsulatorChange.Create;
  ENInsulatorChangeNewObj := ENInsulatorChange.Create;

  try
    if ENInsulatorChangeObj.substation04Ref = nil then
      ENInsulatorChangeObj.substation04Ref := ENSubstation04Ref.Create;
    ENInsulatorChangeObj.substation04Ref.code := ENSubstation04Obj.code;

    if ENInsulatorChangeNewObj.substation04Ref = nil then
      ENInsulatorChangeNewObj.substation04Ref := ENSubstation04Ref.Create;
    ENInsulatorChangeNewObj.substation04Ref.code := ENSubstation04Obj.code;
    if ENInsulatorChangeNewObj.highVoltCellRef = nil then
      ENInsulatorChangeNewObj.highVoltCellRef := ENHighVoltageSellRef.Create;
    ENInsulatorChangeNewObj.highVoltCellRef.code :=
      StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);
      //ENInsulatorOldObj.highvoltageSell.code;
    if sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row] <> '' then
      begin
        if ENInsulatorChangeNewObj.transformerRef = nil then
          ENInsulatorChangeNewObj.transformerRef := ENTransformerRef.Create;
        ENInsulatorChangeNewObj.transformerRef.code :=
          StrToInt(sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row]);
      end;

    frmENInsulatorChangeEdit :=
      TfrmENInsulatorChangeEdit.Create(Application, dsEdit);
    try
      frmENInsulatorChangeEdit.btnOk.ModalResult := mrNone;
      frmENInsulatorChangeEdit.btnOk.Action :=
        frmENInsulatorChangeEdit.ActnLstChangeEquip.Actions[0];
      frmENInsulatorChangeEdit.tsEquipInstall.TabVisible := False;
      frmENInsulatorChangeEdit.memName.Text := '������ ���������';
      if frmENInsulatorChangeEdit.ShowModal = mrOk then
        begin
          TempENInsulatorChange.changeInsulator(
            ENInsulatorOldObj, ENInsulatorChangeObj,
            ENInsulatorNewObj, ENInsulatorChangeNewObj);
          recalcInsulators();
          UpdateGrid(Sender);
        end;
    finally
      frmENInsulatorChangeEdit.Free;
      frmENInsulatorChangeEdit := nil;
      ENInsulatorOldObj.Free;
      ENInsulatorOldObj := nil;
      ENInsulatorNewObj.Free;
      ENInsulatorNewObj := nil;
    end;
  finally
    ENInsulatorChangeObj.Free;
    ENInsulatorChangeObj := nil;
    ENInsulatorChangeNewObj.Free;
    ENInsulatorChangeNewObj := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actUninstallInsulatorExecute(
  Sender: TObject);
Var TempENInsulatorChange: ENInsulatorChangeControllerSoapPort;
  TempENInsulator: ENInsulatorControllerSoapPort;
begin
  TempENInsulator :=
    HTTPRIOENInsulator as ENInsulatorControllerSoapPort;
  try //��������� �������-������������� ���������
    ENInsulatorOldObj := TempENInsulator.getObject(
      StrToInt(sgENInsulator.Cells[0, sgENInsulator.Row]));
  except
    on EConvertError do Exit;
  end;
  //������ � �������� ������ ������������
  TempENInsulatorChange :=
    HTTPRIOENInsulatorChange as ENInsulatorChangeControllerSoapPort;
  ENInsulatorChangeObj := ENInsulatorChange.Create;
  try
    if ENInsulatorChangeObj.substation04Ref = nil then
      ENInsulatorChangeObj.substation04Ref := ENSubstation04Ref.Create;
    ENInsulatorChangeObj.substation04Ref.code := ENSubstation04Obj.code;
    
    frmENInsulatorChangeEdit :=
      TfrmENInsulatorChangeEdit.Create(Application, dsEdit);
    try
      frmENInsulatorChangeEdit.btnOk.ModalResult := mrNo;
      frmENInsulatorChangeEdit.btnOk.Action :=
        frmENInsulatorChangeEdit.ActnLstChangeEquip.Actions[1];
      frmENInsulatorChangeEdit.tsEquipInstall.TabVisible := False;
      frmENInsulatorChangeEdit.tsEquipInstall.TabVisible := False;
      frmENInsulatorChangeEdit.memName.Text := '������ ���������';

      if frmENInsulatorChangeEdit.ShowModal = mrNo then
        begin
          TempENInsulatorChange.UninstallInsulator(
            ENInsulatorOldObj, ENInsulatorChangeObj);
          recalcInsulators();
          UpdateGrid(Sender);
        end;
    finally
      frmENInsulatorChangeEdit.Free;
      frmENInsulatorChangeEdit := nil;
      ENInsulatorOldObj.Free;
      ENInsulatorOldObj := nil;
    end;
  finally
    ENInsulatorChangeObj.Free;
    ENInsulatorChangeObj := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actInstallInsulatorExecute(
  Sender: TObject);
Var TempENInsulatorChange: ENInsulatorChangeControllerSoapPort;
begin //������ � �������� ������ ������������
  TempENInsulatorChange :=
    HTTPRIOENInsulatorChange as ENInsulatorChangeControllerSoapPort;
  ENInsulatorChangeNewObj := ENInsulatorChange.Create;

  if ENInsulatorChangeNewObj.substation04Ref = nil then
    ENInsulatorChangeNewObj.substation04Ref := ENSubstation04Ref.Create;
  ENInsulatorChangeNewObj.substation04Ref.code := ENSubstation04Obj.code;
  if ENInsulatorChangeNewObj.highVoltCellRef = nil then
    ENInsulatorChangeNewObj.highVoltCellRef := ENHighVoltageSellRef.Create;
  ENInsulatorChangeNewObj.highVoltCellRef.code :=
    StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);
  if sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row] <> '' then
    begin
      if ENInsulatorChangeNewObj.transformerRef = nil then
        ENInsulatorChangeNewObj.transformerRef := ENTransformerRef.Create;
      ENInsulatorChangeNewObj.transformerRef.code :=
        StrToInt(sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row]);
    end;

  try
    frmENInsulatorChangeEdit :=
      TfrmENInsulatorChangeEdit.Create(Application, dsEdit);
    try
      frmENInsulatorChangeEdit.btnOk.ModalResult := mrYes;
      frmENInsulatorChangeEdit.btnOk.Action :=
        frmENInsulatorChangeEdit.ActnLstChangeEquip.Actions[2];
      frmENInsulatorChangeEdit.tsEquipUninstall.TabVisible := False;
      frmENInsulatorChangeEdit.actChooseNewEquip.Enabled := True;
      frmENInsulatorChangeEdit.memName.Text := '��������� ���������';

      if frmENInsulatorChangeEdit.ShowModal = mrYes then
        begin
          TempENInsulatorChange.InstallInsulator(
            ENInsulatorNewObj, ENInsulatorChangeNewObj);
          recalcInsulators();
          UpdateGrid(Sender);
        end;
    finally
      frmENInsulatorChangeEdit.Free;
      frmENInsulatorChangeEdit := nil;
      ENInsulatorNewObj.Free;
      ENInsulatorNewObj := nil;
    end;
  finally
    ENInsulatorChangeNewObj.Free;
    ENInsulatorChangeNewObj := nil;
  end;
end;

(*������ �����������*)
procedure TfrmENSubstation04Edit.actAddAttachmentExecute(Sender: TObject);
begin
  ENDocAttachmentObj := ENDocAttachment.Create;
  try
    frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
    frmDFDocAttachmentEdit.elementCode := ENSubstation04Obj.element.code;
    frmDFDocAttachmentEdit.HideControls([frmDFDocAttachmentEdit.lblENDocAttachmentTypeTypeRefName,
                                         frmDFDocAttachmentEdit.edtENDocAttachmentTypeTypeRefName,
                                         frmDFDocAttachmentEdit.spbENDocAttachmentTypeTypeRef]);
    try
      if frmDFDocAttachmentEdit.ShowModal = mrOk then
      begin
        if ENDocAttachmentObj <> nil then
          updateAttachments;
      end;
    finally
      frmDFDocAttachmentEdit.Free;
      frmDFDocAttachmentEdit := nil;
    end;
  finally
    ENDocAttachmentObj.Free;
    ENDocAttachmentObj := nil;
  end;

end;

procedure TfrmENSubstation04Edit.actChangeArresterExecute(Sender: TObject);
Var TempENArresterChange: ENArresterChangeControllerSoapPort;
  TempENArrester: ENArresterControllerSoapPort;
begin
  TempENArrester := HTTPRIOENArrester as ENArresterControllerSoapPort;
  try //��������� �������-������������� ����������
    ENArresterOldObj := TempENArrester.getObject(
      StrToInt(sgENArrester.Cells[0, sgENArrester.Row]));
  except
    on EConvertError do Exit;
  end;
  //������ � �������� ������ ������������
  TempENArresterChange :=
    HTTPRIOENArresterChange as ENArresterChangeControllerSoapPort;

  ENArresterChangeObj := ENArresterChange.Create;
  ENArresterChangeNewObj := ENArresterChange.Create;

  try
    if ENArresterChangeObj.substation04Ref = nil then
      ENArresterChangeObj.substation04Ref := ENSubstation04Ref.Create;
    ENArresterChangeObj.substation04Ref.code := ENSubstation04Obj.code;

    if ENArresterChangeNewObj.substation04Ref = nil then
      ENArresterChangeNewObj.substation04Ref := ENSubstation04Ref.Create;
    ENArresterChangeNewObj.substation04Ref.code := ENSubstation04Obj.code;
    if ENArresterChangeNewObj.highVoltCellRef = nil then
      ENArresterChangeNewObj.highVoltCellRef := ENHighVoltageSellRef.Create;
    ENArresterChangeNewObj.highVoltCellRef.code :=
      StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);
      //ENArresterOldObj.highvoltageSell.code;
    if sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row] <> '' then
      begin
        if ENArresterChangeNewObj.transformerRef = nil then
          ENArresterChangeNewObj.transformerRef := ENTransformerRef.Create;
        ENArresterChangeNewObj.transformerRef.code :=
          StrToInt(sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row]);
      end;

    frmENArresterChangeEdit :=
      TfrmENArresterChangeEdit.Create(Application, dsEdit);
    try
      frmENArresterChangeEdit.btnOk.ModalResult := mrNone;
      frmENArresterChangeEdit.btnOk.Action :=
        frmENArresterChangeEdit.ActnLstChangeEquip.Actions[0];
      frmENArresterChangeEdit.tsEquipInstall.TabVisible := False;
      frmENArresterChangeEdit.memName.Text := '������ ����������';
      if frmENArresterChangeEdit.ShowModal = mrOk then
        begin
          TempENArresterChange.changeArrester(
            ENArresterOldObj, ENArresterChangeObj,
            ENArresterNewObj, ENArresterChangeNewObj);
          recalcArresters();
          UpdateGrid(Sender);
        end;
    finally
      frmENArresterChangeEdit.Free;
      frmENArresterChangeEdit := nil;
      ENArresterOldObj.Free;
      ENArresterOldObj := nil;
      ENArresterNewObj.Free;
      ENArresterNewObj := nil;
    end;
  finally
    ENArresterChangeObj.Free;
    ENArresterChangeObj := nil;
    ENArresterChangeNewObj.Free;
    ENArresterChangeNewObj := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actUninstallArresterExecute(
  Sender: TObject);
Var TempENArresterChange: ENArresterChangeControllerSoapPort;
  TempENArrester: ENArresterControllerSoapPort;
begin
  TempENArrester :=
    HTTPRIOENArrester as ENArresterControllerSoapPort;
  try //��������� �������-������������� ����������
    ENArresterOldObj := TempENArrester.getObject(
      StrToInt(sgENArrester.Cells[0, sgENArrester.Row]));
  except
    on EConvertError do Exit;
  end;
  //������ � �������� ������ ������������
  TempENArresterChange :=
    HTTPRIOENArresterChange as ENArresterChangeControllerSoapPort;
  ENArresterChangeObj := ENArresterChange.Create;
  try
    if ENArresterChangeObj.substation04Ref = nil then
      ENArresterChangeObj.substation04Ref := ENSubstation04Ref.Create;
    ENArresterChangeObj.substation04Ref.code := ENSubstation04Obj.code;

    frmENArresterChangeEdit :=
      TfrmENArresterChangeEdit.Create(Application, dsEdit);
    try
      frmENArresterChangeEdit.btnOk.ModalResult := mrNo;
      frmENArresterChangeEdit.btnOk.Action :=
        frmENArresterChangeEdit.ActnLstChangeEquip.Actions[1];
      frmENArresterChangeEdit.tsEquipInstall.TabVisible := False;
      frmENArresterChangeEdit.tsEquipInstall.TabVisible := False;
      frmENArresterChangeEdit.memName.Text := '������ ����������';

      if frmENArresterChangeEdit.ShowModal = mrNo then
        begin
          TempENArresterChange.UninstallArrester(
            ENArresterOldObj, ENArresterChangeObj);
          recalcArresters();
          UpdateGrid(Sender);
        end;
    finally
      frmENArresterChangeEdit.Free;
      frmENArresterChangeEdit := nil;
      ENArresterOldObj.Free;
      ENArresterOldObj := nil;
    end;
  finally
    ENArresterChangeObj.Free;
    ENArresterChangeObj := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actInstallArresterExecute(
  Sender: TObject);
Var TempENArresterChange: ENArresterChangeControllerSoapPort;
begin //������ � �������� ������ ������������
  TempENArresterChange :=
    HTTPRIOENArresterChange as ENArresterChangeControllerSoapPort;
  ENArresterChangeNewObj := ENArresterChange.Create;

  if ENArresterChangeNewObj.substation04Ref = nil then
    ENArresterChangeNewObj.substation04Ref := ENSubstation04Ref.Create;
  ENArresterChangeNewObj.substation04Ref.code := ENSubstation04Obj.code;
  if ENArresterChangeNewObj.highVoltCellRef = nil then
    ENArresterChangeNewObj.highVoltCellRef := ENHighVoltageSellRef.Create;
  ENArresterChangeNewObj.highVoltCellRef.code :=
    StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);
  if sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row] <> '' then
    begin
      if ENArresterChangeNewObj.transformerRef = nil then
        ENArresterChangeNewObj.transformerRef := ENTransformerRef.Create;
      ENArresterChangeNewObj.transformerRef.code :=
        StrToInt(sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row]);
    end;

  try
    frmENArresterChangeEdit :=
      TfrmENArresterChangeEdit.Create(Application, dsEdit);
    try
      frmENArresterChangeEdit.btnOk.ModalResult := mrYes;
      frmENArresterChangeEdit.btnOk.Action :=
        frmENArresterChangeEdit.ActnLstChangeEquip.Actions[2];
      frmENArresterChangeEdit.tsEquipUninstall.TabVisible := False;
      frmENArresterChangeEdit.actChooseNewEquip.Enabled := True;
      frmENArresterChangeEdit.memName.Text := '��������� ����������';

      if frmENArresterChangeEdit.ShowModal = mrYes then
        begin
          TempENArresterChange.InstallArrester(
            ENArresterNewObj, ENArresterChangeNewObj);
          recalcArresters();
          UpdateGrid(Sender);
        end;
    finally
      frmENArresterChangeEdit.Free;
      frmENArresterChangeEdit := nil;
      ENArresterNewObj.Free;
      ENArresterNewObj := nil;
    end;
  finally
    ENArresterChangeNewObj.Free;
    ENArresterChangeNewObj := nil;
  end;
end;

(*������ ��������������� ����*)
procedure TfrmENSubstation04Edit.actChangeCurrentTransformerExecute(Sender: TObject);
Var TempENCurTransformerChange: ENCurTransformerChangeControllerSoapPort;
  TempENCurrentTransformer: ENCurrentTransformerControllerSoapPort;
begin
  TempENCurrentTransformer := HTTPRIOENCurrentTransformer as ENCurrentTransformerControllerSoapPort;
  try //��������� �������-������������� �������������� ����
    ENCurrentTransformerOldObj := TempENCurrentTransformer.getObject(
      StrToInt(sgENCurrentTransformer.Cells[0, sgENCurrentTransformer.Row]));
  except
    on EConvertError do Exit;
  end;
  //������ � �������� ������ ������������
  TempENCurTransformerChange :=
    HTTPRIOENCurTransformerChange as ENCurTransformerChangeControllerSoapPort;

  ENCurTransformerChangeObj := ENCurTransformerChange.Create;
  ENCurTransformerChangeNewObj := ENCurTransformerChange.Create;

  try
    if ENCurTransformerChangeObj.substation04Ref = nil then
      ENCurTransformerChangeObj.substation04Ref := ENSubstation04Ref.Create;
    ENCurTransformerChangeObj.substation04Ref.code := ENSubstation04Obj.code;

    if ENCurTransformerChangeNewObj.substation04Ref = nil then
      ENCurTransformerChangeNewObj.substation04Ref := ENSubstation04Ref.Create;
    ENCurTransformerChangeNewObj.substation04Ref.code := ENSubstation04Obj.code;
    if ENCurTransformerChangeNewObj.highVoltCellRef = nil then
      ENCurTransformerChangeNewObj.highVoltCellRef := ENHighVoltageSellRef.Create;
    ENCurTransformerChangeNewObj.highVoltCellRef.code :=
      StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);
      //ENCurrentTransformerOldObj.highvoltageSell.code;
    if sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row] <> '' then
      begin
        if ENCurTransformerChangeNewObj.transformerRef = nil then
          ENCurTransformerChangeNewObj.transformerRef := ENTransformerRef.Create;
        ENCurTransformerChangeNewObj.transformerRef.code :=
          StrToInt(sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row]);
      end;

    frmENCurTransformerChangeEdit :=
      TfrmENCurTransformerChangeEdit.Create(Application, dsEdit);
    try
      frmENCurTransformerChangeEdit.btnOk.ModalResult := mrNone;
      frmENCurTransformerChangeEdit.btnOk.Action :=
        frmENCurTransformerChangeEdit.ActnLstChangeEquip.Actions[0];
      frmENCurTransformerChangeEdit.tsEquipInstall.TabVisible := False;
      frmENCurTransformerChangeEdit.memName.Text := '������ �������������� ����';
      if frmENCurTransformerChangeEdit.ShowModal = mrOk then
        begin
          TempENCurTransformerChange.changeCurrentTransformer(
            ENCurrentTransformerOldObj, ENCurTransformerChangeObj,
            ENCurrentTransformerNewObj, ENCurTransformerChangeNewObj);
          recalcCurrentTransformers();
          UpdateGrid(Sender);
        end;
    finally
      frmENCurTransformerChangeEdit.Free;
      frmENCurTransformerChangeEdit := nil;
      ENCurrentTransformerOldObj.Free;
      ENCurrentTransformerOldObj := nil;
      ENCurrentTransformerNewObj.Free;
      ENCurrentTransformerNewObj := nil;
    end;
  finally
    ENCurTransformerChangeObj.Free;
    ENCurTransformerChangeObj := nil;
    ENCurTransformerChangeNewObj.Free;
    ENCurTransformerChangeNewObj := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actUninstallCurrentTransformerExecute(
  Sender: TObject);
Var TempENCurTransformerChange: ENCurTransformerChangeControllerSoapPort;
  TempENCurrentTransformer: ENCurrentTransformerControllerSoapPort;
begin
  TempENCurrentTransformer :=
    HTTPRIOENCurrentTransformer as ENCurrentTransformerControllerSoapPort;
  try //��������� �������-������������� �������������� ����
    ENCurrentTransformerOldObj := TempENCurrentTransformer.getObject(
      StrToInt(sgENCurrentTransformer.Cells[0, sgENCurrentTransformer.Row]));
  except
    on EConvertError do Exit;
  end;
  //������ � �������� ������ ������������
  TempENCurTransformerChange :=
    HTTPRIOENCurTransformerChange as ENCurTransformerChangeControllerSoapPort;
  ENCurTransformerChangeObj := ENCurTransformerChange.Create;
  try
    if ENCurTransformerChangeObj.substation04Ref = nil then
      ENCurTransformerChangeObj.substation04Ref := ENSubstation04Ref.Create;
    ENCurTransformerChangeObj.substation04Ref.code := ENSubstation04Obj.code;
    
    frmENCurTransformerChangeEdit :=
      TfrmENCurTransformerChangeEdit.Create(Application, dsEdit);
    try
      frmENCurTransformerChangeEdit.btnOk.ModalResult := mrNo;
      frmENCurTransformerChangeEdit.btnOk.Action :=
        frmENCurTransformerChangeEdit.ActnLstChangeEquip.Actions[1];
      frmENCurTransformerChangeEdit.tsEquipInstall.TabVisible := False;
      frmENCurTransformerChangeEdit.tsEquipInstall.TabVisible := False;
      frmENCurTransformerChangeEdit.memName.Text := '������ �������������� ����';

      if frmENCurTransformerChangeEdit.ShowModal = mrNo then
        begin
          TempENCurTransformerChange.UninstallCurrentTransformer(
            ENCurrentTransformerOldObj, ENCurTransformerChangeObj);
          recalcCurrentTransformers();
          UpdateGrid(Sender);
        end;
    finally
      frmENCurTransformerChangeEdit.Free;
      frmENCurTransformerChangeEdit := nil;
      ENCurrentTransformerOldObj.Free;
      ENCurrentTransformerOldObj := nil;
    end;
  finally
    ENCurTransformerChangeObj.Free;
    ENCurTransformerChangeObj := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actInstallCurrentTransformerExecute(
  Sender: TObject);
Var TempENCurTransformerChange: ENCurTransformerChangeControllerSoapPort;
begin //������ � �������� ������ ������������
  TempENCurTransformerChange :=
    HTTPRIOENCurTransformerChange as ENCurTransformerChangeControllerSoapPort;
  ENCurTransformerChangeNewObj := ENCurTransformerChange.Create;

  if ENCurTransformerChangeNewObj.substation04Ref = nil then
    ENCurTransformerChangeNewObj.substation04Ref := ENSubstation04Ref.Create;
  ENCurTransformerChangeNewObj.substation04Ref.code := ENSubstation04Obj.code;
  if ENCurTransformerChangeNewObj.highVoltCellRef = nil then
    ENCurTransformerChangeNewObj.highVoltCellRef := ENHighVoltageSellRef.Create;
  ENCurTransformerChangeNewObj.highVoltCellRef.code :=
    StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);
  if sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row] <> '' then
    begin
      if ENCurTransformerChangeNewObj.transformerRef = nil then
        ENCurTransformerChangeNewObj.transformerRef := ENTransformerRef.Create;
      ENCurTransformerChangeNewObj.transformerRef.code :=
        StrToInt(sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row]);
    end;

  try
    frmENCurTransformerChangeEdit :=
      TfrmENCurTransformerChangeEdit.Create(Application, dsEdit);
    try
      frmENCurTransformerChangeEdit.btnOk.ModalResult := mrYes;
      frmENCurTransformerChangeEdit.btnOk.Action :=
        frmENCurTransformerChangeEdit.ActnLstChangeEquip.Actions[2];
      frmENCurTransformerChangeEdit.tsEquipUninstall.TabVisible := False;
      frmENCurTransformerChangeEdit.actChooseNewEquip.Enabled := True;
      frmENCurTransformerChangeEdit.memName.Text := '��������� �������������� ����';

      if frmENCurTransformerChangeEdit.ShowModal = mrYes then
        begin
          TempENCurTransformerChange.InstallCurrentTransformer(
            ENCurrentTransformerNewObj, ENCurTransformerChangeNewObj);
          recalcCurrentTransformers();
          UpdateGrid(Sender);
        end;
    finally
      frmENCurTransformerChangeEdit.Free;
      frmENCurTransformerChangeEdit := nil;
      ENCurrentTransformerNewObj.Free;
      ENCurrentTransformerNewObj := nil;
    end;
  finally
    ENCurTransformerChangeNewObj.Free;
    ENCurTransformerChangeNewObj := nil;
  end;
end;

(*������ ������������� ���*)
procedure TfrmENSubstation04Edit.actChangeBusExecute(Sender: TObject);
Var TempENBusChange: ENBusChangeControllerSoapPort;
  TempENBus: ENBusControllerSoapPort;
begin
  TempENBus := HTTPRIOENBus as ENBusControllerSoapPort;
  try //��������� �������-������������ ������������� ����
    ENBusOldObj := TempENBus.getObject(
      StrToInt(sgENBus.Cells[0, sgENBus.Row]));
  except
    on EConvertError do Exit;
  end;
  //������ � �������� ������ ������������
  TempENBusChange :=
    HTTPRIOENBusChange as ENBusChangeControllerSoapPort;

  ENBusChangeObj := ENBusChange.Create;
  ENBusChangeNewObj := ENBusChange.Create;

  try
    if ENBusChangeObj.substation04Ref = nil then
      ENBusChangeObj.substation04Ref := ENSubstation04Ref.Create;
    ENBusChangeObj.substation04Ref.code := ENSubstation04Obj.code;

    if ENBusChangeNewObj.substation04Ref = nil then
      ENBusChangeNewObj.substation04Ref := ENSubstation04Ref.Create;
    ENBusChangeNewObj.substation04Ref.code := ENSubstation04Obj.code;
    if ENBusChangeNewObj.highVoltCellRef = nil then
      ENBusChangeNewObj.highVoltCellRef := ENHighVoltageSellRef.Create;
    ENBusChangeNewObj.highVoltCellRef.code :=
      StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);
      //ENBusOldObj.highvoltageSell.code;
    if sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row] <> '' then
      begin
        if ENBusChangeNewObj.transformerRef = nil then
          ENBusChangeNewObj.transformerRef := ENTransformerRef.Create;
        ENBusChangeNewObj.transformerRef.code :=
          StrToInt(sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row]);
      end;

    frmENBusChangeEdit :=
      TfrmENBusChangeEdit.Create(Application, dsEdit);
    try
      frmENBusChangeEdit.btnOk.ModalResult := mrNone;
      frmENBusChangeEdit.btnOk.Action :=
        frmENBusChangeEdit.ActnLstChangeEquip.Actions[0];
      frmENBusChangeEdit.tsEquipInstall.TabVisible := False;
      frmENBusChangeEdit.memName.Text := '������ ������������� ����';
      if frmENBusChangeEdit.ShowModal = mrOk then
        begin
          TempENBusChange.changeBus(
            ENBusOldObj, ENBusChangeObj,
            ENBusNewObj, ENBusChangeNewObj);
          recalcBuses();
          UpdateGrid(Sender);
        end;
    finally
      frmENBusChangeEdit.Free;
      frmENBusChangeEdit := nil;
      ENBusOldObj.Free;
      ENBusOldObj := nil;
      ENBusNewObj.Free;
      ENBusNewObj := nil;
    end;
  finally
    ENBusChangeObj.Free;
    ENBusChangeObj := nil;
    ENBusChangeNewObj.Free;
    ENBusChangeNewObj := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actUninstallBusExecute(
  Sender: TObject);
Var TempENBusChange: ENBusChangeControllerSoapPort;
  TempENBus: ENBusControllerSoapPort;
begin
  TempENBus :=
    HTTPRIOENBus as ENBusControllerSoapPort;
  try //��������� �������-������������ ������������� ����
    ENBusOldObj := TempENBus.getObject(
      StrToInt(sgENBus.Cells[0, sgENBus.Row]));
  except
    on EConvertError do Exit;
  end;
  //������ � �������� ������ ������������
  TempENBusChange :=
    HTTPRIOENBusChange as ENBusChangeControllerSoapPort;
  ENBusChangeObj := ENBusChange.Create;
  try
    if ENBusChangeObj.substation04Ref = nil then
      ENBusChangeObj.substation04Ref := ENSubstation04Ref.Create;
    ENBusChangeObj.substation04Ref.code := ENSubstation04Obj.code;
    
    frmENBusChangeEdit :=
      TfrmENBusChangeEdit.Create(Application, dsEdit);
    try
      frmENBusChangeEdit.btnOk.ModalResult := mrNo;
      frmENBusChangeEdit.btnOk.Action :=
        frmENBusChangeEdit.ActnLstChangeEquip.Actions[1];
      frmENBusChangeEdit.tsEquipInstall.TabVisible := False;
      frmENBusChangeEdit.tsEquipInstall.TabVisible := False;
      frmENBusChangeEdit.memName.Text := '������ ������������� ����';

      if frmENBusChangeEdit.ShowModal = mrNo then
        begin
          TempENBusChange.UninstallBus(
            ENBusOldObj, ENBusChangeObj);
          recalcBuses();
          UpdateGrid(Sender);
        end;
    finally
      frmENBusChangeEdit.Free;
      frmENBusChangeEdit := nil;
      ENBusOldObj.Free;
      ENBusOldObj := nil;
    end;
  finally
    ENBusChangeObj.Free;
    ENBusChangeObj := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actInstallBusExecute(
  Sender: TObject);
Var TempENBusChange: ENBusChangeControllerSoapPort;
begin //������ � �������� ������ ������������
  TempENBusChange :=
    HTTPRIOENBusChange as ENBusChangeControllerSoapPort;
  ENBusChangeNewObj := ENBusChange.Create;

  if ENBusChangeNewObj.substation04Ref = nil then
    ENBusChangeNewObj.substation04Ref := ENSubstation04Ref.Create;
  ENBusChangeNewObj.substation04Ref.code := ENSubstation04Obj.code;
  if ENBusChangeNewObj.highVoltCellRef = nil then
    ENBusChangeNewObj.highVoltCellRef := ENHighVoltageSellRef.Create;
  ENBusChangeNewObj.highVoltCellRef.code :=
    StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);
  if sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row] <> '' then
    begin
      if ENBusChangeNewObj.transformerRef = nil then
        ENBusChangeNewObj.transformerRef := ENTransformerRef.Create;
      ENBusChangeNewObj.transformerRef.code :=
        StrToInt(sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row]);
    end;

  try
    frmENBusChangeEdit :=
      TfrmENBusChangeEdit.Create(Application, dsEdit);
    try
      frmENBusChangeEdit.btnOk.ModalResult := mrYes;
      frmENBusChangeEdit.btnOk.Action :=
        frmENBusChangeEdit.ActnLstChangeEquip.Actions[2];
      frmENBusChangeEdit.tsEquipUninstall.TabVisible := False;
      frmENBusChangeEdit.actChooseNewEquip.Enabled := True;
      frmENBusChangeEdit.memName.Text := '��������� ������������� ����';

      if frmENBusChangeEdit.ShowModal = mrYes then
        begin
          TempENBusChange.InstallBus(
            ENBusNewObj, ENBusChangeNewObj);
          recalcBuses();
          UpdateGrid(Sender);
        end;
    finally
      frmENBusChangeEdit.Free;
      frmENBusChangeEdit := nil;
      ENBusNewObj.Free;
      ENBusNewObj := nil;
    end;
  finally
    ENBusChangeNewObj.Free;
    ENBusChangeNewObj := nil;
  end;
end;

(*������ ������������� �������� �������������� ������*)
procedure TfrmENSubstation04Edit.actChangeMeasurDeviceExecute(Sender: TObject);
Var TempENMeasurDevChange: ENMeasurDevChangeControllerSoapPort;
  TempENMeasurDevice: ENMeasurDeviceControllerSoapPort;
begin
  TempENMeasurDevice := HTTPRIOENMeasurDevice as ENMeasurDeviceControllerSoapPort;
  try //��������� �������-������������� �������������� �������
    ENMeasurDeviceOldObj := TempENMeasurDevice.getObject(
      StrToInt(sgENMeasurDevice.Cells[0, sgENMeasurDevice.Row]));
  except
    on EConvertError do Exit;
  end;
  //������ � �������� ������ ������������
  TempENMeasurDevChange :=
    HTTPRIOENMeasurDevChange as ENMeasurDevChangeControllerSoapPort;

  ENMeasurDevChangeObj := ENMeasurDevChange.Create;
  ENMeasurDevChangeNewObj := ENMeasurDevChange.Create;

  try
    if ENMeasurDevChangeObj.substation04Ref = nil then
      ENMeasurDevChangeObj.substation04Ref := ENSubstation04Ref.Create;
    ENMeasurDevChangeObj.substation04Ref.code := ENSubstation04Obj.code;

    if ENMeasurDevChangeNewObj.substation04Ref = nil then
      ENMeasurDevChangeNewObj.substation04Ref := ENSubstation04Ref.Create;
    ENMeasurDevChangeNewObj.substation04Ref.code := ENSubstation04Obj.code;
    if ENMeasurDevChangeNewObj.highVoltCellRef = nil then
      ENMeasurDevChangeNewObj.highVoltCellRef := ENHighVoltageSellRef.Create;
    ENMeasurDevChangeNewObj.highVoltCellRef.code :=
      StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);
      //ENMeasurDeviceOldObj.highvoltageSell.code;
    if sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row] <> '' then
      begin
        if ENMeasurDevChangeNewObj.transformerRef = nil then
          ENMeasurDevChangeNewObj.transformerRef := ENTransformerRef.Create;
        ENMeasurDevChangeNewObj.transformerRef.code :=
          StrToInt(sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row]);
      end;

    frmENMeasurDevChangeEdit :=
      TfrmENMeasurDevChangeEdit.Create(Application, dsEdit);
    try
      frmENMeasurDevChangeEdit.btnOk.ModalResult := mrNone;
      frmENMeasurDevChangeEdit.btnOk.Action :=
        frmENMeasurDevChangeEdit.ActnLstChangeEquip.Actions[0];
      frmENMeasurDevChangeEdit.tsEquipInstall.TabVisible := False;
      frmENMeasurDevChangeEdit.memName.Text := '������ �������������� �������';
      if frmENMeasurDevChangeEdit.ShowModal = mrOk then
        begin
          TempENMeasurDevChange.changeMeasurDevice(
            ENMeasurDeviceOldObj, ENMeasurDevChangeObj,
            ENMeasurDeviceNewObj, ENMeasurDevChangeNewObj);
          recalcMeasurDevices();
          UpdateGrid(Sender);
        end;
    finally
      frmENMeasurDevChangeEdit.Free;
      frmENMeasurDevChangeEdit := nil;
      ENMeasurDeviceOldObj.Free;
      ENMeasurDeviceOldObj := nil;
      ENMeasurDeviceNewObj.Free;
      ENMeasurDeviceNewObj := nil;
    end;
  finally
    ENMeasurDevChangeObj.Free;
    ENMeasurDevChangeObj := nil;
    ENMeasurDevChangeNewObj.Free;
    ENMeasurDevChangeNewObj := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actUninstallMeasurDeviceExecute(
  Sender: TObject);
Var TempENMeasurDevChange: ENMeasurDevChangeControllerSoapPort;
  TempENMeasurDevice: ENMeasurDeviceControllerSoapPort;
begin
  TempENMeasurDevice :=
    HTTPRIOENMeasurDevice as ENMeasurDeviceControllerSoapPort;
  try //��������� �������-������������� �������������� ������� �������������� ������
    ENMeasurDeviceOldObj := TempENMeasurDevice.getObject(
      StrToInt(sgENMeasurDevice.Cells[0, sgENMeasurDevice.Row]));
  except
    on EConvertError do Exit;
  end;
  //������ � �������� ������ ������������
  TempENMeasurDevChange :=
    HTTPRIOENMeasurDevChange as ENMeasurDevChangeControllerSoapPort;
  ENMeasurDevChangeObj := ENMeasurDevChange.Create;
  try
    if ENMeasurDevChangeObj.substation04Ref = nil then
      ENMeasurDevChangeObj.substation04Ref := ENSubstation04Ref.Create;
    ENMeasurDevChangeObj.substation04Ref.code := ENSubstation04Obj.code;
    
    frmENMeasurDevChangeEdit :=
      TfrmENMeasurDevChangeEdit.Create(Application, dsEdit);
    try
      frmENMeasurDevChangeEdit.btnOk.ModalResult := mrNo;
      frmENMeasurDevChangeEdit.btnOk.Action :=
        frmENMeasurDevChangeEdit.ActnLstChangeEquip.Actions[1];
      frmENMeasurDevChangeEdit.tsEquipInstall.TabVisible := False;
      frmENMeasurDevChangeEdit.tsEquipInstall.TabVisible := False;
      frmENMeasurDevChangeEdit.memName.Text := '������ �������������� �������';

      if frmENMeasurDevChangeEdit.ShowModal = mrNo then
        begin
          TempENMeasurDevChange.UninstallMeasurDevice(
            ENMeasurDeviceOldObj, ENMeasurDevChangeObj);
          recalcMeasurDevices();
          UpdateGrid(Sender);
        end;
    finally
      frmENMeasurDevChangeEdit.Free;
      frmENMeasurDevChangeEdit := nil;
      ENMeasurDeviceOldObj.Free;
      ENMeasurDeviceOldObj := nil;
    end;
  finally
    ENMeasurDevChangeObj.Free;
    ENMeasurDevChangeObj := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actInstallMeasurDeviceExecute(
  Sender: TObject);
Var TempENMeasurDevChange: ENMeasurDevChangeControllerSoapPort;
begin //������ � �������� ������ ������������
  TempENMeasurDevChange :=
    HTTPRIOENMeasurDevChange as ENMeasurDevChangeControllerSoapPort;
  ENMeasurDevChangeNewObj := ENMeasurDevChange.Create;

  if ENMeasurDevChangeNewObj.substation04Ref = nil then
    ENMeasurDevChangeNewObj.substation04Ref := ENSubstation04Ref.Create;
  ENMeasurDevChangeNewObj.substation04Ref.code := ENSubstation04Obj.code;
  if ENMeasurDevChangeNewObj.highVoltCellRef = nil then
    ENMeasurDevChangeNewObj.highVoltCellRef := ENHighVoltageSellRef.Create;
  ENMeasurDevChangeNewObj.highVoltCellRef.code :=
    StrToInt(sgENHighVoltageSell.Cells[0, sgENHighVoltageSell.Row]);
  if sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row] <> '' then
    begin
      if ENMeasurDevChangeNewObj.transformerRef = nil then
        ENMeasurDevChangeNewObj.transformerRef := ENTransformerRef.Create;
      ENMeasurDevChangeNewObj.transformerRef.code :=
        StrToInt(sgENHighVoltageSell.Cells[5, sgENHighVoltageSell.Row]);
    end;

  try
    frmENMeasurDevChangeEdit :=
      TfrmENMeasurDevChangeEdit.Create(Application, dsEdit);
    try
      frmENMeasurDevChangeEdit.btnOk.ModalResult := mrYes;
      frmENMeasurDevChangeEdit.btnOk.Action :=
        frmENMeasurDevChangeEdit.ActnLstChangeEquip.Actions[2];
      frmENMeasurDevChangeEdit.tsEquipUninstall.TabVisible := False;
      frmENMeasurDevChangeEdit.actChooseNewEquip.Enabled := True;
      frmENMeasurDevChangeEdit.memName.Text := '��������� �������������� �������';

      if frmENMeasurDevChangeEdit.ShowModal = mrYes then
        begin
          TempENMeasurDevChange.InstallMeasurDevice(
            ENMeasurDeviceNewObj, ENMeasurDevChangeNewObj);
          recalcMeasurDevices();
          UpdateGrid(Sender);
        end;
    finally
      frmENMeasurDevChangeEdit.Free;
      frmENMeasurDevChangeEdit := nil;
      ENMeasurDeviceNewObj.Free;
      ENMeasurDeviceNewObj := nil;
    end;
  finally
    ENMeasurDevChangeNewObj.Free;
    ENMeasurDevChangeNewObj := nil;
  end;
end;

(*������ �����������*)
procedure TfrmENSubstation04Edit.actChangeContactBreakerExecute(Sender: TObject);
Var TempENContBreakChange: ENContBreakChangeControllerSoapPort;
  TempENContactBreaker: ENContactBreakerControllerSoapPort;
begin
  TempENContactBreaker := HTTPRIOENContactBreaker as ENContactBreakerControllerSoapPort;
  try //��������� �������-������������� ����������
    ENContactBreakerOldObj := TempENContactBreaker.getObject(
      StrToInt(sgENContactBreaker.Cells[0, sgENContactBreaker.Row]));
  except
    on EConvertError do Exit;
  end;
  //������ � �������� ������ ������������
  TempENContBreakChange :=
    HTTPRIOENContBreakChange as ENContBreakChangeControllerSoapPort;

  ENContBreakChangeObj := ENContBreakChange.Create;
  ENContBreakChangeNewObj := ENContBreakChange.Create;

  try
    if ENContBreakChangeObj.substation04Ref = nil then
      ENContBreakChangeObj.substation04Ref := ENSubstation04Ref.Create;
    ENContBreakChangeObj.substation04Ref.code := ENSubstation04Obj.code;

    if ENContBreakChangeNewObj.substation04Ref = nil then
      ENContBreakChangeNewObj.substation04Ref := ENSubstation04Ref.Create;
    ENContBreakChangeNewObj.substation04Ref.code := ENSubstation04Obj.code;

    if ENContBreakChangeNewObj.lvbRef = nil then
      ENContBreakChangeNewObj.lvbRef := ENLowVoltBoardRef.Create;
    ENContBreakChangeNewObj.lvbRef.code :=
      StrToInt(sgENLowVoltBoard.Cells[0, sgENLowVoltBoard.Row]);

    if ENContBreakChangeNewObj.pnlRef = nil then
      ENContBreakChangeNewObj.pnlRef := ENPanelRef.Create;
    ENContBreakChangeNewObj.pnlRef.code :=
      StrToInt(sgENPanel.Cells[0, sgENPanel.Row]);

    if sgENPanel.Cells[6, sgENPanel.Row] <> '' then
      begin
        if ENContBreakChangeNewObj.transformerRef = nil then
          ENContBreakChangeNewObj.transformerRef := ENTransformerRef.Create;
        ENContBreakChangeNewObj.transformerRef.code :=
          StrToInt(sgENPanel.Cells[6, sgENPanel.Row]);
      end
    else if sgENLowVoltBoard.Row <> - 1 then
      if sgENLowVoltBoard.Cells[3, sgENLowVoltBoard.Row] <> '' then
        begin
          if ENContBreakChangeNewObj.transformerRef = nil then
            ENContBreakChangeNewObj.transformerRef := ENTransformerRef.Create;
          ENContBreakChangeNewObj.transformerRef.code :=
            StrToInt(sgENLowVoltBoard.Cells[3, sgENLowVoltBoard.Row]);
        end;

    if not chbLowVoltBoard.Checked then
      begin
        if ENContBreakChangeNewObj.branchRef = nil then
          ENContBreakChangeNewObj.branchRef := ENBranchRef.Create;
        ENContBreakChangeNewObj.branchRef.code :=
          StrToInt(sgENBranch.Cells[0, sgENBranch.Row]);
      end;

    frmENContBreakChangeEdit :=
      TfrmENContBreakChangeEdit.Create(Application, dsEdit);
    try
      frmENContBreakChangeEdit.btnOk.ModalResult := mrNone;
      frmENContBreakChangeEdit.btnOk.Action :=
        frmENContBreakChangeEdit.ActnLstChangeEquip.Actions[0];
      frmENContBreakChangeEdit.tsEquipInstall.TabVisible := False;
      frmENContBreakChangeEdit.memName.Text := '������ ����������';
      if frmENContBreakChangeEdit.ShowModal = mrOk then
        begin
          TempENContBreakChange.changeContactBreaker(
            ENContactBreakerOldObj, ENContBreakChangeObj,
            ENContactBreakerNewObj, ENContBreakChangeNewObj);
          recalcContactBreakers();
          UpdateGrid(Sender);
        end;
    finally
      frmENContBreakChangeEdit.Free;
      frmENContBreakChangeEdit := nil;
      ENContactBreakerOldObj.Free;
      ENContactBreakerOldObj := nil;
      ENContactBreakerNewObj.Free;
      ENContactBreakerNewObj := nil;
    end;
  finally
    ENContBreakChangeObj.Free;
    ENContBreakChangeObj := nil;
    ENContBreakChangeNewObj.Free;
    ENContBreakChangeNewObj := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actUninstallContactBreakerExecute(
  Sender: TObject);
Var TempENContBreakChange: ENContBreakChangeControllerSoapPort;
  TempENContactBreaker: ENContactBreakerControllerSoapPort;
begin
  TempENContactBreaker :=
    HTTPRIOENContactBreaker as ENContactBreakerControllerSoapPort;
  try //��������� �������-������������� ����������
    ENContactBreakerOldObj := TempENContactBreaker.getObject(
      StrToInt(sgENContactBreaker.Cells[0, sgENContactBreaker.Row]));
  except
    on EConvertError do Exit;
  end;
  //������ � �������� ������ ������������
  TempENContBreakChange :=
    HTTPRIOENContBreakChange as ENContBreakChangeControllerSoapPort;
  ENContBreakChangeObj := ENContBreakChange.Create;
  try
    if ENContBreakChangeObj.substation04Ref = nil then
      ENContBreakChangeObj.substation04Ref := ENSubstation04Ref.Create;
    ENContBreakChangeObj.substation04Ref.code := ENSubstation04Obj.code;
    
    frmENContBreakChangeEdit :=
      TfrmENContBreakChangeEdit.Create(Application, dsEdit);
    try
      frmENContBreakChangeEdit.btnOk.ModalResult := mrNo;
      frmENContBreakChangeEdit.btnOk.Action :=
        frmENContBreakChangeEdit.ActnLstChangeEquip.Actions[1];
      frmENContBreakChangeEdit.tsEquipInstall.TabVisible := False;
      frmENContBreakChangeEdit.tsEquipInstall.TabVisible := False;
      frmENContBreakChangeEdit.memName.Text := '������ ����������';

      if frmENContBreakChangeEdit.ShowModal = mrNo then
        begin
          TempENContBreakChange.UninstallContactBreaker(
            ENContactBreakerOldObj, ENContBreakChangeObj);
          recalcContactBreakers();
          UpdateGrid(Sender);
        end;
    finally
      frmENContBreakChangeEdit.Free;
      frmENContBreakChangeEdit := nil;
      ENContactBreakerOldObj.Free;
      ENContactBreakerOldObj := nil;
    end;
  finally
    ENContBreakChangeObj.Free;
    ENContBreakChangeObj := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actInstallContactBreakerExecute(
  Sender: TObject);
Var TempENContBreakChange: ENContBreakChangeControllerSoapPort;
begin //������ � �������� ������ ������������
  TempENContBreakChange :=
    HTTPRIOENContBreakChange as ENContBreakChangeControllerSoapPort;
  ENContBreakChangeNewObj := ENContBreakChange.Create;

  if ENContBreakChangeNewObj.substation04Ref = nil then
    ENContBreakChangeNewObj.substation04Ref := ENSubstation04Ref.Create;
  ENContBreakChangeNewObj.substation04Ref.code := ENSubstation04Obj.code;

  if ENContBreakChangeNewObj.lvbRef = nil then
    ENContBreakChangeNewObj.lvbRef := ENLowVoltBoardRef.Create;
  ENContBreakChangeNewObj.lvbRef.code :=
    StrToInt(sgENLowVoltBoard.Cells[0, sgENLowVoltBoard.Row]);

  if ENContBreakChangeNewObj.pnlRef = nil then
    ENContBreakChangeNewObj.pnlRef := ENPanelRef.Create;
  ENContBreakChangeNewObj.pnlRef.code :=
    StrToInt(sgENPanel.Cells[0, sgENPanel.Row]);

  if sgENPanel.Cells[6, sgENPanel.Row] <> '' then
    begin
      if ENContBreakChangeNewObj.transformerRef = nil then
        ENContBreakChangeNewObj.transformerRef := ENTransformerRef.Create;
      ENContBreakChangeNewObj.transformerRef.code :=
        StrToInt(sgENPanel.Cells[6, sgENPanel.Row]);
    end
  else if sgENLowVoltBoard.Row <> - 1 then
    if sgENLowVoltBoard.Cells[3, sgENLowVoltBoard.Row] <> '' then
      begin
        if ENContBreakChangeNewObj.transformerRef = nil then
          ENContBreakChangeNewObj.transformerRef := ENTransformerRef.Create;
        ENContBreakChangeNewObj.transformerRef.code :=
          StrToInt(sgENLowVoltBoard.Cells[3, sgENLowVoltBoard.Row]);
      end;

  if not chbLowVoltBoard.Checked then
    begin
      if ENContBreakChangeNewObj.branchRef = nil then
        ENContBreakChangeNewObj.branchRef := ENBRanchRef.Create;
      ENContBreakChangeNewObj.branchRef.code :=
        StrToInt(sgENBranch.Cells[0, sgENBranch.Row]);
    end;

  try
    frmENContBreakChangeEdit :=
      TfrmENContBreakChangeEdit.Create(Application, dsEdit);
    try
      frmENContBreakChangeEdit.btnOk.ModalResult := mrYes;
      frmENContBreakChangeEdit.btnOk.Action :=
        frmENContBreakChangeEdit.ActnLstChangeEquip.Actions[2];
      frmENContBreakChangeEdit.tsEquipUninstall.TabVisible := False;
      frmENContBreakChangeEdit.actChooseNewEquip.Enabled := True;
      frmENContBreakChangeEdit.memName.Text := '��������� ����������';

      if frmENContBreakChangeEdit.ShowModal = mrYes then
        begin
          TempENContBreakChange.InstallContactBreaker(
            ENContactBreakerNewObj, ENContBreakChangeNewObj);
          recalcContactBreakers();
          UpdateGrid(Sender);
        end;
    finally
      frmENContBreakChangeEdit.Free;
      frmENContBreakChangeEdit := nil;
      ENContactBreakerNewObj.Free;
      ENContactBreakerNewObj := nil;
    end;
  finally
    ENContBreakChangeNewObj.Free;
    ENContBreakChangeNewObj := nil;
  end;
end;

(*������ ��������������� �� ������������� ����*)
procedure TfrmENSubstation04Edit.actChangeFuseLVBExecute(Sender: TObject);
Var TempENFuseChange: ENFuseChangeControllerSoapPort;
  TempENFuse: ENFuseControllerSoapPort;
begin
  TempENFuse := HTTPRIOENFuse as ENFuseControllerSoapPort;
  try //��������� �������-������������� �������������� �� ������������� ����
    ENFuseOldObj := TempENFuse.getObject(
      StrToInt(sgENFuse.Cells[0, sgENFuse.Row]));
  except
    on EConvertError do Exit;
  end;
  //������ � �������� ������ ������������
  TempENFuseChange :=
    HTTPRIOENFuseChange as ENFuseChangeControllerSoapPort;

  ENFuseChangeObj := ENFuseChange.Create;
  ENFuseChangeNewObj := ENFuseChange.Create;

  try
    if ENFuseChangeObj.substation04Ref = nil then
      ENFuseChangeObj.substation04Ref := ENSubstation04Ref.Create;
    ENFuseChangeObj.substation04Ref.code := ENSubstation04Obj.code;

    if ENFuseChangeNewObj.substation04Ref = nil then
      ENFuseChangeNewObj.substation04Ref := ENSubstation04Ref.Create;
    ENFuseChangeNewObj.substation04Ref.code := ENSubstation04Obj.code;

    if ENFuseChangeNewObj.lvbRef = nil then
      ENFuseChangeNewObj.lvbRef := ENLowVoltBoardRef.Create;
    ENFuseChangeNewObj.lvbRef.code :=
      StrToInt(sgENLowVoltBoard.Cells[0, sgENLowVoltBoard.Row]);

    if ENFuseChangeNewObj.pnlRef = nil then
      ENFuseChangeNewObj.pnlRef := ENPanelRef.Create;
    ENFuseChangeNewObj.pnlRef.code :=
      StrToInt(sgENPanel.Cells[0, sgENPanel.Row]);

    if sgENPanel.Cells[6, sgENPanel.Row] <> '' then
      begin
        if ENFuseChangeNewObj.transformerRef = nil then
          ENFuseChangeNewObj.transformerRef := ENTransformerRef.Create;
        ENFuseChangeNewObj.transformerRef.code :=
          StrToInt(sgENPanel.Cells[6, sgENPanel.Row]);
      end
    else if sgENLowVoltBoard.Row <> - 1 then
      if sgENLowVoltBoard.Cells[3, sgENLowVoltBoard.Row] <> '' then
        begin
          if ENFuseChangeNewObj.transformerRef = nil then
            ENFuseChangeNewObj.transformerRef := ENTransformerRef.Create;
          ENFuseChangeNewObj.transformerRef.code :=
            StrToInt(sgENLowVoltBoard.Cells[3, sgENLowVoltBoard.Row]);
        end;

    if not chbLowVoltBoard.Checked then
      begin
        if ENFuseChangeNewObj.branchRef = nil then
          ENFuseChangeNewObj.branchRef := ENBranchRef.Create;
        ENFuseChangeNewObj.branchRef.code :=
          StrToInt(sgENBranch.Cells[0, sgENBranch.Row]);
      end;

    frmENFuseChangeEdit :=
      TfrmENFuseChangeEdit.Create(Application, dsEdit);
    try
      frmENFuseChangeEdit.btnOk.ModalResult := mrNone;
      frmENFuseChangeEdit.btnOk.Action :=
        frmENFuseChangeEdit.ActnLstChangeEquip.Actions[0];
      frmENFuseChangeEdit.tsEquipInstall.TabVisible := False;
      frmENFuseChangeEdit.memName.Text := '������ ��������������';
      if frmENFuseChangeEdit.ShowModal = mrOk then
        begin
          TempENFuseChange.changeFuse(
            ENFuseOldObj, ENFuseChangeObj,
            ENFuseNewObj, ENFuseChangeNewObj);
          recalcFuses();
          UpdateGrid(Sender);
        end;
    finally
      frmENFuseChangeEdit.Free;
      frmENFuseChangeEdit := nil;
      ENFuseOldObj.Free;
      ENFuseOldObj := nil;
      ENFuseNewObj.Free;
      ENFuseNewObj := nil;
    end;
  finally
    ENFuseChangeObj.Free;
    ENFuseChangeObj := nil;
    ENFuseChangeNewObj.Free;
    ENFuseChangeNewObj := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actUninstallFuseLVBExecute(
  Sender: TObject);
Var TempENFuseChange: ENFuseChangeControllerSoapPort;
  TempENFuse: ENFuseControllerSoapPort;
begin
  TempENFuse :=
    HTTPRIOENFuse as ENFuseControllerSoapPort;
  try //��������� �������-������������� �������������� �� ������������� ����
    ENFuseOldObj := TempENFuse.getObject(
      StrToInt(sgENFuseLVB.Cells[0, sgENFuseLVB.Row]));
  except
    on EConvertError do Exit;
  end;
  //������ � �������� ������ ������������
  TempENFuseChange :=
    HTTPRIOENFuseChange as ENFuseChangeControllerSoapPort;
  ENFuseChangeObj := ENFuseChange.Create;
  try
    if ENFuseChangeObj.substation04Ref = nil then
      ENFuseChangeObj.substation04Ref := ENSubstation04Ref.Create;
    ENFuseChangeObj.substation04Ref.code := ENSubstation04Obj.code;

    frmENFuseChangeEdit :=
      TfrmENFuseChangeEdit.Create(Application, dsEdit);
    try
      frmENFuseChangeEdit.btnOk.ModalResult := mrNo;
      frmENFuseChangeEdit.btnOk.Action :=
        frmENFuseChangeEdit.ActnLstChangeEquip.Actions[1];
      frmENFuseChangeEdit.tsEquipInstall.TabVisible := False;
      frmENFuseChangeEdit.tsEquipInstall.TabVisible := False;
      frmENFuseChangeEdit.memName.Text := '������ ��������������';

      if frmENFuseChangeEdit.ShowModal = mrNo then
        begin
          TempENFuseChange.UninstallFuse(
            ENFuseOldObj, ENFuseChangeObj);
          recalcFuses();
          UpdateGrid(Sender);
        end;
    finally
      frmENFuseChangeEdit.Free;
      frmENFuseChangeEdit := nil;
      ENFuseOldObj.Free;
      ENFuseOldObj := nil;
    end;
  finally
    ENFuseChangeObj.Free;
    ENFuseChangeObj := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actInstallFuseLVBExecute(
  Sender: TObject);
Var TempENFuseChange: ENFuseChangeControllerSoapPort;
begin //������ � �������� ������ ������������
  TempENFuseChange :=
    HTTPRIOENFuseChange as ENFuseChangeControllerSoapPort;
  ENFuseChangeNewObj := ENFuseChange.Create;

  if ENFuseChangeNewObj.substation04Ref = nil then
    ENFuseChangeNewObj.substation04Ref := ENSubstation04Ref.Create;
  ENFuseChangeNewObj.substation04Ref.code := ENSubstation04Obj.code;

  if ENFuseChangeNewObj.lvbRef = nil then
    ENFuseChangeNewObj.lvbRef := ENLowVoltBoardRef.Create;
  ENFuseChangeNewObj.lvbRef.code :=
    StrToInt(sgENLowVoltBoard.Cells[0, sgENLowVoltBoard.Row]);

  if ENFuseChangeNewObj.pnlRef = nil then
    ENFuseChangeNewObj.pnlRef := ENPanelRef.Create;
  ENFuseChangeNewObj.pnlRef.code :=
    StrToInt(sgENPanel.Cells[0, sgENPanel.Row]);

  if sgENPanel.Cells[6, sgENPanel.Row] <> '' then
    begin
      if ENFuseChangeNewObj.transformerRef = nil then
        ENFuseChangeNewObj.transformerRef := ENTransformerRef.Create;
      ENFuseChangeNewObj.transformerRef.code :=
        StrToInt(sgENPanel.Cells[6, sgENPanel.Row]);
    end
  else if sgENLowVoltBoard.Row <> - 1 then
    if sgENLowVoltBoard.Cells[3, sgENLowVoltBoard.Row] <> '' then
      begin
        if ENFuseChangeNewObj.transformerRef = nil then
          ENFuseChangeNewObj.transformerRef := ENTransformerRef.Create;
        ENFuseChangeNewObj.transformerRef.code :=
          StrToInt(sgENLowVoltBoard.Cells[3, sgENLowVoltBoard.Row]);
      end;

  if not chbLowVoltBoard.Checked then
    begin
      if ENFuseChangeNewObj.branchRef = nil then
        ENFuseChangeNewObj.branchRef := ENBRanchRef.Create;
      ENFuseChangeNewObj.branchRef.code :=
        StrToInt(sgENBranch.Cells[0, sgENBranch.Row]);
    end;
  try
    frmENFuseChangeEdit :=
      TfrmENFuseChangeEdit.Create(Application, dsEdit);
    try
      frmENFuseChangeEdit.btnOk.ModalResult := mrYes;
      frmENFuseChangeEdit.btnOk.Action :=
        frmENFuseChangeEdit.ActnLstChangeEquip.Actions[2];
      frmENFuseChangeEdit.tsEquipUninstall.TabVisible := False;
      frmENFuseChangeEdit.actChooseNewEquip.Enabled := True;
      frmENFuseChangeEdit.memName.Text := '��������� ��������������';

      if frmENFuseChangeEdit.ShowModal = mrYes then
        begin
          TempENFuseChange.InstallFuse(
            ENFuseNewObj, ENFuseChangeNewObj);
          recalcFuses();
          UpdateGrid(Sender);
        end;
    finally
      frmENFuseChangeEdit.Free;
      frmENFuseChangeEdit := nil;
      ENFuseNewObj.Free;
      ENFuseNewObj := nil;
    end;
  finally
    ENFuseChangeNewObj.Free;
    ENFuseChangeNewObj := nil;
  end;
end;

(*������ �������������� ������������*)
procedure TfrmENSubstation04Edit.actChangeAutomatExecute(Sender: TObject);
Var TempENAutomatChange: ENAutomatChangeControllerSoapPort;
  TempENAutomat: ENAutomatControllerSoapPort;
begin
  TempENAutomat := HTTPRIOENAutomat as ENAutomatControllerSoapPort;
  try //��������� �������-������������� ��������������� �����������
    ENAutomatOldObj := TempENAutomat.getObject(
      StrToInt(sgENAutomat.Cells[0, sgENAutomat.Row]));
  except
    on EConvertError do Exit;
  end;
  //������ � �������� ������ ������������
  TempENAutomatChange :=
    HTTPRIOENAutomatChange as ENAutomatChangeControllerSoapPort;

  ENAutomatChangeObj := ENAutomatChange.Create;
  ENAutomatChangeNewObj := ENAutomatChange.Create;

  try
    if ENAutomatChangeObj.substation04Ref = nil then
      ENAutomatChangeObj.substation04Ref := ENSubstation04Ref.Create;
    ENAutomatChangeObj.substation04Ref.code := ENSubstation04Obj.code;

    if ENAutomatChangeNewObj.substation04Ref = nil then
      ENAutomatChangeNewObj.substation04Ref := ENSubstation04Ref.Create;
    ENAutomatChangeNewObj.substation04Ref.code := ENSubstation04Obj.code;

    if ENAutomatChangeNewObj.lvbRef = nil then
      ENAutomatChangeNewObj.lvbRef := ENLowVoltBoardRef.Create;
    ENAutomatChangeNewObj.lvbRef.code :=
      StrToInt(sgENLowVoltBoard.Cells[0, sgENLowVoltBoard.Row]);

    if ENAutomatChangeNewObj.pnlRef = nil then
      ENAutomatChangeNewObj.pnlRef := ENPanelRef.Create;
    ENAutomatChangeNewObj.pnlRef.code :=
      StrToInt(sgENPanel.Cells[0, sgENPanel.Row]);

    if sgENPanel.Cells[6, sgENPanel.Row] <> '' then
      begin
        if ENAutomatChangeNewObj.transformerRef = nil then
          ENAutomatChangeNewObj.transformerRef := ENTransformerRef.Create;
        ENAutomatChangeNewObj.transformerRef.code :=
          StrToInt(sgENPanel.Cells[6, sgENPanel.Row]);
      end
    else if sgENLowVoltBoard.Row <> - 1 then
      if sgENLowVoltBoard.Cells[3, sgENLowVoltBoard.Row] <> '' then
        begin
          if ENAutomatChangeNewObj.transformerRef = nil then
            ENAutomatChangeNewObj.transformerRef := ENTransformerRef.Create;
          ENAutomatChangeNewObj.transformerRef.code :=
            StrToInt(sgENLowVoltBoard.Cells[3, sgENLowVoltBoard.Row]);
        end;

    if not chbLowVoltBoard.Checked then
      begin
        if ENAutomatChangeNewObj.branchRef = nil then
          ENAutomatChangeNewObj.branchRef := ENBranchRef.Create;
        ENAutomatChangeNewObj.branchRef.code :=
          StrToInt(sgENBranch.Cells[0, sgENBranch.Row]);
      end;

    frmENAutomatChangeEdit :=
      TfrmENAutomatChangeEdit.Create(Application, dsEdit);
    try
      frmENAutomatChangeEdit.btnOk.ModalResult := mrNone;
      frmENAutomatChangeEdit.btnOk.Action :=
        frmENAutomatChangeEdit.ActnLstChangeEquip.Actions[0];
      frmENAutomatChangeEdit.tsEquipInstall.TabVisible := False;
      frmENAutomatChangeEdit.memName.Text := '������ ��������������� �����������';
      if frmENAutomatChangeEdit.ShowModal = mrOk then
        begin
          TempENAutomatChange.changeAutomat(
            ENAutomatOldObj, ENAutomatChangeObj,
            ENAutomatNewObj, ENAutomatChangeNewObj);
          recalcAutomates();
          UpdateGrid(Sender);
        end;
    finally
      frmENAutomatChangeEdit.Free;
      frmENAutomatChangeEdit := nil;
      ENAutomatOldObj.Free;
      ENAutomatOldObj := nil;
      ENAutomatNewObj.Free;
      ENAutomatNewObj := nil;
    end;
  finally
    ENAutomatChangeObj.Free;
    ENAutomatChangeObj := nil;
    ENAutomatChangeNewObj.Free;
    ENAutomatChangeNewObj := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actUninstallAutomatExecute(
  Sender: TObject);
Var TempENAutomatChange: ENAutomatChangeControllerSoapPort;
  TempENAutomat: ENAutomatControllerSoapPort;
begin
  TempENAutomat :=
    HTTPRIOENAutomat as ENAutomatControllerSoapPort;
  try //��������� �������-������������� ��������������� �����������
    ENAutomatOldObj := TempENAutomat.getObject(
      StrToInt(sgENAutomat.Cells[0, sgENAutomat.Row]));
  except
    on EConvertError do Exit;
  end;
  //������ � �������� ������ ������������
  TempENAutomatChange :=
    HTTPRIOENAutomatChange as ENAutomatChangeControllerSoapPort;
  ENAutomatChangeObj := ENAutomatChange.Create;
  try
    if ENAutomatChangeObj.substation04Ref = nil then
      ENAutomatChangeObj.substation04Ref := ENSubstation04Ref.Create;
    ENAutomatChangeObj.substation04Ref.code := ENSubstation04Obj.code;

    frmENAutomatChangeEdit :=
      TfrmENAutomatChangeEdit.Create(Application, dsEdit);
    try
      frmENAutomatChangeEdit.btnOk.ModalResult := mrNo;
      frmENAutomatChangeEdit.btnOk.Action :=
        frmENAutomatChangeEdit.ActnLstChangeEquip.Actions[1];
      frmENAutomatChangeEdit.tsEquipInstall.TabVisible := False;
      frmENAutomatChangeEdit.tsEquipInstall.TabVisible := False;
      frmENAutomatChangeEdit.memName.Text := '������ ��������������� �����������';

      if frmENAutomatChangeEdit.ShowModal = mrNo then
        begin
          TempENAutomatChange.UninstallAutomat(
            ENAutomatOldObj, ENAutomatChangeObj);
          recalcAutomates();
          UpdateGrid(Sender);
        end;
    finally
      frmENAutomatChangeEdit.Free;
      frmENAutomatChangeEdit := nil;
      ENAutomatOldObj.Free;
      ENAutomatOldObj := nil;
    end;
  finally
    ENAutomatChangeObj.Free;
    ENAutomatChangeObj := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actInstallAutomatExecute(
  Sender: TObject);
Var TempENAutomatChange: ENAutomatChangeControllerSoapPort;
begin //������ � �������� ������ ������������
  TempENAutomatChange :=
    HTTPRIOENAutomatChange as ENAutomatChangeControllerSoapPort;
  ENAutomatChangeNewObj := ENAutomatChange.Create;

  if ENAutomatChangeNewObj.substation04Ref = nil then
    ENAutomatChangeNewObj.substation04Ref := ENSubstation04Ref.Create;
  ENAutomatChangeNewObj.substation04Ref.code := ENSubstation04Obj.code;

  if ENAutomatChangeNewObj.lvbRef = nil then
    ENAutomatChangeNewObj.lvbRef := ENLowVoltBoardRef.Create;
  ENAutomatChangeNewObj.lvbRef.code :=
    StrToInt(sgENLowVoltBoard.Cells[0, sgENLowVoltBoard.Row]);

  if ENAutomatChangeNewObj.pnlRef = nil then
    ENAutomatChangeNewObj.pnlRef := ENPanelRef.Create;
  ENAutomatChangeNewObj.pnlRef.code :=
    StrToInt(sgENPanel.Cells[0, sgENPanel.Row]);

  if sgENPanel.Cells[6, sgENPanel.Row] <> '' then
    begin
      if ENAutomatChangeNewObj.transformerRef = nil then
        ENAutomatChangeNewObj.transformerRef := ENTransformerRef.Create;
      ENAutomatChangeNewObj.transformerRef.code :=
        StrToInt(sgENPanel.Cells[6, sgENPanel.Row]);
    end
  else if sgENLowVoltBoard.Row <> - 1 then
    if sgENLowVoltBoard.Cells[3, sgENLowVoltBoard.Row] <> '' then
      begin
        if ENAutomatChangeNewObj.transformerRef = nil then
          ENAutomatChangeNewObj.transformerRef := ENTransformerRef.Create;
        ENAutomatChangeNewObj.transformerRef.code :=
          StrToInt(sgENLowVoltBoard.Cells[3, sgENLowVoltBoard.Row]);
      end;

  if not chbLowVoltBoard.Checked then
    begin
      if ENAutomatChangeNewObj.branchRef = nil then
        ENAutomatChangeNewObj.branchRef := ENBranchRef.Create;
      ENAutomatChangeNewObj.branchRef.code :=
        StrToInt(sgENBranch.Cells[0, sgENBranch.Row]);
    end;

  try
    frmENAutomatChangeEdit :=
      TfrmENAutomatChangeEdit.Create(Application, dsEdit);
    try
      frmENAutomatChangeEdit.btnOk.ModalResult := mrYes;
      frmENAutomatChangeEdit.btnOk.Action :=
        frmENAutomatChangeEdit.ActnLstChangeEquip.Actions[2];
      frmENAutomatChangeEdit.tsEquipUninstall.TabVisible := False;
      frmENAutomatChangeEdit.actChooseNewEquip.Enabled := True;
      frmENAutomatChangeEdit.memName.Text := '��������� ��������������� �����������';

      if frmENAutomatChangeEdit.ShowModal = mrYes then
        begin
          TempENAutomatChange.InstallAutomat(
            ENAutomatNewObj, ENAutomatChangeNewObj);
          recalcAutomates();
          UpdateGrid(Sender);
        end;
    finally
      frmENAutomatChangeEdit.Free;
      frmENAutomatChangeEdit := nil;
      ENAutomatNewObj.Free;
      ENAutomatNewObj := nil;
    end;
  finally
    ENAutomatChangeNewObj.Free;
    ENAutomatChangeNewObj := nil;
  end;
end;

(*������ ������������� �������� �� ������������� ����*)
procedure TfrmENSubstation04Edit.actChangeMeasurDeviceLVBExecute(Sender: TObject);
Var TempENMeasurDevChange: ENMeasurDevChangeControllerSoapPort;
  TempENMeasurDevice: ENMeasurDeviceControllerSoapPort;
begin
  TempENMeasurDevice := HTTPRIOENMeasurDevice as ENMeasurDeviceControllerSoapPort;
  try //��������� �������-������������� �������������� ������� �� ������������� ����
    ENMeasurDeviceOldObj := TempENMeasurDevice.getObject(
      StrToInt(sgENMeasurDevice.Cells[0, sgENMeasurDevice.Row]));
  except
    on EConvertError do Exit;
  end;
  //������ � �������� ������ ������������
  TempENMeasurDevChange :=
    HTTPRIOENMeasurDevChange as ENMeasurDevChangeControllerSoapPort;

  ENMeasurDevChangeObj := ENMeasurDevChange.Create;
  ENMeasurDevChangeNewObj := ENMeasurDevChange.Create;

  try
    if ENMeasurDevChangeObj.substation04Ref = nil then
      ENMeasurDevChangeObj.substation04Ref := ENSubstation04Ref.Create;
    ENMeasurDevChangeObj.substation04Ref.code := ENSubstation04Obj.code;

    if ENMeasurDevChangeNewObj.substation04Ref = nil then
      ENMeasurDevChangeNewObj.substation04Ref := ENSubstation04Ref.Create;
    ENMeasurDevChangeNewObj.substation04Ref.code := ENSubstation04Obj.code;

    if ENMeasurDevChangeNewObj.lvbRef = nil then
      ENMeasurDevChangeNewObj.lvbRef := ENLowVoltBoardRef.Create;
    ENMeasurDevChangeNewObj.lvbRef.code :=
      StrToInt(sgENLowVoltBoard.Cells[0, sgENLowVoltBoard.Row]);

    if ENMeasurDevChangeNewObj.pnlRef = nil then
      ENMeasurDevChangeNewObj.pnlRef := ENPanelRef.Create;
    ENMeasurDevChangeNewObj.pnlRef.code :=
      StrToInt(sgENPanel.Cells[0, sgENPanel.Row]);

    if sgENPanel.Cells[6, sgENPanel.Row] <> '' then
      begin
        if ENMeasurDevChangeNewObj.transformerRef = nil then
          ENMeasurDevChangeNewObj.transformerRef := ENTransformerRef.Create;
        ENMeasurDevChangeNewObj.transformerRef.code :=
          StrToInt(sgENPanel.Cells[6, sgENPanel.Row]);
      end
    else if sgENLowVoltBoard.Row <> - 1 then
      if sgENLowVoltBoard.Cells[3, sgENLowVoltBoard.Row] <> '' then
        begin
          if ENMeasurDevChangeNewObj.transformerRef = nil then
            ENMeasurDevChangeNewObj.transformerRef := ENTransformerRef.Create;
          ENMeasurDevChangeNewObj.transformerRef.code :=
            StrToInt(sgENLowVoltBoard.Cells[3, sgENLowVoltBoard.Row]);
        end;

    if not chbLowVoltBoard.Checked then
      begin
        if ENMeasurDevChangeNewObj.branchRef = nil then
          ENMeasurDevChangeNewObj.branchRef := ENBranchRef.Create;
        ENMeasurDevChangeNewObj.branchRef.code :=
          StrToInt(sgENBranch.Cells[0, sgENBranch.Row]);
      end;

    frmENMeasurDevChangeEdit :=
      TfrmENMeasurDevChangeEdit.Create(Application, dsEdit);
    try
      frmENMeasurDevChangeEdit.btnOk.ModalResult := mrNone;
      frmENMeasurDevChangeEdit.btnOk.Action :=
        frmENMeasurDevChangeEdit.ActnLstChangeEquip.Actions[0];
      frmENMeasurDevChangeEdit.tsEquipInstall.TabVisible := False;
      frmENMeasurDevChangeEdit.memName.Text := '������ �������������� �������';
      if frmENMeasurDevChangeEdit.ShowModal = mrOk then
        begin
          TempENMeasurDevChange.changeMeasurDevice(
            ENMeasurDeviceOldObj, ENMeasurDevChangeObj,
            ENMeasurDeviceNewObj, ENMeasurDevChangeNewObj);
          recalcMeasurDevices();
          UpdateGrid(Sender);
        end;
    finally
      frmENMeasurDevChangeEdit.Free;
      frmENMeasurDevChangeEdit := nil;
      ENMeasurDeviceOldObj.Free;
      ENMeasurDeviceOldObj := nil;
      ENMeasurDeviceNewObj.Free;
      ENMeasurDeviceNewObj := nil;
    end;
  finally
    ENMeasurDevChangeObj.Free;
    ENMeasurDevChangeObj := nil;
    ENMeasurDevChangeNewObj.Free;
    ENMeasurDevChangeNewObj := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actUninstallMeasurDeviceLVBExecute(
  Sender: TObject);
Var TempENMeasurDevChange: ENMeasurDevChangeControllerSoapPort;
  TempENMeasurDevice: ENMeasurDeviceControllerSoapPort;
begin
  TempENMeasurDevice :=
    HTTPRIOENMeasurDevice as ENMeasurDeviceControllerSoapPort;
  try //��������� �������-������������� �������������� ������� �� ������������� ����
    ENMeasurDeviceOldObj := TempENMeasurDevice.getObject(
      StrToInt(sgENMeasurDeviceLVB.Cells[0, sgENMeasurDeviceLVB.Row]));
  except
    on EConvertError do Exit;
  end;
  //������ � �������� ������ ������������
  TempENMeasurDevChange :=
    HTTPRIOENMeasurDevChange as ENMeasurDevChangeControllerSoapPort;
  ENMeasurDevChangeObj := ENMeasurDevChange.Create;
  try
    if ENMeasurDevChangeObj.substation04Ref = nil then
      ENMeasurDevChangeObj.substation04Ref := ENSubstation04Ref.Create;
    ENMeasurDevChangeObj.substation04Ref.code := ENSubstation04Obj.code;
    
    frmENMeasurDevChangeEdit :=
      TfrmENMeasurDevChangeEdit.Create(Application, dsEdit);
    try
      frmENMeasurDevChangeEdit.btnOk.ModalResult := mrNo;
      frmENMeasurDevChangeEdit.btnOk.Action :=
        frmENMeasurDevChangeEdit.ActnLstChangeEquip.Actions[1];
      frmENMeasurDevChangeEdit.tsEquipInstall.TabVisible := False;
      frmENMeasurDevChangeEdit.tsEquipInstall.TabVisible := False;
      frmENMeasurDevChangeEdit.memName.Text := '������ �������������� �������';

      if frmENMeasurDevChangeEdit.ShowModal = mrNo then
        begin
          TempENMeasurDevChange.UninstallMeasurDevice(
            ENMeasurDeviceOldObj, ENMeasurDevChangeObj);
          recalcMeasurDevices();
          UpdateGrid(Sender);
        end;
    finally
      frmENMeasurDevChangeEdit.Free;
      frmENMeasurDevChangeEdit := nil;
      ENMeasurDeviceOldObj.Free;
      ENMeasurDeviceOldObj := nil;
    end;
  finally
    ENMeasurDevChangeObj.Free;
    ENMeasurDevChangeObj := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actInstallMeasurDeviceLVBExecute(
  Sender: TObject);
Var TempENMeasurDevChange: ENMeasurDevChangeControllerSoapPort;
begin //������ � �������� ������ ������������
  TempENMeasurDevChange :=
    HTTPRIOENMeasurDevChange as ENMeasurDevChangeControllerSoapPort;
  ENMeasurDevChangeNewObj := ENMeasurDevChange.Create;

  if ENMeasurDevChangeNewObj.substation04Ref = nil then
    ENMeasurDevChangeNewObj.substation04Ref := ENSubstation04Ref.Create;
  ENMeasurDevChangeNewObj.substation04Ref.code := ENSubstation04Obj.code;

  if ENMeasurDevChangeNewObj.lvbRef = nil then
    ENMeasurDevChangeNewObj.lvbRef := ENLowVoltBoardRef.Create;
  ENMeasurDevChangeNewObj.lvbRef.code :=
    StrToInt(sgENLowVoltBoard.Cells[0, sgENLowVoltBoard.Row]);

  if ENMeasurDevChangeNewObj.pnlRef = nil then
    ENMeasurDevChangeNewObj.pnlRef := ENPanelRef.Create;
  ENMeasurDevChangeNewObj.pnlRef.code :=
    StrToInt(sgENPanel.Cells[0, sgENPanel.Row]);

  if sgENPanel.Cells[6, sgENPanel.Row] <> '' then
    begin
      if ENMeasurDevChangeNewObj.transformerRef = nil then
        ENMeasurDevChangeNewObj.transformerRef := ENTransformerRef.Create;
      ENMeasurDevChangeNewObj.transformerRef.code :=
        StrToInt(sgENPanel.Cells[6, sgENPanel.Row]);
    end
  else if sgENLowVoltBoard.Row <> - 1 then
    if sgENLowVoltBoard.Cells[3, sgENLowVoltBoard.Row] <> '' then
      begin
        if ENMeasurDevChangeNewObj.transformerRef = nil then
          ENMeasurDevChangeNewObj.transformerRef := ENTransformerRef.Create;
        ENMeasurDevChangeNewObj.transformerRef.code :=
          StrToInt(sgENLowVoltBoard.Cells[3, sgENLowVoltBoard.Row]);
      end;

  if not chbLowVoltBoard.Checked then
    begin
      if ENMeasurDevChangeNewObj.branchRef = nil then
        ENMeasurDevChangeNewObj.branchRef := ENBranchRef.Create;
      ENMeasurDevChangeNewObj.branchRef.code :=
        StrToInt(sgENBranch.Cells[0, sgENBranch.Row]);
    end;

  try
    frmENMeasurDevChangeEdit :=
      TfrmENMeasurDevChangeEdit.Create(Application, dsEdit);
    try
      frmENMeasurDevChangeEdit.btnOk.ModalResult := mrYes;
      frmENMeasurDevChangeEdit.btnOk.Action :=
        frmENMeasurDevChangeEdit.ActnLstChangeEquip.Actions[2];
      frmENMeasurDevChangeEdit.tsEquipUninstall.TabVisible := False;
      frmENMeasurDevChangeEdit.actChooseNewEquip.Enabled := True;
      frmENMeasurDevChangeEdit.memName.Text := '��������� �������������� �������';

      if frmENMeasurDevChangeEdit.ShowModal = mrYes then
        begin
          TempENMeasurDevChange.InstallMeasurDevice(
            ENMeasurDeviceNewObj, ENMeasurDevChangeNewObj);
          recalcMeasurDevices();
          UpdateGrid(Sender);
        end;
    finally
      frmENMeasurDevChangeEdit.Free;
      frmENMeasurDevChangeEdit := nil;
      ENMeasurDeviceNewObj.Free;
      ENMeasurDeviceNewObj := nil;
    end;
  finally
    ENMeasurDevChangeNewObj.Free;
    ENMeasurDevChangeNewObj := nil;
  end;
end;

//������� ����� ���������������
procedure TfrmENSubstation04Edit.actHistoryTransformerExecute(
  Sender: TObject);
var ENTransformerChangeFilterObj: ENTransformerChangeFilter;
  fENTransformerChangeShow: TfrmENTransformerChangeShow;
  //TempENTransformerChange: ENTransformerChangeControllerSoapPort;
  //condition, s04Condition: String;
begin
  ENTransformerChangeFilterObj := ENTransformerChangeFilter.Create;
  SetNullIntProps(ENTransformerChangeFilterObj);
  SetNullXSProps(ENTransformerChangeFilterObj);
  if ENSubstation04Obj <> nil then
    begin
      //s04Condition := ' entransformerchange.substation04refcode = '
      //  + IntToStr(ENSubstation04Obj.code);
      //if s04Condition <> '' then
      //  AddCondition(condition, s04Condition);
      //if ENTransformerChangeFilterObj.conditionSQL <> '' then
      //  ENTransformerChangeFilterObj.conditionSQL :=
      //    ENTransformerChangeFilterObj.conditionSQL + ' and ' + condition
      //else
      //  ENTransformerChangeFilterObj.conditionSQL := condition;
      ENTransformerChangeFilterObj.substation04Ref := ENSubstation04Ref.Create;
      ENTransformerChangeFilterObj.substation04Ref.code :=
        ENSubstation04Obj.code;
    end;

  fENTransformerChangeShow := TfrmENTransformerChangeShow.Create(
    Application, fmFiltered, ENTransformerChangeFilterObj);
  with fENTransformerChangeShow do
    DisableActions([actView, actInsert, actEdit, actDelete]);
  try
    fENTransformerChangeShow.ShowModal;
  finally
    fENTransformerChangeShow.Free;
    if ENTransformerChangeObj <> nil then
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSubstation04Edit.LowVoltBoardActionActivate(actEnable: Boolean);
begin //��������� ������ �������������� ������������ �������������� ����
  actInsertEquipment.Enabled := actEnable;
  actViewEquipment.Enabled := actInsertEquipment.Enabled;
  actDeleteEquipment.Enabled := actInsertEquipment.Enabled;
  actEditEquipment.Enabled := actInsertEquipment.Enabled;
  tbEquipContactBreaker.Enabled := actInsertEquipment.Enabled; //������ ������ �����������
  tbEquipFuseLVB.Enabled := actInsertEquipment.Enabled; //������ ������ ��������������� �������������� ����
  tbEquipAutomat.Enabled := actInsertEquipment.Enabled; //������ ������ �������������� ������������
  tbEquipMeasurDeviceLVB.Enabled := actInsertEquipment.Enabled; //������ ������ ����������� �������������� ����
end;

//����������� ������������ �������������� ����
procedure TfrmENSubstation04Edit.LowVoltBoardEquipmentShow;
var vASG: TAdvStringGrid; i, j: Integer;
begin
  if TAdvStringGrid(sgENLowVoltBoard).RowCount = 0 then
    begin
      LowVoltBoardActionActivate(
        (brLastCount > -1) and (DialogState <> dsView));
      Exit;
    end;
  LowVoltBoardActionActivate(DialogState <> dsView);
  if pcBoardEquipment.ActivePage = tsContactBreakerLVB then
    begin //���� ������� ������� "����������" (�� ������������� �������)
      vASG := sgENContactBreaker;
      j := 3;
    end
  else if pcBoardEquipment.ActivePage = tsFuseLVB then
    begin //���� ������� ������� "��������������" (�� ������������� �������)
      vASG := sgENFuseLVB;
      j := 3;
    end
  else if pcBoardEquipment.ActivePage = tsAutomatLVB then //���� �������
    begin //������� "�������������� �����������" (�� ������������� �������)
      vASG := sgENAutomat;
      j := 4;
    end
  else if pcBoardEquipment.ActivePage = tsMeasurDeviceLVB then //���� �������
    begin //������� "������������� �������" (�� ������������� �������)
      vASG := sgENMeasurDeviceLVB;
      j := 4;
    end;
  //sgENPanel.Update;
  //������� ������������, �� ������������ �� ������� ����
  //�������������� ���� ������� ��������������
  for i := 1 to vASG.RowCount - 1 do
    begin
      if (pos('���', vASG.Cells[j, i]) > 0) and (vASG.Cells[j + 2, i] = //������ ��������
        sgENLowVoltBoard.Cells[3, sgENLowVoltBoard.Row]) //�� ���� ��������������
      then
        begin
          vASG.RowHeights[i] := 19;
          vASG.Row := i;
        end
      else
        vASG.RowHeights[i] := 0;
    end;
  vASG.Update;
end;

procedure TfrmENSubstation04Edit.chbLowVoltBoardMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var Allow: Boolean;
begin
  ChangeLVBEquipmentHeaders;
  if chbLowVoltBoard.Checked then
    LowVoltBoardEquipmentShow
  else
    begin
      LowVoltBoardActionActivate(
        (brLastCount > -1) and (DialogState <> dsView));
      sgENBranch.OnRowChanging(sgENBranch, 0, sgENBranch.Row, Allow);
    end;
end;

procedure TfrmENSubstation04Edit.chbLowVoltBoardKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var Allow: Boolean;
begin
  ChangeLVBEquipmentHeaders;
  if chbLowVoltBoard.Checked then
    LowVoltBoardEquipmentShow
  else
    begin
      LowVoltBoardActionActivate(
        (brLastCount > -1) and (DialogState <> dsView));
      sgENBranch.OnRowChanging(sgENBranch, 0, sgENBranch.Row, Allow);
    end;
end;

procedure TfrmENSubstation04Edit.sgENLowVoltBoardClick(Sender: TObject);
begin
  chbLowVoltBoard.Checked := True;
  ChangeLVBEquipmentHeaders;
  LowVoltBoardEquipmentShow;
end;

procedure TfrmENSubstation04Edit.sgENBranchMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var Allow: Boolean;
begin
  if TAdvStringGrid(Sender).RowCount = 0 then
    Exit;
  sgENBranch.OnRowChanging(Sender, 0, TAdvStringGrid(Sender).Row, Allow);
  LowVoltBoardActionActivate(
    (brLastCount > -1) and (DialogState <> dsView));
  chbLowVoltBoard.Checked := False;
  ChangeLVBEquipmentHeaders;
end;

procedure TfrmENSubstation04Edit.sgENBranchKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var Button: TMouseButton; X, Y: Integer;
begin
  sgENBranch.OnMouseUp(Sender, Button, Shift, X, Y);
end;

procedure TfrmENSubstation04Edit.sgENPanelMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var Allow: Boolean;
begin
  if TAdvStringGrid(Sender).RowCount = 0 then
    Exit;
  sgENPanel.OnRowChanging(Sender, 0, TAdvStringGrid(Sender).Row, Allow);
  if (TAdvStringGrid(Sender).Cells[1, TAdvStringGrid(Sender).Row] <>
    '����� ��������������� ������')
  and (TAdvStringGrid(Sender).Cells[1, TAdvStringGrid(Sender).Row] <>
    '�������� ������')
  and (TAdvStringGrid(Sender).Cells[1, TAdvStringGrid(Sender).Row] <>
    '������-���������� ������')
  and (TAdvStringGrid(Sender).Cells[1, TAdvStringGrid(Sender).Row] <>
    '������ ������������� ��������� �������')
  and (TAdvStringGrid(Sender).Cells[1, TAdvStringGrid(Sender).Row] <>
    '��� �� ���')
  then
    begin
      LowVoltBoardActionActivate(
        (brLastCount > -1) and (DialogState <> dsView));
      chbLowVoltBoard.Checked := False;
    end;
  //��������� ���������� �������� ������������ ������������� �������
  ChangeLVBEquipmentHeaders;
end;

procedure TfrmENSubstation04Edit.sgENPanelKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var Button: TMouseButton; X, Y: Integer;
begin
  sgENPanel.OnMouseUp(Sender, Button, Shift, X, Y);
end;

procedure TfrmENSubstation04Edit.actViewAgreeJointExecute(Sender: TObject);
Var TempENAgreeJoint: ENAgreeJointControllerSoapPort;
begin
  TempENAgreeJoint := HTTPRIOENAgreeJoint as ENAgreeJointControllerSoapPort;
    try
     ENAgreeJointObj := TempENAgreeJoint.getObject(
       StrToInt(sgENAgreeJoint.Cells[0, sgENAgreeJoint.Row]));
    except
    on EConvertError do Exit;
  end;
  frmENAgreeJointEdit := TfrmENAgreeJointEdit.Create(Application, dsView);
  try
    frmENAgreeJointEdit.ShowModal;
  finally
    frmENAgreeJointEdit.Free;
    frmENAgreeJointEdit := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actInsertAgreeJointExecute(
  Sender: TObject);
Var TempENAgreeJoint: ENAgreeJointControllerSoapPort;
  //TempENLine10: ENLine10ControllerSoapPort;
  //TempENLineCable: ENLineCableControllerSoapPort;
begin
  TempENAgreeJoint := HTTPRIOENAgreeJoint as ENAgreeJointControllerSoapPort;
  ENAgreeJointObj := ENAgreeJoint.Create;
  if rbENLine10.Checked then
    begin //���� ������� �������� ��������� ����� 6 - 10 / 0,4 ��
      if (sgENLine10.RowCount = 0)
      or ((sgENLine10.RowCount <> 0) and (sgENLine10.Row = -1))
      or ((sgENLine10.RowCount <> 0) and (sgENLine10.Row <> -1)
        and (sgENLine10.Cells[0, sgENLine10.Row] = ''))
      then
        begin
          Application.MessageBox(
          PChar('��� ���������� ���������� ������������������� �� ��������� ����� '
            + #13#10 + '�������� � ���������� ������������� ������������ '
            + #13#10 + '���������� ������� �������� ���������� ��������� �����.'),
          PChar('���������:'), MB_ICONWARNING);
          Exit;
        end;
      if ENAgreeJointObj.line10Ref = nil then
        ENAgreeJointObj.line10Ref := ENLine10Ref.Create;
      ENAgreeJointObj.line10Ref.code :=
        StrToInt(sgENLine10.Cells[0, sgENLine10.Row]);
    end
  else //if rbENLineCable.Checked then
    begin //���� ������� �������� ��������� �����
      if (sgENLineCable.RowCount = 0)
      or ((sgENLineCable.RowCount <> 0) and (sgENLineCable.Row = -1))
      or ((sgENLineCable.RowCount <> 0) and (sgENLineCable.Row <> -1)
        and (sgENLineCable.Cells[0, sgENLineCable.Row] = ''))
      then
        begin
          Application.MessageBox(
            PChar('��� ���������� ���������� ������������������� �� ��������� ����� '
              + #13#10 + '�������� � ���������� ������������� ������������ '
              + #13#10 + '���������� ������� �������� ���������� ��������� �����.'),
            PChar('���������:'), MB_ICONWARNING);
          Exit;
        end;
      if ENAgreeJointObj.lineCableRef = nil then
        ENAgreeJointObj.lineCableRef := ENLineCableRef.Create;
      ENAgreeJointObj.lineCableRef.code :=
        StrToInt(sgENLineCable.Cells[0, sgENLineCable.Row]);
    end;
  //ENAgreeJointObj.agreeDate:= TXSDate.Create;
  try
    frmENAgreeJointEdit:=TfrmENAgreeJointEdit.Create(Application, dsInsert);
    try
      if frmENAgreeJointEdit.ShowModal = mrOk then
        begin
          if ENAgreeJointObj <> nil then
            //TempENAgreeJoint.add(ENAgreeJointObj);
            UpdateGrid(Sender);
        end;
    finally
      frmENAgreeJointEdit.Free;
      frmENAgreeJointEdit := nil;
    end;
  finally
    ENAgreeJointObj.Free;
  end;
end;

procedure TfrmENSubstation04Edit.actEditAgreeJointExecute(Sender: TObject);
Var TempENAgreeJoint: ENAgreeJointControllerSoapPort;
begin
  TempENAgreeJoint := HTTPRIOENAgreeJoint as ENAgreeJointControllerSoapPort;
  try
    ENAgreeJointObj := TempENAgreeJoint.getObject(
      StrToInt(sgENAgreeJoint.Cells[0, sgENAgreeJoint.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENAgreeJointEdit := TfrmENAgreeJointEdit.Create(Application, dsEdit);
  try
    if frmENAgreeJointEdit.ShowModal= mrOk then
      begin
        //TempENAgreeJoint.save(ENAgreeJointObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENAgreeJointEdit.Free;
    frmENAgreeJointEdit := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actDeleteAgreeJointExecute(
  Sender: TObject);
Var TempENAgreeJoint: ENAgreeJointControllerSoapPort;
  ObjCode: Integer;
begin
  TempENAgreeJoint := HTTPRIOENAgreeJoint as ENAgreeJointControllerSoapPort;
  try
    ObjCode := StrToInt(sgENAgreeJoint.Cells[0,sgENAgreeJoint.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(
    PChar('�� ������������� ������ ������� ������� � ���������� ������������� ������������?'),
    PChar('�������� !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENAgreeJoint.remove(ObjCode);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENSubstation04Edit.actDeleteAttachmentExecute(Sender: TObject);
var
  TempENDocAttachment : ENDocAttachmentControllerSoapPort;
  ObjCode : Integer;
begin
  try
    ObjCode := StrToInt(sgENDocAttachment.Cells[0, sgENDocAttachment.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('�� ����� ������ �������� ��������� ?'),
                            PChar('����� !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENDocAttachment := HTTPRIOENDocAttachment as ENDocAttachmentControllerSoapPort;
    TempENDocAttachment.remove(ObjCode);
    updateAttachments;
  end;
end;

procedure TfrmENSubstation04Edit.sgENLine10RowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
var i: Integer;
begin //������� �� ������������������ �� ��������� ����� ��������� � ���
  if not (rbENLine10.Checked) then
    Exit;
  for i := 1 to sgENAgreeJoint.RowCount - 1 do
    if sgENAgreeJoint.Cells[5, i] = TAdvStringGrid(Sender).Cells[0, NewRow] then
      begin
        sgENAgreeJoint.RowHeights[i] := 19;
        sgENAgreeJoint.Row := i;
      end
    else
      sgENAgreeJoint.RowHeights[i] := 0;
  sgENAgreeJoint.Update;
end;

procedure TfrmENSubstation04Edit.sgENLine10MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var Allow: Boolean;
begin
  if TAdvStringGrid(Sender).RowCount = 0 then
    Exit;
  sgENLine10.OnRowChanging(Sender, 0, TAdvStringGrid(Sender).Row, Allow);
end;

procedure TfrmENSubstation04Edit.sgENLine10KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var Button: TMouseButton; X, Y: Integer;
begin
  sgENLine10.OnMouseUp(Sender, Button, Shift, X, Y);
end;

procedure TfrmENSubstation04Edit.sgENLineCableRowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
var i: Integer;
begin //������� �� ������������������ �� ��������� ����� ��������� � ���
  if not (rbENLineCable.Checked) then
    Exit;
  for i := 1 to sgENAgreeJoint.RowCount - 1 do
    if sgENAgreeJoint.Cells[6, i] = TAdvStringGrid(Sender).Cells[0, NewRow] then
      begin
        sgENAgreeJoint.RowHeights[i] := 19;
        sgENAgreeJoint.Row := i;
      end
    else
      sgENAgreeJoint.RowHeights[i] := 0;
  sgENAgreeJoint.Update;
end;

procedure TfrmENSubstation04Edit.sgENLineCableMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var Allow: Boolean;
begin
  if TAdvStringGrid(Sender).RowCount = 0 then
    Exit;
  sgENLineCable.OnRowChanging(Sender, 0, TAdvStringGrid(Sender).Row, Allow);
end;

procedure TfrmENSubstation04Edit.sgENLineCableKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var Button: TMouseButton; X, Y: Integer;
begin
  sgENLineCable.OnMouseUp(Sender, Button, Shift, X, Y);
end;

procedure TfrmENSubstation04Edit.actFilterActExecute(Sender: TObject);
begin
  frmENActFilterEdit := TfrmENActFilterEdit.Create(Application, dsInsert);
  try
    ENActFilterObj := ENActFilter.Create;
    SetNullIntProps(ENActFilterObj);
    SetNullXSProps(ENActFilterObj);

    if frmENActFilterEdit.ShowModal = mrOk then
      begin
        if length(ENActFilterObj.conditionSQL) > 0 then
          ENActFilterObj.conditionSQL := ENActFilterObj.conditionSQL
            + ' AND ENACT.STATUSREFCODE <> ' + IntToStr(ENACT_CANCELED)
            + ' AND ENACT.ELEMENTCODE = '
            + IntToStr(ENSubstation04Obj.element.code)
        else
          ENActFilterObj.conditionSQL :=
            ' ENACT.STATUSREFCODE <> ' + IntToStr(ENACT_CANCELED)
            + ' AND ENACT.ELEMENTCODE = '
            + IntToStr(ENSubstation04Obj.element.code);
        actFilterObject := ENActFilterObj;
        actUpdateActExecute(Sender);
      end;
  finally
    frmENActFilterEdit.Free;
    frmENActFilterEdit := nil;
  end;
end;

procedure TfrmENSubstation04Edit.UpdateGridAct(Sender: TObject);
Var i, j: Integer;
begin
 for i := 1 to sgENAct.RowCount - 1 do
   for j := 0 to sgENAct.ColCount - 1 do
     sgENAct.Cells[j, i] := '';
 pcSubstation04Change(Sender);
end;

procedure TfrmENSubstation04Edit.actUpdateActExecute(Sender: TObject);
begin
  UpdateGridAct(Sender);
end;

procedure TfrmENSubstation04Edit.actUpdateAttachmentsExecute(Sender: TObject);
begin
  updateAttachments;
end;


procedure TfrmENSubstation04Edit.updateAttachments;
var
  TempENDocAttachment: ENDocAttachmentControllerSoapPort;
  ENDocAttachmentList: ENDocAttachmentShortList;
  docAttachmentFilter: ENDocAttachmentFilter;
  i, attachmentsCount: Integer;
begin
  ClearGrid(sgENDocAttachment);

  if DialogState = dsInsert then Exit;
  if ENSubstation04Obj = nil then Exit;
  if ENSubstation04Obj.element = nil then Exit;
  if ENSubstation04Obj.element.code = LOW_INT then Exit;

  TempENDocAttachment := HTTPRIOENDocAttachment as ENDocAttachmentControllerSoapPort;

  docAttachmentFilter := ENDocAttachmentFilter.Create;
  SetNullIntProps(docAttachmentFilter);
  SetNullXSProps(docAttachmentFilter);

  docAttachmentFilter.status := ENDocAttachmentStatusRef.Create;
  docAttachmentFilter.status.code := ENDOCATTACHMENTSTATUS_ACTIVE;

  docAttachmentFilter.conditionSQL := ' code in (select endocattachment2enlmnt.docattachmentrefcode '+
    ' from endocattachment2enlmnt where endocattachment2enlmnt.elementrefcode = ' + IntToStr(ENSubstation04Obj.element.code) + ')';

  ENDocAttachmentList := TempENDocAttachment.getScrollableFilteredList(docAttachmentFilter, 0, -1);

  attachmentsCount := High(ENDocAttachmentList.list);

  if attachmentsCount > -1 then
    sgENDocAttachment.RowCount := attachmentsCount + 2
  else
    sgENDocAttachment.RowCount := 2;

  with sgENDocAttachment do
    for i := 0 to attachmentsCount do
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

        sgENDocAttachment.RowCount := i + 2;
      end;

  sgENDocAttachment.Row := 1;

end;

procedure TfrmENSubstation04Edit.actViewActExecute(Sender: TObject);
var TempENAct: ENActControllerSoapPort;
begin
  TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

  frmENActEdit := TfrmENActEdit.Create(Application, dsView);
  try
    try
      frmENActEdit.ENActObj := TempENAct.getObject(StrToInt(sgENAct.Cells[0, sgENAct.Row]));
    except
      on EConvertError do Exit;
    end;

    if frmENActEdit.ShowModal in [mrOk, mrYes ] then
      begin
        //TempENAct.save(ENActObj);
        UpdateGridAct(Sender);
      end;
  finally
    frmENActEdit.Free;
    frmENActEdit := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actNoFilterActExecute(Sender: TObject);
begin
  actFilterObject.Free;
  actFilterObject := nil;
  UpdateGridAct(Sender);
end;

procedure TfrmENSubstation04Edit.actViewPlanWorkExecute(Sender: TObject);
var TempENPlanWork: ENPlanWorkControllerSoapPort;
  tPlan : ENPlanWork; objCode : Integer;
begin
  try
    objCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;
  tPlan := DMReports.getPlanByCode(objCode);
  if tPlan = nil then
    Exit;
  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  selectedPWRow := sgENPlanWork.Row;
  frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsView);
  if (tPlan.typeRef.code = ENPLANWORKTYPE_TRANSPORT)
  and (tPlan.stateRef.code = ENPLANWORKSTATE_GSM) then
    frmENPlanWorkEdit.isTransport := True;
  if (tPlan.typeRef.code = ENPLANWORKTYPE_SIZ) then
    frmENPlanWorkEdit.isSiz := True;
  try
    try
      frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(objCode);
    except
      on EConvertError do Exit;
    end;
    frmENPlanWorkEdit.ShowModal;
  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actUpdatePlanWorkExecute(Sender: TObject);
begin
  selectedPWRow := sgENPlanWork.Row;
  UpdateGridPW(Sender);
  if  sgENPlanWork.RowCount > selectedPWRow then
    sgENPlanWork.Row := selectedPWRow
  else
     sgENPlanWork.Row :=  sgENPlanWork.RowCount - 1;
end;

procedure TfrmENSubstation04Edit.UpdateGridPW(Sender: TObject);
var i, j: Integer;
begin
  for i := 1 to sgENPlanWork.RowCount - 1 do
    for j := 0 to sgENPlanWork.ColCount - 1 do
      begin
        sgENPlanWork.Cells[j, i] := '';
        sgENPlanWork.Objects[0, i] := nil;
      end;
  pcSubstation04Change(Sender);
end;

procedure TfrmENSubstation04Edit.actFilterPlanWorkExecute(Sender: TObject);
var condition: String;
begin
  frmENPlanWorkFilterEdit :=
    TfrmENPlanWorkFilterEdit.Create(Application, dsInsert);
  try
    ENPlanWorkFilterObj := ENPlanWorkFilter.Create;
    SetNullIntProps(ENPlanWorkFilterObj);
    SetNullXSProps(ENPlanWorkFilterObj);
    frmENPlanWorkFilterEdit.disableControlsType := disableControlsTypePW;
    if frmENPlanWorkFilterEdit.ShowModal = mrOk then
      begin
        pwFilterObject := ENPlanWorkFilter.Create;

        outerPWCondition := ' ENPLANWORK.STATUSCODE = '
          + IntToStr(ENPLANWORKSTATUS_GOOD)
          + ' AND ENPLANWORK.KINDCODE <> '
          + IntToStr(ENPLANWORKKIND_CALCULATION_SINGLE)
          + 'AND ENPLANWORK.ELEMENTREFCODE = '
          + IntToStr(ENSubstation04Obj.element.code);

        if outerPWCondition <> '' then
          begin
            condition := ENPlanWorkFilterObj.conditionSQL;
            AddCondition(condition, outerPWCondition);
            ENPlanWorkFilterObj.conditionSQL := condition;
          end;
        pwFilterObject := ENPlanWorkFilterObj;
        //isPWFiltered := True;
        actUpdatePlanWorkExecute(Sender);
      end;
    ENPlanWorkFilterObj := nil;
  finally
    frmENPlanWorkFilterEdit.Free;
    frmENPlanWorkFilterEdit := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actNoFilterPlanWorkExecute(Sender: TObject);
begin
  pwFilterObject.Free;
  pwFilterObject := nil;
  UpdateGridPW(Sender);
end;

procedure TfrmENSubstation04Edit.sgENActDblClick(Sender: TObject);
begin
  actViewActExecute(nil);
end;

procedure TfrmENSubstation04Edit.sgENPlanWorkDblClick(Sender: TObject);
begin
  actViewPlanWorkExecute(nil);
end;

procedure TfrmENSubstation04Edit.actS04_TransformerFiderGaugeExecute(
  Sender: TObject);
var
  argNames, args : EnergyProController.ArrayOfString;
  reportName : String;
begin
  if sgENTransformer.Row = -1 then
    begin
      Application.MessageBox(PChar('�������� ������������� � ������!'),
        PChar('��������!'), MB_ICONWARNING + MB_OK);
      Exit;
    end
  else if sgENTransformer.Cells[0, sgENTransformer.Row] = '' then
    begin
      Application.MessageBox(PChar('�������� �������������!'),
        PChar('��������!'), MB_ICONWARNING + MB_OK);
      Exit;
    end;
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'transformerCode';
  args[0] := sgENTransformer.Cells[0, sgENTransformer.Row];

  reportName := 'Passport/S04_TransformerFiderGauge/S04_TransformerFiderGauge';
  makeReport(reportName, argNames, args, 'xls');
end;


procedure TfrmENSubstation04Edit.actSendToSigningExecute(Sender: TObject);
var
  sheetCode: Integer;
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
  try
    sheetCode := StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('�� ����� ������ ��������� ���� ������ �� �����?'),
                  PChar('�����!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENInspectionSheet.sendToSigning(sheetCode);
    pcSubstation04Change(Sender);
  end;
end;


procedure TfrmENSubstation04Edit.actSignedExecute(Sender: TObject);
var
  sheetCode: Integer;
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
  try
    sheetCode := StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('�� ����� ������ �������� ���� ������?'),
                  PChar('�����!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENInspectionSheet.signed(sheetCode);
    pcSubstation04Change(Sender);
  end;
end;


procedure TfrmENSubstation04Edit.btnFiderGaugeClick(Sender: TObject);
begin
  frmFiderGauge := TfrmFiderGauge.Create(Application, DialogState);
  try
    frmFiderGauge.codeS04 := ENSubstation04Obj.code;
    frmFiderGauge.nameS04 := ENSubstation04Obj.name;
    frmFiderGauge.elementCodeS04 := ENSubstation04Obj.element.code;
    if frmFiderGauge.ShowModal = mrOk then
      begin
      end;
  except
    on EConvertError do Exit;
  end;
end;

procedure TfrmENSubstation04Edit.btnGeographClearClick(Sender: TObject);
begin
  ENSubstation04Obj.element.geoDepartmentRef.code := LOW_INT;
  edtGeograph.Text := '';
end;

procedure TfrmENSubstation04Edit.btnGeographClick(Sender: TObject);
var
   frmENGeographicDepartmentShow: TfrmENGeographicDepartmentShow;
   Filter : ENGeographicDepartmentFilter;
   selected : ENGeographicDepartmentShort;
begin
  Filter := ENGeographicDepartmentFilter.Create;
  SetNullIntProps(Filter);
  SetNullXSProps(Filter);


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
                 ENSubstation04Obj.element.geoDepartmentRef.code := selected.code;
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

//�������� ������� ���� ���
procedure TfrmENSubstation04Edit.actViewLowVoltBoardExecute(Sender: TObject);
Var TempENLowVoltBoard: ENLowVoltBoardControllerSoapPort;
begin
  TempENLowVoltBoard :=
    HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
  try
    ENLowVoltBoardObj := TempENLowVoltBoard.getObject(
      StrToInt(sgENLowVoltBoard.Cells[0, sgENLowVoltBoard.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENLowVoltBoardEdit := TfrmENLowVoltBoardEdit.Create(Application, dsView);
  try
    frmENLowVoltBoardEdit.s04Code := ENSubstation04Obj.code;
    frmENLowVoltBoardEdit.ShowModal;
  finally
    frmENLowVoltBoardEdit.Free;
    frmENLowVoltBoardEdit := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actEditLowVoltBoardExecute(
  Sender: TObject);
Var TempENLowVoltBoard: ENLowVoltBoardControllerSoapPort;
begin
  TempENLowVoltBoard :=
    HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
  try
    ENLowVoltBoardObj := TempENLowVoltBoard.getObject(
      StrToInt(sgENLowVoltBoard.Cells[0,sgENLowVoltBoard.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENLowVoltBoardEdit := TfrmENLowVoltBoardEdit.Create(Application, dsEdit);
  try
    frmENLowVoltBoardEdit.s04Code := ENSubstation04Obj.code;
  if frmENLowVoltBoardEdit.ShowModal= mrOk then
    actUpdateLowVoltBoardExecute(Sender);
  finally
    frmENLowVoltBoardEdit.Free;
    frmENLowVoltBoardEdit := nil;
  end;
end;

procedure TfrmENSubstation04Edit.actUpdateLowVoltBoardExecute(
  Sender: TObject);
var TempENLowVoltBoard: ENLowVoltBoardControllerSoapPort;
  ENLowVoltBoardList: ENLowVoltBoardShortList; i: Integer;
begin
  lvbColCount := 2;
  TempENLowVoltBoard :=
    HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;

  if lvbFilterObject = nil then
    begin
      lvbFilterObject := ENLowVoltBoardFilter.Create;
      SetNullIntProps(lvbFilterObject);
      SetNullXSProps(lvbFilterObject);
    end;

  if lvbFilterObject.substation04Ref = nil then
    lvbFilterObject.substation04Ref := ENSubstation04Ref.Create;

  lvbFilterObject.substation04Ref.code := ENSubstation04Obj.code;

  ENLowVoltBoardList := TempENLowVoltBoard.getScrollableFilteredList(
    ENLowVoltBoardFilter(lvbFilterObject),0,lvbColCount);

  lvbLastCount:=High(ENLowVoltBoardList.list);

  if lvbLastCount = -1 then
    begin
      ENLowVoltBoardObj := ENLowVoltBoard.Create;
      ENLowVoltBoardObj.code := low(Integer);
      ENLowVoltBoardObj.name :=
        '������� �������������� ������� ���. ' + ENSubstation04Obj.name;

      if ENLowVoltBoardObj.element = nil then
        ENLowVoltBoardObj.element := ENElement.Create;
      if ENLowVoltBoardObj.element.renRef = nil then
        ENLowVoltBoardObj.element.renRef := EPRenRef.Create;
      ENLowVoltBoardObj.element.renRef.code :=
        ENSubstation04Obj.element.renRef.code;

      if ENLowVoltBoardObj.substation04Ref = nil then
        ENLowVoltBoardObj.substation04Ref := ENSubstation04Ref.Create;
      ENLowVoltBoardObj.substation04Ref.code := ENSubstation04Obj.code;

      TempENLowVoltBoard.add(ENLowVoltBoardObj);
      ENLowVoltBoardList := TempENLowVoltBoard.getScrollableFilteredList(
        ENLowVoltBoardFilter(lvbFilterObject), 0, lvbColCount);
      lvbLastCount:=High(ENLowVoltBoardList.list);
    end;

  if lvbLastCount > -1 then
     sgENLowVoltBoard.RowCount:=lvbLastCount+2
  else
     sgENLowVoltBoard.RowCount := 2;

  with sgENLowVoltBoard do
    for i := 0 to lvbLastCount do
      begin
        Application.ProcessMessages;
        if ENLowVoltBoardList.list[i].code <> Low(Integer) then
        Cells[0, i + 1] := IntToStr(ENLowVoltBoardList.list[i].code)
        else
        Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENLowVoltBoardList.list[i].name;
        Cells[2, i + 1] := ENLowVoltBoardList.list[i].transformerRefName;
        if ENLowVoltBoardList.list[i].transformerRefNominalPower <> nil then
          Cells[2, i + 1] := Cells[2, i + 1] + '. P = '
            + ENLowVoltBoardList.list[
              i].transformerRefNominalPower.DecimalString + ' ���';
        if ENLowVoltBoardList.list[i].transformerRefCode <> low(Integer) then
          Cells[3, i + 1] :=
            IntToStr(ENLowVoltBoardList.list[i].transformerRefCode)
        else
          Cells[3, i + 1] := '';
        lvbLastRow := i + 1;
        sgENLowVoltBoard.RowCount := lvbLastRow + 1;
      end;
  lvbColCount:=lvbColCount+1;
  sgENLowVoltBoard.Row:=1;

end;

//������� ����� ��������������
procedure TfrmENSubstation04Edit.actHistoryDisconnectorExecute(
  Sender: TObject);
var ENDisconnectorChangeFilterObj: ENDisconnectorChangeFilter;
  fENDisconnectorChangeShow: TfrmENDisconnectorChangeShow;
  //TempENDisconnectorChange: ENDisconnectorChangeControllerSoapPort;
  condition, s04Condition: String;
begin
  ENDisconnectorChangeFilterObj := ENDisconnectorChangeFilter.Create;
  SetNullIntProps(ENDisconnectorChangeFilterObj);
  SetNullXSProps(ENDisconnectorChangeFilterObj);
  if ENSubstation04Obj <> nil then
    begin
      s04Condition := ' ENDISCONNECTORCHANGE.SUBSTATION04REFCODE = '
        + IntToStr(ENSubstation04Obj.code);
      if s04Condition <> '' then
        AddCondition(condition, s04Condition);
      if ENDisconnectorChangeFilterObj.conditionSQL <> '' then
        ENDisconnectorChangeFilterObj.conditionSQL :=
          ENDisconnectorChangeFilterObj.conditionSQL + ' AND ' + condition
      else
        ENDisconnectorChangeFilterObj.conditionSQL := condition;
    end;
  fENDisconnectorChangeShow := TfrmENDisconnectorChangeShow.Create(
    Application, fmNormal, ENDisconnectorChangeFilterObj);
  with fENDisconnectorChangeShow do
    DisableActions([actView, actInsert, actEdit, actDelete]);
  try
    fENDisconnectorChangeShow.ShowModal;
  finally
    fENDisconnectorChangeShow.Free;
    if ENDisconnectorChangeObj <> nil then
      UpdateGrid(Sender);
  end;
end;

//������� ����� ������������ ��������
procedure TfrmENSubstation04Edit.actHistoryLoadSwitchExecute(
  Sender: TObject);
var ENLoadSwitchChangeFilterObj: ENLoadSwitchChangeFilter;
  fENLoadSwitchChangeShow: TfrmENLoadSwitchChangeShow;
  //TempENLoadSwitchChange: ENLoadSwitchChangeControllerSoapPort;
  condition, s04Condition: String;
begin
  ENLoadSwitchChangeFilterObj := ENLoadSwitchChangeFilter.Create;
  SetNullIntProps(ENLoadSwitchChangeFilterObj);
  SetNullXSProps(ENLoadSwitchChangeFilterObj);
  if ENSubstation04Obj <> nil then
    begin
      s04Condition := ' ENLOADSWITCHCHANGE.SUBSTATION04REFCODE = '
        + IntToStr(ENSubstation04Obj.code);
      if s04Condition <> '' then
        AddCondition(condition, s04Condition);
      if ENLoadSwitchChangeFilterObj.conditionSQL <> '' then
        ENLoadSwitchChangeFilterObj.conditionSQL :=
          ENLoadSwitchChangeFilterObj.conditionSQL + ' AND ' + condition
      else
        ENLoadSwitchChangeFilterObj.conditionSQL := condition;
    end;
  fENLoadSwitchChangeShow := TfrmENLoadSwitchChangeShow.Create(
    Application, fmNormal, ENLoadSwitchChangeFilterObj);
  with fENLoadSwitchChangeShow do
    DisableActions([actView, actInsert, actEdit, actDelete]);
  try
    fENLoadSwitchChangeShow.ShowModal;
  finally
    fENLoadSwitchChangeShow.Free;
    if ENLoadSwitchChangeObj <> nil then
      UpdateGrid(Sender);
  end;
end;

//������� ����� ���������������
procedure TfrmENSubstation04Edit.actHistoryFuseExecute(Sender: TObject);
var ENFuseChangeFilterObj: ENFuseChangeFilter;
  fENFuseChangeShow: TfrmENFuseChangeShow;
  //TempENFuseChange: ENFuseChangeControllerSoapPort;
  condition, s04Condition: String;
begin
  ENFuseChangeFilterObj := ENFuseChangeFilter.Create;
  SetNullIntProps(ENFuseChangeFilterObj);
  SetNullXSProps(ENFuseChangeFilterObj);
  if ENSubstation04Obj <> nil then
    begin
      s04Condition := ' ENFUSECHANGE.SUBSTATION04REFCODE = '
        + IntToStr(ENSubstation04Obj.code);
      if s04Condition <> '' then
        AddCondition(condition, s04Condition);
      if ENFuseChangeFilterObj.conditionSQL <> '' then
        ENFuseChangeFilterObj.conditionSQL :=
          ENFuseChangeFilterObj.conditionSQL + ' AND ' + condition
      else
        ENFuseChangeFilterObj.conditionSQL := condition;
    end;
  fENFuseChangeShow := TfrmENFuseChangeShow.Create(
    Application, fmNormal, ENFuseChangeFilterObj);
  with fENFuseChangeShow do
    DisableActions([actView, actInsert, actEdit, actDelete]);
  try
    fENFuseChangeShow.ShowModal;
  finally
    fENFuseChangeShow.Free;
    if ENFuseChangeObj <> nil then
      UpdateGrid(Sender);
  end;
end;

//������� ����� ����������
procedure TfrmENSubstation04Edit.actHistoryInsulatorExecute(
  Sender: TObject);
var ENInsulatorChangeFilterObj: ENInsulatorChangeFilter;
  fENInsulatorChangeShow: TfrmENInsulatorChangeShow;
  //TempENInsulatorChange: ENInsulatorChangeControllerSoapPort;
  condition, s04Condition: String;
begin
  ENInsulatorChangeFilterObj := ENInsulatorChangeFilter.Create;
  SetNullIntProps(ENInsulatorChangeFilterObj);
  SetNullXSProps(ENInsulatorChangeFilterObj);
  if ENSubstation04Obj <> nil then
    begin
      s04Condition := ' ENINSULATORCHANGE.SUBSTATION04REFCODE = '
        + IntToStr(ENSubstation04Obj.code);
      if s04Condition <> '' then
        AddCondition(condition, s04Condition);
      if ENInsulatorChangeFilterObj.conditionSQL <> '' then
        ENInsulatorChangeFilterObj.conditionSQL :=
          ENInsulatorChangeFilterObj.conditionSQL + ' AND ' + condition
      else
        ENInsulatorChangeFilterObj.conditionSQL := condition;
    end;
  fENInsulatorChangeShow := TfrmENInsulatorChangeShow.Create(
    Application, fmNormal, ENInsulatorChangeFilterObj);
  with fENInsulatorChangeShow do
    DisableActions([actView, actInsert, actEdit, actDelete]);
  try
    fENInsulatorChangeShow.ShowModal;
  finally
    fENInsulatorChangeShow.Free;
    if ENInsulatorChangeObj <> nil then
      UpdateGrid(Sender);
  end;
end;

//������� ����� �����������
procedure TfrmENSubstation04Edit.actHistoryArresterExecute(
  Sender: TObject);
var ENArresterChangeFilterObj: ENArresterChangeFilter;
  fENArresterChangeShow: TfrmENArresterChangeShow;
  //TempENArresterChange: ENArresterChangeControllerSoapPort;
  condition, s04Condition: String;
begin
  ENArresterChangeFilterObj := ENArresterChangeFilter.Create;
  SetNullIntProps(ENArresterChangeFilterObj);
  SetNullXSProps(ENArresterChangeFilterObj);
  if ENSubstation04Obj <> nil then
    begin
      s04Condition := ' ENARRESTERCHANGE.SUBSTATION04REFCODE = '
        + IntToStr(ENSubstation04Obj.code);
      if s04Condition <> '' then
        AddCondition(condition, s04Condition);
      if ENArresterChangeFilterObj.conditionSQL <> '' then
        ENArresterChangeFilterObj.conditionSQL :=
          ENArresterChangeFilterObj.conditionSQL + ' AND ' + condition
      else
        ENArresterChangeFilterObj.conditionSQL := condition;
    end;
  fENArresterChangeShow := TfrmENArresterChangeShow.Create(
    Application, fmNormal, ENArresterChangeFilterObj);
  with fENArresterChangeShow do
    DisableActions([actView, actInsert, actEdit, actDelete]);
  try
    fENArresterChangeShow.ShowModal;
  finally
    fENArresterChangeShow.Free;
    if ENArresterChangeObj <> nil then
      UpdateGrid(Sender);
  end;
end;

//������� ����� ��������������� ����
procedure TfrmENSubstation04Edit.actHistoryCurrentTransformerExecute(
  Sender: TObject);
var ENCurTransformerChangeFilterObj: ENCurTransformerChangeFilter;
  fENCurTransformerChangeShow: TfrmENCurTransformerChangeShow;
  //TempENCurTransformerChange: ENCurTransformerChangeControllerSoapPort;
  condition, s04Condition: String;
begin
  ENCurTransformerChangeFilterObj := ENCurTransformerChangeFilter.Create;
  SetNullIntProps(ENCurTransformerChangeFilterObj);
  SetNullXSProps(ENCurTransformerChangeFilterObj);
  if ENSubstation04Obj <> nil then
    begin
      s04Condition := ' ENCURTRANSFORMERCHANGE.SUBSTATION04REFCODE = '
        + IntToStr(ENSubstation04Obj.code);
      if s04Condition <> '' then
        AddCondition(condition, s04Condition);
      if ENCurTransformerChangeFilterObj.conditionSQL <> '' then
        ENCurTransformerChangeFilterObj.conditionSQL :=
          ENCurTransformerChangeFilterObj.conditionSQL + ' AND ' + condition
      else
        ENCurTransformerChangeFilterObj.conditionSQL := condition;
    end;
  fENCurTransformerChangeShow := TfrmENCurTransformerChangeShow.Create(
    Application, fmNormal, ENCurTransformerChangeFilterObj);
  with fENCurTransformerChangeShow do
    DisableActions([actView, actInsert, actEdit, actDelete]);
  try
    fENCurTransformerChangeShow.ShowModal;
  finally
    fENCurTransformerChangeShow.Free;
    if ENCurTransformerChangeObj <> nil then
      UpdateGrid(Sender);
  end;
end;

//������� ����� ������������� ���
procedure TfrmENSubstation04Edit.actHistoryBusExecute(Sender: TObject);
var ENBusChangeFilterObj: ENBusChangeFilter;
  fENBusChangeShow: TfrmENBusChangeShow;
  //TempENBusChange: ENBusChangeControllerSoapPort;
  condition, s04Condition: String;
begin
  ENBusChangeFilterObj := ENBusChangeFilter.Create;
  SetNullIntProps(ENBusChangeFilterObj);
  SetNullXSProps(ENBusChangeFilterObj);
  if ENSubstation04Obj <> nil then
    begin
      s04Condition := ' ENBUSCHANGE.SUBSTATION04REFCODE = '
        + IntToStr(ENSubstation04Obj.code);
      if s04Condition <> '' then
        AddCondition(condition, s04Condition);
      if ENBusChangeFilterObj.conditionSQL <> '' then
        ENBusChangeFilterObj.conditionSQL :=
          ENBusChangeFilterObj.conditionSQL + ' AND ' + condition
      else
        ENBusChangeFilterObj.conditionSQL := condition;
    end;
  fENBusChangeShow := TfrmENBusChangeShow.Create(
    Application, fmNormal, ENBusChangeFilterObj);
  with fENBusChangeShow do
    DisableActions([actView, actInsert, actEdit, actDelete]);
  try
    fENBusChangeShow.ShowModal;
  finally
    fENBusChangeShow.Free;
    if ENBusChangeObj <> nil then
      UpdateGrid(Sender);
  end;
end;

//������� ����� ������������� ��������
procedure TfrmENSubstation04Edit.actHistoryMeasurDeviceExecute(
  Sender: TObject);
var ENMeasurDevChangeFilterObj: ENMeasurDevChangeFilter;
  fENMeasurDevChangeShow: TfrmENMeasurDevChangeShow;
  //TempENMeasurDevChange: ENMeasurDevChangeControllerSoapPort;
  condition, s04Condition: String;
begin
  ENMeasurDevChangeFilterObj := ENMeasurDevChangeFilter.Create;
  SetNullIntProps(ENMeasurDevChangeFilterObj);
  SetNullXSProps(ENMeasurDevChangeFilterObj);
  if ENSubstation04Obj <> nil then
    begin
      s04Condition := ' ENMEASURDEVCHANGE.SUBSTATION04REFCODE = '
        + IntToStr(ENSubstation04Obj.code);
      if s04Condition <> '' then
        AddCondition(condition, s04Condition);
      if ENMeasurDevChangeFilterObj.conditionSQL <> '' then
        ENMeasurDevChangeFilterObj.conditionSQL :=
          ENMeasurDevChangeFilterObj.conditionSQL + ' AND ' + condition
      else
        ENMeasurDevChangeFilterObj.conditionSQL := condition;
    end;
  fENMeasurDevChangeShow := TfrmENMeasurDevChangeShow.Create(
    Application, fmNormal, ENMeasurDevChangeFilterObj);
  with fENMeasurDevChangeShow do
    DisableActions([actView, actInsert, actEdit, actDelete]);
  try
    fENMeasurDevChangeShow.ShowModal;
  finally
    fENMeasurDevChangeShow.Free;
    if ENMeasurDevChangeObj <> nil then
      UpdateGrid(Sender);
  end;
end;

//������� ����� �����������
procedure TfrmENSubstation04Edit.actHistoryContactBreakerExecute(
  Sender: TObject);
var ENContBreakChangeFilterObj: ENContBreakChangeFilter;
  fENContBreakChangeShow: TfrmENContBreakChangeShow;
  //TempENContBreakChange: ENContBreakChangeControllerSoapPort;
  condition, s04Condition: String;
begin
  ENContBreakChangeFilterObj := ENContBreakChangeFilter.Create;
  SetNullIntProps(ENContBreakChangeFilterObj);
  SetNullXSProps(ENContBreakChangeFilterObj);
  if ENSubstation04Obj <> nil then
    begin
      s04Condition := ' ENCONTBREAKCHANGE.SUBSTATION04REFCODE = '
        + IntToStr(ENSubstation04Obj.code);
      if s04Condition <> '' then
        AddCondition(condition, s04Condition);
      if ENContBreakChangeFilterObj.conditionSQL <> '' then
        ENContBreakChangeFilterObj.conditionSQL :=
          ENContBreakChangeFilterObj.conditionSQL + ' AND ' + condition
      else
        ENContBreakChangeFilterObj.conditionSQL := condition;
    end;
  fENContBreakChangeShow := TfrmENContBreakChangeShow.Create(
    Application, fmNormal, ENContBreakChangeFilterObj);
  with fENContBreakChangeShow do
    DisableActions([actView, actInsert, actEdit, actDelete]);
  try
    fENContBreakChangeShow.ShowModal;
  finally
    fENContBreakChangeShow.Free;
    if ENContBreakChangeObj <> nil then
      UpdateGrid(Sender);
  end;
end;

//������� ����� �������������� ������������
procedure TfrmENSubstation04Edit.actHistoryAutomatExecute(Sender: TObject);
var ENAutomatChangeFilterObj: ENAutomatChangeFilter;
  fENAutomatChangeShow: TfrmENAutomatChangeShow;
  //TempENAutomatChange: ENAutomatChangeControllerSoapPort;
  condition, s04Condition: String;
begin
  ENAutomatChangeFilterObj := ENAutomatChangeFilter.Create;
  SetNullIntProps(ENAutomatChangeFilterObj);
  SetNullXSProps(ENAutomatChangeFilterObj);
  if ENSubstation04Obj <> nil then
    begin
      s04Condition := ' ENAUTOMATCHANGE.SUBSTATION04REFCODE = '
        + IntToStr(ENSubstation04Obj.code);
      if s04Condition <> '' then
        AddCondition(condition, s04Condition);
      if ENAutomatChangeFilterObj.conditionSQL <> '' then
        ENAutomatChangeFilterObj.conditionSQL :=
          ENAutomatChangeFilterObj.conditionSQL + ' AND ' + condition
      else
        ENAutomatChangeFilterObj.conditionSQL := condition;
    end;
  fENAutomatChangeShow := TfrmENAutomatChangeShow.Create(
    Application, fmNormal, ENAutomatChangeFilterObj);
  with fENAutomatChangeShow do
    DisableActions([actView, actInsert, actEdit, actDelete]);
  try
    fENAutomatChangeShow.ShowModal;
  finally
    fENAutomatChangeShow.Free;
    if ENAutomatChangeObj <> nil then
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSubstation04Edit.sgCCDamageLogDblClick(Sender: TObject);
Var
   TempCCDamageLog: CCDamageLogControllerSoapPort;
begin
   TempCCDamageLog := HTTPRIOCCDamageLog as CCDamageLogControllerSoapPort;

   frmCCDamageLogEdit:=TfrmCCDamageLogEdit.Create(Application, dsView);
   try
     frmCCDamageLogEdit.CCDamageLogObj := TempCCDamageLog.getObject(StrToInt(sgCCDamageLog.Cells[0,sgCCDamageLog.Row]));
   except
   on EConvertError do Exit;
   end;
   try
     frmCCDamageLogEdit.ShowModal;
   finally
     frmCCDamageLogEdit.Free;
     frmCCDamageLogEdit:=nil;
   end;
end;

procedure TfrmENSubstation04Edit.sgCCElementDataDblClick(Sender: TObject);
var
  TempCCElementData: CCElementDataControllerSoapPort;
begin
  TempCCElementData := HTTPRIOCCElementData as CCElementDataControllerSoapPort;
  try
    CCElementDataObj := TempCCElementData.getObject(StrToInt(sgCCElementData.Cells[0,sgCCElementData.Row]));
  except
    on EConvertError do Exit;
  end;

  frmCCElementDataEdit:=TfrmCCElementDataEdit.Create(Application, dsView);

  try
    frmCCElementDataEdit.ShowModal;
  finally
    frmCCElementDataEdit.Free;
    frmCCElementDataEdit:=nil;
  end;
end;

procedure TfrmENSubstation04Edit.sgCNPackRowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
begin
  sgSPL_PP_Pack.Clear;
  memCNPack.Clear;
  if NewRow >= 1 then
    begin
      if sgCNPack.Cells[17, NewRow] <> '' then
        memCNPack.Text := sgCNPack.Cells[17, NewRow]
      else if sgCNPack.Cells[5, NewRow] <> '' then
        memCNPack.Text := memCNPack.Text + sgCNPack.Cells[5, NewRow];
      memCNPack.Text := memCNPack.Text + #13#10;
      if sgCNPack.Cells[3, NewRow] <> '' then
        memCNPack.Text := memCNPack.Text + sgCNPack.Cells[3, NewRow];
      if sgCNPack.Cells[8, NewRow] <> '' then
        memCNPack.Text := memCNPack.Text + '. ' + sgCNPack.Cells[8, NewRow];
      if sgCNPack.Cells[6, NewRow] <> '' then
        memCNPack.Text := memCNPack.Text + '. ' + sgCNPack.Cells[6, NewRow];
      if sgCNPack.Cells[9, NewRow] <> '' then
        memCNPack.Text := memCNPack.Text + ' ���. ��������� � '
          + sgCNPack.Cells[9, NewRow];
      if sgCNPack.Cells[10, NewRow] <> '' then
        memCNPack.Text := memCNPack.Text + ' �� '
          + sgCNPack.Cells[10, NewRow];
      if sgCNPack.Cells[13, NewRow] <> '' then
        memCNPack.Text := memCNPack.Text + ' ���. ��� �������� �� � '
          + sgCNPack.Cells[13, NewRow];
      if sgCNPack.Cells[14, NewRow] <> '' then
        memCNPack.Text := memCNPack.Text + ' �� '
          + sgCNPack.Cells[14, NewRow];
      if sgCNPack.Cells[15, NewRow] <> '' then
        memCNPack.Text := memCNPack.Text + ' ������ � '
          + sgCNPack.Cells[15, NewRow];
      if sgCNPack.Cells[16, NewRow] <> '' then
        memCNPack.Text := memCNPack.Text + ' ��������� '
          + sgCNPack.Cells[16, NewRow];
      if (sgCNPack.Cells[1, NewRow] <> '')
      and (sgCNPack.Objects[4, NewRow] <> nil) then
        begin
          rowCN := NewRow;
          actUpdateSPL_PPExecute(nil);
        end;
    end; //if NewRow >= 1 then
end;

procedure TfrmENSubstation04Edit.actUpdateCNExecute(Sender: TObject);
var TempCNPack: CNPackControllerSoapPort;
  CNPackList: CNPackShortList;
  i, powInc: Integer; Allow: Boolean;
  sumPowerInfluence: Double; isInfluence: Boolean;
begin
  sumPowerInfluence := 0;
  SetGridHeaders(CNPackHeaders, sgCNPack.ColumnHeaders);
  cnpColCount := 100;
  TempCNPack :=  HTTPRIOCNPack as CNPackControllerSoapPort;
  cnpFilterObject := CNPackFilter.Create();
  SetNullIntProps(cnpFilterObject);
  SetNullXSProps(cnpFilterObject);
  cnpFilterObject.conditionSQL :=
    '  case p.subsystemcode ' + #13#10 +
    '    when 1 ' + #13#10 +
    '      then p.id in (select id_pack from cn.cn_enlines ' + #13#10 +
    '        where code_substation04 = '
               + IntToStr(ENSubstation04Obj.code) + ') ' + #13#10 +
    '    when 13 ' + #13#10 +
    '      then p.id in (select id_pack from cn.ncn_enlines ' + #13#10 +
    '        where code_substation04 = '
               + IntToStr(ENSubstation04Obj.code) + ') ' + #13#10 +
    '    when 18 ' + #13#10 +
    '      then p.id in (select id_pack from cn.cn_20110314_enlines ' + #13#10 +
    '        where code_substation04 = '
               + IntToStr(ENSubstation04Obj.code) + ') ' + #13#10 +
    '    when 20 ' + #13#10 +
    '      then p.id in (select id_pack from cn.eap_enlines ' + #13#10 +
    '        where code_substation04 = '
               + IntToStr(ENSubstation04Obj.code) + ') ' + #13#10 +
    '    when 26 ' + #13#10 +
    '      then p.id in (select id_pack from cn.adso_enlines ' + #13#10 +
    '        where code_substation04 = '
               + IntToStr(ENSubstation04Obj.code) + ') ' + #13#10 +
    '  end ';

  CNPackList := TempCNPack.getCNPackCurStateList(
    CNPackFilter(cnpFilterObject), 0, cnpColCount);

  cnpLastCount := High(CNPackList.list);

  if cnpLastCount > -1 then
    sgCNPack.RowCount := cnpLastCount + 2
  else
    sgCNPack.RowCount := 2;

  with sgCNPack do
    for i := 0 to cnpLastCount do
      begin
        Application.ProcessMessages;
        if CNPackList.list[i].code <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(CNPackList.list[i].code)
        else
          Cells[0, i + 1] := '';
        if CNPackList.list[i].packCode = Low(Integer) then
          Cells[1, i + 1] := ''
        else
          Cells[1, i + 1] := IntToStr(CNPackList.list[i].packCode);
        Cells[2, i + 1] := CNPackList.list[i].name;
        Cells[3, i + 1] := CNPackList.list[i].renName;
        Cells[4, i + 1] := CNPackList.list[i].subsystemRefName; //***
        Objects[4, i + 1] := TObject(CNPackList.list[i].subsystemRefCode); //***
        Cells[5, i + 1] := CNPackList.list[i].statusName;
        Cells[6, i + 1] := CNPackList.list[i].description;

        if CNPackList.list[i].power = nil then
          Cells[7, i + 1] := ''
        else
          Cells[7, i + 1] := CNPackList.list[i].power.DecimalString;
        if CNPackList.list[i].pow_exist = nil then
          Cells[8, i + 1] := ''
        else
          Cells[8, i + 1] := CNPackList.list[i].pow_exist.DecimalString;
        Cells[9, i + 1] := CNPackList.list[i].address;
        Cells[10, i + 1] := CNPackList.list[i].reg_num_cn_contract;
        if CNPackList.list[i].date_cn_contract = nil then
          Cells[11, i + 1] := ''
        else
          Cells[11, i + 1] :=
            XSDate2String(CNPackList.list[i].date_cn_contract);
        Cells[12, i + 1] := CNPackList.list[i].reg_num_tu_contract;
        if CNPackList.list[i].date_tu_contract = nil then
          Cells[13, i + 1] := ''
        else
          Cells[13, i + 1] :=
            XSDate2String(CNPackList.list[i].date_tu_contract);
        Cells[14, i + 1] := CNPackList.list[i].reg_num_tu_cr_contract;
        if CNPackList.list[i].date_tu_cr_contract = nil then
          Cells[15, i + 1] := ''
        else
          Cells[15, i + 1] :=
            XSDate2String(CNPackList.list[i].date_tu_cr_contract);
        Cells[16, i + 1] := CNPackList.list[i].project_num;
        if CNPackList.list[i].project_date = nil then
          Cells[17, i + 1] := ''
        else
          Cells[17, i + 1] := XSDate2String(CNPackList.list[i].project_date);
        Cells[18, i + 1] := CNPackList.list[i].cur_state;

        if CNPackList.list[i].tension_point <> nil then //U ��, �
          Cells[19, i + 1] := CNPackList.list[i].tension_point.DecimalString
        else
          Cells[19, i + 1] := '';
        if CNPackList.list[i].tension_exist <> nil then //U �������, �
          Cells[20, i + 1] := CNPackList.list[i].tension_exist.DecimalString
        else
          Cells[20, i + 1] := '';
        //�������������
        AddCheckBox(21, i + 1, (CNPackList.list[i].is_reserv = 1), False);
        //����������
        AddCheckBox(22, i + 1, (CNPackList.list[i].is_finish_supply = 1), False);
        //������ �� �������������
        AddCheckBox(23, i + 1, (CNPackList.list[i].is_realized <> 1), False);

        //��� ����������� ��: 0 ��� Null - �� �������; 1 - ���������� ��������;
        //2 - ��������� ����� �������������, 3 - ���������� �������� � ���������� ����� �������������
        AddCheckBox(24, i + 1, ((CNPackList.list[i].id_proposal = 2)
          or (CNPackList.list[i].id_proposal = 3)), False);

        //������� ����������� ��
        AddCheckBox(25, i + 1, (CNPackList.list[i].is_registration = 1), False);

        isInfluence := False;

        if (CNPackList.list[i].is_reserv = 1) then
          begin
            sgCNPack.RowColor[i + 1] := clOlive;
            isInfluence := True;
          end
        else if (CNPackList.list[i].is_finish_supply = 1) then
          sgCNPack.RowColor[i + 1] := clInfoBk
        else if (CNPackList.list[i].id_pack_status = 3)
        or (CNPackList.list[i].id_pack_status = 4)
        then
          begin
            sgCNPack.RowColor[i + 1] := clMaroon;
            sgCNPack.RowFontColor[i + 1] := clWindow;
          end
        else if (CNPackList.list[i].is_realized <> 1)
        and (CNPackList.list[i].is_registration = 1)
        then
          begin
            sgCNPack.RowColor[i + 1] := clMoneyGreen;
            isInfluence := True;
          end
        else if (CNPackList.list[i].is_realized = 1) then
          sgCNPack.RowColor[i + 1] := clGray
        else if (CNPackList.list[i].is_registration <> 1) then
          begin
            sgCNPack.RowColor[i + 1] := clBackground;
            sgCNPack.RowFontColor[i + 1] := clWindow;
          end;

        if (CNPackList.list[i].id_proposal = 2)
        or (CNPackList.list[i].id_proposal = 3)
        then
          begin
            sgCNPack.Colors[7, i] := clFuchsia;
            powInc := 0;
          end
        else
          powInc := 1;

        if isInfluence then
          sumPowerInfluence := sumPowerInfluence +
            StrToFloat(CNPackList.list[i].power.DecimalString) -
            StrToFloat(CNPackList.list[i].pow_exist.DecimalString) * powInc;

        cnpLastRow := i + 1;
        sgCNPack.RowCount := cnpLastRow + 1;
      end;
   cnpColCount := cnpColCount + 1;
   sgCNPack.Row := 1;
   edtSumPowerInfluence.Text := FloatToStr(sumPowerInfluence);
   sgCNPack.OnRowChanging(sgCNPack, 0, sgCNPack.Row, Allow);

end;

procedure TfrmENSubstation04Edit.actUpdateSPL_PPExecute(Sender: TObject);
var TempSPL_PP_Pack: CNPackControllerSoapPort;
  SPL_PP_PackList: CNPackShortList;
  i: Integer; Allow: Boolean;
begin
  SetGridHeaders(SPL_PP_PackHeaders, sgSPL_PP_Pack.ColumnHeaders);
  spl_pp_ColCount := 100;
  TempSPL_PP_Pack :=  HTTPRIOCNPack as CNPackControllerSoapPort;
  spl_pp_FilterObject := CNPackFilter.Create;
  SetNullIntProps(spl_pp_FilterObject);
  SetNullXSProps(spl_pp_FilterObject);
  spl_pp_FilterObject.conditionSQL :=
    'case p.subsystemcode ' + #13#10 +
    'when 2 ' + #13#10 +
    '  then p.id in (select id_spl_pack from cn.spl2cn ' + #13#10 +
    '    where id_cn_pack = ' + sgCNPack.Cells[1, rowCN] + #13#10 +
    '    and id_subsystem_cn = ' + IntToStr(Integer(sgCNPack.Objects[4, rowCN])) +
    '    ) ' + #13#10 +
    'when 4 ' + #13#10 +
    '  then p.id in (select id_pp_pack from cn.pp2cn ' + #13#10 +
    '    where id_cn_pack = ' + sgCNPack.Cells[1, rowCN] + #13#10 +
    '    and id_subsystem_cn = ' + IntToStr(Integer(sgCNPack.Objects[4, rowCN])) +
    '    ) ' + #13#10 +
    'end';

  SPL_PP_PackList := TempSPL_PP_Pack.getSPL_PP_PackCurStateList(
    CNPackFilter(spl_pp_FilterObject), 0, spl_pp_ColCount);

  spl_pp_LastCount := High(SPL_PP_PackList.list);

  if spl_pp_LastCount > -1 then
    sgSPL_PP_Pack.RowCount := spl_pp_LastCount + 2
  else
    sgSPL_PP_Pack.RowCount := 2;

  with sgSPL_PP_Pack do
    for i := 0 to spl_pp_LastCount do
      begin
        Application.ProcessMessages;

        if SPL_PP_PackList.list[i].code <> Low(Integer) then //���
          Cells[0, i + 1] := IntToStr(SPL_PP_PackList.list[i].code)
        else
          Cells[0, i + 1] := '';
        if SPL_PP_PackList.list[i].packCode = Low(Integer) then //��� ������
          Cells[1, i + 1] := ''
        else
          Cells[1, i + 1] := IntToStr(SPL_PP_PackList.list[i].packCode);
        Cells[2, i + 1] := SPL_PP_PackList.list[i].name; //�����
        Cells[3, i + 1] := SPL_PP_PackList.list[i].renName; //��� � ��
        Cells[4, i + 1] := SPL_PP_PackList.list[i].districtName; //�����
        Cells[5, i + 1] := SPL_PP_PackList.list[i].subsystemRefName; //***
        Objects[5, i + 1] := TObject(SPL_PP_PackList.list[i].subsystemRefCode); //***
        Cells[6, i + 1] := SPL_PP_PackList.list[i].statusName; //������ ������
        Cells[7, i + 1] := SPL_PP_PackList.list[i].description; //����
        Cells[8, i + 1] := SPL_PP_PackList.list[i].business_type; //г� ��������
        if SPL_PP_PackList.list[i].power = nil then //���������
          Cells[9, i + 1] := ''
        else
          Cells[9, i + 1] := SPL_PP_PackList.list[i].power.DecimalString;
        Cells[10, i + 1] := SPL_PP_PackList.list[i].address; //������ ���������
        Cells[11, i + 1] := SPL_PP_PackList.list[i].address_jur; //�������� ������ ���������
        Cells[12, i + 1] := SPL_PP_PackList.list[i].reg_num_spl_pp_contract; //���������� � ���.
        if SPL_PP_PackList.list[i].date_spl_pp_contract = nil then
          Cells[13, i + 1] := '' //���� �������� ��� ���������� �����������㳿
        else
          Cells[13, i + 1] :=
            XSDate2String(SPL_PP_PackList.list[i].date_spl_pp_contract);

        if SPL_PP_PackList.list[i].date_finish_pack = nil then
          Cells[14, i + 1] := '' //���� �������� ��� ���������� �����������㳿
        else
          Cells[14, i + 1] := DateToStr(EncodeDate(
            SPL_PP_PackList.list[i].date_finish_pack.Year,
            SPL_PP_PackList.list[i].date_finish_pack.Month,
            SPL_PP_PackList.list[i].date_finish_pack.Day));

        Cells[15, i + 1] := SPL_PP_PackList.list[i].cur_state;
        spl_pp_LastRow := i + 1;
        sgSPL_PP_Pack.RowCount := spl_pp_LastRow + 1;
      end;
   spl_pp_ColCount := spl_pp_ColCount + 1;
   sgSPL_PP_Pack.Row := 1;
   sgSPL_PP_Pack.OnRowChanging(sgSPL_PP_Pack, 0, sgSPL_PP_Pack.Row, Allow);
end;

procedure TfrmENSubstation04Edit.sgSPL_PP_PackRowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
begin
  memSPL_PP_Pack.Clear;
  if NewRow >= 1 then
    begin
      if sgSPL_PP_Pack.Cells[14, NewRow] <> '' then
        memSPL_PP_Pack.Text := sgSPL_PP_Pack.Cells[14, NewRow]
      else if sgSPL_PP_Pack.Cells[6, NewRow] <> '' then
        memSPL_PP_Pack.Text := memSPL_PP_Pack.Text +
          sgSPL_PP_Pack.Cells[6, NewRow];
      memSPL_PP_Pack.Text := memSPL_PP_Pack.Text + #13#10;
      if sgSPL_PP_Pack.Cells[3, NewRow] <> '' then
        memSPL_PP_Pack.Text := memSPL_PP_Pack.Text +
          sgSPL_PP_Pack.Cells[3, NewRow];
      if sgSPL_PP_Pack.Cells[4, NewRow] <> '' then
        memSPL_PP_Pack.Text := memSPL_PP_Pack.Text + '. ' +
          sgSPL_PP_Pack.Cells[4, NewRow];
      if sgSPL_PP_Pack.Cells[7, NewRow] <> '' then
        memSPL_PP_Pack.Text := memSPL_PP_Pack.Text + '. ' +
          sgSPL_PP_Pack.Cells[7, NewRow];
      if sgSPL_PP_Pack.Cells[8, NewRow] <> '' then
        memSPL_PP_Pack.Text := memSPL_PP_Pack.Text + '. ' +
          sgSPL_PP_Pack.Cells[8, NewRow];
      if sgSPL_PP_Pack.Cells[10, NewRow] <> '' then
        memSPL_PP_Pack.Text := memSPL_PP_Pack.Text + '. ' +
          sgSPL_PP_Pack.Cells[10, NewRow];
      if sgSPL_PP_Pack.Cells[11, NewRow] <> '' then
        memSPL_PP_Pack.Text := memSPL_PP_Pack.Text + '��. ������: ' +
          sgSPL_PP_Pack.Cells[11, NewRow];
      if sgSPL_PP_Pack.Cells[12, NewRow] <> '' then
        memSPL_PP_Pack.Text := memSPL_PP_Pack.Text + ' ���. ���������� � '
          + sgSPL_PP_Pack.Cells[12, NewRow];
      if sgSPL_PP_Pack.Cells[13, NewRow] <> '' then
        memSPL_PP_Pack.Text := memSPL_PP_Pack.Text + ' �� '
          + sgSPL_PP_Pack.Cells[13, NewRow];
    end; //if NewRow >= 1 then
end;

procedure TfrmENSubstation04Edit.btnPricconectionDataClick(Sender: TObject);
begin
  frmENPriconnectionDataEdit := TfrmENPriconnectionDataEdit.Create(Application, dsEdit);
  ENPriconnectionDataObj := nil;
  try
    frmENPriconnectionDataEdit.substationCode := ENSubstation04Obj.code;
    frmENPriconnectionDataEdit.elementCode := ENSubstation04Obj.element.code;
    HideControls([frmENPriconnectionDataEdit.btnSaveCalculate]);
    if frmENPriconnectionDataEdit.ShowModal = mrOk then
      begin
      end;
  except
    on EConvertError do Exit;
  end;
end;


procedure TfrmENSubstation04Edit.sgENInspectionSheetClick(Sender: TObject);
var
  inspectionSheet: ENInspectionSheet;
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;

  try
    inspectionSheet := TempENInspectionSheet.getObject(StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]));
  except
    on EConvertError do Exit;
  end;

  if inspectionSheet = nil then Exit;
  if inspectionSheet.code = Low(Integer) then Exit;

  actEdit.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_DRAFT);
  actDelete.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_DRAFT);
end;


procedure TfrmENSubstation04Edit.sgENInspectionSheetDblClick(Sender: TObject);
begin
  inherited;
  actViewInspectionSheetExecute(Sender);
end;

procedure TfrmENSubstation04Edit.LoadCCElement();
var
  i, j: Integer;
  TempCCElementData: CCElementDataControllerSoapPort;
  ccElementList: CCElementDataShortList;
  ccElementFilter: CCElementDataFilter;
  LastCount: Integer;
  selectedRow: Integer;
begin
  selectedRow:=sgCCElementData.Row;

  for i:=1 to sgCCElementData.RowCount-1 do
   for j:=0 to sgCCElementData.ColCount-1 do
     sgCCElementData.Cells[j,i]:='';

  if (ENSubstation04Obj.element=nil) or (ENSubstation04Obj.element.code=Low(Integer)) then Exit;

  TempCCElementData :=  HTTPRIOCCElementData as CCElementDataControllerSoapPort;

  ccElementFilter := CCElementDataFilter.Create;
  SetNullIntProps(ccElementFilter);
  SetNullXSProps(ccElementFilter);
  ccElementFilter.elementCode:=ENSubstation04Obj.element.code;
  ccElementFilter.orderBySQL:='name';

  ccElementList := TempCCElementData.getScrollableFilteredList(ccElementFilter,0,-1);
  LastCount:=High(ccElementList.list);

  if LastCount > -1 then
     sgCCElementData.RowCount:=LastCount+2
  else
     sgCCElementData.RowCount:=2;

   with sgCCElementData do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ccElementList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ccElementList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ccElementList.list[i].name;
        Cells[2,i+1] := ccElementList.list[i].res;
        Cells[3,i+1] := ccElementList.list[i].nodetypeName;
        Cells[4,i+1] := ccElementList.list[i].uid;
      end;

    sgCCElementData.Row:=1;

    if selectedRow <> 0 then
    begin
    if sgCCElementData.RowCount > selectedRow then
      sgCCElementData.Row := selectedRow
    else
      sgCCElementData.Row := sgCCElementData.RowCount - 1;
    end
    else
      sgCCElementData.Row:=1;
end;

procedure TfrmENSubstation04Edit.LoadCCDamageLog();
var
  TempCCDamageLog: CCDamageLogControllerSoapPort;
  damFilter: CCDamageLogFilter;
  damList: CCDamageLogShortList;
  i,j: Integer;
  selectedRow: Integer;
begin
  selectedRow:=sgCCDamageLog.Row;

  for i:=1 to sgCCDamageLog.RowCount-1 do
  for j:=0 to sgCCDamageLog.ColCount-1 do
  begin
     sgCCDamageLog.Cells[j,i]:='';
     sgCCDamageLog.Colors[j,i]:=clNone;
     sgCCDamageLog.FontColors[j,i]:=clWindowText;
  end;

  if (ENSubstation04Obj.element=nil) or (ENSubstation04Obj.element.code=Low(Integer)) then Exit;

  TempCCDamageLog :=  HTTPRIOCCDamageLog as CCDamageLogControllerSoapPort;

  damFilter := CCDamageLogFilter.Create;
  SetNullIntProps(damFilter);
  SetNullXSProps(damFilter);
  damFilter.conditionSQL:=
      ' CCDamageLog.statuscode in (0,1,2,3,6,10,11) '+
      ' and CCDamageLog.subtyperefcode=32 '+
      ' and CCDamageLog.departmentrefcode=0 '+
      ' and ('+
      '   CCDamageLog.nodecode in (select n2e.nodecode from ccnode2enelement n2e where n2e.elementcode='+IntToStr(ENSubstation04Obj.element.code)+')'+
      '   or '+
      '   CCDamageLog.nodecode in (select g.code from ccnodegroup g where g.parentnormalcode in '+
      '     (select n2e.nodecode from ccnode2enelement n2e where n2e.elementcode='+IntToStr(ENSubstation04Obj.element.code)+'))'+
      ')';
  damFilter.orderBySQL:=
      'CCDamageLog.code desc';

  damList := TempCCDamageLog.getScrollableFilteredList(damFilter,0,100);

  if High(damList.list) > -1 then
     sgCCDamageLog.RowCount:=High(damList.list)+2
  else
     sgCCDamageLog.RowCount:=2;

   with sgCCDamageLog do
    for i:=0 to High(damList.list) do
      begin
        Application.ProcessMessages;
        if damList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(damList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := damList.list[i].kindName;

        if (damList.list[i].kindCode=0) and (damList.list[i].datedamage<>nil) then
          Cells[2,i+1] := XSDateTimeWithDate2String(damList.list[i].datedamage)
        else
        if (damList.list[i].kindCode<>0) and (damList.list[i].datestart<>nil) then
          Cells[2,i+1] := XSDateTimeWithDate2String(damList.list[i].datestart)
        else
        if (damList.list[i].kindCode<>0) and (damList.list[i].datedamage<>nil) then
        begin
          Cells[2,i+1] := XSDateTimeWithDate2String(damList.list[i].datedamage);
        end
        else
          Cells[2,i+1] := '';

        if damList.list[i].dateend <> nil then
          Cells[3,i+1] := XSDateTimeWithDate2String(damList.list[i].dateend)
        else
          Cells[3,i+1] := '';

        Cells[4,i+1] := damList.list[i].nodetxt;
        Cells[5,i+1] := damList.list[i].subtyperefMark;
        Cells[6,i+1] := damList.list[i].statusName;
        Cells[7,i+1] := damList.list[i].reasontxt;

        // ��������� ����� ����������
        //Colors[4,i+1] := damageColorByStatus(damList.list[i].statusCode, damList.list[i].urgent);
      end;

    if selectedRow <> 0 then
    begin
    if sgCCDamageLog.RowCount > selectedRow then
      sgCCDamageLog.Row := selectedRow
    else
      sgCCDamageLog.Row := sgCCDamageLog.RowCount - 1;
    end
    else
      sgCCDamageLog.Row:=1;
end;

end.
