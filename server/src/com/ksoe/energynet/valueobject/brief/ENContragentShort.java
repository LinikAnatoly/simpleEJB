//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

/**
 * Short Object for ENContragent;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class ENContragentShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String contragentName;
	public String contragentAddress;
	public String contragentAddressWork;
	public String contragentPosition;
	public String contragentOkpo;
	public String contragentBankAccount;
	public String contragentBankName;
	public String contragentBankMfo;
	public String contragentBossName;
	public String contragentPassport;
	public Date warrantDate;
	public String warrantNumber;
	public String warrantFIO;
	public String warrantPassport;
	public String warrantAddress;
	public String techConditionsItem;
	public int techConObjectsCode = Integer.MIN_VALUE;
	public String techConObjectsNumberGen;
	public Date techConObjectsDateGen;
	public String techConObjectsCustomer;
	public String techConObjectsBuilding;
	public String techConObjectsAddress;
	public BigDecimal techConObjectsTyCurrentPower;
	public BigDecimal techConObjectsTyServicesPower;
	public int basisTypeCode = Integer.MIN_VALUE;
	public String basisTypeName;
	public int techCondServicesRefCode = Integer.MIN_VALUE;
	public String techCondServicesRefContractNumber;
	public Date techCondServicesRefContractDate;
	public String techCondServicesRefFinContractNumber;
	public Date techCondServicesRefFinContractDate;
	public String techCondServicesRefPartnerName;
	public String techCondServicesRefPartnerCode;
	public String techCondServicesRefFinDocCode;
	public int techCondServicesRefFinDocID = Integer.MIN_VALUE;
	public String techCondServicesRefFinCommentGen;
	public BigDecimal techCondServicesRefTySummaGen;
	public BigDecimal techCondServicesRefTySummaVat;
	public BigDecimal techCondServicesRefTyServicesSumma;
	public BigDecimal techCondServicesRefTyServicesPower;
	public String techCondServicesRefCommentServicesGen;
	public String techCondServicesRefUserGen;
	public Date techCondServicesRefDateEdit;
	public int techCondServicesRefCnPackCode = Integer.MIN_VALUE;
	public int contragentTypeCode = Integer.MIN_VALUE;
	public String contragentTypeName;

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setContragentName(String aValue) {
		contragentName = aValue;
	}

	public String getContragentName() {
		return contragentName;
	}

	public void setContragentAddress(String aValue) {
		contragentAddress = aValue;
	}

	public String getContragentAddress() {
		return contragentAddress;
	}

	public void setContragentAddressWork(String aValue) {
		contragentAddressWork = aValue;
	}

	public String getContragentAddressWork() {
		return contragentAddressWork;
	}

	public void setContragentPosition(String aValue) {
		contragentPosition = aValue;
	}

	public String getContragentPosition() {
		return contragentPosition;
	}

	public void setContragentOkpo(String aValue) {
		contragentOkpo = aValue;
	}

	public String getContragentOkpo() {
		return contragentOkpo;
	}

	public void setContragentBankAccount(String aValue) {
		contragentBankAccount = aValue;
	}

	public String getContragentBankAccount() {
		return contragentBankAccount;
	}

	public void setContragentBankName(String aValue) {
		contragentBankName = aValue;
	}

	public String getContragentBankName() {
		return contragentBankName;
	}

	public void setContragentBankMfo(String aValue) {
		contragentBankMfo = aValue;
	}

	public String getContragentBankMfo() {
		return contragentBankMfo;
	}

	public void setContragentBossName(String aValue) {
		contragentBossName = aValue;
	}

	public String getContragentBossName() {
		return contragentBossName;
	}

	public void setContragentPassport(String aValue) {
		contragentPassport = aValue;
	}

	public String getContragentPassport() {
		return contragentPassport;
	}

	public void setWarrantDate(Date aValue) {
		warrantDate = aValue;
	}

	public Date getWarrantDate() {
		return warrantDate;
	}

	public void setWarrantNumber(String aValue) {
		warrantNumber = aValue;
	}

	public String getWarrantNumber() {
		return warrantNumber;
	}

	public void setWarrantFIO(String aValue) {
		warrantFIO = aValue;
	}

	public String getWarrantFIO() {
		return warrantFIO;
	}

	public void setWarrantPassport(String aValue) {
		warrantPassport = aValue;
	}

	public String getWarrantPassport() {
		return warrantPassport;
	}

	public void setWarrantAddress(String aValue) {
		warrantAddress = aValue;
	}

	public String getWarrantAddress() {
		return warrantAddress;
	}

	public void setTechConditionsItem(String aValue) {
		techConditionsItem = aValue;
	}

	public String getTechConditionsItem() {
		return techConditionsItem;
	}

	public void setTechConObjectsCode(int aValue) {
		techConObjectsCode = aValue;
	}

	public int getTechConObjectsCode() {
		return techConObjectsCode;
	}

	public void setTechConObjectsNumberGen(String aValue) {
		techConObjectsNumberGen = aValue;
	}

	public String getTechConObjectsNumberGen() {
		return techConObjectsNumberGen;
	}

	public void setTechConObjectsDateGen(Date aValue) {
		techConObjectsDateGen = aValue;
	}

	public Date getTechConObjectsDateGen() {
		return techConObjectsDateGen;
	}

	public void setTechConObjectsCustomer(String aValue) {
		techConObjectsCustomer = aValue;
	}

	public String getTechConObjectsCustomer() {
		return techConObjectsCustomer;
	}

	public void setTechConObjectsBuilding(String aValue) {
		techConObjectsBuilding = aValue;
	}

	public String getTechConObjectsBuilding() {
		return techConObjectsBuilding;
	}

	public void setTechConObjectsAddress(String aValue) {
		techConObjectsAddress = aValue;
	}

	public String getTechConObjectsAddress() {
		return techConObjectsAddress;
	}

	public void setTechConObjectsTyCurrentPower(BigDecimal aValue) {
		techConObjectsTyCurrentPower = aValue;
	}

	public BigDecimal getTechConObjectsTyCurrentPower() {
		return techConObjectsTyCurrentPower;
	}

	public void setTechConObjectsTyServicesPower(BigDecimal aValue) {
		techConObjectsTyServicesPower = aValue;
	}

	public BigDecimal getTechConObjectsTyServicesPower() {
		return techConObjectsTyServicesPower;
	}

	public void setBasisTypeCode(int aValue) {
		basisTypeCode = aValue;
	}

	public int getBasisTypeCode() {
		return basisTypeCode;
	}

	public void setBasisTypeName(String aValue) {
		basisTypeName = aValue;
	}

	public String getBasisTypeName() {
		return basisTypeName;
	}

	public void setTechCondServicesRefCode(int aValue) {
		techCondServicesRefCode = aValue;
	}

	public int getTechCondServicesRefCode() {
		return techCondServicesRefCode;
	}

	public void setTechCondServicesRefContractNumber(String aValue) {
		techCondServicesRefContractNumber = aValue;
	}

	public String getTechCondServicesRefContractNumber() {
		return techCondServicesRefContractNumber;
	}

	public void setTechCondServicesRefContractDate(Date aValue) {
		techCondServicesRefContractDate = aValue;
	}

	public Date getTechCondServicesRefContractDate() {
		return techCondServicesRefContractDate;
	}

	public void setTechCondServicesRefFinContractNumber(String aValue) {
		techCondServicesRefFinContractNumber = aValue;
	}

	public String getTechCondServicesRefFinContractNumber() {
		return techCondServicesRefFinContractNumber;
	}

	public void setTechCondServicesRefFinContractDate(Date aValue) {
		techCondServicesRefFinContractDate = aValue;
	}

	public Date getTechCondServicesRefFinContractDate() {
		return techCondServicesRefFinContractDate;
	}

	public void setTechCondServicesRefPartnerName(String aValue) {
		techCondServicesRefPartnerName = aValue;
	}

	public String getTechCondServicesRefPartnerName() {
		return techCondServicesRefPartnerName;
	}

	public void setTechCondServicesRefPartnerCode(String aValue) {
		techCondServicesRefPartnerCode = aValue;
	}

	public String getTechCondServicesRefPartnerCode() {
		return techCondServicesRefPartnerCode;
	}

	public void setTechCondServicesRefFinDocCode(String aValue) {
		techCondServicesRefFinDocCode = aValue;
	}

	public String getTechCondServicesRefFinDocCode() {
		return techCondServicesRefFinDocCode;
	}

	public void setTechCondServicesRefFinDocID(int aValue) {
		techCondServicesRefFinDocID = aValue;
	}

	public int getTechCondServicesRefFinDocID() {
		return techCondServicesRefFinDocID;
	}

	public void setTechCondServicesRefFinCommentGen(String aValue) {
		techCondServicesRefFinCommentGen = aValue;
	}

	public String getTechCondServicesRefFinCommentGen() {
		return techCondServicesRefFinCommentGen;
	}

	public void setTechCondServicesRefTySummaGen(BigDecimal aValue) {
		techCondServicesRefTySummaGen = aValue;
	}

	public BigDecimal getTechCondServicesRefTySummaGen() {
		return techCondServicesRefTySummaGen;
	}

	public void setTechCondServicesRefTySummaVat(BigDecimal aValue) {
		techCondServicesRefTySummaVat = aValue;
	}

	public BigDecimal getTechCondServicesRefTySummaVat() {
		return techCondServicesRefTySummaVat;
	}

	public void setTechCondServicesRefTyServicesSumma(BigDecimal aValue) {
		techCondServicesRefTyServicesSumma = aValue;
	}

	public BigDecimal getTechCondServicesRefTyServicesSumma() {
		return techCondServicesRefTyServicesSumma;
	}

	public void setTechCondServicesRefTyServicesPower(BigDecimal aValue) {
		techCondServicesRefTyServicesPower = aValue;
	}

	public BigDecimal getTechCondServicesRefTyServicesPower() {
		return techCondServicesRefTyServicesPower;
	}

	public void setTechCondServicesRefCommentServicesGen(String aValue) {
		techCondServicesRefCommentServicesGen = aValue;
	}

	public String getTechCondServicesRefCommentServicesGen() {
		return techCondServicesRefCommentServicesGen;
	}

	public void setTechCondServicesRefUserGen(String aValue) {
		techCondServicesRefUserGen = aValue;
	}

	public String getTechCondServicesRefUserGen() {
		return techCondServicesRefUserGen;
	}

	public void setTechCondServicesRefDateEdit(Date aValue) {
		techCondServicesRefDateEdit = aValue;
	}

	public Date getTechCondServicesRefDateEdit() {
		return techCondServicesRefDateEdit;
	}

	public void setTechCondServicesRefCnPackCode(int aValue) {
		techCondServicesRefCnPackCode = aValue;
	}

	public int getTechCondServicesRefCnPackCode() {
		return techCondServicesRefCnPackCode;
	}

	public void setContragentTypeCode(int aValue) {
		contragentTypeCode = aValue;
	}

	public int getContragentTypeCode() {
		return contragentTypeCode;
	}

	public void setContragentTypeName(String aValue) {
		contragentTypeName = aValue;
	}

	public String getContragentTypeName() {
		return contragentTypeName;
	}

}