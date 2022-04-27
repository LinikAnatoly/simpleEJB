
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPhotoFactAttachment;

/**
 * Filter for ENPhotoFactAttachment;
 *
 */

public class ENPhotoFactAttachmentFilter extends ENPhotoFactAttachment {

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

	public ENPhotoFactAttachmentFilter() {
		code = Integer.MIN_VALUE;
		docAttachmentRef.code = Integer.MIN_VALUE;
		photoFactRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENPhotoFactAttachment
