//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

/**
 * Short Object for ENSzBrigade;
 */

import java.io.Serializable;
import java.util.Date;

public class ENSzBrigadeShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String nazv;
	public String ceh_nazv;
	public String main_podr_nazv;
	public int sizCode = Integer.MIN_VALUE;
	public int podrId = Integer.MIN_VALUE;
	public int cehId = Integer.MIN_VALUE;
	public int quantity = Integer.MIN_VALUE;
	public String molCode;
	public String molName;
	public int statusCode = Integer.MIN_VALUE;
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

	/** ************************** */
	public String statusName;
	/** ************************** */


	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setNazv(String aValue) {
		nazv = aValue;
	}

	public String getNazv() {
		return nazv;
	}

	public void setCeh_nazv(String aValue) {
		ceh_nazv = aValue;
	}

	public String getCeh_nazv() {
		return ceh_nazv;
	}

	public void setMain_podr_nazv(String aValue) {
		main_podr_nazv = aValue;
	}

	public String getMain_podr_nazv() {
		return main_podr_nazv;
	}

	public void setSizCode(int aValue) {
		sizCode = aValue;
	}

	public int getSizCode() {
		return sizCode;
	}

	public void setPodrId(int aValue) {
		podrId = aValue;
	}

	public int getPodrId() {
		return podrId;
	}

	public void setCehId(int aValue) {
		cehId = aValue;
	}

	public int getCehId() {
		return cehId;
	}

	public void setQuantity(int aValue) {
		quantity = aValue;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setMolCode(String aValue) {
		molCode = aValue;
	}

	public String getMolCode() {
		return molCode;
	}

	public void setMolName(String aValue) {
		molName = aValue;
	}

	public String getMolName() {
		return molName;
	}

	public void setStatusCode(int aValue) {
		statusCode = aValue;
	}

	public int getStatusCode() {
		return statusCode;
	}

	public void setElementCode(int aValue) {
		elementCode = aValue;
	}

	public int getElementCode() {
		return elementCode;
	}

	public void setDepartmentRefCode(int aValue) {
		departmentRefCode = aValue;
	}

	public int getDepartmentRefCode() {
		return departmentRefCode;
	}

	public void setDepartmentRefShortName(String aValue) {
		departmentRefShortName = aValue;
	}

	public String getDepartmentRefShortName() {
		return departmentRefShortName;
	}

	public void setDepartmentRefDateStart(Date aValue) {
		departmentRefDateStart = aValue;
	}

	public Date getDepartmentRefDateStart() {
		return departmentRefDateStart;
	}

	public void setDepartmentRefDateFinal(Date aValue) {
		departmentRefDateFinal = aValue;
	}

	public Date getDepartmentRefDateFinal() {
		return departmentRefDateFinal;
	}

	public void setDepartmentRefRenCode(int aValue) {
		departmentRefRenCode = aValue;
	}

	public int getDepartmentRefRenCode() {
		return departmentRefRenCode;
	}

	public void setDepartmentRefShpzBalans(String aValue) {
		departmentRefShpzBalans = aValue;
	}

	public String getDepartmentRefShpzBalans() {
		return departmentRefShpzBalans;
	}

	public void setDepartmentRefKau_table_id_1884(int aValue) {
		departmentRefKau_table_id_1884 = aValue;
	}

	public int getDepartmentRefKau_table_id_1884() {
		return departmentRefKau_table_id_1884;
	}

	public void setDepartmentRefKau_1884(String aValue) {
		departmentRefKau_1884 = aValue;
	}

	public String getDepartmentRefKau_1884() {
		return departmentRefKau_1884;
	}

	public void setDepartmentRefName_1884(String aValue) {
		departmentRefName_1884 = aValue;
	}

	public String getDepartmentRefName_1884() {
		return departmentRefName_1884;
	}

	public void setDepartmentRefHrmorganizationid(String aValue) {
		departmentRefHrmorganizationid = aValue;
	}

	public String getDepartmentRefHrmorganizationid() {
		return departmentRefHrmorganizationid;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

}