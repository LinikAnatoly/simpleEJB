unit ENHighVoltHardwareTypeController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
  , ENElementTypeController
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

  ENHighVoltHardwareType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENHighVoltHardwareTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENHighVoltHardwareType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FisObsolete : Integer;
//???
    FelementTypeRef : ENElementTypeRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property isObsolete : Integer read FisObsolete write FisObsolete;
    property elementTypeRef : ENElementTypeRef read FelementTypeRef write FelementTypeRef;
  end;

{
  ENHighVoltHardwareTypeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FisObsolete : Integer;
//???
    FelementTypeRef : ENElementTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property isObsolete : Integer read FisObsolete write FisObsolete;
    property elementTypeRef : ENElementTypeRef read FelementTypeRef write FelementTypeRef;
  end;
}

  ENHighVoltHardwareTypeFilter = class(ENHighVoltHardwareType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENHighVoltHardwareTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FisObsolete : Integer;
    FelementTypeRefCode : Integer;
    FelementTypeRefName : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property  isObsolete : Integer read FisObsolete write FisObsolete;

    property elementTypeRefCode : Integer read FelementTypeRefCode write FelementTypeRefCode;
    property elementTypeRefName : WideString read FelementTypeRefName write FelementTypeRefName;
  end;

  ArrayOfENHighVoltHardwareTypeShort = array of ENHighVoltHardwareTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENHighVoltHardwareTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENHighVoltHardwareTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENHighVoltHardwareTypeShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENHighVoltHardwareTypeController/message/
  // soapAction: http://ksoe.org/ENHighVoltHardwareTypeController/action/ENHighVoltHardwareTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENHighVoltHardwareTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENHighVoltHardwareTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENHighVoltHardwareTypeControllerSoapPort = interface(IInvokable)
  ['{B813F2F8-A0F4-4763-94AF-94687F736112}']
    function add(const aENHighVoltHardwareType: ENHighVoltHardwareType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENHighVoltHardwareType: ENHighVoltHardwareType); stdcall;
    function getObject(const anObjectCode: Integer): ENHighVoltHardwareType; stdcall;
    function getList: ENHighVoltHardwareTypeShortList; stdcall;
    function getFilteredList(const aENHighVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter): ENHighVoltHardwareTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENHighVoltHardwareTypeShortList; stdcall;
    function getScrollableFilteredList(const aENHighVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENHighVoltHardwareTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENHighVoltHardwareTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENHighVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENHighVoltHardwareTypeShort; stdcall;
  end;


implementation

  destructor ENHighVoltHardwareType.Destroy;
  begin
    if Assigned(FelementTypeRef) then
      elementTypeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENHighVoltHardwareTypeFilter.Destroy;
  begin
    if Assigned(FelementTypeRef) then
      elementTypeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENHighVoltHardwareTypeFilter.Destroy;
  begin
    inherited Destroy;
  end;


  destructor ENHighVoltHardwareTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENHighVoltHardwareType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHighVoltHardwareType');
  RemClassRegistry.RegisterXSClass(ENHighVoltHardwareTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHighVoltHardwareTypeRef');
  RemClassRegistry.RegisterXSClass(ENHighVoltHardwareTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHighVoltHardwareTypeFilter');
  RemClassRegistry.RegisterXSClass(ENHighVoltHardwareTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHighVoltHardwareTypeShort');
  RemClassRegistry.RegisterXSClass(ENHighVoltHardwareTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHighVoltHardwareTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENHighVoltHardwareTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENHighVoltHardwareTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENHighVoltHardwareTypeControllerSoapPort), 'http://ksoe.org/ENHighVoltHardwareTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENHighVoltHardwareTypeControllerSoapPort), 'http://ksoe.org/ENHighVoltHardwareTypeController/action/ENHighVoltHardwareTypeController.%operationName%');


end.
