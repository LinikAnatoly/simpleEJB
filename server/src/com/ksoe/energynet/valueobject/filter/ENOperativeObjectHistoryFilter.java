//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENOperativeObjectHistory;

/**
 * Filter for ENOperativeObjectHistory;
 *
 */

public class ENOperativeObjectHistoryFilter extends ENOperativeObjectHistory {

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

	public ENOperativeObjectHistoryFilter() {
		code = Integer.MIN_VALUE;
		contractNumber = null;
		contractDate = null;
		name = null;
		partnerCode = null;
		finDocCode = null;
		finDocID = Integer.MIN_VALUE;
		modify_time = Long.MIN_VALUE;
		objectRef.code = Integer.MIN_VALUE;
		generalContractRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENOperativeObjectHistory

