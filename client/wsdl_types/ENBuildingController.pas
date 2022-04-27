unit ENBuildingController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENDepartmentController
   ,ENBuildingStatusController
   ,ENInvestProgramGroupsController
   ,ENElementController
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

  ENBuilding            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBuildingRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBuilding = class(TRemotable)
  private
    Fcode : Integer;
    Fnumbergen : WideString;
    FdateGen : TXSDate;
    FdateEdit : TXSDate;
    FsummaGen : TXSDecimal;
    FsummaNDS : TXSDecimal;
    Fcharacteristic : WideString;
    FexecutedPosition : WideString;
    FexecutedName : WideString;
    FacceptedPosition : WideString;
    FacceptedName : WideString;
    FcontractPrice : TXSDecimal;
    FcodeMol : WideString;
    FcodePodr : WideString;
    FinvNumberOZ : WideString;
    FnameOZ : WideString;
    FfinContractNumber : WideString;
    FfinContractDate : TXSDate;
    FpartnerName : WideString;
    FpartnerCode : WideString;
    FisInvestProgram : Integer;
    FyearInvestProgram : WideString;
    FitemInvestProgram : WideString;
    FbuildingAddress : WideString;
    FdecreeNumber : WideString;
    FdecreeDate : TXSDate;
    FexploitationTerm : Integer;
    FdateLoadExpl : TXSDate;
    FdateBuild : TXSDate;
    FuserGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FdepartmentRef : ENDepartmentRef;
//???
    FstatusRef : ENBuildingStatusRef;
//???
    FinvgroupRef : ENInvestProgramGroupsRef;
//???
    FelementRef : ENElementRef;
    Fservicesobject : ENServicesObjectRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property numbergen : WideString read Fnumbergen write Fnumbergen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property summaGen : TXSDecimal read FsummaGen write FsummaGen;
    property summaNDS : TXSDecimal read FsummaNDS write FsummaNDS;
    property characteristic : WideString read Fcharacteristic write Fcharacteristic;
    property executedPosition : WideString read FexecutedPosition write FexecutedPosition;
    property executedName : WideString read FexecutedName write FexecutedName;
    property acceptedPosition : WideString read FacceptedPosition write FacceptedPosition;
    property acceptedName : WideString read FacceptedName write FacceptedName;
    property contractPrice : TXSDecimal read FcontractPrice write FcontractPrice;
    property codeMol : WideString read FcodeMol write FcodeMol;
    property codePodr : WideString read FcodePodr write FcodePodr;
    property invNumberOZ : WideString read FinvNumberOZ write FinvNumberOZ;
    property nameOZ : WideString read FnameOZ write FnameOZ;
    property finContractNumber : WideString read FfinContractNumber write FfinContractNumber;
    property finContractDate : TXSDate read FfinContractDate write FfinContractDate;
    property partnerName : WideString read FpartnerName write FpartnerName;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property isInvestProgram : Integer read FisInvestProgram write FisInvestProgram;
    property yearInvestProgram : WideString read FyearInvestProgram write FyearInvestProgram;
    property itemInvestProgram : WideString read FitemInvestProgram write FitemInvestProgram;
    property buildingAddress : WideString read FbuildingAddress write FbuildingAddress;
    property decreeNumber : WideString read FdecreeNumber write FdecreeNumber;
    property decreeDate : TXSDate read FdecreeDate write FdecreeDate;
    property exploitationTerm : Integer read FexploitationTerm write FexploitationTerm;
    property dateLoadExpl : TXSDate read FdateLoadExpl write FdateLoadExpl;
    property dateBuild : TXSDate read FdateBuild write FdateBuild;
    property userGen : WideString read FuserGen write FuserGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
    property statusRef : ENBuildingStatusRef read FstatusRef write FstatusRef;
    property invgroupRef : ENInvestProgramGroupsRef read FinvgroupRef write FinvgroupRef;
    property elementRef : ENElementRef read FelementRef write FelementRef;
    property servicesobject : ENServicesObjectRef read Fservicesobject write Fservicesobject;
  end;

{
  ENBuildingFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fnumbergen : WideString;
    FdateGen : TXSDate;
    FdateEdit : TXSDate;
    FsummaGen : TXSDecimal;
    FsummaNDS : TXSDecimal;
    Fcharacteristic : WideString;
    FexecutedPosition : WideString;
    FexecutedName : WideString;
    FacceptedPosition : WideString;
    FacceptedName : WideString;
    FcontractPrice : TXSDecimal;
    FcodeMol : WideString;
    FcodePodr : WideString;
    FinvNumberOZ : WideString;
    FnameOZ : WideString;
    FfinContractNumber : WideString;
    FfinContractDate : TXSDate;
    FpartnerName : WideString;
    FpartnerCode : WideString;
    FisInvestProgram : Integer;
    FyearInvestProgram : WideString;
    FitemInvestProgram : WideString;
    FbuildingAddress : WideString;
    FdecreeNumber : WideString;
    FdecreeDate : TXSDate;
    FexploitationTerm : Integer;
    FdateLoadExpl : TXSDate;
    FdateBuild : TXSDate;
    FuserGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FdepartmentRef : ENDepartmentRef;
//???
    FstatusRef : ENBuildingStatusRef;
//???
    FinvgroupRef : ENInvestProgramGroupsRef;
//???
    FelementRef : ENElementRef;
    Fservicesobject : ENServicesObjectRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property numbergen : WideString read Fnumbergen write Fnumbergen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property summaGen : TXSDecimal read FsummaGen write FsummaGen;
    property summaNDS : TXSDecimal read FsummaNDS write FsummaNDS;
    property characteristic : WideString read Fcharacteristic write Fcharacteristic;
    property executedPosition : WideString read FexecutedPosition write FexecutedPosition;
    property executedName : WideString read FexecutedName write FexecutedName;
    property acceptedPosition : WideString read FacceptedPosition write FacceptedPosition;
    property acceptedName : WideString read FacceptedName write FacceptedName;
    property contractPrice : TXSDecimal read FcontractPrice write FcontractPrice;
    property codeMol : WideString read FcodeMol write FcodeMol;
    property codePodr : WideString read FcodePodr write FcodePodr;
    property invNumberOZ : WideString read FinvNumberOZ write FinvNumberOZ;
    property nameOZ : WideString read FnameOZ write FnameOZ;
    property finContractNumber : WideString read FfinContractNumber write FfinContractNumber;
    property finContractDate : TXSDate read FfinContractDate write FfinContractDate;
    property partnerName : WideString read FpartnerName write FpartnerName;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property isInvestProgram : Integer read FisInvestProgram write FisInvestProgram;
    property yearInvestProgram : WideString read FyearInvestProgram write FyearInvestProgram;
    property itemInvestProgram : WideString read FitemInvestProgram write FitemInvestProgram;
    property buildingAddress : WideString read FbuildingAddress write FbuildingAddress;
    property decreeNumber : WideString read FdecreeNumber write FdecreeNumber;
    property decreeDate : TXSDate read FdecreeDate write FdecreeDate;
    property exploitationTerm : Integer read FexploitationTerm write FexploitationTerm;
    property dateLoadExpl : TXSDate read FdateLoadExpl write FdateLoadExpl;
    property dateBuild : TXSDate read FdateBuild write FdateBuild;
    property userGen : WideString read FuserGen write FuserGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
    property statusRef : ENBuildingStatusRef read FstatusRef write FstatusRef;
    property invgroupRef : ENInvestProgramGroupsRef read FinvgroupRef write FinvgroupRef;
    property elementRef : ENElementRef read FelementRef write FelementRef;
    property servicesobject : ENServicesObjectRef read Fservicesobject write Fservicesobject;
  end;
}

  ENBuildingFilter = class(ENBuilding)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENBuildingShort = class(TRemotable)
  private
    Fcode : Integer;
    Fnumbergen : WideString;
    FdateGen : TXSDate;
    FdateEdit : TXSDate;
    FsummaGen : TXSDecimal;
    FsummaNDS : TXSDecimal;
    Fcharacteristic : WideString;
    FexecutedPosition : WideString;
    FexecutedName : WideString;
    FacceptedPosition : WideString;
    FacceptedName : WideString;
    FcontractPrice : TXSDecimal;
    FcodeMol : WideString;
    FcodePodr : WideString;
    FinvNumberOZ : WideString;
    FnameOZ : WideString;
    FfinContractNumber : WideString;
    FfinContractDate : TXSDate;
    FpartnerName : WideString;
    FpartnerCode : WideString;
    FisInvestProgram : Integer;
    FyearInvestProgram : WideString;
    FitemInvestProgram : WideString;
    FbuildingAddress : WideString;
    FdecreeNumber : WideString;
    FdecreeDate : TXSDate;
    FexploitationTerm : Integer;
    FdateLoadExpl : TXSDate;
    FdateBuild : TXSDate;
    FuserGen : WideString;
    FdepartmentRefCode : Integer;
    FdepartmentRefShortName : WideString;
    FdepartmentRefDateStart : TXSDate;
    FdepartmentRefDateFinal : TXSDate;
    FdepartmentRefRenCode : Integer;
    FdepartmentRefShpzBalans : WideString;
    FdepartmentRefKau_table_id_1884 : Integer;
    FdepartmentRefKau_1884 : WideString;
    FdepartmentRefName_1884 : WideString;
    FdepartmentRefHrmorganizationid : WideString;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;
    FinvgroupRefCode : Integer;
    FinvgroupRefName : WideString;
    FinvgroupRefCommentgen : WideString;
    FelementRefCode : Integer;
 FservicesobjectCode : Integer;
    FservicesobjectContractNumber : WideString;
    FservicesobjectContractDate : TXSDate;
    FservicesobjectName : WideString;
    FservicesobjectPartnerCode : WideString;
    FservicesobjectFinDocCode : WideString;
    FservicesobjectFinDocID : Integer;
    FservicesobjectCommentGen : WideString;
    FservicesobjectContractNumberServices : WideString;
    FservicesobjectContractDateServices : TXSDate;
    FservicesobjectContragentName : WideString;
    FservicesobjectContragentAddress : WideString;
    FservicesobjectContragentAddressWork : WideString;
    FservicesobjectContragentOkpo : WideString;
    FservicesobjectContragentBankAccount : WideString;
    FservicesobjectContragentBankName : WideString;
    FservicesobjectContragentBankMfo : WideString;
    FservicesobjectContragentBossName : WideString;
    FservicesobjectContragentPassport : WideString;
    FservicesobjectContractServicesSumma : TXSDecimal;
    FservicesobjectContractServicesSummaVAT : TXSDecimal;
    FservicesobjectContractServicesPower : TXSDecimal;
    FservicesobjectCommentServicesGen : WideString;
    FservicesobjectContractServicesDistance : TXSDecimal;
    FservicesobjectContractServicesDay : TXSDecimal;
    FservicesobjectUserGen : WideString;
    FservicesobjectDateEdit : TXSDate;
    FservicesobjectWarrantDate : TXSDate;
    FservicesobjectWarrantNumber : WideString;
    FservicesobjectWarrantFIO : WideString;
    FservicesobjectRegionalType : Integer;
    FservicesobjectBasisType : TXSDecimal;
    FservicesobjectContragentPosition : WideString;
    FservicesobjectExecuteWorkDate : TXSDate;
    FservicesobjectTimeStart : TXSDateTime;
    FservicesobjectTimeFinal : TXSDateTime;
    FservicesobjectContragentPhoneNumber : WideString;
    FservicesobjectExecutorPhoneNumber : WideString;
    FservicesobjectContragentObjectWork : WideString;
    FservicesobjectIsNoPay : Integer;
    FservicesobjectIsCustomerMaterials : Integer;
    FservicesobjectPayDate : TXSDate;
    FservicesobjectFinPayFormCode : Integer;
    FservicesobjectFinPayFormName : WideString;
    FservicesobjectPartnerId : Integer;
    FservicesobjectPayDetail : WideString;
    FservicesobjectActTransferNumber : WideString;
    FservicesobjectActTransferDate : TXSDate;
    FservicesobjectResposible : WideString;
    FservicesobjectResposiblePosition : WideString;
    FservicesobjectResposibleTabNumber : WideString;
    FservicesobjectPrevContractStatus : Integer;
    FservicesobjectReconnectionTU : Integer;
    FservicesobjectPersonalAccountCode : Integer;
    FservicesobjectPersonalAccountNumber : WideString;
    FservicesobjectTabNumber : WideString;
    FservicesobjectCitiesList : WideString;
    FservicesobjectLineLength : TXSDecimal;
    FservicesobjectProjectCode : WideString;
    FservicesobjectCnPackCode : Integer;
    FservicesobjectDfPackCode : Integer;
    FservicesobjectCountersZoneType : Integer;
    FservicesobjectAxPartnerCode : WideString;
    FservicesobjectAxPartnerName : WideString;
    FservicesobjectAxContractNumber : WideString;
    FservicesobjectAxContractDate : TXSDate;
    FservicesobjectAxContractCode : WideString;
    FservicesobjectAxContractId : WideString;
    FservicesobjectAxContractCommentGen : WideString;
    FservicesobjectProjAgreeSumma : TXSDecimal;
    FservicesobjectTopographySumma : TXSDecimal;
    FservicesobjectCreatedFromSite : Integer;
    FservicesobjectTerm : Integer;
    FservicesobjectRegulation : Integer;
    FservicesobjectBoundaryDateWork : TXSDate;
    FservicesobjectCountDayDelay : Integer;
    FservicesobjectFactDateWork : TXSDate;
    FservicesobjectCodeEIC : WideString;
    FservicesobjectPersonalAccountUid : WideString;
    FservicesobjectCustomerMailingAddress : WideString;
    FservicesobjectPowerGeneration : TXSDecimal;
    FservicesobjectPostCode : WideString;
    FservicesobjectCustomerEmail : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numbergen : WideString read Fnumbergen write Fnumbergen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property summaGen : TXSDecimal read FsummaGen write FsummaGen;
    property summaNDS : TXSDecimal read FsummaNDS write FsummaNDS;
    property characteristic : WideString read Fcharacteristic write Fcharacteristic;
    property executedPosition : WideString read FexecutedPosition write FexecutedPosition;
    property executedName : WideString read FexecutedName write FexecutedName;
    property acceptedPosition : WideString read FacceptedPosition write FacceptedPosition;
    property acceptedName : WideString read FacceptedName write FacceptedName;
    property contractPrice : TXSDecimal read FcontractPrice write FcontractPrice;
    property codeMol : WideString read FcodeMol write FcodeMol;
    property codePodr : WideString read FcodePodr write FcodePodr;
    property invNumberOZ : WideString read FinvNumberOZ write FinvNumberOZ;
    property nameOZ : WideString read FnameOZ write FnameOZ;
    property finContractNumber : WideString read FfinContractNumber write FfinContractNumber;
    property finContractDate : TXSDate read FfinContractDate write FfinContractDate;
    property partnerName : WideString read FpartnerName write FpartnerName;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property  isInvestProgram : Integer read FisInvestProgram write FisInvestProgram;
    property yearInvestProgram : WideString read FyearInvestProgram write FyearInvestProgram;
    property itemInvestProgram : WideString read FitemInvestProgram write FitemInvestProgram;
    property buildingAddress : WideString read FbuildingAddress write FbuildingAddress;
    property decreeNumber : WideString read FdecreeNumber write FdecreeNumber;
    property decreeDate : TXSDate read FdecreeDate write FdecreeDate;
    property  exploitationTerm : Integer read FexploitationTerm write FexploitationTerm;
    property dateLoadExpl : TXSDate read FdateLoadExpl write FdateLoadExpl;
    property dateBuild : TXSDate read FdateBuild write FdateBuild;
    property userGen : WideString read FuserGen write FuserGen;

    property departmentRefCode : Integer read FdepartmentRefCode write FdepartmentRefCode;
    property departmentRefShortName : WideString read FdepartmentRefShortName write FdepartmentRefShortName;
    property departmentRefDateStart : TXSDate read FdepartmentRefDateStart write FdepartmentRefDateStart;
    property departmentRefDateFinal : TXSDate read FdepartmentRefDateFinal write FdepartmentRefDateFinal;
    property departmentRefRenCode : Integer read FdepartmentRefRenCode write FdepartmentRefRenCode;
    property departmentRefShpzBalans : WideString read FdepartmentRefShpzBalans write FdepartmentRefShpzBalans;
    property departmentRefKau_table_id_1884 : Integer read FdepartmentRefKau_table_id_1884 write FdepartmentRefKau_table_id_1884;
    property departmentRefKau_1884 : WideString read FdepartmentRefKau_1884 write FdepartmentRefKau_1884;
    property departmentRefName_1884 : WideString read FdepartmentRefName_1884 write FdepartmentRefName_1884;
    property departmentRefHrmorganizationid : WideString read FdepartmentRefHrmorganizationid write FdepartmentRefHrmorganizationid;
    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
    property invgroupRefCode : Integer read FinvgroupRefCode write FinvgroupRefCode;
    property invgroupRefName : WideString read FinvgroupRefName write FinvgroupRefName;
    property invgroupRefCommentgen : WideString read FinvgroupRefCommentgen write FinvgroupRefCommentgen;
    property elementRefCode : Integer read FelementRefCode write FelementRefCode;
 property servicesobjectCode : Integer read FservicesobjectCode write FservicesobjectCode;
    property servicesobjectContractNumber : WideString read FservicesobjectContractNumber write FservicesobjectContractNumber;
    property servicesobjectContractDate : TXSDate read FservicesobjectContractDate write FservicesobjectContractDate;
    property servicesobjectName : WideString read FservicesobjectName write FservicesobjectName;
    property servicesobjectPartnerCode : WideString read FservicesobjectPartnerCode write FservicesobjectPartnerCode;
    property servicesobjectFinDocCode : WideString read FservicesobjectFinDocCode write FservicesobjectFinDocCode;
    property servicesobjectFinDocID : Integer read FservicesobjectFinDocID write FservicesobjectFinDocID;
    property servicesobjectCommentGen : WideString read FservicesobjectCommentGen write FservicesobjectCommentGen;
    property servicesobjectContractNumberServices : WideString read FservicesobjectContractNumberServices write FservicesobjectContractNumberServices;
    property servicesobjectContractDateServices : TXSDate read FservicesobjectContractDateServices write FservicesobjectContractDateServices;
    property servicesobjectContragentName : WideString read FservicesobjectContragentName write FservicesobjectContragentName;
    property servicesobjectContragentAddress : WideString read FservicesobjectContragentAddress write FservicesobjectContragentAddress;
    property servicesobjectContragentAddressWork : WideString read FservicesobjectContragentAddressWork write FservicesobjectContragentAddressWork;
    property servicesobjectContragentOkpo : WideString read FservicesobjectContragentOkpo write FservicesobjectContragentOkpo;
    property servicesobjectContragentBankAccount : WideString read FservicesobjectContragentBankAccount write FservicesobjectContragentBankAccount;
    property servicesobjectContragentBankName : WideString read FservicesobjectContragentBankName write FservicesobjectContragentBankName;
    property servicesobjectContragentBankMfo : WideString read FservicesobjectContragentBankMfo write FservicesobjectContragentBankMfo;
    property servicesobjectContragentBossName : WideString read FservicesobjectContragentBossName write FservicesobjectContragentBossName;
    property servicesobjectContragentPassport : WideString read FservicesobjectContragentPassport write FservicesobjectContragentPassport;
    property servicesobjectContractServicesSumma : TXSDecimal read FservicesobjectContractServicesSumma write FservicesobjectContractServicesSumma;
    property servicesobjectContractServicesSummaVAT : TXSDecimal read FservicesobjectContractServicesSummaVAT write FservicesobjectContractServicesSummaVAT;
    property servicesobjectContractServicesPower : TXSDecimal read FservicesobjectContractServicesPower write FservicesobjectContractServicesPower;
    property servicesobjectCommentServicesGen : WideString read FservicesobjectCommentServicesGen write FservicesobjectCommentServicesGen;
    property servicesobjectContractServicesDistance : TXSDecimal read FservicesobjectContractServicesDistance write FservicesobjectContractServicesDistance;
    property servicesobjectContractServicesDay : TXSDecimal read FservicesobjectContractServicesDay write FservicesobjectContractServicesDay;
    property servicesobjectUserGen : WideString read FservicesobjectUserGen write FservicesobjectUserGen;
    property servicesobjectDateEdit : TXSDate read FservicesobjectDateEdit write FservicesobjectDateEdit;
    property servicesobjectWarrantDate : TXSDate read FservicesobjectWarrantDate write FservicesobjectWarrantDate;
    property servicesobjectWarrantNumber : WideString read FservicesobjectWarrantNumber write FservicesobjectWarrantNumber;
    property servicesobjectWarrantFIO : WideString read FservicesobjectWarrantFIO write FservicesobjectWarrantFIO;
    property servicesobjectRegionalType : Integer read FservicesobjectRegionalType write FservicesobjectRegionalType;
    property servicesobjectBasisType : TXSDecimal read FservicesobjectBasisType write FservicesobjectBasisType;
    property servicesobjectContragentPosition : WideString read FservicesobjectContragentPosition write FservicesobjectContragentPosition;
    property servicesobjectExecuteWorkDate : TXSDate read FservicesobjectExecuteWorkDate write FservicesobjectExecuteWorkDate;
    property servicesobjectTimeStart : TXSDateTime read FservicesobjectTimeStart write FservicesobjectTimeStart;
    property servicesobjectTimeFinal : TXSDateTime read FservicesobjectTimeFinal write FservicesobjectTimeFinal;
    property servicesobjectContragentPhoneNumber : WideString read FservicesobjectContragentPhoneNumber write FservicesobjectContragentPhoneNumber;
    property servicesobjectExecutorPhoneNumber : WideString read FservicesobjectExecutorPhoneNumber write FservicesobjectExecutorPhoneNumber;
    property servicesobjectContragentObjectWork : WideString read FservicesobjectContragentObjectWork write FservicesobjectContragentObjectWork;
    property servicesobjectIsNoPay : Integer read FservicesobjectIsNoPay write FservicesobjectIsNoPay;
    property servicesobjectIsCustomerMaterials : Integer read FservicesobjectIsCustomerMaterials write FservicesobjectIsCustomerMaterials;
    property servicesobjectPayDate : TXSDate read FservicesobjectPayDate write FservicesobjectPayDate;
    property servicesobjectFinPayFormCode : Integer read FservicesobjectFinPayFormCode write FservicesobjectFinPayFormCode;
    property servicesobjectFinPayFormName : WideString read FservicesobjectFinPayFormName write FservicesobjectFinPayFormName;
    property servicesobjectPartnerId : Integer read FservicesobjectPartnerId write FservicesobjectPartnerId;
    property servicesobjectPayDetail : WideString read FservicesobjectPayDetail write FservicesobjectPayDetail;
    property servicesobjectActTransferNumber : WideString read FservicesobjectActTransferNumber write FservicesobjectActTransferNumber;
    property servicesobjectActTransferDate : TXSDate read FservicesobjectActTransferDate write FservicesobjectActTransferDate;
    property servicesobjectResposible : WideString read FservicesobjectResposible write FservicesobjectResposible;
    property servicesobjectResposiblePosition : WideString read FservicesobjectResposiblePosition write FservicesobjectResposiblePosition;
    property servicesobjectResposibleTabNumber : WideString read FservicesobjectResposibleTabNumber write FservicesobjectResposibleTabNumber;
    property servicesobjectPrevContractStatus : Integer read FservicesobjectPrevContractStatus write FservicesobjectPrevContractStatus;
    property servicesobjectReconnectionTU : Integer read FservicesobjectReconnectionTU write FservicesobjectReconnectionTU;
    property servicesobjectPersonalAccountCode : Integer read FservicesobjectPersonalAccountCode write FservicesobjectPersonalAccountCode;
    property servicesobjectPersonalAccountNumber : WideString read FservicesobjectPersonalAccountNumber write FservicesobjectPersonalAccountNumber;
    property servicesobjectTabNumber : WideString read FservicesobjectTabNumber write FservicesobjectTabNumber;
    property servicesobjectCitiesList : WideString read FservicesobjectCitiesList write FservicesobjectCitiesList;
    property servicesobjectLineLength : TXSDecimal read FservicesobjectLineLength write FservicesobjectLineLength;
    property servicesobjectProjectCode : WideString read FservicesobjectProjectCode write FservicesobjectProjectCode;
    property servicesobjectCnPackCode : Integer read FservicesobjectCnPackCode write FservicesobjectCnPackCode;
    property servicesobjectDfPackCode : Integer read FservicesobjectDfPackCode write FservicesobjectDfPackCode;
    property servicesobjectCountersZoneType : Integer read FservicesobjectCountersZoneType write FservicesobjectCountersZoneType;
    property servicesobjectAxPartnerCode : WideString read FservicesobjectAxPartnerCode write FservicesobjectAxPartnerCode;
    property servicesobjectAxPartnerName : WideString read FservicesobjectAxPartnerName write FservicesobjectAxPartnerName;
    property servicesobjectAxContractNumber : WideString read FservicesobjectAxContractNumber write FservicesobjectAxContractNumber;
    property servicesobjectAxContractDate : TXSDate read FservicesobjectAxContractDate write FservicesobjectAxContractDate;
    property servicesobjectAxContractCode : WideString read FservicesobjectAxContractCode write FservicesobjectAxContractCode;
    property servicesobjectAxContractId : WideString read FservicesobjectAxContractId write FservicesobjectAxContractId;
    property servicesobjectAxContractCommentGen : WideString read FservicesobjectAxContractCommentGen write FservicesobjectAxContractCommentGen;
    property servicesobjectProjAgreeSumma : TXSDecimal read FservicesobjectProjAgreeSumma write FservicesobjectProjAgreeSumma;
    property servicesobjectTopographySumma : TXSDecimal read FservicesobjectTopographySumma write FservicesobjectTopographySumma;
    property servicesobjectCreatedFromSite : Integer read FservicesobjectCreatedFromSite write FservicesobjectCreatedFromSite;
    property servicesobjectTerm : Integer read FservicesobjectTerm write FservicesobjectTerm;
    property servicesobjectRegulation : Integer read FservicesobjectRegulation write FservicesobjectRegulation;
    property servicesobjectBoundaryDateWork : TXSDate read FservicesobjectBoundaryDateWork write FservicesobjectBoundaryDateWork;
    property servicesobjectCountDayDelay : Integer read FservicesobjectCountDayDelay write FservicesobjectCountDayDelay;
    property servicesobjectFactDateWork : TXSDate read FservicesobjectFactDateWork write FservicesobjectFactDateWork;
    property servicesobjectCodeEIC : WideString read FservicesobjectCodeEIC write FservicesobjectCodeEIC;
    property servicesobjectPersonalAccountUid : WideString read FservicesobjectPersonalAccountUid write FservicesobjectPersonalAccountUid;
    property servicesobjectCustomerMailingAddress : WideString read FservicesobjectCustomerMailingAddress write FservicesobjectCustomerMailingAddress;
    property servicesobjectPowerGeneration : TXSDecimal read FservicesobjectPowerGeneration write FservicesobjectPowerGeneration;
    property servicesobjectPostCode : WideString read FservicesobjectPostCode write FservicesobjectPostCode;
    property servicesobjectCustomerEmail : WideString read FservicesobjectCustomerEmail write FservicesobjectCustomerEmail;
  end;

  ArrayOfENBuildingShort = array of ENBuildingShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENBuildingShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENBuildingShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENBuildingShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENBuildingController/message/
  // soapAction: http://ksoe.org/ENBuildingController/action/ENBuildingController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENBuildingControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENBuildingController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENBuildingControllerSoapPort = interface(IInvokable)
  ['{7FA3B856-BB0E-46FA-A128-D9E64141459E}']
    function add(const aENBuilding: ENBuilding): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENBuilding: ENBuilding); stdcall;
    function getObject(const anObjectCode: Integer): ENBuilding; stdcall;
    function getList: ENBuildingShortList; stdcall;
    function getFilteredList(const aENBuildingFilter: ENBuildingFilter): ENBuildingShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENBuildingShortList; stdcall;
    function getScrollableFilteredList(const aENBuildingFilter: ENBuildingFilter; const aFromPosition: Integer; const aQuantity: Integer): ENBuildingShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENBuildingShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENBuildingFilter: ENBuildingFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENBuildingShort; stdcall;

    procedure createOZ(const ozCode : Integer); stdcall;
    procedure unCreateOZ(const ozCode : Integer); stdcall;
    procedure moveToOS(const ozCode : Integer); stdcall;
    procedure unMoveToOS(const ozCode : Integer); stdcall;

  end;


implementation

  destructor ENBuilding.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FsummaNDS) then
      summaNDS.Free;
    if Assigned(FcontractPrice) then
      contractPrice.Free;
    if Assigned(FfinContractDate) then
      finContractDate.Free;
    if Assigned(FdecreeDate) then
      decreeDate.Free;
    if Assigned(FdateLoadExpl) then
      dateLoadExpl.Free;
    if Assigned(FdateBuild) then
      dateBuild.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FinvgroupRef) then
      invgroupRef.Free;
    if Assigned(FelementRef) then
      elementRef.Free;
 if Assigned(Fservicesobject) then
      servicesobject.Free;
    inherited Destroy;
  end;

{
  destructor ENBuildingFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FsummaNDS) then
      summaNDS.Free;
    if Assigned(FcontractPrice) then
      contractPrice.Free;
    if Assigned(FfinContractDate) then
      finContractDate.Free;
    if Assigned(FdecreeDate) then
      decreeDate.Free;
    if Assigned(FdateLoadExpl) then
      dateLoadExpl.Free;
    if Assigned(FdateBuild) then
      dateBuild.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FinvgroupRef) then
      invgroupRef.Free;
    if Assigned(FelementRef) then
      elementRef.Free;
  if Assigned(Fservicesobject) then
      servicesobject.Free;
    inherited Destroy;
  end;
}

  destructor ENBuildingFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENBuildingShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FsummaNDS) then
      summaNDS.Free;
    if Assigned(FcontractPrice) then
      contractPrice.Free;
    if Assigned(FfinContractDate) then
      finContractDate.Free;
    if Assigned(FdecreeDate) then
      decreeDate.Free;
    if Assigned(FdateLoadExpl) then
      dateLoadExpl.Free;
    if Assigned(FdateBuild) then
      dateBuild.Free;
    if Assigned(FdepartmentRefDateStart) then
      departmentRefDateStart.Free;
    if Assigned(FdepartmentRefDateFinal) then
      departmentRefDateFinal.Free;
if Assigned(FservicesobjectContractDate) then
      servicesobjectContractDate.Free;
    if Assigned(FservicesobjectContractDateServices) then
      servicesobjectContractDateServices.Free;
    if Assigned(FservicesobjectContractServicesSumma) then
      servicesobjectContractServicesSumma.Free;
    if Assigned(FservicesobjectContractServicesSummaVAT) then
      servicesobjectContractServicesSummaVAT.Free;
    if Assigned(FservicesobjectContractServicesPower) then
      servicesobjectContractServicesPower.Free;
    if Assigned(FservicesobjectContractServicesDistance) then
      servicesobjectContractServicesDistance.Free;
    if Assigned(FservicesobjectContractServicesDay) then
      servicesobjectContractServicesDay.Free;
    if Assigned(FservicesobjectDateEdit) then
      servicesobjectDateEdit.Free;
    if Assigned(FservicesobjectWarrantDate) then
      servicesobjectWarrantDate.Free;
    if Assigned(FservicesobjectBasisType) then
      servicesobjectBasisType.Free;
    if Assigned(FservicesobjectExecuteWorkDate) then
      servicesobjectExecuteWorkDate.Free;
    if Assigned(FservicesobjectTimeStart) then
      servicesobjectTimeStart.Free;
    if Assigned(FservicesobjectTimeFinal) then
      servicesobjectTimeFinal.Free;
    if Assigned(FservicesobjectPayDate) then
      servicesobjectPayDate.Free;
    if Assigned(FservicesobjectActTransferDate) then
      servicesobjectActTransferDate.Free;
    if Assigned(FservicesobjectLineLength) then
      servicesobjectLineLength.Free;
    if Assigned(FservicesobjectAxContractDate) then
      servicesobjectAxContractDate.Free;
    if Assigned(FservicesobjectProjAgreeSumma) then
      servicesobjectProjAgreeSumma.Free;
    if Assigned(FservicesobjectTopographySumma) then
      servicesobjectTopographySumma.Free;
    if Assigned(FservicesobjectBoundaryDateWork) then
      servicesobjectBoundaryDateWork.Free;
    if Assigned(FservicesobjectFactDateWork) then
      servicesobjectFactDateWork.Free;
    if Assigned(FservicesobjectPowerGeneration) then
      servicesobjectPowerGeneration.Free;
    inherited Destroy;
  end;

  destructor ENBuildingShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENBuilding, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilding');
  RemClassRegistry.RegisterXSClass(ENBuildingRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuildingRef');
  RemClassRegistry.RegisterXSClass(ENBuildingFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuildingFilter');
  RemClassRegistry.RegisterXSClass(ENBuildingShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuildingShort');
  RemClassRegistry.RegisterXSClass(ENBuildingShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuildingShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENBuildingShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENBuildingShort');

  InvRegistry.RegisterInterface(TypeInfo(ENBuildingControllerSoapPort), 'http://ksoe.org/ENBuildingController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENBuildingControllerSoapPort), 'http://ksoe.org/ENBuildingController/action/ENBuildingController.%operationName%');


end.
