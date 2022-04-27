unit ENConnectionCityTypeController;

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

  ENConnectionCityType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENConnectionCityTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENConnectionCityType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENConnectionCityTypeFilter = class(TRemotable)
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

  ENConnectionCityTypeFilter = class(ENConnectionCityType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENConnectionCityTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENConnectionCityTypeShort = array of ENConnectionCityTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENConnectionCityTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENConnectionCityTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENConnectionCityTypeShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENConnectionCityTypeController/message/
  // soapAction: http://ksoe.org/ENConnectionCityTypeController/action/ENConnectionCityTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENConnectionCityTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENConnectionCityTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENConnectionCityTypeControllerSoapPort = interface(IInvokable)
  ['{49FE6B93-08D2-4037-9463-7CBE077412C3}']
    function add(const aENConnectionCityType: ENConnectionCityType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENConnectionCityType: ENConnectionCityType); stdcall;
    function getObject(const anObjectCode: Integer): ENConnectionCityType; stdcall;
    function getList: ENConnectionCityTypeShortList; stdcall;
    function getFilteredList(const aENConnectionCityTypeFilter: ENConnectionCityTypeFilter): ENConnectionCityTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENConnectionCityTypeShortList; stdcall;
    function getScrollableFilteredList(const aENConnectionCityTypeFilter: ENConnectionCityTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENConnectionCityTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENConnectionCityTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENConnectionCityTypeFilter: ENConnectionCityTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENConnectionCityTypeShort; stdcall;
  end;


implementation



  destructor ENConnectionCityTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENConnectionCityType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionCityType');
  RemClassRegistry.RegisterXSClass(ENConnectionCityTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionCityTypeRef');
  RemClassRegistry.RegisterXSClass(ENConnectionCityTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionCityTypeFilter');
  RemClassRegistry.RegisterXSClass(ENConnectionCityTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionCityTypeShort');
  RemClassRegistry.RegisterXSClass(ENConnectionCityTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionCityTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENConnectionCityTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENConnectionCityTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENConnectionCityTypeControllerSoapPort), 'http://ksoe.org/ENConnectionCityTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENConnectionCityTypeControllerSoapPort), 'http://ksoe.org/ENConnectionCityTypeController/action/ENConnectionCityTypeController.%operationName%');


end.
