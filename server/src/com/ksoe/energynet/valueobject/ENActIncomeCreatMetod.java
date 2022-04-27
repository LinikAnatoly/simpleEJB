
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

import java.io.Serializable;

public class ENActIncomeCreatMetod implements Serializable {


	/** закрытие работ по договору одним доходным актом */
	public static final int SINGLE = 1;
	/** закрытие работ по договору несколькими доходными актами */
	public static final int MORE_ONE = 2;


	public int code = Integer.MIN_VALUE;
	public String name;
	public static final String tableName = "ENACTINCOMECREATMETOD";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENACTINCOMECREATMETOD.CODE";
	public static final String name_Attr = "name";
	public static final String name_Field = "NAME";
	public static final String name_QFielld = "ENACTINCOMECREATMETOD.NAME";

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

} // end of ENActIncomeCreatMetodValueObject
