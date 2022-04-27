
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

import java.io.Serializable;

/**
  * Short Object for ENTechConditionsObjects;
  */

import java.math.BigDecimal;
import java.util.Date;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement(name = "ENTechConditionsObjectsShort")
@XmlAccessorType(XmlAccessType.FIELD)
public class ENTechConditionsObjectsShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String numberGen;
	public Date dateGen;
	public String customer;
	public String building;
	public String address;
	public BigDecimal tyCurrentPower;
	public BigDecimal tyServicesPower;
	public String connectionPowerPlaces;
	public String connectionPowerPlacesNum;
	public String connectionPowerPoint;
	public String connectionPowerPointNum;
	public String connectionSource;
	public String connectionSourceNum;
	public BigDecimal cat1CurrentPower;
	public BigDecimal cat2CurrentPower;
	public BigDecimal cat3CurrentPower;
	public BigDecimal cat1ServicesPower;
	public BigDecimal cat2ServicesPower;
	public BigDecimal cat3ServicesPower;
	public BigDecimal tyServicesPowerWaterHeating;
	public BigDecimal tyServicesPowerHeating;
	public BigDecimal tyServicesPowerCooker;
	public BigDecimal powerGeneration;
	public int yearGen = Integer.MIN_VALUE;
	public String performer;
	public String performerPhone;
	public String userGen;
	public Date dateEdit;
	public int securityZone = Integer.MIN_VALUE;
	public String objectSecurityZone;
	public int identNumber = Integer.MIN_VALUE;
	public Date dateChangeTU;
	public int elementCode = Integer.MIN_VALUE;
	public int departmentCode = Integer.MIN_VALUE;
	public String departmentShortName;
	public Date departmentDateStart;
	public Date departmentDateFinal;
	public int departmentRenCode = Integer.MIN_VALUE;
	public String departmentShpzBalans;
	public int departmentKau_table_id_1884 = Integer.MIN_VALUE;
	public String departmentKau_1884;
	public String departmentName_1884;
	public String departmentHrmorganizationid;
	public int categoryRefCode = Integer.MIN_VALUE;
	public String categoryRefName;
	public BigDecimal categoryRefCoef;
	public int powerPointRefCode = Integer.MIN_VALUE;
	public String powerPointRefName;
	public BigDecimal powerPointRefCoef;



	/** ***************************************** */
	public String contractNumberServices;
	public Date contractDateServices;
	public String installationType;
	public String connectionKind;
	public Date servicesPayDate;
	/** ***************************************** */




	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getNumberGen() {
		return numberGen;
	}

	public void setNumberGen(String numberGen) {
		this.numberGen = numberGen;
	}

	public Date getDateGen() {
		return dateGen;
	}

	public void setDateGen(Date dateGen) {
		this.dateGen = dateGen;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public String getBuilding() {
		return building;
	}

	public void setBuilding(String building) {
		this.building = building;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public BigDecimal getTyCurrentPower() {
		return tyCurrentPower;
	}

	public void setTyCurrentPower(BigDecimal tyCurrentPower) {
		this.tyCurrentPower = tyCurrentPower;
	}

	public BigDecimal getTyServicesPower() {
		return tyServicesPower;
	}

	public void setTyServicesPower(BigDecimal tyServicesPower) {
		this.tyServicesPower = tyServicesPower;
	}

	public String getConnectionPowerPlaces() {
		return connectionPowerPlaces;
	}

	public void setConnectionPowerPlaces(String connectionPowerPlaces) {
		this.connectionPowerPlaces = connectionPowerPlaces;
	}

	public String getConnectionPowerPlacesNum() {
		return connectionPowerPlacesNum;
	}

	public void setConnectionPowerPlacesNum(String connectionPowerPlacesNum) {
		this.connectionPowerPlacesNum = connectionPowerPlacesNum;
	}

	public String getConnectionPowerPoint() {
		return connectionPowerPoint;
	}

	public void setConnectionPowerPoint(String connectionPowerPoint) {
		this.connectionPowerPoint = connectionPowerPoint;
	}

	public String getConnectionPowerPointNum() {
		return connectionPowerPointNum;
	}

	public void setConnectionPowerPointNum(String connectionPowerPointNum) {
		this.connectionPowerPointNum = connectionPowerPointNum;
	}

	public String getConnectionSource() {
		return connectionSource;
	}

	public void setConnectionSource(String connectionSource) {
		this.connectionSource = connectionSource;
	}

	public String getConnectionSourceNum() {
		return connectionSourceNum;
	}

	public void setConnectionSourceNum(String connectionSourceNum) {
		this.connectionSourceNum = connectionSourceNum;
	}

	public BigDecimal getCat1CurrentPower() {
		return cat1CurrentPower;
	}

	public void setCat1CurrentPower(BigDecimal cat1CurrentPower) {
		this.cat1CurrentPower = cat1CurrentPower;
	}

	public BigDecimal getCat2CurrentPower() {
		return cat2CurrentPower;
	}

	public void setCat2CurrentPower(BigDecimal cat2CurrentPower) {
		this.cat2CurrentPower = cat2CurrentPower;
	}

	public BigDecimal getCat3CurrentPower() {
		return cat3CurrentPower;
	}

	public void setCat3CurrentPower(BigDecimal cat3CurrentPower) {
		this.cat3CurrentPower = cat3CurrentPower;
	}

	public BigDecimal getCat1ServicesPower() {
		return cat1ServicesPower;
	}

	public void setCat1ServicesPower(BigDecimal cat1ServicesPower) {
		this.cat1ServicesPower = cat1ServicesPower;
	}

	public BigDecimal getCat2ServicesPower() {
		return cat2ServicesPower;
	}

	public void setCat2ServicesPower(BigDecimal cat2ServicesPower) {
		this.cat2ServicesPower = cat2ServicesPower;
	}

	public BigDecimal getCat3ServicesPower() {
		return cat3ServicesPower;
	}

	public void setCat3ServicesPower(BigDecimal cat3ServicesPower) {
		this.cat3ServicesPower = cat3ServicesPower;
	}

	public BigDecimal getTyServicesPowerWaterHeating() {
		return tyServicesPowerWaterHeating;
	}

	public void setTyServicesPowerWaterHeating(BigDecimal tyServicesPowerWaterHeating) {
		this.tyServicesPowerWaterHeating = tyServicesPowerWaterHeating;
	}

	public BigDecimal getTyServicesPowerHeating() {
		return tyServicesPowerHeating;
	}

	public void setTyServicesPowerHeating(BigDecimal tyServicesPowerHeating) {
		this.tyServicesPowerHeating = tyServicesPowerHeating;
	}

	public BigDecimal getTyServicesPowerCooker() {
		return tyServicesPowerCooker;
	}

	public void setTyServicesPowerCooker(BigDecimal tyServicesPowerCooker) {
		this.tyServicesPowerCooker = tyServicesPowerCooker;
	}

	public BigDecimal getPowerGeneration() {
		return powerGeneration;
	}

	public void setPowerGeneration(BigDecimal powerGeneration) {
		this.powerGeneration = powerGeneration;
	}

	public int getYearGen() {
		return yearGen;
	}

	public void setYearGen(int yearGen) {
		this.yearGen = yearGen;
	}

	public String getPerformer() {
		return performer;
	}

	public void setPerformer(String performer) {
		this.performer = performer;
	}

	public String getPerformerPhone() {
		return performerPhone;
	}

	public void setPerformerPhone(String performerPhone) {
		this.performerPhone = performerPhone;
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

	public int getSecurityZone() {
		return securityZone;
	}

	public void setSecurityZone(int securityZone) {
		this.securityZone = securityZone;
	}

	public String getObjectSecurityZone() {
		return objectSecurityZone;
	}

	public void setObjectSecurityZone(String objectSecurityZone) {
		this.objectSecurityZone = objectSecurityZone;
	}

	public int getIdentNumber() {
		return identNumber;
	}

	public void setIdentNumber(int identNumber) {
		this.identNumber = identNumber;
	}

	public Date getDateChangeTU() {
		return dateChangeTU;
	}

	public void setDateChangeTU(Date dateChangeTU) {
		this.dateChangeTU = dateChangeTU;
	}

	public int getElementCode() {
		return elementCode;
	}

	public void setElementCode(int elementCode) {
		this.elementCode = elementCode;
	}

	public int getDepartmentCode() {
		return departmentCode;
	}

	public void setDepartmentCode(int departmentCode) {
		this.departmentCode = departmentCode;
	}

	public String getDepartmentShortName() {
		return departmentShortName;
	}

	public void setDepartmentShortName(String departmentShortName) {
		this.departmentShortName = departmentShortName;
	}

	public Date getDepartmentDateStart() {
		return departmentDateStart;
	}

	public void setDepartmentDateStart(Date departmentDateStart) {
		this.departmentDateStart = departmentDateStart;
	}

	public Date getDepartmentDateFinal() {
		return departmentDateFinal;
	}

	public void setDepartmentDateFinal(Date departmentDateFinal) {
		this.departmentDateFinal = departmentDateFinal;
	}

	public int getDepartmentRenCode() {
		return departmentRenCode;
	}

	public void setDepartmentRenCode(int departmentRenCode) {
		this.departmentRenCode = departmentRenCode;
	}

	public String getDepartmentShpzBalans() {
		return departmentShpzBalans;
	}

	public void setDepartmentShpzBalans(String departmentShpzBalans) {
		this.departmentShpzBalans = departmentShpzBalans;
	}

	public int getDepartmentKau_table_id_1884() {
		return departmentKau_table_id_1884;
	}

	public void setDepartmentKau_table_id_1884(int departmentKau_table_id_1884) {
		this.departmentKau_table_id_1884 = departmentKau_table_id_1884;
	}

	public String getDepartmentKau_1884() {
		return departmentKau_1884;
	}

	public void setDepartmentKau_1884(String departmentKau_1884) {
		this.departmentKau_1884 = departmentKau_1884;
	}

	public String getDepartmentName_1884() {
		return departmentName_1884;
	}

	public void setDepartmentName_1884(String departmentName_1884) {
		this.departmentName_1884 = departmentName_1884;
	}

	public String getDepartmentHrmorganizationid() {
		return departmentHrmorganizationid;
	}

	public void setDepartmentHrmorganizationid(String departmentHrmorganizationid) {
		this.departmentHrmorganizationid = departmentHrmorganizationid;
	}

	public int getCategoryRefCode() {
		return categoryRefCode;
	}

	public void setCategoryRefCode(int categoryRefCode) {
		this.categoryRefCode = categoryRefCode;
	}

	public String getCategoryRefName() {
		return categoryRefName;
	}

	public void setCategoryRefName(String categoryRefName) {
		this.categoryRefName = categoryRefName;
	}

	public BigDecimal getCategoryRefCoef() {
		return categoryRefCoef;
	}

	public void setCategoryRefCoef(BigDecimal categoryRefCoef) {
		this.categoryRefCoef = categoryRefCoef;
	}

	public int getPowerPointRefCode() {
		return powerPointRefCode;
	}

	public void setPowerPointRefCode(int powerPointRefCode) {
		this.powerPointRefCode = powerPointRefCode;
	}

	public String getPowerPointRefName() {
		return powerPointRefName;
	}

	public void setPowerPointRefName(String powerPointRefName) {
		this.powerPointRefName = powerPointRefName;
	}

	public BigDecimal getPowerPointRefCoef() {
		return powerPointRefCoef;
	}

	public void setPowerPointRefCoef(BigDecimal powerPointRefCoef) {
		this.powerPointRefCoef = powerPointRefCoef;
	}

	public String getContractNumberServices() {
		return contractNumberServices;
	}

	public void setContractNumberServices(String contractNumberServices) {
		this.contractNumberServices = contractNumberServices;
	}

	public Date getContractDateServices() {
		return contractDateServices;
	}

	public void setContractDateServices(Date contractDateServices) {
		this.contractDateServices = contractDateServices;
	}

	public String getInstallationType() {
		return installationType;
	}

	public void setInstallationType(String installationType) {
		this.installationType = installationType;
	}

	public String getConnectionKind() {
		return connectionKind;
	}

	public void setConnectionKind(String connectionKind) {
		this.connectionKind = connectionKind;
	}

	public Date getServicesPayDate() {
		return servicesPayDate;
	}

	public void setServicesPayDate(Date servicesPayDate) {
		this.servicesPayDate = servicesPayDate;
	}

}
