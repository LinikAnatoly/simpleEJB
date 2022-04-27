
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

import com.ksoe.energynet.valueobject.ENTechConditionsObjects;

/**
 * Filter for ENTechConditionsObjects;
 *
 */


@XmlRootElement(name = "ENTechConditionsObjectsFilter")
@XmlAccessorType(XmlAccessType.FIELD)
public class ENTechConditionsObjectsFilter extends ENTechConditionsObjects {

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

	public ENTechConditionsObjectsFilter() {
		code = Integer.MIN_VALUE;
		numberGen = null;
		dateGen = null;
		customer = null;
		building = null;
		address = null;
		tyCurrentPower = null;
		tyServicesPower = null;
		connectionPowerPlaces = null;
		connectionPowerPlacesNum = null;
		connectionPowerPoint = null;
		connectionPowerPointNum = null;
		connectionSource = null;
		connectionSourceNum = null;
		cat1CurrentPower = null;
		cat2CurrentPower = null;
		cat3CurrentPower = null;
		cat1ServicesPower = null;
		cat2ServicesPower = null;
		cat3ServicesPower = null;
		tyServicesPowerWaterHeating = null;
		tyServicesPowerHeating = null;
		tyServicesPowerCooker = null;
		voltageCurrent = Integer.MIN_VALUE;
		voltageServices = Integer.MIN_VALUE;
		powerGeneration = null;
		yearGen = Integer.MIN_VALUE;
		performer = null;
		performerPhone = null;
		userGen = null;
		dateEdit = null;
		domain_info = null;
		modify_time = Long.MIN_VALUE;
		securityZone = Integer.MIN_VALUE;
		objectSecurityZone = null;
		identNumber = Integer.MIN_VALUE;
		dateChangeTU = null;
		element.code = Integer.MIN_VALUE;
		department.code = Integer.MIN_VALUE;
		categoryRef.code = Integer.MIN_VALUE;
		powerPointRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for ENTechConditionsObjects
