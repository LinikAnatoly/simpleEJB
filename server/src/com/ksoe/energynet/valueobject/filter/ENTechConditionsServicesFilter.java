//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTechConditionsServices;

/**
 * Filter for ENTechConditionsServices;
 *
 */

public class ENTechConditionsServicesFilter extends ENTechConditionsServices {

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

	public ENTechConditionsServicesFilter() {
		code = Integer.MIN_VALUE;
		contractNumber = null;
		contractDate = null;
		finContractNumber = null;
		finContractDate = null;
		partnerName = null;
		partnerCode = null;
		finDocCode = null;
		finDocID = Integer.MIN_VALUE;
		finCommentGen = null;
		tySummaGen = null;
		tySummaVat = null;
		tyServicesSumma = null;
		tyServicesPower = null;
		commentServicesGen = null;
		userGen = null;
		dateEdit = null;
		cnPackCode = Integer.MIN_VALUE;
		executionTerm = null;
		buildersArea = Integer.MIN_VALUE;
		baseStation = Integer.MIN_VALUE;
		smallArchFrm = Integer.MIN_VALUE;
		contractDateFinal = null;
		isSea = Integer.MIN_VALUE;
		isDisconnectionNeeded = Integer.MIN_VALUE;
		isUse2Tariffs = Integer.MIN_VALUE;
		domain_info = null;
		modify_time = Long.MIN_VALUE;
		element.code = Integer.MIN_VALUE;
		department.code = Integer.MIN_VALUE;
		warrantRef.code = Integer.MIN_VALUE;
		techCondServicesStatus.code = Integer.MIN_VALUE;
		techCondServicesType.code = Integer.MIN_VALUE;
		contragentForm.code = Integer.MIN_VALUE;
		techCondResponsiblesRef.code = Integer.MIN_VALUE;
		cnSubsystemTypeRef.code = Integer.MIN_VALUE;
		contragentTypeRef.code = Integer.MIN_VALUE;
		connectionKindRef.code = Integer.MIN_VALUE;
		tariffEntryRef.code = Integer.MIN_VALUE;
		calcTypeRef.code = Integer.MIN_VALUE;
		generalContractRef.code = Integer.MIN_VALUE;
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

} // end of Filter for ENTechConditionsServices

