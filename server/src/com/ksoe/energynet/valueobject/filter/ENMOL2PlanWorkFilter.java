//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENMOL2PlanWork;

/**
 * Filter for ENMOL2PlanWork;
 *
 */

public class ENMOL2PlanWorkFilter extends ENMOL2PlanWork {

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

	public ENMOL2PlanWorkFilter() {
		code = Integer.MIN_VALUE;
		molName = null;
		molCode = null;
		modify_time = Long.MIN_VALUE;
		planRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENMOL2PlanWork

