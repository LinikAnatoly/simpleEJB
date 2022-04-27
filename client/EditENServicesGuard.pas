
unit EditENServicesGuard;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
    EnergyproController, EnergyproController2, ENServicesObjectController, ENPlanWorkController,
    ExtCtrls, TB2Item, TB2Dock, TB2Toolbar , ShowENServicesGuard, Planner, ENPlanWorkStatusController,
    AdvObj, ShowRQOrg, ShowRQOrgRschet, ENCottageController, ENRentPeriod2ServicesController,
    PlannerMonthView, DBPlannerMonthView, PlannerCal, FKProvObjectController, ENElement2ENElementController;

type
    TfrmENServicesGuardEdit = class(TDialogForm)
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
    btnPrintContract4Rent: TButton;
    actPrintCalculation: TAction;
    HTTPRIOENPlanWork2ClassificationType: THTTPRIO;
    pnlDistance: TPanel;
    edtContractServicesDistance: TEdit;
    lblContractServicesDistance: TLabel;
    lblStatus: TLabel;
    edtStatus: TEdit;
    actBudgetApproved: TAction;
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
    ToolButton3: TToolButton;
    actPrintKoshtoris: TAction;
    pmPlanWork2ClassificationType: TPopupMenu;
    miPrintCalcNkre: TMenuItem;
    actPrintCalcNkre: TAction;
    HTTPRIOTKClassificationType: THTTPRIO;
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
    lbl2: TLabel;
    edtExecutorPhoneNumber: TEdit;
    HTTPRIOTKClassification2ENDepartment: THTTPRIO;
    spl1: TSplitter;
    pnl2: TPanel;
    sgENPlanWork2ClassificationType: TAdvStringGrid;
    spl2: TSplitter;
    sgENPlanWorkItem: TAdvStringGrid;
    lbl8: TLabel;
    edtDepartmentForServices: TEdit;
    btnENDepartmentDepartment: TSpeedButton;
    actInsertTimeLine: TAction;
    lblDeliveryOneWay: TLabel;
    Label6: TLabel;
    rgPayable: TRadioGroup;
    chbIsCustomerMaterials: TCheckBox;
    actActTransferSave: TAction;
    actActTransferPrint: TAction;
    actActTransferMoveToFK: TAction;
    actActTransferUnMoveToFK: TAction;
    HTTPRIOFINMaterials: THTTPRIO;
    HTTPRIOENElement: THTTPRIO;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Label9: TLabel;
    sgENSelectedPlanItems: TAdvStringGrid;
    ToolButton16: TToolButton;
    HTTPRIOENContragent: THTTPRIO;
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
    actDeleteCalculation: TAction;
    actEditCalculation: TAction;
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
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    HTTPRIOENPayment2SO: THTTPRIO;
    actRecalcDisrance: TAction;
    ToolButton17: TToolButton;
    ToolButton22: TToolButton;
    actCopyPlan: TAction;
    N11: TMenuItem;
    miPreConfirm: TMenuItem;
    miConfirm: TMenuItem;
    miUndoConfirm: TMenuItem;
    actPreConfirm: TAction;
    actConfirm: TAction;
    actUndoConfirm: TAction;
    actCreatingPlanForServices: TAction;
    actViewPlanForServices: TAction;
    actEditPlanForServices: TAction;
    actDeletePlanForServices: TAction;
    edtCommentServicesGen: TMemo;
    lblPriConnectionNumber: TLabel;
    edtCustomPlanDate: TDateTimePicker;
    gbPayments: TGroupBox;
    sgENPayment2SO: TAdvStringGrid;
    ToolBarPayment: TToolBar;
    btnViewPayment: TToolButton;
    btnInsertPayment: TToolButton;
    btnDeletePayment: TToolButton;
    btnEditPayment: TToolButton;
    btnUpdatePayment: TToolButton;
    gbBills: TGroupBox;
    ToolBar3: TToolBar;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    sgENSOBill: TAdvStringGrid;
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
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    sgENSOPayBillProv: TAdvStringGrid;
    HTTPRIOENSOPayBillProv: THTTPRIO;
    actCreateNewPostings: TAction;
    actEditPostings: TAction;
    tsPaymentSchedule: TTabSheet;
    HTTPRIOENServicesObject2PaymentSchedule: THTTPRIO;
    ToolBar5: TToolBar;
    ToolButton21: TToolButton;
    ToolButton26: TToolButton;
    ToolButton27: TToolButton;
    ToolButton28: TToolButton;
    ToolButton29: TToolButton;
    ToolButton30: TToolButton;
    ToolButton31: TToolButton;
    sgENServicesObject2PaymentSchedule: TAdvStringGrid;
    actAddSchedule: TAction;
    actEditSchedule: TAction;
    actDeleteSchedule: TAction;
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
    Panel2: TPanel;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem3: TTBItem;
    TBItem8: TTBItem;
    sgENAct: TAdvStringGrid;
    actEditAct: TAction;
    actViewAct: TAction;
    actAddRentItem: TAction;
    actEditRentItem: TAction;
    actDeleteRentItem: TAction;
    actViewRentItem: TAction;
    gbWarrantContrAgent: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtWarrantContrAgentNumber: TEdit;
    edtWarrantContrAgentFIO: TEdit;
    edtWarrantContrAgentDate: TDateTimePicker;
    actAddP04: TAction;
    actDeleteP04: TAction;
    actAddP10: TAction;
    actDeleteP10: TAction;
    HTTPRIOENElement2ENElement: THTTPRIO;
    tsCalcItem: TTabSheet;
    alCalcAdditionalItems: TActionList;
    actViewCAI: TAction;
    actInsertCAI: TAction;
    actDeleteCAI: TAction;
    actEditCAI: TAction;
    actUpdateCAI: TAction;
    pmCalcAdditionalItems: TPopupMenu;
    MenuItem2: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    HTTPRIOENServices2CalcAdditionalItems: THTTPRIO;
    ToolBar8: TToolBar;
    ToolButton35: TToolButton;
    ToolButton36: TToolButton;
    ToolButton37: TToolButton;
    ToolButton38: TToolButton;
    ToolButton39: TToolButton;
    sgENServices2CalcAdditionalItems: TAdvStringGrid;
    tsSecObj: TTabSheet;
    grpSecObj: TGroupBox;
    Splitter2: TSplitter;
    grpSecObjResp: TGroupBox;
    ToolBar6: TToolBar;
    ToolButton33: TToolButton;
    ToolButton34: TToolButton;
    btnEditSecObj: TToolButton;
    sgENSO2SecObject: TAdvStringGrid;
    HTTPRIOENSO2SecObject: THTTPRIO;
    ActionList2: TActionList;
    actInsertSecObj: TAction;
    actDeleteSecObj: TAction;
    actEditSecObj: TAction;
    PopupMenu2: TPopupMenu;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem20: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolBar7: TToolBar;
    btnInsertSecObjResp: TToolButton;
    btnDeleteSecObjResp: TToolButton;
    btnEditSecObjResp: TToolButton;
    sgENSO2SecObjectResp: TAdvStringGrid;
    HTTPRIOENSO2SecObjectResp: THTTPRIO;
    PopupMenu3: TPopupMenu;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    actInsertSecObjResp: TAction;
    actDeleteSecObjResp: TAction;
    actEditSecObjResp: TAction;

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
    procedure btnPrintContract4RentClick(Sender: TObject);
    procedure actBudgetApprovedExecute(Sender: TObject);
    procedure actUpdateObject(Sender: TObject);
    procedure spbWarrantNumberClick(Sender: TObject);
    procedure actViewENActIncomeExecute(Sender: TObject);
    procedure edtContractServicesPowerChange(Sender: TObject);
    procedure actPrintKoshtorisExecute(Sender: TObject);
    procedure actPrintCalcNkreExecute(Sender: TObject);
    procedure btnPostingsClick(Sender: TObject);
    procedure updateRezervedView();

    procedure sgDepartmentClick(Sender: TObject);
    procedure sgBrigadeInDepartmentClick(Sender: TObject);
    procedure edtReservedTimeStartChange(Sender: TObject);

    function getSumTimeWorkForCalculation(codePlan : Integer):Double;
    procedure actActTransferPrintExecute(Sender: TObject);
    procedure actActTransferMoveToFKExecute(Sender: TObject);
    procedure actActTransferUnMoveToFKExecute(Sender: TObject);
    procedure spbENResponsibleClick(Sender: TObject);
    procedure btnActPriPerCountersClick(Sender: TObject);
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
    procedure actEditENPlanWorkItemExecute(Sender: TObject);
    procedure actDeleteCalculationExecute(Sender: TObject);
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
    procedure actInsertCalculationExecute(Sender: TObject);
    procedure actEditCalculationExecute(Sender: TObject);
    procedure actAddBillExecute(Sender: TObject);
    procedure actDeleteBillExecute(Sender: TObject);
    procedure actEditBillExecute(Sender: TObject);
    procedure actUpdateBillExecute(Sender: TObject);
    procedure sgENSOBillClick(Sender: TObject);
    procedure actCreateNewPostingsExecute(Sender: TObject);
    procedure actEditPostingsExecute(Sender: TObject);
    procedure actAddScheduleExecute(Sender: TObject);
    procedure actDeleteScheduleExecute(Sender: TObject);
    procedure actEditScheduleExecute(Sender: TObject);
    procedure miPrintBillClick(Sender: TObject);
    procedure miPrintActClick(Sender: TObject);
    procedure btnPrintContract4RecoveryClick(Sender: TObject);
    procedure actEditActExecute(Sender: TObject);
    procedure actViewActExecute(Sender: TObject);
    procedure btnPrintContract4TUClick(Sender: TObject);
    procedure btnPrintContract4AgreeClick(Sender: TObject);
    procedure btnPrintContract4AccessClick(Sender: TObject);
    procedure cbbBasisTypeChange(Sender: TObject);
    procedure btnPrintAlterClick(Sender: TObject);
    procedure actViewCAIExecute(Sender: TObject);
    procedure actInsertCAIExecute(Sender: TObject);
    procedure actDeleteCAIExecute(Sender: TObject);
    procedure actEditCAIExecute(Sender: TObject);
    procedure actUpdateCAIExecute(Sender: TObject);
    procedure btnPrintRecoveryAlterWithCalcItemsClick(Sender: TObject);
    procedure actInsertSecObjExecute(Sender: TObject);
    procedure actDeleteSecObjExecute(Sender: TObject);
    procedure actEditSecObjExecute(Sender: TObject);
    procedure actInsertSecObjRespExecute(Sender: TObject);
    procedure actDeleteSecObjRespExecute(Sender: TObject);
    procedure actEditSecObjRespExecute(Sender: TObject);


  private
    { Private declarations }
    isVisitClient : Boolean;
    isJobsByTime  : Boolean;

    checkWarrant: Boolean;

    procedure SetFormCaption(elementCode: Integer);
    procedure SetActTransferVisibilityByStatus(servicesObjectStatus: Integer);
    function CheckCountersByClassifications(): Boolean;
    procedure updateBills(Sender: TObject);
    procedure updatePayments(Sender: TObject);
    procedure updateProvs(Sender: TObject);
    procedure updatePaymentSchedule(Sender : TObject);
    procedure updateAct(Sender : TObject);
    procedure updateItems(Sender : TObject);

    procedure plansPopup(plan: ENPlanWork);

    procedure updateSecObj(Sender: TObject);
    procedure updateSecObjResp(Sender: TObject);


  public
    { Public declarations }
    planCode : Integer;
    DepartmentForServicesCode : Integer;
    tempDeliveryOneWay : Integer;

    //PRIC-155
    contNumServ: String;
    guard : Boolean;
    isNotCalculated : Boolean;

    cottageCode : Integer;

  end;


var
  frmENServicesGuardEdit: TfrmENServicesGuardEdit;
  ENServicesGuardObj: ENServicesObject;

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

    BillColCount, BillLastCount: Integer;
    BillLastRow: Integer = 1;

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

  CAIColCount, CAILastCount: Integer;
  CAILastRow: Integer = 1;
  ENServices2CalcAdditionalItemsHeaders: array [1..5] of String =
        ( 'Код'
          , 'Найменування пункту розрахунку'
          ,'Сумма'
          ,'кол-во'
          ,'Примечание'
        );


  SecObjColCount, SecObjLastCount: Integer;
  SecObjLastRow: Integer = 1;
  ENSO2SecObjectHeaders: array [1..7] of String =
        ( 'Код'
          ,'Найменування об''єкту охорони'
          ,'Адреса об''єкту охорони'
          ,'Період охорони (годин на добу)'
          ,'Кількість постів охорони'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );

  SecObjRespColCount, SecObjRespLastCount: Integer;
  SecObjRespLastRow: Integer = 1;
  ENSO2SecObjectRespHeaders: array [1..6] of String =
        ( 'Код'
          ,'ПІП відвідального'
          ,'посада відвідального'
          ,'контактна інформація відвідального'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
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
  EditENPlanWork, ENPlanWorkKindController, ENActController, EditENAct,
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
  ENConnectionKindController, RQFKOrderController,
  RQFKOrderKindController, ENPayment2SOController, EditENPayment2SO,
  EditRecalcDistanceServicesConnection,ShowENPlanWork, ENPlanWorkStateController,
  ShowENCottage, EditENFamilySize2ServicesObject, ENFamilySize2ServicesObjectController,
  ENSOBillController, EditENSOBill, ENSOPayBillProvController,
  EditENSOPayBillProv, EditPostings4Bill, EditENServicesObject2PaymentSchedule,
  ENServicesObject2PaymentScheduleController, ENServicesContractKindController,
  ShowENServicesObject, ENElement2ENElementTypeController, printAgreeRentTU,
  ENServices2CalcAdditionalItemsController, EditENServices2CalcAdditionalItems,
  ENSO2SecObjectController, ENSO2SecObjectRespController, EditENSO2SecObject,
  EditENSO2SecObjectResp, ENPlanWorkClose;

{uses
    EnergyproController, EnergyproController2, ENServicesObjectController  ;
}
{$R *.dfm}
//  var
//  planItemFilter: ENPlanWorkItemFilter;





procedure TfrmENServicesGuardEdit.updateSecObjResp(Sender: TObject);
var
  TempENSO2SecObjectResp: ENSO2SecObjectRespControllerSoapPort;
  i: Integer;
  ENSO2SecObjectRespList: ENSO2SecObjectRespShortList;
  ENSO2SecObjRespFilter : ENSO2SecObjectRespFilter;
begin
  SetGridHeaders(ENSO2SecObjectRespHeaders, sgENSO2SecObjectResp.ColumnHeaders);
  TempENSO2SecObjectResp :=  HTTPRIOENSO2SecObjectResp as ENSO2SecObjectRespControllerSoapPort;

  ENSO2SecObjRespFilter := ENSO2SecObjectRespFilter.Create;
  SetNullIntProps(ENSO2SecObjRespFilter);
  SetNullXSProps(ENSO2SecObjRespFilter);
  ENSO2SecObjRespFilter.servicesObjectRef := ENServicesObjectRef.Create;
  ENSO2SecObjRespFilter.servicesObjectRef.code := ENServicesGuardObj.code;

  ENSO2SecObjectRespList := TempENSO2SecObjectResp.getScrollableFilteredList(ENSO2SecObjRespFilter,0,-1);
  SecObjRespLastCount:=High(ENSO2SecObjectRespList.list);

  if SecObjRespLastCount > -1 then
     sgENSO2SecObjectResp.RowCount:=SecObjRespLastCount+2
  else
     sgENSO2SecObjectResp.RowCount:=2;

   with sgENSO2SecObjectResp do
    for i:=0 to SecObjRespLastCount do
      begin
        Application.ProcessMessages;
        if ENSO2SecObjectRespList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSO2SecObjectRespList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSO2SecObjectRespList.list[i].responsibleName;
        Cells[2,i+1] := ENSO2SecObjectRespList.list[i].responsiblePosition;
        Cells[3,i+1] := ENSO2SecObjectRespList.list[i].responsibleContactInfo;
        Cells[4,i+1] := ENSO2SecObjectRespList.list[i].userGen;
        if ENSO2SecObjectRespList.list[i].dateEdit = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDateTimeWithDate2String(ENSO2SecObjectRespList.list[i].dateEdit);
        SecObjRespLastRow:=i+1;
        sgENSO2SecObjectResp.RowCount:=SecObjRespLastRow+1;
      end;

end;



procedure TfrmENServicesGuardEdit.updateSecObj(Sender: TObject);
var
  TempENSO2SecObject: ENSO2SecObjectControllerSoapPort;
  i: Integer;
  ENSO2SecObjectList: ENSO2SecObjectShortList;
  ENSO2SecObjFilter : ENSO2SecObjectFilter;
begin
  SetGridHeaders(ENSO2SecObjectHeaders, sgENSO2SecObject.ColumnHeaders);
  TempENSO2SecObject :=  HTTPRIOENSO2SecObject as ENSO2SecObjectControllerSoapPort;

  ENSO2SecObjFilter := ENSO2SecObjectFilter.Create;
  SetNullIntProps(ENSO2SecObjFilter);
  SetNullXSProps(ENSO2SecObjFilter);

  ENSO2SecObjFilter.servicesObjectRef := ENServicesObjectRef.Create;
  ENSO2SecObjFilter.servicesObjectRef.code := ENServicesGuardObj.code;

  ENSO2SecObjectList := TempENSO2SecObject.getScrollableFilteredList(ENSO2SecObjFilter,0,-1);
  SecObjLastCount:=High(ENSO2SecObjectList.list);

  if SecObjLastCount > -1 then
     sgENSO2SecObject.RowCount:=SecObjLastCount+2
  else
     sgENSO2SecObject.RowCount:=2;

   with sgENSO2SecObject do
    for i:=0 to SecObjLastCount do
      begin
        Application.ProcessMessages;
        if ENSO2SecObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSO2SecObjectList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSO2SecObjectList.list[i].securityObj;
        Cells[2,i+1] := ENSO2SecObjectList.list[i].securityObjAddress;
        if ENSO2SecObjectList.list[i].securityPeriod = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENSO2SecObjectList.list[i].securityPeriod.DecimalString;
        if ENSO2SecObjectList.list[i].guardPost = Low(Integer) then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := IntToStr(ENSO2SecObjectList.list[i].guardPost);
        Cells[5,i+1] := ENSO2SecObjectList.list[i].userGen;
        if ENSO2SecObjectList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDateTimeWithDate2String(ENSO2SecObjectList.list[i].dateEdit);
        SecObjLastRow:=i+1;
        sgENSO2SecObject.RowCount:=SecObjLastRow+1;
      end;

end;

procedure TfrmENServicesGuardEdit.updateAct(Sender : TObject);
 var
  TempENAct: ENActControllerSoapPort;
  actFilter: ENActFilter;
  ENActList: ENActShortList;
  actDate: String;
  i : Integer;

begin
   ClearGrid(sgENAct);

    if ENServicesGuardObj = nil then Exit;
    if ENServicesGuardObj.element = nil then Exit;
    if ENServicesGuardObj.element.code = LOW_INT then Exit;

    actDate := '';

    TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

    actFilter := ENActFilter.Create;
    SetNullIntProps(actFilter);
    SetNullXSProps(actFilter);
    actFilter.element := ENElement.Create;
    actFilter.element.code := ENServicesGuardObj.element.code;

    ENActList := TempENAct.getScrollableFilteredList(actFilter, 0, -1);

    LastCount := High(ENActList.list);

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

    sgENAct.Row := 1;
end;

procedure TfrmENServicesGuardEdit.updatePaymentSchedule(Sender : TObject);
var
  TempENServicesObject2PaymentSchedule: ENServicesObject2PaymentScheduleControllerSoapPort;
  i: Integer;
  ENServicesObject2PaymentScheduleList: ENServicesObject2PaymentScheduleShortList;
  payScheduleFilter : ENServicesObject2PaymentScheduleFilter;
  begin
  ClearGrid(sgENServicesObject2PaymentSchedule);
  SetGridHeaders(ENServicesObject2PaymentScheduleHeaders, sgENServicesObject2PaymentSchedule.ColumnHeaders);
  TempENServicesObject2PaymentSchedule :=  HTTPRIOENServicesObject2PaymentSchedule as ENServicesObject2PaymentScheduleControllerSoapPort;

  payScheduleFilter := ENServicesObject2PaymentScheduleFilter.Create;
  SetNullIntProps(payScheduleFilter);
  SetNullXSProps(payScheduleFilter);
  payScheduleFilter.servicesObjectRef := ENServicesObjectRef.Create;
  payScheduleFilter.servicesObjectRef.code := ENServicesGuardObj.code;

  ENServicesObject2PaymentScheduleList := TempENServicesObject2PaymentSchedule.getScrollableFilteredList(payScheduleFilter,0,-1);

  scheduleLastCount:=High(ENServicesObject2PaymentScheduleList.list);

  if scheduleLastCount > -1 then
     sgENServicesObject2PaymentSchedule.RowCount:=scheduleLastCount+2
  else
     sgENServicesObject2PaymentSchedule.RowCount:=2;

   with sgENServicesObject2PaymentSchedule do
    for i:=0 to scheduleLastCount do
      begin
        Application.ProcessMessages;
        if ENServicesObject2PaymentScheduleList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENServicesObject2PaymentScheduleList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENServicesObject2PaymentScheduleList.list[i].startDate = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(ENServicesObject2PaymentScheduleList.list[i].startDate);
        if ENServicesObject2PaymentScheduleList.list[i].endDate = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENServicesObject2PaymentScheduleList.list[i].endDate);
        if ENServicesObject2PaymentScheduleList.list[i].paySum = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENServicesObject2PaymentScheduleList.list[i].paySum.DecimalString;
        scheduleLastRow:=i+1;
        sgENServicesObject2PaymentSchedule.RowCount:=scheduleLastRow+1;
      end;
   scheduleColCount:=scheduleColCount+1;
   sgENServicesObject2PaymentSchedule.Row:=1;
end;

procedure  TfrmENServicesGuardEdit.updateProvs(Sender : TObject);
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


procedure  TfrmENServicesGuardEdit.updatePayments(Sender: TObject);
var
  TempENPayment2SO: ENPayment2SOControllerSoapPort;
  ENPayment2SOList: ENPayment2SOShortList;
  FilterPayment2SO : ENPayment2SOFilter;

  i, billCode : Integer;
begin
    SetGridHeaders(ENPayment2SOHeaders, sgENPayment2SO.ColumnHeaders);
    ClearGrid(sgENPayment2SO);

    if ENServicesGuardObj = nil then Exit;
    if ENServicesGuardObj.element = nil then Exit;
    if ENServicesGuardObj.element.code = LOW_INT then Exit;

    TempENPayment2SO :=  HTTPRIOENPayment2SO as ENPayment2SOControllerSoapPort;

     FilterPayment2SO := ENPayment2SOFilter.Create;
     SetNullIntProps(FilterPayment2SO);
     SetNullXSProps(FilterPayment2SO);

     FilterPayment2SO.servicesObjectRef := ENServicesObjectRef.Create;
     FilterPayment2SO.servicesObjectRef.code :=  ENServicesGuardObj.code;

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

procedure TfrmENServicesGuardEdit.updateBills(Sender: TObject);
Var l, j: Integer;
  TempENSOBill: ENSOBillControllerSoapPort;
  i: Integer;
  ENSOBillList: ENSOBillShortList;
  billFilter : ENSOBillFilter;
begin

   ClearGrid(sgENSOBill);

   SetGridHeaders(ENSOBillHeaders, sgENSOBill.ColumnHeaders);
  TempENSOBill :=  HTTPRIOENSOBill as ENSOBillControllerSoapPort;

  billFilter := ENSOBillFilter.Create;
  SetNullIntProps(billFilter);
  SetNullXSProps(billFilter);

  billFilter.servicesObjectRef := ENServicesObjectRef.Create;
  billFilter.servicesObjectRef.code := ENServicesGuardObj.code;

  ENSOBillList := TempENSOBill.getScrollableFilteredList(billFilter,0,-1);

  BillLastCount:=High(ENSOBillList.list);

  if BillLastCount > -1 then
     sgENSOBill.RowCount:=BillLastCount+2
  else
     sgENSOBill.RowCount:=2;

   with sgENSOBill do
    for i:=0 to BillLastCount do
      begin
        Application.ProcessMessages;
        if ENSOBillList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSOBillList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENSOBillList.list[i].dateGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(ENSOBillList.list[i].dateGen);
        if ENSOBillList.list[i].sumTotal = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENSOBillList.list[i].sumTotal.DecimalString;
        if ENSOBillList.list[i].sumGen = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENSOBillList.list[i].sumGen.DecimalString;
        if ENSOBillList.list[i].sumVat = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENSOBillList.list[i].sumVat.DecimalString;
        Cells[5,i+1] := ENSOBillList.list[i].userGen;
        if ENSOBillList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDateTimeWithDate2String(ENSOBillList.list[i].dateEdit);
        BillLastRow:=i+1;
        sgENSOBill.RowCount:=BillLastRow+1;
      end;
   sgENSOBill.Row:=1;

end;


procedure TfrmENServicesGuardEdit.updateItems(Sender: TObject);


begin



end;


procedure TfrmENServicesGuardEdit.FormShow(Sender: TObject);
var
  warrant : ENWarrant;
  TempENPlanWork2ClassificationType: ENPlanWork2ClassificationTypeControllerSoapPort;
  plan2ctFilter: ENPlanWork2ClassificationTypeFilter;
  plan2ctList: ENPlanWork2ClassificationTypeShortList;
  TempTKClassificationType: TKClassificationTypeControllerSoapPort;
  ctObj: TKClassificationType;

  TempTKClassification2ENDepartment: TKClassification2ENDepartmentControllerSoapPort;
  TempTKClassification2ENDepartmentFilter : TKClassification2ENDepartmentFilter;
  TempTKClassification2ENDepartmentList : TKClassification2ENDepartmentShortList;

  LastCountVb , vi: Integer;

  TempENTimeLine: ENTimeLineControllerSoapPort;
  ti: Integer;
  ENTimeLineList: ENTimeLineShortList;
  tempENTimeLineFilter : ENTimeLineFilter;
begin
  lblCode.Visible := (DialogState <> dsInsert);
  edtCode.Visible := (DialogState <> dsInsert);

  isJobsByTime:= False;
  isVisitClient:= False;

  DepartmentForServicesCode := -1;

  SetGridHeaders(ENPlanWorkItemHeaders, sgENPlanWorkItem.ColumnHeaders);
  SetGridHeaders(TKClassificationTypeHeaders, sgENPlanWork2ClassificationType.ColumnHeaders);
  SetGridHeaders(ENPlanWorkHeaders, sgENPlanWork.ColumnHeaders);
  SetGridHeaders(ENPlanWorkItemHeaders, sgENSelectedPlanItems.ColumnHeaders);

  pcCalculation.ActivePage := tsGeneral;

  DisableControls([edtWarrantNumber, edtWarrantFIO, edtCommentGen,
    edtFinDocID, edtName, edtPartnerCode, edtContractNumber, edtContractDateFin
    ]);

  btnPrintContract4Rent.Visible := false;

  tsPlans.TabVisible := False;
  tsActs.TabVisible := False;
  tsPayment.TabVisible := False;
  tsListWork.TabVisible := True;


   if (DialogState = dsInsert) then
  begin
    pcCalculation.ActivePage := tsListWork;
    tsGeneral.TabVisible := False;
    tsPaymentSchedule.TabVisible := False;
    tsListWork.TabVisible := True;
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

    DisableActions([{actInsert, actEdit, actDelete, } actFilter, actNoFilter,
                    {actEditPlan, }actBudgetApproved]);

    DisableActions([actInsertPlan, actEditPlan, actDeletePlan,
                    actClosePlan, actUnClosePlan{, actFinishPlan, actUndoFinishPlan}]);

    DisableActions([actInsertCalculation, actDeleteCalculation, actEditCalculation, actEditENPlanWorkItem]);
  end;

  DisableControls([ edtENDepartmentDepartmentName, edtContractNumberServices, edtStatus]);

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

      ///// 28.07.10
      if ENServicesGuardObj.finDocID = LOW_INT then
      begin
        DisableControls([{edtContractNumber, }spbContractNumberSelect], false);
        DenyBlankValues([edtContractNumber]);
      end;
      /////

      ///// 16.05.13 NET-4235
      // btnPrintFactCalc.Visible := (ENServicesGuardObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT);
      /////
  end;

  if DialogState = dsInsert then
     begin
      edtContractNumberServices.Text := 'Auto';

     end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin


    planCode := DMReports.getPlanCodeForCalculationByElement(ENServicesGuardObj.element.code);

    if  ENServicesGuardObj.warrantRef.code <> LOW_INT then
    begin
      warrant := DMReports.getWarrantByCode(ENServicesGuardObj.warrantRef.code);

      edtWarrantNumber.Text := warrant.numbergen;
      edtWarrantFIO.Text := warrant.warrantFIO;
    end;

    if (ENServicesGuardObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
    begin
       DisableControls([edtContractServicesDistance]);

       //DisableActions([actInsert, actEdit, actDelete]);
       DisableActions([actInsertCalculation, actInsertPlan,
                       actEditCalculation, actEditPlan, actEditENPlanWorkItem,
                       actDeleteCalculation, actDeletePlan]);

       btnPrintContract4Rent.Visible := true;
       tsGeneral.TabVisible := true;
       //tsPlans.TabVisible := true;

    end;


    if (ENServicesGuardObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
    begin
      tsPlans.TabVisible := true; //(HTTPRIOENPlanWork2ClassificationType.HTTPWebNode.UserName = 'energynet');
      tsActs.TabVisible := false;
      tsPayment.TabVisible := false;
    end;

    if (ENServicesGuardObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_SIGNED) then
    begin
      tsActs.TabVisible := True;
      tsPayment.TabVisible := True;
    end;



    ////////////////////////////////////////////////////////////////////////////
    // 24.04.13 Все action'ы теперь разделены
    DisableActions([actInsertPlan, actDeletePlan, actEditPlan,
                    actClosePlan, actUnClosePlan, {actFinishPlan, actUndoFinishPlan,}
                    actEditENPlanWorkItem]);

    if (ENServicesGuardObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
    begin
      DisableActions([actInsertCalculation, actDeleteCalculation, actEditCalculation]);

      if not (ENServicesGuardObj.contractStatusRef.code in [ENSERVICESOBJECTSTATUS_COMPLETED,
                                                             ENSERVICESOBJECTSTATUS_TERMINATED]) then
      begin

        if guard then
        begin
          DisableActions([actInsertCalculation, actDeleteCalculation,
                          actEditCalculation, actEditENPlanWorkItem], false);

          // С планами даем работать только если договор не проведен в ФК
          if ENServicesGuardObj.statusRef.code <> ENSERVICESOBJECT_FINSTATUS_CLOSED then
            DisableActions([actInsertPlan, actDeletePlan, actEditPlan,
                            actClosePlan, actUnClosePlan], false);
        end;

      end;

    end; // if (ENServicesGuardObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED)

    edtCode.Text := IntToStr(ENServicesGuardObj.code);

    if (ENServicesGuardObj.contractNumber <> '') then
       edtContractNumber.Text := ENServicesGuardObj.contractNumber
    else
       edtContractNumber.Text := ENServicesGuardObj.contractNumberServices;

    if ENServicesGuardObj.contractDateServices <> nil then
    begin
      edtContractDateServices.DateTime:=EncodeDate(ENServicesGuardObj.contractDateServices.Year,ENServicesGuardObj.contractDateServices.Month,ENServicesGuardObj.contractDateServices.Day);
      edtContractDateServices.checked := true;
    end
    else
    begin
      edtContractDateServices.DateTime:=SysUtils.Date;
      edtContractDateServices.checked := false;
    end;

    if ENServicesGuardObj.contractDate <> nil then
    begin
      edtContractDateFin.DateTime:=EncodeDate(ENServicesGuardObj.contractDate.Year,ENServicesGuardObj.contractDate.Month,ENServicesGuardObj.contractDate.Day);
      edtContractDateFin.checked := true;
    end;

    edtContragentName.Text := ENServicesGuardObj.contragentName;
    MakeMultiline(edtContragentAddress.Lines, ENServicesGuardObj.contragentAddress);
    MakeMultiline(edtContragentPassport.Lines, ENServicesGuardObj.contragentPassport);
    edtContragentOkpo.Text := ENServicesGuardObj.contragentOkpo;
    edtContragentBossName.Text := ENServicesGuardObj.contragentBossName;
    edtContragentBankName.Text := ENServicesGuardObj.contragentBankName;
    edtContragentBankAccount.Text := ENServicesGuardObj.contragentBankAccount;
    edtContragentBankMfo.Text := ENServicesGuardObj.contragentBankMfo;
    edtENDepartmentDepartmentName.Text := ENServicesGuardObj.department.name;
    MakeMultiline(edtCommentGen.Lines, ENServicesGuardObj.commentGen);

    edtName.Text := ENServicesGuardObj.name;
    edtPartnerCode.Text := ENServicesGuardObj.partnerCode;
    edtFinDocCode.Text := ENServicesGuardObj.finDocCode;

    if ( ENServicesGuardObj.finDocID <> Low(Integer) ) then
       edtFinDocID.Text := IntToStr(ENServicesGuardObj.finDocID)
    else
       edtFinDocID.Text := '';

    MakeMultiline(edtCommentServicesGen.Lines, ENServicesGuardObj.commentServicesGen);

    if ( ENServicesGuardObj.contractServicesDistance <> nil ) then
       edtContractServicesDistance.Text := ENServicesGuardObj.contractServicesDistance.decimalString
    else
       edtContractServicesDistance.Text := '';

    if ENServicesGuardObj.executeWorkDate <> nil then
      begin
        edtExecuteWorkDate.DateTime:=EncodeDate(ENServicesGuardObj.executeWorkDate.Year,ENServicesGuardObj.executeWorkDate.Month,ENServicesGuardObj.executeWorkDate.Day);
        edtExecuteWorkDate.checked := true;
      end
    else
      begin
        edtExecuteWorkDate.DateTime:=SysUtils.Date;
        edtExecuteWorkDate.checked := false;
      end;
    if ENServicesGuardObj.timeStart <> nil then
      begin
        edtTimeStart.DateTime:= EncodeTime(ENServicesGuardObj.timeStart.Hour,ENServicesGuardObj.timeStart.Minute, 0, 0);
        //EncodeDate(ENTravelSheetObj.timeStart.Year,ENTravelSheetObj.timeStart.Month,ENTravelSheetObj.timeStart.Day);
        edtTimeStart.checked := true;
      end
      else
      begin
        edtTimeStart.DateTime:=SysUtils.Date;
        edtTimeStart.checked := false;
      end;

      if ENServicesGuardObj.timeFinal <> nil then
      begin
        edtTimeFinal.DateTime:= EncodeTime(ENServicesGuardObj.timeFinal.Hour,ENServicesGuardObj.timeFinal.Minute, 0, 0);
         //EncodeDate(ENTravelSheetObj.timeFinal.Year,ENTravelSheetObj.timeFinal.Month,ENTravelSheetObj.timeFinal.Day);
        edtTimeFinal.checked := true;
      end
      else
      begin
        edtTimeFinal.DateTime:=SysUtils.Date;
        edtTimeFinal.checked := false;
      end;

      edtContragentPhoneNumber.Text := ENServicesGuardObj.contragentPhoneNumber;
      edtExecutorPhoneNumber.Text := ENServicesGuardObj.executorPhoneNumber;

      rgContragentType.ItemIndex:= ENServicesGuardObj.contragentTypeRef.code-1;
      rgPayable.ItemIndex:= ENServicesGuardObj.isNoPay;

      edtContragentPosition.Text := ENServicesGuardObj.contragentPosition;

      edtWarrantContrAgentNumber.Text := ENServicesGuardObj.warrantNumber;
    edtWarrantContrAgentFIO.Text := ENServicesGuardObj.warrantFIO;

    if ENServicesGuardObj.warrantDate <> nil then
    begin
      edtWarrantContrAgentDate.DateTime:=EncodeDate(ENServicesGuardObj.warrantDate.Year,ENServicesGuardObj.warrantDate.Month,ENServicesGuardObj.warrantDate.Day);
      edtWarrantContrAgentDate.checked := true;
    end;

    /////////////////////////////
    // 21.09.12 NET-3079
    chbIsCustomerMaterials.Checked := (ENServicesGuardObj.isCustomerMaterials = ENSERVICESOBJECT_ISCUSTOMERMATERIALS);

    //planCode := DMReports.getPlanCodeForCalculationByElement(ENServicesGuardObj.element.code);
    ////////
    SetFormCaption(ENServicesGuardObj.element.code);
    ////////
    pcCalculationChange(Sender);

      //edtENElementElementName.Text := ENServicesGuardObj.element.name;
    DisableControls([edtDepartmentForServices,btnENDepartmentDepartment]);

    if ENServicesGuardObj.department.code <> LOW_INT then
       begin
         DepartmentForServicesCode:= ENServicesGuardObj.department.code;
         edtDepartmentForServices.Text := ENServicesGuardObj.department.shortName;
       end;

       DisableControls([edtExecuteWorkDate  , edtTimeStart  , edtTimeFinal ]);

    cbbBasisType.ItemIndex := -1;

    if (ENServicesGuardObj.basisType <> nil ) then
    begin
       try
         cbbBasisType.ItemIndex := StrToInt(ENServicesGuardObj.basisType.DecimalString);
       except
         on EConvertError do cbbBasisType.ItemIndex := -1;
       end;

            if (ENServicesGuardObj.basisType.DecimalString <> '3') and ( DialogState = dsEdit ) then
             DisableControls([edtWarrantContrAgentFIO , edtWarrantContrAgentNumber , edtWarrantContrAgentDate]);
      end

    else
      begin
       DisableControls([edtWarrantContrAgentFIO , edtWarrantContrAgentNumber , edtWarrantContrAgentDate]);
       cbbBasisType.ItemIndex := 0;
      end;

  end;

    DisableControls([edtDepartmentForServices]);
    DenyBlankValues([edtDepartmentForServices]);

    checkWarrant := true;

end;


procedure TfrmENServicesGuardEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENServicesObject: ENServicesObjectControllerSoapPort;
  startPeriodDate: TXSDate;
  endPeriodDate: TXSDate;
  tabNumber, FIO: string;
begin
  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

  if (ModalResult = mrOk) then
  if (DialogState = dsInsert) then
  begin

    begin
      ENServicesGuardObj.code:=low(Integer);
      //** +++ cottageCode, startDate, endDate, tabNumber   */

      TempENServicesObject.addForCalculation(ENServicesGuardObj,
        cottageCode, startPeriodDate, endPeriodDate, tabNumber, FIO);
    end;
  end else
  if (DialogState = dsEdit) then
  begin
    if (ENServicesGuardObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
      if edtcontractDateFin.checked then
      begin
        if ENServicesGuardObj.contractDate = nil then
          ENServicesGuardObj.contractDate := TXSDate.Create;
        ENServicesGuardObj.contractDate.XSToNative(GetXSDate(edtcontractDateFin.DateTime));
      end
      else begin
        Application.MessageBox(PChar('Введите дату договора!'),PChar('Внимание!'), MB_ICONWARNING);
        Action := caNone;
        ENServicesGuardObj.contractDate := nil;
        pcCalculation.ActivePage := tsGeneral;
        if edtcontractDateFin.CanFocus then
          edtcontractDateFin.SetFocus;
        Exit;
      end;

      if edtcontractDateServices.checked then
      begin
        if ENServicesGuardObj.contractDateServices = nil then
          ENServicesGuardObj.contractDateServices := TXSDate.Create;
        ENServicesGuardObj.contractDateServices.XSToNative(GetXSDate(edtcontractDateServices.DateTime));
      end
      else begin
        Application.MessageBox(PChar('Введите дату договора!'),PChar('Внимание!'), MB_ICONWARNING);
        Action := caNone;
        ENServicesGuardObj.contractDateServices := nil;
        pcCalculation.ActivePage := tsGeneral;
        if edtcontractDateServices.CanFocus then
          edtcontractDateServices.SetFocus;
        Exit;
      end;


      //////////////////////////////////////
      if (guard) then
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


      if (ENServicesGuardObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_DRAFT) then
        ENServicesGuardObj.name := ' '
      else
        ENServicesGuardObj.name := edtName.Text; // контрагент из фин договора

      ENServicesGuardObj.partnerCode := edtPartnerCode.Text;
      ENServicesGuardObj.finDocCode := edtFinDocCode.Text;

      if ( edtFinDocID.Text <> '' ) then
        ENServicesGuardObj.finDocID := StrToInt(edtFinDocID.Text)
      else
        ENServicesGuardObj.finDocID := Low(Integer) ;

      ENServicesGuardObj.commentGen := edtCommentGen.Text;

      ENServicesGuardObj.contractNumberServices := edtContractNumberServices.Text; // наш
      ENServicesGuardObj.contractNumber := edtContractNumber.Text;
      ENServicesGuardObj.contragentName := edtContragentName.Text; // контрагент услуги
      ENServicesGuardObj.contragentAddress := edtContragentAddress.Text;
      ENServicesGuardObj.contragentOkpo := edtContragentOkpo.Text;
      ENServicesGuardObj.contragentPosition := edtContragentPosition.Text;
      ENServicesGuardObj.contragentBankAccount := edtContragentBankAccount.Text;
      ENServicesGuardObj.contragentBankName := edtContragentBankName.Text;
      ENServicesGuardObj.contragentBankMfo := edtContragentBankMfo.Text;

      ENServicesGuardObj.contragentBossName := edtContragentBossName.Text;
      ENServicesGuardObj.contragentPassport := edtContragentPassport.Text;

      ENServicesGuardObj.commentServicesGen := edtCommentServicesGen.Text;

      if (ENServicesGuardObj.basisType = nil ) then
     ENServicesGuardObj.basisType := TXSDecimal.Create;
     if ( (cbbBasisType.ItemIndex <> -1 ) and  (cbbBasisType.ItemIndex <> 0) ) then
       ENServicesGuardObj.basisType.decimalString := IntToStr(cbbBasisType.itemIndex)
     else
       ENServicesGuardObj.basisType := nil;

     if (ENServicesGuardObj.contractKindRef = nil ) then
     ENServicesGuardObj.contractKindRef := ENServicesContractKindRef.Create;

      if edtexecuteWorkDate.checked then
      begin
        if ENServicesGuardObj.executeWorkDate = nil then
          ENServicesGuardObj.executeWorkDate := TXSDate.Create;
        ENServicesGuardObj.executeWorkDate.XSToNative(GetXSDate(edtexecuteWorkDate.DateTime));
      end
      else
        ENServicesGuardObj.executeWorkDate := nil;

      if edttimeStart.checked then
      begin
        if ENServicesGuardObj.timeStart = nil then
          ENServicesGuardObj.timeStart := TXSDateTime.Create;
        ENServicesGuardObj.timeStart.XSToNative(GetXSDateTime(edttimeStart.DateTime));
      end
      else
        ENServicesGuardObj.timeStart := nil;

      if edttimeFinal.checked then
      begin
        if ENServicesGuardObj.timeFinal = nil then
          ENServicesGuardObj.timeFinal := TXSDateTime.Create;
        ENServicesGuardObj.timeFinal.XSToNative(GetXSDateTime(edttimeFinal.DateTime));
      end
      else
        ENServicesGuardObj.timeFinal := nil;

      ENServicesGuardObj.contragentPhoneNumber := edtContragentPhoneNumber.Text;
     ENServicesGuardObj.executorPhoneNumber := edtExecutorPhoneNumber.Text;

      // 21.09.12 NET-3079
      ENServicesGuardObj.isCustomerMaterials := Ord(chbIsCustomerMaterials.Checked);
      // Если признак использования материалов заказчика сбросили, то нужно очистить
      // номер и дату акта приема-передачи
      if not chbIsCustomerMaterials.Checked then
      begin
        ENServicesGuardObj.actTransferNumber := '';
        ENServicesGuardObj.actTransferDate := nil;
      end;

      if (ENServicesGuardObj.lineLength = nil ) then
     ENServicesGuardObj.lineLength := TXSDecimal.Create;

     ENServicesGuardObj.warrantNumber := edtWarrantContrAgentNumber.Text;
      ENServicesGuardObj.warrantFIO := edtWarrantContrAgentFIO.Text;

      if edtWarrantContrAgentDate.checked then
      begin
        if ENServicesGuardObj.warrantDate = nil then
        ENServicesGuardObj.warrantDate := TXSDate.Create;
        ENServicesGuardObj.warrantDate.XSToNative(GetXSDate(edtWarrantContrAgentDate.DateTime));
      end
      else
      ENServicesGuardObj.warrantDate := nil;

      if DialogState = dsEdit then
      begin
        TempENServicesObject.saveForCalculation(ENServicesGuardObj)
      end;

   end;
end;


procedure TfrmENServicesGuardEdit.btnENDepartmentDepartmentClick(Sender : TObject);
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
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
              // if ENServicesGuardObj.department = nil then ENServicesGuardObj.department := ENDepartment.Create();
               DepartmentForServicesCode := ENDepartmentShort(tvDep.Selected.Data).code;
               edtDepartmentForServices.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
              // if  ENServicesGuardObj.element = nil then  ENServicesGuardObj.element := ENElement.Create;
              // if  ENServicesGuardObj.element.renRef = nil then ENServicesGuardObj.element.renRef := EPRenRef.Create;
              // ENServicesGuardObj.element.renRef.code := StrToInt(DMReports.getEPRenByDepartmentCode(ENServicesGuardObj.department.code));
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;



procedure TfrmENServicesGuardEdit.btnENElementElementClick(Sender : TObject);
var
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENServicesGuardObj.element = nil then ENServicesGuardObj.element := ENElement.Create();
               ENServicesGuardObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;



procedure TfrmENServicesGuardEdit.btnContractNumberSelectClick(Sender: TObject);
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

procedure TfrmENServicesGuardEdit.spbContractNumberSelectClick(
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
   f.conditionSQL := 'a.io_flag = ''S'' and a.agree_group_id in (' + AGREES_GROUPS_IDS + ')';

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


procedure TfrmENServicesGuardEdit.spbENDepartmentDepartmentClick(
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
               if ENServicesGuardObj.department = nil then ENServicesGuardObj.department := ENDepartment.Create();
               ENServicesGuardObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
               if  ENServicesGuardObj.element = nil then  ENServicesGuardObj.element := ENElement.Create;
               if  ENServicesGuardObj.element.renRef = nil then ENServicesGuardObj.element.renRef := EPRenRef.Create;
               ENServicesGuardObj.element.renRef.code := StrToInt(DMReports.getEPRenByDepartmentCode(ENServicesGuardObj.department.code));
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENServicesGuardEdit.actUpdateBillExecute(Sender: TObject);
Var i, j: Integer;
begin
updateBills(Sender);
end;

procedure TfrmENServicesGuardEdit.actUpdateCAIExecute(Sender: TObject);
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
     CAIFilter.servicesObjectRef.code := ENServicesGuardObj.code;


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

procedure TfrmENServicesGuardEdit.actUpdateExecute(Sender: TObject);
begin
  inherited;
  pcCalculationChange(self);
end;

procedure TfrmENServicesGuardEdit.actViewExecute(Sender: TObject);
Var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    TempENPlanWork: ENPlanWorkControllerSoapPort;
    TempENEstimateItem : ENEstimateItemControllerSoapPort;
    tPlan: ENPlanWork;
    objCode: Integer;
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


procedure TfrmENServicesGuardEdit.pcCalculationChange(
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
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  planFilter: ENPlanWorkFilter;
  ENPlanWorkList: ENPlanWorkShortList;
  n: Integer;
  /////
  TempENAct: ENActControllerSoapPort;
  actFilter: ENActFilter;
  ENActList: ENActShortList;
  actDate: String;

  TempENEstimateItem : ENEstimateItemControllerSoapPort;
  estimateItemFilter : ENEstimateItemFilter;
  ENEstimateItemList : ENEstimateItemShortList;

  strTechCondPlanCodes: String;

  TempENActIncomeTechConditions : ENActIncomeTechConditionsControllerSoapPort;
begin



  if pcCalculation.ActivePage = tsListWork then
  begin
    ////////////////////////////////////////////////////////////////////////////
    ClearGrid(sgENPlanWork2ClassificationType);

    if planCode = LOW_INT then Exit;

    TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;

    plan2ctFilter := ENPlanWork2ClassificationTypeFilter.Create;
    SetNullIntProps(plan2ctFilter);
    SetNullXSProps(plan2ctFilter);

    if guard then
    begin
      plan2ctFilter.conditionSQL := 'planrefcode in (select p.code from enplanwork p where p.elementrefcode = ' +
        IntToStr(ENServicesGuardObj.element.code) + ' and p.kindcode = ' + IntToStr(ENPLANWORKKIND_CALCULATION) + ')';
    end
    else begin
      plan2ctFilter.planRef := ENPlanWorkRef.Create;
      plan2ctFilter.planRef.code := planCode;
    end;

    ENPlanWork2ClassificationTypeList := TempENPlanWork2ClassificationType.getScrollableFilteredList(plan2ctFilter, 0, -1);

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

    if guard then
    begin
      planItemFilter.conditionSQL := 'planrefcode in (select p.code from enplanwork p where p.elementrefcode = ' +
        IntToStr(ENServicesGuardObj.element.code) + ' and p.kindcode = ' + IntToStr(ENPLANWORKKIND_CALCULATION) + ')';
    end
    else begin
      if planItemFilter.planRef = nil then planItemFilter.planRef := ENPlanWorkRef.Create;
      planItemFilter.planRef.code := planCode; //DMReports.getPlanCodeByElement(ENServicesGuardObj.element.code); // выбрать по коду элемента код плана  ENPlanWorkObj.code;
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


  end; // if pcCalculation.ActivePage = tsListWork

  if pcCalculation.ActivePage = tsPlans then
  begin
    ClearGrid(sgENPlanWork);

    if ENServicesGuardObj = nil then Exit;
    if ENServicesGuardObj.element = nil then Exit;
    if ENServicesGuardObj.element.code = LOW_INT then Exit;

    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    planFilter := ENPlanWorkFilter.Create;
    SetNullIntProps(planFilter);
    SetNullXSProps(planFilter);

    planFilter.elementRef := ENElementRef.Create;
    planFilter.elementRef.code := ENServicesGuardObj.element.code;

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
  end; // if pcCalculation.ActivePage = tsPlans

  if pcCalculation.ActivePage = tsActs then
  begin

    updateAct(Sender);

  end; // if pcCalculation.ActivePage = tsActs

  if pcCalculation.ActivePage = tsCalcItem then
  begin
     actUpdateCAIExecute(Sender);
  end;

  //SUPP-5060
  if pcCalculation.ActivePage = tsPayment then
  begin
     updateBills(Sender);
     updatePayments(sender);
     updateProvs(Sender);
  end;

  if pcCalculation.ActivePage = tsPaymentSchedule then
  begin
     updatePaymentSchedule(Sender);
  end;

  if pcCalculation.ActivePage = tsSecObj then
  begin
     updateSecObj(Sender);
     updateSecObjResp(Sender);
  end;

end;

procedure TfrmENServicesGuardEdit.FormCreate(Sender: TObject);
begin
  inherited;
  planCode := LOW_INT;
  guard := false;
  checkWarrant := true;
  isNotCalculated := True;
end;


procedure TfrmENServicesGuardEdit.actPrintCalculationExecute( Sender: TObject);
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

          ENPlanWork2ClassificationTypeCode := StrToInt(sgENPlanWork2ClassificationType.Cells[0, sgENPlanWork2ClassificationType.Row]);
          TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;
          pw2ctObj := TempENPlanWork2ClassificationType.getObject(ENPlanWork2ClassificationTypeCode);

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'plancode';

  if (DialogState = dsInsert) then
     args[0] := IntToStr(planCode)
  else

   begin
    if (pw2ctObj = nil) then Exit;
    args[0] := IntToStr(pw2ctObj.planRef.code);
  end;

  reportName := '201109/ActCalcAdditionalWorkG/ActCalc';

  makeReport(reportName , argNames , args , 'xls');
end;

procedure TfrmENServicesGuardEdit.SetFormCaption(elementCode: Integer);
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

      if (guard) then
        Self.Caption := 'Договори на охорону. Договір № ' + servicesObjList.list[0].contractNumberServices
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

 
procedure TfrmENServicesGuardEdit.btnPrintContract4AccessClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  if ENServicesGuardObj = nil then Exit;
  if ENServicesGuardObj.contractTypeRef = nil then Exit;
  if ENServicesGuardObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesGuardObj.calcTypeRef = nil then Exit;
  if ENServicesGuardObj.calcTypeRef.code = LOW_INT then Exit;
  if ENServicesGuardObj.contractStatusRef = nil then Exit;

  if ENServicesGuardObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'soCode';
    args[0] := IntToStr(ENServicesGuardObj.code);

    reportName := 'Services/4Rent/d_access';

    makeReport(reportName, argNames, args, 'pdf');

end;

procedure TfrmENServicesGuardEdit.btnPrintContract4AgreeClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  if ENServicesGuardObj = nil then Exit;
  if ENServicesGuardObj.contractTypeRef = nil then Exit;
  if ENServicesGuardObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesGuardObj.calcTypeRef = nil then Exit;
  if ENServicesGuardObj.calcTypeRef.code = LOW_INT then Exit;
  if ENServicesGuardObj.contractStatusRef = nil then Exit;

  if ENServicesGuardObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'soCode';
    args[0] := IntToStr(ENServicesGuardObj.code);

    reportName := 'Services/4Rent/d_agree';

    makeReport(reportName, argNames, args, 'pdf');

end;

procedure TfrmENServicesGuardEdit.btnPrintContract4RecoveryClick(
  Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  if ENServicesGuardObj = nil then Exit;
  if ENServicesGuardObj.contractTypeRef = nil then Exit;
  if ENServicesGuardObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesGuardObj.calcTypeRef = nil then Exit;
  if ENServicesGuardObj.calcTypeRef.code = LOW_INT then Exit;
  if ENServicesGuardObj.contractStatusRef = nil then Exit;

  if ENServicesGuardObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'soCode';
    args[0] := IntToStr(ENServicesGuardObj.code);

    reportName := 'Services/4Rent/d_recovery';

    makeReport(reportName, argNames, args, 'pdf');

end;


procedure TfrmENServicesGuardEdit.btnPrintContract4RentClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  if ENServicesGuardObj = nil then Exit;
  if ENServicesGuardObj.contractTypeRef = nil then Exit;
  if ENServicesGuardObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesGuardObj.calcTypeRef = nil then Exit;
  if ENServicesGuardObj.calcTypeRef.code = LOW_INT then Exit;
  if ENServicesGuardObj.contractStatusRef = nil then Exit;
  if ENServicesGuardObj.contractKindRef = nil then Exit;
  if ENServicesGuardObj.contractKindRef.code = LOW_INT then Exit;

  if ENServicesGuardObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'soCode';
    args[0] := IntToStr(ENServicesGuardObj.code);

    if (ENServicesGuardObj.contractKindRef.code = SERVICES_CONTRACT_KIND_OHRINA)then
    begin
      reportName := 'Services/4Guard/agree';
      makeReport(reportName, argNames, args, 'pdf');

      reportName := 'Services/4Guard/protocol';
      makeReport(reportName, argNames, args, 'pdf');

      reportName := 'Services/4Guard/secObj';
      makeReport(reportName, argNames, args, 'pdf');

      reportName := 'Services/4Guard/secObjResp';
      makeReport(reportName, argNames, args, 'pdf');
    end;


end;




procedure TfrmENServicesGuardEdit.btnPrintContract4TUClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  if ENServicesGuardObj = nil then Exit;
  if ENServicesGuardObj.contractTypeRef = nil then Exit;
  if ENServicesGuardObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesGuardObj.calcTypeRef = nil then Exit;
  if ENServicesGuardObj.calcTypeRef.code = LOW_INT then Exit;
  if ENServicesGuardObj.contractStatusRef = nil then Exit;

  if ENServicesGuardObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'soCode';
    args[0] := IntToStr(ENServicesGuardObj.code);

    reportName := 'Services/4Rent/d_TU';

    makeReport(reportName, argNames, args, 'pdf');

end;

procedure TfrmENServicesGuardEdit.btnPrintActClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
  copystr: String;
begin
  inherited;
  if ENServicesGuardObj = nil then Exit;
  if ENServicesGuardObj.contractTypeRef = nil then Exit;
  if ENServicesGuardObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesGuardObj.calcTypeRef = nil then Exit;
  if ENServicesGuardObj.calcTypeRef.code = LOW_INT then Exit;

  /////
  if ENServicesGuardObj.contractStatusRef = nil then Exit;
  if ENServicesGuardObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'soCode';
  args[0] := IntToStr(ENServicesGuardObj.code);

  reportName := '201109/ActDomikiServices/Act21';
  makeReport(reportName , argNames , args , 'pdf');
end;


procedure TfrmENServicesGuardEdit.btnPrintActTechAgreementClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
begin
  inherited;
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'servicesObjectCode';
  args[0] := IntToStr(ENServicesGuardObj.code);

  reportName := 'TechConditions/TechAgreement/act';
  makeReport(reportName, argNames, args, 'pdf');
end;


procedure TfrmENServicesGuardEdit.btnPrintAlterClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  if ENServicesGuardObj = nil then Exit;
  if ENServicesGuardObj.contractTypeRef = nil then Exit;
  if ENServicesGuardObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesGuardObj.calcTypeRef = nil then Exit;
  if ENServicesGuardObj.calcTypeRef.code = LOW_INT then Exit;
  if ENServicesGuardObj.contractStatusRef = nil then Exit;
  if ENServicesGuardObj.contractKindRef = nil then Exit;
  if ENServicesGuardObj.contractKindRef.code = LOW_INT then Exit;

  if ENServicesGuardObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'soCode';
    args[0] := IntToStr(ENServicesGuardObj.code);

    if ENServicesGuardObj.contractKindRef.code = SERVICES_CONTRACT_KIND_OKSN_RENT then
    begin
    reportName := 'Services/4Rent/d_rent_alter';
    makeReport(reportName, argNames, args, 'pdf');
    end;

    if ENServicesGuardObj.contractKindRef.code = SERVICES_CONTRACT_KIND_OKSN_WORK then
    begin
    reportName := 'Services/4Rent/d_recovery_alter';
    makeReport(reportName, argNames, args, 'pdf');
    end;

    if ENServicesGuardObj.contractKindRef.code = SERVICES_CONTRACT_KIND_OKSN_ACCESS then
    begin
    reportName := 'Services/4Rent/d_access_alter';
    makeReport(reportName, argNames, args, 'pdf');
    end;

end;

procedure TfrmENServicesGuardEdit.actBudgetApprovedExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := ENServicesGuardObj.code;
  except
    on EConvertError do Exit;
  end;

  if (ENServicesGuardObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
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


procedure TfrmENServicesGuardEdit.actUpdateObject(Sender: TObject);
Var TempServicesObject: ENServicesObjectControllerSoapPort;
    ObjCode: Integer;
begin
  if pcCalculation.ActivePage = tsListWork then
  begin
    TempServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
    ENServicesGuardObj := TempServicesObject.getObject(ENServicesGuardObj.code);
    actUpdateExecute(Sender);
  end;
end;

procedure TfrmENServicesGuardEdit.spbWarrantNumberClick(
  Sender: TObject);
var frmENWarrantShow : TfrmENWarrantShow;
    f : ENWarrantFilter;
    warrant : ENWarrant;
    datContract, datWarrant : TXSDate;
    dtdatContract, dtdatWarrant : TDateTime;
    power: Double;
begin
  if not guard then
  begin
     datContract := TXSDate.Create;
     datWarrant := TXSDate.Create;

     f := ENWarrantFilter.Create();
     SetNullXSProps(f);
     SetNullIntProps(f);
     f.departmentRef := ENDepartmentRef.Create();
     f.departmentRef.code := ENServicesGuardObj.department.code;
     f.conditionSQL := ' warrantstatusrefcode = 0';

     frmENWarrantShow := TfrmENWarrantShow.Create(Application,fmNormal, f);
     DisableActions([frmENWarrantShow.actNoFilter]);

     try
        with frmENWarrantShow do
          if ShowModal = mrOk then
          begin
              try

                 ENServicesGuardObj.warrantRef := ENWarrantRef.Create();
                 ENServicesGuardObj.warrantRef.code := StrToInt(GetReturnValue(sgENWarrant,0));

                  //////////////////////////////////////////////////////
                  ///   проверка даты доверенности с датой договора  ///
                  ///     суммы в доверенности с суммой договора     ///
                  //////////////////////////////////////////////////////

                  if  ENServicesGuardObj.warrantRef.code <> LOW_INT then
                  begin
                    warrant := DMReports.getWarrantByCode(ENServicesGuardObj.warrantRef.code);

                    datContract.XSToNative(GetXSDate(Self.edtContractDateServices.DateTime));
                    dtdatContract := EncodeDate(datContract.Year, datContract.Month, datContract.Day);
                    dtdatWarrant := EncodeDate(warrant.dateFinal.Year, warrant.dateFinal.Month, warrant.dateFinal.Day);

                    if (warrant.warrantStatusRef.code = WARRANT_INVALID) then
                    begin
                      Application.MessageBox(PChar('Довіреність недійсна!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                        edtWarrantNumber.Text := '';
                        edtWarrantFIO.Text := '';
                        ENServicesGuardObj.warrantRef.code := LOW_INT;
                      Exit;
                    end;

                    if (dtdatContract > dtdatWarrant) then
                    begin
                      Application.MessageBox(PChar('Термін дії довіреності закінчився!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                        edtWarrantNumber.Text := '';
                        edtWarrantFIO.Text := '';
                        ENServicesGuardObj.warrantRef.code := LOW_INT;
                      Exit;
                    end;

                    if (StrToFloat(ENServicesGuardObj.contractServicesSumma.DecimalString) > StrToFloat(warrant.maxSum.DecimalString)) then
                    begin
                      Application.MessageBox(PChar('Сума у договорі перевищує гранічну суму у довіреності!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                        edtWarrantNumber.Text := '';
                        edtWarrantFIO.Text := '';
                        ENServicesGuardObj.warrantRef.code := LOW_INT;
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

  end // if not priconnections 
  else begin
    power := 0;

    if power <= 5 then
    begin
      if ENServicesGuardObj.department = nil then
      begin
        Application.MessageBox(PChar('Спочатку оберіть підрозділ!'), PChar('Увага !'), MB_ICONWARNING);
        edtENDepartmentDepartmentName.SetFocus;
        Exit;
      end;

      if ENServicesGuardObj.department.code = LOW_INT then
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
       f.departmentRef.code := ENServicesGuardObj.department.code;

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
          (ENServicesGuardObj.department.code = ENDEPARTMENT_HGES) then
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

                 ENServicesGuardObj.warrantRef := ENWarrantRef.Create();
                 ENServicesGuardObj.warrantRef.code := StrToInt(GetReturnValue(sgENWarrant,0));

                  //////////////////////////////////////////////////////
                  ///   проверка даты доверенности с датой договора  ///
                  ///     суммы в доверенности с суммой договора     ///
                  //////////////////////////////////////////////////////

                  if ENServicesGuardObj.warrantRef.code <> LOW_INT then
                  begin
                    warrant := DMReports.getWarrantByCode(ENServicesGuardObj.warrantRef.code);

                    datContract.XSToNative(GetXSDate(Self.edtContractDateServices.DateTime));
                    dtdatContract := EncodeDate(datContract.Year, datContract.Month, datContract.Day);
                    dtdatWarrant := EncodeDate(warrant.dateFinal.Year, warrant.dateFinal.Month, warrant.dateFinal.Day);

                    if (warrant.warrantStatusRef.code = WARRANT_INVALID) then
                    begin
                      Application.MessageBox(PChar('Довіреність недійсна!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                        edtWarrantNumber.Text := '';
                        edtWarrantFIO.Text := '';
                        ENServicesGuardObj.warrantRef.code := LOW_INT;
                      Exit;
                    end;

                    if (dtdatContract > dtdatWarrant) then
                    begin
                      Application.MessageBox(PChar('Термін дії довіреності закінчився!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                        edtWarrantNumber.Text := '';
                        edtWarrantFIO.Text := '';
                        ENServicesGuardObj.warrantRef.code := LOW_INT;
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

  end; // if not priconnections .. else
end;


procedure TfrmENServicesGuardEdit.actViewActExecute(Sender: TObject);
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

procedure TfrmENServicesGuardEdit.actViewCAIExecute(Sender: TObject);
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

procedure TfrmENServicesGuardEdit.actViewENActIncomeExecute(
  Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  ///// 14.05.13 NET-4235
  // Печать акта приема-передачи - только при статусах "Работы выполнены" и "Оплаченный" (для НОВЫХ договоров)
  if ENServicesGuardObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT then
    if (ENServicesGuardObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_COMPLETED) and
       (ENServicesGuardObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_PAID) then
      raise Exception.Create('NET-4235 Для друку акту прийому-передачі договір повинен мати статус "Роботи виконані" або "Сплачений"!');
  /////

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'ContractCode';
  args[0] := IntToStr(ENServicesGuardObj.code);

  if ENServicesGuardObj.calcTypeRef.code <> ENSERVICESOBJECT_CALCTYPE_BY_FACT then
    reportName := '201109/ActCalcAdditionalWorkG/ActPriPer'
  else
    reportName := '201109/ActCalcAdditionalWorkG/ActPriPer2';

  makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmENServicesGuardEdit.edtContractServicesPowerChange(
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


procedure TfrmENServicesGuardEdit.actPrintKoshtorisExecute(
 Sender: TObject);
var argNames, args: ArrayOfString;
   reportName: String;
   Licensed : Integer;

   TempENPlanWork2ClassificationType: ENPlanWork2ClassificationTypeControllerSoapPort;
   plan2ctFilter: ENPlanWork2ClassificationTypeFilter;
   ENPlanWork2ClassificationTypeList: ENPlanWork2ClassificationTypeShortList;
   ENPlanWork2ClassificationTypeCode : Integer;
   pw2ctObj: ENPlanWork2ClassificationType;


begin

          ENPlanWork2ClassificationTypeCode := StrToInt(sgENPlanWork2ClassificationType.Cells[0, sgENPlanWork2ClassificationType.Row]);
          TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;
          pw2ctObj := TempENPlanWork2ClassificationType.getObject(ENPlanWork2ClassificationTypeCode);


 SetLength(argNames, 1);
 SetLength(args, 1);

 argNames[0] := 'plancode';
 if (DialogState = dsInsert) then
    args[0] := IntToStr(planCode)
 else

  begin
    if (pw2ctObj = nil) then Exit;
    args[0] := IntToStr(pw2ctObj.planRef.code);
  end;

     reportName := '201109/ActCalcAdditionalWorkG/ActCalcOnlyRemainingcost';

     if ENServicesGuardObj.contractKindRef.code = SERVICES_CONTRACT_KIND_OKSN_RENT
      // Договори аренди (ОКСН)
       then
       begin
        argNames[0] := 'ContractCode';
        args[0] :=   IntToStr(ENServicesGuardObj.code);
        reportName := '201109/ActCalcAdditionalWorkG/ActCalcOnlyRemainingcost_rent';
       end;

  makeReport(reportName , argNames , args , 'xls');
end;


procedure TfrmENServicesGuardEdit.actPreConfirmExecute(Sender: TObject);
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


procedure TfrmENServicesGuardEdit.actPrintCalcNkreExecute(
  Sender: TObject);
var argNames, args: ArrayOfString;
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
      args[0] := IntToStr(DMReports.getPlanCodeForCalculationByElement(ENServicesGuardObj.element.code));

   argNames[1] := 'licenzed';
   args[1] := IntToStr(Licensed);

   reportName := 'Calculation/ActCalc_Form1_NKRE';
   makeReport(reportName , argNames , args , 'pdf');

   reportName := 'Calculation/ActCalc_Form4_NKRE';
   makeReport(reportName , argNames , args , 'pdf');
end;


procedure TfrmENServicesGuardEdit.btnPostingsClick(Sender: TObject);
begin
  frmPostingsEdit := TfrmPostingsEdit.Create(Application, dsInsert);
  try
    frmPostingsEdit.servicesObjectCode := ENServicesGuardObj.code;
    frmPostingsEdit.servicesRelaxation := True;
    frmPostingsEdit.ShowModal;
  finally
    frmPostingsEdit.Free;
  end;

  pcCalculationChange(Sender);
end;


procedure TfrmENServicesGuardEdit.updateRezervedView();
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

         if ENServicesGuardObj.code <> 0 then
            codeServicesObject := ENServicesGuardObj.code
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

end;

procedure TfrmENServicesGuardEdit.sgDepartmentClick(Sender: TObject);
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
       TKVirtualBrigadeList := TempTKVirtualBrigade.getScrollableFilteredListForServices(TempTKVirtualBrigadeFilter,0,-1 , DateToStr(edtReservedDate.DateTime) , ENServicesGuardObj.code ,strCodeActiveDepartment );


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

procedure TfrmENServicesGuardEdit.sgBrigadeInDepartmentClick(
  Sender: TObject);
begin
//  inherited;
//    RenderPlanner;
end;

procedure TfrmENServicesGuardEdit.edtReservedTimeStartChange(
  Sender: TObject);

    begin
  
end;
// сумма времени из техкарт котрые выбраны в калькуляции   
function TfrmENServicesGuardEdit.getSumTimeWorkForCalculation(codePlan : Integer):Double;
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


procedure TfrmENServicesGuardEdit.miPrintActClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
  billCode : Integer;
begin

 try
     billCode := StrToInt(sgENSOBill.Cells[0,sgENSOBill.Row]);
     except
     on EConvertError do Exit;
     end;

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'billCode';
    args[0] := IntToStr(billCode);

    reportName := 'Services/4Guard/ActPriPer2';

  makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmENServicesGuardEdit.miPrintBillClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
    copystr: String;
    billCode : Integer;
begin
  if ENServicesGuardObj = nil then Exit;
  if ENServicesGuardObj.contractTypeRef = nil then Exit;
  if ENServicesGuardObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesGuardObj.calcTypeRef = nil then Exit;
  if ENServicesGuardObj.calcTypeRef.code = LOW_INT then Exit;

  try
     billCode := StrToInt(sgENSOBill.Cells[0,sgENSOBill.Row]);
     except
     on EConvertError do Exit;
     end;

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'billCode';
    args[0] := IntToStr(billCode);

    reportName := 'Services/4Rent/customBill';
    makeReport(reportName , argNames , args , 'pdf');

end;

procedure TfrmENServicesGuardEdit.cbbBasisTypeChange(Sender: TObject);
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

procedure TfrmENServicesGuardEdit.SetActTransferVisibilityByStatus(servicesObjectStatus: Integer);
begin
{
  btnActTransferSave.Visible := (ENServicesGuardObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_GOOD);
  btnActTransferMoveToFK.Visible := (ENServicesGuardObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_GOOD);
  btnActTransferUnMoveToFK.Visible := (ENServicesGuardObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_ACT_TRANSFER_CLOSED);
}

  // btnActTransferSave.Visible := (servicesObjectStatus = ENSERVICESOBJECT_FINSTATUS_GOOD);
  // btnActTransferMoveToFK.Visible := (servicesObjectStatus = ENSERVICESOBJECT_FINSTATUS_GOOD);
  // btnActTransferUnMoveToFK.Visible := (servicesObjectStatus = ENSERVICESOBJECT_FINSTATUS_ACT_TRANSFER_CLOSED);

  actActTransferSave.Visible := (servicesObjectStatus = ENSERVICESOBJECT_FINSTATUS_GOOD);
  actActTransferMoveToFK.Visible := (servicesObjectStatus = ENSERVICESOBJECT_FINSTATUS_GOOD);
  actActTransferUnMoveToFK.Visible := (servicesObjectStatus = ENSERVICESOBJECT_FINSTATUS_ACT_TRANSFER_CLOSED);
end;


procedure TfrmENServicesGuardEdit.actActTransferPrintExecute(
  Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  SetLength(argNames, 1);
  SetLength(args, 1);

  argnames[0] := 'servicesObjectCode';
  args[0] := IntToStr(ENServicesGuardObj.code);

  reportName := '201109/ActTransferForServices/Act';
  makeReport(reportName, argNames, args, 'xls');
end;

procedure TfrmENServicesGuardEdit.actActTransferMoveToFKExecute(
  Sender: TObject);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
    tmpObj: ENServicesObject;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте провести Акт приймання-передачі?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK then
    Exit;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  TempENServicesObject.moveActTransferToFK(ENServicesGuardObj.code);

  Application.MessageBox(PChar('Акт проведено!'), PChar('Інформація'), MB_ICONINFORMATION);

  tmpObj := TempENServicesObject.getObject(ENServicesGuardObj.code);
  SetActTransferVisibilityByStatus(tmpObj.statusRef.code);
end;

procedure TfrmENServicesGuardEdit.actActTransferUnMoveToFKExecute(
  Sender: TObject);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
    tmpObj: ENServicesObject;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити проведення Акту приймання-передачі?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK then
    Exit;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  TempENServicesObject.unMoveActTransferToFK(ENServicesGuardObj.code);

  Application.MessageBox(PChar('Проведення акту відмінено!'), PChar('Інформація'), MB_ICONINFORMATION);

  tmpObj := TempENServicesObject.getObject(ENServicesGuardObj.code);
  SetActTransferVisibilityByStatus(tmpObj.statusRef.code);
end;


procedure TfrmENServicesGuardEdit.actAddBillExecute(Sender: TObject);
// Var TempENSOBill: ENSOBillControllerSoapPort;
begin
  // TempENSOBill := HTTPRIOENSOBill as ENSOBillControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSOBillObj:=ENSOBill.Create;

  ENSOBillObj.servicesObjectRef := ENServicesObjectRef.Create;
  ENSOBillObj.servicesObjectRef.code := ENServicesGuardObj.code;

  try
    frmENSOBillEdit:=TfrmENSOBillEdit.Create(Application, dsInsert);
    try
      if frmENSOBillEdit.ShowModal = mrOk then
      begin
        if ENSOBillObj<>nil then
            updateBills(Sender);
      end;
    finally
      frmENSOBillEdit.Free;
      frmENSOBillEdit:=nil;
    end;
  finally
    ENSOBillObj.Free;
  end;
end;

procedure TfrmENServicesGuardEdit.actAddScheduleExecute(Sender: TObject);
var  TempENServicesObject2PaymentSchedule :  ENServicesObject2PaymentScheduleControllerSoapPort;
begin
  inherited;
        //------------------------------------------------
    TempENServicesObject2PaymentSchedule := HTTPRIOENServicesObject2PaymentSchedule as ENServicesObject2PaymentScheduleControllerSoapPort;
    ENServicesObject2PaymentScheduleObj := ENServicesObject2PaymentSchedule.Create;
    ENServicesObject2PaymentScheduleObj.servicesObjectRef := ENServicesObjectRef.Create;
    ENServicesObject2PaymentScheduleObj.servicesObjectRef.code := ENServicesGuardObj.code;

    try

      frmENServicesObject2PaymentScheduleEdit := TfrmENServicesObject2PaymentScheduleEdit.Create(Application, dsInsert);
      frmENServicesObject2PaymentScheduleEdit.servicesObject := ENServicesGuardObj.code;

      try
        if frmENServicesObject2PaymentScheduleEdit.ShowModal = mrOk then
        begin
          if ENServicesObject2PaymentScheduleObj <> nil then
              pcCalculationChange(Sender);
        end;
      finally
        frmENServicesObject2PaymentScheduleEdit.Free;
        frmENServicesObject2PaymentScheduleEdit := nil;
      end;
    finally
      ENServicesObject2PaymentScheduleObj.Free;
    end;
end;

function TfrmENServicesGuardEdit.CheckCountersByClassifications(): Boolean;
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


procedure TfrmENServicesGuardEdit.spbENResponsibleClick(
  Sender: TObject);
var
   frmFINWorkerShow: TfrmFINWorkerShow;
   f : FINWorkerFilter;
   //plan : ENPlanWork;
   TempFINWorker: FINWorkerControllerSoapPort;
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
        ENServicesGuardObj.resposible := GetReturnValue(sgFINWorker, 1);
        ENServicesGuardObj.resposibleTabNumber := GetReturnValue(sgFINWorker, 2);
        ENServicesGuardObj.resposiblePosition := GetReturnValue(sgFINWorker, 3);
        //edtENResponsible.Text := ENServicesGuardObj.resposiblePosition + ' ' + ENServicesGuardObj.resposible;
      end;
  finally
    frmFINWorkerShow.Free;
  end;
end;


procedure TfrmENServicesGuardEdit.btnActPriPerCountersClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'enservicesobjectcode';
  args[0] := IntToStr(ENServicesGuardObj.code);

  reportName :=  'Calculation/ActPriPerCounters';
  makeReport(reportName , argNames , args , 'pdf');
end;


procedure TfrmENServicesGuardEdit.spbActWarrantNumberClick(Sender: TObject);
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
    f.departmentRef.code := ENServicesGuardObj.department.code;

    if (rgContragentType.ItemIndex in [ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET,
                                      ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NONBUDGET,
                                      ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL_NOREZIDENT,
                                      ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NOREZIDENT]) and
      (ENServicesGuardObj.department.code = ENDEPARTMENT_HGES) then
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


procedure TfrmENServicesGuardEdit.sgENPlanWorkClick(Sender: TObject);
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


procedure TfrmENServicesGuardEdit.sgENPlanWorkRightClickCell(
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

procedure TfrmENServicesGuardEdit.sgENSOBillClick(Sender: TObject);
begin
  inherited;
  updatePayments(Sender);
  updateProvs(Sender);
end;


procedure TfrmENServicesGuardEdit.plansPopup(plan: ENPlanWork);
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

  if not (ENServicesGuardObj.contractStatusRef.code in [ENSERVICESOBJECTSTATUS_COMPLETED,
                                                         ENSERVICESOBJECTSTATUS_TERMINATED]) then
  begin
    if (ENServicesGuardObj.statusRef.code <> ENSERVICESOBJECT_FINSTATUS_CLOSED) and
       (ENServicesGuardObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
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

procedure TfrmENServicesGuardEdit.actEditPlanExecute(
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
    try
      //SUPP-4339
      frmENPlanWorkEdit.isPriconnection := (
        ENServicesGuardObj.contractTypeRef.code =
        ENSERVICESOBJECTTYPE_CONNECTION);
      frmENPlanWorkEdit.soElementCode := ENServicesGuardObj.element.code;
          
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


procedure TfrmENServicesGuardEdit.actEditPostingsExecute(Sender: TObject);
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

procedure TfrmENServicesGuardEdit.actEditScheduleExecute(Sender: TObject);
Var TempENServicesObject2PaymentSchedule: ENServicesObject2PaymentScheduleControllerSoapPort;
begin
 TempENServicesObject2PaymentSchedule := HTTPRIOENServicesObject2PaymentSchedule as ENServicesObject2PaymentScheduleControllerSoapPort;
   try
     ENServicesObject2PaymentScheduleObj := TempENServicesObject2PaymentSchedule.getObject(StrToInt(sgENServicesObject2PaymentSchedule.Cells[0,sgENServicesObject2PaymentSchedule.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENServicesObject2PaymentScheduleEdit:=TfrmENServicesObject2PaymentScheduleEdit.Create(Application, dsEdit);
  try
    if frmENServicesObject2PaymentScheduleEdit.ShowModal= mrOk then
      begin
        //TempENServicesObject2PaymentSchedule.save(ENServicesObject2PaymentScheduleObj);
        pcCalculationChange(Sender);
      end;
  finally
    frmENServicesObject2PaymentScheduleEdit.Free;
    frmENServicesObject2PaymentScheduleEdit:=nil;
  end;
end;

procedure TfrmENServicesGuardEdit.actEditSecObjExecute(Sender: TObject);
var
  TempENSO2SecObject: ENSO2SecObjectControllerSoapPort;
begin
  TempENSO2SecObject := HTTPRIOENSO2SecObject as ENSO2SecObjectControllerSoapPort;
  try
    ENSO2SecObjectObj := TempENSO2SecObject.getObject(StrToInt(sgENSO2SecObject.Cells[0,sgENSO2SecObject.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENSO2SecObjectEdit:=TfrmENSO2SecObjectEdit.Create(Application, dsEdit);

  try
    if frmENSO2SecObjectEdit.ShowModal= mrOk then
      begin
        updateSecObj(Sender);
      end;
  finally
    frmENSO2SecObjectEdit.Free;
    frmENSO2SecObjectEdit:=nil;
  end;
end;

procedure TfrmENServicesGuardEdit.actEditSecObjRespExecute(Sender: TObject);
var
  TempENSO2SecObjectResp: ENSO2SecObjectRespControllerSoapPort;
begin
  TempENSO2SecObjectResp := HTTPRIOENSO2SecObjectResp as ENSO2SecObjectRespControllerSoapPort;
  try
    ENSO2SecObjectRespObj := TempENSO2SecObjectResp.getObject(StrToInt(sgENSO2SecObjectResp.Cells[0,sgENSO2SecObjectResp.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENSO2SecObjectRespEdit:=TfrmENSO2SecObjectRespEdit.Create(Application, dsEdit);

  try
    if frmENSO2SecObjectRespEdit.ShowModal= mrOk then
      begin
        updateSecObjResp(Sender);
      end;
  finally
    frmENSO2SecObjectRespEdit.Free;
    frmENSO2SecObjectRespEdit:=nil;
  end;
end;

procedure TfrmENServicesGuardEdit.actViewPlanExecute(
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
        ENServicesGuardObj.contractTypeRef.code =
        ENSERVICESOBJECTTYPE_CONNECTION);

      frmENPlanWorkEdit.soElementCode := ENServicesGuardObj.element.code;

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


procedure TfrmENServicesGuardEdit.actDeletePlanExecute(
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


procedure TfrmENServicesGuardEdit.actDeleteScheduleExecute(Sender: TObject);
Var TempENServicesObject2PaymentSchedule: ENServicesObject2PaymentScheduleControllerSoapPort;
  ObjCode: Integer;
begin
 TempENServicesObject2PaymentSchedule := HTTPRIOENServicesObject2PaymentSchedule as ENServicesObject2PaymentScheduleControllerSoapPort;
   try
     ObjCode := StrToInt(sgENServicesObject2PaymentSchedule.Cells[0,sgENServicesObject2PaymentSchedule.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Графік платежів) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENServicesObject2PaymentSchedule.remove(ObjCode);
       pcCalculationChange(Sender);
  end;
end;

procedure TfrmENServicesGuardEdit.actDeleteSecObjExecute(Sender: TObject);
Var TempENSO2SecObject: ENSO2SecObjectControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSO2SecObject := HTTPRIOENSO2SecObject as ENSO2SecObjectControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSO2SecObject.Cells[0,sgENSO2SecObject.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Объекты охраны для услуг на сторону) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSO2SecObject.remove(ObjCode);
      updateSecObj(Sender);
  end;
end;

procedure TfrmENServicesGuardEdit.actDeleteSecObjRespExecute(Sender: TObject);
Var TempENSO2SecObjectResp: ENSO2SecObjectRespControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSO2SecObjectResp := HTTPRIOENSO2SecObjectResp as ENSO2SecObjectRespControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSO2SecObjectResp.Cells[0,sgENSO2SecObjectResp.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Ответственные лица объектов охраны для услуг на сторону) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSO2SecObjectResp.remove(ObjCode);
      updateSecObjResp(Sender);
  end;
end;

procedure TfrmENServicesGuardEdit.actClosePlanExecute(
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

procedure TfrmENServicesGuardEdit.actUnClosePlanExecute(
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

procedure TfrmENServicesGuardEdit.actFinishPlanExecute(
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


procedure TfrmENServicesGuardEdit.actUndoConfirmExecute(Sender: TObject);
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


procedure TfrmENServicesGuardEdit.actUndoFinishPlanExecute(
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


procedure TfrmENServicesGuardEdit.actEditActExecute(Sender: TObject);
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

procedure TfrmENServicesGuardEdit.actEditBillExecute(Sender: TObject);
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
        //TempENSOBill.save(ENSOBillObj);
        updateBills(Sender);
      end;
  finally
    frmENSOBillEdit.Free;
    frmENSOBillEdit:=nil;
  end;
end;

procedure TfrmENServicesGuardEdit.actEditCAIExecute(Sender: TObject);
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

procedure TfrmENServicesGuardEdit.actEditCalculationExecute(Sender: TObject);
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

    frmENPlanWork2ClassificationTypeEdit.distance := TXSDecimal.Create;
    frmENPlanWork2ClassificationTypeEdit.distance.DecimalString := edtContractServicesDistance.Text;
    frmENPlanWork2ClassificationTypeEdit.codeDepartmentForServicesObject := DepartmentForServicesCode;
    if frmENPlanWork2ClassificationTypeEdit.ShowModal = mrOk then
    begin

      actUpdateExecute(Sender);
    end;
  finally
    frmENPlanWork2ClassificationTypeEdit.Free;
    frmENPlanWork2ClassificationTypeEdit:=nil;
  end;

end;

procedure TfrmENServicesGuardEdit.actEditENPlanWorkItemExecute(
  Sender: TObject);
Var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
begin
  if not guard then Exit;

  if ENServicesGuardObj = nil then Exit;
  if ENServicesGuardObj.contractTypeRef = nil then Exit;
  if ENServicesGuardObj.contractTypeRef.code <> ENSERVICESOBJECTTYPE_OHRINA then Exit;

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


procedure TfrmENServicesGuardEdit.actDeleteBillExecute(Sender: TObject);
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
      updateBills(Sender);
  end;
end;

procedure TfrmENServicesGuardEdit.actDeleteCAIExecute(Sender: TObject);
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

procedure TfrmENServicesGuardEdit.actDeleteCalculationExecute(
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


procedure TfrmENServicesGuardEdit.btnPrintFactCalcClick(
  Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  if (ENServicesGuardObj.calcTypeRef.code <> ENSERVICESOBJECT_CALCTYPE_BY_FACT) then Exit;

  /////
  if ENServicesGuardObj.contractStatusRef = nil then Exit;

  if ENServicesGuardObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////
    
  ///// 14.05.13 NET-4235
  // Печать расчета - только при статусах "Работы выполнены" и "Оплаченный"
  if (ENServicesGuardObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_COMPLETED) and
     (ENServicesGuardObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_PAID) then
    raise Exception.Create('NET-4235 Для друку розрахунку остаточної вартості договір повинен мати статус "Роботи виконані" або "Сплачений"!');
  /////

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'servicesObjectCode';
  args[0] := IntToStr(ENServicesGuardObj.code);

  reportName := '201109/ActCalcAdditionalWorkG_NKRE/ActCalc_ServicesFactCalc';

  makeReport(reportName, argNames, args, 'xls');
end;


procedure TfrmENServicesGuardEdit.btnPrintRecoveryAlterWithCalcItemsClick(
  Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  if ENServicesGuardObj = nil then Exit;
  if ENServicesGuardObj.contractTypeRef = nil then Exit;
  if ENServicesGuardObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesGuardObj.calcTypeRef = nil then Exit;
  if ENServicesGuardObj.calcTypeRef.code = LOW_INT then Exit;
  if ENServicesGuardObj.contractStatusRef = nil then Exit;
  if ENServicesGuardObj.contractKindRef = nil then Exit;
  if ENServicesGuardObj.contractKindRef.code = LOW_INT then Exit;

  if ENServicesGuardObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'soCode';
    args[0] := IntToStr(ENServicesGuardObj.code);

    if ENServicesGuardObj.contractKindRef.code = SERVICES_CONTRACT_KIND_OKSN_WORK then
    begin
    reportName := 'Services/4Rent/d_recovery_alter_w_calc_items';
    makeReport(reportName, argNames, args, 'pdf');
    end;

end;

procedure TfrmENServicesGuardEdit.btnPrintTechAgreementClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
begin
  inherited;
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'servicesObjectCode';
  args[0] := IntToStr(ENServicesGuardObj.code);

  reportName := 'TechConditions/TechAgreement/agree';
  makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmENServicesGuardEdit.pmPlansPopup(Sender: TObject);
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


procedure TfrmENServicesGuardEdit.actConfirmExecute(Sender: TObject);
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


procedure TfrmENServicesGuardEdit.actCreateNewPostingsExecute(Sender: TObject);
var
billCode, payment2soCode : Integer;
begin

  ENSOPayBillProvObj := ENSOPayBillProv.Create;
  ENSOPayBillProvObj.soRef := ENServicesObjectRef.Create;
  ENSOPayBillProvObj.soRef.code := ENServicesGuardObj.code;
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

procedure TfrmENServicesGuardEdit.actInsertCAIExecute(Sender: TObject);
begin
  // TempENServices2CalcAdditionalItems := HTTPRIOENServices2CalcAdditionalItems as ENServices2CalcAdditionalItemsControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENServices2CalcAdditionalItemsObj:=ENServices2CalcAdditionalItems.Create;
  SetNullIntProps(ENServices2CalcAdditionalItemsObj);
  SetNullXSProps(ENServices2CalcAdditionalItemsObj);

   ENServices2CalcAdditionalItemsObj.servicesObjectRef := ENServicesObjectRef.Create;
   ENServices2CalcAdditionalItemsObj.servicesObjectRef.code := ENServicesGuardObj.code;

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

procedure TfrmENServicesGuardEdit.actInsertCalculationExecute(Sender: TObject);
Var
  TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
  TempENPlanWork2ClassificationType: ENPlanWork2ClassificationTypeControllerSoapPort;
  TempENEstimateItem : ENEstimateItemControllerSoapPort;
  plan2ctFilter : ENPlanWork2ClassificationTypeFilter;
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
  ENPlanWork2ClassificationTypeObj.planRef := ENPlanWorkRef.Create;
  ENPlanWork2ClassificationTypeObj.planRef.code := LOW_INT;


  try
    frmENPlanWork2ClassificationTypeEdit := TfrmENPlanWork2ClassificationTypeEdit.Create(Application, dsInsert);

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
      frmENPlanWork2ClassificationTypeEdit.guard := true;


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

procedure TfrmENServicesGuardEdit.actInsertPaymentExecute(
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
   ENPayment2SOObj.servicesObjectRef.Code :=  ENServicesGuardObj.code;

   try
     billCode := StrToInt(sgENSOBill.Cells[0,sgENSOBill.Row]);
   except
   on EConvertError do Exit;
   end;

   ENPayment2SOObj.soBillRef := ENSOBillRef.Create;
   ENPayment2SOObj.soBillRef.code := billCode;

  try
		frmENPayment2SOEdit:=TfrmENPayment2SOEdit.Create(Application, dsInsert);
		frmENPayment2SOEdit.calctyperefcode :=  ENServicesGuardObj.calcTypeRef.code;
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

procedure TfrmENServicesGuardEdit.actInsertSecObjExecute(Sender: TObject);
begin
  ENSO2SecObjectObj:=ENSO2SecObject.Create;
  SetNullIntProps(ENSO2SecObjectObj);
  SetNullXSProps(ENSO2SecObjectObj);
  ENSO2SecObjectObj.servicesObjectRef := ENServicesObjectRef.Create;
  ENSO2SecObjectObj.servicesObjectRef.code := ENServicesGuardObj.code;

  try
    frmENSO2SecObjectEdit:=TfrmENSO2SecObjectEdit.Create(Application, dsInsert);
    try
      if frmENSO2SecObjectEdit.ShowModal = mrOk then
      begin
        if ENSO2SecObjectObj<>nil then
            updateSecObj(Sender);
      end;
    finally
      frmENSO2SecObjectEdit.Free;
      frmENSO2SecObjectEdit:=nil;
    end;
  finally
    ENSO2SecObjectObj.Free;
  end;
end;

procedure TfrmENServicesGuardEdit.actInsertSecObjRespExecute(Sender: TObject);
begin
  ENSO2SecObjectRespObj:=ENSO2SecObjectResp.Create;
  SetNullIntProps(ENSO2SecObjectRespObj);
  SetNullXSProps(ENSO2SecObjectRespObj);
  ENSO2SecObjectRespObj.servicesObjectRef := ENServicesObjectRef.Create;
  ENSO2SecObjectRespObj.servicesObjectRef.code := ENServicesGuardObj.code;

  try
    frmENSO2SecObjectRespEdit:=TfrmENSO2SecObjectRespEdit.Create(Application, dsInsert);
    try
      if frmENSO2SecObjectRespEdit.ShowModal = mrOk then
      begin
        if ENSO2SecObjectRespObj<>nil then
            updateSecObjResp(Sender);
      end;
    finally
      frmENSO2SecObjectRespEdit.Free;
      frmENSO2SecObjectRespEdit:=nil;
    end;
  finally
    ENSO2SecObjectRespObj.Free;
  end;
end;

procedure TfrmENServicesGuardEdit.actDeletePaymentExecute(
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

procedure TfrmENServicesGuardEdit.actEditPaymentExecute(
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
	frmENPayment2SOEdit.calctyperefcode :=  ENServicesGuardObj.calcTypeRef.code;
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

procedure TfrmENServicesGuardEdit.ActViewPaymentExecute(
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
	frmENPayment2SOEdit.calctyperefcode := ENServicesGuardObj.calcTypeRef.code;
  try
    frmENPayment2SOEdit.ShowModal;

  finally
    frmENPayment2SOEdit.Free;
    frmENPayment2SOEdit := nil;
  end;
end;

end.

