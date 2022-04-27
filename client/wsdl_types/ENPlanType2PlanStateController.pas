unit ENPlanType2PlanStateController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENPlanWorkTypeController 
   ,ENPlanWorkStateController 
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

  ENPlanType2PlanState            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanType2PlanStateRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanType2PlanState = class(TRemotable)
  private
    Fcode : Integer; 
//???
    FtypeRef : ENPlanWorkTypeRef;
//???
    FstateRef : ENPlanWorkStateRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property typeRef : ENPlanWorkTypeRef read FtypeRef write FtypeRef; 
    property stateRef : ENPlanWorkStateRef read FstateRef write FstateRef; 
  end;

  ENPlanType2PlanStateFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
//???
    FtypeRef : ENPlanWorkTypeRef;
//???
    FstateRef : ENPlanWorkStateRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property typeRef : ENPlanWorkTypeRef read FtypeRef write FtypeRef; 
    property stateRef : ENPlanWorkStateRef read FstateRef write FstateRef; 
  end;


  ENPlanType2PlanStateShort = class(TRemotable)
  private
    Fcode : Integer; 
    FtypeRefCode : Integer; 
    FtypeRefName : WideString;
    FtypeRefShortName : WideString;
    FstateRefCode : Integer; 
    FstateRefName : WideString;
    FstateRefShortName : WideString;
  published
    property  code : Integer read Fcode write Fcode; 

    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode; 
    property typeRefName : WideString read FtypeRefName write FtypeRefName; 
    property typeRefShortName : WideString read FtypeRefShortName write FtypeRefShortName; 
    property stateRefCode : Integer read FstateRefCode write FstateRefCode; 
    property stateRefName : WideString read FstateRefName write FstateRefName; 
    property stateRefShortName : WideString read FstateRefShortName write FstateRefShortName; 
  end;

  ArrayOfENPlanType2PlanStateShort = array of ENPlanType2PlanStateShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanType2PlanStateShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanType2PlanStateShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanType2PlanStateShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanType2PlanStateController/message/
  // soapAction: http://ksoe.org/ENPlanType2PlanStateController/action/ENPlanType2PlanStateController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanType2PlanStateControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanType2PlanStateController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanType2PlanStateControllerSoapPort = interface(IInvokable)
  ['{1eec1eec-1eec-1eec-1eec-1eec1eec1eec}']
    function  add(const aENPlanType2PlanState: ENPlanType2PlanState): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanType2PlanState: ENPlanType2PlanState); stdcall;
    function  getObject(const anObjectCode: Integer): ENPlanType2PlanState; stdcall;
    function  getList: ENPlanType2PlanStateShortList; stdcall;
    function  getFilteredList(const aENPlanType2PlanStateFilter: ENPlanType2PlanStateFilter): ENPlanType2PlanStateShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanType2PlanStateShortList; stdcall;
    function  getScrollableFilteredList(const aENPlanType2PlanStateFilter: ENPlanType2PlanStateFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanType2PlanStateShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanType2PlanStateShortList; stdcall;
  end; 


implementation

  destructor ENPlanType2PlanState.Destroy;
  begin
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FstateRef) then
      stateRef.Free;
    inherited Destroy;
  end;
  
  destructor ENPlanType2PlanStateFilter.Destroy;
  begin
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FstateRef) then
      stateRef.Free;
    inherited Destroy;
  end; 
  
  
  destructor ENPlanType2PlanStateShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanType2PlanState, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanType2PlanState');
  RemClassRegistry.RegisterXSClass(ENPlanType2PlanStateRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanType2PlanStateRef');
  RemClassRegistry.RegisterXSClass(ENPlanType2PlanStateFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanType2PlanStateFilter');
  RemClassRegistry.RegisterXSClass(ENPlanType2PlanStateShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanType2PlanStateShort');
  RemClassRegistry.RegisterXSClass(ENPlanType2PlanStateShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanType2PlanStateShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanType2PlanStateShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanType2PlanStateShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanType2PlanStateControllerSoapPort), 'http://ksoe.org/ENPlanType2PlanStateController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanType2PlanStateControllerSoapPort), 'http://ksoe.org/ENPlanType2PlanStateController/action/ENPlanType2PlanStateController.%operationName%');


end.
