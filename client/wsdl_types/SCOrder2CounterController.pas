unit SCOrder2CounterController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,SCOrderController 
   ,SCCounterController 
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

  SCOrder2Counter            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCOrder2CounterRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCOrder2Counter = class(TRemotable)
  private
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FscOrderRef : SCOrderRef;
//???
    FcounterRef : SCCounterRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property scOrderRef : SCOrderRef read FscOrderRef write FscOrderRef; 
    property counterRef : SCCounterRef read FcounterRef write FcounterRef; 
  end;
  
{
  SCOrder2CounterFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FscOrderRef : SCOrderRef;
//???
    FcounterRef : SCCounterRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property scOrderRef : SCOrderRef read FscOrderRef write FscOrderRef; 
    property counterRef : SCCounterRef read FcounterRef write FcounterRef; 
  end;
}

  SCOrder2CounterFilter = class(SCOrder2Counter)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  SCOrder2CounterShort = class(TRemotable)
  private
    Fcode : Integer; 
    FscOrderRefCode : Integer; 
    FscOrderRefMolCode : WideString;
    FscOrderRefPodrCode : WideString;
    FscOrderRefCountGen : Integer; 
    FscOrderRefScCode : Integer; 
    FcounterRefCode : Integer; 
  published
    property  code : Integer read Fcode write Fcode; 

    property scOrderRefCode : Integer read FscOrderRefCode write FscOrderRefCode; 
    property scOrderRefMolCode : WideString read FscOrderRefMolCode write FscOrderRefMolCode; 
    property scOrderRefPodrCode : WideString read FscOrderRefPodrCode write FscOrderRefPodrCode; 
    property scOrderRefCountGen : Integer read FscOrderRefCountGen write FscOrderRefCountGen; 
    property scOrderRefScCode : Integer read FscOrderRefScCode write FscOrderRefScCode; 
    property counterRefCode : Integer read FcounterRefCode write FcounterRefCode; //SCCounterRef read FcounterRefCode write FcounterRefCode; 
  end;

  ArrayOfSCOrder2CounterShort = array of SCOrder2CounterShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  SCOrder2CounterShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfSCOrder2CounterShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfSCOrder2CounterShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/SCOrder2CounterController/message/
  // soapAction: http://ksoe.org/SCOrder2CounterController/action/SCOrder2CounterController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : SCOrder2CounterControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : SCOrder2CounterController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  SCOrder2CounterControllerSoapPort = interface(IInvokable)
  ['{6a436a43-6a43-6a43-6a43-6a436a436a43}']
    function  add(const aSCOrder2Counter: SCOrder2Counter): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aSCOrder2Counter: SCOrder2Counter); stdcall;
    function  getObject(const anObjectCode: Integer): SCOrder2Counter; stdcall;
    function  getList: SCOrder2CounterShortList; stdcall;
    function  getFilteredList(const aSCOrder2CounterFilter: SCOrder2CounterFilter): SCOrder2CounterShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): SCOrder2CounterShortList; stdcall;
    function  getScrollableFilteredList(const aSCOrder2CounterFilter: SCOrder2CounterFilter; const aFromPosition: Integer; const aQuantity: Integer): SCOrder2CounterShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): SCOrder2CounterShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aSCOrder2CounterFilter: SCOrder2CounterFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor SCOrder2Counter.Destroy;
  begin
    if Assigned(FscOrderRef) then
      scOrderRef.Free;
    if Assigned(FcounterRef) then
      counterRef.Free;
    inherited Destroy;
  end;

{  
  destructor SCOrder2CounterFilter.Destroy;
  begin
    if Assigned(FscOrderRef) then
      scOrderRef.Free;
    if Assigned(FcounterRef) then
      counterRef.Free;
    inherited Destroy;
  end; 
}

  destructor SCOrder2CounterFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  
  destructor SCOrder2CounterShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(SCOrder2Counter, 'http://ksoe.org/EnergyproControllerService/type/', 'SCOrder2Counter');
  RemClassRegistry.RegisterXSClass(SCOrder2CounterRef, 'http://ksoe.org/EnergyproControllerService/type/', 'SCOrder2CounterRef');
  RemClassRegistry.RegisterXSClass(SCOrder2CounterFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'SCOrder2CounterFilter');
  RemClassRegistry.RegisterXSClass(SCOrder2CounterShort, 'http://ksoe.org/EnergyproControllerService/type/', 'SCOrder2CounterShort');
  RemClassRegistry.RegisterXSClass(SCOrder2CounterShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'SCOrder2CounterShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfSCOrder2CounterShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfSCOrder2CounterShort');

  InvRegistry.RegisterInterface(TypeInfo(SCOrder2CounterControllerSoapPort), 'http://ksoe.org/SCOrder2CounterController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SCOrder2CounterControllerSoapPort), 'http://ksoe.org/SCOrder2CounterController/action/SCOrder2CounterController.%operationName%');


end.
