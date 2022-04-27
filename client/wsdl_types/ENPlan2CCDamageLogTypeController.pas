unit ENPlan2CCDamageLogTypeController;

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

  ENPlan2CCDamageLogType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlan2CCDamageLogTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlan2CCDamageLogType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENPlan2CCDamageLogTypeFilter = class(TRemotable)
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

  ENPlan2CCDamageLogTypeFilter = class(ENPlan2CCDamageLogType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPlan2CCDamageLogTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENPlan2CCDamageLogTypeShort = array of ENPlan2CCDamageLogTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlan2CCDamageLogTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlan2CCDamageLogTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlan2CCDamageLogTypeShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlan2CCDamageLogTypeController/message/
  // soapAction: http://ksoe.org/ENPlan2CCDamageLogTypeController/action/ENPlan2CCDamageLogTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlan2CCDamageLogTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlan2CCDamageLogTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlan2CCDamageLogTypeControllerSoapPort = interface(IInvokable)
  ['{9BB86318-C5C2-43F9-8CB1-0CB33D515223}']
    function add(const aENPlan2CCDamageLogType: ENPlan2CCDamageLogType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlan2CCDamageLogType: ENPlan2CCDamageLogType); stdcall;
    function getObject(const anObjectCode: Integer): ENPlan2CCDamageLogType; stdcall;
    function getList: ENPlan2CCDamageLogTypeShortList; stdcall;
    function getFilteredList(const aENPlan2CCDamageLogTypeFilter: ENPlan2CCDamageLogTypeFilter): ENPlan2CCDamageLogTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlan2CCDamageLogTypeShortList; stdcall;
    function getScrollableFilteredList(const aENPlan2CCDamageLogTypeFilter: ENPlan2CCDamageLogTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlan2CCDamageLogTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlan2CCDamageLogTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENPlan2CCDamageLogTypeFilter: ENPlan2CCDamageLogTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENPlan2CCDamageLogTypeShort; stdcall;
  end;


implementation



  destructor ENPlan2CCDamageLogTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlan2CCDamageLogType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlan2CCDamageLogType');
  RemClassRegistry.RegisterXSClass(ENPlan2CCDamageLogTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlan2CCDamageLogTypeRef');
  RemClassRegistry.RegisterXSClass(ENPlan2CCDamageLogTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlan2CCDamageLogTypeFilter');
  RemClassRegistry.RegisterXSClass(ENPlan2CCDamageLogTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlan2CCDamageLogTypeShort');
  RemClassRegistry.RegisterXSClass(ENPlan2CCDamageLogTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlan2CCDamageLogTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlan2CCDamageLogTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlan2CCDamageLogTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlan2CCDamageLogTypeControllerSoapPort), 'http://ksoe.org/ENPlan2CCDamageLogTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlan2CCDamageLogTypeControllerSoapPort), 'http://ksoe.org/ENPlan2CCDamageLogTypeController/action/ENPlan2CCDamageLogTypeController.%operationName%');


end.
