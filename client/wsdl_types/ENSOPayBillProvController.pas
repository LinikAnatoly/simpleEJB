unit ENSOPayBillProvController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENServicesObjectController
   ,ENPayment2SOController
   ,ENSOBillController
   ,ENServicesObject2ProvController
   ,FKProvObjectController
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

  ENSOPayBillProv            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSOPayBillProvRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSOPayBillProv = class(TRemotable)
  private
    Fcode : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FsoRef : ENServicesObjectRef;
//???
    Fpayment2soRef : ENPayment2SORef;
//???
    FsoBillRef : ENSOBillRef;
//???
    Fso2ProvRef : ENServicesObject2ProvRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property soRef : ENServicesObjectRef read FsoRef write FsoRef;
    property payment2soRef : ENPayment2SORef read Fpayment2soRef write Fpayment2soRef;
    property soBillRef : ENSOBillRef read FsoBillRef write FsoBillRef;
    property so2ProvRef : ENServicesObject2ProvRef read Fso2ProvRef write Fso2ProvRef;
  end;

{
  ENSOPayBillProvFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FuserGen : WideString;
    FdateEdit : DateTime;
//???
    FsoRef : ENServicesObjectRef;
//???
    Fpayment2soRef : ENPayment2SORef;
//???
    FsoBillRef : ENSOBillRef;
//???
    Fso2ProvRef : ENServicesObject2ProvRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property soRef : ENServicesObjectRef read FsoRef write FsoRef;
    property payment2soRef : ENPayment2SORef read Fpayment2soRef write Fpayment2soRef;
    property soBillRef : ENSOBillRef read FsoBillRef write FsoBillRef;
    property so2ProvRef : ENServicesObject2ProvRef read Fso2ProvRef write Fso2ProvRef;
  end;
}

  ENSOPayBillProvFilter = class(ENSOPayBillProv)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSOPayBillProvShort = class(TRemotable)
  private
    Fcode : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FsoRefCode : Integer;
    FsoRefContractNumber : WideString;
    FsoRefContractDate : TXSDate;
    FsoRefName : WideString;
    FsoRefPartnerCode : WideString;
    FsoRefFinDocCode : WideString;
    FsoRefFinDocID : Integer;
    FsoRefCommentGen : WideString;
    FsoRefContractNumberServices : WideString;
    FsoRefContractDateServices : TXSDate;
    FsoRefContragentName : WideString;
    FsoRefContragentAddress : WideString;
    FsoRefContragentAddressWork : WideString;
    FsoRefContragentOkpo : WideString;
    FsoRefContragentBankAccount : WideString;
    FsoRefContragentBankName : WideString;
    FsoRefContragentBankMfo : WideString;
    FsoRefContragentBossName : WideString;
    FsoRefContragentPassport : WideString;
    FsoRefContractServicesSumma : TXSDecimal;
    FsoRefContractServicesPower : TXSDecimal;
    FsoRefCommentServicesGen : WideString;
    FsoRefContractServicesDistance : TXSDecimal;
    FsoRefContractServicesDay : TXSDecimal;
    FsoRefUserGen : WideString;
    FsoRefDateEdit : TXSDate;
    FsoRefWarrantDate : TXSDate;
    FsoRefWarrantNumber : WideString;
    FsoRefWarrantFIO : WideString;
    FsoRefRegionalType : Integer;
    FsoRefBasisType : TXSDecimal;
    FsoRefContragentPosition : WideString;
    FsoRefExecuteWorkDate : TXSDate;
    FsoRefTimeStart : TXSDateTime;
    FsoRefTimeFinal : TXSDateTime;
    FsoRefContragentPhoneNumber : WideString;
    FsoRefExecutorPhoneNumber : WideString;
    FsoRefContragentObjectWork : WideString;
    FsoRefIsNoPay : Integer;
    FsoRefIsCustomerMaterials : Integer;
    FsoRefPayDate : TXSDate;
    FsoRefFinPayFormCode : Integer;
    FsoRefFinPayFormName : WideString;
    FsoRefPartnerId : Integer;
    FsoRefPayDetail : WideString;
    FsoRefActTransferNumber : WideString;
    FsoRefActTransferDate : TXSDate;
    FsoRefResposible : WideString;
    FsoRefResposiblePosition : WideString;
    FsoRefResposibleTabNumber : WideString;
    FsoRefPrevContractStatus : Integer;
    FsoRefReconnectionTU : Integer;
    FsoRefPersonalAccountCode : Integer;
    FsoRefPersonalAccountNumber : WideString;
    FsoRefTabNumber : WideString;
    FsoRefCnPackCode : Integer;
    FsoRefDfPackCode : Integer;
    FsoRefCountersZoneType : Integer;
    Fpayment2soRefCode : Integer;
    Fpayment2soRefDateGen : TXSDate;
    Fpayment2soRefSumTotal : TXSDecimal;
    Fpayment2soRefSumGen : TXSDecimal;
    Fpayment2soRefSumVat : TXSDecimal;
    Fpayment2soRefUserGen : WideString;
    Fpayment2soRefDateEdit : TXSDateTime;
    FsoBillRefCode : Integer;
    FsoBillRefDateGen : TXSDate;
    FsoBillRefSumTotal : TXSDecimal;
    FsoBillRefSumGen : TXSDecimal;
    FsoBillRefSumVat : TXSDecimal;
    FsoBillRefUserGen : WideString;
    FsoBillRefDateEdit : TXSDateTime;
    Fso2ProvRefCode : Integer;
    Fso2ProvRefPartId : Integer;
    Fso2ProvRefUserGen : WideString;
    Fso2ProvRefDatePosting : TXSDate;
    Fso2ProvRefDateEdit : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property soRefCode : Integer read FsoRefCode write FsoRefCode;
    property soRefContractNumber : WideString read FsoRefContractNumber write FsoRefContractNumber;
    property soRefContractDate : TXSDate read FsoRefContractDate write FsoRefContractDate;
    property soRefName : WideString read FsoRefName write FsoRefName;
    property soRefPartnerCode : WideString read FsoRefPartnerCode write FsoRefPartnerCode;
    property soRefFinDocCode : WideString read FsoRefFinDocCode write FsoRefFinDocCode;
    property soRefFinDocID : Integer read FsoRefFinDocID write FsoRefFinDocID;
    property soRefCommentGen : WideString read FsoRefCommentGen write FsoRefCommentGen;
    property soRefContractNumberServices : WideString read FsoRefContractNumberServices write FsoRefContractNumberServices;
    property soRefContractDateServices : TXSDate read FsoRefContractDateServices write FsoRefContractDateServices;
    property soRefContragentName : WideString read FsoRefContragentName write FsoRefContragentName;
    property soRefContragentAddress : WideString read FsoRefContragentAddress write FsoRefContragentAddress;
    property soRefContragentAddressWork : WideString read FsoRefContragentAddressWork write FsoRefContragentAddressWork;
    property soRefContragentOkpo : WideString read FsoRefContragentOkpo write FsoRefContragentOkpo;
    property soRefContragentBankAccount : WideString read FsoRefContragentBankAccount write FsoRefContragentBankAccount;
    property soRefContragentBankName : WideString read FsoRefContragentBankName write FsoRefContragentBankName;
    property soRefContragentBankMfo : WideString read FsoRefContragentBankMfo write FsoRefContragentBankMfo;
    property soRefContragentBossName : WideString read FsoRefContragentBossName write FsoRefContragentBossName;
    property soRefContragentPassport : WideString read FsoRefContragentPassport write FsoRefContragentPassport;
    property soRefContractServicesSumma : TXSDecimal read FsoRefContractServicesSumma write FsoRefContractServicesSumma;
    property soRefContractServicesPower : TXSDecimal read FsoRefContractServicesPower write FsoRefContractServicesPower;
    property soRefCommentServicesGen : WideString read FsoRefCommentServicesGen write FsoRefCommentServicesGen;
    property soRefContractServicesDistance : TXSDecimal read FsoRefContractServicesDistance write FsoRefContractServicesDistance;
    property soRefContractServicesDay : TXSDecimal read FsoRefContractServicesDay write FsoRefContractServicesDay;
    property soRefUserGen : WideString read FsoRefUserGen write FsoRefUserGen;
    property soRefDateEdit : TXSDate read FsoRefDateEdit write FsoRefDateEdit;
    property soRefWarrantDate : TXSDate read FsoRefWarrantDate write FsoRefWarrantDate;
    property soRefWarrantNumber : WideString read FsoRefWarrantNumber write FsoRefWarrantNumber;
    property soRefWarrantFIO : WideString read FsoRefWarrantFIO write FsoRefWarrantFIO;
    property soRefRegionalType : Integer read FsoRefRegionalType write FsoRefRegionalType;
    property soRefBasisType : TXSDecimal read FsoRefBasisType write FsoRefBasisType;
    property soRefContragentPosition : WideString read FsoRefContragentPosition write FsoRefContragentPosition;
    property soRefExecuteWorkDate : TXSDate read FsoRefExecuteWorkDate write FsoRefExecuteWorkDate;
    property soRefTimeStart : TXSDateTime read FsoRefTimeStart write FsoRefTimeStart;
    property soRefTimeFinal : TXSDateTime read FsoRefTimeFinal write FsoRefTimeFinal;
    property soRefContragentPhoneNumber : WideString read FsoRefContragentPhoneNumber write FsoRefContragentPhoneNumber;
    property soRefExecutorPhoneNumber : WideString read FsoRefExecutorPhoneNumber write FsoRefExecutorPhoneNumber;
    property soRefContragentObjectWork : WideString read FsoRefContragentObjectWork write FsoRefContragentObjectWork;
    property soRefIsNoPay : Integer read FsoRefIsNoPay write FsoRefIsNoPay;
    property soRefIsCustomerMaterials : Integer read FsoRefIsCustomerMaterials write FsoRefIsCustomerMaterials;
    property soRefPayDate : TXSDate read FsoRefPayDate write FsoRefPayDate;
    property soRefFinPayFormCode : Integer read FsoRefFinPayFormCode write FsoRefFinPayFormCode;
    property soRefFinPayFormName : WideString read FsoRefFinPayFormName write FsoRefFinPayFormName;
    property soRefPartnerId : Integer read FsoRefPartnerId write FsoRefPartnerId;
    property soRefPayDetail : WideString read FsoRefPayDetail write FsoRefPayDetail;
    property soRefActTransferNumber : WideString read FsoRefActTransferNumber write FsoRefActTransferNumber;
    property soRefActTransferDate : TXSDate read FsoRefActTransferDate write FsoRefActTransferDate;
    property soRefResposible : WideString read FsoRefResposible write FsoRefResposible;
    property soRefResposiblePosition : WideString read FsoRefResposiblePosition write FsoRefResposiblePosition;
    property soRefResposibleTabNumber : WideString read FsoRefResposibleTabNumber write FsoRefResposibleTabNumber;
    property soRefPrevContractStatus : Integer read FsoRefPrevContractStatus write FsoRefPrevContractStatus;
    property soRefReconnectionTU : Integer read FsoRefReconnectionTU write FsoRefReconnectionTU;
    property soRefPersonalAccountCode : Integer read FsoRefPersonalAccountCode write FsoRefPersonalAccountCode;
    property soRefPersonalAccountNumber : WideString read FsoRefPersonalAccountNumber write FsoRefPersonalAccountNumber;
    property soRefTabNumber : WideString read FsoRefTabNumber write FsoRefTabNumber;
    property soRefCnPackCode : Integer read FsoRefCnPackCode write FsoRefCnPackCode;
    property soRefDfPackCode : Integer read FsoRefDfPackCode write FsoRefDfPackCode;
    property soRefCountersZoneType : Integer read FsoRefCountersZoneType write FsoRefCountersZoneType;
    property payment2soRefCode : Integer read Fpayment2soRefCode write Fpayment2soRefCode;
    property payment2soRefDateGen : TXSDate read Fpayment2soRefDateGen write Fpayment2soRefDateGen;
    property payment2soRefSumTotal : TXSDecimal read Fpayment2soRefSumTotal write Fpayment2soRefSumTotal;
    property payment2soRefSumGen : TXSDecimal read Fpayment2soRefSumGen write Fpayment2soRefSumGen;
    property payment2soRefSumVat : TXSDecimal read Fpayment2soRefSumVat write Fpayment2soRefSumVat;
    property payment2soRefUserGen : WideString read Fpayment2soRefUserGen write Fpayment2soRefUserGen;
    property payment2soRefDateEdit : TXSDateTime read Fpayment2soRefDateEdit write Fpayment2soRefDateEdit;
    property soBillRefCode : Integer read FsoBillRefCode write FsoBillRefCode;
    property soBillRefDateGen : TXSDate read FsoBillRefDateGen write FsoBillRefDateGen;
    property soBillRefSumTotal : TXSDecimal read FsoBillRefSumTotal write FsoBillRefSumTotal;
    property soBillRefSumGen : TXSDecimal read FsoBillRefSumGen write FsoBillRefSumGen;
    property soBillRefSumVat : TXSDecimal read FsoBillRefSumVat write FsoBillRefSumVat;
    property soBillRefUserGen : WideString read FsoBillRefUserGen write FsoBillRefUserGen;
    property soBillRefDateEdit : TXSDateTime read FsoBillRefDateEdit write FsoBillRefDateEdit;
    property so2ProvRefCode : Integer read Fso2ProvRefCode write Fso2ProvRefCode;
    property so2ProvRefPartId : Integer read Fso2ProvRefPartId write Fso2ProvRefPartId;
    property so2ProvRefUserGen : WideString read Fso2ProvRefUserGen write Fso2ProvRefUserGen;
    property so2ProvRefDatePosting : TXSDate read Fso2ProvRefDatePosting write Fso2ProvRefDatePosting;
    property so2ProvRefDateEdit : TXSDate read Fso2ProvRefDateEdit write Fso2ProvRefDateEdit;
  end;

  ArrayOfENSOPayBillProvShort = array of ENSOPayBillProvShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSOPayBillProvShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSOPayBillProvShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSOPayBillProvShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSOPayBillProvController/message/
  // soapAction: http://ksoe.org/ENSOPayBillProvController/action/ENSOPayBillProvController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSOPayBillProvControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSOPayBillProvController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSOPayBillProvControllerSoapPort = interface(IInvokable)
  ['{129BDD4A-6833-4D10-9B6C-C5A9D232320C}']
    function add(const aENSOPayBillProv: ENSOPayBillProv): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSOPayBillProv: ENSOPayBillProv); stdcall;
    function getObject(const anObjectCode: Integer): ENSOPayBillProv; stdcall;
    function getList: ENSOPayBillProvShortList; stdcall;
    function getFilteredList(const aENSOPayBillProvFilter: ENSOPayBillProvFilter): ENSOPayBillProvShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSOPayBillProvShortList; stdcall;
    function getScrollableFilteredList(const aENSOPayBillProvFilter: ENSOPayBillProvFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSOPayBillProvShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSOPayBillProvShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSOPayBillProvFilter: ENSOPayBillProvFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSOPayBillProvShort; stdcall;

    ///// Методы для передачи проводок в Финансы
    function getPostings4BillList(const soPayBillProvCode : Integer): FKProvObjectShortList; stdcall;
    function moveToFK(const aENSOPayBillProv: ENSOPayBillProv): FKProvResult; stdcall; overload;
    function moveToFK(const aENSOPayBillProv: ENSOPayBillProv;  datePosting : TXSDate): FKProvResult; stdcall; overload;
    function getDatePostings4BillByPayBillProvCode(const soPayBillProvCode : Integer) :  TXSDate; stdcall;
    procedure deleteFromFK(const soPayBillProvCode : Integer); stdcall;
    /////

  end;


implementation


  destructor ENSOPayBillProv.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FsoRef) then
      soRef.Free;
    if Assigned(Fpayment2soRef) then
      payment2soRef.Free;
    if Assigned(FsoBillRef) then
      soBillRef.Free;
    if Assigned(Fso2ProvRef) then
      so2ProvRef.Free;
    inherited Destroy;
  end;

{
  destructor ENSOPayBillProvFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FsoRef) then
      soRef.Free;
    if Assigned(Fpayment2soRef) then
      payment2soRef.Free;
    if Assigned(FsoBillRef) then
      soBillRef.Free;
    if Assigned(Fso2ProvRef) then
      so2ProvRef.Free;
    inherited Destroy;
  end;
}

  destructor ENSOPayBillProvFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSOPayBillProvShort.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FsoRefContractDate) then
      soRefContractDate.Free;
    if Assigned(FsoRefContractDateServices) then
      soRefContractDateServices.Free;
    if Assigned(FsoRefContractServicesSumma) then
      soRefContractServicesSumma.Free;
    if Assigned(FsoRefContractServicesPower) then
      soRefContractServicesPower.Free;
    if Assigned(FsoRefContractServicesDistance) then
      soRefContractServicesDistance.Free;
    if Assigned(FsoRefContractServicesDay) then
      soRefContractServicesDay.Free;
    if Assigned(FsoRefDateEdit) then
      soRefDateEdit.Free;
    if Assigned(FsoRefWarrantDate) then
      soRefWarrantDate.Free;
    if Assigned(FsoRefBasisType) then
      soRefBasisType.Free;
    if Assigned(FsoRefExecuteWorkDate) then
      soRefExecuteWorkDate.Free;
    if Assigned(FsoRefTimeStart) then
      soRefTimeStart.Free;
    if Assigned(FsoRefTimeFinal) then
      soRefTimeFinal.Free;
    if Assigned(FsoRefPayDate) then
      soRefPayDate.Free;
    if Assigned(FsoRefActTransferDate) then
      soRefActTransferDate.Free;
    if Assigned(Fpayment2soRefDateGen) then
      payment2soRefDateGen.Free;
    if Assigned(Fpayment2soRefSumTotal) then
      payment2soRefSumTotal.Free;
    if Assigned(Fpayment2soRefSumGen) then
      payment2soRefSumGen.Free;
    if Assigned(Fpayment2soRefSumVat) then
      payment2soRefSumVat.Free;
    if Assigned(Fpayment2soRefDateEdit) then
      payment2soRefDateEdit.Free;
    if Assigned(FsoBillRefDateGen) then
      soBillRefDateGen.Free;
    if Assigned(FsoBillRefSumTotal) then
      soBillRefSumTotal.Free;
    if Assigned(FsoBillRefSumGen) then
      soBillRefSumGen.Free;
    if Assigned(FsoBillRefSumVat) then
      soBillRefSumVat.Free;
    if Assigned(FsoBillRefDateEdit) then
      soBillRefDateEdit.Free;
    if Assigned(Fso2ProvRefDatePosting) then
      so2ProvRefDatePosting.Free;
    if Assigned(Fso2ProvRefDateEdit) then
      so2ProvRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENSOPayBillProvShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSOPayBillProv, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOPayBillProv');
  RemClassRegistry.RegisterXSClass(ENSOPayBillProvRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOPayBillProvRef');
  RemClassRegistry.RegisterXSClass(ENSOPayBillProvFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOPayBillProvFilter');
  RemClassRegistry.RegisterXSClass(ENSOPayBillProvShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOPayBillProvShort');
  RemClassRegistry.RegisterXSClass(ENSOPayBillProvShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOPayBillProvShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSOPayBillProvShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSOPayBillProvShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSOPayBillProvControllerSoapPort), 'http://ksoe.org/ENSOPayBillProvController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSOPayBillProvControllerSoapPort), 'http://ksoe.org/ENSOPayBillProvController/action/ENSOPayBillProvController.%operationName%');


end.
