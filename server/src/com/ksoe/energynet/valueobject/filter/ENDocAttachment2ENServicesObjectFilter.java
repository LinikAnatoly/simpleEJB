//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENDocAttachment2ENServicesObject;

/**
 * Filter for ENDocAttachment2ENServicesObject;
 *
 */

public class ENDocAttachment2ENServicesObjectFilter extends
		ENDocAttachment2ENServicesObject {

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

	public ENDocAttachment2ENServicesObjectFilter() {
		code = Integer.MIN_VALUE;
		docAttachmentRef.code = Integer.MIN_VALUE;
		servicesObjectRef.code = Integer.MIN_VALUE;
		kindRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENDocAttachment2ENServicesObject

