
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENReconstrModernOZ;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENReconstrModernOZShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String numbergen;
	public Date dateGen ;
	public Date dateEdit ;
	public BigDecimal summaGen;
	public BigDecimal summaNDS;
	public String characteristic;
	public String executedPosition;
	public String executedName;
	public String acceptedPosition;
	public String acceptedName;
	public BigDecimal contractPrice;
	public String codeMol;
	public String codePodr;
	public String invNumberOZ;
	public String nameOZ;
	public String finContractNumber;
	public Date finContractDate ;
	public String partnerName;
	public String partnerCode;
	public String characteristicOS;
	public int isInvestProgram = Integer.MIN_VALUE;
	public String yearInvestProgram;
	public String itemInvestProgram;
	public int typeRM = Integer.MIN_VALUE;
	public String userGen;
	public int termUseful = Integer.MIN_VALUE;
	public int use_limit_before = Integer.MIN_VALUE;
	public int use_limit_n_before = Integer.MIN_VALUE;
	public Date dateExploitationIn ;
	public Date dateExploitationOut ;
	public int departmentRefCode = Integer.MIN_VALUE;
	public String departmentRefShortName;
	public Date departmentRefDateStart;
	public Date departmentRefDateFinal;
	public int departmentRefRenCode = Integer.MIN_VALUE;
	public String departmentRefShpzBalans;
	public int departmentRefKau_table_id_1884 = Integer.MIN_VALUE;
	public String departmentRefKau_1884;
	public String departmentRefName_1884;
	public String departmentRefHrmorganizationid;
	public int statusRefCode = Integer.MIN_VALUE;
	public String statusRefName;
	public int typeRefCode = Integer.MIN_VALUE;
	public String typeRefName;
	public int invgroupRefCode = Integer.MIN_VALUE;
	public String invgroupRefName;
	public String invgroupRefCommentgen;
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

	public String getNumbergen() {
		return numbergen;
	}

	public void setNumbergen(String numbergen) {
		this.numbergen = numbergen;
	}

	public Date getDateGen() {
		return dateGen;
	}

	public void setDateGen(Date dateGen) {
		this.dateGen = dateGen;
	}

	public Date getDateEdit() {
		return dateEdit;
	}

	public void setDateEdit(Date dateEdit) {
		this.dateEdit = dateEdit;
	}

	public BigDecimal getSummaGen() {
		return summaGen;
	}

	public void setSummaGen(BigDecimal summaGen) {
		this.summaGen = summaGen;
	}

	public BigDecimal getSummaNDS() {
		return summaNDS;
	}

	public void setSummaNDS(BigDecimal summaNDS) {
		this.summaNDS = summaNDS;
	}

	public String getCharacteristic() {
		return characteristic;
	}

	public void setCharacteristic(String characteristic) {
		this.characteristic = characteristic;
	}

	public String getExecutedPosition() {
		return executedPosition;
	}

	public void setExecutedPosition(String executedPosition) {
		this.executedPosition = executedPosition;
	}

	public String getExecutedName() {
		return executedName;
	}

	public void setExecutedName(String executedName) {
		this.executedName = executedName;
	}

	public String getAcceptedPosition() {
		return acceptedPosition;
	}

	public void setAcceptedPosition(String acceptedPosition) {
		this.acceptedPosition = acceptedPosition;
	}

	public String getAcceptedName() {
		return acceptedName;
	}

	public void setAcceptedName(String acceptedName) {
		this.acceptedName = acceptedName;
	}

	public BigDecimal getContractPrice() {
		return contractPrice;
	}

	public void setContractPrice(BigDecimal contractPrice) {
		this.contractPrice = contractPrice;
	}

	public String getCodeMol() {
		return codeMol;
	}

	public void setCodeMol(String codeMol) {
		this.codeMol = codeMol;
	}

	public String getCodePodr() {
		return codePodr;
	}

	public void setCodePodr(String codePodr) {
		this.codePodr = codePodr;
	}

	public String getInvNumberOZ() {
		return invNumberOZ;
	}

	public void setInvNumberOZ(String invNumberOZ) {
		this.invNumberOZ = invNumberOZ;
	}

	public String getNameOZ() {
		return nameOZ;
	}

	public void setNameOZ(String nameOZ) {
		this.nameOZ = nameOZ;
	}

	public String getFinContractNumber() {
		return finContractNumber;
	}

	public void setFinContractNumber(String finContractNumber) {
		this.finContractNumber = finContractNumber;
	}

	public Date getFinContractDate() {
		return finContractDate;
	}

	public void setFinContractDate(Date finContractDate) {
		this.finContractDate = finContractDate;
	}

	public String getPartnerName() {
		return partnerName;
	}

	public void setPartnerName(String partnerName) {
		this.partnerName = partnerName;
	}

	public String getPartnerCode() {
		return partnerCode;
	}

	public void setPartnerCode(String partnerCode) {
		this.partnerCode = partnerCode;
	}

	public String getCharacteristicOS() {
		return characteristicOS;
	}

	public void setCharacteristicOS(String characteristicOS) {
		this.characteristicOS = characteristicOS;
	}

	public int getIsInvestProgram() {
		return isInvestProgram;
	}

	public void setIsInvestProgram(int isInvestProgram) {
		this.isInvestProgram = isInvestProgram;
	}

	public String getYearInvestProgram() {
		return yearInvestProgram;
	}

	public void setYearInvestProgram(String yearInvestProgram) {
		this.yearInvestProgram = yearInvestProgram;
	}

	public String getItemInvestProgram() {
		return itemInvestProgram;
	}

	public void setItemInvestProgram(String itemInvestProgram) {
		this.itemInvestProgram = itemInvestProgram;
	}

	public int getTypeRM() {
		return typeRM;
	}

	public void setTypeRM(int typeRM) {
		this.typeRM = typeRM;
	}

	public String getUserGen() {
		return userGen;
	}

	public void setUserGen(String userGen) {
		this.userGen = userGen;
	}



	public int getTermUseful() {
		return termUseful;
	}

	public void setTermUseful(int termUseful) {
		this.termUseful = termUseful;
	}

	public int getUse_limit_before() {
		return use_limit_before;
	}

	public void setUse_limit_before(int use_limit_before) {
		this.use_limit_before = use_limit_before;
	}

	public int getUse_limit_n_before() {
		return use_limit_n_before;
	}

	public void setUse_limit_n_before(int use_limit_n_before) {
		this.use_limit_n_before = use_limit_n_before;
	}

	public Date getDateExploitationIn() {
		return dateExploitationIn;
	}

	public void setDateExploitationIn(Date dateExploitationIn) {
		this.dateExploitationIn = dateExploitationIn;
	}

	public Date getDateExploitationOut() {
		return dateExploitationOut;
	}

	public void setDateExploitationOut(Date dateExploitationOut) {
		this.dateExploitationOut = dateExploitationOut;
	}


	public int getDepartmentRefCode(){
		return departmentRefCode;
	}

	public void setDepartmentRefCode(int departmentRefCode) {
		this.departmentRefCode = departmentRefCode;
	}

	public String getDepartmentRefShortName(){
		return departmentRefShortName;
	}

	public void setDepartmentRefShortName(String departmentRefShortName) {
		this.departmentRefShortName = departmentRefShortName;
	}

	public Date getDepartmentRefDateStart(){
		return departmentRefDateStart;
	}

	public void setDepartmentRefDateStart(Date departmentRefDateStart) {
		this.departmentRefDateStart = departmentRefDateStart;
	}

	public Date getDepartmentRefDateFinal(){
		return departmentRefDateFinal;
	}

	public void setDepartmentRefDateFinal(Date departmentRefDateFinal) {
		this.departmentRefDateFinal = departmentRefDateFinal;
	}

	public int getDepartmentRefRenCode(){
		return departmentRefRenCode;
	}

	public void setDepartmentRefRenCode(int departmentRefRenCode) {
		this.departmentRefRenCode = departmentRefRenCode;
	}

	public String getDepartmentRefShpzBalans(){
		return departmentRefShpzBalans;
	}

	public void setDepartmentRefShpzBalans(String departmentRefShpzBalans) {
		this.departmentRefShpzBalans = departmentRefShpzBalans;
	}

	public int getDepartmentRefKau_table_id_1884(){
		return departmentRefKau_table_id_1884;
	}

	public void setDepartmentRefKau_table_id_1884(int departmentRefKau_table_id_1884) {
		this.departmentRefKau_table_id_1884 = departmentRefKau_table_id_1884;
	}

	public String getDepartmentRefKau_1884(){
		return departmentRefKau_1884;
	}

	public void setDepartmentRefKau_1884(String departmentRefKau_1884) {
		this.departmentRefKau_1884 = departmentRefKau_1884;
	}

	public String getDepartmentRefName_1884(){
		return departmentRefName_1884;
	}

	public void setDepartmentRefName_1884(String departmentRefName_1884) {
		this.departmentRefName_1884 = departmentRefName_1884;
	}

	public String getDepartmentRefHrmorganizationid(){
		return departmentRefHrmorganizationid;
	}

	public void setDepartmentRefHrmorganizationid(String departmentRefHrmorganizationid) {
		this.departmentRefHrmorganizationid = departmentRefHrmorganizationid;
	}

	public int getStatusRefCode(){
		return statusRefCode;
	}

	public void setStatusRefCode(int statusRefCode) {
		this.statusRefCode = statusRefCode;
	}

	public String getStatusRefName(){
		return statusRefName;
	}

	public void setStatusRefName(String statusRefName) {
		this.statusRefName = statusRefName;
	}

	public int getTypeRefCode(){
		return typeRefCode;
	}

	public void setTypeRefCode(int typeRefCode) {
		this.typeRefCode = typeRefCode;
	}

	public String getTypeRefName(){
		return typeRefName;
	}

	public void setTypeRefName(String typeRefName) {
		this.typeRefName = typeRefName;
	}

	public int getInvgroupRefCode(){
		return invgroupRefCode;
	}

	public void setInvgroupRefCode(int invgroupRefCode) {
		this.invgroupRefCode = invgroupRefCode;
	}

	public String getInvgroupRefName(){
		return invgroupRefName;
	}

	public void setInvgroupRefName(String invgroupRefName) {
		this.invgroupRefName = invgroupRefName;
	}

	public String getInvgroupRefCommentgen(){
		return invgroupRefCommentgen;
	}

	public void setInvgroupRefCommentgen(String invgroupRefCommentgen) {
		this.invgroupRefCommentgen = invgroupRefCommentgen;
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
