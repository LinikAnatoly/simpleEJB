
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENNecessityBuilding;

/**
 * Filter for ENNecessityBuilding;
 *
 */

public class ENNecessityBuildingFilter extends ENNecessityBuilding {

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

	public ENNecessityBuildingFilter() {
		code = Integer.MIN_VALUE;
		countGen = null;
		summaGen = null;
		description = null;
		dateEdit = null;
		userGen = null;
		elementTypeRef.code = Integer.MIN_VALUE;
		voltageNominal.code = Integer.MIN_VALUE;
		servicesObjectRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENNecessityBuilding
