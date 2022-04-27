unit RQPlanPayItemStatusController;

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

  RQPlanPayItemStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPlanPayItemStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPlanPayItemStatus = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  RQPlanPayItemStatusFilter = class(TRemotable)
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

  RQPlanPayItemStatusFilter = class(RQPlanPayItemStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPlanPayItemStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQPlanPayItemStatusShort = array of RQPlanPayItemStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPlanPayItemStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPlanPayItemStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPlanPayItemStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPlanPayItemStatusController/message/
  // soapAction: http://ksoe.org/RQPlanPayItemStatusController/action/RQPlanPayItemStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPlanPayItemStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPlanPayItemStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPlanPayItemStatusControllerSoapPort = interface(IInvokable)
  ['{10dc10dc-10dc-10dc-10dc-10dc10dc10dc}']
    function add(const aRQPlanPayItemStatus: RQPlanPayItemStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPlanPayItemStatus: RQPlanPayItemStatus); stdcall;
    function getObject(const anObjectCode: Integer): RQPlanPayItemStatus; stdcall;
    function getList: RQPlanPayItemStatusShortList; stdcall;
    function getFilteredList(const aRQPlanPayItemStatusFilter: RQPlanPayItemStatusFilter): RQPlanPayItemStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPlanPayItemStatusShortList; stdcall;
    function getScrollableFilteredList(const aRQPlanPayItemStatusFilter: RQPlanPayItemStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPlanPayItemStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPlanPayItemStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPlanPayItemStatusFilter: RQPlanPayItemStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPlanPayItemStatusShort; stdcall;
  end;


implementation



  destructor RQPlanPayItemStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPlanPayItemStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayItemStatus');
  RemClassRegistry.RegisterXSClass(RQPlanPayItemStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayItemStatusRef');
  RemClassRegistry.RegisterXSClass(RQPlanPayItemStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayItemStatusFilter');
  RemClassRegistry.RegisterXSClass(RQPlanPayItemStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayItemStatusShort');
  RemClassRegistry.RegisterXSClass(RQPlanPayItemStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayItemStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPlanPayItemStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPlanPayItemStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPlanPayItemStatusControllerSoapPort), 'http://ksoe.org/RQPlanPayItemStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPlanPayItemStatusControllerSoapPort), 'http://ksoe.org/RQPlanPayItemStatusController/action/RQPlanPayItemStatusController.%operationName%');


end.
