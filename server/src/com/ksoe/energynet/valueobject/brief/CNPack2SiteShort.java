
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for CNPack2Site;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class CNPack2SiteShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public int is_reg = Integer.MIN_VALUE;
	public String customeremail;
	public String phone;
	public int customertype = Integer.MIN_VALUE;
	public int subsystemRefCode = Integer.MIN_VALUE;
	public String subsystemRefName;
	public int cnPackRefCode = Integer.MIN_VALUE;
	public int cnPackRefPackCode = Integer.MIN_VALUE;
	public String cnPackRefName;
	public int cnPackRefId_ren = Integer.MIN_VALUE;
	public String cnPackRefRenName;
	public int cnPackRefId_district = Integer.MIN_VALUE;
	public String cnPackRefDistrictName;
	public int cnPackRefId_child_district = Integer.MIN_VALUE;
	public String cnPackRefChildDistrictName;
	public int cnPackRefId_pack_status = Integer.MIN_VALUE;
	public String cnPackRefStatusName;
	public String cnPackRefDescription;
	public BigDecimal cnPackRefPower;
	public String cnPackRefAddress;
	public String cnPackRefAddress_jur;
	public String cnPackRefReg_num_cn_contract;
	public Date cnPackRefDate_cn_contract;
	public String cnPackRefReg_num_spl_pp_contract;
	public Date cnPackRefDate_spl_pp_contract;
	public String cnPackRefReg_num_tu_contract;
	public Date cnPackRefDate_tu_contract;
	public String cnPackRefReg_num_tu_cr_contract;
	public Date cnPackRefDate_tu_cr_contract;
	public String cnPackRefProject_num;
	public Date cnPackRefProject_date;
	public int cnPackRefOver5 = Integer.MIN_VALUE;
	public int cnPackRefStatus = Integer.MIN_VALUE;
	public String cnPackRefLetter_num_customer;
	public Date cnPackRefDate_letter_customer;
	public String cnPackRefLetter_num;
	public Date cnPackRefDate_letter;
	public String cnPackRefReliability_class;
	public int cnPackRefId_waiting_status = Integer.MIN_VALUE;
	public String cnPackRefWaitingStatus;
	public int cnPackRefIs_payable = Integer.MIN_VALUE;
	public String cnPackRefWorksize;
	public String cnPackRefWork_inc_net;
	public String cnPackRefBusiness_type;
	public int cnPackRefEstimateterm = Integer.MIN_VALUE;
	public Date cnPackRefEstimatedate;
	public int cnPackRefBuildingterm = Integer.MIN_VALUE;
	public Date cnPackRefBuildingdate;
	public int cnPackRefBuyingterm = Integer.MIN_VALUE;
	public Date cnPackRefBuyingdate;
	public String cnPackRefEstimate_num;
	public Date cnPackRefEstimate_contract_date;
	public int cnPackRefIs_reserv = Integer.MIN_VALUE;
	public String cnPackRefPurpose;
	public int cnPackRefIs_ksoe = Integer.MIN_VALUE;
	public int cnPackRefOver150 = Integer.MIN_VALUE;
	public int cnPackRefIs_new = Integer.MIN_VALUE;
	public int cnPackRefIs3phases = Integer.MIN_VALUE;
	public int cnPackRefAgree_changes = Integer.MIN_VALUE;
	public Date cnPackRefDate_end_order_spl;
	public int cnPackRefCopmany_protocol = Integer.MIN_VALUE;
	public int cnPackRefId_feature = Integer.MIN_VALUE;
	public int cnPackRefId_state = Integer.MIN_VALUE;
	public int cnPackRefId_bp = Integer.MIN_VALUE;
	public int cnPackRefId_parent = Integer.MIN_VALUE;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setIs_reg(int aValue){
		is_reg = aValue;
	}

	public int getIs_reg(){
		return is_reg;
	}

	public void setCustomeremail(String aValue){
		customeremail = aValue;
	}

	public String getCustomeremail(){
		return customeremail;
	}

	public void setPhone(String aValue){
		phone = aValue;
	}

	public String getPhone(){
		return phone;
	}

	public void setCustomertype(int aValue){
		customertype = aValue;
	}

	public int getCustomertype(){
		return customertype;
	}


	public void setSubsystemRefCode(int aValue){
		subsystemRefCode = aValue;
	}
	public int getSubsystemRefCode(){
		return subsystemRefCode;
	}

	public void setSubsystemRefName(String aValue){
		subsystemRefName = aValue;
	}
	public String getSubsystemRefName(){
		return subsystemRefName;
	}

	public void setCnPackRefCode(int aValue){
		cnPackRefCode = aValue;
	}
	public int getCnPackRefCode(){
		return cnPackRefCode;
	}

	public void setCnPackRefPackCode(int aValue){
		cnPackRefPackCode = aValue;
	}
	public int getCnPackRefPackCode(){
		return cnPackRefPackCode;
	}

	public void setCnPackRefName(String aValue){
		cnPackRefName = aValue;
	}
	public String getCnPackRefName(){
		return cnPackRefName;
	}

	public void setCnPackRefId_ren(int aValue){
		cnPackRefId_ren = aValue;
	}
	public int getCnPackRefId_ren(){
		return cnPackRefId_ren;
	}

	public void setCnPackRefRenName(String aValue){
		cnPackRefRenName = aValue;
	}
	public String getCnPackRefRenName(){
		return cnPackRefRenName;
	}

	public void setCnPackRefId_district(int aValue){
		cnPackRefId_district = aValue;
	}
	public int getCnPackRefId_district(){
		return cnPackRefId_district;
	}

	public void setCnPackRefDistrictName(String aValue){
		cnPackRefDistrictName = aValue;
	}
	public String getCnPackRefDistrictName(){
		return cnPackRefDistrictName;
	}

	public void setCnPackRefId_child_district(int aValue){
		cnPackRefId_child_district = aValue;
	}
	public int getCnPackRefId_child_district(){
		return cnPackRefId_child_district;
	}

	public void setCnPackRefChildDistrictName(String aValue){
		cnPackRefChildDistrictName = aValue;
	}
	public String getCnPackRefChildDistrictName(){
		return cnPackRefChildDistrictName;
	}

	public void setCnPackRefId_pack_status(int aValue){
		cnPackRefId_pack_status = aValue;
	}
	public int getCnPackRefId_pack_status(){
		return cnPackRefId_pack_status;
	}

	public void setCnPackRefStatusName(String aValue){
		cnPackRefStatusName = aValue;
	}
	public String getCnPackRefStatusName(){
		return cnPackRefStatusName;
	}

	public void setCnPackRefDescription(String aValue){
		cnPackRefDescription = aValue;
	}
	public String getCnPackRefDescription(){
		return cnPackRefDescription;
	}

	public void setCnPackRefPower(BigDecimal aValue){
		cnPackRefPower = aValue;
	}
	public BigDecimal getCnPackRefPower(){
		return cnPackRefPower;
	}

	public void setCnPackRefAddress(String aValue){
		cnPackRefAddress = aValue;
	}
	public String getCnPackRefAddress(){
		return cnPackRefAddress;
	}

	public void setCnPackRefAddress_jur(String aValue){
		cnPackRefAddress_jur = aValue;
	}
	public String getCnPackRefAddress_jur(){
		return cnPackRefAddress_jur;
	}

	public void setCnPackRefReg_num_cn_contract(String aValue){
		cnPackRefReg_num_cn_contract = aValue;
	}
	public String getCnPackRefReg_num_cn_contract(){
		return cnPackRefReg_num_cn_contract;
	}

	public void setCnPackRefDate_cn_contract(Date aValue){
		cnPackRefDate_cn_contract = aValue;
	}
	public Date getCnPackRefDate_cn_contract(){
		return cnPackRefDate_cn_contract;
	}

	public void setCnPackRefReg_num_spl_pp_contract(String aValue){
		cnPackRefReg_num_spl_pp_contract = aValue;
	}
	public String getCnPackRefReg_num_spl_pp_contract(){
		return cnPackRefReg_num_spl_pp_contract;
	}

	public void setCnPackRefDate_spl_pp_contract(Date aValue){
		cnPackRefDate_spl_pp_contract = aValue;
	}
	public Date getCnPackRefDate_spl_pp_contract(){
		return cnPackRefDate_spl_pp_contract;
	}

	public void setCnPackRefReg_num_tu_contract(String aValue){
		cnPackRefReg_num_tu_contract = aValue;
	}
	public String getCnPackRefReg_num_tu_contract(){
		return cnPackRefReg_num_tu_contract;
	}

	public void setCnPackRefDate_tu_contract(Date aValue){
		cnPackRefDate_tu_contract = aValue;
	}
	public Date getCnPackRefDate_tu_contract(){
		return cnPackRefDate_tu_contract;
	}

	public void setCnPackRefReg_num_tu_cr_contract(String aValue){
		cnPackRefReg_num_tu_cr_contract = aValue;
	}
	public String getCnPackRefReg_num_tu_cr_contract(){
		return cnPackRefReg_num_tu_cr_contract;
	}

	public void setCnPackRefDate_tu_cr_contract(Date aValue){
		cnPackRefDate_tu_cr_contract = aValue;
	}
	public Date getCnPackRefDate_tu_cr_contract(){
		return cnPackRefDate_tu_cr_contract;
	}

	public void setCnPackRefProject_num(String aValue){
		cnPackRefProject_num = aValue;
	}
	public String getCnPackRefProject_num(){
		return cnPackRefProject_num;
	}

	public void setCnPackRefProject_date(Date aValue){
		cnPackRefProject_date = aValue;
	}
	public Date getCnPackRefProject_date(){
		return cnPackRefProject_date;
	}

	public void setCnPackRefOver5(int aValue){
		cnPackRefOver5 = aValue;
	}
	public int getCnPackRefOver5(){
		return cnPackRefOver5;
	}

	public void setCnPackRefStatus(int aValue){
		cnPackRefStatus = aValue;
	}
	public int getCnPackRefStatus(){
		return cnPackRefStatus;
	}

	public void setCnPackRefLetter_num_customer(String aValue){
		cnPackRefLetter_num_customer = aValue;
	}
	public String getCnPackRefLetter_num_customer(){
		return cnPackRefLetter_num_customer;
	}

	public void setCnPackRefDate_letter_customer(Date aValue){
		cnPackRefDate_letter_customer = aValue;
	}
	public Date getCnPackRefDate_letter_customer(){
		return cnPackRefDate_letter_customer;
	}

	public void setCnPackRefLetter_num(String aValue){
		cnPackRefLetter_num = aValue;
	}
	public String getCnPackRefLetter_num(){
		return cnPackRefLetter_num;
	}

	public void setCnPackRefDate_letter(Date aValue){
		cnPackRefDate_letter = aValue;
	}
	public Date getCnPackRefDate_letter(){
		return cnPackRefDate_letter;
	}

	public void setCnPackRefReliability_class(String aValue){
		cnPackRefReliability_class = aValue;
	}
	public String getCnPackRefReliability_class(){
		return cnPackRefReliability_class;
	}

	public void setCnPackRefId_waiting_status(int aValue){
		cnPackRefId_waiting_status = aValue;
	}
	public int getCnPackRefId_waiting_status(){
		return cnPackRefId_waiting_status;
	}

	public void setCnPackRefWaitingStatus(String aValue){
		cnPackRefWaitingStatus = aValue;
	}
	public String getCnPackRefWaitingStatus(){
		return cnPackRefWaitingStatus;
	}

	public void setCnPackRefIs_payable(int aValue){
		cnPackRefIs_payable = aValue;
	}
	public int getCnPackRefIs_payable(){
		return cnPackRefIs_payable;
	}

	public void setCnPackRefWorksize(String aValue){
		cnPackRefWorksize = aValue;
	}
	public String getCnPackRefWorksize(){
		return cnPackRefWorksize;
	}

	public void setCnPackRefWork_inc_net(String aValue){
		cnPackRefWork_inc_net = aValue;
	}
	public String getCnPackRefWork_inc_net(){
		return cnPackRefWork_inc_net;
	}

	public void setCnPackRefBusiness_type(String aValue){
		cnPackRefBusiness_type = aValue;
	}
	public String getCnPackRefBusiness_type(){
		return cnPackRefBusiness_type;
	}

	public void setCnPackRefEstimateterm(int aValue){
		cnPackRefEstimateterm = aValue;
	}
	public int getCnPackRefEstimateterm(){
		return cnPackRefEstimateterm;
	}

	public void setCnPackRefEstimatedate(Date aValue){
		cnPackRefEstimatedate = aValue;
	}
	public Date getCnPackRefEstimatedate(){
		return cnPackRefEstimatedate;
	}

	public void setCnPackRefBuildingterm(int aValue){
		cnPackRefBuildingterm = aValue;
	}
	public int getCnPackRefBuildingterm(){
		return cnPackRefBuildingterm;
	}

	public void setCnPackRefBuildingdate(Date aValue){
		cnPackRefBuildingdate = aValue;
	}
	public Date getCnPackRefBuildingdate(){
		return cnPackRefBuildingdate;
	}

	public void setCnPackRefBuyingterm(int aValue){
		cnPackRefBuyingterm = aValue;
	}
	public int getCnPackRefBuyingterm(){
		return cnPackRefBuyingterm;
	}

	public void setCnPackRefBuyingdate(Date aValue){
		cnPackRefBuyingdate = aValue;
	}
	public Date getCnPackRefBuyingdate(){
		return cnPackRefBuyingdate;
	}

	public void setCnPackRefEstimate_num(String aValue){
		cnPackRefEstimate_num = aValue;
	}
	public String getCnPackRefEstimate_num(){
		return cnPackRefEstimate_num;
	}

	public void setCnPackRefEstimate_contract_date(Date aValue){
		cnPackRefEstimate_contract_date = aValue;
	}
	public Date getCnPackRefEstimate_contract_date(){
		return cnPackRefEstimate_contract_date;
	}

	public void setCnPackRefIs_reserv(int aValue){
		cnPackRefIs_reserv = aValue;
	}
	public int getCnPackRefIs_reserv(){
		return cnPackRefIs_reserv;
	}

	public void setCnPackRefPurpose(String aValue){
		cnPackRefPurpose = aValue;
	}
	public String getCnPackRefPurpose(){
		return cnPackRefPurpose;
	}

	public void setCnPackRefIs_ksoe(int aValue){
		cnPackRefIs_ksoe = aValue;
	}
	public int getCnPackRefIs_ksoe(){
		return cnPackRefIs_ksoe;
	}

	public void setCnPackRefOver150(int aValue){
		cnPackRefOver150 = aValue;
	}
	public int getCnPackRefOver150(){
		return cnPackRefOver150;
	}

	public void setCnPackRefIs_new(int aValue){
		cnPackRefIs_new = aValue;
	}
	public int getCnPackRefIs_new(){
		return cnPackRefIs_new;
	}

	public void setCnPackRefIs3phases(int aValue){
		cnPackRefIs3phases = aValue;
	}
	public int getCnPackRefIs3phases(){
		return cnPackRefIs3phases;
	}

	public void setCnPackRefAgree_changes(int aValue){
		cnPackRefAgree_changes = aValue;
	}
	public int getCnPackRefAgree_changes(){
		return cnPackRefAgree_changes;
	}

	public void setCnPackRefDate_end_order_spl(Date aValue){
		cnPackRefDate_end_order_spl = aValue;
	}
	public Date getCnPackRefDate_end_order_spl(){
		return cnPackRefDate_end_order_spl;
	}

	public void setCnPackRefCopmany_protocol(int aValue){
		cnPackRefCopmany_protocol = aValue;
	}
	public int getCnPackRefCopmany_protocol(){
		return cnPackRefCopmany_protocol;
	}

	public void setCnPackRefId_feature(int aValue){
		cnPackRefId_feature = aValue;
	}
	public int getCnPackRefId_feature(){
		return cnPackRefId_feature;
	}

	public void setCnPackRefId_state(int aValue){
		cnPackRefId_state = aValue;
	}
	public int getCnPackRefId_state(){
		return cnPackRefId_state;
	}

	public void setCnPackRefId_bp(int aValue){
		cnPackRefId_bp = aValue;
	}
	public int getCnPackRefId_bp(){
		return cnPackRefId_bp;
	}

	public void setCnPackRefId_parent(int aValue){
		cnPackRefId_parent = aValue;
	}
	public int getCnPackRefId_parent(){
		return cnPackRefId_parent;
	}



}