//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

/**
 * Short Object for FINWorker;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class FINWorkerShort implements Serializable {

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
	public String positionId;
	public int kindRefCode = Integer.MIN_VALUE;
	public String kindRefName;
	public int chargeRefCode = Integer.MIN_VALUE;
	public String chargeRefName;


	/**  ****************************   */
	public int doljnostid = Integer.MIN_VALUE;
	public int cehid = Integer.MIN_VALUE;
	public String cehNazv;
	public String nvz;
	// /// SUPP-16692 Часы загрузки работника по планам на заданную дату
	public BigDecimal workLoad;
	public String balans;
	public String tradeCategoryId;

	/**  тип календаря (0 - 5 дней; 1 - 6 дней; 2 - Прочие; 3 - 7 дней; 10 - Гос.норма; 11 - План; 12 - Сотрудник); */
	public int payCalendarType = Integer.MIN_VALUE;
	public String mainCehid;
	public String mainCehNazv;
	public int planCode = Integer.MIN_VALUE;
	public Date existenceDate;
	/**  ****************************   */

	/** Код территориального подразделения из AX */
	public String territorialOrgId;
	
	public String identityCardCode_RU; /*тип документа удостоверяющий личность */
	public String identityCardSeries_RU; /*паспорт серия */
	public String identityCardNumber_RU; /*паспорт номер */	 
	public String identityCardIssueDate_RU;  /*дата выдачи*/
	public String identityCardIssueBy_RU ; /*кем выдано*/
	public String nameAlias; /*фио скорочено*/
	public String lastName; /*фамилия */
	public String firstName; /*имя */
	public String middleName; /*отчество */
	
	public String getIdentityCardCode_RU() {
		return identityCardCode_RU;
	}

	public void setIdentityCardCode_RU(String identityCardCode_RU) {
		this.identityCardCode_RU = identityCardCode_RU;
	}

	public String getIdentityCardSeries_RU() {
		return identityCardSeries_RU;
	}

	public void setIdentityCardSeries_RU(String identityCardSeries_RU) {
		this.identityCardSeries_RU = identityCardSeries_RU;
	}

	public String getIdentityCardNumber_RU() {
		return identityCardNumber_RU;
	}

	public void setIdentityCardNumber_RU(String identityCardNumber_RU) {
		this.identityCardNumber_RU = identityCardNumber_RU;
	}

	public String getIdentityCardIssueDate_RU() {
		return identityCardIssueDate_RU;
	}

	public void setIdentityCardIssueDate_RU(String identityCardIssueDate_RU) {
		this.identityCardIssueDate_RU = identityCardIssueDate_RU;
	}

	public String getIdentityCardIssueBy_RU() {
		return identityCardIssueBy_RU;
	}

	public void setIdentityCardIssueBy_RU(String identityCardIssueBy_RU) {
		this.identityCardIssueBy_RU = identityCardIssueBy_RU;
	}

	public String getNameAlias() {
		return nameAlias;
	}

	public void setNameAlias(String nameAlias) {
		this.nameAlias = nameAlias;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	


	

	public int getPlancode() {
		return planCode;
	}

	public void setPlanCode(int planCode) {
		this.planCode = planCode;
	}

	public String getMainCehid() {
		return mainCehid;
	}

	public void setMainCehid(String mainCehid) {
		this.mainCehid = mainCehid;
	}

	public String getMainCehNazv() {
		return mainCehNazv;
	}

	public void setMainCehNazv(String mainCehNazv) {
		this.mainCehNazv = mainCehNazv;
	}


	public String getBalans() {
		return balans;
	}

	public void setBalans(String balans) {
		this.balans = balans;
	}
	public int getPayCalendarType() {
		return payCalendarType;
	}

	public void setPayCalendarType(int payCalendarType) {
		this.payCalendarType = payCalendarType;
	}

	public String getTradeCategoryId() {
		return tradeCategoryId;
	}

	public void setTradeCategoryId(String tradeCategoryId) {
		this.tradeCategoryId = tradeCategoryId;
	}

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

	public void setPositionId(String aValue) {
		positionId = aValue;
	}

	public String getPositionId() {
		return positionId;
	}

	public void setKindRefCode(int aValue) {
		kindRefCode = aValue;
	}

	public int getKindRefCode() {
		return kindRefCode;
	}

	public void setKindRefName(String aValue) {
		kindRefName = aValue;
	}

	public String getKindRefName() {
		return kindRefName;
	}

	public void setChargeRefCode(int aValue) {
		chargeRefCode = aValue;
	}

	public int getChargeRefCode() {
		return chargeRefCode;
	}

	public void setChargeRefName(String aValue) {
		chargeRefName = aValue;
	}

	public String getChargeRefName() {
		return chargeRefName;
	}

	public int getDoljnostid() {
		return doljnostid;
	}

	public void setDoljnostid(int doljnostid) {
		this.doljnostid = doljnostid;
	}

	public int getCehid() {
		return cehid;
	}

	public void setCehid(int cehid) {
		this.cehid = cehid;
	}

	public String getCehNazv() {
		return cehNazv;
	}

	public void setCehNazv(String cehNazv) {
		this.cehNazv = cehNazv;
	}

	public String getNvz() {
		return nvz;
	}

	public void setNvz(String nvz) {
		this.nvz = nvz;
	}

	public BigDecimal getWorkLoad() {
		return workLoad;
	}

	public void setWorkLoad(BigDecimal workLoad) {
		this.workLoad = workLoad;
	}

	public Date getExistenceDate() {
		return existenceDate;
	}

	public void setExistenceDate(Date existenceDate) {
		this.existenceDate = existenceDate;
	}

	public String getTerritorialOrgId() {
		return territorialOrgId;
	}

	public void setTerritorialOrgId(String territorialOrgId) {
		this.territorialOrgId = territorialOrgId;
	}

}