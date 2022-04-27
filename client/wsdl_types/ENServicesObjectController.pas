unit ENServicesObjectController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENDepartmentController 
   ,ENElementController 
   ,ENServicesContractStatusController 
   ,ENServicesContractTypeController 
   ,ENServicesContragentTypeController 
   ,ENServicesBillStatusController 
   ,ENWarrantController
   ,FKProvObjectController
   ,ENServicesObjectStatusController 
   ,ENTechConditionsObjectsController 
   ,ENServicesContractKindController 
   ,CNSubsystemTypeController
   ,CNPackController
   ,ENTechConditionsServicesController
   ,ENServicesObjectCalcTypeController
   ,ENCalc2ConnectTariffController
   ,ENGeneralContractsController
   ,ENElement2ENElementController
   ,FINContractsController
   ,ENActIncomeCreatMetodController
   , RQFKOrderController
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

  ENServicesObject            = class;          { "http://ksoe.org/EnergyproControllerService/type/" }
  PersonalServicesInfo = class;                 { "http://ksoe.org/ContractControllerService/type/" }
  SpravPartner = class;                 		{ "http://ksoe.org/ContractControllerService/type/" }

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ContractControllerService/type/
  // ************************************************************************ //

  ArrayOfWideString = array of WideString;

  PersonalServicesInfo = class(TRemotable)
  private
    FrpCode: Integer;
    FrpName: WideString;
    FrpUid: WideString;
    FfioLine: WideString;
    FaddressLine: WideString;
    FidentCode: WideString;
    FpassportLine: WideString;
    Fphone: WideString;
    Fisurban: Integer;
    Fsitecode: Integer;
    // версия SMART
    Fsmver: Integer;
    // наличие связи со счетчиком
    Fislink: Integer;
    // фазность счетчика
    FcounterPhasity: Integer;
    // признак возможности программирования
    FisProgram: Integer;
    // инвентарный номер счетчика
    FcounterInvNumber: WideString;
    // были ли параметризация
    FisParam : TXSBoolean;
    //** тип и серийный номер счетчика */
    FcounterType: WideString;
    //** дата поверки счетчика */
    FcounterCheckDate: WideString;
    //** последний контроль */
    FlastControl: WideString;
    //** источник питания */
    FpowerSupplyPoint: WideString;
    //** разрядность счетчика */
    FcounterDigit: Integer;
    //** наименование тарифа */
    FtariffName: WideString;
    //** EIC-код точки учета */
    Feic: WideString;
    //** тип потребителя (для прома) */
    FcustomerTypeCode: Integer;
    Feics : ArrayOfWideString;
  published
    property rpCode: Integer read FrpCode write FrpCode;
    property rpName: WideString read FrpName write FrpName;
    property rpUid: WideString read FrpUid write FrpUid;
    property fioLine: WideString read FfioLine write FfioLine;
    property addressLine: WideString read FaddressLine write FaddressLine;
    property identCode: WideString read FidentCode write FidentCode;
    property passportLine: WideString read FpassportLine write FpassportLine;
    property phone: WideString read Fphone write Fphone;
    property isurban: Integer read Fisurban write Fisurban;
    property sitecode: Integer read Fsitecode write Fsitecode;
    property smver: Integer read Fsmver write Fsmver;
    property islink: Integer read Fislink write Fislink;
    property counterPhasity: Integer read FcounterPhasity write FcounterPhasity;
    property isProgram: Integer read FisProgram write FisProgram;
    property counterInvNumber: WideString read FcounterInvNumber write FcounterInvNumber;
    property isParam : TXSBoolean read FisParam write FisParam;
    property counterType: WideString read FcounterType write FcounterType;
    property counterCheckDate: WideString read FcounterCheckDate write FcounterCheckDate;
    property lastControl: WideString read FlastControl write FlastControl;
    property powerSupplyPoint: WideString read FpowerSupplyPoint write FpowerSupplyPoint;
    property counterDigit: Integer read FcounterDigit write FcounterDigit;
    property tariffName: WideString read FtariffName write FtariffName;
    property eic: WideString read Feic write Feic;
    property customerTypeCode: Integer read FcustomerTypeCode write FcustomerTypeCode;
    property eics : ArrayOfWideString read Feics write Feics;
  end;
  
  SpravPartner = class(TRemotable)
  private
	Fid: Integer;
	Fcode: WideString;
	Fname: WideString;
  public
    destructor Destroy; override;
  published
	property id: Integer read Fid write Fid;
    property code: WideString read Fcode write Fcode;
    property name: WideString read Fname write Fname;
  end;
  
  ArrayOfSpravPartner = array of SpravPartner;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesObjectRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesObject = class(TRemotable)
  private
    Fcode : Integer; 
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    Fname : WideString;
    FpartnerCode : WideString;
    FfinDocCode : WideString;
    FfinDocID : Integer; 
    FcommentGen : WideString;
    FcontractNumberServices : WideString;
    FcontractDateServices : TXSDate;
    FcontragentName : WideString;
    FcontragentAddress : WideString;
    FcontragentAddressWork : WideString;
    FcontragentOkpo : WideString;
    FcontragentBankAccount : WideString;
    FcontragentBankName : WideString;
    FcontragentBankMfo : WideString;
    FcontragentBossName : WideString;
    FcontragentPassport : WideString;
    FcontractServicesSumma : TXSDecimal;
    FcontractServicesSummaVAT : TXSDecimal;
    FcontractServicesPower : TXSDecimal;
    FcommentServicesGen : WideString;
    FcontractServicesDistance : TXSDecimal;
    FcontractServicesDay : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FwarrantDate : TXSDate;
    FwarrantNumber : WideString;
    FwarrantFIO : WideString;
    FregionalType : Integer;
    FbasisType : TXSDecimal;
    FcontragentPosition : WideString;
    FexecuteWorkDate : TXSDate;
    FtimeStart : TXSDateTime;	
    FtimeFinal : TXSDateTime;	
    FcontragentPhoneNumber : WideString;
    FexecutorPhoneNumber : WideString;
    FcontragentObjectWork : WideString;
    FisNoPay : Integer;    // NET-2344
    FisCustomerMaterials : Integer; 
    FpayDate : TXSDate;
    FfinPayFormCode : Integer; 
    FfinPayFormName : WideString;
    FpartnerId : Integer; 
    FpayDetail : WideString;
    FactTransferNumber : WideString;
    FactTransferDate : TXSDate;
    Fresposible : WideString;
    FresposiblePosition : WideString;
    FresposibleTabNumber : WideString;
    FprevContractStatus : Integer;
    FreconnectionTU : Integer;
    FpersonalAccountCode : Integer;
    FpersonalAccountNumber : WideString;
    FtabNumber : WideString;
    FcitiesList : WideString;
    FlineLength : TXSDecimal;
    FprojectCode : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
    FcnPackCode : Integer; 
    FdfPackCode : Integer;
    FcountersZoneType : Integer;
    FprojAgreeSumma : TXSDecimal;
    FtopographySumma : TXSDecimal;
    FcreatedFromSite : Integer;
    FboundaryDateWork : TXSDate;
	FcalcSumsByCalculations : TXSBoolean;
    FcodeEIC : WideString;
    FpersonalAccountUid : WideString;
    FcustomerMailingAddress : WideString;
    FpowerGeneration : TXSDecimal;
    FpostCode : WideString;
    FcustomerEmail : WideString;
    FdemographicCode : WideString;
    FownershipRecordNumber : WideString;
    FrealEstateRegNumber : WideString;
//???
    Fdepartment : ENDepartment;
//???
    Felement : ENElement;
//???
    FcontractStatusRef : ENServicesContractStatusRef;
//???
    FcontractTypeRef : ENServicesContractTypeRef;
//???
    FcontragentTypeRef : ENServicesContragentTypeRef;
//???
    FbillStatusRef : ENServicesBillStatusRef;
//???
    FwarrantRef : ENWarrantRef;
//???
    FstatusRef : ENServicesObjectStatusRef;
//???
    FtechConObjects : ENTechConditionsObjects;
//???
    FcontractKindRef : ENServicesContractKindRef;
//???
    FcnSubsystemTypeRef : CNSubsystemTypeRef;

    Ftension_point: TXSDecimal;
    FbaseStation: Integer;

//???
    FcalcTypeRef : ENServicesObjectCalcTypeRef;
//???
    FgeneralContractRef : ENGeneralContractsRef;

    FisActive : Integer;
//???
    FactIncomeCreatMetodRef : ENActIncomeCreatMetodRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property name : WideString read Fname write Fname;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property contractNumberServices : WideString read FcontractNumberServices write FcontractNumberServices;
    property contractDateServices : TXSDate read FcontractDateServices write FcontractDateServices;
    property contragentName : WideString read FcontragentName write FcontragentName;
    property contragentAddress : WideString read FcontragentAddress write FcontragentAddress;
    property contragentAddressWork : WideString read FcontragentAddressWork write FcontragentAddressWork;
    property contragentOkpo : WideString read FcontragentOkpo write FcontragentOkpo;
    property contragentBankAccount : WideString read FcontragentBankAccount write FcontragentBankAccount;
    property contragentBankName : WideString read FcontragentBankName write FcontragentBankName;
    property contragentBankMfo : WideString read FcontragentBankMfo write FcontragentBankMfo;
    property contragentBossName : WideString read FcontragentBossName write FcontragentBossName;
    property contragentPassport : WideString read FcontragentPassport write FcontragentPassport;
    property contractServicesSumma : TXSDecimal read FcontractServicesSumma write FcontractServicesSumma;
    property contractServicesSummaVAT : TXSDecimal read FcontractServicesSummaVAT write FcontractServicesSummaVAT;
    property contractServicesPower : TXSDecimal read FcontractServicesPower write FcontractServicesPower;
    property commentServicesGen : WideString read FcommentServicesGen write FcommentServicesGen;
    property contractServicesDistance : TXSDecimal read FcontractServicesDistance write FcontractServicesDistance;
    property contractServicesDay : TXSDecimal read FcontractServicesDay write FcontractServicesDay;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property warrantDate : TXSDate read FwarrantDate write FwarrantDate;
    property warrantNumber : WideString read FwarrantNumber write FwarrantNumber;
    property warrantFIO : WideString read FwarrantFIO write FwarrantFIO;
    property regionalType : Integer read FregionalType write FregionalType;
    property basisType : TXSDecimal read FbasisType write FbasisType;
    property contragentPosition : WideString read FcontragentPosition write FcontragentPosition;
    property executeWorkDate : TXSDate read FexecuteWorkDate write FexecuteWorkDate;
    property timeStart : TXSDateTime read FtimeStart write FtimeStart;	
    property timeFinal : TXSDateTime read FtimeFinal write FtimeFinal;	
    property contragentPhoneNumber : WideString read FcontragentPhoneNumber write FcontragentPhoneNumber;
    property executorPhoneNumber : WideString read FexecutorPhoneNumber write FexecutorPhoneNumber;
    property contragentObjectWork : WideString read FcontragentObjectWork write FcontragentObjectWork;
    property isNoPay : Integer  read FisNoPay write FisNoPay;       // NET-2344
    property  isCustomerMaterials : Integer read FisCustomerMaterials write FisCustomerMaterials; 
    property payDate : TXSDate read FpayDate write FpayDate;
    property finPayFormCode : Integer read FfinPayFormCode write FfinPayFormCode; 
    property finPayFormName : WideString read FfinPayFormName write FfinPayFormName;
    property partnerId : Integer read FpartnerId write FpartnerId; 
    property payDetail : WideString read FpayDetail write FpayDetail;
    property actTransferNumber : WideString read FactTransferNumber write FactTransferNumber;
    property actTransferDate : TXSDate read FactTransferDate write FactTransferDate;
    property resposible : WideString read Fresposible write Fresposible;
    property resposiblePosition : WideString read FresposiblePosition write FresposiblePosition;
    property resposibleTabNumber : WideString read FresposibleTabNumber write FresposibleTabNumber;
    property  prevContractStatus : Integer read FprevContractStatus write FprevContractStatus;
    property  reconnectionTU : Integer read FreconnectionTU write FreconnectionTU;
    property  personalAccountCode : Integer read FpersonalAccountCode write FpersonalAccountCode;
    property personalAccountNumber : WideString read FpersonalAccountNumber write FpersonalAccountNumber;
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property citiesList : WideString read FcitiesList write FcitiesList;
    property lineLength : TXSDecimal read FlineLength write FlineLength;
    property projectCode : WideString read FprojectCode write FprojectCode;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property  cnPackCode : Integer read FcnPackCode write FcnPackCode; 
    property  dfPackCode : Integer read FdfPackCode write FdfPackCode;
    property  countersZoneType : Integer read FcountersZoneType write FcountersZoneType;
    property projAgreeSumma : TXSDecimal read FprojAgreeSumma write FprojAgreeSumma;
    property topographySumma : TXSDecimal read FtopographySumma write FtopographySumma;
    property  createdFromSite : Integer read FcreatedFromSite write FcreatedFromSite;
    property boundaryDateWork : TXSDate read FboundaryDateWork write FboundaryDateWork;
    property codeEIC : WideString read FcodeEIC write FcodeEIC;
    property personalAccountUid : WideString read FpersonalAccountUid write FpersonalAccountUid;
    property customerMailingAddress : WideString read FcustomerMailingAddress write FcustomerMailingAddress;
    property powerGeneration : TXSDecimal read FpowerGeneration write FpowerGeneration;
    property postCode : WideString read FpostCode write FpostCode;
    property customerEmail : WideString read FcustomerEmail write FcustomerEmail;
property demographicCode : WideString read FdemographicCode write FdemographicCode;
    property ownershipRecordNumber : WideString read FownershipRecordNumber write FownershipRecordNumber;
    property realEstateRegNumber : WideString read FrealEstateRegNumber write FrealEstateRegNumber;
    property department : ENDepartment read Fdepartment write Fdepartment; 
    property element : ENElement read Felement write Felement; 
    property contractStatusRef : ENServicesContractStatusRef read FcontractStatusRef write FcontractStatusRef; 
    property contractTypeRef : ENServicesContractTypeRef read FcontractTypeRef write FcontractTypeRef; 
    property contragentTypeRef : ENServicesContragentTypeRef read FcontragentTypeRef write FcontragentTypeRef;
    property billStatusRef : ENServicesBillStatusRef read FbillStatusRef write FbillStatusRef; 
    property warrantRef : ENWarrantRef read FwarrantRef write FwarrantRef;
    property statusRef : ENServicesObjectStatusRef read FstatusRef write FstatusRef; 
    property techConObjects : ENTechConditionsObjects read FtechConObjects write FtechConObjects;
    property contractKindRef : ENServicesContractKindRef read FcontractKindRef write FcontractKindRef; 
    property cnSubsystemTypeRef : CNSubsystemTypeRef read FcnSubsystemTypeRef write FcnSubsystemTypeRef;
    property tension_point: TXSDecimal read Ftension_point write Ftension_point;
    property baseStation: Integer read FbaseStation write FbaseStation;
    property calcTypeRef : ENServicesObjectCalcTypeRef read FcalcTypeRef write FcalcTypeRef;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
    property isActive : Integer read FisActive write FisActive;
    property actIncomeCreatMetodRef : ENActIncomeCreatMetodRef read FactIncomeCreatMetodRef write FactIncomeCreatMetodRef;
	property calcSumsByCalculations : TXSBoolean read FcalcSumsByCalculations write FcalcSumsByCalculations;
  end;
  
{
  ENServicesObjectFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    Fname : WideString;
    FpartnerCode : WideString;
    FfinDocCode : WideString;
    FfinDocID : Integer; 
    FcommentGen : WideString;
    FcontractNumberServices : WideString;
    FcontractDateServices : TXSDate;
    FcontragentName : WideString;
    FcontragentAddress : WideString;
    FcontragentAddressWork : WideString;
    FcontragentOkpo : WideString;
    FcontragentBankAccount : WideString;
    FcontragentBankName : WideString;
    FcontragentBankMfo : WideString;
    FcontragentBossName : WideString;
    FcontragentPassport : WideString;
    FcontractServicesSumma : TXSDecimal;
    FcontractServicesPower : TXSDecimal;
    FcommentServicesGen : WideString;
    FcontractServicesDistance : TXSDecimal;
    FcontractServicesDay : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FwarrantDate : TXSDate;
    FwarrantNumber : WideString;
    FwarrantFIO : WideString;
    FregionalType : Integer;
    FbasisType : TXSDecimal;
    FcontragentPosition : WideString;
    FexecuteWorkDate : TXSDate;
    FtimeStart : DateTime; 
    FtimeFinal : DateTime; 
    FcontragentPhoneNumber : WideString;
    FexecutorPhoneNumber : WideString;
    FcontragentObjectWork : WideString;
    FisNoPay : Integer; 
    FisCustomerMaterials : Integer; 
    FpayDate : TXSDate;
    FfinPayFormCode : Integer; 
    FfinPayFormName : WideString;
    FpartnerId : Integer; 
    FpayDetail : WideString;
    FactTransferNumber : WideString;
    FactTransferDate : TXSDate;
    Fresposible : WideString;
    FresposiblePosition : WideString;
    FresposibleTabNumber : WideString;
    FprevContractStatus : Integer;
    FreconnectionTU : Integer;
    FpersonalAccountCode : Integer;
    FpersonalAccountNumber : WideString;
    FtabNumber : WideString;
    FcitiesList : WideString;
    FlineLength : TXSDecimal;
    FprojectCode : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
    FcnPackCode : Integer; 
    FdfPackCode : Integer;
    FcountersZoneType : Integer;
    FprojAgreeSumma : TXSDecimal;
    FtopographySumma : TXSDecimal;
    FcreatedFromSite : Integer;
    FboundaryDateWork : TXSDate;
    FcodeEIC : WideString;
    FpersonalAccountUid : WideString;
    FcustomerMailingAddress : WideString;
    FpowerGeneration : TXSDecimal;
    FpostCode : WideString;
//???
    Fdepartment : ENDepartment;
//???
    Felement : ENElement;
//???
    FcontractStatusRef : ENServicesContractStatusRef;
//???
    FcontractTypeRef : ENServicesContractTypeRef;
//???
    FcontragentTypeRef : ENServicesContragentTypeRef;
//???
    FbillStatusRef : ENServicesBillStatusRef;
//???
    FwarrantRef : ENWarrantRef;
//???
    FstatusRef : ENServicesObjectStatusRef;
//???
    FtechConObjects : ENTechConditionsObjects;
//???
    FcontractKindRef : ENServicesContractKindRef;
//???
    FcnSubsystemTypeRef : CNSubsystemTypeRef;
//???
    FcalcTypeRef : ENServicesObjectCalcTypeRef;
//???
    FgeneralContractRef : ENGeneralContractsRef;
//???
    FactIncomeCreatMetodRef : ENActIncomeCreatMetodRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property name : WideString read Fname write Fname;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property contractNumberServices : WideString read FcontractNumberServices write FcontractNumberServices;
    property contractDateServices : TXSDate read FcontractDateServices write FcontractDateServices;
    property contragentName : WideString read FcontragentName write FcontragentName;
    property contragentAddress : WideString read FcontragentAddress write FcontragentAddress;
    property contragentAddressWork : WideString read FcontragentAddressWork write FcontragentAddressWork;
    property contragentOkpo : WideString read FcontragentOkpo write FcontragentOkpo;
    property contragentBankAccount : WideString read FcontragentBankAccount write FcontragentBankAccount;
    property contragentBankName : WideString read FcontragentBankName write FcontragentBankName;
    property contragentBankMfo : WideString read FcontragentBankMfo write FcontragentBankMfo;
    property contragentBossName : WideString read FcontragentBossName write FcontragentBossName;
    property contragentPassport : WideString read FcontragentPassport write FcontragentPassport;
    property contractServicesSumma : TXSDecimal read FcontractServicesSumma write FcontractServicesSumma; 
    property contractServicesPower : TXSDecimal read FcontractServicesPower write FcontractServicesPower; 
    property commentServicesGen : WideString read FcommentServicesGen write FcommentServicesGen;
    property contractServicesDistance : TXSDecimal read FcontractServicesDistance write FcontractServicesDistance; 
    property contractServicesDay : TXSDecimal read FcontractServicesDay write FcontractServicesDay; 
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property warrantDate : TXSDate read FwarrantDate write FwarrantDate;
    property warrantNumber : WideString read FwarrantNumber write FwarrantNumber;
    property warrantFIO : WideString read FwarrantFIO write FwarrantFIO;
    property regionalType : Integer read FregionalType write FregionalType;
    property basisType : TXSDecimal read FbasisType write FbasisType;
    property contragentPosition : WideString read FcontragentPosition write FcontragentPosition;
    property executeWorkDate : TXSDate read FexecuteWorkDate write FexecuteWorkDate;
    property timeStart : DateTime; 
    property timeFinal : DateTime; 
    property contragentPhoneNumber : WideString read FcontragentPhoneNumber write FcontragentPhoneNumber;
    property executorPhoneNumber : WideString read FexecutorPhoneNumber write FexecutorPhoneNumber;
    property contragentObjectWork : WideString read FcontragentObjectWork write FcontragentObjectWork;
    property  isNoPay : Integer read FisNoPay write FisNoPay; 
    property  isCustomerMaterials : Integer read FisCustomerMaterials write FisCustomerMaterials; 
    property payDate : TXSDate read FpayDate write FpayDate;
    property  finPayFormCode : Integer read FfinPayFormCode write FfinPayFormCode; 
    property finPayFormName : WideString read FfinPayFormName write FfinPayFormName;
    property  partnerId : Integer read FpartnerId write FpartnerId; 
    property payDetail : WideString read FpayDetail write FpayDetail;
    property actTransferNumber : WideString read FactTransferNumber write FactTransferNumber;
    property actTransferDate : TXSDate read FactTransferDate write FactTransferDate;
    property resposible : WideString read Fresposible write Fresposible;
    property resposiblePosition : WideString read FresposiblePosition write FresposiblePosition;
    property resposibleTabNumber : WideString read FresposibleTabNumber write FresposibleTabNumber;
    property  prevContractStatus : Integer read FprevContractStatus write FprevContractStatus;
    property  reconnectionTU : Integer read FreconnectionTU write FreconnectionTU;
    property  personalAccountCode : Integer read FpersonalAccountCode write FpersonalAccountCode;
    property personalAccountNumber : WideString read FpersonalAccountNumber write FpersonalAccountNumber;
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property citiesList : WideString read FcitiesList write FcitiesList;
    property lineLength : TXSDecimal read FlineLength write FlineLength;
    property projectCode : WideString read FprojectCode write FprojectCode;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property  cnPackCode : Integer read FcnPackCode write FcnPackCode; 
   property  dfPackCode : Integer read FdfPackCode write FdfPackCode;
    property  countersZoneType : Integer read FcountersZoneType write FcountersZoneType;
    property projAgreeSumma : TXSDecimal read FprojAgreeSumma write FprojAgreeSumma;
    property topographySumma : TXSDecimal read FtopographySumma write FtopographySumma;
    property  createdFromSite : Integer read FcreatedFromSite write FcreatedFromSite;
    property boundaryDateWork : TXSDate read FboundaryDateWork write FboundaryDateWork;
    property codeEIC : WideString read FcodeEIC write FcodeEIC;
    property personalAccountUid : WideString read FpersonalAccountUid write FpersonalAccountUid;
    property customerMailingAddress : WideString read FcustomerMailingAddress write FcustomerMailingAddress;
    property powerGeneration : TXSDecimal read FpowerGeneration write FpowerGeneration;
    property postCode : WideString read FpostCode write FpostCode;
    property department : ENDepartment read Fdepartment write Fdepartment; 
    property element : ENElement read Felement write Felement; 
    property contractStatusRef : ENServicesContractStatusRef read FcontractStatusRef write FcontractStatusRef; 
    property contractTypeRef : ENServicesContractTypeRef read FcontractTypeRef write FcontractTypeRef; 
    property contragentTypeRef : ENServicesContragentTypeRef read FcontragentTypeRef write FcontragentTypeRef; 
    property billStatusRef : ENServicesBillStatusRef read FbillStatusRef write FbillStatusRef; 
    property warrantRef : ENWarrantRef read FwarrantRef write FwarrantRef;
    property statusRef : ENServicesObjectStatusRef read FstatusRef write FstatusRef; 
    property techConObjects : ENTechConditionsObjects read FtechConObjects write FtechConObjects; 
    property contractKindRef : ENServicesContractKindRef read FcontractKindRef write FcontractKindRef; 
    property cnSubsystemTypeRef : CNSubsystemTypeRef read FcnSubsystemTypeRef write FcnSubsystemTypeRef; 
    property calcTypeRef : ENServicesObjectCalcTypeRef read FcalcTypeRef write FcalcTypeRef;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
    property actIncomeCreatMetodRef : ENActIncomeCreatMetodRef read FactIncomeCreatMetodRef write FactIncomeCreatMetodRef;
  end;
}

  ENServicesObjectFilter = class(ENServicesObject)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENServicesObjectShort = class(TRemotable)
  private
    Fcode : Integer; 
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    Fname : WideString;
    FpartnerCode : WideString;
    FfinDocCode : WideString;
    FfinDocID : Integer; 
    FcommentGen : WideString;
    FcontractNumberServices : WideString;
    FcontractDateServices : TXSDate;	
    FcontragentName : WideString;
    FcontragentAddress : WideString;
    FcontragentAddressWork : WideString;
    FcontragentOkpo : WideString;
    FcontragentBankAccount : WideString;
    FcontragentBankName : WideString;
    FcontragentBankMfo : WideString;
    FcontragentBossName : WideString;
    FcontragentPassport : WideString;
    FcontractServicesSumma : TXSDecimal;
    FcontractServicesSummaVAT : TXSDecimal;
    FcontractServicesPower : TXSDecimal;
    FcommentServicesGen : WideString;
    FcontractServicesDistance : TXSDecimal;
    FcontractServicesDay : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDate;	
    FwarrantDate : TXSDate;	
    FwarrantNumber : WideString;
    FwarrantFIO : WideString;
    FregionalType : Integer;
    FbasisType : TXSDecimal;
    FcontragentPosition : WideString;
    FexecuteWorkDate : TXSDate;	
    FtimeStart : TXSDateTime;
    FtimeFinal : TXSDateTime;
    FcontragentPhoneNumber : WideString;
    FexecutorPhoneNumber : WideString;
    FcontragentObjectWork : WideString;
 
    FisCustomerMaterials : Integer; 
    FpayDate : TXSDate;	
    FfinPayFormCode : Integer; 
    FfinPayFormName : WideString;
    FpartnerId : Integer; 
    FpayDetail : WideString;
    FactTransferNumber : WideString;
    FactTransferDate : TXSDate;	
    Fresposible : WideString;
    FresposiblePosition : WideString;
    FresposibleTabNumber : WideString;
    FprevContractStatus : Integer;
    FreconnectionTU : Integer;
    FpersonalAccountCode : Integer;
    FpersonalAccountNumber : WideString;
    FtabNumber : WideString;
    FcitiesList : WideString;
    FlineLength : TXSDecimal;
    FprojectCode : WideString;
    FcnPackCode : Integer; 
    FdfPackCode : Integer;
    FcountersZoneType : Integer;
    FprojAgreeSumma : TXSDecimal;
    FtopographySumma : TXSDecimal;
    FcreatedFromSite : Integer;
    Fcountdaydelay : Integer;
    Fterm : Integer;
    Fregulation : Integer;
    FboundaryDateWork : TXSDate;
    FcodeEIC : WideString;
    FpersonalAccountUid : WideString;
    FcustomerMailingAddress : WideString;
    FpowerGeneration : TXSDecimal;
    FpostCode : WideString;
    FcustomerEmail : WideString;
    FdemographicCode : WideString;
    FownershipRecordNumber : WideString;
    FrealEstateRegNumber : WideString;
    FdepartmentCode : Integer; 
    FdepartmentShortName : WideString;
    FdepartmentDateStart : TXSDate;
    FdepartmentDateFinal : TXSDate;
    FdepartmentRenCode : Integer; 
    FdepartmentShpzBalans : WideString;
    FdepartmentKau_table_id_1884 : Integer; 
    FdepartmentKau_1884 : WideString;
    FdepartmentName_1884 : WideString;
    FelementCode : Integer; 
    FcontractStatusRefCode : Integer; 
    FcontractStatusRefName : WideString;
    FcontractTypeRefCode : Integer; 
    FcontractTypeRefName : WideString;
    FcontragentTypeRefCode : Integer; 
    FcontragentTypeRefName : WideString;
    FbillStatusRefCode : Integer; 
    FbillStatusRefName : WideString;
    FwarrantRefCode : Integer; 
    FwarrantRefNumbergen : WideString;
    FwarrantRefName : WideString;
    FwarrantRefWarrantFIO : WideString;
    FwarrantRefWarrantShortFIO : WideString;
    FwarrantRefWarrantPosition : WideString;
    FwarrantRefGenitiveFIO : WideString;
    FwarrantRefGenitivePosition : WideString;
    FwarrantRefPassport : WideString;
    FwarrantRefAddress : WideString;
    FwarrantRefPower : Integer;
    FwarrantRefMaxSum : TXSDecimal;
    FstatusRefCode : Integer; 
    FstatusRefName : WideString;
    /// 04.11.11 NET-747 Поля, необходимые для экспорта заявки в Аксапту
    FcontractRegDate : TXSDate;   // Дата регистрации договора
    FcontractStartDate : TXSDate; // Дата начала действия договора
    ///
    FisNoPay : Integer;  // NET-2344
    FtechConObjectsCode : Integer;
    FtechConObjectsNumberGen : WideString;
    FtechConObjectsDateGen : TXSDate;
    FtechConObjectsCustomer : WideString;
    FtechConObjectsBuilding : WideString;
    FtechConObjectsAddress : WideString;
    FtechConObjectsTyCurrentPower : TXSDecimal;
    FtechConObjectsTyServicesPower : TXSDecimal;
    FtechConObjectsConnectionPowerPlaces : WideString;
    FtechConObjectsConnectionPowerPoint : WideString;
    FtechConObjectsUserGen : WideString;
    FtechConObjectsDateEdit : TXSDate;
    FcontractKindRefCode : Integer; 
    FcontractKindRefName : WideString;
    FcnSubsystemTypeRefCode : Integer; 
    FcnSubsystemTypeRefName : WideString;
    FcalcTypeRefCode : Integer;
		FcalcTypeRefName : WideString;
		FpaySum : TXSDecimal;
		FdohodSum : TXSDecimal;
    FisRed : Integer;
    FisYellow : Integer;
    Factnames : WideString;
    Fprov_exist : WideString;
    Fnode_exist : WideString;
    FnodeCount : Integer;

    FactIncomeCreatMetodRefCode : Integer;
    FactIncomeCreatMetodRefName : WideString;
    FcontractSumma : TXSDecimal;
    Fsum_by_act : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property name : WideString read Fname write Fname;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property contractNumberServices : WideString read FcontractNumberServices write FcontractNumberServices;
    property contractDateServices : TXSDate read FcontractDateServices write FcontractDateServices;
    property contragentName : WideString read FcontragentName write FcontragentName;
    property contragentAddress : WideString read FcontragentAddress write FcontragentAddress;
    property contragentAddressWork : WideString read FcontragentAddressWork write FcontragentAddressWork;
    property contragentOkpo : WideString read FcontragentOkpo write FcontragentOkpo;
    property contragentBankAccount : WideString read FcontragentBankAccount write FcontragentBankAccount;
    property contragentBankName : WideString read FcontragentBankName write FcontragentBankName;
    property contragentBankMfo : WideString read FcontragentBankMfo write FcontragentBankMfo;
    property contragentBossName : WideString read FcontragentBossName write FcontragentBossName;
    property contragentPassport : WideString read FcontragentPassport write FcontragentPassport;
    property contractServicesSumma : TXSDecimal read FcontractServicesSumma write FcontractServicesSumma; 
   property contractServicesSummaVAT : TXSDecimal read FcontractServicesSummaVAT write FcontractServicesSummaVAT;
    property contractServicesPower : TXSDecimal read FcontractServicesPower write FcontractServicesPower; 
    property commentServicesGen : WideString read FcommentServicesGen write FcommentServicesGen;
    property contractServicesDistance : TXSDecimal read FcontractServicesDistance write FcontractServicesDistance; 
    property contractServicesDay : TXSDecimal read FcontractServicesDay write FcontractServicesDay; 
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property warrantDate : TXSDate read FwarrantDate write FwarrantDate;
    property warrantNumber : WideString read FwarrantNumber write FwarrantNumber;
    property warrantFIO : WideString read FwarrantFIO write FwarrantFIO;
    property regionalType : Integer read FregionalType write FregionalType;
    property basisType : TXSDecimal read FbasisType write FbasisType;
    property contragentPosition : WideString read FcontragentPosition write FcontragentPosition;
    property executeWorkDate : TXSDate read FexecuteWorkDate write FexecuteWorkDate;
    property timeStart : TXSDateTime read FtimeStart write FtimeStart;	
    property timeFinal : TXSDateTime read FtimeFinal write FtimeFinal;	
    property contragentPhoneNumber : WideString read FcontragentPhoneNumber write FcontragentPhoneNumber;
    property executorPhoneNumber : WideString read FexecutorPhoneNumber write FexecutorPhoneNumber;
    property contragentObjectWork : WideString read FcontragentObjectWork write FcontragentObjectWork;
    property  isCustomerMaterials : Integer read FisCustomerMaterials write FisCustomerMaterials; 
    property payDate : TXSDate read FpayDate write FpayDate;
    property finPayFormCode : Integer read FfinPayFormCode write FfinPayFormCode; 
    property finPayFormName : WideString read FfinPayFormName write FfinPayFormName;
    property partnerId : Integer read FpartnerId write FpartnerId; 
    property payDetail : WideString read FpayDetail write FpayDetail;
    property actTransferNumber : WideString read FactTransferNumber write FactTransferNumber;
    property actTransferDate : TXSDate read FactTransferDate write FactTransferDate;
    property resposible : WideString read Fresposible write Fresposible;
    property resposiblePosition : WideString read FresposiblePosition write FresposiblePosition;
    property resposibleTabNumber : WideString read FresposibleTabNumber write FresposibleTabNumber;
    property  prevContractStatus : Integer read FprevContractStatus write FprevContractStatus;
    property  reconnectionTU : Integer read FreconnectionTU write FreconnectionTU;
    property  personalAccountCode : Integer read FpersonalAccountCode write FpersonalAccountCode;
    property personalAccountNumber : WideString read FpersonalAccountNumber write FpersonalAccountNumber;
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property citiesList : WideString read FcitiesList write FcitiesList;
    property lineLength : TXSDecimal read FlineLength write FlineLength;
    property projectCode : WideString read FprojectCode write FprojectCode;
    property  cnPackCode : Integer read FcnPackCode write FcnPackCode; 
    property  dfPackCode : Integer read FdfPackCode write FdfPackCode;
    property  countersZoneType : Integer read FcountersZoneType write FcountersZoneType;
    property projAgreeSumma : TXSDecimal read FprojAgreeSumma write FprojAgreeSumma;
    property topographySumma : TXSDecimal read FtopographySumma write FtopographySumma;
    property createdFromSite : Integer read FcreatedFromSite write FcreatedFromSite;
    property countdaydelay : Integer read Fcountdaydelay write Fcountdaydelay;
    property term : Integer read  Fterm write Fterm;
    property regulation : Integer read Fregulation write Fregulation;
    property boundaryDateWork : TXSDate read FboundaryDateWork write FboundaryDateWork;
    property codeEIC : WideString read FcodeEIC write FcodeEIC;
    property personalAccountUid : WideString read FpersonalAccountUid write FpersonalAccountUid;
    property customerMailingAddress : WideString read FcustomerMailingAddress write FcustomerMailingAddress;
    property powerGeneration : TXSDecimal read FpowerGeneration write FpowerGeneration;
    property postCode : WideString read FpostCode write FpostCode;
    property customerEmail : WideString read FcustomerEmail write FcustomerEmail;
    property demographicCode : WideString read FdemographicCode write FdemographicCode;
    property ownershipRecordNumber : WideString read FownershipRecordNumber write FownershipRecordNumber;
    property realEstateRegNumber : WideString read FrealEstateRegNumber write FrealEstateRegNumber;

    property departmentCode : Integer read FdepartmentCode write FdepartmentCode; 
    property departmentShortName : WideString read FdepartmentShortName write FdepartmentShortName; 
    property departmentDateStart : TXSDate read FdepartmentDateStart write FdepartmentDateStart; 
    property departmentDateFinal : TXSDate read FdepartmentDateFinal write FdepartmentDateFinal; 
    property departmentRenCode : Integer read FdepartmentRenCode write FdepartmentRenCode; 
    property departmentShpzBalans : WideString read FdepartmentShpzBalans write FdepartmentShpzBalans; 
    property departmentKau_table_id_1884 : Integer read FdepartmentKau_table_id_1884 write FdepartmentKau_table_id_1884; 
    property departmentKau_1884 : WideString read FdepartmentKau_1884 write FdepartmentKau_1884; 
    property departmentName_1884 : WideString read FdepartmentName_1884 write FdepartmentName_1884; 
    property elementCode : Integer read FelementCode write FelementCode; 
    property contractStatusRefCode : Integer read FcontractStatusRefCode write FcontractStatusRefCode; 
    property contractStatusRefName : WideString read FcontractStatusRefName write FcontractStatusRefName; 
    property contractTypeRefCode : Integer read FcontractTypeRefCode write FcontractTypeRefCode; 
    property contractTypeRefName : WideString read FcontractTypeRefName write FcontractTypeRefName; 
    property contragentTypeRefCode : Integer read FcontragentTypeRefCode write FcontragentTypeRefCode; 
    property contragentTypeRefName : WideString read FcontragentTypeRefName write FcontragentTypeRefName; 
    property billStatusRefCode : Integer read FbillStatusRefCode write FbillStatusRefCode; 
    property billStatusRefName : WideString read FbillStatusRefName write FbillStatusRefName; 

    property warrantRefCode : Integer read FwarrantRefCode write FwarrantRefCode; 
    property warrantRefNumbergen : WideString read FwarrantRefNumbergen write FwarrantRefNumbergen; 
    property warrantRefName : WideString read FwarrantRefName write FwarrantRefName; 
    property warrantRefWarrantFIO : WideString read FwarrantRefWarrantFIO write FwarrantRefWarrantFIO; 
    property warrantRefWarrantShortFIO : WideString read FwarrantRefWarrantShortFIO write FwarrantRefWarrantShortFIO; 
    property warrantRefWarrantPosition : WideString read FwarrantRefWarrantPosition write FwarrantRefWarrantPosition; 
    property warrantRefGenitiveFIO : WideString read FwarrantRefGenitiveFIO write FwarrantRefGenitiveFIO; 
    property warrantRefGenitivePosition : WideString read FwarrantRefGenitivePosition write FwarrantRefGenitivePosition; 
    property warrantRefPassport : WideString read FwarrantRefPassport write FwarrantRefPassport; 
    property warrantRefAddress : WideString read FwarrantRefAddress write FwarrantRefAddress; 
    property warrantRefPower : Integer read FwarrantRefPower write FwarrantRefPower; 
    property warrantRefMaxSum : TXSDecimal read FwarrantRefMaxSum write FwarrantRefMaxSum;

    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode; 
    property statusRefName : WideString read FstatusRefName write FstatusRefName;

    /// 04.11.11 NET-747 Поля, необходимые для экспорта заявки в Аксапту
    property contractRegDate : TXSDate read FcontractRegDate write FcontractRegDate; // Дата регистрации договора
    property contractStartDate : TXSDate read FcontractStartDate write FcontractStartDate; // Дата начала действия договора
    ///
    property isNoPay : Integer read FisNoPay write FisNoPay;  // NET-2344
    property techConObjectsCode : Integer read FtechConObjectsCode write FtechConObjectsCode; 
    property techConObjectsNumberGen : WideString read FtechConObjectsNumberGen write FtechConObjectsNumberGen; 
    property techConObjectsDateGen : TXSDate read FtechConObjectsDateGen write FtechConObjectsDateGen; 
    property techConObjectsCustomer : WideString read FtechConObjectsCustomer write FtechConObjectsCustomer; 
    property techConObjectsBuilding : WideString read FtechConObjectsBuilding write FtechConObjectsBuilding; 
    property techConObjectsAddress : WideString read FtechConObjectsAddress write FtechConObjectsAddress; 
    property techConObjectsTyCurrentPower : TXSDecimal read FtechConObjectsTyCurrentPower write FtechConObjectsTyCurrentPower; 
    property techConObjectsTyServicesPower : TXSDecimal read FtechConObjectsTyServicesPower write FtechConObjectsTyServicesPower; 
    property techConObjectsConnectionPowerPlaces : WideString read FtechConObjectsConnectionPowerPlaces write FtechConObjectsConnectionPowerPlaces; 
    property techConObjectsConnectionPowerPoint : WideString read FtechConObjectsConnectionPowerPoint write FtechConObjectsConnectionPowerPoint; 
    property techConObjectsUserGen : WideString read FtechConObjectsUserGen write FtechConObjectsUserGen; 
    property techConObjectsDateEdit : TXSDate read FtechConObjectsDateEdit write FtechConObjectsDateEdit; 
    property contractKindRefCode : Integer read FcontractKindRefCode write FcontractKindRefCode; 
    property contractKindRefName : WideString read FcontractKindRefName write FcontractKindRefName; 
    property cnSubsystemTypeRefCode : Integer read FcnSubsystemTypeRefCode write FcnSubsystemTypeRefCode; 
    property cnSubsystemTypeRefName : WideString read FcnSubsystemTypeRefName write FcnSubsystemTypeRefName; 
    property calcTypeRefCode : Integer read FcalcTypeRefCode write FcalcTypeRefCode;
		property calcTypeRefName : WideString read FcalcTypeRefName write FcalcTypeRefName;
		property paySum : TXSDecimal read FpaySum write FpaySum;
		property dohodSum : TXSDecimal read FdohodSum write FdohodSum;
    property isRed : Integer read FisRed  write FisRed;
    property isYellow : Integer read FisYellow write FisYellow;
    property actnames : WideString read Factnames write Factnames;
    property prov_exist : WideString read Fprov_exist write Fprov_exist;
    property node_exist : WideString read Fnode_exist write Fnode_exist;
    property nodeCount : Integer read FnodeCount write FnodeCount;

    property actIncomeCreatMetodRefCode : Integer read FactIncomeCreatMetodRefCode write FactIncomeCreatMetodRefCode;
    property actIncomeCreatMetodRefName : WideString read FactIncomeCreatMetodRefName write FactIncomeCreatMetodRefName;
    property contractSumma : TXSDecimal read FcontractSumma write FcontractSumma;
    property sum_by_act : TXSDecimal read Fsum_by_act write Fsum_by_act;
  end;

  ArrayOfENServicesObjectShort = array of ENServicesObjectShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENServicesObjectShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENServicesObjectShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENServicesObjectShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENServicesObjectController/message/
  // soapAction: http://ksoe.org/ENServicesObjectController/action/ENServicesObjectController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENServicesObjectControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENServicesObjectController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENServicesObjectControllerSoapPort = interface(IInvokable)
  ['{5F39922C-C130-4737-BA00-35D2F9747C72}']
    function  add(const aENServicesObject: ENServicesObject): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENServicesObject: ENServicesObject); stdcall;    
    procedure updateContractStatus(const servObjCode: Integer; const contractStatusCode: Integer); stdcall; //Изменение статуса услуги
	    procedure updateCounterZonesType(const servicesObject : ENServicesObject); stdcall; 
    function  getObject(const anObjectCode: Integer): ENServicesObject; stdcall;
    function getShortObject(const anObjectCode: Integer): ENServicesObjectShort; stdcall;
    function  getList: ENServicesObjectShortList; stdcall;
    function  getFilteredList(const aENServicesObjectFilter: ENServicesObjectFilter): ENServicesObjectShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENServicesObjectShortList; stdcall;

    function getScrollableFilteredList(
      const aENServicesObjectFilter: ENServicesObjectFilter;
      const aFromPosition: Integer;
      const aQuantity: Integer): ENServicesObjectShortList; stdcall;

    function getEasyShortList(
      const aENServicesObjectFilter: ENServicesObjectFilter;
      const aFromPosition: Integer;
      const aQuantity: Integer): ENServicesObjectShortList; stdcall;

    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENServicesObjectShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENServicesObjectFilter: ENServicesObjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function  getContractList(const aENServicesObjectFilter: ENServicesObjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ENServicesObjectShortList; overload; stdcall;
    function  getContractList(const aENServicesObjectFilter: ENServicesObjectFilter; const aFromPosition: Integer; const aQuantity: Integer; const aUseMDaxData: Boolean; const aIsFromFK: Boolean; const aIsShowChild: Boolean ): ENServicesObjectShortList; overload; stdcall;

    function  addForCalculation(const aENServicesObject: ENServicesObject): Integer; overload; stdcall;
    procedure saveForCalculation(const aENServicesObject: ENServicesObject; const aENTechConditionsServices: ENTechConditionsServices); overload; stdcall;
    procedure saveForCalculation(const aENServicesObject: ENServicesObject); overload; stdcall;
    procedure saveForCalculation(
      const aENServicesObject: ENServicesObject;
      const aENTechConditionsServices: ENTechConditionsServices;
      const aENCalc2ConnectTariffObj: ENCalc2ConnectTariff); overload; stdcall;

    //** +++ cottageCode, startDate, endDate, tabNumber   */
    function addForCalculation(const aENServicesObject: ENServicesObject;
         const cottageCode : Integer;
         const startDate : TXSDate;
         const endDate : TXSDate;
         const tabNumber : String;
         const FIO : String): Integer; overload; stdcall;


    procedure canceled(const code : Integer); stdcall;

    procedure budgetApproved(const code : Integer; const planCode : Integer); stdcall;
    procedure unBudgetApproved(const code : Integer); stdcall;

    function signed(const code : Integer): Integer; overload; stdcall;
    function signed(const code : Integer; priconnections: boolean; isClient: boolean): Integer; overload; stdcall;
    procedure signedPriconnections(const code : Integer); stdcall;
    procedure unSigned(const code : Integer); stdcall;
    procedure unSignedPriconnections(const code : Integer); stdcall;

    procedure paid(const code : Integer); overload; stdcall;
    procedure paid(const svoCode: Integer; const priconnections: Boolean; const isClient: Boolean); overload; stdcall;
    procedure unPaid(const code: Integer); overload; stdcall;
    procedure unPaid(const svoCode: Integer; const priconnections: Boolean; const isClient: Boolean); overload; stdcall;

    procedure prepaid(const code : Integer); overload; stdcall;
    procedure prepaid(const svoCode: Integer; const priconnections: Boolean; const isClient: Boolean); overload; stdcall;
    procedure unPrepaid(const code : Integer); overload; stdcall;
    procedure unPrepaid(const svoCode: Integer; const priconnections: Boolean; const isClient: Boolean); overload; stdcall;

    function finishWorks(const code : Integer): Integer; overload; stdcall;
    function finishWorks(const code: Integer; const notFinishWorks: Boolean;
    		const forcedRecalcServicesFact: Boolean; const validateProfitability: Boolean): Integer; overload; stdcall;

    // procedure unFinishWorks(const code : Integer); stdcall;
    procedure undoFinishWorks(const code : Integer); stdcall;

    function closePlanWorkForCalculation(planCode: Integer): Integer; stdcall;

    ///// Методы для передачи проводок в Финансы
    //function createPostings(servicesObjectCode: Integer): FKProvResult; stdcall;
    //procedure deletePostings(servicesObjectCode: Integer); stdcall;
    function getPostingsList(servicesObjectCode: Integer): FKProvObjectShortList; stdcall;

    function moveToFK(servicesObjectCode: Integer; actIncomeServicesCode: Integer): FKProvResult; stdcall; overload;
    // SUPP-7343... 25.09.2013 +++ для услуг добавлена дата проведения (передачи проводок)
    function moveToFK(servicesObjectCode: Integer;  datePosting : TXSDate; actIncomeServicesCode: Integer): FKProvResult; stdcall; overload;

    procedure checkMoveToFK(const aServicesObjectCode: Integer); stdcall;
    function moveToFKCheckOnly(const aServicesObjectCode: Integer): FKProvResult; stdcall;

    // Получить дату проведения по коду договора
    function getDatePostingsByServicesCode(const soCodes : Integer): TXSDate; stdcall;
    procedure deleteFromFK(servicesObjectCode: Integer; actIncomeServicesCode: Integer); stdcall;
    /////

    function addForSale(const aENServicesObject: ENServicesObject): Integer; stdcall;
    procedure saveForSale(const aENServicesObject: ENServicesObject); stdcall;

    procedure updateActTransfer(const servicesObjectCode: Integer; const actTransferNumber: WideString; const actTransferDate: TXSDate); stdcall; overload;
    procedure moveActTransferToFK(const servicesObjectCode: Integer); stdcall; overload;
    procedure unMoveActTransferToFK(const servicesObjectCode: Integer); stdcall; overload;
	
	// Новые методы для работы с материалами заказчика
	
	/// Метод для добавления, редактирования и удаления материалов заказчика
	/// 1 если isPersist = true, то будет выполняться процедура добавления / изменения объекта
	/// 2 если isPersist = false, то выполняется процедура удаления
	procedure updateActTransfer(const servicesObjectCode : Integer; const fkOrder : RQFKOrder; isPersist : Boolean); stdcall; overload;
	procedure moveActTransferToFK(const fkOrder : RQFKOrder); stdcall; overload;
	procedure unMoveActTransferToFK(const fkOrder : RQFKOrder); stdcall; overload;
	

    //  Метод для проверки количества счетчиков в Услугах (метрология)
    //  при работах, в которых обязательна передача счетчика абонентом 
    procedure checkGiveCounters(const servicesObjectCode : Integer); stdcall;

    // подписание акта приема-передачи счетчиков для работ Метрологии
    procedure actSigned(const code : Integer); stdcall;
    // отмена подписания акта приема-передачи счетчиков для работ Метрологии
    procedure actUnSigned(const code : Integer); stdcall;

    // создание договора о Присоединении по пакету из EnergyWorkFlow
    function addServicesObjectByCnPack(const pack : CNPack; const distance : TXSDecimal): Integer; overload; stdcall;

    //создание договора о Присоединении по пакету из EnergyWorkFlow с указанием, создавать ли новый пакет
    function addServicesObjectByCnPack(const pack : CNPack; const distance : TXSDecimal; const isNewPack: Boolean): Integer; overload;  stdcall;

    // Содержаться ли пломбы в работах заданной классификации
    function  isContainsKSU(const classificationTypeCode: Integer): Boolean; stdcall;
	    // Есть ли в договоре калькуляции по которым абонент передает счетчик на баланс в облэнерго
    function  isGiveCounterOnBalanceByServicesObjectCode(const servicesObjectCode: Integer): Boolean; stdcall;

		{Завершение договора услуг на сторону EnergyNet о Присоединении по коду
    пакета и подсистемы EnergyWorkFlow. Возвращает код догвора услуг на сторону
    EnergyNet о Присоединении в случае успешного завершения,
    0 - если есть не проведённые в Финансовой Коллекции акты к данному договору,
    -1 - если не найдено соответствующего пакету EnergyWorkFlow договор о
    Присоединении EnergyNet,
    -101 - Бухгалтерский статус договора услуг на сторону EnergyNet
    о Присоединении "Черновой",
    -103 - Бухгалтерский статус договора услуг на сторону EnergyNet
    о Присоединении "Материалы заказчика оприходовано",
    -1000 - Не определён бухгалтерский статус договора услуг на сторону
    EnergyNet о Присоединении}
    function completeServicesObjectByCnPack(const packID: Integer;
      const ssID: Integer): Integer; stdcall;

    {Копирование разорванного договора услуг на сторону о Присоединении при
    движении пакета EnergyWorkFlow подсистемы ПРИСОЕДИНЕНИЕ с 01.03.2013}
    function copyTerminatedServiceObjectByCNPack(const packID: Integer;
      const subsystemID: Integer): Integer; stdcall;

	  // Создание договора услуг на сторону о Подготовке Технических Условий
	  // на базе закрытого договора Присоединения
	  function copyTechTermsPrepareServiceObjectByCNPack(const packID: Integer;
      const subsystemID: Integer): Integer; stdcall; overload;
	  function copyTechTermsPrepareServiceObjectByCNPack(
      const packID: Integer; const subsystemID: Integer;
      const soCodeOld: Integer; const distance: TXSDecimal): Integer; stdcall; overload;

    function copyTechTermsPrepareServiceObject(const soCodeOld: Integer; const distance: TXSDecimal): Integer; stdcall;

    // перевод договора в статус "Відмова замовника від послуг"
		procedure disclaimerCustomerServices(const objCode : Integer); stdcall;

    // перевод бухгалтерского статуса в "Проведеный согласной бух справке"
    procedure changeBuhStatusToClosedByBuh(const servicesObjectCode : Integer); stdcall;

		// закрываем договор 
		procedure closeContract(const code : Integer); stdcall;
		// отмена закрытия договора
		procedure unCloseContract(const code : Integer); stdcall;

    //  /** Получить данные о лицевом счете из биллинга */
    function getPersonalAccountInfo(
        const personalAccountNumber: String;
        const departmentCode: Integer;
        const isByt: Boolean) : PersonalServicesInfo; stdcall; overload;
    function getPersonalAccountInfo(
        const personalAccountNumber: String;
        const recordPointUid: String;
        const departmentCode: Integer;
        const isByt: Boolean) : PersonalServicesInfo; stdcall; overload;

    // Проверить - является ли тип работы - повторным подключением
    function checkWorks(const servicesCode: Integer) : Boolean; stdcall;

    // меняет договор фин на услуге
    procedure changeContractFin(const aENServicesObject: ENServicesObject); overload; stdcall;
	
    // достать лист всех партнеров по уникальному значению договора
    function getListOfPartnersForAgree(const aObject: ENServicesObject; const aOffSet: Integer; const aLimit: Integer): ArrayOfSpravPartner; stdcall;
    // проверить код партнера, что он существует еще для договора в ФК
    function checkPartnersCode(const aObject: ENServicesObject) : Boolean; stdcall;
    // Обновление информации по партнеру для договора из ФК
    procedure refreshPartnerInfo(aObject: ENServicesObject); stdcall;

    // Изменение привязки к лицевому счету на договоре
    procedure updatePersonalAccount(
        const aServicesObjectCode: Integer;
        const aPersonalAccountCode: Integer;
        const aPersonalAccountNumber: String;
        const EIC: String;
        const personalAccountUid: String); stdcall;

    // Связывание двух сущностей ENServicesObject
    procedure changeLinkBetweenServices(const anObject: ENElement2ENElement); stdcall;

    function  addForShiftLines(const aENServicesObject: ENServicesObject): Integer; stdcall;

    procedure autoCreateFkOrderMoveCounterForServices(const aKod_inv: String ; const aContractnumberservices:String   );stdcall;

    function getAgreeCode(const aDivId: Integer): String; stdcall;

    function addAgree(const aFinContract: FINContracts; const aPartner_rschet_id: Integer): Integer; stdcall;
    procedure addAgreePartnerLink(const anAgree_id: Integer; const aPartner_id: Integer;
                                  const aPartner_status: String; const aPartner_rschet_id: Integer); stdcall;

	//
      procedure bindCounterToServicesObject(const invNumber : String; const so : ENServicesObject; const ignorePrice : boolean; const isBinding : boolean); stdcall; overload;
    procedure bindCounterToServicesObject(const invNumber : String; const so : ENServicesObject; const ignorePrice : boolean; const isBinding : boolean; const molCode : String); stdcall; overload;

    // Проверка принадлежности плана к услуге для договоров подряда на выполнение ПКД...
    function checkServicesProject(const elementCode: Integer) : Boolean; stdcall;

    // Изменение метода формирования доходного акта
    procedure changeActIncomeCreatMetod(const soCode: Integer; const creatMetodCode: Integer); stdcall;

    function registerInDocFlow(const aServicesObjectCode: Integer): Integer; stdcall;

    function generatePassportForRecordPoint(const renCode: Integer; const eic: String; const employee: Integer;
                                            const isByt: Boolean): WideString; stdcall; overload;
    function generatePassportForRecordPoint(const renCode: Integer; const eic: String; const employee: Integer;
                                            const isByt: Boolean; const isWithSignature: Boolean): WideString; stdcall; overload;

    // NET-4752 Привязка или отвязка ордера к/от договора
    procedure linkWithRQFKOrder(const aServicesObjectCode : Integer; const aRQFKOrderCode : Integer; const isLink : TXSBoolean); stdcall;

    // изменение типа присоединения
    procedure changeConnectionKind(const servicesObjectCode : Integer; const connectionKindCode : Integer); stdcall;
    // изменение адреса
    procedure changeAddress(const soObj: ENServicesObject); stdcall;

    function getConnectionKind(const servicesObjectCode: Integer): Integer; stdcall;
    procedure updateIsRealizedCCtower2jlc(const servicesObjectCode: Integer; const isRealized: Integer); stdcall;

    procedure recalcENSheets4SODaysCount(const servicesObjectCode: Integer); stdcall;

    function getServicesObjectCodeForSupplier(const supplierCode: Integer): Integer; stdcall;

    function addBindSOCalculationToSOConnection(const soElementCalculationCode: Integer; const soElementConnectionCode: Integer) : Integer; stdcall;
    procedure removeBindSOCalculationToSOConnection(const soElementCalculationCode: Integer; const soElementConnectionCode: Integer); stdcall;

    function getLandSheetDelayForServicesObject(const servicesObjectCode: Integer): Integer; stdcall;
  end;


implementation

  destructor ENServicesObject.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FcontractDateServices) then
      contractDateServices.Free;
    if Assigned(FcontractServicesSumma) then
      contractServicesSumma.Free;
    if Assigned(FcontractServicesPower) then
      contractServicesPower.Free;
    if Assigned(FcontractServicesDistance) then
      contractServicesDistance.Free;
    if Assigned(FcontractServicesDay) then
      contractServicesDay.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FwarrantDate) then
      warrantDate.Free;
    if Assigned(FbasisType) then
      basisType.Free;
    if Assigned(FexecuteWorkDate) then
      executeWorkDate.Free;
    if Assigned(FtimeStart) then
      timeStart.Free;
    if Assigned(FtimeFinal) then
      timeFinal.Free;
    if Assigned(FpayDate) then
      payDate.Free;
    if Assigned(FactTransferDate) then
      actTransferDate.Free;
    if Assigned(FlineLength) then
      lineLength.Free;
    if Assigned(FpowerGeneration) then
      powerGeneration.Free;
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FcontractStatusRef) then
      contractStatusRef.Free;
    if Assigned(FcontractTypeRef) then
      contractTypeRef.Free;
    if Assigned(FcontragentTypeRef) then
      contragentTypeRef.Free;
    if Assigned(FbillStatusRef) then
      billStatusRef.Free;
    if Assigned(FwarrantRef) then
      warrantRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FtechConObjects) then
      techConObjects.Free;
    if Assigned(FcontractKindRef) then
      contractKindRef.Free;
    if Assigned(FcnSubsystemTypeRef) then
      cnSubsystemTypeRef.Free;
    if Assigned(Ftension_point) then
      tension_point.Free;
    if Assigned(FcalcTypeRef) then
      calcTypeRef.Free;
    if Assigned(FgeneralContractRef) then
      generalContractRef.Free;
    if Assigned(FactIncomeCreatMetodRef) then
      actIncomeCreatMetodRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENServicesObjectFilter.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FcontractDateServices) then
      contractDateServices.Free;
    if Assigned(FcontractServicesSumma) then
      contractServicesSumma.Free;
    if Assigned(FcontractServicesPower) then
      contractServicesPower.Free;
    if Assigned(FcontractServicesDistance) then
      contractServicesDistance.Free;
    if Assigned(FcontractServicesDay) then
      contractServicesDay.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FwarrantDate) then
      warrantDate.Free;
    if Assigned(FbasisType) then
      basisType.Free;
    if Assigned(FexecuteWorkDate) then
      executeWorkDate.Free;
    if Assigned(FtimeStart) then
      timeStart.Free;
    if Assigned(FtimeFinal) then
      timeFinal.Free;
    if Assigned(FpayDate) then
      payDate.Free;
    if Assigned(FactTransferDate) then
      actTransferDate.Free;
if Assigned(FboundaryDateWork) then
      boundaryDateWork.Free;
    if Assigned(FpowerGeneration) then
      powerGeneration.Free;
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FcontractStatusRef) then
      contractStatusRef.Free;
    if Assigned(FcontractTypeRef) then
      contractTypeRef.Free;
    if Assigned(FcontragentTypeRef) then
      contragentTypeRef.Free;
    if Assigned(FbillStatusRef) then
      billStatusRef.Free;
    if Assigned(FwarrantRef) then
      warrantRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FtechConObjects) then
      techConObjects.Free;
    if Assigned(FcontractKindRef) then
      contractKindRef.Free;
    if Assigned(FcnSubsystemTypeRef) then
      cnSubsystemTypeRef.Free;
    if Assigned(FcalcTypeRef) then
      calcTypeRef.Free;
    if Assigned(FgeneralContractRef) then
      generalContractRef.Free;
    if Assigned(FactIncomeCreatMetodRef) then
      actIncomeCreatMetodRef.Free;
    inherited Destroy;
  end; 
}
  destructor SpravPartner.Destroy;
  begin
    inherited Destroy;
  end; 
  
  destructor ENServicesObjectFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENServicesObjectShort.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FcontractDateServices) then
      contractDateServices.Free;
    if Assigned(FcontractServicesSumma) then
      contractServicesSumma.Free;
    if Assigned(FcontractServicesPower) then
      contractServicesPower.Free;
    if Assigned(FcontractServicesDistance) then
      contractServicesDistance.Free;
    if Assigned(FcontractServicesDay) then
      contractServicesDay.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FwarrantDate) then
      warrantDate.Free;
    if Assigned(FbasisType) then
      basisType.Free;
    if Assigned(FexecuteWorkDate) then
      executeWorkDate.Free;
    if Assigned(FtimeStart) then
      timeStart.Free;
    if Assigned(FtimeFinal) then
      timeFinal.Free;
    if Assigned(FpayDate) then
      payDate.Free;
    if Assigned(FactTransferDate) then
      actTransferDate.Free;
    if Assigned(FlineLength) then
      lineLength.Free;
if Assigned(FboundaryDateWork) then
      boundaryDateWork.Free;
    if Assigned(FpowerGeneration) then
      powerGeneration.Free;
    if Assigned(FdepartmentDateStart) then
      departmentDateStart.Free;
    if Assigned(FdepartmentDateFinal) then
      departmentDateFinal.Free;
    if Assigned(FwarrantRefMaxSum) then
      warrantRefMaxSum.Free;
    if Assigned(FtechConObjectsDateGen) then
      techConObjectsDateGen.Free;
    if Assigned(FtechConObjectsTyCurrentPower) then
      techConObjectsTyCurrentPower.Free;
    if Assigned(FtechConObjectsTyServicesPower) then
      techConObjectsTyServicesPower.Free;
    if Assigned(FtechConObjectsDateEdit) then
      techConObjectsDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENServicesObjectShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENServicesObject, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesObject');
  RemClassRegistry.RegisterXSClass(ENServicesObjectRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesObjectRef');
  RemClassRegistry.RegisterXSClass(ENServicesObjectFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesObjectFilter');
  RemClassRegistry.RegisterXSClass(ENServicesObjectShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesObjectShort');
  RemClassRegistry.RegisterXSClass(ENServicesObjectShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesObjectShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENServicesObjectShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENServicesObjectShort');

  InvRegistry.RegisterInterface(TypeInfo(ENServicesObjectControllerSoapPort), 'http://ksoe.org/ENServicesObjectController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENServicesObjectControllerSoapPort), 'http://ksoe.org/ENServicesObjectController/action/ENServicesObjectController.%operationName%');

  RemClassRegistry.RegisterXSClass(PersonalServicesInfo, 'http://ksoe.org/ContractControllerService/type/', 'RecordPointCommonInfo');
  RemClassRegistry.RegisterXSClass(SpravPartner, 'http://ksoe.org/EnergyproControllerService/type/', 'SpravPartner');
end.
