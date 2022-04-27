
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

import java.io.Serializable;
import java.util.Date;


public class ENCustomerServices implements Serializable {

	public String customerName;
	public String customerAddress;
	public String objectsAddress;
	public String docNum;
	public Date dateRegistration;
	public String typeName;
	public String serviceName;
	public String docStatus;
	public String sourceInfo;
	public String sourceTable;
	public int sourceTableCode = Integer.MIN_VALUE;
	public int sourceType = Integer.MIN_VALUE;

	public static final String tableName = "ENCUSTOMERSERVICES";
	public static final String customerName_Attr = "customerName";
	public static final String customerName_Field = "CUSTOMERNAME";
	public static final String customerName_QFielld = "CUSTOMERNAME";
	public static final String customerAddress_Attr = "customerAddress";
	public static final String customerAddress_Field = "CUSTOMERADDRESS";
	public static final String customerAddress_QFielld = "CUSTOMERADDRESS";
	public static final String objectsAddress_Attr = "objectsAddress";
	public static final String objectsAddress_Field = "OBJECTSADDRESS";
	public static final String objectsAddress_QFielld = "OBJECTSADDRESS";
	public static final String docNum_Attr = "docNum";
	public static final String docNum_Field = "DOCNUM";
	public static final String docNum_QFielld = "DOCNUM";
	public static final String dateRegistration_Attr = "dateRegistration";
	public static final String dateRegistration_Field = "DATEREGISTRATION";
	public static final String dateRegistration_QFielld = "DATEREGISTRATION";
	public static final String typeName_Attr = "typeName";
	public static final String typeName_Field = "TYPENAME";
	public static final String typeName_QFielld = "TYPENAME";
	public static final String serviceName_Attr = "serviceName";
	public static final String serviceName_Field = "SERVICENAME";
	public static final String serviceName_QFielld = "SERVICENAME";
	public static final String docStatus_Attr = "docStatus";
	public static final String docStatus_Field = "DOCSTATUS";
	public static final String docStatus_QFielld = "DOCSTATUS";
	public static final String sourceInfo_Attr = "sourceInfo";
	public static final String sourceInfo_Field = "SOURCEINFO";
	public static final String sourceInfo_QFielld = "SOURCEINFO";
	public static final String sourceTable_Attr = "sourceTable";
	public static final String sourceTable_Field = "SOURCETABLE";
	public static final String sourceTable_QFielld = "SOURCETABLE";
	public static final String sourceTableCode_Attr = "sourceTableCode";
	public static final String sourceTableCode_Field = "SOURCETABLECODE";
	public static final String sourceTableCode_QFielld = "SOURCETABLECODE";
	public static final String sourceType_Attr = "sourceType";
	public static final String sourceType_Field = "SOURCETYPE";
	public static final String sourceType_QFielld = "SOURCETYPE";

	public void setCustomerName(String aValue) {
		customerName = aValue;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerAddress(String aValue) {
		customerAddress = aValue;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setObjectsAddress(String aValue) {
		objectsAddress = aValue;
	}

	public String getObjectsAddress() {
		return objectsAddress;
	}

	public void setDocNum(String aValue) {
		docNum = aValue;
	}

	public String getDocNum() {
		return docNum;
	}

	public void setDateRegistration(Date aValue) {
		dateRegistration = aValue;
	}

	public Date getDateRegistration() {
		return dateRegistration;
	}

	public void setTypeName(String aValue) {
		typeName = aValue;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setServiceName(String aValue) {
		serviceName = aValue;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setDocStatus(String aValue) {
		docStatus = aValue;
	}

	public String getDocStatus() {
		return docStatus;
	}

	public void setSourceInfo(String aValue) {
		sourceInfo = aValue;
	}

	public String getSourceInfo() {
		return sourceInfo;
	}

	public void setSourceTable(String aValue) {
		sourceTable = aValue;
	}

	public String getSourceTable() {
		return sourceTable;
	}

	public void setSourceTableCode(int aValue) {
		sourceTableCode = aValue;
	}

	public int getSourceTableCode() {
		return sourceTableCode;
	}

	public void setSourceType(int aValue) {
		sourceType = aValue;
	}

	public int getSourceType() {
		return sourceType;
	}

} // end of ENCustomerServicesValueObject
