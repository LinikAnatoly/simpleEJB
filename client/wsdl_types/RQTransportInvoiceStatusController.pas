unit RQTransportInvoiceStatusController;

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

  RQTransportInvoiceStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQTransportInvoiceStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQTransportInvoiceStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  RQTransportInvoiceStatusFilter = class(TRemotable)
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

  RQTransportInvoiceStatusFilter = class(RQTransportInvoiceStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQTransportInvoiceStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQTransportInvoiceStatusShort = array of RQTransportInvoiceStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQTransportInvoiceStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQTransportInvoiceStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQTransportInvoiceStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQTransportInvoiceStatusController/message/
  // soapAction: http://ksoe.org/RQTransportInvoiceStatusController/action/RQTransportInvoiceStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQTransportInvoiceStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQTransportInvoiceStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQTransportInvoiceStatusControllerSoapPort = interface(IInvokable)
  ['{126c126c-126c-126c-126c-126c126c126c}']
    function  add(const aRQTransportInvoiceStatus: RQTransportInvoiceStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQTransportInvoiceStatus: RQTransportInvoiceStatus); stdcall;
    function  getObject(const anObjectCode: Integer): RQTransportInvoiceStatus; stdcall;
    function  getList: RQTransportInvoiceStatusShortList; stdcall;
    function  getFilteredList(const aRQTransportInvoiceStatusFilter: RQTransportInvoiceStatusFilter): RQTransportInvoiceStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQTransportInvoiceStatusShortList; stdcall;
    function  getScrollableFilteredList(const aRQTransportInvoiceStatusFilter: RQTransportInvoiceStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): RQTransportInvoiceStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQTransportInvoiceStatusShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aRQTransportInvoiceStatusFilter: RQTransportInvoiceStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor RQTransportInvoiceStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQTransportInvoiceStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTransportInvoiceStatus');
  RemClassRegistry.RegisterXSClass(RQTransportInvoiceStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTransportInvoiceStatusRef');
  RemClassRegistry.RegisterXSClass(RQTransportInvoiceStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTransportInvoiceStatusFilter');
  RemClassRegistry.RegisterXSClass(RQTransportInvoiceStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTransportInvoiceStatusShort');
  RemClassRegistry.RegisterXSClass(RQTransportInvoiceStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTransportInvoiceStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQTransportInvoiceStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQTransportInvoiceStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(RQTransportInvoiceStatusControllerSoapPort), 'http://ksoe.org/RQTransportInvoiceStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQTransportInvoiceStatusControllerSoapPort), 'http://ksoe.org/RQTransportInvoiceStatusController/action/RQTransportInvoiceStatusController.%operationName%');


end.
