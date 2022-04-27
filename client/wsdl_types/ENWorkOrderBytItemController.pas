unit ENWorkOrderBytItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENWorkOrderBytController
   ,ENHumenItemController
   ,ENPlanWorkController
   ,ENPlanWorkItemController
   ,FINWorkerController
   ,ENRecordPointBytController
   ,ENRecordPointPromController
   ,ENRouteBytController
   ,ENServicesObjectController
   ,SCCounterController
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

  ENWorkOrderBytItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWorkOrderBytItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWorkOrderBytItem = class(TRemotable)
  private
    Fcode : Integer;
    FcontractNumberServices : WideString;
    FaccountNumber : WideString;
    Fname : WideString;
    FcustomerName : WideString;
    Faddress : WideString;
    FinvNumber : WideString;
    FserialNumber : WideString;
    Fseal : WideString;
    Fphone : WideString;
    Fstatuscode : Integer;
    FrpCode : Integer;
    FdateCounterInst : TXSDate;
    FdateCounterCheck : TXSDate;
    FcounterType : WideString;
    FclassAccuracy : TXSDecimal;
    Fcheckperiod : TXSDecimal;
    FrpStatusCode : Integer;
    Fphasity : TXSDecimal;
    Fdatecheck : TXSDate;
    Fcheckperiod1 : TXSDecimal;
    Fplacecounter : WideString;
    FrpIsWorking : Integer;
    FrecordPointName : WideString;
    FrouteBytName : WideString;
    FrouteBytNumbergen : WideString;
    FcommentGen : WideString;
    FdateAdd : TXSDateTime;
    FdateEdit : TXSDateTime;
    FuserAdd : WideString;
    FuserEdit : WideString;
    Fmodify_time : Int64;
    FfactCode : Integer;
    FcounterCapacity : Integer;
    FcounterVoltageNominal : TXSDecimal;
    FcounterDateProduct : TXSDate;
//???
    FworkOrderBytRef : ENWorkOrderBytRef;
//???
    FhumenItemRef : ENHumenItemRef;
//???
    FplanRef : ENPlanWorkRef;
//???
    FplanItemRef : ENPlanWorkItemRef;
//???
    FfinWorker : FINWorker;
//???
    FrecordPointBytRef : ENRecordPointBytRef;
//???
    FrecordPointPromRef : ENRecordPointPromRef;
//???
    FrouteBytRef : ENRouteBytRef;
//???
    FservicesObjectRef : ENServicesObjectRef;
//???
    FscCounterRef : SCCounterRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property contractNumberServices : WideString read FcontractNumberServices write FcontractNumberServices;
    property accountNumber : WideString read FaccountNumber write FaccountNumber;
    property name : WideString read Fname write Fname;
    property customerName : WideString read FcustomerName write FcustomerName;
    property address : WideString read Faddress write Faddress;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property serialNumber : WideString read FserialNumber write FserialNumber;
    property seal : WideString read Fseal write Fseal;
    property phone : WideString read Fphone write Fphone;
    property  statuscode : Integer read Fstatuscode write Fstatuscode;
    property  rpCode : Integer read FrpCode write FrpCode;
    property dateCounterInst : TXSDate read FdateCounterInst write FdateCounterInst;
    property dateCounterCheck : TXSDate read FdateCounterCheck write FdateCounterCheck;
    property counterType : WideString read FcounterType write FcounterType;
    property classAccuracy : TXSDecimal read FclassAccuracy write FclassAccuracy;
    property checkperiod : TXSDecimal read Fcheckperiod write Fcheckperiod;
    property  rpStatusCode : Integer read FrpStatusCode write FrpStatusCode;
    property phasity : TXSDecimal read Fphasity write Fphasity;
    property datecheck : TXSDate read Fdatecheck write Fdatecheck;
    property checkperiod1 : TXSDecimal read Fcheckperiod1 write Fcheckperiod1;
    property placecounter : WideString read Fplacecounter write Fplacecounter;
    property  rpIsWorking : Integer read FrpIsWorking write FrpIsWorking;
    property recordPointName : WideString read FrecordPointName write FrecordPointName;
    property routeBytName : WideString read FrouteBytName write FrouteBytName;
    property routeBytNumbergen : WideString read FrouteBytNumbergen write FrouteBytNumbergen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property userEdit : WideString read FuserEdit write FuserEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property  factCode : Integer read FfactCode write FfactCode;
   property  counterCapacity : Integer read FcounterCapacity write FcounterCapacity;
    property counterVoltageNominal : TXSDecimal read FcounterVoltageNominal write FcounterVoltageNominal;
    property counterDateProduct : TXSDate read FcounterDateProduct write FcounterDateProduct;
    property workOrderBytRef : ENWorkOrderBytRef read FworkOrderBytRef write FworkOrderBytRef;
    property humenItemRef : ENHumenItemRef read FhumenItemRef write FhumenItemRef;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
    property planItemRef : ENPlanWorkItemRef read FplanItemRef write FplanItemRef;
    property finWorker : FINWorker read FfinWorker write FfinWorker;
    property recordPointBytRef : ENRecordPointBytRef read FrecordPointBytRef write FrecordPointBytRef;
    property recordPointPromRef : ENRecordPointPromRef read FrecordPointPromRef write FrecordPointPromRef;
    property routeBytRef : ENRouteBytRef read FrouteBytRef write FrouteBytRef;
    property servicesObjectRef : ENServicesObjectRef read FservicesObjectRef write FservicesObjectRef;
    property scCounterRef : SCCounterRef read FscCounterRef write FscCounterRef;
  end;

{
  ENWorkOrderBytItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcontractNumberServices : WideString;
    FaccountNumber : WideString;
    Fname : WideString;
    FcustomerName : WideString;
    Faddress : WideString;
    FinvNumber : WideString;
    FserialNumber : WideString;
    Fseal : WideString;
    Fphone : WideString;
    Fstatuscode : Integer;
    FrpCode : Integer;
    FdateCounterInst : TXSDate;
    FdateCounterCheck : TXSDate;
    FcounterType : WideString;
    FclassAccuracy : TXSDecimal;
    Fcheckperiod : TXSDecimal;
    FrpStatusCode : Integer;
    Fphasity : TXSDecimal;
    Fdatecheck : TXSDate;
    Fcheckperiod1 : TXSDecimal;
    Fplacecounter : WideString;
    FrpIsWorking : Integer;
    FrecordPointName : WideString;
    FrouteBytName : WideString;
    FrouteBytNumbergen : WideString;
    FcommentGen : WideString;
    FdateAdd : DateTime;
    FdateEdit : DateTime;
    FuserAdd : WideString;
    FuserEdit : WideString;
    Fmodify_time : Int64;
    FfactCode : Integer;
    FcounterCapacity : Integer;
    FcounterVoltageNominal : TXSDecimal;
    FcounterDateProduct : TXSDate;
//???
    FworkOrderBytRef : ENWorkOrderBytRef;
//???
    FhumenItemRef : ENHumenItemRef;
//???
    FplanRef : ENPlanWorkRef;
//???
    FplanItemRef : ENPlanWorkItemRef;
//???
    FfinWorker : FINWorker;
//???
    FrecordPointBytRef : ENRecordPointBytRef;
//???
    FrecordPointPromRef : ENRecordPointPromRef;
//???
    FrouteBytRef : ENRouteBytRef;
//???
    FservicesObjectRef : ENServicesObjectRef;
//???
    FscCounterRef : SCCounterRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property contractNumberServices : WideString read FcontractNumberServices write FcontractNumberServices;
    property accountNumber : WideString read FaccountNumber write FaccountNumber;
    property name : WideString read Fname write Fname;
    property customerName : WideString read FcustomerName write FcustomerName;
    property address : WideString read Faddress write Faddress;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property serialNumber : WideString read FserialNumber write FserialNumber;
    property seal : WideString read Fseal write Fseal;
    property phone : WideString read Fphone write Fphone;
    property  statuscode : Integer read Fstatuscode write Fstatuscode;
    property  rpCode : Integer read FrpCode write FrpCode;
    property dateCounterInst : TXSDate read FdateCounterInst write FdateCounterInst;
    property dateCounterCheck : TXSDate read FdateCounterCheck write FdateCounterCheck;
    property counterType : WideString read FcounterType write FcounterType;
    property classAccuracy : TXSDecimal read FclassAccuracy write FclassAccuracy;
    property checkperiod : TXSDecimal read Fcheckperiod write Fcheckperiod;
    property  rpStatusCode : Integer read FrpStatusCode write FrpStatusCode;
    property phasity : TXSDecimal read Fphasity write Fphasity;
    property datecheck : TXSDate read Fdatecheck write Fdatecheck;
    property checkperiod1 : TXSDecimal read Fcheckperiod1 write Fcheckperiod1;
    property placecounter : WideString read Fplacecounter write Fplacecounter;
    property  rpIsWorking : Integer read FrpIsWorking write FrpIsWorking;
    property recordPointName : WideString read FrecordPointName write FrecordPointName;
    property routeBytName : WideString read FrouteBytName write FrouteBytName;
    property routeBytNumbergen : WideString read FrouteBytNumbergen write FrouteBytNumbergen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateAdd : DateTime;
    property dateEdit : DateTime;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property userEdit : WideString read FuserEdit write FuserEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property  factCode : Integer read FfactCode write FfactCode;
    property  counterCapacity : Integer read FcounterCapacity write FcounterCapacity;
    property counterVoltageNominal : TXSDecimal read FcounterVoltageNominal write FcounterVoltageNominal;
    property counterDateProduct : TXSDate read FcounterDateProduct write FcounterDateProduct;
    property workOrderBytRef : ENWorkOrderBytRef read FworkOrderBytRef write FworkOrderBytRef;
    property humenItemRef : ENHumenItemRef read FhumenItemRef write FhumenItemRef;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
    property planItemRef : ENPlanWorkItemRef read FplanItemRef write FplanItemRef;
    property finWorker : FINWorker read FfinWorker write FfinWorker;
    property recordPointBytRef : ENRecordPointBytRef read FrecordPointBytRef write FrecordPointBytRef;
    property recordPointPromRef : ENRecordPointPromRef read FrecordPointPromRef write FrecordPointPromRef;
    property routeBytRef : ENRouteBytRef read FrouteBytRef write FrouteBytRef;
    property servicesObjectRef : ENServicesObjectRef read FservicesObjectRef write FservicesObjectRef;
    property scCounterRef : SCCounterRef read FscCounterRef write FscCounterRef;
  end;
}

  ENWorkOrderBytItemFilter = class(ENWorkOrderBytItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENWorkOrderBytItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FcontractNumberServices : WideString;
    FaccountNumber : WideString;
    Fname : WideString;
    FcustomerName : WideString;
    Faddress : WideString;
    FinvNumber : WideString;
    FserialNumber : WideString;
    Fseal : WideString;
    Fphone : WideString;
    Fstatuscode : Integer;
    FrpCode : Integer;
    FdateCounterInst : TXSDate;
    FdateCounterCheck : TXSDate;
    FcounterType : WideString;
    FclassAccuracy : TXSDecimal;
    Fcheckperiod : TXSDecimal;
    FrpStatusCode : Integer;
    Fphasity : TXSDecimal;
    Fdatecheck : TXSDate;
    Fcheckperiod1 : TXSDecimal;
    Fplacecounter : WideString;
    FrpIsWorking : Integer;
    FrecordPointName : WideString;
    FrouteBytName : WideString;
    FrouteBytNumbergen : WideString;
    FcommentGen : WideString;
    FdateAdd : TXSDateTime;
    FdateEdit : TXSDateTime;
    FuserAdd : WideString;
    FuserEdit : WideString;
    FfactCode : Integer;
    FcounterCapacity : Integer;
    FcounterVoltageNominal : TXSDecimal;
    FcounterDateProduct : TXSDate;
    FworkOrderBytRefCode : Integer;
    FworkOrderBytRefNumberGen : WideString;
    FworkOrderBytRefDateGen : TXSDate;
    FworkOrderBytRefCommentGen : WideString;
    FworkOrderBytRefDateAdd : TXSDateTime;
    FworkOrderBytRefDateEdit : TXSDateTime;
    FworkOrderBytRefUserAdd : WideString;
    FworkOrderBytRefUserEdit : WideString;
    FhumenItemRefCode : Integer;
    FhumenItemRefCountGen : TXSDecimal;
    FhumenItemRefCountFact : TXSDecimal;
    FhumenItemRefCountFactOriginal : TXSDecimal;
    FhumenItemRefPrice : TXSDecimal;
    FhumenItemRefCost : TXSDecimal;
    FhumenItemRefUserGen : WideString;
    FhumenItemRefDateEdit : TXSDate;
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
    FplanItemRefCode : Integer;
    FplanItemRefCountGen : TXSDecimal;
    FplanItemRefTimeGen : TXSDecimal;
    FplanItemRefCostGen : TXSDecimal;
    FplanItemRefUserGen : WideString;
    FplanItemRefDateEdit : TXSDate;
    FfinWorkerCode : Integer;
    FfinWorkerName : WideString;
    FfinWorkerTabNumber : WideString;
    FfinWorkerPositionName : WideString;
    FfinWorkerPositionCode : Integer;
    FfinWorkerDepartmentName : WideString;
    FfinWorkerDepartmentCode : WideString;
    FfinWorkerPriceGen : TXSDecimal;
    FfinWorkerCategor : Integer;
    FfinWorkerFinCode : Integer;
    FfinWorkerIsSentAssignment : Integer;
    FfinWorkerChargePercent : TXSDecimal;
    FfinWorkerCategorId : Integer;
    FfinWorkerCategorName : WideString;
    FfinWorkerWorkTimeId : WideString;
    FfinWorkerPositionId : WideString;
    FrecordPointBytRefCode : Integer;
    FrecordPointBytRefAccountNumber : WideString;
    FrecordPointBytRefContractDate : TXSDate;
    FrecordPointBytRefName : WideString;
    FrecordPointBytRefAddress : WideString;
    FrecordPointBytRefRpCode : Integer;
    FrecordPointBytRefInvNumber : WideString;
    FrecordPointBytRefSerialNumber : WideString;
    FrecordPointBytRefDateCounterInst : TXSDate;
    FrecordPointBytRefDateCounterCheck : TXSDate;
    FrecordPointBytRefCounterType : WideString;
    FrecordPointBytRefClassAccuracy : TXSDecimal;
    FrecordPointBytRefCheckperiod : TXSDecimal;
    FrecordPointBytRefStatuscode : Integer;
    FrecordPointBytRefPhasity : TXSDecimal;
    FrecordPointBytRefDatecheck : TXSDate;
    FrecordPointBytRefCheckperiod1 : TXSDecimal;
    FrecordPointBytRefPhone : WideString;
    FrecordPointBytRefSeal : WideString;
    FrecordPointBytRefPlacecounter : WideString;
    FrecordPointBytRefIsworking : Integer;
    FrecordPointBytRefCounterCapacity : Integer;
    FrecordPointBytRefCounterVoltageNominal : TXSDecimal;
    FrecordPointBytRefCounterDateProduct : TXSDate;
    FrecordPointPromRefCode : Integer;
    FrecordPointPromRefAccountNumber : WideString;
    FrecordPointPromRefAccountName : WideString;
    FrecordPointPromRefCounterNumber : WideString;
    FrecordPointPromRefRecordPointName : WideString;
    FrecordPointPromRefRecordPointAddr : WideString;
    FrecordPointPromRefRecordPointKindName : WideString;
    FrecordPointPromRefRecordPointCode : Integer;
    FrecordPointPromRefFeeder : WideString;
    FrecordPointPromRefSubstation : WideString;
    FrecordPointPromRefInvNumber : WideString;
    FrecordPointPromRefDayofcalculation : Integer;
    FrecordPointPromRefInspector : WideString;
    FrecordPointPromRefDatecontrol : TXSDate;
    FrecordPointPromRefDatetp : TXSDate;
    FrecordPointPromRefDateCounterInst : TXSDate;
    FrecordPointPromRefDateCounterCheck : TXSDate;
    FrecordPointPromRefCounterType : WideString;
    FrecordPointPromRefClassAccuracy : TXSDecimal;
    FrecordPointPromRefCheckperiod : TXSDecimal;
    FrecordPointPromRefStatuscode : Integer;
    FrecordPointPromRefPhasity : TXSDecimal;
    FrecordPointPromRefPhone : WideString;
    FrecordPointPromRefSeal : WideString;
    FrecordPointPromRefPlacecounter : WideString;
    FrecordPointPromRefIsworking : Integer;
    FrecordPointPromRefCounterCapacity : Integer;
    FrecordPointPromRefCounterVoltageNominal : TXSDecimal;
    FrecordPointPromRefCounterDateProduct : TXSDate;
    FrouteBytRefCode : Integer;
    FrouteBytRefName : WideString;
    FrouteBytRefNumbergen : WideString;
    FrouteBytRefRouteCode : Integer;
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
    FscCounterRefCode : Integer;
    FscCounterRefInvNumber : WideString;
    FscCounterRefName : WideString;
    FscCounterRefBuildNumber : WideString;
    FscCounterRefAccount : WideString;
    FscCounterRefDepartmetFKCode : WideString;
    FscCounterRefMolCode : WideString;
    FscCounterRefDateIn : TXSDate;
    FscCounterRefDateBuild : TXSDate;
    FscCounterRefDateCheck : TXSDate;
    FscCounterRefCost : TXSDecimal;
    FscCounterRefScCode : Integer;
    FscCounterRefCounterType : WideString;
    FscCounterRefInstallOrderNumber : WideString;
    FscCounterRefReading : WideString;
    FscCounterRefDateEdit : TXSDateTime;
    FscCounterRefIsliquid : Integer;
    FscCounterRefCostOld : TXSDecimal;
    /////
    FkartaRefCode : Integer;
    FkartaRefName : WideString;
    FkartaRefNum : WideString;
    FpositionCode : Integer;
    FpositionName : WideString;

    FplanRefTypeCode : Integer;
    FplanRefStateCode : Integer;

    FreplaceCounterServices : Integer;
    FsmsInformTime : WideString;

    FmonthPlanDateGen : TXSDateTime;
    FpreviousPeriod : WideString;
    /////
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property contractNumberServices : WideString read FcontractNumberServices write FcontractNumberServices;
    property accountNumber : WideString read FaccountNumber write FaccountNumber;
    property name : WideString read Fname write Fname;
    property customerName : WideString read FcustomerName write FcustomerName;
    property address : WideString read Faddress write Faddress;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property serialNumber : WideString read FserialNumber write FserialNumber;
    property seal : WideString read Fseal write Fseal;
    property phone : WideString read Fphone write Fphone;
    property  statuscode : Integer read Fstatuscode write Fstatuscode;
    property  rpCode : Integer read FrpCode write FrpCode;
    property dateCounterInst : TXSDate read FdateCounterInst write FdateCounterInst;
    property dateCounterCheck : TXSDate read FdateCounterCheck write FdateCounterCheck;
    property counterType : WideString read FcounterType write FcounterType;
    property classAccuracy : TXSDecimal read FclassAccuracy write FclassAccuracy;
    property checkperiod : TXSDecimal read Fcheckperiod write Fcheckperiod;
    property  rpStatusCode : Integer read FrpStatusCode write FrpStatusCode;
    property phasity : TXSDecimal read Fphasity write Fphasity;
    property datecheck : TXSDate read Fdatecheck write Fdatecheck;
    property checkperiod1 : TXSDecimal read Fcheckperiod1 write Fcheckperiod1;
    property placecounter : WideString read Fplacecounter write Fplacecounter;
    property  rpIsWorking : Integer read FrpIsWorking write FrpIsWorking;
    property recordPointName : WideString read FrecordPointName write FrecordPointName;
    property routeBytName : WideString read FrouteBytName write FrouteBytName;
    property routeBytNumbergen : WideString read FrouteBytNumbergen write FrouteBytNumbergen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property userEdit : WideString read FuserEdit write FuserEdit;
    property  factCode : Integer read FfactCode write FfactCode;
    property  counterCapacity : Integer read FcounterCapacity write FcounterCapacity;
    property counterVoltageNominal : TXSDecimal read FcounterVoltageNominal write FcounterVoltageNominal;
    property counterDateProduct : TXSDate read FcounterDateProduct write FcounterDateProduct;

    property workOrderBytRefCode : Integer read FworkOrderBytRefCode write FworkOrderBytRefCode;
    property workOrderBytRefNumberGen : WideString read FworkOrderBytRefNumberGen write FworkOrderBytRefNumberGen;
    property workOrderBytRefDateGen : TXSDate read FworkOrderBytRefDateGen write FworkOrderBytRefDateGen;
    property workOrderBytRefCommentGen : WideString read FworkOrderBytRefCommentGen write FworkOrderBytRefCommentGen;
    property workOrderBytRefDateAdd : TXSDateTime read FworkOrderBytRefDateAdd write FworkOrderBytRefDateAdd;
    property workOrderBytRefDateEdit : TXSDateTime read FworkOrderBytRefDateEdit write FworkOrderBytRefDateEdit;
    property workOrderBytRefUserAdd : WideString read FworkOrderBytRefUserAdd write FworkOrderBytRefUserAdd;
    property workOrderBytRefUserEdit : WideString read FworkOrderBytRefUserEdit write FworkOrderBytRefUserEdit;
    property humenItemRefCode : Integer read FhumenItemRefCode write FhumenItemRefCode;
    property humenItemRefCountGen : TXSDecimal read FhumenItemRefCountGen write FhumenItemRefCountGen;
    property humenItemRefCountFact : TXSDecimal read FhumenItemRefCountFact write FhumenItemRefCountFact;
    property humenItemRefCountFactOriginal : TXSDecimal read FhumenItemRefCountFactOriginal write FhumenItemRefCountFactOriginal;
    property humenItemRefPrice : TXSDecimal read FhumenItemRefPrice write FhumenItemRefPrice;
    property humenItemRefCost : TXSDecimal read FhumenItemRefCost write FhumenItemRefCost;
    property humenItemRefUserGen : WideString read FhumenItemRefUserGen write FhumenItemRefUserGen;
    property humenItemRefDateEdit : TXSDate read FhumenItemRefDateEdit write FhumenItemRefDateEdit;
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
    property planItemRefCode : Integer read FplanItemRefCode write FplanItemRefCode;
    property planItemRefCountGen : TXSDecimal read FplanItemRefCountGen write FplanItemRefCountGen;
    property planItemRefTimeGen : TXSDecimal read FplanItemRefTimeGen write FplanItemRefTimeGen;
    property planItemRefCostGen : TXSDecimal read FplanItemRefCostGen write FplanItemRefCostGen;
    property planItemRefUserGen : WideString read FplanItemRefUserGen write FplanItemRefUserGen;
    property planItemRefDateEdit : TXSDate read FplanItemRefDateEdit write FplanItemRefDateEdit;
    property finWorkerCode : Integer read FfinWorkerCode write FfinWorkerCode;
    property finWorkerName : WideString read FfinWorkerName write FfinWorkerName;
    property finWorkerTabNumber : WideString read FfinWorkerTabNumber write FfinWorkerTabNumber;
    property finWorkerPositionName : WideString read FfinWorkerPositionName write FfinWorkerPositionName;
    property finWorkerPositionCode : Integer read FfinWorkerPositionCode write FfinWorkerPositionCode;
    property finWorkerDepartmentName : WideString read FfinWorkerDepartmentName write FfinWorkerDepartmentName;
    property finWorkerDepartmentCode : WideString read FfinWorkerDepartmentCode write FfinWorkerDepartmentCode;
    property finWorkerPriceGen : TXSDecimal read FfinWorkerPriceGen write FfinWorkerPriceGen;
    property finWorkerCategor : Integer read FfinWorkerCategor write FfinWorkerCategor;
    property finWorkerFinCode : Integer read FfinWorkerFinCode write FfinWorkerFinCode;
    property finWorkerIsSentAssignment : Integer read FfinWorkerIsSentAssignment write FfinWorkerIsSentAssignment;
    property finWorkerChargePercent : TXSDecimal read FfinWorkerChargePercent write FfinWorkerChargePercent;
    property finWorkerCategorId : Integer read FfinWorkerCategorId write FfinWorkerCategorId;
    property finWorkerCategorName : WideString read FfinWorkerCategorName write FfinWorkerCategorName;
    property finWorkerWorkTimeId : WideString read FfinWorkerWorkTimeId write FfinWorkerWorkTimeId;
    property finWorkerPositionId : WideString read FfinWorkerPositionId write FfinWorkerPositionId;
    property recordPointBytRefCode : Integer read FrecordPointBytRefCode write FrecordPointBytRefCode;
    property recordPointBytRefAccountNumber : WideString read FrecordPointBytRefAccountNumber write FrecordPointBytRefAccountNumber;
    property recordPointBytRefContractDate : TXSDate read FrecordPointBytRefContractDate write FrecordPointBytRefContractDate;
    property recordPointBytRefName : WideString read FrecordPointBytRefName write FrecordPointBytRefName;
    property recordPointBytRefAddress : WideString read FrecordPointBytRefAddress write FrecordPointBytRefAddress;
    property recordPointBytRefRpCode : Integer read FrecordPointBytRefRpCode write FrecordPointBytRefRpCode;
    property recordPointBytRefInvNumber : WideString read FrecordPointBytRefInvNumber write FrecordPointBytRefInvNumber;
    property recordPointBytRefSerialNumber : WideString read FrecordPointBytRefSerialNumber write FrecordPointBytRefSerialNumber;
    property recordPointBytRefDateCounterInst : TXSDate read FrecordPointBytRefDateCounterInst write FrecordPointBytRefDateCounterInst;
    property recordPointBytRefDateCounterCheck : TXSDate read FrecordPointBytRefDateCounterCheck write FrecordPointBytRefDateCounterCheck;
    property recordPointBytRefCounterType : WideString read FrecordPointBytRefCounterType write FrecordPointBytRefCounterType;
    property recordPointBytRefClassAccuracy : TXSDecimal read FrecordPointBytRefClassAccuracy write FrecordPointBytRefClassAccuracy;
    property recordPointBytRefCheckperiod : TXSDecimal read FrecordPointBytRefCheckperiod write FrecordPointBytRefCheckperiod;
    property recordPointBytRefStatuscode : Integer read FrecordPointBytRefStatuscode write FrecordPointBytRefStatuscode;
    property recordPointBytRefPhasity : TXSDecimal read FrecordPointBytRefPhasity write FrecordPointBytRefPhasity;
    property recordPointBytRefDatecheck : TXSDate read FrecordPointBytRefDatecheck write FrecordPointBytRefDatecheck;
    property recordPointBytRefCheckperiod1 : TXSDecimal read FrecordPointBytRefCheckperiod1 write FrecordPointBytRefCheckperiod1;
    property recordPointBytRefPhone : WideString read FrecordPointBytRefPhone write FrecordPointBytRefPhone;
    property recordPointBytRefSeal : WideString read FrecordPointBytRefSeal write FrecordPointBytRefSeal;
    property recordPointBytRefPlacecounter : WideString read FrecordPointBytRefPlacecounter write FrecordPointBytRefPlacecounter;
    property recordPointBytRefIsworking : Integer read FrecordPointBytRefIsworking write FrecordPointBytRefIsworking;
    property recordPointBytRefCounterCapacity : Integer read FrecordPointBytRefCounterCapacity write FrecordPointBytRefCounterCapacity;
    property recordPointBytRefCounterVoltageNominal : TXSDecimal read FrecordPointBytRefCounterVoltageNominal write FrecordPointBytRefCounterVoltageNominal;
    property recordPointBytRefCounterDateProduct : TXSDate read FrecordPointBytRefCounterDateProduct write FrecordPointBytRefCounterDateProduct;
    property recordPointPromRefCode : Integer read FrecordPointPromRefCode write FrecordPointPromRefCode;
    property recordPointPromRefAccountNumber : WideString read FrecordPointPromRefAccountNumber write FrecordPointPromRefAccountNumber;
    property recordPointPromRefAccountName : WideString read FrecordPointPromRefAccountName write FrecordPointPromRefAccountName;
    property recordPointPromRefCounterNumber : WideString read FrecordPointPromRefCounterNumber write FrecordPointPromRefCounterNumber;
    property recordPointPromRefRecordPointName : WideString read FrecordPointPromRefRecordPointName write FrecordPointPromRefRecordPointName;
    property recordPointPromRefRecordPointAddr : WideString read FrecordPointPromRefRecordPointAddr write FrecordPointPromRefRecordPointAddr;
    property recordPointPromRefRecordPointKindName : WideString read FrecordPointPromRefRecordPointKindName write FrecordPointPromRefRecordPointKindName;
    property recordPointPromRefRecordPointCode : Integer read FrecordPointPromRefRecordPointCode write FrecordPointPromRefRecordPointCode;
    property recordPointPromRefFeeder : WideString read FrecordPointPromRefFeeder write FrecordPointPromRefFeeder;
    property recordPointPromRefSubstation : WideString read FrecordPointPromRefSubstation write FrecordPointPromRefSubstation;
    property recordPointPromRefInvNumber : WideString read FrecordPointPromRefInvNumber write FrecordPointPromRefInvNumber;
    property recordPointPromRefDayofcalculation : Integer read FrecordPointPromRefDayofcalculation write FrecordPointPromRefDayofcalculation;
    property recordPointPromRefInspector : WideString read FrecordPointPromRefInspector write FrecordPointPromRefInspector;
    property recordPointPromRefDatecontrol : TXSDate read FrecordPointPromRefDatecontrol write FrecordPointPromRefDatecontrol;
    property recordPointPromRefDatetp : TXSDate read FrecordPointPromRefDatetp write FrecordPointPromRefDatetp;
    property recordPointPromRefDateCounterInst : TXSDate read FrecordPointPromRefDateCounterInst write FrecordPointPromRefDateCounterInst;
    property recordPointPromRefDateCounterCheck : TXSDate read FrecordPointPromRefDateCounterCheck write FrecordPointPromRefDateCounterCheck;
    property recordPointPromRefCounterType : WideString read FrecordPointPromRefCounterType write FrecordPointPromRefCounterType;
    property recordPointPromRefClassAccuracy : TXSDecimal read FrecordPointPromRefClassAccuracy write FrecordPointPromRefClassAccuracy;
    property recordPointPromRefCheckperiod : TXSDecimal read FrecordPointPromRefCheckperiod write FrecordPointPromRefCheckperiod;
    property recordPointPromRefStatuscode : Integer read FrecordPointPromRefStatuscode write FrecordPointPromRefStatuscode;
    property recordPointPromRefPhasity : TXSDecimal read FrecordPointPromRefPhasity write FrecordPointPromRefPhasity;
    property recordPointPromRefPhone : WideString read FrecordPointPromRefPhone write FrecordPointPromRefPhone;
    property recordPointPromRefSeal : WideString read FrecordPointPromRefSeal write FrecordPointPromRefSeal;
    property recordPointPromRefPlacecounter : WideString read FrecordPointPromRefPlacecounter write FrecordPointPromRefPlacecounter;
    property recordPointPromRefIsworking : Integer read FrecordPointPromRefIsworking write FrecordPointPromRefIsworking;
    property recordPointPromRefCounterCapacity : Integer read FrecordPointPromRefCounterCapacity write FrecordPointPromRefCounterCapacity;
    property recordPointPromRefCounterVoltageNominal : TXSDecimal read FrecordPointPromRefCounterVoltageNominal write FrecordPointPromRefCounterVoltageNominal;
    property recordPointPromRefCounterDateProduct : TXSDate read FrecordPointPromRefCounterDateProduct write FrecordPointPromRefCounterDateProduct;
    property routeBytRefCode : Integer read FrouteBytRefCode write FrouteBytRefCode;
    property routeBytRefName : WideString read FrouteBytRefName write FrouteBytRefName;
    property routeBytRefNumbergen : WideString read FrouteBytRefNumbergen write FrouteBytRefNumbergen;
    property routeBytRefRouteCode : Integer read FrouteBytRefRouteCode write FrouteBytRefRouteCode;
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
    property scCounterRefCode : Integer read FscCounterRefCode write FscCounterRefCode;
    property scCounterRefInvNumber : WideString read FscCounterRefInvNumber write FscCounterRefInvNumber;
    property scCounterRefName : WideString read FscCounterRefName write FscCounterRefName;
    property scCounterRefBuildNumber : WideString read FscCounterRefBuildNumber write FscCounterRefBuildNumber;
    property scCounterRefAccount : WideString read FscCounterRefAccount write FscCounterRefAccount;
    property scCounterRefDepartmetFKCode : WideString read FscCounterRefDepartmetFKCode write FscCounterRefDepartmetFKCode;
    property scCounterRefMolCode : WideString read FscCounterRefMolCode write FscCounterRefMolCode;
    property scCounterRefDateIn : TXSDate read FscCounterRefDateIn write FscCounterRefDateIn;
    property scCounterRefDateBuild : TXSDate read FscCounterRefDateBuild write FscCounterRefDateBuild;
    property scCounterRefDateCheck : TXSDate read FscCounterRefDateCheck write FscCounterRefDateCheck;
    property scCounterRefCost : TXSDecimal read FscCounterRefCost write FscCounterRefCost;
    property scCounterRefScCode : Integer read FscCounterRefScCode write FscCounterRefScCode;
    property scCounterRefCounterType : WideString read FscCounterRefCounterType write FscCounterRefCounterType;
    property scCounterRefInstallOrderNumber : WideString read FscCounterRefInstallOrderNumber write FscCounterRefInstallOrderNumber;
    property scCounterRefReading : WideString read FscCounterRefReading write FscCounterRefReading;
    property scCounterRefDateEdit : TXSDateTime read FscCounterRefDateEdit write FscCounterRefDateEdit;
    property scCounterRefIsliquid : Integer read FscCounterRefIsliquid write FscCounterRefIsliquid;
    property scCounterRefCostOld : TXSDecimal read FscCounterRefCostOld write FscCounterRefCostOld;
    /////
    property kartaRefCode : Integer read FkartaRefCode write FkartaRefCode;
    property kartaRefName : WideString read FkartaRefName write FkartaRefName;
    property kartaRefNum : WideString read FkartaRefNum write FkartaRefNum;
    property positionCode : Integer read FpositionCode write FpositionCode;
    property positionName : WideString read FpositionName write FpositionName;

    property planRefTypeCode : Integer read FplanRefTypeCode write FplanRefTypeCode;
    property planRefStateCode : Integer read FplanRefStateCode write FplanRefStateCode;

    property replaceCounterServices : Integer read FreplaceCounterServices write FreplaceCounterServices;
    property smsInformTime : WideString read FsmsInformTime write FsmsInformTime;

    property monthPlanDateGen : TXSDateTime read FmonthPlanDateGen write FmonthPlanDateGen;
    property previousPeriod : WideString read FpreviousPeriod write FpreviousPeriod;
    /////
  end;

  ArrayOfENWorkOrderBytItemShort = array of ENWorkOrderBytItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENWorkOrderBytItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENWorkOrderBytItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENWorkOrderBytItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENWorkOrderBytItemController/message/
  // soapAction: http://ksoe.org/ENWorkOrderBytItemController/action/ENWorkOrderBytItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENWorkOrderBytItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENWorkOrderBytItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENWorkOrderBytItemControllerSoapPort = interface(IInvokable)
  ['{86ECC937-192B-4356-83EF-9C3EAC4E9979}']
    function add(const aENWorkOrderBytItem: ENWorkOrderBytItem): Integer; stdcall;
    procedure addFromShort(const aENWorkOrderBytItem: ENWorkOrderBytItem; const aENWorkOrderBytItemShort: ENWorkOrderBytItemShort); stdcall;

    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENWorkOrderBytItem: ENWorkOrderBytItem); stdcall;
    function getObject(const anObjectCode: Integer): ENWorkOrderBytItem; stdcall;
    function getList: ENWorkOrderBytItemShortList; stdcall;
    function getFilteredList(const aENWorkOrderBytItemFilter: ENWorkOrderBytItemFilter): ENWorkOrderBytItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrderBytItemShortList; stdcall;
    function getScrollableFilteredList(const aENWorkOrderBytItemFilter: ENWorkOrderBytItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrderBytItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrderBytItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENWorkOrderBytItemFilter: ENWorkOrderBytItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENWorkOrderBytItemShort; stdcall;

    function getScrollableFilteredListForAdd(const aENWorkOrderBytItemFilter: ENWorkOrderBytItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrderBytItemShortList; stdcall;
    function getScrollableFilteredListForAdd2(const aENWorkOrderBytItemFilter: ENWorkOrderBytItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrderBytItemShortList; stdcall;

    function  getScrollableFilteredListForPlanning(const aENWorkOrderBytItemFilter: ENWorkOrderBytItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrderBytItemShortList; stdcall; overload;
    function  getScrollableFilteredListForPlanning(const aENWorkOrderBytItemFilter: ENWorkOrderBytItemFilter; const aFromPosition: Integer; const aQuantity: Integer; const aElementType: Integer): ENWorkOrderBytItemShortList; stdcall; overload;

    function updateFinWorker(const anObjectCode: Integer; const aFINWorker: FINWorker): Integer; stdcall;
  end;


implementation

  destructor ENWorkOrderBytItem.Destroy;
  begin
    if Assigned(FdateCounterInst) then
      dateCounterInst.Free;
    if Assigned(FdateCounterCheck) then
      dateCounterCheck.Free;
    if Assigned(FclassAccuracy) then
      classAccuracy.Free;
    if Assigned(Fcheckperiod) then
      checkperiod.Free;
    if Assigned(Fphasity) then
      phasity.Free;
    if Assigned(Fdatecheck) then
      datecheck.Free;
    if Assigned(Fcheckperiod1) then
      checkperiod1.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FcounterVoltageNominal) then
      counterVoltageNominal.Free;
    if Assigned(FcounterDateProduct) then
      counterDateProduct.Free;
    if Assigned(FworkOrderBytRef) then
      workOrderBytRef.Free;
    if Assigned(FhumenItemRef) then
      humenItemRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FplanItemRef) then
      planItemRef.Free;
    if Assigned(FfinWorker) then
      finWorker.Free;
    if Assigned(FrecordPointBytRef) then
      recordPointBytRef.Free;
    if Assigned(FrecordPointPromRef) then
      recordPointPromRef.Free;
    if Assigned(FrouteBytRef) then
      routeBytRef.Free;
    if Assigned(FservicesObjectRef) then
      servicesObjectRef.Free;
    if Assigned(FscCounterRef) then
      scCounterRef.Free;
    inherited Destroy;
  end;

{
  destructor ENWorkOrderBytItemFilter.Destroy;
  begin
    if Assigned(FdateCounterInst) then
      dateCounterInst.Free;
    if Assigned(FdateCounterCheck) then
      dateCounterCheck.Free;
    if Assigned(FclassAccuracy) then
      classAccuracy.Free;
    if Assigned(Fcheckperiod) then
      checkperiod.Free;
    if Assigned(Fphasity) then
      phasity.Free;
    if Assigned(Fdatecheck) then
      datecheck.Free;
    if Assigned(Fcheckperiod1) then
      checkperiod1.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FcounterVoltageNominal) then
      counterVoltageNominal.Free;
    if Assigned(FcounterDateProduct) then
      counterDateProduct.Free;
    if Assigned(FworkOrderBytRef) then
      workOrderBytRef.Free;
    if Assigned(FhumenItemRef) then
      humenItemRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FplanItemRef) then
      planItemRef.Free;
    if Assigned(FfinWorker) then
      finWorker.Free;
    if Assigned(FrecordPointBytRef) then
      recordPointBytRef.Free;
    if Assigned(FrecordPointPromRef) then
      recordPointPromRef.Free;
    if Assigned(FrouteBytRef) then
      routeBytRef.Free;
    if Assigned(FservicesObjectRef) then
      servicesObjectRef.Free;
    if Assigned(FscCounterRef) then
      scCounterRef.Free;
    inherited Destroy;
  end;
}

  destructor ENWorkOrderBytItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENWorkOrderBytItemShort.Destroy;
  begin
    if Assigned(FdateCounterInst) then
      dateCounterInst.Free;
    if Assigned(FdateCounterCheck) then
      dateCounterCheck.Free;
    if Assigned(FclassAccuracy) then
      classAccuracy.Free;
    if Assigned(Fcheckperiod) then
      checkperiod.Free;
    if Assigned(Fphasity) then
      phasity.Free;
    if Assigned(Fdatecheck) then
      datecheck.Free;
    if Assigned(Fcheckperiod1) then
      checkperiod1.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FcounterVoltageNominal) then
      counterVoltageNominal.Free;
    if Assigned(FcounterDateProduct) then
      counterDateProduct.Free;
    if Assigned(FworkOrderBytRefDateGen) then
      workOrderBytRefDateGen.Free;
    if Assigned(FworkOrderBytRefDateAdd) then
      workOrderBytRefDateAdd.Free;
    if Assigned(FworkOrderBytRefDateEdit) then
      workOrderBytRefDateEdit.Free;
    if Assigned(FhumenItemRefCountGen) then
      humenItemRefCountGen.Free;
    if Assigned(FhumenItemRefCountFact) then
      humenItemRefCountFact.Free;
    if Assigned(FhumenItemRefCountFactOriginal) then
      humenItemRefCountFactOriginal.Free;
    if Assigned(FhumenItemRefPrice) then
      humenItemRefPrice.Free;
    if Assigned(FhumenItemRefCost) then
      humenItemRefCost.Free;
    if Assigned(FhumenItemRefDateEdit) then
      humenItemRefDateEdit.Free;
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
    if Assigned(FplanItemRefCountGen) then
      planItemRefCountGen.Free;
    if Assigned(FplanItemRefTimeGen) then
      planItemRefTimeGen.Free;
    if Assigned(FplanItemRefCostGen) then
      planItemRefCostGen.Free;
    if Assigned(FplanItemRefDateEdit) then
      planItemRefDateEdit.Free;
    if Assigned(FfinWorkerPriceGen) then
      finWorkerPriceGen.Free;
    if Assigned(FfinWorkerChargePercent) then
      finWorkerChargePercent.Free;
    if Assigned(FrecordPointBytRefContractDate) then
      recordPointBytRefContractDate.Free;
    if Assigned(FrecordPointBytRefDateCounterInst) then
      recordPointBytRefDateCounterInst.Free;
    if Assigned(FrecordPointBytRefDateCounterCheck) then
      recordPointBytRefDateCounterCheck.Free;
    if Assigned(FrecordPointBytRefClassAccuracy) then
      recordPointBytRefClassAccuracy.Free;
    if Assigned(FrecordPointBytRefCheckperiod) then
      recordPointBytRefCheckperiod.Free;
    if Assigned(FrecordPointBytRefPhasity) then
      recordPointBytRefPhasity.Free;
    if Assigned(FrecordPointBytRefDatecheck) then
      recordPointBytRefDatecheck.Free;
    if Assigned(FrecordPointBytRefCheckperiod1) then
      recordPointBytRefCheckperiod1.Free;
    if Assigned(FrecordPointBytRefCounterVoltageNominal) then
      recordPointBytRefCounterVoltageNominal.Free;
    if Assigned(FrecordPointBytRefCounterDateProduct) then
      recordPointBytRefCounterDateProduct.Free;
    if Assigned(FrecordPointPromRefDatecontrol) then
      recordPointPromRefDatecontrol.Free;
    if Assigned(FrecordPointPromRefDatetp) then
      recordPointPromRefDatetp.Free;
    if Assigned(FrecordPointPromRefDateCounterInst) then
      recordPointPromRefDateCounterInst.Free;
    if Assigned(FrecordPointPromRefDateCounterCheck) then
      recordPointPromRefDateCounterCheck.Free;
    if Assigned(FrecordPointPromRefClassAccuracy) then
      recordPointPromRefClassAccuracy.Free;
    if Assigned(FrecordPointPromRefCheckperiod) then
      recordPointPromRefCheckperiod.Free;
    if Assigned(FrecordPointPromRefPhasity) then
      recordPointPromRefPhasity.Free;
    if Assigned(FrecordPointPromRefCounterVoltageNominal) then
      recordPointPromRefCounterVoltageNominal.Free;
    if Assigned(FrecordPointPromRefCounterDateProduct) then
      recordPointPromRefCounterDateProduct.Free;
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
    if Assigned(FscCounterRefDateIn) then
      scCounterRefDateIn.Free;
    if Assigned(FscCounterRefDateBuild) then
      scCounterRefDateBuild.Free;
    if Assigned(FscCounterRefDateCheck) then
      scCounterRefDateCheck.Free;
    if Assigned(FscCounterRefCost) then
      scCounterRefCost.Free;
    if Assigned(FscCounterRefDateEdit) then
      scCounterRefDateEdit.Free;
    if Assigned(FscCounterRefCostOld) then
      scCounterRefCostOld.Free;
    inherited Destroy;
  end;

  destructor ENWorkOrderBytItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENWorkOrderBytItem, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderBytItem');
  RemClassRegistry.RegisterXSClass(ENWorkOrderBytItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderBytItemRef');
  RemClassRegistry.RegisterXSClass(ENWorkOrderBytItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderBytItemFilter');
  RemClassRegistry.RegisterXSClass(ENWorkOrderBytItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderBytItemShort');
  RemClassRegistry.RegisterXSClass(ENWorkOrderBytItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderBytItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENWorkOrderBytItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENWorkOrderBytItemShort');

  InvRegistry.RegisterInterface(TypeInfo(ENWorkOrderBytItemControllerSoapPort), 'http://ksoe.org/ENWorkOrderBytItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENWorkOrderBytItemControllerSoapPort), 'http://ksoe.org/ENWorkOrderBytItemController/action/ENWorkOrderBytItemController.%operationName%');


end.
