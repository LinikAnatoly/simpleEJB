unit ENConnectionPhasityController;

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

  ENConnectionPhasity            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENConnectionPhasityRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENConnectionPhasity = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENConnectionPhasityFilter = class(TRemotable)
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

  ENConnectionPhasityFilter = class(ENConnectionPhasity)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENConnectionPhasityShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENConnectionPhasityShort = array of ENConnectionPhasityShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENConnectionPhasityShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENConnectionPhasityShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENConnectionPhasityShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENConnectionPhasityController/message/
  // soapAction: http://ksoe.org/ENConnectionPhasityController/action/ENConnectionPhasityController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENConnectionPhasityControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENConnectionPhasityController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENConnectionPhasityControllerSoapPort = interface(IInvokable)
  ['{E6F9BF9C-9D59-4D73-93C3-7E9CD15C6552}']
    function  add(const aENConnectionPhasity: ENConnectionPhasity): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENConnectionPhasity: ENConnectionPhasity); stdcall;
    function  getObject(const anObjectCode: Integer): ENConnectionPhasity; stdcall;
    function  getList: ENConnectionPhasityShortList; stdcall;
    function  getFilteredList(const aENConnectionPhasityFilter: ENConnectionPhasityFilter): ENConnectionPhasityShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENConnectionPhasityShortList; stdcall;
    function  getScrollableFilteredList(const aENConnectionPhasityFilter: ENConnectionPhasityFilter; const aFromPosition: Integer; const aQuantity: Integer): ENConnectionPhasityShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENConnectionPhasityShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENConnectionPhasityFilter: ENConnectionPhasityFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENConnectionPhasityShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENConnectionPhasity, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionPhasity');
  RemClassRegistry.RegisterXSClass(ENConnectionPhasityRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionPhasityRef');
  RemClassRegistry.RegisterXSClass(ENConnectionPhasityFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionPhasityFilter');
  RemClassRegistry.RegisterXSClass(ENConnectionPhasityShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionPhasityShort');
  RemClassRegistry.RegisterXSClass(ENConnectionPhasityShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionPhasityShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENConnectionPhasityShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENConnectionPhasityShort');

  InvRegistry.RegisterInterface(TypeInfo(ENConnectionPhasityControllerSoapPort), 'http://ksoe.org/ENConnectionPhasityController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENConnectionPhasityControllerSoapPort), 'http://ksoe.org/ENConnectionPhasityController/action/ENConnectionPhasityController.%operationName%');


end.
