unit ENElement2ENElementTypeController;

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

  ENElement2ENElementType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENElement2ENElementTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENElement2ENElementType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENElement2ENElementTypeFilter = class(TRemotable)
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

  ENElement2ENElementTypeFilter = class(ENElement2ENElementType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENElement2ENElementTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENElement2ENElementTypeShort = array of ENElement2ENElementTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENElement2ENElementTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENElement2ENElementTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENElement2ENElementTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENElement2ENElementTypeController/message/
  // soapAction: http://ksoe.org/ENElement2ENElementTypeController/action/ENElement2ENElementTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENElement2ENElementTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENElement2ENElementTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENElement2ENElementTypeControllerSoapPort = interface(IInvokable)
  ['{74AF4137-7145-4836-B79A-3C5BFA4C6727}']
    function add(const aENElement2ENElementType: ENElement2ENElementType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENElement2ENElementType: ENElement2ENElementType); stdcall;
    function getObject(const anObjectCode: Integer): ENElement2ENElementType; stdcall;
    function getList: ENElement2ENElementTypeShortList; stdcall;
    function getFilteredList(const aENElement2ENElementTypeFilter: ENElement2ENElementTypeFilter): ENElement2ENElementTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENElement2ENElementTypeShortList; stdcall;
    function getScrollableFilteredList(const aENElement2ENElementTypeFilter: ENElement2ENElementTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENElement2ENElementTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENElement2ENElementTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENElement2ENElementTypeFilter: ENElement2ENElementTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENElement2ENElementTypeShort; stdcall;
  end;


implementation



  destructor ENElement2ENElementTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENElement2ENElementType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2ENElementType');
  RemClassRegistry.RegisterXSClass(ENElement2ENElementTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2ENElementTypeRef');
  RemClassRegistry.RegisterXSClass(ENElement2ENElementTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2ENElementTypeFilter');
  RemClassRegistry.RegisterXSClass(ENElement2ENElementTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2ENElementTypeShort');
  RemClassRegistry.RegisterXSClass(ENElement2ENElementTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2ENElementTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENElement2ENElementTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENElement2ENElementTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENElement2ENElementTypeControllerSoapPort), 'http://ksoe.org/ENElement2ENElementTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENElement2ENElementTypeControllerSoapPort), 'http://ksoe.org/ENElement2ENElementTypeController/action/ENElement2ENElementTypeController.%operationName%');


end.
