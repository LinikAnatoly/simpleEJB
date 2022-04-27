
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENRecordPointByt;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENRecordPointBytShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String accountNumber;
	public Date contractDate ;
	public String name;
	public String address;
	public int rpCode = Integer.MIN_VALUE;
	public String invNumber;
	public String serialNumber;
	public Date dateCounterInst ;
	public Date dateCounterCheck ;
	public String counterType;
	public BigDecimal classAccuracy;
	public BigDecimal checkperiod;
	public int statuscode = Integer.MIN_VALUE;
	public BigDecimal phasity;
	public Date datecheck ;
	public BigDecimal checkperiod1;
	public String phone;
	public String seal;
	public String placecounter;
	public int isworking = Integer.MIN_VALUE;
	public int counterCapacity = Integer.MIN_VALUE;
	public BigDecimal counterVoltageNominal;
	public Date counterDateProduct ;
	public int areaType = Integer.MIN_VALUE;
	public int fiderCode = Integer.MIN_VALUE;
	public String fiderName;
	public int disablePlan = Integer.MIN_VALUE;
	public String codeEIC;
	public String tower;
	public String feeder04;
	public Date dateFirstConsumption ;
	public int elementCode = Integer.MIN_VALUE;
	public int siteRefCode = Integer.MIN_VALUE;
	public String siteRefName;
	public String siteRefSiteaddress;
	public String siteRefSitephone;
	
	public String renName;


	/** ********************************** */
	public int isworkingcode = Integer.MIN_VALUE;
	public String domain;
	/** ********************************** */


	public Date prevCounterCheck;
	
	public int prevCheckPeriod = Integer.MIN_VALUE;
	
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public Date getContractDate() {
		return contractDate;
	}

	public void setContractDate(Date contractDate) {
		this.contractDate = contractDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}


	public int getRpCode() {
		return rpCode;
	}

	public void setRpCode(int rpCode) {
		this.rpCode = rpCode;
	}



	public String getInvNumber() {
		return invNumber;
	}

	public void setInvNumber(String invNumber) {
		this.invNumber = invNumber;
	}

	public String getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	public Date getDateCounterInst() {
		return dateCounterInst;
	}

	public void setDateCounterInst(Date dateCounterInst) {
		this.dateCounterInst = dateCounterInst;
	}

	public Date getDateCounterCheck() {
		return dateCounterCheck;
	}

	public void setDateCounterCheck(Date dateCounterCheck) {
		this.dateCounterCheck = dateCounterCheck;
	}

	public String getCounterType() {
		return counterType;
	}

	public void setCounterType(String counterType) {
		this.counterType = counterType;
	}

	public BigDecimal getClassAccuracy() {
		return classAccuracy;
	}

	public void setClassAccuracy(BigDecimal classAccuracy) {
		this.classAccuracy = classAccuracy;
	}

	public BigDecimal getCheckperiod() {
		return checkperiod;
	}

	public void setCheckperiod(BigDecimal checkperiod) {
		this.checkperiod = checkperiod;
	}

	public int getStatuscode() {
		return statuscode;
	}

	public void setStatuscode(int statuscode) {
		this.statuscode = statuscode;
	}

	public BigDecimal getPhasity() {
		return phasity;
	}

	public void setPhasity(BigDecimal phasity) {
		this.phasity = phasity;
	}

	public Date getDatecheck() {
		return datecheck;
	}

	public void setDatecheck(Date datecheck) {
		this.datecheck = datecheck;
	}

	public BigDecimal getCheckperiod1() {
		return checkperiod1;
	}

	public void setCheckperiod1(BigDecimal checkperiod1) {
		this.checkperiod1 = checkperiod1;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSeal() {
		return seal;
	}

	public void setSeal(String seal) {
		this.seal = seal;
	}

	public String getPlacecounter() {
		return placecounter;
	}

	public void setPlacecounter(String placecounter) {
		this.placecounter = placecounter;
	}

	public int getIsworking() {
		return isworking;
	}

	public void setIsworking(int isworking) {
		this.isworking = isworking;
	}

	public int getCounterCapacity() {
		return counterCapacity;
	}

	public void setCounterCapacity(int counterCapacity) {
		this.counterCapacity = counterCapacity;
	}

	public BigDecimal getCounterVoltageNominal() {
		return counterVoltageNominal;
	}

	public void setCounterVoltageNominal(BigDecimal counterVoltageNominal) {
		this.counterVoltageNominal = counterVoltageNominal;
	}

	public Date getCounterDateProduct() {
		return counterDateProduct;
	}

	public void setCounterDateProduct(Date counterDateProduct) {
		this.counterDateProduct = counterDateProduct;
	}

	public int getAreaType() {
		return areaType;
	}

	public void setAreaType(int areaType) {
		this.areaType = areaType;
	}

	public int getFiderCode() {
		return fiderCode;
	}

	public void setFiderCode(int fiderCode) {
		this.fiderCode = fiderCode;
	}

	public String getFiderName() {
		return fiderName;
	}

	public void setFiderName(String fiderName) {
		this.fiderName = fiderName;
	}

	public int getDisablePlan() {
		return disablePlan;
	}

	public void setDisablePlan(int disablePlan) {
		this.disablePlan = disablePlan;
	}

	public String getCodeEIC() {
		return codeEIC;
	}

	public void setCodeEIC(String codeEIC) {
		this.codeEIC = codeEIC;
	}
	
	public String getRenName() {
		return this.renName;
	}
	
	public void setRenName(String value) {
		this.renName = value;
	}

	public String getTower() {
		return tower;
	}

	public void setTower(String tower) {
		this.tower = tower;
	}

	public String getFeeder04() {
		return feeder04;
	}

	public void setFeeder04(String feeder04) {
		this.feeder04 = feeder04;
	}

	public Date getDateFirstConsumption() {
		return dateFirstConsumption;
	}

	public void setDateFirstConsumption(Date dateFirstConsumption) {
		this.dateFirstConsumption = dateFirstConsumption;
	}


	public int getElementCode(){
		return elementCode;
	}

	public void setElementCode(int elementCode) {
		this.elementCode = elementCode;
	}

	public int getSiteRefCode(){
		return siteRefCode;
	}

	public void setSiteRefCode(int siteRefCode) {
		this.siteRefCode = siteRefCode;
	}

	public String getSiteRefName(){
		return siteRefName;
	}

	public void setSiteRefName(String siteRefName) {
		this.siteRefName = siteRefName;
	}

	public String getSiteRefSiteaddress(){
		return siteRefSiteaddress;
	}

	public void setSiteRefSiteaddress(String siteRefSiteaddress) {
		this.siteRefSiteaddress = siteRefSiteaddress;
	}

	public String getSiteRefSitephone(){
		return siteRefSitephone;
	}

	public void setSiteRefSitephone(String siteRefSitephone) {
		this.siteRefSitephone = siteRefSitephone;
	}

	public int getIsworkingcode() {
		return isworkingcode;
	}

	public void setIsworkingcode(int isworkingcode) {
		this.isworkingcode = isworkingcode;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public Date getPrevCounterCheck() {
		return prevCounterCheck;
	}

	public void setPrevCounterCheck(Date prevCounterCheck) {
		this.prevCounterCheck = prevCounterCheck;
	}

	public int getPrevCheckPeriod() {
		return prevCheckPeriod;
	}

	public void setPrevCheckPeriod(int prevCheckPeriod) {
		this.prevCheckPeriod = prevCheckPeriod;
	}

	
}
