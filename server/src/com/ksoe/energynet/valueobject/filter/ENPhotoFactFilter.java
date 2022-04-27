
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPhotoFact;

/**
 * Filter for ENPhotoFact;
 *
 */

public class ENPhotoFactFilter extends ENPhotoFact {

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

	public ENPhotoFactFilter() {
		code = Integer.MIN_VALUE;
		description = null;
		dateFact = null;
		actNumber = null;
		personalAccount = null;
		personalAccountUid = null;
		recordpointCode = Integer.MIN_VALUE;
		customerFIO = null;
		dateAdd = null;
		dateEdit = null;
		userGen = null;
		renRef.code = Integer.MIN_VALUE;
		workOrderBytRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENPhotoFact
