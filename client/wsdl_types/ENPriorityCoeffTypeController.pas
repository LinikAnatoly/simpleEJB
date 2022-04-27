unit ENPriorityCoeffTypeController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
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

  ENPriorityCoeffType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPriorityCoeffTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPriorityCoeffType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENPriorityCoeffTypeFilter = class(TRemotable)
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

  ENPriorityCoeffTypeFilter = class(ENPriorityCoeffType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPriorityCoeffTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENPriorityCoeffTypeShort = array of ENPriorityCoeffTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPriorityCoeffTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPriorityCoeffTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPriorityCoeffTypeShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPriorityCoeffTypeController/message/
  // soapAction: http://ksoe.org/ENPriorityCoeffTypeController/action/ENPriorityCoeffTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPriorityCoeffTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPriorityCoeffTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPriorityCoeffTypeControllerSoapPort = interface(IInvokable)
  ['{DF830715-F1C6-4473-AD14-7746F36A45DD}']
    function add(const aENPriorityCoeffType: ENPriorityCoeffType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPriorityCoeffType: ENPriorityCoeffType); stdcall;
    function getObject(const anObjectCode: Integer): ENPriorityCoeffType; stdcall;
    function getList: ENPriorityCoeffTypeShortList; stdcall;
    function getFilteredList(const aENPriorityCoeffTypeFilter: ENPriorityCoeffTypeFilter): ENPriorityCoeffTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPriorityCoeffTypeShortList; stdcall;
    function getScrollableFilteredList(const aENPriorityCoeffTypeFilter: ENPriorityCoeffTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPriorityCoeffTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPriorityCoeffTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENPriorityCoeffTypeFilter: ENPriorityCoeffTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENPriorityCoeffTypeShort; stdcall;
  end;


implementation



  destructor ENPriorityCoeffTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPriorityCoeffType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPriorityCoeffType');
  RemClassRegistry.RegisterXSClass(ENPriorityCoeffTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPriorityCoeffTypeRef');
  RemClassRegistry.RegisterXSClass(ENPriorityCoeffTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPriorityCoeffTypeFilter');
  RemClassRegistry.RegisterXSClass(ENPriorityCoeffTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPriorityCoeffTypeShort');
  RemClassRegistry.RegisterXSClass(ENPriorityCoeffTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPriorityCoeffTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPriorityCoeffTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPriorityCoeffTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPriorityCoeffTypeControllerSoapPort), 'http://ksoe.org/ENPriorityCoeffTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPriorityCoeffTypeControllerSoapPort), 'http://ksoe.org/ENPriorityCoeffTypeController/action/ENPriorityCoeffTypeController.%operationName%');


end.
