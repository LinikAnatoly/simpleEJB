
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENDocAttachment;

/**
 * Filter for ENDocAttachment;
 *
 */

public class ENDocAttachmentFilter extends ENDocAttachment {

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

	public ENDocAttachmentFilter() {
		code = Integer.MIN_VALUE;
		commentGen = null;
		fileLink = null;
		filesize = Long.MIN_VALUE;
		signingStatus = Integer.MIN_VALUE;
		userAdd = null;
		dateAdd = null;
		userGen = null;
		dateEdit = null;
		modify_time = Long.MIN_VALUE;
		status.code = Integer.MIN_VALUE;
		parentRef.code = Integer.MIN_VALUE;
		serverRef.code = Integer.MIN_VALUE;
		typeRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENDocAttachment
