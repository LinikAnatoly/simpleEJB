//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENResponsibles;

/**
 * Filter for ENResponsibles;
 *
 */

public class ENResponsiblesFilter extends ENResponsibles {

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

	public ENResponsiblesFilter() {
		code = Integer.MIN_VALUE;
		FIO = null;
		tabNumber = null;
		position = null;
		depName = null;
		depCode = null;
		phone = null;
		kindRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENResponsibles

