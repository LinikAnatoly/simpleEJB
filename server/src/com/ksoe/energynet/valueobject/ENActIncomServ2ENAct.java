
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

import java.io.Serializable;

/**
* Value Object for ENActIncomServ2ENAct;
*/

import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.references.ENActIncomeServicesRef;
import com.ksoe.energynet.valueobject.references.ENActRef;

public class ENActIncomServ2ENAct implements Serializable {

	public int code = Integer.MIN_VALUE;
	public BigDecimal summaGen;
	public ENActIncomeServicesRef actIncomeRef = new ENActIncomeServicesRef();
	public ENActRef actRef = new ENActRef();
	public static final String tableName = "ENACTINCOMSERV2ENACT";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENACTINCOMSERV2ENACT.CODE";
	public static final String summaGen_Attr = "summaGen";
	public static final String summaGen_Field = "SUMMAGEN";
	public static final String summaGen_QFielld = "ENACTINCOMSERV2ENACT.SUMMAGEN";
	public static final String actIncomeRef_Attr = "actIncomeRef";
	public static final String actIncomeRef_Field = "ACTINCOMEREFCODE";
	public static final String actIncomeRef_QFielld = "ENACTINCOMSERV2ENACT.ACTINCOMEREFCODE";
	public static final String actRef_Attr = "actRef";
	public static final String actRef_Field = "ACTREFCODE";
	public static final String actRef_QFielld = "ENACTINCOMSERV2ENACT.ACTREFCODE";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setSummaGen(BigDecimal aValue) {
		summaGen = aValue;
	}

	public BigDecimal getSummaGen() {
		return summaGen;
	}

	public void setActIncomeRef(ENActIncomeServicesRef aValue) {
		actIncomeRef = aValue;
	}

	public ENActIncomeServicesRef getActIncomeRef() {
		return actIncomeRef;
	}

	public void setActRef(ENActRef aValue) {
		actRef = aValue;
	}

	public ENActRef getActRef() {
		return actRef;
	}

} // end of ENActIncomServ2ENActValueObject
