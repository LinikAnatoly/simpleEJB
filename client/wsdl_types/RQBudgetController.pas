unit RQBudgetController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQBudgetStatusController
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

  RQBudget            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBudgetRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBudget = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FcommentGen : WideString;
//???
    FstatusRef : RQBudgetStatusRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property statusRef : RQBudgetStatusRef read FstatusRef write FstatusRef;
  end;

{
  RQBudgetFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FcommentGen : WideString;
//???
    FstatusRef : RQBudgetStatusRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property statusRef : RQBudgetStatusRef read FstatusRef write FstatusRef;
  end;
}

  RQBudgetFilter = class(RQBudget)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQBudgetShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;

    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
  end;

  ArrayOfRQBudgetShort = array of RQBudgetShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQBudgetShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQBudgetShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQBudgetShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQBudgetController/message/
  // soapAction: http://ksoe.org/RQBudgetController/action/RQBudgetController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQBudgetControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQBudgetController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQBudgetControllerSoapPort = interface(IInvokable)
  ['{CCA6E530-07DE-4A91-AA9A-C2E6E9361150}']
    function add(const aRQBudget: RQBudget): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQBudget: RQBudget); stdcall;
    function getObject(const anObjectCode: Integer): RQBudget; stdcall;
    function getList: RQBudgetShortList; stdcall;
    function getFilteredList(const aRQBudgetFilter: RQBudgetFilter): RQBudgetShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQBudgetShortList; stdcall;
    function getScrollableFilteredList(const aRQBudgetFilter: RQBudgetFilter; const aFromPosition: Integer; const aQuantity: Integer): RQBudgetShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQBudgetShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQBudgetFilter: RQBudgetFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQBudgetShort; stdcall;

    procedure approve(const anObjectCode: Integer); stdcall;
    procedure unApprove(const anObjectCode: Integer); stdcall;

  end;


implementation

  destructor RQBudget.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end;

{
  destructor RQBudgetFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end;
}

  destructor RQBudgetFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQBudgetShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    inherited Destroy;
  end;

  destructor RQBudgetShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQBudget, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBudget');
  RemClassRegistry.RegisterXSClass(RQBudgetRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBudgetRef');
  RemClassRegistry.RegisterXSClass(RQBudgetFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBudgetFilter');
  RemClassRegistry.RegisterXSClass(RQBudgetShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBudgetShort');
  RemClassRegistry.RegisterXSClass(RQBudgetShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBudgetShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQBudgetShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQBudgetShort');

  InvRegistry.RegisterInterface(TypeInfo(RQBudgetControllerSoapPort), 'http://ksoe.org/RQBudgetController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQBudgetControllerSoapPort), 'http://ksoe.org/RQBudgetController/action/RQBudgetController.%operationName%');


end.
