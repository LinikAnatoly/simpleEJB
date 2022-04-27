//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSzBrigade;

/**
 * Filter for ENSzBrigade;
 *
 */

public class ENSzBrigadeFilter extends ENSzBrigade {

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

	public ENSzBrigadeFilter() {
		code = Integer.MIN_VALUE;
		nazv = null;
		ceh_nazv = null;
		main_podr_nazv = null;
		sizCode = Integer.MIN_VALUE;
		podrId = Integer.MIN_VALUE;
		cehId = Integer.MIN_VALUE;
		quantity = Integer.MIN_VALUE;
		molCode = null;
		molName = null;
		statusCode = Integer.MIN_VALUE;
		element.code = Integer.MIN_VALUE;
		departmentRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENSzBrigade

