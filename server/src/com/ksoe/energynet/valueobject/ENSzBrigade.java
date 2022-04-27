//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENSzBrigade;
 */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENDepartmentRef;

public class ENSzBrigade implements Serializable {

	public static final int WORKING = 0;
	public static final int CLOSED = 1;


	public int code = Integer.MIN_VALUE;
	public String nazv;
	public String ceh_nazv;
	public String main_podr_nazv;
	public int sizCode = Integer.MIN_VALUE;
	public int podrId = Integer.MIN_VALUE;
	public int cehId = Integer.MIN_VALUE;
	public int quantity = Integer.MIN_VALUE;
	public String molCode;
	public String molName;
	public int statusCode = Integer.MIN_VALUE;
	public ENElement element = new ENElement();
	public ENDepartmentRef departmentRef = new ENDepartmentRef();
	public static final String tableName = "ENSZBRIGADE";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENSZBRIGADE.CODE";
	public static final String nazv_Attr = "nazv";
	public static final String nazv_Field = "NAZV";
	public static final String nazv_QFielld = "ENSZBRIGADE.NAZV";
	public static final String ceh_nazv_Attr = "ceh_nazv";
	public static final String ceh_nazv_Field = "CEH_NAZV";
	public static final String ceh_nazv_QFielld = "ENSZBRIGADE.CEH_NAZV";
	public static final String main_podr_nazv_Attr = "main_podr_nazv";
	public static final String main_podr_nazv_Field = "MAIN_PODR_NAZV";
	public static final String main_podr_nazv_QFielld = "ENSZBRIGADE.MAIN_PODR_NAZV";
	public static final String sizCode_Attr = "sizCode";
	public static final String sizCode_Field = "SIZCODE";
	public static final String sizCode_QFielld = "ENSZBRIGADE.SIZCODE";
	public static final String podrId_Attr = "podrId";
	public static final String podrId_Field = "PODRID";
	public static final String podrId_QFielld = "ENSZBRIGADE.PODRID";
	public static final String cehId_Attr = "cehId";
	public static final String cehId_Field = "CEHID";
	public static final String cehId_QFielld = "ENSZBRIGADE.CEHID";
	public static final String quantity_Attr = "quantity";
	public static final String quantity_Field = "QUANTITY";
	public static final String quantity_QFielld = "ENSZBRIGADE.QUANTITY";
	public static final String molCode_Attr = "molCode";
	public static final String molCode_Field = "MOLCODE";
	public static final String molCode_QFielld = "ENSZBRIGADE.MOLCODE";
	public static final String molName_Attr = "molName";
	public static final String molName_Field = "MOLNAME";
	public static final String molName_QFielld = "ENSZBRIGADE.MOLNAME";
	public static final String statusCode_Attr = "statusCode";
	public static final String statusCode_Field = "STATUSCODE";
	public static final String statusCode_QFielld = "ENSZBRIGADE.STATUSCODE";
	public static final String element_Attr = "element";
	public static final String element_Field = "ELEMENTCODE";
	public static final String element_QFielld = "ENSZBRIGADE.ELEMENTCODE";
	public static final String departmentRef_Attr = "departmentRef";
	public static final String departmentRef_Field = "DEPARTMENTREFCODE";
	public static final String departmentRef_QFielld = "ENSZBRIGADE.DEPARTMENTREFCODE";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setNazv(String aValue) {
		nazv = aValue;
	}

	public String getNazv() {
		return nazv;
	}

	public void setCeh_nazv(String aValue) {
		ceh_nazv = aValue;
	}

	public String getCeh_nazv() {
		return ceh_nazv;
	}

	public void setMain_podr_nazv(String aValue) {
		main_podr_nazv = aValue;
	}

	public String getMain_podr_nazv() {
		return main_podr_nazv;
	}

	public void setSizCode(int aValue) {
		sizCode = aValue;
	}

	public int getSizCode() {
		return sizCode;
	}

	public void setPodrId(int aValue) {
		podrId = aValue;
	}

	public int getPodrId() {
		return podrId;
	}

	public void setCehId(int aValue) {
		cehId = aValue;
	}

	public int getCehId() {
		return cehId;
	}

	public void setQuantity(int aValue) {
		quantity = aValue;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setMolCode(String aValue) {
		molCode = aValue;
	}

	public String getMolCode() {
		return molCode;
	}

	public void setMolName(String aValue) {
		molName = aValue;
	}

	public String getMolName() {
		return molName;
	}

	public void setStatusCode(int aValue) {
		statusCode = aValue;
	}

	public int getStatusCode() {
		return statusCode;
	}

	public void setElement(ENElement aValue) {
		element = aValue;
	}

	public ENElement getElement() {
		return element;
	}

	public void setDepartmentRef(ENDepartmentRef aValue) {
		departmentRef = aValue;
	}

	public ENDepartmentRef getDepartmentRef() {
		return departmentRef;
	}

} // end of ENSzBrigadeValueObject

