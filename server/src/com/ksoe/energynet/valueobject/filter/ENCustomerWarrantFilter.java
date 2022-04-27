
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENCustomerWarrant;

/**
 * Filter for ENCustomerWarrant;
 *
 */

public class ENCustomerWarrantFilter extends ENCustomerWarrant {

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

	public ENCustomerWarrantFilter() {
		code = Integer.MIN_VALUE;
		typeCode = Integer.MIN_VALUE;
		servicesConsumerCode = Integer.MIN_VALUE;
		userGen = null;
		modify_time = Long.MIN_VALUE;
		warrantRef.code = Integer.MIN_VALUE;
		servicesObjectRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENCustomerWarrant
