//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENRentPeriodStatus;

/**
 * Filter for ENRentPeriodStatus;
 *
 */

public class ENRentPeriodStatusFilter extends ENRentPeriodStatus {

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

	public ENRentPeriodStatusFilter() {
		code = Integer.MIN_VALUE;
		name = null;
	}

} // end of Filter for ENRentPeriodStatus

