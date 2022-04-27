//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

/**
 * Short Object for ENFamilyRelation;
 */

import java.io.Serializable;

public class ENFamilyRelationShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String relation;

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

}