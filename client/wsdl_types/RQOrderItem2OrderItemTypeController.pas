unit RQOrderItem2OrderItemTypeController;

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

  RQOrderItem2OrderItemType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderItem2OrderItemTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderItem2OrderItemType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  RQOrderItem2OrderItemTypeFilter = class(TRemotable)
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


  RQOrderItem2OrderItemTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQOrderItem2OrderItemTypeShort = array of RQOrderItem2OrderItemTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOrderItem2OrderItemTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOrderItem2OrderItemTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOrderItem2OrderItemTypeShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOrderItem2OrderItemTypeController/message/
  // soapAction: http://ksoe.org/RQOrderItem2OrderItemTypeController/action/RQOrderItem2OrderItemTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOrderItem2OrderItemTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOrderItem2OrderItemTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOrderItem2OrderItemTypeControllerSoapPort = interface(IInvokable)
  ['{14b314b3-14b3-14b3-14b3-14b314b314b3}']
    function  add(const aRQOrderItem2OrderItemType: RQOrderItem2OrderItemType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOrderItem2OrderItemType: RQOrderItem2OrderItemType); stdcall;
    function  getObject(const anObjectCode: Integer): RQOrderItem2OrderItemType; stdcall;
    function  getList: RQOrderItem2OrderItemTypeShortList; stdcall;
    function  getFilteredList(const aRQOrderItem2OrderItemTypeFilter: RQOrderItem2OrderItemTypeFilter): RQOrderItem2OrderItemTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOrderItem2OrderItemTypeShortList; stdcall;
    function  getScrollableFilteredList(const aRQOrderItem2OrderItemTypeFilter: RQOrderItem2OrderItemTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrderItem2OrderItemTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOrderItem2OrderItemTypeShortList; stdcall;
  end; 


implementation

  
  
  destructor RQOrderItem2OrderItemTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOrderItem2OrderItemType, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItem2OrderItemType');
  RemClassRegistry.RegisterXSClass(RQOrderItem2OrderItemTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItem2OrderItemTypeRef');
  RemClassRegistry.RegisterXSClass(RQOrderItem2OrderItemTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItem2OrderItemTypeFilter');
  RemClassRegistry.RegisterXSClass(RQOrderItem2OrderItemTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItem2OrderItemTypeShort');
  RemClassRegistry.RegisterXSClass(RQOrderItem2OrderItemTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItem2OrderItemTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOrderItem2OrderItemTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOrderItem2OrderItemTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOrderItem2OrderItemTypeControllerSoapPort), 'http://ksoe.org/RQOrderItem2OrderItemTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOrderItem2OrderItemTypeControllerSoapPort), 'http://ksoe.org/RQOrderItem2OrderItemTypeController/action/RQOrderItem2OrderItemTypeController.%operationName%');


end.
