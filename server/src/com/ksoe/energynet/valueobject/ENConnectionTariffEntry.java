//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENConnectionTariffEntry;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENConnectionTariffRef;

public class ENConnectionTariffEntry implements Serializable {

	public int code = Integer.MIN_VALUE;
	public BigDecimal value;
	public Date startDate;
	public String userGen;
	public long modify_time = Long.MIN_VALUE;
	public ENConnectionTariffRef tariffRef = new ENConnectionTariffRef();
	public static final String tableName = "ENCONNECTIONTARIFFENTR";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENCONNECTIONTARIFFENTR.CODE";
	public static final String value_Attr = "value";
	public static final String value_Field = "VALUE";
	public static final String value_QFielld = "ENCONNECTIONTARIFFENTR.VALUE";
	public static final String startDate_Attr = "startDate";
	public static final String startDate_Field = "STARTDATE";
	public static final String startDate_QFielld = "ENCONNECTIONTARIFFENTR.STARTDATE";
	public static final String userGen_Attr = "userGen";
	public static final String userGen_Field = "USERGEN";
	public static final String userGen_QFielld = "ENCONNECTIONTARIFFENTR.USERGEN";
	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "ENCONNECTIONTARIFFENTR.MODIFY_TIME";
	public static final String tariffRef_Attr = "tariffRef";
	public static final String tariffRef_Field = "TARIFFREFCODE";
	public static final String tariffRef_QFielld = "ENCONNECTIONTARIFFENTR.TARIFFREFCODE";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setValue(BigDecimal aValue) {
		value = aValue;
	}

	public BigDecimal getValue() {
		return value;
	}

	public void setStartDate(Date aValue) {
		startDate = aValue;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setUserGen(String aValue) {
		userGen = aValue;
	}

	public String getUserGen() {
		return userGen;
	}

	public void setModify_time(long aValue) {
		modify_time = aValue;
	}

	public long getModify_time() {
		return modify_time;
	}

	public void setTariffRef(ENConnectionTariffRef aValue) {
		tariffRef = aValue;
	}

	public ENConnectionTariffRef getTariffRef() {
		return tariffRef;
	}

} // end of ENConnectionTariffEntryValueObject

