unit ENPlanWorkTypeController;

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

  ENPlanWorkType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FshortName : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property shortName : WideString read FshortName write FshortName;
  end;

  ENPlanWorkTypeFilter = class(TRemotable)
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


  ENPlanWorkTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FshortName : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property shortName : WideString read FshortName write FshortName;

  end;

  ArrayOfENPlanWorkTypeShort = array of ENPlanWorkTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanWorkTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanWorkTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanWorkTypeShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanWorkTypeController/message/
  // soapAction: http://ksoe.org/ENPlanWorkTypeController/action/ENPlanWorkTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanWorkTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanWorkTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanWorkTypeControllerSoapPort = interface(IInvokable)
  ['{180f180f-180f-180f-180f-180f180f180f}']
    function  add(const aENPlanWorkType: ENPlanWorkType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanWorkType: ENPlanWorkType); stdcall;
    function  getObject(const anObjectCode: Integer): ENPlanWorkType; stdcall;
    function  getList: ENPlanWorkTypeShortList; stdcall;
    function  getFilteredList(const aENPlanWorkTypeFilter: ENPlanWorkTypeFilter): ENPlanWorkTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENPlanWorkTypeFilter: ENPlanWorkTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkTypeShortList; stdcall;
  end; 


implementation

  
  
  destructor ENPlanWorkTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanWorkType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkType');
  RemClassRegistry.RegisterXSClass(ENPlanWorkTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkTypeRef');
  RemClassRegistry.RegisterXSClass(ENPlanWorkTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkTypeFilter');
  RemClassRegistry.RegisterXSClass(ENPlanWorkTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkTypeShort');
  RemClassRegistry.RegisterXSClass(ENPlanWorkTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanWorkTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanWorkTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanWorkTypeControllerSoapPort), 'http://ksoe.org/ENPlanWorkTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanWorkTypeControllerSoapPort), 'http://ksoe.org/ENPlanWorkTypeController/action/ENPlanWorkTypeController.%operationName%');


end.
