unit ENPosition2TKPositionController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENPositionController 
   ,TKPositionController 
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

  ENPosition2TKPosition            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPosition2TKPositionRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPosition2TKPosition = class(TRemotable)
  private
    Fcode : Integer; 
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FenpositionRef : ENPositionRef;
//???
    FtkpositionRef : TKPositionRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property enpositionRef : ENPositionRef read FenpositionRef write FenpositionRef; 
    property tkpositionRef : TKPositionRef read FtkpositionRef write FtkpositionRef; 
  end;

  ENPosition2TKPositionFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FenpositionRef : ENPositionRef;
//???
    FtkpositionRef : TKPositionRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property enpositionRef : ENPositionRef read FenpositionRef write FenpositionRef; 
    property tkpositionRef : TKPositionRef read FtkpositionRef write FtkpositionRef; 
  end;


  ENPosition2TKPositionShort = class(TRemotable)
  private
    Fcode : Integer; 
    FenpositionRefCode : Integer; 
    FenpositionRefName : WideString;
    FenpositionRefFinCode : Integer; 
    FtkpositionRefCode : Integer; 
    FtkpositionRefName : WideString;
    FtkpositionRefSafetyGroup : WideString;
    FtkpositionRefRank : WideString;
    FtkpositionRefShortName : WideString;
  published
    property  code : Integer read Fcode write Fcode; 

    property enpositionRefCode : Integer read FenpositionRefCode write FenpositionRefCode; 
    property enpositionRefName : WideString read FenpositionRefName write FenpositionRefName; 
    property enpositionRefFinCode : Integer read FenpositionRefFinCode write FenpositionRefFinCode; 
    property tkpositionRefCode : Integer read FtkpositionRefCode write FtkpositionRefCode; 
    property tkpositionRefName : WideString read FtkpositionRefName write FtkpositionRefName; 
    property tkpositionRefSafetyGroup : WideString read FtkpositionRefSafetyGroup write FtkpositionRefSafetyGroup; 
    property tkpositionRefRank : WideString read FtkpositionRefRank write FtkpositionRefRank; 
    property tkpositionRefShortName : WideString read FtkpositionRefShortName write FtkpositionRefShortName; 
  end;

  ArrayOfENPosition2TKPositionShort = array of ENPosition2TKPositionShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPosition2TKPositionShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPosition2TKPositionShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPosition2TKPositionShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPosition2TKPositionController/message/
  // soapAction: http://ksoe.org/ENPosition2TKPositionController/action/ENPosition2TKPositionController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPosition2TKPositionControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPosition2TKPositionController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPosition2TKPositionControllerSoapPort = interface(IInvokable)
  ['{b866b866-b866-b866-b866-b866b866b866}']
    function  add(const aENPosition2TKPosition: ENPosition2TKPosition): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPosition2TKPosition: ENPosition2TKPosition); stdcall;
    function  getObject(const anObjectCode: Integer): ENPosition2TKPosition; stdcall;
    function  getList: ENPosition2TKPositionShortList; stdcall;
    function  getFilteredList(const aENPosition2TKPositionFilter: ENPosition2TKPositionFilter): ENPosition2TKPositionShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPosition2TKPositionShortList; stdcall;
    function  getScrollableFilteredList(const aENPosition2TKPositionFilter: ENPosition2TKPositionFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPosition2TKPositionShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPosition2TKPositionShortList; stdcall;
  end; 


implementation

  destructor ENPosition2TKPosition.Destroy;
  begin
    if Assigned(FenpositionRef) then
      enpositionRef.Free;
    if Assigned(FtkpositionRef) then
      tkpositionRef.Free;
    inherited Destroy;
  end;
  
  destructor ENPosition2TKPositionFilter.Destroy;
  begin
    if Assigned(FenpositionRef) then
      enpositionRef.Free;
    if Assigned(FtkpositionRef) then
      tkpositionRef.Free;
    inherited Destroy;
  end; 
  
  
  destructor ENPosition2TKPositionShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPosition2TKPosition, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPosition2TKPosition');
  RemClassRegistry.RegisterXSClass(ENPosition2TKPositionRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPosition2TKPositionRef');
  RemClassRegistry.RegisterXSClass(ENPosition2TKPositionFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPosition2TKPositionFilter');
  RemClassRegistry.RegisterXSClass(ENPosition2TKPositionShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPosition2TKPositionShort');
  RemClassRegistry.RegisterXSClass(ENPosition2TKPositionShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPosition2TKPositionShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPosition2TKPositionShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPosition2TKPositionShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPosition2TKPositionControllerSoapPort), 'http://ksoe.org/ENPosition2TKPositionController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPosition2TKPositionControllerSoapPort), 'http://ksoe.org/ENPosition2TKPositionController/action/ENPosition2TKPositionController.%operationName%');


end.
