unit CNPackController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,CNSubsystemTypeController 
   ,ENLine04Controller 
   ,ENLineCableController 
   ,ENTransformerController 
   ,ENSubstation04Controller 
   ,ENLine10Controller 
   ,ENSubstation150Controller 
   ,ENLine150Controller 
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

  CNPack            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  CNPackRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  CNPack = class(TRemotable)
  private
    Fcode : Integer;
    FpackCode : Integer; 
    Fname : WideString;
    Fid_ren : Integer; 
    FrenName : WideString;
    Fid_district : Integer; 
    FdistrictName : WideString;
    Fid_pack_status : Integer; 
    FstatusName : WideString;
    Fdescription : WideString;
    Fpower : TXSDecimal;
    Faddress : WideString;
    Faddress_jur : WideString;
    Freg_num_cn_contract : WideString;
    Fdate_cn_contract : TXSDate;
    Freg_num_spl_pp_contract : WideString;
    Fdate_spl_pp_contract : TXSDate;
    Freg_num_tu_contract : WideString;
    Fdate_tu_contract : TXSDate;
    Freg_num_tu_cr_contract : WideString;
    Fdate_tu_cr_contract : TXSDate;
    Fproject_num : WideString;
    Fproject_date : TXSDate;
    Fover5 : Integer; 
    Fstatus : Integer; 
    Fletter_num_customer : WideString;
    Fdate_letter_customer : TXSDate;
    Fletter_num : WideString;
    Fdate_letter : TXSDate;
    Freliability_class : WideString;
    Fid_waiting_status : Integer; 
    FwaitingStatus : WideString;
    Fis_payable : Integer; 
    Fworksize : WideString;
    Fwork_inc_net : WideString;
    Fbusiness_type : WideString;
    Festimateterm : Integer; 
    Festimatedate : TXSDate;
    Fbuildingterm : Integer; 
    Fbuildingdate : TXSDate;
    Fbuyingterm : Integer; 
    Fbuyingdate : TXSDate;
    Festimate_num : WideString;
    Festimate_contract_date : TXSDate;
    Fis_reserv : Integer;
    FstartState: Integer;
    Ftension_point: TXSDecimal; //Напряжение в точке присоединения, В
    FbaseStation: Integer; //Базовая станция ?
    FisSea: Integer; //Объект морской зоны отдыха ?
    FuserCode: Integer;
    Fpurpose : WideString;
    Fis_ksoe : Integer;
    Fover150 : Integer;
    Fis_new : Integer;
    Fis3phases : Integer;
//???
    FsubsystemRef : CNSubsystemTypeRef;
//???
    FairLine04Ref : ENLine04Ref;
//???
    FcableLine04Ref : ENLineCableRef;
//???
    FtrRef : ENTransformerRef;
//???
    Fs04Ref : ENSubstation04Ref;
//???
    FairLine10Ref : ENLine10Ref;
//???
    FcableLine10Ref : ENLineCableRef;
//???
    Fs35Ref : ENSubstation150Ref;
//???
    FairLine150Ref : ENLine150Ref;
//???
    FcableLine150Ref : ENLineCableRef;
//???
    Fs150Ref : ENSubstation150Ref;
    Fid_feature: Integer;
    Fis_reg : Integer;
    Fcustomeremail : WideString;
    Fphone : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  packCode : Integer read FpackCode write FpackCode; 
    property name : WideString read Fname write Fname;
    property  id_ren : Integer read Fid_ren write Fid_ren; 
    property renName : WideString read FrenName write FrenName;
    property  id_district : Integer read Fid_district write Fid_district; 
    property districtName : WideString read FdistrictName write FdistrictName;
    property  id_pack_status : Integer read Fid_pack_status write Fid_pack_status; 
    property statusName : WideString read FstatusName write FstatusName;
    property description : WideString read Fdescription write Fdescription;
    property power : TXSDecimal read Fpower write Fpower; 
    property address : WideString read Faddress write Faddress;
    property address_jur : WideString read Faddress_jur write Faddress_jur;
    property reg_num_cn_contract : WideString read Freg_num_cn_contract write Freg_num_cn_contract;
    property date_cn_contract : TXSDate read Fdate_cn_contract write Fdate_cn_contract;
    property reg_num_spl_pp_contract : WideString read Freg_num_spl_pp_contract write Freg_num_spl_pp_contract;
    property date_spl_pp_contract : TXSDate read Fdate_spl_pp_contract write Fdate_spl_pp_contract;
    property reg_num_tu_contract : WideString read Freg_num_tu_contract write Freg_num_tu_contract;
    property date_tu_contract : TXSDate read Fdate_tu_contract write Fdate_tu_contract;
    property reg_num_tu_cr_contract : WideString read Freg_num_tu_cr_contract write Freg_num_tu_cr_contract;
    property date_tu_cr_contract : TXSDate read Fdate_tu_cr_contract write Fdate_tu_cr_contract;
    property project_num : WideString read Fproject_num write Fproject_num;
    property project_date : TXSDate read Fproject_date write Fproject_date;
    property  over5 : Integer read Fover5 write Fover5; 
    property  status : Integer read Fstatus write Fstatus; 
    property letter_num_customer : WideString read Fletter_num_customer write Fletter_num_customer;
    property date_letter_customer : TXSDate read Fdate_letter_customer write Fdate_letter_customer;
    property letter_num : WideString read Fletter_num write Fletter_num;
    property date_letter : TXSDate read Fdate_letter write Fdate_letter;
    property reliability_class : WideString read Freliability_class write Freliability_class;
    property  id_waiting_status : Integer read Fid_waiting_status write Fid_waiting_status; 
    property waitingStatus : WideString read FwaitingStatus write FwaitingStatus;
    property  is_payable : Integer read Fis_payable write Fis_payable; 
    property worksize : WideString read Fworksize write Fworksize;
    property work_inc_net : WideString read Fwork_inc_net write Fwork_inc_net;
    property business_type : WideString read Fbusiness_type write Fbusiness_type;
    property  estimateterm : Integer read Festimateterm write Festimateterm; 
    property estimatedate : TXSDate read Festimatedate write Festimatedate;
    property  buildingterm : Integer read Fbuildingterm write Fbuildingterm; 
    property buildingdate : TXSDate read Fbuildingdate write Fbuildingdate;
    property  buyingterm : Integer read Fbuyingterm write Fbuyingterm; 
    property buyingdate : TXSDate read Fbuyingdate write Fbuyingdate;
    property estimate_num : WideString read Festimate_num write Festimate_num;
    property estimate_contract_date : TXSDate read Festimate_contract_date write Festimate_contract_date;
    property  is_reserv : Integer read Fis_reserv write Fis_reserv; 
    property purpose : WideString read Fpurpose write Fpurpose;
    property  is_ksoe : Integer read Fis_ksoe write Fis_ksoe;
    property  over150 : Integer read Fover150 write Fover150;
    property  is_new : Integer read Fis_new write Fis_new;
    property  is3phases : Integer read Fis3phases write Fis3phases;
    property subsystemRef : CNSubsystemTypeRef read FsubsystemRef write FsubsystemRef;
    property startState: Integer read FstartState write FstartState;
    property tension_point: TXSDecimal read Ftension_point write Ftension_point; //Напряжение в точке присоединения, В
    property baseStation: Integer read FbaseStation write FbaseStation; //Базовая станция ?
    property isSea: Integer read FisSea write FisSea; //Объект морской зоны отдыха ?
    property userCode: Integer read FuserCode write FuserCode;
    property airLine04Ref : ENLine04Ref read FairLine04Ref write FairLine04Ref; 
    property cableLine04Ref : ENLineCableRef read FcableLine04Ref write FcableLine04Ref; 
    property trRef : ENTransformerRef read FtrRef write FtrRef; 
    property s04Ref : ENSubstation04Ref read Fs04Ref write Fs04Ref; 
    property airLine10Ref : ENLine10Ref read FairLine10Ref write FairLine10Ref; 
    property cableLine10Ref : ENLineCableRef read FcableLine10Ref write FcableLine10Ref; 
    property s35Ref : ENSubstation150Ref read Fs35Ref write Fs35Ref; 
    property airLine150Ref : ENLine150Ref read FairLine150Ref write FairLine150Ref; 
    property cableLine150Ref : ENLineCableRef read FcableLine150Ref write FcableLine150Ref; 
    property s150Ref : ENSubstation150Ref read Fs150Ref write Fs150Ref;
    property id_feature: Integer read Fid_feature write Fid_feature;
    property is_reg: Integer read Fis_reg write Fis_reg;
    property customeremail: WideString read Fcustomeremail write Fcustomeremail;
    property phone: WideString read Fphone write Fphone;
  end;
  
{
  CNPackFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FpackCode : Integer; 
    Fname : WideString;
    Fid_ren : Integer; 
    FrenName : WideString;
    Fid_district : Integer; 
    FdistrictName : WideString;
    Fid_pack_status : Integer; 
    FstatusName : WideString;
    Fdescription : WideString;
    Fpower : TXSDecimal;
    Faddress : WideString;
    Faddress_jur : WideString;
    Freg_num_cn_contract : WideString;
    Fdate_cn_contract : TXSDate;
    Freg_num_spl_pp_contract : WideString;
    Fdate_spl_pp_contract : TXSDate;
    Freg_num_tu_contract : WideString;
    Fdate_tu_contract : TXSDate;
    Freg_num_tu_cr_contract : WideString;
    Fdate_tu_cr_contract : TXSDate;
    Fproject_num : WideString;
    Fproject_date : TXSDate;
    Fover5 : Integer; 
    Fstatus : Integer; 
    Fletter_num_customer : WideString;
    Fdate_letter_customer : TXSDate;
    Fletter_num : WideString;
    Fdate_letter : TXSDate;
    Freliability_class : WideString;
    Fid_waiting_status : Integer; 
    FwaitingStatus : WideString;
    Fis_payable : Integer; 
    Fworksize : WideString;
    Fwork_inc_net : WideString;
    Fbusiness_type : WideString;
    Festimateterm : Integer; 
    Festimatedate : TXSDate;
    Fbuildingterm : Integer; 
    Fbuildingdate : TXSDate;
    Fbuyingterm : Integer; 
    Fbuyingdate : TXSDate;
    Festimate_num : WideString;
    Festimate_contract_date : TXSDate;
    Fis_reserv : Integer; 
//???
    FsubsystemRef : CNSubsystemTypeRef;
//???
    FairLine04Ref : ENLine04Ref;
//???
    FcableLine04Ref : ENLineCableRef;
//???
    FtrRef : ENTransformerRef;
//???
    Fs04Ref : ENSubstation04Ref;
//???
    FairLine10Ref : ENLine10Ref;
//???
    FcableLine10Ref : ENLineCableRef;
//???
    Fs35Ref : ENSubstation150Ref;
//???
    FairLine150Ref : ENLine150Ref;
//???
    FcableLine150Ref : ENLineCableRef;
//???
    Fs150Ref : ENSubstation150Ref;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property  packCode : Integer read FpackCode write FpackCode; 
    property name : WideString read Fname write Fname;
    property  id_ren : Integer read Fid_ren write Fid_ren; 
    property renName : WideString read FrenName write FrenName;
    property  id_district : Integer read Fid_district write Fid_district; 
    property districtName : WideString read FdistrictName write FdistrictName;
    property  id_pack_status : Integer read Fid_pack_status write Fid_pack_status; 
    property statusName : WideString read FstatusName write FstatusName;
    property description : WideString read Fdescription write Fdescription;
    property power : TXSDecimal read Fpower write Fpower; 
    property address : WideString read Faddress write Faddress;
    property address_jur : WideString read Faddress_jur write Faddress_jur;
    property reg_num_cn_contract : WideString read Freg_num_cn_contract write Freg_num_cn_contract;
    property date_cn_contract : TXSDate read Fdate_cn_contract write Fdate_cn_contract;
    property reg_num_spl_pp_contract : WideString read Freg_num_spl_pp_contract write Freg_num_spl_pp_contract;
    property date_spl_pp_contract : TXSDate read Fdate_spl_pp_contract write Fdate_spl_pp_contract;
    property reg_num_tu_contract : WideString read Freg_num_tu_contract write Freg_num_tu_contract;
    property date_tu_contract : TXSDate read Fdate_tu_contract write Fdate_tu_contract;
    property reg_num_tu_cr_contract : WideString read Freg_num_tu_cr_contract write Freg_num_tu_cr_contract;
    property date_tu_cr_contract : TXSDate read Fdate_tu_cr_contract write Fdate_tu_cr_contract;
    property project_num : WideString read Fproject_num write Fproject_num;
    property project_date : TXSDate read Fproject_date write Fproject_date;
    property  over5 : Integer read Fover5 write Fover5; 
    property  status : Integer read Fstatus write Fstatus; 
    property letter_num_customer : WideString read Fletter_num_customer write Fletter_num_customer;
    property date_letter_customer : TXSDate read Fdate_letter_customer write Fdate_letter_customer;
    property letter_num : WideString read Fletter_num write Fletter_num;
    property date_letter : TXSDate read Fdate_letter write Fdate_letter;
    property reliability_class : WideString read Freliability_class write Freliability_class;
    property  id_waiting_status : Integer read Fid_waiting_status write Fid_waiting_status; 
    property waitingStatus : WideString read FwaitingStatus write FwaitingStatus;
    property  is_payable : Integer read Fis_payable write Fis_payable; 
    property worksize : WideString read Fworksize write Fworksize;
    property work_inc_net : WideString read Fwork_inc_net write Fwork_inc_net;
    property business_type : WideString read Fbusiness_type write Fbusiness_type;
    property  estimateterm : Integer read Festimateterm write Festimateterm; 
    property estimatedate : TXSDate read Festimatedate write Festimatedate;
    property  buildingterm : Integer read Fbuildingterm write Fbuildingterm; 
    property buildingdate : TXSDate read Fbuildingdate write Fbuildingdate;
    property  buyingterm : Integer read Fbuyingterm write Fbuyingterm; 
    property buyingdate : TXSDate read Fbuyingdate write Fbuyingdate;
    property estimate_num : WideString read Festimate_num write Festimate_num;
    property estimate_contract_date : TXSDate read Festimate_contract_date write Festimate_contract_date;
    property  is_reserv : Integer read Fis_reserv write Fis_reserv; 
    property subsystemRef : CNSubsystemTypeRef read FsubsystemRef write FsubsystemRef; 
    property airLine04Ref : ENLine04Ref read FairLine04Ref write FairLine04Ref; 
    property cableLine04Ref : ENLineCableRef read FcableLine04Ref write FcableLine04Ref; 
    property trRef : ENTransformerRef read FtrRef write FtrRef; 
    property s04Ref : ENSubstation04Ref read Fs04Ref write Fs04Ref; 
    property airLine10Ref : ENLine10Ref read FairLine10Ref write FairLine10Ref; 
    property cableLine10Ref : ENLineCableRef read FcableLine10Ref write FcableLine10Ref; 
    property s35Ref : ENSubstation150Ref read Fs35Ref write Fs35Ref; 
    property airLine150Ref : ENLine150Ref read FairLine150Ref write FairLine150Ref; 
    property cableLine150Ref : ENLineCableRef read FcableLine150Ref write FcableLine150Ref; 
    property s150Ref : ENSubstation150Ref read Fs150Ref write Fs150Ref; 
  end;
}

  CNPackFilter = class(CNPack)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  CNPackShort = class(TRemotable)
  private
    Fcode : Integer; 
    FpackCode : Integer; 
    Fname : WideString;
    Fid_ren : Integer; 
    FrenName : WideString;
    Fid_district : Integer; 
    FdistrictName : WideString;
    Fid_pack_status : Integer; 
    FstatusName : WideString;
    Fdescription : WideString;
    Fpower : TXSDecimal;
    Faddress : WideString;
    Faddress_jur : WideString;
    Freg_num_cn_contract : WideString;
    Fdate_cn_contract : TXSDate;	
    Freg_num_spl_pp_contract : WideString;
    Fdate_spl_pp_contract : TXSDate;	
    Freg_num_tu_contract : WideString;
    Fdate_tu_contract : TXSDate;	
    Freg_num_tu_cr_contract : WideString;
    Fdate_tu_cr_contract : TXSDate;	
    Fproject_num : WideString;
    Fproject_date : TXSDate;	
    Fover5 : Integer; 
    Fstatus : Integer; 
    Fletter_num_customer : WideString;
    Fdate_letter_customer : TXSDate;
    Fletter_num : WideString;
    Fdate_letter : TXSDate;	
    Freliability_class : WideString;
    Fid_waiting_status : Integer; 
    FwaitingStatus : WideString;
    Fis_payable : Integer; 
    Fworksize : WideString;
    Fwork_inc_net : WideString;
    Fbusiness_type : WideString;
    Festimateterm : Integer; 
    Festimatedate : TXSDate;	
    Fbuildingterm : Integer; 
    Fbuildingdate : TXSDate;	
    Fbuyingterm : Integer; 
    Fbuyingdate : TXSDate;	
    Festimate_num : WideString;
    Festimate_contract_date : TXSDate;	
    Fis_reserv : Integer; //Признак зарезервированности мощности архивных ТУ
    Fpurpose : WideString;
    Fis_ksoe : Integer;
    Fover150 : Integer;
    Fis_new : Integer;
    Fis3phases : Integer;
    FsubsystemRefCode : Integer;
    FsubsystemRefName : WideString;
    Fcur_state: WideString; //Текущее состояние пакета EnergyWorkflow
    //Признак завершённостии связанного с ТУ договора поставки
    Fis_finish_supply: Integer;
    //Некоторые поля сущности ТУ
    Fpow_exist: TXSDecimal; //Существующая до выдачи ТУ мощность, кВт
    Fis_realized: Integer; //Признак, Реализованы ли ТУ (0 - нет, 1 - да, Null - не известно)
    Ftension_point: TXSDecimal; //Напряжение в точке присоединения, В
    Ftension_exist: TXSDecimal; //Существующее до выдачи ТУ напряжение в точке присоединения, В
    Fcurrent_automat: TXSDecimal; //Сила тока автоматического выключателя, А
    Fdate_finish_pack: TXSDateTime; //Дата завершения работы над пакетом
    Fid_proposal: Integer; //Код предложения ТУ: 0 или Null - не указано; 1 - увеличение мощности;
      //2 - изменение точки присоединения, 3 - увеличение мощности с изменением точки присоединения
    Fis_registration: Integer; //Признак регистрации ТУ
    FairLine04RefCode : Integer; 
    FcableLine04RefCode : Integer; 
    FtrRefCode : Integer; 
    Fs04RefCode : Integer; 
    FairLine10RefCode : Integer; 
    FcableLine10RefCode : Integer; 
    Fs35RefCode : Integer; 
    FairLine150RefCode : Integer; 
    FcableLine150RefCode : Integer; 
    Fs150RefCode : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property  packCode : Integer read FpackCode write FpackCode; 
    property name : WideString read Fname write Fname;
    property  id_ren : Integer read Fid_ren write Fid_ren; 
    property renName : WideString read FrenName write FrenName;
    property  id_district : Integer read Fid_district write Fid_district; 
    property districtName : WideString read FdistrictName write FdistrictName;
    property  id_pack_status : Integer read Fid_pack_status write Fid_pack_status; 
    property statusName : WideString read FstatusName write FstatusName;
    property description : WideString read Fdescription write Fdescription;
    property power : TXSDecimal read Fpower write Fpower; 
    property address : WideString read Faddress write Faddress;
    property address_jur : WideString read Faddress_jur write Faddress_jur;
    property reg_num_cn_contract : WideString read Freg_num_cn_contract write Freg_num_cn_contract;
    property date_cn_contract : TXSDate read Fdate_cn_contract write Fdate_cn_contract;
    property reg_num_spl_pp_contract : WideString read Freg_num_spl_pp_contract write Freg_num_spl_pp_contract;
    property date_spl_pp_contract : TXSDate read Fdate_spl_pp_contract write Fdate_spl_pp_contract;
    property reg_num_tu_contract : WideString read Freg_num_tu_contract write Freg_num_tu_contract;
    property date_tu_contract : TXSDate read Fdate_tu_contract write Fdate_tu_contract;
    property reg_num_tu_cr_contract : WideString read Freg_num_tu_cr_contract write Freg_num_tu_cr_contract;
    property date_tu_cr_contract : TXSDate read Fdate_tu_cr_contract write Fdate_tu_cr_contract;
    property project_num : WideString read Fproject_num write Fproject_num;
    property project_date : TXSDate read Fproject_date write Fproject_date;
    property  over5 : Integer read Fover5 write Fover5; 
    property  status : Integer read Fstatus write Fstatus; 
    property letter_num_customer : WideString read Fletter_num_customer write Fletter_num_customer;
    property date_letter_customer : TXSDate read Fdate_letter_customer write Fdate_letter_customer;
    property letter_num : WideString read Fletter_num write Fletter_num;
    property date_letter : TXSDate read Fdate_letter write Fdate_letter;
    property reliability_class : WideString read Freliability_class write Freliability_class;
    property  id_waiting_status : Integer read Fid_waiting_status write Fid_waiting_status; 
    property waitingStatus : WideString read FwaitingStatus write FwaitingStatus;
    property  is_payable : Integer read Fis_payable write Fis_payable; 
    property worksize : WideString read Fworksize write Fworksize;
    property work_inc_net : WideString read Fwork_inc_net write Fwork_inc_net;
    property business_type : WideString read Fbusiness_type write Fbusiness_type;
    property  estimateterm : Integer read Festimateterm write Festimateterm; 
    property estimatedate : TXSDate read Festimatedate write Festimatedate;
    property  buildingterm : Integer read Fbuildingterm write Fbuildingterm; 
    property buildingdate : TXSDate read Fbuildingdate write Fbuildingdate;
    property  buyingterm : Integer read Fbuyingterm write Fbuyingterm; 
    property buyingdate : TXSDate read Fbuyingdate write Fbuyingdate;
    property estimate_num : WideString read Festimate_num write Festimate_num;
    property estimate_contract_date : TXSDate read Festimate_contract_date write Festimate_contract_date;
    //Признак зарезервированности мощности архивных ТУ
    property is_reserv : Integer read Fis_reserv write Fis_reserv;
    property purpose : WideString read Fpurpose write Fpurpose;
    property  is_ksoe : Integer read Fis_ksoe write Fis_ksoe;
    property  over150 : Integer read Fover150 write Fover150;
    property  is_new : Integer read Fis_new write Fis_new;
    property  is3phases : Integer read Fis3phases write Fis3phases;
    property subsystemRefCode : Integer read FsubsystemRefCode write FsubsystemRefCode;
    property subsystemRefName : WideString read FsubsystemRefName write FsubsystemRefName;
    property cur_state: WideString read Fcur_state write Fcur_state;
    //Признак завершённостии связанного с ТУ договора поставки
    property is_finish_supply: Integer read Fis_finish_supply write Fis_finish_supply;
    //Некоторые поля сущности ТУ
    //Существующая до выдачи ТУ мощность, кВт
    property pow_exist: TXSDecimal read Fpow_exist write Fpow_exist;
    //Признак, Реализованы ли ТУ (0 - нет, 1 - да, Null - не известно)
    property is_realized: Integer read Fis_realized write Fis_realized;
    //Напряжение в точке присоединения, В
    property tension_point: TXSDecimal read Ftension_point write Ftension_point;
    //Существующее до выдачи ТУ напряжение в точке присоединения, В
    property tension_exist: TXSDecimal read Ftension_exist write Ftension_exist;
    //Сила тока автоматического выключателя, А
    property current_automat: TXSDecimal read Fcurrent_automat write Fcurrent_automat;
    //Дата завершения работы над пакетом
    property date_finish_pack: TXSDateTime read Fdate_finish_pack write Fdate_finish_pack;
    //Код предложения ТУ: 0 или Null - не указано; 1 - увеличение мощности;
    //2 - изменение точки присоединения, 3 - увеличение мощности с изменением точки присоединения
    property id_proposal: Integer read Fid_proposal write Fid_proposal;
    //Признак регистрации ТУ
    property is_registration: Integer read Fis_registration write Fis_registration;
    property airLine04RefCode : Integer read FairLine04RefCode write FairLine04RefCode; //ENLine04Ref read FairLine04RefCode write FairLine04RefCode; 
    property cableLine04RefCode : Integer read FcableLine04RefCode write FcableLine04RefCode; //ENLineCableRef read FcableLine04RefCode write FcableLine04RefCode; 
    property trRefCode : Integer read FtrRefCode write FtrRefCode; //ENTransformerRef read FtrRefCode write FtrRefCode; 
    property s04RefCode : Integer read Fs04RefCode write Fs04RefCode; //ENSubstation04Ref read Fs04RefCode write Fs04RefCode; 
    property airLine10RefCode : Integer read FairLine10RefCode write FairLine10RefCode; //ENLine10Ref read FairLine10RefCode write FairLine10RefCode; 
    property cableLine10RefCode : Integer read FcableLine10RefCode write FcableLine10RefCode; //ENLineCableRef read FcableLine10RefCode write FcableLine10RefCode; 
    property s35RefCode : Integer read Fs35RefCode write Fs35RefCode; //ENSubstation150Ref read Fs35RefCode write Fs35RefCode; 
    property airLine150RefCode : Integer read FairLine150RefCode write FairLine150RefCode; //ENLine150Ref read FairLine150RefCode write FairLine150RefCode; 
    property cableLine150RefCode : Integer read FcableLine150RefCode write FcableLine150RefCode; //ENLineCableRef read FcableLine150RefCode write FcableLine150RefCode; 
    property s150RefCode : Integer read Fs150RefCode write Fs150RefCode; //ENSubstation150Ref read Fs150RefCode write Fs150RefCode; 
  end;

  ArrayOfCNPackShort = array of CNPackShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  CNPackShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfCNPackShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfCNPackShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/CNPackController/message/
  // soapAction: http://ksoe.org/CNPackController/action/CNPackController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : CNPackControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : CNPackController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  CNPackControllerSoapPort = interface(IInvokable)
  ['{B1113210-2E4D-4A7B-827A-24CD44E7DB8F}']
    function  add(const aCNPack: CNPack): Integer; stdcall;
    function  addPackCN(const aCNPack: CNPack): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aCNPack: CNPack); stdcall;
    function  savePackCN(const aCNPack: CNPack): Integer; stdcall;
    function  getObject(const anObjectCode: Integer): CNPack; stdcall;
    function  getList: CNPackShortList; stdcall;
    function  getFilteredList(const aCNPackFilter: CNPackFilter): CNPackShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): CNPackShortList; stdcall;
    function  getScrollableFilteredList(const aCNPackFilter: CNPackFilter; const aFromPosition: Integer; const aQuantity: Integer): CNPackShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): CNPackShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aCNPackFilter: CNPackFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    (* CNPack(Пакети документів з EnergyWorkflow). Получить список по фильтру для просмотра *)
    function getCNPackList(f: CNPackFilter; const fromPosition: Integer; const quantity: Integer): CNPackShortList; stdcall;
    (* CNPack(EnergyWorkflow). Получить список пакетов подсистем
     * ПРИСОЕДИНЕНИЕ до и после 01.08.2010, с 14.03.2011 по фильтру с текущими состояниями *)
    function getCNPackCurStateList(const f: CNPackFilter; const fromPosition: Integer; const quantity: Integer): CNPackShortList; stdcall;
    (* CNPack(EnergyWorkflow). Получить пакеты
     * ПОСТАВКА ЭЛЕКТРОЭНЕРГИИ ПОТРЕБИТЕЛЯМ ЮРИДИЧЕСКОГО И БЫТОВОГО СЕКТОРОВ
     * по фильтру с текущими состояниями *)
    function getSPL_PP_PackCurStateList(const f: CNPackFilter; const fromPosition: Integer; const quantity: Integer): CNPackShortList; stdcall;

    // Метод для передачи пакета в EnergyWorkflow (пока только для подсистемы DST)
    procedure completeTask(const id_pack: Integer; const id_movement: Integer; const states: ArrayOfInteger; const id_pack_status: Integer;
      const id_user: Integer; const note: WideString; const client_ip: WideString); stdcall;

    // Метод для отправки пакета в архив в EnergyWorkflow (пока только для подсистемы DST)
    procedure sendPackToArchive(const id_pack: Integer; const id_movement: Integer; const id_user: Integer; const note: WideString;
      const client_ip: WideString); stdcall;

    // Метод для удаления пакета в EnergyWorkflow (только для подсистемы DST)
    procedure deleteDSTPack(const id_pack: Integer; const id_pack_status: Integer; const id_old_pack_status: Integer;
      const id_user: Integer; const action: WideString); stdcall;

    procedure updateEICDFDocSupplyEE(const id_pack: Integer; const eic: WideString); stdcall;
  end;

implementation

  destructor CNPack.Destroy;
  begin
    if Assigned(Fpower) then
      power.Free;
    if Assigned(Fdate_cn_contract) then
      date_cn_contract.Free;
    if Assigned(Fdate_spl_pp_contract) then
      date_spl_pp_contract.Free;
    if Assigned(Fdate_tu_contract) then
      date_tu_contract.Free;
    if Assigned(Fdate_tu_cr_contract) then
      date_tu_cr_contract.Free;
    if Assigned(Fproject_date) then
      project_date.Free;
    if Assigned(Fdate_letter_customer) then
      date_letter_customer.Free;
    if Assigned(Fdate_letter) then
      date_letter.Free;
    if Assigned(Festimatedate) then
      estimatedate.Free;
    if Assigned(Fbuildingdate) then
      buildingdate.Free;
    if Assigned(Fbuyingdate) then
      buyingdate.Free;
    if Assigned(Festimate_contract_date) then
      estimate_contract_date.Free;
    if Assigned(FsubsystemRef) then
      subsystemRef.Free;
    if Assigned(Ftension_point) then
      tension_point.Free;
    if Assigned(FairLine04Ref) then
      airLine04Ref.Free;
    if Assigned(FcableLine04Ref) then
      cableLine04Ref.Free;
    if Assigned(FtrRef) then
      trRef.Free;
    if Assigned(Fs04Ref) then
      s04Ref.Free;
    if Assigned(FairLine10Ref) then
      airLine10Ref.Free;
    if Assigned(FcableLine10Ref) then
      cableLine10Ref.Free;
    if Assigned(Fs35Ref) then
      s35Ref.Free;
    if Assigned(FairLine150Ref) then
      airLine150Ref.Free;
    if Assigned(FcableLine150Ref) then
      cableLine150Ref.Free;
    if Assigned(Fs150Ref) then
      s150Ref.Free;
    inherited Destroy;
  end;

{  
  destructor CNPackFilter.Destroy;
  begin
    if Assigned(Fpower) then
      power.Free;
    if Assigned(Fdate_cn_contract) then
      date_cn_contract.Free;
    if Assigned(Fdate_spl_pp_contract) then
      date_spl_pp_contract.Free;
    if Assigned(Fdate_tu_contract) then
      date_tu_contract.Free;
    if Assigned(Fdate_tu_cr_contract) then
      date_tu_cr_contract.Free;
    if Assigned(Fproject_date) then
      project_date.Free;
    if Assigned(Fdate_letter_customer) then
      date_letter_customer.Free;
    if Assigned(Fdate_letter) then
      date_letter.Free;
    if Assigned(Festimatedate) then
      estimatedate.Free;
    if Assigned(Fbuildingdate) then
      buildingdate.Free;
    if Assigned(Fbuyingdate) then
      buyingdate.Free;
    if Assigned(Festimate_contract_date) then
      estimate_contract_date.Free;
    if Assigned(FsubsystemRef) then
      subsystemRef.Free;
    if Assigned(FairLine04Ref) then
      airLine04Ref.Free;
    if Assigned(FcableLine04Ref) then
      cableLine04Ref.Free;
    if Assigned(FtrRef) then
      trRef.Free;
    if Assigned(Fs04Ref) then
      s04Ref.Free;
    if Assigned(FairLine10Ref) then
      airLine10Ref.Free;
    if Assigned(FcableLine10Ref) then
      cableLine10Ref.Free;
    if Assigned(Fs35Ref) then
      s35Ref.Free;
    if Assigned(FairLine150Ref) then
      airLine150Ref.Free;
    if Assigned(FcableLine150Ref) then
      cableLine150Ref.Free;
    if Assigned(Fs150Ref) then
      s150Ref.Free;
    inherited Destroy;
  end; 
}

  destructor CNPackFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor CNPackShort.Destroy;
  begin
    if Assigned(Fpower) then
      power.Free;
    if Assigned(Fdate_cn_contract) then
      date_cn_contract.Free;
    if Assigned(Fdate_spl_pp_contract) then
      date_spl_pp_contract.Free;
    if Assigned(Fdate_tu_contract) then
      date_tu_contract.Free;
    if Assigned(Fdate_tu_cr_contract) then
      date_tu_cr_contract.Free;
    if Assigned(Fproject_date) then
      project_date.Free;
    if Assigned(Fdate_letter_customer) then
      date_letter_customer.Free;
    if Assigned(Fdate_letter) then
      date_letter.Free;
    if Assigned(Festimatedate) then
      estimatedate.Free;
    if Assigned(Fbuildingdate) then
      buildingdate.Free;
    if Assigned(Fbuyingdate) then
      buyingdate.Free;
    if Assigned(Festimate_contract_date) then
      estimate_contract_date.Free;
    
    if Assigned(Fpow_exist) then
      pow_exist.Free;
    if Assigned(Ftension_point) then
      tension_point.Free;
    if Assigned(Ftension_exist) then
      tension_exist.Free;
    if Assigned(Fcurrent_automat) then
      current_automat.Free;
    if Assigned(Fdate_finish_pack) then
      date_finish_pack.Free;

    inherited Destroy;
  end; 
  
  destructor CNPackShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(CNPack, 'http://ksoe.org/EnergyproControllerService/type/', 'CNPack');
  RemClassRegistry.RegisterXSClass(CNPackRef, 'http://ksoe.org/EnergyproControllerService/type/', 'CNPackRef');
  RemClassRegistry.RegisterXSClass(CNPackFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'CNPackFilter');
  RemClassRegistry.RegisterXSClass(CNPackShort, 'http://ksoe.org/EnergyproControllerService/type/', 'CNPackShort');
  RemClassRegistry.RegisterXSClass(CNPackShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'CNPackShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfCNPackShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfCNPackShort');

  InvRegistry.RegisterInterface(TypeInfo(CNPackControllerSoapPort), 'http://ksoe.org/CNPackController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(CNPackControllerSoapPort), 'http://ksoe.org/CNPackController/action/CNPackController.%operationName%');


end.
