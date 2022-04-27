unit ENSubst150VRUZRUTypeController;

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

  ENSubst150VRUZRUType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubst150VRUZRUTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubst150VRUZRUType = class(TRemotable)
  private
    Fcode : Integer;
    FnameDisp : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property nameDisp : WideString read FnameDisp write FnameDisp;
  end;

{
  ENSubst150VRUZRUTypeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnameDisp : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property nameDisp : WideString read FnameDisp write FnameDisp;
  end;
}

  ENSubst150VRUZRUTypeFilter = class(ENSubst150VRUZRUType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSubst150VRUZRUTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    FnameDisp : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property nameDisp : WideString read FnameDisp write FnameDisp;

  end;

  ArrayOfENSubst150VRUZRUTypeShort = array of ENSubst150VRUZRUTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSubst150VRUZRUTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSubst150VRUZRUTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSubst150VRUZRUTypeShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSubst150VRUZRUTypeController/message/
  // soapAction: http://ksoe.org/ENSubst150VRUZRUTypeController/action/ENSubst150VRUZRUTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSubst150VRUZRUTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSubst150VRUZRUTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSubst150VRUZRUTypeControllerSoapPort = interface(IInvokable)
  ['{0FC8DBC0-0148-4103-9365-472A3BF57E6E}']
    function add(const aENSubst150VRUZRUType: ENSubst150VRUZRUType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSubst150VRUZRUType: ENSubst150VRUZRUType); stdcall;
    function getObject(const anObjectCode: Integer): ENSubst150VRUZRUType; stdcall;
    function getList: ENSubst150VRUZRUTypeShortList; stdcall;
    function getFilteredList(const aENSubst150VRUZRUTypeFilter: ENSubst150VRUZRUTypeFilter): ENSubst150VRUZRUTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSubst150VRUZRUTypeShortList; stdcall;
    function getScrollableFilteredList(const aENSubst150VRUZRUTypeFilter: ENSubst150VRUZRUTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSubst150VRUZRUTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSubst150VRUZRUTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSubst150VRUZRUTypeFilter: ENSubst150VRUZRUTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSubst150VRUZRUTypeShort; stdcall;
  end;


implementation



  destructor ENSubst150VRUZRUTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSubst150VRUZRUType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150VRUZRUType');
  RemClassRegistry.RegisterXSClass(ENSubst150VRUZRUTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150VRUZRUTypeRef');
  RemClassRegistry.RegisterXSClass(ENSubst150VRUZRUTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150VRUZRUTypeFilter');
  RemClassRegistry.RegisterXSClass(ENSubst150VRUZRUTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150VRUZRUTypeShort');
  RemClassRegistry.RegisterXSClass(ENSubst150VRUZRUTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150VRUZRUTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSubst150VRUZRUTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSubst150VRUZRUTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSubst150VRUZRUTypeControllerSoapPort), 'http://ksoe.org/ENSubst150VRUZRUTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSubst150VRUZRUTypeControllerSoapPort), 'http://ksoe.org/ENSubst150VRUZRUTypeController/action/ENSubst150VRUZRUTypeController.%operationName%');


end.
