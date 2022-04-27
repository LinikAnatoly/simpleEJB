
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENWorkOrderBytItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENWorkOrderBytItemShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String contractNumberServices;
	public String accountNumber;
	public String name;
	public String customerName;
	public String address;
	public String invNumber;
	public String serialNumber;
	public String seal;
	public String phone;
	public int statuscode = Integer.MIN_VALUE;
	public int rpCode = Integer.MIN_VALUE;
	public Date dateCounterInst ;
	public Date dateCounterCheck ;
	public String counterType;
	public BigDecimal classAccuracy;
	public BigDecimal checkperiod;
	public int rpStatusCode = Integer.MIN_VALUE;
	public BigDecimal phasity;
	public Date datecheck ;
	public BigDecimal checkperiod1;
	public String placecounter;
	public int rpIsWorking = Integer.MIN_VALUE;
	public String recordPointName;
	public String routeBytName;
	public String routeBytNumbergen;
	public String commentGen;
	public Date dateAdd ;
	public Date dateEdit ;
	public String userAdd;
	public String userEdit;
	public int factCode = Integer.MIN_VALUE;
	public int counterCapacity = Integer.MIN_VALUE;
	public BigDecimal counterVoltageNominal;
	public Date counterDateProduct ;
	public int workOrderBytRefCode = Integer.MIN_VALUE;
	public String workOrderBytRefNumberGen;
	public Date workOrderBytRefDateGen;
	public String workOrderBytRefCommentGen;
	public Date workOrderBytRefDateAdd;
	public Date workOrderBytRefDateEdit;
	public String workOrderBytRefUserAdd;
	public String workOrderBytRefUserEdit;
	public int humenItemRefCode = Integer.MIN_VALUE;
	public BigDecimal humenItemRefCountGen;
	public BigDecimal humenItemRefCountFact;
	public BigDecimal humenItemRefCountFactOriginal;
	public BigDecimal humenItemRefPrice;
	public BigDecimal humenItemRefCost;
	public String humenItemRefUserGen;
	public Date humenItemRefDateEdit;
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
	public int planItemRefCode = Integer.MIN_VALUE;
	public BigDecimal planItemRefCountGen;
	public BigDecimal planItemRefTimeGen;
	public BigDecimal planItemRefCostGen;
	public String planItemRefUserGen;
	public Date planItemRefDateEdit;
	public int finWorkerCode = Integer.MIN_VALUE;
	public String finWorkerName;
	public String finWorkerTabNumber;
	public String finWorkerPositionName;
	public int finWorkerPositionCode = Integer.MIN_VALUE;
	public String finWorkerDepartmentName;
	public String finWorkerDepartmentCode;
	public BigDecimal finWorkerPriceGen;
	public int finWorkerCategor = Integer.MIN_VALUE;
	public int finWorkerFinCode = Integer.MIN_VALUE;
	public int finWorkerIsSentAssignment = Integer.MIN_VALUE;
	public BigDecimal finWorkerChargePercent;
	public int finWorkerCategorId = Integer.MIN_VALUE;
	public String finWorkerCategorName;
	public String finWorkerWorkTimeId;
	public String finWorkerPositionId;
	public int recordPointBytRefCode = Integer.MIN_VALUE;
	public String recordPointBytRefAccountNumber;
	public Date recordPointBytRefContractDate;
	public String recordPointBytRefName;
	public String recordPointBytRefAddress;
	public int recordPointBytRefRpCode = Integer.MIN_VALUE;
	public String recordPointBytRefInvNumber;
	public String recordPointBytRefSerialNumber;
	public Date recordPointBytRefDateCounterInst;
	public Date recordPointBytRefDateCounterCheck;
	public String recordPointBytRefCounterType;
	public BigDecimal recordPointBytRefClassAccuracy;
	public BigDecimal recordPointBytRefCheckperiod;
	public int recordPointBytRefStatuscode = Integer.MIN_VALUE;
	public BigDecimal recordPointBytRefPhasity;
	public Date recordPointBytRefDatecheck;
	public BigDecimal recordPointBytRefCheckperiod1;
	public String recordPointBytRefPhone;
	public String recordPointBytRefSeal;
	public String recordPointBytRefPlacecounter;
	public int recordPointBytRefIsworking = Integer.MIN_VALUE;
	public int recordPointBytRefCounterCapacity = Integer.MIN_VALUE;
	public BigDecimal recordPointBytRefCounterVoltageNominal;
	public Date recordPointBytRefCounterDateProduct;
	public int recordPointPromRefCode = Integer.MIN_VALUE;
	public String recordPointPromRefAccountNumber;
	public String recordPointPromRefAccountName;
	public String recordPointPromRefCounterNumber;
	public String recordPointPromRefRecordPointName;
	public String recordPointPromRefRecordPointAddr;
	public String recordPointPromRefRecordPointKindName;
	public int recordPointPromRefRecordPointCode = Integer.MIN_VALUE;
	public String recordPointPromRefFeeder;
	public String recordPointPromRefSubstation;
	public String recordPointPromRefInvNumber;
	public int recordPointPromRefDayofcalculation = Integer.MIN_VALUE;
	public String recordPointPromRefInspector;
	public Date recordPointPromRefDatecontrol;
	public Date recordPointPromRefDatetp;
	public Date recordPointPromRefDateCounterInst;
	public Date recordPointPromRefDateCounterCheck;
	public String recordPointPromRefCounterType;
	public BigDecimal recordPointPromRefClassAccuracy;
	public BigDecimal recordPointPromRefCheckperiod;
	public int recordPointPromRefStatuscode = Integer.MIN_VALUE;
	public BigDecimal recordPointPromRefPhasity;
	public String recordPointPromRefPhone;
	public String recordPointPromRefSeal;
	public String recordPointPromRefPlacecounter;
	public int recordPointPromRefIsworking = Integer.MIN_VALUE;
	public int recordPointPromRefCounterCapacity = Integer.MIN_VALUE;
	public BigDecimal recordPointPromRefCounterVoltageNominal;
	public Date recordPointPromRefCounterDateProduct;
	public int routeBytRefCode = Integer.MIN_VALUE;
	public String routeBytRefName;
	public String routeBytRefNumbergen;
	public int routeBytRefRouteCode = Integer.MIN_VALUE;
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
	public int scCounterRefCode = Integer.MIN_VALUE;
	public String scCounterRefInvNumber;
	public String scCounterRefName;
	public String scCounterRefBuildNumber;
	public String scCounterRefAccount;
	public String scCounterRefDepartmetFKCode;
	public String scCounterRefMolCode;
	public Date scCounterRefDateIn;
	public Date scCounterRefDateBuild;
	public Date scCounterRefDateCheck;
	public BigDecimal scCounterRefCost;
	public int scCounterRefScCode = Integer.MIN_VALUE;
	public String scCounterRefCounterType;
	public String scCounterRefInstallOrderNumber;
	public String scCounterRefReading;
	public Date scCounterRefDateEdit;
	public int scCounterRefIsliquid = Integer.MIN_VALUE;
	public BigDecimal scCounterRefCostOld;
	public String smsInformTime;

	/////
    public int kartaRefCode = Integer.MIN_VALUE;
    public String kartaRefName;
    public String kartaRefNum;
    public int positionCode = Integer.MIN_VALUE;
    public String positionName;

    public int planRefTypeCode = Integer.MIN_VALUE;
    public String planRefTypeName;
    public int planRefStateCode = Integer.MIN_VALUE;

    public int replaceCounterServices = Integer.MIN_VALUE;

    /** SUPP-100160. Дата створення місячного плану */
    public Date monthPlanDateGen;
    /** SUPP-100160. Попередній рік та місяць плану */
    public String previousPeriod;
    /////

    public int getPlanRefTypeCode() {
		return planRefTypeCode;
	}

	public void setPlanRefTypeCode(int planRefTypeCode) {
		this.planRefTypeCode = planRefTypeCode;
	}

	public String getPlanRefTypeName() {
		return planRefTypeName;
	}

	public void setPlanRefTypeName(String planRefTypeName) {
		this.planRefTypeName = planRefTypeName;
	}

	public int getPlanRefStateCode() {
		return planRefStateCode;
	}

	public void setPlanRefStateCode(int planRefStateCode) {
		this.planRefStateCode = planRefStateCode;
	}

	public int getKartaRefCode() {
		return kartaRefCode;
	}

	public void setKartaRefCode(int kartaRefCode) {
		this.kartaRefCode = kartaRefCode;
	}

	public String getKartaRefName() {
		return kartaRefName;
	}

	public void setKartaRefName(String kartaRefName) {
		this.kartaRefName = kartaRefName;
	}

	public String getKartaRefNum() {
		return kartaRefNum;
	}

	public void setKartaRefNum(String kartaRefNum) {
		this.kartaRefNum = kartaRefNum;
	}

	public int getPositionCode() {
		return positionCode;
	}

	public void setPositionCode(int positionCode) {
		this.positionCode = positionCode;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setContractNumberServices(String aValue){
		contractNumberServices = aValue;
	}

	public String getContractNumberServices(){
		return contractNumberServices;
	}

	public void setAccountNumber(String aValue){
		accountNumber = aValue;
	}

	public String getAccountNumber(){
		return accountNumber;
	}

	public void setName(String aValue){
		name = aValue;
	}

	public String getName(){
		return name;
	}

	public void setCustomerName(String aValue){
		customerName = aValue;
	}

	public String getCustomerName(){
		return customerName;
	}

	public void setAddress(String aValue){
		address = aValue;
	}

	public String getAddress(){
		return address;
	}

	public void setInvNumber(String aValue){
		invNumber = aValue;
	}

	public String getInvNumber(){
		return invNumber;
	}

	public void setSerialNumber(String aValue){
		serialNumber = aValue;
	}

	public String getSerialNumber(){
		return serialNumber;
	}

	public void setSeal(String aValue){
		seal = aValue;
	}

	public String getSeal(){
		return seal;
	}

	public void setPhone(String aValue){
		phone = aValue;
	}

	public String getPhone(){
		return phone;
	}

	public void setStatuscode(int aValue){
		statuscode = aValue;
	}

	public int getStatuscode(){
		return statuscode;
	}

	public void setRpCode(int aValue){
		rpCode = aValue;
	}

	public int getRpCode(){
		return rpCode;
	}

	public void setDateCounterInst(Date aValue){
		dateCounterInst = aValue;
	}

	public Date getDateCounterInst(){
		return dateCounterInst;
	}

	public void setDateCounterCheck(Date aValue){
		dateCounterCheck = aValue;
	}

	public Date getDateCounterCheck(){
		return dateCounterCheck;
	}

	public void setCounterType(String aValue){
		counterType = aValue;
	}

	public String getCounterType(){
		return counterType;
	}

	public void setClassAccuracy(BigDecimal aValue){
		classAccuracy = aValue;
	}

	public BigDecimal getClassAccuracy(){
		return classAccuracy;
	}

	public void setCheckperiod(BigDecimal aValue){
		checkperiod = aValue;
	}

	public BigDecimal getCheckperiod(){
		return checkperiod;
	}

	public void setRpStatusCode(int aValue){
		rpStatusCode = aValue;
	}

	public int getRpStatusCode(){
		return rpStatusCode;
	}

	public void setPhasity(BigDecimal aValue){
		phasity = aValue;
	}

	public BigDecimal getPhasity(){
		return phasity;
	}

	public void setDatecheck(Date aValue){
		datecheck = aValue;
	}

	public Date getDatecheck(){
		return datecheck;
	}

	public void setCheckperiod1(BigDecimal aValue){
		checkperiod1 = aValue;
	}

	public BigDecimal getCheckperiod1(){
		return checkperiod1;
	}

	public void setPlacecounter(String aValue){
		placecounter = aValue;
	}

	public String getPlacecounter(){
		return placecounter;
	}

	public void setRpIsWorking(int aValue){
		rpIsWorking = aValue;
	}

	public int getRpIsWorking(){
		return rpIsWorking;
	}

	public void setRecordPointName(String aValue){
		recordPointName = aValue;
	}

	public String getRecordPointName(){
		return recordPointName;
	}

	public void setRouteBytName(String aValue){
		routeBytName = aValue;
	}

	public String getRouteBytName(){
		return routeBytName;
	}

	public void setRouteBytNumbergen(String aValue){
		routeBytNumbergen = aValue;
	}

	public String getRouteBytNumbergen(){
		return routeBytNumbergen;
	}

	public void setCommentGen(String aValue){
		commentGen = aValue;
	}

	public String getCommentGen(){
		return commentGen;
	}

	public void setDateAdd(Date aValue){
		dateAdd = aValue;
	}

	public Date getDateAdd(){
		return dateAdd;
	}

	public void setDateEdit(Date aValue){
		dateEdit = aValue;
	}

	public Date getDateEdit(){
		return dateEdit;
	}

	public void setUserAdd(String aValue){
		userAdd = aValue;
	}

	public String getUserAdd(){
		return userAdd;
	}

	public void setUserEdit(String aValue){
		userEdit = aValue;
	}

	public String getUserEdit(){
		return userEdit;
	}


	public void setFactCode(int aValue){
		factCode = aValue;
	}

	public int getFactCode(){
		return factCode;
	}

	public void setCounterCapacity(int aValue){
		counterCapacity = aValue;
	}

	public int getCounterCapacity(){
		return counterCapacity;
	}

	public void setCounterVoltageNominal(BigDecimal aValue){
		counterVoltageNominal = aValue;
	}

	public BigDecimal getCounterVoltageNominal(){
		return counterVoltageNominal;
	}

	public void setCounterDateProduct(Date aValue){
		counterDateProduct = aValue;
	}

	public Date getCounterDateProduct(){
		return counterDateProduct;
	}


	public void setWorkOrderBytRefCode(int aValue){
		workOrderBytRefCode = aValue;
	}
	public int getWorkOrderBytRefCode(){
		return workOrderBytRefCode;
	}

	public void setWorkOrderBytRefNumberGen(String aValue){
		workOrderBytRefNumberGen = aValue;
	}
	public String getWorkOrderBytRefNumberGen(){
		return workOrderBytRefNumberGen;
	}

	public void setWorkOrderBytRefDateGen(Date aValue){
		workOrderBytRefDateGen = aValue;
	}
	public Date getWorkOrderBytRefDateGen(){
		return workOrderBytRefDateGen;
	}

	public void setWorkOrderBytRefCommentGen(String aValue){
		workOrderBytRefCommentGen = aValue;
	}
	public String getWorkOrderBytRefCommentGen(){
		return workOrderBytRefCommentGen;
	}

	public void setWorkOrderBytRefDateAdd(Date aValue){
		workOrderBytRefDateAdd = aValue;
	}
	public Date getWorkOrderBytRefDateAdd(){
		return workOrderBytRefDateAdd;
	}

	public void setWorkOrderBytRefDateEdit(Date aValue){
		workOrderBytRefDateEdit = aValue;
	}
	public Date getWorkOrderBytRefDateEdit(){
		return workOrderBytRefDateEdit;
	}

	public void setWorkOrderBytRefUserAdd(String aValue){
		workOrderBytRefUserAdd = aValue;
	}
	public String getWorkOrderBytRefUserAdd(){
		return workOrderBytRefUserAdd;
	}

	public void setWorkOrderBytRefUserEdit(String aValue){
		workOrderBytRefUserEdit = aValue;
	}
	public String getWorkOrderBytRefUserEdit(){
		return workOrderBytRefUserEdit;
	}

	public void setHumenItemRefCode(int aValue){
		humenItemRefCode = aValue;
	}
	public int getHumenItemRefCode(){
		return humenItemRefCode;
	}

	public void setHumenItemRefCountGen(BigDecimal aValue){
		humenItemRefCountGen = aValue;
	}
	public BigDecimal getHumenItemRefCountGen(){
		return humenItemRefCountGen;
	}

	public void setHumenItemRefCountFact(BigDecimal aValue){
		humenItemRefCountFact = aValue;
	}
	public BigDecimal getHumenItemRefCountFact(){
		return humenItemRefCountFact;
	}

	public void setHumenItemRefCountFactOriginal(BigDecimal aValue){
		humenItemRefCountFactOriginal = aValue;
	}
	public BigDecimal getHumenItemRefCountFactOriginal(){
		return humenItemRefCountFactOriginal;
	}

	public void setHumenItemRefPrice(BigDecimal aValue){
		humenItemRefPrice = aValue;
	}
	public BigDecimal getHumenItemRefPrice(){
		return humenItemRefPrice;
	}

	public void setHumenItemRefCost(BigDecimal aValue){
		humenItemRefCost = aValue;
	}
	public BigDecimal getHumenItemRefCost(){
		return humenItemRefCost;
	}

	public void setHumenItemRefUserGen(String aValue){
		humenItemRefUserGen = aValue;
	}
	public String getHumenItemRefUserGen(){
		return humenItemRefUserGen;
	}

	public void setHumenItemRefDateEdit(Date aValue){
		humenItemRefDateEdit = aValue;
	}
	public Date getHumenItemRefDateEdit(){
		return humenItemRefDateEdit;
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

	public void setPlanItemRefCode(int aValue){
		planItemRefCode = aValue;
	}
	public int getPlanItemRefCode(){
		return planItemRefCode;
	}

	public void setPlanItemRefCountGen(BigDecimal aValue){
		planItemRefCountGen = aValue;
	}
	public BigDecimal getPlanItemRefCountGen(){
		return planItemRefCountGen;
	}

	public void setPlanItemRefTimeGen(BigDecimal aValue){
		planItemRefTimeGen = aValue;
	}
	public BigDecimal getPlanItemRefTimeGen(){
		return planItemRefTimeGen;
	}

	public void setPlanItemRefCostGen(BigDecimal aValue){
		planItemRefCostGen = aValue;
	}
	public BigDecimal getPlanItemRefCostGen(){
		return planItemRefCostGen;
	}

	public void setPlanItemRefUserGen(String aValue){
		planItemRefUserGen = aValue;
	}
	public String getPlanItemRefUserGen(){
		return planItemRefUserGen;
	}

	public void setPlanItemRefDateEdit(Date aValue){
		planItemRefDateEdit = aValue;
	}
	public Date getPlanItemRefDateEdit(){
		return planItemRefDateEdit;
	}

	public void setFinWorkerCode(int aValue){
		finWorkerCode = aValue;
	}
	public int getFinWorkerCode(){
		return finWorkerCode;
	}

	public void setFinWorkerName(String aValue){
		finWorkerName = aValue;
	}
	public String getFinWorkerName(){
		return finWorkerName;
	}

	public void setFinWorkerTabNumber(String aValue){
		finWorkerTabNumber = aValue;
	}
	public String getFinWorkerTabNumber(){
		return finWorkerTabNumber;
	}

	public void setFinWorkerPositionName(String aValue){
		finWorkerPositionName = aValue;
	}
	public String getFinWorkerPositionName(){
		return finWorkerPositionName;
	}

	public void setFinWorkerPositionCode(int aValue){
		finWorkerPositionCode = aValue;
	}
	public int getFinWorkerPositionCode(){
		return finWorkerPositionCode;
	}

	public void setFinWorkerDepartmentName(String aValue){
		finWorkerDepartmentName = aValue;
	}
	public String getFinWorkerDepartmentName(){
		return finWorkerDepartmentName;
	}

	public void setFinWorkerDepartmentCode(String aValue){
		finWorkerDepartmentCode = aValue;
	}
	public String getFinWorkerDepartmentCode(){
		return finWorkerDepartmentCode;
	}

	public void setFinWorkerPriceGen(BigDecimal aValue){
		finWorkerPriceGen = aValue;
	}
	public BigDecimal getFinWorkerPriceGen(){
		return finWorkerPriceGen;
	}

	public void setFinWorkerCategor(int aValue){
		finWorkerCategor = aValue;
	}
	public int getFinWorkerCategor(){
		return finWorkerCategor;
	}

	public void setFinWorkerFinCode(int aValue){
		finWorkerFinCode = aValue;
	}
	public int getFinWorkerFinCode(){
		return finWorkerFinCode;
	}

	public void setFinWorkerIsSentAssignment(int aValue){
		finWorkerIsSentAssignment = aValue;
	}
	public int getFinWorkerIsSentAssignment(){
		return finWorkerIsSentAssignment;
	}

	public void setFinWorkerChargePercent(BigDecimal aValue){
		finWorkerChargePercent = aValue;
	}
	public BigDecimal getFinWorkerChargePercent(){
		return finWorkerChargePercent;
	}

	public void setFinWorkerCategorId(int aValue){
		finWorkerCategorId = aValue;
	}
	public int getFinWorkerCategorId(){
		return finWorkerCategorId;
	}

	public void setFinWorkerCategorName(String aValue){
		finWorkerCategorName = aValue;
	}
	public String getFinWorkerCategorName(){
		return finWorkerCategorName;
	}

	public void setFinWorkerWorkTimeId(String aValue){
		finWorkerWorkTimeId = aValue;
	}
	public String getFinWorkerWorkTimeId(){
		return finWorkerWorkTimeId;
	}

	public void setFinWorkerPositionId(String aValue){
		finWorkerPositionId = aValue;
	}
	public String getFinWorkerPositionId(){
		return finWorkerPositionId;
	}

	public void setRecordPointBytRefCode(int aValue){
		recordPointBytRefCode = aValue;
	}
	public int getRecordPointBytRefCode(){
		return recordPointBytRefCode;
	}

	public void setRecordPointBytRefAccountNumber(String aValue){
		recordPointBytRefAccountNumber = aValue;
	}
	public String getRecordPointBytRefAccountNumber(){
		return recordPointBytRefAccountNumber;
	}

	public void setRecordPointBytRefContractDate(Date aValue){
		recordPointBytRefContractDate = aValue;
	}
	public Date getRecordPointBytRefContractDate(){
		return recordPointBytRefContractDate;
	}

	public void setRecordPointBytRefName(String aValue){
		recordPointBytRefName = aValue;
	}
	public String getRecordPointBytRefName(){
		return recordPointBytRefName;
	}

	public void setRecordPointBytRefAddress(String aValue){
		recordPointBytRefAddress = aValue;
	}
	public String getRecordPointBytRefAddress(){
		return recordPointBytRefAddress;
	}

	public void setRecordPointBytRefRpCode(int aValue){
		recordPointBytRefRpCode = aValue;
	}
	public int getRecordPointBytRefRpCode(){
		return recordPointBytRefRpCode;
	}

	public void setRecordPointBytRefInvNumber(String aValue){
		recordPointBytRefInvNumber = aValue;
	}
	public String getRecordPointBytRefInvNumber(){
		return recordPointBytRefInvNumber;
	}

	public void setRecordPointBytRefSerialNumber(String aValue){
		recordPointBytRefSerialNumber = aValue;
	}
	public String getRecordPointBytRefSerialNumber(){
		return recordPointBytRefSerialNumber;
	}

	public void setRecordPointBytRefDateCounterInst(Date aValue){
		recordPointBytRefDateCounterInst = aValue;
	}
	public Date getRecordPointBytRefDateCounterInst(){
		return recordPointBytRefDateCounterInst;
	}

	public void setRecordPointBytRefDateCounterCheck(Date aValue){
		recordPointBytRefDateCounterCheck = aValue;
	}
	public Date getRecordPointBytRefDateCounterCheck(){
		return recordPointBytRefDateCounterCheck;
	}

	public void setRecordPointBytRefCounterType(String aValue){
		recordPointBytRefCounterType = aValue;
	}
	public String getRecordPointBytRefCounterType(){
		return recordPointBytRefCounterType;
	}

	public void setRecordPointBytRefClassAccuracy(BigDecimal aValue){
		recordPointBytRefClassAccuracy = aValue;
	}
	public BigDecimal getRecordPointBytRefClassAccuracy(){
		return recordPointBytRefClassAccuracy;
	}

	public void setRecordPointBytRefCheckperiod(BigDecimal aValue){
		recordPointBytRefCheckperiod = aValue;
	}
	public BigDecimal getRecordPointBytRefCheckperiod(){
		return recordPointBytRefCheckperiod;
	}

	public void setRecordPointBytRefStatuscode(int aValue){
		recordPointBytRefStatuscode = aValue;
	}
	public int getRecordPointBytRefStatuscode(){
		return recordPointBytRefStatuscode;
	}

	public void setRecordPointBytRefPhasity(BigDecimal aValue){
		recordPointBytRefPhasity = aValue;
	}
	public BigDecimal getRecordPointBytRefPhasity(){
		return recordPointBytRefPhasity;
	}

	public void setRecordPointBytRefDatecheck(Date aValue){
		recordPointBytRefDatecheck = aValue;
	}
	public Date getRecordPointBytRefDatecheck(){
		return recordPointBytRefDatecheck;
	}

	public void setRecordPointBytRefCheckperiod1(BigDecimal aValue){
		recordPointBytRefCheckperiod1 = aValue;
	}
	public BigDecimal getRecordPointBytRefCheckperiod1(){
		return recordPointBytRefCheckperiod1;
	}

	public void setRecordPointBytRefPhone(String aValue){
		recordPointBytRefPhone = aValue;
	}
	public String getRecordPointBytRefPhone(){
		return recordPointBytRefPhone;
	}

	public void setRecordPointBytRefSeal(String aValue){
		recordPointBytRefSeal = aValue;
	}
	public String getRecordPointBytRefSeal(){
		return recordPointBytRefSeal;
	}

	public void setRecordPointBytRefPlacecounter(String aValue){
		recordPointBytRefPlacecounter = aValue;
	}
	public String getRecordPointBytRefPlacecounter(){
		return recordPointBytRefPlacecounter;
	}

	public void setRecordPointBytRefIsworking(int aValue){
		recordPointBytRefIsworking = aValue;
	}
	public int getRecordPointBytRefIsworking(){
		return recordPointBytRefIsworking;
	}

	public void setRecordPointBytRefCounterCapacity(int aValue){
		recordPointBytRefCounterCapacity = aValue;
	}
	public int getRecordPointBytRefCounterCapacity(){
		return recordPointBytRefCounterCapacity;
	}

	public void setRecordPointBytRefCounterVoltageNominal(BigDecimal aValue){
		recordPointBytRefCounterVoltageNominal = aValue;
	}
	public BigDecimal getRecordPointBytRefCounterVoltageNominal(){
		return recordPointBytRefCounterVoltageNominal;
	}

	public void setRecordPointBytRefCounterDateProduct(Date aValue){
		recordPointBytRefCounterDateProduct = aValue;
	}
	public Date getRecordPointBytRefCounterDateProduct(){
		return recordPointBytRefCounterDateProduct;
	}

	public void setRecordPointPromRefCode(int aValue){
		recordPointPromRefCode = aValue;
	}
	public int getRecordPointPromRefCode(){
		return recordPointPromRefCode;
	}

	public void setRecordPointPromRefAccountNumber(String aValue){
		recordPointPromRefAccountNumber = aValue;
	}
	public String getRecordPointPromRefAccountNumber(){
		return recordPointPromRefAccountNumber;
	}

	public void setRecordPointPromRefAccountName(String aValue){
		recordPointPromRefAccountName = aValue;
	}
	public String getRecordPointPromRefAccountName(){
		return recordPointPromRefAccountName;
	}

	public void setRecordPointPromRefCounterNumber(String aValue){
		recordPointPromRefCounterNumber = aValue;
	}
	public String getRecordPointPromRefCounterNumber(){
		return recordPointPromRefCounterNumber;
	}

	public void setRecordPointPromRefRecordPointName(String aValue){
		recordPointPromRefRecordPointName = aValue;
	}
	public String getRecordPointPromRefRecordPointName(){
		return recordPointPromRefRecordPointName;
	}

	public void setRecordPointPromRefRecordPointAddr(String aValue){
		recordPointPromRefRecordPointAddr = aValue;
	}
	public String getRecordPointPromRefRecordPointAddr(){
		return recordPointPromRefRecordPointAddr;
	}

	public void setRecordPointPromRefRecordPointKindName(String aValue){
		recordPointPromRefRecordPointKindName = aValue;
	}
	public String getRecordPointPromRefRecordPointKindName(){
		return recordPointPromRefRecordPointKindName;
	}

	public void setRecordPointPromRefRecordPointCode(int aValue){
		recordPointPromRefRecordPointCode = aValue;
	}
	public int getRecordPointPromRefRecordPointCode(){
		return recordPointPromRefRecordPointCode;
	}

	public void setRecordPointPromRefFeeder(String aValue){
		recordPointPromRefFeeder = aValue;
	}
	public String getRecordPointPromRefFeeder(){
		return recordPointPromRefFeeder;
	}

	public void setRecordPointPromRefSubstation(String aValue){
		recordPointPromRefSubstation = aValue;
	}
	public String getRecordPointPromRefSubstation(){
		return recordPointPromRefSubstation;
	}

	public void setRecordPointPromRefInvNumber(String aValue){
		recordPointPromRefInvNumber = aValue;
	}
	public String getRecordPointPromRefInvNumber(){
		return recordPointPromRefInvNumber;
	}

	public void setRecordPointPromRefDayofcalculation(int aValue){
		recordPointPromRefDayofcalculation = aValue;
	}
	public int getRecordPointPromRefDayofcalculation(){
		return recordPointPromRefDayofcalculation;
	}

	public void setRecordPointPromRefInspector(String aValue){
		recordPointPromRefInspector = aValue;
	}
	public String getRecordPointPromRefInspector(){
		return recordPointPromRefInspector;
	}

	public void setRecordPointPromRefDatecontrol(Date aValue){
		recordPointPromRefDatecontrol = aValue;
	}
	public Date getRecordPointPromRefDatecontrol(){
		return recordPointPromRefDatecontrol;
	}

	public void setRecordPointPromRefDatetp(Date aValue){
		recordPointPromRefDatetp = aValue;
	}
	public Date getRecordPointPromRefDatetp(){
		return recordPointPromRefDatetp;
	}

	public void setRecordPointPromRefDateCounterInst(Date aValue){
		recordPointPromRefDateCounterInst = aValue;
	}
	public Date getRecordPointPromRefDateCounterInst(){
		return recordPointPromRefDateCounterInst;
	}

	public void setRecordPointPromRefDateCounterCheck(Date aValue){
		recordPointPromRefDateCounterCheck = aValue;
	}
	public Date getRecordPointPromRefDateCounterCheck(){
		return recordPointPromRefDateCounterCheck;
	}

	public void setRecordPointPromRefCounterType(String aValue){
		recordPointPromRefCounterType = aValue;
	}
	public String getRecordPointPromRefCounterType(){
		return recordPointPromRefCounterType;
	}

	public void setRecordPointPromRefClassAccuracy(BigDecimal aValue){
		recordPointPromRefClassAccuracy = aValue;
	}
	public BigDecimal getRecordPointPromRefClassAccuracy(){
		return recordPointPromRefClassAccuracy;
	}

	public void setRecordPointPromRefCheckperiod(BigDecimal aValue){
		recordPointPromRefCheckperiod = aValue;
	}
	public BigDecimal getRecordPointPromRefCheckperiod(){
		return recordPointPromRefCheckperiod;
	}

	public void setRecordPointPromRefStatuscode(int aValue){
		recordPointPromRefStatuscode = aValue;
	}
	public int getRecordPointPromRefStatuscode(){
		return recordPointPromRefStatuscode;
	}

	public void setRecordPointPromRefPhasity(BigDecimal aValue){
		recordPointPromRefPhasity = aValue;
	}
	public BigDecimal getRecordPointPromRefPhasity(){
		return recordPointPromRefPhasity;
	}

	public void setRecordPointPromRefPhone(String aValue){
		recordPointPromRefPhone = aValue;
	}
	public String getRecordPointPromRefPhone(){
		return recordPointPromRefPhone;
	}

	public void setRecordPointPromRefSeal(String aValue){
		recordPointPromRefSeal = aValue;
	}
	public String getRecordPointPromRefSeal(){
		return recordPointPromRefSeal;
	}

	public void setRecordPointPromRefPlacecounter(String aValue){
		recordPointPromRefPlacecounter = aValue;
	}
	public String getRecordPointPromRefPlacecounter(){
		return recordPointPromRefPlacecounter;
	}

	public void setRecordPointPromRefIsworking(int aValue){
		recordPointPromRefIsworking = aValue;
	}
	public int getRecordPointPromRefIsworking(){
		return recordPointPromRefIsworking;
	}

	public void setRecordPointPromRefCounterCapacity(int aValue){
		recordPointPromRefCounterCapacity = aValue;
	}
	public int getRecordPointPromRefCounterCapacity(){
		return recordPointPromRefCounterCapacity;
	}

	public void setRecordPointPromRefCounterVoltageNominal(BigDecimal aValue){
		recordPointPromRefCounterVoltageNominal = aValue;
	}
	public BigDecimal getRecordPointPromRefCounterVoltageNominal(){
		return recordPointPromRefCounterVoltageNominal;
	}

	public void setRecordPointPromRefCounterDateProduct(Date aValue){
		recordPointPromRefCounterDateProduct = aValue;
	}
	public Date getRecordPointPromRefCounterDateProduct(){
		return recordPointPromRefCounterDateProduct;
	}

	public void setRouteBytRefCode(int aValue){
		routeBytRefCode = aValue;
	}
	public int getRouteBytRefCode(){
		return routeBytRefCode;
	}

	public void setRouteBytRefName(String aValue){
		routeBytRefName = aValue;
	}
	public String getRouteBytRefName(){
		return routeBytRefName;
	}

	public void setRouteBytRefNumbergen(String aValue){
		routeBytRefNumbergen = aValue;
	}
	public String getRouteBytRefNumbergen(){
		return routeBytRefNumbergen;
	}

	public void setRouteBytRefRouteCode(int aValue){
		routeBytRefRouteCode = aValue;
	}
	public int getRouteBytRefRouteCode(){
		return routeBytRefRouteCode;
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

	public void setScCounterRefCode(int aValue){
		scCounterRefCode = aValue;
	}
	public int getScCounterRefCode(){
		return scCounterRefCode;
	}

	public void setScCounterRefInvNumber(String aValue){
		scCounterRefInvNumber = aValue;
	}
	public String getScCounterRefInvNumber(){
		return scCounterRefInvNumber;
	}

	public void setScCounterRefName(String aValue){
		scCounterRefName = aValue;
	}
	public String getScCounterRefName(){
		return scCounterRefName;
	}

	public void setScCounterRefBuildNumber(String aValue){
		scCounterRefBuildNumber = aValue;
	}
	public String getScCounterRefBuildNumber(){
		return scCounterRefBuildNumber;
	}

	public void setScCounterRefAccount(String aValue){
		scCounterRefAccount = aValue;
	}
	public String getScCounterRefAccount(){
		return scCounterRefAccount;
	}

	public void setScCounterRefDepartmetFKCode(String aValue){
		scCounterRefDepartmetFKCode = aValue;
	}
	public String getScCounterRefDepartmetFKCode(){
		return scCounterRefDepartmetFKCode;
	}

	public void setScCounterRefMolCode(String aValue){
		scCounterRefMolCode = aValue;
	}
	public String getScCounterRefMolCode(){
		return scCounterRefMolCode;
	}

	public void setScCounterRefDateIn(Date aValue){
		scCounterRefDateIn = aValue;
	}
	public Date getScCounterRefDateIn(){
		return scCounterRefDateIn;
	}

	public void setScCounterRefDateBuild(Date aValue){
		scCounterRefDateBuild = aValue;
	}
	public Date getScCounterRefDateBuild(){
		return scCounterRefDateBuild;
	}

	public void setScCounterRefDateCheck(Date aValue){
		scCounterRefDateCheck = aValue;
	}
	public Date getScCounterRefDateCheck(){
		return scCounterRefDateCheck;
	}

	public void setScCounterRefCost(BigDecimal aValue){
		scCounterRefCost = aValue;
	}
	public BigDecimal getScCounterRefCost(){
		return scCounterRefCost;
	}

	public void setScCounterRefScCode(int aValue){
		scCounterRefScCode = aValue;
	}
	public int getScCounterRefScCode(){
		return scCounterRefScCode;
	}

	public void setScCounterRefCounterType(String aValue){
		scCounterRefCounterType = aValue;
	}
	public String getScCounterRefCounterType(){
		return scCounterRefCounterType;
	}

	public void setScCounterRefInstallOrderNumber(String aValue){
		scCounterRefInstallOrderNumber = aValue;
	}
	public String getScCounterRefInstallOrderNumber(){
		return scCounterRefInstallOrderNumber;
	}

	public void setScCounterRefReading(String aValue){
		scCounterRefReading = aValue;
	}
	public String getScCounterRefReading(){
		return scCounterRefReading;
	}

	public void setScCounterRefDateEdit(Date aValue){
		scCounterRefDateEdit = aValue;
	}
	public Date getScCounterRefDateEdit(){
		return scCounterRefDateEdit;
	}

	public void setScCounterRefIsliquid(int aValue){
		scCounterRefIsliquid = aValue;
	}
	public int getScCounterRefIsliquid(){
		return scCounterRefIsliquid;
	}

	public int getReplaceCounterServices() {
		return replaceCounterServices;
	}

	public void setReplaceCounterServices(int replaceCounterServices) {
		this.replaceCounterServices = replaceCounterServices;
	}
	public void setScCounterRefCostOld(BigDecimal aValue){
		scCounterRefCostOld = aValue;
	}
	public BigDecimal getScCounterRefCostOld(){
		return scCounterRefCostOld;
	}

	public String getSmsInformTime() {
		return smsInformTime;
	}

	public void setSmsInformTime(String smsInformTime) {
		this.smsInformTime = smsInformTime;
	}

	public Date getMonthPlanDateGen() {
		return monthPlanDateGen;
	}

	public void setMonthPlanDateGen(Date monthPlanDateGen) {
		this.monthPlanDateGen = monthPlanDateGen;
	}

	public String getPreviousPeriod() {
		return previousPeriod;
	}

	public void setPreviousPeriod(String previousPeriod) {
		this.previousPeriod = previousPeriod;
	}

}