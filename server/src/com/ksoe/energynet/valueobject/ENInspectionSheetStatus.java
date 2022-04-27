
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

import java.io.Serializable;

public class ENInspectionSheetStatus implements Serializable {

	/** чорновий */
	public static final int DRAFT = 0;
	/** на підписанні */
	public static final int ON_SIGNATURE = 1;
	/** підписаний */
	public static final int SIGNED = 2;



	public int code = Integer.MIN_VALUE;
	public String name;
	public static final String tableName = "ENINSPECTIONSHEETSTATS";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENINSPECTIONSHEETSTATS.CODE";
	public static final String name_Attr = "name";
	public static final String name_Field = "NAME";
	public static final String name_QFielld = "ENINSPECTIONSHEETSTATS.NAME";

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

} // end of ENInspectionSheetStatusValueObject
