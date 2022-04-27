//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPlanWork2Decree;

/**
 * Filter for ENPlanWork2Decree;
 *
 */

public class ENPlanWork2DecreeFilter extends ENPlanWork2Decree {

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

	public ENPlanWork2DecreeFilter() {
		code = Integer.MIN_VALUE;
		decreeCode = Integer.MIN_VALUE;
		userGen = null;
		dateEdit = null;
		planRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENPlanWork2Decree

