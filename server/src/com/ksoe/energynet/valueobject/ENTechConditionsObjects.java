
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

import java.io.Serializable;

/**
* Value Object for ENTechConditionsObjects;
*/

import java.math.BigDecimal;
import java.util.Date;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import com.ksoe.energynet.valueobject.references.ENConnectionPowerPointRef;
import com.ksoe.energynet.valueobject.references.ENPowerReliabilityCategoryRef;


@XmlRootElement(name = "ENTechConditionsObjects")
@XmlAccessorType(XmlAccessType.FIELD)
public class ENTechConditionsObjects implements Serializable {


	@XmlElement(defaultValue = "-2147483648")
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

	@XmlElement(defaultValue = "-2147483648")
	public int voltageCurrent = Integer.MIN_VALUE;
	@XmlElement(defaultValue = "-2147483648")
	public int voltageServices = Integer.MIN_VALUE;

	public BigDecimal powerGeneration;

	@XmlElement(defaultValue = "-2147483648")
	public int yearGen = Integer.MIN_VALUE;

	public String performer;
	public String performerPhone;
	public String userGen;
	public Date dateEdit;
	public String domain_info;

	@XmlElement(defaultValue = "-92233720368547758")
	public long modify_time = Long.MIN_VALUE;
	@XmlElement(defaultValue = "-2147483648")
	public int securityZone = Integer.MIN_VALUE;

	public String objectSecurityZone;

	@XmlElement(defaultValue = "-2147483648")
	public int identNumber = Integer.MIN_VALUE;

	public Date dateChangeTU;

	public ENElement element = new ENElement();
	public ENDepartment department = new ENDepartment();
	public ENPowerReliabilityCategoryRef categoryRef = new ENPowerReliabilityCategoryRef();
	public ENConnectionPowerPointRef powerPointRef = new ENConnectionPowerPointRef();

	public static final String tableName = "ENTECHCONDITIONSOBJCTS";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENTECHCONDITIONSOBJCTS.CODE";
	public static final String numberGen_Attr = "numberGen";
	public static final String numberGen_Field = "NUMBERGEN";
	public static final String numberGen_QFielld = "ENTECHCONDITIONSOBJCTS.NUMBERGEN";
	public static final String dateGen_Attr = "dateGen";
	public static final String dateGen_Field = "DATEGEN";
	public static final String dateGen_QFielld = "ENTECHCONDITIONSOBJCTS.DATEGEN";
	public static final String customer_Attr = "customer";
	public static final String customer_Field = "CUSTOMER";
	public static final String customer_QFielld = "ENTECHCONDITIONSOBJCTS.CUSTOMER";
	public static final String building_Attr = "building";
	public static final String building_Field = "BUILDING";
	public static final String building_QFielld = "ENTECHCONDITIONSOBJCTS.BUILDING";
	public static final String address_Attr = "address";
	public static final String address_Field = "ADDRESS";
	public static final String address_QFielld = "ENTECHCONDITIONSOBJCTS.ADDRESS";
	public static final String tyCurrentPower_Attr = "tyCurrentPower";
	public static final String tyCurrentPower_Field = "TYCURRENTPOWER";
	public static final String tyCurrentPower_QFielld = "ENTECHCONDITIONSOBJCTS.TYCURRENTPOWER";
	public static final String tyServicesPower_Attr = "tyServicesPower";
	public static final String tyServicesPower_Field = "TYSERVICESPOWER";
	public static final String tyServicesPower_QFielld = "ENTECHCONDITIONSOBJCTS.TYSERVICESPOWER";
	public static final String connectionPowerPlaces_Attr = "connectionPowerPlaces";
	public static final String connectionPowerPlaces_Field = "CONNECTIONPOWERPLACES";
	public static final String connectionPowerPlaces_QFielld = "ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPLACES";
	public static final String connectionPowerPlacesNum_Attr = "connectionPowerPlacesNum";
	public static final String connectionPowerPlacesNum_Field = "CONNECTIONPOWERPLACESNUM";
	public static final String connectionPowerPlacesNum_QFielld = "ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPLACSNM";
	public static final String connectionPowerPoint_Attr = "connectionPowerPoint";
	public static final String connectionPowerPoint_Field = "CONNECTIONPOWERPOINT";
	public static final String connectionPowerPoint_QFielld = "ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPOINT";
	public static final String connectionPowerPointNum_Attr = "connectionPowerPointNum";
	public static final String connectionPowerPointNum_Field = "CONNECTIONPOWERPOINTNUM";
	public static final String connectionPowerPointNum_QFielld = "ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPOINTNM";
	public static final String connectionSource_Attr = "connectionSource";
	public static final String connectionSource_Field = "CONNECTIONSOURCE";
	public static final String connectionSource_QFielld = "ENTECHCONDITIONSOBJCTS.CONNECTIONSOURCE";
	public static final String connectionSourceNum_Attr = "connectionSourceNum";
	public static final String connectionSourceNum_Field = "CONNECTIONSOURCENUM";
	public static final String connectionSourceNum_QFielld = "ENTECHCONDITIONSOBJCTS.CONNECTIONSOURCENUM";
	public static final String cat1CurrentPower_Attr = "cat1CurrentPower";
	public static final String cat1CurrentPower_Field = "CAT1CURRENTPOWER";
	public static final String cat1CurrentPower_QFielld = "ENTECHCONDITIONSOBJCTS.CAT1CURRENTPOWER";
	public static final String cat2CurrentPower_Attr = "cat2CurrentPower";
	public static final String cat2CurrentPower_Field = "CAT2CURRENTPOWER";
	public static final String cat2CurrentPower_QFielld = "ENTECHCONDITIONSOBJCTS.CAT2CURRENTPOWER";
	public static final String cat3CurrentPower_Attr = "cat3CurrentPower";
	public static final String cat3CurrentPower_Field = "CAT3CURRENTPOWER";
	public static final String cat3CurrentPower_QFielld = "ENTECHCONDITIONSOBJCTS.CAT3CURRENTPOWER";
	public static final String cat1ServicesPower_Attr = "cat1ServicesPower";
	public static final String cat1ServicesPower_Field = "CAT1SERVICESPOWER";
	public static final String cat1ServicesPower_QFielld = "ENTECHCONDITIONSOBJCTS.CAT1SERVICESPOWER";
	public static final String cat2ServicesPower_Attr = "cat2ServicesPower";
	public static final String cat2ServicesPower_Field = "CAT2SERVICESPOWER";
	public static final String cat2ServicesPower_QFielld = "ENTECHCONDITIONSOBJCTS.CAT2SERVICESPOWER";
	public static final String cat3ServicesPower_Attr = "cat3ServicesPower";
	public static final String cat3ServicesPower_Field = "CAT3SERVICESPOWER";
	public static final String cat3ServicesPower_QFielld = "ENTECHCONDITIONSOBJCTS.CAT3SERVICESPOWER";
	public static final String tyServicesPowerWaterHeating_Attr = "tyServicesPowerWaterHeating";
	public static final String tyServicesPowerWaterHeating_Field = "TYSERVICESPOWERWATERHEATING";
	public static final String tyServicesPowerWaterHeating_QFielld = "ENTECHCONDITIONSOBJCTS.TYSERVICESPOWERWTRHTNG";
	public static final String tyServicesPowerHeating_Attr = "tyServicesPowerHeating";
	public static final String tyServicesPowerHeating_Field = "TYSERVICESPOWERHEATING";
	public static final String tyServicesPowerHeating_QFielld = "ENTECHCONDITIONSOBJCTS.TYSERVICESPOWERHEATING";
	public static final String tyServicesPowerCooker_Attr = "tyServicesPowerCooker";
	public static final String tyServicesPowerCooker_Field = "TYSERVICESPOWERCOOKER";
	public static final String tyServicesPowerCooker_QFielld = "ENTECHCONDITIONSOBJCTS.TYSERVICESPOWERCOOKER";
	public static final String voltageCurrent_Attr = "voltageCurrent";
	public static final String voltageCurrent_Field = "VOLTAGECURRENT";
	public static final String voltageCurrent_QFielld = "ENTECHCONDITIONSOBJCTS.VOLTAGECURRENT";
	public static final String voltageServices_Attr = "voltageServices";
	public static final String voltageServices_Field = "VOLTAGESERVICES";
	public static final String voltageServices_QFielld = "ENTECHCONDITIONSOBJCTS.VOLTAGESERVICES";
	public static final String powerGeneration_Attr = "powerGeneration";
	public static final String powerGeneration_Field = "POWERGENERATION";
	public static final String powerGeneration_QFielld = "ENTECHCONDITIONSOBJCTS.POWERGENERATION";
	public static final String yearGen_Attr = "yearGen";
	public static final String yearGen_Field = "YEARGEN";
	public static final String yearGen_QFielld = "ENTECHCONDITIONSOBJCTS.YEARGEN";
	public static final String performer_Attr = "performer";
	public static final String performer_Field = "PERFORMER";
	public static final String performer_QFielld = "ENTECHCONDITIONSOBJCTS.PERFORMER";
	public static final String performerPhone_Attr = "performerPhone";
	public static final String performerPhone_Field = "PERFORMERPHONE";
	public static final String performerPhone_QFielld = "ENTECHCONDITIONSOBJCTS.PERFORMERPHONE";
	public static final String userGen_Attr = "userGen";
	public static final String userGen_Field = "USERGEN";
	public static final String userGen_QFielld = "ENTECHCONDITIONSOBJCTS.USERGEN";
	public static final String dateEdit_Attr = "dateEdit";
	public static final String dateEdit_Field = "DATEEDIT";
	public static final String dateEdit_QFielld = "ENTECHCONDITIONSOBJCTS.DATEEDIT";
	public static final String domain_info_Attr = "domain_info";
	public static final String domain_info_Field = "DOMAIN_INFO";
	public static final String domain_info_QFielld = "ENTECHCONDITIONSOBJCTS.DOMAIN_INFO";
	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "ENTECHCONDITIONSOBJCTS.MODIFY_TIME";
	public static final String securityZone_Attr = "securityZone";
	public static final String securityZone_Field = "SECURITYZONE";
	public static final String securityZone_QFielld = "ENTECHCONDITIONSOBJCTS.SECURITYZONE";
	public static final String objectSecurityZone_Attr = "objectSecurityZone";
	public static final String objectSecurityZone_Field = "OBJECTSECURITYZONE";
	public static final String objectSecurityZone_QFielld = "ENTECHCONDITIONSOBJCTS.OBJECTSECURITYZONE";
	public static final String identNumber_Attr = "identNumber";
	public static final String identNumber_Field = "IDENTNUMBER";
	public static final String identNumber_QFielld = "ENTECHCONDITIONSOBJCTS.IDENTNUMBER";
	public static final String dateChangeTU_Attr = "dateChangeTU";
	public static final String dateChangeTU_Field = "DATECHANGETU";
	public static final String dateChangeTU_QFielld = "ENTECHCONDITIONSOBJCTS.DATECHANGETU";

	public static final String element_Attr = "element";
	public static final String element_Field = "ELEMENTCODE";
	public static final String element_QFielld = "ENTECHCONDITIONSOBJCTS.ELEMENTCODE";
	public static final String department_Attr = "department";
	public static final String department_Field = "DEPARTMENTCODE";
	public static final String department_QFielld = "ENTECHCONDITIONSOBJCTS.DEPARTMENTCODE";
	public static final String categoryRef_Attr = "categoryRef";
	public static final String categoryRef_Field = "CATEGORYREFCODE";
	public static final String categoryRef_QFielld = "ENTECHCONDITIONSOBJCTS.CATEGORYREFCODE";
	public static final String powerPointRef_Attr = "powerPointRef";
	public static final String powerPointRef_Field = "POWERPOINTREFCODE";
	public static final String powerPointRef_QFielld = "ENTECHCONDITIONSOBJCTS.POWERPOINTREFCODE";

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

	public int getVoltageCurrent() {
		return voltageCurrent;
	}

	public void setVoltageCurrent(int voltageCurrent) {
		this.voltageCurrent = voltageCurrent;
	}

	public int getVoltageServices() {
		return voltageServices;
	}

	public void setVoltageServices(int voltageServices) {
		this.voltageServices = voltageServices;
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

	public String getDomain_info() {
		return domain_info;
	}

	public void setDomain_info(String domain_info) {
		this.domain_info = domain_info;
	}

	public long getModify_time() {
		return modify_time;
	}

	public void setModify_time(long modify_time) {
		this.modify_time = modify_time;
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

	public ENElement getElement() {
		return element;
	}

	public void setElement(ENElement element) {
		this.element = element;
	}

	public ENDepartment getDepartment() {
		return department;
	}

	public void setDepartment(ENDepartment department) {
		this.department = department;
	}

	public ENPowerReliabilityCategoryRef getCategoryRef() {
		return categoryRef;
	}

	public void setCategoryRef(ENPowerReliabilityCategoryRef categoryRef) {
		this.categoryRef = categoryRef;
	}

	public ENConnectionPowerPointRef getPowerPointRef() {
		return powerPointRef;
	}

	public void setPowerPointRef(ENConnectionPowerPointRef powerPointRef) {
		this.powerPointRef = powerPointRef;
	}

} // end of ENTechConditionsObjectsValueObject
