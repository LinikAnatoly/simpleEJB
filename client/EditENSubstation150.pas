unit EditENSubstation150;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls,
    Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
    GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons, EnergyproController,
    EnergyproController2, ENSubstation150Controller, AdvObj,
    ENGauge150Controller, EditENPriconnectionData,ENLine150Controller, ExtCtrls,
    ENEstimateItemController, jpeg, CCElementDataController,
    IdFTP, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
    IdExplicitTLSClientServerBase, ShellAPI, TB2Item, TB2Dock, TB2Toolbar,
    CCDamageLogController, CCGlobal, CCDMReportUnit, CCReportController;

type
    TfrmENSubstation150Edit = class(TDialogForm)
    lblOperativeService : TLabel;
    edtOperativeService: TEdit;
    lblRepairService : TLabel;
    edtRepairService: TEdit;
    HTTPRIOENSubstation150: THTTPRIO;
    pcSubstation150: TPageControl;
    tsSubstation150Main: TTabSheet;
    tsPowerTrans: TTabSheet;
    pcSubstationData: TPageControl;
    tsSubstation150MainBuild: TTabSheet;
    tsSubstation150MainData: TTabSheet;
    tsSubstation150AddBuild: TTabSheet;
    tsSubstation150AddData: TTabSheet;
    lblName: TLabel;
    edtName: TEdit;
    lblProjectPower: TLabel;
    edtProjectPower: TEdit;
    lblEPVoltageNominalName: TLabel;
    edtEPVoltageNominalName: TEdit;
    spbEPVoltageNominal: TSpeedButton;
    spbEPRen: TSpeedButton;
    edtEPRenName: TEdit;
    lblEPRenName: TLabel;
    lblInvNumber: TLabel;
    edtInvNumber: TEdit;
    edtBuhName: TEdit;
    lblBuhName: TLabel;
    lblKruSerial: TLabel;
    lblOperativeIConst: TLabel;
    lblOperativeIVar: TLabel;
    lblBattery: TLabel;
    edtBattery: TMemo;
    edtOperativeIVar: TEdit;
    edtOperativeIConst: TEdit;
    edtKruSerial: TEdit;
    lblORU: TLabel;
    lblOPUType: TLabel;
    lblOPUMaterial: TLabel;
    lblOPUCount: TLabel;
    lblZRUBuildingType: TLabel;
    lblZRUBuildingMaterial: TLabel;
    lblZRUBasementType: TLabel;
    lblZRUBasementMaterial: TLabel;
    lblZRUCount: TLabel;
    lblBasementTransformersType: TLabel;
    lblBasementTransformersMaterial: TLabel;
    lblBasementTransformersCount: TLabel;
    lblSquareInFence: TLabel;
    lblWaterHole: TLabel;
    lblWaterNet: TLabel;
    lblCanalizationSink: TLabel;
    lblCanalizationLocal: TLabel;
    edtORU: TMemo;
    edtOPUType: TEdit;
    edtOPUMaterial: TEdit;
    edtOPUCount: TEdit;
    edtZRUBuildingType: TEdit;
    edtZRUBuildingMaterial: TEdit;
    edtZRUBasementType: TEdit;
    edtZRUBasementMaterial: TEdit;
    edtZRUCount: TEdit;
    edtBasementTransformersType: TEdit;
    edtBasementTransformersMaterial: TEdit;
    edtBasementTransformersCount: TEdit;
    edtSquareInFence: TEdit;
    edtWaterHole: TEdit;
    edtWaterNet: TEdit;
    edtCanalizationSink: TEdit;
    edtCanalizationLocal: TEdit;
    lblOilStoreData: TLabel;
    lblOilChannelData: TLabel;
    lblOilCatcherData: TLabel;
    lblRevisionDeviceData: TLabel;
    lblPlumbingData: TLabel;
    lblCanalizationData: TLabel;
    lblHeatingData: TLabel;
    lblFencingData: TLabel;
    lblConnectionData: TLabel;
    edtOilStoreData: TMemo;
    edtOilChannelData: TMemo;
    edtOilCatcherData: TMemo;
    edtRevisionDeviceData: TMemo;
    edtPlumbingData: TMemo;
    edtCanalizationData: TMemo;
    edtHeatingData: TMemo;
    edtFencingData: TMemo;
    edtConnectionData: TMemo;
    lblSeparatorData: TLabel;
    lblShorCircuitData: TLabel;
    lblLoadingData: TLabel;
    lblArchCoilData: TLabel;
    edtSeparatorData: TMemo;
    edtShorCircuitData: TMemo;
    edtLoadingData: TMemo;
    edtArchCoilData: TMemo;
    Button1: TButton;
    Button2: TButton;
    spbOSSelect: TSpeedButton;
    tsRegistrationCard: TTabSheet;
    pcCardData: TPageControl;
    tsGeneral: TTabSheet;
    lblMolCode: TLabel;
    spbPlanMOLMaster: TSpeedButton;
    lblMolName: TLabel;
    lblSizNorm: TLabel;
    edtMolCode: TEdit;
    edtMolName: TEdit;
    sgTKMaterials: TAdvStringGrid;
    tsIssueSZ: TTabSheet;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    HTTPRIOTKMaterials: THTTPRIO;
    HTTPRIOTKTechCard: THTTPRIO;
    lblSizCode: TLabel;
    edtSizCode: TEdit;
    tsPlans: TTabSheet;
    sgENPlanWork: TAdvStringGrid;
    HTTPRIOENPlanWork: THTTPRIO;
    sgIssue: TAdvStringGrid;
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
    tlbENSubst150PowerTrans: TToolBar;
    sgENSubst150PowerTrans: TAdvStringGrid;
    HTTPRIOENSubst150PowerTrans: THTTPRIO;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    tsOwnTrans: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    sgENSubst150OwnTrans: TAdvStringGrid;
    HTTPRIOENSubst150OwnTrans: THTTPRIO;
    tsVoltTrans: TTabSheet;
    ToolBar2: TToolBar;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    sgENSubst150VoltTrans: TAdvStringGrid;
    HTTPRIOENSubst150VoltTrans: THTTPRIO;
    tsBattery: TTabSheet;
    ToolBar3: TToolBar;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    ToolButton27: TToolButton;
    ToolButton28: TToolButton;
    sgENSubst150Battery: TAdvStringGrid;
    HTTPRIOENSubst150Battery: THTTPRIO;
    tsDischarger: TTabSheet;
    ToolBar4: TToolBar;
    ToolButton29: TToolButton;
    ToolButton30: TToolButton;
    ToolButton31: TToolButton;
    ToolButton32: TToolButton;
    ToolButton33: TToolButton;
    ToolButton34: TToolButton;
    ToolButton35: TToolButton;
    sgENSubst150Discharger: TAdvStringGrid;
    HTTPRIOENSubst150Discharger: THTTPRIO;
    tsCell150: TTabSheet;
    tsCell35: TTabSheet;
    tsCell10: TTabSheet;
    ToolBar5: TToolBar;
    ToolButton36: TToolButton;
    ToolButton37: TToolButton;
    ToolButton38: TToolButton;
    ToolButton39: TToolButton;
    ToolButton40: TToolButton;
    ToolButton41: TToolButton;
    ToolButton42: TToolButton;
    ToolBar6: TToolBar;
    ToolButton43: TToolButton;
    ToolButton44: TToolButton;
    ToolButton45: TToolButton;
    ToolButton46: TToolButton;
    ToolButton47: TToolButton;
    ToolButton48: TToolButton;
    ToolButton49: TToolButton;
    ToolBar7: TToolBar;
    ToolButton50: TToolButton;
    ToolButton51: TToolButton;
    ToolButton52: TToolButton;
    ToolButton53: TToolButton;
    ToolButton54: TToolButton;
    ToolButton55: TToolButton;
    ToolButton56: TToolButton;
    sgENSubst150Cell150: TAdvStringGrid;
    sgENSubst150Cell35: TAdvStringGrid;
    sgENSubst150Cell10: TAdvStringGrid;
    HTTPRIOENSubst150Cell: THTTPRIO;
    tsWriteOffSz: TTabSheet;
    sgWriteOffSz: TAdvStringGrid;
    tsSubstation150Gauge: TTabSheet;
    ToolBar18: TToolBar;
    ToolButton57: TToolButton;
    ToolButton58: TToolButton;
    ToolButton59: TToolButton;
    ToolButton60: TToolButton;
    ToolButton61: TToolButton;
    sgENGauge150: TAdvStringGrid;
    HTTPRIOENGauge150: THTTPRIO;
    btnPricconectionData: TButton;
    lblFeeder35: TLabel;
    edtLine150: TEdit;
    sbLine150: TSpeedButton;
    HTTPRIOENLine150: THTTPRIO;
    actViewLinkStation: TAction;
    actAddLinkStation: TAction;
    actDeleteLinkStation: TAction;
    actEditLinkStation: TAction;
    actUpdateLinkStation: TAction;
    actFilterLinkStation: TAction;
    actNoFilterLinkStation: TAction;
    actSchemeListLinkStation: TAction;
    grpENSubst150PowerTrans: TGroupBox;
    grpENSubstation150Link: TGroupBox;
    ToolBar8: TToolBar;
    tlBtnViewLinkStation: TToolButton;
    ToolButton63: TToolButton;
    tlBtnDeleteLinkStation: TToolButton;
    tlBtnEditLinkStation: TToolButton;
    tlBtnUpdateLinkStation: TToolButton;
    tlBtnFilterLinkStation: TToolButton;
    tlBtnNoFilterLinkStation: TToolButton;
    tlBtnSchemeListLinkStation: TToolButton;
    sgENSubstation150: TAdvStringGrid;
    HTTPRIOENSubst2PowTrans: THTTPRIO;
    actSubst2PowTransLink: TAction;
    actSubst2PowTransUnLink: TAction;
    tlBtnSubst2PowTransLink: TToolButton;
    tlBtnSubst2PowTransUnLink: TToolButton;
    actPowTrans2SubstLink: TAction;
    actPowTrans2SubstUnLink: TAction;
    tlBtnPowTrans2SubstLink: TToolButton;
    tlBtnPowTrans2SubstUnLink: TToolButton;
    actLoadS150Reserv: TAction;
    actLoadS35Reserv: TAction;
    HTTPRIOCNPack: THTTPRIO;
    pnlLegend: TPanel;
    Shape1: TShape;
    Label2: TLabel;
    ppIssue: TPopupMenu;
    miWriteOffOnlyEnergyNET: TMenuItem;
    HTTPRIOENEstimateItem: THTTPRIO;
    actIssue: TActionList;
    actWriteOffOnlyEnergyNET: TAction;
    spbFINExecutor: TSpeedButton;
    edtFINExecutorName: TEdit;
    lblExecuter: TLabel;
    tsCCElement: TTabSheet;
    HTTPRIOCCElementData: THTTPRIO;
    sgCCElementData: TAdvStringGrid;
    grpStation150: TGroupBox;
    sgStationSupplier150: TAdvStringGrid;
    tlbStationSupplier150: TToolBar;
    tlBtnStationSupplier150_Update: TToolButton;
    actStationSupplier150_Update: TAction;
    actStationSupplier150_View: TAction;
    tlBtnStationSupplier150_View: TToolButton;
    HTTPRIOENSubstation150Supplier: THTTPRIO;
    grpStation35: TGroupBox;
    sgStationEnergized35: TAdvStringGrid;
    tlbStationEnergized35: TToolBar;
    tlBtnStationEnergized35_Update: TToolButton;
    tlBtnStationEnergized35_View: TToolButton;
    actStationEnergized35_Update: TAction;
    actStationEnergized35_View: TAction;
    HTTPRIOENSubstation150Energized: THTTPRIO;
    grpStation04: TGroupBox;
    sgENSubstation04: TAdvStringGrid;
    tlbStation04: TToolBar;
    tlBtnStationEnergized04_Update: TToolButton;
    tlBtnStationEnergized04_View: TToolButton;
    actStationEnergized04_Update: TAction;
    actStationEnergized04_View: TAction;
    HTTPRIOENSubstation04: THTTPRIO;
    grpAirLineSupplier150_35: TGroupBox;
    grpAirLineEnergized35: TGroupBox;
    ToolBar9: TToolBar;
    tlBtnAirLineSupplier150_35_Update: TToolButton;
    ToolBar11: TToolBar;
    tlBtnAirLineEnergized35_Update: TToolButton;
    sgENLineSupplier150_35: TAdvStringGrid;
    HTTPRIOENLineSupplier150_35: THTTPRIO;
    actAirLineSupplier150_35_Update: TAction;
    actAirLineSupplier150_35_View: TAction;
    tlBtnAirLineSupplier150_35_View: TToolButton;
    actAirLineEnergized35_Update: TAction;
    actAirLineEnergized35_View: TAction;
    tlBtnAirLineEnergized35_View: TToolButton;
    sgENLineEnergized35: TAdvStringGrid;
    HTTPRIOENLineEnergized35: THTTPRIO;
    grpAirLineEnergized10: TGroupBox;
    ToolBar13: TToolBar;
    tlBtnAirLineEnergized10_Update: TToolButton;
    tlBtnactAirLineEnergized10_View: TToolButton;
    sgENLine10: TAdvStringGrid;
    actAirLineEnergized10_Update: TAction;
    actactAirLineEnergized10_View: TAction;
    HTTPRIOENLine10: THTTPRIO;
    edtCoeffCategory: TEdit;
    lblCoeffCategory: TLabel;
    tsConstructionPart: TTabSheet;
    pcVRUZRU: TPageControl;
    tsVRU150: TTabSheet;
    tsVRUZRU35: TTabSheet;
    tsVRUZRU610: TTabSheet;
    ToolBar10: TToolBar;
    ToolButton62: TToolButton;
    ToolButton64: TToolButton;
    ToolButton65: TToolButton;
    ToolButton66: TToolButton;
    ToolButton67: TToolButton;
    ToolButton68: TToolButton;
    ToolButton69: TToolButton;
    sgENSubst150VRU150: TAdvStringGrid;
    HTTPRIOENSubst150VRUZRU: THTTPRIO;
    ToolBar12: TToolBar;
    ToolButton70: TToolButton;
    ToolButton71: TToolButton;
    ToolButton72: TToolButton;
    ToolButton73: TToolButton;
    ToolButton74: TToolButton;
    ToolButton75: TToolButton;
    ToolButton76: TToolButton;
    sgENSubst150VRUZRU35: TAdvStringGrid;
    ToolBar14: TToolBar;
    ToolButton77: TToolButton;
    ToolButton78: TToolButton;
    ToolButton79: TToolButton;
    ToolButton80: TToolButton;
    ToolButton81: TToolButton;
    ToolButton82: TToolButton;
    ToolButton83: TToolButton;
    sgENSubst150VRUZRU6_10: TAdvStringGrid;
    gbSafetyPerformance: TGroupBox;
    lblF1: TLabel;
    lblF2: TLabel;
    lblF3: TLabel;
    lblF4: TLabel;
    lblF5: TLabel;
    lblF6: TLabel;
    lblF7: TLabel;
    edtF1: TEdit;
    edtF2: TEdit;
    edtF3: TEdit;
    edtF4: TEdit;
    edtF5: TEdit;
    edtF6: TEdit;
    edtF7: TEdit;
    lblF1_1: TLabel;
    lblF2_2: TLabel;
    lblF3_3: TLabel;
    lblF4_4: TLabel;
    lblF5_5: TLabel;
    lblF6_6: TLabel;
    lblF7_7: TLabel;
    lblFF: TLabel;
    lblFF1: TLabel;
    lblFF2: TLabel;
    lblFF3: TLabel;
    lblFF4: TLabel;
    lblGeograph: TLabel;
    edtGeograph: TEdit;
    btnGeograph: TSpeedButton;
    btnGeographClear: TSpeedButton;
    HTTPRIOENGeographicDepartment: THTTPRIO;
    HTTPRIOENEPRen: THTTPRIO;
    HTTPRIOENElement: THTTPRIO;
    tsAttachments: TTabSheet;
    sgENDocAttachment: TAdvStringGrid;
    ToolBar19: TToolBar;
    btnLoadAttachment: TToolButton;
    btnAddAttachments: TToolButton;
    btnDeleteAttachment: TToolButton;
    btnUpdateAttachments: TToolButton;
    pmAttachment: TPopupMenu;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    ActionAttachment: TActionList;
    actLoadAttachment: TAction;
    actAddAttachment: TAction;
    actDeleteAttachment: TAction;
    actUpdateAttachments: TAction;
    HTTPRIOENDocAttachment: THTTPRIO;
    tsCCDamageLog: TTabSheet;
    HTTPRIOCCDamageLog: THTTPRIO;
    sgCCDamageLog: TAdvStringGrid;
    tbDamages: TTBToolbar;
    tbiDamagesXLS: TTBItem;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure spbEPVoltageNominalClick(Sender : TObject);
    procedure spbENElementClick(Sender : TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbOSSelectClick(Sender: TObject);
    procedure pcSubstationDataChange(Sender: TObject);
    procedure spbPlanMOLMasterClick(Sender: TObject);
    procedure pcCardDataChange(Sender: TObject);
    procedure sgENPlanWorkDblClick(Sender: TObject);
    procedure pcSubstation150Change(Sender: TObject);
    procedure actAa(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure btnPricconectionDataClick(Sender: TObject);
    procedure sbLine150Click(Sender: TObject);
    procedure actUpdateLinkStationExecute(Sender: TObject);
    procedure actSchemeListLinkStationExecute(Sender: TObject);
    procedure sgENSubst150PowerTransRowChanging(Sender: TObject; OldRow,
      NewRow: Integer; var Allow: Boolean);
    procedure clearLinkStation;
    procedure actSubst2PowTransLinkExecute(Sender: TObject);
    procedure actSubst2PowTransUnLinkExecute(Sender: TObject);
    procedure sgENSubstation150RowChanging(Sender: TObject; OldRow,
      NewRow: Integer; var Allow: Boolean);
    procedure actPowTrans2SubstLinkExecute(Sender: TObject);
    procedure actPowTrans2SubstUnLinkExecute(Sender: TObject);
    procedure WriteOffOnlyEnergyNET(Sender: TObject);
    procedure spbFINExecutorClick(Sender: TObject);
    procedure LoadCCElement();
    procedure LoadCCDamageLog();
    procedure sgCCElementDataDblClick(Sender: TObject);
    procedure actStationSupplier150_UpdateExecute(Sender: TObject);
    procedure actStationEnergized35_UpdateExecute(Sender: TObject);
    procedure actStationEnergized04_UpdateExecute(Sender: TObject);
    procedure actAirLineSupplier150_35_UpdateExecute(Sender: TObject);
    procedure actAirLineEnergized35_UpdateExecute(Sender: TObject);
    procedure actAirLineEnergized10_UpdateExecute(Sender: TObject);
    procedure ToolButton64Click(Sender: TObject);
    procedure ToolButton65Click(Sender: TObject);
    procedure ToolButton62Click(Sender: TObject);
    procedure ToolButton67Click(Sender: TObject);
    procedure ToolButton66Click(Sender: TObject);
    procedure pcVRUZRUChange(Sender: TObject);
    procedure btnGeographClick(Sender: TObject);
    procedure btnGeographClearClick(Sender: TObject);
    procedure actUpdateAttachmentsExecute(Sender: TObject);
    procedure actDeleteAttachmentExecute(Sender: TObject);
    procedure actAddAttachmentExecute(Sender: TObject);
    procedure actLoadAttachmentExecute(Sender: TObject);
    procedure sgCCDamageLogDblClick(Sender: TObject);
    procedure tbiDamagesXLSClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadPowerTransList();
    procedure LoadOwnTransList();
    procedure LoadVoltTransList();
    procedure LoadBatteryList();
    procedure LoadDischargerList();
    procedure LoadCellList(aVoltageClass: Integer); overload;
    procedure LoadCellList(aTabSheet: TTabSheet); overload;
    procedure LoadGauge();
    function GetCellVoltageClassByTabSheet(aTabSheet: TTabSheet): Integer;
    function GetCellGridByTabSheet(aTabSheet: TTabSheet): TAdvStringGrid;

    procedure StationSupplier150_Energized35_Update(isSupplier: Boolean);
    procedure AirLineSupplier150_35_Energized35_Update (isSupplier: Boolean);
    procedure updateVRUZRU();
    procedure updateAttachments();            //Обновление списка вложений
  public
    { Public declarations }

  end;

var
  frmENSubstation150Edit: TfrmENSubstation150Edit;
  ENSubstation150Obj: ENSubstation150;
  ENLine150Code:Integer;
  operationLastCount , operationLastRow , operationColCount: Integer;
  selectedRow : Integer;

  TKMaterialsHeaders : array [1..5] of String =
    ('Код'
    ,'Найменування'
    ,'Од.вим.'
    ,'Кількість нормативна'
    ,'Кількість фактична'
    );
  ENPlanWorkHeaders: array [1..18] of String =
    ('Код'
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
  SizIssueHeaders : array [1..8] of String =
    ('Код.док'
    ,'Найменування'
    ,'Номенклатурний'
    ,'Од.вим.'
    ,'Номер документа'
    ,'Дата документа'
    ,'Кількість'
    ,'Партія'
    );
  SizWriteOffHeaders : array [1..7] of String =
    ('enestimateitemcode'
    ,'Найменування'
    ,'Номенклатурний'
    ,'Од.вим.'
    ,'Номер документа'
    ,'Дата документа'
    ,'Кількість'

    );
//  ENSubst150PowerTransHeaders: array [1..14] of String =
//    ( 'Код'
//    ,'Диспетч. наименование'
//    ,'Заводской номер'
//    ,'Напряжение ВН, кВ'
//    ,'Напряжение СН, кВ'
//    ,'Напряжение НН, кВ'
//    ,'Ток ВН, А'
//    ,'Ток СН, А'
//    ,'Ток НН, А'
//    ,'Мощность ВН, кВА'
//    ,'Мощность СН, кВА'
//    ,'Мощность НН, кВА'
//    ,'Примечание'
//    ,'Пользователь, внесший изменения'
//    );
//
//  ENSubst150OwnTransHeaders: array [1..6] of String =
//    ( 'Код'
//    ,'Диспетч. наименование'
//    ,'Заводской номер'
//    ,'Мощность, кВА'
//    ,'Примечание'
//    ,'Пользователь, внесший изменения'
//    );
//
//  ENSubst150VoltTransHeaders: array [1..5] of String =
//    ( 'Код'
//    ,'Диспетч. наименование'
//    ,'Заводской номер'
//    ,'Примечание'
//    ,'Пользователь, внесший изменения'
//    );
//
//  ENSubst150CellHeaders: array [1..5] of String =
//    ( 'Код'
//    ,'Диспетч. наименование присоединения'
//    ,'Заводской номер'
//    ,'Примечание'
//    ,'Пользователь, внесший изменения'
//    );
//
//  ENSubst150DischargerHeaders: array [1..5] of String =
//    ( 'Код'
//    ,'Диспетч. наименование'
//    ,'Заводской номер'
//    ,'Примечание'
//    ,'Пользователь, внесший изменения'
//    );
//
//  ENSubst150BatteryHeaders: array [1..7] of String =
//    ( 'Код'
//    ,'Диспетч. наименование'
//    ,'Заводской номер'
//    ,'Номинальное напряжение, В'
//    ,'Номинальная ёмкость, Ач'
//    ,'Примечание'
//    ,'Пользователь, внесший изменения'
//    );
  ENSubst150PowerTransHeaders: array [1..14] of String =
    ('Код'
    ,'Диспетчерское наименование'
    ,'Заводской номер'
    ,'Тип'
    ,'Класс напряжения'
    ,'Напряжение ВН, кВ'
    ,'Напряжение СН, кВ'
    ,'Напряжение НН, кВ'
    ,'Ток ВН, А'
    ,'Ток СН, А'
    ,'Ток НН, А'
    ,'Мощность ВН, кВА'
    ,'Мощность СН, кВА'
    ,'Мощность НН, кВА'
    );
  ENSubst150OwnTransHeaders: array [1..6] of String =
    ('Код'
    ,'Диспетч. наименование'
    ,'Заводской номер'
    ,'Тип'
    ,'Класс напряжения'
    ,'Мощность, кВА'
    );
  ENSubst150VoltTransHeaders: array [1..5] of String =
    ('Код'
    ,'Диспетч. наименование'
    ,'Заводской номер'
    ,'Тип'
    ,'Класс напряжения'
    );
  ENSubst150CellHeaders: array [1..5] of String =
    ('Код'
    ,'Диспетч. наименование присоединения'
    ,'Заводской номер'
    ,'Класс напряжения'
    ,'Примечание'
    );
  ENSubst150DischargerHeaders: array [1..5] of String =
    ('Код'
    ,'Диспетч. наименование'
    ,'Заводской номер'
    ,'Тип'
    ,'Класс напряжения'
    );
  ENSubst150BatteryHeaders: array [1..7] of String =
    ('Код'
    ,'Диспетч. наименование'
    ,'Заводской номер'
    ,'Тип батареи'
    ,'Тип подзаряд. ус-ва'
    ,'Номин. напряжение, В'
    ,'Номин. ёмкость, Ач'
    );
  ENGauge150Headers: array [1..6] of String =
    ('Код'
    ,'Название режимного замера'
    ,'Дата и время замера'
    ,'Режимный замер напряжения, кВ'
    ,'Режимный замер силы тока, А'
    ,'Потребление на собственные нужды, кВт'
    );
  ENSubstation150Headers: array [1..7] of String =
    ('Код'
    ,'Подстанция 35-150/6-10-35'
    ,'Проектная мощность, мВА'
    ,'Форма оперативного обслуживания'
    ,'Форма ремонтного обслуживания'
    ,'Бухгалтерское Подстанции 35-150/6-10-35'
    ,'Инвентарный №'
    );

    ENSubst150VRU150Headers: array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование '
          ,'Наименование'
          ,'Дата установки'
          ,'Примечание'
          ,'Пользователь, внесший изменения'
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

implementation

uses
  ShowEPVoltageNominal, ShowENElement, ENElementController, ShowENEPRen,
  OSTableController, ShowOStable, TKMaterialsController, TKTechCardController,
  ENDepartmentController, FINMolController, ShowFINMol,
  ENDepartment2EPRenController, Math, ENPlanWorkController, ENConsts,
  ENPlanWorkTypeController, DMReportsUnit, ShowENScheme, ENSchemeController,
  EditENPlanWork, ENSubst150PowerTransController, EditENSubst150PowerTrans,
  EditENSubst150OwnTrans, ENSubst150OwnTransController,
  EditENSubst150VoltTrans, ENSubst150VoltTransController,
  ENSubst150BatteryController, EditENSubst150Battery,
  ENSubst150DischargerController, EditENSubst150Discharger,
  ENSubst150CellController, EditENSubst150Cell, ENVoltageClassController,
  EditENGauge150, ShowENLine150, ENSubst2PowTransController,
  ShowENSubstation150, ShowENSubst150PowerTrans, Gauge150, CNPackController,
  ShowFINExecutorTree, FINExecutorController, EditCCElementData,
  ENSubstation04Controller, ENLine10Controller,
  ENSubst150VRUZRUController, EditENSubst150VRUZRU,
  ENSubst150VRUZRUTypeController, ShowENGeographicDepartment,
  ENGeographicDepartmentController,
  ENDocAttachmentController, EditDFDocAttachment,
  ENDocAttachmentServerController, Globals, ENDocAttachmentStatusController,
  EditCCDamageLog;

{$R *.dfm}

var vStationCode, vENSubst150PowerTransObjCode, vStationLinkCode,
  ColCount, LastCount: Integer; LastRow: Integer = 1;


procedure TfrmENSubstation150Edit.FormShow(Sender: TObject);
var
  i: Integer;
  TempENLine150 :ENLine150ControllerSoapPort;
  l150:ENLine150;
  TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
  ENGeographicDepartmentObj : ENGeographicDepartment;
  eList : ENElementShortList;
  TempENElement: ENElementControllerSoapPort;
  eFilter : ENElementFilter;
begin

  tsSubstation150Gauge.TabVisible := False;
  vStationCode := ENSubstation150Obj.code;
  TempENLine150 := HTTPRIOENLine150 as ENLine150ControllerSoapPort;
  FormatSettings.DecimalSeparator := '.';
  SetGridHeaders(ENSubst150PowerTransHeaders, sgENSubst150PowerTrans.ColumnHeaders);
  SetGridHeaders(ENSubst150OwnTransHeaders, sgENSubst150OwnTrans.ColumnHeaders);
  SetGridHeaders(ENSubst150VoltTransHeaders, sgENSubst150VoltTrans.ColumnHeaders);
  SetGridHeaders(ENSubst150CellHeaders, sgENSubst150Cell150.ColumnHeaders);
  SetGridHeaders(ENSubst150CellHeaders, sgENSubst150Cell35.ColumnHeaders);
  SetGridHeaders(ENSubst150CellHeaders, sgENSubst150Cell10.ColumnHeaders);
  SetGridHeaders(ENSubst150DischargerHeaders, sgENSubst150Discharger.ColumnHeaders);
  SetGridHeaders(ENSubst150BatteryHeaders, sgENSubst150Battery.ColumnHeaders);
  SetGridHeaders(ENGauge150Headers, sgENGauge150.ColumnHeaders);

  //SetIntStyle([edtYearBuild, edtYearWorkingStart]);
  SetFloatStyle([edtProjectPower, edtSizCode, edtCoeffCategory]);

  DisableControls([edtBuhName , edtGeograph ]);
  pcSubstation150.ActivePage := tsSubstation150Main;
  pcSubstationData.ActivePage := tsSubstation150MainData;

  gbSafetyPerformance.Visible := (DialogState = dsView) or (DialogState = dsEdit);
  SetIntStyle([edtF1, edtF2, edtF3, edtF4, edtF5, edtF6, edtF7]);
  DenyBlankValues([edtF1, edtF2, edtF3, edtF4, edtF5, edtF6, edtF7]);
  if (DialogState = dsInsert) then
  begin
    edtF1.Text := '0';
    edtF2.Text := '0';
    edtF3.Text := '0';
    edtF4.Text := '0';
    edtF5.Text := '0';
    edtF6.Text := '0';
    edtF7.Text := '0';
  end;


  ///// При инсерте прячем все вкладки, кроме основной
  if (DialogState = dsInsert) then
  begin
    for i:= 0 to pcSubstation150.PageCount - 1 do
      if pcSubstation150.Pages[i] <> tsSubstation150Main then
        pcSubstation150.Pages[i].TabVisible := false;

    tsRegistrationCard.TabVisible := false;
  end;
  /////

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
    begin
      DisableControls([
        edtEPVoltageNominalName, edtEPRenName, edtMolCode, edtMolName]);
      DenyBlankValues([edtName, edtEPRenName, edtEPVoltageNominalName,
        edtMolCode, edtMolName, edtCoeffCategory]);
    end;

  if (DialogState = dsView) then
    begin
      DisableControls([spbEPVoltageNominal, spbEPRen, spbOSSelect, spbPlanMOLMaster, spbFINExecutor]);
      DisableActions([actInsert, actDelete, actEdit,  actSubst2PowTransLink, 
        actSubst2PowTransUnLink, actPowTrans2SubstLink, actPowTrans2SubstUnLink]);
      DisableActions([actLoadAttachment,actDeleteAttachment,actUpdateAttachments],False);
        //actSchemeListLinkStation
    end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

   if ENSubstation150Obj.element.geoDepartmentRef <> nil then
      if ENSubstation150Obj.element.geoDepartmentRef.code <> LOW_INT then
       begin
          // geodept
            TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
          try
            ENGeographicDepartmentObj := TempENGeographicDepartment.getObject( ENSubstation150Obj.element.geoDepartmentRef.code );
            edtGeograph.Text := ENGeographicDepartmentObj.name;
          except
            on EConvertError do Exit;
          end;
       end;



    edtName.Text := ENSubstation150Obj.name;

    if ( ENSubstation150Obj.projectPower <> nil ) then
       edtProjectPower.Text := ENSubstation150Obj.projectPower.decimalString
    else
       edtProjectPower.Text := '';

    if ENSubstation150Obj.element <> nil then
           if (ENSubstation150Obj.element.renRef <> nil ) then
         begin
          TempENElement :=  HTTPRIOENElement as ENElementControllerSoapPort;
           eFilter := ENElementFilter.Create;
           SetNullIntProps(eFilter);
           SetNullXSProps(eFilter);
           eFilter.code := ENSubstation150Obj.element.code;
          eList := TempENElement.getScrollableFilteredList(eFilter,0,-1);
          edtEPRenName.Text :=  eList.list[0].renRefName;
         end
        else
          edtEPRenName.Text := ''
    else
       edtEPRenName.Text := '';

    if (ENSubstation150Obj.sizCode <> low(Integer)) then
       edtSizCode.Text := IntToStr(ENSubstation150Obj.sizCode)
    else
       edtSizCode.Text := '';

    edtOperativeService.Text := ENSubstation150Obj.operativeService; 
    edtRepairService.Text := ENSubstation150Obj.repairService; 
    edtBuhName.Text := ENSubstation150Obj.buhName;

     if (ENSubstation150Obj.enlinecode>0) then
       begin
         l150:=TempENLine150.getObject(ENSubstation150Obj.enlinecode);
          edtLine150.Text:=l150.name;
          ENLine150Code:=l150.code;
       end
       else begin
         edtLine150.Text:='';
          ENLine150Code:=Low(integer);
       end;


    edtInvNumber.Text := ENSubstation150Obj.invNumber;
    edtKruSerial.Text := ENSubstation150Obj.kruSerial; 
    if ( ENSubstation150Obj.operativeIConst <> nil ) then
       edtOperativeIConst.Text := ENSubstation150Obj.operativeIConst.decimalString
    else
       edtOperativeIConst.Text := ''; 
    if ( ENSubstation150Obj.operativeIVar <> nil ) then
       edtOperativeIVar.Text := ENSubstation150Obj.operativeIVar.decimalString
    else
       edtOperativeIVar.Text := ''; 
    MakeMultiline(edtBattery.Lines, ENSubstation150Obj.battery);
    MakeMultiline(edtORU.Lines, ENSubstation150Obj.ORU);
    edtOPUType.Text := ENSubstation150Obj.OPUType; 
    edtOPUMaterial.Text := ENSubstation150Obj.OPUMaterial; 
    if ( ENSubstation150Obj.OPUCount <> nil ) then
       edtOPUCount.Text := ENSubstation150Obj.OPUCount.decimalString
    else
       edtOPUCount.Text := ''; 
    edtZRUBuildingType.Text := ENSubstation150Obj.ZRUBuildingType; 
    edtZRUBuildingMaterial.Text := ENSubstation150Obj.ZRUBuildingMaterial; 
    edtZRUBasementType.Text := ENSubstation150Obj.ZRUBasementType; 
    edtZRUBasementMaterial.Text := ENSubstation150Obj.ZRUBasementMaterial; 
    if ( ENSubstation150Obj.ZRUCount <> nil ) then
       edtZRUCount.Text := ENSubstation150Obj.ZRUCount.decimalString
    else
       edtZRUCount.Text := ''; 
    edtBasementTransformersType.Text := ENSubstation150Obj.basementTransformersType; 
    edtBasementTransformersMaterial.Text := ENSubstation150Obj.basementTransformersMaterial; 
    if ( ENSubstation150Obj.basementTransformersCount <> nil ) then
       edtBasementTransformersCount.Text := ENSubstation150Obj.basementTransformersCount.decimalString
    else
       edtBasementTransformersCount.Text := ''; 
    if ( ENSubstation150Obj.squareInFence <> nil ) then
       edtSquareInFence.Text := ENSubstation150Obj.squareInFence.decimalString
    else
       edtSquareInFence.Text := ''; 
    if ( ENSubstation150Obj.waterHole <> nil ) then
       edtWaterHole.Text := ENSubstation150Obj.waterHole.decimalString
    else
       edtWaterHole.Text := ''; 
    if ( ENSubstation150Obj.waterNet <> nil ) then
       edtWaterNet.Text := ENSubstation150Obj.waterNet.decimalString
    else
       edtWaterNet.Text := ''; 
    if ( ENSubstation150Obj.canalizationSink <> nil ) then
       edtCanalizationSink.Text := ENSubstation150Obj.canalizationSink.decimalString
    else
       edtCanalizationSink.Text := ''; 
    if ( ENSubstation150Obj.canalizationLocal <> nil ) then
       edtCanalizationLocal.Text := ENSubstation150Obj.canalizationLocal.decimalString
    else
       edtCanalizationLocal.Text := ''; 
    MakeMultiline(edtOilStoreData.Lines, ENSubstation150Obj.oilStoreData);
    MakeMultiline(edtOilChannelData.Lines, ENSubstation150Obj.oilChannelData);
    MakeMultiline(edtOilCatcherData.Lines, ENSubstation150Obj.oilCatcherData);
    MakeMultiline(edtRevisionDeviceData.Lines, ENSubstation150Obj.revisionDeviceData);
    MakeMultiline(edtPlumbingData.Lines, ENSubstation150Obj.plumbingData);
    MakeMultiline(edtCanalizationData.Lines, ENSubstation150Obj.canalizationData);
    MakeMultiline(edtHeatingData.Lines, ENSubstation150Obj.heatingData);
    MakeMultiline(edtFencingData.Lines, ENSubstation150Obj.fencingData);
    MakeMultiline(edtConnectionData.Lines, ENSubstation150Obj.connectionData);
    MakeMultiline(edtSeparatorData.Lines, ENSubstation150Obj.separatorData);
    MakeMultiline(edtShorCircuitData.Lines, ENSubstation150Obj.shorCircuitData);
    MakeMultiline(edtLoadingData.Lines, ENSubstation150Obj.loadingData);
    MakeMultiline(edtArchCoilData.Lines, ENSubstation150Obj.archCoilData);

    edtEPVoltageNominalName.Text := ENSubstation150Obj.voltage.value.DecimalString;

    //edtENElementName.Text := ENSubstation150Obj.element.name;

    edtMolCode.Text := ENSubstation150Obj.molCode;
    edtMolName.Text := ENSubstation150Obj.molName;

    SetTXSDecimalForTEdit(edtCoeffCategory, ENSubstation150Obj.coeffCategory);

    if ENSubstation150Obj.element.finExecutor <> nil then
      if ENSubstation150Obj.element.finExecutor.code > LOW_INT then
       begin
         edtFINExecutorName.Text := ENSubstation150Obj.element.finExecutor.name;
       end;


    if Length(ENSubstation150Obj.safetyPerformance) > 0 then
    begin
      edtF1.Text := IntToStr(ENSubstation150Obj.safetyPerformance[0]);
      edtF2.Text := IntToStr(ENSubstation150Obj.safetyPerformance[1]);
      edtF3.Text := IntToStr(ENSubstation150Obj.safetyPerformance[2]);
      edtF4.Text := IntToStr(ENSubstation150Obj.safetyPerformance[3]);
      edtF5.Text := IntToStr(ENSubstation150Obj.safetyPerformance[4]);
      edtF6.Text := IntToStr(ENSubstation150Obj.safetyPerformance[5]);
      edtF7.Text := IntToStr(ENSubstation150Obj.safetyPerformance[6]);
    end;

  end;
end;



procedure TfrmENSubstation150Edit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENSubstation150: ENSubstation150ControllerSoapPort;
  Substation150Filter: ENSubstation150Filter;
  Substation150List: ENSubstation150ShortList;
  safetyArr: ENSubstation150Controller.ArrayOfInteger;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      , edtEPVoltageNominalName
      , edtEPRenName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSubstation150 := HTTPRIOENSubstation150 as ENSubstation150ControllerSoapPort;

    ///////
    if (edtName.Text <> '') and (edtInvNumber.Text <> '') then
    begin
      Substation150Filter := ENSubstation150Filter.Create;
      try
        SetNullIntProps(Substation150Filter);
        SetNullXSProps(Substation150Filter);

        Substation150Filter.invNumber := Trim(edtInvNumber.Text);
        Substation150Filter.name := Trim(edtName.Text);
        if DialogState = dsEdit then
          Substation150Filter.conditionSQL := 'code <> ' + IntToStr(ENSubstation150Obj.code);

        Substation150List := TempENSubstation150.getScrollableFilteredList(Substation150Filter, 0, -1);
        if Substation150List.totalCount > 0 then
        begin
          Application.MessageBox(PChar('Объект с таким именем и инвентарным номером уже существует (код: ' + IntToStr(Substation150List.list[0].code) + ')!'), PChar('Внимание !'), MB_ICONWARNING+MB_OK);
          Action := caNone;
          Exit;
        end;
      finally
        Substation150Filter.Free;
      end;
    end;
    ///////

     ENSubstation150Obj.name := edtName.Text; 

     if (ENSubstation150Obj.projectPower = nil ) then
       ENSubstation150Obj.projectPower := TXSDecimal.Create;
     if edtProjectPower.Text <> '' then
       ENSubstation150Obj.projectPower.decimalString := edtProjectPower.Text 
     else
       ENSubstation150Obj.projectPower := nil;

     ENSubstation150Obj.operativeService := edtOperativeService.Text;
     ENSubstation150Obj.repairService := edtRepairService.Text;
     ENSubstation150Obj.buhName := edtBuhName.Text;
     ENSubstation150Obj.invNumber := edtInvNumber.Text;
     ENSubstation150Obj.kruSerial := edtKruSerial.Text;

     if ENLine150Code>0 then
        ENSubstation150Obj.enlinecode:= ENLine150Code
     else ENSubstation150Obj.enlinecode:=Low(Integer);

     if (ENSubstation150Obj.operativeIConst = nil ) then
       ENSubstation150Obj.operativeIConst := TXSDecimal.Create;
     if edtOperativeIConst.Text <> '' then
       ENSubstation150Obj.operativeIConst.decimalString := edtOperativeIConst.Text 
     else
       ENSubstation150Obj.operativeIConst := nil;

     if (ENSubstation150Obj.operativeIVar = nil ) then
       ENSubstation150Obj.operativeIVar := TXSDecimal.Create;
     if edtOperativeIVar.Text <> '' then
       ENSubstation150Obj.operativeIVar.decimalString := edtOperativeIVar.Text 
     else
       ENSubstation150Obj.operativeIVar := nil;

     ENSubstation150Obj.battery := edtBattery.Text;
     ENSubstation150Obj.ORU := edtORU.Text;
     ENSubstation150Obj.OPUType := edtOPUType.Text;
     ENSubstation150Obj.OPUMaterial := edtOPUMaterial.Text; 

     if (ENSubstation150Obj.OPUCount = nil ) then
       ENSubstation150Obj.OPUCount := TXSDecimal.Create;
     if edtOPUCount.Text <> '' then
       ENSubstation150Obj.OPUCount.decimalString := edtOPUCount.Text 
     else
       ENSubstation150Obj.OPUCount := nil;

     ENSubstation150Obj.ZRUBuildingType := edtZRUBuildingType.Text;
     ENSubstation150Obj.ZRUBuildingMaterial := edtZRUBuildingMaterial.Text;
     ENSubstation150Obj.ZRUBasementType := edtZRUBasementType.Text;
     ENSubstation150Obj.ZRUBasementMaterial := edtZRUBasementMaterial.Text; 

     if (ENSubstation150Obj.ZRUCount = nil ) then
       ENSubstation150Obj.ZRUCount := TXSDecimal.Create;
     if edtZRUCount.Text <> '' then
       ENSubstation150Obj.ZRUCount.decimalString := edtZRUCount.Text
     else
       ENSubstation150Obj.ZRUCount := nil;

     if edtSizCode.Text <> '' then
        ENSubstation150Obj.sizCode := StrToInt(edtSizCode.Text)
     else
        ENSubstation150Obj.sizCode := low(Integer);

     ENSubstation150Obj.basementTransformersType := edtBasementTransformersType.Text;
     ENSubstation150Obj.basementTransformersMaterial := edtBasementTransformersMaterial.Text; 

     if (ENSubstation150Obj.basementTransformersCount = nil ) then
       ENSubstation150Obj.basementTransformersCount := TXSDecimal.Create;
     if edtBasementTransformersCount.Text <> '' then
       ENSubstation150Obj.basementTransformersCount.decimalString := edtBasementTransformersCount.Text 
     else
       ENSubstation150Obj.basementTransformersCount := nil;

     if (ENSubstation150Obj.squareInFence = nil ) then
       ENSubstation150Obj.squareInFence := TXSDecimal.Create;
     if edtSquareInFence.Text <> '' then
       ENSubstation150Obj.squareInFence.decimalString := edtSquareInFence.Text 
     else
       ENSubstation150Obj.squareInFence := nil;

     if (ENSubstation150Obj.waterHole = nil ) then
       ENSubstation150Obj.waterHole := TXSDecimal.Create;
     if edtWaterHole.Text <> '' then
       ENSubstation150Obj.waterHole.decimalString := edtWaterHole.Text 
     else
       ENSubstation150Obj.waterHole := nil;

     if (ENSubstation150Obj.waterNet = nil ) then
       ENSubstation150Obj.waterNet := TXSDecimal.Create;
     if edtWaterNet.Text <> '' then
       ENSubstation150Obj.waterNet.decimalString := edtWaterNet.Text 
     else
       ENSubstation150Obj.waterNet := nil;

     if (ENSubstation150Obj.canalizationSink = nil ) then
       ENSubstation150Obj.canalizationSink := TXSDecimal.Create;
     if edtCanalizationSink.Text <> '' then
       ENSubstation150Obj.canalizationSink.decimalString := edtCanalizationSink.Text 
     else
       ENSubstation150Obj.canalizationSink := nil;

     if (ENSubstation150Obj.canalizationLocal = nil ) then
       ENSubstation150Obj.canalizationLocal := TXSDecimal.Create;
     if edtCanalizationLocal.Text <> '' then
       ENSubstation150Obj.canalizationLocal.decimalString := edtCanalizationLocal.Text 
     else
       ENSubstation150Obj.canalizationLocal := nil;

     ENSubstation150Obj.oilStoreData := edtOilStoreData.Text;
     ENSubstation150Obj.oilChannelData := edtOilChannelData.Text;
     ENSubstation150Obj.oilCatcherData := edtOilCatcherData.Text;
     ENSubstation150Obj.revisionDeviceData := edtRevisionDeviceData.Text;
     ENSubstation150Obj.plumbingData := edtPlumbingData.Text;
     ENSubstation150Obj.canalizationData := edtCanalizationData.Text;
     ENSubstation150Obj.heatingData := edtHeatingData.Text;
     ENSubstation150Obj.fencingData := edtFencingData.Text;
     ENSubstation150Obj.connectionData := edtConnectionData.Text;
     ENSubstation150Obj.separatorData := edtSeparatorData.Text;
     ENSubstation150Obj.shorCircuitData := edtShorCircuitData.Text;
     ENSubstation150Obj.loadingData := edtLoadingData.Text;
     ENSubstation150Obj.archCoilData := edtArchCoilData.Text;

     ENSubstation150Obj.molCode := edtMolCode.Text;
     ENSubstation150Obj.molName := edtMolName.Text;

     ENSubstation150Obj.coeffCategory := GetTXSDecimalFromTEdit(edtCoeffCategory);


    SetLength(safetyArr, 7);
    ENSubstation150Obj.safetyPerformance := safetyArr;

    ENSubstation150Obj.safetyPerformance[0] := StrToInt(edtF1.Text);
    ENSubstation150Obj.safetyPerformance[1] := StrToInt(edtF2.Text);
    ENSubstation150Obj.safetyPerformance[2] := StrToInt(edtF3.Text);
    ENSubstation150Obj.safetyPerformance[3] := StrToInt(edtF4.Text);
    ENSubstation150Obj.safetyPerformance[4] := StrToInt(edtF5.Text);
    ENSubstation150Obj.safetyPerformance[5] := StrToInt(edtF6.Text);
    ENSubstation150Obj.safetyPerformance[6] := StrToInt(edtF7.Text);



    if DialogState = dsInsert then
    begin
      ENSubstation150Obj.code:=low(Integer);
      TempENSubstation150.add(ENSubstation150Obj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubstation150.save(ENSubstation150Obj);
    end;
  end;
  vENSubst150PowerTransObjCode := 0;
  vStationCode := 0;
  vStationLinkCode := 0;
end;

procedure TfrmENSubstation150Edit.spbEPVoltageNominalClick(Sender : TObject);
var 
   frmEPVoltageNominalShow: TfrmEPVoltageNominalShow;
begin
   frmEPVoltageNominalShow:=TfrmEPVoltageNominalShow.Create(Application,fmNormal);
   try
      with frmEPVoltageNominalShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubstation150Obj.voltage = nil then ENSubstation150Obj.voltage := EPVoltageNominal.Create();
               ENSubstation150Obj.voltage.code := StrToInt(GetReturnValue(sgMain,0));
               edtEPVoltageNominalName.Text:=GetReturnValue(sgMain,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPVoltageNominalShow.Free;
   end;
end;


procedure TfrmENSubstation150Edit.spbFINExecutorClick(Sender: TObject);
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

               ENSubstation150Obj.element.finExecutor :=
                 DMReports.finExecutorShort2finExecutor(FINExecutorShort(tvDep.Selected.Data),
                                                        DMReports.getFullExecutorName(tvDep.Selected));

               edtFINExecutorName.Text := ENSubstation150Obj.element.finExecutor.name;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINExecutorTreeShow.Free;
   end;
end;

procedure TfrmENSubstation150Edit.spbENElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
{
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubstation150Obj.element = nil then ENSubstation150Obj.element := ENElement.Create();
               ENSubstation150Obj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
   }
end;



procedure TfrmENSubstation150Edit.spbEPRenClick(Sender: TObject);
var 
   frmEPRenShow: TfrmENEPRenShow;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubstation150Obj.element.renRef = nil then ENSubstation150Obj.element.renRef := EPRenRef.Create();
               ENSubstation150Obj.element.renRef.code := StrToInt(GetReturnValue(sgEPRen,0));
               edtEPRenName.Text:=GetReturnValue(sgEPRen,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPRenShow.Free;
   end;
end;


procedure TfrmENSubstation150Edit.spbOSSelectClick(Sender: TObject);
var
frmOSTableShow: TfrmOSTableShow;
f : OStableFilter;
begin

     f := OStableFilter.Create;
     SetNullIntProps(f);
     SetNullXSProps(f);
     // AS 01.04.2010 ... для обьектов РЗА и СПС могут быть и здания :))) ... типа 00377 ...
     // 1 - здания ;)
     // Решетняк и зам нач. РЗА
     f.conditionSQL := ' OSTABLE.KOD_VID in (11,1) '; // подстанции как СИЛ.МАШИНЫ И ОБОРУД НЕ АВТОМ

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

procedure TfrmENSubstation150Edit.pcSubstationDataChange(Sender: TObject);
var
 TempTKMaterials : TKMaterialsControllerSoapPort;
 TempTKTechCard : TKTechCardControllerSoapPort;
 TKMaterialsList : TKMaterialsShortList;
 TKMaterials2List : TKMaterials2TechCardShortList;
 TKMaterialsFilterObj : TKMaterialsFilter;
 techCardCode, i : Integer;
 depShort: ENDepartmentShort;
begin
  inherited;
  if pcSubstationData.ActivePage = tsConstructionPart then
    begin
       pcVRUZRU.ActivePage := tsVRU150;
       updateVRUZRU;
    end;
  if pcSubstationData.ActivePage = tsSubstation150AddData then
    begin
      StationSupplier150_Energized35_Update(True);
      StationSupplier150_Energized35_Update(False);
      actStationEnergized04_Update.Execute;
      AirLineSupplier150_35_Energized35_Update(True);
      AirLineSupplier150_35_Energized35_Update(False);
      actAirLineEnergized10_Update.Execute;
    end; //if pcSubstationData.ActivePage = tsSubstation150AddData then

  if pcSubstationData.ActivePage = tsSubstation150Gauge then
  LoadGauge();

   if pcSubstationdata.ActivePage = tsRegistrationCard then
   begin
      pcCardData.ActivePage := tsGeneral;
      if (ENSubstation150Obj.sizCode <> Low(Integer)) and ((DialogState = dsEdit) or (DialogState = dsView)) then
    begin
      SetGridHeaders(TKMaterialsHeaders, sgTKMaterials.ColumnHeaders);
      TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
      TempTKTechCard := HTTPRIOTKTechCard as TKTechCardControllerSoapPort;

      techCardCode := TempTKTechCard.getKartaBySiz(ENSubstation150Obj.sizCode);
      TKMaterials2List := TempTKMaterials.getMaterialsBySubstation150(techCardCode, ENSubstation150Obj.code);

      operationLastCount:=High(TKMaterials2List.list);
      if operationLastCount > -1 then
         sgTKMaterials.RowCount:=operationLastCount+2
      else
         sgTKMaterials.RowCount:=2;

       with sgTKMaterials do
        for i:=0 to operationLastCount do
          begin
            Application.ProcessMessages;
            if TKMaterials2List.list[i].materialCode <> Low(Integer) then
            Cells[0,i+1] := IntToStr(TKMaterials2List.list[i].materialCode)
            else
            Cells[0,i+1] := '';
            Cells[1,i+1] := TKMaterials2List.list[i].name;
            Cells[2, i + 1] := TKMaterials2List.list[i].measurementName;

            if TKMaterials2List.list[i].countGen = nil then
              Cells[3,i+1] := ''
            else
              Cells[3,i+1] := TKMaterials2List.list[i].countGen.DecimalString;
           if TKMaterials2List.list[i].costnkre = nil then
              Cells[4,i+1] := ''
            else
              Cells[4,i+1] := TKMaterials2List.list[i].costnkre.DecimalString;


            


            operationLastRow :=i+1;
            sgTKMaterials.RowCount:= operationLastRow+1;
      end;
         operationColCount:=operationColCount+1;
         sgTKMaterials.Row:=1;
    end;
   end;
end;

procedure TfrmENSubstation150Edit.pcVRUZRUChange(Sender: TObject);
begin
  inherited;
   updateVRUZRU;
end;

procedure TfrmENSubstation150Edit.spbPlanMOLMasterClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

  TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;

  molSel : boolean;
  // TempENDepartment: ENDepartmentControllerSoapPort;
begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // типа только работающие ...

      // РЭСы и МОЛы

    if  ENSubstation150Obj.element.renRef.code <> Low(Integer) then
     begin
        // TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
        TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
        renFilter := ENDepartment2EPRenFilter.Create;
        SetNullXSProps(renFilter);
        SetNullIntProps(renFilter);
        renFilter.departmentRef := ENDepartmentRef.Create;
        renFilter.departmentRef.code := ENSubstation150Obj.element.renRef.code;

        renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);
        if renList.totalCount > 0 then
          f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode) ;
      end;

   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

   try

      if length(f.conditionSQL) > 0 then
        frmFINMolShow.isFiltered := true;

      with frmFINMolShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               ENSubstation150Obj.molCode := GetReturnValue(sgFINMol,0);
               ENSubstation150Obj.molName := GetReturnValue(sgFINMol,1);

               edtMolCode.Text :=  GetReturnValue(sgFINMol,0);
               edtMolName.Text := GetReturnValue(sgFINMol,1);


            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;


end;

procedure TfrmENSubstation150Edit.pcCardDataChange(Sender: TObject);
var
 ColCount , LastCount  , LastRow: Integer;
   TempENPlanWork: ENPlanWorkControllerSoapPort;
  i, n, techCardCode : Integer;
  ENPlanWorkList: ENPlanWorkShortList;
  plFilter : ENPlanWorkFilter;
  TempTKMaterials : TKMaterialsControllerSoapPort;
  TKIssue2List : TKMaterials2TechCardShortList;
  WriteOffSZList : TKMaterials2TechCardShortList;
begin
  inherited;
    if pcCardData.ActivePage = tsPlans then
    begin
       SetGridHeaders(ENPlanWorkHeaders, sgENPlanWork.ColumnHeaders);
      ColCount:=100;
      TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

      plFilter := ENPlanWorkFilter.Create;
      SetNullIntProps(plFilter);
      SetNullXSProps(plFilter);
      plFilter.elementRef := ENElementRef.Create;
      plFilter.elementRef.code := ENSubstation150Obj.element.code;
      plFilter.typeRef := ENPlanWorkTypeRef.Create;
      plFilter.typeRef.code :=  ENPLANWORKTYPE_SIZ;


      ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(ENPlanWorkFilter(plFilter),0,ColCount);

     try

      LastCount := High(ENPlanWorkList.list);

      if LastCount > -1 then
         sgENPlanWork.RowCount:=LastCount+2
      else
         sgENPlanWork.RowCount:=2;

       with sgENPlanWork do
        for i:=0 to LastCount do
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

            LastRow:=i+1;
            sgENPlanWork.RowCount:=LastRow+1;
          end;

       ColCount:=ColCount+1;
       sgENPlanWork.Row:=1;
     finally
      ENPlanWorkList.Free;
     end;
    end;


     if pcCardData.ActivePage = tsIssueSz then
    begin
      SetGridHeaders(SizIssueHeaders, sgIssue.ColumnHeaders);
      TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;

      TKIssue2List := TempTKMaterials.getIssueBySubstation150Object(techCardCode, ENSubstation150Obj.element.code);


      operationLastCount:=High(TKIssue2List.list);
      if operationLastCount > -1 then
         sgIssue.RowCount:=operationLastCount+2
      else
         sgIssue.RowCount:=2;

       with sgIssue do
        for i:=0 to operationLastCount do
          begin
            Application.ProcessMessages;

             if TKIssue2List.list[i].estimateItemCode <> Low(Integer) then
            Cells[0,i+1] := IntToStr(TKIssue2List.list[i].estimateItemCode )  // kod estimate
            else
            Cells[0,i+1] := '';

            Cells[1,i+1] := TKIssue2List.list[i].identid;
            Cells[2,i+1] := TKIssue2List.list[i].accountingTypeRefName;
            Cells[3,i+1] := TKIssue2List.list[i].axMaterialsRefName;
            Cells[4,i+1] := TKIssue2List.list[i].axMaterialsRefStatus;
            Cells[5,i+1] := TKIssue2List.list[i].elementName;

            if TKIssue2List.list[i].countGen = nil then
              Cells[6,i+1] := ''
            else
              Cells[6,i+1] := TKIssue2List.list[i].countGen.DecimalString;


            Cells[7,i+1] := TKIssue2List.list[i].party_id;

            if TKIssue2List.list[i].isWrittenOff > 0 then
               sgIssue.RowColor[i + 1] := clRed
            else
               sgIssue.RowColor[i + 1] := clNone;



            operationLastRow :=i+1;
            sgIssue.RowCount:= operationLastRow+1;
          end;
         operationColCount:=operationColCount+1;
         sgIssue.Row:=1;

    end;

    if pcCardData.ActivePage = tsWriteOffSz then
    begin
      SetGridHeaders(SizWriteOffHeaders, sgWriteOffSz.ColumnHeaders);
      TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;

      TKIssue2List := TempTKMaterials.getWriteOffBySubstation150Object(ENSubstation150Obj.element.code);


      operationLastCount:=High(TKIssue2List.list);
      if operationLastCount > -1 then
         sgWriteOffSz.RowCount:=operationLastCount+2
      else
         sgWriteOffSz.RowCount:=2;

       with sgWriteOffSz do
        for i:=0 to operationLastCount do
          begin
            Application.ProcessMessages;
            if TKIssue2List.list[i].estimateItemCode <> Low(Integer) then
            Cells[0,i+1] := IntToStr(TKIssue2List.list[i].estimateItemCode )  // kod estimate
            else
            Cells[0,i+1] := '';

            Cells[1,i+1] := TKIssue2List.list[i].identid;
            Cells[2,i+1] := TKIssue2List.list[i].accountingTypeRefName;
            Cells[3,i+1] := TKIssue2List.list[i].axMaterialsRefName;
            Cells[4,i+1] := TKIssue2List.list[i].axMaterialsRefStatus;
            Cells[5,i+1] := TKIssue2List.list[i].elementName;

            if TKIssue2List.list[i].countGen = nil then
              Cells[6,i+1] := ''
            else
              Cells[6,i+1] := TKIssue2List.list[i].countGen.DecimalString;

            Cells[7,i+1] := TKIssue2List.list[i].party_id;

            if TKIssue2List.list[i].isWrittenOff > 0 then
               sgIssue.RowColor[i + 1] := clRed
            else
               sgIssue.RowColor[i + 1] := clNone;



            operationLastRow :=i+1;
            sgWriteOffSz.RowCount:= operationLastRow+1;
          end;
         operationColCount:=operationColCount+1;
         sgWriteOffSz.Row:=1;

    end;
end;

procedure TfrmENSubstation150Edit.sbLine150Click(Sender: TObject);
   var frmENLine150Show: TfrmENLine150Show;
begin
   frmENLine150Show:=TfrmENLine150Show.Create(Application,fmNormal);
   try
      with frmENLine150Show do
        if ShowModal = mrOk then
        begin
            try
               edtLine150.Text:=GetReturnValue(sgENLine150,2);
               ENLine150Code:=StrToInt(GetReturnValue(sgENLine150,0));
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPVoltageNominalShow.Free;
   end;

end;

procedure TfrmENSubstation150Edit.sgCCDamageLogDblClick(Sender: TObject);
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

procedure TfrmENSubstation150Edit.sgCCElementDataDblClick(Sender: TObject);
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

procedure TfrmENSubstation150Edit.sgENPlanWorkDblClick(Sender: TObject);
var TempENPlanWork: ENPlanWorkControllerSoapPort;
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

   selectedRow := sgENPlanWork.Row;

   frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsView);

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

procedure TfrmENSubstation150Edit.sgENSubst150PowerTransRowChanging(
  Sender: TObject; OldRow, NewRow: Integer; var Allow: Boolean);
var str: string;
begin
  str := TAdvStringGrid(Sender).Cells[0, NewRow];
  clearLinkStation;
  if str <> '' then
    try
      vENSubst150PowerTransObjCode := StrToInt(str); //Код силового трансформатора
      actUpdateLinkStation.Execute;     
    except
    end;
end;

procedure TfrmENSubstation150Edit.sgENSubstation150RowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
begin
  vStationLinkCode := StrToInt( //Задание кода связанной Станции
    TAdvStringGrid(Sender).Cells[0, NewRow]);
end;

procedure TfrmENSubstation150Edit.LoadPowerTransList();
var TempENSubst150PowerTrans: ENSubst150PowerTransControllerSoapPort;
  i, LastCount: Integer;
  ENSubst150PowerTransList: ENSubst150PowerTransShortList;
  powerTransFilter: ENSubst150PowerTransFilter;
  condition: String;
  Allow: Boolean;
begin
  ClearGrid(sgENSubst150PowerTrans);
  TempENSubst150PowerTrans :=
    HTTPRIOENSubst150PowerTrans as ENSubst150PowerTransControllerSoapPort;
  powerTransFilter := ENSubst150PowerTransFilter.Create;
  SetNullIntProps(powerTransFilter);
  SetNullXSProps(powerTransFilter);
  //powerTransFilter.substationRef := ENSubstation150Ref.Create;
  //powerTransFilter.substationRef.code := vStationCode;
  condition := powerTransFilter.conditionSQL;
  AddCondition(condition, '(ensubst150powertrans.code in (' +
    '  select ensubst2powtrans.powertransrefcode from ensubst2powtrans ' +
    '  where ensubst2powtrans.substationrefcode = ' +
       IntToStr(vStationCode) + ') ' +
    'or ensubst150powertrans.substationrefcode = ' + IntToStr(vStationCode) +
    'or ensubst150powertrans.substationrefcode in (' +
    '  select ensubst2powtrans.substationrefcode from ensubst2powtrans ' +
    '  where ensubst2powtrans.powertransrefcode in (' +
    '    select st150pt.code from ensubst150powertrans st150pt' +
    '    where st150pt.substationrefcode = ' + IntToStr(vStationCode) + ')))');
  powerTransFilter.conditionSQL := condition;
  ENSubst150PowerTransList :=
    TempENSubst150PowerTrans.getScrollableFilteredList(powerTransFilter, 0, -1);
  LastCount := High(ENSubst150PowerTransList.list);
  if LastCount > -1 then
     sgENSubst150PowerTrans.RowCount := LastCount + 2
  else
     sgENSubst150PowerTrans.RowCount := 2;
  with sgENSubst150PowerTrans do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubst150PowerTransList.list[i].code <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(ENSubst150PowerTransList.list[i].code)
        else
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENSubst150PowerTransList.list[i].name;
        Cells[2, i + 1] := ENSubst150PowerTransList.list[i].factoryNumber;
        Cells[3, i + 1] := ENSubst150PowerTransList.list[i].typeRefName;
        Cells[4, i + 1] :=
          ENSubst150PowerTransList.list[i].voltageClassRefDescription;
        if ENSubst150PowerTransList.list[i].voltageVN = nil then
          Cells[5, i + 1] := ''
        else Cells[5, i + 1] :=
          ENSubst150PowerTransList.list[i].voltageVN.DecimalString;
        if ENSubst150PowerTransList.list[i].voltageSN = nil then
          Cells[6, i + 1] := ''
        else Cells[6, i + 1] :=
          ENSubst150PowerTransList.list[i].voltageSN.DecimalString;
        if ENSubst150PowerTransList.list[i].voltageNN = nil then
          Cells[7, i + 1] := ''
        else Cells[7, i + 1] :=
          ENSubst150PowerTransList.list[i].voltageNN.DecimalString;
        if ENSubst150PowerTransList.list[i].currentVN = nil then
          Cells[8, i + 1] := ''
        else Cells[8, i + 1] :=
          ENSubst150PowerTransList.list[i].currentVN.DecimalString;
        if ENSubst150PowerTransList.list[i].currentSN = nil then
          Cells[9, i + 1] := ''
        else Cells[9, i + 1] :=
          ENSubst150PowerTransList.list[i].currentSN.DecimalString;
        if ENSubst150PowerTransList.list[i].currentNN = nil then
          Cells[10, i + 1] := ''
        else Cells[10, i + 1] :=
          ENSubst150PowerTransList.list[i].currentNN.DecimalString;
        if ENSubst150PowerTransList.list[i].powerVN = nil then
          Cells[11, i + 1] := ''
        else Cells[11, i + 1] :=
          ENSubst150PowerTransList.list[i].powerVN.DecimalString;
        if ENSubst150PowerTransList.list[i].powerSN = nil then
          Cells[12, i + 1] := ''
        else Cells[12, i + 1] :=
          ENSubst150PowerTransList.list[i].powerSN.DecimalString;
        if ENSubst150PowerTransList.list[i].powerNN = nil then
          Cells[13, i + 1] := ''
        else Cells[13, i + 1] :=
          ENSubst150PowerTransList.list[i].powerNN.DecimalString;
        sgENSubst150PowerTrans.RowCount := i + 2;
      end;

  sgENSubst150PowerTrans.Row := 1;
  sgENSubst150PowerTrans.OnRowChanging(sgENSubst150PowerTrans, 0, 1, Allow);
end;

procedure TfrmENSubstation150Edit.pcSubstation150Change(Sender: TObject);
begin
  actUpdateExecute(Sender);
end;

procedure TfrmENSubstation150Edit.actAa(Sender: TObject);
var voltageClass: Integer;
    TempENSubst150Battery: ENSubst150BatteryControllerSoapPort;
    //ENSubst150BatteryList: ENSubst150BatteryShortList;
    batteryFilter: ENSubst150BatteryFilter;
    batteryArr: ENSubst150BatteryController.ArrayOfInteger;
begin

  if pcSubstationData.ActivePage = tsSubstation150Gauge then
  begin
    ENGauge150Obj := ENGauge150.Create;
    ENGauge150Obj.substation150Ref := ENSubstation150Ref.Create;
    ENGauge150Obj.substation150Ref.code := ENSubstation150Obj.code;

    try
      frmENGauge150Edit:=TfrmENGauge150Edit.Create(Application, dsInsert);
      try
        if frmENGauge150Edit.ShowModal = mrOk then
        begin
          if ENGauge150Obj <> nil then
              actUpdateExecute(Sender);
        end;
      finally
        frmENGauge150Edit.Free;
        frmENGauge150Edit:=nil;
      end;
    finally
      ENGauge150Obj.Free;
    end;
  end;

  if pcSubstation150.ActivePage = tsPowerTrans then
  begin
    ENSubst150PowerTransObj := ENSubst150PowerTrans.Create;
    SetNullIntProps(ENSubst150PowerTransObj);
    SetNullXSProps(ENSubst150PowerTransObj);
    ENSubst150PowerTransObj.substationRef := ENSubstation150Ref.Create;
    ENSubst150PowerTransObj.substationRef.code := ENSubstation150Obj.code;

    try
      frmENSubst150PowerTransEdit := TfrmENSubst150PowerTransEdit.Create(Application, dsInsert);
      try
        if frmENSubst150PowerTransEdit.ShowModal = mrOk then
        begin
          if ENSubst150PowerTransObj <> nil then
            LoadPowerTransList();
        end;
      finally
        frmENSubst150PowerTransEdit.Free;
        frmENSubst150PowerTransEdit := nil;
      end;
    finally
      ENSubst150PowerTransObj.Free;
    end;
  end;

  if pcSubstation150.ActivePage = tsOwnTrans then
  begin
    ENSubst150OwnTransObj := ENSubst150OwnTrans.Create;
    SetNullIntProps(ENSubst150OwnTransObj);
    SetNullXSProps(ENSubst150OwnTransObj);
    ENSubst150OwnTransObj.substationRef := ENSubstation150Ref.Create;
    ENSubst150OwnTransObj.substationRef.code := ENSubstation150Obj.code;

    try
      frmENSubst150OwnTransEdit := TfrmENSubst150OwnTransEdit.Create(Application, dsInsert);
      try
        if frmENSubst150OwnTransEdit.ShowModal = mrOk then
        begin
          if ENSubst150OwnTransObj <> nil then
            LoadOwnTransList();
        end;
      finally
        frmENSubst150OwnTransEdit.Free;
        frmENSubst150OwnTransEdit := nil;
      end;
    finally
      ENSubst150OwnTransObj.Free;
    end;
  end;

  if pcSubstation150.ActivePage = tsVoltTrans then
  begin
    ENSubst150VoltTransObj := ENSubst150VoltTrans.Create;
    SetNullIntProps(ENSubst150VoltTransObj);
    SetNullXSProps(ENSubst150VoltTransObj);
    ENSubst150VoltTransObj.substationRef := ENSubstation150Ref.Create;
    ENSubst150VoltTransObj.substationRef.code := ENSubstation150Obj.code;

    try
      frmENSubst150VoltTransEdit := TfrmENSubst150VoltTransEdit.Create(Application, dsInsert);
      try
        if frmENSubst150VoltTransEdit.ShowModal = mrOk then
        begin
          if ENSubst150VoltTransObj <> nil then
            LoadVoltTransList();
        end;
      finally
        frmENSubst150VoltTransEdit.Free;
        frmENSubst150VoltTransEdit := nil;
      end;
    finally
      ENSubst150VoltTransObj.Free;
    end;
  end;

  if (pcSubstation150.ActivePage = tsCell150) or
     (pcSubstation150.ActivePage = tsCell35) or
     (pcSubstation150.ActivePage = tsCell10) then
  begin
    voltageClass := GetCellVoltageClassByTabSheet(pcSubstation150.ActivePage);

    ENSubst150CellObj := ENSubst150Cell.Create;
    SetNullIntProps(ENSubst150CellObj);
    SetNullXSProps(ENSubst150CellObj);

    ENSubst150CellObj.substationRef := ENSubstation150Ref.Create;
    ENSubst150CellObj.substationRef.code := ENSubstation150Obj.code;

    ENSubst150CellObj.voltageClassRef := ENVoltageClassRef.Create;
    ENSubst150CellObj.voltageClassRef.code := voltageClass;

    try
      frmENSubst150CellEdit := TfrmENSubst150CellEdit.Create(Application, dsInsert);
      try
        if (voltageClass <> ENVOLTAGECLASS_10) and (voltageClass <> ENVOLTAGECLASS_6) then
          frmENSubst150CellEdit.DisableControls([frmENSubst150CellEdit.spbVoltageClass]);

        if frmENSubst150CellEdit.ShowModal = mrOk then
        begin
          if ENSubst150CellObj <> nil then
            LoadCellList(voltageClass);
        end;
      finally
        frmENSubst150CellEdit.Free;
        frmENSubst150CellEdit := nil;
      end;
    finally
      ENSubst150CellObj.Free;
    end;
  end;

  if pcSubstation150.ActivePage = tsDischarger then
  begin
    ENSubst150DischargerObj := ENSubst150Discharger.Create;
    SetNullIntProps(ENSubst150DischargerObj);
    SetNullXSProps(ENSubst150DischargerObj);
    ENSubst150DischargerObj.substationRef := ENSubstation150Ref.Create;
    ENSubst150DischargerObj.substationRef.code := ENSubstation150Obj.code;

    try
      frmENSubst150DischargerEdit := TfrmENSubst150DischargerEdit.Create(Application, dsInsert);
      try
        if frmENSubst150DischargerEdit.ShowModal = mrOk then
        begin
          if ENSubst150DischargerObj <> nil then
            LoadDischargerList();
        end;
      finally
        frmENSubst150DischargerEdit.Free;
        frmENSubst150DischargerEdit := nil;
      end;
    finally
      ENSubst150DischargerObj.Free;
    end;
  end;

  if pcSubstation150.ActivePage = tsBattery then
  begin
    /////
    TempENSubst150Battery := HTTPRIOENSubst150Battery as ENSubst150BatteryControllerSoapPort;

    batteryFilter := ENSubst150BatteryFilter.Create;
    SetNullIntProps(batteryFilter);
    SetNullXSProps(batteryFilter);

    batteryFilter.substationRef := ENSubstation150Ref.Create;
    batteryFilter.substationRef.code := ENSubstation150Obj.code;

    //ENSubst150BatteryList := TempENSubst150Battery.getScrollableFilteredList(batteryFilter, 0, -1);
    batteryArr := TempENSubst150Battery.getScrollableFilteredCodeArray(batteryFilter, 0, -1);
    //if High(ENSubst150BatteryList.list) > -1 then
    if High(batteryArr) > -1 then
    begin
      Application.MessageBox(PChar('Для этой подстанции уже введены данные по аккумуляторной батарее!' + #13#10 +
                                   'При необходимости Вы можете их отредактировать.'),
                             PChar('Внимание !'), MB_ICONWARNING);
      Exit;
    end;
    /////

    ENSubst150BatteryObj := ENSubst150Battery.Create;
    SetNullIntProps(ENSubst150BatteryObj);
    SetNullXSProps(ENSubst150BatteryObj);
    ENSubst150BatteryObj.substationRef := ENSubstation150Ref.Create;
    ENSubst150BatteryObj.substationRef.code := ENSubstation150Obj.code;

    try
      frmENSubst150BatteryEdit := TfrmENSubst150BatteryEdit.Create(Application, dsInsert);
      try
        if frmENSubst150BatteryEdit.ShowModal = mrOk then
        begin
          if ENSubst150BatteryObj <> nil then
            LoadBatteryList();
        end;
      finally
        frmENSubst150BatteryEdit.Free;
        frmENSubst150BatteryEdit := nil;
      end;
    finally
      ENSubst150BatteryObj.Free;
    end;
  end;
end;


procedure TfrmENSubstation150Edit.actLoadAttachmentExecute(Sender: TObject);
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

procedure TfrmENSubstation150Edit.actUpdateAttachmentsExecute(Sender: TObject);
begin
  updateAttachments;
end;


procedure TfrmENSubstation150Edit.updateAttachments;
var
  TempENDocAttachment: ENDocAttachmentControllerSoapPort;
  ENDocAttachmentList: ENDocAttachmentShortList;
  docAttachmentFilter: ENDocAttachmentFilter;
  i, attachmentsCount: Integer;
begin
  ClearGrid(sgENDocAttachment);

  if DialogState = dsInsert then Exit;
  if ENSubstation150Obj = nil then Exit;
  if ENSubstation150Obj.element = nil then Exit;
  if ENSubstation150Obj.element.code = LOW_INT then Exit;

  TempENDocAttachment := HTTPRIOENDocAttachment as ENDocAttachmentControllerSoapPort;

  docAttachmentFilter := ENDocAttachmentFilter.Create;
  SetNullIntProps(docAttachmentFilter);
  SetNullXSProps(docAttachmentFilter);

  docAttachmentFilter.status := ENDocAttachmentStatusRef.Create;
  docAttachmentFilter.status.code := ENDOCATTACHMENTSTATUS_ACTIVE;

  docAttachmentFilter.conditionSQL := ' code in (select endocattachment2enlmnt.docattachmentrefcode '+
    ' from endocattachment2enlmnt where endocattachment2enlmnt.elementrefcode = ' + IntToStr(ENSubstation150Obj.element.code) + ')';

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


procedure TfrmENSubstation150Edit.actPowTrans2SubstLinkExecute(Sender: TObject);
var TempENSubst150PowerTrans: ENSubst150PowerTransControllerSoapPort;
  powerTransFilter: ENSubst150PowerTransFilter;
  ENSubst150PowerTransList: ENSubst150PowerTransShortList;
  condition: string;
  fENSubst150PowerTransShow: TfrmENSubst150PowerTransShow;
  TempENSubst2PowTrans: ENSubst2PowTransControllerSoapPort;
  ENSubst2PowTransObj: ENSubst2PowTrans;  
begin //Привязка к Станции 150 / 35 - 27 / 10 - 6 кВ Силового Трансформатора
  if (ENSubstation150Obj = nil) and (vStationCode <= 0) then
    Exit;
  if vStationCode <= 0 then
    vStationCode := ENSubstation150Obj.code;

  TempENSubst150PowerTrans :=
  HTTPRIOENSubst150PowerTrans as ENSubst150PowerTransControllerSoapPort;
	
  powerTransFilter := ENSubst150PowerTransFilter.Create;
  SetNullIntProps(powerTransFilter);
  SetNullXSProps(powerTransFilter);

  condition := powerTransFilter.conditionSQL;
  AddCondition(condition, '(ensubst150powertrans.code not in (' +
    '  select ensubst2powtrans.powertransrefcode from ensubst2powtrans ' +
    '  where ensubst2powtrans.substationrefcode = ' +
       IntToStr(vStationCode) + ') ' +
    'and ensubst150powertrans.substationrefcode <> ' + IntToStr(vStationCode) +
    'and ensubst150powertrans.substationrefcode not in (' +
    '  select ensubst2powtrans.substationrefcode from ensubst2powtrans ' +
    '  where ensubst2powtrans.powertransrefcode in (' +
    '    select st150pt.code from ensubst150powertrans st150pt' +
    '    where st150pt.substationrefcode = ' + IntToStr(vStationCode) + ')))');
  powerTransFilter.conditionSQL := condition;
  ENSubst150PowerTransList :=
  TempENSubst150PowerTrans.getScrollableFilteredList(powerTransFilter, 0, -1);

  fENSubst150PowerTransShow := TfrmENSubst150PowerTransShow.Create(
    Application, fmNormal, powerTransFilter);
  try
    fENSubst150PowerTransShow.btnOk.Visible := True;
    fENSubst150PowerTransShow.chkIsVirtStation.Visible := True;
    if fENSubst150PowerTransShow.ShowModal = mrOk then
      begin
        ENSubst2PowTransObj := ENSubst2PowTrans.Create;
        ENSubst2PowTransObj.name := st150PowTransName + ' на ' +
          ENSubstation150Obj.name;
        ENSubst2PowTransObj.powerTransRef := ENSubst150PowerTransRef.Create;
        ENSubst2PowTransObj.powerTransRef.code := st150PowTransCode;
        ENSubst2PowTransObj.substationRef := ENSubstation150Ref.Create;
        ENSubst2PowTransObj.substationRef.code := vStationCode;
        if ShowENSubstation150.isVirtStation then
          ENSubst2PowTransObj.isVirt := 1
        else
          ENSubst2PowTransObj.isVirt := 0;
        TempENSubst2PowTrans :=
          HTTPRIOENSubst2PowTrans as ENSubst2PowTransControllerSoapPort;
        TempENSubst2PowTrans.add(ENSubst2PowTransObj);
        actUpdate.Execute;
        //actUpdateLinkStation.Execute;
      end;
  finally
    fENSubst150PowerTransShow.Free;
    fENSubst150PowerTransShow := nil;
  end;

end;

procedure TfrmENSubstation150Edit.actPowTrans2SubstUnLinkExecute(
  Sender: TObject);
var TempENSubst2PowTrans: ENSubst2PowTransControllerSoapPort;
  ENSubst2PowTransFilterObj: ENSubst2PowTransFilter;
  condition: String;
  vENSubst2PowTransCodes: ENSubst2PowTransController.ArrayOfInteger;
  i: Integer;
begin  //Отвязка от Станции 150 / 35 - 27 / 10 - 6 кВ Силового Трансформатора
  condition := ''; //Инициализация строковой переменной
  if vENSubst150PowerTransObjCode <= 0 then
    begin  
      condition :=  sgENSubst150PowerTrans.Cells[0, sgENSubst150PowerTrans.Row];
      if condition <> '' then
        begin
          try //Код силового трансформатора
            vENSubst150PowerTransObjCode := StrToInt(condition);
          except
          end;
          condition := ''; //Очистка строковой переменной
        end;      
    end;

  if ((ENSubstation150Obj = nil) and (vStationCode <= 0)) 
  or (vENSubst150PowerTransObjCode <= 0) then
    Exit;

  if vStationCode <= 0 then
    vStationCode := ENSubstation150Obj.code;
  
  ENSubst2PowTransFilterObj := ENSubst2PowTransFilter.Create;

  try
    SetNullIntProps(ENSubst2PowTransFilterObj);
    SetNullXSProps(ENSubst2PowTransFilterObj);

    ENSubst2PowTransFilterObj.powerTransRef := ENSubst150PowerTransRef.Create;
    ENSubst2PowTransFilterObj.powerTransRef.code :=
      vENSubst150PowerTransObjCode;
    ENSubst2PowTransFilterObj.substationRef := ENSubstation150Ref.Create;
    ENSubst2PowTransFilterObj.substationRef.code := vStationCode;

    TempENSubst2PowTrans :=
      HTTPRIOENSubst2PowTrans as ENSubst2PowTransControllerSoapPort;

    vENSubst2PowTransCodes :=
      TempENSubst2PowTrans.getScrollableFilteredCodeArray(
        ENSubst2PowTransFilterObj, 0, -1);

    if Length(vENSubst2PowTransCodes) > 0 then
      begin
        for i := Low(vENSubst2PowTransCodes) to High(vENSubst2PowTransCodes) do
          TempENSubst2PowTrans.remove(vENSubst2PowTransCodes[i]);
        actUpdate.Execute;
        //actUpdateLinkStation.Execute;
      end;
  finally
    ENSubst2PowTransFilterObj.Free;
    ENSubst2PowTransFilterObj := nil;
  end;
end;

procedure TfrmENSubstation150Edit.actSchemeListLinkStationExecute(
  Sender: TObject);
Var TempENSubstation150: ENSubstation150ControllerSoapPort;
  vENSubstation150Obj: ENSubstation150;
  ENSchemeFilterObj: ENSchemeFilter;
  fENSchemeShow: TfrmENSchemeShow;
begin
  TempENSubstation150 := HTTPRIOENSubstation150 as
    ENSubstation150ControllerSoapPort;
  try
    vENSubstation150Obj := TempENSubstation150.getObject(StrToInt(
      sgENSubstation150.Cells[0, sgENSubstation150.Row]));
  except
    on EConvertError do Exit;
  end;

  ENSchemeFilterObj := ENSchemeFilter.Create;
  SetNullIntProps(ENSchemeFilterObj);
  SetNullXSProps(ENSchemeFilterObj);
  ENSchemeFilterObj.elementRef := ENElementRef.Create;
  ENSchemeFilterObj.elementRef.code := vENSubstation150Obj.element.code;

  fENSchemeShow :=
    TfrmENSchemeShow.Create(Application, fmNormal, ENSchemeFilterObj);
  try
    fENSchemeShow.ShowModal;
  finally
    fENSchemeShow.Free;
  end;
end;

procedure TfrmENSubstation150Edit.actStationEnergized04_UpdateExecute(
  Sender: TObject);
var i, j: Integer;
  TempENSubstation04: ENSubstation04ControllerSoapPort;
  ENSubstation04List: ENSubstation04ShortList;
  vENSubstation04Filter: ENSubstation04Filter;
begin
  for i := 1 to sgENSubstation04.RowCount - 1 do
    for j := 0 to sgENSubstation04.ColCount - 1 do
      sgENSubstation04.Cells[j, i] := '';

  FormatSettings.DecimalSeparator := '.';
  //SetGridHeaders(ENSubstation04Headers, sgENSubstation04.ColumnHeaders);
  ColCount := -1;
  TempENSubstation04 :=
    HTTPRIOENSubstation04 as ENSubstation04ControllerSoapPort;

  if vENSubstation04Filter = nil then
    begin
      vENSubstation04Filter := ENSubstation04Filter.Create;
      SetNullIntProps(vENSubstation04Filter);
      SetNullXSProps(vENSubstation04Filter);
    end;

  vENSubstation04Filter.conditionSQL := 'ENSUBSTATION04.CODE in (' +
    'select s04code from net.s04to150 where s150code = ' +
      IntToStr(vStationCode) +
    'union select s04code from net.s04to35 where s35code = ' +
      IntToStr(vStationCode) +
    'union select s04code from net.s04to35 where s35code in (' +
    '  select s35code from net.s35to150 where s150code = ' +
        IntToStr(vStationCode) + '))';

  ENSubstation04List := TempENSubstation04.getScrollableFilteredList(
    ENSubstation04Filter(vENSubstation04Filter), 0, ColCount);
  LastCount := High(ENSubstation04List.list);

  if LastCount > -1 then sgENSubstation04.RowCount := LastCount + 2
  else sgENSubstation04.RowCount := 2;

  with sgENSubstation04 do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubstation04List.list[i].code <> Low(Integer) then //Код
          Cells[0, i + 1] := IntToStr(ENSubstation04List.list[i].code)
        else Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENSubstation04List.list[i].name; //Назва підстанції
        Cells[2, i + 1] := ENSubstation04List.list[i].renRefName; //Підрозділ
        if ENSubstation04List.list[i].nominalPower = nil then
          Cells[3, i + 1] := ''
        else Cells[3, i + 1] := //Потужність, кВА
          ENSubstation04List.list[i].nominalPower.DecimalString;
        Cells[4, i + 1] := ENSubstation04List.list[i].invNumber; //Інвентарний
        AddCheckBox(5, i + 1, //Є заміри
          (ENSubstation04List.list[i].fiderGaugeFullness = 1), False);
        if ENSubstation04List.list[i].chambersQuantity <> low(Integer) then
          Cells[6, i + 1] := //Камер
            IntToStr(ENSubstation04List.list[i].chambersQuantity)
        else Cells[6, i + 1] := '';
        Cells[7, i + 1] := ENSubstation04List.list[i].buhName; //Бухгалтерське
        if ENSubstation04List.list[i].lastRepairDate = nil then
          Cells[8, i + 1] := ''
        else Cells[8, i + 1] := //Дата останнього кап. ремонту
          XSDate2String(ENSubstation04List.list[i].lastRepairDate);
        LastRow := i + 1;
        sgENSubstation04.RowCount := LastRow + 1;
      end; //for i := 0 to LastCount do
   ColCount := ColCount + 1;
   sgENSubstation04.Row := 1;
end;

procedure TfrmENSubstation150Edit.actStationEnergized35_UpdateExecute(
  Sender: TObject);
begin
  StationSupplier150_Energized35_Update(False);
end;

procedure TfrmENSubstation150Edit.actStationSupplier150_UpdateExecute(
  Sender: TObject);
begin
  StationSupplier150_Energized35_Update(True);
end;

procedure TfrmENSubstation150Edit.StationSupplier150_Energized35_Update(
  isSupplier: Boolean);
var i, j: Integer;
  TempENSubstation150: ENSubstation150ControllerSoapPort;
  ENSubstation150List: ENSubstation150ShortList;
  vENSubstation150Filter: ENSubstation150Filter;
  sgStation: TAdvStringGrid;
begin
  if isSupplier then sgStation := sgStationSupplier150
  else sgStation := sgStationEnergized35;

  for i := 1 to sgStation.RowCount - 1 do
    for j := 0 to sgStation.ColCount - 1 do
      sgStation.Cells[j, i] := '';

  FormatSettings.DecimalSeparator := '.';
  SetGridHeaders(ENSubstation150Headers, sgENSubstation150.ColumnHeaders);
  ColCount := -1;

  if isSupplier then TempENSubstation150 :=
    HTTPRIOENSubstation150Supplier as ENSubstation150ControllerSoapPort
  else TempENSubstation150 :=
    HTTPRIOENSubstation150Energized as ENSubstation150ControllerSoapPort;

  if vENSubstation150Filter = nil then
    begin
      vENSubstation150Filter := ENSubstation150Filter.Create;
      SetNullIntProps(vENSubstation150Filter);
      SetNullXSProps(vENSubstation150Filter);
    end;

  if isSupplier then vENSubstation150Filter.conditionSQL :=
    'ENSUBSTATION150.CODE in (' +
    '  select slnk.s150code from net.s35to150 slnk where slnk.s35code = ' +
       IntToStr(vStationCode) + ')'
  else vENSubstation150Filter.conditionSQL :=
    'ENSUBSTATION150.CODE in (' +
    '  select slnk.s35code from net.s35to150 slnk where slnk.s150code = ' +
       IntToStr(vStationCode) + ')';

  ENSubstation150List := TempENSubstation150.getScrollableFilteredList(
    ENSubstation150Filter(vENSubstation150Filter), 0, ColCount);

  LastCount := High(ENSubstation150List.list);

  if LastCount > -1 then sgStation.RowCount := LastCount + 2
  else sgStation.RowCount := 2;

  with sgStation do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubstation150List.list[i].code <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(ENSubstation150List.list[i].code)
        else Cells[0,  + 1] := ''; //Код станції
        Cells[1, i + 1] := ENSubstation150List.list[i].name; //Назва станції
        if ENSubstation150List.list[i].projectPower = nil then
          Cells[2,i + 1] := ''
        else Cells[2, i + 1] := //Проектна потужність, мВА
          ENSubstation150List.list[i].projectPower.DecimalString;
        Cells[3, i + 1] := IntToStr(ENSubstation150List.list[i].transformerCnt);
        Cells[4, i + 1] := ENSubstation150List.list[i].invNumber; //Інвентарний
        Cells[5, i + 1] := ENSubstation150List.list[i].buhName; //Бухгалтерське
        Cells[6, i + 1] := ENSubstation150List.list[i].operativeService;
        Cells[7, i + 1] := ENSubstation150List.list[i].repairService; //Ремонт
        LastRow := i + 1;
        sgENSubstation150.RowCount := LastRow + 1;
      end;
  ColCount := ColCount + 1;
  sgStation.Row := 1;
end;

procedure TfrmENSubstation150Edit.tbiDamagesXLSClick(Sender: TObject);
Var
  request: CCReportRequestEx;
  argNames, args: CCReportController.ArrayOfString;
  reportType : String;
begin

    if (ENSubstation150Obj.element=nil) or (ENSubstation150Obj.element.code=Low(Integer)) then
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
    args[1] := IntToStr(ENSubstation150Obj.element.code);

    request.argNames:=argNames;
    request.args:=args;
    request.resultType:=Low(Integer);

    request.funcName := '/com/ksoe/callcenter/reports/Dispetcher/ByNode_Damages_T32.jasper';
    reportType := 'xls';

    CCDMReport.makeGeneralReportPDF('RequestLog', request, reportType);
end;

procedure TfrmENSubstation150Edit.ToolButton62Click(Sender: TObject);
var
  TempENSubst150VRUZRU: ENSubst150VRUZRUControllerSoapPort;
begin

    TempENSubst150VRUZRU := HTTPRIOENSubst150VRUzru as ENSubst150VRUZRUControllerSoapPort;
    try
      if pcVRUZRU.ActivePage = tsVRU150 then
         ENSubst150VRUZRUObj := TempENSubst150VRUZRU.getObject(StrToInt(sgENSubst150VRU150.Cells[0, sgENSubst150VRU150.Row]));
      if pcVRUZRU.ActivePage = tsVRUZRU35 then
         ENSubst150VRUZRUObj := TempENSubst150VRUZRU.getObject(StrToInt(sgENSubst150VRUZRU35.Cells[0, sgENSubst150VRUZRU35.Row]));
      if pcVRUZRU.ActivePage = tsVRUZRU610 then
         ENSubst150VRUZRUObj := TempENSubst150VRUZRU.getObject(StrToInt(sgENSubst150VRUZRU6_10.Cells[0, sgENSubst150VRUZRU6_10.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150VRUZRUEdit := TfrmENSubst150VRUZRUEdit.Create(Application, dsView);
    if pcVRUZRU.ActivePage = tsVRU150 then
      begin
       frmENSubst150VRUzruEdit.Caption := ' ВРУ 150'
      end;
      if pcVRUZRU.ActivePage = tsVRUZRU35 then
      begin
      frmENSubst150VRUzruEdit.Caption := ' ВРУ ЗРУ 35'
      end;
      if pcVRUZRU.ActivePage = tsVRUZRU610 then
      begin
      frmENSubst150VRUzruEdit.Caption := ' ВРУ ЗРУ 6_10'
      end;
    try
      frmENSubst150VRUZRUEdit.ShowModal;
    finally
      frmENSubst150VRUZRUEdit.Free;
      frmENSubst150VRUZRUEdit := nil;
    end;

end;

procedure TfrmENSubstation150Edit.ToolButton64Click(Sender: TObject);
begin
  inherited;

    ENSubst150VRUzruObj:=ENSubst150VRUzru.Create;
    SetNullIntProps(ENSubst150VRUzruObj);
    SetNullXSProps(ENSubst150VRUzruObj);

    ENSubst150VRUzruObj.substationRef :=  ENSubstation150Ref.Create;
    ENSubst150VRUzruObj.substationRef.code := ENSubstation150Obj.code;

    ENSubst150VRUzruObj.typeRef:= ENSubst150VRUZRUTypeRef.Create;




    try
      frmENSubst150VRUzruEdit:=TfrmENSubst150VRUzruEdit.Create(Application, dsInsert);
      frmENSubst150VRUzruEdit.PageControl.ActivePage :=  frmENSubst150VRUzruEdit.tsmain;

      if pcVRUZRU.ActivePage = tsVRU150 then
      begin
       ENSubst150VRUzruObj.typeRef.code:= ENSUBST150VRUZRUTYPE_VRU150;
       frmENSubst150VRUzruEdit.Caption := ' ВРУ 150'
      end;
      if pcVRUZRU.ActivePage = tsVRUZRU35 then
      begin
      ENSubst150VRUzruObj.typeRef.code:= ENSUBST150VRUZRUTYPE_VRUZRU35;
      frmENSubst150VRUzruEdit.Caption := ' ВРУ ЗРУ 35'
      end;
      if pcVRUZRU.ActivePage = tsVRUZRU610 then
      begin
      ENSubst150VRUzruObj.typeRef.code:= ENSUBST150VRUZRUTYPE_VRUZRU6_10;
      frmENSubst150VRUzruEdit.Caption := ' ВРУ ЗРУ 6_10'
      end;

      try
        if frmENSubst150VRUzruEdit.ShowModal = mrOk then
        begin
          if ENSubst150VRUzruObj<>nil then

              UpdateVRUZRU;
        end;
      finally
        frmENSubst150VRUzruEdit.Free;
        frmENSubst150VRUzruEdit:=nil;
      end;
    finally
      ENSubst150VRUzruObj.Free;
    end;

end;

procedure TfrmENSubstation150Edit.ToolButton65Click(Sender: TObject);
Var TempENSubst150VRUzru: ENSubst150VRUzruControllerSoapPort;
  ObjCode: Integer;
begin
   TempENSubst150VRUzru := HTTPRIOENSubst150VRUzru as ENSubst150VRUzruControllerSoapPort;
     try
      if pcVRUZRU.ActivePage = tsVRU150 then
         ObjCode := StrToInt(sgENSubst150VRU150.Cells[0, sgENSubst150VRU150.Row]);
      if pcVRUZRU.ActivePage = tsVRUZRU35 then
         ObjCode := StrToInt(sgENSubst150VRUZRU35.Cells[0, sgENSubst150VRUZRU35.Row]);
      if pcVRUZRU.ActivePage = tsVRUZRU610 then
         ObjCode := StrToInt(sgENSubst150VRUZRU6_10.Cells[0, sgENSubst150VRUZRU6_10.Row]);

     except
     on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (ВРУ)?'),
                      PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        TempENSubst150VRUzru.remove(ObjCode);
        UpdateVRUZRU;
    end;

end;

procedure TfrmENSubstation150Edit.ToolButton66Click(Sender: TObject);
var
  TempENSubst150VRUzru: ENSubst150VRUzruControllerSoapPort;
  sgENSubst150VRUZRU : TadvStringGrid;
begin

       TempENSubst150VRUzru := HTTPRIOENSubst150VRUzru as ENSubst150VRUzruControllerSoapPort;
    try

      if pcVRUZRU.ActivePage = tsVRU150 then
         begin
          ENSubst150VRUZRUObj := TempENSubst150VRUZRU.getObject(StrToInt(sgENSubst150VRU150.Cells[0, sgENSubst150VRU150.Row]));
          sgENSubst150VRUZRU := sgENSubst150VRU150;
         end;
      if pcVRUZRU.ActivePage = tsVRUZRU35 then
        begin
          ENSubst150VRUZRUObj := TempENSubst150VRUZRU.getObject(StrToInt(sgENSubst150VRUZRU35.Cells[0, sgENSubst150VRUZRU35.Row]));
          sgENSubst150VRUZRU := sgENSubst150VRUZRU35;
        end;

      if pcVRUZRU.ActivePage = tsVRUZRU610 then
      begin
         ENSubst150VRUZRUObj := TempENSubst150VRUZRU.getObject(StrToInt(sgENSubst150VRUZRU6_10.Cells[0, sgENSubst150VRUZRU6_10.Row]));
         sgENSubst150VRUZRU := sgENSubst150VRUZRU6_10;
      end;

    except
      on EConvertError do Exit;
    end;


    frmENSubst150VRUzruEdit:=TfrmENSubst150VRUzruEdit.Create(Application, dsEdit);

    try
      if frmENSubst150VRUzruEdit.ShowModal= mrOk then
        begin

          updateVRUZRU;
        end;
    finally
      frmENSubst150VRUzruEdit.Free;
      frmENSubst150VRUzruEdit:=nil;
    end;

      sgENSubst150VRUzru.Row := sgENSubst150VRUzru.RowCount - 1;


end;

procedure TfrmENSubstation150Edit.ToolButton67Click(Sender: TObject);
begin
  inherited;
  updateVRUZRU;
end;

procedure TfrmENSubstation150Edit.actSubst2PowTransLinkExecute(Sender: TObject);
var ENSubstation150FilterObj: ENSubstation150Filter;
  condition, strSubst150PowerTransCodes: string;
  TempENSubst2PowTrans: ENSubst2PowTransControllerSoapPort;
  ENSubst2PowTransObj: ENSubst2PowTrans;
  fENSubstation150Show: TfrmENSubstation150Show; 
  i: Integer; 
  //vSubst150PowerTransCodes: ENSubst150PowerTransController.ArrayOfInteger;
  //strStationRefCodes: string;
  //vStationRefCodes: ENSubstation150Controller.ArrayOfInteger;
begin
  ShowENSubstation150.NameS150 := edtName.Text;
  strSubst150PowerTransCodes := ''; condition := ''; //Инициализация строк
  //strStationRefCodes := ''; 
  if vENSubst150PowerTransObjCode <= 0 then
    begin  
      strSubst150PowerTransCodes := 
        sgENSubst150PowerTrans.Cells[0, sgENSubst150PowerTrans.Row];
      if strSubst150PowerTransCodes <> '' then
        begin
          try //Код силового трансформатора
            vENSubst150PowerTransObjCode := 
              StrToInt(strSubst150PowerTransCodes);
          except
          end;
          strSubst150PowerTransCodes := ''; //Очистка строковой переменной
        end;      
    end;
  
  strSubst150PowerTransCodes := sgENSubst150PowerTrans.Cells[0, 1];
  
  if strSubst150PowerTransCodes = '' then
    Exit;
  //SetLength(vSubst150PowerTransCodes, sgENSubst150PowerTrans.RowCount - 1);
  //vSubst150PowerTransCodes[1] := StrToInt(strSubst150PowerTransCodes);    
  if i >= 2 then
    for i := 2 to sgENSubst150PowerTrans.RowCount - 1 do
      begin
        condition := sgENSubst150PowerTrans.Cells[0, i];
        if condition <> '' then //Заполнение строковой переменной
          begin
            strSubst150PowerTransCodes := 
              strSubst150PowerTransCodes + ', ' + condition;
            //vSubst150PowerTransCodes[i] := StrToInt(condition);
          end;
      end;
  condition := ''; //Очистка строковой переменной  

  ENSubstation150FilterObj := ENSubstation150Filter.Create;
  SetNullIntProps(ENSubstation150FilterObj);
  SetNullXSProps(ENSubstation150FilterObj);

  condition := ENSubstation150FilterObj.conditionSQL;
  AddCondition(condition, '(ensubstation150.code not in (' +
    '  select ensubst150powertrans.substationrefcode ' + 
    '  from ensubst150powertrans where ensubst150powertrans.code in (' +
       strSubst150PowerTransCodes + ')) and ensubstation150.code not in (' +
    'select ensubst2powtrans.substationrefcode from ensubst2powtrans ' +
    '  where ensubst2powtrans.powertransrefcode in (' +
       strSubst150PowerTransCodes + ')))');
  ENSubstation150FilterObj.conditionSQL := condition;

  fENSubstation150Show := TfrmENSubstation150Show.Create(
    Application, fmNormal, ENSubstation150FilterObj);
  try
    fENSubstation150Show.btnOk.Visible := True;
    fENSubstation150Show.chkIsVirtStation.Visible := True;
    if fENSubstation150Show.ShowModal = mrOk then
      begin
        ENSubst2PowTransObj := ENSubst2PowTrans.Create;
        ENSubst2PowTransObj.name := ENSubstation150FilterObj.name + ' на ' +
          ShowENSubstation150.NameS150;
        ENSubst2PowTransObj.powerTransRef := ENSubst150PowerTransRef.Create;
        ENSubst2PowTransObj.powerTransRef.code := vENSubst150PowerTransObjCode;
        ENSubst2PowTransObj.substationRef := ENSubstation150Ref.Create;
        ENSubst2PowTransObj.substationRef.code := ShowENSubstation150.CodeS150;
        if ShowENSubstation150.isVirtStation then
          ENSubst2PowTransObj.isVirt := 1
        else
          ENSubst2PowTransObj.isVirt := 0;
        TempENSubst2PowTrans :=
          HTTPRIOENSubst2PowTrans as ENSubst2PowTransControllerSoapPort;
        TempENSubst2PowTrans.add(ENSubst2PowTransObj);
        //actUpdate.Execute;
        actUpdateLinkStation.Execute;
      end;
  finally
    fENSubstation150Show.Free;
    fENSubstation150Show := nil;
  end;
end;

procedure TfrmENSubstation150Edit.actSubst2PowTransUnLinkExecute(
  Sender: TObject);
var TempENSubst2PowTrans: ENSubst2PowTransControllerSoapPort;
  ENSubst2PowTransFilterObj: ENSubst2PowTransFilter;
  condition: String;
  vENSubst2PowTransCodes: ENSubst2PowTransController.ArrayOfInteger;
  i: Integer;
begin
  condition := ''; //Инициализация строковой переменной
  if vENSubst150PowerTransObjCode <= 0 then
    begin  
      condition :=  sgENSubst150PowerTrans.Cells[0, sgENSubst150PowerTrans.Row];
      if condition <> '' then
        begin
          try //Код силового трансформатора
            vENSubst150PowerTransObjCode := StrToInt(condition);
          except
          end;
          condition := ''; //Очистка строковой переменной
        end;      
    end;

  if vStationLinkCode <= 0 then
    vStationLinkCode := StrToInt( //Задание кода связанной Станции
      sgENSubstation150.Cells[0, sgENSubstation150.Row]);

  if (vENSubst150PowerTransObjCode <= 0) or (vStationLinkCode <= 0) then
    Exit;

  ENSubst2PowTransFilterObj := ENSubst2PowTransFilter.Create;

  try
    SetNullIntProps(ENSubst2PowTransFilterObj);
    SetNullXSProps(ENSubst2PowTransFilterObj);

    ENSubst2PowTransFilterObj.powerTransRef := ENSubst150PowerTransRef.Create;
    ENSubst2PowTransFilterObj.powerTransRef.code :=
      vENSubst150PowerTransObjCode;
    ENSubst2PowTransFilterObj.substationRef := ENSubstation150Ref.Create;
    ENSubst2PowTransFilterObj.substationRef.code := vStationLinkCode;

    TempENSubst2PowTrans :=
      HTTPRIOENSubst2PowTrans as ENSubst2PowTransControllerSoapPort;

    vENSubst2PowTransCodes :=
      TempENSubst2PowTrans.getScrollableFilteredCodeArray(
        ENSubst2PowTransFilterObj, 0, -1);

    if Length(vENSubst2PowTransCodes) > 0 then
      begin
        for i := Low(vENSubst2PowTransCodes) to High(vENSubst2PowTransCodes) do
          TempENSubst2PowTrans.remove(vENSubst2PowTransCodes[i]);
        //actUpdate.Execute;
        actUpdateLinkStation.Execute;
      end;
  finally
    ENSubst2PowTransFilterObj.Free;
    ENSubst2PowTransFilterObj := nil;
  end;
end;

procedure TfrmENSubstation150Edit.actViewExecute(Sender: TObject);
Var
  TempENSubst150PowerTrans: ENSubst150PowerTransControllerSoapPort;
  TempENSubst150OwnTrans: ENSubst150OwnTransControllerSoapPort;
  TempENSubst150VoltTrans: ENSubst150VoltTransControllerSoapPort;
  TempENSubst150Cell: ENSubst150CellControllerSoapPort;
  TempENSubst150Discharger: ENSubst150DischargerControllerSoapPort;
  TempENSubst150Battery: ENSubst150BatteryControllerSoapPort;
  TempENGauge150 : ENGauge150ControllerSoapPort;
  sgENSubst150Cell: TAdvStringGrid;
begin

  if pcSubstationData.ActivePage = tsSubstation150Gauge then
  begin
    TempENGauge150 := HTTPRIOENGauge150 as ENGauge150ControllerSoapPort;

    try
      ENGauge150Obj := TempENGauge150.getObject(StrToInt(sgENGauge150.Cells[0,sgENGauge150.Row]));
    except
      on EConvertError do Exit;
    end;
    frmENGauge150Edit:=TfrmENGauge150Edit.Create(Application, dsView);
    try
      frmENGauge150Edit.ShowModal;
    finally
      frmENGauge150Edit.Free;
      frmENGauge150Edit := nil;
    end;
  end;

  if pcSubstation150.ActivePage = tsPowerTrans then
  begin
    TempENSubst150PowerTrans := HTTPRIOENSubst150PowerTrans as ENSubst150PowerTransControllerSoapPort;
    try
      ENSubst150PowerTransObj := TempENSubst150PowerTrans.getObject(StrToInt(sgENSubst150PowerTrans.Cells[0, sgENSubst150PowerTrans.Row]));
    except
      on EConvertError do Exit;
    end;
    frmENSubst150PowerTransEdit := TfrmENSubst150PowerTransEdit.Create(Application, dsView);
    try
      frmENSubst150PowerTransEdit.ShowModal;
    finally
      frmENSubst150PowerTransEdit.Free;
      frmENSubst150PowerTransEdit := nil;
    end;
  end;

  if pcSubstation150.ActivePage = tsOwnTrans then
  begin
    TempENSubst150OwnTrans := HTTPRIOENSubst150OwnTrans as ENSubst150OwnTransControllerSoapPort;
    try
      ENSubst150OwnTransObj := TempENSubst150OwnTrans.getObject(StrToInt(sgENSubst150OwnTrans.Cells[0, sgENSubst150OwnTrans.Row]));
    except
      on EConvertError do Exit;
    end;
    frmENSubst150OwnTransEdit := TfrmENSubst150OwnTransEdit.Create(Application, dsView);
    try
      frmENSubst150OwnTransEdit.ShowModal;
    finally
      frmENSubst150OwnTransEdit.Free;
      frmENSubst150OwnTransEdit := nil;
    end;
  end;

  if pcSubstation150.ActivePage = tsVoltTrans then
  begin
    TempENSubst150VoltTrans := HTTPRIOENSubst150VoltTrans as ENSubst150VoltTransControllerSoapPort;
    try
      ENSubst150VoltTransObj := TempENSubst150VoltTrans.getObject(StrToInt(sgENSubst150VoltTrans.Cells[0, sgENSubst150VoltTrans.Row]));
    except
      on EConvertError do Exit;
    end;
    frmENSubst150VoltTransEdit := TfrmENSubst150VoltTransEdit.Create(Application, dsView);
    try
      frmENSubst150VoltTransEdit.ShowModal;
    finally
      frmENSubst150VoltTransEdit.Free;
      frmENSubst150VoltTransEdit := nil;
    end;
  end;

  if (pcSubstation150.ActivePage = tsCell150) or
     (pcSubstation150.ActivePage = tsCell35) or
     (pcSubstation150.ActivePage = tsCell10) then
  begin
    sgENSubst150Cell := GetCellGridByTabSheet(pcSubstation150.ActivePage);

    TempENSubst150Cell := HTTPRIOENSubst150Cell as ENSubst150CellControllerSoapPort;
    try
      ENSubst150CellObj := TempENSubst150Cell.getObject(StrToInt(sgENSubst150Cell.Cells[0, sgENSubst150Cell.Row]));
    except
      on EConvertError do Exit;
    end;
    frmENSubst150CellEdit := TfrmENSubst150CellEdit.Create(Application, dsView);
    try
      frmENSubst150CellEdit.ShowModal;
    finally
      frmENSubst150CellEdit.Free;
      frmENSubst150CellEdit := nil;
    end;
  end;

  if pcSubstation150.ActivePage = tsDischarger then
  begin
    TempENSubst150Discharger := HTTPRIOENSubst150Discharger as ENSubst150DischargerControllerSoapPort;
    try
      ENSubst150DischargerObj := TempENSubst150Discharger.getObject(StrToInt(sgENSubst150Discharger.Cells[0, sgENSubst150Discharger.Row]));
    except
      on EConvertError do Exit;
    end;
    frmENSubst150DischargerEdit := TfrmENSubst150DischargerEdit.Create(Application, dsView);
    try
      frmENSubst150DischargerEdit.ShowModal;
    finally
      frmENSubst150DischargerEdit.Free;
      frmENSubst150DischargerEdit := nil;
    end;
  end;

  if pcSubstation150.ActivePage = tsBattery then
  begin
    TempENSubst150Battery := HTTPRIOENSubst150Battery as ENSubst150BatteryControllerSoapPort;
    try
      ENSubst150BatteryObj := TempENSubst150Battery.getObject(StrToInt(sgENSubst150Battery.Cells[0, sgENSubst150Battery.Row]));
    except
      on EConvertError do Exit;
    end;
    frmENSubst150BatteryEdit := TfrmENSubst150BatteryEdit.Create(Application, dsView);
    try
      frmENSubst150BatteryEdit.ShowModal;
    finally
      frmENSubst150BatteryEdit.Free;
      frmENSubst150BatteryEdit := nil;
    end;
  end;
end;

procedure TfrmENSubstation150Edit.WriteOffOnlyEnergyNET(Sender: TObject);
var TempENEstimateItem: ENEstimateItemControllerSoapPort;
eiCode : Integer;
masterMOLCode:String;
ENEstimateItemObj: ENEstimateItem;
selectedFinMol : FINMolShort;
begin
  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

    if sgIssue.Cells[0,sgIssue.Row] <> '' then
    begin
        try
          eiCode := StrToInt(sgIssue.Cells[0,sgIssue.Row]);
        except
        on EConvertError do Exit;
        end;


    end;
    selectedFinMol := TfrmFINMolShow.chooseFromList();
    if Assigned(selectedFinMol) then begin
            masterMOLCode := selectedFinMol.id;

            ENEstimateItemObj := ENEstimateItem.Create;
            ENEstimateItemObj.code := eiCode;
            ENEstimateItemObj.countFact := TXSDecimal.Create;
            ENEstimateItemObj.countFact.DecimalString := sgIssue.Cells[6,sgIssue.Row];


            TempENEstimateItem.writeOffZZOnlyEnergyNETBySubstation150Object(ENEstimateItemObj ,  masterMOLCode   );
            Self.pcCardDataChange(Sender);
    end;
end;

procedure TfrmENSubstation150Edit.actEditExecute(Sender: TObject);
Var TempENSubst150PowerTrans: ENSubst150PowerTransControllerSoapPort;
    TempENSubst150OwnTrans: ENSubst150OwnTransControllerSoapPort;
    TempENSubst150VoltTrans: ENSubst150VoltTransControllerSoapPort;
    TempENSubst150Cell: ENSubst150CellControllerSoapPort;
    TempENSubst150Discharger: ENSubst150DischargerControllerSoapPort;
    TempENSubst150Battery: ENSubst150BatteryControllerSoapPort;
    
    voltageClass: Integer;
    sgENSubst150Cell: TAdvStringGrid;
begin
  if pcSubstation150.ActivePage = tsPowerTrans then
  begin
    TempENSubst150PowerTrans := HTTPRIOENSubst150PowerTrans as ENSubst150PowerTransControllerSoapPort;
    try
      ENSubst150PowerTransObj := TempENSubst150PowerTrans.getObject(StrToInt(sgENSubst150PowerTrans.Cells[0, sgENSubst150PowerTrans.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150PowerTransEdit := TfrmENSubst150PowerTransEdit.Create(Application, dsEdit);
    try
      if frmENSubst150PowerTransEdit.ShowModal= mrOk then
        LoadPowerTransList();
    finally
      frmENSubst150PowerTransEdit.Free;
      frmENSubst150PowerTransEdit := nil;
    end;
  end;

  if pcSubstation150.ActivePage = tsOwnTrans then
  begin
    TempENSubst150OwnTrans := HTTPRIOENSubst150OwnTrans as ENSubst150OwnTransControllerSoapPort;
    try
      ENSubst150OwnTransObj := TempENSubst150OwnTrans.getObject(StrToInt(sgENSubst150OwnTrans.Cells[0, sgENSubst150OwnTrans.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150OwnTransEdit := TfrmENSubst150OwnTransEdit.Create(Application, dsEdit);
    try
      if frmENSubst150OwnTransEdit.ShowModal= mrOk then
        LoadOwnTransList();
    finally
      frmENSubst150OwnTransEdit.Free;
      frmENSubst150OwnTransEdit := nil;
    end;
  end;

  if pcSubstation150.ActivePage = tsVoltTrans then
  begin
    TempENSubst150VoltTrans := HTTPRIOENSubst150VoltTrans as ENSubst150VoltTransControllerSoapPort;
    try
      ENSubst150VoltTransObj := TempENSubst150VoltTrans.getObject(StrToInt(sgENSubst150VoltTrans.Cells[0, sgENSubst150VoltTrans.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150VoltTransEdit := TfrmENSubst150VoltTransEdit.Create(Application, dsEdit);
    try
      if frmENSubst150VoltTransEdit.ShowModal= mrOk then
        LoadVoltTransList();
    finally
      frmENSubst150VoltTransEdit.Free;
      frmENSubst150VoltTransEdit := nil;
    end;
  end;

  if (pcSubstation150.ActivePage = tsCell150) or
     (pcSubstation150.ActivePage = tsCell35) or
     (pcSubstation150.ActivePage = tsCell10) then
  begin
    sgENSubst150Cell := GetCellGridByTabSheet(pcSubstation150.ActivePage);
    voltageClass := GetCellVoltageClassByTabSheet(pcSubstation150.ActivePage);
      
    TempENSubst150Cell := HTTPRIOENSubst150Cell as ENSubst150CellControllerSoapPort;
    try
      ENSubst150CellObj := TempENSubst150Cell.getObject(StrToInt(sgENSubst150Cell.Cells[0, sgENSubst150Cell.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150CellEdit := TfrmENSubst150CellEdit.Create(Application, dsEdit);
    {if (pcSubstation150.ActivePage = tsCell10) then
    begin
      frmENSubst150CellEdit.tsSubst150RZA.TabVisible := false;
      frmENSubst150CellEdit.tsSubst150TN.TabVisible := false;
      frmENSubst150CellEdit.tsSubst150TVP.TabVisible := false;
      frmENSubst150CellEdit.tsSubst150DGK.TabVisible := false;
      frmENSubst150CellEdit.tsSubst150PullOutElement.TabVisible := false;
      frmENSubst150CellEdit.tsSubst150TireSection.TabVisible := false;
      frmENSubst150CellEdit.tsSubst150ControlCable.TabVisible := false;
    end;}

    try
      if frmENSubst150CellEdit.ShowModal= mrOk then
        LoadCellList(voltageClass);
    finally
      frmENSubst150CellEdit.Free;
      frmENSubst150CellEdit := nil;
    end;  
  end;
    
  if pcSubstation150.ActivePage = tsDischarger then
  begin
    TempENSubst150Discharger := HTTPRIOENSubst150Discharger as ENSubst150DischargerControllerSoapPort;
    try
      ENSubst150DischargerObj := TempENSubst150Discharger.getObject(StrToInt(sgENSubst150Discharger.Cells[0, sgENSubst150Discharger.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150DischargerEdit := TfrmENSubst150DischargerEdit.Create(Application, dsEdit);
    try
      if frmENSubst150DischargerEdit.ShowModal= mrOk then
        LoadDischargerList();
    finally
      frmENSubst150DischargerEdit.Free;
      frmENSubst150DischargerEdit := nil;
    end;
  end;

  if pcSubstation150.ActivePage = tsBattery then
  begin
    TempENSubst150Battery := HTTPRIOENSubst150Battery as ENSubst150BatteryControllerSoapPort;
    try
      ENSubst150BatteryObj := TempENSubst150Battery.getObject(StrToInt(sgENSubst150Battery.Cells[0, sgENSubst150Battery.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150BatteryEdit := TfrmENSubst150BatteryEdit.Create(Application, dsEdit);
    try
      if frmENSubst150BatteryEdit.ShowModal= mrOk then
        LoadBatteryList();
    finally
      frmENSubst150BatteryEdit.Free;
      frmENSubst150BatteryEdit := nil;
    end;
  end;
end;

procedure TfrmENSubstation150Edit.actAirLineSupplier150_35_UpdateExecute(
  Sender: TObject);
begin
  AirLineSupplier150_35_Energized35_Update(True);
end;

procedure TfrmENSubstation150Edit.actAddAttachmentExecute(Sender: TObject);
begin
  ENDocAttachmentObj := ENDocAttachment.Create;
  try
    frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
    frmDFDocAttachmentEdit.elementCode := ENSubstation150Obj.element.code;
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


procedure TfrmENSubstation150Edit.actAirLineEnergized10_UpdateExecute(
  Sender: TObject);
var i, j: Integer;
  TempENLine10: ENLine10ControllerSoapPort;
  ENLine10List: ENLine10ShortList; vENLine10Filter: ENLine10Filter;
begin
  for i := 1 to sgENLine10.RowCount-1 do
    for j := 0 to sgENLine10.ColCount-1 do
      sgENLine10.Cells[j, i] := '';
  FormatSettings.DecimalSeparator := '.';
  //SetGridHeaders(ENLine10Headers, sgENLine10.ColumnHeaders);
  ColCount := -1;
  TempENLine10 :=  HTTPRIOENLine10 as ENLine10ControllerSoapPort;

  if vENLine10Filter = nil then
    begin
      vENLine10Filter := ENLine10Filter.Create;
      SetNullIntProps(vENLine10Filter);
      SetNullXSProps(vENLine10Filter);
    end;

  vENLine10Filter.conditionSQL :=
    'ENLINE10.CODE in (select line10refcode from enline10supplies ' +
    '  where substation150refcode = ' + IntToStr(vStationCode) + ')';

  ENLine10List := TempENLine10.getScrollableFilteredList(ENLine10Filter(
    vENLine10Filter), 0, ColCount);

  LastCount := High(ENLine10List.list);

  if LastCount > -1 then sgENLine10.RowCount := LastCount + 2
  else sgENLine10.RowCount:=2;

  with sgENLine10 do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLine10List.list[i].code <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(ENLine10List.list[i].code)
        else Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENLine10List.list[i].invNumber;
        Cells[2, i + 1] := ENLine10List.list[i].name;
        Cells[3, i + 1] := ENLine10List.list[i].renRefName;
        Cells[4, i + 1] := ENLine10List.list[i].buhName;
        if ENLine10List.list[i].lineLength = nil then
          Cells[5, i + 1] := ''
        else
          Cells[5, i + 1] := ENLine10List.list[i].lineLength.DecimalString;
        if ENLine10List.list[i].yearBuild = Low(Integer) then
          Cells[6, i + 1] := ''
        else
          Cells[6, i + 1] := IntToStr(ENLine10List.list[i].yearBuild);
        if ENLine10List.list[i].yearWorkingStart = Low(Integer) then
          Cells[7, i + 1] := ''
        else
          Cells[7, i + 1] := IntToStr(ENLine10List.list[i].yearWorkingStart);
        if ENLine10List.list[i].lastRepairDate = nil then
          Cells[8, i + 1] := ''
        else
          Cells[8, i + 1] := XSDate2String(ENLine10List.list[i].lastRepairDate);
        LastRow:=i+1;
        sgENLine10.RowCount:=LastRow+1;
      end;
  ColCount := ColCount + 1;
  sgENLine10.Row := 1;
end;

procedure TfrmENSubstation150Edit.actAirLineEnergized35_UpdateExecute(
  Sender: TObject);
begin
  AirLineSupplier150_35_Energized35_Update(False);
end;

procedure TfrmENSubstation150Edit.AirLineSupplier150_35_Energized35_Update(
  isSupplier: Boolean);
var i, j: Integer; sgENLineHighVolt: TAdvStringGrid;
  TempENLine150: ENLine150ControllerSoapPort;
  ENLine150List: ENLine150ShortList; vENLine150Filter: ENLine150Filter;
begin
  if isSupplier then sgENLineHighVolt := sgENLineSupplier150_35
  else sgENLineHighVolt := sgENLineEnergized35;
  for i := 1 to sgENLineHighVolt.RowCount - 1 do
    for j := 0 to sgENLineHighVolt.ColCount - 1 do
      sgENLineHighVolt.Cells[j, i]:='';

  ColCount := 100;
  if isSupplier then
    TempENLine150 := HTTPRIOENLineSupplier150_35 as ENLine150ControllerSoapPort
  else
    TempENLine150 := HTTPRIOENLineEnergized35 as ENLine150ControllerSoapPort;

  if vENLine150Filter = nil then
    begin
      vENLine150Filter := ENLine150Filter.Create;
      SetNullIntProps(vENLine150Filter);
      SetNullXSProps(vENLine150Filter);
    end;

  if isSupplier then vENLine150Filter.conditionSQL := 'ENLINE150.CODE in (' +
    '  select enline150refcode from ensubst150toline ' +
    '  where substationrefcode = ' + IntToStr(vStationCode) + ')'
  else vENLine150Filter.conditionSQL := 'ENLINE150.CODE in (' +
    '  select enline35refcode from ensubst150line35energized' +
    '  where substationrefcode = ' + IntToStr(vStationCode) + ')';

  ENLine150List := TempENLine150.getScrollableFilteredList(
    ENLine150Filter(vENLine150Filter), 0, ColCount);

  LastCount := High(ENLine150List.list);

  if LastCount > -1 then sgENLineHighVolt.RowCount := LastCount+2
  else sgENLineHighVolt.RowCount := 2;

  with sgENLineHighVolt do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLine150List.list[i].code <> Low(Integer) then
        Cells[0, i + 1] := IntToStr(ENLine150List.list[i].code)
        else
        Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENLine150List.list[i].invNumber;
        Cells[2, i + 1] := ENLine150List.list[i].name;
        Cells[3, i + 1] := ENLine150List.list[i].buhName;
        if ENLine150List.list[i].lineLength = nil then Cells[4, i + 1] := ''
        else Cells[4, i + 1] := ENLine150List.list[i].lineLength.DecimalString;
        if ENLine150List.list[i].yearBuild = Low(Integer) then
          Cells[5, i + 1] := ''
        else Cells[5, i + 1] := IntToStr(ENLine150List.list[i].yearBuild);
        if ENLine150List.list[i].yearWorkingStart = Low(Integer) then
          Cells[6, i + 1] := ''
        else Cells[6, i + 1] :=
          IntToStr(ENLine150List.list[i].yearWorkingStart);
        if ENLine150List.list[i].chainsLength = nil then Cells[7, i + 1] := ''
        else Cells[7, i + 1] :=
          ENLine150List.list[i].chainsLength.DecimalString;
        if ENLine150List.list[i].chains2Length = nil then Cells[8, i + 1] := ''
        else Cells[8, i + 1] :=
          ENLine150List.list[i].chains2Length.DecimalString;
        if ENLine150List.list[i].lastRepairDate = nil then
          Cells[9, i + 1] := ''
        else Cells[9, i + 1] :=
          XSDate2String(ENLine150List.list[i].lastRepairDate);
        LastRow := i + 1;
        sgENLineHighVolt.RowCount := LastRow + 1;
      end;
  ColCount := ColCount + 1;
  sgENLineHighVolt.Row := 1;
end;

procedure TfrmENSubstation150Edit.actDeleteAttachmentExecute(Sender: TObject);
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

procedure TfrmENSubstation150Edit.actDeleteExecute(Sender: TObject);
var
  gaugeCode, ObjCode, voltageClass: Integer;
  TempENSubst150PowerTrans: ENSubst150PowerTransControllerSoapPort;
  TempENSubst150OwnTrans: ENSubst150OwnTransControllerSoapPort;
  TempENSubst150VoltTrans: ENSubst150VoltTransControllerSoapPort;
  TempENSubst150Cell: ENSubst150CellControllerSoapPort;
  TempENSubst150Discharger: ENSubst150DischargerControllerSoapPort;
  TempENSubst150Battery: ENSubst150BatteryControllerSoapPort;

  sgENSubst150Cell: TAdvStringGrid;
  TempENGauge150: ENGauge150ControllerSoapPort;
begin

  if pcSubstationData.ActivePage = tsSubstation150Gauge then
  begin
    TempENGauge150 := HTTPRIOENGauge150 as ENGauge150ControllerSoapPort;
    try
      gaugeCode := StrToInt(sgENGauge150.Cells[0,sgENGauge150.Row]);
    except
    on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('Вы действительно хотите удалить (Режимные замеры на Трансформаторных Подстанциях 35-150/6-10-35 кВ)?'),
          PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
      TempENGauge150.remove(gaugeCode);
      actUpdateExecute(Sender);
    end;
  end;

  if pcSubstation150.ActivePage = tsPowerTrans then
  begin
    TempENSubst150PowerTrans := HTTPRIOENSubst150PowerTrans as ENSubst150PowerTransControllerSoapPort;
    try
      ObjCode := StrToInt(sgENSubst150PowerTrans.Cells[0, sgENSubst150PowerTrans.Row]);
    except
      on EConvertError do Exit;
    end;

    if Application.MessageBox(PChar('Вы действительно хотите удалить запись ?'),
                      PChar('Внимание !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
    begin
      TempENSubst150PowerTrans.remove(ObjCode);
      LoadPowerTransList();
    end;
  end;

  if pcSubstation150.ActivePage = tsOwnTrans then
  begin
    TempENSubst150OwnTrans := HTTPRIOENSubst150OwnTrans as ENSubst150OwnTransControllerSoapPort;
    try
      ObjCode := StrToInt(sgENSubst150OwnTrans.Cells[0, sgENSubst150OwnTrans.Row]);
    except
      on EConvertError do Exit;
    end;

    if Application.MessageBox(PChar('Вы действительно хотите удалить запись ?'),
                      PChar('Внимание !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
    begin
      TempENSubst150OwnTrans.remove(ObjCode);
      LoadOwnTransList();
    end;
  end;

  if pcSubstation150.ActivePage = tsVoltTrans then
  begin
    TempENSubst150VoltTrans := HTTPRIOENSubst150VoltTrans as ENSubst150VoltTransControllerSoapPort;
    try
      ObjCode := StrToInt(sgENSubst150VoltTrans.Cells[0, sgENSubst150VoltTrans.Row]);
    except
      on EConvertError do Exit;
    end;

    if Application.MessageBox(PChar('Вы действительно хотите удалить запись ?'),
                      PChar('Внимание !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
    begin
      TempENSubst150VoltTrans.remove(ObjCode);
      LoadVoltTransList();
    end;
  end;

  if (pcSubstation150.ActivePage = tsCell150) or
     (pcSubstation150.ActivePage = tsCell35) or
     (pcSubstation150.ActivePage = tsCell10) then
  begin
    sgENSubst150Cell := GetCellGridByTabSheet(pcSubstation150.ActivePage);
    voltageClass := GetCellVoltageClassByTabSheet(pcSubstation150.ActivePage);

    TempENSubst150Cell := HTTPRIOENSubst150Cell as ENSubst150CellControllerSoapPort;
    try
      ObjCode := StrToInt(sgENSubst150Cell.Cells[0, sgENSubst150Cell.Row]);
    except
      on EConvertError do Exit;
    end;

    if Application.MessageBox(PChar('Вы действительно хотите удалить запись ?'),
                      PChar('Внимание !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
    begin
      TempENSubst150Cell.remove(ObjCode);
      LoadCellList(voltageClass);
    end;
  end;  

  if pcSubstation150.ActivePage = tsDischarger then
  begin
    TempENSubst150Discharger := HTTPRIOENSubst150Discharger as ENSubst150DischargerControllerSoapPort;
    try
      ObjCode := StrToInt(sgENSubst150Discharger.Cells[0, sgENSubst150Discharger.Row]);
    except
      on EConvertError do Exit;
    end;

    if Application.MessageBox(PChar('Вы действительно хотите удалить запись ?'),
                      PChar('Внимание !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
    begin
      TempENSubst150Discharger.remove(ObjCode);
      LoadDischargerList();
    end;
  end;

  if pcSubstation150.ActivePage = tsBattery then
  begin
    TempENSubst150Battery := HTTPRIOENSubst150Battery as ENSubst150BatteryControllerSoapPort;
    try
      ObjCode := StrToInt(sgENSubst150Battery.Cells[0, sgENSubst150Battery.Row]);
    except
      on EConvertError do Exit;
    end;

    if Application.MessageBox(PChar('Вы действительно хотите удалить запись ?'),
                      PChar('Внимание !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
    begin
      TempENSubst150Battery.remove(ObjCode);
      LoadBatteryList();
    end;
  end;
end;

procedure TfrmENSubstation150Edit.actUpdateExecute(Sender: TObject);
begin
  if pcSubstation150.ActivePage = tsPowerTrans then
    LoadPowerTransList();

  if pcSubstation150.ActivePage = tsOwnTrans then
    LoadOwnTransList();

  if pcSubstation150.ActivePage = tsVoltTrans then
    LoadVoltTransList();

  /////
  if pcSubstation150.ActivePage = tsCell150 then
    LoadCellList(ENVOLTAGECLASS_150);

  if pcSubstation150.ActivePage = tsCell35 then
    LoadCellList(ENVOLTAGECLASS_35);

  if pcSubstation150.ActivePage = tsCell10 then
    LoadCellList(ENVOLTAGECLASS_10);
  /////

  if pcSubstation150.ActivePage = tsDischarger then
    LoadDischargerList();

  if pcSubstation150.ActivePage = tsBattery then
    LoadBatteryList();

  if pcSubstationData.ActivePage = tsSubstation150Gauge then
    LoadGauge();

  if pcSubstation150.ActivePage = tsCCElement then
    LoadCCElement();

  if pcSubstation150.ActivePage = tsCCDamageLog then
    LoadCCDamageLog();

  if pcSubstation150.ActivePage = tsAttachments then
  begin;
    SetGridHeaders(ENDocAttachmentHeaders, sgENDocAttachment.ColumnHeaders);
    ClearGrid(sgENDocAttachment);
    updateAttachments;
  end;

end;


procedure TfrmENSubstation150Edit.clearLinkStation;
var i, j: Integer;
begin
  for i := 1 to sgENSubstation150.RowCount - 1 do
    for j := 0 to sgENSubstation150.ColCount - 1 do
      sgENSubstation150.Cells[j, i] := '';
end;


procedure TfrmENSubstation150Edit.actUpdateLinkStationExecute(Sender: TObject);
var i: Integer;
  condition: string;
  ENSubstation150List: ENSubstation150ShortList;
  vENSubstation150Filter: ENSubstation150Filter;
  TempENSubstation150: ENSubstation150ControllerSoapPort;
begin //Обновление списка инвентарных номеров станций
  FormatSettings.DecimalSeparator := '.';
  SetGridHeaders(ENSubstation150Headers, sgENSubstation150.ColumnHeaders);
  clearLinkStation;
  ColCount := 100;
  TempENSubstation150 :=
    HTTPRIOENSubstation150 as ENSubstation150ControllerSoapPort;
  vENSubstation150Filter := ENSubstation150Filter.Create;
  SetNullIntProps(vENSubstation150Filter);
  SetNullXSProps(vENSubstation150Filter);
  condition := vENSubstation150Filter.conditionSQL;

  AddCondition(condition, '(ensubstation150.code in (' +
    '  select ensubst150powertrans.substationrefcode ' +
    '  from ensubst150powertrans where ensubst150powertrans.code = ' +
       IntToStr(vENSubst150PowerTransObjCode) + ')' + 
    'or ensubstation150.code in (select ensubst2powtrans.substationrefcode ' + 
    '  from ensubst2powtrans where ensubst2powtrans.powertransrefcode = ' + 
       IntToStr(vENSubst150PowerTransObjCode) + '))');

  vENSubstation150Filter.conditionSQL := condition;

  ENSubstation150List := TempENSubstation150.getScrollableFilteredList(
    vENSubstation150Filter, 0, ColCount);

  LastCount := High(ENSubstation150List.list);

  if LastCount > -1 then
    sgENSubstation150.RowCount := LastCount + 2
  else
    sgENSubstation150.RowCount := 2;

  with sgENSubstation150 do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubstation150List.list[i].code <> Low(Integer) then
        Cells[0, i + 1] := IntToStr(ENSubstation150List.list[i].code)
        else
        Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENSubstation150List.list[i].name;
        if ENSubstation150List.list[i].projectPower = nil then
          Cells[2, i + 1] := ''
        else
          Cells[2, i + 1] :=
            ENSubstation150List.list[i].projectPower.DecimalString;
        Cells[3, i + 1] := ENSubstation150List.list[i].operativeService;
        Cells[4, i + 1] := ENSubstation150List.list[i].repairService;
        Cells[5, i + 1] := ENSubstation150List.list[i].buhName;
        Cells[6, i + 1] := ENSubstation150List.list[i].invNumber;
        Cells[7, i + 1] :=
          IntToStr(ENSubstation150List.list[i].transformerCnt);
        LastRow := i + 1;
        sgENSubstation150.RowCount := LastRow + 1;
      end;
  ColCount := ColCount + 1;
  //if sgENSubstation150.Row = 1 then
  //  begin
  //    vStationLinkCode := StrToInt( //Задание кода связанной Станции
  //      sgENSubstation150.Cells[0, sgENSubstation150.Row]);
  //    actUpdateSubst150PowerTrans.Execute;
  //  end
  //else
    sgENSubstation150.Row := 1;
  vStationLinkCode := StrToInt( //Задание кода связанной Станции
    sgENSubstation150.Cells[0, sgENSubstation150.Row]);    
end;

procedure TfrmENSubstation150Edit.LoadOwnTransList;
var
  TempENSubst150OwnTrans: ENSubst150OwnTransControllerSoapPort;
  i, LastCount: Integer;
  ENSubst150OwnTransList: ENSubst150OwnTransShortList;
  ownTransFilter: ENSubst150OwnTransFilter;
begin
  ClearGrid(sgENSubst150OwnTrans);
  
  TempENSubst150OwnTrans := HTTPRIOENSubst150OwnTrans as ENSubst150OwnTransControllerSoapPort;

  ownTransFilter := ENSubst150OwnTransFilter.Create;
  SetNullIntProps(ownTransFilter);
  SetNullXSProps(ownTransFilter);

  ownTransFilter.substationRef := ENSubstation150Ref.Create;
  ownTransFilter.substationRef.code := ENSubstation150Obj.code;

  ENSubst150OwnTransList := TempENSubst150OwnTrans.getScrollableFilteredList(ownTransFilter, 0, -1);

  LastCount := High(ENSubst150OwnTransList.list);

  if LastCount > -1 then
     sgENSubst150OwnTrans.RowCount := LastCount + 2
  else
     sgENSubst150OwnTrans.RowCount := 2;

   with sgENSubst150OwnTrans do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if ENSubst150OwnTransList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSubst150OwnTransList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSubst150OwnTransList.list[i].name;
        Cells[2,i+1] := ENSubst150OwnTransList.list[i].factoryNumber;

        Cells[3,i+1] := ENSubst150OwnTransList.list[i].typeRefName;
        Cells[4,i+1] := ENSubst150OwnTransList.list[i].voltageClassRefDescription;

        if ENSubst150OwnTransList.list[i].power = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENSubst150OwnTransList.list[i].power.DecimalString;

        sgENSubst150OwnTrans.RowCount := i + 2;
      end;

   sgENSubst150OwnTrans.Row := 1;
end;

procedure TfrmENSubstation150Edit.LoadVoltTransList;
var
  TempENSubst150VoltTrans: ENSubst150VoltTransControllerSoapPort;
  i, LastCount: Integer;
  ENSubst150VoltTransList: ENSubst150VoltTransShortList;
  voltTransFilter: ENSubst150VoltTransFilter;
begin
  ClearGrid(sgENSubst150VoltTrans);
  
  TempENSubst150VoltTrans := HTTPRIOENSubst150VoltTrans as ENSubst150VoltTransControllerSoapPort;

  voltTransFilter := ENSubst150VoltTransFilter.Create;
  SetNullIntProps(voltTransFilter);
  SetNullXSProps(voltTransFilter);

  voltTransFilter.substationRef := ENSubstation150Ref.Create;
  voltTransFilter.substationRef.code := ENSubstation150Obj.code;

  ENSubst150VoltTransList := TempENSubst150VoltTrans.getScrollableFilteredList(voltTransFilter, 0, -1);

  LastCount := High(ENSubst150VoltTransList.list);

  if LastCount > -1 then
     sgENSubst150VoltTrans.RowCount := LastCount + 2
  else
     sgENSubst150VoltTrans.RowCount := 2;

   with sgENSubst150VoltTrans do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if ENSubst150VoltTransList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSubst150VoltTransList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSubst150VoltTransList.list[i].name;
        Cells[2,i+1] := ENSubst150VoltTransList.list[i].factoryNumber;

        Cells[3,i+1] := ENSubst150VoltTransList.list[i].typeRefName;
        Cells[4,i+1] := ENSubst150VoltTransList.list[i].voltageClassRefDescription;

        sgENSubst150VoltTrans.RowCount := i + 2;
      end;

   sgENSubst150VoltTrans.Row := 1;
end;

procedure TfrmENSubstation150Edit.LoadBatteryList;
var
  TempENSubst150Battery: ENSubst150BatteryControllerSoapPort;
  i, LastCount: Integer;
  ENSubst150BatteryList: ENSubst150BatteryShortList;
  batteryFilter: ENSubst150BatteryFilter;
begin
  ClearGrid(sgENSubst150Battery);

  TempENSubst150Battery := HTTPRIOENSubst150Battery as ENSubst150BatteryControllerSoapPort;

  batteryFilter := ENSubst150BatteryFilter.Create;
  SetNullIntProps(batteryFilter);
  SetNullXSProps(batteryFilter);

  batteryFilter.substationRef := ENSubstation150Ref.Create;
  batteryFilter.substationRef.code := ENSubstation150Obj.code;

  ENSubst150BatteryList := TempENSubst150Battery.getScrollableFilteredList(batteryFilter, 0, -1);

  LastCount := High(ENSubst150BatteryList.list);

  if LastCount > -1 then
     sgENSubst150Battery.RowCount := LastCount + 2
  else
     sgENSubst150Battery.RowCount := 2;

   with sgENSubst150Battery do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if ENSubst150BatteryList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSubst150BatteryList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSubst150BatteryList.list[i].name;
        Cells[2,i+1] := ENSubst150BatteryList.list[i].factoryNumber;

        Cells[3,i+1] := ENSubst150BatteryList.list[i].typeRefName;
        Cells[4,i+1] := ENSubst150BatteryList.list[i].chargerTypeRefName;

        if ENSubst150BatteryList.list[i].voltage = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENSubst150BatteryList.list[i].voltage.DecimalString;
        if ENSubst150BatteryList.list[i].capacity = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := ENSubst150BatteryList.list[i].capacity.DecimalString;

        sgENSubst150Battery.RowCount := i + 2;
      end;

   sgENSubst150Battery.Row := 1;
end;

procedure TfrmENSubstation150Edit.LoadDischargerList;
var
  TempENSubst150Discharger: ENSubst150DischargerControllerSoapPort;
  i, LastCount: Integer;
  ENSubst150DischargerList: ENSubst150DischargerShortList;
  dischargerFilter: ENSubst150DischargerFilter;
begin
  ClearGrid(sgENSubst150Discharger);
  
  TempENSubst150Discharger := HTTPRIOENSubst150Discharger as ENSubst150DischargerControllerSoapPort;

  dischargerFilter := ENSubst150DischargerFilter.Create;
  SetNullIntProps(dischargerFilter);
  SetNullXSProps(dischargerFilter);

  dischargerFilter.substationRef := ENSubstation150Ref.Create;
  dischargerFilter.substationRef.code := ENSubstation150Obj.code;
  dischargerFilter.conditionSQL := 'ensubst150discharger.cellrefcode is null';

  ENSubst150DischargerList := TempENSubst150Discharger.getScrollableFilteredList(dischargerFilter, 0, -1);

  LastCount := High(ENSubst150DischargerList.list);

  if LastCount > -1 then
     sgENSubst150Discharger.RowCount := LastCount + 2
  else
     sgENSubst150Discharger.RowCount := 2;

   with sgENSubst150Discharger do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if ENSubst150DischargerList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSubst150DischargerList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSubst150DischargerList.list[i].name;
        Cells[2,i+1] := ENSubst150DischargerList.list[i].factoryNumber;

        Cells[3,i+1] := ENSubst150DischargerList.list[i].typeRefName;
        Cells[4,i+1] := ENSubst150DischargerList.list[i].voltageClassRefDescription;

        sgENSubst150Discharger.RowCount := i + 2;
      end;

   sgENSubst150Discharger.Row := 1;
end;

procedure TfrmENSubstation150Edit.LoadCellList(aVoltageClass: Integer);
var
  TempENSubst150Cell: ENSubst150CellControllerSoapPort;
  i, LastCount: Integer;
  ENSubst150CellList: ENSubst150CellShortList;
  cellFilter: ENSubst150CellFilter;
  sgENSubst150Cell: TAdvStringGrid;
begin
  case aVoltageClass of
    ENVOLTAGECLASS_150:
      sgENSubst150Cell := sgENSubst150Cell150;
    ENVOLTAGECLASS_35:
      sgENSubst150Cell := sgENSubst150Cell35;
    ENVOLTAGECLASS_10:
      sgENSubst150Cell := sgENSubst150Cell10;
    else begin
      Application.MessageBox(PChar('Неизвестный класс напряжения: ' + IntToStr(aVoltageClass)),
                             PChar('Внимание!'), MB_ICONWARNING);
      Exit;
    end;
  end;

  ClearGrid(sgENSubst150Cell);
  
  TempENSubst150Cell := HTTPRIOENSubst150Cell as ENSubst150CellControllerSoapPort;

  cellFilter := ENSubst150CellFilter.Create;
  SetNullIntProps(cellFilter);
  SetNullXSProps(cellFilter);

  cellFilter.substationRef := ENSubstation150Ref.Create;
  cellFilter.substationRef.code := ENSubstation150Obj.code;

  if (aVoltageClass = ENVOLTAGECLASS_10) or (aVoltageClass = ENVOLTAGECLASS_6) then
  begin
    cellFilter.conditionSQL := 'ensubst150cell.voltageclassrefcode in (' +
                               IntToStr(ENVOLTAGECLASS_10) + ', ' + IntToStr(ENVOLTAGECLASS_6) + ')';
  end
  else begin
    cellFilter.voltageClassRef := ENVoltageClassRef.Create;
    cellFilter.voltageClassRef.code := aVoltageClass;
  end;

  ENSubst150CellList := TempENSubst150Cell.getScrollableFilteredList(cellFilter, 0, -1);

  LastCount := High(ENSubst150CellList.list);

  if LastCount > -1 then
     sgENSubst150Cell.RowCount := LastCount + 2
  else
     sgENSubst150Cell.RowCount := 2;

  with sgENSubst150Cell do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if ENSubst150CellList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSubst150CellList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSubst150CellList.list[i].name;
        Cells[2,i+1] := ENSubst150CellList.list[i].factoryNumber;

        Cells[3,i+1] := ENSubst150CellList.list[i].voltageClassRefDescription;

        Cells[4,i+1] := ENSubst150CellList.list[i].commentGen;

        sgENSubst150Cell.RowCount := i + 2;
      end;

   sgENSubst150Cell.Row := 1;
end;

procedure TfrmENSubstation150Edit.LoadCellList(aTabSheet: TTabSheet);
var voltageClass: Integer;
begin
  if aTabSheet = tsCell150 then
    voltageClass := ENVOLTAGECLASS_150

  else if aTabSheet = tsCell35 then
    voltageClass := ENVOLTAGECLASS_35

  else if aTabSheet = tsCell10 then
    voltageClass := ENVOLTAGECLASS_10

  else begin
    Application.MessageBox(PChar('Неизвестный класс напряжения!'),
                           PChar('Внимание!'), MB_ICONWARNING);
    Exit;
  end;

  LoadCellList(voltageClass);
end;

function TfrmENSubstation150Edit.GetCellVoltageClassByTabSheet(
  aTabSheet: TTabSheet): Integer;
begin
  Result := -1;

  if aTabSheet = tsCell150 then
    Result := ENVOLTAGECLASS_150

  else if aTabSheet = tsCell35 then
    Result := ENVOLTAGECLASS_35

  else if aTabSheet = tsCell10 then
    Result := ENVOLTAGECLASS_10

  else
    raise Exception.Create('Неизвестный класс напряжения!');
end;

function TfrmENSubstation150Edit.GetCellGridByTabSheet(
  aTabSheet: TTabSheet): TAdvStringGrid;
begin
  Result := nil;

  if aTabSheet = tsCell150 then
    Result := sgENSubst150Cell150

  else if aTabSheet = tsCell35 then
    Result := sgENSubst150Cell35

  else if aTabSheet = tsCell10 then
    Result := sgENSubst150Cell10

  else
    raise Exception.Create('Неизвестный класс напряжения!');
end;


procedure TfrmENSubstation150Edit.btnGeographClearClick(Sender: TObject);
begin
   ENSubstation150Obj.element.geoDepartmentRef.code := LOW_INT;
   edtGeograph.Text := '';

end;

procedure TfrmENSubstation150Edit.btnGeographClick(Sender: TObject);
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
                 ENSubstation150Obj.element.geoDepartmentRef.code := selected.code;
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

procedure TfrmENSubstation150Edit.btnPricconectionDataClick(Sender: TObject);
begin
  inherited;
  frmENPriconnectionDataEdit := TfrmENPriconnectionDataEdit.Create(Application, dsEdit);
  ENPriconnectionDataObj := nil;
  try
    frmENPriconnectionDataEdit.substationCode := ENSubstation150Obj.code;
    frmENPriconnectionDataEdit.elementCode := ENSubstation150Obj.element.code;
    HideControls([frmENPriconnectionDataEdit.btnSaveCalculate]);
    if frmENPriconnectionDataEdit.ShowModal = mrOk then
      begin
      end;
  except
    on EConvertError do Exit;
  end;
end;


procedure TfrmENSubstation150Edit.LoadGauge;
var
  i : Integer;
  TempENGauge150 : ENGauge150ControllerSoapPort;
  ENGauge150List : ENGauge150ShortList;
  gauge150Filter : ENGauge150Filter;
begin
  ClearGrid(sgENGauge150);

  TempENGauge150 :=  HTTPRIOENGauge150 as ENGauge150ControllerSoapPort;

  gauge150Filter := ENGauge150Filter.Create;
  SetNullIntProps(gauge150Filter);
  SetNullXSProps(gauge150Filter);

  gauge150Filter.substation150Ref := ENSubstation150Ref.Create;
  gauge150Filter.substation150Ref.code := ENSubstation150Obj.code;

  ENGauge150List := TempENGauge150.getScrollableFilteredList(gauge150Filter, 0, -1);

  LastCount := High(ENGauge150List.list);

  if LastCount > -1 then
     sgENGauge150.RowCount:=LastCount+2
  else
     sgENGauge150.RowCount:=2;

  with sgENGauge150 do
  for i:=0 to LastCount do
    begin
      Application.ProcessMessages;

      if ENGauge150List.list[i].code <> Low(Integer) then
      Cells[0,i+1] := IntToStr(ENGauge150List.list[i].code)
      else
      Cells[0,i+1] := '';
      Cells[1,i+1] := ENGauge150List.list[i].name;
      if ENGauge150List.list[i].dateGauge = nil then
        Cells[2,i+1] := ''
      else
        Cells[2,i+1] := XSDateTimeWithDate2String(ENGauge150List.list[i].dateGauge);
      if ENGauge150List.list[i].tension = nil then
        Cells[3,i+1] := ''
      else
        Cells[3,i+1] := ENGauge150List.list[i].tension.DecimalString;
      if ENGauge150List.list[i].current = nil then
        Cells[4,i+1] := ''
      else
        Cells[4,i+1] := ENGauge150List.list[i].current.DecimalString;
      if ENGauge150List.list[i].consOwnTrans = nil then
        Cells[5,i+1] := ''
      else
        Cells[5,i+1] := ENGauge150List.list[i].consOwnTrans.DecimalString;
      LastRow:=i+1;
      sgENGauge150.RowCount:=LastRow+1;
    end;

   sgENGauge150.Row := 1;
end;

procedure TfrmENSubstation150Edit.LoadCCElement();
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

  if (ENSubstation150Obj.element=nil) or (ENSubstation150Obj.element.code=Low(Integer)) then Exit;

  TempCCElementData :=  HTTPRIOCCElementData as CCElementDataControllerSoapPort;

  ccElementFilter := CCElementDataFilter.Create;
  SetNullIntProps(ccElementFilter);
  SetNullXSProps(ccElementFilter);
  ccElementFilter.elementCode:=ENSubstation150Obj.element.code;
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

procedure TfrmENSubstation150Edit.LoadCCDamageLog();
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

  if (ENSubstation150Obj.element=nil) or (ENSubstation150Obj.element.code=Low(Integer)) then Exit;

  TempCCDamageLog :=  HTTPRIOCCDamageLog as CCDamageLogControllerSoapPort;

  damFilter := CCDamageLogFilter.Create;
  SetNullIntProps(damFilter);
  SetNullXSProps(damFilter);
  damFilter.conditionSQL:=
      ' CCDamageLog.statuscode in (0,1,2,3,6,10,11) '+
      ' and CCDamageLog.subtyperefcode=32 '+
      ' and CCDamageLog.departmentrefcode=0 '+
      ' and ('+
      '   CCDamageLog.nodecode in (select n2e.nodecode from ccnode2enelement n2e where n2e.elementcode='+IntToStr(ENSubstation150Obj.element.code)+')'+
      '   or '+
      '   CCDamageLog.nodecode in (select g.code from ccnodegroup g where g.parentnormalcode in '+
      '     (select n2e.nodecode from ccnode2enelement n2e where n2e.elementcode='+IntToStr(ENSubstation150Obj.element.code)+'))'+
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

procedure TfrmENSubstation150Edit.updateVRUZRU;
var
  i, j: Integer;
  TempENSubst150VRUzru: ENSubst150VRUzruControllerSoapPort;
  ENSubst150VRUzruList: ENSubst150VRUzruShortList;
  ENSubst150VRUzruFil : ENSubst150VRUzruFilter;
  sgENSubst150VRUZRU : TadvStringGrid;
  ENSubst150VRUzruTypeCode : Integer;
begin
      if pcVRUZRU.ActivePage = tsVRU150 then
         begin
          sgENSubst150VRUZRU := sgENSubst150VRU150;
          ENSubst150VRUzruTypeCode:= ENSUBST150VRUZRUTYPE_VRU150;
         end;
      if pcVRUZRU.ActivePage = tsVRUZRU35 then
        begin
          sgENSubst150VRUZRU := sgENSubst150VRUZRU35;
          ENSubst150VRUzruTypeCode:= ENSUBST150VRUZRUTYPE_VRUZRU35;
        end;

      if pcVRUZRU.ActivePage = tsVRUZRU610 then
      begin
         sgENSubst150VRUZRU := sgENSubst150VRUZRU6_10;
         ENSubst150VRUzruTypeCode:= ENSUBST150VRUZRUTYPE_VRUZRU6_10;
      end;

 
      ClearGrid(sgENSubst150VRUZRU);

      SetGridHeaders(ENSubst150VRU150Headers, sgENSubst150VRUZRU.ColumnHeaders);
      ColCount:=100;
      TempENSubst150VRUzru :=  HTTPRIOENSubst150VRUzru as ENSubst150VRUzruControllerSoapPort;


      ENSubst150VRUzruFil := ENSubst150VRUzruFilter.Create;
      SetNullIntProps(ENSubst150VRUzruFil);
      SetNullXSProps(ENSubst150VRUzruFil);


      ENSubst150VRUzruFil.substationRef := ENSubstation150Ref.Create;
      ENSubst150VRUzruFil.substationRef.code := ENSubstation150Obj.code;

      ENSubst150VRUzruFil.typeRef := ENSubst150VRUZRUTypeRef.Create;
      ENSubst150VRUzruFil.typeRef.code :=  ENSubst150VRUzruTypeCode;

      ENSubst150VRUzruList := TempENSubst150VRUzru.getScrollableFilteredList(ENSubst150VRUzruFil,0,ColCount);
      LastCount:=High(ENSubst150VRUzruList.list);

      if LastCount > -1 then
         sgENSubst150VRUZRU.RowCount:=LastCount+2
      else
         sgENSubst150VRUZRU.RowCount:=2;

       with sgENSubst150VRUZRU do
        for i:=0 to LastCount do
          begin
            Application.ProcessMessages;
            if ENSubst150VRUzruList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(ENSubst150VRUzruList.list[i].code)
            else
            Cells[0,i+1] := '';
            Cells[1,i+1] := ENSubst150VRUzruList.list[i].nameDisp;
            Objects[0, i+1] := ENSubst150VRUzruList.list[i];
            Cells[2,i+1] := ENSubst150VRUzruList.list[i].name;
            Objects[0, i+1] := ENSubst150VRUzruList.list[i];
            if ENSubst150VRUzruList.list[i].installDate = nil then
              Cells[3,i+1] := ''
            else
              Cells[3,i+1] := XSDate2String(ENSubst150VRUzruList.list[i].installDate);
            Objects[0, i+1] := ENSubst150VRUzruList.list[i];
            Cells[4,i+1] := ENSubst150VRUzruList.list[i].commentGen;
            Objects[0, i+1] := ENSubst150VRUzruList.list[i];
            Cells[5,i+1] := ENSubst150VRUzruList.list[i].userGen;
            Objects[0, i+1] := ENSubst150VRUzruList.list[i];
            LastRow:=i+1;
            sgENSubst150VRUZRU.RowCount:=LastRow+1;
          end;

        ColCount:=ColCount+1;
        sgENSubst150VRUZRU.Row:=1;

        if selectedRow <> 0 then
        begin
        if sgENSubst150VRUZRU.RowCount > selectedRow then
          sgENSubst150VRUZRU.Row := selectedRow
        else
          sgENSubst150VRUZRU.Row := sgENSubst150VRUZRU.RowCount - 1;
        end
        else
          sgENSubst150VRUZRU.Row:=1;





end;

end.
