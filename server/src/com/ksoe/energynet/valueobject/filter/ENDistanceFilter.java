//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENDistance;

/**
 * Filter for ENDistance;
 *
 */

public class ENDistanceFilter extends ENDistance {

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

	public ENDistanceFilter() {
		code = Integer.MIN_VALUE;
		distance = null;
		commentGen = null;
		modify_time = Long.MIN_VALUE;
		typeRef.code = Integer.MIN_VALUE;
		roadType.code = Integer.MIN_VALUE;
		transportItemRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENDistance

