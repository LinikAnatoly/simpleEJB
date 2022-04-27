unit ENTravelSheetItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENTravelSheetController
   ,ENPlanWorkController
   ,ENTravelSheetItemKindController
   ,ENTravelSheetItemStatusController
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

  ENTravelSheetItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelSheetItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelSheetItem = class(TRemotable)
  private
    Fcode : Integer;
    FtravelFrom : WideString;
    FtravelTo : WideString;
    FtimeStart : TXSDateTime;
    FtimeFinal : TXSDateTime;
    FspeedometerStart : TXSDecimal;
    FspeedometerFinal : TXSDecimal;
    FfuelCounterStart : TXSDecimal;
    FfuelCounterFinal : TXSDecimal;
    FsumDistances : TXSDecimal;
    FsumMachineHours : TXSDecimal;
    FheatingTime : TXSDecimal;
    FcommentGen : WideString;
    FrashodProbeg : TXSDecimal;
    FrashodWork : TXSDecimal;
    FtransportKoef : TXSDecimal;
    FdistanceByGPS : TXSDecimal;
    FhoursByGPS : TXSDecimal;
    FhoursInMotionByGPS : TXSDecimal;
    FhoursStopWorkByGPS : TXSDecimal;
    FhoursStopOffByGPS : TXSDecimal;
    FtravelOrder : Integer;
    FdateEdit : TXSDateTime;
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    FparentItemRef : ENTravelSheetItemRef;
//???
    FtravelSheetRef : ENTravelSheetRef;
//???
    FplanRef : ENPlanWorkRef;
//???
    FkindRef : ENTravelSheetItemKindRef;
//???
    FstatusRef : ENTravelSheetItemStatusRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property travelFrom : WideString read FtravelFrom write FtravelFrom;
    property travelTo : WideString read FtravelTo write FtravelTo;
    property timeStart : TXSDateTime read FtimeStart write FtimeStart;
    property timeFinal : TXSDateTime read FtimeFinal write FtimeFinal;
    property speedometerStart : TXSDecimal read FspeedometerStart write FspeedometerStart;
    property speedometerFinal : TXSDecimal read FspeedometerFinal write FspeedometerFinal;
    property fuelCounterStart : TXSDecimal read FfuelCounterStart write FfuelCounterStart;
    property fuelCounterFinal : TXSDecimal read FfuelCounterFinal write FfuelCounterFinal;
    property sumDistances : TXSDecimal read FsumDistances write FsumDistances;
    property sumMachineHours : TXSDecimal read FsumMachineHours write FsumMachineHours;
    property heatingTime : TXSDecimal read FheatingTime write FheatingTime;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property rashodProbeg : TXSDecimal read FrashodProbeg write FrashodProbeg;
    property rashodWork : TXSDecimal read FrashodWork write FrashodWork;
    property transportKoef : TXSDecimal read FtransportKoef write FtransportKoef;
    property distanceByGPS : TXSDecimal read FdistanceByGPS write FdistanceByGPS;
    property hoursByGPS : TXSDecimal read FhoursByGPS write FhoursByGPS;
    property hoursInMotionByGPS : TXSDecimal read FhoursInMotionByGPS write FhoursInMotionByGPS;
    property hoursStopWorkByGPS : TXSDecimal read FhoursStopWorkByGPS write FhoursStopWorkByGPS;
    property hoursStopOffByGPS : TXSDecimal read FhoursStopOffByGPS write FhoursStopOffByGPS;
    property travelOrder : Integer read FtravelOrder write FtravelOrder;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property parentItemRef : ENTravelSheetItemRef read FparentItemRef write FparentItemRef;
    property travelSheetRef : ENTravelSheetRef read FtravelSheetRef write FtravelSheetRef;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
    property kindRef : ENTravelSheetItemKindRef read FkindRef write FkindRef;
    property statusRef : ENTravelSheetItemStatusRef read FstatusRef write FstatusRef;
  end;

{
  ENTravelSheetItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FtravelFrom : WideString;
    FtravelTo : WideString;
    FtimeStart : TXSDateTime;
    FtimeFinal : TXSDateTime;
    FspeedometerStart : TXSDecimal;
    FspeedometerFinal : TXSDecimal;
    FfuelCounterStart : TXSDecimal;
    FfuelCounterFinal : TXSDecimal;
    FsumDistances : TXSDecimal;
    FsumMachineHours : TXSDecimal;
    FheatingTime : TXSDecimal;
    FcommentGen : WideString;
    FrashodProbeg : TXSDecimal;
    FrashodWork : TXSDecimal;
    FtransportKoef : TXSDecimal;
    FdistanceByGPS : TXSDecimal;
    FhoursByGPS : TXSDecimal;
    FhoursInMotionByGPS : TXSDecimal;
    FhoursStopWorkByGPS : TXSDecimal;
    FhoursStopOffByGPS : TXSDecimal;
    FtravelOrder : Integer;
    FdateEdit : TXSDateTime;
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    FparentItemRef : ENTravelSheetItemRef;
//???
    FtravelSheetRef : ENTravelSheetRef;
//???
    FplanRef : ENPlanWorkRef;
//???
    FkindRef : ENTravelSheetItemKindRef;
//???
    FstatusRef : ENTravelSheetItemStatusRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property travelFrom : WideString read FtravelFrom write FtravelFrom;
    property travelTo : WideString read FtravelTo write FtravelTo;
    property timeStart : TXSDateTime read FtimeStart write FtimeStart;
    property timeFinal : TXSDateTime read FtimeFinal write FtimeFinal;
    property speedometerStart : TXSDecimal read FspeedometerStart write FspeedometerStart;
    property speedometerFinal : TXSDecimal read FspeedometerFinal write FspeedometerFinal;
    property fuelCounterStart : TXSDecimal read FfuelCounterStart write FfuelCounterStart;
    property fuelCounterFinal : TXSDecimal read FfuelCounterFinal write FfuelCounterFinal;
    property sumDistances : TXSDecimal read FsumDistances write FsumDistances;
    property sumMachineHours : TXSDecimal read FsumMachineHours write FsumMachineHours;
    property heatingTime : TXSDecimal read FheatingTime write FheatingTime;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property rashodProbeg : TXSDecimal read FrashodProbeg write FrashodProbeg;
    property rashodWork : TXSDecimal read FrashodWork write FrashodWork;
    property transportKoef : TXSDecimal read FtransportKoef write FtransportKoef;
    property distanceByGPS : TXSDecimal read FdistanceByGPS write FdistanceByGPS;
    property hoursByGPS : TXSDecimal read FhoursByGPS write FhoursByGPS;
    property hoursInMotionByGPS : TXSDecimal read FhoursInMotionByGPS write FhoursInMotionByGPS;
    property hoursStopWorkByGPS : TXSDecimal read FhoursStopWorkByGPS write FhoursStopWorkByGPS;
    property hoursStopOffByGPS : TXSDecimal read FhoursStopOffByGPS write FhoursStopOffByGPS;
    property travelOrder : Integer read FtravelOrder write FtravelOrder;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property parentItemRef : ENTravelSheetItemRef read FparentItemRef write FparentItemRef;
    property travelSheetRef : ENTravelSheetRef read FtravelSheetRef write FtravelSheetRef;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
    property kindRef : ENTravelSheetItemKindRef read FkindRef write FkindRef;
    property statusRef : ENTravelSheetItemStatusRef read FstatusRef write FstatusRef;
  end;
}

  ENTravelSheetItemFilter = class(ENTravelSheetItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENTravelSheetItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FtravelFrom : WideString;
    FtravelTo : WideString;
    FtimeStart : TXSDateTime;
    FtimeFinal : TXSDateTime;
    FspeedometerStart : TXSDecimal;
    FspeedometerFinal : TXSDecimal;
    FfuelCounterStart : TXSDecimal;
    FfuelCounterFinal : TXSDecimal;
    FsumDistances : TXSDecimal;
    FsumMachineHours : TXSDecimal;
    FheatingTime : TXSDecimal;
    FrashodProbeg : TXSDecimal;
    FrashodWork : TXSDecimal;
    FtransportKoef : TXSDecimal;
    FdistanceByGPS : TXSDecimal;
    FhoursByGPS : TXSDecimal;
    FhoursInMotionByGPS : TXSDecimal;
    FhoursStopWorkByGPS : TXSDecimal;
    FhoursStopOffByGPS : TXSDecimal;
    FtravelOrder : Integer;
    FdateEdit : TXSDateTime;
    FuserGen : WideString;
    FparentItemRefCode : Integer;
    FparentItemRefTravelFrom : WideString;
    FparentItemRefTravelTo : WideString;
    FparentItemRefTimeStart : TXSDateTime;
    FparentItemRefTimeFinal : TXSDateTime;
    FparentItemRefSpeedometerStart : TXSDecimal;
    FparentItemRefSpeedometerFinal : TXSDecimal;
    FparentItemRefFuelCounterStart : TXSDecimal;
    FparentItemRefFuelCounterFinal : TXSDecimal;
    FparentItemRefSumDistances : TXSDecimal;
    FparentItemRefSumMachineHours : TXSDecimal;
    FparentItemRefHeatingTime : TXSDecimal;
    FparentItemRefRashodProbeg : TXSDecimal;
    FparentItemRefRashodWork : TXSDecimal;
    FparentItemRefTransportKoef : TXSDecimal;
    FparentItemRefDistanceByGPS : TXSDecimal;
    FparentItemRefHoursByGPS : TXSDecimal;
    FparentItemRefHoursInMotionByGPS : TXSDecimal;
    FparentItemRefHoursStopWorkByGPS : TXSDecimal;
    FparentItemRefHoursStopOffByGPS : TXSDecimal;
    FparentItemRefTravelOrder : Integer;
    FparentItemRefDateEdit : TXSDateTime;
    FparentItemRefUserGen : WideString;
    FtravelSheetRefCode : Integer;
    FtravelSheetRefNumberGen : WideString;
    FtravelSheetRefDateStart : TXSDate;
    FtravelSheetRefDateFinal : TXSDate;
    FtravelSheetRefSpeedometerStart : TXSDecimal;
    FtravelSheetRefSpeedometerFinal : TXSDecimal;
    FtravelSheetRefFuelCounterStart : TXSDecimal;
    FtravelSheetRefFuelCounterFinal : TXSDecimal;
    FtravelSheetRefTimeStart : TXSDateTime;
    FtravelSheetRefTimeFinal : TXSDateTime;
    FtravelSheetRefDateEdit : TXSDateTime;
    FtravelSheetRefUserGen : WideString;
    FplanRefCode : Integer;
    FplanRefDateGen : TXSDateTime;
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
    FplanRefDateEndPriConnection : TXSDate;
    FplanRefInvestWorksDescription : WideString;
    FplanRefServicesFSideFinId : Integer;
    FplanRefServicesFSideCnNum : WideString;
    FplanRefTotalTimeHours : TXSDecimal;
    FplanRefTotalTimeDays : TXSDecimal;
    FplanRefInvestItemNumber : WideString;
    FkindRefCode : Integer;
    FkindRefName : WideString;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;
    ///////////////////////////////////
    FworkOrderNumber : WideString;
    FestimateCount :  TXSDecimal;
    FfinmaterialsCount : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property travelFrom : WideString read FtravelFrom write FtravelFrom;
    property travelTo : WideString read FtravelTo write FtravelTo;
    property timeStart : TXSDateTime read FtimeStart write FtimeStart;
    property timeFinal : TXSDateTime read FtimeFinal write FtimeFinal;
    property speedometerStart : TXSDecimal read FspeedometerStart write FspeedometerStart;
    property speedometerFinal : TXSDecimal read FspeedometerFinal write FspeedometerFinal;
    property fuelCounterStart : TXSDecimal read FfuelCounterStart write FfuelCounterStart;
    property fuelCounterFinal : TXSDecimal read FfuelCounterFinal write FfuelCounterFinal;
    property sumDistances : TXSDecimal read FsumDistances write FsumDistances;
    property sumMachineHours : TXSDecimal read FsumMachineHours write FsumMachineHours;
    property heatingTime : TXSDecimal read FheatingTime write FheatingTime;
    property rashodProbeg : TXSDecimal read FrashodProbeg write FrashodProbeg;
    property rashodWork : TXSDecimal read FrashodWork write FrashodWork;
    property transportKoef : TXSDecimal read FtransportKoef write FtransportKoef;
    property distanceByGPS : TXSDecimal read FdistanceByGPS write FdistanceByGPS;
    property hoursByGPS : TXSDecimal read FhoursByGPS write FhoursByGPS;
    property hoursInMotionByGPS : TXSDecimal read FhoursInMotionByGPS write FhoursInMotionByGPS;
    property hoursStopWorkByGPS : TXSDecimal read FhoursStopWorkByGPS write FhoursStopWorkByGPS;
    property hoursStopOffByGPS : TXSDecimal read FhoursStopOffByGPS write FhoursStopOffByGPS;
    property  travelOrder : Integer read FtravelOrder write FtravelOrder;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property userGen : WideString read FuserGen write FuserGen;

    property parentItemRefCode : Integer read FparentItemRefCode write FparentItemRefCode;
    property parentItemRefTravelFrom : WideString read FparentItemRefTravelFrom write FparentItemRefTravelFrom;
    property parentItemRefTravelTo : WideString read FparentItemRefTravelTo write FparentItemRefTravelTo;
    property parentItemRefTimeStart : TXSDateTime read FparentItemRefTimeStart write FparentItemRefTimeStart;
    property parentItemRefTimeFinal : TXSDateTime read FparentItemRefTimeFinal write FparentItemRefTimeFinal;
    property parentItemRefSpeedometerStart : TXSDecimal read FparentItemRefSpeedometerStart write FparentItemRefSpeedometerStart;
    property parentItemRefSpeedometerFinal : TXSDecimal read FparentItemRefSpeedometerFinal write FparentItemRefSpeedometerFinal;
    property parentItemRefFuelCounterStart : TXSDecimal read FparentItemRefFuelCounterStart write FparentItemRefFuelCounterStart;
    property parentItemRefFuelCounterFinal : TXSDecimal read FparentItemRefFuelCounterFinal write FparentItemRefFuelCounterFinal;
    property parentItemRefSumDistances : TXSDecimal read FparentItemRefSumDistances write FparentItemRefSumDistances;
    property parentItemRefSumMachineHours : TXSDecimal read FparentItemRefSumMachineHours write FparentItemRefSumMachineHours;
    property parentItemRefHeatingTime : TXSDecimal read FparentItemRefHeatingTime write FparentItemRefHeatingTime;
    property parentItemRefRashodProbeg : TXSDecimal read FparentItemRefRashodProbeg write FparentItemRefRashodProbeg;
    property parentItemRefRashodWork : TXSDecimal read FparentItemRefRashodWork write FparentItemRefRashodWork;
    property parentItemRefTransportKoef : TXSDecimal read FparentItemRefTransportKoef write FparentItemRefTransportKoef;
    property parentItemRefDistanceByGPS : TXSDecimal read FparentItemRefDistanceByGPS write FparentItemRefDistanceByGPS;
    property parentItemRefHoursByGPS : TXSDecimal read FparentItemRefHoursByGPS write FparentItemRefHoursByGPS;
    property parentItemRefHoursInMotionByGPS : TXSDecimal read FparentItemRefHoursInMotionByGPS write FparentItemRefHoursInMotionByGPS;
    property parentItemRefHoursStopWorkByGPS : TXSDecimal read FparentItemRefHoursStopWorkByGPS write FparentItemRefHoursStopWorkByGPS;
    property parentItemRefHoursStopOffByGPS : TXSDecimal read FparentItemRefHoursStopOffByGPS write FparentItemRefHoursStopOffByGPS;
    property parentItemRefTravelOrder : Integer read FparentItemRefTravelOrder write FparentItemRefTravelOrder;
    property parentItemRefDateEdit : TXSDateTime read FparentItemRefDateEdit write FparentItemRefDateEdit;
    property parentItemRefUserGen : WideString read FparentItemRefUserGen write FparentItemRefUserGen;
    property travelSheetRefCode : Integer read FtravelSheetRefCode write FtravelSheetRefCode;
    property travelSheetRefNumberGen : WideString read FtravelSheetRefNumberGen write FtravelSheetRefNumberGen;
    property travelSheetRefDateStart : TXSDate read FtravelSheetRefDateStart write FtravelSheetRefDateStart;
    property travelSheetRefDateFinal : TXSDate read FtravelSheetRefDateFinal write FtravelSheetRefDateFinal;
    property travelSheetRefSpeedometerStart : TXSDecimal read FtravelSheetRefSpeedometerStart write FtravelSheetRefSpeedometerStart;
    property travelSheetRefSpeedometerFinal : TXSDecimal read FtravelSheetRefSpeedometerFinal write FtravelSheetRefSpeedometerFinal;
    property travelSheetRefFuelCounterStart : TXSDecimal read FtravelSheetRefFuelCounterStart write FtravelSheetRefFuelCounterStart;
    property travelSheetRefFuelCounterFinal : TXSDecimal read FtravelSheetRefFuelCounterFinal write FtravelSheetRefFuelCounterFinal;
    property travelSheetRefTimeStart : TXSDateTime read FtravelSheetRefTimeStart write FtravelSheetRefTimeStart;
    property travelSheetRefTimeFinal : TXSDateTime read FtravelSheetRefTimeFinal write FtravelSheetRefTimeFinal;
    property travelSheetRefDateEdit : TXSDateTime read FtravelSheetRefDateEdit write FtravelSheetRefDateEdit;
    property travelSheetRefUserGen : WideString read FtravelSheetRefUserGen write FtravelSheetRefUserGen;
    property planRefCode : Integer read FplanRefCode write FplanRefCode;
    property planRefDateGen : TXSDateTime read FplanRefDateGen write FplanRefDateGen;
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
    property planRefDateEndPriConnection : TXSDate read FplanRefDateEndPriConnection write FplanRefDateEndPriConnection;
    property planRefInvestWorksDescription : WideString read FplanRefInvestWorksDescription write FplanRefInvestWorksDescription;
    property planRefServicesFSideFinId : Integer read FplanRefServicesFSideFinId write FplanRefServicesFSideFinId;
    property planRefServicesFSideCnNum : WideString read FplanRefServicesFSideCnNum write FplanRefServicesFSideCnNum;
    property planRefTotalTimeHours : TXSDecimal read FplanRefTotalTimeHours write FplanRefTotalTimeHours;
    property planRefTotalTimeDays : TXSDecimal read FplanRefTotalTimeDays write FplanRefTotalTimeDays;
    property planRefInvestItemNumber : WideString read FplanRefInvestItemNumber write FplanRefInvestItemNumber;
    property kindRefCode : Integer read FkindRefCode write FkindRefCode;
    property kindRefName : WideString read FkindRefName write FkindRefName;
    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
    //////////////////////////
    property workOrderNumber : WideString read FworkOrderNumber write FworkOrderNumber;
    property estimateCount : TXSDecimal read FestimateCount write FestimateCount;
    property finmaterialsCount : TXSDecimal read FfinmaterialsCount write FfinmaterialsCount;

  end;

  ArrayOfENTravelSheetItemShort = array of ENTravelSheetItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTravelSheetItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTravelSheetItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTravelSheetItemShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTravelSheetItemController/message/
  // soapAction: http://ksoe.org/ENTravelSheetItemController/action/ENTravelSheetItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTravelSheetItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTravelSheetItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTravelSheetItemControllerSoapPort = interface(IInvokable)
  ['{BF66BC6D-395E-41AD-A84A-25B464BDDC15}']
    function add(const aENTravelSheetItem: ENTravelSheetItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTravelSheetItem: ENTravelSheetItem); stdcall;
    function getObject(const anObjectCode: Integer): ENTravelSheetItem; stdcall;
    function getList: ENTravelSheetItemShortList; stdcall;
    function getFilteredList(const aENTravelSheetItemFilter: ENTravelSheetItemFilter): ENTravelSheetItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetItemShortList; stdcall;
    function getScrollableFilteredList(const aENTravelSheetItemFilter: ENTravelSheetItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENTravelSheetItemFilter: ENTravelSheetItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENTravelSheetItemShort; stdcall;
    procedure removeByTransportCodes(const itemCode: Integer; const trCodes : ArrayOfInteger); stdcall;

    function  getListForFact(const travelSheetCode: Integer): ENTravelSheetItemShortList; stdcall;
    function  getGlobusData(const aENTravelSheetItem: ENTravelSheetItem): ENTravelSheetItemShort; stdcall;
    procedure setOrder(const travelSheetCode: Integer); stdcall;
    procedure changeOrder(const travelSheetItemCode: Integer; const orderCode : Integer); stdcall;
    function  getContiguosItem(const travelSheetItemCode: Integer; const orderCode : Integer): ENTravelSheetItem; stdcall;
  end;


implementation

  destructor ENTravelSheetItem.Destroy;
  begin
    if Assigned(FtimeStart) then
      timeStart.Free;
    if Assigned(FtimeFinal) then
      timeFinal.Free;
    if Assigned(FspeedometerStart) then
      speedometerStart.Free;
    if Assigned(FspeedometerFinal) then
      speedometerFinal.Free;
    if Assigned(FfuelCounterStart) then
      fuelCounterStart.Free;
    if Assigned(FfuelCounterFinal) then
      fuelCounterFinal.Free;
    if Assigned(FsumDistances) then
      sumDistances.Free;
    if Assigned(FsumMachineHours) then
      sumMachineHours.Free;
    if Assigned(FheatingTime) then
      heatingTime.Free;
    if Assigned(FrashodProbeg) then
      rashodProbeg.Free;
    if Assigned(FrashodWork) then
      rashodWork.Free;
    if Assigned(FtransportKoef) then
      transportKoef.Free;
    if Assigned(FdistanceByGPS) then
      distanceByGPS.Free;
    if Assigned(FhoursByGPS) then
      hoursByGPS.Free;
    if Assigned(FhoursInMotionByGPS) then
      hoursInMotionByGPS.Free;
    if Assigned(FhoursStopWorkByGPS) then
      hoursStopWorkByGPS.Free;
    if Assigned(FhoursStopOffByGPS) then
      hoursStopOffByGPS.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FparentItemRef) then
      parentItemRef.Free;
    if Assigned(FtravelSheetRef) then
      travelSheetRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FkindRef) then
      kindRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end;

{
  destructor ENTravelSheetItemFilter.Destroy;
  begin
    if Assigned(FtimeStart) then
      timeStart.Free;
    if Assigned(FtimeFinal) then
      timeFinal.Free;
    if Assigned(FspeedometerStart) then
      speedometerStart.Free;
    if Assigned(FspeedometerFinal) then
      speedometerFinal.Free;
    if Assigned(FfuelCounterStart) then
      fuelCounterStart.Free;
    if Assigned(FfuelCounterFinal) then
      fuelCounterFinal.Free;
    if Assigned(FsumDistances) then
      sumDistances.Free;
    if Assigned(FsumMachineHours) then
      sumMachineHours.Free;
    if Assigned(FheatingTime) then
      heatingTime.Free;
    if Assigned(FrashodProbeg) then
      rashodProbeg.Free;
    if Assigned(FrashodWork) then
      rashodWork.Free;
    if Assigned(FtransportKoef) then
      transportKoef.Free;
    if Assigned(FdistanceByGPS) then
      distanceByGPS.Free;
    if Assigned(FhoursByGPS) then
      hoursByGPS.Free;
    if Assigned(FhoursInMotionByGPS) then
      hoursInMotionByGPS.Free;
    if Assigned(FhoursStopWorkByGPS) then
      hoursStopWorkByGPS.Free;
    if Assigned(FhoursStopOffByGPS) then
      hoursStopOffByGPS.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FparentItemRef) then
      parentItemRef.Free;
    if Assigned(FtravelSheetRef) then
      travelSheetRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FkindRef) then
      kindRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end;
}

  destructor ENTravelSheetItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENTravelSheetItemShort.Destroy;
  begin
    if Assigned(FtimeStart) then
      timeStart.Free;
    if Assigned(FtimeFinal) then
      timeFinal.Free;
    if Assigned(FspeedometerStart) then
      speedometerStart.Free;
    if Assigned(FspeedometerFinal) then
      speedometerFinal.Free;
    if Assigned(FfuelCounterStart) then
      fuelCounterStart.Free;
    if Assigned(FfuelCounterFinal) then
      fuelCounterFinal.Free;
    if Assigned(FsumDistances) then
      sumDistances.Free;
    if Assigned(FsumMachineHours) then
      sumMachineHours.Free;
    if Assigned(FheatingTime) then
      heatingTime.Free;
    if Assigned(FrashodProbeg) then
      rashodProbeg.Free;
    if Assigned(FrashodWork) then
      rashodWork.Free;
    if Assigned(FtransportKoef) then
      transportKoef.Free;
    if Assigned(FdistanceByGPS) then
      distanceByGPS.Free;
    if Assigned(FhoursByGPS) then
      hoursByGPS.Free;
    if Assigned(FhoursInMotionByGPS) then
      hoursInMotionByGPS.Free;
    if Assigned(FhoursStopWorkByGPS) then
      hoursStopWorkByGPS.Free;
    if Assigned(FhoursStopOffByGPS) then
      hoursStopOffByGPS.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FparentItemRefTimeStart) then
      parentItemRefTimeStart.Free;
    if Assigned(FparentItemRefTimeFinal) then
      parentItemRefTimeFinal.Free;
    if Assigned(FparentItemRefSpeedometerStart) then
      parentItemRefSpeedometerStart.Free;
    if Assigned(FparentItemRefSpeedometerFinal) then
      parentItemRefSpeedometerFinal.Free;
    if Assigned(FparentItemRefFuelCounterStart) then
      parentItemRefFuelCounterStart.Free;
    if Assigned(FparentItemRefFuelCounterFinal) then
      parentItemRefFuelCounterFinal.Free;
    if Assigned(FparentItemRefSumDistances) then
      parentItemRefSumDistances.Free;
    if Assigned(FparentItemRefSumMachineHours) then
      parentItemRefSumMachineHours.Free;
    if Assigned(FparentItemRefHeatingTime) then
      parentItemRefHeatingTime.Free;
    if Assigned(FparentItemRefRashodProbeg) then
      parentItemRefRashodProbeg.Free;
    if Assigned(FparentItemRefRashodWork) then
      parentItemRefRashodWork.Free;
    if Assigned(FparentItemRefTransportKoef) then
      parentItemRefTransportKoef.Free;
    if Assigned(FparentItemRefDistanceByGPS) then
      parentItemRefDistanceByGPS.Free;
    if Assigned(FparentItemRefHoursByGPS) then
      parentItemRefHoursByGPS.Free;
    if Assigned(FparentItemRefHoursInMotionByGPS) then
      parentItemRefHoursInMotionByGPS.Free;
    if Assigned(FparentItemRefHoursStopWorkByGPS) then
      parentItemRefHoursStopWorkByGPS.Free;
    if Assigned(FparentItemRefHoursStopOffByGPS) then
      parentItemRefHoursStopOffByGPS.Free;
    if Assigned(FparentItemRefDateEdit) then
      parentItemRefDateEdit.Free;
    if Assigned(FtravelSheetRefDateStart) then
      travelSheetRefDateStart.Free;
    if Assigned(FtravelSheetRefDateFinal) then
      travelSheetRefDateFinal.Free;
    if Assigned(FtravelSheetRefSpeedometerStart) then
      travelSheetRefSpeedometerStart.Free;
    if Assigned(FtravelSheetRefSpeedometerFinal) then
      travelSheetRefSpeedometerFinal.Free;
    if Assigned(FtravelSheetRefFuelCounterStart) then
      travelSheetRefFuelCounterStart.Free;
    if Assigned(FtravelSheetRefFuelCounterFinal) then
      travelSheetRefFuelCounterFinal.Free;
    if Assigned(FtravelSheetRefTimeStart) then
      travelSheetRefTimeStart.Free;
    if Assigned(FtravelSheetRefTimeFinal) then
      travelSheetRefTimeFinal.Free;
    if Assigned(FtravelSheetRefDateEdit) then
      travelSheetRefDateEdit.Free;
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
    if Assigned(FplanRefDateEndPriConnection) then
      planRefDateEndPriConnection.Free;
    if Assigned(FplanRefTotalTimeHours) then
      planRefTotalTimeHours.Free;
    if Assigned(FplanRefTotalTimeDays) then
      planRefTotalTimeDays.Free;
    inherited Destroy;
  end;

  destructor ENTravelSheetItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTravelSheetItem, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItem');
  RemClassRegistry.RegisterXSClass(ENTravelSheetItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItemRef');
  RemClassRegistry.RegisterXSClass(ENTravelSheetItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItemFilter');
  RemClassRegistry.RegisterXSClass(ENTravelSheetItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItemShort');
  RemClassRegistry.RegisterXSClass(ENTravelSheetItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTravelSheetItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTravelSheetItemShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTravelSheetItemControllerSoapPort), 'http://ksoe.org/ENTravelSheetItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTravelSheetItemControllerSoapPort), 'http://ksoe.org/ENTravelSheetItemController/action/ENTravelSheetItemController.%operationName%');


end.
