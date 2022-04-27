unit RQBillController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQOrgController
   ,RQBillStatusController
   ,RQOrgRschetController
   ,RQBillTypeController
   ,ENGeneralContractsController
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

  RQBill            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBillRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBill = class(TRemotable)
  private
    Fcode : Integer;
    FnumberDoc : WideString;
    FnumberProject : WideString;
    FdateGen : TXSDate;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FdeliveryDays : TXSDecimal;
    Fvat : TXSDecimal;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocId : Integer;
    FsumWithNds : TXSDecimal;
    FpersonalAccount : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Forg : RQOrg;
//???
    FstatusRef : RQBillStatusRef;
//???
    ForgRschet : RQOrgRschet;
//???
    FbillType : RQBillType;
//???
    FgeneralContractRef : ENGeneralContractsRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property numberProject : WideString read FnumberProject write FnumberProject;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property deliveryDays : TXSDecimal read FdeliveryDays write FdeliveryDays;
    property vat : TXSDecimal read Fvat write Fvat;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocId : Integer read FfinDocId write FfinDocId;
    property sumWithNds : TXSDecimal read FsumWithNds write FsumWithNds;
    property personalAccount : WideString read FpersonalAccount write FpersonalAccount;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property org : RQOrg read Forg write Forg;
    property statusRef : RQBillStatusRef read FstatusRef write FstatusRef;
    property orgRschet : RQOrgRschet read ForgRschet write ForgRschet;
    property billType : RQBillType read FbillType write FbillType;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
  end;

{
  RQBillFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnumberDoc : WideString;
    FnumberProject : WideString;
    FdateGen : TXSDate;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FdeliveryDays : TXSDecimal;
    Fvat : TXSDecimal;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocId : Integer;
    FsumWithNds : TXSDecimal;
    FpersonalAccount : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Forg : RQOrg;
//???
    FstatusRef : RQBillStatusRef;
//???
    ForgRschet : RQOrgRschet;
//???
    FbillType : RQBillType;
//???
    FgeneralContractRef : ENGeneralContractsRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property numberProject : WideString read FnumberProject write FnumberProject;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property deliveryDays : TXSDecimal read FdeliveryDays write FdeliveryDays;
    property vat : TXSDecimal read Fvat write Fvat;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocId : Integer read FfinDocId write FfinDocId;
    property sumWithNds : TXSDecimal read FsumWithNds write FsumWithNds;
    property personalAccount : WideString read FpersonalAccount write FpersonalAccount;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property org : RQOrg read Forg write Forg;
    property statusRef : RQBillStatusRef read FstatusRef write FstatusRef;
    property orgRschet : RQOrgRschet read ForgRschet write ForgRschet;
    property billType : RQBillType read FbillType write FbillType;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
  end;
}

  RQBillFilter = class(RQBill)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQBillShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumberDoc : WideString;
    FnumberProject : WideString;
    FdateGen : TXSDate;
    FuserGen : WideString;
    FdeliveryDays : TXSDecimal;
    Fvat : TXSDecimal;
    FcontractNumber : WideString;
    FfinDocCode : WideString;
    FsumWithNds : TXSDecimal;
    FpersonalAccount : WideString;
    ForgCode : Integer;
    ForgId : Integer;
    ForgCodeorg : WideString;
    ForgName : WideString;
    ForgUkr_name : WideString;
    ForgOkpo : WideString;
    ForgNalog_num : WideString;
    ForgSvidet_num : WideString;
    ForgAdr : WideString;
    ForgTel : WideString;
    ForgCountry : WideString;
    ForgRegion : WideString;
    ForgMinistry : WideString;
    ForgOwnership : Integer;
    ForgType : WideString;
    ForgMaster_code : WideString;
    ForgDate_svidet : TXSDate;
    ForgLikv_date : TXSDate;
    ForgExcept_flag : WideString;
    ForgLikv_flag : WideString;
    ForgBudget_flag : WideString;
    ForgDate_nalogform : TXSDate;
    ForgId_nalogform : Integer;
    ForgAdr_legal : WideString;
    ForgPrimechan : WideString;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;
    ForgRschetCode : Integer;
    ForgRschetId : Integer;
    ForgRschetMfo : WideString;
    ForgRschetRschet : WideString;
    FbillTypeCode : Integer;
    FbillTypeName : WideString;

    FsumGen : TXSDecimal;
    Fstate : WideString;
    FcontractDate : TXSDate;
    FfinDocId : Integer;

    FgeneralContractRefCode : Integer;
    FgeneralContractRefFinDocID : Integer;
    FgeneralContractRefFinDocCode : WideString;
    FgeneralContractRefContractNumber : WideString;
    FgeneralContractRefContractDate : TXSDate;
    FgeneralContractRefCommentGen : WideString;
    FgeneralContractRefPartnerId : Integer;
    FgeneralContractRefPartnerCode : WideString;
    FgeneralContractRefPartnerName : WideString;
    FgeneralContractRefContractRegDate : TXSDate;
    FgeneralContractRefContractStartDate : TXSDate;
    FgeneralContractRefContractEndDate : TXSDate;
    FgeneralContractRefAxContractId : WideString;
    FgeneralContractRefAxContractCode : WideString;
    FgeneralContractRefAxContractNumber : WideString;
    FgeneralContractRefAxContractAccount : WideString;
    FgeneralContractRefAxContractDate : TXSDate;
    FgeneralContractRefAxContractCommentGen : WideString;
    FgeneralContractRefAxContractGroupCode : WideString;
    FgeneralContractRefAxPartnerCode : WideString;
    FgeneralContractRefAxPartnerName : WideString;
    FgeneralContractRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property numberProject : WideString read FnumberProject write FnumberProject;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property userGen : WideString read FuserGen write FuserGen;
    property deliveryDays : TXSDecimal read FdeliveryDays write FdeliveryDays;
    property vat : TXSDecimal read Fvat write Fvat;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property sumWithNds : TXSDecimal read FsumWithNds write FsumWithNds;
    property personalAccount : WideString read FpersonalAccount write FpersonalAccount;

    property orgCode : Integer read ForgCode write ForgCode;
    property orgId : Integer read ForgId write ForgId;
    property orgCodeorg : WideString read ForgCodeorg write ForgCodeorg;
    property orgName : WideString read ForgName write ForgName;
    property orgUkr_name : WideString read ForgUkr_name write ForgUkr_name;
    property orgOkpo : WideString read ForgOkpo write ForgOkpo;
    property orgNalog_num : WideString read ForgNalog_num write ForgNalog_num;
    property orgSvidet_num : WideString read ForgSvidet_num write ForgSvidet_num;
    property orgAdr : WideString read ForgAdr write ForgAdr;
    property orgTel : WideString read ForgTel write ForgTel;
    property orgCountry : WideString read ForgCountry write ForgCountry;
    property orgRegion : WideString read ForgRegion write ForgRegion;
    property orgMinistry : WideString read ForgMinistry write ForgMinistry;
    property orgOwnership : Integer read ForgOwnership write ForgOwnership;
    property orgType : WideString read ForgType write ForgType;
    property orgMaster_code : WideString read ForgMaster_code write ForgMaster_code;
    property orgDate_svidet : TXSDate read ForgDate_svidet write ForgDate_svidet;
    property orgLikv_date : TXSDate read ForgLikv_date write ForgLikv_date;
    property orgExcept_flag : WideString read ForgExcept_flag write ForgExcept_flag;
    property orgLikv_flag : WideString read ForgLikv_flag write ForgLikv_flag;
    property orgBudget_flag : WideString read ForgBudget_flag write ForgBudget_flag;
    property orgDate_nalogform : TXSDate read ForgDate_nalogform write ForgDate_nalogform;
    property orgId_nalogform : Integer read ForgId_nalogform write ForgId_nalogform;
    property orgAdr_legal : WideString read ForgAdr_legal write ForgAdr_legal;
    property orgPrimechan : WideString read ForgPrimechan write ForgPrimechan;
    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
    property orgRschetCode : Integer read ForgRschetCode write ForgRschetCode;
    property orgRschetId : Integer read ForgRschetId write ForgRschetId;
    property orgRschetMfo : WideString read ForgRschetMfo write ForgRschetMfo;
    property orgRschetRschet : WideString read ForgRschetRschet write ForgRschetRschet;
    property billTypeCode : Integer read FbillTypeCode write FbillTypeCode;
    property billTypeName : WideString read FbillTypeName write FbillTypeName;

    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property state : WideString read Fstate write Fstate;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finDocId : Integer read FfinDocId write FfinDocId;

    property generalContractRefCode : Integer read FgeneralContractRefCode write FgeneralContractRefCode;
    property generalContractRefFinDocID : Integer read FgeneralContractRefFinDocID write FgeneralContractRefFinDocID;
    property generalContractRefFinDocCode : WideString read FgeneralContractRefFinDocCode write FgeneralContractRefFinDocCode;
    property generalContractRefContractNumber : WideString read FgeneralContractRefContractNumber write FgeneralContractRefContractNumber;
    property generalContractRefContractDate : TXSDate read FgeneralContractRefContractDate write FgeneralContractRefContractDate;
    property generalContractRefCommentGen : WideString read FgeneralContractRefCommentGen write FgeneralContractRefCommentGen;
    property generalContractRefPartnerId : Integer read FgeneralContractRefPartnerId write FgeneralContractRefPartnerId;
    property generalContractRefPartnerCode : WideString read FgeneralContractRefPartnerCode write FgeneralContractRefPartnerCode;
    property generalContractRefPartnerName : WideString read FgeneralContractRefPartnerName write FgeneralContractRefPartnerName;
    property generalContractRefContractRegDate : TXSDate read FgeneralContractRefContractRegDate write FgeneralContractRefContractRegDate;
    property generalContractRefContractStartDate : TXSDate read FgeneralContractRefContractStartDate write FgeneralContractRefContractStartDate;
    property generalContractRefContractEndDate : TXSDate read FgeneralContractRefContractEndDate write FgeneralContractRefContractEndDate;
    property generalContractRefAxContractId : WideString read FgeneralContractRefAxContractId write FgeneralContractRefAxContractId;
    property generalContractRefAxContractCode : WideString read FgeneralContractRefAxContractCode write FgeneralContractRefAxContractCode;
    property generalContractRefAxContractNumber : WideString read FgeneralContractRefAxContractNumber write FgeneralContractRefAxContractNumber;
    property generalContractRefAxContractAccount : WideString read FgeneralContractRefAxContractAccount write FgeneralContractRefAxContractAccount;
    property generalContractRefAxContractDate : TXSDate read FgeneralContractRefAxContractDate write FgeneralContractRefAxContractDate;
    property generalContractRefAxContractCommentGen : WideString read FgeneralContractRefAxContractCommentGen write FgeneralContractRefAxContractCommentGen;
    property generalContractRefAxContractGroupCode : WideString read FgeneralContractRefAxContractGroupCode write FgeneralContractRefAxContractGroupCode;
    property generalContractRefAxPartnerCode : WideString read FgeneralContractRefAxPartnerCode write FgeneralContractRefAxPartnerCode;
    property generalContractRefAxPartnerName : WideString read FgeneralContractRefAxPartnerName write FgeneralContractRefAxPartnerName;
    property generalContractRefUserGen : WideString read FgeneralContractRefUserGen write FgeneralContractRefUserGen;
  end;

  ArrayOfRQBillShort = array of RQBillShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQBillShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQBillShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQBillShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQBillController/message/
  // soapAction: http://ksoe.org/RQBillController/action/RQBillController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQBillControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQBillController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQBillControllerSoapPort = interface(IInvokable)
  ['{66830616-97CF-4898-880E-05474B615CFE}']
    function add(const aRQBill: RQBill): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQBill: RQBill); stdcall;
    function getObject(const anObjectCode: Integer): RQBill; stdcall;
    function getList: RQBillShortList; stdcall;
    function getFilteredList(const aRQBillFilter: RQBillFilter): RQBillShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQBillShortList; stdcall;
    function getScrollableFilteredList(const aRQBillFilter: RQBillFilter; const aFromPosition: Integer; const aQuantity: Integer): RQBillShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQBillShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQBillFilter: RQBillFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQBillShort; stdcall;

    procedure confirmBill(const billCode : Integer); stdcall;
    procedure confirmBillServices(const billCode : Integer); stdcall;
    procedure unConfirmBill(const billCode : Integer); stdcall;
    procedure unConfirmBillServices(const billCode : Integer); stdcall;
    procedure addAGSpecification(const aRQBill: RQBill); stdcall;

    function  addBillByTmc(const aRQBill: RQBill): Integer; stdcall;
    function  addBillByServices(const aRQBill: RQBill): Integer; stdcall;
    procedure removeBillByTmc(const anObjectCode: Integer); stdcall;
    procedure removeBillByServices(const anObjectCode: Integer); stdcall;
  end;


implementation

  destructor RQBill.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdeliveryDays) then
      deliveryDays.Free;
    if Assigned(Fvat) then
      vat.Free;
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FsumWithNds) then
      sumWithNds.Free;
    if Assigned(Forg) then
      org.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(ForgRschet) then
      orgRschet.Free;
    if Assigned(FbillType) then
      billType.Free;
    if Assigned(FgeneralContractRef) then
      generalContractRef.Free;
    inherited Destroy;
  end;

{
  destructor RQBillFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdeliveryDays) then
      deliveryDays.Free;
    if Assigned(Fvat) then
      vat.Free;
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FsumWithNds) then
      sumWithNds.Free;
    if Assigned(Forg) then
      org.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(ForgRschet) then
      orgRschet.Free;
    if Assigned(FbillType) then
      billType.Free;
    if Assigned(FgeneralContractRef) then
      generalContractRef.Free;
    inherited Destroy;
  end;
}

  destructor RQBillFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQBillShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdeliveryDays) then
      deliveryDays.Free;
    if Assigned(Fvat) then
      vat.Free;
    if Assigned(FsumWithNds) then
      sumWithNds.Free;
    if Assigned(ForgDate_svidet) then
      orgDate_svidet.Free;
    if Assigned(ForgLikv_date) then
      orgLikv_date.Free;
    if Assigned(ForgDate_nalogform) then
      orgDate_nalogform.Free;
    if Assigned(FgeneralContractRefContractDate) then
      generalContractRefContractDate.Free;
    if Assigned(FgeneralContractRefContractRegDate) then
      generalContractRefContractRegDate.Free;
    if Assigned(FgeneralContractRefContractStartDate) then
      generalContractRefContractStartDate.Free;
    if Assigned(FgeneralContractRefContractEndDate) then
      generalContractRefContractEndDate.Free;
    if Assigned(FgeneralContractRefAxContractDate) then
      generalContractRefAxContractDate.Free;
    inherited Destroy;
  end;

  destructor RQBillShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQBill, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBill');
  RemClassRegistry.RegisterXSClass(RQBillRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillRef');
  RemClassRegistry.RegisterXSClass(RQBillFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillFilter');
  RemClassRegistry.RegisterXSClass(RQBillShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillShort');
  RemClassRegistry.RegisterXSClass(RQBillShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQBillShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQBillShort');

  InvRegistry.RegisterInterface(TypeInfo(RQBillControllerSoapPort), 'http://ksoe.org/RQBillController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQBillControllerSoapPort), 'http://ksoe.org/RQBillController/action/RQBillController.%operationName%');


end.
