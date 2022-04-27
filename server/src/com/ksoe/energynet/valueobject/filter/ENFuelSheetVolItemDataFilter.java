//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENFuelSheetVolItemData;

/**
 * Filter for ENFuelSheetVolItemData;
 *
 */

public class ENFuelSheetVolItemDataFilter extends ENFuelSheetVolItemData {

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

	public ENFuelSheetVolItemDataFilter() {
		code = Integer.MIN_VALUE;
		plan_code = Integer.MIN_VALUE;
		datestart = null;
		countfact = null;
		kindcode = Integer.MIN_VALUE;
		staterefcode = Integer.MIN_VALUE;
		typerefcode = Integer.MIN_VALUE;
		budgetrefcode = Integer.MIN_VALUE;
		materialrefcode = Integer.MIN_VALUE;
		transport_department = Integer.MIN_VALUE;
		departmentrefcode = Integer.MIN_VALUE;
                eikindcode = Integer.MIN_VALUE; 
		sheetVolumesRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENFuelSheetVolItemData

