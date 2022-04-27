
unit EditENServicesRent;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
    EnergyproController, EnergyproController2, ENServicesObjectController, ENPlanWorkController,
    ExtCtrls, TB2Item, TB2Dock, TB2Toolbar , ShowENServicesRent, Planner, ENPlanWorkStatusController,
    AdvObj, ShowRQOrg, ShowRQOrgRschet, ENCottageController, ENRentPeriod2ServicesController,
    PlannerMonthView, DBPlannerMonthView, PlannerCal, FKProvObjectController, ENElement2ENElementController
    , insertContractToLeaseAgreementAndCallCenter;

type
    TfrmENServicesRentEdit = class(TDialogForm)
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
    HTTPRIORQFKOrder: THTTPRIO;
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
    HTTPRIOENCottage: THTTPRIO;
    HTTPRIOENRentPeriod2Services: THTTPRIO;
    HTTPRIOENFamilySize2ServicesObject: THTTPRIO;
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
    edtCitiesList: TMemo;
    lblCitiesList: TLabel;
    lblProjectCode: TLabel;
    edtProjectCode: TEdit;
    edtLineLength: TEdit;
    lblLineLength: TLabel;
    Panel2: TPanel;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem3: TTBItem;
    TBItem8: TTBItem;
    sgENAct: TAdvStringGrid;
    actEditAct: TAction;
    actViewAct: TAction;
    Label1: TLabel;
    cbContractKind: TComboBox;
    tsRentItems: TTabSheet;
    ToolBar6: TToolBar;
    ToolButton32: TToolButton;
    ToolButton33: TToolButton;
    ToolButton34: TToolButton;
    sgENSORentItems: TAdvStringGrid;
    HTTPRIOENSORentItems: THTTPRIO;
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
    HTTPRIOENSORItems2Post04: THTTPRIO;
    HTTPRIOENSORItems2Post10: THTTPRIO;
    actAddP04: TAction;
    actDeleteP04: TAction;
    actAddP10: TAction;
    actDeleteP10: TAction;
    gpbLinkedServices: TGroupBox;
    lblLinkedServicesObject: TLabel;
    spbLinkedServicesObject: TSpeedButton;
    edtLinkedServicesObject: TEdit;
    HTTPRIOENElement2ENElement: THTTPRIO;
    spbEraseLinkedServicesObject: TSpeedButton;
    btnPrintAlter: TButton;
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
    btnPrintRecoveryAlterWithCalcItems: TButton;
    btnContractExtraditionTU: TButton;
    ToolButton40: TToolButton;
    actInsertRentItemAndCCTower2JLC: TAction;
    btnUpdateIsRealized1CCtower2jlc: TButton;
    btnUpdateIsRealized0CCtower2jlc: TButton;
    btnRemovePlanFromRent: TToolButton;
    actAttachPlan: TAction;
    actDettachPlan: TAction;

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
    procedure actViewRentItemExecute(Sender: TObject);
    procedure actAddRentItemExecute(Sender: TObject);
    procedure actEditRentItemExecute(Sender: TObject);
    procedure actDeleteRentItemExecute(Sender: TObject);
    procedure cbbBasisTypeChange(Sender: TObject);
    procedure actAddP10Execute(Sender: TObject);
    procedure sgENSORentItemsClick(Sender: TObject);
    procedure actAddP04Execute(Sender: TObject);
    procedure spbLinkedServicesObjectClick(Sender: TObject);
    procedure spbEraseLinkedServicesObjectClick(Sender: TObject);
    procedure btnPrintAlterClick(Sender: TObject);
    procedure actViewCAIExecute(Sender: TObject);
    procedure actInsertCAIExecute(Sender: TObject);
    procedure actDeleteCAIExecute(Sender: TObject);
    procedure actEditCAIExecute(Sender: TObject);
    procedure actUpdateCAIExecute(Sender: TObject);
    procedure btnPrintRecoveryAlterWithCalcItemsClick(Sender: TObject);
    procedure btnContractExtraditionTUClick(Sender: TObject);
    procedure actInsertRentItemAndCCTower2JLCExecute(Sender: TObject);
    procedure btnUpdateIsRealized1CCtower2jlcClick(Sender: TObject);
    procedure btnUpdateIsRealized0CCtower2jlcClick(Sender: TObject);
    procedure actAttachPlanExecute(Sender: TObject);
    procedure actDettachPlanExecute(Sender: TObject);


  private
    { Private declarations }
    isVisitClient : Boolean;
    isJobsByTime  : Boolean;

    checkWarrant: Boolean;

    codeServicesRent: Integer;
    contractStatusName: WideString;

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

    procedure updateP10(Sender: TObject);
    procedure updateP04(Sender: TObject);
    function getLinkedServices() : ENElement2ENElement;

  public
    { Public declarations }
    planCode : Integer;
    DepartmentForServicesCode : Integer;
    tempDeliveryOneWay : Integer;

    //PRIC-155
    contNumServ: String;
    rent : Boolean;
    isNotCalculated : Boolean;

    cottageCode : Integer;

  end;


var
  frmENServicesRentEdit: TfrmENServicesRentEdit;
  ENServicesRentObj: ENServicesObject;

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

  CAIColCount, CAILastCount: Integer;
  CAILastRow: Integer = 1;
  ENServices2CalcAdditionalItemsHeaders: array [1..5] of String =
        ( 'Код'
          , 'Найменування пункту розрахунку'
          ,'Сумма'
          ,'кол-во'
          ,'Примечание'
        );
  fromCodeServicesObject: Integer;


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
  EditENSORentItems, ENSORentItemsController, ENSORItems2Post04Controller,
  ENSORItems2Post10Controller, EditENSORItems2Post10, ShowENSORItems2Post10,
  EditENSORItems2Post04, ShowENPost10OKSN, ENPost10OKSNController,
  ShowENPost04OKSN, ENPost04OKSNController, ShowENServicesObject
  , ENElement2ENElementTypeController, printAgreeRentTU,
  ENServices2CalcAdditionalItemsController, EditENServices2CalcAdditionalItems;

{uses
    EnergyproController, EnergyproController2, ENServicesObjectController  ;
}
{$R *.dfm}
//  var
//  planItemFilter: ENPlanWorkItemFilter;


function TfrmENServicesRentEdit.getLinkedServices() : ENElement2ENElement;
var
	TempENElement2ENelement : ENElement2ENElementControllerSoapPort;
	TempENServicesObject : ENServicesObjectControllerSoapPort;
	filter : ENElement2ENElementFilter;
	codes : ENElement2ENElementController.ArrayOfInteger;
	elel : ENElement2ENElement;
	servicesObjectOutFilter : ENServicesObjectFilter;
	servicesObjectOutList : ENServicesObjectShortList;
begin
	if (ENServicesRentObj = nil) or (ENServicesRentObj.code = Low(Integer)) then begin
		Result := nil;
		Exit;
	end;
	TempENElement2ENelement := HTTPRIOENElement2ENElement as ENElement2ENElementControllerSoapPort;
	TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
	filter := ENElement2ENElementFilter.Create;
	SetNullXSProps(filter);
	SetNullIntProps(filter);
	filter.elementInRef := ENElementRef.Create;
	filter.elementInRef.code := ENServicesRentObj.element.code;
	filter.typeRef := ENElement2ENElementTypeRef.Create;
	if ENServicesRentObj.contractKindRef.code = ENConsts.SERVICES_CONTRACT_KIND_OKSN_ACCESS then
  begin
		filter.typeRef.code := ENConsts.ENELEMENT2ENELEMENT_TYPE_SERVICES_OKSN_ACCESS_WITH_OKSN_TU;
	end
  else   if ENServicesRentObj.contractKindRef.code = ENConsts.SERVICES_CONTRACT_KIND_OKSN_AGREEMENT then
  begin
		filter.typeRef.code := ENConsts.ENELEMENT2ENELEMENT_TYPE_SERVICES_OKSN_AGREEMENT_WITH_OKSN_TU;
  end
  else   if ENServicesRentObj.contractKindRef.code = ENConsts.SERVICES_CONTRACT_KIND_OKSN_WORK then
  begin
		filter.typeRef.code := ENConsts.ENELEMENT2ENELEMENT_TYPE_SERVICES_OKSN_WORK_WITH_OKSN_TU;
  end
  else  if ENServicesRentObj.contractKindRef.code = ENConsts.SERVICES_CONTRACT_KIND_OKSN_TU_MODIFY then
  begin
		filter.typeRef.code := ENConsts.ENELEMENT2ENELEMENT_TYPE_SERVICES_OKSN_TU_MODIFY_WITH_OKSN_TU;
  end
  else

  begin
		filter.typeRef.code := Low(Integer);
	end;

	codes := TempENElement2ENelement.getScrollableFilteredCodeArray(filter, 0, -1);
	if (codes <> nil) and (Length(codes) > 1) then begin
		raise Exception.Create('Помилка у кількості зв''язків між послугами на сторону для договору: ' + IntToStr(Length(codes)));
	end;
	
	elel := nil;
	if(Length(codes) = 1) then begin
		elel := TempENElement2ENelement.getObject(codes[0]);

		servicesObjectOutFilter := ENServicesObjectFilter.Create;
		SetNullXSProps(servicesObjectOutFilter);
		SetNullIntProps(servicesObjectOutFilter);
		servicesObjectOutFilter.element := ENElement.Create;
		servicesObjectOutFilter.element.code := elel.elementOutRef.code;
		servicesObjectOutList := TempENServicesObject.getScrollableFilteredList(servicesObjectOutFilter, 0, -1);
		if servicesObjectOutList.totalCount <> 1 then begin
			raise Exception.Create('Помилка у кількості зв''язків між послугами на сторону для договору: ' + IntToStr(servicesObjectOutList.totalCount));
		end;
		edtLinkedServicesObject.Text := servicesObjectOutList.list[0].contractNumberServices + ' від ' + XSDate2String(servicesObjectOutList.list[0].contractDateServices);
    codeServicesRent := servicesObjectOutList.list[0].code;
    contractStatusName:= servicesObjectOutList.list[0].contractStatusRefName;
	end else begin
    edtLinkedServicesObject.Text := '';
  end;
	
	Result := elel;
end;
procedure TfrmENServicesRentEdit.updateP04(Sender: TObject);

begin

end;


procedure TfrmENServicesRentEdit.updateP10(Sender: TObject);

begin

end;

procedure TfrmENServicesRentEdit.updateAct(Sender : TObject);
 var
  TempENAct: ENActControllerSoapPort;
  actFilter: ENActFilter;
  ENActList: ENActShortList;
  actDate: String;
  i : Integer;

begin
   ClearGrid(sgENAct);

    if ENServicesRentObj = nil then Exit;
    if ENServicesRentObj.element = nil then Exit;
    if ENServicesRentObj.element.code = LOW_INT then Exit;

    actDate := '';

    TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

    actFilter := ENActFilter.Create;
    SetNullIntProps(actFilter);
    SetNullXSProps(actFilter);
    actFilter.element := ENElement.Create;
    actFilter.element.code := ENServicesRentObj.element.code;

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

procedure TfrmENServicesRentEdit.updatePaymentSchedule(Sender : TObject);
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
  payScheduleFilter.servicesObjectRef.code := ENServicesRentObj.code;

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

procedure  TfrmENServicesRentEdit.updateProvs(Sender : TObject);
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


procedure  TfrmENServicesRentEdit.updatePayments(Sender: TObject);
var
  TempENPayment2SO: ENPayment2SOControllerSoapPort;
  ENPayment2SOList: ENPayment2SOShortList;
  FilterPayment2SO : ENPayment2SOFilter;

  i, billCode : Integer;
begin
    SetGridHeaders(ENPayment2SOHeaders, sgENPayment2SO.ColumnHeaders);
    ClearGrid(sgENPayment2SO);

    if ENServicesRentObj = nil then Exit;
    if ENServicesRentObj.element = nil then Exit;
    if ENServicesRentObj.element.code = LOW_INT then Exit;

    TempENPayment2SO :=  HTTPRIOENPayment2SO as ENPayment2SOControllerSoapPort;

     FilterPayment2SO := ENPayment2SOFilter.Create;
     SetNullIntProps(FilterPayment2SO);
     SetNullXSProps(FilterPayment2SO);

     FilterPayment2SO.servicesObjectRef := ENServicesObjectRef.Create;
     FilterPayment2SO.servicesObjectRef.code :=  ENServicesRentObj.code;

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

procedure TfrmENServicesRentEdit.updateBills(Sender: TObject);
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
  billFilter.servicesObjectRef.code := ENServicesRentObj.code;

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


procedure TfrmENServicesRentEdit.updateItems(Sender: TObject);
var
  TempENSORentItems: ENSORentItemsControllerSoapPort;
  i, a, b: Integer;
  ENSORentItemsList: ENSORentItemsShortList;
  soItemFilter : ENSORentItemsFilter;
  begin
  sgENSORentItems.Clear;
  SetGridHeaders(ENSORentItemsHeaders, sgENSORentItems.ColumnHeaders);

   {for a:=1 to sgENSORentItems.RowCount-1 do
   for b:=0 to sgENSORentItems.ColCount-1 do
     sgENSORentItems.Cells[a,b]:='';}

  TempENSORentItems :=  HTTPRIOENSORentItems as ENSORentItemsControllerSoapPort;

     soItemFilter := ENSORentItemsFilter.Create;
     SetNullIntProps(soItemFilter);
     SetNullXSProps(soItemFilter);

     soItemFilter.servicesObjectRef := ENServicesObjectRef.Create;
     soItemFilter.servicesObjectRef.code := ENServicesRentObj.code;

  ENSORentItemsList := TempENSORentItems.getScrollableFilteredList(soItemFilter,0,-1);

  soItemLastCount:=High(ENSORentItemsList.list);

  if soItemLastCount > -1 then
     sgENSORentItems.RowCount:=soItemLastCount+2
  else
     sgENSORentItems.RowCount:=2;

   with sgENSORentItems do
    for i:=0 to soItemLastCount do
      begin
        Application.ProcessMessages;
        if ENSORentItemsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSORentItemsList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSORentItemsList.list[i].localityName;
        Cells[2,i+1] := ENSORentItemsList.list[i].address;

        if ENSORentItemsList.list[i].streetCode <> Low(Integer) then
        Cells[3,i+1] := IntToStr(ENSORentItemsList.list[i].streetCode)
        else
        Cells[3,i+1] := '';

        if ENSORentItemsList.list[i].renCode <> Low(Integer) then
        Cells[4,i+1] := IntToStr(ENSORentItemsList.list[i].renCode)
        else
        Cells[4,i+1] := '';

        soItemLastRow:=i+1;
        sgENSORentItems.RowCount:=soItemLastRow+1;
      end;

   soItemColCount:=soItemColCount+1;
   sgENSORentItems.Row:=1;
end;


procedure TfrmENServicesRentEdit.FormShow(Sender: TObject);
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
    HideControls([gpbLinkedServices, btnContractExtraditionTU]);
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
	  , gpbLinkedServices
      ]);

    DisableActions([{actInsert, actEdit, actDelete, } actFilter, actNoFilter,
                    {actEditPlan, }actBudgetApproved]);

    DisableActions([actInsertPlan, actEditPlan, actDeletePlan,
                    actClosePlan, actUnClosePlan{, actFinishPlan, actUndoFinishPlan}]);

    DisableActions([actInsertCalculation, actDeleteCalculation, actEditCalculation, actEditENPlanWorkItem]);
  end;

  DisableControls([edtLinkedServicesObject, edtENDepartmentDepartmentName, edtContractNumberServices, edtStatus]);

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

    SetFloatStyle([edtContractServicesDistance, edtLineLength]);
  end;

  DisableControls([edtCode ,edtCommentGen ]);

  if (DialogState = dsEdit) then
  begin
      DisableControls([spbENDepartmentDepartment], false);
      DisableControls([edtContractNumber]);
      DenyBlankValues([edtENDepartmentDepartmentName]);

      ///// 28.07.10
      if ENServicesRentObj.finDocID = LOW_INT then
      begin
        DisableControls([{edtContractNumber, }spbContractNumberSelect], false);
        DenyBlankValues([edtContractNumber]);
      end;
      /////

      ///// 16.05.13 NET-4235
      // btnPrintFactCalc.Visible := (ENServicesRentObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT);
      /////
  end;

  if DialogState = dsInsert then
     begin
      edtContractNumberServices.Text := 'Auto';

     end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin


    planCode := DMReports.getPlanCodeForCalculationByElement(ENServicesRentObj.element.code);

    if  ENServicesRentObj.warrantRef.code <> LOW_INT then
    begin
      warrant := DMReports.getWarrantByCode(ENServicesRentObj.warrantRef.code);

      edtWarrantNumber.Text := warrant.numbergen;
      edtWarrantFIO.Text := warrant.warrantFIO;
    end;

    if (ENServicesRentObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
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


    if (ENServicesRentObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
    begin
      tsPlans.TabVisible := true; //(HTTPRIOENPlanWork2ClassificationType.HTTPWebNode.UserName = 'energynet');
      tsActs.TabVisible := false;
      tsPayment.TabVisible := false;
    end;

    if (ENServicesRentObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_SIGNED) then
    begin
      tsActs.TabVisible := True;
      tsPayment.TabVisible := True;
    end;



    ////////////////////////////////////////////////////////////////////////////
    // 24.04.13 Все action'ы теперь разделены
    DisableActions([actInsertPlan, actDeletePlan, actEditPlan,
                    actClosePlan, actUnClosePlan, {actFinishPlan, actUndoFinishPlan,}
                    actEditENPlanWorkItem]);

    if (ENServicesRentObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
    begin
      DisableActions([actInsertCalculation, actDeleteCalculation, actEditCalculation]);

      if not (ENServicesRentObj.contractStatusRef.code in [ENSERVICESOBJECTSTATUS_COMPLETED,
                                                             ENSERVICESOBJECTSTATUS_TERMINATED]) then
      begin

        if rent then
        begin
          DisableActions([actInsertCalculation, actDeleteCalculation,
                          actEditCalculation, actEditENPlanWorkItem], false);

          // С планами даем работать только если договор не проведен в ФК
          if ENServicesRentObj.statusRef.code <> ENSERVICESOBJECT_FINSTATUS_CLOSED then
            DisableActions([actInsertPlan, actDeletePlan, actEditPlan,
                            actClosePlan, actUnClosePlan], false);
        end;

      end;

    end; // if (ENServicesRentObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED)

    edtCode.Text := IntToStr(ENServicesRentObj.code);

    if (ENServicesRentObj.contractNumber <> '') then
       edtContractNumber.Text := ENServicesRentObj.contractNumber
    else
       edtContractNumber.Text := ENServicesRentObj.contractNumberServices;

    if ENServicesRentObj.contractDateServices <> nil then
    begin
      edtContractDateServices.DateTime:=EncodeDate(ENServicesRentObj.contractDateServices.Year,ENServicesRentObj.contractDateServices.Month,ENServicesRentObj.contractDateServices.Day);
      edtContractDateServices.checked := true;
    end
    else
    begin
      edtContractDateServices.DateTime:=SysUtils.Date;
      edtContractDateServices.checked := false;
    end;

    if ENServicesRentObj.contractDate <> nil then
    begin
      edtContractDateFin.DateTime:=EncodeDate(ENServicesRentObj.contractDate.Year,ENServicesRentObj.contractDate.Month,ENServicesRentObj.contractDate.Day);
      edtContractDateFin.checked := true;
    end;

    edtContragentName.Text := ENServicesRentObj.contragentName;
    MakeMultiline(edtContragentAddress.Lines, ENServicesRentObj.contragentAddress);
    MakeMultiline(edtContragentPassport.Lines, ENServicesRentObj.contragentPassport);
    edtContragentOkpo.Text := ENServicesRentObj.contragentOkpo;
    edtContragentBossName.Text := ENServicesRentObj.contragentBossName;
    edtContragentBankName.Text := ENServicesRentObj.contragentBankName;
    edtContragentBankAccount.Text := ENServicesRentObj.contragentBankAccount;
    edtContragentBankMfo.Text := ENServicesRentObj.contragentBankMfo;
    edtENDepartmentDepartmentName.Text := ENServicesRentObj.department.name;
    MakeMultiline(edtCommentGen.Lines, ENServicesRentObj.commentGen);

    edtName.Text := ENServicesRentObj.name;
    edtPartnerCode.Text := ENServicesRentObj.partnerCode;
    edtFinDocCode.Text := ENServicesRentObj.finDocCode;

    if ( ENServicesRentObj.finDocID <> Low(Integer) ) then
       edtFinDocID.Text := IntToStr(ENServicesRentObj.finDocID)
    else
       edtFinDocID.Text := '';

    MakeMultiline(edtCommentServicesGen.Lines, ENServicesRentObj.commentServicesGen);

    if ( ENServicesRentObj.contractServicesDistance <> nil ) then
       edtContractServicesDistance.Text := ENServicesRentObj.contractServicesDistance.decimalString
    else
       edtContractServicesDistance.Text := '';

    if ENServicesRentObj.executeWorkDate <> nil then
      begin
        edtExecuteWorkDate.DateTime:=EncodeDate(ENServicesRentObj.executeWorkDate.Year,ENServicesRentObj.executeWorkDate.Month,ENServicesRentObj.executeWorkDate.Day);
        edtExecuteWorkDate.checked := true;
      end
    else
      begin
        edtExecuteWorkDate.DateTime:=SysUtils.Date;
        edtExecuteWorkDate.checked := false;
      end;
    if ENServicesRentObj.timeStart <> nil then
      begin
        edtTimeStart.DateTime:= EncodeTime(ENServicesRentObj.timeStart.Hour,ENServicesRentObj.timeStart.Minute, 0, 0);
        //EncodeDate(ENTravelSheetObj.timeStart.Year,ENTravelSheetObj.timeStart.Month,ENTravelSheetObj.timeStart.Day);
        edtTimeStart.checked := true;
      end
      else
      begin
        edtTimeStart.DateTime:=SysUtils.Date;
        edtTimeStart.checked := false;
      end;

      if ENServicesRentObj.timeFinal <> nil then
      begin
        edtTimeFinal.DateTime:= EncodeTime(ENServicesRentObj.timeFinal.Hour,ENServicesRentObj.timeFinal.Minute, 0, 0);
         //EncodeDate(ENTravelSheetObj.timeFinal.Year,ENTravelSheetObj.timeFinal.Month,ENTravelSheetObj.timeFinal.Day);
        edtTimeFinal.checked := true;
      end
      else
      begin
        edtTimeFinal.DateTime:=SysUtils.Date;
        edtTimeFinal.checked := false;
      end;

      edtContragentPhoneNumber.Text := ENServicesRentObj.contragentPhoneNumber;
      edtExecutorPhoneNumber.Text := ENServicesRentObj.executorPhoneNumber;

      rgContragentType.ItemIndex:= ENServicesRentObj.contragentTypeRef.code-1;
      rgPayable.ItemIndex:= ENServicesRentObj.isNoPay;

      edtContragentPosition.Text := ENServicesRentObj.contragentPosition;

      MakeMultiline(edtCitiesList.Lines, ENServicesRentObj.citiesList);
      edtProjectCode.Text := ENServicesRentObj.projectCode;

      if ( ENServicesRentObj.lineLength <> nil ) then
       edtLineLength.Text := ENServicesRentObj.lineLength.DecimalString
      else
       edtLineLength.Text := '';

      edtWarrantContrAgentNumber.Text := ENServicesRentObj.warrantNumber;
    edtWarrantContrAgentFIO.Text := ENServicesRentObj.warrantFIO;

    if ENServicesRentObj.warrantDate <> nil then
    begin
      edtWarrantContrAgentDate.DateTime:=EncodeDate(ENServicesRentObj.warrantDate.Year,ENServicesRentObj.warrantDate.Month,ENServicesRentObj.warrantDate.Day);
      edtWarrantContrAgentDate.checked := true;
    end;

    /////////////////////////////
    // 21.09.12 NET-3079
    chbIsCustomerMaterials.Checked := (ENServicesRentObj.isCustomerMaterials = ENSERVICESOBJECT_ISCUSTOMERMATERIALS);

    //planCode := DMReports.getPlanCodeForCalculationByElement(ENServicesRentObj.element.code);
    ////////
    SetFormCaption(ENServicesRentObj.element.code);
    ////////
    pcCalculationChange(Sender);

      //edtENElementElementName.Text := ENServicesRentObj.element.name;
    DisableControls([edtDepartmentForServices,btnENDepartmentDepartment]);

    if ENServicesRentObj.department.code <> LOW_INT then
       begin
         DepartmentForServicesCode:= ENServicesRentObj.department.code;
         edtDepartmentForServices.Text := ENServicesRentObj.department.shortName;
       end;

       DisableControls([edtExecuteWorkDate  , edtTimeStart  , edtTimeFinal ]);

    cbbBasisType.ItemIndex := -1;

    if (ENServicesRentObj.basisType <> nil ) then
    begin
       try
         cbbBasisType.ItemIndex := StrToInt(ENServicesRentObj.basisType.DecimalString);
       except
         on EConvertError do cbbBasisType.ItemIndex := -1;
       end;

            if (ENServicesRentObj.basisType.DecimalString <> '3') and ( DialogState = dsEdit ) then
             DisableControls([edtWarrantContrAgentFIO , edtWarrantContrAgentNumber , edtWarrantContrAgentDate]);
      end

    else
      begin
       DisableControls([edtWarrantContrAgentFIO , edtWarrantContrAgentNumber , edtWarrantContrAgentDate]);
       cbbBasisType.ItemIndex := 0;
      end;


    cbContractKind.ItemIndex := -1;
    if ((ENServicesRentObj.contractKindRef <> nil) and
        (ENServicesRentObj.contractKindRef.code <> LOW_INT)) then
      begin
       try
         cbContractKind.ItemIndex := ENServicesRentObj.contractKindRef.code-4;
       except
         on EConvertError do cbContractKind.ItemIndex := -1;
       end;
      end;

    {
      if not (ENServicesRentObj.contractKindRef.code in
      [SERVICES_CONTRACT_KIND_OKSN_ACCESS,
       SERVICES_CONTRACT_KIND_OKSN_AGREEMENT,
       SERVICES_CONTRACT_KIND_OKSN_WORK,
       SERVICES_CONTRACT_KIND_OKSN_TU_MODIFY]) then begin
        HideControls([gpbLinkedServices]);
      end else begin
		getLinkedServices;
	  end;
    }
    if (ENServicesRentObj.contractKindRef.code = SERVICES_CONTRACT_KIND_OKSN_TU) then
      HideControls([gpbLinkedServices, btnContractExtraditionTU])
    else
      getLinkedServices;

  end;

    DisableControls([edtDepartmentForServices]);
    DenyBlankValues([edtDepartmentForServices]);

    checkWarrant := true;


end;


procedure TfrmENServicesRentEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
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
      ENServicesRentObj.code:=low(Integer);
      //** +++ cottageCode, startDate, endDate, tabNumber   */

      TempENServicesObject.addForCalculation(ENServicesRentObj,
        cottageCode, startPeriodDate, endPeriodDate, tabNumber, FIO);
    end;
  end else
  if (DialogState = dsEdit) then
  begin
    if (ENServicesRentObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
      if edtcontractDateFin.checked then
      begin
        if ENServicesRentObj.contractDate = nil then
          ENServicesRentObj.contractDate := TXSDate.Create;
        ENServicesRentObj.contractDate.XSToNative(GetXSDate(edtcontractDateFin.DateTime));
      end
      else begin
        Application.MessageBox(PChar('Введите дату договора!'),PChar('Внимание!'), MB_ICONWARNING);
        Action := caNone;
        ENServicesRentObj.contractDate := nil;
        pcCalculation.ActivePage := tsGeneral;
        if edtcontractDateFin.CanFocus then
          edtcontractDateFin.SetFocus;
        Exit;
      end;

      if edtcontractDateServices.checked then
      begin
        if ENServicesRentObj.contractDateServices = nil then
          ENServicesRentObj.contractDateServices := TXSDate.Create;
        ENServicesRentObj.contractDateServices.XSToNative(GetXSDate(edtcontractDateServices.DateTime));
      end
      else begin
        Application.MessageBox(PChar('Введите дату договора!'),PChar('Внимание!'), MB_ICONWARNING);
        Action := caNone;
        ENServicesRentObj.contractDateServices := nil;
        pcCalculation.ActivePage := tsGeneral;
        if edtcontractDateServices.CanFocus then
          edtcontractDateServices.SetFocus;
        Exit;
      end;


      //////////////////////////////////////
      if (rent) then
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


      if (ENServicesRentObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_DRAFT) then
        ENServicesRentObj.name := ' '
      else
        ENServicesRentObj.name := edtName.Text; // контрагент из фин договора

      ENServicesRentObj.partnerCode := edtPartnerCode.Text;
      ENServicesRentObj.finDocCode := edtFinDocCode.Text;

      if ( edtFinDocID.Text <> '' ) then
        ENServicesRentObj.finDocID := StrToInt(edtFinDocID.Text)
      else
        ENServicesRentObj.finDocID := Low(Integer) ;

      ENServicesRentObj.commentGen := edtCommentGen.Text;

      ENServicesRentObj.contractNumberServices := edtContractNumberServices.Text; // наш
      ENServicesRentObj.contractNumber := edtContractNumber.Text;
      ENServicesRentObj.contragentName := edtContragentName.Text; // контрагент услуги
      ENServicesRentObj.contragentAddress := edtContragentAddress.Text;
      ENServicesRentObj.contragentOkpo := edtContragentOkpo.Text;
      ENServicesRentObj.contragentPosition := edtContragentPosition.Text;
      ENServicesRentObj.contragentBankAccount := edtContragentBankAccount.Text;
      ENServicesRentObj.contragentBankName := edtContragentBankName.Text;
      ENServicesRentObj.contragentBankMfo := edtContragentBankMfo.Text;

      ENServicesRentObj.contragentBossName := edtContragentBossName.Text;
      ENServicesRentObj.contragentPassport := edtContragentPassport.Text;

      ENServicesRentObj.commentServicesGen := edtCommentServicesGen.Text;

      if (ENServicesRentObj.basisType = nil ) then
     ENServicesRentObj.basisType := TXSDecimal.Create;
     if ( (cbbBasisType.ItemIndex <> -1 ) and  (cbbBasisType.ItemIndex <> 0) ) then
       ENServicesRentObj.basisType.decimalString := IntToStr(cbbBasisType.itemIndex)
     else
       ENServicesRentObj.basisType := nil;

     if (ENServicesRentObj.contractKindRef = nil ) then
     ENServicesRentObj.contractKindRef := ENServicesContractKindRef.Create;
     if  (cbContractKind.ItemIndex <> -1 )   then
       ENServicesRentObj.contractKindRef.code := cbContractKind.itemIndex+4
     else
       ENServicesRentObj.contractKindRef.code := LOW_INT;


      if edtexecuteWorkDate.checked then
      begin
        if ENServicesRentObj.executeWorkDate = nil then
          ENServicesRentObj.executeWorkDate := TXSDate.Create;
        ENServicesRentObj.executeWorkDate.XSToNative(GetXSDate(edtexecuteWorkDate.DateTime));
      end
      else
        ENServicesRentObj.executeWorkDate := nil;

      if edttimeStart.checked then
      begin
        if ENServicesRentObj.timeStart = nil then
          ENServicesRentObj.timeStart := TXSDateTime.Create;
        ENServicesRentObj.timeStart.XSToNative(GetXSDateTime(edttimeStart.DateTime));
      end
      else
        ENServicesRentObj.timeStart := nil;

      if edttimeFinal.checked then
      begin
        if ENServicesRentObj.timeFinal = nil then
          ENServicesRentObj.timeFinal := TXSDateTime.Create;
        ENServicesRentObj.timeFinal.XSToNative(GetXSDateTime(edttimeFinal.DateTime));
      end
      else
        ENServicesRentObj.timeFinal := nil;

      ENServicesRentObj.contragentPhoneNumber := edtContragentPhoneNumber.Text;
     ENServicesRentObj.executorPhoneNumber := edtExecutorPhoneNumber.Text;

      // 21.09.12 NET-3079
      ENServicesRentObj.isCustomerMaterials := Ord(chbIsCustomerMaterials.Checked);
      // Если признак использования материалов заказчика сбросили, то нужно очистить
      // номер и дату акта приема-передачи
      if not chbIsCustomerMaterials.Checked then
      begin
        ENServicesRentObj.actTransferNumber := '';
        ENServicesRentObj.actTransferDate := nil;
      end;

      if (ENServicesRentObj.lineLength = nil ) then
     ENServicesRentObj.lineLength := TXSDecimal.Create;
     if edtLineLength.Text <> '' then
       ENServicesRentObj.lineLength.decimalString := edtLineLength.Text
     else
       ENServicesRentObj.lineLength := nil;

     ENServicesRentObj.citiesList := edtCitiesList.Text;
     ENServicesRentObj.projectCode := edtProjectCode.Text;

     ENServicesRentObj.warrantNumber := edtWarrantContrAgentNumber.Text;
      ENServicesRentObj.warrantFIO := edtWarrantContrAgentFIO.Text;

      if edtWarrantContrAgentDate.checked then
      begin
        if ENServicesRentObj.warrantDate = nil then
        ENServicesRentObj.warrantDate := TXSDate.Create;
        ENServicesRentObj.warrantDate.XSToNative(GetXSDate(edtWarrantContrAgentDate.DateTime));
      end
      else
      ENServicesRentObj.warrantDate := nil;

      if DialogState = dsEdit then
      begin
        TempENServicesObject.saveForCalculation(ENServicesRentObj)
      end;

   end;
end;


procedure TfrmENServicesRentEdit.btnENDepartmentDepartmentClick(Sender : TObject);
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
              // if ENServicesRentObj.department = nil then ENServicesRentObj.department := ENDepartment.Create();
               DepartmentForServicesCode := ENDepartmentShort(tvDep.Selected.Data).code;
               edtDepartmentForServices.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
              // if  ENServicesRentObj.element = nil then  ENServicesRentObj.element := ENElement.Create;
              // if  ENServicesRentObj.element.renRef = nil then ENServicesRentObj.element.renRef := EPRenRef.Create;
              // ENServicesRentObj.element.renRef.code := StrToInt(DMReports.getEPRenByDepartmentCode(ENServicesRentObj.department.code));
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;



procedure TfrmENServicesRentEdit.btnENElementElementClick(Sender : TObject);
var
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENServicesRentObj.element = nil then ENServicesRentObj.element := ENElement.Create();
               ENServicesRentObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;



procedure TfrmENServicesRentEdit.btnContractExtraditionTUClick(Sender: TObject);
Var
TempENServicesCalculation: ENServicesObjectControllerSoapPort;
newFrmENServicesRentEdit: TfrmENServicesRentEdit;
TempENServicesRentObj: ENServicesObject;
begin
  if (DialogState = dsView) then
  begin
      TempENServicesRentObj := ENServicesRentObj;
      newFrmENServicesRentEdit := TfrmENServicesRentEdit.Create(Application, dsView);
      if (rent)
        then newFrmENServicesRentEdit.rent := True;
      if codeServicesRent > 0 then
      begin
           TempENServicesCalculation := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
          try
             ENServicesRentObj := TempENServicesCalculation.getObject(codeServicesRent);
          except
           on EConvertError do Exit;
          end;
      end
      else
          Exit;

      newFrmENServicesRentEdit.edtStatus.Text := contractStatusName;
      try
        newFrmENServicesRentEdit.ShowModal;
      finally
        ENServicesRentObj :=  TempENServicesRentObj;
        newFrmENServicesRentEdit.Free;
        newFrmENServicesRentEdit:=nil;
      end;
  end
  else
      Application.MessageBox(PChar('Відкрити договір на видачу ТУ, можно якщо вікно знаходиться в режимі перегляду !'),PChar('Внимание!'), MB_ICONWARNING);
end;

procedure TfrmENServicesRentEdit.btnContractNumberSelectClick(Sender: TObject);
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

procedure TfrmENServicesRentEdit.spbContractNumberSelectClick(
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


procedure TfrmENServicesRentEdit.spbENDepartmentDepartmentClick(
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
               if ENServicesRentObj.department = nil then ENServicesRentObj.department := ENDepartment.Create();
               ENServicesRentObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
               if  ENServicesRentObj.element = nil then  ENServicesRentObj.element := ENElement.Create;
               if  ENServicesRentObj.element.renRef = nil then ENServicesRentObj.element.renRef := EPRenRef.Create;
               ENServicesRentObj.element.renRef.code := StrToInt(DMReports.getEPRenByDepartmentCode(ENServicesRentObj.department.code));
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENServicesRentEdit.actUpdateBillExecute(Sender: TObject);
Var i, j: Integer;
begin
updateBills(Sender);
end;

procedure TfrmENServicesRentEdit.actUpdateCAIExecute(Sender: TObject);
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
     CAIFilter.servicesObjectRef.code := ENServicesRentObj.code;


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

procedure TfrmENServicesRentEdit.actUpdateExecute(Sender: TObject);
begin
  inherited;
  pcCalculationChange(self);
end;

procedure TfrmENServicesRentEdit.actViewExecute(Sender: TObject);
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


procedure TfrmENServicesRentEdit.pcCalculationChange(
  Sender: TObject);
var
  TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
  planItemFilter: ENPlanWorkItemFilter;
  i,LastCountM: Integer;
  ENPlanWorkItemList: ENPlanWorkItemShortList;
  vNormOfTime,vCountGen: Double;
  /////
  TempENPlanWork2ClassificationType: ENPlanWork2ClassificationTypeControllerSoapPort;
  plan2ctFilter: ENPlanWork2ClassificationTypeFilter;
  LastCount,  LastRow: Integer;
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
  ////
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

    if rent then
    begin
      plan2ctFilter.conditionSQL := 'planrefcode in (select p.code from enplanwork p where p.elementrefcode = ' +
        IntToStr(ENServicesRentObj.element.code) + ' and p.kindcode = ' + IntToStr(ENPLANWORKKIND_CALCULATION) + ')';
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

    if rent then
    begin
      planItemFilter.conditionSQL := 'planrefcode in (select p.code from enplanwork p where p.elementrefcode = ' +
        IntToStr(ENServicesRentObj.element.code) + ' and p.kindcode = ' + IntToStr(ENPLANWORKKIND_CALCULATION) + ')';
    end
    else begin
      if planItemFilter.planRef = nil then planItemFilter.planRef := ENPlanWorkRef.Create;
      planItemFilter.planRef.code := planCode; //DMReports.getPlanCodeByElement(ENServicesRentObj.element.code); // выбрать по коду элемента код плана  ENPlanWorkObj.code;
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

    if ENServicesRentObj = nil then Exit;
    if ENServicesRentObj.element = nil then Exit;
    if ENServicesRentObj.element.code = LOW_INT then Exit;

    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    planFilter := ENPlanWorkFilter.Create;
    SetNullIntProps(planFilter);
    SetNullXSProps(planFilter);

   // planFilter.elementRef := ENElementRef.Create;
   // planFilter.elementRef.code := ENServicesRentObj.element.code;
   planFilter.conditionSQL:='(ENPLANWORK.ELEMENTREFCODE = ' + IntToStr(ENServicesRentObj.element.code) +
                            ' OR (EXISTS (SELECT 1 FROM enservices2plan AS sp1 WHERE sp1.servicesobjectrefcode = ' + IntToStr(ENServicesRentObj.code) +
                            '             AND sp1.planrefcode = ENPLANWORK.CODE )))';
   ///

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

  if pcCalculation.ActivePage = tsRentItems then
  begin
    updateItems(Sender);
    updateP04(Sender);
    updateP10(Sender);
  end;

end;

procedure TfrmENServicesRentEdit.FormCreate(Sender: TObject);
begin
  inherited;
  planCode := LOW_INT;
  rent := false;
  checkWarrant := true;
  isNotCalculated := True;
end;


procedure TfrmENServicesRentEdit.actPrintCalculationExecute( Sender: TObject);
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

  argNames[0] := 'soCode';

    if (DialogState = dsInsert) then
     begin
     ENServicesRentObj := DMReports.getServicesObjectByPlanCode(planCode);
     args[0] := IntToStr(ENServicesRentObj.code);
     end
  else
     args[0] := IntToStr(ENServicesRentObj.code);


  reportName := '201109/ActCalcAdditionalWorkG/ActCalc';

  makeReport(reportName , argNames , args , 'xls');
end;

procedure TfrmENServicesRentEdit.SetFormCaption(elementCode: Integer);
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

      if (rent) then
        Self.Caption := 'Договори аренди. Договір № ' + servicesObjList.list[0].contractNumberServices
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

 
procedure TfrmENServicesRentEdit.btnPrintContract4AccessClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  if ENServicesRentObj = nil then Exit;
  if ENServicesRentObj.contractTypeRef = nil then Exit;
  if ENServicesRentObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesRentObj.calcTypeRef = nil then Exit;
  if ENServicesRentObj.calcTypeRef.code = LOW_INT then Exit;
  if ENServicesRentObj.contractStatusRef = nil then Exit;

  if ENServicesRentObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'soCode';
    args[0] := IntToStr(ENServicesRentObj.code);

    reportName := 'Services/4Rent/d_access';

    makeReport(reportName, argNames, args, 'pdf');

end;

procedure TfrmENServicesRentEdit.btnPrintContract4AgreeClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  if ENServicesRentObj = nil then Exit;
  if ENServicesRentObj.contractTypeRef = nil then Exit;
  if ENServicesRentObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesRentObj.calcTypeRef = nil then Exit;
  if ENServicesRentObj.calcTypeRef.code = LOW_INT then Exit;
  if ENServicesRentObj.contractStatusRef = nil then Exit;

  if ENServicesRentObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'soCode';
    args[0] := IntToStr(ENServicesRentObj.code);

    reportName := 'Services/4Rent/d_agree';

    makeReport(reportName, argNames, args, 'pdf');

end;

procedure TfrmENServicesRentEdit.btnPrintContract4RecoveryClick(
  Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  if ENServicesRentObj = nil then Exit;
  if ENServicesRentObj.contractTypeRef = nil then Exit;
  if ENServicesRentObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesRentObj.calcTypeRef = nil then Exit;
  if ENServicesRentObj.calcTypeRef.code = LOW_INT then Exit;
  if ENServicesRentObj.contractStatusRef = nil then Exit;

  if ENServicesRentObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'soCode';
    args[0] := IntToStr(ENServicesRentObj.code);

    reportName := 'Services/4Rent/d_recovery';

    makeReport(reportName, argNames, args, 'pdf');

end;


procedure TfrmENServicesRentEdit.btnPrintContract4RentClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  if ENServicesRentObj = nil then Exit;
  if ENServicesRentObj.contractTypeRef = nil then Exit;
  if ENServicesRentObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesRentObj.calcTypeRef = nil then Exit;
  if ENServicesRentObj.calcTypeRef.code = LOW_INT then Exit;
  if ENServicesRentObj.contractStatusRef = nil then Exit;
  if ENServicesRentObj.contractKindRef = nil then Exit;
  if ENServicesRentObj.contractKindRef.code = LOW_INT then Exit;

  if ENServicesRentObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

    SetLength(argNames, 4);
    SetLength(args, 4);

    argNames[0] := 'soCode';
    args[0] := IntToStr(ENServicesRentObj.code);

    case ENServicesRentObj.contractKindRef.code of
      // Договори аренди (ОКСН)
      SERVICES_CONTRACT_KIND_OKSN_RENT :   reportName := 'Services/4Rent/d_rent';
      // Договори відшкодування витрат (ОКСН)
      SERVICES_CONTRACT_KIND_OKSN_WORK :  reportName := 'Services/4Rent/d_recovery';
      // Договори на видачу умов (ОКСН)
      SERVICES_CONTRACT_KIND_OKSN_TU : reportName := 'Services/4Rent/d_TU';
      //  Договори на узгодження проекту (ОКСН)
      SERVICES_CONTRACT_KIND_OKSN_AGREEMENT : reportName := 'Services/4Rent/d_agree';
      // Договори на допуск (ОКСН)
      SERVICES_CONTRACT_KIND_OKSN_ACCESS : reportName := 'Services/4Rent/d_access';
      // Договори на внесення змін до ТУ (ОКСН)
      SERVICES_CONTRACT_KIND_OKSN_TU_MODIFY : reportName := 'Services/4Rent/d_TU_modify';
    end;

    if ((ENServicesRentObj.contractKindRef.code <> SERVICES_CONTRACT_KIND_OKSN_TU) or
        (ENServicesRentObj.contractKindRef.code <> SERVICES_CONTRACT_KIND_OKSN_TU_MODIFY) or
        (ENServicesRentObj.contractKindRef.code <> SERVICES_CONTRACT_KIND_OKSN_AGREEMENT))then
    makeReport(reportName, argNames, args, 'pdf');

     if ENServicesRentObj.contractKindRef.code in [SERVICES_CONTRACT_KIND_OKSN_AGREEMENT] then
    begin

       frmPrintAgreeRentTU := TfrmPrintAgreeRentTU.Create(Application, dsInsert);
       frmPrintAgreeRentTU.chkOldTU.Visible := False;
       frmPrintAgreeRentTU.edtContragent.Visible := False;
       frmPrintAgreeRentTU.edtNote.Visible := False;
       frmPrintAgreeRentTU.Label1.Visible := False;
       frmPrintAgreeRentTU.Label2.Visible := False;
       try
        if frmPrintAgreeRentTU.ShowModal = mrOk then
          begin
          argNames[1] := 'tu_number';
          if (frmPrintAgreeRentTU.edtNumberDoc.Text <> '') then
            args[1] := frmPrintAgreeRentTU.edtNumberDoc.Text
          else
            args[1] := 'не визначено';
          makeReport(reportName, argNames, args, 'pdf');
          end;
        finally
        frmPrintAgreeRentTU.Free;
        end;

    end;


    // дополнительно печатаем сами ТУ
    if ENServicesRentObj.contractKindRef.code in [SERVICES_CONTRACT_KIND_OKSN_TU, SERVICES_CONTRACT_KIND_OKSN_TU_MODIFY] then
    begin

      frmPrintAgreeRentTU := TfrmPrintAgreeRentTU.Create(Application, dsInsert);
       try
        if frmPrintAgreeRentTU.ShowModal = mrOk then
        begin
        // сначала печатаем договор на ТУ
        makeReport(reportName, argNames, args, 'pdf');

        argNames[1] := 'contragent';
           if (frmPrintAgreeRentTU.edtContragent.Text <> '') then
            args[1] := frmPrintAgreeRentTU.edtContragent.Text
          else
            args[1] := 'не визначено';

          argNames[2] := 'docnumber';
          if (frmPrintAgreeRentTU.edtNumberDoc.Text <> '') then
            args[2] := frmPrintAgreeRentTU.edtNumberDoc.Text
          else
            args[2] := 'не визначено';

          argNames[3] := 'note';
           if (frmPrintAgreeRentTU.edtNote.Text <> '') then
            args[3] := frmPrintAgreeRentTU.edtNote.Text
          else
            args[3] := '';

          if frmPrintAgreeRentTU.chkOldTU.Checked then
          reportName := 'Services/4Rent/d_TU_post_old'
          else
          reportName := 'Services/4Rent/d_TU_post';
          makeReport(reportName, argNames, args, 'pdf');
         ///
        end;
        finally
        frmPrintAgreeRentTU.Free;
        end;



    end;





end;


procedure TfrmENServicesRentEdit.btnPrintContract4TUClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  if ENServicesRentObj = nil then Exit;
  if ENServicesRentObj.contractTypeRef = nil then Exit;
  if ENServicesRentObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesRentObj.calcTypeRef = nil then Exit;
  if ENServicesRentObj.calcTypeRef.code = LOW_INT then Exit;
  if ENServicesRentObj.contractStatusRef = nil then Exit;

  if ENServicesRentObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'soCode';
    args[0] := IntToStr(ENServicesRentObj.code);

    reportName := 'Services/4Rent/d_TU';

    makeReport(reportName, argNames, args, 'pdf');

end;

procedure TfrmENServicesRentEdit.btnPrintActClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
  copystr: String;
begin
  inherited;
  if ENServicesRentObj = nil then Exit;
  if ENServicesRentObj.contractTypeRef = nil then Exit;
  if ENServicesRentObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesRentObj.calcTypeRef = nil then Exit;
  if ENServicesRentObj.calcTypeRef.code = LOW_INT then Exit;

  /////
  if ENServicesRentObj.contractStatusRef = nil then Exit;
  if ENServicesRentObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'soCode';
  args[0] := IntToStr(ENServicesRentObj.code);

  reportName := '201109/ActDomikiServices/Act21';
  makeReport(reportName , argNames , args , 'pdf');
end;


procedure TfrmENServicesRentEdit.btnPrintActTechAgreementClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
begin
  inherited;
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'servicesObjectCode';
  args[0] := IntToStr(ENServicesRentObj.code);

  reportName := 'TechConditions/TechAgreement/act';
  makeReport(reportName, argNames, args, 'pdf');
end;


procedure TfrmENServicesRentEdit.btnPrintAlterClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  if ENServicesRentObj = nil then Exit;
  if ENServicesRentObj.contractTypeRef = nil then Exit;
  if ENServicesRentObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesRentObj.calcTypeRef = nil then Exit;
  if ENServicesRentObj.calcTypeRef.code = LOW_INT then Exit;
  if ENServicesRentObj.contractStatusRef = nil then Exit;
  if ENServicesRentObj.contractKindRef = nil then Exit;
  if ENServicesRentObj.contractKindRef.code = LOW_INT then Exit;

  if ENServicesRentObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'soCode';
    args[0] := IntToStr(ENServicesRentObj.code);

    if ENServicesRentObj.contractKindRef.code = SERVICES_CONTRACT_KIND_OKSN_RENT then
    begin
    reportName := 'Services/4Rent/d_rent_alter';
    makeReport(reportName, argNames, args, 'pdf');
    end;

    if ENServicesRentObj.contractKindRef.code = SERVICES_CONTRACT_KIND_OKSN_WORK then
    begin
    reportName := 'Services/4Rent/d_recovery_alter';
    makeReport(reportName, argNames, args, 'pdf');
    end;

    if ENServicesRentObj.contractKindRef.code = SERVICES_CONTRACT_KIND_OKSN_ACCESS then
    begin
    reportName := 'Services/4Rent/d_access_alter';
    makeReport(reportName, argNames, args, 'pdf');
    end;

end;

procedure TfrmENServicesRentEdit.actBudgetApprovedExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := ENServicesRentObj.code;
  except
    on EConvertError do Exit;
  end;

  if (ENServicesRentObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
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


procedure TfrmENServicesRentEdit.actUpdateObject(Sender: TObject);
Var TempServicesObject: ENServicesObjectControllerSoapPort;
    ObjCode: Integer;
begin
  if pcCalculation.ActivePage = tsListWork then
  begin
    TempServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
    ENServicesRentObj := TempServicesObject.getObject(ENServicesRentObj.code);
    actUpdateExecute(Sender);
  end;
end;

procedure TfrmENServicesRentEdit.spbWarrantNumberClick(
  Sender: TObject);
var frmENWarrantShow : TfrmENWarrantShow;
    f : ENWarrantFilter;
    warrant : ENWarrant;
    datContract, datWarrant : TXSDate;
    dtdatContract, dtdatWarrant : TDateTime;
    power: Double;
begin
  if not rent then
  begin
     datContract := TXSDate.Create;
     datWarrant := TXSDate.Create;

     f := ENWarrantFilter.Create();
     SetNullXSProps(f);
     SetNullIntProps(f);
     f.departmentRef := ENDepartmentRef.Create();
     f.departmentRef.code := ENServicesRentObj.department.code;
     f.conditionSQL := ' warrantstatusrefcode = 0';

     frmENWarrantShow := TfrmENWarrantShow.Create(Application,fmNormal, f);
     DisableActions([frmENWarrantShow.actNoFilter]);

     try
        with frmENWarrantShow do
          if ShowModal = mrOk then
          begin
              try

                 ENServicesRentObj.warrantRef := ENWarrantRef.Create();
                 ENServicesRentObj.warrantRef.code := StrToInt(GetReturnValue(sgENWarrant,0));

                  //////////////////////////////////////////////////////
                  ///   проверка даты доверенности с датой договора  ///
                  ///     суммы в доверенности с суммой договора     ///
                  //////////////////////////////////////////////////////

                  if  ENServicesRentObj.warrantRef.code <> LOW_INT then
                  begin
                    warrant := DMReports.getWarrantByCode(ENServicesRentObj.warrantRef.code);

                    datContract.XSToNative(GetXSDate(Self.edtContractDateServices.DateTime));
                    dtdatContract := EncodeDate(datContract.Year, datContract.Month, datContract.Day);
                    dtdatWarrant := EncodeDate(warrant.dateFinal.Year, warrant.dateFinal.Month, warrant.dateFinal.Day);

                    if (warrant.warrantStatusRef.code = WARRANT_INVALID) then
                    begin
                      Application.MessageBox(PChar('Довіреність недійсна!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                        edtWarrantNumber.Text := '';
                        edtWarrantFIO.Text := '';
                        ENServicesRentObj.warrantRef.code := LOW_INT;
                      Exit;
                    end;

                    if (dtdatContract > dtdatWarrant) then
                    begin
                      Application.MessageBox(PChar('Термін дії довіреності закінчився!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                        edtWarrantNumber.Text := '';
                        edtWarrantFIO.Text := '';
                        ENServicesRentObj.warrantRef.code := LOW_INT;
                      Exit;
                    end;

                    if (StrToFloat(ENServicesRentObj.contractServicesSumma.DecimalString) > StrToFloat(warrant.maxSum.DecimalString)) then
                    begin
                      Application.MessageBox(PChar('Сума у договорі перевищує гранічну суму у довіреності!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                        edtWarrantNumber.Text := '';
                        edtWarrantFIO.Text := '';
                        ENServicesRentObj.warrantRef.code := LOW_INT;
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
      if ENServicesRentObj.department = nil then
      begin
        Application.MessageBox(PChar('Спочатку оберіть підрозділ!'), PChar('Увага !'), MB_ICONWARNING);
        edtENDepartmentDepartmentName.SetFocus;
        Exit;
      end;

      if ENServicesRentObj.department.code = LOW_INT then
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
       f.departmentRef.code := ENServicesRentObj.department.code;

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
          (ENServicesRentObj.department.code = ENDEPARTMENT_HGES) then
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

                 ENServicesRentObj.warrantRef := ENWarrantRef.Create();
                 ENServicesRentObj.warrantRef.code := StrToInt(GetReturnValue(sgENWarrant,0));

                  //////////////////////////////////////////////////////
                  ///   проверка даты доверенности с датой договора  ///
                  ///     суммы в доверенности с суммой договора     ///
                  //////////////////////////////////////////////////////

                  if ENServicesRentObj.warrantRef.code <> LOW_INT then
                  begin
                    warrant := DMReports.getWarrantByCode(ENServicesRentObj.warrantRef.code);

                    datContract.XSToNative(GetXSDate(Self.edtContractDateServices.DateTime));
                    dtdatContract := EncodeDate(datContract.Year, datContract.Month, datContract.Day);
                    dtdatWarrant := EncodeDate(warrant.dateFinal.Year, warrant.dateFinal.Month, warrant.dateFinal.Day);

                    if (warrant.warrantStatusRef.code = WARRANT_INVALID) then
                    begin
                      Application.MessageBox(PChar('Довіреність недійсна!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                        edtWarrantNumber.Text := '';
                        edtWarrantFIO.Text := '';
                        ENServicesRentObj.warrantRef.code := LOW_INT;
                      Exit;
                    end;

                    if (dtdatContract > dtdatWarrant) then
                    begin
                      Application.MessageBox(PChar('Термін дії довіреності закінчився!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                        edtWarrantNumber.Text := '';
                        edtWarrantFIO.Text := '';
                        ENServicesRentObj.warrantRef.code := LOW_INT;
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

procedure TfrmENServicesRentEdit.actViewActExecute(Sender: TObject);
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

procedure TfrmENServicesRentEdit.actViewCAIExecute(Sender: TObject);
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

procedure TfrmENServicesRentEdit.actViewENActIncomeExecute(
  Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  ///// 14.05.13 NET-4235
  // Печать акта приема-передачи - только при статусах "Работы выполнены" и "Оплаченный" (для НОВЫХ договоров)
  if ENServicesRentObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT then
    if (ENServicesRentObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_COMPLETED) and
       (ENServicesRentObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_PAID) then
      raise Exception.Create('NET-4235 Для друку акту прийому-передачі договір повинен мати статус "Роботи виконані" або "Сплачений"!');
  /////

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'ContractCode';
  args[0] := IntToStr(ENServicesRentObj.code);

  if ENServicesRentObj.calcTypeRef.code <> ENSERVICESOBJECT_CALCTYPE_BY_FACT then
    reportName := '201109/ActCalcAdditionalWorkG/ActPriPer'
  else
    reportName := '201109/ActCalcAdditionalWorkG/ActPriPer2';

  makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmENServicesRentEdit.edtContractServicesPowerChange(
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


procedure TfrmENServicesRentEdit.actPrintKoshtorisExecute(
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

 argNames[0] := 'soCode';

    if (DialogState = dsInsert) then
     begin
     ENServicesRentObj := DMReports.getServicesObjectByPlanCode(planCode);
     args[0] := IntToStr(ENServicesRentObj.code);
     end
  else
     args[0] := IntToStr(ENServicesRentObj.code);

     reportName := '201109/ActCalcAdditionalWorkG/ActCalcOnlyRemainingcost';

     if ENServicesRentObj.contractKindRef.code = SERVICES_CONTRACT_KIND_OKSN_RENT
      // Договори аренди (ОКСН)
       then
       begin
        argNames[0] := 'ContractCode';
        args[0] :=   IntToStr(ENServicesRentObj.code);
        reportName := '201109/ActCalcAdditionalWorkG/ActCalcOnlyRemainingcost_rent';
       end;

  makeReport(reportName , argNames , args , 'xls');
end;


procedure TfrmENServicesRentEdit.actPreConfirmExecute(Sender: TObject);
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


procedure TfrmENServicesRentEdit.actPrintCalcNkreExecute(
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
      args[0] := IntToStr(DMReports.getPlanCodeForCalculationByElement(ENServicesRentObj.element.code));

   argNames[1] := 'licenzed';
   args[1] := IntToStr(Licensed);

   reportName := 'Calculation/ActCalc_Form1_NKRE';
   makeReport(reportName , argNames , args , 'pdf');

   reportName := 'Calculation/ActCalc_Form4_NKRE';
   makeReport(reportName , argNames , args , 'pdf');
end;


procedure TfrmENServicesRentEdit.btnPostingsClick(Sender: TObject);
begin
  frmPostingsEdit := TfrmPostingsEdit.Create(Application, dsInsert);
  try
    frmPostingsEdit.servicesObjectCode := ENServicesRentObj.code;
    frmPostingsEdit.servicesRelaxation := True;
    frmPostingsEdit.ShowModal;
  finally
    frmPostingsEdit.Free;
  end;

  pcCalculationChange(Sender);
end;


procedure TfrmENServicesRentEdit.updateRezervedView();
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

         if ENServicesRentObj.code <> 0 then
            codeServicesObject := ENServicesRentObj.code
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

                tempENTimeLineFilter.servicesObjectRef := ENServicesRentObj.Create;
                tempENTimeLineFilter.servicesObjectRef.code := codeServicesObject {ENServicesRentObj.code} ;
                TempENTimeLine :=  HTTPRIOENTimeLine as ENTimeLineControllerSoapPort;
                ENTimeLineList := TempENTimeLine.getScrollableFilteredList(tempENTimeLineFilter,0,-1);
                if High(ENTimeLineList.list) > -1 then
                begin
                   if ENTimeLineList.list[0].dateGen <> nil then
                    begin
                      edtReservedDate.DateTime:=EncodeDate(ENTimeLineList.list[0].dateGen.Year,ENTimeLineList.list[0].dateGen.Month,ENTimeLineList.list[0].dateGen.Day);
                      edtReservedDate.checked := true;
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


                TempTKClassification2ENDepartmentList :=  TempTKClassification2ENDepartment.getScrollableFilteredListForServices({ENServicesRentObj.code} codeServicesObject );
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

procedure TfrmENServicesRentEdit.RenderPlanner();
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

      //   if ENServicesRentObj.code <> 0 then
     //       codeServicesObject := ENServicesRentObj.code
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
              else servicesObj :=  TempEnServicesObject.getObject( ENServicesRentObj.code);
              codeServicesObject:= servicesObj.code;
   end;

               Self.Planner1.Items.Clear;
               Self.Planner1.Positions:= 1;
               Planner1.Header.Captions.Clear;
               Self.Planner1.ItemGap:= -1;
               
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

               Self.Planner1.Items.Clear;
               Self.Planner1.Positions:= LastCountBrigade+2;
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
                        TlnFilter.conditionSQL := 'ENSERVICESOBJECT.CODE <> ' + IntToStr( {ENServicesRentObj.code} codeServicesObject );

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
                                 with Self.Planner1.CreateItem do
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
                            With Self.Planner1.CreateItem do
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
                                    Color:= clBlue;
                                    CaptionType:= ctTimeText;
                                    CaptionFont.Size:= 6;
                                    Shape:= psRect;
                                    TrackVisible:= False;
                                    Shadow:= False;
                                 end;
                              //  время в пути c объекта
                              if  ((FormatDateTime('hh:mm',ENTimeLineList.list[tln].timeFinal.AsDateTime) <> '00:00' )
                                 and ( FormatDateTime('hh:mm',ENTimeLineList.list[tln].timeMoveOfObject.AsDateTime) <> '00:00' )) then
                                 with Self.Planner1.CreateItem do
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
                                 with Self.Planner1.CreateItem do
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
                                   // if ENServicesRentObj.code = 0 then
                                    Text.Text := 'Дог.№. ' + servicesObj.contractNumberServices + ' : Доставка до замовника' +
                                                  ' : з ' + FormatDateTime('hh.mm', ItemStartTime ) + ' до ' + FormatDateTime('hh.mm', ItemEndTime );
                                   // else
                                   // Text.Text := 'Дог.№. ' + ENServicesRentObj.contractNumberServices + ' : Доставка до замовника' +
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
                                 with Self.Planner1.CreateItem do
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
                                   // if ENServicesRentObj.code = 0 then
                                    Text.Text := 'Дог.№. ' + servicesObj.contractNumberServices + ' : Перебування на об`єкті' +
                                                  ' : з ' + FormatDateTime('hh.mm', ItemStartTime ) + ' до ' + FormatDateTime('hh.mm', ItemEndTime );
                                   // else
                                   // Text.Text := 'Дог.№. ' + ENServicesRentObj.contractNumberServices + ' : Перебування на об`єкті' +
                                   //               ' : з ' + FormatDateTime('hh.mm', ItemStartTime ) + ' до ' + FormatDateTime('hh.mm', ItemEndTime );

                                    Font.Size:= 4;
                                    Color:= clBlue;
                                    CaptionType:= ctTimeText;
                                    CaptionFont.Size:= 6;
                                    Shape:= psRect;
                                    TrackVisible:= False;
                                    Shadow:= False;


                                  end;
                                  //  время в пути c объекта
                                  if  ((FormatDateTime('hh:mm',edtReservedTimeFinal.DateTime) <> '00:00' )
                                  and ( FormatDateTime('hh:mm',edtDeliveryTimeFrom.DateTime) <> '00:00' )) then
                                 with Self.Planner1.CreateItem do
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
                                   // if ENServicesRentObj.code = 0 then
                                    Text.Text := 'Дог.№. ' + servicesObj.contractNumberServices + ' : Повернення на базу' +
                                                  ' : з ' + FormatDateTime('hh.mm', ItemStartTime ) + ' до ' + FormatDateTime('hh.mm', ItemEndTime );
                                   // else
                                   // Text.Text := 'Дог.№. ' + ENServicesRentObj.contractNumberServices + ' : Повернення на базу' +
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
                                 with Self.Planner1.CreateItem do
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
//                                  Self.Planner1.Header.Height:= 100;
//                                  Self.Planner1.Header.TextHeight := 100;
//                                  Self.Planner1.Header.Font.Size:= 6;
//                                  Self.Planner1.Display.DisplayScale := 2;
                                //  Self.Planner1.Header.Captions[vi+1] := TKVirtualBrigadeList.list[vi].nameCompound ;
                 end;

              //    Self.Planner1.Header.Height:= 200;
              //    Self.Planner1.Header.TextHeight := 200;
              //    Self.Planner1.Header.Font.Size:= 6;
              //    Self.Planner1.Display.DisplayScale := 20;
                  // Self.Planner1.UpdateNVI;
           end;




     end;
  end;
 

procedure TfrmENServicesRentEdit.sgDepartmentClick(Sender: TObject);
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
       TKVirtualBrigadeList := TempTKVirtualBrigade.getScrollableFilteredListForServices(TempTKVirtualBrigadeFilter,0,-1 , DateToStr(edtReservedDate.DateTime) , ENServicesRentObj.code ,strCodeActiveDepartment );


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

procedure TfrmENServicesRentEdit.btnInsertExecuteDateClick(Sender: TObject);
var TempENTimeLine: ENTimeLineControllerSoapPort;
    TempENServicesObject: ENServicesObjectControllerSoapPort;
tllist : ENTimeLineShortList;
tlArr :  ArrayOfENTimeLineShort;
tlObj : ENTimeLineShort;
soObj : ENServicesObject;
n , i  : Integer;
state : Boolean;

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

              TempENTimeLine.addTimeLine(ENServicesRentObj,tlArr);
              Application.MessageBox(PChar('Збережено!'), PChar('Повідомлення'), MB_ICONINFORMATION);

            end
      else
           begin
                Application.MessageBox(PChar('Треба обрати бригаду для виконання робіт !!!'),PChar('Внимание!'), MB_ICONWARNING);
                Exit;
           end;


  end;

end;

procedure TfrmENServicesRentEdit.sgBrigadeInDepartmentClick(
  Sender: TObject);
begin
//  inherited;
//    RenderPlanner;
end;

procedure TfrmENServicesRentEdit.sgBrigadeInDepartmentCheckBoxClick(
  Sender: TObject; ACol, ARow: Integer; State: Boolean);
begin
  inherited;

  RenderPlanner; 

end;

procedure TfrmENServicesRentEdit.sgDepartmentCheckBoxClick(
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

        if ENServicesRentObj.code <> 0 then
            codeServicesObject := ENServicesRentObj.code
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
       TKVirtualBrigadeList := TempTKVirtualBrigade.getScrollableFilteredListForServices(TempTKVirtualBrigadeFilter,0,-1 , DateToStr(edtReservedDate.DateTime) , {ENServicesRentObj.code} codeServicesObject ,strCodeActiveDepartment );


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

procedure TfrmENServicesRentEdit.edtReservedTimeStartChange(
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
function TfrmENServicesRentEdit.getSumTimeWorkForCalculation(codePlan : Integer):Double;
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


procedure TfrmENServicesRentEdit.miPrintActClick(Sender: TObject);
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

    reportName := 'Services/4Rent/ActPriPer2';

  makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmENServicesRentEdit.miPrintBillClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
    copystr: String;
    billCode : Integer;
begin
  if ENServicesRentObj = nil then Exit;
  if ENServicesRentObj.contractTypeRef = nil then Exit;
  if ENServicesRentObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesRentObj.calcTypeRef = nil then Exit;
  if ENServicesRentObj.calcTypeRef.code = LOW_INT then Exit;

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

procedure TfrmENServicesRentEdit.edtReservedTimeStartExit(
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

procedure TfrmENServicesRentEdit.edtReservedDateExit(
  Sender: TObject);
begin
 // inherited;
   RenderPlanner;
end;

function TfrmENServicesRentEdit.checkOtherTimeLine():Boolean;
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
         if ENServicesRentObj.code <> 0 then
            codeServicesObject := ENServicesRentObj.code
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

      tempENTimeLineFilter.conditionSQL := ' ENSERVICESOBJECT.CODE <> ' + IntToStr( codeServicesObject{ENServicesRentObj.code})  + ' and  ENTIMELINE.VIRTUALBRIGADEREFCODE in (' + codeStrVirtualBrigade + ')' ;
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


procedure TfrmENServicesRentEdit.edtReservedDateChange(
  Sender: TObject);
begin
  inherited;
     edtReservedTimeStartExit(self);
end;

procedure TfrmENServicesRentEdit.btnRemoveExecutedDateClick(
  Sender: TObject);
var TempENTimeLine: ENTimeLineControllerSoapPort;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити дату / час виконання робіт для бригад ?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;

   TempENTimeLine := HTTPRIOENTimeLine as ENTimeLineControllerSoapPort;
   TempENTimeLine.removeTimeLine(ENServicesRentObj);

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


procedure TfrmENServicesRentEdit.btnUpdateIsRealized0CCtower2jlcClick(
  Sender: TObject);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
begin
  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  if ENServicesRentObj <> nil then
    TempENServicesObject.updateIsRealizedCCtower2jlc(ENServicesRentObj.code, 0);//0 - не реализовано
end;

procedure TfrmENServicesRentEdit.btnUpdateIsRealized1CCtower2jlcClick(
  Sender: TObject);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
begin
  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  if ENServicesRentObj <> nil then
    TempENServicesObject.updateIsRealizedCCtower2jlc(ENServicesRentObj.code, 1);//1 - реализовано
end;

procedure TfrmENServicesRentEdit.cbbBasisTypeChange(Sender: TObject);
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

procedure TfrmENServicesRentEdit.SetActTransferVisibilityByStatus(servicesObjectStatus: Integer);
begin
{
  btnActTransferSave.Visible := (ENServicesRentObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_GOOD);
  btnActTransferMoveToFK.Visible := (ENServicesRentObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_GOOD);
  btnActTransferUnMoveToFK.Visible := (ENServicesRentObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_ACT_TRANSFER_CLOSED);
}

  // btnActTransferSave.Visible := (servicesObjectStatus = ENSERVICESOBJECT_FINSTATUS_GOOD);
  // btnActTransferMoveToFK.Visible := (servicesObjectStatus = ENSERVICESOBJECT_FINSTATUS_GOOD);
  // btnActTransferUnMoveToFK.Visible := (servicesObjectStatus = ENSERVICESOBJECT_FINSTATUS_ACT_TRANSFER_CLOSED);

  actActTransferSave.Visible := (servicesObjectStatus = ENSERVICESOBJECT_FINSTATUS_GOOD);
  actActTransferMoveToFK.Visible := (servicesObjectStatus = ENSERVICESOBJECT_FINSTATUS_GOOD);
  actActTransferUnMoveToFK.Visible := (servicesObjectStatus = ENSERVICESOBJECT_FINSTATUS_ACT_TRANSFER_CLOSED);
end;


procedure TfrmENServicesRentEdit.actActTransferPrintExecute(
  Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  SetLength(argNames, 1);
  SetLength(args, 1);

  argnames[0] := 'servicesObjectCode';
  args[0] := IntToStr(ENServicesRentObj.code);

  reportName := '201109/ActTransferForServices/Act';
  makeReport(reportName, argNames, args, 'xls');
end;

procedure TfrmENServicesRentEdit.actActTransferMoveToFKExecute(
  Sender: TObject);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
    tmpObj: ENServicesObject;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте провести Акт приймання-передачі?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK then
    Exit;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  TempENServicesObject.moveActTransferToFK(ENServicesRentObj.code);

  Application.MessageBox(PChar('Акт проведено!'), PChar('Інформація'), MB_ICONINFORMATION);

  tmpObj := TempENServicesObject.getObject(ENServicesRentObj.code);
  SetActTransferVisibilityByStatus(tmpObj.statusRef.code);
end;

procedure TfrmENServicesRentEdit.actActTransferUnMoveToFKExecute(
  Sender: TObject);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
    tmpObj: ENServicesObject;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити проведення Акту приймання-передачі?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK then
    Exit;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  TempENServicesObject.unMoveActTransferToFK(ENServicesRentObj.code);

  Application.MessageBox(PChar('Проведення акту відмінено!'), PChar('Інформація'), MB_ICONINFORMATION);

  tmpObj := TempENServicesObject.getObject(ENServicesRentObj.code);
  SetActTransferVisibilityByStatus(tmpObj.statusRef.code);
end;


procedure TfrmENServicesRentEdit.actAddBillExecute(Sender: TObject);
// Var TempENSOBill: ENSOBillControllerSoapPort;
begin
  // TempENSOBill := HTTPRIOENSOBill as ENSOBillControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSOBillObj:=ENSOBill.Create;

  ENSOBillObj.servicesObjectRef := ENServicesObjectRef.Create;
  ENSOBillObj.servicesObjectRef.code := ENServicesRentObj.code;

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

procedure TfrmENServicesRentEdit.actAddP04Execute(Sender: TObject);
Var
TempENSORItems2Post04 :  ENSORItems2Post04ControllerSoapPort;
sorItemCode, i, post04Code : Integer;
state_, isSel : boolean;
begin

  TempENSORItems2Post04 := HTTPRIOENSORItems2Post04 as ENSORItems2Post04ControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSORItems2Post04Obj:=ENSORItems2Post04.Create;
  SetNullIntProps(ENSORItems2Post04Obj);
  SetNullXSProps(ENSORItems2Post04Obj);

  sorItemCode  := StrToInt(sgENSORentItems.Cells[0,sgENSORentItems.Row]);
  ENSORItems2Post04Obj.sorItemRef := ENSORentItemsRef.Create;
  ENSORItems2Post04Obj.sorItemRef.code := sorItemCode;

  try
    frmENPost04OKSNShow :=TfrmENPost04OKSNShow.Create(Application, fmNormal);
    try
      if frmENPost04OKSNShow.ShowModal = mrOk then
      begin
             with frmENPost04OKSNShow do

              for i:=1 to sgENPost04OKSN.RowCount - 1 do
              begin
                 sgENPost04OKSN.GetCheckBoxState(1,i,state_);
                 if state_ then
                 begin

                    try
                      post04Code := StrToInt(sgENPost04OKSN.Cells[0, i ]);
                    except
                      on EConvertError do Exit;
                    end;

                     if ENSORItems2Post04Obj.post04Ref = nil then ENSORItems2Post04Obj.post04Ref := ENPost04OKSNRef.Create();
                     ENSORItems2Post04Obj.post04Ref.code := post04Code;
                     TempENSORItems2Post04.add(ENSORItems2Post04Obj);
                 end;

              end;
            updateP04(Sender);
      end;
    finally
      frmENPost04OKSNShow.Free;
      frmENPost04OKSNShow:=nil;
    end;
  finally
    ENSORItems2Post04Obj.Free;
  end;
end;

procedure TfrmENServicesRentEdit.actAddP10Execute(Sender: TObject);
Var
TempENSORItems2Post10 :  ENSORItems2Post10ControllerSoapPort;
sorItemCode, i, post10Code : Integer;
state_, isSel : boolean;
begin

  TempENSORItems2Post10 := HTTPRIOENSORItems2Post10 as ENSORItems2Post10ControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSORItems2Post10Obj:=ENSORItems2Post10.Create;
  SetNullIntProps(ENSORItems2Post10Obj);
  SetNullXSProps(ENSORItems2Post10Obj);

  sorItemCode  := StrToInt(sgENSORentItems.Cells[0,sgENSORentItems.Row]);
  ENSORItems2Post10Obj.sorItemRef := ENSORentItemsRef.Create;
  ENSORItems2Post10Obj.sorItemRef.code := sorItemCode;

  try
    frmENPost10OKSNShow :=TfrmENPost10OKSNShow.Create(Application, fmNormal);
    try
      if frmENPost10OKSNShow.ShowModal = mrOk then
      begin
             with frmENPost10OKSNShow do

              for i:=1 to sgENPost10OKSN.RowCount - 1 do
              begin
                 sgENPost10OKSN.GetCheckBoxState(1,i,state_);
                 if state_ then
                 begin

                    try
                      post10Code := StrToInt( sgENPost10OKSN.Cells[0, i ]);
                    except
                      on EConvertError do Exit;
                    end;

                     if ENSORItems2Post10Obj.post10Ref = nil then ENSORItems2Post10Obj.post10Ref := ENPost10OKSNRef.Create();
                     ENSORItems2Post10Obj.post10Ref.code := post10Code;
                     TempENSORItems2Post10.add(ENSORItems2Post10Obj);
                 end;

              end;
            updateP10(Sender);
      end;
    finally
      frmENPost10OKSNShow.Free;
      frmENPost10OKSNShow:=nil;
    end;
  finally
    ENSORItems2Post10Obj.Free;
  end;
end;

procedure TfrmENServicesRentEdit.actAddRentItemExecute(Sender: TObject);
begin
   ENSORentItemsObj:=ENSORentItems.Create;
   ENSORentItemsObj.servicesObjectRef := ENServicesObjectRef.Create;
   ENSORentItemsObj.servicesObjectRef.code := ENServicesRentObj.code;

  try
    frmENSORentItemsEdit:=TfrmENSORentItemsEdit.Create(Application, dsInsert);
    try


      if frmENSORentItemsEdit.ShowModal = mrOk then
      begin
        if ENSORentItemsObj<>nil then
            //TempENSORentItems.add(ENSORentItemsObj);
            updateItems(Sender);
      end;
    finally
      frmENSORentItemsEdit.Free;
      frmENSORentItemsEdit:=nil;
    end;
  finally
    ENSORentItemsObj.Free;
  end;
end;

procedure TfrmENServicesRentEdit.actAddScheduleExecute(Sender: TObject);
var  TempENServicesObject2PaymentSchedule :  ENServicesObject2PaymentScheduleControllerSoapPort;
begin
  inherited;
        //------------------------------------------------
    TempENServicesObject2PaymentSchedule := HTTPRIOENServicesObject2PaymentSchedule as ENServicesObject2PaymentScheduleControllerSoapPort;
    ENServicesObject2PaymentScheduleObj := ENServicesObject2PaymentSchedule.Create;
    ENServicesObject2PaymentScheduleObj.servicesObjectRef := ENServicesObjectRef.Create;
    ENServicesObject2PaymentScheduleObj.servicesObjectRef.code := ENServicesRentObj.code;

    try

      frmENServicesObject2PaymentScheduleEdit := TfrmENServicesObject2PaymentScheduleEdit.Create(Application, dsInsert);
      frmENServicesObject2PaymentScheduleEdit.servicesObject := ENServicesRentObj.code;

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

procedure TfrmENServicesRentEdit.actAttachPlanExecute(Sender: TObject);
 var
TempENPlanWork : ENPlanWorkControllerSoapPort;
planFilter : ENPlanWorkFilter;
plan : ENPlanWork;

begin
  inherited;

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
           TempENPlanWork.addPlan2ShiftLineServices(plan,ENServicesRentObj.code);
        end;

        actUpdateExecute(Sender);
      end;
    finally
      frmENPlanWorkShow.Free;
      frmENPlanWorkShow:=nil;
    end;
end;

function TfrmENServicesRentEdit.CheckCountersByClassifications(): Boolean;
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


procedure TfrmENServicesRentEdit.spbENResponsibleClick(
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
        ENServicesRentObj.resposible := GetReturnValue(sgFINWorker, 1);
        ENServicesRentObj.resposibleTabNumber := GetReturnValue(sgFINWorker, 2);
        ENServicesRentObj.resposiblePosition := GetReturnValue(sgFINWorker, 3);
        //edtENResponsible.Text := ENServicesRentObj.resposiblePosition + ' ' + ENServicesRentObj.resposible;
      end;
  finally
    frmFINWorkerShow.Free;
  end;
end;


procedure TfrmENServicesRentEdit.spbEraseLinkedServicesObjectClick(
  Sender: TObject);
var
	TempENServicesObject : ENServicesObjectControllerSoapPort;
	elel : ENElement2ENElement;
begin
	if (ENServicesRentObj = nil) or (ENServicesRentObj.code = Low(Integer)) then Exit;
	elel := getLinkedServices;
	TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
	if elel = nil then Exit;
	if Application.MessageBox(PChar('Ви дійсно бажаєте видалити зв''язок між договорами?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
	  elel.elementOutRef.code := Low(Integer);
      TempENServicesObject.changeLinkBetweenServices(elel);
	  getLinkedServices;
	  Application.MessageBox(PChar('Зв''язок видалено'), PChar('Увага!'), MB_ICONINFORMATION);
  end;

end;

procedure TfrmENServicesRentEdit.spbLinkedServicesObjectClick(Sender: TObject);
var
	TempENServicesObject : ENServicesObjectControllerSoapPort;
	frmShowENServicesObject : TfrmENServicesObjectShow;
	linkedServicesFilter : ENServicesObjectFilter;
	servicesObjectCode : Integer;
	servicesObject : ENServicesObject;
	elel : ENElement2ENElement;
begin
	if (ENServicesRentObj = nil) or (ENServicesRentObj.code = Low(Integer)) then Exit;
	TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
	linkedServicesFilter := ENServicesObjectFilter.Create;
	SetNullXSProps(linkedServicesFilter);
	SetNullIntProps(linkedServicesFilter);
	linkedServicesFilter.contractKindRef := ENServicesContractKindRef.Create;
	linkedServicesFilter.contractKindRef.code := ENConsts.SERVICES_CONTRACT_KIND_OKSN_TU;
	frmShowENServicesObject := TfrmENServicesObjectShow.Create(Application,fmNormal, linkedServicesFilter);
    DisableActions([frmShowENServicesObject.actNoFilter]);
	try
		with frmShowENServicesObject do
			if ShowModal = mrOk then begin

				try
					servicesObjectCode := StrToInt(GetReturnValue(sgENServicesObject,0));
				except on EConvertError do Exit;
				end;
				servicesObject := TempENServicesObject.getObject(servicesObjectCode);

				if Application.MessageBox(PChar('Ви дійсно бажаєте зв''язати договір № ' + servicesObject.contractNumberServices
					+ ' від ' + XSDate2String(servicesObject.contractDateServices) + ' до договору № '
					+ ENServicesRentObj.contractNumberServices + ' від ' + XSDate2String(ENServicesRentObj.contractDateServices) + ' ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then begin
					elel := getLinkedServices;
					if(elel = nil) then begin
						elel := ENElement2ENElement.Create;
						SetNullXSProps(elel);
						SetNullIntProps(elel);
						elel.elementInRef := ENElementRef.Create;
						elel.elementInRef.code := ENServicesRentObj.element.code;
					end;
					elel.elementOutRef := ENElementRef.Create;
					elel.elementOutRef.code := servicesObject.element.code;
					TempENServicesObject.changeLinkBetweenServices(elel);
					getLinkedServices;
					Application.MessageBox(PChar('Договори зв''язано!'), PChar('Повідомлення'), MB_ICONINFORMATION);
				end;

			end;
	finally
        frmShowENServicesObject.Free;
     end;
end;

procedure TfrmENServicesRentEdit.btnActPriPerCountersClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'enservicesobjectcode';
  args[0] := IntToStr(ENServicesRentObj.code);

  reportName :=  'Calculation/ActPriPerCounters';
  makeReport(reportName , argNames , args , 'pdf');
end;


procedure TfrmENServicesRentEdit.spbActWarrantNumberClick(Sender: TObject);
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
    f.departmentRef.code := ENServicesRentObj.department.code;

    if (rgContragentType.ItemIndex in [ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET,
                                      ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NONBUDGET,
                                      ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL_NOREZIDENT,
                                      ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NOREZIDENT]) and
      (ENServicesRentObj.department.code = ENDEPARTMENT_HGES) then
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


procedure TfrmENServicesRentEdit.sgENPlanWorkClick(Sender: TObject);
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


procedure TfrmENServicesRentEdit.sgENPlanWorkRightClickCell(
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

procedure TfrmENServicesRentEdit.sgENSOBillClick(Sender: TObject);
begin
  inherited;
  updatePayments(Sender);
  updateProvs(Sender);
end;


procedure TfrmENServicesRentEdit.sgENSORentItemsClick(Sender: TObject);
begin
  inherited;
  updateP04(Sender);
  updateP10(Sender);
end;

procedure TfrmENServicesRentEdit.plansPopup(plan: ENPlanWork);
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

  if not (ENServicesRentObj.contractStatusRef.code in [ENSERVICESOBJECTSTATUS_COMPLETED,
                                                         ENSERVICESOBJECTSTATUS_TERMINATED]) then
  begin
    if (ENServicesRentObj.statusRef.code <> ENSERVICESOBJECT_FINSTATUS_CLOSED) and
       (ENServicesRentObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
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

procedure TfrmENServicesRentEdit.actEditPlanExecute(
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
        ENServicesRentObj.contractTypeRef.code =
        ENSERVICESOBJECTTYPE_CONNECTION);
      frmENPlanWorkEdit.soElementCode := ENServicesRentObj.element.code;
          
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


procedure TfrmENServicesRentEdit.actEditPostingsExecute(Sender: TObject);
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

procedure TfrmENServicesRentEdit.actEditRentItemExecute(Sender: TObject);
  Var TempENSORentItems: ENSORentItemsControllerSoapPort;
begin
 TempENSORentItems := HTTPRIOENSORentItems as ENSORentItemsControllerSoapPort;
   try
     ENSORentItemsObj := TempENSORentItems.getObject(StrToInt(sgENSORentItems.Cells[0,sgENSORentItems.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSORentItemsEdit:=TfrmENSORentItemsEdit.Create(Application, dsEdit);
  try
    if frmENSORentItemsEdit.ShowModal= mrOk then
      begin
        //TempENSORentItems.save(ENSORentItemsObj);
        updateItems(Sender);
      end;
  finally
    frmENSORentItemsEdit.Free;
    frmENSORentItemsEdit:=nil;
  end;
end;

procedure TfrmENServicesRentEdit.actEditScheduleExecute(Sender: TObject);
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

procedure TfrmENServicesRentEdit.actViewPlanExecute(
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
        ENServicesRentObj.contractTypeRef.code =
        ENSERVICESOBJECTTYPE_CONNECTION);

      frmENPlanWorkEdit.soElementCode := ENServicesRentObj.element.code;

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


procedure TfrmENServicesRentEdit.actViewRentItemExecute(Sender: TObject);
Var TempENSORentItems: ENSORentItemsControllerSoapPort;
begin
 TempENSORentItems := HTTPRIOENSORentItems as ENSORentItemsControllerSoapPort;
   try
     ENSORentItemsObj := TempENSORentItems.getObject(StrToInt(sgENSORentItems.Cells[0,sgENSORentItems.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSORentItemsEdit:=TfrmENSORentItemsEdit.Create(Application, dsView);
  try
    frmENSORentItemsEdit.ShowModal;
  finally
    frmENSORentItemsEdit.Free;
    frmENSORentItemsEdit:=nil;
  end;
end;

procedure TfrmENServicesRentEdit.actDeletePlanExecute(
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


procedure TfrmENServicesRentEdit.actDeleteRentItemExecute(Sender: TObject);
Var TempENSORentItems: ENSORentItemsControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSORentItems := HTTPRIOENSORentItems as ENSORentItemsControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSORentItems.Cells[0,sgENSORentItems.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Строки ліній сумісного підвісу по договору) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSORentItems.remove(ObjCode);
      updateItems(Sender);
  end;
end;

procedure TfrmENServicesRentEdit.actDeleteScheduleExecute(Sender: TObject);
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

procedure TfrmENServicesRentEdit.actDettachPlanExecute(Sender: TObject);
var
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
  if Application.MessageBox(PChar('Ви дійсно бажаєте відв''язати план?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
    if (plan<>nil) then begin
       TempENPlanWork.removePlan2Rent(plan,ENServicesRentObj.code);
    actUpdateExecute(Sender);
   end;
   end;
end;


procedure TfrmENServicesRentEdit.actClosePlanExecute(
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

procedure TfrmENServicesRentEdit.actUnClosePlanExecute(
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

procedure TfrmENServicesRentEdit.actFinishPlanExecute(
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


procedure TfrmENServicesRentEdit.actUndoConfirmExecute(Sender: TObject);
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


procedure TfrmENServicesRentEdit.actUndoFinishPlanExecute(
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


procedure TfrmENServicesRentEdit.actEditActExecute(Sender: TObject);
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

procedure TfrmENServicesRentEdit.actEditBillExecute(Sender: TObject);
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

procedure TfrmENServicesRentEdit.actEditCAIExecute(Sender: TObject);
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

procedure TfrmENServicesRentEdit.actEditCalculationExecute(Sender: TObject);
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

procedure TfrmENServicesRentEdit.actEditENPlanWorkItemExecute(
  Sender: TObject);
Var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
begin
  if not rent then Exit;

  if ENServicesRentObj = nil then Exit;
  if ENServicesRentObj.contractTypeRef = nil then Exit;
  if ENServicesRentObj.contractTypeRef.code <> ENSERVICESOBJECTTYPE_OKSN then Exit;

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


procedure TfrmENServicesRentEdit.actDeleteBillExecute(Sender: TObject);
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

procedure TfrmENServicesRentEdit.actDeleteCAIExecute(Sender: TObject);
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

procedure TfrmENServicesRentEdit.actDeleteCalculationExecute(
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


procedure TfrmENServicesRentEdit.btnPrintFactCalcClick(
  Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  if (ENServicesRentObj.calcTypeRef.code <> ENSERVICESOBJECT_CALCTYPE_BY_FACT) then Exit;

  /////
  if ENServicesRentObj.contractStatusRef = nil then Exit;

  if ENServicesRentObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////
    
  ///// 14.05.13 NET-4235
  // Печать расчета - только при статусах "Работы выполнены" и "Оплаченный"
  if (ENServicesRentObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_COMPLETED) and
     (ENServicesRentObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_PAID) then
    raise Exception.Create('NET-4235 Для друку розрахунку остаточної вартості договір повинен мати статус "Роботи виконані" або "Сплачений"!');
  /////

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'servicesObjectCode';
  args[0] := IntToStr(ENServicesRentObj.code);

  reportName := '201109/ActCalcAdditionalWorkG_NKRE/ActCalc_ServicesFactCalc';

  makeReport(reportName, argNames, args, 'xls');
end;


procedure TfrmENServicesRentEdit.btnPrintRecoveryAlterWithCalcItemsClick(
  Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  if ENServicesRentObj = nil then Exit;
  if ENServicesRentObj.contractTypeRef = nil then Exit;
  if ENServicesRentObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesRentObj.calcTypeRef = nil then Exit;
  if ENServicesRentObj.calcTypeRef.code = LOW_INT then Exit;
  if ENServicesRentObj.contractStatusRef = nil then Exit;
  if ENServicesRentObj.contractKindRef = nil then Exit;
  if ENServicesRentObj.contractKindRef.code = LOW_INT then Exit;

  if ENServicesRentObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'soCode';
    args[0] := IntToStr(ENServicesRentObj.code);

    if ENServicesRentObj.contractKindRef.code = SERVICES_CONTRACT_KIND_OKSN_WORK then
    begin
    reportName := 'Services/4Rent/d_recovery_alter_w_calc_items';
    makeReport(reportName, argNames, args, 'pdf');
    end;

end;

procedure TfrmENServicesRentEdit.btnPrintTechAgreementClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
begin
  inherited;
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'servicesObjectCode';
  args[0] := IntToStr(ENServicesRentObj.code);

  reportName := 'TechConditions/TechAgreement/agree';
  makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmENServicesRentEdit.pmPlansPopup(Sender: TObject);
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


procedure TfrmENServicesRentEdit.actConfirmExecute(Sender: TObject);
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


procedure TfrmENServicesRentEdit.actCreateNewPostingsExecute(Sender: TObject);
var
billCode, payment2soCode : Integer;
begin

  ENSOPayBillProvObj := ENSOPayBillProv.Create;
  ENSOPayBillProvObj.soRef := ENServicesObjectRef.Create;
  ENSOPayBillProvObj.soRef.code := ENServicesRentObj.code;
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

procedure TfrmENServicesRentEdit.actInsertCAIExecute(Sender: TObject);
begin
  // TempENServices2CalcAdditionalItems := HTTPRIOENServices2CalcAdditionalItems as ENServices2CalcAdditionalItemsControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENServices2CalcAdditionalItemsObj:=ENServices2CalcAdditionalItems.Create;
  SetNullIntProps(ENServices2CalcAdditionalItemsObj);
  SetNullXSProps(ENServices2CalcAdditionalItemsObj);

   ENServices2CalcAdditionalItemsObj.servicesObjectRef := ENServicesObjectRef.Create;
   ENServices2CalcAdditionalItemsObj.servicesObjectRef.code := ENServicesRentObj.code;

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

procedure TfrmENServicesRentEdit.actInsertCalculationExecute(Sender: TObject);
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
      frmENPlanWork2ClassificationTypeEdit.rent := true;


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

procedure TfrmENServicesRentEdit.actInsertPaymentExecute(
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
   ENPayment2SOObj.servicesObjectRef.Code :=  ENServicesRentObj.code;

   try
     billCode := StrToInt(sgENSOBill.Cells[0,sgENSOBill.Row]);
   except
   on EConvertError do Exit;
   end;

   ENPayment2SOObj.soBillRef := ENSOBillRef.Create;
   ENPayment2SOObj.soBillRef.code := billCode;

  try
		frmENPayment2SOEdit:=TfrmENPayment2SOEdit.Create(Application, dsInsert);
		frmENPayment2SOEdit.calctyperefcode :=  ENServicesRentObj.calcTypeRef.code;
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

procedure TfrmENServicesRentEdit.actInsertRentItemAndCCTower2JLCExecute(
  Sender: TObject);
var
  TempENSORentItems: ENSORentItemsControllerSoapPort;
  toCodeServicesObject: Integer;
begin
    toCodeServicesObject :=  ENServicesRentObj.code;

    frmInsertContractToLeaseAgreementAndCallCenter :=
            TfrmInsertContractToLeaseAgreementAndCallCenter.Create(Application, dsInsert);
    try
       if frmInsertContractToLeaseAgreementAndCallCenter.ShowModal = mrOk then
       begin
              try
                  TempENSORentItems :=  HTTPRIOENSORentItems as ENSORentItemsControllerSoapPort;
                  TempENSORentItems.insertContractToLeaseAgreementAndCallCenter(fromCodeServicesObject,toCodeServicesObject);
              except
                  on EConvertError do Exit;
              end;
       end;
    finally
      frmInsertContractToLeaseAgreementAndCallCenter.Free;
      frmInsertContractToLeaseAgreementAndCallCenter:=nil;
    end;
end;

procedure TfrmENServicesRentEdit.actDeletePaymentExecute(
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

procedure TfrmENServicesRentEdit.actEditPaymentExecute(
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
	frmENPayment2SOEdit.calctyperefcode :=  ENServicesRentObj.calcTypeRef.code;
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

procedure TfrmENServicesRentEdit.ActViewPaymentExecute(
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
	frmENPayment2SOEdit.calctyperefcode := ENServicesRentObj.calcTypeRef.code;
  try
    frmENPayment2SOEdit.ShowModal;

  finally
    frmENPayment2SOEdit.Free;
    frmENPayment2SOEdit := nil;
  end;
end;

end.
