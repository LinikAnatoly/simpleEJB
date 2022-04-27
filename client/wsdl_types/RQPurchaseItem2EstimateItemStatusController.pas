unit RQPurchaseItem2EstimateItemStatusController;

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

  RQPurchaseItem2EstimateItemStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPurchaseItem2EstimateItemStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPurchaseItem2EstimateItemStatus = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  RQPurchaseItem2EstimateItemStatusFilter = class(TRemotable)
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

  RQPurchaseItem2EstimateItemStatusFilter = class(RQPurchaseItem2EstimateItemStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPurchaseItem2EstimateItemStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQPurchaseItem2EstimateItemStatusShort = array of RQPurchaseItem2EstimateItemStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPurchaseItem2EstimateItemStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPurchaseItem2EstimateItemStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPurchaseItem2EstimateItemStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPurchaseItem2EstimateItemStatusController/message/
  // soapAction: http://ksoe.org/RQPurchaseItem2EstimateItemStatusController/action/RQPurchaseItem2EstimateItemStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPurchaseItem2EstimateItemStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPurchaseItem2EstimateItemStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPurchaseItem2EstimateItemStatusControllerSoapPort = interface(IInvokable)
  ['{642033B8-932D-4429-A8AD-50556461C184}']
    function add(const aRQPurchaseItem2EstimateItemStatus: RQPurchaseItem2EstimateItemStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPurchaseItem2EstimateItemStatus: RQPurchaseItem2EstimateItemStatus); stdcall;
    function getObject(const anObjectCode: Integer): RQPurchaseItem2EstimateItemStatus; stdcall;
    function getList: RQPurchaseItem2EstimateItemStatusShortList; stdcall;
    function getFilteredList(const aRQPurchaseItem2EstimateItemStatusFilter: RQPurchaseItem2EstimateItemStatusFilter): RQPurchaseItem2EstimateItemStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPurchaseItem2EstimateItemStatusShortList; stdcall;
    function getScrollableFilteredList(const aRQPurchaseItem2EstimateItemStatusFilter: RQPurchaseItem2EstimateItemStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPurchaseItem2EstimateItemStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPurchaseItem2EstimateItemStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPurchaseItem2EstimateItemStatusFilter: RQPurchaseItem2EstimateItemStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPurchaseItem2EstimateItemStatusShort; stdcall;
  end;


implementation



  destructor RQPurchaseItem2EstimateItemStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPurchaseItem2EstimateItemStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItem2EstimateItemStatus');
  RemClassRegistry.RegisterXSClass(RQPurchaseItem2EstimateItemStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItem2EstimateItemStatusRef');
  RemClassRegistry.RegisterXSClass(RQPurchaseItem2EstimateItemStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItem2EstimateItemStatusFilter');
  RemClassRegistry.RegisterXSClass(RQPurchaseItem2EstimateItemStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItem2EstimateItemStatusShort');
  RemClassRegistry.RegisterXSClass(RQPurchaseItem2EstimateItemStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItem2EstimateItemStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPurchaseItem2EstimateItemStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPurchaseItem2EstimateItemStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPurchaseItem2EstimateItemStatusControllerSoapPort), 'http://ksoe.org/RQPurchaseItem2EstimateItemStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPurchaseItem2EstimateItemStatusControllerSoapPort), 'http://ksoe.org/RQPurchaseItem2EstimateItemStatusController/action/RQPurchaseItem2EstimateItemStatusController.%operationName%');


end.
