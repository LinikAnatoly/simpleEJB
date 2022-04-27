unit ENPlanWorkStateController;

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

  ENPlanWorkState            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkStateRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkState = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FshortName : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property shortName : WideString read FshortName write FshortName;
  end;

  ENPlanWorkStateFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FshortName : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property shortName : WideString read FshortName write FshortName;
  end;


  ENPlanWorkStateShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FshortName : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property shortName : WideString read FshortName write FshortName;

  end;

  ArrayOfENPlanWorkStateShort = array of ENPlanWorkStateShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanWorkStateShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanWorkStateShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanWorkStateShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanWorkStateController/message/
  // soapAction: http://ksoe.org/ENPlanWorkStateController/action/ENPlanWorkStateController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanWorkStateControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanWorkStateController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanWorkStateControllerSoapPort = interface(IInvokable)
  ['{16091609-1609-1609-1609-160916091609}']
    function  add(const aENPlanWorkState: ENPlanWorkState): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanWorkState: ENPlanWorkState); stdcall;
    function  getObject(const anObjectCode: Integer): ENPlanWorkState; stdcall;
    function  getList: ENPlanWorkStateShortList; stdcall;
    function  getFilteredList(const aENPlanWorkStateFilter: ENPlanWorkStateFilter): ENPlanWorkStateShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkStateShortList; stdcall;
    function  getScrollableFilteredList(const aENPlanWorkStateFilter: ENPlanWorkStateFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkStateShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkStateShortList; stdcall;
  end; 


implementation

  
  
  destructor ENPlanWorkStateShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanWorkState, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkState');
  RemClassRegistry.RegisterXSClass(ENPlanWorkStateRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkStateRef');
  RemClassRegistry.RegisterXSClass(ENPlanWorkStateFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkStateFilter');
  RemClassRegistry.RegisterXSClass(ENPlanWorkStateShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkStateShort');
  RemClassRegistry.RegisterXSClass(ENPlanWorkStateShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkStateShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanWorkStateShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanWorkStateShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanWorkStateControllerSoapPort), 'http://ksoe.org/ENPlanWorkStateController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanWorkStateControllerSoapPort), 'http://ksoe.org/ENPlanWorkStateController/action/ENPlanWorkStateController.%operationName%');


end.
