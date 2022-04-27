//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENStandardConstEntry;

/**
 * Filter for ENStandardConstEntry;
 *
 */

public class ENStandardConstEntryFilter extends ENStandardConstEntry {

	public String conditionSQL;
	public String orderBySQL;

	public final String getConditionSQL() {
		return conditionSQL;
	}

	public final void setConditionSQL(String aValue) {
		conditionSQL = aValue;
	}

	public final String getOrderBySQL() {
		return orderBySQL;
	}

	public final void setOrderBySQL(String aValue) {
		orderBySQL = aValue;
	}

	public ENStandardConstEntryFilter() {
		code = Integer.MIN_VALUE;
		constEntry = null;
		startDate = null;
		endDate = null;
		constRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENStandardConstEntry

