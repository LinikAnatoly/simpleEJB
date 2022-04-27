
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENAgreementKindRef;
import com.ksoe.energynet.valueobject.references.ENDepartmentRef;
import com.ksoe.energynet.valueobject.references.ENWarrantRef;

public class ENWarrant4Department implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String userGen;
	public long modify_time = Long.MIN_VALUE;

	public ENAgreementKindRef agreementKindRef = new ENAgreementKindRef();
	public ENWarrantRef warrantRef = new ENWarrantRef();
	public ENDepartmentRef departmentRef = new ENDepartmentRef();

	public static final String tableName = "ENWARRANT4DEPARTMENT";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENWARRANT4DEPARTMENT.CODE";
	public static final String userGen_Attr = "userGen";
	public static final String userGen_Field = "USERGEN";
	public static final String userGen_QFielld = "ENWARRANT4DEPARTMENT.USERGEN";
	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "ENWARRANT4DEPARTMENT.MODIFY_TIME";

	public static final String agreementKindRef_Attr = "agreementKindRef";
	public static final String agreementKindRef_Field = "AGREEMENTKINDREFCODE";
	public static final String agreementKindRef_QFielld = "ENWARRANT4DEPARTMENT.AGREEMENTKINDREFCODE";
	public static final String warrantRef_Attr = "warrantRef";
	public static final String warrantRef_Field = "WARRANTREFCODE";
	public static final String warrantRef_QFielld = "ENWARRANT4DEPARTMENT.WARRANTREFCODE";
	public static final String departmentRef_Attr = "departmentRef";
	public static final String departmentRef_Field = "DEPARTMENTREFCODE";
	public static final String departmentRef_QFielld = "ENWARRANT4DEPARTMENT.DEPARTMENTREFCODE";

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getUserGen() {
		return userGen;
	}

	public void setUserGen(String userGen) {
		this.userGen = userGen;
	}

	public long getModify_time() {
		return modify_time;
	}

	public void setModify_time(long modify_time) {
		this.modify_time = modify_time;
	}

	public ENAgreementKindRef getAgreementKindRef() {
		return agreementKindRef;
	}

	public void setAgreementKindRef(ENAgreementKindRef agreementKindRef) {
		this.agreementKindRef = agreementKindRef;
	}

	public ENWarrantRef getWarrantRef() {
		return warrantRef;
	}

	public void setWarrantRef(ENWarrantRef warrantRef) {
		this.warrantRef = warrantRef;
	}

	public ENDepartmentRef getDepartmentRef() {
		return departmentRef;
	}

	public void setDepartmentRef(ENDepartmentRef departmentRef) {
		this.departmentRef = departmentRef;
	}

} // end of ENWarrant4DepartmentValueObject
