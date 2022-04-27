unit DMReportsUnit;

interface

uses
  SysUtils, StrUtils, Classes, InvokeRegistry, Rio, SOAPHTTPClient, EnergyproController, ENReportsController,
  {***}SOAPHTTPTrans, WinInet, AbBase, AbUnzper{***} , AdvGrid, StdCtrls, ComCtrls, XSBuiltIns, AdvObj, Grids,
  tmsAdvGridExcel, IdFTP, IdComponent, DialogFormUnit,
   ENLine10Controller
  , ENSubstation04Controller
  , ENLine150Controller
  , ENSubstation150Controller
  , ENLine04Controller
  , ENPlanWorkController
  , ENDepartmentController
  , ENElementController
  , ENActController
  , ENActIncomeTechConditionsController
  , ENAct2ENPlanWorkController
  , ENWorkOrder2ENPlanWorkController
  , ENWorkOrderController
  , FINDocTypeController

  ,ENLineCableController
  ,RQOrderController
  ,FINMolController
  ,FINMolDataController
  ,FINDoc2MolDataController
  ,FINMolTypeController
  ,FINExecutorController

  ,RQFKOrderController
  ,RQInvoiceController
  ,ENEstimateItemController
  , ENTravelSheetController
  , RQBillController
  , ENServicesObjectController
  , ENWarrantController
  , ENWarrantStatusController
  , TKTransportMarkController
  , ENDestinationPoint2PointController
  , ENTransportRouteController
  , ENDestinationPointController

  , RQOrgController
  , ENPriconnectionDataController
  , ENUnitedGroup2TechCondServicesController
  , ENMolController, ENIPItem2PlanController, ENIPItemController,
    ENCalc2ConnectTariffController,
    TKTechCardController, DFDoc2ENServicesObjectController,
    ENPayment2SOController,
    ENWorkOrderBytController,
    ENPlanWork2ClassificationTypeController,
    SCUsageInputController,
    ENReconstrModernOZController,
    DFTaskSPAController,
    DFDocServiceNoteController,
    DFDocController,
    DFDocInBoxController,
    DFDocOutBoxController,
    DFDocAgreementController,
    DFDocDecreeController,
    DFDocJourneyController,
    DFDocOrderController,
    DFDocFaxController,
    DFDocMovementController,
    DFDocsLabourDepartmentController,
    DFDocChiefTaskController,
    DFDecreeWorkOnWeekendsController,
    DFOrdersCatalogController,
    ENConsts,
    ENConnectionTariffController,
    FINMaterialsController,
    DFDocCommissionProtocolController,
    DFDocServicesConsumerController,
    User2StaffingController,
    ENDocAttachmentController,
    ENDocAttachmentServerController,
    DFNormativeDocCatalogController,
    DFDocEmployeeStatementController,
    DFDocEstimateController,
    TKMaterialsController,
    DFDocServicesConsumerKindController,
    ENServicesFromSideObjectController,
    DFDocRepairRequestController,
    DFDocExtractOrderController,
    DFActCheckingWorkplaceController,
    DFDocSubtype2SignerTypeController,
    DFDocSignerController,
    DFJobStatusController,
    DFDocStaffRequestController
;

type
  TDMReports = class(TDataModule)
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    HTTPRIOENElement: THTTPRIO;
    HTTPRIOENEstimateItem: THTTPRIO;
    HTTPRIOENLine10: THTTPRIO;
    HTTPRIOENSubstation04: THTTPRIO;
    HTTPRIOENLine150: THTTPRIO;
    HTTPRIOENSubstation150: THTTPRIO;
    HTTPRIOENLine04: THTTPRIO;
    HTTPRIOENDepartment: THTTPRIO;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    HTTPRIOENAct2ENPlanWork: THTTPRIO;
    HTTPRIOENAct: THTTPRIO;
    HTTPRIOENRZAObject: THTTPRIO;
    HTTPRIOENSDTUObject: THTTPRIO;
    HTTPRIOENHumenItem: THTTPRIO;
    HTTPRIOENWorkOrder2ENPlanWork: THTTPRIO;
    HTTPRIOENWorkOrder: THTTPRIO;
//    HTTPRIOFINDoc2WorkOrder: THTTPRIO;
    HTTPRIOENLineCable: THTTPRIO;
    HTTPRIOTKTransportReal: THTTPRIO;
    HTTPRIOENBuilderObject: THTTPRIO;
    HTTPRIOTemp: THTTPRIO;
    HTTPRIOFINMolData: THTTPRIO;
    HTTPRIOFINDoc2MolData: THTTPRIO;
    HTTPRIORQFKOrder: THTTPRIO;
    HTTPRIORQOrder: THTTPRIO;
    HTTPRIOENEstimateItem2ENEstimateItem: THTTPRIO;
    HTTPRIOENTravelSheet: THTTPRIO;
    HTTPRIORQBill: THTTPRIO;
    HTTPRIOENWarrant: THTTPRIO;
    HTTPRIOENWarrantStatus: THTTPRIO;
    HTTPRIOENServicesObject: THTTPRIO;
    HTTPRIOENTrptGPS2TrptReal: THTTPRIO;
    HTTPRIOTKTransportMark: THTTPRIO;
    HTTPRIOENTechCond2enplanwork: THTTPRIO;
    HTTPRIOENDestinationPoint2Point: THTTPRIO;
    HTTPRIOENTransportRoute: THTTPRIO;
    HTTPRIOENDestinationPoint: THTTPRIO;
    HTTPRIOENGiveCounter: THTTPRIO;
    HTTPRIOENPriconnectionData: THTTPRIO;
    HTTPRIOENTechConditionsServices: THTTPRIO;
    HTTPRIOENUnitedGroup2TechCondServices: THTTPRIO;
    HTTPRIOENTechConditionsObjects: THTTPRIO;
    HTTPRIOFINMol: THTTPRIO;
    HTTPRIOENStandardConstEntry: THTTPRIO;
    HTTPRIOENReport: THTTPRIO;
    HTTPRIOEPRen: THTTPRIO;
    HTTPRIOENIPItem2Plan: THTTPRIO;
    HTTPRIOENCalc2ConnectTariff: THTTPRIO;
    HTTPRIOTKTechCard: THTTPRIO;
    HTTPRIOConfig: THTTPRIO;
    HTTPRIODFDoc2ENServicesObject: THTTPRIO;
    HTTPRIOENPayment2SO: THTTPRIO;
    HTTPRIOENWorkOrderByt: THTTPRIO;
    HTTPRIOENPlanWork2ClassificationType: THTTPRIO;
    HTTPRIOSCUsageInput: THTTPRIO;
    HTTPRIODFTaskSPA: THTTPRIO;
    HTTPRIODFDocServiceNote: THTTPRIO;
    HTTPRIODFDocInBox: THTTPRIO;
    HTTPRIODFDocOutBox: THTTPRIO;
    HTTPRIODFDocAgreement: THTTPRIO;
    HTTPRIODFDocFax: THTTPRIO;
    HTTPRIODFDocJourney: THTTPRIO;
    HTTPRIODFDocOrder: THTTPRIO;
    HTTPRIODFDocDecree: THTTPRIO;
    HTTPRIODFRouteItem: THTTPRIO;
    HTTPRIODFDocMovement: THTTPRIO;
    HTTPRIODFDocsLabourDepartment: THTTPRIO;
    HTTPRIODFDocChiefTask: THTTPRIO;
    HTTPRIODFDecreeWorkOnWeekends: THTTPRIO;
    HTTPRIOFINExecutor: THTTPRIO;
    HTTPRIOUserMembership: THTTPRIO;
    HTTPRIOENSettingsValues: THTTPRIO;
    HTTPRIODFOrdersCatalog: THTTPRIO;
    HTTPRIOENConnectionTariff: THTTPRIO;
    HTTPRIODFDocCommissionProtocol: THTTPRIO;
    HTTPRIOENServices2plan: THTTPRIO;
    HTTPRIOENMol: THTTPRIO;
    HTTPRIORQStorage2ENMol: THTTPRIO;
    HTTPRIODFDocServicesConsumer: THTTPRIO;
    HTTPRIOUser2Staffing: THTTPRIO;
    HTTPRIOENDocAttachment: THTTPRIO;
    HTTPRIOENDocAttachmentServer: THTTPRIO;
    toExcel: TAdvGridExcelIO;
    HTTPRIODFNormativeDocCatalog: THTTPRIO;
    HTTPRIOENPlanWork2CCDamageLog: THTTPRIO;
    HTTPRIODFDocEmployeeStatement: THTTPRIO;
    HTTPRIOENSOValues: THTTPRIO;
    HTTPRIOTKMaterials: THTTPRIO;
    HTTPRIODFDocServicesConsumerKind: THTTPRIO;
    HTTPRIODFProjectDocCatalog: THTTPRIO;
    HTTPRIOENServFromSide2PlanWork: THTTPRIO;
    HTTPRIODFDocRepairRequest: THTTPRIO;
    HTTPRIODFDocExtractOrder: THTTPRIO;
    HTTPRIODFActCheckingWorkplace: THTTPRIO;
    HTTPRIODFDocSubtype2SignerType: THTTPRIO;
    HTTPRIODFDocSigner: THTTPRIO;
    HTTPRIODFDoc: THTTPRIO;
    HTTPRIORQFKOrder2DFDoc: THTTPRIO;
    HTTPRIODFDocAttachment: THTTPRIO;
    HTTPRIODFDocEstimate: THTTPRIO;
    HTTPRIOENAct2DFDoc: THTTPRIO;
    HTTPRIORQFKOrderItem2ENEstimateItem: THTTPRIO;
    HTTPRIORQFKOrderItemRemainder: THTTPRIO;
    HTTPRIOENActIncomeTech2DFDoc: THTTPRIO;
    HTTPRIOENActIncomeTechConditions: THTTPRIO;
    HTTPRIOSCUsageInput2DFDoc: THTTPRIO;
    HTTPRIOENIPItem: THTTPRIO;
    HTTPRIOENReconstrModernOZ2DFDoc: THTTPRIO;
    HTTPRIOENReconstrModernOZ: THTTPRIO;
    HTTPRIODFDocStaffRequest: THTTPRIO;

    procedure HTTPRIOBeforeExecute(const MethodName: String; var SOAPRequest: WideString);
    procedure HTTPRIOAfterExecute(const MethodName: String; SOAPResponse: TStream);
    {*** 16.10.06 DL ***}
    procedure HTTPRIOHTTPWebNodeBeforePost(const HTTPReqResp: THTTPReqResp; Data: Pointer);
    {*** 16.10.06 DL ***}
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    //procedure SetHTTPRIOProps;
    procedure sgDFDocSignersCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure sgDFDocSignersCanEditCellViewMode(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure sgDFDocSignersEllipsClick(Sender: TObject; ACol, ARow: Integer;
      var S: string);
    procedure sgDFDocSignersGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure viewBadPostings(servicesObjectCode: Integer);
  public
    { Public declarations }
    procedure SetHTTPRIOProps;
    procedure makeReport4DocFlow(reportName: String; argNames, args: ArrayOfString; reportType: String);
    function makeGeneralReportPDF(name: String; request: EPReportRequestEx; _type: String) : String; overload;
    function makeGeneralReportPDF(name: String; request: EPReportRequestEx; _type: String; pFileName : String) : String; overload;
    procedure makeGeneralReportPDFwithOutExecute(name: String; request: EPReportRequestEx; _type: String; pFileName : String); overload;
    procedure Decode(FileName: String; fileEXT:string);

    function base64Encode(const inputString: String): String;
    function base64Decode(const inputBase64String: String): String;

    function getElementTypeByPlan(planCode : Integer): Integer; overload;
    function getElementTypeByPlan(plan: ENPlanWork): Integer; overload;
    function getElementCodeByPlanCode(planCode : Integer):Integer;
    function getElementTypeByPlanItem(planItemCode : Integer):Integer;
    function getElementTypeByEstimateItem(estimateItemCode : Integer):Integer;
    function getLine04ByElement(elementCode : Integer): ENLine04;
    function getLine10ByElement(elementCode : Integer): ENLine10;
    function getSubstation04ByElement(elementCode : Integer): ENSubstation04;
    function getLine150ByElement(elementCode : Integer): ENLine150;
    function getSubstation150ByElement(elementCode : Integer): ENSubstation150;
    function getObjectByElement(elementCode : Integer) : TObject;
    function getObjectByElementType(elementCode : Integer; elementType : Integer) : TObject;
    function getInvNumByElementType(elementCode : Integer; elementType : Integer) : String;
    function getInvNumByElement(elementCode : Integer) : String;
    function getPlanByCode(planCode : Integer): ENPlanWork ;
    function getDepartmentByRenCode(renCode: Integer; managementCode: Integer):ENDepartmentShort;

    function searchElements(f : ENElementFilter; from: integer; count:integer; invNum : string; objName : string; buhName: String = ''):ENElementShortList;

    function getFinRenByDepartmentCode(departmentCode : Integer) : WideString;
    function getActByPlan(planCode : Integer) : ENAct;
    function getElementByCode(elementCode : Integer) : ENElement;
    function getHumenCountInPlanWorkItem(planItemCode : Integer) : Integer;
    function getWorkOrderByPlanCode(planCode : Integer) : ENWorkOrder;

    //function getFINDocCodeByWorkOrderCode(workCode : Integer; operationType : integer) : FINDoc2WorkOrder;

    function getFINDocCodeByWorkOrderCode2(molData : FINMolData; operationType : Integer) : FINDoc2MolData;

    function getPlansListByActCode(actCode : Integer; orderBy :String ) : ENPlanWorkShortList;
    function getPlanTypeByActCode(actCode : Integer) : Integer;

    function getLineCableByElement(elementCode : Integer): ENLineCable;

    function getEPRenByDepartmentCode(departmentCode : Integer) : WideString;
    function getCFOByBudgetCode(departmentCode : Integer) : String;

    function getRQOrder(orderCode : Integer): RQOrder;

    function getMOLData(workOrderCode : Integer; molTypeCode : Integer ) : FINMolData;

   //  function getRenCodeInDepartmentByDepartmentCode(depCode : Integer):ENDepartmentShort;
    procedure makeGeneralReportAuth(name: String; request: EPReportRequestEx; _type: String; isAuth : boolean);

    function getPlanByEstimateCode(estimateCode : Integer): ENPlanWork ;

    function getRQFKOrderByCode(orderCode : Integer) : RQFKOrder;
    function getRQInvoice(invoiceCode : Integer): RQInvoice;

    function getENActByCode(actCode : Integer) : ENAct;
    function getENActIncomeTechConditionsByCode(actIncomeCode : Integer) : ENActIncomeTechConditions;

    function getSCUsageInputByCode(scUsageInputCode : Integer) : SCUsageInput;

    function getENReconstrModernOZByCode(ozCode : Integer) : ENReconstrModernOZ;

    function getParentEstimateFromCurrentPlan(estimateCode : Integer) : ENEstimateItem;
    function getParentEstimateFromCurrentPlan_(estimateCode : Integer) : ENEstimateItem;
    function getParentEstimateCodesFromCurrentPlan(estimateCode : Integer) : String;

    function getPartyFromFKOrderByEstimateFromCurrentPlan(estimateCode : Integer) : String;

    function getPlanShortByCode(planCode : Integer): ENPlanWorkShort ;
    function getDepartmentCodesDown(departmentCode : Integer): String ;
    function getAXDepartmentCodesDown(departmentCode : Integer): String ;

    function getPlanItemCodes(planCode : Integer): String ;
    function getPlanCodesByActCode(actCode : Integer) : String;
    procedure exportGrid(grid : TAdvStringGrid; outName : string);

    function getPrevTravelSheet(obj : ENTravelSheet) : ENTravelSheet;
    function getNextTravelSheet(obj : ENTravelSheet) : ENTravelSheet;
    function getLastTravelSheet(obj : ENTravelSheet) : ENTravelSheet;

    function getBillByCode(billCode : Integer): RQBill;
    function getDepartmentBySizCode(elementCode : Integer):ENDepartmentShort;
    function getPlanCodeForCalculationByElement(elementCode: Integer): Integer;
    function getServicesObjectByCode(svoCode : Integer): ENServicesObject;
    function getServicesObjectByElementCode(elementCode : Integer): ENServicesObject;
    function getServicesObjectByPlanCode(planCode : Integer): ENServicesObject;
    function getConnectionKindForServicesObject(servicesObjectCode : Integer): Integer;
    function getDepartmentByCode(depCode : Integer): ENDepartment;
    function getWarrantByCode(warrantCode : Integer): ENWarrant;
    function getWarrantStatus(stCode : Integer): ENWarrantStatus;
    function searchAutoRealbyCodeAutoGPS(CodeAutoGPS : String):integer;
    function getTransportmarkByrealtransportcode(realtransportcode : integer):TKTransportMark;
    function getStrCodePlanFromENtechCond2enplanwork(EnTechConditionsServicesCode : Integer) : WideString;
    function getStrCodePlanFromENservices2enplanwork(EnServicesObjectCode : Integer; recordCount : Integer) : WideString;

    function getDistanceByPoint2Point(inCode : Integer; outCode : Integer) : ENDestinationPoint2Point;
    function getParentRouteCode(routeCode : Integer) : Integer;
    function getRouteCodeByPlan(planCode : Integer) : Integer;
    function getLastDestinationPointByPlan(planCode : Integer) : ENDestinationPointShort;
    function getLastRouteCodeByPlan(planCode : Integer) : Integer;
    //procedure copyOrg(const sourceOrg: RQOrg; destOrg: RQOrg);
    function copyOrg(const sourceOrg: RQOrg; const destOrg: RQOrg): RQOrg;

    function CheckCounters(servicesObjectCode : Integer): Boolean;
    function getPriconnectionDataByServicesCode(servicesCode : Integer): ENPriconnectionData;
    function getPriconnectionDataByElementCode(elementCode : Integer): ENPriconnectionData;

    function getTechCondServicesCodeByServicesCode(servicesCode : Integer): Integer;

    function checkSolidaryConnections(tcsCode : Integer): Boolean;
    function checkPowerCategory(tcsCode : Integer): Boolean;
    function getPriconnectionDataPrimarySubstation(servicesCode : Integer; primarySubstation : Integer): ENPriconnectionData;
    function checkLinesCost(tcsCode : Integer): Boolean;

    function getMolByFinCode(finMolCode : String): ENMol;

    function getStandartKoefInPeriod( constCode : Integer ; period : TDateTime ): Real;

    function getEPRenShortList(enelementcode : Integer):EPRenShortList;

    function getStrCodePlanFromIPItem(IPItemCode : Integer) : WideString;
    function getIp2PlanCodeByPlanCode(planCode : Integer; ipItemCode : Integer): Integer;

    function getCalc2TariffByTechCondCode(techCondCode : Integer): ENCalc2ConnectTariff;

    function getTKTechCardByHumenItemCode(humenItemCode: Integer): TKTechCard;

    function chkPaymentByBudget(): Boolean;

    // Функция проверяет есть ли в акте трансформаторы переводимые во втор-сырье
    function checkTransformatorsForRawInAct(actCode : Integer) : Boolean;
    function checkTransformatorsForRawInPlan(planCode : Integer) : Boolean;

    // проверка договора на связ с Заявлением потребителя в DocFlow...
    function checkServicesConsumer(soCode : Integer) : Boolean;

    function getServicesConsumer(soCode: Integer): DFDocServicesConsumer;
    function isEICRequired(soCode: Integer): Boolean;

    // проверка плана на связь с Заявлением потребителя в DocFlow...
    function checkPlanConsumerServices(planCode : Integer) : Boolean;

    // NET-4422... 04.02.2015... +++ работа по замене счетчика (переход на многотарифный учет)
    function checkReplaceCounterServices(soElementCode : Integer) : Boolean;
    function checkOzToReplaceCounterServices(actCode : Integer) : Boolean;
    // +++ работы по параметризации счетчика (переход на многотарифный учет)
    function checkParameterizationCounterServices(soElementCode : Integer) : Boolean;

    // SUPP-31364 работы по проектированию внутренних сетей
    function checkInnerNetProject(soElementCode : Integer) : Boolean;

    procedure makeGeneralReportPDFwithExecute(name: String; request: EPReportRequestEx; _type: String; pFileName : String); overload;

    // сумма оплаты по договору услуг на сторону
    function getPaySumByServicesObject(soCode: Integer): Real;

    function getWorkOrderBytByCode(workOrderBytCode: Integer): ENWorkOrderByt;
    procedure SetCounterZonesForCombo(combo: TComboBox);
    function getDefaultZones(): TArray<String>;

    function getCountTaskSPAByNodeCode(CCNodeCode : Integer) : ArrayOfString;

    function getActCheckingByDocCode(docCode: Integer): DFActCheckingWorkplace;
    function getExtractOdrerByDocCode(docCode: Integer): DFDocExtractOrder;
    function getRepairRequestByDocCode(docCode: Integer): DFDocRepairRequest;
    function getEmployeeStatementByDocCode(docCode: Integer): DFDocEmployeeStatement;
    function getStaffRequestByDocCode(docCode: Integer): DFDocStaffRequest;
    function getDocEstimateByDocCode(docCode: Integer): DFDocEstimate;
    function getServiceNoteByDocCode(docCode : Integer) : DFDocServiceNote;
    function getInBoxByDocCode(docCode : Integer) : DFDocInBox;
    function getOutBoxByDocCode(docCode : Integer) : DFDocOutBox;
    function getDocAgreementByDocCode(docCode : Integer) : DFDocAgreement;
    function getDocDecreeByDocCode(docCode : Integer) : DFDocDecree;
    function getDocJourneyByDocCode(docCode : Integer) : DFDocJourney;
    function getDocOrderByDocCode(docCode : Integer) : DFDocOrder;
    function getDocFaxByDocCode(docCode : Integer) : DFDocFax;
    function getRQFKOrderByDocCode(docCode: Integer): RQFKOrder;
    function getENActByDocCode(docCode: Integer): ENAct;
    function getENActIncomeTechConditionsByDocCode(docCode: Integer): ENActIncomeTechConditions;
    function getSCUsageInputByDocCode(docCode: Integer): SCUsageInput;
    function getENReconstrModernOZByDocCode(docCode: Integer): ENReconstrModernOZ;

    function getTabnumbersFromRoutes(senderUserName : String): string; overload;
    function getTabnumbersFromRoutes(routeCode : Integer): string; overload;

    function getDocsLabourDepartment(docCode : Integer) : DFDocsLabourDepartment;
    function getDocChiefTask(docCode : Integer) : DFDocChiefTask;
    function getDocDecreeWorkOnWeekends(docCode : Integer) : DFDecreeWorkOnWeekends;

    function checkEditigDoc(docCode : Integer) : Boolean;

    function isCommentRequiredForPlanWorkItems(plan: ENPlanWork): boolean;

    function getFullExecutorName(node: TTreeNode): String;
    function finExecutorShort2finExecutor(const shortObj: FINExecutorShort; const fullName: String): FINExecutor;

    function getDriversConditionForAX(): String;
    function getPersonalAccountInfo(techCondServicesCode: Integer): PersonalServicesInfo;
    function getPlanCodesByWorkOrder(workOrderNumber: String): String;

    function isPlanWithSeals(planCode: Integer): Boolean;
    function isWorkOrderBytWithSeals(workOrderBytCode: Integer): Boolean;
    function getSealsCountForWorkOrderByt(workOrderBytCode: Integer): Integer; overload;
    function getSealsCountForWorkOrderByt(workOrderBytCode: Integer; accountingTypeCode: Integer): Integer; overload;
    function getSealsCountForWorkOrderBytByFact(workOrderBytCode: Integer; accountingTypeCode: Integer): Integer;
    {Возвращает строку с сгруппированными id исполнителей разделенных запятыми
    вместе с посланным родительским Id}
    function getStrAllFINExecutorIdsByParent(parentId : String) : String; overload;
    function getStrAllFINExecutorIdsByParent(parentId : String; isMDAX : TXSBoolean) : String; overload;
    // Используется ли Axapta основным сервером
    function UsesMDAXData(): Boolean; overload;
    function UsesMDAXData(configCode: Integer): Boolean; overload;
    function getMDAXDataValue(configCode: Integer): String;

    // Используется ли Axapta отчетным сервером
    function UsesMDAXDataForReport(): Boolean;
    {Метрологические подразделения пока только 027 и 042}
    class function isMetrologyDepartment(departmentFKCode : String): Boolean; overload; stdcall; static;
    {Метрологические подразделения пока только 027 и 042}
    class function isMetrologyDepartment(departmentFKCode : String; isOnlyMetrology: Boolean): Boolean; overload; stdcall; static;

    // проверка принадлежности пользвателя к группе
    function checkUsersGroup(groupCode: Integer): Boolean;

    // Получить значение настройки по ключу
    function getSettingValueByKey(key: String): String; overload;

	// Получить значение настройки по ключу
    function getSettingValueByKey(key: String; date: TXSDate): String; overload;

    // Получить числовое значение настройки по ключу
    function getSettingIntValueByKey(key: String; date : TXSDate = nil): Integer;

    procedure generateMOLFilter(var molFilter: FINMolFilter; molCodes: String);

    //function selectRQOrg(var org: RQOrg; contrAgentType: Integer): Boolean;
    function selectRQOrg(out org: RQOrg; contrAgentType: Integer; const newOrg: RQOrg): Boolean;

    function getDocCatalogCodesRecursive(filterCatalogCode: Integer): String;

    // проверка наличия тарифных ставок на текущий год
    function checkConnectionTariff(): Boolean;

    // Получить кол-во с учетом коэффициента перевода
    function getFINMaterialConvertedQuantity(fmObject: FINMaterialsShort): Double;

    function getDFDocCommissionProtocol(docCode : Integer) : DFDocCommissionProtocol;
    // Возвращает является ли МОЛ складским или нет (то есть есть ли
    // для него склад с зонами хранения и ячейками)
    function isMolForStorage(molCode : String) : Boolean;

    // Возвращает IP и Port jboss-а
    function getBillingServerData(enDepartmentCode: Integer) : ArrayOfString;

    function checkActTypeForCountersStateVerification(act: ENAct): Boolean;
    {Получить объект User2Staffing связанный с текущим пользователем
    или nil если текущий пользователь не связан не с каким объектом
    User2Staffing}
	  function getUser2StaffingOfCurrentUser : User2Staffing;

    function getENDocAttachmentByCode(attCode : Integer) : ENDocAttachment;
    function getENDocAttachmentServerByCode(servCode : Integer) : ENDocAttachmentServer;
    procedure makeReportGraphviz(processResult: String; reportName: String; reportType: String);

    function getNormativeDocCatalogCodesRecursive(filterCatalogCode: Integer): String;
    function getProjectDocCatalogCodesRecursive(filterCatalogCode: Integer): String;
    function checkIfApprovalByCustomer(planCode: Integer): Boolean;

    procedure openENAttachment(attachmentCode: Integer; onlyActive: Boolean = false);

    function getENSOStringValueForServicesObject(servicesObjectCode: Integer; soValueTypeCode: Integer): String;
    function checkLandSheetStageForServicesObject(servicesObjectCode: Integer): Boolean;

    function getFINCehCodeByDepartmentCode(departmentCode : Integer) : WideString;

    function getTKmaterialsListFromRQOrder(rqOrderCode : Integer) : TKMaterialsShortList;

    //** определение кода услуги по коду заявки потребителя */
    function getServicesKindByServicesConsumerCode(servicesConsumerCode: Integer): DFDocServicesConsumerKind;

    function getStrCodePlanFromENServicesFromSide2enplanwork(EnServicesFromSideCode : Integer) : WideString;

    function getServicesObjectByPlanCodeElementAndEnTechCond(planCode : Integer): ENServicesObject;

    function getDFDocSignersForDoc(dfDocCode: Integer): DFDocSignerShortList;

    function isSignable(const anObject: TObject): Boolean;
    function getDocCodeForObject(const anObject: TObject): Integer;
    function getDocSubTypeForObject(const anObject: TObject): Integer;
    function getDocSignerTypesForObject(const anObject: TObject): DFDocSubtype2SignerTypeShortList;
    function getDefaultDocSignerForObject(const anObject: TObject; dfDocSignerType: Integer): User2Staffing;

    procedure initDFDocSignersGrid(const anObject: TObject;
                                   form: TDialogForm;
                                   sgDFDocSigners: TAdvStringGrid;
                                   setDefaultSigners: Boolean = true);
    procedure loadDFDocSigners(const anObject: TObject;
                               form: TDialogForm;
                               sgDFDocSigners: TAdvStringGrid);
    function checkDFDocSigners(sgDFDocSigners: TAdvStringGrid): Boolean;
    function getDFDocSignersForSaving(const anObject: TObject;
                                      form: TDialogForm;
                                      sgDFDocSigners: TAdvStringGrid;
                                      var dfDocSigners: ArrayOfDFDocSigner): Boolean;
    procedure chooseDFDocSigner(sgDFDocSigners: TAdvStringGrid; ACol, ARow: Integer);
    procedure fillDFDocsGrid(const anObject: TObject;
                             form: TDialogForm;
                             sgDFDocs: TAdvStringGrid);
    procedure setDFDocSignersGridProps(form: TDialogForm; sgDFDocSigners: TAdvStringGrid);
    procedure setDFDocsGridProps(form: TDialogForm; sgDFDocs: TAdvStringGrid);
    procedure setComponentPropsForDFDocsTab(form: TDialogForm;
      sgDFDocs, sgDFDocSigners: TAdvStringGrid);

    function printReportsForObject(const anObject: TObject; const allowDraft: Boolean = false): Boolean;

    function getDocDescription(docShort: DFDocShort): String;

    procedure openAttachmentsForDFDoc(dfDocCode: Integer);

    function isDocSignersOnHolidaysDescriptive(const dfDocSigners: ArrayOfDFDocSigner;
                                               const anObject: TObject): String;

    function getUser2StaffingByMolCode(molCode: String): User2Staffing;
    function getDFJobStatusFilterForDFDocMovement(const dfDocMovementCode: Integer;
      DFDocServicesConsumerObj: DFDocServicesConsumer): DFJobStatusFilter;
    function getUserFilterForDFDocNewRecipient(cehnazv: String): User2StaffingFilter;
    function getSumRQFKOrderItem(orderCode : Integer) : Double;

    function checkMoveToFK(servicesObjectCode: Integer): Boolean;

    function getLastVersionENIPItemCodeByActCode(actCode : Integer): Integer;
var

  end;

var
  DMReports: TDMReports;

function GetFileName(name: String): String;
function makeReport(reportName: String; argNames, args: ArrayOfString; reportType: String) : String; overload;
procedure makeReportAuth(reportName: String; argNames, args: ArrayOfString; reportType: String);


function makeReport(reportName: String; argNames, args: ArrayOfString; reportType: String; fileName : String) : String; overload;
procedure makeReportWithOutExecute(reportName: String; argNames, args: ArrayOfString; reportType: String; fileName : String); overload;
procedure makeReportWithExecute(reportName: String; argNames, args: ArrayOfString; reportType: String; fileName : String); overload;

implementation

uses {DMReportUnit, DialogFormUnit, }Forms, Controls, ShellAPI, Windows, Graphics,
  SetupFormUnit, LoginUnit, IniTools, Main, DlgUnit, Dialogs, Base64Unit,
  DateUtils, TypInfo, Globals,
  ENPlanWorkItemController,
  ENDepartment2EPRenController,
  ENRZAObjectController,
  ENSDTUObjectController,
  ENHumenItemController,
  TKTransportRealController,
  ENBuilderObjectController,
  ENPlanWorkKindController,
  ENEstimateItem2ENEstimateItemController
  ,ENEstimateItem2TypeController
  , ENPlanWorkStateController
  , ENTrptGPS2TrptRealController,
  ENTechCond2PlanWorkController, ENTechConditionsServicesController,
  ENGiveCounterController, ENTechConditionsObjectsController, {FINMolController ,}
  ENStandardConstEntryController,
  ENStandardConstController
  , AuthorizationController, DFRouteItemController, DFConsts, BaseUtilsUnit
  , ENSettingsValuesController, ChildFormUnit, ShowRQOrg,
  ENServices2PlanController, RQStorage2ENMolController,
  ENPlanWork2CCDamageLogController, ENSOValuesController
, DFProjectDocCatalogController, ENServFromSide2PlanWorkController,
  DFDocSubTypeController, RQFKOrder2DFDocController, DFDocAttachmentController,
  DFDocSignerTypeController, ShowUser2Staffing,
  GridHeadersUnit, ENAct2DFDocController, ENActIncomeTech2DFDocController,
  SCUsageInput2DFDocController,
  RQFKOrderItem2ENEstimateItemController, RQFKOrderItemRemainderController,
  EditPostings, ENReconstrModernOZ2DFDocController, Generics.Collections;

{$R *.dfm}

//const TempReportsPath = 'tempReports\';
const
_REPORTS_JAR_PATH = '/com/ksoe/energynet/reports/';
DOCFLOW_REPORTS_JAR_PATH = '/com/ksoe/docflow/reports/';


function TDMReports.getENActByCode(actCode: Integer): ENAct;
var
  TempENAct: ENActControllerSoapPort;
  act: ENAct;
begin
  TempENAct := HTTPRIOENAct as ENActControllerSoapPort;
  act := TempENAct.getObject(actCode);
  Result := act;
end;

function TDMReports.getENActByDocCode(docCode: Integer): ENAct;
var
  TempENAct2DFDoc: ENAct2DFDocControllerSoapPort;
  act2DFDocFilter: ENAct2DFDocFilter;
  act2DFDocArr: ENAct2DFDocController.ArrayOfInteger;
  act2DFDoc: ENAct2DFDoc;
begin
  Result := nil;
  if docCode <= 0 then Exit;

  act2DFDocFilter := ENAct2DFDocFilter.Create;
  SetNullIntProps(act2DFDocFilter);
  SetNullXSProps(act2DFDocFilter);

  act2DFDocFilter.dfDocCode := docCode;

  TempENAct2DFDoc := HTTPRIOENAct2DFDoc as ENAct2DFDocControllerSoapPort;
  act2DFDocArr := TempENAct2DFDoc.getScrollableFilteredCodeArray(act2DFDocFilter, 0, -1);

  if High(act2DFDocArr) > -1 then
  begin
    act2DFDoc := TempENAct2DFDoc.getObject(act2DFDocArr[0]);
    if (act2DFDoc <> nil) and
       (act2DFDoc.actRef <> nil) and
       (act2DFDoc.actRef.code <> LOW_INT) then
      Result := getENActByCode(act2DFDoc.actRef.code);
  end;
end;

function TDMReports.getENActIncomeTechConditionsByCode(
  actIncomeCode: Integer): ENActIncomeTechConditions;
var
  TempENActIncomeTechConditions: ENActIncomeTechConditionsControllerSoapPort;
begin
  TempENActIncomeTechConditions := HTTPRIOENActIncomeTechConditions as ENActIncomeTechConditionsControllerSoapPort;
  Result := TempENActIncomeTechConditions.getObject(actIncomeCode);
end;

function TDMReports.getENActIncomeTechConditionsByDocCode(
  docCode: Integer): ENActIncomeTechConditions;
var
  TempENActIncomeTech2DFDoc: ENActIncomeTech2DFDocControllerSoapPort;
  actIncome2DFDocFilter: ENActIncomeTech2DFDocFilter;
  actIncome2DFDocArr: ENActIncomeTech2DFDocController.ArrayOfInteger;
  actIncome2DFDoc: ENActIncomeTech2DFDoc;
begin
  Result := nil;
  if docCode <= 0 then Exit;

  actIncome2DFDocFilter := ENActIncomeTech2DFDocFilter.Create;
  SetNullIntProps(actIncome2DFDocFilter);
  SetNullXSProps(actIncome2DFDocFilter);

  actIncome2DFDocFilter.dfDocCode := docCode;

  TempENActIncomeTech2DFDoc := HTTPRIOENActIncomeTech2DFDoc as ENActIncomeTech2DFDocControllerSoapPort;
  actIncome2DFDocArr := TempENActIncomeTech2DFDoc.getScrollableFilteredCodeArray(actIncome2DFDocFilter, 0, -1);

  if High(actIncome2DFDocArr) > -1 then
  begin
    actIncome2DFDoc := TempENActIncomeTech2DFDoc.getObject(actIncome2DFDocArr[0]);
    if (actIncome2DFDoc <> nil) and
       (actIncome2DFDoc.actIncomeRef <> nil) and
       (actIncome2DFDoc.actIncomeRef.code <> LOW_INT) then
      Result := getENActIncomeTechConditionsByCode(actIncome2DFDoc.actIncomeRef.code);
  end;
end;

function TDMReports.getENDocAttachmentByCode(attCode : Integer) : ENDocAttachment;
var
  TempENDocAttachment : ENDocAttachmentControllerSoapPort;
begin
  Result := nil;

  if attCode = LOW_INT then Exit;

  TempENDocAttachment :=  HTTPRIOENDocAttachment as ENDocAttachmentControllerSoapPort;

  Result := ENDocAttachment.Create;
  SetNullIntProps(Result);
  SetNullXSProps(Result);

  Result := TempENDocAttachment.getObject(attCode);
end;

function TDMReports.getENDocAttachmentServerByCode(servCode : Integer) : ENDocAttachmentServer;
var
  TempENDocAttachmentServer : ENDocAttachmentServerControllerSoapPort;
begin
   Result := nil;

  if servCode = LOW_INT then Exit;

  TempENDocAttachmentServer :=  HTTPRIOENDocAttachmentServer as ENDocAttachmentServerControllerSoapPort;

  Result := ENDocAttachmentServer.Create;
  SetNullIntProps(Result);
  SetNullXSProps(Result);

  Result := TempENDocAttachmentServer.getObject(servCode);

end;

function TDMReports.getENReconstrModernOZByCode(
  ozCode: Integer): ENReconstrModernOZ;
var
  TempENReconstrModernOZ: ENReconstrModernOZControllerSoapPort;
begin
  TempENReconstrModernOZ := HTTPRIOENReconstrModernOZ as ENReconstrModernOZControllerSoapPort;
  Result := TempENReconstrModernOZ.getObject(ozCode);
end;

function TDMReports.getENReconstrModernOZByDocCode(docCode: Integer): ENReconstrModernOZ;
var
  TempENReconstrModernOZ2DFDoc: ENReconstrModernOZ2DFDocControllerSoapPort;
  oz2DFDocFilter: ENReconstrModernOZ2DFDocFilter;
  oz2DFDocArr: ENReconstrModernOZ2DFDocController.ArrayOfInteger;
  oz2DFDoc: ENReconstrModernOZ2DFDoc;
begin
  Result := nil;
  if docCode <= 0 then Exit;

  oz2DFDocFilter := ENReconstrModernOZ2DFDocFilter.Create;
  SetNullIntProps(oz2DFDocFilter);
  SetNullXSProps(oz2DFDocFilter);

  oz2DFDocFilter.dfDocCode := docCode;

  TempENReconstrModernOZ2DFDoc := HTTPRIOENReconstrModernOZ2DFDoc as ENReconstrModernOZ2DFDocControllerSoapPort;
  oz2DFDocArr := TempENReconstrModernOZ2DFDoc.getScrollableFilteredCodeArray(oz2DFDocFilter, 0, -1);

  if High(oz2DFDocArr) > -1 then
  begin
    oz2DFDoc := TempENReconstrModernOZ2DFDoc.getObject(oz2DFDocArr[0]);
    if (oz2DFDoc <> nil) and
       (oz2DFDoc.enReconstrModernOzRef <> nil) and
       (oz2DFDoc.enReconstrModernOzRef.code <> LOW_INT) then
      Result := getENReconstrModernOZByCode(oz2DFDoc.enReconstrModernOzRef.code);
  end;
end;

function TDMReports.getENSOStringValueForServicesObject(servicesObjectCode,
  soValueTypeCode: Integer): String;
var
  TempENSOValues: ENSOValuesControllerSoapPort;
  soValuesObj: ENSOValues;
begin
  Result := '';

  TempENSOValues := HTTPRIOENSOValues as ENSOValuesControllerSoapPort;
  soValuesObj := TempENSOValues.getENSOValueForServicesObject(servicesObjectCode, soValueTypeCode);

  if soValuesObj = nil then Exit;
  Result := soValuesObj.strVal;
end;

function TDMReports.getUser2StaffingByMolCode(molCode: String): User2Staffing;
var
  user2StaffFilter: User2StaffingFilter;
  TempUser2Staffing: User2StaffingControllerSoapPort;
  user2StaffArr: User2StaffingController.ArrayOfInteger;
  TempENMol: ENMolControllerSoapPort;
  molFilter: ENMolFilter;
  molList: ENMolShortList;
  tabNumber: String;
begin
  Result := nil;

  if Trim(molCode) = '' then Exit;

  TempENMol := HTTPRIOENMol as ENMolControllerSoapPort;
  molFilter := ENMolFilter.Create;
  SetNullXSProps(molFilter);
  SetNullIntProps(molFilter);
  molFilter.finCode := molCode;
  molList := TempENMol.getScrollableFilteredList(molFilter, 0, -1);

  if (molList = nil) or (High(molList.list) < 0) then
    Exit;

  tabNumber := Trim(molList.list[0].tabNumber);
  if tabNumber = '' then
    Exit;

  TempUser2Staffing := HTTPRIOUser2Staffing as User2StaffingControllerSoapPort;
  user2StaffFilter := User2StaffingFilter.Create;
  SetNullIntProps(user2StaffFilter);
  SetNullXSProps(user2StaffFilter);
  user2StaffFilter.tabNumber := tabNumber;
	user2StaffArr := TempUser2Staffing.getScrollableFilteredCodeArray(user2StaffFilter, 0, -1);

  if High(user2StaffArr) > -1 then
    Result := TempUser2Staffing.getObject(user2StaffArr[0]);
end;

function TDMReports.getUser2StaffingOfCurrentUser : User2Staffing;
var
  user2StaffFilter : User2StaffingFilter;
  TempUser2Staffing : User2StaffingControllerSoapPort;
  user2StaffArr : User2StaffingController.ArrayOfInteger;
  user2StaffingObj : User2Staffing;
begin
  user2StaffingObj := nil;
  TempUser2Staffing := HTTPRIOUser2Staffing as User2StaffingControllerSoapPort;
  user2StaffFilter := User2StaffingFilter.Create;
  SetNullIntProps(user2StaffFilter);
  SetNullXSProps(user2StaffFilter);

  user2StaffFilter.conditionSQL := ' user2staffing.usercode = (select s.usercode from user2staffing s, auth_user u ' +
    ' where u.user_code = s.usercode and u.user_name = ''' + HTTPRIOUser2Staffing.HTTPWebNode.UserName + ''')';

	user2StaffArr := TempUser2Staffing.getScrollableFilteredCodeArray(user2StaffFilter, 0, -1);

  if High(user2StaffArr) > -1 then
    user2StaffingObj := TempUser2Staffing.getObject(user2StaffArr[0]);

  Result := user2StaffingObj;

end;

function TDMReports.getUserFilterForDFDocNewRecipient(cehnazv: String): User2StaffingFilter;
var
  userFilter : User2StaffingFilter;
  tabNumbersFromRoutes : string;
begin
  userFilter := User2StaffingFilter.Create();
  SetNullXSProps(userFilter);
  SetNullIntProps(userFilter);

  tabNumbersFromRoutes := '';
  tabNumbersFromRoutes := DMReports.getTabnumbersFromRoutes(HTTPRIODFDocMovement.HTTPWebNode.UserName);

  if (cehnazv <> '') then
  begin
    if tabNumbersFromRoutes = '' then
          userFilter.conditionSQL := ' user2staffing.cehnazv = ''' + cehnazv + '''' +
      ' and user2staffing.xoe = ' + IntToStr(YES) +
      ' and user2staffing.usercode in ( ' +
      ' select u.user_code from auth_user u where u.statuscode = ' + IntToStr(USER_STATUS_LEGAL) + ')'
    else
    userFilter.conditionSQL := ' user2staffing.cehnazv = ''' + cehnazv + '''' +
      ' and user2staffing.xoe = ' + IntToStr(YES) +
      ' and user2staffing.usercode in ( ' +
      ' select u.user_code from auth_user u where u.statuscode = ' + IntToStr(USER_STATUS_LEGAL) + ')' +
      ' or user2staffing.tabnumber in (' + tabNumbersFromRoutes + ')';
  end
  else
    userFilter.conditionSQL := ' user2staffing.xoe = ' + IntToStr(YES) +
      ' and user2staffing.usercode in ( ' +
      ' select u.user_code from auth_user u where u.statuscode = ' + IntToStr(USER_STATUS_LEGAL) + ')';

  userFilter.orderBySQL := ' fio';

  Result := userFilter;
end;

function TDMReports.isMolForStorage(molCode: String): Boolean;
var
	TempENMol : ENMolControllerSoapPort;
  molFilter : ENMolFilter;
  molList : ENMolShortList;

  TempRQStorage2ENMol : RQStorage2ENMolControllerSoapPort;
  somoFilter : RQStorage2ENMolFilter;
  somoList : RQStorage2ENMolShortList;
begin
	TempENMol := HTTPRIOENMol as ENMolControllerSoapPort;
  molFilter := ENMolFilter.Create;
  SetNullXSProps(molFilter);
  SetNullIntProps(molFilter);
  molFilter.finCode := molCode;
  molList := TempENMol.getScrollableFilteredList(molFilter, 0, -1);
  if molList.totalCount = 0 then begin
    Result := false;
  end else begin
    TempRQStorage2ENMol := HTTPRIORQStorage2ENMol as RQStorage2ENMolControllerSoapPort;
    somoFilter := RQStorage2ENMolFilter.Create;
    SetNullXSProps(somoFilter);
    SetNullIntProps(somoFilter);
    somoFilter.molRef := ENMolRef.Create;
    somoFilter.molRef.code := molList.list[0].code;
    somoList := TempRQStorage2ENMol.getScrollableFilteredList(somoFilter, 0, -1);
    Result := somoList.totalCount > 0;
  end;
end;

function TDMReports.getSettingIntValueByKey(key: String; date : TXSDate = nil): Integer;
var strResult : String;
begin
	strResult := Self.getSettingValueByKey(key, nil);
  if Length(Trim(strResult)) > 0 then Result := StrToInt(strResult);
end;

function TDMReports.getSettingValueByKey(key: String): String;
//var TempENSettingsValues : ENSettingsValuesControllerSoapPort;
begin //Исключено объявление не используемых переменных
	Result := Self.getSettingValueByKey(key, nil);
end;

function TDMReports.getSettingValueByKey(key: String; date: TXSDate): String;
var
	TempENSettingsValues : ENSettingsValuesControllerSoapPort;
begin
	TempENSettingsValues := HTTPRIOENSettingsValues as ENSettingsValuesControllerSoapPort;
  if Assigned(date) then begin
    Result := TempENSettingsValues.getValue(key, date);
  end else begin
    Result := TempENSettingsValues.getValue(key);
  end;


end;

function TDMReports.getDefaultDocSignerForObject(const anObject: TObject;
  dfDocSignerType: Integer): User2Staffing;
var
  TempDFDoc: DFDocControllerSoapPort;
begin
  TempDFDoc := HTTPRIODFDoc as DFDocControllerSoapPort;
  Result := TempDFDoc.getDefaultDocSignerForObject(anObject, dfDocSignerType);
end;

function TDMReports.getDefaultZones() : TArray<String>;
{
Функция возвращает допустимые значения зонностей для счетчиков
}
var strings : TArray<String>;
begin

SetLength(strings, 3);
strings[0] := '1';
strings[1] := '2';
strings[2] := '3';
Result := strings;

end;
procedure TDMReports.SetCounterZonesForCombo(combo: TComboBox);
{
Метод для заполнения значениями зонностей комбобокса
}
begin
	if combo.Items = nil then combo.Items := TStrings.Create;
	combo.Items.Clear;
	combo.Items.Add('');
	combo.Items.AddStrings(getDefaultZones());
	combo.ItemIndex := -1;
end;

procedure TDMReports.setDFDocsGridProps(form: TDialogForm;
  sgDFDocs: TAdvStringGrid);
begin
  SetGridHeaders(DFDocHeaders, sgDFDocs.ColumnHeaders);
end;

procedure TDMReports.setDFDocSignersGridProps(form: TDialogForm;
  sgDFDocSigners: TAdvStringGrid);
begin
  SetGridHeaders(DFDocSignerHeaders, sgDFDocSigners.ColumnHeaders);

  sgDFDocSigners.Options := sgDFDocSigners.Options - [goColMoving];
  sgDFDocSigners.SortSettings.Show := false;

  if form.DialogState <> dsView then
  begin
    sgDFDocSigners.OnCanEditCell := sgDFDocSignersCanEditCell;
    sgDFDocSigners.OnEllipsClick := sgDFDocSignersEllipsClick;
    sgDFDocSigners.OnGetEditorType := sgDFDocSignersGetEditorType;
  end
  else
    sgDFDocSigners.OnCanEditCell := sgDFDocSignersCanEditCellViewMode;
end;

function TDMReports.checkTransformatorsForRawInAct(actCode : Integer) : Boolean;
var
  TempENEstimateItem : ENEstimateItemControllerSoapPort;
  estimateFilter : ENEstimateItemFilter;
  estimateCodes : ENEstimateItemController.ArrayOfInteger;
begin
    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    estimateFilter := ENEstimateItemFilter.Create;
    SetNullXSProps(estimateFilter);
    SetNullIntProps(estimateFilter);

    estimateFilter.conditionSQL := ' exists (select ' +
                                    ' 1 ' +
                                    ' from enact as ac ' +
                                    ' inner join enact2enplanwork as acpw on acpw.actrefcode = ac.code ' +
                                    ' inner join enplanwork as pw on acpw.plancode = pw.code ' +
                                    ' inner join enestimateitem as es on pw.code = es.planrefcode ' +
                                    ' inner join finmaterials as ma on es.code = ma.estimateitemrefcode ' +
                                    ' inner join tempnomenclatures as temo on temo.mat_id = ma.mat_id ' +
                                    ' inner join tkmaterials as mat on temo.materialrefcode = mat.code ' +
                                    ' inner join finmaterials as ma_p on ma.code = ma_p.parentrefcode ' +
                                    ' inner join enestimateitem as es_p on ma_p.estimateitemrefcode = es_p.code ' +
                                    ' where ' +
                                    ' ma.statusrefcode = ' + IntToStr(FINMATERIALSSTATUS_GOOD) +
                                    ' and es.code = ENESTIMATEITEM.CODE ' +
                                    ' and mat.rootgrouprefcode =  ' + IntToStr(TKMATERIALS_TRANSFORMATORS_GROUP) +
                                    ' and es_p.kindrefcode = ' + IntToStr(ENESTIMATEITEMKIND_DISMOUNT) +
                                    ' and ac.code = ' + IntToStr(actCode) + ')';

    estimateCodes := TempENEstimateItem.getFilteredCodeArray(estimateFilter, 0, -1);

    Result := Length(estimateCodes) > 0;
end;


function TDMReports.checkTransformatorsForRawInPlan(planCode : Integer) : Boolean;
var
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  planFilter : ENPlanWorkFilter;
  planCodes : ENPlanWorkController.ArrayOfInteger;
begin
  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  planFilter := ENPlanWorkFilter.Create;
  SetNullXSProps(planFilter);
  SetNullIntProps(planFilter);

  planFilter.conditionSQL := 'enplanwork.code in ( ' +
    ' select pw.code from enplanwork pw ' +
    ' inner join enestimateitem as es on pw.code = es.planrefcode ' +
    ' inner join finmaterials as ma on es.code = ma.estimateitemrefcode ' +
    ' inner join tempnomenclatures as temo on temo.mat_id = ma.mat_id ' +
    ' inner join tkmaterials as mat on temo.materialrefcode = mat.code ' +
    ' inner join finmaterials as ma_p on ma.code = ma_p.parentrefcode ' +
    ' inner join enestimateitem as es_p on ma_p.estimateitemrefcode = es_p.code ' +
    ' where ma.statusrefcode = ' + IntToStr(FINMATERIALSSTATUS_GOOD) +
    ' and pw.code = ' + IntToStr(planCode) +
    ' and mat.rootgrouprefcode = ' + IntToStr(TKMATERIALS_TRANSFORMATORS_GROUP) +
    ' and es_p.kindrefcode = ' + IntToStr(ENESTIMATEITEMKIND_DISMOUNT) + ')';

  planCodes := TempENPlanWork.getFilteredCodeArray(planFilter);
  Result := Length(planCodes) > 0;
end;


function TDMReports.getPrevTravelSheet(obj : ENTravelSheet) : ENTravelSheet;
var
   TempENTravelSheet: ENTravelSheetControllerSoapPort;
   //out_ : ENTravelSheet;
begin
   TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
   Result := TempENTravelSheet.getPrevSheet(obj);
end;

function TDMReports.getNextTravelSheet(obj : ENTravelSheet) : ENTravelSheet;
var
   TempENTravelSheet: ENTravelSheetControllerSoapPort;
   //out_ : ENTravelSheet;
begin
   TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
   Result := TempENTravelSheet.getNextSheet(obj);
end;

function TDMReports.getLastTravelSheet(obj : ENTravelSheet) : ENTravelSheet;
var
   TempENTravelSheet: ENTravelSheetControllerSoapPort;
   //out_ : ENTravelSheet;
begin
   TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
   Result := TempENTravelSheet.getLastSheet(obj);
end;

{
function TDMReports.getPrevTravelSheet(obj : ENTravelSheet) : ENTravelSheet;
var
   TempENTravelSheet: ENTravelSheetControllerSoapPort;
   f : ENTravelSheetFilter;
   tsList : ENTravelSheetShortList;
   out_ : ENTravelSheet;
   sql : string;
begin
   f := ENTravelSheetFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.transportReal := TKTransportReal.Create;
   f.transportReal.code := obj.transportReal.code;

   sql := '';

   if (obj.code > LOW_INT) then
      AddCondition(sql, 'code <> ' + IntToStr(obj.code));

   //AddCondition(sql, 'datestart <= to_date(''' + DateToStr(EncodeDate(Obj.dateStart.Year,Obj.dateStart.Month,Obj.dateStart.Day)) + ''', ''dd.MM.yyyy'')');
   //AddCondition(sql, 'datefinal <= to_date(''' + DateToStr(EncodeDate(Obj.dateStart.Year,Obj.dateStart.Month,Obj.dateStart.Day)) + ''', ''dd.MM.yyyy'')');

   f.conditionSQL := sql;
   f.orderBySQL := 'datestart desc, to_char(timestart, ''HHMI'')';


   TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
   tsList := TempENTravelSheet.getScrollableFilteredList(f, 0, 1);
   if tsList.totalCount > 0 then
   begin
     out_ := TempENTravelSheet.getObject(tsList.list[0].code);
     Result := out_;
   end
   else
     Result := nil;
end;
}

procedure TDMReports.exportGrid(grid : TAdvStringGrid; outName : string);
var AppPath, FileName: String;
    OldCursor: TCursor;
begin
  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;

    AppPath := ExtractFilePath(Application.ExeName);
    if not DirectoryExists(AppPath + TempReportsPath) then
      CreateDir(AppPath + TempReportsPath);
    FileName := AppPath + TempReportsPath + GetFileName(outName) + '.xls';
    toExcel.AdvStringGrid := grid;
    toExcel.XLSExport(FileName);
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

procedure TDMReports.fillDFDocsGrid(const anObject: TObject; form: TDialogForm;
  sgDFDocs: TAdvStringGrid);
var
  TempDFDoc: DFDocControllerSoapPort;
  DFDocList: DFDocShortList;
  docFilter: DFDocFilter;
  i, r, docCode, docsLastCount: Integer;
begin
  if form.DialogState = dsInsert then Exit;
  if anObject = nil then Exit;

  form.ClearGrid(sgDFDocs);

  docCode := getDocCodeForObject(anObject);
  if docCode <= 0 then Exit;

  TempDFDoc := HTTPRIODFDoc as DFDocControllerSoapPort;

  docFilter := DFDocFilter.Create;
  SetNullIntProps(docFilter);
  SetNullXSProps(docFilter);

  docFilter.conditionSQL := 'docs.doccode = ' + IntToStr(docCode);
  //docFilter.orderBySQL := ' 1 DESC';

  DFDocList := TempDFDoc.getLightDocFilteredList(docFilter, 0, -1);

  docsLastCount := High(DFDocList.list);
  if docsLastCount > -1 then
    sgDFDocs.RowCount := docsLastCount + 2
  else
    sgDFDocs.RowCount := 2;

  with sgDFDocs do
    for i := 0 to docsLastCount do
    begin
      // Application.ProcessMessages;
      if DFDocList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(DFDocList.list[i].code)
      else
        Cells[0,i+1] := '';

      Cells[1,i+1] := DFDocList.list[i].docNum;

      if DFDocList.list[i].dateRegistration = nil then
        Cells[2,i+1] := ''
      else
        Cells[2,i+1] := XSDate2String(DFDocList.list[i].dateRegistration);

      Cells[3,i+1] := getDocDescription(DFDocList.list[i]);

      Cells[4,i+1] := DFDocList.list[i].docTypeRefName;
      Cells[5,i+1] := DFDocList.list[i].resultRefName;
      Cells[6,i+1] := DFDocList.list[i].userAdd;
      Cells[7,i+1] := IntToStr(DFDocList.list[i].docTypeRefCode);

      if DFDocList.list[i].isRed > 0 then
      begin
        with sgDFDocs do
        for r:=0 to sgDFDocs.ColCount-1 do
        begin
          FontStyles[r,i+1] := FontStyles[r,i+1] + [fsBold];
          sgDFDocs.RowFontColor[i + 1] := clRed;
        end;
      end
      else begin
        with sgDFDocs do
        for r:=0 to sgDFDocs.ColCount-1 do
        begin
          FontStyles[r,i+1] := FontStyles[r,i+1] - [fsBold];
          sgDFDocs.RowFontColor[i + 1] := clWindowText;
        end;
      end;

      sgDFDocs.RowCount := i + 2;
    end;

  sgDFDocs.Row := 1;
end;

function TDMReports.finExecutorShort2finExecutor(const shortObj: FINExecutorShort;
  const fullName: String): FINExecutor;
begin
  Result := FINExecutor.Create();

  Result.code := LOW_INT;

  Result.name := fullName; //getFullExecutorName(tvDep.Selected) ; //shortObj.name;
  Result.finCode := shortObj.finCode;
  Result.finTypeName := shortObj.finTypeName;
  Result.finTypeCode := shortObj.finTypeCode;
  Result.finKindName := shortObj.finKindName;
  Result.finKindCode := shortObj.finKindCode;
  Result.finCehName := shortObj.finCehName;
  Result.finCehCode := shortObj.finCehCode;

  Result.axOrgId := shortObj.axOrgId;
  Result.axParentOrgId := shortObj.axParentOrgId;
  Result.axParentOrgName := shortObj.axParentOrgName;
  Result.axOrgTypeId := shortObj.axOrgTypeId;
  Result.axOrgTypeName := shortObj.axOrgTypeName;
end;


function GetFileName(name: String): String;
var y, m, d, h, mm, s, ms: Word;
    name_ : String;
  function AddZero(value: Word): String;
  begin
    if value < 10 then
      Result:='0'+IntToStr(value)
    else
      Result:=IntToStr(value);
  end;

begin
  //ShowMessage(name+DateToStr(Date)+TimeToStr(Time));
  DecodeTime(Time,h,mm,s,ms);
  DecodeDate(Date,y,m,d);
  name_:= name;
  while pos('/', name_) > 0 do
  begin
     name_ := copy(name_, pos('/', name_) + 1 ,length(name_) - pos('/', name_));
  end;

 // name := copy(name, pos('/', name) + 1 ,length(name) - pos('/', name));

  Result:=name_+
          '_' +
          AddZero(d)+
          AddZero(m)+
          Copy(IntToStr(y),3,2)+
          AddZero(h)+
          AddZero(mm)+
          AddZero(s)+
          AddZero(ms);
end;

function renderPeriodDescription(dayOfCalculation: Integer;
                                 periodEndDate: TDateTime): String;
var m1, y1, m2, y2, //d1, d2,
    monthOfCalculation, yearOfCalculation,
    startDateDay, endDateDay, daysCountInPrevMonth: Integer;
    startDate, endDate: TDateTime;
begin

  monthOfCalculation := MonthOf(periodEndDate);
  yearOfCalculation := YearOf(periodEndDate);

  if monthOfCalculation > 1 then
  begin
    m1 := monthOfCalculation - 1;
    y1 := yearOfCalculation;
  end
  else begin
    m1 := 12;
    y1 := yearOfCalculation - 1;
  end;

  daysCountInPrevMonth := DaysInMonth(EncodeDate(y1,m1,1));

  if dayOfCalculation + 1 > daysCountInPrevMonth then
    startDateDay := daysCountInPrevMonth
  else
    startDateDay := dayOfCalculation + 1;

  startDate := EncodeDate(y1,m1,startDateDay);

  m2 := monthOfCalculation;
  y2 := yearOfCalculation;

  if dayOfCalculation > DaysInMonth(EncodeDate(y2,m2,1)) then
    endDateDay := DaysInMonth(EncodeDate(y2,m2,1))
  else
    endDateDay := dayOfCalculation;

  endDate := EncodeDate(y2,m2,endDateDay);

  Result := 'з ' + DateToStr(startDate) + ' по ' + DateToStr(endDate);

end;

function TDMReports.getFINDocCodeByWorkOrderCode2(molData : FINMolData; operationType : Integer) : FINDoc2MolData;
var
  TempMOLData2: FINDoc2MolDataControllerSoapPort;
  //i: Integer;
  l: FINDoc2MolDataShortList;
  f : FINDoc2MolDataFilter;
  out_ : FINDoc2MolData;
begin
// qqqqqqqqqqq
  f := FINDoc2MolDataFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.molData := FINMolData.Create;
  f.molData.code := molData.code;

  f.finDocTypeRef := FINDocTypeRef.Create;
  f.finDocTypeRef.code := operationType;

  //f.conditionSQL := '';

  TempMOLData2 :=  HTTPRIOFINDoc2MolData as FINDoc2MolDataControllerSoapPort;
  l := TempMOLData2.getScrollableFilteredList(f,0,-1);
  out_ := FINDoc2MolData.Create;
  SetNullIntProps(out_);
  SetNullXSProps(out_);

  if l.totalCount > 0 then
    out_ := TempMOLData2.getObject(l.list[0].code);


  Result := out_;

end;

function TDMReports.getFINMaterialConvertedQuantity(fmObject: FINMaterialsShort): Double;
var axFactor, fmQuantity: Double;
begin
  Result := 0;

  if fmObject.quantity = nil then Exit;

  try
    fmQuantity := StrToFloat(fmObject.quantity.DecimalString);
  except
    on EConvertError do Exit;
  end;

  Result := fmQuantity;
  axFactor := 1;

  if fmObject.axFactor <> nil then
  begin
    try
      axFactor := StrToFloat(fmObject.axFactor.DecimalString);
    except on EConvertError do
      Exit;
    end;
  end;

  if axFactor > 0 then
    Result := Conv(fmQuantity / axFactor, 6);
end;

function TDMReports.getDepartmentCodesDown(departmentCode : Integer): String ;
var
  TempENDepartment: ENDepartmentControllerSoapPort;
  out_ : string;
begin

  TempENDepartment :=  HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
  out_ := TempENDepartment.getDepartmentCodesDown(departmentCode);
  if Length(out_) = 0 then
    out_ :=  IntToStr(departmentCode);

  Result := out_;

end;

function TDMReports.getAXDepartmentCodesDown(departmentCode: Integer): String;
var
  TempENDepartment: ENDepartmentControllerSoapPort;
  dep: ENDepartment;
  out_: String;
begin
  TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
  out_ := TempENDepartment.getAXDepartmentCodesDown(departmentCode);

  if Length(out_) = 0 then
  begin
    dep := TempENDepartment.getObject(departmentCode);
    out_ := dep.hrmorganizationid;
  end;

  Result := out_;
end;

function TDMReports.getPlanItemCodes(planCode : Integer): String ;
var
  TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
  f : ENPlanWorkItemFilter;
  l :  ENPlanWorkItemShortList;
  i : integer;
  out_ : string;
begin
  f:= ENPlanWorkItemFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.planRef := ENPlanWorkRef.Create;
  f.planRef.code := planCode;
  f.conditionSQL := 'enplanworkitem.countgen <> 0 ';

  TempENPlanWorkItem :=  HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
  l := TempENPlanWorkItem.getScrollableFilteredList(f, 0, -1);
  out_ := '';
  for i:=0 to High(l.list) do
  begin
      AddListPos(out_, IntToStr(l.list[i].code));
  end;

  if Length(out_) = 0 then out_ := IntTostr(LOW_INT);

  Result := out_;

end;


function TDMReports.getMOLData(workOrderCode : Integer; molTypeCode : Integer ) : FINMolData;
var
   TempMOLData: FINMolDataControllerSoapPort;
   //TempMOLData2: FINDoc2MolDataControllerSoapPort;
   f : FINMolDataFilter;
   l : FINMolDataShortList;
begin
   f :=  FINMolDataFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.molTypeRef := FINMolTypeRef.Create;
   f.molTypeRef.code := molTypeCode;
   f.workOrder := ENWorkOrder.Create;
   f.workOrder.code := workOrderCode;

   //f.conditionSQL := ' finmoldata.code in (select FINDOC2MOLDATA.MOLDATACODE from FINDOC2MOLDATA where FINDOC2MOLDATA.WORKORDERCODE = '+ IntToStr(workOrderCode) +' )';
   TempMOLData := HTTPRIOFINMolData as FINMolDataControllerSoapPort;
   l := TempMOLData.getScrollableFilteredList(f,0,1);
   if l.totalCount > 0 then
     Result := TempMOLData.getObject(l.list[0].code)
   else
     Result := nil;

end;


function TDMReports.getRQOrder(orderCode : Integer): RQOrder;
var
   TempRQOrder: RQOrderControllerSoapPort;
begin
//HTTPRIOTemp
   TempRQOrder :=  HTTPRIOTemp as RQOrderControllerSoapPort;
   Result :=  TempRQOrder.getObject(orderCode);
   //TempRQOrder._Release;
end;

function TDMReports.getLine04ByElement(elementCode : Integer): ENLine04;
var
    TempENLine04: ENLine04ControllerSoapPort;
    obj : ENLine04;
    f : ENLine04Filter;
    l : ENLine04ShortList;
begin
    // определим тип элемента по коду
    // и вызовм НУЖНЫЙ метод ... - чтоб левые юзера не планировали на правые обьекты
    TempENLine04 := HTTPRIOENLine04 as ENLine04ControllerSoapPort;
    f := ENLine04Filter.Create;
    SetNullIntProps(f);
    SetNullXSProps(f);
    f.element := ENElement.Create;
    f.element.code := elementCode;
    l := TempENLine04.getScrollableFilteredList(f,0,-1);
    if l.totalCount > 0 then
      obj := TempENLine04.getObject(l.list[0].code)
    else
      obj := nil;
    result := obj;
end;


function TDMReports.getLine10ByElement(elementCode : Integer): ENLine10;
var
    TempENLine10: ENLine10ControllerSoapPort;
    obj : ENLine10;
    f : ENLine10Filter;
    l : ENLine10ShortList;
begin
    // определим тип элемента по коду
    // и вызовм НУЖНЫЙ метод ... - чтоб левые юзера не планировали на правые обьекты
    TempENLine10 := HTTPRIOENLine10 as ENLine10ControllerSoapPort;
    f := ENLine10Filter.Create;
    SetNullIntProps(f);
    SetNullXSProps(f);
    f.element := ENElement.Create;
    f.element.code := elementCode;
    l := TempENLine10.getScrollableFilteredList(f,0,-1);
    if l.totalCount > 0 then
      obj := TempENLine10.getObject(l.list[0].code)
    else
      obj := nil;
    result := obj;
end;


function TDMReports.getLineCableByElement(elementCode : Integer): ENLineCable;
var
    TempENLineCable: ENLineCableControllerSoapPort;
    obj : ENLineCable;
    f : ENLineCableFilter;
    l : ENLineCableShortList;
begin
    // определим тип элемента по коду
    // и вызовм НУЖНЫЙ метод ... - чтоб левые юзера не планировали на правые обьекты
    TempENLineCable := HTTPRIOENLineCable as ENLineCableControllerSoapPort;
    f := ENLineCableFilter.Create;
    SetNullIntProps(f);
    SetNullXSProps(f);
    f.element := ENElement.Create;
    f.element.code := elementCode;
    l := TempENLineCable.getScrollableFilteredList(f,0,-1);
    if l.totalCount > 0 then
      obj := TempENLineCable.getObject(l.list[0].code)
    else
      obj := nil;
    result := obj;
end;


function TDMReports.getSubstation04ByElement(elementCode : Integer): ENSubstation04;
var
    TempENSubstation04: ENSubstation04ControllerSoapPort;
    obj : ENSubstation04;
    f : ENSubstation04Filter;
    l : ENSubstation04ShortList;
begin
    // определим тип элемента по коду
    // и вызовм НУЖНЫЙ метод ... - чтоб левые юзера не планировали на правые обьекты
    TempENSubstation04 := HTTPRIOENSubstation04 as ENSubstation04ControllerSoapPort;
    f := ENSubstation04Filter.Create;
    SetNullIntProps(f);
    SetNullXSProps(f);
    f.element := ENElement.Create;
    f.element.code := elementCode;
    l := TempENSubstation04.getScrollableFilteredList(f,0,-1);
    if l.totalCount > 0 then
      obj := TempENSubstation04.getObject(l.list[0].code)
    else
      obj := nil;
    result := obj;
end;

function TDMReports.getLine150ByElement(elementCode : Integer): ENLine150;
var
    TempENLine150: ENLine150ControllerSoapPort;
    obj : ENLine150;
    f : ENLine150Filter;
    l : ENLine150ShortList;
begin
    // определим тип элемента по коду
    // и вызовм НУЖНЫЙ метод ... - чтоб левые юзера не планировали на правые обьекты
    TempENLine150 := HTTPRIOENLine10 as ENLine150ControllerSoapPort;
    f := ENLine150Filter.Create;
    SetNullIntProps(f);
    SetNullXSProps(f);
    f.element := ENElement.Create;
    f.element.code := elementCode;
    l := TempENLine150.getScrollableFilteredList(f,0,-1);
    if l.totalCount > 0 then
      obj := TempENLine150.getObject(l.list[0].code)
    else
      obj := nil;
    result := obj;
end;

function TDMReports.getSubstation150ByElement(elementCode : Integer): ENSubstation150;
var
    TempENSubstation150: ENSubstation150ControllerSoapPort;
    obj : ENSubstation150;
    f : ENSubstation150Filter;
    l : ENSubstation150ShortList;
begin
    // определим тип элемента по коду
    // и вызовм НУЖНЫЙ метод ... - чтоб левые юзера не планировали на правые обьекты
    TempENSubstation150 := HTTPRIOENSubstation150 as ENSubstation150ControllerSoapPort;
    f := ENSubstation150Filter.Create;
    SetNullIntProps(f);
    SetNullXSProps(f);
    f.element := ENElement.Create;
    f.element.code := elementCode;
    l := TempENSubstation150.getScrollableFilteredList(f,0,-1);
    if l.totalCount > 0 then
      obj := TempENSubstation150.getObject(l.list[0].code)
    else
      obj := nil;
    result := obj;
end;

function TDMReports.getPlanByCode(planCode : Integer): ENPlanWork ;
var
    TempENPlanWork: ENPlanWorkControllerSoapPort;
    //TempENElement: ENElementControllerSoapPort;
    //element : ENElement;
    //plan : ENPlanWork;
begin
    // определим тип элемента по коду
    // и вызовм НУЖНЫЙ метод ... - чтоб левые юзера не планировали на правые обьекты
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
    result := TempENPlanWork.getObject(planCode);
    //result := element.typeRef.code;
end;

function TDMReports.getPlanShortByCode(planCode : Integer): ENPlanWorkShort ;
var
    TempENPlanWork: ENPlanWorkControllerSoapPort;
    f : ENPlanWorkFilter;
    l : ENPlanWorkShortList;

    //TempENElement: ENElementControllerSoapPort;
    //element : ENElement;
    //plan : ENPlanWork;
begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
    f := ENPlanWorkFilter.Create;
    SetNullIntProps(f);
    SetNullXSProps(f);
    f.code := planCode;
    l := TempENPlanWork.getScrollableFilteredList(f, 0, -1);

    result := l.list[0];
    //result := element.typeRef.code;
end;


function TDMReports.getPlanByEstimateCode(estimateCode : Integer): ENPlanWork ;
var
    TempENPlanWork: ENPlanWorkControllerSoapPort;
    TempENEstimate: ENEstimateItemControllerSoapPort;
    eObj : ENEstimateItem;
    //TempENElement: ENElementControllerSoapPort;
    //element : ENElement;
    //plan : ENPlanWork;
begin
    result := nil;
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
    TempENEstimate := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    eObj := TempENEstimate.getObject(estimateCode);
    if (eObj = nil) then Exit;
    result := TempENPlanWork.getObject(eObj.planRef.code);
    //result := element.typeRef.code;
end;

function TDMReports.getElementTypeByPlan(planCode : Integer):Integer;
var
    TempENPlanWork: ENPlanWorkControllerSoapPort;
    TempENElement: ENElementControllerSoapPort;
    element : ENElement;
    plan : ENPlanWork;
begin
    // определим тип элемента по коду
    // и вызовм НУЖНЫЙ метод ... - чтоб левые юзера не планировали на правые обьекты
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
    plan := TempENPlanWork.getObject(planCode);

    TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;
    element := TempENElement.getObject(plan.elementRef.code);
    result := element.typeRef.code;
end;

function TDMReports.getElementTypeByPlan(plan: ENPlanWork): Integer;
var
  TempENElement: ENElementControllerSoapPort;
  element: ENElement;
begin
  TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;
  element := TempENElement.getObject(plan.elementRef.code);
  result := element.typeRef.code;
end;

function TDMReports.getElementCodeByPlanCode(planCode : Integer): Integer;
var
    TempENPlanWork: ENPlanWorkControllerSoapPort;
    plan : ENPlanWork;
begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
    plan := TempENPlanWork.getObject(planCode);
    Result := plan.elementRef.code;
end;

function TDMReports.getElementTypeByPlanItem(planItemCode : Integer):Integer;
var
    TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    planItem : ENPlanWorkItem;
begin
    // определим тип элемента по коду
    // и вызовм НУЖНЫЙ метод ... - чтоб левые юзера не планировали на правые обьекты
    TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
    planItem := TempENPlanWorkItem.getObject(planItemCode);
    result := getElementTypeByPlan(planItem.planRef.code);
end;

function TDMReports.getElementByCode(elementCode : Integer) : ENElement;
var
    TempENElement: ENElementControllerSoapPort;
    element : ENElement;
begin
    TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;
    element := TempENElement.getObject(elementCode);
    result := element ;
end;


function TDMReports.getObjectByElement(elementCode : Integer) : TObject;
var
    TempENElement: ENElementControllerSoapPort;
    element : ENElement;
begin
    TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;
    element := TempENElement.getObject(elementCode);

    if element <> nil then
      result := getObjectByElementType(element.code,element.typeRef.code)
    else
      result := nil;
end;


function TDMReports.getObjectByElementType(elementCode : Integer; elementType : Integer) : TObject;
var obj : TObject;
begin
    case elementType of
      EN_LINE10:       obj := (getLine10ByElement(elementCode));
      EN_SUBSTATION04: obj := (getSubstation04ByElement(elementCode));
      EN_LINE150 :  obj := (getLine150ByElement(elementCode));
      EN_SUBSTATION150 :  obj := (getSubstation150ByElement(elementCode));
      EN_LINE_CABLE :
    else
      obj := nil;
    end;

    result := obj;
end;

function TDMReports.getInvNumByElement(elementCode : Integer) : String;
var
    TempENElement: ENElementControllerSoapPort;
    element : ENElement;
begin
    TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;
    element := TempENElement.getObject(elementCode);

    if element <> nil then
      result := getInvNumByElementType(element.code,element.typeRef.code)
    else
      result := '';
end;


function TDMReports.getInvNumByElementType(elementCode : Integer; elementType : Integer) : String;
//var obj : TObject;
begin
result := '';
try
    case elementType of
      EN_LINE04: result := getLine04ByElement(elementCode).invNumber;
      EN_LINE10: result := getLine10ByElement(elementCode).invNumber;
      EN_SUBSTATION04: result := getSubstation04ByElement(elementCode).invNumber;
      EN_LINE150 :  result := getLine150ByElement(elementCode).invNumber;
      EN_SUBSTATION150 :  result := getSubstation150ByElement(elementCode).invNumber;
    else
      result := '';
    end;
except
end;

end;

function TDMReports.getElementTypeByEstimateItem(estimateItemCode : Integer):Integer;
var TempENEstimateItem: ENEstimateItemControllerSoapPort;
estimateItem: ENEstimateItem;
begin
    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    estimateItem := TempENEstimateItem.getObject(estimateItemCode);
    result := getElementTypeByPlan(estimateItem.planRef.code);
end;


function TDMReports.getDepartmentByRenCode(renCode: Integer; managementCode: Integer):ENDepartmentShort;
var
  TempENDepartment: ENDepartmentControllerSoapPort;
  ENDepartmentList: ENDepartmentShortList;
  f: ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

    if renCode > low(Integer) then
      f.conditionSQL := 'code in ( ' +
        ' select d2r.departmentrefcode from endepartment2epren d2r, endepartment d ' +
        '  where d2r.renrefcode = ' + IntToStr(renCode) +
        '   and d2r.departmentrefcode = d.code ' +
        '   and d.isvirtual = 0' +  // будем брать только актуальные
        '   and d.managementrefcode = ' + IntToStr(managementCode) + ' )';

        // ' select departmentrefcode from endepartment2epren where renrefcode = ' + IntToStr(renCode) +')';

    TempENDepartment :=  HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
    ENDepartmentList := TempENDepartment.getScrollableFilteredList(f,0,-1);
    if ENDepartmentList.totalCount > 0 then
      result :=  ENDepartmentList.list[0]
    else
      result := nil;
end;

{
function TDMReports.getRenCodeInDepartmentByDepartmentCode(depCode : Integer):ENDepartmentShort;
var
  TempENDepartment: ENDepartmentControllerSoapPort;
  i: Integer;
  ENDepartmentList: ENDepartmentShortList;
  f : ENDepartmentFilter;
  dep : ENDepartment;
  //departmentObj : ENDepartment;
begin
   //f := ENDepartmentFilter.Create;
   //SetNullIntProps(f);
   //SetNullXSProps(f);

    if renCode > low(Integer) then
       f.conditionSQL := 'code in (select departmentrefcode from endepartment2epren where renrefcode = ' + IntToStr(renCode) +')';


    TempENDepartment :=  HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
    dep := TempENDepartment.getObject(depCode);
//     dep.
    if dep <> nil then
      result :=  0
    else
      result := 0;
end;
}

function TDMReports.searchElements(f : ENElementFilter; from: integer; count:integer; invNum : string; objName : string; buhName: String = ''): ENElementShortList;
var
    //i : integer;

    TempENElement: ENElementControllerSoapPort;
    //element : ENElement;
    outList : ENElementShortList;

  //departmentObj : ENDepartment;

    //TempENSubstation150: ENSubstation150ControllerSoapPort;
    //obj : ENSubstation150;
    //fs150 : ENSubstation150Filter;
    //ls150 : ENSubstation150ShortList;

    //TempENSubstation04: ENSubstation04ControllerSoapPort;
    //objs04 : ENSubstation04;
    //fs04 : ENSubstation04Filter;
    //ls04 : ENSubstation04ShortList;

    //TempENLine04: ENLine04ControllerSoapPort;
    //obj : ENLine04;
    //fl04 : ENLine04Filter;
    //ll04 : ENLine04ShortList;

    //TempENLine10: ENLine10ControllerSoapPort;
    //obj : ENLine10;
    //fl10 : ENLine10Filter;
    //ll10 : ENLine10ShortList;

    //TempENLine150: ENLine150ControllerSoapPort;
    //obj : ENLine150;
    //fl150 : ENLine150Filter;
    //ll150 : ENLine150ShortList;

    //TempENRZAObject : ENRZAObjectControllerSoapPort;
    //obj : ENLine150;
    //fRZA : ENRZAObjectFilter;
    //lRZA : ENRZAObjectShortList;

    TempENSDTUObject : ENSDTUObjectControllerSoapPort;
    //obj : ENLine150;
    fSDTU : ENSDTUObjectFilter;
    lSDTU : ENSDTUObjectShortList;

    TempENLineCable: ENLineCableControllerSoapPort;
    //obj : ENLine10;
    flc : ENLineCableFilter;
    llc : ENLineCableShortList;

    TempTKTransportReal: TKTransportRealControllerSoapPort;
    ftr : TKTransportRealFilter;
    ltr : TKTransportRealShortList;

    TempENBuilderObject: ENBuilderObjectControllerSoapPort;
    fBuilder : ENBuilderObjectFilter;
    lBuilder : ENBuilderObjectShortList;

    elementCodes : string;
    renCondition : string;
begin


    TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;

    if (length(invNum) = 0) and (length(objName) = 0) and (length(buhName) = 0) then
    begin
        outList := TempENElement.getScrollableFilteredList(f, from, count);
    end
    else
    begin

       if f.renRef <> nil then
         if f.renRef.code <> low(Integer) then
            renCondition := ' elementcode in (select enelement.code from enelement where enelement.renrefcode = '+ IntToStr(f.renRef.code) +')';

      f.name := objName;
      f.invNumber := invNum;

      ///// 27.04.11
      f.buhName := buhName;
      /////

{
       /////////////////////////////////////////////////////////////////////////
       TempENBuilderObject := HTTPRIOENBuilderObject as ENBuilderObjectControllerSoapPort;
       fBuilder := ENBuilderObjectFilter.Create;
       SetNullIntProps(fBuilder);
       SetNullXSProps(fBuilder);

       fBuilder.invNumber := invNum;
       fBuilder.name := objName;
       fBuilder.conditionSQL :=  renCondition;

       lBuilder := TempENBuilderObject.getScrollableFilteredList(fBuilder, from, count );
       for i:=0 to High(lBuilder.list) do
       begin
            if length(elementCodes) > 0 then
              elementCodes := elementCodes + ',' + IntToStr(lBuilder.list[i].elementCode)
            else
              elementCodes := elementCodes + IntToStr(lBuilder.list[i].elementCode);
       end;
       /////////////////////////////////////////////////////////////////////////

       /////////////////////////////////////////////////////////////////////////
       TempTKTransportReal := HTTPRIOTKTransportReal as TKTransportRealControllerSoapPort;
       ftr := TKTransportRealFilter.Create;
       SetNullIntProps(ftr);
       SetNullXSProps(ftr);

       ftr.invNumber := invNum;
       ftr.name := objName;
       ftr.conditionSQL :=  renCondition;

       ltr := TempTKTransportReal.getScrollableFilteredList(ftr, from, count );
       for i:=0 to High(ltr.list) do
       begin
            if length(elementCodes) > 0 then
              elementCodes := elementCodes + ',' + IntToStr(ltr.list[i].elementCode)
            else
              elementCodes := elementCodes + IntToStr(ltr.list[i].elementCode);
       end;
       /////////////////////////////////////////////////////////////////////////

       /////////////////////////////////////////////////////////////////////////
       TempENSubstation150 := HTTPRIOENSubstation150 as ENSubstation150ControllerSoapPort;
       fs150 := ENSubstation150Filter.Create;
       SetNullIntProps(fs150);
       SetNullXSProps(fs150);

       fs150.invNumber := invNum;
       fs150.name := objName;
       fs150.conditionSQL :=  renCondition;

       ls150 := TempENSubstation150.getScrollableFilteredList(fs150, from, count );
       for i:=0 to High(ls150.list) do
       begin
            if length(elementCodes) > 0 then
              elementCodes := elementCodes + ',' + IntToStr(ls150.list[i].elementCode)
            else
              elementCodes := elementCodes + IntToStr(ls150.list[i].elementCode);
       end;
       /////////////////////////////////////////////////////////////////////////


       /////////////////////////////////////////////////////////////////////////
       TempENSubstation04 := HTTPRIOENSubstation04 as ENSubstation04ControllerSoapPort;
       fs04 := ENSubstation04Filter.Create;
       SetNullIntProps(fs04);
       SetNullXSProps(fs04);

       fs04.invNumber := invNum;
       fs04.name := objName;
       fs04.conditionSQL :=  renCondition;
       ls04 := TempENSubstation04.getScrollableFilteredList(fs04, from, count );
       for i:=0 to High(ls04.list) do
       begin
            if length(elementCodes) > 0 then
              elementCodes := elementCodes + ',' + IntToStr(ls04.list[i].elementCode)
            else
              elementCodes := elementCodes + IntToStr(ls04.list[i].elementCode);
       end;
       /////////////////////////////////////////////////////////////////////////

       /////////////////////////////////////////////////////////////////////////
       TempENLine04 := HTTPRIOENLine04 as ENLine04ControllerSoapPort;
       fl04 := ENLine04Filter.Create;
       SetNullIntProps(fl04);
       SetNullXSProps(fl04);

       fl04.invNumber := invNum;
       fl04.name := objName;
       fl04.conditionSQL :=  renCondition;
       ll04 := TempENLine04.getScrollableFilteredList(fl04, from, count );
       for i:=0 to High(ll04.list) do
       begin
            if length(elementCodes) > 0 then
              elementCodes := elementCodes + ',' + IntToStr(ll04.list[i].elementCode)
            else
              elementCodes := elementCodes + IntToStr(ll04.list[i].elementCode);
       end;
       /////////////////////////////////////////////////////////////////////////

       /////////////////////////////////////////////////////////////////////////
       TempENLine10 := HTTPRIOENLine10 as ENLine10ControllerSoapPort;
       fl10 := ENLine10Filter.Create;
       SetNullIntProps(fl10);
       SetNullXSProps(fl10);

       fl10.invNumber := invNum;
       fl10.name := objName;
       fl10.conditionSQL :=  renCondition;
       ll10 := TempENLine10.getScrollableFilteredList(fl10, from, count );
       for i:=0 to High(ll10.list) do
       begin
            if length(elementCodes) > 0 then
              elementCodes := elementCodes + ',' + IntToStr(ll10.list[i].elementCode)
            else
              elementCodes := elementCodes + IntToStr(ll10.list[i].elementCode);
       end;
       /////////////////////////////////////////////////////////////////////////

       /////////////////////////////////////////////////////////////////////////
       TempENLine150 := HTTPRIOENLine150 as ENLine150ControllerSoapPort;
       fl150 := ENLine150Filter.Create;
       SetNullIntProps(fl150);
       SetNullXSProps(fl150);

       fl150.invNumber := invNum;
       fl150.name := objName;
       fl150.conditionSQL :=  renCondition;
       ll150 := TempENLine150.getScrollableFilteredList(fl150, from, count );
       for i:=0 to High(ll150.list) do
       begin
            if length(elementCodes) > 0 then
              elementCodes := elementCodes + ',' + IntToStr(ll150.list[i].elementCode)
            else
              elementCodes := elementCodes + IntToStr(ll150.list[i].elementCode);
       end;
       /////////////////////////////////////////////////////////////////////////

       /////////////////////////////////////////////////////////////////////////
       // RZA
       TempENRZAObject := HTTPRIOENRZAObject as ENRZAObjectControllerSoapPort;
       fRZA := ENRZAObjectFilter.Create;
       SetNullIntProps(fRZA);
       SetNullXSProps(fRZA);

       fRZA.invNumber := invNum;
       fRZA.name := objName;
       //fRZA.conditionSQL :=  renCondition;
       lRZA := TempENRZAObject.getScrollableFilteredList(fRZA, from, count );
       for i:=0 to High(lRZA.list) do
       begin
            if length(elementCodes) > 0 then
              elementCodes := elementCodes + ',' + IntToStr(lRZA.list[i].elementCode)
            else
              elementCodes := elementCodes + IntToStr(lRZA.list[i].elementCode);
       end;
       /////////////////////////////////////////////////////////////////////////

       /////////////////////////////////////////////////////////////////////////
       // SDTU
       TempENSDTUObject := HTTPRIOENSDTUObject as ENSDTUObjectControllerSoapPort;
       fSDTU := ENSDTUObjectFilter.Create;
       SetNullIntProps(fSDTU);
       SetNullXSProps(fSDTU);

       fSDTU.invNumber := invNum;
       fSDTU.name := objName;
       //fSDTU.conditionSQL :=  renCondition;
       lSDTU := TempENSDTUObject.getScrollableFilteredList(fSDTU, from, count );
       for i:=0 to High(lSDTU.list) do
       begin
            if length(elementCodes) > 0 then
              elementCodes := elementCodes + ',' + IntToStr(lSDTU.list[i].elementCode)
            else
              elementCodes := elementCodes + IntToStr(lSDTU.list[i].elementCode);
       end;
       /////////////////////////////////////////////////////////////////////////


       /////////////////////////////////////////////////////////////////////////
       // Кабельные ЛИНИИ
       TempENLineCable := HTTPRIOENLineCable as ENLineCableControllerSoapPort;
       flc := ENLineCableFilter.Create;
       SetNullIntProps(flc);
       SetNullXSProps(flc);

       flc.invNumber := invNum;
       flc.name := objName;
       //fSDTU.conditionSQL :=  renCondition;
       llc := TempENLineCable.getScrollableFilteredList(flc, from, count );
       for i:=0 to High(llc.list) do
       begin
            if length(elementCodes) > 0 then
              elementCodes := elementCodes + ',' + IntToStr(llc.list[i].elementCode)
            else
              elementCodes := elementCodes + IntToStr(llc.list[i].elementCode);
       end;
       /////////////////////////////////////////////////////////////////////////
}
       //if length(elementCodes) > 0 then
       begin
          //f.conditionSQL := ' code in ( ' + elementCodes + ')';
          outList := TempENElement.getScrollableFilteredList(f, from, count);
       end
       //else
       //   outList := ENElementShortList.Create;

    end;
      result := outList;

    {
    element := TempENElement.getObject(elementCode);

    if element <> nil then
      result := getInvNumByElementType(element.code,element.typeRef.code)
    else
      result := '';
    }
end;


//function TDMReports.selectRQOrg(var org: RQOrg; contrAgentType: Integer): Boolean;
function TDMReports.selectRQOrg(out org: RQOrg; contrAgentType: Integer; const newOrg: RQOrg): Boolean;
var frmRQOrgShow: TfrmRQOrgShow;
   //org: RQOrg;
   //TempRQOrg: RQOrgControllerSoapPort;
   sDate, lDate, nDate, strId, strAXId: String;
begin
  Result := false;

  frmRQOrgShow := TfrmRQOrgShow.Create(Application, fmNormal);
  try
    frmRQOrgShow.contrAgentType := contrAgentType;

    with frmRQOrgShow do
      if ShowModal = mrOk then
      begin
        try
           //if org = nil then
           //begin
            org := RQOrg.Create();
            SetNullIntProps(org);
            SetNullXSProps(org);
           //end;

           //org.id := StrToInt(GetReturnValue(sgRQOrg,0)); // по ИД будем смотреть на серваке ...
           strId := GetReturnValue(sgRQOrg, 0);
           if strId = '' then
             org.id := LOW_INT
           else
             org.id := StrToInt(strId);

           strAXId := GetReturnValue(sgRQOrg, 24);
           if strAXId = '' then
             org.axOrgId := LOW_INT
           else
             org.axOrgId := StrToInt(strAXId);
           org.axOrgCode := GetReturnValue(sgRQOrg, 25);

           org.codeorg := GetReturnValue(sgRQOrg,8);
           org.name := GetReturnValue(sgRQOrg,1);
           org.ukr_name := GetReturnValue(sgRQOrg,9);
           org.okpo := GetReturnValue(sgRQOrg,2);
           org.nalog_num := GetReturnValue(sgRQOrg,3);
           org.svidet_num := GetReturnValue(sgRQOrg,4);
           org.adr := GetReturnValue(sgRQOrg,5);
           org.tel := GetReturnValue(sgRQOrg,6);
           org.country := GetReturnValue(sgRQOrg,10);
           org.region := GetReturnValue(sgRQOrg,11);
           org.ministry := GetReturnValue(sgRQOrg,12);
           org.ownership := StrToInt(GetReturnValue(sgRQOrg,13));
           org.type_ := GetReturnValue(sgRQOrg,14);
           org.master_code := GetReturnValue(sgRQOrg,15);

           //org.date_svidet := TXSDate.Create;
           //org.likv_date := TXSDate.Create;
           //org.dateNalogform := TXSDate.Create;

           sDate := GetReturnValue(sgRQOrg,16);
             if sDate <> '' then
               begin
                org.date_svidet := TXSDate.Create;
                org.date_svidet.XSToNative(GetXSDate(StrToDate(sDate)));
               end;
           lDate := GetReturnValue(sgRQOrg,17);
             if lDate <> '' then
               begin
                org.likv_date := TXSDate.Create;
                org.likv_date.XSToNative(GetXSDate(StrToDate(lDate)));
               end;

           org.except_flag := GetReturnValue(sgRQOrg,18);
           org.likv_flag := GetReturnValue(sgRQOrg,19);
           org.budget_flag := GetReturnValue(sgRQOrg,20);

           nDate := GetReturnValue(sgRQOrg,21);
             if nDate <> '' then
               begin
                org.date_nalogform := TXSDate.Create;
                org.date_nalogform.XSToNative(GetXSDate(StrToDate(nDate)));
               end;

           org.id_nalogform := StrToInt(GetReturnValue(sgRQOrg,22));
           org.adr_legal := GetReturnValue(sgRQOrg,23);
           org.Primechan := GetReturnValue(sgRQOrg,7);

           // Код нужно сохранить таким, как есть (потому что, если он <> LOW_INT,
           // в серваке должен сработать метод save вместо add)
           if newOrg <> nil then
             if newOrg.code > 0 then
               org.code := newOrg.code;

           Result := true;
        except
           on EConvertError do
           begin
             org := nil;
             Result := false;
             Exit;
           end;
        end;
      end;
   finally
      frmRQOrgShow.Free;
   end;
end;


procedure TDMReports.setComponentPropsForDFDocsTab(form: TDialogForm;
  sgDFDocs, sgDFDocSigners: TAdvStringGrid);
begin
  setDFDocSignersGridProps(form, sgDFDocSigners);
  setDFDocsGridProps(form, sgDFDocs);
end;

function TDMReports.getFINCehCodeByDepartmentCode(departmentCode : Integer) : WideString;
var
  TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;
  s : string;
begin

      s:='-1';
      TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
      renFilter := ENDepartment2EPRenFilter.Create;
      SetNullXSProps(renFilter);
      SetNullIntProps(renFilter);
      renFilter.departmentRef := ENDepartmentRef.Create;
      renFilter.departmentRef.code := departmentCode; //plan.renRef.code;
      renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);
      if renList.totalCount > 0 then
         s := renList.list[0].finServicesCode ;

      result := s;
end;

function TDMReports.getFinRenByDepartmentCode(departmentCode : Integer) : WideString;
var
  TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;
  s : string;
begin
      // РЭСы и МОЛы
      s:='-1';
      TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
      renFilter := ENDepartment2EPRenFilter.Create;
      SetNullXSProps(renFilter);
      SetNullIntProps(renFilter);
      renFilter.departmentRef := ENDepartmentRef.Create;
      renFilter.departmentRef.code := departmentCode; //plan.renRef.code;
      renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);
      if renList.totalCount > 0 then
         s := IntToStr(renList.list[0].finRenCode) ;

      result := s;
end;

function TDMReports.getFullExecutorName(node: TTreeNode): String;
var
  outStr: String;
  tmpNode: TTreeNode;
begin
  tmpNode := node;
  outStr := '';

  while tmpNode <> nil do
  begin
    if FINExecutorShort(tmpNode.Data).axOrgId <> '' then // Если дерево вытянуто из Axapt'ы
    begin
      if FINExecutorShort(tmpNode.Data).axOrgTypeId <> 0 then
      begin
        if length(outStr) = 0 then
          outStr := FINExecutorShort(tmpNode.Data).name
        else
          outStr := outStr + ' ' + FINExecutorShort(tmpNode.Data).name;
      end;
    end
    else begin
      if FINExecutorShort(tmpNode.Data).finKindName <> '' then
      begin
        if length(outStr) = 0 then
          outStr := FINExecutorShort(tmpNode.Data).name
        else
          outStr := outStr + ' ' + FINExecutorShort(tmpNode.Data).name;
      end;
    end;

    if tmpNode.Parent <> nil then
      if tmpNode.Parent.Level = 0 then
        break;

    tmpNode := tmpNode.Parent;
  end;

  Result := outStr;
end;

function TDMReports.getEPRenByDepartmentCode(departmentCode : Integer) : WideString;
var
  TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;
  s : string;
begin
      // РЭСы и МОЛы
      s:='0';
      TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
      renFilter := ENDepartment2EPRenFilter.Create;
      SetNullXSProps(renFilter);
      SetNullIntProps(renFilter);
      renFilter.departmentRef := ENDepartmentRef.Create;
      renFilter.departmentRef.code := departmentCode; //plan.renRef.code;
      renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);
      if renList.totalCount > 0 then
         s := IntToStr(renList.list[0].renRefCode) ;

      result := s;
end;

function TDMReports.getCFOByBudgetCode(departmentCode : Integer) : String;
var
  TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;
  s : String;
begin
      // РЭСы и МОЛы
      s:='';
      TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
      renFilter := ENDepartment2EPRenFilter.Create;
      SetNullXSProps(renFilter);
      SetNullIntProps(renFilter);
      renFilter.departmentRef := ENDepartmentRef.Create;
      renFilter.departmentRef.code := departmentCode; //plan.renRef.code;
      renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);
      if renList.totalCount > 0 then
         s := (renList.list[0].finCfoCode) ;

      result := s;
end;


function TDMReports.makeGeneralReportPDF(name: String; request: EPReportRequestEx; _type: String) : String;
var reportType, processResult, fname: String; //filename: String;
    TempENReport: ENReportControllerSoapPort;
    chosenFileName, filePath : String;
    //outStream: TFileStream;
    res: TStrings;
    saveDialog : TSaveDialog;
begin
//  var form = new Form('SelectReportType');

  // comment this line to enable selection
  //_type := 'PDF';

  reportType:='PDF';
{  if (_type <> '') then
    reportType := _type
  else
  begin
    if (form.exec())
    begin
      if (form.radioButtonPDF.checked)
      begin
        reportType:='PDF';
      end;
      else
      begin
        reportType:='XLS';
      end;
    end;
    else
      return;
  end;}

        // 01.08.2019 Для DBF нужно будет выбрать файл иначе выход из функции
      if (upperCase(_type) = 'DBF')  then begin
         saveDialog := TSaveDialog.Create(Self);
         saveDialog.Title := 'Зберегти файл';
         saveDialog.Filter := 'DBF-файли|*.dbf';
         if saveDialog.Execute then begin
           chosenFileName := saveDialog.Filename;
         end else begin
           Result := '';
           Exit;
        end;
        saveDialog.Free;
      end;


  if (reportType = 'PDF') then
  begin
    //filename:=name; //makeCorrectReportFileName(name, 'pdf');

    TempENReport := HTTPRIOENReport as ENReportControllerSoapPort;

    //result:=application.server.EPReportControllerSoapPort.processAsPDF(request);
    if (upperCase(_type) = 'PDF') then
      processResult:=TempENReport.processAsPDF(request)
    else if (upperCase(_type) = 'XLS') then
      processResult:=TempENReport.processAsXLS(request)
    else if (upperCase(_type) = 'XLSX') then
      processResult := TempENReport.processAsXLS(request, _type)
    else if (upperCase(_type) = 'DOC') then
      processResult := TempENReport.processAsDOC(request, _type)
    else if (upperCase(_type) = 'DBF') then
      processResult := TempENReport.processAsDBF(request);

    res:=TStringList.Create;
    try
      res.Add(Trim(processResult));
      //fname:=GetFileName('res');
      fname:=GetFileName(name);
      // при вызове из другой папки - БОК !!!
      //fname := GetFileName('res');

      if (upperCase(_type) = 'DBF') then begin
        filePath := chosenFileName;
      end else begin
        filePath := ExtractFilePath(Application.ExeName)+TempReportsPath+fname;
      end;


      if not DirectoryExists(ExtractFilePath(Application.ExeName)+TempReportsPath) then
        CreateDir(ExtractFilePath(Application.ExeName)+TempReportsPath);
      res.SaveToFile(filePath + '.b64');
    finally
      res.Free;
    end;
    Result := filePath + '.' + _type;

    Decode(filePath,('.'+_type));

    SysUtils.DeleteFile(filePath + '.b64');

    if (upperCase(_type) <> 'DBF') then begin
      ShellExecute(0,PChar('open'),PChar('"' + filePath + '.' + _type + '"'),
                  nil,nil,SW_SHOWMAXIMIZED);
    end;

    //////////////
{    outStream:=TFileStream.Create(ExtractFilePath(Application.ExeName)+filename+'.pdf',fmCreate);
    try
      Decoder.DecodeToStream(processResult,outStream);
    finally
      outStream.Free;
    end;}

    //////////////


{    var fileReport:=application.file.openForWrite(filename);

    if (fileReport != null)
    begin
     fileReport.writeBase64(processResult);
     fileReport.close();

     application.shellExecute(filename);
    end;
    else
    begin
     application.errMsgBoxLow('Ошибка при создании файла ' + filename);
    end;}
  end
  else
  begin
{    var filename:=makeCorrectReportFileName(name, 'xls');

    processResult:=application.server.EPReportControllerSoapPort.processAsXLS(request);

    var fileReport:=application.file.openForWrite(filename);

    if (fileReport != null)
    begin
     fileReport.writeBase64(processResult);
     fileReport.close();

     application.shellExecute(filename);}
  end;
{  else
  begin
     //application.errMsgBoxLow('Ошибка при создании файла ' + filename);
  end;}
end;


function TDMReports.makeGeneralReportPDF(name: String; request: EPReportRequestEx; _type: String; pFileName : String) : String;
var reportType, processResult, fname, filePath, chosenFileName : String; //filename: String;
    TempENReport: ENReportControllerSoapPort;
    //outStream: TFileStream;
    res: TStrings;
    saveDialog : TSaveDialog;
begin

  reportType:='PDF';

          // 01.08.2019 Для DBF нужно будет выбрать файл иначе выход из функции
      if (upperCase(_type) = 'DBF')  then begin
         saveDialog := TSaveDialog.Create(Self);
         saveDialog.Filename := pFileName;
         saveDialog.Title := 'Зберегти файл';
         saveDialog.Filter := 'DBF-файли|*.dbf';
         if saveDialog.Execute then begin
           chosenFileName := saveDialog.Filename;
         end else begin
           Result := '';
           Exit;
        end;
        saveDialog.Free;
      end;


  if (reportType = 'PDF') then
  begin

    TempENReport := HTTPRIOENReport as ENReportControllerSoapPort;

    if (upperCase(_type) = 'PDF') then
      processResult:=TempENReport.processAsPDF(request)
    else if  (upperCase(_type) = 'XLS') then
      processResult:=TempENReport.processAsXLS(request)
    else if  (upperCase(_type) = 'DBF') then
      processResult:=TempENReport.processAsDBF(request);

    res:=TStringList.Create;
    try
      res.Add(Trim(processResult));

      fname := pFileName;

      if (upperCase(_type) = 'DBF') then begin
        filePath := chosenFileName;
      end else begin
        filePath := ExtractFilePath(Application.ExeName)+TempReportsPath+fname;
      end;

      if not DirectoryExists(ExtractFilePath(Application.ExeName)+TempReportsPath) then
        CreateDir(ExtractFilePath(Application.ExeName)+TempReportsPath);
      res.SaveToFile(filePath + '.b64');
    finally
      res.Free;
    end;

    Result := filePath + '.' + _type;

    Decode(filePath,('.'+_type));
    SysUtils.DeleteFile(filePath +'.b64');

    if (upperCase(_type) <> 'DBF') then begin
      ShellExecute(0,PChar('open'),PChar(filePath + '.' + _type),
                  nil,nil,SW_SHOWMAXIMIZED);
    end;
end;
end;


procedure TDMReports.makeGeneralReportPDFwithOutExecute(name: String; request: EPReportRequestEx; _type: String; pFileName : String);
var reportType, result, fname: String; //filename: String;
    TempENReport: ENReportControllerSoapPort;
    //outStream: TFileStream;
    res: TStrings;
begin

  reportType:='PDF';


  if (reportType = 'PDF') then
  begin

    TempENReport := HTTPRIOENReport as ENReportControllerSoapPort;

    if (upperCase(_type) = 'PDF') then
      result:=TempENReport.processAsPDF(request)
    else if  (upperCase(_type) = 'XLS') then
      result:=TempENReport.processAsXLS(request);

    res:=TStringList.Create;
    try
      res.Add(Trim(result));

      fname := pFileName;

      if not DirectoryExists(ExtractFilePath(Application.ExeName)+TempReportsPath) then
        CreateDir(ExtractFilePath(Application.ExeName)+TempReportsPath);
      res.SaveToFile(ExtractFilePath(Application.ExeName)+TempReportsPath+fname+'.b64');
    finally
      res.Free;
    end;
    Decode(ExtractFilePath(Application.ExeName)+TempReportsPath+fname,('.'+_type));
    SysUtils.DeleteFile(ExtractFilePath(Application.ExeName)+TempReportsPath+fname+'.b64');
end;
end;



procedure TDMReports.makeGeneralReportAuth(name: String; request: EPReportRequestEx; _type: String; isAuth : boolean);
var reportType, result, fname: String; //filename: String;
    TempENReport: ENReportControllerSoapPort;
    //outStream: TFileStream;
    res: TStrings;
begin

  reportType:='PDF';

  if (reportType = 'PDF') then
  begin

    TempENReport := HTTPRIOENReport as ENReportControllerSoapPort;

    if ( isAuth ) then
       result:=TempENReport.processForHOE(request, _type)
    else
    begin
      if (upperCase(_type) = 'PDF') then
        result:=TempENReport.processAsPDF(request)
      else if  (upperCase(_type) = 'XLS') then
        result:=TempENReport.processAsXLS(request);
    end;

    res:=TStringList.Create;
    try
      res.Add(Trim(result));
      fname:=GetFileName(name);
      // при вызове из другой папки - БОК !!!
      //fname := GetFileName('res');

      if not DirectoryExists(ExtractFilePath(Application.ExeName)+TempReportsPath) then
        CreateDir(ExtractFilePath(Application.ExeName)+TempReportsPath);
      res.SaveToFile(ExtractFilePath(Application.ExeName)+TempReportsPath+fname+'.b64');
    finally
      res.Free;
    end;
    Decode(ExtractFilePath(Application.ExeName)+TempReportsPath+fname,('.'+_type));
    SysUtils.DeleteFile(ExtractFilePath(Application.ExeName)+TempReportsPath+fname+'.b64');
    ShellExecute(0,PChar('open'),PChar(ExtractFilePath(Application.ExeName)+TempReportsPath+fname+'.'+_type),
                  nil,nil,SW_SHOWMAXIMIZED);

  end
  else
  begin

  end;

end;



procedure TDMReports.SetHTTPRIOProps;
var i: Integer; //p: Integer;
    IP, Port_, IniPath: String;
    vServerIni : string;
begin
  ///// Setting UserName, Password and WSDLLocation
  IniPath:=ExtractFilePath(Application.ExeName)+IniName;
  for i:=0 to ComponentCount-1 do
    if (Components[i] is THTTPRIO) then
      with THTTPRIO(Components[i]) do
      begin
        HTTPWebNode.UserName:=UserName;
        HTTPWebNode.Password:=Password;
        HTTPWebNode.Agent := 'KSOE Client';

        if AnsiStartsStr('callcenter', AnsiLowerCase(ExtractFileName(Application.ExeName))) then
           vServerIni := 'EnergyNet'
        else
        begin
           if Name = 'HTTPRIOENReport' then
              vServerIni := 'EnergyNetReports'
           else
           begin
              vServerIni := 'EnergyNet';
           end;
        end;

        if IniValueExists(IniPath,vServerIni,'IP') then
          IP:=IniReadString(IniPath,vServerIni,'IP')
        else
          IP:='localhost';
        if IniValueExists(IniPath,vServerIni,'Port') then
          Port_:=IniReadString(IniPath,vServerIni,'Port')
        else
          Port_:='9080';

        URL:='http://'+IP+':'+Port_+'/soap/servlet/rpcrouter';

        OnBeforeExecute:=HTTPRIOBeforeExecute;
        OnAfterExecute:=HTTPRIOAfterExecute;
        {*** 16.10.06 DL ***}
        HTTPWebNode.OnBeforePost := HTTPRIOHTTPWebNodeBeforePost;
        {*** 16.10.06 DL ***}
      end;
  /////
end;



procedure TDMReports.sgDFDocSignersCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := false;
  // Возможность редактирования должности
  if (ACol = 4) then
    CanEdit := true;
end;

procedure TDMReports.sgDFDocSignersCanEditCellViewMode(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := false;
end;

procedure TDMReports.sgDFDocSignersEllipsClick(Sender: TObject; ACol,
  ARow: Integer; var S: string);
begin
  chooseDFDocSigner((Sender as TAdvStringGrid), ACol, ARow);
end;

procedure TDMReports.sgDFDocSignersGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
  if (ACol = 2) {or (ACol = 3)} then
    AEditor := edEditBtn;
end;

function TDMReports.UsesMDAXData: Boolean;
var
  TempConfig : ConfigControllerSoapPort;
  ConfigObj : Config;
begin
  Result := False;

  TempConfig := HTTPRIOConfig as ConfigControllerSoapPort;

  // Прийдется использовать getClientVersion, потому что getObject смотрит не на тот датасорс
  //ConfigObj := TempConfig.getObject(CONFIG_ENERGYNET_USESMDAXDATA);
  ConfigObj := TempConfig.getClientVersion(CONFIG_ENERGYNET_USESMDAXDATA);

  if ConfigObj <> nil then
    Result := (ConfigObj.value = '1')
  else
    raise Exception.Create('Не знайдено параметр EnergyNet.UsesMDAXData (код 30) !');
end;


function TDMReports.UsesMDAXData(configCode: Integer): Boolean;
var
  TempConfig : ConfigControllerSoapPort;
  ConfigObj : Config;
begin
  Result := False;
  TempConfig := HTTPRIOConfig as ConfigControllerSoapPort;

  // Прийдется использовать getClientVersion, потому что getObject смотрит не на тот датасорс
  ConfigObj := TempConfig.getClientVersion(configCode);

  if ConfigObj <> nil then
    Result := (ConfigObj.value = '1')
  else
    raise Exception.Create('Не знайдено параметр EnergyNet.UsesMDax... (код ' + IntToStr(configCode) + ') !');
end;


function TDMReports.getMDAXDataValue(configCode: Integer): String;
var
  TempConfig : ConfigControllerSoapPort;
  ConfigObj : Config;
begin
  Result := '';
  TempConfig := HTTPRIOConfig as ConfigControllerSoapPort;

  // Прийдется использовать getClientVersion, потому что getObject смотрит не на тот датасорс
  ConfigObj := TempConfig.getClientVersion(configCode);

  if ConfigObj <> nil then
    Result := ConfigObj.value
  else
    raise Exception.Create('Не знайдено параметр EnergyNet.UsesMDax... (код ' + IntToStr(configCode) + ') !');
end;

function TDMReports.UsesMDAXDataForReport: Boolean;
var
  TempConfig : ConfigControllerSoapPort;
  ConfigObj : Config;
begin
  Result := False;

  TempConfig := HTTPRIOConfig as ConfigControllerSoapPort;

  // Прийдется использовать getClientVersion, потому что getObject смотрит не на тот датасорс
  //ConfigObj := TempConfig.getObject(CONFIG_ENERGYNETREPORT_USESMDAXDATA);
  ConfigObj := TempConfig.getClientVersion(CONFIG_ENERGYNETREPORT_USESMDAXDATA);

  if ConfigObj <> nil then
    Result := (ConfigObj.value = '1')
  else
    raise Exception.Create('Не знайдено параметр EnergyNetReport.UsesMDAXData (код 31) !');
end;

procedure TDMReports.viewBadPostings(servicesObjectCode: Integer);
var
  TempENServicesObject: ENServicesObjectControllerSoapPort;
  servicesObject: ENServicesObject;
begin
  if servicesObjectCode <= 0 then
    raise Exception.Create('NET-4596 Не заданий код договору послуг на сторону!');

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  servicesObject := TempENServicesObject.getObject(servicesObjectCode);

  if servicesObject = nil then
    raise Exception.Create('NET-4596 Не знайдено договір послуг на сторону з кодом ' + IntToStr(servicesObjectCode) + ' !');

  frmPostingsEdit := TfrmPostingsEdit.Create(Application, dsInsert);
  try
    frmPostingsEdit.servicesObjectCode := servicesObject.code;
    frmPostingsEdit.priconnection := (servicesObject.contractTypeRef.code = ENSERVICESOBJECTTYPE_CONNECTION);
    frmPostingsEdit.justForCheck := True;
    if servicesObject.isNoPay = ENConsts.ENSERVICESOBJECT_ISNOPAY then
    begin
      frmPostingsEdit.HideControls([frmPostingsEdit.lblGridDescription, frmPostingsEdit.sgProvs,
                                    frmPostingsEdit.sgProvErrorsDetailed, frmPostingsEdit.btnGetPostingsList]);
    end;
    frmPostingsEdit.ShowModal;
  finally
    frmPostingsEdit.Free;
  end;
end;

procedure TDMReports.HTTPRIOBeforeExecute(const MethodName: String; var SOAPRequest: WideString);
begin
{  WaitForm := WaitMessage('Внимание!',
                          'Подождите, пожалуйста' + #10#13 +
                          'Выполняется загрузка данных...');
  WaitForm.Show;
  WaitForm.Update;}

  ///// 16.03.06
  frmMain.sbMain.Panels[0].Text := ' Подождите, пожалуйста!  Выполняется загрузка данных...';
  frmMain.Update;

  //for i:=0 to frmMain.MainMenu1.Items.Count-1 do
  //  frmMain.MainMenu1.Items[i].Enabled:=false;
  /////

  //{***}InvalidateRect(Application.MainForm.Handle,nil,true);
  //{***}Application.MainForm.Update;
  OldCursor:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  IsRIOExecuting:=true;
  // Включить перехват окна запроса логина и пароля
  frmMain.Timer1.Enabled:=true;
end;

procedure TDMReports.HTTPRIOAfterExecute(const MethodName: String; SOAPResponse: TStream);
var ArchiveFilePath, AppPath: String;
    tmpStream, tmpStream1: TMemoryStream;
    tmpUnZipper: TAbUnZipper;
begin
  if IsRIOExecuting then
  begin
    Screen.Cursor:=OldCursor;
{    WaitForm.Close;
    WaitForm.Free;
    WaitForm:=nil;}

    ///// 16.03.06
    frmMain.sbMain.Panels[0].Text := '';
    frmMain.Update;

    //for i:=0 to frmMain.MainMenu1.Items.Count-1 do
    //  frmMain.MainMenu1.Items[i].Enabled:=true;
    /////

    IsRIOExecuting:=false;
  end;

  {*** 16.10.06 DL ***}
  if _IS_PACKED_RESPONSE then
  begin
    ///// ============== Распаковываем ответ сервера ==============/////

    AppPath := ExtractFilePath(Application.ExeName);
    //ArchiveFilePath := AppPath + TempReportsPath + 'tmpresponse.gz';
    ArchiveFilePath := AppPath + TempReportsPath + getFileName('tmpresponse') + IntToStr(GetTickCount) + '.gz';

    //ExtractedFilePath := AppPath + TempReportsPath + 'unknown';

    tmpStream := TMemoryStream.Create;
    try
      // Сохраняем сжатый ответ из потока во временный файл
      tmpStream.LoadFromStream(SOAPResponse);
      if not DirectoryExists(AppPath + TempReportsPath) then
        CreateDir(AppPath + TempReportsPath);
      tmpStream.SaveToFile(ArchiveFilePath);
    finally
      FreeAndNil(tmpStream);
    end;

  {  // Распаковываем ответ из временного файла
    tmpUnZipper := TAbUnZipper.Create(nil);
    try
      tmpUnZipper.BaseDirectory := AppPath + TempReportsPath;
      tmpUnZipper.FileName := ArchiveFilePath;
      tmpUnZipper.ExtractFiles('*.*');
    finally
      tmpUnZipper.Free;
    end;}

    tmpUnZipper := TAbUnZipper.Create(Self);
    try
      tmpUnZipper.BaseDirectory := AppPath + TempReportsPath;
      tmpUnZipper.FileName := ArchiveFilePath;
      //tmpUnZipper.ExtractFiles('*.*');

      tmpStream1 := TMemoryStream.Create;
      try
        // Распаковываем ответ из временного файла во временный поток
        tmpUnZipper.ExtractToStream('unknown', tmpStream1);
        // Копируем уже распаковаванный ответ обратно в исходный поток
        SOAPResponse.Position := 0;
        tmpStream1.Position := 0;
        SoapResponse.CopyFrom(tmpStream1, tmpStream1.Size);
        SoapResponse.Size := tmpStream1.Size;
        SoapResponse.Position := 0;
      finally
        FreeAndNil(tmpStream1);
      end;

    finally
      tmpUnZipper.Free;
    end;

  {  // Копируем уже распаковаванный ответ обратно в поток
    tmpStream := TMemoryStream.Create;
    try
      tmpStream.LoadFromFile(ExtractedFilePath);
      SOAPResponse.Position := 0;
      tmpStream.Position := 0;
      SoapResponse.CopyFrom(tmpStream, tmpStream.Size);
      SoapResponse.Size := tmpStream.Size;
      SoapResponse.Position := 0;
    finally
      FreeAndNil(tmpStream);
    end;}

    // Удаляем все временные файлы
    if FileExists(ArchiveFilePath) then
      SysUtils.DeleteFile(ArchiveFilePath);
  //  if FileExists(ExtractedFilePath) then
  //    DeleteFile(ExtractedFilePath);
    ///// =========================================================/////
  end;
  {*** 16.10.06 DL ***}

  // Отключить перехват окна запроса логина и пароля
  frmMain.Timer1.Enabled:=false;
end;

///// Добавляем в запрос заголовок для того, чтобы сервер сжимал ответ
{*** 16.10.06 DL ***}
procedure TDMReports.HTTPRIOHTTPWebNodeBeforePost(const HTTPReqResp: THTTPReqResp; Data: Pointer);
/// 31.01.08
var TimeOut : integer;
///
begin
  if _IS_PACKED_RESPONSE then
  HttpAddRequestHeaders(HTTPReqResp.Request,
                        PChar('Accept-Encoding: gzip, deflate'),
                        Length('Accept-Encoding: gzip, deflate'),
                        HTTP_ADDREQ_FLAG_ADD);

  /// 31.01.08
  TimeOut := 10800000; // 3 часа
  InternetSetOption(Data,
                    INTERNET_OPTION_RECEIVE_TIMEOUT,
                    Pointer(@TimeOut),
                    SizeOf(TimeOut));
  ///
end;
{*** 16.10.06 DL ***}
/////

procedure TDMReports.DataModuleCreate(Sender: TObject);
begin
  SetHTTPRIOProps;
end;

procedure TDMReports.Decode(FileName: String; fileEXT:String);
Var
  base64File: TextFile;
  BufStr, base64String: String;
  Base64: TBase64;
  hFile: Integer;
begin
  AssignFile(base64File,FileName+'.b64');
  Reset(base64File);
  hFile := FileCreate(FileName+fileEXT);
  while not EOF(base64File) do
  begin
    Application.ProcessMessages;
    Readln(base64File,BufStr);
    while Length(BufStr) > 0 do
    begin
      base64String := Copy(BufStr,1,4);
      Delete(BufStr,1,4);
      Base64 := DecodeBase64(base64String);
      FileWrite(hFile,Base64.ByteArr,Base64.ByteCount);
    end;
  end;
  FileClose(hFile);
  CloseFile(base64File);
end;
{
procedure TDMBill.DecodeXLS(FileName: String);
Var
  base64File: TextFile;
  BufStr, base64String: String;
  Base64: TBase64;
  hFile: Integer;
begin
  AssignFile(base64File,FileName+'.b64');
  Reset(base64File);
  hFile := FileCreate(FileName+'.xls');
  while not EOF(base64File) do
  begin
    Application.ProcessMessages;
    Readln(base64File,BufStr);
    while Length(BufStr) > 0 do
    begin
      base64String := Copy(BufStr,1,4);
      Delete(BufStr,1,4);
      Base64 := DecodeBase64(base64String);
      FileWrite(hFile,Base64.ByteArr,Base64.ByteCount);
    end;
  end;
  FileClose(hFile);
  CloseFile(base64File);
end;
}

procedure TDMReports.makeReport4DocFlow(reportName: String; argNames, args: ArrayOfString; reportType: String);
var //outStream: TFileStream; filename: String;
  request: EPReportRequestEx;
    result, fname: String;
    TempENReport: ENReportControllerSoapPort;
    res: TStrings;
    is_for_docflow : Boolean;
begin
  request := EPReportRequestEx.Create;
  try
    begin
    request.reportCode := 0;
    request.funcName := DOCFLOW_REPORTS_JAR_PATH + reportName + '.jasper';

    request.argNames := argNames;
    request.args := args;
    request.resultType := Low(Integer);

    TempENReport := HTTPRIOENReport as ENReportControllerSoapPort;

    is_for_docflow := true;

    if (upperCase(reportType) = 'PDF') then
      result:=TempENReport.processAsPDF(request,is_for_docflow)
    else if  (upperCase(reportType) = 'XLS') then
      result:=TempENReport.processAsXLS(request,is_for_docflow)
    else if (upperCase(reportType) = 'DOC') then
      result := TempENReport.processAsDOC(request, is_for_docflow);
    end;
   finally
    request.Free;
  end;

    res:=TStringList.Create;
    try
      res.Add(Trim(result));
      fname:=GetFileName(reportName);

      if not DirectoryExists(ExtractFilePath(Application.ExeName)+TempReportsPath) then
        CreateDir(ExtractFilePath(Application.ExeName)+TempReportsPath);
      res.SaveToFile(ExtractFilePath(Application.ExeName)+TempReportsPath+fname+'.b64');
    finally
      res.Free;
    end;

    Decode(ExtractFilePath(Application.ExeName)+TempReportsPath+fname,('.'+reportType));
    SysUtils.DeleteFile(ExtractFilePath(Application.ExeName)+TempReportsPath+fname+'.b64');
    ShellExecute(0,PChar('open'),PChar(ExtractFilePath(Application.ExeName)+TempReportsPath+fname+'.'+reportType),
                  nil,nil,SW_SHOWMAXIMIZED);

end;

function makeReport(reportName: String; argNames, args: ArrayOfString; reportType: String) : String;
var
  request: EPReportRequestEx;
begin
  request := EPReportRequestEx.Create;
  try
    request.reportCode := 0;
    request.funcName := _REPORTS_JAR_PATH + reportName + '.jasper';

    request.argNames := argNames;
    request.args := args;
    request.resultType := Low(Integer);

    if ((reportType = 'pdf') or (reportType = 'xls') or (reportType = 'xlsx') or (reportType = 'doc')
      or (reportType = 'dbf')  ) then
      Result :=  DMReports.makeGeneralReportPDF(reportName, request, reportType);
  finally
    request.Free;
  end;
end;

function makeReport(reportName: String; argNames, args: ArrayOfString; reportType: String; fileName : String) : String;
var
  request: EPReportRequestEx;
begin
  request := EPReportRequestEx.Create;
  try
    request.reportCode := 0;
    request.funcName := _REPORTS_JAR_PATH + reportName + '.jasper';

    request.argNames := argNames;
    request.args := args;
    request.resultType := Low(Integer);

    if ((reportType = 'pdf') or (reportType = 'xls') or (reportType = 'dbf')) then
      Result := DMReports.makeGeneralReportPDF(reportName, request, reportType, fileName);
  finally
    request.Free;
  end;
end;


procedure makeReportWithOutExecute(reportName: String; argNames, args: ArrayOfString; reportType: String; fileName : String);
var
  request: EPReportRequestEx;
begin
  request := EPReportRequestEx.Create;
  try
    request.reportCode := 0;
    request.funcName := _REPORTS_JAR_PATH + reportName + '.jasper';

    request.argNames := argNames;
    request.args := args;
    request.resultType := Low(Integer);

    if ((reportType = 'pdf') or (reportType = 'xls')) then
      DMReports.makeGeneralReportPDFwithOutExecute(reportName, request, reportType, fileName);
  finally
    request.Free;
  end;
end;

procedure makeReportWithExecute(reportName: String; argNames, args: ArrayOfString; reportType: String; fileName : String);
var
  request: EPReportRequestEx;
begin
  request := EPReportRequestEx.Create;
  try
    request.reportCode := 0;
    request.funcName := _REPORTS_JAR_PATH + reportName + '.jasper';

    request.argNames := argNames;
    request.args := args;
    request.resultType := Low(Integer);

    if ((reportType = 'pdf') or (reportType = 'xls')) then
      DMReports.makeGeneralReportPDFwithExecute(reportName, request, reportType, fileName);
  finally
    request.Free;
  end;
end;


procedure makeReportAuth(reportName: String; argNames, args: ArrayOfString; reportType: String);
var
  request: EPReportRequestEx;
begin
  request := EPReportRequestEx.Create;
  try
    request.reportCode := 0;
    request.funcName := _REPORTS_JAR_PATH + reportName + '.jasper';

    request.argNames := argNames;
    request.args := args;
    request.resultType := Low(Integer);

    if ((reportType = 'pdf') or (reportType = 'xls')) then
      DMReports.makeGeneralReportAuth(reportName, request, reportType, true);
  finally
    request.Free;
  end;
end;

procedure TDMReports.generateMOLFilter(var molFilter: FINMolFilter; molCodes: String);
begin
  if molFilter = nil then
  begin
    molFilter := FINMolFilter.Create;
    SetNullXSProps(molFilter);
    SetNullIntProps(molFilter);
    molFilter.state := 1;
  end;

  if molCodes <> '' then
  begin
    if DMReports.UsesMDAXData(CONFIG_USES_MDAX_INVENTLOCATION) then
    begin
      // Убираем кавычки и пробелы
      molCodes := AnsiReplaceText(molCodes, '''', '');
      molCodes := AnsiReplaceText(molCodes, ' ', '');
      // Дальше очень хитро
      molFilter.id := '*#,' + molCodes + ',#*'
    end
    else
      molFilter.conditionSQL := ' UMC_DBA.TDIVISION.ID in (' + molCodes + ')';
  end;
end;

function TDMReports.getActByPlan(planCode : Integer) : ENAct;
var
  act2planFilter : ENAct2ENPlanWorkFilter;
  //frmENActShow : TfrmENActShow;
  TempENAct2ENPlanWork: ENAct2ENPlanWorkControllerSoapPort;
  ENAct2ENPlanWorkList: ENAct2ENPlanWorkShortList;
  actObj : ENAct;
  TempENAct: ENActControllerSoapPort;
begin

      // подтянем акт ...
      act2planFilter := ENAct2ENPlanWorkFilter.Create;
      SetNullIntProps(act2planFilter);
      SetNullXSProps(act2planFilter);

      act2planFilter.plan := ENPlanWork.Create;
      act2planFilter.plan.code := planCode;

      TempENAct2ENPlanWork :=  HTTPRIOENAct2ENPlanWork as ENAct2ENPlanWorkControllerSoapPort;

      ENAct2ENPlanWorkList := TempENAct2ENPlanWork.getScrollableFilteredList(act2planFilter, 0,-1);

      if  ENAct2ENPlanWorkList.totalCount = 1 then
      begin
         TempENAct :=  HTTPRIOENAct as ENActControllerSoapPort;
         actObj := TempENAct.getObject(ENAct2ENPlanWorkList.list[0].actRefCode);
         Result := actObj;
      end;

      if  ENAct2ENPlanWorkList.totalCount = 0 then
      begin
         actObj := ENAct.Create;
         SetNullXSProps(actObj);
         SetNullIntProps(actObj);
         actObj.code := LOW_INT; // на всякий случай ...
         Result := actObj;
      end;

      if  ENAct2ENPlanWorkList.totalCount > 1 then
      begin
        // mega errrorrrrrrr
        ShowMessage('mega errrrroorr ... несколько планов на один акт !!!!!!');

      end;

end;

function TDMReports.getHumenCountInPlanWorkItem(
  planItemCode: Integer): Integer;
var
    TempENHumenItem: ENHumenItemControllerSoapPort;
    HumenItemList: ENHumenItemShortList;
    humenItemFilter : ENHumenItemFilter;
begin

    humenItemFilter := ENHumenItemFilter.Create;
    SetNullIntProps(humenItemFilter);
    SetNullXSProps(humenItemFilter);

  HumenItemFilter.planItemRef := ENPlanWorkItemRef.Create;
  HumenItemFilter.planItemRef.code := planItemCode;

  TempENHumenItem := HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;

  HumenItemList := TempENHumenItem.getScrollableFilteredList(HumenItemFilter, 0, -1);

  result :=  HumenItemList.totalCount;
end;


function TDMReports.getWorkOrderByPlanCode(planCode : Integer) : ENWorkOrder;
var
  TempENWorkOrder2ENPlanWork: ENWorkOrder2ENPlanWorkControllerSoapPort;
  TempENWorkOrder : ENWorkOrderControllerSoapPort;

  list: ENWorkOrder2ENPlanWorkShortList;
  f : ENWorkOrder2ENPlanWorkFilter;
  workOrder : ENWorkOrder;

begin
  f :=  ENWorkOrder2ENPlanWorkFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.plan := ENPlanWork.Create;
  f.plan.code := planCode;

  TempENWorkOrder2ENPlanWork :=  HTTPRIOENWorkOrder2ENPlanWork as ENWorkOrder2ENPlanWorkControllerSoapPort;
  TempENWorkOrder := HTTPRIOENWorkOrder as ENWorkOrderControllerSoapPort;

  list :=  TempENWorkOrder2ENPlanWork.getScrollableFilteredList(f, 0, -1);

  workOrder := ENWorkOrder.Create;
  SetNullIntProps(workOrder);
  SetNullXSProps(workOrder);

  if list.totalCount = 1 then
     workOrder := TempENWorkOrder.getObject(list.list[0].workOrderCode);
      // qqqqqqqqqqq

  result := workOrder;
end;



function TDMReports.getWorkOrderBytByCode(workOrderBytCode: Integer): ENWorkOrderByt;
var TempENWorkOrderByt: ENWorkOrderBytControllerSoapPort;
begin
  TempENWorkOrderByt := HTTPRIOENWorkOrderByt as ENWorkOrderBytControllerSoapPort;
  Result := TempENWorkOrderByt.getObject(workOrderBytCode);
end;


{
function TDMReports.getFINDocCodeByWorkOrderCode(workCode : Integer; operationType : integer) : FINDoc2WorkOrder;
var
  TempFINDoc2WorkOrder: FINDoc2WorkOrderControllerSoapPort;
  i: Integer;
  l: FINDoc2WorkOrderShortList;
  f : FINDoc2WorkOrderFilter;
  out_ : FINDoc2WorkOrder;
begin
// qqqqqqqqqqq
  f := FINDoc2WorkOrderFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.workOrderRef := ENWorkOrderRef.Create;
  f.workOrderRef.code := workCode;

  f.typeRef := FINDocTypeRef.Create;
  f.typeRef.code := operationType;
  TempFINDoc2WorkOrder :=  HTTPRIOFINDoc2WorkOrder as FINDoc2WorkOrderControllerSoapPort;
  l := TempFINDoc2WorkOrder.getScrollableFilteredList(f,0,-1);
  out_ := FINDoc2WorkOrder.Create;
  SetNullIntProps(out_);
  SetNullXSProps(out_);
  if l.totalCount > 0 then
     out_ := TempFINDoc2WorkOrder.getObject(l.list[0].code);

  Result := out_;

end;
}

function TDMReports.getPlanCodesByActCode(actCode : Integer) : String;
var
  TempENAct2ENPlanWork: ENAct2ENPlanWorkControllerSoapPort;
  i: Integer;
  ENAct2ENPlanWorkList: ENAct2ENPlanWorkShortList;
  f : ENAct2ENPlanWorkFilter;
  out_ : String;
begin
  TempENAct2ENPlanWork :=  HTTPRIOENAct2ENPlanWork as ENAct2ENPlanWorkControllerSoapPort;
  f := ENAct2ENPlanWorkFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.actRef := ENActRef.Create;
  f.actRef.code := actCode;
  ENAct2ENPlanWorkList :=  TempENAct2ENPlanWork.getScrollableFilteredList(f, 0, -1);
  out_ := '';
  for i:=0 to High(ENAct2ENPlanWorkList.list) do
    AddListPos(out_, IntToStr(ENAct2ENPlanWorkList.list[i].planCode));
  if Length(out_) = 0 then out_ := IntToStr(LOW_INT);
  Result := out_;
end;


function TDMReports.getPlansListByActCode(actCode : Integer; orderBy : String) : ENPlanWorkShortList;
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  PlanWorkList: ENPlanWorkShortList;
  f : ENPlanWorkFilter;

  actObj : ENAct;
  TempENAct: ENActControllerSoapPort;

  TempENAct2ENPlanWork: ENAct2ENPlanWorkControllerSoapPort;
  act2PlanList : ENAct2ENPlanWorkShortList;
  act2PlanFilter : ENAct2ENPlanWorkFilter;
  planCodes : String;
  i : Integer;

begin
  TempENPlanWork :=  HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
    f := ENPlanWorkFilter.Create;
    SetNullIntProps(f);
    SetNullXSProps(f);
    //f.actRef := ENActRef.Create;
    //f.actRef.code := ENActObj.code;

    f.kind := ENPlanWorkKind.Create;
    f.kind.code := ENPLANWORKKIND_FACT;

    TempENAct :=  HTTPRIOENAct as ENActControllerSoapPort;
    actObj := TempENAct.getObject(actCode);

    f.stateRef := ENPlanWorkStateRef.Create;
    f.stateRef.code := actObj.actTypeRef.code;

    // Если элемент плана совпадает с элементом акта
    if not (actObj.element.typeRef.code in [EN_METROLOGY_OBJECT, EN_ROUTE_BYT]) then
    begin
        f.elementRef := ENElementRef.Create;
        f.elementRef.code := actObj.element.code;
            f.conditionSQL := 'enplanwork.code in (select enact2enplanwork.plancode from enact2enplanwork where enact2enplanwork.actrefcode = ' + IntToStr(actCode) + ')';

    end else begin
        TempENAct2ENPlanWork := HTTPRIOENAct2ENPlanWork as ENAct2ENPlanWorkControllerSoapPort;
        act2PlanFilter := ENAct2ENPlanWorkFilter.Create;
        SetNullXSProps(act2PlanFilter);
        SetNullIntProps(act2PlanFilter);
        act2PlanFilter.actRef := ENActRef.Create;
        act2PlanFilter.actRef.code := actCode;
        act2PlanList := TempENAct2ENPlanWork.getScrollableFilteredList(act2PlanFilter, 0, -1);
        planCodes := '-1';
        for i := 0 to act2PlanList.totalCount - 1 do begin
          planCodes := planCodes + ', ' + IntToStr(act2PlanList.list[i].planCode);
        end;
        f.conditionSQL := 'ENPLANWORK.CODE in (' + planCodes + ')';

    end;

    f.orderBySQL := orderBy; //'enplanwork.datestart';

    PlanWorkList := TempENPlanWork.getScrollableFilteredList(f,0,-1);

    Result :=  PlanWorkList;
end;

function TDMReports.getPlanTypeByActCode(actCode : Integer) : Integer;
var
  PlanWorkList: ENPlanWorkShortList;
  planType, planType2, i : Integer;
begin
   PlanWorkList := getPlansListByActCode(actCode,'');
   planType := -1;
   planType2 := -1;
   for i:=0 to PlanWorkList.totalCount - 1 do
   begin
      if planType <> PlanWorkList.list[i].typeRefCode then
         planType := PlanWorkList.list[i].typeRefCode;
      if planType2 = -1 then planType2 := planType;
      if planType2 <> planType then showMessage('Не совпадают ВИДЫ работ в планах на этом Акте !!!');
   end;

   Result :=  planType;
end;

function TDMReports.getRQFKOrderByCode(orderCode : Integer) : RQFKOrder;
var
   TempRQFKOrder: RQFKOrderControllerSoapPort;
   order : RQFKOrder;
begin
   TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
   order := TempRQFKOrder.getObjectNoSegr(orderCode);
   Result := order;
end;

function TDMReports.getSumRQFKOrderItem(orderCode : Integer) : Double;
var
   TempRQFKOrderItem2ENEstimateItem: RQFKOrderItem2ENEstimateItemControllerSoapPort;
   oi2eFilter  : RQFKOrderItem2ENEstimateItemFilter;
   oi2eList : RQFKOrderItem2ENEstimateItemShortList;
   sum:Double;
   i:Integer;
   RQFKOrderItemRemainderList: RQFKOrderItemRemainderShortList;
   TempRQFKOrderItemRemainder: RQFKOrderItemRemainderControllerSoapPort;
   oiremFilter :  RQFKOrderItemRemainderFilter;
begin
    TempRQFKOrderItem2ENEstimateItem := HTTPRIORQFKOrderItem2ENEstimateItem as RQFKOrderItem2ENEstimateItemControllerSoapPort;
    oi2eFilter :=  RQFKOrderItem2ENEstimateItemFilter.Create;
    SetNullIntProps(oi2eFilter);
    SetNullXSProps(oi2eFilter);
    oi2eFilter.conditionSQL:= ' RQFKORDERITEM2ENSTMTTM.CODE in ( select oi2.code  ' +
							 ' from  ' +
							 ' rqfkorder o, rqfkorderitem oi , rqfkorderitem2enstmttm oi2  ' +
							 ' where ' +
							 ' o.code =  ' +  IntToStr(orderCode) +
							 ' and o.code = oi.fkorderrefcode  ' +
							 ' and oi2.fkorderitemrefcode = oi.code  )' ;


    oi2eList := TempRQFKOrderItem2ENEstimateItem.getScrollableFilteredListOnlyDataTable(oi2eFilter, 0, -1);
    sum := 0;
    for i:=0 to High(oi2eList.list) do  //oi2eList.totalCount-1 do
    begin
      sum := sum + StrToFloat(oi2eList.list[i].sumWithoutNds.DecimalString)  ;
    end;
    // сумма по излишкам

    TempRQFKOrderItemRemainder :=  HTTPRIORQFKOrderItemRemainder as RQFKOrderItemRemainderControllerSoapPort;

    oiremFilter := RQFKOrderItemRemainderFilter.Create;
    SetNullIntProps(oiremFilter);
    SetNullXSProps(oiremFilter);
    oiremFilter.conditionSQL := ' rqfkorderitemremainder.code in ( select rem.code from  rqfkorderitem fi , rqfkorderitemremainder rem '+
                                ' where fi.code = rem.fkorderitemrefcode '+
                                ' and fi.fkorderrefcode = ' + IntToStr(orderCode) + ')';

    RQFKOrderItemRemainderList := TempRQFKOrderItemRemainder.getScrollableFilteredList(RQFKOrderItemRemainderFilter(oiremFilter),0,-1);
    for i:=0 to High(RQFKOrderItemRemainderList.list) do
      begin
         sum := sum + StrToFloat(RQFKOrderItemRemainderList.list[i].sumWithoutNds.DecimalString)  ;
       
      end;
      Result := sum;
end;

function TDMReports.getRQInvoice(invoiceCode : Integer): RQInvoice;
var
   TempRQInvoice: RQInvoiceControllerSoapPort;
begin
   TempRQInvoice :=  HTTPRIOTemp as RQInvoiceControllerSoapPort;
   Result :=  TempRQInvoice.getObject(invoiceCode);
end;

function TDMReports.getParentEstimateFromCurrentPlan_(estimateCode : Integer) : ENEstimateItem;
var
 out_ , estimate : ENEstimateItem;
 plan : ENPlanWork;
 TempENPlanWork: ENPlanWorkControllerSoapPort;
 TempENEstimateItem: ENEstimateItemControllerSoapPort;
 TempENEstimateItem2ENEstimateItem: ENEstimateItem2ENEstimateItemControllerSoapPort;

 f2 : ENEstimateItem2ENEstimateItemFilter;

 f : ENEstimateItemFilter;
 l : ENEstimateItemShortList;
 l2 : ENEstimateItem2ENEstimateItemShortList;
begin

  out_ := ENEstimateItem.Create;
  SetNullIntProps(out_);
  SetNullXSProps(out_);

  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
  estimate := TempENEstimateItem.getObject(estimateCode);

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  plan := TempENPlanWork.getObject(estimate.planRef.code);

  f := ENEstimateItemFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  TempENEstimateItem2ENEstimateItem := HTTPRIOENEstimateItem2ENEstimateItem as ENEstimateItem2ENEstimateItemControllerSoapPort;

  if (plan.kind.code = ENPLANWORKKIND_CURRENT) then
  begin
      Result := estimate;
      Exit;
  end;

  f2 := ENEstimateItem2ENEstimateItemFilter.Create;
  SetNullIntProps(f2);
  SetNullXSProps(f2);
  f2.typeRef := ENEstimateItem2TypeRef.Create;
  f2.typeRef.code := ENESTIMATEITEM2ENESTIMATEITEM_TYPE_PLAN_MOVED;

  if (plan.kind.code = ENPLANWORKKIND_NPZ) then
  begin
      f2.estimateItemOutRef := ENEstimateItemRef.Create;
      f2.estimateItemOutRef.code := estimate.code;

      //f.estimateItemOutRef := ENEstimateItemRef.Create;
      //f.estimateItemOutRef.code := estimate.code
      ///////
      //f.conditionSQL := 'code in (select ESTIMATEITEMINREFCODE from ENESTIMATEITEM2NSTMTTM where '+
      //' ENESTIMATEITEM2NSTMTTM.TYPEREFCODE = ' + IntToStr( ENESTIMATEITEM2ENESTIMATEITEM_TYPE_PLANMOVED ) +
      //' and ENESTIMATEITEM2NSTMTTM.ESTIMATEITEMOUTREFCODE = '+ IntToStr(estimate.code) +')';
      ///////


  end;

  if (plan.kind.code = ENPLANWORKKIND_FACT) then
  begin
      f2.conditionSQL := '';

  //    f.conditionSQL := 'code in (select month1.ESTIMATEITEMINREFCODE from ENESTIMATEITEM2NSTMTTM npz, ENESTIMATEITEM2NSTMTTM month1 ' +
  //                      ' where npz.ESTIMATEITEMINREFCODE = month1.ESTIMATEITEMOUTREFCODE and npz.ESTIMATEITEMOUTREFCODE = '+ IntToStr(estimate.code) +')' +
  //                      ' and npz.TYPEREFCODE = month1.TYPEREFCODE and npz.TYPEREFCODE = ' + IntToStr(ENESTIMATEITEM2ENESTIMATEITEM_TYPE_PLANMOVED);
  end;

  l2 :=  TempENEstimateItem2ENEstimateItem.getScrollableFilteredList(f2, 0, -1);
  if ( l2.totalCount <> 1) then
  begin
      ShowMessage('Ошибка в количестве материалов на Месячном плане ...' + IntToStr(l.totalCount));
      Result := out_;
      Exit;
  end;

  out_.code := l2.list[0].estimateItemInRefCode;
  Result := out_;
{
  l := TempENEstimateItem.getScrollableFilteredList(f, 0, -1);
  if (l.totalCount <> 1) then
  begin
      ShowMessage('Ошибка в количестве материалов на Месячном плане ...' + IntToStr(l.totalCount));
      Result := nil;
      Exit;
  end;

  out_ :=  TempENEstimateItem.getObject(l.list[0].code);
  Result := out_;
}

end;


function TDMReports.getParentEstimateCodesFromCurrentPlan(
  estimateCode: Integer): String;
var
 TempENEstimateItem: ENEstimateItemControllerSoapPort;
begin
  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
  Result := TempENEstimateItem.getEstimateCodesFromCurrentPlan(estimateCode);
end;

function TDMReports.getParentEstimateFromCurrentPlan(estimateCode : Integer) : ENEstimateItem;
var
 TempENEstimateItem: ENEstimateItemControllerSoapPort;
begin
  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
  Result := TempENEstimateItem.getEstimateFromCurrentPlanByEstimateCode(estimateCode);
end;

function TDMReports.getPartyFromFKOrderByEstimateFromCurrentPlan(estimateCode : Integer) : String;
var
 TempRQFKOrder: RQFKOrderControllerSoapPort;
begin
  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  Result := TempRQFKOrder.getPartyFromFKOrderByEstimateFromCurrentPlan(estimateCode);
end;

function TDMReports.getBillByCode(billCode : Integer): RQBill;
var
    TempRQBill : RQBillControllerSoapPort;
begin
    TempRQBill := HTTPRIORQBill as RQBillControllerSoapPort;
    result := TempRQBill.getObject(billCode);
end;

function TDMReports.getDepartmentBySizCode(elementCode : Integer) : ENDepartmentShort;
var //i: Integer;
  TempENDepartment: ENDepartmentControllerSoapPort;
  ENDepartmentList: ENDepartmentShortList;
  f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
    if elementCode > low(Integer) then
      f.conditionSQL := 'code = (select o.podrid from ensizobject o where o.elementcode = ' + IntToStr(elementCode) +')';

    TempENDepartment :=  HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
    ENDepartmentList := TempENDepartment.getScrollableFilteredList(f,0,-1);
    if ENDepartmentList.totalCount > 0 then
      result :=  ENDepartmentList.list[0]
    else
      result := nil;
end;

function TDMReports.getPlanCodeForCalculationByElement(elementCode: Integer): Integer;
var
    TempENplanwork: ENPlanworkControllerSoapPort;
    obj : ENPlanwork;
    f : ENPlanWorkFilter;
    l : ENPlanWorkShortList;
begin
    Result := LOW_INT;

    TempENplanwork := HTTPRIOENplanwork as ENPlanWorkControllerSoapPort;
    f := ENPlanworkFilter.Create;
    SetNullIntProps(f);
    SetNullXSProps(f);
    f.elementRef := ENElementRef.Create;
    f.elementRef.code := elementCode;
    f.kind := ENPlanWorkKind.Create;
    f.kind.code :=  ENPLANWORKKIND_CALCULATION;

    l := TempENplanwork.getScrollableFilteredList(f, 0, -1);
    if l.totalCount > 0 then
      obj := TempENplanwork.getObject(l.list[0].code)
    else
      obj := nil;

    if obj <> nil then
      Result := obj.code;
end;

function TDMReports.getServicesObjectByCode(svoCode : Integer): ENServicesObject;
var
    TempServicesObject : ENServicesObjectControllerSoapPort;
begin
    TempServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
    result := TempServicesObject.getObject(svoCode);
end;

function TDMReports.getServicesObjectByElementCode(elementCode : Integer): ENServicesObject;
var
    TempENServicesObject: ENServicesObjectControllerSoapPort;
    f: ENServicesObjectFilter;
    servicesObjectArr: ENServicesObjectController.ArrayOfInteger;
begin
  Result := nil;

  f := ENServicesObjectFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.element := ENElement.Create;
  f.element.code := elementCode;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  servicesObjectArr := TempENServicesObject.getScrollableFilteredCodeArray(f, 0, -1);

  if High(servicesObjectArr) > -1 then
    Result := TempENServicesObject.getObject(servicesObjectArr[0]);
end;



function TDMReports.getServicesObjectByPlanCode(planCode : Integer): ENServicesObject;
var
    TempENServicesObject: ENServicesObjectControllerSoapPort;
    f: ENServicesObjectFilter;
    servicesObjectArr: ENServicesObjectController.ArrayOfInteger;

    TempENplanwork: ENPlanworkControllerSoapPort;
    pobj : ENPlanwork;
begin
  Result := nil;

    TempENplanwork := HTTPRIOENplanwork as ENPlanWorkControllerSoapPort;
    pobj := TempENplanwork.getObject(planCode);

  f := ENServicesObjectFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.element := ENElement.Create;
  f.element.code := pobj.elementRef.code;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  servicesObjectArr := TempENServicesObject.getScrollableFilteredCodeArray(f, 0, -1);

  if High(servicesObjectArr) > -1 then
    Result := TempENServicesObject.getObject(servicesObjectArr[0]);
end;

function TDMReports.getDepartmentByCode(depCode : Integer): ENDepartment;
var
    TempENDepartment : ENDepartmentControllerSoapPort;
begin
    TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
    result := TempENDepartment.getObject(depCode);
end;

function TDMReports.getWarrantByCode(warrantCode : Integer): ENWarrant;
var
    TempENWarrant : ENWarrantControllerSoapPort;
begin
    TempENWarrant := HTTPRIOENWarrant as ENWarrantControllerSoapPort;
    result := TempENWarrant.getObject(warrantCode);
end;

function TDMReports.getWarrantStatus(stCode : Integer): ENWarrantStatus;
var
    TempENWarrantStatus : ENWarrantStatusControllerSoapPort;
begin
    TempENWarrantStatus := HTTPRIOENWarrantStatus as ENWarrantStatusControllerSoapPort;
    result := TempENWarrantStatus.getObject(stCode);
end;


function TDMReports.searchAutoRealbyCodeAutoGPS(CodeAutoGPS : String):Integer;
var //i: Integer;
  TempautoGPS: ENTrptGPS2TrptRealControllerSoapPort;
  TempautoGPSList: ENTrptGPS2TrptRealShortList;
  f : ENTrptGPS2TrptRealFilter;

begin
   f := ENTrptGPS2TrptRealFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

    if Trim(CodeAutoGPS) <> '' then
    f.codeTranpostGps := Trim(CodeAutoGPS);

    TempautoGPS :=  HTTPRIOENTrptGPS2TrptReal as ENTrptGPS2TrptRealControllerSoapPort;
    TempautoGPSList := TempautoGPS.getScrollableFilteredList(f,0,-1);
    if TempautoGPSList.totalCount > 0 then
      result :=  TempautoGPSList.list[0].realTransportCode
    else
      result := LOW_INT ;
end;

function TDMReports.getTransportmarkByrealtransportcode(realtransportcode : integer):TKTransportMark;
var Temptransportmark: TkTransportMarkControllerSoapPort; //i: Integer;
  transportmarkList: TKTransportMarkShortList;
  f : TKTransportMarkFilter;
  //tktransportmarkobject: TKTransportMark;
begin
   f := TKTransportMarkFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   f.conditionSQL :=   ' code = ( select trr.transportmarkcode from tktransportreal trr where trr.code =  ' + IntToStr(realtransportcode) + ')';

    Temptransportmark :=  HTTPRIOTKTransportMark as TkTransportMarkControllerSoapPort;
    transportmarkList :=  Temptransportmark.getScrollableFilteredList(f,0,-1);
    if transportmarkList.totalCount > 0 then
      result :=   Temptransportmark.getObject(transportmarkList.list[0].code)
    else
      result := nil ;
end;

// строка с кодами планов со связки договора по тех условиям
function TDMReports.getStrCodePlanFromENtechCond2enplanwork(EnTechConditionsServicesCode : Integer) : WideString;
var
  TempENTechCond2PlanWork: ENTechCond2PlanWorkControllerSoapPort;
  TempENTechCond2PlanWorkList : ENTechCond2PlanWorkShortList;
  TempENTechCond2PlanWorkFilter : ENTechCond2PlanWorkFilter;
  s : string;
  i : Integer;
begin

      s:='-1';
      TempENTechCond2PlanWork :=  HTTPRIOENTechCond2enplanwork as ENTechCond2PlanWorkControllerSoapPort;
      TempENTechCond2PlanWorkFilter := ENTechCond2PlanWorkFilter.Create;
      SetNullXSProps(TempENTechCond2PlanWorkFilter);
      SetNullIntProps(TempENTechCond2PlanWorkFilter);
      TempENTechCond2PlanWorkFilter.techConServicesRef := ENTechConditionsServicesRef.Create;
      TempENTechCond2PlanWorkFilter.techConServicesRef.code :=  EnTechConditionsServicesCode;
      TempENTechCond2PlanWorkList := TempENTechCond2PlanWork.getScrollableFilteredList(TempENTechCond2PlanWorkFilter,0,-1);
      if TempENTechCond2PlanWorkList.totalCount > 0 then
         for i:=0 to TempENTechCond2PlanWorkList.totalCount -1 do
         begin
            if s= '-1' then
             s:= IntToStr(TempENTechCond2PlanWorkList.list[i].planRefCode)
            else
             s:= s + ',' + IntToStr(TempENTechCond2PlanWorkList.list[i].planRefCode);
         end;

      result := s;
end;

// строка с кодами планов со связки договора по тех условиям
function TDMReports.getStrCodePlanFromENservices2enplanwork(EnServicesObjectCode : Integer; recordCount : Integer) : WideString;
var
  TempENServices2Plan: ENServices2PlanControllerSoapPort;
  TempENServices2PlanList : ENServices2PlanShortList;
  TempENServices2PlanFilter : ENServices2PlanFilter;
  s : string;
  i : Integer;
begin

      s:='-1';
      TempENServices2Plan :=  HTTPRIOENServices2Plan as ENServices2PlanControllerSoapPort;
      TempENServices2PlanFilter := ENServices2PlanFilter.Create;
      SetNullXSProps(TempENServices2PlanFilter);
      SetNullIntProps(TempENServices2PlanFilter);
      TempENServices2PlanFilter.servicesObjectRef := ENServicesObjectRef.Create;
      TempENServices2PlanFilter.servicesObjectRef.code :=  EnServicesObjectCode;
      TempENServices2PlanList := TempENServices2Plan.getScrollableFilteredList(TempENServices2PlanFilter,0, recordCount);
      if TempENServices2PlanList.totalCount > 0 then
         for i:=0 to TempENServices2PlanList.totalCount -1 do
         begin
            if s= '-1' then
             s:= IntToStr(TempENServices2PlanList.list[i].planRefCode)
            else
             s:= s + ',' + IntToStr(TempENServices2PlanList.list[i].planRefCode);
         end;

      result := s;
end;


function TDMReports.getDistanceByPoint2Point(inCode : Integer; outCode : Integer) : ENDestinationPoint2Point;
var
  TempENDestinationPoint2Point : ENDestinationPoint2PointControllerSoapPort;
  list : ENDestinationPoint2PointShortList;
  f : ENDestinationPoint2PointFilter;
  point2point : ENDestinationPoint2Point;

begin
  f := ENDestinationPoint2PointFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.elementInRef := ENElementRef.Create;
  f.elementInRef.code := inCode;
  f.elementOutRef := ENElementRef.Create;
  f.elementOutRef.code := outCode;

  TempENDestinationPoint2Point := HTTPRIOENDestinationPoint2Point as ENDestinationPoint2PointControllerSoapPort;
  list := TempENDestinationPoint2Point.getScrollableFilteredList(f, 0, -1);

  point2point := ENDestinationPoint2Point.Create;
  SetNullIntProps(point2point);
  SetNullXSProps(point2point);

  if list.totalCount = 1 then
     point2point := TempENDestinationPoint2Point.getObject(list.list[0].code);

  result := point2point;
end;


function TDMReports.getParentRouteCode(routeCode : Integer) : Integer;
var
  TempENTransportRoute : ENTransportRouteControllerSoapPort;
  routeList : ENTransportRouteShortList;
  f : ENTransportRouteFilter;

begin
  f := ENTransportRouteFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.parentRouteRef := ENTransportRouteRef.Create;
  f.parentRouteRef.code := routeCode;

  TempENTransportRoute := HTTPRIOENTransportRoute as ENTransportRouteControllerSoapPort;
  routeList := TempENTransportRoute.getScrollableFilteredList(f, 0, -1);

  if (routeList.totalCount) > 0 then
    result := routeList.list[0].parentRouteRefCode
  else
    result := LOW_INT;
end;


function TDMReports.getRouteCodeByPlan(planCode : Integer) : Integer;
var
  TempENTransportRoute : ENTransportRouteControllerSoapPort;
  routeList : ENTransportRouteShortList;
  f : ENTransportRouteFilter;

begin
  f := ENTransportRouteFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.planRef := ENPlanWorkRef.Create;
  f.planRef.code := planCode;

  TempENTransportRoute := HTTPRIOENTransportRoute as ENTransportRouteControllerSoapPort;
  routeList := TempENTransportRoute.getScrollableFilteredList(f, 0, -1);

  if (routeList.totalCount) > 0 then
    result := routeList.list[0].code
  else
    result := LOW_INT;
end;


function TDMReports.getLastDestinationPointByPlan(planCode : Integer) : ENDestinationPointShort;
var
  elementOutCode : Integer;
  TempENTransportRoute : ENTransportRouteControllerSoapPort;
  routeList : ENTransportRouteShortList;
  f : ENTransportRouteFilter;
  TempENDestinationPoint : ENDestinationPointControllerSoapPort;
  pointList : ENDestinationPointShortList;
  pointFilter : ENDestinationPointFilter;

begin
  f := ENTransportRouteFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.planRef := ENPlanWorkRef.Create;
  f.planRef.code := planCode;
  f.conditionSQL := ' entransportroute.code = (select max(rr.code) from entransportroute rr ' +
       ' where rr.planrefcode = entransportroute.planrefcode)';

  TempENTransportRoute := HTTPRIOENTransportRoute as ENTransportRouteControllerSoapPort;
  routeList := TempENTransportRoute.getScrollableFilteredList(f, 0, -1);

  if (routeList.totalCount) > 0 then
    elementOutCode := routeList.list[0].elementOutRefCode
  else
    elementOutCode := LOW_INT;

  if (elementOutCode <> LOW_INT) then
  begin
    pointFilter := ENDestinationPointFilter.Create;
    SetNullIntProps(pointFilter);
    SetNullXSProps(pointFilter);

    pointFilter.elementRef := ENElementRef.Create;
    pointFilter.elementRef.code := elementOutCode;

    TempENDestinationPoint := HTTPRIOENDestinationPoint as ENDestinationPointControllerSoapPort;
    pointList := TempENDestinationPoint.getScrollableFilteredList(pointFilter, 0, -1);

    if pointList.totalCount > 0 then
      result := pointList.list[0]
    else
      result := nil;
  end
  else result := nil;

end;


function TDMReports.getLastRouteCodeByPlan(planCode : Integer) : Integer;
var
  TempENTransportRoute : ENTransportRouteControllerSoapPort;
  routeList : ENTransportRouteShortList;
  f : ENTransportRouteFilter;

begin
  f := ENTransportRouteFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.planRef := ENPlanWorkRef.Create;
  f.planRef.code := planCode;
  f.conditionSQL := ' entransportroute.code = (select max(rr.code) from entransportroute rr ' +
       ' where rr.planrefcode = entransportroute.planrefcode)';

  TempENTransportRoute := HTTPRIOENTransportRoute as ENTransportRouteControllerSoapPort;
  routeList := TempENTransportRoute.getScrollableFilteredList(f, 0, -1);

  if (routeList.totalCount) > 0 then
    result := routeList.list[0].code
  else
    result := LOW_INT;
end;

{
procedure TDMReports.copyOrg(const sourceOrg: RQOrg; destOrg: RQOrg);
var code: Integer;
begin
  code := LOW_INT;
  if destOrg = nil then
    destOrg := RQOrg.Create()
  else
    code := destOrg.code;

  SetNullIntProps(destOrg);
  SetNullXSProps(destOrg);

  destOrg.id := sourceOrg.id;
  destOrg.codeorg := sourceOrg.codeorg;
  destOrg.name := sourceOrg.name;
  destOrg.ukr_name := sourceOrg.ukr_name;
  destOrg.okpo := sourceOrg.okpo;
  destOrg.nalog_num := sourceOrg.nalog_num;
  destOrg.svidet_num := sourceOrg.svidet_num;
  destOrg.adr := sourceOrg.adr;
  destOrg.tel := sourceOrg.tel;
  destOrg.country := sourceOrg.country;
  destOrg.region := sourceOrg.region;
  destOrg.ministry := sourceOrg.ministry;
  destOrg.ownership := sourceOrg.ownership;
  destOrg.type_ := sourceOrg.type_;
  destOrg.master_code := sourceOrg.master_code;

  if sourceOrg.date_svidet <> nil then
  begin
    destOrg.date_svidet := TXSDate.Create;
    destOrg.date_svidet.XSToNative(GetXSDate(EncodeDate(sourceOrg.date_svidet.Year,
                                                        sourceOrg.date_svidet.Month,
                                                        sourceOrg.date_svidet.Day)));
  end;

  if sourceOrg.likv_date <> nil then
  begin
    destOrg.likv_date := TXSDate.Create;
    destOrg.likv_date.XSToNative(GetXSDate(EncodeDate(sourceOrg.likv_date.Year,
                                                      sourceOrg.likv_date.Month,
                                                      sourceOrg.likv_date.Day)));
  end;

  if sourceOrg.date_nalogform <> nil then
  begin
    destOrg.date_nalogform := TXSDate.Create;
    destOrg.date_nalogform.XSToNative(GetXSDate(EncodeDate(sourceOrg.date_nalogform.Year,
                                                           sourceOrg.date_nalogform.Month,
                                                           sourceOrg.date_nalogform.Day)));
  end;

  destOrg.except_flag := sourceOrg.except_flag;
  destOrg.likv_flag := sourceOrg.likv_flag;
  destOrg.budget_flag := sourceOrg.budget_flag;

  destOrg.id_nalogform := sourceOrg.id_nalogform;
  destOrg.adr_legal := sourceOrg.adr_legal;
  destOrg.Primechan := sourceOrg.Primechan;

  ///// 06.12.2016 MDAX-441
  destOrg.axOrgCode := sourceOrg.axOrgCode;
  destOrg.axOrgId := sourceOrg.axOrgId;
  /////

  if code > 0 then
    destOrg.code := code;
end;
}

function TDMReports.copyOrg(const sourceOrg: RQOrg; const destOrg: RQOrg): RQOrg;
var
  code: Integer;
  outOrg: RQOrg;
begin
  code := LOW_INT;
  if destOrg <> nil then
    code := destOrg.code;

  outOrg := RQOrg.Create;
  SetNullIntProps(outOrg);
  SetNullXSProps(outOrg);

  outOrg.id := sourceOrg.id;
  outOrg.codeorg := sourceOrg.codeorg;
  outOrg.name := sourceOrg.name;
  outOrg.ukr_name := sourceOrg.ukr_name;
  outOrg.okpo := sourceOrg.okpo;
  outOrg.nalog_num := sourceOrg.nalog_num;
  outOrg.svidet_num := sourceOrg.svidet_num;
  outOrg.adr := sourceOrg.adr;
  outOrg.tel := sourceOrg.tel;
  outOrg.country := sourceOrg.country;
  outOrg.region := sourceOrg.region;
  outOrg.ministry := sourceOrg.ministry;
  outOrg.ownership := sourceOrg.ownership;
  outOrg.type_ := sourceOrg.type_;
  outOrg.master_code := sourceOrg.master_code;

  if sourceOrg.date_svidet <> nil then
  begin
    outOrg.date_svidet := TXSDate.Create;
    outOrg.date_svidet.XSToNative(GetXSDate(EncodeDate(sourceOrg.date_svidet.Year,
                                                        sourceOrg.date_svidet.Month,
                                                        sourceOrg.date_svidet.Day)));
  end;

  if sourceOrg.likv_date <> nil then
  begin
    outOrg.likv_date := TXSDate.Create;
    outOrg.likv_date.XSToNative(GetXSDate(EncodeDate(sourceOrg.likv_date.Year,
                                                      sourceOrg.likv_date.Month,
                                                      sourceOrg.likv_date.Day)));
  end;

  if sourceOrg.date_nalogform <> nil then
  begin
    outOrg.date_nalogform := TXSDate.Create;
    outOrg.date_nalogform.XSToNative(GetXSDate(EncodeDate(sourceOrg.date_nalogform.Year,
                                                           sourceOrg.date_nalogform.Month,
                                                           sourceOrg.date_nalogform.Day)));
  end;

  outOrg.except_flag := sourceOrg.except_flag;
  outOrg.likv_flag := sourceOrg.likv_flag;
  outOrg.budget_flag := sourceOrg.budget_flag;

  outOrg.id_nalogform := sourceOrg.id_nalogform;
  outOrg.adr_legal := sourceOrg.adr_legal;
  outOrg.Primechan := sourceOrg.Primechan;

  ///// 06.12.2016 MDAX-441
  outOrg.axOrgCode := sourceOrg.axOrgCode;
  outOrg.axOrgId := sourceOrg.axOrgId;
  /////

 ///zzzzz if code > 0 then   в существующей записи менялись реквизиты , так нельзя , т.к на нее ссылались другие строки заявки
    outOrg.code := LOW_INT;

  Result := outOrg;
end;

function TDMReports.CheckCounters(servicesObjectCode : Integer): Boolean;
var TempENGiveCounter: ENGiveCounterControllerSoapPort;
    ENGiveCounterFilterObj: ENGiveCounterFilter;
    countersArr: ENGiveCounterController.ArrayOfInteger;
begin
  Result := false;

  if servicesObjectCode = LOW_INT then Exit;

  TempENGiveCounter := HTTPRIOENGiveCounter as ENGiveCounterControllerSoapPort;

  ENGiveCounterFilterObj := ENGiveCounterFilter.Create;
  SetNullIntProps(ENGiveCounterFilterObj);
  SetNullXSProps(ENGiveCounterFilterObj);

  ENGiveCounterFilterObj.servicesObjectRef := ENServicesObjectRef.Create;
  ENGiveCounterFilterObj.servicesObjectRef.code := servicesObjectCode;

  countersArr := TempENGiveCounter.getScrollableFilteredCodeArray(ENGiveCounterFilterObj, 0, -1);

  if High(countersArr) > -1 then
    Result := true;
end;


function TDMReports.getPriconnectionDataByServicesCode(servicesCode : Integer): ENPriconnectionData;
var //i : Integer;
  TempENPriconnectionData : ENPriconnectionDataControllerSoapPort;
  dataFilter : ENPriconnectionDataFilter;
  ENPriconnectionDataList : ENPriconnectionDataShortList;
begin
  TempENPriconnectionData := HTTPRIOENPriconnectionData as ENPriconnectionDataControllerSoapPort;

  dataFilter := ENPriconnectionDataFilter.Create;
  SetNullIntProps(dataFilter);
  SetNullXSProps(dataFilter);
  dataFilter.techCondServRef := ENTechConditionsServicesRef.Create;
  dataFilter.techCondServRef.code := servicesCode;

  ENPriconnectionDataList := TempENPriconnectionData.getScrollableFilteredList(ENPriconnectionDataFilter(dataFilter),0,-1);

  if ENPriconnectionDataList.totalCount > 0 then
    result := TempENPriconnectionData.getObject(ENPriconnectionDataList.list[0].code)
  else
    result := nil;
end;

function TDMReports.getPriconnectionDataByElementCode(elementCode : Integer): ENPriconnectionData;
var //i : Integer;
  TempENPriconnectionData : ENPriconnectionDataControllerSoapPort;
  dataFilter : ENPriconnectionDataFilter;
  ENPriconnectionDataList : ENPriconnectionDataShortList;
begin

  TempENPriconnectionData := HTTPRIOENPriconnectionData as ENPriconnectionDataControllerSoapPort;

  dataFilter := ENPriconnectionDataFilter.Create;
  SetNullIntProps(dataFilter);
  SetNullXSProps(dataFilter);
  dataFilter.elementRef := ENElementRef.Create;
  dataFilter.elementRef.code := elementCode;
  dataFilter.conditionSQL := ' enpriconnectiondata.islast = 1 ';

  ENPriconnectionDataList := TempENPriconnectionData.getScrollableFilteredList(ENPriconnectionDataFilter(dataFilter),0,-1);

  if ENPriconnectionDataList.totalCount > 0 then
    result := TempENPriconnectionData.getObject(ENPriconnectionDataList.list[0].code)
  else
    result := TempENPriconnectionData.getCalculationDataObject(elementCode, LOW_INT, PRIMARY_SUBSTATION);
end;


function TDMReports.getTechCondServicesCodeByServicesCode(servicesCode : Integer): Integer;
var
  TempENTechConditionsServices : ENTechConditionsServicesControllerSoapPort;
  ENTechConditionsServicesList : ENTechConditionsServicesShortList;
  tcFilter : ENTechConditionsServicesFilter;
begin
  tcFilter := ENTechConditionsServicesFilter.Create;
  SetNullIntProps(tcFilter);
  SetNullXSProps(tcFilter);
  tcFilter.conditionSQL := ' entechconditionsservcs.code = ( '+
    ' select ts.techcondservrefcode '+
    ' from enservicesobject2techcondtnsservices ts '+
    ' where ts.servicesobjectrefcode = ' + IntToStr(servicesCode) + ')';

  TempENTechConditionsServices := HTTPRIOENTechConditionsServices as ENTechConditionsServicesControllerSoapPort;
  ENTechConditionsServicesList := TempENTechConditionsServices.getScrollableFilteredList(tcFilter, 0, -1);

  if ENTechConditionsServicesList.totalCount > 0 then
    result := ENTechConditionsServicesList.list[0].code
  else
    result := LOW_INT;
end;


function TDMReports.getTKTechCardByHumenItemCode(humenItemCode: Integer): TKTechCard;
var
  TempENHumenItem: ENHumenItemControllerSoapPort;
  TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
  TempTKTechCard: TKTechCardControllerSoapPort;
  humenItemObj: ENHumenItem;
  planItemObj: ENPlanWorkItem;
begin
  Result := nil;

  TempENHumenItem := HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;
  humenItemObj := TempENHumenItem.getObject(humenItemCode);
  if humenItemObj = nil then Exit;
  if humenItemObj.planItemRef = nil then Exit;
  if humenItemObj.planItemRef.code = LOW_INT then Exit;

  TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
  planItemObj := TempENPlanWorkItem.getObject(humenItemObj.planItemRef.code);
  if planItemObj = nil then Exit;
  if planItemObj.kartaRef = nil then Exit;
  if planItemObj.kartaRef.code = LOW_INT then Exit;

  TempTKTechCard := HTTPRIOTKTechCard as TKTechCardControllerSoapPort;
  Result := TempTKTechCard.getObject(planItemObj.kartaRef.code);
end;

function TDMReports.checkSolidaryConnections(tcsCode : Integer): Boolean;
var
  TempENUnitedGroup2TechCondServices : ENUnitedGroup2TechCondServicesControllerSoapPort;
  groupFilter : ENUnitedGroup2TechCondServicesFilter;
  tcsCodesArr : ENUnitedGroup2TechCondServicesController.ArrayOfInteger;
begin
  Result := false;

  if tcsCode = LOW_INT then Exit;

  TempENUnitedGroup2TechCondServices := HTTPRIOENUnitedGroup2TechCondServices as ENUnitedGroup2TechCondServicesControllerSoapPort;

  groupFilter := ENUnitedGroup2TechCondServicesFilter.Create;
  SetNullIntProps(groupFilter);
  SetNullXSProps(groupFilter);

  groupFilter.techCondServRef := ENTechConditionsServicesRef.Create;
  groupFilter.techCondServRef.code := tcsCode;

  tcsCodesArr := TempENUnitedGroup2TechCondServices.getScrollableFilteredCodeArray(groupFilter, 0, -1);

  if High(tcsCodesArr) > -1 then
    Result := true;
end;


function TDMReports.checkLandSheetStageForServicesObject(
  servicesObjectCode: Integer): Boolean;
var
  strVal: String;
  intVal: Integer;
begin
  Result := false;

  strVal := getENSOStringValueForServicesObject(servicesObjectCode, ENSOVALUESTYPE_LAND_SHEET_STAGE_NUMBER);
  if strVal = '' then Exit;

  try
    intVal := StrToInt(strVal);
    if (intVal >= 1) and (intVal <= 5) then
      Result := true;
  except on EConvertError do
  end;
end;

function TDMReports.checkLinesCost(tcsCode : Integer): Boolean;
var
  TempENUnitedGroup2TechCondServices : ENUnitedGroup2TechCondServicesControllerSoapPort;
  groupFilter : ENUnitedGroup2TechCondServicesFilter;
  tcsList : ENUnitedGroup2TechCondServicesShortList;
begin
  Result := True;

  if tcsCode = LOW_INT then Exit;

  TempENUnitedGroup2TechCondServices := HTTPRIOENUnitedGroup2TechCondServices as ENUnitedGroup2TechCondServicesControllerSoapPort;

  groupFilter := ENUnitedGroup2TechCondServicesFilter.Create;
  SetNullIntProps(groupFilter);
  SetNullXSProps(groupFilter);

  groupFilter.techCondServRef := ENTechConditionsServicesRef.Create;
  groupFilter.techCondServRef.code := tcsCode;

  tcsList := TempENUnitedGroup2TechCondServices.getScrollableFilteredList(groupFilter, 0, -1);

  if (tcsList.totalCount > 0) then
    if ((tcsList.list[0].costLines04Building = nil) and (tcsList.list[0].costLines10Building = nil)) then
      Result := False;
end;


function TDMReports.checkMoveToFK(servicesObjectCode: Integer): Boolean;
var
  TempENServicesObjectController: ENServicesObjectControllerSoapPort;
begin
  Result := false;

  TempENServicesObjectController := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

  try
    TempENServicesObjectController.checkMoveToFK(servicesObjectCode);
  except
    on E: Exception do
    begin
      if pos('SUPP-100352-PROV', E.Message) > 0 then
      begin
        if pos('SUPP-100352-PROV_ERROR', E.Message) > 0 then
        begin
          //Application.MessageBox(PChar('Помилка перевірки проводок за договором!' + #13#10 +
          //                             'Для перегляду некоректних проводок натисніть' + #13#10 +
          //                             '"ПРОВЕДЕННЯ (формування проводок у Фінансах)" -> "ПРОВЕСТИ"'),
          //                       PChar('Помилка!'),
          //                       MB_ICONERROR)
          Application.MessageBox(PChar('Помилка перевірки проводок за договором!' + #13#10 +
                                       'Зараз будуть відображені помилкові проводки.'),
                                 PChar('Помилка!'),
                                 MB_ICONERROR);
          viewBadPostings(servicesObjectCode);
        end
        else if pos('SUPP-100352-PROV_OK', E.Message) > 0 then
          Result := true;
      end
      else begin
        Application.MessageBox(PChar(E.Message), PChar('Помилка!'), MB_ICONERROR);
        Exit;
      end;

      Exit;
    end;
  end;

  Result := true;
end;

function TDMReports.checkPowerCategory(tcsCode: Integer): Boolean;
var
  TempENTechConditionsObjects : ENTechConditionsObjectsControllerSoapPort;
  tcsFilter : ENTechConditionsObjectsFilter;
  tcsCodesArr : ENTechConditionsObjectsController.ArrayOfInteger;
begin
  Result := false;
  if tcsCode = LOW_INT then Exit;

  TempENTechConditionsObjects := HTTPRIOENTechConditionsObjects as ENTechConditionsObjectsControllerSoapPort;

  tcsFilter := ENTechConditionsObjectsFilter.Create;
  SetNullIntProps(tcsFilter);
  SetNullXSProps(tcsFilter);

  tcsFilter.conditionSQL := 'code in ( ' +
       ' select tcs.code from encontragent a, entechconditionsservcs tc, entechconditionsobjcts tcs ' +
       ' where tc.code = a.techcondservicesrefcod ' +
       ' and a.techconobjectscode = tcs.code ' +
       ' and tc.code = ' + IntToStr(tcsCode) +
       ' and tcs.categoryrefcode in (' + IntToStr(CAT2_CITY) + ',' + IntToStr(CAT2_LAND) + ') )';

  tcsCodesArr := TempENTechConditionsObjects.getScrollableFilteredCodeArray(tcsFilter, 0, -1);

  if High(tcsCodesArr) > -1 then
    Result := true;
end;


function TDMReports.getPriconnectionDataPrimarySubstation(servicesCode : Integer; primarySubstation : Integer): ENPriconnectionData;
var //i : Integer;
  TempENPriconnectionData : ENPriconnectionDataControllerSoapPort;
  dataFilter : ENPriconnectionDataFilter;
  ENPriconnectionDataList : ENPriconnectionDataShortList;
begin
  TempENPriconnectionData := HTTPRIOENPriconnectionData as ENPriconnectionDataControllerSoapPort;

  dataFilter := ENPriconnectionDataFilter.Create;
  SetNullIntProps(dataFilter);
  SetNullXSProps(dataFilter);
  dataFilter.techCondServRef := ENTechConditionsServicesRef.Create;
  dataFilter.techCondServRef.code := servicesCode;
  dataFilter.isPrimarySubstation := primarySubstation;

  ENPriconnectionDataList := TempENPriconnectionData.getScrollableFilteredList(ENPriconnectionDataFilter(dataFilter),0,-1);

  if ENPriconnectionDataList.totalCount > 0 then
    result := TempENPriconnectionData.getObject(ENPriconnectionDataList.list[0].code)
  else
    result := nil;
end;


function TDMReports.getMolByFinCode(finMolCode : String): ENMol;
var
  filterMol : FINMolFilter;
  TempFINMol : FINMolControllerSoapPort;
  FINMolList : FINMolShortList;
  mol : ENMol;
begin
  filterMol := FINMolFilter.Create;
  SetNullIntProps(filterMol);
  SetNullXSProps(filterMol);
  filterMol.state := ENMOLSTATUS_ACTIVE;
  //filterMol.conditionSQL := ' UMC_DBA.TDIVISION.ID in (' + finMolCode + ')';
  generateMOLFilter(filterMol, finMolCode);

  TempFINMol := HTTPRIOFINMol as FINMolControllerSoapPort;
  FINMolList := TempFINMol.getScrollableFilteredList(filterMol,0,1);

  if FINMolList.totalCount > 0 then
  begin
    mol := ENMol.Create;
    mol.finCode := FINMolList.list[0].id;
    mol.name := FINMolList.list[0].text;
  end else
    mol := nil;
  result := mol;
end;


function TDMReports.getStandartKoefInPeriod( constCode : Integer ; period : TDateTime ): Real;
var

  TempENStandardConstEntry: ENStandardConstEntryControllerSoapPort;
  ENStandardConstEntryList: ENStandardConstEntryShortList;
  TempENStandardConstEntryFilter : ENStandardConstEntryFilter;
begin
  TempENStandardConstEntryFilter := ENStandardConstEntryFilter.Create;
  SetNullIntProps(TempENStandardConstEntryFilter);
  SetNullXSProps(TempENStandardConstEntryFilter);

  TempENStandardConstEntryFilter.constRef := ENStandardConstRef.Create;
  TempENStandardConstEntryFilter.constRef.code  :=  constCode;
  TempENStandardConstEntryFilter.conditionSQL := ''''+DateTimeToStr(period) + '''' + 'between startdate and enddate';

  TempENStandardConstEntry :=  HTTPRIOENStandardConstEntry as ENStandardConstEntryControllerSoapPort;
  ENStandardConstEntryList :=   TempENStandardConstEntry.getScrollableFilteredList(TempENStandardConstEntryFilter,0,-1);

  if ENStandardConstEntryList.totalCount > 0 then
    result := StrToFloat(ENStandardConstEntryList.list[0].constEntry.DecimalString)
  else
    result := LOW_INT;
end;


{код подразделения }
function TDMReports.getEPRenShortList(enelementcode : Integer):EPRenShortList;
var
TempEPRen: EPRenControllerSoapPort;
renFilter : EPRenFilter;
EPRenList: EPRenShortList;
begin
  TempEPRen :=  HTTPRIOEPRen as EPRenControllerSoapPort;
     renFilter := EPRenFilter.Create;
     SetNullIntProps(renFilter);
     SetNullXSProps(renFilter);

     renFilter.conditionSQL := 'code in ( select distinct el.renrefcode from enelement el where el.code = ' +IntToStr( enelementcode) + ' ) ';


   EPRenList := TempEPRen.getScrollableFilteredList(EPRenFilter(renFilter),0, -1);
   Result :=  EPRenList;
end;


function TDMReports.getStrCodePlanFromIPItem(IPItemCode : Integer) : WideString;
var
  i : Integer;
  TempENIPItem2Plan : ENIPItem2PlanControllerSoapPort;
  ENIPItem2PlanList : ENIPItem2PlanShortList;
  ip2PlanFilter : ENIPItem2PlanFilter;
  s : string;
begin
  s:='-1';
  TempENIPItem2Plan := HTTPRIOENIPItem2Plan as ENIPItem2PlanControllerSoapPort;

  ip2PlanFilter := ENIPItem2PlanFilter.Create;
  SetNullIntProps(ip2PlanFilter);
  SetNullXSProps(ip2PlanFilter);
  ip2PlanFilter.ipItemRef := ENIPItemRef.Create;
  ip2PlanFilter.ipItemRef.code := IPItemCode;

  ENIPItem2PlanList := TempENIPItem2Plan.getScrollableFilteredList(ip2PlanFilter,0,-1);

  if ENIPItem2PlanList.totalCount > 0 then
     for i:=0 to ENIPItem2PlanList.totalCount -1 do
     begin
        if s= '-1' then
         s:= IntToStr(ENIPItem2PlanList.list[i].planRefCode)
        else
         s:= s + ',' + IntToStr(ENIPItem2PlanList.list[i].planRefCode);
     end;

  result := s;
end;


function TDMReports.getIp2PlanCodeByPlanCode(planCode : Integer; ipItemCode : Integer): Integer;

var
  TempENIPItem2Plan : ENIPItem2PlanControllerSoapPort;
  ENIPItem2PlanList : ENIPItem2PlanShortList;
  ip2PlanFilter : ENIPItem2PlanFilter;
begin
  ip2PlanFilter := ENIPItem2PlanFilter.Create;
  SetNullIntProps(ip2PlanFilter);
  SetNullXSProps(ip2PlanFilter);

  ip2PlanFilter.ipItemRef := ENIPItemRef.Create;
  ip2PlanFilter.ipItemRef.code := ipItemCode;
  ip2PlanFilter.planRef := ENPlanWorkRef.Create;
  ip2PlanFilter.planRef.code := planCode;

  TempENIPItem2Plan := HTTPRIOENIPItem2Plan as ENIPItem2PlanControllerSoapPort;
  ENIPItem2PlanList := TempENIPItem2Plan.getScrollableFilteredList(ip2PlanFilter,0,-1);

  if ENIPItem2PlanList.totalCount > 0 then
    result := ENIPItem2PlanList.list[0].code
  else
    result := LOW_INT;
end;



function TDMReports.getCalc2TariffByTechCondCode(techCondCode : Integer): ENCalc2ConnectTariff;

var
  TempENCalc2ConnectTariff : ENCalc2ConnectTariffControllerSoapPort;
  calc2tariffFilter : ENCalc2ConnectTariffFilter;
  calc2tariffArr : ENCalc2ConnectTariffController.ArrayOfInteger;
begin
  Result := nil;

  calc2tariffFilter := ENCalc2ConnectTariffFilter.Create;
  SetNullIntProps(calc2tariffFilter);
  SetNullXSProps(calc2tariffFilter);

  calc2tariffFilter.techCondServRef := ENTechConditionsServicesRef.Create;
  calc2tariffFilter.techCondServRef.code := techCondCode;

  TempENCalc2ConnectTariff := HTTPRIOENCalc2ConnectTariff as ENCalc2ConnectTariffControllerSoapPort;
  calc2tariffArr := TempENCalc2ConnectTariff.getScrollableFilteredCodeArray(calc2tariffFilter, 0, -1);

  if High(calc2tariffArr) > -1 then
    Result := TempENCalc2ConnectTariff.getObject(calc2tariffArr[0]);
end;


function TDMReports.chkPaymentByBudget(): Boolean;

var
 TempConfig: ConfigControllerSoapPort;
 ConfigObj: Config;
begin

  chkPaymentByBudget:= false;
   //вычитаем параметр проверять или нет, оплаты относительно принятого бюджета
  TempConfig := HTTPRIOConfig as ConfigControllerSoapPort;
  ConfigObj:=TempConfig.getObject(CONFIG_CHKPAYMENTBYBUDGET);

  if ConfigObj <> nil then
  begin
       if ConfigObj.value = '1' then
          chkPaymentByBudget  := true;
  end;

end;


procedure TDMReports.chooseDFDocSigner(sgDFDocSigners: TAdvStringGrid; ACol, ARow: Integer);
var
  //cellText: String;
  userFilter: User2StaffingFilter;
  frmUser2StaffingShow: TfrmUser2StaffingShow;
  TempUser2Staffing: User2StaffingControllerSoapPort;
begin
  TempUser2Staffing := HTTPRIOUser2Staffing as User2StaffingControllerSoapPort;

  userFilter := User2StaffingFilter.Create;
  SetNullIntProps(userFilter);
  SetNullXSProps(userFilter);
  userFilter.conditionSQL :=
    ' user2staffing.xoe = ' + IntToStr(YES) +
    ' and user2staffing.usercode in ( ' +
    ' select u.user_code from auth_user u where u.statuscode = ' + IntToStr(USER_STATUS_LEGAL) + ')';

  userFilter.orderBySQL := ' fio';

  frmUser2StaffingShow := TfrmUser2StaffingShow.Create(Application, fmNormal, userFilter);
  try
    with frmUser2StaffingShow do
    if ShowModal = mrOk then
    begin
      sgDFDocSigners.Cells[0, ARow] := sgUser2Staffing.Cells[0, sgUser2Staffing.Row];
      sgDFDocSigners.Cells[2, ARow] := sgUser2Staffing.Cells[1, sgUser2Staffing.Row];
      sgDFDocSigners.Cells[3, ARow] := sgUser2Staffing.Cells[2, sgUser2Staffing.Row];
      sgDFDocSigners.Cells[4, ARow] := sgUser2Staffing.Cells[3, sgUser2Staffing.Row];
    end;
  finally
    frmUser2StaffingShow.Free;
  end;

  //sgDFDocSigners.EditMode := true;
end;

// проверка договора на связь с Заявлением потребителя в DocFlow...
function TDMReports.checkServicesConsumer(soCode : Integer) : Boolean;
var
  TempDFDoc2ENServicesObject : DFDoc2ENServicesObjectControllerSoapPort;
  doc2ENServicesObjectFilter : DFDoc2ENServicesObjectFilter;
  doc2soArr : DFDoc2ENServicesObjectController.ArrayOfInteger;
begin
  Result := false;

  if soCode = LOW_INT then Exit;

  TempDFDoc2ENServicesObject :=  HTTPRIODFDoc2ENServicesObject as DFDoc2ENServicesObjectControllerSoapPort;

  doc2ENServicesObjectFilter := DFDoc2ENServicesObjectFilter.Create;
  SetNullIntProps(doc2ENServicesObjectFilter);
  SetNullXSProps(doc2ENServicesObjectFilter);

  doc2ENServicesObjectFilter.servicesObjectCode := soCode;

  doc2soArr := TempDFDoc2ENServicesObject.getScrollableFilteredCodeArray(doc2ENServicesObjectFilter, 0, -1);

  if High(doc2soArr) > -1 then
    Result := true;
end;


procedure TDMReports.makeGeneralReportPDFwithExecute(name: String; request: EPReportRequestEx; _type: String; pFileName : String);
var reportType, result, fname: String; //filename: String;
    TempENReport: ENReportControllerSoapPort;
    //outStream: TFileStream;
    res: TStrings;
begin

  reportType:='PDF';


  if (reportType = 'PDF') then
  begin

    TempENReport := HTTPRIOENReport as ENReportControllerSoapPort;

    if (upperCase(_type) = 'PDF') then
      result:=TempENReport.processAsPDF(request)
    else if  (upperCase(_type) = 'XLS') then
      result:=TempENReport.processAsXLS(request);

    res:=TStringList.Create;
    try
      res.Add(Trim(result));

      // fname := pFileName;
      fname:=GetFileName(pFileName);

      if not DirectoryExists(ExtractFilePath(Application.ExeName)+TempReportsPath) then
        CreateDir(ExtractFilePath(Application.ExeName)+TempReportsPath);
      res.SaveToFile(ExtractFilePath(Application.ExeName)+TempReportsPath+fname+'.b64');
    finally
      res.Free;
    end;
    Decode(ExtractFilePath(Application.ExeName)+TempReportsPath+fname,('.'+_type));
    SysUtils.DeleteFile(ExtractFilePath(Application.ExeName)+TempReportsPath+fname+'.b64');

    ShellExecute(0,PChar('open'),PChar(ExtractFilePath(Application.ExeName)+TempReportsPath+fname+'.'+_type),
                  nil,nil,SW_SHOWMAXIMIZED);
end;
end;


// сумма оплаты по договору услуг на сторону
function TDMReports.getPaySumByServicesObject(soCode: Integer): Real;
var
  i : Integer;
  totalSum, itemSum : Double;
  TempENPayment2SO : ENPayment2SOControllerSoapPort;
  ENPayment2SOList : ENPayment2SOShortList;
  FilterPayment2SO : ENPayment2SOFilter;
begin
  FilterPayment2SO := ENPayment2SOFilter.Create;
  SetNullIntProps(FilterPayment2SO);
  SetNullXSProps(FilterPayment2SO);

  FilterPayment2SO.servicesObjectRef := ENServicesObjectRef.Create;
  FilterPayment2SO.servicesObjectRef.code := soCode;

  TempENPayment2SO := HTTPRIOENPayment2SO as ENPayment2SOControllerSoapPort;
  ENPayment2SOList := TempENPayment2SO.getScrollableFilteredList(FilterPayment2SO, 0, -1);

  totalSum := -1;

  if ENPayment2SOList.totalCount > 0 then
  begin
    totalSum := 0;
    for i := 0 to High(ENPayment2SOList.list) do
    begin
      itemSum := 0;
      itemSum := StrToFloat(ENPayment2SOList.list[i].sumTotal.DecimalString);
      if (ENPayment2SOList.list[i].paymentTypeRefCode = ENPAYMENT2SOTYPE_BACK_MONEY) then
        itemSum := -itemSum;
      totalSum := totalSum + itemSum;
    end;
    result := totalSum;
  end else
    result := totalSum;
end;

procedure TDMReports.initDFDocSignersGrid(const anObject: TObject; form: TDialogForm;
  sgDFDocSigners: TAdvStringGrid; setDefaultSigners: Boolean);
var
  DFDocSubtype2SignerTypeList: DFDocSubtype2SignerTypeShortList;
  dfDocSignerTypeCount, i, signerTypeCode: Integer;
  defaultSigner: User2Staffing;
begin
  form.ClearGrid(sgDFDocSigners);

  DFDocSubtype2SignerTypeList := getDocSignerTypesForObject(anObject);
  if DFDocSubtype2SignerTypeList = nil then Exit;

  dfDocSignerTypeCount := High(DFDocSubtype2SignerTypeList.list) + 1;

  if dfDocSignerTypeCount <= 0 then Exit;

  with sgDFDocSigners do
    for i := 0 to dfDocSignerTypeCount - 1 do
    begin
      Application.ProcessMessages;
      //if DFDocSubtype2SignerTypeList.list[i].signerTypeRefCode <> Low(Integer) then
      //  Cells[0,i+1] := IntToStr(DFDocSubtype2SignerTypeList.list[i].signerTypeRefCode)
      //else
      //  Cells[0,i+1] := '';
      Cells[1, i + 1] := DFDocSubtype2SignerTypeList.list[i].signerTypeRefName;

      signerTypeCode := DFDocSubtype2SignerTypeList.list[i].signerTypeRefCode;
      Objects[0, i + 1] := TObject(signerTypeCode);

      if setDefaultSigners then
      begin
        defaultSigner := nil;
        if form.DialogState <> dsView then
          defaultSigner := getDefaultDocSignerForObject(anObject, signerTypeCode);

        if defaultSigner <> nil then
        begin
          Cells[0, i + 1] := IntToStr(defaultSigner.user.code);
          Cells[2, i + 1] := defaultSigner.tabNumber;
          Cells[3, i + 1] := defaultSigner.fio;
          Cells[4, i + 1] := defaultSigner.postNazv;
        end;
      end;

      sgDFDocSigners.RowCount := i + 2;
    end;
end;

// NET-4503 Функция для проверки, является ли обязательным примечание на работах в плане
function TDMReports.isCommentRequiredForPlanWorkItems(
  plan: ENPlanWork): boolean;
begin
  Result := false;

  if plan = nil then Exit;
  if plan.kind = nil then Exit;
  if plan.budgetRef = nil then Exit;

  if plan.kind.code <> ENPLANWORKKIND_FACT then Exit;

  if (plan.budgetRef.code = ENBUDGET_SRM) or
     (plan.budgetRef.code = ENBUDGET_SPS) or
     (plan.budgetRef.code = ENBUDGET_SKEM) or
     (plan.budgetRef.code = ENBUDGET_SVEM) or
     (plan.budgetRef.code = ENBUDGET_RZA) or
     (plan.budgetRef.code = ENBUDGET_SIZPI) then
    Result := true;
end;


function TDMReports.isDocSignersOnHolidaysDescriptive(
  const dfDocSigners: ArrayOfDFDocSigner; const anObject: TObject): String;
var
  TempDFDocSigner: DFDocSignerControllerSoapPort;
begin
  TempDFDocSigner := HTTPRIODFDocSigner as DFDocSignerControllerSoapPort;
  Result := TempDFDocSigner.isDocSignersOnHolidaysDescriptive(dfDocSigners, anObject);
end;

function TDMReports.isEICRequired(soCode: Integer): Boolean;
var
  servicesConsumer: DFDocServicesConsumer;
  servicesConsumerKind: DFDocServicesConsumerKind;
begin
  // SUPP-106102 06.12.2021 если услуга не связана с документооборотом, то EIC-код является необязательным для заполнения
  Result := false;

  servicesConsumer := getServicesConsumer(soCode);
  if servicesConsumer <> nil then
  begin
    servicesConsumerKind := getServicesKindByServicesConsumerCode(servicesConsumer.code);
    if (servicesConsumerKind <> nil) and (servicesConsumerKind.requiredEIC = YES) then
      Result := true;
  end;
end;

function TDMReports.isPlanWithSeals(planCode: Integer): Boolean;
var
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  estimateFilter: ENEstimateItemFilter;
  estimateCodes: ENEstimateItemController.ArrayOfInteger;
begin
  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

  estimateFilter := ENEstimateItemFilter.Create;
  SetNullXSProps(estimateFilter);
  SetNullIntProps(estimateFilter);

  estimateFilter.conditionSQL :=
    ' code in ( ' +
    '   select ei.code ' +
    '   from enplanwork p, enestimateitem ei ' +
    '   where ei.planrefcode = p.code ' +
    '     and p.code = ' + IntToStr(planCode) +
    '     and ei.countfact > 0 ' +
    '     and ei.accountingtyperefcode in (' + TK_ACCOUNTINGTYPE_ALL_SEALS + ') ' +
    ' )';

  estimateCodes := TempENEstimateItem.getFilteredCodeArray(estimateFilter, 0, -1);

  Result := Length(estimateCodes) > 0;
end;

function TDMReports.isSignable(const anObject: TObject): Boolean;
var
  TempDFDoc: DFDocControllerSoapPort;
begin
  TempDFDoc := HTTPRIODFDoc as DFDocControllerSoapPort;
  Result := TempDFDoc.isSignable(anObject);

  ///*** ВРЕМЕННО! Для запуска механизма подписания документов с помощью ЭЦП нужно убрать!!!
  // Result := false;
  ///***
end;

function TDMReports.isWorkOrderBytWithSeals(workOrderBytCode: Integer): Boolean;
var
  TempENWorkOrderByt: ENWorkOrderBytControllerSoapPort;
  workOrderBytFilter: ENWorkOrderBytFilter;
  workOrderBytCodes: ENWorkOrderBytController.ArrayOfInteger;
begin
  TempENWorkOrderByt := HTTPRIOENWorkOrderByt as ENWorkOrderBytControllerSoapPort;

  workOrderBytFilter := ENWorkOrderBytFilter.Create;
  SetNullXSProps(workOrderBytFilter);
  SetNullIntProps(workOrderBytFilter);

  workOrderBytFilter.conditionSQL :=
    ' code in ( ' +
    '   select distinct wbi.workorderbytrefcode ' +
    '   from ' +
    '     enestimateitem ei, enplanworkitem pi, ' +
    '     enworkorderbytitem wbi ' +
    '   where ei.planitemrefcode = pi.code ' +
    '     and wbi.planitemrefcode = pi.code ' +
    '     and pi.countgen > 0 ' +
    '     and wbi.workorderbytrefcode = ' + IntToStr(workOrderBytCode) +
    '     and ei.countfact > 0 ' +
    '     and ei.accountingtyperefcode in (' + TK_ACCOUNTINGTYPE_ALL_SEALS + ') ' +
    ' )';

  workOrderBytCodes := TempENWorkOrderByt.getScrollableFilteredCodeArray(workOrderBytFilter, 0, -1);

  Result := Length(workOrderBytCodes) > 0;
end;


procedure TDMReports.loadDFDocSigners(const anObject: TObject; form: TDialogForm;
  sgDFDocSigners: TAdvStringGrid);
var
  DFDocSignerList: DFDocSignerShortList;
  dfDocSignerCount, docCode, i: Integer;
begin
  form.ClearGrid(sgDFDocSigners);

  docCode := getDocCodeForObject(anObject);
  if docCode <= 0 then
  begin
    // Если связанный документ еще не создан, просто проинициализируем грид
    // (посоздаем пустые строки с типами подписантов)
    initDFDocSignersGrid(anObject, form, sgDFDocSigners);
    Exit;
  end;

  DFDocSignerList := getDFDocSignersForDoc(docCode);
  dfDocSignerCount := High(DFDocSignerList.list) + 1;

  if dfDocSignerCount <= 0 then
  begin
    // Если подписантов еще не завели, просто проинициализируем грид
    // (посоздаем пустые строки с типами подписантов)
    initDFDocSignersGrid(anObject, form, sgDFDocSigners);
    Exit;
  end;

  with sgDFDocSigners do
    for i := 0 to dfDocSignerCount - 1 do
    begin
      Application.ProcessMessages;
      if DFDocSignerList.list[i].userCode <> Low(Integer) then
        Cells[0,i+1] := IntToStr(DFDocSignerList.list[i].userCode)
      else
        Cells[0,i+1] := '';
      Cells[1,i+1] := DFDocSignerList.list[i].signerTypeRefName;
      Cells[2,i+1] := DFDocSignerList.list[i].tabNumber;
      Cells[3,i+1] := DFDocSignerList.list[i].fio;
      Cells[4,i+1] := DFDocSignerList.list[i].postInfo;

      Objects[0,i+1] := TObject(DFDocSignerList.list[i].signerTypeRefCode);

      sgDFDocSigners.RowCount := i + 2;
    end;
end;

function TDMReports.getSealsCountForWorkOrderByt(workOrderBytCode: Integer): Integer;
var
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  estimateFilter: ENEstimateItemFilter;
  estimateItem: ENEstimateItem;
  estimateCodes: ENEstimateItemController.ArrayOfInteger;
  i, sealCount, tmpCount: Integer;
begin
  Result := 0;
  sealCount := 0;

  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

  estimateFilter := ENEstimateItemFilter.Create;
  SetNullXSProps(estimateFilter);
  SetNullIntProps(estimateFilter);

  estimateFilter.conditionSQL :=
    ' code in ( ' +
    '   select distinct ei.code ' +
    '   from ' +
    '     enestimateitem ei, enplanworkitem pi, ' +
    '     enworkorderbytitem wbi ' +
    '   where ei.planitemrefcode = pi.code ' +
    '     and wbi.planitemrefcode = pi.code ' +
    '     and pi.countgen > 0 ' +
    '     and wbi.workorderbytrefcode = ' + IntToStr(workOrderBytCode) +
    '     and ei.countfact > 0 ' +
    '     and ei.accountingtyperefcode in (' + TK_ACCOUNTINGTYPE_ALL_SEALS + ') ' +
    ' )';

  estimateCodes := TempENEstimateItem.getFilteredCodeArray(estimateFilter, 0, -1);

  for i := 0 to High(estimateCodes) do
  begin
    estimateItem := TempENEstimateItem.getObject(estimateCodes[i]);

    if estimateItem = nil then
      raise Exception.Create('Не найден материал на плане! Код материала: ' + IntToStr(estimateCodes[i]));

    try
      tmpCount := Round(StrToFloat(estimateItem.countFact.DecimalString));
    except on EConvertError do
      raise Exception.Create('Ошибка в количестве материала! Код материала: ' + IntToStr(estimateCodes[i]));
    end;

    sealCount := sealCount + tmpCount;
  end;

  Result := sealCount;
end;

function TDMReports.getSCUsageInputByCode(scUsageInputCode: Integer): SCUsageInput;
var
  TempSCUsageInput: SCUsageInputControllerSoapPort;
begin
  TempSCUsageInput := HTTPRIOSCUsageInput as SCUsageInputControllerSoapPort;
  Result := TempSCUsageInput.getObject(scUsageInputCode);
end;

function TDMReports.getSCUsageInputByDocCode(docCode: Integer): SCUsageInput;
var
  TempSCUsageInput2DFDoc: SCUsageInput2DFDocControllerSoapPort;
  usageInput2DFDocFilter: SCUsageInput2DFDocFilter;
  usageInput2DFDocArr: SCUsageInput2DFDocController.ArrayOfInteger;
  usageInput2DFDoc: SCUsageInput2DFDoc;
begin
  Result := nil;
  if docCode <= 0 then Exit;

  usageInput2DFDocFilter := SCUsageInput2DFDocFilter.Create;
  SetNullIntProps(usageInput2DFDocFilter);
  SetNullXSProps(usageInput2DFDocFilter);

  usageInput2DFDocFilter.dfDocCode := docCode;

  TempSCUsageInput2DFDoc := HTTPRIOSCUsageInput2DFDoc as SCUsageInput2DFDocControllerSoapPort;
  usageInput2DFDocArr := TempSCUsageInput2DFDoc.getScrollableFilteredCodeArray(usageInput2DFDocFilter, 0, -1);

  if High(usageInput2DFDocArr) > -1 then
  begin
    usageInput2DFDoc := TempSCUsageInput2DFDoc.getObject(usageInput2DFDocArr[0]);
    if (usageInput2DFDoc <> nil) and
       (usageInput2DFDoc.scUsageInputRef <> nil) and
       (usageInput2DFDoc.scUsageInputRef.code <> LOW_INT) then
      Result := getSCUsageInputByCode(usageInput2DFDoc.scUsageInputRef.code);
  end;
end;

function TDMReports.getSealsCountForWorkOrderByt(workOrderBytCode,
  accountingTypeCode: Integer): Integer;
var
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  estimateFilter: ENEstimateItemFilter;
  estimateItem: ENEstimateItem;
  estimateCodes: ENEstimateItemController.ArrayOfInteger;
  i, sealCount, tmpCount: Integer;
begin
  Result := 0;
  sealCount := 0;

  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

  estimateFilter := ENEstimateItemFilter.Create;
  SetNullXSProps(estimateFilter);
  SetNullIntProps(estimateFilter);

  estimateFilter.conditionSQL :=
    ' code in ( ' +
    '   select distinct ei.code ' +
    '   from ' +
    '     enestimateitem ei, enplanworkitem pi, ' +
    '     enworkorderbytitem wbi ' +
    '   where ei.planitemrefcode = pi.code ' +
    '     and wbi.planitemrefcode = pi.code ' +
    '     and pi.countgen > 0 ' +
    '     and wbi.workorderbytrefcode = ' + IntToStr(workOrderBytCode) +
    '     and ei.countfact > 0 ' +
    //'     and ei.accountingtyperefcode in (' + TK_ACCOUNTINGTYPE_ALL_SEALS + ') ' +
    '     and ei.accountingtyperefcode = ' + IntToStr(accountingTypeCode) +
    ' )';

  estimateCodes := TempENEstimateItem.getFilteredCodeArray(estimateFilter, 0, -1);

  for i := 0 to High(estimateCodes) do
  begin
    estimateItem := TempENEstimateItem.getObject(estimateCodes[i]);

    if estimateItem = nil then
      raise Exception.Create('Не найден материал на плане! Код материала: ' + IntToStr(estimateCodes[i]));

    try
      tmpCount := Round(StrToFloat(estimateItem.countFact.DecimalString));
    except on EConvertError do
      raise Exception.Create('Ошибка в количестве материала! Код материала: ' + IntToStr(estimateCodes[i]));
    end;

    sealCount := sealCount + tmpCount;
  end;

  Result := sealCount;
end;

function TDMReports.getSealsCountForWorkOrderBytByFact(workOrderBytCode,
  accountingTypeCode: Integer): Integer;
var
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  estimateFilter: ENEstimateItemFilter;
  estimateItem: ENEstimateItem;
  estimateCodes: ENEstimateItemController.ArrayOfInteger;
  i, sealCount, tmpCount: Integer;
begin
  Result := 0;
  sealCount := 0;

  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

  estimateFilter := ENEstimateItemFilter.Create;
  SetNullXSProps(estimateFilter);
  SetNullIntProps(estimateFilter);

// 08.07.16 Возникают ситуации, когда работу с пломбами добавляют уже в Задание-Факт
// (или могут просто добавить пломбы в работу в Задании-Факте)
{
  estimateFilter.conditionSQL :=
    ' code in ( ' +
    '   select distinct ei1.code ' +
    '   from ' +
    '     enestimateitem ei, enestimateitem ei1, ' +
    '     enestimateitem2nstmttm ei2ei, ' +
    '     enplanworkitem pi, ' +
    '     enworkorderbytitem wbi ' +
    '   where ei.planitemrefcode = pi.code ' +
    '     and ei.materialrefcode = ei1.materialrefcode ' +
    '     and ei2ei.estimateiteminrefcode = ei.code ' +
    '     and ei2ei.estimateitemoutrefcode = ei1.code ' +
    '     and ei2ei.typerefcode = ' + IntToStr(ENESTIMATEITEM2ENESTIMATEITEM_TYPE_PLAN_MOVED) +
    '     and wbi.planitemrefcode = pi.code ' +
    '     and pi.countgen > 0 ' +
    '     and wbi.workorderbytrefcode = ' + IntToStr(workOrderBytCode) +
    '     and ei.countfact > 0 ' +
    '     and ei1.countfact > 0 ' +
    //'     and ei.accountingtyperefcode in (' + TK_ACCOUNTINGTYPE_ALL_SEALS + ') ' +
    '     and ei.accountingtyperefcode = ' + IntToStr(accountingTypeCode) +
    //'     and ei1.accountingtyperefcode = ' + IntToStr(accountingTypeCode) +
    ' )';
}

  estimateFilter.conditionSQL :=
    ' code in ( ' +
    '   select distinct ei.code ' +
    '   from ' +
    '      ENWORKORDERBYTITEM wbi, ' +
    '      enestimateitem ei, ' +
    '      enplanwork plan, ' +
    '      enplanwork fact, ' +
    '      enplancorrecthistory ch ' +
    '   where  ' +
    '      ei.planrefcode = fact.code ' +
    '      and wbi.planrefcode = plan.code ' +
    '      and plan.code = ch.planoldrefcode ' +
    '      and fact.code = ch.plannewrefcode ' +
    '      and ch.reasoncode = ' + IntToStr(CORRECTREASON_MOVE_TO_FACT) +
    '      and wbi.workorderbytrefcode = ' + IntToStr(workOrderBytCode) +
    '      and ei.countfact > 0 ' +
    '      and ei.accountingtyperefcode = ' + IntToStr(accountingTypeCode) +
    ' )';

  estimateCodes := TempENEstimateItem.getFilteredCodeArray(estimateFilter, 0, -1);

  for i := 0 to High(estimateCodes) do
  begin
    estimateItem := TempENEstimateItem.getObject(estimateCodes[i]);

    if estimateItem = nil then
      raise Exception.Create('Не найден материал на плане! Код материала: ' + IntToStr(estimateCodes[i]));

    try
      tmpCount := Round(StrToFloat(estimateItem.countFact.DecimalString));
    except on EConvertError do
      raise Exception.Create('Ошибка в количестве материала! Код материала: ' + IntToStr(estimateCodes[i]));
    end;

    sealCount := sealCount + tmpCount;
  end;

  Result := sealCount;
end;

// SUPP-87593 Признак "Погодження проведення планових робіт споживачем" на связке плана с заявками с Call-Center'а
function TDMReports.checkIfApprovalByCustomer(planCode: Integer): Boolean;
var
  TempENPlanWork2CCDamageLog: ENPlanWork2CCDamageLogControllerSoapPort;
  plan2damageLogFilter: ENPlanWork2CCDamageLogFilter;
begin
  Result := false;

  if planCode <= 0 then Exit;

  plan2damageLogFilter := ENPlanWork2CCDamageLogFilter.Create;
  SetNullIntProps(plan2damageLogFilter);
  SetNullXSProps(plan2damageLogFilter);

  plan2damageLogFilter.needsApprovalByCustomer := 1;
  plan2damageLogFilter.planRef := ENPlanWorkRef.Create();
  plan2damageLogFilter.planRef.code := planCode;

  TempENPlanWork2CCDamageLog := HTTPRIOENPlanWork2CCDamageLog as ENPlanWork2CCDamageLogControllerSoapPort;
  Result := (High(TempENPlanWork2CCDamageLog.getScrollableFilteredCodeArray(plan2damageLogFilter, 0, -1)) > -1);
end;

// SUPP-31364 работы по проектированию внутренних сетей
function TDMReports.checkInnerNetProject(soElementCode : Integer) : Boolean;
var
  TempENPlanWork2ClassificationType : ENPlanWork2ClassificationTypeControllerSoapPort;
  plan2ctFilter : ENPlanWork2ClassificationTypeFilter;
  plan2ctList : ENPlanWork2ClassificationTypeShortList;
begin
  Result := False;

  if soElementCode = LOW_INT then Exit;

  TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;
  plan2ctFilter := ENPlanWork2ClassificationTypeFilter.Create;
  SetNullIntProps(plan2ctFilter);
  SetNullXSProps(plan2ctFilter);

  plan2ctFilter.conditionSQL := ' code in (select tcl.code ' +
     'from enplanwork2classfctntp tcl, tkclassificationtype t ' +
     ' where tcl.classificationtyperfcd = t.code ' +
     ' and t.innernetproject = 1 ' +
     ' and tcl.planrefcode in (select p.code from enplanwork p where p.elementrefcode = ' +
    IntToStr(soElementCode) + ' and p.kindcode = ' + IntToStr(ENPLANWORKKIND_CALCULATION) + '))';

  plan2ctList := TempENPlanWork2ClassificationType.getScrollableFilteredList(plan2ctFilter, 0, -1);

  if (plan2ctList.totalCount > 0) then
    Result := True;
end;


// NET-4422... 04.02.2015... +++ работа по замене счетчика (переход на многотарифный учет)
function TDMReports.checkReplaceCounterServices(soElementCode : Integer) : Boolean;
var
  TempENPlanWork2ClassificationType : ENPlanWork2ClassificationTypeControllerSoapPort;
  plan2ctFilter : ENPlanWork2ClassificationTypeFilter;
  plan2ctList : ENPlanWork2ClassificationTypeShortList;
begin
  Result := False;

  if soElementCode = LOW_INT then Exit;

  TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;
  plan2ctFilter := ENPlanWork2ClassificationTypeFilter.Create;
  SetNullIntProps(plan2ctFilter);
  SetNullXSProps(plan2ctFilter);

  plan2ctFilter.conditionSQL := ' code in (select tcl.code ' +
     'from enplanwork2classfctntp tcl, tkclassificationtype t ' +
     ' where tcl.classificationtyperfcd = t.code ' +
     ' and t.replacecounterkindcode = ' + IntToStr(TKREPLACECOUNTERKIND_REPLACE_COUNTER) +
     ' and tcl.planrefcode in (select p.code from enplanwork p where p.elementrefcode = ' +
    IntToStr(soElementCode) + ' and p.kindcode = ' + IntToStr(ENPLANWORKKIND_CALCULATION) + '))';

  plan2ctList := TempENPlanWork2ClassificationType.getScrollableFilteredList(plan2ctFilter, 0, -1);

  if (plan2ctList.totalCount > 0) then
    Result := True;
end;


// +++ работы по параметризации счетчика (переход на многотарифный учет)
function TDMReports.checkParameterizationCounterServices(soElementCode : Integer) : Boolean;
var
  TempENPlanWork2ClassificationType : ENPlanWork2ClassificationTypeControllerSoapPort;
  plan2ctFilter : ENPlanWork2ClassificationTypeFilter;
  plan2ctList : ENPlanWork2ClassificationTypeShortList;
begin
  Result := False;

  if soElementCode = LOW_INT then Exit;

  TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;
  plan2ctFilter := ENPlanWork2ClassificationTypeFilter.Create;
  SetNullIntProps(plan2ctFilter);
  SetNullXSProps(plan2ctFilter);

  plan2ctFilter.conditionSQL := ' code in (select tcl.code ' +
     'from enplanwork2classfctntp tcl, tkclassificationtype t ' +
     ' where tcl.classificationtyperfcd = t.code ' +
     ' and t.replacecounterkindcode = ' + IntToStr(TKREPLACECOUNTERKIND_PARAMETERIZATION_COUNTER) +
     ' and tcl.planrefcode in (select p.code from enplanwork p where p.elementrefcode = ' +
    IntToStr(soElementCode) + ' and p.kindcode = ' + IntToStr(ENPLANWORKKIND_CALCULATION) + '))';

  plan2ctList := TempENPlanWork2ClassificationType.getScrollableFilteredList(plan2ctFilter, 0, -1);

  if (plan2ctList.totalCount > 0) then
    Result := True;
end;


function TDMReports.checkOzToReplaceCounterServices(actCode : Integer) : Boolean;
var
  TempSCUsageInput : SCUsageInputControllerSoapPort;
  scFilter : SCUsageInputFilter;
  scUsageInputList : SCUsageInputShortList;
begin
  Result := False;
  if actCode = LOW_INT then Exit;

  TempSCUsageInput := HTTPRIOSCUsageInput as SCUsageInputControllerSoapPort;
  scFilter := SCUsageInputFilter.Create;
  SetNullIntProps(scFilter);
  SetNullXSProps(scFilter);

  scFilter.conditionSQL := ' scusageinput.code in ( ' +
      ' select a2s.scusageinputrefcode ' +
      ' from enact2scusageinput a2s where a2s.actrefcode = ' + IntToStr(actCode) + ')';

  scUsageInputList := TempSCUsageInput.getScrollableFilteredList(scFilter, 0, -1);

  if (scUsageInputList.totalCount > 0) then
    Result := True;
end;


function TDMReports.getConnectionKindForServicesObject(servicesObjectCode: Integer): Integer;
var
  TempServicesObject: ENServicesObjectControllerSoapPort;
begin
  TempServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  Result := TempServicesObject.getConnectionKind(servicesObjectCode);
end;

function TDMReports.getCountTaskSPAByNodeCode(CCNodeCode : Integer) : ArrayOfString;
var
  i : Integer;
  expiredCount : Double;
  TempDFTaskSPA : DFTaskSPAControllerSoapPort;
  taskSPAList : DFTaskSPAShortList;
  taskFilter : DFTaskSPAFilter;
  totalCount : string;
  dataCount : ArrayOfString;
begin
  totalCount := '0';
  expiredCount := 0;

  TempDFTaskSPA := HTTPRIODFTaskSPA as DFTaskSPAControllerSoapPort;

  taskFilter := DFTaskSPAFilter.Create;
  SetNullIntProps(taskFilter);
  SetNullXSProps(taskFilter);
  taskFilter.nodeCode := CCNodeCode;

  taskSPAList := TempDFTaskSPA.getDFTaskSPAByNodeCodeList(taskFilter,0,-1);

  if (taskSPAList.totalCount > 0) then
    totalCount := IntToStr(taskSPAList.totalCount);

  for i := 0 to High(taskSPAList.list) do
  begin
    if (taskSPAList.list[i].expired = 1) then
      expiredCount := expiredCount + 1;
  end;

  SetLength(dataCount, 2);

  dataCount[0] := totalCount;
  dataCount[1] := FloatToStr(expiredCount);

  result := dataCount;
end;

function TDMReports.getServiceNoteByDocCode(docCode : Integer) : DFDocServiceNote;
var
  TempDFDocServiceNote : DFDocServiceNoteControllerSoapPort;
  serviceNoteFilter : DFDocServiceNoteFilter;
  noteArr : DFDocServiceNoteController.ArrayOfInteger;
begin
  Result := nil;

  if docCode = LOW_INT then Exit;

  TempDFDocServiceNote := HTTPRIODFDocServiceNote as DFDocServiceNoteControllerSoapPort;

  serviceNoteFilter := DFDocServiceNoteFilter.Create;
  SetNullIntProps(serviceNoteFilter);
  SetNullXSProps(serviceNoteFilter);

  serviceNoteFilter.doc := DFDoc.Create;
  serviceNoteFilter.doc.code := docCode;

  noteArr := TempDFDocServiceNote.getScrollableFilteredCodeArray(serviceNoteFilter, 0, -1);

  if High(noteArr) > -1 then
    Result := TempDFDocServiceNote.getObject(noteArr[0]);
end;


function TDMReports.getInBoxByDocCode(docCode : Integer) : DFDocInBox;
var
  TempDFDocInBox : DFDocInBoxControllerSoapPort;
  docInBoxFilter : DFDocInBoxFilter;
  docInBoxArr : DFDocInBoxController.ArrayOfInteger;
begin
  Result := nil;

  if docCode = LOW_INT then Exit;

  TempDFDocInBox := HTTPRIODFDocInBox as DFDocInBoxControllerSoapPort;

  docInBoxFilter := DFDocInBoxFilter.Create;
  SetNullIntProps(docInBoxFilter);
  SetNullXSProps(docInBoxFilter);

  docInBoxFilter.doc := DFDoc.Create;
  docInBoxFilter.doc.code := docCode;

  docInBoxArr := TempDFDocInBox.getScrollableFilteredCodeArray(docInBoxFilter, 0, -1);

  if High(docInBoxArr) > -1 then
    Result := TempDFDocInBox.getObject(docInBoxArr[0]);
end;

{
Получить объект исходящего документа по коду документа
}
function TDMReports.getOutBoxByDocCode(docCode : Integer) : DFDocOutBox;
var
  TempDFDocOutBox : DFDocOutBoxControllerSoapPort;
  docOutBoxFilter : DFDocOutBoxFilter;
  docOutBoxArr : DFDocOutBoxController.ArrayOfInteger;
begin
  Result := nil;

  if docCode = LOW_INT then Exit;

  TempDFDocOutBox := HTTPRIODFDocOutBox as DFDocOutBoxControllerSoapPort;

  docOutBoxFilter := DFDocOutBoxFilter.Create;
  SetNullIntProps(docOutBoxFilter);
  SetNullXSProps(docOutBoxFilter);

  docOutBoxFilter.doc := DFDoc.Create;
  docOutBoxFilter.doc.code := docCode;

  docOutBoxArr := TempDFDocOutBox.getScrollableFilteredCodeArray(docOutBoxFilter, 0, -1);

  if High(docOutBoxArr) > -1 then
    Result := TempDFDocOutBox.getObject(docOutBoxArr[0]);
end;


function TDMReports.getDocAgreementByDocCode(docCode : Integer) : DFDocAgreement;
var
  TempDFDocAgreement : DFDocAgreementControllerSoapPort;
  docAgreementFilter : DFDocAgreementFilter;
  docAgreementArr : DFDocAgreementController.ArrayOfInteger;
begin
  Result := nil;

  if docCode = LOW_INT then Exit;

  TempDFDocAgreement := HTTPRIODFDocAgreement as DFDocAgreementControllerSoapPort;

  docAgreementFilter := DFDocAgreementFilter.Create;
  SetNullIntProps(docAgreementFilter);
  SetNullXSProps(docAgreementFilter);

  docAgreementFilter.conditionSQL := '( dfdocagreement.doccode = ' + IntToStr(docCode) +
    ' or dfdocagreement.doccode = ( ' +
    ' select d.parentrefcode from dfdoc d, dfdoc pr where d.parentrefcode = pr.code ' +
    ' and pr.statusrefcode <> ' + IntToStr(DFDOCSTATUS_CANCELED) + ' and d.code = ' + IntToStr(docCode) + '))';

  docAgreementArr := TempDFDocAgreement.getScrollableFilteredCodeArray(docAgreementFilter, 0, -1);

  if High(docAgreementArr) > -1 then
    Result := TempDFDocAgreement.getObject(docAgreementArr[0]);
end;


function TDMReports.getDocDecreeByDocCode(docCode : Integer) : DFDocDecree;
var
  TempDFDocDecree : DFDocDecreeControllerSoapPort;
  docDecreeFilter : DFDocDecreeFilter;
  docDecreeArr : DFDocDecreeController.ArrayOfInteger;
begin
  Result := nil;

  if docCode = LOW_INT then Exit;

  TempDFDocDecree := HTTPRIODFDocDecree as DFDocDecreeControllerSoapPort;

  docDecreeFilter := DFDocDecreeFilter.Create;
  SetNullIntProps(docDecreeFilter);
  SetNullXSProps(docDecreeFilter);

  docDecreeFilter.doc := DFDoc.Create;
  docDecreeFilter.doc.code := docCode;

  docDecreeArr := TempDFDocDecree.getScrollableFilteredCodeArray(docDecreeFilter, 0, -1);

  if High(docDecreeArr) > -1 then
    Result := TempDFDocDecree.getObject(docDecreeArr[0]);
end;

function TDMReports.getDocJourneyByDocCode(docCode : Integer) : DFDocJourney;
var
  TempDFDocJourney : DFDocJourneyControllerSoapPort;
  docJourneyFilter : DFDocJourneyFilter;
  docJourneyArr : DFDocJourneyController.ArrayOfInteger;
begin
  Result := nil;

  if docCode = LOW_INT then Exit;

  TempDFDocJourney := HTTPRIODFDocJourney as DFDocJourneyControllerSoapPort;

  docJourneyFilter := DFDocJourneyFilter.Create;
  SetNullIntProps(docJourneyFilter);
  SetNullXSProps(docJourneyFilter);

  docJourneyFilter.doc := DFDoc.Create;
  docJourneyFilter.doc.code := docCode;

  docJourneyArr := TempDFDocJourney.getScrollableFilteredCodeArray(docJourneyFilter, 0, -1);

  if High(docJourneyArr) > -1 then
    Result := TempDFDocJourney.getObject(docJourneyArr[0]);
end;

function TDMReports.getDocOrderByDocCode(docCode : Integer) : DFDocOrder;
var
  TempDFDocOrder : DFDocOrderControllerSoapPort;
  docOrderFilter : DFDocOrderFilter;
  docOrderArr : DFDocOrderController.ArrayOfInteger;
begin
  Result := nil;

  if docCode = LOW_INT then Exit;

  TempDFDocOrder := HTTPRIODFDocOrder as DFDocOrderControllerSoapPort;

  docOrderFilter := DFDocOrderFilter.Create;
  SetNullIntProps(docOrderFilter);
  SetNullXSProps(docOrderFilter);

  docOrderFilter.doc := DFDoc.Create;
  docOrderFilter.doc.code := docCode;

  docOrderArr := TempDFDocOrder.getScrollableFilteredCodeArray(docOrderFilter, 0, -1);

  if High(docOrderArr) > -1 then
    Result := TempDFDocOrder.getObject(docOrderArr[0]);
end;

function TDMReports.getDocSignerTypesForObject(
  const anObject: TObject): DFDocSubtype2SignerTypeShortList;
var
  TempDFDoc: DFDocControllerSoapPort;
begin
  TempDFDoc := HTTPRIODFDoc as DFDocControllerSoapPort;
  Result := TempDFDoc.getDocSignerTypesForObject(anObject);
end;

function TDMReports.getDocFaxByDocCode(docCode : Integer) : DFDocFax;
var
  TempDFDocFax : DFDocFaxControllerSoapPort;
  docFaxFilter : DFDocFaxFilter;
  docFaxArr : DFDocFaxController.ArrayOfInteger;
begin
  Result := nil;

  if docCode = LOW_INT then Exit;

  TempDFDocFax := HTTPRIODFDocFax as DFDocFaxControllerSoapPort;

  docFaxFilter := DFDocFaxFilter.Create;
  SetNullIntProps(docFaxFilter);
  SetNullXSProps(docFaxFilter);

  docFaxFilter.doc := DFDoc.Create;
  docFaxFilter.doc.code := docCode;

  docFaxArr := TempDFDocFax.getScrollableFilteredCodeArray(docFaxFilter, 0, -1);

  if High(docFaxArr) > -1 then
    Result := TempDFDocFax.getObject(docFaxArr[0]);
end;

function  TDMReports.getTabnumbersFromRoutes(routeCode : Integer): string;
 var
    res : string;
    TempDFRouteItem : DFRouteItemControllerSoapPort;
    riFilter : DFRouteItemFilter;
    riList : DFRouteItemShortList;
    riCount,i : Integer;
    begin
         TempDFRouteItem := HTTPRIODFRouteItem as DFRouteItemControllerSoapPort;
         riFilter := DFRouteItemFilter.Create;
         SetNullIntProps(riFilter);
         SetNullXSProps(riFilter);
         riFilter.conditionSQL := ' exists (select 1 ' +
                                  ' from dfrouteitem as ri inner join dfroute as r on r.code = ri.routerefcode and r.code = ' + IntToStr(routeCode) + ' and ri.code = DFROUTEITEM.CODE)';
         riList := TempDFRouteItem.getScrollableFilteredList(riFilter,0,-1);
         riCount := High(riList.list);
         res := '';

         for i:=0 to riCount do
         begin
             if i = riCount then
             res := res + '''' + riList.list[i].tabNumber + ''''
             else
             res := res + '''' + riList.list[i].tabNumber + ''',';
         end;

      Result := res;
    end;

function  TDMReports.getTabnumbersFromRoutes(senderUserName : String): string;
 var
    res : string;
    TempDFRouteItem : DFRouteItemControllerSoapPort;
    riFilter : DFRouteItemFilter;
    riList : DFRouteItemShortList;
    riCount,i : Integer;
    begin
         TempDFRouteItem := HTTPRIODFRouteItem as DFRouteItemControllerSoapPort;
         riFilter := DFRouteItemFilter.Create;
         SetNullIntProps(riFilter);
         SetNullXSProps(riFilter);
         riFilter.conditionSQL := ' code in (select ri.code ' +
                                  ' from dfrouteitem ri, dfroute r ' +
                                  ' where ri.routerefcode = r.code ' +
                                  ' and r.typerefcode = ' + IntToStr(DFROUTETYPE_MY_USERS_LIST) +
                                  ' and upper(r.usergen) = upper(''' + senderUserName +'''))';
         riList := TempDFRouteItem.getScrollableFilteredList(riFilter,0,-1);
         riCount := High(riList.list);
         res := '';

         for i:=0 to riCount do
         begin
             if i = riCount then
             res := res + '''' + riList.list[i].tabNumber + ''''
             else
             res := res + '''' + riList.list[i].tabNumber + ''',';
         end;

      Result := res;
    end;


function TDMReports.checkDFDocSigners(sgDFDocSigners: TAdvStringGrid): Boolean;
var i, countTotal, countFilled: Integer;
begin
  Result := true;

  countTotal := 0;
  countFilled := 0;

  for i := 1 to sgDFDocSigners.RowCount - 1 do
  begin
    if sgDFDocSigners.Cells[2, i] <> '' then
      inc(countFilled);
    inc(countTotal);
  end;

  if (countFilled <> 0) and (countFilled <> countTotal) then
    Result := false;
end;

function TDMReports.checkEditigDoc(docCode : Integer) : Boolean;
var
  TempDFDocMovement : DFDocMovementControllerSoapPort;
  docMovementFilter : DFDocMovementFilter;
  docMovementArr : DFDocMovementController.ArrayOfInteger;
begin
  Result := False;
  if docCode = LOW_INT then Exit;

  TempDFDocMovement := HTTPRIODFDocMovement as DFDocMovementControllerSoapPort;
  docMovementFilter := DFDocMovementFilter.Create;
  SetNullIntProps(docMovementFilter);
  SetNullXSProps(docMovementFilter);

  docMovementFilter.conditionSQL := 'dfdocmovement.docrefcode in (' +
    ' select dd.code  from dfdoc dd' +
    ' where dd.code = ' + IntToStr(docCode) +
    ' union all' +
    ' select d.code from dfdoc d' +
    ' where d.parentrefcode = ' + IntToStr(docCode) + ')';

  docMovementArr := TempDFDocMovement.getScrollableFilteredCodeArray(docMovementFilter, 0, -1);

  if High(docMovementArr) = -1 then
    Result := true;
end;


function TDMReports.getDocsLabourDepartment(docCode : Integer) : DFDocsLabourDepartment;
var
  TempDFDocsLabourDepartment : DFDocsLabourDepartmentControllerSoapPort;
  docsLabourFilter : DFDocsLabourDepartmentFilter;
  docsLabourArr : DFDocsLabourDepartmentController.ArrayOfInteger;
begin
  Result := nil;

  if docCode = LOW_INT then Exit;

  TempDFDocsLabourDepartment := HTTPRIODFDocsLabourDepartment as DFDocsLabourDepartmentControllerSoapPort;

  docsLabourFilter := DFDocsLabourDepartmentFilter.Create;
  SetNullIntProps(docsLabourFilter);
  SetNullXSProps(docsLabourFilter);

  docsLabourFilter.doc := DFDoc.Create;
  docsLabourFilter.doc.code := docCode;

  docsLabourArr := TempDFDocsLabourDepartment.getScrollableFilteredCodeArray(docsLabourFilter, 0, -1);

  if High(docsLabourArr) > -1 then
    Result := TempDFDocsLabourDepartment.getObject(docsLabourArr[0]);
end;


function TDMReports.getDocSubTypeForObject(const anObject: TObject): Integer;
var
  TempDFDoc: DFDocControllerSoapPort;
begin
  TempDFDoc := HTTPRIODFDoc as DFDocControllerSoapPort;
  Result := TempDFDoc.getDocSubTypeForObject(anObject);
end;

function TDMReports.getDriversConditionForAX(): String;
begin
  Result :=
    '(upper(title) like upper(''%водій%'') or ' +
    ' upper(title) like upper(''%машиніст%'') or ' +
    ' upper(title) like upper(''%тракторист%''))';
end;

function TDMReports.getDocChiefTask(docCode : Integer) : DFDocChiefTask;
var
  TempDFDocChiefTask : DFDocChiefTaskControllerSoapPort;
  docChiefTaskFilter : DFDocChiefTaskFilter;
  docChiefTaskArr : DFDocChiefTaskController.ArrayOfInteger;
begin
  Result := nil;

  if docCode = LOW_INT then Exit;

  TempDFDocChiefTask := HTTPRIODFDocChiefTask as DFDocChiefTaskControllerSoapPort;

  docChiefTaskFilter := DFDocChiefTaskFilter.Create;
  SetNullIntProps(docChiefTaskFilter);
  SetNullXSProps(docChiefTaskFilter);

  docChiefTaskFilter.doc := DFDoc.Create;
  docChiefTaskFilter.doc.code := docCode;

  docChiefTaskArr := TempDFDocChiefTask.getScrollableFilteredCodeArray(docChiefTaskFilter, 0, -1);

  if High(docChiefTaskArr) > -1 then
    Result := TempDFDocChiefTask.getObject(docChiefTaskArr[0]);
end;


function TDMReports.getDocCodeForObject(const anObject: TObject): Integer;
var
  TempDFDoc: DFDocControllerSoapPort;
begin
  TempDFDoc := HTTPRIODFDoc as DFDocControllerSoapPort;
  Result := TempDFDoc.getDocCodeForObject(anObject);
end;

function TDMReports.getDocDecreeWorkOnWeekends(docCode : Integer) : DFDecreeWorkOnWeekends;
var
  TempDFDecreeWorkOnWeekends: DFDecreeWorkOnWeekendsControllerSoapPort;
  decreeWorkOnWeekendsFilter: DFDecreeWorkOnWeekendsFilter;
  decreeWorkOnWeekendskArr : DFDecreeWorkOnWeekendsController.ArrayOfInteger;
begin
  Result := nil;

  if docCode = LOW_INT then Exit;

  TempDFDecreeWorkOnWeekends := HTTPRIODFDecreeWorkOnWeekends as DFDecreeWorkOnWeekendsControllerSoapPort;

  decreeWorkOnWeekendsFilter := DFDecreeWorkOnWeekendsFilter.Create;
  SetNullIntProps(decreeWorkOnWeekendsFilter);
  SetNullXSProps(decreeWorkOnWeekendsFilter);

  decreeWorkOnWeekendsFilter.doc := DFDoc.Create;
  decreeWorkOnWeekendsFilter.doc.code := docCode;

  decreeWorkOnWeekendskArr := TempDFDecreeWorkOnWeekends.getScrollableFilteredCodeArray(decreeWorkOnWeekendsFilter, 0, -1);

  if High(decreeWorkOnWeekendskArr) > -1 then
    Result := TempDFDecreeWorkOnWeekends.getObject(decreeWorkOnWeekendskArr[0]);
end;


function TDMReports.getDocDescription(docShort: DFDocShort): String;
begin
  if docShort = nil then
    raise Exception.Create('Не визначено документ!');

  Result := '';

  if (docShort.name = '') then
  begin
    Result := docShort.description;
    Exit;
  end;

  // 03.09.2015 Для договоров рядом с контрагентом выводим описание (пожелание И.Н.)
  if docShort.docTypeRefCode <> DFDOCTYPE_AGREEMENT then
  begin
    if (docShort.docTypeRefCode = DFDOCTYPE_ACTCHECKINGWORKPLACE) or
       (docShort.docTypeRefCode = DFDOCTYPE_INNER_DOC) then
      Result := docShort.description
    else
      Result := docShort.name;
  end
  else begin
    if docShort.description = '' then
      Result := docShort.name + ' (без опису)'
    else
      Result := docShort.name + ' (' + docShort.description + ')';
  end;
end;

function TDMReports.getDocEstimateByDocCode(docCode: Integer): DFDocEstimate;
var
  TempDFDocEstimate: DFDocEstimateControllerSoapPort;
  docEstimateFilter: DFDocEstimateFilter;
  docEstimateArr: DFDocEstimateController.ArrayOfInteger;
begin
  Result := nil;

  if docCode = LOW_INT then Exit;

  TempDFDocEstimate := HTTPRIODFDocEstimate as DFDocEstimateControllerSoapPort;

  docEstimateFilter := DFDocEstimateFilter.Create;
  SetNullIntProps(docEstimateFilter);
  SetNullXSProps(docEstimateFilter);

  docEstimateFilter.doc := DFDoc.Create;
  docEstimateFilter.doc.code := docCode;

  docEstimateArr := TempDFDocEstimate.getScrollableFilteredCodeArray(docEstimateFilter, 0, -1);

  if High(docEstimateArr) > -1 then
    Result := TempDFDocEstimate.getObject(docEstimateArr[0]);
end;

function TDMReports.getPersonalAccountInfo(techCondServicesCode: Integer): PersonalServicesInfo;
var
  TempENElement: ENElementControllerSoapPort;
  TempServicesObject: ENServicesObjectControllerSoapPort;
  elementFilter: ENElementFilter;
  elementList: ENElementShortList;
  invNumber: string;
  renCode, departmentCode: Integer;
  department: ENDepartmentShort;
begin
  Result := nil;
  if techCondServicesCode = LOW_INT then Exit;
  TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;
  TempServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

  elementFilter := ENElementFilter.Create;
  SetNullIntProps(elementFilter);
  SetNullXSProps(elementFilter);
  elementFilter.conditionSQL := ' enelement.code in ( ' +
    ' select e.code from enelement e where e.typerefcode = ' + IntToStr(EN_BYT) +
    ' and e.code in (select pl.elementrefcode from enplanwork pl ' +
    ' where pl.code in (select tp.planrefcode from entechcond2planwork tp ' +
    ' where tp.techconservicesrefcode = ' + IntToStr(techCondServicesCode) + ' ) ) )';

  elementList := TempENElement.getScrollableFilteredList(elementFilter, 0, -1);
  if (elementList.totalCount > 0) then
  begin
    invNumber := elementList.list[0].objectInvNumber;
    renCode := elementList.list[0].renRefCode;

    department := getDepartmentByRenCode(renCode, ENMANAGEMENT_TYPE_ENERGOSBYT);
    if (department <> nil ) then
      departmentCode := department.code;

    Result := TempServicesObject.getPersonalAccountInfo(invNumber, departmentCode, True);
  end;
end;


function TDMReports.getPlanCodesByWorkOrder(workOrderNumber: String): String;
var
  i: Integer;

  TempENWorkOrder2ENPlanWork: ENWorkOrder2ENPlanWorkControllerSoapPort;
  workOrder2PlanWorkFilter: ENWorkOrder2ENPlanWorkFilter;
  planWorkArr: ENWorkOrder2ENPlanWorkController.ArrayOfInteger;

  planCodes: string;
begin
  planCodes := '';

  TempENWorkOrder2ENPlanWork := HTTPRIOENWorkOrder2ENPlanWork as ENWorkOrder2ENPlanWorkControllerSoapPort;

  workOrder2PlanWorkFilter := ENWorkOrder2ENPlanWorkFilter.Create;
  SetNullXSProps(workOrder2PlanWorkFilter);
  SetNullIntProps(workOrder2PlanWorkFilter);
  workOrder2PlanWorkFilter.conditionSQL := ' upper(enworkorder.workordernumber) like upper(''' + ToLIKE(workOrderNumber) + ''')';

  planWorkArr := TempENWorkOrder2ENPlanWork.getPlanCodeArray(workOrder2PlanWorkFilter,0,-1);
  if High(planWorkArr) > -1 then
  begin
    for i := 0 to High(planWorkArr) do
    begin
      if (planCodes = '') then
        planCodes := IntToStr(planWorkArr[i])
      else
        planCodes := planCodes + ', ' + IntToStr(planWorkArr[i]);
    end;
  end;

  result := planCodes;
end;


function TDMReports.getStrAllFINExecutorIdsByParent(parentId : String) : String;
begin
  Result := Self.getStrAllFINExecutorIdsByParent(parentId, nil);
end;


function TDMReports.getStrAllFINExecutorIdsByParent(parentId : String; isMDAX : TXSBoolean) : String;
var
   TempFINExecutor: FINExecutorControllerSoapPort;
   childFINExecutors : ArrayOfString;
   res : String;
begin

  TempFINExecutor :=  HTTPRIOFINExecutor as FINExecutorControllerSoapPort;
  if isMDAX = nil then begin
    childFINExecutors := TempFINExecutor.getAllIdsByParent(parentId);
  end else begin
    childFINExecutors := TempFINExecutor.getAllIdsByParent(parentId, isMDAX);
  end;

  if ( (isMDAX = nil) and (Self.usesMDAXData))
    or ((isMDAX <> nil) and (isMDAX.AsBoolean = true)) then begin
    res := BaseUtils.array2String(BaseUtils.transformArrayOfStringsMakeSingleQuotes(childFINExecutors), ',');
  end else begin
    res := BaseUtils.array2String(childFINExecutors, ',');
  end;
  Result := res;
end;

class function TDMReports.isMetrologyDepartment(departmentFKCode : String): Boolean;
begin
   Result := TDMReports.isMetrologyDepartment(departmentFKCode, false);
end;
class function TDMReports.isMetrologyDepartment(departmentFKCode : String; isOnlyMetrology : Boolean): Boolean;
var departments : TList<String>;
begin
  departments := TList<String>.Create();
  if not isOnlyMetrology then departments.AddRange(['027', '042', '052', '075', '072']) else departments.Add('027');
  Result := departments.Contains(departmentFKCode);
end;

function TDMReports.checkUsersGroup(groupCode: Integer): Boolean;
var
  userMembershipList : UserMembershipShortList;
  userMembershipFilter : AuthorizationController.UserMembershipFilter;
  TempUserMembership : UserMembershipControllerSoapPort;
begin
  Result := False;
  TempUserMembership := HTTPRIOUserMembership as UserMembershipControllerSoapPort;

  userMembershipFilter := AuthorizationController.UserMembershipFilter.Create;
  SetNullIntProps(userMembershipFilter);
  SetNullXSProps(userMembershipFilter);
  userMembershipFilter.userRef := UserRef.Create;
  userMembershipFilter.userRef.code := LOW_INT;
  userMembershipFilter.userRef.name := HTTPRIOUserMembership.HTTPWebNode.UserName;
  userMembershipFilter.groupRef := GroupRef.Create;
  userMembershipFilter.groupRef.code := groupCode;

  userMembershipList := TempUserMembership.getFilteredList(userMembershipFilter);
  if (userMembershipList.totalCount > 0) then
    Result := True;
end;


function TDMReports.getDocCatalogCodesRecursive(filterCatalogCode: Integer): String;
var
  i: Integer;
  TempDFOrdersCatalog: DFOrdersCatalogControllerSoapPort;
  ordersCatalogFilter: DFOrdersCatalogFilter;
  ordersCatalogArr: DFOrdersCatalogController.ArrayOfInteger;
  codes: string;
begin
  codes := '';
  TempDFOrdersCatalog := HTTPRIODFOrdersCatalog as DFOrdersCatalogControllerSoapPort;

  ordersCatalogFilter := DFOrdersCatalogFilter.Create;
  SetNullXSProps(ordersCatalogFilter);
  SetNullIntProps(ordersCatalogFilter);
  ordersCatalogFilter.conditionSQL := 'dforderscatalog.code in ( ' +
      ' with recursive tree as ( ' +
      ' select code from dforderscatalog ' +
      ' where code = ' + IntToStr(filterCatalogCode) +
      ' union all ' +
      ' select p.code from dforderscatalog p ' +
      ' join tree t on t.code = p.parentrefcode) select * from tree )';

  ordersCatalogArr := TempDFOrdersCatalog.getScrollableFilteredCodeArray(ordersCatalogFilter, 0, -1);
  if High(ordersCatalogArr) > -1 then
  begin
    for i := 0 to High(ordersCatalogArr) do
    begin
      if (codes = '') then
        codes := IntToStr(ordersCatalogArr[i])
      else
        codes := codes + ', ' + IntToStr(ordersCatalogArr[i]);
    end;
  end;

  result := codes;
end;


function TDMReports.base64Decode(const inputBase64String: String): String;
var
  TempDFDoc: DFDocControllerSoapPort;
begin
  TempDFDoc := HTTPRIODFDoc as DFDocControllerSoapPort;
  Result := TempDFDoc.base64Decode(inputBase64String);
end;

function TDMReports.base64Encode(const inputString: String): String;
var
  TempDFDoc: DFDocControllerSoapPort;
begin
  TempDFDoc := HTTPRIODFDoc as DFDocControllerSoapPort;
  Result := TempDFDoc.base64Encode(inputString);
end;

function TDMReports.checkActTypeForCountersStateVerification(act: ENAct): Boolean;
begin
  Result := false;

  if (act.element.typeRef.code = EN_METROLOGY_OBJECT) then
  begin
    if (act.actTypeRef.code = ENPLANWORKSTATE_CURRENTREPAIR) or
       (act.actTypeRef.code = ENPLANWORKSTATE_REFINEMENT) or
       (act.actTypeRef.code = ENPLANWORKSTATE_COUNTERS_STATE_VERIFICATION) or
	   (act.actTypeRef.code = ENPLANWORKSTATE_COUNTERS_EXPERTISE) then
      Result := true;
  end;
end;

function TDMReports.checkConnectionTariff(): Boolean;
var
  TempENConnectionTariff : ENConnectionTariffControllerSoapPort;
  connectionTariff : ENConnectionTariffFilter;
  tariffArr : ENConnectionTariffController.ArrayOfInteger;
begin
  Result := False;
  TempENConnectionTariff := HTTPRIOENConnectionTariff as ENConnectionTariffControllerSoapPort;

  connectionTariff := ENConnectionTariffFilter.Create;
  SetNullIntProps(connectionTariff);
  SetNullXSProps(connectionTariff);
  connectionTariff.conditionSQL := ' enconnectiontariff.code in ( ' +
    ' select te.tariffrefcode from enconnectiontariffentr te ' +
    ' where te.startdate >= date_trunc(''year'', now()) ) ';

  tariffArr := TempENConnectionTariff.getScrollableFilteredCodeArray(connectionTariff, 0 , -1);
  if High(tariffArr) > -1 then
    Result := True;
end;


function TDMReports.getDFDocCommissionProtocol(docCode : Integer) : DFDocCommissionProtocol;
var
  TempDFDocCommissionProtocol: DFDocCommissionProtocolControllerSoapPort;
  commissionProtocolFilter: DFDocCommissionProtocolFilter;
  commissionProtocolArr : DFDocCommissionProtocolController.ArrayOfInteger;
begin
  Result := nil;

  if docCode = LOW_INT then Exit;

  TempDFDocCommissionProtocol := HTTPRIODFDocCommissionProtocol as DFDocCommissionProtocolControllerSoapPort;

  commissionProtocolFilter := DFDocCommissionProtocolFilter.Create;
  SetNullIntProps(commissionProtocolFilter);
  SetNullXSProps(commissionProtocolFilter);

  commissionProtocolFilter.doc := DFDoc.Create;
  commissionProtocolFilter.doc.code := docCode;

  commissionProtocolArr := TempDFDocCommissionProtocol.getScrollableFilteredCodeArray(commissionProtocolFilter, 0, -1);

  if High(commissionProtocolArr) > -1 then
    Result := TempDFDocCommissionProtocol.getObject(commissionProtocolArr[0]);
end;


function TDMReports.getDFJobStatusFilterForDFDocMovement(
  const dfDocMovementCode: Integer; DFDocServicesConsumerObj: DFDocServicesConsumer): DFJobStatusFilter;
var
  agreementKindCode, docStatusCode, typeWork: Integer;
  TempDFDoc: DFDocControllerSoapPort;
  doc: DFDoc;
  jobStatusFilter: DFJobStatusFilter;

  docMovement: DFDocMovement;
  TempDFDocMovement: DFDocMovementControllerSoapPort;
  TempDFDocServicesConsumer: DFDocServicesConsumerControllerSoapPort;
  servicesConsumerKind: DFDocServicesConsumerKind;
begin
  if dfDocMovementCode <= 0 then
    raise Exception.Create('Не заданий код руху документу!');

  TempDFDocMovement := HTTPRIODFDocMovement as DFDocMovementControllerSoapPort;
  docMovement := TempDFDocMovement.getObject(dfDocMovementCode);
  if docMovement = nil then
    raise Exception.Create('Не знайдено рух документу з кодом ' + IntToStr(dfDocMovementCode) + ' !');

  TempDFDoc := HTTPRIODFDoc as DFDocControllerSoapPort;
  doc := TempDFDoc.getObject(docMovement.docRef.code);

  // для договора определим его вид и статус дока...
  agreementKindCode := Low(Integer);
  docStatusCode := Low(Integer);
  if (doc.docTypeRef.code = DFDOCTYPE_AGREEMENT) then
  begin
    agreementKindCode := DMReports.getDocAgreementByDocCode(doc.code).kindRef.code;
    docStatusCode := DMReports.getDocAgreementByDocCode(doc.code).doc.statusRef.code;
  end;

  jobStatusFilter := DFJobStatusFilter.Create;
  SetNullIntProps(jobStatusFilter);
  SetNullXSProps(jobStatusFilter);

  case doc.docTypeRef.code of
         DFConsts.DFDOCTYPE_SERVICENOTE_TMC , DFConsts.DFDOCTYPE_CONTRACTREQUEST  :
         begin
             case docMovement.jobStatusRef.code of
                  DFConsts.DFJOBSTATUS_PENDING_APPROVE :
                  begin
                    jobStatusFilter.conditionSQL := ' dfjobstatus.code in ( '+ IntToStr(DFJOBSTATUS_DENIED) + ',' + IntToStr(DFJOBSTATUS_CONFIRMED) +')';
                  end;
                  DFConsts.DFJOBSTATUS_APPROVED :
                  begin
                    jobStatusFilter.conditionSQL := ' dfjobstatus.code in ( '+ IntToStr(DFJOBSTATUS_INPROGRESS)  +')';
                  end;
             end;

         end;
  else
    // VS 25.11.2015 +++ для договоров "Відхилено" - только на стадиях подписания, рассмотрения....
    if (doc.docTypeRef.code = DFDOCTYPE_AGREEMENT) then
    begin
      if (docStatusCode = DFDOCSTATUS_ONSIGNING) or (docStatusCode = DFDOCSTATUS_CONSIDERATION) then
        jobStatusFilter.conditionSQL := ' dfjobstatus.code in ( ' +
        ' select j2t.jobstatusrefcode ' +
        ' from dfjobstatus2dfdoctype j2t where j2t.doctyperefcode = ' + IntToStr(doc.docTypeRef.code) + ')'

      else if (agreementKindCode = DFDOCAGREEMENTKIND_CONNECTION) and (docStatusCode = DFDOCSTATUS_INPROCESS) then
        jobStatusFilter.conditionSQL := ' dfjobstatus.code in ( ' +
        ' select j2t.jobstatusrefcode ' +
        ' from dfjobstatus2dfdoctype j2t ' +
        ' where j2t.doctyperefcode = ' +
          IntToStr(doc.docTypeRef.code) + ' and dfjobstatus.code <> ' + IntToStr(DFJOBSTATUS_DENIED) + ') or dfjobstatus.code = ' + IntToStr(DFJOBSTATUS_NEEDS_REVIEW)
      else
        jobStatusFilter.conditionSQL := ' dfjobstatus.code in ( ' +
        ' select j2t.jobstatusrefcode ' +
        ' from dfjobstatus2dfdoctype j2t where j2t.doctyperefcode = ' +
          IntToStr(doc.docTypeRef.code) + ' and dfjobstatus.code <> ' + IntToStr(DFJOBSTATUS_DENIED) + ')';

    end else

    // заявки потребителей
    if (doc.docTypeRef.code = DFDOCTYPE_SERVICESCONSUMER) then
    begin
      if DFDocServicesConsumerObj = nil then
        raise Exception.Create('Дана операція не припустима для цього типу документів!');

      servicesConsumerKind := DMReports.getServicesKindByServicesConsumerCode(DFDocServicesConsumerObj.code);

      // все, кроме "передать в WorkFlow"
      jobStatusFilter.conditionSQL := ' dfjobstatus.code in ( ' +
        ' select j2t.jobstatusrefcode ' +
        ' from dfjobstatus2dfdoctype j2t where j2t.doctyperefcode = ' + IntToStr(doc.docTypeRef.code) + ')' +
        ' and dfjobstatus.code not in (' + IntToStr(DFJOBSTATUS_SENDTOWORKFLOW) + ')';


      // 7 - Проведення ремонту/заміни у зв`язку з виходом з ладу
      // 15 - Улаштування приладу обліку при виконанні договору приєднання
      if (servicesConsumerKind.workTypeRef.code = DFTYPEWORKFORSERVICE_PLANNING) then
        jobStatusFilter.conditionSQL := ' dfjobstatus.code in ( ' +
          ' select j2t.jobstatusrefcode ' +
          ' from dfjobstatus2dfdoctype j2t where j2t.doctyperefcode = ' + IntToStr(doc.docTypeRef.code) + ')' +
          ' and dfjobstatus.code not in ('
            + IntToStr(DFJOBSTATUS_SENDTOWORKFLOW) + ', '
            + IntToStr(DFJOBSTATUS_NOTSTARTED) + ', '
            + IntToStr(DFJOBSTATUS_INPROGRESS) + ', '
            + IntToStr(DFJOBSTATUS_COMPLETED) + ')';


      // услуги с процессом в WorkFlow
      // +++ Приєднання
      TempDFDocServicesConsumer := HTTPRIODFDocServicesConsumer as DFDocServicesConsumerControllerSoapPort;
      typeWork := TempDFDocServicesConsumer.getTypeWorkForService(DFDocServicesConsumerObj.code);

      if (typeWork = DFTYPEWORKFORSERVICE_WORKFLOW) then
        jobStatusFilter.conditionSQL := ' dfjobstatus.code in ( ' +
          ' select j2t.jobstatusrefcode ' +
          ' from dfjobstatus2dfdoctype j2t where j2t.doctyperefcode = ' + IntToStr(doc.docTypeRef.code) + ')' +
          ' and dfjobstatus.code not in ('
            + IntToStr(DFJOBSTATUS_NOTSTARTED) + ', '
            + IntToStr(DFJOBSTATUS_APPROVED) + ', '
            + IntToStr(DFJOBSTATUS_INPROGRESS) + ', '
            + IntToStr(DFJOBSTATUS_SUSPENDED) + ', '
            + IntToStr(DFJOBSTATUS_COMPLETED) + ')';


      if (typeWork = DFTYPEWORKFORSERVICE_CONNECTION) then
        jobStatusFilter.conditionSQL := ' dfjobstatus.code in ( ' +
          ' select j2t.jobstatusrefcode ' +
          ' from dfjobstatus2dfdoctype j2t where j2t.doctyperefcode = ' + IntToStr(doc.docTypeRef.code) + ')' +
          ' and dfjobstatus.code not in ('
            // + IntToStr(DFJOBSTATUS_DENIED) + ', '
            + IntToStr(DFJOBSTATUS_NOTSTARTED) + ', '
            + IntToStr(DFJOBSTATUS_APPROVED) + ', '
            + IntToStr(DFJOBSTATUS_INPROGRESS) + ', '
            + IntToStr(DFJOBSTATUS_SUSPENDED) + ', '
            + IntToStr(DFJOBSTATUS_COMPLETED) + ')';

    end else

    // SUPP-65294... 31.08.2017... +++ для приказов и распоряжений
    // возможные действия при работе с одиночными заданиями - как у служебок...
    if ((doc.docTypeRef.code = DFDOCTYPE_DECREE) or (doc.docTypeRef.code = DFDOCTYPE_ORDER))
        and (doc.statusRef.code = DFDOCSTATUS_SIGNED) and (docMovement.isSingleTask = YES) then
    begin
      jobStatusFilter.conditionSQL := ' dfjobstatus.code in ( ' +
      ' select j2t.jobstatusrefcode ' +
      ' from dfjobstatus2dfdoctype j2t where j2t.doctyperefcode = ' + IntToStr(DFDOCTYPE_SERVICENOTE) + ')';
    end else

    // Сиренко: при подписании приказов и распоряжений убрать вариант "Розглянуто із зауваженнями"
    // (должны быть только "Погоджено без зауважень" и "Відхилено"), потому что когда выбирают
    // "Розглянуто із зауваженнями", приказ физически НЕ подписывается, а номер ему присваивается
    if ((doc.docTypeRef.code = DFDOCTYPE_DECREE) or (doc.docTypeRef.code = DFDOCTYPE_ORDER))
        and (doc.statusRef.code = DFDOCSTATUS_ONSIGNING) then
    begin
      jobStatusFilter.conditionSQL := ' dfjobstatus.code in ( ' +
        ' select j2t.jobstatusrefcode ' +
        ' from dfjobstatus2dfdoctype j2t where j2t.doctyperefcode = ' +
          IntToStr(doc.docTypeRef.code) + ' and j2t.jobstatusrefcode not in ( '
            + IntToStr(DFJOBSTATUS_CONFIRMED_WITH_COMMENTS) + ', ' + IntToStr(DFJOBSTATUS_INFORMED) + ' ) )';
    end else

    //** Акт перевірки стану ОП на робочому місці */
    if (doc.docTypeRef.code = DFDOCTYPE_ACTCHECKINGWORKPLACE) then
    begin
      if (doc.statusRef.code = DFDOCSTATUS_APPROVED) then
        jobStatusFilter.conditionSQL := ' dfjobstatus.code in ( ' +
          ' select j2t.jobstatusrefcode ' +
          ' from dfjobstatus2dfdoctype j2t where j2t.doctyperefcode = ' +
            IntToStr(doc.docTypeRef.code) + ' and dfjobstatus.code not in ( '
              + IntToStr(DFJOBSTATUS_DENIED) + ', '
              + IntToStr(DFJOBSTATUS_CONFIRMED) + ' ) )'
      else
        jobStatusFilter.conditionSQL := ' dfjobstatus.code in ( ' +
          ' select j2t.jobstatusrefcode ' +
          ' from dfjobstatus2dfdoctype j2t where j2t.doctyperefcode = ' +
            IntToStr(doc.docTypeRef.code) + ' and dfjobstatus.code not in ( '
              + IntToStr(DFJOBSTATUS_INFORMED) + ' ) )';
    end else

    // SUPP-69795... 01.02.2018 +++ для документов отдела труда "Відхилено" - только на стадии согласования....
    if (doc.docTypeRef.code = DFDOCTYPE_LABOURDEPARTMENT) then
    begin
      if (doc.statusRef.code = DFDOCSTATUS_APPROVED) then
        jobStatusFilter.conditionSQL := ' dfjobstatus.code in ( ' +
        ' select j2t.jobstatusrefcode ' +
        ' from dfjobstatus2dfdoctype j2t where j2t.doctyperefcode = ' +
          IntToStr(doc.docTypeRef.code) + ' and dfjobstatus.code <> ' + IntToStr(DFJOBSTATUS_DENIED) + ')'
      else
        jobStatusFilter.conditionSQL := ' dfjobstatus.code in ( ' +
        ' select j2t.jobstatusrefcode ' +
        ' from dfjobstatus2dfdoctype j2t where j2t.doctyperefcode = ' + IntToStr(doc.docTypeRef.code) + ')';
    end else
      jobStatusFilter.conditionSQL := ' dfjobstatus.code in ( ' +
      ' select j2t.jobstatusrefcode ' +
      ' from dfjobstatus2dfdoctype j2t where j2t.doctyperefcode = ' + IntToStr(doc.docTypeRef.code) + ')';
  end;

  Result := jobStatusFilter;
end;

function TDMReports.getDFDocSignersForDoc(dfDocCode: Integer): DFDocSignerShortList;
var
  TempDFDocSigner: DFDocSignerControllerSoapPort;
  docSignerFilter: DFDocSignerFilter;
begin
  if dfDocCode <= 0 then
    raise Exception.Create('Не задано код документу!');

  docSignerFilter := DFDocSignerFilter.Create;
  SetNullIntProps(docSignerFilter);
  SetNullXSProps(docSignerFilter);

  docSignerFilter.docRef := DFDocRef.Create;
  docSignerFilter.docRef.code := dfDocCode;

  TempDFDocSigner := HTTPRIODFDocSigner as DFDocSignerControllerSoapPort;
  Result := TempDFDocSigner.getScrollableFilteredList(docSignerFilter, 0, -1);
end;


function TDMReports.getDFDocSignersForSaving(const anObject: TObject;
  form: TDialogForm; sgDFDocSigners: TAdvStringGrid;
  var dfDocSigners: ArrayOfDFDocSigner): Boolean;
var
  docSigner: DFDocSigner;
  i, userCode, count, choice: Integer;
  tabNumber, strHolidays: String;
begin
  SetLength(dfDocSigners, 0);
  Result := true;

  for i := 1 to sgDFDocSigners.RowCount - 1 do
  begin
    tabNumber := sgDFDocSigners.Cells[2, i];
    if tabNumber <> '' then
    begin
      docSigner := DFDocSigner.Create;
      SetNullIntProps(docSigner);
      SetNullXSProps(docSigner);

      try
        userCode := StrToInt(sgDFDocSigners.Cells[0, i]);
      except
        on EConvertError do
          userCode := LOW_INT;
      end;

      if userCode <= 0 then
        raise Exception.Create('Не заданий код підписувача!');

      docSigner.userCode := userCode;
      docSigner.tabNumber := tabNumber;
      docSigner.fio := sgDFDocSigners.Cells[3, i];
      docSigner.postInfo := sgDFDocSigners.Cells[4, i];

      docSigner.signerTypeRef := DFDocSignerTypeRef.Create;
      docSigner.signerTypeRef.code := Integer(sgDFDocSigners.Objects[0, i]);

      count := High(dfDocSigners) + 1;
      SetLength(dfDocSigners, count + 1);
      dfDocSigners[count] := docSigner;
    end;
  end;

  /////
  if High(dfDocSigners) < 0 then Exit;

  ///// Не будем спрашивать ничего )
  {
  choice := Application.MessageBox(PChar('Задано підписувачів! Цей документ потрібно буде підписувати за допомогою ЕЦП.' + #13#10 +
                                         'Якщо Ви бажаєте продовжити, натисніть "ТАК".' + #13#10 +
                                         'Для проведення документу старим способом оберіть "НІ".'),
                                   PChar('Увага !'), MB_ICONQUESTION + MB_YESNOCANCEL + MB_DEFBUTTON3);
  }
  choice := IDOK;

  strHolidays:= isDocSignersOnHolidaysDescriptive(dfDocSigners, anObject);
  if strHolidays <> '' then
  begin
    choice := Application.MessageBox(PChar(strHolidays + #13#10 +
                                           'Натисніть "Відмінити" та оберіть іншого підписанта або, ' +
                                           'якщо Ви бажаєте продовжити, натисніть "ОК".'),
                                     PChar('Увага !'), MB_ICONWARNING + MB_OKCANCEL + MB_DEFBUTTON2);
  end;
  /////

  if choice <> IDOK then
    Result := false;

  {
  if choice = IDCANCEL then
    Result := false
  else if choice <> IDYES then
  begin
    SetLength(dfDocSigners, 0);
    initDFDocSignersGrid(anObject, form, sgDFDocSigners, false);
  end;
  }
  /////
end;

function TDMReports.getBillingServerData(enDepartmentCode: Integer): ArrayOfString;
var //i: Integer;
  TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  deepFilter: ENDepartment2EPRenFilter;
  deepList: ENDepartment2EPRenShortList;
  billingServerData: ArrayOfString;
begin
  SetLength(billingServerData, 2);

  TempENDepartment2EPRen := HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;

  deepFilter := ENDepartment2EPRenFilter.Create;
  SetNullIntProps(deepFilter);
  SetNulLXSProps(deepFilter);

  deepFilter.departmentRef := ENDepartmentRef.Create;
  deepFilter.departmentRef.code := enDepartmentCode;
  deepFilter.conditionSQL := ' billingserverip is not null ';
  deepList := TempENDepartment2EPRen.getScrollableFilteredList(deepFilter, 0, -1);

  if (deepList.totalCount > 0) then
  begin
    billingServerData[0] := deepList.list[0].billingServerIp;
    billingServerData[1] := deepList.list[0].billingServerPort;
  end;

  Result := billingServerData;
end;


// проверка плана на связь с Заявлением потребителя в DocFlow...
function TDMReports.checkPlanConsumerServices(planCode : Integer) : Boolean;
var
  TempDFDocServicesConsumer: DFDocServicesConsumerControllerSoapPort;
  servicesConsumerFilter : DFDocServicesConsumerFilter;
  scArr : DFDocServicesConsumerController.ArrayOfInteger;
begin
  Result := False;

  if planCode = LOW_INT then Exit;

  TempDFDocServicesConsumer := HTTPRIODFDocServicesConsumer as DFDocServicesConsumerControllerSoapPort;

  servicesConsumerFilter := DFDocServicesConsumerFilter.Create;
  SetNullIntProps(servicesConsumerFilter);
  SetNullXSProps(servicesConsumerFilter);

  servicesConsumerFilter.conditionSQL := ' dfdocservicesconsumer.monthplancode =  ' + IntToStr(planCode);

  scArr := TempDFDocServicesConsumer.getScrollableFilteredCodeArray(servicesConsumerFilter, 0, -1);

  if High(scArr) > -1 then
    Result := True;
end;

procedure TDMReports.makeReportGraphviz(processResult: String; reportName: String;  reportType: String);
var
  filePath : String;
  res: TStrings;
  TempReportsPath : String;
begin
    TempReportsPath := 'tempReports\';

    res:=TStringList.Create;
    try
      res.Add(Trim(processResult));

      filePath := ExtractFilePath(Application.ExeName)+TempReportsPath+reportName;

      if not DirectoryExists(ExtractFilePath(Application.ExeName)+TempReportsPath) then
        CreateDir(ExtractFilePath(Application.ExeName)+TempReportsPath);
      res.SaveToFile(filePath + '.b64');
    finally
      res.Free;
    end;

    Decode(filePath,('.'+reportType));

    SysUtils.DeleteFile(filePath + '.b64');

    ShellExecute(0,PChar('open'),PChar('"' + filePath + '.' + reportType + '"'),
                  nil,nil,SW_SHOWMAXIMIZED);

end;



procedure TDMReports.openAttachmentsForDFDoc(dfDocCode: Integer);
var
  TempDFDoc: DFDocControllerSoapPort;
  TempDFDocAttachment: DFDocAttachmentControllerSoapPort;
  doc: DFDoc;
  dfDocAttachmentList: DFDocAttachmentShortList;
  docAttachmentFilter: DFDocAttachmentFilter;
  i, attachmentsCount: Integer;
begin
  if dfDocCode <= 0 then
    raise Exception.Create('NET-4596 Не заданий код документу!');

  TempDFDoc := HTTPRIODFDoc as DFDocControllerSoapPort;
  doc := TempDFDoc.getObject(dfDocCode);
  if doc = nil then
    raise Exception.Create('NET-4596 Не знайдено документ з кодом ' + IntToStr(dfDocCode));

  TempDFDocAttachment := HTTPRIODFDocAttachment as DFDocAttachmentControllerSoapPort;

  docAttachmentFilter := DFDocAttachmentFilter.Create;
  SetNullIntProps(docAttachmentFilter);
  SetNullXSProps(docAttachmentFilter);

  docAttachmentFilter.conditionSQL := 'dfdocattachment.doccode in (' +
      ' select ' + IntToStr(dfDocCode) +
      ' union ' +
      ' select d.code from dfdoc d' +
      ' where d.parentrefcode = ' + IntToStr(dfDocCode) + ')';

  dfDocAttachmentList := TempDFDocAttachment.getScrollableFilteredList(docAttachmentFilter, 0, -1);
  attachmentsCount := High(DFDocAttachmentList.list) + 1;

  if attachmentsCount = 0 then
    raise Exception.Create('NET-4596 Не знайдено вкладень для друку документу!' + #13#10 +
                           'Код документу: ' + IntToStr(dfDocCode));

  for i := 0 to attachmentsCount - 1 do
    openENAttachment(dfDocAttachmentList.list[i].endocattcode, true);
end;

procedure TDMReports.openENAttachment(attachmentCode: Integer; onlyActive: Boolean = false);
var
  i : Integer;
  result, fname, fileName, dir, ftpDir : string;
  ftpClient: TIdFTP;
  FileNames: TStrings;
  fileSize: Integer;
  att : ENDocAttachment;
  serv : ENDocAttachmentServer;
begin
  if attachmentCode = LOW_INT then Exit;

  att := getENDocAttachmentByCode(attachmentCode);
  if att = nil then Exit;

  if onlyActive and (att.status.code <> ENDOCATTACHMENTSTATUS_ACTIVE) then
    Exit;

  serv := getENDocAttachmentServerByCode(att.serverRef.code);
  if serv = nil then Exit;

  FileNames := TStringList.Create;

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

function TDMReports.printReportsForObject(const anObject: TObject;
  const allowDraft: Boolean = false): Boolean;
var
  TempDFDoc: DFDocControllerSoapPort;
  i, docCode: Integer;
  reportsList: ArrayOfEPReportRequestEx;
  isDraft: Boolean;
begin
  Result := false;

  //if ((isSignable(anObject)) and (1=2) ) {tezzzt}then
  if isSignable(anObject) then
  begin
    Result := true;

    TempDFDoc := HTTPRIODFDoc as DFDocControllerSoapPort;

    isDraft := TempDFDoc.isDraftObject(anObject);

    if (not allowDraft) and (isDraft) then
    begin
      Application.MessageBox(PChar('Надрукувати можливо тільки документ у статусі "Складений", "На підписанні" або "Проведений"!'),
                             PChar('Увага !'), MB_ICONWARNING);
      Exit;
    end;

    if (not isDraft) then
    begin
      docCode := getDocCodeForObject(anObject);
      if docCode > 0 then
      begin
        // Если есть связанный документ, печатать нужно его вложения
        openAttachmentsForDFDoc(docCode);
        Exit;
      end;
    end;

    reportsList := TempDFDoc.getReportsListForObject(anObject);

    for i := 0 to High(reportsList) do
    begin
      if reportsList[i].isForDocFlow then
        makeReport4DocFlow(reportsList[i].reportName, reportsList[i].argNames, reportsList[i].args, reportsList[i].reportType)
      else
        makeReport(reportsList[i].reportName, reportsList[i].argNames, reportsList[i].args, reportsList[i].reportType);
    end;
  end;
end;

function TDMReports.getNormativeDocCatalogCodesRecursive(filterCatalogCode: Integer): String;
var
  i: Integer;
  TempDFNormativeDocCatalog: DFNormativeDocCatalogControllerSoapPort;
  catalogFilter: DFNormativeDocCatalogFilter;
  catalogArr: DFNormativeDocCatalogController.ArrayOfInteger;
  codes: string;
begin
  codes := '';
  TempDFNormativeDocCatalog := HTTPRIODFNormativeDocCatalog as DFNormativeDocCatalogControllerSoapPort;

  catalogFilter := DFNormativeDocCatalogFilter.Create;
  SetNullXSProps(catalogFilter);
  SetNullIntProps(catalogFilter);
  catalogFilter.conditionSQL := ' dfnormativedoccatalog.code in ( ' +
      ' with recursive tree as ( ' +
      ' select code from dfnormativedoccatalog ' +
      ' where code = ' + IntToStr(filterCatalogCode) +
      ' union all ' +
      ' select p.code from dfnormativedoccatalog p ' +
      ' join tree t on t.code = p.parentrefcode) select * from tree )';

  catalogArr := TempDFNormativeDocCatalog.getScrollableFilteredCodeArray(catalogFilter, 0, -1);
  if High(catalogArr) > -1 then
  begin
    for i := 0 to High(catalogArr) do
    begin
      if (codes = '') then
        codes := IntToStr(catalogArr[i])
      else
        codes := codes + ', ' + IntToStr(catalogArr[i]);
    end;
  end;

  result := codes;
end;


function TDMReports.getProjectDocCatalogCodesRecursive(filterCatalogCode: Integer): String;
var
  i: Integer;
  TempDFProjectDocCatalog: DFProjectDocCatalogControllerSoapPort;
  catalogFilter: DFProjectDocCatalogFilter;
  catalogArr: DFProjectDocCatalogController.ArrayOfInteger;
  codes: string;
begin
  codes := '';
  TempDFProjectDocCatalog := HTTPRIODFProjectDocCatalog as DFProjectDocCatalogControllerSoapPort;

  catalogFilter := DFProjectDocCatalogFilter.Create;
  SetNullXSProps(catalogFilter);
  SetNullIntProps(catalogFilter);
  catalogFilter.conditionSQL := ' dfprojectdoccatalog.code in ( ' +
      ' with recursive tree as ( ' +
      ' select code from dfprojectdoccatalog ' +
      ' where code = ' + IntToStr(filterCatalogCode) +
      ' union all ' +
      ' select p.code from dfprojectdoccatalog p ' +
      ' join tree t on t.code = p.parentrefcode) select * from tree )';

  catalogArr := TempDFProjectDocCatalog.getScrollableFilteredCodeArray(catalogFilter, 0, -1);
  if High(catalogArr) > -1 then
  begin
    for i := 0 to High(catalogArr) do
    begin
      if (codes = '') then
        codes := IntToStr(catalogArr[i])
      else
        codes := codes + ', ' + IntToStr(catalogArr[i]);
    end;
  end;

  result := codes;
end;


function TDMReports.getEmployeeStatementByDocCode(docCode: Integer): DFDocEmployeeStatement;
var
  TempDFDocEmployeeStatement: DFDocEmployeeStatementControllerSoapPort;
  employeeStatementList: DFDocEmployeeStatementShortList;
  employeeStatementFilter: DFDocEmployeeStatementFilter;
  esArr: DFDocEmployeeStatementController.ArrayOfInteger;
begin
  Result := nil;

  if docCode = LOW_INT then Exit;

  TempDFDocEmployeeStatement := HTTPRIODFDocEmployeeStatement as DFDocEmployeeStatementControllerSoapPort;

  employeeStatementFilter := DFDocEmployeeStatementFilter.Create;
  SetNullIntProps(employeeStatementFilter);
  SetNullXSProps(employeeStatementFilter);

  employeeStatementFilter.doc := DFDoc.Create;
  employeeStatementFilter.doc.code := docCode;

  esArr := TempDFDocEmployeeStatement.getScrollableFilteredCodeArray(employeeStatementFilter, 0, -1);

  if High(esArr) > -1 then
    Result := TempDFDocEmployeeStatement.getObject(esArr[0]);
end;

function TDMReports.getStaffRequestByDocCode(docCode: Integer): DFDocStaffRequest;
var
  TempDFDocStaffRequest : DFDocStaffRequestControllerSoapPort;
  docStaffRequestFilter : DFDocStaffRequestFilter;
  docStaffRequestArr : DFDocStaffRequestController.ArrayOfInteger;
begin
  Result := nil;

  if docCode = LOW_INT then Exit;

  TempDFDocStaffRequest := HTTPRIODFDocStaffRequest as DFDocStaffRequestControllerSoapPort;

  docStaffRequestFilter := DFDocStaffRequestFilter.Create;
  SetNullIntProps(docStaffRequestFilter);
  SetNullXSProps(docStaffRequestFilter);

  docStaffRequestFilter.doc := DFDoc.Create;
  docStaffRequestFilter.doc.code := docCode;

  docStaffRequestArr := TempDFDocStaffRequest.getScrollableFilteredCodeArray(docStaffRequestFilter, 0, -1);

  if High(docStaffRequestArr) > -1 then
    Result := TempDFDocStaffRequest.getObject(docStaffRequestArr[0]);
end;

function TDMReports.getTKmaterialsListFromRQOrder(rqOrderCode : Integer) : TKMaterialsShortList;
var
  TempTKMatetials : TKMaterialsControllerSoapPort;
  materialsFilter : TKMaterialsFilter;
  materialsFilterCodes : TKMaterialsController.ArrayOfInteger;
  mtList : TKMaterialsShortList;
begin

    TempTKMatetials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
    materialsFilter := TKMaterialsFilter.Create;
    SetNullXSProps(materialsFilter);
    SetNullIntProps(materialsFilter);
    materialsFilter.orderBySQL := 'tk1.code';

    materialsFilter.conditionSQL := ' tk1.code in ( select oi.materialcode from rqorderitem oi where oi.orderrefcode = '+ IntToStr(rqOrderCode)+' ) ';

    Result := TempTKMatetials.getScrollableFilteredList(materialsFilter, 0, -1);
end;


function TDMReports.getServicesConsumer(soCode: Integer): DFDocServicesConsumer;
var
  docServicesConsumerFilter: DFDocServicesConsumerFilter;
  TempDFDocServicesConsumer: DFDocServicesConsumerControllerSoapPort;
  DFDocServicesConsumerList: DFDocServicesConsumerShortList;
begin
  Result := nil;

  if soCode <= 0 then
    raise Exception.Create('Не заданий код договору про послуги на сторону!');

  TempDFDocServicesConsumer := HTTPRIODFDocServicesConsumer as DFDocServicesConsumerControllerSoapPort;

  docServicesConsumerFilter := DFDocServicesConsumerFilter.Create;
  SetNullIntProps(docServicesConsumerFilter);
  SetNullXSProps(docServicesConsumerFilter);

  docServicesConsumerFilter.conditionSQL := ' dfdocservicesconsumer.doccode = ( ' +
      ' select d.parentrefcode ' +
      '   from dfdoc2enservicesobject d2s, dfdoc d ' +
      '  where d.code = d2s.docrefcode ' +
      '    and d2s.servicesobjectcode = ' + IntToStr(soCode) + ' )';

  DFDocServicesConsumerList := TempDFDocServicesConsumer.getScrollableFilteredList(docServicesConsumerFilter, 0, -1);
  if High(DFDocServicesConsumerList.list) > -1 then
    Result := TempDFDocServicesConsumer.getObject(DFDocServicesConsumerList.list[0].code);
end;

function TDMReports.getServicesKindByServicesConsumerCode(servicesConsumerCode: Integer): DFDocServicesConsumerKind;
var
  TempDFDocServicesConsumerKind: DFDocServicesConsumerKindControllerSoapPort;
  servicesConsumerKindFilter: DFDocServicesConsumerKindFilter;
  sArr: DFDocServicesConsumerKindController.ArrayOfInteger;
begin
  TempDFDocServicesConsumerKind := HTTPRIODFDocServicesConsumerKind as DFDocServicesConsumerKindControllerSoapPort;

  servicesConsumerKindFilter := DFDocServicesConsumerKindFilter.Create;
  SetNullIntProps(servicesConsumerKindFilter);
  SetNullXSProps(servicesConsumerKindFilter);

  servicesConsumerKindFilter.conditionSQL := 'dfdocservicesconsmrknd.code in ( ' +
    ' select dd.serviceskindrefcode ' +
    ' from dfservices2doccustomer dd ' +
    ' where dd.servicesconsumerrefcod = ' + IntToStr(servicesConsumerCode) + ' )';

  sArr := TempDFDocServicesConsumerKind.getScrollableFilteredCodeArray(servicesConsumerKindFilter, 0, -1);
  if High(sArr) > -1 then
    Result := TempDFDocServicesConsumerKind.getObject(sArr[0]);

end;



// строка с кодами планов со связки договора по тех условиям
function TDMReports.getStrCodePlanFromENServicesFromSide2enplanwork(EnServicesFromSideCode : Integer) : WideString;
var
  TempENServFromSide2PlanWork: ENServFromSide2PlanWorkControllerSoapPort;
  ENServFromSide2PlanWorkList: ENServFromSide2PlanWorkShortList;
  TempENServFromSide2PlanWorkFilter : ENServFromSide2PlanWorkFilter;
  s : string;
  i : Integer;
begin

      s:='-1';
      TempENServFromSide2PlanWork :=  HTTPRIOENServFromSide2PlanWork as ENServFromSide2PlanWorkControllerSoapPort;
      TempENServFromSide2PlanWorkFilter := ENServFromSide2PlanWorkFilter.Create;
      SetNullXSProps(TempENServFromSide2PlanWorkFilter);
      SetNullIntProps(TempENServFromSide2PlanWorkFilter);
      TempENServFromSide2PlanWorkFilter.ServFromSideRef := ENServicesFromSideObjectRef.Create;
      TempENServFromSide2PlanWorkFilter.ServFromSideRef.code :=  EnServicesFromSideCode;
      ENServFromSide2PlanWorkList := TempENServFromSide2PlanWork.getScrollableFilteredList(TempENServFromSide2PlanWorkFilter,0,-1);
      if ENServFromSide2PlanWorkList.totalCount > 0 then
         for i:=0 to ENServFromSide2PlanWorkList.totalCount -1 do
         begin
            if s= '-1' then
             s:= IntToStr(ENServFromSide2PlanWorkList.list[i].planRefCode)
            else
             s:= s + ',' + IntToStr(ENServFromSide2PlanWorkList.list[i].planRefCode);
         end;

      result := s;
end;

{ поиск ServicesObject по коду елемента (услуги на сторону) а так же по связке entechcond2planwork }
function TDMReports.getServicesObjectByPlanCodeElementAndEnTechCond(planCode : Integer): ENServicesObject;
var
    TempENServicesObject: ENServicesObjectControllerSoapPort;
    f: ENServicesObjectFilter;
    servicesObjectArr: ENServicesObjectController.ArrayOfInteger;

    TempENplanwork: ENPlanworkControllerSoapPort;
    pobj : ENPlanwork;
begin
  Result := nil;

  TempENplanwork := HTTPRIOENplanwork as ENPlanWorkControllerSoapPort;
  pobj := TempENplanwork.getObject(planCode);

  f := ENServicesObjectFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.conditionSQL := ' ENSERVICESOBJECT.code in ( '+
				 			    ' select so.code from enplanwork pw , enservicesobject so '+
				 			     ' where pw.elementrefcode = so.elementcode '+
				 			     ' and pw.code = '+ IntToStr(planCode) +
				 			    '  union '+
				 			    ' select so2tcs.servicesobjectrefcode '+
		 				      '     from ENTechCond2PlanWork tc2pw , enservicesobject2techcondtnsservices so2tcs '+
				 				'  where tc2pw.planrefcode = '+ IntToStr(planCode) +
				 				'    and tc2pw.techconservicesrefcode = so2tcs.techcondservrefcode '+
 				 			 '	) ';

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  servicesObjectArr := TempENServicesObject.getScrollableFilteredCodeArray(f, 0, -1);

  if High(servicesObjectArr) > -1 then
    Result := TempENServicesObject.getObject(servicesObjectArr[0]);
end;


function TDMReports.getRepairRequestByDocCode(docCode: Integer): DFDocRepairRequest;
var
  TempDFDocRepairRequest: DFDocRepairRequestControllerSoapPort;
  repairRequestList: DFDocRepairRequestShortList;
  repairRequestFilter: DFDocRepairRequestFilter;
  rrArr: DFDocRepairRequestController.ArrayOfInteger;
begin
  Result := nil;

  if docCode = LOW_INT then Exit;

  TempDFDocRepairRequest := HTTPRIODFDocRepairRequest as DFDocRepairRequestControllerSoapPort;

  repairRequestFilter := DFDocRepairRequestFilter.Create;
  SetNullIntProps(repairRequestFilter);
  SetNullXSProps(repairRequestFilter);

  repairRequestFilter.doc := DFDoc.Create;
  repairRequestFilter.doc.code := docCode;

  rrArr := TempDFDocRepairRequest.getScrollableFilteredCodeArray(repairRequestFilter, 0, -1);

  if High(rrArr) > -1 then
    Result := TempDFDocRepairRequest.getObject(rrArr[0]);
end;


function TDMReports.getExtractOdrerByDocCode(docCode: Integer): DFDocExtractOrder;
var
  TempDFDocExtractOrder: DFDocExtractOrderControllerSoapPort;
  extractOdrerList: DFDocExtractOrderShortList;
  extractOdrerFilter: DFDocExtractOrderFilter;
  xArr: DFDocExtractOrderController.ArrayOfInteger;
begin
  Result := nil;
  if docCode = Low(Integer) then Exit;

  TempDFDocExtractOrder := HTTPRIODFDocExtractOrder as DFDocExtractOrderControllerSoapPort;

  extractOdrerFilter := DFDocExtractOrderFilter.Create;
  SetNullIntProps(extractOdrerFilter);
  SetNullXSProps(extractOdrerFilter);

  extractOdrerFilter.doc := DFDoc.Create;
  extractOdrerFilter.doc.code := docCode;

  xArr := TempDFDocExtractOrder.getScrollableFilteredCodeArray(extractOdrerFilter, 0, -1);

  if High(xArr) > -1 then
    Result := TempDFDocExtractOrder.getObject(xArr[0]);
end;


function TDMReports.getActCheckingByDocCode(docCode: Integer): DFActCheckingWorkplace;
var
  TempDFActCheckingWorkplace: DFActCheckingWorkplaceControllerSoapPort;
  actCheckingList: DFActCheckingWorkplaceShortList;
  actCheckingFilter: DFActCheckingWorkplaceFilter;
  aArr: DFActCheckingWorkplaceController.ArrayOfInteger;
begin
  Result := nil;
  if docCode = Low(Integer) then Exit;

  TempDFActCheckingWorkplace := HTTPRIODFActCheckingWorkplace as DFActCheckingWorkplaceControllerSoapPort;
  actCheckingFilter := DFActCheckingWorkplaceFilter.Create;
  SetNullIntProps(actCheckingFilter);
  SetNullXSProps(actCheckingFilter);

  actCheckingFilter.doc := DFDoc.Create;
  actCheckingFilter.doc.code := docCode;

  aArr := TempDFActCheckingWorkplace.getScrollableFilteredCodeArray(actCheckingFilter, 0, -1);

  if High(aArr) > -1 then
    Result := TempDFActCheckingWorkplace.getObject(aArr[0]);
end;

function TDMReports.getRQFKOrderByDocCode(docCode: Integer): RQFKOrder;
var
  TempRQFKOrder2DFDoc: RQFKOrder2DFDocControllerSoapPort;
  fkOrder2DFDocFilter: RQFKOrder2DFDocFilter;
  fkOrder2DFDocArr: RQFKOrder2DFDocController.ArrayOfInteger;
  fkOrder2DFDoc: RQFKOrder2DFDoc;
begin
  Result := nil;
  if docCode <= 0 then Exit;

  fkOrder2DFDocFilter := RQFKOrder2DFDocFilter.Create;
  SetNullIntProps(fkOrder2DFDocFilter);
  SetNullXSProps(fkOrder2DFDocFilter);

  fkOrder2DFDocFilter.dfDocCode := docCode;

  TempRQFKOrder2DFDoc := HTTPRIORQFKOrder2DFDoc as RQFKOrder2DFDocControllerSoapPort;
  fkOrder2DFDocArr := TempRQFKOrder2DFDoc.getScrollableFilteredCodeArray(fkOrder2DFDocFilter, 0, -1);

  if High(fkOrder2DFDocArr) > -1 then
  begin
    fkOrder2DFDoc := TempRQFKOrder2DFDoc.getObject(fkOrder2DFDocArr[0]);
    if (fkOrder2DFDoc <> nil) and
       (fkOrder2DFDoc.fkOrderRef <> nil) and
       (fkOrder2DFDoc.fkOrderRef.code <> LOW_INT) then
      Result := getRQFKOrderByCode(fkOrder2DFDoc.fkOrderRef.code);
  end;
end;

    {возвращает код строки ИП по коду Акта }
function TDMReports.getLastVersionENIPItemCodeByActCode(actCode : Integer): Integer;
var
    TempENIPItem: ENIPItemControllerSoapPort;
    f: ENIPItemFilter;
    ipitemArr: ENIPItemController.ArrayOfInteger;
begin
  Result := 0;

  TempENIPItem := HTTPRIOENIPItem as ENIPItemControllerSoapPort;

  f := ENIPItemFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.conditionSQL := ' enipitem.code in ( '+
           ' select ei.code from enplanwork pp , enipitem2plan ep , enip e , enipitem ei  '+
           ' where pp.code = ep.planrefcode    '+
           ' and e.code = ei.iprefcode  '+
           ' and ep.ipitemrefcode = ei.code   '+
           ' and pp.code in ( '+
           '        select plannewrefcode from enplancorrecthistory where planrefcode in (select qq.plancode from enact2enplanwork qq where qq.actrefcode=' + IntToStr(actCode) +') '+
           '        union '+
           '         select qq.plancode as planrefcode from enact2enplanwork qq where qq.actrefcode=' + IntToStr(actCode) +' '+
           '         union '+
           '         select planrefcode from enplancorrecthistory where plannewrefcode in (select qq.plancode from enact2enplanwork qq where qq.actrefcode=' + IntToStr(actCode) +') '+
           '         union '+
           '         select plannewrefcode from enplancorrecthistory where planrefcode in '+
           '         (select planrefcode from enplancorrecthistory where plannewrefcode in (select qq.plancode from enact2enplanwork qq where qq.actrefcode=' + IntToStr(actCode) +') ) '+
           '         ) '+
           ' order by e.yeargen desc , e.version desc limit 1  ) ';

  ipitemArr := TempENIPItem.getScrollableFilteredCodeArray(f, 0, -1);

  if High(ipitemArr) > -1 then
    Result :=  ipitemArr[0];
end;

end.

