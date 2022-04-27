unit ENTravelSheetController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENDepartmentController 
   ,TKTransportRealController 
   //,TKTransportRealController
   //,TKTransportRealController
   ,FINWorkerController 
   ,ENTravelWorkModeController 
   ,ENTravelSheetTypeController 
   ,ENTravelSheetStatusController
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

  ENTravelSheet            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelSheetRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelSheet = class(TRemotable)
  private
    Fcode : Integer; 
    FnumberGen : WideString;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FspeedometerStart : TXSDecimal;
    FspeedometerFinal : TXSDecimal;
    FfuelCounterStart : TXSDecimal;
    FfuelCounterFinal : TXSDecimal;
    FtimeStart : TXSDateTime;	
    FtimeFinal : TXSDateTime;
    FcommentGen : WideString;
    FdateEdit : TXSDateTime;	
    FuserGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
    FmachineHoursStopByGlobus : TXSDecimal;
    FisPrinted : Integer;
    FisMobiliztn : Integer;
//???
    Fdepartment : ENDepartment;
//???
    FtransportReal : TKTransportReal;
//???
    Ftrailer1 : TKTransportReal;
//???
    Ftrailer2 : TKTransportReal;
//???
    FfinWorker : FINWorker;
    FfinWorker_additional_1 : FINWorker;
    FfinWorker_additional_2 : FINWorker;
//???
    FworkModeRef : ENTravelWorkModeRef;
//???
    FtypeRef : ENTravelSheetTypeRef;
//???
    FstatusRef : ENTravelSheetStatusRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property speedometerStart : TXSDecimal read FspeedometerStart write FspeedometerStart; 
    property speedometerFinal : TXSDecimal read FspeedometerFinal write FspeedometerFinal; 
    property fuelCounterStart : TXSDecimal read FfuelCounterStart write FfuelCounterStart;
    property fuelCounterFinal : TXSDecimal read FfuelCounterFinal write FfuelCounterFinal;
    property timeStart : TXSDateTime read FtimeStart write FtimeStart;	
    property timeFinal : TXSDateTime read FtimeFinal write FtimeFinal;	
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	
    property userGen : WideString read FuserGen write FuserGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property machineHoursStopByGlobus : TXSDecimal read FmachineHoursStopByGlobus write FmachineHoursStopByGlobus; 
    property  isPrinted : Integer read FisPrinted write FisPrinted;
    property isMobiliztn : Integer read FisMobiliztn write FisMobiliztn;
    property department : ENDepartment read Fdepartment write Fdepartment; 
    property transportReal : TKTransportReal read FtransportReal write FtransportReal; 
    property trailer1 : TKTransportReal read Ftrailer1 write Ftrailer1; 
    property trailer2 : TKTransportReal read Ftrailer2 write Ftrailer2; 
    property finWorker : FINWorker read FfinWorker write FfinWorker;
    property finWorker_additional_1 : FINWorker read FfinWorker_additional_1 write FfinWorker_additional_1;
    property finWorker_additional_2 : FINWorker read FfinWorker_additional_2 write FfinWorker_additional_2;
    property workModeRef : ENTravelWorkModeRef read FworkModeRef write FworkModeRef;
    property typeRef : ENTravelSheetTypeRef read FtypeRef write FtypeRef; 
    property statusRef : ENTravelSheetStatusRef read FstatusRef write FstatusRef; 
  end;
  
{
  ENTravelSheetFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FnumberGen : WideString;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FspeedometerStart : TXSDecimal;
    FspeedometerFinal : TXSDecimal;
    FfuelCounterStart : TXSDecimal;
    FfuelCounterFinal : TXSDecimal;
    FtimeStart : DateTime; 
    FtimeFinal : DateTime;
    FcommentGen : WideString;
    FdateEdit : DateTime;
    FuserGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
    FmachineHoursStopByGlobus : TXSDecimal;
//???
    Fdepartment : ENDepartment;
//???
    FtransportReal : TKTransportReal;
//???
    Ftrailer1 : TKTransportReal;
//???
    Ftrailer2 : TKTransportReal;
//???
    FfinWorker : FINWorker;
//???
    FworkModeRef : ENTravelWorkModeRef;
//???
    FtypeRef : ENTravelSheetTypeRef;
//???
    FstatusRef : ENTravelSheetStatusRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property speedometerStart : TXSDecimal read FspeedometerStart write FspeedometerStart;
    property speedometerFinal : TXSDecimal read FspeedometerFinal write FspeedometerFinal;
    property fuelCounterStart : TXSDecimal read FfuelCounterStart write FfuelCounterStart;
    property fuelCounterFinal : TXSDecimal read FfuelCounterFinal write FfuelCounterFinal;
    property timeStart : DateTime;
    property timeFinal : DateTime;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateEdit : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property department : ENDepartment read Fdepartment write Fdepartment;
    property transportReal : TKTransportReal read FtransportReal write FtransportReal;
    property trailer1 : TKTransportReal read Ftrailer1 write Ftrailer1;
    property trailer2 : TKTransportReal read Ftrailer2 write Ftrailer2;
    property finWorker : FINWorker read FfinWorker write FfinWorker;
    property workModeRef : ENTravelWorkModeRef read FworkModeRef write FworkModeRef;
    property typeRef : ENTravelSheetTypeRef read FtypeRef write FtypeRef;
    property statusRef : ENTravelSheetStatusRef read FstatusRef write FstatusRef;
  end;
}

  ENTravelSheetFilter = class(ENTravelSheet)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENTravelSheetShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FspeedometerStart : TXSDecimal;
    FspeedometerFinal : TXSDecimal;
    FfuelCounterStart : TXSDecimal;
    FfuelCounterFinal : TXSDecimal;
    FtimeStart : TXSDateTime;
    FtimeFinal : TXSDateTime;
    FdateEdit : TXSDateTime;
    FuserGen : WideString;
    FmachineHoursStopByGlobus : TXSDecimal;
    FisPrinted : Integer;
    FdepartmentCode : Integer;
    FdepartmentShortName : WideString;
    FdepartmentDateStart : TXSDate;
    FdepartmentDateFinal : TXSDate;
    FtransportRealCode : Integer;
    FtransportRealName : WideString;
    FtransportRealInvNumber : WideString;
    FtransportRealGosNumber : WideString;
    Ftrailer1Code : Integer;
    Ftrailer1Name : WideString;
    Ftrailer1InvNumber : WideString;
    Ftrailer1GosNumber : WideString;
    Ftrailer2Code : Integer;
    Ftrailer2Name : WideString;
    Ftrailer2InvNumber : WideString;
    Ftrailer2GosNumber : WideString;
    FfinWorkerCode : Integer; 
    FfinWorkerName : WideString;
    FfinWorkerTabNumber : WideString;
    FfinWorkerPositionName : WideString;
    FfinWorkerPositionCode : Integer; 
    FfinWorkerDepartmentName : WideString;
    FfinWorkerDepartmentCode : WideString;
    FfinWorkerPriceGen : TXSDecimal;
    FfinWorkerCategor : Integer; 
    FfinWorkerFinCode : Integer; 
    FfinWorkerIsSentAssignment : Integer; 
    FworkModeRefCode : Integer; 
    FworkModeRefName : WideString;
    FtypeRefCode : Integer; 
    FtypeRefName : WideString;
    FstatusRefCode : Integer; 
    FstatusRefName : WideString;

  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property speedometerStart : TXSDecimal read FspeedometerStart write FspeedometerStart; 
    property speedometerFinal : TXSDecimal read FspeedometerFinal write FspeedometerFinal; 
    property fuelCounterStart : TXSDecimal read FfuelCounterStart write FfuelCounterStart; 
    property fuelCounterFinal : TXSDecimal read FfuelCounterFinal write FfuelCounterFinal; 
    property timeStart : TXSDateTime read FtimeStart write FtimeStart;	
    property timeFinal : TXSDateTime read FtimeFinal write FtimeFinal;	
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	
    property userGen : WideString read FuserGen write FuserGen;
    property  isPrinted : Integer read FisPrinted write FisPrinted;
    property machineHoursStopByGlobus : TXSDecimal read FmachineHoursStopByGlobus write FmachineHoursStopByGlobus; 

    property departmentCode : Integer read FdepartmentCode write FdepartmentCode; 
    property departmentShortName : WideString read FdepartmentShortName write FdepartmentShortName; 
    property departmentDateStart : TXSDate read FdepartmentDateStart write FdepartmentDateStart; 
    property departmentDateFinal : TXSDate read FdepartmentDateFinal write FdepartmentDateFinal; 
    property transportRealCode : Integer read FtransportRealCode write FtransportRealCode; 
    property transportRealName : WideString read FtransportRealName write FtransportRealName; 
    property transportRealInvNumber : WideString read FtransportRealInvNumber write FtransportRealInvNumber; 
    property transportRealGosNumber : WideString read FtransportRealGosNumber write FtransportRealGosNumber; 
    property trailer1Code : Integer read Ftrailer1Code write Ftrailer1Code; 
    property trailer1Name : WideString read Ftrailer1Name write Ftrailer1Name; 
    property trailer1InvNumber : WideString read Ftrailer1InvNumber write Ftrailer1InvNumber; 
    property trailer1GosNumber : WideString read Ftrailer1GosNumber write Ftrailer1GosNumber; 
    property trailer2Code : Integer read Ftrailer2Code write Ftrailer2Code; 
    property trailer2Name : WideString read Ftrailer2Name write Ftrailer2Name; 
    property trailer2InvNumber : WideString read Ftrailer2InvNumber write Ftrailer2InvNumber; 
    property trailer2GosNumber : WideString read Ftrailer2GosNumber write Ftrailer2GosNumber; 
    property finWorkerCode : Integer read FfinWorkerCode write FfinWorkerCode; 
    property finWorkerName : WideString read FfinWorkerName write FfinWorkerName; 
    property finWorkerTabNumber : WideString read FfinWorkerTabNumber write FfinWorkerTabNumber;
    property finWorkerPositionName : WideString read FfinWorkerPositionName write FfinWorkerPositionName; 
    property finWorkerPositionCode : Integer read FfinWorkerPositionCode write FfinWorkerPositionCode; 
    property finWorkerDepartmentName : WideString read FfinWorkerDepartmentName write FfinWorkerDepartmentName; 
    property finWorkerDepartmentCode : WideString read FfinWorkerDepartmentCode write FfinWorkerDepartmentCode; 
    property finWorkerPriceGen : TXSDecimal read FfinWorkerPriceGen write FfinWorkerPriceGen; 
    property finWorkerCategor : Integer read FfinWorkerCategor write FfinWorkerCategor; 
    property finWorkerFinCode : Integer read FfinWorkerFinCode write FfinWorkerFinCode; 
    property finWorkerIsSentAssignment : Integer read FfinWorkerIsSentAssignment write FfinWorkerIsSentAssignment; 
    property workModeRefCode : Integer read FworkModeRefCode write FworkModeRefCode; 
    property workModeRefName : WideString read FworkModeRefName write FworkModeRefName; 
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode; 
    property typeRefName : WideString read FtypeRefName write FtypeRefName; 
    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode; 
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
  end;

  ArrayOfENTravelSheetShort = array of ENTravelSheetShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTravelSheetShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTravelSheetShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTravelSheetShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTravelSheetController/message/
  // soapAction: http://ksoe.org/ENTravelSheetController/action/ENTravelSheetController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTravelSheetControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTravelSheetController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTravelSheetControllerSoapPort = interface(IInvokable)
  ['{61756175-6175-6175-6175-617561756175}']
    function  add(const aENTravelSheet: ENTravelSheet): Integer; stdcall;

    procedure  addItemsDetailed(const aENTravelSheetCode: Integer; const transportItemCodes : ArrayOfInteger ); stdcall;
    procedure  addItems(const travelSheetCode : Integer; const trArr : ArrayOfENTransportItemShort ); stdcall;

    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTravelSheet: ENTravelSheet); stdcall;
    function  getObject(const anObjectCode: Integer): ENTravelSheet; stdcall;
    function  getList: ENTravelSheetShortList; stdcall;
    function  getFilteredList(const aENTravelSheetFilter: ENTravelSheetFilter): ENTravelSheetShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetShortList; stdcall;
    function  getScrollableFilteredList(const aENTravelSheetFilter: ENTravelSheetFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTravelSheetFilter: ENTravelSheetFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

    procedure closePlan(const anObjectCode: Integer); stdcall;
    procedure unClosePlan(const anObjectCode: Integer); stdcall;

    procedure closeFact(const anObjectCode: Integer); stdcall;
    procedure unCloseFact(const anObjectCode: Integer); stdcall;

    procedure closeWritingOff(const anObjectCode: Integer); stdcall;
    procedure unCloseWritingOff(const anObjectCode: Integer); stdcall;

    procedure unCloseTravelSheet(const anObjectCode: Integer); stdcall;

    function  getNextSheet(const aENTravelSheet: ENTravelSheet): ENTravelSheet; stdcall;
    function  getPrevSheet(const aENTravelSheet: ENTravelSheet): ENTravelSheet; stdcall;
    function  getLastSheet(const aENTravelSheet: ENTravelSheet): ENTravelSheet; stdcall;

    function  getSpeedometerFinalByGlobus(const aENTravelSheet: ENTravelSheet): TXSDecimal; stdcall;
    function  getMachineHoursStopByGlobus(const aENTravelSheet: ENTravelSheet): TXSDecimal; stdcall;

    // времмено !!!
    procedure  addItemsNORecalc_(const travelSheetCode : Integer; const trArr : ArrayOfENTransportItemShort ); stdcall;
    procedure  getRecalcPrice(const trCode : Integer); stdcall;

    procedure setIsPrinted(const anObjectCode: Integer); stdcall;

    procedure createNewTravelSheetForTransportOnDuty(const transportRealCode: Integer); stdcall;

  end;


implementation

  destructor ENTravelSheet.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FspeedometerStart) then
      speedometerStart.Free;
    if Assigned(FspeedometerFinal) then
      speedometerFinal.Free;
    if Assigned(FfuelCounterStart) then
      fuelCounterStart.Free;
    if Assigned(FfuelCounterFinal) then
      fuelCounterFinal.Free;
    if Assigned(FtimeStart) then
      timeStart.Free;
    if Assigned(FtimeFinal) then
      timeFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FmachineHoursStopByGlobus) then
      machineHoursStopByGlobus.Free;
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(FtransportReal) then
      transportReal.Free;
    if Assigned(Ftrailer1) then
      trailer1.Free;
    if Assigned(Ftrailer2) then
      trailer2.Free;
    if Assigned(FfinWorker) then
      finWorker.Free;
    if Assigned(FworkModeRef) then
      workModeRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENTravelSheetFilter.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FspeedometerStart) then
      speedometerStart.Free;
    if Assigned(FspeedometerFinal) then
      speedometerFinal.Free;
    if Assigned(FfuelCounterStart) then
      fuelCounterStart.Free;
    if Assigned(FfuelCounterFinal) then
      fuelCounterFinal.Free;
    if Assigned(FtimeStart) then
      timeStart.Free;
    if Assigned(FtimeFinal) then
      timeFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FmachineHoursStopByGlobus) then
      machineHoursStopByGlobus.Free;
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(FtransportReal) then
      transportReal.Free;
    if Assigned(Ftrailer1) then
      trailer1.Free;
    if Assigned(Ftrailer2) then
      trailer2.Free;
    if Assigned(FfinWorker) then
      finWorker.Free;
    if Assigned(FworkModeRef) then
      workModeRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENTravelSheetFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENTravelSheetShort.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FspeedometerStart) then
      speedometerStart.Free;
    if Assigned(FspeedometerFinal) then
      speedometerFinal.Free;
    if Assigned(FfuelCounterStart) then
      fuelCounterStart.Free;
    if Assigned(FfuelCounterFinal) then
      fuelCounterFinal.Free;
    if Assigned(FtimeStart) then
      timeStart.Free;
    if Assigned(FtimeFinal) then
      timeFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FmachineHoursStopByGlobus) then
      machineHoursStopByGlobus.Free;
    if Assigned(FdepartmentDateStart) then
      departmentDateStart.Free;
    if Assigned(FdepartmentDateFinal) then
      departmentDateFinal.Free;
    if Assigned(FfinWorkerPriceGen) then
      finWorkerPriceGen.Free;
    inherited Destroy;
  end; 
  
  destructor ENTravelSheetShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTravelSheet, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheet');
  RemClassRegistry.RegisterXSClass(ENTravelSheetRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetRef');
  RemClassRegistry.RegisterXSClass(ENTravelSheetFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetFilter');
  RemClassRegistry.RegisterXSClass(ENTravelSheetShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetShort');
  RemClassRegistry.RegisterXSClass(ENTravelSheetShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTravelSheetShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTravelSheetShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTravelSheetControllerSoapPort), 'http://ksoe.org/ENTravelSheetController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTravelSheetControllerSoapPort), 'http://ksoe.org/ENTravelSheetController/action/ENTravelSheetController.%operationName%');


end.
