unit ENTransportItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENPlanWorkController 
   ,ENPlanWorkItemController 
   ,TKTransportRealController 
   ,TKTransportController 
   ,ENEstimateItemTypeController 
   ,TKTransportTypeController 
   ,FINWorkerController 
   ,ENTransportDepartmentController 
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

  ENTransportItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportItem = class(TRemotable)
  private
    Fcode : Integer; 
    FcountWorkGen : TXSDecimal;
    FcountWorkFact : TXSDecimal;
    Fprice : TXSDecimal;
    Fcost : TXSDecimal;
    FnumberList : WideString;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
    FisUseTrailer : Integer;
    Fdistance : TXSDecimal;
    FamountOfJourneys : Integer; 
    FdistanceNorm : TXSDecimal;
//???
    FplanRef : ENPlanWorkRef;
//???
    FplanItemRef : ENPlanWorkItemRef;
//???
    FtransportReal : TKTransportReal;
    FtrailerTransportReal : TKTransportReal;
//???
    Ftransport : TKTransport;
//???
    FtypeRef : ENEstimateItemTypeRef;
//???
    FtktransportType : TKTransportType;
//???
    FfinWorker : FINWorker;
    FtransportDepartment : ENTransportDepartment;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countWorkGen : TXSDecimal read FcountWorkGen write FcountWorkGen; 
    property countWorkFact : TXSDecimal read FcountWorkFact write FcountWorkFact; 
    property price : TXSDecimal read Fprice write Fprice; 
    property cost : TXSDecimal read Fcost write Fcost;
    property numberList : WideString read FnumberList write FnumberList;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property isUseTrailer : Integer read FisUseTrailer write FisUseTrailer;
    property distance : TXSDecimal read Fdistance write Fdistance; 
     property distanceNorm : TXSDecimal read FdistanceNorm write FdistanceNorm; 
    property  amountOfJourneys : Integer read FamountOfJourneys write FamountOfJourneys; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
    property planItemRef : ENPlanWorkItemRef read FplanItemRef write FplanItemRef; 
    property transportReal : TKTransportReal read FtransportReal write FtransportReal; 
    property trailerTransportReal : TKTransportReal read FtrailerTransportReal write FtrailerTransportReal;
    property transport : TKTransport read Ftransport write Ftransport; 
    property typeRef : ENEstimateItemTypeRef read FtypeRef write FtypeRef;
    property tktransportType : TKTransportType read FtktransportType write FtktransportType; 
    property finWorker : FINWorker read FfinWorker write FfinWorker; 
    property transportDepartment : ENTransportDepartment read FtransportDepartment write FtransportDepartment; 
end;

  ENTransportItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FcountWorkGen : TXSDecimal;
    FcountWorkFact : TXSDecimal;
    Fprice : TXSDecimal;
    Fcost : TXSDecimal;
    FnumberList : WideString;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FisUseTrailer : Integer; 
   Fdistance : TXSDecimal;
    FdistanceNorm : TXSDecimal;
    FamountOfJourneys : Integer; 
    Fmodify_time : Int64;
//???
    FplanRef : ENPlanWorkRef;
//???
    FplanItemRef : ENPlanWorkItemRef;
//???
    FtransportReal : TKTransportReal;
//???
    FtrailerTransportReal : TKTransportReal;
    Ftransport : TKTransport;
//???
    FtypeRef : ENEstimateItemTypeRef;
//???
    FtktransportType : TKTransportType;
//???
    FfinWorker : FINWorker;
    FtransportDepartment : ENTransportDepartment;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property countWorkGen : TXSDecimal read FcountWorkGen write FcountWorkGen; 
    property countWorkFact : TXSDecimal read FcountWorkFact write FcountWorkFact; 
    property price : TXSDecimal read Fprice write Fprice; 
    property cost : TXSDecimal read Fcost write Fcost;
    property numberList : WideString read FnumberList write FnumberList;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property  isUseTrailer : Integer read FisUseTrailer write FisUseTrailer;
   property distance : TXSDecimal read Fdistance write Fdistance; 
    property distanceNorm : TXSDecimal read FdistanceNorm write FdistanceNorm; 
    property  amountOfJourneys : Integer read FamountOfJourneys write FamountOfJourneys; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
    property planItemRef : ENPlanWorkItemRef read FplanItemRef write FplanItemRef; 
    property transportReal : TKTransportReal read FtransportReal write FtransportReal; 
    property trailerTransportReal : TKTransportReal read FtrailerTransportReal write FtrailerTransportReal; 
    property transport : TKTransport read Ftransport write Ftransport; 
    property typeRef : ENEstimateItemTypeRef read FtypeRef write FtypeRef; 
    property tktransportType : TKTransportType read FtktransportType write FtktransportType; 
    property finWorker : FINWorker read FfinWorker write FfinWorker; 
    property transportDepartment : ENTransportDepartment read FtransportDepartment write FtransportDepartment; 
 end;


  ENTransportItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    FcountWorkGen : TXSDecimal;
    FcountWorkFact : TXSDecimal;
    Fprice : TXSDecimal;
    Fcost : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fdistance : TXSDecimal;
   FdistanceNorm : TXSDecimal;
    FamountOfJourneys : Integer; 
    FplanRefCode : Integer; 
    FplanRefDateGen : TXSDate;
    FplanRefDateStart : TXSDate;
    FplanRefDateFinal : TXSDate;
    FplanRefYearGen : Integer; 
    FplanRefMonthGen : Integer; 
    FplanRefUserGen : WideString;
    FplanRefDateEdit : TXSDate;
    FplanRefWorkOrderNumber : WideString;
    FplanRefDateWorkOrder : TXSDate;
    FplanRefPriConnectionNumber : WideString;
    FplanItemRefCode : Integer; 
    FplanItemRefCountGen : TXSDecimal;
    FplanItemRefTimeGen : TXSDecimal;
    FplanItemRefUserGen : WideString;
    FplanItemRefDateEdit : TXSDate;
    FtransportRealCode : Integer; 
    FtransportRealName : WideString;
    FtransportRealInvNumber : WideString;
    FtransportRealGosNumber : WideString;
    FtrailerTransportRealCode : Integer; 
    FtrailerTransportRealName : WideString;
    FtrailerTransportRealInvNumber : WideString;
    FtrailerTransportRealGosNumber : WideString;
    FtransportCode : Integer; 
    FtransportName : WideString;
    FtypeRefCode : Integer; 
    FtypeRefName : WideString;
    FtktransportTypeCode : Integer; 
    FtktransportTypeName : WideString;
    FisUseTrailer : Integer; 
    FfinWorkerCode : Integer; 
    FfinWorkerName : WideString;
    FfinWorkerTabNumber : WideString;
    FfinWorkerPositionName : WideString;
    //FfinWorkerPositionCode : Integer;
    //FfinWorkerDepartmentName : WideString;
    //FfinWorkerDepartmentCode : WideString;
    //FfinWorkerPriceGen : TXSDecimal;
    //FfinWorkerCategor : Integer;
    FfinCode : Integer;
    //FfinWorkerIsSentAssignment : Integer;

    FtransportDepartmentCode : Integer; 
    FtransportDepartmentName : WideString;
    FkartaRefCode :Integer;
    FkartaRefName : WideString;
    FkartaNum : WideString;
    //FtransportTypeCode: Integer;
    //FtransportTypeName: WideString;
    FelementCode : Integer;
    FelementName : WideString;
    FelementInvNumber : WideString;

    FplanRefMOLName : WideString;
    FplanRefFinExecutorName : WideString;

    FplanRefKindCode : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countWorkGen : TXSDecimal read FcountWorkGen write FcountWorkGen; 
    property countWorkFact : TXSDecimal read FcountWorkFact write FcountWorkFact; 
    property price : TXSDecimal read Fprice write Fprice; 
    property cost : TXSDecimal read Fcost write Fcost; 
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property distanceNorm : TXSDecimal read FdistanceNorm write FdistanceNorm;
    property amountOfJourneys : Integer read FamountOfJourneys write FamountOfJourneys; 
    property planRefCode : Integer read FplanRefCode write FplanRefCode;
    property planRefDateGen : TXSDate read FplanRefDateGen write FplanRefDateGen; 
    property planRefDateStart : TXSDate read FplanRefDateStart write FplanRefDateStart; 
    property planRefDateFinal : TXSDate read FplanRefDateFinal write FplanRefDateFinal; 
    property planRefYearGen : Integer read FplanRefYearGen write FplanRefYearGen;
    property planRefMonthGen : Integer read FplanRefMonthGen write FplanRefMonthGen; 
    property planRefUserGen : WideString read FplanRefUserGen write FplanRefUserGen; 
    property planRefDateEdit : TXSDate read FplanRefDateEdit write FplanRefDateEdit; 
    property planRefWorkOrderNumber : WideString read FplanRefWorkOrderNumber write FplanRefWorkOrderNumber; 
    property planRefDateWorkOrder : TXSDate read FplanRefDateWorkOrder write FplanRefDateWorkOrder; 
    property planRefPriConnectionNumber : WideString read FplanRefPriConnectionNumber write FplanRefPriConnectionNumber; 
    property planItemRefCode : Integer read FplanItemRefCode write FplanItemRefCode; 
    property planItemRefCountGen : TXSDecimal read FplanItemRefCountGen write FplanItemRefCountGen; 
    property planItemRefTimeGen : TXSDecimal read FplanItemRefTimeGen write FplanItemRefTimeGen; 
    property planItemRefUserGen : WideString read FplanItemRefUserGen write FplanItemRefUserGen; 
    property planItemRefDateEdit : TXSDate read FplanItemRefDateEdit write FplanItemRefDateEdit; 
    property transportRealCode : Integer read FtransportRealCode write FtransportRealCode; 
    property transportRealName : WideString read FtransportRealName write FtransportRealName; 
    property transportRealInvNumber : WideString read FtransportRealInvNumber write FtransportRealInvNumber; 
    property transportRealGosNumber : WideString read FtransportRealGosNumber write FtransportRealGosNumber; 
    property trailerTransportRealCode : Integer read FtrailerTransportRealCode write FtrailerTransportRealCode; 
    property trailerTransportRealName : WideString read FtrailerTransportRealName write FtrailerTransportRealName; 
    property trailerTransportRealInvNumber : WideString read FtrailerTransportRealInvNumber write FtrailerTransportRealInvNumber; 
    property trailerTransportRealGosNumber : WideString read FtrailerTransportRealGosNumber write FtrailerTransportRealGosNumber; 
    property transportCode : Integer read FtransportCode write FtransportCode; 
    property transportName : WideString read FtransportName write FtransportName; 
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode; 
    property typeRefName : WideString read FtypeRefName write FtypeRefName; 
    property tktransportTypeCode : Integer read FtktransportTypeCode write FtktransportTypeCode; 
    property tktransportTypeName : WideString read FtktransportTypeName write FtktransportTypeName; 
    property finWorkerCode : Integer read FfinWorkerCode write FfinWorkerCode; 
    property finWorkerName : WideString read FfinWorkerName write FfinWorkerName; 
    property finWorkerTabNumber : WideString read FfinWorkerTabNumber write FfinWorkerTabNumber;
    property finWorkerPositionName : WideString read FfinWorkerPositionName write FfinWorkerPositionName; 
    //property finWorkerPositionCode : Integer read FfinWorkerPositionCode write FfinWorkerPositionCode;
    //property finWorkerDepartmentName : WideString read FfinWorkerDepartmentName write FfinWorkerDepartmentName;
    //property finWorkerDepartmentCode : WideString read FfinWorkerDepartmentCode write FfinWorkerDepartmentCode;
    //property finWorkerPriceGen : TXSDecimal read FfinWorkerPriceGen write FfinWorkerPriceGen;
    //property finWorkerCategor : Integer read FfinWorkerCategor write FfinWorkerCategor;
    property finCode : Integer read FfinCode write FfinCode;
    //property finWorkerIsSentAssignment : Integer read FfinWorkerIsSentAssignment write FfinWorkerIsSentAssignment;
    property  isUseTrailer : Integer read FisUseTrailer write FisUseTrailer;
    property transportDepartmentCode : Integer read FtransportDepartmentCode write FtransportDepartmentCode; 
    property transportDepartmentName : WideString read FtransportDepartmentName write FtransportDepartmentName; 
    property distance : TXSDecimal read Fdistance write Fdistance;
    property kartaRefCode :Integer read FkartaRefCode write FkartaRefCode;
    property kartaRefName : WideString read FkartaRefName write FkartaRefName;
    property kartaNum : WideString read FkartaNum write FkartaNum;
    property elementCode : Integer read FelementCode write FelementCode;
    property elementName : WideString read FelementName write FelementName;
    property elementInvNumber : WideString read FelementInvNumber write FelementInvNumber;

    property planRefMOLName :WideString read FplanRefMOLName write FplanRefMOLName;
    property planRefFinExecutorName :WideString read FplanRefFinExecutorName write FplanRefFinExecutorName;

    property planRefKindCode : Integer read FplanRefKindCode write FplanRefKindCode;
  end;

  ArrayOfENTransportItemShort = array of ENTransportItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTransportItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTransportItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTransportItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTransportItemController/message/
  // soapAction: http://ksoe.org/ENTransportItemController/action/ENTransportItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTransportItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTransportItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTransportItemControllerSoapPort = interface(IInvokable)
  ['{7e517e51-7e51-7e51-7e51-7e517e517e51}']
    function  add(const aENTransportItem: ENTransportItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTransportItem: ENTransportItem); stdcall;
    function  getObject(const anObjectCode: Integer): ENTransportItem; stdcall;
    function  getList: ENTransportItemShortList; stdcall;
    function  getFilteredList(const aENTransportItemFilter: ENTransportItemFilter): ENTransportItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTransportItemShortList; stdcall;
    function  getScrollableFilteredList(const aENTransportItemFilter: ENTransportItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTransportItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTransportItemShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTransportItemFilter: ENTransportItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

    function getListForTravelSheetItem(const aENTransportItemFilter: ENTransportItemFilter) : ENTransportItemShortList; stdcall;
    function getListDetailedForTravelSheetItem(const aENTransportItemFilter: ENTransportItemFilter) : ENTransportItemShortList; stdcall;
    function getListDetailedForTransportOrder(const aENTransportItemFilter: ENTransportItemFilter) : ENTransportItemShortList; stdcall;

    procedure saveTimeFact(const aENTransportItemCode: Integer; const countFact : TXSDecimal); stdcall;

    procedure TEMP_GENERATE_GSM(const i: Integer); stdcall;
    function getListForDistances(const planCode: Integer): ENTransportItemShortList; stdcall;
    procedure addDistanceForTransport(const transportItemCode: Integer; const distance : TXSDecimal; const amountOfJourneys : Integer); stdcall;
    procedure removeDistanceForTransport(const transportItemCode: Integer); stdcall;

    procedure updateTransportDepartment(const transportItemCode: Integer; const ENTransportDepartmentCode: Integer ); stdcall;

  end;


implementation

  destructor ENTransportItem.Destroy;
  begin
    if Assigned(FcountWorkGen) then
      countWorkGen.Free;
    if Assigned(FcountWorkFact) then
      countWorkFact.Free;
    if Assigned(Fprice) then
      price.Free;
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdistanceNorm) then
      distanceNorm.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FplanItemRef) then
      planItemRef.Free;
    if Assigned(FtransportReal) then
      transportReal.Free;
    if Assigned(FtrailerTransportReal) then
      trailerTransportReal.Free;
    if Assigned(Ftransport) then
      transport.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FtktransportType) then
      tktransportType.Free;
    if Assigned(FfinWorker) then
      finWorker.Free;
if Assigned(FtransportDepartment) then
      transportDepartment.Free;
 inherited Destroy;
  end;
  
  destructor ENTransportItemFilter.Destroy;
  begin
    if Assigned(FcountWorkGen) then
      countWorkGen.Free;
    if Assigned(FcountWorkFact) then
      countWorkFact.Free;
    if Assigned(Fprice) then
      price.Free;
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
   if Assigned(FdistanceNorm) then
      distanceNorm.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FplanItemRef) then
      planItemRef.Free;
    if Assigned(FtransportReal) then
      transportReal.Free;
    if Assigned(FtrailerTransportReal) then
      trailerTransportReal.Free;
    if Assigned(Ftransport) then
      transport.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FtktransportType) then
      tktransportType.Free;
    if Assigned(FfinWorker) then
      finWorker.Free;
if Assigned(FtransportDepartment) then
      transportDepartment.Free;
    inherited Destroy;
  end; 
    
  
  destructor ENTransportItemShort.Destroy;
  begin
    if Assigned(FcountWorkGen) then
      countWorkGen.Free;
    if Assigned(FcountWorkFact) then
      countWorkFact.Free;
    if Assigned(Fprice) then
      price.Free;
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
   if Assigned(FdistanceNorm) then
      distanceNorm.Free;
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
    if Assigned(FplanItemRefCountGen) then
      planItemRefCountGen.Free;
    if Assigned(FplanItemRefTimeGen) then
      planItemRefTimeGen.Free;
    if Assigned(FplanItemRefDateEdit) then
      planItemRefDateEdit.Free;
    //if Assigned(FfinWorkerPriceGen) then
    //  finWorkerPriceGen.Free;
    if Assigned(Fdistance) then
      distance.Free;
    inherited Destroy;
  end; 
  
  destructor ENTransportItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTransportItem, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportItem');
  RemClassRegistry.RegisterXSClass(ENTransportItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportItemRef');
  RemClassRegistry.RegisterXSClass(ENTransportItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportItemFilter');
  RemClassRegistry.RegisterXSClass(ENTransportItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportItemShort');
  RemClassRegistry.RegisterXSClass(ENTransportItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTransportItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTransportItemShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTransportItemControllerSoapPort), 'http://ksoe.org/ENTransportItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTransportItemControllerSoapPort), 'http://ksoe.org/ENTransportItemController/action/ENTransportItemController.%operationName%');


end.

