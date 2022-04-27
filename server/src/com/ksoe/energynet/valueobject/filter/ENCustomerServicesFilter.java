
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENCustomerServices;

/**
 * Filter for ENCustomerServices;
 *
 */

public class ENCustomerServicesFilter extends ENCustomerServices {

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

	public ENCustomerServicesFilter() {
		customerName = null;
		customerAddress = null;
		docNum = null;
		dateRegistration = null;
		typeName = null;
		serviceName = null;
		docStatus = null;
		sourceInfo = null;
		sourceTable = null;
		sourceTableCode = Integer.MIN_VALUE;
		sourceType = Integer.MIN_VALUE;
	}

} // end of Filter for ENCustomerServices
