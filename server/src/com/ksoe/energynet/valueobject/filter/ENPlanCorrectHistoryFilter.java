//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2009 SIT
// Generated at Wed Oct 07 17:21:43 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPlanCorrectHistory;

/**
 * Filter for ENPlanCorrectHistory;
 *
 */

public class ENPlanCorrectHistoryFilter extends ENPlanCorrectHistory {

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

	public ENPlanCorrectHistoryFilter() {
		code = Integer.MIN_VALUE;
		dateGen = null;
		commentGen = null;
		userGen = null;
		dateEdit = null;

		modify_time = Long.MIN_VALUE;
		planRef.code = Integer.MIN_VALUE;
		planOldRef.code = Integer.MIN_VALUE;
		planNewRef.code = Integer.MIN_VALUE;
		reason.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENPlanCorrectHistory

