//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENMOL2PlanWorkENMOL2PlanWork;
 */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENPlanWorkRef;

public class ENMOL2PlanWork implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String molName;
	public String molCode;

	public long modify_time = Long.MIN_VALUE;
	public ENPlanWorkRef planRef = new ENPlanWorkRef();
	public static final String tableName = "ENMOL2PLANWORK";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENMOL2PLANWORK.CODE";
	public static final String molName_Attr = "molName";
	public static final String molName_Field = "MOLNAME";
	public static final String molName_QFielld = "ENMOL2PLANWORK.MOLNAME";
	public static final String molCode_Attr = "molCode";
	public static final String molCode_Field = "MOLCODE";
	public static final String molCode_QFielld = "ENMOL2PLANWORK.MOLCODE";

	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "ENMOL2PLANWORK.MODIFY_TIME";
	public static final String planRef_Attr = "planRef";
	public static final String planRef_Field = "PLANREFCODE";
	public static final String planRef_QFielld = "ENMOL2PLANWORK.PLANREFCODE";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setMolName(String aValue) {
		molName = aValue;
	}

	public String getMolName() {
		return molName;
	}

	public void setMolCode(String aValue) {
		molCode = aValue;
	}

	public String getMolCode() {
		return molCode;
	}

	public void setModify_time(long aValue) {
		modify_time = aValue;
	}

	public long getModify_time() {
		return modify_time;
	}

	public void setPlanRef(ENPlanWorkRef aValue) {
		planRef = aValue;
	}

	public ENPlanWorkRef getPlanRef() {
		return planRef;
	}

} // end of ENMOL2PlanWorkValueObject

