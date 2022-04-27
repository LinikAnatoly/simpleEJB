//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENCottage;

/**
 * Filter for ENCottage;
 *
 */

public class ENCottageFilter extends ENCottage {

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

	public ENCottageFilter() {
		code = Integer.MIN_VALUE;
		numberGen = null;
		numberBeds = Integer.MIN_VALUE;
		description = null;
		commentgen = null;
		userGen = null;
		dateEdit = null;
		modify_time = Long.MIN_VALUE;
	}

} // end of Filter for ENCottage

