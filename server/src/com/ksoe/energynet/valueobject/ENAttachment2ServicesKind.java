//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENAttachment2ServicesKind;
 */

import java.io.Serializable;

public class ENAttachment2ServicesKind implements Serializable {

	/** общий документ */
	public static final int GENERAL_DOC = 1;

	/** ini-файл для договора о присоединении */
	public static final int SYSTEM_DOC = 2;
	
	/** вложения договора о присоединении из CN*/
	public static final int CN_OLD_DOCS = 3;


	public int code = Integer.MIN_VALUE;
	public String name;
	public static final String tableName = "ENATTACHMENT2SERVCSKND";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENATTACHMENT2SERVCSKND.CODE";
	public static final String name_Attr = "name";
	public static final String name_Field = "NAME";
	public static final String name_QFielld = "ENATTACHMENT2SERVCSKND.NAME";

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

} // end of ENAttachment2ServicesKindValueObject

