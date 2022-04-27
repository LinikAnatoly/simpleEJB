unit ENSO2DistrAgreeController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENServicesObjectController
   ,ENDistributionAgreeController
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

  ENSO2DistrAgree            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSO2DistrAgreeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSO2DistrAgree = class(TRemotable)
  private
    Fcode : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    Fservicesobject : ENServicesObjectRef;
//???
    FdistrAgree : ENDistributionAgreeRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property servicesobject : ENServicesObjectRef read Fservicesobject write Fservicesobject;
    property distrAgree : ENDistributionAgreeRef read FdistrAgree write FdistrAgree;
  end;

{
  ENSO2DistrAgreeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FuserGen : WideString;
    FdateEdit : DateTime;
    Fmodify_time : Int64;
//???
    Fservicesobject : ENServicesObjectRef;
//???
    FdistrAgree : ENDistributionAgreeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property servicesobject : ENServicesObjectRef read Fservicesobject write Fservicesobject;
    property distrAgree : ENDistributionAgreeRef read FdistrAgree write FdistrAgree;
  end;
}

  ENSO2DistrAgreeFilter = class(ENSO2DistrAgree)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSO2DistrAgreeShort = class(TRemotable)
  private
    Fcode : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
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
    FdistrAgreeCode : Integer;
    FdistrAgreeEic : WideString;
    FdistrAgreeObjectname : WideString;
    FdistrAgreeObjectaddress : WideString;
    FdistrAgreePower : TXSDecimal;
    FdistrAgreeD3countername : WideString;
    FdistrAgreeD3countertype : WideString;
    FdistrAgreeD3amperageratio : TXSDecimal;
    FdistrAgreeD3voltageratio : TXSDecimal;
    FdistrAgreeD3totalratio : TXSDecimal;
    FdistrAgreeD3place : WideString;
    FdistrAgreeD3voltageclass : WideString;
    FdistrAgreeD3workmode : WideString;
    FdistrAgreeD3tarifftype : WideString;
    FdistrAgreeD3accountingtype : WideString;
    FdistrAgreeD5feederlist : WideString;
    FdistrAgreeD6reliabilitypue : WideString;
    FdistrAgreeD6reliabilityguaranteed : WideString;
    FdistrAgreeD6balancesupplier : WideString;
    FdistrAgreeD6balanceclient : WideString;
    FdistrAgreeD6responsibilitysupplier : WideString;
    FdistrAgreeD6responsibilityclient : WideString;
    FdistrAgreeD7linesource : WideString;
    FdistrAgreeD7attachment : WideString;
    FdistrAgreeD8conditions : WideString;
    FdistrAgreeD8transformertype : WideString;
    FdistrAgreeD8voltagebh : TXSDecimal;
    FdistrAgreeD8voltagehh : TXSDecimal;
    FdistrAgreeD8lossesxx : TXSDecimal;
    FdistrAgreeD8losseskz : TXSDecimal;
    FdistrAgreeD8amperage : TXSDecimal;
    FdistrAgreeD8voltagekz : TXSDecimal;
    FdistrAgreeD8linelength : TXSDecimal;
    FdistrAgreeD8liner : TXSDecimal;
    FdistrAgreeD8linex : TXSDecimal;
    FdistrAgreeD8hours : Integer;
    FdistrAgreeUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

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
    property distrAgreeCode : Integer read FdistrAgreeCode write FdistrAgreeCode;
    property distrAgreeEic : WideString read FdistrAgreeEic write FdistrAgreeEic;
    property distrAgreeObjectname : WideString read FdistrAgreeObjectname write FdistrAgreeObjectname;
    property distrAgreeObjectaddress : WideString read FdistrAgreeObjectaddress write FdistrAgreeObjectaddress;
    property distrAgreePower : TXSDecimal read FdistrAgreePower write FdistrAgreePower;
    property distrAgreeD3countername : WideString read FdistrAgreeD3countername write FdistrAgreeD3countername;
    property distrAgreeD3countertype : WideString read FdistrAgreeD3countertype write FdistrAgreeD3countertype;
    property distrAgreeD3amperageratio : TXSDecimal read FdistrAgreeD3amperageratio write FdistrAgreeD3amperageratio;
    property distrAgreeD3voltageratio : TXSDecimal read FdistrAgreeD3voltageratio write FdistrAgreeD3voltageratio;
    property distrAgreeD3totalratio : TXSDecimal read FdistrAgreeD3totalratio write FdistrAgreeD3totalratio;
    property distrAgreeD3place : WideString read FdistrAgreeD3place write FdistrAgreeD3place;
    property distrAgreeD3voltageclass : WideString read FdistrAgreeD3voltageclass write FdistrAgreeD3voltageclass;
    property distrAgreeD3workmode : WideString read FdistrAgreeD3workmode write FdistrAgreeD3workmode;
    property distrAgreeD3tarifftype : WideString read FdistrAgreeD3tarifftype write FdistrAgreeD3tarifftype;
    property distrAgreeD3accountingtype : WideString read FdistrAgreeD3accountingtype write FdistrAgreeD3accountingtype;
    property distrAgreeD5feederlist : WideString read FdistrAgreeD5feederlist write FdistrAgreeD5feederlist;
    property distrAgreeD6reliabilitypue : WideString read FdistrAgreeD6reliabilitypue write FdistrAgreeD6reliabilitypue;
    property distrAgreeD6reliabilityguaranteed : WideString read FdistrAgreeD6reliabilityguaranteed write FdistrAgreeD6reliabilityguaranteed;
    property distrAgreeD6balancesupplier : WideString read FdistrAgreeD6balancesupplier write FdistrAgreeD6balancesupplier;
    property distrAgreeD6balanceclient : WideString read FdistrAgreeD6balanceclient write FdistrAgreeD6balanceclient;
    property distrAgreeD6responsibilitysupplier : WideString read FdistrAgreeD6responsibilitysupplier write FdistrAgreeD6responsibilitysupplier;
    property distrAgreeD6responsibilityclient : WideString read FdistrAgreeD6responsibilityclient write FdistrAgreeD6responsibilityclient;
    property distrAgreeD7linesource : WideString read FdistrAgreeD7linesource write FdistrAgreeD7linesource;
    property distrAgreeD7attachment : WideString read FdistrAgreeD7attachment write FdistrAgreeD7attachment;
    property distrAgreeD8conditions : WideString read FdistrAgreeD8conditions write FdistrAgreeD8conditions;
    property distrAgreeD8transformertype : WideString read FdistrAgreeD8transformertype write FdistrAgreeD8transformertype;
    property distrAgreeD8voltagebh : TXSDecimal read FdistrAgreeD8voltagebh write FdistrAgreeD8voltagebh;
    property distrAgreeD8voltagehh : TXSDecimal read FdistrAgreeD8voltagehh write FdistrAgreeD8voltagehh;
    property distrAgreeD8lossesxx : TXSDecimal read FdistrAgreeD8lossesxx write FdistrAgreeD8lossesxx;
    property distrAgreeD8losseskz : TXSDecimal read FdistrAgreeD8losseskz write FdistrAgreeD8losseskz;
    property distrAgreeD8amperage : TXSDecimal read FdistrAgreeD8amperage write FdistrAgreeD8amperage;
    property distrAgreeD8voltagekz : TXSDecimal read FdistrAgreeD8voltagekz write FdistrAgreeD8voltagekz;
    property distrAgreeD8linelength : TXSDecimal read FdistrAgreeD8linelength write FdistrAgreeD8linelength;
    property distrAgreeD8liner : TXSDecimal read FdistrAgreeD8liner write FdistrAgreeD8liner;
    property distrAgreeD8linex : TXSDecimal read FdistrAgreeD8linex write FdistrAgreeD8linex;
    property distrAgreeD8hours : Integer read FdistrAgreeD8hours write FdistrAgreeD8hours;
    property distrAgreeUserGen : WideString read FdistrAgreeUserGen write FdistrAgreeUserGen;
  end;

  ArrayOfENSO2DistrAgreeShort = array of ENSO2DistrAgreeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSO2DistrAgreeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSO2DistrAgreeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSO2DistrAgreeShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSO2DistrAgreeController/message/
  // soapAction: http://ksoe.org/ENSO2DistrAgreeController/action/ENSO2DistrAgreeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSO2DistrAgreeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSO2DistrAgreeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSO2DistrAgreeControllerSoapPort = interface(IInvokable)
  ['{47170F7E-B9F3-4EEF-A67E-A242663070CE}']
    function add(const aENSO2DistrAgree: ENSO2DistrAgree): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSO2DistrAgree: ENSO2DistrAgree); stdcall;
    function getObject(const anObjectCode: Integer): ENSO2DistrAgree; stdcall;
    function getList: ENSO2DistrAgreeShortList; stdcall;
    function getFilteredList(const aENSO2DistrAgreeFilter: ENSO2DistrAgreeFilter): ENSO2DistrAgreeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSO2DistrAgreeShortList; stdcall;
    function getScrollableFilteredList(const aENSO2DistrAgreeFilter: ENSO2DistrAgreeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSO2DistrAgreeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSO2DistrAgreeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSO2DistrAgreeFilter: ENSO2DistrAgreeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSO2DistrAgreeShort; stdcall;
  end;


implementation

  destructor ENSO2DistrAgree.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fservicesobject) then
      servicesobject.Free;
    if Assigned(FdistrAgree) then
      distrAgree.Free;
    inherited Destroy;
  end;

{
  destructor ENSO2DistrAgreeFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fservicesobject) then
      servicesobject.Free;
    if Assigned(FdistrAgree) then
      distrAgree.Free;
    inherited Destroy;
  end;
}

  destructor ENSO2DistrAgreeFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSO2DistrAgreeShort.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
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
    if Assigned(FdistrAgreePower) then
      distrAgreePower.Free;
    if Assigned(FdistrAgreeD3amperageratio) then
      distrAgreeD3amperageratio.Free;
    if Assigned(FdistrAgreeD3voltageratio) then
      distrAgreeD3voltageratio.Free;
    if Assigned(FdistrAgreeD3totalratio) then
      distrAgreeD3totalratio.Free;
    if Assigned(FdistrAgreeD8voltagebh) then
      distrAgreeD8voltagebh.Free;
    if Assigned(FdistrAgreeD8voltagehh) then
      distrAgreeD8voltagehh.Free;
    if Assigned(FdistrAgreeD8lossesxx) then
      distrAgreeD8lossesxx.Free;
    if Assigned(FdistrAgreeD8losseskz) then
      distrAgreeD8losseskz.Free;
    if Assigned(FdistrAgreeD8amperage) then
      distrAgreeD8amperage.Free;
    if Assigned(FdistrAgreeD8voltagekz) then
      distrAgreeD8voltagekz.Free;
    if Assigned(FdistrAgreeD8linelength) then
      distrAgreeD8linelength.Free;
    if Assigned(FdistrAgreeD8liner) then
      distrAgreeD8liner.Free;
    if Assigned(FdistrAgreeD8linex) then
      distrAgreeD8linex.Free;
    inherited Destroy;
  end;

  destructor ENSO2DistrAgreeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSO2DistrAgree, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSO2DistrAgree');
  RemClassRegistry.RegisterXSClass(ENSO2DistrAgreeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSO2DistrAgreeRef');
  RemClassRegistry.RegisterXSClass(ENSO2DistrAgreeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSO2DistrAgreeFilter');
  RemClassRegistry.RegisterXSClass(ENSO2DistrAgreeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSO2DistrAgreeShort');
  RemClassRegistry.RegisterXSClass(ENSO2DistrAgreeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSO2DistrAgreeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSO2DistrAgreeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSO2DistrAgreeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSO2DistrAgreeControllerSoapPort), 'http://ksoe.org/ENSO2DistrAgreeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSO2DistrAgreeControllerSoapPort), 'http://ksoe.org/ENSO2DistrAgreeController/action/ENSO2DistrAgreeController.%operationName%');


end.
