//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

/**
 * Short Object for ENFuelSheetVolumesItem;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class ENFuelSheetVolumesItemShort implements Serializable {

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
	public int eikindcode = Integer.MIN_VALUE;
	public String userGen;
	public Date dateEdit;
	public int sheetVolumesRefCode = Integer.MIN_VALUE;
	public String sheetVolumesRefName;
	public Date sheetVolumesRefDateGen;
	public Date sheetVolumesRefStartDate;
	public Date sheetVolumesRefEndDate;
	public String sheetVolumesRefUserGen;
	public Date sheetVolumesRefDateEdit;



	public int getOrd() {
		return ord;
	}

	public void setOrd(int ord) {
		this.ord = ord;
	}

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

	public int getEikindcode() {
		return eikindcode;
	}

	public void setEikindcode(int eikindcode) {
		this.eikindcode = eikindcode;
	}

	public String getUserGen() {
		return userGen;
	}

	public void setDateEdit(Date aValue) {
		dateEdit = aValue;
	}

	public Date getDateEdit() {
		return dateEdit;
	}

	public void setSheetVolumesRefCode(int aValue) {
		sheetVolumesRefCode = aValue;
	}

	public int getSheetVolumesRefCode() {
		return sheetVolumesRefCode;
	}

	public void setSheetVolumesRefName(String aValue) {
		sheetVolumesRefName = aValue;
	}

	public String getSheetVolumesRefName() {
		return sheetVolumesRefName;
	}

	public void setSheetVolumesRefDateGen(Date aValue) {
		sheetVolumesRefDateGen = aValue;
	}

	public Date getSheetVolumesRefDateGen() {
		return sheetVolumesRefDateGen;
	}

	public void setSheetVolumesRefStartDate(Date aValue) {
		sheetVolumesRefStartDate = aValue;
	}

	public Date getSheetVolumesRefStartDate() {
		return sheetVolumesRefStartDate;
	}

	public void setSheetVolumesRefEndDate(Date aValue) {
		sheetVolumesRefEndDate = aValue;
	}

	public Date getSheetVolumesRefEndDate() {
		return sheetVolumesRefEndDate;
	}

	public void setSheetVolumesRefUserGen(String aValue) {
		sheetVolumesRefUserGen = aValue;
	}

	public String getSheetVolumesRefUserGen() {
		return sheetVolumesRefUserGen;
	}

	public void setSheetVolumesRefDateEdit(Date aValue) {
		sheetVolumesRefDateEdit = aValue;
	}

	public Date getSheetVolumesRefDateEdit() {
		return sheetVolumesRefDateEdit;
	}

}