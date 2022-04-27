//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENRentPeriodStatus;
 */

import java.io.Serializable;

public class ENRentPeriodStatus implements Serializable {

	/** ĳ����� */
    public static final int VALID = 1;

    /** ���������� */
    public static final int CANCELED = 2;


	public int code = Integer.MIN_VALUE;
	public String name;

	public static final String tableName = "ENRENTPERIODSTATUS";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENRENTPERIODSTATUS.CODE";
	public static final String name_Attr = "name";
	public static final String name_Field = "NAME";
	public static final String name_QFielld = "ENRENTPERIODSTATUS.NAME";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setName(String aValue) {
		name = aValue;
	}

	public String getName() {
		return name;
	}

} // end of ENRentPeriodStatusValueObject

