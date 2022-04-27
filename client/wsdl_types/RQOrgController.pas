unit RQOrgController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
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

  RQOrg            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrgRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrg = class(TRemotable)
  private
    Fcode : Integer;
    Fid : Integer;
    Fcodeorg : WideString;
    Fname : WideString;
    Fukr_name : WideString;
    Fokpo : WideString;
    Fnalog_num : WideString;
    Fsvidet_num : WideString;
    Fadr : WideString;
    Ftel : WideString;
    Fcountry : WideString;
    Fregion : WideString;
    Fministry : WideString;
    Fownership : Integer;
    Ftype_ : WideString;
    Fmaster_code : WideString;
    Fdate_svidet : TXSDate;
    Flikv_date : TXSDate;
    Fexcept_flag : WideString;
    Flikv_flag : WideString;
    Fbudget_flag : WideString;
    Fdate_nalogform : TXSDate;
    Fid_nalogform : Integer;
    Fadr_legal : WideString;
    Fprimechan : WideString;
    Fperson_type : Integer;
    Fis_plat_nds : Integer;
    Fnalog_code_filial : Integer;
    FaxOrgId : Integer;
    FaxOrgCode : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  id : Integer read Fid write Fid;
    property codeorg : WideString read Fcodeorg write Fcodeorg;
    property name : WideString read Fname write Fname;
    property ukr_name : WideString read Fukr_name write Fukr_name;
    property okpo : WideString read Fokpo write Fokpo;
    property nalog_num : WideString read Fnalog_num write Fnalog_num;
    property svidet_num : WideString read Fsvidet_num write Fsvidet_num;
    property adr : WideString read Fadr write Fadr;
    property tel : WideString read Ftel write Ftel;
    property country : WideString read Fcountry write Fcountry;
    property region : WideString read Fregion write Fregion;
    property ministry : WideString read Fministry write Fministry;
    property  ownership : Integer read Fownership write Fownership;
    property type_ : WideString read Ftype_ write Ftype_;
    property master_code : WideString read Fmaster_code write Fmaster_code;
    property date_svidet : TXSDate read Fdate_svidet write Fdate_svidet;
    property likv_date : TXSDate read Flikv_date write Flikv_date;
    property except_flag : WideString read Fexcept_flag write Fexcept_flag;
    property likv_flag : WideString read Flikv_flag write Flikv_flag;
    property budget_flag : WideString read Fbudget_flag write Fbudget_flag;
    property date_nalogform : TXSDate read Fdate_nalogform write Fdate_nalogform;
    property  id_nalogform : Integer read Fid_nalogform write Fid_nalogform;
    property adr_legal : WideString read Fadr_legal write Fadr_legal;
    property primechan : WideString read Fprimechan write Fprimechan;
    property  person_type : Integer read Fperson_type write Fperson_type;
    property  is_plat_nds : Integer read Fis_plat_nds write Fis_plat_nds;
    property  nalog_code_filial : Integer read Fnalog_code_filial write Fnalog_code_filial;
    property  axOrgId : Integer read FaxOrgId write FaxOrgId;
    property axOrgCode : WideString read FaxOrgCode write FaxOrgCode;
  end;

{
  RQOrgFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fid : Integer;
    Fcodeorg : WideString;
    Fname : WideString;
    Fukr_name : WideString;
    Fokpo : WideString;
    Fnalog_num : WideString;
    Fsvidet_num : WideString;
    Fadr : WideString;
    Ftel : WideString;
    Fcountry : WideString;
    Fregion : WideString;
    Fministry : WideString;
    Fownership : Integer;
    Ftype_ : WideString;
    Fmaster_code : WideString;
    Fdate_svidet : TXSDate;
    Flikv_date : TXSDate;
    Fexcept_flag : WideString;
    Flikv_flag : WideString;
    Fbudget_flag : WideString;
    Fdate_nalogform : TXSDate;
    Fid_nalogform : Integer;
    Fadr_legal : WideString;
    Fprimechan : WideString;
    Fperson_type : Integer;
    Fis_plat_nds : Integer;
    Fnalog_code_filial : Integer;
    FaxOrgId : Integer;
    FaxOrgCode : WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  id : Integer read Fid write Fid;
    property codeorg : WideString read Fcodeorg write Fcodeorg;
    property name : WideString read Fname write Fname;
    property ukr_name : WideString read Fukr_name write Fukr_name;
    property okpo : WideString read Fokpo write Fokpo;
    property nalog_num : WideString read Fnalog_num write Fnalog_num;
    property svidet_num : WideString read Fsvidet_num write Fsvidet_num;
    property adr : WideString read Fadr write Fadr;
    property tel : WideString read Ftel write Ftel;
    property country : WideString read Fcountry write Fcountry;
    property region : WideString read Fregion write Fregion;
    property ministry : WideString read Fministry write Fministry;
    property  ownership : Integer read Fownership write Fownership;
    property type_ : WideString read Ftype_ write Ftype_;
    property master_code : WideString read Fmaster_code write Fmaster_code;
    property date_svidet : TXSDate read Fdate_svidet write Fdate_svidet;
    property likv_date : TXSDate read Flikv_date write Flikv_date;
    property except_flag : WideString read Fexcept_flag write Fexcept_flag;
    property likv_flag : WideString read Flikv_flag write Flikv_flag;
    property budget_flag : WideString read Fbudget_flag write Fbudget_flag;
    property date_nalogform : TXSDate read Fdate_nalogform write Fdate_nalogform;
    property  id_nalogform : Integer read Fid_nalogform write Fid_nalogform;
    property adr_legal : WideString read Fadr_legal write Fadr_legal;
    property primechan : WideString read Fprimechan write Fprimechan;
    property  person_type : Integer read Fperson_type write Fperson_type;
    property  is_plat_nds : Integer read Fis_plat_nds write Fis_plat_nds;
    property  nalog_code_filial : Integer read Fnalog_code_filial write Fnalog_code_filial;
    property  axOrgId : Integer read FaxOrgId write FaxOrgId;
    property axOrgCode : WideString read FaxOrgCode write FaxOrgCode;
  end;
}

  RQOrgFilter = class(RQOrg)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQOrgShort = class(TRemotable)
  private
    Fcode : Integer;
    Fid : Integer;
    Fcodeorg : WideString;
    Fname : WideString;
    Fukr_name : WideString;
    Fokpo : WideString;
    Fnalog_num : WideString;
    Fsvidet_num : WideString;
    Fadr : WideString;
    Ftel : WideString;
    Fcountry : WideString;
    Fregion : WideString;
    Fministry : WideString;
    Fownership : Integer;
    Ftype : WideString;
    Fmaster_code : WideString;
    Fdate_svidet : TXSDate;
    Flikv_date : TXSDate;
    Fexcept_flag : WideString;
    Flikv_flag : WideString;
    Fbudget_flag : WideString;
    Fdate_nalogform : TXSDate;
    Fid_nalogform : Integer;
    Fadr_legal : WideString;
    Fprimechan : WideString;
    Fperson_type : Integer;
    Fis_plat_nds : Integer;
    Fnalog_code_filial : Integer;
    FaxOrgId : Integer;
    FaxOrgCode : WideString;
    /////
    Frschet: WideString;
    Fmfo: WideString;
    Fbank_name: WideString;
    Fname_nalogform: WideString;
    /////
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  id : Integer read Fid write Fid;
    property codeorg : WideString read Fcodeorg write Fcodeorg;
    property name : WideString read Fname write Fname;
    property ukr_name : WideString read Fukr_name write Fukr_name;
    property okpo : WideString read Fokpo write Fokpo;
    property nalog_num : WideString read Fnalog_num write Fnalog_num;
    property svidet_num : WideString read Fsvidet_num write Fsvidet_num;
    property adr : WideString read Fadr write Fadr;
    property tel : WideString read Ftel write Ftel;
    property country : WideString read Fcountry write Fcountry;
    property region : WideString read Fregion write Fregion;
    property ministry : WideString read Fministry write Fministry;
    property  ownership : Integer read Fownership write Fownership;
    property type_ : WideString read Ftype write Ftype;
    property master_code : WideString read Fmaster_code write Fmaster_code;
    property date_svidet : TXSDate read Fdate_svidet write Fdate_svidet;
    property likv_date : TXSDate read Flikv_date write Flikv_date;
    property except_flag : WideString read Fexcept_flag write Fexcept_flag;
    property likv_flag : WideString read Flikv_flag write Flikv_flag;
    property budget_flag : WideString read Fbudget_flag write Fbudget_flag;
    property date_nalogform : TXSDate read Fdate_nalogform write Fdate_nalogform;
    property  id_nalogform : Integer read Fid_nalogform write Fid_nalogform;
    property adr_legal : WideString read Fadr_legal write Fadr_legal;
    property primechan : WideString read Fprimechan write Fprimechan;
    property  person_type : Integer read Fperson_type write Fperson_type;
    property  is_plat_nds : Integer read Fis_plat_nds write Fis_plat_nds;
    property  nalog_code_filial : Integer read Fnalog_code_filial write Fnalog_code_filial;
    property  axOrgId : Integer read FaxOrgId write FaxOrgId;
    property axOrgCode : WideString read FaxOrgCode write FaxOrgCode;
    /////
    property rschet: WideString read Frschet write Frschet;
    property mfo: WideString read Fmfo write Fmfo;
    property bank_name: WideString read Fbank_name write Fbank_name;
    property name_nalogform: WideString read Fname_nalogform write Fname_nalogform;
    /////
  end;

  ArrayOfRQOrgShort = array of RQOrgShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOrgShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOrgShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOrgShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOrgController/message/
  // soapAction: http://ksoe.org/RQOrgController/action/RQOrgController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOrgControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOrgController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOrgControllerSoapPort = interface(IInvokable)
  ['{FAFDA373-4AA3-47C9-81BF-BFF539F30FD9}']
    function add(const aRQOrg: RQOrg): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOrg: RQOrg); stdcall;
    function getObject(const anObjectCode: Integer): RQOrg; stdcall;
    function getList: RQOrgShortList; stdcall;
    function getFilteredList(const aRQOrgFilter: RQOrgFilter): RQOrgShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOrgShortList; stdcall;
    function getScrollableFilteredList(const aRQOrgFilter: RQOrgFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrgShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOrgShortList; stdcall;
    function  getRQOrgList(const aRQOrgFilter: RQOrgFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrgShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQOrgFilter: RQOrgFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQOrgShort; stdcall;

    //function addOrg(const aRQOrg: RQOrg; const isCustomer: Boolean): WideString; stdcall;
    function addOrg(const aRQOrg: RQOrg): WideString; stdcall;
    function getObjectFromFK(const id: Integer): RQOrg; stdcall;
    function getPartnersListForAgree(const agree_id: Integer): RQOrgShortList; stdcall;
  end;


implementation

  destructor RQOrg.Destroy;
  begin
    if Assigned(Fdate_svidet) then
      date_svidet.Free;
    if Assigned(Flikv_date) then
      likv_date.Free;
    if Assigned(Fdate_nalogform) then
      date_nalogform.Free;
    inherited Destroy;
  end;

{
  destructor RQOrgFilter.Destroy;
  begin
    if Assigned(Fdate_svidet) then
      date_svidet.Free;
    if Assigned(Flikv_date) then
      likv_date.Free;
    if Assigned(Fdate_nalogform) then
      date_nalogform.Free;
    inherited Destroy;
  end;
}

  destructor RQOrgFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQOrgShort.Destroy;
  begin
    if Assigned(Fdate_svidet) then
      date_svidet.Free;
    if Assigned(Flikv_date) then
      likv_date.Free;
    if Assigned(Fdate_nalogform) then
      date_nalogform.Free;
    inherited Destroy;
  end;

  destructor RQOrgShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOrg, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrg');
  RemClassRegistry.RegisterXSClass(RQOrgRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrgRef');
  RemClassRegistry.RegisterXSClass(RQOrgFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrgFilter');
  RemClassRegistry.RegisterXSClass(RQOrgShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrgShort');
  RemClassRegistry.RegisterXSClass(RQOrgShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrgShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOrgShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOrgShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOrgControllerSoapPort), 'http://ksoe.org/RQOrgController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOrgControllerSoapPort), 'http://ksoe.org/RQOrgController/action/RQOrgController.%operationName%');

  RemClassRegistry.RegisterExternalPropName(TypeInfo(RQOrg), 'type_', 'type');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(RQOrgFilter), 'type_', 'type');

end.
