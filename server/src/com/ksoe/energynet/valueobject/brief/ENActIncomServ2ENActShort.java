
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

import java.io.Serializable;

/**
* Short Object for ENActIncomServ2ENAct;
*/

import java.math.BigDecimal;
import java.util.Date;

public class ENActIncomServ2ENActShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public BigDecimal summaGen;
	public int actIncomeRefCode = Integer.MIN_VALUE;
	public String actIncomeRefNumberGen;
	public Date actIncomeRefDateGen;
	public Date actIncomeRefActDateStart;
	public Date actIncomeRefActDateEnd;
	public BigDecimal actIncomeRefSummaGen;
	public BigDecimal actIncomeRefSummaVat;
	public Date actIncomeRefDateAdd;
	public Date actIncomeRefDateEdit;
	public String actIncomeRefUserGen;
	public int actRefCode = Integer.MIN_VALUE;
	public String actRefNumberGen;
	public Date actRefDateGen;
	public int actRefFinDocCode = Integer.MIN_VALUE;
	public int actRefFinDocMechanicCode = Integer.MIN_VALUE;
	public String actRefFinMolName;
	public String actRefFinMechanicName;
	public String actRefInvNumber;
	public String actRefUserGen;
	public Date actRefDateEdit;
	public Date actRefDateAct;
	public String actRefMolCodeObject;

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setSummaGen(BigDecimal aValue) {
		summaGen = aValue;
	}

	public BigDecimal getSummaGen() {
		return summaGen;
	}

	public void setActIncomeRefCode(int aValue) {
		actIncomeRefCode = aValue;
	}

	public int getActIncomeRefCode() {
		return actIncomeRefCode;
	}

	public void setActIncomeRefNumberGen(String aValue) {
		actIncomeRefNumberGen = aValue;
	}

	public String getActIncomeRefNumberGen() {
		return actIncomeRefNumberGen;
	}

	public void setActIncomeRefDateGen(Date aValue) {
		actIncomeRefDateGen = aValue;
	}

	public Date getActIncomeRefDateGen() {
		return actIncomeRefDateGen;
	}

	public void setActIncomeRefActDateStart(Date aValue) {
		actIncomeRefActDateStart = aValue;
	}

	public Date getActIncomeRefActDateStart() {
		return actIncomeRefActDateStart;
	}

	public void setActIncomeRefActDateEnd(Date aValue) {
		actIncomeRefActDateEnd = aValue;
	}

	public Date getActIncomeRefActDateEnd() {
		return actIncomeRefActDateEnd;
	}

	public void setActIncomeRefSummaGen(BigDecimal aValue) {
		actIncomeRefSummaGen = aValue;
	}

	public BigDecimal getActIncomeRefSummaGen() {
		return actIncomeRefSummaGen;
	}

	public void setActIncomeRefSummaVat(BigDecimal aValue) {
		actIncomeRefSummaVat = aValue;
	}

	public BigDecimal getActIncomeRefSummaVat() {
		return actIncomeRefSummaVat;
	}

	public void setActIncomeRefDateAdd(Date aValue) {
		actIncomeRefDateAdd = aValue;
	}

	public Date getActIncomeRefDateAdd() {
		return actIncomeRefDateAdd;
	}

	public void setActIncomeRefDateEdit(Date aValue) {
		actIncomeRefDateEdit = aValue;
	}

	public Date getActIncomeRefDateEdit() {
		return actIncomeRefDateEdit;
	}

	public void setActIncomeRefUserGen(String aValue) {
		actIncomeRefUserGen = aValue;
	}

	public String getActIncomeRefUserGen() {
		return actIncomeRefUserGen;
	}

	public void setActRefCode(int aValue) {
		actRefCode = aValue;
	}

	public int getActRefCode() {
		return actRefCode;
	}

	public void setActRefNumberGen(String aValue) {
		actRefNumberGen = aValue;
	}

	public String getActRefNumberGen() {
		return actRefNumberGen;
	}

	public void setActRefDateGen(Date aValue) {
		actRefDateGen = aValue;
	}

	public Date getActRefDateGen() {
		return actRefDateGen;
	}

	public void setActRefFinDocCode(int aValue) {
		actRefFinDocCode = aValue;
	}

	public int getActRefFinDocCode() {
		return actRefFinDocCode;
	}

	public void setActRefFinDocMechanicCode(int aValue) {
		actRefFinDocMechanicCode = aValue;
	}

	public int getActRefFinDocMechanicCode() {
		return actRefFinDocMechanicCode;
	}

	public void setActRefFinMolName(String aValue) {
		actRefFinMolName = aValue;
	}

	public String getActRefFinMolName() {
		return actRefFinMolName;
	}

	public void setActRefFinMechanicName(String aValue) {
		actRefFinMechanicName = aValue;
	}

	public String getActRefFinMechanicName() {
		return actRefFinMechanicName;
	}

	public void setActRefInvNumber(String aValue) {
		actRefInvNumber = aValue;
	}

	public String getActRefInvNumber() {
		return actRefInvNumber;
	}

	public void setActRefUserGen(String aValue) {
		actRefUserGen = aValue;
	}

	public String getActRefUserGen() {
		return actRefUserGen;
	}

	public void setActRefDateEdit(Date aValue) {
		actRefDateEdit = aValue;
	}

	public Date getActRefDateEdit() {
		return actRefDateEdit;
	}

	public void setActRefDateAct(Date aValue) {
		actRefDateAct = aValue;
	}

	public Date getActRefDateAct() {
		return actRefDateAct;
	}

	public void setActRefMolCodeObject(String aValue) {
		actRefMolCodeObject = aValue;
	}

	public String getActRefMolCodeObject() {
		return actRefMolCodeObject;
	}

}