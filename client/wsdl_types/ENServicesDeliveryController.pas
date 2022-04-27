unit ENServicesDeliveryController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENServicesCostController
   ,TKCalcDeliveryController
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

  ENServicesDelivery            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesDeliveryRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesDelivery = class(TRemotable)
  private
    Fcode : Integer;
    FtimeGen : TXSDecimal;
    FcostGen : TXSDecimal;
    FchargeCostGen : TXSDecimal;
    FcostTotal : TXSDecimal;
//???
    FservicesCostRef : ENServicesCostRef;
//???
    FcalcDeliveryRef : TKCalcDeliveryRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property timeGen : TXSDecimal read FtimeGen write FtimeGen;
    property costGen : TXSDecimal read FcostGen write FcostGen;
    property chargeCostGen : TXSDecimal read FchargeCostGen write FchargeCostGen;
    property costTotal : TXSDecimal read FcostTotal write FcostTotal;
    property servicesCostRef : ENServicesCostRef read FservicesCostRef write FservicesCostRef;
    property calcDeliveryRef : TKCalcDeliveryRef read FcalcDeliveryRef write FcalcDeliveryRef;
  end;

{
  ENServicesDeliveryFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FtimeGen : TXSDecimal;
    FcostGen : TXSDecimal;
    FchargeCostGen : TXSDecimal;
    FcostTotal : TXSDecimal;
//???
    FservicesCostRef : ENServicesCostRef;
//???
    FcalcDeliveryRef : TKCalcDeliveryRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property timeGen : TXSDecimal read FtimeGen write FtimeGen;
    property costGen : TXSDecimal read FcostGen write FcostGen;
    property chargeCostGen : TXSDecimal read FchargeCostGen write FchargeCostGen;
    property costTotal : TXSDecimal read FcostTotal write FcostTotal;
    property servicesCostRef : ENServicesCostRef read FservicesCostRef write FservicesCostRef;
    property calcDeliveryRef : TKCalcDeliveryRef read FcalcDeliveryRef write FcalcDeliveryRef;
  end;
}

  ENServicesDeliveryFilter = class(ENServicesDelivery)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENServicesDeliveryShort = class(TRemotable)
  private
    Fcode : Integer;
    FtimeGen : TXSDecimal;
    FcostGen : TXSDecimal;
    FchargeCostGen : TXSDecimal;
    FcostTotal : TXSDecimal;
    FservicesCostRefCode : Integer;
    FservicesCostRefDateGen : TXSDate;
    FservicesCostRefCalculationCost : TXSDecimal;
    FservicesCostRefCostWithoutVAT : TXSDecimal;
    FservicesCostRefCostVAT : TXSDecimal;
    FservicesCostRefCostWithVAT : TXSDecimal;
    FcalcDeliveryRefCode : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property timeGen : TXSDecimal read FtimeGen write FtimeGen;
    property costGen : TXSDecimal read FcostGen write FcostGen;
    property chargeCostGen : TXSDecimal read FchargeCostGen write FchargeCostGen;
    property costTotal : TXSDecimal read FcostTotal write FcostTotal;

    property servicesCostRefCode : Integer read FservicesCostRefCode write FservicesCostRefCode;
    property servicesCostRefDateGen : TXSDate read FservicesCostRefDateGen write FservicesCostRefDateGen;
    property servicesCostRefCalculationCost : TXSDecimal read FservicesCostRefCalculationCost write FservicesCostRefCalculationCost;
    property servicesCostRefCostWithoutVAT : TXSDecimal read FservicesCostRefCostWithoutVAT write FservicesCostRefCostWithoutVAT;
    property servicesCostRefCostVAT : TXSDecimal read FservicesCostRefCostVAT write FservicesCostRefCostVAT;
    property servicesCostRefCostWithVAT : TXSDecimal read FservicesCostRefCostWithVAT write FservicesCostRefCostWithVAT;
    property calcDeliveryRefCode : Integer read FcalcDeliveryRefCode write FcalcDeliveryRefCode;
  end;

  ArrayOfENServicesDeliveryShort = array of ENServicesDeliveryShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENServicesDeliveryShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENServicesDeliveryShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENServicesDeliveryShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENServicesDeliveryController/message/
  // soapAction: http://ksoe.org/ENServicesDeliveryController/action/ENServicesDeliveryController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENServicesDeliveryControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENServicesDeliveryController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENServicesDeliveryControllerSoapPort = interface(IInvokable)
  ['{AD9F90BE-6E7B-4C78-9A71-50A13775A726}']
    function add(const aENServicesDelivery: ENServicesDelivery): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENServicesDelivery: ENServicesDelivery); stdcall;
    function getObject(const anObjectCode: Integer): ENServicesDelivery; stdcall;
    function getList: ENServicesDeliveryShortList; stdcall;
    function getFilteredList(const aENServicesDeliveryFilter: ENServicesDeliveryFilter): ENServicesDeliveryShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENServicesDeliveryShortList; stdcall;
    function getScrollableFilteredList(const aENServicesDeliveryFilter: ENServicesDeliveryFilter; const aFromPosition: Integer; const aQuantity: Integer): ENServicesDeliveryShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENServicesDeliveryShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENServicesDeliveryFilter: ENServicesDeliveryFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENServicesDeliveryShort; stdcall;
  end;


implementation

  destructor ENServicesDelivery.Destroy;
  begin
    if Assigned(FtimeGen) then
      timeGen.Free;
    if Assigned(FcostGen) then
      costGen.Free;
    if Assigned(FchargeCostGen) then
      chargeCostGen.Free;
    if Assigned(FcostTotal) then
      costTotal.Free;
    if Assigned(FservicesCostRef) then
      servicesCostRef.Free;
    if Assigned(FcalcDeliveryRef) then
      calcDeliveryRef.Free;
    inherited Destroy;
  end;

{
  destructor ENServicesDeliveryFilter.Destroy;
  begin
    if Assigned(FtimeGen) then
      timeGen.Free;
    if Assigned(FcostGen) then
      costGen.Free;
    if Assigned(FchargeCostGen) then
      chargeCostGen.Free;
    if Assigned(FcostTotal) then
      costTotal.Free;
    if Assigned(FservicesCostRef) then
      servicesCostRef.Free;
    if Assigned(FcalcDeliveryRef) then
      calcDeliveryRef.Free;
    inherited Destroy;
  end;
}

  destructor ENServicesDeliveryFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENServicesDeliveryShort.Destroy;
  begin
    if Assigned(FtimeGen) then
      timeGen.Free;
    if Assigned(FcostGen) then
      costGen.Free;
    if Assigned(FchargeCostGen) then
      chargeCostGen.Free;
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

  destructor ENServicesDeliveryShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENServicesDelivery, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesDelivery');
  RemClassRegistry.RegisterXSClass(ENServicesDeliveryRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesDeliveryRef');
  RemClassRegistry.RegisterXSClass(ENServicesDeliveryFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesDeliveryFilter');
  RemClassRegistry.RegisterXSClass(ENServicesDeliveryShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesDeliveryShort');
  RemClassRegistry.RegisterXSClass(ENServicesDeliveryShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesDeliveryShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENServicesDeliveryShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENServicesDeliveryShort');

  InvRegistry.RegisterInterface(TypeInfo(ENServicesDeliveryControllerSoapPort), 'http://ksoe.org/ENServicesDeliveryController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENServicesDeliveryControllerSoapPort), 'http://ksoe.org/ENServicesDeliveryController/action/ENServicesDeliveryController.%operationName%');


end.
