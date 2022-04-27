
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENActIncomeCreatMetod;

/**
 * Filter for ENActIncomeCreatMetod;
 *
 */

public class ENActIncomeCreatMetodFilter extends ENActIncomeCreatMetod {

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

	public ENActIncomeCreatMetodFilter() {
		code = Integer.MIN_VALUE;
		name = null;
	}

} // end of Filter for ENActIncomeCreatMetod
