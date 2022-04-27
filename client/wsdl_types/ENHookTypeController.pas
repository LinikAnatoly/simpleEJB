unit ENHookTypeController;

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

  ENHookType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENHookTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENHookType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENHookTypeFilter = class(TRemotable)
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

  ENHookTypeFilter = class(ENHookType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENHookTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENHookTypeShort = array of ENHookTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENHookTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENHookTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENHookTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENHookTypeController/message/
  // soapAction: http://ksoe.org/ENHookTypeController/action/ENHookTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENHookTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENHookTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENHookTypeControllerSoapPort = interface(IInvokable)
  ['{176e176e-176e-176e-176e-176e176e176e}']
    function  add(const aENHookType: ENHookType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENHookType: ENHookType); stdcall;
    function  getObject(const anObjectCode: Integer): ENHookType; stdcall;
    function  getList: ENHookTypeShortList; stdcall;
    function  getFilteredList(const aENHookTypeFilter: ENHookTypeFilter): ENHookTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENHookTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENHookTypeFilter: ENHookTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENHookTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENHookTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENHookTypeFilter: ENHookTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENHookTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENHookType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHookType');
  RemClassRegistry.RegisterXSClass(ENHookTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHookTypeRef');
  RemClassRegistry.RegisterXSClass(ENHookTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHookTypeFilter');
  RemClassRegistry.RegisterXSClass(ENHookTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHookTypeShort');
  RemClassRegistry.RegisterXSClass(ENHookTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHookTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENHookTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENHookTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENHookTypeControllerSoapPort), 'http://ksoe.org/ENHookTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENHookTypeControllerSoapPort), 'http://ksoe.org/ENHookTypeController/action/ENHookTypeController.%operationName%');


end.
