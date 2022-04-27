unit ENTraversTypeController;

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

  ENTraversType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTraversTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTraversType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENTraversTypeFilter = class(TRemotable)
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

  ENTraversTypeFilter = class(ENTraversType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTraversTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENTraversTypeShort = array of ENTraversTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTraversTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTraversTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTraversTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTraversTypeController/message/
  // soapAction: http://ksoe.org/ENTraversTypeController/action/ENTraversTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTraversTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTraversTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTraversTypeControllerSoapPort = interface(IInvokable)
  ['{fd01fd01-fd01-fd01-fd01-fd01fd01fd01}']
    function  add(const aENTraversType: ENTraversType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTraversType: ENTraversType); stdcall;
    function  getObject(const anObjectCode: Integer): ENTraversType; stdcall;
    function  getList: ENTraversTypeShortList; stdcall;
    function  getFilteredList(const aENTraversTypeFilter: ENTraversTypeFilter): ENTraversTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTraversTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENTraversTypeFilter: ENTraversTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTraversTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTraversTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTraversTypeFilter: ENTraversTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENTraversTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTraversType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTraversType');
  RemClassRegistry.RegisterXSClass(ENTraversTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTraversTypeRef');
  RemClassRegistry.RegisterXSClass(ENTraversTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTraversTypeFilter');
  RemClassRegistry.RegisterXSClass(ENTraversTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTraversTypeShort');
  RemClassRegistry.RegisterXSClass(ENTraversTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTraversTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTraversTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTraversTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTraversTypeControllerSoapPort), 'http://ksoe.org/ENTraversTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTraversTypeControllerSoapPort), 'http://ksoe.org/ENTraversTypeController/action/ENTraversTypeController.%operationName%');


end.
