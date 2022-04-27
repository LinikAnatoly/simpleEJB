
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

import java.io.Serializable;
import java.util.Date;

public class ENCustomerServicesShort implements Serializable {

	private static final long serialVersionUID = 1L;

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
	public int serviceCode = Integer.MIN_VALUE;


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

	public String getObjectsAddress() {
		return objectsAddress;
	}

	public void setObjectsAddress(String objectsAddress) {
		this.objectsAddress = objectsAddress;
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

	public int getServiceCode() {
		return serviceCode;
	}

	public void setServiceCode(int serviceCode) {
		this.serviceCode = serviceCode;
	}

}
