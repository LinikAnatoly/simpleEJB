//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENCottage;
 */

import java.io.Serializable;
import java.util.Date;

public class ENCottage implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String numberGen;
	public int numberBeds = Integer.MIN_VALUE;
	public String description;
	public String commentgen;
	public String userGen;
	public Date dateEdit;
	public long modify_time = Long.MIN_VALUE;

	public static final String tableName = "ENCOTTAGE";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENCOTTAGE.CODE";
	public static final String numberGen_Attr = "numberGen";
	public static final String numberGen_Field = "NUMBERGEN";
	public static final String numberGen_QFielld = "ENCOTTAGE.NUMBERGEN";
	public static final String numberBeds_Attr = "numberBeds";
	public static final String numberBeds_Field = "NUMBERBEDS";
	public static final String numberBeds_QFielld = "ENCOTTAGE.NUMBERBEDS";
	public static final String description_Attr = "description";
	public static final String description_Field = "DESCRIPTION";
	public static final String description_QFielld = "ENCOTTAGE.DESCRIPTION";
	public static final String commentgen_Attr = "commentgen";
	public static final String commentgen_Field = "COMMENTGEN";
	public static final String commentgen_QFielld = "ENCOTTAGE.COMMENTGEN";
	public static final String userGen_Attr = "userGen";
	public static final String userGen_Field = "USERGEN";
	public static final String userGen_QFielld = "ENCOTTAGE.USERGEN";
	public static final String dateEdit_Attr = "dateEdit";
	public static final String dateEdit_Field = "DATEEDIT";
	public static final String dateEdit_QFielld = "ENCOTTAGE.DATEEDIT";
	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "ENCOTTAGE.MODIFY_TIME";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setNumberGen(String aValue) {
		numberGen = aValue;
	}

	public String getNumberGen() {
		return numberGen;
	}

	public void setNumberBeds(int aValue) {
		numberBeds = aValue;
	}

	public int getNumberBeds() {
		return numberBeds;
	}

	public void setDescription(String aValue) {
		description = aValue;
	}

	public String getDescription() {
		return description;
	}

	public void setCommentgen(String aValue) {
		commentgen = aValue;
	}

	public String getCommentgen() {
		return commentgen;
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

} // end of ENCottageValueObject

