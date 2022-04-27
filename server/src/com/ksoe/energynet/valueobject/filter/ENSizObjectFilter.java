
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSizObject;

/**
 * Filter for ENSizObject;
 *
 */

public class ENSizObjectFilter extends ENSizObject {

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

	public ENSizObjectFilter() {
		code = Integer.MIN_VALUE;
		tabNumber = null;
		profesion = null;
		fio = null;
		sizCode = Integer.MIN_VALUE;
		statusCode = Integer.MIN_VALUE;
		gender = Integer.MIN_VALUE;
		growth = null;
		sizeClothing = null;
		sizeShoes = null;
		sizeHead = null;
		modify_time = Long.MIN_VALUE;
		element.code = Integer.MIN_VALUE;
		departmentRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENSizObject
