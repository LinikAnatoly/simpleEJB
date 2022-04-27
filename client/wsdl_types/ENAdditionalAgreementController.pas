unit ENAdditionalAgreementController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
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

  ENAdditionalAgreement            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAdditionalAgreementRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAdditionalAgreement = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FsumWithoutVAT : TXSDecimal;
    FsumVAT : TXSDecimal;
    FcalcSumsByCalculations : TXSBoolean;
    FisSigned : TXSBoolean;
//???
    FservicesobjectRef : ENServicesObjectRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property sumWithoutVAT : TXSDecimal read FsumWithoutVAT write FsumWithoutVAT;
    property sumVAT : TXSDecimal read FsumVAT write FsumVAT;
    property calcSumsByCalculations : TXSBoolean read FcalcSumsByCalculations write FcalcSumsByCalculations;
    property isSigned : TXSBoolean read FisSigned write FisSigned;
    property servicesobjectRef : ENServicesObjectRef read FservicesobjectRef write FservicesobjectRef;
  end;

{
  ENAdditionalAgreementFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FsumWithoutVAT : TXSDecimal;
    FsumVAT : TXSDecimal;
    FcalcSumsByCalculations : TXSBoolean;
    FisSigned : TXSBoolean;
//???
    FservicesobjectRef : ENServicesObjectRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property sumWithoutVAT : TXSDecimal read FsumWithoutVAT write FsumWithoutVAT;
    property sumVAT : TXSDecimal read FsumVAT write FsumVAT;
    property calcSumsByCalculations : TXSBoolean read FcalcSumsByCalculations write FcalcSumsByCalculations;
    property isSigned : TXSBoolean read FisSigned write FisSigned;
    property servicesobjectRef : ENServicesObjectRef read FservicesobjectRef write FservicesobjectRef;
  end;
}

  ENAdditionalAgreementFilter = class(ENAdditionalAgreement)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENAdditionalAgreementShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FsumWithoutVAT : TXSDecimal;
    FsumVAT : TXSDecimal;
    FcalcSumsByCalculations : TXSBoolean;
    FisSigned : TXSBoolean;
    FservicesobjectRefCode : Integer;
    FservicesobjectRefContractNumber : WideString;
    FservicesobjectRefContractDate : TXSDate;
    FservicesobjectRefName : WideString;
    FservicesobjectRefPartnerCode : WideString;
    FservicesobjectRefFinDocCode : WideString;
    FservicesobjectRefFinDocID : Integer;
    FservicesobjectRefCommentGen : WideString;
    FservicesobjectRefContractNumberServices : WideString;
    FservicesobjectRefContractDateServices : TXSDate;
    FservicesobjectRefContragentName : WideString;
    FservicesobjectRefContragentAddress : WideString;
    FservicesobjectRefContragentAddressWork : WideString;
    FservicesobjectRefContragentOkpo : WideString;
    FservicesobjectRefContragentBankAccount : WideString;
    FservicesobjectRefContragentBankName : WideString;
    FservicesobjectRefContragentBankMfo : WideString;
    FservicesobjectRefContragentBossName : WideString;
    FservicesobjectRefContragentPassport : WideString;
    FservicesobjectRefContractServicesSumma : TXSDecimal;
    FservicesobjectRefContractServicesSummaVAT : TXSDecimal;
    FservicesobjectRefContractServicesPower : TXSDecimal;
    FservicesobjectRefCommentServicesGen : WideString;
    FservicesobjectRefContractServicesDistance : TXSDecimal;
    FservicesobjectRefContractServicesDay : TXSDecimal;
    FservicesobjectRefUserGen : WideString;
    FservicesobjectRefDateEdit : TXSDate;
    FservicesobjectRefWarrantDate : TXSDate;
    FservicesobjectRefWarrantNumber : WideString;
    FservicesobjectRefWarrantFIO : WideString;
    FservicesobjectRefRegionalType : Integer;
    FservicesobjectRefBasisType : TXSDecimal;
    FservicesobjectRefContragentPosition : WideString;
    FservicesobjectRefExecuteWorkDate : TXSDate;
    FservicesobjectRefTimeStart : TXSDateTime;
    FservicesobjectRefTimeFinal : TXSDateTime;
    FservicesobjectRefContragentPhoneNumber : WideString;
    FservicesobjectRefExecutorPhoneNumber : WideString;
    FservicesobjectRefContragentObjectWork : WideString;
    FservicesobjectRefIsNoPay : Integer;
    FservicesobjectRefIsCustomerMaterials : Integer;
    FservicesobjectRefPayDate : TXSDate;
    FservicesobjectRefFinPayFormCode : Integer;
    FservicesobjectRefFinPayFormName : WideString;
    FservicesobjectRefPartnerId : Integer;
    FservicesobjectRefPayDetail : WideString;
    FservicesobjectRefActTransferNumber : WideString;
    FservicesobjectRefActTransferDate : TXSDate;
    FservicesobjectRefResposible : WideString;
    FservicesobjectRefResposiblePosition : WideString;
    FservicesobjectRefResposibleTabNumber : WideString;
    FservicesobjectRefPrevContractStatus : Integer;
    FservicesobjectRefReconnectionTU : Integer;
    FservicesobjectRefPersonalAccountCode : Integer;
    FservicesobjectRefPersonalAccountNumber : WideString;
    FservicesobjectRefTabNumber : WideString;
    FservicesobjectRefCitiesList : WideString;
    FservicesobjectRefLineLength : TXSDecimal;
    FservicesobjectRefProjectCode : WideString;
    FservicesobjectRefCnPackCode : Integer;
    FservicesobjectRefDfPackCode : Integer;
    FservicesobjectRefCountersZoneType : Integer;
    FservicesobjectRefAxPartnerCode : WideString;
    FservicesobjectRefAxPartnerName : WideString;
    FservicesobjectRefAxContractNumber : WideString;
    FservicesobjectRefAxContractDate : TXSDate;
    FservicesobjectRefAxContractCode : WideString;
    FservicesobjectRefAxContractId : WideString;
    FservicesobjectRefAxContractCommentGen : WideString;
    FservicesobjectRefProjAgreeSumma : TXSDecimal;
    FservicesobjectRefTopographySumma : TXSDecimal;
    FservicesobjectRefCreatedFromSite : Integer;
    FservicesobjectRefTerm : Integer;
    FservicesobjectRefRegulation : Integer;
    FservicesobjectRefBoundaryDateWork : TXSDate;
    FservicesobjectRefCountDayDelay : Integer;
    FservicesobjectRefFactDateWork : TXSDate;
    FservicesobjectRefCodeEIC : WideString;
    FservicesobjectRefPersonalAccountUid : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property sumWithoutVAT : TXSDecimal read FsumWithoutVAT write FsumWithoutVAT;
    property sumVAT : TXSDecimal read FsumVAT write FsumVAT;
    property calcSumsByCalculations : TXSBoolean read FcalcSumsByCalculations write FcalcSumsByCalculations;
    property isSigned : TXSBoolean read FisSigned write FisSigned;

    property servicesobjectRefCode : Integer read FservicesobjectRefCode write FservicesobjectRefCode;
    property servicesobjectRefContractNumber : WideString read FservicesobjectRefContractNumber write FservicesobjectRefContractNumber;
    property servicesobjectRefContractDate : TXSDate read FservicesobjectRefContractDate write FservicesobjectRefContractDate;
    property servicesobjectRefName : WideString read FservicesobjectRefName write FservicesobjectRefName;
    property servicesobjectRefPartnerCode : WideString read FservicesobjectRefPartnerCode write FservicesobjectRefPartnerCode;
    property servicesobjectRefFinDocCode : WideString read FservicesobjectRefFinDocCode write FservicesobjectRefFinDocCode;
    property servicesobjectRefFinDocID : Integer read FservicesobjectRefFinDocID write FservicesobjectRefFinDocID;
    property servicesobjectRefCommentGen : WideString read FservicesobjectRefCommentGen write FservicesobjectRefCommentGen;
    property servicesobjectRefContractNumberServices : WideString read FservicesobjectRefContractNumberServices write FservicesobjectRefContractNumberServices;
    property servicesobjectRefContractDateServices : TXSDate read FservicesobjectRefContractDateServices write FservicesobjectRefContractDateServices;
    property servicesobjectRefContragentName : WideString read FservicesobjectRefContragentName write FservicesobjectRefContragentName;
    property servicesobjectRefContragentAddress : WideString read FservicesobjectRefContragentAddress write FservicesobjectRefContragentAddress;
    property servicesobjectRefContragentAddressWork : WideString read FservicesobjectRefContragentAddressWork write FservicesobjectRefContragentAddressWork;
    property servicesobjectRefContragentOkpo : WideString read FservicesobjectRefContragentOkpo write FservicesobjectRefContragentOkpo;
    property servicesobjectRefContragentBankAccount : WideString read FservicesobjectRefContragentBankAccount write FservicesobjectRefContragentBankAccount;
    property servicesobjectRefContragentBankName : WideString read FservicesobjectRefContragentBankName write FservicesobjectRefContragentBankName;
    property servicesobjectRefContragentBankMfo : WideString read FservicesobjectRefContragentBankMfo write FservicesobjectRefContragentBankMfo;
    property servicesobjectRefContragentBossName : WideString read FservicesobjectRefContragentBossName write FservicesobjectRefContragentBossName;
    property servicesobjectRefContragentPassport : WideString read FservicesobjectRefContragentPassport write FservicesobjectRefContragentPassport;
    property servicesobjectRefContractServicesSumma : TXSDecimal read FservicesobjectRefContractServicesSumma write FservicesobjectRefContractServicesSumma;
    property servicesobjectRefContractServicesSummaVAT : TXSDecimal read FservicesobjectRefContractServicesSummaVAT write FservicesobjectRefContractServicesSummaVAT;
    property servicesobjectRefContractServicesPower : TXSDecimal read FservicesobjectRefContractServicesPower write FservicesobjectRefContractServicesPower;
    property servicesobjectRefCommentServicesGen : WideString read FservicesobjectRefCommentServicesGen write FservicesobjectRefCommentServicesGen;
    property servicesobjectRefContractServicesDistance : TXSDecimal read FservicesobjectRefContractServicesDistance write FservicesobjectRefContractServicesDistance;
    property servicesobjectRefContractServicesDay : TXSDecimal read FservicesobjectRefContractServicesDay write FservicesobjectRefContractServicesDay;
    property servicesobjectRefUserGen : WideString read FservicesobjectRefUserGen write FservicesobjectRefUserGen;
    property servicesobjectRefDateEdit : TXSDate read FservicesobjectRefDateEdit write FservicesobjectRefDateEdit;
    property servicesobjectRefWarrantDate : TXSDate read FservicesobjectRefWarrantDate write FservicesobjectRefWarrantDate;
    property servicesobjectRefWarrantNumber : WideString read FservicesobjectRefWarrantNumber write FservicesobjectRefWarrantNumber;
    property servicesobjectRefWarrantFIO : WideString read FservicesobjectRefWarrantFIO write FservicesobjectRefWarrantFIO;
    property servicesobjectRefRegionalType : Integer read FservicesobjectRefRegionalType write FservicesobjectRefRegionalType;
    property servicesobjectRefBasisType : TXSDecimal read FservicesobjectRefBasisType write FservicesobjectRefBasisType;
    property servicesobjectRefContragentPosition : WideString read FservicesobjectRefContragentPosition write FservicesobjectRefContragentPosition;
    property servicesobjectRefExecuteWorkDate : TXSDate read FservicesobjectRefExecuteWorkDate write FservicesobjectRefExecuteWorkDate;
    property servicesobjectRefTimeStart : TXSDateTime read FservicesobjectRefTimeStart write FservicesobjectRefTimeStart;
    property servicesobjectRefTimeFinal : TXSDateTime read FservicesobjectRefTimeFinal write FservicesobjectRefTimeFinal;
    property servicesobjectRefContragentPhoneNumber : WideString read FservicesobjectRefContragentPhoneNumber write FservicesobjectRefContragentPhoneNumber;
    property servicesobjectRefExecutorPhoneNumber : WideString read FservicesobjectRefExecutorPhoneNumber write FservicesobjectRefExecutorPhoneNumber;
    property servicesobjectRefContragentObjectWork : WideString read FservicesobjectRefContragentObjectWork write FservicesobjectRefContragentObjectWork;
    property servicesobjectRefIsNoPay : Integer read FservicesobjectRefIsNoPay write FservicesobjectRefIsNoPay;
    property servicesobjectRefIsCustomerMaterials : Integer read FservicesobjectRefIsCustomerMaterials write FservicesobjectRefIsCustomerMaterials;
    property servicesobjectRefPayDate : TXSDate read FservicesobjectRefPayDate write FservicesobjectRefPayDate;
    property servicesobjectRefFinPayFormCode : Integer read FservicesobjectRefFinPayFormCode write FservicesobjectRefFinPayFormCode;
    property servicesobjectRefFinPayFormName : WideString read FservicesobjectRefFinPayFormName write FservicesobjectRefFinPayFormName;
    property servicesobjectRefPartnerId : Integer read FservicesobjectRefPartnerId write FservicesobjectRefPartnerId;
    property servicesobjectRefPayDetail : WideString read FservicesobjectRefPayDetail write FservicesobjectRefPayDetail;
    property servicesobjectRefActTransferNumber : WideString read FservicesobjectRefActTransferNumber write FservicesobjectRefActTransferNumber;
    property servicesobjectRefActTransferDate : TXSDate read FservicesobjectRefActTransferDate write FservicesobjectRefActTransferDate;
    property servicesobjectRefResposible : WideString read FservicesobjectRefResposible write FservicesobjectRefResposible;
    property servicesobjectRefResposiblePosition : WideString read FservicesobjectRefResposiblePosition write FservicesobjectRefResposiblePosition;
    property servicesobjectRefResposibleTabNumber : WideString read FservicesobjectRefResposibleTabNumber write FservicesobjectRefResposibleTabNumber;
    property servicesobjectRefPrevContractStatus : Integer read FservicesobjectRefPrevContractStatus write FservicesobjectRefPrevContractStatus;
    property servicesobjectRefReconnectionTU : Integer read FservicesobjectRefReconnectionTU write FservicesobjectRefReconnectionTU;
    property servicesobjectRefPersonalAccountCode : Integer read FservicesobjectRefPersonalAccountCode write FservicesobjectRefPersonalAccountCode;
    property servicesobjectRefPersonalAccountNumber : WideString read FservicesobjectRefPersonalAccountNumber write FservicesobjectRefPersonalAccountNumber;
    property servicesobjectRefTabNumber : WideString read FservicesobjectRefTabNumber write FservicesobjectRefTabNumber;
    property servicesobjectRefCitiesList : WideString read FservicesobjectRefCitiesList write FservicesobjectRefCitiesList;
    property servicesobjectRefLineLength : TXSDecimal read FservicesobjectRefLineLength write FservicesobjectRefLineLength;
    property servicesobjectRefProjectCode : WideString read FservicesobjectRefProjectCode write FservicesobjectRefProjectCode;
    property servicesobjectRefCnPackCode : Integer read FservicesobjectRefCnPackCode write FservicesobjectRefCnPackCode;
    property servicesobjectRefDfPackCode : Integer read FservicesobjectRefDfPackCode write FservicesobjectRefDfPackCode;
    property servicesobjectRefCountersZoneType : Integer read FservicesobjectRefCountersZoneType write FservicesobjectRefCountersZoneType;
    property servicesobjectRefAxPartnerCode : WideString read FservicesobjectRefAxPartnerCode write FservicesobjectRefAxPartnerCode;
    property servicesobjectRefAxPartnerName : WideString read FservicesobjectRefAxPartnerName write FservicesobjectRefAxPartnerName;
    property servicesobjectRefAxContractNumber : WideString read FservicesobjectRefAxContractNumber write FservicesobjectRefAxContractNumber;
    property servicesobjectRefAxContractDate : TXSDate read FservicesobjectRefAxContractDate write FservicesobjectRefAxContractDate;
    property servicesobjectRefAxContractCode : WideString read FservicesobjectRefAxContractCode write FservicesobjectRefAxContractCode;
    property servicesobjectRefAxContractId : WideString read FservicesobjectRefAxContractId write FservicesobjectRefAxContractId;
    property servicesobjectRefAxContractCommentGen : WideString read FservicesobjectRefAxContractCommentGen write FservicesobjectRefAxContractCommentGen;
    property servicesobjectRefProjAgreeSumma : TXSDecimal read FservicesobjectRefProjAgreeSumma write FservicesobjectRefProjAgreeSumma;
    property servicesobjectRefTopographySumma : TXSDecimal read FservicesobjectRefTopographySumma write FservicesobjectRefTopographySumma;
    property servicesobjectRefCreatedFromSite : Integer read FservicesobjectRefCreatedFromSite write FservicesobjectRefCreatedFromSite;
    property servicesobjectRefTerm : Integer read FservicesobjectRefTerm write FservicesobjectRefTerm;
    property servicesobjectRefRegulation : Integer read FservicesobjectRefRegulation write FservicesobjectRefRegulation;
    property servicesobjectRefBoundaryDateWork : TXSDate read FservicesobjectRefBoundaryDateWork write FservicesobjectRefBoundaryDateWork;
    property servicesobjectRefCountDayDelay : Integer read FservicesobjectRefCountDayDelay write FservicesobjectRefCountDayDelay;
    property servicesobjectRefFactDateWork : TXSDate read FservicesobjectRefFactDateWork write FservicesobjectRefFactDateWork;
    property servicesobjectRefCodeEIC : WideString read FservicesobjectRefCodeEIC write FservicesobjectRefCodeEIC;
    property servicesobjectRefPersonalAccountUid : WideString read FservicesobjectRefPersonalAccountUid write FservicesobjectRefPersonalAccountUid;
  end;

  ArrayOfENAdditionalAgreementShort = array of ENAdditionalAgreementShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAdditionalAgreementShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAdditionalAgreementShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAdditionalAgreementShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAdditionalAgreementController/message/
  // soapAction: http://ksoe.org/ENAdditionalAgreementController/action/ENAdditionalAgreementController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAdditionalAgreementControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAdditionalAgreementController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAdditionalAgreementControllerSoapPort = interface(IInvokable)
  ['{B33F0270-16F9-4A34-990C-2069FFE0276B}']
    function add(const aENAdditionalAgreement: ENAdditionalAgreement): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENAdditionalAgreement: ENAdditionalAgreement); stdcall;
    function getObject(const anObjectCode: Integer): ENAdditionalAgreement; stdcall;
	procedure signOrUnsign(const aENAdditionalAgreement: ENAdditionalAgreement; const isSign : Boolean); stdcall;
    function getList: ENAdditionalAgreementShortList; stdcall;
    function getFilteredList(const aENAdditionalAgreementFilter: ENAdditionalAgreementFilter): ENAdditionalAgreementShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAdditionalAgreementShortList; stdcall;
    function getScrollableFilteredList(const aENAdditionalAgreementFilter: ENAdditionalAgreementFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAdditionalAgreementShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAdditionalAgreementShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENAdditionalAgreementFilter: ENAdditionalAgreementFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENAdditionalAgreementShort; stdcall;
  end;


implementation

  destructor ENAdditionalAgreement.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FsumWithoutVAT) then
      sumWithoutVAT.Free;
    if Assigned(FsumVAT) then
      sumVAT.Free;
    if Assigned(FcalcSumsByCalculations) then
      calcSumsByCalculations.Free;
    if Assigned(FisSigned) then
      isSigned.Free;
    if Assigned(FservicesobjectRef) then
      servicesobjectRef.Free;
    inherited Destroy;
  end;

{
  destructor ENAdditionalAgreementFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FsumWithoutVAT) then
      sumWithoutVAT.Free;
    if Assigned(FsumVAT) then
      sumVAT.Free;
    if Assigned(FcalcSumsByCalculations) then
      calcSumsByCalculations.Free;
    if Assigned(FisSigned) then
      isSigned.Free;
    if Assigned(FservicesobjectRef) then
      servicesobjectRef.Free;
    inherited Destroy;
  end;
}

  destructor ENAdditionalAgreementFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENAdditionalAgreementShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FsumWithoutVAT) then
      sumWithoutVAT.Free;
    if Assigned(FsumVAT) then
      sumVAT.Free;
    if Assigned(FcalcSumsByCalculations) then
      calcSumsByCalculations.Free;
    if Assigned(FisSigned) then
      isSigned.Free;
    if Assigned(FservicesobjectRefContractDate) then
      servicesobjectRefContractDate.Free;
    if Assigned(FservicesobjectRefContractDateServices) then
      servicesobjectRefContractDateServices.Free;
    if Assigned(FservicesobjectRefContractServicesSumma) then
      servicesobjectRefContractServicesSumma.Free;
    if Assigned(FservicesobjectRefContractServicesSummaVAT) then
      servicesobjectRefContractServicesSummaVAT.Free;
    if Assigned(FservicesobjectRefContractServicesPower) then
      servicesobjectRefContractServicesPower.Free;
    if Assigned(FservicesobjectRefContractServicesDistance) then
      servicesobjectRefContractServicesDistance.Free;
    if Assigned(FservicesobjectRefContractServicesDay) then
      servicesobjectRefContractServicesDay.Free;
    if Assigned(FservicesobjectRefDateEdit) then
      servicesobjectRefDateEdit.Free;
    if Assigned(FservicesobjectRefWarrantDate) then
      servicesobjectRefWarrantDate.Free;
    if Assigned(FservicesobjectRefBasisType) then
      servicesobjectRefBasisType.Free;
    if Assigned(FservicesobjectRefExecuteWorkDate) then
      servicesobjectRefExecuteWorkDate.Free;
    if Assigned(FservicesobjectRefTimeStart) then
      servicesobjectRefTimeStart.Free;
    if Assigned(FservicesobjectRefTimeFinal) then
      servicesobjectRefTimeFinal.Free;
    if Assigned(FservicesobjectRefPayDate) then
      servicesobjectRefPayDate.Free;
    if Assigned(FservicesobjectRefActTransferDate) then
      servicesobjectRefActTransferDate.Free;
    if Assigned(FservicesobjectRefLineLength) then
      servicesobjectRefLineLength.Free;
    if Assigned(FservicesobjectRefAxContractDate) then
      servicesobjectRefAxContractDate.Free;
    if Assigned(FservicesobjectRefProjAgreeSumma) then
      servicesobjectRefProjAgreeSumma.Free;
    if Assigned(FservicesobjectRefTopographySumma) then
      servicesobjectRefTopographySumma.Free;
    if Assigned(FservicesobjectRefBoundaryDateWork) then
      servicesobjectRefBoundaryDateWork.Free;
    if Assigned(FservicesobjectRefFactDateWork) then
      servicesobjectRefFactDateWork.Free;
    inherited Destroy;
  end;

  destructor ENAdditionalAgreementShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAdditionalAgreement, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAdditionalAgreement');
  RemClassRegistry.RegisterXSClass(ENAdditionalAgreementRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAdditionalAgreementRef');
  RemClassRegistry.RegisterXSClass(ENAdditionalAgreementFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAdditionalAgreementFilter');
  RemClassRegistry.RegisterXSClass(ENAdditionalAgreementShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAdditionalAgreementShort');
  RemClassRegistry.RegisterXSClass(ENAdditionalAgreementShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAdditionalAgreementShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAdditionalAgreementShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAdditionalAgreementShort');

  InvRegistry.RegisterInterface(TypeInfo(ENAdditionalAgreementControllerSoapPort), 'http://ksoe.org/ENAdditionalAgreementController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAdditionalAgreementControllerSoapPort), 'http://ksoe.org/ENAdditionalAgreementController/action/ENAdditionalAgreementController.%operationName%');


end.
