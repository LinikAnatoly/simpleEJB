unit ENConnectionLocationTypeController;

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

  ENConnectionLocationType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENConnectionLocationTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENConnectionLocationType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENConnectionLocationTypeFilter = class(TRemotable)
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

  ENConnectionLocationTypeFilter = class(ENConnectionLocationType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENConnectionLocationTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENConnectionLocationTypeShort = array of ENConnectionLocationTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENConnectionLocationTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENConnectionLocationTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENConnectionLocationTypeShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENConnectionLocationTypeController/message/
  // soapAction: http://ksoe.org/ENConnectionLocationTypeController/action/ENConnectionLocationTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENConnectionLocationTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENConnectionLocationTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENConnectionLocationTypeControllerSoapPort = interface(IInvokable)
  ['{8DC6A5E3-E428-42D4-B4E3-F72606E18977}']
    function add(const aENConnectionLocationType: ENConnectionLocationType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENConnectionLocationType: ENConnectionLocationType); stdcall;
    function getObject(const anObjectCode: Integer): ENConnectionLocationType; stdcall;
    function getList: ENConnectionLocationTypeShortList; stdcall;
    function getFilteredList(const aENConnectionLocationTypeFilter: ENConnectionLocationTypeFilter): ENConnectionLocationTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENConnectionLocationTypeShortList; stdcall;
    function getScrollableFilteredList(const aENConnectionLocationTypeFilter: ENConnectionLocationTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENConnectionLocationTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENConnectionLocationTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENConnectionLocationTypeFilter: ENConnectionLocationTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENConnectionLocationTypeShort; stdcall;
  end;


implementation



  destructor ENConnectionLocationTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENConnectionLocationType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionLocationType');
  RemClassRegistry.RegisterXSClass(ENConnectionLocationTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionLocationTypeRef');
  RemClassRegistry.RegisterXSClass(ENConnectionLocationTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionLocationTypeFilter');
  RemClassRegistry.RegisterXSClass(ENConnectionLocationTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionLocationTypeShort');
  RemClassRegistry.RegisterXSClass(ENConnectionLocationTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionLocationTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENConnectionLocationTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENConnectionLocationTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENConnectionLocationTypeControllerSoapPort), 'http://ksoe.org/ENConnectionLocationTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENConnectionLocationTypeControllerSoapPort), 'http://ksoe.org/ENConnectionLocationTypeController/action/ENConnectionLocationTypeController.%operationName%');


end.
