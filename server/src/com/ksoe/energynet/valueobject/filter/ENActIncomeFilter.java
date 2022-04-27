//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENActIncome;

/**
 * Filter for ENActIncome;
 *
 */

public class ENActIncomeFilter extends ENActIncome {

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

	public ENActIncomeFilter() {
		code = Integer.MIN_VALUE;
		numbergen = null;
		dategen = null;
		actDateStart = null;
		actDateEnd = null;
		commentGen = null;
		contractNumber = null;
		contractDate = null;
		partnername = null;
		partnerCode = null;
		finDocCode = null;
		finDocID = Integer.MIN_VALUE;
		domain_info = null;
		modify_time = Long.MIN_VALUE;
		statusRef.code = Integer.MIN_VALUE;
		generalContractRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENActIncome

