//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.FINExecutor2Plan;

/**
 * Filter for FINExecutor2Plan;
 *
 */

public class FINExecutor2PlanFilter extends FINExecutor2Plan {

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

	public FINExecutor2PlanFilter() {
		code = Integer.MIN_VALUE;
		percentLoad = null;
		dateStart = null;
		dateFinal = null;
		totalTimeHours = null;
		totalTimeDays = null;
		totalTimeManHours = null;
		deliveryTime = null;
		userGen = null;
		dateEdit = null;
		modify_time = Long.MIN_VALUE;
		finExecutorTypeRef.code = Integer.MIN_VALUE;
		planRef.code = Integer.MIN_VALUE;
		finExecutor.code = Integer.MIN_VALUE;
		budgetRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for FINExecutor2Plan

