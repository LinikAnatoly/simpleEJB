
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENSheets4SO;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENSheets4SOShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String numbergen;
	public String name;
	public Date dateGen ;
	public int dayscnt = Integer.MIN_VALUE;
	public Date nextSheetDate ;
	public int isLast = Integer.MIN_VALUE;
	public String recipient;
	public String recipientAddress;
	public String postCode;
	public String signerPosition;
	public String signerFio;
	public String executorFio;
	public String executorPhone;
	public String executorEmail;
	public String additionalText;
	public int isWithSignature = Integer.MIN_VALUE;
	public String commentgen;
	public int dfDocCode = Integer.MIN_VALUE;
	public int dfDocTypeCode = Integer.MIN_VALUE;
	public String dfDocNumber;
	public Date dfDocDate ;
	public String userGen;
	public Date dateEdit ;
	public int wfPackCode = Integer.MIN_VALUE;
	public int sheet4sotypeCode = Integer.MIN_VALUE;
	public String sheet4sotypeName;
	public String sheet4sotypeNameForDfDoc;
	public String sheet4sotypeDfDocNumMask;
	public int sheet4sotypeDfDepartmentCode = Integer.MIN_VALUE;
	public String sheet4sotypeExecutorFio;
	public String sheet4sotypeExecutorPhone;
	public String sheet4sotypeExecutorEmail;
	public String sheet4sotypeReportPath;
	public String sheet4sotypeReportFileName;
	public String sheet4sotypeReportType;
	public String sheet4sotypeCommentGen;
	public int attachmentCode = Integer.MIN_VALUE;
	public String attachmentCommentGen;
	public String attachmentFileLink;
	public long attachmentFilesize = Long.MIN_VALUE;
	public int attachmentSigningStatus = Integer.MIN_VALUE;
	public String attachmentUserAdd;
	public Date attachmentDateAdd;
	public String attachmentUserGen;
	public Date attachmentDateEdit;
	public int servicesobjectCode = Integer.MIN_VALUE;
	public String servicesobjectContractNumber;
	public Date servicesobjectContractDate;
	public String servicesobjectName;
	public String servicesobjectPartnerCode;
	public String servicesobjectFinDocCode;
	public int servicesobjectFinDocID = Integer.MIN_VALUE;
	public String servicesobjectCommentGen;
	public String servicesobjectContractNumberServices;
	public Date servicesobjectContractDateServices;
	public String servicesobjectContragentName;
	public String servicesobjectContragentAddress;
	public String servicesobjectContragentAddressWork;
	public String servicesobjectContragentOkpo;
	public String servicesobjectContragentBankAccount;
	public String servicesobjectContragentBankName;
	public String servicesobjectContragentBankMfo;
	public String servicesobjectContragentBossName;
	public String servicesobjectContragentPassport;
	public BigDecimal servicesobjectContractServicesSumma;
	public BigDecimal servicesobjectContractServicesSummaVAT;
	public BigDecimal servicesobjectContractServicesPower;
	public String servicesobjectCommentServicesGen;
	public BigDecimal servicesobjectContractServicesDistance;
	public BigDecimal servicesobjectContractServicesDay;
	public String servicesobjectUserGen;
	public Date servicesobjectDateEdit;
	public Date servicesobjectWarrantDate;
	public String servicesobjectWarrantNumber;
	public String servicesobjectWarrantFIO;
	public int servicesobjectRegionalType = Integer.MIN_VALUE;
	public BigDecimal servicesobjectBasisType;
	public String servicesobjectContragentPosition;
	public Date servicesobjectExecuteWorkDate;
	public Date servicesobjectTimeStart;
	public Date servicesobjectTimeFinal;
	public String servicesobjectContragentPhoneNumber;
	public String servicesobjectExecutorPhoneNumber;
	public String servicesobjectContragentObjectWork;
	public int servicesobjectIsNoPay = Integer.MIN_VALUE;
	public int servicesobjectIsCustomerMaterials = Integer.MIN_VALUE;
	public Date servicesobjectPayDate;
	public int servicesobjectFinPayFormCode = Integer.MIN_VALUE;
	public String servicesobjectFinPayFormName;
	public int servicesobjectPartnerId = Integer.MIN_VALUE;
	public String servicesobjectPayDetail;
	public String servicesobjectActTransferNumber;
	public Date servicesobjectActTransferDate;
	public String servicesobjectResposible;
	public String servicesobjectResposiblePosition;
	public String servicesobjectResposibleTabNumber;
	public int servicesobjectPrevContractStatus = Integer.MIN_VALUE;
	public int servicesobjectReconnectionTU = Integer.MIN_VALUE;
	public int servicesobjectPersonalAccountCode = Integer.MIN_VALUE;
	public String servicesobjectPersonalAccountNumber;
	public String servicesobjectTabNumber;
	public String servicesobjectCitiesList;
	public BigDecimal servicesobjectLineLength;
	public String servicesobjectProjectCode;
	public int servicesobjectCnPackCode = Integer.MIN_VALUE;
	public int servicesobjectDfPackCode = Integer.MIN_VALUE;
	public int servicesobjectCountersZoneType = Integer.MIN_VALUE;
	public String servicesobjectAxPartnerCode;
	public String servicesobjectAxPartnerName;
	public String servicesobjectAxContractNumber;
	public Date servicesobjectAxContractDate;
	public String servicesobjectAxContractCode;
	public String servicesobjectAxContractId;
	public String servicesobjectAxContractCommentGen;
	public BigDecimal servicesobjectProjAgreeSumma;
	public BigDecimal servicesobjectTopographySumma;
	public int servicesobjectCreatedFromSite = Integer.MIN_VALUE;
	public int servicesobjectTerm = Integer.MIN_VALUE;
	public int servicesobjectRegulation = Integer.MIN_VALUE;
	public Date servicesobjectBoundaryDateWork;
	public int servicesobjectCountDayDelay = Integer.MIN_VALUE;
	public Date servicesobjectFactDateWork;
	public String servicesobjectCodeEIC;
	public String servicesobjectPersonalAccountUid;
	public String servicesobjectCustomerMailingAddress;
	public BigDecimal servicesobjectPowerGeneration;
	public String servicesobjectPostCode;
	public String servicesobjectCustomerEmail;
	public String servicesobjectDemographicCode;
	public String servicesobjectOwnershipRecordNumber;
	public String servicesobjectRealEstateRegNumber;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getNumbergen() {
		return numbergen;
	}

	public void setNumbergen(String numbergen) {
		this.numbergen = numbergen;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getDateGen() {
		return dateGen;
	}

	public void setDateGen(Date dateGen) {
		this.dateGen = dateGen;
	}

	public int getDayscnt() {
		return dayscnt;
	}

	public void setDayscnt(int dayscnt) {
		this.dayscnt = dayscnt;
	}

	public Date getNextSheetDate() {
		return nextSheetDate;
	}

	public void setNextSheetDate(Date nextSheetDate) {
		this.nextSheetDate = nextSheetDate;
	}

	public int getIsLast() {
		return isLast;
	}

	public void setIsLast(int isLast) {
		this.isLast = isLast;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public String getRecipientAddress() {
		return recipientAddress;
	}

	public void setRecipientAddress(String recipientAddress) {
		this.recipientAddress = recipientAddress;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getSignerPosition() {
		return signerPosition;
	}

	public void setSignerPosition(String signerPosition) {
		this.signerPosition = signerPosition;
	}

	public String getSignerFio() {
		return signerFio;
	}

	public void setSignerFio(String signerFio) {
		this.signerFio = signerFio;
	}

	public String getExecutorFio() {
		return executorFio;
	}

	public void setExecutorFio(String executorFio) {
		this.executorFio = executorFio;
	}

	public String getExecutorPhone() {
		return executorPhone;
	}

	public void setExecutorPhone(String executorPhone) {
		this.executorPhone = executorPhone;
	}

	public String getExecutorEmail() {
		return executorEmail;
	}

	public void setExecutorEmail(String executorEmail) {
		this.executorEmail = executorEmail;
	}

	public String getAdditionalText() {
		return additionalText;
	}

	public void setAdditionalText(String additionalText) {
		this.additionalText = additionalText;
	}

	public int getIsWithSignature() {
		return isWithSignature;
	}

	public void setIsWithSignature(int isWithSignature) {
		this.isWithSignature = isWithSignature;
	}

	public String getCommentgen() {
		return commentgen;
	}

	public void setCommentgen(String commentgen) {
		this.commentgen = commentgen;
	}

	public int getDfDocCode() {
		return dfDocCode;
	}

	public void setDfDocCode(int dfDocCode) {
		this.dfDocCode = dfDocCode;
	}

	public int getDfDocTypeCode() {
		return dfDocTypeCode;
	}

	public void setDfDocTypeCode(int dfDocTypeCode) {
		this.dfDocTypeCode = dfDocTypeCode;
	}

	public String getDfDocNumber() {
		return dfDocNumber;
	}

	public void setDfDocNumber(String dfDocNumber) {
		this.dfDocNumber = dfDocNumber;
	}

	public Date getDfDocDate() {
		return dfDocDate;
	}

	public void setDfDocDate(Date dfDocDate) {
		this.dfDocDate = dfDocDate;
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


	public int getWfPackCode() {
		return wfPackCode;
	}

	public void setWfPackCode(int wfPackCode) {
		this.wfPackCode = wfPackCode;
	}


	public int getSheet4sotypeCode(){
		return sheet4sotypeCode;
	}

	public void setSheet4sotypeCode(int sheet4sotypeCode) {
		this.sheet4sotypeCode = sheet4sotypeCode;
	}

	public String getSheet4sotypeName(){
		return sheet4sotypeName;
	}

	public void setSheet4sotypeName(String sheet4sotypeName) {
		this.sheet4sotypeName = sheet4sotypeName;
	}

	public String getSheet4sotypeNameForDfDoc(){
		return sheet4sotypeNameForDfDoc;
	}

	public void setSheet4sotypeNameForDfDoc(String sheet4sotypeNameForDfDoc) {
		this.sheet4sotypeNameForDfDoc = sheet4sotypeNameForDfDoc;
	}

	public String getSheet4sotypeDfDocNumMask(){
		return sheet4sotypeDfDocNumMask;
	}

	public void setSheet4sotypeDfDocNumMask(String sheet4sotypeDfDocNumMask) {
		this.sheet4sotypeDfDocNumMask = sheet4sotypeDfDocNumMask;
	}

	public int getSheet4sotypeDfDepartmentCode(){
		return sheet4sotypeDfDepartmentCode;
	}

	public void setSheet4sotypeDfDepartmentCode(int sheet4sotypeDfDepartmentCode) {
		this.sheet4sotypeDfDepartmentCode = sheet4sotypeDfDepartmentCode;
	}

	public String getSheet4sotypeExecutorFio(){
		return sheet4sotypeExecutorFio;
	}

	public void setSheet4sotypeExecutorFio(String sheet4sotypeExecutorFio) {
		this.sheet4sotypeExecutorFio = sheet4sotypeExecutorFio;
	}

	public String getSheet4sotypeExecutorPhone(){
		return sheet4sotypeExecutorPhone;
	}

	public void setSheet4sotypeExecutorPhone(String sheet4sotypeExecutorPhone) {
		this.sheet4sotypeExecutorPhone = sheet4sotypeExecutorPhone;
	}

	public String getSheet4sotypeExecutorEmail(){
		return sheet4sotypeExecutorEmail;
	}

	public void setSheet4sotypeExecutorEmail(String sheet4sotypeExecutorEmail) {
		this.sheet4sotypeExecutorEmail = sheet4sotypeExecutorEmail;
	}

	public String getSheet4sotypeReportPath(){
		return sheet4sotypeReportPath;
	}

	public void setSheet4sotypeReportPath(String sheet4sotypeReportPath) {
		this.sheet4sotypeReportPath = sheet4sotypeReportPath;
	}

	public String getSheet4sotypeReportFileName(){
		return sheet4sotypeReportFileName;
	}

	public void setSheet4sotypeReportFileName(String sheet4sotypeReportFileName) {
		this.sheet4sotypeReportFileName = sheet4sotypeReportFileName;
	}

	public String getSheet4sotypeReportType(){
		return sheet4sotypeReportType;
	}

	public void setSheet4sotypeReportType(String sheet4sotypeReportType) {
		this.sheet4sotypeReportType = sheet4sotypeReportType;
	}

	public String getSheet4sotypeCommentGen(){
		return sheet4sotypeCommentGen;
	}

	public void setSheet4sotypeCommentGen(String sheet4sotypeCommentGen) {
		this.sheet4sotypeCommentGen = sheet4sotypeCommentGen;
	}

	public int getAttachmentCode(){
		return attachmentCode;
	}

	public void setAttachmentCode(int attachmentCode) {
		this.attachmentCode = attachmentCode;
	}

	public String getAttachmentCommentGen(){
		return attachmentCommentGen;
	}

	public void setAttachmentCommentGen(String attachmentCommentGen) {
		this.attachmentCommentGen = attachmentCommentGen;
	}

	public String getAttachmentFileLink(){
		return attachmentFileLink;
	}

	public void setAttachmentFileLink(String attachmentFileLink) {
		this.attachmentFileLink = attachmentFileLink;
	}

	public long getAttachmentFilesize(){
		return attachmentFilesize;
	}

	public void setAttachmentFilesize(long attachmentFilesize) {
		this.attachmentFilesize = attachmentFilesize;
	}

	public int getAttachmentSigningStatus(){
		return attachmentSigningStatus;
	}

	public void setAttachmentSigningStatus(int attachmentSigningStatus) {
		this.attachmentSigningStatus = attachmentSigningStatus;
	}

	public String getAttachmentUserAdd(){
		return attachmentUserAdd;
	}

	public void setAttachmentUserAdd(String attachmentUserAdd) {
		this.attachmentUserAdd = attachmentUserAdd;
	}

	public Date getAttachmentDateAdd(){
		return attachmentDateAdd;
	}

	public void setAttachmentDateAdd(Date attachmentDateAdd) {
		this.attachmentDateAdd = attachmentDateAdd;
	}

	public String getAttachmentUserGen(){
		return attachmentUserGen;
	}

	public void setAttachmentUserGen(String attachmentUserGen) {
		this.attachmentUserGen = attachmentUserGen;
	}

	public Date getAttachmentDateEdit(){
		return attachmentDateEdit;
	}

	public void setAttachmentDateEdit(Date attachmentDateEdit) {
		this.attachmentDateEdit = attachmentDateEdit;
	}

	public int getServicesobjectCode(){
		return servicesobjectCode;
	}

	public void setServicesobjectCode(int servicesobjectCode) {
		this.servicesobjectCode = servicesobjectCode;
	}

	public String getServicesobjectContractNumber(){
		return servicesobjectContractNumber;
	}

	public void setServicesobjectContractNumber(String servicesobjectContractNumber) {
		this.servicesobjectContractNumber = servicesobjectContractNumber;
	}

	public Date getServicesobjectContractDate(){
		return servicesobjectContractDate;
	}

	public void setServicesobjectContractDate(Date servicesobjectContractDate) {
		this.servicesobjectContractDate = servicesobjectContractDate;
	}

	public String getServicesobjectName(){
		return servicesobjectName;
	}

	public void setServicesobjectName(String servicesobjectName) {
		this.servicesobjectName = servicesobjectName;
	}

	public String getServicesobjectPartnerCode(){
		return servicesobjectPartnerCode;
	}

	public void setServicesobjectPartnerCode(String servicesobjectPartnerCode) {
		this.servicesobjectPartnerCode = servicesobjectPartnerCode;
	}

	public String getServicesobjectFinDocCode(){
		return servicesobjectFinDocCode;
	}

	public void setServicesobjectFinDocCode(String servicesobjectFinDocCode) {
		this.servicesobjectFinDocCode = servicesobjectFinDocCode;
	}

	public int getServicesobjectFinDocID(){
		return servicesobjectFinDocID;
	}

	public void setServicesobjectFinDocID(int servicesobjectFinDocID) {
		this.servicesobjectFinDocID = servicesobjectFinDocID;
	}

	public String getServicesobjectCommentGen(){
		return servicesobjectCommentGen;
	}

	public void setServicesobjectCommentGen(String servicesobjectCommentGen) {
		this.servicesobjectCommentGen = servicesobjectCommentGen;
	}

	public String getServicesobjectContractNumberServices(){
		return servicesobjectContractNumberServices;
	}

	public void setServicesobjectContractNumberServices(String servicesobjectContractNumberServices) {
		this.servicesobjectContractNumberServices = servicesobjectContractNumberServices;
	}

	public Date getServicesobjectContractDateServices(){
		return servicesobjectContractDateServices;
	}

	public void setServicesobjectContractDateServices(Date servicesobjectContractDateServices) {
		this.servicesobjectContractDateServices = servicesobjectContractDateServices;
	}

	public String getServicesobjectContragentName(){
		return servicesobjectContragentName;
	}

	public void setServicesobjectContragentName(String servicesobjectContragentName) {
		this.servicesobjectContragentName = servicesobjectContragentName;
	}

	public String getServicesobjectContragentAddress(){
		return servicesobjectContragentAddress;
	}

	public void setServicesobjectContragentAddress(String servicesobjectContragentAddress) {
		this.servicesobjectContragentAddress = servicesobjectContragentAddress;
	}

	public String getServicesobjectContragentAddressWork(){
		return servicesobjectContragentAddressWork;
	}

	public void setServicesobjectContragentAddressWork(String servicesobjectContragentAddressWork) {
		this.servicesobjectContragentAddressWork = servicesobjectContragentAddressWork;
	}

	public String getServicesobjectContragentOkpo(){
		return servicesobjectContragentOkpo;
	}

	public void setServicesobjectContragentOkpo(String servicesobjectContragentOkpo) {
		this.servicesobjectContragentOkpo = servicesobjectContragentOkpo;
	}

	public String getServicesobjectContragentBankAccount(){
		return servicesobjectContragentBankAccount;
	}

	public void setServicesobjectContragentBankAccount(String servicesobjectContragentBankAccount) {
		this.servicesobjectContragentBankAccount = servicesobjectContragentBankAccount;
	}

	public String getServicesobjectContragentBankName(){
		return servicesobjectContragentBankName;
	}

	public void setServicesobjectContragentBankName(String servicesobjectContragentBankName) {
		this.servicesobjectContragentBankName = servicesobjectContragentBankName;
	}

	public String getServicesobjectContragentBankMfo(){
		return servicesobjectContragentBankMfo;
	}

	public void setServicesobjectContragentBankMfo(String servicesobjectContragentBankMfo) {
		this.servicesobjectContragentBankMfo = servicesobjectContragentBankMfo;
	}

	public String getServicesobjectContragentBossName(){
		return servicesobjectContragentBossName;
	}

	public void setServicesobjectContragentBossName(String servicesobjectContragentBossName) {
		this.servicesobjectContragentBossName = servicesobjectContragentBossName;
	}

	public String getServicesobjectContragentPassport(){
		return servicesobjectContragentPassport;
	}

	public void setServicesobjectContragentPassport(String servicesobjectContragentPassport) {
		this.servicesobjectContragentPassport = servicesobjectContragentPassport;
	}

	public BigDecimal getServicesobjectContractServicesSumma(){
		return servicesobjectContractServicesSumma;
	}

	public void setServicesobjectContractServicesSumma(BigDecimal servicesobjectContractServicesSumma) {
		this.servicesobjectContractServicesSumma = servicesobjectContractServicesSumma;
	}

	public BigDecimal getServicesobjectContractServicesSummaVAT(){
		return servicesobjectContractServicesSummaVAT;
	}

	public void setServicesobjectContractServicesSummaVAT(BigDecimal servicesobjectContractServicesSummaVAT) {
		this.servicesobjectContractServicesSummaVAT = servicesobjectContractServicesSummaVAT;
	}

	public BigDecimal getServicesobjectContractServicesPower(){
		return servicesobjectContractServicesPower;
	}

	public void setServicesobjectContractServicesPower(BigDecimal servicesobjectContractServicesPower) {
		this.servicesobjectContractServicesPower = servicesobjectContractServicesPower;
	}

	public String getServicesobjectCommentServicesGen(){
		return servicesobjectCommentServicesGen;
	}

	public void setServicesobjectCommentServicesGen(String servicesobjectCommentServicesGen) {
		this.servicesobjectCommentServicesGen = servicesobjectCommentServicesGen;
	}

	public BigDecimal getServicesobjectContractServicesDistance(){
		return servicesobjectContractServicesDistance;
	}

	public void setServicesobjectContractServicesDistance(BigDecimal servicesobjectContractServicesDistance) {
		this.servicesobjectContractServicesDistance = servicesobjectContractServicesDistance;
	}

	public BigDecimal getServicesobjectContractServicesDay(){
		return servicesobjectContractServicesDay;
	}

	public void setServicesobjectContractServicesDay(BigDecimal servicesobjectContractServicesDay) {
		this.servicesobjectContractServicesDay = servicesobjectContractServicesDay;
	}

	public String getServicesobjectUserGen(){
		return servicesobjectUserGen;
	}

	public void setServicesobjectUserGen(String servicesobjectUserGen) {
		this.servicesobjectUserGen = servicesobjectUserGen;
	}

	public Date getServicesobjectDateEdit(){
		return servicesobjectDateEdit;
	}

	public void setServicesobjectDateEdit(Date servicesobjectDateEdit) {
		this.servicesobjectDateEdit = servicesobjectDateEdit;
	}

	public Date getServicesobjectWarrantDate(){
		return servicesobjectWarrantDate;
	}

	public void setServicesobjectWarrantDate(Date servicesobjectWarrantDate) {
		this.servicesobjectWarrantDate = servicesobjectWarrantDate;
	}

	public String getServicesobjectWarrantNumber(){
		return servicesobjectWarrantNumber;
	}

	public void setServicesobjectWarrantNumber(String servicesobjectWarrantNumber) {
		this.servicesobjectWarrantNumber = servicesobjectWarrantNumber;
	}

	public String getServicesobjectWarrantFIO(){
		return servicesobjectWarrantFIO;
	}

	public void setServicesobjectWarrantFIO(String servicesobjectWarrantFIO) {
		this.servicesobjectWarrantFIO = servicesobjectWarrantFIO;
	}

	public int getServicesobjectRegionalType(){
		return servicesobjectRegionalType;
	}

	public void setServicesobjectRegionalType(int servicesobjectRegionalType) {
		this.servicesobjectRegionalType = servicesobjectRegionalType;
	}

	public BigDecimal getServicesobjectBasisType(){
		return servicesobjectBasisType;
	}

	public void setServicesobjectBasisType(BigDecimal servicesobjectBasisType) {
		this.servicesobjectBasisType = servicesobjectBasisType;
	}

	public String getServicesobjectContragentPosition(){
		return servicesobjectContragentPosition;
	}

	public void setServicesobjectContragentPosition(String servicesobjectContragentPosition) {
		this.servicesobjectContragentPosition = servicesobjectContragentPosition;
	}

	public Date getServicesobjectExecuteWorkDate(){
		return servicesobjectExecuteWorkDate;
	}

	public void setServicesobjectExecuteWorkDate(Date servicesobjectExecuteWorkDate) {
		this.servicesobjectExecuteWorkDate = servicesobjectExecuteWorkDate;
	}

	public Date getServicesobjectTimeStart(){
		return servicesobjectTimeStart;
	}

	public void setServicesobjectTimeStart(Date servicesobjectTimeStart) {
		this.servicesobjectTimeStart = servicesobjectTimeStart;
	}

	public Date getServicesobjectTimeFinal(){
		return servicesobjectTimeFinal;
	}

	public void setServicesobjectTimeFinal(Date servicesobjectTimeFinal) {
		this.servicesobjectTimeFinal = servicesobjectTimeFinal;
	}

	public String getServicesobjectContragentPhoneNumber(){
		return servicesobjectContragentPhoneNumber;
	}

	public void setServicesobjectContragentPhoneNumber(String servicesobjectContragentPhoneNumber) {
		this.servicesobjectContragentPhoneNumber = servicesobjectContragentPhoneNumber;
	}

	public String getServicesobjectExecutorPhoneNumber(){
		return servicesobjectExecutorPhoneNumber;
	}

	public void setServicesobjectExecutorPhoneNumber(String servicesobjectExecutorPhoneNumber) {
		this.servicesobjectExecutorPhoneNumber = servicesobjectExecutorPhoneNumber;
	}

	public String getServicesobjectContragentObjectWork(){
		return servicesobjectContragentObjectWork;
	}

	public void setServicesobjectContragentObjectWork(String servicesobjectContragentObjectWork) {
		this.servicesobjectContragentObjectWork = servicesobjectContragentObjectWork;
	}

	public int getServicesobjectIsNoPay(){
		return servicesobjectIsNoPay;
	}

	public void setServicesobjectIsNoPay(int servicesobjectIsNoPay) {
		this.servicesobjectIsNoPay = servicesobjectIsNoPay;
	}

	public int getServicesobjectIsCustomerMaterials(){
		return servicesobjectIsCustomerMaterials;
	}

	public void setServicesobjectIsCustomerMaterials(int servicesobjectIsCustomerMaterials) {
		this.servicesobjectIsCustomerMaterials = servicesobjectIsCustomerMaterials;
	}

	public Date getServicesobjectPayDate(){
		return servicesobjectPayDate;
	}

	public void setServicesobjectPayDate(Date servicesobjectPayDate) {
		this.servicesobjectPayDate = servicesobjectPayDate;
	}

	public int getServicesobjectFinPayFormCode(){
		return servicesobjectFinPayFormCode;
	}

	public void setServicesobjectFinPayFormCode(int servicesobjectFinPayFormCode) {
		this.servicesobjectFinPayFormCode = servicesobjectFinPayFormCode;
	}

	public String getServicesobjectFinPayFormName(){
		return servicesobjectFinPayFormName;
	}

	public void setServicesobjectFinPayFormName(String servicesobjectFinPayFormName) {
		this.servicesobjectFinPayFormName = servicesobjectFinPayFormName;
	}

	public int getServicesobjectPartnerId(){
		return servicesobjectPartnerId;
	}

	public void setServicesobjectPartnerId(int servicesobjectPartnerId) {
		this.servicesobjectPartnerId = servicesobjectPartnerId;
	}

	public String getServicesobjectPayDetail(){
		return servicesobjectPayDetail;
	}

	public void setServicesobjectPayDetail(String servicesobjectPayDetail) {
		this.servicesobjectPayDetail = servicesobjectPayDetail;
	}

	public String getServicesobjectActTransferNumber(){
		return servicesobjectActTransferNumber;
	}

	public void setServicesobjectActTransferNumber(String servicesobjectActTransferNumber) {
		this.servicesobjectActTransferNumber = servicesobjectActTransferNumber;
	}

	public Date getServicesobjectActTransferDate(){
		return servicesobjectActTransferDate;
	}

	public void setServicesobjectActTransferDate(Date servicesobjectActTransferDate) {
		this.servicesobjectActTransferDate = servicesobjectActTransferDate;
	}

	public String getServicesobjectResposible(){
		return servicesobjectResposible;
	}

	public void setServicesobjectResposible(String servicesobjectResposible) {
		this.servicesobjectResposible = servicesobjectResposible;
	}

	public String getServicesobjectResposiblePosition(){
		return servicesobjectResposiblePosition;
	}

	public void setServicesobjectResposiblePosition(String servicesobjectResposiblePosition) {
		this.servicesobjectResposiblePosition = servicesobjectResposiblePosition;
	}

	public String getServicesobjectResposibleTabNumber(){
		return servicesobjectResposibleTabNumber;
	}

	public void setServicesobjectResposibleTabNumber(String servicesobjectResposibleTabNumber) {
		this.servicesobjectResposibleTabNumber = servicesobjectResposibleTabNumber;
	}

	public int getServicesobjectPrevContractStatus(){
		return servicesobjectPrevContractStatus;
	}

	public void setServicesobjectPrevContractStatus(int servicesobjectPrevContractStatus) {
		this.servicesobjectPrevContractStatus = servicesobjectPrevContractStatus;
	}

	public int getServicesobjectReconnectionTU(){
		return servicesobjectReconnectionTU;
	}

	public void setServicesobjectReconnectionTU(int servicesobjectReconnectionTU) {
		this.servicesobjectReconnectionTU = servicesobjectReconnectionTU;
	}

	public int getServicesobjectPersonalAccountCode(){
		return servicesobjectPersonalAccountCode;
	}

	public void setServicesobjectPersonalAccountCode(int servicesobjectPersonalAccountCode) {
		this.servicesobjectPersonalAccountCode = servicesobjectPersonalAccountCode;
	}

	public String getServicesobjectPersonalAccountNumber(){
		return servicesobjectPersonalAccountNumber;
	}

	public void setServicesobjectPersonalAccountNumber(String servicesobjectPersonalAccountNumber) {
		this.servicesobjectPersonalAccountNumber = servicesobjectPersonalAccountNumber;
	}

	public String getServicesobjectTabNumber(){
		return servicesobjectTabNumber;
	}

	public void setServicesobjectTabNumber(String servicesobjectTabNumber) {
		this.servicesobjectTabNumber = servicesobjectTabNumber;
	}

	public String getServicesobjectCitiesList(){
		return servicesobjectCitiesList;
	}

	public void setServicesobjectCitiesList(String servicesobjectCitiesList) {
		this.servicesobjectCitiesList = servicesobjectCitiesList;
	}

	public BigDecimal getServicesobjectLineLength(){
		return servicesobjectLineLength;
	}

	public void setServicesobjectLineLength(BigDecimal servicesobjectLineLength) {
		this.servicesobjectLineLength = servicesobjectLineLength;
	}

	public String getServicesobjectProjectCode(){
		return servicesobjectProjectCode;
	}

	public void setServicesobjectProjectCode(String servicesobjectProjectCode) {
		this.servicesobjectProjectCode = servicesobjectProjectCode;
	}

	public int getServicesobjectCnPackCode(){
		return servicesobjectCnPackCode;
	}

	public void setServicesobjectCnPackCode(int servicesobjectCnPackCode) {
		this.servicesobjectCnPackCode = servicesobjectCnPackCode;
	}

	public int getServicesobjectDfPackCode(){
		return servicesobjectDfPackCode;
	}

	public void setServicesobjectDfPackCode(int servicesobjectDfPackCode) {
		this.servicesobjectDfPackCode = servicesobjectDfPackCode;
	}

	public int getServicesobjectCountersZoneType(){
		return servicesobjectCountersZoneType;
	}

	public void setServicesobjectCountersZoneType(int servicesobjectCountersZoneType) {
		this.servicesobjectCountersZoneType = servicesobjectCountersZoneType;
	}

	public String getServicesobjectAxPartnerCode(){
		return servicesobjectAxPartnerCode;
	}

	public void setServicesobjectAxPartnerCode(String servicesobjectAxPartnerCode) {
		this.servicesobjectAxPartnerCode = servicesobjectAxPartnerCode;
	}

	public String getServicesobjectAxPartnerName(){
		return servicesobjectAxPartnerName;
	}

	public void setServicesobjectAxPartnerName(String servicesobjectAxPartnerName) {
		this.servicesobjectAxPartnerName = servicesobjectAxPartnerName;
	}

	public String getServicesobjectAxContractNumber(){
		return servicesobjectAxContractNumber;
	}

	public void setServicesobjectAxContractNumber(String servicesobjectAxContractNumber) {
		this.servicesobjectAxContractNumber = servicesobjectAxContractNumber;
	}

	public Date getServicesobjectAxContractDate(){
		return servicesobjectAxContractDate;
	}

	public void setServicesobjectAxContractDate(Date servicesobjectAxContractDate) {
		this.servicesobjectAxContractDate = servicesobjectAxContractDate;
	}

	public String getServicesobjectAxContractCode(){
		return servicesobjectAxContractCode;
	}

	public void setServicesobjectAxContractCode(String servicesobjectAxContractCode) {
		this.servicesobjectAxContractCode = servicesobjectAxContractCode;
	}

	public String getServicesobjectAxContractId(){
		return servicesobjectAxContractId;
	}

	public void setServicesobjectAxContractId(String servicesobjectAxContractId) {
		this.servicesobjectAxContractId = servicesobjectAxContractId;
	}

	public String getServicesobjectAxContractCommentGen(){
		return servicesobjectAxContractCommentGen;
	}

	public void setServicesobjectAxContractCommentGen(String servicesobjectAxContractCommentGen) {
		this.servicesobjectAxContractCommentGen = servicesobjectAxContractCommentGen;
	}

	public BigDecimal getServicesobjectProjAgreeSumma(){
		return servicesobjectProjAgreeSumma;
	}

	public void setServicesobjectProjAgreeSumma(BigDecimal servicesobjectProjAgreeSumma) {
		this.servicesobjectProjAgreeSumma = servicesobjectProjAgreeSumma;
	}

	public BigDecimal getServicesobjectTopographySumma(){
		return servicesobjectTopographySumma;
	}

	public void setServicesobjectTopographySumma(BigDecimal servicesobjectTopographySumma) {
		this.servicesobjectTopographySumma = servicesobjectTopographySumma;
	}

	public int getServicesobjectCreatedFromSite(){
		return servicesobjectCreatedFromSite;
	}

	public void setServicesobjectCreatedFromSite(int servicesobjectCreatedFromSite) {
		this.servicesobjectCreatedFromSite = servicesobjectCreatedFromSite;
	}

	public int getServicesobjectTerm(){
		return servicesobjectTerm;
	}

	public void setServicesobjectTerm(int servicesobjectTerm) {
		this.servicesobjectTerm = servicesobjectTerm;
	}

	public int getServicesobjectRegulation(){
		return servicesobjectRegulation;
	}

	public void setServicesobjectRegulation(int servicesobjectRegulation) {
		this.servicesobjectRegulation = servicesobjectRegulation;
	}

	public Date getServicesobjectBoundaryDateWork(){
		return servicesobjectBoundaryDateWork;
	}

	public void setServicesobjectBoundaryDateWork(Date servicesobjectBoundaryDateWork) {
		this.servicesobjectBoundaryDateWork = servicesobjectBoundaryDateWork;
	}

	public int getServicesobjectCountDayDelay(){
		return servicesobjectCountDayDelay;
	}

	public void setServicesobjectCountDayDelay(int servicesobjectCountDayDelay) {
		this.servicesobjectCountDayDelay = servicesobjectCountDayDelay;
	}

	public Date getServicesobjectFactDateWork(){
		return servicesobjectFactDateWork;
	}

	public void setServicesobjectFactDateWork(Date servicesobjectFactDateWork) {
		this.servicesobjectFactDateWork = servicesobjectFactDateWork;
	}

	public String getServicesobjectCodeEIC(){
		return servicesobjectCodeEIC;
	}

	public void setServicesobjectCodeEIC(String servicesobjectCodeEIC) {
		this.servicesobjectCodeEIC = servicesobjectCodeEIC;
	}

	public String getServicesobjectPersonalAccountUid(){
		return servicesobjectPersonalAccountUid;
	}

	public void setServicesobjectPersonalAccountUid(String servicesobjectPersonalAccountUid) {
		this.servicesobjectPersonalAccountUid = servicesobjectPersonalAccountUid;
	}

	public String getServicesobjectCustomerMailingAddress(){
		return servicesobjectCustomerMailingAddress;
	}

	public void setServicesobjectCustomerMailingAddress(String servicesobjectCustomerMailingAddress) {
		this.servicesobjectCustomerMailingAddress = servicesobjectCustomerMailingAddress;
	}

	public BigDecimal getServicesobjectPowerGeneration(){
		return servicesobjectPowerGeneration;
	}

	public void setServicesobjectPowerGeneration(BigDecimal servicesobjectPowerGeneration) {
		this.servicesobjectPowerGeneration = servicesobjectPowerGeneration;
	}

	public String getServicesobjectPostCode(){
		return servicesobjectPostCode;
	}

	public void setServicesobjectPostCode(String servicesobjectPostCode) {
		this.servicesobjectPostCode = servicesobjectPostCode;
	}

	public String getServicesobjectCustomerEmail(){
		return servicesobjectCustomerEmail;
	}

	public void setServicesobjectCustomerEmail(String servicesobjectCustomerEmail) {
		this.servicesobjectCustomerEmail = servicesobjectCustomerEmail;
	}

	public String getServicesobjectDemographicCode(){
		return servicesobjectDemographicCode;
	}

	public void setServicesobjectDemographicCode(String servicesobjectDemographicCode) {
		this.servicesobjectDemographicCode = servicesobjectDemographicCode;
	}

	public String getServicesobjectOwnershipRecordNumber(){
		return servicesobjectOwnershipRecordNumber;
	}

	public void setServicesobjectOwnershipRecordNumber(String servicesobjectOwnershipRecordNumber) {
		this.servicesobjectOwnershipRecordNumber = servicesobjectOwnershipRecordNumber;
	}

	public String getServicesobjectRealEstateRegNumber(){
		return servicesobjectRealEstateRegNumber;
	}

	public void setServicesobjectRealEstateRegNumber(String servicesobjectRealEstateRegNumber) {
		this.servicesobjectRealEstateRegNumber = servicesobjectRealEstateRegNumber;
	}



}
