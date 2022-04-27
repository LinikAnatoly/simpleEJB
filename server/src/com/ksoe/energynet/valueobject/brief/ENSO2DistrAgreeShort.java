
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENSO2DistrAgree;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENSO2DistrAgreeShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
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
	public int distrAgreeCode = Integer.MIN_VALUE;
	public String distrAgreeEic;
	public String distrAgreeObjectname;
	public String distrAgreeObjectaddress;
	public BigDecimal distrAgreePower;
	public String distrAgreeD3countername;
	public String distrAgreeD3countertype;
	public BigDecimal distrAgreeD3amperageratio;
	public BigDecimal distrAgreeD3voltageratio;
	public BigDecimal distrAgreeD3totalratio;
	public String distrAgreeD3place;
	public String distrAgreeD3voltageclass;
	public String distrAgreeD3workmode;
	public String distrAgreeD3tarifftype;
	public String distrAgreeD3accountingtype;
	public String distrAgreeD5feederlist;
	public String distrAgreeD6reliabilitypue;
	public String distrAgreeD6reliabilityguaranteed;
	public String distrAgreeD6balancesupplier;
	public String distrAgreeD6balanceclient;
	public String distrAgreeD6responsibilitysupplier;
	public String distrAgreeD6responsibilityclient;
	public String distrAgreeD7linesource;
	public String distrAgreeD7attachment;
	public String distrAgreeD8conditions;
	public String distrAgreeD8transformertype;
	public BigDecimal distrAgreeD8voltagebh;
	public BigDecimal distrAgreeD8voltagehh;
	public BigDecimal distrAgreeD8lossesxx;
	public BigDecimal distrAgreeD8losseskz;
	public BigDecimal distrAgreeD8amperage;
	public BigDecimal distrAgreeD8voltagekz;
	public BigDecimal distrAgreeD8linelength;
	public BigDecimal distrAgreeD8liner;
	public BigDecimal distrAgreeD8linex;
	public int distrAgreeD8hours = Integer.MIN_VALUE;
	public String distrAgreeUserGen;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
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

	public void setDistrAgreeCode(int aValue){
		distrAgreeCode = aValue;
	}
	public int getDistrAgreeCode(){
		return distrAgreeCode;
	}

	public void setDistrAgreeEic(String aValue){
		distrAgreeEic = aValue;
	}
	public String getDistrAgreeEic(){
		return distrAgreeEic;
	}

	public void setDistrAgreeObjectname(String aValue){
		distrAgreeObjectname = aValue;
	}
	public String getDistrAgreeObjectname(){
		return distrAgreeObjectname;
	}

	public void setDistrAgreeObjectaddress(String aValue){
		distrAgreeObjectaddress = aValue;
	}
	public String getDistrAgreeObjectaddress(){
		return distrAgreeObjectaddress;
	}

	public void setDistrAgreePower(BigDecimal aValue){
		distrAgreePower = aValue;
	}
	public BigDecimal getDistrAgreePower(){
		return distrAgreePower;
	}

	public void setDistrAgreeD3countername(String aValue){
		distrAgreeD3countername = aValue;
	}
	public String getDistrAgreeD3countername(){
		return distrAgreeD3countername;
	}

	public void setDistrAgreeD3countertype(String aValue){
		distrAgreeD3countertype = aValue;
	}
	public String getDistrAgreeD3countertype(){
		return distrAgreeD3countertype;
	}

	public void setDistrAgreeD3amperageratio(BigDecimal aValue){
		distrAgreeD3amperageratio = aValue;
	}
	public BigDecimal getDistrAgreeD3amperageratio(){
		return distrAgreeD3amperageratio;
	}

	public void setDistrAgreeD3voltageratio(BigDecimal aValue){
		distrAgreeD3voltageratio = aValue;
	}
	public BigDecimal getDistrAgreeD3voltageratio(){
		return distrAgreeD3voltageratio;
	}

	public void setDistrAgreeD3totalratio(BigDecimal aValue){
		distrAgreeD3totalratio = aValue;
	}
	public BigDecimal getDistrAgreeD3totalratio(){
		return distrAgreeD3totalratio;
	}

	public void setDistrAgreeD3place(String aValue){
		distrAgreeD3place = aValue;
	}
	public String getDistrAgreeD3place(){
		return distrAgreeD3place;
	}

	public void setDistrAgreeD3voltageclass(String aValue){
		distrAgreeD3voltageclass = aValue;
	}
	public String getDistrAgreeD3voltageclass(){
		return distrAgreeD3voltageclass;
	}

	public void setDistrAgreeD3workmode(String aValue){
		distrAgreeD3workmode = aValue;
	}
	public String getDistrAgreeD3workmode(){
		return distrAgreeD3workmode;
	}

	public void setDistrAgreeD3tarifftype(String aValue){
		distrAgreeD3tarifftype = aValue;
	}
	public String getDistrAgreeD3tarifftype(){
		return distrAgreeD3tarifftype;
	}

	public void setDistrAgreeD3accountingtype(String aValue){
		distrAgreeD3accountingtype = aValue;
	}
	public String getDistrAgreeD3accountingtype(){
		return distrAgreeD3accountingtype;
	}

	public void setDistrAgreeD5feederlist(String aValue){
		distrAgreeD5feederlist = aValue;
	}
	public String getDistrAgreeD5feederlist(){
		return distrAgreeD5feederlist;
	}

	public void setDistrAgreeD6reliabilitypue(String aValue){
		distrAgreeD6reliabilitypue = aValue;
	}
	public String getDistrAgreeD6reliabilitypue(){
		return distrAgreeD6reliabilitypue;
	}

	public void setDistrAgreeD6reliabilityguaranteed(String aValue){
		distrAgreeD6reliabilityguaranteed = aValue;
	}
	public String getDistrAgreeD6reliabilityguaranteed(){
		return distrAgreeD6reliabilityguaranteed;
	}

	public void setDistrAgreeD6balancesupplier(String aValue){
		distrAgreeD6balancesupplier = aValue;
	}
	public String getDistrAgreeD6balancesupplier(){
		return distrAgreeD6balancesupplier;
	}

	public void setDistrAgreeD6balanceclient(String aValue){
		distrAgreeD6balanceclient = aValue;
	}
	public String getDistrAgreeD6balanceclient(){
		return distrAgreeD6balanceclient;
	}

	public void setDistrAgreeD6responsibilitysupplier(String aValue){
		distrAgreeD6responsibilitysupplier = aValue;
	}
	public String getDistrAgreeD6responsibilitysupplier(){
		return distrAgreeD6responsibilitysupplier;
	}

	public void setDistrAgreeD6responsibilityclient(String aValue){
		distrAgreeD6responsibilityclient = aValue;
	}
	public String getDistrAgreeD6responsibilityclient(){
		return distrAgreeD6responsibilityclient;
	}

	public void setDistrAgreeD7linesource(String aValue){
		distrAgreeD7linesource = aValue;
	}
	public String getDistrAgreeD7linesource(){
		return distrAgreeD7linesource;
	}

	public void setDistrAgreeD7attachment(String aValue){
		distrAgreeD7attachment = aValue;
	}
	public String getDistrAgreeD7attachment(){
		return distrAgreeD7attachment;
	}

	public void setDistrAgreeD8conditions(String aValue){
		distrAgreeD8conditions = aValue;
	}
	public String getDistrAgreeD8conditions(){
		return distrAgreeD8conditions;
	}

	public void setDistrAgreeD8transformertype(String aValue){
		distrAgreeD8transformertype = aValue;
	}
	public String getDistrAgreeD8transformertype(){
		return distrAgreeD8transformertype;
	}

	public void setDistrAgreeD8voltagebh(BigDecimal aValue){
		distrAgreeD8voltagebh = aValue;
	}
	public BigDecimal getDistrAgreeD8voltagebh(){
		return distrAgreeD8voltagebh;
	}

	public void setDistrAgreeD8voltagehh(BigDecimal aValue){
		distrAgreeD8voltagehh = aValue;
	}
	public BigDecimal getDistrAgreeD8voltagehh(){
		return distrAgreeD8voltagehh;
	}

	public void setDistrAgreeD8lossesxx(BigDecimal aValue){
		distrAgreeD8lossesxx = aValue;
	}
	public BigDecimal getDistrAgreeD8lossesxx(){
		return distrAgreeD8lossesxx;
	}

	public void setDistrAgreeD8losseskz(BigDecimal aValue){
		distrAgreeD8losseskz = aValue;
	}
	public BigDecimal getDistrAgreeD8losseskz(){
		return distrAgreeD8losseskz;
	}

	public void setDistrAgreeD8amperage(BigDecimal aValue){
		distrAgreeD8amperage = aValue;
	}
	public BigDecimal getDistrAgreeD8amperage(){
		return distrAgreeD8amperage;
	}

	public void setDistrAgreeD8voltagekz(BigDecimal aValue){
		distrAgreeD8voltagekz = aValue;
	}
	public BigDecimal getDistrAgreeD8voltagekz(){
		return distrAgreeD8voltagekz;
	}

	public void setDistrAgreeD8linelength(BigDecimal aValue){
		distrAgreeD8linelength = aValue;
	}
	public BigDecimal getDistrAgreeD8linelength(){
		return distrAgreeD8linelength;
	}

	public void setDistrAgreeD8liner(BigDecimal aValue){
		distrAgreeD8liner = aValue;
	}
	public BigDecimal getDistrAgreeD8liner(){
		return distrAgreeD8liner;
	}

	public void setDistrAgreeD8linex(BigDecimal aValue){
		distrAgreeD8linex = aValue;
	}
	public BigDecimal getDistrAgreeD8linex(){
		return distrAgreeD8linex;
	}

	public void setDistrAgreeD8hours(int aValue){
		distrAgreeD8hours = aValue;
	}
	public int getDistrAgreeD8hours(){
		return distrAgreeD8hours;
	}

	public void setDistrAgreeUserGen(String aValue){
		distrAgreeUserGen = aValue;
	}
	public String getDistrAgreeUserGen(){
		return distrAgreeUserGen;
	}



}
