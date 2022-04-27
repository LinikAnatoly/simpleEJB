unit ENSOBillController;

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

  ENSOBill            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSOBillRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSOBill = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FsumTotal : TXSDecimal;
    FsumGen : TXSDecimal;
    FsumVat : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FservicesObjectRef : ENServicesObjectRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property sumTotal : TXSDecimal read FsumTotal write FsumTotal;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property sumVat : TXSDecimal read FsumVat write FsumVat;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property servicesObjectRef : ENServicesObjectRef read FservicesObjectRef write FservicesObjectRef;
  end;

{
  ENSOBillFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FsumTotal : TXSDecimal;
    FsumGen : TXSDecimal;
    FsumVat : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FservicesObjectRef : ENServicesObjectRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property sumTotal : TXSDecimal read FsumTotal write FsumTotal;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property sumVat : TXSDecimal read FsumVat write FsumVat;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property servicesObjectRef : ENServicesObjectRef read FservicesObjectRef write FservicesObjectRef;
  end;
}

  ENSOBillFilter = class(ENSOBill)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSOBillShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
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
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
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
  end;

  ArrayOfENSOBillShort = array of ENSOBillShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSOBillShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSOBillShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSOBillShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSOBillController/message/
  // soapAction: http://ksoe.org/ENSOBillController/action/ENSOBillController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSOBillControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSOBillController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSOBillControllerSoapPort = interface(IInvokable)
  ['{87FE9740-0BA6-4B36-9F4F-8383BD0B0CB2}']
    function add(const aENSOBill: ENSOBill): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSOBill: ENSOBill); stdcall;
    function getObject(const anObjectCode: Integer): ENSOBill; stdcall;
    function getList: ENSOBillShortList; stdcall;
    function getFilteredList(const aENSOBillFilter: ENSOBillFilter): ENSOBillShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSOBillShortList; stdcall;
    function getScrollableFilteredList(const aENSOBillFilter: ENSOBillFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSOBillShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSOBillShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSOBillFilter: ENSOBillFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSOBillShort; stdcall;
    function getSumByActs(const aENSOBill: ENSOBill): Double; stdcall;
  end;


implementation

  destructor ENSOBill.Destroy;
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
    inherited Destroy;
  end;

{
  destructor ENSOBillFilter.Destroy;
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
    inherited Destroy;
  end;
}

  destructor ENSOBillFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSOBillShort.Destroy;
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
    inherited Destroy;
  end;

  destructor ENSOBillShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSOBill, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOBill');
  RemClassRegistry.RegisterXSClass(ENSOBillRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOBillRef');
  RemClassRegistry.RegisterXSClass(ENSOBillFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOBillFilter');
  RemClassRegistry.RegisterXSClass(ENSOBillShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOBillShort');
  RemClassRegistry.RegisterXSClass(ENSOBillShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOBillShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSOBillShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSOBillShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSOBillControllerSoapPort), 'http://ksoe.org/ENSOBillController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSOBillControllerSoapPort), 'http://ksoe.org/ENSOBillController/action/ENSOBillController.%operationName%');


end.
