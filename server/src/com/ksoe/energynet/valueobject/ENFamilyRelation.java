//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENFamilyRelation;
 */

import java.io.Serializable;

public class ENFamilyRelation implements Serializable {

	/** інші члени родини */
	public static final int OTHER = 5;


	public int code = Integer.MIN_VALUE;
	public String relation;

	public static final String tableName = "ENFAMILYRELATION";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENFAMILYRELATION.CODE";
	public static final String relation_Attr = "relation";
	public static final String relation_Field = "RELATION";
	public static final String relation_QFielld = "ENFAMILYRELATION.RELATION";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setRelation(String aValue) {
		relation = aValue;
	}

	public String getRelation() {
		return relation;
	}

} // end of ENFamilyRelationValueObject

