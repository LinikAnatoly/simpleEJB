unit ENPlanCorrectReasonController;

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

  ENPlanCorrectReason            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanCorrectReasonRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanCorrectReason = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  ENPlanCorrectReasonFilter = class(TRemotable)
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


  ENPlanCorrectReasonShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENPlanCorrectReasonShort = array of ENPlanCorrectReasonShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanCorrectReasonShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanCorrectReasonShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanCorrectReasonShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanCorrectReasonController/message/
  // soapAction: http://ksoe.org/ENPlanCorrectReasonController/action/ENPlanCorrectReasonController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanCorrectReasonControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanCorrectReasonController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanCorrectReasonControllerSoapPort = interface(IInvokable)
  ['{d854d854-d854-d854-d854-d854d854d854}']
    function  add(const aENPlanCorrectReason: ENPlanCorrectReason): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanCorrectReason: ENPlanCorrectReason); stdcall;
    function  getObject(const anObjectCode: Integer): ENPlanCorrectReason; stdcall;
    function  getList: ENPlanCorrectReasonShortList; stdcall;
    function  getFilteredList(const aENPlanCorrectReasonFilter: ENPlanCorrectReasonFilter): ENPlanCorrectReasonShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanCorrectReasonShortList; stdcall;
    function  getScrollableFilteredList(const aENPlanCorrectReasonFilter: ENPlanCorrectReasonFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanCorrectReasonShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanCorrectReasonShortList; stdcall;
  end; 


implementation

  
  
  destructor ENPlanCorrectReasonShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanCorrectReason, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanCorrectReason');
  RemClassRegistry.RegisterXSClass(ENPlanCorrectReasonRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanCorrectReasonRef');
  RemClassRegistry.RegisterXSClass(ENPlanCorrectReasonFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanCorrectReasonFilter');
  RemClassRegistry.RegisterXSClass(ENPlanCorrectReasonShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanCorrectReasonShort');
  RemClassRegistry.RegisterXSClass(ENPlanCorrectReasonShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanCorrectReasonShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanCorrectReasonShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanCorrectReasonShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanCorrectReasonControllerSoapPort), 'http://ksoe.org/ENPlanCorrectReasonController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanCorrectReasonControllerSoapPort), 'http://ksoe.org/ENPlanCorrectReasonController/action/ENPlanCorrectReasonController.%operationName%');


end.
