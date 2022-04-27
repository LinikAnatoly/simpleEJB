//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTransferDate2ServicesObject;

/**
 * Filter for ENTransferDate2ServicesObject;
 *
 */

public class ENTransferDate2ServicesObjectFilter extends
		ENTransferDate2ServicesObject {

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

	public ENTransferDate2ServicesObjectFilter() {
		code = Integer.MIN_VALUE;
		issueDate = null;
		returnDate = null;
		userGen = null;
		dateEdit = null;
		servicesObjectRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENTransferDate2ServicesObject

