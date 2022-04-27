//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENFuelSheetVolumesItem;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENFuelSheetVolumesRef;

public class ENFuelSheetVolumesItem implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String depname;
	public BigDecimal pmm_count_on_start;
	public BigDecimal pmm_count_on_start_all;
	public BigDecimal services_plan;
	public BigDecimal services_fact;
	public BigDecimal services_limit;
	public BigDecimal current_repair_plan;
	public BigDecimal current_repair_fact;
	public BigDecimal capital_repair_plan;
	public BigDecimal capital_repair_fact;
	public BigDecimal maintenance_plan;
	public BigDecimal maintenance_fact;
	public BigDecimal sbyt_plan;
	public BigDecimal sbyt_fact;
	public BigDecimal other_plan;
	public BigDecimal other_fact;
	public BigDecimal maintenance_sbyt_repairs_and_other_limit;
	public BigDecimal cap_build_ip_plan;
	public BigDecimal cap_build_ip_fact;
	public BigDecimal cap_builders_ip_limit;
	public BigDecimal cap_build_other_plan;
	public BigDecimal cap_build_other_fact;
	public BigDecimal cap_builders_other_limit;
	public BigDecimal vrtu_plan;
	public BigDecimal vrtu_fact;
	public BigDecimal vrtu_limit;
	public BigDecimal avr_plan;
	public BigDecimal avr_fact;
	public BigDecimal avr_limit;
	public BigDecimal odg_plan;
	public BigDecimal odg_fact;
	public BigDecimal all_limit;
	public String decode;
	public String mol_codes;
	public Date datestart;
	public Date datefinal;
	public int ord = Integer.MIN_VALUE;
	public BigDecimal all_plan;
    public BigDecimal rest_from_fk;
    public BigDecimal rest_from_fk_avz;
    public int  eikindcode = Integer.MIN_VALUE;
	public String userGen;
	public Date dateEdit;
	public long modify_time = Long.MIN_VALUE;
	public ENFuelSheetVolumesRef sheetVolumesRef = new ENFuelSheetVolumesRef();
	public static final String tableName = "ENFUELSHEETVOLUMESITEM";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENFUELSHEETVOLUMESITEM.CODE";
	public static final String depname_Attr = "depname";
	public static final String depname_Field = "DEPNAME";
	public static final String depname_QFielld = "ENFUELSHEETVOLUMESITEM.DEPNAME";
	public static final String pmm_count_on_start_Attr = "pmm_count_on_start";
	public static final String pmm_count_on_start_Field = "PMM_COUNT_ON_START";
	public static final String pmm_count_on_start_QFielld = "ENFUELSHEETVOLUMESITEM.PMM_COUNT_ON_START";
	public static final String pmm_count_on_start_all_Attr = "pmm_count_on_start_all";
	public static final String pmm_count_on_start_all_Field = "PMM_COUNT_ON_START_ALL";
	public static final String pmm_count_on_start_all_QFielld = "ENFUELSHEETVOLUMESITEM.PMM_COUNT_ON_START_ALL";
	public static final String services_plan_Attr = "services_plan";
	public static final String services_plan_Field = "SERVICES_PLAN";
	public static final String services_plan_QFielld = "ENFUELSHEETVOLUMESITEM.SERVICES_PLAN";
	public static final String services_fact_Attr = "services_fact";
	public static final String services_fact_Field = "SERVICES_FACT";
	public static final String services_fact_QFielld = "ENFUELSHEETVOLUMESITEM.SERVICES_FACT";
	public static final String services_limit_Attr = "services_limit";
	public static final String services_limit_Field = "SERVICES_LIMIT";
	public static final String services_limit_QFielld = "ENFUELSHEETVOLUMESITEM.SERVICES_LIMIT";
	public static final String current_repair_plan_Attr = "current_repair_plan";
	public static final String current_repair_plan_Field = "CURRENT_REPAIR_PLAN";
	public static final String current_repair_plan_QFielld = "ENFUELSHEETVOLUMESITEM.CURRENT_REPAIR_PLAN";
	public static final String current_repair_fact_Attr = "current_repair_fact";
	public static final String current_repair_fact_Field = "CURRENT_REPAIR_FACT";
	public static final String current_repair_fact_QFielld = "ENFUELSHEETVOLUMESITEM.CURRENT_REPAIR_FACT";
	public static final String capital_repair_plan_Attr = "capital_repair_plan";
	public static final String capital_repair_plan_Field = "CAPITAL_REPAIR_PLAN";
	public static final String capital_repair_plan_QFielld = "ENFUELSHEETVOLUMESITEM.CAPITAL_REPAIR_PLAN";
	public static final String capital_repair_fact_Attr = "capital_repair_fact";
	public static final String capital_repair_fact_Field = "CAPITAL_REPAIR_FACT";
	public static final String capital_repair_fact_QFielld = "ENFUELSHEETVOLUMESITEM.CAPITAL_REPAIR_FACT";
	public static final String maintenance_plan_Attr = "maintenance_plan";
	public static final String maintenance_plan_Field = "MAINTENANCE_PLAN";
	public static final String maintenance_plan_QFielld = "ENFUELSHEETVOLUMESITEM.MAINTENANCE_PLAN";
	public static final String maintenance_fact_Attr = "maintenance_fact";
	public static final String maintenance_fact_Field = "MAINTENANCE_FACT";
	public static final String maintenance_fact_QFielld = "ENFUELSHEETVOLUMESITEM.MAINTENANCE_FACT";
	public static final String sbyt_plan_Attr = "sbyt_plan";
	public static final String sbyt_plan_Field = "SBYT_PLAN";
	public static final String sbyt_plan_QFielld = "ENFUELSHEETVOLUMESITEM.SBYT_PLAN";
	public static final String sbyt_fact_Attr = "sbyt_fact";
	public static final String sbyt_fact_Field = "SBYT_FACT";
	public static final String sbyt_fact_QFielld = "ENFUELSHEETVOLUMESITEM.SBYT_FACT";
	public static final String other_plan_Attr = "other_plan";
	public static final String other_plan_Field = "OTHER_PLAN";
	public static final String other_plan_QFielld = "ENFUELSHEETVOLUMESITEM.OTHER_PLAN";
	public static final String other_fact_Attr = "other_fact";
	public static final String other_fact_Field = "OTHER_FACT";
	public static final String other_fact_QFielld = "ENFUELSHEETVOLUMESITEM.OTHER_FACT";
	public static final String maintenance_sbyt_repairs_and_other_limit_Attr = "maintenance_sbyt_repairs_and_other_limit";
	public static final String maintenance_sbyt_repairs_and_other_limit_Field = "MAINTENANCE_SBYT_REPAIRS_AND_OTHER_LIMIT";
	public static final String maintenance_sbyt_repairs_and_other_limit_QFielld = "ENFUELSHEETVOLUMESITEM.MAINTENANCE_SBYT_REPAIRS_AND_OTHER_LIMIT";
	public static final String cap_build_ip_plan_Attr = "cap_build_ip_plan";
	public static final String cap_build_ip_plan_Field = "CAP_BUILD_IP_PLAN";
	public static final String cap_build_ip_plan_QFielld = "ENFUELSHEETVOLUMESITEM.CAP_BUILD_IP_PLAN";
	public static final String cap_build_ip_fact_Attr = "cap_build_ip_fact";
	public static final String cap_build_ip_fact_Field = "CAP_BUILD_IP_FACT";
	public static final String cap_build_ip_fact_QFielld = "ENFUELSHEETVOLUMESITEM.CAP_BUILD_IP_FACT";
	public static final String cap_builders_ip_limit_Attr = "cap_builders_ip_limit";
	public static final String cap_builders_ip_limit_Field = "CAP_BUILDERS_IP_LIMIT";
	public static final String cap_builders_ip_limit_QFielld = "ENFUELSHEETVOLUMESITEM.CAP_BUILDERS_IP_LIMIT";
	public static final String cap_build_other_plan_Attr = "cap_build_other_plan";
	public static final String cap_build_other_plan_Field = "CAP_BUILD_OTHER_PLAN";
	public static final String cap_build_other_plan_QFielld = "ENFUELSHEETVOLUMESITEM.CAP_BUILD_OTHER_PLAN";
	public static final String cap_build_other_fact_Attr = "cap_build_other_fact";
	public static final String cap_build_other_fact_Field = "CAP_BUILD_OTHER_FACT";
	public static final String cap_build_other_fact_QFielld = "ENFUELSHEETVOLUMESITEM.CAP_BUILD_OTHER_FACT";
	public static final String cap_builders_other_limit_Attr = "cap_builders_other_limit";
	public static final String cap_builders_other_limit_Field = "CAP_BUILDERS_OTHER_LIMIT";
	public static final String cap_builders_other_limit_QFielld = "ENFUELSHEETVOLUMESITEM.CAP_BUILDERS_OTHER_LIMIT";
	public static final String vrtu_plan_Attr = "vrtu_plan";
	public static final String vrtu_plan_Field = "VRTU_PLAN";
	public static final String vrtu_plan_QFielld = "ENFUELSHEETVOLUMESITEM.VRTU_PLAN";
	public static final String vrtu_fact_Attr = "vrtu_fact";
	public static final String vrtu_fact_Field = "VRTU_FACT";
	public static final String vrtu_fact_QFielld = "ENFUELSHEETVOLUMESITEM.VRTU_FACT";
	public static final String vrtu_limit_Attr = "vrtu_limit";
	public static final String vrtu_limit_Field = "VRTU_LIMIT";
	public static final String vrtu_limit_QFielld = "ENFUELSHEETVOLUMESITEM.VRTU_LIMIT";
	public static final String avr_plan_Attr = "avr_plan";
	public static final String avr_plan_Field = "AVR_PLAN";
	public static final String avr_plan_QFielld = "ENFUELSHEETVOLUMESITEM.AVR_PLAN";
	public static final String avr_fact_Attr = "avr_fact";
	public static final String avr_fact_Field = "AVR_FACT";
	public static final String avr_fact_QFielld = "ENFUELSHEETVOLUMESITEM.AVR_FACT";
	public static final String avr_limit_Attr = "avr_limit";
	public static final String avr_limit_Field = "AVR_LIMIT";
	public static final String avr_limit_QFielld = "ENFUELSHEETVOLUMESITEM.AVR_LIMIT";
	public static final String odg_plan_Attr = "odg_plan";
	public static final String odg_plan_Field = "ODG_PLAN";
	public static final String odg_plan_QFielld = "ENFUELSHEETVOLUMESITEM.ODG_PLAN";
	public static final String odg_fact_Attr = "odg_fact";
	public static final String odg_fact_Field = "ODG_FACT";
	public static final String odg_fact_QFielld = "ENFUELSHEETVOLUMESITEM.ODG_FACT";
	public static final String all_limit_Attr = "all_limit";
	public static final String all_limit_Field = "ALL_LIMIT";
	public static final String all_limit_QFielld = "ENFUELSHEETVOLUMESITEM.ALL_LIMIT";
	public static final String decode_Attr = "decode";
	public static final String decode_Field = "DECODE";
	public static final String decode_QFielld = "ENFUELSHEETVOLUMESITEM.DECODE";
	public static final String mol_codes_Attr = "mol_codes";
	public static final String mol_codes_Field = "MOL_CODES";
	public static final String mol_codes_QFielld = "ENFUELSHEETVOLUMESITEM.MOL_CODES";
	public static final String datestart_Attr = "datestart";
	public static final String datestart_Field = "DATESTART";
	public static final String datestart_QFielld = "ENFUELSHEETVOLUMESITEM.DATESTART";
	public static final String datefinal_Attr = "datefinal";
	public static final String datefinal_Field = "DATEFINAL";
	public static final String datefinal_QFielld = "ENFUELSHEETVOLUMESITEM.DATEFINAL";
	public static final String ord_Attr = "ord";
	public static final String ord_Field = "ORD";
	public static final String ord_QFielld = "ENFUELSHEETVOLUMESITEM.ORD";
	public static final String all_plan_Attr = "all_plan";
	public static final String all_plan_Field = "ALL_PLAN";
	public static final String all_plan_QFielld = "ENFUELSHEETVOLUMESITEM.ALL_PLAN";
    public static final String rest_from_fk_Attr = "rest_from_fk";
    public static final String rest_from_fk_Field = "REST_FROM_FK";
    public static final String rest_from_fk_QFielld = "ENFUELSHEETVOLUMESITEM.REST_FROM_FK";
    public static final String rest_from_fk_avz_Attr = "rest_from_fk_avz";
    public static final String rest_from_fk_avz_Field = "REST_FROM_FK_AVZ";
    public static final String rest_from_fk_avz_QFielld = "ENFUELSHEETVOLUMESITEM.REST_FROM_FK_AVZ";
    public static final String eikindcode_Attr = "eikindcode";
    public static final String eikindcode_Field = "EIKINDCODE";
    public static final String eikindcode_QFielld = "ENFUELSHEETVOLUMESITEM.EIKINDCODE";
    public static final String userGen_Attr = "userGen";
	public static final String userGen_Field = "USERGEN";
	public static final String userGen_QFielld = "ENFUELSHEETVOLUMESITEM.USERGEN";
	public static final String dateEdit_Attr = "dateEdit";
	public static final String dateEdit_Field = "DATEEDIT";
	public static final String dateEdit_QFielld = "ENFUELSHEETVOLUMESITEM.DATEEDIT";
	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "ENFUELSHEETVOLUMESITEM.MODIFY_TIME";
	public static final String sheetVolumesRef_Attr = "sheetVolumesRef";
	public static final String sheetVolumesRef_Field = "SHEETVOLUMESREFCODE";
	public static final String sheetVolumesRef_QFielld = "ENFUELSHEETVOLUMESITEM.SHEETVOLUMESREFCODE";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setDepname(String aValue) {
		depname = aValue;
	}

	public String getDepname() {
		return depname;
	}

	public void setPmm_count_on_start(BigDecimal aValue) {
		pmm_count_on_start = aValue;
	}

	public BigDecimal getPmm_count_on_start() {
		return pmm_count_on_start;
	}

	public void setPmm_count_on_start_all(BigDecimal aValue) {
		pmm_count_on_start_all = aValue;
	}

	public BigDecimal getPmm_count_on_start_all() {
		return pmm_count_on_start_all;
	}

	public void setServices_plan(BigDecimal aValue) {
		services_plan = aValue;
	}

	public BigDecimal getServices_plan() {
		return services_plan;
	}

	public void setServices_fact(BigDecimal aValue) {
		services_fact = aValue;
	}

	public BigDecimal getServices_fact() {
		return services_fact;
	}

	public void setServices_limit(BigDecimal aValue) {
		services_limit = aValue;
	}

	public BigDecimal getServices_limit() {
		return services_limit;
	}

	public void setCurrent_repair_plan(BigDecimal aValue) {
		current_repair_plan = aValue;
	}

	public BigDecimal getCurrent_repair_plan() {
		return current_repair_plan;
	}

	public void setCurrent_repair_fact(BigDecimal aValue) {
		current_repair_fact = aValue;
	}

	public BigDecimal getCurrent_repair_fact() {
		return current_repair_fact;
	}

	public void setCapital_repair_plan(BigDecimal aValue) {
		capital_repair_plan = aValue;
	}

	public BigDecimal getCapital_repair_plan() {
		return capital_repair_plan;
	}

	public void setCapital_repair_fact(BigDecimal aValue) {
		capital_repair_fact = aValue;
	}

	public BigDecimal getCapital_repair_fact() {
		return capital_repair_fact;
	}

	public void setMaintenance_plan(BigDecimal aValue) {
		maintenance_plan = aValue;
	}

	public BigDecimal getMaintenance_plan() {
		return maintenance_plan;
	}

	public void setMaintenance_fact(BigDecimal aValue) {
		maintenance_fact = aValue;
	}

	public BigDecimal getMaintenance_fact() {
		return maintenance_fact;
	}

	public void setSbyt_plan(BigDecimal aValue) {
		sbyt_plan = aValue;
	}

	public BigDecimal getSbyt_plan() {
		return sbyt_plan;
	}

	public void setSbyt_fact(BigDecimal aValue) {
		sbyt_fact = aValue;
	}

	public BigDecimal getSbyt_fact() {
		return sbyt_fact;
	}

	public void setOther_plan(BigDecimal aValue) {
		other_plan = aValue;
	}

	public BigDecimal getOther_plan() {
		return other_plan;
	}

	public void setOther_fact(BigDecimal aValue) {
		other_fact = aValue;
	}

	public BigDecimal getOther_fact() {
		return other_fact;
	}

	public void setMaintenance_sbyt_repairs_and_other_limit(BigDecimal aValue) {
		maintenance_sbyt_repairs_and_other_limit = aValue;
	}

	public BigDecimal getMaintenance_sbyt_repairs_and_other_limit() {
		return maintenance_sbyt_repairs_and_other_limit;
	}

	public void setCap_build_ip_plan(BigDecimal aValue) {
		cap_build_ip_plan = aValue;
	}

	public BigDecimal getCap_build_ip_plan() {
		return cap_build_ip_plan;
	}

	public void setCap_build_ip_fact(BigDecimal aValue) {
		cap_build_ip_fact = aValue;
	}

	public BigDecimal getCap_build_ip_fact() {
		return cap_build_ip_fact;
	}

	public void setCap_builders_ip_limit(BigDecimal aValue) {
		cap_builders_ip_limit = aValue;
	}

	public BigDecimal getCap_builders_ip_limit() {
		return cap_builders_ip_limit;
	}

	public void setCap_build_other_plan(BigDecimal aValue) {
		cap_build_other_plan = aValue;
	}

	public BigDecimal getCap_build_other_plan() {
		return cap_build_other_plan;
	}

	public void setCap_build_other_fact(BigDecimal aValue) {
		cap_build_other_fact = aValue;
	}

	public BigDecimal getCap_build_other_fact() {
		return cap_build_other_fact;
	}

	public void setCap_builders_other_limit(BigDecimal aValue) {
		cap_builders_other_limit = aValue;
	}

	public BigDecimal getCap_builders_other_limit() {
		return cap_builders_other_limit;
	}

	public void setVrtu_plan(BigDecimal aValue) {
		vrtu_plan = aValue;
	}

	public BigDecimal getVrtu_plan() {
		return vrtu_plan;
	}

	public void setVrtu_fact(BigDecimal aValue) {
		vrtu_fact = aValue;
	}

	public BigDecimal getVrtu_fact() {
		return vrtu_fact;
	}

	public void setVrtu_limit(BigDecimal aValue) {
		vrtu_limit = aValue;
	}

	public BigDecimal getVrtu_limit() {
		return vrtu_limit;
	}

	public void setAvr_plan(BigDecimal aValue) {
		avr_plan = aValue;
	}

	public BigDecimal getAvr_plan() {
		return avr_plan;
	}

	public void setAvr_fact(BigDecimal aValue) {
		avr_fact = aValue;
	}

	public BigDecimal getAvr_fact() {
		return avr_fact;
	}

	public void setAvr_limit(BigDecimal aValue) {
		avr_limit = aValue;
	}

	public BigDecimal getAvr_limit() {
		return avr_limit;
	}

	public void setOdg_plan(BigDecimal aValue) {
		odg_plan = aValue;
	}

	public BigDecimal getOdg_plan() {
		return odg_plan;
	}

	public void setOdg_fact(BigDecimal aValue) {
		odg_fact = aValue;
	}

	public BigDecimal getOdg_fact() {
		return odg_fact;
	}

	public void setAll_limit(BigDecimal aValue) {
		all_limit = aValue;
	}

	public BigDecimal getAll_limit() {
		return all_limit;
	}

	public void setDecode(String aValue) {
		decode = aValue;
	}

	public String getDecode() {
		return decode;
	}

	public void setMol_codes(String aValue) {
		mol_codes = aValue;
	}

	public String getMol_codes() {
		return mol_codes;
	}

	public void setDatestart(Date aValue) {
		datestart = aValue;
	}

	public Date getDatestart() {
		return datestart;
	}

	public void setDatefinal(Date aValue) {
		datefinal = aValue;
	}

	public Date getDatefinal() {
		return datefinal;
	}

	public void setOrd(int aValue) {
		ord = aValue;
	}

	public int getOrd() {
		return ord;
	}

	public void setAll_plan(BigDecimal aValue) {
		all_plan = aValue;
	}

	public BigDecimal getAll_plan() {
		return all_plan;
	}

	public void setRest_from_fk(BigDecimal aValue) {
		rest_from_fk = aValue;
	}

	public BigDecimal getRest_from_fk() {
		return rest_from_fk;
	}

	public void setRest_from_fk_avz(BigDecimal aValue) {
		rest_from_fk_avz = aValue;
	}

	public BigDecimal getRest_from_fk_avz() {
		return rest_from_fk_avz;
	}

	public void setUserGen(String aValue) {
		userGen = aValue;
	}

	public String getUserGen() {
		return userGen;
	}

        public int getEikindcode(){
        return eikindcode;
        }
    
        public void setEikindcode(int eikindcode){
        this.eikindcode = eikindcode;
        }

	public void setDateEdit(Date aValue) {
		dateEdit = aValue;
	}

	public Date getDateEdit() {
		return dateEdit;
	}

	public void setModify_time(long aValue) {
		modify_time = aValue;
	}

	public long getModify_time() {
		return modify_time;
	}

	public void setSheetVolumesRef(ENFuelSheetVolumesRef aValue) {
		sheetVolumesRef = aValue;
	}

	public ENFuelSheetVolumesRef getSheetVolumesRef() {
		return sheetVolumesRef;
	}

} // end of ENFuelSheetVolumesItemValueObject

