unit RQPlanPurchaseStatusController;

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

  RQPlanPurchaseStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPlanPurchaseStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPlanPurchaseStatus = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  RQPlanPurchaseStatusFilter = class(TRemotable)
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

  RQPlanPurchaseStatusFilter = class(RQPlanPurchaseStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPlanPurchaseStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQPlanPurchaseStatusShort = array of RQPlanPurchaseStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPlanPurchaseStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPlanPurchaseStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPlanPurchaseStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPlanPurchaseStatusController/message/
  // soapAction: http://ksoe.org/RQPlanPurchaseStatusController/action/RQPlanPurchaseStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPlanPurchaseStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPlanPurchaseStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPlanPurchaseStatusControllerSoapPort = interface(IInvokable)
  ['{D3DBE033-B9B9-46AE-BA2C-69995C797884}']
    function add(const aRQPlanPurchaseStatus: RQPlanPurchaseStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPlanPurchaseStatus: RQPlanPurchaseStatus); stdcall;
    function getObject(const anObjectCode: Integer): RQPlanPurchaseStatus; stdcall;
    function getList: RQPlanPurchaseStatusShortList; stdcall;
    function getFilteredList(const aRQPlanPurchaseStatusFilter: RQPlanPurchaseStatusFilter): RQPlanPurchaseStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPlanPurchaseStatusShortList; stdcall;
    function getScrollableFilteredList(const aRQPlanPurchaseStatusFilter: RQPlanPurchaseStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPlanPurchaseStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPlanPurchaseStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPlanPurchaseStatusFilter: RQPlanPurchaseStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPlanPurchaseStatusShort; stdcall;
  end;


implementation



  destructor RQPlanPurchaseStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPlanPurchaseStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPurchaseStatus');
  RemClassRegistry.RegisterXSClass(RQPlanPurchaseStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPurchaseStatusRef');
  RemClassRegistry.RegisterXSClass(RQPlanPurchaseStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPurchaseStatusFilter');
  RemClassRegistry.RegisterXSClass(RQPlanPurchaseStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPurchaseStatusShort');
  RemClassRegistry.RegisterXSClass(RQPlanPurchaseStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPurchaseStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPlanPurchaseStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPlanPurchaseStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPlanPurchaseStatusControllerSoapPort), 'http://ksoe.org/RQPlanPurchaseStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPlanPurchaseStatusControllerSoapPort), 'http://ksoe.org/RQPlanPurchaseStatusController/action/RQPlanPurchaseStatusController.%operationName%');


end.
