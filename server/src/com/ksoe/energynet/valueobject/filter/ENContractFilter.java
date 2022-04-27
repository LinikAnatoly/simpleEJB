//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENContract;

/**
 * Filter for ENContract;
 *
 */

public class ENContractFilter extends ENContract {

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

	public ENContractFilter() {
		code = Integer.MIN_VALUE;
		contractNumber = null;
		contractDate = null;
		contractEndDate = null;
		finDocCode = null;
		finDocID = Integer.MIN_VALUE;
		commentGen = null;
		userGen = null;
		dateEdit = null;
		modify_time = Long.MIN_VALUE;
		org.code = Integer.MIN_VALUE;
		contractType.code = Integer.MIN_VALUE;
		purchaseItemTender.code = Integer.MIN_VALUE;
		generalContractRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENContract

