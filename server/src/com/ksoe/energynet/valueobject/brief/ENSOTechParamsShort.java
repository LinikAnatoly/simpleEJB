
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENSOTechParams;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENSOTechParamsShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public int closestDistance = Integer.MIN_VALUE;
	public BigDecimal substationBuildSum;
	public BigDecimal calculationSum;
	public int closestDistance2 = Integer.MIN_VALUE;
	public int infoDistance2 = Integer.MIN_VALUE;
	public String object4closestDistanceName;
	public String object4closestDistance2Name;
	public String cityTypeName;
	public String userGen;
	public int levelRefCode = Integer.MIN_VALUE;
	public String levelRefName;
	public int categoryRefCode = Integer.MIN_VALUE;
	public String categoryRefName;
	public BigDecimal categoryRefCoef;
	public int powerPointRefCode = Integer.MIN_VALUE;
	public String powerPointRefName;
	public BigDecimal powerPointRefCoef;
	public int phasityRefCode = Integer.MIN_VALUE;
	public String phasityRefName;
	public int lineTypeRefCode = Integer.MIN_VALUE;
	public String lineTypeRefName;
	public int installationTypeRefCode = Integer.MIN_VALUE;
	public String installationTypeRefName;
	public BigDecimal installationTypeRefCoef;
	public int locationTypeRefCode = Integer.MIN_VALUE;
	public String locationTypeRefName;
	public int cityTypeRefCode = Integer.MIN_VALUE;
	public String cityTypeRefName;
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


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getClosestDistance() {
		return closestDistance;
	}

	public void setClosestDistance(int closestDistance) {
		this.closestDistance = closestDistance;
	}

	public BigDecimal getSubstationBuildSum() {
		return substationBuildSum;
	}

	public void setSubstationBuildSum(BigDecimal substationBuildSum) {
		this.substationBuildSum = substationBuildSum;
	}

	public BigDecimal getCalculationSum() {
		return calculationSum;
	}

	public void setCalculationSum(BigDecimal calculationSum) {
		this.calculationSum = calculationSum;
	}

	public int getClosestDistance2() {
		return closestDistance2;
	}

	public void setClosestDistance2(int closestDistance2) {
		this.closestDistance2 = closestDistance2;
	}

	public int getInfoDistance2() {
		return infoDistance2;
	}

	public void setInfoDistance2(int infoDistance2) {
		this.infoDistance2 = infoDistance2;
	}

	public String getObject4closestDistanceName() {
		return object4closestDistanceName;
	}

	public void setObject4closestDistanceName(String object4closestDistanceName) {
		this.object4closestDistanceName = object4closestDistanceName;
	}

	public String getObject4closestDistance2Name() {
		return object4closestDistance2Name;
	}

	public void setObject4closestDistance2Name(String object4closestDistance2Name) {
		this.object4closestDistance2Name = object4closestDistance2Name;
	}

	public String getCityTypeName() {
		return cityTypeName;
	}

	public void setCityTypeName(String cityTypeName) {
		this.cityTypeName = cityTypeName;
	}

	public String getUserGen() {
		return userGen;
	}

	public void setUserGen(String userGen) {
		this.userGen = userGen;
	}



	public int getLevelRefCode(){
		return levelRefCode;
	}

	public void setLevelRefCode(int levelRefCode) {
		this.levelRefCode = levelRefCode;
	}

	public String getLevelRefName(){
		return levelRefName;
	}

	public void setLevelRefName(String levelRefName) {
		this.levelRefName = levelRefName;
	}

	public int getCategoryRefCode(){
		return categoryRefCode;
	}

	public void setCategoryRefCode(int categoryRefCode) {
		this.categoryRefCode = categoryRefCode;
	}

	public String getCategoryRefName(){
		return categoryRefName;
	}

	public void setCategoryRefName(String categoryRefName) {
		this.categoryRefName = categoryRefName;
	}

	public BigDecimal getCategoryRefCoef(){
		return categoryRefCoef;
	}

	public void setCategoryRefCoef(BigDecimal categoryRefCoef) {
		this.categoryRefCoef = categoryRefCoef;
	}

	public int getPowerPointRefCode(){
		return powerPointRefCode;
	}

	public void setPowerPointRefCode(int powerPointRefCode) {
		this.powerPointRefCode = powerPointRefCode;
	}

	public String getPowerPointRefName(){
		return powerPointRefName;
	}

	public void setPowerPointRefName(String powerPointRefName) {
		this.powerPointRefName = powerPointRefName;
	}

	public BigDecimal getPowerPointRefCoef(){
		return powerPointRefCoef;
	}

	public void setPowerPointRefCoef(BigDecimal powerPointRefCoef) {
		this.powerPointRefCoef = powerPointRefCoef;
	}

	public int getPhasityRefCode(){
		return phasityRefCode;
	}

	public void setPhasityRefCode(int phasityRefCode) {
		this.phasityRefCode = phasityRefCode;
	}

	public String getPhasityRefName(){
		return phasityRefName;
	}

	public void setPhasityRefName(String phasityRefName) {
		this.phasityRefName = phasityRefName;
	}

	public int getLineTypeRefCode(){
		return lineTypeRefCode;
	}

	public void setLineTypeRefCode(int lineTypeRefCode) {
		this.lineTypeRefCode = lineTypeRefCode;
	}

	public String getLineTypeRefName(){
		return lineTypeRefName;
	}

	public void setLineTypeRefName(String lineTypeRefName) {
		this.lineTypeRefName = lineTypeRefName;
	}

	public int getInstallationTypeRefCode(){
		return installationTypeRefCode;
	}

	public void setInstallationTypeRefCode(int installationTypeRefCode) {
		this.installationTypeRefCode = installationTypeRefCode;
	}

	public String getInstallationTypeRefName(){
		return installationTypeRefName;
	}

	public void setInstallationTypeRefName(String installationTypeRefName) {
		this.installationTypeRefName = installationTypeRefName;
	}

	public BigDecimal getInstallationTypeRefCoef(){
		return installationTypeRefCoef;
	}

	public void setInstallationTypeRefCoef(BigDecimal installationTypeRefCoef) {
		this.installationTypeRefCoef = installationTypeRefCoef;
	}

	public int getLocationTypeRefCode(){
		return locationTypeRefCode;
	}

	public void setLocationTypeRefCode(int locationTypeRefCode) {
		this.locationTypeRefCode = locationTypeRefCode;
	}

	public String getLocationTypeRefName(){
		return locationTypeRefName;
	}

	public void setLocationTypeRefName(String locationTypeRefName) {
		this.locationTypeRefName = locationTypeRefName;
	}

	public int getCityTypeRefCode(){
		return cityTypeRefCode;
	}

	public void setCityTypeRefCode(int cityTypeRefCode) {
		this.cityTypeRefCode = cityTypeRefCode;
	}

	public String getCityTypeRefName(){
		return cityTypeRefName;
	}

	public void setCityTypeRefName(String cityTypeRefName) {
		this.cityTypeRefName = cityTypeRefName;
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



}
