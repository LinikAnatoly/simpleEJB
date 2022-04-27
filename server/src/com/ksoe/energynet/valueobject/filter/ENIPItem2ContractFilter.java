//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENIPItem2Contract;

/**
 * Filter for ENIPItem2Contract;
 *
 */

public class ENIPItem2ContractFilter extends ENIPItem2Contract {

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

	public ENIPItem2ContractFilter() {
		code = Integer.MIN_VALUE;
		contractNumber = null;
		contractDate = null;
		finDocCode = null;
		finDocID = Integer.MIN_VALUE;
		orgId = Integer.MIN_VALUE;
		orgName = null;
		orgUkrName = null;
		orgCode = null;
		ipItemRef.code = Integer.MIN_VALUE;
		generalContractRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENIPItem2Contract

