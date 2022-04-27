
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENServicesCost;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENServicesCostShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public Date dateGen ;
	public BigDecimal countGen;
	public BigDecimal calculationCost;
	public BigDecimal costWithoutVAT;
	public BigDecimal costVAT;
	public BigDecimal costWithVAT;
	public int tkCalcCostRefCode = Integer.MIN_VALUE;
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
	public int planRefCode = Integer.MIN_VALUE;
	public Date planRefDateGen;
	public Date planRefDateStart;
	public Date planRefDateFinal;
	public int planRefYearGen = Integer.MIN_VALUE;
	public int planRefMonthGen = Integer.MIN_VALUE;
	public int planRefYearOriginal = Integer.MIN_VALUE;
	public int planRefMonthOriginal = Integer.MIN_VALUE;
	public String planRefUserGen;
	public Date planRefDateEdit;
	public String planRefWorkOrderNumber;
	public Date planRefDateWorkOrder;
	public String planRefPriConnectionNumber;
	public Date planRefDateEndPriConnection;
	public String planRefInvestWorksDescription;
	public int planRefServicesFSideFinId = Integer.MIN_VALUE;
	public String planRefServicesFSideCnNum;
	public BigDecimal planRefTotalTimeHours;
	public BigDecimal planRefTotalTimeDays;
	public String planRefInvestItemNumber;
	public String tkClassificationTypeRefKod;
	public String tkClassificationTypeRefName;
	
	public String tkClassificationTypeRefKved;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setDateGen(Date aValue){
		dateGen = aValue;
	}

	public Date getDateGen(){
		return dateGen;
	}

	public void setCountGen(BigDecimal aValue){
		countGen = aValue;
	}

	public BigDecimal getCountGen(){
		return countGen;
	}










	public void setCalculationCost(BigDecimal aValue){
		calculationCost = aValue;
	}

	public BigDecimal getCalculationCost(){
		return calculationCost;
	}

	public void setCostWithoutVAT(BigDecimal aValue){
		costWithoutVAT = aValue;
	}

	public BigDecimal getCostWithoutVAT(){
		return costWithoutVAT;
	}

	public void setCostVAT(BigDecimal aValue){
		costVAT = aValue;
	}

	public BigDecimal getCostVAT(){
		return costVAT;
	}

	public void setCostWithVAT(BigDecimal aValue){
		costWithVAT = aValue;
	}

	public BigDecimal getCostWithVAT(){
		return costWithVAT;
	}


	public void setTkCalcCostRefCode(int aValue){
		tkCalcCostRefCode = aValue;
	}
	public int getTkCalcCostRefCode(){
		return tkCalcCostRefCode;
	}

	public void setServicesObjectRefCode(int aValue){
		servicesObjectRefCode = aValue;
	}
	public int getServicesObjectRefCode(){
		return servicesObjectRefCode;
	}

	public void setServicesObjectRefContractNumber(String aValue){
		servicesObjectRefContractNumber = aValue;
	}
	public String getServicesObjectRefContractNumber(){
		return servicesObjectRefContractNumber;
	}

	public void setServicesObjectRefContractDate(Date aValue){
		servicesObjectRefContractDate = aValue;
	}
	public Date getServicesObjectRefContractDate(){
		return servicesObjectRefContractDate;
	}

	public void setServicesObjectRefName(String aValue){
		servicesObjectRefName = aValue;
	}
	public String getServicesObjectRefName(){
		return servicesObjectRefName;
	}

	public void setServicesObjectRefPartnerCode(String aValue){
		servicesObjectRefPartnerCode = aValue;
	}
	public String getServicesObjectRefPartnerCode(){
		return servicesObjectRefPartnerCode;
	}

	public void setServicesObjectRefFinDocCode(String aValue){
		servicesObjectRefFinDocCode = aValue;
	}
	public String getServicesObjectRefFinDocCode(){
		return servicesObjectRefFinDocCode;
	}

	public void setServicesObjectRefFinDocID(int aValue){
		servicesObjectRefFinDocID = aValue;
	}
	public int getServicesObjectRefFinDocID(){
		return servicesObjectRefFinDocID;
	}

	public void setServicesObjectRefCommentGen(String aValue){
		servicesObjectRefCommentGen = aValue;
	}
	public String getServicesObjectRefCommentGen(){
		return servicesObjectRefCommentGen;
	}

	public void setServicesObjectRefContractNumberServices(String aValue){
		servicesObjectRefContractNumberServices = aValue;
	}
	public String getServicesObjectRefContractNumberServices(){
		return servicesObjectRefContractNumberServices;
	}

	public void setServicesObjectRefContractDateServices(Date aValue){
		servicesObjectRefContractDateServices = aValue;
	}
	public Date getServicesObjectRefContractDateServices(){
		return servicesObjectRefContractDateServices;
	}

	public void setServicesObjectRefContragentName(String aValue){
		servicesObjectRefContragentName = aValue;
	}
	public String getServicesObjectRefContragentName(){
		return servicesObjectRefContragentName;
	}

	public void setServicesObjectRefContragentAddress(String aValue){
		servicesObjectRefContragentAddress = aValue;
	}
	public String getServicesObjectRefContragentAddress(){
		return servicesObjectRefContragentAddress;
	}

	public void setServicesObjectRefContragentAddressWork(String aValue){
		servicesObjectRefContragentAddressWork = aValue;
	}
	public String getServicesObjectRefContragentAddressWork(){
		return servicesObjectRefContragentAddressWork;
	}

	public void setServicesObjectRefContragentOkpo(String aValue){
		servicesObjectRefContragentOkpo = aValue;
	}
	public String getServicesObjectRefContragentOkpo(){
		return servicesObjectRefContragentOkpo;
	}

	public void setServicesObjectRefContragentBankAccount(String aValue){
		servicesObjectRefContragentBankAccount = aValue;
	}
	public String getServicesObjectRefContragentBankAccount(){
		return servicesObjectRefContragentBankAccount;
	}

	public void setServicesObjectRefContragentBankName(String aValue){
		servicesObjectRefContragentBankName = aValue;
	}
	public String getServicesObjectRefContragentBankName(){
		return servicesObjectRefContragentBankName;
	}

	public void setServicesObjectRefContragentBankMfo(String aValue){
		servicesObjectRefContragentBankMfo = aValue;
	}
	public String getServicesObjectRefContragentBankMfo(){
		return servicesObjectRefContragentBankMfo;
	}

	public void setServicesObjectRefContragentBossName(String aValue){
		servicesObjectRefContragentBossName = aValue;
	}
	public String getServicesObjectRefContragentBossName(){
		return servicesObjectRefContragentBossName;
	}

	public void setServicesObjectRefContragentPassport(String aValue){
		servicesObjectRefContragentPassport = aValue;
	}
	public String getServicesObjectRefContragentPassport(){
		return servicesObjectRefContragentPassport;
	}

	public void setServicesObjectRefContractServicesSumma(BigDecimal aValue){
		servicesObjectRefContractServicesSumma = aValue;
	}
	public BigDecimal getServicesObjectRefContractServicesSumma(){
		return servicesObjectRefContractServicesSumma;
	}

	public void setServicesObjectRefContractServicesSummaVAT(BigDecimal aValue){
		servicesObjectRefContractServicesSummaVAT = aValue;
	}
	public BigDecimal getServicesObjectRefContractServicesSummaVAT(){
		return servicesObjectRefContractServicesSummaVAT;
	}

	public void setServicesObjectRefContractServicesPower(BigDecimal aValue){
		servicesObjectRefContractServicesPower = aValue;
	}
	public BigDecimal getServicesObjectRefContractServicesPower(){
		return servicesObjectRefContractServicesPower;
	}

	public void setServicesObjectRefCommentServicesGen(String aValue){
		servicesObjectRefCommentServicesGen = aValue;
	}
	public String getServicesObjectRefCommentServicesGen(){
		return servicesObjectRefCommentServicesGen;
	}

	public void setServicesObjectRefContractServicesDistance(BigDecimal aValue){
		servicesObjectRefContractServicesDistance = aValue;
	}
	public BigDecimal getServicesObjectRefContractServicesDistance(){
		return servicesObjectRefContractServicesDistance;
	}

	public void setServicesObjectRefContractServicesDay(BigDecimal aValue){
		servicesObjectRefContractServicesDay = aValue;
	}
	public BigDecimal getServicesObjectRefContractServicesDay(){
		return servicesObjectRefContractServicesDay;
	}

	public void setServicesObjectRefUserGen(String aValue){
		servicesObjectRefUserGen = aValue;
	}
	public String getServicesObjectRefUserGen(){
		return servicesObjectRefUserGen;
	}

	public void setServicesObjectRefDateEdit(Date aValue){
		servicesObjectRefDateEdit = aValue;
	}
	public Date getServicesObjectRefDateEdit(){
		return servicesObjectRefDateEdit;
	}

	public void setServicesObjectRefWarrantDate(Date aValue){
		servicesObjectRefWarrantDate = aValue;
	}
	public Date getServicesObjectRefWarrantDate(){
		return servicesObjectRefWarrantDate;
	}

	public void setServicesObjectRefWarrantNumber(String aValue){
		servicesObjectRefWarrantNumber = aValue;
	}
	public String getServicesObjectRefWarrantNumber(){
		return servicesObjectRefWarrantNumber;
	}

	public void setServicesObjectRefWarrantFIO(String aValue){
		servicesObjectRefWarrantFIO = aValue;
	}
	public String getServicesObjectRefWarrantFIO(){
		return servicesObjectRefWarrantFIO;
	}

	public void setServicesObjectRefRegionalType(int aValue){
		servicesObjectRefRegionalType = aValue;
	}
	public int getServicesObjectRefRegionalType(){
		return servicesObjectRefRegionalType;
	}

	public void setServicesObjectRefBasisType(BigDecimal aValue){
		servicesObjectRefBasisType = aValue;
	}
	public BigDecimal getServicesObjectRefBasisType(){
		return servicesObjectRefBasisType;
	}

	public void setServicesObjectRefContragentPosition(String aValue){
		servicesObjectRefContragentPosition = aValue;
	}
	public String getServicesObjectRefContragentPosition(){
		return servicesObjectRefContragentPosition;
	}

	public void setServicesObjectRefExecuteWorkDate(Date aValue){
		servicesObjectRefExecuteWorkDate = aValue;
	}
	public Date getServicesObjectRefExecuteWorkDate(){
		return servicesObjectRefExecuteWorkDate;
	}

	public void setServicesObjectRefTimeStart(Date aValue){
		servicesObjectRefTimeStart = aValue;
	}
	public Date getServicesObjectRefTimeStart(){
		return servicesObjectRefTimeStart;
	}

	public void setServicesObjectRefTimeFinal(Date aValue){
		servicesObjectRefTimeFinal = aValue;
	}
	public Date getServicesObjectRefTimeFinal(){
		return servicesObjectRefTimeFinal;
	}

	public void setServicesObjectRefContragentPhoneNumber(String aValue){
		servicesObjectRefContragentPhoneNumber = aValue;
	}
	public String getServicesObjectRefContragentPhoneNumber(){
		return servicesObjectRefContragentPhoneNumber;
	}

	public void setServicesObjectRefExecutorPhoneNumber(String aValue){
		servicesObjectRefExecutorPhoneNumber = aValue;
	}
	public String getServicesObjectRefExecutorPhoneNumber(){
		return servicesObjectRefExecutorPhoneNumber;
	}

	public void setServicesObjectRefContragentObjectWork(String aValue){
		servicesObjectRefContragentObjectWork = aValue;
	}
	public String getServicesObjectRefContragentObjectWork(){
		return servicesObjectRefContragentObjectWork;
	}

	public void setServicesObjectRefIsNoPay(int aValue){
		servicesObjectRefIsNoPay = aValue;
	}
	public int getServicesObjectRefIsNoPay(){
		return servicesObjectRefIsNoPay;
	}

	public void setServicesObjectRefIsCustomerMaterials(int aValue){
		servicesObjectRefIsCustomerMaterials = aValue;
	}
	public int getServicesObjectRefIsCustomerMaterials(){
		return servicesObjectRefIsCustomerMaterials;
	}

	public void setServicesObjectRefPayDate(Date aValue){
		servicesObjectRefPayDate = aValue;
	}
	public Date getServicesObjectRefPayDate(){
		return servicesObjectRefPayDate;
	}

	public void setServicesObjectRefFinPayFormCode(int aValue){
		servicesObjectRefFinPayFormCode = aValue;
	}
	public int getServicesObjectRefFinPayFormCode(){
		return servicesObjectRefFinPayFormCode;
	}

	public void setServicesObjectRefFinPayFormName(String aValue){
		servicesObjectRefFinPayFormName = aValue;
	}
	public String getServicesObjectRefFinPayFormName(){
		return servicesObjectRefFinPayFormName;
	}

	public void setServicesObjectRefPartnerId(int aValue){
		servicesObjectRefPartnerId = aValue;
	}
	public int getServicesObjectRefPartnerId(){
		return servicesObjectRefPartnerId;
	}

	public void setServicesObjectRefPayDetail(String aValue){
		servicesObjectRefPayDetail = aValue;
	}
	public String getServicesObjectRefPayDetail(){
		return servicesObjectRefPayDetail;
	}

	public void setServicesObjectRefActTransferNumber(String aValue){
		servicesObjectRefActTransferNumber = aValue;
	}
	public String getServicesObjectRefActTransferNumber(){
		return servicesObjectRefActTransferNumber;
	}

	public void setServicesObjectRefActTransferDate(Date aValue){
		servicesObjectRefActTransferDate = aValue;
	}
	public Date getServicesObjectRefActTransferDate(){
		return servicesObjectRefActTransferDate;
	}

	public void setServicesObjectRefResposible(String aValue){
		servicesObjectRefResposible = aValue;
	}
	public String getServicesObjectRefResposible(){
		return servicesObjectRefResposible;
	}

	public void setServicesObjectRefResposiblePosition(String aValue){
		servicesObjectRefResposiblePosition = aValue;
	}
	public String getServicesObjectRefResposiblePosition(){
		return servicesObjectRefResposiblePosition;
	}

	public void setServicesObjectRefResposibleTabNumber(String aValue){
		servicesObjectRefResposibleTabNumber = aValue;
	}
	public String getServicesObjectRefResposibleTabNumber(){
		return servicesObjectRefResposibleTabNumber;
	}

	public void setServicesObjectRefPrevContractStatus(int aValue){
		servicesObjectRefPrevContractStatus = aValue;
	}
	public int getServicesObjectRefPrevContractStatus(){
		return servicesObjectRefPrevContractStatus;
	}

	public void setServicesObjectRefReconnectionTU(int aValue){
		servicesObjectRefReconnectionTU = aValue;
	}
	public int getServicesObjectRefReconnectionTU(){
		return servicesObjectRefReconnectionTU;
	}

	public void setServicesObjectRefPersonalAccountCode(int aValue){
		servicesObjectRefPersonalAccountCode = aValue;
	}
	public int getServicesObjectRefPersonalAccountCode(){
		return servicesObjectRefPersonalAccountCode;
	}

	public void setServicesObjectRefPersonalAccountNumber(String aValue){
		servicesObjectRefPersonalAccountNumber = aValue;
	}
	public String getServicesObjectRefPersonalAccountNumber(){
		return servicesObjectRefPersonalAccountNumber;
	}

	public void setServicesObjectRefTabNumber(String aValue){
		servicesObjectRefTabNumber = aValue;
	}
	public String getServicesObjectRefTabNumber(){
		return servicesObjectRefTabNumber;
	}

	public void setServicesObjectRefCitiesList(String aValue){
		servicesObjectRefCitiesList = aValue;
	}
	public String getServicesObjectRefCitiesList(){
		return servicesObjectRefCitiesList;
	}

	public void setServicesObjectRefLineLength(BigDecimal aValue){
		servicesObjectRefLineLength = aValue;
	}
	public BigDecimal getServicesObjectRefLineLength(){
		return servicesObjectRefLineLength;
	}

	public void setServicesObjectRefProjectCode(String aValue){
		servicesObjectRefProjectCode = aValue;
	}
	public String getServicesObjectRefProjectCode(){
		return servicesObjectRefProjectCode;
	}

	public void setServicesObjectRefCnPackCode(int aValue){
		servicesObjectRefCnPackCode = aValue;
	}
	public int getServicesObjectRefCnPackCode(){
		return servicesObjectRefCnPackCode;
	}

	public void setServicesObjectRefDfPackCode(int aValue){
		servicesObjectRefDfPackCode = aValue;
	}
	public int getServicesObjectRefDfPackCode(){
		return servicesObjectRefDfPackCode;
	}

	public void setServicesObjectRefCountersZoneType(int aValue){
		servicesObjectRefCountersZoneType = aValue;
	}
	public int getServicesObjectRefCountersZoneType(){
		return servicesObjectRefCountersZoneType;
	}

	public void setServicesObjectRefAxPartnerCode(String aValue){
		servicesObjectRefAxPartnerCode = aValue;
	}
	public String getServicesObjectRefAxPartnerCode(){
		return servicesObjectRefAxPartnerCode;
	}

	public void setServicesObjectRefAxPartnerName(String aValue){
		servicesObjectRefAxPartnerName = aValue;
	}
	public String getServicesObjectRefAxPartnerName(){
		return servicesObjectRefAxPartnerName;
	}

	public void setServicesObjectRefAxContractNumber(String aValue){
		servicesObjectRefAxContractNumber = aValue;
	}
	public String getServicesObjectRefAxContractNumber(){
		return servicesObjectRefAxContractNumber;
	}

	public void setServicesObjectRefAxContractDate(Date aValue){
		servicesObjectRefAxContractDate = aValue;
	}
	public Date getServicesObjectRefAxContractDate(){
		return servicesObjectRefAxContractDate;
	}

	public void setServicesObjectRefAxContractCode(String aValue){
		servicesObjectRefAxContractCode = aValue;
	}
	public String getServicesObjectRefAxContractCode(){
		return servicesObjectRefAxContractCode;
	}

	public void setServicesObjectRefAxContractId(String aValue){
		servicesObjectRefAxContractId = aValue;
	}
	public String getServicesObjectRefAxContractId(){
		return servicesObjectRefAxContractId;
	}

	public void setServicesObjectRefAxContractCommentGen(String aValue){
		servicesObjectRefAxContractCommentGen = aValue;
	}
	public String getServicesObjectRefAxContractCommentGen(){
		return servicesObjectRefAxContractCommentGen;
	}

	public void setServicesObjectRefProjAgreeSumma(BigDecimal aValue){
		servicesObjectRefProjAgreeSumma = aValue;
	}
	public BigDecimal getServicesObjectRefProjAgreeSumma(){
		return servicesObjectRefProjAgreeSumma;
	}

	public void setServicesObjectRefTopographySumma(BigDecimal aValue){
		servicesObjectRefTopographySumma = aValue;
	}
	public BigDecimal getServicesObjectRefTopographySumma(){
		return servicesObjectRefTopographySumma;
	}

	public void setServicesObjectRefCreatedFromSite(int aValue){
		servicesObjectRefCreatedFromSite = aValue;
	}
	public int getServicesObjectRefCreatedFromSite(){
		return servicesObjectRefCreatedFromSite;
	}

	public void setServicesObjectRefTerm(int aValue){
		servicesObjectRefTerm = aValue;
	}
	public int getServicesObjectRefTerm(){
		return servicesObjectRefTerm;
	}

	public void setServicesObjectRefRegulation(int aValue){
		servicesObjectRefRegulation = aValue;
	}
	public int getServicesObjectRefRegulation(){
		return servicesObjectRefRegulation;
	}

	public void setServicesObjectRefBoundaryDateWork(Date aValue){
		servicesObjectRefBoundaryDateWork = aValue;
	}
	public Date getServicesObjectRefBoundaryDateWork(){
		return servicesObjectRefBoundaryDateWork;
	}

	public void setServicesObjectRefCountDayDelay(int aValue){
		servicesObjectRefCountDayDelay = aValue;
	}
	public int getServicesObjectRefCountDayDelay(){
		return servicesObjectRefCountDayDelay;
	}

	public void setServicesObjectRefFactDateWork(Date aValue){
		servicesObjectRefFactDateWork = aValue;
	}
	public Date getServicesObjectRefFactDateWork(){
		return servicesObjectRefFactDateWork;
	}

	public void setServicesObjectRefCodeEIC(String aValue){
		servicesObjectRefCodeEIC = aValue;
	}
	public String getServicesObjectRefCodeEIC(){
		return servicesObjectRefCodeEIC;
	}

	public void setServicesObjectRefPersonalAccountUid(String aValue){
		servicesObjectRefPersonalAccountUid = aValue;
	}
	public String getServicesObjectRefPersonalAccountUid(){
		return servicesObjectRefPersonalAccountUid;
	}

	public void setPlanRefCode(int aValue){
		planRefCode = aValue;
	}
	public int getPlanRefCode(){
		return planRefCode;
	}

	public void setPlanRefDateGen(Date aValue){
		planRefDateGen = aValue;
	}
	public Date getPlanRefDateGen(){
		return planRefDateGen;
	}

	public void setPlanRefDateStart(Date aValue){
		planRefDateStart = aValue;
	}
	public Date getPlanRefDateStart(){
		return planRefDateStart;
	}

	public void setPlanRefDateFinal(Date aValue){
		planRefDateFinal = aValue;
	}
	public Date getPlanRefDateFinal(){
		return planRefDateFinal;
	}

	public void setPlanRefYearGen(int aValue){
		planRefYearGen = aValue;
	}
	public int getPlanRefYearGen(){
		return planRefYearGen;
	}

	public void setPlanRefMonthGen(int aValue){
		planRefMonthGen = aValue;
	}
	public int getPlanRefMonthGen(){
		return planRefMonthGen;
	}

	public void setPlanRefYearOriginal(int aValue){
		planRefYearOriginal = aValue;
	}
	public int getPlanRefYearOriginal(){
		return planRefYearOriginal;
	}

	public void setPlanRefMonthOriginal(int aValue){
		planRefMonthOriginal = aValue;
	}
	public int getPlanRefMonthOriginal(){
		return planRefMonthOriginal;
	}

	public void setPlanRefUserGen(String aValue){
		planRefUserGen = aValue;
	}
	public String getPlanRefUserGen(){
		return planRefUserGen;
	}

	public void setPlanRefDateEdit(Date aValue){
		planRefDateEdit = aValue;
	}
	public Date getPlanRefDateEdit(){
		return planRefDateEdit;
	}

	public void setPlanRefWorkOrderNumber(String aValue){
		planRefWorkOrderNumber = aValue;
	}
	public String getPlanRefWorkOrderNumber(){
		return planRefWorkOrderNumber;
	}

	public void setPlanRefDateWorkOrder(Date aValue){
		planRefDateWorkOrder = aValue;
	}
	public Date getPlanRefDateWorkOrder(){
		return planRefDateWorkOrder;
	}

	public void setPlanRefPriConnectionNumber(String aValue){
		planRefPriConnectionNumber = aValue;
	}
	public String getPlanRefPriConnectionNumber(){
		return planRefPriConnectionNumber;
	}

	public void setPlanRefDateEndPriConnection(Date aValue){
		planRefDateEndPriConnection = aValue;
	}
	public Date getPlanRefDateEndPriConnection(){
		return planRefDateEndPriConnection;
	}

	public void setPlanRefInvestWorksDescription(String aValue){
		planRefInvestWorksDescription = aValue;
	}
	public String getPlanRefInvestWorksDescription(){
		return planRefInvestWorksDescription;
	}

	public void setPlanRefServicesFSideFinId(int aValue){
		planRefServicesFSideFinId = aValue;
	}
	public int getPlanRefServicesFSideFinId(){
		return planRefServicesFSideFinId;
	}

	public void setPlanRefServicesFSideCnNum(String aValue){
		planRefServicesFSideCnNum = aValue;
	}
	public String getPlanRefServicesFSideCnNum(){
		return planRefServicesFSideCnNum;
	}

	public void setPlanRefTotalTimeHours(BigDecimal aValue){
		planRefTotalTimeHours = aValue;
	}
	public BigDecimal getPlanRefTotalTimeHours(){
		return planRefTotalTimeHours;
	}

	public void setPlanRefTotalTimeDays(BigDecimal aValue){
		planRefTotalTimeDays = aValue;
	}
	public BigDecimal getPlanRefTotalTimeDays(){
		return planRefTotalTimeDays;
	}

	public void setPlanRefInvestItemNumber(String aValue){
		planRefInvestItemNumber = aValue;
	}
	public String getPlanRefInvestItemNumber(){
		return planRefInvestItemNumber;
	}

	public String getTkClassificationTypeRefKod() {
		return tkClassificationTypeRefKod;
	}

	public void setTkClassificationTypeRefKod(String tkClassificationTypeRefKod) {
		this.tkClassificationTypeRefKod = tkClassificationTypeRefKod;
	}

	public String getTkClassificationTypeRefName() {
		return tkClassificationTypeRefName;
	}

	public void setTkClassificationTypeRefName(String tkClassificationTypeRefName) {
		this.tkClassificationTypeRefName = tkClassificationTypeRefName;
	}
	
	public String getTkClassificationTypeRefKved() {
		return tkClassificationTypeRefKved;
	}

	public void setTkClassificationTypeRefKved(String value) {
		this.tkClassificationTypeRefKved = value;
	}

}
