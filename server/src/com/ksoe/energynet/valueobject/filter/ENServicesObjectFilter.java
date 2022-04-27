
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENServicesObject;

/**
 * Filter for ENServicesObject;
 *
 */

public class ENServicesObjectFilter extends ENServicesObject {

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

	public ENServicesObjectFilter() {
		code = Integer.MIN_VALUE;
		contractNumber = null;
		contractDate = null;
		name = null;
		partnerCode = null;
		finDocCode = null;
		finDocID = Integer.MIN_VALUE;
		commentGen = null;
		contractNumberServices = null;
		contractDateServices = null;
		contragentName = null;
		contragentAddress = null;
		contragentAddressWork = null;
		contragentOkpo = null;
		contragentBankAccount = null;
		contragentBankName = null;
		contragentBankMfo = null;
		contragentBossName = null;
		contragentPassport = null;
		contractServicesSumma = null;
		contractServicesSummaVAT = null;
		contractServicesPower = null;
		commentServicesGen = null;
		contractServicesDistance = null;
		contractServicesDay = null;
		userGen = null;
		dateEdit = null;
		warrantDate = null;
		warrantNumber = null;
		warrantFIO = null;
		regionalType = Integer.MIN_VALUE;
		basisType = null;
		contragentPosition = null;
		executeWorkDate = null;
		timeStart = null;
		timeFinal = null;
		contragentPhoneNumber = null;
		executorPhoneNumber = null;
		contragentObjectWork = null;
		isNoPay = Integer.MIN_VALUE;
		isCustomerMaterials = Integer.MIN_VALUE;
		payDate = null;
		finPayFormCode = Integer.MIN_VALUE;
		finPayFormName = null;
		partnerId = Integer.MIN_VALUE;
		payDetail = null;
		actTransferNumber = null;
		actTransferDate = null;
		resposible = null;
		resposiblePosition = null;
		resposibleTabNumber = null;
		prevContractStatus = Integer.MIN_VALUE;
		reconnectionTU = Integer.MIN_VALUE;
		personalAccountCode = Integer.MIN_VALUE;
		personalAccountNumber = null;
		tabNumber = null;
		citiesList = null;
		lineLength = null;
		projectCode = null;
		domain_info = null;
		modify_time = Long.MIN_VALUE;
		cnPackCode = Integer.MIN_VALUE;
		dfPackCode = Integer.MIN_VALUE;
		countersZoneType = Integer.MIN_VALUE;
		axPartnerCode = null;
		axPartnerName = null;
		axContractNumber = null;
		axContractDate = null;
		axContractCode = null;
		axContractId = null;
		axContractCommentGen = null;
		projAgreeSumma = null;
		topographySumma = null;
		createdFromSite = Integer.MIN_VALUE;
		term = Integer.MIN_VALUE;
		regulation = Integer.MIN_VALUE;
		boundaryDateWork = null;
		countDayDelay = Integer.MIN_VALUE;
		factDateWork = null;
		calcSumsByCalculations = null;
		codeEIC = null;
		personalAccountUid = null;
		customerMailingAddress = null;
		powerGeneration = null;
		postCode = null;
                customerEmail = null; 
                demographicCode = null; 
                ownershipRecordNumber = null; 
                realEstateRegNumber = null; 
		department.code = Integer.MIN_VALUE;
		element.code = Integer.MIN_VALUE;
		contractStatusRef.code = Integer.MIN_VALUE;
		contractTypeRef.code = Integer.MIN_VALUE;
		contragentTypeRef.code = Integer.MIN_VALUE;
		billStatusRef.code = Integer.MIN_VALUE;
		warrantRef.code = Integer.MIN_VALUE;
		statusRef.code = Integer.MIN_VALUE;
		techConObjects.code = Integer.MIN_VALUE;
		contractKindRef.code = Integer.MIN_VALUE;
		cnSubsystemTypeRef.code = Integer.MIN_VALUE;
		calcTypeRef.code = Integer.MIN_VALUE;
		siteRef.code = Integer.MIN_VALUE;
		generalContractRef.code = Integer.MIN_VALUE;
		isActive = Integer.MIN_VALUE;
		actIncomeCreatMetodRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENServicesObject
