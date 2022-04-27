unit ENContactBreakerTypeController;

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

  ENContactBreakerType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENContactBreakerTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENContactBreakerType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENContactBreakerTypeFilter = class(TRemotable)
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

  ENContactBreakerTypeFilter = class(ENContactBreakerType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENContactBreakerTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENContactBreakerTypeShort = array of ENContactBreakerTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENContactBreakerTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENContactBreakerTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENContactBreakerTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENContactBreakerTypeController/message/
  // soapAction: http://ksoe.org/ENContactBreakerTypeController/action/ENContactBreakerTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENContactBreakerTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENContactBreakerTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENContactBreakerTypeControllerSoapPort = interface(IInvokable)
  ['{1ebb1ebb-1ebb-1ebb-1ebb-1ebb1ebb1ebb}']
    function  add(const aENContactBreakerType: ENContactBreakerType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENContactBreakerType: ENContactBreakerType); stdcall;
    function  getObject(const anObjectCode: Integer): ENContactBreakerType; stdcall;
    function  getList: ENContactBreakerTypeShortList; stdcall;
    function  getFilteredList(const aENContactBreakerTypeFilter: ENContactBreakerTypeFilter): ENContactBreakerTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENContactBreakerTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENContactBreakerTypeFilter: ENContactBreakerTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENContactBreakerTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENContactBreakerTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENContactBreakerTypeFilter: ENContactBreakerTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENContactBreakerTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENContactBreakerType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContactBreakerType');
  RemClassRegistry.RegisterXSClass(ENContactBreakerTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContactBreakerTypeRef');
  RemClassRegistry.RegisterXSClass(ENContactBreakerTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContactBreakerTypeFilter');
  RemClassRegistry.RegisterXSClass(ENContactBreakerTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContactBreakerTypeShort');
  RemClassRegistry.RegisterXSClass(ENContactBreakerTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContactBreakerTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENContactBreakerTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENContactBreakerTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENContactBreakerTypeControllerSoapPort), 'http://ksoe.org/ENContactBreakerTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENContactBreakerTypeControllerSoapPort), 'http://ksoe.org/ENContactBreakerTypeController/action/ENContactBreakerTypeController.%operationName%');


end.
