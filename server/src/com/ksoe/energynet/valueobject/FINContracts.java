
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for FINContracts;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.rqorder.valueobject.RQOrg;
    import  com.ksoe.energynet.valueobject.references.ENGeneralContractsRef;

public class FINContracts implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  contractNumber; 
    public Date contractDate ;
    public String  finDocCode; 
    public int  finDocID = Integer.MIN_VALUE; 
    public int  division_id = Integer.MIN_VALUE; 
    public String  division_name; 
    public int  agree_group_id = Integer.MIN_VALUE; 
    public String  agree_group_name; 
    public String  reg_num; 
    public Date reg_date ;
    public Date start_date ;
    public Date end_date ;
    public String  status; 
    public String  status_name; 
    public BigDecimal  summa; 
    public BigDecimal  curr_summ; 
    public Date csumm_start_date ;
    public Date curr_end_date ;
    public BigDecimal  nums; 
    public String  description; 
    public Date close_date ;
    public String  notes; 
    public int  parent_id = Integer.MIN_VALUE; 
    public int  edizm_id = Integer.MIN_VALUE; 
    public String  edizm_name; 
    public String  pay_after_event; 
    public int  pay_period = Integer.MIN_VALUE; 
    public int  pay_type = Integer.MIN_VALUE; 
    public String  pay_type_name; 
    public String  summ_note; 
    public String  notlimited; 
    public String  io_flag; 
    public String  deal_flag; 
    public int  gk_kategory = Integer.MIN_VALUE; 
    public String  gk_kategory_name; 
    public String  act_exists; 
    public int  service_id = Integer.MIN_VALUE; 
    public String  service_name; 
    public int  id_buyconds = Integer.MIN_VALUE; 
    public String  name_buyconds; 
    public int  id_payform = Integer.MIN_VALUE; 
    public String  name_payform; 
    public int  summ_changemode = Integer.MIN_VALUE; 
    public int  id_otvlico = Integer.MIN_VALUE; 
    public String  tabn_otvlico; 
    public String  fio_otvlico; 
    public String  currency_code; 
    public Date tender_date ;
    public String  tender_no; 
    public int  prolong_month = Integer.MIN_VALUE; 
    public int  prolong_no = Integer.MIN_VALUE; 
    public String  note1; 
    public String  note2; 
    public Date supervisoryDate ;
    public String  supervisoryNumber; 
    public String  axPaymTerm; 
    public String  axVendPaymMode; 
    public RQOrg org = new RQOrg();
    public ENGeneralContractsRef generalContractRef = new ENGeneralContractsRef();
    public String  typePay; 
    public static final String tableName = "FINCONTRACTS";   
	public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "FINCONTRACTS.CODE";
    public static final String contractNumber_Attr = "contractNumber";
    public static final String contractNumber_Field = "CONTRACTNUMBER";
    public static final String contractNumber_QFielld = "FINCONTRACTS.CONTRACTNUMBER";
    public static final String contractDate_Attr = "contractDate";
    public static final String contractDate_Field = "CONTRACTDATE";
    public static final String contractDate_QFielld = "FINCONTRACTS.CONTRACTDATE";
    public static final String finDocCode_Attr = "finDocCode";
    public static final String finDocCode_Field = "FINDOCCODE";
    public static final String finDocCode_QFielld = "FINCONTRACTS.FINDOCCODE";
    public static final String finDocID_Attr = "finDocID";
    public static final String finDocID_Field = "FINDOCID";
    public static final String finDocID_QFielld = "FINCONTRACTS.FINDOCID";
    public static final String division_id_Attr = "division_id";
    public static final String division_id_Field = "DIVISION_ID";
    public static final String division_id_QFielld = "FINCONTRACTS.DIVISION_ID";
    public static final String division_name_Attr = "division_name";
    public static final String division_name_Field = "DIVISION_NAME";
    public static final String division_name_QFielld = "FINCONTRACTS.DIVISION_NAME";
    public static final String agree_group_id_Attr = "agree_group_id";
    public static final String agree_group_id_Field = "AGREE_GROUP_ID";
    public static final String agree_group_id_QFielld = "FINCONTRACTS.AGREE_GROUP_ID";
    public static final String agree_group_name_Attr = "agree_group_name";
    public static final String agree_group_name_Field = "AGREE_GROUP_NAME";
    public static final String agree_group_name_QFielld = "FINCONTRACTS.AGREE_GROUP_NAME";
    public static final String reg_num_Attr = "reg_num";
    public static final String reg_num_Field = "REG_NUM";
    public static final String reg_num_QFielld = "FINCONTRACTS.REG_NUM";
    public static final String reg_date_Attr = "reg_date";
    public static final String reg_date_Field = "REG_DATE";
    public static final String reg_date_QFielld = "FINCONTRACTS.REG_DATE";
    public static final String start_date_Attr = "start_date";
    public static final String start_date_Field = "START_DATE";
    public static final String start_date_QFielld = "FINCONTRACTS.START_DATE";
    public static final String end_date_Attr = "end_date";
    public static final String end_date_Field = "END_DATE";
    public static final String end_date_QFielld = "FINCONTRACTS.END_DATE";
    public static final String status_Attr = "status";
    public static final String status_Field = "STATUS";
    public static final String status_QFielld = "FINCONTRACTS.STATUS";
    public static final String status_name_Attr = "status_name";
    public static final String status_name_Field = "STATUS_NAME";
    public static final String status_name_QFielld = "FINCONTRACTS.STATUS_NAME";
    public static final String summa_Attr = "summa";
    public static final String summa_Field = "SUMMA";
    public static final String summa_QFielld = "FINCONTRACTS.SUMMA";
    public static final String curr_summ_Attr = "curr_summ";
    public static final String curr_summ_Field = "CURR_SUMM";
    public static final String curr_summ_QFielld = "FINCONTRACTS.CURR_SUMM";
    public static final String csumm_start_date_Attr = "csumm_start_date";
    public static final String csumm_start_date_Field = "CSUMM_START_DATE";
    public static final String csumm_start_date_QFielld = "FINCONTRACTS.CSUMM_START_DATE";
    public static final String curr_end_date_Attr = "curr_end_date";
    public static final String curr_end_date_Field = "CURR_END_DATE";
    public static final String curr_end_date_QFielld = "FINCONTRACTS.CURR_END_DATE";
    public static final String nums_Attr = "nums";
    public static final String nums_Field = "NUMS";
    public static final String nums_QFielld = "FINCONTRACTS.NUMS";
    public static final String description_Attr = "description";
    public static final String description_Field = "DESCRIPTION";
    public static final String description_QFielld = "FINCONTRACTS.DESCRIPTION";
    public static final String close_date_Attr = "close_date";
    public static final String close_date_Field = "CLOSE_DATE";
    public static final String close_date_QFielld = "FINCONTRACTS.CLOSE_DATE";
    public static final String notes_Attr = "notes";
    public static final String notes_Field = "NOTES";
    public static final String notes_QFielld = "FINCONTRACTS.NOTES";
    public static final String parent_id_Attr = "parent_id";
    public static final String parent_id_Field = "PARENT_ID";
    public static final String parent_id_QFielld = "FINCONTRACTS.PARENT_ID";
    public static final String edizm_id_Attr = "edizm_id";
    public static final String edizm_id_Field = "EDIZM_ID";
    public static final String edizm_id_QFielld = "FINCONTRACTS.EDIZM_ID";
    public static final String edizm_name_Attr = "edizm_name";
    public static final String edizm_name_Field = "EDIZM_NAME";
    public static final String edizm_name_QFielld = "FINCONTRACTS.EDIZM_NAME";
    public static final String pay_after_event_Attr = "pay_after_event";
    public static final String pay_after_event_Field = "PAY_AFTER_EVENT";
    public static final String pay_after_event_QFielld = "FINCONTRACTS.PAY_AFTER_EVENT";
    public static final String pay_period_Attr = "pay_period";
    public static final String pay_period_Field = "PAY_PERIOD";
    public static final String pay_period_QFielld = "FINCONTRACTS.PAY_PERIOD";
    public static final String pay_type_Attr = "pay_type";
    public static final String pay_type_Field = "PAY_TYPE";
    public static final String pay_type_QFielld = "FINCONTRACTS.PAY_TYPE";
    public static final String pay_type_name_Attr = "pay_type_name";
    public static final String pay_type_name_Field = "PAY_TYPE_NAME";
    public static final String pay_type_name_QFielld = "FINCONTRACTS.PAY_TYPE_NAME";
    public static final String summ_note_Attr = "summ_note";
    public static final String summ_note_Field = "SUMM_NOTE";
    public static final String summ_note_QFielld = "FINCONTRACTS.SUMM_NOTE";
    public static final String notlimited_Attr = "notlimited";
    public static final String notlimited_Field = "NOTLIMITED";
    public static final String notlimited_QFielld = "FINCONTRACTS.NOTLIMITED";
    public static final String io_flag_Attr = "io_flag";
    public static final String io_flag_Field = "IO_FLAG";
    public static final String io_flag_QFielld = "FINCONTRACTS.IO_FLAG";
    public static final String deal_flag_Attr = "deal_flag";
    public static final String deal_flag_Field = "DEAL_FLAG";
    public static final String deal_flag_QFielld = "FINCONTRACTS.DEAL_FLAG";
    public static final String gk_kategory_Attr = "gk_kategory";
    public static final String gk_kategory_Field = "GK_KATEGORY";
    public static final String gk_kategory_QFielld = "FINCONTRACTS.GK_KATEGORY";
    public static final String gk_kategory_name_Attr = "gk_kategory_name";
    public static final String gk_kategory_name_Field = "GK_KATEGORY_NAME";
    public static final String gk_kategory_name_QFielld = "FINCONTRACTS.GK_KATEGORY_NAME";
    public static final String act_exists_Attr = "act_exists";
    public static final String act_exists_Field = "ACT_EXISTS";
    public static final String act_exists_QFielld = "FINCONTRACTS.ACT_EXISTS";
    public static final String service_id_Attr = "service_id";
    public static final String service_id_Field = "SERVICE_ID";
    public static final String service_id_QFielld = "FINCONTRACTS.SERVICE_ID";
    public static final String service_name_Attr = "service_name";
    public static final String service_name_Field = "SERVICE_NAME";
    public static final String service_name_QFielld = "FINCONTRACTS.SERVICE_NAME";
    public static final String id_buyconds_Attr = "id_buyconds";
    public static final String id_buyconds_Field = "ID_BUYCONDS";
    public static final String id_buyconds_QFielld = "FINCONTRACTS.ID_BUYCONDS";
    public static final String name_buyconds_Attr = "name_buyconds";
    public static final String name_buyconds_Field = "NAME_BUYCONDS";
    public static final String name_buyconds_QFielld = "FINCONTRACTS.NAME_BUYCONDS";
    public static final String id_payform_Attr = "id_payform";
    public static final String id_payform_Field = "ID_PAYFORM";
    public static final String id_payform_QFielld = "FINCONTRACTS.ID_PAYFORM";
    public static final String name_payform_Attr = "name_payform";
    public static final String name_payform_Field = "NAME_PAYFORM";
    public static final String name_payform_QFielld = "FINCONTRACTS.NAME_PAYFORM";
    public static final String summ_changemode_Attr = "summ_changemode";
    public static final String summ_changemode_Field = "SUMM_CHANGEMODE";
    public static final String summ_changemode_QFielld = "FINCONTRACTS.SUMM_CHANGEMODE";
    public static final String id_otvlico_Attr = "id_otvlico";
    public static final String id_otvlico_Field = "ID_OTVLICO";
    public static final String id_otvlico_QFielld = "FINCONTRACTS.ID_OTVLICO";
    public static final String tabn_otvlico_Attr = "tabn_otvlico";
    public static final String tabn_otvlico_Field = "TABN_OTVLICO";
    public static final String tabn_otvlico_QFielld = "FINCONTRACTS.TABN_OTVLICO";
    public static final String fio_otvlico_Attr = "fio_otvlico";
    public static final String fio_otvlico_Field = "FIO_OTVLICO";
    public static final String fio_otvlico_QFielld = "FINCONTRACTS.FIO_OTVLICO";
    public static final String currency_code_Attr = "currency_code";
    public static final String currency_code_Field = "CURRENCY_CODE";
    public static final String currency_code_QFielld = "FINCONTRACTS.CURRENCY_CODE";
    public static final String tender_date_Attr = "tender_date";
    public static final String tender_date_Field = "TENDER_DATE";
    public static final String tender_date_QFielld = "FINCONTRACTS.TENDER_DATE";
    public static final String tender_no_Attr = "tender_no";
    public static final String tender_no_Field = "TENDER_NO";
    public static final String tender_no_QFielld = "FINCONTRACTS.TENDER_NO";
    public static final String prolong_month_Attr = "prolong_month";
    public static final String prolong_month_Field = "PROLONG_MONTH";
    public static final String prolong_month_QFielld = "FINCONTRACTS.PROLONG_MONTH";
    public static final String prolong_no_Attr = "prolong_no";
    public static final String prolong_no_Field = "PROLONG_NO";
    public static final String prolong_no_QFielld = "FINCONTRACTS.PROLONG_NO";
    public static final String note1_Attr = "note1";
    public static final String note1_Field = "NOTE1";
    public static final String note1_QFielld = "FINCONTRACTS.NOTE1";
    public static final String note2_Attr = "note2";
    public static final String note2_Field = "NOTE2";
    public static final String note2_QFielld = "FINCONTRACTS.NOTE2";
    public static final String supervisoryDate_Attr = "supervisoryDate";
    public static final String supervisoryDate_Field = "SUPERVISORYDATE";
    public static final String supervisoryDate_QFielld = "FINCONTRACTS.SUPERVISORYDATE";
    public static final String supervisoryNumber_Attr = "supervisoryNumber";
    public static final String supervisoryNumber_Field = "SUPERVISORYNUMBER";
    public static final String supervisoryNumber_QFielld = "FINCONTRACTS.SUPERVISORYNUMBER";
    public static final String axPaymTerm_Attr = "axPaymTerm";
    public static final String axPaymTerm_Field = "AXPAYMTERM";
    public static final String axPaymTerm_QFielld = "FINCONTRACTS.AXPAYMTERM";
    public static final String axVendPaymMode_Attr = "axVendPaymMode";
    public static final String axVendPaymMode_Field = "AXVENDPAYMMODE";
    public static final String axVendPaymMode_QFielld = "FINCONTRACTS.AXVENDPAYMMODE";
    public static final String org_Attr = "org";
    public static final String org_Field = "ORGCODE";
    public static final String  org_QFielld = "FINCONTRACTS.ORGCODE";
    public static final String generalContractRef_Attr = "generalContractRef";
    public static final String generalContractRef_Field = "GENERALCONTRACTREFCODE";
    public static final String  generalContractRef_QFielld = "FINCONTRACTS.GENERALCONTRACTREFCODE";


    public String getTypePay() {
		return typePay;
	}

	public void setTypePay(String typePay) {
		this.typePay = typePay;
	}


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setContractNumber(String aValue){
       contractNumber = aValue;
    }

    public String getContractNumber(){
       return contractNumber;
    }


    public void setContractDate(Date aValue){
       contractDate = aValue;
    }

    public Date getContractDate(){
       return contractDate;
    }


    public void setFinDocCode(String aValue){
       finDocCode = aValue;
    }

    public String getFinDocCode(){
       return finDocCode;
    }


    public void setFinDocID(int aValue){
       finDocID = aValue;
    }

    public int getFinDocID(){
       return finDocID;
    }


    public void setDivision_id(int aValue){
       division_id = aValue;
    }

    public int getDivision_id(){
       return division_id;
    }


    public void setDivision_name(String aValue){
       division_name = aValue;
    }

    public String getDivision_name(){
       return division_name;
    }


    public void setAgree_group_id(int aValue){
       agree_group_id = aValue;
    }

    public int getAgree_group_id(){
       return agree_group_id;
    }


    public void setAgree_group_name(String aValue){
       agree_group_name = aValue;
    }

    public String getAgree_group_name(){
       return agree_group_name;
    }


    public void setReg_num(String aValue){
       reg_num = aValue;
    }

    public String getReg_num(){
       return reg_num;
    }


    public void setReg_date(Date aValue){
       reg_date = aValue;
    }

    public Date getReg_date(){
       return reg_date;
    }


    public void setStart_date(Date aValue){
       start_date = aValue;
    }

    public Date getStart_date(){
       return start_date;
    }


    public void setEnd_date(Date aValue){
       end_date = aValue;
    }

    public Date getEnd_date(){
       return end_date;
    }


    public void setStatus(String aValue){
       status = aValue;
    }

    public String getStatus(){
       return status;
    }


    public void setStatus_name(String aValue){
       status_name = aValue;
    }

    public String getStatus_name(){
       return status_name;
    }


    public void setSumma(BigDecimal aValue){
       summa = aValue;
    }

    public BigDecimal getSumma(){
       return summa;
    }


    public void setCurr_summ(BigDecimal aValue){
       curr_summ = aValue;
    }

    public BigDecimal getCurr_summ(){
       return curr_summ;
    }


    public void setCsumm_start_date(Date aValue){
       csumm_start_date = aValue;
    }

    public Date getCsumm_start_date(){
       return csumm_start_date;
    }


    public void setCurr_end_date(Date aValue){
       curr_end_date = aValue;
    }

    public Date getCurr_end_date(){
       return curr_end_date;
    }


    public void setNums(BigDecimal aValue){
       nums = aValue;
    }

    public BigDecimal getNums(){
       return nums;
    }


    public void setDescription(String aValue){
       description = aValue;
    }

    public String getDescription(){
       return description;
    }


    public void setClose_date(Date aValue){
       close_date = aValue;
    }

    public Date getClose_date(){
       return close_date;
    }


    public void setNotes(String aValue){
       notes = aValue;
    }

    public String getNotes(){
       return notes;
    }


    public void setParent_id(int aValue){
       parent_id = aValue;
    }

    public int getParent_id(){
       return parent_id;
    }


    public void setEdizm_id(int aValue){
       edizm_id = aValue;
    }

    public int getEdizm_id(){
       return edizm_id;
    }


    public void setEdizm_name(String aValue){
       edizm_name = aValue;
    }

    public String getEdizm_name(){
       return edizm_name;
    }


    public void setPay_after_event(String aValue){
       pay_after_event = aValue;
    }

    public String getPay_after_event(){
       return pay_after_event;
    }


    public void setPay_period(int aValue){
       pay_period = aValue;
    }

    public int getPay_period(){
       return pay_period;
    }


    public void setPay_type(int aValue){
       pay_type = aValue;
    }

    public int getPay_type(){
       return pay_type;
    }


    public void setPay_type_name(String aValue){
       pay_type_name = aValue;
    }

    public String getPay_type_name(){
       return pay_type_name;
    }


    public void setSumm_note(String aValue){
       summ_note = aValue;
    }

    public String getSumm_note(){
       return summ_note;
    }


    public void setNotlimited(String aValue){
       notlimited = aValue;
    }

    public String getNotlimited(){
       return notlimited;
    }


    public void setIo_flag(String aValue){
       io_flag = aValue;
    }

    public String getIo_flag(){
       return io_flag;
    }


    public void setDeal_flag(String aValue){
       deal_flag = aValue;
    }

    public String getDeal_flag(){
       return deal_flag;
    }


    public void setGk_kategory(int aValue){
       gk_kategory = aValue;
    }

    public int getGk_kategory(){
       return gk_kategory;
    }


    public void setGk_kategory_name(String aValue){
       gk_kategory_name = aValue;
    }

    public String getGk_kategory_name(){
       return gk_kategory_name;
    }


    public void setAct_exists(String aValue){
       act_exists = aValue;
    }

    public String getAct_exists(){
       return act_exists;
    }


    public void setService_id(int aValue){
       service_id = aValue;
    }

    public int getService_id(){
       return service_id;
    }


    public void setService_name(String aValue){
       service_name = aValue;
    }

    public String getService_name(){
       return service_name;
    }


    public void setId_buyconds(int aValue){
       id_buyconds = aValue;
    }

    public int getId_buyconds(){
       return id_buyconds;
    }


    public void setName_buyconds(String aValue){
       name_buyconds = aValue;
    }

    public String getName_buyconds(){
       return name_buyconds;
    }


    public void setId_payform(int aValue){
       id_payform = aValue;
    }

    public int getId_payform(){
       return id_payform;
    }


    public void setName_payform(String aValue){
       name_payform = aValue;
    }

    public String getName_payform(){
       return name_payform;
    }


    public void setSumm_changemode(int aValue){
       summ_changemode = aValue;
    }

    public int getSumm_changemode(){
       return summ_changemode;
    }


    public void setId_otvlico(int aValue){
       id_otvlico = aValue;
    }

    public int getId_otvlico(){
       return id_otvlico;
    }


    public void setTabn_otvlico(String aValue){
       tabn_otvlico = aValue;
    }

    public String getTabn_otvlico(){
       return tabn_otvlico;
    }


    public void setFio_otvlico(String aValue){
       fio_otvlico = aValue;
    }

    public String getFio_otvlico(){
       return fio_otvlico;
    }


    public void setCurrency_code(String aValue){
       currency_code = aValue;
    }

    public String getCurrency_code(){
       return currency_code;
    }


    public void setTender_date(Date aValue){
       tender_date = aValue;
    }

    public Date getTender_date(){
       return tender_date;
    }


    public void setTender_no(String aValue){
       tender_no = aValue;
    }

    public String getTender_no(){
       return tender_no;
    }


    public void setProlong_month(int aValue){
       prolong_month = aValue;
    }

    public int getProlong_month(){
       return prolong_month;
    }


    public void setProlong_no(int aValue){
       prolong_no = aValue;
    }

    public int getProlong_no(){
       return prolong_no;
    }


    public void setNote1(String aValue){
       note1 = aValue;
    }

    public String getNote1(){
       return note1;
    }


    public void setNote2(String aValue){
       note2 = aValue;
    }

    public String getNote2(){
       return note2;
    }


    public void setSupervisoryDate(Date aValue){
       supervisoryDate = aValue;
    }

    public Date getSupervisoryDate(){
       return supervisoryDate;
    }


    public void setSupervisoryNumber(String aValue){
       supervisoryNumber = aValue;
    }

    public String getSupervisoryNumber(){
       return supervisoryNumber;
    }


    public void setAxPaymTerm(String aValue){
       axPaymTerm = aValue;
    }

    public String getAxPaymTerm(){
       return axPaymTerm;
    }


    public void setAxVendPaymMode(String aValue){
       axVendPaymMode = aValue;
    }

    public String getAxVendPaymMode(){
       return axVendPaymMode;
    }

    public void setOrg(RQOrg aValue){
       org = aValue;
    }

    public RQOrg getOrg(){
       return org;
    }
    public void setGeneralContractRef(ENGeneralContractsRef aValue){
       generalContractRef = aValue;
    }

    public ENGeneralContractsRef getGeneralContractRef(){
       return generalContractRef;
    }

} // end of FINContractsValueObject

