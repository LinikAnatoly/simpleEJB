unit ENTrptGPS2TrptRealController;

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

  ENTrptGPS2TrptReal            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTrptGPS2TrptRealRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTrptGPS2TrptReal = class(TRemotable)
  private
    Fcode : Integer; 
    FcodeTranpostGps : WideString;
//???
    FrealTransport : TKTransportReal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property codeTranpostGps : WideString read FcodeTranpostGps write FcodeTranpostGps;
    property realTransport : TKTransportReal read FrealTransport write FrealTransport; 
  end;
  
{
  ENTrptGPS2TrptRealFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FcodeTranpostGps : WideString;
//???
    FrealTransport : TKTransportReal;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property codeTranpostGps : WideString read FcodeTranpostGps write FcodeTranpostGps;
    property realTransport : TKTransportReal read FrealTransport write FrealTransport; 
  end;
}

  ENTrptGPS2TrptRealFilter = class(ENTrptGPS2TrptReal)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTrptGPS2TrptRealShort = class(TRemotable)
  private
    Fcode : Integer; 
    FcodeTranpostGps : WideString;
    FrealTransportCode : Integer; 
    FrealTransportName : WideString;
    FrealTransportInvNumber : WideString;
    FrealTransportGosNumber : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property codeTranpostGps : WideString read FcodeTranpostGps write FcodeTranpostGps;

    property realTransportCode : Integer read FrealTransportCode write FrealTransportCode; 
    property realTransportName : WideString read FrealTransportName write FrealTransportName; 
    property realTransportInvNumber : WideString read FrealTransportInvNumber write FrealTransportInvNumber; 
    property realTransportGosNumber : WideString read FrealTransportGosNumber write FrealTransportGosNumber; 
  end;

  ArrayOfENTrptGPS2TrptRealShort = array of ENTrptGPS2TrptRealShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTrptGPS2TrptRealShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTrptGPS2TrptRealShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTrptGPS2TrptRealShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTrptGPS2TrptRealController/message/
  // soapAction: http://ksoe.org/ENTrptGPS2TrptRealController/action/ENTrptGPS2TrptRealController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTrptGPS2TrptRealControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTrptGPS2TrptRealController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTrptGPS2TrptRealControllerSoapPort = interface(IInvokable)
  ['{10a510a5-10a5-10a5-10a5-10a510a510a5}']
    function  add(const aENTrptGPS2TrptReal: ENTrptGPS2TrptReal): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTrptGPS2TrptReal: ENTrptGPS2TrptReal); stdcall;
    function  getObject(const anObjectCode: Integer): ENTrptGPS2TrptReal; stdcall;
    function  getList: ENTrptGPS2TrptRealShortList; stdcall;
    function  getFilteredList(const aENTrptGPS2TrptRealFilter: ENTrptGPS2TrptRealFilter): ENTrptGPS2TrptRealShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTrptGPS2TrptRealShortList; stdcall;
    function  getScrollableFilteredList(const aENTrptGPS2TrptRealFilter: ENTrptGPS2TrptRealFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTrptGPS2TrptRealShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTrptGPS2TrptRealShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTrptGPS2TrptRealFilter: ENTrptGPS2TrptRealFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENTrptGPS2TrptReal.Destroy;
  begin
    if Assigned(FrealTransport) then
      realTransport.Free;
    inherited Destroy;
  end;

{  
  destructor ENTrptGPS2TrptRealFilter.Destroy;
  begin
    if Assigned(FrealTransport) then
      realTransport.Free;
    inherited Destroy;
  end; 
}

  destructor ENTrptGPS2TrptRealFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  
  destructor ENTrptGPS2TrptRealShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTrptGPS2TrptReal, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTrptGPS2TrptReal');
  RemClassRegistry.RegisterXSClass(ENTrptGPS2TrptRealRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTrptGPS2TrptRealRef');
  RemClassRegistry.RegisterXSClass(ENTrptGPS2TrptRealFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTrptGPS2TrptRealFilter');
  RemClassRegistry.RegisterXSClass(ENTrptGPS2TrptRealShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTrptGPS2TrptRealShort');
  RemClassRegistry.RegisterXSClass(ENTrptGPS2TrptRealShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTrptGPS2TrptRealShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTrptGPS2TrptRealShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTrptGPS2TrptRealShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTrptGPS2TrptRealControllerSoapPort), 'http://ksoe.org/ENTrptGPS2TrptRealController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTrptGPS2TrptRealControllerSoapPort), 'http://ksoe.org/ENTrptGPS2TrptRealController/action/ENTrptGPS2TrptRealController.%operationName%');


end.
