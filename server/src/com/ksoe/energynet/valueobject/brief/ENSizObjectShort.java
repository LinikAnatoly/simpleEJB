
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

import java.io.Serializable;

/**
* Short Object for ENSizObject;
*/

import java.math.BigDecimal;
import java.util.Date;

public class ENSizObjectShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String tabNumber;
	public String profesion;
	public String fio;
	public int sizCode = Integer.MIN_VALUE;
	public int statusCode = Integer.MIN_VALUE;
	public int gender = Integer.MIN_VALUE;
	public BigDecimal growth;
	public BigDecimal sizeClothing;
	public BigDecimal sizeShoes;
	public BigDecimal sizeHead;
	public int elementCode = Integer.MIN_VALUE;
	public int departmentRefCode = Integer.MIN_VALUE;
	public String departmentRefShortName;
	public Date departmentRefDateStart;
	public Date departmentRefDateFinal;
	public int departmentRefRenCode = Integer.MIN_VALUE;
	public String departmentRefShpzBalans;
	public int departmentRefKau_table_id_1884 = Integer.MIN_VALUE;
	public String departmentRefKau_1884;
	public String departmentRefName_1884;
	public String departmentRefHrmorganizationid;


	/** ************************* */
	public String renName;
	/** ************************* */


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getTabNumber() {
		return tabNumber;
	}

	public void setTabNumber(String tabNumber) {
		this.tabNumber = tabNumber;
	}

	public String getProfesion() {
		return profesion;
	}

	public void setProfesion(String profesion) {
		this.profesion = profesion;
	}

	public String getFio() {
		return fio;
	}

	public void setFio(String fio) {
		this.fio = fio;
	}

	public int getSizCode() {
		return sizCode;
	}

	public void setSizCode(int sizCode) {
		this.sizCode = sizCode;
	}

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public BigDecimal getGrowth() {
		return growth;
	}

	public void setGrowth(BigDecimal growth) {
		this.growth = growth;
	}

	public BigDecimal getSizeClothing() {
		return sizeClothing;
	}

	public void setSizeClothing(BigDecimal sizeClothing) {
		this.sizeClothing = sizeClothing;
	}

	public BigDecimal getSizeShoes() {
		return sizeShoes;
	}

	public void setSizeShoes(BigDecimal sizeShoes) {
		this.sizeShoes = sizeShoes;
	}

	public BigDecimal getSizeHead() {
		return sizeHead;
	}

	public void setSizeHead(BigDecimal sizeHead) {
		this.sizeHead = sizeHead;
	}

	public int getElementCode() {
		return elementCode;
	}

	public void setElementCode(int elementCode) {
		this.elementCode = elementCode;
	}

	public int getDepartmentRefCode() {
		return departmentRefCode;
	}

	public void setDepartmentRefCode(int departmentRefCode) {
		this.departmentRefCode = departmentRefCode;
	}

	public String getDepartmentRefShortName() {
		return departmentRefShortName;
	}

	public void setDepartmentRefShortName(String departmentRefShortName) {
		this.departmentRefShortName = departmentRefShortName;
	}

	public Date getDepartmentRefDateStart() {
		return departmentRefDateStart;
	}

	public void setDepartmentRefDateStart(Date departmentRefDateStart) {
		this.departmentRefDateStart = departmentRefDateStart;
	}

	public Date getDepartmentRefDateFinal() {
		return departmentRefDateFinal;
	}

	public void setDepartmentRefDateFinal(Date departmentRefDateFinal) {
		this.departmentRefDateFinal = departmentRefDateFinal;
	}

	public int getDepartmentRefRenCode() {
		return departmentRefRenCode;
	}

	public void setDepartmentRefRenCode(int departmentRefRenCode) {
		this.departmentRefRenCode = departmentRefRenCode;
	}

	public String getDepartmentRefShpzBalans() {
		return departmentRefShpzBalans;
	}

	public void setDepartmentRefShpzBalans(String departmentRefShpzBalans) {
		this.departmentRefShpzBalans = departmentRefShpzBalans;
	}

	public int getDepartmentRefKau_table_id_1884() {
		return departmentRefKau_table_id_1884;
	}

	public void setDepartmentRefKau_table_id_1884(int departmentRefKau_table_id_1884) {
		this.departmentRefKau_table_id_1884 = departmentRefKau_table_id_1884;
	}

	public String getDepartmentRefKau_1884() {
		return departmentRefKau_1884;
	}

	public void setDepartmentRefKau_1884(String departmentRefKau_1884) {
		this.departmentRefKau_1884 = departmentRefKau_1884;
	}

	public String getDepartmentRefName_1884() {
		return departmentRefName_1884;
	}

	public void setDepartmentRefName_1884(String departmentRefName_1884) {
		this.departmentRefName_1884 = departmentRefName_1884;
	}

	public String getDepartmentRefHrmorganizationid() {
		return departmentRefHrmorganizationid;
	}

	public void setDepartmentRefHrmorganizationid(String departmentRefHrmorganizationid) {
		this.departmentRefHrmorganizationid = departmentRefHrmorganizationid;
	}

	public String getRenName() {
		return renName;
	}

	public void setRenName(String renName) {
		this.renName = renName;
	}

}
