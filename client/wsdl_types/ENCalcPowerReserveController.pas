unit ENCalcPowerReserveController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENServicesObjectController
   ,ENGauge150Controller
   ,ENFiderGuageController
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

  ENCalcPowerReserve            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCalcPowerReserveRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCalcPowerReserve = class(TRemotable)
  private
    Fcode : Integer;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FservicesobjectRef : ENServicesObjectRef;
//???
    Fgauge150Ref : ENGauge150Ref;
//???
    FgaugeRef : ENFiderGuageRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property servicesobjectRef : ENServicesObjectRef read FservicesobjectRef write FservicesobjectRef;
    property gauge150Ref : ENGauge150Ref read Fgauge150Ref write Fgauge150Ref;
    property gaugeRef : ENFiderGuageRef read FgaugeRef write FgaugeRef;
  end;

{
  ENCalcPowerReserveFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : DateTime;
    FuserGen : WideString;
    FdateEdit : DateTime;
//???
    FservicesobjectRef : ENServicesObjectRef;
//???
    Fgauge150Ref : ENGauge150Ref;
//???
    FgaugeRef : ENFiderGuageRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property servicesobjectRef : ENServicesObjectRef read FservicesobjectRef write FservicesobjectRef;
    property gauge150Ref : ENGauge150Ref read Fgauge150Ref write Fgauge150Ref;
    property gaugeRef : ENFiderGuageRef read FgaugeRef write FgaugeRef;
  end;
}

  ENCalcPowerReserveFilter = class(ENCalcPowerReserve)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENCalcPowerReserveShort = class(TRemotable)
  private
    Fcode : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
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
    Fgauge150RefCode : Integer;
    FgaugeRefCode : Integer;

    Fgvalues : WideString;
    Fgdate : TXSDate;
    Ftrname : WideString;
	  Ftrtypename : WideString;
	  Ftrnominalpower : Integer;
    Fsubsname : WideString;

  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

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
    property gauge150RefCode : Integer read Fgauge150RefCode write Fgauge150RefCode;
    property gaugeRefCode : Integer read FgaugeRefCode write FgaugeRefCode;

    property gvalues : WideString read Fgvalues write Fgvalues;
    property gdate : TXSDate read Fgdate write Fgdate;
    property trname : WideString read Ftrname write Ftrname;
	  property trtypename : WideString read Ftrtypename write Ftrtypename;
	  property trnominalpower : Integer read Ftrnominalpower write Ftrnominalpower;
    property subsname : WideString read Fsubsname write Fsubsname;


  end;

  ArrayOfENCalcPowerReserveShort = array of ENCalcPowerReserveShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENCalcPowerReserveShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENCalcPowerReserveShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENCalcPowerReserveShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENCalcPowerReserveController/message/
  // soapAction: http://ksoe.org/ENCalcPowerReserveController/action/ENCalcPowerReserveController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENCalcPowerReserveControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENCalcPowerReserveController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENCalcPowerReserveControllerSoapPort = interface(IInvokable)
  ['{05A5C47E-3476-469A-AEF5-4F07F2A1F3D0}']
    function add(const aENCalcPowerReserve: ENCalcPowerReserve): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENCalcPowerReserve: ENCalcPowerReserve); stdcall;
    function getObject(const anObjectCode: Integer): ENCalcPowerReserve; stdcall;
    function getList: ENCalcPowerReserveShortList; stdcall;
    function getFilteredList(const aENCalcPowerReserveFilter: ENCalcPowerReserveFilter): ENCalcPowerReserveShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENCalcPowerReserveShortList; stdcall;
    function getScrollableFilteredList(const aENCalcPowerReserveFilter: ENCalcPowerReserveFilter; const aFromPosition: Integer; const aQuantity: Integer): ENCalcPowerReserveShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENCalcPowerReserveShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENCalcPowerReserveFilter: ENCalcPowerReserveFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENCalcPowerReserveShort; stdcall;
    procedure generatePowerReserve(const aENCalcPowerReserve: ENCalcPowerReserve); stdcall;
  end;


implementation

  destructor ENCalcPowerReserve.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FservicesobjectRef) then
      servicesobjectRef.Free;
    if Assigned(Fgauge150Ref) then
      gauge150Ref.Free;
    if Assigned(FgaugeRef) then
      gaugeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENCalcPowerReserveFilter.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FservicesobjectRef) then
      servicesobjectRef.Free;
    if Assigned(Fgauge150Ref) then
      gauge150Ref.Free;
    if Assigned(FgaugeRef) then
      gaugeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENCalcPowerReserveFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENCalcPowerReserveShort.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
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

  destructor ENCalcPowerReserveShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENCalcPowerReserve, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCalcPowerReserve');
  RemClassRegistry.RegisterXSClass(ENCalcPowerReserveRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCalcPowerReserveRef');
  RemClassRegistry.RegisterXSClass(ENCalcPowerReserveFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCalcPowerReserveFilter');
  RemClassRegistry.RegisterXSClass(ENCalcPowerReserveShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCalcPowerReserveShort');
  RemClassRegistry.RegisterXSClass(ENCalcPowerReserveShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCalcPowerReserveShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENCalcPowerReserveShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENCalcPowerReserveShort');

  InvRegistry.RegisterInterface(TypeInfo(ENCalcPowerReserveControllerSoapPort), 'http://ksoe.org/ENCalcPowerReserveController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENCalcPowerReserveControllerSoapPort), 'http://ksoe.org/ENCalcPowerReserveController/action/ENCalcPowerReserveController.%operationName%');


end.
