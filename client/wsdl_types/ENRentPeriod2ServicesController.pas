unit ENRentPeriod2ServicesController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENServicesObjectController
   ,ENCottageController
   ,ENRentPeriodStatusController
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

  ENRentPeriod2Services            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRentPeriod2ServicesRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRentPeriod2Services = class(TRemotable)
  private
    Fcode : Integer;
    FstartDate : TXSDate;
    FendDate : TXSDate;
//???
    FservicesObjectRef : ENServicesObjectRef;
//???
    FcottageRef : ENCottageRef;
//???
    FstatusRef : ENRentPeriodStatusRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property startDate : TXSDate read FstartDate write FstartDate;
    property endDate : TXSDate read FendDate write FendDate;
    property servicesObjectRef : ENServicesObjectRef read FservicesObjectRef write FservicesObjectRef;
    property cottageRef : ENCottageRef read FcottageRef write FcottageRef;
    property statusRef : ENRentPeriodStatusRef read FstatusRef write FstatusRef;
  end;

{
  ENRentPeriod2ServicesFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FstartDate : TXSDate;
    FendDate : TXSDate;
//???
    FservicesObjectRef : ENServicesObjectRef;
//???
    FcottageRef : ENCottageRef;
//???
    FstatusRef : ENRentPeriodStatusRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property startDate : TXSDate read FstartDate write FstartDate;
    property endDate : TXSDate read FendDate write FendDate;
    property servicesObjectRef : ENServicesObjectRef read FservicesObjectRef write FservicesObjectRef;
    property cottageRef : ENCottageRef read FcottageRef write FcottageRef;
    property statusRef : ENRentPeriodStatusRef read FstatusRef write FstatusRef;
  end;
}

  ENRentPeriod2ServicesFilter = class(ENRentPeriod2Services)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENRentPeriod2ServicesShort = class(TRemotable)
  private
    Fcode : Integer;
    FstartDate : TXSDate;
    FendDate : TXSDate;
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
    FservicesObjectRefIsCustomerMaterials : Integer;
    FservicesObjectRefPayDate : TXSDate;
    FservicesObjectRefFinPayFormCode : Integer;
    FservicesObjectRefFinPayFormName : WideString;
    FservicesObjectRefPartnerId : Integer;
    FservicesObjectRefPayDetail : WideString;
    FservicesObjectRefActTransferNumber : WideString;
    FservicesObjectRefActTransferDate : TXSDate;
    FservicesObjectRefResposible : WideString;
    FservicesObjectRefResposiblePosition : WideString;
    FservicesObjectRefResposibleTabNumber : WideString;
    FservicesObjectRefPrevContractStatus : Integer;
    FservicesObjectRefReconnectionTU : Integer;
    FservicesObjectRefPersonalAccountCode : Integer;
    FservicesObjectRefPersonalAccountNumber : WideString;
    FservicesObjectRefTabNumber : WideString;
    FservicesObjectRefCnPackCode : Integer;
    FservicesObjectRefDfPackCode : Integer;
    FservicesObjectRefCountersZoneType : Integer;
    FcottageRefCode : Integer;
    FcottageRefNumberGen : WideString;
    FcottageRefNumberBeds : Integer;
    FcottageRefDescription : WideString;
    FcottageRefCommentgen : WideString;
    FcottageRefUserGen : WideString;
    FcottageRefDateEdit : TXSDateTime;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property startDate : TXSDate read FstartDate write FstartDate;
    property endDate : TXSDate read FendDate write FendDate;

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
    property servicesObjectRefIsCustomerMaterials : Integer read FservicesObjectRefIsCustomerMaterials write FservicesObjectRefIsCustomerMaterials;
    property servicesObjectRefPayDate : TXSDate read FservicesObjectRefPayDate write FservicesObjectRefPayDate;
    property servicesObjectRefFinPayFormCode : Integer read FservicesObjectRefFinPayFormCode write FservicesObjectRefFinPayFormCode;
    property servicesObjectRefFinPayFormName : WideString read FservicesObjectRefFinPayFormName write FservicesObjectRefFinPayFormName;
    property servicesObjectRefPartnerId : Integer read FservicesObjectRefPartnerId write FservicesObjectRefPartnerId;
    property servicesObjectRefPayDetail : WideString read FservicesObjectRefPayDetail write FservicesObjectRefPayDetail;
    property servicesObjectRefActTransferNumber : WideString read FservicesObjectRefActTransferNumber write FservicesObjectRefActTransferNumber;
    property servicesObjectRefActTransferDate : TXSDate read FservicesObjectRefActTransferDate write FservicesObjectRefActTransferDate;
    property servicesObjectRefResposible : WideString read FservicesObjectRefResposible write FservicesObjectRefResposible;
    property servicesObjectRefResposiblePosition : WideString read FservicesObjectRefResposiblePosition write FservicesObjectRefResposiblePosition;
    property servicesObjectRefResposibleTabNumber : WideString read FservicesObjectRefResposibleTabNumber write FservicesObjectRefResposibleTabNumber;
    property servicesObjectRefPrevContractStatus : Integer read FservicesObjectRefPrevContractStatus write FservicesObjectRefPrevContractStatus;
    property servicesObjectRefReconnectionTU : Integer read FservicesObjectRefReconnectionTU write FservicesObjectRefReconnectionTU;
    property servicesObjectRefPersonalAccountCode : Integer read FservicesObjectRefPersonalAccountCode write FservicesObjectRefPersonalAccountCode;
    property servicesObjectRefPersonalAccountNumber : WideString read FservicesObjectRefPersonalAccountNumber write FservicesObjectRefPersonalAccountNumber;
    property servicesObjectRefTabNumber : WideString read FservicesObjectRefTabNumber write FservicesObjectRefTabNumber;
    property servicesObjectRefCnPackCode : Integer read FservicesObjectRefCnPackCode write FservicesObjectRefCnPackCode;
    property servicesObjectRefDfPackCode : Integer read FservicesObjectRefDfPackCode write FservicesObjectRefDfPackCode;
    property servicesObjectRefCountersZoneType : Integer read FservicesObjectRefCountersZoneType write FservicesObjectRefCountersZoneType;
    property cottageRefCode : Integer read FcottageRefCode write FcottageRefCode;
    property cottageRefNumberGen : WideString read FcottageRefNumberGen write FcottageRefNumberGen;
    property cottageRefNumberBeds : Integer read FcottageRefNumberBeds write FcottageRefNumberBeds;
    property cottageRefDescription : WideString read FcottageRefDescription write FcottageRefDescription;
    property cottageRefCommentgen : WideString read FcottageRefCommentgen write FcottageRefCommentgen;
    property cottageRefUserGen : WideString read FcottageRefUserGen write FcottageRefUserGen;
    property cottageRefDateEdit : TXSDateTime read FcottageRefDateEdit write FcottageRefDateEdit;
    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
  end;

  ArrayOfENRentPeriod2ServicesShort = array of ENRentPeriod2ServicesShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENRentPeriod2ServicesShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENRentPeriod2ServicesShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENRentPeriod2ServicesShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENRentPeriod2ServicesController/message/
  // soapAction: http://ksoe.org/ENRentPeriod2ServicesController/action/ENRentPeriod2ServicesController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENRentPeriod2ServicesControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENRentPeriod2ServicesController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENRentPeriod2ServicesControllerSoapPort = interface(IInvokable)
  ['{75A3B4F9-7F32-40EA-AAF8-2A392A97950E}']
    function add(const aENRentPeriod2Services: ENRentPeriod2Services): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENRentPeriod2Services: ENRentPeriod2Services); stdcall;
    function getObject(const anObjectCode: Integer): ENRentPeriod2Services; stdcall;
    function getList: ENRentPeriod2ServicesShortList; stdcall;
    function getFilteredList(const aENRentPeriod2ServicesFilter: ENRentPeriod2ServicesFilter): ENRentPeriod2ServicesShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENRentPeriod2ServicesShortList; stdcall;
    function getScrollableFilteredList(const aENRentPeriod2ServicesFilter: ENRentPeriod2ServicesFilter; const aFromPosition: Integer; const aQuantity: Integer): ENRentPeriod2ServicesShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENRentPeriod2ServicesShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENRentPeriod2ServicesFilter: ENRentPeriod2ServicesFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENRentPeriod2ServicesShort; stdcall;
  end;


implementation

  destructor ENRentPeriod2Services.Destroy;
  begin
    if Assigned(FstartDate) then
      startDate.Free;
    if Assigned(FendDate) then
      endDate.Free;
    if Assigned(FservicesObjectRef) then
      servicesObjectRef.Free;
    if Assigned(FcottageRef) then
      cottageRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end;

{
  destructor ENRentPeriod2ServicesFilter.Destroy;
  begin
    if Assigned(FstartDate) then
      startDate.Free;
    if Assigned(FendDate) then
      endDate.Free;
    if Assigned(FservicesObjectRef) then
      servicesObjectRef.Free;
    if Assigned(FcottageRef) then
      cottageRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end;
}

  destructor ENRentPeriod2ServicesFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENRentPeriod2ServicesShort.Destroy;
  begin
    if Assigned(FstartDate) then
      startDate.Free;
    if Assigned(FendDate) then
      endDate.Free;
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
    if Assigned(FservicesObjectRefActTransferDate) then
      servicesObjectRefActTransferDate.Free;
    if Assigned(FcottageRefDateEdit) then
      cottageRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENRentPeriod2ServicesShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENRentPeriod2Services, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRentPeriod2Services');
  RemClassRegistry.RegisterXSClass(ENRentPeriod2ServicesRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRentPeriod2ServicesRef');
  RemClassRegistry.RegisterXSClass(ENRentPeriod2ServicesFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRentPeriod2ServicesFilter');
  RemClassRegistry.RegisterXSClass(ENRentPeriod2ServicesShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRentPeriod2ServicesShort');
  RemClassRegistry.RegisterXSClass(ENRentPeriod2ServicesShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRentPeriod2ServicesShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENRentPeriod2ServicesShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENRentPeriod2ServicesShort');

  InvRegistry.RegisterInterface(TypeInfo(ENRentPeriod2ServicesControllerSoapPort), 'http://ksoe.org/ENRentPeriod2ServicesController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENRentPeriod2ServicesControllerSoapPort), 'http://ksoe.org/ENRentPeriod2ServicesController/action/ENRentPeriod2ServicesController.%operationName%');


end.
