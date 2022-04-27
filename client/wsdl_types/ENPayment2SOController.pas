unit ENPayment2SOController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENServicesObjectController
   ,ENPayment2SOTypeController
   ,ENSOBillController
   ,RQOrderController
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

  ENPayment2SO            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPayment2SORef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPayment2SO = class(TRemotable)
  private
    Fcode : Integer;
    FdateGen : TXSDate;
    FsumTotal : TXSDecimal;
    FsumGen : TXSDecimal;
    FsumVat : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FservicesObjectRef : ENServicesObjectRef;
//???
    FpaymentTypeRef : ENPayment2SOTypeRef;
//???
    FsoBillRef : ENSOBillRef;
//???
    ForderRef : RQOrderRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property sumTotal : TXSDecimal read FsumTotal write FsumTotal;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property sumVat : TXSDecimal read FsumVat write FsumVat;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property servicesObjectRef : ENServicesObjectRef read FservicesObjectRef write FservicesObjectRef;
    property paymentTypeRef : ENPayment2SOTypeRef read FpaymentTypeRef write FpaymentTypeRef;
    property soBillRef : ENSOBillRef read FsoBillRef write FsoBillRef;
    property orderRef : RQOrderRef read ForderRef write ForderRef;
  end;

{
  ENPayment2SOFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FdateGen : TXSDate;
    FsumTotal : TXSDecimal;
    FsumGen : TXSDecimal;
    FsumVat : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : DateTime;
//???
    FservicesObjectRef : ENServicesObjectRef;
//???
    FpaymentTypeRef : ENPayment2SOTypeRef;
//???
    FsoBillRef : ENSOBillRef;
//???
    ForderRef : RQOrderRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property sumTotal : TXSDecimal read FsumTotal write FsumTotal;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property sumVat : TXSDecimal read FsumVat write FsumVat;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property servicesObjectRef : ENServicesObjectRef read FservicesObjectRef write FservicesObjectRef;
    property paymentTypeRef : ENPayment2SOTypeRef read FpaymentTypeRef write FpaymentTypeRef;
    property soBillRef : ENSOBillRef read FsoBillRef write FsoBillRef;
    property orderRef : RQOrderRef read ForderRef write ForderRef;
  end;
}

  ENPayment2SOFilter = class(ENPayment2SO)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPayment2SOShort = class(TRemotable)
  private
    Fcode : Integer;
    FdateGen : TXSDate;
    FsumTotal : TXSDecimal;
    FsumGen : TXSDecimal;
    FsumVat : TXSDecimal;
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
    FpaymentTypeRefCode : Integer;
    FpaymentTypeRefName : WideString;
    FsoBillRefCode : Integer;
    FsoBillRefDateGen : TXSDate;
    FsoBillRefSumTotal : TXSDecimal;
    FsoBillRefSumGen : TXSDecimal;
    FsoBillRefSumVat : TXSDecimal;
    FsoBillRefUserGen : WideString;
    FsoBillRefDateEdit : TXSDateTime;
    ForderRefCode : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property sumTotal : TXSDecimal read FsumTotal write FsumTotal;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property sumVat : TXSDecimal read FsumVat write FsumVat;
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
    property paymentTypeRefCode : Integer read FpaymentTypeRefCode write FpaymentTypeRefCode;
    property paymentTypeRefName : WideString read FpaymentTypeRefName write FpaymentTypeRefName;
    property soBillRefCode : Integer read FsoBillRefCode write FsoBillRefCode;
    property soBillRefDateGen : TXSDate read FsoBillRefDateGen write FsoBillRefDateGen;
    property soBillRefSumTotal : TXSDecimal read FsoBillRefSumTotal write FsoBillRefSumTotal;
    property soBillRefSumGen : TXSDecimal read FsoBillRefSumGen write FsoBillRefSumGen;
    property soBillRefSumVat : TXSDecimal read FsoBillRefSumVat write FsoBillRefSumVat;
    property soBillRefUserGen : WideString read FsoBillRefUserGen write FsoBillRefUserGen;
    property soBillRefDateEdit : TXSDateTime read FsoBillRefDateEdit write FsoBillRefDateEdit;
  property orderRefCode : Integer read ForderRefCode write ForderRefCode; //RQOrderRef read ForderRefCode write ForderRefCode;
  end;

  ArrayOfENPayment2SOShort = array of ENPayment2SOShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPayment2SOShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPayment2SOShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPayment2SOShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPayment2SOController/message/
  // soapAction: http://ksoe.org/ENPayment2SOController/action/ENPayment2SOController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPayment2SOControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPayment2SOController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPayment2SOControllerSoapPort = interface(IInvokable)
  ['{764169E4-E28D-4247-842A-2DA35F4C52FD}']
    function add(const aENPayment2SO: ENPayment2SO): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPayment2SO: ENPayment2SO); stdcall;
    function getObject(const anObjectCode: Integer): ENPayment2SO; stdcall;
    function getList: ENPayment2SOShortList; stdcall;
    function getFilteredList(const aENPayment2SOFilter: ENPayment2SOFilter): ENPayment2SOShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPayment2SOShortList; stdcall;
    function getScrollableFilteredList(const aENPayment2SOFilter: ENPayment2SOFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPayment2SOShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPayment2SOShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENPayment2SOFilter: ENPayment2SOFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENPayment2SOShort; stdcall;
  end;


implementation

  destructor ENPayment2SO.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FsumTotal) then
      sumTotal.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FsumVat) then
      sumVat.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FservicesObjectRef) then
      servicesObjectRef.Free;
    if Assigned(FpaymentTypeRef) then
      paymentTypeRef.Free;
    if Assigned(FsoBillRef) then
      soBillRef.Free;
    if Assigned(ForderRef) then
      orderRef.Free;
    inherited Destroy;
  end;

{
  destructor ENPayment2SOFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FsumTotal) then
      sumTotal.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FsumVat) then
      sumVat.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FservicesObjectRef) then
      servicesObjectRef.Free;
    if Assigned(FpaymentTypeRef) then
      paymentTypeRef.Free;
    if Assigned(FsoBillRef) then
      soBillRef.Free;
    inherited Destroy;
  end;
}

  destructor ENPayment2SOFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENPayment2SOShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FsumTotal) then
      sumTotal.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FsumVat) then
      sumVat.Free;
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
    inherited Destroy;
  end;

  destructor ENPayment2SOShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPayment2SO, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPayment2SO');
  RemClassRegistry.RegisterXSClass(ENPayment2SORef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPayment2SORef');
  RemClassRegistry.RegisterXSClass(ENPayment2SOFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPayment2SOFilter');
  RemClassRegistry.RegisterXSClass(ENPayment2SOShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPayment2SOShort');
  RemClassRegistry.RegisterXSClass(ENPayment2SOShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPayment2SOShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPayment2SOShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPayment2SOShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPayment2SOControllerSoapPort), 'http://ksoe.org/ENPayment2SOController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPayment2SOControllerSoapPort), 'http://ksoe.org/ENPayment2SOController/action/ENPayment2SOController.%operationName%');


end.
