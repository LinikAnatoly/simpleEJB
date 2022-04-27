
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENInspectionSheetStatus;

/**
 * Filter for ENInspectionSheetStatus;
 *
 */

public class ENInspectionSheetStatusFilter extends ENInspectionSheetStatus {

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

	public ENInspectionSheetStatusFilter() {
		code = Integer.MIN_VALUE;
		name = null;
	}

} // end of Filter for ENInspectionSheetStatus
