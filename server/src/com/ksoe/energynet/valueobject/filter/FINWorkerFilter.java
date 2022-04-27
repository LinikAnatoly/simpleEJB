//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.FINWorker;

/**
 * Filter for FINWorker;
 *
 */

public class FINWorkerFilter extends FINWorker {

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

	public FINWorkerFilter() {
		code = Integer.MIN_VALUE;
		name = null;
		tabNumber = null;
		positionName = null;
		positionCode = Integer.MIN_VALUE;
		departmentName = null;
		departmentCode = null;
		priceGen = null;
		categor = Integer.MIN_VALUE;
		finCode = Integer.MIN_VALUE;
		isSentAssignment = Integer.MIN_VALUE;
		chargePercent = null;
		categorId = Integer.MIN_VALUE;
		categorName = null;
		workTimeId = null;
		domain_info = null;
		positionId = null;
		modify_time = Long.MIN_VALUE;
		kindRef.code = Integer.MIN_VALUE;
		chargeRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for FINWorker

