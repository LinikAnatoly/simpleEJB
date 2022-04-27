unit RQPlanPay2RQbudgetController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQPlanPayController
   ,RQBudgetController
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

  RQPlanPay2RQbudget            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPlanPay2RQbudgetRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPlanPay2RQbudget = class(TRemotable)
  private
    Fcode : Integer;
//???
    FplanPayRef : RQPlanPayRef;
//???
    FbudgetRef : RQBudgetRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property planPayRef : RQPlanPayRef read FplanPayRef write FplanPayRef;
    property budgetRef : RQBudgetRef read FbudgetRef write FbudgetRef;
  end;

{
  RQPlanPay2RQbudgetFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
//???
    FplanPayRef : RQPlanPayRef;
//???
    FbudgetRef : RQBudgetRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property planPayRef : RQPlanPayRef read FplanPayRef write FplanPayRef;
    property budgetRef : RQBudgetRef read FbudgetRef write FbudgetRef;
  end;
}

  RQPlanPay2RQbudgetFilter = class(RQPlanPay2RQbudget)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPlanPay2RQbudgetShort = class(TRemotable)
  private
    Fcode : Integer;
    FplanPayRefCode : Integer;
    FplanPayRefNumberDoc : WideString;
    FplanPayRefDateGen : TXSDate;
    FplanPayRefUserGen : WideString;
    FplanPayRefDateEdit : TXSDate;
    FbudgetRefCode : Integer;
    FbudgetRefNumberGen : WideString;
    FbudgetRefDateGen : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;

    property planPayRefCode : Integer read FplanPayRefCode write FplanPayRefCode;
    property planPayRefNumberDoc : WideString read FplanPayRefNumberDoc write FplanPayRefNumberDoc;
    property planPayRefDateGen : TXSDate read FplanPayRefDateGen write FplanPayRefDateGen;
    property planPayRefUserGen : WideString read FplanPayRefUserGen write FplanPayRefUserGen;
    property planPayRefDateEdit : TXSDate read FplanPayRefDateEdit write FplanPayRefDateEdit;
    property budgetRefCode : Integer read FbudgetRefCode write FbudgetRefCode;
    property budgetRefNumberGen : WideString read FbudgetRefNumberGen write FbudgetRefNumberGen;
    property budgetRefDateGen : TXSDate read FbudgetRefDateGen write FbudgetRefDateGen;
  end;

  ArrayOfRQPlanPay2RQbudgetShort = array of RQPlanPay2RQbudgetShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPlanPay2RQbudgetShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPlanPay2RQbudgetShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPlanPay2RQbudgetShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPlanPay2RQbudgetController/message/
  // soapAction: http://ksoe.org/RQPlanPay2RQbudgetController/action/RQPlanPay2RQbudgetController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPlanPay2RQbudgetControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPlanPay2RQbudgetController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPlanPay2RQbudgetControllerSoapPort = interface(IInvokable)
  ['{55FB74F8-7E1A-463F-BA6D-AFFBDEA66508}']
    function add(const aRQPlanPay2RQbudget: RQPlanPay2RQbudget): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPlanPay2RQbudget: RQPlanPay2RQbudget); stdcall;
    function getObject(const anObjectCode: Integer): RQPlanPay2RQbudget; stdcall;
    function getList: RQPlanPay2RQbudgetShortList; stdcall;
    function getFilteredList(const aRQPlanPay2RQbudgetFilter: RQPlanPay2RQbudgetFilter): RQPlanPay2RQbudgetShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPlanPay2RQbudgetShortList; stdcall;
    function getScrollableFilteredList(const aRQPlanPay2RQbudgetFilter: RQPlanPay2RQbudgetFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPlanPay2RQbudgetShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPlanPay2RQbudgetShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPlanPay2RQbudgetFilter: RQPlanPay2RQbudgetFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPlanPay2RQbudgetShort; stdcall;
  end;


implementation

  destructor RQPlanPay2RQbudget.Destroy;
  begin
    if Assigned(FplanPayRef) then
      planPayRef.Free;
    if Assigned(FbudgetRef) then
      budgetRef.Free;
    inherited Destroy;
  end;

{
  destructor RQPlanPay2RQbudgetFilter.Destroy;
  begin
    if Assigned(FplanPayRef) then
      planPayRef.Free;
    if Assigned(FbudgetRef) then
      budgetRef.Free;
    inherited Destroy;
  end;
}

  destructor RQPlanPay2RQbudgetFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQPlanPay2RQbudgetShort.Destroy;
  begin
    if Assigned(FplanPayRefDateGen) then
      planPayRefDateGen.Free;
    if Assigned(FplanPayRefDateEdit) then
      planPayRefDateEdit.Free;
    if Assigned(FbudgetRefDateGen) then
      budgetRefDateGen.Free;
    inherited Destroy;
  end;

  destructor RQPlanPay2RQbudgetShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPlanPay2RQbudget, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPay2RQbudget');
  RemClassRegistry.RegisterXSClass(RQPlanPay2RQbudgetRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPay2RQbudgetRef');
  RemClassRegistry.RegisterXSClass(RQPlanPay2RQbudgetFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPay2RQbudgetFilter');
  RemClassRegistry.RegisterXSClass(RQPlanPay2RQbudgetShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPay2RQbudgetShort');
  RemClassRegistry.RegisterXSClass(RQPlanPay2RQbudgetShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPay2RQbudgetShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPlanPay2RQbudgetShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPlanPay2RQbudgetShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPlanPay2RQbudgetControllerSoapPort), 'http://ksoe.org/RQPlanPay2RQbudgetController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPlanPay2RQbudgetControllerSoapPort), 'http://ksoe.org/RQPlanPay2RQbudgetController/action/RQPlanPay2RQbudgetController.%operationName%');


end.
