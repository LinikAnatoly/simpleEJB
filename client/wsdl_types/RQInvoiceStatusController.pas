unit RQInvoiceStatusController;

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

  RQInvoiceStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQInvoiceStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQInvoiceStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  RQInvoiceStatusFilter = class(TRemotable)
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


  RQInvoiceStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQInvoiceStatusShort = array of RQInvoiceStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQInvoiceStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQInvoiceStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQInvoiceStatusShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQInvoiceStatusController/message/
  // soapAction: http://ksoe.org/RQInvoiceStatusController/action/RQInvoiceStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQInvoiceStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQInvoiceStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQInvoiceStatusControllerSoapPort = interface(IInvokable)
  ['{1efe1efe-1efe-1efe-1efe-1efe1efe1efe}']
    function  add(const aRQInvoiceStatus: RQInvoiceStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQInvoiceStatus: RQInvoiceStatus); stdcall;
    function  getObject(const anObjectCode: Integer): RQInvoiceStatus; stdcall;
    function  getList: RQInvoiceStatusShortList; stdcall;
    function  getFilteredList(const aRQInvoiceStatusFilter: RQInvoiceStatusFilter): RQInvoiceStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQInvoiceStatusShortList; stdcall;
    function  getScrollableFilteredList(const aRQInvoiceStatusFilter: RQInvoiceStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): RQInvoiceStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQInvoiceStatusShortList; stdcall;
  end; 


implementation

  
  
  destructor RQInvoiceStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQInvoiceStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceStatus');
  RemClassRegistry.RegisterXSClass(RQInvoiceStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceStatusRef');
  RemClassRegistry.RegisterXSClass(RQInvoiceStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceStatusFilter');
  RemClassRegistry.RegisterXSClass(RQInvoiceStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceStatusShort');
  RemClassRegistry.RegisterXSClass(RQInvoiceStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQInvoiceStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQInvoiceStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(RQInvoiceStatusControllerSoapPort), 'http://ksoe.org/RQInvoiceStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQInvoiceStatusControllerSoapPort), 'http://ksoe.org/RQInvoiceStatusController/action/RQInvoiceStatusController.%operationName%');


end.
