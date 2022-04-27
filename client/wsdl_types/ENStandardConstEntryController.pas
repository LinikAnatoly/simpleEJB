unit ENStandardConstEntryController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENStandardConstController 
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

  ENStandardConstEntry            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENStandardConstEntryRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENStandardConstEntry = class(TRemotable)
  private
    Fcode : Integer; 
    FconstEntry : TXSDecimal;
    FstartDate : TXSDate;
    FendDate : TXSDate;
//???
    FconstRef : ENStandardConstRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode; 
    property constEntry : TXSDecimal read FconstEntry write FconstEntry;
    property startDate : TXSDate read FstartDate write FstartDate;
    property endDate : TXSDate read FendDate write FendDate;
    property constRef : ENStandardConstRef read FconstRef write FconstRef; 
  end;
  
{
  ENStandardConstEntryFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FConstEntry : TXSDecimal;
    FstartDate : TXSDate;
    FendDate : TXSDate;
//???
    FconstRef : ENStandardConstRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property ConstEntry : TXSDecimal read FConstEntry write FConstEntry; 
    property startDate : TXSDate read FstartDate write FstartDate;
    property endDate : TXSDate read FendDate write FendDate;
    property constRef : ENStandardConstRef read FconstRef write FconstRef; 
  end;
}

  ENStandardConstEntryFilter = class(ENStandardConstEntry)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENStandardConstEntryShort = class(TRemotable)
  private
    Fcode : Integer; 
    FconstEntry : TXSDecimal;
    FstartDate : TXSDate;	
    FendDate : TXSDate;	
    FconstRefCode : Integer; 
    FconstRefName : WideString;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode; 
    property constEntry : TXSDecimal read FconstEntry write FconstEntry;
    property startDate : TXSDate read FstartDate write FstartDate;
    property endDate : TXSDate read FendDate write FendDate;

    property constRefCode : Integer read FconstRefCode write FconstRefCode; 
    property constRefName : WideString read FconstRefName write FconstRefName; 
  end;

  ArrayOfENStandardConstEntryShort = array of ENStandardConstEntryShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENStandardConstEntryShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENStandardConstEntryShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENStandardConstEntryShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENStandardConstEntryController/message/
  // soapAction: http://ksoe.org/ENStandardConstEntryController/action/ENStandardConstEntryController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENStandardConstEntryControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENStandardConstEntryController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENStandardConstEntryControllerSoapPort = interface(IInvokable)
  ['{355d355d-355d-355d-355d-355d355d355d}']
    function  add(const aENStandardConstEntry: ENStandardConstEntry): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENStandardConstEntry: ENStandardConstEntry); stdcall;
    function  getObject(const anObjectCode: Integer): ENStandardConstEntry; stdcall;
    function  getList: ENStandardConstEntryShortList; stdcall;
    function  getFilteredList(const aENStandardConstEntryFilter: ENStandardConstEntryFilter): ENStandardConstEntryShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENStandardConstEntryShortList; stdcall;
    function  getScrollableFilteredList(const aENStandardConstEntryFilter: ENStandardConstEntryFilter; const aFromPosition: Integer; const aQuantity: Integer): ENStandardConstEntryShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENStandardConstEntryShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENStandardConstEntryFilter: ENStandardConstEntryFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENStandardConstEntry.Destroy;
  begin
    if Assigned(FconstEntry) then
      ConstEntry.Free;
    if Assigned(FstartDate) then
      startDate.Free;
    if Assigned(FendDate) then
      endDate.Free;
    if Assigned(FconstRef) then
      constRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENStandardConstEntryFilter.Destroy;
  begin
    if Assigned(FConstEntry) then
      ConstEntry.Free;
    if Assigned(FstartDate) then
      startDate.Free;
    if Assigned(FendDate) then
      endDate.Free;
    if Assigned(FconstRef) then
      constRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENStandardConstEntryFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENStandardConstEntryShort.Destroy;
  begin
    if Assigned(FConstEntry) then
      ConstEntry.Free;
    if Assigned(FstartDate) then
      startDate.Free;
    if Assigned(FendDate) then
      endDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENStandardConstEntryShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENStandardConstEntry, 'http://ksoe.org/EnergyproControllerService/type/', 'ENStandardConstEntry');
  RemClassRegistry.RegisterXSClass(ENStandardConstEntryRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENStandardConstEntryRef');
  RemClassRegistry.RegisterXSClass(ENStandardConstEntryFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENStandardConstEntryFilter');
  RemClassRegistry.RegisterXSClass(ENStandardConstEntryShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENStandardConstEntryShort');
  RemClassRegistry.RegisterXSClass(ENStandardConstEntryShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENStandardConstEntryShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENStandardConstEntryShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENStandardConstEntryShort');

  InvRegistry.RegisterInterface(TypeInfo(ENStandardConstEntryControllerSoapPort), 'http://ksoe.org/ENStandardConstEntryController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENStandardConstEntryControllerSoapPort), 'http://ksoe.org/ENStandardConstEntryController/action/ENStandardConstEntryController.%operationName%');


end.
