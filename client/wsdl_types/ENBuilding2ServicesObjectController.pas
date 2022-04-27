unit ENBuilding2ServicesObjectController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENServicesObjectController
   ,ENBuildingController
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

  ENBuilding2ServicesObject            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBuilding2ServicesObjectRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBuilding2ServicesObject = class(TRemotable)
  private
    Fcode : Integer;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FpartnerName : WideString;
    FpartnerCode : WideString;
//???
    FservicesObjectRef : ENServicesObjectRef;
//???
    FENBuildingRef : ENBuildingRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property partnerName : WideString read FpartnerName write FpartnerName;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property servicesObjectRef : ENServicesObjectRef read FservicesObjectRef write FservicesObjectRef;
    property ENBuildingRef : ENBuildingRef read FENBuildingRef write FENBuildingRef;
  end;

{
  ENBuilding2ServicesObjectFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FpartnerName : WideString;
    FpartnerCode : WideString;
//???
    FservicesObjectRef : ENServicesObjectRef;
//???
    FENBuildingRef : ENBuildingRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property partnerName : WideString read FpartnerName write FpartnerName;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property servicesObjectRef : ENServicesObjectRef read FservicesObjectRef write FservicesObjectRef;
    property ENBuildingRef : ENBuildingRef read FENBuildingRef write FENBuildingRef;
  end;
}

  ENBuilding2ServicesObjectFilter = class(ENBuilding2ServicesObject)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENBuilding2ServicesObjectShort = class(TRemotable)
  private
    Fcode : Integer;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FpartnerName : WideString;
    FpartnerCode : WideString;
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
    FservicesObjectRefCustomerMailingAddress : WideString;
    FservicesObjectRefPowerGeneration : TXSDecimal;
    FservicesObjectRefPostCode : WideString;
    FservicesObjectRefCustomerEmail : WideString;
    FENBuildingRefCode : Integer;
    FENBuildingRefNumbergen : WideString;
    FENBuildingRefDateGen : TXSDate;
    FENBuildingRefDateEdit : TXSDate;
    FENBuildingRefSummaGen : TXSDecimal;
    FENBuildingRefSummaNDS : TXSDecimal;
    FENBuildingRefCharacteristic : WideString;
    FENBuildingRefExecutedPosition : WideString;
    FENBuildingRefExecutedName : WideString;
    FENBuildingRefAcceptedPosition : WideString;
    FENBuildingRefAcceptedName : WideString;
    FENBuildingRefContractPrice : TXSDecimal;
    FENBuildingRefCodeMol : WideString;
    FENBuildingRefCodePodr : WideString;
    FENBuildingRefInvNumberOZ : WideString;
    FENBuildingRefNameOZ : WideString;
    FENBuildingRefFinContractNumber : WideString;
    FENBuildingRefFinContractDate : TXSDate;
    FENBuildingRefPartnerName : WideString;
    FENBuildingRefPartnerCode : WideString;
    FENBuildingRefIsInvestProgram : Integer;
    FENBuildingRefYearInvestProgram : WideString;
    FENBuildingRefItemInvestProgram : WideString;
    FENBuildingRefBuildingAddress : WideString;
    FENBuildingRefDecreeNumber : WideString;
    FENBuildingRefDecreeDate : TXSDate;
    FENBuildingRefExploitationTerm : Integer;
    FENBuildingRefDateLoadExpl : TXSDate;
    FENBuildingRefDateBuild : TXSDate;
    FENBuildingRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property partnerName : WideString read FpartnerName write FpartnerName;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;

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
    property servicesObjectRefCustomerMailingAddress : WideString read FservicesObjectRefCustomerMailingAddress write FservicesObjectRefCustomerMailingAddress;
    property servicesObjectRefPowerGeneration : TXSDecimal read FservicesObjectRefPowerGeneration write FservicesObjectRefPowerGeneration;
    property servicesObjectRefPostCode : WideString read FservicesObjectRefPostCode write FservicesObjectRefPostCode;
    property servicesObjectRefCustomerEmail : WideString read FservicesObjectRefCustomerEmail write FservicesObjectRefCustomerEmail;
    property ENBuildingRefCode : Integer read FENBuildingRefCode write FENBuildingRefCode;
    property ENBuildingRefNumbergen : WideString read FENBuildingRefNumbergen write FENBuildingRefNumbergen;
    property ENBuildingRefDateGen : TXSDate read FENBuildingRefDateGen write FENBuildingRefDateGen;
    property ENBuildingRefDateEdit : TXSDate read FENBuildingRefDateEdit write FENBuildingRefDateEdit;
    property ENBuildingRefSummaGen : TXSDecimal read FENBuildingRefSummaGen write FENBuildingRefSummaGen;
    property ENBuildingRefSummaNDS : TXSDecimal read FENBuildingRefSummaNDS write FENBuildingRefSummaNDS;
    property ENBuildingRefCharacteristic : WideString read FENBuildingRefCharacteristic write FENBuildingRefCharacteristic;
    property ENBuildingRefExecutedPosition : WideString read FENBuildingRefExecutedPosition write FENBuildingRefExecutedPosition;
    property ENBuildingRefExecutedName : WideString read FENBuildingRefExecutedName write FENBuildingRefExecutedName;
    property ENBuildingRefAcceptedPosition : WideString read FENBuildingRefAcceptedPosition write FENBuildingRefAcceptedPosition;
    property ENBuildingRefAcceptedName : WideString read FENBuildingRefAcceptedName write FENBuildingRefAcceptedName;
    property ENBuildingRefContractPrice : TXSDecimal read FENBuildingRefContractPrice write FENBuildingRefContractPrice;
    property ENBuildingRefCodeMol : WideString read FENBuildingRefCodeMol write FENBuildingRefCodeMol;
    property ENBuildingRefCodePodr : WideString read FENBuildingRefCodePodr write FENBuildingRefCodePodr;
    property ENBuildingRefInvNumberOZ : WideString read FENBuildingRefInvNumberOZ write FENBuildingRefInvNumberOZ;
    property ENBuildingRefNameOZ : WideString read FENBuildingRefNameOZ write FENBuildingRefNameOZ;
    property ENBuildingRefFinContractNumber : WideString read FENBuildingRefFinContractNumber write FENBuildingRefFinContractNumber;
    property ENBuildingRefFinContractDate : TXSDate read FENBuildingRefFinContractDate write FENBuildingRefFinContractDate;
    property ENBuildingRefPartnerName : WideString read FENBuildingRefPartnerName write FENBuildingRefPartnerName;
    property ENBuildingRefPartnerCode : WideString read FENBuildingRefPartnerCode write FENBuildingRefPartnerCode;
    property ENBuildingRefIsInvestProgram : Integer read FENBuildingRefIsInvestProgram write FENBuildingRefIsInvestProgram;
    property ENBuildingRefYearInvestProgram : WideString read FENBuildingRefYearInvestProgram write FENBuildingRefYearInvestProgram;
    property ENBuildingRefItemInvestProgram : WideString read FENBuildingRefItemInvestProgram write FENBuildingRefItemInvestProgram;
    property ENBuildingRefBuildingAddress : WideString read FENBuildingRefBuildingAddress write FENBuildingRefBuildingAddress;
    property ENBuildingRefDecreeNumber : WideString read FENBuildingRefDecreeNumber write FENBuildingRefDecreeNumber;
    property ENBuildingRefDecreeDate : TXSDate read FENBuildingRefDecreeDate write FENBuildingRefDecreeDate;
    property ENBuildingRefExploitationTerm : Integer read FENBuildingRefExploitationTerm write FENBuildingRefExploitationTerm;
    property ENBuildingRefDateLoadExpl : TXSDate read FENBuildingRefDateLoadExpl write FENBuildingRefDateLoadExpl;
    property ENBuildingRefDateBuild : TXSDate read FENBuildingRefDateBuild write FENBuildingRefDateBuild;
    property ENBuildingRefUserGen : WideString read FENBuildingRefUserGen write FENBuildingRefUserGen;
  end;

  ArrayOfENBuilding2ServicesObjectShort = array of ENBuilding2ServicesObjectShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENBuilding2ServicesObjectShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENBuilding2ServicesObjectShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENBuilding2ServicesObjectShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENBuilding2ServicesObjectController/message/
  // soapAction: http://ksoe.org/ENBuilding2ServicesObjectController/action/ENBuilding2ServicesObjectController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENBuilding2ServicesObjectControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENBuilding2ServicesObjectController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENBuilding2ServicesObjectControllerSoapPort = interface(IInvokable)
  ['{1C749699-89D0-4B40-B8E1-3AEDD209EDBA}']
    function add(const aENBuilding2ServicesObject: ENBuilding2ServicesObject): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENBuilding2ServicesObject: ENBuilding2ServicesObject); stdcall;
    function getObject(const anObjectCode: Integer): ENBuilding2ServicesObject; stdcall;
    function getList: ENBuilding2ServicesObjectShortList; stdcall;
    function getFilteredList(const aENBuilding2ServicesObjectFilter: ENBuilding2ServicesObjectFilter): ENBuilding2ServicesObjectShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENBuilding2ServicesObjectShortList; stdcall;
    function getScrollableFilteredList(const aENBuilding2ServicesObjectFilter: ENBuilding2ServicesObjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ENBuilding2ServicesObjectShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENBuilding2ServicesObjectShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENBuilding2ServicesObjectFilter: ENBuilding2ServicesObjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENBuilding2ServicesObjectShort; stdcall;
  end;


implementation

  destructor ENBuilding2ServicesObject.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FservicesObjectRef) then
      servicesObjectRef.Free;
    if Assigned(FENBuildingRef) then
      ENBuildingRef.Free;
    inherited Destroy;
  end;

{
  destructor ENBuilding2ServicesObjectFilter.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FservicesObjectRef) then
      servicesObjectRef.Free;
    if Assigned(FENBuildingRef) then
      ENBuildingRef.Free;
    inherited Destroy;
  end;
}

  destructor ENBuilding2ServicesObjectFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENBuilding2ServicesObjectShort.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
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
    if Assigned(FservicesObjectRefPowerGeneration) then
      servicesObjectRefPowerGeneration.Free;
    if Assigned(FENBuildingRefDateGen) then
      ENBuildingRefDateGen.Free;
    if Assigned(FENBuildingRefDateEdit) then
      ENBuildingRefDateEdit.Free;
    if Assigned(FENBuildingRefSummaGen) then
      ENBuildingRefSummaGen.Free;
    if Assigned(FENBuildingRefSummaNDS) then
      ENBuildingRefSummaNDS.Free;
    if Assigned(FENBuildingRefContractPrice) then
      ENBuildingRefContractPrice.Free;
    if Assigned(FENBuildingRefFinContractDate) then
      ENBuildingRefFinContractDate.Free;
    if Assigned(FENBuildingRefDecreeDate) then
      ENBuildingRefDecreeDate.Free;
    if Assigned(FENBuildingRefDateLoadExpl) then
      ENBuildingRefDateLoadExpl.Free;
    if Assigned(FENBuildingRefDateBuild) then
      ENBuildingRefDateBuild.Free;
    inherited Destroy;
  end;

  destructor ENBuilding2ServicesObjectShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENBuilding2ServicesObject, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilding2ServicesObject');
  RemClassRegistry.RegisterXSClass(ENBuilding2ServicesObjectRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilding2ServicesObjectRef');
  RemClassRegistry.RegisterXSClass(ENBuilding2ServicesObjectFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilding2ServicesObjectFilter');
  RemClassRegistry.RegisterXSClass(ENBuilding2ServicesObjectShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilding2ServicesObjectShort');
  RemClassRegistry.RegisterXSClass(ENBuilding2ServicesObjectShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilding2ServicesObjectShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENBuilding2ServicesObjectShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENBuilding2ServicesObjectShort');

  InvRegistry.RegisterInterface(TypeInfo(ENBuilding2ServicesObjectControllerSoapPort), 'http://ksoe.org/ENBuilding2ServicesObjectController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENBuilding2ServicesObjectControllerSoapPort), 'http://ksoe.org/ENBuilding2ServicesObjectController/action/ENBuilding2ServicesObjectController.%operationName%');


end.
