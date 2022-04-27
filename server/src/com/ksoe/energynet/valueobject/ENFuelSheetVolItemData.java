//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENFuelSheetVolItemData;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENFuelSheetVolumesRef;

public class ENFuelSheetVolItemData implements Serializable {

	public int code = Integer.MIN_VALUE;
	public int plan_code = Integer.MIN_VALUE;
	public Date datestart;
	public BigDecimal countfact;
	public int kindcode = Integer.MIN_VALUE;
	public int staterefcode = Integer.MIN_VALUE;
	public int typerefcode = Integer.MIN_VALUE;
	public int budgetrefcode = Integer.MIN_VALUE;
	public int materialrefcode = Integer.MIN_VALUE;
	public int transport_department = Integer.MIN_VALUE;
	public int departmentrefcode = Integer.MIN_VALUE;
        public int  eikindcode = Integer.MIN_VALUE;
	public ENFuelSheetVolumesRef sheetVolumesRef = new ENFuelSheetVolumesRef();
	public static final String tableName = "ENFUELSHEETVOLITEMDATA";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENFUELSHEETVOLITEMDATA.CODE";
	public static final String plan_code_Attr = "plan_code";
	public static final String plan_code_Field = "PLAN_CODE";
	public static final String plan_code_QFielld = "ENFUELSHEETVOLITEMDATA.PLAN_CODE";
	public static final String datestart_Attr = "datestart";
	public static final String datestart_Field = "DATESTART";
	public static final String datestart_QFielld = "ENFUELSHEETVOLITEMDATA.DATESTART";
	public static final String countfact_Attr = "countfact";
	public static final String countfact_Field = "COUNTFACT";
	public static final String countfact_QFielld = "ENFUELSHEETVOLITEMDATA.COUNTFACT";
	public static final String kindcode_Attr = "kindcode";
	public static final String kindcode_Field = "KINDCODE";
	public static final String kindcode_QFielld = "ENFUELSHEETVOLITEMDATA.KINDCODE";
	public static final String staterefcode_Attr = "staterefcode";
	public static final String staterefcode_Field = "STATEREFCODE";
	public static final String staterefcode_QFielld = "ENFUELSHEETVOLITEMDATA.STATEREFCODE";
	public static final String typerefcode_Attr = "typerefcode";
	public static final String typerefcode_Field = "TYPEREFCODE";
	public static final String typerefcode_QFielld = "ENFUELSHEETVOLITEMDATA.TYPEREFCODE";
	public static final String budgetrefcode_Attr = "budgetrefcode";
	public static final String budgetrefcode_Field = "BUDGETREFCODE";
	public static final String budgetrefcode_QFielld = "ENFUELSHEETVOLITEMDATA.BUDGETREFCODE";
	public static final String materialrefcode_Attr = "materialrefcode";
	public static final String materialrefcode_Field = "MATERIALREFCODE";
	public static final String materialrefcode_QFielld = "ENFUELSHEETVOLITEMDATA.MATERIALREFCODE";
	public static final String transport_department_Attr = "transport_department";
	public static final String transport_department_Field = "TRANSPORT_DEPARTMENT";
	public static final String transport_department_QFielld = "ENFUELSHEETVOLITEMDATA.TRANSPORT_DEPARTMENT";
	public static final String departmentrefcode_Attr = "departmentrefcode";
	public static final String departmentrefcode_Field = "DEPARTMENTREFCODE";
	public static final String departmentrefcode_QFielld = "ENFUELSHEETVOLITEMDATA.DEPARTMENTREFCODE";
        public static final String eikindcode_Attr = "eikindcode";
        public static final String eikindcode_Field = "EIKINDCODE";
        public static final String eikindcode_QFielld = "ENFUELSHEETVOLITEMDATA.EIKINDCODE";

	public static final String sheetVolumesRef_Attr = "sheetVolumesRef";
	public static final String sheetVolumesRef_Field = "SHEETVOLUMESREFCODE";
	public static final String sheetVolumesRef_QFielld = "ENFUELSHEETVOLITEMDATA.SHEETVOLUMESREFCODE";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setPlan_code(int aValue) {
		plan_code = aValue;
	}

	public int getPlan_code() {
		return plan_code;
	}

	public void setDatestart(Date aValue) {
		datestart = aValue;
	}

	public Date getDatestart() {
		return datestart;
	}

	public void setCountfact(BigDecimal aValue) {
		countfact = aValue;
	}

	public BigDecimal getCountfact() {
		return countfact;
	}

	public void setKindcode(int aValue) {
		kindcode = aValue;
	}

	public int getKindcode() {
		return kindcode;
	}

	public void setStaterefcode(int aValue) {
		staterefcode = aValue;
	}

	public int getStaterefcode() {
		return staterefcode;
	}

	public void setTyperefcode(int aValue) {
		typerefcode = aValue;
	}

	public int getTyperefcode() {
		return typerefcode;
	}

	public void setBudgetrefcode(int aValue) {
		budgetrefcode = aValue;
	}

	public int getBudgetrefcode() {
		return budgetrefcode;
	}

	public void setMaterialrefcode(int aValue) {
		materialrefcode = aValue;
	}

	public int getMaterialrefcode() {
		return materialrefcode;
	}

	public void setTransport_department(int aValue) {
		transport_department = aValue;
	}

	public int getTransport_department() {
		return transport_department;
	}

	public void setDepartmentrefcode(int aValue) {
		departmentrefcode = aValue;
	}

	public int getDepartmentrefcode() {
		return departmentrefcode;
	}


        public int getEikindcode(){
                return eikindcode;
        }
    
        public void setEikindcode(int eikindcode){
               this.eikindcode = eikindcode;
        } 

	public void setSheetVolumesRef(ENFuelSheetVolumesRef aValue) {
		sheetVolumesRef = aValue;
	}

	public ENFuelSheetVolumesRef getSheetVolumesRef() {
		return sheetVolumesRef;
	}

} // end of ENFuelSheetVolItemDataValueObject

