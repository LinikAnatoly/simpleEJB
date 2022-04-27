unit RQOrderStatusController;

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

  RQOrderStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  RQOrderStatusFilter = class(TRemotable)
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


  RQOrderStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQOrderStatusShort = array of RQOrderStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOrderStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOrderStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOrderStatusShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOrderStatusController/message/
  // soapAction: http://ksoe.org/RQOrderStatusController/action/RQOrderStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOrderStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOrderStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOrderStatusControllerSoapPort = interface(IInvokable)
  ['{10701070-1070-1070-1070-107010701070}']
    function  add(const aRQOrderStatus: RQOrderStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOrderStatus: RQOrderStatus); stdcall;
    function  getObject(const anObjectCode: Integer): RQOrderStatus; stdcall;
    function  getList: RQOrderStatusShortList; stdcall;
    function  getFilteredList(const aRQOrderStatusFilter: RQOrderStatusFilter): RQOrderStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOrderStatusShortList; stdcall;
    function  getScrollableFilteredList(const aRQOrderStatusFilter: RQOrderStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrderStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOrderStatusShortList; stdcall;
  end; 


implementation

  
  
  destructor RQOrderStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOrderStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderStatus');
  RemClassRegistry.RegisterXSClass(RQOrderStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderStatusRef');
  RemClassRegistry.RegisterXSClass(RQOrderStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderStatusFilter');
  RemClassRegistry.RegisterXSClass(RQOrderStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderStatusShort');
  RemClassRegistry.RegisterXSClass(RQOrderStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOrderStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOrderStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOrderStatusControllerSoapPort), 'http://ksoe.org/RQOrderStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOrderStatusControllerSoapPort), 'http://ksoe.org/RQOrderStatusController/action/RQOrderStatusController.%operationName%');


end.
