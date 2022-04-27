unit EditENLine10;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics,
    Controls, Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio,
    SOAPHTTPClient, ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList,
    BaseGrid,  XSBuiltIns, GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons,
    EnergyproController, EnergyproController2, ENLine10Controller, ExtCtrls,
    AdvObj, ENSubst150CellController, TB2Item, TB2Dock, TB2Toolbar,
    CCElementDataController, CCFeederController, ENObjectsTechnicalStatusController,
    IdFTP, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
    IdExplicitTLSClientServerBase, ShellAPI,
    CCDamageLogController, CCGlobal, CCDMReportUnit, CCReportController;

type
    TfrmENLine10Edit = class(TDialogForm)

    HTTPRIOENLine10: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    pcLine10: TPageControl;
    tsLine10: TTabSheet;
    tsSubstation04: TTabSheet;
    lblInvNumber: TLabel;
    lblName: TLabel;
    lblYearBuild: TLabel;
    lblYearWorkingStart: TLabel;
    lblNameProject: TLabel;
    lblNameBuilder: TLabel;
    lblMainCustomersData: TLabel;
    lblMoreData: TLabel;
    lblDateGen: TLabel;
    spbEPWorker: TSpeedButton;
    lblEPWorkerName: TLabel;
    spbEPVoltageNominal: TSpeedButton;
    edtInvNumber: TEdit;
    edtName: TEdit;
    edtYearBuild: TEdit;
    edtYearWorkingStart: TEdit;
    edtNameProject: TEdit;
    edtNameBuilder: TEdit;
    edtDateGen: TDateTimePicker;
    edtEPWorkerName: TEdit;
    edtEPVoltageNominalName: TEdit;
    lblEPVoltageNominal: TLabel;
    edtMainCustomersData: TMemo;
    edtMoreData: TMemo;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
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
    ImageList1: TImageList;
    HTTPRIOENSubstation04: THTTPRIO;
    tsPost: TTabSheet;
    lblBuhName: TLabel;
    edtBuhName: TEdit;
    lblLastRepairDate: TLabel;
    edtLastRepairDate: TDateTimePicker;
    lblLineLength: TLabel;
    edtLineLength: TEdit;
    lblBelongingType: TLabel;
    lblOwner: TLabel;
    cbBelonging: TComboBox;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbOSSelect: TSpeedButton;
    lblENHighVoltageSellName: TLabel;
    edtENHighVoltageSellName: TEdit;
    spbENHighVoltageSell: TSpeedButton;
    HTTPRIOENHighVoltageSell: THTTPRIO;
    pnlSubstation04: TPanel;
    sgENSubstation04: TAdvStringGrid;
    gbHighVoltCell: TGroupBox;
    sgENHighVoltageSell: TAdvStringGrid;
    tsBranch10: TTabSheet;
    tsCabelOut10: TTabSheet;
    tsAirCrossing: TTabSheet;
    tsENActL10: TTabSheet;
    tsENPlanWorkL10: TTabSheet;
    HTTPRIOENPost: THTTPRIO;
    ToolBar13: TToolBar;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolBar17: TToolBar;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    sgENPlanWork: TAdvStringGrid;
    HTTPRIOENAct: THTTPRIO;
    HTTPRIOAuth: THTTPRIO;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIOENElement: THTTPRIO;
    HTTPRIOENPlanWorkMoveHistory: THTTPRIO;
    pnlPost: TPanel;
    ToolBar2: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    sgENPost: TAdvStringGrid;
    HTTPRIOENStand: THTTPRIO;
    actViewStand: TAction;
    actInsertStand: TAction;
    actDeleteStand: TAction;
    actEditStand: TAction;
    actUpdateStand: TAction;
    actFilterStand: TAction;
    actNoFilterStand: TAction;
    pnlBranch10: TPanel;
    sgENBranch10: TAdvStringGrid;
    HTTPRIOENBranch10: THTTPRIO;
    HTTPRIOENBranch10Item: THTTPRIO;
    pnlPostEquipment: TPanel;
    gbHook: TGroupBox;
    HTTPRIOENTravers: THTTPRIO;
    actViewTravers: TAction;
    actInsertTravers: TAction;
    actDeleteTravers: TAction;
    actEditTravers: TAction;
    actUpdateTravers: TAction;
    actFilterTravers: TAction;
    actNoFilterTravers: TAction;
    ToolBar6: TToolBar;
    ToolButton44: TToolButton;
    ToolButton45: TToolButton;
    ToolButton46: TToolButton;
    ToolButton47: TToolButton;
    ToolButton48: TToolButton;
    ToolButton49: TToolButton;
    ToolButton50: TToolButton;
    sgENHook: TAdvStringGrid;
    actViewHook: TAction;
    actInsertHook: TAction;
    actDeleteHook: TAction;
    actEditHook: TAction;
    actUpdateHook: TAction;
    actFilterHook: TAction;
    actNoFilterHook: TAction;
    HTTPRIOENHook: THTTPRIO;
    BtnPasspVL10: TButton;
    tsLineRoute: TTabSheet;
    HTTPRIOENCabelOut10: THTTPRIO;
    HTTPRIOENAirCrossing: THTTPRIO;
    ToolBar15: TToolBar;
    ToolButton100: TToolButton;
    ToolButton101: TToolButton;
    ToolButton102: TToolButton;
    ToolButton103: TToolButton;
    ToolButton104: TToolButton;
    ToolButton105: TToolButton;
    ToolButton106: TToolButton;
    sgENLineRoute: TAdvStringGrid;
    HTTPRIOENLineRoute: THTTPRIO;
    pnlCabelOut10: TPanel;
    ToolBar11: TToolBar;
    ToolButton79: TToolButton;
    ToolButton80: TToolButton;
    ToolButton81: TToolButton;
    ToolButton82: TToolButton;
    ToolButton83: TToolButton;
    ToolButton84: TToolButton;
    ToolButton85: TToolButton;
    sgENCabelOut10: TAdvStringGrid;
    gbCabelOut10Item: TGroupBox;
    HTTPRIOENCabelOut10Item: THTTPRIO;
    pnlAirCrossing: TPanel;
    ToolBar12: TToolBar;
    ToolButton86: TToolButton;
    ToolButton87: TToolButton;
    ToolButton88: TToolButton;
    ToolButton89: TToolButton;
    ToolButton90: TToolButton;
    ToolButton91: TToolButton;
    ToolButton92: TToolButton;
    sgENAirCrossing: TAdvStringGrid;
    gbAirCrossingItem: TGroupBox;
    HTTPRIOENAirCrossingItem: THTTPRIO;
    actSelectPost: TAction;
    ToolButton114: TToolButton;
    HTTPRIOENDisconnector: THTTPRIO;
    actChangeDisconnector: TAction;
    actUninstallDisconnector: TAction;
    actInstallDisconnector: TAction;
    pmChangeEquipment: TPopupMenu;
    miEquipTransformer: TMenuItem;
    miChangeTransformer: TMenuItem;
    miDemontageTransformer: TMenuItem;
    miMontageTransformer: TMenuItem;
    miHistoryTransformer: TMenuItem;
    miEquipDisconnector: TMenuItem;
    miChangeDisconnector: TMenuItem;
    miDemontageDisconnector: TMenuItem;
    miMontageDisconnector: TMenuItem;
    miHistoryDisconnector: TMenuItem;
    miEquipLoadSwitch: TMenuItem;
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
    miChangeInsulator: TMenuItem;
    N9: TMenuItem;
    miInstallInsulator: TMenuItem;
    N11: TMenuItem;
    miEquipArrester: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    miEquipCurrentTransformer: TMenuItem;
    miChangeCurrentTransformer: TMenuItem;
    miDemontageCurrentTransformer: TMenuItem;
    miMontageCurrentTransformer: TMenuItem;
    miHistoryCurrentTransformer: TMenuItem;
    miEquipBus: TMenuItem;
    miChangeBus: TMenuItem;
    miUninstallBus: TMenuItem;
    miInstallBus: TMenuItem;
    miHistoryBus: TMenuItem;
    miEquipMeasurDevice: TMenuItem;
    miChangeMeasurDevice: TMenuItem;
    miDemontageMeasurDevice: TMenuItem;
    miMontageMeasurDevice: TMenuItem;
    miHistoryMeasurDevice: TMenuItem;
    miEquipContactBreaker: TMenuItem;
    miChangeContactBreaker: TMenuItem;
    miDemontageContactBreaker: TMenuItem;
    miMontageContactBreaker: TMenuItem;
    miHistoryContactBreaker: TMenuItem;
    miEquipFuseLVB: TMenuItem;
    miChangeFuseLVB: TMenuItem;
    miDemontageFuseLVB: TMenuItem;
    miMontageFuseLVB: TMenuItem;
    miHistoryFuseLVB: TMenuItem;
    miEquipAutomat: TMenuItem;
    miChangeAutomat: TMenuItem;
    miDemontageAutomat: TMenuItem;
    miMontageAutomat: TMenuItem;
    miHistoryAutomat: TMenuItem;
    miEquipMeasurDeviceLVB: TMenuItem;
    miChangeMeasurDeviceLVB: TMenuItem;
    miDemontageMeasurDeviceLVB: TMenuItem;
    miMontageMeasurDeviceLVB: TMenuItem;
    miHistoryMeasurDeviceLVB: TMenuItem;
    ToolButton126: TToolButton;
    pcPostEquipment: TPageControl;
    tsInsulator: TTabSheet;
    tsDisconnector: TTabSheet;
    ToolBar18: TToolBar;
    ToolButton116: TToolButton;
    ToolButton117: TToolButton;
    ToolButton118: TToolButton;
    ToolButton119: TToolButton;
    ToolButton120: TToolButton;
    ToolButton121: TToolButton;
    ToolButton122: TToolButton;
    ToolButton123: TToolButton;
    sgENDisconnector: TAdvStringGrid;
    sgENInsulator: TAdvStringGrid;
    ToolBar19: TToolBar;
    ToolButton124: TToolButton;
    ToolButton127: TToolButton;
    ToolButton128: TToolButton;
    tbEquipInsulator: TToolButton;
    tbUpdateInsulator: TToolButton;
    tbEditInsulator: TToolButton;
    actViewInsulator: TAction;
    actInsertInsulator: TAction;
    actDeleteInsulator: TAction;
    actEditInsulator: TAction;
    actUpdateInsulator: TAction;
    actFilterInsulator: TAction;
    actNoFilterInsulator: TAction;
    actViewDisconnector: TAction;
    actInsertDisconnector: TAction;
    actDeleteDisconnector: TAction;
    actEditDisconnector: TAction;
    actUpdateDisconnector: TAction;
    actFilterDisconnector: TAction;
    actNoFilterDisconnector: TAction;
    actUninstallInsulator: TAction;
    actInstallInsulator: TAction;
    actChangeInsulator: TAction;
    ToolButton129: TToolButton;
    ToolButton130: TToolButton;
    HTTPRIOENInsulatorChange: THTTPRIO;
    HTTPRIOENInsulator: THTTPRIO;
    HTTPRIOENDisconnectorChange: THTTPRIO;
    pcBranch10PostEquipment: TPageControl;
    tsBranch10Stand: TTabSheet;
    ToolBar7: TToolBar;
    ToolButton51: TToolButton;
    ToolButton52: TToolButton;
    ToolButton53: TToolButton;
    ToolButton54: TToolButton;
    ToolButton55: TToolButton;
    ToolButton56: TToolButton;
    ToolButton57: TToolButton;
    sgENBranch10Stand: TAdvStringGrid;
    tsBranch10Travers: TTabSheet;
    ToolBar8: TToolBar;
    ToolButton58: TToolButton;
    ToolButton59: TToolButton;
    ToolButton60: TToolButton;
    ToolButton61: TToolButton;
    ToolButton62: TToolButton;
    ToolButton63: TToolButton;
    ToolButton64: TToolButton;
    sgENBranch10Travers: TAdvStringGrid;
    tsBranch10Hook: TTabSheet;
    ToolBar9: TToolBar;
    ToolButton65: TToolButton;
    ToolButton66: TToolButton;
    ToolButton67: TToolButton;
    ToolButton68: TToolButton;
    ToolButton69: TToolButton;
    ToolButton70: TToolButton;
    ToolButton71: TToolButton;
    sgENBranch10Hook: TAdvStringGrid;
    tsBranch10Insulator: TTabSheet;
    tsBranch10Disconnector: TTabSheet;
    gbBranch10Post: TGroupBox;
    sgENBranch10Item: TAdvStringGrid;
    ToolBar4: TToolBar;
    ToolButton30: TToolButton;
    ToolButton31: TToolButton;
    ToolButton32: TToolButton;
    ToolButton33: TToolButton;
    ToolButton34: TToolButton;
    ToolButton35: TToolButton;
    ToolButton36: TToolButton;
    ToolBar10: TToolBar;
    ToolButton72: TToolButton;
    ToolButton73: TToolButton;
    ToolButton74: TToolButton;
    ToolButton75: TToolButton;
    ToolButton76: TToolButton;
    ToolButton77: TToolButton;
    ToolButton78: TToolButton;
    ToolBar20: TToolBar;
    ToolButton125: TToolButton;
    ToolButton131: TToolButton;
    ToolButton132: TToolButton;
    ToolButton133: TToolButton;
    ToolButton134: TToolButton;
    ToolButton135: TToolButton;
    ToolButton136: TToolButton;
    ToolButton137: TToolButton;
    sgENBranch10Insulator: TAdvStringGrid;
    ToolBar21: TToolBar;
    ToolButton138: TToolButton;
    ToolButton139: TToolButton;
    ToolButton140: TToolButton;
    ToolButton141: TToolButton;
    ToolButton142: TToolButton;
    ToolButton143: TToolButton;
    ToolButton144: TToolButton;
    ToolButton145: TToolButton;
    sgENBranch10Disconnector: TAdvStringGrid;
    actViewBranch10Post: TAction;
    actInsertBranch10Post: TAction;
    actDeleteBranch10Post: TAction;
    actEditBranch10Post: TAction;
    actUpdateBranch10Post: TAction;
    actFilterBranch10Post: TAction;
    actNoFilterBranch10Post: TAction;
    actViewBranch10Stand: TAction;
    actInsertBranch10Stand: TAction;
    actDeleteBranch10Stand: TAction;
    actEditBranch10Stand: TAction;
    actUpdateBranch10Stand: TAction;
    actFilterBranch10Stand: TAction;
    actNoFilterBranch10Stand: TAction;
    actViewBranch10Travers: TAction;
    actInsertBranch10Travers: TAction;
    actDeleteBranch10Travers: TAction;
    actEditBranch10Travers: TAction;
    actUpdateBranch10Travers: TAction;
    actFilterBranch10Travers: TAction;
    actNoFilterBranch10Travers: TAction;
    actViewBranch10Hook: TAction;
    actInsertBranch10Hook: TAction;
    actDeleteBranch10Hook: TAction;
    actEditBranch10Hook: TAction;
    actUpdateBranch10Hook: TAction;
    actFilterBranch10Hook: TAction;
    actNoFilterBranch10Hook: TAction;
    actViewBranch10Insulator: TAction;
    actInsertBranch10Insulator: TAction;
    actDeleteBranch10Insulator: TAction;
    actEditBranch10Insulator: TAction;
    actUpdateBranch10Insulator: TAction;
    actFilterBranch10Insulator: TAction;
    actNoFilterBranch10Insulator: TAction;
    actViewBranch10Disconnector: TAction;
    actInsertBranch10Disconnector: TAction;
    actDeleteBranch10Disconnector: TAction;
    actEditBranch10Disconnector: TAction;
    actUpdateBranch10Disconnector: TAction;
    actFilterBranch10Disconnector: TAction;
    actNoFilterBranch10Disconnector: TAction;
    sgENCabelOut10Item: TAdvStringGrid;
    ToolButton107: TToolButton;
    actUnlinkPost: TAction;
    ToolButton108: TToolButton;
    sgENAirCrossingItem: TAdvStringGrid;
    actPassportLine10: TAction;
    edtSubStation150: TEdit;
    lblSubStation150: TLabel;
    spbSubStation150: TSpeedButton;
    HTTPRIOENLine10Supplies: THTTPRIO;
    HTTPRIOENLine150: THTTPRIO;
    gbLine10Equipment: TGroupBox;
    lblCntSubstation04: TLabel;
    lblSubstation04Cnt: TLabel;
    gbPost: TGroupBox;
    lblPostCnt: TLabel;
    lblCntPost: TLabel;
    lblCntStand: TLabel;
    lblStandCnt: TLabel;
    lblCntInsulator: TLabel;
    lblInsulatorCnt: TLabel;
    lblCntDisconnector: TLabel;
    lblDisconnectorCnt: TLabel;
    lblCntTravers: TLabel;
    lblTraversCnt: TLabel;
    gbBranch10: TGroupBox;
    lblBranch10ItemCnt: TLabel;
    lblCntBranch10Item: TLabel;
    lblCntBranch10Stand: TLabel;
    lblBranch10StandCnt: TLabel;
    lblCntBranch10Insulator: TLabel;
    lblBranch10InsulatorCnt: TLabel;
    lblCntBranch10Disconnector: TLabel;
    lblBranch10DisconnectorCnt: TLabel;
    lblCntBranch10Travers: TLabel;
    lblBranch10TraversCnt: TLabel;
    lblCntBranch10: TLabel;
    lblBranch10Cnt: TLabel;
    lblCntCabelOut10: TLabel;
    lblCabelOut10Cnt: TLabel;
    gbAirCrossing: TGroupBox;
    lblCntAirCrossingUp: TLabel;
    lblAirCrossingUpCnt: TLabel;
    lblAirCrossingDownCnt: TLabel;
    lblCntAirCrossingDown: TLabel;
    lblCntWires: TLabel;
    lblWiresCnt: TLabel;
    gbAddresses: TGroupBox;
    sgAddresses: TAdvStringGrid;
    HTTPRIOAddress: THTTPRIO;
    lblExtentForest: TLabel;
    edtExtentForest: TEdit;
    pcPost: TPageControl;
    tsStand: TTabSheet;
    tsTravers: TTabSheet;
    sgENStand: TAdvStringGrid;
    ToolBar3: TToolBar;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    ToolButton27: TToolButton;
    ToolButton28: TToolButton;
    ToolButton29: TToolButton;
    ToolBar5: TToolBar;
    ToolButton37: TToolButton;
    ToolButton38: TToolButton;
    ToolButton39: TToolButton;
    ToolButton40: TToolButton;
    ToolButton41: TToolButton;
    ToolButton42: TToolButton;
    ToolButton43: TToolButton;
    sgENTravers: TAdvStringGrid;
    Label1: TLabel;
    edtSubst150Cell: TEdit;
    sb150cell: TSpeedButton;
    HTTPRIOENSubst150Cell: THTTPRIO;
    edtOwner: TEdit;
    spbOwner: TSpeedButton;
    HTTPRIOENOwner: THTTPRIO;
    tsPost4OKSN: TTabSheet;
    sgENPost10OKSN: TAdvStringGrid;
    HTTPRIOENPost10OKSN: THTTPRIO;
    ToolBar16: TToolBar;
    ToolButton110: TToolButton;
    ToolButton111: TToolButton;
    ToolButton112: TToolButton;
    ToolButton113: TToolButton;
    ToolButton146: TToolButton;
    actViewP4O: TAction;
    actInsertP4O: TAction;
    actDeleteP4O: TAction;
    actEditP4O: TAction;
    actUpdateP4O: TAction;
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
    HTTPRIOENInspectionSheet: THTTPRIO;
    tbActions: TTBToolbar;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem47: TTBItem;
    TBItem7: TTBItem;
    TBItem46: TTBItem;
    sgENInspectionSheet: TAdvStringGrid;
    spbFINExecutor: TSpeedButton;
    edtFINExecutorName: TEdit;
    lblExecuter: TLabel;
    actCopySheet: TAction;
    N5: TMenuItem;
    miCopySheet: TMenuItem;
    tsCCElement: TTabSheet;
    sgCCElementData: TAdvStringGrid;
    HTTPRIOCCElementData: THTTPRIO;
    sgENAct: TAdvStringGrid;
    HTTPRIOCCFeeder: THTTPRIO;
    tsTechnicalStatus: TTabSheet;
    gbMainElements: TGroupBox;
    lblTotalCountWood: TLabel;
    lblDefectCountWood: TLabel;
    edtTotalCountWood: TEdit;
    edtDefectCountWood: TEdit;
    lblTotalCountArmored: TLabel;
    lblDefectCountArmored: TLabel;
    edtTotalCountArmored: TEdit;
    edtDefectCountArmored: TEdit;
    lblTotalLengthCable: TLabel;
    lblDefectLengthtCable: TLabel;
    edtTotalLengthCable: TEdit;
    edtDefectLengthtCable: TEdit;
    lblTotalCountInsulator: TLabel;
    lblDefectCountInsulator: TLabel;
    edtTotalCountInsulator: TEdit;
    edtDefectCountInsulator: TEdit;
    lblTotalCountTraverse: TLabel;
    lblDefectCountTraverse: TLabel;
    edtTotalCountTraverse: TEdit;
    edtDefectCountTraverse: TEdit;
    lblBaseDistance: TLabel;
    edtBaseDistance: TEdit;
    lblVKDI: TLabel;
    lblVKDP: TLabel;
    lblVKDO: TLabel;
    lblVKD: TLabel;
    edtVKD: TEdit;
    edtVKDO: TEdit;
    edtVKDP: TEdit;
    edtVKDI: TEdit;
    lblMaxFallPower: TLabel;
    edtMaxFallPower: TEdit;
    btnEvaluateTechnicalStatus: TButton;
    HTTPRIOENObjectsTechnicalStatus: THTTPRIO;
    gbENSettings: TGroupBox;
    imlENSettings: TImageList;
    alENSettings: TActionList;
    actViewENSettings: TAction;
    actEditENSettings: TAction;
    actUpdateENSettings: TAction;
    pmENSettings: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    sgENSettings: TAdvStringGrid;
    HTTPRIOENSettings: THTTPRIO;
    btnPrint: TButton;
    lblGeograph: TLabel;
    edtGeograph: TEdit;
    btnGeograph: TSpeedButton;
    btnGeographClear: TSpeedButton;
    HTTPRIOENGeographicDepartment: THTTPRIO;
    tsAttachments: TTabSheet;
    sgENDocAttachment: TAdvStringGrid;
    ToolBar14: TToolBar;
    ToolButton93: TToolButton;
    btnAddAttachments: TToolButton;
    ToolButton94: TToolButton;
    ToolButton95: TToolButton;
    ActionAttachment: TActionList;
    actLoadAttachment: TAction;
    actAddAttachment: TAction;
    actDeleteAttachment: TAction;
    actUpdateAttachments: TAction;
    pmAttachment: TPopupMenu;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem8: TMenuItem;
    HTTPRIOENDocAttachment: THTTPRIO;
    lblLengthToReconstruct: TLabel;
    edtLengthToReconstruct: TEdit;
    tsCCDamageLog: TTabSheet;
    HTTPRIOCCDamageLog: THTTPRIO;
    sgCCDamageLog: TAdvStringGrid;
    spbGetBaseDistance: TSpeedButton;
    tbDamages: TTBToolbar;
    tbiDamagesXLS: TTBItem;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbEPWorkerClick(Sender : TObject);
    procedure spbEPVoltageNominalClick(Sender : TObject);

    procedure actInsertExecute(Sender: TObject);

    procedure UpdateGrid(Sender : TObject);
    procedure pcLine10Change(Sender: TObject);
    procedure sgENSubstation04TopLeftChanged(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbOSSelectClick(Sender: TObject);
    procedure sgENSubstation04RowChanging(Sender: TObject; OldRow,
    NewRow: Integer; var Allow: Boolean);
    procedure actDeleteExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure sgENPostRowChanging(Sender: TObject; OldRow, NewRow: Integer;
    var Allow: Boolean);
    procedure actViewStandExecute(Sender: TObject);
    procedure actInsertStandExecute(Sender: TObject);
    procedure actDeleteStandExecute(Sender: TObject);
    procedure actEditStandExecute(Sender: TObject);
    procedure actUpdateStandExecute(Sender: TObject);
    procedure actFilterStandExecute(Sender: TObject);
    procedure actNoFilterStandExecute(Sender: TObject);
    procedure actViewTraversExecute(Sender: TObject);
    procedure actInsertTraversExecute(Sender: TObject);
    procedure actDeleteTraversExecute(Sender: TObject);
    procedure actEditTraversExecute(Sender: TObject);
    procedure actUpdateTraversExecute(Sender: TObject);
    procedure actFilterTraversExecute(Sender: TObject);
    procedure actNoFilterTraversExecute(Sender: TObject);
    procedure actViewHookExecute(Sender: TObject);
    procedure actInsertHookExecute(Sender: TObject);
    procedure actDeleteHookExecute(Sender: TObject);
    procedure actEditHookExecute(Sender: TObject);
    procedure actUpdateHookExecute(Sender: TObject);
    procedure actFilterHookExecute(Sender: TObject);
    procedure actNoFilterHookExecute(Sender: TObject);
    procedure actSelectPostExecute(Sender: TObject);
    procedure actChangeDisconnectorExecute(Sender: TObject);
    procedure actUninstallDisconnectorExecute(Sender: TObject);
    procedure actInstallDisconnectorExecute(Sender: TObject);
    procedure pcPostEquipmentChange(Sender: TObject);
    procedure actChangeInsulatorExecute(Sender: TObject);
    procedure actUninstallInsulatorExecute(Sender: TObject);
    procedure actInstallInsulatorExecute(Sender: TObject);
    procedure actViewInsulatorExecute(Sender: TObject);
    procedure actInsertInsulatorExecute(Sender: TObject);
    procedure actDeleteInsulatorExecute(Sender: TObject);
    procedure actEditInsulatorExecute(Sender: TObject);
    procedure actUpdateInsulatorExecute(Sender: TObject);
    procedure actViewDisconnectorExecute(Sender: TObject);
    procedure actInsertDisconnectorExecute(Sender: TObject);
    procedure actDeleteDisconnectorExecute(Sender: TObject);
    procedure actEditDisconnectorExecute(Sender: TObject);
    procedure actUpdateDisconnectorExecute(Sender: TObject);
    procedure sgENBranch10RowChanging(Sender: TObject; OldRow,
    NewRow: Integer; var Allow: Boolean);
    procedure actViewBranch10PostExecute(Sender: TObject);
    procedure actInsertBranch10PostExecute(Sender: TObject);
    procedure actDeleteBranch10PostExecute(Sender: TObject);
    procedure actEditBranch10PostExecute(Sender: TObject);
    procedure actUpdateBranch10PostExecute(Sender: TObject);
    procedure sgENBranch10ItemRowChanging(Sender: TObject; OldRow,
    NewRow: Integer; var Allow: Boolean);
    procedure actViewBranch10StandExecute(Sender: TObject);
    procedure actInsertBranch10StandExecute(Sender: TObject);
    procedure actDeleteBranch10StandExecute(Sender: TObject);
    procedure actEditBranch10StandExecute(Sender: TObject);
    procedure actUpdateBranch10StandExecute(Sender: TObject);
    procedure actFilterBranch10StandExecute(Sender: TObject);
    procedure actNoFilterBranch10StandExecute(Sender: TObject);
    procedure actViewBranch10TraversExecute(Sender: TObject);
    procedure actInsertBranch10TraversExecute(Sender: TObject);
    procedure actDeleteBranch10TraversExecute(Sender: TObject);
    procedure actEditBranch10TraversExecute(Sender: TObject);
    procedure actUpdateBranch10TraversExecute(Sender: TObject);
    procedure actFilterBranch10TraversExecute(Sender: TObject);
    procedure actNoFilterBranch10TraversExecute(Sender: TObject);
    procedure actViewBranch10HookExecute(Sender: TObject);
    procedure actInsertBranch10HookExecute(Sender: TObject);
    procedure actDeleteBranch10HookExecute(Sender: TObject);
    procedure actEditBranch10HookExecute(Sender: TObject);
    procedure actUpdateBranch10HookExecute(Sender: TObject);
    procedure actFilterBranch10HookExecute(Sender: TObject);
    procedure actNoFilterBranch10HookExecute(Sender: TObject);
    procedure actViewBranch10InsulatorExecute(Sender: TObject);
    procedure actInsertBranch10InsulatorExecute(Sender: TObject);
    procedure actDeleteBranch10InsulatorExecute(Sender: TObject);
    procedure actEditBranch10InsulatorExecute(Sender: TObject);
    procedure actUpdateBranch10InsulatorExecute(Sender: TObject);
    procedure actViewBranch10DisconnectorExecute(Sender: TObject);
    procedure actInsertBranch10DisconnectorExecute(Sender: TObject);
    procedure actDeleteBranch10DisconnectorExecute(Sender: TObject);
    procedure actEditBranch10DisconnectorExecute(Sender: TObject);
    procedure actUpdateBranch10DisconnectorExecute(Sender: TObject);
    procedure pcBranch10PostEquipmentChange(Sender: TObject);
    procedure sgENCabelOut10RowChanging(Sender: TObject; OldRow,
    NewRow: Integer; var Allow: Boolean);
    procedure actUnlinkPostExecute(Sender: TObject);
    procedure sgENAirCrossingRowChanging(Sender: TObject; OldRow,
    NewRow: Integer; var Allow: Boolean);
    procedure actPassportLine10Execute(Sender: TObject);
    procedure spbSubStation150Click(Sender: TObject);
    procedure sb150cellClick(Sender: TObject);
    procedure spbOwnerClick(Sender: TObject);
    procedure actViewP4OExecute(Sender: TObject);
    procedure actInsertP4OExecute(Sender: TObject);
    procedure updateP4O;
    procedure actDeleteP4OExecute(Sender: TObject);
    procedure actEditP4OExecute(Sender: TObject);
    procedure actUpdateP4OExecute(Sender: TObject);
    procedure actViewInspectionSheetExecute(Sender: TObject);
    procedure actInsertENInspectionSheetExecute(Sender: TObject);
    procedure actDeleteENInspectionSheetExecute(Sender: TObject);
    procedure actEditENInspectionSheetExecute(Sender: TObject);
    procedure actUpdateENInspectionSheetExecute(Sender: TObject);
    procedure actSendToSigningExecute(Sender: TObject);
    procedure actUnSigningExecute(Sender: TObject);
    procedure actSignedExecute(Sender: TObject);
    procedure actUnSignedExecute(Sender: TObject);
    procedure pmInspectionSheetPopup(Sender: TObject);
    procedure sgENInspectionSheetClick(Sender: TObject);
    procedure sgENInspectionSheetDblClick(Sender: TObject);
    procedure spbFINExecutorClick(Sender: TObject);
    procedure actCopySheetExecute(Sender: TObject);
    procedure LoadCCElement();
    procedure LoadCCDamageLog();
    procedure OpenSLAMO(Sender: TObject);
    procedure sgCCElementDataDblClick(Sender: TObject);
    procedure sgENActDblClick(Sender: TObject);
    procedure btnEvaluateTechnicalStatusClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure actViewENSettingsExecute(Sender: TObject);
    procedure actEditENSettingsExecute(Sender: TObject);
    procedure actUpdateENSettingsExecute(Sender: TObject);
    procedure btnGeographClick(Sender: TObject);
    procedure btnGeographClearClick(Sender: TObject);
    procedure actLoadAttachmentExecute(Sender: TObject);
    procedure actAddAttachmentExecute(Sender: TObject);
    procedure actDeleteAttachmentExecute(Sender: TObject);
    procedure actUpdateAttachmentsExecute(Sender: TObject);
    procedure sgCCDamageLogDblClick(Sender: TObject);
    procedure spbGetBaseDistanceClick(Sender: TObject);
    procedure tbiDamagesXLSClick(Sender: TObject);


    private
    { Private declarations }
    procedure UpdateGridAct(Sender: TObject);          //Акты
    procedure UpdateGridPW(Sender: TObject);           //Планы

    procedure UpdateGridStand(Sender: TObject; strCode: String);        //Стойки опоры
    procedure UpdateGridTravers(Sender: TObject; strCode: String);      //Траверсы на опоре
    procedure UpdateGridHook(Sender: TObject; strCode: String);         //Крюки ороры
    procedure UpdateGridInsulator(Sender: TObject; strCode: String);    //Изоляторы на опоре
    procedure UpdateGridDisconnector(Sender: TObject; strCode: String); //Разъединители на опоре
    procedure UpdateGridBranch10Item(Sender: TObject;
    strBranch10Code: String);                        //Опоры Ответвления ВЛ
    procedure UpdateGridBranch10Stand(Sender: TObject; strCode: String);        //Стойки опоры ответвления
    procedure UpdateGridBranch10Travers(Sender: TObject; strCode: String);      //Траверсы на опоре ответвления
    procedure UpdateGridBranch10Hook(Sender: TObject; strCode: String);         //Крюки ороры ответвления
    procedure UpdateGridBranch10Insulator(Sender: TObject; strCode: String);    //Изоляторы на опоре ответвления
    procedure UpdateGridBranch10Disconnector(Sender: TObject; strCode: String); //Разъединители на опоре ответвления
    procedure UpdateGridCabelOut10Item(Sender: TObject; strCode: String);       //Опоры, между которыми проложена Кабельная вставка
                                                                    //или от которой осуществлён Кабельный выход
    procedure UpdateGridAirCrossingItem(Sender: TObject; strCode: String);      //Опоры, ограничивающие воздушные пересечения

    procedure recalcSubstation04();           //Пересчёт количества ТП 10 - 6 / 0,4 кВ, питающихся от ВЛ 6 - 10 кВ
    procedure recalcPost();                   //Пересчёт количества Опор, удерживающих ВЛ 6 - 10 кВ
    procedure recalcStand();                  //Пересчёт количества Стоек Опор, удерживающих ВЛ 6 - 10 кВ
    procedure recalcTravers();                //Пересчёт количества Траверс Опор, удерживающих ВЛ 6 - 10 кВ
    procedure recalcInsulator();              //Пересчёт количества Изоляторов на Опорах, удерживающих ВЛ 6 - 10 кВ
    procedure recalcDisconnector();           //Пересчёт количества Разъединителей на Опорах, удерживающих ВЛ 6 - 10 кВ
    procedure recalcBranch10();               //Пересчёт количества Воздушных Ответвлений от ВЛ 6 - 10 кВ
    procedure recalcBranch10Item();           //Пересчёт количества Опор, удерживающих Воздушные Ответвления от ВЛ 6 - 10 кВ
    procedure recalcBranch10Stand();          //Пересчёт количества Стоек Опор, удерживающих Воздушные Ответвления от ВЛ 6 - 10 кВ
    procedure recalcBranch10Travers();        //Пересчёт количества Траверс Опор, удерживающих Воздушные Ответвления от ВЛ 6 - 10 кВ
    procedure recalcBranch10Insulator();      //Пересчёт количества Изоляторов на Опорах, удерживающих Воздушные Ответвления от ВЛ 6 - 10 кВ
    procedure recalcBranch10Disconnector();   //Пересчёт количества Разъединителей на Опорах, удерживающих Воздушные Ответвления от ВЛ 6 - 10 кВ
    procedure recalcCabelOut10();             //Пересчёт количества Кабельных Выходов и Вставок ВЛ 6 - 10 кВ
    procedure recalcAirCrossingUp();          //Пересчёт количества Воздушных Пересечений ВЛ 6 - 10 кВ, Объекты сверху
    procedure recalcAirCrossingDown();        //Пересчёт количества Воздушных Пересечений ВЛ 6 - 10 кВ, Объекты снизу
    procedure recalcAll();                    //Пересчёт количества оборудования и поддержки ВЛ 6 - 10 кВ, зависимых объектов

    procedure addressesRewrite();             //Заполнение списка адресов, через которвые проходит ВЛ 6 - 10 кВ
    procedure LoadTechnicalStatus(Sender: TObject);
    procedure updateAttachments();            //Обновление списка вложений
    procedure getBaseDistance();
  public
    { Public declarations }

end;

var
  frmENLine10Edit: TfrmENLine10Edit;
  ENLine10Obj: ENLine10;
  cellCode:Integer;
  ENObjectsTechnicalStatusObj: ENObjectsTechnicalStatus;

  LastCount, ColCountP4O, LastCountP4O: Integer;
  LastRowP4O: Integer = 1;
  ENPost10OKSNHeaders: array [1..5] of String =
        ( 'Код'
          ,'Номер опори'
          ,'Максимальна кількість проводів підвісу'
          ,'Тип опори'
          ,'Наименование отпайки'
        );



implementation

uses
  ShowEPWorker, ShowEPVoltageNominal, ShowENElement, ENElementController,
  EditENSubstation04, ENSubstation04Controller, ENOwnerController,
  ENBelongingController, ShowENEPRen, OSTableController, ShowOStable,
  ENHighVoltageSellController, ENPostController, EditENPost,
  ENStandController, EditENStand, EditENStandFilter,
  ENTraversController, EditENTravers, EditENTraversFilter,
  ENHookController, EditENHook,EditENHookFilter,
  ENBranch10Controller, EditENBranch10, EditENBranch10Filter,
  ENBranch10ItemController, EditENBranch10Item, EditENBranch10ItemFilter,
  ENCabelOut10Controller, EditENCabelOut10, EditENCabelOut10Filter,
  ENCabelOut10ItemController, EditENCabelOut10Item, EditENCabelOut10ItemFilter,
  ENDisconnectorController, EditENDisconnector, EditENDisconnectorFilter,
  ENInsulatorController, EditENInsulator, EditENInsulatorFilter,
  ENLineRouteController, EditENLineRoute, EditENLineRouteFilter,
  ENLandscapeController, EditENLandscape, EditENLandscapeFilter,
  ENActController, ENPlanWorkController, ENConsts, EditENAct, EditENActFilter,
  EditENPlanWork, EditENPlanWorkFilter, ShowENPlanWork, DMReportsUnit,
  ShowENPost, ENAirCrossingController, EditENAirCrossing, ShowENAirCrossing,
  EditENAirCrossingFilter, ENAirCrossingItemController, EditENAirCrossingItem,
  ShowENAirCrossingItem, EditENAirCrossingItemFilter, ENObjCrossUpController,
  ENObjCrossDownController, ENSubstation150Controller, ShowENSubstation150,
  ENLine10SuppliesController,ShowENSubst150Cell, ShowENOwner, EditENPost10OKSN,
  ENPost10OKSNController, EditENInspectionSheet, ENInspectionSheetController,
  AddENInspectionSheet, ShowFINExecutorTree, FINExecutorController,
  EditCCElementData, EditTopologyF10, EditCCFeeder,
  ENDocAttachmentController, EditDFDocAttachment,
  ENDocAttachmentServerController, Globals, ENDocAttachmentStatusController
  , ENSettingsController
  , EditENSettings

  , ENGeographicDepartmentController, ShowENGeographicDepartment
  , EditCCDamageLog;

{$R *.dfm}

var
  ColCount: Integer;
  LastRow: Integer = 1;

  selectedPWRow, selectedPost4OKSNRow: Integer;
  outerPWCondition: String;
  disableControlsTypePW: TDisableType;

  pstAddrFilter: ENPostFilter;
  pstAddrColCount, pstAddrLastCount: Integer;
  pstAddrLastRow: Integer = 1;
  AddressesHeaders : array [1..7] of String =
        (   'Код опори'
          , '№ опори'
          , 'Область'
          , 'Район'
          , 'Населений пункт'
          , 'Вулиця'
          , '№ вул.'
        );

  s04Filter: ENSubstation04Filter;                  //ТП 10 - 6 / 0,4 кВ
  s04ColCount, s04LastCount: Integer;
  s04LastRow: Integer = 1;
  ENSubstation04Headers: array [1..3] of String =
        (  'Код'
          ,'Назва підстанції 10-6/0.4'
          ,'Потужність, кВА'
        );
  ENHighVoltageSellHeaders: array [1..4] of String =
        ( 'Код'
          ,'Тип'
          ,'Найменування'
          ,'Номер'
        );

  pFilterObject: ENPostFilter;                      //Опори
  pColCount, pLastCount: Integer;
  pLastRow: Integer = 1;
  ENPostHeaders: array [1..8] of String =
        ( 'Код'
          ,'Тип опори'
          ,'Заземлення'
          ,'Номер опори'
          ,'Довжина стояка, м'
          ,'Дата останнього ремонту'
          ,'Рік встановлення'
          //,'Матеріал опори'
          ,'Примітка'
        );

  stFilterObject: ENStandFilter;                    //Стойки опори
  stColCount, stLastCount: Integer;
  stLastRow: Integer = 1;
  ENStandHeaders: array [1..4] of String =
        ( 'Код'
          ,'Тип стойки'
          ,'Матеріал стойки'
          ,'Примітка'
        );

  trFilterObject: ENTraversFilter;                  //Траверси опори
  trColCount, trLastCount: Integer;
  trLastRow: Integer = 1;
  ENTraversHeaders: array [1..4] of String =
        ( 'Код'
          ,'Тип траверсної оснастки'
          ,'Матеріал траверси'
          ,'Примітка'
        );

  hkFilterObject: ENHookFilter;                     //Крюки опори
  hkColCount, hkLastCount: Integer;
  hkLastRow: Integer = 1;
  ENHookHeaders: array [1..4] of String =
        ( 'Код'
          ,'Тип крюку'
          ,'Матеріал крюку'
          ,'Примітка'
        );

  insFilterObject: ENInsulatorFilter;               //Изоляторы
  insColCount, insLastCount: Integer;
  insLastRow: Integer = 1;
  ENInsulatorHeaders: array [1..4] of String =
        ( 'Код'
          ,'Тип'
          ,'Матеріал ізолятору'
          ,'Напруга, кВ'
        );

  dFilterObject: ENDisconnectorFilter;              //Разъединители
  dColCount, dLastCount: Integer;
  dLastRow: Integer = 1;
  ENDisconnectorHeaders: array [1..5] of String =
        ( 'Код'
          ,'Матеріал роз''єднувача'
          ,'Напруга ном., кВ'
          ,'Струм ном., А'
          ,'Привід раз''єднувача'
        );

  br10Filter: ENBranch10Filter;                     //Ответвления ВЛ 6 - 10 кВ
  br10ColCount, br10LastCount: Integer;
  br10LastRow: Integer = 1;
  ENBranch10Headers: array [1..5] of String =
        (  'Код'
          ,'Напрямок (призначення)'
          ,'Довжина, км'
          ,'Вимикаючий пункт'
          ,'№ опори, від якої здійснено відгалудження'
        );

  b10iFilterObject: ENBranch10ItemFilter;
  b10iColCount, b10iLastCount: Integer;
  b10iLastRow: Integer = 1;                         //Связь опор с Ответвлениями
  ENBranch10ItemHeaders: array [1..9] of String =
        (  'Код зв''язку опори з відгалудженням'
          ,'Тип опори'
          ,'Заземлення'
          ,'Номер опори'
          ,'Довжина стояка, м'
          ,'Дата останнього ремонту'
          ,'Рік встановлення'
          //,'Матеріал опори'
          ,'Примітка'
          ,'Код опори'
        );

  co10Filter: ENCabelOut10Filter;                   //Кабельные выходы и вставки
  co10ColCount, co10LastCount: Integer;
  co10LastRow: Integer = 1;
  ENCabelOut10Headers: array [1..6] of String =
        (  'Код'
          ,'Призначення'
          ,'Марка кабелю'
          ,'Довжина кабелю, м'
          ,'Тип муфти'
          ,'Примітки'
        );

  ic10Filter: ENCabelOut10ItemFilter;               //Опоры Кабельных выходов
  ic10ColCount, ic10LastCount: Integer;             //и вставок
  ic10LastRow: Integer = 1;
  ENCabelOut10ItemHeaders: array [1..10] of String =
        (  'Код зв''язку опори з кабельним виходом / вставкою'
          ,'Тип опори'
          ,'Заземлення'
          ,'Номер опори'
          ,'Довжина стояка, м'
          ,'Дата останнього ремонту'
          ,'Рік встановлення'
          ,'Матеріал опори'
          ,'Примітка'
          ,'Код опори'
        );

  acrFilter: ENAirCrossingFilter;                   //Воздушные пересечения
  acrColCount, acrLastCount: Integer;
  acrLastRow: Integer = 1;
  ENAirCrossingHeaders: array [1..9] of String =
        (  'Код'
          ,'Об''єкт під ПЛ 6 - 10 кВ, який перетинається'
          ,'КЛ'
          ,'ПЛ 0,4 кВ'
          ,'Об''єкт над ПЛ 6 - 10 кВ, який перетинає'
          ,'ПЛ 35 - 150 кВ'
          ,'Габарит нижнього проводу до об''єкту, який перетинається при Т = + 40 С, м'
          ,'Довжина прольоту, м'
          ,'Кріплення проводів'
        );

  iacFilter: ENAirCrossingItemFilter;               //Опоры, ограничивающие
  iacColCount, iacLastCount: Integer;               //Воздушные пересечения
  iacLastRow: Integer = 1;
  ENAirCrossingItemHeaders: array [1..10] of String =
        (  'Код зв''язку опори з повітряним перетинанням'
          ,'Тип опори'
          ,'Заземлення'
          ,'Номер опори'
          ,'Довжина стояка, м'
          ,'Дата останнього ремонту'
          ,'Рік встановлення'
          ,'Матеріал опори'
          ,'Примітка'
          ,'Код опори'
        );


  lrFilter: ENLineRouteFilter;                      //Трасса ВЛ 6 - 10 кВ
  lrColCount, lrLastCount: Integer;
  lrLastRow: Integer = 1;
  ENLineRouteHeaders: array [1..6] of String =
        ( 'Код'
          ,'Місцевість'
          ,'№ 1-ої опори'
          ,'№ 2-ої опори'
          ,'Дистанція, км'
          ,'Ланцюг траси'
        );

  actFilterObject: ENActFilter;                     //Акты
  actColCount, actLastCount: Integer;
  actLastRow: Integer = 1;
  ENActHeaders: array [1..11] of String =
        ( 'Код'
          ,'Номер акту'
          ,'Дата проведення акту'
          ,'Дата акту'
          ,'Код МОЛ / ПІБ з Фін. Кол.'
          ,'Тип'
          ,'Підвид робіт плану'
          ,'Людино-години'
          ,'Статус'
          ,'Зробивший зміни користувач'
          ,'Дата останніх змін'
        );

  pwFilterObject: ENPlanWorkFilter;                 //Планы
  pwColCount, pwLastCount: Integer;
  pwLastRow: Integer = 1;
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

  ENDocAttachmentHeaders: array [1..7] of String =
       ( 'Код'
         ,'Коментар до вкладення'
         ,'Посилання на файл'
         ,'Користувач, що додав вкладення'
         ,'Дата додавання'
         ,'Користувач, що змінив вкладення'
         ,'Дата зміни'
       );



procedure TfrmENLine10Edit.FormShow(Sender: TObject);
var
  TempENHighVoltageSell: ENHighVoltageSellControllerSoapPort;
  hvsObj: ENHighVoltageSell;
  TempENLine10Supplies: ENLine10SuppliesControllerSoapPort;
  listENLine10Supplies: ENLine10SuppliesShortList;
  filterENLine10Supplies: ENLine10SuppliesFilter;
  TempENSubst150Cell :ENSubst150CellControllerSoapPort;
  cell150:ENSubst150Cell;
  TempENOwner : ENOwnerControllerSoapPort;
  TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
  ENGeographicDepartmentObj : ENGeographicDepartment;
begin
  btnEvaluateTechnicalStatus.Visible := (DialogState = dsEdit);
  gbENSettings.Enabled := (DialogState = dsEdit);

  DisableActions([actSendToSigning, actUnSigning, actSigned, actUnSigned]);

  TempENSubst150Cell := HTTPRIOENSubst150Cell as ENSubst150CellControllerSoapPort;
  FormatSettings.DecimalSeparator := '.';  //SUPP-6765. Контроль ввода данных в текстовые поля
  SetIntStyle([edtYearBuild, edtYearWorkingStart]);
  SetFloatStyle([edtLineLength, edtExtentForest, edtTotalLengthCable,
                 edtBaseDistance, edtMaxFallPower, edtLengthToReconstruct]);

  SetIntStyle([edtTotalCountArmored, edtTotalCountWood, edtTotalCountInsulator, edtTotalCountTraverse]);

  DisableControls([edtBuhName, edtENHighVoltageSellName, spbENHighVoltageSell,
    edtSubStation150, edtOwner
    , edtDefectCountArmored, edtDefectCountWood, edtDefectLengthtCable
    , edtDefectCountInsulator, edtDefectCountTraverse
    , edtVKD, edtVKDO, edtVKDP, edtVKDI, edtMaxFallPower , edtGeograph ]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtEPWorkerName, edtEPVoltageNominalName, edtEPRenName]);
    DenyBlankValues([edtName, edtLineLength, edtEPVoltageNominalName, edtEPRenName
      , edtTotalCountArmored, edtTotalCountWood, edtTotalLengthCable, edtLengthToReconstruct
      , edtTotalCountInsulator, edtTotalCountTraverse, edtBaseDistance ]);
  end;

  pcLine10.ActivePage := tsLine10;
  pcPostEquipment.ActivePage := tsInsulator;
  pcBranch10PostEquipment.ActivePage := tsBranch10Stand;

  recalcAll; //Пересчёт количества оборудования и поддержки ВЛ 6 - 10 кВ, зависимых объектов
  addressesRewrite; //Заполнение списка адресов, через которвые проходит ВЛ 6 - 10 кВ

  if  (DialogState = dsInsert) then
    begin
      showMainTabOnly(pcLine10, tsLine10);
      DisableControls([spbSubStation150]);
    end;

  if (DialogState = dsView) then
    begin
      DisableControls([spbEPWorker, spbEPVoltageNominal, spbEPRen, spbOSSelect,
        spbSubStation150, spbOwner , btnGeograph , btnGeographClear ]);
      DisableActions([actInsert, actDelete, actEdit,
        actInsertStand, actDeleteStand, actEditStand,
        actInsertTravers, actDeleteTravers, actEditTravers,
        actInsertHook, actDeleteHook, actEditHook,
        actInsertInsulator, actDeleteInsulator, actEditInsulator,
        actChangeInsulator, actUninstallInsulator, actInstallInsulator,
        actInsertDisconnector, actDeleteDisconnector, actEditDisconnector,
        actChangeDisconnector, actUninstallDisconnector, actInstallDisconnector,
        actInsertBranch10Post, actDeleteBranch10Post, actEditBranch10Post,
        actInsertBranch10Disconnector, actDeleteBranch10Disconnector,
          actEditBranch10Disconnector,
        actInsertBranch10Insulator, actDeleteBranch10Insulator,
          actEditBranch10Insulator,
        actInsertBranch10Hook, actDeleteBranch10Hook, actEditBranch10Hook,
        actInsertBranch10Travers, actDeleteBranch10Travers,
          actEditBranch10Travers,
        actInsertBranch10Stand, actDeleteBranch10Stand, actEditBranch10Stand,
        actSelectPost, actUnlinkPost,
        actPassportLine10]);
      HideControls([spbGetBaseDistance]);
    end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ENLine10Obj.element.geoDepartmentRef <> nil then
      if ENLine10Obj.element.geoDepartmentRef.code <> LOW_INT then
       begin// geodept
          TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
        try
          ENGeographicDepartmentObj := TempENGeographicDepartment.getObject( ENLine10Obj.element.geoDepartmentRef.code );
          edtGeograph.Text := ENGeographicDepartmentObj.name;
        except
          on EConvertError do Exit;
        end;
       end;


    LoadTechnicalStatus(Sender);

    DisableControls([spbEPRen]);

    edtInvNumber.Text := ENLine10Obj.invNumber;

    edtName.Text := ENLine10Obj.name;

    if ENLine10Obj.substationcellrefcode>0 then
    begin
    cell150:=TempENSubst150Cell.getObject(ENLine10Obj.substationcellrefcode);
    cellCode:=ENLine10Obj.substationcellrefcode;
    edtSubst150Cell.text:=cell150.name;
    end
    else
    begin
     cellCode:=Low(Integer);
     edtSubst150Cell.text:='';
    end;
    edtBuhName.Text := ENLine10Obj.buhName;
    if ( ENLine10Obj.lineLength <> nil ) then
       edtLineLength.Text := ENLine10Obj.lineLength.decimalString
    else
       edtLineLength.Text := '';

    if ( ENLine10Obj.extentForest <> nil ) then
       edtExtentForest.Text := ENLine10Obj.extentForest.decimalString
    else
       edtExtentForest.Text := '';

    if ENLine10Obj.lastRepairDate <> nil then
    begin
      edtLastRepairDate.DateTime := EncodeDate(ENLine10Obj.lastRepairDate.Year,
        ENLine10Obj.lastRepairDate.Month,ENLine10Obj.lastRepairDate.Day);
      edtLastRepairDate.checked := true;
    end
    else
    begin
      edtLastRepairDate.DateTime:=SysUtils.Date;
      edtLastRepairDate.checked := false;
    end;

    if ENLine10Obj.ownerRef <> nil then
      if ENLine10Obj.ownerRef.code <> Low(Integer) then
      begin
        TempENOwner := HTTPRIOENOwner as ENOwnerControllerSoapPort;
        edtOwner.Text := TempENOwner.getObject(ENLine10Obj.ownerRef.code).name;
      end
      else
        edtOwner.Text := ''
    else
      edtOwner.Text := '';

    cbBelonging.ItemIndex := -1;
    if ENLine10Obj.belongingRef <> nil then
      if ENLine10Obj.belongingRef.code <> Low(Integer) then
        cbBelonging.ItemIndex := ENLine10Obj.belongingRef.code;


    if ( ENLine10Obj.yearBuild <> Low(Integer) ) then
       edtYearBuild.Text := IntToStr(ENLine10Obj.yearBuild)
    else
       edtYearBuild.Text := '';

    if ( ENLine10Obj.yearWorkingStart <> Low(Integer) ) then
       edtYearWorkingStart.Text := IntToStr(ENLine10Obj.yearWorkingStart)
    else
       edtYearWorkingStart.Text := '';


    edtNameProject.Text := ENLine10Obj.nameProject;
    edtNameBuilder.Text := ENLine10Obj.nameBuilder;
    MakeMultiline(edtMainCustomersData.Lines, ENLine10Obj.mainCustomersData);
    //edtMoreData.Text := ENLine10Obj.moreData;
    MakeMultiline(edtMoreData.Lines, ENLine10Obj.moreData);


      if ENLine10Obj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENLine10Obj.dateGen.Year,ENLine10Obj.dateGen.Month,ENLine10Obj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;

    if ENLine10Obj.worker <> nil then
      edtEPWorkerName.Text := ENLine10Obj.worker.surname; //ENLine10Obj.worker.name;

    if ENLine10Obj.voltagenominal <> nil then
       if  ENLine10Obj.voltagenominal.value <> nil then
           edtEPVoltageNominalName.Text := ENLine10Obj.voltagenominal.value.DecimalString
       else
           edtEPVoltageNominalName.Text := ''
    else
       edtEPVoltageNominalName.Text := '';

    if ENLine10Obj.element <> nil then
       if  ENLine10Obj.element.renRef <> nil then
           edtEPRenName.Text := ENLine10Obj.element.renRef.name
       else
           edtEPRenName.Text := ''
    else
       edtEPRenName.Text := '';


    if ENLine10Obj.element.finExecutor <> nil then
      if ENLine10Obj.element.finExecutor.code > LOW_INT then
       begin
         edtFINExecutorName.Text := ENLine10Obj.element.finExecutor.name;
       end;


    TempENHighVoltageSell :=
      HTTPRIOENHighVoltageSell as ENHighVoltageSellControllerSoapPort;
    hvsObj := TempENHighVoltageSell.getObject(ENLine10Obj.highVoltageSell.code);
    if hvsObj <> nil then
      edtENHighVoltageSellName.Text := 'Ячейка № ' + hvsObj.numberGen;
    //edtENElementName.Text := ENLine10Obj.elementRef.name;

    //ПС 150 - 35 / 10 - 6 кВ, питающая ВЛ 6 - 10 кВ
    TempENLine10Supplies :=
      HTTPRIOENLine10Supplies as ENLine10SuppliesControllerSoapPort;
    filterENLine10Supplies := ENLine10SuppliesFilter.Create;
    try
      SetNullIntProps(filterENLine10Supplies);
      SetNullXSProps(filterENLine10Supplies);
      ENLine10SuppliesFilter(filterENLine10Supplies).conditionSQL :=
        ' ENLINE10SUPPLIES.LINE10REFCODE = '
        + IntToStr(ENLine10Obj.code);
      listENLine10Supplies :=
        TempENLine10Supplies.getScrollableFilteredList(
          filterENLine10Supplies, 0, 1);
      if listENLine10Supplies.totalCount > 0 then
        edtSubStation150.Text :=
          listENLine10Supplies.list[0].substation150RefName;
    except
      on EConvertError do Exit;
    end;

  end;

    updateP4O;

end;



procedure TfrmENLine10Edit.getBaseDistance;
var
  TempENObjectsTechnicalStatus: ENObjectsTechnicalStatusControllerSoapPort;
begin
  if ENLine10Obj = nil then Exit;
  if ENLine10Obj.code = Low(Integer) then Exit;

  TempENObjectsTechnicalStatus := HTTPRIOENObjectsTechnicalStatus as ENObjectsTechnicalStatusControllerSoapPort;
  SetTXSDecimalForTEdit(edtBaseDistance, TempENObjectsTechnicalStatus.getBaseDistance(ENLine10Obj.code));
end;

procedure TfrmENLine10Edit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENLine10: ENLine10ControllerSoapPort;
    Line10Filter: ENLine10Filter;
    Line10List: ENLine10ShortList;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtName, edtLineLength{, edtExtentForest}]) then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin

    {if ENLine10Obj.worker <> nil then
    begin
       if ENLine10Obj.worker.code = low(Integer) then
       begin
          Application.MessageBox(PChar('Введіть працівника, що склав паспорт !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
          if edtEPWorkerName.CanFocus then edtEPWorkerName.SetFocus;
          Action:=caNone;
          Abort;
       end;
    end
    else
    begin
          Application.MessageBox(PChar('Введіть працівника, що склав паспорт !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
          if edtEPWorkerName.CanFocus then edtEPWorkerName.SetFocus;
          Action:=caNone;
          Abort;
    end;

    if not edtDateGen.Checked then
    begin
      Application.MessageBox(PChar('Введіть дату складання паспорту !'), PChar('Увага !'), MB_ICONWARNING+MB_OK);
      Action := caNone;
      if edtDateGen.CanFocus then edtDateGen.SetFocus;
      Exit;
    end;    }

    if ENLine10Obj.voltagenominal <> nil then
    begin
       if ENLine10Obj.voltagenominal.code = low(Integer) then
       begin
          Application.MessageBox(PChar('Оберіть номінальну напругу !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
          if edtEPVoltageNominalName.CanFocus then edtEPVoltageNominalName.SetFocus;
          Action:=caNone;
          Abort;
       end;
    end
    else
    begin
          Application.MessageBox(PChar('Оберіть номінальну напругу !!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
          if edtEPVoltageNominalName.CanFocus then edtEPVoltageNominalName.SetFocus;
          Action:=caNone;
          abort;
    end;

    if ENLine10Obj.element.renRef <> nil then
    begin
       if ENLine10Obj.element.renRef.code = low(Integer) then
       begin
          Application.MessageBox(PChar('Оберіть підрозділ !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
          if edtEPRenName.CanFocus then edtEPRenName.SetFocus;
          Action:=caNone;
          Abort;
       end;
    end
    else
    begin
          Application.MessageBox(PChar('Оберіть підрозділ !!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
          if edtEPRenName.CanFocus then edtEPRenName.SetFocus;
          Action:=caNone;
          abort;
    end;

    TempENLine10 := HTTPRIOENLine10 as ENLine10ControllerSoapPort;

    ///////
    if (edtName.Text <> '') and (edtInvNumber.Text <> '') then
    begin
      Line10Filter := ENLine10Filter.Create;
      try
        SetNullIntProps(Line10Filter);
        SetNullXSProps(Line10Filter);

        Line10Filter.invNumber := Trim(edtInvNumber.Text);
        Line10Filter.name := Trim(edtName.Text);
        if DialogState = dsEdit then
          Line10Filter.conditionSQL := 'code <> ' + IntToStr(ENLine10Obj.code);

        Line10List := TempENLine10.getScrollableFilteredList(Line10Filter, 0, -1);
        if Line10List.totalCount > 0 then
        begin
          Application.MessageBox(PChar('Объект с таким именем и инвентарным номером уже существует (код: ' + IntToStr(Line10List.list[0].code) + ')!'), PChar('Внимание !'), MB_ICONWARNING+MB_OK);
          Action := caNone;
          Exit;
        end;
      finally
        Line10Filter.Free;
      end;
    end;
    ///////


    ENLine10Obj.invNumber := edtInvNumber.Text;

    ENLine10Obj.name := edtName.Text;


     ENLine10Obj.buhName := edtBuhName.Text;

     if (ENLine10Obj.lineLength = nil ) then
       ENLine10Obj.lineLength := TXSDecimal.Create;
     if edtLineLength.Text <> '' then
       ENLine10Obj.lineLength.decimalString := edtLineLength.Text
     else
       ENLine10Obj.lineLength := nil;


     if cellCode>0 then
       ENLine10Obj.substationcellrefcode:=cellCode
     else
       ENLine10Obj.substationcellrefcode:=Low(Integer);

     if ENLine10Obj.belongingRef = nil then ENLine10Obj.belongingRef := ENBelongingRef.Create;
     ENLine10Obj.belongingRef.code := cbBelonging.ItemIndex;


     if edtLastRepairDate.Checked then
     begin
       if ENLine10Obj.lastRepairDate = nil then
         ENLine10Obj.lastRepairDate := TXSDate.Create;
       ENLine10Obj.lastRepairDate.XSToNative(GetXSDate(edtLastRepairDate.DateTime));
     end else
       ENLine10Obj.lastRepairDate := nil;


     if ( edtYearBuild.Text <> '' ) then
       ENLine10Obj.yearBuild := StrToInt(edtYearBuild.Text)
     else
       ENLine10Obj.yearBuild := Low(Integer) ;

     if ( edtYearWorkingStart.Text <> '' ) then
       ENLine10Obj.yearWorkingStart := StrToInt(edtYearWorkingStart.Text)
     else
       ENLine10Obj.yearWorkingStart := Low(Integer) ;

     ENLine10Obj.nameProject := edtNameProject.Text;
     ENLine10Obj.nameBuilder := edtNameBuilder.Text;


     if Length(edtMainCustomersData.Text) > 500 then
       ENLine10Obj.mainCustomersData := Copy(edtMainCustomersData.Text, 1, 500)
     else
       ENLine10Obj.mainCustomersData := edtMainCustomersData.Text;


     ENLine10Obj.moreData := edtMoreData.Text; 

     if edtDateGen.Checked then
     begin
       if ENLine10Obj.dateGen = nil then
          ENLine10Obj.dateGen := TXSDate.Create;
        ENLine10Obj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end else
       ENLine10Obj.dateGen := nil;

    if (ENLine10Obj.extentForest = nil ) then
      ENLine10Obj.extentForest := TXSDecimal.Create;
    if edtExtentForest.Text <> '' then
      ENLine10Obj.extentForest.decimalString := edtExtentForest.Text
    else
      ENLine10Obj.extentForest := nil;

    if DialogState = dsInsert then
    begin
      ENLine10Obj.code:=low(Integer);
      TempENLine10.add(ENLine10Obj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENLine10.save(ENLine10Obj);
    end;

  end;
end;

procedure TfrmENLine10Edit.spbEPWorkerClick(Sender : TObject);
var 
   frmEPWorkerShow: TfrmEPWorkerShow;
begin
   frmEPWorkerShow:=TfrmEPWorkerShow.Create(Application,fmNormal);
   try
      with frmEPWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENLine10Obj.worker = nil then ENLine10Obj.worker := EPWorker.Create();
               ENLine10Obj.worker.code := StrToInt(frmEPWorkerShow.GetReturnValue(sgMain,0));
               edtEPWorkerName.Text := frmEPWorkerShow.GetReturnValue(sgMain,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPWorkerShow.Free;
   end;
end;


procedure TfrmENLine10Edit.spbFINExecutorClick(Sender: TObject);
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

               ENLine10Obj.element.finExecutor :=
                 DMReports.finExecutorShort2finExecutor(FINExecutorShort(tvDep.Selected.Data),
                                                        DMReports.getFullExecutorName(tvDep.Selected));

               edtFINExecutorName.Text := ENLine10Obj.element.finExecutor.name;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINExecutorTreeShow.Free;
   end;
end;

procedure TfrmENLine10Edit.spbGetBaseDistanceClick(Sender: TObject);
begin
  getBaseDistance;
end;

procedure TfrmENLine10Edit.spbEPVoltageNominalClick(Sender : TObject);
var
   frmEPVoltageNominalShow: TfrmEPVoltageNominalShow;
   EPVoltageNominalFilterObj: EPVoltageNominalFilter; 
begin
   EPVoltageNominalFilterObj := EPVoltageNominalFilter.Create;
   SetNullIntProps(EPVoltageNominalFilterObj);
   SetNullXSProps(EPVoltageNominalFilterObj);
   EPVoltageNominalFilterObj.conditionSQL := ' code in (5,6)';

   frmEPVoltageNominalShow:=TfrmEPVoltageNominalShow.Create(Application, fmNormal, EPVoltageNominalFilterObj);
   try
      with frmEPVoltageNominalShow do
        if ShowModal = mrOk then
        begin
            try
               if ENLine10Obj.voltagenominal = nil then ENLine10Obj.voltagenominal := EPVoltageNominal.Create();
               ENLine10Obj.voltagenominal.code := StrToInt(GetReturnValue(sgMain,0));
               edtEPVoltageNominalName.Text:=GetReturnValue(sgMain,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPVoltageNominalShow.Free;
   end;
end;


procedure TfrmENLine10Edit.actInsertENInspectionSheetExecute(Sender: TObject);
begin
  inherited;
  if pcLine10.ActivePage = tsENInspectionSheet then
  begin
    try
      frmENInspectionSheetAdd := TfrmENInspectionSheetAdd.Create(Application, dsInsert);
      frmENInspectionSheetAdd.elementType := ENLine10Obj.element.typeRef.code;

      frmENInspectionSheetAdd.ENInspectionSheetObj := ENInspectionSheet.Create;
      SetNullIntProps(frmENInspectionSheetAdd.ENInspectionSheetObj);
      SetNullXSProps(frmENInspectionSheetAdd.ENInspectionSheetObj);

      frmENInspectionSheetAdd.ENInspectionSheetObj.elementRef := ENElementRef.Create;
      frmENInspectionSheetAdd.ENInspectionSheetObj.elementRef.code := ENLine10Obj.element.code;
      frmENInspectionSheetAdd.ENInspectionSheetObj.equipmentKind := EQUIPMENTKIND_LOW_VOLTAGE;

      try
        if frmENInspectionSheetAdd.ShowModal = mrOk then
        begin
          if frmENInspectionSheetAdd.ENInspectionSheetObj <> nil then
            pcLine10Change(Sender);
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


procedure TfrmENLine10Edit.actInsertExecute(Sender: TObject);
Var TempENSubstation04: ENSubstation04ControllerSoapPort; //ТП 10 - 6 / 0,4 кВ
  //TempENPost: ENPostControllerSoapPort;                   //Опоры
  //TempENBranch10: ENBranch10ControllerSoapPort;           //Воздушные Ответвления от ВЛ 6 - 10 кВ
  //TempENAirCrossing: ENAirCrossingControllerSoapPort;     //Воздушные пересечения
  //TempENLineRoute: ENLineRouteControllerSoapPort;         //Характеристика местности по трассе ВЛ 6 - 10 кВ
  //TempENCabelOut10: ENCabelOut10ControllerSoapPort;       //Кабельные выходы из / вставки в ВЛ 6 - 10 кВ
begin
  if pcLine10.ActivePage = tsSubstation04 then
    begin //Трансформаторні підстанції 10 - 6 / 0,4 кВ
      TempENSubstation04 :=
        HTTPRIOENSubstation04 as ENSubstation04ControllerSoapPort;
      ENSubstation04Obj := ENSubstation04.Create;
      ENSubstation04Obj.element := ENElement.Create;
      ENSubstation04Obj.element.elementInRef := ENElementRef.Create;
      ENSubstation04Obj.element.elementInRef.code := ENLine10Obj.element.code;
      ENSubstation04Obj.element.renRef := EPRenRef.Create;
      ENSubstation04Obj.element.renRef.code := ENLine10Obj.element.renRef.code;
      ENSubstation04Obj.nominalPower:= TXSDecimal.Create;
      try
        frmENSubstation04Edit :=
          TfrmENSubstation04Edit.Create(Application, dsInsert);
        try
          frmENSubstation04Edit.lblENLine10Name.Visible := True;
          frmENSubstation04Edit.edtENLine10Name.Visible := True;
          frmENSubstation04Edit.edtENLine10Name.Text := ENLine10Obj.name;
          frmENSubstation04Edit.edtEPRenName.Text := ENLine10Obj.element.renRef.name;
          frmENSubstation04Edit.DisableControls([
            frmENSubstation04Edit.edtENLine10Name,
            frmENSubstation04Edit.edtEPRenName, frmENSubstation04Edit.spbEPRen]);

          if frmENSubstation04Edit.ShowModal = mrOk then
            begin
              if ENSubstation04Obj <> nil then
                UpdateGrid(Sender);
            end;
        finally
          frmENSubstation04Edit.Free;
          frmENSubstation04Edit := nil;
        end;
      finally
        ENSubstation04Obj.Free;
      end;
    end //if pcLine10.ActivePage = tsSubstation04 then
  else if pcLine10.ActivePage = tsPost then
    begin //Опори
      ENPostObj := ENPost.Create;

      ENPostObj.element := ENElement.Create;
      ENPostObj.element.elementInRef := ENElementRef.Create;
      ENPostObj.element.elementInRef.code :=
        ENLine10Obj.element.code;
      ENPostObj.element.renRef := EPRenRef.Create;
      ENPostObj.element.renRef.code :=
        ENLine10Obj.element.renRef.code;

      if ENPostObj.line10Ref = nil then
        ENPostObj.line10Ref := ENLine10Ref.Create;
      ENPostObj.line10Ref.code := ENLine10Obj.code;
      //Добавляем связь с воздушной линией
      try
        frmENPostEdit := TfrmENPostEdit.Create(Application, dsInsert);
        try
          if frmENPostEdit.ShowModal = mrOk then
            begin
              if ENPostObj <> nil then
                UpdateGrid(Sender);
            end;
        finally
          frmENPostEdit.Free;
          frmENPostEdit := nil;
        end;
      finally
        ENPostObj.Free;
      end;
    end //else if pcLine10.ActivePage = tsPost then
  else if pcLine10.ActivePage = tsBranch10 then
    begin //Відгалудження від Повітряної Лінії 6 - 10 кВ
      ENBranch10Obj := ENBranch10.Create;

      ENBranch10Obj.element := ENElement.Create;
      ENBranch10Obj.element.elementInRef := ENElementRef.Create;
      ENBranch10Obj.element.elementInRef.code :=
        ENLine10Obj.element.code;
      ENBranch10Obj.element.renRef := EPRenRef.Create;
      ENBranch10Obj.element.renRef.code :=
        ENLine10Obj.element.renRef.code;

      if ENBranch10Obj.line10Ref = nil then
        ENBranch10Obj.line10Ref := ENLine10Ref.Create;
      ENBranch10Obj.line10Ref.code := ENLine10Obj.code;
      try
        frmENBranch10Edit := TfrmENBranch10Edit.Create(Application, dsInsert);
        try
          codeLine10 := ENLine10Obj.code;
          if frmENBranch10Edit.ShowModal = mrOk then
            begin
              if ENBranch10Obj <> nil then
                  UpdateGrid(Sender);
              end;
        finally
          frmENBranch10Edit.Free;
          frmENBranch10Edit := nil;
        end;
      finally
        ENBranch10Obj.Free;
      end;
    end //else if pcLine10.ActivePage = tsBranch10 then
  else if pcLine10.ActivePage = tsCabelOut10 then
    begin //Кабельні виходи і вставки
      ENCabelOut10Obj := ENCabelOut10.Create;
      ENCabelOut10Obj.cabelLength := TXSDecimal.Create;

      ENCabelOut10Obj.element := ENElement.Create;
      ENCabelOut10Obj.element.elementInRef := ENElementRef.Create;
      ENCabelOut10Obj.element.elementInRef.code :=
        ENLine10Obj.element.code;
      ENCabelOut10Obj.element.renRef := EPRenRef.Create;
      ENCabelOut10Obj.element.renRef.code :=
        ENLine10Obj.element.renRef.code;

      if ENCabelOut10Obj.line10Ref = nil then
        ENCabelOut10Obj.line10Ref := ENLine10Ref.Create;
      ENCabelOut10Obj.line10Ref.code := ENLine10Obj.code;

      try
        frmENCabelOut10Edit :=
          TfrmENCabelOut10Edit.Create(Application, dsInsert);
        try
          if frmENCabelOut10Edit.ShowModal = mrOk then
            if ENCabelOut10Obj <> nil then
              UpdateGrid(Sender);
        finally
          frmENCabelOut10Edit.Free;
          frmENCabelOut10Edit := nil;
        end;
      finally
        ENCabelOut10Obj.Free;
      end;
    end //else if pcLine10.ActivePage = tsCabelOut10 then
  else if pcLine10.ActivePage = tsAirCrossing then
    begin //Повітряні перетинання
      ENAirCrossingObj := ENAirCrossing.Create;
      //ENAirCrossingObj.sizeBottomLength:= TXSDecimal.Create;
      //ENAirCrossingObj.flightLength:= TXSDecimal.Create;
      try
        ENAirCrossingObj.line10Ref := ENLine10Ref.Create;
        try
          ENAirCrossingObj.line10Ref.code := ENLine10Obj.code;
        except
          On EConvertError do Exit;
        end;
        frmENAirCrossingEdit :=
          TfrmENAirCrossingEdit.Create(Application, dsInsert);
        try
          frmENAirCrossingEdit.edtLine10.Text := ENLine10Obj.name;
          if frmENAirCrossingEdit.ShowModal = mrOk then
            if ENAirCrossingObj <> nil then
              UpdateGrid(Sender);
        finally
          frmENAirCrossingEdit.Free;
          frmENAirCrossingEdit:=nil;
        end;
      finally
        ENAirCrossingObj.Free;
      end;
    end //else if pcLine10.ActivePage = tsAirCrossing then
  else if pcLine10.ActivePage = tsLineRoute then
    begin //Характеристика местности по трассе ВЛ 6 - 10 кВ
      ENLineRouteObj := ENLineRoute.Create;
      //ENLineRouteObj.distancePost:= TXSDecimal.Create;
      ENLineRouteObj.line10Ref := ENLine10Ref.Create;
      try
        ENLineRouteObj.line10Ref.code := ENLine10Obj.code;
      except
        on EConvertError do Exit;
      end;
      try
        frmENLineRouteEdit := TfrmENLineRouteEdit.Create(Application, dsInsert);
        try
          frmENLineRouteEdit.strLine10Code := IntToStr(ENLine10Obj.code);
          if frmENLineRouteEdit.ShowModal = mrOk then
            if ENLineRouteObj <> nil then
              UpdateGrid(Sender);
        finally
          frmENLineRouteEdit.Free;
          frmENLineRouteEdit:=nil;
        end;
      finally
        ENLineRouteObj.Free;
      end;
    end //else if pcLine10.ActivePage = tsLineRoute then
  else if pcLine10.ActivePage = tsENActL10 then
    begin //Виконані роботи
    end //else if pcLine10.ActivePage = tsENActL10 then
  else if pcLine10.ActivePage = tsENPlanWorkL10 then
    begin //Роботи, що виконуються
    end; //else if pcLine10.ActivePage = tsENPlanWorkL10 then
end;

procedure TfrmENLine10Edit.UpdateGrid(Sender : TObject);
Var i, j: Integer;
begin
  if pcLine10.ActivePage = tsSubstation04 then
    begin //Трансформаторні підстанції 10 - 6 / 0,4 кВ
     for i := 1 to sgENSubstation04.RowCount - 1 do
       for j := 0 to sgENSubstation04.ColCount - 1 do
         sgENSubstation04.Cells[j, i] := '';
     pcLine10Change(Sender);
    end //if pcLine10.ActivePage = tsSubstation04 then
  else if pcLine10.ActivePage = tsPost then
    begin //Опори
      for i := 1 to sgENPost.RowCount - 1 do
        for j := 0 to sgENPost.ColCount - 1 do
          sgENPost.Cells[j, i] := '';
      pcLine10Change(Sender);
    end //else if pcLine10.ActivePage = tsPost then
  else if pcLine10.ActivePage = tsBranch10 then
    begin //Відгалудження від Повітряної Лінії 6 - 10 кВ
      for i := 1 to sgENBranch10.RowCount - 1 do
        for j := 0 to sgENBranch10.ColCount - 1 do
          sgENBranch10.Cells[j, i] := '';
      pcLine10Change(Sender);
    end //else if pcLine10.ActivePage = tsBranch10 then
  else if pcLine10.ActivePage = tsCabelOut10 then
    begin //Кабельні виходи і вставки
      for i := 1 to sgENCabelOut10.RowCount - 1 do
        for j := 0 to sgENCabelOut10.ColCount - 1 do
          sgENCabelOut10.Cells[j, i]:='';
      pcLine10Change(Sender);
    end //else if pcLine10.ActivePage = tsCabelOut10 then
  else if pcLine10.ActivePage = tsAirCrossing then
    begin //Повітряні перетинання
      for i := 1 to sgENAirCrossing.RowCount - 1 do
        for j := 0 to sgENAirCrossing.ColCount - 1 do
          sgENAirCrossing.Cells[j, i] := '';
      pcLine10Change(Sender);
    end //else if pcLine10.ActivePage = tsAirCrossing then

  else if pcLine10.ActivePage = tsLineRoute then
    begin //Характеристика місцевості по трасі ВЛ 6 - 10 кВ
      for i := 1 to sgENLineRoute.RowCount - 1 do
        for j := 0 to sgENLineRoute.ColCount - 1 do
          sgENLineRoute.Cells[j, i] := '';
      pcLine10Change(Sender);
    end //else if pcLine10.ActivePage = tsLineRoute then
  else if pcLine10.ActivePage = tsENActL10 then
    begin //Виконані роботи
      UpdateGridAct(Sender);
    end //else if pcLine10.ActivePage = tsENActL10 then
  else if pcLine10.ActivePage = tsENPlanWorkL10 then
    begin //Роботи, що виконуються
      selectedPWRow := sgENPlanWork.Row;
      UpdateGridPW(Sender);
      if  sgENPlanWork.RowCount > selectedPWRow then
        sgENPlanWork.Row := selectedPWRow
      else
        sgENPlanWork.Row :=  sgENPlanWork.RowCount - 1;
    end; //else if pcLine10.ActivePage = tsENPlanWorkL10 then
end;

procedure TfrmENLine10Edit.recalcAll(); //Пересчёт количества оборудования и поддержки ВЛ 6 - 10 кВ, зависимых объектов
begin
  recalcSubstation04();           //Пересчёт количества ТП 10 - 6 / 0,4 кВ, питающихся от ВЛ 6 - 10 кВ
  recalcPost();                   //Пересчёт количества Опор, удерживающих ВЛ 6 - 10 кВ
  recalcStand();                  //Пересчёт количества Стоек Опор, удерживающих ВЛ 6 - 10 кВ
  recalcTravers();                //Пересчёт количества Траверс Опор, удерживающих ВЛ 6 - 10 кВ
  recalcInsulator();              //Пересчёт количества Изоляторов на Опорах, удерживающих ВЛ 6 - 10 кВ
  recalcDisconnector();           //Пересчёт количества Разъединителей на Опорах, удерживающих ВЛ 6 - 10 кВ
  recalcBranch10();               //Пересчёт количества Воздушных Ответвлений от ВЛ 6 - 10 кВ
  recalcBranch10Item();           //Пересчёт количества Опор, удерживающих Воздушные Ответвления от ВЛ 6 - 10 кВ
  recalcBranch10Stand();          //Пересчёт количества Стоек Опор, удерживающих Воздушные Ответвления от ВЛ 6 - 10 кВ
  recalcBranch10Travers();        //Пересчёт количества Траверс Опор, удерживающих Воздушные Ответвления от ВЛ 6 - 10 кВ
  recalcBranch10Insulator();      //Пересчёт количества Изоляторов на Опорах, удерживающих Воздушные Ответвления от ВЛ 6 - 10 кВ
  recalcBranch10Disconnector();   //Пересчёт количества Разъединителей на Опорах, удерживающих Воздушные Ответвления от ВЛ 6 - 10 кВ
  recalcCabelOut10();             //Пересчёт количества Кабельных Выходов и Вставок ВЛ 6 - 10 кВ
  recalcAirCrossingUp();          //Пересчёт количества Воздушных Пересечений ВЛ 6 - 10 кВ, Объекты сверху
  recalcAirCrossingDown();        //Пересчёт количества Воздушных Пересечений ВЛ 6 - 10 кВ, Объекты снизу
end;


procedure TfrmENLine10Edit.pcLine10Change(Sender: TObject);
  var Allow: Boolean; i, n: Integer;
  TempENSubstation04: ENSubstation04ControllerSoapPort; //ТП 10 - 6 / 0,4 кВ
  ENSubstation04List: ENSubstation04ShortList;
  TempENPost: ENPostControllerSoapPort;                 //Опори
  ENPostList: ENPostShortList;
  TempENBranch10: ENBranch10ControllerSoapPort;         //Воздушные Ответвления
  ENBranch10List: ENBranch10ShortList;                  //от ВЛ 6 - 10 кВ
  TempENCabelOut10: ENCabelOut10ControllerSoapPort;     //Кабельные выходи
  ENCabelOut10List: ENCabelOut10ShortList;              //и вставки
  TempENAirCrossing: ENAirCrossingControllerSoapPort;   //Воздушные пересечения
  ENAirCrossingList: ENAirCrossingShortList;
  //TempENAirCrossingItem: ENAirCrossingItemControllerSoapPort;
  //ENAirCrossingItemList: ENAirCrossingItemShortList;
  TempENLineRoute: ENLineRouteControllerSoapPort;       //Характеристика местности
  ENLineRouteList: ENLineRouteShortList;                //на участках трассы ВЛ 6 - 10 кВ
  TempENAct: ENActControllerSoapPort;                   //Акты
  ENActList: ENActShortList;
  TempENPlanWork: ENPlanWorkControllerSoapPort;         //Планы
  ENPlanWorkList: ENPlanWorkShortList;
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
  ENInspectionSheetList: ENInspectionSheetShortList;
  inspectionSheetFilter: ENInspectionSheetFilter;
begin
  inherited;

  actInsert.Visible := not (pcLine10.ActivePage = tsSubstation04);
  actDelete.Visible := actInsert.Visible;
  actEdit.Visible := actInsert.Visible;

  if pcLine10.ActivePage = tsLine10 then //Основні дані ПЛ 6 - 10 кВ
    begin
      recalcAll; //Пересчёт количества оборудования и поддержки ВЛ 6 - 10 кВ, зависимых объектов
      addressesRewrite; //Заполнение списка адресов, через которвые проходит ВЛ 6 - 10 кВ
    end
  else if pcLine10.ActivePage = tsSubstation04 then
    begin //Трансформаторні підстанції 10 - 6 / 0,4 кВ
      SetGridHeaders(ENSubstation04Headers, sgENSubstation04.ColumnHeaders);
      s04ColCount:=100;
      TempENSubstation04 :=  HTTPRIOENSubstation04 as ENSubstation04ControllerSoapPort;
      if s04Filter = nil then
        begin
         s04Filter := ENSubstation04Filter.Create;
         SetNullIntProps(s04Filter);
         SetNullXSProps(s04Filter);
        end;
      s04Filter.conditionSQL :=
        ' (elementcode in (select e.code from enelement e where e.elementinrefcode = '
        + IntToStr(ENLine10Obj.element.code) +'))'
        + ' or (code in (select hvcs.substation04refcode '
        + ' from enhighvoltcellsupplies hvcs where hvcs.line10refcode = '
        + IntToStr(ENLine10Obj.code) + '))';
      ENSubstation04List := TempENSubstation04.getScrollableFilteredList(
        s04Filter, 0, s04ColCount);
      s04LastCount:=High(ENSubstation04List.list);
      if s04LastCount > -1 then
        sgENSubstation04.RowCount := s04LastCount+2
      else
        sgENSubstation04.RowCount := 2;
      with sgENSubstation04 do
        for i:=0 to s04LastCount do
          begin
            Application.ProcessMessages;
            if ENSubstation04List.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(ENSubstation04List.list[i].code)
            else
            Cells[0,i+1] := '';
            Cells[1,i+1] := ENSubstation04List.list[i].name;
            if ENSubstation04List.list[i].nominalPower = nil then
              Cells[2,i+1] := ''
            else
              Cells[2,i+1] := ENSubstation04List.list[i].nominalPower.DecimalString;
            s04LastRow :=i+1;
            sgENSubstation04.RowCount:= s04LastRow+1;
          end;
      s04ColCount := s04ColCount + 1;
      sgENSubstation04.Row := 1;
      SetGridHeaders(ENHighVoltageSellHeaders, sgENHighVoltageSell.ColumnHeaders);
      sgENSubstation04.OnRowChanging(sgENSubstation04, 0,
        sgENSubstation04.Row, Allow);
    end //if pcLine10.ActivePage = tsSubstation04 then
  else if pcLine10.ActivePage = tsPost then
    begin //Опори
      SetGridHeaders(ENPostHeaders, sgENPost.ColumnHeaders);
      SetGridHeaders(ENStandHeaders, sgENStand.ColumnHeaders);
      SetGridHeaders(ENTraversHeaders, sgENTravers.ColumnHeaders);
      SetGridHeaders(ENHookHeaders, sgENHook.ColumnHeaders);
      SetGridHeaders(ENDisconnectorHeaders, sgENDisconnector.ColumnHeaders);
      SetGridHeaders(ENInsulatorHeaders, sgENInsulator.ColumnHeaders);
      pColCount := 100;
      TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;
      if pFilterObject = nil then
        begin
          pFilterObject := ENPostFilter.Create;
          SetNullIntProps(pFilterObject);
          SetNullXSProps(pFilterObject);
        end;

      pFilterObject.conditionSQL :=
        ' ENPOST.LINE10REFCODE = ' + IntToStr(ENLine10Obj.code)
        + ' AND ENPOST.CODE NOT IN (SELECT ENBRANCH10ITEM.POSTCODE '
        + '   FROM ENBRANCH10ITEM WHERE ENBRANCH10ITEM.BRANCH10REFCODE IN '
        + '     (SELECT ENBRANCH10.CODE FROM ENBRANCH10 WHERE LINE10REFCODE = '
        + IntToStr(ENLine10Obj.code) + '))';

      ENPostList := TempENPost.getScrollableFilteredList(
        ENPostFilter(pFilterObject), 0, pColCount);
      pLastCount:=High(ENPostList.list);
      if pLastCount > -1 then
         sgENPost.RowCount := pLastCount + 2
      else
         sgENPost.RowCount := 2;
      with sgENPost do
        for i := 0 to pLastCount do
          begin
            Application.ProcessMessages;

            if ENPostList.list[i].code <> Low(Integer) then //Код
              Cells[0, i + 1] := IntToStr(ENPostList.list[i].code)
            else
              Cells[0, i + 1] := '';
            Cells[1, i + 1] := ENPostList.list[i].postTtypeName; //Тип опори
            Cells[2, i + 1] := ENPostList.list[i].groundName; //Заземлення
            Cells[3, i + 1] := ENPostList.list[i].postNumberGen; //Номер опори
            if ENPostList.list[i].woodenLength <> nil then
              Cells[4, i + 1] := ENPostList.list[i].woodenLength.decimalString; //Довжина стояка, м
            if ENPostList.list[i].lastRepairDate = nil then
              Cells[5, i + 1] := '' //Дата останнього ремонту
            else
              Cells[5, i + 1] := XSDate2String(
                ENPostList.list[i].lastRepairDate);
            Cells[6, i + 1] := IntToSTr(ENPostList.list[i].yearSetup); //Рік встановлення
            //Cells[7, i + 1] := ENPostList.list[i].materialRefName; //Матеріал опори
            Cells[7, i + 1] := ENPostList.list[i].name; //Назва опори
            pLastRow := i + 1;
            sgENPost.RowCount := pLastRow + 1;
          end;
      pColCount := pColCount + 1;
      sgENPost.Row := 1;
      sgENPost.OnRowChanging(sgENPost, 0, sgENPost.Row, Allow);
    end //else if pcLine10.ActivePage = tsPost then
  else if pcLine10.ActivePage = tsBranch10 then
    begin //Відгалудження від Повітряної Лінії 6 - 10 кВ
      SetGridHeaders(ENBranch10Headers, sgENBranch10.ColumnHeaders);
      SetGridHeaders(ENBranch10ItemHeaders, sgENBranch10Item.ColumnHeaders);
      SetGridHeaders(ENStandHeaders, sgENBranch10Stand.ColumnHeaders);
      SetGridHeaders(ENTraversHeaders, sgENBranch10Travers.ColumnHeaders);
      SetGridHeaders(ENHookHeaders, sgENBranch10Hook.ColumnHeaders);
      br10ColCount := 100;
      TempENBranch10 :=  HTTPRIOENBranch10 as ENBranch10ControllerSoapPort;
      if br10Filter = nil then
        begin
          br10Filter := ENBranch10Filter.Create;
          SetNullIntProps(br10Filter);
          SetNullXSProps(br10Filter);
        end;
      ENBranch10Filter(br10Filter).conditionSQL :=
        ' ENBRANCH10.LINE10REFCODE = ' + IntToStr(ENLine10Obj.code);
      ENBranch10List := TempENBranch10.getScrollableFilteredList(
        ENBranch10Filter(br10Filter), 0, br10ColCount);
      br10LastCount := High(ENBranch10List.list);
      if br10LastCount > -1 then
        sgENBranch10.RowCount := br10LastCount + 2
      else
        sgENBranch10.RowCount := 2;

      with sgENBranch10 do
        for i := 0 to br10LastCount do
          begin
            Application.ProcessMessages;
            if ENBranch10List.list[i].code <> Low(Integer) then //Код
              Cells[0, i + 1] := IntToStr(ENBranch10List.list[i].code)
            else
              Cells[0, i + 1] := '';
            Cells[1, i + 1] := ENBranch10List.list[i].name; //Напрямок
            if ENBranch10List.list[i].branchLength = nil then //Довжина, км
              Cells[2, i + 1] := ''
            else
              Cells[2, i + 1] :=
                ENBranch10List.list[i].branchLength.DecimalString;
            Cells[3, i + 1] := //Вимикаючий Пункт
              ENBranch10List.list[i].dispOffName;
            Cells[4, i + 1] := //Номер опори, від якої здійснено відгалудження
              ENBranch10List.list[i].postOutRefPostNumberGen;
            br10LastRow := i + 1;
            sgENBranch10.RowCount := br10LastRow + 1;
          end;
       br10ColCount := br10ColCount + 1;
       sgENBranch10.Row := 1;
       sgENBranch10.OnRowChanging(sgENBranch10, 0, sgENBranch10.Row, Allow);
    end //else if pcLine10.ActivePage = tsBranch10 then
  else if pcLine10.ActivePage = tsCabelOut10 then
    begin //Кабельні виходи і вставки
      SetGridHeaders(ENCabelOut10Headers, sgENCabelOut10.ColumnHeaders);
      SetGridHeaders(ENCabelOut10ItemHeaders, sgENCabelOut10Item.ColumnHeaders);
      co10ColCount := 100;
      TempENCabelOut10 :=
        HTTPRIOENCabelOut10 as ENCabelOut10ControllerSoapPort;
      if co10Filter = nil then
        begin
          co10Filter := ENCabelOut10Filter.Create;
          SetNullIntProps(co10Filter);
          SetNullXSProps(co10Filter);
        end;
      co10Filter.conditionSQL :=
        ' ENCABELOUT10.LINE10REFCODE = ' + IntToStr(ENLine10Obj.code);
      ENCabelOut10List := TempENCabelOut10.getScrollableFilteredList(
        ENCabelOut10Filter(co10Filter), 0, co10ColCount);
      co10LastCount := High(ENCabelOut10List.list);
      if co10LastCount > -1 then
        sgENCabelOut10.RowCount := co10LastCount + 2
      else
        sgENCabelOut10.RowCount := 2;

      with sgENCabelOut10 do
        for i := 0 to co10LastCount do
          begin
            Application.ProcessMessages;

            if ENCabelOut10List.list[i].code <> Low(Integer) then //Код
              Cells[0,i + 1] := IntToStr(ENCabelOut10List.list[i].code)
            else
              Cells[0, i + 1] := '';
            Cells[1, i + 1] := ENCabelOut10List.list[i].typeRefName; //Призначення
            Cells[2, i + 1] := ENCabelOut10List.list[i].materialRefName; //Марка кабелю
            if ENCabelOut10List.list[i].cabelLength <> nil then //Довжина кабелю, м
              Cells[3, i + 1] := ENCabelOut10List.list[i].cabelLength.DecimalString
            else
              Cells[3, i + 1] := '';
            Cells[4, i + 1] := ENCabelOut10List.list[i].muftaRefName; //Тип муфти
            Cells[5, i + 1] := ENCabelOut10List.list[i].name; //Примітки

            co10LastRow := i + 1;
            sgENCabelOut10.RowCount := co10LastRow + 1;
          end;
       co10ColCount := co10ColCount + 1;
       sgENCabelOut10.Row := 1;
       sgENCabelOut10.OnRowChanging(sgENCabelOut10, 0, sgENCabelOut10.Row, Allow);
    end //else if pcLine10.ActivePage = tsCabelOut10 then
  else if pcLine10.ActivePage = tsAirCrossing then
    begin //Повітряні перетинання
      SetGridHeaders(ENAirCrossingHeaders, sgENAirCrossing.ColumnHeaders);
      SetGridHeaders(ENAirCrossingItemHeaders, sgENAirCrossingItem.ColumnHeaders);
      acrColCount := 100;
      TempENAirCrossing :=
        HTTPRIOENAirCrossing as ENAirCrossingControllerSoapPort;
      if acrFilter = nil then
        begin
         acrFilter := ENAirCrossingFilter.Create;
         SetNullIntProps(acrFilter);
         SetNullXSProps(acrFilter);
        end;
      acrFilter.conditionSQL :=
        ' ENAIRCROSSING.LINE10REFCODE = ' + IntToStr(ENLine10Obj.code);
      ENAirCrossingList := TempENAirCrossing.getScrollableFilteredList(
        ENAirCrossingFilter(acrFilter), 0, acrColCount);
      acrLastCount := High(ENAirCrossingList.list);
      if acrLastCount > -1 then
        sgENAirCrossing.RowCount := acrLastCount + 2
      else
        sgENAirCrossing.RowCount := 2;

      with sgENAirCrossing do
        for i := 0 to acrLastCount do
          begin
            Application.ProcessMessages;
            //Код
            if ENAirCrossingList.list[i].code <> Low(Integer) then
              Cells[0, i + 1] := IntToStr(ENAirCrossingList.list[i].code)
            else
              Cells[0, i + 1] := '';
            //Об''єкт під ПЛ 6 - 10 кВ, який перетинається
            Cells[1, i + 1] := ENAirCrossingList.list[i].objCrossDownRefName;
            //КЛ
            Cells[2, i + 1] := ENAirCrossingList.list[i].lineCableRefName;
            //ПЛ 0,4 кВ
            Cells[3, i + 1] := ENAirCrossingList.list[i].line04RefName;
            //Об'єкт над ПЛ 6 - 10 кВ, який перетинає
            Cells[4, i + 1] := ENAirCrossingList.list[i].objCrossUpRefName;
            //ПЛ 35 - 150 кВ
            Cells[5, i + 1] := ENAirCrossingList.list[i].line150RefName;
            //Габарит нижнього проводу до об''єкту, який перетинається при Т = + 40 С, м
            if ENAirCrossingList.list[i].sizeBottomLength = nil then
              Cells[6, i + 1] := ''
            else
              Cells[6, i + 1] :=
                ENAirCrossingList.list[i].sizeBottomLength.DecimalString;
            //Довжина прольоту, м
            if ENAirCrossingList.list[i].flightLength = nil then
              Cells[7, i + 1] := ''
            else
              Cells[7, i + 1] :=
                ENAirCrossingList.list[i].flightLength.DecimalString;
            //Крепление проводов
            Cells[8, i + 1] := ENAirCrossingList.list[i].wireFastenRefName;
            acrLastRow := i + 1;
            sgENAirCrossing.RowCount := acrLastRow + 1;
          end;
       acrColCount := acrColCount + 1;
       sgENAirCrossing.Row := 1;
       sgENAirCrossing.OnRowChanging(sgENAirCrossing, 0, sgENAirCrossing.Row, Allow);
    end //else if pcLine10.ActivePage = tsAirCrossing then

  else if pcLine10.ActivePage = tsLineRoute then
    begin //Характеристика местности по трассе воздушной линии
      SetGridHeaders(ENLineRouteHeaders, sgENLineRoute.ColumnHeaders);
      lrColCount := 100;
      TempENLineRoute :=
        HTTPRIOENLineRoute as ENLineRouteControllerSoapPort;
      if lrFilter = nil then
        begin
         lrFilter := ENLineRouteFilter.Create;
         SetNullIntProps(lrFilter);
         SetNullXSProps(lrFilter);
        end;
      ENLineRouteFilter(lrFilter).conditionSQL :=
        ' ENLINEROUTE.LINE10REFCODE = ' + IntToStr(ENLine10Obj.code);
      ENLineRouteList := TempENLineRoute.getScrollableFilteredList(
        ENLineRouteFilter(lrFilter), 0, lrColCount);
      lrLastCount := High(ENLineRouteList.list);
      if lrLastCount > -1 then
         sgENLineRoute.RowCount := lrLastCount + 2
      else
         sgENLineRoute.RowCount := 2;

       with sgENLineRoute do
        for i := 0 to lrLastCount do
          begin
            Application.ProcessMessages;
            if ENLineRouteList.list[i].code <> Low(Integer) then //Код
              Cells[0, i + 1] := IntToStr(ENLineRouteList.list[i].code)
            else
              Cells[0, i + 1] := '';
            Cells[1, i + 1] := ENLineRouteList.list[i].landscapeRefName; //Місцевість
            Cells[2, i + 1] := ENLineRouteList.list[i].previousPostRefPostNumberGen; //№ 1-ої опори
            Cells[3, i + 1] := ENLineRouteList.list[i].postRefPostNumberGen; //№ 2-ої опори
            if ENLineRouteList.list[i].distancePost = nil then //Дистанція, км
              Cells[4, i + 1] := ''
            else
              Cells[4, i + 1] :=
                ENLineRouteList.list[i].distancePost.DecimalString;
            Cells[5, i + 1] := ENLineRouteList.list[i].name; //Ланцюг траси
            lrLastRow := i + 1;
            sgENLineRoute.RowCount := lrLastRow + 1;
          end;
       lrColCount := lrColCount + 1;
       sgENLineRoute.Row := 1;
    end //else if pcLine10.ActivePage = tsLineRoute then
  else if pcLine10.ActivePage = tsENActL10 then
    begin //Виконані роботи
      SetGridHeaders(ENActHeaders, sgENAct.ColumnHeaders);
      actColCount := 100;
      TempENAct :=  HTTPRIOENAct as ENActControllerSoapPort;

      if actFilterObject = nil then
        begin
           actFilterObject := ENActFilter.Create;
           SetNullIntProps(actFilterObject);
           SetNullXSProps(actFilterObject);
           ENActFilter(actFilterObject).conditionSQL :=
             'ENACT.STATUSREFCODE <> ' + IntToStr(ENACT_CANCELED)
             + 'AND ENACT.ELEMENTCODE = '
             + IntToStr(ENLine10Obj.element.code);

           ENActFilter(actFilterObject).orderBySQL := '1 desc';
        end;

      ENActList := TempENAct.getScrollableFilteredList(ENActFilter(actFilterObject), 0, actColCount);
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
         actColCount := actColCount + 1;
         sgENAct.Row:=1;
      finally
        ENActList.Free;
        actFilterObject.Free;
        actFilterObject := nil;
      end;
    end //else if pcLine10.ActivePage = tsENActL10 then
  else if pcLine10.ActivePage = tsENPlanWorkL10 then
    begin //Роботи, що виконуються
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
             + IntToStr(ENLine10Obj.element.code);
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
    end
    else if pcLine10.ActivePage = tsPost4OKSN then
    updateP4O;

    // ENInspectionSheet
    if pcLine10.ActivePage = tsENInspectionSheet then
    begin
      SetGridHeaders(ENInspectionSheetHeaders, sgENInspectionSheet.ColumnHeaders);
      ClearGrid(sgENInspectionSheet);
      TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;

      inspectionSheetFilter := ENInspectionSheetFilter.Create;
      SetNullIntProps(inspectionSheetFilter);
      SetNullXSProps(inspectionSheetFilter);

      inspectionSheetFilter.elementRef := ENElementRef.Create;
      inspectionSheetFilter.elementRef.code := ENLine10Obj.element.code;

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

    if pcLine10.ActivePage = tsCCElement then
      LoadCCElement();

    if pcLine10.ActivePage = tsCCDamageLog then
      LoadCCDamageLog();

    if pcLine10.ActivePage = tsAttachments then
    begin;
      SetGridHeaders(ENDocAttachmentHeaders, sgENDocAttachment.ColumnHeaders);
      ClearGrid(sgENDocAttachment);
      updateAttachments;
    end;
end;


procedure TfrmENLine10Edit.sgENSubstation04TopLeftChanged(Sender: TObject);
var
  TempENSubstation04: ENSubstation04ControllerSoapPort;
  i,CurrentRow: Integer;
  ENSubstation04List: ENSubstation04ShortList;
  begin
  if s04LastCount < 99 then Exit;
  if (sgENSubstation04.TopRow + sgENSubstation04.VisibleRowCount) = s04ColCount
  then
    begin
      TempENSubstation04 :=  HTTPRIOENSubstation04 as ENSubstation04ControllerSoapPort;
      CurrentRow:=sgENSubstation04.RowCount;

  if s04Filter = nil then
  begin
     s04Filter := ENSubstation04Filter.Create;
     SetNullIntProps(s04Filter);
     SetNullXSProps(s04Filter);
     s04Filter.conditionSQL := ' elementrefcode in (select e.code from enelement e where e.elementinrefcode = '+  IntToStr(ENLine10Obj.element.code) +')';
  end;

  ENSubstation04List := TempENSubstation04.getScrollableFilteredList(s04Filter,s04ColCount-1, 100);

  sgENSubstation04.RowCount:=sgENSubstation04.RowCount+100;
  s04LastCount:=High(ENSubstation04List.list);
  with sgENSubstation04 do
    for i:=0 to s04LastCount do
      begin
        Application.ProcessMessages;
        if ENSubstation04List.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSubstation04List.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSubstation04List.list[i].name;
        if ENSubstation04List.list[i].nominalPower = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENSubstation04List.list[i].nominalPower.DecimalString;
          s04LastRow:=i+CurrentRow;
      end;
   s04ColCount:=s04ColCount+100;
   sgENSubstation04.Row:=CurrentRow-5;
   sgENSubstation04.RowCount:=s04LastRow+1;
  end;
end;


procedure TfrmENLine10Edit.actEditENInspectionSheetExecute(Sender: TObject);
var
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  inherited;
  if pcLine10.ActivePage = tsENInspectionSheet then
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
        pcLine10Change(Sender);
      end;
    finally
      frmENInspectionSheetEdit.Free;
      frmENInspectionSheetEdit:=nil;
    end;
  end;
end;


procedure TfrmENLine10Edit.actEditENSettingsExecute(Sender: TObject);
var
  TempENSettings: ENSettingsControllerSoapPort;
begin
  inherited;
  TempENSettings := HTTPRIOENSettings as ENSettingsControllerSoapPort;
  try
    ENSettingsObj := TempENSettings.getObject(StrToInt(sgENSettings.Cells[0,sgENSettings.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENSettingsEdit := TfrmENSettingsEdit.Create(Application, dsEdit);
  DisableControls([frmENSettingsEdit.edtKey]);

  try
    if frmENSettingsEdit.ShowModal = mrOk then
      begin
        LoadTechnicalStatus(Sender);
      end;
  finally
    frmENSettingsEdit.Free;
    frmENSettingsEdit:=nil;
  end;
end;


procedure TfrmENLine10Edit.actEditExecute(Sender: TObject);
Var TempENSubstation04: ENSubstation04ControllerSoapPort; //ТП 10 - 6 / 0,4 кВ
  TempENPost: ENPostControllerSoapPort;                   //Опоры
  TempENBranch10: ENBranch10ControllerSoapPort;           //Ответвление от ВЛ
  TempENCabelOut10: ENCabelOut10ControllerSoapPort;       //Кабельные выходы и вставки
  TempENAirCrossing: ENAirCrossingControllerSoapPort;     //Воздушные пересечения
  TempENLineRoute: ENLineRouteControllerSoapPort;         //Характеристика местности по трассе ВЛ 6 - 10 кВ
begin
  if pcLine10.ActivePage = tsSubstation04 then
    begin //Трансформаторні підстанції 10 - 6 / 0,4 кВ
      TempENSubstation04 :=
        HTTPRIOENSubstation04 as ENSubstation04ControllerSoapPort;
      try
        ENSubstation04Obj := TempENSubstation04.getObject(
          StrToInt(sgENSubstation04.Cells[0, sgENSubstation04.Row]));
      except
        on EConvertError do Exit;
      end;
      try
        frmENSubstation04Edit := TfrmENSubstation04Edit.Create(Application, dsEdit);
        try
          frmENSubstation04Edit.DisableControls([
            frmENSubstation04Edit.edtENLine10Name]);
          if frmENSubstation04Edit.ShowModal = mrOk then
            begin
              if ENSubstation04Obj<>nil then
                UpdateGrid(Sender);
            end;
        finally
          frmENSubstation04Edit.Free;
          frmENSubstation04Edit := nil;
        end;
      finally
        ENSubstation04Obj.Free;
      end;
    end //if pcLine10.ActivePage = tsSubstation04 then
  else if pcLine10.ActivePage = tsPost then
    begin //Опори
      TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;
      try
        ENPostObj :=
          TempENPost.getObject(StrToInt(sgENPost.Cells[0, sgENPost.Row]));
      except
        on EConvertError do Exit;
      end;
      frmENPostEdit := TfrmENPostEdit.Create(Application, dsEdit);
      try
        if frmENPostEdit.ShowModal= mrOk then
          UpdateGrid(Sender);
      finally
        frmENPostEdit.Free;
        frmENPostEdit := nil;
      end;
    end //else if pcLine10.ActivePage = tsPost then
  else if pcLine10.ActivePage = tsBranch10 then
    begin //Відгалудження від Повітряної Лінії 6 - 10 кВ
      TempENBranch10 := HTTPRIOENBranch10 as ENBranch10ControllerSoapPort;
      try
        ENBranch10Obj := TempENBranch10.getObject(
          StrToInt(sgENBranch10.Cells[0, sgENBranch10.Row]));
      except
        on EConvertError do Exit;
      end;
      frmENBranch10Edit := TfrmENBranch10Edit.Create(Application, dsEdit);
      try
      if frmENBranch10Edit.ShowModal = mrOk then
        UpdateGrid(Sender);
      finally
        frmENBranch10Edit.Free;
        frmENBranch10Edit := nil;
      end;
    end //else if pcLine10.ActivePage = tsBranch10 then
  else if pcLine10.ActivePage = tsCabelOut10 then
    begin //Кабельні виходи і вставки
      TempENCabelOut10 :=
        HTTPRIOENCabelOut10 as ENCabelOut10ControllerSoapPort;
      try
        ENCabelOut10Obj := TempENCabelOut10.getObject(
          StrToInt(sgENCabelOut10.Cells[0, sgENCabelOut10.Row]));
      except
        on EConvertError do Exit;
      end;
      frmENCabelOut10Edit := TfrmENCabelOut10Edit.Create(Application, dsEdit);
      try
        if frmENCabelOut10Edit.ShowModal= mrOk then
          UpdateGrid(Sender);
      finally
        frmENCabelOut10Edit.Free;
        frmENCabelOut10Edit := nil;
      end;
    end //else if pcLine10.ActivePage = tsCabelOut10 then
  else if pcLine10.ActivePage = tsAirCrossing then
    begin //Повітряні перетинання
      TempENAirCrossing :=
        HTTPRIOENAirCrossing as ENAirCrossingControllerSoapPort;
      try
        ENAirCrossingObj := TempENAirCrossing.getObject(
          StrToInt(sgENAirCrossing.Cells[0, sgENAirCrossing.Row]));
      except
        on EConvertError do Exit;
      end;
      frmENAirCrossingEdit :=
        TfrmENAirCrossingEdit.Create(Application, dsEdit);
      try
        if frmENAirCrossingEdit.ShowModal= mrOk then
          UpdateGrid(Sender);
      finally
        frmENAirCrossingEdit.Free;
        frmENAirCrossingEdit := nil;
      end;
    end //else if pcLine10.ActivePage = tsAirCrossing then

  else if pcLine10.ActivePage = tsLineRoute then
    begin //Характеристика местности по трассе ВЛ 6 - 10 кВ
      TempENLineRoute := HTTPRIOENLineRoute as ENLineRouteControllerSoapPort;
      try
        ENLineRouteObj := TempENLineRoute.getObject(
          StrToInt(sgENLineRoute.Cells[0, sgENLineRoute.Row]));
      except
        on EConvertError do Exit;
      end;
      frmENLineRouteEdit := TfrmENLineRouteEdit.Create(Application, dsEdit);
      try
        frmENLineRouteEdit.strLine10Code := IntToStr(ENLine10Obj.code);
        if frmENLineRouteEdit.ShowModal= mrOk then
          UpdateGrid(Sender);
      finally
        frmENLineRouteEdit.Free;
        frmENLineRouteEdit := nil;
      end;
    end //else if pcLine10.ActivePage = tsLineRoute then
  else if pcLine10.ActivePage = tsENActL10 then
    begin //Виконані роботи
    end //else if pcLine10.ActivePage = tsENActL10 then
  else if pcLine10.ActivePage = tsENPlanWorkL10 then
    begin //Роботи, що виконуються
    end; //else if pcLine10.ActivePage = tsENPlanWorkL10 then
end;

procedure TfrmENLine10Edit.UpdateGridAct(Sender: TObject);
Var i, j: Integer;
begin
 for i := 1 to sgENAct.RowCount - 1 do
   for j := 0 to sgENAct.ColCount - 1 do
     sgENAct.Cells[j, i] := '';
 pcLine10Change(Sender);
end;

procedure TfrmENLine10Edit.UpdateGridPW(Sender: TObject);
var i, j: Integer;
begin
  for i := 1 to sgENPlanWork.RowCount - 1 do
    for j := 0 to sgENPlanWork.ColCount - 1 do
      begin
        sgENPlanWork.Cells[j, i] := '';
        sgENPlanWork.Objects[0, i] := nil;
      end;
  pcLine10Change(Sender);
end;


procedure TfrmENLine10Edit.actViewENSettingsExecute(Sender: TObject);
var
  TempENSettings: ENSettingsControllerSoapPort;
begin
  inherited;
  TempENSettings := HTTPRIOENSettings as ENSettingsControllerSoapPort;
  try
    ENSettingsObj := TempENSettings.getObject(StrToInt(sgENSettings.Cells[0,sgENSettings.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENSettingsEdit := TfrmENSettingsEdit.Create(Application, dsView);

  try
    frmENSettingsEdit.ShowModal;
  finally
    frmENSettingsEdit.Free;
    frmENSettingsEdit:=nil;
  end;
end;


procedure TfrmENLine10Edit.actViewExecute(Sender: TObject);
Var TempENSubstation04: ENSubstation04ControllerSoapPort; //ТП 10 - 6 / 0,4 кВ
  TempENPost: ENPostControllerSoapPort;                   //Опори
  TempENBranch10: ENBranch10ControllerSoapPort;           //Воздушные Ответвления от ВЛ 6 - 10 кВ
  TempENCabelOut10: ENCabelOut10ControllerSoapPort;       //Кабельные выходы из / вставки в ВЛ 6 - 10 кВ
  TempENAirCrossing: ENAirCrossingControllerSoapPort;     //Воздушные пересечения
  TempENLineRoute: ENLineRouteControllerSoapPort;         //Характеристика местности по трассе ВЛ 6 - 10 кВ
  TempENAct: ENActControllerSoapPort;                     //Акти
  TempENPlanWork: ENPlanWorkControllerSoapPort;           //Плани
  tPlan: ENPlanWork; objCode : Integer;
begin
  if pcLine10.ActivePage = tsSubstation04 then
    begin //Трансформаторні підстанції 10 - 6 / 0,4 кВ
      TempENSubstation04 := HTTPRIOENSubstation04 as ENSubstation04ControllerSoapPort;
      try
        ENSubstation04Obj := TempENSubstation04.getObject(
          StrToInt(sgENSubstation04.Cells[0,sgENSubstation04.Row]));
      except
      on EConvertError do Exit;
      end;
      frmENSubstation04Edit :=
        TfrmENSubstation04Edit.Create(Application, dsView);
      try
        frmENSubstation04Edit.ShowModal;
      finally
        frmENSubstation04Edit.Free;
        frmENSubstation04Edit := nil;
      end;
    end //if pcLine10.ActivePage = tsSubstation04 then
  else if pcLine10.ActivePage = tsPost then
    begin //Опори
      TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;
      try
        ENPostObj := TempENPost.getObject(
          StrToInt(sgENPost.Cells[0, sgENPost.Row]));
      except
        on EConvertError do Exit;
      end;
      frmENPostEdit := TfrmENPostEdit.Create(Application, dsView);
      try
        frmENPostEdit.ShowModal;
      finally
        frmENPostEdit.Free;
        frmENPostEdit := nil;
      end;
    end //else if pcLine10.ActivePage = tsPost then
  else if pcLine10.ActivePage = tsBranch10 then
    begin //Відгалудження від Повітряної Лінії 6 - 10 кВ
      TempENBranch10 := HTTPRIOENBranch10 as ENBranch10ControllerSoapPort;
      try
        ENBranch10Obj := TempENBranch10.getObject(StrToInt(
          sgENBranch10.Cells[0, sgENBranch10.Row]));
      except
        on EConvertError do Exit;
      end;
      frmENBranch10Edit := TfrmENBranch10Edit.Create(Application, dsView);
      try
        frmENBranch10Edit.ShowModal;
      finally
        frmENBranch10Edit.Free;
        frmENBranch10Edit := nil;
      end;
    end //else if pcLine10.ActivePage = tsBranch10 then
  else if pcLine10.ActivePage = tsCabelOut10 then
    begin //Кабельні виходи і вставки
      TempENCabelOut10 :=
        HTTPRIOENCabelOut10 as ENCabelOut10ControllerSoapPort;
      try
        ENCabelOut10Obj := TempENCabelOut10.getObject(
          StrToInt(sgENCabelOut10.Cells[0, sgENCabelOut10.Row]));
      except
        on EConvertError do Exit;
      end;
        frmENCabelOut10Edit := TfrmENCabelOut10Edit.Create(Application, dsView);
      try
        frmENCabelOut10Edit.ShowModal;
      finally
        frmENCabelOut10Edit.Free;
        frmENCabelOut10Edit := nil;
      end;
    end //else if pcLine10.ActivePage = tsCabelOut10 then
  else if pcLine10.ActivePage = tsAirCrossing then
    begin //Повітряні перетинання
      TempENAirCrossing := HTTPRIOENAirCrossing as ENAirCrossingControllerSoapPort;
      try
        ENAirCrossingObj := TempENAirCrossing.getObject(
          StrToInt(sgENAirCrossing.Cells[0, sgENAirCrossing.Row]));
      except
        on EConvertError do Exit;
      end;
        frmENAirCrossingEdit :=
          TfrmENAirCrossingEdit.Create(Application, dsView);
      try
        frmENAirCrossingEdit.ShowModal;
      finally
        frmENAirCrossingEdit.Free;
        frmENAirCrossingEdit := nil;
      end;
    end //else if pcLine10.ActivePage = tsAirCrossing then

  else if pcLine10.ActivePage = tsLineRoute then
    begin //Характеристика местности по трассе ВЛ 6 - 10 кВ
      TempENLineRoute := HTTPRIOENLineRoute as ENLineRouteControllerSoapPort;
      try
        ENLineRouteObj := TempENLineRoute.getObject(
          StrToInt(sgENLineRoute.Cells[0, sgENLineRoute.Row]));
      except
        on EConvertError do Exit;
      end;
      frmENLineRouteEdit := TfrmENLineRouteEdit.Create(Application, dsView);
      try
        frmENLineRouteEdit.ShowModal;
      finally
        frmENLineRouteEdit.Free;
        frmENLineRouteEdit := nil;
      end;
    end //else if pcLine10.ActivePage = tsLineRoute then
  else if pcLine10.ActivePage = tsENActL10 then
    begin //Виконані роботи
      TempENAct := HTTPRIOENAct as ENActControllerSoapPort;
      frmENActEdit := TfrmENActEdit.Create(Application, dsView);
      try
        try
          frmENActEdit.ENActObj :=
            TempENAct.getObject(StrToInt(sgENAct.Cells[0, sgENAct.Row]));
        except
          on EConvertError do Exit;
        end;
        if frmENActEdit.ShowModal in [mrOk, mrYes ] then
          begin
            UpdateGridAct(Sender);
          end;
      finally
        frmENActEdit.Free;
        frmENActEdit := nil;
      end;
    end //else if pcLine10.ActivePage = tsENActL10 then
  else if pcLine10.ActivePage = tsENPlanWorkL10 then
    begin //Роботи, що виконуються
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
    end; //else if pcLine10.ActivePage = tsENPlanWorkL10 then
end;


procedure TfrmENLine10Edit.actUpdateENInspectionSheetExecute(Sender: TObject);
begin
  inherited;
  pcLine10Change(Sender);
end;


procedure TfrmENLine10Edit.actUpdateENSettingsExecute(Sender: TObject);
begin
  inherited;
  LoadTechnicalStatus(Sender);
end;


procedure TfrmENLine10Edit.actUpdateExecute(Sender: TObject);
begin
  UpdateGrid(Sender);
end;


procedure TfrmENLine10Edit.actNoFilterExecute(Sender: TObject);
begin
  if pcLine10.ActivePage = tsSubstation04 then
    begin //Трансформаторні підстанції 10 - 6 / 0,4 кВ
      s04Filter.Free;
      s04Filter := nil;
      UpdateGrid(Sender);
    end //if pcLine10.ActivePage = tsSubstation04 then
  else if pcLine10.ActivePage = tsPost then
    begin //Опори
      pFilterObject.Free;
      pFilterObject := nil;
      UpdateGrid(Sender);
    end //else if pcLine10.ActivePage = tsPost then
  else if pcLine10.ActivePage = tsBranch10 then
    begin //Відгалудження від Повітряної Лінії 6 - 10 кВ
      br10Filter.Free;
      br10Filter := nil;
      UpdateGrid(Sender);
    end //else if pcLine10.ActivePage = tsBranch10 then
  else if pcLine10.ActivePage = tsCabelOut10 then
    begin //Кабельні виходи і вставки
      co10Filter.Free;
      co10Filter := nil;
      UpdateGrid(Sender);
    end //else if pcLine10.ActivePage = tsCabelOut10 then
  else if pcLine10.ActivePage = tsAirCrossing then
    begin //Повітряні перетинання
      acrFilter.Free;
      acrFilter := nil;
      UpdateGrid(Sender);
    end //else if pcLine10.ActivePage = tsAirCrossing then

  else if pcLine10.ActivePage = tsLineRoute then
    begin //Характеристика місцевості по трасі ВЛ 6 - 10 кВ
      lrFilter.Free;
      lrFilter := nil;
      UpdateGrid(Sender);
    end //else if pcLine10.ActivePage = tsLineRoute then
  else if pcLine10.ActivePage = tsENActL10 then
    begin //Виконані роботи
      actFilterObject.Free;
      actFilterObject := nil;
      UpdateGridAct(Sender);
    end //else if pcLine10.ActivePage = tsENActL10 then
  else if pcLine10.ActivePage = tsENPlanWorkL10 then
    begin //Роботи, що виконуються
      pwFilterObject.Free;
      pwFilterObject := nil;
      UpdateGridPW(Sender);
    end; //else if pcLine10.ActivePage = tsENPlanWorkL10 then
end;

procedure TfrmENLine10Edit.spbEPRenClick(Sender: TObject);
var
   frmEPRenShow: TfrmENEPRenShow;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try
               if ENLine10Obj.element.renRef = nil then ENLine10Obj.element.renRef := EPRenRef.Create();
               ENLine10Obj.element.renRef.code := StrToInt(GetReturnValue(sgEPRen,0));
               edtEPRenName.Text:=GetReturnValue(sgEPRen,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPRenShow.Free;
   end;
end;

procedure TfrmENLine10Edit.spbOSSelectClick(Sender: TObject);
var
frmOSTableShow: TfrmOSTableShow;
f : OStableFilter;
begin

     f := OStableFilter.Create;
     SetNullIntProps(f);
     SetNullXSProps(f);
          // инвентарные ЛИНИЙ могут быть взяты с Подстанций (код обор 11).. СКадовск - 006089 !!!
     f.conditionSQL := ' OSTABLE.KOD_VID in (3,11) '; // Линии как передающие утр-ва

     if length(edtInvNumber.Text) > 0 then
       f.kod_inv := '*' + edtInvNumber.Text + '*';

     f.orderBySQL :=  'OSTABLE.STR_NAME';

   frmOSTableShow:=TfrmOSTableShow.Create(Application,fmNormal,f);
   //frmOSTableShow.SendType := 444; /// для энерго ....
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

procedure TfrmENLine10Edit.spbOwnerClick(Sender: TObject);
var
  frmENOwnerShow: TfrmENOwnerShow;
begin
  frmENOwnerShow:=TfrmENOwnerShow.Create(Application, fmNormal);
  try
    with frmENOwnerShow do
      if ShowModal = mrOk then
      begin
        try
          if ENLine10Obj.ownerRef = nil then ENLine10Obj.ownerRef := ENOwnerRef.Create;
          ENLine10Obj.ownerRef.code := StrToInt(GetReturnValue(sgENOwner,0));
          edtOwner.Text:=GetReturnValue(sgENOwner,1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENOwnerShow.Free;
  end;
end;

procedure TfrmENLine10Edit.sgENSubstation04RowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
var i, hvsColCount, hvsLastCount, hvsLastRow: Integer;
  hvsFilterObject: ENHighVoltageSellFilter; //Фильтр объекта для Высоковольтных ячеек
  TempENHighVoltageSell: ENHighVoltageSellControllerSoapPort;
  ENHighVoltageSellList: ENHighVoltageSellShortList;
begin
  if TAdvStringGrid(Sender).Cells[0, NewRow] = '' then
    Exit;
  hvsLastRow := 1;
  hvsColCount := 100;
  TempENHighVoltageSell :=
    HTTPRIOENHighVoltageSell as ENHighVoltageSellControllerSoapPort;

  hvsFilterObject := ENHighVoltageSellFilter.Create;
  SetNullIntProps(hvsFilterObject);
  SetNullXSProps(hvsFilterObject);

  hvsFilterObject.conditionSQL := ' ENHIGHVOLTAGESELL.CODE IN '
    + '(SELECT HVCS.HIGHVOLTCELLREFCODE FROM ENHIGHVOLTCELLSUPPLIES HVCS '
    + 'WHERE HVCS.SUBSTATION04REFCODE = '
    + TAdvStringGrid(Sender).Cells[0, NewRow]
    + ' AND HVCS.LINE10REFCODE = ' + IntToStr(ENLine10Obj.code) + ')';

  ENHighVoltageSellList := TempENHighVoltageSell.getScrollableFilteredList(
    ENHighVoltageSellFilter(hvsFilterObject), 0, hvsColCount);

  hvsLastCount := High(ENHighVoltageSellList.list);

  if hvsLastCount > -1 then
    sgENHighVoltageSell.RowCount := hvsLastCount + 2
  else
    sgENHighVoltageSell.RowCount := 2;

  with sgENHighVoltageSell do
    for i := 0 to hvsLastCount do
      begin
        Application.ProcessMessages;
        if ENHighVoltageSellList.list[i].code <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(ENHighVoltageSellList.list[i].code)
        else
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENHighVoltageSellList.list[i].highvoltageTypeName;
        Cells[2, i + 1] := ENHighVoltageSellList.list[i].name;
        Cells[3, i + 1] := ENHighVoltageSellList.list[i].numberGen;
        hvsLastRow := i + 1;
        sgENHighVoltageSell.RowCount := hvsLastRow + 1;
      end;
  hvsColCount := hvsColCount + 1;
  sgENHighVoltageSell.Row := 1;
end;


procedure TfrmENLine10Edit.actDeleteENInspectionSheetExecute(Sender: TObject);
var
  sheetCode: Integer;
  TempENInspectionSheet : ENInspectionSheetControllerSoapPort;
begin
  inherited;
  if pcLine10.ActivePage = tsENInspectionSheet then
  begin
    TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
    try
      sheetCode := StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]);
    except
      on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Лист огляду об`єкта енергетики)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
      TempENInspectionSheet.remove(sheetCode);
      pcLine10Change(Sender);
    end;
  end;
end;



procedure TfrmENLine10Edit.actDeleteExecute(Sender: TObject);
var TempENPost: ENPostControllerSoapPort;               //Опоры
  i, ObjCode: Integer;
  ENStandFilterObj: ENStandFilter;
  TempENStand: ENStandControllerSoapPort;               //Стойки опоры
  ENStandListObj: ENStandShortList;
  TempENTravers: ENTraversControllerSoapPort;           //Траверсы опоры
  ENTraversListObj: ENTraversShortList;
  ENTraversFilterObj: ENTraversFilter;
  TempENHook: ENHookControllerSoapPort;                 //Крюки опоры
  ENHookListObj: ENHookShortList;
  ENHookFilterObj: ENHookFilter;
  TempENInsulator: ENInsulatorControllerSoapPort;       //Изоляторы опоры
  ENInsulatorListObj: ENInsulatorShortList;
  ENInsulatorFilterObj: ENInsulatorFilter;
  TempENDisconnector: ENDisconnectorControllerSoapPort; //Разъединители опоры
  ENDisconnectorListObj: ENDisconnectorShortList;
  ENDisconnectorFilterObj: ENDisconnectorFilter;
  IsPostLeave: Boolean;
  TempENBranch10: ENBranch10ControllerSoapPort;         //Воздушные Ответвления
  ENBranch10ListObj: ENBranch10ShortList;               //от ВЛ 6 - 10 кВ
  ENBranch10FilterObj: ENBranch10Filter;

  TempENCabelOut10: ENCabelOut10ControllerSoapPort;     //Кабельные выходы
  //ENCabelOut10ListObj: ENCabelOut10ShortList;           //и вставки
  //ENCabelOut10FilterObj: ENCabelOut10Filter;            //ВЛ 6 - 10 кВ
  TempENCabelOut10Item: ENCabelOut10ItemControllerSoapPort;
  ENCabelOut10ItemListObj: ENCabelOut10ItemShortList;
  //ENCabelOut10FItemilterObj: ENCabelOut10ItemFilter;
  TempENAirCrossing: ENAirCrossingControllerSoapPort;   //Воздушные пересечения
  //ENAirCrossingListObj: ENAirCrossingShortList;
  //ENAirCrossingFilterObj: ENAirCrossingFilter;
  TempENAirCrossingItem: ENAirCrossingItemControllerSoapPort;
  ENAirCrossingItemListObj: ENAirCrossingItemShortList;
  //ENAirCrossingFItemilterObj: ENAirCrossingItemFilter;
  TempENBranch10Item: ENBranch10ItemControllerSoapPort; //Опоры ответвления
  ENBranch10ItemListObj: ENBranch10ItemShortList;       //от ВЛ 6 - 10 кВ
  ENBranch10ItemFilterObj: ENBranch10ItemFilter;
  IsBranch10ItemLeave: Boolean;
  TempENLineRoute: ENLineRouteControllerSoapPort;       //Характеристика местности по трассе ВЛ 6 - 10 кВ
begin
  if pcLine10.ActivePage = tsPost then
    begin //Опори
      TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;
      try
        ObjCode := StrToInt(sgENPost.Cells[0,sgENPost.Row]);
      except
        on EConvertError do Exit;
      end;
      if Application.MessageBox(PChar('Вы действительно хотите удалить Опору?'),
        PChar('Внимание!'),
        MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK
      then
        begin
          (*Предварительная проверка количества стоек с выводом сообщения
          при необходимости о причине невозможности удаления опоры*)
          IsPostLeave := False;
          TempENStand :=
            HTTPRIOENStand as ENStandControllerSoapPort;
          try
            ENStandFilterObj := ENStandFilter.Create;
            SetNullIntProps(ENStandFilterObj);
            SetNullXSProps(ENStandFilterObj);
            ENStandFilterObj.conditionSQL := 'ENSTAND.POSTREFCODE = ' +
              sgENPost.Cells[0, sgENPost.Row];

            ENStandListObj :=
              TempENStand.getScrollableFilteredList(
                ENStandFilterObj, 0, -1);
            if ENStandListObj.totalCount > 0 then
              begin
                Application.MessageBox(
                  PChar('Удаление опоры № '
                    + sgENPost.Cells[3, sgENPost.Row]
                    + ' не представляется возможным, ' + #13#10
                    + 'пока в её состав входят стойки.'),
                  PChar('Внимание! Неудачная попытка удаления:'),
                  MB_ICONWARNING);
                IsPostLeave := True;
              end;
          finally
            ENStandFilterObj.Free;
            ENStandListObj.Free;
          end;
          if IsPostLeave then //Недопущение удаления опоры в случае присутствия
            Exit;             //стоек

          (*Предварительная проверка количества траверс с выводом сообщения
          при необходимости о причине невозможности удаления опоры*)
          TempENTravers :=
            HTTPRIOENTravers as ENTraversControllerSoapPort;
          try
            ENTraversFilterObj := ENTraversFilter.Create;
            SetNullIntProps(ENTraversFilterObj);
            SetNullXSProps(ENTraversFilterObj);
            ENTraversFilterObj.conditionSQL := 'ENTRAVERS.POSTREFCODE = ' +
              sgENPost.Cells[0, sgENPost.Row];

            ENTraversListObj :=
              TempENTravers.getScrollableFilteredList(
                ENTraversFilterObj, 0, -1);
            if ENTraversListObj.totalCount > 0 then
              begin
                Application.MessageBox(
                  PChar('Удаление опоры № '
                    + sgENPost.Cells[3, sgENPost.Row]
                    + ' не представляется возможным, ' + #13#10
                    + 'пока в её состав входят траверсы.'),
                  PChar('Внимание! Неудачная попытка удаления:'),
                  MB_ICONWARNING);
                IsPostLeave := True;
              end;
          finally
            ENTraversFilterObj.Free;
            ENTraversListObj.Free;
          end;
          if IsPostLeave then //Недопущение удаления опоры в случае присутствия
            Exit;             //траверс

          (*Предварительная проверка количества крюков с выводом сообщения
          при необходимости о причине невозможности удаления опоры*)
          TempENHook :=
            HTTPRIOENHook as ENHookControllerSoapPort;
          try
            ENHookFilterObj := ENHookFilter.Create;
            SetNullIntProps(ENHookFilterObj);
            SetNullXSProps(ENHookFilterObj);
            ENHookFilterObj.conditionSQL := 'ENHOOK.POSTREFCODE = ' +
              sgENPost.Cells[0, sgENPost.Row];

            ENHookListObj :=
              TempENHook.getScrollableFilteredList(
                ENHookFilterObj, 0, -1);
            if ENHookListObj.totalCount > 0 then
              begin
                Application.MessageBox(
                  PChar('Удаление опоры № '
                    + sgENPost.Cells[3, sgENPost.Row]
                    + ' не представляется возможным, ' + #13#10
                    + 'пока в её состав входят крюки.'),
                  PChar('Внимание! Неудачная попытка удаления:'),
                  MB_ICONWARNING);
                IsPostLeave := True;
              end;
          finally
            ENHookFilterObj.Free;
            ENHookListObj.Free;
          end;
          if IsPostLeave then //Недопущение удаления опоры в случае присутствия
            Exit;             //крюков

          (*Предварительная проверка количества изоляторов с выводом сообщения
          при необходимости о причине невозможности удаления опоры*)
          TempENInsulator :=
            HTTPRIOENInsulator as ENInsulatorControllerSoapPort;
          try
            ENInsulatorFilterObj := ENInsulatorFilter.Create;
            SetNullIntProps(ENInsulatorFilterObj);
            SetNullXSProps(ENInsulatorFilterObj);
            ENInsulatorFilterObj.conditionSQL := 'ENINSULATOR.POSTREFCODE = ' +
              sgENPost.Cells[0, sgENPost.Row];

            ENInsulatorListObj :=
              TempENInsulator.getScrollableFilteredList(
                ENInsulatorFilterObj, 0, -1);
            if ENInsulatorListObj.totalCount > 0 then
              begin
                Application.MessageBox(
                  PChar('Удаление опоры № '
                    + sgENPost.Cells[3, sgENPost.Row]
                    + ' не представляется возможным, ' + #13#10
                    + 'пока в её состав входят изоляторы.'),
                  PChar('Внимание! Неудачная попытка удаления:'),
                  MB_ICONWARNING);
                IsPostLeave := True;
                pcPostEquipment.ActivePage := tsInsulator;
              end;
          finally
            ENInsulatorFilterObj.Free;
            ENInsulatorListObj.Free;
          end;
          if IsPostLeave then //Недопущение удаления опоры в случае присутствия
            Exit;             //изоляторов

          (*Предварительная проверка количества разъединителей с выводом
          сообщения при необходимости о причине невозможности удаления опоры*)
          TempENDisconnector :=
            HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;
          try
            ENDisconnectorFilterObj := ENDisconnectorFilter.Create;
            SetNullIntProps(ENDisconnectorFilterObj);
            SetNullXSProps(ENDisconnectorFilterObj);
            ENDisconnectorFilterObj.conditionSQL :=
              'ENDISCONNECTOR.POSTREFCODE = '
              + sgENPost.Cells[0, sgENPost.Row];

            ENDisconnectorListObj :=
              TempENDisconnector.getScrollableFilteredList(
                ENDisconnectorFilterObj, 0, -1);
            if ENDisconnectorListObj.totalCount > 0 then
              begin
                Application.MessageBox(
                  PChar('Удаление опоры № '
                    + sgENPost.Cells[3, sgENPost.Row]
                    + ' не представляется возможным, ' + #13#10
                    + 'пока в её состав входят разъединители.'),
                  PChar('Внимание! Неудачная попытка удаления:'),
                  MB_ICONWARNING);
                IsPostLeave := True;
                pcPostEquipment.ActivePage := tsDisconnector;
              end;
          finally
            ENDisconnectorFilterObj.Free;
            ENDisconnectorListObj.Free;
          end;
          if IsPostLeave then //Недопущение удаления опоры в случае присутствия
            Exit;             //разъединителей

          (*Предварительная проверка количества ответвлений ВЛ 6 - 10 кВ от
          опоры с выводом сообщения при необходимости о причине невозможности
          удаления опоры*)
          TempENBranch10 :=
            HTTPRIOENBranch10 as ENBranch10ControllerSoapPort;
          try
            ENBranch10FilterObj := ENBranch10Filter.Create;
            SetNullIntProps(ENBranch10FilterObj);
            SetNullXSProps(ENBranch10FilterObj);
            ENBranch10FilterObj.conditionSQL :=
              'ENBRANCH10.POSTOUTREFCODE = '
              + sgENPost.Cells[0, sgENPost.Row];

            ENBranch10ListObj := TempENBranch10.getScrollableFilteredList(
              ENBranch10FilterObj, 0, -1);
            if ENBranch10ListObj.totalCount > 0 then
              begin
                Application.MessageBox(
                  PChar('Удаление опоры № '
                    + sgENPost.Cells[3, sgENPost.Row]
                    + ' не представляется возможным, ' + #13#10
                    + 'пока есть идущие от неё ответвления ВЛ 6 - 10 кВ.'),
                  PChar('Внимание! Неудачная попытка удаления:'),
                  MB_ICONWARNING);
                IsPostLeave := True;
                pcLine10.ActivePage := tsBranch10;
                pcPostEquipment.ActivePage := tsBranch10;
              end;
          finally
            ENBranch10FilterObj.Free;
            ENBranch10ListObj.Free;
          end;
          if IsPostLeave then //Недопущение удаления опоры в случае присутствия
            Exit;             //ответвлений ВЛ 6-10 кВ
          
          TempENPost.remove(ObjCode);
          UpdateGrid(Sender);
        end;
    end //else if pcLine10.ActivePage = tsPost then
  else if pcLine10.ActivePage = tsBranch10 then
    begin //Відгалудження від Повітряної Лінії 6 - 10 кВ
      TempENBranch10 := HTTPRIOENBranch10 as ENBranch10ControllerSoapPort;
      try
        ObjCode := StrToInt(sgENBranch10.Cells[0, sgENBranch10.Row]);
      except
        on EConvertError do Exit;
      end;
      if Application.MessageBox(
        PChar('Вы действительно хотите удалить Ответвление от ВЛ 6 - 10 кВ?'),
        PChar('Внимание!'),
        MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK
      then
        begin
          (*Предварительная проверка количества опор ответвления с выводом
          сообщения при необходимости о причине невозможности удаления
          ответвления*)
          IsBranch10ItemLeave := False;
          TempENBranch10Item :=
            HTTPRIOENBranch10Item as ENBranch10ItemControllerSoapPort;
          try
            ENBranch10ItemFilterObj := ENBranch10ItemFilter.Create;
            SetNullIntProps(ENBranch10ItemFilterObj);
            SetNullXSProps(ENBranch10ItemFilterObj);
            ENBranch10ItemFilterObj.conditionSQL :=
              'ENBRANCH10ITEM.BRANCH10REFCODE = ' +
              sgENBranch10.Cells[0, sgENBranch10.Row];
            ENBranch10ItemListObj :=
              TempENBranch10Item.getScrollableFilteredList(
                ENBranch10ItemFilterObj, 0, -1);
            if ENBranch10ItemListObj.totalCount > 0 then
              begin
                Application.MessageBox(
                  PChar('Удаление Ответвления от Воздушной Линии 6 - 10 кВ '
                    + sgENBranch10.Cells[1, sgENBranch10.Row]
                    + ' не представляется возможным, ' + #13#10
                    + 'пока не удалены поддерживающие её опоры.'),
                  PChar('Внимание! Неудачная попытка удаления:'),
                  MB_ICONWARNING);
                IsBranch10ItemLeave := True;
              end;
          finally
            ENBranch10ItemFilterObj.Free;
            ENBranch10ItemListObj.Free;
          end;
          if IsBranch10ItemLeave then //Недопущение удаления Ответвления
            Exit; //от Воздушной Линии 6 - 10 кВ в случае присутствия опор
          TempENBranch10.remove(ObjCode);
          UpdateGrid(Sender);
        end;
    end //else if pcLine10.ActivePage = tsBranch10 then
  else if pcLine10.ActivePage = tsCabelOut10 then
    begin //Кабельні виходи і вставки
      TempENCabelOut10 :=
        HTTPRIOENCabelOut10 as ENCabelOut10ControllerSoapPort;
      try
        ObjCode := StrToInt(sgENCabelOut10.Cells[0, sgENCabelOut10.Row]);
      except
        on EConvertError do Exit;
      end;
      if Application.MessageBox( PChar('Вы действительно хотите удалить '
          + 'Кабельний выход или Кабельную вставку ВЛ 6 - 10 кВ?'),
        PChar('Внимание!'),
        MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK
      then
        begin
          (*Удаление связей кабельных выходов / вставок с опорами*)
          TempENCabelOut10Item :=
            HTTPRIOENCabelOut10Item as ENCabelOut10ItemControllerSoapPort;
          ENCabelOut10ItemFilterObj := ENCabelOut10ItemFilter.Create;
          SetNullIntProps(ENCabelOut10ItemFilterObj);
          SetNullXSProps(ENCabelOut10ItemFilterObj);
          ENCabelOut10ItemFilterObj.conditionSQL :=
            'ENCabelOut10ITEM.cabelout10refcode = ' +
            sgENCabelOut10.Cells[0, sgENCabelOut10.Row];
          ENCabelOut10ItemListObj :=
            TempENCabelOut10Item.getScrollableFilteredList(
              ENCabelOut10ItemFilterObj, 0, -1);
          try
            if ENCabelOut10ItemListObj.totalCount > 0 then
              for i := 0 to ENCabelOut10ItemListObj.totalCount - 1 do
                TempENCabelOut10Item.remove(
                  ENCabelOut10ItemListObj.list[i].code);
          finally
            ENCabelOut10ItemFilterObj.Free;
            ENCabelOut10ItemListObj.Free;
          end;
          TempENCabelOut10.remove(ObjCode);
          UpdateGrid(Sender);
          UpdateGridCabelOut10Item(Sender,
            TAdvStringGrid(sgENCabelOut10).Cells[0, sgENCabelOut10.Row]);
        end;
    end //else if pcLine10.ActivePage = tsCabelOut10 then
  else if pcLine10.ActivePage = tsAirCrossing then
    begin //Повітряні перетинання
      TempENAirCrossing :=
        HTTPRIOENAirCrossing as ENAirCrossingControllerSoapPort;
      try
        ObjCode := StrToInt(sgENAirCrossing.Cells[0, sgENAirCrossing.Row]);
      except
        on EConvertError do Exit;
      end;
      if Application.MessageBox(
        PChar('Вы действительно хотите удалить Воздушное пересечение?'),
        PChar('Внимание!'),
        MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK
      then
        begin
          (*Удаление связей воздушных пересечений с опорами*)
          TempENAirCrossingItem :=
            HTTPRIOENAirCrossingItem as ENAirCrossingItemControllerSoapPort;
          ENAirCrossingItemFilterObj := ENAirCrossingItemFilter.Create;
          SetNullIntProps(ENAirCrossingItemFilterObj);
          SetNullXSProps(ENAirCrossingItemFilterObj);
          ENAirCrossingItemFilterObj.conditionSQL :=
            'ENAIRCROSSINGITEM.AIRCROSSINGREFCODE = ' +
            sgENAirCrossing.Cells[0, sgENAirCrossing.Row];
          ENAirCrossingItemListObj :=
            TempENAirCrossingItem.getScrollableFilteredList(
              ENAirCrossingItemFilterObj, 0, -1);
          try
            if ENAirCrossingItemListObj.totalCount > 0 then
              for i := 0 to ENAirCrossingItemListObj.totalCount - 1 do
                TempENAirCrossingItem.remove(
                  ENAirCrossingItemListObj.list[i].code);
          finally
            ENAirCrossingItemFilterObj.Free;
            ENAirCrossingItemListObj.Free;
          end;
          TempENAirCrossing.remove(ObjCode);
          UpdateGrid(Sender);
          UpdateGridAirCrossingItem(Sender,
            TAdvStringGrid(sgENAirCrossing).Cells[0, sgENAirCrossing.Row]);
        end;
    end //else if pcLine10.ActivePage = tsAirCrossing then

  else if pcLine10.ActivePage = tsLineRoute then
    begin //Характеристика местности по трассе ВЛ 6 - 10 кВ
      TempENLineRoute := HTTPRIOENLineRoute as ENLineRouteControllerSoapPort;
      try
        ObjCode := StrToInt(sgENLineRoute.Cells[0, sgENLineRoute.Row]);
      except
        on EConvertError do Exit;
      end;
      if Application.MessageBox(
        PChar('Вы действительно хотите удалить звено Трасы ВЛ 6 - 10 кВ?'),
        PChar('Внимание!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK
      then
        begin
          TempENLineRoute.remove(ObjCode);
          UpdateGrid(Sender);
        end;
    end //else if pcLine10.ActivePage = tsLineRoute then
  else if pcLine10.ActivePage = tsENActL10 then
    begin //Виконані роботи
    end //else if pcLine10.ActivePage = tsENActL10 then
  else if pcLine10.ActivePage = tsENPlanWorkL10 then
    begin //Роботи, що виконуються
    end; //else if pcLine10.ActivePage = tsENPlanWorkL10 then
end;

procedure TfrmENLine10Edit.actFilterExecute(Sender: TObject);
var condition: String;
begin
  if pcLine10.ActivePage = tsPost then
    begin //Опоры
      {frmENPostFilterEdit:=TfrmENPostFilterEdit.Create(Application, dsInsert);
      try
        ENPostFilterObj := ENPostFilter.Create;
        SetNullIntProps(ENPostFilterObj);
        SetNullXSProps(ENPostFilterObj);

        if frmENPostFilterEdit.ShowModal = mrOk then
        begin
          //FilterObject := ENPostFilter.Create;
          FilterObject := ENPostFilterObj;
          actUpdateExecute(Sender);
        end;
      finally
        frmENPostFilterEdit.Free;
        frmENPostFilterEdit:=nil;
      end;}
    end //if pcLine10.ActivePage = tsPost then
  else if pcLine10.ActivePage = tsBranch10 then
    begin
      {frmENBranch10FilterEdit:=TfrmENBranch10FilterEdit.Create(Application, dsInsert);
      try
        ENBranch10FilterObj := ENBranch10Filter.Create;
        SetNullIntProps(ENBranch10FilterObj);
        SetNullXSProps(ENBranch10FilterObj);
        if frmENBranch10FilterEdit.ShowModal = mrOk then
        begin
          //FilterObject := ENBranch10Filter.Create;
          FilterObject := ENBranch10FilterObj;
          actUpdateExecute(Sender);
        end;
      finally
        frmENBranch10FilterEdit.Free;
        frmENBranch10FilterEdit:=nil;
      end;}
    end //else if pcLine10.ActivePage = tsENBranch10 then
  else if pcLine10.ActivePage = tsCabelOut10 then
    begin
      {frmENCabelOut10FilterEdit :=
        TfrmENCabelOut10FilterEdit.Create(Application, dsInsert);
      try
        ENCabelOut10FilterObj := ENCabelOut10Filter.Create;
        SetNullIntProps(ENCabelOut10FilterObj);
        SetNullXSProps(ENCabelOut10FilterObj);
        if frmENCabelOut10FilterEdit.ShowModal = mrOk then
        begin
          FilterObject := ENCabelOut10FilterObj;
          actUpdateExecute(Sender);
        end;
      finally
        frmENCabelOut10FilterEdit.Free;
        frmENCabelOut10FilterEdit:=nil;
      end;}
    end //else if pcLine10.ActivePage = tsCabelOut10 then
  else if pcLine10.ActivePage = tsAirCrossing then
    begin
      {frmENAirCrossingFilterEdit :=
        TfrmENAirCrossingFilterEdit.Create(Application, dsInsert);
      try
        ENAirCrossingFilterObj := ENAirCrossingFilter.Create;
        SetNullIntProps(ENAirCrossingFilterObj);
        SetNullXSProps(ENAirCrossingFilterObj);
        if frmENAirCrossingFilterEdit.ShowModal = mrOk then
          begin
            FilterObject := ENAirCrossingFilterObj;
            actUpdateExecute(Sender);
          end;
      finally
        frmENAirCrossingFilterEdit.Free;
        frmENAirCrossingFilterEdit := nil;
      end;}
    end //else if pcLine10.ActivePage = tsAirCrossing then

  else if pcLine10.ActivePage = tsLineRoute then
    begin //Характеристика місцевості по трасі ВЛ 6 - 10 кВ
      {frmENLineRouteFilterEdit :=
        TfrmENLineRouteFilterEdit.Create(Application, dsInsert);
      try
        ENLineRouteFilterObj := ENLineRouteFilter.Create;
        SetNullIntProps(ENLineRouteFilterObj);
        SetNullXSProps(ENLineRouteFilterObj);
        if frmENLineRouteFilterEdit.ShowModal = mrOk then
          begin
            FilterObject := ENLineRouteFilterObj;
            actUpdateExecute(Sender);
          end;
      finally
        frmENLineRouteFilterEdit.Free;
        frmENLineRouteFilterEdit := nil;
      end;}
    end //else if pcLine10.ActivePage = tsLineRoute then
  else if pcLine10.ActivePage = tsENActL10 then
    begin //Виконані роботи
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
                + IntToStr(ENLine10Obj.element.code)
            else
              ENActFilterObj.conditionSQL :=
                ' ENACT.STATUSREFCODE <> ' + IntToStr(ENACT_CANCELED)
                + ' AND ENACT.ELEMENTCODE = '
                + IntToStr(ENLine10Obj.element.code);
            actFilterObject := ENActFilterObj;
            UpdateGridAct(Sender);
          end;
      finally
        frmENActFilterEdit.Free;
        frmENActFilterEdit := nil;
      end;
    end //else if pcLine10.ActivePage = tsENActL10 then
  else if pcLine10.ActivePage = tsENPlanWorkL10 then
    begin //Роботи, що виконуються
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
              + IntToStr(ENLine10Obj.element.code);

            if outerPWCondition <> '' then
              begin
                condition := ENPlanWorkFilterObj.conditionSQL;
                AddCondition(condition, outerPWCondition);
                ENPlanWorkFilterObj.conditionSQL := condition;
              end;
            pwFilterObject := ENPlanWorkFilterObj;
            //isPWFiltered := True;
            UpdateGridPW(Sender);
          end;
        ENPlanWorkFilterObj := nil;
      finally
        frmENPlanWorkFilterEdit.Free;
        frmENPlanWorkFilterEdit := nil;
      end;
    end; //else if pcLine10.ActivePage = tsENPlanWorkL10 then
end;

procedure TfrmENLine10Edit.sgENPostRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  if TAdvStringGrid(Sender).Cells[0, NewRow] = '' then
    Exit;
  UpdateGridStand(Sender, TAdvStringGrid(Sender).Cells[0, NewRow]);          //Обновление списка стоек опоры
  UpdateGridTravers(Sender, TAdvStringGrid(Sender).Cells[0, NewRow]);        //Обновление списка траверс опоры
  UpdateGridHook(Sender, TAdvStringGrid(Sender).Cells[0, NewRow]);           //Обновление списка крюков опоры
  if pcPostEquipment.ActivePage = tsInsulator then
    UpdateGridInsulator(Sender, TAdvStringGrid(Sender).Cells[0, NewRow])     //Обновление списка изоляторов
  else if pcPostEquipment.ActivePage = tsDisconnector then
    UpdateGridDisconnector(Sender, TAdvStringGrid(Sender).Cells[0, NewRow]); //Обновление списка разъединителей
end;


//Стойки опор
procedure TfrmENLine10Edit.actViewStandExecute(Sender: TObject);
Var TempENStand: ENStandControllerSoapPort;
begin
  if sgENStand.Cells[0, sgENStand.Row] = '' then
    Exit;
  TempENStand := HTTPRIOENStand as ENStandControllerSoapPort;
  try
    ENStandObj := TempENStand.getObject(
      StrToInt(sgENStand.Cells[0, sgENStand.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENStandEdit := TfrmENStandEdit.Create(Application, dsView);
  try
    frmENStandEdit.ShowModal;
  finally
    frmENStandEdit.Free;
    frmENStandEdit := nil;
  end;
end;

procedure TfrmENLine10Edit.actInsertStandExecute(Sender: TObject);
var Allow: Boolean;
  TempENPost: ENPostControllerSoapPort; //Опоры
  postObj: ENPost; postObjCode: Integer;
begin
  if sgENPost.Cells[0, sgENPost.Row] = '' then
    Exit;

  ENStandObj := ENStand.Create;

  ENStandObj.element := ENElement.Create;
  ENStandObj.element.elementInRef := ENElementRef.Create;
  ENStandObj.element.renRef := EPRenRef.Create;
  TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;
  postObjCode :=  StrToInt(sgENPost.Cells[0, sgENPost.Row]);
  postObj := TempENPost.getObject(postObjCode);
  try
    ENStandObj.element.elementInRef.code := postObj.element.code;
    ENStandObj.element.renRef.code := postObj.element.renRef.code;
  finally
    postObj.Free;
    postObj := nil;
  end;

  if ENStandObj.postRef = nil then
    ENStandObj.postRef := ENPostRef.Create;
  ENStandObj.postRef.code := postObjCode;
  try
    frmENStandEdit:=TfrmENStandEdit.Create(Application, dsInsert);
    try
      if frmENStandEdit.ShowModal = mrOk then
        begin
          if ENStandObj <> nil then
            UpdateGridStand(Sender, sgENPost.Cells[0, sgENPost.Row]);
        end;
    finally
      frmENStandEdit.Free;
      frmENStandEdit := nil;
    end;
  finally
    ENStandObj.Free;
  end;
  sgENPost.OnRowChanging(sgENPost, 0, sgENPost.Row, Allow);
end;

procedure TfrmENLine10Edit.actDeleteStandExecute(Sender: TObject);
Var TempENStand: ENStandControllerSoapPort; ObjCode: Integer;
begin
  if sgENStand.Cells[0, sgENStand.Row] = '' then
    Exit;
  TempENStand := HTTPRIOENStand as ENStandControllerSoapPort;
  try
    ObjCode := StrToInt(sgENStand.Cells[0, sgENStand.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(
    PChar('Вы действительно хотите удалить стойку опоры?'), PChar('Внимание!'),
    MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK
  then
    begin
      TempENStand.remove(ObjCode);
      UpdateGridStand(Sender, sgENPost.Cells[0, sgENPost.Row]);
      //sgENPost.OnRowChanging(sgENPost, 0, sgENPost.Row, Allow);
    end;
end;

procedure TfrmENLine10Edit.actEditStandExecute(Sender: TObject);
Var TempENStand: ENStandControllerSoapPort;
begin
  if sgENStand.Cells[0, sgENStand.Row] = '' then
    Exit;
  TempENStand := HTTPRIOENStand as ENStandControllerSoapPort;
  try
    ENStandObj := TempENStand.getObject(
      StrToInt(sgENStand.Cells[0, sgENStand.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENStandEdit := TfrmENStandEdit.Create(Application, dsEdit);
  try
    if frmENStandEdit.ShowModal= mrOk then
      UpdateGridStand(Sender, sgENPost.Cells[0, sgENPost.Row]);
  finally
    frmENStandEdit.Free;
    frmENStandEdit := nil;
  end;
end;

procedure TfrmENLine10Edit.actUpdateStandExecute(Sender: TObject);
begin
  UpdateGridStand(Sender, sgENPost.Cells[0, sgENPost.Row]);
end;

procedure TfrmENLine10Edit.actFilterStandExecute(Sender: TObject);
begin
  {frmENStandFilterEdit:=TfrmENStandFilterEdit.Create(Application, dsInsert);
  try
    ENStandFilterObj := ENStandFilter.Create;
    SetNullIntProps(ENStandFilterObj);
    SetNullXSProps(ENStandFilterObj);

    if frmENStandFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENStandFilter.Create;
      FilterObject := ENStandFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENStandFilterEdit.Free;
    frmENStandFilterEdit:=nil;
  end;}
end;

procedure TfrmENLine10Edit.actNoFilterStandExecute(Sender: TObject);
begin
  {stFilterObject.Free;
  stFilterObject := nil;
  UpdateGridStand(Sender, sgENPost.Cells[0, sgENPost.Row]);}
end;


procedure TfrmENLine10Edit.UpdateGridStand(Sender: TObject; strCode: String);
var
  i, j: Integer; //Allow: Boolean;
  TempENStand: ENStandControllerSoapPort;
  ENStandList: ENStandShortList;
begin
  ClearGrid(sgENStand);
  if strCode = '' then Exit;

  stColCount := 100;
  TempENStand := HTTPRIOENStand as ENStandControllerSoapPort;
  if stFilterObject = nil then
    begin
       stFilterObject := ENStandFilter.Create;
       SetNullIntProps(stFilterObject);
       SetNullXSProps(stFilterObject);
    end;
  stFilterObject.conditionSQL := 'ENSTAND.POSTREFCODE = ' + strCode;
    //TAdvStringGrid(sgENPost).Cells[0, sgENPost.Row];
  ENStandList := TempENStand.getScrollableFilteredList(
    ENStandFilter(stFilterObject), 0, stColCount);
  stLastCount := High(ENStandList.list);
  if stLastCount > -1 then
    sgENStand.RowCount := stLastCount + 2
  else
    sgENStand.RowCount := 2;

  with sgENStand do
    for i := 0 to stLastCount do
      begin
        Application.ProcessMessages;
        if ENStandList.list[i].code <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(ENStandList.list[i].code)
        else
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENStandList.list[i].materialTypeName;
        Cells[2, i + 1] := ENStandList.list[i].materialRefName;
        Cells[3, i + 1] := ENStandList.list[i].name;
        stLastRow := i + 1;
        sgENStand.RowCount := stLastRow + 1;
      end;
  stColCount := stColCount + 1;
  sgENStand.Row := 1;

end;


procedure TfrmENLine10Edit.UpdateGridTravers(Sender: TObject; strCode: String);
var
  i, j: Integer; //Allow: Boolean;
  TempENTravers: ENTraversControllerSoapPort;
  ENTraversList: ENTraversShortList;
begin
  ClearGrid(sgENTravers);
  if strCode = '' then Exit;

  trColCount := 100;
  TempENTravers := HTTPRIOENTravers as ENTraversControllerSoapPort;
  if trFilterObject = nil then
    begin
       trFilterObject := ENTraversFilter.Create;
       SetNullIntProps(trFilterObject);
       SetNullXSProps(trFilterObject);
    end;
  trFilterObject.conditionSQL := 'ENTRAVERS.POSTREFCODE = ' + strCode;
    //TAdvStringGrid(sgENPost).Cells[0, sgENPost.Row];
  ENTraversList := TempENTravers.getScrollableFilteredList(
    ENTraversFilter(trFilterObject), 0, trColCount);
  trLastCount := High(ENTraversList.list);
  if trLastCount > -1 then
    sgENTravers.RowCount := trLastCount + 2
  else
    sgENTravers.RowCount := 2;

  with sgENTravers do
    for i := 0 to trLastCount do
      begin
        Application.ProcessMessages;
        if ENTraversList.list[i].code <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(ENTraversList.list[i].code)
        else
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENTraversList.list[i].traversTypeName;
        Cells[2, i + 1] := ENTraversList.list[i].materialRefName;
        Cells[3, i + 1] := ENTraversList.list[i].name;
        trLastRow := i + 1;
        sgENTravers.RowCount := trLastRow + 1;
      end;
  trColCount := trColCount + 1;
  sgENTravers.Row := 1;
end;


procedure TfrmENLine10Edit.UpdateGridHook(Sender: TObject; strCode: String);
var
  i, j: Integer; //Allow: Boolean;
  TempENHook: ENHookControllerSoapPort;
  ENHookList: ENHookShortList;
begin
  ClearGrid(sgENHook);
  if strCode = '' then Exit;

  hkColCount := 100;
  TempENHook := HTTPRIOENHook as ENHookControllerSoapPort;
  if hkFilterObject = nil then
    begin
       hkFilterObject := ENHookFilter.Create;
       SetNullIntProps(hkFilterObject);
       SetNullXSProps(hkFilterObject);
    end;
  hkFilterObject.conditionSQL := 'ENHook.POSTREFCODE = ' + strCode;
    //TAdvStringGrid(sgENPost).Cells[0, sgENPost.Row];
  ENHookList := TempENHook.getScrollableFilteredList(
    ENHookFilter(hkFilterObject), 0, hkColCount);
  hkLastCount := High(ENHookList.list);
  if hkLastCount > -1 then
    sgENHook.RowCount := hkLastCount + 2
  else
    sgENHook.RowCount := 2;

  with sgENHook do
    for i := 0 to hkLastCount do
      begin
        Application.ProcessMessages;
        if ENHookList.list[i].code <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(ENHookList.list[i].code)
        else
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENHookList.list[i].hookTypeName;
        Cells[2, i + 1] := ENHookList.list[i].materialRefName;
        Cells[3, i + 1] := ENHookList.list[i].name;
        hkLastRow := i + 1;
        sgENHook.RowCount := hkLastRow + 1;
      end;
  hkColCount := hkColCount + 1;
  sgENHook.Row := 1;
end;


procedure TfrmENLine10Edit.UpdateGridInsulator(Sender: TObject; strCode: String);
var
  i, j: Integer; //Allow: Boolean;
  TempENInsulator: ENInsulatorControllerSoapPort;
  ENInsulatorList: ENInsulatorShortList;
begin
  ClearGrid(sgENInsulator);
  if strCode = '' then Exit;

  //Заполнение списка Изоляторов
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
  insFilterObject.conditionSQL := ' ENINSULATOR.LINE10REFCODE = '
    + IntToSTr(ENLine10Obj.code) + ' AND ENINSULATOR.POSTREFCODE = '
    + strCode;
    //+ TAdvStringGrid(sgENPost).Cells[0, sgENPost.Row];

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
         if ENInsulatorList.list[i].code <> Low(Integer) then //Код
           Cells[0, i + 1] := IntToStr(ENInsulatorList.list[i].code)
         else
           Cells[0, i + 1] := '';
         Cells[1, i + 1] := ENInsulatorList.list[i].insulatorTypeName;

         Cells[2, i + 1] := ENInsulatorList.list[i].materialRefName; //Изолятор из Нормативных материалов
         if ENInsulatorList.list[i].voltage = nil then //Напряжение, кВ
           Cells[3, i + 1] := ''
         else
           Cells[3, i + 1] :=
             ENInsulatorList.list[i].voltage.DecimalString;
         insLastRow := i + 1;
         sgENInsulator.RowCount := insLastRow + 1;
       end;
  insColCount := insColCount + 1;
  sgENInsulator.Row := 1;
end;


procedure TfrmENLine10Edit.UpdateGridDisconnector(Sender: TObject; strCode: String);
var
  i, j: Integer; //Allow: Boolean;
  TempENDisconnector: ENDisconnectorControllerSoapPort;
  ENDisconnectorList: ENDisconnectorShortList;
begin
  ClearGrid(sgENDisconnector);
  if strCode = '' then Exit;

  //Заполнение списка Разъединителей
  SetGridHeaders(ENDisconnectorHeaders, sgENDisconnector.ColumnHeaders);
  dColCount := 100;
  TempENDisconnector := HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;

  if dFilterObject = nil then
    begin
      dFilterObject := ENDisconnectorFilter.Create;
      SetNullIntProps(dFilterObject);
      SetNullXSProps(dFilterObject);
    end;

  dFilterObject.conditionSQL := ' ENDISCONNECTOR.LINE10REFCODE = '
    + IntToSTr(ENLine10Obj.code) + ' AND ENDISCONNECTOR.POSTREFCODE = '
    + strCode;
    //+ TAdvStringGrid(sgENPost).Cells[0, sgENPost.Row];

  ENDisconnectorList := TempENDisconnector.getScrollableFilteredList(ENDisconnectorFilter(dFilterObject), 0, dColCount);

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
         else //Код Разъединителя
           Cells[0, i + 1] := '';
         Cells[1, i + 1] := ENDisconnectorList.list[i].materialRefName; //Разъединитель из Нормативных материалов
         if ENDisconnectorList.list[i].ratedVoltage = nil then
           Cells[2, i + 1] := '' //Номинальное напряжение, кВ
         else
           Cells[2, i + 1] :=
             ENDisconnectorList.list[i].ratedVoltage.DecimalString;
         if ENDisconnectorList.list[i].ratedCurrent = nil then
           Cells[3, i + 1] := '' //Номинальный ток, А
         else
           Cells[3, i + 1] :=
             ENDisconnectorList.list[i].ratedCurrent.DecimalString;
         Cells[4, i + 1] := ENDisconnectorList.list[i].matDriveRefName; //Привод Разъединителя из Нормативных материалов
         dLastRow := i + 1;
         sgENDisconnector.RowCount := dLastRow + 1;
       end;
   dColCount := dColCount + 1;
   sgENDisconnector.Row := 1;
end;


procedure TfrmENLine10Edit.UpdateGridBranch10Item(Sender: TObject;
  strBranch10Code: String); //Опоры Ответвления ВЛ
var
  i, j: Integer; //Allow: Boolean;
  TempENBranch10Item: ENBranch10ItemControllerSoapPort;
  ENBranch10ItemList: ENBranch10ItemShortList;
begin
  ClearGrid(sgENBranch10Item);
  if strBranch10Code = '' then Exit;

  b10iColCount := 100;
  TempENBranch10Item := HTTPRIOENBranch10Item as ENBranch10ItemControllerSoapPort;
  if b10iFilterObject = nil then
    begin
      b10iFilterObject := ENBranch10ItemFilter.Create;
      SetNullIntProps(b10iFilterObject);
      SetNullXSProps(b10iFilterObject);
    end;

  b10iFilterObject.conditionSQL :=
    'ENBRANCH10ITEM.BRANCH10REFCODE = ' + strBranch10Code;

  ENBranch10ItemList := TempENBranch10Item.getScrollableFilteredList(
    ENBranch10ItemFilter(b10iFilterObject), 0, b10iColCount);
  b10iLastCount := High(ENBranch10ItemList.list);
  if b10iLastCount > -1 then
     sgENBranch10Item.RowCount := b10iLastCount + 2
  else
     sgENBranch10Item.RowCount := 2;
  with sgENBranch10Item do
    for i := 0 to b10iLastCount do
      begin
        Application.ProcessMessages;

        if ENBranch10ItemList.list[i].code <> Low(Integer) then //Код
          Cells[0, i + 1] := IntToStr(ENBranch10ItemList.list[i].code)
        else
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENBranch10ItemList.list[i].postTypeName; //Тип опори
        Cells[2, i + 1] := ENBranch10ItemList.list[i].postGroundName; //Заземлення
        Cells[3, i + 1] := ENBranch10ItemList.list[i].postPostNumberGen; //Номер опори

        if ENBranch10ItemList.list[i].postWoodenLength = nil then
          Cells[4, i + 1] := ''
        else
          Cells[4, i + 1] := ENBranch10ItemList.list[i].postWoodenLength.decimalString; //Довжина стояка, м

        if ENBranch10ItemList.list[i].postLastRepairDate = nil then
          Cells[5, i + 1] := '' //Дата останнього ремонту
        else
          Cells[5, i + 1] := XSDate2String(
            ENBranch10ItemList.list[i].postLastRepairDate);
        Cells[6, i + 1] := IntToSTr(ENBranch10ItemList.list[i].postYearSetup); //Рік встановлення
        //Cells[7, i + 1] := ENBranch10ItemList.list[i].postMaterialRefName; //Матеріал опори
        Cells[7, i + 1] := ENBranch10ItemList.list[i].postName; //Примітка
        Cells[8, i + 1] := IntToStr(ENBranch10ItemList.list[i].postCode); //Код опори
        b10iLastRow := i + 1;
        sgENBranch10Item.RowCount := b10iLastRow + 1;
      end;
  b10iColCount := b10iColCount + 1;
  sgENBranch10Item.Row := 1;
end;


procedure TfrmENLine10Edit.UpdateGridCabelOut10Item(Sender: TObject;
  strCode: String); //Обновление списка опоры, между которыми проложена
                    //Кабельная вставка / от которой осуществлён Кабельный выход
var
  i, j: Integer; //Allow: Boolean;
  TempENCabelOut10Item: ENCabelOut10ItemControllerSoapPort;
  ENCabelOut10ItemList: ENCabelOut10ItemShortList;
begin
  ClearGrid(sgENCabelOut10Item);
  if strCode = '' then Exit;

  acrColCount := 100;
  TempENCabelOut10Item := HTTPRIOENCabelOut10Item as ENCabelOut10ItemControllerSoapPort;
  if ic10Filter = nil then
    begin
      ic10Filter := ENCabelOut10ItemFilter.Create;
      SetNullIntProps(ic10Filter);
      SetNullXSProps(ic10Filter);
    end;

  ic10Filter.conditionSQL :=
    'ENCabelOut10ITEM.CabelOut10REFCODE = ' + strCode;

  ENCabelOut10ItemList := TempENCabelOut10Item.getScrollableFilteredList(
    ENCabelOut10ItemFilter(ic10Filter), 0, acrColCount);
  ic10LastCount := High(ENCabelOut10ItemList.list);
  if ic10LastCount > -1 then
     sgENCabelOut10Item.RowCount := ic10LastCount + 2
  else
     sgENCabelOut10Item.RowCount := 2;
  with sgENCabelOut10Item do
    for i := 0 to ic10LastCount do
      begin
        Application.ProcessMessages;

        if ENCabelOut10ItemList.list[i].code <> Low(Integer) then //Код
          Cells[0, i + 1] := IntToStr(ENCabelOut10ItemList.list[i].code)
        else
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENCabelOut10ItemList.list[i].postTypeName; //Тип опори
        Cells[2, i + 1] := ENCabelOut10ItemList.list[i].postGroundName; //Заземлення
        Cells[3, i + 1] := ENCabelOut10ItemList.list[i].postPostNumberGen; //Номер опори

        if ENCabelOut10ItemList.list[i].postWoodenLength = nil then
          Cells[4, i + 1] := ''
        else
          Cells[4, i + 1] := ENCabelOut10ItemList.list[i].postWoodenLength.decimalString; //Довжина стояка, м

        if ENCabelOut10ItemList.list[i].postLastRepairDate = nil then
          Cells[5, i + 1] := '' //Дата останнього ремонту
        else
          Cells[5, i + 1] := XSDate2String(
            ENCabelOut10ItemList.list[i].postLastRepairDate);
        Cells[6, i + 1] := IntToSTr(ENCabelOut10ItemList.list[i].postYearSetup); //Рік встановлення
        Cells[7, i + 1] := ENCabelOut10ItemList.list[i].postMaterialRefName; //Матеріал опори
        Cells[8, i + 1] := ENCabelOut10ItemList.list[i].postName; //Примітка
        Cells[9, i + 1] := IntToStr(ENCabelOut10ItemList.list[i].postCode); //Код опори
        ic10LastRow := i + 1;
        sgENCabelOut10Item.RowCount := ic10LastRow + 1;
      end;
  acrColCount := acrColCount + 1;
  sgENCabelOut10Item.Row := 1;
end;

procedure TfrmENLine10Edit.UpdateGridAirCrossingItem(Sender: TObject;
  strCode: String);      //Опоры, ограничивающие воздушные пересечения
var i, j: Integer; //Allow: Boolean;
  TempENAirCrossingItem: ENAirCrossingItemControllerSoapPort;
  ENAirCrossingItemList: ENAirCrossingItemShortList;
begin
  for i := 1 to sgENAirCrossingItem.RowCount - 1 do
    for j := 0 to sgENAirCrossingItem.ColCount - 1 do
      sgENAirCrossingItem.Cells[j, i] := '';


  if strCode = '' then
    Exit;

  iacColCount := 100;
  TempENAirCrossingItem := HTTPRIOENAirCrossingItem as ENAirCrossingItemControllerSoapPort;
  if iacFilter = nil then
    begin
      iacFilter := ENAirCrossingItemFilter.Create;
      SetNullIntProps(iacFilter);
      SetNullXSProps(iacFilter);
    end;

  iacFilter.conditionSQL :=
    'ENAIRCROSSINGITEM.AIRCROSSINGREFCODE = ' + strCode;

  ENAirCrossingItemList := TempENAirCrossingItem.getScrollableFilteredList(
    ENAirCrossingItemFilter(iacFilter), 0, iacColCount);
  iacLastCount := High(ENAirCrossingItemList.list);
  if iacLastCount > -1 then
     sgENAirCrossingItem.RowCount := iacLastCount + 2
  else
     sgENAirCrossingItem.RowCount := 2;
  with sgENAirCrossingItem do
    for i := 0 to iacLastCount do
      begin
        Application.ProcessMessages;

        if ENAirCrossingItemList.list[i].code <> Low(Integer) then //Код
          Cells[0, i + 1] := IntToStr(ENAirCrossingItemList.list[i].code)
        else
          Cells[0, i + 1] := '';
        
        Cells[1, i + 1] := ENAirCrossingItemList.list[i].postRefTypeName; //Тип опори
        Cells[2, i + 1] := ENAirCrossingItemList.list[i].postRefGroundName; //Заземлення
        Cells[3, i + 1] := ENAirCrossingItemList.list[i].postRefPostNumberGen; //Номер опори

        if ENAirCrossingItemList.list[i].postRefWoodenLength = nil then
          Cells[4, i + 1] := ''
        else
          Cells[4, i + 1] := ENAirCrossingItemList.list[i].postRefWoodenLength.decimalString; //Довжина стояка, м


        if ENAirCrossingItemList.list[i].postRefLastRepairDate = nil then
          Cells[5, i + 1] := '' //Дата останнього ремонту
        else
          Cells[5, i + 1] := XSDate2String(
            ENAirCrossingItemList.list[i].postRefLastRepairDate);
        Cells[6, i + 1] := IntToSTr(ENAirCrossingItemList.list[i].postRefYearSetup); //Рік встановлення
        Cells[7, i + 1] := ENAirCrossingItemList.list[i].postRefMaterialRefName; //Матеріал опори
        Cells[8, i + 1] := ENAirCrossingItemList.list[i].postRefName; //Примітка
        Cells[9, i + 1] := IntToStr(ENAirCrossingItemList.list[i].postRefCode); //Код опори
        iacLastRow := i + 1;
        sgENAirCrossingItem.RowCount := iacLastRow + 1;
      end;
  iacColCount := iacColCount + 1;
  sgENAirCrossingItem.Row := 1;
end;


procedure TfrmENLine10Edit.actViewTraversExecute(Sender: TObject);
Var TempENTravers: ENTraversControllerSoapPort;
begin
  if sgENTravers.Cells[0, sgENTravers.Row] = '' then
    Exit;
  TempENTravers := HTTPRIOENTravers as ENTraversControllerSoapPort;
  try
    ENTraversObj := TempENTravers.getObject(
      StrToInt(sgENTravers.Cells[0, sgENTravers.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENTraversEdit := TfrmENTraversEdit.Create(Application, dsView);
  try
    frmENTraversEdit.ShowModal;
  finally
    frmENTraversEdit.Free;
    frmENTraversEdit := nil;
  end;
end;

procedure TfrmENLine10Edit.actInsertTraversExecute(Sender: TObject);
var TempENPost: ENPostControllerSoapPort; //Опоры
  postObj: ENPost; postObjCode: Integer;
begin
  if sgENPost.Cells[0, sgENPost.Row] = '' then
    Exit;
  ENTraversObj := ENTravers.Create;

  ENTraversObj.element := ENElement.Create;
  ENTraversObj.element.elementInRef := ENElementRef.Create;
  ENTraversObj.element.renRef := EPRenRef.Create;
  TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;
  postObjCode :=  StrToInt(sgENPost.Cells[0, sgENPost.Row]);
  postObj := TempENPost.getObject(postObjCode);
  try
    ENTraversObj.element.elementInRef.code := postObj.element.code;
    ENTraversObj.element.renRef.code := postObj.element.renRef.code;
  finally
    postObj.Free;
    postObj := nil;
  end;

  if ENTraversObj.postRef = nil then
    ENTraversObj.postRef := ENPostRef.Create;
  ENTraversObj.postRef.code := postObjCode;
  try
    frmENTraversEdit:=TfrmENTraversEdit.Create(Application, dsInsert);
    try
      if frmENTraversEdit.ShowModal = mrOk then
        begin
          if ENTraversObj <> nil then
            UpdateGridTravers(Sender, sgENPost.Cells[0, sgENPost.Row]);
        end;
    finally
      frmENTraversEdit.Free;
      frmENTraversEdit := nil;
    end;
  finally
    ENTraversObj.Free;
  end;
end;

procedure TfrmENLine10Edit.actDeleteTraversExecute(Sender: TObject);
Var TempENTravers: ENTraversControllerSoapPort; ObjCode: Integer;
begin
  if sgENTravers.Cells[0, sgENTravers.Row] = '' then
    Exit;
  TempENTravers := HTTPRIOENTravers as ENTraversControllerSoapPort;
  try
    ObjCode := StrToInt(sgENTravers.Cells[0, sgENTravers.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(
    PChar('Вы действительно хотите удалить стойку опоры?'), PChar('Внимание!'),
    MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK
  then
    begin
      TempENTravers.remove(ObjCode);
      UpdateGridTravers(Sender, sgENPost.Cells[0, sgENPost.Row]);
    end;
end;

procedure TfrmENLine10Edit.actEditTraversExecute(Sender: TObject);
Var TempENTravers: ENTraversControllerSoapPort;
begin
  if sgENTravers.Cells[0, sgENTravers.Row] = '' then
    Exit;
  TempENTravers := HTTPRIOENTravers as ENTraversControllerSoapPort;
  try
    ENTraversObj := TempENTravers.getObject(
      StrToInt(sgENTravers.Cells[0, sgENTravers.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENTraversEdit := TfrmENTraversEdit.Create(Application, dsEdit);
  try
    if frmENTraversEdit.ShowModal= mrOk then
      UpdateGridTravers(Sender, sgENPost.Cells[0, sgENPost.Row]);
  finally
    frmENTraversEdit.Free;
    frmENTraversEdit := nil;
  end;
end;

procedure TfrmENLine10Edit.actUpdateTraversExecute(Sender: TObject);
begin
  UpdateGridTravers(Sender, sgENPost.Cells[0, sgENPost.Row]);
end;

procedure TfrmENLine10Edit.actFilterTraversExecute(Sender: TObject);
begin
  {frmENTraversFilterEdit:=TfrmENTraversFilterEdit.Create(Application, dsInsert);
  try
    ENTraversFilterObj := ENTraversFilter.Create;
    SetNullIntProps(ENTraversFilterObj);
    SetNullXSProps(ENTraversFilterObj);

    if frmENTraversFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTraversFilter.Create;
      FilterObject := ENTraversFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTraversFilterEdit.Free;
    frmENTraversFilterEdit:=nil;
  end;}
end;

procedure TfrmENLine10Edit.actNoFilterTraversExecute(Sender: TObject);
begin
  {trFilterObject.Free;
  trFilterObject := nil;
  UpdateGridTravers(Sender, sgENPost.Cells[0, sgENPost.Row]);}
end;

//Крюки
procedure TfrmENLine10Edit.actViewHookExecute(Sender: TObject);
Var TempENHook: ENHookControllerSoapPort;
begin
  if sgENHook.Cells[0, sgENHook.Row] = '' then
    Exit;
  TempENHook := HTTPRIOENHook as ENHookControllerSoapPort;
  try
    ENHookObj := TempENHook.getObject(
      StrToInt(sgENHook.Cells[0, sgENHook.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENHookEdit := TfrmENHookEdit.Create(Application, dsView);
  try
    frmENHookEdit.ShowModal;
  finally
    frmENHookEdit.Free;
    frmENHookEdit := nil;
  end;
end;

procedure TfrmENLine10Edit.actInsertHookExecute(Sender: TObject);
begin
  if sgENPost.Cells[0, sgENPost.Row] = '' then
    Exit;
  ENHookObj := ENHook.Create;
  if ENHookObj.postRef = nil then
    ENHookObj.postRef := ENPostRef.Create;
  ENHookObj.postRef.code := StrToInt(sgENPost.Cells[0, sgENPost.Row]);
  try
    frmENHookEdit:=TfrmENHookEdit.Create(Application, dsInsert);
    try
      if frmENHookEdit.ShowModal = mrOk then
        begin
          if ENHookObj <> nil then
            UpdateGridHook(Sender, sgENPost.Cells[0, sgENPost.Row]);
        end;
    finally
      frmENHookEdit.Free;
      frmENHookEdit := nil;
    end;
  finally
    ENHookObj.Free;
  end;
end;

procedure TfrmENLine10Edit.actDeleteHookExecute(Sender: TObject);
Var TempENHook: ENHookControllerSoapPort; ObjCode: Integer;
begin
  if sgENHook.Cells[0, sgENHook.Row] = '' then
    Exit;
  TempENHook := HTTPRIOENHook as ENHookControllerSoapPort;
  try
    ObjCode := StrToInt(sgENHook.Cells[0, sgENHook.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(
    PChar('Вы действительно хотите удалить стойку опоры?'), PChar('Внимание!'),
    MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK
  then
    begin
      TempENHook.remove(ObjCode);
      UpdateGridHook(Sender, sgENPost.Cells[0, sgENPost.Row]);
    end;
end;

procedure TfrmENLine10Edit.actEditHookExecute(Sender: TObject);
Var TempENHook: ENHookControllerSoapPort;
begin
  if sgENHook.Cells[0, sgENHook.Row] = '' then
    Exit;
  TempENHook := HTTPRIOENHook as ENHookControllerSoapPort;
  try
    ENHookObj := TempENHook.getObject(
      StrToInt(sgENHook.Cells[0, sgENHook.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENHookEdit := TfrmENHookEdit.Create(Application, dsEdit);
  try
    if frmENHookEdit.ShowModal= mrOk then
      UpdateGridHook(Sender, sgENPost.Cells[0, sgENPost.Row]);
  finally
    frmENHookEdit.Free;
    frmENHookEdit := nil;
  end;
end;

procedure TfrmENLine10Edit.actUpdateHookExecute(Sender: TObject);
begin
  UpdateGridHook(Sender, sgENPost.Cells[0, sgENPost.Row]);
end;

procedure TfrmENLine10Edit.actFilterHookExecute(Sender: TObject);
begin
  {frmENHookFilterEdit:=TfrmENHookFilterEdit.Create(Application, dsInsert);
  try
    ENHookFilterObj := ENHookFilter.Create;
    SetNullIntProps(ENHookFilterObj);
    SetNullXSProps(ENHookFilterObj);

    if frmENHookFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENHookFilter.Create;
      FilterObject := ENHookFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENHookFilterEdit.Free;
    frmENHookFilterEdit:=nil;
  end;}
end;

procedure TfrmENLine10Edit.actNoFilterHookExecute(Sender: TObject);
begin
  {hkFilterObject.Free;
  hkFilterObject := nil;
  UpdateGridHook(Sender, sgENPost.Cells[0, sgENPost.Row]);}
end;

procedure TfrmENLine10Edit.pcPostEquipmentChange(Sender: TObject);
begin
  if TAdvStringGrid(sgENPost).Cells[0, sgENPost.Row] = '' then
    Exit;
  if pcPostEquipment.ActivePage = tsInsulator then
    UpdateGridInsulator(Sender, sgENPost.Cells[0, sgENPost.Row])     //Обновление списка Изоляторов на Опоре
  else if pcPostEquipment.ActivePage = tsDisconnector then
    UpdateGridDisconnector(Sender, sgENPost.Cells[0, sgENPost.Row]); //Обновление списка Разъединителей на Опоре
end;


procedure TfrmENLine10Edit.pmInspectionSheetPopup(Sender: TObject);
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



procedure TfrmENLine10Edit.actSelectPostExecute(Sender: TObject);
var TempENPost: ENPostControllerSoapPort;
  ENPostFilterObj: ENPostFilter;
  TempENCabelOut10Item: ENCabelOut10ItemControllerSoapPort;
  ENCabelOut10ItemObj: ENCabelOut10Item;
  TempENAirCrossingItem: ENAirCrossingItemControllerSoapPort;
  ENAirCrossingItemObj: ENAirCrossingItem;
begin
  if pcLine10.ActivePage = tsCabelOut10 then //Указание Опор, между которыми
    begin //проложена Кабельная вставка / от которых осуществлён Кабельный выход
      if TAdvStringGrid(sgENCabelOut10).Cells[0, sgENCabelOut10.Row] = '' then
        Exit;
      TempENCabelOut10Item :=
        HTTPRIOENCabelOut10Item as ENCabelOut10ItemControllerSoapPort;
      ENCabelOut10ItemObj := ENCabelOut10Item.Create;
      try
        ENCabelOut10ItemObj.cabelOut10Ref := ENCabelOut10Ref.Create;
        try
        ENCabelOut10ItemObj.cabelOut10Ref.code := StrToInt(
          TAdvStringGrid(sgENCabelOut10).Cells[0, sgENCabelOut10.Row]);
        except
          on EConvertError do Exit;
        end;
        ENCabelOut10ItemObj.post := ENPost.Create;
        TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;
        ENPostFilterObj := ENPostFilter.Create;
        SetNullIntProps(ENPostFilterObj);
        SetNullXSProps(ENPostFilterObj);
        ENPostFilterObj.conditionSQL := 'ENPOST.LINE10REFCODE = '
          + IntToStr(ENLine10Obj.code);
        frmENPostShow :=
          TfrmENPostShow.Create(Application, fmFiltered, ENPostFilterObj);
        try
          with frmENPostShow do
            begin
              //actView.Enabled := False;
              actInsert.Enabled := False;
              actDelete.Enabled := False;
              actEdit.Enabled := False;
              actUpdate.Enabled := False;
              actFilter.Enabled := False;
              actNoFilter.Enabled := False;
              if ShowModal = mrOk then
                if TAdvStringGrid(sgENPost).Cells[0, sgENPost.Row] <> '' then
                  begin
                    ENCabelOut10ItemObj.post.code := StrToInt(
                      TAdvStringGrid(sgENPost).Cells[0, sgENPost.Row]);
                    ENCabelOut10ItemObj.code := low(Integer);
                    TempENCabelOut10Item.add(ENCabelOut10ItemObj);
                    UpdateGridCabelOut10Item(Sender, TAdvStringGrid(
                      sgENCabelOut10).Cells[0, sgENCabelOut10.Row]);
                  end;
            end;
        finally
          frmENPostShow.Free;
        end;
      finally
        ENCabelOut10ItemObj.Free;
        ENCabelOut10ItemObj := nil;
      end;
    end //if pcLine10.ActivePage = tsCabelOut10 then
  else if pcLine10.ActivePage = tsAirCrossing then
    begin //Указание опор, ограничивающих Воздушное пересечение
      if TAdvStringGrid(sgENAirCrossing).Cells[0, sgENAirCrossing.Row] = '' then
        Exit;
      TempENAirCrossingItem :=
        HTTPRIOENAirCrossingItem as ENAirCrossingItemControllerSoapPort;
      ENAirCrossingItemObj := ENAirCrossingItem.Create;
      try
        ENAirCrossingItemObj.AirCrossingRef := ENAirCrossingRef.Create;
        try
        ENAirCrossingItemObj.AirCrossingRef.code := StrToInt(
          TAdvStringGrid(sgENAirCrossing).Cells[0, sgENAirCrossing.Row]);
        except
          on EConvertError do Exit;
        end;
        ENAirCrossingItemObj.postRef := ENPostRef.Create;
        TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;
        ENPostFilterObj := ENPostFilter.Create;
        SetNullIntProps(ENPostFilterObj);
        SetNullXSProps(ENPostFilterObj);
        ENPostFilterObj.conditionSQL := 'ENPOST.LINE10REFCODE = '
          + IntToStr(ENLine10Obj.code);
        frmENPostShow :=
          TfrmENPostShow.Create(Application, fmFiltered, ENPostFilterObj);
        try
          with frmENPostShow do
            begin
              //actView.Enabled := False;
              actInsert.Enabled := False;
              actDelete.Enabled := False;
              actEdit.Enabled := False;
              actUpdate.Enabled := False;
              actFilter.Enabled := False;
              actNoFilter.Enabled := False;
              if ShowModal = mrOk then
                if TAdvStringGrid(sgENPost).Cells[0, sgENPost.Row] <> '' then
                  begin
                    ENAirCrossingItemObj.postRef.code := StrToInt(
                      TAdvStringGrid(sgENPost).Cells[0, sgENPost.Row]);
                    ENAirCrossingItemObj.code := low(Integer);
                    TempENAirCrossingItem.add(ENAirCrossingItemObj);
                    UpdateGridAirCrossingItem(Sender, TAdvStringGrid(
                      sgENAirCrossing).Cells[0, sgENAirCrossing.Row]);
                  end;
            end;
        finally
          frmENPostShow.Free;
        end;
      finally
        ENAirCrossingItemObj.Free;
        ENAirCrossingItemObj := nil;
      end;
    end; //if pcLine10.ActivePage = tsAirCrossing then
end;


procedure TfrmENLine10Edit.actSendToSigningExecute(Sender: TObject);
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
  if Application.MessageBox(PChar('Ви дійсно бажаєте перевести лист огляду на підпис?'),
                  PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENInspectionSheet.sendToSigning(sheetCode);
    pcLine10Change(Sender);
  end;
end;


procedure TfrmENLine10Edit.actSignedExecute(Sender: TObject);
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
  if Application.MessageBox(PChar('Ви дійсно бажаєте підписати лист огляду?'),
                  PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENInspectionSheet.signed(sheetCode);
    pcLine10Change(Sender);
  end;
end;

procedure TfrmENLine10Edit.actChangeDisconnectorExecute(Sender: TObject);
begin
  ShowMessage('Замена разъединителя');
end;

procedure TfrmENLine10Edit.actUninstallDisconnectorExecute(
  Sender: TObject);
begin
  ShowMessage('Снятие разъединителя');
end;

procedure TfrmENLine10Edit.actInstallDisconnectorExecute(Sender: TObject);
begin
  ShowMessage('Установика разъединителя');
end;

procedure TfrmENLine10Edit.actChangeInsulatorExecute(Sender: TObject);
begin
  ShowMessage('Замена изолятора');
end;


procedure TfrmENLine10Edit.actCopySheetExecute(Sender: TObject);
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

  if Application.MessageBox(PChar('Ви дійсно бажаєте копіювати (Лист огляду об`єкта енергетики) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    newSheetCode := TempENInspectionSheet.copySheet(objCode);
    Application.MessageBox(PChar('Лист огляду скопійовано! Код = ' + IntToStr(newSheetCode)), PChar('Повідомлення'), MB_ICONINFORMATION);

    pcLine10Change(Sender);
  end;
end;


procedure TfrmENLine10Edit.actUninstallInsulatorExecute(Sender: TObject);
begin
  ShowMessage('Снятие изолятора');
end;

procedure TfrmENLine10Edit.actInstallInsulatorExecute(Sender: TObject);
begin
  ShowMessage('Установка изолятора');
end;


procedure TfrmENLine10Edit.actLoadAttachmentExecute(Sender: TObject);
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


procedure TfrmENLine10Edit.actAddAttachmentExecute(Sender: TObject);
begin
  ENDocAttachmentObj := ENDocAttachment.Create;
  try
    frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
    frmDFDocAttachmentEdit.elementCode := ENLine10Obj.element.code;
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

procedure TfrmENLine10Edit.actDeleteAttachmentExecute(Sender: TObject);
var
  TempENDocAttachment : ENDocAttachmentControllerSoapPort;
  ObjCode : Integer;
begin
  try
    ObjCode := StrToInt(sgENDocAttachment.Cells[0, sgENDocAttachment.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити вкладення ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENDocAttachment := HTTPRIOENDocAttachment as ENDocAttachmentControllerSoapPort;
    TempENDocAttachment.remove(ObjCode);
    updateAttachments;
  end;
end;


procedure TfrmENLine10Edit.actUpdateAttachmentsExecute(Sender: TObject);
begin
  updateAttachments;
end;


procedure TfrmENLine10Edit.updateAttachments;
var
  TempENDocAttachment: ENDocAttachmentControllerSoapPort;
  ENDocAttachmentList: ENDocAttachmentShortList;
  docAttachmentFilter: ENDocAttachmentFilter;
  i, attachmentsCount: Integer;
begin
  ClearGrid(sgENDocAttachment);

  if DialogState = dsInsert then Exit;
  if ENLine10Obj = nil then Exit;
  if ENLine10Obj.element = nil then Exit;
  if ENLine10Obj.element.code = LOW_INT then Exit;

  TempENDocAttachment := HTTPRIOENDocAttachment as ENDocAttachmentControllerSoapPort;

  docAttachmentFilter := ENDocAttachmentFilter.Create;
  SetNullIntProps(docAttachmentFilter);
  SetNullXSProps(docAttachmentFilter);

  docAttachmentFilter.status := ENDocAttachmentStatusRef.Create;
  docAttachmentFilter.status.code := ENDOCATTACHMENTSTATUS_ACTIVE;

  docAttachmentFilter.conditionSQL := ' code in (select endocattachment2enlmnt.docattachmentrefcode '+
    ' from endocattachment2enlmnt where endocattachment2enlmnt.elementrefcode = ' + IntToStr(ENLine10Obj.element.code) + ')';

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

procedure TfrmENLine10Edit.actViewInspectionSheetExecute(Sender: TObject);
var
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  inherited;
  if pcLine10.ActivePage = tsENInspectionSheet then
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
        pcLine10Change(Sender);
      end;
    finally
      frmENInspectionSheetEdit.Free;
      frmENInspectionSheetEdit:=nil;
    end;
  end;
end;


procedure TfrmENLine10Edit.actViewInsulatorExecute(Sender: TObject);
var TempENInsulator: ENInsulatorControllerSoapPort;
begin //Просмотр Изолятора
  TempENInsulator := HTTPRIOENInsulator as ENInsulatorControllerSoapPort;
  try
    ENInsulatorObj := TempENInsulator.getObject(StrToInt(
      sgENInsulator.Cells[0, sgENInsulator.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENInsulatorEdit := TfrmENInsulatorEdit.Create(Application, dsView);
  try
    frmENInsulatorEdit.lblENHighVoltageSellName.Visible := False;
    frmENInsulatorEdit.edtENHighVoltageSellName.Visible := False;
    frmENInsulatorEdit.spbENHighVoltageSell.Visible := False;
    frmENInsulatorEdit.ShowModal;
  finally
    frmENInsulatorEdit.Free;
    frmENInsulatorEdit := nil;
  end;
end;

procedure TfrmENLine10Edit.actViewP4OExecute(Sender: TObject);
var
  TempENPost10OKSN: ENPost10OKSNControllerSoapPort;
begin
  TempENPost10OKSN := HTTPRIOENPost10OKSN as ENPost10OKSNControllerSoapPort;
  try
    ENPost10OKSNObj := TempENPost10OKSN.getObject(StrToInt(sgENPost10OKSN.Cells[0,sgENPost10OKSN.Row]));
  except
    on EConvertError do Exit;
  end;

  selectedPost4OKSNRow := sgENPost10OKSN.Row;
  frmENPost10OKSNEdit:=TfrmENPost10OKSNEdit.Create(Application, dsView);

  try
    frmENPost10OKSNEdit.ShowModal;
  finally
    frmENPost10OKSNEdit.Free;
    frmENPost10OKSNEdit:=nil;
  end;

end;


procedure TfrmENLine10Edit.actInsertInsulatorExecute(Sender: TObject);
var
  TempENInsulator: ENInsulatorControllerSoapPort;
  TempENPost: ENPostControllerSoapPort; //Опоры
  postObj: ENPost;
  postObjCode: Integer;
begin //Добавление Изолятора с обязательным указанием ВЛ 6 - 10 кВ и Опоры
  TempENInsulator := HTTPRIOENInsulator as ENInsulatorControllerSoapPort;
  TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;

  try
    postObjCode := StrToInt(TAdvStringGrid(sgENPost).Cells[0, sgENPost.Row]);
    postObj := TempENPost.getObject(postObjCode);
  except
    on EConvertError do Exit;
  end;

  ENInsulatorObj := ENInsulator.Create;
  SetNullIntProps(ENInsulatorObj);
  SetNullXSProps(ENInsulatorObj);
  ENInsulatorObj.element := ENElement.Create;
  ENInsulatorObj.element.elementInRef := ENElementRef.Create;
  ENInsulatorObj.element.renRef := EPRenRef.Create;

  try
    ENInsulatorObj.element.elementInRef.code := postObj.element.code;
    ENInsulatorObj.element.renRef.code := postObj.element.renRef.code;
  finally
    postObj.Free;
    postObj := nil;
  end;

  try
    frmENInsulatorEdit :=
      TfrmENInsulatorEdit.Create(Application, dsInsert);

    (*frmENInsulatorEdit.edtENInsulatorTypeName.Text := 'Не визначений';
    if ENInsulatorObj.InsulatorType = nil then
      ENInsulatorObj.InsulatorType := ENInsulatorType.Create();
    ENInsulatorObj.InsulatorType.code := 500000000;*)

    frmENInsulatorEdit.edtDispName.Text := 'Ізолятор';
    frmENInsulatorEdit.spbENHighVoltageSell.Enabled := False;
    //frmENInsulatorEdit.edtENHighVoltageSellName.Text := 'Відсутня';
    frmENInsulatorEdit.edtENHighVoltageSellName.Visible := False;
    frmENInsulatorEdit.lblENHighVoltageSellName.Visible := False;
    frmENInsulatorEdit.spbENHighVoltageSell.Visible := False;
    frmENInsulatorEdit.lblENInsulatorTypeName.Visible := True;
    frmENInsulatorEdit.edtENInsulatorTypeName.Visible := True;
    frmENInsulatorEdit.spbENInsulatorType.Visible := True;

    if ENInsulatorObj.highvoltageSell <> nil then
      begin
        ENInsulatorObj.highvoltageSell.Free;
        ENInsulatorObj.highvoltageSell := nil;
      end;

    if ENInsulatorObj.line10Ref = nil then
      ENInsulatorObj.line10Ref := ENLine10Ref.Create;
    ENInsulatorObj.line10Ref.code := ENLine10Obj.code;

    if ENInsulatorObj.postRef = nil then
      ENInsulatorObj.postRef := ENPostRef.Create;
    ENInsulatorObj.postRef.code := postObjCode;

    try
      if frmENInsulatorEdit.ShowModal = mrOk then
        if ENInsulatorObj <> nil then
          UpdateGridInsulator(Sender, sgENPost.Cells[0, sgENPost.Row]);
    finally
      frmENInsulatorEdit.Free;
      frmENInsulatorEdit := nil;
    end;
  finally
    ENInsulatorObj.Free;
  end;

end;

procedure TfrmENLine10Edit.actInsertP4OExecute(Sender: TObject);
begin
  ENPost10OKSNObj:=ENPost10OKSN.Create;
  SetNullIntProps(ENPost10OKSNObj);
  SetNullXSProps(ENPost10OKSNObj);
  ENPost10OKSNObj.line10Ref := ENLine10Ref.Create;
  ENPost10OKSNObj.line10Ref.code := ENLine10Obj.code;

  try
    frmENPost10OKSNEdit:=TfrmENPost10OKSNEdit.Create(Application, dsInsert);
    frmENPost10OKSNEdit.chbCopy.Visible := True;
    try
      if frmENPost10OKSNEdit.ShowModal = mrOk then
      begin
        if ENPost10OKSNObj<>nil then
        updateP4O;
      end;
    finally
      frmENPost10OKSNEdit.Free;
      frmENPost10OKSNEdit:=nil;
    end;
  finally
    ENPost10OKSNObj.Free;
  end;
end;

procedure TfrmENLine10Edit.updateP4O;
  var
  TempENPost10OKSN: ENPost10OKSNControllerSoapPort;
  i: Integer;
  ENPost10OKSNList: ENPost10OKSNShortList;
  ENPost10OKSNFil: ENPost10OKSNFilter;
begin

  ClearGrid(sgENPost10OKSN);

  SetGridHeaders(ENPost10OKSNHeaders, sgENPost10OKSN.ColumnHeaders);
  TempENPost10OKSN :=  HTTPRIOENPost10OKSN as ENPost10OKSNControllerSoapPort;

  ENPost10OKSNFil := ENPost10OKSNFilter.Create;
  SetNullIntProps(ENPost10OKSNFil);
  SetNullXSProps(ENPost10OKSNFil);
  ENPost10OKSNFil.line10Ref := ENLine10Ref.Create;
  ENPost10OKSNFil.line10Ref.code := ENLine10Obj.code;

  ENPost10OKSNList := TempENPost10OKSN.getScrollableFilteredList(ENPost10OKSNFil,0,-1);
  LastCountP4O:=High(ENPost10OKSNList.list);

  if LastCountP4O > -1 then
     sgENPost10OKSN.RowCount:=LastCountP4O+2
  else
     sgENPost10OKSN.RowCount:=2;

   with sgENPost10OKSN do
    for i:=0 to LastCountP4O do
      begin
        Application.ProcessMessages;
        if ENPost10OKSNList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPost10OKSNList.list[i].code)
        else
        Cells[0,i+1] := '';

        AddCheckBox(1,i+1,false, false);

        Cells[1,i+1] := ENPost10OKSNList.list[i].postNumber;
        if ENPost10OKSNList.list[i].numberOfCables = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(ENPost10OKSNList.list[i].numberOfCables);

        Cells[3,i+1] := ENPost10OKSNList.list[i].postTtypeName;
        Cells[4,i+1] := ENPost10OKSNList.list[i].branchLineName;

        LastRowP4O:=i+1;
        sgENPost10OKSN.RowCount:=LastRowP4O+1;
      end;

    ColCountP4O:=ColCountP4O+1;
    sgENPost10OKSN.Row:=1;

end;


procedure TfrmENLine10Edit.actDeleteInsulatorExecute(Sender: TObject);
var TempENInsulator: ENInsulatorControllerSoapPort; ObjCode: Integer;
begin //Удаление Изолятора
  TempENInsulator :=
    HTTPRIOENInsulator as ENInsulatorControllerSoapPort;
  try
    ObjCode := StrToInt(sgENInsulator.Cells[0, sgENInsulator.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(
    PChar('Вы действительно хотите удалить изолятор?'),
    PChar('Внимание!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
      begin
        TempENInsulator.remove(ObjCode);
        UpdateGridInsulator(Sender, sgENPost.Cells[0, sgENPost.Row]);
      end;
end;

procedure TfrmENLine10Edit.actDeleteP4OExecute(Sender: TObject);
Var TempENPost10OKSN: ENPost10OKSNControllerSoapPort;
  ObjCode, i: Integer;
  state_: boolean; //isSel : boolean;
begin
 TempENPost10OKSN := HTTPRIOENPost10OKSN as ENPost10OKSNControllerSoapPort;

   if Application.MessageBox(PChar('Вы действительно хотите удалить (Опори для сумісного підвісу ліній 10) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
   begin

       for i:=1 to sgENPost10OKSN.RowCount - 1 do
              begin
                 sgENPost10OKSN.GetCheckBoxState(1,i,state_);
                 if state_ then
                 begin

                    try
                      ObjCode := StrToInt(sgENPost10OKSN.Cells[0, i ]);
                    except
                      on EConvertError do Exit;
                    end;
                    TempENPost10OKSN.remove(ObjCode);
                 end;

              end;
              updateP4O;
  end;
end;

procedure TfrmENLine10Edit.actEditInsulatorExecute(Sender: TObject);
var TempENInsulator: ENInsulatorControllerSoapPort;
begin
  TempENInsulator :=
    HTTPRIOENInsulator as ENInsulatorControllerSoapPort;
  try
    ENInsulatorObj :=
      TempENInsulator.getObject(StrToInt(
        sgENInsulator.Cells[0, sgENInsulator.Row]));
    (*if ENInsulatorObj.highvoltageSell <> nil then
      begin
        ENInsulatorObj.highvoltageSell.Free;
        ENInsulatorObj.highvoltageSell := nil;
      end;*)
  except
    on EConvertError do Exit;
  end;
  frmENInsulatorEdit :=
    TfrmENInsulatorEdit.Create(Application, dsEdit);
  try
    frmENInsulatorEdit.edtENHighVoltageSellName.Visible := False;
    frmENInsulatorEdit.lblENHighVoltageSellName.Visible := False;
    frmENInsulatorEdit.spbENHighVoltageSell.Visible := False;
    frmENInsulatorEdit.lblENInsulatorTypeName.Visible := True;
    frmENInsulatorEdit.edtENInsulatorTypeName.Visible := True;
    frmENInsulatorEdit.spbENInsulatorType.Visible := True;
    if frmENInsulatorEdit.ShowModal = mrOk then
      UpdateGridInsulator(Sender, sgENPost.Cells[0, sgENPost.Row]);
  finally
    frmENInsulatorEdit.Free;
    frmENInsulatorEdit := nil;
  end;

end;

procedure TfrmENLine10Edit.actEditP4OExecute(Sender: TObject);
var
  TempENPost10OKSN: ENPost10OKSNControllerSoapPort;
begin
  TempENPost10OKSN := HTTPRIOENPost10OKSN as ENPost10OKSNControllerSoapPort;
  try
    ENPost10OKSNObj := TempENPost10OKSN.getObject(StrToInt(sgENPost10OKSN.Cells[0,sgENPost10OKSN.Row]));
  except
    on EConvertError do Exit;
  end;

  selectedPost4OKSNRow := sgENPost10OKSN.Row;
  frmENPost10OKSNEdit:=TfrmENPost10OKSNEdit.Create(Application, dsEdit);

  try
    if frmENPost10OKSNEdit.ShowModal= mrOk then
      begin
        updateP4O;
      end;
  finally
    frmENPost10OKSNEdit.Free;
    frmENPost10OKSNEdit:=nil;
  end;

  if sgENPost10OKSN.RowCount > selectedPost4OKSNRow then
    sgENPost10OKSN.Row := selectedPost4OKSNRow
  else
    sgENPost10OKSN.Row := sgENPost10OKSN.RowCount - 1;

end;

procedure TfrmENLine10Edit.actUpdateInsulatorExecute(Sender: TObject);
begin
  UpdateGridInsulator(Sender, sgENPost.Cells[0, sgENPost.Row]);
end;

procedure TfrmENLine10Edit.actUpdateP4OExecute(Sender: TObject);
begin
  updateP4O;
end;

procedure TfrmENLine10Edit.actViewDisconnectorExecute(Sender: TObject);
var TempENDisconnector: ENDisconnectorControllerSOAPPort;
begin //Просмотр Разъединителя
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
    frmENDisconnectorEdit.lblENHighVoltageSellName.Visible := False;
    frmENDisconnectorEdit.edtENHighVoltageSellName.Visible := False;
    frmENDisconnectorEdit.spbENHighVoltageSell.Visible := False;
    frmENDisconnectorEdit.ShowModal;
  finally
    frmENDisconnectorEdit.Free;
    frmENDisconnectorEdit := nil;
  end;

end;

procedure TfrmENLine10Edit.actInsertDisconnectorExecute(Sender: TObject);
var TempENDisconnector: ENDisconnectorControllerSOAPPort;
  TempENPost: ENPostControllerSoapPort; //Опоры
  postObj: ENPost; postObjCode: Integer;
begin//Добавление Разъединителя с обязательным указанием ВЛ 6 - 10 кВ и Опоры
  TempENDisconnector := HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;
  TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;

  try
    postObjCode := StrToInt(TAdvStringGrid(sgENPost).Cells[0, sgENPost.Row]);
    postObj := TempENPost.getObject(postObjCode);
  except
    on EConvertError do Exit;
  end;

  ENDisconnectorObj := ENDisconnector.Create;
  SetNullIntProps(ENDisconnectorObj);
  SetNullXSProps(ENDisconnectorObj);

  ENDisconnectorObj.element := ENElement.Create;
  ENDisconnectorObj.element.elementInRef := ENElementRef.Create;

  try
    ENDisconnectorObj.element.elementInRef.code := postObj.element.code;
    ENDisconnectorObj.element.renRef := EPRenRef.Create;
    ENDisconnectorObj.element.renRef.code := postObj.element.renRef.code;
  finally
    postObj.Free;
    postObj := nil;
  end;

  try
    frmENDisconnectorEdit :=
      TfrmENDisconnectorEdit.Create(Application, dsInsert);

    (*frmENDisconnectorEdit.edtENDisconnectorTypeName.Text := 'Не визначений';
    if ENDisconnectorObj.disconnectorType = nil then
      ENDisconnectorObj.disconnectorType := ENDisconnectorType.Create();
    ENDisconnectorObj.disconnectorType.code := 500000000;

    frmENDisconnectorEdit.edtENDisconnectorDriveTypeName.Text := 'Не визначений';
    if ENDisconnectorObj.disconnectordriveType = nil then
      ENDisconnectorObj.disconnectordriveType :=
        ENDisconnectorDriveType.Create();
    ENDisconnectorObj.disconnectordriveType.code := 500000000;*)

    frmENDisconnectorEdit.lblENHighVoltageSellName.Visible := False;
    frmENDisconnectorEdit.edtENHighVoltageSellName.Visible := False;
    frmENDisconnectorEdit.spbENHighVoltageSell.Visible := False;

    if ENDisconnectorObj.highvoltageSell <> nil then
      begin
        ENDisconnectorObj.highvoltageSell.Free;
        ENDisconnectorObj.highvoltageSell := nil;
      end;
    if ENDisconnectorObj.line10Ref = nil then
      begin
        ENDisconnectorObj.line10Ref := ENLine10Ref.Create;
        ENDisconnectorObj.line10Ref.code := ENLine10Obj.code;
      end;
    if ENDisconnectorObj.postRef = nil then
      begin
        ENDisconnectorObj.postRef := ENPostRef.Create;
        ENDisconnectorObj.postRef.code := postObjCode;
      end;

    try
      if frmENDisconnectorEdit.ShowModal = mrOk then
        if ENDisconnectorObj <> nil then
          UpdateGridDisconnector(Sender, sgENPost.Cells[0, sgENPost.Row]);
    finally
      frmENDisconnectorEdit.Free;
      frmENDisconnectorEdit := nil;
    end;
  finally
    ENDisconnectorObj.Free;
  end;
end;

procedure TfrmENLine10Edit.actDeleteDisconnectorExecute(Sender: TObject);
var TempENDisconnector: ENDisconnectorControllerSOAPPort; ObjCode: Integer;
begin //Удаление Разъединителя
  TempENDisconnector :=
    HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;
  try
    ObjCode := StrToInt(sgENDisconnector.Cells[0, sgENDisconnector.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(
    PChar('Вы действительно хотите удалить разъединитель?'),
    PChar('Внимание!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
      begin
        TempENDisconnector.remove(ObjCode);
        UpdateGridDisconnector(Sender, sgENPost.Cells[0, sgENPost.Row]);
      end;
end;

procedure TfrmENLine10Edit.actEditDisconnectorExecute(Sender: TObject);
var TempENDisconnector: ENDisconnectorControllerSOAPPort;
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
    frmENDisconnectorEdit.lblENHighVoltageSellName.Visible := False;
    frmENDisconnectorEdit.edtENHighVoltageSellName.Visible := False;
    frmENDisconnectorEdit.spbENHighVoltageSell.Visible := False;
    if frmENDisconnectorEdit.ShowModal = mrOk then
      UpdateGridDisconnector(Sender, sgENPost.Cells[0, sgENPost.Row]);
  finally
    frmENDisconnectorEdit.Free;
    frmENDisconnectorEdit := nil;
  end;

end;

procedure TfrmENLine10Edit.actUpdateDisconnectorExecute(Sender: TObject);
begin
  UpdateGridDisconnector(Sender, sgENPost.Cells[0, sgENPost.Row]);
end;

procedure TfrmENLine10Edit.sgENBranch10RowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  if TAdvStringGrid(Sender).Cells[0, NewRow] = '' then
    Exit;
  //Обновление списка Опор Ответвления ВЛ
  UpdateGridBranch10Item(Sender, TAdvStringGrid(Sender).Cells[0, NewRow]);
  sgENBranch10Item.Update;
  sgENBranch10Item.OnRowChanging(
    TObject(sgENBranch10Item), 0, sgENBranch10Item.Row, Allow);
end;

procedure TfrmENLine10Edit.actViewBranch10PostExecute(Sender: TObject);
var TempENBranch10Post: ENPostControllerSoapPort;
  //ENBranch10PostList: ENPostShortList;
begin //Просмотр Опоры Ответвления ВЛ 6 - 10 кВ
  if sgENBranch10Item.Cells[9, sgENBranch10Item.Row] = '' then
    Exit;
  TempENBranch10Post := HTTPRIOENPost as ENPostControllerSoapPort;
  try
    ENPostObj := TempENBranch10Post.getObject(
      StrToInt(sgENBranch10Item.Cells[9, sgENBranch10Item.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENPostEdit := TfrmENPostEdit.Create(Application, dsView);
  try
    frmENPostEdit.ShowModal;
  finally
    frmENPostEdit.Free;
    frmENPostEdit := nil;
  end;

end;


procedure TfrmENLine10Edit.actInsertBranch10PostExecute(Sender: TObject);
begin //Добавление Опоры Ответвления ВЛ 6 - 10 кВ
  if TAdvStringGrid(sgENBranch10).Cells[0, sgENBranch10.Row] = '' then
    Exit;
  ENBranch10ItemObj := ENBranch10Item.Create;
  ENBranch10ItemObj.branch10Ref := ENBranch10Ref.Create;
  ENBranch10ItemObj.branch10Ref.code := StrToInt(
    TAdvStringGrid(sgENBranch10).Cells[0, sgENBranch10.Row]);
  try
    frmENBranch10ItemEdit :=
      TfrmENBranch10ItemEdit.Create(Application, dsInsert);
    try
      if frmENBranch10ItemEdit.ShowModal = mrOk then
        begin
          if ENBranch10ItemObj <> nil then
            UpdateGridBranch10Item(Sender,
              TAdvStringGrid(sgENBranch10).Cells[0, sgENBranch10.Row]);
        end;
    finally
      frmENBranch10ItemEdit.Free;
      frmENBranch10ItemEdit := nil;
    end;
  finally
    ENBranch10ItemObj.Free;
  end;
end;

procedure TfrmENLine10Edit.actDeleteBranch10PostExecute(Sender: TObject);
var TempENBranch10Item: ENBranch10ItemControllerSoapPort;
  ObjCode: Integer;
  ENBranch10ItemObj: ENBranch10Item;
begin
  if sgENBranch10Item.Cells[0, sgENBranch10Item.Row] = '' then
    Exit;
  TempENBranch10Item :=
    HTTPRIOENBranch10Item as ENBranch10ItemControllerSoapPort;
  try
    ObjCode := StrToInt(sgENBranch10Item.Cells[0, sgENBranch10Item.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar(
      'Вы действительно хотите удалить Опору Ответвления от ВЛ 6 - 10 кВ?'),
    PChar('Внимание !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK
  then
    begin
      ENBranch10ItemObj := TempENBranch10Item.getObject(ObjCode);
      TempENBranch10Item.remove(ObjCode);
      UpdateGridBranch10Item(Sender,
        TAdvStringGrid(sgENBranch10).Cells[0, sgENBranch10.Row]);
    end;
end;

procedure TfrmENLine10Edit.actEditBranch10PostExecute(Sender: TObject);
Var TempENBranch10Item: ENBranch10ItemControllerSoapPort;
begin
  if sgENBranch10Item.Cells[0, sgENBranch10Item.Row] = '' then
    Exit;
  TempENBranch10Item :=
    HTTPRIOENBranch10Item as ENBranch10ItemControllerSoapPort;
  try
    ENBranch10ItemObj := TempENBranch10Item.getObject(
      StrToInt(sgENBranch10Item.Cells[0, sgENBranch10Item.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENBranch10ItemEdit := TfrmENBranch10ItemEdit.Create(Application, dsEdit);
  try
    if frmENBranch10ItemEdit.ShowModal = mrOk then
      UpdateGridBranch10Item(Sender,
        TAdvStringGrid(sgENBranch10).Cells[0, sgENBranch10.Row]);
  finally
    frmENBranch10ItemEdit.Free;
    frmENBranch10ItemEdit := nil;
  end;
end;

procedure TfrmENLine10Edit.actUpdateBranch10PostExecute(Sender: TObject);
begin
  UpdateGridBranch10Item(Sender,
    TAdvStringGrid(sgENBranch10).Cells[0, sgENBranch10.Row]);
end;

procedure TfrmENLine10Edit.sgENBranch10ItemRowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
begin
  if TAdvStringGrid(Sender).Cells[0, NewRow] = '' then
    Exit;
  if pcBranch10PostEquipment.ActivePage = tsBranch10Stand then
    UpdateGridBranch10Stand(Sender, sgENBranch10Item.Cells[9, NewRow])         //Стойки опоры ответвления ВЛ 6 - 10 кВ
  else if pcBranch10PostEquipment.ActivePage = tsBranch10Travers then
    UpdateGridBranch10Travers(Sender, sgENBranch10Item.Cells[9, NewRow])       //Траверсы опоры ответвления ВЛ 6 - 10 кВ
  else if pcBranch10PostEquipment.ActivePage = tsBranch10Hook then
    UpdateGridBranch10Hook(Sender, sgENBranch10Item.Cells[9, NewRow])          //Крюки опоры ответвления ВЛ 6 - 10 кВ
  else if pcBranch10PostEquipment.ActivePage = tsBranch10Insulator then
    UpdateGridBranch10Insulator(Sender, sgENBranch10Item.Cells[9, NewRow])     //Изоляторы ответвления ВЛ 6 - 10 кВ
  else if pcBranch10PostEquipment.ActivePage = tsBranch10Disconnector then
    UpdateGridBranch10Disconnector(Sender, sgENBranch10Item.Cells[9, NewRow]); //Разъединители ответвления ВЛ 6 - 10 кВ
end;


//Обновление списков составляющих опор ответвления ВЛ 6 - 10 кВ
procedure TfrmENLine10Edit.UpdateGridBranch10Stand(Sender: TObject; strCode: String);
Var i, j: Integer; //Allow: Boolean;
  TempENStand: ENStandControllerSoapPort;
  ENStandList: ENStandShortList;
begin
  ClearGrid(sgENBranch10Stand);
  if stFilterObject = nil then Exit;

  stColCount := 100;
  TempENStand := HTTPRIOENStand as ENStandControllerSoapPort;

  ENStandList := TempENStand.getScrollableFilteredList(ENStandFilter(stFilterObject), 0, stColCount);
  stLastCount := High(ENStandList.list);

  if stLastCount > -1 then
    sgENBranch10Stand.RowCount := stLastCount + 2
  else
    sgENBranch10Stand.RowCount := 2;

  with sgENBranch10Stand do
    for i := 0 to stLastCount do
      begin
        Application.ProcessMessages;
        if ENStandList.list[i].code <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(ENStandList.list[i].code)
        else
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENStandList.list[i].materialTypeName;
        Cells[2, i + 1] := ENStandList.list[i].materialRefName;
        Cells[3, i + 1] := ENStandList.list[i].name;
        stLastRow := i + 1;
        sgENBranch10Stand.RowCount := stLastRow + 1;
      end;
  stColCount := stColCount + 1;
  sgENBranch10Stand.Row := 1;

end;

procedure TfrmENLine10Edit.UpdateGridBranch10Travers(Sender: TObject; strCode: String);
Var i, j: Integer; //Allow: Boolean;
  TempENTravers: ENTraversControllerSoapPort;
  ENTraversList: ENTraversShortList;
begin
  ClearGrid(sgENBranch10Travers);
  SetGridHeaders(ENTraversHeaders, sgENBranch10Travers.ColumnHeaders);

  if strCode = '' then Exit;

  trColCount := 100;
  TempENTravers := HTTPRIOENTravers as ENTraversControllerSoapPort;

  if trFilterObject = nil then
    begin
       trFilterObject := ENTraversFilter.Create;
       SetNullIntProps(trFilterObject);
       SetNullXSProps(trFilterObject);
    end;

  trFilterObject.conditionSQL := 'ENTRAVERS.POSTREFCODE = ' + strCode;

    //TAdvStringGrid(sgENBranch10Item).Cells[9, sgENBranch10Item.Row];
  ENTraversList := TempENTravers.getScrollableFilteredList(ENTraversFilter(trFilterObject), 0, trColCount);
  trLastCount := High(ENTraversList.list);
  if trLastCount > -1 then
    sgENBranch10Travers.RowCount := trLastCount + 2
  else
    sgENBranch10Travers.RowCount := 2;

  with sgENBranch10Travers do
    for i := 0 to trLastCount do
      begin
        Application.ProcessMessages;
        if ENTraversList.list[i].code <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(ENTraversList.list[i].code)
        else
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENTraversList.list[i].traversTypeName;
        Cells[2, i + 1] := ENTraversList.list[i].materialRefName;
        Cells[3, i + 1] := ENTraversList.list[i].name;
        trLastRow := i + 1;
        sgENBranch10Travers.RowCount := trLastRow + 1;
      end;
  trColCount := trColCount + 1;
  sgENBranch10Travers.Row := 1;
end;

procedure TfrmENLine10Edit.UpdateGridBranch10Hook(Sender: TObject; strCode: String);
Var i, j: Integer; //Allow: Boolean;
  TempENHook: ENHookControllerSoapPort;
  ENHookList: ENHookShortList;
begin
  for i := 1 to sgENBranch10Hook.RowCount - 1 do
    for j := 0 to sgENBranch10Hook.ColCount - 1 do
      sgENBranch10Hook.Cells[j, i] := '';
  hkColCount := 100;
  TempENHook := HTTPRIOENHook as ENHookControllerSoapPort;
  if hkFilterObject = nil then
    begin
       hkFilterObject := ENHookFilter.Create;
       SetNullIntProps(hkFilterObject);
       SetNullXSProps(hkFilterObject);
    end;
  hkFilterObject.conditionSQL := 'ENHook.POSTREFCODE = ' + strCode;
    //TAdvStringGrid(sgENBranch10Item).Cells[9, sgENBranch10Item.Row];
  ENHookList := TempENHook.getScrollableFilteredList(
    ENHookFilter(hkFilterObject), 0, hkColCount);
  hkLastCount := High(ENHookList.list);
  if hkLastCount > -1 then
    sgENBranch10Hook.RowCount := hkLastCount + 2
  else
    sgENBranch10Hook.RowCount := 2;

  with sgENBranch10Hook do
    for i := 0 to hkLastCount do
      begin
        Application.ProcessMessages;
        if ENHookList.list[i].code <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(ENHookList.list[i].code)
        else
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENHookList.list[i].hookTypeName;
        Cells[2, i + 1] := ENHookList.list[i].materialRefName;
        Cells[3, i + 1] := ENHookList.list[i].name;
        hkLastRow := i + 1;
        sgENBranch10Hook.RowCount := hkLastRow + 1;
      end;
  hkColCount := hkColCount + 1;
  sgENBranch10Hook.Row := 1;
end;

procedure TfrmENLine10Edit.UpdateGridBranch10Insulator(Sender: TObject; strCode: String);
var i, j: Integer; //Allow: Boolean;
  TempENInsulator: ENInsulatorControllerSoapPort;
  ENInsulatorList: ENInsulatorShortList;
begin
  ClearGrid(sgENBranch10Insulator);

  if strCode = '' then Exit;

  //Заполнение списка Изоляторов
  SetGridHeaders(ENInsulatorHeaders, sgENBranch10Insulator.ColumnHeaders);
  insColCount := 100;
  TempENInsulator := HTTPRIOENInsulator as ENInsulatorControllerSoapPort;

  if insFilterObject = nil then
    begin
      insFilterObject := ENInsulatorFilter.Create;
      SetNullIntProps(insFilterObject);
      SetNullXSProps(insFilterObject);
    end;

  insFilterObject.conditionSQL := ' ENINSULATOR.LINE10REFCODE = '
    + IntToSTr(ENLine10Obj.code) + ' AND ENINSULATOR.POSTREFCODE = '
    + strCode;
    //+ TAdvStringGrid(sgENBranch10Item).Cells[9, sgENBranch10Item.Row];

  ENInsulatorList := TempENInsulator.getScrollableFilteredList(
    ENInsulatorFilter(insFilterObject), 0, insColCount);

  insLastCount := High(ENInsulatorList.list);

  if insLastCount > -1 then
     sgENBranch10Insulator.RowCount := insLastCount + 2
  else
     sgENBranch10Insulator.RowCount := 2;

  with sgENBranch10Insulator do
     for i := 0 to insLastCount do
       begin
         Application.ProcessMessages;
         if ENInsulatorList.list[i].code <> Low(Integer) then //Код
           Cells[0, i + 1] := IntToStr(ENInsulatorList.list[i].code)
         else
           Cells[0, i + 1] := '';
         Cells[1, i + 1] := ENInsulatorList.list[i].insulatorTypeName;

         Cells[2, i + 1] := ENInsulatorList.list[i].materialRefName; //Изолятор из Нормативных материалов
         if ENInsulatorList.list[i].voltage = nil then //Напряжение, кВ
           Cells[3, i + 1] := ''
         else
           Cells[3, i + 1] :=
             ENInsulatorList.list[i].voltage.DecimalString;
         insLastRow := i + 1;
         sgENBranch10Insulator.RowCount := insLastRow + 1;
       end;
  insColCount := insColCount + 1;
  sgENBranch10Insulator.Row := 1;
end;

procedure TfrmENLine10Edit.UpdateGridBranch10Disconnector(Sender: TObject; strCode: String);
var i, j: Integer; //Allow: Boolean;
  TempENDisconnector: ENDisconnectorControllerSoapPort;
  ENDisconnectorList: ENDisconnectorShortList;
begin
  ClearGrid(sgENBranch10Disconnector);
  //Заполнение списка Разъединителей
  SetGridHeaders(ENDisconnectorHeaders, sgENBranch10Disconnector.ColumnHeaders);

  if strCode = '' then Exit;

  dColCount := 100;
  TempENDisconnector :=
    HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;

  if dFilterObject = nil then
    begin
      dFilterObject := ENDisconnectorFilter.Create;
      SetNullIntProps(dFilterObject);
      SetNullXSProps(dFilterObject);
    end;

  dFilterObject.conditionSQL := ' ENDISCONNECTOR.LINE10REFCODE = '
    + IntToSTr(ENLine10Obj.code) + ' AND ENDISCONNECTOR.POSTREFCODE = '
    + strCode;
    //+ TAdvStringGrid(sgENBranch10Item).Cells[9, sgENBranch10Item.Row];

  ENDisconnectorList := TempENDisconnector.getScrollableFilteredList(
    ENDisconnectorFilter(dFilterObject), 0, dColCount);

  dLastCount := High(ENDisconnectorList.list);

  if dLastCount > -1 then
     sgENBranch10Disconnector.RowCount := dLastCount + 2
  else
     sgENBranch10Disconnector.RowCount := 2;

   with sgENBranch10Disconnector do
     for i := 0 to dLastCount do
       begin
         Application.ProcessMessages;
         if ENDisconnectorList.list[i].code <> Low(Integer) then
           Cells[0, i + 1] := IntToStr(ENDisconnectorList.list[i].code)
         else //Код Разъединителя
           Cells[0, i + 1] := '';
         Cells[1, i + 1] := ENDisconnectorList.list[i].materialRefName; //Разъединитель из Нормативных материалов
         if ENDisconnectorList.list[i].ratedVoltage = nil then
           Cells[2, i + 1] := '' //Номинальное напряжение, кВ
         else
           Cells[2, i + 1] :=
             ENDisconnectorList.list[i].ratedVoltage.DecimalString;
         if ENDisconnectorList.list[i].ratedCurrent = nil then
           Cells[3, i + 1] := '' //Номинальный ток, А
         else
           Cells[3, i + 1] :=
             ENDisconnectorList.list[i].ratedCurrent.DecimalString;
         Cells[4, i + 1] := ENDisconnectorList.list[i].matDriveRefName; //Привод Разъединителя из Нормативных материалов
         dLastRow := i + 1;
         sgENBranch10Disconnector.RowCount := dLastRow + 1;
       end;
   dColCount := dColCount + 1;
   sgENBranch10Disconnector.Row := 1;
end;

//Стойки опоры ответвления
procedure TfrmENLine10Edit.actViewBranch10StandExecute(Sender: TObject);
Var TempENStand: ENStandControllerSoapPort;
begin
  if sgENBranch10Stand.Cells[0, sgENBranch10Stand.Row] = '' then
    Exit;
  TempENStand := HTTPRIOENStand as ENStandControllerSoapPort;
  try
    ENStandObj := TempENStand.getObject(
      StrToInt(sgENBranch10Stand.Cells[0, sgENBranch10Stand.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENStandEdit := TfrmENStandEdit.Create(Application, dsView);
  try
    frmENStandEdit.ShowModal;
  finally
    frmENStandEdit.Free;
    frmENStandEdit := nil;
  end;
end;


procedure TfrmENLine10Edit.actInsertBranch10StandExecute(Sender: TObject);
var
  Allow: Boolean;
  TempENPost: ENPostControllerSoapPort; //Опоры ответвления ВЛ 6 - 10 кВ
  postObj: ENPost;
  postObjCode: Integer;
begin
  TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;

  try
    postObjCode :=  StrToInt(sgENBranch10Item.Cells[9, sgENBranch10Item.Row]);
    postObj := TempENPost.getObject(postObjCode);
  except
    on EConvertError do Exit;
  end;


  ENStandObj := ENStand.Create;
  ENStandObj.element := ENElement.Create;
  ENStandObj.element.elementInRef := ENElementRef.Create;
  ENStandObj.element.renRef := EPRenRef.Create;

  try
    ENStandObj.element.elementInRef.code := postObj.element.code;
    ENStandObj.element.renRef.code := postObj.element.renRef.code;
  finally
    postObj.Free;
    postObj := nil;
  end;

  if ENStandObj.postRef = nil then
    ENStandObj.postRef := ENPostRef.Create;
  ENStandObj.postRef.code := postObjCode;
  try
    frmENStandEdit:=TfrmENStandEdit.Create(Application, dsInsert);
    try
      if frmENStandEdit.ShowModal = mrOk then
        begin
          if ENStandObj <> nil then
            UpdateGridBranch10Stand(Sender, sgENBranch10Item.Cells[9, sgENBranch10Item.Row]);
        end;
    finally
      frmENStandEdit.Free;
      frmENStandEdit := nil;
    end;
  finally
    ENStandObj.Free;
  end;
  sgENBranch10Item.OnRowChanging(sgENBranch10Item, 0, sgENBranch10Item.Row, Allow);
end;

procedure TfrmENLine10Edit.actDeleteBranch10StandExecute(Sender: TObject);
Var TempENStand: ENStandControllerSoapPort; ObjCode: Integer;
begin
  if sgENBranch10Stand.Cells[0, sgENBranch10Stand.Row] = '' then
    Exit;
  TempENStand := HTTPRIOENStand as ENStandControllerSoapPort;
  try
    ObjCode := StrToInt(sgENBranch10Stand.Cells[0, sgENBranch10Stand.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(
    PChar('Вы действительно хотите удалить стойку опоры?'), PChar('Внимание!'),
    MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK
  then
    begin
      TempENStand.remove(ObjCode);
      UpdateGridBranch10Stand(Sender, sgENBranch10Item.Cells[9, sgENBranch10Item.Row]);
      //sgENBranch10Item.OnRowChanging(sgENBranch10Item, 0, sgENBranch10Item.Row, Allow);
    end;
end;

procedure TfrmENLine10Edit.actEditBranch10StandExecute(Sender: TObject);
Var TempENStand: ENStandControllerSoapPort;
begin
  if sgENBranch10Stand.Cells[0, sgENBranch10Stand.Row] = '' then
    Exit;
  TempENStand := HTTPRIOENStand as ENStandControllerSoapPort;
  try
    ENStandObj := TempENStand.getObject(
      StrToInt(sgENBranch10Stand.Cells[0, sgENBranch10Stand.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENStandEdit := TfrmENStandEdit.Create(Application, dsEdit);
  try
    if frmENStandEdit.ShowModal= mrOk then
      UpdateGridBranch10Stand(Sender, sgENBranch10Item.Cells[9, sgENBranch10Item.Row]);
  finally
    frmENStandEdit.Free;
    frmENStandEdit := nil;
  end;
end;

procedure TfrmENLine10Edit.actUpdateBranch10StandExecute(Sender: TObject);
begin
  UpdateGridBranch10Stand(Sender, sgENBranch10Item.Cells[9, sgENBranch10Item.Row]);
end;

procedure TfrmENLine10Edit.actFilterBranch10StandExecute(Sender: TObject);
begin
  {frmENStandFilterEdit:=TfrmENStandFilterEdit.Create(Application, dsInsert);
  try
    ENStandFilterObj := ENStandFilter.Create;
    SetNullIntProps(ENStandFilterObj);
    SetNullXSProps(ENStandFilterObj);

    if frmENStandFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENStandFilter.Create;
      FilterObject := ENStandFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENStandFilterEdit.Free;
    frmENStandFilterEdit:=nil;
  end;}
end;

procedure TfrmENLine10Edit.actNoFilterBranch10StandExecute(Sender: TObject);
begin
  {stFilterObject.Free;
  stFilterObject := nil;
  UpdateGridBranch10Stand(Sender, sgENBranch10Item.Cells[9, sgENBranch10Item.Row]);}
end;

//Траверсы опоры ответвления
procedure TfrmENLine10Edit.actViewBranch10TraversExecute(Sender: TObject);
Var TempENTravers: ENTraversControllerSoapPort;
begin
  if sgENBranch10Travers.Cells[0, sgENBranch10Travers.Row] = '' then
    Exit;
  TempENTravers := HTTPRIOENTravers as ENTraversControllerSoapPort;
  try
    ENTraversObj := TempENTravers.getObject(
      StrToInt(sgENBranch10Travers.Cells[0, sgENBranch10Travers.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENTraversEdit := TfrmENTraversEdit.Create(Application, dsView);
  try
    frmENTraversEdit.ShowModal;
  finally
    frmENTraversEdit.Free;
    frmENTraversEdit := nil;
  end;
end;


procedure TfrmENLine10Edit.actInsertBranch10TraversExecute(Sender: TObject);
var
  TempENPost: ENPostControllerSoapPort; //Опоры
  postObj: ENPost;
  postObjCode: Integer;
begin
  TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;

  try
    postObjCode := StrToInt(sgENBranch10Item.Cells[9, sgENBranch10Item.Row]);
    postObj := TempENPost.getObject(postObjCode);
  except
    on EConvertError do Exit;
  end;


  ENTraversObj := ENTravers.Create;
  ENTraversObj.element := ENElement.Create;
  ENTraversObj.element.elementInRef := ENElementRef.Create;
  ENTraversObj.element.renRef := EPRenRef.Create;

  try
    ENTraversObj.element.elementInRef.code := postObj.element.code;
    ENTraversObj.element.renRef.code := postObj.element.renRef.code;
  finally
    postObj.Free;
    postObj := nil;
  end;

  if ENTraversObj.postRef = nil then
    ENTraversObj.postRef := ENPostRef.Create;
  ENTraversObj.postRef.code := postObjCode;
  try
    frmENTraversEdit:=TfrmENTraversEdit.Create(Application, dsInsert);
    try
      if frmENTraversEdit.ShowModal = mrOk then
        begin
          if ENTraversObj <> nil then
            UpdateGridBranch10Travers(Sender, sgENBranch10Item.Cells[9, sgENBranch10Item.Row]);
        end;
    finally
      frmENTraversEdit.Free;
      frmENTraversEdit := nil;
    end;
  finally
    ENTraversObj.Free;
  end;
end;

procedure TfrmENLine10Edit.actDeleteBranch10TraversExecute(Sender: TObject);
Var TempENTravers: ENTraversControllerSoapPort; ObjCode: Integer;
begin
  if sgENBranch10Travers.Cells[0, sgENBranch10Travers.Row] = '' then
    Exit;
  TempENTravers := HTTPRIOENTravers as ENTraversControllerSoapPort;
  try
    ObjCode := StrToInt(sgENBranch10Travers.Cells[0, sgENBranch10Travers.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(
    PChar('Вы действительно хотите удалить стойку опоры?'), PChar('Внимание!'),
    MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK
  then
    begin
      TempENTravers.remove(ObjCode);
      UpdateGridBranch10Travers(Sender, sgENBranch10Item.Cells[9, sgENBranch10Item.Row]);
    end;
end;

procedure TfrmENLine10Edit.actEditBranch10TraversExecute(Sender: TObject);
Var TempENTravers: ENTraversControllerSoapPort;
begin
  if sgENBranch10Travers.Cells[0, sgENBranch10Travers.Row] = '' then
    Exit;
  TempENTravers := HTTPRIOENTravers as ENTraversControllerSoapPort;
  try
    ENTraversObj := TempENTravers.getObject(
      StrToInt(sgENBranch10Travers.Cells[0, sgENBranch10Travers.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENTraversEdit := TfrmENTraversEdit.Create(Application, dsEdit);
  try
    if frmENTraversEdit.ShowModal= mrOk then
      UpdateGridBranch10Travers(Sender, sgENBranch10Item.Cells[9, sgENBranch10Item.Row]);
  finally
    frmENTraversEdit.Free;
    frmENTraversEdit := nil;
  end;
end;

procedure TfrmENLine10Edit.actUpdateBranch10TraversExecute(Sender: TObject);
begin
  UpdateGridBranch10Travers(Sender, sgENBranch10Item.Cells[9, sgENBranch10Item.Row]);
end;

procedure TfrmENLine10Edit.actFilterBranch10TraversExecute(Sender: TObject);
begin
  {frmENTraversFilterEdit:=TfrmENTraversFilterEdit.Create(Application, dsInsert);
  try
    ENTraversFilterObj := ENTraversFilter.Create;
    SetNullIntProps(ENTraversFilterObj);
    SetNullXSProps(ENTraversFilterObj);

    if frmENTraversFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTraversFilter.Create;
      FilterObject := ENTraversFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTraversFilterEdit.Free;
    frmENTraversFilterEdit:=nil;
  end;}
end;

procedure TfrmENLine10Edit.actNoFilterBranch10TraversExecute(Sender: TObject);
begin
  {trFilterObject.Free;
  trFilterObject := nil;
  UpdateGridBranch10Travers(Sender, sgENBranch10Item.Cells[9, sgENBranch10Item.Row]);}
end;

//Крюки опоры ответвления
procedure TfrmENLine10Edit.actViewBranch10HookExecute(Sender: TObject);
Var TempENHook: ENHookControllerSoapPort;
begin
  if sgENBranch10Hook.Cells[0, sgENBranch10Hook.Row] = '' then
    Exit;
  TempENHook := HTTPRIOENHook as ENHookControllerSoapPort;
  try
    ENHookObj := TempENHook.getObject(
      StrToInt(sgENBranch10Hook.Cells[0, sgENBranch10Hook.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENHookEdit := TfrmENHookEdit.Create(Application, dsView);
  try
    frmENHookEdit.ShowModal;
  finally
    frmENHookEdit.Free;
    frmENHookEdit := nil;
  end;
end;

procedure TfrmENLine10Edit.actInsertBranch10HookExecute(Sender: TObject);
begin
  if sgENBranch10Item.Cells[9, sgENBranch10Item.Row] = '' then
    Exit;
  ENHookObj := ENHook.Create;
  if ENHookObj.postRef = nil then
    ENHookObj.postRef := ENPostRef.Create;
  ENHookObj.postRef.code := StrToInt(sgENBranch10Item.Cells[9, sgENBranch10Item.Row]);
  try
    frmENHookEdit:=TfrmENHookEdit.Create(Application, dsInsert);
    try
      if frmENHookEdit.ShowModal = mrOk then
        begin
          if ENHookObj <> nil then
            UpdateGridBranch10Hook(Sender, sgENBranch10Item.Cells[9, sgENBranch10Item.Row]);
        end;
    finally
      frmENHookEdit.Free;
      frmENHookEdit := nil;
    end;
  finally
    ENHookObj.Free;
  end;
end;

procedure TfrmENLine10Edit.actDeleteBranch10HookExecute(Sender: TObject);
Var TempENHook: ENHookControllerSoapPort; ObjCode: Integer;
begin
  if sgENBranch10Hook.Cells[0, sgENBranch10Hook.Row] = '' then
    Exit;
  TempENHook := HTTPRIOENHook as ENHookControllerSoapPort;
  try
    ObjCode := StrToInt(sgENBranch10Hook.Cells[0, sgENBranch10Hook.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(
    PChar('Вы действительно хотите удалить стойку опоры?'), PChar('Внимание!'),
    MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK
  then
    begin
      TempENHook.remove(ObjCode);
      UpdateGridBranch10Hook(Sender, sgENBranch10Item.Cells[9, sgENBranch10Item.Row]);
    end;
end;

procedure TfrmENLine10Edit.actEditBranch10HookExecute(Sender: TObject);
Var TempENHook: ENHookControllerSoapPort;
begin
  if sgENBranch10Hook.Cells[0, sgENBranch10Hook.Row] = '' then
    Exit;
  TempENHook := HTTPRIOENHook as ENHookControllerSoapPort;
  try
    ENHookObj := TempENHook.getObject(
      StrToInt(sgENBranch10Hook.Cells[0, sgENBranch10Hook.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENHookEdit := TfrmENHookEdit.Create(Application, dsEdit);
  try
    if frmENHookEdit.ShowModal= mrOk then
      UpdateGridBranch10Hook(Sender, sgENBranch10Item.Cells[9, sgENBranch10Item.Row]);
  finally
    frmENHookEdit.Free;
    frmENHookEdit := nil;
  end;
end;

procedure TfrmENLine10Edit.actUpdateBranch10HookExecute(Sender: TObject);
begin
  UpdateGridBranch10Hook(Sender, sgENBranch10Item.Cells[9, sgENBranch10Item.Row]);
end;

procedure TfrmENLine10Edit.actFilterBranch10HookExecute(Sender: TObject);
begin
  {frmENHookFilterEdit:=TfrmENHookFilterEdit.Create(Application, dsInsert);
  try
    ENHookFilterObj := ENHookFilter.Create;
    SetNullIntProps(ENHookFilterObj);
    SetNullXSProps(ENHookFilterObj);

    if frmENHookFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENHookFilter.Create;
      FilterObject := ENHookFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENHookFilterEdit.Free;
    frmENHookFilterEdit:=nil;
  end;}
end;

procedure TfrmENLine10Edit.actNoFilterBranch10HookExecute(Sender: TObject);
begin
  {hkFilterObject.Free;
  hkFilterObject := nil;
  UpdateGridBranch10Hook(Sender, sgENBranch10Item.Cells[9, sgENBranch10Item.Row]);}
end;

//Изоляторы опоры ответвления ВЛ 6 - 10 кВ
procedure TfrmENLine10Edit.actViewBranch10InsulatorExecute(Sender: TObject);
var TempENInsulator: ENInsulatorControllerSoapPort;
begin //Просмотр Изолятора
  TempENInsulator := HTTPRIOENInsulator as ENInsulatorControllerSoapPort;
  try
    ENInsulatorObj := TempENInsulator.getObject(StrToInt(
      sgENBranch10Insulator.Cells[0, sgENBranch10Insulator.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENInsulatorEdit := TfrmENInsulatorEdit.Create(Application, dsView);
  try
    frmENInsulatorEdit.lblENHighVoltageSellName.Visible := False;
    frmENInsulatorEdit.edtENHighVoltageSellName.Visible := False;
    frmENInsulatorEdit.spbENHighVoltageSell.Visible := False;
    frmENInsulatorEdit.ShowModal;
  finally
    frmENInsulatorEdit.Free;
    frmENInsulatorEdit := nil;
  end;
end;


procedure TfrmENLine10Edit.actInsertBranch10InsulatorExecute(Sender: TObject);
var
  TempENInsulator: ENInsulatorControllerSoapPort;
  TempENPost: ENPostControllerSoapPort; //Опоры
  postObj: ENPost;
  postObjCode: Integer;
begin //Добавление Изолятора с обязательным указанием ВЛ 6 - 10 кВ и Опоры
  TempENInsulator := HTTPRIOENInsulator as ENInsulatorControllerSoapPort;
  TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;

  try
    postObjCode := StrToInt(TAdvStringGrid(sgENBranch10Item).Cells[9, sgENBranch10Item.Row]);
    postObj := TempENPost.getObject(postObjCode);
  except
    on EConvertError do Exit;
  end;

  ENInsulatorObj := ENInsulator.Create;
  SetNullIntProps(ENInsulatorObj);
  SetNullXSProps(ENInsulatorObj);
  ENInsulatorObj.element := ENElement.Create;
  ENInsulatorObj.element.elementInRef := ENElementRef.Create;
  ENInsulatorObj.element.renRef := EPRenRef.Create;

  try
    ENInsulatorObj.element.elementInRef.code := postObj.element.code;
    ENInsulatorObj.element.renRef.code := postObj.element.renRef.code;
  finally
    postObj.Free;
    postObj := nil;
  end;

  try
    frmENInsulatorEdit :=
      TfrmENInsulatorEdit.Create(Application, dsInsert);

    (*frmENInsulatorEdit.edtENInsulatorTypeName.Text := 'Не визначений';
    if ENInsulatorObj.InsulatorType = nil then
      ENInsulatorObj.InsulatorType := ENInsulatorType.Create();
    ENInsulatorObj.InsulatorType.code := 500000000;*)

    frmENInsulatorEdit.edtDispName.Text := 'Ізолятор';
    frmENInsulatorEdit.spbENHighVoltageSell.Enabled := False;
    //frmENInsulatorEdit.edtENHighVoltageSellName.Text := 'Відсутня';
    frmENInsulatorEdit.edtENHighVoltageSellName.Visible := False;
    frmENInsulatorEdit.lblENHighVoltageSellName.Visible := False;
    frmENInsulatorEdit.spbENHighVoltageSell.Visible := False;
    frmENInsulatorEdit.lblENInsulatorTypeName.Visible := True;
    frmENInsulatorEdit.edtENInsulatorTypeName.Visible := True;
    frmENInsulatorEdit.spbENInsulatorType.Visible := True;

    if ENInsulatorObj.highvoltageSell <> nil then
      begin
        ENInsulatorObj.highvoltageSell.Free;
        ENInsulatorObj.highvoltageSell := nil;
      end;

    if ENInsulatorObj.line10Ref = nil then
      ENInsulatorObj.line10Ref := ENLine10Ref.Create;
    ENInsulatorObj.line10Ref.code := ENLine10Obj.code;

    if ENInsulatorObj.postRef = nil then
      ENInsulatorObj.postRef := ENPostRef.Create;
    ENInsulatorObj.postRef.code := postObjCode;

    try
      if frmENInsulatorEdit.ShowModal = mrOk then
        if ENInsulatorObj <> nil then
          UpdateGridBranch10Insulator(Sender, sgENBranch10Item.Cells[9, sgENBranch10Item.Row]);
    finally
      frmENInsulatorEdit.Free;
      frmENInsulatorEdit := nil;
    end;
  finally
    ENInsulatorObj.Free;
  end;

end;

procedure TfrmENLine10Edit.actDeleteBranch10InsulatorExecute(Sender: TObject);
var TempENInsulator: ENInsulatorControllerSoapPort; ObjCode: Integer;
begin //Удаление Изолятора
  TempENInsulator :=
    HTTPRIOENInsulator as ENInsulatorControllerSoapPort;
  try
    ObjCode := StrToInt(sgENBranch10Insulator.Cells[0, sgENBranch10Insulator.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(
    PChar('Вы действительно хотите удалить изолятор?'),
    PChar('Внимание!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
      begin
        TempENInsulator.remove(ObjCode);
        UpdateGridBranch10Insulator(Sender, sgENBranch10Item.Cells[9, sgENBranch10Item.Row]);
      end;
end;

procedure TfrmENLine10Edit.actEditBranch10InsulatorExecute(Sender: TObject);
var TempENInsulator: ENInsulatorControllerSoapPort;
begin
  TempENInsulator :=
    HTTPRIOENInsulator as ENInsulatorControllerSoapPort;
  try
    ENInsulatorObj :=
      TempENInsulator.getObject(StrToInt(
        sgENBranch10Insulator.Cells[0, sgENBranch10Insulator.Row]));
    (*if ENInsulatorObj.highvoltageSell <> nil then
      begin
        ENInsulatorObj.highvoltageSell.Free;
        ENInsulatorObj.highvoltageSell := nil;
      end;*)
  except
    on EConvertError do Exit;
  end;
  frmENInsulatorEdit :=
    TfrmENInsulatorEdit.Create(Application, dsEdit);
  try
    frmENInsulatorEdit.edtENHighVoltageSellName.Visible := False;
    frmENInsulatorEdit.lblENHighVoltageSellName.Visible := False;
    frmENInsulatorEdit.spbENHighVoltageSell.Visible := False;
    frmENInsulatorEdit.lblENInsulatorTypeName.Visible := True;
    frmENInsulatorEdit.edtENInsulatorTypeName.Visible := True;
    frmENInsulatorEdit.spbENInsulatorType.Visible := True;
    if frmENInsulatorEdit.ShowModal = mrOk then
      UpdateGridBranch10Insulator(Sender, sgENBranch10Item.Cells[9, sgENBranch10Item.Row]);
  finally
    frmENInsulatorEdit.Free;
    frmENInsulatorEdit := nil;
  end;

end;

procedure TfrmENLine10Edit.actUpdateBranch10InsulatorExecute(Sender: TObject);
begin
  UpdateGridBranch10Insulator(Sender, sgENBranch10Item.Cells[9, sgENBranch10Item.Row]);
end;

//Разъединители опоры ответвления ВЛ 6 - 10 кВ
procedure TfrmENLine10Edit.actViewBranch10DisconnectorExecute(Sender: TObject);
var TempENDisconnector: ENDisconnectorControllerSOAPPort;
begin //Просмотр Разъединителя
  TempENDisconnector :=
    HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;
  try
    ENDisconnectorObj :=
      TempENDisconnector.getObject(StrToInt(
        sgENBranch10Disconnector.Cells[0, sgENBranch10Disconnector.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENDisconnectorEdit :=
    TfrmENDisconnectorEdit.Create(Application, dsView);
  try
    frmENDisconnectorEdit.lblENHighVoltageSellName.Visible := False;
    frmENDisconnectorEdit.edtENHighVoltageSellName.Visible := False;
    frmENDisconnectorEdit.spbENHighVoltageSell.Visible := False;
    frmENDisconnectorEdit.ShowModal;
  finally
    frmENDisconnectorEdit.Free;
    frmENDisconnectorEdit := nil;
  end;

end;

procedure TfrmENLine10Edit.actInsertBranch10DisconnectorExecute(Sender: TObject);
var TempENDisconnector: ENDisconnectorControllerSOAPPort;
  TempENPost: ENPostControllerSoapPort; //Опоры
  postObj: ENPost; postObjCode: Integer;
begin//Добавление Разъединителя с обязательным указанием ВЛ 6 - 10 кВ и Опоры
  TempENDisconnector := HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;
  TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;

  try
    postObjCode := StrToInt(TAdvStringGrid(sgENBranch10Item).Cells[9, sgENBranch10Item.Row]);
    postObj := TempENPost.getObject(postObjCode);
  except
    on EConvertError do Exit;
  end;

  ENDisconnectorObj := ENDisconnector.Create;
  SetNullIntProps(ENDisconnectorObj);
  SetNullXSProps(ENDisconnectorObj);

  ENDisconnectorObj.element := ENElement.Create;
  ENDisconnectorObj.element.elementInRef := ENElementRef.Create;

  try
    ENDisconnectorObj.element.elementInRef.code := postObj.element.code;
    ENDisconnectorObj.element.renRef := EPRenRef.Create;
    ENDisconnectorObj.element.renRef.code := postObj.element.renRef.code;
  finally
    postObj.Free;
    postObj := nil;
  end;

  try
    frmENDisconnectorEdit :=
      TfrmENDisconnectorEdit.Create(Application, dsInsert);

    (*frmENDisconnectorEdit.edtENDisconnectorTypeName.Text := 'Не визначений';
    if ENDisconnectorObj.disconnectorType = nil then
      ENDisconnectorObj.disconnectorType := ENDisconnectorType.Create();
    ENDisconnectorObj.disconnectorType.code := 500000000;

    frmENDisconnectorEdit.edtENDisconnectorDriveTypeName.Text := 'Не визначений';
    if ENDisconnectorObj.disconnectordriveType = nil then
      ENDisconnectorObj.disconnectordriveType :=
        ENDisconnectorDriveType.Create();
    ENDisconnectorObj.disconnectordriveType.code := 500000000;*)

    frmENDisconnectorEdit.lblENHighVoltageSellName.Visible := False;
    frmENDisconnectorEdit.edtENHighVoltageSellName.Visible := False;
    frmENDisconnectorEdit.spbENHighVoltageSell.Visible := False;

    if ENDisconnectorObj.highvoltageSell <> nil then
      begin
        ENDisconnectorObj.highvoltageSell.Free;
        ENDisconnectorObj.highvoltageSell := nil;
      end;
    if ENDisconnectorObj.line10Ref = nil then
      begin
        ENDisconnectorObj.line10Ref := ENLine10Ref.Create;
        ENDisconnectorObj.line10Ref.code := ENLine10Obj.code;
      end;
    if ENDisconnectorObj.postRef = nil then
      begin
        ENDisconnectorObj.postRef := ENPostRef.Create;
        ENDisconnectorObj.postRef.code := postObjCode;
      end;

    try
      if frmENDisconnectorEdit.ShowModal = mrOk then
        if ENDisconnectorObj <> nil then
          UpdateGridBranch10Disconnector(Sender, sgENBranch10Item.Cells[9, sgENBranch10Item.Row]);
    finally
      frmENDisconnectorEdit.Free;
      frmENDisconnectorEdit := nil;
    end;
  finally
    ENDisconnectorObj.Free;
  end;
end;


procedure TfrmENLine10Edit.actDeleteBranch10DisconnectorExecute(Sender: TObject);
var TempENDisconnector: ENDisconnectorControllerSOAPPort; ObjCode: Integer;
begin //Удаление Разъединителя
  TempENDisconnector :=
    HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;
  try
    ObjCode := StrToInt(sgENBranch10Disconnector.Cells[0, sgENBranch10Disconnector.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(
    PChar('Вы действительно хотите удалить разъединитель?'),
    PChar('Внимание!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
      begin
        TempENDisconnector.remove(ObjCode);
        UpdateGridBranch10Disconnector(Sender, sgENBranch10Item.Cells[9, sgENBranch10Item.Row]);
      end;
end;


procedure TfrmENLine10Edit.actEditBranch10DisconnectorExecute(Sender: TObject);
var TempENDisconnector: ENDisconnectorControllerSOAPPort;
begin
  TempENDisconnector :=
    HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;
  try
    ENDisconnectorObj :=
      TempENDisconnector.getObject(StrToInt(
        sgENBranch10Disconnector.Cells[0, sgENBranch10Disconnector.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENDisconnectorEdit :=
    TfrmENDisconnectorEdit.Create(Application, dsEdit);
  try
    frmENDisconnectorEdit.lblENHighVoltageSellName.Visible := False;
    frmENDisconnectorEdit.edtENHighVoltageSellName.Visible := False;
    frmENDisconnectorEdit.spbENHighVoltageSell.Visible := False;
    if frmENDisconnectorEdit.ShowModal = mrOk then
      UpdateGridBranch10Disconnector(Sender, sgENBranch10Item.Cells[9, sgENBranch10Item.Row]);
  finally
    frmENDisconnectorEdit.Free;
    frmENDisconnectorEdit := nil;
  end;

end;

procedure TfrmENLine10Edit.actUpdateBranch10DisconnectorExecute(Sender: TObject);
begin
  UpdateGridBranch10Disconnector(Sender, sgENBranch10Item.Cells[9, sgENBranch10Item.Row]);
end;


procedure TfrmENLine10Edit.pcBranch10PostEquipmentChange(Sender: TObject);
var Allow: Boolean;
begin
  sgENBranch10Item.Update;
  sgENBranch10Item.OnRowChanging(sgENBranch10Item, 0, sgENBranch10Item.Row, Allow);
end;


procedure TfrmENLine10Edit.sgENCabelOut10RowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
begin
  if TAdvStringGrid(Sender).Cells[0, NewRow] = '' then
    Exit;
  //Обновление списка Опор, между которыми проходит Кабельная вставка
  //или от которой осуществлён Кабельный выход
  UpdateGridCabelOut10Item(Sender, TAdvStringGrid(Sender).Cells[0, NewRow]);
end;


procedure TfrmENLine10Edit.sgENInspectionSheetClick(Sender: TObject);
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

  actEditENInspectionSheet.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_DRAFT);
  actDeleteENInspectionSheet.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_DRAFT);
end;


procedure TfrmENLine10Edit.sgENInspectionSheetDblClick(Sender: TObject);
begin
  inherited;
  actViewInspectionSheetExecute(Sender);
end;


procedure TfrmENLine10Edit.actUnlinkPostExecute(Sender: TObject);
var TempENCabelOut10Item: ENCabelOut10ItemControllerSoapPort;
  TempENAirCrossingItem: ENAirCrossingItemControllerSoapPort;
begin
  if pcLine10.ActivePage = tsCabelOut10 then
    begin //Отвязка опоры от Кабельного выхода / вставки
      if TAdvStringGrid(
        sgENCabelOut10Item).Cells[0, sgENCabelOut10Item.Row] = ''
      then
        Exit;
      if Application.MessageBox( PChar('Вы действительно хотите отвязать '
          + 'Кабельний виход или Кабельную вставку ВЛ 6 - 10 кВ от опоры?'),
        PChar('Внимание!'),
        MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK
      then
        begin
          TempENCabelOut10Item :=
            HTTPRIOENCabelOut10Item as ENCabelOut10ItemControllerSoapPort;
          //Удаление связи кабельного выходами / вставки с опорой
          TempENCabelOut10Item.remove(StrToInt(TAdvStringGrid(
            sgENCabelOut10Item).Cells[0, sgENCabelOut10Item.Row]));
          UpdateGridCabelOut10Item(Sender,
            TAdvStringGrid(sgENCabelOut10).Cells[0, sgENCabelOut10.Row]);
        end;
    end //if pcLine10.ActivePage = tsCabelOut10 then
  else if pcLine10.ActivePage = tsAirCrossing then
    begin //Отвязка опоры от Воздушного пересечения
      if TAdvStringGrid(
        sgENAirCrossingItem).Cells[0, sgENAirCrossingItem.Row] = ''
      then
        Exit;
      if Application.MessageBox( PChar('Вы действительно хотите отвязать '
          + 'Воздушное пересечение от опоры ВЛ 6 - 10 кВ?'),
        PChar('Внимание!'),
        MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK
      then
        begin
          TempENAirCrossingItem :=
            HTTPRIOENAirCrossingItem as ENAirCrossingItemControllerSoapPort;
          //Удаление связи Воздушного пересечения с Опорой ВЛ 6 - 10 кВ
          TempENAirCrossingItem.remove(StrToInt(TAdvStringGrid(
            sgENAirCrossingItem).Cells[0, sgENAirCrossingItem.Row]));
          UpdateGridAirCrossingItem(Sender,
            TAdvStringGrid(sgENAirCrossing).Cells[0, sgENAirCrossing.Row]);
        end;
    end; //else if pcLine10.ActivePage = tsAirCrossing then
end;


procedure TfrmENLine10Edit.actUnSignedExecute(Sender: TObject);
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
  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити підписання листа огляду?'),
                  PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENInspectionSheet.unSigned(sheetCode);
    pcLine10Change(Sender);
  end;
end;


procedure TfrmENLine10Edit.actUnSigningExecute(Sender: TObject);
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
  if Application.MessageBox(PChar('Ви дійсно бажаєте перевести лист огляду в статус "чорновий"?'),
                  PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENInspectionSheet.unSigning(sheetCode);
    pcLine10Change(Sender);
  end;
end;


procedure TfrmENLine10Edit.sb150cellClick(Sender: TObject);
var
   frmENSubst150CellShow: TfrmENSubst150CellShow;
begin
   frmENSubst150CellShow:=TfrmENSubst150CellShow.Create(Application,fmNormal);
   try
      with frmENSubst150CellShow do
        if ShowModal = mrOk then
        begin
            try
               cellCode:=StrToInt(frmENSubst150CellShow.GetReturnValue(sgENSubst150Cell,0));
               edtSubst150Cell.Text := frmENSubst150CellShow.GetReturnValue(sgENSubst150Cell,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENSubst150CellShow.Free;
   end;
   end;


procedure TfrmENLine10Edit.sgCCDamageLogDblClick(Sender: TObject);
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

procedure TfrmENLine10Edit.sgCCElementDataDblClick(Sender: TObject);
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


procedure TfrmENLine10Edit.sgENActDblClick(Sender: TObject);
begin
  inherited;
  actViewExecute(Sender);
end;


procedure TfrmENLine10Edit.sgENAirCrossingRowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
begin
  if TAdvStringGrid(Sender).Cells[0, NewRow] = '' then
    Exit;
  //Обновление списка Опор, ограничивающих воздушные пересечения
  UpdateGridAirCrossingItem(Sender, TAdvStringGrid(Sender).Cells[0, NewRow]);
end;


procedure TfrmENLine10Edit.actPassportLine10Execute(Sender: TObject);
var
  argNames, args : EnergyProController.ArrayOfString;
  reportName : String;
begin
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'Line10Code';
  args[0] := IntToStr(ENLine10Obj.code);

  reportName := 'Passport/Line10/Line10';
  makeReport(reportName, argNames, args, 'pdf');
end;


procedure TfrmENLine10Edit.spbSubStation150Click(Sender: TObject);
var
  frmENSubstation150Show: TfrmENSubstation150Show;
  TempENLine10Supplies: ENLine10SuppliesControllerSoapPort;
  listENLine10Supplies: ENLine10SuppliesShortList;
  filterENLine10Supplies: ENLine10SuppliesFilter;
  objENLine10Supplies: ENLine10Supplies;
begin
   frmENSubstation150Show :=
     TfrmENSubstation150Show.Create(Application, fmNormal);
   try
      with frmENSubstation150Show do
        begin
          actInsert.Enabled := False;
          actDelete.Enabled := False;
          actEdit.Enabled := False;
          if ShowModal = mrOk then
            try
              TempENLine10Supplies :=
                HTTPRIOENLine10Supplies as ENLine10SuppliesControllerSoapPort;
              filterENLine10Supplies := ENLine10SuppliesFilter.Create;
              try
                SetNullIntProps(filterENLine10Supplies);
                SetNullXSProps(filterENLine10Supplies);
                ENLine10SuppliesFilter(filterENLine10Supplies).conditionSQL :=
                  ' ENLINE10SUPPLIES.LINE10REFCODE = '
                  + IntToStr(ENLine10Obj.code);
                listENLine10Supplies :=
                  TempENLine10Supplies.getScrollableFilteredList(
                    filterENLine10Supplies, 0, 1);
                if listENLine10Supplies.totalCount = 0 then
                  objENLine10Supplies := ENLine10Supplies.Create
                else
                  objENLine10Supplies := TempENLine10Supplies.getObject(
                    listENLine10Supplies.list[0].code);
                try
                  objENLine10Supplies.line10Ref := ENLine10Ref.Create;
                  objENLine10Supplies.line10Ref.code := ENLine10Obj.code;
                  objENLine10Supplies.line10ElementRef := ENElementRef.Create;
                  objENLine10Supplies.line10ElementRef.code :=
                    ENLine10Obj.element.code;
                  objENLine10Supplies.substation150Ref :=
                    ENSubstation150Ref.Create;
                  objENLine10Supplies.substation150Ref.code :=
                    StrToInt(GetReturnValue(sgENSubstation150, 0));
                  objENLine10Supplies.name :=
                    GetReturnValue(sgENSubstation150, 1) + ' живить '
                    + ENLine10Obj.name;
                  objENLine10Supplies.station150ElementRef :=
                      ENElementRef.Create;
                  objENLine10Supplies.station150ElementRef.code :=
                    listENLine10Supplies.list[0].station150ElementRefCode;
                  if listENLine10Supplies.totalCount = 0 then
                    begin
                      objENLine10Supplies.code := low(Integer);
                      TempENLine10Supplies.add(objENLine10Supplies);
                    end
                  else
                    TempENLine10Supplies.save(objENLine10Supplies);
                  edtSubStation150.Text := GetReturnValue(sgENSubstation150, 1);
                finally
                  objENLine10Supplies.Free;
                  objENLine10Supplies := nil;
                end;
              (*finally
                filterENLine10Supplies.Free;*)
              except
                on EConvertError do Exit;
              end;
            except
               on EConvertError do Exit;
            end;
        end; //with frmENSubstation150Show do
   finally
      frmENSubstation150Show.Free;
   end;
end;


procedure TfrmENLine10Edit.tbiDamagesXLSClick(Sender: TObject);
Var
  request: CCReportRequestEx;
  argNames, args: CCReportController.ArrayOfString;
  reportType : String;
begin

    if (ENLine10Obj.element=nil) or (ENLine10Obj.element.code=Low(Integer)) then
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
    args[1] := IntToStr(ENLine10Obj.element.code);

    request.argNames:=argNames;
    request.args:=args;
    request.resultType:=Low(Integer);

    request.funcName := '/com/ksoe/callcenter/reports/Dispetcher/ByNode_Damages_T32.jasper';
    reportType := 'xls';

    CCDMReport.makeGeneralReportPDF('RequestLog', request, reportType);
end;

procedure TfrmENLine10Edit.recalcSubstation04();
var TempENSubstation04: ENSubstation04ControllerSoapPort;
  ENSubstation04ListObj: ENSubstation04ShortList;
  ENSubstation04FilterObj: ENSubstation04Filter;
begin //Пересчёт количества ТП 10 - 6 / 0,4 кВ, питающихся от ВЛ 6 - 10 кВ
  TempENSubstation04 :=
    HTTPRIOENSubstation04 as ENSubstation04ControllerSoapPort;
  try
    ENSubstation04FilterObj := ENSubstation04Filter.Create;

    SetNullIntProps(ENSubstation04FilterObj);
    SetNullXSProps(ENSubstation04FilterObj);

    ENSubstation04Filter(ENSubstation04FilterObj).conditionSQL :=
      ' (elementcode in (select e.code from enelement e where '
      + ' e.elementinrefcode = ' + IntToStr(ENLine10Obj.element.code) +'))'
      + ' or (code in (select hvcs.substation04refcode '
      + ' from enhighvoltcellsupplies hvcs where hvcs.line10refcode = '
      + IntToStr(ENLine10Obj.code) + '))';

    ENSubstation04ListObj :=
      TempENSubstation04.getScrollableFilteredList(
        ENSubstation04FilterObj, 0, -1);

    lblSubstation04Cnt.Caption := IntToStr(ENSubstation04ListObj.totalCount);
  finally
    ENSubstation04FilterObj.Free;
    ENSubstation04ListObj.Free;
  end;

end;

procedure TfrmENLine10Edit.recalcPost();
var TempENPost: ENPostControllerSoapPort;
  ENPostListObj: ENPostShortList;
  ENPostFilterObj: ENPostFilter;
begin //Пересчёт количества Опор, удерживающих ВЛ 6 - 10 кВ
  TempENPost :=
    HTTPRIOENPost as ENPostControllerSoapPort;
  try
    ENPostFilterObj := ENPostFilter.Create;

    SetNullIntProps(ENPostFilterObj);
    SetNullXSProps(ENPostFilterObj);

    ENPostFilter(ENPostFilterObj).conditionSQL :=
      ' ENPOST.LINE10REFCODE = ' + IntToStr(ENLine10Obj.code)
      + ' AND ENPOST.CODE NOT IN (SELECT ENBRANCH10ITEM.POSTCODE '
      + '   FROM ENBRANCH10ITEM WHERE ENBRANCH10ITEM.BRANCH10REFCODE IN '
      + '     (SELECT ENBRANCH10.CODE FROM ENBRANCH10 '
      + '       WHERE LINE10REFCODE = ' + IntToStr(ENLine10Obj.code) + '))';

    ENPostListObj :=
      TempENPost.getScrollableFilteredList(
        ENPostFilterObj, 0, -1);

    lblPostCnt.Caption := IntToStr(ENPostListObj.totalCount);
  finally
    ENPostFilterObj.Free;
    ENPostListObj.Free;
  end;
end;

procedure TfrmENLine10Edit.recalcStand();
var TempENStand: ENStandControllerSoapPort;
  ENStandListObj: ENStandShortList;
  ENStandFilterObj: ENStandFilter;
begin //Пересчёт количества Стоек Опор, удерживающих ВЛ 6 - 10 кВ
  TempENStand :=
    HTTPRIOENStand as ENStandControllerSoapPort;
  try
    ENStandFilterObj := ENStandFilter.Create;

    SetNullIntProps(ENStandFilterObj);
    SetNullXSProps(ENStandFilterObj);

    ENStandFilter(ENStandFilterObj).conditionSQL :=
      ' ENSTAND.POSTREFCODE IN '
      + '(SELECT ENPOST.CODE FROM ENPOST WHERE ENPOST.LINE10REFCODE = '
      + IntToStr(ENLine10Obj.code)
      + ' AND ENPOST.CODE NOT IN (SELECT ENBRANCH10ITEM.POSTCODE '
      + '   FROM ENBRANCH10ITEM WHERE ENBRANCH10ITEM.BRANCH10REFCODE IN '
      + '     (SELECT ENBRANCH10.CODE FROM ENBRANCH10 '
      + '       WHERE LINE10REFCODE = ' + IntToStr(ENLine10Obj.code) + ')))';

    ENStandListObj :=
      TempENStand.getScrollableFilteredList(
        ENStandFilterObj, 0, -1);

    lblStandCnt.Caption := IntToStr(ENStandListObj.totalCount);
  finally
    ENStandFilterObj.Free;
    ENStandListObj.Free;
  end;
end;

procedure TfrmENLine10Edit.recalcTravers();
var TempENTravers: ENTraversControllerSoapPort;
  ENTraversListObj: ENTraversShortList;
  ENTraversFilterObj: ENTraversFilter;
begin //Пересчёт количества Траверс Опор, удерживающих ВЛ 6 - 10 кВ
  TempENTravers :=
    HTTPRIOENTravers as ENTraversControllerSoapPort;
  try
    ENTraversFilterObj := ENTraversFilter.Create;

    SetNullIntProps(ENTraversFilterObj);
    SetNullXSProps(ENTraversFilterObj);

    ENTraversFilter(ENTraversFilterObj).conditionSQL :=
      'ENTRAVERS.POSTREFCODE IN '
      + '(SELECT ENPOST.CODE FROM ENPOST WHERE ENPOST.LINE10REFCODE = '
      + IntToStr(ENLine10Obj.code)
      + ' AND ENPOST.CODE NOT IN (SELECT ENBRANCH10ITEM.POSTCODE '
      + '   FROM ENBRANCH10ITEM WHERE ENBRANCH10ITEM.BRANCH10REFCODE IN '
      + '     (SELECT ENBRANCH10.CODE FROM ENBRANCH10 '
      + '       WHERE LINE10REFCODE = ' + IntToStr(ENLine10Obj.code) + ')))';

    ENTraversListObj :=
      TempENTravers.getScrollableFilteredList(
        ENTraversFilterObj, 0, -1);

    lblTraversCnt.Caption := IntToStr(ENTraversListObj.totalCount);
  finally
    ENTraversFilterObj.Free;
    ENTraversListObj.Free;
  end;
end;

procedure TfrmENLine10Edit.recalcInsulator();
var TempENInsulator: ENInsulatorControllerSoapPort;
  ENInsulatorListObj: ENInsulatorShortList;
  ENInsulatorFilterObj: ENInsulatorFilter;
begin //Пересчёт количества Изоляторов на Опорах, удерживающих ВЛ 6 - 10 кВ
  TempENInsulator :=
    HTTPRIOENInsulator as ENInsulatorControllerSoapPort;
  try
    ENInsulatorFilterObj := ENInsulatorFilter.Create;

    SetNullIntProps(ENInsulatorFilterObj);
    SetNullXSProps(ENInsulatorFilterObj);

    ENInsulatorFilter(ENInsulatorFilterObj).conditionSQL :=
      'ENINSULATOR.POSTREFCODE IN '
      + '(SELECT ENPOST.CODE FROM ENPOST WHERE ENPOST.LINE10REFCODE = '
      + IntToStr(ENLine10Obj.code)
      + ' AND ENPOST.CODE NOT IN (SELECT ENBRANCH10ITEM.POSTCODE '
      + '   FROM ENBRANCH10ITEM WHERE ENBRANCH10ITEM.BRANCH10REFCODE IN '
      + '     (SELECT ENBRANCH10.CODE FROM ENBRANCH10 '
      + '       WHERE LINE10REFCODE = ' + IntToStr(ENLine10Obj.code) + ')))';

    ENInsulatorListObj :=
      TempENInsulator.getScrollableFilteredList(
        ENInsulatorFilterObj, 0, -1);

    lblInsulatorCnt.Caption := IntToStr(ENInsulatorListObj.totalCount);
  finally
    ENInsulatorFilterObj.Free;
    ENInsulatorListObj.Free;
  end;
end;

procedure TfrmENLine10Edit.recalcDisconnector();
var TempENDisconnector: ENDisconnectorControllerSoapPort;
  ENDisconnectorListObj: ENDisconnectorShortList;
  ENDisconnectorFilterObj: ENDisconnectorFilter;
begin //Пересчёт количества Разъединителей на Опорах, удерживающих ВЛ 6 - 10 кВ
  TempENDisconnector :=
    HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;
  try
    ENDisconnectorFilterObj := ENDisconnectorFilter.Create;

    SetNullIntProps(ENDisconnectorFilterObj);
    SetNullXSProps(ENDisconnectorFilterObj);

    ENDisconnectorFilter(ENDisconnectorFilterObj).conditionSQL :=
      'ENDISCONNECTOR.POSTREFCODE IN '
      + '(SELECT ENPOST.CODE FROM ENPOST WHERE ENPOST.LINE10REFCODE = '
      + IntToStr(ENLine10Obj.code)
      + ' AND ENPOST.CODE NOT IN (SELECT ENBRANCH10ITEM.POSTCODE '
      + '   FROM ENBRANCH10ITEM WHERE ENBRANCH10ITEM.BRANCH10REFCODE IN '
      + '     (SELECT ENBRANCH10.CODE FROM ENBRANCH10 '
      + '       WHERE LINE10REFCODE = ' + IntToStr(ENLine10Obj.code) + ')))';

    ENDisconnectorListObj :=
      TempENDisconnector.getScrollableFilteredList(
        ENDisconnectorFilterObj, 0, -1);

    lblDisconnectorCnt.Caption := IntToStr(ENDisconnectorListObj.totalCount);
  finally
    ENDisconnectorFilterObj.Free;
    ENDisconnectorListObj.Free;
  end;
end;

procedure TfrmENLine10Edit.recalcBranch10();
var TempENBranch10: ENBranch10ControllerSoapPort;
  ENBranch10ListObj: ENBranch10ShortList;
  ENBranch10FilterObj: ENBranch10Filter;
begin //Пересчёт количества Воздушных Ответвлений от ВЛ 6 - 10 кВ
  TempENBranch10 :=
    HTTPRIOENBranch10 as ENBranch10ControllerSoapPort;
  try
    ENBranch10FilterObj := ENBranch10Filter.Create;

    SetNullIntProps(ENBranch10FilterObj);
    SetNullXSProps(ENBranch10FilterObj);

    ENBranch10Filter(ENBranch10FilterObj).conditionSQL :=
      ' ENBRANCH10.LINE10REFCODE = ' + IntToStr(ENLine10Obj.code);

    ENBranch10ListObj :=
      TempENBranch10.getScrollableFilteredList(
        ENBranch10FilterObj, 0, -1);

    lblBranch10Cnt.Caption := IntToStr(ENBranch10ListObj.totalCount);
  finally
    ENBranch10FilterObj.Free;
    ENBranch10ListObj.Free;
  end;
end;

procedure TfrmENLine10Edit.recalcBranch10Item();
var TempENBranch10Item: ENBranch10ItemControllerSoapPort;
  ENBranch10ItemListObj: ENBranch10ItemShortList;
  ENBranch10ItemFilterObj: ENBranch10ItemFilter;
begin //Пересчёт количества Опор, удерживающих Воздушные Ответвления от ВЛ 6 - 10 кВ
  TempENBranch10Item :=
    HTTPRIOENBranch10Item as ENBranch10ItemControllerSoapPort;
  try
    ENBranch10ItemFilterObj := ENBranch10ItemFilter.Create;

    SetNullIntProps(ENBranch10ItemFilterObj);
    SetNullXSProps(ENBranch10ItemFilterObj);

    ENBranch10ItemFilter(ENBranch10ItemFilterObj).conditionSQL :=
      'ENBRANCH10ITEM.BRANCH10REFCODE IN (SELECT ENBRANCH10.CODE '
      + 'FROM ENBRANCH10 WHERE ENBRANCH10.LINE10REFCODE = '
      + IntToStr(ENLine10Obj.code) + ')';

    ENBranch10ItemListObj :=
      TempENBranch10Item.getScrollableFilteredList(
        ENBranch10ItemFilterObj, 0, -1);

    lblBranch10ItemCnt.Caption := IntToStr(ENBranch10ItemListObj.totalCount);
  finally
    ENBranch10ItemFilterObj.Free;
    ENBranch10ItemListObj.Free;
  end;
end;

procedure TfrmENLine10Edit.recalcBranch10Stand();
var TempENStand: ENStandControllerSoapPort;
  ENStandListObj: ENStandShortList;
  ENStandFilterObj: ENStandFilter;
begin //Пересчёт количества Стоек Опор, удерживающих Воздушные Ответвления от ВЛ 6 - 10 кВ
  TempENStand :=
    HTTPRIOENStand as ENStandControllerSoapPort;
  try
    ENStandFilterObj := ENStandFilter.Create;

    SetNullIntProps(ENStandFilterObj);
    SetNullXSProps(ENStandFilterObj);

    ENStandFilter(ENStandFilterObj).conditionSQL := 'ENSTAND.POSTREFCODE IN '
      + '(SELECT ENBRANCH10ITEM.POSTCODE FROM ENBRANCH10ITEM WHERE '
      + 'ENBRANCH10ITEM.BRANCH10REFCODE IN (SELECT ENBRANCH10.CODE '
      + 'FROM ENBRANCH10 WHERE ENBRANCH10.LINE10REFCODE = '
      + IntToStr(ENLine10Obj.code) + '))';

    ENStandListObj :=
      TempENStand.getScrollableFilteredList(
        ENStandFilterObj, 0, -1);

    lblBranch10StandCnt.Caption := IntToStr(ENStandListObj.totalCount);
  finally
    ENStandFilterObj.Free;
    ENStandListObj.Free;
  end;
end;

procedure TfrmENLine10Edit.recalcBranch10Travers();
var TempENTravers: ENTraversControllerSoapPort;
  ENTraversListObj: ENTraversShortList;
  ENTraversFilterObj: ENTraversFilter;
begin //Пересчёт количества Траверс Опор, удерживающих Воздушные Ответвления от ВЛ 6 - 10 кВ
  TempENTravers :=
    HTTPRIOENTravers as ENTraversControllerSoapPort;
  try
    ENTraversFilterObj := ENTraversFilter.Create;

    SetNullIntProps(ENTraversFilterObj);
    SetNullXSProps(ENTraversFilterObj);

    ENTraversFilter(ENTraversFilterObj).conditionSQL :=
      'ENTRAVERS.POSTREFCODE IN '
      + '(SELECT ENBRANCH10ITEM.POSTCODE FROM ENBRANCH10ITEM WHERE '
      + 'ENBRANCH10ITEM.BRANCH10REFCODE IN (SELECT ENBRANCH10.CODE '
      + 'FROM ENBRANCH10 WHERE ENBRANCH10.LINE10REFCODE = '
      + IntToStr(ENLine10Obj.code) + '))';

    ENTraversListObj :=
      TempENTravers.getScrollableFilteredList(
        ENTraversFilterObj, 0, -1);

    lblBranch10TraversCnt.Caption := IntToStr(ENTraversListObj.totalCount);
  finally
    ENTraversFilterObj.Free;
    ENTraversListObj.Free;
  end;
end;

procedure TfrmENLine10Edit.recalcBranch10Insulator();
var TempENInsulator: ENInsulatorControllerSoapPort;
  ENInsulatorListObj: ENInsulatorShortList;
  ENInsulatorFilterObj: ENInsulatorFilter;
begin //Пересчёт количества Изоляторов на Опорах, удерживающих Воздушные Ответвления от ВЛ 6 - 10 кВ
  TempENInsulator :=
    HTTPRIOENInsulator as ENInsulatorControllerSoapPort;
  try
    ENInsulatorFilterObj := ENInsulatorFilter.Create;

    SetNullIntProps(ENInsulatorFilterObj);
    SetNullXSProps(ENInsulatorFilterObj);

    ENInsulatorFilter(ENInsulatorFilterObj).conditionSQL :=
      'ENINSULATOR.POSTREFCODE IN '
      + '(SELECT ENBRANCH10ITEM.POSTCODE FROM ENBRANCH10ITEM WHERE '
      + 'ENBRANCH10ITEM.BRANCH10REFCODE IN (SELECT ENBRANCH10.CODE '
      + 'FROM ENBRANCH10 WHERE ENBRANCH10.LINE10REFCODE = '
      + IntToStr(ENLine10Obj.code) + '))';

    ENInsulatorListObj :=
      TempENInsulator.getScrollableFilteredList(
        ENInsulatorFilterObj, 0, -1);

    lblBranch10InsulatorCnt.Caption := IntToStr(ENInsulatorListObj.totalCount);
  finally
    ENInsulatorFilterObj.Free;
    ENInsulatorListObj.Free;
  end;
end;

procedure TfrmENLine10Edit.recalcBranch10Disconnector();
var TempENDisconnector: ENDisconnectorControllerSoapPort;
  ENDisconnectorListObj: ENDisconnectorShortList;
  ENDisconnectorFilterObj: ENDisconnectorFilter;
begin //Пересчёт количества Разъединителей на Опорах, удерживающих Воздушные Ответвления от ВЛ 6 - 10 кВ
  TempENDisconnector :=
    HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;
  try
    ENDisconnectorFilterObj := ENDisconnectorFilter.Create;

    SetNullIntProps(ENDisconnectorFilterObj);
    SetNullXSProps(ENDisconnectorFilterObj);

    ENDisconnectorFilter(ENDisconnectorFilterObj).conditionSQL :=
      'ENDISCONNECTOR.POSTREFCODE IN '
      + '(SELECT ENBRANCH10ITEM.POSTCODE FROM ENBRANCH10ITEM WHERE '
      + 'ENBRANCH10ITEM.BRANCH10REFCODE IN (SELECT ENBRANCH10.CODE '
      + 'FROM ENBRANCH10 WHERE ENBRANCH10.LINE10REFCODE = '
      + IntToStr(ENLine10Obj.code) + '))';

    ENDisconnectorListObj :=
      TempENDisconnector.getScrollableFilteredList(
        ENDisconnectorFilterObj, 0, -1);

    lblBranch10DisconnectorCnt.Caption := IntToStr(ENDisconnectorListObj.totalCount);
  finally
    ENDisconnectorFilterObj.Free;
    ENDisconnectorListObj.Free;
  end;
end;

procedure TfrmENLine10Edit.recalcCabelOut10();
var TempENCabelOut10: ENCabelOut10ControllerSoapPort;
  ENCabelOut10ListObj: ENCabelOut10ShortList;
  ENCabelOut10FilterObj: ENCabelOut10Filter;
begin //Пересчёт количества Кабельных Выходов и Вставок ВЛ 6 - 10 кВ
  TempENCabelOut10 :=
    HTTPRIOENCabelOut10 as ENCabelOut10ControllerSoapPort;
  try
    ENCabelOut10FilterObj := ENCabelOut10Filter.Create;

    SetNullIntProps(ENCabelOut10FilterObj);
    SetNullXSProps(ENCabelOut10FilterObj);

    ENCabelOut10Filter(ENCabelOut10FilterObj).conditionSQL :=
      ' ENCABELOUT10.LINE10REFCODE = ' + IntToStr(ENLine10Obj.code);

    ENCabelOut10ListObj :=
      TempENCabelOut10.getScrollableFilteredList(
        ENCabelOut10FilterObj, 0, -1);

    lblCabelOut10Cnt.Caption := IntToStr(ENCabelOut10ListObj.totalCount);
  finally
    ENCabelOut10FilterObj.Free;
    ENCabelOut10ListObj.Free;
  end;
end;

procedure TfrmENLine10Edit.recalcAirCrossingUp();
var TempENAirCrossing: ENAirCrossingControllerSoapPort;
  ENAirCrossingListObj: ENAirCrossingShortList;
  ENAirCrossingFilterObj: ENAirCrossingFilter;
begin //Пересчёт количества Воздушных Пересечений ВЛ 6 - 10 кВ, Объекты сверху
  TempENAirCrossing :=
    HTTPRIOENAirCrossing as ENAirCrossingControllerSoapPort;
  try
    ENAirCrossingFilterObj := ENAirCrossingFilter.Create;

    SetNullIntProps(ENAirCrossingFilterObj);
    SetNullXSProps(ENAirCrossingFilterObj);

    ENAirCrossingFilter(ENAirCrossingFilterObj).conditionSQL :=
      ' ENAIRCROSSING.LINE10REFCODE = ' + IntToStr(ENLine10Obj.code) +
      ' AND OBJCROSSUPREFCODE IS NOT NULL';

    ENAirCrossingListObj :=
      TempENAirCrossing.getScrollableFilteredList(
        ENAirCrossingFilterObj, 0, -1);

    lblAirCrossingUpCnt.Caption := IntToStr(ENAirCrossingListObj.totalCount);
  finally
    ENAirCrossingFilterObj.Free;
    ENAirCrossingListObj.Free;
  end;
end;

procedure TfrmENLine10Edit.recalcAirCrossingDown();
var TempENAirCrossing: ENAirCrossingControllerSoapPort;
  ENAirCrossingListObj: ENAirCrossingShortList;
  ENAirCrossingFilterObj: ENAirCrossingFilter;
begin //Пересчёт количества Воздушных Пересечений ВЛ 6 - 10 кВ, Объекты снизу
  TempENAirCrossing :=
    HTTPRIOENAirCrossing as ENAirCrossingControllerSoapPort;
  try
    ENAirCrossingFilterObj := ENAirCrossingFilter.Create;

    SetNullIntProps(ENAirCrossingFilterObj);
    SetNullXSProps(ENAirCrossingFilterObj);

    ENAirCrossingFilter(ENAirCrossingFilterObj).conditionSQL :=
      ' ENAIRCROSSING.LINE10REFCODE = ' + IntToStr(ENLine10Obj.code) +
      ' AND OBJCROSSDOWNREFCODE IS NOT NULL';

    ENAirCrossingListObj :=
      TempENAirCrossing.getScrollableFilteredList(
        ENAirCrossingFilterObj, 0, -1);

    lblAirCrossingDownCnt.Caption := IntToStr(ENAirCrossingListObj.totalCount);
  finally
    ENAirCrossingFilterObj.Free;
    ENAirCrossingListObj.Free;
  end;
end;


procedure TfrmENLine10Edit.addressesRewrite();
var i: Integer;
  TempENPost: ENPostControllerSoapPort; ENPostList: ENPostShortList; //Опоры
  //TempAddress: AddressControllerSoapPort;   AddressObj: Address; //Адрес
begin //Заполнение списка адресов, через которвые проходит ВЛ 6 - 10 кВ
  SetGridHeaders(AddressesHeaders, sgAddresses.ColumnHeaders);
  pstAddrColCount := 100;
  TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;
  if pstAddrFilter = nil then
    begin
      pstAddrFilter := ENPostFilter.Create;
      SetNullIntProps(pstAddrFilter);
      SetNullXSProps(pstAddrFilter);
    end;

  pstAddrFilter.conditionSQL :=
    ' ENPOST.LINE10REFCODE = ' + IntToStr(ENLine10Obj.code)
    + ' AND ENPOST.CODE NOT IN (SELECT ENBRANCH10ITEM.POSTCODE '
    + '   FROM ENBRANCH10ITEM WHERE ENBRANCH10ITEM.BRANCH10REFCODE IN '
    + '     (SELECT ENBRANCH10.CODE FROM ENBRANCH10 WHERE LINE10REFCODE = '
    + IntToStr(ENLine10Obj.code) + '))'
    + ' AND ENPOST.ADDRESSREFCODE IS NOT NULL';

  ENPostList := TempENPost.getScrollableFilteredList(
    ENPostFilter(pstAddrFilter), 0, pstAddrColCount);
  pstAddrLastCount := High(ENPostList.list);
  if pstAddrLastCount > -1 then
    sgAddresses.RowCount := pstAddrLastCount + 2
  else
    sgAddresses.RowCount := 2;
  with sgAddresses do
    for i := 0 to pstAddrLastCount do
      begin
        Application.ProcessMessages;
        if ENPostList.list[i].code <> Low(Integer) then //Код опори
          Cells[0, i + 1] := IntToStr(ENPostList.list[i].code)
        else
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENPostList.list[i].postNumberGen; //№ опори

        (*TempAddress := HTTPRIOAddress as AddressControllerSoapPort;
        AddressObj := TempAddress.getObject(ENPostList.list[i].addressRefCode);
        try
          if AddressObj.street <> nil then
            begin //Вулиця
              Cells[5, i + 1] := AddressObj.street.name;
              if AddressObj.street.streetType <> nil then
                Cells[5, i + 1] := AddressObj.street.streetType.name
                  + ' ' + Cells[5, i + 1];
              if AddressObj.street.city <> nil then
                begin //Населений пункт
                  Cells[4, i + 1] := AddressObj.street.city.name;
                  if AddressObj.street.city.cityType <> nil then
                    Cells[4, i + 1] := AddressObj.street.city.cityType.name
                      + ' ' + Cells[4, i + 1];
                  if AddressObj.street.city.region <> nil then
                    begin //Район
                      Cells[3, i + 1] := AddressObj.street.city.region.name;
                      if AddressObj.street.city.region.province <> nil then
                        Cells[2, i + 1] := //Область
                          AddressObj.street.city.region.province.name;
                    end;
                end
            end; //if AddressObj.street <> nil then
          if AddressObj.location <> nil then //№ вул.
            Cells[6, i + 1] := AddressObj.location.house;
        finally
          AddressObj.Free;
          AddressObj := nil;
        end;*)

        Cells[2, i + 1] := ENPostList.list[i].provinceName; //Область
        Cells[3, i + 1] := ENPostList.list[i].regionName; //Район
        Cells[4, i + 1] := ENPostList.list[i].cityName; //Населений пункт
        if ENPostList.list[i].cityTypeName <> '' then
          Cells[4, i + 1] :=
            ENPostList.list[i].cityTypeName + ' ' + Cells[4, i + 1];
        Cells[5, i + 1] := ENPostList.list[i].streetName; //Вулиця
        if ENPostList.list[i].streetTypeName <> '' then
          Cells[5, i + 1] :=
            ENPostList.list[i].streetTypeName + ' ' + Cells[5, i + 1];
        Cells[6, i + 1] := ENPostList.list[i].locationHouse; //№ вул.

        pstAddrLastRow := i + 1;
        sgAddresses.RowCount := pstAddrLastRow + 1;
      end;
  pstAddrColCount := pstAddrColCount + 1;
  sgAddresses.Row := 1;
end;


procedure TfrmENLine10Edit.btnEvaluateTechnicalStatusClick(Sender: TObject);
var
  TempENObjectsTechnicalStatus: ENObjectsTechnicalStatusControllerSoapPort;
begin
  inherited;
  if ENLine10Obj = nil then Exit;
  if ENLine10Obj.code = Low(Integer) then Exit;


  if (DialogState = dsEdit) or (DialogState = dsInsert) then
  if not NoBlankValues([ edtTotalCountArmored, edtTotalCountWood, edtTotalLengthCable,
          edtLengthToReconstruct, edtTotalCountInsulator, edtTotalCountTraverse, edtBaseDistance ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Exit;
  end
  else
  begin

    if ( edtTotalCountArmored.Text <> '' ) then
      ENObjectsTechnicalStatusObj.totalCountArmored := StrToInt(edtTotalCountArmored.Text)
    else
      ENObjectsTechnicalStatusObj.totalCountArmored := Low(Integer);

    if ( edtTotalCountWood.Text <> '' ) then
      ENObjectsTechnicalStatusObj.totalCountWood := StrToInt(edtTotalCountWood.Text)
    else
      ENObjectsTechnicalStatusObj.totalCountWood := Low(Integer);

    ENObjectsTechnicalStatusObj.totalLengthCable := GetTXSDecimalFromTEdit(edtTotalLengthCable);

    if ( edtTotalCountInsulator.Text <> '' ) then
      ENObjectsTechnicalStatusObj.totalCountInsulator := StrToInt(edtTotalCountInsulator.Text)
    else
      ENObjectsTechnicalStatusObj.totalCountInsulator := Low(Integer);

    if ( edtTotalCountTraverse.Text <> '' ) then
      ENObjectsTechnicalStatusObj.totalCountTraverse := StrToInt(edtTotalCountTraverse.Text)
    else
      ENObjectsTechnicalStatusObj.totalCountTraverse := Low(Integer);

    ENObjectsTechnicalStatusObj.baseDistance := GetTXSDecimalFromTEdit(edtBaseDistance);

    ENObjectsTechnicalStatusObj.lengthToReconstruct := GetTXSDecimalFromTEdit(edtLengthToReconstruct);
    
    TempENObjectsTechnicalStatus := HTTPRIOENObjectsTechnicalStatus as ENObjectsTechnicalStatusControllerSoapPort;
    TempENObjectsTechnicalStatus.add(ENObjectsTechnicalStatusObj);
    LoadTechnicalStatus(Sender);
  end;
end;


procedure TfrmENLine10Edit.btnGeographClearClick(Sender: TObject);
begin
  ENLine10Obj.element.geoDepartmentRef.code := LOW_INT;
  edtGeograph.Text := '';

end;

procedure TfrmENLine10Edit.btnGeographClick(Sender: TObject);
var
   frmENGeographicDepartmentShow: TfrmENGeographicDepartmentShow;
   Filter : ENGeographicDepartmentFilter;
   selected : ENGeographicDepartmentShort;
begin
  Filter := ENGeographicDepartmentFilter.Create;
  SetNullIntProps(Filter);
  SetNullXSProps(Filter);
//  if renCode <> 0 then
//
//   Filter.conditionSQL := ' ENGEOGRAPHICDEPARTMENT.CODE in ( select ee.geodepartmentrefcode ' +
//                          ' from engeodep2endepartment ee '+
//                          ' where ee.departmentrefcode  = ' + IntToStr(renCode) + ')';

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
                 ENLine10Obj.element.geoDepartmentRef.code := selected.code;
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

procedure TfrmENLine10Edit.btnPrintClick(Sender: TObject);
var
  argNames, args: EnergyProController.ArrayOfString;
  reportName: String;
begin
  inherited;
  if ENLine10Obj.element = nil then Exit;
  if ENLine10Obj.element.code = Low(Integer) then Exit;

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'elementCode';
  args[0] := IntToStr(ENLine10Obj.element.code);

  reportName := 'TechnicalStatus/technicalStatusLine';
  makeReport(reportName, argNames, args, 'xls');
end;


procedure TfrmENLine10Edit.LoadCCElement();
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
  begin
     sgCCElementData.Cells[j,i]:='';
     if sgCCElementData.CellControls[j,i]<>nil then sgCCElementData.CellControls[j,i].Destroy;
  end;

  if (ENLine10Obj.element=nil) or (ENLine10Obj.element.code=Low(Integer)) then Exit;

  TempCCElementData :=  HTTPRIOCCElementData as CCElementDataControllerSoapPort;

  {ENVOLTAGECLASS_150 = 1;
  ENVOLTAGECLASS_35  = 2;
  ENVOLTAGECLASS_10  = 3;
  ENVOLTAGECLASS_6   = 4;}

  ccElementFilter := CCElementDataFilter.Create;
  SetNullIntProps(ccElementFilter);
  SetNullXSProps(ccElementFilter);
  ccElementFilter.elementCode:=ENLine10Obj.element.code;
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

        CellControls[5,i+1] := TButton.Create(sgCCElementData);
        TButton(CellControls[5,i+1]).Parent := sgCCElementData;
        TButton(CellControls[5,i+1]).Tag := i+1;
        TButton(CellControls[5,i+1]).OnClick := OpenSLAMO;
        TButton(CellControls[5,i+1]).Caption := 'Открыть';
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

procedure TfrmENLine10Edit.LoadCCDamageLog();
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

  if (ENLine10Obj.element=nil) or (ENLine10Obj.element.code=Low(Integer)) then Exit;

  TempCCDamageLog :=  HTTPRIOCCDamageLog as CCDamageLogControllerSoapPort;

  damFilter := CCDamageLogFilter.Create;
  SetNullIntProps(damFilter);
  SetNullXSProps(damFilter);
  damFilter.conditionSQL:=
      ' CCDamageLog.statuscode in (0,1,2,3,6,10,11) '+
      ' and CCDamageLog.subtyperefcode=32 '+
      ' and CCDamageLog.departmentrefcode=0 '+
      ' and ('+
      '   CCDamageLog.nodecode in (select n2e.nodecode from ccnode2enelement n2e where n2e.elementcode='+IntToStr(ENLine10Obj.element.code)+')'+
      '   or '+
      '   CCDamageLog.nodecode in (select g.code from ccnodegroup g where g.parentnormalcode in '+
      '     (select n2e.nodecode from ccnode2enelement n2e where n2e.elementcode='+IntToStr(ENLine10Obj.element.code)+'))'+
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

        // Подсветка места отключения
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

procedure TfrmENLine10Edit.OpenSLAMO(Sender: TObject);
var
  TempCCElementData: CCElementDataControllerSoapPort;
  TempCCFeeder: CCFeederControllerSoapPort;
  CCFeederObj: CCFeeder;
begin
  TempCCElementData := HTTPRIOCCElementData as CCElementDataControllerSoapPort;
  TempCCFeeder:=HTTPRIOCCFeeder as CCFeederControllerSoapPort;

  sgCCElementData.Row:=TButton(Sender).Tag;

  try
    CCElementDataObj := TempCCElementData.getObject(StrToInt(sgCCElementData.Cells[0,sgCCElementData.Row]));
  except
    on EConvertError do Exit;
  end;

  CCFeederObj:=TempCCFeeder.getObject(CCElementDataObj.code);

  if CCFeederObj=nil then Exit;

  frmTopologyF10Edit:=TfrmTopologyF10Edit.Create(Application, fmNormal);
  frmTopologyF10Edit.CCFeederObj:=CCFeederObj;
  try
    frmTopologyF10Edit.ShowModal;
  finally
    frmTopologyF10Edit.Free;
    frmTopologyF10Edit:=nil;
  end;
end;


procedure TfrmENLine10Edit.LoadTechnicalStatus(Sender: TObject);
var
  i: Integer;
  TempENObjectsTechnicalStatus: ENObjectsTechnicalStatusControllerSoapPort;
  technicalStatusFilter: ENObjectsTechnicalStatusFilter;
  technicalStatusArr: ENObjectsTechnicalStatusController.ArrayOfInteger;
  settingsFilter: ENSettingsFilter;
  TempENSettings: ENSettingsControllerSoapPort;
  ENSettingsList: ENSettingsShortList;
begin
  if ENLine10Obj = nil then Exit;
  if ENLine10Obj.code = Low(Integer) then Exit;

  SetGridHeaders(ENSettingsHeaders, sgENSettings.ColumnHeaders);
  TempENObjectsTechnicalStatus := HTTPRIOENObjectsTechnicalStatus as ENObjectsTechnicalStatusControllerSoapPort;

  technicalStatusFilter := ENObjectsTechnicalStatusFilter.Create;
  SetNullIntProps(technicalStatusFilter);
  SetNullXSProps(technicalStatusFilter);
  technicalStatusFilter.elementRef := ENElementRef.Create;
  technicalStatusFilter.elementRef.code := ENLine10Obj.element.code;

  technicalStatusArr := TempENObjectsTechnicalStatus.getScrollableFilteredCodeArray(technicalStatusFilter, 0, -1);
  if High(technicalStatusArr) > -1 then
  begin
    try
      ENObjectsTechnicalStatusObj := TempENObjectsTechnicalStatus.getObject(technicalStatusArr[0]);
    except
      on EConvertError do Exit;
    end;

    if ENObjectsTechnicalStatusObj <> nil then
    begin

      if ( ENObjectsTechnicalStatusObj.totalCountArmored <> Low(Integer) ) then
        edtTotalCountArmored.Text := IntToStr(ENObjectsTechnicalStatusObj.totalCountArmored)
      else
        edtTotalCountArmored.Text := '';

      if ( ENObjectsTechnicalStatusObj.defectCountArmored <> Low(Integer) ) then
        edtDefectCountArmored.Text := IntToStr(ENObjectsTechnicalStatusObj.defectCountArmored)
      else
        edtDefectCountArmored.Text := '';

      if ( ENObjectsTechnicalStatusObj.totalCountWood <> Low(Integer) ) then
        edtTotalCountWood.Text := IntToStr(ENObjectsTechnicalStatusObj.totalCountWood)
      else
        edtTotalCountWood.Text := '';

      if ( ENObjectsTechnicalStatusObj.defectCountWood <> Low(Integer) ) then
        edtDefectCountWood.Text := IntToStr(ENObjectsTechnicalStatusObj.defectCountWood)
      else
        edtDefectCountWood.Text := '';

      SetTXSDecimalForTEdit(edtTotalLengthCable, ENObjectsTechnicalStatusObj.totalLengthCable);
      SetTXSDecimalForTEdit(edtDefectLengthtCable, ENObjectsTechnicalStatusObj.defectLengthtCable);

      if ( ENObjectsTechnicalStatusObj.totalCountInsulator <> Low(Integer) ) then
        edtTotalCountInsulator.Text := IntToStr(ENObjectsTechnicalStatusObj.totalCountInsulator)
      else
        edtTotalCountInsulator.Text := '';

      if ( ENObjectsTechnicalStatusObj.defectCountInsulator <> Low(Integer) ) then
        edtDefectCountInsulator.Text := IntToStr(ENObjectsTechnicalStatusObj.defectCountInsulator)
      else
        edtDefectCountInsulator.Text := '';

      if ( ENObjectsTechnicalStatusObj.totalCountTraverse <> Low(Integer) ) then
        edtTotalCountTraverse.Text := IntToStr(ENObjectsTechnicalStatusObj.totalCountTraverse)
      else
        edtTotalCountTraverse.Text := '';

      if ( ENObjectsTechnicalStatusObj.defectCountTraverse <> Low(Integer) ) then
        edtDefectCountTraverse.Text := IntToStr(ENObjectsTechnicalStatusObj.defectCountTraverse)
      else
        edtDefectCountTraverse.Text := '';

      SetTXSDecimalForTEdit(edtBaseDistance, ENObjectsTechnicalStatusObj.baseDistance);
      SetTXSDecimalForTEdit(edtVKDI, ENObjectsTechnicalStatusObj.vKDI);
      SetTXSDecimalForTEdit(edtVKDP, ENObjectsTechnicalStatusObj.vKDP);
      SetTXSDecimalForTEdit(edtVKDO, ENObjectsTechnicalStatusObj.vKDO);
      SetTXSDecimalForTEdit(edtVKD, ENObjectsTechnicalStatusObj.vKD);
      SetTXSDecimalForTEdit(edtMaxFallPower, ENObjectsTechnicalStatusObj.maxFallPower);
      SetTXSDecimalForTEdit(edtLengthToReconstruct, ENObjectsTechnicalStatusObj.lengthToReconstruct);

    end;
  end else
  begin
    ENObjectsTechnicalStatusObj := ENObjectsTechnicalStatus.Create;
    SetNullIntProps(ENObjectsTechnicalStatusObj);
    SetNullXSProps(ENObjectsTechnicalStatusObj);

    ENObjectsTechnicalStatusObj.elementRef := ENElementRef.Create;
    ENObjectsTechnicalStatusObj.elementRef.code := ENLine10Obj.element.code;

    // определение расстояния от базы обслуживания до ПС...
    // edtBaseDistance.Text := TempENObjectsTechnicalStatus
    //SetTXSDecimalForTEdit(edtBaseDistance, TempENObjectsTechnicalStatus.getBaseDistance(ENLine10Obj.code));
    if DialogState <> dsView then
      getBaseDistance;
  end;


  TempENSettings := HTTPRIOENSettings as ENSettingsControllerSoapPort;
  settingsFilter := ENSettingsFilter.Create;
  SetNullIntProps(settingsFilter);
  SetNullXSProps(settingsFilter);
  settingsFilter.conditionSQL := 'ensettings.code in ( ' + IntToStr(TECHNICALSTATUS_TRANSFERTARIFF)
      + ', ' + IntToStr(TECHNICALSTATUS_FINE) + ', ' + IntToStr(TECHNICALSTATUS_DISTRIBUTIONTARIFF)
      + ', ' + IntToStr(TECHNICALSTATUS_BLINECAPEX) + ' )';

  ENSettingsList := TempENSettings.getScrollableFilteredList(settingsFilter, 0, -1);
  LastCount := High(ENSettingsList.list);

  if LastCount > -1 then
     sgENSettings.RowCount:=LastCount+2
  else
     sgENSettings.RowCount:=2;

   with sgENSettings do
    for i:=0 to LastCount do
      begin
        if ENSettingsList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENSettingsList.list[i].code)
        else
          Cells[0,i+1] := '';
        Cells[1,i+1] := ENSettingsList.list[i].comment;
        Cells[2,i+1] := ENSettingsList.list[i].currentValue;

        LastRow:=i+1;
        sgENSettings.RowCount:=LastRow+1;
      end;

    ColCount:=ColCount+1;
    sgENSettings.Row:=1;

end;


end.
