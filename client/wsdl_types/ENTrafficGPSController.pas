unit ENTrafficGPSController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,TKTransportRealController 
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

  ENTrafficGPS            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTrafficGPSRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTrafficGPS = class(TRemotable)
  private
    Fcode : Integer; 
    FdateGen : TXSDate;
    FsumKm : TXSDecimal;
    FsumFuel : TXSDecimal;
//???
    FrealTransport : TKTransportReal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property dateGen : TXSDate read FdateGen write FdateGen;
    property sumKm : TXSDecimal read FsumKm write FsumKm; 
    property sumFuel : TXSDecimal read FsumFuel write FsumFuel; 
    property realTransport : TKTransportReal read FrealTransport write FrealTransport; 
  end;
  
{
  ENTrafficGPSFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FdateGen : TXSDate;
    FsumKm : TXSDecimal;
    FsumFuel : TXSDecimal;
//???
    FrealTransport : TKTransportReal;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property dateGen : TXSDate read FdateGen write FdateGen;
    property sumKm : TXSDecimal read FsumKm write FsumKm; 
    property sumFuel : TXSDecimal read FsumFuel write FsumFuel; 
    property realTransport : TKTransportReal read FrealTransport write FrealTransport; 
  end;
}

  ENTrafficGPSFilter = class(ENTrafficGPS)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTrafficGPSShort = class(TRemotable)
  private
    Fcode : Integer; 
    FdateGen : TXSDate;	
    FsumKm : TXSDecimal;
    FsumFuel : TXSDecimal;
    FrealTransportCode : Integer; 
    FrealTransportName : WideString;
    FrealTransportInvNumber : WideString;
    FrealTransportGosNumber : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property dateGen : TXSDate read FdateGen write FdateGen;
    property sumKm : TXSDecimal read FsumKm write FsumKm; 
    property sumFuel : TXSDecimal read FsumFuel write FsumFuel; 

    property realTransportCode : Integer read FrealTransportCode write FrealTransportCode; 
    property realTransportName : WideString read FrealTransportName write FrealTransportName; 
    property realTransportInvNumber : WideString read FrealTransportInvNumber write FrealTransportInvNumber; 
    property realTransportGosNumber : WideString read FrealTransportGosNumber write FrealTransportGosNumber; 
  end;

  ArrayOfENTrafficGPSShort = array of ENTrafficGPSShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTrafficGPSShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTrafficGPSShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTrafficGPSShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTrafficGPSController/message/
  // soapAction: http://ksoe.org/ENTrafficGPSController/action/ENTrafficGPSController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTrafficGPSControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTrafficGPSController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTrafficGPSControllerSoapPort = interface(IInvokable)
  ['{82a182a1-82a1-82a1-82a1-82a182a182a1}']
    function  add(const aENTrafficGPS: ENTrafficGPS): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTrafficGPS: ENTrafficGPS); stdcall;
    function  getObject(const anObjectCode: Integer): ENTrafficGPS; stdcall;
    function  getList: ENTrafficGPSShortList; stdcall;
    function  getFilteredList(const aENTrafficGPSFilter: ENTrafficGPSFilter): ENTrafficGPSShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTrafficGPSShortList; stdcall;
    function  getScrollableFilteredList(const aENTrafficGPSFilter: ENTrafficGPSFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTrafficGPSShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTrafficGPSShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTrafficGPSFilter: ENTrafficGPSFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENTrafficGPS.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FsumKm) then
      sumKm.Free;
    if Assigned(FsumFuel) then
      sumFuel.Free;
    if Assigned(FrealTransport) then
      realTransport.Free;
    inherited Destroy;
  end;

{  
  destructor ENTrafficGPSFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FsumKm) then
      sumKm.Free;
    if Assigned(FsumFuel) then
      sumFuel.Free;
    if Assigned(FrealTransport) then
      realTransport.Free;
    inherited Destroy;
  end; 
}

  destructor ENTrafficGPSFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENTrafficGPSShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FsumKm) then
      sumKm.Free;
    if Assigned(FsumFuel) then
      sumFuel.Free;
    inherited Destroy;
  end; 
  
  destructor ENTrafficGPSShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTrafficGPS, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTrafficGPS');
  RemClassRegistry.RegisterXSClass(ENTrafficGPSRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTrafficGPSRef');
  RemClassRegistry.RegisterXSClass(ENTrafficGPSFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTrafficGPSFilter');
  RemClassRegistry.RegisterXSClass(ENTrafficGPSShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTrafficGPSShort');
  RemClassRegistry.RegisterXSClass(ENTrafficGPSShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTrafficGPSShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTrafficGPSShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTrafficGPSShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTrafficGPSControllerSoapPort), 'http://ksoe.org/ENTrafficGPSController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTrafficGPSControllerSoapPort), 'http://ksoe.org/ENTrafficGPSController/action/ENTrafficGPSController.%operationName%');


end.
