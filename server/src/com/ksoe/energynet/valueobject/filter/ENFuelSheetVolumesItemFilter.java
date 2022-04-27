//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENFuelSheetVolumesItem;

/**
 * Filter for ENFuelSheetVolumesItem;
 *
 */

public class ENFuelSheetVolumesItemFilter extends ENFuelSheetVolumesItem {

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

	public ENFuelSheetVolumesItemFilter() {
		code = Integer.MIN_VALUE;
		depname = null;
		pmm_count_on_start = null;
		pmm_count_on_start_all = null;
		services_plan = null;
		services_fact = null;
		services_limit = null;
		current_repair_plan = null;
		current_repair_fact = null;
		capital_repair_plan = null;
		capital_repair_fact = null;
		maintenance_plan = null;
		maintenance_fact = null;
		sbyt_plan = null;
		sbyt_fact = null;
		other_plan = null;
		other_fact = null;
		maintenance_sbyt_repairs_and_other_limit = null;
		cap_build_ip_plan = null;
		cap_build_ip_fact = null;
		cap_builders_ip_limit = null;
		cap_build_other_plan = null;
		cap_build_other_fact = null;
		cap_builders_other_limit = null;
		vrtu_plan = null;
		vrtu_fact = null;
		vrtu_limit = null;
		avr_plan = null;
		avr_fact = null;
		avr_limit = null;
		odg_plan = null;
		odg_fact = null;
		all_limit = null;
		decode = null;
		mol_codes = null;
		datestart = null;
		datefinal = null;
		ord = Integer.MIN_VALUE;
		all_plan = null;
	    rest_from_fk = null;
	    rest_from_fk_avz = null;
            eikindcode = Integer.MIN_VALUE; 
		userGen = null;
		dateEdit = null;
		modify_time = Long.MIN_VALUE;
		sheetVolumesRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENFuelSheetVolumesItem

