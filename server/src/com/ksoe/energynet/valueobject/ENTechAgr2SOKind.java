
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

import java.io.Serializable;

public class ENTechAgr2SOKind implements Serializable {


	/** Тип договору про надання послуг до договору про приєднання */
	/** Технічний нагляд */
	public static final int ENTECHAGRKIND_TA = 1;
	/** Земля */
	public static final int ENTECHAGRKIND_GL = 2;
	/** Договір підряду для розробки ПКД */
	public static final int ENTECHAGRKIND_PKD = 3;


	public int code = Integer.MIN_VALUE;
	public String name;
	public static final String tableName = "ENTECHAGR2SOKIND";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENTECHAGR2SOKIND.CODE";
	public static final String name_Attr = "name";
	public static final String name_Field = "NAME";
	public static final String name_QFielld = "ENTECHAGR2SOKIND.NAME";

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

} // end of ENTechAgr2SOKindValueObject
