//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENAct2SCUsageInput;

/**
 * Filter for ENAct2SCUsageInput;
 *
 */

public class ENAct2SCUsageInputFilter extends ENAct2SCUsageInput {

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

	public ENAct2SCUsageInputFilter() {
		code = Integer.MIN_VALUE;
		actRef.code = Integer.MIN_VALUE;
		scUsageInputRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENAct2SCUsageInput

