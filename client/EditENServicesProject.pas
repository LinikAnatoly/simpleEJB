
unit EditENServicesProject;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
    EnergyproController, EnergyproController2, ENServicesObjectController, ENPlanWorkController,
    ExtCtrls, TB2Item, TB2Dock, TB2Toolbar , ShowENServicesProject, Planner, ENPlanWorkStatusController,
    AdvObj, ShowRQOrg, ShowRQOrgRschet, ENCottageController, ENRentPeriod2ServicesController,
    PlannerMonthView, DBPlannerMonthView, PlannerCal, FKProvObjectController, ENSOProj2SOConnController;

type
    TfrmENServicesProjectEdit = class(TDialogForm)
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
    rgContragentType: TRadioGroup;
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
    lblTimeStart2: TLabel;
    lblTimeFinal3: TLabel;
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
    HTTPRIOENCottage: THTTPRIO;
    HTTPRIOENRentPeriod2Services: THTTPRIO;
    HTTPRIOENFamilySize2ServicesObject: THTTPRIO;
    edtCustomPlanDate: TDateTimePicker;
    actAddBill: TAction;
    actEditBill: TAction;
    actDeleteBill: TAction;
    HTTPRIOENSOBill: THTTPRIO;
    actUpdateBill: TAction;
    HTTPRIOENSOPayBillProv: THTTPRIO;
    actCreateNewPostings: TAction;
    actEditPostings: TAction;
    HTTPRIOENServicesObject2PaymentSchedule: THTTPRIO;
    actAddSchedule: TAction;
    actEditSchedule: TAction;
    actDeleteSchedule: TAction;
    pmBill: TPopupMenu;
    miPrintBill: TMenuItem;
    miPrintAct: TMenuItem;
    actEditAct: TAction;
    actViewAct: TAction;
    HTTPRIOENSORentItems: THTTPRIO;
    actAddRentItem: TAction;
    actEditRentItem: TAction;
    actDeleteRentItem: TAction;
    actViewRentItem: TAction;
    HTTPRIOENSORItems2Post04: THTTPRIO;
    HTTPRIOENSORItems2Post10: THTTPRIO;
    actAddP04: TAction;
    actDeleteP04: TAction;
    actAddP10: TAction;
    actDeleteP10: TAction;
    Panel1: TPanel;
    sgENActIncome: TAdvStringGrid;
    Splitter2: TSplitter;
    Panel2: TPanel;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem8: TTBItem;
    sgENAct: TAdvStringGrid;
    btnPostings: TButton;
    btnSetBuhStatus: TButton;
    tsPayment: TTabSheet;
    ToolBarPayment: TToolBar;
    btnViewPayment: TToolButton;
    btnInsertPayment: TToolButton;
    btnDeletePayment: TToolButton;
    btnEditPayment: TToolButton;
    btnUpdatePayment: TToolButton;
    sgENPayment2SO: TAdvStringGrid;
    edtSOConn: TEdit;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    HTTPRIOENSOProj2SOConn: THTTPRIO;
    tbActions: TTBToolbar;
    TBItem6: TTBItem;
    actViewActIncome: TAction;
    edtProjAgreeSumma: TEdit;
    lblProjAgreeSumma: TLabel;
    edtTopographySumma: TEdit;
    lblTopographySumma: TLabel;
    gbWarrant: TGroupBox;
    lblWarrantFIO: TLabel;
    lblWarrantPosition: TLabel;
    lblMaxSum: TLabel;
    lblPower: TLabel;
    lblName: TLabel;
    lblWarrantNumber: TLabel;
    spbWarrantNumber: TSpeedButton;
    edtWarrantFIO: TEdit;
    edtWarrantPosition: TEdit;
    edtMaxSum: TEdit;
    edtPower: TEdit;
    edtWarrantNumber: TEdit;
    edtWarrantName: TMemo;
    grpContragentInfo: TGroupBox;
    lblContragentName: TLabel;
    lblContragentAddress: TLabel;
    lblContragentOkpo: TLabel;
    lblContragentPassport: TLabel;
    lblContragentBossName: TLabel;
    lblBasisType: TLabel;
    lblContragentAddressWork: TLabel;
    lblContragentPosition: TLabel;
    lbl1: TLabel;
    lblContragentObjectWork: TLabel;
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
    gbWarrantContrAgent: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtWarrantContrAgentNumber: TEdit;
    edtWarrantContrAgentFIO: TEdit;
    edtWarrantContrAgentDate: TDateTimePicker;
    cbbBasisType: TComboBox;
    edtContragentAddressWork: TMemo;
    edtContragentPosition: TEdit;
    edtContragentPhoneNumber: TEdit;
    edtContragentObjectWork: TEdit;
    btnPrintBillForPrepayment: TButton;

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
    procedure actBudgetApprovedExecute(Sender: TObject);
    procedure actUpdateObject(Sender: TObject);
    procedure spbWarrantNumberClick(Sender: TObject);
    procedure actViewENActIncomeExecute(Sender: TObject);
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
    procedure btnPrintBillForPrepaymentClick(Sender: TObject);
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
    procedure btnPrintContract4RecoveryClick(Sender: TObject);
    procedure actEditActExecute(Sender: TObject);
    procedure actViewActExecute(Sender: TObject);
    procedure btnPrintContract4AgreeClick(Sender: TObject);
    procedure btnPrintContract4AccessClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure actViewActIncomeExecute(Sender: TObject);
    procedure cbbBasisTypeChange(Sender: TObject);


  private
    { Private declarations }
    isVisitClient : Boolean;
    isJobsByTime  : Boolean;

    checkWarrant: Boolean;

    procedure SetFormCaption(elementCode: Integer);
    procedure SetActTransferVisibilityByStatus(servicesObjectStatus: Integer);
    function CheckCountersByClassifications(): Boolean;
    procedure updateAct(Sender : TObject);

    procedure plansPopup(plan: ENPlanWork);


  public
    { Public declarations }
    planCode : Integer;
    DepartmentForServicesCode : Integer;
    tempDeliveryOneWay : Integer;

    //PRIC-155
    contNumServ: String;
    project : Boolean;
    isNotCalculated : Boolean;

    cottageCode : Integer;

  end;


var
  frmENServicesProjectEdit: TfrmENServicesProjectEdit;
  ENServicesProjectObj: ENServicesObject;

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
  ShowENServicesConnection;

{uses
    EnergyproController, EnergyproController2, ENServicesObjectController  ;
}
{$R *.dfm}
//  var
//  planItemFilter: ENPlanWorkItemFilter;






procedure TfrmENServicesProjectEdit.updateAct(Sender : TObject);
 var
  TempENAct: ENActControllerSoapPort;
  actFilter: ENActFilter;
  ENActList: ENActShortList;
  actDate: String;
  i : Integer;

begin
   ClearGrid(sgENAct);

    if ENServicesProjectObj = nil then Exit;
    if ENServicesProjectObj.element = nil then Exit;
    if ENServicesProjectObj.element.code = LOW_INT then Exit;

    actDate := '';

    TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

    actFilter := ENActFilter.Create;
    SetNullIntProps(actFilter);
    SetNullXSProps(actFilter);
    actFilter.element := ENElement.Create;
    actFilter.element.code := ENServicesProjectObj.element.code;

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


        /////
    ClearGrid(sgENActIncome);

    with sgENActIncome do
    begin
      Cells[1, 1] := ENServicesProjectObj.contractNumberServices + '/' + ENServicesProjectObj.contractNumber;
      Cells[2, 1] := actDate;
    end;

end;



procedure TfrmENServicesProjectEdit.FormShow(Sender: TObject);
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

  soConnObj : ENServicesObject;
  soProj2ConnObj : ENSOProj2SOConn;
  soContr : ENServicesObjectControllerSoapPort;
  soProj2ConnFilter : ENSOProj2SOConnFilter;
  soProj2ConnContr :  ENSOProj2SOConnControllerSoapPort;
  soProj2ConnList : ENSOProj2SOConnShortList;

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

  DisableControls([ edtCommentGen, edtSOConn,
    edtFinDocID, edtName, edtPartnerCode, edtContractNumber, edtContractDateFin
    ]);

  DisableControls([edtWarrantNumber, edtWarrantFIO, edtWarrantPosition,
    edtWarrantName, edtPower, edtMaxSum, edtFinDocID,
    edtName, edtPartnerCode, edtContractNumber, edtContractDateFin,
    edtCommentGen]);

  btnPrintContract.Visible := false;

  tsPlans.TabVisible := False;
  tsActs.TabVisible := False;
  tsPayment.TabVisible := False;
  tsListWork.TabVisible := True;


   if (DialogState = dsInsert) then
  begin
    pcCalculation.ActivePage := tsListWork;
    tsGeneral.TabVisible := False;
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
      , SpeedButton1
      ]);

    DisableActions([{actInsert, actEdit, actDelete, } actFilter, actNoFilter,
                    {actEditPlan, }actBudgetApproved]);

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
      ,edtENDepartmentDepartmentName
      ,edtFinDocID
      ,edtContractServicesDistance
      ,edtDepartmentForServices
      ,edtSOConn
     ]);

    SetFloatStyle([edtContractServicesDistance, edtProjAgreeSumma, edtTopographySumma]);

  end;

  DisableControls([edtCode ,edtCommentGen ]);

  if (DialogState = dsEdit) then
  begin
      DisableControls([spbENDepartmentDepartment], false);
      DisableControls([edtContractNumber]);
      DenyBlankValues([edtENDepartmentDepartmentName, edtProjAgreeSumma, edtTopographySumma]);

      ///// 28.07.10
      if ENServicesProjectObj.finDocID = LOW_INT then
      begin
        DisableControls([{edtContractNumber, }spbContractNumberSelect], false);
        DenyBlankValues([edtContractNumber]);
      end;
      /////

      ///// 16.05.13 NET-4235
      // btnPrintFactCalc.Visible := (ENServicesProjectObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT);
      /////
  end;

  if DialogState = dsInsert then
     begin
      edtContractNumberServices.Text := 'Auto';

     end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin


    planCode := DMReports.getPlanCodeForCalculationByElement(ENServicesProjectObj.element.code);

    if (ENServicesProjectObj.contractStatusRef.code > ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
    begin
      DisableControls([SpeedButton1]);
    end;

    if (ENServicesProjectObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
    begin
       DisableControls([edtContractServicesDistance]);

       //DisableActions([actInsert, actEdit, actDelete]);
       DisableActions([actInsertCalculation, actInsertPlan,
                       actEditCalculation, actEditPlan, actEditENPlanWorkItem,
                       actDeleteCalculation, actDeletePlan]);

       btnPrintContract.Visible := true;
       tsGeneral.TabVisible := true;
       //tsPlans.TabVisible := true;

    end;


    if (ENServicesProjectObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
    begin
      tsPlans.TabVisible := true; //(HTTPRIOENPlanWork2ClassificationType.HTTPWebNode.UserName = 'energynet');
      tsActs.TabVisible := false;
      tsPayment.TabVisible := false;
    end;

    if (ENServicesProjectObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_SIGNED) then
    begin
      tsActs.TabVisible := True;
      tsPayment.TabVisible := True;
    end;



    ////////////////////////////////////////////////////////////////////////////
    // 24.04.13 Все action'ы теперь разделены
    DisableActions([actInsertPlan, actDeletePlan, actEditPlan,
                    actClosePlan, actUnClosePlan, {actFinishPlan, actUndoFinishPlan,}
                    actEditENPlanWorkItem]);

    if (ENServicesProjectObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
    begin
      DisableActions([actInsertCalculation, actDeleteCalculation, actEditCalculation]);

      if not (ENServicesProjectObj.contractStatusRef.code in [ENSERVICESOBJECTSTATUS_COMPLETED,
                                                             ENSERVICESOBJECTSTATUS_TERMINATED]) then
      begin

        if project then
        begin
          DisableActions([actInsertCalculation, actDeleteCalculation,
                          actEditCalculation, actEditENPlanWorkItem], false);

          // С планами даем работать только если договор не проведен в ФК
          if ENServicesProjectObj.statusRef.code <> ENSERVICESOBJECT_FINSTATUS_CLOSED then
            DisableActions([actInsertPlan, actDeletePlan, actEditPlan,
                            actClosePlan, actUnClosePlan], false);
        end;

      end;

    end; // if (ENServicesProjectObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED)

    edtCode.Text := IntToStr(ENServicesProjectObj.code);

    if (ENServicesProjectObj.contractNumber <> '') then
       edtContractNumber.Text := ENServicesProjectObj.contractNumber
    else
       edtContractNumber.Text := ENServicesProjectObj.contractNumberServices;

    if ENServicesProjectObj.contractDateServices <> nil then
    begin
      edtContractDateServices.DateTime:=EncodeDate(ENServicesProjectObj.contractDateServices.Year,ENServicesProjectObj.contractDateServices.Month,ENServicesProjectObj.contractDateServices.Day);
      edtContractDateServices.checked := true;
    end
    else
    begin
      edtContractDateServices.DateTime:=SysUtils.Date;
      edtContractDateServices.checked := false;
    end;

    if ENServicesProjectObj.contractDate <> nil then
    begin
      edtContractDateFin.DateTime:=EncodeDate(ENServicesProjectObj.contractDate.Year,ENServicesProjectObj.contractDate.Month,ENServicesProjectObj.contractDate.Day);
      edtContractDateFin.checked := true;
    end;


    cbbBasisType.ItemIndex := -1;

    if (ENServicesProjectObj.basisType <> nil ) then
      begin
       {
       case StrToInt(ENServicesProjectObj.basisType.DecimalString) of
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
         cbbBasisType.ItemIndex := StrToInt(ENServicesProjectObj.basisType.DecimalString);
       except
         on EConvertError do cbbBasisType.ItemIndex := -1;
       end;

            if (ENServicesProjectObj.basisType.DecimalString <> '3') and ( DialogState = dsEdit ) then
             DisableControls([edtWarrantContrAgentFIO , edtWarrantContrAgentNumber , edtWarrantContrAgentDate]);

      end

    else
      begin
       DisableControls([edtWarrantContrAgentFIO , edtWarrantContrAgentNumber , edtWarrantContrAgentDate]);
       cbbBasisType.ItemIndex := 0;
      end;

    if ENServicesProjectObj.contractDate <> nil then
    begin
      edtContractDateFin.DateTime:=EncodeDate(ENServicesProjectObj.contractDate.Year,ENServicesProjectObj.contractDate.Month,ENServicesProjectObj.contractDate.Day);
      edtContractDateFin.checked := true;
    end;

    edtContragentName.Text := ENServicesProjectObj.contragentName;
    MakeMultiline(edtContragentAddress.Lines, ENServicesProjectObj.contragentAddress);
    MakeMultiline(edtContragentAddressWork.Lines, ENServicesProjectObj.contragentAddressWork);
    MakeMultiline(edtContragentPassport.Lines, ENServicesProjectObj.contragentPassport);
    edtContragentOkpo.Text := ENServicesProjectObj.contragentOkpo;
    edtContragentBossName.Text := ENServicesProjectObj.contragentBossName;
    edtContragentBankName.Text := ENServicesProjectObj.contragentBankName;
    edtContragentBankAccount.Text := ENServicesProjectObj.contragentBankAccount;
    edtContragentBankMfo.Text := ENServicesProjectObj.contragentBankMfo;
    edtENDepartmentDepartmentName.Text := ENServicesProjectObj.department.name;
    MakeMultiline(edtCommentGen.Lines, ENServicesProjectObj.commentGen);
    edtContragentPosition.Text :=  ENServicesProjectObj.contragentPosition;

    edtName.Text := ENServicesProjectObj.name;
    edtPartnerCode.Text := ENServicesProjectObj.partnerCode;
    edtFinDocCode.Text := ENServicesProjectObj.finDocCode;

    edtWarrantContrAgentNumber.Text := ENServicesProjectObj.warrantNumber;
    edtWarrantContrAgentFIO.Text := ENServicesProjectObj.warrantFIO;

    if ENServicesProjectObj.warrantDate <> nil then
    begin
      edtWarrantContrAgentDate.DateTime:=EncodeDate(ENServicesProjectObj.warrantDate.Year,ENServicesProjectObj.warrantDate.Month,ENServicesProjectObj.warrantDate.Day);
      edtWarrantContrAgentDate.checked := true;
    end;

    if ( ENServicesProjectObj.finDocID <> Low(Integer) ) then
       edtFinDocID.Text := IntToStr(ENServicesProjectObj.finDocID)
    else
       edtFinDocID.Text := '';

    if ( ENServicesProjectObj.contractServicesDistance <> nil ) then
       edtContractServicesDistance.Text := ENServicesProjectObj.contractServicesDistance.decimalString
    else
       edtContractServicesDistance.Text := '';

    if ENServicesProjectObj.executeWorkDate <> nil then
      begin
        edtExecuteWorkDate.DateTime:=EncodeDate(ENServicesProjectObj.executeWorkDate.Year,ENServicesProjectObj.executeWorkDate.Month,ENServicesProjectObj.executeWorkDate.Day);
        edtExecuteWorkDate.checked := true;
      end
    else
      begin
        edtExecuteWorkDate.DateTime:=SysUtils.Date;
        edtExecuteWorkDate.checked := false;
      end;
    if ENServicesProjectObj.timeStart <> nil then
      begin
        edtTimeStart.DateTime:= EncodeTime(ENServicesProjectObj.timeStart.Hour,ENServicesProjectObj.timeStart.Minute, 0, 0);
        //EncodeDate(ENTravelSheetObj.timeStart.Year,ENTravelSheetObj.timeStart.Month,ENTravelSheetObj.timeStart.Day);
        edtTimeStart.checked := true;
      end
      else
      begin
        edtTimeStart.DateTime:=SysUtils.Date;
        edtTimeStart.checked := false;
      end;

      if ENServicesProjectObj.timeFinal <> nil then
      begin
        edtTimeFinal.DateTime:= EncodeTime(ENServicesProjectObj.timeFinal.Hour,ENServicesProjectObj.timeFinal.Minute, 0, 0);
         //EncodeDate(ENTravelSheetObj.timeFinal.Year,ENTravelSheetObj.timeFinal.Month,ENTravelSheetObj.timeFinal.Day);
        edtTimeFinal.checked := true;
      end
      else
      begin
        edtTimeFinal.DateTime:=SysUtils.Date;
        edtTimeFinal.checked := false;
      end;

      if  ENServicesProjectObj.warrantRef.code <> LOW_INT then
    begin
      warrant := DMReports.getWarrantByCode(ENServicesProjectObj.warrantRef.code);

      edtWarrantNumber.Text := warrant.numbergen;
      edtWarrantFIO.Text := warrant.warrantFIO;
      edtWarrantPosition.Text := warrant.warrantPosition;
      MakeMultiline(edtWarrantName.Lines, warrant.name);
      edtPower.Text := IntToStr(warrant.power);
    end;

      rgContragentType.ItemIndex:= ENServicesProjectObj.contragentTypeRef.code-1;
      rgPayable.ItemIndex:= ENServicesProjectObj.isNoPay;

    ////
    soProj2ConnContr := HTTPRIOENSOProj2SOConn as ENSOProj2SOConnControllerSoapPort;
    soProj2ConnFilter := ENSOProj2SOConnFilter.Create;
    SetNullIntProps(soProj2ConnFilter);
    SetNullXSProps(soProj2ConnFilter);
    soProj2ConnFilter.SOProjRef := ENServicesObjectRef.Create;
    soProj2ConnFilter.SOProjRef.code := ENServicesProjectObj.code;
    soProj2ConnList := soProj2ConnContr.getScrollableFilteredList(soProj2ConnFilter, 0, -1);
    if soProj2ConnList.totalCount > 0 then
       begin
          soContr := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
          soConnObj :=  soContr.getObject(soProj2ConnList.list[0].SOConnRefCode);
          edtSOConn.Text := soConnObj.contractNumberServices + ' ' + soConnObj.contragentName;
       end;
    ///

    if ( ENServicesProjectObj.projAgreeSumma <> nil ) then
       edtProjAgreeSumma.Text := ENServicesProjectObj.projAgreeSumma.decimalString
    else
       edtProjAgreeSumma.Text := '';

    if ( ENServicesProjectObj.topographySumma <> nil ) then
       edtTopographySumma.Text := ENServicesProjectObj.topographySumma.decimalString
    else
       edtTopographySumma.Text := '';


    /////////////////////////////
    // 21.09.12 NET-3079
    chbIsCustomerMaterials.Checked := (ENServicesProjectObj.isCustomerMaterials = ENSERVICESOBJECT_ISCUSTOMERMATERIALS);

    //planCode := DMReports.getPlanCodeForCalculationByElement(ENServicesProjectObj.element.code);
    ////////
    SetFormCaption(ENServicesProjectObj.element.code);
    ////////
    pcCalculationChange(Sender);

      //edtENElementElementName.Text := ENServicesProjectObj.element.name;
    DisableControls([edtDepartmentForServices,btnENDepartmentDepartment]);

    if ENServicesProjectObj.department.code <> LOW_INT then
       begin
         DepartmentForServicesCode:= ENServicesProjectObj.department.code;
         edtDepartmentForServices.Text := ENServicesProjectObj.department.shortName;
       end;

       DisableControls([edtExecuteWorkDate  , edtTimeStart  , edtTimeFinal ]);


  end;

    DisableControls([edtDepartmentForServices]);
    DenyBlankValues([edtDepartmentForServices]);

    checkWarrant := true;

end;


procedure TfrmENServicesProjectEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
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
      ENServicesProjectObj.code:=low(Integer);
      //** +++ cottageCode, startDate, endDate, tabNumber   */

      TempENServicesObject.addForCalculation(ENServicesProjectObj,
        cottageCode, startPeriodDate, endPeriodDate, tabNumber, FIO);
    end;
  end else
  if (DialogState = dsEdit) then
  begin
    if (ENServicesProjectObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
      if edtcontractDateFin.checked then
      begin
        if ENServicesProjectObj.contractDate = nil then
          ENServicesProjectObj.contractDate := TXSDate.Create;
        ENServicesProjectObj.contractDate.XSToNative(GetXSDate(edtcontractDateFin.DateTime));
      end
      else begin
        Application.MessageBox(PChar('Введите дату договора!'),PChar('Внимание!'), MB_ICONWARNING);
        Action := caNone;
        ENServicesProjectObj.contractDate := nil;
        pcCalculation.ActivePage := tsGeneral;
        if edtcontractDateFin.CanFocus then
          edtcontractDateFin.SetFocus;
        Exit;
      end;

      if edtcontractDateServices.checked then
      begin
        if ENServicesProjectObj.contractDateServices = nil then
          ENServicesProjectObj.contractDateServices := TXSDate.Create;
        ENServicesProjectObj.contractDateServices.XSToNative(GetXSDate(edtcontractDateServices.DateTime));
      end
      else begin
        Application.MessageBox(PChar('Введите дату договора!'),PChar('Внимание!'), MB_ICONWARNING);
        Action := caNone;
        ENServicesProjectObj.contractDateServices := nil;
        pcCalculation.ActivePage := tsGeneral;
        if edtcontractDateServices.CanFocus then
          edtcontractDateServices.SetFocus;
        Exit;
      end;


      //////////////////////////////////////
      if (project) then
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


      if (ENServicesProjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_DRAFT) then
        ENServicesProjectObj.name := ' '
      else
        ENServicesProjectObj.name := edtName.Text; // контрагент из фин договора

      ENServicesProjectObj.partnerCode := edtPartnerCode.Text;
      ENServicesProjectObj.finDocCode := edtFinDocCode.Text;

      if ( edtFinDocID.Text <> '' ) then
        ENServicesProjectObj.finDocID := StrToInt(edtFinDocID.Text)
      else
        ENServicesProjectObj.finDocID := Low(Integer) ;

      if (ENServicesProjectObj.projAgreeSumma = nil ) then
     ENServicesProjectObj.projAgreeSumma := TXSDecimal.Create;
     if edtProjAgreeSumma.Text <> '' then
       ENServicesProjectObj.projAgreeSumma.decimalString := edtProjAgreeSumma.Text
     else
       ENServicesProjectObj.projAgreeSumma := nil;

       if (ENServicesProjectObj.topographySumma = nil ) then
     ENServicesProjectObj.topographySumma := TXSDecimal.Create;
     if edtTopographySumma.Text <> '' then
       ENServicesProjectObj.topographySumma.decimalString := edtTopographySumma.Text
     else
       ENServicesProjectObj.topographySumma := nil;

     ENServicesProjectObj.commentGen := edtCommentGen.Text;

     ENServicesProjectObj.contractNumberServices := edtContractNumberServices.Text; // наш
     ENServicesProjectObj.contractNumber := edtContractNumber.Text;

     ENServicesProjectObj.contragentName := edtContragentName.Text; // контрагент услуги

     ENServicesProjectObj.contragentAddress := edtContragentAddress.Text;
     ENServicesProjectObj.contragentAddressWork := edtContragentAddressWork.Text;

     ENServicesProjectObj.contragentOkpo := edtContragentOkpo.Text;

     ENServicesProjectObj.contragentBankAccount := edtContragentBankAccount.Text;

     ENServicesProjectObj.contragentBankName := edtContragentBankName.Text;

     ENServicesProjectObj.contragentBankMfo := edtContragentBankMfo.Text;
     ENServicesProjectObj.contragentBossName := edtContragentBossName.Text;
     ENServicesProjectObj.contragentPassport := edtContragentPassport.Text;
     ENServicesProjectObj.contragentTypeRef := ENServicesContragentTypeRef.Create;
     ENServicesProjectObj.contragentTypeRef.code := rgContragentType.ItemIndex+1;

     ENServicesProjectObj.isNoPay := rgPayable.ItemIndex;

     ENServicesProjectObj.contragentPosition := edtContragentPosition.Text;

     if (ENServicesProjectObj.contractServicesSumma = nil ) then
     ENServicesProjectObj.contractServicesSumma := TXSDecimal.Create;

     if (ENServicesProjectObj.contractServicesPower = nil ) then
       ENServicesProjectObj.contractServicesPower := TXSDecimal.Create;

      ENServicesProjectObj.warrantNumber := edtWarrantContrAgentNumber.Text;
      ENServicesProjectObj.warrantFIO := edtWarrantContrAgentFIO.Text;

      if edtWarrantContrAgentDate.checked then
      begin
        if ENServicesProjectObj.warrantDate = nil then
        ENServicesProjectObj.warrantDate := TXSDate.Create;
        ENServicesProjectObj.warrantDate.XSToNative(GetXSDate(edtWarrantContrAgentDate.DateTime));
      end
      else
      ENServicesProjectObj.warrantDate := nil;

      if (ENServicesProjectObj.basisType = nil ) then
     ENServicesProjectObj.basisType := TXSDecimal.Create;
     if ( (cbbBasisType.ItemIndex <> -1 ) and  (cbbBasisType.ItemIndex <> 0) ) then
       ENServicesProjectObj.basisType.decimalString := IntToStr(cbbBasisType.itemIndex)
     else
       ENServicesProjectObj.basisType := nil;


      if edtexecuteWorkDate.checked then
      begin
        if ENServicesProjectObj.executeWorkDate = nil then
          ENServicesProjectObj.executeWorkDate := TXSDate.Create;
        ENServicesProjectObj.executeWorkDate.XSToNative(GetXSDate(edtexecuteWorkDate.DateTime));
      end
      else
        ENServicesProjectObj.executeWorkDate := nil;

      if edttimeStart.checked then
      begin
        if ENServicesProjectObj.timeStart = nil then
          ENServicesProjectObj.timeStart := TXSDateTime.Create;
        ENServicesProjectObj.timeStart.XSToNative(GetXSDateTime(edttimeStart.DateTime));
      end
      else
        ENServicesProjectObj.timeStart := nil;

      if edttimeFinal.checked then
      begin
        if ENServicesProjectObj.timeFinal = nil then
          ENServicesProjectObj.timeFinal := TXSDateTime.Create;
        ENServicesProjectObj.timeFinal.XSToNative(GetXSDateTime(edttimeFinal.DateTime));
      end
      else
        ENServicesProjectObj.timeFinal := nil;


      // 21.09.12 NET-3079
      ENServicesProjectObj.isCustomerMaterials := Ord(chbIsCustomerMaterials.Checked);
      // Если признак использования материалов заказчика сбросили, то нужно очистить
      // номер и дату акта приема-передачи
      if not chbIsCustomerMaterials.Checked then
      begin
        ENServicesProjectObj.actTransferNumber := '';
        ENServicesProjectObj.actTransferDate := nil;
      end;

      if DialogState = dsEdit then
      begin
        TempENServicesObject.saveForCalculation(ENServicesProjectObj)
      end;

   end;
end;


procedure TfrmENServicesProjectEdit.btnENDepartmentDepartmentClick(Sender : TObject);
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
              // if ENServicesProjectObj.department = nil then ENServicesProjectObj.department := ENDepartment.Create();
               DepartmentForServicesCode := ENDepartmentShort(tvDep.Selected.Data).code;
               edtDepartmentForServices.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
              // if  ENServicesProjectObj.element = nil then  ENServicesProjectObj.element := ENElement.Create;
              // if  ENServicesProjectObj.element.renRef = nil then ENServicesProjectObj.element.renRef := EPRenRef.Create;
              // ENServicesProjectObj.element.renRef.code := StrToInt(DMReports.getEPRenByDepartmentCode(ENServicesProjectObj.department.code));
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;



procedure TfrmENServicesProjectEdit.btnENElementElementClick(Sender : TObject);
var
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENServicesProjectObj.element = nil then ENServicesProjectObj.element := ENElement.Create();
               ENServicesProjectObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;



procedure TfrmENServicesProjectEdit.btnContractNumberSelectClick(Sender: TObject);
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
                edtFinDocID.Text :=  GetReturnValue(sgFINServicesObject, 6);
                edtCommentGen.Text :=  GetReturnValue(sgFINServicesObject, 7);

                ///// 28.07.10
                DisableControls([edtCode
                                 ,edtContractDateFin
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

procedure TfrmENServicesProjectEdit.spbContractNumberSelectClick(
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
   f.conditionSQL := 'a.io_flag = ''S''';

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


procedure TfrmENServicesProjectEdit.spbENDepartmentDepartmentClick(
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
               if ENServicesProjectObj.department = nil then ENServicesProjectObj.department := ENDepartment.Create();
               ENServicesProjectObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
               if  ENServicesProjectObj.element = nil then  ENServicesProjectObj.element := ENElement.Create;
               if  ENServicesProjectObj.element.renRef = nil then ENServicesProjectObj.element.renRef := EPRenRef.Create;
               ENServicesProjectObj.element.renRef.code := StrToInt(DMReports.getEPRenByDepartmentCode(ENServicesProjectObj.department.code));
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;


procedure TfrmENServicesProjectEdit.actUpdateExecute(Sender: TObject);
begin
  inherited;
  pcCalculationChange(self);
end;

procedure TfrmENServicesProjectEdit.actViewExecute(Sender: TObject);
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


procedure TfrmENServicesProjectEdit.pcCalculationChange(
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
  TempENPayment2SO: ENPayment2SOControllerSoapPort;
  ENPayment2SOList: ENPayment2SOShortList;
  FilterPayment2SO : ENPayment2SOFilter;
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

    if project then
    begin
      plan2ctFilter.conditionSQL := 'planrefcode in (select p.code from enplanwork p where p.elementrefcode = ' +
        IntToStr(ENServicesProjectObj.element.code) + ' and p.kindcode = ' + IntToStr(ENPLANWORKKIND_CALCULATION) + ')';
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

    if project then
    begin
      planItemFilter.conditionSQL := 'planrefcode in (select p.code from enplanwork p where p.elementrefcode = ' +
        IntToStr(ENServicesProjectObj.element.code) + ' and p.kindcode = ' + IntToStr(ENPLANWORKKIND_CALCULATION) + ')';
    end
    else begin
      if planItemFilter.planRef = nil then planItemFilter.planRef := ENPlanWorkRef.Create;
      planItemFilter.planRef.code := planCode; //DMReports.getPlanCodeByElement(ENServicesProjectObj.element.code); // выбрать по коду элемента код плана  ENPlanWorkObj.code;
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

    if ENServicesProjectObj = nil then Exit;
    if ENServicesProjectObj.element = nil then Exit;
    if ENServicesProjectObj.element.code = LOW_INT then Exit;

    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    planFilter := ENPlanWorkFilter.Create;
    SetNullIntProps(planFilter);
    SetNullXSProps(planFilter);

    planFilter.elementRef := ENElementRef.Create;
    planFilter.elementRef.code := ENServicesProjectObj.element.code;

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


  //SUPP-5060
  if pcCalculation.ActivePage = tsPayment then
  begin
     SetGridHeaders(ENPayment2SOHeaders, sgENPayment2SO.ColumnHeaders);
    ClearGrid(sgENPayment2SO);

    if ENServicesProjectObj = nil then Exit;
    if ENServicesProjectObj.element = nil then Exit;
    if ENServicesProjectObj.element.code = LOW_INT then Exit;


    TempENPayment2SO :=  HTTPRIOENPayment2SO as ENPayment2SOControllerSoapPort;


     FilterPayment2SO := ENPayment2SOFilter.Create;
     SetNullIntProps(FilterPayment2SO);
     SetNullXSProps(FilterPayment2SO);

     FilterPayment2SO.servicesObjectRef := ENServicesObjectRef.Create;
     FilterPayment2SO.servicesObjectRef.code :=  ENServicesProjectObj.code;

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


end;

procedure TfrmENServicesProjectEdit.FormCreate(Sender: TObject);
begin
  inherited;
  planCode := LOW_INT;
  project := false;
  checkWarrant := true;
  isNotCalculated := True;
end;


procedure TfrmENServicesProjectEdit.actPrintCalculationExecute( Sender: TObject);
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

  argNames[0] := 'plancode';

  if (DialogState = dsInsert) then
     args[0] := IntToStr(planCode)
  else
    // 20.09.2013 +++ для присоединений не то пальто....  ;)
    // args[0] := IntToStr(DMReports.getPlanCodeForCalculationByElement(ENServicesProjectObj.element.code));
  begin
    if (pw2ctObj = nil) then Exit;
    args[0] := IntToStr(pw2ctObj.planRef.code);
  end;


  if Licensed = ISNOTLICENSEDACTIVITY_NKRE  then  // лицензированые работы НКРЕ
     reportName := '201109/ActCalcAdditionalWorkG_NKRE/ActCalc'
  else if Licensed = ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT  then
     reportName := '201109/ActCalcAdditionalWorkG/ActCalc_notlicensed/ActCalc_notlicensed'
  else if ( (Licensed <> ISNOTLICENSEDACTIVITY_NKRE) and (Licensed <> ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT) ) then
     reportName := '201109/ActCalcAdditionalWorkG/ActCalc';

  makeReport(reportName , argNames , args , 'xls');
end;

procedure TfrmENServicesProjectEdit.SetFormCaption(elementCode: Integer);
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

      if (project) then
        Self.Caption := 'Договори проектування. Договір № ' + servicesObjList.list[0].contractNumberServices
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

 
procedure TfrmENServicesProjectEdit.btnPrintContract4AccessClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  if ENServicesProjectObj = nil then Exit;
  if ENServicesProjectObj.contractTypeRef = nil then Exit;
  if ENServicesProjectObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesProjectObj.calcTypeRef = nil then Exit;
  if ENServicesProjectObj.calcTypeRef.code = LOW_INT then Exit;
  if ENServicesProjectObj.contractStatusRef = nil then Exit;

  if ENServicesProjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'soCode';
    args[0] := IntToStr(ENServicesProjectObj.code);

    reportName := 'Services/4Rent/d_access';

    makeReport(reportName, argNames, args, 'pdf');

end;

procedure TfrmENServicesProjectEdit.btnPrintContract4AgreeClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  if ENServicesProjectObj = nil then Exit;
  if ENServicesProjectObj.contractTypeRef = nil then Exit;
  if ENServicesProjectObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesProjectObj.calcTypeRef = nil then Exit;
  if ENServicesProjectObj.calcTypeRef.code = LOW_INT then Exit;
  if ENServicesProjectObj.contractStatusRef = nil then Exit;

  if ENServicesProjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'soCode';
    args[0] := IntToStr(ENServicesProjectObj.code);

    reportName := 'Services/4Rent/d_agree';

    makeReport(reportName, argNames, args, 'pdf');

end;

procedure TfrmENServicesProjectEdit.btnPrintContract4RecoveryClick(
  Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  if ENServicesProjectObj = nil then Exit;
  if ENServicesProjectObj.contractTypeRef = nil then Exit;
  if ENServicesProjectObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesProjectObj.calcTypeRef = nil then Exit;
  if ENServicesProjectObj.calcTypeRef.code = LOW_INT then Exit;
  if ENServicesProjectObj.contractStatusRef = nil then Exit;

  if ENServicesProjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'soCode';
    args[0] := IntToStr(ENServicesProjectObj.code);

    reportName := 'Services/4Rent/d_recovery';

    makeReport(reportName, argNames, args, 'pdf');

end;


procedure TfrmENServicesProjectEdit.btnPrintContractClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  if ENServicesProjectObj = nil then Exit;
  if ENServicesProjectObj.contractTypeRef = nil then Exit;
  if ENServicesProjectObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesProjectObj.calcTypeRef = nil then Exit;
  if ENServicesProjectObj.calcTypeRef.code = LOW_INT then Exit;
  if ENServicesProjectObj.contractStatusRef = nil then Exit;
  if ENServicesProjectObj.contractKindRef = nil then Exit;
  if ENServicesProjectObj.contractKindRef.code = LOW_INT then Exit;

  if ENServicesProjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'servicesObjectCode';
    args[0] := IntToStr(ENServicesProjectObj.code);

    reportName := 'Services/4Project/agree';
    makeReport(reportName, argNames, args, 'pdf');


end;


procedure TfrmENServicesProjectEdit.btnPrintActClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
  copystr: String;
begin
  inherited;
  if ENServicesProjectObj = nil then Exit;
  if ENServicesProjectObj.contractTypeRef = nil then Exit;
  if ENServicesProjectObj.contractTypeRef.code = LOW_INT then Exit;
  if ENServicesProjectObj.calcTypeRef = nil then Exit;
  if ENServicesProjectObj.calcTypeRef.code = LOW_INT then Exit;

  /////
  if ENServicesProjectObj.contractStatusRef = nil then Exit;
  if ENServicesProjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'soCode';
  args[0] := IntToStr(ENServicesProjectObj.code);

  reportName := '201109/ActDomikiServices/Act21';
  makeReport(reportName , argNames , args , 'pdf');
end;


procedure TfrmENServicesProjectEdit.btnPrintActTechAgreementClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
begin
  inherited;
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'servicesObjectCode';
  args[0] := IntToStr(ENServicesProjectObj.code);

  reportName := 'TechConditions/TechAgreement/act';
  makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmENServicesProjectEdit.actBudgetApprovedExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := ENServicesProjectObj.code;
  except
    on EConvertError do Exit;
  end;

  if (ENServicesProjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
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


procedure TfrmENServicesProjectEdit.actUpdateObject(Sender: TObject);
Var TempServicesObject: ENServicesObjectControllerSoapPort;
    ObjCode: Integer;
begin
  if pcCalculation.ActivePage = tsListWork then
  begin
    TempServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
    ENServicesProjectObj := TempServicesObject.getObject(ENServicesProjectObj.code);
    actUpdateExecute(Sender);
  end;
end;

procedure TfrmENServicesProjectEdit.spbWarrantNumberClick(
  Sender: TObject);
var frmENWarrantShow : TfrmENWarrantShow;
    f : ENWarrantFilter;
    warrant : ENWarrant;
    datContract, datWarrant : TXSDate;
    dtdatContract, dtdatWarrant : TDateTime;
    power: Double;
begin

    datContract := TXSDate.Create;
    datWarrant := TXSDate.Create;

     f := ENWarrantFilter.Create();
     SetNullXSProps(f);
     SetNullIntProps(f);

     frmENWarrantShow := TfrmENWarrantShow.Create(Application,fmNormal, f);
     DisableActions([frmENWarrantShow.actNoFilter]);

     try
        with frmENWarrantShow do
          if ShowModal = mrOk then
          begin
              try

                 ENServicesProjectObj.warrantRef := ENWarrantRef.Create();
                 ENServicesProjectObj.warrantRef.code := StrToInt(GetReturnValue(sgENWarrant,0));

                  //////////////////////////////////////////////////////
                  ///   проверка даты доверенности с датой договора  ///
                  ///     суммы в доверенности с суммой договора     ///
                  //////////////////////////////////////////////////////

                  if ENServicesProjectObj.warrantRef.code <> LOW_INT then
                  begin
                    warrant := DMReports.getWarrantByCode(ENServicesProjectObj.warrantRef.code);

                    datContract.XSToNative(GetXSDate(Self.edtContractDateServices.DateTime));
                    dtdatContract := EncodeDate(datContract.Year, datContract.Month, datContract.Day);
                    dtdatWarrant := EncodeDate(warrant.dateFinal.Year, warrant.dateFinal.Month, warrant.dateFinal.Day);

                    if (warrant.warrantStatusRef.code = WARRANT_INVALID) then
                    begin
                      Application.MessageBox(PChar('Довіреність недійсна!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                        edtWarrantNumber.Text := '';
                        edtWarrantFIO.Text := '';
                        edtWarrantPosition.Text := '';
                        edtWarrantName.Text := '';
                        edtPower.Text := '';
                        edtMaxSum.Text := '';
                        ENServicesProjectObj.warrantRef.code := LOW_INT;
                      Exit;
                    end;

                    if (dtdatContract > dtdatWarrant) then
                    begin
                      Application.MessageBox(PChar('Термін дії довіреності закінчився!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                        edtWarrantNumber.Text := '';
                        edtWarrantFIO.Text := '';
                        edtWarrantPosition.Text := '';
                        edtWarrantName.Text := '';
                        edtPower.Text := '';
                        edtMaxSum.Text := '';
                        ENServicesProjectObj.warrantRef.code := LOW_INT;
                      Exit;
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
  end;
 // if not priconnections .. else


procedure TfrmENServicesProjectEdit.SpeedButton1Click(Sender: TObject);
var
   frmENServicesConnectionShow: TfrmENServicesConnectionShow;
   soProj2soConnObj : ENSOProj2SOConn;
   soProj2soConnContr : ENSOProj2SOConnControllerSoapPort;
   soContr : ENServicesObjectControllerSoapPort;
   soFilter : ENServicesObjectFilter;
begin

   soProj2soConnContr := HTTPRIOENSOProj2SOConn as ENSOProj2SOConnControllerSoapPort;

   soFilter := ENServicesObjectFilter.Create;
   SetNullIntProps(soFilter);
   SetNullXSProps(soFilter);
   soFilter.contractTypeRef := ENServicesContractTypeRef.Create;
   soFilter.contractTypeRef.code := ENSERVICESOBJECTTYPE_CONNECTION;
   frmENServicesConnectionShow:=TfrmENServicesConnectionShow.Create(Application,fmNormal, soFilter);

   try
    with frmENServicesConnectionShow do
      if ShowModal = mrOk then
      begin
        try
          soProj2soConnObj := ENSOProj2SOConn.Create;
          soProj2soConnObj.SOProjRef := ENServicesObjectRef.Create;
          soProj2soConnObj.SOProjRef.code := ENServicesProjectObj.code;
          soProj2soConnObj.SOConnRef := ENServicesObjectRef.Create;
          soProj2soConnObj.SOConnRef.code := StrToInt(GetReturnValue(sgENServicesObject, 0));
          soProj2soConnContr.add(soProj2soConnObj);

          edtSOConn.Text := GetReturnValue(sgENServicesObject, 1) + ' ' +GetReturnValue(sgENServicesObject, 5);
          /////
        except
          on EConvertError do Exit;
        end;
      end;
   finally
     frmENServicesConnectionShow.Free;
   end;

   soContr := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
   ENServicesProjectObj := soContr.getObject(ENServicesProjectObj.code);
   FormShow(Sender);

end;

procedure TfrmENServicesProjectEdit.actViewActExecute(Sender: TObject);
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

procedure TfrmENServicesProjectEdit.actViewActIncomeExecute(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  ///// 14.05.13 NET-4235
  // Печать акта приема-передачи - только при статусах "Работы выполнены" и "Оплаченный" (для НОВЫХ договоров)
  if ENServicesProjectObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT then
    if (ENServicesProjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_COMPLETED) and
			 (ENServicesProjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_PAID) and
			 (ENServicesProjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_CLOSE ) then
      raise Exception.Create('NET-4235 Для друку акту прийому-передачі договір повинен мати статус "Роботи виконані" або "Сплачений" або "Закритий"!');
  /////

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'ContractCode';
  args[0] := IntToStr(ENServicesProjectObj.code);

    reportName := '201109/ActCalcAdditionalWorkG/ActPriPer4Project';

  makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmENServicesProjectEdit.actViewENActIncomeExecute(
  Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  ///// 14.05.13 NET-4235
  // Печать акта приема-передачи - только при статусах "Работы выполнены" и "Оплаченный" (для НОВЫХ договоров)
  if ENServicesProjectObj.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT then
    if (ENServicesProjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_COMPLETED) and
       (ENServicesProjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_PAID) then
      raise Exception.Create('NET-4235 Для друку акту прийому-передачі договір повинен мати статус "Роботи виконані" або "Сплачений"!');
  /////

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'ContractCode';
  args[0] := IntToStr(ENServicesProjectObj.code);

  if ENServicesProjectObj.calcTypeRef.code <> ENSERVICESOBJECT_CALCTYPE_BY_FACT then
    reportName := '201109/ActCalcAdditionalWorkG/ActPriPer'
  else
    reportName := '201109/ActCalcAdditionalWorkG/ActPriPer2';

  makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmENServicesProjectEdit.actPrintKoshtorisExecute(
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

 argNames[0] := 'plancode';     
 if (DialogState = dsInsert) then
    args[0] := IntToStr(planCode)
 else
    // 20.09.2013 +++ для присоединений не то пальто....  ;)
    // args[0] := IntToStr(DMReports.getPlanCodeForCalculationByElement(ENServicesProjectObj.element.code));
  begin
    if (pw2ctObj = nil) then Exit;
    args[0] := IntToStr(pw2ctObj.planRef.code);
  end;


  if project  then
     begin
     reportName := '201109/ActCalcAdditionalWorkG/ActCalcOnlyRemainingcost_project';
     makeReport(reportName , argNames , args , 'xls');
     end;
end;


procedure TfrmENServicesProjectEdit.actPreConfirmExecute(Sender: TObject);
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


procedure TfrmENServicesProjectEdit.actPrintCalcNkreExecute(
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
      args[0] := IntToStr(DMReports.getPlanCodeForCalculationByElement(ENServicesProjectObj.element.code));

   argNames[1] := 'licenzed';
   args[1] := IntToStr(Licensed);

   reportName := 'Calculation/ActCalc_Form1_NKRE';
   makeReport(reportName , argNames , args , 'pdf');

   reportName := 'Calculation/ActCalc_Form4_NKRE';
   makeReport(reportName , argNames , args , 'pdf');
end;


procedure TfrmENServicesProjectEdit.btnPostingsClick(Sender: TObject);
begin
  frmPostingsEdit := TfrmPostingsEdit.Create(Application, dsInsert);
  try
    frmPostingsEdit.servicesObjectCode := ENServicesProjectObj.code;
    if ENServicesProjectObj.isNoPay = ENConsts.ENSERVICESOBJECT_ISNOPAY then
    begin
      HideControls([frmPostingsEdit.lblGridDescription, frmPostingsEdit.sgProvs,
                    frmPostingsEdit.sgProvErrorsDetailed, frmPostingsEdit.btnGetPostingsList]);
    end;
    frmPostingsEdit.ShowModal;
  finally
    frmPostingsEdit.Free;
  end;
end;


procedure TfrmENServicesProjectEdit.updateRezervedView();
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

         if ENServicesProjectObj.code <> 0 then
            codeServicesObject := ENServicesProjectObj.code
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

                tempENTimeLineFilter.servicesObjectRef := ENServicesProjectObj.Create;
                tempENTimeLineFilter.servicesObjectRef.code := codeServicesObject {ENServicesProjectObj.code} ;
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


                TempTKClassification2ENDepartmentList :=  TempTKClassification2ENDepartment.getScrollableFilteredListForServices({ENServicesProjectObj.code} codeServicesObject );
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

procedure TfrmENServicesProjectEdit.RenderPlanner();
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

      //   if ENServicesProjectObj.code <> 0 then
     //       codeServicesObject := ENServicesProjectObj.code
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
              else servicesObj :=  TempEnServicesObject.getObject( ENServicesProjectObj.code);
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
                        TlnFilter.conditionSQL := 'ENSERVICESOBJECT.CODE <> ' + IntToStr( {ENServicesProjectObj.code} codeServicesObject );

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
                                   // if ENServicesProjectObj.code = 0 then
                                    Text.Text := 'Дог.№. ' + servicesObj.contractNumberServices + ' : Доставка до замовника' +
                                                  ' : з ' + FormatDateTime('hh.mm', ItemStartTime ) + ' до ' + FormatDateTime('hh.mm', ItemEndTime );
                                   // else
                                   // Text.Text := 'Дог.№. ' + ENServicesProjectObj.contractNumberServices + ' : Доставка до замовника' +
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
                                   // if ENServicesProjectObj.code = 0 then
                                    Text.Text := 'Дог.№. ' + servicesObj.contractNumberServices + ' : Перебування на об`єкті' +
                                                  ' : з ' + FormatDateTime('hh.mm', ItemStartTime ) + ' до ' + FormatDateTime('hh.mm', ItemEndTime );
                                   // else
                                   // Text.Text := 'Дог.№. ' + ENServicesProjectObj.contractNumberServices + ' : Перебування на об`єкті' +
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
                                   // if ENServicesProjectObj.code = 0 then
                                    Text.Text := 'Дог.№. ' + servicesObj.contractNumberServices + ' : Повернення на базу' +
                                                  ' : з ' + FormatDateTime('hh.mm', ItemStartTime ) + ' до ' + FormatDateTime('hh.mm', ItemEndTime );
                                   // else
                                   // Text.Text := 'Дог.№. ' + ENServicesProjectObj.contractNumberServices + ' : Повернення на базу' +
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
 

procedure TfrmENServicesProjectEdit.sgDepartmentClick(Sender: TObject);
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
       TKVirtualBrigadeList := TempTKVirtualBrigade.getScrollableFilteredListForServices(TempTKVirtualBrigadeFilter,0,-1 , DateToStr(edtReservedDate.DateTime) , ENServicesProjectObj.code ,strCodeActiveDepartment );


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

procedure TfrmENServicesProjectEdit.btnInsertExecuteDateClick(Sender: TObject);
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

              TempENTimeLine.addTimeLine(ENServicesProjectObj,tlArr);
              Application.MessageBox(PChar('Збережено!'), PChar('Повідомлення'), MB_ICONINFORMATION);

            end
      else
           begin
                Application.MessageBox(PChar('Треба обрати бригаду для виконання робіт !!!'),PChar('Внимание!'), MB_ICONWARNING);
                Exit;
           end;


  end;

end;

procedure TfrmENServicesProjectEdit.sgBrigadeInDepartmentClick(
  Sender: TObject);
begin
//  inherited;
//    RenderPlanner;
end;

procedure TfrmENServicesProjectEdit.sgBrigadeInDepartmentCheckBoxClick(
  Sender: TObject; ACol, ARow: Integer; State: Boolean);
begin
  inherited;

  RenderPlanner; 

end;

procedure TfrmENServicesProjectEdit.sgDepartmentCheckBoxClick(
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

        if ENServicesProjectObj.code <> 0 then
            codeServicesObject := ENServicesProjectObj.code
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
       TKVirtualBrigadeList := TempTKVirtualBrigade.getScrollableFilteredListForServices(TempTKVirtualBrigadeFilter,0,-1 , DateToStr(edtReservedDate.DateTime) , {ENServicesProjectObj.code} codeServicesObject ,strCodeActiveDepartment );


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

procedure TfrmENServicesProjectEdit.edtReservedTimeStartChange(
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
function TfrmENServicesProjectEdit.getSumTimeWorkForCalculation(codePlan : Integer):Double;
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



procedure TfrmENServicesProjectEdit.edtReservedTimeStartExit(
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

procedure TfrmENServicesProjectEdit.edtReservedDateExit(
  Sender: TObject);
begin
 // inherited;
   RenderPlanner;
end;

function TfrmENServicesProjectEdit.checkOtherTimeLine():Boolean;
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
         if ENServicesProjectObj.code <> 0 then
            codeServicesObject := ENServicesProjectObj.code
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

      tempENTimeLineFilter.conditionSQL := ' ENSERVICESOBJECT.CODE <> ' + IntToStr( codeServicesObject{ENServicesProjectObj.code})  + ' and  ENTIMELINE.VIRTUALBRIGADEREFCODE in (' + codeStrVirtualBrigade + ')' ;
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


procedure TfrmENServicesProjectEdit.edtReservedDateChange(
  Sender: TObject);
begin
  inherited;
     edtReservedTimeStartExit(self);
end;

procedure TfrmENServicesProjectEdit.btnRemoveExecutedDateClick(
  Sender: TObject);
var TempENTimeLine: ENTimeLineControllerSoapPort;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити дату / час виконання робіт для бригад ?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;

   TempENTimeLine := HTTPRIOENTimeLine as ENTimeLineControllerSoapPort;
   TempENTimeLine.removeTimeLine(ENServicesProjectObj);

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


procedure TfrmENServicesProjectEdit.SetActTransferVisibilityByStatus(servicesObjectStatus: Integer);
begin
{
  btnActTransferSave.Visible := (ENServicesProjectObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_GOOD);
  btnActTransferMoveToFK.Visible := (ENServicesProjectObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_GOOD);
  btnActTransferUnMoveToFK.Visible := (ENServicesProjectObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_ACT_TRANSFER_CLOSED);
}

  // btnActTransferSave.Visible := (servicesObjectStatus = ENSERVICESOBJECT_FINSTATUS_GOOD);
  // btnActTransferMoveToFK.Visible := (servicesObjectStatus = ENSERVICESOBJECT_FINSTATUS_GOOD);
  // btnActTransferUnMoveToFK.Visible := (servicesObjectStatus = ENSERVICESOBJECT_FINSTATUS_ACT_TRANSFER_CLOSED);

  actActTransferSave.Visible := (servicesObjectStatus = ENSERVICESOBJECT_FINSTATUS_GOOD);
  actActTransferMoveToFK.Visible := (servicesObjectStatus = ENSERVICESOBJECT_FINSTATUS_GOOD);
  actActTransferUnMoveToFK.Visible := (servicesObjectStatus = ENSERVICESOBJECT_FINSTATUS_ACT_TRANSFER_CLOSED);
end;


procedure TfrmENServicesProjectEdit.actActTransferPrintExecute(
  Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  SetLength(argNames, 1);
  SetLength(args, 1);

  argnames[0] := 'servicesObjectCode';
  args[0] := IntToStr(ENServicesProjectObj.code);

  reportName := '201109/ActTransferForServices/Act';
  makeReport(reportName, argNames, args, 'xls');
end;

procedure TfrmENServicesProjectEdit.actActTransferMoveToFKExecute(
  Sender: TObject);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
    tmpObj: ENServicesObject;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте провести Акт приймання-передачі?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK then
    Exit;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  TempENServicesObject.moveActTransferToFK(ENServicesProjectObj.code);

  Application.MessageBox(PChar('Акт проведено!'), PChar('Інформація'), MB_ICONINFORMATION);

  tmpObj := TempENServicesObject.getObject(ENServicesProjectObj.code);
  SetActTransferVisibilityByStatus(tmpObj.statusRef.code);
end;

procedure TfrmENServicesProjectEdit.actActTransferUnMoveToFKExecute(
  Sender: TObject);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
    tmpObj: ENServicesObject;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити проведення Акту приймання-передачі?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK then
    Exit;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  TempENServicesObject.unMoveActTransferToFK(ENServicesProjectObj.code);

  Application.MessageBox(PChar('Проведення акту відмінено!'), PChar('Інформація'), MB_ICONINFORMATION);

  tmpObj := TempENServicesObject.getObject(ENServicesProjectObj.code);
  SetActTransferVisibilityByStatus(tmpObj.statusRef.code);
end;

function TfrmENServicesProjectEdit.CheckCountersByClassifications(): Boolean;
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


procedure TfrmENServicesProjectEdit.spbENResponsibleClick(
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
        ENServicesProjectObj.resposible := GetReturnValue(sgFINWorker, 1);
        ENServicesProjectObj.resposibleTabNumber := GetReturnValue(sgFINWorker, 2);
        ENServicesProjectObj.resposiblePosition := GetReturnValue(sgFINWorker, 3);
        //edtENResponsible.Text := ENServicesProjectObj.resposiblePosition + ' ' + ENServicesProjectObj.resposible;
      end;
  finally
    frmFINWorkerShow.Free;
  end;
end;


procedure TfrmENServicesProjectEdit.btnActPriPerCountersClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'enservicesobjectcode';
  args[0] := IntToStr(ENServicesProjectObj.code);

  reportName :=  'Calculation/ActPriPerCounters';
  makeReport(reportName , argNames , args , 'pdf');
end;


procedure TfrmENServicesProjectEdit.spbActWarrantNumberClick(Sender: TObject);
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
    f.departmentRef.code := ENServicesProjectObj.department.code;

    if (rgContragentType.ItemIndex in [ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET,
                                      ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NONBUDGET,
                                      ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL_NOREZIDENT,
                                      ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NOREZIDENT]) and
      (ENServicesProjectObj.department.code = ENDEPARTMENT_HGES) then
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


procedure TfrmENServicesProjectEdit.sgENPlanWorkClick(Sender: TObject);
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


procedure TfrmENServicesProjectEdit.sgENPlanWorkRightClickCell(
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


procedure TfrmENServicesProjectEdit.plansPopup(plan: ENPlanWork);
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

  if not (ENServicesProjectObj.contractStatusRef.code in [ENSERVICESOBJECTSTATUS_COMPLETED,
                                                         ENSERVICESOBJECTSTATUS_TERMINATED]) then
  begin
    if (ENServicesProjectObj.statusRef.code <> ENSERVICESOBJECT_FINSTATUS_CLOSED) and
       (ENServicesProjectObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
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

procedure TfrmENServicesProjectEdit.actEditPlanExecute(
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
        ENServicesProjectObj.contractTypeRef.code =
        ENSERVICESOBJECTTYPE_CONNECTION);
      frmENPlanWorkEdit.soElementCode := ENServicesProjectObj.element.code;
          
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


procedure TfrmENServicesProjectEdit.actViewPlanExecute(
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
        ENServicesProjectObj.contractTypeRef.code =
        ENSERVICESOBJECTTYPE_CONNECTION);

      frmENPlanWorkEdit.soElementCode := ENServicesProjectObj.element.code;

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


procedure TfrmENServicesProjectEdit.actDeletePlanExecute(
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

procedure TfrmENServicesProjectEdit.actClosePlanExecute(
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

procedure TfrmENServicesProjectEdit.actUnClosePlanExecute(
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

procedure TfrmENServicesProjectEdit.actFinishPlanExecute(
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


procedure TfrmENServicesProjectEdit.actUndoConfirmExecute(Sender: TObject);
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


procedure TfrmENServicesProjectEdit.actUndoFinishPlanExecute(
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


procedure TfrmENServicesProjectEdit.actEditActExecute(Sender: TObject);
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


procedure TfrmENServicesProjectEdit.actEditCalculationExecute(Sender: TObject);
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

procedure TfrmENServicesProjectEdit.actEditENPlanWorkItemExecute(
  Sender: TObject);
Var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
begin
  if not project then Exit;

  if ENServicesProjectObj = nil then Exit;
  if ENServicesProjectObj.contractTypeRef = nil then Exit;
  if ENServicesProjectObj.contractTypeRef.code <> ENSERVICESOBJECTTYPE_OKSN then Exit;

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


procedure TfrmENServicesProjectEdit.actDeleteCalculationExecute(
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


procedure TfrmENServicesProjectEdit.btnPrintFactCalcClick(
  Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  if (ENServicesProjectObj.calcTypeRef.code <> ENSERVICESOBJECT_CALCTYPE_BY_FACT) then Exit;

  /////
  if ENServicesProjectObj.contractStatusRef = nil then Exit;

  if ENServicesProjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////
    
  ///// 14.05.13 NET-4235
  // Печать расчета - только при статусах "Работы выполнены" и "Оплаченный"
  if (ENServicesProjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_COMPLETED) and
     (ENServicesProjectObj.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_PAID) then
    raise Exception.Create('NET-4235 Для друку розрахунку остаточної вартості договір повинен мати статус "Роботи виконані" або "Сплачений"!');
  /////

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'servicesObjectCode';
  args[0] := IntToStr(ENServicesProjectObj.code);

  reportName := '201109/ActCalcAdditionalWorkG_NKRE/ActCalc_ServicesFactCalc';

  makeReport(reportName, argNames, args, 'xls');
end;


procedure TfrmENServicesProjectEdit.btnPrintTechAgreementClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
begin
  inherited;
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'servicesObjectCode';
  args[0] := IntToStr(ENServicesProjectObj.code);

  reportName := 'TechConditions/TechAgreement/agree';
  makeReport(reportName, argNames, args, 'pdf');
end;


procedure TfrmENServicesProjectEdit.btnPrintBillForPrepaymentClick(
  Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin

  /////
  if ENServicesProjectObj.contractStatusRef = nil then Exit;

  if ENServicesProjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED then
    raise Exception.Create('Цей договір скасовано!');
  /////

  SetLength(argNames, 1);
  SetLength(args, 1);

  //argNames[0] := 'plancode';
  //args[0] := IntToStr(DMReports.getPlanCodeForCalculationByElement(ENServicesProjectObj.element.code));
  argNames[0] := 'soCode';
  args[0] := IntToStr(ENServicesProjectObj.code);

  reportName := 'Services/Bill/rah4project';

  makeReport(reportName , argNames , args , 'pdf');
end;


procedure TfrmENServicesProjectEdit.pmPlansPopup(Sender: TObject);
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


procedure TfrmENServicesProjectEdit.actConfirmExecute(Sender: TObject);
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

procedure TfrmENServicesProjectEdit.actInsertCalculationExecute(Sender: TObject);
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
      frmENPlanWork2ClassificationTypeEdit.project := true;


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
            ENServicesProjectObj := ENServicesObject.Create;
            ENServicesProjectObj.element := ENElement.Create;
            ENServicesProjectObj.element.code := DMReports.getElementCodeByPlanCode(planCode);
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

procedure TfrmENServicesProjectEdit.actInsertPaymentExecute(
  Sender: TObject);

begin
  inherited;
   ENPayment2SOObj:=ENPayment2SO.Create;

   ENPayment2SOObj.dateGen:= TXSDate.Create;
   ENPayment2SOObj.sumTotal:= TXSDecimal.Create;
   ENPayment2SOObj.sumGen:= TXSDecimal.Create;
   ENPayment2SOObj.sumVat:= TXSDecimal.Create;

   ENPayment2SOObj.servicesObjectRef := ENServicesObjectRef.Create;
   ENPayment2SOObj.servicesObjectRef.Code :=  ENServicesProjectObj.code;


  try
		frmENPayment2SOEdit:=TfrmENPayment2SOEdit.Create(Application, dsInsert);
		frmENPayment2SOEdit.calctyperefcode :=  ENServicesProjectObj.calcTypeRef.code;
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

procedure TfrmENServicesProjectEdit.actDeletePaymentExecute(
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

procedure TfrmENServicesProjectEdit.actEditPaymentExecute(
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
	frmENPayment2SOEdit.calctyperefcode :=  ENServicesProjectObj.calcTypeRef.code;
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

procedure TfrmENServicesProjectEdit.ActViewPaymentExecute(
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
	frmENPayment2SOEdit.calctyperefcode := ENServicesProjectObj.calcTypeRef.code;
  try
    frmENPayment2SOEdit.ShowModal;

  finally
    frmENPayment2SOEdit.Free;
    frmENPayment2SOEdit := nil;
  end;
end;

procedure TfrmENServicesProjectEdit.cbbBasisTypeChange(
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


end.

