unit ENBonusListStatusController;

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

  ENBonusListStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBonusListStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBonusListStatus = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENBonusListStatusFilter = class(TRemotable)
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

  ENBonusListStatusFilter = class(ENBonusListStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENBonusListStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENBonusListStatusShort = array of ENBonusListStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENBonusListStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENBonusListStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENBonusListStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENBonusListStatusController/message/
  // soapAction: http://ksoe.org/ENBonusListStatusController/action/ENBonusListStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENBonusListStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENBonusListStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENBonusListStatusControllerSoapPort = interface(IInvokable)
  ['{8B003B15-EC9A-4B1A-9A28-641D7BB59F1D}']
    function add(const aENBonusListStatus: ENBonusListStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENBonusListStatus: ENBonusListStatus); stdcall;
    function getObject(const anObjectCode: Integer): ENBonusListStatus; stdcall;
    function getList: ENBonusListStatusShortList; stdcall;
    function getFilteredList(const aENBonusListStatusFilter: ENBonusListStatusFilter): ENBonusListStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENBonusListStatusShortList; stdcall;
    function getScrollableFilteredList(const aENBonusListStatusFilter: ENBonusListStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENBonusListStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENBonusListStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENBonusListStatusFilter: ENBonusListStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENBonusListStatusShort; stdcall;
  end;


implementation



  destructor ENBonusListStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENBonusListStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBonusListStatus');
  RemClassRegistry.RegisterXSClass(ENBonusListStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBonusListStatusRef');
  RemClassRegistry.RegisterXSClass(ENBonusListStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBonusListStatusFilter');
  RemClassRegistry.RegisterXSClass(ENBonusListStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBonusListStatusShort');
  RemClassRegistry.RegisterXSClass(ENBonusListStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBonusListStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENBonusListStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENBonusListStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENBonusListStatusControllerSoapPort), 'http://ksoe.org/ENBonusListStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENBonusListStatusControllerSoapPort), 'http://ksoe.org/ENBonusListStatusController/action/ENBonusListStatusController.%operationName%');


end.
