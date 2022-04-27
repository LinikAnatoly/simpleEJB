unit ENFuelSheetVolumesItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENFuelSheetVolumesController
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

  ENFuelSheetVolumesItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFuelSheetVolumesItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFuelSheetVolumesItem = class(TRemotable)
  private
    Fcode : Integer;
    Fdepname : WideString;
    Fpmm_count_on_start : TXSDecimal;
    Fpmm_count_on_start_all : TXSDecimal;
    Fservices_plan : TXSDecimal;
    Fservices_fact : TXSDecimal;
    Fservices_limit : TXSDecimal;
    Fcurrent_repair_plan : TXSDecimal;
    Fcurrent_repair_fact : TXSDecimal;
    Fcapital_repair_plan : TXSDecimal;
    Fcapital_repair_fact : TXSDecimal;
    Fmaintenance_plan : TXSDecimal;
    Fmaintenance_fact : TXSDecimal;
    Fsbyt_plan : TXSDecimal;
    Fsbyt_fact : TXSDecimal;
    Fother_plan : TXSDecimal;
    Fother_fact : TXSDecimal;
    Fmaintenance_sbyt_repairs_and_other_limit : TXSDecimal;
    Fcap_build_ip_plan : TXSDecimal;
    Fcap_build_ip_fact : TXSDecimal;
    Fcap_builders_ip_limit : TXSDecimal;
    Fcap_build_other_plan : TXSDecimal;
    Fcap_build_other_fact : TXSDecimal;
    Fcap_builders_other_limit : TXSDecimal;
    Fvrtu_plan : TXSDecimal;
    Fvrtu_fact : TXSDecimal;
    Fvrtu_limit : TXSDecimal;
    Favr_plan : TXSDecimal;
    Favr_fact : TXSDecimal;
    Favr_limit : TXSDecimal;
    Fodg_plan : TXSDecimal;
    Fodg_fact : TXSDecimal;
    Fall_limit : TXSDecimal;
    Fdecode : WideString;
    Fmol_codes : WideString;
    Fdatestart : TXSDate;
    Fdatefinal : TXSDate;
    Ford : Integer;
    Fall_plan : TXSDecimal;
    Frest_from_fk : TXSDecimal;
    Frest_from_fk_avz : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FsheetVolumesRef : ENFuelSheetVolumesRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property depname : WideString read Fdepname write Fdepname;
    property pmm_count_on_start : TXSDecimal read Fpmm_count_on_start write Fpmm_count_on_start;
    property pmm_count_on_start_all : TXSDecimal read Fpmm_count_on_start_all write Fpmm_count_on_start_all;
    property services_plan : TXSDecimal read Fservices_plan write Fservices_plan;
    property services_fact : TXSDecimal read Fservices_fact write Fservices_fact;
    property services_limit : TXSDecimal read Fservices_limit write Fservices_limit;
    property current_repair_plan : TXSDecimal read Fcurrent_repair_plan write Fcurrent_repair_plan;
    property current_repair_fact : TXSDecimal read Fcurrent_repair_fact write Fcurrent_repair_fact;
    property capital_repair_plan : TXSDecimal read Fcapital_repair_plan write Fcapital_repair_plan;
    property capital_repair_fact : TXSDecimal read Fcapital_repair_fact write Fcapital_repair_fact;
    property maintenance_plan : TXSDecimal read Fmaintenance_plan write Fmaintenance_plan;
    property maintenance_fact : TXSDecimal read Fmaintenance_fact write Fmaintenance_fact;
    property sbyt_plan : TXSDecimal read Fsbyt_plan write Fsbyt_plan;
    property sbyt_fact : TXSDecimal read Fsbyt_fact write Fsbyt_fact;
    property other_plan : TXSDecimal read Fother_plan write Fother_plan;
    property other_fact : TXSDecimal read Fother_fact write Fother_fact;
    property maintenance_sbyt_repairs_and_other_limit : TXSDecimal read Fmaintenance_sbyt_repairs_and_other_limit write Fmaintenance_sbyt_repairs_and_other_limit;
    property cap_build_ip_plan : TXSDecimal read Fcap_build_ip_plan write Fcap_build_ip_plan;
    property cap_build_ip_fact : TXSDecimal read Fcap_build_ip_fact write Fcap_build_ip_fact;
    property cap_builders_ip_limit : TXSDecimal read Fcap_builders_ip_limit write Fcap_builders_ip_limit;
    property cap_build_other_plan : TXSDecimal read Fcap_build_other_plan write Fcap_build_other_plan;
    property cap_build_other_fact : TXSDecimal read Fcap_build_other_fact write Fcap_build_other_fact;
    property cap_builders_other_limit : TXSDecimal read Fcap_builders_other_limit write Fcap_builders_other_limit;
    property vrtu_plan : TXSDecimal read Fvrtu_plan write Fvrtu_plan;
    property vrtu_fact : TXSDecimal read Fvrtu_fact write Fvrtu_fact;
    property vrtu_limit : TXSDecimal read Fvrtu_limit write Fvrtu_limit;
    property avr_plan : TXSDecimal read Favr_plan write Favr_plan;
    property avr_fact : TXSDecimal read Favr_fact write Favr_fact;
    property avr_limit : TXSDecimal read Favr_limit write Favr_limit;
    property odg_plan : TXSDecimal read Fodg_plan write Fodg_plan;
    property odg_fact : TXSDecimal read Fodg_fact write Fodg_fact;
    property all_limit : TXSDecimal read Fall_limit write Fall_limit;
    property decode : WideString read Fdecode write Fdecode;
    property mol_codes : WideString read Fmol_codes write Fmol_codes;
    property datestart : TXSDate read Fdatestart write Fdatestart;
    property datefinal : TXSDate read Fdatefinal write Fdatefinal;
    property  ord : Integer read Ford write Ford;
    property all_plan : TXSDecimal read Fall_plan write Fall_plan;
    property rest_from_fk : TXSDecimal read Frest_from_fk write Frest_from_fk;
    property rest_from_fk_avz : TXSDecimal read Frest_from_fk_avz write Frest_from_fk_avz;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property sheetVolumesRef : ENFuelSheetVolumesRef read FsheetVolumesRef write FsheetVolumesRef;
  end;

{
  ENFuelSheetVolumesItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fdepname : WideString;
    Fpmm_count_on_start : TXSDecimal;
    Fpmm_count_on_start_all : TXSDecimal;
    Fservices_plan : TXSDecimal;
    Fservices_fact : TXSDecimal;
    Fservices_limit : TXSDecimal;
    Fcurrent_repair_plan : TXSDecimal;
    Fcurrent_repair_fact : TXSDecimal;
    Fcapital_repair_plan : TXSDecimal;
    Fcapital_repair_fact : TXSDecimal;
    Fmaintenance_plan : TXSDecimal;
    Fmaintenance_fact : TXSDecimal;
    Fsbyt_plan : TXSDecimal;
    Fsbyt_fact : TXSDecimal;
    Fother_plan : TXSDecimal;
    Fother_fact : TXSDecimal;
    Fmaintenance_sbyt_repairs_and_other_limit : TXSDecimal;
    Fcap_build_ip_plan : TXSDecimal;
    Fcap_build_ip_fact : TXSDecimal;
    Fcap_builders_ip_limit : TXSDecimal;
    Fcap_build_other_plan : TXSDecimal;
    Fcap_build_other_fact : TXSDecimal;
    Fcap_builders_other_limit : TXSDecimal;
    Fvrtu_plan : TXSDecimal;
    Fvrtu_fact : TXSDecimal;
    Fvrtu_limit : TXSDecimal;
    Favr_plan : TXSDecimal;
    Favr_fact : TXSDecimal;
    Favr_limit : TXSDecimal;
    Fodg_plan : TXSDecimal;
    Fodg_fact : TXSDecimal;
    Fall_limit : TXSDecimal;
    Fdecode : WideString;
    Fmol_codes : WideString;
    Fdatestart : TXSDate;
    Fdatefinal : TXSDate;
    Ford : Integer;
    Fall_plan : TXSDecimal;
    Frest_from_fk : TXSDecimal;
    Frest_from_fk_avz : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : DateTime;
    Fmodify_time : Int64;
//???
    FsheetVolumesRef : ENFuelSheetVolumesRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property depname : WideString read Fdepname write Fdepname;
    property pmm_count_on_start : TXSDecimal read Fpmm_count_on_start write Fpmm_count_on_start;
    property pmm_count_on_start_all : TXSDecimal read Fpmm_count_on_start_all write Fpmm_count_on_start_all;
    property services_plan : TXSDecimal read Fservices_plan write Fservices_plan;
    property services_fact : TXSDecimal read Fservices_fact write Fservices_fact;
    property services_limit : TXSDecimal read Fservices_limit write Fservices_limit;
    property current_repair_plan : TXSDecimal read Fcurrent_repair_plan write Fcurrent_repair_plan;
    property current_repair_fact : TXSDecimal read Fcurrent_repair_fact write Fcurrent_repair_fact;
    property capital_repair_plan : TXSDecimal read Fcapital_repair_plan write Fcapital_repair_plan;
    property capital_repair_fact : TXSDecimal read Fcapital_repair_fact write Fcapital_repair_fact;
    property maintenance_plan : TXSDecimal read Fmaintenance_plan write Fmaintenance_plan;
    property maintenance_fact : TXSDecimal read Fmaintenance_fact write Fmaintenance_fact;
    property sbyt_plan : TXSDecimal read Fsbyt_plan write Fsbyt_plan;
    property sbyt_fact : TXSDecimal read Fsbyt_fact write Fsbyt_fact;
    property other_plan : TXSDecimal read Fother_plan write Fother_plan;
    property other_fact : TXSDecimal read Fother_fact write Fother_fact;
    property maintenance_sbyt_repairs_and_other_limit : TXSDecimal read Fmaintenance_sbyt_repairs_and_other_limit write Fmaintenance_sbyt_repairs_and_other_limit;
    property cap_build_ip_plan : TXSDecimal read Fcap_build_ip_plan write Fcap_build_ip_plan;
    property cap_build_ip_fact : TXSDecimal read Fcap_build_ip_fact write Fcap_build_ip_fact;
    property cap_builders_ip_limit : TXSDecimal read Fcap_builders_ip_limit write Fcap_builders_ip_limit;
    property cap_build_other_plan : TXSDecimal read Fcap_build_other_plan write Fcap_build_other_plan;
    property cap_build_other_fact : TXSDecimal read Fcap_build_other_fact write Fcap_build_other_fact;
    property cap_builders_other_limit : TXSDecimal read Fcap_builders_other_limit write Fcap_builders_other_limit;
    property vrtu_plan : TXSDecimal read Fvrtu_plan write Fvrtu_plan;
    property vrtu_fact : TXSDecimal read Fvrtu_fact write Fvrtu_fact;
    property vrtu_limit : TXSDecimal read Fvrtu_limit write Fvrtu_limit;
    property avr_plan : TXSDecimal read Favr_plan write Favr_plan;
    property avr_fact : TXSDecimal read Favr_fact write Favr_fact;
    property avr_limit : TXSDecimal read Favr_limit write Favr_limit;
    property odg_plan : TXSDecimal read Fodg_plan write Fodg_plan;
    property odg_fact : TXSDecimal read Fodg_fact write Fodg_fact;
    property all_limit : TXSDecimal read Fall_limit write Fall_limit;
    property decode : WideString read Fdecode write Fdecode;
    property mol_codes : WideString read Fmol_codes write Fmol_codes;
    property datestart : TXSDate read Fdatestart write Fdatestart;
    property datefinal : TXSDate read Fdatefinal write Fdatefinal;
    property  ord : Integer read Ford write Ford;
    property all_plan : TXSDecimal read Fall_plan write Fall_plan;
    property rest_from_fk : TXSDecimal read Frest_from_fk write Frest_from_fk;
    property rest_from_fk_avz : TXSDecimal read Frest_from_fk_avz write Frest_from_fk_avz;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property sheetVolumesRef : ENFuelSheetVolumesRef read FsheetVolumesRef write FsheetVolumesRef;
  end;
}

  ENFuelSheetVolumesItemFilter = class(ENFuelSheetVolumesItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENFuelSheetVolumesItemShort = class(TRemotable)
  private
    Fcode : Integer;
    Fdepname : WideString;
    Fpmm_count_on_start : TXSDecimal;
    Fpmm_count_on_start_all : TXSDecimal;
    Fservices_plan : TXSDecimal;
    Fservices_fact : TXSDecimal;
    Fservices_limit : TXSDecimal;
    Fcurrent_repair_plan : TXSDecimal;
    Fcurrent_repair_fact : TXSDecimal;
    Fcapital_repair_plan : TXSDecimal;
    Fcapital_repair_fact : TXSDecimal;
    Fmaintenance_plan : TXSDecimal;
    Fmaintenance_fact : TXSDecimal;
    Fsbyt_plan : TXSDecimal;
    Fsbyt_fact : TXSDecimal;
    Fother_plan : TXSDecimal;
    Fother_fact : TXSDecimal;
    Fmaintenance_sbyt_repairs_and_other_limit : TXSDecimal;
    Fcap_build_ip_plan : TXSDecimal;
    Fcap_build_ip_fact : TXSDecimal;
    Fcap_builders_ip_limit : TXSDecimal;
    Fcap_build_other_plan : TXSDecimal;
    Fcap_build_other_fact : TXSDecimal;
    Fcap_builders_other_limit : TXSDecimal;
    Fvrtu_plan : TXSDecimal;
    Fvrtu_fact : TXSDecimal;
    Fvrtu_limit : TXSDecimal;
    Favr_plan : TXSDecimal;
    Favr_fact : TXSDecimal;
    Favr_limit : TXSDecimal;
    Fodg_plan : TXSDecimal;
    Fodg_fact : TXSDecimal;
    Fall_limit : TXSDecimal;
    Fdecode : WideString;
    Fmol_codes : WideString;
    Fdatestart : TXSDate;
    Fdatefinal : TXSDate;
    Fall_plan : TXSDecimal;
    Frest_from_fk : TXSDecimal;
    Frest_from_fk_avz : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FsheetVolumesRefCode : Integer;
    FsheetVolumesRefName : WideString;
    FsheetVolumesRefDateGen : TXSDate;
    FsheetVolumesRefStartDate : TXSDate;
    FsheetVolumesRefEndDate : TXSDate;
    FsheetVolumesRefUserGen : WideString;
    FsheetVolumesRefDateEdit : TXSDateTime;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property depname : WideString read Fdepname write Fdepname;
    property pmm_count_on_start : TXSDecimal read Fpmm_count_on_start write Fpmm_count_on_start;
    property pmm_count_on_start_all : TXSDecimal read Fpmm_count_on_start_all write Fpmm_count_on_start_all;
    property services_plan : TXSDecimal read Fservices_plan write Fservices_plan;
    property services_fact : TXSDecimal read Fservices_fact write Fservices_fact;
    property services_limit : TXSDecimal read Fservices_limit write Fservices_limit;
    property current_repair_plan : TXSDecimal read Fcurrent_repair_plan write Fcurrent_repair_plan;
    property current_repair_fact : TXSDecimal read Fcurrent_repair_fact write Fcurrent_repair_fact;
    property capital_repair_plan : TXSDecimal read Fcapital_repair_plan write Fcapital_repair_plan;
    property capital_repair_fact : TXSDecimal read Fcapital_repair_fact write Fcapital_repair_fact;
    property maintenance_plan : TXSDecimal read Fmaintenance_plan write Fmaintenance_plan;
    property maintenance_fact : TXSDecimal read Fmaintenance_fact write Fmaintenance_fact;
    property sbyt_plan : TXSDecimal read Fsbyt_plan write Fsbyt_plan;
    property sbyt_fact : TXSDecimal read Fsbyt_fact write Fsbyt_fact;
    property other_plan : TXSDecimal read Fother_plan write Fother_plan;
    property other_fact : TXSDecimal read Fother_fact write Fother_fact;
    property maintenance_sbyt_repairs_and_other_limit : TXSDecimal read Fmaintenance_sbyt_repairs_and_other_limit write Fmaintenance_sbyt_repairs_and_other_limit;
    property cap_build_ip_plan : TXSDecimal read Fcap_build_ip_plan write Fcap_build_ip_plan;
    property cap_build_ip_fact : TXSDecimal read Fcap_build_ip_fact write Fcap_build_ip_fact;
    property cap_builders_ip_limit : TXSDecimal read Fcap_builders_ip_limit write Fcap_builders_ip_limit;
    property cap_build_other_plan : TXSDecimal read Fcap_build_other_plan write Fcap_build_other_plan;
    property cap_build_other_fact : TXSDecimal read Fcap_build_other_fact write Fcap_build_other_fact;
    property cap_builders_other_limit : TXSDecimal read Fcap_builders_other_limit write Fcap_builders_other_limit;
    property vrtu_plan : TXSDecimal read Fvrtu_plan write Fvrtu_plan;
    property vrtu_fact : TXSDecimal read Fvrtu_fact write Fvrtu_fact;
    property vrtu_limit : TXSDecimal read Fvrtu_limit write Fvrtu_limit;
    property avr_plan : TXSDecimal read Favr_plan write Favr_plan;
    property avr_fact : TXSDecimal read Favr_fact write Favr_fact;
    property avr_limit : TXSDecimal read Favr_limit write Favr_limit;
    property odg_plan : TXSDecimal read Fodg_plan write Fodg_plan;
    property odg_fact : TXSDecimal read Fodg_fact write Fodg_fact;
    property all_limit : TXSDecimal read Fall_limit write Fall_limit;
    property decode : WideString read Fdecode write Fdecode;
    property mol_codes : WideString read Fmol_codes write Fmol_codes;
    property datestart : TXSDate read Fdatestart write Fdatestart;
    property datefinal : TXSDate read Fdatefinal write Fdatefinal;
    property all_plan : TXSDecimal read Fall_plan write Fall_plan;
    property rest_from_fk : TXSDecimal read Frest_from_fk write Frest_from_fk;
    property rest_from_fk_avz : TXSDecimal read Frest_from_fk_avz write Frest_from_fk_avz;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property sheetVolumesRefCode : Integer read FsheetVolumesRefCode write FsheetVolumesRefCode;
    property sheetVolumesRefName : WideString read FsheetVolumesRefName write FsheetVolumesRefName;
    property sheetVolumesRefDateGen : TXSDate read FsheetVolumesRefDateGen write FsheetVolumesRefDateGen;
    property sheetVolumesRefStartDate : TXSDate read FsheetVolumesRefStartDate write FsheetVolumesRefStartDate;
    property sheetVolumesRefEndDate : TXSDate read FsheetVolumesRefEndDate write FsheetVolumesRefEndDate;
    property sheetVolumesRefUserGen : WideString read FsheetVolumesRefUserGen write FsheetVolumesRefUserGen;
    property sheetVolumesRefDateEdit : TXSDateTime read FsheetVolumesRefDateEdit write FsheetVolumesRefDateEdit;
  end;

  ArrayOfENFuelSheetVolumesItemShort = array of ENFuelSheetVolumesItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENFuelSheetVolumesItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENFuelSheetVolumesItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENFuelSheetVolumesItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENFuelSheetVolumesItemController/message/
  // soapAction: http://ksoe.org/ENFuelSheetVolumesItemController/action/ENFuelSheetVolumesItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENFuelSheetVolumesItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENFuelSheetVolumesItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENFuelSheetVolumesItemControllerSoapPort = interface(IInvokable)
  ['{74FEE741-A7FA-40A0-87B0-E36A934B65F7}']
    function add(const aENFuelSheetVolumesItem: ENFuelSheetVolumesItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENFuelSheetVolumesItem: ENFuelSheetVolumesItem); stdcall;
    function getObject(const anObjectCode: Integer): ENFuelSheetVolumesItem; stdcall;
    function getList: ENFuelSheetVolumesItemShortList; stdcall;
    function getFilteredList(const aENFuelSheetVolumesItemFilter: ENFuelSheetVolumesItemFilter): ENFuelSheetVolumesItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENFuelSheetVolumesItemShortList; stdcall;
    function getScrollableFilteredList(const aENFuelSheetVolumesItemFilter: ENFuelSheetVolumesItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENFuelSheetVolumesItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENFuelSheetVolumesItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENFuelSheetVolumesItemFilter: ENFuelSheetVolumesItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENFuelSheetVolumesItemShort; stdcall;
  end;


implementation

  destructor ENFuelSheetVolumesItem.Destroy;
  begin
    if Assigned(Fpmm_count_on_start) then
      pmm_count_on_start.Free;
    if Assigned(Fpmm_count_on_start_all) then
      pmm_count_on_start_all.Free;
    if Assigned(Fservices_plan) then
      services_plan.Free;
    if Assigned(Fservices_fact) then
      services_fact.Free;
    if Assigned(Fservices_limit) then
      services_limit.Free;
    if Assigned(Fcurrent_repair_plan) then
      current_repair_plan.Free;
    if Assigned(Fcurrent_repair_fact) then
      current_repair_fact.Free;
    if Assigned(Fcapital_repair_plan) then
      capital_repair_plan.Free;
    if Assigned(Fcapital_repair_fact) then
      capital_repair_fact.Free;
    if Assigned(Fmaintenance_plan) then
      maintenance_plan.Free;
    if Assigned(Fmaintenance_fact) then
      maintenance_fact.Free;
    if Assigned(Fsbyt_plan) then
      sbyt_plan.Free;
    if Assigned(Fsbyt_fact) then
      sbyt_fact.Free;
    if Assigned(Fother_plan) then
      other_plan.Free;
    if Assigned(Fother_fact) then
      other_fact.Free;
    if Assigned(Fmaintenance_sbyt_repairs_and_other_limit) then
      maintenance_sbyt_repairs_and_other_limit.Free;
    if Assigned(Fcap_build_ip_plan) then
      cap_build_ip_plan.Free;
    if Assigned(Fcap_build_ip_fact) then
      cap_build_ip_fact.Free;
    if Assigned(Fcap_builders_ip_limit) then
      cap_builders_ip_limit.Free;
    if Assigned(Fcap_build_other_plan) then
      cap_build_other_plan.Free;
    if Assigned(Fcap_build_other_fact) then
      cap_build_other_fact.Free;
    if Assigned(Fcap_builders_other_limit) then
      cap_builders_other_limit.Free;
    if Assigned(Fvrtu_plan) then
      vrtu_plan.Free;
    if Assigned(Fvrtu_fact) then
      vrtu_fact.Free;
    if Assigned(Fvrtu_limit) then
      vrtu_limit.Free;
    if Assigned(Favr_plan) then
      avr_plan.Free;
    if Assigned(Favr_fact) then
      avr_fact.Free;
    if Assigned(Favr_limit) then
      avr_limit.Free;
    if Assigned(Fodg_plan) then
      odg_plan.Free;
    if Assigned(Fodg_fact) then
      odg_fact.Free;
    if Assigned(Fall_limit) then
      all_limit.Free;
    if Assigned(Fdatestart) then
      datestart.Free;
    if Assigned(Fdatefinal) then
      datefinal.Free;
    if Assigned(Fall_plan) then
      all_plan.Free;
    if Assigned(Frest_from_fk) then
      rest_from_fk.Free;
    if Assigned(Frest_from_fk_avz) then
      rest_from_fk_avz.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FsheetVolumesRef) then
      sheetVolumesRef.Free;
    inherited Destroy;
  end;

{
  destructor ENFuelSheetVolumesItemFilter.Destroy;
  begin
    if Assigned(Fpmm_count_on_start) then
      pmm_count_on_start.Free;
    if Assigned(Fpmm_count_on_start_all) then
      pmm_count_on_start_all.Free;
    if Assigned(Fservices_plan) then
      services_plan.Free;
    if Assigned(Fservices_fact) then
      services_fact.Free;
    if Assigned(Fservices_limit) then
      services_limit.Free;
    if Assigned(Fcurrent_repair_plan) then
      current_repair_plan.Free;
    if Assigned(Fcurrent_repair_fact) then
      current_repair_fact.Free;
    if Assigned(Fcapital_repair_plan) then
      capital_repair_plan.Free;
    if Assigned(Fcapital_repair_fact) then
      capital_repair_fact.Free;
    if Assigned(Fmaintenance_plan) then
      maintenance_plan.Free;
    if Assigned(Fmaintenance_fact) then
      maintenance_fact.Free;
    if Assigned(Fsbyt_plan) then
      sbyt_plan.Free;
    if Assigned(Fsbyt_fact) then
      sbyt_fact.Free;
    if Assigned(Fother_plan) then
      other_plan.Free;
    if Assigned(Fother_fact) then
      other_fact.Free;
    if Assigned(Fmaintenance_sbyt_repairs_and_other_limit) then
      maintenance_sbyt_repairs_and_other_limit.Free;
    if Assigned(Fcap_build_ip_plan) then
      cap_build_ip_plan.Free;
    if Assigned(Fcap_build_ip_fact) then
      cap_build_ip_fact.Free;
    if Assigned(Fcap_builders_ip_limit) then
      cap_builders_ip_limit.Free;
    if Assigned(Fcap_build_other_plan) then
      cap_build_other_plan.Free;
    if Assigned(Fcap_build_other_fact) then
      cap_build_other_fact.Free;
    if Assigned(Fcap_builders_other_limit) then
      cap_builders_other_limit.Free;
    if Assigned(Fvrtu_plan) then
      vrtu_plan.Free;
    if Assigned(Fvrtu_fact) then
      vrtu_fact.Free;
    if Assigned(Fvrtu_limit) then
      vrtu_limit.Free;
    if Assigned(Favr_plan) then
      avr_plan.Free;
    if Assigned(Favr_fact) then
      avr_fact.Free;
    if Assigned(Favr_limit) then
      avr_limit.Free;
    if Assigned(Fodg_plan) then
      odg_plan.Free;
    if Assigned(Fodg_fact) then
      odg_fact.Free;
    if Assigned(Fall_limit) then
      all_limit.Free;
    if Assigned(Fdatestart) then
      datestart.Free;
    if Assigned(Fdatefinal) then
      datefinal.Free;
    if Assigned(Fall_plan) then
      all_plan.Free;
    if Assigned(Frest_from_fk) then
      rest_from_fk.Free;
    if Assigned(Frest_from_fk_avz) then
      rest_from_fk_avz.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FsheetVolumesRef) then
      sheetVolumesRef.Free;
    inherited Destroy;
  end;
}

  destructor ENFuelSheetVolumesItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENFuelSheetVolumesItemShort.Destroy;
  begin
    if Assigned(Fpmm_count_on_start) then
      pmm_count_on_start.Free;
    if Assigned(Fpmm_count_on_start_all) then
      pmm_count_on_start_all.Free;
    if Assigned(Fservices_plan) then
      services_plan.Free;
    if Assigned(Fservices_fact) then
      services_fact.Free;
    if Assigned(Fservices_limit) then
      services_limit.Free;
    if Assigned(Fcurrent_repair_plan) then
      current_repair_plan.Free;
    if Assigned(Fcurrent_repair_fact) then
      current_repair_fact.Free;
    if Assigned(Fcapital_repair_plan) then
      capital_repair_plan.Free;
    if Assigned(Fcapital_repair_fact) then
      capital_repair_fact.Free;
    if Assigned(Fmaintenance_plan) then
      maintenance_plan.Free;
    if Assigned(Fmaintenance_fact) then
      maintenance_fact.Free;
    if Assigned(Fsbyt_plan) then
      sbyt_plan.Free;
    if Assigned(Fsbyt_fact) then
      sbyt_fact.Free;
    if Assigned(Fother_plan) then
      other_plan.Free;
    if Assigned(Fother_fact) then
      other_fact.Free;
    if Assigned(Fmaintenance_sbyt_repairs_and_other_limit) then
      maintenance_sbyt_repairs_and_other_limit.Free;
    if Assigned(Fcap_build_ip_plan) then
      cap_build_ip_plan.Free;
    if Assigned(Fcap_build_ip_fact) then
      cap_build_ip_fact.Free;
    if Assigned(Fcap_builders_ip_limit) then
      cap_builders_ip_limit.Free;
    if Assigned(Fcap_build_other_plan) then
      cap_build_other_plan.Free;
    if Assigned(Fcap_build_other_fact) then
      cap_build_other_fact.Free;
    if Assigned(Fcap_builders_other_limit) then
      cap_builders_other_limit.Free;
    if Assigned(Fvrtu_plan) then
      vrtu_plan.Free;
    if Assigned(Fvrtu_fact) then
      vrtu_fact.Free;
    if Assigned(Fvrtu_limit) then
      vrtu_limit.Free;
    if Assigned(Favr_plan) then
      avr_plan.Free;
    if Assigned(Favr_fact) then
      avr_fact.Free;
    if Assigned(Favr_limit) then
      avr_limit.Free;
    if Assigned(Fodg_plan) then
      odg_plan.Free;
    if Assigned(Fodg_fact) then
      odg_fact.Free;
    if Assigned(Fall_limit) then
      all_limit.Free;
    if Assigned(Fdatestart) then
      datestart.Free;
    if Assigned(Fdatefinal) then
      datefinal.Free;
    if Assigned(Fall_plan) then
      all_plan.Free;
    if Assigned(Frest_from_fk) then
      rest_from_fk.Free;
    if Assigned(Frest_from_fk_avz) then
      rest_from_fk_avz.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FsheetVolumesRefDateGen) then
      sheetVolumesRefDateGen.Free;
    if Assigned(FsheetVolumesRefStartDate) then
      sheetVolumesRefStartDate.Free;
    if Assigned(FsheetVolumesRefEndDate) then
      sheetVolumesRefEndDate.Free;
    if Assigned(FsheetVolumesRefDateEdit) then
      sheetVolumesRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENFuelSheetVolumesItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENFuelSheetVolumesItem, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelSheetVolumesItem');
  RemClassRegistry.RegisterXSClass(ENFuelSheetVolumesItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelSheetVolumesItemRef');
  RemClassRegistry.RegisterXSClass(ENFuelSheetVolumesItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelSheetVolumesItemFilter');
  RemClassRegistry.RegisterXSClass(ENFuelSheetVolumesItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelSheetVolumesItemShort');
  RemClassRegistry.RegisterXSClass(ENFuelSheetVolumesItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelSheetVolumesItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENFuelSheetVolumesItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENFuelSheetVolumesItemShort');

  InvRegistry.RegisterInterface(TypeInfo(ENFuelSheetVolumesItemControllerSoapPort), 'http://ksoe.org/ENFuelSheetVolumesItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENFuelSheetVolumesItemControllerSoapPort), 'http://ksoe.org/ENFuelSheetVolumesItemController/action/ENFuelSheetVolumesItemController.%operationName%');


end.
