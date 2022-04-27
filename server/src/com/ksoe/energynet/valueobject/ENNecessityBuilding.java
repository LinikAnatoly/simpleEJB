
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

import java.io.Serializable;

/**
* Value Object for ENNecessityBuilding;
*/

import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENElementTypeRef;
import com.ksoe.energynet.valueobject.references.ENServicesObjectRef;
import com.ksoe.energypro.valueobject.EPVoltageNominal;

public class ENNecessityBuilding implements Serializable {

	public int code = Integer.MIN_VALUE;
	public BigDecimal countGen;
	public BigDecimal summaGen;
	public String description;
	public Date dateEdit;
	public String userGen;
	public ENElementTypeRef elementTypeRef = new ENElementTypeRef();
	public EPVoltageNominal voltageNominal = new EPVoltageNominal();
	public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
	public static final String tableName = "ENNECESSITYBUILDING";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENNECESSITYBUILDING.CODE";
	public static final String countGen_Attr = "countGen";
	public static final String countGen_Field = "COUNTGEN";
	public static final String countGen_QFielld = "ENNECESSITYBUILDING.COUNTGEN";
	public static final String summaGen_Attr = "summaGen";
	public static final String summaGen_Field = "SUMMAGEN";
	public static final String summaGen_QFielld = "ENNECESSITYBUILDING.SUMMAGEN";
	public static final String description_Attr = "description";
	public static final String description_Field = "DESCRIPTION";
	public static final String description_QFielld = "ENNECESSITYBUILDING.DESCRIPTION";
	public static final String dateEdit_Attr = "dateEdit";
	public static final String dateEdit_Field = "DATEEDIT";
	public static final String dateEdit_QFielld = "ENNECESSITYBUILDING.DATEEDIT";
	public static final String userGen_Attr = "userGen";
	public static final String userGen_Field = "USERGEN";
	public static final String userGen_QFielld = "ENNECESSITYBUILDING.USERGEN";
	public static final String elementTypeRef_Attr = "elementTypeRef";
	public static final String elementTypeRef_Field = "ELEMENTTYPEREFCODE";
	public static final String elementTypeRef_QFielld = "ENNECESSITYBUILDING.ELEMENTTYPEREFCODE";
	public static final String voltageNominal_Attr = "voltageNominal";
	public static final String voltageNominal_Field = "VOLTAGENOMINALCODE";
	public static final String voltageNominal_QFielld = "ENNECESSITYBUILDING.VOLTAGENOMINALCODE";
	public static final String servicesObjectRef_Attr = "servicesObjectRef";
	public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
	public static final String servicesObjectRef_QFielld = "ENNECESSITYBUILDING.SERVICESOBJECTREFCODE";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setCountGen(BigDecimal aValue) {
		countGen = aValue;
	}

	public BigDecimal getCountGen() {
		return countGen;
	}

	public void setSummaGen(BigDecimal aValue) {
		summaGen = aValue;
	}

	public BigDecimal getSummaGen() {
		return summaGen;
	}

	public void setDescription(String aValue) {
		description = aValue;
	}

	public String getDescription() {
		return description;
	}

	public void setDateEdit(Date aValue) {
		dateEdit = aValue;
	}

	public Date getDateEdit() {
		return dateEdit;
	}

	public void setUserGen(String aValue) {
		userGen = aValue;
	}

	public String getUserGen() {
		return userGen;
	}

	public void setElementTypeRef(ENElementTypeRef aValue) {
		elementTypeRef = aValue;
	}

	public ENElementTypeRef getElementTypeRef() {
		return elementTypeRef;
	}

	public void setVoltageNominal(EPVoltageNominal aValue) {
		voltageNominal = aValue;
	}

	public EPVoltageNominal getVoltageNominal() {
		return voltageNominal;
	}

	public void setServicesObjectRef(ENServicesObjectRef aValue) {
		servicesObjectRef = aValue;
	}

	public ENServicesObjectRef getServicesObjectRef() {
		return servicesObjectRef;
	}

} // end of ENNecessityBuildingValueObject
