//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTechAgreement2ServicesObject;

/**
 * Filter for ENTechAgreement2ServicesObject;
 *
 */

public class ENTechAgreement2ServicesObjectFilter extends
		ENTechAgreement2ServicesObject {

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

	public ENTechAgreement2ServicesObjectFilter() {
		code = Integer.MIN_VALUE;
		partnerName = null;
		partnerCode = null;
		partnerOkpo = null;
		bankName = null;
		bankMfo = null;
		bankRSchet = null;
		contractNumber = null;
		contractDate = null;
		finDocCode = null;
		finDocID = Integer.MIN_VALUE;
		commentGen = null;
		objectName = null;
		costWorks = null;
		costWorksNDS = null;
		basisForAction = null;
		actNumber = null;
		actDate = null;
		executorTaxType = null;
		area = null;
		partnerPosition = null;
		partnerFIO = null;
                partnerAddress = null; 
		userGen = null;
		dateEdit = null;
		modify_time = Long.MIN_VALUE;
		contractTerm = null;
		servicesObjectRef.code = Integer.MIN_VALUE;
		agreementWarrantRef.code = Integer.MIN_VALUE;
		actWarrantRef.code = Integer.MIN_VALUE;
		servicesFromSideRef.code = Integer.MIN_VALUE;
		techAgrKindRef.code = Integer.MIN_VALUE;
		generalContractRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENTechAgreement2ServicesObject

