unit ENServicesCostController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,TKCalcCostController
   ,ENServicesObjectController
   ,ENPlanWorkController
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

  ENServicesCost            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesCostRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesCost = class(TRemotable)
  private
    Fcode : Integer;
    FdateGen : TXSDate;
    FcountGen : TXSDecimal;
    FmaterialExpenses : TXSDecimal;
    FtransportExpenses : TXSDecimal;
    FdeliveryCost : TXSDecimal;
    FsalaryExpenses : TXSDecimal;
    FsocialCharges : TXSDecimal;
    FdirectExpenses : TXSDecimal;
    FproductionExpenses : TXSDecimal;
    FtotalExpenses : TXSDecimal;
    FnormIncome : TXSDecimal;
    FcalculationCost : TXSDecimal;
    FcostWithoutVAT : TXSDecimal;
    FcostVAT : TXSDecimal;
    FcostWithVAT : TXSDecimal;
//???
    FtkCalcCostRef : TKCalcCostRef;
//???
    FservicesObjectRef : ENServicesObjectRef;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property materialExpenses : TXSDecimal read FmaterialExpenses write FmaterialExpenses;
    property transportExpenses : TXSDecimal read FtransportExpenses write FtransportExpenses;
    property deliveryCost : TXSDecimal read FdeliveryCost write FdeliveryCost;
    property salaryExpenses : TXSDecimal read FsalaryExpenses write FsalaryExpenses;
    property socialCharges : TXSDecimal read FsocialCharges write FsocialCharges;
    property directExpenses : TXSDecimal read FdirectExpenses write FdirectExpenses;
    property productionExpenses : TXSDecimal read FproductionExpenses write FproductionExpenses;
    property totalExpenses : TXSDecimal read FtotalExpenses write FtotalExpenses;
    property normIncome : TXSDecimal read FnormIncome write FnormIncome;
    property calculationCost : TXSDecimal read FcalculationCost write FcalculationCost;
    property costWithoutVAT : TXSDecimal read FcostWithoutVAT write FcostWithoutVAT;
    property costVAT : TXSDecimal read FcostVAT write FcostVAT;
    property costWithVAT : TXSDecimal read FcostWithVAT write FcostWithVAT;
    property tkCalcCostRef : TKCalcCostRef read FtkCalcCostRef write FtkCalcCostRef;
    property servicesObjectRef : ENServicesObjectRef read FservicesObjectRef write FservicesObjectRef;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
  end;

{
  ENServicesCostFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FdateGen : TXSDate;
    FcountGen : TXSDecimal;
    FmaterialExpenses : TXSDecimal;
    FtransportExpenses : TXSDecimal;
    FdeliveryCost : TXSDecimal;
    FsalaryExpenses : TXSDecimal;
    FsocialCharges : TXSDecimal;
    FdirectExpenses : TXSDecimal;
    FproductionExpenses : TXSDecimal;
    FtotalExpenses : TXSDecimal;
    FnormIncome : TXSDecimal;
    FcalculationCost : TXSDecimal;
    FcostWithoutVAT : TXSDecimal;
    FcostVAT : TXSDecimal;
    FcostWithVAT : TXSDecimal;
//???
    FtkCalcCostRef : TKCalcCostRef;
//???
    FservicesObjectRef : ENServicesObjectRef;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property materialExpenses : TXSDecimal read FmaterialExpenses write FmaterialExpenses;
    property transportExpenses : TXSDecimal read FtransportExpenses write FtransportExpenses;
    property deliveryCost : TXSDecimal read FdeliveryCost write FdeliveryCost;
    property salaryExpenses : TXSDecimal read FsalaryExpenses write FsalaryExpenses;
    property socialCharges : TXSDecimal read FsocialCharges write FsocialCharges;
    property directExpenses : TXSDecimal read FdirectExpenses write FdirectExpenses;
    property productionExpenses : TXSDecimal read FproductionExpenses write FproductionExpenses;
    property totalExpenses : TXSDecimal read FtotalExpenses write FtotalExpenses;
    property normIncome : TXSDecimal read FnormIncome write FnormIncome;
    property calculationCost : TXSDecimal read FcalculationCost write FcalculationCost;
    property costWithoutVAT : TXSDecimal read FcostWithoutVAT write FcostWithoutVAT;
    property costVAT : TXSDecimal read FcostVAT write FcostVAT;
    property costWithVAT : TXSDecimal read FcostWithVAT write FcostWithVAT;
    property tkCalcCostRef : TKCalcCostRef read FtkCalcCostRef write FtkCalcCostRef;
    property servicesObjectRef : ENServicesObjectRef read FservicesObjectRef write FservicesObjectRef;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
  end;
}

  ENServicesCostFilter = class(ENServicesCost)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENServicesCostShort = class(TRemotable)
  private
    Fcode : Integer;
    FdateGen : TXSDate;
    FcountGen : TXSDecimal;
    FcalculationCost : TXSDecimal;
    FcostWithoutVAT : TXSDecimal;
    FcostVAT : TXSDecimal;
    FcostWithVAT : TXSDecimal;
    FtkCalcCostRefCode : Integer;
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
    FservicesObjectRefContractServicesSummaVAT : TXSDecimal;
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
    FservicesObjectRefAxPartnerCode : WideString;
    FservicesObjectRefAxPartnerName : WideString;
    FservicesObjectRefAxContractNumber : WideString;
    FservicesObjectRefAxContractDate : TXSDate;
    FservicesObjectRefAxContractCode : WideString;
    FservicesObjectRefAxContractId : WideString;
    FservicesObjectRefAxContractCommentGen : WideString;
    FservicesObjectRefProjAgreeSumma : TXSDecimal;
    FservicesObjectRefTopographySumma : TXSDecimal;
    FservicesObjectRefCreatedFromSite : Integer;
    FservicesObjectRefTerm : Integer;
    FservicesObjectRefRegulation : Integer;
    FservicesObjectRefBoundaryDateWork : TXSDate;
    FservicesObjectRefCountDayDelay : Integer;
    FservicesObjectRefFactDateWork : TXSDate;
    FservicesObjectRefCodeEIC : WideString;
    FservicesObjectRefPersonalAccountUid : WideString;
    FplanRefCode : Integer;
    FplanRefDateGen : TXSDateTime;
    FplanRefDateStart : TXSDate;
    FplanRefDateFinal : TXSDate;
    FplanRefYearGen : Integer;
    FplanRefMonthGen : Integer;
    FplanRefYearOriginal : Integer;
    FplanRefMonthOriginal : Integer;
    FplanRefUserGen : WideString;
    FplanRefDateEdit : TXSDate;
    FplanRefWorkOrderNumber : WideString;
    FplanRefDateWorkOrder : TXSDate;
    FplanRefPriConnectionNumber : WideString;
    FplanRefDateEndPriConnection : TXSDate;
    FplanRefInvestWorksDescription : WideString;
    FplanRefServicesFSideFinId : Integer;
    FplanRefServicesFSideCnNum : WideString;
    FplanRefTotalTimeHours : TXSDecimal;
    FplanRefTotalTimeDays : TXSDecimal;
    FplanRefInvestItemNumber : WideString;
	FtkClassificationTypeRefKod : WideString;
	FtkClassificationTypeRefName : WideString;
	FtkClassificationTypeRefKved : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property calculationCost : TXSDecimal read FcalculationCost write FcalculationCost;
    property costWithoutVAT : TXSDecimal read FcostWithoutVAT write FcostWithoutVAT;
    property costVAT : TXSDecimal read FcostVAT write FcostVAT;
    property costWithVAT : TXSDecimal read FcostWithVAT write FcostWithVAT;

    property tkCalcCostRefCode : Integer read FtkCalcCostRefCode write FtkCalcCostRefCode;
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
    property servicesObjectRefContractServicesSummaVAT : TXSDecimal read FservicesObjectRefContractServicesSummaVAT write FservicesObjectRefContractServicesSummaVAT;
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
    property servicesObjectRefAxPartnerCode : WideString read FservicesObjectRefAxPartnerCode write FservicesObjectRefAxPartnerCode;
    property servicesObjectRefAxPartnerName : WideString read FservicesObjectRefAxPartnerName write FservicesObjectRefAxPartnerName;
    property servicesObjectRefAxContractNumber : WideString read FservicesObjectRefAxContractNumber write FservicesObjectRefAxContractNumber;
    property servicesObjectRefAxContractDate : TXSDate read FservicesObjectRefAxContractDate write FservicesObjectRefAxContractDate;
    property servicesObjectRefAxContractCode : WideString read FservicesObjectRefAxContractCode write FservicesObjectRefAxContractCode;
    property servicesObjectRefAxContractId : WideString read FservicesObjectRefAxContractId write FservicesObjectRefAxContractId;
    property servicesObjectRefAxContractCommentGen : WideString read FservicesObjectRefAxContractCommentGen write FservicesObjectRefAxContractCommentGen;
    property servicesObjectRefProjAgreeSumma : TXSDecimal read FservicesObjectRefProjAgreeSumma write FservicesObjectRefProjAgreeSumma;
    property servicesObjectRefTopographySumma : TXSDecimal read FservicesObjectRefTopographySumma write FservicesObjectRefTopographySumma;
    property servicesObjectRefCreatedFromSite : Integer read FservicesObjectRefCreatedFromSite write FservicesObjectRefCreatedFromSite;
    property servicesObjectRefTerm : Integer read FservicesObjectRefTerm write FservicesObjectRefTerm;
    property servicesObjectRefRegulation : Integer read FservicesObjectRefRegulation write FservicesObjectRefRegulation;
    property servicesObjectRefBoundaryDateWork : TXSDate read FservicesObjectRefBoundaryDateWork write FservicesObjectRefBoundaryDateWork;
    property servicesObjectRefCountDayDelay : Integer read FservicesObjectRefCountDayDelay write FservicesObjectRefCountDayDelay;
    property servicesObjectRefFactDateWork : TXSDate read FservicesObjectRefFactDateWork write FservicesObjectRefFactDateWork;
    property servicesObjectRefCodeEIC : WideString read FservicesObjectRefCodeEIC write FservicesObjectRefCodeEIC;
    property servicesObjectRefPersonalAccountUid : WideString read FservicesObjectRefPersonalAccountUid write FservicesObjectRefPersonalAccountUid;
    property planRefCode : Integer read FplanRefCode write FplanRefCode;
    property planRefDateGen : TXSDateTime read FplanRefDateGen write FplanRefDateGen;
    property planRefDateStart : TXSDate read FplanRefDateStart write FplanRefDateStart;
    property planRefDateFinal : TXSDate read FplanRefDateFinal write FplanRefDateFinal;
    property planRefYearGen : Integer read FplanRefYearGen write FplanRefYearGen;
    property planRefMonthGen : Integer read FplanRefMonthGen write FplanRefMonthGen;
    property planRefYearOriginal : Integer read FplanRefYearOriginal write FplanRefYearOriginal;
    property planRefMonthOriginal : Integer read FplanRefMonthOriginal write FplanRefMonthOriginal;
    property planRefUserGen : WideString read FplanRefUserGen write FplanRefUserGen;
    property planRefDateEdit : TXSDate read FplanRefDateEdit write FplanRefDateEdit;
    property planRefWorkOrderNumber : WideString read FplanRefWorkOrderNumber write FplanRefWorkOrderNumber;
    property planRefDateWorkOrder : TXSDate read FplanRefDateWorkOrder write FplanRefDateWorkOrder;
    property planRefPriConnectionNumber : WideString read FplanRefPriConnectionNumber write FplanRefPriConnectionNumber;
    property planRefDateEndPriConnection : TXSDate read FplanRefDateEndPriConnection write FplanRefDateEndPriConnection;
    property planRefInvestWorksDescription : WideString read FplanRefInvestWorksDescription write FplanRefInvestWorksDescription;
    property planRefServicesFSideFinId : Integer read FplanRefServicesFSideFinId write FplanRefServicesFSideFinId;
    property planRefServicesFSideCnNum : WideString read FplanRefServicesFSideCnNum write FplanRefServicesFSideCnNum;
    property planRefTotalTimeHours : TXSDecimal read FplanRefTotalTimeHours write FplanRefTotalTimeHours;
    property planRefTotalTimeDays : TXSDecimal read FplanRefTotalTimeDays write FplanRefTotalTimeDays;
    property planRefInvestItemNumber : WideString read FplanRefInvestItemNumber write FplanRefInvestItemNumber;
	property tkClassificationTypeRefKod : WideString read FtkClassificationTypeRefKod write FtkClassificationTypeRefKod;
	property tkClassificationTypeRefName : WideString read FtkClassificationTypeRefName write FtkClassificationTypeRefName;
	property tkClassificationTypeRefKved : WideString read FtkClassificationTypeRefKved write FtkClassificationTypeRefKved;
  end;

  ArrayOfENServicesCostShort = array of ENServicesCostShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }
  ArrayOfENServicesCost = array of ENServicesCost;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENServicesCostShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENServicesCostShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENServicesCostShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENServicesCostController/message/
  // soapAction: http://ksoe.org/ENServicesCostController/action/ENServicesCostController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENServicesCostControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENServicesCostController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENServicesCostControllerSoapPort = interface(IInvokable)
  ['{95C0CE61-941A-4884-954D-614AC66B6A58}']
    function add(const aENServicesCost: ENServicesCost): Integer; stdcall; overload;
    function add(const aENServicesCost: ENServicesCost; distance : TXSDecimal): Integer; stdcall; overload;
    function add(const aENServicesCost: ENServicesCost; distance : TXSDecimal; machineHoursCount : TXSDecimal): Integer; stdcall; overload;
    procedure remove(const anObjectCode: Integer); stdcall; overload;
    procedure remove(anObjectCodes : ArrayOfInteger); stdcall; overload;
    procedure save(const aENServicesCost: ENServicesCost); stdcall; overload;
    procedure save(const aENServicesCost: ENServicesCost; distance : TXSDecimal); stdcall; overload;
    procedure save(const aENServicesCost: ENServicesCost; distance : TXSDecimal; machineHoursQuantity : TXSDecimal); stdcall; overload;
    function getObject(const anObjectCode: Integer): ENServicesCost; stdcall;
    function getList: ENServicesCostShortList; stdcall;
    function getFilteredList(const aENServicesCostFilter: ENServicesCostFilter): ENServicesCostShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENServicesCostShortList; stdcall;
    function getScrollableFilteredList(const aENServicesCostFilter: ENServicesCostFilter; const aFromPosition: Integer; const aQuantity: Integer): ENServicesCostShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENServicesCostShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENServicesCostFilter: ENServicesCostFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENServicesCostShort; stdcall;
    {‘ормирование планов согласно выбранным расчетам калькул€ций и отмена сформированных планов}
    function generatePlans(costs: ArrayOfENServicesCost; planTemplate : ENPlanWork; const isGenerate: TXSBoolean): Integer; stdcall; overload;
    function generatePlans(costs: ArrayOfENServicesCost; const isGenerate: TXSBoolean): Integer; stdcall; overload;
  end;


implementation

  destructor ENServicesCost.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FmaterialExpenses) then
      materialExpenses.Free;
    if Assigned(FtransportExpenses) then
      transportExpenses.Free;
    if Assigned(FdeliveryCost) then
      deliveryCost.Free;
    if Assigned(FsalaryExpenses) then
      salaryExpenses.Free;
    if Assigned(FsocialCharges) then
      socialCharges.Free;
    if Assigned(FdirectExpenses) then
      directExpenses.Free;
    if Assigned(FproductionExpenses) then
      productionExpenses.Free;
    if Assigned(FtotalExpenses) then
      totalExpenses.Free;
    if Assigned(FnormIncome) then
      normIncome.Free;
    if Assigned(FcalculationCost) then
      calculationCost.Free;
    if Assigned(FcostWithoutVAT) then
      costWithoutVAT.Free;
    if Assigned(FcostVAT) then
      costVAT.Free;
    if Assigned(FcostWithVAT) then
      costWithVAT.Free;
    if Assigned(FtkCalcCostRef) then
      tkCalcCostRef.Free;
    if Assigned(FservicesObjectRef) then
      servicesObjectRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;

{
  destructor ENServicesCostFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FmaterialExpenses) then
      materialExpenses.Free;
    if Assigned(FtransportExpenses) then
      transportExpenses.Free;
    if Assigned(FdeliveryCost) then
      deliveryCost.Free;
    if Assigned(FsalaryExpenses) then
      salaryExpenses.Free;
    if Assigned(FsocialCharges) then
      socialCharges.Free;
    if Assigned(FdirectExpenses) then
      directExpenses.Free;
    if Assigned(FproductionExpenses) then
      productionExpenses.Free;
    if Assigned(FtotalExpenses) then
      totalExpenses.Free;
    if Assigned(FnormIncome) then
      normIncome.Free;
    if Assigned(FcalculationCost) then
      calculationCost.Free;
    if Assigned(FcostWithoutVAT) then
      costWithoutVAT.Free;
    if Assigned(FcostVAT) then
      costVAT.Free;
    if Assigned(FcostWithVAT) then
      costWithVAT.Free;
    if Assigned(FtkCalcCostRef) then
      tkCalcCostRef.Free;
    if Assigned(FservicesObjectRef) then
      servicesObjectRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;
}

  destructor ENServicesCostFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENServicesCostShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcalculationCost) then
      calculationCost.Free;
    if Assigned(FcostWithoutVAT) then
      costWithoutVAT.Free;
    if Assigned(FcostVAT) then
      costVAT.Free;
    if Assigned(FcostWithVAT) then
      costWithVAT.Free;
    if Assigned(FservicesObjectRefContractDate) then
      servicesObjectRefContractDate.Free;
    if Assigned(FservicesObjectRefContractDateServices) then
      servicesObjectRefContractDateServices.Free;
    if Assigned(FservicesObjectRefContractServicesSumma) then
      servicesObjectRefContractServicesSumma.Free;
    if Assigned(FservicesObjectRefContractServicesSummaVAT) then
      servicesObjectRefContractServicesSummaVAT.Free;
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
    if Assigned(FservicesObjectRefAxContractDate) then
      servicesObjectRefAxContractDate.Free;
    if Assigned(FservicesObjectRefProjAgreeSumma) then
      servicesObjectRefProjAgreeSumma.Free;
    if Assigned(FservicesObjectRefTopographySumma) then
      servicesObjectRefTopographySumma.Free;
    if Assigned(FservicesObjectRefBoundaryDateWork) then
      servicesObjectRefBoundaryDateWork.Free;
    if Assigned(FservicesObjectRefFactDateWork) then
      servicesObjectRefFactDateWork.Free;
    if Assigned(FplanRefDateGen) then
      planRefDateGen.Free;
    if Assigned(FplanRefDateStart) then
      planRefDateStart.Free;
    if Assigned(FplanRefDateFinal) then
      planRefDateFinal.Free;
    if Assigned(FplanRefDateEdit) then
      planRefDateEdit.Free;
    if Assigned(FplanRefDateWorkOrder) then
      planRefDateWorkOrder.Free;
    if Assigned(FplanRefDateEndPriConnection) then
      planRefDateEndPriConnection.Free;
    if Assigned(FplanRefTotalTimeHours) then
      planRefTotalTimeHours.Free;
    if Assigned(FplanRefTotalTimeDays) then
      planRefTotalTimeDays.Free;
    inherited Destroy;
  end;

  destructor ENServicesCostShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENServicesCost, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesCost');
  RemClassRegistry.RegisterXSClass(ENServicesCostRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesCostRef');
  RemClassRegistry.RegisterXSClass(ENServicesCostFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesCostFilter');
  RemClassRegistry.RegisterXSClass(ENServicesCostShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesCostShort');
  RemClassRegistry.RegisterXSClass(ENServicesCostShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesCostShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENServicesCostShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENServicesCostShort');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENServicesCost), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENServicesCost');

  InvRegistry.RegisterInterface(TypeInfo(ENServicesCostControllerSoapPort), 'http://ksoe.org/ENServicesCostController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENServicesCostControllerSoapPort), 'http://ksoe.org/ENServicesCostController/action/ENServicesCostController.%operationName%');


end.
