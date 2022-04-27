unit RQOrderItem2ENEstimateItemStatusController;

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

  RQOrderItem2ENEstimateItemStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderItem2ENEstimateItemStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderItem2ENEstimateItemStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  RQOrderItem2ENEstimateItemStatusFilter = class(TRemotable)
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


  RQOrderItem2ENEstimateItemStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQOrderItem2ENEstimateItemStatusShort = array of RQOrderItem2ENEstimateItemStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOrderItem2ENEstimateItemStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOrderItem2ENEstimateItemStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOrderItem2ENEstimateItemStatusShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOrderItem2ENEstimateItemStatusController/message/
  // soapAction: http://ksoe.org/RQOrderItem2ENEstimateItemStatusController/action/RQOrderItem2ENEstimateItemStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOrderItem2ENEstimateItemStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOrderItem2ENEstimateItemStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOrderItem2ENEstimateItemStatusControllerSoapPort = interface(IInvokable)
  ['{7f317f31-7f31-7f31-7f31-7f317f317f31}']
    function  add(const aRQOrderItem2ENEstimateItemStatus: RQOrderItem2ENEstimateItemStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOrderItem2ENEstimateItemStatus: RQOrderItem2ENEstimateItemStatus); stdcall;
    function  getObject(const anObjectCode: Integer): RQOrderItem2ENEstimateItemStatus; stdcall;
    function  getList: RQOrderItem2ENEstimateItemStatusShortList; stdcall;
    function  getFilteredList(const aRQOrderItem2ENEstimateItemStatusFilter: RQOrderItem2ENEstimateItemStatusFilter): RQOrderItem2ENEstimateItemStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOrderItem2ENEstimateItemStatusShortList; stdcall;
    function  getScrollableFilteredList(const aRQOrderItem2ENEstimateItemStatusFilter: RQOrderItem2ENEstimateItemStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrderItem2ENEstimateItemStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOrderItem2ENEstimateItemStatusShortList; stdcall;
  end; 


implementation

  
  
  destructor RQOrderItem2ENEstimateItemStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOrderItem2ENEstimateItemStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItem2ENEstimateItemStatus');
  RemClassRegistry.RegisterXSClass(RQOrderItem2ENEstimateItemStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItem2ENEstimateItemStatusRef');
  RemClassRegistry.RegisterXSClass(RQOrderItem2ENEstimateItemStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItem2ENEstimateItemStatusFilter');
  RemClassRegistry.RegisterXSClass(RQOrderItem2ENEstimateItemStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItem2ENEstimateItemStatusShort');
  RemClassRegistry.RegisterXSClass(RQOrderItem2ENEstimateItemStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItem2ENEstimateItemStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOrderItem2ENEstimateItemStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOrderItem2ENEstimateItemStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOrderItem2ENEstimateItemStatusControllerSoapPort), 'http://ksoe.org/RQOrderItem2ENEstimateItemStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOrderItem2ENEstimateItemStatusControllerSoapPort), 'http://ksoe.org/RQOrderItem2ENEstimateItemStatusController/action/RQOrderItem2ENEstimateItemStatusController.%operationName%');


end.
