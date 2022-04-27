unit ENServicesHumenSalaryController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENServicesCostController
   ,TKCalcHumenSalaryController
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

  ENServicesHumenSalary            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesHumenSalaryRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesHumenSalary = class(TRemotable)
  private
    Fcode : Integer;
    FtimeGen : TXSDecimal;
    Fsalary : TXSDecimal;
    FsalaryBonus : TXSDecimal;
    FsalarySurcharge : TXSDecimal;
    FsalaryPremium : TXSDecimal;
    FsalaryAdditional : TXSDecimal;
    FsalaryTotalBonus : TXSDecimal;
    FsalaryTotal : TXSDecimal;
//???
    FservicesCostRef : ENServicesCostRef;
//???
    FcalcHumenSalaryRef : TKCalcHumenSalaryRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property timeGen : TXSDecimal read FtimeGen write FtimeGen;
    property salary : TXSDecimal read Fsalary write Fsalary;
    property salaryBonus : TXSDecimal read FsalaryBonus write FsalaryBonus;
    property salarySurcharge : TXSDecimal read FsalarySurcharge write FsalarySurcharge;
    property salaryPremium : TXSDecimal read FsalaryPremium write FsalaryPremium;
    property salaryAdditional : TXSDecimal read FsalaryAdditional write FsalaryAdditional;
    property salaryTotalBonus : TXSDecimal read FsalaryTotalBonus write FsalaryTotalBonus;
    property salaryTotal : TXSDecimal read FsalaryTotal write FsalaryTotal;
    property servicesCostRef : ENServicesCostRef read FservicesCostRef write FservicesCostRef;
    property calcHumenSalaryRef : TKCalcHumenSalaryRef read FcalcHumenSalaryRef write FcalcHumenSalaryRef;
  end;

{
  ENServicesHumenSalaryFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FtimeGen : TXSDecimal;
    Fsalary : TXSDecimal;
    FsalaryBonus : TXSDecimal;
    FsalarySurcharge : TXSDecimal;
    FsalaryPremium : TXSDecimal;
    FsalaryAdditional : TXSDecimal;
    FsalaryTotalBonus : TXSDecimal;
    FsalaryTotal : TXSDecimal;
//???
    FservicesCostRef : ENServicesCostRef;
//???
    FcalcHumenSalaryRef : TKCalcHumenSalaryRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property timeGen : TXSDecimal read FtimeGen write FtimeGen;
    property salary : TXSDecimal read Fsalary write Fsalary;
    property salaryBonus : TXSDecimal read FsalaryBonus write FsalaryBonus;
    property salarySurcharge : TXSDecimal read FsalarySurcharge write FsalarySurcharge;
    property salaryPremium : TXSDecimal read FsalaryPremium write FsalaryPremium;
    property salaryAdditional : TXSDecimal read FsalaryAdditional write FsalaryAdditional;
    property salaryTotalBonus : TXSDecimal read FsalaryTotalBonus write FsalaryTotalBonus;
    property salaryTotal : TXSDecimal read FsalaryTotal write FsalaryTotal;
    property servicesCostRef : ENServicesCostRef read FservicesCostRef write FservicesCostRef;
    property calcHumenSalaryRef : TKCalcHumenSalaryRef read FcalcHumenSalaryRef write FcalcHumenSalaryRef;
  end;
}

  ENServicesHumenSalaryFilter = class(ENServicesHumenSalary)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENServicesHumenSalaryShort = class(TRemotable)
  private
    Fcode : Integer;
    FtimeGen : TXSDecimal;
	FpositionName : WideString;
	FsalaryHour : TXSDecimal;
    Fsalary : TXSDecimal;
    FsalaryTotalBonus : TXSDecimal;
    FsalaryTotal : TXSDecimal;
    FservicesCostRefCode : Integer;
    FservicesCostRefDateGen : TXSDate;
    FservicesCostRefCalculationCost : TXSDecimal;
    FservicesCostRefCostWithoutVAT : TXSDecimal;
    FservicesCostRefCostVAT : TXSDecimal;
    FservicesCostRefCostWithVAT : TXSDecimal;
    FcalcHumenSalaryRefCode : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property timeGen : TXSDecimal read FtimeGen write FtimeGen;
    property salary : TXSDecimal read Fsalary write Fsalary;
	property positionName : WideString read FpositionName write FpositionName;
	property salaryHour : TXSDecimal read FsalaryHour write FsalaryHour;
    property salaryTotalBonus : TXSDecimal read FsalaryTotalBonus write FsalaryTotalBonus;
    property salaryTotal : TXSDecimal read FsalaryTotal write FsalaryTotal;

    property servicesCostRefCode : Integer read FservicesCostRefCode write FservicesCostRefCode;
    property servicesCostRefDateGen : TXSDate read FservicesCostRefDateGen write FservicesCostRefDateGen;
    property servicesCostRefCalculationCost : TXSDecimal read FservicesCostRefCalculationCost write FservicesCostRefCalculationCost;
    property servicesCostRefCostWithoutVAT : TXSDecimal read FservicesCostRefCostWithoutVAT write FservicesCostRefCostWithoutVAT;
    property servicesCostRefCostVAT : TXSDecimal read FservicesCostRefCostVAT write FservicesCostRefCostVAT;
    property servicesCostRefCostWithVAT : TXSDecimal read FservicesCostRefCostWithVAT write FservicesCostRefCostWithVAT;
    property calcHumenSalaryRefCode : Integer read FcalcHumenSalaryRefCode write FcalcHumenSalaryRefCode;
  end;

  ArrayOfENServicesHumenSalaryShort = array of ENServicesHumenSalaryShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENServicesHumenSalaryShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENServicesHumenSalaryShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENServicesHumenSalaryShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENServicesHumenSalaryController/message/
  // soapAction: http://ksoe.org/ENServicesHumenSalaryController/action/ENServicesHumenSalaryController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENServicesHumenSalaryControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENServicesHumenSalaryController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENServicesHumenSalaryControllerSoapPort = interface(IInvokable)
  ['{45BEC4B2-3FEC-4E7A-A36C-B20E9B953D99}']
    function add(const aENServicesHumenSalary: ENServicesHumenSalary): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENServicesHumenSalary: ENServicesHumenSalary); stdcall;
    function getObject(const anObjectCode: Integer): ENServicesHumenSalary; stdcall;
    function getList: ENServicesHumenSalaryShortList; stdcall;
    function getFilteredList(const aENServicesHumenSalaryFilter: ENServicesHumenSalaryFilter): ENServicesHumenSalaryShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENServicesHumenSalaryShortList; stdcall;
    function getScrollableFilteredList(const aENServicesHumenSalaryFilter: ENServicesHumenSalaryFilter; const aFromPosition: Integer; const aQuantity: Integer): ENServicesHumenSalaryShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENServicesHumenSalaryShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENServicesHumenSalaryFilter: ENServicesHumenSalaryFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENServicesHumenSalaryShort; stdcall;
  end;


implementation

  destructor ENServicesHumenSalary.Destroy;
  begin
    if Assigned(FtimeGen) then
      timeGen.Free;
    if Assigned(Fsalary) then
      salary.Free;
    if Assigned(FsalaryBonus) then
      salaryBonus.Free;
    if Assigned(FsalarySurcharge) then
      salarySurcharge.Free;
    if Assigned(FsalaryPremium) then
      salaryPremium.Free;
    if Assigned(FsalaryAdditional) then
      salaryAdditional.Free;
    if Assigned(FsalaryTotalBonus) then
      salaryTotalBonus.Free;
    if Assigned(FsalaryTotal) then
      salaryTotal.Free;
    if Assigned(FservicesCostRef) then
      servicesCostRef.Free;
    if Assigned(FcalcHumenSalaryRef) then
      calcHumenSalaryRef.Free;
    inherited Destroy;
  end;

{
  destructor ENServicesHumenSalaryFilter.Destroy;
  begin
    if Assigned(FtimeGen) then
      timeGen.Free;
    if Assigned(Fsalary) then
      salary.Free;
    if Assigned(FsalaryBonus) then
      salaryBonus.Free;
    if Assigned(FsalarySurcharge) then
      salarySurcharge.Free;
    if Assigned(FsalaryPremium) then
      salaryPremium.Free;
    if Assigned(FsalaryAdditional) then
      salaryAdditional.Free;
    if Assigned(FsalaryTotalBonus) then
      salaryTotalBonus.Free;
    if Assigned(FsalaryTotal) then
      salaryTotal.Free;
    if Assigned(FservicesCostRef) then
      servicesCostRef.Free;
    if Assigned(FcalcHumenSalaryRef) then
      calcHumenSalaryRef.Free;
    inherited Destroy;
  end;
}

  destructor ENServicesHumenSalaryFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENServicesHumenSalaryShort.Destroy;
  begin
    if Assigned(FtimeGen) then
      timeGen.Free;
    if Assigned(Fsalary) then
      salary.Free;
    if Assigned(FsalaryTotalBonus) then
      salaryTotalBonus.Free;
    if Assigned(FsalaryTotal) then
      salaryTotal.Free;
    if Assigned(FservicesCostRefDateGen) then
      servicesCostRefDateGen.Free;
    if Assigned(FservicesCostRefCalculationCost) then
      servicesCostRefCalculationCost.Free;
    if Assigned(FservicesCostRefCostWithoutVAT) then
      servicesCostRefCostWithoutVAT.Free;
    if Assigned(FservicesCostRefCostVAT) then
      servicesCostRefCostVAT.Free;
    if Assigned(FservicesCostRefCostWithVAT) then
      servicesCostRefCostWithVAT.Free;
    inherited Destroy;
  end;

  destructor ENServicesHumenSalaryShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENServicesHumenSalary, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesHumenSalary');
  RemClassRegistry.RegisterXSClass(ENServicesHumenSalaryRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesHumenSalaryRef');
  RemClassRegistry.RegisterXSClass(ENServicesHumenSalaryFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesHumenSalaryFilter');
  RemClassRegistry.RegisterXSClass(ENServicesHumenSalaryShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesHumenSalaryShort');
  RemClassRegistry.RegisterXSClass(ENServicesHumenSalaryShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesHumenSalaryShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENServicesHumenSalaryShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENServicesHumenSalaryShort');

  InvRegistry.RegisterInterface(TypeInfo(ENServicesHumenSalaryControllerSoapPort), 'http://ksoe.org/ENServicesHumenSalaryController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENServicesHumenSalaryControllerSoapPort), 'http://ksoe.org/ENServicesHumenSalaryController/action/ENServicesHumenSalaryController.%operationName%');


end.
