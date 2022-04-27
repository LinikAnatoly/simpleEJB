//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for CNPack;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

import com.ksoe.energynet.valueobject.references.CNSubsystemTypeRef;
import com.ksoe.netobjects.valueobject.references.ENLine04Ref;
import com.ksoe.netobjects.valueobject.references.ENLine10Ref;
import com.ksoe.netobjects.valueobject.references.ENLine150Ref;
import com.ksoe.netobjects.valueobject.references.ENLineCableRef;
import com.ksoe.netobjects.valueobject.references.ENSubstation04Ref;
import com.ksoe.netobjects.valueobject.references.ENSubstation150Ref;
import com.ksoe.netobjects.valueobject.references.ENTransformerRef;


@XmlRootElement(name = "CNPack")
@XmlAccessorType(XmlAccessType.FIELD)
public class CNPack implements Serializable {

	public static final int STATE_WINDOWS_OPERATOR_HOE = 1050001;
	public static final int STATE_WINDOWS_OPERATOR_RES = 2050001;

	public static final int HGES_ID_REN = 9;

	public int code = Integer.MIN_VALUE;
	public int packCode = Integer.MIN_VALUE;
	public String name;
	public int id_ren = Integer.MIN_VALUE;
	public String renName;
	public int id_district = Integer.MIN_VALUE;
	public String districtName;
	public int id_pack_status = Integer.MIN_VALUE;
	public String statusName;
	public String description;
	public BigDecimal power;
	public String address;
	public String address_jur;
	public String reg_num_cn_contract;
	public Date date_cn_contract;
	public String reg_num_spl_pp_contract;
	public Date date_spl_pp_contract;
	public String reg_num_tu_contract;
	public Date date_tu_contract;
	public String reg_num_tu_cr_contract;
	public Date date_tu_cr_contract;
	public String project_num;
	public Date project_date;
	public int over5 = Integer.MIN_VALUE;
	public int status = Integer.MIN_VALUE;
	public String letter_num_customer;
	public Date date_letter_customer;
	public String letter_num;
	public Date date_letter;
	public String reliability_class;
	public int id_waiting_status = Integer.MIN_VALUE;
	public String waitingStatus;
	public int is_payable = Integer.MIN_VALUE;
	public String worksize;
	public String work_inc_net;
	public String business_type;
	public int estimateterm = Integer.MIN_VALUE;
	public Date estimatedate;
	public int buildingterm = Integer.MIN_VALUE;
	public Date buildingdate;
	public int buyingterm = Integer.MIN_VALUE;
	public Date buyingdate;
	public String estimate_num;
	public Date estimate_contract_date;
	public int is_reserv = Integer.MIN_VALUE;
	public String purpose;
	public int is_ksoe = Integer.MIN_VALUE;
	public int over150 = Integer.MIN_VALUE;
	public int is_new = Integer.MIN_VALUE;
	public int is3phases = Integer.MIN_VALUE;

	public int id_feature = Integer.MIN_VALUE;

	public BigDecimal price;

	// œÓÎˇ ‰Îˇ ÒÓÁ‰‡ÌËˇ ‰‚ËÊÂÌËˇ Ô‡ÍÂÚ‡
	public int startState = Integer.MIN_VALUE;
	public String commentGen = null;
	public int userCode = 1005;

	// œÓÎˇ ‰Îˇ ÒÓÁ‰‡ÌËˇ “ÂıÌË˜ÂÒÍËı ”ÒÎÓ‚ËÈ
	public BigDecimal tension_point;
	public int baseStation = Integer.MIN_VALUE;
	public int isSea = Integer.MIN_VALUE;

	public CNSubsystemTypeRef subsystemRef = new CNSubsystemTypeRef();

	// —‚ˇÁ¸ Ò Ó·˙ÂÍÚ‡ÏË ˝ÌÂ„ÂÚËÍË ‰Îˇ ÒıÂÏ˚ ÌÓÏ‡Î¸ÌÓ„Ó ÂÊËÏ‡
	public ENLine04Ref airLine04Ref = new ENLine04Ref();
	public ENLineCableRef cableLine04Ref = new ENLineCableRef();
	public ENTransformerRef trRef = new ENTransformerRef();
	public ENSubstation04Ref s04Ref = new ENSubstation04Ref();
	public ENLine10Ref airLine10Ref = new ENLine10Ref();
	public ENLineCableRef cableLine10Ref = new ENLineCableRef();
	public ENSubstation150Ref s35Ref = new ENSubstation150Ref();
	public ENLine150Ref airLine150Ref = new ENLine150Ref();
	public ENLineCableRef cableLine150Ref = new ENLineCableRef();
	public ENSubstation150Ref s150Ref = new ENSubstation150Ref();

	// —‡ÈÚ œ≈–—ŒÕ¿À‹ÕŒ√Œ  ¿¡»Õ≈“¿
	public int is_reg = Integer.MIN_VALUE;
	public String customeremail;
	public String phone;

	public static final String tableName = "CNPACK";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "CNPACK.CODE";
	public static final String packCode_Attr = "packCode";
	public static final String packCode_Field = "PACKCODE";
	public static final String packCode_QFielld = "CNPACK.PACKCODE";
	public static final String name_Attr = "name";
	public static final String name_Field = "NAME";
	public static final String name_QFielld = "CNPACK.NAME";
	public static final String id_ren_Attr = "id_ren";
	public static final String id_ren_Field = "ID_REN";
	public static final String id_ren_QFielld = "CNPACK.ID_REN";
	public static final String renName_Attr = "renName";
	public static final String renName_Field = "RENNAME";
	public static final String renName_QFielld = "CNPACK.RENNAME";
	public static final String id_district_Attr = "id_district";
	public static final String id_district_Field = "ID_DISTRICT";
	public static final String id_district_QFielld = "CNPACK.ID_DISTRICT";
	public static final String districtName_Attr = "districtName";
	public static final String districtName_Field = "DISTRICTNAME";
	public static final String districtName_QFielld = "CNPACK.DISTRICTNAME";
	public static final String id_pack_status_Attr = "id_pack_status";
	public static final String id_pack_status_Field = "ID_PACK_STATUS";
	public static final String id_pack_status_QFielld = "CNPACK.ID_PACK_STATUS";
	public static final String statusName_Attr = "statusName";
	public static final String statusName_Field = "STATUSNAME";
	public static final String statusName_QFielld = "CNPACK.STATUSNAME";
	public static final String description_Attr = "description";
	public static final String description_Field = "DESCRIPTION";
	public static final String description_QFielld = "CNPACK.DESCRIPTION";
	public static final String power_Attr = "power";
	public static final String power_Field = "POWER";
	public static final String power_QFielld = "CNPACK.POWER";
	public static final String address_Attr = "address";
	public static final String address_Field = "ADDRESS";
	public static final String address_QFielld = "CNPACK.ADDRESS";
	public static final String address_jur_Attr = "address_jur";
	public static final String address_jur_Field = "ADDRESS_JUR";
	public static final String address_jur_QFielld = "CNPACK.ADDRESS_JUR";
	public static final String reg_num_cn_contract_Attr = "reg_num_cn_contract";
	public static final String reg_num_cn_contract_Field = "REG_NUM_CN_CONTRACT";
	public static final String reg_num_cn_contract_QFielld = "CNPACK.REG_NUM_CN_CONTRACT";
	public static final String date_cn_contract_Attr = "date_cn_contract";
	public static final String date_cn_contract_Field = "DATE_CN_CONTRACT";
	public static final String date_cn_contract_QFielld = "CNPACK.DATE_CN_CONTRACT";
	public static final String reg_num_spl_pp_contract_Attr = "reg_num_spl_pp_contract";
	public static final String reg_num_spl_pp_contract_Field = "REG_NUM_SPL_PP_CONTRACT";
	public static final String reg_num_spl_pp_contract_QFielld = "CNPACK.REG_NUM_SPL_PP_CONTRCT";
	public static final String date_spl_pp_contract_Attr = "date_spl_pp_contract";
	public static final String date_spl_pp_contract_Field = "DATE_SPL_PP_CONTRACT";
	public static final String date_spl_pp_contract_QFielld = "CNPACK.DATE_SPL_PP_CONTRACT";
	public static final String reg_num_tu_contract_Attr = "reg_num_tu_contract";
	public static final String reg_num_tu_contract_Field = "REG_NUM_TU_CONTRACT";
	public static final String reg_num_tu_contract_QFielld = "CNPACK.REG_NUM_TU_CONTRACT";
	public static final String date_tu_contract_Attr = "date_tu_contract";
	public static final String date_tu_contract_Field = "DATE_TU_CONTRACT";
	public static final String date_tu_contract_QFielld = "CNPACK.DATE_TU_CONTRACT";
	public static final String reg_num_tu_cr_contract_Attr = "reg_num_tu_cr_contract";
	public static final String reg_num_tu_cr_contract_Field = "REG_NUM_TU_CR_CONTRACT";
	public static final String reg_num_tu_cr_contract_QFielld = "CNPACK.REG_NUM_TU_CR_CONTRACT";
	public static final String date_tu_cr_contract_Attr = "date_tu_cr_contract";
	public static final String date_tu_cr_contract_Field = "DATE_TU_CR_CONTRACT";
	public static final String date_tu_cr_contract_QFielld = "CNPACK.DATE_TU_CR_CONTRACT";
	public static final String project_num_Attr = "project_num";
	public static final String project_num_Field = "PROJECT_NUM";
	public static final String project_num_QFielld = "CNPACK.PROJECT_NUM";
	public static final String project_date_Attr = "project_date";
	public static final String project_date_Field = "PROJECT_DATE";
	public static final String project_date_QFielld = "CNPACK.PROJECT_DATE";
	public static final String over5_Attr = "over5";
	public static final String over5_Field = "OVER5";
	public static final String over5_QFielld = "CNPACK.OVER5";
	public static final String status_Attr = "status";
	public static final String status_Field = "STATUS";
	public static final String status_QFielld = "CNPACK.STATUS";
	public static final String letter_num_customer_Attr = "letter_num_customer";
	public static final String letter_num_customer_Field = "LETTER_NUM_CUSTOMER";
	public static final String letter_num_customer_QFielld = "CNPACK.LETTER_NUM_CUSTOMER";
	public static final String date_letter_customer_Attr = "date_letter_customer";
	public static final String date_letter_customer_Field = "DATE_LETTER_CUSTOMER";
	public static final String date_letter_customer_QFielld = "CNPACK.DATE_LETTER_CUSTOMER";
	public static final String letter_num_Attr = "letter_num";
	public static final String letter_num_Field = "LETTER_NUM";
	public static final String letter_num_QFielld = "CNPACK.LETTER_NUM";
	public static final String date_letter_Attr = "date_letter";
	public static final String date_letter_Field = "DATE_LETTER";
	public static final String date_letter_QFielld = "CNPACK.DATE_LETTER";
	public static final String reliability_class_Attr = "reliability_class";
	public static final String reliability_class_Field = "RELIABILITY_CLASS";
	public static final String reliability_class_QFielld = "CNPACK.RELIABILITY_CLASS";
	public static final String id_waiting_status_Attr = "id_waiting_status";
	public static final String id_waiting_status_Field = "ID_WAITING_STATUS";
	public static final String id_waiting_status_QFielld = "CNPACK.ID_WAITING_STATUS";
	public static final String waitingStatus_Attr = "waitingStatus";
	public static final String waitingStatus_Field = "WAITINGSTATUS";
	public static final String waitingStatus_QFielld = "CNPACK.WAITINGSTATUS";
	public static final String is_payable_Attr = "is_payable";
	public static final String is_payable_Field = "IS_PAYABLE";
	public static final String is_payable_QFielld = "CNPACK.IS_PAYABLE";
	public static final String worksize_Attr = "worksize";
	public static final String worksize_Field = "WORKSIZE";
	public static final String worksize_QFielld = "CNPACK.WORKSIZE";
	public static final String work_inc_net_Attr = "work_inc_net";
	public static final String work_inc_net_Field = "WORK_INC_NET";
	public static final String work_inc_net_QFielld = "CNPACK.WORK_INC_NET";
	public static final String business_type_Attr = "business_type";
	public static final String business_type_Field = "BUSINESS_TYPE";
	public static final String business_type_QFielld = "CNPACK.BUSINESS_TYPE";
	public static final String estimateterm_Attr = "estimateterm";
	public static final String estimateterm_Field = "ESTIMATETERM";
	public static final String estimateterm_QFielld = "CNPACK.ESTIMATETERM";
	public static final String estimatedate_Attr = "estimatedate";
	public static final String estimatedate_Field = "ESTIMATEDATE";
	public static final String estimatedate_QFielld = "CNPACK.ESTIMATEDATE";
	public static final String buildingterm_Attr = "buildingterm";
	public static final String buildingterm_Field = "BUILDINGTERM";
	public static final String buildingterm_QFielld = "CNPACK.BUILDINGTERM";
	public static final String buildingdate_Attr = "buildingdate";
	public static final String buildingdate_Field = "BUILDINGDATE";
	public static final String buildingdate_QFielld = "CNPACK.BUILDINGDATE";
	public static final String buyingterm_Attr = "buyingterm";
	public static final String buyingterm_Field = "BUYINGTERM";
	public static final String buyingterm_QFielld = "CNPACK.BUYINGTERM";
	public static final String buyingdate_Attr = "buyingdate";
	public static final String buyingdate_Field = "BUYINGDATE";
	public static final String buyingdate_QFielld = "CNPACK.BUYINGDATE";
	public static final String estimate_num_Attr = "estimate_num";
	public static final String estimate_num_Field = "ESTIMATE_NUM";
	public static final String estimate_num_QFielld = "CNPACK.ESTIMATE_NUM";
	public static final String estimate_contract_date_Attr = "estimate_contract_date";
	public static final String estimate_contract_date_Field = "ESTIMATE_CONTRACT_DATE";
	public static final String estimate_contract_date_QFielld = "CNPACK.ESTIMATE_CONTRACT_DATE";
	public static final String is_reserv_Attr = "is_reserv";
	public static final String is_reserv_Field = "IS_RESERV";
	public static final String is_reserv_QFielld = "CNPACK.IS_RESERV";
	public static final String purpose_Attr = "purpose";
	public static final String purpose_Field = "PURPOSE";
	public static final String purpose_QFielld = "CNPACK.PURPOSE";
	public static final String is_ksoe_Attr = "is_ksoe";
	public static final String is_ksoe_Field = "IS_KSOE";
	public static final String is_ksoe_QFielld = "CNPACK.IS_KSOE";
	public static final String over150_Attr = "over150";
	public static final String over150_Field = "OVER150";
	public static final String over150_QFielld = "CNPACK.OVER150";
	public static final String is_new_Attr = "is_new";
	public static final String is_new_Field = "IS_NEW";
	public static final String is_new_QFielld = "CNPACK.IS_NEW";
	public static final String is3phases_Attr = "is3phases";
	public static final String is3phases_Field = "IS3PHASES";
	public static final String is3phases_QFielld = "CNPACK.IS3PHASES";
	public static final String subsystemRef_Attr = "subsystemRef";
	public static final String subsystemRef_Field = "SUBSYSTEMREFCODE";
	public static final String subsystemRef_QFielld = "CNPACK.SUBSYSTEMREFCODE";
	public static final String airLine04Ref_Attr = "airLine04Ref";
	public static final String airLine04Ref_Field = "AIRLINE04REFCODE";
	public static final String airLine04Ref_QFielld = "CNPACK.AIRLINE04REFCODE";
	public static final String cableLine04Ref_Attr = "cableLine04Ref";
	public static final String cableLine04Ref_Field = "CABLELINE04REFCODE";
	public static final String cableLine04Ref_QFielld = "CNPACK.CABLELINE04REFCODE";
	public static final String trRef_Attr = "trRef";
	public static final String trRef_Field = "TRREFCODE";
	public static final String trRef_QFielld = "CNPACK.TRREFCODE";
	public static final String s04Ref_Attr = "s04Ref";
	public static final String s04Ref_Field = "S04REFCODE";
	public static final String s04Ref_QFielld = "CNPACK.S04REFCODE";
	public static final String airLine10Ref_Attr = "airLine10Ref";
	public static final String airLine10Ref_Field = "AIRLINE10REFCODE";
	public static final String airLine10Ref_QFielld = "CNPACK.AIRLINE10REFCODE";
	public static final String cableLine10Ref_Attr = "cableLine10Ref";
	public static final String cableLine10Ref_Field = "CABLELINE10REFCODE";
	public static final String cableLine10Ref_QFielld = "CNPACK.CABLELINE10REFCODE";
	public static final String s35Ref_Attr = "s35Ref";
	public static final String s35Ref_Field = "S35REFCODE";
	public static final String s35Ref_QFielld = "CNPACK.S35REFCODE";
	public static final String airLine150Ref_Attr = "airLine150Ref";
	public static final String airLine150Ref_Field = "AIRLINE150REFCODE";
	public static final String airLine150Ref_QFielld = "CNPACK.AIRLINE150REFCODE";
	public static final String cableLine150Ref_Attr = "cableLine150Ref";
	public static final String cableLine150Ref_Field = "cableLine150REFCD";
	public static final String cableLine150Ref_QFielld = "CNPACK.cableLine150REFCD";
	public static final String s150Ref_Attr = "s150Ref";
	public static final String s150Ref_Field = "S150REFCODE";
	public static final String s150Ref_QFielld = "CNPACK.S150REFCODE";

	// —‡ÈÚ œ≈–—ŒÕ¿À‹ÕŒ√Œ  ¿¡»Õ≈“¿
	public static final String is_reg_Attr = "is_reg";
	public static final String is_reg_Field = "IS_REG";
	public static final String is_reg_QFielld = "CNPACK2SITE.IS_REG";
	public static final String customeremail_Attr = "customeremail";
	public static final String customeremail_Field = "CUSTOMEREMAIL";
	public static final String customeremail_QFielld = "CNPACK2SITE.CUSTOMEREMAIL";
	public static final String phone_Attr = "phone";
	public static final String phone_Field = "PHONE";
	public static final String phone_QFielld = "CNPACK2SITE.PHONE";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setPackCode(int aValue) {
		packCode = aValue;
	}

	public int getPackCode() {
		return packCode;
	}

	public void setName(String aValue) {
		name = aValue;
	}

	public String getName() {
		return name;
	}

	public void setId_ren(int aValue) {
		id_ren = aValue;
	}

	public int getId_ren() {
		return id_ren;
	}

	public void setRenName(String aValue) {
		renName = aValue;
	}

	public String getRenName() {
		return renName;
	}

	public void setId_district(int aValue) {
		id_district = aValue;
	}

	public int getId_district() {
		return id_district;
	}

	public void setDistrictName(String aValue) {
		districtName = aValue;
	}

	public String getDistrictName() {
		return districtName;
	}

	public void setId_pack_status(int aValue) {
		id_pack_status = aValue;
	}

	public int getId_pack_status() {
		return id_pack_status;
	}

	public void setStatusName(String aValue) {
		statusName = aValue;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setDescription(String aValue) {
		description = aValue;
	}

	public String getDescription() {
		return description;
	}

	public void setPower(BigDecimal aValue) {
		power = aValue;
	}

	public BigDecimal getPower() {
		return power;
	}

	public void setAddress(String aValue) {
		address = aValue;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress_jur(String aValue) {
		address_jur = aValue;
	}

	public String getAddress_jur() {
		return address_jur;
	}

	public void setReg_num_cn_contract(String aValue) {
		reg_num_cn_contract = aValue;
	}

	public String getReg_num_cn_contract() {
		return reg_num_cn_contract;
	}

	public void setDate_cn_contract(Date aValue) {
		date_cn_contract = aValue;
	}

	public Date getDate_cn_contract() {
		return date_cn_contract;
	}

	public void setReg_num_spl_pp_contract(String aValue) {
		reg_num_spl_pp_contract = aValue;
	}

	public String getReg_num_spl_pp_contract() {
		return reg_num_spl_pp_contract;
	}

	public void setDate_spl_pp_contract(Date aValue) {
		date_spl_pp_contract = aValue;
	}

	public Date getDate_spl_pp_contract() {
		return date_spl_pp_contract;
	}

	public void setReg_num_tu_contract(String aValue) {
		reg_num_tu_contract = aValue;
	}

	public String getReg_num_tu_contract() {
		return reg_num_tu_contract;
	}

	public void setDate_tu_contract(Date aValue) {
		date_tu_contract = aValue;
	}

	public Date getDate_tu_contract() {
		return date_tu_contract;
	}

	public void setReg_num_tu_cr_contract(String aValue) {
		reg_num_tu_cr_contract = aValue;
	}

	public String getReg_num_tu_cr_contract() {
		return reg_num_tu_cr_contract;
	}

	public void setDate_tu_cr_contract(Date aValue) {
		date_tu_cr_contract = aValue;
	}

	public Date getDate_tu_cr_contract() {
		return date_tu_cr_contract;
	}

	public void setProject_num(String aValue) {
		project_num = aValue;
	}

	public String getProject_num() {
		return project_num;
	}

	public void setProject_date(Date aValue) {
		project_date = aValue;
	}

	public Date getProject_date() {
		return project_date;
	}

	public void setOver5(int aValue) {
		over5 = aValue;
	}

	public int getOver5() {
		return over5;
	}

	public void setStatus(int aValue) {
		status = aValue;
	}

	public int getStatus() {
		return status;
	}

	public void setLetter_num_customer(String aValue) {
		letter_num_customer = aValue;
	}

	public String getLetter_num_customer() {
		return letter_num_customer;
	}

	public void setDate_letter_customer(Date aValue) {
		date_letter_customer = aValue;
	}

	public Date getDate_letter_customer() {
		return date_letter_customer;
	}

	public void setLetter_num(String aValue) {
		letter_num = aValue;
	}

	public String getLetter_num() {
		return letter_num;
	}

	public void setDate_letter(Date aValue) {
		date_letter = aValue;
	}

	public Date getDate_letter() {
		return date_letter;
	}

	public void setReliability_class(String aValue) {
		reliability_class = aValue;
	}

	public String getReliability_class() {
		return reliability_class;
	}

	public void setId_waiting_status(int aValue) {
		id_waiting_status = aValue;
	}

	public int getId_waiting_status() {
		return id_waiting_status;
	}

	public void setWaitingStatus(String aValue) {
		waitingStatus = aValue;
	}

	public String getWaitingStatus() {
		return waitingStatus;
	}

	public void setIs_payable(int aValue) {
		is_payable = aValue;
	}

	public int getIs_payable() {
		return is_payable;
	}

	public void setWorksize(String aValue) {
		worksize = aValue;
	}

	public String getWorksize() {
		return worksize;
	}

	public void setWork_inc_net(String aValue) {
		work_inc_net = aValue;
	}

	public String getWork_inc_net() {
		return work_inc_net;
	}

	public void setBusiness_type(String aValue) {
		business_type = aValue;
	}

	public String getBusiness_type() {
		return business_type;
	}

	public void setEstimateterm(int aValue) {
		estimateterm = aValue;
	}

	public int getEstimateterm() {
		return estimateterm;
	}

	public void setEstimatedate(Date aValue) {
		estimatedate = aValue;
	}

	public Date getEstimatedate() {
		return estimatedate;
	}

	public void setBuildingterm(int aValue) {
		buildingterm = aValue;
	}

	public int getBuildingterm() {
		return buildingterm;
	}

	public void setBuildingdate(Date aValue) {
		buildingdate = aValue;
	}

	public Date getBuildingdate() {
		return buildingdate;
	}

	public void setBuyingterm(int aValue) {
		buyingterm = aValue;
	}

	public int getBuyingterm() {
		return buyingterm;
	}

	public void setBuyingdate(Date aValue) {
		buyingdate = aValue;
	}

	public Date getBuyingdate() {
		return buyingdate;
	}

	public void setEstimate_num(String aValue) {
		estimate_num = aValue;
	}

	public String getEstimate_num() {
		return estimate_num;
	}

	public void setEstimate_contract_date(Date aValue) {
		estimate_contract_date = aValue;
	}

	public Date getEstimate_contract_date() {
		return estimate_contract_date;
	}

	public void setIs_reserv(int aValue) {
		is_reserv = aValue;
	}

	public int getIs_reserv() {
		return is_reserv;
	}

	public void setPurpose(String aValue) {
		purpose = aValue;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setIs_ksoe(int aValue) {
		is_ksoe = aValue;
	}

	public int getIs_ksoe() {
		return is_ksoe;
	}

	public void setOver150(int aValue) {
		over150 = aValue;
	}

	public int getOver150() {
		return over150;
	}

	public void setIs_new(int aValue) {
		is_new = aValue;
	}

	public int getIs_new() {
		return is_new;
	}

	public void setIs3phases(int aValue) {
		is3phases = aValue;
	}

	public int getIs3phases() {
		return is3phases;
	}

	public void setSubsystemRef(CNSubsystemTypeRef aValue) {
		subsystemRef = aValue;
	}

	public CNSubsystemTypeRef getSubsystemRef() {
		return subsystemRef;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getCommentGen() {
		return commentGen;
	}

	public void setCommentGen(String commentGen) {
		this.commentGen = commentGen;
	}

	public int getStartState() {
		return startState;
	}

	public void setStartState(int startState) {
		this.startState = startState;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public int getBaseStation() {
		return baseStation;
	}

	public void setBaseStation(int baseStation) {
		this.baseStation = baseStation;
	}

	public BigDecimal getTension_point() {
		return tension_point;
	}

	public void setTension_point(BigDecimal tension_point) {
		this.tension_point = tension_point;
	}

	public int getIsSea() {
		return isSea;
	}

	public void setIsSea(int isSea) {
		this.isSea = isSea;
	}

	public void setAirLine04Ref(ENLine04Ref aValue) {
		airLine04Ref = aValue;
	}

	public ENLine04Ref getAirLine04Ref() {
		return airLine04Ref;
	}

	public void setCableLine04Ref(ENLineCableRef aValue) {
		cableLine04Ref = aValue;
	}

	public ENLineCableRef getCableLine04Ref() {
		return cableLine04Ref;
	}

	public void setTrRef(ENTransformerRef aValue) {
		trRef = aValue;
	}

	public ENTransformerRef getTrRef() {
		return trRef;
	}

	public void setS04Ref(ENSubstation04Ref aValue) {
		s04Ref = aValue;
	}

	public ENSubstation04Ref getS04Ref() {
		return s04Ref;
	}

	public void setAirLine10Ref(ENLine10Ref aValue) {
		airLine10Ref = aValue;
	}

	public ENLine10Ref getAirLine10Ref() {
		return airLine10Ref;
	}

	public void setCableLine10Ref(ENLineCableRef aValue) {
		cableLine10Ref = aValue;
	}

	public ENLineCableRef getCableLine10Ref() {
		return cableLine10Ref;
	}

	public void setS35Ref(ENSubstation150Ref aValue) {
		s35Ref = aValue;
	}

	public ENSubstation150Ref getS35Ref() {
		return s35Ref;
	}

	public void setAirLine150Ref(ENLine150Ref aValue) {
		airLine150Ref = aValue;
	}

	public ENLine150Ref getAirLine150Ref() {
		return airLine150Ref;
	}

	public void setcableLine150Ref(ENLineCableRef aValue) {
		cableLine150Ref = aValue;
	}

	public ENLineCableRef getcableLine150Ref() {
		return cableLine150Ref;
	}

	public void setS150Ref(ENSubstation150Ref aValue) {
		s150Ref = aValue;
	}

	public ENSubstation150Ref getS150Ref() {
		return s150Ref;
	}

	public int getId_feature() {
		return id_feature;
	}

	public void setId_feature(int id_feature) {
		this.id_feature = id_feature;
	}

	// —‡ÈÚ œ≈–—ŒÕ¿À‹ÕŒ√Œ  ¿¡»Õ≈“¿
	public void setIs_reg(int aValue) {
		is_reg = aValue;
	}

	public int getIs_reg() {
		return is_reg;
	}

	public void setCustomeremail(String aValue) {
		customeremail = aValue;
	}

	public String getCustomeremail() {
		return customeremail;
	}

	public void setPhone(String aValue) {
		phone = aValue;
	}

	public String getPhone() {
		return phone;
	}
} // end of CNPackValueObject