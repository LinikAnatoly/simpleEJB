
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENMetrologyCounter;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENMetrologyCounterShort implements Serializable {
	
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
	public BigDecimal cost;
	public int scCode = Integer.MIN_VALUE;
	public String counterType;
	public int phasity = Integer.MIN_VALUE;
	public int zones = Integer.MIN_VALUE;
	public int elementCode = Integer.MIN_VALUE;
	public int zoneRefCode = Integer.MIN_VALUE;
	public String zoneRefName;
	public int accountingTypeRefCode = Integer.MIN_VALUE;
	public String accountingTypeRefName;
	
    public BigDecimal sum_without_parametrizac;
    
    public int rqorderitemcode = Integer.MIN_VALUE;
    
    public int materialcode = Integer.MIN_VALUE;
    
	// Доп. поля для пломб
	/////// 
    public int typeObject = Integer.MIN_VALUE;
    public String tabnExecutor; 
    public String fioExecutor;
    public String orderBytNum;
    public Date orderBytDate;
    public boolean isEmergency;
    ///////
    
    public int lockCode = Integer.MIN_VALUE;
    public String lockReason;
    
    ///////
    public String personalAccount;
    public int departmentCode = Integer.MIN_VALUE;
    public int enestimateItemCode = Integer.MIN_VALUE;
    ///////
    
    public transient int fundingType = Integer.MIN_VALUE;
    
    public int getTypeObject() {
		return typeObject;
	}

	public void setTypeObject(int typeObject) {
		this.typeObject = typeObject;
	}

	public String getTabnExecutor() {
		return tabnExecutor;
	}

	public void setTabnExecutor(String tabnExecutor) {
		this.tabnExecutor = tabnExecutor;
	}

	public String getFioExecutor() {
		return fioExecutor;
	}

	public void setFioExecutor(String fioExecutor) {
		this.fioExecutor = fioExecutor;
	}

	public String getOrderBytNum() {
		return orderBytNum;
	}

	public void setOrderBytNum(String orderBytNum) {
		this.orderBytNum = orderBytNum;
	}

	public Date getOrderBytDate() {
		return orderBytDate;
	}

	public void setOrderBytDate(Date orderBytDate) {
		this.orderBytDate = orderBytDate;
	}

    public int getRqorderitemcode() {
		return rqorderitemcode;
	}

	public void setRqorderitemcode(int rqorderitemcode) {
		this.rqorderitemcode = rqorderitemcode;
	}

	public int getMaterialcode() {
		return materialcode;
	}

	public void setMaterialcode(int materialcode) {
		this.materialcode = materialcode;
	}

	
    
	public BigDecimal getSum_without_parametrizac() {
		return sum_without_parametrizac;
	}

	public void setSum_without_parametrizac(BigDecimal sum_without_parametrizac) {
		this.sum_without_parametrizac = sum_without_parametrizac;
	}

	public String getPersonalAccount() {
		return personalAccount;
	}

	public void setPersonalAccount(String personalAccount) {
		this.personalAccount = personalAccount;
	}

	public int getDepartmentCode() {
		return departmentCode;
	}

	public void setDepartmentCode(int departmentCode) {
		this.departmentCode = departmentCode;
	}

	public int getEnestimateItemCode() {
		return enestimateItemCode;
	}

	public void setEnestimateItemCode(int enestimateItemCode) {
		this.enestimateItemCode = enestimateItemCode;
	}

	public String getLockReason() {
		return lockReason;
	}

    public Date lockDate;
    
	public Date getLockDate() {
		return lockDate;
	}

	public void setLockDate(Date lockDate) {
		this.lockDate = lockDate;
	}

	public void setLockReason(String lockReason) {
		this.lockReason = lockReason;
	}

	public int getLockCode() {
		return lockCode;
	}
    
	public void setLockCode(int lockCode) {
		this.lockCode = lockCode;
	}


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

	public void setPhasity(int aValue){
		phasity = aValue;
	}

	public int getPhasity(){
		return phasity;
	}

	public void setZones(int aValue){
		zones = aValue;
	}

	public int getZones(){
		return zones;
	}




	public void setElementCode(int aValue){
		elementCode = aValue;
	}
	public int getElementCode(){
		return elementCode;
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

	public void setAccountingTypeRefCode(int aValue){
		accountingTypeRefCode = aValue;
	}
	public int getAccountingTypeRefCode(){
		return accountingTypeRefCode;
	}

	public void setAccountingTypeRefName(String aValue){
		accountingTypeRefName = aValue;
	}
	public String getAccountingTypeRefName(){
		return accountingTypeRefName;
	}

	public boolean getIsEmergency() {
		return isEmergency;
	}

	public void setIsEmergency(boolean aValue) {
		isEmergency = aValue;
	}

}