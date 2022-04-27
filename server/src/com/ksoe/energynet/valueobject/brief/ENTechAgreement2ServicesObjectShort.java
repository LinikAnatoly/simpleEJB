//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

/**
 * Short Object for ENTechAgreement2ServicesObject;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class ENTechAgreement2ServicesObjectShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String partnerName;
	public String partnerCode;
	public String partnerOkpo;
	public String bankName;
	public String bankMfo;
	public String bankRSchet;
	public String contractNumber;
	public Date contractDate;
	public String finDocCode;
	public int finDocID = Integer.MIN_VALUE;
	public String commentGen;
	public String objectName;
	public BigDecimal costWorks;
	public BigDecimal costWorksNDS;
	public String basisForAction;
	public String actNumber;
	public Date actDate;
	public String executorTaxType;
	public BigDecimal area;
	public String partnerPosition;
	public String partnerFIO;
	public String partnerAddress;
	public String userGen;
	public Date dateEdit;
	public Date contractTerm;
	public int servicesObjectRefCode = Integer.MIN_VALUE;
	public String servicesObjectRefContractNumber;
	public Date servicesObjectRefContractDate;
	public String servicesObjectRefName;
	public String servicesObjectRefPartnerCode;
	public String servicesObjectRefFinDocCode;
	public int servicesObjectRefFinDocID = Integer.MIN_VALUE;
	public String servicesObjectRefCommentGen;
	public String servicesObjectRefContractNumberServices;
	public Date servicesObjectRefContractDateServices;
	public String servicesObjectRefContragentName;
	public String servicesObjectRefContragentAddress;
	public String servicesObjectRefContragentAddressWork;
	public String servicesObjectRefContragentOkpo;
	public String servicesObjectRefContragentBankAccount;
	public String servicesObjectRefContragentBankName;
	public String servicesObjectRefContragentBankMfo;
	public String servicesObjectRefContragentBossName;
	public String servicesObjectRefContragentPassport;
	public BigDecimal servicesObjectRefContractServicesSumma;
	public BigDecimal servicesObjectRefContractServicesPower;
	public String servicesObjectRefCommentServicesGen;
	public BigDecimal servicesObjectRefContractServicesDistance;
	public BigDecimal servicesObjectRefContractServicesDay;
	public String servicesObjectRefUserGen;
	public Date servicesObjectRefDateEdit;
	public Date servicesObjectRefWarrantDate;
	public String servicesObjectRefWarrantNumber;
	public String servicesObjectRefWarrantFIO;
	public int servicesObjectRefRegionalType = Integer.MIN_VALUE;
	public BigDecimal servicesObjectRefBasisType;
	public String servicesObjectRefContragentPosition;
	public Date servicesObjectRefExecuteWorkDate;
	public Date servicesObjectRefTimeStart;
	public Date servicesObjectRefTimeFinal;
	public String servicesObjectRefContragentPhoneNumber;
	public String servicesObjectRefExecutorPhoneNumber;
	public String servicesObjectRefContragentObjectWork;
	public int servicesObjectRefIsNoPay = Integer.MIN_VALUE;
	public int servicesObjectRefIsCustomerMaterials = Integer.MIN_VALUE;
	public Date servicesObjectRefPayDate;
	public int servicesObjectRefFinPayFormCode = Integer.MIN_VALUE;
	public String servicesObjectRefFinPayFormName;
	public int servicesObjectRefPartnerId = Integer.MIN_VALUE;
	public String servicesObjectRefPayDetail;
	public String servicesObjectRefActTransferNumber;
	public Date servicesObjectRefActTransferDate;
	public String servicesObjectRefResposible;
	public String servicesObjectRefResposiblePosition;
	public String servicesObjectRefResposibleTabNumber;
	public int servicesObjectRefPrevContractStatus = Integer.MIN_VALUE;
	public int servicesObjectRefReconnectionTU = Integer.MIN_VALUE;
	public int servicesObjectRefPersonalAccountCode = Integer.MIN_VALUE;
	public String servicesObjectRefPersonalAccountNumber;
	public String servicesObjectRefTabNumber;
	public String servicesObjectRefCitiesList;
	public BigDecimal servicesObjectRefLineLength;
	public String servicesObjectRefProjectCode;
	public int servicesObjectRefCnPackCode = Integer.MIN_VALUE;
	public int servicesObjectRefDfPackCode = Integer.MIN_VALUE;
	public int servicesObjectRefCountersZoneType = Integer.MIN_VALUE;
	public String servicesObjectRefAxPartnerCode;
	public String servicesObjectRefAxPartnerName;
	public String servicesObjectRefAxContractNumber;
	public Date servicesObjectRefAxContractDate;
	public String servicesObjectRefAxContractCode;
	public String servicesObjectRefAxContractId;
	public String servicesObjectRefAxContractCommentGen;
	public int agreementWarrantRefCode = Integer.MIN_VALUE;
	public String agreementWarrantRefNumbergen;
	public String agreementWarrantRefName;
	public String agreementWarrantRefWarrantFIO;
	public String agreementWarrantRefWarrantShortFIO;
	public String agreementWarrantRefWarrantPosition;
	public String agreementWarrantRefGenitiveFIO;
	public String agreementWarrantRefGenitivePosition;
	public String agreementWarrantRefPassport;
	public String agreementWarrantRefAddress;
	public int agreementWarrantRefPower = Integer.MIN_VALUE;
	public BigDecimal agreementWarrantRefMaxSum;
	public int actWarrantRefCode = Integer.MIN_VALUE;
	public String actWarrantRefNumbergen;
	public String actWarrantRefName;
	public String actWarrantRefWarrantFIO;
	public String actWarrantRefWarrantShortFIO;
	public String actWarrantRefWarrantPosition;
	public String actWarrantRefGenitiveFIO;
	public String actWarrantRefGenitivePosition;
	public String actWarrantRefPassport;
	public String actWarrantRefAddress;
	public int actWarrantRefPower = Integer.MIN_VALUE;
	public BigDecimal actWarrantRefMaxSum;
	public int servicesFromSideRefCode = Integer.MIN_VALUE;
	public String servicesFromSideRefContractNumber;
	public Date servicesFromSideRefContractDate;
	public String servicesFromSideRefName;
	public String servicesFromSideRefPartnerCode;
	public String servicesFromSideRefFinDocCode;
	public int servicesFromSideRefFinDocID = Integer.MIN_VALUE;
	public String servicesFromSideRefCommentGen;
	public String servicesFromSideRefUserGen;
	public Date servicesFromSideRefDateEdit;
	public int techAgrKindRefCode = Integer.MIN_VALUE;
	public String techAgrKindRefName;
	public int generalContractRefCode = Integer.MIN_VALUE;
	public int generalContractRefFinDocID = Integer.MIN_VALUE;
	public String generalContractRefFinDocCode;
	public String generalContractRefContractNumber;
	public Date generalContractRefContractDate;
	public String generalContractRefCommentGen;
	public int generalContractRefPartnerId = Integer.MIN_VALUE;
	public String generalContractRefPartnerCode;
	public String generalContractRefPartnerName;
	public Date generalContractRefContractRegDate;
	public Date generalContractRefContractStartDate;
	public Date generalContractRefContractEndDate;
	public String generalContractRefAxContractId;
	public String generalContractRefAxContractCode;
	public String generalContractRefAxContractNumber;
	public String generalContractRefAxContractAccount;
	public Date generalContractRefAxContractDate;
	public String generalContractRefAxContractCommentGen;
	public String generalContractRefAxContractGroupCode;
	public String generalContractRefAxPartnerCode;
	public String generalContractRefAxPartnerName;
	public String generalContractRefUserGen;

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setPartnerName(String aValue) {
		partnerName = aValue;
	}

	public String getPartnerName() {
		return partnerName;
	}

	public void setPartnerCode(String aValue) {
		partnerCode = aValue;
	}

	public String getPartnerCode() {
		return partnerCode;
	}

	public void setPartnerOkpo(String aValue) {
		partnerOkpo = aValue;
	}

	public String getPartnerOkpo() {
		return partnerOkpo;
	}

	public void setBankName(String aValue) {
		bankName = aValue;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankMfo(String aValue) {
		bankMfo = aValue;
	}

	public String getBankMfo() {
		return bankMfo;
	}

	public void setBankRSchet(String aValue) {
		bankRSchet = aValue;
	}

	public String getBankRSchet() {
		return bankRSchet;
	}

	public void setContractNumber(String aValue) {
		contractNumber = aValue;
	}

	public String getContractNumber() {
		return contractNumber;
	}

	public void setContractDate(Date aValue) {
		contractDate = aValue;
	}

	public Date getContractDate() {
		return contractDate;
	}

	public void setFinDocCode(String aValue) {
		finDocCode = aValue;
	}

	public String getFinDocCode() {
		return finDocCode;
	}

	public void setFinDocID(int aValue) {
		finDocID = aValue;
	}

	public int getFinDocID() {
		return finDocID;
	}

	public void setCommentGen(String aValue) {
		commentGen = aValue;
	}

	public String getCommentGen() {
		return commentGen;
	}

	public void setObjectName(String aValue) {
		objectName = aValue;
	}

	public String getObjectName() {
		return objectName;
	}

	public void setCostWorks(BigDecimal aValue) {
		costWorks = aValue;
	}

	public BigDecimal getCostWorks() {
		return costWorks;
	}

	public void setCostWorksNDS(BigDecimal aValue) {
		costWorksNDS = aValue;
	}

	public BigDecimal getCostWorksNDS() {
		return costWorksNDS;
	}

	public void setBasisForAction(String aValue) {
		basisForAction = aValue;
	}

	public String getBasisForAction() {
		return basisForAction;
	}

	public void setActNumber(String aValue) {
		actNumber = aValue;
	}

	public String getActNumber() {
		return actNumber;
	}

	public void setActDate(Date aValue) {
		actDate = aValue;
	}

	public Date getActDate() {
		return actDate;
	}

	public void setExecutorTaxType(String aValue) {
		executorTaxType = aValue;
	}

	public String getExecutorTaxType() {
		return executorTaxType;
	}

	public void setArea(BigDecimal aValue) {
		area = aValue;
	}

	public BigDecimal getArea() {
		return area;
	}

	public void setPartnerPosition(String aValue) {
		partnerPosition = aValue;
	}

	public String getPartnerPosition() {
		return partnerPosition;
	}

	public void setPartnerFIO(String aValue) {
		partnerFIO = aValue;
	}

	public String getPartnerFIO() {
		return partnerFIO;
	}

	public void setPartnerAddress(String aValue){
		partnerAddress = aValue;
	}

	public String getPartnerAddress(){
		return partnerAddress;
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
	
	public void setContractTerm(Date aValue) {
		contractTerm = aValue;
	}

	public Date getContractTerm() {
		return contractTerm;
	}

	public void setServicesObjectRefCode(int aValue) {
		servicesObjectRefCode = aValue;
	}

	public int getServicesObjectRefCode() {
		return servicesObjectRefCode;
	}

	public void setServicesObjectRefContractNumber(String aValue) {
		servicesObjectRefContractNumber = aValue;
	}

	public String getServicesObjectRefContractNumber() {
		return servicesObjectRefContractNumber;
	}

	public void setServicesObjectRefContractDate(Date aValue) {
		servicesObjectRefContractDate = aValue;
	}

	public Date getServicesObjectRefContractDate() {
		return servicesObjectRefContractDate;
	}

	public void setServicesObjectRefName(String aValue) {
		servicesObjectRefName = aValue;
	}

	public String getServicesObjectRefName() {
		return servicesObjectRefName;
	}

	public void setServicesObjectRefPartnerCode(String aValue) {
		servicesObjectRefPartnerCode = aValue;
	}

	public String getServicesObjectRefPartnerCode() {
		return servicesObjectRefPartnerCode;
	}

	public void setServicesObjectRefFinDocCode(String aValue) {
		servicesObjectRefFinDocCode = aValue;
	}

	public String getServicesObjectRefFinDocCode() {
		return servicesObjectRefFinDocCode;
	}

	public void setServicesObjectRefFinDocID(int aValue) {
		servicesObjectRefFinDocID = aValue;
	}

	public int getServicesObjectRefFinDocID() {
		return servicesObjectRefFinDocID;
	}

	public void setServicesObjectRefCommentGen(String aValue) {
		servicesObjectRefCommentGen = aValue;
	}

	public String getServicesObjectRefCommentGen() {
		return servicesObjectRefCommentGen;
	}

	public void setServicesObjectRefContractNumberServices(String aValue) {
		servicesObjectRefContractNumberServices = aValue;
	}

	public String getServicesObjectRefContractNumberServices() {
		return servicesObjectRefContractNumberServices;
	}

	public void setServicesObjectRefContractDateServices(Date aValue) {
		servicesObjectRefContractDateServices = aValue;
	}

	public Date getServicesObjectRefContractDateServices() {
		return servicesObjectRefContractDateServices;
	}

	public void setServicesObjectRefContragentName(String aValue) {
		servicesObjectRefContragentName = aValue;
	}

	public String getServicesObjectRefContragentName() {
		return servicesObjectRefContragentName;
	}

	public void setServicesObjectRefContragentAddress(String aValue) {
		servicesObjectRefContragentAddress = aValue;
	}

	public String getServicesObjectRefContragentAddress() {
		return servicesObjectRefContragentAddress;
	}

	public void setServicesObjectRefContragentAddressWork(String aValue) {
		servicesObjectRefContragentAddressWork = aValue;
	}

	public String getServicesObjectRefContragentAddressWork() {
		return servicesObjectRefContragentAddressWork;
	}

	public void setServicesObjectRefContragentOkpo(String aValue) {
		servicesObjectRefContragentOkpo = aValue;
	}

	public String getServicesObjectRefContragentOkpo() {
		return servicesObjectRefContragentOkpo;
	}

	public void setServicesObjectRefContragentBankAccount(String aValue) {
		servicesObjectRefContragentBankAccount = aValue;
	}

	public String getServicesObjectRefContragentBankAccount() {
		return servicesObjectRefContragentBankAccount;
	}

	public void setServicesObjectRefContragentBankName(String aValue) {
		servicesObjectRefContragentBankName = aValue;
	}

	public String getServicesObjectRefContragentBankName() {
		return servicesObjectRefContragentBankName;
	}

	public void setServicesObjectRefContragentBankMfo(String aValue) {
		servicesObjectRefContragentBankMfo = aValue;
	}

	public String getServicesObjectRefContragentBankMfo() {
		return servicesObjectRefContragentBankMfo;
	}

	public void setServicesObjectRefContragentBossName(String aValue) {
		servicesObjectRefContragentBossName = aValue;
	}

	public String getServicesObjectRefContragentBossName() {
		return servicesObjectRefContragentBossName;
	}

	public void setServicesObjectRefContragentPassport(String aValue) {
		servicesObjectRefContragentPassport = aValue;
	}

	public String getServicesObjectRefContragentPassport() {
		return servicesObjectRefContragentPassport;
	}

	public void setServicesObjectRefContractServicesSumma(BigDecimal aValue) {
		servicesObjectRefContractServicesSumma = aValue;
	}

	public BigDecimal getServicesObjectRefContractServicesSumma() {
		return servicesObjectRefContractServicesSumma;
	}

	public void setServicesObjectRefContractServicesPower(BigDecimal aValue) {
		servicesObjectRefContractServicesPower = aValue;
	}

	public BigDecimal getServicesObjectRefContractServicesPower() {
		return servicesObjectRefContractServicesPower;
	}

	public void setServicesObjectRefCommentServicesGen(String aValue) {
		servicesObjectRefCommentServicesGen = aValue;
	}

	public String getServicesObjectRefCommentServicesGen() {
		return servicesObjectRefCommentServicesGen;
	}

	public void setServicesObjectRefContractServicesDistance(BigDecimal aValue) {
		servicesObjectRefContractServicesDistance = aValue;
	}

	public BigDecimal getServicesObjectRefContractServicesDistance() {
		return servicesObjectRefContractServicesDistance;
	}

	public void setServicesObjectRefContractServicesDay(BigDecimal aValue) {
		servicesObjectRefContractServicesDay = aValue;
	}

	public BigDecimal getServicesObjectRefContractServicesDay() {
		return servicesObjectRefContractServicesDay;
	}

	public void setServicesObjectRefUserGen(String aValue) {
		servicesObjectRefUserGen = aValue;
	}

	public String getServicesObjectRefUserGen() {
		return servicesObjectRefUserGen;
	}

	public void setServicesObjectRefDateEdit(Date aValue) {
		servicesObjectRefDateEdit = aValue;
	}

	public Date getServicesObjectRefDateEdit() {
		return servicesObjectRefDateEdit;
	}

	public void setServicesObjectRefWarrantDate(Date aValue) {
		servicesObjectRefWarrantDate = aValue;
	}

	public Date getServicesObjectRefWarrantDate() {
		return servicesObjectRefWarrantDate;
	}

	public void setServicesObjectRefWarrantNumber(String aValue) {
		servicesObjectRefWarrantNumber = aValue;
	}

	public String getServicesObjectRefWarrantNumber() {
		return servicesObjectRefWarrantNumber;
	}

	public void setServicesObjectRefWarrantFIO(String aValue) {
		servicesObjectRefWarrantFIO = aValue;
	}

	public String getServicesObjectRefWarrantFIO() {
		return servicesObjectRefWarrantFIO;
	}

	public void setServicesObjectRefRegionalType(int aValue) {
		servicesObjectRefRegionalType = aValue;
	}

	public int getServicesObjectRefRegionalType() {
		return servicesObjectRefRegionalType;
	}

	public void setServicesObjectRefBasisType(BigDecimal aValue) {
		servicesObjectRefBasisType = aValue;
	}

	public BigDecimal getServicesObjectRefBasisType() {
		return servicesObjectRefBasisType;
	}

	public void setServicesObjectRefContragentPosition(String aValue) {
		servicesObjectRefContragentPosition = aValue;
	}

	public String getServicesObjectRefContragentPosition() {
		return servicesObjectRefContragentPosition;
	}

	public void setServicesObjectRefExecuteWorkDate(Date aValue) {
		servicesObjectRefExecuteWorkDate = aValue;
	}

	public Date getServicesObjectRefExecuteWorkDate() {
		return servicesObjectRefExecuteWorkDate;
	}

	public void setServicesObjectRefTimeStart(Date aValue) {
		servicesObjectRefTimeStart = aValue;
	}

	public Date getServicesObjectRefTimeStart() {
		return servicesObjectRefTimeStart;
	}

	public void setServicesObjectRefTimeFinal(Date aValue) {
		servicesObjectRefTimeFinal = aValue;
	}

	public Date getServicesObjectRefTimeFinal() {
		return servicesObjectRefTimeFinal;
	}

	public void setServicesObjectRefContragentPhoneNumber(String aValue) {
		servicesObjectRefContragentPhoneNumber = aValue;
	}

	public String getServicesObjectRefContragentPhoneNumber() {
		return servicesObjectRefContragentPhoneNumber;
	}

	public void setServicesObjectRefExecutorPhoneNumber(String aValue) {
		servicesObjectRefExecutorPhoneNumber = aValue;
	}

	public String getServicesObjectRefExecutorPhoneNumber() {
		return servicesObjectRefExecutorPhoneNumber;
	}

	public void setServicesObjectRefContragentObjectWork(String aValue) {
		servicesObjectRefContragentObjectWork = aValue;
	}

	public String getServicesObjectRefContragentObjectWork() {
		return servicesObjectRefContragentObjectWork;
	}

	public void setServicesObjectRefIsNoPay(int aValue) {
		servicesObjectRefIsNoPay = aValue;
	}

	public int getServicesObjectRefIsNoPay() {
		return servicesObjectRefIsNoPay;
	}

	public void setServicesObjectRefIsCustomerMaterials(int aValue) {
		servicesObjectRefIsCustomerMaterials = aValue;
	}

	public int getServicesObjectRefIsCustomerMaterials() {
		return servicesObjectRefIsCustomerMaterials;
	}

	public void setServicesObjectRefPayDate(Date aValue) {
		servicesObjectRefPayDate = aValue;
	}

	public Date getServicesObjectRefPayDate() {
		return servicesObjectRefPayDate;
	}

	public void setServicesObjectRefFinPayFormCode(int aValue) {
		servicesObjectRefFinPayFormCode = aValue;
	}

	public int getServicesObjectRefFinPayFormCode() {
		return servicesObjectRefFinPayFormCode;
	}

	public void setServicesObjectRefFinPayFormName(String aValue) {
		servicesObjectRefFinPayFormName = aValue;
	}

	public String getServicesObjectRefFinPayFormName() {
		return servicesObjectRefFinPayFormName;
	}

	public void setServicesObjectRefPartnerId(int aValue) {
		servicesObjectRefPartnerId = aValue;
	}

	public int getServicesObjectRefPartnerId() {
		return servicesObjectRefPartnerId;
	}

	public void setServicesObjectRefPayDetail(String aValue) {
		servicesObjectRefPayDetail = aValue;
	}

	public String getServicesObjectRefPayDetail() {
		return servicesObjectRefPayDetail;
	}

	public void setServicesObjectRefActTransferNumber(String aValue) {
		servicesObjectRefActTransferNumber = aValue;
	}

	public String getServicesObjectRefActTransferNumber() {
		return servicesObjectRefActTransferNumber;
	}

	public void setServicesObjectRefActTransferDate(Date aValue) {
		servicesObjectRefActTransferDate = aValue;
	}

	public Date getServicesObjectRefActTransferDate() {
		return servicesObjectRefActTransferDate;
	}

	public void setServicesObjectRefResposible(String aValue) {
		servicesObjectRefResposible = aValue;
	}

	public String getServicesObjectRefResposible() {
		return servicesObjectRefResposible;
	}

	public void setServicesObjectRefResposiblePosition(String aValue) {
		servicesObjectRefResposiblePosition = aValue;
	}

	public String getServicesObjectRefResposiblePosition() {
		return servicesObjectRefResposiblePosition;
	}

	public void setServicesObjectRefResposibleTabNumber(String aValue) {
		servicesObjectRefResposibleTabNumber = aValue;
	}

	public String getServicesObjectRefResposibleTabNumber() {
		return servicesObjectRefResposibleTabNumber;
	}

	public void setServicesObjectRefPrevContractStatus(int aValue) {
		servicesObjectRefPrevContractStatus = aValue;
	}

	public int getServicesObjectRefPrevContractStatus() {
		return servicesObjectRefPrevContractStatus;
	}

	public void setServicesObjectRefReconnectionTU(int aValue) {
		servicesObjectRefReconnectionTU = aValue;
	}

	public int getServicesObjectRefReconnectionTU() {
		return servicesObjectRefReconnectionTU;
	}

	public void setServicesObjectRefPersonalAccountCode(int aValue) {
		servicesObjectRefPersonalAccountCode = aValue;
	}

	public int getServicesObjectRefPersonalAccountCode() {
		return servicesObjectRefPersonalAccountCode;
	}

	public void setServicesObjectRefPersonalAccountNumber(String aValue) {
		servicesObjectRefPersonalAccountNumber = aValue;
	}

	public String getServicesObjectRefPersonalAccountNumber() {
		return servicesObjectRefPersonalAccountNumber;
	}

	public void setServicesObjectRefTabNumber(String aValue) {
		servicesObjectRefTabNumber = aValue;
	}

	public String getServicesObjectRefTabNumber() {
		return servicesObjectRefTabNumber;
	}

	public void setServicesObjectRefCitiesList(String aValue) {
		servicesObjectRefCitiesList = aValue;
	}

	public String getServicesObjectRefCitiesList() {
		return servicesObjectRefCitiesList;
	}

	public void setServicesObjectRefLineLength(BigDecimal aValue) {
		servicesObjectRefLineLength = aValue;
	}

	public BigDecimal getServicesObjectRefLineLength() {
		return servicesObjectRefLineLength;
	}

	public void setServicesObjectRefProjectCode(String aValue) {
		servicesObjectRefProjectCode = aValue;
	}

	public String getServicesObjectRefProjectCode() {
		return servicesObjectRefProjectCode;
	}

	public void setServicesObjectRefCnPackCode(int aValue) {
		servicesObjectRefCnPackCode = aValue;
	}

	public int getServicesObjectRefCnPackCode() {
		return servicesObjectRefCnPackCode;
	}

	public void setServicesObjectRefDfPackCode(int aValue) {
		servicesObjectRefDfPackCode = aValue;
	}

	public int getServicesObjectRefDfPackCode() {
		return servicesObjectRefDfPackCode;
	}

	public void setServicesObjectRefCountersZoneType(int aValue) {
		servicesObjectRefCountersZoneType = aValue;
	}

	public int getServicesObjectRefCountersZoneType() {
		return servicesObjectRefCountersZoneType;
	}

	public void setServicesObjectRefAxPartnerCode(String aValue) {
		servicesObjectRefAxPartnerCode = aValue;
	}

	public String getServicesObjectRefAxPartnerCode() {
		return servicesObjectRefAxPartnerCode;
	}

	public void setServicesObjectRefAxPartnerName(String aValue) {
		servicesObjectRefAxPartnerName = aValue;
	}

	public String getServicesObjectRefAxPartnerName() {
		return servicesObjectRefAxPartnerName;
	}

	public void setServicesObjectRefAxContractNumber(String aValue) {
		servicesObjectRefAxContractNumber = aValue;
	}

	public String getServicesObjectRefAxContractNumber() {
		return servicesObjectRefAxContractNumber;
	}

	public void setServicesObjectRefAxContractDate(Date aValue) {
		servicesObjectRefAxContractDate = aValue;
	}

	public Date getServicesObjectRefAxContractDate() {
		return servicesObjectRefAxContractDate;
	}

	public void setServicesObjectRefAxContractCode(String aValue) {
		servicesObjectRefAxContractCode = aValue;
	}

	public String getServicesObjectRefAxContractCode() {
		return servicesObjectRefAxContractCode;
	}

	public void setServicesObjectRefAxContractId(String aValue) {
		servicesObjectRefAxContractId = aValue;
	}

	public String getServicesObjectRefAxContractId() {
		return servicesObjectRefAxContractId;
	}

	public void setServicesObjectRefAxContractCommentGen(String aValue) {
		servicesObjectRefAxContractCommentGen = aValue;
	}

	public String getServicesObjectRefAxContractCommentGen() {
		return servicesObjectRefAxContractCommentGen;
	}

	public void setAgreementWarrantRefCode(int aValue) {
		agreementWarrantRefCode = aValue;
	}

	public int getAgreementWarrantRefCode() {
		return agreementWarrantRefCode;
	}

	public void setAgreementWarrantRefNumbergen(String aValue) {
		agreementWarrantRefNumbergen = aValue;
	}

	public String getAgreementWarrantRefNumbergen() {
		return agreementWarrantRefNumbergen;
	}

	public void setAgreementWarrantRefName(String aValue) {
		agreementWarrantRefName = aValue;
	}

	public String getAgreementWarrantRefName() {
		return agreementWarrantRefName;
	}

	public void setAgreementWarrantRefWarrantFIO(String aValue) {
		agreementWarrantRefWarrantFIO = aValue;
	}

	public String getAgreementWarrantRefWarrantFIO() {
		return agreementWarrantRefWarrantFIO;
	}

	public void setAgreementWarrantRefWarrantShortFIO(String aValue) {
		agreementWarrantRefWarrantShortFIO = aValue;
	}

	public String getAgreementWarrantRefWarrantShortFIO() {
		return agreementWarrantRefWarrantShortFIO;
	}

	public void setAgreementWarrantRefWarrantPosition(String aValue) {
		agreementWarrantRefWarrantPosition = aValue;
	}

	public String getAgreementWarrantRefWarrantPosition() {
		return agreementWarrantRefWarrantPosition;
	}

	public void setAgreementWarrantRefGenitiveFIO(String aValue) {
		agreementWarrantRefGenitiveFIO = aValue;
	}

	public String getAgreementWarrantRefGenitiveFIO() {
		return agreementWarrantRefGenitiveFIO;
	}

	public void setAgreementWarrantRefGenitivePosition(String aValue) {
		agreementWarrantRefGenitivePosition = aValue;
	}

	public String getAgreementWarrantRefGenitivePosition() {
		return agreementWarrantRefGenitivePosition;
	}

	public void setAgreementWarrantRefPassport(String aValue) {
		agreementWarrantRefPassport = aValue;
	}

	public String getAgreementWarrantRefPassport() {
		return agreementWarrantRefPassport;
	}

	public void setAgreementWarrantRefAddress(String aValue) {
		agreementWarrantRefAddress = aValue;
	}

	public String getAgreementWarrantRefAddress() {
		return agreementWarrantRefAddress;
	}

	public void setAgreementWarrantRefPower(int aValue) {
		agreementWarrantRefPower = aValue;
	}

	public int getAgreementWarrantRefPower() {
		return agreementWarrantRefPower;
	}

	public void setAgreementWarrantRefMaxSum(BigDecimal aValue) {
		agreementWarrantRefMaxSum = aValue;
	}

	public BigDecimal getAgreementWarrantRefMaxSum() {
		return agreementWarrantRefMaxSum;
	}

	public void setActWarrantRefCode(int aValue) {
		actWarrantRefCode = aValue;
	}

	public int getActWarrantRefCode() {
		return actWarrantRefCode;
	}

	public void setActWarrantRefNumbergen(String aValue) {
		actWarrantRefNumbergen = aValue;
	}

	public String getActWarrantRefNumbergen() {
		return actWarrantRefNumbergen;
	}

	public void setActWarrantRefName(String aValue) {
		actWarrantRefName = aValue;
	}

	public String getActWarrantRefName() {
		return actWarrantRefName;
	}

	public void setActWarrantRefWarrantFIO(String aValue) {
		actWarrantRefWarrantFIO = aValue;
	}

	public String getActWarrantRefWarrantFIO() {
		return actWarrantRefWarrantFIO;
	}

	public void setActWarrantRefWarrantShortFIO(String aValue) {
		actWarrantRefWarrantShortFIO = aValue;
	}

	public String getActWarrantRefWarrantShortFIO() {
		return actWarrantRefWarrantShortFIO;
	}

	public void setActWarrantRefWarrantPosition(String aValue) {
		actWarrantRefWarrantPosition = aValue;
	}

	public String getActWarrantRefWarrantPosition() {
		return actWarrantRefWarrantPosition;
	}

	public void setActWarrantRefGenitiveFIO(String aValue) {
		actWarrantRefGenitiveFIO = aValue;
	}

	public String getActWarrantRefGenitiveFIO() {
		return actWarrantRefGenitiveFIO;
	}

	public void setActWarrantRefGenitivePosition(String aValue) {
		actWarrantRefGenitivePosition = aValue;
	}

	public String getActWarrantRefGenitivePosition() {
		return actWarrantRefGenitivePosition;
	}

	public void setActWarrantRefPassport(String aValue) {
		actWarrantRefPassport = aValue;
	}

	public String getActWarrantRefPassport() {
		return actWarrantRefPassport;
	}

	public void setActWarrantRefAddress(String aValue) {
		actWarrantRefAddress = aValue;
	}

	public String getActWarrantRefAddress() {
		return actWarrantRefAddress;
	}

	public void setActWarrantRefPower(int aValue) {
		actWarrantRefPower = aValue;
	}

	public int getActWarrantRefPower() {
		return actWarrantRefPower;
	}

	public void setActWarrantRefMaxSum(BigDecimal aValue) {
		actWarrantRefMaxSum = aValue;
	}

	public BigDecimal getActWarrantRefMaxSum() {
		return actWarrantRefMaxSum;
	}

	public void setServicesFromSideRefCode(int aValue) {
		servicesFromSideRefCode = aValue;
	}

	public int getServicesFromSideRefCode() {
		return servicesFromSideRefCode;
	}

	public void setServicesFromSideRefContractNumber(String aValue) {
		servicesFromSideRefContractNumber = aValue;
	}

	public String getServicesFromSideRefContractNumber() {
		return servicesFromSideRefContractNumber;
	}

	public void setServicesFromSideRefContractDate(Date aValue) {
		servicesFromSideRefContractDate = aValue;
	}

	public Date getServicesFromSideRefContractDate() {
		return servicesFromSideRefContractDate;
	}

	public void setServicesFromSideRefName(String aValue) {
		servicesFromSideRefName = aValue;
	}

	public String getServicesFromSideRefName() {
		return servicesFromSideRefName;
	}

	public void setServicesFromSideRefPartnerCode(String aValue) {
		servicesFromSideRefPartnerCode = aValue;
	}

	public String getServicesFromSideRefPartnerCode() {
		return servicesFromSideRefPartnerCode;
	}

	public void setServicesFromSideRefFinDocCode(String aValue) {
		servicesFromSideRefFinDocCode = aValue;
	}

	public String getServicesFromSideRefFinDocCode() {
		return servicesFromSideRefFinDocCode;
	}

	public void setServicesFromSideRefFinDocID(int aValue) {
		servicesFromSideRefFinDocID = aValue;
	}

	public int getServicesFromSideRefFinDocID() {
		return servicesFromSideRefFinDocID;
	}

	public void setServicesFromSideRefCommentGen(String aValue) {
		servicesFromSideRefCommentGen = aValue;
	}

	public String getServicesFromSideRefCommentGen() {
		return servicesFromSideRefCommentGen;
	}

	public void setServicesFromSideRefUserGen(String aValue) {
		servicesFromSideRefUserGen = aValue;
	}

	public String getServicesFromSideRefUserGen() {
		return servicesFromSideRefUserGen;
	}

	public void setServicesFromSideRefDateEdit(Date aValue) {
		servicesFromSideRefDateEdit = aValue;
	}

	public Date getServicesFromSideRefDateEdit() {
		return servicesFromSideRefDateEdit;
	}

	public void setTechAgrKindRefCode(int aValue) {
		techAgrKindRefCode = aValue;
	}

	public int getTechAgrKindRefCode() {
		return techAgrKindRefCode;
	}

	public void setTechAgrKindRefName(String aValue) {
		techAgrKindRefName = aValue;
	}

	public String getTechAgrKindRefName() {
		return techAgrKindRefName;
	}

	public void setGeneralContractRefCode(int aValue) {
		generalContractRefCode = aValue;
	}

	public int getGeneralContractRefCode() {
		return generalContractRefCode;
	}

	public void setGeneralContractRefFinDocID(int aValue) {
		generalContractRefFinDocID = aValue;
	}

	public int getGeneralContractRefFinDocID() {
		return generalContractRefFinDocID;
	}

	public void setGeneralContractRefFinDocCode(String aValue) {
		generalContractRefFinDocCode = aValue;
	}

	public String getGeneralContractRefFinDocCode() {
		return generalContractRefFinDocCode;
	}

	public void setGeneralContractRefContractNumber(String aValue) {
		generalContractRefContractNumber = aValue;
	}

	public String getGeneralContractRefContractNumber() {
		return generalContractRefContractNumber;
	}

	public void setGeneralContractRefContractDate(Date aValue) {
		generalContractRefContractDate = aValue;
	}

	public Date getGeneralContractRefContractDate() {
		return generalContractRefContractDate;
	}

	public void setGeneralContractRefCommentGen(String aValue) {
		generalContractRefCommentGen = aValue;
	}

	public String getGeneralContractRefCommentGen() {
		return generalContractRefCommentGen;
	}

	public void setGeneralContractRefPartnerId(int aValue) {
		generalContractRefPartnerId = aValue;
	}

	public int getGeneralContractRefPartnerId() {
		return generalContractRefPartnerId;
	}

	public void setGeneralContractRefPartnerCode(String aValue) {
		generalContractRefPartnerCode = aValue;
	}

	public String getGeneralContractRefPartnerCode() {
		return generalContractRefPartnerCode;
	}

	public void setGeneralContractRefPartnerName(String aValue) {
		generalContractRefPartnerName = aValue;
	}

	public String getGeneralContractRefPartnerName() {
		return generalContractRefPartnerName;
	}

	public void setGeneralContractRefContractRegDate(Date aValue) {
		generalContractRefContractRegDate = aValue;
	}

	public Date getGeneralContractRefContractRegDate() {
		return generalContractRefContractRegDate;
	}

	public void setGeneralContractRefContractStartDate(Date aValue) {
		generalContractRefContractStartDate = aValue;
	}

	public Date getGeneralContractRefContractStartDate() {
		return generalContractRefContractStartDate;
	}

	public void setGeneralContractRefContractEndDate(Date aValue) {
		generalContractRefContractEndDate = aValue;
	}

	public Date getGeneralContractRefContractEndDate() {
		return generalContractRefContractEndDate;
	}

	public void setGeneralContractRefAxContractId(String aValue) {
		generalContractRefAxContractId = aValue;
	}

	public String getGeneralContractRefAxContractId() {
		return generalContractRefAxContractId;
	}

	public void setGeneralContractRefAxContractCode(String aValue) {
		generalContractRefAxContractCode = aValue;
	}

	public String getGeneralContractRefAxContractCode() {
		return generalContractRefAxContractCode;
	}

	public void setGeneralContractRefAxContractNumber(String aValue) {
		generalContractRefAxContractNumber = aValue;
	}

	public String getGeneralContractRefAxContractNumber() {
		return generalContractRefAxContractNumber;
	}

	public void setGeneralContractRefAxContractAccount(String aValue) {
		generalContractRefAxContractAccount = aValue;
	}

	public String getGeneralContractRefAxContractAccount() {
		return generalContractRefAxContractAccount;
	}

	public void setGeneralContractRefAxContractDate(Date aValue) {
		generalContractRefAxContractDate = aValue;
	}

	public Date getGeneralContractRefAxContractDate() {
		return generalContractRefAxContractDate;
	}

	public void setGeneralContractRefAxContractCommentGen(String aValue) {
		generalContractRefAxContractCommentGen = aValue;
	}

	public String getGeneralContractRefAxContractCommentGen() {
		return generalContractRefAxContractCommentGen;
	}

	public void setGeneralContractRefAxContractGroupCode(String aValue) {
		generalContractRefAxContractGroupCode = aValue;
	}

	public String getGeneralContractRefAxContractGroupCode() {
		return generalContractRefAxContractGroupCode;
	}

	public void setGeneralContractRefAxPartnerCode(String aValue) {
		generalContractRefAxPartnerCode = aValue;
	}

	public String getGeneralContractRefAxPartnerCode() {
		return generalContractRefAxPartnerCode;
	}

	public void setGeneralContractRefAxPartnerName(String aValue) {
		generalContractRefAxPartnerName = aValue;
	}

	public String getGeneralContractRefAxPartnerName() {
		return generalContractRefAxPartnerName;
	}

	public void setGeneralContractRefUserGen(String aValue) {
		generalContractRefUserGen = aValue;
	}

	public String getGeneralContractRefUserGen() {
		return generalContractRefUserGen;
	}

}