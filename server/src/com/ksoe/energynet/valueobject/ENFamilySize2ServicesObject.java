//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENFamilySize2ServicesObject;
 */

import java.io.Serializable;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENFamilyRelationRef;
import com.ksoe.energynet.valueobject.references.ENServicesObjectRef;

public class ENFamilySize2ServicesObject implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String FIO;
	public String userGen;
	public Date dateEdit;
	public long modify_time = Long.MIN_VALUE;
	public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
	public ENFamilyRelationRef relationRef = new ENFamilyRelationRef();

	public static final String tableName = "ENFAMILYSIZE2SRVCSBJCT";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENFAMILYSIZE2SRVCSBJCT.CODE";
	public static final String FIO_Attr = "FIO";
	public static final String FIO_Field = "FIO";
	public static final String FIO_QFielld = "ENFAMILYSIZE2SRVCSBJCT.FIO";
	public static final String userGen_Attr = "userGen";
	public static final String userGen_Field = "USERGEN";
	public static final String userGen_QFielld = "ENFAMILYSIZE2SRVCSBJCT.USERGEN";
	public static final String dateEdit_Attr = "dateEdit";
	public static final String dateEdit_Field = "DATEEDIT";
	public static final String dateEdit_QFielld = "ENFAMILYSIZE2SRVCSBJCT.DATEEDIT";
	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "ENFAMILYSIZE2SRVCSBJCT.MODIFY_TIME";
	public static final String servicesObjectRef_Attr = "servicesObjectRef";
	public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
	public static final String servicesObjectRef_QFielld = "ENFAMILYSIZE2SRVCSBJCT.SERVICESOBJECTREFCODE";
	public static final String relationRef_Attr = "relationRef";
	public static final String relationRef_Field = "RELATIONREFCODE";
	public static final String relationRef_QFielld = "ENFAMILYSIZE2SRVCSBJCT.RELATIONREFCODE";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setFIO(String aValue) {
		FIO = aValue;
	}

	public String getFIO() {
		return FIO;
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

	public void setServicesObjectRef(ENServicesObjectRef aValue) {
		servicesObjectRef = aValue;
	}

	public ENServicesObjectRef getServicesObjectRef() {
		return servicesObjectRef;
	}

	public void setRelationRef(ENFamilyRelationRef aValue) {
		relationRef = aValue;
	}

	public ENFamilyRelationRef getRelationRef() {
		return relationRef;
	}

} // end of ENFamilySize2ServicesObjectValueObject

