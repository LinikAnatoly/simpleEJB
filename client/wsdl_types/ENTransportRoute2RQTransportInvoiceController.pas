unit ENTransportRoute2RQTransportInvoiceController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQTransportInvoiceController 
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

  ENTransportRoute2RQTransportInvoice            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportRoute2RQTransportInvoiceRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportRoute2RQTransportInvoice = class(TRemotable)
  private
    Fcode : Integer; 
//???
    FinvoiceRef : RQTransportInvoiceRef;
//???
    FtransportRouteRef : ENTransportRouteRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property invoiceRef : RQTransportInvoiceRef read FinvoiceRef write FinvoiceRef; 
    property transportRouteRef : ENTransportRouteRef read FtransportRouteRef write FtransportRouteRef; 
  end;
  
{
  ENTransportRoute2RQTransportInvoiceFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
//???
    FinvoiceRef : RQTransportInvoiceRef;
//???
    FtransportRouteRef : ENTransportRouteRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property invoiceRef : RQTransportInvoiceRef read FinvoiceRef write FinvoiceRef; 
    property transportRouteRef : ENTransportRouteRef read FtransportRouteRef write FtransportRouteRef; 
  end;
}

  ENTransportRoute2RQTransportInvoiceFilter = class(ENTransportRoute2RQTransportInvoice)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTransportRoute2RQTransportInvoiceShort = class(TRemotable)
  private
    Fcode : Integer; 
    FinvoiceRefCode : Integer; 
    FtransportRouteRefCode : Integer; 
    FtransportRouteRefDistance : TXSDecimal;
    FtransportRouteRefWeight : TXSDecimal;
    FtransportRouteRefDistanceNew : TXSDecimal;
    FtransportRouteRefSpeedometerStart : TXSDecimal;
    FtransportRouteRefSpeedometerFinal : TXSDecimal;
    FtransportRouteRefDateEdit : TXSDateTime;	
    FtransportRouteRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property invoiceRefCode : Integer read FinvoiceRefCode write FinvoiceRefCode; //RQTransportInvoiceRef read FinvoiceRefCode write FinvoiceRefCode; 
    property transportRouteRefCode : Integer read FtransportRouteRefCode write FtransportRouteRefCode; 
    property transportRouteRefDistance : TXSDecimal read FtransportRouteRefDistance write FtransportRouteRefDistance; 
    property transportRouteRefWeight : TXSDecimal read FtransportRouteRefWeight write FtransportRouteRefWeight; 
    property transportRouteRefDistanceNew : TXSDecimal read FtransportRouteRefDistanceNew write FtransportRouteRefDistanceNew; 
    property transportRouteRefSpeedometerStart : TXSDecimal read FtransportRouteRefSpeedometerStart write FtransportRouteRefSpeedometerStart; 
    property transportRouteRefSpeedometerFinal : TXSDecimal read FtransportRouteRefSpeedometerFinal write FtransportRouteRefSpeedometerFinal; 
    property transportRouteRefDateEdit : TXSDateTime read FtransportRouteRefDateEdit write FtransportRouteRefDateEdit; 
    property transportRouteRefUserGen : WideString read FtransportRouteRefUserGen write FtransportRouteRefUserGen; 
  end;

  ArrayOfENTransportRoute2RQTransportInvoiceShort = array of ENTransportRoute2RQTransportInvoiceShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTransportRoute2RQTransportInvoiceShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTransportRoute2RQTransportInvoiceShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTransportRoute2RQTransportInvoiceShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTransportRoute2RQTransportInvoiceController/message/
  // soapAction: http://ksoe.org/ENTransportRoute2RQTransportInvoiceController/action/ENTransportRoute2RQTransportInvoiceController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTransportRoute2RQTransportInvoiceControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTransportRoute2RQTransportInvoiceController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTransportRoute2RQTransportInvoiceControllerSoapPort = interface(IInvokable)
  ['{d337d337-d337-d337-d337-d337d337d337}']
    function  add(const aENTransportRoute2RQTransportInvoice: ENTransportRoute2RQTransportInvoice): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTransportRoute2RQTransportInvoice: ENTransportRoute2RQTransportInvoice); stdcall;
    function  getObject(const anObjectCode: Integer): ENTransportRoute2RQTransportInvoice; stdcall;
    function  getList: ENTransportRoute2RQTransportInvoiceShortList; stdcall;
    function  getFilteredList(const aENTransportRoute2RQTransportInvoiceFilter: ENTransportRoute2RQTransportInvoiceFilter): ENTransportRoute2RQTransportInvoiceShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTransportRoute2RQTransportInvoiceShortList; stdcall;
    function  getScrollableFilteredList(const aENTransportRoute2RQTransportInvoiceFilter: ENTransportRoute2RQTransportInvoiceFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTransportRoute2RQTransportInvoiceShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTransportRoute2RQTransportInvoiceShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTransportRoute2RQTransportInvoiceFilter: ENTransportRoute2RQTransportInvoiceFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENTransportRoute2RQTransportInvoice.Destroy;
  begin
    if Assigned(FinvoiceRef) then
      invoiceRef.Free;
    if Assigned(FtransportRouteRef) then
      transportRouteRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENTransportRoute2RQTransportInvoiceFilter.Destroy;
  begin
    if Assigned(FinvoiceRef) then
      invoiceRef.Free;
    if Assigned(FtransportRouteRef) then
      transportRouteRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENTransportRoute2RQTransportInvoiceFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENTransportRoute2RQTransportInvoiceShort.Destroy;
  begin
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
    if Assigned(FtransportRouteRefDateEdit) then
      transportRouteRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENTransportRoute2RQTransportInvoiceShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTransportRoute2RQTransportInvoice, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRoute2RQTransportInvoice');
  RemClassRegistry.RegisterXSClass(ENTransportRoute2RQTransportInvoiceRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRoute2RQTransportInvoiceRef');
  RemClassRegistry.RegisterXSClass(ENTransportRoute2RQTransportInvoiceFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRoute2RQTransportInvoiceFilter');
  RemClassRegistry.RegisterXSClass(ENTransportRoute2RQTransportInvoiceShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRoute2RQTransportInvoiceShort');
  RemClassRegistry.RegisterXSClass(ENTransportRoute2RQTransportInvoiceShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRoute2RQTransportInvoiceShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTransportRoute2RQTransportInvoiceShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTransportRoute2RQTransportInvoiceShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTransportRoute2RQTransportInvoiceControllerSoapPort), 'http://ksoe.org/ENTransportRoute2RQTransportInvoiceController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTransportRoute2RQTransportInvoiceControllerSoapPort), 'http://ksoe.org/ENTransportRoute2RQTransportInvoiceController/action/ENTransportRoute2RQTransportInvoiceController.%operationName%');


end.
