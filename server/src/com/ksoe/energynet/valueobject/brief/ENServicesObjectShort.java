
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

import java.io.Serializable;

/**
* Short Object for ENServicesObject;
*/

import java.math.BigDecimal;
import java.util.Date;

public class ENServicesObjectShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String contractNumber;
	public Date contractDate;
	public String name;
	public String partnerCode;
	public String finDocCode;
	public int finDocID = Integer.MIN_VALUE;
	public String commentGen;
	public String contractNumberServices;
	public Date contractDateServices;
	public String contragentName;
	public String contragentAddress;
	public String contragentAddressWork;
	public String contragentOkpo;
	public String contragentBankAccount;
	public String contragentBankName;
	public String contragentBankMfo;
	public String contragentBossName;
	public String contragentPassport;
	public BigDecimal contractServicesSumma;
	public BigDecimal contractServicesSummaVAT;
	public BigDecimal contractServicesPower;
	public String commentServicesGen;
	public BigDecimal contractServicesDistance;
	public BigDecimal contractServicesDay;
	public String userGen;
	public Date dateEdit;
	public Date warrantDate;
	public String warrantNumber;
	public String warrantFIO;
	public int regionalType = Integer.MIN_VALUE;
	public BigDecimal basisType;
	public String contragentPosition;
	public Date executeWorkDate;
	public Date timeStart;
	public Date timeFinal;
	public String contragentPhoneNumber;
	public String executorPhoneNumber;
	public String contragentObjectWork;
	public int isNoPay = Integer.MIN_VALUE;
	public int isCustomerMaterials = Integer.MIN_VALUE;
	public Date payDate;
	public int finPayFormCode = Integer.MIN_VALUE;
	public String finPayFormName;
	public int partnerId = Integer.MIN_VALUE;
	public String payDetail;
	public String actTransferNumber;
	public Date actTransferDate;
	public String resposible;
	public String resposiblePosition;
	public String resposibleTabNumber;
	public int prevContractStatus = Integer.MIN_VALUE;
	public int reconnectionTU = Integer.MIN_VALUE;
	public int personalAccountCode = Integer.MIN_VALUE;
	public String personalAccountNumber;
	public String tabNumber;
	public String citiesList;
	public BigDecimal lineLength;
	public String projectCode;
	public int cnPackCode = Integer.MIN_VALUE;
	public int dfPackCode = Integer.MIN_VALUE;
	public int countersZoneType = Integer.MIN_VALUE;
	public String axPartnerCode;
	public String axPartnerName;
	public String axContractNumber;
	public Date axContractDate;
	public String axContractCode;
	public String axContractId;
	public String axContractCommentGen;
	public BigDecimal projAgreeSumma;
	public BigDecimal topographySumma;
	public int createdFromSite = Integer.MIN_VALUE;
	public int term = Integer.MIN_VALUE;
	public int regulation = Integer.MIN_VALUE;
	public Date boundaryDateWork;
	public int countDayDelay = Integer.MIN_VALUE;
	public Date factDateWork;
	public String codeEIC;
	public String personalAccountUid;
	public String customerMailingAddress;
	public BigDecimal powerGeneration;
	public String postCode;
	public String customerEmail;
	public String demographicCode;
	public String ownershipRecordNumber;
	public String realEstateRegNumber;
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
	public int elementCode = Integer.MIN_VALUE;
	public int contractStatusRefCode = Integer.MIN_VALUE;
	public String contractStatusRefName;
	public int contractTypeRefCode = Integer.MIN_VALUE;
	public String contractTypeRefName;
	public int contragentTypeRefCode = Integer.MIN_VALUE;
	public String contragentTypeRefName;
	public int billStatusRefCode = Integer.MIN_VALUE;
	public String billStatusRefName;
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
	public String warrantRefDepartmentName;
	public String warrantRefDepartmentNameGenitive;
	public int statusRefCode = Integer.MIN_VALUE;
	public String statusRefName;
	public int techConObjectsCode = Integer.MIN_VALUE;
	public String techConObjectsNumberGen;
	public Date techConObjectsDateGen;
	public String techConObjectsCustomer;
	public String techConObjectsBuilding;
	public String techConObjectsAddress;
	public BigDecimal techConObjectsTyCurrentPower;
	public BigDecimal techConObjectsTyServicesPower;
	public String techConObjectsConnectionPowerPlaces;
	public String techConObjectsConnectionPowerPlacesNum;
	public String techConObjectsConnectionPowerPoint;
	public String techConObjectsConnectionPowerPointNum;
	public String techConObjectsConnectionSource;
	public String techConObjectsConnectionSourceNum;
	public BigDecimal techConObjectsCat1CurrentPower;
	public BigDecimal techConObjectsCat2CurrentPower;
	public BigDecimal techConObjectsCat3CurrentPower;
	public BigDecimal techConObjectsCat1ServicesPower;
	public BigDecimal techConObjectsCat2ServicesPower;
	public BigDecimal techConObjectsCat3ServicesPower;
	public BigDecimal techConObjectsTyServicesPowerWaterHeating;
	public BigDecimal techConObjectsTyServicesPowerHeating;
	public BigDecimal techConObjectsTyServicesPowerCooker;
	public BigDecimal techConObjectsPowerGeneration;
	public int techConObjectsYearGen = Integer.MIN_VALUE;
	public String techConObjectsPerformer;
	public String techConObjectsPerformerPhone;
	public String techConObjectsUserGen;
	public Date techConObjectsDateEdit;
	public int contractKindRefCode = Integer.MIN_VALUE;
	public String contractKindRefName;
	public int cnSubsystemTypeRefCode = Integer.MIN_VALUE;
	public String cnSubsystemTypeRefName;
	public int calcTypeRefCode = Integer.MIN_VALUE;
	public String calcTypeRefName;
	public int siteRefCode = Integer.MIN_VALUE;
	public String siteRefName;
	public String siteRefSiteaddress;
	public String siteRefSitephone;
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
	public int actIncomeCreatMetodRefCode = Integer.MIN_VALUE;
	public String actIncomeCreatMetodRefName;


	// ////////////////////////////
	public int isRed = Integer.MIN_VALUE;
	public int isYellow = Integer.MIN_VALUE;
	public Date contractRegDate;
	public Date contractStartDate;
	public BigDecimal paySum; /* сумма факт оплат по договору с НДС */
	public BigDecimal dohodSum; /* сумма с доходного акта с НДС */
	public BigDecimal sum_by_act; /*сумма по расходным актам */
	// код группы договоров из AX
	public String axContractGroupCode;
	//
	public String actnames; /* номера расходных актов по услугам на сторону */
	public String prov_exist; /* наличие проводок */
	public String node_exist; /* наличие привязки к дереву CALL-центра */
	public int nodeCount; /* количество связок с деревом CALL-центра */

	public String axContractAccount; // рег. № договора АХ
	public BigDecimal contractSumma; // Сумма договора: Собственная (sprav.v_agree)
	// ////////////////////////////



	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getContractNumber() {
		return contractNumber;
	}

	public void setContractNumber(String contractNumber) {
		this.contractNumber = contractNumber;
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

	public String getPartnerCode() {
		return partnerCode;
	}

	public void setPartnerCode(String partnerCode) {
		this.partnerCode = partnerCode;
	}

	public String getFinDocCode() {
		return finDocCode;
	}

	public void setFinDocCode(String finDocCode) {
		this.finDocCode = finDocCode;
	}

	public int getFinDocID() {
		return finDocID;
	}

	public void setFinDocID(int finDocID) {
		this.finDocID = finDocID;
	}

	public String getCommentGen() {
		return commentGen;
	}

	public void setCommentGen(String commentGen) {
		this.commentGen = commentGen;
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

	public String getContragentName() {
		return contragentName;
	}

	public void setContragentName(String contragentName) {
		this.contragentName = contragentName;
	}

	public String getContragentAddress() {
		return contragentAddress;
	}

	public void setContragentAddress(String contragentAddress) {
		this.contragentAddress = contragentAddress;
	}

	public String getContragentAddressWork() {
		return contragentAddressWork;
	}

	public void setContragentAddressWork(String contragentAddressWork) {
		this.contragentAddressWork = contragentAddressWork;
	}

	public String getContragentOkpo() {
		return contragentOkpo;
	}

	public void setContragentOkpo(String contragentOkpo) {
		this.contragentOkpo = contragentOkpo;
	}

	public String getContragentBankAccount() {
		return contragentBankAccount;
	}

	public void setContragentBankAccount(String contragentBankAccount) {
		this.contragentBankAccount = contragentBankAccount;
	}

	public String getContragentBankName() {
		return contragentBankName;
	}

	public void setContragentBankName(String contragentBankName) {
		this.contragentBankName = contragentBankName;
	}

	public String getContragentBankMfo() {
		return contragentBankMfo;
	}

	public void setContragentBankMfo(String contragentBankMfo) {
		this.contragentBankMfo = contragentBankMfo;
	}

	public String getContragentBossName() {
		return contragentBossName;
	}

	public void setContragentBossName(String contragentBossName) {
		this.contragentBossName = contragentBossName;
	}

	public String getContragentPassport() {
		return contragentPassport;
	}

	public void setContragentPassport(String contragentPassport) {
		this.contragentPassport = contragentPassport;
	}

	public BigDecimal getContractServicesSumma() {
		return contractServicesSumma;
	}

	public void setContractServicesSumma(BigDecimal contractServicesSumma) {
		this.contractServicesSumma = contractServicesSumma;
	}

	public BigDecimal getContractServicesSummaVAT() {
		return contractServicesSummaVAT;
	}

	public void setContractServicesSummaVAT(BigDecimal contractServicesSummaVAT) {
		this.contractServicesSummaVAT = contractServicesSummaVAT;
	}

	public BigDecimal getContractServicesPower() {
		return contractServicesPower;
	}

	public void setContractServicesPower(BigDecimal contractServicesPower) {
		this.contractServicesPower = contractServicesPower;
	}

	public String getCommentServicesGen() {
		return commentServicesGen;
	}

	public void setCommentServicesGen(String commentServicesGen) {
		this.commentServicesGen = commentServicesGen;
	}

	public BigDecimal getContractServicesDistance() {
		return contractServicesDistance;
	}

	public void setContractServicesDistance(BigDecimal contractServicesDistance) {
		this.contractServicesDistance = contractServicesDistance;
	}

	public BigDecimal getContractServicesDay() {
		return contractServicesDay;
	}

	public void setContractServicesDay(BigDecimal contractServicesDay) {
		this.contractServicesDay = contractServicesDay;
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

	public Date getWarrantDate() {
		return warrantDate;
	}

	public void setWarrantDate(Date warrantDate) {
		this.warrantDate = warrantDate;
	}

	public String getWarrantNumber() {
		return warrantNumber;
	}

	public void setWarrantNumber(String warrantNumber) {
		this.warrantNumber = warrantNumber;
	}

	public String getWarrantFIO() {
		return warrantFIO;
	}

	public void setWarrantFIO(String warrantFIO) {
		this.warrantFIO = warrantFIO;
	}

	public int getRegionalType() {
		return regionalType;
	}

	public void setRegionalType(int regionalType) {
		this.regionalType = regionalType;
	}

	public BigDecimal getBasisType() {
		return basisType;
	}

	public void setBasisType(BigDecimal basisType) {
		this.basisType = basisType;
	}

	public String getContragentPosition() {
		return contragentPosition;
	}

	public void setContragentPosition(String contragentPosition) {
		this.contragentPosition = contragentPosition;
	}

	public Date getExecuteWorkDate() {
		return executeWorkDate;
	}

	public void setExecuteWorkDate(Date executeWorkDate) {
		this.executeWorkDate = executeWorkDate;
	}

	public Date getTimeStart() {
		return timeStart;
	}

	public void setTimeStart(Date timeStart) {
		this.timeStart = timeStart;
	}

	public Date getTimeFinal() {
		return timeFinal;
	}

	public void setTimeFinal(Date timeFinal) {
		this.timeFinal = timeFinal;
	}

	public String getContragentPhoneNumber() {
		return contragentPhoneNumber;
	}

	public void setContragentPhoneNumber(String contragentPhoneNumber) {
		this.contragentPhoneNumber = contragentPhoneNumber;
	}

	public String getExecutorPhoneNumber() {
		return executorPhoneNumber;
	}

	public void setExecutorPhoneNumber(String executorPhoneNumber) {
		this.executorPhoneNumber = executorPhoneNumber;
	}

	public String getContragentObjectWork() {
		return contragentObjectWork;
	}

	public void setContragentObjectWork(String contragentObjectWork) {
		this.contragentObjectWork = contragentObjectWork;
	}

	public int getIsNoPay() {
		return isNoPay;
	}

	public void setIsNoPay(int isNoPay) {
		this.isNoPay = isNoPay;
	}

	public int getIsCustomerMaterials() {
		return isCustomerMaterials;
	}

	public void setIsCustomerMaterials(int isCustomerMaterials) {
		this.isCustomerMaterials = isCustomerMaterials;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public int getFinPayFormCode() {
		return finPayFormCode;
	}

	public void setFinPayFormCode(int finPayFormCode) {
		this.finPayFormCode = finPayFormCode;
	}

	public String getFinPayFormName() {
		return finPayFormName;
	}

	public void setFinPayFormName(String finPayFormName) {
		this.finPayFormName = finPayFormName;
	}

	public int getPartnerId() {
		return partnerId;
	}

	public void setPartnerId(int partnerId) {
		this.partnerId = partnerId;
	}

	public String getPayDetail() {
		return payDetail;
	}

	public void setPayDetail(String payDetail) {
		this.payDetail = payDetail;
	}

	public String getActTransferNumber() {
		return actTransferNumber;
	}

	public void setActTransferNumber(String actTransferNumber) {
		this.actTransferNumber = actTransferNumber;
	}

	public Date getActTransferDate() {
		return actTransferDate;
	}

	public void setActTransferDate(Date actTransferDate) {
		this.actTransferDate = actTransferDate;
	}

	public String getResposible() {
		return resposible;
	}

	public void setResposible(String resposible) {
		this.resposible = resposible;
	}

	public String getResposiblePosition() {
		return resposiblePosition;
	}

	public void setResposiblePosition(String resposiblePosition) {
		this.resposiblePosition = resposiblePosition;
	}

	public String getResposibleTabNumber() {
		return resposibleTabNumber;
	}

	public void setResposibleTabNumber(String resposibleTabNumber) {
		this.resposibleTabNumber = resposibleTabNumber;
	}

	public int getPrevContractStatus() {
		return prevContractStatus;
	}

	public void setPrevContractStatus(int prevContractStatus) {
		this.prevContractStatus = prevContractStatus;
	}

	public int getReconnectionTU() {
		return reconnectionTU;
	}

	public void setReconnectionTU(int reconnectionTU) {
		this.reconnectionTU = reconnectionTU;
	}

	public int getPersonalAccountCode() {
		return personalAccountCode;
	}

	public void setPersonalAccountCode(int personalAccountCode) {
		this.personalAccountCode = personalAccountCode;
	}

	public String getPersonalAccountNumber() {
		return personalAccountNumber;
	}

	public void setPersonalAccountNumber(String personalAccountNumber) {
		this.personalAccountNumber = personalAccountNumber;
	}

	public String getTabNumber() {
		return tabNumber;
	}

	public void setTabNumber(String tabNumber) {
		this.tabNumber = tabNumber;
	}

	public String getCitiesList() {
		return citiesList;
	}

	public void setCitiesList(String citiesList) {
		this.citiesList = citiesList;
	}

	public BigDecimal getLineLength() {
		return lineLength;
	}

	public void setLineLength(BigDecimal lineLength) {
		this.lineLength = lineLength;
	}

	public String getProjectCode() {
		return projectCode;
	}

	public void setProjectCode(String projectCode) {
		this.projectCode = projectCode;
	}

	public int getCnPackCode() {
		return cnPackCode;
	}

	public void setCnPackCode(int cnPackCode) {
		this.cnPackCode = cnPackCode;
	}

	public int getDfPackCode() {
		return dfPackCode;
	}

	public void setDfPackCode(int dfPackCode) {
		this.dfPackCode = dfPackCode;
	}

	public int getCountersZoneType() {
		return countersZoneType;
	}

	public void setCountersZoneType(int countersZoneType) {
		this.countersZoneType = countersZoneType;
	}

	public String getAxPartnerCode() {
		return axPartnerCode;
	}

	public void setAxPartnerCode(String axPartnerCode) {
		this.axPartnerCode = axPartnerCode;
	}

	public String getAxPartnerName() {
		return axPartnerName;
	}

	public void setAxPartnerName(String axPartnerName) {
		this.axPartnerName = axPartnerName;
	}

	public String getAxContractNumber() {
		return axContractNumber;
	}

	public void setAxContractNumber(String axContractNumber) {
		this.axContractNumber = axContractNumber;
	}

	public Date getAxContractDate() {
		return axContractDate;
	}

	public void setAxContractDate(Date axContractDate) {
		this.axContractDate = axContractDate;
	}

	public String getAxContractCode() {
		return axContractCode;
	}

	public void setAxContractCode(String axContractCode) {
		this.axContractCode = axContractCode;
	}

	public String getAxContractId() {
		return axContractId;
	}

	public void setAxContractId(String axContractId) {
		this.axContractId = axContractId;
	}

	public String getAxContractCommentGen() {
		return axContractCommentGen;
	}

	public void setAxContractCommentGen(String axContractCommentGen) {
		this.axContractCommentGen = axContractCommentGen;
	}

	public BigDecimal getProjAgreeSumma() {
		return projAgreeSumma;
	}

	public void setProjAgreeSumma(BigDecimal projAgreeSumma) {
		this.projAgreeSumma = projAgreeSumma;
	}

	public BigDecimal getTopographySumma() {
		return topographySumma;
	}

	public void setTopographySumma(BigDecimal topographySumma) {
		this.topographySumma = topographySumma;
	}

	public int getCreatedFromSite() {
		return createdFromSite;
	}

	public void setCreatedFromSite(int createdFromSite) {
		this.createdFromSite = createdFromSite;
	}

	public int getTerm() {
		return term;
	}

	public void setTerm(int term) {
		this.term = term;
	}

	public int getRegulation() {
		return regulation;
	}

	public void setRegulation(int regulation) {
		this.regulation = regulation;
	}

	public Date getBoundaryDateWork() {
		return boundaryDateWork;
	}

	public void setBoundaryDateWork(Date boundaryDateWork) {
		this.boundaryDateWork = boundaryDateWork;
	}

	public int getCountDayDelay() {
		return countDayDelay;
	}

	public void setCountDayDelay(int countDayDelay) {
		this.countDayDelay = countDayDelay;
	}

	public Date getFactDateWork() {
		return factDateWork;
	}

	public void setFactDateWork(Date factDateWork) {
		this.factDateWork = factDateWork;
	}

	public String getCodeEIC() {
		return codeEIC;
	}

	public void setCodeEIC(String codeEIC) {
		this.codeEIC = codeEIC;
	}

	public String getPersonalAccountUid() {
		return personalAccountUid;
	}

	public void setPersonalAccountUid(String personalAccountUid) {
		this.personalAccountUid = personalAccountUid;
	}

	public String getCustomerMailingAddress() {
		return customerMailingAddress;
	}

	public void setCustomerMailingAddress(String customerMailingAddress) {
		this.customerMailingAddress = customerMailingAddress;
	}

	public BigDecimal getPowerGeneration() {
		return powerGeneration;
	}

	public void setPowerGeneration(BigDecimal powerGeneration) {
		this.powerGeneration = powerGeneration;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}


	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}



	public String getDemographicCode() {
		return demographicCode;
	}

	public void setDemographicCode(String demographicCode) {
		this.demographicCode = demographicCode;
	}

	public String getOwnershipRecordNumber() {
		return ownershipRecordNumber;
	}

	public void setOwnershipRecordNumber(String ownershipRecordNumber) {
		this.ownershipRecordNumber = ownershipRecordNumber;
	}

	public String getRealEstateRegNumber() {
		return realEstateRegNumber;
	}

	public void setRealEstateRegNumber(String realEstateRegNumber) {
		this.realEstateRegNumber = realEstateRegNumber;
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

	public int getElementCode() {
		return elementCode;
	}

	public void setElementCode(int elementCode) {
		this.elementCode = elementCode;
	}

	public int getContractStatusRefCode() {
		return contractStatusRefCode;
	}

	public void setContractStatusRefCode(int contractStatusRefCode) {
		this.contractStatusRefCode = contractStatusRefCode;
	}

	public String getContractStatusRefName() {
		return contractStatusRefName;
	}

	public void setContractStatusRefName(String contractStatusRefName) {
		this.contractStatusRefName = contractStatusRefName;
	}

	public int getContractTypeRefCode() {
		return contractTypeRefCode;
	}

	public void setContractTypeRefCode(int contractTypeRefCode) {
		this.contractTypeRefCode = contractTypeRefCode;
	}

	public String getContractTypeRefName() {
		return contractTypeRefName;
	}

	public void setContractTypeRefName(String contractTypeRefName) {
		this.contractTypeRefName = contractTypeRefName;
	}

	public int getContragentTypeRefCode() {
		return contragentTypeRefCode;
	}

	public void setContragentTypeRefCode(int contragentTypeRefCode) {
		this.contragentTypeRefCode = contragentTypeRefCode;
	}

	public String getContragentTypeRefName() {
		return contragentTypeRefName;
	}

	public void setContragentTypeRefName(String contragentTypeRefName) {
		this.contragentTypeRefName = contragentTypeRefName;
	}

	public int getBillStatusRefCode() {
		return billStatusRefCode;
	}

	public void setBillStatusRefCode(int billStatusRefCode) {
		this.billStatusRefCode = billStatusRefCode;
	}

	public String getBillStatusRefName() {
		return billStatusRefName;
	}

	public void setBillStatusRefName(String billStatusRefName) {
		this.billStatusRefName = billStatusRefName;
	}

	public int getWarrantRefCode() {
		return warrantRefCode;
	}

	public void setWarrantRefCode(int warrantRefCode) {
		this.warrantRefCode = warrantRefCode;
	}

	public String getWarrantRefNumbergen() {
		return warrantRefNumbergen;
	}

	public void setWarrantRefNumbergen(String warrantRefNumbergen) {
		this.warrantRefNumbergen = warrantRefNumbergen;
	}

	public String getWarrantRefName() {
		return warrantRefName;
	}

	public void setWarrantRefName(String warrantRefName) {
		this.warrantRefName = warrantRefName;
	}

	public String getWarrantRefWarrantFIO() {
		return warrantRefWarrantFIO;
	}

	public void setWarrantRefWarrantFIO(String warrantRefWarrantFIO) {
		this.warrantRefWarrantFIO = warrantRefWarrantFIO;
	}

	public String getWarrantRefWarrantShortFIO() {
		return warrantRefWarrantShortFIO;
	}

	public void setWarrantRefWarrantShortFIO(String warrantRefWarrantShortFIO) {
		this.warrantRefWarrantShortFIO = warrantRefWarrantShortFIO;
	}

	public String getWarrantRefWarrantPosition() {
		return warrantRefWarrantPosition;
	}

	public void setWarrantRefWarrantPosition(String warrantRefWarrantPosition) {
		this.warrantRefWarrantPosition = warrantRefWarrantPosition;
	}

	public String getWarrantRefGenitiveFIO() {
		return warrantRefGenitiveFIO;
	}

	public void setWarrantRefGenitiveFIO(String warrantRefGenitiveFIO) {
		this.warrantRefGenitiveFIO = warrantRefGenitiveFIO;
	}

	public String getWarrantRefGenitivePosition() {
		return warrantRefGenitivePosition;
	}

	public void setWarrantRefGenitivePosition(String warrantRefGenitivePosition) {
		this.warrantRefGenitivePosition = warrantRefGenitivePosition;
	}

	public String getWarrantRefPassport() {
		return warrantRefPassport;
	}

	public void setWarrantRefPassport(String warrantRefPassport) {
		this.warrantRefPassport = warrantRefPassport;
	}

	public String getWarrantRefAddress() {
		return warrantRefAddress;
	}

	public void setWarrantRefAddress(String warrantRefAddress) {
		this.warrantRefAddress = warrantRefAddress;
	}

	public int getWarrantRefPower() {
		return warrantRefPower;
	}

	public void setWarrantRefPower(int warrantRefPower) {
		this.warrantRefPower = warrantRefPower;
	}

	public BigDecimal getWarrantRefMaxSum() {
		return warrantRefMaxSum;
	}

	public void setWarrantRefMaxSum(BigDecimal warrantRefMaxSum) {
		this.warrantRefMaxSum = warrantRefMaxSum;
	}

	public String getWarrantRefDepartmentName() {
		return warrantRefDepartmentName;
	}

	public void setWarrantRefDepartmentName(String warrantRefDepartmentName) {
		this.warrantRefDepartmentName = warrantRefDepartmentName;
	}

	public String getWarrantRefDepartmentNameGenitive() {
		return warrantRefDepartmentNameGenitive;
	}

	public void setWarrantRefDepartmentNameGenitive(String warrantRefDepartmentNameGenitive) {
		this.warrantRefDepartmentNameGenitive = warrantRefDepartmentNameGenitive;
	}

	public int getStatusRefCode() {
		return statusRefCode;
	}

	public void setStatusRefCode(int statusRefCode) {
		this.statusRefCode = statusRefCode;
	}

	public String getStatusRefName() {
		return statusRefName;
	}

	public void setStatusRefName(String statusRefName) {
		this.statusRefName = statusRefName;
	}

	public int getTechConObjectsCode() {
		return techConObjectsCode;
	}

	public void setTechConObjectsCode(int techConObjectsCode) {
		this.techConObjectsCode = techConObjectsCode;
	}

	public String getTechConObjectsNumberGen() {
		return techConObjectsNumberGen;
	}

	public void setTechConObjectsNumberGen(String techConObjectsNumberGen) {
		this.techConObjectsNumberGen = techConObjectsNumberGen;
	}

	public Date getTechConObjectsDateGen() {
		return techConObjectsDateGen;
	}

	public void setTechConObjectsDateGen(Date techConObjectsDateGen) {
		this.techConObjectsDateGen = techConObjectsDateGen;
	}

	public String getTechConObjectsCustomer() {
		return techConObjectsCustomer;
	}

	public void setTechConObjectsCustomer(String techConObjectsCustomer) {
		this.techConObjectsCustomer = techConObjectsCustomer;
	}

	public String getTechConObjectsBuilding() {
		return techConObjectsBuilding;
	}

	public void setTechConObjectsBuilding(String techConObjectsBuilding) {
		this.techConObjectsBuilding = techConObjectsBuilding;
	}

	public String getTechConObjectsAddress() {
		return techConObjectsAddress;
	}

	public void setTechConObjectsAddress(String techConObjectsAddress) {
		this.techConObjectsAddress = techConObjectsAddress;
	}

	public BigDecimal getTechConObjectsTyCurrentPower() {
		return techConObjectsTyCurrentPower;
	}

	public void setTechConObjectsTyCurrentPower(BigDecimal techConObjectsTyCurrentPower) {
		this.techConObjectsTyCurrentPower = techConObjectsTyCurrentPower;
	}

	public BigDecimal getTechConObjectsTyServicesPower() {
		return techConObjectsTyServicesPower;
	}

	public void setTechConObjectsTyServicesPower(BigDecimal techConObjectsTyServicesPower) {
		this.techConObjectsTyServicesPower = techConObjectsTyServicesPower;
	}

	public String getTechConObjectsConnectionPowerPlaces() {
		return techConObjectsConnectionPowerPlaces;
	}

	public void setTechConObjectsConnectionPowerPlaces(String techConObjectsConnectionPowerPlaces) {
		this.techConObjectsConnectionPowerPlaces = techConObjectsConnectionPowerPlaces;
	}

	public String getTechConObjectsConnectionPowerPlacesNum() {
		return techConObjectsConnectionPowerPlacesNum;
	}

	public void setTechConObjectsConnectionPowerPlacesNum(String techConObjectsConnectionPowerPlacesNum) {
		this.techConObjectsConnectionPowerPlacesNum = techConObjectsConnectionPowerPlacesNum;
	}

	public String getTechConObjectsConnectionPowerPoint() {
		return techConObjectsConnectionPowerPoint;
	}

	public void setTechConObjectsConnectionPowerPoint(String techConObjectsConnectionPowerPoint) {
		this.techConObjectsConnectionPowerPoint = techConObjectsConnectionPowerPoint;
	}

	public String getTechConObjectsConnectionPowerPointNum() {
		return techConObjectsConnectionPowerPointNum;
	}

	public void setTechConObjectsConnectionPowerPointNum(String techConObjectsConnectionPowerPointNum) {
		this.techConObjectsConnectionPowerPointNum = techConObjectsConnectionPowerPointNum;
	}

	public String getTechConObjectsConnectionSource() {
		return techConObjectsConnectionSource;
	}

	public void setTechConObjectsConnectionSource(String techConObjectsConnectionSource) {
		this.techConObjectsConnectionSource = techConObjectsConnectionSource;
	}

	public String getTechConObjectsConnectionSourceNum() {
		return techConObjectsConnectionSourceNum;
	}

	public void setTechConObjectsConnectionSourceNum(String techConObjectsConnectionSourceNum) {
		this.techConObjectsConnectionSourceNum = techConObjectsConnectionSourceNum;
	}

	public BigDecimal getTechConObjectsCat1CurrentPower() {
		return techConObjectsCat1CurrentPower;
	}

	public void setTechConObjectsCat1CurrentPower(BigDecimal techConObjectsCat1CurrentPower) {
		this.techConObjectsCat1CurrentPower = techConObjectsCat1CurrentPower;
	}

	public BigDecimal getTechConObjectsCat2CurrentPower() {
		return techConObjectsCat2CurrentPower;
	}

	public void setTechConObjectsCat2CurrentPower(BigDecimal techConObjectsCat2CurrentPower) {
		this.techConObjectsCat2CurrentPower = techConObjectsCat2CurrentPower;
	}

	public BigDecimal getTechConObjectsCat3CurrentPower() {
		return techConObjectsCat3CurrentPower;
	}

	public void setTechConObjectsCat3CurrentPower(BigDecimal techConObjectsCat3CurrentPower) {
		this.techConObjectsCat3CurrentPower = techConObjectsCat3CurrentPower;
	}

	public BigDecimal getTechConObjectsCat1ServicesPower() {
		return techConObjectsCat1ServicesPower;
	}

	public void setTechConObjectsCat1ServicesPower(BigDecimal techConObjectsCat1ServicesPower) {
		this.techConObjectsCat1ServicesPower = techConObjectsCat1ServicesPower;
	}

	public BigDecimal getTechConObjectsCat2ServicesPower() {
		return techConObjectsCat2ServicesPower;
	}

	public void setTechConObjectsCat2ServicesPower(BigDecimal techConObjectsCat2ServicesPower) {
		this.techConObjectsCat2ServicesPower = techConObjectsCat2ServicesPower;
	}

	public BigDecimal getTechConObjectsCat3ServicesPower() {
		return techConObjectsCat3ServicesPower;
	}

	public void setTechConObjectsCat3ServicesPower(BigDecimal techConObjectsCat3ServicesPower) {
		this.techConObjectsCat3ServicesPower = techConObjectsCat3ServicesPower;
	}

	public BigDecimal getTechConObjectsTyServicesPowerWaterHeating() {
		return techConObjectsTyServicesPowerWaterHeating;
	}

	public void setTechConObjectsTyServicesPowerWaterHeating(BigDecimal techConObjectsTyServicesPowerWaterHeating) {
		this.techConObjectsTyServicesPowerWaterHeating = techConObjectsTyServicesPowerWaterHeating;
	}

	public BigDecimal getTechConObjectsTyServicesPowerHeating() {
		return techConObjectsTyServicesPowerHeating;
	}

	public void setTechConObjectsTyServicesPowerHeating(BigDecimal techConObjectsTyServicesPowerHeating) {
		this.techConObjectsTyServicesPowerHeating = techConObjectsTyServicesPowerHeating;
	}

	public BigDecimal getTechConObjectsTyServicesPowerCooker() {
		return techConObjectsTyServicesPowerCooker;
	}

	public void setTechConObjectsTyServicesPowerCooker(BigDecimal techConObjectsTyServicesPowerCooker) {
		this.techConObjectsTyServicesPowerCooker = techConObjectsTyServicesPowerCooker;
	}

	public BigDecimal getTechConObjectsPowerGeneration() {
		return techConObjectsPowerGeneration;
	}

	public void setTechConObjectsPowerGeneration(BigDecimal techConObjectsPowerGeneration) {
		this.techConObjectsPowerGeneration = techConObjectsPowerGeneration;
	}

	public int getTechConObjectsYearGen() {
		return techConObjectsYearGen;
	}

	public void setTechConObjectsYearGen(int techConObjectsYearGen) {
		this.techConObjectsYearGen = techConObjectsYearGen;
	}

	public String getTechConObjectsPerformer() {
		return techConObjectsPerformer;
	}

	public void setTechConObjectsPerformer(String techConObjectsPerformer) {
		this.techConObjectsPerformer = techConObjectsPerformer;
	}

	public String getTechConObjectsPerformerPhone() {
		return techConObjectsPerformerPhone;
	}

	public void setTechConObjectsPerformerPhone(String techConObjectsPerformerPhone) {
		this.techConObjectsPerformerPhone = techConObjectsPerformerPhone;
	}

	public String getTechConObjectsUserGen() {
		return techConObjectsUserGen;
	}

	public void setTechConObjectsUserGen(String techConObjectsUserGen) {
		this.techConObjectsUserGen = techConObjectsUserGen;
	}

	public Date getTechConObjectsDateEdit() {
		return techConObjectsDateEdit;
	}

	public void setTechConObjectsDateEdit(Date techConObjectsDateEdit) {
		this.techConObjectsDateEdit = techConObjectsDateEdit;
	}

	public int getContractKindRefCode() {
		return contractKindRefCode;
	}

	public void setContractKindRefCode(int contractKindRefCode) {
		this.contractKindRefCode = contractKindRefCode;
	}

	public String getContractKindRefName() {
		return contractKindRefName;
	}

	public void setContractKindRefName(String contractKindRefName) {
		this.contractKindRefName = contractKindRefName;
	}

	public int getCnSubsystemTypeRefCode() {
		return cnSubsystemTypeRefCode;
	}

	public void setCnSubsystemTypeRefCode(int cnSubsystemTypeRefCode) {
		this.cnSubsystemTypeRefCode = cnSubsystemTypeRefCode;
	}

	public String getCnSubsystemTypeRefName() {
		return cnSubsystemTypeRefName;
	}

	public void setCnSubsystemTypeRefName(String cnSubsystemTypeRefName) {
		this.cnSubsystemTypeRefName = cnSubsystemTypeRefName;
	}

	public int getCalcTypeRefCode() {
		return calcTypeRefCode;
	}

	public void setCalcTypeRefCode(int calcTypeRefCode) {
		this.calcTypeRefCode = calcTypeRefCode;
	}

	public String getCalcTypeRefName() {
		return calcTypeRefName;
	}

	public void setCalcTypeRefName(String calcTypeRefName) {
		this.calcTypeRefName = calcTypeRefName;
	}

	public int getSiteRefCode() {
		return siteRefCode;
	}

	public void setSiteRefCode(int siteRefCode) {
		this.siteRefCode = siteRefCode;
	}

	public String getSiteRefName() {
		return siteRefName;
	}

	public void setSiteRefName(String siteRefName) {
		this.siteRefName = siteRefName;
	}

	public String getSiteRefSiteaddress() {
		return siteRefSiteaddress;
	}

	public void setSiteRefSiteaddress(String siteRefSiteaddress) {
		this.siteRefSiteaddress = siteRefSiteaddress;
	}

	public String getSiteRefSitephone() {
		return siteRefSitephone;
	}

	public void setSiteRefSitephone(String siteRefSitephone) {
		this.siteRefSitephone = siteRefSitephone;
	}

	public int getGeneralContractRefCode() {
		return generalContractRefCode;
	}

	public void setGeneralContractRefCode(int generalContractRefCode) {
		this.generalContractRefCode = generalContractRefCode;
	}

	public int getGeneralContractRefFinDocID() {
		return generalContractRefFinDocID;
	}

	public void setGeneralContractRefFinDocID(int generalContractRefFinDocID) {
		this.generalContractRefFinDocID = generalContractRefFinDocID;
	}

	public String getGeneralContractRefFinDocCode() {
		return generalContractRefFinDocCode;
	}

	public void setGeneralContractRefFinDocCode(String generalContractRefFinDocCode) {
		this.generalContractRefFinDocCode = generalContractRefFinDocCode;
	}

	public String getGeneralContractRefContractNumber() {
		return generalContractRefContractNumber;
	}

	public void setGeneralContractRefContractNumber(String generalContractRefContractNumber) {
		this.generalContractRefContractNumber = generalContractRefContractNumber;
	}

	public Date getGeneralContractRefContractDate() {
		return generalContractRefContractDate;
	}

	public void setGeneralContractRefContractDate(Date generalContractRefContractDate) {
		this.generalContractRefContractDate = generalContractRefContractDate;
	}

	public String getGeneralContractRefCommentGen() {
		return generalContractRefCommentGen;
	}

	public void setGeneralContractRefCommentGen(String generalContractRefCommentGen) {
		this.generalContractRefCommentGen = generalContractRefCommentGen;
	}

	public int getGeneralContractRefPartnerId() {
		return generalContractRefPartnerId;
	}

	public void setGeneralContractRefPartnerId(int generalContractRefPartnerId) {
		this.generalContractRefPartnerId = generalContractRefPartnerId;
	}

	public String getGeneralContractRefPartnerCode() {
		return generalContractRefPartnerCode;
	}

	public void setGeneralContractRefPartnerCode(String generalContractRefPartnerCode) {
		this.generalContractRefPartnerCode = generalContractRefPartnerCode;
	}

	public String getGeneralContractRefPartnerName() {
		return generalContractRefPartnerName;
	}

	public void setGeneralContractRefPartnerName(String generalContractRefPartnerName) {
		this.generalContractRefPartnerName = generalContractRefPartnerName;
	}

	public Date getGeneralContractRefContractRegDate() {
		return generalContractRefContractRegDate;
	}

	public void setGeneralContractRefContractRegDate(Date generalContractRefContractRegDate) {
		this.generalContractRefContractRegDate = generalContractRefContractRegDate;
	}

	public Date getGeneralContractRefContractStartDate() {
		return generalContractRefContractStartDate;
	}

	public void setGeneralContractRefContractStartDate(Date generalContractRefContractStartDate) {
		this.generalContractRefContractStartDate = generalContractRefContractStartDate;
	}

	public Date getGeneralContractRefContractEndDate() {
		return generalContractRefContractEndDate;
	}

	public void setGeneralContractRefContractEndDate(Date generalContractRefContractEndDate) {
		this.generalContractRefContractEndDate = generalContractRefContractEndDate;
	}

	public String getGeneralContractRefAxContractId() {
		return generalContractRefAxContractId;
	}

	public void setGeneralContractRefAxContractId(String generalContractRefAxContractId) {
		this.generalContractRefAxContractId = generalContractRefAxContractId;
	}

	public String getGeneralContractRefAxContractCode() {
		return generalContractRefAxContractCode;
	}

	public void setGeneralContractRefAxContractCode(String generalContractRefAxContractCode) {
		this.generalContractRefAxContractCode = generalContractRefAxContractCode;
	}

	public String getGeneralContractRefAxContractNumber() {
		return generalContractRefAxContractNumber;
	}

	public void setGeneralContractRefAxContractNumber(String generalContractRefAxContractNumber) {
		this.generalContractRefAxContractNumber = generalContractRefAxContractNumber;
	}

	public String getGeneralContractRefAxContractAccount() {
		return generalContractRefAxContractAccount;
	}

	public void setGeneralContractRefAxContractAccount(String generalContractRefAxContractAccount) {
		this.generalContractRefAxContractAccount = generalContractRefAxContractAccount;
	}

	public Date getGeneralContractRefAxContractDate() {
		return generalContractRefAxContractDate;
	}

	public void setGeneralContractRefAxContractDate(Date generalContractRefAxContractDate) {
		this.generalContractRefAxContractDate = generalContractRefAxContractDate;
	}

	public String getGeneralContractRefAxContractCommentGen() {
		return generalContractRefAxContractCommentGen;
	}

	public void setGeneralContractRefAxContractCommentGen(String generalContractRefAxContractCommentGen) {
		this.generalContractRefAxContractCommentGen = generalContractRefAxContractCommentGen;
	}

	public String getGeneralContractRefAxContractGroupCode() {
		return generalContractRefAxContractGroupCode;
	}

	public void setGeneralContractRefAxContractGroupCode(String generalContractRefAxContractGroupCode) {
		this.generalContractRefAxContractGroupCode = generalContractRefAxContractGroupCode;
	}

	public String getGeneralContractRefAxPartnerCode() {
		return generalContractRefAxPartnerCode;
	}

	public void setGeneralContractRefAxPartnerCode(String generalContractRefAxPartnerCode) {
		this.generalContractRefAxPartnerCode = generalContractRefAxPartnerCode;
	}

	public String getGeneralContractRefAxPartnerName() {
		return generalContractRefAxPartnerName;
	}

	public void setGeneralContractRefAxPartnerName(String generalContractRefAxPartnerName) {
		this.generalContractRefAxPartnerName = generalContractRefAxPartnerName;
	}

	public String getGeneralContractRefUserGen() {
		return generalContractRefUserGen;
	}

	public void setGeneralContractRefUserGen(String generalContractRefUserGen) {
		this.generalContractRefUserGen = generalContractRefUserGen;
	}

	public int getActIncomeCreatMetodRefCode() {
		return actIncomeCreatMetodRefCode;
	}

	public void setActIncomeCreatMetodRefCode(int actIncomeCreatMetodRefCode) {
		this.actIncomeCreatMetodRefCode = actIncomeCreatMetodRefCode;
	}

	public String getActIncomeCreatMetodRefName() {
		return actIncomeCreatMetodRefName;
	}

	public void setActIncomeCreatMetodRefName(String actIncomeCreatMetodRefName) {
		this.actIncomeCreatMetodRefName = actIncomeCreatMetodRefName;
	}

	public int getIsRed() {
		return isRed;
	}

	public void setIsRed(int isRed) {
		this.isRed = isRed;
	}

	public int getIsYellow() {
		return isYellow;
	}

	public void setIsYellow(int isYellow) {
		this.isYellow = isYellow;
	}

	public Date getContractRegDate() {
		return contractRegDate;
	}

	public void setContractRegDate(Date contractRegDate) {
		this.contractRegDate = contractRegDate;
	}

	public Date getContractStartDate() {
		return contractStartDate;
	}

	public void setContractStartDate(Date contractStartDate) {
		this.contractStartDate = contractStartDate;
	}

	public BigDecimal getPaySum() {
		return paySum;
	}

	public void setPaySum(BigDecimal paySum) {
		this.paySum = paySum;
	}

	public BigDecimal getDohodSum() {
		return dohodSum;
	}

	public void setDohodSum(BigDecimal dohodSum) {
		this.dohodSum = dohodSum;
	}
	
	public BigDecimal getSum_by_act() {
		return sum_by_act;
	}

	public void setSum_by_act(BigDecimal sum_by_act) {
		this.sum_by_act = sum_by_act;
	}

	public String getAxContractGroupCode() {
		return axContractGroupCode;
	}

	public void setAxContractGroupCode(String axContractGroupCode) {
		this.axContractGroupCode = axContractGroupCode;
	}

	public String getActnames() {
		return actnames;
	}

	public void setActnames(String actnames) {
		this.actnames = actnames;
	}

	public String getProv_exist() {
		return prov_exist;
	}

	public void setProv_exist(String prov_exist) {
		this.prov_exist = prov_exist;
	}

	public String getNode_exist() {
		return node_exist;
	}

	public void setNode_exist(String node_exist) {
		this.node_exist = node_exist;
	}

	public int getNodeCount() {
		return nodeCount;
	}

	public void setNodeCount(int nodeCount) {
		this.nodeCount = nodeCount;
	}

	public String getAxContractAccount() {
		return axContractAccount;
	}

	public void setAxContractAccount(String axContractAccount) {
		this.axContractAccount = axContractAccount;
	}

	public BigDecimal getContractSumma() {
		return contractSumma;
	}

	public void setContractSumma(BigDecimal contractSumma) {
		this.contractSumma = contractSumma;
	}

}
