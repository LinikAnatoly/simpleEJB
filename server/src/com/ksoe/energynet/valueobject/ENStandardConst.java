//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENStandardConst;
 */

import java.io.Serializable;

public class ENStandardConst implements Serializable {


	/** ��� */
	public static final int PDV = 1;
	/** ��� ��������� */
	public static final int ESV_ALL = 2;
	/** ��� �������. */
	public static final int ESV_INV = 3;
	/** % ���쳿 */
	public static final int PERCENT_BONUS = 4;
	/** % ��������������. */
	public static final int PERCENT_COMPANY = 5;
	/** % ������� ��� �������� � ����� ��� ����� ��� ����� �� ������� ��� �����������  */
	public static final int PERCENT_ADDITIONAL_BONUS_FOR_ACT_WITHOUT_CALCULATION = 6;
	
	public int code = Integer.MIN_VALUE;
	public String name;
	public static final String tableName = "ENSTANDARDCONST";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENSTANDARDCONST.CODE";
	public static final String name_Attr = "name";
	public static final String name_Field = "NAME";
	public static final String name_QFielld = "ENSTANDARDCONST.NAME";

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

} // end of ENStandardConstValueObject

