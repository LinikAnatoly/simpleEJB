//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENAttachment2ServicesKind;

/**
 * Filter for ENAttachment2ServicesKind;
 *
 */

public class ENAttachment2ServicesKindFilter extends ENAttachment2ServicesKind {

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

	public ENAttachment2ServicesKindFilter() {
		code = Integer.MIN_VALUE;
		name = null;
	}

} // end of Filter for ENAttachment2ServicesKind

