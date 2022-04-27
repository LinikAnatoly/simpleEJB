
unit EditENServicesSales;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENServicesObjectController,
  ExtCtrls, TB2Item, TB2Dock, TB2Toolbar , ShowENServicesSales,
  Planner, AdvObj;

type
  TfrmENServicesSalesEdit = class(TDialogForm)
    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIOENServicesObject: THTTPRIO;
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
    lblContragentBankMfo: TLabel;
    edtContragentBankAccount: TEdit;
    edtContragentBankName: TEdit;
    edtContragentBankMfo: TEdit;
    edtContractDateFin: TDateTimePicker;
    edtName: TEdit;
    edtPartnerCode: TEdit;
    edtFinDocCode: TEdit;
    edtDateEdit: TDateTimePicker;
    btnPrintContract: TButton;
    btnPrintBill: TButton;
    actPrintCalculation: TAction;
    HTTPRIOENPlanWork2ClassificationType: THTTPRIO;
    actBudgetApproved: TAction;
    Button1: TButton;
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
    actEditPlan: TAction;
    tsActs: TTabSheet;
    Panel1: TPanel;
    tbActions: TTBToolbar;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem47: TTBItem;
    TBItem7: TTBItem;
    TBItem46: TTBItem;
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
    gbWarrantContrAgent: TGroupBox;
    edtWarrantContrAgentNumber: TEdit;
    edtWarrantContrAgentFIO: TEdit;
    edtWarrantContrAgentDate: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    actPrintKoshtoris: TAction;
    pmPlanWork2ClassificationType: TPopupMenu;
    miPrintCalcNkre: TMenuItem;
    cbbBasisType: TComboBox;
    lblBasisType: TLabel;
    btnPostings: TButton;
    HTTPRIOTKClassificationType: THTTPRIO;
    tsRQFKOrder: TTabSheet;
    tlb1: TToolBar;
    btn1: TToolButton;                                                                           
    btn2: TToolButton;
    btn3: TToolButton;
    btn4: TToolButton;
    btn5: TToolButton;
    btn6: TToolButton;
    
    btn7: TToolButton;
    HTTPRIOENEstimateItem: THTTPRIO;
    lblContragentPosition: TLabel;
    edtContragentPosition: TEdit;
    edtContragentPhoneNumber: TEdit;
    lbl1: TLabel;
    HTTPRIOTKClassification2ENDepartment: THTTPRIO;
    HTTPRIOTKVirtualBrigade: THTTPRIO;
    HTTPRIOENTimeLine: THTTPRIO;
    HTTPRIOENDeliveryTimePlan: THTTPRIO;
    HTTPRIOENTechConditionsObjects: THTTPRIO;
    Label6: TLabel;
    rgPayable: TRadioGroup;
    lblContractServicesSumma: TLabel;
    edtContractServicesSumma: TEdit;
    sgRQFKOrder: TAdvStringGrid;
    HTTPRIORQFKOrder: THTTPRIO;
    btnSpec: TButton;
    btnInvoice: TButton;
    gbPayments: TGroupBox;
    lblPayDate: TLabel;
    edtPayDate: TDateTimePicker;
    lblFinPayFormCode: TLabel;
    edtFinPayFormCode: TEdit;
    lblFinPayFormName: TLabel;
    edtFinPayFormName: TEdit;
    spbFinPayForm: TSpeedButton;
    spbFinPayFormClear: TSpeedButton;
    gbBaseComments: TGroupBox;
    edtBaseComments: TMemo;
    lblPayDetail: TLabel;
    edtPayDetail: TEdit;
    N5: TMenuItem;
    N7: TMenuItem;
    actCreatePrihod: TAction;
    actUnCreatePrihod: TAction;
    tsPaymentSchedule: TTabSheet;
    sgENServicesObject2PaymentSchedule: TAdvStringGrid;
    HTTPRIOENServicesObject2PaymentSchedule: THTTPRIO;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);

  procedure btnENDepartmentDepartmentClick(Sender : TObject);
  procedure btnENElementElementClick(Sender : TObject);
    procedure btnContractNumberSelectClick(Sender: TObject);
    procedure spbContractNumberSelectClick(Sender: TObject);
    procedure spbENDepartmentDepartmentClick(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure pcCalculationChange(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPrintContractClick(Sender: TObject);
    procedure btnPrintBillClick(Sender: TObject);
    procedure actBudgetApprovedExecute(Sender: TObject);
    procedure actUpdateObject(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure spbWarrantNumberClick(Sender: TObject);
    procedure actEditPlanExecute(Sender: TObject);
    procedure actViewENActExecute(Sender: TObject);
    procedure actViewENActIncomeExecute(Sender: TObject);
    procedure edtContractServicesPowerChange(Sender: TObject);
    procedure cbbBasisTypeChange(Sender: TObject);
    procedure btnPostingsClick(Sender: TObject);

    procedure sgDepartmentClick(Sender: TObject);
    procedure sgBrigadeInDepartmentClick(Sender: TObject);
    procedure edtReservedTimeStartChange(Sender: TObject);

    function getSumTimeWorkForCalculation(codePlan : Integer):Double;
    procedure edtContractServicesSummaChange(Sender: TObject);
    procedure btnSpecClick(Sender: TObject);
    procedure btnInvoiceClick(Sender: TObject);
    procedure spbFinPayFormClick(Sender: TObject);
    procedure spbFinPayFormClearClick(Sender: TObject);
    procedure actCreatePrihodExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure actUnCreatePrihodExecute(Sender: TObject);


  private
    { Private declarations }
    isVisitClient : Boolean;
    isJobsByTime  : Boolean;

    procedure SetFormCaption(elementCode: Integer);


  public
    { Public declarations }
    planCode : Integer;
    DepartmentForServicesCode : Integer;
    tempDeliveryOneWay : Integer;



end;

var
  frmENServicesSalesEdit: TfrmENServicesSalesEdit;
  ENServicesSaleObj: ENServicesObject;

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

   sgDepartmentHeaders : array [1..3] of String = ( 'Код підрозділу'
    , 'Підрозділ'
    , 'РЕМ'
    );

   TKVirtualBrigadeHeaders : array [1..2] of String = ( 'Код бригади'
    , 'Бригада'
    );

  RQFKOrderHeaders: array [1..17] of String =
        ( 'Код'
          ,'Номер'
          ,'Дата документу'
          ,'Код відправника'
          ,'ПІБ відправника'
          ,'Код одержувача'
          ,'ПІБ одержувача'
          ,'Статус'
          ,'Код експедитора'
          ,'ПІБ експедитора'
          ,'№ доручення'
          ,'Дата доручення'
          ,'ПІБ в дорученні'
          ,'Створив'
          ,'Дата ств.'
          ,'Змінив'
          ,'Дата зміни'
        );

  ENServicesObject2PaymentScheduleHeaders: array [1..4] of String =
        ( 'Код'
          ,'оплата з'
          ,'оплата з'
          ,'сума оплати'
        );

  iColCount, iLastCount: Integer;
  iLastRow: Integer = 1;

implementation

uses
  ShowENDepartment
  ,ENDepartmentController
  ,ShowENElement
  ,ENElementController
, DMReportsUnit, ShowFINServicesObject, ENConsts,
  ENServicesContragentTypeController, ENServicesContractTypeController,
  EditENPlanWorkItem, ENPlanWorkItemController, ENEstimateItemController,
  ENPlanWorkController, EditENPlanWork2ClassificationType,
  ENPlanWork2ClassificationTypeController, ENServicesContractStatusController,
  ShowENWarrant, ENWarrantController,
  EditENPlanWork, ENPlanWorkKindController, ENActController, EditENAct,
  EditPostings, TKClassificationTypeController, ENEstimateItemKindController,
  EditENEstimateItem , TKClassification2ENDepartmentController , TKVirtualBrigadeController , ENTimeLineController,
  DateUtils , ENDeliveryTimePlanController, ENTechConditionsObjectsController, 
  ShowENTechConditionsObjects,
  RQFKOrderController, EditRQFKOrder, RQFKOrderKindController,
  ShowPayForm, ENServicesObject2PaymentScheduleController, EditENServicesObject2PaymentSchedule;

{uses  
    EnergyproController, EnergyproController2, ENServicesObjectController  ;
}
{$R *.dfm}
//  var
//  planItemFilter: ENPlanWorkItemFilter;





procedure TfrmENServicesSalesEdit.FormShow(Sender: TObject);
var warrant : ENWarrant;
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

  pcCalculation.ActivePage := tsGeneral;

  SetFloatStyle([edtContractServicesSumma]);

  isJobsByTime:= False;
  isVisitClient:= False;

  DepartmentForServicesCode := -1;
  SetGridHeaders(ENPlanWorkHeaders, sgENPlanWork.ColumnHeaders);
  SetGridHeaders(ENActHeaders, sgENAct.ColumnHeaders);
  SetGridHeaders(ENActIncomeHeaders, sgENActIncome.ColumnHeaders);
  SetGridHeaders(RQFKOrderHeaders, sgRQFKOrder.ColumnHeaders);

  SetGridHeaders(ENServicesObject2PaymentScheduleHeaders, sgENServicesObject2PaymentSchedule.ColumnHeaders);

  DisableControls([edtWarrantNumber, edtWarrantFIO, edtWarrantPosition,
                   edtWarrantName, edtPower, edtMaxSum, edtFinDocID,
                   edtName, edtPartnerCode,
                   edtContractNumber, edtContractDateFin, edtCommentGen]);

  btnPrintContract.Visible := false;
  btnPrintBill.Visible := false;
  btnSpec.Visible := false;
  btnInvoice.Visible := false;

  tsPlans.TabVisible := (DialogState <> dsInsert);
  tsActs.TabVisible := False;
  tsRQFKOrder.TabVisible := (DialogState <> dsInsert);
  tsPaymentSchedule.TabVisible := False;

  gbPayments.Visible := False;

  DisableActions([actBudgetApproved]);

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
      , spbFinPayForm
      , spbFinPayFormClear
       ]);

    DisableActions([actInsert, actEdit, actDelete, actFilter, actNoFilter,
                    actEditPlan, actBudgetApproved]);
  end;

  DisableControls([edtENDepartmentDepartmentName, edtContractNumberServices]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtENDepartmentDepartmentName, edtContractServicesSumma, edtWarrantNumber,
      edtContragentName, edtContragentAddress, edtContragentPassport, edtContragentOkpo,
      edtContragentBankName, edtContragentBankAccount, edtContragentBankMfo,
      edtWarrantContrAgentFIO, edtWarrantContrAgentNumber, edtBaseComments]);
  end;

  if (DialogState = dsInsert) then
  begin
    gbPayments.Visible := False;
    cbbBasisType.ItemIndex := 3;
  end;

  DisableControls([edtCode ,edtCommentGen ]);

  if (DialogState = dsEdit) then
  begin
      DisableControls([spbENDepartmentDepartment], false);
      DisableControls([edtContractNumber, edtContractDateServices, edtFinPayFormCode, edtFinPayFormName]);
      DenyBlankValues([edtENDepartmentDepartmentName, edtFinPayFormCode, edtFinPayFormName, edtPayDetail]);


      ///// 28.07.10
      if ENServicesSaleObj.finDocID = LOW_INT then
      begin
        DisableControls([{edtContractNumber, }spbContractNumberSelect], false);
        DenyBlankValues([edtContractNumber]);
      end;
      /////
  end;

  if DialogState = dsInsert then
      edtContractNumberServices.Text := 'Auto';

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    planCode := DMReports.getPlanCodeForCalculationByElement(ENServicesSaleObj.element.code);

    tsPaymentSchedule.TabVisible := (ENServicesSaleObj.contractTypeRef.code = ENSERVICESOBJECTTYPE_SALE_PAYMENT_SCHEDULE);

    {
    if ((ENServicesSaleObj.contractStatusRef <> nil)
         and (ENServicesSaleObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED)) then
       tsRQFKOrder.TabVisible := True;
    }   

    if ((ENServicesSaleObj.contractStatusRef <> nil)
         and (ENServicesSaleObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED)) then
    begin
      btnPrintContract.Visible := True;
      btnSpec.Visible := True;
    end;

    if ((ENServicesSaleObj.contractStatusRef <> nil)
         and (ENServicesSaleObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_SIGNED)) then
    begin
      btnPrintBill.Visible := True;
      //btnInvoice.Visible := True;
    end;

    if ((ENServicesSaleObj.contractStatusRef <> nil)
         and (ENServicesSaleObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_PAID)) then
    begin
      //btnPrintBill.Visible := True;
      btnInvoice.Visible := True;
    end;

    if ((ENServicesSaleObj.contractStatusRef <> nil)
         and (ENServicesSaleObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PAID)) then
       gbPayments.Visible := True;

    if  ENServicesSaleObj.warrantRef.code <> LOW_INT then
    begin
      warrant := DMReports.getWarrantByCode(ENServicesSaleObj.warrantRef.code);

      edtWarrantNumber.Text := warrant.numbergen;
      edtWarrantFIO.Text := warrant.warrantFIO;
      edtWarrantPosition.Text := warrant.warrantPosition; 
      MakeMultiline(edtWarrantName.Lines, warrant.name);
      edtPower.Text := IntToStr(warrant.power);
      edtMaxSum.Text := warrant.maxSum.DecimalString;
    end;

    edtCode.Text := IntToStr(ENServicesSaleObj.code);

    if ENServicesSaleObj.payDate <> nil then
    begin
      edtPayDate.DateTime := EncodeDate(ENServicesSaleObj.payDate.Year,ENServicesSaleObj.payDate.Month,ENServicesSaleObj.payDate.Day);
      edtPayDate.checked := true;
    end
    else
    begin
      edtPayDate.DateTime := SysUtils.Date;
      edtPayDate.checked := false;
    end;

    if (ENServicesSaleObj.finPayFormCode <> Low(Integer)) then
       edtFinPayFormCode.Text := IntToStr(ENServicesSaleObj.finPayFormCode)
    else
       edtFinPayFormCode.Text := '';

    edtFinPayFormName.Text := ENServicesSaleObj.finPayFormName;
    edtPayDetail.Text := ENServicesSaleObj.payDetail;


    if (ENServicesSaleObj.contractNumber <> '') then
       edtContractNumber.Text := ENServicesSaleObj.contractNumber
    else
       edtContractNumber.Text := ENServicesSaleObj.contractNumberServices;

    if ENServicesSaleObj.contractDateServices <> nil then
    begin
      edtContractDateServices.DateTime:=EncodeDate(ENServicesSaleObj.contractDateServices.Year,ENServicesSaleObj.contractDateServices.Month,ENServicesSaleObj.contractDateServices.Day);
      edtContractDateServices.checked := true;
    end
    else
    begin
      edtContractDateServices.DateTime:=SysUtils.Date;
      edtContractDateServices.checked := false;
    end;

    if (ENServicesSaleObj.basisType <> nil ) then
      begin
       case StrToInt(ENServicesSaleObj.basisType.DecimalString) of
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

            if (ENServicesSaleObj.basisType.DecimalString <> '3') and ( DialogState = dsEdit ) then
             DisableControls([edtWarrantContrAgentFIO , edtWarrantContrAgentNumber , edtWarrantContrAgentDate]);


      end

    else
      begin
       DisableControls([edtWarrantContrAgentFIO , edtWarrantContrAgentNumber , edtWarrantContrAgentDate]);
       cbbBasisType.ItemIndex := 0;
      end; 


    if ENServicesSaleObj.contractDate <> nil then
    begin
      edtContractDateFin.DateTime:=EncodeDate(ENServicesSaleObj.contractDate.Year,ENServicesSaleObj.contractDate.Month,ENServicesSaleObj.contractDate.Day);
      edtContractDateFin.checked := true;
    end;

    edtContragentName.Text := ENServicesSaleObj.contragentName;
    MakeMultiline(edtContragentAddress.Lines, ENServicesSaleObj.contragentAddress);
    MakeMultiline(edtContragentPassport.Lines, ENServicesSaleObj.contragentPassport);
    edtContragentOkpo.Text := ENServicesSaleObj.contragentOkpo;
    edtContragentBossName.Text := ENServicesSaleObj.contragentBossName;
    edtContragentBankName.Text := ENServicesSaleObj.contragentBankName;
    edtContragentBankAccount.Text := ENServicesSaleObj.contragentBankAccount;
    edtContragentBankMfo.Text := ENServicesSaleObj.contragentBankMfo;
    edtENDepartmentDepartmentName.Text := ENServicesSaleObj.department.name;
    MakeMultiline(edtCommentGen.Lines, ENServicesSaleObj.commentGen);

    edtName.Text := ENServicesSaleObj.name;
    edtPartnerCode.Text := ENServicesSaleObj.partnerCode;
    edtFinDocCode.Text := ENServicesSaleObj.finDocCode;

    edtWarrantContrAgentNumber.Text := ENServicesSaleObj.warrantNumber;
    edtWarrantContrAgentFIO.Text := ENServicesSaleObj.warrantFIO;

    if ENServicesSaleObj.warrantDate <> nil then
    begin
      edtWarrantContrAgentDate.DateTime:=EncodeDate(ENServicesSaleObj.warrantDate.Year,ENServicesSaleObj.warrantDate.Month,ENServicesSaleObj.warrantDate.Day);
      edtWarrantContrAgentDate.checked := true;
    end;


    if (ENServicesSaleObj.finDocID <> Low(Integer)) then
       edtFinDocID.Text := IntToStr(ENServicesSaleObj.finDocID)
    else
       edtFinDocID.Text := '';

    if (ENServicesSaleObj.contractServicesSumma <> nil) then
       edtContractServicesSumma.Text := ENServicesSaleObj.contractServicesSumma.decimalString
    else
       edtContractServicesSumma.Text := '';

    edtContragentPosition.Text := ENServicesSaleObj.contragentPosition;

    edtContragentPhoneNumber.Text := ENServicesSaleObj.contragentPhoneNumber;

    rgContragentType.ItemIndex:= ENServicesSaleObj.contragentTypeRef.code-1;
    rgPayable.ItemIndex:= ENServicesSaleObj.isNoPay;

    MakeMultiline(edtBaseComments.Lines, ENServicesSaleObj.commentServicesGen);

    //planCode := DMReports.getPlanCodeForCalculationByElement(ENServicesSaleObj.element.code);
    ////////
    SetFormCaption(ENServicesSaleObj.element.code);
    ////////
    pcCalculationChange(Sender);

  end;

end;


procedure TfrmENServicesSalesEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENServicesObject: ENServicesObjectControllerSoapPort;

begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  //if (ModalResult = mrOk) and (DialogState = dsEdit) then

   if ((ENServicesSaleObj.contractStatusRef <> nil)
       and (ENServicesSaleObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED)) and
   /////////

   not NoBlankValues([
      edtContractNumberServices
      ,edtContragentName
      ///// 28.07.10
      //,edtPartnerCode
      //,edtFinDocCode
      //,edtFinDocID
      /////
      ,edtENDepartmentDepartmentName
     ])  then
   begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
   end
   else if (not NoBlankValues([edtContractNumberServices, edtENDepartmentDepartmentName, edtContractServicesSumma, edtWarrantNumber,
                edtContragentName, edtContragentAddress, edtContragentPassport, edtContragentOkpo,
                edtContragentBankName, edtContragentBankAccount, edtContragentBankMfo, edtContractDateServices, edtBaseComments])) then
   begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
   end


   else if (((ENServicesSaleObj.contractStatusRef <> nil)
      and (ENServicesSaleObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PAID))
        and (not NoBlankValues([edtPayDate, edtFinPayFormCode, edtFinPayFormName, edtPayDetail])))  then
   begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
   end

   else
   begin
      TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

//      if ((ENServicesSaleObj.contractStatusRef <> nil)
//            and (ENServicesSaleObj.contractStatusRef.code >= ENSERVICESOBJECTSTATUS_BUDGETAPPROVED)) then
//      begin

         if edtcontractDateFin.checked then
         begin
           if ENServicesSaleObj.contractDate = nil then
              ENServicesSaleObj.contractDate := TXSDate.Create;
           ENServicesSaleObj.contractDate.XSToNative(GetXSDate(edtcontractDateFin.DateTime));
         end
         else begin
            Application.MessageBox(PChar('Введите дату договора!'),PChar('Внимание!'), MB_ICONWARNING);
            Action := caNone;
            ENServicesSaleObj.contractDate := nil;
            Exit;
         end;

         if edtContractDateServices.checked then
         begin
           if ENServicesSaleObj.contractDateServices = nil then
              ENServicesSaleObj.contractDateServices := TXSDate.Create;
           ENServicesSaleObj.contractDateServices.XSToNative(GetXSDate(edtContractDateServices.DateTime));
         end
         else begin
            Application.MessageBox(PChar('Введите дату договора!'),PChar('Внимание!'), MB_ICONWARNING);
            Action := caNone;
            ENServicesSaleObj.contractDateServices := nil;
            Exit;
         end;
//      end;

      if ((ENServicesSaleObj.contractStatusRef <> nil)
            and (ENServicesSaleObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_DRAFT)) then
        ENServicesSaleObj.name := ' '
      else
        ENServicesSaleObj.name := edtName.Text; // контрагент из фин договора


       ENServicesSaleObj.partnerCode := edtPartnerCode.Text;

       ENServicesSaleObj.finDocCode := edtFinDocCode.Text;

       if (edtFinDocID.Text <> '' ) then
         ENServicesSaleObj.finDocID := StrToInt(edtFinDocID.Text)
       else
         ENServicesSaleObj.finDocID := Low(Integer) ;

       ENServicesSaleObj.commentGen := edtCommentGen.Text;

       ENServicesSaleObj.contractNumberServices := edtContractNumberServices.Text; // наш
       ENServicesSaleObj.contractNumber := edtContractNumber.Text;

       ENServicesSaleObj.contragentName := edtContragentName.Text; // контрагент услуги

       ENServicesSaleObj.contragentAddress := edtContragentAddress.Text;

       ENServicesSaleObj.contragentOkpo := edtContragentOkpo.Text;

       ENServicesSaleObj.contragentBankAccount := edtContragentBankAccount.Text;

       ENServicesSaleObj.contragentBankName := edtContragentBankName.Text;

       ENServicesSaleObj.contragentBankMfo := edtContragentBankMfo.Text;
       ENServicesSaleObj.contragentBossName := edtContragentBossName.Text;
       ENServicesSaleObj.contragentPassport := edtContragentPassport.Text;
       ENServicesSaleObj.contragentTypeRef := ENServicesContragentTypeRef.Create;
       ENServicesSaleObj.contragentTypeRef.code := rgContragentType.ItemIndex+1;
       ENServicesSaleObj.contractTypeRef := ENServicesContractTypeRef.Create;

       ENServicesSaleObj.isNoPay := rgPayable.ItemIndex;
        ENServicesSaleObj.contragentPosition := edtContragentPosition.Text;

       if (ENServicesSaleObj.contractServicesSumma = nil) then
         ENServicesSaleObj.contractServicesSumma := TXSDecimal.Create;
       if edtContractServicesSumma.Text <> '' then
         ENServicesSaleObj.contractServicesSumma.DecimalString := edtContractServicesSumma.Text
       else
         ENServicesSaleObj.contractServicesSumma := nil;

       if (ENServicesSaleObj.contractServicesPower = nil) then
         ENServicesSaleObj.contractServicesPower := TXSDecimal.Create;
       ENServicesSaleObj.contractServicesPower := nil;

        ENServicesSaleObj.warrantNumber := edtWarrantContrAgentNumber.Text;
        ENServicesSaleObj.warrantFIO := edtWarrantContrAgentFIO.Text;

        if edtWarrantContrAgentDate.checked then
        begin
          if ENServicesSaleObj.warrantDate = nil then
          ENServicesSaleObj.warrantDate := TXSDate.Create;
          ENServicesSaleObj.warrantDate.XSToNative(GetXSDate(edtWarrantContrAgentDate.DateTime));
        end
        else
        ENServicesSaleObj.warrantDate := nil;

        if (ENServicesSaleObj.basisType = nil ) then
        ENServicesSaleObj.basisType := TXSDecimal.Create;
        if ((cbbBasisType.ItemIndex <> -1 ) and  (cbbBasisType.ItemIndex <> 0)) then
          ENServicesSaleObj.basisType.decimalString := IntToStr(cbbBasisType.itemIndex)
        else
          ENServicesSaleObj.basisType := nil;

        if edtdateEdit.checked then
        begin
          if ENServicesSaleObj.dateEdit = nil then
             ENServicesSaleObj.dateEdit := TXSDate.Create;
          ENServicesSaleObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
        end
        else
          ENServicesSaleObj.dateEdit := nil;

        ENServicesSaleObj.contragentPhoneNumber := edtContragentPhoneNumber.Text;


        if edtPayDate.checked then
        begin
          if ENServicesSaleObj.payDate = nil then
             ENServicesSaleObj.payDate := TXSDate.Create;
          ENServicesSaleObj.payDate.XSToNative(GetXSDate(edtPayDate.DateTime));
        end
        else
          ENServicesSaleObj.payDate := nil;

       if (edtFinPayFormCode.Text <> '' ) then
         ENServicesSaleObj.finPayFormCode := StrToInt(edtFinPayFormCode.Text)
       else
         ENServicesSaleObj.finPayFormCode := Low(Integer);

       ENServicesSaleObj.finPayFormName := edtFinPayFormName.Text;

       ENServicesSaleObj.commentServicesGen := edtBaseComments.Text;
       ENServicesSaleObj.payDetail := edtPayDetail.Text;


      if DialogState = dsInsert then
      begin
        ENServicesSaleObj.code:=low(Integer);
        TempENServicesObject.addForSale(ENServicesSaleObj);
      end
      else
      if DialogState = dsEdit then
      begin
        TempENServicesObject.saveForSale(ENServicesSaleObj);
      end;
   end;
end;

procedure TfrmENServicesSalesEdit.btnENDepartmentDepartmentClick(Sender : TObject);
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
              // if ENServicesSaleObj.department = nil then ENServicesSaleObj.department := ENDepartment.Create();
               DepartmentForServicesCode := ENDepartmentShort(tvDep.Selected.Data).code;
              // edtDepartmentForServices.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
              // if  ENServicesSaleObj.element = nil then  ENServicesSaleObj.element := ENElement.Create;
              // if  ENServicesSaleObj.element.renRef = nil then ENServicesSaleObj.element.renRef := EPRenRef.Create;
              // ENServicesSaleObj.element.renRef.code := StrToInt(DMReports.getEPRenByDepartmentCode(ENServicesSaleObj.department.code));
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;



procedure TfrmENServicesSalesEdit.btnENElementElementClick(Sender : TObject);
var
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENServicesSaleObj.element = nil then ENServicesSaleObj.element := ENElement.Create();
               ENServicesSaleObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;



procedure TfrmENServicesSalesEdit.btnContractNumberSelectClick(Sender: TObject);
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

procedure TfrmENServicesSalesEdit.spbContractNumberSelectClick(
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

                if (edtContragentName.Text = '') then
                   edtContragentName.Text := GetReturnValue(sgFINServicesObject, 3);

                ENServicesSaleObj.partnerId := StrToInt(GetReturnValue(sgFINServicesObject, 10));

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

procedure TfrmENServicesSalesEdit.spbENDepartmentDepartmentClick(
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
               if ENServicesSaleObj.department = nil then ENServicesSaleObj.department := ENDepartment.Create();
               ENServicesSaleObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
               if  ENServicesSaleObj.element = nil then  ENServicesSaleObj.element := ENElement.Create;
               if  ENServicesSaleObj.element.renRef = nil then ENServicesSaleObj.element.renRef := EPRenRef.Create;
               ENServicesSaleObj.element.renRef.code := StrToInt(DMReports.getEPRenByDepartmentCode(ENServicesSaleObj.department.code));
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENServicesSalesEdit.actUpdateExecute(Sender: TObject);
begin
  inherited;

  pcCalculationChange(self);
end;

procedure TfrmENServicesSalesEdit.actEditExecute(Sender: TObject);
var
  TempRQFKOrder : RQFKOrderControllerSoapPort;
begin
  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  frmRQFKOrderEdit := TfrmRQFKOrderEdit.Create(Application, dsEdit);
  frmRQFKOrderEdit.servicesObject := ENServicesSaleObj;

  try
    try
      frmRQFKOrderEdit.RQFKOrderObj := TempRQFKOrder.getObject(StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]));
    except
      on EConvertError do Exit;
    end;

    // 23.02.2012 +++ разрешаем редактировать бух.атрибуты на акте со статусом "Складений"
    if ((frmRQFKOrderEdit.RQFKOrderObj.status.code <> RQFKORDER_STATUS_GOOD)
           and (frmRQFKOrderEdit.RQFKOrderObj.kind.code <> RQFKORDER_KIND_SALE_PRODUCTS)) then
    begin
        Application.MessageBox(PChar('Цей ордер не редагується ... відмініть проведення або затвердження ...'),
                      PChar('Увага !'),MB_ICONWARNING );
        Exit;
    end else
    if ((frmRQFKOrderEdit.RQFKOrderObj.status.code = RQFKORDER_STATUS_IN_FK)
           and (frmRQFKOrderEdit.RQFKOrderObj.kind.code = RQFKORDER_KIND_SALE_PRODUCTS)) then
    begin
        Application.MessageBox(PChar('Цей акт не редагується ... відмініть проведення...'),
                      PChar('Увага !'),MB_ICONWARNING );
        Exit;
    end;

    if frmRQFKOrderEdit.ShowModal= mrOk then
      begin
        //TempRQFKOrder.save(RQFKOrderObj);
        pcCalculationChange(Sender);
      end;
  finally
    frmRQFKOrderEdit.Free;
    frmRQFKOrderEdit:=nil;
  end;
end;

procedure TfrmENServicesSalesEdit.actViewExecute(Sender: TObject);
Var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    TempENPlanWork: ENPlanWorkControllerSoapPort;
    TempENEstimateItem : ENEstimateItemControllerSoapPort;
    tPlan: ENPlanWork;
    objCode: Integer;
    TempRQFKOrder : RQFKOrderControllerSoapPort;
begin

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

  // -----------------------------------------------
  if pcCalculation.ActivePage = tsRQFKOrder then
  begin
    TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
    frmRQFKOrderEdit := TfrmRQFKOrderEdit.Create(Application, dsView);

    try
      try
        frmRQFKOrderEdit.RQFKOrderObj := TempRQFKOrder.getObject(StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]));
      except
        on EConvertError do Exit;
      end;

      if (frmRQFKOrderEdit.ShowModal = mrOk)
            and (frmRQFKOrderEdit.RQFKOrderObj.kind.code = RQFKORDER_KIND_SALE_PRODUCTS) then
        begin
          pcCalculationChange(Sender);
        end;

    finally
      frmRQFKOrderEdit.Free;
      frmRQFKOrderEdit := nil;
    end;
  end;
  // pcCalculation.ActivePage = tsRQFKOrder

end;

procedure TfrmENServicesSalesEdit.pcCalculationChange(
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

  TempRQFKOrder : RQFKOrderControllerSoapPort;
  RQFKOrderList : RQFKOrderShortList;
  RQFKOrderFilterObj : RQFKOrderFilter;

  TempENServicesObject2PaymentSchedule : ENServicesObject2PaymentScheduleControllerSoapPort;
  ScheduleList : ENServicesObject2PaymentScheduleShortList;
  ScheduleFilterObj : ENServicesObject2PaymentScheduleFilter;
begin

  if pcCalculation.ActivePage = tsPlans then
  begin
    ClearGrid(sgENPlanWork);

    if ENServicesSaleObj = nil then Exit;
    if ENServicesSaleObj.element = nil then Exit;
    if ENServicesSaleObj.element.code = LOW_INT then Exit;

    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    planFilter := ENPlanWorkFilter.Create;
    SetNullIntProps(planFilter);
    SetNullXSProps(planFilter);

    planFilter.elementRef := ENElementRef.Create;
    planFilter.elementRef.code := ENServicesSaleObj.element.code;

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
  end; // if pcCalculation.ActivePage = tsPlans

  if pcCalculation.ActivePage = tsActs then
  begin
    ClearGrid(sgENAct);

    if ENServicesSaleObj = nil then Exit;
    if ENServicesSaleObj.element = nil then Exit;
    if ENServicesSaleObj.element.code = LOW_INT then Exit;

    actDate := '';
    
    TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

    actFilter := ENActFilter.Create;
    SetNullIntProps(actFilter);
    SetNullXSProps(actFilter);

    actFilter.element := ENElement.Create;
    actFilter.element.code := ENServicesSaleObj.element.code;

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
      Cells[1, 1] := ENServicesSaleObj.contractNumberServices + '/' + ENServicesSaleObj.contractNumber;
      Cells[2, 1] := actDate;
    end;
  end; // if pcCalculation.ActivePage = tsActs


  //------------------------------------------------
  if pcCalculation.ActivePage = tsRQFKOrder then
  begin
    ClearGrid(sgRQFKOrder);

    TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

    RQFKOrderFilterObj := RQFKOrderFilter.Create;
    SetNullIntProps(RQFKOrderFilterObj);
    SetNullXSProps(RQFKOrderFilterObj);

    RQFKOrderFilterObj.conditionSQL := 'code in (' +
      'select s.fkorderrefcode from enservicesbjct2rqfkrdr s ' +
      ' where s.servicesobjectrefcode = ' + IntToStr(ENServicesSaleObj.code) + ')';

    RQFKOrderFilterObj.orderBySQL := 'dategen desc, statuscode desc';

    RQFKOrderList := TempRQFKOrder.getScrollableFilteredList(RQFKOrderFilterObj, 0, -1);

    if High(RQFKOrderList.list) > -1 then
       sgRQFKOrder.RowCount := High(RQFKOrderList.list) + 2
    else
       sgRQFKOrder.RowCount := 2;

     with sgRQFKOrder do
      for i := 0 to High(RQFKOrderList.list) do
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

          Cells[3,i+1] := RQFKOrderList.list[i].molInCode;

          Cells[4,i+1] := RQFKOrderList.list[i].molInName;

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

          sgRQFKOrder.RowCount := i + 2;
        end;

     sgRQFKOrder.Row := 1;
  end;

  // pcCalculation.ActivePage = tsRQFKOrder


  //----------   pcCalculation.ActivePage = tsPaymentSchedule  ---------------
  if pcCalculation.ActivePage = tsPaymentSchedule then
  begin
    ClearGrid(sgENServicesObject2PaymentSchedule);

    TempENServicesObject2PaymentSchedule :=  HTTPRIOENServicesObject2PaymentSchedule as ENServicesObject2PaymentScheduleControllerSoapPort;

    ScheduleFilterObj := ENServicesObject2PaymentScheduleFilter.Create;
    SetNullIntProps(ScheduleFilterObj);
    SetNullXSProps(ScheduleFilterObj);

    ScheduleFilterObj.servicesObjectRef := ENServicesObjectRef.Create;
    ScheduleFilterObj.servicesObjectRef.code := ENServicesSaleObj.code;

    ScheduleList := TempENServicesObject2PaymentSchedule.getScrollableFilteredList(ScheduleFilterObj, 0, -1);

    if High(ScheduleList.list) > -1 then
       sgENServicesObject2PaymentSchedule.RowCount := High(ScheduleList.list) + 2
    else
       sgENServicesObject2PaymentSchedule.RowCount := 2;

     with sgENServicesObject2PaymentSchedule do
      for i := 0 to High(ScheduleList.list) do
        begin
          Application.ProcessMessages;

          if ScheduleList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(ScheduleList.list[i].code)
          else
            Cells[0,i+1] := '';

          if ScheduleList.list[i].startDate = nil then
            Cells[1,i+1] := ''
          else
            Cells[1,i+1] := XSDate2String(ScheduleList.list[i].startDate);

          if ScheduleList.list[i].endDate = nil then
            Cells[2,i+1] := ''
          else
            Cells[2,i+1] := XSDate2String(ScheduleList.list[i].endDate);

          if ScheduleList.list[i].paySum = nil then
            Cells[3,i+1] := ''
          else
            Cells[3,i+1] := ScheduleList.list[i].paySum.DecimalString;


          sgENServicesObject2PaymentSchedule.RowCount := i + 2;
        end;

     sgENServicesObject2PaymentSchedule.Row := 1;
  end;
  //----------   pcCalculation.ActivePage = tsPaymentSchedule  ---------------

end;

procedure TfrmENServicesSalesEdit.actDeleteExecute(Sender: TObject);
Var TempENPlanWorkItem : ENPlanWorkItemControllerSoapPort;
    TempENEstimateItem : ENEstimateItemControllerSoapPort;
    TempENPlanWork2ClassificationType : ENPlanWork2ClassificationTypeControllerSoapPort;
    plan2ctFilter : ENPlanWork2ClassificationTypeFilter;
    ENPlanWork2ClassificationTypeList : ENPlanWork2ClassificationTypeShortList;
    ObjCode, planItemCode , ttt: Integer;

    TempENPlanWork : ENPlanWorkControllerSoapPort;
    plan : ENPlanWork;
    ENPlanWorkList: ENPlanWorkShortList;
    filterPlan : ENPlanWorkFilter;

    TempRQFKOrder : RQFKOrderControllerSoapPort;
    fkOrderCode : Integer;
    fkOrderObj : RQFKOrder;
begin

  // -----------------------------------------------
  if pcCalculation.ActivePage = tsRQFKOrder then
  begin
     TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
     try
       fkOrderCode := StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]);
     except
       on EConvertError do Exit;
     end;

     fkOrderObj := TempRQFKOrder.getObject(fkOrderCode);

     if fkOrderObj.status.code <> RQFKORDER_STATUS_GOOD then
     begin
       Application.MessageBox(PChar('Цей ордер не видаляється ... відмініть проведення або затвердження ...'),
                  PChar('Внимание !'),MB_ICONWARNING );
       Exit;
     end;

     if Application.MessageBox(PChar('Ви дійсно бажаєте видалити ордер ?'),
                 PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
     begin
       TempRQFKOrder.remove(fkOrderCode);
       pcCalculationChange(Sender);
     end;
  end;
  // pcCalculation.ActivePage = tsRQFKOrder

end;

procedure TfrmENServicesSalesEdit.actInsertExecute(Sender: TObject);
var
  TempRQFKOrder : RQFKOrderControllerSoapPort;
  TempENServicesObject2PaymentSchedule : ENServicesObject2PaymentScheduleControllerSoapPort;
begin
  //------------------------------------------------
  if pcCalculation.ActivePage = tsRQFKOrder then
  begin
    TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

    frmRQFKOrderEdit := TfrmRQFKOrderEdit.Create(Application, dsInsert);
    try
      frmRQFKOrderEdit.servicesObject := ENServicesSaleObj;

      frmRQFKOrderEdit.RQFKOrderObj := RQFKOrder.Create;
      frmRQFKOrderEdit.RQFKOrderObj.warrantDate := TXSDate.Create;
      frmRQFKOrderEdit.RQFKOrderObj.kind := RQFKOrderKind.Create;
      frmRQFKOrderEdit.RQFKOrderObj.kind.code := RQFKORDER_KIND_SALE_PRODUCTS;

      if frmRQFKOrderEdit.ShowModal = mrOk then
      begin
        if frmRQFKOrderEdit.RQFKOrderObj <> nil then
            pcCalculationChange(Sender);
      end;
    finally
      frmRQFKOrderEdit.Free;
      frmRQFKOrderEdit := nil;
    end;
  end;
  // pcCalculation.ActivePage = tsRQFKOrder

  //------------------------------------------------
  if pcCalculation.ActivePage = tsPaymentSchedule then
  begin
    TempENServicesObject2PaymentSchedule := HTTPRIOENServicesObject2PaymentSchedule as ENServicesObject2PaymentScheduleControllerSoapPort;
    ENServicesObject2PaymentScheduleObj := ENServicesObject2PaymentSchedule.Create;
    ENServicesObject2PaymentScheduleObj.servicesObjectRef := ENServicesObjectRef.Create;
    ENServicesObject2PaymentScheduleObj.servicesObjectRef.code := ENServicesSaleObj.code;

    try

      frmENServicesObject2PaymentScheduleEdit := TfrmENServicesObject2PaymentScheduleEdit.Create(Application, dsInsert);
      frmENServicesObject2PaymentScheduleEdit.servicesObject := ENServicesSaleObj.code;

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
  // pcCalculation.ActivePage = tsPaymentSchedule

end;


procedure TfrmENServicesSalesEdit.FormCreate(Sender: TObject);
begin
  inherited;
  planCode := LOW_INT;
end;



procedure TfrmENServicesSalesEdit.SetFormCaption(elementCode: Integer);
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
      Self.Caption := 'Продаж товарів. Договір № ' + servicesObjList.list[0].contractNumberServices;
      if servicesObjList.list[0].contractDateServices <> nil then
      begin
        Self.Caption := Self.Caption + ' від ' + XSDate2String(servicesObjList.list[0].contractDateServices);
        edtContractDateServices.DateTime := EncodeDate(servicesObjList.list[0].contractDateServices.Year,
                                                       servicesObjList.list[0].contractDateServices.Month,
                                                       servicesObjList.list[0].contractDateServices.Day);
      end;
    end;
end;

 
procedure TfrmENServicesSalesEdit.btnPrintContractClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'servicesobjectcode';
  args[0] := IntToStr(ENServicesSaleObj.code);

  if (ENServicesSaleObj.contractTypeRef.code = ENSERVICESOBJECTTYPE_SALE_PAYMENT_SCHEDULE) then
  begin
    reportName := 'Services/AgreeSales/agreement2';
    makeReport(reportName, argNames, args, 'pdf');
    reportName := 'Services/AgreeSales/graph_payment';
    makeReport(reportName, argNames, args, 'pdf');
  end
  else
  begin
    reportName := 'Services/AgreeSales/agreement';
    makeReport(reportName, argNames, args, 'pdf');
  end;

end;



procedure TfrmENServicesSalesEdit.btnPrintBillClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'servicesobjectcode';
  args[0] := IntToStr(ENServicesSaleObj.code);

  reportName := 'Services/AgreeSales/bill';

  makeReport(reportName , argNames , args , 'pdf');
end;


procedure TfrmENServicesSalesEdit.actBudgetApprovedExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := ENServicesSaleObj.code;
  except
    on EConvertError do Exit;
  end;

  if (ENServicesSaleObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_BUDGETAPPROVED) then
  begin
    if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити затвердження кошторису ?'),
                      PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
      TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
      TempENServicesObject.unBudgetApproved(objCode);
      Application.MessageBox(PChar('Затвердження відмінено...'), PChar('Повідомлення'), MB_ICONINFORMATION);

      actUpdateObject(Sender);
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
    FormShow(Sender);
  end;

end;


procedure TfrmENServicesSalesEdit.actUpdateObject(Sender: TObject);
Var TempServicesObject: ENServicesObjectControllerSoapPort;
    ObjCode: Integer;
begin
//
end;

procedure TfrmENServicesSalesEdit.spbWarrantNumberClick(
  Sender: TObject);
var frmENWarrantShow : TfrmENWarrantShow;
    f : ENWarrantFilter;
    warrant : ENWarrant;
    datContract, datWarrant : TXSDate;
    dtdatContract, dtdatWarrant : TDateTime;
begin

   if (edtENDepartmentDepartmentName.Text = '') then
   begin
      Application.MessageBox(PChar('Не обрано підрозділ!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
      Exit;
   end;

   if (edtContractServicesSumma.Text = '') then
   begin
      Application.MessageBox(PChar('Не вказано суму за договором!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
      Exit;
   end;

   datContract := TXSDate.Create;
   datWarrant := TXSDate.Create;

   f := ENWarrantFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);
   f.departmentRef := ENDepartmentRef.Create();
   f.departmentRef.code := ENServicesSaleObj.department.code;
   f.conditionSQL := ' warrantstatusrefcode = 0';

   frmENWarrantShow := TfrmENWarrantShow.Create(Application,fmNormal, f);
   DisableActions([frmENWarrantShow.actNoFilter]);

   try
      with frmENWarrantShow do
        if ShowModal = mrOk then
        begin
            try

               ENServicesSaleObj.warrantRef := ENWarrantRef.Create();
               ENServicesSaleObj.warrantRef.code := StrToInt(GetReturnValue(sgENWarrant,0));

                //////////////////////////////////////////////////////
                ///   проверка даты доверенности с датой договора  ///
                ///     суммы в доверенности с суммой договора     ///
                //////////////////////////////////////////////////////

                if  ENServicesSaleObj.warrantRef.code <> LOW_INT then
                begin
                  warrant := DMReports.getWarrantByCode(ENServicesSaleObj.warrantRef.code);

                  datContract.XSToNative(GetXSDate(frmENServicesSalesEdit.edtContractDateServices.DateTime));
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
                      ENServicesSaleObj.warrantRef.code := LOW_INT;
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
                      ENServicesSaleObj.warrantRef.code := LOW_INT;
                    Exit;
                  end;

                  // edtContractServicesSumma.Text
                  // ENServicesSaleObj.contractServicesSumma.DecimalString

{
                  if (StrToFloat(edtContractServicesSumma.Text) > StrToFloat(warrant.maxSum.DecimalString)) then
                  begin
                    Application.MessageBox(PChar('Сума у договорі перевищує гранічну суму у довіреності!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                      edtWarrantNumber.Text := '';
                      edtWarrantFIO.Text := '';
                      edtWarrantPosition.Text := '';
                      edtWarrantName.Text := '';
                      edtPower.Text := '';
                      edtMaxSum.Text := '';
                      ENServicesSaleObj.warrantRef.code := LOW_INT;
                    Exit;
                  end;
 }
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

procedure TfrmENServicesSalesEdit.Button1Click(Sender: TObject);
{
Var TempServicesObject: ENServicesObjectControllerSoapPort;
    TempENPlanWork: ENPlanWorkControllerSoapPort;
    newPlanCode: Integer;
    newPlan: ENPlanWork;
}
begin
{
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
}  
end;

procedure TfrmENServicesSalesEdit.actEditPlanExecute(
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

procedure TfrmENServicesSalesEdit.actViewENActExecute(
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

procedure TfrmENServicesSalesEdit.actViewENActIncomeExecute(
  Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'ContractCode';
  args[0] := IntToStr(ENServicesSaleObj.code);

  reportName := '201109/ActCalcAdditionalWorkG/ActPriPer';

  makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmENServicesSalesEdit.edtContractServicesPowerChange(
  Sender: TObject);
begin
  inherited;

    if edtWarrantNumber.Text = '' then
    begin
      Application.MessageBox(PChar('Спочатку треба вибрати довіреність!'),
                             PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;

end;




procedure TfrmENServicesSalesEdit.cbbBasisTypeChange(
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

procedure TfrmENServicesSalesEdit.btnPostingsClick(Sender: TObject);
begin
  frmPostingsEdit := TfrmPostingsEdit.Create(Application, dsInsert);
  try
    frmPostingsEdit.servicesObjectCode := ENServicesSaleObj.code;
    frmPostingsEdit.ShowModal;
  finally
    frmPostingsEdit.Free;
  end;
end;


procedure TfrmENServicesSalesEdit.sgDepartmentClick(Sender: TObject);
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
       TKVirtualBrigadeList := TempTKVirtualBrigade.getScrollableFilteredListForServices(TempTKVirtualBrigadeFilter,0,-1 , DateToStr(edtReservedDate.DateTime) , ENServicesSaleObj.code ,strCodeActiveDepartment );


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


procedure TfrmENServicesSalesEdit.sgBrigadeInDepartmentClick(
  Sender: TObject);
begin
//  inherited;
//    RenderPlanner;
end;



procedure TfrmENServicesSalesEdit.edtReservedTimeStartChange(
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
function TfrmENServicesSalesEdit.getSumTimeWorkForCalculation(codePlan : Integer):Double;
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



procedure TfrmENServicesSalesEdit.edtContractServicesSummaChange(
  Sender: TObject);
begin

// 2014.06.03 убрано условие на порверку максимальной суммы по доверенности (Тиниченко)
{  if (edtMaxSum.Text <> '') then
  begin
    if (StrToFloat(edtContractServicesSumma.Text) > StrToFloat(edtMaxSum.Text)) then
    begin
      Application.MessageBox(PChar('Сума у договорі перевищує гранічну суму у довіреності!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
        edtWarrantNumber.Text := '';
        edtWarrantFIO.Text := '';
        edtWarrantPosition.Text := '';
        edtWarrantName.Text := '';
        edtPower.Text := '';
        edtMaxSum.Text := '';

        if (ENServicesSaleObj = nil) and (ENServicesSaleObj.warrantRef = nil)
          then ENServicesSaleObj.warrantRef := ENWarrantRef.Create();
        ENServicesSaleObj.warrantRef.code := LOW_INT;

      Exit;
    end
  end;
}

   if (ENServicesSaleObj = nil) and (ENServicesSaleObj.warrantRef = nil)
       then ENServicesSaleObj.warrantRef := ENWarrantRef.Create();


end;

procedure TfrmENServicesSalesEdit.btnSpecClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'servicesobjectcode';
  args[0] := IntToStr(ENServicesSaleObj.code);

  reportName := 'Services/AgreeSales/specification';

  makeReport(reportName , argNames , args , 'pdf');
end;

procedure TfrmENServicesSalesEdit.btnInvoiceClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'servicesobjectcode';
  args[0] := IntToStr(ENServicesSaleObj.code);

  reportName := 'Services/AgreeSales/invoice';

  makeReport(reportName , argNames , args , 'pdf');
end;

procedure TfrmENServicesSalesEdit.spbFinPayFormClick(Sender: TObject);
var
   frmPayFormShow : TfrmPayFormShow;
begin
   frmPayFormShow := TfrmPayFormShow.Create(Application, fmNormal);
   DisableActions([frmPayFormShow.actInsert, frmPayFormShow.actEdit,
        frmPayFormShow.actDelete, frmPayFormShow.actView], true);
   try
      with frmPayFormShow do
        if ShowModal = mrOk then
        begin
            try
                edtFinPayFormCode.Text := GetReturnValue(sgPayForm, 0);
                edtFinPayFormName.Text := GetReturnValue(sgPayForm, 1);

                ENServicesSaleObj.finPayFormCode := StrToInt(GetReturnValue(sgPayForm, 0));
                ENServicesSaleObj.finPayFormName := edtFinPayFormName.Text
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmPayFormShow.Free;
   end;
end;

procedure TfrmENServicesSalesEdit.spbFinPayFormClearClick(Sender: TObject);
begin
  edtFinPayFormCode.Text := '';
  edtFinPayFormName.Text := '';
end;

procedure TfrmENServicesSalesEdit.actCreatePrihodExecute(Sender: TObject);
var TempRQFKOrder: RQFKOrderControllerSoapPort;
    ObjCode : Integer;
    obj : RQFKOrder;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте змінити статус на "Складений" у накладної ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      try
       ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
      except
       on EConvertError do Exit;
      end;

      TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
      TempRQFKOrder.createdPrihod(ObjCode);

      pcCalculationChange(Sender);
  end;

end;

procedure TfrmENServicesSalesEdit.PopupMenu1Popup(Sender: TObject);
var TempRQFKOrder: RQFKOrderControllerSoapPort;
    ObjCode : Integer;
    fkorder : RQFKOrder;
begin
  try
    ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
   except
    on EConvertError do Exit;
  end;
  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  fkorder := TempRQFKOrder.getObject(ObjCode);

  actCreatePrihod.Enabled := fkorder.status.code = RQFKORDER_STATUS_GOOD;
  actUnCreatePrihod.Enabled := fkorder.status.code = RQFKORDER_STATUS_CREATED;
end;

procedure TfrmENServicesSalesEdit.actUnCreatePrihodExecute(
  Sender: TObject);
var TempRQFKOrder: RQFKOrderControllerSoapPort;
    ObjCode : Integer;
    obj : RQFKOrder;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити складання накладної ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    try
      ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
    except
      on EConvertError do Exit;
    end;

    TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
    TempRQFKOrder.unCreatedPrihod(ObjCode);

    pcCalculationChange(Sender);
  end;
end;  

end.

