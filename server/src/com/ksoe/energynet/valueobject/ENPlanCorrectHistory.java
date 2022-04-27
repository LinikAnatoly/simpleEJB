//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENPlanCorrectHistoryENPlanCorrectHistory;
 */

import java.io.Serializable;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENPlanWorkRef;

public class ENPlanCorrectHistory implements Serializable {

	public int code = Integer.MIN_VALUE;
	public Date dateGen;
	public String commentGen;
	public String userGen;
	public Date dateEdit;

	public long modify_time = Long.MIN_VALUE;
	public ENPlanWorkRef planRef = new ENPlanWorkRef();
	public ENPlanWorkRef planOldRef = new ENPlanWorkRef();
	public ENPlanWorkRef planNewRef = new ENPlanWorkRef();
	public ENPlanCorrectReason reason = new ENPlanCorrectReason();

	public static final String tableName = "ENPLANCORRECTHISTORY";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENPLANCORRECTHISTORY.CODE";
	public static final String dateGen_Attr = "dateGen";
	public static final String dateGen_Field = "DATEGEN";
	public static final String dateGen_QFielld = "ENPLANCORRECTHISTORY.DATEGEN";
	public static final String commentGen_Attr = "commentGen";
	public static final String commentGen_Field = "COMMENTGEN";
	public static final String commentGen_QFielld = "ENPLANCORRECTHISTORY.COMMENTGEN";
	public static final String userGen_Attr = "userGen";
	public static final String userGen_Field = "USERGEN";
	public static final String userGen_QFielld = "ENPLANCORRECTHISTORY.USERGEN";
	public static final String dateEdit_Attr = "dateEdit";
	public static final String dateEdit_Field = "DATEEDIT";
	public static final String dateEdit_QFielld = "ENPLANCORRECTHISTORY.DATEEDIT";

	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "ENPLANCORRECTHISTORY.MODIFY_TIME";
	public static final String planRef_Attr = "planRef";
	public static final String planRef_Field = "PLANREFCODE";
	public static final String planRef_QFielld = "ENPLANCORRECTHISTORY.PLANREFCODE";
	public static final String planOldRef_Attr = "planOldRef";
	public static final String planOldRef_Field = "PLANOLDREFCODE";
	public static final String planOldRef_QFielld = "ENPLANCORRECTHISTORY.PLANOLDREFCODE";
	public static final String planNewRef_Attr = "planNewRef";
	public static final String planNewRef_Field = "PLANNEWREFCODE";
	public static final String planNewRef_QFielld = "ENPLANCORRECTHISTORY.PLANNEWREFCODE";
	public static final String reason_Attr = "reason";
	public static final String reason_Field = "REASONCODE";
	public static final String reason_QFielld = "ENPLANCORRECTHISTORY.REASONCODE";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setDateGen(Date aValue) {
		dateGen = aValue;
	}

	public Date getDateGen() {
		return dateGen;
	}

	public void setCommentGen(String aValue) {
		commentGen = aValue;
	}

	public String getCommentGen() {
		return commentGen;
	}

	public void setUserGen(String aValue) {
		userGen = aValue;
	}

	public String getUserGen() {
		return userGen;
	}

	public void setDateEdit(Date aValue) {
		dateEdit = aValue;
	}

	public Date getDateEdit() {
		return dateEdit;
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

	public void setPlanOldRef(ENPlanWorkRef aValue) {
		planOldRef = aValue;
	}

	public ENPlanWorkRef getPlanOldRef() {
		return planOldRef;
	}

	public void setPlanNewRef(ENPlanWorkRef aValue) {
		planNewRef = aValue;
	}

	public ENPlanWorkRef getPlanNewRef() {
		return planNewRef;
	}

	public void setReason(ENPlanCorrectReason aValue) {
		reason = aValue;
	}

	public ENPlanCorrectReason getReason() {
		return reason;
	}

} // end of ENPlanCorrectHistoryValueObject

