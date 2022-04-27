unit ENTravelSheetItemDistanceController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENTravelSheetItemController 
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

  ENTravelSheetItemDistance            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelSheetItemDistanceRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelSheetItemDistance = class(TRemotable)
  private
    Fcode : Integer; 
    Fdistance : TXSDecimal;
    FsumMachineHours : TXSDecimal;
    Fkoef : TXSDecimal;
//???
    FtravelSheetItemRef : ENTravelSheetItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property distance : TXSDecimal read Fdistance write Fdistance; 
    property sumMachineHours : TXSDecimal read FsumMachineHours write FsumMachineHours; 
    property koef : TXSDecimal read Fkoef write Fkoef; 
    property travelSheetItemRef : ENTravelSheetItemRef read FtravelSheetItemRef write FtravelSheetItemRef; 
  end;
  
{
  ENTravelSheetItemDistanceFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fdistance : TXSDecimal;
    FsumMachineHours : TXSDecimal;
    Fkoef : TXSDecimal;
//???
    FtravelSheetItemRef : ENTravelSheetItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property distance : TXSDecimal read Fdistance write Fdistance; 
    property sumMachineHours : TXSDecimal read FsumMachineHours write FsumMachineHours; 
    property koef : TXSDecimal read Fkoef write Fkoef; 
    property travelSheetItemRef : ENTravelSheetItemRef read FtravelSheetItemRef write FtravelSheetItemRef; 
  end;
}

  ENTravelSheetItemDistanceFilter = class(ENTravelSheetItemDistance)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTravelSheetItemDistanceShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fdistance : TXSDecimal;
    FsumMachineHours : TXSDecimal;
    Fkoef : TXSDecimal;
    FtravelSheetItemRefCode : Integer; 
    FtravelSheetItemRefTravelFrom : WideString;
    FtravelSheetItemRefTravelTo : WideString;
    FtravelSheetItemRefTimeStart : TXSDateTime;	
    FtravelSheetItemRefTimeFinal : TXSDateTime;	
    FtravelSheetItemRefSpeedometerStart : TXSDecimal;
    FtravelSheetItemRefSpeedometerFinal : TXSDecimal;
    FtravelSheetItemRefFuelCounterStart : TXSDecimal;
    FtravelSheetItemRefFuelCounterFinal : TXSDecimal;
    FtravelSheetItemRefSumDistances : TXSDecimal;
    FtravelSheetItemRefSumMachineHours : TXSDecimal;
    FtravelSheetItemRefDateEdit : TXSDateTime;	
    FtravelSheetItemRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property distance : TXSDecimal read Fdistance write Fdistance; 
    property sumMachineHours : TXSDecimal read FsumMachineHours write FsumMachineHours; 
    property koef : TXSDecimal read Fkoef write Fkoef; 

    property travelSheetItemRefCode : Integer read FtravelSheetItemRefCode write FtravelSheetItemRefCode; 
    property travelSheetItemRefTravelFrom : WideString read FtravelSheetItemRefTravelFrom write FtravelSheetItemRefTravelFrom; 
    property travelSheetItemRefTravelTo : WideString read FtravelSheetItemRefTravelTo write FtravelSheetItemRefTravelTo; 
    property travelSheetItemRefTimeStart : TXSDateTime read FtravelSheetItemRefTimeStart write FtravelSheetItemRefTimeStart; 
    property travelSheetItemRefTimeFinal : TXSDateTime read FtravelSheetItemRefTimeFinal write FtravelSheetItemRefTimeFinal; 
    property travelSheetItemRefSpeedometerStart : TXSDecimal read FtravelSheetItemRefSpeedometerStart write FtravelSheetItemRefSpeedometerStart; 
    property travelSheetItemRefSpeedometerFinal : TXSDecimal read FtravelSheetItemRefSpeedometerFinal write FtravelSheetItemRefSpeedometerFinal; 
    property travelSheetItemRefFuelCounterStart : TXSDecimal read FtravelSheetItemRefFuelCounterStart write FtravelSheetItemRefFuelCounterStart; 
    property travelSheetItemRefFuelCounterFinal : TXSDecimal read FtravelSheetItemRefFuelCounterFinal write FtravelSheetItemRefFuelCounterFinal; 
    property travelSheetItemRefSumDistances : TXSDecimal read FtravelSheetItemRefSumDistances write FtravelSheetItemRefSumDistances; 
    property travelSheetItemRefSumMachineHours : TXSDecimal read FtravelSheetItemRefSumMachineHours write FtravelSheetItemRefSumMachineHours; 
    property travelSheetItemRefDateEdit : TXSDateTime read FtravelSheetItemRefDateEdit write FtravelSheetItemRefDateEdit; 
    property travelSheetItemRefUserGen : WideString read FtravelSheetItemRefUserGen write FtravelSheetItemRefUserGen; 
  end;

  ArrayOfENTravelSheetItemDistanceShort = array of ENTravelSheetItemDistanceShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTravelSheetItemDistanceShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTravelSheetItemDistanceShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTravelSheetItemDistanceShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTravelSheetItemDistanceController/message/
  // soapAction: http://ksoe.org/ENTravelSheetItemDistanceController/action/ENTravelSheetItemDistanceController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTravelSheetItemDistanceControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTravelSheetItemDistanceController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTravelSheetItemDistanceControllerSoapPort = interface(IInvokable)
  ['{bdd2bdd2-bdd2-bdd2-bdd2-bdd2bdd2bdd2}']
    function  add(const aENTravelSheetItemDistance: ENTravelSheetItemDistance): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTravelSheetItemDistance: ENTravelSheetItemDistance); stdcall;
    function  getObject(const anObjectCode: Integer): ENTravelSheetItemDistance; stdcall;
    function  getList: ENTravelSheetItemDistanceShortList; stdcall;
    function  getFilteredList(const aENTravelSheetItemDistanceFilter: ENTravelSheetItemDistanceFilter): ENTravelSheetItemDistanceShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetItemDistanceShortList; stdcall;
    function  getScrollableFilteredList(const aENTravelSheetItemDistanceFilter: ENTravelSheetItemDistanceFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetItemDistanceShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetItemDistanceShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTravelSheetItemDistanceFilter: ENTravelSheetItemDistanceFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

    function  getAggregateSumOfKoefs(const anObjectCode: Integer): TXSDecimal; stdcall;
  end; 


implementation

  destructor ENTravelSheetItemDistance.Destroy;
  begin
    if Assigned(Fdistance) then
      distance.Free;
    if Assigned(FsumMachineHours) then
      sumMachineHours.Free;
    if Assigned(Fkoef) then
      koef.Free;
    if Assigned(FtravelSheetItemRef) then
      travelSheetItemRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENTravelSheetItemDistanceFilter.Destroy;
  begin
    if Assigned(Fdistance) then
      distance.Free;
    if Assigned(FsumMachineHours) then
      sumMachineHours.Free;
    if Assigned(Fkoef) then
      koef.Free;
    if Assigned(FtravelSheetItemRef) then
      travelSheetItemRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENTravelSheetItemDistanceFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENTravelSheetItemDistanceShort.Destroy;
  begin
    if Assigned(Fdistance) then
      distance.Free;
    if Assigned(FsumMachineHours) then
      sumMachineHours.Free;
    if Assigned(Fkoef) then
      koef.Free;
    if Assigned(FtravelSheetItemRefTimeStart) then
      travelSheetItemRefTimeStart.Free;
    if Assigned(FtravelSheetItemRefTimeFinal) then
      travelSheetItemRefTimeFinal.Free;
    if Assigned(FtravelSheetItemRefSpeedometerStart) then
      travelSheetItemRefSpeedometerStart.Free;
    if Assigned(FtravelSheetItemRefSpeedometerFinal) then
      travelSheetItemRefSpeedometerFinal.Free;
    if Assigned(FtravelSheetItemRefFuelCounterStart) then
      travelSheetItemRefFuelCounterStart.Free;
    if Assigned(FtravelSheetItemRefFuelCounterFinal) then
      travelSheetItemRefFuelCounterFinal.Free;
    if Assigned(FtravelSheetItemRefSumDistances) then
      travelSheetItemRefSumDistances.Free;
    if Assigned(FtravelSheetItemRefSumMachineHours) then
      travelSheetItemRefSumMachineHours.Free;
    if Assigned(FtravelSheetItemRefDateEdit) then
      travelSheetItemRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENTravelSheetItemDistanceShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTravelSheetItemDistance, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItemDistance');
  RemClassRegistry.RegisterXSClass(ENTravelSheetItemDistanceRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItemDistanceRef');
  RemClassRegistry.RegisterXSClass(ENTravelSheetItemDistanceFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItemDistanceFilter');
  RemClassRegistry.RegisterXSClass(ENTravelSheetItemDistanceShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItemDistanceShort');
  RemClassRegistry.RegisterXSClass(ENTravelSheetItemDistanceShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItemDistanceShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTravelSheetItemDistanceShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTravelSheetItemDistanceShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTravelSheetItemDistanceControllerSoapPort), 'http://ksoe.org/ENTravelSheetItemDistanceController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTravelSheetItemDistanceControllerSoapPort), 'http://ksoe.org/ENTravelSheetItemDistanceController/action/ENTravelSheetItemDistanceController.%operationName%');


end.
