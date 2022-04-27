
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

import java.io.Serializable;

public class ENPriorityCoeffType implements Serializable {


    /** Вага елементу у структурі обладн. РУ ПС (Yi) */
	public static final int ITEM_WEIGHT = 1;
    /** Вага конструкції у структурі оцін. РУ (Yi_ct) */
	public static final int STRUCTURE_WEIGHT = 2;



	public int code = Integer.MIN_VALUE;
	public String name;

	public static final String tableName = "ENPRIORITYCOEFFTYPE";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENPRIORITYCOEFFTYPE.CODE";
	public static final String name_Attr = "name";
	public static final String name_Field = "NAME";
	public static final String name_QFielld = "ENPRIORITYCOEFFTYPE.NAME";

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

} // end of ENPriorityCoeffTypeValueObject
