unit ENSOTechParamsController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENConnectionLevelController
   ,ENPowerReliabilityCategoryController
   ,ENConnectionPowerPointController
   ,ENConnectionPhasityController
   ,ENConnectionLineTypeController
   ,ENConnectionInstallationTypeController
   ,ENConnectionLocationTypeController
   ,ENConnectionCityTypeController
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

  ENSOTechParams            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSOTechParamsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSOTechParams = class(TRemotable)
  private
    Fcode : Integer;
    FclosestDistance : Integer;
    FsubstationBuildSum : TXSDecimal;
    FcalculationSum : TXSDecimal;
    FclosestDistance2 : Integer;
    FinfoDistance2 : Integer;
    Fobject4closestDistanceName : WideString;
    Fobject4closestDistance2Name : WideString;
    FcityTypeName : WideString;
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    FlevelRef : ENConnectionLevelRef;
//???
    FcategoryRef : ENPowerReliabilityCategoryRef;
//???
    FpowerPointRef : ENConnectionPowerPointRef;
//???
    FphasityRef : ENConnectionPhasityRef;
//???
    FlineTypeRef : ENConnectionLineTypeRef;
//???
    FinstallationTypeRef : ENConnectionInstallationTypeRef;
//???
    FlocationTypeRef : ENConnectionLocationTypeRef;
//???
    FcityTypeRef : ENConnectionCityTypeRef;
//???
    Fservicesobject : ENServicesObjectRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property closestDistance : Integer read FclosestDistance write FclosestDistance;
    property substationBuildSum : TXSDecimal read FsubstationBuildSum write FsubstationBuildSum;
    property calculationSum : TXSDecimal read FcalculationSum write FcalculationSum;
    property closestDistance2 : Integer read FclosestDistance2 write FclosestDistance2;
    property infoDistance2 : Integer read FinfoDistance2 write FinfoDistance2;
    property object4closestDistanceName : WideString read Fobject4closestDistanceName write Fobject4closestDistanceName;
    property object4closestDistance2Name : WideString read Fobject4closestDistance2Name write Fobject4closestDistance2Name;
    property cityTypeName : WideString read FcityTypeName write FcityTypeName;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property levelRef : ENConnectionLevelRef read FlevelRef write FlevelRef;
    property categoryRef : ENPowerReliabilityCategoryRef read FcategoryRef write FcategoryRef;
    property powerPointRef : ENConnectionPowerPointRef read FpowerPointRef write FpowerPointRef;
    property phasityRef : ENConnectionPhasityRef read FphasityRef write FphasityRef;
    property lineTypeRef : ENConnectionLineTypeRef read FlineTypeRef write FlineTypeRef;
    property installationTypeRef : ENConnectionInstallationTypeRef read FinstallationTypeRef write FinstallationTypeRef;
    property locationTypeRef : ENConnectionLocationTypeRef read FlocationTypeRef write FlocationTypeRef;
    property cityTypeRef : ENConnectionCityTypeRef read FcityTypeRef write FcityTypeRef;
    property servicesobject : ENServicesObjectRef read Fservicesobject write Fservicesobject;
  end;

{
  ENSOTechParamsFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FclosestDistance : Integer;
    FsubstationBuildSum : TXSDecimal;
    FcalculationSum : TXSDecimal;
    FclosestDistance2 : Integer;
    FinfoDistance2 : Integer;
    Fobject4closestDistanceName : WideString;
    Fobject4closestDistance2Name : WideString;
    FcityTypeName : WideString;
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    FlevelRef : ENConnectionLevelRef;
//???
    FcategoryRef : ENPowerReliabilityCategoryRef;
//???
    FpowerPointRef : ENConnectionPowerPointRef;
//???
    FphasityRef : ENConnectionPhasityRef;
//???
    FlineTypeRef : ENConnectionLineTypeRef;
//???
    FinstallationTypeRef : ENConnectionInstallationTypeRef;
//???
    FlocationTypeRef : ENConnectionLocationTypeRef;
//???
    FcityTypeRef : ENConnectionCityTypeRef;
//???
    Fservicesobject : ENServicesObjectRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property closestDistance : Integer read FclosestDistance write FclosestDistance;
    property substationBuildSum : TXSDecimal read FsubstationBuildSum write FsubstationBuildSum;
    property calculationSum : TXSDecimal read FcalculationSum write FcalculationSum;
    property closestDistance2 : Integer read FclosestDistance2 write FclosestDistance2;
    property infoDistance2 : Integer read FinfoDistance2 write FinfoDistance2;
    property object4closestDistanceName : WideString read Fobject4closestDistanceName write Fobject4closestDistanceName;
    property object4closestDistance2Name : WideString read Fobject4closestDistance2Name write Fobject4closestDistance2Name;
    property cityTypeName : WideString read FcityTypeName write FcityTypeName;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property levelRef : ENConnectionLevelRef read FlevelRef write FlevelRef;
    property categoryRef : ENPowerReliabilityCategoryRef read FcategoryRef write FcategoryRef;
    property powerPointRef : ENConnectionPowerPointRef read FpowerPointRef write FpowerPointRef;
    property phasityRef : ENConnectionPhasityRef read FphasityRef write FphasityRef;
    property lineTypeRef : ENConnectionLineTypeRef read FlineTypeRef write FlineTypeRef;
    property installationTypeRef : ENConnectionInstallationTypeRef read FinstallationTypeRef write FinstallationTypeRef;
    property locationTypeRef : ENConnectionLocationTypeRef read FlocationTypeRef write FlocationTypeRef;
    property cityTypeRef : ENConnectionCityTypeRef read FcityTypeRef write FcityTypeRef;
    property servicesobject : ENServicesObjectRef read Fservicesobject write Fservicesobject;
  end;
}

  ENSOTechParamsFilter = class(ENSOTechParams)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSOTechParamsShort = class(TRemotable)
  private
    Fcode : Integer;
    FclosestDistance : Integer;
    FsubstationBuildSum : TXSDecimal;
    FcalculationSum : TXSDecimal;
    FclosestDistance2 : Integer;
    FinfoDistance2 : Integer;
    Fobject4closestDistanceName : WideString;
    Fobject4closestDistance2Name : WideString;
    FcityTypeName : WideString;
    FuserGen : WideString;
    FlevelRefCode : Integer;
    FlevelRefName : WideString;
    FcategoryRefCode : Integer;
    FcategoryRefName : WideString;
    FcategoryRefCoef : TXSDecimal;
    FpowerPointRefCode : Integer;
    FpowerPointRefName : WideString;
    FpowerPointRefCoef : TXSDecimal;
    FphasityRefCode : Integer;
    FphasityRefName : WideString;
    FlineTypeRefCode : Integer;
    FlineTypeRefName : WideString;
    FinstallationTypeRefCode : Integer;
    FinstallationTypeRefName : WideString;
    FinstallationTypeRefCoef : TXSDecimal;
    FlocationTypeRefCode : Integer;
    FlocationTypeRefName : WideString;
    FcityTypeRefCode : Integer;
    FcityTypeRefName : WideString;
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
    property  closestDistance : Integer read FclosestDistance write FclosestDistance;
    property substationBuildSum : TXSDecimal read FsubstationBuildSum write FsubstationBuildSum;
    property calculationSum : TXSDecimal read FcalculationSum write FcalculationSum;
    property  closestDistance2 : Integer read FclosestDistance2 write FclosestDistance2;
    property  infoDistance2 : Integer read FinfoDistance2 write FinfoDistance2;
    property object4closestDistanceName : WideString read Fobject4closestDistanceName write Fobject4closestDistanceName;
    property object4closestDistance2Name : WideString read Fobject4closestDistance2Name write Fobject4closestDistance2Name;
    property cityTypeName : WideString read FcityTypeName write FcityTypeName;
    property userGen : WideString read FuserGen write FuserGen;

    property levelRefCode : Integer read FlevelRefCode write FlevelRefCode;
    property levelRefName : WideString read FlevelRefName write FlevelRefName;
    property categoryRefCode : Integer read FcategoryRefCode write FcategoryRefCode;
    property categoryRefName : WideString read FcategoryRefName write FcategoryRefName;
    property categoryRefCoef : TXSDecimal read FcategoryRefCoef write FcategoryRefCoef;
    property powerPointRefCode : Integer read FpowerPointRefCode write FpowerPointRefCode;
    property powerPointRefName : WideString read FpowerPointRefName write FpowerPointRefName;
    property powerPointRefCoef : TXSDecimal read FpowerPointRefCoef write FpowerPointRefCoef;
    property phasityRefCode : Integer read FphasityRefCode write FphasityRefCode;
    property phasityRefName : WideString read FphasityRefName write FphasityRefName;
    property lineTypeRefCode : Integer read FlineTypeRefCode write FlineTypeRefCode;
    property lineTypeRefName : WideString read FlineTypeRefName write FlineTypeRefName;
    property installationTypeRefCode : Integer read FinstallationTypeRefCode write FinstallationTypeRefCode;
    property installationTypeRefName : WideString read FinstallationTypeRefName write FinstallationTypeRefName;
    property installationTypeRefCoef : TXSDecimal read FinstallationTypeRefCoef write FinstallationTypeRefCoef;
    property locationTypeRefCode : Integer read FlocationTypeRefCode write FlocationTypeRefCode;
    property locationTypeRefName : WideString read FlocationTypeRefName write FlocationTypeRefName;
    property cityTypeRefCode : Integer read FcityTypeRefCode write FcityTypeRefCode;
    property cityTypeRefName : WideString read FcityTypeRefName write FcityTypeRefName;
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

  ArrayOfENSOTechParamsShort = array of ENSOTechParamsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSOTechParamsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSOTechParamsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSOTechParamsShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSOTechParamsController/message/
  // soapAction: http://ksoe.org/ENSOTechParamsController/action/ENSOTechParamsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSOTechParamsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSOTechParamsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSOTechParamsControllerSoapPort = interface(IInvokable)
  ['{6D4AA902-5AD0-45AE-BB07-D220CDB12A84}']
    function add(const aENSOTechParams: ENSOTechParams): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSOTechParams: ENSOTechParams); stdcall;
    procedure calcTarif(const aENSOTechParams: ENSOTechParams); stdcall;    function getObject(const anObjectCode: Integer): ENSOTechParams; stdcall;
    function getList: ENSOTechParamsShortList; stdcall;
    function getFilteredList(const aENSOTechParamsFilter: ENSOTechParamsFilter): ENSOTechParamsShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSOTechParamsShortList; stdcall;
    function getScrollableFilteredList(const aENSOTechParamsFilter: ENSOTechParamsFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSOTechParamsShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSOTechParamsShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSOTechParamsFilter: ENSOTechParamsFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSOTechParamsShort; stdcall;
  end;


implementation

  destructor ENSOTechParams.Destroy;
  begin
    if Assigned(FsubstationBuildSum) then
      substationBuildSum.Free;
    if Assigned(FcalculationSum) then
      calculationSum.Free;
    if Assigned(FlevelRef) then
      levelRef.Free;
    if Assigned(FcategoryRef) then
      categoryRef.Free;
    if Assigned(FpowerPointRef) then
      powerPointRef.Free;
    if Assigned(FphasityRef) then
      phasityRef.Free;
    if Assigned(FlineTypeRef) then
      lineTypeRef.Free;
    if Assigned(FinstallationTypeRef) then
      installationTypeRef.Free;
    if Assigned(FlocationTypeRef) then
      locationTypeRef.Free;
    if Assigned(FcityTypeRef) then
      cityTypeRef.Free;
    if Assigned(Fservicesobject) then
      servicesobject.Free;
    inherited Destroy;
  end;

{
  destructor ENSOTechParamsFilter.Destroy;
  begin
    if Assigned(FsubstationBuildSum) then
      substationBuildSum.Free;
    if Assigned(FcalculationSum) then
      calculationSum.Free;
    if Assigned(FlevelRef) then
      levelRef.Free;
    if Assigned(FcategoryRef) then
      categoryRef.Free;
    if Assigned(FpowerPointRef) then
      powerPointRef.Free;
    if Assigned(FphasityRef) then
      phasityRef.Free;
    if Assigned(FlineTypeRef) then
      lineTypeRef.Free;
    if Assigned(FinstallationTypeRef) then
      installationTypeRef.Free;
    if Assigned(FlocationTypeRef) then
      locationTypeRef.Free;
    if Assigned(FcityTypeRef) then
      cityTypeRef.Free;
    if Assigned(Fservicesobject) then
      servicesobject.Free;
    inherited Destroy;
  end;
}

  destructor ENSOTechParamsFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSOTechParamsShort.Destroy;
  begin
    if Assigned(FsubstationBuildSum) then
      substationBuildSum.Free;
    if Assigned(FcalculationSum) then
      calculationSum.Free;
    if Assigned(FcategoryRefCoef) then
      categoryRefCoef.Free;
    if Assigned(FpowerPointRefCoef) then
      powerPointRefCoef.Free;
    if Assigned(FinstallationTypeRefCoef) then
      installationTypeRefCoef.Free;
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

  destructor ENSOTechParamsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSOTechParams, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOTechParams');
  RemClassRegistry.RegisterXSClass(ENSOTechParamsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOTechParamsRef');
  RemClassRegistry.RegisterXSClass(ENSOTechParamsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOTechParamsFilter');
  RemClassRegistry.RegisterXSClass(ENSOTechParamsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOTechParamsShort');
  RemClassRegistry.RegisterXSClass(ENSOTechParamsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOTechParamsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSOTechParamsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSOTechParamsShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSOTechParamsControllerSoapPort), 'http://ksoe.org/ENSOTechParamsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSOTechParamsControllerSoapPort), 'http://ksoe.org/ENSOTechParamsController/action/ENSOTechParamsController.%operationName%');


end.
