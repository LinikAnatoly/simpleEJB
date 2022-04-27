unit ENGiveCounterController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENPlanWork2ClassificationTypeController
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

  ENGiveCounter            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENGiveCounterRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENGiveCounter = class(TRemotable)
  private
    Fcode : Integer;
    FcounterType : WideString;
    FserialNumber : WideString;
    Fcost : TXSDecimal;
    Fvat : TXSDecimal;
    FmolCode : WideString;
    FmolName : WideString;
    FdateBuild : TXSDate;
    Fphasity : Integer;
    FcommentGen : WideString;
//???
    Fplan2ClTypeRef : ENPlanWork2ClassificationTypeRef;
//???
    FservicesObjectRef : ENServicesObjectRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property counterType : WideString read FcounterType write FcounterType;
    property serialNumber : WideString read FserialNumber write FserialNumber;
    property cost : TXSDecimal read Fcost write Fcost;
    property vat : TXSDecimal read Fvat write Fvat;
    property molCode : WideString read FmolCode write FmolCode;
    property molName : WideString read FmolName write FmolName;
    property dateBuild : TXSDate read FdateBuild write FdateBuild;
    property  phasity : Integer read Fphasity write Fphasity;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property plan2ClTypeRef : ENPlanWork2ClassificationTypeRef read Fplan2ClTypeRef write Fplan2ClTypeRef;
    property servicesObjectRef : ENServicesObjectRef read FservicesObjectRef write FservicesObjectRef;
  end;

{
  ENGiveCounterFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcounterType : WideString;
    FserialNumber : WideString;
    Fcost : TXSDecimal;
    Fvat : TXSDecimal;
    FmolCode : WideString;
    FmolName : WideString;
    FdateBuild : TXSDate;
    Fphasity : Integer;
    FcommentGen : WideString;
//???
    Fplan2ClTypeRef : ENPlanWork2ClassificationTypeRef;
//???
    FservicesObjectRef : ENServicesObjectRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property counterType : WideString read FcounterType write FcounterType;
    property serialNumber : WideString read FserialNumber write FserialNumber;
    property cost : TXSDecimal read Fcost write Fcost;
    property vat : TXSDecimal read Fvat write Fvat;
    property molCode : WideString read FmolCode write FmolCode;
    property molName : WideString read FmolName write FmolName;
    property dateBuild : TXSDate read FdateBuild write FdateBuild;
    property  phasity : Integer read Fphasity write Fphasity;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property plan2ClTypeRef : ENPlanWork2ClassificationTypeRef read Fplan2ClTypeRef write Fplan2ClTypeRef;
    property servicesObjectRef : ENServicesObjectRef read FservicesObjectRef write FservicesObjectRef;
  end;
}

  ENGiveCounterFilter = class(ENGiveCounter)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENGiveCounterShort = class(TRemotable)
  private
    Fcode : Integer;
    FcounterType : WideString;
    FserialNumber : WideString;
    Fcost : TXSDecimal;
    Fvat : TXSDecimal;
    FmolCode : WideString;
    FmolName : WideString;
    FdateBuild : TXSDate;
    Fphasity : Integer;
    FcommentGen : WideString;
    Fplan2ClTypeRefCode : Integer;
    Fplan2ClTypeRefCountGen : TXSDecimal;
    Fplan2ClTypeRefUserGen : WideString;
    Fplan2ClTypeRefDateEdit : TXSDate;
    Fplan2ClTypeRefMachineHours : TXSDecimal;
    Fplan2ClTypeRefRelocationKm : TXSDecimal;
    Fplan2ClTypeRefTransportationLoad : TXSDecimal;
    Fplan2ClTypeRefIsPrintOnKmOrMH : Integer;
    Fplan2ClTypeRefCostWorksContractor : TXSDecimal;
    Fplan2ClTypeRefDateGen : TXSDate;
    Fplan2ClTypeRefTimeStart : TXSDateTime;
    Fplan2ClTypeRefTimeFinal : TXSDateTime;
    Fplan2ClTypeRefCodeVirtualBrigade : Integer;
    Fplan2ClTypeRefIsJobsByTime : Integer;
    Fplan2ClTypeRefIsVisitClient : Integer;
    Fplan2ClTypeRefProductionExpensesPercent : TXSDecimal;
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
    FservicesObjectRefCitiesList : WideString;
    FservicesObjectRefLineLength : TXSDecimal;
    FservicesObjectRefProjectCode : WideString;
    FservicesObjectRefCnPackCode : Integer;
    FservicesObjectRefDfPackCode : Integer;
    FservicesObjectRefCountersZoneType : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property counterType : WideString read FcounterType write FcounterType;
    property serialNumber : WideString read FserialNumber write FserialNumber;
    property cost : TXSDecimal read Fcost write Fcost;
    property vat : TXSDecimal read Fvat write Fvat;
    property molCode : WideString read FmolCode write FmolCode;
    property molName : WideString read FmolName write FmolName;
    property dateBuild : TXSDate read FdateBuild write FdateBuild;
    property  phasity : Integer read Fphasity write Fphasity;
    property commentGen : WideString read FcommentGen write FcommentGen;

    property plan2ClTypeRefCode : Integer read Fplan2ClTypeRefCode write Fplan2ClTypeRefCode;
    property plan2ClTypeRefCountGen : TXSDecimal read Fplan2ClTypeRefCountGen write Fplan2ClTypeRefCountGen;
    property plan2ClTypeRefUserGen : WideString read Fplan2ClTypeRefUserGen write Fplan2ClTypeRefUserGen;
    property plan2ClTypeRefDateEdit : TXSDate read Fplan2ClTypeRefDateEdit write Fplan2ClTypeRefDateEdit;
    property plan2ClTypeRefMachineHours : TXSDecimal read Fplan2ClTypeRefMachineHours write Fplan2ClTypeRefMachineHours;
    property plan2ClTypeRefRelocationKm : TXSDecimal read Fplan2ClTypeRefRelocationKm write Fplan2ClTypeRefRelocationKm;
    property plan2ClTypeRefTransportationLoad : TXSDecimal read Fplan2ClTypeRefTransportationLoad write Fplan2ClTypeRefTransportationLoad;
    property plan2ClTypeRefIsPrintOnKmOrMH : Integer read Fplan2ClTypeRefIsPrintOnKmOrMH write Fplan2ClTypeRefIsPrintOnKmOrMH;
    property plan2ClTypeRefCostWorksContractor : TXSDecimal read Fplan2ClTypeRefCostWorksContractor write Fplan2ClTypeRefCostWorksContractor;
    property plan2ClTypeRefDateGen : TXSDate read Fplan2ClTypeRefDateGen write Fplan2ClTypeRefDateGen;
    property plan2ClTypeRefTimeStart : TXSDateTime read Fplan2ClTypeRefTimeStart write Fplan2ClTypeRefTimeStart;
    property plan2ClTypeRefTimeFinal : TXSDateTime read Fplan2ClTypeRefTimeFinal write Fplan2ClTypeRefTimeFinal;
    property plan2ClTypeRefCodeVirtualBrigade : Integer read Fplan2ClTypeRefCodeVirtualBrigade write Fplan2ClTypeRefCodeVirtualBrigade;
    property plan2ClTypeRefIsJobsByTime : Integer read Fplan2ClTypeRefIsJobsByTime write Fplan2ClTypeRefIsJobsByTime;
    property plan2ClTypeRefIsVisitClient : Integer read Fplan2ClTypeRefIsVisitClient write Fplan2ClTypeRefIsVisitClient;
    property plan2ClTypeRefProductionExpensesPercent : TXSDecimal read Fplan2ClTypeRefProductionExpensesPercent write Fplan2ClTypeRefProductionExpensesPercent;
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
    property servicesObjectRefCitiesList : WideString read FservicesObjectRefCitiesList write FservicesObjectRefCitiesList;
    property servicesObjectRefLineLength : TXSDecimal read FservicesObjectRefLineLength write FservicesObjectRefLineLength;
    property servicesObjectRefProjectCode : WideString read FservicesObjectRefProjectCode write FservicesObjectRefProjectCode;
    property servicesObjectRefCnPackCode : Integer read FservicesObjectRefCnPackCode write FservicesObjectRefCnPackCode;
    property servicesObjectRefDfPackCode : Integer read FservicesObjectRefDfPackCode write FservicesObjectRefDfPackCode;
    property servicesObjectRefCountersZoneType : Integer read FservicesObjectRefCountersZoneType write FservicesObjectRefCountersZoneType;
  end;

  ArrayOfENGiveCounterShort = array of ENGiveCounterShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENGiveCounterShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENGiveCounterShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENGiveCounterShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENGiveCounterController/message/
  // soapAction: http://ksoe.org/ENGiveCounterController/action/ENGiveCounterController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENGiveCounterControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENGiveCounterController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENGiveCounterControllerSoapPort = interface(IInvokable)
  ['{9D395C4E-0F1A-41CC-9D38-9BD3872C4D79}']
    function add(const aENGiveCounter: ENGiveCounter): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENGiveCounter: ENGiveCounter); stdcall;
    function getObject(const anObjectCode: Integer): ENGiveCounter; stdcall;
    function getList: ENGiveCounterShortList; stdcall;
    function getFilteredList(const aENGiveCounterFilter: ENGiveCounterFilter): ENGiveCounterShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENGiveCounterShortList; stdcall;
    function getScrollableFilteredList(const aENGiveCounterFilter: ENGiveCounterFilter; const aFromPosition: Integer; const aQuantity: Integer): ENGiveCounterShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENGiveCounterShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENGiveCounterFilter: ENGiveCounterFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENGiveCounterShort; stdcall;
  end;


implementation

  destructor ENGiveCounter.Destroy;
  begin
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(Fvat) then
      vat.Free;
    if Assigned(FdateBuild) then
      dateBuild.Free;
    if Assigned(Fplan2ClTypeRef) then
      plan2ClTypeRef.Free;
    if Assigned(FservicesObjectRef) then
      servicesObjectRef.Free;
    inherited Destroy;
  end;

{
  destructor ENGiveCounterFilter.Destroy;
  begin
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(Fvat) then
      vat.Free;
    if Assigned(FdateBuild) then
      dateBuild.Free;
    if Assigned(Fplan2ClTypeRef) then
      plan2ClTypeRef.Free;
    if Assigned(FservicesObjectRef) then
      servicesObjectRef.Free;
    inherited Destroy;
  end;
}

  destructor ENGiveCounterFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENGiveCounterShort.Destroy;
  begin
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(Fvat) then
      vat.Free;
    if Assigned(FdateBuild) then
      dateBuild.Free;
    if Assigned(Fplan2ClTypeRefCountGen) then
      plan2ClTypeRefCountGen.Free;
    if Assigned(Fplan2ClTypeRefDateEdit) then
      plan2ClTypeRefDateEdit.Free;
    if Assigned(Fplan2ClTypeRefMachineHours) then
      plan2ClTypeRefMachineHours.Free;
    if Assigned(Fplan2ClTypeRefRelocationKm) then
      plan2ClTypeRefRelocationKm.Free;
    if Assigned(Fplan2ClTypeRefTransportationLoad) then
      plan2ClTypeRefTransportationLoad.Free;
    if Assigned(Fplan2ClTypeRefCostWorksContractor) then
      plan2ClTypeRefCostWorksContractor.Free;
    if Assigned(Fplan2ClTypeRefDateGen) then
      plan2ClTypeRefDateGen.Free;
    if Assigned(Fplan2ClTypeRefTimeStart) then
      plan2ClTypeRefTimeStart.Free;
    if Assigned(Fplan2ClTypeRefTimeFinal) then
      plan2ClTypeRefTimeFinal.Free;
    if Assigned(Fplan2ClTypeRefProductionExpensesPercent) then
      plan2ClTypeRefProductionExpensesPercent.Free;
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
    if Assigned(FservicesObjectRefLineLength) then
      servicesObjectRefLineLength.Free;
    inherited Destroy;
  end;

  destructor ENGiveCounterShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENGiveCounter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGiveCounter');
  RemClassRegistry.RegisterXSClass(ENGiveCounterRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGiveCounterRef');
  RemClassRegistry.RegisterXSClass(ENGiveCounterFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGiveCounterFilter');
  RemClassRegistry.RegisterXSClass(ENGiveCounterShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGiveCounterShort');
  RemClassRegistry.RegisterXSClass(ENGiveCounterShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGiveCounterShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENGiveCounterShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENGiveCounterShort');

  InvRegistry.RegisterInterface(TypeInfo(ENGiveCounterControllerSoapPort), 'http://ksoe.org/ENGiveCounterController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENGiveCounterControllerSoapPort), 'http://ksoe.org/ENGiveCounterController/action/ENGiveCounterController.%operationName%');


end.
