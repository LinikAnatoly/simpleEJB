//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

/**
 * Short Object for ENTechConditionsServices;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class ENTechConditionsServicesShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String contractNumber;
	public Date contractDate;
	public String finContractNumber;
	public Date finContractDate;
	public String partnerName;
	public String partnerCode;
	public String finDocCode;
	public int finDocID = Integer.MIN_VALUE;
	public String finCommentGen;
	public BigDecimal tySummaGen;
	public BigDecimal tySummaVat;
	public BigDecimal tyServicesSumma;
	public BigDecimal tyServicesPower;
	public String commentServicesGen;
	public String userGen;
	public Date dateEdit;
	public int cnPackCode = Integer.MIN_VALUE;
	public String executionTerm;
	public int buildersArea = Integer.MIN_VALUE;
	public int baseStation = Integer.MIN_VALUE;
	public int smallArchFrm = Integer.MIN_VALUE;
	public Date contractDateFinal;
	public int isSea = Integer.MIN_VALUE;
	public int isDisconnectionNeeded = Integer.MIN_VALUE;
	public int isUse2Tariffs = Integer.MIN_VALUE;
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
	public int warrantRefCode = Integer.MIN_VALUE;
	public String warrantRefNumbergen;
	public String warrantRefName;
	public String warrantRefWarrantFIO;
	public String warrantRefWarrantShortFIO;
	public String warrantRefWarrantPosition;
	public String warrantRefGenitiveFIO;
	public String warrantRefGenitivePosition;
	public String warrantRefPassport;
	public String warrantRefAddress;
	public int warrantRefPower = Integer.MIN_VALUE;
	public BigDecimal warrantRefMaxSum;
	public int techCondServicesStatusCode = Integer.MIN_VALUE;
	public String techCondServicesStatusName;
	public int techCondServicesTypeCode = Integer.MIN_VALUE;
	public String techCondServicesTypeName;
	public int contragentFormCode = Integer.MIN_VALUE;
	public String contragentFormName;
	public int techCondResponsiblesRefCode = Integer.MIN_VALUE;
	public String techCondResponsiblesRefResponsibleFIO;
	public int techCondResponsiblesRefResponsibleTabNumber = Integer.MIN_VALUE;
	public String techCondResponsiblesRefResponsiblePosition;
	public String techCondResponsiblesRefResponsibleDepName;
	public String techCondResponsiblesRefResponsibleDepCode;
	public String techCondResponsiblesRefResponsiblePhone;
	public int techCondResponsiblesRefPower = Integer.MIN_VALUE;
	public int cnSubsystemTypeRefCode = Integer.MIN_VALUE;
	public String cnSubsystemTypeRefName;
	public int contragentTypeRefCode = Integer.MIN_VALUE;
	public String contragentTypeRefName;
	public int connectionKindRefCode = Integer.MIN_VALUE;
	public String connectionKindRefName;
	public int tariffEntryRefCode = Integer.MIN_VALUE;
	public BigDecimal tariffEntryRefValue;
	public Date tariffEntryRefStartDate;
	public String tariffEntryRefUserGen;
	public int calcTypeRefCode = Integer.MIN_VALUE;
	public String calcTypeRefName;
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
	public int airLine04RefCode = Integer.MIN_VALUE;
	public int cableLine04RefCode = Integer.MIN_VALUE;
	public int trRefCode = Integer.MIN_VALUE;
	public int s04RefCode = Integer.MIN_VALUE;
	public int airLine10RefCode = Integer.MIN_VALUE;
	public int cableLine10RefCode = Integer.MIN_VALUE;
	public int s35RefCode = Integer.MIN_VALUE;
	public int airLine150RefCode = Integer.MIN_VALUE;
	public int cableLine150RefCode = Integer.MIN_VALUE;
	public int s150RefCode = Integer.MIN_VALUE;


    /************************************/
    public String contragentName;
    public String contragentOkpo;
    public Date dateEndPriconnection;
    public String airLine04RefInvNumber;
    public String airLine04RefName;
    public String s04RefInvNumber;
    public String s04RefName;
    public String airLine10RefInvNumber;
    public String airLine10RefName;
    public String s35RefInvNumber;
    public String s35RefName;
    /************************************/



	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
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

	public void setFinContractNumber(String aValue) {
		finContractNumber = aValue;
	}

	public String getFinContractNumber() {
		return finContractNumber;
	}

	public void setFinContractDate(Date aValue) {
		finContractDate = aValue;
	}

	public Date getFinContractDate() {
		return finContractDate;
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

	public void setFinCommentGen(String aValue) {
		finCommentGen = aValue;
	}

	public String getFinCommentGen() {
		return finCommentGen;
	}

	public void setTySummaGen(BigDecimal aValue) {
		tySummaGen = aValue;
	}

	public BigDecimal getTySummaGen() {
		return tySummaGen;
	}

	public void setTySummaVat(BigDecimal aValue) {
		tySummaVat = aValue;
	}

	public BigDecimal getTySummaVat() {
		return tySummaVat;
	}

	public void setTyServicesSumma(BigDecimal aValue) {
		tyServicesSumma = aValue;
	}

	public BigDecimal getTyServicesSumma() {
		return tyServicesSumma;
	}

	public void setTyServicesPower(BigDecimal aValue) {
		tyServicesPower = aValue;
	}

	public BigDecimal getTyServicesPower() {
		return tyServicesPower;
	}

	public void setCommentServicesGen(String aValue) {
		commentServicesGen = aValue;
	}

	public String getCommentServicesGen() {
		return commentServicesGen;
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

	public void setCnPackCode(int aValue) {
		cnPackCode = aValue;
	}

	public int getCnPackCode() {
		return cnPackCode;
	}

	public void setExecutionTerm(String aValue) {
		executionTerm = aValue;
	}

	public String getExecutionTerm() {
		return executionTerm;
	}

	public void setBuildersArea(int aValue) {
		buildersArea = aValue;
	}

	public int getBuildersArea() {
		return buildersArea;
	}

	public void setBaseStation(int aValue) {
		baseStation = aValue;
	}

	public int getBaseStation() {
		return baseStation;
	}

	public void setSmallArchFrm(int aValue) {
		smallArchFrm = aValue;
	}

	public int getSmallArchFrm() {
		return smallArchFrm;
	}

	public void setContractDateFinal(Date aValue) {
		contractDateFinal = aValue;
	}

	public Date getContractDateFinal() {
		return contractDateFinal;
	}

	public void setIsSea(int aValue) {
		isSea = aValue;
	}

	public int getIsSea() {
		return isSea;
	}

	public void setIsDisconnectionNeeded(int aValue) {
		isDisconnectionNeeded = aValue;
	}

	public int getIsDisconnectionNeeded() {
		return isDisconnectionNeeded;
	}

	public void setIsUse2Tariffs(int aValue) {
		isUse2Tariffs = aValue;
	}

	public int getIsUse2Tariffs() {
		return isUse2Tariffs;
	}

	public void setElementCode(int aValue) {
		elementCode = aValue;
	}

	public int getElementCode() {
		return elementCode;
	}

	public void setDepartmentCode(int aValue) {
		departmentCode = aValue;
	}

	public int getDepartmentCode() {
		return departmentCode;
	}

	public void setDepartmentShortName(String aValue) {
		departmentShortName = aValue;
	}

	public String getDepartmentShortName() {
		return departmentShortName;
	}

	public void setDepartmentDateStart(Date aValue) {
		departmentDateStart = aValue;
	}

	public Date getDepartmentDateStart() {
		return departmentDateStart;
	}

	public void setDepartmentDateFinal(Date aValue) {
		departmentDateFinal = aValue;
	}

	public Date getDepartmentDateFinal() {
		return departmentDateFinal;
	}

	public void setDepartmentRenCode(int aValue) {
		departmentRenCode = aValue;
	}

	public int getDepartmentRenCode() {
		return departmentRenCode;
	}

	public void setDepartmentShpzBalans(String aValue) {
		departmentShpzBalans = aValue;
	}

	public String getDepartmentShpzBalans() {
		return departmentShpzBalans;
	}

	public void setDepartmentKau_table_id_1884(int aValue) {
		departmentKau_table_id_1884 = aValue;
	}

	public int getDepartmentKau_table_id_1884() {
		return departmentKau_table_id_1884;
	}

	public void setDepartmentKau_1884(String aValue) {
		departmentKau_1884 = aValue;
	}

	public String getDepartmentKau_1884() {
		return departmentKau_1884;
	}

	public void setDepartmentName_1884(String aValue) {
		departmentName_1884 = aValue;
	}

	public String getDepartmentName_1884() {
		return departmentName_1884;
	}

	public void setDepartmentHrmorganizationid(String aValue) {
		departmentHrmorganizationid = aValue;
	}

	public String getDepartmentHrmorganizationid() {
		return departmentHrmorganizationid;
	}

	public void setWarrantRefCode(int aValue) {
		warrantRefCode = aValue;
	}

	public int getWarrantRefCode() {
		return warrantRefCode;
	}

	public void setWarrantRefNumbergen(String aValue) {
		warrantRefNumbergen = aValue;
	}

	public String getWarrantRefNumbergen() {
		return warrantRefNumbergen;
	}

	public void setWarrantRefName(String aValue) {
		warrantRefName = aValue;
	}

	public String getWarrantRefName() {
		return warrantRefName;
	}

	public void setWarrantRefWarrantFIO(String aValue) {
		warrantRefWarrantFIO = aValue;
	}

	public String getWarrantRefWarrantFIO() {
		return warrantRefWarrantFIO;
	}

	public void setWarrantRefWarrantShortFIO(String aValue) {
		warrantRefWarrantShortFIO = aValue;
	}

	public String getWarrantRefWarrantShortFIO() {
		return warrantRefWarrantShortFIO;
	}

	public void setWarrantRefWarrantPosition(String aValue) {
		warrantRefWarrantPosition = aValue;
	}

	public String getWarrantRefWarrantPosition() {
		return warrantRefWarrantPosition;
	}

	public void setWarrantRefGenitiveFIO(String aValue) {
		warrantRefGenitiveFIO = aValue;
	}

	public String getWarrantRefGenitiveFIO() {
		return warrantRefGenitiveFIO;
	}

	public void setWarrantRefGenitivePosition(String aValue) {
		warrantRefGenitivePosition = aValue;
	}

	public String getWarrantRefGenitivePosition() {
		return warrantRefGenitivePosition;
	}

	public void setWarrantRefPassport(String aValue) {
		warrantRefPassport = aValue;
	}

	public String getWarrantRefPassport() {
		return warrantRefPassport;
	}

	public void setWarrantRefAddress(String aValue) {
		warrantRefAddress = aValue;
	}

	public String getWarrantRefAddress() {
		return warrantRefAddress;
	}

	public void setWarrantRefPower(int aValue) {
		warrantRefPower = aValue;
	}

	public int getWarrantRefPower() {
		return warrantRefPower;
	}

	public void setWarrantRefMaxSum(BigDecimal aValue) {
		warrantRefMaxSum = aValue;
	}

	public BigDecimal getWarrantRefMaxSum() {
		return warrantRefMaxSum;
	}

	public void setTechCondServicesStatusCode(int aValue) {
		techCondServicesStatusCode = aValue;
	}

	public int getTechCondServicesStatusCode() {
		return techCondServicesStatusCode;
	}

	public void setTechCondServicesStatusName(String aValue) {
		techCondServicesStatusName = aValue;
	}

	public String getTechCondServicesStatusName() {
		return techCondServicesStatusName;
	}

	public void setTechCondServicesTypeCode(int aValue) {
		techCondServicesTypeCode = aValue;
	}

	public int getTechCondServicesTypeCode() {
		return techCondServicesTypeCode;
	}

	public void setTechCondServicesTypeName(String aValue) {
		techCondServicesTypeName = aValue;
	}

	public String getTechCondServicesTypeName() {
		return techCondServicesTypeName;
	}

	public void setContragentFormCode(int aValue) {
		contragentFormCode = aValue;
	}

	public int getContragentFormCode() {
		return contragentFormCode;
	}

	public void setContragentFormName(String aValue) {
		contragentFormName = aValue;
	}

	public String getContragentFormName() {
		return contragentFormName;
	}

	public void setTechCondResponsiblesRefCode(int aValue) {
		techCondResponsiblesRefCode = aValue;
	}

	public int getTechCondResponsiblesRefCode() {
		return techCondResponsiblesRefCode;
	}

	public void setTechCondResponsiblesRefResponsibleFIO(String aValue) {
		techCondResponsiblesRefResponsibleFIO = aValue;
	}

	public String getTechCondResponsiblesRefResponsibleFIO() {
		return techCondResponsiblesRefResponsibleFIO;
	}

	public void setTechCondResponsiblesRefResponsibleTabNumber(int aValue) {
		techCondResponsiblesRefResponsibleTabNumber = aValue;
	}

	public int getTechCondResponsiblesRefResponsibleTabNumber() {
		return techCondResponsiblesRefResponsibleTabNumber;
	}

	public void setTechCondResponsiblesRefResponsiblePosition(String aValue) {
		techCondResponsiblesRefResponsiblePosition = aValue;
	}

	public String getTechCondResponsiblesRefResponsiblePosition() {
		return techCondResponsiblesRefResponsiblePosition;
	}

	public void setTechCondResponsiblesRefResponsibleDepName(String aValue) {
		techCondResponsiblesRefResponsibleDepName = aValue;
	}

	public String getTechCondResponsiblesRefResponsibleDepName() {
		return techCondResponsiblesRefResponsibleDepName;
	}

	public void setTechCondResponsiblesRefResponsibleDepCode(String aValue) {
		techCondResponsiblesRefResponsibleDepCode = aValue;
	}

	public String getTechCondResponsiblesRefResponsibleDepCode() {
		return techCondResponsiblesRefResponsibleDepCode;
	}

	public void setTechCondResponsiblesRefResponsiblePhone(String aValue) {
		techCondResponsiblesRefResponsiblePhone = aValue;
	}

	public String getTechCondResponsiblesRefResponsiblePhone() {
		return techCondResponsiblesRefResponsiblePhone;
	}

	public void setTechCondResponsiblesRefPower(int aValue) {
		techCondResponsiblesRefPower = aValue;
	}

	public int getTechCondResponsiblesRefPower() {
		return techCondResponsiblesRefPower;
	}

	public void setCnSubsystemTypeRefCode(int aValue) {
		cnSubsystemTypeRefCode = aValue;
	}

	public int getCnSubsystemTypeRefCode() {
		return cnSubsystemTypeRefCode;
	}

	public void setCnSubsystemTypeRefName(String aValue) {
		cnSubsystemTypeRefName = aValue;
	}

	public String getCnSubsystemTypeRefName() {
		return cnSubsystemTypeRefName;
	}

	public void setContragentTypeRefCode(int aValue) {
		contragentTypeRefCode = aValue;
	}

	public int getContragentTypeRefCode() {
		return contragentTypeRefCode;
	}

	public void setContragentTypeRefName(String aValue) {
		contragentTypeRefName = aValue;
	}

	public String getContragentTypeRefName() {
		return contragentTypeRefName;
	}

	public void setConnectionKindRefCode(int aValue) {
		connectionKindRefCode = aValue;
	}

	public int getConnectionKindRefCode() {
		return connectionKindRefCode;
	}

	public void setConnectionKindRefName(String aValue) {
		connectionKindRefName = aValue;
	}

	public String getConnectionKindRefName() {
		return connectionKindRefName;
	}

	public void setTariffEntryRefCode(int aValue) {
		tariffEntryRefCode = aValue;
	}

	public int getTariffEntryRefCode() {
		return tariffEntryRefCode;
	}

	public void setTariffEntryRefValue(BigDecimal aValue) {
		tariffEntryRefValue = aValue;
	}

	public BigDecimal getTariffEntryRefValue() {
		return tariffEntryRefValue;
	}

	public void setTariffEntryRefStartDate(Date aValue) {
		tariffEntryRefStartDate = aValue;
	}

	public Date getTariffEntryRefStartDate() {
		return tariffEntryRefStartDate;
	}

	public void setTariffEntryRefUserGen(String aValue) {
		tariffEntryRefUserGen = aValue;
	}

	public String getTariffEntryRefUserGen() {
		return tariffEntryRefUserGen;
	}

	public void setCalcTypeRefCode(int aValue) {
		calcTypeRefCode = aValue;
	}

	public int getCalcTypeRefCode() {
		return calcTypeRefCode;
	}

	public void setCalcTypeRefName(String aValue) {
		calcTypeRefName = aValue;
	}

	public String getCalcTypeRefName() {
		return calcTypeRefName;
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

	public void setAirLine04RefCode(int aValue) {
		airLine04RefCode = aValue;
	}

	public int getAirLine04RefCode() {
		return airLine04RefCode;
	}

	public void setCableLine04RefCode(int aValue) {
		cableLine04RefCode = aValue;
	}

	public int getCableLine04RefCode() {
		return cableLine04RefCode;
	}

	public void setTrRefCode(int aValue) {
		trRefCode = aValue;
	}

	public int getTrRefCode() {
		return trRefCode;
	}

	public void setS04RefCode(int aValue) {
		s04RefCode = aValue;
	}

	public int getS04RefCode() {
		return s04RefCode;
	}

	public void setAirLine10RefCode(int aValue) {
		airLine10RefCode = aValue;
	}

	public int getAirLine10RefCode() {
		return airLine10RefCode;
	}

	public void setCableLine10RefCode(int aValue) {
		cableLine10RefCode = aValue;
	}

	public int getCableLine10RefCode() {
		return cableLine10RefCode;
	}

	public void setS35RefCode(int aValue) {
		s35RefCode = aValue;
	}

	public int getS35RefCode() {
		return s35RefCode;
	}

	public void setAirLine150RefCode(int aValue) {
		airLine150RefCode = aValue;
	}

	public int getAirLine150RefCode() {
		return airLine150RefCode;
	}

	public void setCableLine150RefCode(int aValue) {
		cableLine150RefCode = aValue;
	}

	public int getCableLine150RefCode() {
		return cableLine150RefCode;
	}

	public void setS150RefCode(int aValue) {
		s150RefCode = aValue;
	}

	public int getS150RefCode() {
		return s150RefCode;
	}

	public String getContragentName() {
		return contragentName;
	}

	public void setContragentName(String contragentName) {
		this.contragentName = contragentName;
	}

	public String getContragentOkpo() {
		return contragentOkpo;
	}

	public void setContragentOkpo(String contragentOkpo) {
		this.contragentOkpo = contragentOkpo;
	}

	public Date getDateEndPriconnection() {
		return dateEndPriconnection;
	}

	public void setDateEndPriconnection(Date dateEndPriconnection) {
		this.dateEndPriconnection = dateEndPriconnection;
	}

	public String getAirLine04RefInvNumber() {
		return airLine04RefInvNumber;
	}

	public void setAirLine04RefInvNumber(String airLine04RefInvNumber) {
		this.airLine04RefInvNumber = airLine04RefInvNumber;
	}

	public String getAirLine04RefName() {
		return airLine04RefName;
	}

	public void setAirLine04RefName(String airLine04RefName) {
		this.airLine04RefName = airLine04RefName;
	}

	public String getS04RefInvNumber() {
		return s04RefInvNumber;
	}

	public void setS04RefInvNumber(String s04RefInvNumber) {
		this.s04RefInvNumber = s04RefInvNumber;
	}

	public String getS04RefName() {
		return s04RefName;
	}

	public void setS04RefName(String s04RefName) {
		this.s04RefName = s04RefName;
	}

	public String getAirLine10RefInvNumber() {
		return airLine10RefInvNumber;
	}

	public void setAirLine10RefInvNumber(String airLine10RefInvNumber) {
		this.airLine10RefInvNumber = airLine10RefInvNumber;
	}

	public String getAirLine10RefName() {
		return airLine10RefName;
	}

	public void setAirLine10RefName(String airLine10RefName) {
		this.airLine10RefName = airLine10RefName;
	}

	public String getS35RefInvNumber() {
		return s35RefInvNumber;
	}

	public void setS35RefInvNumber(String s35RefInvNumber) {
		this.s35RefInvNumber = s35RefInvNumber;
	}

	public String getS35RefName() {
		return s35RefName;
	}

	public void setS35RefName(String s35RefName) {
		this.s35RefName = s35RefName;
	}

}