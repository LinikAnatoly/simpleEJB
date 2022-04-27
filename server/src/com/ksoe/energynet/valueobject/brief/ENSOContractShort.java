
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENSOContract;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENSOContractShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String numContractFinCol;
	public Date dateContractFinCol ;
	public String namePartnerFinCol;
	public String noteContrcatFinCol;
	public int finDocID = Integer.MIN_VALUE;
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
	public BigDecimal servicesObjectRefContractServicesSummaVAT;
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
	public BigDecimal servicesObjectRefProjAgreeSumma;
	public BigDecimal servicesObjectRefTopographySumma;
	public int servicesObjectRefCreatedFromSite = Integer.MIN_VALUE;
	public int servicesObjectRefTerm = Integer.MIN_VALUE;
	public int servicesObjectRefRegulation = Integer.MIN_VALUE;
	public Date servicesObjectRefBoundaryDateWork;
	public int servicesObjectRefCountDayDelay = Integer.MIN_VALUE;
	public Date servicesObjectRefFactDateWork;
	public String servicesObjectRefCodeEIC;
	public String servicesObjectRefPersonalAccountUid;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getNumContractFinCol() {
		return numContractFinCol;
	}

	public void setNumContractFinCol(String numContractFinCol) {
		this.numContractFinCol = numContractFinCol;
	}

	public Date getDateContractFinCol() {
		return dateContractFinCol;
	}

	public void setDateContractFinCol(Date dateContractFinCol) {
		this.dateContractFinCol = dateContractFinCol;
	}

	public String getNamePartnerFinCol() {
		return namePartnerFinCol;
	}

	public void setNamePartnerFinCol(String namePartnerFinCol) {
		this.namePartnerFinCol = namePartnerFinCol;
	}

	public String getNoteContrcatFinCol() {
		return noteContrcatFinCol;
	}

	public void setNoteContrcatFinCol(String noteContrcatFinCol) {
		this.noteContrcatFinCol = noteContrcatFinCol;
	}

	public int getFinDocID() {
		return finDocID;
	}

	public void setFinDocID(int finDocID) {
		this.finDocID = finDocID;
	}


	public int getServicesObjectRefCode(){
		return servicesObjectRefCode;
	}

	public void setServicesObjectRefCode(int servicesObjectRefCode) {
		this.servicesObjectRefCode = servicesObjectRefCode;
	}

	public String getServicesObjectRefContractNumber(){
		return servicesObjectRefContractNumber;
	}

	public void setServicesObjectRefContractNumber(String servicesObjectRefContractNumber) {
		this.servicesObjectRefContractNumber = servicesObjectRefContractNumber;
	}

	public Date getServicesObjectRefContractDate(){
		return servicesObjectRefContractDate;
	}

	public void setServicesObjectRefContractDate(Date servicesObjectRefContractDate) {
		this.servicesObjectRefContractDate = servicesObjectRefContractDate;
	}

	public String getServicesObjectRefName(){
		return servicesObjectRefName;
	}

	public void setServicesObjectRefName(String servicesObjectRefName) {
		this.servicesObjectRefName = servicesObjectRefName;
	}

	public String getServicesObjectRefPartnerCode(){
		return servicesObjectRefPartnerCode;
	}

	public void setServicesObjectRefPartnerCode(String servicesObjectRefPartnerCode) {
		this.servicesObjectRefPartnerCode = servicesObjectRefPartnerCode;
	}

	public String getServicesObjectRefFinDocCode(){
		return servicesObjectRefFinDocCode;
	}

	public void setServicesObjectRefFinDocCode(String servicesObjectRefFinDocCode) {
		this.servicesObjectRefFinDocCode = servicesObjectRefFinDocCode;
	}

	public int getServicesObjectRefFinDocID(){
		return servicesObjectRefFinDocID;
	}

	public void setServicesObjectRefFinDocID(int servicesObjectRefFinDocID) {
		this.servicesObjectRefFinDocID = servicesObjectRefFinDocID;
	}

	public String getServicesObjectRefCommentGen(){
		return servicesObjectRefCommentGen;
	}

	public void setServicesObjectRefCommentGen(String servicesObjectRefCommentGen) {
		this.servicesObjectRefCommentGen = servicesObjectRefCommentGen;
	}

	public String getServicesObjectRefContractNumberServices(){
		return servicesObjectRefContractNumberServices;
	}

	public void setServicesObjectRefContractNumberServices(String servicesObjectRefContractNumberServices) {
		this.servicesObjectRefContractNumberServices = servicesObjectRefContractNumberServices;
	}

	public Date getServicesObjectRefContractDateServices(){
		return servicesObjectRefContractDateServices;
	}

	public void setServicesObjectRefContractDateServices(Date servicesObjectRefContractDateServices) {
		this.servicesObjectRefContractDateServices = servicesObjectRefContractDateServices;
	}

	public String getServicesObjectRefContragentName(){
		return servicesObjectRefContragentName;
	}

	public void setServicesObjectRefContragentName(String servicesObjectRefContragentName) {
		this.servicesObjectRefContragentName = servicesObjectRefContragentName;
	}

	public String getServicesObjectRefContragentAddress(){
		return servicesObjectRefContragentAddress;
	}

	public void setServicesObjectRefContragentAddress(String servicesObjectRefContragentAddress) {
		this.servicesObjectRefContragentAddress = servicesObjectRefContragentAddress;
	}

	public String getServicesObjectRefContragentAddressWork(){
		return servicesObjectRefContragentAddressWork;
	}

	public void setServicesObjectRefContragentAddressWork(String servicesObjectRefContragentAddressWork) {
		this.servicesObjectRefContragentAddressWork = servicesObjectRefContragentAddressWork;
	}

	public String getServicesObjectRefContragentOkpo(){
		return servicesObjectRefContragentOkpo;
	}

	public void setServicesObjectRefContragentOkpo(String servicesObjectRefContragentOkpo) {
		this.servicesObjectRefContragentOkpo = servicesObjectRefContragentOkpo;
	}

	public String getServicesObjectRefContragentBankAccount(){
		return servicesObjectRefContragentBankAccount;
	}

	public void setServicesObjectRefContragentBankAccount(String servicesObjectRefContragentBankAccount) {
		this.servicesObjectRefContragentBankAccount = servicesObjectRefContragentBankAccount;
	}

	public String getServicesObjectRefContragentBankName(){
		return servicesObjectRefContragentBankName;
	}

	public void setServicesObjectRefContragentBankName(String servicesObjectRefContragentBankName) {
		this.servicesObjectRefContragentBankName = servicesObjectRefContragentBankName;
	}

	public String getServicesObjectRefContragentBankMfo(){
		return servicesObjectRefContragentBankMfo;
	}

	public void setServicesObjectRefContragentBankMfo(String servicesObjectRefContragentBankMfo) {
		this.servicesObjectRefContragentBankMfo = servicesObjectRefContragentBankMfo;
	}

	public String getServicesObjectRefContragentBossName(){
		return servicesObjectRefContragentBossName;
	}

	public void setServicesObjectRefContragentBossName(String servicesObjectRefContragentBossName) {
		this.servicesObjectRefContragentBossName = servicesObjectRefContragentBossName;
	}

	public String getServicesObjectRefContragentPassport(){
		return servicesObjectRefContragentPassport;
	}

	public void setServicesObjectRefContragentPassport(String servicesObjectRefContragentPassport) {
		this.servicesObjectRefContragentPassport = servicesObjectRefContragentPassport;
	}

	public BigDecimal getServicesObjectRefContractServicesSumma(){
		return servicesObjectRefContractServicesSumma;
	}

	public void setServicesObjectRefContractServicesSumma(BigDecimal servicesObjectRefContractServicesSumma) {
		this.servicesObjectRefContractServicesSumma = servicesObjectRefContractServicesSumma;
	}

	public BigDecimal getServicesObjectRefContractServicesSummaVAT(){
		return servicesObjectRefContractServicesSummaVAT;
	}

	public void setServicesObjectRefContractServicesSummaVAT(BigDecimal servicesObjectRefContractServicesSummaVAT) {
		this.servicesObjectRefContractServicesSummaVAT = servicesObjectRefContractServicesSummaVAT;
	}

	public BigDecimal getServicesObjectRefContractServicesPower(){
		return servicesObjectRefContractServicesPower;
	}

	public void setServicesObjectRefContractServicesPower(BigDecimal servicesObjectRefContractServicesPower) {
		this.servicesObjectRefContractServicesPower = servicesObjectRefContractServicesPower;
	}

	public String getServicesObjectRefCommentServicesGen(){
		return servicesObjectRefCommentServicesGen;
	}

	public void setServicesObjectRefCommentServicesGen(String servicesObjectRefCommentServicesGen) {
		this.servicesObjectRefCommentServicesGen = servicesObjectRefCommentServicesGen;
	}

	public BigDecimal getServicesObjectRefContractServicesDistance(){
		return servicesObjectRefContractServicesDistance;
	}

	public void setServicesObjectRefContractServicesDistance(BigDecimal servicesObjectRefContractServicesDistance) {
		this.servicesObjectRefContractServicesDistance = servicesObjectRefContractServicesDistance;
	}

	public BigDecimal getServicesObjectRefContractServicesDay(){
		return servicesObjectRefContractServicesDay;
	}

	public void setServicesObjectRefContractServicesDay(BigDecimal servicesObjectRefContractServicesDay) {
		this.servicesObjectRefContractServicesDay = servicesObjectRefContractServicesDay;
	}

	public String getServicesObjectRefUserGen(){
		return servicesObjectRefUserGen;
	}

	public void setServicesObjectRefUserGen(String servicesObjectRefUserGen) {
		this.servicesObjectRefUserGen = servicesObjectRefUserGen;
	}

	public Date getServicesObjectRefDateEdit(){
		return servicesObjectRefDateEdit;
	}

	public void setServicesObjectRefDateEdit(Date servicesObjectRefDateEdit) {
		this.servicesObjectRefDateEdit = servicesObjectRefDateEdit;
	}

	public Date getServicesObjectRefWarrantDate(){
		return servicesObjectRefWarrantDate;
	}

	public void setServicesObjectRefWarrantDate(Date servicesObjectRefWarrantDate) {
		this.servicesObjectRefWarrantDate = servicesObjectRefWarrantDate;
	}

	public String getServicesObjectRefWarrantNumber(){
		return servicesObjectRefWarrantNumber;
	}

	public void setServicesObjectRefWarrantNumber(String servicesObjectRefWarrantNumber) {
		this.servicesObjectRefWarrantNumber = servicesObjectRefWarrantNumber;
	}

	public String getServicesObjectRefWarrantFIO(){
		return servicesObjectRefWarrantFIO;
	}

	public void setServicesObjectRefWarrantFIO(String servicesObjectRefWarrantFIO) {
		this.servicesObjectRefWarrantFIO = servicesObjectRefWarrantFIO;
	}

	public int getServicesObjectRefRegionalType(){
		return servicesObjectRefRegionalType;
	}

	public void setServicesObjectRefRegionalType(int servicesObjectRefRegionalType) {
		this.servicesObjectRefRegionalType = servicesObjectRefRegionalType;
	}

	public BigDecimal getServicesObjectRefBasisType(){
		return servicesObjectRefBasisType;
	}

	public void setServicesObjectRefBasisType(BigDecimal servicesObjectRefBasisType) {
		this.servicesObjectRefBasisType = servicesObjectRefBasisType;
	}

	public String getServicesObjectRefContragentPosition(){
		return servicesObjectRefContragentPosition;
	}

	public void setServicesObjectRefContragentPosition(String servicesObjectRefContragentPosition) {
		this.servicesObjectRefContragentPosition = servicesObjectRefContragentPosition;
	}

	public Date getServicesObjectRefExecuteWorkDate(){
		return servicesObjectRefExecuteWorkDate;
	}

	public void setServicesObjectRefExecuteWorkDate(Date servicesObjectRefExecuteWorkDate) {
		this.servicesObjectRefExecuteWorkDate = servicesObjectRefExecuteWorkDate;
	}

	public Date getServicesObjectRefTimeStart(){
		return servicesObjectRefTimeStart;
	}

	public void setServicesObjectRefTimeStart(Date servicesObjectRefTimeStart) {
		this.servicesObjectRefTimeStart = servicesObjectRefTimeStart;
	}

	public Date getServicesObjectRefTimeFinal(){
		return servicesObjectRefTimeFinal;
	}

	public void setServicesObjectRefTimeFinal(Date servicesObjectRefTimeFinal) {
		this.servicesObjectRefTimeFinal = servicesObjectRefTimeFinal;
	}

	public String getServicesObjectRefContragentPhoneNumber(){
		return servicesObjectRefContragentPhoneNumber;
	}

	public void setServicesObjectRefContragentPhoneNumber(String servicesObjectRefContragentPhoneNumber) {
		this.servicesObjectRefContragentPhoneNumber = servicesObjectRefContragentPhoneNumber;
	}

	public String getServicesObjectRefExecutorPhoneNumber(){
		return servicesObjectRefExecutorPhoneNumber;
	}

	public void setServicesObjectRefExecutorPhoneNumber(String servicesObjectRefExecutorPhoneNumber) {
		this.servicesObjectRefExecutorPhoneNumber = servicesObjectRefExecutorPhoneNumber;
	}

	public String getServicesObjectRefContragentObjectWork(){
		return servicesObjectRefContragentObjectWork;
	}

	public void setServicesObjectRefContragentObjectWork(String servicesObjectRefContragentObjectWork) {
		this.servicesObjectRefContragentObjectWork = servicesObjectRefContragentObjectWork;
	}

	public int getServicesObjectRefIsNoPay(){
		return servicesObjectRefIsNoPay;
	}

	public void setServicesObjectRefIsNoPay(int servicesObjectRefIsNoPay) {
		this.servicesObjectRefIsNoPay = servicesObjectRefIsNoPay;
	}

	public int getServicesObjectRefIsCustomerMaterials(){
		return servicesObjectRefIsCustomerMaterials;
	}

	public void setServicesObjectRefIsCustomerMaterials(int servicesObjectRefIsCustomerMaterials) {
		this.servicesObjectRefIsCustomerMaterials = servicesObjectRefIsCustomerMaterials;
	}

	public Date getServicesObjectRefPayDate(){
		return servicesObjectRefPayDate;
	}

	public void setServicesObjectRefPayDate(Date servicesObjectRefPayDate) {
		this.servicesObjectRefPayDate = servicesObjectRefPayDate;
	}

	public int getServicesObjectRefFinPayFormCode(){
		return servicesObjectRefFinPayFormCode;
	}

	public void setServicesObjectRefFinPayFormCode(int servicesObjectRefFinPayFormCode) {
		this.servicesObjectRefFinPayFormCode = servicesObjectRefFinPayFormCode;
	}

	public String getServicesObjectRefFinPayFormName(){
		return servicesObjectRefFinPayFormName;
	}

	public void setServicesObjectRefFinPayFormName(String servicesObjectRefFinPayFormName) {
		this.servicesObjectRefFinPayFormName = servicesObjectRefFinPayFormName;
	}

	public int getServicesObjectRefPartnerId(){
		return servicesObjectRefPartnerId;
	}

	public void setServicesObjectRefPartnerId(int servicesObjectRefPartnerId) {
		this.servicesObjectRefPartnerId = servicesObjectRefPartnerId;
	}

	public String getServicesObjectRefPayDetail(){
		return servicesObjectRefPayDetail;
	}

	public void setServicesObjectRefPayDetail(String servicesObjectRefPayDetail) {
		this.servicesObjectRefPayDetail = servicesObjectRefPayDetail;
	}

	public String getServicesObjectRefActTransferNumber(){
		return servicesObjectRefActTransferNumber;
	}

	public void setServicesObjectRefActTransferNumber(String servicesObjectRefActTransferNumber) {
		this.servicesObjectRefActTransferNumber = servicesObjectRefActTransferNumber;
	}

	public Date getServicesObjectRefActTransferDate(){
		return servicesObjectRefActTransferDate;
	}

	public void setServicesObjectRefActTransferDate(Date servicesObjectRefActTransferDate) {
		this.servicesObjectRefActTransferDate = servicesObjectRefActTransferDate;
	}

	public String getServicesObjectRefResposible(){
		return servicesObjectRefResposible;
	}

	public void setServicesObjectRefResposible(String servicesObjectRefResposible) {
		this.servicesObjectRefResposible = servicesObjectRefResposible;
	}

	public String getServicesObjectRefResposiblePosition(){
		return servicesObjectRefResposiblePosition;
	}

	public void setServicesObjectRefResposiblePosition(String servicesObjectRefResposiblePosition) {
		this.servicesObjectRefResposiblePosition = servicesObjectRefResposiblePosition;
	}

	public String getServicesObjectRefResposibleTabNumber(){
		return servicesObjectRefResposibleTabNumber;
	}

	public void setServicesObjectRefResposibleTabNumber(String servicesObjectRefResposibleTabNumber) {
		this.servicesObjectRefResposibleTabNumber = servicesObjectRefResposibleTabNumber;
	}

	public int getServicesObjectRefPrevContractStatus(){
		return servicesObjectRefPrevContractStatus;
	}

	public void setServicesObjectRefPrevContractStatus(int servicesObjectRefPrevContractStatus) {
		this.servicesObjectRefPrevContractStatus = servicesObjectRefPrevContractStatus;
	}

	public int getServicesObjectRefReconnectionTU(){
		return servicesObjectRefReconnectionTU;
	}

	public void setServicesObjectRefReconnectionTU(int servicesObjectRefReconnectionTU) {
		this.servicesObjectRefReconnectionTU = servicesObjectRefReconnectionTU;
	}

	public int getServicesObjectRefPersonalAccountCode(){
		return servicesObjectRefPersonalAccountCode;
	}

	public void setServicesObjectRefPersonalAccountCode(int servicesObjectRefPersonalAccountCode) {
		this.servicesObjectRefPersonalAccountCode = servicesObjectRefPersonalAccountCode;
	}

	public String getServicesObjectRefPersonalAccountNumber(){
		return servicesObjectRefPersonalAccountNumber;
	}

	public void setServicesObjectRefPersonalAccountNumber(String servicesObjectRefPersonalAccountNumber) {
		this.servicesObjectRefPersonalAccountNumber = servicesObjectRefPersonalAccountNumber;
	}

	public String getServicesObjectRefTabNumber(){
		return servicesObjectRefTabNumber;
	}

	public void setServicesObjectRefTabNumber(String servicesObjectRefTabNumber) {
		this.servicesObjectRefTabNumber = servicesObjectRefTabNumber;
	}

	public String getServicesObjectRefCitiesList(){
		return servicesObjectRefCitiesList;
	}

	public void setServicesObjectRefCitiesList(String servicesObjectRefCitiesList) {
		this.servicesObjectRefCitiesList = servicesObjectRefCitiesList;
	}

	public BigDecimal getServicesObjectRefLineLength(){
		return servicesObjectRefLineLength;
	}

	public void setServicesObjectRefLineLength(BigDecimal servicesObjectRefLineLength) {
		this.servicesObjectRefLineLength = servicesObjectRefLineLength;
	}

	public String getServicesObjectRefProjectCode(){
		return servicesObjectRefProjectCode;
	}

	public void setServicesObjectRefProjectCode(String servicesObjectRefProjectCode) {
		this.servicesObjectRefProjectCode = servicesObjectRefProjectCode;
	}

	public int getServicesObjectRefCnPackCode(){
		return servicesObjectRefCnPackCode;
	}

	public void setServicesObjectRefCnPackCode(int servicesObjectRefCnPackCode) {
		this.servicesObjectRefCnPackCode = servicesObjectRefCnPackCode;
	}

	public int getServicesObjectRefDfPackCode(){
		return servicesObjectRefDfPackCode;
	}

	public void setServicesObjectRefDfPackCode(int servicesObjectRefDfPackCode) {
		this.servicesObjectRefDfPackCode = servicesObjectRefDfPackCode;
	}

	public int getServicesObjectRefCountersZoneType(){
		return servicesObjectRefCountersZoneType;
	}

	public void setServicesObjectRefCountersZoneType(int servicesObjectRefCountersZoneType) {
		this.servicesObjectRefCountersZoneType = servicesObjectRefCountersZoneType;
	}

	public String getServicesObjectRefAxPartnerCode(){
		return servicesObjectRefAxPartnerCode;
	}

	public void setServicesObjectRefAxPartnerCode(String servicesObjectRefAxPartnerCode) {
		this.servicesObjectRefAxPartnerCode = servicesObjectRefAxPartnerCode;
	}

	public String getServicesObjectRefAxPartnerName(){
		return servicesObjectRefAxPartnerName;
	}

	public void setServicesObjectRefAxPartnerName(String servicesObjectRefAxPartnerName) {
		this.servicesObjectRefAxPartnerName = servicesObjectRefAxPartnerName;
	}

	public String getServicesObjectRefAxContractNumber(){
		return servicesObjectRefAxContractNumber;
	}

	public void setServicesObjectRefAxContractNumber(String servicesObjectRefAxContractNumber) {
		this.servicesObjectRefAxContractNumber = servicesObjectRefAxContractNumber;
	}

	public Date getServicesObjectRefAxContractDate(){
		return servicesObjectRefAxContractDate;
	}

	public void setServicesObjectRefAxContractDate(Date servicesObjectRefAxContractDate) {
		this.servicesObjectRefAxContractDate = servicesObjectRefAxContractDate;
	}

	public String getServicesObjectRefAxContractCode(){
		return servicesObjectRefAxContractCode;
	}

	public void setServicesObjectRefAxContractCode(String servicesObjectRefAxContractCode) {
		this.servicesObjectRefAxContractCode = servicesObjectRefAxContractCode;
	}

	public String getServicesObjectRefAxContractId(){
		return servicesObjectRefAxContractId;
	}

	public void setServicesObjectRefAxContractId(String servicesObjectRefAxContractId) {
		this.servicesObjectRefAxContractId = servicesObjectRefAxContractId;
	}

	public String getServicesObjectRefAxContractCommentGen(){
		return servicesObjectRefAxContractCommentGen;
	}

	public void setServicesObjectRefAxContractCommentGen(String servicesObjectRefAxContractCommentGen) {
		this.servicesObjectRefAxContractCommentGen = servicesObjectRefAxContractCommentGen;
	}

	public BigDecimal getServicesObjectRefProjAgreeSumma(){
		return servicesObjectRefProjAgreeSumma;
	}

	public void setServicesObjectRefProjAgreeSumma(BigDecimal servicesObjectRefProjAgreeSumma) {
		this.servicesObjectRefProjAgreeSumma = servicesObjectRefProjAgreeSumma;
	}

	public BigDecimal getServicesObjectRefTopographySumma(){
		return servicesObjectRefTopographySumma;
	}

	public void setServicesObjectRefTopographySumma(BigDecimal servicesObjectRefTopographySumma) {
		this.servicesObjectRefTopographySumma = servicesObjectRefTopographySumma;
	}

	public int getServicesObjectRefCreatedFromSite(){
		return servicesObjectRefCreatedFromSite;
	}

	public void setServicesObjectRefCreatedFromSite(int servicesObjectRefCreatedFromSite) {
		this.servicesObjectRefCreatedFromSite = servicesObjectRefCreatedFromSite;
	}

	public int getServicesObjectRefTerm(){
		return servicesObjectRefTerm;
	}

	public void setServicesObjectRefTerm(int servicesObjectRefTerm) {
		this.servicesObjectRefTerm = servicesObjectRefTerm;
	}

	public int getServicesObjectRefRegulation(){
		return servicesObjectRefRegulation;
	}

	public void setServicesObjectRefRegulation(int servicesObjectRefRegulation) {
		this.servicesObjectRefRegulation = servicesObjectRefRegulation;
	}

	public Date getServicesObjectRefBoundaryDateWork(){
		return servicesObjectRefBoundaryDateWork;
	}

	public void setServicesObjectRefBoundaryDateWork(Date servicesObjectRefBoundaryDateWork) {
		this.servicesObjectRefBoundaryDateWork = servicesObjectRefBoundaryDateWork;
	}

	public int getServicesObjectRefCountDayDelay(){
		return servicesObjectRefCountDayDelay;
	}

	public void setServicesObjectRefCountDayDelay(int servicesObjectRefCountDayDelay) {
		this.servicesObjectRefCountDayDelay = servicesObjectRefCountDayDelay;
	}

	public Date getServicesObjectRefFactDateWork(){
		return servicesObjectRefFactDateWork;
	}

	public void setServicesObjectRefFactDateWork(Date servicesObjectRefFactDateWork) {
		this.servicesObjectRefFactDateWork = servicesObjectRefFactDateWork;
	}

	public String getServicesObjectRefCodeEIC(){
		return servicesObjectRefCodeEIC;
	}

	public void setServicesObjectRefCodeEIC(String servicesObjectRefCodeEIC) {
		this.servicesObjectRefCodeEIC = servicesObjectRefCodeEIC;
	}

	public String getServicesObjectRefPersonalAccountUid(){
		return servicesObjectRefPersonalAccountUid;
	}

	public void setServicesObjectRefPersonalAccountUid(String servicesObjectRefPersonalAccountUid) {
		this.servicesObjectRefPersonalAccountUid = servicesObjectRefPersonalAccountUid;
	}



}
