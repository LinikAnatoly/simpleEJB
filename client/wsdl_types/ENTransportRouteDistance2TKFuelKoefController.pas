unit ENTransportRouteDistance2TKFuelKoefController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENTransportRouteDistanceController 
   ,TKFuelKoefController 
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

  ENTransportRouteDistance2TKFuelKoef            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportRouteDistance2TKFuelKoefRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportRouteDistance2TKFuelKoef = class(TRemotable)
  private
    Fcode : Integer; 
//???
    FtransportRouteDistanceRef : ENTransportRouteDistanceRef;
//???
    FtkFuelKoefRef : TKFuelKoefRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property transportRouteDistanceRef : ENTransportRouteDistanceRef read FtransportRouteDistanceRef write FtransportRouteDistanceRef; 
    property tkFuelKoefRef : TKFuelKoefRef read FtkFuelKoefRef write FtkFuelKoefRef; 
  end;
  
{
  ENTransportRouteDistance2TKFuelKoefFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
//???
    FtransportRouteDistanceRef : ENTransportRouteDistanceRef;
//???
    FtkFuelKoefRef : TKFuelKoefRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property transportRouteDistanceRef : ENTransportRouteDistanceRef read FtransportRouteDistanceRef write FtransportRouteDistanceRef; 
    property tkFuelKoefRef : TKFuelKoefRef read FtkFuelKoefRef write FtkFuelKoefRef; 
  end;
}

  ENTransportRouteDistance2TKFuelKoefFilter = class(ENTransportRouteDistance2TKFuelKoef)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTransportRouteDistance2TKFuelKoefShort = class(TRemotable)
  private
    Fcode : Integer; 
    FtransportRouteDistanceRefCode : Integer; 
    FtransportRouteDistanceRefDistance : TXSDecimal;
    FtransportRouteDistanceRefKoef : TXSDecimal;
    FtkFuelKoefRefCode : Integer; 
    FtkFuelKoefRefKoef : TXSDecimal;
    FtkFuelKoefRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property transportRouteDistanceRefCode : Integer read FtransportRouteDistanceRefCode write FtransportRouteDistanceRefCode; 
    property transportRouteDistanceRefDistance : TXSDecimal read FtransportRouteDistanceRefDistance write FtransportRouteDistanceRefDistance; 
    property transportRouteDistanceRefKoef : TXSDecimal read FtransportRouteDistanceRefKoef write FtransportRouteDistanceRefKoef; 
    property tkFuelKoefRefCode : Integer read FtkFuelKoefRefCode write FtkFuelKoefRefCode; 
    property tkFuelKoefRefKoef : TXSDecimal read FtkFuelKoefRefKoef write FtkFuelKoefRefKoef; 
    property tkFuelKoefRefName : WideString read FtkFuelKoefRefName write FtkFuelKoefRefName; 
  end;

  ArrayOfENTransportRouteDistance2TKFuelKoefShort = array of ENTransportRouteDistance2TKFuelKoefShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTransportRouteDistance2TKFuelKoefShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTransportRouteDistance2TKFuelKoefShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTransportRouteDistance2TKFuelKoefShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTransportRouteDistance2TKFuelKoefController/message/
  // soapAction: http://ksoe.org/ENTransportRouteDistance2TKFuelKoefController/action/ENTransportRouteDistance2TKFuelKoefController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTransportRouteDistance2TKFuelKoefControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTransportRouteDistance2TKFuelKoefController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTransportRouteDistance2TKFuelKoefControllerSoapPort = interface(IInvokable)
  ['{1e271e27-1e27-1e27-1e27-1e271e271e27}']
    function  add(const aENTransportRouteDistance2TKFuelKoef: ENTransportRouteDistance2TKFuelKoef): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTransportRouteDistance2TKFuelKoef: ENTransportRouteDistance2TKFuelKoef); stdcall;
    function  getObject(const anObjectCode: Integer): ENTransportRouteDistance2TKFuelKoef; stdcall;
    function  getList: ENTransportRouteDistance2TKFuelKoefShortList; stdcall;
    function  getFilteredList(const aENTransportRouteDistance2TKFuelKoefFilter: ENTransportRouteDistance2TKFuelKoefFilter): ENTransportRouteDistance2TKFuelKoefShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTransportRouteDistance2TKFuelKoefShortList; stdcall;
    function  getScrollableFilteredList(const aENTransportRouteDistance2TKFuelKoefFilter: ENTransportRouteDistance2TKFuelKoefFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTransportRouteDistance2TKFuelKoefShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTransportRouteDistance2TKFuelKoefShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTransportRouteDistance2TKFuelKoefFilter: ENTransportRouteDistance2TKFuelKoefFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENTransportRouteDistance2TKFuelKoef.Destroy;
  begin
    if Assigned(FtransportRouteDistanceRef) then
      transportRouteDistanceRef.Free;
    if Assigned(FtkFuelKoefRef) then
      tkFuelKoefRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENTransportRouteDistance2TKFuelKoefFilter.Destroy;
  begin
    if Assigned(FtransportRouteDistanceRef) then
      transportRouteDistanceRef.Free;
    if Assigned(FtkFuelKoefRef) then
      tkFuelKoefRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENTransportRouteDistance2TKFuelKoefFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENTransportRouteDistance2TKFuelKoefShort.Destroy;
  begin
    if Assigned(FtransportRouteDistanceRefDistance) then
      transportRouteDistanceRefDistance.Free;
    if Assigned(FtransportRouteDistanceRefKoef) then
      transportRouteDistanceRefKoef.Free;
    if Assigned(FtkFuelKoefRefKoef) then
      tkFuelKoefRefKoef.Free;
    inherited Destroy;
  end; 
  
  destructor ENTransportRouteDistance2TKFuelKoefShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTransportRouteDistance2TKFuelKoef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRouteDistance2TKFuelKoef');
  RemClassRegistry.RegisterXSClass(ENTransportRouteDistance2TKFuelKoefRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRouteDistance2TKFuelKoefRef');
  RemClassRegistry.RegisterXSClass(ENTransportRouteDistance2TKFuelKoefFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRouteDistance2TKFuelKoefFilter');
  RemClassRegistry.RegisterXSClass(ENTransportRouteDistance2TKFuelKoefShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRouteDistance2TKFuelKoefShort');
  RemClassRegistry.RegisterXSClass(ENTransportRouteDistance2TKFuelKoefShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRouteDistance2TKFuelKoefShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTransportRouteDistance2TKFuelKoefShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTransportRouteDistance2TKFuelKoefShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTransportRouteDistance2TKFuelKoefControllerSoapPort), 'http://ksoe.org/ENTransportRouteDistance2TKFuelKoefController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTransportRouteDistance2TKFuelKoefControllerSoapPort), 'http://ksoe.org/ENTransportRouteDistance2TKFuelKoefController/action/ENTransportRouteDistance2TKFuelKoefController.%operationName%');


end.
