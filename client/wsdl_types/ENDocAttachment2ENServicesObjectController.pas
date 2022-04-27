unit ENDocAttachment2ENServicesObjectController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENDocAttachmentController
   ,ENServicesObjectController
   ,ENAttachment2ServicesKindController
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

  ENDocAttachment2ENServicesObject            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDocAttachment2ENServicesObjectRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDocAttachment2ENServicesObject = class(TRemotable)
  private
    Fcode : Integer;
//???
    FdocAttachmentRef : ENDocAttachmentRef;
//???
    FservicesObjectRef : ENServicesObjectRef;
//???
    FkindRef : ENAttachment2ServicesKindRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property docAttachmentRef : ENDocAttachmentRef read FdocAttachmentRef write FdocAttachmentRef;
    property servicesObjectRef : ENServicesObjectRef read FservicesObjectRef write FservicesObjectRef;
    property kindRef : ENAttachment2ServicesKindRef read FkindRef write FkindRef;
  end;

{
  ENDocAttachment2ENServicesObjectFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
//???
    FdocAttachmentRef : ENDocAttachmentRef;
//???
    FservicesObjectRef : ENServicesObjectRef;
//???
    FkindRef : ENAttachment2ServicesKindRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property docAttachmentRef : ENDocAttachmentRef read FdocAttachmentRef write FdocAttachmentRef;
    property servicesObjectRef : ENServicesObjectRef read FservicesObjectRef write FservicesObjectRef;
    property kindRef : ENAttachment2ServicesKindRef read FkindRef write FkindRef;
  end;
}

  ENDocAttachment2ENServicesObjectFilter = class(ENDocAttachment2ENServicesObject)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENDocAttachment2ENServicesObjectShort = class(TRemotable)
  private
    Fcode : Integer;
    FdocAttachmentRefCode : Integer;
    FdocAttachmentRefCommentGen : WideString;
    FdocAttachmentRefFileLink : WideString;
    FdocAttachmentRefUserAdd : WideString;
    FdocAttachmentRefDateAdd : TXSDateTime;
    FdocAttachmentRefUserGen : WideString;
    FdocAttachmentRefDateEdit : TXSDateTime;
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
    FkindRefCode : Integer;
    FkindRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;

    property docAttachmentRefCode : Integer read FdocAttachmentRefCode write FdocAttachmentRefCode;
    property docAttachmentRefCommentGen : WideString read FdocAttachmentRefCommentGen write FdocAttachmentRefCommentGen;
    property docAttachmentRefFileLink : WideString read FdocAttachmentRefFileLink write FdocAttachmentRefFileLink;
    property docAttachmentRefUserAdd : WideString read FdocAttachmentRefUserAdd write FdocAttachmentRefUserAdd;
    property docAttachmentRefDateAdd : TXSDateTime read FdocAttachmentRefDateAdd write FdocAttachmentRefDateAdd;
    property docAttachmentRefUserGen : WideString read FdocAttachmentRefUserGen write FdocAttachmentRefUserGen;
    property docAttachmentRefDateEdit : TXSDateTime read FdocAttachmentRefDateEdit write FdocAttachmentRefDateEdit;
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
    property kindRefCode : Integer read FkindRefCode write FkindRefCode;
    property kindRefName : WideString read FkindRefName write FkindRefName;
  end;

  ArrayOfENDocAttachment2ENServicesObjectShort = array of ENDocAttachment2ENServicesObjectShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDocAttachment2ENServicesObjectShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDocAttachment2ENServicesObjectShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDocAttachment2ENServicesObjectShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDocAttachment2ENServicesObjectController/message/
  // soapAction: http://ksoe.org/ENDocAttachment2ENServicesObjectController/action/ENDocAttachment2ENServicesObjectController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDocAttachment2ENServicesObjectControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDocAttachment2ENServicesObjectController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //

  ENDocAttachment2ENServicesObjectControllerSoapPort = interface(IInvokable)
  ['{01B59CFF-809C-4F11-AFAC-6A61E2837E51}']
    function add(const aENDocAttachment: ENDocAttachment;
             const aFile: ArrayOfByte;
             const fileName: WideString;
             const soCode: Integer) : Integer; stdcall; overload;
    function add(const aENDocAttachment: ENDocAttachment;
             const aFile: ArrayOfByte;
             const fileName: WideString;
             const soCode: Integer;
             const kindCode: Integer) : Integer; stdcall; overload;

    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDocAttachment2ENServicesObject: ENDocAttachment2ENServicesObject); stdcall;
    function getObject(const anObjectCode: Integer): ENDocAttachment2ENServicesObject; stdcall;
    function getList: ENDocAttachment2ENServicesObjectShortList; stdcall;
    function getFilteredList(const aENDocAttachment2ENServicesObjectFilter: ENDocAttachment2ENServicesObjectFilter): ENDocAttachment2ENServicesObjectShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachment2ENServicesObjectShortList; stdcall;
    function getScrollableFilteredList(const aENDocAttachment2ENServicesObjectFilter: ENDocAttachment2ENServicesObjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachment2ENServicesObjectShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachment2ENServicesObjectShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENDocAttachment2ENServicesObjectFilter: ENDocAttachment2ENServicesObjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENDocAttachment2ENServicesObjectShort; stdcall;
  end;



implementation

  destructor ENDocAttachment2ENServicesObject.Destroy;
  begin
    if Assigned(FdocAttachmentRef) then
      docAttachmentRef.Free;
    if Assigned(FservicesObjectRef) then
      servicesObjectRef.Free;
    if Assigned(FkindRef) then
      kindRef.Free;
    inherited Destroy;
  end;

{
  destructor ENDocAttachment2ENServicesObjectFilter.Destroy;
  begin
    if Assigned(FdocAttachmentRef) then
      docAttachmentRef.Free;
    if Assigned(FservicesObjectRef) then
      servicesObjectRef.Free;
    if Assigned(FkindRef) then
      kindRef.Free;
    inherited Destroy;
  end;
}

  destructor ENDocAttachment2ENServicesObjectFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENDocAttachment2ENServicesObjectShort.Destroy;
  begin
    if Assigned(FdocAttachmentRefDateAdd) then
      docAttachmentRefDateAdd.Free;
    if Assigned(FdocAttachmentRefDateEdit) then
      docAttachmentRefDateEdit.Free;
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
    inherited Destroy;
  end;

  destructor ENDocAttachment2ENServicesObjectShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDocAttachment2ENServicesObject, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachment2ENServicesObject');
  RemClassRegistry.RegisterXSClass(ENDocAttachment2ENServicesObjectRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachment2ENServicesObjectRef');
  RemClassRegistry.RegisterXSClass(ENDocAttachment2ENServicesObjectFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachment2ENServicesObjectFilter');
  RemClassRegistry.RegisterXSClass(ENDocAttachment2ENServicesObjectShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachment2ENServicesObjectShort');
  RemClassRegistry.RegisterXSClass(ENDocAttachment2ENServicesObjectShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachment2ENServicesObjectShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDocAttachment2ENServicesObjectShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDocAttachment2ENServicesObjectShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDocAttachment2ENServicesObjectControllerSoapPort), 'http://ksoe.org/ENDocAttachment2ENServicesObjectController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDocAttachment2ENServicesObjectControllerSoapPort), 'http://ksoe.org/ENDocAttachment2ENServicesObjectController/action/ENDocAttachment2ENServicesObjectController.%operationName%');


end.
