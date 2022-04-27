unit FINExecutorTypeController;

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

  FINExecutorType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINExecutorTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINExecutorType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  FINExecutorTypeFilter = class(TRemotable)
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

  FINExecutorTypeFilter = class(FINExecutorType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  FINExecutorTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfFINExecutorTypeShort = array of FINExecutorTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  FINExecutorTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfFINExecutorTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfFINExecutorTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/FINExecutorTypeController/message/
  // soapAction: http://ksoe.org/FINExecutorTypeController/action/FINExecutorTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : FINExecutorTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : FINExecutorTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  FINExecutorTypeControllerSoapPort = interface(IInvokable)
  ['{13fa13fa-13fa-13fa-13fa-13fa13fa13fa}']
    function  add(const aFINExecutorType: FINExecutorType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aFINExecutorType: FINExecutorType); stdcall;
    function  getObject(const anObjectCode: Integer): FINExecutorType; stdcall;
    function  getList: FINExecutorTypeShortList; stdcall;
    function  getFilteredList(const aFINExecutorTypeFilter: FINExecutorTypeFilter): FINExecutorTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): FINExecutorTypeShortList; stdcall;
    function  getScrollableFilteredList(const aFINExecutorTypeFilter: FINExecutorTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): FINExecutorTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): FINExecutorTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aFINExecutorTypeFilter: FINExecutorTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor FINExecutorTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(FINExecutorType, 'http://ksoe.org/EnergyproControllerService/type/', 'FINExecutorType');
  RemClassRegistry.RegisterXSClass(FINExecutorTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'FINExecutorTypeRef');
  RemClassRegistry.RegisterXSClass(FINExecutorTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'FINExecutorTypeFilter');
  RemClassRegistry.RegisterXSClass(FINExecutorTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'FINExecutorTypeShort');
  RemClassRegistry.RegisterXSClass(FINExecutorTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'FINExecutorTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFINExecutorTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfFINExecutorTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(FINExecutorTypeControllerSoapPort), 'http://ksoe.org/FINExecutorTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(FINExecutorTypeControllerSoapPort), 'http://ksoe.org/FINExecutorTypeController/action/FINExecutorTypeController.%operationName%');


end.
