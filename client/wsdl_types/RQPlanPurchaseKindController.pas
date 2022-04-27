unit RQPlanPurchaseKindController;

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

  RQPlanPurchaseKind            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPlanPurchaseKindRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPlanPurchaseKind = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  RQPlanPurchaseKindFilter = class(TRemotable)
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

  RQPlanPurchaseKindFilter = class(RQPlanPurchaseKind)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPlanPurchaseKindShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQPlanPurchaseKindShort = array of RQPlanPurchaseKindShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPlanPurchaseKindShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPlanPurchaseKindShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPlanPurchaseKindShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPlanPurchaseKindController/message/
  // soapAction: http://ksoe.org/RQPlanPurchaseKindController/action/RQPlanPurchaseKindController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPlanPurchaseKindControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPlanPurchaseKindController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPlanPurchaseKindControllerSoapPort = interface(IInvokable)
  ['{CA5F654B-6C87-456A-894E-26C6BADB9FE4}']
    function add(const aRQPlanPurchaseKind: RQPlanPurchaseKind): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPlanPurchaseKind: RQPlanPurchaseKind); stdcall;
    function getObject(const anObjectCode: Integer): RQPlanPurchaseKind; stdcall;
    function getList: RQPlanPurchaseKindShortList; stdcall;
    function getFilteredList(const aRQPlanPurchaseKindFilter: RQPlanPurchaseKindFilter): RQPlanPurchaseKindShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPlanPurchaseKindShortList; stdcall;
    function getScrollableFilteredList(const aRQPlanPurchaseKindFilter: RQPlanPurchaseKindFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPlanPurchaseKindShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPlanPurchaseKindShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPlanPurchaseKindFilter: RQPlanPurchaseKindFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPlanPurchaseKindShort; stdcall;
  end;


implementation



  destructor RQPlanPurchaseKindShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPlanPurchaseKind, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPurchaseKind');
  RemClassRegistry.RegisterXSClass(RQPlanPurchaseKindRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPurchaseKindRef');
  RemClassRegistry.RegisterXSClass(RQPlanPurchaseKindFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPurchaseKindFilter');
  RemClassRegistry.RegisterXSClass(RQPlanPurchaseKindShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPurchaseKindShort');
  RemClassRegistry.RegisterXSClass(RQPlanPurchaseKindShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPurchaseKindShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPlanPurchaseKindShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPlanPurchaseKindShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPlanPurchaseKindControllerSoapPort), 'http://ksoe.org/RQPlanPurchaseKindController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPlanPurchaseKindControllerSoapPort), 'http://ksoe.org/RQPlanPurchaseKindController/action/RQPlanPurchaseKindController.%operationName%');


end.
