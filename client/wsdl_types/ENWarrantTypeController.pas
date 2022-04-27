unit ENWarrantTypeController;

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

  ENWarrantType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWarrantTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWarrantType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENWarrantTypeFilter = class(TRemotable)
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

  ENWarrantTypeFilter = class(ENWarrantType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENWarrantTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENWarrantTypeShort = array of ENWarrantTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENWarrantTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENWarrantTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENWarrantTypeShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENWarrantTypeController/message/
  // soapAction: http://ksoe.org/ENWarrantTypeController/action/ENWarrantTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENWarrantTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENWarrantTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENWarrantTypeControllerSoapPort = interface(IInvokable)
  ['{5F558635-625D-456D-8928-A6C08E69CD43}']
    function add(const aENWarrantType: ENWarrantType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENWarrantType: ENWarrantType); stdcall;
    function getObject(const anObjectCode: Integer): ENWarrantType; stdcall;
    function getList: ENWarrantTypeShortList; stdcall;
    function getFilteredList(const aENWarrantTypeFilter: ENWarrantTypeFilter): ENWarrantTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENWarrantTypeShortList; stdcall;
    function getScrollableFilteredList(const aENWarrantTypeFilter: ENWarrantTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENWarrantTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENWarrantTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENWarrantTypeFilter: ENWarrantTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENWarrantTypeShort; stdcall;
  end;


implementation



  destructor ENWarrantTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENWarrantType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWarrantType');
  RemClassRegistry.RegisterXSClass(ENWarrantTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWarrantTypeRef');
  RemClassRegistry.RegisterXSClass(ENWarrantTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWarrantTypeFilter');
  RemClassRegistry.RegisterXSClass(ENWarrantTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWarrantTypeShort');
  RemClassRegistry.RegisterXSClass(ENWarrantTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWarrantTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENWarrantTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENWarrantTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENWarrantTypeControllerSoapPort), 'http://ksoe.org/ENWarrantTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENWarrantTypeControllerSoapPort), 'http://ksoe.org/ENWarrantTypeController/action/ENWarrantTypeController.%operationName%');


end.
