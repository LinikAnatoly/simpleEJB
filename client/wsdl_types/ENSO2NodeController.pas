unit ENSO2NodeController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENServicesObjectController
   ,ENSO2NodeTypeController
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

  ENSO2Node            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSO2NodeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSO2Node = class(TRemotable)
  private
    Fcode : Integer;
    FccNodeCode : Integer;
    FccTowerCode : Integer;
    Fpower : TXSDecimal;
    Fdescription : WideString;
    FisCalc : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    Fservicesobject : ENServicesObjectRef;
//???
    Fso2nodeType : ENSO2NodeTypeRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property ccNodeCode : Integer read FccNodeCode write FccNodeCode;
    property ccTowerCode : Integer read FccTowerCode write FccTowerCode;
    property power : TXSDecimal read Fpower write Fpower;
    property description : WideString read Fdescription write Fdescription;
    property isCalc : Integer read FisCalc write FisCalc;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property servicesobject : ENServicesObjectRef read Fservicesobject write Fservicesobject;
    property so2nodeType : ENSO2NodeTypeRef read Fso2nodeType write Fso2nodeType;
  end;

{
  ENSO2NodeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FccNodeCode : Integer;
    FccTowerCode : Integer;
    Fpower : TXSDecimal;
    Fdescription : WideString;
    FisCalc : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    Fservicesobject : ENServicesObjectRef;
//???
    Fso2nodeType : ENSO2NodeTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property ccNodeCode : Integer read FccNodeCode write FccNodeCode;
    property ccTowerCode : Integer read FccTowerCode write FccTowerCode;
    property power : TXSDecimal read Fpower write Fpower;
    property description : WideString read Fdescription write Fdescription;
    property isCalc : Integer read FisCalc write FisCalc;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property servicesobject : ENServicesObjectRef read Fservicesobject write Fservicesobject;
    property so2nodeType : ENSO2NodeTypeRef read Fso2nodeType write Fso2nodeType;
  end;
}

  ENSO2NodeFilter = class(ENSO2Node)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSO2NodeShort = class(TRemotable)
  private
    Fcode : Integer;
    FccNodeCode : Integer;
    FccTowerCode : Integer;
    Fpower : TXSDecimal;
    Fdescription : WideString;
    FisCalc : Integer;
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
    FservicesobjectPersonalAccountUid : WideString;
    Fso2nodeTypeCode : Integer;
    Fso2nodeTypeName : WideString;
    Fccelementdataname : WideString;

    Ff150 : WideString;
	  Fs150 : WideString;
    Ff35 : WideString;
	  Fs35 : WideString;
    Ff10 : WideString;
    Fs10 : WideString;
	  Ff04 : WideString;

    Ftc_address : WideString;
	  Ftc_building : WideString;
	  Ftc_currpower : TXSDecimal;
	  Ftc_servpower : TXSDecimal;
	  Ftc_currvoltage : TXSDecimal;
    Ftc_servvoltage : TXSDecimal;
	  Fdep_name : WideString;
	  Ftc_number : WideString;
    Ftc_dategen : TXSDate;
	  Fconnectionkindname : WideString;
    Ffact_conn_date : TXSDate;
    Ftc_conpowpoint : WideString;
    Ftc_conpowplaces : WideString;
    Fwork_directly_on_joining : WideString;
    FservicesobjectContractStatusRefName : WideString;
    FtowerName : WideString;

  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  ccNodeCode : Integer read FccNodeCode write FccNodeCode;
    property  ccTowerCode : Integer read FccTowerCode write FccTowerCode;
    property power : TXSDecimal read Fpower write Fpower;
    property description : WideString read Fdescription write Fdescription;
    property  isCalc : Integer read FisCalc write FisCalc;
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
    property servicesobjectPersonalAccountUid : WideString read FservicesobjectPersonalAccountUid write FservicesobjectPersonalAccountUid;
    property so2nodeTypeCode : Integer read Fso2nodeTypeCode write Fso2nodeTypeCode;
    property so2nodeTypeName : WideString read Fso2nodeTypeName write Fso2nodeTypeName;
    property ccelementdataname : WideString read Fccelementdataname write Fccelementdataname;

    property f150 : WideString read Ff150 write Ff150;
	  property s150 : WideString read Fs150 write Fs150;
    property f35 : WideString read Ff35 write Ff35;
	  property s35 : WideString read Fs35 write Fs35;
    property f10 : WideString read Ff10 write Ff10;
    property s10 : WideString read Fs10 write Fs10;
	  property f04 : WideString read Ff04 write Ff04;

    property tc_address : WideString read Ftc_address write Ftc_address;
    property tc_building : WideString read Ftc_building write Ftc_building;
    property tc_currpower : TXSDecimal read Ftc_currpower write Ftc_currpower;
    property tc_servpower : TXSDecimal read Ftc_servpower write Ftc_servpower;
	  property tc_currvoltage : TXSDecimal read Ftc_currvoltage write Ftc_currvoltage;
    property tc_servvoltage : TXSDecimal read Ftc_servvoltage write Ftc_servvoltage;
	  property dep_name : WideString read Fdep_name write Fdep_name;
	  property tc_number : WideString read Ftc_number write Ftc_number;
    property tc_dategen : TXSDate read Ftc_dategen write Ftc_dategen;
	  property connectionkindname : WideString read Fconnectionkindname write Fconnectionkindname;
    property fact_conn_date : TXSDate read Ffact_conn_date write Ffact_conn_date;
    property tc_conpowpoint : WideString read Ftc_conpowpoint write Ftc_conpowpoint;
    property tc_conpowplaces : WideString read Ftc_conpowplaces write Ftc_conpowplaces;
    property work_directly_on_joining : WideString read Fwork_directly_on_joining write Fwork_directly_on_joining;
    property servicesobjectContractStatusRefName : WideString read FservicesobjectContractStatusRefName write FservicesobjectContractStatusRefName;
    property towerName : WideString read FtowerName write FtowerName;
  end;

  ArrayOfENSO2NodeShort = array of ENSO2NodeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSO2NodeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSO2NodeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSO2NodeShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSO2NodeController/message/
  // soapAction: http://ksoe.org/ENSO2NodeController/action/ENSO2NodeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSO2NodeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSO2NodeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSO2NodeControllerSoapPort = interface(IInvokable)
  ['{8BB8AE80-F9DE-44C1-A027-1DA7FFFF6D8A}']
    function add(const aENSO2Node: ENSO2Node): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSO2Node: ENSO2Node); stdcall;
    function getObject(const anObjectCode: Integer): ENSO2Node; stdcall;
    function getList: ENSO2NodeShortList; stdcall;
    function getFilteredList(const aENSO2NodeFilter: ENSO2NodeFilter): ENSO2NodeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSO2NodeShortList; stdcall;
    function getScrollableFilteredList(const aENSO2NodeFilter: ENSO2NodeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSO2NodeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSO2NodeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSO2NodeFilter: ENSO2NodeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSO2NodeShort; stdcall;
  end;


implementation

  destructor ENSO2Node.Destroy;
  begin
    if Assigned(Fpower) then
      power.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fservicesobject) then
      servicesobject.Free;
    if Assigned(Fso2nodeType) then
      so2nodeType.Free;
    inherited Destroy;
  end;

{
  destructor ENSO2NodeFilter.Destroy;
  begin
    if Assigned(Fpower) then
      power.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fservicesobject) then
      servicesobject.Free;
    if Assigned(Fso2nodeType) then
      so2nodeType.Free;
    inherited Destroy;
  end;
}

  destructor ENSO2NodeFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSO2NodeShort.Destroy;
  begin
    if Assigned(Fpower) then
      power.Free;
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
    inherited Destroy;
  end;

  destructor ENSO2NodeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSO2Node, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSO2Node');
  RemClassRegistry.RegisterXSClass(ENSO2NodeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSO2NodeRef');
  RemClassRegistry.RegisterXSClass(ENSO2NodeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSO2NodeFilter');
  RemClassRegistry.RegisterXSClass(ENSO2NodeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSO2NodeShort');
  RemClassRegistry.RegisterXSClass(ENSO2NodeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSO2NodeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSO2NodeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSO2NodeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSO2NodeControllerSoapPort), 'http://ksoe.org/ENSO2NodeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSO2NodeControllerSoapPort), 'http://ksoe.org/ENSO2NodeController/action/ENSO2NodeController.%operationName%');


end.
