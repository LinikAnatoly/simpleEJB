unit RQApCost2Item2ServicesController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQApCost2Item2ServicesStatusController
   ,RQApprovedCostController
   ,RQOrderItemController
   ,ENEstimateItemController
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

  RQApCost2Item2Services            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQApCost2Item2ServicesRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQApCost2Item2Services = class(TRemotable)
  private
    Fcode : Integer;
    FcounterInvNumber : WideString;
    FcounterZoneType : Integer;
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    FstatusRef : RQApCost2Item2ServicesStatusRef;
//???
    FapprovedCostRef : RQApprovedCostRef;
//???
    FrqOrderItemRef : RQOrderItemRef;
//???
    FestimateItemRef : ENEstimateItemRef;
//???
    FservicesObjectRef : ENServicesObjectRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property counterInvNumber : WideString read FcounterInvNumber write FcounterInvNumber;
    property  counterZoneType : Integer read FcounterZoneType write FcounterZoneType;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property statusRef : RQApCost2Item2ServicesStatusRef read FstatusRef write FstatusRef;
    property approvedCostRef : RQApprovedCostRef read FapprovedCostRef write FapprovedCostRef;
    property rqOrderItemRef : RQOrderItemRef read FrqOrderItemRef write FrqOrderItemRef;
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef;
    property servicesObjectRef : ENServicesObjectRef read FservicesObjectRef write FservicesObjectRef;
  end;

{
  RQApCost2Item2ServicesFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcounterInvNumber : WideString;
    FcounterZoneType : Integer;
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    FstatusRef : RQApCost2Item2ServicesStatusRef;
//???
    FapprovedCostRef : RQApprovedCostRef;
//???
    FrqOrderItemRef : RQOrderItemRef;
//???
    FestimateItemRef : ENEstimateItemRef;
//???
    FservicesObjectRef : ENServicesObjectRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property counterInvNumber : WideString read FcounterInvNumber write FcounterInvNumber;
    property  counterZoneType : Integer read FcounterZoneType write FcounterZoneType;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property statusRef : RQApCost2Item2ServicesStatusRef read FstatusRef write FstatusRef;
    property approvedCostRef : RQApprovedCostRef read FapprovedCostRef write FapprovedCostRef;
    property rqOrderItemRef : RQOrderItemRef read FrqOrderItemRef write FrqOrderItemRef;
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef;
    property servicesObjectRef : ENServicesObjectRef read FservicesObjectRef write FservicesObjectRef;
  end;
}

  RQApCost2Item2ServicesFilter = class(RQApCost2Item2Services)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQApCost2Item2ServicesShort = class(TRemotable)
  private
    Fcode : Integer;
    FcounterInvNumber : WideString;
    FcounterZoneType : Integer;
    FuserGen : WideString;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;
    FapprovedCostRefCode : Integer;
    FapprovedCostRefCountGen : TXSDecimal;
    FapprovedCostRefCountFact : TXSDecimal;
    FapprovedCostRefPriceWithoutNds : TXSDecimal;
    FapprovedCostRefCounterPhasity : Integer;
    FapprovedCostRefDateEdit : TXSDateTime;
    FapprovedCostRefUserGen : WideString;
    FrqOrderItemRefCode : Integer;
    FrqOrderItemRefCountGen : TXSDecimal;
    FrqOrderItemRefMaterialNameTxt : WideString;
    FrqOrderItemRefMeasurementNameTxt : WideString;
    FrqOrderItemRefMaterialNameGen : WideString;
    FrqOrderItemRefMeasurementNameGen : WideString;
    FrqOrderItemRefMaterialNameGenRQ : WideString;
    FrqOrderItemRefMeasurementNameGenRQ : WideString;
    FrqOrderItemRefCountFact : TXSDecimal;
    FrqOrderItemRefPriceWithoutNds : TXSDecimal;
    FrqOrderItemRefNds : TXSDecimal;
    FrqOrderItemRefPriceWithNds : TXSDecimal;
    FrqOrderItemRefSumWithoutNds : TXSDecimal;
    FrqOrderItemRefSumNds : TXSDecimal;
    FrqOrderItemRefSumGen : TXSDecimal;
    FrqOrderItemRefCommentGen : WideString;
    FrqOrderItemRefDeliveryTime : Integer;
    FrqOrderItemRefContractNumber : WideString;
    FrqOrderItemRefContractDate : TXSDate;
    FrqOrderItemRefFinDocCode : WideString;
    FrqOrderItemRefFinDocID : Integer;
    FrqOrderItemRefPlannedDatePays : TXSDate;
    FrqOrderItemRefPlannedDateDelivery : TXSDate;
    FrqOrderItemRefStatusReason : WideString;
    FrqOrderItemRefPaymentValue : Integer;
    FrqOrderItemRefIsPaid : Integer;
    FrqOrderItemRefUserGen : WideString;
    FestimateItemRefCode : Integer;
    FestimateItemRefCountGen : TXSDecimal;
    FestimateItemRefCountFact : TXSDecimal;
    FestimateItemRefPrice : TXSDecimal;
    FestimateItemRefCost : TXSDecimal;
    FestimateItemRefUserGen : WideString;
    FestimateItemRefDateEdit : TXSDate;
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
    FservicesObjectRefCnPackCode : Integer;
    FservicesObjectRefDfPackCode : Integer;
    FservicesObjectRefCountersZoneType : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property counterInvNumber : WideString read FcounterInvNumber write FcounterInvNumber;
    property  counterZoneType : Integer read FcounterZoneType write FcounterZoneType;
    property userGen : WideString read FuserGen write FuserGen;

    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
    property approvedCostRefCode : Integer read FapprovedCostRefCode write FapprovedCostRefCode;
    property approvedCostRefCountGen : TXSDecimal read FapprovedCostRefCountGen write FapprovedCostRefCountGen;
    property approvedCostRefCountFact : TXSDecimal read FapprovedCostRefCountFact write FapprovedCostRefCountFact;
    property approvedCostRefPriceWithoutNds : TXSDecimal read FapprovedCostRefPriceWithoutNds write FapprovedCostRefPriceWithoutNds;
    property approvedCostRefCounterPhasity : Integer read FapprovedCostRefCounterPhasity write FapprovedCostRefCounterPhasity;
    property approvedCostRefDateEdit : TXSDateTime read FapprovedCostRefDateEdit write FapprovedCostRefDateEdit;
    property approvedCostRefUserGen : WideString read FapprovedCostRefUserGen write FapprovedCostRefUserGen;
    property rqOrderItemRefCode : Integer read FrqOrderItemRefCode write FrqOrderItemRefCode;
    property rqOrderItemRefCountGen : TXSDecimal read FrqOrderItemRefCountGen write FrqOrderItemRefCountGen;
    property rqOrderItemRefMaterialNameTxt : WideString read FrqOrderItemRefMaterialNameTxt write FrqOrderItemRefMaterialNameTxt;
    property rqOrderItemRefMeasurementNameTxt : WideString read FrqOrderItemRefMeasurementNameTxt write FrqOrderItemRefMeasurementNameTxt;
    property rqOrderItemRefMaterialNameGen : WideString read FrqOrderItemRefMaterialNameGen write FrqOrderItemRefMaterialNameGen;
    property rqOrderItemRefMeasurementNameGen : WideString read FrqOrderItemRefMeasurementNameGen write FrqOrderItemRefMeasurementNameGen;
    property rqOrderItemRefMaterialNameGenRQ : WideString read FrqOrderItemRefMaterialNameGenRQ write FrqOrderItemRefMaterialNameGenRQ;
    property rqOrderItemRefMeasurementNameGenRQ : WideString read FrqOrderItemRefMeasurementNameGenRQ write FrqOrderItemRefMeasurementNameGenRQ;
    property rqOrderItemRefCountFact : TXSDecimal read FrqOrderItemRefCountFact write FrqOrderItemRefCountFact;
    property rqOrderItemRefPriceWithoutNds : TXSDecimal read FrqOrderItemRefPriceWithoutNds write FrqOrderItemRefPriceWithoutNds;
    property rqOrderItemRefNds : TXSDecimal read FrqOrderItemRefNds write FrqOrderItemRefNds;
    property rqOrderItemRefPriceWithNds : TXSDecimal read FrqOrderItemRefPriceWithNds write FrqOrderItemRefPriceWithNds;
    property rqOrderItemRefSumWithoutNds : TXSDecimal read FrqOrderItemRefSumWithoutNds write FrqOrderItemRefSumWithoutNds;
    property rqOrderItemRefSumNds : TXSDecimal read FrqOrderItemRefSumNds write FrqOrderItemRefSumNds;
    property rqOrderItemRefSumGen : TXSDecimal read FrqOrderItemRefSumGen write FrqOrderItemRefSumGen;
    property rqOrderItemRefCommentGen : WideString read FrqOrderItemRefCommentGen write FrqOrderItemRefCommentGen;
    property rqOrderItemRefDeliveryTime : Integer read FrqOrderItemRefDeliveryTime write FrqOrderItemRefDeliveryTime;
    property rqOrderItemRefContractNumber : WideString read FrqOrderItemRefContractNumber write FrqOrderItemRefContractNumber;
    property rqOrderItemRefContractDate : TXSDate read FrqOrderItemRefContractDate write FrqOrderItemRefContractDate;
    property rqOrderItemRefFinDocCode : WideString read FrqOrderItemRefFinDocCode write FrqOrderItemRefFinDocCode;
    property rqOrderItemRefFinDocID : Integer read FrqOrderItemRefFinDocID write FrqOrderItemRefFinDocID;
    property rqOrderItemRefPlannedDatePays : TXSDate read FrqOrderItemRefPlannedDatePays write FrqOrderItemRefPlannedDatePays;
    property rqOrderItemRefPlannedDateDelivery : TXSDate read FrqOrderItemRefPlannedDateDelivery write FrqOrderItemRefPlannedDateDelivery;
    property rqOrderItemRefStatusReason : WideString read FrqOrderItemRefStatusReason write FrqOrderItemRefStatusReason;
    property rqOrderItemRefPaymentValue : Integer read FrqOrderItemRefPaymentValue write FrqOrderItemRefPaymentValue;
    property rqOrderItemRefIsPaid : Integer read FrqOrderItemRefIsPaid write FrqOrderItemRefIsPaid;
    property rqOrderItemRefUserGen : WideString read FrqOrderItemRefUserGen write FrqOrderItemRefUserGen;
    property estimateItemRefCode : Integer read FestimateItemRefCode write FestimateItemRefCode;
    property estimateItemRefCountGen : TXSDecimal read FestimateItemRefCountGen write FestimateItemRefCountGen;
    property estimateItemRefCountFact : TXSDecimal read FestimateItemRefCountFact write FestimateItemRefCountFact;
    property estimateItemRefPrice : TXSDecimal read FestimateItemRefPrice write FestimateItemRefPrice;
    property estimateItemRefCost : TXSDecimal read FestimateItemRefCost write FestimateItemRefCost;
    property estimateItemRefUserGen : WideString read FestimateItemRefUserGen write FestimateItemRefUserGen;
    property estimateItemRefDateEdit : TXSDate read FestimateItemRefDateEdit write FestimateItemRefDateEdit;
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
    property servicesObjectRefCnPackCode : Integer read FservicesObjectRefCnPackCode write FservicesObjectRefCnPackCode;
    property servicesObjectRefDfPackCode : Integer read FservicesObjectRefDfPackCode write FservicesObjectRefDfPackCode;
    property servicesObjectRefCountersZoneType : Integer read FservicesObjectRefCountersZoneType write FservicesObjectRefCountersZoneType;
  end;

  ArrayOfRQApCost2Item2ServicesShort = array of RQApCost2Item2ServicesShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQApCost2Item2ServicesShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQApCost2Item2ServicesShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQApCost2Item2ServicesShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQApCost2Item2ServicesController/message/
  // soapAction: http://ksoe.org/RQApCost2Item2ServicesController/action/RQApCost2Item2ServicesController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQApCost2Item2ServicesControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQApCost2Item2ServicesController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQApCost2Item2ServicesControllerSoapPort = interface(IInvokable)
  ['{0E9B2728-DB01-4DFF-8C02-C2FC653B9C26}']
    function add(const aRQApCost2Item2Services: RQApCost2Item2Services): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQApCost2Item2Services: RQApCost2Item2Services); stdcall;
    function getObject(const anObjectCode: Integer): RQApCost2Item2Services; stdcall;
    function getList: RQApCost2Item2ServicesShortList; stdcall;
    function getFilteredList(const aRQApCost2Item2ServicesFilter: RQApCost2Item2ServicesFilter): RQApCost2Item2ServicesShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQApCost2Item2ServicesShortList; stdcall;
    function getScrollableFilteredList(const aRQApCost2Item2ServicesFilter: RQApCost2Item2ServicesFilter; const aFromPosition: Integer; const aQuantity: Integer): RQApCost2Item2ServicesShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQApCost2Item2ServicesShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQApCost2Item2ServicesFilter: RQApCost2Item2ServicesFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQApCost2Item2ServicesShort; stdcall;
  end;


implementation

  destructor RQApCost2Item2Services.Destroy;
  begin
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FapprovedCostRef) then
      approvedCostRef.Free;
    if Assigned(FrqOrderItemRef) then
      rqOrderItemRef.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    if Assigned(FservicesObjectRef) then
      servicesObjectRef.Free;
    inherited Destroy;
  end;

{
  destructor RQApCost2Item2ServicesFilter.Destroy;
  begin
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FapprovedCostRef) then
      approvedCostRef.Free;
    if Assigned(FrqOrderItemRef) then
      rqOrderItemRef.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    if Assigned(FservicesObjectRef) then
      servicesObjectRef.Free;
    inherited Destroy;
  end;
}

  destructor RQApCost2Item2ServicesFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQApCost2Item2ServicesShort.Destroy;
  begin
    if Assigned(FapprovedCostRefCountGen) then
      approvedCostRefCountGen.Free;
    if Assigned(FapprovedCostRefCountFact) then
      approvedCostRefCountFact.Free;
    if Assigned(FapprovedCostRefPriceWithoutNds) then
      approvedCostRefPriceWithoutNds.Free;
    if Assigned(FapprovedCostRefDateEdit) then
      approvedCostRefDateEdit.Free;
    if Assigned(FrqOrderItemRefCountGen) then
      rqOrderItemRefCountGen.Free;
    if Assigned(FrqOrderItemRefCountFact) then
      rqOrderItemRefCountFact.Free;
    if Assigned(FrqOrderItemRefPriceWithoutNds) then
      rqOrderItemRefPriceWithoutNds.Free;
    if Assigned(FrqOrderItemRefNds) then
      rqOrderItemRefNds.Free;
    if Assigned(FrqOrderItemRefPriceWithNds) then
      rqOrderItemRefPriceWithNds.Free;
    if Assigned(FrqOrderItemRefSumWithoutNds) then
      rqOrderItemRefSumWithoutNds.Free;
    if Assigned(FrqOrderItemRefSumNds) then
      rqOrderItemRefSumNds.Free;
    if Assigned(FrqOrderItemRefSumGen) then
      rqOrderItemRefSumGen.Free;
    if Assigned(FrqOrderItemRefContractDate) then
      rqOrderItemRefContractDate.Free;
    if Assigned(FrqOrderItemRefPlannedDatePays) then
      rqOrderItemRefPlannedDatePays.Free;
    if Assigned(FrqOrderItemRefPlannedDateDelivery) then
      rqOrderItemRefPlannedDateDelivery.Free;
    if Assigned(FestimateItemRefCountGen) then
      estimateItemRefCountGen.Free;
    if Assigned(FestimateItemRefCountFact) then
      estimateItemRefCountFact.Free;
    if Assigned(FestimateItemRefPrice) then
      estimateItemRefPrice.Free;
    if Assigned(FestimateItemRefCost) then
      estimateItemRefCost.Free;
    if Assigned(FestimateItemRefDateEdit) then
      estimateItemRefDateEdit.Free;
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
    inherited Destroy;
  end;

  destructor RQApCost2Item2ServicesShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQApCost2Item2Services, 'http://ksoe.org/EnergyproControllerService/type/', 'RQApCost2Item2Services');
  RemClassRegistry.RegisterXSClass(RQApCost2Item2ServicesRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQApCost2Item2ServicesRef');
  RemClassRegistry.RegisterXSClass(RQApCost2Item2ServicesFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQApCost2Item2ServicesFilter');
  RemClassRegistry.RegisterXSClass(RQApCost2Item2ServicesShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQApCost2Item2ServicesShort');
  RemClassRegistry.RegisterXSClass(RQApCost2Item2ServicesShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQApCost2Item2ServicesShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQApCost2Item2ServicesShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQApCost2Item2ServicesShort');

  InvRegistry.RegisterInterface(TypeInfo(RQApCost2Item2ServicesControllerSoapPort), 'http://ksoe.org/RQApCost2Item2ServicesController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQApCost2Item2ServicesControllerSoapPort), 'http://ksoe.org/RQApCost2Item2ServicesController/action/RQApCost2Item2ServicesController.%operationName%');


end.
