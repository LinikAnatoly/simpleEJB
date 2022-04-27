
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for SCCounter;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class SCCounterShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String invNumber;
	public String name;
	public String buildNumber;
	public String account;
	public String departmetFKCode;
	public String molCode;
	public Date dateIn ;
	public Date dateBuild ;
	public Date dateCheck ;
	public BigDecimal cost;
	public int scCode = Integer.MIN_VALUE;
	public String counterType;
	public String installOrderNumber;
	public String reading;
	public Date dateEdit ;
	public int isliquid = Integer.MIN_VALUE;
	public BigDecimal costOld;
	public int isMoveToZKU = Integer.MIN_VALUE;
	public String invnumberzku;
	public String namezku;
	public String accountzku;
	public BigDecimal costzku;
	public int sccodezku = Integer.MIN_VALUE;
	public int elementcode = Integer.MIN_VALUE;
	public BigDecimal phasity;
	public BigDecimal costzku_b;
	public int iszku = Integer.MIN_VALUE;
	public String lschet;
	public String placeust;
	public String priconndoc;
	public Date priconndate ;
	public BigDecimal checkperiod;
	public String actInvitationNumber;
	public Date dateInvitation ;
	public Date dateExpertise ;
	public String podrCodeZKU;
	public int fundingType = Integer.MIN_VALUE;
	public int statusRefCode = Integer.MIN_VALUE;
	public String statusRefName;
	public int estimateItemRefCode = Integer.MIN_VALUE;
	public BigDecimal estimateItemRefCountGen;
	public BigDecimal estimateItemRefCountFact;
	public BigDecimal estimateItemRefPrice;
	public BigDecimal estimateItemRefPriceVRTU;
	public BigDecimal estimateItemRefCost;
	public int estimateItemRefIsUseVAT = Integer.MIN_VALUE;
	public int estimateItemRefDeliveryTime = Integer.MIN_VALUE;
	public int estimateItemRefUseWorkTime = Integer.MIN_VALUE;
	public String estimateItemRefUserGen;
	public Date estimateItemRefDateEdit;
	public int kindRefCode = Integer.MIN_VALUE;
	public String kindRefName;
	public int zoneRefCode = Integer.MIN_VALUE;
	public String zoneRefName;
	
	public int planRefCode = Integer.MIN_VALUE;
	public int num_un = Integer.MIN_VALUE;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setInvNumber(String aValue){
		invNumber = aValue;
	}

	public String getInvNumber(){
		return invNumber;
	}

	public void setName(String aValue){
		name = aValue;
	}

	public String getName(){
		return name;
	}

	public void setBuildNumber(String aValue){
		buildNumber = aValue;
	}

	public String getBuildNumber(){
		return buildNumber;
	}

	public void setAccount(String aValue){
		account = aValue;
	}

	public String getAccount(){
		return account;
	}

	public void setDepartmetFKCode(String aValue){
		departmetFKCode = aValue;
	}

	public String getDepartmetFKCode(){
		return departmetFKCode;
	}

	public void setMolCode(String aValue){
		molCode = aValue;
	}

	public String getMolCode(){
		return molCode;
	}

	public void setDateIn(Date aValue){
		dateIn = aValue;
	}

	public Date getDateIn(){
		return dateIn;
	}

	public void setDateBuild(Date aValue){
		dateBuild = aValue;
	}

	public Date getDateBuild(){
		return dateBuild;
	}

	public void setDateCheck(Date aValue){
		dateCheck = aValue;
	}

	public Date getDateCheck(){
		return dateCheck;
	}

	public void setCost(BigDecimal aValue){
		cost = aValue;
	}

	public BigDecimal getCost(){
		return cost;
	}

	public void setScCode(int aValue){
		scCode = aValue;
	}

	public int getScCode(){
		return scCode;
	}

	public void setCounterType(String aValue){
		counterType = aValue;
	}

	public String getCounterType(){
		return counterType;
	}

	public void setInstallOrderNumber(String aValue){
		installOrderNumber = aValue;
	}

	public String getInstallOrderNumber(){
		return installOrderNumber;
	}

	public void setReading(String aValue){
		reading = aValue;
	}

	public String getReading(){
		return reading;
	}

	public void setDateEdit(Date aValue){
		dateEdit = aValue;
	}

	public Date getDateEdit(){
		return dateEdit;
	}

	public void setIsliquid(int aValue){
		isliquid = aValue;
	}

	public int getIsliquid(){
		return isliquid;
	}

	public void setCostOld(BigDecimal aValue){
		costOld = aValue;
	}

	public BigDecimal getCostOld(){
		return costOld;
	}

	public void setIsMoveToZKU(int aValue){
		isMoveToZKU = aValue;
	}

	public int getIsMoveToZKU(){
		return isMoveToZKU;
	}

	public void setInvnumberzku(String aValue){
		invnumberzku = aValue;
	}

	public String getInvnumberzku(){
		return invnumberzku;
	}

	public void setNamezku(String aValue){
		namezku = aValue;
	}

	public String getNamezku(){
		return namezku;
	}

	public void setAccountzku(String aValue){
		accountzku = aValue;
	}

	public String getAccountzku(){
		return accountzku;
	}

	public void setCostzku(BigDecimal aValue){
		costzku = aValue;
	}

	public BigDecimal getCostzku(){
		return costzku;
	}

	public void setSccodezku(int aValue){
		sccodezku = aValue;
	}

	public int getSccodezku(){
		return sccodezku;
	}

	public void setElementcode(int aValue){
		elementcode = aValue;
	}

	public int getElementcode(){
		return elementcode;
	}

	public void setPhasity(BigDecimal aValue){
		phasity = aValue;
	}

	public BigDecimal getPhasity(){
		return phasity;
	}

	public void setCostzku_b(BigDecimal aValue){
		costzku_b = aValue;
	}

	public BigDecimal getCostzku_b(){
		return costzku_b;
	}

	public void setIszku(int aValue){
		iszku = aValue;
	}

	public int getIszku(){
		return iszku;
	}

	public void setLschet(String aValue){
		lschet = aValue;
	}

	public String getLschet(){
		return lschet;
	}

	public void setPlaceust(String aValue){
		placeust = aValue;
	}

	public String getPlaceust(){
		return placeust;
	}

	public void setPriconndoc(String aValue){
		priconndoc = aValue;
	}

	public String getPriconndoc(){
		return priconndoc;
	}

	public void setPriconndate(Date aValue){
		priconndate = aValue;
	}

	public Date getPriconndate(){
		return priconndate;
	}

	public void setCheckperiod(BigDecimal aValue){
		checkperiod = aValue;
	}

	public BigDecimal getCheckperiod(){
		return checkperiod;
	}

	public void setActInvitationNumber(String aValue){
		actInvitationNumber = aValue;
	}

	public String getActInvitationNumber(){
		return actInvitationNumber;
	}

	public void setDateInvitation(Date aValue){
		dateInvitation = aValue;
	}

	public Date getDateInvitation(){
		return dateInvitation;
	}

	public void setDateExpertise(Date aValue){
		dateExpertise = aValue;
	}

	public Date getDateExpertise(){
		return dateExpertise;
	}

	public void setPodrCodeZKU(String aValue){
		podrCodeZKU = aValue;
	}

	public String getPodrCodeZKU(){
		return podrCodeZKU;
	}

	public void setFundingType(int aValue){
		fundingType = aValue;
	}

	public int getFundingType(){
		return fundingType;
	}



	public void setStatusRefCode(int aValue){
		statusRefCode = aValue;
	}
	public int getStatusRefCode(){
		return statusRefCode;
	}

	public void setStatusRefName(String aValue){
		statusRefName = aValue;
	}
	public String getStatusRefName(){
		return statusRefName;
	}

	public void setEstimateItemRefCode(int aValue){
		estimateItemRefCode = aValue;
	}
	public int getEstimateItemRefCode(){
		return estimateItemRefCode;
	}

	public void setEstimateItemRefCountGen(BigDecimal aValue){
		estimateItemRefCountGen = aValue;
	}
	public BigDecimal getEstimateItemRefCountGen(){
		return estimateItemRefCountGen;
	}

	public void setEstimateItemRefCountFact(BigDecimal aValue){
		estimateItemRefCountFact = aValue;
	}
	public BigDecimal getEstimateItemRefCountFact(){
		return estimateItemRefCountFact;
	}

	public void setEstimateItemRefPrice(BigDecimal aValue){
		estimateItemRefPrice = aValue;
	}
	public BigDecimal getEstimateItemRefPrice(){
		return estimateItemRefPrice;
	}

	public void setEstimateItemRefPriceVRTU(BigDecimal aValue){
		estimateItemRefPriceVRTU = aValue;
	}
	public BigDecimal getEstimateItemRefPriceVRTU(){
		return estimateItemRefPriceVRTU;
	}

	public void setEstimateItemRefCost(BigDecimal aValue){
		estimateItemRefCost = aValue;
	}
	public BigDecimal getEstimateItemRefCost(){
		return estimateItemRefCost;
	}

	public void setEstimateItemRefIsUseVAT(int aValue){
		estimateItemRefIsUseVAT = aValue;
	}
	public int getEstimateItemRefIsUseVAT(){
		return estimateItemRefIsUseVAT;
	}

	public void setEstimateItemRefDeliveryTime(int aValue){
		estimateItemRefDeliveryTime = aValue;
	}
	public int getEstimateItemRefDeliveryTime(){
		return estimateItemRefDeliveryTime;
	}

	public void setEstimateItemRefUseWorkTime(int aValue){
		estimateItemRefUseWorkTime = aValue;
	}
	public int getEstimateItemRefUseWorkTime(){
		return estimateItemRefUseWorkTime;
	}

	public void setEstimateItemRefUserGen(String aValue){
		estimateItemRefUserGen = aValue;
	}
	public String getEstimateItemRefUserGen(){
		return estimateItemRefUserGen;
	}

	public void setEstimateItemRefDateEdit(Date aValue){
		estimateItemRefDateEdit = aValue;
	}
	public Date getEstimateItemRefDateEdit(){
		return estimateItemRefDateEdit;
	}

	public void setKindRefCode(int aValue){
		kindRefCode = aValue;
	}
	public int getKindRefCode(){
		return kindRefCode;
	}

	public void setKindRefName(String aValue){
		kindRefName = aValue;
	}
	public String getKindRefName(){
		return kindRefName;
	}

	public void setZoneRefCode(int aValue){
		zoneRefCode = aValue;
	}
	public int getZoneRefCode(){
		return zoneRefCode;
	}

	public void setZoneRefName(String aValue){
		zoneRefName = aValue;
	}
	public String getZoneRefName(){
		return zoneRefName;
	}

	public int getPlanRefCode() {
		return planRefCode;
	}

	public void setPlanRefCode(int planRefCode) {
		this.planRefCode = planRefCode;
	}

	public int getNum_un() {
		return num_un;
	}

	public void setNum_un(int num_un) {
		this.num_un = num_un;
	}

}
