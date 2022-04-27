
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENRecordPointProm;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENRecordPointPromShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String accountNumber;
	public String accountName;
	public int accountCode = Integer.MIN_VALUE;
	public String counterNumber;
	public String recordPointName;
	public String recordPointAddr;
	public String recordPointKindName;
	public int recordPointCode = Integer.MIN_VALUE;
	public String feeder;
	public String substation;
	public String invNumber;
	public int dayofcalculation = Integer.MIN_VALUE;
	public String inspector;
	public Date datecontrol ;
	public Date datetp ;
	public Date dateCounterInst ;
	public Date dateCounterCheck ;
	public String counterType;
	public BigDecimal classAccuracy;
	public BigDecimal checkperiod;
	public int statuscode = Integer.MIN_VALUE;
	public BigDecimal phasity;
	public String phone;
	public String seal;
	public String placecounter;
	public int isworking = Integer.MIN_VALUE;
	public int fiderCode = Integer.MIN_VALUE;
	public String fiderName;
	public int counterCapacity = Integer.MIN_VALUE;
	public BigDecimal counterVoltageNominal;
	public Date counterDateProduct ;
	public int disablePlan = Integer.MIN_VALUE;
	public String codeEIC;
	public String tower;
	public String feeder04;
	public Date dateFirstConsumption ;
	public Date contractDate ;
	public int renCode = Integer.MIN_VALUE;
	public String renName;
	public int elementCode = Integer.MIN_VALUE;


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

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public int getAccountCode() {
		return accountCode;
	}

	public void setAccountCode(int accountCode) {
		this.accountCode = accountCode;
	}

	public String getCounterNumber() {
		return counterNumber;
	}

	public void setCounterNumber(String counterNumber) {
		this.counterNumber = counterNumber;
	}

	public String getRecordPointName() {
		return recordPointName;
	}

	public void setRecordPointName(String recordPointName) {
		this.recordPointName = recordPointName;
	}

	public String getRecordPointAddr() {
		return recordPointAddr;
	}

	public void setRecordPointAddr(String recordPointAddr) {
		this.recordPointAddr = recordPointAddr;
	}

	public String getRecordPointKindName() {
		return recordPointKindName;
	}

	public void setRecordPointKindName(String recordPointKindName) {
		this.recordPointKindName = recordPointKindName;
	}

	public int getRecordPointCode() {
		return recordPointCode;
	}

	public void setRecordPointCode(int recordPointCode) {
		this.recordPointCode = recordPointCode;
	}

	public String getFeeder() {
		return feeder;
	}

	public void setFeeder(String feeder) {
		this.feeder = feeder;
	}

	public String getSubstation() {
		return substation;
	}

	public void setSubstation(String substation) {
		this.substation = substation;
	}

	public String getInvNumber() {
		return invNumber;
	}

	public void setInvNumber(String invNumber) {
		this.invNumber = invNumber;
	}

	public int getDayofcalculation() {
		return dayofcalculation;
	}

	public void setDayofcalculation(int dayofcalculation) {
		this.dayofcalculation = dayofcalculation;
	}

	public String getInspector() {
		return inspector;
	}

	public void setInspector(String inspector) {
		this.inspector = inspector;
	}

	public Date getDatecontrol() {
		return datecontrol;
	}

	public void setDatecontrol(Date datecontrol) {
		this.datecontrol = datecontrol;
	}

	public Date getDatetp() {
		return datetp;
	}

	public void setDatetp(Date datetp) {
		this.datetp = datetp;
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

	public Date getContractDate() {
		return contractDate;
	}

	public void setContractDate(Date contractDate) {
		this.contractDate = contractDate;
	}


	public int getRenCode(){
		return renCode;
	}

	public void setRenCode(int renCode) {
		this.renCode = renCode;
	}

	public String getRenName(){
		return renName;
	}

	public void setRenName(String renName) {
		this.renName = renName;
	}

	public int getElementCode(){
		return elementCode;
	}

	public void setElementCode(int elementCode) {
		this.elementCode = elementCode;
	}



}
