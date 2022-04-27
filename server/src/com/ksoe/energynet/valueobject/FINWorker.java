//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for FINWorker;
 */

import java.io.Serializable;
import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.references.FINChargeTypeRef;
import com.ksoe.energynet.valueobject.references.FINWorkerKindRef;

public class FINWorker implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String name;
	public String tabNumber;
	public String positionName;
	public int positionCode = Integer.MIN_VALUE;
	public String departmentName;
	public String departmentCode;
	public BigDecimal priceGen;
	public int categor = Integer.MIN_VALUE;
	public int finCode = Integer.MIN_VALUE;
	public int isSentAssignment = Integer.MIN_VALUE;
	public BigDecimal chargePercent;
	public int categorId = Integer.MIN_VALUE;
	public String categorName;
	public String workTimeId;
	public String domain_info;
	public String positionId;
	public long modify_time = Long.MIN_VALUE;
	public FINWorkerKindRef kindRef = new FINWorkerKindRef();
	public FINChargeTypeRef chargeRef = new FINChargeTypeRef();


	public static final String tableName = "FINWORKER";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "FINWORKER.CODE";
	public static final String name_Attr = "name";
	public static final String name_Field = "NAME";
	public static final String name_QFielld = "FINWORKER.NAME";
	public static final String tabNumber_Attr = "tabNumber";
	public static final String tabNumber_Field = "TABNUMBER";
	public static final String tabNumber_QFielld = "FINWORKER.TABNUMBER";
	public static final String positionName_Attr = "positionName";
	public static final String positionName_Field = "POSITIONNAME";
	public static final String positionName_QFielld = "FINWORKER.POSITIONNAME";
	public static final String positionCode_Attr = "positionCode";
	public static final String positionCode_Field = "POSITIONCODE";
	public static final String positionCode_QFielld = "FINWORKER.POSITIONCODE";
	public static final String departmentName_Attr = "departmentName";
	public static final String departmentName_Field = "DEPARTMENTNAME";
	public static final String departmentName_QFielld = "FINWORKER.DEPARTMENTNAME";
	public static final String departmentCode_Attr = "departmentCode";
	public static final String departmentCode_Field = "DEPARTMENTCODE";
	public static final String departmentCode_QFielld = "FINWORKER.DEPARTMENTCODE";
	public static final String priceGen_Attr = "priceGen";
	public static final String priceGen_Field = "PRICEGEN";
	public static final String priceGen_QFielld = "FINWORKER.PRICEGEN";
	public static final String categor_Attr = "categor";
	public static final String categor_Field = "CATEGOR";
	public static final String categor_QFielld = "FINWORKER.CATEGOR";
	public static final String finCode_Attr = "finCode";
	public static final String finCode_Field = "FINCODE";
	public static final String finCode_QFielld = "FINWORKER.FINCODE";
	public static final String isSentAssignment_Attr = "isSentAssignment";
	public static final String isSentAssignment_Field = "ISSENTASSIGNMENT";
	public static final String isSentAssignment_QFielld = "FINWORKER.ISSENTASSIGNMENT";
	public static final String chargePercent_Attr = "chargePercent";
	public static final String chargePercent_Field = "CHARGEPERCENT";
	public static final String chargePercent_QFielld = "FINWORKER.CHARGEPERCENT";
	public static final String categorId_Attr = "categorId";
	public static final String categorId_Field = "CATEGORID";
	public static final String categorId_QFielld = "FINWORKER.CATEGORID";
	public static final String categorName_Attr = "categorName";
	public static final String categorName_Field = "CATEGORNAME";
	public static final String categorName_QFielld = "FINWORKER.CATEGORNAME";
	public static final String workTimeId_Attr = "workTimeId";
	public static final String workTimeId_Field = "WORKTIMEID";
	public static final String workTimeId_QFielld = "FINWORKER.WORKTIMEID";
	public static final String domain_info_Attr = "domain_info";
	public static final String domain_info_Field = "DOMAIN_INFO";
	public static final String domain_info_QFielld = "FINWORKER.DOMAIN_INFO";
	public static final String positionId_Attr = "positionId";
	public static final String positionId_Field = "POSITIONID";
	public static final String positionId_QFielld = "FINWORKER.POSITIONID";
	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "FINWORKER.MODIFY_TIME";
	public static final String kindRef_Attr = "kindRef";
	public static final String kindRef_Field = "KINDREFCODE";
	public static final String kindRef_QFielld = "FINWORKER.KINDREFCODE";
	public static final String chargeRef_Attr = "chargeRef";
	public static final String chargeRef_Field = "CHARGEREFCODE";
	public static final String chargeRef_QFielld = "FINWORKER.CHARGEREFCODE";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setName(String aValue) {
		name = aValue;
	}

	public String getName() {
		return name;
	}

	public void setTabNumber(String aValue) {
		tabNumber = aValue;
	}

	public String getTabNumber() {
		return tabNumber;
	}

	public void setPositionName(String aValue) {
		positionName = aValue;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionCode(int aValue) {
		positionCode = aValue;
	}

	public int getPositionCode() {
		return positionCode;
	}

	public void setDepartmentName(String aValue) {
		departmentName = aValue;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentCode(String aValue) {
		departmentCode = aValue;
	}

	public String getDepartmentCode() {
		return departmentCode;
	}

	public void setPriceGen(BigDecimal aValue) {
		priceGen = aValue;
	}

	public BigDecimal getPriceGen() {
		return priceGen;
	}

	public void setCategor(int aValue) {
		categor = aValue;
	}

	public int getCategor() {
		return categor;
	}

	public void setFinCode(int aValue) {
		finCode = aValue;
	}

	public int getFinCode() {
		return finCode;
	}

	public void setIsSentAssignment(int aValue) {
		isSentAssignment = aValue;
	}

	public int getIsSentAssignment() {
		return isSentAssignment;
	}

	public void setChargePercent(BigDecimal aValue) {
		chargePercent = aValue;
	}

	public BigDecimal getChargePercent() {
		return chargePercent;
	}

	public void setCategorId(int aValue) {
		categorId = aValue;
	}

	public int getCategorId() {
		return categorId;
	}

	public void setCategorName(String aValue) {
		categorName = aValue;
	}

	public String getCategorName() {
		return categorName;
	}

	public void setWorkTimeId(String aValue) {
		workTimeId = aValue;
	}

	public String getWorkTimeId() {
		return workTimeId;
	}

	public void setDomain_info(String aValue) {
		domain_info = aValue;
	}

	public String getDomain_info() {
		return domain_info;
	}

	public void setPositionId(String aValue) {
		positionId = aValue;
	}

	public String getPositionId() {
		return positionId;
	}

	public void setModify_time(long aValue) {
		modify_time = aValue;
	}

	public long getModify_time() {
		return modify_time;
	}

	public void setKindRef(FINWorkerKindRef aValue) {
		kindRef = aValue;
	}

	public FINWorkerKindRef getKindRef() {
		return kindRef;
	}

	public void setChargeRef(FINChargeTypeRef aValue) {
		chargeRef = aValue;
	}

	public FINChargeTypeRef getChargeRef() {
		return chargeRef;
	}

} // end of FINWorkerValueObject

