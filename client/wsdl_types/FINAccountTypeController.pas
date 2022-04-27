unit FINAccountTypeController;

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

  FINAccountType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINAccountTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINAccountType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  FINAccountTypeFilter = class(TRemotable)
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

  FINAccountTypeFilter = class(FINAccountType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  FINAccountTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfFINAccountTypeShort = array of FINAccountTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  FINAccountTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfFINAccountTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfFINAccountTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/FINAccountTypeController/message/
  // soapAction: http://ksoe.org/FINAccountTypeController/action/FINAccountTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : FINAccountTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : FINAccountTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  FINAccountTypeControllerSoapPort = interface(IInvokable)
  ['{535C6AE8-5139-4F09-AF9C-D22F39F3F78E}']
    function add(const aFINAccountType: FINAccountType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aFINAccountType: FINAccountType); stdcall;
    function getObject(const anObjectCode: Integer): FINAccountType; stdcall;
    function getList: FINAccountTypeShortList; stdcall;
    function getFilteredList(const aFINAccountTypeFilter: FINAccountTypeFilter): FINAccountTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): FINAccountTypeShortList; stdcall;
    function getScrollableFilteredList(const aFINAccountTypeFilter: FINAccountTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): FINAccountTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): FINAccountTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aFINAccountTypeFilter: FINAccountTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): FINAccountTypeShort; stdcall;
  end;


implementation



  destructor FINAccountTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(FINAccountType, 'http://ksoe.org/EnergyproControllerService/type/', 'FINAccountType');
  RemClassRegistry.RegisterXSClass(FINAccountTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'FINAccountTypeRef');
  RemClassRegistry.RegisterXSClass(FINAccountTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'FINAccountTypeFilter');
  RemClassRegistry.RegisterXSClass(FINAccountTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'FINAccountTypeShort');
  RemClassRegistry.RegisterXSClass(FINAccountTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'FINAccountTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFINAccountTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfFINAccountTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(FINAccountTypeControllerSoapPort), 'http://ksoe.org/FINAccountTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(FINAccountTypeControllerSoapPort), 'http://ksoe.org/FINAccountTypeController/action/FINAccountTypeController.%operationName%');


end.
