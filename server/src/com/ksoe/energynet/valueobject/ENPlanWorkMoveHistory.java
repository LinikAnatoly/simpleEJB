//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENPlanWorkMoveHistoryENPlanWorkMoveHistory;
 */

import java.io.Serializable;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENPlanWorkRef;

public class ENPlanWorkMoveHistory implements Serializable {

	public int code = Integer.MIN_VALUE;
	public Date dateGen;
	public int yearGen = Integer.MIN_VALUE;
	public int monthGen = Integer.MIN_VALUE;
	public String commentGen;
	public String userGen;
	public Date dateEdit;
	public long modify_time = Long.MIN_VALUE;
	public ENPlanWorkMoveReason reason = new ENPlanWorkMoveReason();
	public ENPlanWorkRef planRef = new ENPlanWorkRef();

	public static final String tableName = "ENPLANWORKMOVEHISTORY";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENPLANWORKMOVEHISTORY.CODE";
	public static final String dateGen_Attr = "dateGen";
	public static final String dateGen_Field = "DATEGEN";
	public static final String dateGen_QFielld = "ENPLANWORKMOVEHISTORY.DATEGEN";
	public static final String yearGen_Attr = "yearGen";
	public static final String yearGen_Field = "YEARGEN";
	public static final String yearGen_QFielld = "ENPLANWORKMOVEHISTORY.YEARGEN";
	public static final String monthGen_Attr = "monthGen";
	public static final String monthGen_Field = "MONTHGEN";
	public static final String monthGen_QFielld = "ENPLANWORKMOVEHISTORY.MONTHGEN";
	public static final String commentGen_Attr = "commentGen";
	public static final String commentGen_Field = "COMMENTGEN";
	public static final String commentGen_QFielld = "ENPLANWORKMOVEHISTORY.COMMENTGEN";
	public static final String userGen_Attr = "userGen";
	public static final String userGen_Field = "USERGEN";
	public static final String userGen_QFielld = "ENPLANWORKMOVEHISTORY.USERGEN";
	public static final String dateEdit_Attr = "dateEdit";
	public static final String dateEdit_Field = "DATEEDIT";
	public static final String dateEdit_QFielld = "ENPLANWORKMOVEHISTORY.DATEEDIT";
	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "ENPLANWORKMOVEHISTORY.MODIFY_TIME";
	public static final String reason_Attr = "reason";
	public static final String reason_Field = "REASONCODE";
	public static final String reason_QFielld = "ENPLANWORKMOVEHISTORY.REASONCODE";
	public static final String planRef_Attr = "planRef";
	public static final String planRef_Field = "PLANREFCODE";
	public static final String planRef_QFielld = "ENPLANWORKMOVEHISTORY.PLANREFCODE";

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

	public void setYearGen(int aValue) {
		yearGen = aValue;
	}

	public int getYearGen() {
		return yearGen;
	}

	public void setMonthGen(int aValue) {
		monthGen = aValue;
	}

	public int getMonthGen() {
		return monthGen;
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

	public void setReason(ENPlanWorkMoveReason aValue) {
		reason = aValue;
	}

	public ENPlanWorkMoveReason getReason() {
		return reason;
	}

	public void setPlanRef(ENPlanWorkRef aValue) {
		planRef = aValue;
	}

	public ENPlanWorkRef getPlanRef() {
		return planRef;
	}

} // end of ENPlanWorkMoveHistoryValueObject

