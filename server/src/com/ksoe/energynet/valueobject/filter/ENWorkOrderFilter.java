//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENWorkOrder;

/**
 * Filter for ENWorkOrder;
 *
 */

public class ENWorkOrderFilter extends ENWorkOrder {

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

	public ENWorkOrderFilter() {
		code = Integer.MIN_VALUE;
		workOrderNumber = null;
		numberInt = Integer.MIN_VALUE;
		dateGen = null;
		commentGen = null;
		defectShortDesc = null;
		finMolCode = null;
		finMolName = null;
		finMechanicCode = null;
		finMechanicName = null;
		userGen = null;
		dateEdit = null;

		modify_time = Long.MIN_VALUE;
		department.code = Integer.MIN_VALUE;
		statusWorkOrder.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENWorkOrder

