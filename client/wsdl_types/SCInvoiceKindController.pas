unit SCInvoiceKindController;

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

  SCInvoiceKind            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCInvoiceKindRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCInvoiceKind = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  SCInvoiceKindFilter = class(TRemotable)
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

  SCInvoiceKindFilter = class(SCInvoiceKind)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  SCInvoiceKindShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfSCInvoiceKindShort = array of SCInvoiceKindShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  SCInvoiceKindShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfSCInvoiceKindShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfSCInvoiceKindShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/SCInvoiceKindController/message/
  // soapAction: http://ksoe.org/SCInvoiceKindController/action/SCInvoiceKindController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : SCInvoiceKindControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : SCInvoiceKindController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  SCInvoiceKindControllerSoapPort = interface(IInvokable)
  ['{13c313c3-13c3-13c3-13c3-13c313c313c3}']
    function  add(const aSCInvoiceKind: SCInvoiceKind): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aSCInvoiceKind: SCInvoiceKind); stdcall;
    function  getObject(const anObjectCode: Integer): SCInvoiceKind; stdcall;
    function  getList: SCInvoiceKindShortList; stdcall;
    function  getFilteredList(const aSCInvoiceKindFilter: SCInvoiceKindFilter): SCInvoiceKindShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): SCInvoiceKindShortList; stdcall;
    function  getScrollableFilteredList(const aSCInvoiceKindFilter: SCInvoiceKindFilter; const aFromPosition: Integer; const aQuantity: Integer): SCInvoiceKindShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): SCInvoiceKindShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aSCInvoiceKindFilter: SCInvoiceKindFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor SCInvoiceKindShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(SCInvoiceKind, 'http://ksoe.org/EnergyproControllerService/type/', 'SCInvoiceKind');
  RemClassRegistry.RegisterXSClass(SCInvoiceKindRef, 'http://ksoe.org/EnergyproControllerService/type/', 'SCInvoiceKindRef');
  RemClassRegistry.RegisterXSClass(SCInvoiceKindFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'SCInvoiceKindFilter');
  RemClassRegistry.RegisterXSClass(SCInvoiceKindShort, 'http://ksoe.org/EnergyproControllerService/type/', 'SCInvoiceKindShort');
  RemClassRegistry.RegisterXSClass(SCInvoiceKindShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'SCInvoiceKindShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfSCInvoiceKindShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfSCInvoiceKindShort');

  InvRegistry.RegisterInterface(TypeInfo(SCInvoiceKindControllerSoapPort), 'http://ksoe.org/SCInvoiceKindController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SCInvoiceKindControllerSoapPort), 'http://ksoe.org/SCInvoiceKindController/action/SCInvoiceKindController.%operationName%');


end.
