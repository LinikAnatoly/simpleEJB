//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENRentPeriod2Services;

/**
 * Filter for ENRentPeriod2Services;
 *
 */

public class ENRentPeriod2ServicesFilter extends ENRentPeriod2Services {

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

	public ENRentPeriod2ServicesFilter() {
		code = Integer.MIN_VALUE;
		startDate = null;
		endDate = null;
		servicesObjectRef.code = Integer.MIN_VALUE;
		cottageRef.code = Integer.MIN_VALUE;
		statusRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENRentPeriod2Services

