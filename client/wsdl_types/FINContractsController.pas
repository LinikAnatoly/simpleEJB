unit FINContractsController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQOrgController
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

  FINContracts            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINContractsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINContracts = class(TRemotable)
  private
    Fcode : Integer;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocID : Integer;
    Fdivision_id : Integer;
    Fdivision_name : WideString;
    Fagree_group_id : Integer;
    Fagree_group_name : WideString;
    Freg_num : WideString;
    Freg_date : TXSDate;
    Fstart_date : TXSDate;
    Fend_date : TXSDate;
    Fstatus : WideString;
    Fstatus_name : WideString;
    Fsumma : TXSDecimal;
    Fcurr_summ : TXSDecimal;
    Fcsumm_start_date : TXSDate;
    Fcurr_end_date : TXSDate;
    Fnums : TXSDecimal;
    Fdescription : WideString;
    Fclose_date : TXSDate;
    Fnotes : WideString;
    Fparent_id : Integer;
    Fedizm_id : Integer;
    Fedizm_name : WideString;
    Fpay_after_event : WideString;
    Fpay_period : Integer;
    Fpay_type : Integer;
    Fpay_type_name : WideString;
    Fsumm_note : WideString;
    Fnotlimited : WideString;
    Fio_flag : WideString;
    Fdeal_flag : WideString;
    Fgk_kategory : Integer;
    Fgk_kategory_name : WideString;
    Fact_exists : WideString;
    Fservice_id : Integer;
    Fservice_name : WideString;
    Fid_buyconds : Integer;
    Fname_buyconds : WideString;
    Fid_payform : Integer;
    Fname_payform : WideString;
    Fsumm_changemode : Integer;
    Fid_otvlico : Integer;
    Ftabn_otvlico : WideString;
    Ffio_otvlico : WideString;
    Fcurrency_code : WideString;
    Ftender_date : TXSDate;
    Ftender_no : WideString;
    Fprolong_month : Integer;
    Fprolong_no : Integer;
    Fnote1 : WideString;
    Fnote2 : WideString;
    FsupervisoryDate : TXSDate;
    FsupervisoryNumber : WideString;
    FaxPaymTerm : WideString;
    FaxVendPaymMode : WideString;
//???
    Forg : RQOrg;
//???
    FgeneralContractRef : ENGeneralContractsRef;
    FtypePay : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property  division_id : Integer read Fdivision_id write Fdivision_id;
    property division_name : WideString read Fdivision_name write Fdivision_name;
    property  agree_group_id : Integer read Fagree_group_id write Fagree_group_id;
    property agree_group_name : WideString read Fagree_group_name write Fagree_group_name;
    property reg_num : WideString read Freg_num write Freg_num;
    property reg_date : TXSDate read Freg_date write Freg_date;
    property start_date : TXSDate read Fstart_date write Fstart_date;
    property end_date : TXSDate read Fend_date write Fend_date;
    property status : WideString read Fstatus write Fstatus;
    property status_name : WideString read Fstatus_name write Fstatus_name;
    property summa : TXSDecimal read Fsumma write Fsumma;
    property curr_summ : TXSDecimal read Fcurr_summ write Fcurr_summ;
    property csumm_start_date : TXSDate read Fcsumm_start_date write Fcsumm_start_date;
    property curr_end_date : TXSDate read Fcurr_end_date write Fcurr_end_date;
    property nums : TXSDecimal read Fnums write Fnums;
    property description : WideString read Fdescription write Fdescription;
    property close_date : TXSDate read Fclose_date write Fclose_date;
    property notes : WideString read Fnotes write Fnotes;
    property  parent_id : Integer read Fparent_id write Fparent_id;
    property  edizm_id : Integer read Fedizm_id write Fedizm_id;
    property edizm_name : WideString read Fedizm_name write Fedizm_name;
    property pay_after_event : WideString read Fpay_after_event write Fpay_after_event;
    property  pay_period : Integer read Fpay_period write Fpay_period;
    property  pay_type : Integer read Fpay_type write Fpay_type;
    property pay_type_name : WideString read Fpay_type_name write Fpay_type_name;
    property summ_note : WideString read Fsumm_note write Fsumm_note;
    property notlimited : WideString read Fnotlimited write Fnotlimited;
    property io_flag : WideString read Fio_flag write Fio_flag;
    property deal_flag : WideString read Fdeal_flag write Fdeal_flag;
    property  gk_kategory : Integer read Fgk_kategory write Fgk_kategory;
    property gk_kategory_name : WideString read Fgk_kategory_name write Fgk_kategory_name;
    property act_exists : WideString read Fact_exists write Fact_exists;
    property  service_id : Integer read Fservice_id write Fservice_id;
    property service_name : WideString read Fservice_name write Fservice_name;
    property  id_buyconds : Integer read Fid_buyconds write Fid_buyconds;
    property name_buyconds : WideString read Fname_buyconds write Fname_buyconds;
    property  id_payform : Integer read Fid_payform write Fid_payform;
    property name_payform : WideString read Fname_payform write Fname_payform;
    property  summ_changemode : Integer read Fsumm_changemode write Fsumm_changemode;
    property  id_otvlico : Integer read Fid_otvlico write Fid_otvlico;
    property tabn_otvlico : WideString read Ftabn_otvlico write Ftabn_otvlico;
    property fio_otvlico : WideString read Ffio_otvlico write Ffio_otvlico;
    property currency_code : WideString read Fcurrency_code write Fcurrency_code;
    property tender_date : TXSDate read Ftender_date write Ftender_date;
    property tender_no : WideString read Ftender_no write Ftender_no;
    property  prolong_month : Integer read Fprolong_month write Fprolong_month;
    property  prolong_no : Integer read Fprolong_no write Fprolong_no;
    property note1 : WideString read Fnote1 write Fnote1;
    property note2 : WideString read Fnote2 write Fnote2;
    property supervisoryDate : TXSDate read FsupervisoryDate write FsupervisoryDate;
    property supervisoryNumber : WideString read FsupervisoryNumber write FsupervisoryNumber;
    property axPaymTerm : WideString read FaxPaymTerm write FaxPaymTerm;
    property axVendPaymMode : WideString read FaxVendPaymMode write FaxVendPaymMode;
    property org : RQOrg read Forg write Forg;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
    property typePay : WideString read FtypePay write FtypePay;
  end;

{
  FINContractsFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocID : Integer;
    Fdivision_id : Integer;
    Fdivision_name : WideString;
    Fagree_group_id : Integer;
    Fagree_group_name : WideString;
    Freg_num : WideString;
    Freg_date : TXSDate;
    Fstart_date : TXSDate;
    Fend_date : TXSDate;
    Fstatus : WideString;
    Fstatus_name : WideString;
    Fsumma : TXSDecimal;
    Fcurr_summ : TXSDecimal;
    Fcsumm_start_date : TXSDate;
    Fcurr_end_date : TXSDate;
    Fnums : TXSDecimal;
    Fdescription : WideString;
    Fclose_date : TXSDate;
    Fnotes : WideString;
    Fparent_id : Integer;
    Fedizm_id : Integer;
    Fedizm_name : WideString;
    Fpay_after_event : WideString;
    Fpay_period : Integer;
    Fpay_type : Integer;
    Fpay_type_name : WideString;
    Fsumm_note : WideString;
    Fnotlimited : WideString;
    Fio_flag : WideString;
    Fdeal_flag : WideString;
    Fgk_kategory : Integer;
    Fgk_kategory_name : WideString;
    Fact_exists : WideString;
    Fservice_id : Integer;
    Fservice_name : WideString;
    Fid_buyconds : Integer;
    Fname_buyconds : WideString;
    Fid_payform : Integer;
    Fname_payform : WideString;
    Fsumm_changemode : Integer;
    Fid_otvlico : Integer;
    Ftabn_otvlico : WideString;
    Ffio_otvlico : WideString;
    Fcurrency_code : WideString;
    Ftender_date : TXSDate;
    Ftender_no : WideString;
    Fprolong_month : Integer;
    Fprolong_no : Integer;
    Fnote1 : WideString;
    Fnote2 : WideString;
    FsupervisoryDate : TXSDate;
    FsupervisoryNumber : WideString;
    FaxPaymTerm : WideString;
    FaxVendPaymMode : WideString;
//???
    Forg : RQOrg;
//???
    FgeneralContractRef : ENGeneralContractsRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property  division_id : Integer read Fdivision_id write Fdivision_id;
    property division_name : WideString read Fdivision_name write Fdivision_name;
    property  agree_group_id : Integer read Fagree_group_id write Fagree_group_id;
    property agree_group_name : WideString read Fagree_group_name write Fagree_group_name;
    property reg_num : WideString read Freg_num write Freg_num;
    property reg_date : TXSDate read Freg_date write Freg_date;
    property start_date : TXSDate read Fstart_date write Fstart_date;
    property end_date : TXSDate read Fend_date write Fend_date;
    property status : WideString read Fstatus write Fstatus;
    property status_name : WideString read Fstatus_name write Fstatus_name;
    property summa : TXSDecimal read Fsumma write Fsumma;
    property curr_summ : TXSDecimal read Fcurr_summ write Fcurr_summ;
    property csumm_start_date : TXSDate read Fcsumm_start_date write Fcsumm_start_date;
    property curr_end_date : TXSDate read Fcurr_end_date write Fcurr_end_date;
    property nums : TXSDecimal read Fnums write Fnums;
    property description : WideString read Fdescription write Fdescription;
    property close_date : TXSDate read Fclose_date write Fclose_date;
    property notes : WideString read Fnotes write Fnotes;
    property  parent_id : Integer read Fparent_id write Fparent_id;
    property  edizm_id : Integer read Fedizm_id write Fedizm_id;
    property edizm_name : WideString read Fedizm_name write Fedizm_name;
    property pay_after_event : WideString read Fpay_after_event write Fpay_after_event;
    property  pay_period : Integer read Fpay_period write Fpay_period;
    property  pay_type : Integer read Fpay_type write Fpay_type;
    property pay_type_name : WideString read Fpay_type_name write Fpay_type_name;
    property summ_note : WideString read Fsumm_note write Fsumm_note;
    property notlimited : WideString read Fnotlimited write Fnotlimited;
    property io_flag : WideString read Fio_flag write Fio_flag;
    property deal_flag : WideString read Fdeal_flag write Fdeal_flag;
    property  gk_kategory : Integer read Fgk_kategory write Fgk_kategory;
    property gk_kategory_name : WideString read Fgk_kategory_name write Fgk_kategory_name;
    property act_exists : WideString read Fact_exists write Fact_exists;
    property  service_id : Integer read Fservice_id write Fservice_id;
    property service_name : WideString read Fservice_name write Fservice_name;
    property  id_buyconds : Integer read Fid_buyconds write Fid_buyconds;
    property name_buyconds : WideString read Fname_buyconds write Fname_buyconds;
    property  id_payform : Integer read Fid_payform write Fid_payform;
    property name_payform : WideString read Fname_payform write Fname_payform;
    property  summ_changemode : Integer read Fsumm_changemode write Fsumm_changemode;
    property  id_otvlico : Integer read Fid_otvlico write Fid_otvlico;
    property tabn_otvlico : WideString read Ftabn_otvlico write Ftabn_otvlico;
    property fio_otvlico : WideString read Ffio_otvlico write Ffio_otvlico;
    property currency_code : WideString read Fcurrency_code write Fcurrency_code;
    property tender_date : TXSDate read Ftender_date write Ftender_date;
    property tender_no : WideString read Ftender_no write Ftender_no;
    property  prolong_month : Integer read Fprolong_month write Fprolong_month;
    property  prolong_no : Integer read Fprolong_no write Fprolong_no;
    property note1 : WideString read Fnote1 write Fnote1;
    property note2 : WideString read Fnote2 write Fnote2;
    property supervisoryDate : TXSDate read FsupervisoryDate write FsupervisoryDate;
    property supervisoryNumber : WideString read FsupervisoryNumber write FsupervisoryNumber;
    property axPaymTerm : WideString read FaxPaymTerm write FaxPaymTerm;
    property axVendPaymMode : WideString read FaxVendPaymMode write FaxVendPaymMode;
    property org : RQOrg read Forg write Forg;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
  end;
}

  FINContractsFilter = class(FINContracts)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  FINContractsShort = class(TRemotable)
  private
    Fcode : Integer;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocID : Integer;
    Fdivision_id : Integer;
    Fdivision_name : WideString;
    Fagree_group_id : Integer;
    Fagree_group_name : WideString;
    Freg_num : WideString;
    Freg_date : TXSDate;
    Fstart_date : TXSDate;
    Fend_date : TXSDate;
    Fstatus : WideString;
    Fstatus_name : WideString;
    Fsumma : TXSDecimal;
    Fcurr_summ : TXSDecimal;
    Fcsumm_start_date : TXSDate;
    Fcurr_end_date : TXSDate;
    Fnums : TXSDecimal;
    Fdescription : WideString;
    Fclose_date : TXSDate;
    Fnotes : WideString;
    Fparent_id : Integer;
    Fedizm_id : Integer;
    Fedizm_name : WideString;
    Fpay_after_event : WideString;
    Fpay_period : Integer;
    Fpay_type : Integer;
    Fpay_type_name : WideString;
    Fsumm_note : WideString;
    Fnotlimited : WideString;
    Fio_flag : WideString;
    Fdeal_flag : WideString;
    Fgk_kategory : Integer;
    Fgk_kategory_name : WideString;
    Fact_exists : WideString;
    Fservice_id : Integer;
    Fservice_name : WideString;
    Fid_buyconds : Integer;
    Fname_buyconds : WideString;
    Fid_payform : Integer;
    Fname_payform : WideString;
    Fsumm_changemode : Integer;
    Fid_otvlico : Integer;
    Ftabn_otvlico : WideString;
    Ffio_otvlico : WideString;
    Fcurrency_code : WideString;
    Ftender_date : TXSDate;
    Ftender_no : WideString;
    Fprolong_month : Integer;
    Fprolong_no : Integer;
    Fnote1 : WideString;
    Fnote2 : WideString;
    FsupervisoryDate : TXSDate;
    FsupervisoryNumber : WideString;
    FaxPaymTerm : WideString;
    FaxVendPaymMode : WideString;
    ForgCode : Integer;
    ForgId : Integer;
    ForgCodeorg : WideString;
    ForgName : WideString;
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
    FtypePay : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property  division_id : Integer read Fdivision_id write Fdivision_id;
    property division_name : WideString read Fdivision_name write Fdivision_name;
    property  agree_group_id : Integer read Fagree_group_id write Fagree_group_id;
    property agree_group_name : WideString read Fagree_group_name write Fagree_group_name;
    property reg_num : WideString read Freg_num write Freg_num;
    property reg_date : TXSDate read Freg_date write Freg_date;
    property start_date : TXSDate read Fstart_date write Fstart_date;
    property end_date : TXSDate read Fend_date write Fend_date;
    property status : WideString read Fstatus write Fstatus;
    property status_name : WideString read Fstatus_name write Fstatus_name;
    property summa : TXSDecimal read Fsumma write Fsumma;
    property curr_summ : TXSDecimal read Fcurr_summ write Fcurr_summ;
    property csumm_start_date : TXSDate read Fcsumm_start_date write Fcsumm_start_date;
    property curr_end_date : TXSDate read Fcurr_end_date write Fcurr_end_date;
    property nums : TXSDecimal read Fnums write Fnums;
    property description : WideString read Fdescription write Fdescription;
    property close_date : TXSDate read Fclose_date write Fclose_date;
    property notes : WideString read Fnotes write Fnotes;
    property  parent_id : Integer read Fparent_id write Fparent_id;
    property  edizm_id : Integer read Fedizm_id write Fedizm_id;
    property edizm_name : WideString read Fedizm_name write Fedizm_name;
    property pay_after_event : WideString read Fpay_after_event write Fpay_after_event;
    property  pay_period : Integer read Fpay_period write Fpay_period;
    property  pay_type : Integer read Fpay_type write Fpay_type;
    property pay_type_name : WideString read Fpay_type_name write Fpay_type_name;
    property summ_note : WideString read Fsumm_note write Fsumm_note;
    property notlimited : WideString read Fnotlimited write Fnotlimited;
    property io_flag : WideString read Fio_flag write Fio_flag;
    property deal_flag : WideString read Fdeal_flag write Fdeal_flag;
    property  gk_kategory : Integer read Fgk_kategory write Fgk_kategory;
    property gk_kategory_name : WideString read Fgk_kategory_name write Fgk_kategory_name;
    property act_exists : WideString read Fact_exists write Fact_exists;
    property  service_id : Integer read Fservice_id write Fservice_id;
    property service_name : WideString read Fservice_name write Fservice_name;
    property  id_buyconds : Integer read Fid_buyconds write Fid_buyconds;
    property name_buyconds : WideString read Fname_buyconds write Fname_buyconds;
    property  id_payform : Integer read Fid_payform write Fid_payform;
    property name_payform : WideString read Fname_payform write Fname_payform;
    property  summ_changemode : Integer read Fsumm_changemode write Fsumm_changemode;
    property  id_otvlico : Integer read Fid_otvlico write Fid_otvlico;
    property tabn_otvlico : WideString read Ftabn_otvlico write Ftabn_otvlico;
    property fio_otvlico : WideString read Ffio_otvlico write Ffio_otvlico;
    property currency_code : WideString read Fcurrency_code write Fcurrency_code;
    property tender_date : TXSDate read Ftender_date write Ftender_date;
    property tender_no : WideString read Ftender_no write Ftender_no;
    property  prolong_month : Integer read Fprolong_month write Fprolong_month;
    property  prolong_no : Integer read Fprolong_no write Fprolong_no;
    property note1 : WideString read Fnote1 write Fnote1;
    property note2 : WideString read Fnote2 write Fnote2;
    property supervisoryDate : TXSDate read FsupervisoryDate write FsupervisoryDate;
    property supervisoryNumber : WideString read FsupervisoryNumber write FsupervisoryNumber;
    property axPaymTerm : WideString read FaxPaymTerm write FaxPaymTerm;
    property axVendPaymMode : WideString read FaxVendPaymMode write FaxVendPaymMode;

    property orgCode : Integer read ForgCode write ForgCode;
    property orgId : Integer read ForgId write ForgId;
    property orgCodeorg : WideString read ForgCodeorg write ForgCodeorg;
    property orgName : WideString read ForgName write ForgName;
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
    property typePay : WideString read FtypePay write FtypePay;
  end;

  ArrayOfFINContractsShort = array of FINContractsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  FINContractsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfFINContractsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfFINContractsShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/FINContractsController/message/
  // soapAction: http://ksoe.org/FINContractsController/action/FINContractsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : FINContractsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : FINContractsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  FINContractsControllerSoapPort = interface(IInvokable)
  ['{F7903AAF-52FA-421D-ACF9-267F7E14E48A}']
    function add(const aFINContracts: FINContracts): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aFINContracts: FINContracts); stdcall;
    function getObject(const anObjectCode: Integer): FINContracts; stdcall;
    function getList: FINContractsShortList; stdcall;
    function getFilteredList(const aFINContractsFilter: FINContractsFilter): FINContractsShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): FINContractsShortList; stdcall;
    function getScrollableFilteredList(const aFINContractsFilter: FINContractsFilter; const aFromPosition: Integer; const aQuantity: Integer): FINContractsShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): FINContractsShortList; stdcall;
    function getScrollableFilteredCodeArray(const aFINContractsFilter: FINContractsFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): FINContractsShort; stdcall;
    function getObjectFromFK(const id: Integer): FINContracts; stdcall;
  end;


implementation

  destructor FINContracts.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(Freg_date) then
      reg_date.Free;
    if Assigned(Fstart_date) then
      start_date.Free;
    if Assigned(Fend_date) then
      end_date.Free;
    if Assigned(Fsumma) then
      summa.Free;
    if Assigned(Fcurr_summ) then
      curr_summ.Free;
    if Assigned(Fcsumm_start_date) then
      csumm_start_date.Free;
    if Assigned(Fcurr_end_date) then
      curr_end_date.Free;
    if Assigned(Fnums) then
      nums.Free;
    if Assigned(Fclose_date) then
      close_date.Free;
    if Assigned(Ftender_date) then
      tender_date.Free;
    if Assigned(FsupervisoryDate) then
      supervisoryDate.Free;
    if Assigned(Forg) then
      org.Free;
    if Assigned(FgeneralContractRef) then
      generalContractRef.Free;
    inherited Destroy;
  end;

{
  destructor FINContractsFilter.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(Freg_date) then
      reg_date.Free;
    if Assigned(Fstart_date) then
      start_date.Free;
    if Assigned(Fend_date) then
      end_date.Free;
    if Assigned(Fsumma) then
      summa.Free;
    if Assigned(Fcurr_summ) then
      curr_summ.Free;
    if Assigned(Fcsumm_start_date) then
      csumm_start_date.Free;
    if Assigned(Fcurr_end_date) then
      curr_end_date.Free;
    if Assigned(Fnums) then
      nums.Free;
    if Assigned(Fclose_date) then
      close_date.Free;
    if Assigned(Ftender_date) then
      tender_date.Free;
    if Assigned(FsupervisoryDate) then
      supervisoryDate.Free;
    if Assigned(Forg) then
      org.Free;
    if Assigned(FgeneralContractRef) then
      generalContractRef.Free;
    inherited Destroy;
  end;
}

  destructor FINContractsFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor FINContractsShort.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(Freg_date) then
      reg_date.Free;
    if Assigned(Fstart_date) then
      start_date.Free;
    if Assigned(Fend_date) then
      end_date.Free;
    if Assigned(Fsumma) then
      summa.Free;
    if Assigned(Fcurr_summ) then
      curr_summ.Free;
    if Assigned(Fcsumm_start_date) then
      csumm_start_date.Free;
    if Assigned(Fcurr_end_date) then
      curr_end_date.Free;
    if Assigned(Fnums) then
      nums.Free;
    if Assigned(Fclose_date) then
      close_date.Free;
    if Assigned(Ftender_date) then
      tender_date.Free;
    if Assigned(FsupervisoryDate) then
      supervisoryDate.Free;
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

  destructor FINContractsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(FINContracts, 'http://ksoe.org/EnergyproControllerService/type/', 'FINContracts');
  RemClassRegistry.RegisterXSClass(FINContractsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'FINContractsRef');
  RemClassRegistry.RegisterXSClass(FINContractsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'FINContractsFilter');
  RemClassRegistry.RegisterXSClass(FINContractsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'FINContractsShort');
  RemClassRegistry.RegisterXSClass(FINContractsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'FINContractsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFINContractsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfFINContractsShort');

  InvRegistry.RegisterInterface(TypeInfo(FINContractsControllerSoapPort), 'http://ksoe.org/FINContractsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(FINContractsControllerSoapPort), 'http://ksoe.org/FINContractsController/action/FINContractsController.%operationName%');


end.
