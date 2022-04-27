unit RQOrgRschetController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQOrgController
   ,RQOrgBankController
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

  RQOrgRschet            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrgRschetRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrgRschet = class(TRemotable)
  private
    Fcode : Integer;
    Fid : Integer;
    Fmfo : WideString;
    Frschet : WideString;
    Fcurrency_code : WideString;
    Flikv_date : TXSDate;
    Fprimechan : WideString;
    Frschet_type : Integer;
    Frschet_type_id : Integer;
    ForgCodeFK : WideString;
//???
    Forg : RQOrg;
//???
    Fbank : RQOrgBank;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  id : Integer read Fid write Fid;
    property mfo : WideString read Fmfo write Fmfo;
    property rschet : WideString read Frschet write Frschet;
    property currency_code : WideString read Fcurrency_code write Fcurrency_code;
    property likv_date : TXSDate read Flikv_date write Flikv_date;
    property primechan : WideString read Fprimechan write Fprimechan;
    property  rschet_type : Integer read Frschet_type write Frschet_type;
    property  rschet_type_id : Integer read Frschet_type_id write Frschet_type_id;
    property orgCodeFK : WideString read ForgCodeFK write ForgCodeFK;
    property org : RQOrg read Forg write Forg;
    property bank : RQOrgBank read Fbank write Fbank;
  end;

{
  RQOrgRschetFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fid : Integer;
    Fmfo : WideString;
    Frschet : WideString;
    Fcurrency_code : WideString;
    Flikv_date : TXSDate;
    Fprimechan : WideString;
    Frschet_type : Integer;
    Frschet_type_id : Integer;
    ForgCodeFK : WideString;
//???
    Forg : RQOrg;
//???
    Fbank : RQOrgBank;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  id : Integer read Fid write Fid;
    property mfo : WideString read Fmfo write Fmfo;
    property rschet : WideString read Frschet write Frschet;
    property currency_code : WideString read Fcurrency_code write Fcurrency_code;
    property likv_date : TXSDate read Flikv_date write Flikv_date;
    property primechan : WideString read Fprimechan write Fprimechan;
    property  rschet_type : Integer read Frschet_type write Frschet_type;
    property  rschet_type_id : Integer read Frschet_type_id write Frschet_type_id;
    property orgCodeFK : WideString read ForgCodeFK write ForgCodeFK;
    property org : RQOrg read Forg write Forg;
    property bank : RQOrgBank read Fbank write Fbank;
  end;
}

  RQOrgRschetFilter = class(RQOrgRschet)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    ForgId : Integer;
    FaxOrgAccount : WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property orgId : Integer read ForgId write ForgId;
    property axOrgAccount : WideString read FaxOrgAccount write FaxOrgAccount;
  end;

  RQOrgRschetShort = class(TRemotable)
  private
    Fcode : Integer;
    Fid : Integer;
    Fmfo : WideString;
    Frschet : WideString;
    Fcurrency_code : WideString;
    Flikv_date : TXSDate;
    Fprimechan : WideString;
    Frschet_type : Integer;
    Frschet_type_id : Integer;
    ForgCodeFK : WideString;
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
    ForgPerson_type : Integer;
    ForgIs_plat_nds : Integer;
    ForgNalog_code_filial : Integer;
    ForgAxOrgId : Integer;
    ForgAxOrgCode : WideString;
    FbankCode : Integer;
    FbankId : Integer;
    FbankMfo : WideString;
    FbankName : WideString;

    Fcurrency_short_name : WideString;
    Frschet_type_name : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  id : Integer read Fid write Fid;
    property mfo : WideString read Fmfo write Fmfo;
    property rschet : WideString read Frschet write Frschet;
    property currency_code : WideString read Fcurrency_code write Fcurrency_code;
    property likv_date : TXSDate read Flikv_date write Flikv_date;
    property primechan : WideString read Fprimechan write Fprimechan;
    property  rschet_type : Integer read Frschet_type write Frschet_type;
    property  rschet_type_id : Integer read Frschet_type_id write Frschet_type_id;
    property orgCodeFK : WideString read ForgCodeFK write ForgCodeFK;

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
    property orgPerson_type : Integer read ForgPerson_type write ForgPerson_type;
    property orgIs_plat_nds : Integer read ForgIs_plat_nds write ForgIs_plat_nds;
    property orgNalog_code_filial : Integer read ForgNalog_code_filial write ForgNalog_code_filial;
    property orgAxOrgId : Integer read ForgAxOrgId write ForgAxOrgId;
    property orgAxOrgCode : WideString read ForgAxOrgCode write ForgAxOrgCode;
    property bankCode : Integer read FbankCode write FbankCode;
    property bankId : Integer read FbankId write FbankId;
    property bankMfo : WideString read FbankMfo write FbankMfo;
    property bankName : WideString read FbankName write FbankName;

    property currency_short_name : WideString read Fcurrency_short_name write Fcurrency_short_name;
    property rschet_type_name : WideString read Frschet_type_name write Frschet_type_name;
  end;

  ArrayOfRQOrgRschetShort = array of RQOrgRschetShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }
  ArrayOfRQOrgRschet = array of RQOrgRschet;
  
  RQOrgRschetShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOrgRschetShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOrgRschetShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOrgRschetController/message/
  // soapAction: http://ksoe.org/RQOrgRschetController/action/RQOrgRschetController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOrgRschetControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOrgRschetController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOrgRschetControllerSoapPort = interface(IInvokable)
  ['{52B0810B-23D5-4900-8CF7-49FDA3DC295B}']
    function add(const aRQOrgRschet: RQOrgRschet): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOrgRschet: RQOrgRschet); stdcall;
    function getObject(const anObjectCode: Integer): RQOrgRschet; stdcall;
    function getList: RQOrgRschetShortList; stdcall;
    function getFilteredList(const aRQOrgRschetFilter: RQOrgRschetFilter): RQOrgRschetShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOrgRschetShortList; stdcall;
    function getScrollableFilteredList(const aRQOrgRschetFilter: RQOrgRschetFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrgRschetShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOrgRschetShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQOrgRschetFilter: RQOrgRschetFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQOrgRschetShort; stdcall;
    function  getOrgRschetBankList(const aRQOrgRschetFilter: RQOrgRschetFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrgRschetShortList; stdcall;

    //procedure addOrgRschet(const aRQOrgRschet: RQOrgRschet; const isCustomer: Boolean); stdcall;
    procedure addOrgRschet(const aRQOrgRschet: RQOrgRschet); stdcall; overload;
	  function addOrgRschet(const aRQOrgRschets : ArrayOfRQOrgRschet; convertToIban : Boolean) : Integer; stdcall; overload;
  end;
  
  function convertRQOrgRschetShortToObject(sObj : RQOrgRschetShort) : RQOrgRschet;


implementation

function convertRQOrgRschetShortToObject(sObj : RQOrgRschetShort) : RQOrgRschet;
var
	Obj : RQOrgRschet;
begin
	if not Assigned(sObj) then begin
		Result := nil;
		Exit;
	end;
	
	Obj := RQOrgRschet.Create;
	Obj.id := sObj.id;
	Obj.mfo := sObj.mfo;
	
    Obj.bank := RQOrgBank.Create;
    Obj.bank.name := sObj.bankName;

    Obj.rschet := sObj.rschet;
    Obj.currency_code := sObj.currency_code;
    Obj.primechan := sObj.primechan;
	Obj.orgCodeFK := sObj.orgCodeFK;
	Obj.rschet_type_id := sObj.rschet_type_id;
	Obj.likv_date := sObj.likv_date;
	Obj.rschet_type := sObj.rschet_type;
  Result := Obj;
end;

  destructor RQOrgRschet.Destroy;
  begin
    if Assigned(Flikv_date) then
      likv_date.Free;
    if Assigned(Forg) then
      org.Free;
    if Assigned(Fbank) then
      bank.Free;
    inherited Destroy;
  end;

{
  destructor RQOrgRschetFilter.Destroy;
  begin
    if Assigned(Flikv_date) then
      likv_date.Free;
    if Assigned(Forg) then
      org.Free;
    if Assigned(Fbank) then
      bank.Free;
    inherited Destroy;
  end;
}

  destructor RQOrgRschetFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQOrgRschetShort.Destroy;
  begin
    if Assigned(Flikv_date) then
      likv_date.Free;
    if Assigned(ForgDate_svidet) then
      orgDate_svidet.Free;
    if Assigned(ForgLikv_date) then
      orgLikv_date.Free;
    if Assigned(ForgDate_nalogform) then
      orgDate_nalogform.Free;
    inherited Destroy;
  end;

  destructor RQOrgRschetShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOrgRschet, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrgRschet');
  RemClassRegistry.RegisterXSClass(RQOrgRschetRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrgRschetRef');
  RemClassRegistry.RegisterXSClass(RQOrgRschetFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrgRschetFilter');
  RemClassRegistry.RegisterXSClass(RQOrgRschetShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrgRschetShort');
  RemClassRegistry.RegisterXSClass(RQOrgRschetShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrgRschetShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOrgRschetShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOrgRschetShort');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOrgRschet), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOrgRschet');
  
  InvRegistry.RegisterInterface(TypeInfo(RQOrgRschetControllerSoapPort), 'http://ksoe.org/RQOrgRschetController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOrgRschetControllerSoapPort), 'http://ksoe.org/RQOrgRschetController/action/RQOrgRschetController.%operationName%');


end.
