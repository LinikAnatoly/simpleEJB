
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

import java.io.Serializable;

/**
* Value Object for ENSizObject;
*/

import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.references.ENDepartmentRef;

public class ENSizObject implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String tabNumber;
	public String profesion;
	public String fio;
	public int sizCode = Integer.MIN_VALUE;
	public int statusCode = Integer.MIN_VALUE;
	public int gender = Integer.MIN_VALUE;
	public BigDecimal growth;
	public BigDecimal sizeClothing;
	public BigDecimal sizeShoes;
	public BigDecimal sizeHead;
	public long modify_time = Long.MIN_VALUE;

	public ENElement element = new ENElement();
	public ENDepartmentRef departmentRef = new ENDepartmentRef();

	public static final String tableName = "ENSIZOBJECT";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENSIZOBJECT.CODE";
	public static final String tabNumber_Attr = "tabNumber";
	public static final String tabNumber_Field = "TABNUMBER";
	public static final String tabNumber_QFielld = "ENSIZOBJECT.TABNUMBER";
	public static final String profesion_Attr = "profesion";
	public static final String profesion_Field = "PROFESION";
	public static final String profesion_QFielld = "ENSIZOBJECT.PROFESION";
	public static final String fio_Attr = "fio";
	public static final String fio_Field = "FIO";
	public static final String fio_QFielld = "ENSIZOBJECT.FIO";
	public static final String sizCode_Attr = "sizCode";
	public static final String sizCode_Field = "SIZCODE";
	public static final String sizCode_QFielld = "ENSIZOBJECT.SIZCODE";
	public static final String statusCode_Attr = "statusCode";
	public static final String statusCode_Field = "STATUSCODE";
	public static final String statusCode_QFielld = "ENSIZOBJECT.STATUSCODE";
	public static final String gender_Attr = "gender";
	public static final String gender_Field = "GENDER";
	public static final String gender_QFielld = "ENSIZOBJECT.GENDER";
	public static final String growth_Attr = "growth";
	public static final String growth_Field = "GROWTH";
	public static final String growth_QFielld = "ENSIZOBJECT.GROWTH";
	public static final String sizeClothing_Attr = "sizeClothing";
	public static final String sizeClothing_Field = "SIZECLOTHING";
	public static final String sizeClothing_QFielld = "ENSIZOBJECT.SIZECLOTHING";
	public static final String sizeShoes_Attr = "sizeShoes";
	public static final String sizeShoes_Field = "SIZESHOES";
	public static final String sizeShoes_QFielld = "ENSIZOBJECT.SIZESHOES";
	public static final String sizeHead_Attr = "sizeHead";
	public static final String sizeHead_Field = "SIZEHEAD";
	public static final String sizeHead_QFielld = "ENSIZOBJECT.SIZEHEAD";
	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "ENSIZOBJECT.MODIFY_TIME";

	public static final String element_Attr = "element";
	public static final String element_Field = "ELEMENTCODE";
	public static final String element_QFielld = "ENSIZOBJECT.ELEMENTCODE";
	public static final String departmentRef_Attr = "departmentRef";
	public static final String departmentRef_Field = "DEPARTMENTREFCODE";
	public static final String departmentRef_QFielld = "ENSIZOBJECT.DEPARTMENTREFCODE";


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getTabNumber() {
		return tabNumber;
	}

	public void setTabNumber(String tabNumber) {
		this.tabNumber = tabNumber;
	}

	public String getProfesion() {
		return profesion;
	}

	public void setProfesion(String profesion) {
		this.profesion = profesion;
	}

	public String getFio() {
		return fio;
	}

	public void setFio(String fio) {
		this.fio = fio;
	}

	public int getSizCode() {
		return sizCode;
	}

	public void setSizCode(int sizCode) {
		this.sizCode = sizCode;
	}

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public BigDecimal getGrowth() {
		return growth;
	}

	public void setGrowth(BigDecimal growth) {
		this.growth = growth;
	}

	public BigDecimal getSizeClothing() {
		return sizeClothing;
	}

	public void setSizeClothing(BigDecimal sizeClothing) {
		this.sizeClothing = sizeClothing;
	}

	public BigDecimal getSizeShoes() {
		return sizeShoes;
	}

	public void setSizeShoes(BigDecimal sizeShoes) {
		this.sizeShoes = sizeShoes;
	}

	public BigDecimal getSizeHead() {
		return sizeHead;
	}

	public void setSizeHead(BigDecimal sizeHead) {
		this.sizeHead = sizeHead;
	}

	public long getModify_time() {
		return modify_time;
	}

	public void setModify_time(long modify_time) {
		this.modify_time = modify_time;
	}

	public ENElement getElement() {
		return element;
	}

	public void setElement(ENElement element) {
		this.element = element;
	}

	public ENDepartmentRef getDepartmentRef() {
		return departmentRef;
	}

	public void setDepartmentRef(ENDepartmentRef departmentRef) {
		this.departmentRef = departmentRef;
	}

} // end of ENSizObjectValueObject
