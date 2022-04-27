
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

import java.io.Serializable;

/**
* Value Object for ENPriorityCoefficient;
*/

import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENElementTypeRef;
import com.ksoe.energynet.valueobject.references.ENPriorityCoeffTypeRef;

public class ENPriorityCoefficient implements Serializable {

	public int code = Integer.MIN_VALUE;
	public BigDecimal value6;
	public BigDecimal value35;
	public BigDecimal value150;
	public long modify_time = Long.MIN_VALUE;
	public String userGen;
	public Date dateEdit;

	public ENElementTypeRef elementTypeRef = new ENElementTypeRef();
	public ENPriorityCoeffTypeRef coeffTypeRef = new ENPriorityCoeffTypeRef();

	public static final String tableName = "ENPRIORITYCOEFFICIENT";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENPRIORITYCOEFFICIENT.CODE";
	public static final String value6_Attr = "value6";
	public static final String value6_Field = "VALUE6";
	public static final String value6_QFielld = "ENPRIORITYCOEFFICIENT.VALUE6";
	public static final String value35_Attr = "value35";
	public static final String value35_Field = "VALUE35";
	public static final String value35_QFielld = "ENPRIORITYCOEFFICIENT.VALUE35";
	public static final String value150_Attr = "value150";
	public static final String value150_Field = "VALUE150";
	public static final String value150_QFielld = "ENPRIORITYCOEFFICIENT.VALUE150";
	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "ENPRIORITYCOEFFICIENT.MODIFY_TIME";
	public static final String userGen_Attr = "userGen";
	public static final String userGen_Field = "USERGEN";
	public static final String userGen_QFielld = "ENPRIORITYCOEFFICIENT.USERGEN";
	public static final String dateEdit_Attr = "dateEdit";
	public static final String dateEdit_Field = "DATEEDIT";
	public static final String dateEdit_QFielld = "ENPRIORITYCOEFFICIENT.DATEEDIT";

	public static final String elementTypeRef_Attr = "elementTypeRef";
	public static final String elementTypeRef_Field = "ELEMENTTYPEREFCODE";
	public static final String elementTypeRef_QFielld = "ENPRIORITYCOEFFICIENT.ELEMENTTYPEREFCODE";
	public static final String coeffTypeRef_Attr = "coeffTypeRef";
	public static final String coeffTypeRef_Field = "COEFFTYPEREFCODE";
	public static final String coeffTypeRef_QFielld = "ENPRIORITYCOEFFICIENT.COEFFTYPEREFCODE";

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public BigDecimal getValue6() {
		return value6;
	}

	public void setValue6(BigDecimal value6) {
		this.value6 = value6;
	}

	public BigDecimal getValue35() {
		return value35;
	}

	public void setValue35(BigDecimal value35) {
		this.value35 = value35;
	}

	public BigDecimal getValue150() {
		return value150;
	}

	public void setValue150(BigDecimal value150) {
		this.value150 = value150;
	}

	public long getModify_time() {
		return modify_time;
	}

	public void setModify_time(long modify_time) {
		this.modify_time = modify_time;
	}

	public String getUserGen() {
		return userGen;
	}

	public void setUserGen(String userGen) {
		this.userGen = userGen;
	}

	public Date getDateEdit() {
		return dateEdit;
	}

	public void setDateEdit(Date dateEdit) {
		this.dateEdit = dateEdit;
	}

	public ENElementTypeRef getElementTypeRef() {
		return elementTypeRef;
	}

	public void setElementTypeRef(ENElementTypeRef elementTypeRef) {
		this.elementTypeRef = elementTypeRef;
	}

	public ENPriorityCoeffTypeRef getCoeffTypeRef() {
		return coeffTypeRef;
	}

	public void setCoeffTypeRef(ENPriorityCoeffTypeRef coeffTypeRef) {
		this.coeffTypeRef = coeffTypeRef;
	}

} // end of ENPriorityCoefficientValueObject
