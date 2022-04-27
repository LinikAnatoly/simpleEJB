//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENEstimateItem2Contract;

/**
 * Filter for ENEstimateItem2Contract;
 *
 */

public class ENEstimateItem2ContractFilter extends ENEstimateItem2Contract {

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

	public ENEstimateItem2ContractFilter() {
		code = Integer.MIN_VALUE;
		countFact = null;
		contractNumber = null;
		contractDate = null;
		finDocCode = null;
		finDocID = Integer.MIN_VALUE;
		userGen = null;
		dateEdit = null;
		estimateItem.code = Integer.MIN_VALUE;
		org.code = Integer.MIN_VALUE;
		rqPurchItm2Estimate.code = Integer.MIN_VALUE;
		generalContractRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENEstimateItem2Contract

