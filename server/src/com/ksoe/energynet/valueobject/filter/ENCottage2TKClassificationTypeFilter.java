//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENCottage2TKClassificationType;

/**
 * Filter for ENCottage2TKClassificationType;
 *
 */

public class ENCottage2TKClassificationTypeFilter extends
		ENCottage2TKClassificationType {

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

	public ENCottage2TKClassificationTypeFilter() {
		code = Integer.MIN_VALUE;
		userGen = null;
		dateEdit = null;
		modify_time = Long.MIN_VALUE;
		classificationTypeRef.code = Integer.MIN_VALUE;
		cottageRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENCottage2TKClassificationType

