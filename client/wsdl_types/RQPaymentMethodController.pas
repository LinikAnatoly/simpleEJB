unit RQPaymentMethodController;

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

  RQPaymentMethod            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPaymentMethodRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPaymentMethod = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  RQPaymentMethodFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;
}

  RQPaymentMethodFilter = class(RQPaymentMethod)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPaymentMethodShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQPaymentMethodShort = array of RQPaymentMethodShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPaymentMethodShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPaymentMethodShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPaymentMethodShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPaymentMethodController/message/
  // soapAction: http://ksoe.org/RQPaymentMethodController/action/RQPaymentMethodController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPaymentMethodControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPaymentMethodController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPaymentMethodControllerSoapPort = interface(IInvokable)
  ['{2E006EC0-8257-4F0E-87A8-85F617C88DE7}']
    function add(const aRQPaymentMethod: RQPaymentMethod): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPaymentMethod: RQPaymentMethod); stdcall;
    function getObject(const anObjectCode: Integer): RQPaymentMethod; stdcall;
    function getList: RQPaymentMethodShortList; stdcall;
    function getFilteredList(const aRQPaymentMethodFilter: RQPaymentMethodFilter): RQPaymentMethodShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPaymentMethodShortList; stdcall;
    function getScrollableFilteredList(const aRQPaymentMethodFilter: RQPaymentMethodFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPaymentMethodShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPaymentMethodShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPaymentMethodFilter: RQPaymentMethodFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPaymentMethodShort; stdcall;
  end;


implementation



  destructor RQPaymentMethodShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPaymentMethod, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPaymentMethod');
  RemClassRegistry.RegisterXSClass(RQPaymentMethodRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPaymentMethodRef');
  RemClassRegistry.RegisterXSClass(RQPaymentMethodFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPaymentMethodFilter');
  RemClassRegistry.RegisterXSClass(RQPaymentMethodShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPaymentMethodShort');
  RemClassRegistry.RegisterXSClass(RQPaymentMethodShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPaymentMethodShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPaymentMethodShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPaymentMethodShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPaymentMethodControllerSoapPort), 'http://ksoe.org/RQPaymentMethodController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPaymentMethodControllerSoapPort), 'http://ksoe.org/RQPaymentMethodController/action/RQPaymentMethodController.%operationName%');


end.
