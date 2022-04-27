//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.CNPack;

/**
 * Filter for CNPack;
 *
 */

public class CNPackFilter extends CNPack {

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

	public CNPackFilter() {
		code = Integer.MIN_VALUE;
		packCode = Integer.MIN_VALUE;
		name = null;
		id_ren = Integer.MIN_VALUE;
		renName = null;
		id_district = Integer.MIN_VALUE;
		districtName = null;
		id_pack_status = Integer.MIN_VALUE;
		statusName = null;
		description = null;
		power = null;
		address = null;
		address_jur = null;
		reg_num_cn_contract = null;
		date_cn_contract = null;
		reg_num_spl_pp_contract = null;
		date_spl_pp_contract = null;
		reg_num_tu_contract = null;
		date_tu_contract = null;
		reg_num_tu_cr_contract = null;
		date_tu_cr_contract = null;
		project_num = null;
		project_date = null;
		over5 = Integer.MIN_VALUE;
		status = Integer.MIN_VALUE;
		letter_num_customer = null;
		date_letter_customer = null;
		letter_num = null;
		date_letter = null;
		reliability_class = null;
		id_waiting_status = Integer.MIN_VALUE;
		waitingStatus = null;
		is_payable = Integer.MIN_VALUE;
		worksize = null;
		work_inc_net = null;
		business_type = null;
		estimateterm = Integer.MIN_VALUE;
		estimatedate = null;
		buildingterm = Integer.MIN_VALUE;
		buildingdate = null;
		buyingterm = Integer.MIN_VALUE;
		buyingdate = null;
		estimate_num = null;
		estimate_contract_date = null;
		is_reserv = Integer.MIN_VALUE;
		purpose = null;
		is_ksoe = Integer.MIN_VALUE;
		over150 = Integer.MIN_VALUE;
		is_new = Integer.MIN_VALUE;
		is3phases = Integer.MIN_VALUE;
		id_feature = Integer.MIN_VALUE;
		subsystemRef.code = Integer.MIN_VALUE;
		airLine04Ref.code = Integer.MIN_VALUE;
		cableLine04Ref.code = Integer.MIN_VALUE;
		trRef.code = Integer.MIN_VALUE;
		s04Ref.code = Integer.MIN_VALUE;
		airLine10Ref.code = Integer.MIN_VALUE;
		cableLine10Ref.code = Integer.MIN_VALUE;
		s35Ref.code = Integer.MIN_VALUE;
		airLine150Ref.code = Integer.MIN_VALUE;
		cableLine150Ref.code = Integer.MIN_VALUE;
		s150Ref.code = Integer.MIN_VALUE;
	}

} // end of Filter for CNPack

