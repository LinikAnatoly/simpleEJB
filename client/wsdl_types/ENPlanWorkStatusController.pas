unit ENPlanWorkStatusController;

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

  ENPlanWorkStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  ENPlanWorkStatusFilter = class(TRemotable)
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


  ENPlanWorkStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENPlanWorkStatusShort = array of ENPlanWorkStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanWorkStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanWorkStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanWorkStatusShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanWorkStatusController/message/
  // soapAction: http://ksoe.org/ENPlanWorkStatusController/action/ENPlanWorkStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanWorkStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanWorkStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanWorkStatusControllerSoapPort = interface(IInvokable)
  ['{12bf12bf-12bf-12bf-12bf-12bf12bf12bf}']
    function  add(const aENPlanWorkStatus: ENPlanWorkStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanWorkStatus: ENPlanWorkStatus); stdcall;
    function  getObject(const anObjectCode: Integer): ENPlanWorkStatus; stdcall;
    function  getList: ENPlanWorkStatusShortList; stdcall;
    function  getFilteredList(const aENPlanWorkStatusFilter: ENPlanWorkStatusFilter): ENPlanWorkStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkStatusShortList; stdcall;
    function  getScrollableFilteredList(const aENPlanWorkStatusFilter: ENPlanWorkStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkStatusShortList; stdcall;
  end; 


implementation

  
  
  destructor ENPlanWorkStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanWorkStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkStatus');
  RemClassRegistry.RegisterXSClass(ENPlanWorkStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkStatusRef');
  RemClassRegistry.RegisterXSClass(ENPlanWorkStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkStatusFilter');
  RemClassRegistry.RegisterXSClass(ENPlanWorkStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkStatusShort');
  RemClassRegistry.RegisterXSClass(ENPlanWorkStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanWorkStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanWorkStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanWorkStatusControllerSoapPort), 'http://ksoe.org/ENPlanWorkStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanWorkStatusControllerSoapPort), 'http://ksoe.org/ENPlanWorkStatusController/action/ENPlanWorkStatusController.%operationName%');


end.
