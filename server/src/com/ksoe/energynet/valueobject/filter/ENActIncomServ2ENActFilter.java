
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENActIncomServ2ENAct;

/**
 * Filter for ENActIncomServ2ENAct;
 *
 */

public class ENActIncomServ2ENActFilter extends ENActIncomServ2ENAct {

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

	public ENActIncomServ2ENActFilter() {
		code = Integer.MIN_VALUE;
		summaGen = null;
		actIncomeRef.code = Integer.MIN_VALUE;
		actRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENActIncomServ2ENAct
