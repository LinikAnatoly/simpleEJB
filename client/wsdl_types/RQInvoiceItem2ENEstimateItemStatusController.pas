unit RQInvoiceItem2ENEstimateItemStatusController;

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

  RQInvoiceItem2ENEstimateItemStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQInvoiceItem2ENEstimateItemStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQInvoiceItem2ENEstimateItemStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  RQInvoiceItem2ENEstimateItemStatusFilter = class(TRemotable)
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


  RQInvoiceItem2ENEstimateItemStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQInvoiceItem2ENEstimateItemStatusShort = array of RQInvoiceItem2ENEstimateItemStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQInvoiceItem2ENEstimateItemStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQInvoiceItem2ENEstimateItemStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQInvoiceItem2ENEstimateItemStatusShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQInvoiceItem2ENEstimateItemStatusController/message/
  // soapAction: http://ksoe.org/RQInvoiceItem2ENEstimateItemStatusController/action/RQInvoiceItem2ENEstimateItemStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQInvoiceItem2ENEstimateItemStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQInvoiceItem2ENEstimateItemStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQInvoiceItem2ENEstimateItemStatusControllerSoapPort = interface(IInvokable)
  ['{42f342f3-42f3-42f3-42f3-42f342f342f3}']
    function  add(const aRQInvoiceItem2ENEstimateItemStatus: RQInvoiceItem2ENEstimateItemStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQInvoiceItem2ENEstimateItemStatus: RQInvoiceItem2ENEstimateItemStatus); stdcall;
    function  getObject(const anObjectCode: Integer): RQInvoiceItem2ENEstimateItemStatus; stdcall;
    function  getList: RQInvoiceItem2ENEstimateItemStatusShortList; stdcall;
    function  getFilteredList(const aRQInvoiceItem2ENEstimateItemStatusFilter: RQInvoiceItem2ENEstimateItemStatusFilter): RQInvoiceItem2ENEstimateItemStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQInvoiceItem2ENEstimateItemStatusShortList; stdcall;
    function  getScrollableFilteredList(const aRQInvoiceItem2ENEstimateItemStatusFilter: RQInvoiceItem2ENEstimateItemStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): RQInvoiceItem2ENEstimateItemStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQInvoiceItem2ENEstimateItemStatusShortList; stdcall;
  end; 


implementation

  
  
  destructor RQInvoiceItem2ENEstimateItemStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQInvoiceItem2ENEstimateItemStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceItem2ENEstimateItemStatus');
  RemClassRegistry.RegisterXSClass(RQInvoiceItem2ENEstimateItemStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceItem2ENEstimateItemStatusRef');
  RemClassRegistry.RegisterXSClass(RQInvoiceItem2ENEstimateItemStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceItem2ENEstimateItemStatusFilter');
  RemClassRegistry.RegisterXSClass(RQInvoiceItem2ENEstimateItemStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceItem2ENEstimateItemStatusShort');
  RemClassRegistry.RegisterXSClass(RQInvoiceItem2ENEstimateItemStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceItem2ENEstimateItemStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQInvoiceItem2ENEstimateItemStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQInvoiceItem2ENEstimateItemStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(RQInvoiceItem2ENEstimateItemStatusControllerSoapPort), 'http://ksoe.org/RQInvoiceItem2ENEstimateItemStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQInvoiceItem2ENEstimateItemStatusControllerSoapPort), 'http://ksoe.org/RQInvoiceItem2ENEstimateItemStatusController/action/RQInvoiceItem2ENEstimateItemStatusController.%operationName%');


end.
