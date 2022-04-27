unit CNTechTermsController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,CNSubsystemTypeController 
   ,CNPackController 
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

  CNTechTerms            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  CNTechTermsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  CNTechTerms = class(TRemotable)
  private
    Fcode : Integer; 
    Fid_proposal : Integer; 
    FproposalName : WideString;
    Fpower1 : TXSDecimal;
    Fpower1prosp : TXSDecimal;
    Fpower1heat : TXSDecimal;
    Fpower2 : TXSDecimal;
    Fpower2prosp : TXSDecimal;
    Fpower2heat : TXSDecimal;
    Fpower3 : TXSDecimal;
    Fpower3prosp : TXSDecimal;
    Fpower3heat : TXSDecimal;
    Fpow_stove : TXSDecimal;
    Fpow_water_heat : TXSDecimal;
    Fpow_house_heat : TXSDecimal;
    Ftension_point : TXSDecimal;
    Fcurrent_automat : TXSDecimal;
    Fpow_exist : TXSDecimal;
    Ftension_exist : TXSDecimal;
    Fis_realized : Integer; 
    Freason : WideString;
    Fsource : WideString;
    Fsource_num : WideString;
    Fensur_point : WideString;
    Fensur_point_num : WideString;
    Fconnect_point : WideString;
    Fconnect_point_num : WideString;
    Fexploit_year : Integer; 
    FbaseStation : Integer; 
//???
    FsubsystemRef : CNSubsystemTypeRef;
//???
    FcnPackRef : CNPackRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property  id_proposal : Integer read Fid_proposal write Fid_proposal; 
    property proposalName : WideString read FproposalName write FproposalName;
    property power1 : TXSDecimal read Fpower1 write Fpower1; 
    property power1prosp : TXSDecimal read Fpower1prosp write Fpower1prosp; 
    property power1heat : TXSDecimal read Fpower1heat write Fpower1heat; 
    property power2 : TXSDecimal read Fpower2 write Fpower2; 
    property power2prosp : TXSDecimal read Fpower2prosp write Fpower2prosp; 
    property power2heat : TXSDecimal read Fpower2heat write Fpower2heat; 
    property power3 : TXSDecimal read Fpower3 write Fpower3; 
    property power3prosp : TXSDecimal read Fpower3prosp write Fpower3prosp; 
    property power3heat : TXSDecimal read Fpower3heat write Fpower3heat; 
    property pow_stove : TXSDecimal read Fpow_stove write Fpow_stove; 
    property pow_water_heat : TXSDecimal read Fpow_water_heat write Fpow_water_heat; 
    property pow_house_heat : TXSDecimal read Fpow_house_heat write Fpow_house_heat; 
    property tension_point : TXSDecimal read Ftension_point write Ftension_point; 
    property current_automat : TXSDecimal read Fcurrent_automat write Fcurrent_automat; 
    property pow_exist : TXSDecimal read Fpow_exist write Fpow_exist; 
    property tension_exist : TXSDecimal read Ftension_exist write Ftension_exist; 
    property  is_realized : Integer read Fis_realized write Fis_realized; 
    property reason : WideString read Freason write Freason;
    property source : WideString read Fsource write Fsource;
    property source_num : WideString read Fsource_num write Fsource_num;
    property ensur_point : WideString read Fensur_point write Fensur_point;
    property ensur_point_num : WideString read Fensur_point_num write Fensur_point_num;
    property connect_point : WideString read Fconnect_point write Fconnect_point;
    property connect_point_num : WideString read Fconnect_point_num write Fconnect_point_num;
    property  exploit_year : Integer read Fexploit_year write Fexploit_year; 
    property  baseStation : Integer read FbaseStation write FbaseStation; 
    property subsystemRef : CNSubsystemTypeRef read FsubsystemRef write FsubsystemRef; 
    property cnPackRef : CNPackRef read FcnPackRef write FcnPackRef; 
  end;
  
{
  CNTechTermsFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fid_proposal : Integer; 
    FproposalName : WideString;
    Fpower1 : TXSDecimal;
    Fpower1prosp : TXSDecimal;
    Fpower1heat : TXSDecimal;
    Fpower2 : TXSDecimal;
    Fpower2prosp : TXSDecimal;
    Fpower2heat : TXSDecimal;
    Fpower3 : TXSDecimal;
    Fpower3prosp : TXSDecimal;
    Fpower3heat : TXSDecimal;
    Fpow_stove : TXSDecimal;
    Fpow_water_heat : TXSDecimal;
    Fpow_house_heat : TXSDecimal;
    Ftension_point : TXSDecimal;
    Fcurrent_automat : TXSDecimal;
    Fpow_exist : TXSDecimal;
    Ftension_exist : TXSDecimal;
    Fis_realized : Integer; 
    Freason : WideString;
    Fsource : WideString;
    Fsource_num : WideString;
    Fensur_point : WideString;
    Fensur_point_num : WideString;
    Fconnect_point : WideString;
    Fconnect_point_num : WideString;
    Fexploit_year : Integer; 
    FbaseStation : Integer; 
//???
    FsubsystemRef : CNSubsystemTypeRef;
//???
    FcnPackRef : CNPackRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property  id_proposal : Integer read Fid_proposal write Fid_proposal; 
    property proposalName : WideString read FproposalName write FproposalName;
    property power1 : TXSDecimal read Fpower1 write Fpower1; 
    property power1prosp : TXSDecimal read Fpower1prosp write Fpower1prosp; 
    property power1heat : TXSDecimal read Fpower1heat write Fpower1heat; 
    property power2 : TXSDecimal read Fpower2 write Fpower2; 
    property power2prosp : TXSDecimal read Fpower2prosp write Fpower2prosp; 
    property power2heat : TXSDecimal read Fpower2heat write Fpower2heat; 
    property power3 : TXSDecimal read Fpower3 write Fpower3; 
    property power3prosp : TXSDecimal read Fpower3prosp write Fpower3prosp; 
    property power3heat : TXSDecimal read Fpower3heat write Fpower3heat; 
    property pow_stove : TXSDecimal read Fpow_stove write Fpow_stove; 
    property pow_water_heat : TXSDecimal read Fpow_water_heat write Fpow_water_heat; 
    property pow_house_heat : TXSDecimal read Fpow_house_heat write Fpow_house_heat; 
    property tension_point : TXSDecimal read Ftension_point write Ftension_point; 
    property current_automat : TXSDecimal read Fcurrent_automat write Fcurrent_automat; 
    property pow_exist : TXSDecimal read Fpow_exist write Fpow_exist; 
    property tension_exist : TXSDecimal read Ftension_exist write Ftension_exist; 
    property  is_realized : Integer read Fis_realized write Fis_realized; 
    property reason : WideString read Freason write Freason;
    property source : WideString read Fsource write Fsource;
    property source_num : WideString read Fsource_num write Fsource_num;
    property ensur_point : WideString read Fensur_point write Fensur_point;
    property ensur_point_num : WideString read Fensur_point_num write Fensur_point_num;
    property connect_point : WideString read Fconnect_point write Fconnect_point;
    property connect_point_num : WideString read Fconnect_point_num write Fconnect_point_num;
    property  exploit_year : Integer read Fexploit_year write Fexploit_year; 
    property  baseStation : Integer read FbaseStation write FbaseStation; 
    property subsystemRef : CNSubsystemTypeRef read FsubsystemRef write FsubsystemRef; 
    property cnPackRef : CNPackRef read FcnPackRef write FcnPackRef; 
  end;
}

  CNTechTermsFilter = class(CNTechTerms)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  CNTechTermsShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fid_proposal : Integer; 
    FproposalName : WideString;
    Fpower1 : TXSDecimal;
    Fpower1prosp : TXSDecimal;
    Fpower1heat : TXSDecimal;
    Fpower2 : TXSDecimal;
    Fpower2prosp : TXSDecimal;
    Fpower2heat : TXSDecimal;
    Fpower3 : TXSDecimal;
    Fpower3prosp : TXSDecimal;
    Fpower3heat : TXSDecimal;
    Fpow_stove : TXSDecimal;
    Fpow_water_heat : TXSDecimal;
    Fpow_house_heat : TXSDecimal;
    Ftension_point : TXSDecimal;
    Fcurrent_automat : TXSDecimal;
    Fpow_exist : TXSDecimal;
    Ftension_exist : TXSDecimal;
    Fis_realized : Integer; 
    Freason : WideString;
    Fsource : WideString;
    Fsource_num : WideString;
    Fensur_point : WideString;
    Fensur_point_num : WideString;
    Fconnect_point : WideString;
    Fconnect_point_num : WideString;
    Fexploit_year : Integer; 
    FbaseStation : Integer; 
    FsubsystemRefCode : Integer; 
    FsubsystemRefName : WideString;
    FcnPackRefCode : Integer; 
    FcnPackRefPackCode : Integer; 
    FcnPackRefName : WideString;
    FcnPackRefId_ren : Integer; 
    FcnPackRefRenName : WideString;
    FcnPackRefId_district : Integer; 
    FcnPackRefDistrictName : WideString;
    FcnPackRefId_pack_status : Integer; 
    FcnPackRefStatusName : WideString;
    FcnPackRefDescription : WideString;
    FcnPackRefPower : TXSDecimal;
    FcnPackRefAddress : WideString;
    FcnPackRefAddress_jur : WideString;
    FcnPackRefReg_num_cn_contract : WideString;
    FcnPackRefDate_cn_contract : TXSDate;
    FcnPackRefReg_num_spl_pp_contract : WideString;
    FcnPackRefDate_spl_pp_contract : TXSDate;
    FcnPackRefReg_num_tu_contract : WideString;
    FcnPackRefDate_tu_contract : TXSDate;
    FcnPackRefReg_num_tu_cr_contract : WideString;
    FcnPackRefDate_tu_cr_contract : TXSDate;
    FcnPackRefProject_num : WideString;
    FcnPackRefProject_date : TXSDate;
    FcnPackRefOver5 : Integer; 
    FcnPackRefStatus : Integer; 
    FcnPackRefLetter_num_customer : WideString;
    FcnPackRefDate_letter_customer : TXSDate;
    FcnPackRefLetter_num : WideString;
    FcnPackRefDate_letter : TXSDate;
    FcnPackRefReliability_class : WideString;
    FcnPackRefId_waiting_status : Integer; 
    FcnPackRefWaitingStatus : WideString;
    FcnPackRefIs_payable : Integer; 
    FcnPackRefWorksize : WideString;
    FcnPackRefWork_inc_net : WideString;
    FcnPackRefBusiness_type : WideString;
    FcnPackRefEstimateterm : Integer; 
    FcnPackRefEstimatedate : TXSDate;
    FcnPackRefBuildingterm : Integer; 
    FcnPackRefBuildingdate : TXSDate;
    FcnPackRefBuyingterm : Integer; 
    FcnPackRefBuyingdate : TXSDate;
    FcnPackRefEstimate_num : WideString;
    FcnPackRefEstimate_contract_date : TXSDate;
    FcnPackRefIs_reserv : Integer; 
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property  id_proposal : Integer read Fid_proposal write Fid_proposal; 
    property proposalName : WideString read FproposalName write FproposalName;
    property power1 : TXSDecimal read Fpower1 write Fpower1; 
    property power1prosp : TXSDecimal read Fpower1prosp write Fpower1prosp; 
    property power1heat : TXSDecimal read Fpower1heat write Fpower1heat; 
    property power2 : TXSDecimal read Fpower2 write Fpower2; 
    property power2prosp : TXSDecimal read Fpower2prosp write Fpower2prosp; 
    property power2heat : TXSDecimal read Fpower2heat write Fpower2heat; 
    property power3 : TXSDecimal read Fpower3 write Fpower3; 
    property power3prosp : TXSDecimal read Fpower3prosp write Fpower3prosp; 
    property power3heat : TXSDecimal read Fpower3heat write Fpower3heat; 
    property pow_stove : TXSDecimal read Fpow_stove write Fpow_stove; 
    property pow_water_heat : TXSDecimal read Fpow_water_heat write Fpow_water_heat; 
    property pow_house_heat : TXSDecimal read Fpow_house_heat write Fpow_house_heat; 
    property tension_point : TXSDecimal read Ftension_point write Ftension_point; 
    property current_automat : TXSDecimal read Fcurrent_automat write Fcurrent_automat; 
    property pow_exist : TXSDecimal read Fpow_exist write Fpow_exist; 
    property tension_exist : TXSDecimal read Ftension_exist write Ftension_exist; 
    property  is_realized : Integer read Fis_realized write Fis_realized; 
    property reason : WideString read Freason write Freason;
    property source : WideString read Fsource write Fsource;
    property source_num : WideString read Fsource_num write Fsource_num;
    property ensur_point : WideString read Fensur_point write Fensur_point;
    property ensur_point_num : WideString read Fensur_point_num write Fensur_point_num;
    property connect_point : WideString read Fconnect_point write Fconnect_point;
    property connect_point_num : WideString read Fconnect_point_num write Fconnect_point_num;
    property  exploit_year : Integer read Fexploit_year write Fexploit_year; 
    property  baseStation : Integer read FbaseStation write FbaseStation; 

    property subsystemRefCode : Integer read FsubsystemRefCode write FsubsystemRefCode; 
    property subsystemRefName : WideString read FsubsystemRefName write FsubsystemRefName; 
    property cnPackRefCode : Integer read FcnPackRefCode write FcnPackRefCode; 
    property cnPackRefPackCode : Integer read FcnPackRefPackCode write FcnPackRefPackCode; 
    property cnPackRefName : WideString read FcnPackRefName write FcnPackRefName; 
    property cnPackRefId_ren : Integer read FcnPackRefId_ren write FcnPackRefId_ren; 
    property cnPackRefRenName : WideString read FcnPackRefRenName write FcnPackRefRenName; 
    property cnPackRefId_district : Integer read FcnPackRefId_district write FcnPackRefId_district; 
    property cnPackRefDistrictName : WideString read FcnPackRefDistrictName write FcnPackRefDistrictName; 
    property cnPackRefId_pack_status : Integer read FcnPackRefId_pack_status write FcnPackRefId_pack_status; 
    property cnPackRefStatusName : WideString read FcnPackRefStatusName write FcnPackRefStatusName; 
    property cnPackRefDescription : WideString read FcnPackRefDescription write FcnPackRefDescription; 
    property cnPackRefPower : TXSDecimal read FcnPackRefPower write FcnPackRefPower; 
    property cnPackRefAddress : WideString read FcnPackRefAddress write FcnPackRefAddress; 
    property cnPackRefAddress_jur : WideString read FcnPackRefAddress_jur write FcnPackRefAddress_jur; 
    property cnPackRefReg_num_cn_contract : WideString read FcnPackRefReg_num_cn_contract write FcnPackRefReg_num_cn_contract; 
    property cnPackRefDate_cn_contract : TXSDate read FcnPackRefDate_cn_contract write FcnPackRefDate_cn_contract; 
    property cnPackRefReg_num_spl_pp_contract : WideString read FcnPackRefReg_num_spl_pp_contract write FcnPackRefReg_num_spl_pp_contract; 
    property cnPackRefDate_spl_pp_contract : TXSDate read FcnPackRefDate_spl_pp_contract write FcnPackRefDate_spl_pp_contract; 
    property cnPackRefReg_num_tu_contract : WideString read FcnPackRefReg_num_tu_contract write FcnPackRefReg_num_tu_contract; 
    property cnPackRefDate_tu_contract : TXSDate read FcnPackRefDate_tu_contract write FcnPackRefDate_tu_contract; 
    property cnPackRefReg_num_tu_cr_contract : WideString read FcnPackRefReg_num_tu_cr_contract write FcnPackRefReg_num_tu_cr_contract; 
    property cnPackRefDate_tu_cr_contract : TXSDate read FcnPackRefDate_tu_cr_contract write FcnPackRefDate_tu_cr_contract; 
    property cnPackRefProject_num : WideString read FcnPackRefProject_num write FcnPackRefProject_num; 
    property cnPackRefProject_date : TXSDate read FcnPackRefProject_date write FcnPackRefProject_date; 
    property cnPackRefOver5 : Integer read FcnPackRefOver5 write FcnPackRefOver5; 
    property cnPackRefStatus : Integer read FcnPackRefStatus write FcnPackRefStatus; 
    property cnPackRefLetter_num_customer : WideString read FcnPackRefLetter_num_customer write FcnPackRefLetter_num_customer; 
    property cnPackRefDate_letter_customer : TXSDate read FcnPackRefDate_letter_customer write FcnPackRefDate_letter_customer; 
    property cnPackRefLetter_num : WideString read FcnPackRefLetter_num write FcnPackRefLetter_num; 
    property cnPackRefDate_letter : TXSDate read FcnPackRefDate_letter write FcnPackRefDate_letter; 
    property cnPackRefReliability_class : WideString read FcnPackRefReliability_class write FcnPackRefReliability_class; 
    property cnPackRefId_waiting_status : Integer read FcnPackRefId_waiting_status write FcnPackRefId_waiting_status; 
    property cnPackRefWaitingStatus : WideString read FcnPackRefWaitingStatus write FcnPackRefWaitingStatus; 
    property cnPackRefIs_payable : Integer read FcnPackRefIs_payable write FcnPackRefIs_payable; 
    property cnPackRefWorksize : WideString read FcnPackRefWorksize write FcnPackRefWorksize; 
    property cnPackRefWork_inc_net : WideString read FcnPackRefWork_inc_net write FcnPackRefWork_inc_net; 
    property cnPackRefBusiness_type : WideString read FcnPackRefBusiness_type write FcnPackRefBusiness_type; 
    property cnPackRefEstimateterm : Integer read FcnPackRefEstimateterm write FcnPackRefEstimateterm; 
    property cnPackRefEstimatedate : TXSDate read FcnPackRefEstimatedate write FcnPackRefEstimatedate; 
    property cnPackRefBuildingterm : Integer read FcnPackRefBuildingterm write FcnPackRefBuildingterm; 
    property cnPackRefBuildingdate : TXSDate read FcnPackRefBuildingdate write FcnPackRefBuildingdate; 
    property cnPackRefBuyingterm : Integer read FcnPackRefBuyingterm write FcnPackRefBuyingterm; 
    property cnPackRefBuyingdate : TXSDate read FcnPackRefBuyingdate write FcnPackRefBuyingdate; 
    property cnPackRefEstimate_num : WideString read FcnPackRefEstimate_num write FcnPackRefEstimate_num; 
    property cnPackRefEstimate_contract_date : TXSDate read FcnPackRefEstimate_contract_date write FcnPackRefEstimate_contract_date; 
    property cnPackRefIs_reserv : Integer read FcnPackRefIs_reserv write FcnPackRefIs_reserv; 
  end;

  ArrayOfCNTechTermsShort = array of CNTechTermsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  CNTechTermsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfCNTechTermsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfCNTechTermsShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/CNTechTermsController/message/
  // soapAction: http://ksoe.org/CNTechTermsController/action/CNTechTermsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : CNTechTermsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : CNTechTermsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  CNTechTermsControllerSoapPort = interface(IInvokable)
  ['{1c511c51-1c51-1c51-1c51-1c511c511c51}']
    function  add(const aCNTechTerms: CNTechTerms): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aCNTechTerms: CNTechTerms); stdcall;
    function  getObject(const anObjectCode: Integer): CNTechTerms; stdcall;
    function  getList: CNTechTermsShortList; stdcall;
    function  getFilteredList(const aCNTechTermsFilter: CNTechTermsFilter): CNTechTermsShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): CNTechTermsShortList; stdcall;
    function  getScrollableFilteredList(const aCNTechTermsFilter: CNTechTermsFilter; const aFromPosition: Integer; const aQuantity: Integer): CNTechTermsShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): CNTechTermsShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aCNTechTermsFilter: CNTechTermsFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor CNTechTerms.Destroy;
  begin
    if Assigned(Fpower1) then
      power1.Free;
    if Assigned(Fpower1prosp) then
      power1prosp.Free;
    if Assigned(Fpower1heat) then
      power1heat.Free;
    if Assigned(Fpower2) then
      power2.Free;
    if Assigned(Fpower2prosp) then
      power2prosp.Free;
    if Assigned(Fpower2heat) then
      power2heat.Free;
    if Assigned(Fpower3) then
      power3.Free;
    if Assigned(Fpower3prosp) then
      power3prosp.Free;
    if Assigned(Fpower3heat) then
      power3heat.Free;
    if Assigned(Fpow_stove) then
      pow_stove.Free;
    if Assigned(Fpow_water_heat) then
      pow_water_heat.Free;
    if Assigned(Fpow_house_heat) then
      pow_house_heat.Free;
    if Assigned(Ftension_point) then
      tension_point.Free;
    if Assigned(Fcurrent_automat) then
      current_automat.Free;
    if Assigned(Fpow_exist) then
      pow_exist.Free;
    if Assigned(Ftension_exist) then
      tension_exist.Free;
    if Assigned(FsubsystemRef) then
      subsystemRef.Free;
    if Assigned(FcnPackRef) then
      cnPackRef.Free;
    inherited Destroy;
  end;

{  
  destructor CNTechTermsFilter.Destroy;
  begin
    if Assigned(Fpower1) then
      power1.Free;
    if Assigned(Fpower1prosp) then
      power1prosp.Free;
    if Assigned(Fpower1heat) then
      power1heat.Free;
    if Assigned(Fpower2) then
      power2.Free;
    if Assigned(Fpower2prosp) then
      power2prosp.Free;
    if Assigned(Fpower2heat) then
      power2heat.Free;
    if Assigned(Fpower3) then
      power3.Free;
    if Assigned(Fpower3prosp) then
      power3prosp.Free;
    if Assigned(Fpower3heat) then
      power3heat.Free;
    if Assigned(Fpow_stove) then
      pow_stove.Free;
    if Assigned(Fpow_water_heat) then
      pow_water_heat.Free;
    if Assigned(Fpow_house_heat) then
      pow_house_heat.Free;
    if Assigned(Ftension_point) then
      tension_point.Free;
    if Assigned(Fcurrent_automat) then
      current_automat.Free;
    if Assigned(Fpow_exist) then
      pow_exist.Free;
    if Assigned(Ftension_exist) then
      tension_exist.Free;
    if Assigned(FsubsystemRef) then
      subsystemRef.Free;
    if Assigned(FcnPackRef) then
      cnPackRef.Free;
    inherited Destroy;
  end; 
}

  destructor CNTechTermsFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor CNTechTermsShort.Destroy;
  begin
    if Assigned(Fpower1) then
      power1.Free;
    if Assigned(Fpower1prosp) then
      power1prosp.Free;
    if Assigned(Fpower1heat) then
      power1heat.Free;
    if Assigned(Fpower2) then
      power2.Free;
    if Assigned(Fpower2prosp) then
      power2prosp.Free;
    if Assigned(Fpower2heat) then
      power2heat.Free;
    if Assigned(Fpower3) then
      power3.Free;
    if Assigned(Fpower3prosp) then
      power3prosp.Free;
    if Assigned(Fpower3heat) then
      power3heat.Free;
    if Assigned(Fpow_stove) then
      pow_stove.Free;
    if Assigned(Fpow_water_heat) then
      pow_water_heat.Free;
    if Assigned(Fpow_house_heat) then
      pow_house_heat.Free;
    if Assigned(Ftension_point) then
      tension_point.Free;
    if Assigned(Fcurrent_automat) then
      current_automat.Free;
    if Assigned(Fpow_exist) then
      pow_exist.Free;
    if Assigned(Ftension_exist) then
      tension_exist.Free;
    if Assigned(FcnPackRefPower) then
      cnPackRefPower.Free;
    if Assigned(FcnPackRefDate_cn_contract) then
      cnPackRefDate_cn_contract.Free;
    if Assigned(FcnPackRefDate_spl_pp_contract) then
      cnPackRefDate_spl_pp_contract.Free;
    if Assigned(FcnPackRefDate_tu_contract) then
      cnPackRefDate_tu_contract.Free;
    if Assigned(FcnPackRefDate_tu_cr_contract) then
      cnPackRefDate_tu_cr_contract.Free;
    if Assigned(FcnPackRefProject_date) then
      cnPackRefProject_date.Free;
    if Assigned(FcnPackRefDate_letter_customer) then
      cnPackRefDate_letter_customer.Free;
    if Assigned(FcnPackRefDate_letter) then
      cnPackRefDate_letter.Free;
    if Assigned(FcnPackRefEstimatedate) then
      cnPackRefEstimatedate.Free;
    if Assigned(FcnPackRefBuildingdate) then
      cnPackRefBuildingdate.Free;
    if Assigned(FcnPackRefBuyingdate) then
      cnPackRefBuyingdate.Free;
    if Assigned(FcnPackRefEstimate_contract_date) then
      cnPackRefEstimate_contract_date.Free;
    inherited Destroy;
  end; 
  
  destructor CNTechTermsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(CNTechTerms, 'http://ksoe.org/EnergyproControllerService/type/', 'CNTechTerms');
  RemClassRegistry.RegisterXSClass(CNTechTermsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'CNTechTermsRef');
  RemClassRegistry.RegisterXSClass(CNTechTermsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'CNTechTermsFilter');
  RemClassRegistry.RegisterXSClass(CNTechTermsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'CNTechTermsShort');
  RemClassRegistry.RegisterXSClass(CNTechTermsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'CNTechTermsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfCNTechTermsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfCNTechTermsShort');

  InvRegistry.RegisterInterface(TypeInfo(CNTechTermsControllerSoapPort), 'http://ksoe.org/CNTechTermsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(CNTechTermsControllerSoapPort), 'http://ksoe.org/CNTechTermsController/action/CNTechTermsController.%operationName%');


end.
