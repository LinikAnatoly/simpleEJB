unit ENPlanWorkMoveReasonController;

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

  ENPlanWorkMoveReason            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkMoveReasonRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkMoveReason = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  ENPlanWorkMoveReasonFilter = class(TRemotable)
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


  ENPlanWorkMoveReasonShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENPlanWorkMoveReasonShort = array of ENPlanWorkMoveReasonShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanWorkMoveReasonShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanWorkMoveReasonShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanWorkMoveReasonShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanWorkMoveReasonController/message/
  // soapAction: http://ksoe.org/ENPlanWorkMoveReasonController/action/ENPlanWorkMoveReasonController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanWorkMoveReasonControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanWorkMoveReasonController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanWorkMoveReasonControllerSoapPort = interface(IInvokable)
  ['{1f801f80-1f80-1f80-1f80-1f801f801f80}']
    function  add(const aENPlanWorkMoveReason: ENPlanWorkMoveReason): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanWorkMoveReason: ENPlanWorkMoveReason); stdcall;
    function  getObject(const anObjectCode: Integer): ENPlanWorkMoveReason; stdcall;
    function  getList: ENPlanWorkMoveReasonShortList; stdcall;
    function  getFilteredList(const aENPlanWorkMoveReasonFilter: ENPlanWorkMoveReasonFilter): ENPlanWorkMoveReasonShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkMoveReasonShortList; stdcall;
    function  getScrollableFilteredList(const aENPlanWorkMoveReasonFilter: ENPlanWorkMoveReasonFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkMoveReasonShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkMoveReasonShortList; stdcall;
  end; 


implementation

  
  
  destructor ENPlanWorkMoveReasonShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanWorkMoveReason, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkMoveReason');
  RemClassRegistry.RegisterXSClass(ENPlanWorkMoveReasonRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkMoveReasonRef');
  RemClassRegistry.RegisterXSClass(ENPlanWorkMoveReasonFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkMoveReasonFilter');
  RemClassRegistry.RegisterXSClass(ENPlanWorkMoveReasonShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkMoveReasonShort');
  RemClassRegistry.RegisterXSClass(ENPlanWorkMoveReasonShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkMoveReasonShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanWorkMoveReasonShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanWorkMoveReasonShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanWorkMoveReasonControllerSoapPort), 'http://ksoe.org/ENPlanWorkMoveReasonController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanWorkMoveReasonControllerSoapPort), 'http://ksoe.org/ENPlanWorkMoveReasonController/action/ENPlanWorkMoveReasonController.%operationName%');


end.
