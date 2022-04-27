//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENDocAttachmentStatus;

/**
 * Filter for ENDocAttachmentStatus;
 *
 */

public class ENDocAttachmentStatusFilter extends ENDocAttachmentStatus {

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

	public ENDocAttachmentStatusFilter() {
		code = Integer.MIN_VALUE;
		name = null;
	}

} // end of Filter for ENDocAttachmentStatus

