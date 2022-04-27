
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for FINContracts;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class FINContractsShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String contractNumber;
	public Date contractDate ;
	public String finDocCode;
	public int finDocID = Integer.MIN_VALUE;
	public int division_id = Integer.MIN_VALUE;
	public String division_name;
	public int agree_group_id = Integer.MIN_VALUE;
	public String agree_group_name;
	public String reg_num;
	public Date reg_date ;
	public Date start_date ;
	public Date end_date ;
	public String status;
	public String status_name;
	public BigDecimal summa;
	public BigDecimal curr_summ;
	public Date csumm_start_date ;
	public Date curr_end_date ;
	public BigDecimal nums;
	public String description;
	public Date close_date ;
	public String notes;
	public int parent_id = Integer.MIN_VALUE;
	public int edizm_id = Integer.MIN_VALUE;
	public String edizm_name;
	public String pay_after_event;
	public int pay_period = Integer.MIN_VALUE;
	public int pay_type = Integer.MIN_VALUE;
	public String pay_type_name;
	public String summ_note;
	public String notlimited;
	public String io_flag;
	public String deal_flag;
	public int gk_kategory = Integer.MIN_VALUE;
	public String gk_kategory_name;
	public String act_exists;
	public int service_id = Integer.MIN_VALUE;
	public String service_name;
	public int id_buyconds = Integer.MIN_VALUE;
	public String name_buyconds;
	public int id_payform = Integer.MIN_VALUE;
	public String name_payform;
	public int summ_changemode = Integer.MIN_VALUE;
	public int id_otvlico = Integer.MIN_VALUE;
	public String tabn_otvlico;
	public String fio_otvlico;
	public String currency_code;
	public Date tender_date ;
	public String tender_no;
	public int prolong_month = Integer.MIN_VALUE;
	public int prolong_no = Integer.MIN_VALUE;
	public String note1;
	public String note2;
	public Date supervisoryDate ;
	public String supervisoryNumber;
	public String axPaymTerm;
	public String axVendPaymMode;
	public int orgCode = Integer.MIN_VALUE;
	public int orgId = Integer.MIN_VALUE;
	public String orgCodeorg;
	public String orgName;
	public int generalContractRefCode = Integer.MIN_VALUE;
	public int generalContractRefFinDocID = Integer.MIN_VALUE;
	public String generalContractRefFinDocCode;
	public String generalContractRefContractNumber;
	public Date generalContractRefContractDate;
	public String generalContractRefCommentGen;
	public int generalContractRefPartnerId = Integer.MIN_VALUE;
	public String generalContractRefPartnerCode;
	public String generalContractRefPartnerName;
	public Date generalContractRefContractRegDate;
	public Date generalContractRefContractStartDate;
	public Date generalContractRefContractEndDate;
	public String generalContractRefAxContractId;
	public String generalContractRefAxContractCode;
	public String generalContractRefAxContractNumber;
	public String generalContractRefAxContractAccount;
	public Date generalContractRefAxContractDate;
	public String generalContractRefAxContractCommentGen;
	public String generalContractRefAxContractGroupCode;
	public String generalContractRefAxPartnerCode;
	public String generalContractRefAxPartnerName;
	public String generalContractRefUserGen;


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


	public void setOrgCode(int aValue){
		orgCode = aValue;
	}
	public int getOrgCode(){
		return orgCode;
	}

	public void setOrgId(int aValue){
		orgId = aValue;
	}
	public int getOrgId(){
		return orgId;
	}

	public void setOrgCodeorg(String aValue){
		orgCodeorg = aValue;
	}
	public String getOrgCodeorg(){
		return orgCodeorg;
	}

	public void setOrgName(String aValue){
		orgName = aValue;
	}
	public String getOrgName(){
		return orgName;
	}

	public void setGeneralContractRefCode(int aValue){
		generalContractRefCode = aValue;
	}
	public int getGeneralContractRefCode(){
		return generalContractRefCode;
	}

	public void setGeneralContractRefFinDocID(int aValue){
		generalContractRefFinDocID = aValue;
	}
	public int getGeneralContractRefFinDocID(){
		return generalContractRefFinDocID;
	}

	public void setGeneralContractRefFinDocCode(String aValue){
		generalContractRefFinDocCode = aValue;
	}
	public String getGeneralContractRefFinDocCode(){
		return generalContractRefFinDocCode;
	}

	public void setGeneralContractRefContractNumber(String aValue){
		generalContractRefContractNumber = aValue;
	}
	public String getGeneralContractRefContractNumber(){
		return generalContractRefContractNumber;
	}

	public void setGeneralContractRefContractDate(Date aValue){
		generalContractRefContractDate = aValue;
	}
	public Date getGeneralContractRefContractDate(){
		return generalContractRefContractDate;
	}

	public void setGeneralContractRefCommentGen(String aValue){
		generalContractRefCommentGen = aValue;
	}
	public String getGeneralContractRefCommentGen(){
		return generalContractRefCommentGen;
	}

	public void setGeneralContractRefPartnerId(int aValue){
		generalContractRefPartnerId = aValue;
	}
	public int getGeneralContractRefPartnerId(){
		return generalContractRefPartnerId;
	}

	public void setGeneralContractRefPartnerCode(String aValue){
		generalContractRefPartnerCode = aValue;
	}
	public String getGeneralContractRefPartnerCode(){
		return generalContractRefPartnerCode;
	}

	public void setGeneralContractRefPartnerName(String aValue){
		generalContractRefPartnerName = aValue;
	}
	public String getGeneralContractRefPartnerName(){
		return generalContractRefPartnerName;
	}

	public void setGeneralContractRefContractRegDate(Date aValue){
		generalContractRefContractRegDate = aValue;
	}
	public Date getGeneralContractRefContractRegDate(){
		return generalContractRefContractRegDate;
	}

	public void setGeneralContractRefContractStartDate(Date aValue){
		generalContractRefContractStartDate = aValue;
	}
	public Date getGeneralContractRefContractStartDate(){
		return generalContractRefContractStartDate;
	}

	public void setGeneralContractRefContractEndDate(Date aValue){
		generalContractRefContractEndDate = aValue;
	}
	public Date getGeneralContractRefContractEndDate(){
		return generalContractRefContractEndDate;
	}

	public void setGeneralContractRefAxContractId(String aValue){
		generalContractRefAxContractId = aValue;
	}
	public String getGeneralContractRefAxContractId(){
		return generalContractRefAxContractId;
	}

	public void setGeneralContractRefAxContractCode(String aValue){
		generalContractRefAxContractCode = aValue;
	}
	public String getGeneralContractRefAxContractCode(){
		return generalContractRefAxContractCode;
	}

	public void setGeneralContractRefAxContractNumber(String aValue){
		generalContractRefAxContractNumber = aValue;
	}
	public String getGeneralContractRefAxContractNumber(){
		return generalContractRefAxContractNumber;
	}

	public void setGeneralContractRefAxContractAccount(String aValue){
		generalContractRefAxContractAccount = aValue;
	}
	public String getGeneralContractRefAxContractAccount(){
		return generalContractRefAxContractAccount;
	}

	public void setGeneralContractRefAxContractDate(Date aValue){
		generalContractRefAxContractDate = aValue;
	}
	public Date getGeneralContractRefAxContractDate(){
		return generalContractRefAxContractDate;
	}

	public void setGeneralContractRefAxContractCommentGen(String aValue){
		generalContractRefAxContractCommentGen = aValue;
	}
	public String getGeneralContractRefAxContractCommentGen(){
		return generalContractRefAxContractCommentGen;
	}

	public void setGeneralContractRefAxContractGroupCode(String aValue){
		generalContractRefAxContractGroupCode = aValue;
	}
	public String getGeneralContractRefAxContractGroupCode(){
		return generalContractRefAxContractGroupCode;
	}

	public void setGeneralContractRefAxPartnerCode(String aValue){
		generalContractRefAxPartnerCode = aValue;
	}
	public String getGeneralContractRefAxPartnerCode(){
		return generalContractRefAxPartnerCode;
	}

	public void setGeneralContractRefAxPartnerName(String aValue){
		generalContractRefAxPartnerName = aValue;
	}
	public String getGeneralContractRefAxPartnerName(){
		return generalContractRefAxPartnerName;
	}

	public void setGeneralContractRefUserGen(String aValue){
		generalContractRefUserGen = aValue;
	}
	public String getGeneralContractRefUserGen(){
		return generalContractRefUserGen;
	}



}