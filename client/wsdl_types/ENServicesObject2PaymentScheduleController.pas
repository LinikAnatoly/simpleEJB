unit ENServicesObject2PaymentScheduleController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENServicesObjectController 
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

  ENServicesObject2PaymentSchedule            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesObject2PaymentScheduleRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesObject2PaymentSchedule = class(TRemotable)
  private
    Fcode : Integer; 
    FstartDate : TXSDate;
    FendDate : TXSDate;
    FpaySum : TXSDecimal;
//???
    FservicesObjectRef : ENServicesObjectRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property startDate : TXSDate read FstartDate write FstartDate;
    property endDate : TXSDate read FendDate write FendDate;
    property paySum : TXSDecimal read FpaySum write FpaySum; 
    property servicesObjectRef : ENServicesObjectRef read FservicesObjectRef write FservicesObjectRef; 
  end;
  
{
  ENServicesObject2PaymentScheduleFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FstartDate : TXSDate;
    FendDate : TXSDate;
    FpaySum : TXSDecimal;
//???
    FservicesObjectRef : ENServicesObjectRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property startDate : TXSDate read FstartDate write FstartDate;
    property endDate : TXSDate read FendDate write FendDate;
    property paySum : TXSDecimal read FpaySum write FpaySum; 
    property servicesObjectRef : ENServicesObjectRef read FservicesObjectRef write FservicesObjectRef; 
  end;
}

  ENServicesObject2PaymentScheduleFilter = class(ENServicesObject2PaymentSchedule)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENServicesObject2PaymentScheduleShort = class(TRemotable)
  private
    Fcode : Integer; 
    FstartDate : TXSDate;	
    FendDate : TXSDate;	
    FpaySum : TXSDecimal;
    FservicesObjectRefCode : Integer; 
    FservicesObjectRefContractNumber : WideString;
    FservicesObjectRefContractDate : TXSDate;
    FservicesObjectRefName : WideString;
    FservicesObjectRefPartnerCode : WideString;
    FservicesObjectRefFinDocCode : WideString;
    FservicesObjectRefFinDocID : Integer; 
    FservicesObjectRefCommentGen : WideString;
    FservicesObjectRefContractNumberServices : WideString;
    FservicesObjectRefContractDateServices : TXSDate;
    FservicesObjectRefContragentName : WideString;
    FservicesObjectRefContragentAddress : WideString;
    FservicesObjectRefContragentAddressWork : WideString;
    FservicesObjectRefContragentOkpo : WideString;
    FservicesObjectRefContragentBankAccount : WideString;
    FservicesObjectRefContragentBankName : WideString;
    FservicesObjectRefContragentBankMfo : WideString;
    FservicesObjectRefContragentBossName : WideString;
    FservicesObjectRefContragentPassport : WideString;
    FservicesObjectRefContractServicesSumma : TXSDecimal;
    FservicesObjectRefContractServicesPower : TXSDecimal;
    FservicesObjectRefCommentServicesGen : WideString;
    FservicesObjectRefContractServicesDistance : TXSDecimal;
    FservicesObjectRefContractServicesDay : TXSDecimal;
    FservicesObjectRefUserGen : WideString;
    FservicesObjectRefDateEdit : TXSDate;
    FservicesObjectRefWarrantDate : TXSDate;
    FservicesObjectRefWarrantNumber : WideString;
    FservicesObjectRefWarrantFIO : WideString;
    FservicesObjectRefRegionalType : Integer; 
    FservicesObjectRefBasisType : TXSDecimal;
    FservicesObjectRefContragentPosition : WideString;
    FservicesObjectRefExecuteWorkDate : TXSDate;
    FservicesObjectRefTimeStart : TXSDateTime;	
    FservicesObjectRefTimeFinal : TXSDateTime;	
    FservicesObjectRefContragentPhoneNumber : WideString;
    FservicesObjectRefExecutorPhoneNumber : WideString;
    FservicesObjectRefContragentObjectWork : WideString;
    FservicesObjectRefIsNoPay : Integer; 
    FservicesObjectRefPayDate : TXSDate;
    FservicesObjectRefFinPayFormCode : Integer; 
    FservicesObjectRefFinPayFormName : WideString;
    FservicesObjectRefPartnerId : Integer; 
    FservicesObjectRefPayDetail : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property startDate : TXSDate read FstartDate write FstartDate;
    property endDate : TXSDate read FendDate write FendDate;
    property paySum : TXSDecimal read FpaySum write FpaySum; 

    property servicesObjectRefCode : Integer read FservicesObjectRefCode write FservicesObjectRefCode; 
    property servicesObjectRefContractNumber : WideString read FservicesObjectRefContractNumber write FservicesObjectRefContractNumber; 
    property servicesObjectRefContractDate : TXSDate read FservicesObjectRefContractDate write FservicesObjectRefContractDate; 
    property servicesObjectRefName : WideString read FservicesObjectRefName write FservicesObjectRefName; 
    property servicesObjectRefPartnerCode : WideString read FservicesObjectRefPartnerCode write FservicesObjectRefPartnerCode; 
    property servicesObjectRefFinDocCode : WideString read FservicesObjectRefFinDocCode write FservicesObjectRefFinDocCode; 
    property servicesObjectRefFinDocID : Integer read FservicesObjectRefFinDocID write FservicesObjectRefFinDocID; 
    property servicesObjectRefCommentGen : WideString read FservicesObjectRefCommentGen write FservicesObjectRefCommentGen; 
    property servicesObjectRefContractNumberServices : WideString read FservicesObjectRefContractNumberServices write FservicesObjectRefContractNumberServices; 
    property servicesObjectRefContractDateServices : TXSDate read FservicesObjectRefContractDateServices write FservicesObjectRefContractDateServices; 
    property servicesObjectRefContragentName : WideString read FservicesObjectRefContragentName write FservicesObjectRefContragentName; 
    property servicesObjectRefContragentAddress : WideString read FservicesObjectRefContragentAddress write FservicesObjectRefContragentAddress; 
    property servicesObjectRefContragentAddressWork : WideString read FservicesObjectRefContragentAddressWork write FservicesObjectRefContragentAddressWork; 
    property servicesObjectRefContragentOkpo : WideString read FservicesObjectRefContragentOkpo write FservicesObjectRefContragentOkpo; 
    property servicesObjectRefContragentBankAccount : WideString read FservicesObjectRefContragentBankAccount write FservicesObjectRefContragentBankAccount; 
    property servicesObjectRefContragentBankName : WideString read FservicesObjectRefContragentBankName write FservicesObjectRefContragentBankName; 
    property servicesObjectRefContragentBankMfo : WideString read FservicesObjectRefContragentBankMfo write FservicesObjectRefContragentBankMfo; 
    property servicesObjectRefContragentBossName : WideString read FservicesObjectRefContragentBossName write FservicesObjectRefContragentBossName; 
    property servicesObjectRefContragentPassport : WideString read FservicesObjectRefContragentPassport write FservicesObjectRefContragentPassport; 
    property servicesObjectRefContractServicesSumma : TXSDecimal read FservicesObjectRefContractServicesSumma write FservicesObjectRefContractServicesSumma; 
    property servicesObjectRefContractServicesPower : TXSDecimal read FservicesObjectRefContractServicesPower write FservicesObjectRefContractServicesPower; 
    property servicesObjectRefCommentServicesGen : WideString read FservicesObjectRefCommentServicesGen write FservicesObjectRefCommentServicesGen; 
    property servicesObjectRefContractServicesDistance : TXSDecimal read FservicesObjectRefContractServicesDistance write FservicesObjectRefContractServicesDistance; 
    property servicesObjectRefContractServicesDay : TXSDecimal read FservicesObjectRefContractServicesDay write FservicesObjectRefContractServicesDay; 
    property servicesObjectRefUserGen : WideString read FservicesObjectRefUserGen write FservicesObjectRefUserGen; 
    property servicesObjectRefDateEdit : TXSDate read FservicesObjectRefDateEdit write FservicesObjectRefDateEdit; 
    property servicesObjectRefWarrantDate : TXSDate read FservicesObjectRefWarrantDate write FservicesObjectRefWarrantDate; 
    property servicesObjectRefWarrantNumber : WideString read FservicesObjectRefWarrantNumber write FservicesObjectRefWarrantNumber; 
    property servicesObjectRefWarrantFIO : WideString read FservicesObjectRefWarrantFIO write FservicesObjectRefWarrantFIO; 
    property servicesObjectRefRegionalType : Integer read FservicesObjectRefRegionalType write FservicesObjectRefRegionalType; 
    property servicesObjectRefBasisType : TXSDecimal read FservicesObjectRefBasisType write FservicesObjectRefBasisType; 
    property servicesObjectRefContragentPosition : WideString read FservicesObjectRefContragentPosition write FservicesObjectRefContragentPosition; 
    property servicesObjectRefExecuteWorkDate : TXSDate read FservicesObjectRefExecuteWorkDate write FservicesObjectRefExecuteWorkDate; 
    property servicesObjectRefTimeStart : TXSDateTime read FservicesObjectRefTimeStart write FservicesObjectRefTimeStart; 
    property servicesObjectRefTimeFinal : TXSDateTime read FservicesObjectRefTimeFinal write FservicesObjectRefTimeFinal; 
    property servicesObjectRefContragentPhoneNumber : WideString read FservicesObjectRefContragentPhoneNumber write FservicesObjectRefContragentPhoneNumber; 
    property servicesObjectRefExecutorPhoneNumber : WideString read FservicesObjectRefExecutorPhoneNumber write FservicesObjectRefExecutorPhoneNumber; 
    property servicesObjectRefContragentObjectWork : WideString read FservicesObjectRefContragentObjectWork write FservicesObjectRefContragentObjectWork; 
    property servicesObjectRefIsNoPay : Integer read FservicesObjectRefIsNoPay write FservicesObjectRefIsNoPay; 
    property servicesObjectRefPayDate : TXSDate read FservicesObjectRefPayDate write FservicesObjectRefPayDate; 
    property servicesObjectRefFinPayFormCode : Integer read FservicesObjectRefFinPayFormCode write FservicesObjectRefFinPayFormCode; 
    property servicesObjectRefFinPayFormName : WideString read FservicesObjectRefFinPayFormName write FservicesObjectRefFinPayFormName; 
    property servicesObjectRefPartnerId : Integer read FservicesObjectRefPartnerId write FservicesObjectRefPartnerId; 
    property servicesObjectRefPayDetail : WideString read FservicesObjectRefPayDetail write FservicesObjectRefPayDetail; 
  end;

  ArrayOfENServicesObject2PaymentScheduleShort = array of ENServicesObject2PaymentScheduleShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENServicesObject2PaymentScheduleShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENServicesObject2PaymentScheduleShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENServicesObject2PaymentScheduleShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENServicesObject2PaymentScheduleController/message/
  // soapAction: http://ksoe.org/ENServicesObject2PaymentScheduleController/action/ENServicesObject2PaymentScheduleController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENServicesObject2PaymentScheduleControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENServicesObject2PaymentScheduleController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENServicesObject2PaymentScheduleControllerSoapPort = interface(IInvokable)
  ['{18511851-1851-1851-1851-185118511851}']
    function  add(const aENServicesObject2PaymentSchedule: ENServicesObject2PaymentSchedule): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENServicesObject2PaymentSchedule: ENServicesObject2PaymentSchedule); stdcall;
    function  getObject(const anObjectCode: Integer): ENServicesObject2PaymentSchedule; stdcall;
    function  getList: ENServicesObject2PaymentScheduleShortList; stdcall;
    function  getFilteredList(const aENServicesObject2PaymentScheduleFilter: ENServicesObject2PaymentScheduleFilter): ENServicesObject2PaymentScheduleShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENServicesObject2PaymentScheduleShortList; stdcall;
    function  getScrollableFilteredList(const aENServicesObject2PaymentScheduleFilter: ENServicesObject2PaymentScheduleFilter; const aFromPosition: Integer; const aQuantity: Integer): ENServicesObject2PaymentScheduleShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENServicesObject2PaymentScheduleShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENServicesObject2PaymentScheduleFilter: ENServicesObject2PaymentScheduleFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENServicesObject2PaymentSchedule.Destroy;
  begin
    if Assigned(FstartDate) then
      startDate.Free;
    if Assigned(FendDate) then
      endDate.Free;
    if Assigned(FpaySum) then
      paySum.Free;
    if Assigned(FservicesObjectRef) then
      servicesObjectRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENServicesObject2PaymentScheduleFilter.Destroy;
  begin
    if Assigned(FstartDate) then
      startDate.Free;
    if Assigned(FendDate) then
      endDate.Free;
    if Assigned(FpaySum) then
      paySum.Free;
    if Assigned(FservicesObjectRef) then
      servicesObjectRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENServicesObject2PaymentScheduleFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENServicesObject2PaymentScheduleShort.Destroy;
  begin
    if Assigned(FstartDate) then
      startDate.Free;
    if Assigned(FendDate) then
      endDate.Free;
    if Assigned(FpaySum) then
      paySum.Free;
    if Assigned(FservicesObjectRefContractDate) then
      servicesObjectRefContractDate.Free;
    if Assigned(FservicesObjectRefContractDateServices) then
      servicesObjectRefContractDateServices.Free;
    if Assigned(FservicesObjectRefContractServicesSumma) then
      servicesObjectRefContractServicesSumma.Free;
    if Assigned(FservicesObjectRefContractServicesPower) then
      servicesObjectRefContractServicesPower.Free;
    if Assigned(FservicesObjectRefContractServicesDistance) then
      servicesObjectRefContractServicesDistance.Free;
    if Assigned(FservicesObjectRefContractServicesDay) then
      servicesObjectRefContractServicesDay.Free;
    if Assigned(FservicesObjectRefDateEdit) then
      servicesObjectRefDateEdit.Free;
    if Assigned(FservicesObjectRefWarrantDate) then
      servicesObjectRefWarrantDate.Free;
    if Assigned(FservicesObjectRefBasisType) then
      servicesObjectRefBasisType.Free;
    if Assigned(FservicesObjectRefExecuteWorkDate) then
      servicesObjectRefExecuteWorkDate.Free;
    if Assigned(FservicesObjectRefTimeStart) then
      servicesObjectRefTimeStart.Free;
    if Assigned(FservicesObjectRefTimeFinal) then
      servicesObjectRefTimeFinal.Free;
    if Assigned(FservicesObjectRefPayDate) then
      servicesObjectRefPayDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENServicesObject2PaymentScheduleShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENServicesObject2PaymentSchedule, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesObject2PaymentSchedule');
  RemClassRegistry.RegisterXSClass(ENServicesObject2PaymentScheduleRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesObject2PaymentScheduleRef');
  RemClassRegistry.RegisterXSClass(ENServicesObject2PaymentScheduleFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesObject2PaymentScheduleFilter');
  RemClassRegistry.RegisterXSClass(ENServicesObject2PaymentScheduleShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesObject2PaymentScheduleShort');
  RemClassRegistry.RegisterXSClass(ENServicesObject2PaymentScheduleShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesObject2PaymentScheduleShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENServicesObject2PaymentScheduleShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENServicesObject2PaymentScheduleShort');

  InvRegistry.RegisterInterface(TypeInfo(ENServicesObject2PaymentScheduleControllerSoapPort), 'http://ksoe.org/ENServicesObject2PaymentScheduleController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENServicesObject2PaymentScheduleControllerSoapPort), 'http://ksoe.org/ENServicesObject2PaymentScheduleController/action/ENServicesObject2PaymentScheduleController.%operationName%');


end.
