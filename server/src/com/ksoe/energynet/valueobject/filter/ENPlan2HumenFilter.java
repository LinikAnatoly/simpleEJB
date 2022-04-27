//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPlan2Humen;

/**
 * Filter for ENPlan2Humen;
 *
 */

public class ENPlan2HumenFilter extends ENPlan2Humen {

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

	public ENPlan2HumenFilter() {
		code = Integer.MIN_VALUE;
		tabNumber = null;
		fio = null;
		positionCode = Integer.MIN_VALUE;
		priceGen = null;
		timeWorkGen = null;
		timeWorkFact = null;
		timeDelivery = null;
		positionId = null;
		modify_time = Long.MIN_VALUE;
		planRef.code = Integer.MIN_VALUE;
		humenKindRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENPlan2Humen

