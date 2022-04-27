unit ENTransportRouteController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENElementController
   ,ENDistanceController
   ,ENDistanceTypeController 
   ,ENPlanWorkController 
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

  ENTransportRoute            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportRouteRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportRoute = class(TRemotable)
  private
    Fcode : Integer; 
    Fdistance : TXSDecimal;
    Fweight : TXSDecimal;
    FdistanceNew : TXSDecimal;
    FspeedometerStart : TXSDecimal;
    FspeedometerFinal : TXSDecimal;
    FfuelCounterStart : TXSDecimal;
    FfuelCounterFinal : TXSDecimal;
    FcommentGen : WideString;
    FdateEdit : TXSDateTime;
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    FelementInRef : ENElementRef;
//???
    FelementOutRef : ENElementRef;
//???
    FdistanceRef : ENDistanceRef;
//???
    FdistanceTypeRef : ENDistanceTypeRef;
//???
    FplanRef : ENPlanWorkRef;
//???
    FparentRouteRef : ENTransportRouteRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property distance : TXSDecimal read Fdistance write Fdistance; 
    property weight : TXSDecimal read Fweight write Fweight;
    property distanceNew : TXSDecimal read FdistanceNew write FdistanceNew; 
    property speedometerStart : TXSDecimal read FspeedometerStart write FspeedometerStart;
    property speedometerFinal : TXSDecimal read FspeedometerFinal write FspeedometerFinal;
    property fuelCounterStart : TXSDecimal read FfuelCounterStart write FfuelCounterStart;
    property fuelCounterFinal : TXSDecimal read FfuelCounterFinal write FfuelCounterFinal;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property elementInRef : ENElementRef read FelementInRef write FelementInRef; 
    property elementOutRef : ENElementRef read FelementOutRef write FelementOutRef; 
    property distanceRef : ENDistanceRef read FdistanceRef write FdistanceRef; 
    property distanceTypeRef : ENDistanceTypeRef read FdistanceTypeRef write FdistanceTypeRef; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
    property parentRouteRef : ENTransportRouteRef read FparentRouteRef write FparentRouteRef; 
  end;
  
{
  ENTransportRouteFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fdistance : TXSDecimal;
    Fweight : TXSDecimal;
    FdistanceNew : TXSDecimal;
    FspeedometerStart : TXSDecimal;
    FspeedometerFinal : TXSDecimal;
    FfuelCounterStart : TXSDecimal;
    FfuelCounterFinal : TXSDecimal;
    FcommentGen : WideString;
    FdateEdit : DateTime; 
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    FelementInRef : ENElementRef;
//???
    FelementOutRef : ENElementRef;
//???
    FdistanceRef : ENDistanceRef;
//???
    FdistanceTypeRef : ENDistanceTypeRef;
//???
    FplanRef : ENPlanWorkRef;
//???
    FparentRouteRef : ENTransportRouteRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property distance : TXSDecimal read Fdistance write Fdistance; 
    property weight : TXSDecimal read Fweight write Fweight; 
    property distanceNew : TXSDecimal read FdistanceNew write FdistanceNew; 
    property speedometerStart : TXSDecimal read FspeedometerStart write FspeedometerStart; 
    property speedometerFinal : TXSDecimal read FspeedometerFinal write FspeedometerFinal; 
    property fuelCounterStart : TXSDecimal read FfuelCounterStart write FfuelCounterStart; 
    property fuelCounterFinal : TXSDecimal read FfuelCounterFinal write FfuelCounterFinal; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateEdit : DateTime; 
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property elementInRef : ENElementRef read FelementInRef write FelementInRef; 
    property elementOutRef : ENElementRef read FelementOutRef write FelementOutRef; 
    property distanceRef : ENDistanceRef read FdistanceRef write FdistanceRef; 
    property distanceTypeRef : ENDistanceTypeRef read FdistanceTypeRef write FdistanceTypeRef; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
    property parentRouteRef : ENTransportRouteRef read FparentRouteRef write FparentRouteRef; 
  end;
}

  ENTransportRouteFilter = class(ENTransportRoute)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTransportRouteShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fdistance : TXSDecimal;
    Fweight : TXSDecimal;
    FdistanceNew : TXSDecimal;
    FspeedometerStart : TXSDecimal;
    FspeedometerFinal : TXSDecimal;
    FfuelCounterStart : TXSDecimal;
    FfuelCounterFinal : TXSDecimal;
    FdateEdit : TXSDateTime;
    FuserGen : WideString;
    FelementInRefCode : Integer; 
    FelementOutRefCode : Integer; 
    FdistanceRefCode : Integer; 
    FdistanceRefDistance : TXSDecimal;
    FdistanceTypeRefCode : Integer; 
    FdistanceTypeRefName : WideString;
    FplanRefCode : Integer; 
    FplanRefDateGen : TXSDate;
    FplanRefDateStart : TXSDate;
    FplanRefDateFinal : TXSDate;
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
    FplanRefTotaltimehours : TXSDecimal;
    FplanRefTotaltimedays : TXSDecimal;
    FdestinationPointStart : WideString;
    FdestinationPointEnd : WideString;
    FparentRouteRefCode : Integer; 
    FparentRouteRefDistance : TXSDecimal;
    FparentRouteRefWeight : TXSDecimal;
    FparentRouteRefDistanceNew : TXSDecimal;
    FparentRouteRefSpeedometerStart : TXSDecimal;
    FparentRouteRefSpeedometerFinal : TXSDecimal;
    FparentRouteRefDateEdit : TXSDateTime;	
    FparentRouteRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property distance : TXSDecimal read Fdistance write Fdistance;
    property weight : TXSDecimal read Fweight write Fweight;
    property distanceNew : TXSDecimal read FdistanceNew write FdistanceNew; 
    property speedometerStart : TXSDecimal read FspeedometerStart write FspeedometerStart; 
    property speedometerFinal : TXSDecimal read FspeedometerFinal write FspeedometerFinal; 
    property fuelCounterStart : TXSDecimal read FfuelCounterStart write FfuelCounterStart; 
    property fuelCounterFinal : TXSDecimal read FfuelCounterFinal write FfuelCounterFinal; 
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	
    property userGen : WideString read FuserGen write FuserGen;

    property elementInRefCode : Integer read FelementInRefCode write FelementInRefCode; 
    property elementOutRefCode : Integer read FelementOutRefCode write FelementOutRefCode; 
    property distanceRefCode : Integer read FdistanceRefCode write FdistanceRefCode; 
    property distanceRefDistance : TXSDecimal read FdistanceRefDistance write FdistanceRefDistance; 
    property distanceTypeRefCode : Integer read FdistanceTypeRefCode write FdistanceTypeRefCode; 
    property distanceTypeRefName : WideString read FdistanceTypeRefName write FdistanceTypeRefName; 
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
    property planRefTotaltimehours : TXSDecimal read FplanRefTotaltimehours write FplanRefTotaltimehours; 
    property planRefTotaltimedays : TXSDecimal read FplanRefTotaltimedays write FplanRefTotaltimedays;
    property destinationPointStart : WideString read FdestinationPointStart write FdestinationPointStart;
    property destinationPointEnd : WideString read FdestinationPointEnd write FdestinationPointEnd;
    property parentRouteRefCode : Integer read FparentRouteRefCode write FparentRouteRefCode; 
    property parentRouteRefDistance : TXSDecimal read FparentRouteRefDistance write FparentRouteRefDistance; 
    property parentRouteRefWeight : TXSDecimal read FparentRouteRefWeight write FparentRouteRefWeight; 
    property parentRouteRefDistanceNew : TXSDecimal read FparentRouteRefDistanceNew write FparentRouteRefDistanceNew; 
    property parentRouteRefSpeedometerStart : TXSDecimal read FparentRouteRefSpeedometerStart write FparentRouteRefSpeedometerStart; 
    property parentRouteRefSpeedometerFinal : TXSDecimal read FparentRouteRefSpeedometerFinal write FparentRouteRefSpeedometerFinal; 
    property parentRouteRefDateEdit : TXSDateTime read FparentRouteRefDateEdit write FparentRouteRefDateEdit; 
    property parentRouteRefUserGen : WideString read FparentRouteRefUserGen write FparentRouteRefUserGen; 
  end;

  ArrayOfENTransportRouteShort = array of ENTransportRouteShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTransportRouteShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTransportRouteShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTransportRouteShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTransportRouteController/message/
  // soapAction: http://ksoe.org/ENTransportRouteController/action/ENTransportRouteController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTransportRouteControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTransportRouteController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTransportRouteControllerSoapPort = interface(IInvokable)
  ['{18fc18fc-18fc-18fc-18fc-18fc18fc18fc}']
    function  add(const aENTransportRoute: ENTransportRoute): Integer; stdcall; overload;
    function  add(const aENTransportRoute: ENTransportRoute; const isForTravelSheet: Boolean): Integer; stdcall; overload;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTransportRoute: ENTransportRoute); stdcall; overload;
    procedure save(const aENTransportRoute: ENTransportRoute; const isForTravelSheet: Boolean); stdcall; overload;
    function  getObject(const anObjectCode: Integer): ENTransportRoute; stdcall;
    function  getList: ENTransportRouteShortList; stdcall;
    function  getFilteredList(const aENTransportRouteFilter: ENTransportRouteFilter): ENTransportRouteShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTransportRouteShortList; stdcall;
    function  getScrollableFilteredList(const aENTransportRouteFilter: ENTransportRouteFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTransportRouteShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTransportRouteShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTransportRouteFilter: ENTransportRouteFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

    procedure saveRoute2TravelSheetItem(const aENTransportRoute: ENTransportRoute); stdcall;
  end; 


implementation

  destructor ENTransportRoute.Destroy;
  begin
    if Assigned(Fdistance) then
      distance.Free;
    if Assigned(Fweight) then
      weight.Free;
    if Assigned(FdistanceNew) then
      distanceNew.Free;
    if Assigned(FspeedometerStart) then
      speedometerStart.Free;
    if Assigned(FspeedometerFinal) then
      speedometerFinal.Free;
    if Assigned(FfuelCounterStart) then
      fuelCounterStart.Free;
    if Assigned(FfuelCounterFinal) then
      fuelCounterFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FelementInRef) then
      elementInRef.Free;
    if Assigned(FelementOutRef) then
      elementOutRef.Free;
    if Assigned(FdistanceRef) then
      distanceRef.Free;
    if Assigned(FdistanceTypeRef) then
      distanceTypeRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FparentRouteRef) then
      parentRouteRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENTransportRouteFilter.Destroy;
  begin
    if Assigned(Fdistance) then
      distance.Free;
    if Assigned(Fweight) then
      weight.Free;
    if Assigned(FdistanceNew) then
      distanceNew.Free;
    if Assigned(FspeedometerStart) then
      speedometerStart.Free;
    if Assigned(FspeedometerFinal) then
      speedometerFinal.Free;
    if Assigned(FfuelCounterStart) then
      fuelCounterStart.Free;
    if Assigned(FfuelCounterFinal) then
      fuelCounterFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FelementInRef) then
      elementInRef.Free;
    if Assigned(FelementOutRef) then
      elementOutRef.Free;
    if Assigned(FdistanceRef) then
      distanceRef.Free;
    if Assigned(FdistanceTypeRef) then
      distanceTypeRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FparentRouteRef) then
      parentRouteRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENTransportRouteFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENTransportRouteShort.Destroy;
  begin
    if Assigned(Fdistance) then
      distance.Free;
    if Assigned(Fweight) then
      weight.Free;
    if Assigned(FdistanceNew) then
      distanceNew.Free;
    if Assigned(FspeedometerStart) then
      speedometerStart.Free;
    if Assigned(FspeedometerFinal) then
      speedometerFinal.Free;
    if Assigned(FfuelCounterStart) then
      fuelCounterStart.Free;
    if Assigned(FfuelCounterFinal) then
      fuelCounterFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdistanceRefDistance) then
      distanceRefDistance.Free;
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
    if Assigned(FplanRefTotaltimehours) then
      planRefTotaltimehours.Free;
    if Assigned(FplanRefTotaltimedays) then
      planRefTotaltimedays.Free;
    if Assigned(FparentRouteRefDistance) then
      parentRouteRefDistance.Free;
    if Assigned(FparentRouteRefWeight) then
      parentRouteRefWeight.Free;
    if Assigned(FparentRouteRefDistanceNew) then
      parentRouteRefDistanceNew.Free;
    if Assigned(FparentRouteRefSpeedometerStart) then
      parentRouteRefSpeedometerStart.Free;
    if Assigned(FparentRouteRefSpeedometerFinal) then
      parentRouteRefSpeedometerFinal.Free;
    if Assigned(FparentRouteRefDateEdit) then
      parentRouteRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENTransportRouteShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTransportRoute, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRoute');
  RemClassRegistry.RegisterXSClass(ENTransportRouteRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRouteRef');
  RemClassRegistry.RegisterXSClass(ENTransportRouteFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRouteFilter');
  RemClassRegistry.RegisterXSClass(ENTransportRouteShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRouteShort');
  RemClassRegistry.RegisterXSClass(ENTransportRouteShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRouteShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTransportRouteShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTransportRouteShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTransportRouteControllerSoapPort), 'http://ksoe.org/ENTransportRouteController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTransportRouteControllerSoapPort), 'http://ksoe.org/ENTransportRouteController/action/ENTransportRouteController.%operationName%');


end.
