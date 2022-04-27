unit ENFamilySize2ServicesObjectController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENServicesObjectController
   ,ENFamilyRelationController
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

  ENFamilySize2ServicesObject            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFamilySize2ServicesObjectRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFamilySize2ServicesObject = class(TRemotable)
  private
    Fcode : Integer;
    FFIO : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FservicesObjectRef : ENServicesObjectRef;
//???
    FrelationRef : ENFamilyRelationRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property FIO : WideString read FFIO write FFIO;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property servicesObjectRef : ENServicesObjectRef read FservicesObjectRef write FservicesObjectRef;
    property relationRef : ENFamilyRelationRef read FrelationRef write FrelationRef;
  end;

{
  ENFamilySize2ServicesObjectFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FFIO : WideString;
    FuserGen : WideString;
    FdateEdit : DateTime;
    Fmodify_time : Int64;
//???
    FservicesObjectRef : ENServicesObjectRef;
//???
    FrelationRef : ENFamilyRelationRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property FIO : WideString read FFIO write FFIO;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property servicesObjectRef : ENServicesObjectRef read FservicesObjectRef write FservicesObjectRef;
    property relationRef : ENFamilyRelationRef read FrelationRef write FrelationRef;
  end;
}

  ENFamilySize2ServicesObjectFilter = class(ENFamilySize2ServicesObject)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENFamilySize2ServicesObjectShort = class(TRemotable)
  private
    Fcode : Integer;
    FFIO : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
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
    FservicesObjectRefCnPackCode : Integer;
    FservicesObjectRefDfPackCode : Integer;
    FservicesObjectRefCountersZoneType : Integer;
    FrelationRefCode : Integer;
    FrelationRefRelation : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property FIO : WideString read FFIO write FFIO;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

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
    property servicesObjectRefCnPackCode : Integer read FservicesObjectRefCnPackCode write FservicesObjectRefCnPackCode;
    property servicesObjectRefDfPackCode : Integer read FservicesObjectRefDfPackCode write FservicesObjectRefDfPackCode;
    property servicesObjectRefCountersZoneType : Integer read FservicesObjectRefCountersZoneType write FservicesObjectRefCountersZoneType;
    property relationRefCode : Integer read FrelationRefCode write FrelationRefCode;
    property relationRefRelation : WideString read FrelationRefRelation write FrelationRefRelation;
  end;

  ArrayOfENFamilySize2ServicesObjectShort = array of ENFamilySize2ServicesObjectShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENFamilySize2ServicesObjectShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENFamilySize2ServicesObjectShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENFamilySize2ServicesObjectShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENFamilySize2ServicesObjectController/message/
  // soapAction: http://ksoe.org/ENFamilySize2ServicesObjectController/action/ENFamilySize2ServicesObjectController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENFamilySize2ServicesObjectControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENFamilySize2ServicesObjectController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENFamilySize2ServicesObjectControllerSoapPort = interface(IInvokable)
  ['{503D6939-E99B-4F3C-B553-7419ABB5FC3A}']
    function add(const aENFamilySize2ServicesObject: ENFamilySize2ServicesObject): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENFamilySize2ServicesObject: ENFamilySize2ServicesObject); stdcall;
    function getObject(const anObjectCode: Integer): ENFamilySize2ServicesObject; stdcall;
    function getList: ENFamilySize2ServicesObjectShortList; stdcall;
    function getFilteredList(const aENFamilySize2ServicesObjectFilter: ENFamilySize2ServicesObjectFilter): ENFamilySize2ServicesObjectShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENFamilySize2ServicesObjectShortList; stdcall;
    function getScrollableFilteredList(const aENFamilySize2ServicesObjectFilter: ENFamilySize2ServicesObjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ENFamilySize2ServicesObjectShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENFamilySize2ServicesObjectShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENFamilySize2ServicesObjectFilter: ENFamilySize2ServicesObjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENFamilySize2ServicesObjectShort; stdcall;
  end;


implementation

  destructor ENFamilySize2ServicesObject.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FservicesObjectRef) then
      servicesObjectRef.Free;
    if Assigned(FrelationRef) then
      relationRef.Free;
    inherited Destroy;
  end;

{
  destructor ENFamilySize2ServicesObjectFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FservicesObjectRef) then
      servicesObjectRef.Free;
    if Assigned(FrelationRef) then
      relationRef.Free;
    inherited Destroy;
  end;
}

  destructor ENFamilySize2ServicesObjectFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENFamilySize2ServicesObjectShort.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
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
    inherited Destroy;
  end;

  destructor ENFamilySize2ServicesObjectShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENFamilySize2ServicesObject, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFamilySize2ServicesObject');
  RemClassRegistry.RegisterXSClass(ENFamilySize2ServicesObjectRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFamilySize2ServicesObjectRef');
  RemClassRegistry.RegisterXSClass(ENFamilySize2ServicesObjectFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFamilySize2ServicesObjectFilter');
  RemClassRegistry.RegisterXSClass(ENFamilySize2ServicesObjectShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFamilySize2ServicesObjectShort');
  RemClassRegistry.RegisterXSClass(ENFamilySize2ServicesObjectShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFamilySize2ServicesObjectShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENFamilySize2ServicesObjectShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENFamilySize2ServicesObjectShort');

  InvRegistry.RegisterInterface(TypeInfo(ENFamilySize2ServicesObjectControllerSoapPort), 'http://ksoe.org/ENFamilySize2ServicesObjectController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENFamilySize2ServicesObjectControllerSoapPort), 'http://ksoe.org/ENFamilySize2ServicesObjectController/action/ENFamilySize2ServicesObjectController.%operationName%');


end.
