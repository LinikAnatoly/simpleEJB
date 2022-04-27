//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

/**
 * Short Object for ENAct2SCUsageInput;
 */

import java.io.Serializable;
import java.util.Date;

public class ENAct2SCUsageInputShort implements Serializable {

	public int code = Integer.MIN_VALUE;
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
	public int scUsageInputRefCode = Integer.MIN_VALUE;
	public String scUsageInputRefNumberDoc;
	public Date scUsageInputRefDateGen;
	public Date scUsageInputRefDateStart;
	public Date scUsageInputRefDateFinal;
	public String scUsageInputRefMolCode;
	public String scUsageInputRefMolName;
	public Date scUsageInputRefDateEdit;
	public String scUsageInputRefUserGen;

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
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

	public void setScUsageInputRefCode(int aValue) {
		scUsageInputRefCode = aValue;
	}

	public int getScUsageInputRefCode() {
		return scUsageInputRefCode;
	}

	public void setScUsageInputRefNumberDoc(String aValue) {
		scUsageInputRefNumberDoc = aValue;
	}

	public String getScUsageInputRefNumberDoc() {
		return scUsageInputRefNumberDoc;
	}

	public void setScUsageInputRefDateGen(Date aValue) {
		scUsageInputRefDateGen = aValue;
	}

	public Date getScUsageInputRefDateGen() {
		return scUsageInputRefDateGen;
	}

	public void setScUsageInputRefDateStart(Date aValue) {
		scUsageInputRefDateStart = aValue;
	}

	public Date getScUsageInputRefDateStart() {
		return scUsageInputRefDateStart;
	}

	public void setScUsageInputRefDateFinal(Date aValue) {
		scUsageInputRefDateFinal = aValue;
	}

	public Date getScUsageInputRefDateFinal() {
		return scUsageInputRefDateFinal;
	}

	public void setScUsageInputRefMolCode(String aValue) {
		scUsageInputRefMolCode = aValue;
	}

	public String getScUsageInputRefMolCode() {
		return scUsageInputRefMolCode;
	}

	public void setScUsageInputRefMolName(String aValue) {
		scUsageInputRefMolName = aValue;
	}

	public String getScUsageInputRefMolName() {
		return scUsageInputRefMolName;
	}

	public void setScUsageInputRefDateEdit(Date aValue) {
		scUsageInputRefDateEdit = aValue;
	}

	public Date getScUsageInputRefDateEdit() {
		return scUsageInputRefDateEdit;
	}

	public void setScUsageInputRefUserGen(String aValue) {
		scUsageInputRefUserGen = aValue;
	}

	public String getScUsageInputRefUserGen() {
		return scUsageInputRefUserGen;
	}

}