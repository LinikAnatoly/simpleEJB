
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENAdditionalAgreement;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENAdditionalAgreementShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String numberGen;
	public Date dateGen ;
	public BigDecimal sumWithoutVAT;
	public BigDecimal sumVAT;
	public Boolean calcSumsByCalculations ;
	public Boolean isSigned ;
	public int servicesobjectRefCode = Integer.MIN_VALUE;
	public String servicesobjectRefContractNumber;
	public Date servicesobjectRefContractDate;
	public String servicesobjectRefName;
	public String servicesobjectRefPartnerCode;
	public String servicesobjectRefFinDocCode;
	public int servicesobjectRefFinDocID = Integer.MIN_VALUE;
	public String servicesobjectRefCommentGen;
	public String servicesobjectRefContractNumberServices;
	public Date servicesobjectRefContractDateServices;
	public String servicesobjectRefContragentName;
	public String servicesobjectRefContragentAddress;
	public String servicesobjectRefContragentAddressWork;
	public String servicesobjectRefContragentOkpo;
	public String servicesobjectRefContragentBankAccount;
	public String servicesobjectRefContragentBankName;
	public String servicesobjectRefContragentBankMfo;
	public String servicesobjectRefContragentBossName;
	public String servicesobjectRefContragentPassport;
	public BigDecimal servicesobjectRefContractServicesSumma;
	public BigDecimal servicesobjectRefContractServicesSummaVAT;
	public BigDecimal servicesobjectRefContractServicesPower;
	public String servicesobjectRefCommentServicesGen;
	public BigDecimal servicesobjectRefContractServicesDistance;
	public BigDecimal servicesobjectRefContractServicesDay;
	public String servicesobjectRefUserGen;
	public Date servicesobjectRefDateEdit;
	public Date servicesobjectRefWarrantDate;
	public String servicesobjectRefWarrantNumber;
	public String servicesobjectRefWarrantFIO;
	public int servicesobjectRefRegionalType = Integer.MIN_VALUE;
	public BigDecimal servicesobjectRefBasisType;
	public String servicesobjectRefContragentPosition;
	public Date servicesobjectRefExecuteWorkDate;
	public Date servicesobjectRefTimeStart;
	public Date servicesobjectRefTimeFinal;
	public String servicesobjectRefContragentPhoneNumber;
	public String servicesobjectRefExecutorPhoneNumber;
	public String servicesobjectRefContragentObjectWork;
	public int servicesobjectRefIsNoPay = Integer.MIN_VALUE;
	public int servicesobjectRefIsCustomerMaterials = Integer.MIN_VALUE;
	public Date servicesobjectRefPayDate;
	public int servicesobjectRefFinPayFormCode = Integer.MIN_VALUE;
	public String servicesobjectRefFinPayFormName;
	public int servicesobjectRefPartnerId = Integer.MIN_VALUE;
	public String servicesobjectRefPayDetail;
	public String servicesobjectRefActTransferNumber;
	public Date servicesobjectRefActTransferDate;
	public String servicesobjectRefResposible;
	public String servicesobjectRefResposiblePosition;
	public String servicesobjectRefResposibleTabNumber;
	public int servicesobjectRefPrevContractStatus = Integer.MIN_VALUE;
	public int servicesobjectRefReconnectionTU = Integer.MIN_VALUE;
	public int servicesobjectRefPersonalAccountCode = Integer.MIN_VALUE;
	public String servicesobjectRefPersonalAccountNumber;
	public String servicesobjectRefTabNumber;
	public String servicesobjectRefCitiesList;
	public BigDecimal servicesobjectRefLineLength;
	public String servicesobjectRefProjectCode;
	public int servicesobjectRefCnPackCode = Integer.MIN_VALUE;
	public int servicesobjectRefDfPackCode = Integer.MIN_VALUE;
	public int servicesobjectRefCountersZoneType = Integer.MIN_VALUE;
	public String servicesobjectRefAxPartnerCode;
	public String servicesobjectRefAxPartnerName;
	public String servicesobjectRefAxContractNumber;
	public Date servicesobjectRefAxContractDate;
	public String servicesobjectRefAxContractCode;
	public String servicesobjectRefAxContractId;
	public String servicesobjectRefAxContractCommentGen;
	public BigDecimal servicesobjectRefProjAgreeSumma;
	public BigDecimal servicesobjectRefTopographySumma;
	public int servicesobjectRefCreatedFromSite = Integer.MIN_VALUE;
	public int servicesobjectRefTerm = Integer.MIN_VALUE;
	public int servicesobjectRefRegulation = Integer.MIN_VALUE;
	public Date servicesobjectRefBoundaryDateWork;
	public int servicesobjectRefCountDayDelay = Integer.MIN_VALUE;
	public Date servicesobjectRefFactDateWork;
	public String servicesobjectRefCodeEIC;
	public String servicesobjectRefPersonalAccountUid;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setNumberGen(String aValue){
		numberGen = aValue;
	}

	public String getNumberGen(){
		return numberGen;
	}

	public void setDateGen(Date aValue){
		dateGen = aValue;
	}

	public Date getDateGen(){
		return dateGen;
	}

	public void setSumWithoutVAT(BigDecimal aValue){
		sumWithoutVAT = aValue;
	}

	public BigDecimal getSumWithoutVAT(){
		return sumWithoutVAT;
	}

	public void setSumVAT(BigDecimal aValue){
		sumVAT = aValue;
	}

	public BigDecimal getSumVAT(){
		return sumVAT;
	}

	public void setCalcSumsByCalculations(Boolean aValue){
		calcSumsByCalculations = aValue;
	}

	public Boolean getCalcSumsByCalculations(){
		return calcSumsByCalculations;
	}

	public void setIsSigned(Boolean aValue){
		isSigned = aValue;
	}

	public Boolean getIsSigned(){
		return isSigned;
	}


	public void setServicesobjectRefCode(int aValue){
		servicesobjectRefCode = aValue;
	}
	public int getServicesobjectRefCode(){
		return servicesobjectRefCode;
	}

	public void setServicesobjectRefContractNumber(String aValue){
		servicesobjectRefContractNumber = aValue;
	}
	public String getServicesobjectRefContractNumber(){
		return servicesobjectRefContractNumber;
	}

	public void setServicesobjectRefContractDate(Date aValue){
		servicesobjectRefContractDate = aValue;
	}
	public Date getServicesobjectRefContractDate(){
		return servicesobjectRefContractDate;
	}

	public void setServicesobjectRefName(String aValue){
		servicesobjectRefName = aValue;
	}
	public String getServicesobjectRefName(){
		return servicesobjectRefName;
	}

	public void setServicesobjectRefPartnerCode(String aValue){
		servicesobjectRefPartnerCode = aValue;
	}
	public String getServicesobjectRefPartnerCode(){
		return servicesobjectRefPartnerCode;
	}

	public void setServicesobjectRefFinDocCode(String aValue){
		servicesobjectRefFinDocCode = aValue;
	}
	public String getServicesobjectRefFinDocCode(){
		return servicesobjectRefFinDocCode;
	}

	public void setServicesobjectRefFinDocID(int aValue){
		servicesobjectRefFinDocID = aValue;
	}
	public int getServicesobjectRefFinDocID(){
		return servicesobjectRefFinDocID;
	}

	public void setServicesobjectRefCommentGen(String aValue){
		servicesobjectRefCommentGen = aValue;
	}
	public String getServicesobjectRefCommentGen(){
		return servicesobjectRefCommentGen;
	}

	public void setServicesobjectRefContractNumberServices(String aValue){
		servicesobjectRefContractNumberServices = aValue;
	}
	public String getServicesobjectRefContractNumberServices(){
		return servicesobjectRefContractNumberServices;
	}

	public void setServicesobjectRefContractDateServices(Date aValue){
		servicesobjectRefContractDateServices = aValue;
	}
	public Date getServicesobjectRefContractDateServices(){
		return servicesobjectRefContractDateServices;
	}

	public void setServicesobjectRefContragentName(String aValue){
		servicesobjectRefContragentName = aValue;
	}
	public String getServicesobjectRefContragentName(){
		return servicesobjectRefContragentName;
	}

	public void setServicesobjectRefContragentAddress(String aValue){
		servicesobjectRefContragentAddress = aValue;
	}
	public String getServicesobjectRefContragentAddress(){
		return servicesobjectRefContragentAddress;
	}

	public void setServicesobjectRefContragentAddressWork(String aValue){
		servicesobjectRefContragentAddressWork = aValue;
	}
	public String getServicesobjectRefContragentAddressWork(){
		return servicesobjectRefContragentAddressWork;
	}

	public void setServicesobjectRefContragentOkpo(String aValue){
		servicesobjectRefContragentOkpo = aValue;
	}
	public String getServicesobjectRefContragentOkpo(){
		return servicesobjectRefContragentOkpo;
	}

	public void setServicesobjectRefContragentBankAccount(String aValue){
		servicesobjectRefContragentBankAccount = aValue;
	}
	public String getServicesobjectRefContragentBankAccount(){
		return servicesobjectRefContragentBankAccount;
	}

	public void setServicesobjectRefContragentBankName(String aValue){
		servicesobjectRefContragentBankName = aValue;
	}
	public String getServicesobjectRefContragentBankName(){
		return servicesobjectRefContragentBankName;
	}

	public void setServicesobjectRefContragentBankMfo(String aValue){
		servicesobjectRefContragentBankMfo = aValue;
	}
	public String getServicesobjectRefContragentBankMfo(){
		return servicesobjectRefContragentBankMfo;
	}

	public void setServicesobjectRefContragentBossName(String aValue){
		servicesobjectRefContragentBossName = aValue;
	}
	public String getServicesobjectRefContragentBossName(){
		return servicesobjectRefContragentBossName;
	}

	public void setServicesobjectRefContragentPassport(String aValue){
		servicesobjectRefContragentPassport = aValue;
	}
	public String getServicesobjectRefContragentPassport(){
		return servicesobjectRefContragentPassport;
	}

	public void setServicesobjectRefContractServicesSumma(BigDecimal aValue){
		servicesobjectRefContractServicesSumma = aValue;
	}
	public BigDecimal getServicesobjectRefContractServicesSumma(){
		return servicesobjectRefContractServicesSumma;
	}

	public void setServicesobjectRefContractServicesSummaVAT(BigDecimal aValue){
		servicesobjectRefContractServicesSummaVAT = aValue;
	}
	public BigDecimal getServicesobjectRefContractServicesSummaVAT(){
		return servicesobjectRefContractServicesSummaVAT;
	}

	public void setServicesobjectRefContractServicesPower(BigDecimal aValue){
		servicesobjectRefContractServicesPower = aValue;
	}
	public BigDecimal getServicesobjectRefContractServicesPower(){
		return servicesobjectRefContractServicesPower;
	}

	public void setServicesobjectRefCommentServicesGen(String aValue){
		servicesobjectRefCommentServicesGen = aValue;
	}
	public String getServicesobjectRefCommentServicesGen(){
		return servicesobjectRefCommentServicesGen;
	}

	public void setServicesobjectRefContractServicesDistance(BigDecimal aValue){
		servicesobjectRefContractServicesDistance = aValue;
	}
	public BigDecimal getServicesobjectRefContractServicesDistance(){
		return servicesobjectRefContractServicesDistance;
	}

	public void setServicesobjectRefContractServicesDay(BigDecimal aValue){
		servicesobjectRefContractServicesDay = aValue;
	}
	public BigDecimal getServicesobjectRefContractServicesDay(){
		return servicesobjectRefContractServicesDay;
	}

	public void setServicesobjectRefUserGen(String aValue){
		servicesobjectRefUserGen = aValue;
	}
	public String getServicesobjectRefUserGen(){
		return servicesobjectRefUserGen;
	}

	public void setServicesobjectRefDateEdit(Date aValue){
		servicesobjectRefDateEdit = aValue;
	}
	public Date getServicesobjectRefDateEdit(){
		return servicesobjectRefDateEdit;
	}

	public void setServicesobjectRefWarrantDate(Date aValue){
		servicesobjectRefWarrantDate = aValue;
	}
	public Date getServicesobjectRefWarrantDate(){
		return servicesobjectRefWarrantDate;
	}

	public void setServicesobjectRefWarrantNumber(String aValue){
		servicesobjectRefWarrantNumber = aValue;
	}
	public String getServicesobjectRefWarrantNumber(){
		return servicesobjectRefWarrantNumber;
	}

	public void setServicesobjectRefWarrantFIO(String aValue){
		servicesobjectRefWarrantFIO = aValue;
	}
	public String getServicesobjectRefWarrantFIO(){
		return servicesobjectRefWarrantFIO;
	}

	public void setServicesobjectRefRegionalType(int aValue){
		servicesobjectRefRegionalType = aValue;
	}
	public int getServicesobjectRefRegionalType(){
		return servicesobjectRefRegionalType;
	}

	public void setServicesobjectRefBasisType(BigDecimal aValue){
		servicesobjectRefBasisType = aValue;
	}
	public BigDecimal getServicesobjectRefBasisType(){
		return servicesobjectRefBasisType;
	}

	public void setServicesobjectRefContragentPosition(String aValue){
		servicesobjectRefContragentPosition = aValue;
	}
	public String getServicesobjectRefContragentPosition(){
		return servicesobjectRefContragentPosition;
	}

	public void setServicesobjectRefExecuteWorkDate(Date aValue){
		servicesobjectRefExecuteWorkDate = aValue;
	}
	public Date getServicesobjectRefExecuteWorkDate(){
		return servicesobjectRefExecuteWorkDate;
	}

	public void setServicesobjectRefTimeStart(Date aValue){
		servicesobjectRefTimeStart = aValue;
	}
	public Date getServicesobjectRefTimeStart(){
		return servicesobjectRefTimeStart;
	}

	public void setServicesobjectRefTimeFinal(Date aValue){
		servicesobjectRefTimeFinal = aValue;
	}
	public Date getServicesobjectRefTimeFinal(){
		return servicesobjectRefTimeFinal;
	}

	public void setServicesobjectRefContragentPhoneNumber(String aValue){
		servicesobjectRefContragentPhoneNumber = aValue;
	}
	public String getServicesobjectRefContragentPhoneNumber(){
		return servicesobjectRefContragentPhoneNumber;
	}

	public void setServicesobjectRefExecutorPhoneNumber(String aValue){
		servicesobjectRefExecutorPhoneNumber = aValue;
	}
	public String getServicesobjectRefExecutorPhoneNumber(){
		return servicesobjectRefExecutorPhoneNumber;
	}

	public void setServicesobjectRefContragentObjectWork(String aValue){
		servicesobjectRefContragentObjectWork = aValue;
	}
	public String getServicesobjectRefContragentObjectWork(){
		return servicesobjectRefContragentObjectWork;
	}

	public void setServicesobjectRefIsNoPay(int aValue){
		servicesobjectRefIsNoPay = aValue;
	}
	public int getServicesobjectRefIsNoPay(){
		return servicesobjectRefIsNoPay;
	}

	public void setServicesobjectRefIsCustomerMaterials(int aValue){
		servicesobjectRefIsCustomerMaterials = aValue;
	}
	public int getServicesobjectRefIsCustomerMaterials(){
		return servicesobjectRefIsCustomerMaterials;
	}

	public void setServicesobjectRefPayDate(Date aValue){
		servicesobjectRefPayDate = aValue;
	}
	public Date getServicesobjectRefPayDate(){
		return servicesobjectRefPayDate;
	}

	public void setServicesobjectRefFinPayFormCode(int aValue){
		servicesobjectRefFinPayFormCode = aValue;
	}
	public int getServicesobjectRefFinPayFormCode(){
		return servicesobjectRefFinPayFormCode;
	}

	public void setServicesobjectRefFinPayFormName(String aValue){
		servicesobjectRefFinPayFormName = aValue;
	}
	public String getServicesobjectRefFinPayFormName(){
		return servicesobjectRefFinPayFormName;
	}

	public void setServicesobjectRefPartnerId(int aValue){
		servicesobjectRefPartnerId = aValue;
	}
	public int getServicesobjectRefPartnerId(){
		return servicesobjectRefPartnerId;
	}

	public void setServicesobjectRefPayDetail(String aValue){
		servicesobjectRefPayDetail = aValue;
	}
	public String getServicesobjectRefPayDetail(){
		return servicesobjectRefPayDetail;
	}

	public void setServicesobjectRefActTransferNumber(String aValue){
		servicesobjectRefActTransferNumber = aValue;
	}
	public String getServicesobjectRefActTransferNumber(){
		return servicesobjectRefActTransferNumber;
	}

	public void setServicesobjectRefActTransferDate(Date aValue){
		servicesobjectRefActTransferDate = aValue;
	}
	public Date getServicesobjectRefActTransferDate(){
		return servicesobjectRefActTransferDate;
	}

	public void setServicesobjectRefResposible(String aValue){
		servicesobjectRefResposible = aValue;
	}
	public String getServicesobjectRefResposible(){
		return servicesobjectRefResposible;
	}

	public void setServicesobjectRefResposiblePosition(String aValue){
		servicesobjectRefResposiblePosition = aValue;
	}
	public String getServicesobjectRefResposiblePosition(){
		return servicesobjectRefResposiblePosition;
	}

	public void setServicesobjectRefResposibleTabNumber(String aValue){
		servicesobjectRefResposibleTabNumber = aValue;
	}
	public String getServicesobjectRefResposibleTabNumber(){
		return servicesobjectRefResposibleTabNumber;
	}

	public void setServicesobjectRefPrevContractStatus(int aValue){
		servicesobjectRefPrevContractStatus = aValue;
	}
	public int getServicesobjectRefPrevContractStatus(){
		return servicesobjectRefPrevContractStatus;
	}

	public void setServicesobjectRefReconnectionTU(int aValue){
		servicesobjectRefReconnectionTU = aValue;
	}
	public int getServicesobjectRefReconnectionTU(){
		return servicesobjectRefReconnectionTU;
	}

	public void setServicesobjectRefPersonalAccountCode(int aValue){
		servicesobjectRefPersonalAccountCode = aValue;
	}
	public int getServicesobjectRefPersonalAccountCode(){
		return servicesobjectRefPersonalAccountCode;
	}

	public void setServicesobjectRefPersonalAccountNumber(String aValue){
		servicesobjectRefPersonalAccountNumber = aValue;
	}
	public String getServicesobjectRefPersonalAccountNumber(){
		return servicesobjectRefPersonalAccountNumber;
	}

	public void setServicesobjectRefTabNumber(String aValue){
		servicesobjectRefTabNumber = aValue;
	}
	public String getServicesobjectRefTabNumber(){
		return servicesobjectRefTabNumber;
	}

	public void setServicesobjectRefCitiesList(String aValue){
		servicesobjectRefCitiesList = aValue;
	}
	public String getServicesobjectRefCitiesList(){
		return servicesobjectRefCitiesList;
	}

	public void setServicesobjectRefLineLength(BigDecimal aValue){
		servicesobjectRefLineLength = aValue;
	}
	public BigDecimal getServicesobjectRefLineLength(){
		return servicesobjectRefLineLength;
	}

	public void setServicesobjectRefProjectCode(String aValue){
		servicesobjectRefProjectCode = aValue;
	}
	public String getServicesobjectRefProjectCode(){
		return servicesobjectRefProjectCode;
	}

	public void setServicesobjectRefCnPackCode(int aValue){
		servicesobjectRefCnPackCode = aValue;
	}
	public int getServicesobjectRefCnPackCode(){
		return servicesobjectRefCnPackCode;
	}

	public void setServicesobjectRefDfPackCode(int aValue){
		servicesobjectRefDfPackCode = aValue;
	}
	public int getServicesobjectRefDfPackCode(){
		return servicesobjectRefDfPackCode;
	}

	public void setServicesobjectRefCountersZoneType(int aValue){
		servicesobjectRefCountersZoneType = aValue;
	}
	public int getServicesobjectRefCountersZoneType(){
		return servicesobjectRefCountersZoneType;
	}

	public void setServicesobjectRefAxPartnerCode(String aValue){
		servicesobjectRefAxPartnerCode = aValue;
	}
	public String getServicesobjectRefAxPartnerCode(){
		return servicesobjectRefAxPartnerCode;
	}

	public void setServicesobjectRefAxPartnerName(String aValue){
		servicesobjectRefAxPartnerName = aValue;
	}
	public String getServicesobjectRefAxPartnerName(){
		return servicesobjectRefAxPartnerName;
	}

	public void setServicesobjectRefAxContractNumber(String aValue){
		servicesobjectRefAxContractNumber = aValue;
	}
	public String getServicesobjectRefAxContractNumber(){
		return servicesobjectRefAxContractNumber;
	}

	public void setServicesobjectRefAxContractDate(Date aValue){
		servicesobjectRefAxContractDate = aValue;
	}
	public Date getServicesobjectRefAxContractDate(){
		return servicesobjectRefAxContractDate;
	}

	public void setServicesobjectRefAxContractCode(String aValue){
		servicesobjectRefAxContractCode = aValue;
	}
	public String getServicesobjectRefAxContractCode(){
		return servicesobjectRefAxContractCode;
	}

	public void setServicesobjectRefAxContractId(String aValue){
		servicesobjectRefAxContractId = aValue;
	}
	public String getServicesobjectRefAxContractId(){
		return servicesobjectRefAxContractId;
	}

	public void setServicesobjectRefAxContractCommentGen(String aValue){
		servicesobjectRefAxContractCommentGen = aValue;
	}
	public String getServicesobjectRefAxContractCommentGen(){
		return servicesobjectRefAxContractCommentGen;
	}

	public void setServicesobjectRefProjAgreeSumma(BigDecimal aValue){
		servicesobjectRefProjAgreeSumma = aValue;
	}
	public BigDecimal getServicesobjectRefProjAgreeSumma(){
		return servicesobjectRefProjAgreeSumma;
	}

	public void setServicesobjectRefTopographySumma(BigDecimal aValue){
		servicesobjectRefTopographySumma = aValue;
	}
	public BigDecimal getServicesobjectRefTopographySumma(){
		return servicesobjectRefTopographySumma;
	}

	public void setServicesobjectRefCreatedFromSite(int aValue){
		servicesobjectRefCreatedFromSite = aValue;
	}
	public int getServicesobjectRefCreatedFromSite(){
		return servicesobjectRefCreatedFromSite;
	}

	public void setServicesobjectRefTerm(int aValue){
		servicesobjectRefTerm = aValue;
	}
	public int getServicesobjectRefTerm(){
		return servicesobjectRefTerm;
	}

	public void setServicesobjectRefRegulation(int aValue){
		servicesobjectRefRegulation = aValue;
	}
	public int getServicesobjectRefRegulation(){
		return servicesobjectRefRegulation;
	}

	public void setServicesobjectRefBoundaryDateWork(Date aValue){
		servicesobjectRefBoundaryDateWork = aValue;
	}
	public Date getServicesobjectRefBoundaryDateWork(){
		return servicesobjectRefBoundaryDateWork;
	}

	public void setServicesobjectRefCountDayDelay(int aValue){
		servicesobjectRefCountDayDelay = aValue;
	}
	public int getServicesobjectRefCountDayDelay(){
		return servicesobjectRefCountDayDelay;
	}

	public void setServicesobjectRefFactDateWork(Date aValue){
		servicesobjectRefFactDateWork = aValue;
	}
	public Date getServicesobjectRefFactDateWork(){
		return servicesobjectRefFactDateWork;
	}

	public void setServicesobjectRefCodeEIC(String aValue){
		servicesobjectRefCodeEIC = aValue;
	}
	public String getServicesobjectRefCodeEIC(){
		return servicesobjectRefCodeEIC;
	}

	public void setServicesobjectRefPersonalAccountUid(String aValue){
		servicesobjectRefPersonalAccountUid = aValue;
	}
	public String getServicesobjectRefPersonalAccountUid(){
		return servicesobjectRefPersonalAccountUid;
	}



}
