//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENConnectionLevel;
 */

import java.io.Serializable;

public class ENConnectionLevel implements Serializable {

	/** � ������ (�� 16 ���) */
	public static final int ENCONNECTIONLEVEL_FIRST = 1;
	/** I� ������ (�� 16 ��� �� 50 ���) */
	public static final int ENCONNECTIONLEVEL_SECOND = 2;
	/** I�I ������ (�� 50 ��� �� 160 ���) */
	public static final int ENCONNECTIONLEVEL_THIRD = 3;



	public int code = Integer.MIN_VALUE;
	public String name;
	public static final String tableName = "ENCONNECTIONLEVEL";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENCONNECTIONLEVEL.CODE";
	public static final String name_Attr = "name";
	public static final String name_Field = "NAME";
	public static final String name_QFielld = "ENCONNECTIONLEVEL.NAME";

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

} // end of ENConnectionLevelValueObject

