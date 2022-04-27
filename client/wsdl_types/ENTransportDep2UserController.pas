unit ENTransportDep2UserController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENTransportDepartmentController
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

  ENTransportDep2User            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportDep2UserRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportDep2User = class(TRemotable)
  private
    Fcode : Integer;
    FuserCode : Integer;
//???
    FtransportDepartment : ENTransportDepartment;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property userCode : Integer read FuserCode write FuserCode;
    property transportDepartment : ENTransportDepartment read FtransportDepartment write FtransportDepartment;
  end;

{
  ENTransportDep2UserFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FuserCode : Integer;
//???
    FtransportDepartment : ENTransportDepartment;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property userCode : Integer read FuserCode write FuserCode;
    property transportDepartment : ENTransportDepartment read FtransportDepartment write FtransportDepartment;
  end;
}

  ENTransportDep2UserFilter = class(ENTransportDep2User)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENTransportDep2UserShort = class(TRemotable)
  private
    Fcode : Integer;
    FtransportDepartmentCode : Integer;
    FtransportDepartmentName : WideString;
  published
    property  code : Integer read Fcode write Fcode;

    property transportDepartmentCode : Integer read FtransportDepartmentCode write FtransportDepartmentCode;
    property transportDepartmentName : WideString read FtransportDepartmentName write FtransportDepartmentName;
  end;

  ArrayOfENTransportDep2UserShort = array of ENTransportDep2UserShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTransportDep2UserShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTransportDep2UserShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTransportDep2UserShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTransportDep2UserController/message/
  // soapAction: http://ksoe.org/ENTransportDep2UserController/action/ENTransportDep2UserController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTransportDep2UserControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTransportDep2UserController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTransportDep2UserControllerSoapPort = interface(IInvokable)
  ['{F8AE526C-49C3-4E04-8173-8961ABC56042}']
    function add(const aENTransportDep2User: ENTransportDep2User): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTransportDep2User: ENTransportDep2User); stdcall;
    function getObject(const anObjectCode: Integer): ENTransportDep2User; stdcall;
    function getList: ENTransportDep2UserShortList; stdcall;
    function getFilteredList(const aENTransportDep2UserFilter: ENTransportDep2UserFilter): ENTransportDep2UserShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTransportDep2UserShortList; stdcall;
    function getScrollableFilteredList(const aENTransportDep2UserFilter: ENTransportDep2UserFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTransportDep2UserShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTransportDep2UserShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENTransportDep2UserFilter: ENTransportDep2UserFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENTransportDep2UserShort; stdcall;
  end;


implementation

  destructor ENTransportDep2User.Destroy;
  begin
    if Assigned(FtransportDepartment) then
      transportDepartment.Free;
    inherited Destroy;
  end;

{
  destructor ENTransportDep2UserFilter.Destroy;
  begin
    if Assigned(FtransportDepartment) then
      transportDepartment.Free;
    inherited Destroy;
  end;
}

  destructor ENTransportDep2UserFilter.Destroy;
  begin
    inherited Destroy;
  end;


  destructor ENTransportDep2UserShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTransportDep2User, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportDep2User');
  RemClassRegistry.RegisterXSClass(ENTransportDep2UserRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportDep2UserRef');
  RemClassRegistry.RegisterXSClass(ENTransportDep2UserFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportDep2UserFilter');
  RemClassRegistry.RegisterXSClass(ENTransportDep2UserShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportDep2UserShort');
  RemClassRegistry.RegisterXSClass(ENTransportDep2UserShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportDep2UserShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTransportDep2UserShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTransportDep2UserShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTransportDep2UserControllerSoapPort), 'http://ksoe.org/ENTransportDep2UserController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTransportDep2UserControllerSoapPort), 'http://ksoe.org/ENTransportDep2UserController/action/ENTransportDep2UserController.%operationName%');


end.
