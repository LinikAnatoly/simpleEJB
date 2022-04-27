unit ENServicesTransportController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENServicesCostController
   ,TKCalcTransportController
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

  ENServicesTransport            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesTransportRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesTransport = class(TRemotable)
  private
    Fcode : Integer;
    FmachineHoursCount : TXSDecimal;
    Fdistance : TXSDecimal;
    FcostMachineHours : TXSDecimal;
    FcostDistance : TXSDecimal;
    FcostTotal : TXSDecimal;
//???
    FservicesCostRef : ENServicesCostRef;
//???
    FcalcTransportRef : TKCalcTransportRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property machineHoursCount : TXSDecimal read FmachineHoursCount write FmachineHoursCount;
    property distance : TXSDecimal read Fdistance write Fdistance;
    property costMachineHours : TXSDecimal read FcostMachineHours write FcostMachineHours;
    property costDistance : TXSDecimal read FcostDistance write FcostDistance;
    property costTotal : TXSDecimal read FcostTotal write FcostTotal;
    property servicesCostRef : ENServicesCostRef read FservicesCostRef write FservicesCostRef;
    property calcTransportRef : TKCalcTransportRef read FcalcTransportRef write FcalcTransportRef;
  end;

{
  ENServicesTransportFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FmachineHoursCount : TXSDecimal;
    Fdistance : TXSDecimal;
    FcostMachineHours : TXSDecimal;
    FcostDistance : TXSDecimal;
    FcostTotal : TXSDecimal;
//???
    FservicesCostRef : ENServicesCostRef;
//???
    FcalcTransportRef : TKCalcTransportRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property machineHoursCount : TXSDecimal read FmachineHoursCount write FmachineHoursCount;
    property distance : TXSDecimal read Fdistance write Fdistance;
    property costMachineHours : TXSDecimal read FcostMachineHours write FcostMachineHours;
    property costDistance : TXSDecimal read FcostDistance write FcostDistance;
    property costTotal : TXSDecimal read FcostTotal write FcostTotal;
    property servicesCostRef : ENServicesCostRef read FservicesCostRef write FservicesCostRef;
    property calcTransportRef : TKCalcTransportRef read FcalcTransportRef write FcalcTransportRef;
  end;
}

  ENServicesTransportFilter = class(ENServicesTransport)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENServicesTransportShort = class(TRemotable)
  private
    Fcode : Integer;
	FtransportName : WideString;
    FmachineHoursCount : TXSDecimal;
    Fdistance : TXSDecimal;
    FcostMachineHours : TXSDecimal;
    FcostDistance : TXSDecimal;
    FcostTotal : TXSDecimal;
    FservicesCostRefCode : Integer;
    FservicesCostRefDateGen : TXSDate;
    FservicesCostRefCalculationCost : TXSDecimal;
    FservicesCostRefCostWithoutVAT : TXSDecimal;
    FservicesCostRefCostVAT : TXSDecimal;
    FservicesCostRefCostWithVAT : TXSDecimal;
    FcalcTransportRefCode : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property transportName : WideString read FtransportName write FtransportName;
    property machineHoursCount : TXSDecimal read FmachineHoursCount write FmachineHoursCount;
    property distance : TXSDecimal read Fdistance write Fdistance;
    property costMachineHours : TXSDecimal read FcostMachineHours write FcostMachineHours;
    property costDistance : TXSDecimal read FcostDistance write FcostDistance;
    property costTotal : TXSDecimal read FcostTotal write FcostTotal;

    property servicesCostRefCode : Integer read FservicesCostRefCode write FservicesCostRefCode;
    property servicesCostRefDateGen : TXSDate read FservicesCostRefDateGen write FservicesCostRefDateGen;
    property servicesCostRefCalculationCost : TXSDecimal read FservicesCostRefCalculationCost write FservicesCostRefCalculationCost;
    property servicesCostRefCostWithoutVAT : TXSDecimal read FservicesCostRefCostWithoutVAT write FservicesCostRefCostWithoutVAT;
    property servicesCostRefCostVAT : TXSDecimal read FservicesCostRefCostVAT write FservicesCostRefCostVAT;
    property servicesCostRefCostWithVAT : TXSDecimal read FservicesCostRefCostWithVAT write FservicesCostRefCostWithVAT;
    property calcTransportRefCode : Integer read FcalcTransportRefCode write FcalcTransportRefCode;
  end;

  ArrayOfENServicesTransportShort = array of ENServicesTransportShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENServicesTransportShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENServicesTransportShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENServicesTransportShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENServicesTransportController/message/
  // soapAction: http://ksoe.org/ENServicesTransportController/action/ENServicesTransportController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENServicesTransportControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENServicesTransportController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENServicesTransportControllerSoapPort = interface(IInvokable)
  ['{10C7FEE8-4DD1-4D9E-A1AA-A3B9AFB6FDF4}']
    function add(const aENServicesTransport: ENServicesTransport): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENServicesTransport: ENServicesTransport); stdcall;
    function getObject(const anObjectCode: Integer): ENServicesTransport; stdcall;
    function getList: ENServicesTransportShortList; stdcall;
    function getFilteredList(const aENServicesTransportFilter: ENServicesTransportFilter): ENServicesTransportShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENServicesTransportShortList; stdcall;
    function getScrollableFilteredList(const aENServicesTransportFilter: ENServicesTransportFilter; const aFromPosition: Integer; const aQuantity: Integer): ENServicesTransportShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENServicesTransportShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENServicesTransportFilter: ENServicesTransportFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENServicesTransportShort; stdcall;
  end;


implementation

  destructor ENServicesTransport.Destroy;
  begin
    if Assigned(FmachineHoursCount) then
      machineHoursCount.Free;
    if Assigned(Fdistance) then
      distance.Free;
    if Assigned(FcostMachineHours) then
      costMachineHours.Free;
    if Assigned(FcostDistance) then
      costDistance.Free;
    if Assigned(FcostTotal) then
      costTotal.Free;
    if Assigned(FservicesCostRef) then
      servicesCostRef.Free;
    if Assigned(FcalcTransportRef) then
      calcTransportRef.Free;
    inherited Destroy;
  end;

{
  destructor ENServicesTransportFilter.Destroy;
  begin
    if Assigned(FmachineHoursCount) then
      machineHoursCount.Free;
    if Assigned(Fdistance) then
      distance.Free;
    if Assigned(FcostMachineHours) then
      costMachineHours.Free;
    if Assigned(FcostDistance) then
      costDistance.Free;
    if Assigned(FcostTotal) then
      costTotal.Free;
    if Assigned(FservicesCostRef) then
      servicesCostRef.Free;
    if Assigned(FcalcTransportRef) then
      calcTransportRef.Free;
    inherited Destroy;
  end;
}

  destructor ENServicesTransportFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENServicesTransportShort.Destroy;
  begin
    if Assigned(FmachineHoursCount) then
      machineHoursCount.Free;
    if Assigned(Fdistance) then
      distance.Free;
    if Assigned(FcostMachineHours) then
      costMachineHours.Free;
    if Assigned(FcostDistance) then
      costDistance.Free;
    if Assigned(FcostTotal) then
      costTotal.Free;
    if Assigned(FservicesCostRefDateGen) then
      servicesCostRefDateGen.Free;
    if Assigned(FservicesCostRefCalculationCost) then
      servicesCostRefCalculationCost.Free;
    if Assigned(FservicesCostRefCostWithoutVAT) then
      servicesCostRefCostWithoutVAT.Free;
    if Assigned(FservicesCostRefCostVAT) then
      servicesCostRefCostVAT.Free;
    if Assigned(FservicesCostRefCostWithVAT) then
      servicesCostRefCostWithVAT.Free;
    inherited Destroy;
  end;

  destructor ENServicesTransportShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENServicesTransport, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesTransport');
  RemClassRegistry.RegisterXSClass(ENServicesTransportRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesTransportRef');
  RemClassRegistry.RegisterXSClass(ENServicesTransportFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesTransportFilter');
  RemClassRegistry.RegisterXSClass(ENServicesTransportShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesTransportShort');
  RemClassRegistry.RegisterXSClass(ENServicesTransportShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesTransportShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENServicesTransportShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENServicesTransportShort');

  InvRegistry.RegisterInterface(TypeInfo(ENServicesTransportControllerSoapPort), 'http://ksoe.org/ENServicesTransportController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENServicesTransportControllerSoapPort), 'http://ksoe.org/ENServicesTransportController/action/ENServicesTransportController.%operationName%');


end.
