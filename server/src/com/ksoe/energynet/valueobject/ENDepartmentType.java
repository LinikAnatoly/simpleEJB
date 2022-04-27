
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
* Value Object for ENDepartmentTypeENDepartmentType;
*/

import java.io.Serializable;

public class ENDepartmentType implements Serializable {

	public static final int BUDGET = 200;
	public static final int RESPONSIBILITY_CENTER = 100;
	public static final int DEPARTMENT = 1;

	/** Департамент */
	public static final int DIVISION = 400;



	public int code = Integer.MIN_VALUE;
	public String name;
	public static final String tableName = "ENDEPARTMENTTYPE";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENDEPARTMENTTYPE.CODE";
	public static final String name_Attr = "name";
	public static final String name_Field = "NAME";
	public static final String name_QFielld = "ENDEPARTMENTTYPE.NAME";

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

	;

} // end of ENDepartmentTypeValueObject
