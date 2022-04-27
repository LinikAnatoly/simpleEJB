unit ENBuilding2OSDataController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENBuildingController
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

  ENBuilding2OSData            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBuilding2OSDataRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBuilding2OSData = class(TRemotable)
  private
    Fcode : Integer;
    Fnum_un : Integer;
    Fkod_inv : WideString;
    Fkod_nal_nakl : WideString;
    Fkod_ist : WideString;
    Fname_ist : WideString;
    Fkod_subsch : WideString;
    Fname_subsch : WideString;
    Fkod_vid : WideString;
    Fname_vid : WideString;
    Fkod_privat : WideString;
    Fname_privat : WideString;
    Fkod_gr : WideString;
    Fname_gr : WideString;
    Fnum_klass : Integer;
    Fname_klass : WideString;
    Ff_amort : WideString;
    Fdt_vypusk : TXSDate;
    Fsum_izn_perv : TXSDecimal;
    Fsum_izn_perv_n : TXSDecimal;
    Fsum_st_perv_n : TXSDecimal;
    Fkod_zatr : WideString;
    Fkod_oborud : WideString;
    Fprimechan : WideString;
    Fcharacters : WideString;
    Fid_amort : Integer;
    Fkod_amort : WideString;
    Fname_amort : WideString;
    Fkod_am : Integer;
    Fname_am : WideString;
    Fkod_am_n : Integer;
    Fname_am_n : WideString;
    Fuse_limit : Integer;
    Fuse_limit_n : Integer;
    Fprimechan_vyb : WideString;
    Fkod_prizn : WideString;
    FdatePosting : TXSDate;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FENBuildingRef : ENBuildingRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property num_un : Integer read Fnum_un write Fnum_un;
    property kod_inv : WideString read Fkod_inv write Fkod_inv;
    property kod_nal_nakl : WideString read Fkod_nal_nakl write Fkod_nal_nakl;
    property kod_ist : WideString read Fkod_ist write Fkod_ist;
    property name_ist : WideString read Fname_ist write Fname_ist;
    property kod_subsch : WideString read Fkod_subsch write Fkod_subsch;
    property name_subsch : WideString read Fname_subsch write Fname_subsch;
    property kod_vid : WideString read Fkod_vid write Fkod_vid;
    property name_vid : WideString read Fname_vid write Fname_vid;
    property kod_privat : WideString read Fkod_privat write Fkod_privat;
    property name_privat : WideString read Fname_privat write Fname_privat;
    property kod_gr : WideString read Fkod_gr write Fkod_gr;
    property name_gr : WideString read Fname_gr write Fname_gr;
    property num_klass : Integer read Fnum_klass write Fnum_klass;
    property name_klass : WideString read Fname_klass write Fname_klass;
    property f_amort : WideString read Ff_amort write Ff_amort;
    property dt_vypusk : TXSDate read Fdt_vypusk write Fdt_vypusk;
    property sum_izn_perv : TXSDecimal read Fsum_izn_perv write Fsum_izn_perv;
    property sum_izn_perv_n : TXSDecimal read Fsum_izn_perv_n write Fsum_izn_perv_n;
    property sum_st_perv_n : TXSDecimal read Fsum_st_perv_n write Fsum_st_perv_n;
    property kod_zatr : WideString read Fkod_zatr write Fkod_zatr;
    property kod_oborud : WideString read Fkod_oborud write Fkod_oborud;
    property primechan : WideString read Fprimechan write Fprimechan;
    property characters : WideString read Fcharacters write Fcharacters;
    property id_amort : Integer read Fid_amort write Fid_amort;
    property kod_amort : WideString read Fkod_amort write Fkod_amort;
    property name_amort : WideString read Fname_amort write Fname_amort;
    property kod_am : Integer read Fkod_am write Fkod_am;
    property name_am : WideString read Fname_am write Fname_am;
    property kod_am_n : Integer read Fkod_am_n write Fkod_am_n;
    property name_am_n : WideString read Fname_am_n write Fname_am_n;
    property use_limit : Integer read Fuse_limit write Fuse_limit;
    property use_limit_n : Integer read Fuse_limit_n write Fuse_limit_n;
    property primechan_vyb : WideString read Fprimechan_vyb write Fprimechan_vyb;
    property kod_prizn : WideString read Fkod_prizn write Fkod_prizn;
    property datePosting : TXSDate read FdatePosting write FdatePosting;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property ENBuildingRef : ENBuildingRef read FENBuildingRef write FENBuildingRef;
  end;

{
  ENBuilding2OSDataFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fnum_un : Integer;
    Fkod_inv : WideString;
    Fkod_nal_nakl : WideString;
    Fkod_ist : WideString;
    Fname_ist : WideString;
    Fkod_subsch : WideString;
    Fname_subsch : WideString;
    Fkod_vid : WideString;
    Fname_vid : WideString;
    Fkod_privat : WideString;
    Fname_privat : WideString;
    Fkod_gr : WideString;
    Fname_gr : WideString;
    Fnum_klass : Integer;
    Fname_klass : WideString;
    Ff_amort : WideString;
    Fdt_vypusk : TXSDate;
    Fsum_izn_perv : TXSDecimal;
    Fsum_izn_perv_n : TXSDecimal;
    Fsum_st_perv_n : TXSDecimal;
    Fkod_zatr : WideString;
    Fkod_oborud : WideString;
    Fprimechan : WideString;
    Fcharacters : WideString;
    Fid_amort : Integer;
    Fkod_amort : WideString;
    Fname_amort : WideString;
    Fkod_am : Integer;
    Fname_am : WideString;
    Fkod_am_n : Integer;
    Fname_am_n : WideString;
    Fuse_limit : Integer;
    Fuse_limit_n : Integer;
    Fprimechan_vyb : WideString;
    Fkod_prizn : WideString;
    FdatePosting : TXSDate;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FENBuildingRef : ENBuildingRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property num_un : Integer read Fnum_un write Fnum_un;
    property kod_inv : WideString read Fkod_inv write Fkod_inv;
    property kod_nal_nakl : WideString read Fkod_nal_nakl write Fkod_nal_nakl;
    property kod_ist : WideString read Fkod_ist write Fkod_ist;
    property name_ist : WideString read Fname_ist write Fname_ist;
    property kod_subsch : WideString read Fkod_subsch write Fkod_subsch;
    property name_subsch : WideString read Fname_subsch write Fname_subsch;
    property kod_vid : WideString read Fkod_vid write Fkod_vid;
    property name_vid : WideString read Fname_vid write Fname_vid;
    property kod_privat : WideString read Fkod_privat write Fkod_privat;
    property name_privat : WideString read Fname_privat write Fname_privat;
    property kod_gr : WideString read Fkod_gr write Fkod_gr;
    property name_gr : WideString read Fname_gr write Fname_gr;
    property num_klass : Integer read Fnum_klass write Fnum_klass;
    property name_klass : WideString read Fname_klass write Fname_klass;
    property f_amort : WideString read Ff_amort write Ff_amort;
    property dt_vypusk : TXSDate read Fdt_vypusk write Fdt_vypusk;
    property sum_izn_perv : TXSDecimal read Fsum_izn_perv write Fsum_izn_perv;
    property sum_izn_perv_n : TXSDecimal read Fsum_izn_perv_n write Fsum_izn_perv_n;
    property sum_st_perv_n : TXSDecimal read Fsum_st_perv_n write Fsum_st_perv_n;
    property kod_zatr : WideString read Fkod_zatr write Fkod_zatr;
    property kod_oborud : WideString read Fkod_oborud write Fkod_oborud;
    property primechan : WideString read Fprimechan write Fprimechan;
    property characters : WideString read Fcharacters write Fcharacters;
    property id_amort : Integer read Fid_amort write Fid_amort;
    property kod_amort : WideString read Fkod_amort write Fkod_amort;
    property name_amort : WideString read Fname_amort write Fname_amort;
    property kod_am : Integer read Fkod_am write Fkod_am;
    property name_am : WideString read Fname_am write Fname_am;
    property kod_am_n : Integer read Fkod_am_n write Fkod_am_n;
    property name_am_n : WideString read Fname_am_n write Fname_am_n;
    property use_limit : Integer read Fuse_limit write Fuse_limit;
    property use_limit_n : Integer read Fuse_limit_n write Fuse_limit_n;
    property primechan_vyb : WideString read Fprimechan_vyb write Fprimechan_vyb;
    property kod_prizn : WideString read Fkod_prizn write Fkod_prizn;
    property datePosting : TXSDate read FdatePosting write FdatePosting;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property ENBuildingRef : ENBuildingRef read FENBuildingRef write FENBuildingRef;
  end;
}

  ENBuilding2OSDataFilter = class(ENBuilding2OSData)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENBuilding2OSDataShort = class(TRemotable)
  private
    Fcode : Integer;
    Fnum_un : Integer;
    Fkod_inv : WideString;
    Fkod_nal_nakl : WideString;
    Fkod_ist : WideString;
    Fname_ist : WideString;
    Fkod_subsch : WideString;
    Fname_subsch : WideString;
    Fkod_vid : WideString;
    Fname_vid : WideString;
    Fkod_privat : WideString;
    Fname_privat : WideString;
    Fkod_gr : WideString;
    Fname_gr : WideString;
    Fnum_klass : Integer;
    Fname_klass : WideString;
    Ff_amort : WideString;
    Fdt_vypusk : TXSDate;
    Fsum_izn_perv : TXSDecimal;
    Fsum_izn_perv_n : TXSDecimal;
    Fsum_st_perv_n : TXSDecimal;
    Fkod_zatr : WideString;
    Fkod_oborud : WideString;
    Fprimechan : WideString;
    Fcharacters : WideString;
    Fid_amort : Integer;
    Fkod_amort : WideString;
    Fname_amort : WideString;
    Fkod_am : Integer;
    Fname_am : WideString;
    Fkod_am_n : Integer;
    Fname_am_n : WideString;
    Fuse_limit : Integer;
    Fuse_limit_n : Integer;
    Fprimechan_vyb : WideString;
    Fkod_prizn : WideString;
    FdatePosting : TXSDate;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FENBuildingRefCode : Integer;
    FENBuildingRefNumbergen : WideString;
    FENBuildingRefDateGen : TXSDate;
    FENBuildingRefDateEdit : TXSDate;
    FENBuildingRefSummaGen : TXSDecimal;
    FENBuildingRefSummaNDS : TXSDecimal;
    FENBuildingRefCharacteristic : WideString;
    FENBuildingRefExecutedPosition : WideString;
    FENBuildingRefExecutedName : WideString;
    FENBuildingRefAcceptedPosition : WideString;
    FENBuildingRefAcceptedName : WideString;
    FENBuildingRefContractPrice : TXSDecimal;
    FENBuildingRefCodeMol : WideString;
    FENBuildingRefCodePodr : WideString;
    FENBuildingRefInvNumberOZ : WideString;
    FENBuildingRefNameOZ : WideString;
    FENBuildingRefFinContractNumber : WideString;
    FENBuildingRefFinContractDate : TXSDate;
    FENBuildingRefPartnerName : WideString;
    FENBuildingRefPartnerCode : WideString;
    FENBuildingRefIsInvestProgram : Integer;
    FENBuildingRefYearInvestProgram : WideString;
    FENBuildingRefItemInvestProgram : WideString;
    FENBuildingRefBuildingAddress : WideString;
    FENBuildingRefDecreeNumber : WideString;
    FENBuildingRefDecreeDate : TXSDate;
    FENBuildingRefExploitationTerm : Integer;
    FENBuildingRefDateLoadExpl : TXSDate;
    FENBuildingRefDateBuild : TXSDate;
    FENBuildingRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  num_un : Integer read Fnum_un write Fnum_un;
    property kod_inv : WideString read Fkod_inv write Fkod_inv;
    property kod_nal_nakl : WideString read Fkod_nal_nakl write Fkod_nal_nakl;
    property kod_ist : WideString read Fkod_ist write Fkod_ist;
    property name_ist : WideString read Fname_ist write Fname_ist;
    property kod_subsch : WideString read Fkod_subsch write Fkod_subsch;
    property name_subsch : WideString read Fname_subsch write Fname_subsch;
    property kod_vid : WideString read Fkod_vid write Fkod_vid;
    property name_vid : WideString read Fname_vid write Fname_vid;
    property kod_privat : WideString read Fkod_privat write Fkod_privat;
    property name_privat : WideString read Fname_privat write Fname_privat;
    property kod_gr : WideString read Fkod_gr write Fkod_gr;
    property name_gr : WideString read Fname_gr write Fname_gr;
    property  num_klass : Integer read Fnum_klass write Fnum_klass;
    property name_klass : WideString read Fname_klass write Fname_klass;
    property f_amort : WideString read Ff_amort write Ff_amort;
    property dt_vypusk : TXSDate read Fdt_vypusk write Fdt_vypusk;
    property sum_izn_perv : TXSDecimal read Fsum_izn_perv write Fsum_izn_perv;
    property sum_izn_perv_n : TXSDecimal read Fsum_izn_perv_n write Fsum_izn_perv_n;
    property sum_st_perv_n : TXSDecimal read Fsum_st_perv_n write Fsum_st_perv_n;
    property kod_zatr : WideString read Fkod_zatr write Fkod_zatr;
    property kod_oborud : WideString read Fkod_oborud write Fkod_oborud;
    property primechan : WideString read Fprimechan write Fprimechan;
    property characters : WideString read Fcharacters write Fcharacters;
    property  id_amort : Integer read Fid_amort write Fid_amort;
    property kod_amort : WideString read Fkod_amort write Fkod_amort;
    property name_amort : WideString read Fname_amort write Fname_amort;
    property  kod_am : Integer read Fkod_am write Fkod_am;
    property name_am : WideString read Fname_am write Fname_am;
    property  kod_am_n : Integer read Fkod_am_n write Fkod_am_n;
    property name_am_n : WideString read Fname_am_n write Fname_am_n;
    property  use_limit : Integer read Fuse_limit write Fuse_limit;
    property  use_limit_n : Integer read Fuse_limit_n write Fuse_limit_n;
    property primechan_vyb : WideString read Fprimechan_vyb write Fprimechan_vyb;
    property kod_prizn : WideString read Fkod_prizn write Fkod_prizn;
    property datePosting : TXSDate read FdatePosting write FdatePosting;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property ENBuildingRefCode : Integer read FENBuildingRefCode write FENBuildingRefCode;
    property ENBuildingRefNumbergen : WideString read FENBuildingRefNumbergen write FENBuildingRefNumbergen;
    property ENBuildingRefDateGen : TXSDate read FENBuildingRefDateGen write FENBuildingRefDateGen;
    property ENBuildingRefDateEdit : TXSDate read FENBuildingRefDateEdit write FENBuildingRefDateEdit;
    property ENBuildingRefSummaGen : TXSDecimal read FENBuildingRefSummaGen write FENBuildingRefSummaGen;
    property ENBuildingRefSummaNDS : TXSDecimal read FENBuildingRefSummaNDS write FENBuildingRefSummaNDS;
    property ENBuildingRefCharacteristic : WideString read FENBuildingRefCharacteristic write FENBuildingRefCharacteristic;
    property ENBuildingRefExecutedPosition : WideString read FENBuildingRefExecutedPosition write FENBuildingRefExecutedPosition;
    property ENBuildingRefExecutedName : WideString read FENBuildingRefExecutedName write FENBuildingRefExecutedName;
    property ENBuildingRefAcceptedPosition : WideString read FENBuildingRefAcceptedPosition write FENBuildingRefAcceptedPosition;
    property ENBuildingRefAcceptedName : WideString read FENBuildingRefAcceptedName write FENBuildingRefAcceptedName;
    property ENBuildingRefContractPrice : TXSDecimal read FENBuildingRefContractPrice write FENBuildingRefContractPrice;
    property ENBuildingRefCodeMol : WideString read FENBuildingRefCodeMol write FENBuildingRefCodeMol;
    property ENBuildingRefCodePodr : WideString read FENBuildingRefCodePodr write FENBuildingRefCodePodr;
    property ENBuildingRefInvNumberOZ : WideString read FENBuildingRefInvNumberOZ write FENBuildingRefInvNumberOZ;
    property ENBuildingRefNameOZ : WideString read FENBuildingRefNameOZ write FENBuildingRefNameOZ;
    property ENBuildingRefFinContractNumber : WideString read FENBuildingRefFinContractNumber write FENBuildingRefFinContractNumber;
    property ENBuildingRefFinContractDate : TXSDate read FENBuildingRefFinContractDate write FENBuildingRefFinContractDate;
    property ENBuildingRefPartnerName : WideString read FENBuildingRefPartnerName write FENBuildingRefPartnerName;
    property ENBuildingRefPartnerCode : WideString read FENBuildingRefPartnerCode write FENBuildingRefPartnerCode;
    property ENBuildingRefIsInvestProgram : Integer read FENBuildingRefIsInvestProgram write FENBuildingRefIsInvestProgram;
    property ENBuildingRefYearInvestProgram : WideString read FENBuildingRefYearInvestProgram write FENBuildingRefYearInvestProgram;
    property ENBuildingRefItemInvestProgram : WideString read FENBuildingRefItemInvestProgram write FENBuildingRefItemInvestProgram;
    property ENBuildingRefBuildingAddress : WideString read FENBuildingRefBuildingAddress write FENBuildingRefBuildingAddress;
    property ENBuildingRefDecreeNumber : WideString read FENBuildingRefDecreeNumber write FENBuildingRefDecreeNumber;
    property ENBuildingRefDecreeDate : TXSDate read FENBuildingRefDecreeDate write FENBuildingRefDecreeDate;
    property ENBuildingRefExploitationTerm : Integer read FENBuildingRefExploitationTerm write FENBuildingRefExploitationTerm;
    property ENBuildingRefDateLoadExpl : TXSDate read FENBuildingRefDateLoadExpl write FENBuildingRefDateLoadExpl;
    property ENBuildingRefDateBuild : TXSDate read FENBuildingRefDateBuild write FENBuildingRefDateBuild;
    property ENBuildingRefUserGen : WideString read FENBuildingRefUserGen write FENBuildingRefUserGen;
  end;

  ArrayOfENBuilding2OSDataShort = array of ENBuilding2OSDataShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENBuilding2OSDataShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENBuilding2OSDataShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENBuilding2OSDataShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENBuilding2OSDataController/message/
  // soapAction: http://ksoe.org/ENBuilding2OSDataController/action/ENBuilding2OSDataController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENBuilding2OSDataControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENBuilding2OSDataController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENBuilding2OSDataControllerSoapPort = interface(IInvokable)
  ['{E1E5F8FC-233E-4378-BD19-792CBC57E7F2}']
    function add(const aENBuilding2OSData: ENBuilding2OSData): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENBuilding2OSData: ENBuilding2OSData); stdcall;
    function getObject(const anObjectCode: Integer): ENBuilding2OSData; stdcall;
    function getList: ENBuilding2OSDataShortList; stdcall;
    function getFilteredList(const aENBuilding2OSDataFilter: ENBuilding2OSDataFilter): ENBuilding2OSDataShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENBuilding2OSDataShortList; stdcall;
    function getScrollableFilteredList(const aENBuilding2OSDataFilter: ENBuilding2OSDataFilter; const aFromPosition: Integer; const aQuantity: Integer): ENBuilding2OSDataShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENBuilding2OSDataShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENBuilding2OSDataFilter: ENBuilding2OSDataFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENBuilding2OSDataShort; stdcall;
  end;


implementation

  destructor ENBuilding2OSData.Destroy;
  begin
    if Assigned(Fdt_vypusk) then
      dt_vypusk.Free;
    if Assigned(Fsum_izn_perv) then
      sum_izn_perv.Free;
    if Assigned(Fsum_izn_perv_n) then
      sum_izn_perv_n.Free;
    if Assigned(Fsum_st_perv_n) then
      sum_st_perv_n.Free;
    if Assigned(FdatePosting) then
      datePosting.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FENBuildingRef) then
      ENBuildingRef.Free;
    inherited Destroy;
  end;

{
  destructor ENBuilding2OSDataFilter.Destroy;
  begin
    if Assigned(Fdt_vypusk) then
      dt_vypusk.Free;
    if Assigned(Fsum_izn_perv) then
      sum_izn_perv.Free;
    if Assigned(Fsum_izn_perv_n) then
      sum_izn_perv_n.Free;
    if Assigned(Fsum_st_perv_n) then
      sum_st_perv_n.Free;
    if Assigned(FdatePosting) then
      datePosting.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FENBuildingRef) then
      ENBuildingRef.Free;
    inherited Destroy;
  end;
}

  destructor ENBuilding2OSDataFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENBuilding2OSDataShort.Destroy;
  begin
    if Assigned(Fdt_vypusk) then
      dt_vypusk.Free;
    if Assigned(Fsum_izn_perv) then
      sum_izn_perv.Free;
    if Assigned(Fsum_izn_perv_n) then
      sum_izn_perv_n.Free;
    if Assigned(Fsum_st_perv_n) then
      sum_st_perv_n.Free;
    if Assigned(FdatePosting) then
      datePosting.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FENBuildingRefDateGen) then
      ENBuildingRefDateGen.Free;
    if Assigned(FENBuildingRefDateEdit) then
      ENBuildingRefDateEdit.Free;
    if Assigned(FENBuildingRefSummaGen) then
      ENBuildingRefSummaGen.Free;
    if Assigned(FENBuildingRefSummaNDS) then
      ENBuildingRefSummaNDS.Free;
    if Assigned(FENBuildingRefContractPrice) then
      ENBuildingRefContractPrice.Free;
    if Assigned(FENBuildingRefFinContractDate) then
      ENBuildingRefFinContractDate.Free;
    if Assigned(FENBuildingRefDecreeDate) then
      ENBuildingRefDecreeDate.Free;
    if Assigned(FENBuildingRefDateLoadExpl) then
      ENBuildingRefDateLoadExpl.Free;
    if Assigned(FENBuildingRefDateBuild) then
      ENBuildingRefDateBuild.Free;
    inherited Destroy;
  end;

  destructor ENBuilding2OSDataShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENBuilding2OSData, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilding2OSData');
  RemClassRegistry.RegisterXSClass(ENBuilding2OSDataRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilding2OSDataRef');
  RemClassRegistry.RegisterXSClass(ENBuilding2OSDataFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilding2OSDataFilter');
  RemClassRegistry.RegisterXSClass(ENBuilding2OSDataShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilding2OSDataShort');
  RemClassRegistry.RegisterXSClass(ENBuilding2OSDataShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilding2OSDataShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENBuilding2OSDataShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENBuilding2OSDataShort');

  InvRegistry.RegisterInterface(TypeInfo(ENBuilding2OSDataControllerSoapPort), 'http://ksoe.org/ENBuilding2OSDataController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENBuilding2OSDataControllerSoapPort), 'http://ksoe.org/ENBuilding2OSDataController/action/ENBuilding2OSDataController.%operationName%');


end.
