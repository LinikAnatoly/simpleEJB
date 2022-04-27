unit ENAct2RQFKOrderTypeController;

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

  ENAct2RQFKOrderType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAct2RQFKOrderTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAct2RQFKOrderType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENAct2RQFKOrderTypeFilter = class(TRemotable)
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

  ENAct2RQFKOrderTypeFilter = class(ENAct2RQFKOrderType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENAct2RQFKOrderTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENAct2RQFKOrderTypeShort = array of ENAct2RQFKOrderTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAct2RQFKOrderTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAct2RQFKOrderTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAct2RQFKOrderTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAct2RQFKOrderTypeController/message/
  // soapAction: http://ksoe.org/ENAct2RQFKOrderTypeController/action/ENAct2RQFKOrderTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAct2RQFKOrderTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAct2RQFKOrderTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAct2RQFKOrderTypeControllerSoapPort = interface(IInvokable)
  ['{F09D4A30-A976-4ADB-890B-55EFAC44577F}']
    function add(const aENAct2RQFKOrderType: ENAct2RQFKOrderType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENAct2RQFKOrderType: ENAct2RQFKOrderType); stdcall;
    function getObject(const anObjectCode: Integer): ENAct2RQFKOrderType; stdcall;
    function getList: ENAct2RQFKOrderTypeShortList; stdcall;
    function getFilteredList(const aENAct2RQFKOrderTypeFilter: ENAct2RQFKOrderTypeFilter): ENAct2RQFKOrderTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAct2RQFKOrderTypeShortList; stdcall;
    function getScrollableFilteredList(const aENAct2RQFKOrderTypeFilter: ENAct2RQFKOrderTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAct2RQFKOrderTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAct2RQFKOrderTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENAct2RQFKOrderTypeFilter: ENAct2RQFKOrderTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENAct2RQFKOrderTypeShort; stdcall;
  end;


implementation



  destructor ENAct2RQFKOrderTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAct2RQFKOrderType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2RQFKOrderType');
  RemClassRegistry.RegisterXSClass(ENAct2RQFKOrderTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2RQFKOrderTypeRef');
  RemClassRegistry.RegisterXSClass(ENAct2RQFKOrderTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2RQFKOrderTypeFilter');
  RemClassRegistry.RegisterXSClass(ENAct2RQFKOrderTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2RQFKOrderTypeShort');
  RemClassRegistry.RegisterXSClass(ENAct2RQFKOrderTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2RQFKOrderTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAct2RQFKOrderTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAct2RQFKOrderTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENAct2RQFKOrderTypeControllerSoapPort), 'http://ksoe.org/ENAct2RQFKOrderTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAct2RQFKOrderTypeControllerSoapPort), 'http://ksoe.org/ENAct2RQFKOrderTypeController/action/ENAct2RQFKOrderTypeController.%operationName%');


end.
