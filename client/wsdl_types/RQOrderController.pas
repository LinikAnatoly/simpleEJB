unit RQOrderController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENDepartmentController 
//   ,ENDepartmentController 
   ,RQOrderTypeController 
   ,RQOrderKindController 
   ,RQOrderFormController 
   ,RQOrderResourceController 
   ,RQOrderStatusController 
   ,RQOrderCreationMethodController
;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:decimal         - "http://www.w3.org/2001/XMLSchema"
  // !:date            - "http://www.w3.org/2001/XMLSchema"
  // !:long            - "http://www.w3.org/2001/XMLSchema"
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"

  RQOrder            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrder = class(TRemotable)
  private
    Fcode : Integer; 
    FnumberDoc : WideString;
    FnumberProject : WideString;
    ForderPeriod : TXSDate;
    FdateGen : TXSDate;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FdepartmentRef : ENDepartment;
//???
    FbudgetRef : ENDepartment;
//???
    FrqOrderType : RQOrderType;
//???
    FkindRef : RQOrderKindRef;
//???
    FrqOrderForm : RQOrderForm;
//???
    FrqOrderResource : RQOrderResource;
//???
    FstatusRef : RQOrderStatusRef;
//???
    FcreationMethodRef : RQOrderCreationMethodRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property numberProject : WideString read FnumberProject write FnumberProject;
    property orderPeriod : TXSDate read ForderPeriod write ForderPeriod;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property departmentRef : ENDepartment read FdepartmentRef write FdepartmentRef; 
    property budgetRef : ENDepartment read FbudgetRef write FbudgetRef; 
    property rqOrderType : RQOrderType read FrqOrderType write FrqOrderType; 
    property kindRef : RQOrderKindRef read FkindRef write FkindRef; 
    property rqOrderForm : RQOrderForm read FrqOrderForm write FrqOrderForm; 
    property rqOrderResource : RQOrderResource read FrqOrderResource write FrqOrderResource; 
    property statusRef : RQOrderStatusRef read FstatusRef write FstatusRef; 
    property creationMethodRef : RQOrderCreationMethodRef read FcreationMethodRef write FcreationMethodRef;
  end;

  RQOrderFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FnumberDoc : WideString;
    FnumberProject : WideString;
    ForderPeriod : TXSDate;
    FdateGen : TXSDate;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FdepartmentRef : ENDepartment;
//???
    FbudgetRef : ENDepartment;
//???
    FrqOrderType : RQOrderType;
//???
    FkindRef : RQOrderKindRef;
//???
    FrqOrderForm : RQOrderForm;
//???
    FrqOrderResource : RQOrderResource;
//???
    FstatusRef : RQOrderStatusRef;
//???
    FcreationMethodRef : RQOrderCreationMethodRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property numberProject : WideString read FnumberProject write FnumberProject;
    property orderPeriod : TXSDate read ForderPeriod write ForderPeriod;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property departmentRef : ENDepartment read FdepartmentRef write FdepartmentRef; 
    property budgetRef : ENDepartment read FbudgetRef write FbudgetRef; 
    property rqOrderType : RQOrderType read FrqOrderType write FrqOrderType; 
    property kindRef : RQOrderKindRef read FkindRef write FkindRef; 
    property rqOrderForm : RQOrderForm read FrqOrderForm write FrqOrderForm; 
    property rqOrderResource : RQOrderResource read FrqOrderResource write FrqOrderResource; 
    property statusRef : RQOrderStatusRef read FstatusRef write FstatusRef; 
    property creationMethodRef : RQOrderCreationMethodRef read FcreationMethodRef write FcreationMethodRef;
  end;

  RQOrderShort = class(TRemotable)
  private
    Fcode : Integer; 
    FnumberDoc : WideString;
    FnumberProject : WideString;
    ForderPeriod : TXSDate;
    FdateGen : TXSDate;
    FuserGen : WideString;
    FdepartmentRefCode : Integer; 
    FdepartmentRefShortName : WideString;
    FdepartmentRefDateStart : TXSDate;
    FdepartmentRefDateFinal : TXSDate;
    FbudgetRefCode : Integer; 
    FbudgetRefShortName : WideString;
    FbudgetRefDateStart : TXSDate;
    FbudgetRefDateFinal : TXSDate;
    FrqOrderTypeCode : Integer; 
    FrqOrderTypeName : WideString;
    FkindRefCode : Integer; 
    FkindRefName : WideString;
    FrqOrderFormCode : Integer; 
    FrqOrderFormName : WideString;
    FrqOrderResourceCode : Integer; 
    FrqOrderResourceName : WideString;
    FstatusRefCode : Integer; 
    FstatusRefName : WideString;
    FsumGen : TXSDecimal;
    FcreationMethodRefCode : Integer;
    FcreationMethodRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property numberProject : WideString read FnumberProject write FnumberProject;
    property orderPeriod : TXSDate read ForderPeriod write ForderPeriod;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property userGen : WideString read FuserGen write FuserGen;

    property departmentRefCode : Integer read FdepartmentRefCode write FdepartmentRefCode; 
    property departmentRefShortName : WideString read FdepartmentRefShortName write FdepartmentRefShortName; 
    property departmentRefDateStart : TXSDate read FdepartmentRefDateStart write FdepartmentRefDateStart; 
    property departmentRefDateFinal : TXSDate read FdepartmentRefDateFinal write FdepartmentRefDateFinal; 
    property budgetRefCode : Integer read FbudgetRefCode write FbudgetRefCode; 
    property budgetRefShortName : WideString read FbudgetRefShortName write FbudgetRefShortName; 
    property budgetRefDateStart : TXSDate read FbudgetRefDateStart write FbudgetRefDateStart; 
    property budgetRefDateFinal : TXSDate read FbudgetRefDateFinal write FbudgetRefDateFinal; 
    property rqOrderTypeCode : Integer read FrqOrderTypeCode write FrqOrderTypeCode; 
    property rqOrderTypeName : WideString read FrqOrderTypeName write FrqOrderTypeName; 
    property kindRefCode : Integer read FkindRefCode write FkindRefCode; 
    property kindRefName : WideString read FkindRefName write FkindRefName; 
    property rqOrderFormCode : Integer read FrqOrderFormCode write FrqOrderFormCode; 
    property rqOrderFormName : WideString read FrqOrderFormName write FrqOrderFormName; 
    property rqOrderResourceCode : Integer read FrqOrderResourceCode write FrqOrderResourceCode; 
    property rqOrderResourceName : WideString read FrqOrderResourceName write FrqOrderResourceName; 
    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode; 
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
    property sumGen : TXSDecimal read FsumGen write FsumGen;  
    property creationMethodRefCode : Integer read FcreationMethodRefCode write FcreationMethodRefCode;
    property creationMethodRefName : WideString read FcreationMethodRefName write FcreationMethodRefName;
  end;

  ArrayOfRQOrderShort = array of RQOrderShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOrderShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOrderShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOrderShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOrderController/message/
  // soapAction: http://ksoe.org/RQOrderController/action/RQOrderController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOrderControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOrderController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOrderControllerSoapPort = interface(IInvokable)
  ['{AA5F388F-C30D-4EBA-A0F4-B29ECAE574C3}']
    function  add(const aRQOrder: RQOrder): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOrder: RQOrder); stdcall;
    function  getObject(const anObjectCode: Integer): RQOrder; stdcall;
    function  getList: RQOrderShortList; stdcall;
    function  getFilteredList(const aRQOrderFilter: RQOrderFilter): RQOrderShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOrderShortList; stdcall;
    function  getScrollableFilteredList(const aRQOrderFilter: RQOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrderShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOrderShortList; stdcall;

    //procedure confirmDepartment(const orderCode : Integer); stdcall;

    // утверждение Плановой Заявки ТМЦ
    procedure confirmBudget(const orderCode : Integer); stdcall;
    // утверждение ВнеПлановой Заявки ТМЦ
    procedure confirmNoPlaned(const orderCode : Integer); stdcall;
    // утверждение Плановой Заявки Услуги
    procedure confirmServices(const orderCode : Integer); stdcall;
    // утверждение ВнеПлановой Заявки Услуги
    procedure confirmNoPlanedServices(const orderCode : Integer); stdcall;
    // утверждение Заявки на Изготовление
    procedure confirmProduction(const orderCode : Integer); stdcall;

    //procedure preConfirmBudget(const orderCode : Integer); stdcall;
    //procedure confirmOE(const orderCode : Integer); stdcall;

    //procedure addRQOrderDepartmentInBudget(const budgetOrderCode : Integer; const departmentOrderCode: Integer); stdcall;
    //procedure removeRQOrderDepartmentFromBudget(const budgetOrderCode : Integer); stdcall;

    //procedure addRQOrderBudgetInOE(const oeOrderCode : Integer; const budgetOrderCode: Integer); stdcall;
    //procedure removeRQOrderBudgetFromOE(const budgetOrderCode : Integer); stdcall;

    //procedure unConfirmDepartment(const orderCode : Integer); stdcall;
    //procedure unConfirmBudeget(const orderCode : Integer); stdcall;
    procedure unPreConfirmBudeget(const orderCode : Integer); stdcall;
    //procedure unConfirmOE(const orderCode : Integer); stdcall;

    //function  addDepartment(const aRQOrder: RQOrder): Integer; stdcall;
    //function  addBudget(const aRQOrder: RQOrder): Integer; stdcall;
    //function  addOE(const aRQOrder: RQOrder): Integer; stdcall;

    // отмена утверждения ВнеПлановой Заявки ТМЦ
    procedure unConfirmNoPlaned(const orderCode : Integer); stdcall;
    // отмена утверждения Плановой Заявки Услуги
    procedure unConfirmServices(const orderCode : Integer); stdcall;
    // отмена утверждения ВнеПлановой Заявки Услуги
    procedure unConfirmNoPlanedServices(const orderCode : Integer); stdcall;
    // отмена утверждения Заявки на Изготовление
    procedure unConfirmProduction(const orderCode : Integer); stdcall;


    function  addOEPlannedAuto(const aRQOrder: RQOrder): Integer; stdcall;
    function  addOENoPlanned(const aRQOrder: RQOrder): Integer; stdcall;
    function  addProduction(const aRQOrder: RQOrder): Integer; stdcall;
    function  addOEPlannedServices(const aRQOrder: RQOrder): Integer; stdcall;
    function  addOENOPlannedServices(const aRQOrder: RQOrder): Integer; stdcall;

    function  addReplenishmentAVZ(const aRQOrder: RQOrder; const isAVZ : Boolean): Integer; stdcall;

    procedure removeOEPlannedAuto(const aOrderCode: Integer); stdcall;
    procedure removeOENoPlanned(const aOrderCode: Integer); stdcall;
    procedure removeOEPlannedServices(const aOrderCode: Integer); stdcall;
    procedure removeOENOPlannedServices(const aOrderCode: Integer); stdcall;

    procedure createOEPlannedAutoItems(const aOrderCode: Integer); stdcall;
    procedure removeOEPlannedAutoItems(const aOrderCode: Integer); stdcall;
    procedure createOEPlannedServicesItems(const aOrderCode: Integer); stdcall;
    procedure removeOEPlannedAutoServicesItems(const aOrderCode: Integer); stdcall;
    procedure createReplenishmentAVZItems(const aOrderCode: Integer); stdcall;
    procedure removeReplenishmentAVZItems(const aOrderCode: Integer); stdcall;

    function createOrderByPlan(const aPlanCode: Integer; const strCodes: WideString): Integer; stdcall;

    ///// 15.07.13
    procedure updatePaymentDateOrderedByOrgName(const aOrderCode: Integer); stdcall;
    /////SUPP-7267 метод на изменение периода заявки
    procedure changePeriodOrder(const orderCode: Integer;  const orderPeriod: TXSDate); stdcall;
    /////

    function getScrollableFilteredCodeArray(const aRQOrderFilter: RQOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQOrderShort; stdcall;

    ///// Метод для автоматического формирования заявки на счетчики (с учетом потребности и текущих остатков)
    function addCountersServices(): Integer; stdcall;
    /////

    function isOrderForVRTU(const anOrderCode: Integer): Boolean; stdcall;
  end;


implementation

  destructor RQOrder.Destroy;
  begin
    if Assigned(ForderPeriod) then
      orderPeriod.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    if Assigned(FbudgetRef) then
      budgetRef.Free;
    if Assigned(FrqOrderType) then
      rqOrderType.Free;
    if Assigned(FkindRef) then
      kindRef.Free;
    if Assigned(FrqOrderForm) then
      rqOrderForm.Free;
    if Assigned(FrqOrderResource) then
      rqOrderResource.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FcreationMethodRef) then
      creationMethodRef.Free;
    inherited Destroy;
  end;
  
  destructor RQOrderFilter.Destroy;
  begin
    if Assigned(ForderPeriod) then
      orderPeriod.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    if Assigned(FbudgetRef) then
      budgetRef.Free;
    if Assigned(FrqOrderType) then
      rqOrderType.Free;
    if Assigned(FkindRef) then
      kindRef.Free;
    if Assigned(FrqOrderForm) then
      rqOrderForm.Free;
    if Assigned(FrqOrderResource) then
      rqOrderResource.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FcreationMethodRef) then
      creationMethodRef.Free;

    inherited Destroy;
  end; 
  
  destructor RQOrderShort.Destroy;
  begin
    if Assigned(ForderPeriod) then
      orderPeriod.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdepartmentRefDateStart) then
      departmentRefDateStart.Free;
    if Assigned(FdepartmentRefDateFinal) then
      departmentRefDateFinal.Free;
    if Assigned(FbudgetRefDateStart) then
      budgetRefDateStart.Free;
    if Assigned(FbudgetRefDateFinal) then
      budgetRefDateFinal.Free;
    inherited Destroy;
  end; 
  
  destructor RQOrderShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;



initialization

  RemClassRegistry.RegisterXSClass(RQOrder, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder');
  RemClassRegistry.RegisterXSClass(RQOrderRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderRef');
  RemClassRegistry.RegisterXSClass(RQOrderFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderFilter');
  RemClassRegistry.RegisterXSClass(RQOrderShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderShort');
  RemClassRegistry.RegisterXSClass(RQOrderShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOrderShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOrderShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOrderControllerSoapPort), 'http://ksoe.org/RQOrderController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOrderControllerSoapPort), 'http://ksoe.org/RQOrderController/action/RQOrderController.%operationName%');


end.
