//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENOperativeObject;

/**
 * Filter for ENOperativeObject;
 *
 */

public class ENOperativeObjectFilter extends ENOperativeObject {

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

	public ENOperativeObjectFilter() {
		code = Integer.MIN_VALUE;
		name = null;
		commentGen = null;
		contractNumber = null;
		contractDate = null;
		partnerCode = null;
		partnerName = null;
		finDocCode = null;
		finDocID = Integer.MIN_VALUE;
		domain_info = null;
		modify_time = Long.MIN_VALUE;
		department.code = Integer.MIN_VALUE;
		element.code = Integer.MIN_VALUE;
		generalContractRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENOperativeObject

