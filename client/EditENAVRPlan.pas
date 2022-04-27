unit EditENAVRPlan;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWorkController, ExtCtrls
   ,SOAPHTTPTrans, TB2Item, TB2Dock, TB2Toolbar
   ,FINMolDataController, FINMolTypeController, tmsAdvGridExcel, AdvObj
  ;

type
  TfrmENAVRPlanEdit = class(TDialogForm)

  btnOk: TButton;
  btnCancel: TButton;
    pcPlanWork: TPageControl;
    tsPlanWork: TTabSheet;
    tsPlanWorkItems: TTabSheet;
    lblEnElement: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    sgENPlanWorkItem: TAdvStringGrid;
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
    HTTPRIOENPlanWorkItem: THTTPRIO;
    HTTPRIOENElement: THTTPRIO;
    tsEstimateItems: TTabSheet;
    HTTPRIOENEstimateItem: THTTPRIO;
    HTTPRIOENPlanWorkMoveHistory: THTTPRIO;
    HTTPRIOENPlanCorrectHistory: THTTPRIO;
    lblDepartment: TLabel;
    edtDepartment: TEdit;
    spbDepartment: TSpeedButton;
    HTTPRIOENDepartment: THTTPRIO;


    
    lblDateStart: TLabel;
    edtDateStart: TDateTimePicker;
    HTTPRIOENPlanWorkType: THTTPRIO;
    tsHumens: TTabSheet;
    tsTransports: TTabSheet;
    ToolBar3: TToolBar;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    sgENHumenItem: TAdvStringGrid;
    HTTPRIOENHumenItem: THTTPRIO;
    HTTPRIOENTransportItem: THTTPRIO;
    lblENPlanWorkKindKindName: TLabel;
    cbPlanWorkKind: TComboBox;
    actMaterialBinding: TAction;
    N5: TMenuItem;
    N9: TMenuItem;
    edtENActNumber: TEdit;
    spbENAct: TSpeedButton;
    HTTPRIOENAct2ENPlanWork: THTTPRIO;
    lblWorkState: TLabel;
    edtWorkState: TEdit;
    spbENPlanWorkState: TSpeedButton;
    lblENActNumber: TLabel;
    HTTPRIOENPlanWorkState: THTTPRIO;
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIO1: THTTPRIO;
    HTTPRIOFINMaterials: THTTPRIO;
    actMaterialBindingToFIN: TAction;
    N10: TMenuItem;
    gbFINMaterials: TGroupBox;
    sgFINMaterials: TAdvStringGrid;
    Panel1: TPanel;
    ToolBar2: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    sgENEstimateItem: TAdvStringGrid;
    Splitter1: TSplitter;
    lblExecuter: TLabel;
    edtFINExecutorName: TEdit;
    spbFINExecutor: TSpeedButton;
    ToolButton29: TToolButton;
    pnlLegend: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Label1: TLabel;
    Label2: TLabel;
    ColorDialog1: TColorDialog;
    edtInvNumber: TEdit;
    Label3: TLabel;
    HTTPRIOENWorkOrder2ENPlanWork: THTTPRIO;
    HTTPRIOENWorkOrder: THTTPRIO;
    tsWorkOrder: TTabSheet;
    gbWorkOrder: TGroupBox;
    Label4: TLabel;
    edtWorkOrderNumber: TEdit;
    edtDateWorkOrder: TDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    edtWorkOrderCommentGen: TMemo;
    actWorkOrderInsert: TAction;
    actWorkOrderEdit: TAction;
    actWorkOrderDelete: TAction;
    actWorkOrderView: TAction;
    ToolBar5: TToolBar;
    tbWorkOrderInsert: TToolButton;
    tbWorkOrderDelete: TToolButton;
    tbWorkOrderEdit: TToolButton;
    tbWorkOrderUpdate: TToolButton;
    actWorkOrderUpdate: TAction;
    btnWorkOrderSave: TBitBtn;
    btnWorkOrderCancel: TBitBtn;
    lblFinMolCode: TLabel;
    edtFinMolCode: TEdit;
    lblFinMolName: TLabel;
    edtFinMolName: TEdit;
    spbFINMol: TSpeedButton;
    lblFinMechanicCode: TLabel;
    edtFinMechanicCode: TEdit;
    lblFinMechanicName: TLabel;
    edtFinMechanicName: TEdit;
    spbFINMechanic: TSpeedButton;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    tsDismount: TTabSheet;
    sgDismount: TAdvStringGrid;
    ToolBar6: TToolBar;
    ToolButton30: TToolButton;
    ToolButton31: TToolButton;
    ToolButton32: TToolButton;
    ToolButton33: TToolButton;
    ToolButton34: TToolButton;
    ToolButton35: TToolButton;
    ToolButton36: TToolButton;
    tsGSM: TTabSheet;
    pnlGSM: TPanel;
    ToolBar7: TToolBar;
    ToolButton37: TToolButton;
    ToolButton38: TToolButton;
    ToolButton39: TToolButton;
    ToolButton40: TToolButton;
    ToolButton41: TToolButton;
    ToolButton42: TToolButton;
    ToolButton43: TToolButton;
    ToolButton44: TToolButton;
    Panel3: TPanel;
    Shape3: TShape;
    Shape4: TShape;
    Label7: TLabel;
    Label8: TLabel;
    Splitter2: TSplitter;
    gbFINGSM: TGroupBox;
    sgFINGSM: TAdvStringGrid;
    sgGSM: TAdvStringGrid;
    lblPK: TLabel;
    edtCode: TEdit;
    estimateItemPanel: TPanel;
    cbShowAll: TCheckBox;
    Panel2: TPanel;
    cbShowAllGSM: TCheckBox;
    edtWorkOrderCode: TEdit;
    HTTPRIOENMOL2PlanWork: THTTPRIO;
    gbPlanMOL: TGroupBox;
    lblMolName: TLabel;
    edtMolName: TEdit;
    spbPlanMOL: TSpeedButton;
    spbPlanMOLClear: TSpeedButton;
    HTTPRIOENMetrologyCounter: THTTPRIO;
    HTTPRIOENAct: THTTPRIO;
    actAddToRQOrder: TAction;
    HTTPRIORQOrderItem: THTTPRIO;
    actRemoveFromRQOrder: TAction;
    gbMOLData: TGroupBox;
    sgFINMolData: TAdvStringGrid;
    tbActions: TTBToolbar;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem47: TTBItem;
    TBItem7: TTBItem;
    TBItem46: TTBItem;
    actMOLDataInsert: TAction;
    actMOLDataEdit: TAction;
    actMOLDataDelete: TAction;
    actMOLDataView: TAction;
    actMOLDataUpdate: TAction;
    HTTPRIOFINMolData: THTTPRIO;
    HTTPRIOENBindingOver: THTTPRIO;
    ToolButton45: TToolButton;
    actExpToExcel: TAction;
    workExcel: TAdvGridExcelIO;
    ToolButton46: TToolButton;
    actExpToExcel_material: TAction;
    materialExcel: TAdvGridExcelIO;
    actExpToExcelDemontaj: TAction;
    demontajExcel: TAdvGridExcelIO;
    ToolButton47: TToolButton;
    ToolButton48: TToolButton;
    brigadaExcel: TAdvGridExcelIO;
    actExpToExcelHuman: TAction;
    actChangeEstimateItemStatus: TAction;
    actSelectAll: TAction;
    actClearAll: TAction;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    HTTPRIOENPlanWorkForm: THTTPRIO;
    N11: TMenuItem;
    N15: TMenuItem;
    gbMarkers: TGroupBox;
    sgMarkers: TAdvStringGrid;
    Splitter3: TSplitter;
    HTTPRIOMarkEstimate: THTTPRIO;
    actMoveTO: TAction;
    actMoveFrom: TAction;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    HTTPRIOTKTechCardPWI: THTTPRIO;
    rgBudget: TRadioGroup;
    lblMolMech: TLabel;
    edtMolMech: TEdit;
    spbMolMech: TSpeedButton;
    spbClearMolMech: TSpeedButton;
    gbTransport: TGroupBox;
    ToolBar4: TToolBar;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    ToolButton27: TToolButton;
    ToolButton28: TToolButton;
    sgENTransportItem: TAdvStringGrid;
    gbTransportOrder: TGroupBox;
    tlb1: TToolBar;
    btn1: TToolButton;
    pnl1: TPanel;
    chbDetailed: TCheckBox;
    btnSetTime: TButton;
    btnDeleteTime: TButton;
    btnUpdateTime: TButton;
    btnAddToTravelSheet: TButton;
    sgGroupedTransportItem: TAdvStringGrid;
    sgDetailedTransportItem: TAdvStringGrid;
    spl1: TSplitter;
    gbWorkItems: TGroupBox;
    sgWorkItems: TAdvStringGrid;
    btnAddWorkItem: TSpeedButton;
    btnDeleteItem: TSpeedButton;
    rgResponsibility: TRadioGroup;
    edtDateGen: TDateTimePicker;
    HTTPRIOENTransportOrder: THTTPRIO;
    HTTPRIOENTransportOrder2TransportItem: THTTPRIO;
    HTTPRIOENTravelSheet: THTTPRIO;
    btnAddDistanceForTransport: TToolButton;
    btnRemoveDistanceForTranport: TToolButton;
    actFinWorkerAssignToAll: TAction;
    miFinworkerAssignToAll: TMenuItem;
    btnPrintWorkOrder: TButton;
    tsLinkedPlans: TTabSheet;
    sgLinkedPlans: TAdvStringGrid;
    lblCommentGen: TLabel;
    edtCommentGen: TMemo;
    tsFuelHistory: TTabSheet;
    sgENPlanWorkFuelHistory: TAdvStringGrid;
    HTTPRIOENPlanWorkFuelHistory: THTTPRIO;
    tsFuelSheetVolumes: TTabSheet;
    gbFuelSheetVolumes: TGroupBox;
    sgENFuelSheetVolumes: TAdvStringGrid;
    Splitter6: TSplitter;
    gbFuelSheetVolItemData: TGroupBox;
    sgENFuelSheetVolItemData: TAdvStringGrid;
    HTTPRIOENFuelSheetVolumes: THTTPRIO;
    HTTPRIOENFuelSheetVolItemData: THTTPRIO;
    actViewFuelSheetVolumes: TAction;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENElementClick(Sender: TObject);
    procedure pcPlanWorkChange(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);

  procedure UpdateGrid(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure btnPlanReportClick(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure actMaterialBindingExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure spbENPlanWorkStateClick(Sender: TObject);
    procedure spbENActClick(Sender: TObject);
    procedure updateFINMaterialsGrid(estimateItemCode : Integer; stringGrid : TAdvStringGrid);
    procedure sgENEstimateItemClick(Sender: TObject);
    procedure actMaterialBindingToFINExecute(Sender: TObject);
    procedure cbPlanWorkKindChange(Sender: TObject);
    procedure spbFINExecutorClick(Sender: TObject);

    ///
    function checkMaterialsBinding_(estimateItemCode : Integer): Boolean;
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnWorkOrderDetailsClick(Sender: TObject);
    procedure actWorkOrderInsertExecute(Sender: TObject);
    procedure actWorkOrderEditExecute(Sender: TObject);
    ///

    procedure LoadWorkOrder;
    procedure actWorkOrderUpdateExecute(Sender: TObject);
    procedure spbFINMolClick(Sender: TObject);
    procedure btnWorkOrderSaveClick(Sender: TObject);
    procedure btnWorkOrderCancelClick(Sender: TObject);
    procedure spbFINMechanicClick(Sender: TObject);
    procedure pcPlanWorkChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure actWorkOrderDeleteExecute(Sender: TObject);
    procedure cbShowAllClick(Sender: TObject);
    procedure spbPlanMOLClick(Sender: TObject);
    procedure spbPlanMOLClearClick(Sender: TObject);

    procedure LoadMOLData(workOrderCode : Integer);
    procedure actMOLDataInsertExecute(Sender: TObject);
    procedure actMOLDataDeleteExecute(Sender: TObject);
    procedure actMOLDataEditExecute(Sender: TObject);
    procedure actMOLDataViewExecute(Sender: TObject);
    procedure actMOLDataUpdateExecute(Sender: TObject);
    procedure actExpToExcelExecute(Sender: TObject);
    procedure actExpToExcel_materialExecute(Sender: TObject);
    procedure actExpToExcelDemontajExecute(Sender: TObject);
    procedure actExpToExcelHumanExecute(Sender: TObject);
    procedure actChangeEstimateItemStatusExecute(Sender: TObject);
    procedure actSelectAllExecute(Sender: TObject);
    procedure actClearAllExecute(Sender: TObject);
    procedure updateMarksGrid(estimateItemCode : Integer; stringGrid : TAdvStringGrid);
    procedure actMoveTOExecute(Sender: TObject);
    procedure actMoveFromExecute(Sender: TObject);
    procedure rgBudgetClick(Sender: TObject);
    procedure spbMolMechClick(Sender: TObject);
    procedure spbClearMolMechClick(Sender: TObject);
    procedure btnAddWorkItemClick(Sender: TObject);
    procedure sgWorkItemsCellValidate(Sender: TObject; ACol, ARow: Integer;
      var Value: String; var Valid: Boolean);
    procedure btnDeleteItemClick(Sender: TObject);
    procedure chbDetailedClick(Sender: TObject);
    procedure btnSetTimeClick(Sender: TObject);
    procedure btnUpdateTimeClick(Sender: TObject);
    procedure btnDeleteTimeClick(Sender: TObject);
    procedure btnAddToTravelSheetClick(Sender: TObject);
    procedure sgGroupedTransportItemClick(Sender: TObject);
    procedure btnAddDistanceForTransportClick(Sender: TObject);
    procedure btnRemoveDistanceForTranportClick(Sender: TObject);
    procedure actFinWorkerAssignToAllExecute(Sender: TObject);
    procedure btnPrintWorkOrderClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actViewFuelSheetVolumesExecute(Sender: TObject);

  private
    { Private declarations }
    KindCode: Integer;
    WorkOrderEditState: TDialogState;
    MechName, MechCode, MasterName, MasterCode :string;
    arrayOfFINMOLData : array of FINMOLData;

    procedure InitWorkOrderFields;
    procedure ClearWorkOrderFields;

    procedure UpdateFuelHistoryList;
    procedure UpdateFuelSheetVolumes;
    procedure UpdateFuelSheetVolItemData;
  public
    { Public declarations }
      ENPlanWorkObj: ENPlanWork;
      actCode, itemCode : Integer;
      molCode, molName : String;
      addPlanItemsMode: Boolean;
      //procedure ChangeCaptions;
end;

var
  frmENAVRPlanEdit: TfrmENAVRPlanEdit;
  //ENPlanWorkObj: ENPlanWork;

implementation

uses
  ShowENPlanWorkStatus
  ,ENPlanWorkStatusController
, ShowENElement, ENElementController, ENPlanWorkItemController,
  EditENPlanWorkItem, EditENLine04, ENEstimateItemController,
  EditENEstimateItem, ENConsts, DMReportsUnit, ENPlanWorkTypeController,
  ENPlanWorkMoveHistoryController, ENPlanCorrectHistoryController,
  ShowEPDepartment, ENDepartmentController, ShowENDepartment,
  ENDepartmentTypeController
  ,ShowENPlanWorkType,ShowENPlanWorkState, EditENPlanWorkState ,EditENPLanWorkFilter

  , ENHumenItemController, ENTransportItemController,
  ENPlanWorkKindController
  , DateUtils
  , EditMaterialToPlanItemBinding, EditENHumenItem, EditENTransportItem,
  EditENPlanWorkStateFilter, ENPlanWorkStateController
  ,ShowENAct, ENAct2ENPlanWorkController, ENActStatusController,
  ENActController, FINMaterialsController, EditFINMaterialsData,
  FINMaterialsStatusController, FINExecutorController, ShowFINExecutor,
  ShowFINExecutorTree, ENWorkOrder2ENPlanWorkController, EditENWorkOrder,
  ENWorkOrderController, FINMolController, ShowFINMol,
  ENDepartment2EPRenController, ENEstimateItemKindController,
  ENMOL2PlanWorkController, ENMetrologyCounterController,
  EditENMetrologyCounter, RQOrderController, ShowRQOrder,
  RQOrderKindController, RQOrderStatusController, RQOrderItemController,
  EditFINMolData, EditENBindingOver, ENBindingOverController , Globals ,  ShellAPI,
  ShowENPlanWorkForm, ENPlanWorkFormController,
  EditENEstimateItemStatusChange,
  ENMarkEstimateController, EditENEstimateItem2ENEstimateItem,
  TKTechCardController, ShowTKTechCard, ENTransportOrderController,EditSetTimeToTransportItem,
  ShowENTravelSheet, ENTravelSheetController, AddDistance, EditFINWorkerAssignToAll,
  FINWorkerController, FINWorkerKindController, EditENPlanWork,
  ENPlanWorkFuelHistoryController, ENFuelSheetVolumesController,
  ENFuelSheetVolItemDataController, EditENFuelSheetVolumes;

{uses  
    EnergyproController, EnergyproController2, ENPlanWorkController  ;
}
{$R *.dfm}

var
  planItemFilter: ENPlanWorkItemFilter;
  estimateItemFilter: ENEstimateItemFilter;
  moveFilterObject : ENPlanWorkMoveHistoryFilter;
  corrFilterObject : ENPlanCorrectHistoryFilter;

  //ENAct2ENPlanWorkObj : ENAct2ENPlanWork;

  ENPlanWorkItemHeaders: array [1..11] of String =
        ( 'Код'
          ,'Код роботи'
          ,'Робота'
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



  ENDismountItemHeaders: array [1..8] of String =
        ( 'Код'
          ,'Матеріал'
          ,'Кількість'
          ,'Од. виміру'
          ,'Код роботи'
          ,'Робота'
//          ,'Тип строки кошторису'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
        );

  FINMaterialsShortHeaders: array [1..15] of String =
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


  ENPlanWorkMoveHistoryHeaders: array [1..7] of String =
        ( 'Код'
          ,'Дата зміни плану'
          ,'Попередній рік для виконання плану'
          ,'Попередній місяц для виконання плану'
          ,'Причина зміни'
          ,'Користувач що вніс зміни'
          ,'Дата останньої зміни'
        );

  ENPlanCorrectHistoryHeaders: array [1..5] of String =
        ( 'Код'
          ,'Дата коригування плану'
          ,'Причина коригування'
          ,'Користувач що вніс зміни'
          ,'Дата останньої зміни'
        );

  ENHumenItemHeaders: array [1..12] of String =
        ( 'Код'
          ,'Посада нормативна'
          ,'Посада штатна'
          ,'Робітник'
          ,'Норма часу нормативна'
          ,'Норма часу скорегована'
          ,'Код роботи'
          ,'Робота'
          ,'Ціна нормочасу'
          ,'Вартість нормочасу'
          ,'Користувач що вніс зміни'
          ,'Дата останньої зміни'
        );
        
   ENTransportItemHeaders: array [1..12] of String =
        ( 'Код'
          ,'Транспорт нормативний'
          ,'Транспорт штатний'
          ,'Робітник'
          ,'Норма часу нормативна'
          ,'Норма часу скорегована'
          ,'Код роботи'
          ,'Робота'
          //,'Ціна нормочасу'
          //,'Вартість нормочасу'
          ,'Тип транспорту'
          ,'Відстані, км'
          ,'Користувач що вніс зміни'
          ,'Дата останньої зміни'
        );

  FINMolDataHeaders: array [1..4] of String =
        ( 'Код'
          ,'код МОЛа из фин.кол.'
          ,'ФИО МОЛа с фин.кол.'
          ,'Тип МОЛа'
        );

  MarksHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва маркеру'
        );

  WorkItemsHeaders: array [1..4] of String =
        ( 'Код'
          ,'Номер Техкарты'
          ,'Наименование Техкарты'
          ,'Количество работ'
        );

  
    ENGroupedTransportItemHeaders: array [1..11] of String =
        ( 'Код'
          ,'Нормативний транспорт'
          ,'Час роботи з'
          ,'Дата роботи з'
          ,'Час роботи по'
          ,'Дата роботи по'
          ,'Транспорт штатний (найменування)'
          ,'Транспорт штатний (інвентарний номер)'
          ,'Транспорт штатний (гос номер)'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
          //,'Дата останньої зміни'
        );

   ENDetailedTransportItemHeaders: array [1..5] of String =
        ( 'Код'
          ,'Нормативний транспорт'
          ,'Робота (код та найменування)'
          ,'Відстань, км'
          ,'Норма часу'
        );

  ENLinkedPlansHeaders: array [1..10] of String =
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

  ENPlanWorkFuelHistoryHeaders: array [1..7] of String =
        ( 'Код'
          ,'Версія запису'
          ,'Дата плана'
          ,'Тип ПММ'
          ,'Обсяг ПММ, л.'
          ,'Користувач, який створив запис'
          ,'Дата створення'
          //,'Користувач, який вніс зміни'
          //,'Дата зміни'
        );

  ENFuelSheetVolumesHeaders: array [1..9] of String =
        ( 'Код'
          ,'Назва'
          //,'Дата відомості'
          ,'Період'
          ,'Тип ПММ'
          ,'Статус'
          //,'Дата початку'
          //,'Дата закінчення'
          ,'Користувач, який створив запис'
          ,'Дата створення'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );

  ENFuelSheetVolItemDataHeaders: array [1..3] of String =
        ( 'Код'
          ,'Тип ПММ'
          ,'Кількість, л'
        );

  iColCount, iLastCount: Integer;
  iLastRow: Integer = 1;

  eiColCount, eiLastCount: Integer;
  eiLastRow: Integer = 1;
  selectedRow : Integer;


procedure TfrmENAVRPlanEdit.FormShow(Sender: TObject);
var
 eFilter : ENElementFilter;
 eList : ENElementShortList;
 TempENElement: ENElementControllerSoapPort;
 TempENDepartment: ENDepartmentControllerSoapPort;
 typeObj : ENPlanWorkType;
 TempENPlanWorkType : ENPlanWorkTypeControllerSoapPort;
 TempENPlanWorkState : ENPlanWorkStateControllerSoapPort;
 TempENPlanWork: ENPlanWorkControllerSoapPort;
  TempENAct: ENActControllerSoapPort;
  act2planFilter : ENAct2ENPlanWorkFilter;
  TempENAct2ENPlanWork: ENAct2ENPlanWorkControllerSoapPort;
  ENAct2ENPlanWorkList: ENAct2ENPlanWorkShortList;
  stateObj : ENPlanWorkState;
  TempENMOL2PlanWork: ENMOL2PlanWorkControllerSoapPort;
  ENMOL2PlanWorkFilterObj : ENMOL2PlanWorkFilter;
  ENMOL2PlanWorkList: ENMOL2PlanWorkShortList;
  i: Integer;
  planKindName: String;

  TempENPlanWorkFuelHistory: ENPlanWorkFuelHistoryControllerSoapPort;
  fuelHistoryFilter: ENPlanWorkFuelHistoryFilter;
  fuelHistoryArr: ENPlanWorkFuelHistoryController.ArrayOfInteger;

  TempENFuelSheetVolItemData: ENFuelSheetVolItemDataControllerSoapPort;
  fuelSheetVolItemDataFilter: ENFuelSheetVolItemDataFilter;
  fuelSheetVolItemDataArr: ENFuelSheetVolItemDataController.ArrayOfInteger;
begin

  SetGridHeaders(FINMolDataHeaders, sgFINMolData.ColumnHeaders);
  SetGridHeaders(WorkItemsHeaders, sgWorkItems.ColumnHeaders);
  SetGridHeaders(ENPlanWorkFuelHistoryHeaders, sgENPlanWorkFuelHistory.ColumnHeaders);
  SetGridHeaders(ENFuelSheetVolumesHeaders, sgENFuelSheetVolumes.ColumnHeaders);
  SetGridHeaders(ENFuelSheetVolItemDataHeaders, sgENFuelSheetVolItemData.ColumnHeaders);

  actCode := LOW_INT;



  if tsPlanWork.TabVisible then
    pcPlanWork.ActivePage := tsPlanWork;

  DisableControls([ edtENElementName, edtInvNumber
      ,edtDepartment
      ,edtCode
      ,edtENActNumber
      ,edtWorkState
      ,edtFINExecutorName
      ,cbPlanWorkKind
      ,edtWorkOrderCode
  ]);

  HideControls([lblENActNumber, edtENActNumber, spbENAct]); // только ФАКТ !!! ... акт покажем только для НПЗ или ФАКТА ...

  // Кнопки для сохранения наряд-задания (показывать будем только при нажатии на "Редактировать" или "Добавить")
  HideControls([btnWorkOrderSave, btnWorkOrderCancel]);
  DisableControls([spbFINMol, spbFINMechanic]);
  DisableControls([edtMolName, spbPlanMOL, spbPlanMOLClear]);

  tsWorkOrder.TabVisible := false;
  tsFuelHistory.TabVisible := false;
  tsFuelSheetVolumes.TabVisible := false;

  WorkOrderEditState := dsView;


  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtENElementName
      ,edtDepartment
      ,edtDateStart
      ,edtWorkState
      ,edtMolName
     ]);
   end;

  if  (DialogState = dsInsert) then
  begin

    KindCode := cbPlanWorkKind.ItemIndex + 1;
     if ENPlanWorkObj.status = nil then ENPlanWorkObj.status := ENPlanWorkStatus.Create;
     ENPlanWorkObj.status.code := ENPLANWORKSTATUS_GOOD; // черновой план

     if ENPlanWorkObj.typeRef = nil then ENPlanWorkObj.typeRef := ENPlanWorkTypeRef.Create;
     ENPlanWorkObj.typeRef.code := ENPLANWORKTYPE_AVR; // всегда аварийные работы

     if ENPlanWorkObj.stateRef = nil then ENPlanWorkObj.stateRef := ENPlanWorkStateRef.Create;
     ENPlanWorkObj.stateRef.code := ENPLANWORKSTATE_TECHNICALSERVICE; // засетим ТО, т.к. в основном все АВР идут Техобслуживаниями

     if  ENPlanWorkObj.stateRef.code > Low(Integer) then
    begin
         try
             TempENPlanWorkState :=  HTTPRIOENPlanWorkState as ENPlanWorkStateControllerSoapPort;
             stateObj := TempENPlanWorkState.getObject(ENPlanWorkObj.stateRef.code);
             if stateObj <> nil then
             begin
                 edtWorkState.Text := stateObj.name;
             end;
         finally
         end;
    end;

     if ENPlanWorkObj.formRef = nil then ENPlanWorkObj.formRef := ENPlanWorkFormRef.Create;
     ENPlanWorkObj.formRef.code := ENPLANWORKFORM_NOPLANNED; // всегда неплановые работы

     if ENPlanWorkObj.kind = nil then ENPlanWorkObj.kind := ENPlanWorkKind.Create;
     ENPlanWorkObj.kind.code := ENPLANWORKKIND_NPZ;    // всегда наряд-задание,
     KindCode := ENPLANWORKKIND_NPZ;      // в сервере будем автоматом добавлять месячный план или накидывать ссылку на существующий для этого обьекта
     cbPlanWorkKind.ItemIndex := ENPLANWORKKIND_NPZ - 1;
     DisableControls([cbPlanWorkKind]);

     edtDateStart.Checked := True;

     tsPlanWorkItems.TabVisible := false;
     tsEstimateItems.TabVisible := false;
     tsHumens.TabVisible := false;
     tsTransports.TabVisible := false;
     tsWorkOrder.TabVisible := false;
     tsDismount.TabVisible := false;
     tsGSM.TabVisible := false;
     tsLinkedPlans.TabVisible := false;
     gbPlanMOL.Visible := true;

     HideControls([lblENActNumber, edtENActNumber, spbENAct, lblPK, edtCode, edtDateGen]);
     DisableControls([spbPlanMOL, spbPlanMOLClear, spbMolMech, spbClearMolMech], false);

  end;


  if (DialogState = dsEdit) then
  begin
    /// 05.03.14 Не даем при редактировании изменять Бюджетодержателя и ЦО на плане
    DisableControls([rgBudget, rgResponsibility]);
    ///

    if ENPlanWorkObj.kind.code = ENPLANWORKKIND_FACT then
    begin

      DisableControls(tsPlanWork);
      DisableControls([edtDateStart, spbENAct, spbFINExecutor, spbDepartment], false);
      DenyBlankValues([edtDepartment]);
      tsWorkOrder.TabVisible := true;

    end;

    if ENPlanWorkObj.kind.code =  ENPLANWORKKIND_CURRENT then
    begin
        gbPlanMOL.Visible := true;
        DisableControls([spbPlanMOL, spbPlanMOLClear], false);
    end;

  end;


  if  (DialogState = dsView) then
  begin
    DisableControls([ spbDepartment,spbENAct,spbENPlanWorkState, spbFINExecutor,
                    btnSetTime, btnUpdateTime, btnDeleteTime, btnAddDistanceForTransport,
                    btnAddToTravelSheet, btnRemoveDistanceForTranport,
                    rgBudget, rgResponsibility]);

    DisableActions([actInsert, actEdit, actDelete, actMaterialBinding,
                    actWorkOrderInsert, actWorkOrderEdit, actWorkOrderDelete,
                    actFinWorkerAssignToAll]);

    HideControls([btnWorkOrderSave, btnWorkOrderCancel]);
    DisableControls([cbShowAll, cbShowAllGSM], false);

    if ENPlanWorkObj.kind.code =  ENPLANWORKKIND_CURRENT then
    begin
        gbPlanMOL.Visible := true;
        DisableControls([edtMolName, spbPlanMOL, spbPlanMOLClear]);
    end;
  end;


  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    // отключим и спрячем МОЛа-механика на главной вкладке плана при редактировании или просмотре
    DisableControls([spbMolMech, spbClearMolMech]);
    HideControls([lblMolMech, edtMolMech, spbMolMech, spbClearMolMech]);
    gbPlanMOL.Height := 37;
    // уберем грид с работами, который виден только при добавлении
    HideControls([gbWorkItems]);
    DisableControls([btnAddWorkItem, btnDeleteItem]);
    //    отключим заявки на транспорт на месячных планах
     if (ENPlanWorkObj.kind.code in [ENPLANWORKKIND_NPZ, ENPLANWORKKIND_FACT]) then
    HideControls([gbTransportOrder], false)
    else HideControls([gbTransportOrder]);
    //

    ///// 28.02.2014
    MakeMultiline(edtCommentGen.Lines, ENPlanWorkObj.commentGen);

    HideControls([edtDateGen]);

    edtCode.Text := IntToStr(ENPlanWorkObj.code);
    KindCode := ENPlanWorkObj.kind.code;

    if (ENPlanWorkObj.kind.code in [ENPLANWORKKIND_NPZ, ENPLANWORKKIND_FACT]) then
      //HideControls([gbWorkOrder], false);
      tsWorkOrder.TabVisible := true;
    ///

    if ENPlanWorkObj.kind.code in [ENPLANWORKKIND_NPZ, ENPLANWORKKIND_FACT] then
    begin
      DisableControls([spbENElement,  spbENPlanWorkState ,
                       cbPlanWorkKind
                       ]);

      if ENPlanWorkObj.kind.code = ENPLANWORKKIND_FACT then
      begin

       HideControls([lblENActNumber, edtENActNumber, spbENAct], false);

      // подтянем акт ...

      act2planFilter := ENAct2ENPlanWorkFilter.Create;
      SetNullIntProps(act2planFilter);
      SetNullXSProps(act2planFilter);

      act2planFilter.plan := ENPlanWork.Create;
      act2planFilter.plan.code := ENPlanWorkObj.code;
      TempENAct2ENPlanWork :=  HTTPRIOENAct2ENPlanWork as ENAct2ENPlanWorkControllerSoapPort;
      ENAct2ENPlanWorkList := TempENAct2ENPlanWork.getScrollableFilteredList(act2planFilter, 0,-1);
      if  ENAct2ENPlanWorkList.totalCount > 0 then
      begin
         actCode := ENAct2ENPlanWorkList.list[0].actRefCode ;//ENAct2ENPlanWorkList.list[0].code;
         edtENActNumber.Text := ENAct2ENPlanWorkList.list[0].actRefNumberGen + ' ' + ENAct2ENPlanWorkList.list[0].actRefFinMolName;
      end
      else
      begin
         actCode := LOW_INT;
         edtENActNumber.Text := 'НЕ ВЫБРАНО !!!';
      end;
     end; // if FACT


      //if ENPlanWorkObj.status.code = ENPLANWORKSTATUS_LOCKED then
      if ENPlanWorkObj.status.code in [ENPLANWORKSTATUS_LOCKED, ENPLANWORKSTATUS_CORRECTED] then
      begin
          DisableControls([spbENAct]);
      end;
     
  end;

// --------------------------------------------------------------
    if ENPlanWorkObj.kind.code <> ENPLANWORKKIND_YEAR then
    begin

               gbPlanMOL.Visible := true;
                
               TempENMOL2PlanWork :=  HTTPRIOENMOL2PlanWork as ENMOL2PlanWorkControllerSoapPort;
               ENMOL2PlanWorkFilterObj := ENMOL2PlanWorkFilter.Create;
               SetNullXSProps(ENMOL2PlanWorkFilterObj);
               SetNullIntProps(ENMOL2PlanWorkFilterObj);

               ENMOL2PlanWorkFilterObj.planRef := ENPlanWorkRef.Create;
               ENMOL2PlanWorkFilterObj.planRef.code := ENPlanWorkObj.code;
               ENMOL2PlanWorkList := TempENMOL2PlanWork.getScrollableFilteredList(ENMOL2PlanWorkFilterObj, 0, -1);
               if ENMOL2PlanWorkList.totalCount > 0 then
                  //ENMOL2PlanWorkObj := TempENMOL2PlanWork.getObject(ENMOL2PlanWorkList.list[0].code)
                  //edtMolName.Text :=  ENMOL2PlanWorkList.list[0].molName
                  edtMolName.Text := ENMOL2PlanWorkList.list[0].molCode + ' ' + ENMOL2PlanWorkList.list[0].molName
               else
                  edtMolName.Text := '';
    end;
// --------------------------------------------------------------

    ////////////////////////////////////////////////////////////////////////////
    // 02.03.15 NET-4440 История изменения объемов ГСМ
    TempENPlanWorkFuelHistory := HTTPRIOENPlanWorkFuelHistory as ENPlanWorkFuelHistoryControllerSoapPort;

    fuelHistoryFilter := ENPlanWorkFuelHistoryFilter.Create;
    SetNullIntProps(fuelHistoryFilter);
    SetNullXSProps(fuelHistoryFilter);

    fuelHistoryFilter.planRef := ENPlanWorkRef.Create;
    fuelHistoryFilter.planRef.code := ENPlanWorkObj.code;

    //fuelHistoryFilter.orderBySQL := 'ENPLANWORKFUELHISTORY.VERSION, ENPLANWORKFUELHISTORY.DATEGEN, ENPLANWORKFUELHISTORY.CODE';

    fuelHistoryArr := TempENPlanWorkFuelHistory.getScrollableFilteredCodeArray(fuelHistoryFilter, 0, -1);

    tsFuelHistory.TabVisible := High(fuelHistoryArr) >= 0;
    ////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////
    // 16.03.15 NET-4440 Плановые ведомости выдачи ГСМ
    TempENFuelSheetVolItemData := HTTPRIOENFuelSheetVolItemData as ENFuelSheetVolItemDataControllerSoapPort;

    fuelSheetVolItemDataFilter := ENFuelSheetVolItemDataFilter.Create;
    SetNullIntProps(fuelSheetVolItemDataFilter);
    SetNullXSProps(fuelSheetVolItemDataFilter);

    fuelSheetVolItemDataFilter.plan_code := ENPlanWorkObj.code;

    fuelSheetVolItemDataArr := TempENFuelSheetVolItemData.getScrollableFilteredCodeArray(fuelSheetVolItemDataFilter, 0, -1);

    tsFuelSheetVolumes.TabVisible := High(fuelSheetVolItemDataArr) >= 0;
    ////////////////////////////////////////////////////////////////////////////

      if ENPlanWorkObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENPlanWorkObj.dateGen.Year,ENPlanWorkObj.dateGen.Month,ENPlanWorkObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;

    if  ENPlanWorkObj.stateRef = nil then
       ENPlanWorkObj.stateRef := ENPlanWorkStateRef.Create
    else
    if  ENPlanWorkObj.stateRef.code > Low(Integer) then
    begin
         try
             TempENPlanWorkState :=  HTTPRIOENPlanWorkState as ENPlanWorkStateControllerSoapPort;
             stateObj := TempENPlanWorkState.getObject(ENPlanWorkObj.stateRef.code);
             if stateObj <> nil then
             begin
                 edtWorkState.Text := stateObj.name;
             end;
         finally
         end;
    end;
    
      if ENPlanWorkObj.dateStart <> nil then
      begin
        edtDateStart.DateTime:=EncodeDate(ENPlanWorkObj.dateStart.Year,ENPlanWorkObj.dateStart.Month,ENPlanWorkObj.dateStart.Day);
        edtDateStart.checked := true;
      end
      else
      begin
        edtDateStart.DateTime:=SysUtils.Date;
        edtDateStart.checked := false;
      end;

    cbPlanWorkKind.ItemIndex := ENPlanWorkObj.kind.code - 1;

    if ENPlanWorkObj.elementRef.code > Low(Integer) then
    begin
       eFilter := ENElementFilter.Create;
       try
         SetNullIntProps(eFilter);
         SetNullXSProps(eFilter);
         eFilter.code := ENPlanWorkObj.elementRef.code;
         TempENElement :=  HTTPRIOENElement as ENElementControllerSoapPort;
         eList := TempENElement.getScrollableFilteredList(eFilter,0,-1);
         if eList.totalCount > 0 then
         begin
             edtENElementName.Text := eList.list[0].objectName;
             edtInvNumber.Text := eList.list[0].objectInvNumber;

             case ENPlanWorkObj.kind.code of
               ENPLANWORKKIND_YEAR:    planKindName := 'Річний план для ';
               ENPLANWORKKIND_CURRENT: planKindName := 'Місячний план для ';
               ENPLANWORKKIND_NPZ:     planKindName := 'Завдання-План для ';
               ENPLANWORKKIND_FACT:    planKindName := 'Завдання-Факт для ';
             end;

             //frmENPlanWorkEdit.
             Caption := planKindName + eList.list[0].objectName;
             /////
             DisableControls([edtENElementName, edtInvNumber, spbENElement]);
         end;
       finally
         eFilter.Free;
       end;
    end
    else
    begin
       edtENElementName.Text := '';
       edtInvNumber.Text := '';
    end;

      if ENPlanWorkObj.budgetRef <> nil then
        if ENPlanWorkObj.budgetRef.code <> low(Integer) then
        begin
         case ENPlanWorkObj.budgetRef.code  of
              ENBUDGET_ODG:   rgBudget.ItemIndex := 0;
              ENBUDGET_SRM:   rgBudget.ItemIndex := 1;
              ENBUDGET_SPS:   rgBudget.ItemIndex := 2;
              ENBUDGET_SKEM:  rgBudget.ItemIndex := 3;
              ENBUDGET_SIZPI: rgBudget.ItemIndex := 4;
              ENBUDGET_SVEM:  rgBudget.ItemIndex := 5;
              ENBUDGET_RZA:   rgBudget.ItemIndex := 6;
         end;
        end;

      if ENPlanWorkObj.responsibilityRef <> nil then
        if ENPlanWorkObj.responsibilityRef.code <> low(Integer) then
        begin
         case ENPlanWorkObj.budgetRef.code  of
              ENRESPONSIBILITY_ODG:   rgResponsibility.ItemIndex := 0;
              ENRESPONSIBILITY_SRM:   rgResponsibility.ItemIndex := 1;
              ENRESPONSIBILITY_SPS:   rgResponsibility.ItemIndex := 2;
              ENRESPONSIBILITY_SKEM:  rgResponsibility.ItemIndex := 3;
              ENRESPONSIBILITY_SIZPI: rgResponsibility.ItemIndex := 4;
              ENRESPONSIBILITY_SVEM:  rgResponsibility.ItemIndex := 5;
              ENRESPONSIBILITY_RZA:   rgResponsibility.ItemIndex := 6;
         end;
        end;

      if ENPlanWorkObj.departmentRef <> nil then
        if ENPlanWorkObj.departmentRef.code <> low(Integer) then
        begin
          TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;

          edtDepartment.Text := TempENDepartment.getObject(ENPlanWorkObj.departmentRef.code).shortName;
        end;


        if ENPlanWorkObj.stateRef <> nil then
        if ENPlanWorkObj.stateRef.code <> low(Integer) then
        begin
          TempENPlanWorkState := HTTPRIOENPlanWorkState as ENPlanWorkStateControllerSoapPort;

          edtWorkState.Text := TempENPlanWorkState.getObject(ENPlanWorkObj.stateRef.code).name;
        end;

        if ENPlanWorkObj.finExecutor <> nil then
          if ENPlanWorkObj.finExecutor.code > LOW_INT then
          begin
             edtFINExecutorName.Text := ENPlanWorkObj.finExecutor.name;
          end;

  end;
  
  if addPlanItemsMode then
    for i := 0 to pcPlanWork.PageCount - 1 do
      if pcPlanWork.Pages[i] <> tsPlanWorkItems then
        pcPlanWork.Pages[i].TabVisible := false;

end;



procedure TfrmENAVRPlanEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWork: ENPlanWorkControllerSoapPort;
    TempENElement: ENElementControllerSoapPort;
    element : ENElement;
    AllowClose: Boolean;
    TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    plan : ENPlanWork;
    pwiArr : ArrayOfENPlanWorkItem;
    count, i: Integer;
begin
  // Проверяем, а не находится ли наряд-задание в состоянии редактирования
  pcPlanWorkChanging(Sender, AllowClose);

  if not AllowClose then
  begin
    Action := caNone;
    Exit;
  end;

  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtENElementName
      ,edtDepartment
      ,edtDateStart
      ,edtWorkState
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin

    if (DialogState = dsInsert) and (cbPlanWorkKind.ItemIndex + 1 = ENPLANWORKKIND_FACT) then
    begin
      Application.MessageBox(PChar('Завдання-Факт можливо сформувати тільки з Завдання-Плану !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      Action := caNone;
      cbPlanWorkKind.ItemIndex := ENPLANWORKKIND_NPZ - 1;
      Exit;
    end;

    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

     if edtdateStart.checked then
     begin
       if ENPlanWorkObj.dateStart = nil then ENPlanWorkObj.dateStart := TXSDate.Create;
       ENPlanWorkObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));
       if ENPlanWorkObj.dateFinal = nil then ENPlanWorkObj.dateFinal := TXSDate.Create;
       ENPlanWorkObj.dateFinal.XSToNative(GetXSDate(edtDateStart.DateTime));
       ENPlanWorkObj.monthGen := MonthOf(edtDateStart.Date);
       ENPlanWorkObj.yearGen := YearOf(edtDateStart.Date);
     end
     else
       begin
       ENPlanWorkObj.dateStart := nil;
       ENPlanWorkObj.dateFinal := nil;
       ENPlanWorkObj.yearGen := Low(Integer);
       ENPlanWorkObj.monthGen := Low(Integer);
       end;

     if ENPlanWorkObj.kind = nil then ENPlanWorkObj.kind := ENPlanWorkKind.Create;
     ENPlanWorkObj.kind.code := cbPlanWorkKind.ItemIndex + 1;

     ///// 28.02.2014
     ENPlanWorkObj.commentGen := edtCommentGen.Text;

    TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;
    element := TempENElement.getObject(ENPlanWorkObj.elementRef.code);

    if ENPlanWorkObj.budgetRef = nil then ENPlanWorkObj.budgetRef := ENDepartmentRef.Create;
    case rgBudget.ItemIndex of
    0: ENPlanWorkObj.budgetRef.code := ENBUDGET_ODG;
    1: ENPlanWorkObj.budgetRef.code := ENBUDGET_SRM;
    2: ENPlanWorkObj.budgetRef.code := ENBUDGET_SPS;
    3: ENPlanWorkObj.budgetRef.code := ENBUDGET_SKEM;
    4: ENPlanWorkObj.budgetRef.code := ENBUDGET_SIZPI;
    5: ENPlanWorkObj.budgetRef.code := ENBUDGET_SVEM;
    6: ENPlanWorkObj.budgetRef.code := ENBUDGET_RZA;
    end;

    if ENPlanWorkObj.responsibilityRef = nil then ENPlanWorkObj.responsibilityRef := ENDepartmentRef.Create;
    case rgResponsibility.ItemIndex of
    0: ENPlanWorkObj.responsibilityRef.code := ENRESPONSIBILITY_ODG;
    1: ENPlanWorkObj.responsibilityRef.code := ENRESPONSIBILITY_SRM;
    2: ENPlanWorkObj.responsibilityRef.code := ENRESPONSIBILITY_SPS;
    3: ENPlanWorkObj.responsibilityRef.code := ENRESPONSIBILITY_SKEM;
    4: ENPlanWorkObj.responsibilityRef.code := ENRESPONSIBILITY_SIZPI;
    5: ENPlanWorkObj.responsibilityRef.code := ENRESPONSIBILITY_SVEM;
    6: ENPlanWorkObj.responsibilityRef.code := ENRESPONSIBILITY_RZA;
    end;


    if DialogState = dsInsert then
    begin
      ENPlanWorkObj.code:=low(Integer);
         setLength(pwiArr,0);

         /// соберем в стринг все коды работ
         for i:= 1 to sgWorkItems.RowCount-1 do
           begin
             if sgWorkItems.Cells[0, i] = '' then
             begin
               Application.MessageBox(PChar('Додайте хоча б одну роботу!'), PChar('Увага !'), MB_ICONWARNING + MB_OK);
               Action := caNone;
               Exit;
             end;

             count := High(pwiArr)+1;
             setLength(pwiArr,count+1);
             pwiArr[count] := ENPlanWorkItem.Create;
             pwiArr[count].kartaRef := TKTechCardRef.Create;
             pwiArr[count].kartaRef.code := StrToInt(sgWorkItems.Cells[0,i]);
             pwiArr[count].countGen := TXSDecimal.Create;
             pwiArr[count].countGen.DecimalString := sgWorkItems.Cells[3,i];
           end;
         ///

        // 09.09.2014 NET-4396
       // запретим создавать планы АВР для ОДГ из НЕТа.
       // Теперь планирование таких планов только из CallCenter.

      if ((ENPlanWorkObj.responsibilityRef.code = ENRESPONSIBILITY_ODG) or
         (ENPlanWorkObj.budgetRef.code = ENBUDGET_ODG))
      then begin
          Application.MessageBox(PChar('Використовуте CallCenter для складання таких планів!'), PChar('Увага !'), MB_ICONERROR + MB_OK);
          Action := caNone;
          Exit;
      end;

       TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
       ENPlanWorkObj.code := TempENPlanWorkItem.addForAVR(ENPlanWorkObj, pwiArr, MasterCode, MasterName, MechCode, MechName);

      end;

    if DialogState = dsEdit then
        begin
          TempENPlanWork.save(ENPlanWorkObj);
         end;

    end;


end;

procedure TfrmENAVRPlanEdit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if DialogState = dsInsert then
    if Key = VK_ESCAPE then Exit;
end;

procedure TfrmENAVRPlanEdit.spbENElementClick(Sender: TObject);
var
   frmENElementShow: TfrmENElementShow;
   f, tmpF : ENElementFilter;
   invNum , depName: String;
   depCode, elCode : Integer;
   depShort : ENDepartmentShort;
   elList: ENElementShortList;
   elObj: ENElementShort;
   isMetrologyObject: Boolean;
begin
   f := ENElementFilter.Create;
     SetNullIntProps(f);
     SetNullXSProps(f);
     f.orderBySQL := 'typerefcode';

   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal, f);

   try
      DisableActions([frmENElementShow.actInsert, frmENElementShow.actEdit , frmENElementShow.actDelete]);

      with frmENElementShow do
        if ShowModal = mrOk then
        begin

            try
               isMetrologyObject := false;

               try
                 tmpF := ENElementFilter.Create;
                 SetNullIntProps(tmpF);
                 SetNullXSProps(tmpF);

                 tmpF.code := StrToInt(GetReturnValue(sgENElement,0));
                 elList := DMReports.searchElements(tmpF, 0, -1, '', '');

                 if elList <> nil then
                   if elList.list <> nil then
                     if elList.list[0] <> nil then
                       if elList.list[0].typeRefCode = EN_METROLOGY_OBJECT then
                         isMetrologyObject := true;
               except
               end;

               // инвентарные для Центра ответсвенности

               invNum := GetReturnValue(sgENElement,3) ; //DMReports.getInvNumByElement(StrToInt(GetReturnValue(sgENElement,0)));

               if (length(invNum) < 5) and (not isMetrologyObject) then
               begin
                   if ENPlanWorkObj.typeRef <> nil then
                   begin
                     if not (ENPlanWorkObj.typeRef.code in [5,7]) then // Приєднання, Виконання інвестиційної програми (капітальне будівництво)
                     begin
                       Application.MessageBox(PChar('Плани можливо заносити тільки для об"єктів з інвентарним номером !!!' + ' "' + invNum +'" < 5 символов'), PChar('Ошибка'), MB_ICONERROR);
                       exit;
                     end;
                   end
                   else
                   begin
                       Application.MessageBox(PChar('Плани можливо заносити тільки для об"єктів з інвентарним номером !!!' + ' "' + invNum +'" < 5 символов'), PChar('Ошибка'), MB_ICONERROR);
                       exit;
                   end;
               end;

               if ENPlanWorkObj.elementRef = nil then ENPlanWorkObj.elementRef := ENElementRef.Create();
              // ENPlanWorkObj.status.code := StrToInt(GetReturnValue(sgENPlanWorkStatus,0));
               ENPlanWorkObj.elementRef.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementName.Text := GetReturnValue(sgENElement,1);
               edtInvNumber.Text := GetReturnValue(sgENElement,3);

               if  ENPlanWorkObj.renRef = nil then ENPlanWorkObj.renRef := EPRenRef.Create;
               ENPlanWorkObj.renRef.code := ENElementShort(sgENElement.Objects[0,sgENElement.Row]).renRefCode;

               // подкинуть депртамент ...
              depShort := DMReports.getDepartmentByRenCode(ENPlanWorkObj.renRef.code, ENMANAGEMENT_TYPE_TECHNICAL);
              if depShort <> nil then
              begin
                  if ENPlanWorkObj.departmentRef = nil then  ENPlanWorkObj.departmentRef := ENDepartmentRef.Create;
                  ENPlanWorkObj.departmentRef.code := depShort.code;
                  edtDepartment.Text:= depShort.shortName;
              end;

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;

procedure TfrmENAVRPlanEdit.updateFINMaterialsGrid(estimateItemCode : Integer; stringGrid : TAdvStringGrid );
var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  j,i: Integer;
  finList: FINMaterialsShortList; //List_;
  finFilter : FINMaterialsFilter;
begin
   for i:=1 to stringGrid.RowCount-1 do
     for j:=0 to stringGrid.ColCount-1 do
       stringGrid.Cells[j,i]:='';

  SetGridHeaders(FINMaterialsShortHeaders, stringGrid.ColumnHeaders);

  finFilter := FINMaterialsFilter.Create;
  SetNullIntProps(finFilter);
  SetNullXSProps(finFilter);
  finFilter.estimateItemRef := ENEstimateItemRef.Create;
  finFilter.estimateItemRef.code := estimateItemCode;

  finFilter.statusRef := FINMaterialsStatusRef.Create;
  finFilter.statusRef.code := FINMATERIALSSTATUS_GOOD;

  TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

  finList := TempFINMaterials.getScrollableFilteredList(finFilter,0,-1);

  if High(finList.list) > -1 then
     stringGrid.RowCount:=High(finList.list)+2
  else
     stringGrid.RowCount:=2;

   with stringGrid do
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

        Cells[13, i+1] := finList.list[i].userGen ;

        if finList.list[i].dateEdit <> nil then
          Cells[14, i+1] := XSDateTimeWithDate2String(finList.list[i].dateEdit)
        else
          Cells[14, i+1] := '';

        stringGrid.RowCount:= i + 2;
      end;
   stringGrid.Row:=1;



end;



procedure TfrmENAVRPlanEdit.pcPlanWorkChange(Sender: TObject);
var
  TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
  i,LastCountM: Integer;
  ENPlanWorkItemList: ENPlanWorkItemShortList;

  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  ENEstimateItemList: ENEstimateItemShortList;

  TempENPlanWorkMoveHistory: ENPlanWorkMoveHistoryControllerSoapPort;
  ENPlanWorkMoveHistoryList: ENPlanWorkMoveHistoryShortList;

  TempENPlanCorrectHistory : ENPlanCorrectHistoryControllerSoapPort;
  ENPlanCorrectHistoryList : ENPlanCorrectHistoryShortList;

    TempENHumenItem: ENHumenItemControllerSoapPort;
    ENHumenItemList: ENHumenItemShortList;
    TempENTransportItem: ENTransportItemControllerSoapPort;
    ENTransportItemList: ENTransportItemShortList;

  humenItemFilter : ENHumenItemFilter;
  transportItemFilter : ENTransportItemFilter;

    TempENTransportOrder : ENTransportOrderControllerSoapPort;
  ENTransportOrderList : ENTransportOrderShortList;

  TempENPlanWork: ENPlanWorkControllerSoapPort;
  linkedPlansList: ENPlanWorkShortList;
  linkedPlansFilterObj : ENPlanWorkFilter;
  intCodesList: ENPlanWorkController.ArrayOfInteger;
  strCodesList: String;

  j : Integer;
  toCount, toLastRow : Integer;
  toColCount : Integer;
  vNormOfTime, vCountGen: Double;

begin

  if pcPlanWork.ActivePage = tsDismount then
  begin
    DisableActions([actInsert,  actEdit, actDelete, actFilter, actNoFilter], not (DialogState in [dsEdit, dsInsert]) );


    SetGridHeaders(ENDismountItemHeaders, sgDismount.ColumnHeaders);

    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

    //if estimateItemFilter = nil then
    begin
       estimateItemFilter := ENEstimateItemFilter.Create;
       SetNullIntProps(estimateItemFilter);
       SetNullXSProps(estimateItemFilter);
    end;

    if estimateItemFilter.planRef = nil then estimateItemFilter.planRef := ENPlanWorkRef.Create;
    estimateItemFilter.planRef.code := ENPlanWorkObj.code;

    estimateItemFilter.kindRef := ENEstimateItemKindRef.Create;
    estimateItemFilter.kindRef.code := ENESTIMATEITEMKIND_DISMOUNT;
    estimateItemFilter.orderBySQL := 'KR.TECHKARTNUMBER, SM.NAME, ENESTIMATEITEMTYPE.CODE';

    ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(estimateItemFilter, 0, -1);

    eiLastCount := High(ENEstimateItemList.list);

    if eiLastCount > -1 then
      sgDismount.RowCount := eiLastCount + 2
    else
      sgDismount.RowCount := 2;

     with sgDismount do
       for i := 0 to eiLastCount do
       begin
         Application.ProcessMessages;

         if ENEstimateItemList.list[i].code <> Low(Integer) then
           Cells[0,i+1] := IntToStr(ENEstimateItemList.list[i].code)
         else
           Cells[0,i+1] := '';

         Cells[1,i+1] := ENEstimateItemList.list[i].materialRefName;

         if ENEstimateItemList.list[i].countFact = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := ENEstimateItemList.list[i].countFact.DecimalString;

         Cells[3,i+1] := ENEstimateItemList.list[i].measureType;

         Cells[4,i+1] := ENEstimateItemList.list[i].kartaNum;
         Cells[5,i+1] := ENEstimateItemList.list[i].kartaRefName;

         Cells[6,i+1] := ENEstimateItemList.list[i].userGen;

         if ENEstimateItemList.list[i].dateEdit = nil then
           Cells[7,i+1] := ''
         else
           Cells[7,i+1] := XSDate2String(ENEstimateItemList.list[i].dateEdit);



         Objects[0,i+1] := TObject(ENEstimateItemList.list[i].typeRefCode);

         eiLastRow := i + 1;
         sgDismount.RowCount := eiLastRow + 1;
       end;

     eiColCount := eiColCount + 1;
     sgDismount.Row := 1;



  end; // selected tsDismountItems


  if pcPlanWork.ActivePage = tsWorkOrder then
  begin
    DisableControls([edtWorkOrderNumber, edtDateWorkOrder, edtWorkOrderCommentGen,
                     edtFinMolCode, edtFinMolName, edtFinMechanicCode, edtFinMechanicName]);
    DisableActions([actMOLDataInsert, actMOLDataEdit, actMOLDataDelete]);
    LoadWorkOrder;
  end
  else
  if pcPlanWork.ActivePage = tsPlanWorkItems then
  begin
    DisableActions([actInsert,  actEdit, actDelete, actFilter, actNoFilter], not (DialogState in [dsEdit, dsInsert]) );

    SetGridHeaders(ENPlanWorkItemHeaders, sgENPlanWorkItem.ColumnHeaders);
    iColCount:=-1;
    TempENPlanWorkItem :=  HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;

    if planItemFilter = nil then
    begin
       planItemFilter := ENPlanWorkItemFilter.Create;
       SetNullIntProps(planItemFilter);
       SetNullXSProps(planItemFilter);
    end;

    if planItemFilter.planRef = nil then planItemFilter.planRef := ENPlanWorkRef.Create;
    planItemFilter.planRef.code := ENPlanWorkObj.code;

    planItemFilter.orderBySQL := ' enplanworkitem.kartarefcode';

    ENPlanWorkItemList := TempENPlanWorkItem.getScrollableFilteredList(planItemFilter,0,-1);

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

          try
            RowColor[i+1] := clWindow;
            
            // Если работа с нулевым кол-вом, выделяем строку красным цветом
            if ENPlanWorkItemList.list[i].countGen <> nil then
              if StrToFloat(ENPlanWorkItemList.list[i].countGen.DecimalString) = 0 then
                RowColor[i+1] := clTeal; //clRed;
          except
          end;
          /////

          iLastRow:=i+1;
          sgENPlanWorkItem.RowCount:=iLastRow+1;
        end;
     iColCount:=iColCount+1;
     sgENPlanWorkItem.Row:=1;
  end; // selected tsPlanWorkItems

  //--------------------------------------------------------------------------------
  if pcPlanWork.ActivePage = tsEstimateItems then
  begin

    DisableActions([actInsert,  actEdit, actDelete, actFilter, actNoFilter], not (DialogState in [dsEdit, dsInsert]) );

    try
      actMaterialBindingToFIN.Enabled := (DialogState = dsEdit) and
                                         ((ENPlanWorkObj.kind.code = ENPLANWORKKIND_NPZ) or  (ENPlanWorkObj.kind.code = ENPLANWORKKIND_FACT))
                                         // and статус бы еще пробить ....
                                         ;

      actMaterialBindingToFIN.Visible := actMaterialBindingToFIN.Enabled;
    except
      actMaterialBindingToFIN.Enabled := false;
      actMaterialBindingToFIN.Visible := false;
    end;

    SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);
    eiColCount := -1;
    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

    //if estimateItemFilter = nil then
    //begin
       estimateItemFilter := ENEstimateItemFilter.Create;
       SetNullIntProps(estimateItemFilter);
       SetNullXSProps(estimateItemFilter);
    //end;

    if estimateItemFilter.planRef = nil then estimateItemFilter.planRef := ENPlanWorkRef.Create;
    estimateItemFilter.planRef.code := ENPlanWorkObj.code;

    //estimateItemFilter.conditionSQL := 'enestimateitem.kindrefcode in (1,2)';
    if estimateItemFilter.kindRef = nil then estimateItemFilter.kindRef := ENEstimateItemKindRef.Create;
    estimateItemFilter.kindRef.code := ENESTIMATEITEMKIND_MATERIALS;

    // обработаем вывод всех или не нулевых ..
    if not cbShowAll.Checked then
    begin
        estimateItemFilter.conditionSQL := ' ENESTIMATEITEM.COUNTFACT <> 0 ';
    end;

    ////
    estimateItemFilter.orderBySQL := 'KR.TECHKARTNUMBER, SM.NAME, ENESTIMATEITEMTYPE.CODE';
    ////

    ///
    pnlLegend.Visible := (ENPlanWorkObj.kind.code in [ENPLANWORKKIND_NPZ, ENPLANWORKKIND_FACT]);
    ///

    ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(estimateItemFilter, 0, -1);

    eiLastCount := High(ENEstimateItemList.list);

    if eiLastCount > -1 then
      sgENEstimateItem.RowCount := eiLastCount + 2
    else
      sgENEstimateItem.RowCount := 2;

     with sgENEstimateItem do
       for i := 0 to eiLastCount do
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


         if (ENPlanWorkObj.kind.code in [ENPLANWORKKIND_NPZ, ENPLANWORKKIND_FACT]) then
         begin
           // Если к нормативному материалу привязаны материалы из ФК, выделяем строку цветом
           //if checkMaterialsBinding(ENEstimateItemList.list[i].code) then
           if ENEstimateItemList.list[i].countFINMaterials > 0 then
           begin
             RowColor[i+1] := Shape1.Brush.Color; //$0080FF80; //$EBFFF5
             Objects[1,i+1] := TObject(1); // признак (разнесенный)
           end
           else begin
             RowColor[i+1] := clWindow;
             Objects[1,i+1] := TObject(0);
           end;
           //else
           //  RowColor[i+1] := clYellow;
         end
         else begin
           RowColor[i+1] := clWindow;

           // Выделяем цветом ручной ввод
           if ENEstimateItemList.list[i].typeRefCode in [ENESTIMATEITEMTYPE_CORRECTED, ENESTIMATEITEMTYPE_MANUAL_BY_PLANITEM]  then
             RowColor[i+1] := clMoneyGreen; //$EBFFF5

           // Выделяем цветом строки, относящиеся ко всей смете
           if ENEstimateItemList.list[i].typeRefCode in [ENESTIMATEITEMTYPE_MANUAL_BY_PLAN]  then
             RowColor[i+1] := clYellow;
         end;

         Objects[0,i+1] := TObject(ENEstimateItemList.list[i].typeRefCode);

         Objects[1,i+1] := TObject(ENEstimateItemList.list[i].statusRefCode);

         eiLastRow := i + 1;
         sgENEstimateItem.RowCount := eiLastRow + 1;
       end;

     //sgENEstimateItem.RowColor[1] := clGreen;

     eiColCount := eiColCount + 1;
     sgENEstimateItem.Row := 1;

     // выведем список ФИН материалов .... если они есть ВААЩЕ ...
     // и только для НПЗ и ФАКТА
     // а для ТЕКУЩЕГО могут быть уже приехавшие с заявки мат-лы
    //if ( ENPlanWorkObj.kind.code = ENPLANWORKKIND_NPZ) or ( ENPlanWorkObj.kind.code = ENPLANWORKKIND_FACT) then
    if ( ENPlanWorkObj.kind.code <> ENPLANWORKKIND_YEAR) then
    begin

        try
          j := StrToInt( sgENEstimateItem.Cells[0, sgENEstimateItem.Row ]); //   (sgENEstimateItem,0));
        except
          on EConvertError do
          begin
            HideControls([gbFINMaterials, gbMarkers]);
            Panel1.Align := alClient;
            Exit;
          end;
        end;

        if ENPlanWorkObj.kind.code <> ENPLANWORKKIND_CURRENT then
        begin
          gbFINMaterials.Visible := true;
          updateFINMaterialsGrid(j, sgFINMaterials);
        end
        else
          gbFINMaterials.Visible := false;

        gbMarkers.Visible := true;
        updateMarksGrid(j, sgMarkers);
    end
    else
    begin
       HideControls([gbFINMaterials, gbMarkers]);
       Panel1.Align := alClient;
    end;


  end;


  //--------------------------------------------------------------------------------
  if pcPlanWork.ActivePage = tsGSM then
  begin
    ///// 23.02.15 Нефиг ГСМ сгенеренный редактировать!!!
    //DisableActions([  actEdit], not (DialogState in [dsEdit, dsInsert]) );
    DisableActions([actInsert, actEdit, actDelete , actFilter, actNoFilter]);
    /////

    try
      actMaterialBindingToFIN.Enabled := (DialogState = dsEdit) and
                                         ((ENPlanWorkObj.kind.code = ENPLANWORKKIND_NPZ) or  (ENPlanWorkObj.kind.code = ENPLANWORKKIND_FACT))
                                         // and статус бы еще пробить ....
                                         ;

      actMaterialBindingToFIN.Visible := actMaterialBindingToFIN.Enabled;
    except
      actMaterialBindingToFIN.Enabled := false;
      actMaterialBindingToFIN.Visible := false;
    end;

    SetGridHeaders(ENEstimateItemHeaders, sgGSM.ColumnHeaders);
    eiColCount := -1;
    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

    //if estimateItemFilter = nil then
    //begin
       estimateItemFilter := ENEstimateItemFilter.Create;
       SetNullIntProps(estimateItemFilter);
       SetNullXSProps(estimateItemFilter);
    //end;

    if estimateItemFilter.planRef = nil then estimateItemFilter.planRef := ENPlanWorkRef.Create;
    estimateItemFilter.planRef.code := ENPlanWorkObj.code;

    //estimateItemFilter.conditionSQL := 'enestimateitem.kindrefcode in (1,2)';
    if estimateItemFilter.kindRef = nil then estimateItemFilter.kindRef := ENEstimateItemKindRef.Create;
    estimateItemFilter.kindRef.code := ENESTIMATEITEMKIND_GSM;

    // обработаем вывод всех или не нулевых ..
    if not cbShowAllGSM.Checked then
    begin
        estimateItemFilter.conditionSQL := ' ENESTIMATEITEM.COUNTFACT <> 0 ';
    end;

    ////
    estimateItemFilter.orderBySQL := 'KR.TECHKARTNUMBER, SM.NAME, ENESTIMATEITEMTYPE.CODE';
    ////

    ///
    pnlLegend.Visible := (ENPlanWorkObj.kind.code in [ENPLANWORKKIND_NPZ, ENPLANWORKKIND_FACT]);
    ///

    ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(estimateItemFilter, 0, -1);

    eiLastCount := High(ENEstimateItemList.list);

    if eiLastCount > -1 then
      sgGSM.RowCount := eiLastCount + 2
    else
      sgGSM.RowCount := 2;

     with sgGSM do
       for i := 0 to eiLastCount do
       begin
         Application.ProcessMessages;

         if ENEstimateItemList.list[i].code <> Low(Integer) then
           Cells[0,i+1] := IntToStr(ENEstimateItemList.list[i].code)
         else
           Cells[0,i+1] := '';

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

         Cells[8,i+1] := ENEstimateItemList.list[i].userGen;

         if ENEstimateItemList.list[i].dateEdit = nil then
           Cells[9,i+1] := ''
         else
           Cells[9,i+1] := XSDate2String(ENEstimateItemList.list[i].dateEdit);


         if (ENPlanWorkObj.kind.code in [ENPLANWORKKIND_NPZ, ENPLANWORKKIND_FACT]) then
         begin
           // Если к нормативному материалу привязаны материалы из ФК, выделяем строку цветом
           //if checkMaterialsBinding(ENEstimateItemList.list[i].code) then
           if ENEstimateItemList.list[i].countFINMaterials > 0 then
           begin
             RowColor[i+1] := Shape1.Brush.Color; //$0080FF80; //$EBFFF5
             Objects[1,i+1] := TObject(1); // признак (разнесенный)
           end
           else begin
             RowColor[i+1] := clWindow;
             Objects[1,i+1] := TObject(0);
           end;
           //else
           //  RowColor[i+1] := clYellow;
         end
         else begin
           RowColor[i+1] := clWindow;

           // Выделяем цветом ручной ввод
           if ENEstimateItemList.list[i].typeRefCode in [ENESTIMATEITEMTYPE_CORRECTED, ENESTIMATEITEMTYPE_MANUAL_BY_PLANITEM]  then
             RowColor[i+1] := clMoneyGreen; //$EBFFF5

           // Выделяем цветом строки, относящиеся ко всей смете
           if ENEstimateItemList.list[i].typeRefCode in [ENESTIMATEITEMTYPE_MANUAL_BY_PLAN]  then
             RowColor[i+1] := clYellow;
         end;

         Objects[0,i+1] := TObject(ENEstimateItemList.list[i].typeRefCode);

         eiLastRow := i + 1;
         sgGSM.RowCount := eiLastRow + 1;
       end;

     //sgENEstimateItem.RowColor[1] := clGreen;

     eiColCount := eiColCount + 1;
     sgGSM.Row := 1;

     // выведем список ФИН материалов .... если они есть ВААЩЕ ...
     // и только для НПЗ и ФАКТА

     if ( ENPlanWorkObj.kind.code = ENPLANWORKKIND_NPZ) or ( ENPlanWorkObj.kind.code = ENPLANWORKKIND_FACT) then
     begin

        try
          j := StrToInt( sgGSM.Cells[0, sgGSM.Row ]); //   (sgENEstimateItem,0));
        except
          on EConvertError do Exit;
        end;
        gbFINGSM.Visible := true;
        updateFINMaterialsGrid(j, sgFINGSM);
    end
    else
    begin
       gbFINGSM.Visible := false;
       pnlGSM.Align := alClient;
    end;

  end;


// ----------------------------------------------------------
  if pcPlanWork.ActivePage = tsHumens then
  begin
  SetGridHeaders(ENHumenItemHeaders, sgENHumenItem.ColumnHeaders);
  DisableActions([actInsert,  actEdit, actDelete, actFilter, actNoFilter]);
  if humenItemFilter = nil then
  begin
    humenItemFilter := ENHumenItemFilter.Create;
    SetNullIntProps(humenItemFilter);
    SetNullXSProps(humenItemFilter);
  end;

  if HumenItemFilter.planRef = nil then HumenItemFilter.planRef := ENPlanWorkRef.Create;
  HumenItemFilter.planRef.code := ENPlanWorkObj.code;

  HumenItemFilter.conditionSQL := 'enhumenitem.planitemrefcode in ('+
                          'select enplanworkitem.code from enplanworkitem where enplanworkitem.planrefcode ='+ IntToStr(ENPlanWorkObj.code) +
                          ' and enplanworkitem.countgen<>0'+
                          ')';

  HumenItemFilter.orderBySQL := 'enhumenitem.planitemrefcode';

  TempENHumenItem := HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;
  ENHumenItemList := TempENHumenItem.getScrollableFilteredList(HumenItemFilter, 0, -1);


  if High(ENHumenItemList.list) > -1 then
    sgENHumenItem.RowCount := High(ENHumenItemList.list) + 2
  else
    sgENHumenItem.RowCount := 2;

  with sgENHumenItem do
     for i := 0 to High(ENHumenItemList.list) do
     begin
        Application.ProcessMessages;
        if ENHumenItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENHumenItemList.list[i].code)
        else
        Cells[0,i+1] := '';

        AddCheckBox(1,i+1,false, false);

        Cells[1, i+1] := ENHumenItemList.list[i].positionGenName + ' ' + ENHumenItemList.list[i].positionGenRank + ' розряду';

        Cells[2, i+1] := ENHumenItemList.list[i].finWorkerPositionName;
        Cells[3, i+1] := ENHumenItemList.list[i].finWorkerName;

        if ENHumenItemList.list[i].countGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENHumenItemList.list[i].countGen.DecimalString;

        if ENHumenItemList.list[i].countFact = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENHumenItemList.list[i].countFact.DecimalString;

        Cells[6, i+1] := ENHumenItemList.list[i].kartaNum;
        Cells[7,i + 1] := ENHumenItemList.list[i].kartaRefName;



  sgENHumenItem.Row := 1;
  end;
end;

// -----------------------------------------------------------------------------------------------------

  if pcPlanWork.ActivePage = tsTransports then
  begin
     DisableActions([actInsert,  actEdit, actDelete, actFilter, actNoFilter]);

  SetGridHeaders(ENTransportItemHeaders, sgENTransportItem.ColumnHeaders);

  TempENTransportItem :=  HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;

  transportItemFilter := ENTransportItemFilter.Create;
  SetNullIntProps(transportItemFilter);
  SetNullXSProps(transportItemFilter);

  transportItemFilter.planRef := ENPlanWorkRef.Create;
  transportItemFilter.planRef.code := ENPlanWorkObj.code;

  transportItemFilter.conditionSQL := 'entransportitem.planitemrefcode in ('+
                          'select enplanworkitem.code from enplanworkitem where enplanworkitem.planrefcode ='+ IntToStr(ENPlanWorkObj.code) +
                          ' and enplanworkitem.countgen<>0'+
                          ')';

  transportItemFilter.orderBySQL := ' entransportitem.planitemrefcode';

  ENTransportItemList := TempENTransportItem.getScrollableFilteredList(transportItemFilter,0,-1);

  if High(ENTransportItemList.list) > -1 then
    sgENTransportItem.RowCount := High(ENTransportItemList.list) + 2
  else
    sgENTransportItem.RowCount := 2;


  with sgENTransportItem do
     for i := 0 to High(ENTransportItemList.list) do
     begin
        Application.ProcessMessages;
        if ENTransportItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTransportItemList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1, i+1] := ENTransportItemList.list[i].transportName;
        Cells[2, i+1] := ENTransportItemList.list[i].transportRealName;

        //Cells[3, i+1] := ENTransportItemList.list[i].workerFactName;
        Cells[3, i+1] := ENTransportItemList.list[i].finWorkerName + ' ' + ENTransportItemList.list[i].finWorkerPositionName;

        if ENTransportItemList.list[i].countWorkGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENTransportItemList.list[i].countWorkGen.DecimalString;

        if ENTransportItemList.list[i].countWorkFact = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENTransportItemList.list[i].countWorkFact.DecimalString;

        Cells[6, i+1] := ENTransportItemList.list[i].kartaNum;
        Cells[7,i + 1] := ENTransportItemList.list[i].kartaRefName;

        Cells[8,i+1] := ENTransportItemList.list[i].tktransportTypeName;

        if ENTransportItemList.list[i].distance <> nil then
            Cells[9,i+1] :=  ENTransportItemList.list[i].distance.DecimalString
        else
            Cells[9,i+1] := '';

        Cells[10,i+1] := ENTransportItemList.list[i].userGen;

        if ENTransportItemList.list[i].dateEdit = nil then
          Cells[11,i+1] := ''
        else
          Cells[12,i+1] := XSDate2String(ENTransportItemList.list[i].dateEdit);
        //LastRow:=i+1;
        //sgENHumenItem.RowCount:=LastRow+1;

                       // Выделяем цветом ручной ввод
       if ENTransportItemList.list[i].typeRefCode <> ENESTIMATEITEMTYPE_AUTO then
         sgENTransportItem.RowColor[i+1] := clMoneyGreen //$EBFFF5
       else
         sgENTransportItem.RowColor[i+1] := clWindow;

       Objects[0,i+1] := TObject(ENTransportItemList.list[i].typeRefCode);


  sgENTransportItem.Row := 1;
    end;

    toColCount := 1;

     SetGridHeaders(ENGroupedTransportItemHeaders, sgGroupedTransportItem.ColumnHeaders);
     TempENTransportOrder := HTTPRIOENTransportOrder as ENTransportOrderControllerSoapPort;
     ENTransportOrderList := TempENTransportOrder.getGroupedTransportListByPlanCode(ENPlanWorkObj.code);

      toCount := High(ENTransportOrderList.list);

    if toCount > -1 then
      sgGroupedTransportItem.RowCount := toCount + 2
    else
      sgGroupedTransportItem.RowCount := 2;

     with sgGroupedTransportItem do
       for i := 0 to toCount do
       begin
         Application.ProcessMessages;

         if ENTransportOrderList.list[i].code <> Low(Integer) then
           Cells[0,i+1] := IntToStr(ENTransportOrderList.list[i].code)
         else
           Cells[0,i+1] := '';

         Cells[1,i+1] := ENTransportOrderList.list[i].transportName;

         if ENTransportOrderList.list[i].timeStart = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := XSDateTime2String(ENTransportOrderList.list[i].timeStart);

          if ENTransportOrderList.list[i].dateStart = nil then
           Cells[3,i+1] := ''
         else
           Cells[3,i+1] := XSDateTimeWithoutTime2String(ENTransportOrderList.list[i].dateStart);

           if ENTransportOrderList.list[i].timeFinal = nil then
           Cells[4,i+1] := ''
         else
           Cells[4,i+1] := XSDateTime2String(ENTransportOrderList.list[i].timeFinal);

           if ENTransportOrderList.list[i].dateFinal = nil then
           Cells[5,i+1] := ''
         else
           Cells[5,i+1] := XSDateTimeWithoutTime2String(ENTransportOrderList.list[i].dateFinal);

           Cells[6,i+1] := ENTransportOrderList.list[i].transportRealName;

           Cells[7,i+1] := ENTransportOrderList.list[i].transportRealInvNumber;

           Cells[8,i+1] := ENTransportOrderList.list[i].transportRealGosNumber;

           Cells[9,i+1] := ENTransportOrderList.list[i].userGen;

           if ENTransportOrderList.list[i].dateEdit = nil then
           Cells[10,i+1] := ''
         else
           Cells[10,i+1] := XSDateTimeWithDate2String(ENTransportOrderList.list[i].dateEdit);

         Objects[0,i+1] := TObject(ENTransportOrderList.list[i].transportCode);
         Objects[1,i+1] := TObject(ENTransportOrderList.list[i].transportRealCode);

         toLastRow := i + 1;
         sgGroupedTransportItem.RowCount := toLastRow + 1;
       end;

     //sgENEstimateItem.RowColor[1] := clGreen;

     toColCount := toColCount + 1;
     sgGroupedTransportItem.Row := 1;


  end;

  //--------------------------------------------------------------------------------

  if pcPlanWork.ActivePage = tsLinkedPlans then
  begin
    DisableActions([actInsert, actEdit, actDelete, actFilter, actNoFilter]);

    ClearGrid(sgLinkedPlans);
    SetGridHeaders(ENLinkedPlansHeaders, sgLinkedPlans.ColumnHeaders);

    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    linkedPlansFilterObj := ENPlanWorkFilter.Create;
    SetNullIntProps(linkedPlansFilterObj);
    SetNullXSProps(linkedPlansFilterObj);

    linkedPlansFilterObj.conditionSQL := 'code in (' +
      ' select plannewrefcode from enplancorrecthistory where planrefcode = '
          + IntToStr(ENPlanWorkObj.code) + // 1. Все дочерние. Сработает, если это - "корневой" план
      ' union ' +
      ' select ' + IntToStr(ENPlanWorkObj.code) + ' as planrefcode ' + // 2. Добавим себя
      ' union ' +
      ' select planrefcode from enplancorrecthistory where plannewrefcode = '
          + IntToStr(ENPlanWorkObj.code) + // 3. Присоедим "корневой", если это дочерний план
      ' union ' +
      ' select plannewrefcode from enplancorrecthistory where planrefcode in '+
      ' (select planrefcode from enplancorrecthistory where plannewrefcode = '
          + IntToStr(ENPlanWorkObj.code) + ')' + // 4. Все планы с таким же "корневым"
      ' )';

    intCodesList := TempENPlanWork.getFilteredCodeArray(linkedPlansFilterObj);
    for i:=0 to High(intCodesList) do
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
       sgLinkedPlans.RowCount := High(linkedPlansList.list) + 2
    else
       sgLinkedPlans.RowCount := 2;

    with sgLinkedPlans do
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
     sgLinkedPlans.Row := 1;
    end; // если были связанные планы
  end;

  //--------------------------------------------------------------------------------
  if pcPlanWork.ActivePage = tsFuelHistory then
  begin
    UpdateFuelHistoryList;
  end;

  //--------------------------------------------------------------------------------
  if pcPlanWork.ActivePage = tsFuelSheetVolumes then
  begin
    UpdateFuelSheetVolumes;
    UpdateFuelSheetVolItemData;
  end;
end;

procedure TfrmENAVRPlanEdit.actInsertExecute(Sender: TObject);
Var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    TempENEstimateItem: ENEstimateItemControllerSoapPort;
begin

  //if ENPlanWorkObj.status.code <> ENPLANWORKSTATUS_GOOD then
  if not (ENPlanWorkObj.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION]) then
  begin
      Application.MessageBox(PChar('План затверджений або видалений !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;

  if pcPlanWork.ActivePage = tsPlanWorkItems then
  begin

    selectedRow := sgENPlanWorkItem.Row;

    TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
    ENPlanWorkItemObj:=ENPlanWorkItem.Create;
           SetNullIntProps(ENPlanWorkItemObj);
           SetNullXSProps(ENPlanWorkItemObj);

     ENPlanWorkItemObj.countGen:= TXSDecimal.Create;
     ENPlanWorkItemObj.dateEdit:= TXSDate.Create;
     ENPlanWorkItemObj.planRef := ENPlanWorkRef.Create;

    try
      frmENPlanWorkItemEdit:=TfrmENPlanWorkItemEdit.Create(Application, dsInsert);

      try
        ENPlanWorkItemObj.planRef.code := ENPlanWorkObj.code;
        frmENPlanWorkItemEdit.pcEstimate.Visible := false;
        if frmENPlanWorkItemEdit.ShowModal = mrOk then
        begin
          if ENPlanWorkItemObj<>nil then
          begin
              UpdateGrid(Sender);
          end;
        end;
        sgENPlanWorkItem.Row :=  sgENPlanWorkItem.RowCount - 1;
      finally
        frmENPlanWorkItemEdit.Free;
        frmENPlanWorkItemEdit:=nil;
      end;
    finally
      ENPlanWorkItemObj.Free;
    end;
  end;

  // -------------------------------------------------------------------------------------------
  
  if pcPlanWork.ActivePage = tsEstimateItems then
  begin
    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    ENEstimateItemObj := ENEstimateItem.Create;

    ENEstimateItemObj.countGen := TXSDecimal.Create;
    ENEstimateItemObj.countFact := TXSDecimal.Create;
    ENEstimateItemObj.dateEdit := TXSDate.Create;

    ENEstimateItemObj.planRef := ENPlanWorkRef.Create;
    ENEstimateItemObj.planRef.code := ENPlanWorkObj.code;

    ENEstimateItemObj.kindRef := ENEstimateItemKindRef.Create;
    ENEstimateItemObj.kindRef.code := ENESTIMATEITEMKIND_MATERIALS;

    try
      frmENEstimateItemEdit := TfrmENEstimateItemEdit.Create(Application, dsInsert);
      frmENEstimateItemEdit.ENPlanWorkCode := ENPlanWorkObj.code;
      try
        if frmENEstimateItemEdit.ShowModal = mrOk then
        begin
          if ENEstimateItemObj <> nil then
            //TempENEstimateItem.add(ENEstimateItemObj);
            UpdateGrid(Sender);
        end;
      finally
        frmENEstimateItemEdit.Free;
        frmENEstimateItemEdit := nil;
      end;
    finally
      ENEstimateItemObj.Free;
    end;
  end;


  // -------------------------------------------------------------------------------------------
{
  if pcPlanWork.ActivePage = tsGSM then
  begin

    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    ENEstimateItemObj := ENEstimateItem.Create;
    try
      ENEstimateItemObj.countGen := TXSDecimal.Create;
      ENEstimateItemObj.countFact := TXSDecimal.Create;
      ENEstimateItemObj.dateEdit := TXSDate.Create;

      ENEstimateItemObj.planRef := ENPlanWorkRef.Create;
      ENEstimateItemObj.planRef.code := ENPlanWorkObj.code;

      ENEstimateItemObj.kindRef := ENEstimateItemKindRef.Create;
      ENEstimateItemObj.kindRef.code := ENESTIMATEITEMKIND_GSM;

      frmENEstimateItemEdit := TfrmENEstimateItemEdit.Create(Application, dsInsert);
      
      try
        frmENEstimateItemEdit.ENPlanWorkCode := ENPlanWorkObj.code;

        frmENEstimateItemEdit.cbENEstimateItemKind.ItemIndex := ENESTIMATEITEMKIND_GSM - 1;

        DisableControls([ frmENEstimateItemEdit.cbENEstimateItemKind] );

        if frmENEstimateItemEdit.ShowModal = mrOk then
        begin
          if ENEstimateItemObj <> nil then
            //TempENEstimateItem.add(ENEstimateItemObj);
            UpdateGrid(Sender);
        end;
      finally
        frmENEstimateItemEdit.Free;
        frmENEstimateItemEdit := nil;
      end;
    finally
      ENEstimateItemObj.Free;
    end;
  end;
}

  if pcPlanWork.ActivePage = tsDismount then
  begin
    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    ENEstimateItemObj := ENEstimateItem.Create;
    try
      ENEstimateItemObj.countGen := TXSDecimal.Create;
      ENEstimateItemObj.countFact := TXSDecimal.Create;
      ENEstimateItemObj.dateEdit := TXSDate.Create;

      ENEstimateItemObj.planRef := ENPlanWorkRef.Create;
      ENEstimateItemObj.planRef.code := ENPlanWorkObj.code;

      ENEstimateItemObj.kindRef := ENEstimateItemKindRef.Create;
      ENEstimateItemObj.kindRef.code := ENESTIMATEITEMKIND_DISMOUNT;

      frmENEstimateItemEdit := TfrmENEstimateItemEdit.Create(Application, dsInsert);
      try
        frmENEstimateItemEdit.ENPlanWorkCode := ENPlanWorkObj.code;
        frmENEstimateItemEdit.cbENEstimateItemKind.ItemIndex := ENESTIMATEITEMKIND_DISMOUNT - 1;
        frmENEstimateItemEdit.DisableControls([frmENEstimateItemEdit.cbENEstimateItemKind]);
        frmENEstimateItemEdit.HideControls([frmENEstimateItemEdit.lblCountGen, frmENEstimateItemEdit.edtCountGen]);
        frmENEstimateItemEdit.lblCountFact.Caption := 'кількість';

        if frmENEstimateItemEdit.ShowModal = mrOk then
        begin
          if ENEstimateItemObj <> nil then
            //TempENEstimateItem.add(ENEstimateItemObj);
            UpdateGrid(Sender);
        end;
      finally
        frmENEstimateItemEdit.Free;
        frmENEstimateItemEdit := nil;
      end;
    finally
      ENEstimateItemObj.Free;
    end;
  end;
end;

procedure TfrmENAVRPlanEdit.UpdateFuelHistoryList;
var
  TempENPlanWorkFuelHistory: ENPlanWorkFuelHistoryControllerSoapPort;
  fuelHistoryFilter: ENPlanWorkFuelHistoryFilter;
  fuelHistoryList: ENPlanWorkFuelHistoryShortList;
  i, fuelHistoryCount: Integer;
begin
  ClearGrid(sgENPlanWorkFuelHistory);

  if DialogState = dsInsert then Exit;

  TempENPlanWorkFuelHistory := HTTPRIOENPlanWorkFuelHistory as ENPlanWorkFuelHistoryControllerSoapPort;

  fuelHistoryFilter := ENPlanWorkFuelHistoryFilter.Create;
  SetNullIntProps(fuelHistoryFilter);
  SetNullXSProps(fuelHistoryFilter);

  fuelHistoryFilter.planRef := ENPlanWorkRef.Create;
  fuelHistoryFilter.planRef.code := ENPlanWorkObj.code;

  fuelHistoryFilter.orderBySQL := 'ENPLANWORKFUELHISTORY.VERSION, ENPLANWORKFUELHISTORY.DATEGEN, TKFUELTYPE.NAME, ENPLANWORKFUELHISTORY.CODE';

  fuelHistoryList := TempENPlanWorkFuelHistory.getScrollableFilteredList(fuelHistoryFilter, 0, -1);

  fuelHistoryCount := High(fuelHistoryList.list);

  if fuelHistoryCount > -1 then
    sgENPlanWorkFuelHistory.RowCount := fuelHistoryCount + 2
  else
    sgENPlanWorkFuelHistory.RowCount := 2;

{
  ENPlanWorkFuelHistoryHeaders: array [1..7] of String =
        ( 'Код'
          ,'Версія запису'
          ,'Дата плана'
          ,'Тип ПММ'
          ,'Обсяг ПММ, л.'
          ,'Користувач, який створив запис'
          ,'Дата створення'
          //,'Користувач, який вніс зміни'
          //,'Дата зміни'
        );
}

   with sgENPlanWorkFuelHistory do
     for i := 0 to fuelHistoryCount do
     begin
       Application.ProcessMessages;

       if fuelHistoryList.list[i].code <> Low(Integer) then
         Cells[0,i+1] := IntToStr(fuelHistoryList.list[i].code)
       else
         Cells[0,i+1] := '';

       if fuelHistoryList.list[i].version = Low(Integer) then
         Cells[1,i+1] := ''
       else
         Cells[1,i+1] := IntToStr(fuelHistoryList.list[i].version);

       if fuelHistoryList.list[i].dateGen = nil then
         Cells[2,i+1] := ''
       else
         Cells[2,i+1] := XSDate2String(fuelHistoryList.list[i].dateGen);

       Cells[3,i+1] := fuelHistoryList.list[i].fuelTypeRefName;

       if fuelHistoryList.list[i].countGen = nil then
         Cells[4,i+1] := ''
       else
         Cells[4,i+1] := fuelHistoryList.list[i].countGen.DecimalString;

       Cells[5,i+1] := fuelHistoryList.list[i].userAdd;

       if fuelHistoryList.list[i].dateAdd = nil then
         Cells[6,i+1] := ''
       else
         Cells[6,i+1] := XSDateTimeWithDate2String(fuelHistoryList.list[i].dateAdd);

       sgENPlanWorkFuelHistory.RowCount := i + 2;
     end;

  sgENPlanWorkFuelHistory.Row := 1;
end;

procedure TfrmENAVRPlanEdit.UpdateFuelSheetVolItemData;
var
  TempENFuelSheetVolItemData: ENFuelSheetVolItemDataControllerSoapPort;
  itemDataFilter: ENFuelSheetVolItemDataFilter;
  itemDataList: ENFuelSheetVolItemDataShortList;
  i, itemDataCount, fuelSheetVolumesCode: Integer;
begin
  ClearGrid(sgENFuelSheetVolItemData);

  if DialogState = dsInsert then Exit;

  { Будем выбирать все строки, в которые попал план, а не по конкретной ведомости
  try
    fuelSheetVolumesCode := StrToInt(sgENFuelSheetVolumes.Cells[0, sgENFuelSheetVolumes.Row]);
  except
    on EConvertError do Exit;
  end;

  if fuelSheetVolumesCode <= 0 then Exit;
  }

  if ENPlanWorkObj.code <= 0 then Exit;

  itemDataFilter := ENFuelSheetVolItemDataFilter.Create;
  SetNullIntProps(itemDataFilter);
  SetNullXSProps(itemDataFilter);

  //itemDataFilter.sheetVolumesRef := ENFuelSheetVolumesRef.Create;
  //itemDataFilter.sheetVolumesRef.code := fuelSheetVolumesCode;

  itemDataFilter.plan_code := ENPlanWorkObj.code;

  TempENFuelSheetVolItemData := HTTPRIOENFuelSheetVolItemData as ENFuelSheetVolItemDataControllerSoapPort;

  itemDataList := TempENFuelSheetVolItemData.getScrollableFilteredList(itemDataFilter, 0, -1);

  itemDataCount := High(itemDataList.list);

  if itemDataCount > -1 then
    sgENFuelSheetVolItemData.RowCount := itemDataCount + 2
  else
    sgENFuelSheetVolItemData.RowCount := 2;

  with sgENFuelSheetVolItemData do
    for i := 0 to itemDataCount do
    begin
      Application.ProcessMessages;

      if itemDataList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(itemDataList.list[i].code)
      else
        Cells[0,i+1] := '';

      Cells[1,i+1] := itemDataList.list[i].materialName;

      if itemDataList.list[i].countFact = nil then
        Cells[2,i+1] := ''
      else
        Cells[2,i+1] := itemDataList.list[i].countFact.DecimalString;

      sgENFuelSheetVolItemData.RowCount := i + 2;
    end;

  sgENFuelSheetVolItemData.Row := 1;
end;

procedure TfrmENAVRPlanEdit.UpdateFuelSheetVolumes;
var TempENFuelSheetVolumes: ENFuelSheetVolumesControllerSoapPort;
    fuelSheetVolumesFilter: ENFuelSheetVolumesFilter;
    fuelSheetVolumesList: ENFuelSheetVolumesShortList;
    i, fuelSheetVolumesCount: Integer;
begin
  ClearGrid(sgENFuelSheetVolumes);

  if DialogState = dsInsert then Exit;

  if ENPlanWorkObj.code <= 0 then Exit;

  TempENFuelSheetVolumes := HTTPRIOENFuelSheetVolumes as ENFuelSheetVolumesControllerSoapPort;

  fuelSheetVolumesFilter := ENFuelSheetVolumesFilter.Create;
  SetNullIntProps(fuelSheetVolumesFilter);
  SetNullXSProps(fuelSheetVolumesFilter);

  fuelSheetVolumesFilter.conditionSQL :=
    'ENFUELSHEETVOLUMES.CODE in ' +
    '( ' +
    '  select d.sheetvolumesrefcode ' +
    '  from enfuelsheetvolitemdata d ' +
    '  where d.plan_code = ' + IntToStr(ENPlanWorkObj.code) +
    ') ';

  fuelSheetVolumesFilter.orderBySQL := 'ENFUELSHEETVOLUMES.STARTDATE, ENFUELSHEETVOLUMES.FUELTYPE';

  fuelSheetVolumesList := TempENFuelSheetVolumes.getScrollableFilteredList(fuelSheetVolumesFilter, 0, -1);

  fuelSheetVolumesCount := High(fuelSheetVolumesList.list);

  if fuelSheetVolumesCount > -1 then
    sgENFuelSheetVolumes.RowCount := fuelSheetVolumesCount + 2
  else
    sgENFuelSheetVolumes.RowCount := 2;

   with sgENFuelSheetVolumes do
    for i := 0 to fuelSheetVolumesCount do
      begin
        Application.ProcessMessages;
        if fuelSheetVolumesList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(fuelSheetVolumesList.list[i].code)
        else
          Cells[0,i+1] := '';
        Cells[1,i+1] := fuelSheetVolumesList.list[i].name;

        if fuelSheetVolumesList.list[i].startDate = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := MonthesNames[fuelSheetVolumesList.list[i].startDate.Month] + ' ' +
                          IntToStr(fuelSheetVolumesList.list[i].startDate.Year) + ', ' +
                          IntToStr(getDecadeNumber(fuelSheetVolumesList.list[i].startDate)) + ' декада';

        Cells[3,i+1] := fuelSheetVolumesList.list[i].fuelTypeName;
        Cells[4,i+1] := fuelSheetVolumesList.list[i].statusRefName;

        Cells[5,i+1] := fuelSheetVolumesList.list[i].userAdd;
        if fuelSheetVolumesList.list[i].dateAdd = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDateTimeWithDate2String(fuelSheetVolumesList.list[i].dateAdd);

        Cells[7,i+1] := fuelSheetVolumesList.list[i].userGen;
        if fuelSheetVolumesList.list[i].dateEdit = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := XSDateTimeWithDate2String(fuelSheetVolumesList.list[i].dateEdit);

        sgENFuelSheetVolumes.RowCount := i + 2;
      end;

   sgENFuelSheetVolumes.Row := 1;
end;

procedure TfrmENAVRPlanEdit.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 if pcPlanWork.ActivePage = tsPlanWorkItems then
 begin
   for i:=1 to sgENPlanWorkItem.RowCount-1 do
     for j:=0 to sgENPlanWorkItem.ColCount-1 do
       sgENPlanWorkItem.Cells[j,i]:='';
 end;

 if pcPlanWork.ActivePage = tsEstimateItems then
 begin
   for i:=1 to sgENEstimateItem.RowCount-1 do
     for j:=0 to sgENEstimateItem.ColCount-1 do
       sgENEstimateItem.Cells[j,i]:='';
 end;

 if pcPlanWork.ActivePage = tsGSM then
 begin
   for i:=1 to sgGSM.RowCount-1 do
     for j:=0 to sgGSM.ColCount-1 do
       sgGSM.Cells[j,i]:='';
 end;

 if pcPlanWork.ActivePage = tsDismount then
 begin
   for i:=1 to sgDismount.RowCount-1 do
     for j:=0 to sgDismount.ColCount-1 do
       sgDismount.Cells[j,i]:='';
 end;

 if pcPlanWork.ActivePage = tsHumens then
 begin
   for i:=1 to sgENHumenItem.RowCount-1 do
     for j:=0 to sgENHumenItem.ColCount-1 do
       sgENHumenItem.Cells[j,i]:='';
 end;

 if pcPlanWork.ActivePage = tsTransports then
 begin
   ClearGrid(sgENTransportItem);
   ClearGrid(sgGroupedTransportItem);
   ClearGrid(sgDetailedTransportItem);
   chbDetailed.Checked := false;

 end;

 pcPlanWorkChange(Sender);
end;

procedure TfrmENAVRPlanEdit.actEditExecute(Sender: TObject);
Var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    TempENEstimateItem: ENEstimateItemControllerSoapPort;
begin
  if not (ENPlanWorkObj.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION]) then
  begin
      Application.MessageBox(PChar('План затверджений або видалений !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;

  if pcPlanWork.ActivePage = tsPlanWorkItems then
  begin
    TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
    try
      ENPlanWorkItemObj := TempENPlanWorkItem.getObject(StrToInt(sgENPlanWorkItem.Cells[0,sgENPlanWorkItem.Row]));
    except
      on EConvertError do Exit;
    end;

    selectedRow := sgENPlanWorkItem.Row;
    frmENPlanWorkItemEdit:=TfrmENPlanWorkItemEdit.Create(Application, dsEdit);

    try
       frmENPlanWorkItemEdit.lblMeasure.Caption := 'Вимірювач : ' + sgENPlanWorkItem.Cells[8,sgENPlanWorkItem.Row] + ' /  Од.виміру : ' + sgENPlanWorkItem.Cells[9,sgENPlanWorkItem.Row];
       frmENPlanWorkItemEdit.Enabled := True;
      if frmENPlanWorkItemEdit.ShowModal= mrOk then
        begin
          //TempENLine04.save(ENLine04Obj);
          UpdateGrid(Sender);
        end;

        if  sgENPlanWorkItem.RowCount > selectedRow then
           sgENPlanWorkItem.Row := selectedRow
        else
           sgENPlanWorkItem.Row :=  sgENPlanWorkItem.RowCount-1;
    finally
      frmENPlanWorkItemEdit.Free;
      frmENPlanWorkItemEdit:=nil;
    end;
  end;


///--------------------------------------------------------------------------------

  if (pcPlanWork.ActivePage = tsEstimateItems) then
  begin
    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    try
      ENEstimateItemObj := TempENEstimateItem.getObject(StrToInt(sgENEstimateItem.Cells[0,sgENEstimateItem.Row]));
    except
      on EConvertError do Exit;
    end;

    {
     if  not (Integer(sgENEstimateItem.Objects[0,sgENEstimateItem.Row]) in [ENESTIMATEITEMTYPE_MANUAL_BY_PLAN ]) then //такие редактировать из РАБОТЫ
     begin
       Application.MessageBox(PChar('Цей матеріaл змінюється в роботі !!!'), PChar('Внимание !'),MB_ICONQUESTION+MB_OK);
       exit;
     end;
    }
    
    frmENEstimateItemEdit:=TfrmENEstimateItemEdit.Create(Application, dsEdit);
    try
    //ENEstimateItemObj.planRef.code := ENPlanWorkObj.code;
      if frmENEstimateItemEdit.ShowModal= mrOk then
      begin
        //TempENEstimateItem.save(ENEstimateItemObj);
        UpdateGrid(Sender);
      end;
    finally
      frmENEstimateItemEdit.Free;
      frmENEstimateItemEdit:=nil;
    end;
  end;


///--------------------------------------------------------------------------------

  if (pcPlanWork.ActivePage = tsGSM) then
  begin
    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    try
      ENEstimateItemObj := TempENEstimateItem.getObject(StrToInt(sgGSM.Cells[0,sgGSM.Row]));
    except
      on EConvertError do Exit;
    end;
{
     if  not (Integer(sgENEstimateItem.Objects[0,sgENEstimateItem.Row]) in [ENESTIMATEITEMTYPE_MANUAL_BY_PLAN ]) then //такие редактировать из РАБОТЫ
     begin
       Application.MessageBox(PChar('Цей матеріaл змінюється в роботі !!!'), PChar('Внимание !'),MB_ICONQUESTION+MB_OK);
       exit;
     end;
}

    frmENEstimateItemEdit:=TfrmENEstimateItemEdit.Create(Application, dsEdit);
    try
    //ENEstimateItemObj.planRef.code := ENPlanWorkObj.code;
      if frmENEstimateItemEdit.ShowModal= mrOk then
      begin
        //TempENEstimateItem.save(ENEstimateItemObj);
        UpdateGrid(Sender);
      end;
    finally
      frmENEstimateItemEdit.Free;
      frmENEstimateItemEdit:=nil;
    end;
  end;

  // --------------------------------------------------------
  
  if  (pcPlanWork.ActivePage = tsDismount) then
  begin
    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    try
      ENEstimateItemObj := TempENEstimateItem.getObject(StrToInt(sgDismount.Cells[0,sgDismount.Row]));
    except
      on EConvertError do Exit;
    end;
{
     if  not (Integer(sgENEstimateItem.Objects[0,sgDismount.Row]) in [ENESTIMATEITEMTYPE_MANUAL_BY_PLAN ]) then //такие редактировать из РАБОТЫ
     begin
       Application.MessageBox(PChar('Цей матеріaл змінюється в роботі !!!'), PChar('Внимание !'),MB_ICONQUESTION+MB_OK);
       exit;
     end;
}
    frmENEstimateItemEdit:=TfrmENEstimateItemEdit.Create(Application, dsEdit);
    try
    //ENEstimateItemObj.planRef.code := ENPlanWorkObj.code;
      if frmENEstimateItemEdit.ShowModal= mrOk then
      begin
        //TempENEstimateItem.save(ENEstimateItemObj);
        UpdateGrid(Sender);
      end;
    finally
      frmENEstimateItemEdit.Free;
      frmENEstimateItemEdit:=nil;
    end;
  end;


end;

procedure TfrmENAVRPlanEdit.actViewExecute(Sender: TObject);
Var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    TempENEstimateItem: ENEstimateItemControllerSoapPort;
    TempENTransportItem: ENTransportItemControllerSoapPort;
    TempENHumenItem: ENHumenItemControllerSoapPort;

    frmViewLinkedPlan : TfrmENPlanWorkEdit;
    TempENPlanWork: ENPlanWorkControllerSoapPort;
    objcode : integer;
begin
  if pcPlanWork.ActivePage = tsPlanWorkItems then
  begin

    TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
    try
      ENPlanWorkItemObj := TempENPlanWorkItem.getObject(StrToInt(sgENPlanWorkItem.Cells[0,sgENPlanWorkItem.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENPlanWorkItemEdit:=TfrmENPlanWorkItemEdit.Create(Application, dsView);
    try
      //frmENPlanWorkItemEdit.DisableControls([frmENLine04Edit.edtENSubstation04Name, frmENLine04Edit.spbENSubstation04]);
      frmENPlanWorkItemEdit.lblMeasure.Caption := 'Вимірювач : ' + sgENPlanWorkItem.Cells[8,sgENPlanWorkItem.Row] + ' /  Од.виміру : ' + sgENPlanWorkItem.Cells[9,sgENPlanWorkItem.Row];
      frmENPlanWorkItemEdit.Enabled := True;
      if frmENPlanWorkItemEdit.ShowModal= mrOk then
      begin
        //TempENLine04.save(ENLine04Obj);
        //UpdateGrid(Sender);
      end;
    finally
      frmENPlanWorkItemEdit.Free;
      frmENPlanWorkItemEdit:=nil;
    end;

  end;

  if (pcPlanWork.ActivePage = tsEstimateItems)  then
  begin

    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    try
      ENEstimateItemObj := TempENEstimateItem.getObject(StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]));

    except
      on EConvertError do Exit;
    end;

    frmENEstimateItemEdit := TfrmENEstimateItemEdit.Create(Application, dsView);
    try
      //frmENEstimateItemEdit.DisableControls([frmENLine04Edit.edtENSubstation04Name, frmENLine04Edit.spbENSubstation04]);
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


  if (pcPlanWork.ActivePage = tsGSM)  then
  begin

    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    try
      ENEstimateItemObj := TempENEstimateItem.getObject(StrToInt(sgGSM.Cells[0, sgGSM.Row]));

    except
      on EConvertError do Exit;
    end;

    frmENEstimateItemEdit := TfrmENEstimateItemEdit.Create(Application, dsView);
    try
      //frmENEstimateItemEdit.DisableControls([frmENLine04Edit.edtENSubstation04Name, frmENLine04Edit.spbENSubstation04]);
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


  if (pcPlanWork.ActivePage = tsDismount) then
  begin

    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    try
      ENEstimateItemObj := TempENEstimateItem.getObject(StrToInt(sgDismount.Cells[0, sgDismount.Row]));

    except
      on EConvertError do Exit;
    end;

    frmENEstimateItemEdit := TfrmENEstimateItemEdit.Create(Application, dsView);
    try
      //frmENEstimateItemEdit.DisableControls([frmENLine04Edit.edtENSubstation04Name, frmENLine04Edit.spbENSubstation04]);
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

  if pcPlanWork.ActivePage = tsHumens then
  begin

    TempENHumenItem := HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;
    try
      ENHumenItemObj := TempENHumenItem.getObject(StrToInt(sgENHumenItem.Cells[0, sgENHumenItem.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENHumenItemEdit := TfrmENHumenItemEdit.Create(Application, dsView);
    try
      //frmENEstimateItemEdit.DisableControls([frmENLine04Edit.edtENSubstation04Name, frmENLine04Edit.spbENSubstation04]);
      if frmENHumenItemEdit.ShowModal= mrOk then
      begin
        //TempENLine04.save(ENLine04Obj);
        //UpdateGrid(Sender);
      end;
    finally
      frmENHumenItemEdit.Free;
      frmENHumenItemEdit := nil;
    end;
  end;

  if pcPlanWork.ActivePage = tsTransports then
  begin

    TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;
    try
      ENTransportItemObj := TempENTransportItem.getObject(StrToInt(sgENTransportItem.Cells[0, sgENTransportItem.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENTransportItemEdit := TfrmENTransportItemEdit.Create(Application, dsView);
    try
      //frmENEstimateItemEdit.DisableControls([frmENLine04Edit.edtENSubstation04Name, frmENLine04Edit.spbENSubstation04]);
      if frmENTransportItemEdit.ShowModal= mrOk then
      begin
        //TempENLine04.save(ENLine04Obj);
        //UpdateGrid(Sender);
      end;
    finally
      frmENTransportItemEdit.Free;
      frmENTransportItemEdit := nil;
    end;
  end;

  if pcPlanWork.ActivePage = tsLinkedPlans then
  begin
    try
      ObjCode := StrToInt(sgLinkedPlans.Cells[0, sgLinkedPlans.Row]);
    except
      on EConvertError do Exit;
    end;

    frmViewLinkedPlan := TfrmENPlanWorkEdit.Create(Application, dsView);
    try
      TempENPlanWork  := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
      frmViewLinkedPlan.ENPlanWorkObj := ENPlanWork.Create;
      frmViewLinkedPlan.ENPlanWorkObj := TempENPlanWork.getObject(ObjCode);

      frmViewLinkedPlan.Caption := 'Пов''язаний план';
      frmViewLinkedPlan.ShowModal;
    finally
      frmViewLinkedPlan.Free;
      frmViewLinkedPlan := nil;
    end;
  end;
end;

procedure TfrmENAVRPlanEdit.actViewFuelSheetVolumesExecute(Sender: TObject);
var TempENFuelSheetVolumes: ENFuelSheetVolumesControllerSoapPort;
begin
  TempENFuelSheetVolumes := HTTPRIOENFuelSheetVolumes as ENFuelSheetVolumesControllerSoapPort;
  try
    ENFuelSheetVolumesObj := TempENFuelSheetVolumes.getObject(StrToInt(sgENFuelSheetVolumes.Cells[0, sgENFuelSheetVolumes.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENFuelSheetVolumesEdit := TfrmENFuelSheetVolumesEdit.Create(Application, dsView);
  try
    frmENFuelSheetVolumesEdit.ShowModal;
  finally
    frmENFuelSheetVolumesEdit.Free;
    frmENFuelSheetVolumesEdit := nil;
  end;
end;

procedure TfrmENAVRPlanEdit.actUpdateExecute(Sender: TObject);
begin
  inherited;
  //selectedRow := sgENPlanWorkItem.Row;
  UpdateGrid(Sender);
  {
  if  sgENPlanWorkItem.RowCount > selectedRow then
     sgENPlanWorkItem.Row := selectedRow
  else
     sgENPlanWorkItem.Row :=  sgENPlanWorkItem.RowCount-1;
  }   
end;

procedure TfrmENAVRPlanEdit.btnPlanReportClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
begin
  if DialogState = dsInsert then Exit;

  /////// Parameters
{  SetLength(argNames, 2);
  SetLength(args, 2);

  argNames[0] := 'yearGen';
  args[0] := IntToStr(ENPlanWorkObj.yearGen);

  argNames[1] := 'monthGen';
  args[1] := IntToStr(ENPlanWorkObj.monthGen);
  ///////

  makeReport('materialByRen', argNames, args, 'pdf');
  }
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'planCode';
  args[0] := IntToStr(ENPlanWorkObj.code);

  ///////

  makeReport('materialUndeliveredByPlan', argNames, args, 'xls');
end;



procedure TfrmENAVRPlanEdit.actDeleteExecute(Sender: TObject);
Var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
  ObjCode: Integer;
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  eType : integer;
begin

//EXIT;

  //if ENPlanWorkObj.status.code <> ENPLANWORKSTATUS_GOOD then
  if not (ENPlanWorkObj.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION]) then
  begin
      Application.MessageBox(PChar('План затверджений або видалений !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;

  if Application.MessageBox(PChar('Вы действительно хотите удалить запись ?'),
                            PChar('Внимание!'),
                            MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;

  if pcPlanWork.ActivePage = tsPlanWorkItems then
  begin
    selectedRow := sgENPlanWorkItem.Row;
    TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;

    try
      ObjCode := StrToInt(sgENPlanWorkItem.Cells[0,sgENPlanWorkItem.Row]);
    except
      on EConvertError do Exit;
    end;

    // определим тип элемента по коду
    // и вызовм НУЖНЫЙ метод ... - чтоб левые юзера не планировали на правые обьекты
    //eType := DMReports.getElementTypeByPlanItem(ObjCode);
{
      if eType in [1,2,3] then
        TempENPlanWorkItem.removeBySRS(ObjCode)
      else
      if eType = 5 then
        TempENPlanWorkItem.removeBySVES(ObjCode);
}
      {
      case eType of
        1,2,3 : TempENPlanWorkItem.removeBySRS(ObjCode);
        5 : TempENPlanWorkItem.removeBySVES(ObjCode);
        6 : TempENPlanWorkItem.removeBySPS(ObjCode);
        7 : TempENPlanWorkItem.removeByByt(ObjCode);
        8 : TempENPlanWorkItem.removeByProm(ObjCode);
        else
        begin
          Application.MessageBox(PChar('Невідомий тип Об"єкту !!!'), PChar('Помилка'), MB_ICONERROR);
          exit;
        end;
      end;
      }

      TempENPlanWorkItem.remove(ObjCode);
      UpdateGrid(Sender);

        if  sgENPlanWorkItem.RowCount > selectedRow then
           sgENPlanWorkItem.Row := selectedRow - 1
        else
           sgENPlanWorkItem.Row :=  sgENPlanWorkItem.RowCount-1;

    //end;
  end; // pcPlanWork.ActivePage = tsPlanWorkItems

// ---------------------------------------------------------------------------------
  if pcPlanWork.ActivePage = tsEstimateItems then
  begin
     if  Integer(sgENEstimateItem.Objects[0,sgENEstimateItem.Row]) in [ENESTIMATEITEMTYPE_MANUAL_BY_PLANITEM ] then //такие удалять из РАБОТЫ .., ENESTIMATEITEMTYPE_MANUAL_BY_PLANITEM]  then
     begin
       Application.MessageBox(PChar('Цей матеріaл видаляється в роботі !!!'), PChar('Увага !'),MB_ICONQUESTION+MB_OK);
       exit;
     end;

     if  Integer(sgENEstimateItem.Objects[0,sgENEstimateItem.Row]) in [ENESTIMATEITEMTYPE_MANUAL_BY_PLAN ] then //такие удалять из РАБОТЫ .., ENESTIMATEITEMTYPE_MANUAL_BY_PLANITEM]  then
     begin
       TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
         try
           ObjCode := StrToInt(sgENEstimateItem.Cells[0,sgENEstimateItem.Row]);
         except
         on EConvertError do Exit;
        end;
        //if Application.MessageBox(PChar('Вы действительно хотите удалить материал ?'),
        //                  PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
        begin
            // определим тип элемента по коду
            // и вызовм НУЖНЫЙ метод ... - чтоб левые юзера не планировали на правые обьекты
            {
            eType := DMReports.getElementTypeByEstimateItem(ObjCode);
            case eType of
              1,2,3 : TempENEstimateItem.removeBySRS(ObjCode);
              5 : TempENEstimateItem.removeBySVES(ObjCode);
              6 : TempENEstimateItem.removeBySPS(ObjCode);
              7 : TempENPlanWorkItem.removeByByt(ObjCode);
              8 : TempENPlanWorkItem.removeByProm(ObjCode);
              else
              begin
                Application.MessageBox(PChar('Невідомий тип Об"єкту !!!'), PChar('Помилка'), MB_ICONERROR);
                exit;
              end;
            end;
            }
            TempENEstimateItem.remove(ObjCode);
            UpdateGrid(Sender);
        end;
     end
     else
        Application.MessageBox(PChar('Цю строку неможливо видалити! Змінюйте фактичну кількість або видаляйте строку плану !'),
                          PChar('Увага!'),MB_ICONWARNING);

  end; //pcPlanWork.ActivePage = tsEstimateItems


// ---------------------------------------------------------------------------------
  if pcPlanWork.ActivePage = tsDismount then
  begin
     TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
     try
       ObjCode := StrToInt(sgDismount.Cells[0,sgDismount.Row]);
     except
       on EConvertError do Exit;
     end;

     //if Application.MessageBox(PChar('Вы действительно хотите удалить материал ?'),
     //                   PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
     begin
          // определим тип элемента по коду
          // и вызовм НУЖНЫЙ метод ... - чтоб левые юзера не планировали на правые обьекты
          {
          eType := DMReports.getElementTypeByEstimateItem(ObjCode);
          case eType of
            1,2,3 : TempENEstimateItem.removeBySRS(ObjCode);
            5 : TempENEstimateItem.removeBySVES(ObjCode);
            6 : TempENEstimateItem.removeBySPS(ObjCode);
            7 : TempENPlanWorkItem.removeByByt(ObjCode);
            8 : TempENPlanWorkItem.removeByProm(ObjCode);
            else
            begin
              Application.MessageBox(PChar('Невідомий тип Об"єкту !!!'), PChar('Помилка'), MB_ICONERROR);
              exit;
            end;
          end;
          }
          TempENEstimateItem.remove(ObjCode);
          UpdateGrid(Sender);
     end;

  end; //pcPlanWork.ActivePage = tsDismount
end;

procedure TfrmENAVRPlanEdit.spbDepartmentClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);


   f.code := 1;
   if ENPlanWorkObj.elementRef <> nil then
      if ENPlanWorkObj.elementRef.code > LOW_INT then
         if ENPlanWorkObj.renRef <> nil then

            if ENPlanWorkObj.renRef.code > 0 then
            begin
               f.conditionSQL := 'code in (select departmentrefcode from endepartment2epren where renrefcode = ' + IntToStr(ENPlanWorkObj.renRef.code) +')';
               f.code := Low(integer);
            end;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkObj.departmentRef = nil then ENPlanWorkObj.departmentRef := ENDepartmentRef.Create();
               ENPlanWorkObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmENAVRPlanEdit.actMaterialBindingExecute(Sender: TObject);
begin
  if DialogState in [dsView, dsInsert] then Exit;
  if Integer(sgENEstimateItem.Objects[0, sgENEstimateItem.Row]) <> ENESTIMATEITEMTYPE_MANUAL_BY_PLAN then Exit;

  frmMaterialToPlanItemBindingEdit := TfrmMaterialToPlanItemBindingEdit.Create(Application, dsInsert);
  try
    frmMaterialToPlanItemBindingEdit.materialCode := Low(Integer);
    frmMaterialToPlanItemBindingEdit.materialCount := 0;
    frmMaterialToPlanItemBindingEdit.materialName := '';

    frmMaterialToPlanItemBindingEdit.planCode := ENPlanWorkObj.code;

    try
      //frmMaterialToPlanItemBindingEdit.materialCode := StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]);
      frmMaterialToPlanItemBindingEdit.estimateItemCode := StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]);
      frmMaterialToPlanItemBindingEdit.materialName := sgENEstimateItem.Cells[1, sgENEstimateItem.Row];
      frmMaterialToPlanItemBindingEdit.materialCount := StrToFloat(sgENEstimateItem.Cells[3, sgENEstimateItem.Row]);
    except
      on EConvertError do Exit;
    end;

    //if frmMaterialToPlanItemBindingEdit.materialCode < 0 then Exit;
    if frmMaterialToPlanItemBindingEdit.estimateItemCode < 0 then Exit;
    if frmMaterialToPlanItemBindingEdit.materialCount <= 0 then Exit;

    if frmMaterialToPlanItemBindingEdit.ShowModal = mrOk then
    begin
      actUpdateExecute(Sender);
    end;
  finally
    frmMaterialToPlanItemBindingEdit.Free;
  end;
end;

procedure TfrmENAVRPlanEdit.PopupMenu1Popup(Sender: TObject);
begin
  actMaterialBinding.Enabled := (DialogState = dsEdit) and
                                (pcPlanWork.ActivePage = tsEstimateItems) and
                                (Integer(sgENEstimateItem.Objects[0, sgENEstimateItem.Row]) = ENESTIMATEITEMTYPE_MANUAL_BY_PLAN);

  actMaterialBinding.Visible := actMaterialBinding.Enabled;

  // тож самое и с развязкой с ФИННН
  actMaterialBindingToFIN.Enabled := (DialogState = dsEdit) and
                                     ((pcPlanWork.ActivePage = tsEstimateItems) or (pcPlanWork.ActivePage = tsGSM))and
                                     ( (ENPlanWorkObj.kind.code = ENPLANWORKKIND_NPZ) or  (ENPlanWorkObj.kind.code = ENPLANWORKKIND_FACT))
                                     // and статус бы еще пробить ....
                                     ;
  // !!! пока спрачем РАЗНОСКУ с ФинКол...
  //actMaterialBindingToFIN.Enabled := false;
  actMaterialBindingToFIN.Visible := actMaterialBindingToFIN.Enabled;

  // добавление в заявку ..

  actAddToRQOrder.Enabled := ( (pcPlanWork.ActivePage = tsEstimateItems)
                               and  (ENPlanWorkObj.kind.code = ENPLANWORKKIND_CURRENT)
                               and (
                                     (Integer(sgENEstimateItem.Objects[1, sgENEstimateItem.Row]) = ENESTIMATEITEMSTATUS_PLANNED)
                                     or (Integer(sgENEstimateItem.Objects[1, sgENEstimateItem.Row]) = ENESTIMATEITEMSTATUS_TMP_)
                                    )
                              );
  actAddToRQOrder.Visible := actAddToRQOrder.Enabled;
  // и удаление из нее ...
  actRemoveFromRQOrder.Enabled :=  ( (pcPlanWork.ActivePage = tsEstimateItems)
                               and  (ENPlanWorkObj.kind.code = ENPLANWORKKIND_CURRENT)
                               and  (Integer(sgENEstimateItem.Objects[1, sgENEstimateItem.Row]) = ENESTIMATEITEMSTATUS_ORDERED)
                              );
  actRemoveFromRQOrder.Visible := actRemoveFromRQOrder.Enabled;

  if pcPlanWork.ActivePage = tsEstimateItems then
  begin
    actChangeEstimateItemStatus.Enabled := (ENPlanWorkObj.kind.code = ENPLANWORKKIND_CURRENT) ;
    // может для тех что в наличии
    actMoveTO.Enabled := (ENPlanWorkObj.kind.code = ENPLANWORKKIND_CURRENT);
    actMoveFROM.Enabled := (ENPlanWorkObj.kind.code = ENPLANWORKKIND_CURRENT);
  end
  else
  begin
           actChangeEstimateItemStatus.Enabled := false;
           actMoveTO.Enabled := false;
           actMoveFROM.Enabled := false;
  end;
  actChangeEstimateItemStatus.Visible := actChangeEstimateItemStatus.Enabled;
  actMoveTO.Visible := actMoveTO.Enabled;
  actMoveFROM.Visible := actMoveFrom.Enabled;

end;

procedure TfrmENAVRPlanEdit.spbENPlanWorkStateClick(Sender: TObject);
var
   frmENPlanWorkStateShow: TfrmENPlanWorkStateShow;
   f : ENPlanWorkStateFilter;
   e : ENElement;
begin
   f:= ENPlanWorkStateFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.orderBySQL := 'ordered';
   f.conditionSQL := 'enplanworkstate.code in (select enplantype2planstate.staterefcode from enplantype2planstate where enplantype2planstate.typerefcode = '+ IntToStr(ENPlanWorkObj.typeRef.code) +')';

   // AS .. нфиг логику без ЭЛЕМЕНТА !!!
   if ENPlanWorkObj.elementRef <> nil then
     if  ENPlanWorkObj.elementRef.code <> LOW_INT then
     begin
       e := DMReports.getElementByCode(ENPlanWorkObj.elementRef.code);
       if (e.typeRef.code <> EN_SUBSTATION150) and
          (e.typeRef.code <> EN_BUILDER) and
          (e.typeRef.code <> EN_METROLOGY_COUNTER) and
          (e.typeRef.code <> EN_METROLOGY_DEVICE) and
          (e.typeRef.code <> EN_METROLOGY_OBJECT) and
          (e.typeRef.code <> EN_BYT) and
          (e.typeRef.code <> EN_TRANSPORT) and
          (e.typeRef.code <> EN_SIT) and
          (e.typeRef.code <> EN_PURCHASES_OBJECT) and
          (e.typeRef.code <> EN_PURCHASES_NO_OBJECT) then
         f.conditionSQL := f.conditionSQL + ' and enplanworkstate.code <> ' + IntToStr(ENPLANWORKSTATE_CURRENTREPAIR);
   end;

   frmENPlanWorkStateShow:=TfrmENPlanWorkStateShow.Create(Application,fmNormal,f);
   try
      with frmENPlanWorkStateShow do begin
        DisableActions([ actEdit, actInsert, actDelete, actNoFilter, actFilter ]);
        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkObj.stateRef = nil then ENPlanWorkObj.stateRef := ENPlanWorkStateRef.Create();
               ENPlanWorkObj.stateRef.code := StrToInt(GetReturnValue(sgENPlanWorkState,0));//ENDepartmentShort(tvDep.Selected.Data).code;
               edtWorkState.Text:= GetReturnValue(sgENPlanWorkState,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENPlanWorkStateShow.Free;
   end;
end;

procedure TfrmENAVRPlanEdit.spbENActClick(Sender: TObject);
var
  TempENAct: ENActControllerSoapPort;
  i: Integer;
  ENActList: ENActShortList;
  f : ENActFilter;
  frmENActShow : TfrmENActShow;
  TempENAct2ENPlanWork: ENAct2ENPlanWorkControllerSoapPort;

  //ENAct2ENPlanWorkObj : ENAct2ENPlanWork;
  a2 : ENAct2ENPlanWork;

  act2planFilter : ENAct2ENPlanWorkFilter;
  //frmENActShow : TfrmENActShow;
  //TempENAct2ENPlanWork: ENAct2ENPlanWorkControllerSoapPort;
  a2List: ENAct2ENPlanWorkShortList;
  plansType, {ElementTypeCode, }ElementInCode : Integer;
  element: ENElement;

  TempENMetrologyCounter: ENMetrologyCounterControllerSoapPort;
  counterFilter: ENMetrologyCounterFilter;
  counterList: ENMetrologyCounterShortList;
  molData : FINMolData;
  workOrder : ENWorkOrder;
begin

  f := ENActFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.element := ENElement.Create;
  f.element.code := ENPlanWorkObj.elementRef.code;

  //////////////////////////////////////////////////////////////////////////////
  // Смотрим на тип элемента. Если это СЧЕТЧИК МЕТРОЛОГИИ,
  // то акт ищем по его ТИПУ (абстрактному объекту)
  //ElementTypeCode := LOW_INT;
  element := DMReports.getElementByCode(ENPlanWorkObj.elementRef.code);
  if element <> nil then
    if element.typeRef <> nil then
    begin
      //ElementTypeCode := element.typeRef.code;

      if element.typeRef.code = EN_METROLOGY_COUNTER then
      begin
        ElementInCode := LOW_INT;
        if element.elementInRef <> nil then
          ElementInCode := element.elementInRef.code;

        if ElementInCode = LOW_INT then
        begin
          Application.MessageBox(PChar('Необхідно вказати тип лічильника "' + edtENElementName.Text + '" !'),
                                 PChar('Увага!'), MB_ICONWARNING);

          /////// ******* ///////
          // В случае, если тип счетчика не указан (т.е. у него нет ElementIn'а),
          // сразу открываем форму редактирования счетчика (на который мы заводим факт)
          // и даем пользователю выбрать тип этого счетчика
          TempENMetrologyCounter := HTTPRIOENMetrologyCounter as ENMetrologyCounterControllerSoapPort;

          counterFilter := ENMetrologyCounterFilter.Create;
          SetNullIntProps(counterFilter);
          SetNullXSProps(counterFilter);

          counterFilter.element := ENElement.Create;
          counterFilter.element.code := element.code;

          counterList := TempENMetrologyCounter.getScrollableFilteredList(counterFilter, 0, -1);
          if counterList <> nil then
            if High(counterList.list) > -1 then
              if counterList.list[0] <> nil then
              begin
                ENMetrologyCounterObj := TempENMetrologyCounter.getObject(counterList.list[0].code);

                if ENMetrologyCounterObj <> nil then
                  if ENMetrologyCounterObj.code > LOW_INT then
                  begin
                    frmENMetrologyCounterEdit := TfrmENMetrologyCounterEdit.Create(Application, dsEdit);
                    try
                      if frmENMetrologyCounterEdit.ShowModal = mrOk then
                      begin
                        //UpdateGrid(Sender);
                        Application.MessageBox(PChar('Тип лічильника збережений! Спробуйте ще раз додати та вибрати акт!'),
                                               PChar('Увага!'), MB_ICONINFORMATION);
                      end;
                    finally
                      frmENMetrologyCounterEdit.Free;
                      frmENMetrologyCounterEdit := nil;
                    end;
                  end; // if ENMetrologyCounterObj.code > LOW_INT
              end; // if counterList.list[0] <> nil
          /////// ******* ///////
          
          Exit;
        end;

        f.element.code := ElementInCode;
      end;
    end;
  //////////////////////////////////////////////////////////////////////////////

  f.statusRef := ENActStatusRef.Create;
  f.statusRef.code := ENACT_GOOD;

  // акты толко с МОЛами - мастерами ...
  workOrder := DMReports.getWorkOrderByPlanCode(ENPlanWorkObj.code);
  molData := DMReports.getMOLData(workOrder.code, FINMOLTYPE_MASTER);
  if molData = nil then
  begin
     Application.MessageBox(PChar('Необхідно додати МОЛа-Майстра ...!'),
             PChar('Увага!'), MB_ICONWARNING);
     pcPlanWork.ActivePage := tsWorkOrder;        
     exit;
  end;

  // ограничим по ДАТЕ !!! выполнения и АКТА !!!

  f.conditionSQL:= '((enact.finmolcode is null) or (enact.finmolcode in (' +
                    ' select finmoldata.finmolcode from ' +
                    '   FINMOLDATA, ' +
                    '   enworkorder2enplanwork ' +
                    '   where  ' +
                    '    enworkorder2enplanwork.workordercode = FINMOLDATA.workordercode ' +
                    '   and enworkorder2enplanwork.plancode = ' + IntToStr(ENPlanWorkObj.code) +
                    '   and finmoldata.moltyperefcode = '+ IntToStr(FINMOLTYPE_MASTER) +' )))' +
                    ' and enact.dategen >= (select enworkorder.dategen from enworkorder, enworkorder2enplanwork where enworkorder2enplanwork.workordercode = enworkorder.code and enworkorder2enplanwork.plancode='+ IntToStr(ENPlanWorkObj.code) +')';

  // УЖЕ НЕ тАК !!!!!!!!!!!!!!! класификация измениться ... стэйт меняЕться у плана в момент развязки с АКТОМ !!!
  // или так ;) ..
  f.actTypeRef := ENPlanWorkStateRef.Create;
  f.actTypeRef.code := ENPlanWorkObj.stateRef.code;

   frmENActShow:=TfrmENActShow.Create(Application,fmNormal, f);
   try

      frmENActShow.planCode := ENPlanWorkObj.code;
      frmENActShow.isFiltered := true;

      if ENPlanWorkObj.stateRef <> nil then
      begin
        frmENActShow.planStateCode := ENPlanWorkObj.stateRef.code;
        frmENActShow.planStateName := edtWorkState.Text;
      end;

      with frmENActShow do begin
        DisableActions([ actEdit, actDelete , actFilter, actNoFilter]);
        if ShowModal = mrOk then
        begin

  TempENAct2ENPlanWork := HTTPRIOENAct2ENPlanWork as ENAct2ENPlanWorkControllerSoapPort;

  if (actCode = LOW_INT) then
  begin
      a2:=ENAct2ENPlanWork.Create;
      a2.actRef := ENActRef.Create;
      a2.plan := ENPlanWork.Create;

      a2.code := LOW_INT;
      a2.plan.code := ENPlanWorkObj.code;
  end
  else
  begin
     act2planFilter := ENAct2ENPlanWorkFilter.Create();
     SetNullIntProps(act2planFilter);
     SetNullXSProps(act2planFilter);
     act2planFilter.actRef := ENActRef.Create;
     act2planFilter.actRef.code := actCode;
     act2planFilter.plan := ENPlanWork.Create;
     act2planFilter.plan.code := ENPlanWorkObj.code;
     a2List := TempENAct2ENPlanWork.getScrollableFilteredList(act2planFilter, 0, -1);
     if (a2List.totalCount = 1) then
     begin
       a2 :=  TempENAct2ENPlanWork.getObject( a2List.list[0].code );
     end
     else
     begin
       // ERRRoor !!!
       Application.MessageBox(PChar('Ошибка с кол-вом актов на ПЛАНЕ !!!'), PChar('Помилка !!'), MB_ICONERROR);
       exit;
     end;
  end;

            try
              a2.actRef.code := StrToInt(GetReturnValue(sgENAct,0)); // ГРИД !!!
              edtENActNumber.Text := GetReturnValue(sgENAct,1) + ' ' + GetReturnValue(sgENAct,3);
            except
               on EConvertError do  /// МАТЮКАТЬ ... и гнать развызывать руками !!!!
               begin
                   Application.MessageBox(PChar('Не вдалося отримати код акту!!! Оберіть акт знову ...'),
                          PChar('Помилка'),MB_ICONWARNING);
                   edtENActNumber.Text := 'НЕ ВЫБРАНО !!!';
                   Exit;
               end;
            end;

            // проверим типы-виды планов которые ВОЗМОЖНО висят на этом акте
            plansType := DMReports.getPlanTypeByActCode( StrToInt(GetReturnValue(sgENAct,0)) );   // ГРИД
            if  (plansType  > -1) and (plansType <> ENPlanWorkObj.typeRef.code )  then
            begin
                   Application.MessageBox(PChar('Не совпадают  ВИДЫ работ ...'),
                          PChar('Помилка'),MB_ICONWARNING);
                   edtENActNumber.Text := 'НЕ ВЫБРАНО !!!';
                   Exit;
            end;

            try

              if (a2.code = LOW_INT) then
               a2.code := TempENAct2ENPlanWork.add(a2, 1)
              else
              begin
               //TempENAct2ENPlanWork.save(a2);
               ShowMessage('Tak delat nelZy');
              end;

              actCode := a2.actRef.code; //ENAct2ENPlanWorkObj.code;

            except
               // гнать развязывать руками !!!!
                   Application.MessageBox(PChar('Не вдалося зв"язати акт з планом!!! Оберіть акт знову ...'),
                          PChar('Помилка'),MB_ICONWARNING);
                  edtENActNumber.Text := 'НЕ ВЫБРАНО !!!';
                  raise;
                  Exit;
           end;
        end;
      end;
   finally
      frmENActShow.Free;
   end;

end;

procedure TfrmENAVRPlanEdit.sgENEstimateItemClick(Sender: TObject);
var
  j : Integer;
begin
     // выведем список ФИН материалов .... если они есть ВААЩЕ ...
    try
      j := StrToInt( TAdvStringGrid(Sender).Cells[0, TAdvStringGrid(Sender).Row ]); //   (sgENEstimateItem,0));
    except
      on EConvertError do Exit;
    end;

  if Sender = sgENEstimateItem then
  begin
    updateFINMaterialsGrid(j, sgFINMaterials);
    updateMarksGrid(j, sgMarkers);
  end
  else
  if Sender = sgGSM then
  begin
    updateFINMaterialsGrid(j, sgFINGSM);
    updateMarksGrid(j, sgMarkers);
  end;


end;

procedure TfrmENAVRPlanEdit.actMaterialBindingToFINExecute(
  Sender: TObject);
var
//   frmFINMaterialsDataEdit : TfrmFINMaterialsDataEdit;
   temp , molTypeCode : Integer;
   temp2 : real;
begin
  workOrder := DMReports.getWorkOrderByPlanCode(ENPlanWorkObj.code);

  if workOrder.code = LOW_INT then
  begin
    Application.MessageBox(PChar('Введите НАРЯД ! Ничего НЕ сохранится !!!'), PChar('Внимание!'), MB_ICONWARNING);
    pcPlanWork.ActivePage := tsWorkOrder;
    pcPlanWorkChange(Sender);
    Exit;
  end;


      if pcPlanWork.ActivePage = tsEstimateItems then
        molTypeCode := 1; //   (sgENEstimateItem,0));

      if pcPlanWork.ActivePage = tsGSM then
        molTypeCode := 2;  //   (sgENEstimateItem,0));

  molData := DMReports.getMOLData(workOrder.code, molTypeCode);
  if (molData = nil) then
  begin
    Application.MessageBox(PChar('Введите МОЛов !!! Ничего НЕ сохранится !!!'), PChar('Внимание!'), MB_ICONWARNING);
    pcPlanWork.ActivePage := tsWorkOrder;
    pcPlanWorkChange(Sender);
    Exit;
  end;

    
    temp2 := 0;
    try
      if pcPlanWork.ActivePage = tsEstimateItems then
        temp2 := StrToFloat( sgENEstimateItem.Cells[3, sgENEstimateItem.Row ]); //   (sgENEstimateItem,0));

      if pcPlanWork.ActivePage = tsGSM then
        temp2 := StrToFloat( sgGSM.Cells[3, sgGSM.Row ]); //   (sgENEstimateItem,0));

    except
      on EConvertError do Exit;
    end;


  if temp2 < 0.00000001 then
  begin
    Application.MessageBox(PChar('Кол-во материалов = 0 :) ... Откорректируйте кол-во материалов в работе'), PChar('Внимание!'), MB_ICONWARNING);
    Exit;
  end;

   frmFINMaterialsDataEdit:= TfrmFINMaterialsDataEdit.Create(Application,dsInsert);
   try
      frmFINMaterialsDataEdit.planCode := ENPlanWorkObj.code; // ENEstimateItemObj.planRef.code;

     // выведем список ФИН материалов .... если они есть ВААЩЕ ...
    try
      if pcPlanWork.ActivePage = tsEstimateItems then
      begin
        temp := StrToInt( sgENEstimateItem.Cells[0, sgENEstimateItem.Row ]); //   (sgENEstimateItem,0));
        frmFINMaterialsDataEdit.estimateItemKind := ENESTIMATEITEMKIND_MATERIALS;
      end;
      if pcPlanWork.ActivePage = tsGSM then
      begin
        temp := StrToInt( sgGSM.Cells[0, sgGSM.Row ]);
        frmFINMaterialsDataEdit.estimateItemKind := ENESTIMATEITEMKIND_GSM;
      end;
    except
      on EConvertError do Exit;
    end;

      frmFINMaterialsDataEdit.estimateCode := temp;

      with frmFINMaterialsDataEdit do
      begin
        ShowModal ;
          self.UpdateGrid(sender);
        end;
   finally
      frmFINMaterialsDataEdit.Free;
   end;

end;


procedure TfrmENAVRPlanEdit.cbPlanWorkKindChange(Sender: TObject);
var ENMOL2PlanWorkObj: ENMOL2PlanWork;
    TempENMOL2PlanWork: ENMOL2PlanWorkControllerSoapPort;
begin
  KindCode := cbPlanWorkKind.ItemIndex + 1;
  tsWorkOrder.TabVisible := (KindCode in [ENPLANWORKKIND_NPZ, ENPLANWORKKIND_FACT]) and (DialogState <> dsInsert);

end;

procedure TfrmENAVRPlanEdit.spbFINExecutorClick(Sender: TObject);
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
              ENPlanWorkObj.finExecutor :=
                DMReports.finExecutorShort2finExecutor(FINExecutorShort(tvDep.Selected.Data),
                                                       DMReports.getFullExecutorName(tvDep.Selected));
              edtFINExecutorName.Text := ENPlanWorkObj.finExecutor.name;
            except
              on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINExecutorTreeShow.Free;
   end;
end;


function TfrmENAVRPlanEdit.checkMaterialsBinding_(
  estimateItemCode: Integer): Boolean;
var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  finList: FINMaterialsShortList;
  finFilter: FINMaterialsFilter;
begin
  Result := false;

  finFilter := FINMaterialsFilter.Create;
  SetNullIntProps(finFilter);
  SetNullXSProps(finFilter);

  finFilter.estimateItemRef := ENEstimateItemRef.Create;
  finFilter.estimateItemRef.code := estimateItemCode;

  finFilter.statusRef := FINMaterialsStatusRef.Create;
  finFilter.statusRef.code := FINMATERIALSSTATUS_GOOD;

  TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

  finList := TempFINMaterials.getScrollableFilteredList(finFilter, 0, -1);

  if High(finList.list) > -1 then
    Result := true
  else
    Result := false;
end;

procedure TfrmENAVRPlanEdit.Shape1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var i: Integer;
begin
  Exit; // спрячем пока эту фишку с цветом

  ColorDialog1.Color := Shape1.Brush.Color;

  if ColorDialog1.Execute then
  begin
    Shape1.Brush.Color := ColorDialog1.Color;

    for i := 1 to sgENEstimateItem.RowCount - 1 do
      if Integer(sgENEstimateItem.Objects[1, i]) = 1 then
        sgENEstimateItem.RowColor[i] := ColorDialog1.Color
      else
        sgENEstimateItem.RowColor[i] := clWindow;
  end;
end;

procedure TfrmENAVRPlanEdit.btnWorkOrderDetailsClick(Sender: TObject);
var
  TempENWorkOrder2ENPlanWork: ENWorkOrder2ENPlanWorkControllerSoapPort;
  i: Integer;
  ENWorkOrder2ENPlanWorkList: ENWorkOrder2ENPlanWorkShortList;
  ENWorkOrder2ENPlanWorkFilterObj : ENWorkOrder2ENPlanWorkFilter;

  frmENWorkOrderEdit : TfrmENWorkOrderEdit;
  TempENWorkOrder : ENWorkOrderControllerSoapPort;

begin

  ENWorkOrder2ENPlanWorkFilterObj := ENWorkOrder2ENPlanWorkFilter.Create;
  SetNullIntProps(ENWorkOrder2ENPlanWorkFilterObj);
  SetNullXSProps(ENWorkOrder2ENPlanWorkFilterObj);

  ENWorkOrder2ENPlanWorkFilterObj.plan := ENPlanWork.Create;
  ENWorkOrder2ENPlanWorkFilterObj.plan.code := ENPlanWorkObj.code;

  TempENWorkOrder2ENPlanWork :=  HTTPRIOENWorkOrder2ENPlanWork as ENWorkOrder2ENPlanWorkControllerSoapPort;

  ENWorkOrder2ENPlanWorkList := TempENWorkOrder2ENPlanWork.getScrollableFilteredList(ENWorkOrder2ENPlanWorkFilterObj, 0, -1);

   TempENWorkOrder := HTTPRIOENWorkOrder as ENWorkOrderControllerSoapPort;

  if ENWorkOrder2ENPlanWorkList.totalCount > 0 then
  begin
     try
       ENWorkOrderObj := TempENWorkOrder.getObject(ENWorkOrder2ENPlanWorkList.list[0].workOrderCode );
     except
     on EConvertError do Exit;
     end;
  end
  else
  begin
      ENWorkOrderObj := ENWorkOrder.Create;
      SetNullIntProps(ENWorkOrderObj);
      SetNullXSProps(ENWorkOrderObj);
      ENWorkOrderObj.department := ENDepartment.Create;
      ENWorkOrderObj.department.code := ENPlanWorkObj.departmentRef.code;
  end;

  frmENWorkOrderEdit:=TfrmENWorkOrderEdit.Create(Application, dsView);
  try
    frmENWorkOrderEdit.ShowModal;
  finally
    frmENWorkOrderEdit.Free;
    frmENWorkOrderEdit:=nil;
  end;

  
end;

procedure TfrmENAVRPlanEdit.actWorkOrderInsertExecute(Sender: TObject);
var
   TempENWorkOrder: ENWorkOrderControllerSoapPort;
   frmENWorkOrderEdit : TfrmENWorkOrderEdit;
   TempENWorkOrder2ENPlanWork : ENWorkOrder2ENPlanWorkControllerSoapPort;
begin
  //inherited;
  WorkOrderEditState := dsInsert;

  ClearWorkOrderFields;

  ENWorkOrder2ENPlanWorkObj := ENWorkOrder2ENPlanWork.Create;
  ENWorkOrder2ENPlanWorkObj.code := LOW_INT;
  ENWorkOrder2ENPlanWorkObj.plan := ENPlanWork.Create;
  ENWorkOrder2ENPlanWorkObj.plan.code := ENPlanWorkObj.code;

  ENWorkOrder2ENPlanWorkObj.workOrder := ENWorkOrder.Create;
  ENWorkOrder2ENPlanWorkObj.workOrder.code := LOW_INT;

  ENWorkOrder2ENPlanWorkObj.workOrder.department := ENDepartment.Create;
  ENWorkOrder2ENPlanWorkObj.workOrder.department.code := ENPlanWorkObj.departmentRef.code;

  InitWorkOrderFields;

  btnWorkOrderSaveClick(Sender);

  actMOLDataInsertExecute(Sender);

end;

procedure TfrmENAVRPlanEdit.actWorkOrderEditExecute(Sender: TObject);
var
   TempENWorkOrder: ENWorkOrderControllerSoapPort;
   frmENWorkOrderEdit : TfrmENWorkOrderEdit;
   TempENWorkOrder2ENPlanWork : ENWorkOrder2ENPlanWorkControllerSoapPort;

   ENWorkOrder2ENPlanWorkFilterObj : ENWorkOrder2ENPlanWorkFilter;
   ENWorkOrder2ENPlanWorkList : ENWorkOrder2ENPlanWorkShortList;
begin
  //inherited;
  WorkOrderEditState := dsEdit;

  ENWorkOrder2ENPlanWorkFilterObj := ENWorkOrder2ENPlanWorkFilter.Create;
  SetNullIntProps(ENWorkOrder2ENPlanWorkFilterObj);
  SetNullXSProps(ENWorkOrder2ENPlanWorkFilterObj);

  ENWorkOrder2ENPlanWorkFilterObj.plan := ENPlanWork.Create;
  ENWorkOrder2ENPlanWorkFilterObj.plan.code := ENPlanWorkObj.code;

  TempENWorkOrder2ENPlanWork :=  HTTPRIOENWorkOrder2ENPlanWork as ENWorkOrder2ENPlanWorkControllerSoapPort;

  ENWorkOrder2ENPlanWorkList := TempENWorkOrder2ENPlanWork.getScrollableFilteredList(ENWorkOrder2ENPlanWorkFilterObj, 0, -1);

  if ENWorkOrder2ENPlanWorkList.totalCount = 0 then
  begin
      actWorkOrderInsertExecute(Sender);
      exit;
  end;

  ENWorkOrder2ENPlanWorkObj :=  TempENWorkOrder2ENPlanWork.getObject(ENWorkOrder2ENPlanWorkList.list[0].code);
  InitWorkOrderFields;
end;

procedure TfrmENAVRPlanEdit.LoadMOLData(workOrderCode : Integer);
var
  i,j : Integer;
  f : FINMOLDataFilter;
  TempFINMolData: FINMolDataControllerSoapPort;
  FINMolDataList: FINMolDataShortList;
begin
   for i := 1 to  sgFINMolData.RowCount - 1 do
     for j := 0 to sgFINMOLData.ColCount - 1 do
       sgFINMolData.Cells[j,i] := '';
   sgFINMolData.RowCount := 2;

   if workOrderCode <= 0 then Exit;

   f := FINMOLDataFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.workOrder := ENWorkOrder.Create;
   f.workOrder.code :=  workOrderCode;
   f.orderBySQL := 'finmoldata.moltyperefcode';

   TempFINMolData :=  HTTPRIOFINMolData as FINMolDataControllerSoapPort;
   FINMolDataList :=  TempFINMolData.getScrollableFilteredList(f, 0, -1);

  if High(FINMolDataList.list) > -1 then
     sgFINMolData.RowCount:=High(FINMolDataList.list)+2
  else
     sgFINMolData.RowCount:=2;

   with sgFINMolData do
    for i:=0 to High(FINMolDataList.list) do
      begin
        Application.ProcessMessages;
        if FINMolDataList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(FINMolDataList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := FINMolDataList.list[i].finMolCode;
        Cells[2,i+1] := FINMolDataList.list[i].finMolName;
        Cells[3,i+1] := FINMolDataList.list[i].molTypeRefName;

        sgFINMolData.RowCount:=High(FINMolDataList.list)+2;
      end;
   sgFINMolData.Row:=1;

end;


procedure TfrmENAVRPlanEdit.LoadWorkOrder;
var
  TempENWorkOrder2ENPlanWork: ENWorkOrder2ENPlanWorkControllerSoapPort;

  ENWorkOrder2ENPlanWorkList: ENWorkOrder2ENPlanWorkShortList;
  ENWorkOrder2ENPlanWorkFilterObj: ENWorkOrder2ENPlanWorkFilter;

  frmENWorkOrderEdit: TfrmENWorkOrderEdit;
  TempENWorkOrder: ENWorkOrderControllerSoapPort;
begin

      ClearWorkOrderFields;

      ENWorkOrder2ENPlanWorkFilterObj := ENWorkOrder2ENPlanWorkFilter.Create;
      SetNullIntProps(ENWorkOrder2ENPlanWorkFilterObj);
      SetNullXSProps(ENWorkOrder2ENPlanWorkFilterObj);

      ENWorkOrder2ENPlanWorkFilterObj.plan := ENPlanWork.Create;
      ENWorkOrder2ENPlanWorkFilterObj.plan.code := ENPlanWorkObj.code;

      TempENWorkOrder2ENPlanWork :=  HTTPRIOENWorkOrder2ENPlanWork as ENWorkOrder2ENPlanWorkControllerSoapPort;

      ENWorkOrder2ENPlanWorkList := TempENWorkOrder2ENPlanWork.getScrollableFilteredList(ENWorkOrder2ENPlanWorkFilterObj, 0, -1);

      TempENWorkOrder := HTTPRIOENWorkOrder as ENWorkOrderControllerSoapPort;

      if ENWorkOrder2ENPlanWorkList.totalCount > 0 then
      begin // Если есть наряд
        DisableActions([actWorkOrderInsert]);
        DisableActions([actWorkOrderView, actWorkOrderEdit, actWorkOrderDelete], (DialogState = dsView));

        //DisableControls([gbMOLData], (DialogState = dsView));
        DisableActions([actMOLDataInsert, actMOLDataEdit, actMOLDataDelete], (DialogState = dsView));

        edtWorkOrderNumber.Text := ENWorkOrder2ENPlanWorkList.list[0].workOrderWorkOrderNumber;
        if ENWorkOrder2ENPlanWorkList.list[0].workOrderDateGen <> nil then
          edtDateWorkOrder.DateTime := EncodeDate(ENWorkOrder2ENPlanWorkList.list[0].workOrderDateGen.Year,
                                                  ENWorkOrder2ENPlanWorkList.list[0].workOrderDateGen.Month,
                                                  ENWorkOrder2ENPlanWorkList.list[0].workOrderDateGen.Day);

        ENWorkOrderObj := TempENWorkOrder.getObject(ENWorkOrder2ENPlanWorkList.list[0].workOrderCode);
        if ENWorkOrderObj <> nil then
          if ENWorkOrderObj.code > LOW_INT then
          begin
            edtFinMolCode.Text := ENWorkOrderObj.finMolCode;
            edtFinMechanicCode.Text := ENWorkOrderObj.finMechanicCode;
            MakeMultiline(edtWorkOrderCommentGen.Lines, ENWorkOrderObj.commentGen);
            edtWorkOrderCode.Text := IntToStr(ENWorkOrderObj.code);
            // MOLDATA2
            DisableControls([edtWorkOrderCode]);
            LoadMOLData(ENWorkOrderObj.code);
          end;


        edtFinMolName.Text := ENWorkOrder2ENPlanWorkList.list[0].workOrderFinMolName;
        edtFinMechanicName.Text := ENWorkOrder2ENPlanWorkList.list[0].workOrderFinMechanicName;

      end
      else
      begin // Если наряда еще нет
        // оставляем только добавление
        if DialogState <> dsView then
          DisableActions([actWorkOrderInsert], false);
        DisableActions([actWorkOrderView, actWorkOrderEdit, actWorkOrderDelete]);

        /// Дату наряда-задания берем из даты начала выполнения работ по НПЗ
        edtDateWorkOrder.Date := edtDateStart.Date;
        edtDateWorkOrder.Checked := true;
        DisableControls([edtDateWorkOrder]);

        LoadMOLData(LOW_INT);
      end;
end;

procedure TfrmENAVRPlanEdit.actWorkOrderUpdateExecute(Sender: TObject);
begin
  LoadWorkOrder;
end;

procedure TfrmENAVRPlanEdit.spbFINMolClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

   TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;

  molSel : boolean;
begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // типа только работающие ...

   if ENWorkOrder2ENPlanWorkObj.workOrder.department <> nil then
     if ENWorkOrder2ENPlanWorkObj.workOrder.department.code <> LOW_INT then
     begin
        TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
        renFilter := ENDepartment2EPRenFilter.Create;
        SetNullXSProps(renFilter);
        SetNullIntProps(renFilter);
        renFilter.departmentRef := ENDepartmentRef.Create;
        renFilter.departmentRef.code :=  ENWorkOrder2ENPlanWorkObj.workOrder.department.code;

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
               edtFinMolCode.Text := GetReturnValue(sgFINMol,0);
               edtFINMolName.Text := GetReturnValue(sgFINMol,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
               ENWorkOrder2ENPlanWorkObj.workOrder.finMolCode := GetReturnValue(sgFINMol,0);
               ENWorkOrder2ENPlanWorkObj.workOrder.finMolName := GetReturnValue(sgFINMol,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;

end;

procedure TfrmENAVRPlanEdit.InitWorkOrderFields;
begin
  DisableControls([edtWorkOrderCode]);
  
  if (WorkOrderEditState = dsInsert) or (WorkOrderEditState = dsEdit) then
  begin
    DisableControls([edtFinMolCode, edtFinMolName, edtFinMechanicCode, edtFinMechanicName, edtWorkOrderNumber]);
    HideControls([btnWorkOrderSave, btnWorkOrderCancel], false);
    DisableControls([spbFINMol, spbFINMechanic], false);
    DisableControls([edtWorkOrderCommentGen], false);

    DenyBlankValues([
      edtDateGen,
      edtFinMolName,
      edtFinMechanicName
     ]);    
  end
  else begin

    DisableControls([edtWorkOrderNumber, edtDateWorkOrder, edtWorkOrderCommentGen,
                     edtFinMolCode, edtFinMolName, edtFinMechanicCode, edtFinMechanicName]);
    
    HideControls([btnWorkOrderSave, btnWorkOrderCancel]);
    DisableControls([spbFINMol, spbFINMechanic]);
  end;
end;

procedure TfrmENAVRPlanEdit.btnWorkOrderSaveClick(Sender: TObject);
var
   TempENWorkOrder: ENWorkOrderControllerSoapPort;
   TempENWorkOrder2ENPlanWork : ENWorkOrder2ENPlanWorkControllerSoapPort;
begin
  if not NoBlankValues([
      edtDateWorkOrder
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Exit;
  end
  else
  begin

     if edtDateWorkOrder.Checked then
     begin 
       if ENWorkOrder2ENPlanWorkObj.workOrder.dateGen = nil then
          ENWorkOrder2ENPlanWorkObj.workOrder.dateGen := TXSDate.Create;
       ENWorkOrder2ENPlanWorkObj.workOrder.dateGen.XSToNative(GetXSDate(edtDateWorkOrder.DateTime));
     end
     else
       ENWorkOrder2ENPlanWorkObj.workOrder.dateGen := nil;

     ENWorkOrder2ENPlanWorkObj.workOrder.commentGen := edtWorkOrderCommentGen.Text;
     ENWorkOrder2ENPlanWorkObj.workOrder.finMolCode := edtFinMolCode.Text;
     ENWorkOrder2ENPlanWorkObj.workOrder.finMolName := edtFinMolName.Text;

    TempENWorkOrder2ENPlanWork := HTTPRIOENWorkOrder2ENPlanWork as ENWorkOrder2ENPlanWorkControllerSoapPort;

    if WorkOrderEditState = dsInsert then
    begin
      //TempENWorkOrder2ENPlanWork.add(ENWorkOrder2ENPlanWorkObj);
      TempENWorkOrder2ENPlanWork.addWithCheck(ENWorkOrder2ENPlanWorkObj,false); {SUPP-104240}
    end
    else
    if WorkOrderEditState = dsEdit then
    begin
      TempENWorkOrder2ENPlanWork.save(ENWorkOrder2ENPlanWorkObj);
    end;

    Application.MessageBox(PChar('Наряд-завдання збережено!'), PChar('Інформація'), MB_ICONINFORMATION);

    LoadWorkOrder;
    WorkOrderEditState := dsView;
    InitWorkOrderFields;
  end;
end;

procedure TfrmENAVRPlanEdit.btnWorkOrderCancelClick(Sender: TObject);
begin
  ClearWorkOrderFields;
  LoadWorkOrder;
  WorkOrderEditState := dsView;
  InitWorkOrderFields;
end;

procedure TfrmENAVRPlanEdit.ClearWorkOrderFields;
begin
  ClearControlChildren(gbWorkOrder);
end;

procedure TfrmENAVRPlanEdit.spbFINMechanicClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

   TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;
  //plan : ENPlanWork;


  molSel : boolean;
begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // типа только работающие ...


   if ENWorkOrder2ENPlanWorkObj.workOrder.department <> nil then
     if ENWorkOrder2ENPlanWorkObj.workOrder.department.code <> LOW_INT then
     begin
        TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
        renFilter := ENDepartment2EPRenFilter.Create;
        SetNullXSProps(renFilter);
        SetNullIntProps(renFilter);
        renFilter.departmentRef := ENDepartmentRef.Create;
        renFilter.departmentRef.code :=  ENWorkOrder2ENPlanWorkObj.workOrder.department.code;

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
               edtFinMechanicCode.Text:= GetReturnValue(sgFINMol,0);
               edtFinMechanicName.Text:= GetReturnValue(sgFINMol,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
               ENWorkOrder2ENPlanWorkObj.workOrder.finMechanicCode := GetReturnValue(sgFINMol,0);
               ENWorkOrder2ENPlanWorkObj.workOrder.finMechanicName := GetReturnValue(sgFINMol,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;


end;

procedure TfrmENAVRPlanEdit.pcPlanWorkChanging(Sender: TObject;
  var AllowChange: Boolean);
var answer: Integer;
begin
  AllowChange := true;
  
  if pcPlanWork.ActivePage = tsWorkOrder then
    if WorkOrderEditState <> dsView then
    begin
      //ShowMessage('КУДА ????????????');
      answer := Application.MessageBox(PChar('Зберегти наряд-завдання?'),
                                       PChar('Увага!'),
                                       MB_ICONQUESTION + MB_YESNOCANCEL + MB_DEFBUTTON3);

      case answer of
        IDYES: btnWorkOrderSaveClick(Sender);
        IDNO:  btnWorkOrderCancelClick(Sender);
        else begin
          AllowChange := false;
          Exit;
        end;
      end;

      AllowChange := (WorkOrderEditState = dsView);
    end;
end;

procedure TfrmENAVRPlanEdit.actWorkOrderDeleteExecute(Sender: TObject);
var
   TempENWorkOrder: ENWorkOrderControllerSoapPort;
   frmENWorkOrderEdit : TfrmENWorkOrderEdit;
   TempENWorkOrder2ENPlanWork : ENWorkOrder2ENPlanWorkControllerSoapPort;

  ENWorkOrder2ENPlanWorkFilterObj : ENWorkOrder2ENPlanWorkFilter;
  ENWorkOrder2ENPlanWorkList : ENWorkOrder2ENPlanWorkShortList ;

  finList: FINMaterialsShortList; //List_;
  finFilter : FINMaterialsFilter;
  TempFINMaterials: FINMaterialsControllerSoapPort;
  answer: Integer;
begin

  ENWorkOrder2ENPlanWorkFilterObj := ENWorkOrder2ENPlanWorkFilter.Create;
  SetNullIntProps(ENWorkOrder2ENPlanWorkFilterObj);
  SetNullXSProps(ENWorkOrder2ENPlanWorkFilterObj);

  ENWorkOrder2ENPlanWorkFilterObj.plan := ENPlanWork.Create;
  ENWorkOrder2ENPlanWorkFilterObj.plan.code := ENPlanWorkObj.code;

  TempENWorkOrder2ENPlanWork :=  HTTPRIOENWorkOrder2ENPlanWork as ENWorkOrder2ENPlanWorkControllerSoapPort;
  ENWorkOrder2ENPlanWorkList := TempENWorkOrder2ENPlanWork.getScrollableFilteredList(ENWorkOrder2ENPlanWorkFilterObj, 0, -1);

  if ENWorkOrder2ENPlanWorkList.totalCount > 0 then
  begin

      answer := Application.MessageBox(PChar('Видалити наряд-завдання?'),
                                       PChar('Увага!'),
                                       MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2);
      if answer = IDYES then
      begin
        // проверим есть ли развязанные матералы ...
        finFilter := FINMaterialsFilter.Create;
        SetNullIntProps(finFilter);
        SetNullXSProps(finFilter);
        finFilter.statusRef := FINMaterialsStatusRef.Create;
        finFilter.statusRef.code := FINMATERIALSSTATUS_GOOD;
        finFilter.conditionSQL := ' finmaterials.estimateitemrefcode in (select enestimateitem.code from enestimateitem where enestimateitem.planrefcode = '+ IntToStr(ENPlanWorkObj.code)+')';

        TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

        finList := TempFINMaterials.getScrollableFilteredList(finFilter,0,-1);
        if finList.totalCount > 0 then
        begin
          answer := Application.MessageBox(PChar('Вже є зарезервовані МАТЕРІАЛИ !!! Видалення призведе до видалення привязки! Все одно видалити НАРЯД?'),
                                           PChar('Увага!'),
                                           MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2);
          if answer = IDYES then
            TempENWorkOrder2ENPlanWork.remove( ENWorkOrder2ENPlanWorkList.list[0].code );
        end
        else
        begin
        // нет развязки .. просто в сад
          TempENWorkOrder2ENPlanWork.remove( ENWorkOrder2ENPlanWorkList.list[0].code );
        end;
      // обновить ....
      LoadWorkOrder;
      end;
  end;

end;

procedure TfrmENAVRPlanEdit.cbShowAllClick(Sender: TObject);
begin
  inherited;

  UpdateGrid(Sender);

end;

procedure TfrmENAVRPlanEdit.spbPlanMOLClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

   TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;

  molSel : boolean;

begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // типа только работающие ...

   if ENPlanWorkObj.departmentRef <> nil then
     if ENPlanWorkObj.departmentRef.code <> LOW_INT then
     begin
        TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
        renFilter := ENDepartment2EPRenFilter.Create;
        SetNullXSProps(renFilter);
        SetNullIntProps(renFilter);
        renFilter.departmentRef := ENDepartmentRef.Create;
        renFilter.departmentRef.code := ENPlanWorkObj.departmentRef.code;  // ENWorkOrder2ENPlanWorkObj.workOrder.department.code;

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
               MasterName := GetReturnValue(sgFINMol,1);
               MasterCode := GetReturnValue(sgFINMol,0);

               edtMolName.Text := MasterCode + ' ' + MasterName;

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;


end;

procedure TfrmENAVRPlanEdit.spbPlanMOLClearClick(Sender: TObject);
begin
  inherited;
if Application.MessageBox(PChar('Видалити МОЛа ?'),
                                       PChar('Увага!'),
                                       MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
begin
               edtMolName.Text := '';
               MasterName := '';
               MasterCode := '';
end
end;

procedure TfrmENAVRPlanEdit.actMOLDataInsertExecute(Sender: TObject);
Var
  TempFINMolData: FINMolDataControllerSoapPort;
begin
  TempFINMolData := HTTPRIOFINMolData as FINMolDataControllerSoapPort;
  FINMolDataObj:=FINMolData.Create;
  FINMolDataObj.workOrder := ENWorkOrder.Create;
  FINMolDataObj.workOrder.code :=  StrToInt(edtWorkOrderCode.Text);

  try
    frmFINMolDataEdit:=TfrmFINMolDataEdit.Create(Application, dsInsert);
    try

      frmFINMolDataEdit.parentCode := StrToInt(edtWorkOrderCode.Text);
      frmFINMolDataEdit.parentTypeCode := 1;
      frmFINMolDataEdit.departmentCode := ENPlanWorkObj.departmentRef.code;

      if frmFINMolDataEdit.ShowModal = mrOk then
      begin
        if FINMolDataObj<>nil then
            //TempFINMolData.add(FINMolDataObj);
            //UpdateGrid(Sender);
            //LoadMOLData( StrToInt(edtWorkOrderCode.Text) );
            LoadWorkOrder();
      end;
    finally
      frmFINMolDataEdit.Free;
      frmFINMolDataEdit:=nil;
    end;
  finally
    FINMolDataObj.Free;
  end;

end;

procedure TfrmENAVRPlanEdit.actMOLDataDeleteExecute(Sender: TObject);
Var
  TempFINMolData: FINMolDataControllerSoapPort;
  objCode : Integer;
begin
 TempFINMolData := HTTPRIOFINMolData as FINMolDataControllerSoapPort;
   try
     ObjCode := StrToInt(sgFINMolData.Cells[0,sgFINMolData.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы дійсно бажаєте видалити МОЛа з Наряду ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempFINMolData.remove(ObjCode, StrToInt(edtWorkOrderCode.Text), 1);
      LoadWorkOrder();
  end;
end;

procedure TfrmENAVRPlanEdit.actMOLDataEditExecute(Sender: TObject);
Var TempFINMolData: FINMolDataControllerSoapPort;
begin
 TempFINMolData := HTTPRIOFINMolData as FINMolDataControllerSoapPort;
   try
     FINMolDataObj := TempFINMolData.getObject(StrToInt(sgFINMolData.Cells[0,sgFINMolData.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINMolDataEdit:=TfrmFINMolDataEdit.Create(Application, dsEdit);
  try
      frmFINMolDataEdit.parentCode := StrToInt(edtWorkOrderCode.Text);
      frmFINMolDataEdit.parentTypeCode := 1;
      frmFINMolDataEdit.departmentCode := ENPlanWorkObj.departmentRef.code;

    if frmFINMolDataEdit.ShowModal= mrOk then
      begin
        LoadWorkOrder();
      end;
  finally
    frmFINMolDataEdit.Free;
    frmFINMolDataEdit:=nil;
  end;
end;

procedure TfrmENAVRPlanEdit.actMOLDataViewExecute(Sender: TObject);
Var TempFINMolData: FINMolDataControllerSoapPort;
begin
 TempFINMolData := HTTPRIOFINMolData as FINMolDataControllerSoapPort;
   try
     FINMolDataObj := TempFINMolData.getObject(StrToInt(sgFINMolData.Cells[0,sgFINMolData.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINMolDataEdit:=TfrmFINMolDataEdit.Create(Application, dsView);
  try
    frmFINMolDataEdit.ShowModal;
  finally
    frmFINMolDataEdit.Free;
    frmFINMolDataEdit:=nil;
  end;
end;

procedure TfrmENAVRPlanEdit.actMOLDataUpdateExecute(Sender: TObject);
begin
  //inherited;
  if edtWorkOrderCode.Text <> '' then
    LoadMOLData( StrToInt(edtWorkOrderCode.Text) );
end;

procedure TfrmENAVRPlanEdit.actExpToExcelExecute(Sender: TObject);
var AppPath, FileName: String;
    OldCursor: TCursor;
begin
  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;

    AppPath := ExtractFilePath(Application.ExeName);
    if not DirectoryExists(AppPath + TempReportsPath) then
      CreateDir(AppPath + TempReportsPath);
    FileName := AppPath + TempReportsPath + GetFileName('request') + '.xls';

    workExcel.XLSExport(FileName);
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

procedure TfrmENAVRPlanEdit.actExpToExcel_materialExecute(
  Sender: TObject);
var AppPath, FileName: String;
    OldCursor: TCursor;
begin
  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;

    AppPath := ExtractFilePath(Application.ExeName);
    if not DirectoryExists(AppPath + TempReportsPath) then
      CreateDir(AppPath + TempReportsPath);
    FileName := AppPath + TempReportsPath + GetFileName('request') + '.xls';

    materialExcel.XLSExport(FileName);
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

procedure TfrmENAVRPlanEdit.actExpToExcelDemontajExecute(Sender: TObject);
var AppPath, FileName: String;
    OldCursor: TCursor;
begin
  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;

    AppPath := ExtractFilePath(Application.ExeName);
    if not DirectoryExists(AppPath + TempReportsPath) then
      CreateDir(AppPath + TempReportsPath);
    FileName := AppPath + TempReportsPath + GetFileName('request') + '.xls';

    demontajExcel.XLSExport(FileName);
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

procedure TfrmENAVRPlanEdit.actExpToExcelHumanExecute(Sender: TObject);
var AppPath, FileName: String;
    OldCursor: TCursor;
begin
  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;

    AppPath := ExtractFilePath(Application.ExeName);
    if not DirectoryExists(AppPath + TempReportsPath) then
      CreateDir(AppPath + TempReportsPath);
    FileName := AppPath + TempReportsPath + GetFileName('request') + '.xls';

    brigadaExcel.XLSExport(FileName);
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


procedure TfrmENAVRPlanEdit.actChangeEstimateItemStatusExecute(
  Sender: TObject);
  var
    TempENEstimateItem: ENEstimateItemControllerSoapPort;
    i , newStatus, eCode : integer;
    state_, isSel : boolean;
    //frm : frmENEstimateItemStatusChangeEdit;
begin
  state_ := false;
  isSel := false;

  for i:=1 to sgENEstimateItem.RowCount - 1 do
  begin
     sgENEstimateItem.GetCheckBoxState(1,i,state_);
     if state_ then
     begin
       isSel := true;
       if (Integer(sgENEstimateItem.Objects[1, i]) in [ ENESTIMATEITEMSTATUS_ORDERED ]) then
       begin
         Application.MessageBox(PChar('У замовлених матеріалів статус вручну не змінюється !!!'), PChar('Увага !'), MB_ICONWARNING);
         Exit;
       end;       
     end;
  end;

  if not isSel then
  begin
     Application.MessageBox(PChar('Виберіть хоча б один матеріал !!!'), PChar('Увага !'),MB_ICONWARNING);
     Exit;
  end;

  frmENEstimateItemStatusChangeEdit := TfrmENEstimateItemStatusChangeEdit.Create(Application, dsInsert);
  try  
    if frmENEstimateItemStatusChangeEdit.ShowModal = mrOK then
    begin
      newStatus := frmENEstimateItemStatusChangeEdit.cbENEstimateItemStatus.ItemIndex + 1;

      TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
      for i:=1 to sgENEstimateItem.RowCount - 1 do
      begin
         sgENEstimateItem.GetCheckBoxState(1,i,state_);
         if state_ then
         begin

            try
              eCode := StrToInt( sgENEstimateItem.Cells[0, i ]); //   (sgENEstimateItem,0));
            except
              on EConvertError do Exit;
            end;

            if not (Integer(sgENEstimateItem.Objects[1, i]) in [ ENESTIMATEITEMSTATUS_ORDERED ]) then
            begin
              //newStatus := ENESTIMATEITEMSTATUS_INSKLAD;
              TempENEstimateItem.changeStatus( eCode  , newStatus );
            end;

         end;
      end;

       pcPlanWorkChange(Sender);
    end;
  finally
     frmENEstimateItemStatusChangeEdit.Free;
  end;

end;

procedure TfrmENAVRPlanEdit.actSelectAllExecute(Sender: TObject);
begin
  inherited;
  checkGrid(sgENEstimateItem, 1, true);
end;

procedure TfrmENAVRPlanEdit.actClearAllExecute(Sender: TObject);
begin
  inherited;
  checkGrid(sgENEstimateItem, 1, false);
end;

procedure TfrmENAVRPlanEdit.updateMarksGrid(estimateItemCode : Integer; stringGrid : TAdvStringGrid );
var
  TempMarkEstimate: ENMarkEstimateControllerSoapPort;
  j,i: Integer;
  meList: ENMarkEstimateShortList;
  meFilter : ENMarkEstimateFilter;
begin
   for i:=1 to stringGrid.RowCount-1 do
     for j:=0 to stringGrid.ColCount-1 do
       stringGrid.Cells[j,i]:='';

  SetGridHeaders(MarksHeaders, stringGrid.ColumnHeaders);

  meFilter := ENMarkEstimateFilter.Create;
  SetNullIntProps(meFilter);
  SetNullXSProps(meFilter);
  meFilter.estimateItem := ENEstimateItem.Create;
  meFilter.estimateItem.code := estimateItemCode;

  TempMarkEstimate :=  HTTPRIOMarkEstimate as ENMarkEstimateControllerSoapPort;
  meList := TempMarkEstimate.getScrollableFilteredList(meFilter,0,-1);

  if High(meList.list) > -1 then
     stringGrid.RowCount:=High(meList.list)+2
  else
     stringGrid.RowCount:=2;

   with stringGrid do
    for i:=0 to High(meList.list) do
      begin
        Application.ProcessMessages;
        if meList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(meList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := meList.list[i].markName;
        stringGrid.RowCount:= i + 2;
      end;

   stringGrid.Row:=1;
end;


procedure TfrmENAVRPlanEdit.actMoveTOExecute(Sender: TObject);
var
  planFull : ENPlanWorkShort;
begin
  inherited;
    frmENEstimateItem2ENEstimateItemEdit:=TfrmENEstimateItem2ENEstimateItemEdit.Create(Application, dsInsert);
    try
      frmENEstimateItem2ENEstimateItemEdit.planOUT := ENPlanWorkObj;

      planFull := DMReports.getPlanShortByCode(ENPlanWorkObj.code);

      frmENEstimateItem2ENEstimateItemEdit.edtPlanOut.Text :=  'Інв. № ' + planFull.invNumber + ' ' + planFull.objectName +
                      ' ' + IntToStr( planFull.monthGen) + ' ' + IntToStr( planFull.yearGen);

      with frmENEstimateItem2ENEstimateItemEdit do
      begin
          updateENEstimateItemGrid(sgENEstimateItemOUT, planOut.code);
          sgENEstimateItemOUTClick(Sender);
      end;

      if frmENEstimateItem2ENEstimateItemEdit.ShowModal = mrOk then
      begin

      end;
    finally
      frmENEstimateItem2ENEstimateItemEdit.Free;
      frmENEstimateItem2ENEstimateItemEdit:=nil;
    end;

end;

procedure TfrmENAVRPlanEdit.actMoveFromExecute(Sender: TObject);
var
  planFull : ENPlanWorkShort;
begin
  inherited;
    frmENEstimateItem2ENEstimateItemEdit:=TfrmENEstimateItem2ENEstimateItemEdit.Create(Application, dsInsert);
    try
      frmENEstimateItem2ENEstimateItemEdit.planIN := ENPlanWorkObj;

      planFull := DMReports.getPlanShortByCode(ENPlanWorkObj.code);

      frmENEstimateItem2ENEstimateItemEdit.edtPlanIN.Text :=  'Інв. № ' + planFull.invNumber + ' ' + planFull.objectName +
                      ' ' + IntToStr( planFull.monthGen) + ' ' + IntToStr( planFull.yearGen);

      with frmENEstimateItem2ENEstimateItemEdit do
      begin
          updateENEstimateItemGrid(sgENEstimateItemIN, planIN.code);
          sgENEstimateItemINClick(Sender);
      end;

      if frmENEstimateItem2ENEstimateItemEdit.ShowModal = mrOk then
      begin

      end;
    finally
      frmENEstimateItem2ENEstimateItemEdit.Free;
      frmENEstimateItem2ENEstimateItemEdit:=nil;
    end;

end;

procedure TfrmENAVRPlanEdit.rgBudgetClick(Sender: TObject);
begin
  rgResponsibility.ItemIndex := rgBudget.ItemIndex;
end;

procedure TfrmENAVRPlanEdit.spbMolMechClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

   TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;

  molSel : boolean;
  
begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // типа только работающие ...

   if ENPlanWorkObj.departmentRef <> nil then
     if ENPlanWorkObj.departmentRef.code <> LOW_INT then
     begin
        TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
        renFilter := ENDepartment2EPRenFilter.Create;
        SetNullXSProps(renFilter);
        SetNullIntProps(renFilter);
        renFilter.departmentRef := ENDepartmentRef.Create;
        renFilter.departmentRef.code := ENPlanWorkObj.departmentRef.code;  // ENWorkOrder2ENPlanWorkObj.workOrder.department.code;

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

               MechName := GetReturnValue(sgFINMol,1);
               MechCode := GetReturnValue(sgFINMol,0);
               edtMolMech.Text := MechCode + ' ' + MechName;

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;

end;

procedure TfrmENAVRPlanEdit.spbClearMolMechClick(Sender: TObject);
begin
  inherited;
if Application.MessageBox(PChar('Видалити МОЛа ?'),
                                       PChar('Увага!'),
                                       MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
begin
               edtMolMech.Text := '';
               MechName := '';
               MechCode := '';
end;

end;

procedure TfrmENAVRPlanEdit.btnAddWorkItemClick(Sender: TObject);
var
   frmWorkShow : TfrmTKTechCardShow;
   TempTKTechCard : TKTechCardControllerSoapPort;
   tcObj : TKTechCard;
   i : Integer;
begin
   frmWorkShow:=TfrmTKTechCardShow.Create(Application,fmNormal);
   frmWorkShow.Enabled := True;

   try
      with frmWorkShow do
      begin
        DisableActions([actInsert, actEdit, actDelete]);
        if ShowModal = mrOk then
        begin
            try
               TempTKTechCard := HTTPRIOTKTechCardPWI as TKTechCardControllerSoapPort;
               tcObj := TempTKTechCard.getObject(StrToInt(GetReturnValue(sgTKTechCard,0)));
          ////

                /// проверим есть ли такая работа в гриде
                 for i:= 1 to sgWorkItems.RowCount-1 do
                   if sgWorkItems.Cells[0,i] = IntToStr(tcObj.code) then
                   begin
                    Application.MessageBox(Pchar('Такая работа уже добавлена!'),PChar('Ошибка'),MB_ICONERROR);
                    Exit;
                   end;
               ///

               if sgWorkItems.Cells[0, 1] <> '' then
                  sgWorkItems.RowCount := sgWorkItems.RowCount + 1
               else
                  sgWorkItems.RowCount := 2;

               sgWorkItems.Cells[0, sgWorkItems.RowCount-1] :=  IntToStr(tcObj.code);
               sgWorkItems.CellProperties[0,sgWorkItems.RowCount-1].ReadOnly := true;



               sgWorkItems.Cells[1, sgWorkItems.RowCount-1] := tcObj.techKartNumber;
               sgWorkItems.CellProperties[1,sgWorkItems.RowCount-1].ReadOnly := true;
               sgWorkItems.Cells[2, sgWorkItems.RowCount-1] := tcObj.name;
               sgWorkItems.CellProperties[2,sgWorkItems.RowCount-1].ReadOnly := true;
               sgWorkItems.Cells[3, sgWorkItems.RowCount-1] := '1';
               sgWorkItems.CellProperties[3,sgWorkItems.RowCount-1].ReadOnly := False;
          ////
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmWorkShow.Free;
   end;

end;

procedure TfrmENAVRPlanEdit.sgWorkItemsCellValidate(Sender: TObject; ACol,
  ARow: Integer; var Value: String; var Valid: Boolean);
var suggestedQuantity, userQuantity  : Double;
  begin
 if ACol <> 3 then Exit;

 suggestedQuantity := 1;
 try
   if sgWorkItems.Cells[3, ARow] <> '' then
     suggestedQuantity := StrToFloat(sgWorkItems.Cells[3, ARow]);
 except
   on EConvertError do suggestedQuantity := 1;
 end;

 userQuantity := 0;
 try
   userQuantity := StrToFloat(Value);
 except
   on EConvertError do
   begin
     Application.MessageBox(PChar('Невірне значення: "' + Value + '"!'), PChar('Помилка!'), MB_ICONERROR);
     Value := FloatToStr(suggestedQuantity);
     Valid := false;
     Exit;
   end;
 end;

end;

procedure TfrmENAVRPlanEdit.btnDeleteItemClick(Sender: TObject);
var j, k, l : Integer;
begin

  begin
     for j:=0 to sgWorkItems.ColCount-1 do
     sgWorkItems.Cells[j,sgWorkItems.Row]:='';
  end;

  for k:= sgWorkItems.Row to sgWorkItems.RowCount-2 do
    for l:= 0 to  sgWorkItems.ColCount - 1 do
   sgWorkItems.Cells[l,k] :=  sgWorkItems.Cells[l,k+1];

   if sgWorkItems.RowCount > 2 then
   sgWorkItems.RowCount := sgWorkItems.RowCount - 1;

end;

procedure TfrmENAVRPlanEdit.chbDetailedClick(Sender: TObject);
begin
  inherited;
 HideControls([sgDetailedTransportItem], not chbDetailed.Checked);
 if chbDetailed.Checked then sgGroupedTransportItemClick(Sender);
end;

procedure TfrmENAVRPlanEdit.btnSetTimeClick(Sender: TObject);
var
    i, eCode, n, transportCode, isAssignment : integer;
    transportName : String;
    state_, isSel : boolean;
    TempENTransportItem: ENTransportItemControllerSoapPort;
    ENTransportItemObj : ENTransportItem;
    transportItemFilter : ENTransportItemFilter;
    tiList : ENTransportItemShortList;
    tiShort : ENTransportItemShort;
    tiArr : ArrayOfENTransportItemShort;
    dateStart, dateFinal : TXSDate;
    timeStart, timeFinal : TXSDateTime;
    TempENTransportOrder :  ENTransportOrderControllerSoapPort;
    wopwList : ENWorkOrder2ENPlanWorkShortList;
    wopwFilter : ENWorkOrder2ENPlanWorkFilter;
    TempWOPW : ENWorkOrder2ENPlanWorkControllerSoapPort;
    TempFINMolData : FINMolDataControllerSoapPort;
    fmdList : FINMolDataShortList;
    fmdFilter : FINMolDataFilter;


begin
  inherited;

  {10.02.2012 - проверка на наличие наряда}
  wopwFilter := ENWorkOrder2ENPlanWorkFilter.Create;
  SetNullIntProps(wopwFilter);
  SetNullXSProps(wopwFilter);

  wopwFilter.plan := ENPlanWork.Create;
  wopwFilter.plan.code := ENPlanWorkObj.code;

  TempWOPW := HTTPRIOENWorkOrder2ENPlanWork as ENWorkOrder2ENPlanWorkControllerSoapPort;

  wopwList := TempWOPW.getScrollableFilteredList(wopwFilter, 0, -1);

 if (wopwList.totalCount = 0) then
  begin
     Application.MessageBox(PChar('Введіть наряд!!!'), PChar('Увага !'),MB_ICONWARNING);
     Exit;
  end;

  {10.02.2012 - проверка мастера в наряде}
  fmdFilter := FINMolDataFilter.Create;
  SetNullIntProps(fmdFilter);
  SetNullXSProps(fmdFilter);

  fmdFilter.workOrder := ENWorkOrder.Create;
  fmdFilter.workOrder.code := wopwList.list[0].workOrderCode;

  fmdFilter.molTypeRef := FINMolTypeRef.Create;
  fmdFilter.molTypeRef.code := ENConsts.FINMOLTYPE_MASTER;

  TempFINMolData := HTTPRIOFINMolData as FINMolDataControllerSoapPort;

  fmdList := TempFINMolData.getScrollableFilteredList(fmdFilter, 0, -1);

   if (fmdList.totalCount = 0) then
  begin
     Application.MessageBox(PChar('Введіть майстра в наряді!!!'), PChar('Увага !'),MB_ICONWARNING);
     Exit;
  end;

  
  {15/03/2012 - проверка виконавця на плане}
  if ENPlanWorkObj.finExecutor.code = Low(Integer) then
  begin
      Application.MessageBox(PChar('Введіть виконавця на плані!!!'), PChar('Увага !'),MB_ICONWARNING);
      Exit;
  end;


  if ((Sender = sgGroupedTransportItem) and (DialogState = dsView)) then Exit;

  if sgGroupedTransportItem.Cells[0, sgGroupedTransportItem.Row] = '' then Exit;

  if StrToInt(sgGroupedTransportItem.Cells[0, sgGroupedTransportItem.Row]) > 0 then
    begin
     btnUpdateTimeClick(Sender);
     exit;
    end;

  if chbDetailed.Checked then
  begin

  state_ := false;
  isSel := false;

  n:= 0;

  for i:=1 to sgDetailedTransportItem.RowCount - 1 do
  begin
     sgDetailedTransportItem.GetCheckBoxState(1,i,state_);
     if state_ then
     begin
       isSel := true;
       n:= n+1;
     end;

  end;

    if not isSel then
  begin
     Application.MessageBox(PChar('Виберіть хоча б один транспорт!!!'), PChar('Увага !'),MB_ICONWARNING);
     Exit;
  end;

  transportCode := Integer(sgDetailedTransportItem.Objects[0, sgDetailedTransportItem.Row]);

  tiList := ENTransportItemShortList.Create;
  tiList.totalCount := 0;
  SetLength(tiArr, n);
  state_ := false;
  n:= 0;
  for i := 1 to sgDetailedTransportItem.RowCount - 1 do
  begin
    sgDetailedTransportItem.GetCheckBoxState(1, i, state_);
    if state_ then
    begin
       tiShort := ENTransportItemShort.Create;
       SetNullIntProps(tiShort);
       SetNullXSProps(tiShort);
       tiShort.code :=  StrToInt(sgDetailedTransportItem.Cells[0, i]);
       tiShort.planRefCode := ENPlanWorkObj.code;
       tiShort.transportCode := transportCode;
       tiShort.transportName := sgDetailedTransportItem.Cells[1, i];
       tiArr[n] := tiShort;
       n := n + 1;
    end;
  end;

  end;

  if chbDetailed.Checked = False then
    begin
    transportItemFilter := ENTransportItemFilter.Create;
    SetNullIntProps(transportItemFilter);
    SetNullXSProps(transportItemFilter);

    transportCode := Integer(sgGroupedTransportItem.Objects[0, sgGroupedTransportItem.Row]);

    TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;


    transportItemFilter.conditionSQL := ' and tr.TRANSPORTCODE in (select tktransport.code ' +
                                                                  ' from tktransport where tktransport.transportclassifictncd =  ' +
                                                                  IntToStr(transportCode) + ')' +
                                        ' and p.code = ' + IntToStr(ENPlanWorkObj.code) +
                                        ' and tr.code not in ' +
                                        ' (select entrnsprtrdr2trnsprttm.transportitemcode from entrnsprtrdr2trnsprttm ' +
                                        ' where entrnsprtrdr2trnsprttm.transportordercode in ' +
                                        ' (select entransportorder.code from entransportorder ' +
                                        ' where entransportorder.transportcode in ' + ' (select tktransport.code ' +
                                        ' from tktransport where tktransport.transportclassifictncd =  ' +
                                        IntToStr(transportCode) + ')' +
                                        ' and entransportorder.planrefcode = ' + IntToStr(ENPlanWorkObj.code) + '))';

    tiList := TempENTransportItem.getListDetailedForTravelSheetItem(transportItemFilter);
    tiArr := tiList.list;
   end;

  frmSetTimeToTransportItem := TfrmSetTimeToTransportItem.Create(Application, dsInsert);

     {Дата наряда}
   frmSetTimeToTransportItem.edtDateStart.Date := StrToDate(XSDate2String(fmdList.list[0].workOrderDateGen));
   frmSetTimeToTransportItem.edtDateFinal.Date := StrToDate(XSDate2String(fmdList.list[0].workOrderDateGen));

  frmSetTimeToTransportItem.Caption := 'Встановлення часу роботи транспорта';
  try
    if frmSetTimeToTransportItem.ShowModal = mrOK then
       begin
            dateStart := TXSDate.Create;
            dateStart.XSToNative(GetXSDate(frmSetTimeToTransportItem.edtDateStart.Date));
            dateFinal := TXSDate.Create;
            dateFinal.XSToNative(GetXSDate(frmSetTimeToTransportItem.edtDateFinal.Date));
            timeStart := TXSDateTime.Create;
            timeStart.XSToNative(GetXSDateTime(frmSetTimeToTransportItem.edtTimeStart.DateTime));
            timeFinal := TXSDateTime.Create;
            timeFinal.XSToNative(GetXSDateTime(frmSetTimeToTransportItem.edtTimeFinal.DateTime));


            {24/03/2012 - Определение признака командировки}
            isAssignment := ENConsts.ENTRANSPORTORDER_ISASSIGNMENT_FALSE;
             if frmSetTimeToTransportItem.chbIsAssignment.Checked = true then
              isAssignment := ENConsts.ENTRANSPORTORDER_ISASSIGNMENT_TRUE;

            TempENTransportOrder := HTTPRIOENTransportOrder as  ENTransportOrderControllerSoapPort;
            TempENTransportOrder.addTransportOrderWithTransportItems(tiArr,
                                                                    timeStart,
                                                                    dateStart,
                                                                    timeFinal,
                                                                    dateFinal,
                                                                    frmSetTimeToTransportItem.transportDepartmentCode,
                                                                    isAssignment);
         end;
       UpdateGrid(Sender);
  finally
     frmSetTimeToTransportItem.Free;
  end;
end;

procedure TfrmENAVRPlanEdit.btnUpdateTimeClick(Sender: TObject);
var
    i, eCode, n, transportCode, transportOrderCode : integer;
    dateStart, dateFinal : TXSDateTime;
    timeStart, timeFinal : TXSDateTime;
    TempENTransportOrder :  ENTransportOrderControllerSoapPort;
    ENTransportOrderObj : ENTransportOrder;

begin
  inherited;

  if ((Sender = sgGroupedTransportItem) and (DialogState = dsView)) then Exit;

  if sgGroupedTransportItem.Cells[0, sgGroupedTransportItem.Row] = '' then Exit;

  transportOrderCode := StrToInt(sgGroupedTransportItem.Cells[0, sgGroupedTransportItem.Row]);

  if transportOrderCode < 0 then
    begin
     Application.MessageBox(PChar('Ще немає введеного часу для цього транспорту'), PChar('Внимание'), MB_OK + MB_ICONWARNING);
     exit;
    end;

     TempENTransportOrder := HTTPRIOENTransportOrder as  ENTransportOrderControllerSoapPort;

     ENTransportOrderObj := ENTransportOrder.Create;
     ENTransportOrderObj := TempENTransportOrder.getObject(transportOrderCode);


  if chbDetailed.Checked then
  chbDetailed.Checked := false;

   frmSetTimeToTransportItem := TfrmSetTimeToTransportItem.Create(Application, dsEdit);
   frmSetTimeToTransportItem.Caption := 'Редагування часу роботи транспорта';
   frmSetTimeToTransportItem.ENTransportOrderObj := TempENTransportOrder.getObject(transportOrderCode);

  try
    if frmSetTimeToTransportItem.ShowModal = mrOK then
       begin
            dateStart := TXSDateTime.Create;
            dateStart.XSToNative(GetXSDateTime(frmSetTimeToTransportItem.edtDateStart.Date));
            dateFinal := TXSDateTime.Create;
            dateFinal.XSToNative(GetXSDateTime(frmSetTimeToTransportItem.edtDateFinal.Date));
            timeStart := TXSDateTime.Create;
            timeStart.XSToNative(GetXSDateTime(frmSetTimeToTransportItem.edtTimeStart.DateTime));
            timeFinal := TXSDateTime.Create;
            timeFinal.XSToNative(GetXSDateTime(frmSetTimeToTransportItem.edtTimeFinal.DateTime));

            {24/03/2012 - Определение признака командировки}
            ENTransportOrderObj.isAssignment := ENConsts.ENTRANSPORTORDER_ISASSIGNMENT_FALSE;
             if frmSetTimeToTransportItem.chbIsAssignment.Checked = true then
              ENTransportOrderObj.isAssignment := ENConsts.ENTRANSPORTORDER_ISASSIGNMENT_TRUE;

            ENTransportOrderObj.timeStart := timeStart;
            ENTransportOrderObj.timeFinal := timeFinal;
            ENTransportOrderObj.dateStart := dateStart;
            ENTransportOrderObj.dateFinal := dateFinal;
            ENTransportOrderObj.transportDepartment.code :=  frmSetTimeToTransportItem.transportDepartmentCode;
            ENTransportOrderObj.parentRef.code := frmSetTimeToTransportItem.ENTransportOrderObj.parentRef.code;

            TempENTransportOrder.save(ENTransportOrderObj);

         end;
       UpdateGrid(Sender);
  finally
     frmSetTimeToTransportItem.Free;
  end;
end;

procedure TfrmENAVRPlanEdit.btnDeleteTimeClick(Sender: TObject);
var
    i, eCode, n, transportCode, transportOrderCode : integer;
    transportName : String;
    state_, isSel : boolean;
    TempENTransportItem: ENTransportItemControllerSoapPort;
    ENTransportItemObj : ENTransportItem;
    transportItemFilter : ENTransportItemFilter;
    tiList : ENTransportItemShortList;
    tiShort : ENTransportItemShort;
    tiArr : ArrayOfENTransportItemShort;
    dateStart, dateFinal : TXSDate;
    timeStart, timeFinal : TXSDateTime;
    TempENTransportOrder :  ENTransportOrderControllerSoapPort;

begin
  inherited;

  if ((Sender = sgGroupedTransportItem) and (DialogState = dsView)) then Exit;

  if sgGroupedTransportItem.Cells[0, sgGroupedTransportItem.Row] = '' then Exit;

  transportOrderCode := StrToInt(sgGroupedTransportItem.Cells[0, sgGroupedTransportItem.Row]);

  if transportOrderCode < 0 then
    begin
     Application.MessageBox(PChar('Ще немає введеного часу для цього транспорту'), PChar('Внимание'), MB_OK + MB_ICONWARNING);
     exit;
    end;

  if chbDetailed.Checked then
  chbDetailed.Checked := false;


    TempENTransportOrder := HTTPRIOENTransportOrder as  ENTransportOrderControllerSoapPort;

   if Application.MessageBox(PChar('Ви дійсно бажаєте видалити час робіт для цього транспорту?'),
                           PChar('Внимание'), MB_OKCANCEL + MB_ICONQUESTION) <> IDOK then Exit;

    TempENTransportOrder.removeTransportOrderWithTransportItems(transportOrderCode);
       UpdateGrid(Sender);

end;

procedure TfrmENAVRPlanEdit.btnAddToTravelSheetClick(Sender: TObject);
var
  frmENTravelSheet : TfrmENTravelSheetShow;
  TempENTravelSheet : ENTravelSheetControllerSoapPort;
  TempENTransportOrder : ENTransportOrderControllerSoapPort;
  travelSheetFilter : ENTravelSheetFilter;
  travelSheet : ENTravelSheet;
  transportOrderCode, transportDepartmentCode, travelSheetCode, transportRealCode : Integer;
  transportOrder : ENTransportOrder;
  date : TDateTime;
  condition : String;
  finWorkerTabNumber, numberTravel : String;

begin
  inherited;

  if ((Sender = sgGroupedTransportItem) and (DialogState = dsView)) then Exit;

  if sgGroupedTransportItem.Cells[0, sgGroupedTransportItem.Row] = '' then Exit;

  TempENTransportOrder := HTTPRIOENTransportOrder as ENTransportOrderControllerSoapPort;
  TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;

  transportOrderCode := StrToInt(sgGroupedTransportItem.Cells[0, sgGroupedTransportItem.Row]);
  transportDepartmentCode := Integer(sgGroupedTransportItem.Objects[2, sgGroupedTransportItem.Row]);

  if transportOrderCode < 0 then
    begin
     Application.MessageBox(PChar('Ще немає введеного часу для цього транспорту'), PChar('Внимание'), MB_OK + MB_ICONWARNING);
     exit;
    end;

    transportOrder := TempENTransportOrder.getObject(transportOrderCode);
    transportDepartmentCode := transportOrder.transportDepartment.code;

    if transportDepartmentCode < 0 then
    begin
     Application.MessageBox(PChar('Введіть транспортний підрозділ'), PChar('Внимание'), MB_OK + MB_ICONWARNING);
     exit;
    end;

  if chbDetailed.Checked then
    chbDetailed.Checked := false;

    //ENPlanWorkObj.dateStart.

    date := EncodeDateTime( ENPlanWorkObj.dateStart.Year,            ENPlanWorkObj.dateStart.Month,
                                                                      ENPlanWorkObj.dateStart.Day,
                                                                      0,
                                                                      0,
                                                                     0,0);

  // Отображение формы путевых листов
  travelSheetFilter := ENTravelSheetFilter.Create;
  SetNullXSProps(travelSheetFilter);
  SetNullIntProps(travelSheetFilter);

  condition := 'select entravelsheet.code from entravelsheet where entravelsheet.transportrealcode in (select tr.code from tktransportreal as tr where tr.transportdepartmntrfcd =' + IntToStr(transportDepartmentCode) + ' and tr.isonduty = ' +
                IntToStr(ENConsts.TKTRANSPORTREAL_ISONDUTY) + ') and ' +
                      ' ((entravelsheet.datestart >= '' ' + DateTimeToStr(date) +  ' '' and entravelsheet.datefinal <='' '+ DateTimeToStr(date)+ ' '' ) ' +
                      ' or ' +
                      '(''' + DateTimeToStr(date) + ''' >= entravelsheet.datestart and ''' + DateTimeToStr(date) + ''' <= entravelsheet.datefinal)' + ')';

  travelSheetFilter.conditionSQL := 'ENTRAVELSHEET.CODE IN (' + condition + ')';

  frmENTravelSheet := TfrmENTravelSheetShow.Create(Application, fmNormal, travelSheetFilter);

  with frmENTravelSheet do
  begin
    DisableActions([actFilter, actNoFilter]);
    if ShowModal = mrOk then
    begin
          travelSheetCode := StrToInt(GetReturnValue(sgENTravelSheet,0));
          travelSheet := TempENTravelSheet.getObject(travelSheetCode);
          numberTravel := travelSheet.numberGen;
          if Application.MessageBox(PChar('Ви дійсно бажаєте включити обраний транспорт до подорожнього листа № ' + numberTravel + '?'),
                           PChar('Внимание'), MB_OKCANCEL + MB_ICONQUESTION) <> IDOK then Exit;

          transportRealCode := travelSheet.transportReal.code;
          finWorkerTabNumber := travelSheet.finWorker.tabNumber;

          TempENTransportOrder.addTransportWithWorker(transportOrderCode, finWorkerTabNumber, transportRealCode);

    end;
  end;
  UpdateGrid(Sender);
  DialogState := dsView;
  Self.Show;
end;

procedure TfrmENAVRPlanEdit.sgGroupedTransportItemClick(Sender: TObject);
var
  TempENTransportItem: ENTransportItemControllerSoapPort;
  ENTransportItemList: ENTransportItemShortList;
  transportItemFilter: ENTransportItemFilter;
  transportCode,
  tiLastCount, tiLastRow, tiColCount, i,j: Integer;
  TempENTransportOrder :  ENTransportOrderControllerSoapPort;
    wopwList : ENWorkOrder2ENPlanWorkShortList;
    wopwFilter : ENWorkOrder2ENPlanWorkFilter;
    TempWOPW : ENWorkOrder2ENPlanWorkControllerSoapPort;
    TempFINMolData : FINMolDataControllerSoapPort;
    fmdList : FINMolDataShortList;
    fmdFilter : FINMolDataFilter;


begin
  {10.02.2012 - проверка на наличие наряда}
  wopwFilter := ENWorkOrder2ENPlanWorkFilter.Create;
  SetNullIntProps(wopwFilter);
  SetNullXSProps(wopwFilter);

  wopwFilter.plan := ENPlanWork.Create;
  wopwFilter.plan.code := ENPlanWorkObj.code;

  TempWOPW := HTTPRIOENWorkOrder2ENPlanWork as ENWorkOrder2ENPlanWorkControllerSoapPort;

  wopwList := TempWOPW.getScrollableFilteredList(wopwFilter, 0, -1);

 if (wopwList.totalCount = 0) then
  begin
     Application.MessageBox(PChar('Введіть наряд!!!'), PChar('Увага !'),MB_ICONWARNING);
     Exit;
  end;

  {10.02.2012 - проверка мастера в наряде}
  fmdFilter := FINMolDataFilter.Create;
  SetNullIntProps(fmdFilter);
  SetNullXSProps(fmdFilter);

  fmdFilter.workOrder := ENWorkOrder.Create;
  fmdFilter.workOrder.code := wopwList.list[0].workOrderCode;

  fmdFilter.molTypeRef := FINMolTypeRef.Create;
  fmdFilter.molTypeRef.code := ENConsts.FINMOLTYPE_MASTER;

  TempFINMolData := HTTPRIOFINMolData as FINMolDataControllerSoapPort;

  fmdList := TempFINMolData.getScrollableFilteredList(fmdFilter, 0, -1);

   if (fmdList.totalCount = 0) then
  begin
     Application.MessageBox(PChar('Введіть майстра в наряді!!!'), PChar('Увага !'),MB_ICONWARNING);
     Exit;
  end;

  {15/03/2012 - проверка виконавця на плане}
  if ENPlanWorkObj.finExecutor.code = Low(Integer) then
  begin
      Application.MessageBox(PChar('Введіть виконавця на плані!!!'), PChar('Увага !'),MB_ICONWARNING);
      Exit;
  end;

    tiColCount := 1;

    SetGridHeaders(ENDetailedTransportItemHeaders, sgDetailedTransportItem.ColumnHeaders);


    transportCode := Integer(sgGroupedTransportItem.Objects[0, sgGroupedTransportItem.Row]);

    transportItemFilter := ENTransportItemFilter.Create;
       SetNullIntProps(transportItemFilter);
       SetNullXSProps(transportItemFilter);

    TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;

    if  sgGroupedTransportItem.Cells[0, sgGroupedTransportItem.Row]  = '' then exit;

    transportItemFilter.conditionSQL := ' and tr.TRANSPORTCODE in ' +
                                        ' (select tktransport.code ' +
                                        ' from tktransport where tktransport.transportclassifictncd =  ' +
                                        IntToStr(transportCode) + ')' +
                                        ' and p.code = ' + IntToStr(ENPlanWorkObj.code);

    if  StrToInt(sgGroupedTransportItem.Cells[0, sgGroupedTransportItem.Row])  > 0 then
       begin
       transportItemFilter.conditionSQL :=  transportItemFilter.conditionSQL +
                                            ' and tr.code in ' +
                                            '(select entrnsprtrdr2trnsprttm.transportitemcode from entrnsprtrdr2trnsprttm ' +
                                            ' where entrnsprtrdr2trnsprttm.transportordercode =  ' +
                                        sgGroupedTransportItem.Cells[0, sgGroupedTransportItem.Row] + ')';
     ENTransportItemList := TempENTransportItem.getListDetailedForTransportOrder(transportItemFilter);
       end

    else
    begin
    transportItemFilter.conditionSQL :=  transportItemFilter.conditionSQL +
                                              ' and tr.code not in ' +
                                              ' (select entrnsprtrdr2trnsprttm.transportitemcode from entrnsprtrdr2trnsprttm ' +
                                              ' where entrnsprtrdr2trnsprttm.transportordercode in ' +
                                              ' (select entransportorder.code from entransportorder ' +
                                              ' where entransportorder.transportcode in ' + ' (select tktransport.code ' +
                                        ' from tktransport where tktransport.transportclassifictncd =  ' +
                                        IntToStr(transportCode) + ')' +
                                              ' and entransportorder.planrefcode = ' + IntToStr(ENPlanWorkObj.code) + '))';
     ENTransportItemList := TempENTransportItem.getListDetailedForTravelSheetItem(transportItemFilter);

    end;


     tiLastCount := High(ENTransportItemList.list);

    if tiLastCount > -1 then
      sgDetailedTransportItem.RowCount := tiLastCount + 2
    else
      sgDetailedTransportItem.RowCount := 2;

     with sgDetailedTransportItem do
       for i := 0 to tiLastCount do
       begin
       //  Application.ProcessMessages;

         if ENTransportItemList.list[i].code <> Low(Integer) then
           Cells[0,i+1] := IntToStr(ENTransportItemList.list[i].code)
         else
           Cells[0,i+1] := '';

           Cells[1,i+1] := ENTransportItemList.list[i].transportName;
           AddCheckBox(1, i+1, false, false);

           Cells[2,i+1] := ENTransportItemList.list[i].kartaNum + ' ' + ENTransportItemList.list[i].kartaRefName;

        if ENTransportItemList.list[i].distance <> nil then
           Cells[3,i+1] :=  ENTransportItemList.list[i].distance.DecimalString
        else
           Cells[3,i+1] := '';

        if ENTransportItemList.list[i].countWorkFact = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENTransportItemList.list[i].countWorkFact.DecimalString;


         tiLastRow := i + 1;
         sgDetailedTransportItem.RowCount := tiLastRow + 1;

         Objects[0,i+1] := TObject(ENTransportItemList.list[i].transportCode);
       end;

     tiColCount := tiColCount + 1;
     sgDetailedTransportItem.Row := 1;
end;

procedure TfrmENAVRPlanEdit.btnAddDistanceForTransportClick(
  Sender: TObject);
 var TempENTransportItem : ENTransportItemControllerSoapPort;
  transportItemCode, amountOfJourneys : Integer;
  distance : TXSDecimal;
  frmAddDistance : TfrmAddDistance;
begin

    frmAddDistance := TfrmAddDistance.Create(Application);
    DisableControls([frmAddDistance.edtAmountOfJourney]);
    HideControls([frmAddDistance.edtAmountOfJourney,frmAddDistance.lblAmountOfJourneys ]);
  try
    if frmAddDistance.ShowModal = mrOK then
       begin
             distance := TXSDecimal.Create;
             distance.DecimalString := trim(frmAddDistance.edtDistance.Text);
             amountOfJourneys := 1;
             TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;
             TempENTransportItem.addDistanceForTransport(StrToInt(sgENTransportItem.Cells[0,sgENTransportItem.Row]),  distance, amountOfJourneys);
         end;
       UpdateGrid(Sender);
  finally
     frmAddDistance.Free;
  end;
end;

procedure TfrmENAVRPlanEdit.btnRemoveDistanceForTranportClick(
  Sender: TObject);
var TempENTransportItem : ENTransportItemControllerSoapPort;
begin
   TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;
   TempENTransportItem.removeDistanceForTransport(StrToInt(sgENTransportItem.Cells[0,sgENTransportItem.Row]));
   UpdateGrid(Sender);
end;

procedure TfrmENAVRPlanEdit.actFinWorkerAssignToAllExecute(Sender: TObject);
 var
    i, eCode : integer;
    state_, isSel, isNotFree : boolean;
    frmFINWorkerAssignToAllEdit : TfrmFINWorkerAssignToAllEdit;
    TempENHumenItem: ENHumenItemControllerSoapPort;
    ENHumenItemObj : ENHumenItem;
begin
  inherited;

  state_ := false;
  isSel := false;
  isNotFree := false;

  for i:=1 to sgENHumenItem.RowCount - 1 do
  begin
     sgENHumenItem.GetCheckBoxState(1,i,state_);
     if state_ then
     begin
       isSel := true;
     end;

     if (sgENHumenItem.Cells[3,i] <> '') and (state_) then
     begin
          isNotFree := true;
     end;

  end;

  if not isSel then
  begin
     Application.MessageBox(PChar('Виберіть хоча б одну посаду!!!'), PChar('Увага !'),MB_ICONWARNING);
     Exit;
  end;

  // 09.12.2011 - Проверка на то, что реальный работник присутствует убрана
  {if isNotFree then
  begin
      Application.MessageBox(PChar('Зніміть позначку з вже обраних працівників!'), PChar('Увага !'),MB_ICONWARNING);
     Exit;
  end;}

  frmFINWorkerAssignToAllEdit := TfrmFINWorkerAssignToAllEdit.Create(Application, dsInsert);
  frmFINWorkerAssignToAllEdit.planCode := ENPlanWorkObj.code;
  try
    if frmFINWorkerAssignToAllEdit.ShowModal = mrOK then
    begin


      TempENHumenItem := HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;
      for i:=1 to sgENHumenItem.RowCount - 1 do
      begin
         sgENHumenItem.GetCheckBoxState(1,i,state_);
         if state_ then
         begin

            try
              eCode := StrToInt( sgENHumenItem.Cells[0, i ]); //   (sgENEstimateItem,0));
            except
              on EConvertError do Exit;
            end;
              ENHumenItemObj := TempENHumenItem.getObject(eCode);




              with frmFINWorkerAssignToAllEdit do
              begin
                  if ENHumenItemObj.finworker = nil then
                  begin
                      ENHumenItemObj.finworker := FINWorker.Create;
                      ENHumenItemObj.finworker.code := low(Integer);
                  end;

                  // 09.12.2011 - Проверка на то, что реальный работник присутствует убрана
                  {if ENHumenItemObj.finWorker.code <> LOW_INT then
                  begin
                      Application.MessageBox(PChar('На нормативній посаді ' +WideCharToString(PWideChar(ENHumenItemObj.positionGen.name)) + ' вже є реальний працівник ' + WideCharToString(PWideChar(ENHumenItemObj.finWorker.name))), PChar('Увага !'),MB_ICONWARNING);
                      pcPlanWorkChange(Sender);
                      Exit;
                  end;}

                  ENHumenItemObj.finworker.name := FINWorkerObj.name;
                  ENHumenItemObj.finworker.tabNumber := FINWorkerObj.tabNumber;
                  ENHumenItemObj.finworker.positionName := FINWorkerObj.positionName;
                  ENHumenItemObj.finworker.positionCode := FINWorkerObj.positionCode;
                  ENHumenItemObj.finworker.departmentName := FINWorkerObj.departmentName;
                  ENHumenItemObj.finworker.departmentCode := FINWorkerObj.departmentCode;
                  if ENHumenItemObj.finworker.priceGen = nil then ENHumenItemObj.finworker.priceGen := TXSDecimal.Create;
                  ENHumenItemObj.finworker.priceGen := FINWorkerObj.priceGen;

                  ENHumenItemObj.finworker.kindRef := FINWorkerKindRef.Create;

                  ENHumenItemObj.finworker.categor := FINWorkerObj.categor;

                  ENHumenItemObj.finWorker.kindRef.code := FINWorkerObj.kindRef.code;

                  ENHumenItemObj.finWorker.finCode := FINWorkerObj.finCode;

                  // катерия персонала . айди графика рабочего времени
                  ENHumenItemObj.finWorker.categorId :=  FINWorkerObj.categorId;
                  ENHumenItemObj.finWorker.categorName :=  FINWorkerObj.categorName;
									ENHumenItemObj.finWorker.workTimeId :=  FINWorkerObj.workTimeId;




              end;

              TempENHumenItem.save(ENHumenItemObj);
         end;
      end;

       pcPlanWorkChange(Sender);
    end;
  finally
     frmFINWorkerAssignToAllEdit.Free;
  end;
end;


procedure TfrmENAVRPlanEdit.btnPrintWorkOrderClick(Sender: TObject);
var
  workOrder : ENWorkOrder;

  TempENHumenItem: ENHumenItemControllerSoapPort;
  ENHumenItemList: ENHumenItemShortList;
  humenItemFilter : ENHumenItemFilter;
  TempENPlanWorkItem : ENPlanWorkItemControllerSoapPort;
  planWorkItemFilter : ENPlanWorkItemFilter;
  planWorkItemList : ENPlanWorkItemShortList;
  argNames, args: ArrayOfString;
  condition : String;
  reportName: String;
begin
  // не даем печатать наряд-задание если нету на плане наряд-задания .
  workOrder := DMReports.getWorkOrderByPlanCode(ENPlanWorkObj.code);
  if workOrder.code = Low(Integer) then
  begin
     Application.MessageBox(PChar('Друк Наряд-завдання неможливий додайте Наряд-завдання на План ...!'), PChar('Увага!'), MB_ICONWARNING);

     exit;
  end;

  // не даем печататть наряд-задание если на плане ниводной работе не подвязан реальный человек.

          humenItemFilter := ENHumenItemFilter.Create;
          SetNullIntProps(humenItemFilter);
          SetNullXSProps(humenItemFilter);
        

        if HumenItemFilter.planRef = nil then HumenItemFilter.planRef := ENPlanWorkRef.Create;
        HumenItemFilter.planRef.code := ENPlanWorkObj.code;

        HumenItemFilter.conditionSQL := 'enhumenitem.planitemrefcode in ('+
                                'select enplanworkitem.code from enplanworkitem where enplanworkitem.planrefcode ='+ IntToStr(ENPlanWorkObj.code) +
                                ' and enplanworkitem.countgen<>0'+
                                ') and enhumenitem.finworkercode is not null ';

        HumenItemFilter.orderBySQL := 'enhumenitem.planitemrefcode';

        TempENHumenItem := HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;

        ENHumenItemList := TempENHumenItem.getScrollableFilteredList(HumenItemFilter, 0, -1);

        if (High(ENHumenItemList.list) = -1) then
        begin
          Application.MessageBox(PChar('Друк Наряд-завдання неможливий додайте персонал на роботи ...!'), PChar('Увага!'), MB_ICONWARNING);
          exit;
        end;


         SetLength(argNames, 1);
         SetLength(args, 1);

         argnames[0] := 'planworkcode';
         args[0] := IntToStr(ENPlanWorkObj.code);

         reportName := 'Zavdannya_z_planu_A4/Main';
         makeReport(reportName, argNames, args, 'pdf');

         // Печать листа ОВБ если в плане есть работы с определенными кодами
         planWorkItemFilter := ENPlanWorkItemFilter.Create;
         SetNullXSProps(planWorkItemFilter);
         SetNullIntProps(planWorkItemFilter);
         if planWorkItemFilter.planRef = nil then planWorkItemFilter.planRef := ENPlanWorkRef.Create;
         planWorkItemFilter.planRef.code := ENPlanWorkObj.code;
         // SUPP-1417 - коды работ взяты со служебки
         condition := 'ENPLANWORKITEM.KARTAREFCODE IN (' +'500012655,' +
                                                  '500012592,' +
                                                  '500012593,' +
                                                  '500012594,' +
                                                  '500012652,' +
                                                  '500012653,' +
                                                  '500012654' + ')';
         planWorkItemFilter.conditionSQL := condition + ' AND ENPLANWORKITEM.COUNTGEN > 0';
         TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
         planWorkItemList := TempENPlanWorkItem.getScrollableFilteredList(planWorkItemFilter, 0, 1);
         if planWorkItemList.totalCount > 0 then
         begin
              SetLength(argNames, 1);
              SetLength(args, 1);

              argnames[0] := 'dull_parameter';
              args[0] := IntToStr(ENPlanWorkObj.code);

              reportName := 'Zavdannya_z_planu_A4/OVBList';
              makeReport(reportName, argNames, args, 'pdf');
         end;
         
end;


end.
