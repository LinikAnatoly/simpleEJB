
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENInspectionSheet;

/**
 * Filter for ENInspectionSheet;
 *
 */

public class ENInspectionSheetFilter extends ENInspectionSheet {

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

	public ENInspectionSheetFilter() {
		code = Integer.MIN_VALUE;
		name = null;
		inspectionKind = Integer.MIN_VALUE;
		dateGen = null;
		executor = null;
		accepted = null;
		objectInvNumber = null;
		objectName = null;
		equipmentKind = Integer.MIN_VALUE;
		takeIntoCalculation = Integer.MIN_VALUE;
		userGen = null;
		dateEdit = null;
		modify_time = Long.MIN_VALUE;
		statusRef.code = Integer.MIN_VALUE;
		elementRef.code = Integer.MIN_VALUE;
		defects2InspectRef.code = Integer.MIN_VALUE;
		planRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENInspectionSheet
