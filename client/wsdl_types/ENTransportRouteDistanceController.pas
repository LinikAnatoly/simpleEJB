unit ENTransportRouteDistanceController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENTransportRouteController 
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

  ENTransportRouteDistance            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportRouteDistanceRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportRouteDistance = class(TRemotable)
  private
    Fcode : Integer; 
    Fdistance : TXSDecimal;
    Fkoef : TXSDecimal;
//???
    FtransportRouteRef : ENTransportRouteRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property distance : TXSDecimal read Fdistance write Fdistance; 
    property koef : TXSDecimal read Fkoef write Fkoef; 
    property transportRouteRef : ENTransportRouteRef read FtransportRouteRef write FtransportRouteRef; 
  end;
  
{
  ENTransportRouteDistanceFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fdistance : TXSDecimal;
    Fkoef : TXSDecimal;
//???
    FtransportRouteRef : ENTransportRouteRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property distance : TXSDecimal read Fdistance write Fdistance; 
    property koef : TXSDecimal read Fkoef write Fkoef; 
    property transportRouteRef : ENTransportRouteRef read FtransportRouteRef write FtransportRouteRef; 
  end;
}

  ENTransportRouteDistanceFilter = class(ENTransportRouteDistance)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTransportRouteDistanceShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fdistance : TXSDecimal;
    Fkoef : TXSDecimal;
    FtransportRouteRefCode : Integer; 
    FtransportRouteRefDistance : TXSDecimal;
    FtransportRouteRefWeight : TXSDecimal;
    FtransportRouteRefDistanceNew : TXSDecimal;
    FtransportRouteRefSpeedometerStart : TXSDecimal;
    FtransportRouteRefSpeedometerFinal : TXSDecimal;
    FtransportRouteRefFuelCounterStart : TXSDecimal;
    FtransportRouteRefFuelCounterFinal : TXSDecimal;
    FtransportRouteRefDateEdit : TXSDateTime;	
    FtransportRouteRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property distance : TXSDecimal read Fdistance write Fdistance; 
    property koef : TXSDecimal read Fkoef write Fkoef; 

    property transportRouteRefCode : Integer read FtransportRouteRefCode write FtransportRouteRefCode; 
    property transportRouteRefDistance : TXSDecimal read FtransportRouteRefDistance write FtransportRouteRefDistance; 
    property transportRouteRefWeight : TXSDecimal read FtransportRouteRefWeight write FtransportRouteRefWeight; 
    property transportRouteRefDistanceNew : TXSDecimal read FtransportRouteRefDistanceNew write FtransportRouteRefDistanceNew; 
    property transportRouteRefSpeedometerStart : TXSDecimal read FtransportRouteRefSpeedometerStart write FtransportRouteRefSpeedometerStart; 
    property transportRouteRefSpeedometerFinal : TXSDecimal read FtransportRouteRefSpeedometerFinal write FtransportRouteRefSpeedometerFinal; 
    property transportRouteRefFuelCounterStart : TXSDecimal read FtransportRouteRefFuelCounterStart write FtransportRouteRefFuelCounterStart; 
    property transportRouteRefFuelCounterFinal : TXSDecimal read FtransportRouteRefFuelCounterFinal write FtransportRouteRefFuelCounterFinal; 
    property transportRouteRefDateEdit : TXSDateTime read FtransportRouteRefDateEdit write FtransportRouteRefDateEdit; 
    property transportRouteRefUserGen : WideString read FtransportRouteRefUserGen write FtransportRouteRefUserGen; 
  end;

  ArrayOfENTransportRouteDistanceShort = array of ENTransportRouteDistanceShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTransportRouteDistanceShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTransportRouteDistanceShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTransportRouteDistanceShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTransportRouteDistanceController/message/
  // soapAction: http://ksoe.org/ENTransportRouteDistanceController/action/ENTransportRouteDistanceController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTransportRouteDistanceControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTransportRouteDistanceController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTransportRouteDistanceControllerSoapPort = interface(IInvokable)
  ['{14c514c5-14c5-14c5-14c5-14c514c514c5}']
    function  add(const aENTransportRouteDistance: ENTransportRouteDistance): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTransportRouteDistance: ENTransportRouteDistance); stdcall;
    function  getObject(const anObjectCode: Integer): ENTransportRouteDistance; stdcall;
    function  getList: ENTransportRouteDistanceShortList; stdcall;
    function  getFilteredList(const aENTransportRouteDistanceFilter: ENTransportRouteDistanceFilter): ENTransportRouteDistanceShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTransportRouteDistanceShortList; stdcall;
    function  getScrollableFilteredList(const aENTransportRouteDistanceFilter: ENTransportRouteDistanceFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTransportRouteDistanceShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTransportRouteDistanceShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTransportRouteDistanceFilter: ENTransportRouteDistanceFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

    function  getAggregateSumOfKoefs(const anObjectCode: Integer): TXSDecimal; stdcall;
  end; 


implementation

  destructor ENTransportRouteDistance.Destroy;
  begin
    if Assigned(Fdistance) then
      distance.Free;
    if Assigned(Fkoef) then
      koef.Free;
    if Assigned(FtransportRouteRef) then
      transportRouteRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENTransportRouteDistanceFilter.Destroy;
  begin
    if Assigned(Fdistance) then
      distance.Free;
    if Assigned(Fkoef) then
      koef.Free;
    if Assigned(FtransportRouteRef) then
      transportRouteRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENTransportRouteDistanceFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENTransportRouteDistanceShort.Destroy;
  begin
    if Assigned(Fdistance) then
      distance.Free;
    if Assigned(Fkoef) then
      koef.Free;
    if Assigned(FtransportRouteRefDistance) then
      transportRouteRefDistance.Free;
    if Assigned(FtransportRouteRefWeight) then
      transportRouteRefWeight.Free;
    if Assigned(FtransportRouteRefDistanceNew) then
      transportRouteRefDistanceNew.Free;
    if Assigned(FtransportRouteRefSpeedometerStart) then
      transportRouteRefSpeedometerStart.Free;
    if Assigned(FtransportRouteRefSpeedometerFinal) then
      transportRouteRefSpeedometerFinal.Free;
    if Assigned(FtransportRouteRefFuelCounterStart) then
      transportRouteRefFuelCounterStart.Free;
    if Assigned(FtransportRouteRefFuelCounterFinal) then
      transportRouteRefFuelCounterFinal.Free;
    if Assigned(FtransportRouteRefDateEdit) then
      transportRouteRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENTransportRouteDistanceShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTransportRouteDistance, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRouteDistance');
  RemClassRegistry.RegisterXSClass(ENTransportRouteDistanceRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRouteDistanceRef');
  RemClassRegistry.RegisterXSClass(ENTransportRouteDistanceFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRouteDistanceFilter');
  RemClassRegistry.RegisterXSClass(ENTransportRouteDistanceShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRouteDistanceShort');
  RemClassRegistry.RegisterXSClass(ENTransportRouteDistanceShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRouteDistanceShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTransportRouteDistanceShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTransportRouteDistanceShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTransportRouteDistanceControllerSoapPort), 'http://ksoe.org/ENTransportRouteDistanceController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTransportRouteDistanceControllerSoapPort), 'http://ksoe.org/ENTransportRouteDistanceController/action/ENTransportRouteDistanceController.%operationName%');


end.
