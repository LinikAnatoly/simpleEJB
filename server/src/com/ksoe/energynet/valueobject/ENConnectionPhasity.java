//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENConnectionPhasity;
 */

import java.io.Serializable;

public class ENConnectionPhasity implements Serializable {

	/** однофазне приєднання */
	public static final int I = 1;

	/** трифазне приєднання */
	public static final int III = 3;


	public int code = Integer.MIN_VALUE;
	public String name;
	public static final String tableName = "ENCONNECTIONPHASITY";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENCONNECTIONPHASITY.CODE";
	public static final String name_Attr = "name";
	public static final String name_Field = "NAME";
	public static final String name_QFielld = "ENCONNECTIONPHASITY.NAME";

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

} // end of ENConnectionPhasityValueObject

