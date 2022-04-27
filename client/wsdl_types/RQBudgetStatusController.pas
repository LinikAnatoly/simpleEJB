unit RQBudgetStatusController;

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
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"

  RQBudgetStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBudgetStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBudgetStatus = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  RQBudgetStatusFilter = class(TRemotable)
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

  RQBudgetStatusFilter = class(RQBudgetStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQBudgetStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQBudgetStatusShort = array of RQBudgetStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQBudgetStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQBudgetStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQBudgetStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQBudgetStatusController/message/
  // soapAction: http://ksoe.org/RQBudgetStatusController/action/RQBudgetStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQBudgetStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQBudgetStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQBudgetStatusControllerSoapPort = interface(IInvokable)
  ['{60A74547-AE93-412D-B264-E93CD5B6061E}']
    function add(const aRQBudgetStatus: RQBudgetStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQBudgetStatus: RQBudgetStatus); stdcall;
    function getObject(const anObjectCode: Integer): RQBudgetStatus; stdcall;
    function getList: RQBudgetStatusShortList; stdcall;
    function getFilteredList(const aRQBudgetStatusFilter: RQBudgetStatusFilter): RQBudgetStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQBudgetStatusShortList; stdcall;
    function getScrollableFilteredList(const aRQBudgetStatusFilter: RQBudgetStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): RQBudgetStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQBudgetStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQBudgetStatusFilter: RQBudgetStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQBudgetStatusShort; stdcall;
  end;


implementation



  destructor RQBudgetStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQBudgetStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBudgetStatus');
  RemClassRegistry.RegisterXSClass(RQBudgetStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBudgetStatusRef');
  RemClassRegistry.RegisterXSClass(RQBudgetStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBudgetStatusFilter');
  RemClassRegistry.RegisterXSClass(RQBudgetStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBudgetStatusShort');
  RemClassRegistry.RegisterXSClass(RQBudgetStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBudgetStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQBudgetStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQBudgetStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(RQBudgetStatusControllerSoapPort), 'http://ksoe.org/RQBudgetStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQBudgetStatusControllerSoapPort), 'http://ksoe.org/RQBudgetStatusController/action/RQBudgetStatusController.%operationName%');


end.
