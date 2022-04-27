unit RQFKOrderItem2OSDataController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQFKOrderItemController 
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

  RQFKOrderItem2OSData            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrderItem2OSDataRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrderItem2OSData = class(TRemotable)
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
    FuserGen : WideString;
    FdateEdit : TXSDateTime;	
    Fmodify_time : Int64;
//???
    FfkOrderItemRef : RQFKOrderItemRef;
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
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property fkOrderItemRef : RQFKOrderItemRef read FfkOrderItemRef write FfkOrderItemRef; 
  end;
  
{
  RQFKOrderItem2OSDataFilter = class(TRemotable)
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
    FuserGen : WideString;
    FdateEdit : DateTime; 
    Fmodify_time : Int64;
//???
    FfkOrderItemRef : RQFKOrderItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
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
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property fkOrderItemRef : RQFKOrderItemRef read FfkOrderItemRef write FfkOrderItemRef; 
  end;
}

  RQFKOrderItem2OSDataFilter = class(RQFKOrderItem2OSData)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQFKOrderItem2OSDataShort = class(TRemotable)
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
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FfkOrderItemRefCode : Integer; 
    FfkOrderItemRefFinCode : Integer; 
    FfkOrderItemRefNomenclatureCode : Integer; 
    FfkOrderItemRefNomenclatureNum : WideString;
    FfkOrderItemRefNomenclatureBalSch : WideString;
    FfkOrderItemRefNomenclatureName : WideString;
    FfkOrderItemRefNomenclatureUnitCode : Integer; 
    FfkOrderItemRefNomenclatureUnitName : WideString;
    FfkOrderItemRefContractNumber : WideString;
    FfkOrderItemRefContractDate : TXSDate;
    FfkOrderItemRefFinDocCode : WideString;
    FfkOrderItemRefFinDocID : Integer; 
    FfkOrderItemRefMaterialNameTxt : WideString;
    FfkOrderItemRefMeasurementNameTxt : WideString;
    FfkOrderItemRefCountGen : TXSDecimal;
    FfkOrderItemRefPriceWithoutNds : TXSDecimal;
    FfkOrderItemRefPriceWithNds : TXSDecimal;
    FfkOrderItemRefPriceNds : TXSDecimal;
    FfkOrderItemRefSumWithoutNds : TXSDecimal;
    FfkOrderItemRefSumNds : TXSDecimal;
    FfkOrderItemRefSumGen : TXSDecimal;
    FfkOrderItemRefUserGen : WideString;
    FfkOrderItemRefCommentGen : WideString;
    FfkOrderItemRefNext_mat_name : WideString;
    FfkOrderItemRefMeasurementTwoUnits : WideString;
    FfkOrderItemRefCountTwoUnits : TXSDecimal;
    FfkOrderItemRefPriceTwoUnits : TXSDecimal;
    FfkOrderItemRefWeight : TXSDecimal;
    FfkOrderItemRefSellingPriceWithoutNds : TXSDecimal;
    FfkOrderItemRefSellingCostWithoutNds : TXSDecimal;
    FfkOrderItemRefDateRealiz : TXSDate;
    FfkOrderItemRefFundingType : Integer;
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
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	

    property fkOrderItemRefCode : Integer read FfkOrderItemRefCode write FfkOrderItemRefCode; 
    property fkOrderItemRefFinCode : Integer read FfkOrderItemRefFinCode write FfkOrderItemRefFinCode; 
    property fkOrderItemRefNomenclatureCode : Integer read FfkOrderItemRefNomenclatureCode write FfkOrderItemRefNomenclatureCode; 
    property fkOrderItemRefNomenclatureNum : WideString read FfkOrderItemRefNomenclatureNum write FfkOrderItemRefNomenclatureNum; 
    property fkOrderItemRefNomenclatureBalSch : WideString read FfkOrderItemRefNomenclatureBalSch write FfkOrderItemRefNomenclatureBalSch; 
    property fkOrderItemRefNomenclatureName : WideString read FfkOrderItemRefNomenclatureName write FfkOrderItemRefNomenclatureName; 
    property fkOrderItemRefNomenclatureUnitCode : Integer read FfkOrderItemRefNomenclatureUnitCode write FfkOrderItemRefNomenclatureUnitCode; 
    property fkOrderItemRefNomenclatureUnitName : WideString read FfkOrderItemRefNomenclatureUnitName write FfkOrderItemRefNomenclatureUnitName; 
    property fkOrderItemRefContractNumber : WideString read FfkOrderItemRefContractNumber write FfkOrderItemRefContractNumber; 
    property fkOrderItemRefContractDate : TXSDate read FfkOrderItemRefContractDate write FfkOrderItemRefContractDate; 
    property fkOrderItemRefFinDocCode : WideString read FfkOrderItemRefFinDocCode write FfkOrderItemRefFinDocCode; 
    property fkOrderItemRefFinDocID : Integer read FfkOrderItemRefFinDocID write FfkOrderItemRefFinDocID; 
    property fkOrderItemRefMaterialNameTxt : WideString read FfkOrderItemRefMaterialNameTxt write FfkOrderItemRefMaterialNameTxt; 
    property fkOrderItemRefMeasurementNameTxt : WideString read FfkOrderItemRefMeasurementNameTxt write FfkOrderItemRefMeasurementNameTxt; 
    property fkOrderItemRefCountGen : TXSDecimal read FfkOrderItemRefCountGen write FfkOrderItemRefCountGen; 
    property fkOrderItemRefPriceWithoutNds : TXSDecimal read FfkOrderItemRefPriceWithoutNds write FfkOrderItemRefPriceWithoutNds; 
    property fkOrderItemRefPriceWithNds : TXSDecimal read FfkOrderItemRefPriceWithNds write FfkOrderItemRefPriceWithNds; 
    property fkOrderItemRefPriceNds : TXSDecimal read FfkOrderItemRefPriceNds write FfkOrderItemRefPriceNds; 
    property fkOrderItemRefSumWithoutNds : TXSDecimal read FfkOrderItemRefSumWithoutNds write FfkOrderItemRefSumWithoutNds; 
    property fkOrderItemRefSumNds : TXSDecimal read FfkOrderItemRefSumNds write FfkOrderItemRefSumNds; 
    property fkOrderItemRefSumGen : TXSDecimal read FfkOrderItemRefSumGen write FfkOrderItemRefSumGen; 
    property fkOrderItemRefUserGen : WideString read FfkOrderItemRefUserGen write FfkOrderItemRefUserGen; 
    property fkOrderItemRefCommentGen : WideString read FfkOrderItemRefCommentGen write FfkOrderItemRefCommentGen; 
    property fkOrderItemRefNext_mat_name : WideString read FfkOrderItemRefNext_mat_name write FfkOrderItemRefNext_mat_name; 
    property fkOrderItemRefMeasurementTwoUnits : WideString read FfkOrderItemRefMeasurementTwoUnits write FfkOrderItemRefMeasurementTwoUnits; 
    property fkOrderItemRefCountTwoUnits : TXSDecimal read FfkOrderItemRefCountTwoUnits write FfkOrderItemRefCountTwoUnits; 
    property fkOrderItemRefPriceTwoUnits : TXSDecimal read FfkOrderItemRefPriceTwoUnits write FfkOrderItemRefPriceTwoUnits; 
    property fkOrderItemRefWeight : TXSDecimal read FfkOrderItemRefWeight write FfkOrderItemRefWeight; 
    property fkOrderItemRefSellingPriceWithoutNds : TXSDecimal read FfkOrderItemRefSellingPriceWithoutNds write FfkOrderItemRefSellingPriceWithoutNds; 
    property fkOrderItemRefSellingCostWithoutNds : TXSDecimal read FfkOrderItemRefSellingCostWithoutNds write FfkOrderItemRefSellingCostWithoutNds; 
    property fkOrderItemRefDateRealiz : TXSDate read FfkOrderItemRefDateRealiz write FfkOrderItemRefDateRealiz; 
    property fkOrderItemRefFundingType : Integer read FfkOrderItemRefFundingType write FfkOrderItemRefFundingType;
  end;

  ArrayOfRQFKOrderItem2OSDataShort = array of RQFKOrderItem2OSDataShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQFKOrderItem2OSDataShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQFKOrderItem2OSDataShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQFKOrderItem2OSDataShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQFKOrderItem2OSDataController/message/
  // soapAction: http://ksoe.org/RQFKOrderItem2OSDataController/action/RQFKOrderItem2OSDataController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQFKOrderItem2OSDataControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQFKOrderItem2OSDataController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQFKOrderItem2OSDataControllerSoapPort = interface(IInvokable)
  ['{d964d964-d964-d964-d964-d964d964d964}']
    function  add(const aRQFKOrderItem2OSData: RQFKOrderItem2OSData): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQFKOrderItem2OSData: RQFKOrderItem2OSData); stdcall;
    function  getObject(const anObjectCode: Integer): RQFKOrderItem2OSData; stdcall;
    function  getList: RQFKOrderItem2OSDataShortList; stdcall;
    function  getFilteredList(const aRQFKOrderItem2OSDataFilter: RQFKOrderItem2OSDataFilter): RQFKOrderItem2OSDataShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItem2OSDataShortList; stdcall;
    function  getScrollableFilteredList(const aRQFKOrderItem2OSDataFilter: RQFKOrderItem2OSDataFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItem2OSDataShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItem2OSDataShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aRQFKOrderItem2OSDataFilter: RQFKOrderItem2OSDataFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQFKOrderItem2OSDataShort; stdcall;
    procedure addForOrderItems(const aRQFKOrderItem2OSData: RQFKOrderItem2OSData; const itemCodesArr: ArrayOfInteger); stdcall;
  end;


implementation

  destructor RQFKOrderItem2OSData.Destroy;
  begin
    if Assigned(Fdt_vypusk) then
      dt_vypusk.Free;
    if Assigned(Fsum_izn_perv) then
      sum_izn_perv.Free;
    if Assigned(Fsum_izn_perv_n) then
      sum_izn_perv_n.Free;
    if Assigned(Fsum_st_perv_n) then
      sum_st_perv_n.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FfkOrderItemRef) then
      fkOrderItemRef.Free;
    inherited Destroy;
  end;

{  
  destructor RQFKOrderItem2OSDataFilter.Destroy;
  begin
    if Assigned(Fdt_vypusk) then
      dt_vypusk.Free;
    if Assigned(Fsum_izn_perv) then
      sum_izn_perv.Free;
    if Assigned(Fsum_izn_perv_n) then
      sum_izn_perv_n.Free;
    if Assigned(Fsum_st_perv_n) then
      sum_st_perv_n.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FfkOrderItemRef) then
      fkOrderItemRef.Free;
    inherited Destroy;
  end; 
}

  destructor RQFKOrderItem2OSDataFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor RQFKOrderItem2OSDataShort.Destroy;
  begin
    if Assigned(Fdt_vypusk) then
      dt_vypusk.Free;
    if Assigned(Fsum_izn_perv) then
      sum_izn_perv.Free;
    if Assigned(Fsum_izn_perv_n) then
      sum_izn_perv_n.Free;
    if Assigned(Fsum_st_perv_n) then
      sum_st_perv_n.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FfkOrderItemRefContractDate) then
      fkOrderItemRefContractDate.Free;
    if Assigned(FfkOrderItemRefCountGen) then
      fkOrderItemRefCountGen.Free;
    if Assigned(FfkOrderItemRefPriceWithoutNds) then
      fkOrderItemRefPriceWithoutNds.Free;
    if Assigned(FfkOrderItemRefPriceWithNds) then
      fkOrderItemRefPriceWithNds.Free;
    if Assigned(FfkOrderItemRefPriceNds) then
      fkOrderItemRefPriceNds.Free;
    if Assigned(FfkOrderItemRefSumWithoutNds) then
      fkOrderItemRefSumWithoutNds.Free;
    if Assigned(FfkOrderItemRefSumNds) then
      fkOrderItemRefSumNds.Free;
    if Assigned(FfkOrderItemRefSumGen) then
      fkOrderItemRefSumGen.Free;
    if Assigned(FfkOrderItemRefCountTwoUnits) then
      fkOrderItemRefCountTwoUnits.Free;
    if Assigned(FfkOrderItemRefPriceTwoUnits) then
      fkOrderItemRefPriceTwoUnits.Free;
    if Assigned(FfkOrderItemRefWeight) then
      fkOrderItemRefWeight.Free;
    if Assigned(FfkOrderItemRefSellingPriceWithoutNds) then
      fkOrderItemRefSellingPriceWithoutNds.Free;
    if Assigned(FfkOrderItemRefSellingCostWithoutNds) then
      fkOrderItemRefSellingCostWithoutNds.Free;
    if Assigned(FfkOrderItemRefDateRealiz) then
      fkOrderItemRefDateRealiz.Free;
    inherited Destroy;
  end; 
  
  destructor RQFKOrderItem2OSDataShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQFKOrderItem2OSData, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2OSData');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2OSDataRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2OSDataRef');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2OSDataFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2OSDataFilter');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2OSDataShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2OSDataShort');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2OSDataShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2OSDataShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQFKOrderItem2OSDataShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQFKOrderItem2OSDataShort');

  InvRegistry.RegisterInterface(TypeInfo(RQFKOrderItem2OSDataControllerSoapPort), 'http://ksoe.org/RQFKOrderItem2OSDataController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQFKOrderItem2OSDataControllerSoapPort), 'http://ksoe.org/RQFKOrderItem2OSDataController/action/RQFKOrderItem2OSDataController.%operationName%');


end.
