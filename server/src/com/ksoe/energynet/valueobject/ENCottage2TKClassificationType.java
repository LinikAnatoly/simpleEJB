//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENCottage2TKClassificationType;
 */

import java.io.Serializable;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENCottageRef;
import com.ksoe.techcard.valueobject.references.TKClassificationTypeRef;

public class ENCottage2TKClassificationType implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String userGen;
	public Date dateEdit;
	public long modify_time = Long.MIN_VALUE;
	public TKClassificationTypeRef classificationTypeRef = new TKClassificationTypeRef();
	public ENCottageRef cottageRef = new ENCottageRef();

	public static final String tableName = "ENCOTTAGE2TKCLSSFCTNTP";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENCOTTAGE2TKCLSSFCTNTP.CODE";
	public static final String userGen_Attr = "userGen";
	public static final String userGen_Field = "USERGEN";
	public static final String userGen_QFielld = "ENCOTTAGE2TKCLSSFCTNTP.USERGEN";
	public static final String dateEdit_Attr = "dateEdit";
	public static final String dateEdit_Field = "DATEEDIT";
	public static final String dateEdit_QFielld = "ENCOTTAGE2TKCLSSFCTNTP.DATEEDIT";
	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "ENCOTTAGE2TKCLSSFCTNTP.MODIFY_TIME";
	public static final String classificationTypeRef_Attr = "classificationTypeRef";
	public static final String classificationTypeRef_Field = "CLASSIFICATIONTYPERFCD";
	public static final String classificationTypeRef_QFielld = "ENCOTTAGE2TKCLSSFCTNTP.CLASSIFICATIONTYPERFCD";
	public static final String cottageRef_Attr = "cottageRef";
	public static final String cottageRef_Field = "COTTAGEREFCODE";
	public static final String cottageRef_QFielld = "ENCOTTAGE2TKCLSSFCTNTP.COTTAGEREFCODE";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
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

	public void setClassificationTypeRef(TKClassificationTypeRef aValue) {
		classificationTypeRef = aValue;
	}

	public TKClassificationTypeRef getClassificationTypeRef() {
		return classificationTypeRef;
	}

	public void setCottageRef(ENCottageRef aValue) {
		cottageRef = aValue;
	}

	public ENCottageRef getCottageRef() {
		return cottageRef;
	}

} // end of ENCottage2TKClassificationTypeValueObject

