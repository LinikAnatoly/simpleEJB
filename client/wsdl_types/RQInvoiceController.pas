unit RQInvoiceController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQOrgController 
   ,RQInvoiceStatusController
   ,RQOrderItemController
   ,RQOrgRschetController     
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
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"

  RQInvoice            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQInvoiceRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQInvoice = class(TRemotable)
  private
    Fcode : Integer; 
    FnumberDoc : WideString;
    FnumberProject : WideString;
    FdateGen : TXSDate;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fvat : TXSDecimal;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Forg : RQOrg;
//???
    FstatusRef : RQInvoiceStatusRef;
    ForgRschet : RQOrgRschet;
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
    property vat : TXSDecimal read Fvat write Fvat; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property org : RQOrg read Forg write Forg; 
    property statusRef : RQInvoiceStatusRef read FstatusRef write FstatusRef;
    property orgRschet : RQOrgRschet read ForgRschet write ForgRschet;      
  end;

  RQInvoiceFilter = class(TRemotable)
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
    Fvat : TXSDecimal;
	Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Forg : RQOrg;
//???
    FstatusRef : RQInvoiceStatusRef;
    ForgRschet : RQOrgRschet;
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
    property vat : TXSDecimal read Fvat write Fvat; 
	property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property org : RQOrg read Forg write Forg; 
    property statusRef : RQInvoiceStatusRef read FstatusRef write FstatusRef;
    property orgRschet : RQOrgRschet read ForgRschet write ForgRschet; 
  end;


  RQInvoiceShort = class(TRemotable)
  private
    Fcode : Integer; 
    FnumberDoc : WideString;
    FnumberProject : WideString;
    FdateGen : TXSDate;
    FuserGen : WideString;
    Fvat : TXSDecimal;
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
    FsumGen : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property numberProject : WideString read FnumberProject write FnumberProject;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property userGen : WideString read FuserGen write FuserGen;
    property vat : TXSDecimal read Fvat write Fvat; 
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
    property sumGen : TXSDecimal read FsumGen write FsumGen;
  end;

  ArrayOfRQInvoiceShort = array of RQInvoiceShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQInvoiceShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQInvoiceShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQInvoiceShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQInvoiceController/message/
  // soapAction: http://ksoe.org/RQInvoiceController/action/RQInvoiceController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQInvoiceControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQInvoiceController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQInvoiceControllerSoapPort = interface(IInvokable)
  ['{37503750-3750-3750-3750-375037503750}']
    function  add(const aRQInvoice: RQInvoice): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQInvoice: RQInvoice); stdcall;
    function  getObject(const anObjectCode: Integer): RQInvoice; stdcall;
    function  getList: RQInvoiceShortList; stdcall;
    function  getFilteredList(const aRQInvoiceFilter: RQInvoiceFilter): RQInvoiceShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQInvoiceShortList; stdcall;
    function  getScrollableFilteredList(const aRQInvoiceFilter: RQInvoiceFilter; const aFromPosition: Integer; const aQuantity: Integer): RQInvoiceShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQInvoiceShortList; stdcall;

    procedure confirmInvoice(const orderCode : Integer); stdcall;
    procedure unConfirmInvoice(const orderCode : Integer); stdcall;
  end;


implementation

  destructor RQInvoice.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fvat) then
      vat.Free;
    if Assigned(Forg) then
      org.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(ForgRschet) then
      orgRschet.Free;
    inherited Destroy;
  end;
  
  destructor RQInvoiceFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fvat) then
      vat.Free;
    if Assigned(Forg) then
      org.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(ForgRschet) then
      orgRschet.Free;
    inherited Destroy;
  end; 
  
  destructor RQInvoiceShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(Fvat) then
      vat.Free;
    if Assigned(ForgDate_svidet) then
      orgDate_svidet.Free;
    if Assigned(ForgLikv_date) then
      orgLikv_date.Free;
    if Assigned(ForgDate_nalogform) then
      orgDate_nalogform.Free;
    inherited Destroy;
  end; 
  
  destructor RQInvoiceShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQInvoice, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoice');
  RemClassRegistry.RegisterXSClass(RQInvoiceRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceRef');
  RemClassRegistry.RegisterXSClass(RQInvoiceFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceFilter');
  RemClassRegistry.RegisterXSClass(RQInvoiceShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceShort');
  RemClassRegistry.RegisterXSClass(RQInvoiceShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQInvoiceShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQInvoiceShort');

  InvRegistry.RegisterInterface(TypeInfo(RQInvoiceControllerSoapPort), 'http://ksoe.org/RQInvoiceController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQInvoiceControllerSoapPort), 'http://ksoe.org/RQInvoiceController/action/RQInvoiceController.%operationName%');


end.
