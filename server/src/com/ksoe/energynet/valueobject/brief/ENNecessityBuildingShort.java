
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

import java.io.Serializable;

/**
* Short Object for ENNecessityBuilding;
*/

import java.math.BigDecimal;
import java.util.Date;

public class ENNecessityBuildingShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public BigDecimal countGen;
	public BigDecimal summaGen;
	public String description;
	public Date dateEdit;
	public String userGen;
	public int elementTypeRefCode = Integer.MIN_VALUE;
	public String elementTypeRefName;
	public int voltageNominalCode = Integer.MIN_VALUE;
	public String voltageNominalValue;
	public int servicesObjectRefCode = Integer.MIN_VALUE;

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setCountGen(BigDecimal aValue) {
		countGen = aValue;
	}

	public BigDecimal getCountGen() {
		return countGen;
	}

	public void setSummaGen(BigDecimal aValue) {
		summaGen = aValue;
	}

	public BigDecimal getSummaGen() {
		return summaGen;
	}

	public void setDescription(String aValue) {
		description = aValue;
	}

	public String getDescription() {
		return description;
	}

	public void setDateEdit(Date aValue) {
		dateEdit = aValue;
	}

	public Date getDateEdit() {
		return dateEdit;
	}

	public void setUserGen(String aValue) {
		userGen = aValue;
	}

	public String getUserGen() {
		return userGen;
	}

	public void setElementTypeRefCode(int aValue) {
		elementTypeRefCode = aValue;
	}

	public int getElementTypeRefCode() {
		return elementTypeRefCode;
	}

	public void setElementTypeRefName(String aValue) {
		elementTypeRefName = aValue;
	}

	public String getElementTypeRefName() {
		return elementTypeRefName;
	}

	public void setVoltageNominalCode(int aValue) {
		voltageNominalCode = aValue;
	}

	public int getVoltageNominalCode() {
		return voltageNominalCode;
	}

	public void setVoltageNominalValue(String aValue) {
		voltageNominalValue = aValue;
	}

	public String getVoltageNominalValue() {
		return voltageNominalValue;
	}

	public void setServicesObjectRefCode(int aValue) {
		servicesObjectRefCode = aValue;
	}

	public int getServicesObjectRefCode() {
		return servicesObjectRefCode;
	}

}