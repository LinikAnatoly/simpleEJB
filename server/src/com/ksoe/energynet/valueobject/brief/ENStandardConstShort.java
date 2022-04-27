//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

/**
 * Short Object for ENStandardConst;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class ENStandardConstShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String name;
	public int entryCode = Integer.MIN_VALUE;
	public BigDecimal entryValue;
	public Date entryStartDate;
	public Date entryEndDate;

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setName(String aValue) {
		name = aValue;
	}

	public String getName() {
		return name;
	}

	public final int getEntryCode() {
		return entryCode;
	}

	public final void setEntryCode(int entryCode) {
		this.entryCode = entryCode;
	}

	public final BigDecimal getEntryValue() {
		return entryValue;
	}

	public final void setEntryValue(BigDecimal entryValue) {
		this.entryValue = entryValue;
	}

	public final Date getEntryStartDate() {
		return entryStartDate;
	}

	public final void setEntryStartDate(Date entryStartDate) {
		this.entryStartDate = entryStartDate;
	}

	public final Date getEntryEndDate() {
		return entryEndDate;
	}

	public final void setEntryEndDate(Date entryEndDate) {
		this.entryEndDate = entryEndDate;
	}

}