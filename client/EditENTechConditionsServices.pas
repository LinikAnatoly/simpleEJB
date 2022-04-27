unit EditENTechConditionsServices;

interface



uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
    EnergyproController, EnergyproController2, ENTechConditionsServicesController,
    TB2Item, TB2Dock, TB2Toolbar, ExtCtrls, ENPriconnectionDataController,
  AdvObj, TKClassificationTypeController;

type
  TfrmENTechConditionsServicesEdit = class(TDialogForm)
    pcTechConditionServices: TPageControl;
    tsMain: TTabSheet;
    lblENServicesContragentTypeContragentTypeName: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    edtCode: TEdit;
    lblCode: TLabel;
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
    HTTPRIOENTUObject: THTTPRIO;
    tsPlans: TTabSheet;
    il1: TImageList;
    tlb1: TToolBar;
    btnView: TToolButton;
    btnInsertPlan: TToolButton;
    btnEditPlan: TToolButton;
    btnDeletePlan: TToolButton;
    sgENPlanWork: TAdvStringGrid;
    alPlans: TActionList;
    actViewPlan: TAction;
    actInsertPlan: TAction;
    actDeletePlan: TAction;
    actUpdatePlan: TAction;
    actEditPlan: TAction;
    btnUpdatePlan: TToolButton;
    HTTPRIOENPlanWork: THTTPRIO;
    actClosePlan: TAction;
    pmPlans: TPopupMenu;
    miViewPlan: TMenuItem;
    miInsertPlan: TMenuItem;
    miEditPlan: TMenuItem;
    miDeletePlan: TMenuItem;
    miUpdatePlan: TMenuItem;
    miClosePlan: TMenuItem;
    miN1: TMenuItem;
    miN2: TMenuItem;
    actUnClosePlan: TAction;
    miUnClosePlan: TMenuItem;
    actFinishPlan: TAction;
    actUndoFinishPlan: TAction;
    miN3: TMenuItem;
    miFinishPlan: TMenuItem;
    miUndoFinishPlan: TMenuItem;
    HTTPRIOENElement: THTTPRIO;
    tsActs: TTabSheet;
    tlb2: TToolBar;
    btnViewIncome: TToolButton;
    btnInsertIncome: TToolButton;
    btnDeleteIncome: TToolButton;
    btnEditIncome: TToolButton;
    btnUpdateIncome: TToolButton;
    sgENActIncomeTechConditions: TAdvStringGrid;
    alActs: TActionList;
    actViewIncome: TAction;
    actInsertIncome: TAction;
    actDeleteIncome: TAction;
    actEditIncome: TAction;
    actUpdateIncome: TAction;
    actFilterIncome: TAction;
    actNoFilterIncome: TAction;
    pmActsIncome: TPopupMenu;
    miView: TMenuItem;
    miInsert: TMenuItem;
    miDelete: TMenuItem;
    miEdit: TMenuItem;
    miUpdate: TMenuItem;
    miFilter: TMenuItem;
    miNoFilter: TMenuItem;
    HTTPRIOENActIncomeTechConditions: THTTPRIO;
    pc1: TPageControl;
    pnl1: TPanel;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    ts1: TTabSheet;
    ts2: TTabSheet;
    sgENAct: TAdvStringGrid;
    actUpdateActHoz: TAction;
    HTTPRIOENAct: THTTPRIO;
    sgRQFKOrder: TAdvStringGrid;
    actUpdateServicesFromSide: TAction;
    HTTPRIORQFKOrder: THTTPRIO;
    actViewActHoz: TAction;
    actViewActFromSide: TAction;
    btnENActIncomeTechConditionsPrint: TToolButton;
    pnl2: TPanel;
    spl1: TSplitter;
    spl2: TSplitter;
    gb4: TGroupBox;
    il2: TImageList;
    alContragents: TActionList;
    actViewContragent: TAction;
    actInsertContragent: TAction;
    actDeleteContragent: TAction;
    actEditContragent: TAction;
    actUpdateContragent: TAction;
    pm1: TPopupMenu;
    miView1: TMenuItem;
    miInsert1: TMenuItem;
    miDelete1: TMenuItem;
    miEdit1: TMenuItem;
    miUpdate1: TMenuItem;
    miFilter1: TMenuItem;
    miNoFilter1: TMenuItem;
    HTTPRIOENContragent: THTTPRIO;
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
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtFinContractNumber: TEdit;
    edtFinContractDate: TDateTimePicker;
    spbContractNumberSelect: TSpeedButton;
    lblCommentGen: TLabel;
    edtFinCommentGen: TMemo;
    HTTPRIOENTechConditionsServices: THTTPRIO;
    Label2: TLabel;
    edtResponsiblePerson: TEdit;
    spbResponsiblePerson: TSpeedButton;
    HTTPRIOENTechCondResponsibles: THTTPRIO;
    lblExecutionTerm: TLabel;
    edtExecutionTerm: TEdit;
    N1: TMenuItem;
    actSignaturedTechIncome: TAction;
    actUnSignaturedTechIncome: TAction;
    miSignaturedTechIncome: TMenuItem;
    miUnSignaturedTechIncome: TMenuItem;
    actCloseTechIncome: TAction;
    actUnCloseTechIncome: TAction;
    micloseTechIncome: TMenuItem;
    miUnCloseTechIncome: TMenuItem;
    gbAdditional: TGroupBox;
    lbl7: TLabel;
    edtCNPackCode: TEdit;
    spbCNPack: TSpeedButton;
    lblENTechConditionsServicesTypeTechCondServicesTypeName: TLabel;
    edtENTechConditionsServicesTypeTechCondServicesTypeName: TEdit;
    edtCommentServicesGen: TMemo;
    lblCommentServicesGen: TLabel;
    lblENTechContragentFormContragentFormName: TLabel;
    lbl8: TLabel;
    edtENDepartmentDepartmentName: TEdit;
    cbbENTechContragentFormContragentFormName: TComboBox;
    spbENDepartmentDepartment: TSpeedButton;
    gbGeneral: TGroupBox;
    lblContractNumber: TLabel;
    lbltysummagen: TLabel;
    lbltysummavat: TLabel;
    edtTySummaVat: TEdit;
    edtTySummaGen: TEdit;
    edtContractNumber: TEdit;
    lblContractDate: TLabel;
    edtContractDate: TDateTimePicker;
    lblTyServicesPower: TLabel;
    edtTyServicesPower: TEdit;
    lblTyServicesSumma: TLabel;
    edtTyServicesSumma: TEdit;
    btnPrintContract: TButton;
    btnPrintBill: TButton;
    rgContragentType: TRadioGroup;
    gbConnectionTariff: TGroupBox;
    edtConnectionTariffName: TEdit;
    spbConnectionTariffValus: TSpeedButton;
    edtConnectionTariffValue: TEdit;
    HTTPRIOENConnectionTariff: THTTPRIO;
    HTTPRIOENConnectionTariffEntry: THTTPRIO;
    cbBuildersArea: TCheckBox;
    lblContractDateFinal: TLabel;
    edtContractDateFinal: TDateTimePicker;
    gbPriconnectionData: TGroupBox;
    lblConnectionPowerPlaces: TLabel;
    btnCalculatePaySum: TButton;
    btnPrintCalculate: TButton;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    HTTPRIOENPriconnectionData: THTTPRIO;
    cbBaseStation: TCheckBox;
    cbSmallArchFrm: TCheckBox;
    chbIsSea: TCheckBox;
    spbENElementSecondary: TSpeedButton;
    edtENElementNameSecondary: TEdit;
    btnCalculatePaySumSecondary: TButton;
    lblConnectionPowerSecondary: TLabel;
    tsListWork: TTabSheet;
    ImageList1: TImageList;
    pnlDistance: TPanel;
    lblContractServicesDistance: TLabel;
    edtContractServicesDistance: TEdit;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    tbRecalcDistance: TToolButton;
    ToolButton3: TToolButton;
    sgENPlanWork2ClassificationType: TAdvStringGrid;
    spl3: TSplitter;
    sgENPlanWorkItem: TAdvStringGrid;
    actInsertCalculation: TAction;
    HTTPRIOENPlanWork2ClassificationType: THTTPRIO;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    actDeleteCalculation: TAction;
    actEditCalculation: TAction;
    actPrintKoshtoris: TAction;
    HTTPRIOTKClassificationType: THTTPRIO;
    btnLinkWithPlan: TToolButton;
    actLinkWithPlan: TAction;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbTechConditionsClick(Sender: TObject);
    procedure spbWarrantNumberClick(Sender: TObject);
    procedure actInsertPlanExecute(Sender: TObject);
    procedure actUpdatePlanExecute(Sender: TObject);
    procedure pcTechConditionServicesChange(Sender: TObject);
    procedure actEditPlanExecute(Sender: TObject);
    procedure actViewPlanExecute(Sender: TObject);
    procedure actDeletePlanExecute(Sender: TObject);
    procedure actClosePlanExecute(Sender: TObject);
    procedure actUnClosePlanExecute(Sender: TObject);
    procedure actFinishPlanExecute(Sender: TObject);
    procedure actUndoFinishPlanExecute(Sender: TObject);
    procedure pmPlansPopup(Sender: TObject);
    procedure btnPrintContractClick(Sender: TObject);
    procedure actViewIncomeExecute(Sender: TObject);
    procedure actUpdateIncomeExecute(Sender: TObject);
    procedure actInsertIncomeExecute(Sender: TObject);
    procedure actDeleteIncomeExecute(Sender: TObject);
    procedure actEditIncomeExecute(Sender: TObject);
    procedure actUpdateActHozExecute(Sender: TObject);
    procedure actUpdateServicesFromSideExecute(Sender: TObject);
    procedure actViewActHozExecute(Sender: TObject);
    procedure actViewActFromSideExecute(Sender: TObject);
    procedure pc1Change(Sender: TObject);
    procedure actViewContragentExecute(Sender: TObject);
    procedure actUpdateContragentExecute(Sender: TObject);
    procedure actInsertContragentExecute(Sender: TObject);
    procedure actDeleteContragentExecute(Sender: TObject);
    procedure actEditContragentExecute(Sender: TObject);
    procedure spbENDepartmentDepartmentClick(Sender: TObject);
    procedure actENActIncomeTechConditionsPrintExecute(Sender: TObject);
    procedure spbContractNumberSelectClick(Sender: TObject);
    procedure spbResponsiblePersonClick(Sender: TObject);
    procedure spbCNPackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPrintBillClick(Sender: TObject);
    procedure edtTySummaGenChange(Sender: TObject);
    procedure actSignaturedTechIncomeExecute(Sender: TObject);
    procedure actUnSignaturedTechIncomeExecute(Sender: TObject);
    procedure pmActsIncomePopup(Sender: TObject);
    procedure actCloseTechIncomeExecute(Sender: TObject);
    procedure actUnCloseTechIncomeExecute(Sender: TObject);
    procedure spbConnectionTariffValusClick(Sender: TObject);
    procedure edtTyServicesPowerChange(Sender: TObject);
    procedure cbBuildersAreaClick(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure btnCalculatePaySumClick(Sender: TObject);
    procedure btnPrintCalculateClick(Sender: TObject);
    procedure edtContractDateChange(Sender: TObject);
    procedure btnCalculatePaySumSecondaryClick(Sender: TObject);
    procedure spbENElementSecondaryClick(Sender: TObject);
    procedure actInsertCalculationExecute(Sender: TObject);
    procedure actDeleteCalculationExecute(Sender: TObject);
    procedure actEditCalculationExecute(Sender: TObject);
    procedure actPrintKoshtorisExecute(Sender: TObject);
    procedure actLinkWithPlanExecute(Sender: TObject);

  private
    { Private declarations }
    function getContragentsCount(techConditionsServicesCode: Integer): Integer;
  public
    { Public declarations }
    techConditionsServicesCode, primarySubstationElCode : Integer;
    isNotCalculated : Boolean;
    isNotCalculatedSecondary : Boolean;
    powerCategory : Boolean;
  end;

var
  frmENTechConditionsServicesEdit: TfrmENTechConditionsServicesEdit;
  ENTechConditionsServicesObj: ENTechConditionsServices;
  dataSecondary : ENPriconnectionData;

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

  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENActIncomeTechConditionsHeaders: array [1..8] of String =
        ( 'Код'
          ,'Номер акту'
          ,'Дата акту'
          ,'Дата початку акту'
          ,'Дата закінчення акту'
          ,'Загальна сума'
          ,'Сума (ПДВ)'
          ,'Статус'
        );

   ENActHeaders: array [1..6] of String =
        ( 'Код'
          ,'Номер акту'
          ,'Дата акту'
          ,'ПІБ МВО з Фін. Кол.'
          ,'Тип'
          ,'Статус'
          //,'пользователь внесший изменение'
          //,'дата последнего изменения'
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


implementation

uses
  DateUtils,
  //ShowENTechConditionsServicesStatus
  ENTechConditionsServicesStatusController
  //,ShowENTechConditionsServicesType
  ,ENTechConditionsServicesTypeController
  //,ShowENTechContragentForm
  ,ENTechContragentFormController
  //,ShowENServicesContragentType
  ,ENServicesContragentTypeController
, ShowENTechConditionsObjects, ENTechConditionsObjectsController,
  ShowENWarrant, ENWarrantController, ENDepartmentController,
  DMReportsUnit, ENConsts, EditENPlanWork, ENPlanWorkController, 
  ENPlanWorkKindController, ENPlanWorkFormController, ENBasisTypeController, 
  ENElementController, EditENActIncomeTechConditions,
  ENActIncomeTechConditionsController, ENActController, RQFKOrderController, 
  RQFKOrderKindController, EditENAct, EditRQFKOrder, ENContragentController,
  EditENContragent, ShowENDepartment, ShowFINServicesObject,
  ENServicesObjectController, ShowCNPack, ShowFINWorker,
  FINWorkerController, CNPackController, ENTechCondResponsiblesController,
  CNSubsystemTypeController, EntechConditionsServicesEditSumBill,
  ENTechContragentTypeController, ShowENConnectionTariff,
  ENConnectionTariffController, ENConnectionTariffEntryController,
  ShowENElement, EditENPriconnectionData, ENPlanWorkItemController,
  ENPlanWork2ClassificationTypeController, ENEstimateItemController,
  EditENPlanWork2ClassificationType,
  ShowENPlanWork,
  ENPlanWorkStatusController,
  Main;

{uses  
    EnergyproController, EnergyproController2, ENTechConditionsServicesController  ;
}
{$R *.dfm}



procedure TfrmENTechConditionsServicesEdit.FormShow(Sender: TObject);
 var
   TempENTechConditionsObjects: ENTechConditionsObjectsControllerSoapPort;
   TempENTechCondResponsibles: ENTechCondResponsiblesControllerSoapPort;
   ENTCObjects : ENTechConditionsObjects;
   ENTechCondResponsiblesObj: ENTechCondResponsibles;
   warrant : ENWarrant;
   i : integer;
   ENConnectionTariffShortObj : ENConnectionTariffShort;
   TempENConnectionTariff : ENConnectionTariffControllerSoapPort;
   TempENConnectionTariffEntry : ENConnectionTariffEntryControllerSoapPort;
   eFilter : ENElementFilter;
   eList : ENElementShortList;
   TempENElement : ENElementControllerSoapPort;
begin

  lblConnectionPowerSecondary.Visible := False;
  edtENElementNameSecondary.Visible := False;
  spbENElementSecondary.Visible := False;
  btnCalculatePaySumSecondary.Visible := False;
  gbPriconnectionData.Height := 82;

  SetGridHeaders(ENPlanWorkHeaders, sgENPlanWork.ColumnHeaders);
  SetGridHeaders(ENActIncomeTechConditionsHeaders, sgENActIncomeTechConditions.ColumnHeaders);
  SetGridHeaders(ENActHeaders, sgENAct.ColumnHeaders);
  SetGridHeaders(RQFKOrderHeaders, sgRQFKOrder.ColumnHeaders);
  SetGridHeaders(ENContragentHeaders, sgENContragent.ColumnHeaders);

  SetGridHeaders(ENPlanWorkItemHeaders, sgENPlanWorkItem.ColumnHeaders);
  SetGridHeaders(TKClassificationTypeHeaders, sgENPlanWork2ClassificationType.ColumnHeaders);

  DisableControls([edtENTechConditionsServicesTypeTechCondServicesTypeName, edtENDepartmentDepartmentName,
                   edtCNPackCode, edtCode{, cbbENTechContragentFormContragentFormName},
                   edtFinContractNumber, edtFinContractDate, edtFinCommentGen,
                   edtResponsiblePerson, edtContractNumber, edtENElementName]);
  SetFloatStyle([edtTyServicesSumma, edtTyServicesPower, edtTySummaGen, edtTySummaVat]);

  gbConnectionTariff.Visible := ((ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION)
       and (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART));

  {cbBuildersArea.Visible := ((ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION)
       and (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART));}

  cbBuildersArea.Visible := (ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION);

  cbBaseStation.Visible := (ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION);
  cbSmallArchFrm.Visible := cbBaseStation.Visible;

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

  tsListWork.TabVisible := (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_NO_STANDART);

  if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_NO_STANDART) then
    HideControls([lblExecutionTerm, edtExecutionTerm]);

  DisableActions([actDeleteCalculation]);

  { NET-2275 Теперь и в договорах на реализацию необходима предоплата
  HideControls([lblTyServicesSumma, edtTyServicesSumma], ENTechConditionsServicesObj.techCondServicesType.code <> ENTECHCONDITIONSSERVICES_TYPE_PROJECT);
  }
  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
       spbWarrantNumber
      ,spbCNPack
      ,spbENDepartmentDepartment
      ,spbContractNumberSelect
      ,spbResponsiblePerson
      ,rgContragentType
      , edtConnectionTariffName
      , edtConnectionTariffValue
      , spbConnectionTariffValus
      , chbIsSea, cbBaseStation, cbBuildersArea, cbSmallArchFrm
       ]);
    DisableActions([actInsertContragent, actEditContragent, actDeleteContragent]);
  end;

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

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if (DialogState = dsView) then DisableControls([edtContractServicesDistance], False);
    DenyBlankValues([edtContractServicesDistance]);

    // 17.06.2013 +++ проверка категории энергоснабжения
    // для II - й подключение и расчет от двух источников
    powerCategory := DMReports.checkPowerCategory(ENTechConditionsServicesObj.code);
    if (powerCategory) then
    begin
      lblConnectionPowerSecondary.Visible := True;
      edtENElementNameSecondary.Visible := True;
      spbENElementSecondary.Visible := True;
      btnCalculatePaySumSecondary.Visible := True;
      gbPriconnectionData.Height := 108;

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
             // SUPP-9041... 15.11.2013 +++ даем пересчитать стоимость присоединения....
             // DisableControls([spbENElement]);
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
             // SUPP-9041... 15.11.2013 +++ даем пересчитать стоимость присоединения....
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
             // SUPP-9041... 15.11.2013 +++ даем пересчитать стоимость присоединения....
             // DisableControls([spbENElement]);
             isNotCalculated := True;
           end;

         finally
           eFilter.Free;
         end;
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

      cbBaseStation.Checked := (ENTechConditionsServicesObj.baseStation =
        ENTECHCONDITIONS_BASESTATION_YES);

      cbSmallArchFrm.Checked := (ENTechConditionsServicesObj.smallArchFrm =
        ENTECHCONDITIONS_SMALLARCHFRM_YES);

      chbIsSea.Checked := (ENTechConditionsServicesObj.isSea = 1);

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
    MakeMultiline(edtCommentServicesGen.Lines, ENTechConditionsServicesObj.commentServicesGen);


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



     if  ENTechConditionsServicesObj.warrantRef.code <> LOW_INT then
    begin
      warrant := DMReports.getWarrantByCode(ENTechConditionsServicesObj.warrantRef.code);

      edtWarrantNumber.Text := warrant.numbergen;
      edtWarrantFIO.Text := warrant.warrantFIO;
      edtWarrantPosition.Text := warrant.warrantPosition;
      MakeMultiline(edtWarrantName.Lines, warrant.name);
      edtPower.Text := IntToStr(warrant.power);
      edtMaxSum.Text := warrant.maxSum.DecimalString;
    end;


    if ( ENTechConditionsServicesObj.tySummaGen <> nil ) then
       edttysummagen.Text := ENTechConditionsServicesObj.tySummaGen.decimalString
    else
       edttysummagen.Text:= '';
    if ( ENTechConditionsServicesObj.tySummaVat<> nil ) then
       edttysummavat.Text := ENTechConditionsServicesObj.tySummaVat.decimalString
    else
       edttysummavat.Text:= '';

    if ENTechConditionsServicesObj.cnPackCode <> LOW_INT then
    begin
      //edtCNPackCode.Text := IntToStr(ENTechConditionsServicesObj.cnPackCode);
      //edtCNPackCode.Text := IntToStr(ENTechConditionsServicesObj.cnPackCode) + ' (' + ENTechConditionsServicesObj.cnSubsystemName + ')';
      edtCNPackCode.Text := IntToStr(ENTechConditionsServicesObj.cnPackCode);
    end;

    edtENDepartmentDepartmentName.Text := ENTechConditionsServicesObj.department.name;

    /////
    edtFinContractNumber.Text := ENTechConditionsServicesObj.finContractNumber;
    if ENTechConditionsServicesObj.finContractDate <> nil then
    begin
      edtFinContractDate.DateTime := EncodeDate(ENTechConditionsServicesObj.finContractDate.Year,
                                                ENTechConditionsServicesObj.finContractDate.Month,
                                                ENTechConditionsServicesObj.finContractDate.Day);
      edtFinContractDate.Checked := true;
    end
    else
    begin
      edtFinContractDate.DateTime := SysUtils.Date;
      edtFinContractDate.Checked := false;
    end;

    MakeMultiline(edtFinCommentGen.Lines, ENTechConditionsServicesObj.finCommentGen);
    /////

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

    if ENTechConditionsServicesObj.contragentTypeRef <> nil then
      if ENTechConditionsServicesObj.contragentTypeRef.code <> LOW_INT then
        rgContragentType.ItemIndex := ENTechConditionsServicesObj.contragentTypeRef.code - 1;

    actUpdateContragentExecute(Sender);
  end;

  if (DialogState = dsInsert) then
  begin
    cbbENTechContragentFormContragentFormName.ItemIndex:= 0;

    // скрываем вкладки
    for i := 0 to pcTechConditionServices.PageCount - 1 do
       if (pcTechConditionServices.Pages[i] <> tsMain) then
         pcTechConditionServices.Pages[i].TabVisible := false;

    HideControls([btnPrintContract, gbContragents, btnPrintBill]);

    edtTyServicesSumma.Text := '0.00';
    edtContractNumber.Text := 'AUTO';
  end;

    pcTechConditionServices.ActivePage := tsMain;
    pc1.ActivePage := ts1;
    TBItem1.Action :=  actViewActHoz;


end;



procedure TfrmENTechConditionsServicesEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTechConditionsServices: ENTechConditionsServicesControllerSoapPort;
    contragentsCount: Integer;
    ENTechCondResponsiblesObj: ENTechCondResponsibles;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtContractNumber   
      //edtTechConditionsNumber   ,
      , edtContractDate
      //, edtContractDateFinal //SUPP-2609
      //edtContragentName
      , edtENDepartmentDepartmentName
      , edtTyServicesPower
      , edtCNPackCode
      //, edtExecutionTerm
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
      Exit;
  end
  else

  begin

    if (not edtContractDateFinal.Checked)
    and (ENTechConditionsServicesObj.connectionKindRef.code
      <> ENCONNECTIONKIND_GENERAL_CONNECTION)
    then //SUPP-2609
    begin
      Application.MessageBox(PChar('Введіть кінцеву дату дії договору!'), PChar('Увага!'), MB_ICONWARNING);
      edtContractDateFinal.SetFocus;
      Action := caNone;
      Exit;
    end;

    if ((ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION)
         and (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART)) then
         // SUPP-1240... +++ для строй.площадок - оставить выбор тарифа, сумма при этом нулевая..
         // and (not cbBuildersArea.Checked) ) then
    begin

      if not NoBlankValues([edtConnectionTariffName, edtConnectionTariffValue])  then
      begin
        Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
        Action := caNone;
        Exit;
      end
    end;

    if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART) then
      if (edtExecutionTerm.Text = '') then
      begin
        Application.MessageBox(PChar('Введіть термін виконання договору!'), PChar('Увага !'), MB_ICONWARNING);
        edtExecutionTerm.SetFocus;
        Action := caNone;
        Exit;
      end;

    if rgContragentType.ItemIndex = -1 then
    begin
      Application.MessageBox(PChar('Оберіть тип контрагента!'),
                             PChar('Увага!'), MB_ICONWARNING);
      Action := caNone;
      Exit;
    end;

    if (DialogState = dsEdit) then
    begin
      ///// Если договор индивидуальный, то добавлять больше одного контрагента нельзя
      if (cbbENTechContragentFormContragentFormName.ItemIndex + 1 = ENTECHCONDITIONSSERVICES_FORM_INDIVIDUAL) then
      begin
        contragentsCount := getContragentsCount(ENTechConditionsServicesObj.code);

        if contragentsCount > 1 then
        begin
          Application.MessageBox(PChar('В індивідуальних договорах може бути лише один замовник! Змініть вид договора на "Солідарний"!'),
                                 PChar('Увага!'), MB_ICONWARNING);
          Action := caNone;
          Exit;
        end;
      end;
      /////
    end;

     TempENTechConditionsServices := HTTPRIOENTechConditionsServices as ENTechConditionsServicesControllerSoapPort;

     if (cbBuildersArea.Checked) then
       ENTechConditionsServicesObj.buildersArea := ENTECHCONDITIONS_BUILDERSAREA_YES
     else ENTechConditionsServicesObj.buildersArea := ENTECHCONDITIONS_BUILDERSAREA_NO;

     if (cbBaseStation.Checked) then
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


     ENTechConditionsServicesObj.contractNumber := edtContractNumber.Text;

     if edtcontractDate.checked then
     begin
       if ENTechConditionsServicesObj.contractDate = nil then
          ENTechConditionsServicesObj.contractDate := TXSDate.Create;
       ENTechConditionsServicesObj.contractDate.XSToNative(GetXSDate(edtcontractDate.DateTime));
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
    ENTechConditionsServicesObj.contragentTypeRef.code := rgContragentType.ItemIndex + 1;    

    ///// 23.03.12 Пытаемся определить ответственное лицо по мощности и подразделению в договоре
    // 17.07.12 NET-2498
    //ENTechCondResponsiblesObj := TempENTechConditionsServices.getResponsiblePerson(ENTechConditionsServicesObj.tyServicesPower,
    //                                                                               ENTechConditionsServicesObj.department.code);
    ENTechCondResponsiblesObj := TempENTechConditionsServices.getResponsiblePerson(ENTechConditionsServicesObj);
    if ENTechCondResponsiblesObj = nil then
    begin
      Application.MessageBox(PChar('За вказаними Вами потужністю та підрозділом неможливо визначити відповідальну особу!'),
                             PChar('Увага!'), MB_ICONWARNING);
      Action := caNone;
      Exit;
    end;

    if ENTechCondResponsiblesObj.code = LOW_INT then
    begin
      Application.MessageBox(PChar('За вказаними Вами потужністю та підрозділом неможливо визначити відповідальну особу!'),
                             PChar('Увага!'), MB_ICONWARNING);
      Action := caNone;
      Exit;
    end;

    ENTechConditionsServicesObj.techCondResponsiblesRef := ENTechCondResponsiblesRef.Create;
    ENTechConditionsServicesObj.techCondResponsiblesRef.code := ENTechCondResponsiblesObj.code;
    edtResponsiblePerson.Text := ENTechCondResponsiblesObj.responsibleFIO;
    /////

    ENTechConditionsServicesObj.isSea := Ord(chbIsSea.Checked);

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
  end;

   ENPriconnectionDataObj := nil;
end;


procedure TfrmENTechConditionsServicesEdit.spbTechConditionsClick(
  Sender: TObject);
var
  frmENTechConditionsObjectsShow: TfrmENTechConditionsObjectsShow;
  TempENTechConditionsObjects: ENTechConditionsObjectsControllerSoapPort;

  tcFilter : ENTechConditionsObjectsFilter;
  TUObject : ENTechConditionsObjects;

begin
  { inherited;

     frmENTechConditionsObjectsShow := TfrmENTechConditionsObjectsShow.Create(Application, fmNormal);
     try
        with frmENTechConditionsObjectsShow do
        if ShowModal = mrOk then
        begin
         edtTechConditionsNumber.Text := GetReturnValue(sgENTechConditionsObjects, 1);
         edtTechConditionsDate.DateTime := StrToDateTime( GetReturnValue( sgENTechConditionsObjects, 2));
         ENTechConditionsServicesObj.techCondObjectsRef := ENTechConditionsObjectsRef.Create;
         ENTechConditionsServicesObj.techCondObjectsRef.code := StrToInt( GetReturnValue( sgENTechConditionsObjects, 0));

         MakeMultiline(edtContragentAddressWork.Lines, GetReturnValue( sgENTechConditionsObjects, 5));

//         ENTechConditionsServicesObj.contragentName:=  GetReturnValue( sgENTechConditionsObjects, 3);
//         edtContragentName.Text := GetReturnValue( sgENTechConditionsObjects, 3);


            TempENTechConditionsObjects := HTTPRIOENTUObject as ENTechConditionsObjectsControllerSoapPort;

            TUObject := TempENTechConditionsObjects.getObject(ENTechConditionsServicesObj.techCondObjectsRef.code);
            if TUObject <> nil then
            begin
               ENTechConditionsServicesObj.department := ENDepartment.Create();
               ENTechConditionsServicesObj.department.code := TUObject.department.code;
             end;




        end;

     finally
     frmENTechConditionsObjectsShow.Free;
     end;  }


end;

procedure TfrmENTechConditionsServicesEdit.spbWarrantNumberClick(
  Sender: TObject);
var frmENWarrantShow : TfrmENWarrantShow;
    f : ENWarrantFilter;
    warrant : ENWarrant;
    datContract, datWarrant : TXSDate;
    dtdatContract, dtdatWarrant : TDateTime;
    power: Double;
begin
  power := 0;
  try
    power := StrToFloat(edtTyServicesPower.Text);
  except
    on EConvertError do power := 0;
  end;

  if power = 0 then
  begin
    Application.MessageBox(PChar('Спочатку введіть потужність за договором!'), PChar('Увага !'), MB_ICONWARNING);
    edtTyServicesPower.SetFocus;
    Exit;
  end;

  if power <= 5 then
  begin
    if ENTechConditionsServicesObj.department = nil then
    begin
      Application.MessageBox(PChar('Спочатку оберіть підрозділ!'), PChar('Увага !'), MB_ICONWARNING);
      edtENDepartmentDepartmentName.SetFocus;
      Exit;
    end;

    if ENTechConditionsServicesObj.department.code = LOW_INT then
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
     f.departmentRef.code := ENTechConditionsServicesObj.department.code;

     // Все юр. лица ХГЭС, независимо от мощности - договора проходят через Облэнерго!!!
     if (rgContragentType.ItemIndex + 1 = ENTECHCONTRAGENT_TYPE_JURIDICAL) and
        (ENTechConditionsServicesObj.department.code = ENDEPARTMENT_HGES) then
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

               ENTechConditionsServicesObj.warrantRef := ENWarrantRef.Create();
               ENTechConditionsServicesObj.warrantRef.code := StrToInt(GetReturnValue(sgENWarrant,0));

                //////////////////////////////////////////////////////
                ///   проверка даты доверенности с датой договора  ///
                ///     суммы в доверенности с суммой договора     ///
                //////////////////////////////////////////////////////

                if  ENTechConditionsServicesObj.warrantRef.code <> LOW_INT then
                begin
                  warrant := DMReports.getWarrantByCode(ENTechConditionsServicesObj.warrantRef.code);

                  datContract.XSToNative(GetXSDate(frmENTechConditionsServicesEdit.edtContractDate.DateTime));
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
                      ENTechConditionsServicesObj.warrantRef.code := LOW_INT;
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
                      ENTechConditionsServicesObj.warrantRef.code := LOW_INT;
                    Exit;
                  end;



                  if (edtTyServicesPower.Text <> '') then
                  begin
                    if (StrToFloat(edtTyServicesPower.Text) > warrant.power) then
                    begin
                      Application.MessageBox(PChar('Потужність у договорі перевищує суму у довіреності!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                        edtWarrantNumber.Text := '';
                        edtWarrantFIO.Text := '';
                        edtWarrantPosition.Text := '';
                        edtWarrantName.Text := '';
                        edtPower.Text := '';
                        edtMaxSum.Text := '';
                        ENTechConditionsServicesObj.warrantRef.code := LOW_INT;
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
end;


procedure TfrmENTechConditionsServicesEdit.actInsertPlanExecute(
  Sender: TObject);
Var TempEnPlanwork: ENPlanWorkControllerSoapPort;
    y, m, d: Word;
    TempENTechConditionsServices: ENTechConditionsServicesControllerSoapPort;
    tcFilter: ENTechConditionsServicesFilter;
    tcList: ENTechConditionsServicesShortList;
begin
  if DialogState = dsInsert then Exit;

  if ENTechConditionsServicesObj.code = LOW_INT then Exit;

  if getContragentsCount(ENTechConditionsServicesObj.code) = 0 then
  begin
    Application.MessageBox(PChar('Спочатку потрібно ввести Замовників!'),
                           PChar('Увага!'), MB_ICONWARNING);
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
    frmENPlanWorkEdit.ENPlanWorkObj.dateStart.XSToNative(GetXSDate(EncodeDate(ENTechConditionsServicesObj.contractDate.Year, ENTechConditionsServicesObj.contractDate.Month, 1)));

    frmENPlanWorkEdit.ENPlanWorkObj.departmentRef := ENDepartmentRef.Create;
    frmENPlanWorkEdit.ENPlanWorkObj.departmentRef.code := ENTechConditionsServicesObj.department.code;
    frmENPlanWorkEdit.edtDepartment.Text := ENTechConditionsServicesObj.department.name;

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
    frmENPlanWorkEdit.ENPlanWorkObj.priConnectionNumber := ENTechConditionsServicesObj.contractNumber;
    frmENPlanWorkEdit.edtPriConnectionNumber.Text := ENTechConditionsServicesObj.contractNumber;
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
       frmENPlanWorkEdit.ENPlanWorkObj.commentGen := '№' + tcList.list[0].contractNumber +
                                                     ' від ' + XSDate2String(tcList.list[0].contractDate) + ' р.' +
                                                     ' (' + tcList.list[0].contragentName + ')';
       frmENPlanWorkEdit.edtCommentGen.Text := frmENPlanWorkEdit.ENPlanWorkObj.commentGen;
    end;
    /////

    if frmENPlanWorkEdit.ShowModal = mrOk then
    begin
      actUpdatePlanExecute(Sender);
    end;

    

  finally
  end;
end;


procedure TfrmENTechConditionsServicesEdit.actLinkWithPlanExecute(
  Sender: TObject);
Var
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  planFilter : ENPlanWorkFilter;
  plan : ENPlanWork;
begin
  inherited;
  // 	SUPP-49492
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

      actUpdatePlanExecute(sender);
      end;
    finally
      frmENPlanWorkShow.Free;
      frmENPlanWorkShow:=nil;
    end;
end;

procedure TfrmENTechConditionsServicesEdit.actPrintKoshtorisExecute(
  Sender: TObject);
var argNames, args: ArrayOfString;
   reportName: String;
   Licensed : Integer;

   TempENPlanWork2ClassificationType : ENPlanWork2ClassificationTypeControllerSoapPort;
   plan2ctFilter : ENPlanWork2ClassificationTypeFilter;
   ENPlanWork2ClassificationTypeList : ENPlanWork2ClassificationTypeShortList;
   ENPlanWork2ClassificationTypeCode : Integer;
   pw2ctObj : ENPlanWork2ClassificationType;

   TempTKClassificationType : TKClassificationTypeControllerSoapPort;
   TKClassificationTypeList : TKClassificationTypeShortList;
   TKClassificationTypef : TKClassificationTypeFilter;

begin
  inherited;
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
  // 20.09.2013 +++ для присоединений не то пальто....  ;)
  // args[0] := IntToStr(DMReports.getPlanCodeForCalculationByElement(ENServicesObjectObj.element.code));
  begin
    if (pw2ctObj = nil) then Exit;
    args[0] := IntToStr(pw2ctObj.planRef.code);
  end;

  if Licensed = ISNOTLICENSEDACTIVITY_NKRE  then  // лицензированые работы НКРЕ
     reportName := '201109/ActCalculationByTechCondition/ActCalcOnlyRemainingcost'
  else if Licensed = ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT  then
     reportName := '201109/ActCalcAdditionalWorkG/ActCalc_notlicensed/ActCalc_trt_ntlcd_f6'
  else if ( (Licensed <> ISNOTLICENSEDACTIVITY_NKRE) and (Licensed <> ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT) ) then
     reportName := '201109/ActCalcAdditionalWorkG/ActCalcOnlyRemainingcost';

  makeReport(reportName , argNames , args , 'xls');
end;


procedure TfrmENTechConditionsServicesEdit.actUpdatePlanExecute(
  Sender: TObject);
  var
  TempENTechConditionsServices : ENTechConditionsServicesControllerSoapPort;
  TempENplan : ENPlanWorkControllerSoapPort;
  ENPlanWorkList: ENPlanWorkShortList;
  n , LastCount , i : Integer;
  planFilter: ENPlanWorkFilter;
begin
 // inherited;

  TempENplan := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
   ClearGrid(sgENPlanWork);

    planFilter := ENPlanWorkFilter.Create;
    SetNullIntProps(planFilter);
    SetNullXSProps(planFilter);

    // planFilter.conditionSQL := ' entechconditionsservcs.code = ' + IntToStr(ENTechConditionsServicesObj.code);
   planFilter.conditionSQL := 'ENPLANWORK.CODE IN ( ' + DMReports.getStrCodePlanFromENtechCond2enplanwork(ENTechConditionsServicesObj.code)  + ')';
    ENPlanWorkList := TempENplan.getTechConditionsPlanList(planFilter, 0, -1);

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


          sgENPlanWork.RowCount := i + 2;
        end;

     sgENPlanWork.Row := 1;
end;

procedure TfrmENTechConditionsServicesEdit.pcTechConditionServicesChange(Sender: TObject);
var
  planCode, i, iColCount, iLastCount, iLastRow : Integer;
  vNormOfTime, vCountGen : Double;
  TempENPlanWork2ClassificationType : ENPlanWork2ClassificationTypeControllerSoapPort;
  plan2ctFilter : ENPlanWork2ClassificationTypeFilter;
  ENPlanWork2ClassificationTypeList : ENPlanWork2ClassificationTypeShortList;
  planItemFilter : ENPlanWorkItemFilter;
  TempENPlanWorkItem : ENPlanWorkItemControllerSoapPort;
  ENPlanWorkItemList : ENPlanWorkItemShortList;
begin
 // inherited;
     if pcTechConditionServices.ActivePage = tsPlans then begin
      if ENTechConditionsServicesObj.techCondServicesType.code <> ENTECHCONDITIONSSERVICES_TYPE_REALIZATION then begin
          HideActions([actLinkWithPlan]);
          DisableActions([actLinkWithPlan]);
      end;

       actUpdatePlanExecute(sender);
        if (ENTechConditionsServicesObj.techCondServicesStatus.code = ENTECHCONDITIONSSERVICES_STATUS_DRAFT ) or
         (ENTechConditionsServicesObj.techCondServicesStatus.code = ENTECHCONDITIONSSERVICES_STATUS_SIGNED ) then
         begin
          HideActions([actInsertPlan,actUpdatePlan,actDeletePlan, actEditPlan,actClosePlan,actUnClosePlan,actFinishPlan,actUndoFinishPlan],false);
          DisableActions([actInsertPlan,actUpdatePlan,actDeletePlan, actEditPlan,actClosePlan,actUnClosePlan,actFinishPlan,actUndoFinishPlan],false);
         end
        else
         begin
          HideActions([actInsertPlan,actUpdatePlan,actDeletePlan, actEditPlan,actClosePlan,actUnClosePlan,actFinishPlan,actUndoFinishPlan],True);
          DisableActions([actInsertPlan,actUpdatePlan,actDeletePlan, actEditPlan,actClosePlan,actUnClosePlan,actFinishPlan,actUndoFinishPlan],True);
         end;

      end;

      if pcTechConditionServices.ActivePage = tsActs then
      begin
       actUpdateIncomeExecute(sender);
       actUpdateActHozExecute(sender);
       actUpdateServicesFromSideExecute(sender);

       if ENTechConditionsServicesObj.techCondServicesStatus.code = ENTECHCONDITIONSSERVICES_STATUS_COMPLETED then
       begin
        HideActions([actInsertIncome, actDeleteIncome ,actEditIncome],True);
        DisableActions([actInsertIncome, actDeleteIncome ,actEditIncome],True);
       end;

      end;

      if (pcTechConditionServices.ActivePage = tsListWork) then
      begin
        ClearGrid(sgENPlanWork2ClassificationType);

        if planCode = LOW_INT then Exit;

        TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;

        plan2ctFilter := ENPlanWork2ClassificationTypeFilter.Create;
        SetNullIntProps(plan2ctFilter);
        SetNullXSProps(plan2ctFilter);

        plan2ctFilter.conditionSQL := 'planrefcode in (select p.code from enplanwork p where p.elementrefcode = ' +
            IntToStr(ENTechConditionsServicesObj.element.code) + ' and p.kindcode = ' + IntToStr(ENPLANWORKKIND_CALCULATION) + ')';

        ENPlanWork2ClassificationTypeList := TempENPlanWork2ClassificationType.getScrollableFilteredList(plan2ctFilter, 0, -1);

        LastCount := High(ENPlanWork2ClassificationTypeList.list);

        if LastCount > -1 then
          begin
           sgENPlanWork2ClassificationType.RowCount := LastCount+2;
              ////////////////////////////////////////////////////////////////////////////
              // проверяем калькуляции в договоре (если такие что резервируется под них время то отображаем поля и показываем свободное время на день )
               if ENPlanWork2ClassificationTypeList.list[i].isJobsByTime = 1  then
                 // updateRezervedView();
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

        iColCount:=-1;

        if planItemFilter = nil then
        begin
           planItemFilter := ENPlanWorkItemFilter.Create;
           SetNullIntProps(planItemFilter);
           SetNullXSProps(planItemFilter);
        end;

        planItemFilter.conditionSQL := 'planrefcode in (select p.code from enplanwork p where p.elementrefcode = ' +
           IntToStr(ENTechConditionsServicesObj.element.code) + ' and p.kindcode = ' + IntToStr(ENPLANWORKKIND_CALCULATION) + ')';

        planItemFilter.orderBySQL := ' enplanworkitem.kartarefcode';

        TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
        try
          ENPlanWorkItemList := TempENPlanWorkItem.getScrollableFilteredList(planItemFilter,0,-1);
        except
          on E: Exception do ShowMessage (E.Message);
        end;

        iLastCount := High(ENPlanWorkItemList.list);

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
      end;

end;


procedure TfrmENTechConditionsServicesEdit.actEditPlanExecute(
  Sender: TObject);

 Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    tPlan : ENPlanWork;
    ObjCode: Integer;
begin
  try
    ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  tPlan := DMReports.getPlanByCode(ObjCode);

  if tPlan = nil then
  begin
    Exit;
  end;

  //ShowMessage( ENPlanWorkShort(sgENPlanWork.Objects[0,sgENPlanWork.Row]).statusName );
  //if  Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) <> ENPLANWORKSTATUS_GOOD then


  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

if (tPlan.status.code = ENPLANWORKSTATUS_PRECONFIRMED)  then
begin
  try
      TempENPlanWork.editPreConfirm(tPlan.code);
  except
      Application.MessageBox(PChar('Цей план можуть коригувати тільки у ХОЕ !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;
end;

  if not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION, ENPLANWORKSTATUS_PRECONFIRMED])


  then
  begin
      Application.MessageBox(PChar('План затверджений !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;

  

  frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsEdit);

  try

     try
       frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
     except
     on EConvertError do Exit;
    end;
     // переменные для договоров ТУ 
     frmENPlanWorkEdit.isTechConditions := True;
     frmENPlanWorkEdit.techCondServicesType := ENTechConditionsServicesObj.techCondServicesType.code;

    if frmENPlanWorkEdit.ShowModal= mrOk then
      begin
        

              actUpdatePlanExecute(Sender);

      end;



  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit:=nil;
  end;

end;

procedure TfrmENTechConditionsServicesEdit.actViewPlanExecute(
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

procedure TfrmENTechConditionsServicesEdit.actDeletePlanExecute(
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

      actUpdatePlanExecute(Sender);



  end;

end;

procedure TfrmENTechConditionsServicesEdit.actClosePlanExecute(
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
        actUpdatePlanExecute(Sender);

  end;


end;

procedure TfrmENTechConditionsServicesEdit.actUnClosePlanExecute(
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
    actUpdatePlanExecute(Sender);
  end;
  
end;

procedure TfrmENTechConditionsServicesEdit.actFinishPlanExecute(
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
    actUpdatePlanExecute(Sender);
  end;
end;

procedure TfrmENTechConditionsServicesEdit.actUndoFinishPlanExecute(
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
    actUpdatePlanExecute(Sender);
  end;
end;

procedure TfrmENTechConditionsServicesEdit.pmPlansPopup(Sender: TObject);
var
  plan : ENPlanWork;
  ObjCode : Integer;
begin
  DisableActions([actClosePlan, actUnClosePlan{, actConfirm, actPreConfirm}], False);
  HideActions([actClosePlan, actUnClosePlan{, actConfirm, actPreConfirm}], False);

  try
    ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  plan := DMReports.getPlanByCode(ObjCode);
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


  // planUnclose ...
  actUnClosePlan.Enabled := (
                          (plan.kind.code = ENPLANWORKKIND_NPZ) or (plan.kind.code = ENPLANWORKKIND_FACT)
                        // для 2011 года можно удалять .. ПОКА .. до создания ЗАЯВКИ!!!!
                         or ((plan.kind.code = ENPLANWORKKIND_CURRENT) and (plan.yearGen = 2011))

                         )
                        and (plan.status.code = ENPLANWORKSTATUS_GOOD) ;

   // отмена утвержденных без Актов .... на сервере чекним есть ли акт ;)
   if  (plan.status.code = ENPLANWORKSTATUS_LOCKED) and (plan.kind.code = ENPLANWORKKIND_FACT) then
   begin
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

procedure TfrmENTechConditionsServicesEdit.btnPrintContractClick(
  Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName, reportPath: String;
  //sumPeredplata : Double;
  contractDate, date_20131025: TDate;
  isAfter_20131025: Boolean;
begin
  {
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'agreeCode';
  args[0] := IntToStr(ENTechConditionsServicesObj.code);

  sumPeredplata:= 0;
  if ENTechConditionsServicesObj.tyServicesSumma <> nil then
    sumPeredplata:= StrToFloat(ENTechConditionsServicesObj.tyServicesSumma.DecimalString);

  if ( ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_PROJECT ) and
    ( sumPeredplata <> 0 ) then
  reportName := 'TechConditions/agree_project_providing'
  else if ( ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_PROJECT ) and
    (sumPeredplata = 0 )  then
  reportName := 'TechConditions/agree_project_providing_not_prepay'
  else if ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION  then
  reportName := 'TechConditions/agree_building_providing';

  makeReport(reportName, argNames, args, 'pdf');

  reportName := 'TechConditions/contractPrice';
  makeReport(reportName, argNames, args, 'pdf');  // договорная цена
  }

  /////////////////
  if ENTechConditionsServicesObj.code = LOW_INT then Exit;

  if (ENTechConditionsServicesObj.connectionKindRef.code <>
    ENCONNECTIONKIND_GENERAL_CONNECTION)
  //and (not edtContractDateFinal.Checked) then //SUPP-2609
  and (ENTechConditionsServicesObj.contractDateFinal = nil) then
    begin
      Application.MessageBox(PChar('Не заповнена кінцева дата дії договору.'),
        PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;

  if getContragentsCount(ENTechConditionsServicesObj.code) = 0 then
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

  ///// 04.11.13 SUPP-8674
  contractDate := EncodeDate(
    ENTechConditionsServicesObj.contractDate.Year,
    ENTechConditionsServicesObj.contractDate.Month,
    ENTechConditionsServicesObj.contractDate.Day);

  // Согласно Приказу №740 от 25.10.2013
  // (начиная с этой даты, печатаем новую форму договору)
  date_20131025 := EncodeDate(2013, 10, 25);

  isAfter_20131025 := (contractDate >= date_20131025);

  reportPath := 'TechConditions/';
  if isAfter_20131025 then
    reportPath := 'TechConditions/Agree_20131025/';
  /////

  if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART) then
    reportName := 'TechConditions/agree_standart_connection'

  //NET-4223
  else if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_NO_STANDART) then
    reportName := 'TechConditions/agree_no_standart_connection'

  ///// 04.11.13 SUPP-8674
  {
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
  }
  else if (ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_PROJECT)
        and (ENTechConditionsServicesObj.contragentForm.code = ENTECHCONDITIONSSERVICES_FORM_SOLIDARITY) then
    reportName := reportPath + 'solidary_agree_project_providing'
  else if (ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION)
        and (ENTechConditionsServicesObj.contragentForm.code = ENTECHCONDITIONSSERVICES_FORM_SOLIDARITY) then
    reportName := reportPath + 'solidary_agree_building_providing'

  else if ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_PROJECT then
    reportName := reportPath + 'agree_project_providing'
  else if ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION then
    reportName := reportPath + 'agree_building_providing';
  /////

  makeReport(reportName, argNames, args, 'pdf');

{
  // 05.04.12 Додаток № 1 теперь печатать не надо  
  reportName := 'TechConditions/contractPrice';
  makeReport(reportName, argNames, args, 'pdf');  // договорная цена
}
end;

procedure TfrmENTechConditionsServicesEdit.actViewIncomeExecute(Sender: TObject);
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
    frmENActIncomeTechConditionsEdit := nil;
  end;
end;

procedure TfrmENTechConditionsServicesEdit.actUpdateIncomeExecute(
  Sender: TObject);
  Var TempENActIncomeTechConditions: ENActIncomeTechConditionsControllerSoapPort;
   ENActIncomeFilter :  ENActIncomeTechConditionsFilter;
   ENActIncomeTechConditionsList: ENActIncomeTechConditionsShortList;
   i, LastCount: Integer;
begin

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

procedure TfrmENTechConditionsServicesEdit.actInsertIncomeExecute(
  Sender: TObject);
begin
  frmENActIncomeTechConditionsEdit := TfrmENActIncomeTechConditionsEdit.Create(Application, dsInsert);
  try
    frmENActIncomeTechConditionsEdit.ENActIncomeTechConditionsObj := ENActIncomeTechConditions.Create;
    frmENActIncomeTechConditionsEdit.EnTechConditionsServicesCode := ENTechConditionsServicesObj.code;

    if frmENActIncomeTechConditionsEdit.ShowModal = mrOk then
    begin
      if frmENActIncomeTechConditionsEdit.ENActIncomeTechConditionsObj <> nil then
        actUpdateIncomeExecute(Sender);
    end;
  finally
    frmENActIncomeTechConditionsEdit.Free;
    frmENActIncomeTechConditionsEdit := nil;
  end;
end;

procedure TfrmENTechConditionsServicesEdit.actDeleteIncomeExecute(
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



procedure TfrmENTechConditionsServicesEdit.actEditIncomeExecute(
  Sender: TObject);
Var
  TempENActIncomeTechConditions: ENActIncomeTechConditionsControllerSoapPort;
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

    if frmENActIncomeTechConditionsEdit.ShowModal = mrOk then
    begin
      actUpdateIncomeExecute(Sender);
    end;
  finally
    frmENActIncomeTechConditionsEdit.Free;
    frmENActIncomeTechConditionsEdit := nil;
  end;
end;

procedure TfrmENTechConditionsServicesEdit.actUpdateActHozExecute(
  Sender: TObject);
var
  TempENAct: ENActControllerSoapPort;
  actFilter: ENActFilter;
  ENActList: ENActShortList;
  actDate: String;
  LastCount  , i : integer;
begin
   ClearGrid(sgENAct);
   TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

   actFilter := ENActFilter.Create;
    SetNullIntProps(actFilter);
    SetNullXSProps(actFilter);

    actFilter.conditionSQL :=  ' code in ( select a.code from enact a where a.code in ( ' +
			       '	 select a2pl.actrefcode from enact2enplanwork a2pl  ' +
			       '	 where a2pl.plancode in ( ' +
			       '	  select ct2pl.planrefcode from entechcond2planwork ct2pl ' +
			       '	   where ct2pl.techconservicesrefcode = '  + IntToStr(ENTechConditionsServicesObj.code)  + ' ) ) ' +
                               '          and a.code not in (select ff.actcode from rqfkorder2planfact ff )) ' ;


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

procedure TfrmENTechConditionsServicesEdit.actUpdateServicesFromSideExecute(
  Sender: TObject);
 var
  TempRQFKOrder: RQFKOrderControllerSoapPort;
  i, LastCount, LastRow: Integer;
  RQFKOrderList: RQFKOrderShortList;
  FKOrderFilter : RQFKOrderFilter;
begin
  inherited;
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

     TempRQFKOrder :=  HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

     FKOrderFilter := RQFKOrderFilter.Create;
     SetNullIntProps(FKOrderFilter);
     SetNullXSProps(FKOrderFilter);

     FKOrderFilter.kind := RQFKOrderKind.Create;
     FKOrderFilter.kind.code := RQFKORDER_KIND_SERVICES_FROM_SIDE;
     FKOrderFilter.conditionSQL := ' code in ( select rf2pl.fkordercode from rqfkorder2planfact rf2pl ' +
                                   ' where rf2pl.plancode in ( ' +
                                   ' select ct2pl.planrefcode from entechcond2planwork ct2pl ' +
				   ' where ct2pl.techconservicesrefcode = ' + IntToStr(ENTechConditionsServicesObj.code) + ' ) ) ' ;


     RQFKOrderList := TempRQFKOrder.getScrollableFilteredList(RQFKOrderFilter(FKOrderFilter),0,-1);

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

procedure TfrmENTechConditionsServicesEdit.actViewActHozExecute(
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
       actUpdateActHozExecute(Sender);
     end;
   finally
     frmENActEdit.Free;
     frmENActEdit:=nil;
   end;
end;

procedure TfrmENTechConditionsServicesEdit.actViewActFromSideExecute(
  Sender: TObject);
Var TempRQFKOrder: RQFKOrderControllerSoapPort;
begin
  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  frmRQFKOrderEdit:=TfrmRQFKOrderEdit.Create(Application, dsView);

  try
    try
      frmRQFKOrderEdit.RQFKOrderObj := TempRQFKOrder.getObject(StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]));
    except
      on EConvertError do Exit;
    end;

    if (frmRQFKOrderEdit.ShowModal = mrOk)
          and (frmRQFKOrderEdit.RQFKOrderObj.kind.code = RQFKORDER_KIND_SERVICES_FROM_SIDE) then
      begin
        actUpdateServicesFromSideExecute(Sender);
      end;

  finally
    frmRQFKOrderEdit.Free;
    frmRQFKOrderEdit:=nil;
  end;
end;

procedure TfrmENTechConditionsServicesEdit.pc1Change(Sender: TObject);
begin
  inherited;
  if pc1.ActivePage = ts1 then
   begin
     TBItem1.Action:= actViewActHoz;
     actUpdateActHozExecute(Sender);
   end;

   if pc1.ActivePage = ts2 then
   begin
     TBItem1.Action := actViewActFromSide;
     actUpdateServicesFromSideExecute(Sender);
   end;
end;

procedure TfrmENTechConditionsServicesEdit.actViewContragentExecute(
  Sender: TObject);
Var TempENContragent: ENContragentControllerSoapPort;
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

procedure TfrmENTechConditionsServicesEdit.actUpdateContragentExecute(
  Sender: TObject);
var
  TempENContragent: ENContragentControllerSoapPort;
  i, LastCount: Integer;
  ENContragentList: ENContragentShortList;
  ENContragentFilt : ENContragentFilter;
begin
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
        LastRow:=i+1;
        sgENContragent.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENContragent.Row:=1;

end;


procedure TfrmENTechConditionsServicesEdit.actInsertCalculationExecute(Sender: TObject);
var
  planCode : Integer;
  TempENPlanWorkItem : ENPlanWorkItemControllerSoapPort;
  TempENPlanWork2ClassificationType : ENPlanWork2ClassificationTypeControllerSoapPort;
  TempENEstimateItem : ENEstimateItemControllerSoapPort;
  plan2ctFilter : ENPlanWork2ClassificationTypeFilter;
  ENPlanWork2ClassificationTypeList : ENPlanWork2ClassificationTypeShortList;
begin
  if not NoBlankValues([edtContractServicesDistance]) then
  begin
    Application.MessageBox(PChar('Введіть відстань для розрахунку транспортних витрат (якщо транспорт не потрібний, введіть 0)!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  ENPlanWork2ClassificationTypeObj := ENPlanWork2ClassificationType.Create;
  ENPlanWork2ClassificationTypeObj.planRef := ENPlanWorkRef.Create;
  ENPlanWork2ClassificationTypeObj.planRef.code := LOW_INT;

  try
    frmENPlanWork2ClassificationTypeEdit := TfrmENPlanWork2ClassificationTypeEdit.Create(Application, dsInsert);
    frmENPlanWork2ClassificationTypeEdit.priconnections := True;
    frmENPlanWork2ClassificationTypeEdit.isTechCondition := True;
    frmENPlanWork2ClassificationTypeEdit.tcsCode := ENTechConditionsServicesObj.code;

    try
      ENPlanWork2ClassificationTypeObj.planRef.code := planCode;

      frmENPlanWork2ClassificationTypeEdit.distance := TXSDecimal.Create;
      frmENPlanWork2ClassificationTypeEdit.distance.DecimalString := edtContractServicesDistance.Text;
      frmENPlanWork2ClassificationTypeEdit.codeDepartmentForServicesObject := ENTechConditionsServicesObj.department.code;

      if frmENPlanWork2ClassificationTypeEdit.ShowModal = mrOk then
      begin
        if ENPlanWork2ClassificationTypeObj <> nil then
        begin
          if (planCode = LOW_INT) then
          begin
            TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;
            ENPlanWork2ClassificationTypeObj := TempENPlanWork2ClassificationType.getObject(ENPlanWork2ClassificationTypeObj.code);
            planCode := ENPlanWork2ClassificationTypeObj.planRef.code;

            ///////
            Self.Caption := 'Приєднання. Договір № ' + ENTechConditionsServicesObj.contractNumber;
            ///////
          end;

          pcTechConditionServicesChange(Sender);

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



procedure TfrmENTechConditionsServicesEdit.actInsertContragentExecute(
  Sender: TObject);
var
  TempENContragent: ENContragentControllerSoapPort;
  contragentsFilter: ENContragentFilter;
  contragentsArr: ENContragentController.ArrayOfInteger;
begin
  ///// Если договор индивидуальный, то добавлять больше одного контрагента нельзя
  if (ENTechConditionsServicesObj.contragentForm.code = ENTECHCONDITIONSSERVICES_FORM_INDIVIDUAL) then
  begin
    if getContragentsCount(ENTechConditionsServicesObj.code) > 0 then
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

procedure TfrmENTechConditionsServicesEdit.actDeleteCalculationExecute(Sender: TObject);
var
  ObjCode : Integer;
  TempENPlanWorkItem : ENPlanWorkItemControllerSoapPort;
  TempENPlanWork2ClassificationType : ENPlanWork2ClassificationTypeControllerSoapPort;
  plan2ctFilter : ENPlanWork2ClassificationTypeFilter;
  ENPlanWork2ClassificationTypeList : ENPlanWork2ClassificationTypeShortList;
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  plan : ENPlanWork;
  ENPlanWorkList : ENPlanWorkShortList;
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

  TempENPlanWorkItem.removePlanWorkItemsByClassificationTypeForConnection(ObjCode);

  pcTechConditionServicesChange(Sender);

end;

procedure TfrmENTechConditionsServicesEdit.actDeleteContragentExecute(
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

procedure TfrmENTechConditionsServicesEdit.actEditCalculationExecute(
  Sender: TObject);
var
  TempENPlanWork2ClassificationType : ENPlanWork2ClassificationTypeControllerSoapPort;
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
    frmENPlanWork2ClassificationTypeEdit.priconnections := True;
    frmENPlanWork2ClassificationTypeEdit.isTechCondition := True;

    frmENPlanWork2ClassificationTypeEdit.distance := TXSDecimal.Create;
    frmENPlanWork2ClassificationTypeEdit.distance.DecimalString := edtContractServicesDistance.Text;
    frmENPlanWork2ClassificationTypeEdit.codeDepartmentForServicesObject := ENTechConditionsServicesObj.department.code;
    if frmENPlanWork2ClassificationTypeEdit.ShowModal = mrOk then
    begin
      pcTechConditionServicesChange(Sender);
    end;
  finally
    frmENPlanWork2ClassificationTypeEdit.Free;
    frmENPlanWork2ClassificationTypeEdit:=nil;
  end;

end;


procedure TfrmENTechConditionsServicesEdit.actEditContragentExecute(
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

procedure TfrmENTechConditionsServicesEdit.spbENDepartmentDepartmentClick(
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
      with frmENDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTechConditionsServicesObj.department = nil then ENTechConditionsServicesObj.department := ENDepartment.Create();
               ENTechConditionsServicesObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentName.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENTechConditionsServicesEdit.actENActIncomeTechConditionsPrintExecute(
  Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
  sumPeredplata : Double;
  actCode: Integer;
  contractDate : tDate;
begin
  try
    actCode := StrToInt(sgENActIncomeTechConditions.Cells[0, sgENActIncomeTechConditions.Row]);
  except
    on EConvertError do Exit;
  end;

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'codeAct';
  args[0] := IntToStr(actCode); //sgENActIncomeTechConditions.Cells[0, sgENActIncomeTechConditions.Row];

  ///// 04.11.13 SUPP-8674
  contractDate := EncodeDate(
    ENTechConditionsServicesObj.contractDate.Year,
    ENTechConditionsServicesObj.contractDate.Month,
    ENTechConditionsServicesObj.contractDate.Day);

  if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART)
       or (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_NO_STANDART) then
  begin
    if (ENTechConditionsServicesObj.contragentForm.code = ENTECHCONDITIONSSERVICES_FORM_SOLIDARITY) then
      reportName := 'TechConditions/Connections_20130301/ActPriPerSolidary'
    else
      reportName := 'TechConditions/Connections_20130301/ActPriPer';
  end else
  begin
    if (ENTechConditionsServicesObj.contragentForm.code = ENTECHCONDITIONSSERVICES_FORM_SOLIDARITY) then
       // Согласно Приказу №740 от 25.10.2013
       // (начиная с этой даты, печатаем новую форму договору)
       if (contractDate >= encodedate(2013, 10, 23) ) then
          reportName := 'TechConditions/Agree_20131025/ActPriPerSolidary'
       else
          reportName := 'TechConditions/ActPriPerSolidary'
    else
       if (contractDate >= encodedate(2013, 10, 23) ) then
          reportName := 'TechConditions/Agree_20131025/ActPriPer'
       else
          reportName := 'TechConditions/ActPriPer'
  end;

  makeReport(reportName, argNames, args, 'pdf');
end;

function TfrmENTechConditionsServicesEdit.getContragentsCount(techConditionsServicesCode: Integer): Integer;
var
  TempENContragent: ENContragentControllerSoapPort;
  contragentsFilter: ENContragentFilter;
  contragentsArr: ENContragentController.ArrayOfInteger;
begin
  Result := 0;

  TempENContragent := HTTPRIOENContragent as ENContragentControllerSoapPort;

  contragentsFilter := ENContragentFilter.Create;
  SetNullIntProps(contragentsFilter);
  SetNullXSProps(contragentsFilter);

  contragentsFilter.techCondServicesRef := ENTechConditionsServicesRef.Create;
  contragentsFilter.techCondServicesRef.code := techConditionsServicesCode;

  contragentsArr := TempENContragent.getScrollableFilteredCodeArray(contragentsFilter, 0, -1);

  Result := High(contragentsArr) + 1;
end;

procedure TfrmENTechConditionsServicesEdit.spbContractNumberSelectClick(
  Sender: TObject);
var
   frmFINServicesObjectShow: TfrmFINServicesObjectShow;
   f: ENServicesObjectFilter;
begin
   f := ENServicesObjectFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);

   if (edtContractNumber.Text <> '') then
     f.contractNumber := edtContractNumber.Text
   else
     f.contractNumber := '-1';

   f.conditionSQL := 'a.io_flag = ''S'' and a.agree_group_id in (' + AGREES_GROUPS_IDS + ')';

   frmFINServicesObjectShow:=TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_CUSTOMER;
   try
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin
          try
{
  "fincontractnumber" VARCHAR(150),
  "fincontractdate" DATE,
  "partnername" VARCHAR(250),
  "partnercode" VARCHAR(50),
  "findoccode" VARCHAR(50),
  "findocid" DOUBLE PRECISION,
  "fincommentgen" VARCHAR,
}
            edtFinContractNumber.Text := GetReturnValue(sgFINServicesObject, 1);
            ENTechConditionsServicesObj.finContractNumber := edtFinContractNumber.Text;

            edtFinContractDate.DateTime := StrToDate(GetReturnValue(sgFINServicesObject, 2));
            edtFinContractDate.Checked := true;
            /////
            //edtContractNumber.Text := GetReturnValue(sgFINServicesObject, 1);
            {
            if not edtContractDate.Checked then
            begin
              edtContractDate.DateTime := StrToDate(GetReturnValue(sgFINServicesObject, 2));
              edtContractDate.Checked := true;
            end;
            }
            /////
            /////
            if edtFinContractDate.Checked then
            begin
              if ENTechConditionsServicesObj.finContractDate = nil then
                ENTechConditionsServicesObj.finContractDate := TXSDate.Create;
              ENTechConditionsServicesObj.finContractDate.XSToNative(GetXSDate(edtFinContractDate.DateTime));
            end
            else
              ENTechConditionsServicesObj.finContractDate := nil;

            ENTechConditionsServicesObj.partnerName := GetReturnValue(sgFINServicesObject, 3);
            ENTechConditionsServicesObj.partnerCode := GetReturnValue(sgFINServicesObject, 4);

            ENTechConditionsServicesObj.finDocCode := GetReturnValue(sgFINServicesObject, 5);
            ENTechConditionsServicesObj.finDocID := StrToInt(GetReturnValue(sgFINServicesObject, 6));

            edtFINCommentGen.Text := GetReturnValue(sgFINServicesObject, 7);
            ENTechConditionsServicesObj.finCommentGen := edtFinCommentGen.Text;
            /////

                //if (edtContragentName.Text = '') then
                //   edtContragentName.Text := GetReturnValue(sgFINServicesObject, 3);

            DisableControls([edtFinContractDate
                             //,edtName
                             //,edtPartnerCode
                             //,edtFinDocCode
                             //,edtFinDocID
                             ,edtFinCommentGen
                             ,edtFinContractNumber
                             //,edtContractDate
                            ]);
          except
            on EConvertError do Exit;
          end;
        end;
   finally
      frmFINServicesObjectShow.Free;
   end;
end;

procedure TfrmENTechConditionsServicesEdit.spbResponsiblePersonClick(
  Sender: TObject);
var
   frmFINWorkerShow: TfrmFINWorkerShow;
   f : FINWorkerFilter;
   TempFINWorker: FINWorkerControllerSoapPort;
begin
  EXIT; // БУДЕМ ПЫТАТЬСЯ СЕТИТЬ АВТОМАТОМ 
{*****
  f :=FINWorkerFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  // f.departmentCode :=  IntToStr(plan.departmentRef.code);

   frmFINWorkerShow := TfrmFINWorkerShow.Create(Application, fmNormal, f);
   try
     frmFINWorkerShow.isForTechCondResponsiblesList := true;

     // frmFINWorkerShow.dateGet := TXSDate.Create;
     // frmFINWorkerShow.dateGet.XSToNative(GetXSDate( EncodeDate(plan.dateStart.Year,plan.dateStart.Month,plan.dateStart.Day) ));

     //frmFINWorkerShow.humenKindCode := ENHUMENITEMKIND_ELTEH;
     DisableActions([frmFINWorkerShow.actInsert, frmFINWorkerShow.actEdit, frmFINWorkerShow.actDelete]);

      with frmFINWorkerShow do
        if ShowModal = mrOk then
        begin
          try
            ENTechConditionsServicesObj.responsibleFIO := GetReturnValue(sgFINWorker,1);
            ENTechConditionsServicesObj.responsibleTabNumber := StrToInt(GetReturnValue(sgFINWorker,2));
            ENTechConditionsServicesObj.responsiblePosition := GetReturnValue(sgFINWorker,3);
            //ENHumenItemObj.finWorker.positionCode := StrToInt(GetReturnValue(sgFINWorker,4));
            ENTechConditionsServicesObj.responsibleDepName := GetReturnValue(sgFINWorker,5);
            ENTechConditionsServicesObj.responsibleDepCode := (GetReturnValue(sgFINWorker,6));

            edtResponsiblePerson.Text := ENTechConditionsServicesObj.responsibleFIO;
          except
            on EConvertError do Exit;
          end;
        end;
   finally
      frmFINWorkerShow.Free;
   end;
*****}
end;

procedure TfrmENTechConditionsServicesEdit.spbCNPackClick(Sender: TObject);
var
   frmCNPackShow: TfrmCNPackShow;
   f: CNPackFilter;

   TempENTechConditionsServices: ENTechConditionsServicesControllerSoapPort;
   tcsCodeArray: ENTechConditionsServicesController.ArrayOfInteger;
   tcsFilterObj: ENTechConditionsServicesFilter;
   condition: String;
begin
  if DialogState = dsView then Exit;

  f := CNPackFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  // Для договоров на реализацию фильтранем пакет по № договора на присоединение
  if ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION then
    if ENTechConditionsServicesObj.contractNumber <> '' then
      f.reg_num_cn_contract := ENTechConditionsServicesObj.contractNumber;

  frmCNPackShow := TfrmCNPackShow.Create(Application, fmNormal, f);
  try
    with frmCNPackShow do
    begin
      // Даем возможность фильтровать
      //if contractNumber <> '' then
      //  DisableActions([actFilter, actNoFilter]);
      if ShowModal = mrOk then
      begin

      //PRIC-562. Недопущение создания двух договоров о Присоединении,
      //связанных с одним пакетом EnergyWorkFlow
      if (ENTechConditionsServicesObj.connectionKindRef.code <>
        ENCONNECTIONKIND_GENERAL_CONNECTION)
      then
        begin
          TempENTechConditionsServices :=
            HTTPRIOENTechConditionsServices
              as ENTechConditionsServicesControllerSoapPort;
          tcsFilterObj := ENTechConditionsServicesFilter.Create;
          SetNullIntProps(tcsFilterObj);
          SetNullXSProps(tcsFilterObj);
          condition := ENTechConditionsServicesFilter(tcsFilterObj).conditionSQL;
          DialogFormUnit.AddCondition(condition,
          'ENTECHCONDITIONSSERVCS.CNPACKCODE = ' + GetReturnValue(sgCNPack, 1) +
          ' AND ENTECHCONDITIONSSERVCS.CNSUBSYSTEMTYPEREFCODE = ' +
          IntToStr(Integer(sgCNPack.Objects[4, sgCNPack.Row])), False);
          ENTechConditionsServicesFilter(tcsFilterObj).conditionSQL := condition;
          tcsCodeArray :=
            TempENTechConditionsServices.getScrollableFilteredCodeArray(
              tcsFilterObj, 0, -1);
          if Length(tcsCodeArray) > 0 then
            begin
              Application.MessageBox(
                Pchar('Уже существует договор о Присоединении для ' + #13#10 +
                  'выбранного пакета документов EnergyWorkFlow!'),
                PChar('Предотвращение дублирования данных:'), MB_ICONWARNING);
              //ModalResult := mrNone;
              Exit;
            end;
        end;

        try
          ENTechConditionsServicesObj.cnPackCode := StrToInt(GetReturnValue(sgCNPack, 1));
          if ENTechConditionsServicesObj.cnSubsystemTypeRef = nil then
            ENTechConditionsServicesObj.cnSubsystemTypeRef := CNSubsystemTypeRef.Create;
          ENTechConditionsServicesObj.cnSubsystemTypeRef.code := Integer(sgCNPack.Objects[4, sgCNPack.Row]);
          //ENTechConditionsServicesObj.cnSubsystemName := GetReturnValue(sgCNPack, 4);
          //edtCNPackCode.Text := GetReturnValue(sgCNPack, 1) + ' (' + ENTechConditionsServicesObj.cnSubsystemName + ')';
          edtCNPackCode.Text := GetReturnValue(sgCNPack, 1);
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmCNPackShow.Free;
  end;
end;


procedure TfrmENTechConditionsServicesEdit.FormCreate(Sender: TObject);
begin
  inherited;
  techConditionsServicesCode := LOW_INT;
  isNotCalculated := True;
  isNotCalculatedSecondary := True;
  powerCategory := False;
end;

procedure TfrmENTechConditionsServicesEdit.btnPrintBillClick(
  Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
  copystr :string;
  contractDate: TDate;
begin

  if ENTechConditionsServicesObj.code = LOW_INT then Exit;

  if getContragentsCount(ENTechConditionsServicesObj.code) = 0 then
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

    contractDate := EncodeDate(
       ENTechConditionsServicesObj.contractDate.Year,
       ENTechConditionsServicesObj.contractDate.Month,
       ENTechConditionsServicesObj.contractDate.Day);

    try
      if frmEntechConditionsServicesEditSumBill.ShowModal = mrOK then
      begin

         // Согласно Приказу №740 от 25.10.2013
         // (начиная с этой даты, печатаем новую форму договору)
         if (contractDate >= encodedate(2013, 10, 23) ) then
             reportName := 'TechConditions/Agree_20131025/billByTU'
         else
             reportName := 'TechConditions/billByTU';

         SetLength(argNames, 2);
         SetLength(args, 2);

         argNames[0] := 'agreeCode';
         args[0] := IntToStr(ENTechConditionsServicesObj.code);

         argNames[1] := 'billSum'; // сумма в счете ( предоплата или полная )
         args[1] := frmEntechConditionsServicesEditSumBill.edtSum.Text;

         makeReport(reportName, argNames, args, 'pdf');
      end;
    finally
       frmEntechConditionsServicesEditSumBill.Free;
    end;

  end
  else
  begin
    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'agreeCode';
    args[0] := IntToStr(ENTechConditionsServicesObj.code);

    reportName := 'TechConditions/billByStandartConnections';
    makeReport(reportName, argNames, args, 'pdf');
  end;

end;

procedure TfrmENTechConditionsServicesEdit.edtTySummaGenChange(
  Sender: TObject);
begin

  if (ENTechConditionsServicesObj.connectionKindRef.code <> ENCONNECTIONKIND_STANDART) then
  if edtTySummaGen.Text <> '' then
  edtTySummaVat.Text:= FloatToStr( conv(StrToFloat(edtTySummaGen.Text) / 6 , 2) )
  else
  edtTySummaVat.Text:= '0';

end;

procedure TfrmENTechConditionsServicesEdit.actSignaturedTechIncomeExecute(
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
          TempENActIncomeTechConditions.signaturedTech(ENActIncomeTechConditionsObj.code);
          actUpdateIncomeExecute(Sender);
          Application.MessageBox(PChar('Статус изменен..!'),PChar('Внимание!'),MB_ICONINFORMATION);

      end;
   end;


end;

procedure TfrmENTechConditionsServicesEdit.actUnSignaturedTechIncomeExecute(
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

procedure TfrmENTechConditionsServicesEdit.pmActsIncomePopup(
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

procedure TfrmENTechConditionsServicesEdit.actCloseTechIncomeExecute(
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

procedure TfrmENTechConditionsServicesEdit.actUnCloseTechIncomeExecute(
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

procedure TfrmENTechConditionsServicesEdit.spbConnectionTariffValusClick(Sender: TObject);
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

               edtTyServicesPowerChange(Sender);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENConnectionTariffShow.Free;
   end;
end;



procedure TfrmENTechConditionsServicesEdit.edtTyServicesPowerChange(
  Sender: TObject);
var curr_nds, curr_nds_coeff : Double;
begin
  if (ENTechConditionsServicesObj.connectionKindRef.code = ENCONNECTIONKIND_STANDART) then
  if (edtConnectionTariffValue.Text <> '') and (edtTyServicesPower.Text <> '')
      // SUPP-1240... +++ для строй.площадок - оставить выбор тарифа, сумма при этом нулевая..
       and (not cbBuildersArea.Checked) then
  begin
    {NET-4284 - ндс определим по дате документа
     edtTySummaGen.Text := FloatToStr( conv(StrToFloat(edtTyServicesPower.Text) * StrToFloat(edtConnectionTariffValue.Text)*1000*1..2, 2) );
     edtTySummaVat.Text := FloatToStr( conv(StrToFloat(edtTySummaGen.Text) / 6 , 2) ); }

    curr_nds:=   DMReports.getStandartKoefInPeriod(ENSTANDARDCONST_PDV , ENTechConditionsServicesObj.contractDate.AsDate );
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

procedure TfrmENTechConditionsServicesEdit.cbBuildersAreaClick(
  Sender: TObject);
begin
  if (cbBuildersArea.Checked) then
  begin
    // SUPP-1240... +++ для строй.площадок - оставить выбор тарифа, сумма при этом нулевая..
    // gbConnectionTariff.Visible := False;
    // ENTechConditionsServicesObj.tariffEntryRef := nil;
    // edtConnectionTariffName.Text := '';
    // edtConnectionTariffValue.Text := '';
    edtTyServicesSumma.Text := '0';
    edtTyServicesPowerChange(Sender);
  end else
    // gbConnectionTariff.Visible := True;
    edtTyServicesPowerChange(Sender);
end;

procedure TfrmENTechConditionsServicesEdit.spbENElementClick(Sender: TObject);
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
          primarySubstationElCode := ENPriconnectionDataObj.elementRef.code;
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENElementShow.Free;
  end;
end;

procedure TfrmENTechConditionsServicesEdit.btnCalculatePaySumClick(Sender: TObject);
var
  TempENPriconnectionData : ENPriconnectionDataControllerSoapPort;
  TempENTechConditionsServices : ENTechConditionsServicesControllerSoapPort;
  servicesCalculateObj : ENTechConditionsServices;
begin

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

procedure TfrmENTechConditionsServicesEdit.btnPrintCalculateClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
begin
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'tcsCode';
  args[0] := IntToStr(ENTechConditionsServicesObj.code);

  if (powerCategory) then
  begin
    if (ENTechConditionsServicesObj.calcTypeRef.code = CONNECTIONCALCTYPE_NOT_ABOVE_RESERVE) then
      reportName := 'TechConditions/Connection/2category/ConnectionCostNotAboveReserve'
    else
      reportName := 'TechConditions/Connection/2category/ConnectionCost';
  end else
  begin
    if (ENTechConditionsServicesObj.calcTypeRef.code = CONNECTIONCALCTYPE_NOT_ABOVE_RESERVE) then
      reportName := 'TechConditions/Connection/ConnectionCostNotAboveReserve'
    else
      reportName := 'TechConditions/Connection/ConnectionCost';
  end;

  makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmENTechConditionsServicesEdit.edtContractDateChange(
  Sender: TObject);
var strDate: String;
begin
  if (edtContractDate.Checked) and (edtContractDateFinal.Visible) then
    begin
      {
      strDate := DateToStr(edtContractDate.Date);
      strDate := Copy(strDate, 1, 6) +
        IntToStr(StrToInt(Copy(strDate, 7, 10)) + 2);
      edtContractDateFinal.Date := StrToDate(strDate);
      edtContractDateFinal.Checked := True;
      }
      edtContractDateFinal.Date := EncodeDate(YearOf(edtContractDate.Date) + 2,
                                              MonthOf(edtContractDate.Date),
                                              DayOf(edtContractDate.Date));
      edtContractDateFinal.Checked := True;
    end;
end;

procedure TfrmENTechConditionsServicesEdit.btnCalculatePaySumSecondaryClick(Sender: TObject);
var
  TempENPriconnectionData : ENPriconnectionDataControllerSoapPort;
  TempENTechConditionsServices : ENTechConditionsServicesControllerSoapPort;
  servicesCalculateObj : ENTechConditionsServices;
begin

  if (dataSecondary <> nil) then
  begin
    TempENPriconnectionData := HTTPRIOENPriconnectionData as ENPriconnectionDataControllerSoapPort;
    // if (ENPriconnectionDataObj.powerMaxCurrent = nil) then
      ENPriconnectionDataObj := TempENPriconnectionData
         .getCalculationDataObject(dataSecondary.elementRef.code, ENTechConditionsServicesObj.code, SECONDARY_SUBSTATION);

    if ENPriconnectionDataObj.techCondServRef = nil then ENPriconnectionDataObj.techCondServRef := ENTechConditionsServicesRef.Create();
      ENPriconnectionDataObj.techCondServRef.code := ENTechConditionsServicesObj.code;

    if (powerCategory) then
      ENPriconnectionDataObj.isPrimarySubstation := SECONDARY_SUBSTATION;

  end else
  begin
    Application.MessageBox(PChar('Спочатку потрібно обрати місце забезпечення потужності об’єкта Замовника!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if (isNotCalculatedSecondary) then
    frmENPriconnectionDataEdit := TfrmENPriconnectionDataEdit.Create(Application, dsEdit)
  else frmENPriconnectionDataEdit := TfrmENPriconnectionDataEdit.Create(Application, Self.DialogState);  

  try
    frmENPriconnectionDataEdit.elementCode := dataSecondary.elementRef.code;
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


procedure TfrmENTechConditionsServicesEdit.spbENElementSecondaryClick(Sender: TObject);
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

end.
