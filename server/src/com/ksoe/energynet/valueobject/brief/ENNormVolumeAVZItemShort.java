//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

/**
 * Short Object for ENNormVolumeAVZItem;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class ENNormVolumeAVZItemShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	
	public BigDecimal countGen;
	public BigDecimal countRequired;
	
	public String userGen;
	public Date dateEdit;
	public int materialRefCode = Integer.MIN_VALUE;
	public String materialRefName;
	public BigDecimal materialRefCost;
	public int materialRefDeliveryDate = Integer.MIN_VALUE;
	public String materialRefNumkatalog;
	public String materialRefIdentid;
	public int normativeVolumeRefCode = Integer.MIN_VALUE;
	public String normativeVolumeRefUserGen;
	public Date normativeVolumeRefDateEdit;

	////////////////////
	public int measurementCode = Integer.MIN_VALUE;
	public String measurementName;
	public String nomenclaturNumber;

	public int budgetRefCode = Integer.MIN_VALUE;
	public int departmentRefCode = Integer.MIN_VALUE;
	public int rest_purpose_type_id = Integer.MIN_VALUE;

	public String materialNameEtalon;
	public String strNomenclatures;

	public int deliveryTime = Integer.MIN_VALUE;
	
	public BigDecimal countRequiredByBudg;
	public BigDecimal countGenByBudg;
	public BigDecimal orderedCountByBudg;
	public BigDecimal orderedCountByBudgAndDep;
	public BigDecimal invoiceCountByBudg;
	public BigDecimal invoiceCountByBudgAndDep;
	
	public BigDecimal orderedCountWithoutInvoices;
	public BigDecimal countInFK;
	public BigDecimal countToOrder;
	public BigDecimal countToOrderCalculated;
	public BigDecimal sumToOrder;
	////////////////////

	public BigDecimal getCountToOrderCalculated() {
		return countToOrderCalculated;
	}

	public void setCountToOrderCalculated(BigDecimal countToOrderCalculated) {
		this.countToOrderCalculated = countToOrderCalculated;
	}
	
	public BigDecimal getOrderedCountWithoutInvoices() {
		return orderedCountWithoutInvoices;
	}

	public void setOrderedCountWithoutInvoices(
			BigDecimal orderedCountWithoutInvoices) {
		this.orderedCountWithoutInvoices = orderedCountWithoutInvoices;
	}

	public BigDecimal getCountInFK() {
		return countInFK;
	}

	public void setCountInFK(BigDecimal countInFK) {
		this.countInFK = countInFK;
	}

	public BigDecimal getCountToOrder() {
		return countToOrder;
	}

	public void setCountToOrder(BigDecimal countToOrder) {
		this.countToOrder = countToOrder;
	}

	public BigDecimal getSumToOrder() {
		return sumToOrder;
	}

	public void setSumToOrder(BigDecimal sumToOrder) {
		this.sumToOrder = sumToOrder;
	}

	public int getBudgetRefCode() {
		return budgetRefCode;
	}

	public void setBudgetRefCode(int budgetRefCode) {
		this.budgetRefCode = budgetRefCode;
	}

	public String getMaterialNameEtalon() {
		return materialNameEtalon;
	}

	public void setMaterialNameEtalon(String materialNameEtalon) {
		this.materialNameEtalon = materialNameEtalon;
	}

	public int getDeliveryTime() {
		return deliveryTime;
	}

	public void setDeliveryTime(int deliveryTime) {
		this.deliveryTime = deliveryTime;
	}

	public String getStrNomenclatures() {
		return strNomenclatures;
	}

	public void setStrNomenclatures(String strNomenclatures) {
		this.strNomenclatures = strNomenclatures;
	}
	
	public BigDecimal getInvoiceCountByBudgAndDep() {
		return invoiceCountByBudgAndDep;
	}

	public void setInvoiceCountByBudgAndDep(BigDecimal invoiceCountByBudgAndDep) {
		this.invoiceCountByBudgAndDep = invoiceCountByBudgAndDep;
	}

	public void setCode(int aValue) {
		code = aValue;
	}

	public BigDecimal getCountRequiredByBudg() {
		return countRequiredByBudg;
	}

	public void setCountRequiredByBudg(BigDecimal countRequiredByBudg) {
		this.countRequiredByBudg = countRequiredByBudg;
	}

	public BigDecimal getCountGenByBudg() {
		return countGenByBudg;
	}

	public void setCountGenByBudg(BigDecimal countGenByBudg) {
		this.countGenByBudg = countGenByBudg;
	}

	public BigDecimal getOrderedCountByBudg() {
		return orderedCountByBudg;
	}

	public void setOrderedCountByBudg(BigDecimal orderedCountByBudg) {
		this.orderedCountByBudg = orderedCountByBudg;
	}

	public BigDecimal getOrderedCountByBudgAndDep() {
		return orderedCountByBudgAndDep;
	}

	public void setOrderedCountByBudgAndDep(BigDecimal orderedCountByBudgAndDep) {
		this.orderedCountByBudgAndDep = orderedCountByBudgAndDep;
	}

	public BigDecimal getInvoiceCountByBudg() {
		return invoiceCountByBudg;
	}

	public void setInvoiceCountByBudg(BigDecimal invoiceCountByBudg) {
		this.invoiceCountByBudg = invoiceCountByBudg;
	}

	public int getCode() {
		return code;
	}

	public int getDepartmentRefCode() {
		return departmentRefCode;
	}

	public void setDepartmentRefCode(int departmentRefCode) {
		this.departmentRefCode = departmentRefCode;
	}
	
	public void setCountGen(BigDecimal aValue) {
		countGen = aValue;
	}

	public BigDecimal getCountGen() {
		return countGen;
	}

	public void setCountRequired(BigDecimal aValue) {
		countRequired = aValue;
	}

	public BigDecimal getCountRequired() {
		return countRequired;
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

	public void setMaterialRefCode(int aValue) {
		materialRefCode = aValue;
	}

	public int getMaterialRefCode() {
		return materialRefCode;
	}

	public void setMaterialRefName(String aValue) {
		materialRefName = aValue;
	}

	public String getMaterialRefName() {
		return materialRefName;
	}

	public void setMaterialRefCost(BigDecimal aValue) {
		materialRefCost = aValue;
	}

	public BigDecimal getMaterialRefCost() {
		return materialRefCost;
	}

	public void setMaterialRefDeliveryDate(int aValue) {
		materialRefDeliveryDate = aValue;
	}

	public int getMaterialRefDeliveryDate() {
		return materialRefDeliveryDate;
	}

	public void setMaterialRefNumkatalog(String aValue) {
		materialRefNumkatalog = aValue;
	}

	public String getMaterialRefNumkatalog() {
		return materialRefNumkatalog;
	}

	public void setMaterialRefIdentid(String aValue) {
		materialRefIdentid = aValue;
	}

	public String getMaterialRefIdentid() {
		return materialRefIdentid;
	}

	public void setNormativeVolumeRefCode(int aValue) {
		normativeVolumeRefCode = aValue;
	}

	public int getNormativeVolumeRefCode() {
		return normativeVolumeRefCode;
	}

	public void setNormativeVolumeRefUserGen(String aValue) {
		normativeVolumeRefUserGen = aValue;
	}

	public String getNormativeVolumeRefUserGen() {
		return normativeVolumeRefUserGen;
	}

	public void setNormativeVolumeRefDateEdit(Date aValue) {
		normativeVolumeRefDateEdit = aValue;
	}

	public Date getNormativeVolumeRefDateEdit() {
		return normativeVolumeRefDateEdit;
	}

	public int getMeasurementCode() {
		return measurementCode;
	}

	public void setMeasurementCode(int measurementCode) {
		this.measurementCode = measurementCode;
	}

	public String getMeasurementName() {
		return measurementName;
	}

	public void setMeasurementName(String measurementName) {
		this.measurementName = measurementName;
	}

	public String getNomenclaturNumber() {
		return nomenclaturNumber;
	}

	public void setNomenclaturNumber(String nomenclaturNumber) {
		this.nomenclaturNumber = nomenclaturNumber;
	}

}