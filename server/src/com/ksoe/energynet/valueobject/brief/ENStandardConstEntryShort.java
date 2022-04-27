//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

/**
 * Short Object for ENStandardConstEntry;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class ENStandardConstEntryShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public BigDecimal ConstEntry;
	public Date startDate;
	public Date endDate;
	public int constRefCode = Integer.MIN_VALUE;
	public String constRefName;

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setConstEntry(BigDecimal aValue) {
		ConstEntry = aValue;
	}

	public BigDecimal getConstEntry() {
		return ConstEntry;
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

	public void setConstRefCode(int aValue) {
		constRefCode = aValue;
	}

	public int getConstRefCode() {
		return constRefCode;
	}

	public void setConstRefName(String aValue) {
		constRefName = aValue;
	}

	public String getConstRefName() {
		return constRefName;
	}

}