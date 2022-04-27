unit ENBuildingCommissionTypeController;

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

  ENBuildingCommissionType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBuildingCommissionTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBuildingCommissionType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENBuildingCommissionTypeFilter = class(TRemotable)
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

  ENBuildingCommissionTypeFilter = class(ENBuildingCommissionType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENBuildingCommissionTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENBuildingCommissionTypeShort = array of ENBuildingCommissionTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENBuildingCommissionTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENBuildingCommissionTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENBuildingCommissionTypeShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENBuildingCommissionTypeController/message/
  // soapAction: http://ksoe.org/ENBuildingCommissionTypeController/action/ENBuildingCommissionTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENBuildingCommissionTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENBuildingCommissionTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENBuildingCommissionTypeControllerSoapPort = interface(IInvokable)
  ['{6DCD53EA-DD8B-40D8-BE87-5B2B62A179B4}']
    function add(const aENBuildingCommissionType: ENBuildingCommissionType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENBuildingCommissionType: ENBuildingCommissionType); stdcall;
    function getObject(const anObjectCode: Integer): ENBuildingCommissionType; stdcall;
    function getList: ENBuildingCommissionTypeShortList; stdcall;
    function getFilteredList(const aENBuildingCommissionTypeFilter: ENBuildingCommissionTypeFilter): ENBuildingCommissionTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENBuildingCommissionTypeShortList; stdcall;
    function getScrollableFilteredList(const aENBuildingCommissionTypeFilter: ENBuildingCommissionTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENBuildingCommissionTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENBuildingCommissionTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENBuildingCommissionTypeFilter: ENBuildingCommissionTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENBuildingCommissionTypeShort; stdcall;
  end;


implementation



  destructor ENBuildingCommissionTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENBuildingCommissionType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuildingCommissionType');
  RemClassRegistry.RegisterXSClass(ENBuildingCommissionTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuildingCommissionTypeRef');
  RemClassRegistry.RegisterXSClass(ENBuildingCommissionTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuildingCommissionTypeFilter');
  RemClassRegistry.RegisterXSClass(ENBuildingCommissionTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuildingCommissionTypeShort');
  RemClassRegistry.RegisterXSClass(ENBuildingCommissionTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuildingCommissionTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENBuildingCommissionTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENBuildingCommissionTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENBuildingCommissionTypeControllerSoapPort), 'http://ksoe.org/ENBuildingCommissionTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENBuildingCommissionTypeControllerSoapPort), 'http://ksoe.org/ENBuildingCommissionTypeController/action/ENBuildingCommissionTypeController.%operationName%');


end.
