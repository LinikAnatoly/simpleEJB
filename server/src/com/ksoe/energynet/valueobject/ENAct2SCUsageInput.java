//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENAct2SCUsageInput;
 */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENActRef;
import com.ksoe.energynet.valueobject.references.SCUsageInputRef;

public class ENAct2SCUsageInput implements Serializable {

	public int code = Integer.MIN_VALUE;
	public ENActRef actRef = new ENActRef();
	public SCUsageInputRef scUsageInputRef = new SCUsageInputRef();
	public static final String tableName = "ENACT2SCUSAGEINPUT";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENACT2SCUSAGEINPUT.CODE";
	public static final String actRef_Attr = "actRef";
	public static final String actRef_Field = "ACTREFCODE";
	public static final String actRef_QFielld = "ENACT2SCUSAGEINPUT.ACTREFCODE";
	public static final String scUsageInputRef_Attr = "scUsageInputRef";
	public static final String scUsageInputRef_Field = "SCUSAGEINPUTREFCODE";
	public static final String scUsageInputRef_QFielld = "ENACT2SCUSAGEINPUT.SCUSAGEINPUTREFCODE";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setActRef(ENActRef aValue) {
		actRef = aValue;
	}

	public ENActRef getActRef() {
		return actRef;
	}

	public void setScUsageInputRef(SCUsageInputRef aValue) {
		scUsageInputRef = aValue;
	}

	public SCUsageInputRef getScUsageInputRef() {
		return scUsageInputRef;
	}

} // end of ENAct2SCUsageInputValueObject

