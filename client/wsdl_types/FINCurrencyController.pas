unit FINCurrencyController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
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

  FINCurrency            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINCurrencyRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINCurrency = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FshortName : WideString;
    FisoAlphabeticCode : WideString;
    FisoNumericCode : WideString;
    Fsign : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property shortName : WideString read FshortName write FshortName;
    property isoAlphabeticCode : WideString read FisoAlphabeticCode write FisoAlphabeticCode;
    property isoNumericCode : WideString read FisoNumericCode write FisoNumericCode;
    property sign : WideString read Fsign write Fsign;
  end;

{
  FINCurrencyFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FshortName : WideString;
    FisoAlphabeticCode : WideString;
    FisoNumericCode : WideString;
    Fsign : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property shortName : WideString read FshortName write FshortName;
    property isoAlphabeticCode : WideString read FisoAlphabeticCode write FisoAlphabeticCode;
    property isoNumericCode : WideString read FisoNumericCode write FisoNumericCode;
    property sign : WideString read Fsign write Fsign;
  end;
}

  FINCurrencyFilter = class(FINCurrency)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  FINCurrencyShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FshortName : WideString;
    FisoAlphabeticCode : WideString;
    FisoNumericCode : WideString;
    Fsign : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property shortName : WideString read FshortName write FshortName;
    property isoAlphabeticCode : WideString read FisoAlphabeticCode write FisoAlphabeticCode;
    property isoNumericCode : WideString read FisoNumericCode write FisoNumericCode;
    property sign : WideString read Fsign write Fsign;

  end;

  ArrayOfFINCurrencyShort = array of FINCurrencyShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  FINCurrencyShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfFINCurrencyShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfFINCurrencyShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/FINCurrencyController/message/
  // soapAction: http://ksoe.org/FINCurrencyController/action/FINCurrencyController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : FINCurrencyControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : FINCurrencyController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  FINCurrencyControllerSoapPort = interface(IInvokable)
  ['{D416001C-E1F8-4EAA-8867-BC3F7C4B9DE7}']
    function add(const aFINCurrency: FINCurrency): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aFINCurrency: FINCurrency); stdcall;
    function getObject(const anObjectCode: Integer): FINCurrency; stdcall;
    function getList: FINCurrencyShortList; stdcall;
    function getFilteredList(const aFINCurrencyFilter: FINCurrencyFilter): FINCurrencyShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): FINCurrencyShortList; stdcall;
    function getScrollableFilteredList(const aFINCurrencyFilter: FINCurrencyFilter; const aFromPosition: Integer; const aQuantity: Integer): FINCurrencyShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): FINCurrencyShortList; stdcall;
    function getScrollableFilteredCodeArray(const aFINCurrencyFilter: FINCurrencyFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): FINCurrencyShort; stdcall;
  end;


implementation



  destructor FINCurrencyShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(FINCurrency, 'http://ksoe.org/EnergyproControllerService/type/', 'FINCurrency');
  RemClassRegistry.RegisterXSClass(FINCurrencyRef, 'http://ksoe.org/EnergyproControllerService/type/', 'FINCurrencyRef');
  RemClassRegistry.RegisterXSClass(FINCurrencyFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'FINCurrencyFilter');
  RemClassRegistry.RegisterXSClass(FINCurrencyShort, 'http://ksoe.org/EnergyproControllerService/type/', 'FINCurrencyShort');
  RemClassRegistry.RegisterXSClass(FINCurrencyShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'FINCurrencyShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFINCurrencyShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfFINCurrencyShort');

  InvRegistry.RegisterInterface(TypeInfo(FINCurrencyControllerSoapPort), 'http://ksoe.org/FINCurrencyController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(FINCurrencyControllerSoapPort), 'http://ksoe.org/FINCurrencyController/action/FINCurrencyController.%operationName%');


end.
