unit RQOrder2OrderStatusController;

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

  RQOrder2OrderStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrder2OrderStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrder2OrderStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  RQOrder2OrderStatusFilter = class(TRemotable)
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


  RQOrder2OrderStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQOrder2OrderStatusShort = array of RQOrder2OrderStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOrder2OrderStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOrder2OrderStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOrder2OrderStatusShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOrder2OrderStatusController/message/
  // soapAction: http://ksoe.org/RQOrder2OrderStatusController/action/RQOrder2OrderStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOrder2OrderStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOrder2OrderStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOrder2OrderStatusControllerSoapPort = interface(IInvokable)
  ['{1e151e15-1e15-1e15-1e15-1e151e151e15}']
    function  add(const aRQOrder2OrderStatus: RQOrder2OrderStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOrder2OrderStatus: RQOrder2OrderStatus); stdcall;
    function  getObject(const anObjectCode: Integer): RQOrder2OrderStatus; stdcall;
    function  getList: RQOrder2OrderStatusShortList; stdcall;
    function  getFilteredList(const aRQOrder2OrderStatusFilter: RQOrder2OrderStatusFilter): RQOrder2OrderStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOrder2OrderStatusShortList; stdcall;
    function  getScrollableFilteredList(const aRQOrder2OrderStatusFilter: RQOrder2OrderStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrder2OrderStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOrder2OrderStatusShortList; stdcall;
  end; 


implementation

  
  
  destructor RQOrder2OrderStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOrder2OrderStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2OrderStatus');
  RemClassRegistry.RegisterXSClass(RQOrder2OrderStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2OrderStatusRef');
  RemClassRegistry.RegisterXSClass(RQOrder2OrderStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2OrderStatusFilter');
  RemClassRegistry.RegisterXSClass(RQOrder2OrderStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2OrderStatusShort');
  RemClassRegistry.RegisterXSClass(RQOrder2OrderStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2OrderStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOrder2OrderStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOrder2OrderStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOrder2OrderStatusControllerSoapPort), 'http://ksoe.org/RQOrder2OrderStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOrder2OrderStatusControllerSoapPort), 'http://ksoe.org/RQOrder2OrderStatusController/action/RQOrder2OrderStatusController.%operationName%');


end.
