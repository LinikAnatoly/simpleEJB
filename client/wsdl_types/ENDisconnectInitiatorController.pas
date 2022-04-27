unit ENDisconnectInitiatorController;

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

  ENDisconnectInitiator            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDisconnectInitiatorRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDisconnectInitiator = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENDisconnectInitiatorFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;
}

  ENDisconnectInitiatorFilter = class(ENDisconnectInitiator)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENDisconnectInitiatorShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENDisconnectInitiatorShort = array of ENDisconnectInitiatorShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDisconnectInitiatorShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDisconnectInitiatorShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDisconnectInitiatorShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDisconnectInitiatorController/message/
  // soapAction: http://ksoe.org/ENDisconnectInitiatorController/action/ENDisconnectInitiatorController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDisconnectInitiatorControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDisconnectInitiatorController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDisconnectInitiatorControllerSoapPort = interface(IInvokable)
  ['{E6447E17-BD5C-4CF5-8E6F-0E42E67B29C9}']
    function add(const aENDisconnectInitiator: ENDisconnectInitiator): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDisconnectInitiator: ENDisconnectInitiator); stdcall;
    function getObject(const anObjectCode: Integer): ENDisconnectInitiator; stdcall;
    function getList: ENDisconnectInitiatorShortList; stdcall;
    function getFilteredList(const aENDisconnectInitiatorFilter: ENDisconnectInitiatorFilter): ENDisconnectInitiatorShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDisconnectInitiatorShortList; stdcall;
    function getScrollableFilteredList(const aENDisconnectInitiatorFilter: ENDisconnectInitiatorFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDisconnectInitiatorShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDisconnectInitiatorShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENDisconnectInitiatorFilter: ENDisconnectInitiatorFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENDisconnectInitiatorShort; stdcall;
  end;


implementation



  destructor ENDisconnectInitiatorShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDisconnectInitiator, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDisconnectInitiator');
  RemClassRegistry.RegisterXSClass(ENDisconnectInitiatorRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDisconnectInitiatorRef');
  RemClassRegistry.RegisterXSClass(ENDisconnectInitiatorFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDisconnectInitiatorFilter');
  RemClassRegistry.RegisterXSClass(ENDisconnectInitiatorShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDisconnectInitiatorShort');
  RemClassRegistry.RegisterXSClass(ENDisconnectInitiatorShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDisconnectInitiatorShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDisconnectInitiatorShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDisconnectInitiatorShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDisconnectInitiatorControllerSoapPort), 'http://ksoe.org/ENDisconnectInitiatorController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDisconnectInitiatorControllerSoapPort), 'http://ksoe.org/ENDisconnectInitiatorController/action/ENDisconnectInitiatorController.%operationName%');


end.
