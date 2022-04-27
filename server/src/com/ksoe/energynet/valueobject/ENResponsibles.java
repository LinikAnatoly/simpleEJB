//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENResponsibles;
 */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENResponsiblesKindRef;

public class ENResponsibles implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String FIO;
	public String tabNumber;
	public String position;
	public String depName;
	public String depCode;
	public String phone;


	public ENResponsiblesKindRef kindRef = new ENResponsiblesKindRef();
	public static final String tableName = "ENRESPONSIBLES";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENRESPONSIBLES.CODE";
	public static final String FIO_Attr = "FIO";
	public static final String FIO_Field = "FIO";
	public static final String FIO_QFielld = "ENRESPONSIBLES.FIO";
	public static final String tabNumber_Attr = "tabNumber";
	public static final String tabNumber_Field = "TABNUMBER";
	public static final String tabNumber_QFielld = "ENRESPONSIBLES.TABNUMBER";
	public static final String position_Attr = "position";
	public static final String position_Field = "POSITION";
	public static final String position_QFielld = "ENRESPONSIBLES.POSITION";
	public static final String depName_Attr = "depName";
	public static final String depName_Field = "DEPNAME";
	public static final String depName_QFielld = "ENRESPONSIBLES.DEPNAME";
	public static final String depCode_Attr = "depCode";
	public static final String depCode_Field = "DEPCODE";
	public static final String depCode_QFielld = "ENRESPONSIBLES.DEPCODE";
	public static final String phone_Attr = "phone";
	public static final String phone_Field = "PHONE";
	public static final String phone_QFielld = "ENRESPONSIBLES.PHONE";
	public static final String kindRef_Attr = "kindRef";
	public static final String kindRef_Field = "KINDREFCODE";
	public static final String kindRef_QFielld = "ENRESPONSIBLES.KINDREFCODE";

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

	public void setTabNumber(String aValue) {
		tabNumber = aValue;
	}

	public String getTabNumber() {
		return tabNumber;
	}

	public void setPosition(String aValue) {
		position = aValue;
	}

	public String getPosition() {
		return position;
	}

	public void setDepName(String aValue) {
		depName = aValue;
	}

	public String getDepName() {
		return depName;
	}

	public void setDepCode(String aValue) {
		depCode = aValue;
	}

	public String getDepCode() {
		return depCode;
	}

	public void setPhone(String aValue) {
		phone = aValue;
	}

	public String getPhone() {
		return phone;
	}

	public void setKindRef(ENResponsiblesKindRef aValue) {
		kindRef = aValue;
	}

	public ENResponsiblesKindRef getKindRef() {
		return kindRef;
	}

} // end of ENResponsiblesValueObject

