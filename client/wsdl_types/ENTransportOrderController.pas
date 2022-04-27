unit ENTransportOrderController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENTransportOrderStatusController 
   ,ENPlanWorkController 
   ,TKTransportController 
   ,TKTransportRealController
   ,ENTransportDepartmentController
   ,ENTransportItemController
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
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"

  ENTransportOrder            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportOrderRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportOrder = class(TRemotable)
  private
    Fcode : Integer; 
    Fnumbergen : WideString;
    FtimeStart : TXSDateTime;	
    FtimeFinal : TXSDateTime;	
    FdateStart : TXSDateTime;	
    FdateFinal : TXSDateTime;
    FisAssignment : Integer;
    FisApproved : Integer; 
    FisRejected : Integer; 
    FcommentGen : WideString;
    FdateEdit : TXSDateTime;	
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    FtransportOrderStatus : ENTransportOrderStatus;
//???
    FplanRef : ENPlanWorkRef;
//???
    Ftransport : TKTransportRef;
//???
    FtransportReal : TKTransportReal;
//???
    FtransportDepartment : ENTransportDepartmentRef;
    FparentRef : ENTransportOrderRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property numbergen : WideString read Fnumbergen write Fnumbergen;
    property timeStart : TXSDateTime read FtimeStart write FtimeStart;	
    property timeFinal : TXSDateTime read FtimeFinal write FtimeFinal;	
    property dateStart : TXSDateTime read FdateStart write FdateStart;	
    property dateFinal : TXSDateTime read FdateFinal write FdateFinal;
    property isAssignment : Integer read FisAssignment write FisAssignment;
    property  isApproved : Integer read FisApproved write FisApproved; 
    property  isRejected : Integer read FisRejected write FisRejected; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property transportOrderStatus : ENTransportOrderStatus read FtransportOrderStatus write FtransportOrderStatus; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
    property transport : TKTransportRef read Ftransport write Ftransport; 
    property transportReal : TKTransportReal read FtransportReal write FtransportReal; 
    property transportDepartment : ENTransportDepartmentRef read FtransportDepartment write FtransportDepartment; 
    property parentRef : ENTransportOrderRef read FparentRef write FparentRef; 
  end;
  
{
  ENTransportOrderFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fnumbergen : WideString;
    FtimeStart : DateTime; 
    FtimeFinal : DateTime; 
    FdateStart : DateTime; 
    FdateFinal : DateTime; 
    FcommentGen : WideString;
    FdateEdit : DateTime; 
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    FtransportOrderStatus : ENTransportOrderStatus;
//???
    FplanRef : ENPlanWorkRef;
//???
    Ftransport : TKTransportRef;
//???
    FtransportReal : TKTransportReal;
//???
    FtransportDepartment : ENTransportDepartmentRef;
    FparentRef : ENTransportOrderRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property numbergen : WideString read Fnumbergen write Fnumbergen;
    property timeStart : DateTime; 
    property timeFinal : DateTime; 
    property dateStart : DateTime; 
    property dateFinal : DateTime; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateEdit : DateTime; 
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property transportOrderStatus : ENTransportOrderStatus read FtransportOrderStatus write FtransportOrderStatus; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
    property transport : TKTransportRef read Ftransport write Ftransport; 
    property transportReal : TKTransportReal read FtransportReal write FtransportReal; 
    property transportDepartment : ENTransportDepartmentRef read FtransportDepartment write FtransportDepartment; 
    property parentRef : ENTransportOrderRef read FparentRef write FparentRef; 
  end;
}

  ENTransportOrderFilter = class(ENTransportOrder)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTransportOrderShort = class(TRemotable)
  private
    Fcode : Integer;
    Fnumbergen : WideString;
    FtimeStart : TXSDateTime;
    FtimeFinal : TXSDateTime;
    FdateStart : TXSDateTime;
    FdateFinal : TXSDateTime;
    FisAssignment : Integer;
    FisApproved : Integer; 
    FisRejected : Integer; 
    FdateEdit : TXSDateTime;
    FuserGen : WideString;
    FtransportOrderStatusCode : Integer; 
    FtransportOrderStatusName : WideString;
    FplanRefCode : Integer; 
    FplanRefDateGen : TXSDate;
    FplanRefDateStart : TXSDate;
    FplanRefDateFinal : TXSDate;
    FplanRefKindCode : Integer;
    FplanRefKindName : WideString;
    FplanRefYearGen : Integer; 
    FplanRefMonthGen : Integer; 
    FplanRefYearOriginal : Integer; 
    FplanRefMonthOriginal : Integer; 
    FplanRefUserGen : WideString;
    FplanRefDateEdit : TXSDate;
    FplanRefWorkOrderNumber : WideString;
    FplanRefDateWorkOrder : TXSDate;
    FplanRefPriConnectionNumber : WideString;
    FplanRefServicesFSideFinId : Integer; 
    FplanRefServicesFSideCnNum : WideString;
    FtransportCode : Integer; 
    FtransportName : WideString;
    FtransportRealCode : Integer; 
    FtransportRealName : WideString;
    FtransportRealInvNumber : WideString;
    FtransportRealGosNumber : WideString;
    FtransportDepartmentCode : Integer; 
    FtransportDepartmentName : WideString;
    FelementName : WideString;
    FfinMOLName : WideString;
    FfinExecutor : WideString;
    FparentRefCode : Integer;
    FparentRefNumbergen : WideString;
    FparentRefTimeStart : TXSDateTime;
    FparentRefTimeFinal : TXSDateTime;
    FparentRefDateStart : TXSDateTime;
    FparentRefDateFinal : TXSDateTime;
    FparentRefIsAssignment : Integer; 
    FparentRefIsApproved : Integer; 
    FparentRefIsRejected : Integer; 
    FparentRefDateEdit : TXSDateTime;
    FparentRefUserGen : WideString;
    FPlanRefDepartmentName : WideString;
    FtravelSheetCode : Integer;
    FtravelSheetNumber : WideString;
    FunOrderedTransportQty : Integer;
    ForderedTransportQty : Integer;
    FfinMolPhoneNumber : WideString;
    FmechanicFinMolCode : WideString;

    FminRideOut : TXSDateTime;
    FmaxRideIn : TXSDateTime;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numbergen : WideString read Fnumbergen write Fnumbergen; 
    property timeStart : TXSDateTime read FtimeStart write FtimeStart;	
    property timeFinal : TXSDateTime read FtimeFinal write FtimeFinal;	
    property dateStart : TXSDateTime read FdateStart write FdateStart;
    property dateFinal : TXSDateTime read FdateFinal write FdateFinal;
    property isAssignment : Integer read FisAssignment write FisAssignment;
    property  isApproved : Integer read FisApproved write FisApproved; 
    property  isRejected : Integer read FisRejected write FisRejected; 
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property userGen : WideString read FuserGen write FuserGen;

    property transportOrderStatusCode : Integer read FtransportOrderStatusCode write FtransportOrderStatusCode; 
    property transportOrderStatusName : WideString read FtransportOrderStatusName write FtransportOrderStatusName;
    property planRefCode : Integer read FplanRefCode write FplanRefCode; 
    property planRefDateGen : TXSDate read FplanRefDateGen write FplanRefDateGen; 
    property planRefDateStart : TXSDate read FplanRefDateStart write FplanRefDateStart; 
    property planRefDateFinal : TXSDate read FplanRefDateFinal write FplanRefDateFinal; 
    property planRefYearGen : Integer read FplanRefYearGen write FplanRefYearGen; 
    property planRefMonthGen : Integer read FplanRefMonthGen write FplanRefMonthGen; 
    property planRefYearOriginal : Integer read FplanRefYearOriginal write FplanRefYearOriginal; 
    property planRefMonthOriginal : Integer read FplanRefMonthOriginal write FplanRefMonthOriginal; 
    property planRefUserGen : WideString read FplanRefUserGen write FplanRefUserGen; 
    property planRefDateEdit : TXSDate read FplanRefDateEdit write FplanRefDateEdit; 
    property planRefWorkOrderNumber : WideString read FplanRefWorkOrderNumber write FplanRefWorkOrderNumber; 
    property planRefDateWorkOrder : TXSDate read FplanRefDateWorkOrder write FplanRefDateWorkOrder; 
    property planRefPriConnectionNumber : WideString read FplanRefPriConnectionNumber write FplanRefPriConnectionNumber; 
    property planRefServicesFSideFinId : Integer read FplanRefServicesFSideFinId write FplanRefServicesFSideFinId; 
    property planRefServicesFSideCnNum : WideString read FplanRefServicesFSideCnNum write FplanRefServicesFSideCnNum; 
    property transportCode : Integer read FtransportCode write FtransportCode; 
    property transportName : WideString read FtransportName write FtransportName;
    property transportRealCode : Integer read FtransportRealCode write FtransportRealCode; 
    property transportRealName : WideString read FtransportRealName write FtransportRealName; 
    property transportRealInvNumber : WideString read FtransportRealInvNumber write FtransportRealInvNumber; 
    property transportRealGosNumber : WideString read FtransportRealGosNumber write FtransportRealGosNumber; 
    property transportDepartmentCode : Integer read FtransportDepartmentCode write FtransportDepartmentCode;
    property transportDepartmentName : WideString read FtransportDepartmentName write FtransportDepartmentName;
    property elementName : WideString read FelementName write FelementName;
    property finMOLName : WideString read FfinMOLName write FfinMOLName;
    property finExecutor : WideString read FfinExecutor write FfinExecutor;
    property parentRefCode : Integer read FparentRefCode write FparentRefCode; 
    property parentRefNumbergen : WideString read FparentRefNumbergen write FparentRefNumbergen; 
    property parentRefTimeStart : TXSDateTime read FparentRefTimeStart write FparentRefTimeStart; 
    property parentRefTimeFinal : TXSDateTime read FparentRefTimeFinal write FparentRefTimeFinal; 
    property parentRefDateStart : TXSDateTime read FparentRefDateStart write FparentRefDateStart; 
    property parentRefDateFinal : TXSDateTime read FparentRefDateFinal write FparentRefDateFinal;
    property parentRefIsAssignment : Integer read FparentRefIsAssignment write FparentRefIsAssignment; 
    property parentRefIsApproved : Integer read FparentRefIsApproved write FparentRefIsApproved; 
    property parentRefIsRejected : Integer read FparentRefIsRejected write FparentRefIsRejected; 
    property parentRefDateEdit : TXSDateTime read FparentRefDateEdit write FparentRefDateEdit; 
    property parentRefUserGen : WideString read FparentRefUserGen write FparentRefUserGen; 
    property planRefKindCode : Integer read FplanRefKindCode write FplanRefKindCode;
    property planRefKindName : WideString read FplanRefKindName write FplanRefKindName;
    property planRefDepartmentName : WideString read FplanRefDepartmentName write FplanRefDepartmentName;
    property travelSheetCode : Integer read FtravelSheetCode write FtravelSheetCode;
    property travelSheetNumber : WideString read FtravelSheetNumber write FtravelSheetNumber;
    property unOrderedTransportQty : Integer read FunOrderedTransportQty write FunOrderedTransportQty;
    property orderedTransportQty : Integer read ForderedTransportQty write ForderedTransportQty;
    property finMolPhoneNumber : WideString read FfinMolPhoneNumber write FfinMolPhoneNumber;
    property mechanicFinMolCode : WideString read FmechanicFinMolCode write FmechanicFinMolCode;

    property minRideOut : TXSDateTime read FminRideOut write FminRideOut;
    property maxRideIn : TXSDateTime read FmaxRideIn write FmaxRideIn;
  end;

  ArrayOfENTransportOrderShort = array of ENTransportOrderShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTransportOrderShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTransportOrderShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTransportOrderShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTransportOrderController/message/
  // soapAction: http://ksoe.org/ENTransportOrderController/action/ENTransportOrderController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTransportOrderControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTransportOrderController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTransportOrderControllerSoapPort = interface(IInvokable)
  ['{6BF1E801-2DAB-4207-A43B-A05DA7F36817}']
    function  add(const aENTransportOrder: ENTransportOrder): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTransportOrder: ENTransportOrder); stdcall;
    function  getObject(const anObjectCode: Integer): ENTransportOrder; stdcall;
    function  getList: ENTransportOrderShortList; stdcall;
    function  getFilteredList(const aENTransportOrderFilter: ENTransportOrderFilter): ENTransportOrderShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTransportOrderShortList; stdcall;
    function  getScrollableFilteredList(const aENTransportOrderFilter: ENTransportOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTransportOrderShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTransportOrderShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTransportOrderFilter: ENTransportOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function  getGroupedTransportListByPlanCode(const planCode: Integer): ENTransportOrderShortList; stdcall;
    function  getGroupedTransportListByTransportCode(const transportCode: Integer; const orderDateStart : TXSDateTime; const orderDateFinal : TXSDateTime; const departmentCode : Integer): ENTransportOrderShortList; stdcall;
    procedure addTransportOrderWithTransportItems(const transportItemList : ArrayOfENTransportItemShort ; const timeFrom : TXSDateTime; const dateFrom: TXSDate; const timeTill: TXSDateTime; const dateTill: TXSDate; const transportDepartmentCode: Integer; const isAssignment: Integer); stdcall;
    procedure addTransportFromSideOnTransportOrder (const transportOrderCode : Integer; const transportReal : Integer); stdcall;
    procedure removeTransportOrderWithTransportItems(const transportOrderCode : Integer); stdcall;
    procedure addTransportWithWorker(const transportOrderCode : Integer; const tabNumber : WideString; const transportReal : Integer); stdcall;
    procedure removeTransportOrderItemsFromTravelSheet(const transportOrderCode : Integer); stdcall;
    function  getGroupedTransportListByDateAndDepartment(const orderDateStart : TXSDateTime; const orderDateFinal : TXSDateTime; const departmentCode : Integer): ENTransportOrderShortList; stdcall;
    function  getListOfNormTransport(const aENTransportOrderFilter: ENTransportOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTransportOrderShortList; stdcall;
    procedure setApprove(const transportOrderCode: Integer); stdcall;
    procedure setReject(const transportOrderCode: Integer); stdcall;
    procedure undoApprove(const transportOrderCode: Integer); stdcall;
    procedure undoReject(const transportOrderCode: Integer); stdcall;
    procedure setTransportRealToTransportOrder(const transportOrderCode: Integer; const transportRealCode: Integer); stdcall;
    procedure setNullTransportRealToTransportOrder(const transportOrderCode: Integer); stdcall;
    end;


implementation

  destructor ENTransportOrder.Destroy;
  begin
    if Assigned(FtimeStart) then
      timeStart.Free;
    if Assigned(FtimeFinal) then
      timeFinal.Free;
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FtransportOrderStatus) then
      transportOrderStatus.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(Ftransport) then
      transport.Free;
    if Assigned(FtransportReal) then
      transportReal.Free;
    if Assigned(FtransportDepartment) then
      transportDepartment.Free;
    if Assigned(FparentRef) then
      parentRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENTransportOrderFilter.Destroy;
  begin
    if Assigned(FtimeStart) then
      timeStart.Free;
    if Assigned(FtimeFinal) then
      timeFinal.Free;
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FtransportOrderStatus) then
      transportOrderStatus.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(Ftransport) then
      transport.Free;
    if Assigned(FtransportReal) then
      transportReal.Free;
    if Assigned(FtransportDepartment) then
      transportDepartment.Free;
    if Assigned(FparentRef) then
      parentRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENTransportOrderFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENTransportOrderShort.Destroy;
  begin
    if Assigned(FtimeStart) then
      timeStart.Free;
    if Assigned(FtimeFinal) then
      timeFinal.Free;
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanRefDateGen) then
      planRefDateGen.Free;
    if Assigned(FplanRefDateStart) then
      planRefDateStart.Free;
    if Assigned(FplanRefDateFinal) then
      planRefDateFinal.Free;
    if Assigned(FplanRefDateEdit) then
      planRefDateEdit.Free;
    if Assigned(FplanRefDateWorkOrder) then
      planRefDateWorkOrder.Free;
    if Assigned(FparentRefTimeStart) then
      parentRefTimeStart.Free;
    if Assigned(FparentRefTimeFinal) then
      parentRefTimeFinal.Free;
    if Assigned(FparentRefDateStart) then
      parentRefDateStart.Free;
    if Assigned(FparentRefDateFinal) then
      parentRefDateFinal.Free;
    if Assigned(FparentRefDateEdit) then
      parentRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENTransportOrderShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTransportOrder, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportOrder');
  RemClassRegistry.RegisterXSClass(ENTransportOrderRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportOrderRef');
  RemClassRegistry.RegisterXSClass(ENTransportOrderFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportOrderFilter');
  RemClassRegistry.RegisterXSClass(ENTransportOrderShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportOrderShort');
  RemClassRegistry.RegisterXSClass(ENTransportOrderShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportOrderShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTransportOrderShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTransportOrderShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTransportOrderControllerSoapPort), 'http://ksoe.org/ENTransportOrderController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTransportOrderControllerSoapPort), 'http://ksoe.org/ENTransportOrderController/action/ENTransportOrderController.%operationName%');


end.

