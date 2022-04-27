//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENStandardConstEntry;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENStandardConstRef;

public class ENStandardConstEntry implements Serializable {

	public int code = Integer.MIN_VALUE;
	public BigDecimal constEntry;
	public Date startDate;
	public Date endDate;
	public ENStandardConstRef constRef = new ENStandardConstRef();
	public static final String tableName = "ENSTANDARDCONSTENTRY";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENSTANDARDCONSTENTRY.CODE";
	public static final String constEntry_Attr = "constEntry";
	public static final String constEntry_Field = "CONSTENTRY";
	public static final String constEntry_QFielld = "ENSTANDARDCONSTENTRY.CONSTENTRY";
	public static final String startDate_Attr = "startDate";
	public static final String startDate_Field = "STARTDATE";
	public static final String startDate_QFielld = "ENSTANDARDCONSTENTRY.STARTDATE";
	public static final String endDate_Attr = "endDate";
	public static final String endDate_Field = "ENDDATE";
	public static final String endDate_QFielld = "ENSTANDARDCONSTENTRY.ENDDATE";
	public static final String constRef_Attr = "constRef";
	public static final String constRef_Field = "CONSTREFCODE";
	public static final String constRef_QFielld = "ENSTANDARDCONSTENTRY.CONSTREFCODE";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setConstEntry(BigDecimal aValue) {
		constEntry = aValue;
	}

	public BigDecimal getConstEntry() {
		return constEntry;
	}

	public void setStartDate(Date aValue) {
		startDate = aValue;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setEndDate(Date aValue) {
		endDate = aValue;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setConstRef(ENStandardConstRef aValue) {
		constRef = aValue;
	}

	public ENStandardConstRef getConstRef() {
		return constRef;
	}

} // end of ENStandardConstEntryValueObject

