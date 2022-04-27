
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSizMaterials2TKMaterials;

/**
 * Filter for ENSizMaterials2TKMaterials;
 *
 */

public class ENSizMaterials2TKMaterialsFilter extends ENSizMaterials2TKMaterials {

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

	public ENSizMaterials2TKMaterialsFilter() {
		code = Integer.MIN_VALUE;
		userEdit = null;
		dateEdit = null;
		elementRef.code = Integer.MIN_VALUE;
		sizMaterialsRef.code = Integer.MIN_VALUE;
		tkMaterialsRef.code = Integer.MIN_VALUE;
		parentRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENSizMaterials2TKMaterials
