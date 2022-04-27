//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENPurchasesNoObjectTypeENPurchasesNoObjectType;
 */

import java.io.Serializable;

public class ENPurchasesNoObjectType implements Serializable {

	public static final int PURCHASES = 1;
	public static final int WRITING = 2;
	public static final int RESTOCKING = 4;
	public static final int GIFT = 6;
	public static final int AVR16 = 7;
	public static final int AVZ = 8;

	/** Закупівля лічильників для послуг */
	public static final int COUNTERS_SERVICES = 9;
	
	public static final int MOVED_WORKS = 11;


	public int code = Integer.MIN_VALUE;
	public String name;
	public static final String tableName = "ENPURCHASESNOOBJECTTYP";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENPURCHASESNOOBJECTTYP.CODE";
	public static final String name_Attr = "name";
	public static final String name_Field = "NAME";
	public static final String name_QFielld = "ENPURCHASESNOOBJECTTYP.NAME";

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

} // end of ENPurchasesNoObjectTypeValueObject

