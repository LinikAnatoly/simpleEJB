unit SCUsageInputItemOZ2ENActController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,SCUsageInputItemOZController 
   ,ENActController 
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

  SCUsageInputItemOZ2ENAct            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCUsageInputItemOZ2ENActRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCUsageInputItemOZ2ENAct = class(TRemotable)
  private
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FusageInputItemOZRef : SCUsageInputItemOZRef;
//???
    FenActRef : ENActRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property usageInputItemOZRef : SCUsageInputItemOZRef read FusageInputItemOZRef write FusageInputItemOZRef; 
    property enActRef : ENActRef read FenActRef write FenActRef; 
  end;
  
{
  SCUsageInputItemOZ2ENActFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FusageInputItemOZRef : SCUsageInputItemOZRef;
//???
    FenActRef : ENActRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property usageInputItemOZRef : SCUsageInputItemOZRef read FusageInputItemOZRef write FusageInputItemOZRef; 
    property enActRef : ENActRef read FenActRef write FenActRef; 
  end;
}

  SCUsageInputItemOZ2ENActFilter = class(SCUsageInputItemOZ2ENAct)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  SCUsageInputItemOZ2ENActShort = class(TRemotable)
  private
    Fcode : Integer; 
    FusageInputItemOZRefCode : Integer; 
    FusageInputItemOZRefNumberDoc : WideString;
    FusageInputItemOZRefCounterType : WideString;
    FusageInputItemOZRefAccount : WideString;
    FusageInputItemOZRefCost : TXSDecimal;
    FusageInputItemOZRefCountGen : Integer; 
    FusageInputItemOZRefScCode : Integer; 
    FenActRefCode : Integer; 
    FenActRefNumberGen : WideString;
    FenActRefDateGen : TXSDate;
    FenActRefFinDocCode : Integer; 
    FenActRefFinDocMechanicCode : Integer; 
    FenActRefFinMolName : WideString;
    FenActRefFinMechanicName : WideString;
    FenActRefInvNumber : WideString;
    FenActRefUserGen : WideString;
    FenActRefDateEdit : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property usageInputItemOZRefCode : Integer read FusageInputItemOZRefCode write FusageInputItemOZRefCode; 
    property usageInputItemOZRefNumberDoc : WideString read FusageInputItemOZRefNumberDoc write FusageInputItemOZRefNumberDoc; 
    property usageInputItemOZRefCounterType : WideString read FusageInputItemOZRefCounterType write FusageInputItemOZRefCounterType; 
    property usageInputItemOZRefAccount : WideString read FusageInputItemOZRefAccount write FusageInputItemOZRefAccount; 
    property usageInputItemOZRefCost : TXSDecimal read FusageInputItemOZRefCost write FusageInputItemOZRefCost; 
    property usageInputItemOZRefCountGen : Integer read FusageInputItemOZRefCountGen write FusageInputItemOZRefCountGen; 
    property usageInputItemOZRefScCode : Integer read FusageInputItemOZRefScCode write FusageInputItemOZRefScCode; 
    property enActRefCode : Integer read FenActRefCode write FenActRefCode; 
    property enActRefNumberGen : WideString read FenActRefNumberGen write FenActRefNumberGen; 
    property enActRefDateGen : TXSDate read FenActRefDateGen write FenActRefDateGen; 
    property enActRefFinDocCode : Integer read FenActRefFinDocCode write FenActRefFinDocCode; 
    property enActRefFinDocMechanicCode : Integer read FenActRefFinDocMechanicCode write FenActRefFinDocMechanicCode; 
    property enActRefFinMolName : WideString read FenActRefFinMolName write FenActRefFinMolName; 
    property enActRefFinMechanicName : WideString read FenActRefFinMechanicName write FenActRefFinMechanicName; 
    property enActRefInvNumber : WideString read FenActRefInvNumber write FenActRefInvNumber; 
    property enActRefUserGen : WideString read FenActRefUserGen write FenActRefUserGen; 
    property enActRefDateEdit : TXSDate read FenActRefDateEdit write FenActRefDateEdit; 
  end;

  ArrayOfSCUsageInputItemOZ2ENActShort = array of SCUsageInputItemOZ2ENActShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  SCUsageInputItemOZ2ENActShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfSCUsageInputItemOZ2ENActShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfSCUsageInputItemOZ2ENActShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/SCUsageInputItemOZ2ENActController/message/
  // soapAction: http://ksoe.org/SCUsageInputItemOZ2ENActController/action/SCUsageInputItemOZ2ENActController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : SCUsageInputItemOZ2ENActControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : SCUsageInputItemOZ2ENActController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  SCUsageInputItemOZ2ENActControllerSoapPort = interface(IInvokable)
  ['{c59ac59a-c59a-c59a-c59a-c59ac59ac59a}']
    function  add(const aSCUsageInputItemOZ2ENAct: SCUsageInputItemOZ2ENAct): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aSCUsageInputItemOZ2ENAct: SCUsageInputItemOZ2ENAct); stdcall;
    function  getObject(const anObjectCode: Integer): SCUsageInputItemOZ2ENAct; stdcall;
    function  getList: SCUsageInputItemOZ2ENActShortList; stdcall;
    function  getFilteredList(const aSCUsageInputItemOZ2ENActFilter: SCUsageInputItemOZ2ENActFilter): SCUsageInputItemOZ2ENActShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): SCUsageInputItemOZ2ENActShortList; stdcall;
    function  getScrollableFilteredList(const aSCUsageInputItemOZ2ENActFilter: SCUsageInputItemOZ2ENActFilter; const aFromPosition: Integer; const aQuantity: Integer): SCUsageInputItemOZ2ENActShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): SCUsageInputItemOZ2ENActShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aSCUsageInputItemOZ2ENActFilter: SCUsageInputItemOZ2ENActFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor SCUsageInputItemOZ2ENAct.Destroy;
  begin
    if Assigned(FusageInputItemOZRef) then
      usageInputItemOZRef.Free;
    if Assigned(FenActRef) then
      enActRef.Free;
    inherited Destroy;
  end;

{  
  destructor SCUsageInputItemOZ2ENActFilter.Destroy;
  begin
    if Assigned(FusageInputItemOZRef) then
      usageInputItemOZRef.Free;
    if Assigned(FenActRef) then
      enActRef.Free;
    inherited Destroy;
  end; 
}

  destructor SCUsageInputItemOZ2ENActFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor SCUsageInputItemOZ2ENActShort.Destroy;
  begin
    if Assigned(FusageInputItemOZRefCost) then
      usageInputItemOZRefCost.Free;
    if Assigned(FenActRefDateGen) then
      enActRefDateGen.Free;
    if Assigned(FenActRefDateEdit) then
      enActRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor SCUsageInputItemOZ2ENActShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(SCUsageInputItemOZ2ENAct, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemOZ2ENAct');
  RemClassRegistry.RegisterXSClass(SCUsageInputItemOZ2ENActRef, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemOZ2ENActRef');
  RemClassRegistry.RegisterXSClass(SCUsageInputItemOZ2ENActFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemOZ2ENActFilter');
  RemClassRegistry.RegisterXSClass(SCUsageInputItemOZ2ENActShort, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemOZ2ENActShort');
  RemClassRegistry.RegisterXSClass(SCUsageInputItemOZ2ENActShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemOZ2ENActShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfSCUsageInputItemOZ2ENActShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfSCUsageInputItemOZ2ENActShort');

  InvRegistry.RegisterInterface(TypeInfo(SCUsageInputItemOZ2ENActControllerSoapPort), 'http://ksoe.org/SCUsageInputItemOZ2ENActController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SCUsageInputItemOZ2ENActControllerSoapPort), 'http://ksoe.org/SCUsageInputItemOZ2ENActController/action/SCUsageInputItemOZ2ENActController.%operationName%');


end.
