//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENRentPeriod2Services;
 */

import java.io.Serializable;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENCottageRef;
import com.ksoe.energynet.valueobject.references.ENRentPeriodStatusRef;
import com.ksoe.energynet.valueobject.references.ENServicesObjectRef;

public class ENRentPeriod2Services implements Serializable {

	public int code = Integer.MIN_VALUE;
	public Date startDate;
	public Date endDate;
	public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
	public ENCottageRef cottageRef = new ENCottageRef();
	public ENRentPeriodStatusRef statusRef = new ENRentPeriodStatusRef();

	public static final String tableName = "ENRENTPERIOD2SERVICES";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENRENTPERIOD2SERVICES.CODE";
	public static final String startDate_Attr = "startDate";
	public static final String startDate_Field = "STARTDATE";
	public static final String startDate_QFielld = "ENRENTPERIOD2SERVICES.STARTDATE";
	public static final String endDate_Attr = "endDate";
	public static final String endDate_Field = "ENDDATE";
	public static final String endDate_QFielld = "ENRENTPERIOD2SERVICES.ENDDATE";
	public static final String servicesObjectRef_Attr = "servicesObjectRef";
	public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
	public static final String servicesObjectRef_QFielld = "ENRENTPERIOD2SERVICES.SERVICESOBJECTREFCODE";
	public static final String cottageRef_Attr = "cottageRef";
	public static final String cottageRef_Field = "COTTAGEREFCODE";
	public static final String cottageRef_QFielld = "ENRENTPERIOD2SERVICES.COTTAGEREFCODE";
	public static final String statusRef_Attr = "statusRef";
	public static final String statusRef_Field = "STATUSREFCODE";
	public static final String statusRef_QFielld = "ENRENTPERIOD2SERVICES.STATUSREFCODE";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setStartDate(Date aValue) {
		startDate = aValue;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setEndDate(Date aValue) {
		endDate = aValue;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setServicesObjectRef(ENServicesObjectRef aValue) {
		servicesObjectRef = aValue;
	}

	public ENServicesObjectRef getServicesObjectRef() {
		return servicesObjectRef;
	}

	public void setCottageRef(ENCottageRef aValue) {
		cottageRef = aValue;
	}

	public ENCottageRef getCottageRef() {
		return cottageRef;
	}

	public void setStatusRef(ENRentPeriodStatusRef aValue) {
		statusRef = aValue;
	}

	public ENRentPeriodStatusRef getStatusRef() {
		return statusRef;
	}

} // end of ENRentPeriod2ServicesValueObject

