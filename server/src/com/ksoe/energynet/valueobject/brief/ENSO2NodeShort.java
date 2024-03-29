
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENSO2Node;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENSO2NodeShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public int ccNodeCode = Integer.MIN_VALUE;
	public int ccTowerCode = Integer.MIN_VALUE;
	public BigDecimal power;
	public String description;
	public int isCalc = Integer.MIN_VALUE;
	public String userGen;
	public Date dateEdit ;
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
	public int so2nodeTypeCode = Integer.MIN_VALUE;
	public String so2nodeTypeName;
	
	public String ccelementdataname;
	public String f150;
	public String s150;
	public String f35;
	public String s35;
	public String f10;
	public String s10;
	public String f04;
	
	public String tc_address; 
	public String tc_building; 
	public BigDecimal tc_currpower; 
	public BigDecimal tc_servpower;
	public BigDecimal tc_currvoltage; 
	public BigDecimal tc_servvoltage;
	public String dep_name;
	public String tc_number;
    public Date tc_dategen;
	public String connectionkindname;
    public Date fact_conn_date; 
    public String tc_conpowpoint;
    public String tc_conpowplaces; 
    public String work_directly_on_joining; 
    public String servicesobjectContractStatusRefName;
    public String towerName; 

	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setCcNodeCode(int aValue){
		ccNodeCode = aValue;
	}

	public int getCcNodeCode(){
		return ccNodeCode;
	}

	public void setCcTowerCode(int aValue){
		ccTowerCode = aValue;
	}

	public int getCcTowerCode(){
		return ccTowerCode;
	}
	public void setPower(BigDecimal aValue){
		power = aValue;
	}

	public BigDecimal getPower(){
		return power;
	}

	public void setDescription(String aValue){
		description = aValue;
	}

	public String getDescription(){
		return description;
	}

	public void setIsCalc(int aValue){
		isCalc = aValue;
	}

	public int getIsCalc(){
		return isCalc;
	}

	public void setUserGen(String aValue){
		userGen = aValue;
	}

	public String getUserGen(){
		return userGen;
	}

	public void setDateEdit(Date aValue){
		dateEdit = aValue;
	}

	public Date getDateEdit(){
		return dateEdit;
	}



	public void setServicesobjectCode(int aValue){
		servicesobjectCode = aValue;
	}
	public int getServicesobjectCode(){
		return servicesobjectCode;
	}

	public void setServicesobjectContractNumber(String aValue){
		servicesobjectContractNumber = aValue;
	}
	public String getServicesobjectContractNumber(){
		return servicesobjectContractNumber;
	}

	public void setServicesobjectContractDate(Date aValue){
		servicesobjectContractDate = aValue;
	}
	public Date getServicesobjectContractDate(){
		return servicesobjectContractDate;
	}

	public void setServicesobjectName(String aValue){
		servicesobjectName = aValue;
	}
	public String getServicesobjectName(){
		return servicesobjectName;
	}

	public void setServicesobjectPartnerCode(String aValue){
		servicesobjectPartnerCode = aValue;
	}
	public String getServicesobjectPartnerCode(){
		return servicesobjectPartnerCode;
	}

	public void setServicesobjectFinDocCode(String aValue){
		servicesobjectFinDocCode = aValue;
	}
	public String getServicesobjectFinDocCode(){
		return servicesobjectFinDocCode;
	}

	public void setServicesobjectFinDocID(int aValue){
		servicesobjectFinDocID = aValue;
	}
	public int getServicesobjectFinDocID(){
		return servicesobjectFinDocID;
	}

	public void setServicesobjectCommentGen(String aValue){
		servicesobjectCommentGen = aValue;
	}
	public String getServicesobjectCommentGen(){
		return servicesobjectCommentGen;
	}

	public void setServicesobjectContractNumberServices(String aValue){
		servicesobjectContractNumberServices = aValue;
	}
	public String getServicesobjectContractNumberServices(){
		return servicesobjectContractNumberServices;
	}

	public void setServicesobjectContractDateServices(Date aValue){
		servicesobjectContractDateServices = aValue;
	}
	public Date getServicesobjectContractDateServices(){
		return servicesobjectContractDateServices;
	}

	public void setServicesobjectContragentName(String aValue){
		servicesobjectContragentName = aValue;
	}
	public String getServicesobjectContragentName(){
		return servicesobjectContragentName;
	}

	public void setServicesobjectContragentAddress(String aValue){
		servicesobjectContragentAddress = aValue;
	}
	public String getServicesobjectContragentAddress(){
		return servicesobjectContragentAddress;
	}

	public void setServicesobjectContragentAddressWork(String aValue){
		servicesobjectContragentAddressWork = aValue;
	}
	public String getServicesobjectContragentAddressWork(){
		return servicesobjectContragentAddressWork;
	}

	public void setServicesobjectContragentOkpo(String aValue){
		servicesobjectContragentOkpo = aValue;
	}
	public String getServicesobjectContragentOkpo(){
		return servicesobjectContragentOkpo;
	}

	public void setServicesobjectContragentBankAccount(String aValue){
		servicesobjectContragentBankAccount = aValue;
	}
	public String getServicesobjectContragentBankAccount(){
		return servicesobjectContragentBankAccount;
	}

	public void setServicesobjectContragentBankName(String aValue){
		servicesobjectContragentBankName = aValue;
	}
	public String getServicesobjectContragentBankName(){
		return servicesobjectContragentBankName;
	}

	public void setServicesobjectContragentBankMfo(String aValue){
		servicesobjectContragentBankMfo = aValue;
	}
	public String getServicesobjectContragentBankMfo(){
		return servicesobjectContragentBankMfo;
	}

	public void setServicesobjectContragentBossName(String aValue){
		servicesobjectContragentBossName = aValue;
	}
	public String getServicesobjectContragentBossName(){
		return servicesobjectContragentBossName;
	}

	public void setServicesobjectContragentPassport(String aValue){
		servicesobjectContragentPassport = aValue;
	}
	public String getServicesobjectContragentPassport(){
		return servicesobjectContragentPassport;
	}

	public void setServicesobjectContractServicesSumma(BigDecimal aValue){
		servicesobjectContractServicesSumma = aValue;
	}
	public BigDecimal getServicesobjectContractServicesSumma(){
		return servicesobjectContractServicesSumma;
	}

	public void setServicesobjectContractServicesSummaVAT(BigDecimal aValue){
		servicesobjectContractServicesSummaVAT = aValue;
	}
	public BigDecimal getServicesobjectContractServicesSummaVAT(){
		return servicesobjectContractServicesSummaVAT;
	}

	public void setServicesobjectContractServicesPower(BigDecimal aValue){
		servicesobjectContractServicesPower = aValue;
	}
	public BigDecimal getServicesobjectContractServicesPower(){
		return servicesobjectContractServicesPower;
	}

	public void setServicesobjectCommentServicesGen(String aValue){
		servicesobjectCommentServicesGen = aValue;
	}
	public String getServicesobjectCommentServicesGen(){
		return servicesobjectCommentServicesGen;
	}

	public void setServicesobjectContractServicesDistance(BigDecimal aValue){
		servicesobjectContractServicesDistance = aValue;
	}
	public BigDecimal getServicesobjectContractServicesDistance(){
		return servicesobjectContractServicesDistance;
	}

	public void setServicesobjectContractServicesDay(BigDecimal aValue){
		servicesobjectContractServicesDay = aValue;
	}
	public BigDecimal getServicesobjectContractServicesDay(){
		return servicesobjectContractServicesDay;
	}

	public void setServicesobjectUserGen(String aValue){
		servicesobjectUserGen = aValue;
	}
	public String getServicesobjectUserGen(){
		return servicesobjectUserGen;
	}

	public void setServicesobjectDateEdit(Date aValue){
		servicesobjectDateEdit = aValue;
	}
	public Date getServicesobjectDateEdit(){
		return servicesobjectDateEdit;
	}

	public void setServicesobjectWarrantDate(Date aValue){
		servicesobjectWarrantDate = aValue;
	}
	public Date getServicesobjectWarrantDate(){
		return servicesobjectWarrantDate;
	}

	public void setServicesobjectWarrantNumber(String aValue){
		servicesobjectWarrantNumber = aValue;
	}
	public String getServicesobjectWarrantNumber(){
		return servicesobjectWarrantNumber;
	}

	public void setServicesobjectWarrantFIO(String aValue){
		servicesobjectWarrantFIO = aValue;
	}
	public String getServicesobjectWarrantFIO(){
		return servicesobjectWarrantFIO;
	}

	public void setServicesobjectRegionalType(int aValue){
		servicesobjectRegionalType = aValue;
	}
	public int getServicesobjectRegionalType(){
		return servicesobjectRegionalType;
	}

	public void setServicesobjectBasisType(BigDecimal aValue){
		servicesobjectBasisType = aValue;
	}
	public BigDecimal getServicesobjectBasisType(){
		return servicesobjectBasisType;
	}

	public void setServicesobjectContragentPosition(String aValue){
		servicesobjectContragentPosition = aValue;
	}
	public String getServicesobjectContragentPosition(){
		return servicesobjectContragentPosition;
	}

	public void setServicesobjectExecuteWorkDate(Date aValue){
		servicesobjectExecuteWorkDate = aValue;
	}
	public Date getServicesobjectExecuteWorkDate(){
		return servicesobjectExecuteWorkDate;
	}

	public void setServicesobjectTimeStart(Date aValue){
		servicesobjectTimeStart = aValue;
	}
	public Date getServicesobjectTimeStart(){
		return servicesobjectTimeStart;
	}

	public void setServicesobjectTimeFinal(Date aValue){
		servicesobjectTimeFinal = aValue;
	}
	public Date getServicesobjectTimeFinal(){
		return servicesobjectTimeFinal;
	}

	public void setServicesobjectContragentPhoneNumber(String aValue){
		servicesobjectContragentPhoneNumber = aValue;
	}
	public String getServicesobjectContragentPhoneNumber(){
		return servicesobjectContragentPhoneNumber;
	}

	public void setServicesobjectExecutorPhoneNumber(String aValue){
		servicesobjectExecutorPhoneNumber = aValue;
	}
	public String getServicesobjectExecutorPhoneNumber(){
		return servicesobjectExecutorPhoneNumber;
	}

	public void setServicesobjectContragentObjectWork(String aValue){
		servicesobjectContragentObjectWork = aValue;
	}
	public String getServicesobjectContragentObjectWork(){
		return servicesobjectContragentObjectWork;
	}

	public void setServicesobjectIsNoPay(int aValue){
		servicesobjectIsNoPay = aValue;
	}
	public int getServicesobjectIsNoPay(){
		return servicesobjectIsNoPay;
	}

	public void setServicesobjectIsCustomerMaterials(int aValue){
		servicesobjectIsCustomerMaterials = aValue;
	}
	public int getServicesobjectIsCustomerMaterials(){
		return servicesobjectIsCustomerMaterials;
	}

	public void setServicesobjectPayDate(Date aValue){
		servicesobjectPayDate = aValue;
	}
	public Date getServicesobjectPayDate(){
		return servicesobjectPayDate;
	}

	public void setServicesobjectFinPayFormCode(int aValue){
		servicesobjectFinPayFormCode = aValue;
	}
	public int getServicesobjectFinPayFormCode(){
		return servicesobjectFinPayFormCode;
	}

	public void setServicesobjectFinPayFormName(String aValue){
		servicesobjectFinPayFormName = aValue;
	}
	public String getServicesobjectFinPayFormName(){
		return servicesobjectFinPayFormName;
	}

	public void setServicesobjectPartnerId(int aValue){
		servicesobjectPartnerId = aValue;
	}
	public int getServicesobjectPartnerId(){
		return servicesobjectPartnerId;
	}

	public void setServicesobjectPayDetail(String aValue){
		servicesobjectPayDetail = aValue;
	}
	public String getServicesobjectPayDetail(){
		return servicesobjectPayDetail;
	}

	public void setServicesobjectActTransferNumber(String aValue){
		servicesobjectActTransferNumber = aValue;
	}
	public String getServicesobjectActTransferNumber(){
		return servicesobjectActTransferNumber;
	}

	public void setServicesobjectActTransferDate(Date aValue){
		servicesobjectActTransferDate = aValue;
	}
	public Date getServicesobjectActTransferDate(){
		return servicesobjectActTransferDate;
	}

	public void setServicesobjectResposible(String aValue){
		servicesobjectResposible = aValue;
	}
	public String getServicesobjectResposible(){
		return servicesobjectResposible;
	}

	public void setServicesobjectResposiblePosition(String aValue){
		servicesobjectResposiblePosition = aValue;
	}
	public String getServicesobjectResposiblePosition(){
		return servicesobjectResposiblePosition;
	}

	public void setServicesobjectResposibleTabNumber(String aValue){
		servicesobjectResposibleTabNumber = aValue;
	}
	public String getServicesobjectResposibleTabNumber(){
		return servicesobjectResposibleTabNumber;
	}

	public void setServicesobjectPrevContractStatus(int aValue){
		servicesobjectPrevContractStatus = aValue;
	}
	public int getServicesobjectPrevContractStatus(){
		return servicesobjectPrevContractStatus;
	}

	public void setServicesobjectReconnectionTU(int aValue){
		servicesobjectReconnectionTU = aValue;
	}
	public int getServicesobjectReconnectionTU(){
		return servicesobjectReconnectionTU;
	}

	public void setServicesobjectPersonalAccountCode(int aValue){
		servicesobjectPersonalAccountCode = aValue;
	}
	public int getServicesobjectPersonalAccountCode(){
		return servicesobjectPersonalAccountCode;
	}

	public void setServicesobjectPersonalAccountNumber(String aValue){
		servicesobjectPersonalAccountNumber = aValue;
	}
	public String getServicesobjectPersonalAccountNumber(){
		return servicesobjectPersonalAccountNumber;
	}

	public void setServicesobjectTabNumber(String aValue){
		servicesobjectTabNumber = aValue;
	}
	public String getServicesobjectTabNumber(){
		return servicesobjectTabNumber;
	}

	public void setServicesobjectCitiesList(String aValue){
		servicesobjectCitiesList = aValue;
	}
	public String getServicesobjectCitiesList(){
		return servicesobjectCitiesList;
	}

	public void setServicesobjectLineLength(BigDecimal aValue){
		servicesobjectLineLength = aValue;
	}
	public BigDecimal getServicesobjectLineLength(){
		return servicesobjectLineLength;
	}

	public void setServicesobjectProjectCode(String aValue){
		servicesobjectProjectCode = aValue;
	}
	public String getServicesobjectProjectCode(){
		return servicesobjectProjectCode;
	}

	public void setServicesobjectCnPackCode(int aValue){
		servicesobjectCnPackCode = aValue;
	}
	public int getServicesobjectCnPackCode(){
		return servicesobjectCnPackCode;
	}

	public void setServicesobjectDfPackCode(int aValue){
		servicesobjectDfPackCode = aValue;
	}
	public int getServicesobjectDfPackCode(){
		return servicesobjectDfPackCode;
	}

	public void setServicesobjectCountersZoneType(int aValue){
		servicesobjectCountersZoneType = aValue;
	}
	public int getServicesobjectCountersZoneType(){
		return servicesobjectCountersZoneType;
	}

	public void setServicesobjectAxPartnerCode(String aValue){
		servicesobjectAxPartnerCode = aValue;
	}
	public String getServicesobjectAxPartnerCode(){
		return servicesobjectAxPartnerCode;
	}

	public void setServicesobjectAxPartnerName(String aValue){
		servicesobjectAxPartnerName = aValue;
	}
	public String getServicesobjectAxPartnerName(){
		return servicesobjectAxPartnerName;
	}

	public void setServicesobjectAxContractNumber(String aValue){
		servicesobjectAxContractNumber = aValue;
	}
	public String getServicesobjectAxContractNumber(){
		return servicesobjectAxContractNumber;
	}

	public void setServicesobjectAxContractDate(Date aValue){
		servicesobjectAxContractDate = aValue;
	}
	public Date getServicesobjectAxContractDate(){
		return servicesobjectAxContractDate;
	}

	public void setServicesobjectAxContractCode(String aValue){
		servicesobjectAxContractCode = aValue;
	}
	public String getServicesobjectAxContractCode(){
		return servicesobjectAxContractCode;
	}

	public void setServicesobjectAxContractId(String aValue){
		servicesobjectAxContractId = aValue;
	}
	public String getServicesobjectAxContractId(){
		return servicesobjectAxContractId;
	}

	public void setServicesobjectAxContractCommentGen(String aValue){
		servicesobjectAxContractCommentGen = aValue;
	}
	public String getServicesobjectAxContractCommentGen(){
		return servicesobjectAxContractCommentGen;
	}

	public void setServicesobjectProjAgreeSumma(BigDecimal aValue){
		servicesobjectProjAgreeSumma = aValue;
	}
	public BigDecimal getServicesobjectProjAgreeSumma(){
		return servicesobjectProjAgreeSumma;
	}

	public void setServicesobjectTopographySumma(BigDecimal aValue){
		servicesobjectTopographySumma = aValue;
	}
	public BigDecimal getServicesobjectTopographySumma(){
		return servicesobjectTopographySumma;
	}

	public void setServicesobjectCreatedFromSite(int aValue){
		servicesobjectCreatedFromSite = aValue;
	}
	public int getServicesobjectCreatedFromSite(){
		return servicesobjectCreatedFromSite;
	}

	public void setServicesobjectTerm(int aValue){
		servicesobjectTerm = aValue;
	}
	public int getServicesobjectTerm(){
		return servicesobjectTerm;
	}

	public void setServicesobjectRegulation(int aValue){
		servicesobjectRegulation = aValue;
	}
	public int getServicesobjectRegulation(){
		return servicesobjectRegulation;
	}

	public void setServicesobjectBoundaryDateWork(Date aValue){
		servicesobjectBoundaryDateWork = aValue;
	}
	public Date getServicesobjectBoundaryDateWork(){
		return servicesobjectBoundaryDateWork;
	}

	public void setServicesobjectCountDayDelay(int aValue){
		servicesobjectCountDayDelay = aValue;
	}
	public int getServicesobjectCountDayDelay(){
		return servicesobjectCountDayDelay;
	}

	public void setServicesobjectFactDateWork(Date aValue){
		servicesobjectFactDateWork = aValue;
	}
	public Date getServicesobjectFactDateWork(){
		return servicesobjectFactDateWork;
	}

	public void setServicesobjectCodeEIC(String aValue){
		servicesobjectCodeEIC = aValue;
	}
	public String getServicesobjectCodeEIC(){
		return servicesobjectCodeEIC;
	}

	public void setServicesobjectPersonalAccountUid(String aValue){
		servicesobjectPersonalAccountUid = aValue;
	}
	public String getServicesobjectPersonalAccountUid(){
		return servicesobjectPersonalAccountUid;
	}

	public void setSo2nodeTypeCode(int aValue){
		so2nodeTypeCode = aValue;
	}
	public int getSo2nodeTypeCode(){
		return so2nodeTypeCode;
	}

	public void setSo2nodeTypeName(String aValue){
		so2nodeTypeName = aValue;
	}
	public String getSo2nodeTypeName(){
		return so2nodeTypeName;
	}

	public String getCcelementdataname() {
		return ccelementdataname;
	}

	public void setCcelementdataname(String ccelementdataname) {
		this.ccelementdataname = ccelementdataname;
	}

	public String getF150() {
		return f150;
	}

	public void setF150(String f150) {
		this.f150 = f150;
	}

	public String getS150() {
		return s150;
	}

	public void setS150(String s150) {
		this.s150 = s150;
	}

	public String getF35() {
		return f35;
	}

	public void setF35(String f35) {
		this.f35 = f35;
	}

	public String getS35() {
		return s35;
	}

	public void setS35(String s35) {
		this.s35 = s35;
	}

	public String getF10() {
		return f10;
	}

	public void setF10(String f10) {
		this.f10 = f10;
	}

	public String getS10() {
		return s10;
	}

	public void setS10(String s10) {
		this.s10 = s10;
	}

	public String getF04() {
		return f04;
	}

	public void setF04(String f04) {
		this.f04 = f04;
	}

	public String getTc_address() {
		return tc_address;
	}

	public void setTc_address(String tc_address) {
		this.tc_address = tc_address;
	}

	public String getTc_building() {
		return tc_building;
	}

	public void setTc_building(String tc_building) {
		this.tc_building = tc_building;
	}

	public BigDecimal getTc_currpower() {
		return tc_currpower;
	}

	public void setTc_currpower(BigDecimal tc_currpower) {
		this.tc_currpower = tc_currpower;
	}

	public BigDecimal getTc_servpower() {
		return tc_servpower;
	}

	public void setTc_servpower(BigDecimal tc_servpower) {
		this.tc_servpower = tc_servpower;
	}

	public BigDecimal getTc_currvoltage() {
		return tc_currvoltage;
	}

	public void setTc_currvoltage(BigDecimal tc_currvoltage) {
		this.tc_currvoltage = tc_currvoltage;
	}

	public BigDecimal getTc_servvoltage() {
		return tc_servvoltage;
	}

	public void setTc_servvoltage(BigDecimal tc_servvoltage) {
		this.tc_servvoltage = tc_servvoltage;
	}

	public String getDep_name() {
		return dep_name;
	}

	public void setDep_name(String dep_name) {
		this.dep_name = dep_name;
	}

	public String getTc_number() {
		return tc_number;
	}

	public void setTc_number(String tc_number) {
		this.tc_number = tc_number;
	}

	public Date getTc_dategen() {
		return tc_dategen;
	}

	public void setTc_dategen(Date tc_dategen) {
		this.tc_dategen = tc_dategen;
	}

	public String getConnectionkindname() {
		return connectionkindname;
	}

	public void setConnectionkindname(String connectionkindname) {
		this.connectionkindname = connectionkindname;
	}

	public Date getFact_conn_date() {
		return fact_conn_date;
	}

	public void setFact_conn_date(Date fact_conn_date) {
		this.fact_conn_date = fact_conn_date;
	}

	public String getTc_conpowpoint() {
		return tc_conpowpoint;
	}

	public void setTc_conpowpoint(String tc_conpowpoint) {
		this.tc_conpowpoint = tc_conpowpoint;
	}

	public String getTc_conpowplaces() {
		return tc_conpowplaces;
	}

	public void setTc_conpowplaces(String tc_conpowplaces) {
		this.tc_conpowplaces = tc_conpowplaces;
	}

	public void setWork_directly_on_joining(String work_directly_on_joining){
		this.work_directly_on_joining=work_directly_on_joining;
	}
	
	public String getWork_directly_on_joining(){
		return work_directly_on_joining;
	}
	
	public void setServicesobjectContractStatusRefName(String aValue) {
		servicesobjectContractStatusRefName = aValue;
	}

	public String getServicesobjectContractStatusRefName() {
		return servicesobjectContractStatusRefName;
	}

	public String getTowerName() {
		return towerName;
	}

	public void setTowerName(String towerName) {
		this.towerName = towerName;
	}




}
