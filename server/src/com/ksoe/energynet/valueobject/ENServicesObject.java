
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

import java.io.Serializable;

/**
* Value Object for ENServicesObject;
*/

import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.CNSubsystemTypeRef;
import com.ksoe.energynet.valueobject.references.ENActIncomeCreatMetodRef;
import com.ksoe.energynet.valueobject.references.ENGeneralContractsRef;
import com.ksoe.energynet.valueobject.references.ENServicesBillStatusRef;
import com.ksoe.energynet.valueobject.references.ENServicesContractKindRef;
import com.ksoe.energynet.valueobject.references.ENServicesContractStatusRef;
import com.ksoe.energynet.valueobject.references.ENServicesContractTypeRef;
import com.ksoe.energynet.valueobject.references.ENServicesContragentTypeRef;
import com.ksoe.energynet.valueobject.references.ENServicesObjectCalcTypeRef;
import com.ksoe.energynet.valueobject.references.ENServicesObjectStatusRef;
import com.ksoe.energynet.valueobject.references.ENSiteRef;
import com.ksoe.energynet.valueobject.references.ENWarrantRef;

public class ENServicesObject implements Serializable {

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
	public String domain_info;
	public long modify_time = Long.MIN_VALUE;
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
	public Boolean calcSumsByCalculations = null;
	public String codeEIC;
	public String personalAccountUid;
	public String customerMailingAddress;
	public BigDecimal powerGeneration;
	public String postCode;
    public String  customerEmail; 
    public String  demographicCode; 
    public String  ownershipRecordNumber; 
    public String  realEstateRegNumber; 

	public ENDepartment department = new ENDepartment();
	public ENElement element = new ENElement();
	public ENServicesContractStatusRef contractStatusRef = new ENServicesContractStatusRef();
	public ENServicesContractTypeRef contractTypeRef = new ENServicesContractTypeRef();
	public ENServicesContragentTypeRef contragentTypeRef = new ENServicesContragentTypeRef();
	public ENServicesBillStatusRef billStatusRef = new ENServicesBillStatusRef();
	public ENWarrantRef warrantRef = new ENWarrantRef();
	public ENServicesObjectStatusRef statusRef = new ENServicesObjectStatusRef();
	public ENTechConditionsObjects techConObjects = new ENTechConditionsObjects();
	public ENServicesContractKindRef contractKindRef = new ENServicesContractKindRef();
	public CNSubsystemTypeRef cnSubsystemTypeRef = new CNSubsystemTypeRef();
	public ENServicesObjectCalcTypeRef calcTypeRef = new ENServicesObjectCalcTypeRef();
	public ENSiteRef siteRef = new ENSiteRef();
	public ENGeneralContractsRef generalContractRef = new ENGeneralContractsRef();
	public ENActIncomeCreatMetodRef actIncomeCreatMetodRef = new ENActIncomeCreatMetodRef();


	/**  ***************************************************  */
	public BigDecimal tension_point;
	public int baseStation = Integer.MIN_VALUE;
	public String axContractAccount; // рег. № договора АХ
	public int isActive = Integer.MIN_VALUE;

	/**  ***************************************************  */




	public static final String tableName = "ENSERVICESOBJECT";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENSERVICESOBJECT.CODE";
	public static final String contractNumber_Attr = "contractNumber";
	public static final String contractNumber_Field = "CONTRACTNUMBER";
	public static final String contractNumber_QFielld = "ENSERVICESOBJECT.CONTRACTNUMBER";
	public static final String contractDate_Attr = "contractDate";
	public static final String contractDate_Field = "CONTRACTDATE";
	public static final String contractDate_QFielld = "ENSERVICESOBJECT.CONTRACTDATE";
	public static final String name_Attr = "name";
	public static final String name_Field = "NAME";
	public static final String name_QFielld = "ENSERVICESOBJECT.NAME";
	public static final String partnerCode_Attr = "partnerCode";
	public static final String partnerCode_Field = "PARTNERCODE";
	public static final String partnerCode_QFielld = "ENSERVICESOBJECT.PARTNERCODE";
	public static final String finDocCode_Attr = "finDocCode";
	public static final String finDocCode_Field = "FINDOCCODE";
	public static final String finDocCode_QFielld = "ENSERVICESOBJECT.FINDOCCODE";
	public static final String finDocID_Attr = "finDocID";
	public static final String finDocID_Field = "FINDOCID";
	public static final String finDocID_QFielld = "ENSERVICESOBJECT.FINDOCID";
	public static final String commentGen_Attr = "commentGen";
	public static final String commentGen_Field = "COMMENTGEN";
	public static final String commentGen_QFielld = "ENSERVICESOBJECT.COMMENTGEN";
	public static final String contractNumberServices_Attr = "contractNumberServices";
	public static final String contractNumberServices_Field = "CONTRACTNUMBERSERVICES";
	public static final String contractNumberServices_QFielld = "ENSERVICESOBJECT.CONTRACTNUMBERSERVICES";
	public static final String contractDateServices_Attr = "contractDateServices";
	public static final String contractDateServices_Field = "CONTRACTDATESERVICES";
	public static final String contractDateServices_QFielld = "ENSERVICESOBJECT.CONTRACTDATESERVICES";
	public static final String contragentName_Attr = "contragentName";
	public static final String contragentName_Field = "CONTRAGENTNAME";
	public static final String contragentName_QFielld = "ENSERVICESOBJECT.CONTRAGENTNAME";
	public static final String contragentAddress_Attr = "contragentAddress";
	public static final String contragentAddress_Field = "CONTRAGENTADDRESS";
	public static final String contragentAddress_QFielld = "ENSERVICESOBJECT.CONTRAGENTADDRESS";
	public static final String contragentAddressWork_Attr = "contragentAddressWork";
	public static final String contragentAddressWork_Field = "CONTRAGENTADDRESSWORK";
	public static final String contragentAddressWork_QFielld = "ENSERVICESOBJECT.CONTRAGENTADDRESSWORK";
	public static final String contragentOkpo_Attr = "contragentOkpo";
	public static final String contragentOkpo_Field = "CONTRAGENTOKPO";
	public static final String contragentOkpo_QFielld = "ENSERVICESOBJECT.CONTRAGENTOKPO";
	public static final String contragentBankAccount_Attr = "contragentBankAccount";
	public static final String contragentBankAccount_Field = "CONTRAGENTBANKACCOUNT";
	public static final String contragentBankAccount_QFielld = "ENSERVICESOBJECT.CONTRAGENTBANKACCOUNT";
	public static final String contragentBankName_Attr = "contragentBankName";
	public static final String contragentBankName_Field = "CONTRAGENTBANKNAME";
	public static final String contragentBankName_QFielld = "ENSERVICESOBJECT.CONTRAGENTBANKNAME";
	public static final String contragentBankMfo_Attr = "contragentBankMfo";
	public static final String contragentBankMfo_Field = "CONTRAGENTBANKMFO";
	public static final String contragentBankMfo_QFielld = "ENSERVICESOBJECT.CONTRAGENTBANKMFO";
	public static final String contragentBossName_Attr = "contragentBossName";
	public static final String contragentBossName_Field = "CONTRAGENTBOSSNAME";
	public static final String contragentBossName_QFielld = "ENSERVICESOBJECT.CONTRAGENTBOSSNAME";
	public static final String contragentPassport_Attr = "contragentPassport";
	public static final String contragentPassport_Field = "CONTRAGENTPASSPORT";
	public static final String contragentPassport_QFielld = "ENSERVICESOBJECT.CONTRAGENTPASSPORT";
	public static final String contractServicesSumma_Attr = "contractServicesSumma";
	public static final String contractServicesSumma_Field = "CONTRACTSERVICESSUMMA";
	public static final String contractServicesSumma_QFielld = "ENSERVICESOBJECT.CONTRACTSERVICESSUMMA";
	public static final String contractServicesSummaVAT_Attr = "contractServicesSummaVAT";
	public static final String contractServicesSummaVAT_Field = "CONTRACTSERVICESSUMMAVAT";
	public static final String contractServicesSummaVAT_QFielld = "ENSERVICESOBJECT.CONTRACTSERVICESSUMMVT";
	public static final String contractServicesPower_Attr = "contractServicesPower";
	public static final String contractServicesPower_Field = "CONTRACTSERVICESPOWER";
	public static final String contractServicesPower_QFielld = "ENSERVICESOBJECT.CONTRACTSERVICESPOWER";
	public static final String commentServicesGen_Attr = "commentServicesGen";
	public static final String commentServicesGen_Field = "COMMENTSERVICESGEN";
	public static final String commentServicesGen_QFielld = "ENSERVICESOBJECT.COMMENTSERVICESGEN";
	public static final String contractServicesDistance_Attr = "contractServicesDistance";
	public static final String contractServicesDistance_Field = "CONTRACTSERVICESDISTANCE";
	public static final String contractServicesDistance_QFielld = "ENSERVICESOBJECT.CONTRACTSERVICESDISTNC";
	public static final String contractServicesDay_Attr = "contractServicesDay";
	public static final String contractServicesDay_Field = "CONTRACTSERVICESDAY";
	public static final String contractServicesDay_QFielld = "ENSERVICESOBJECT.CONTRACTSERVICESDAY";
	public static final String userGen_Attr = "userGen";
	public static final String userGen_Field = "USERGEN";
	public static final String userGen_QFielld = "ENSERVICESOBJECT.USERGEN";
	public static final String dateEdit_Attr = "dateEdit";
	public static final String dateEdit_Field = "DATEEDIT";
	public static final String dateEdit_QFielld = "ENSERVICESOBJECT.DATEEDIT";
	public static final String warrantDate_Attr = "warrantDate";
	public static final String warrantDate_Field = "WARRANTDATE";
	public static final String warrantDate_QFielld = "ENSERVICESOBJECT.WARRANTDATE";
	public static final String warrantNumber_Attr = "warrantNumber";
	public static final String warrantNumber_Field = "WARRANTNUMBER";
	public static final String warrantNumber_QFielld = "ENSERVICESOBJECT.WARRANTNUMBER";
	public static final String warrantFIO_Attr = "warrantFIO";
	public static final String warrantFIO_Field = "WARRANTFIO";
	public static final String warrantFIO_QFielld = "ENSERVICESOBJECT.WARRANTFIO";
	public static final String regionalType_Attr = "regionalType";
	public static final String regionalType_Field = "REGIONALTYPE";
	public static final String regionalType_QFielld = "ENSERVICESOBJECT.REGIONALTYPE";
	public static final String basisType_Attr = "basisType";
	public static final String basisType_Field = "BASISTYPE";
	public static final String basisType_QFielld = "ENSERVICESOBJECT.BASISTYPE";
	public static final String contragentPosition_Attr = "contragentPosition";
	public static final String contragentPosition_Field = "CONTRAGENTPOSITION";
	public static final String contragentPosition_QFielld = "ENSERVICESOBJECT.CONTRAGENTPOSITION";
	public static final String executeWorkDate_Attr = "executeWorkDate";
	public static final String executeWorkDate_Field = "EXECUTEWORKDATE";
	public static final String executeWorkDate_QFielld = "ENSERVICESOBJECT.EXECUTEWORKDATE";
	public static final String timeStart_Attr = "timeStart";
	public static final String timeStart_Field = "TIMESTART";
	public static final String timeStart_QFielld = "ENSERVICESOBJECT.TIMESTART";
	public static final String timeFinal_Attr = "timeFinal";
	public static final String timeFinal_Field = "TIMEFINAL";
	public static final String timeFinal_QFielld = "ENSERVICESOBJECT.TIMEFINAL";
	public static final String contragentPhoneNumber_Attr = "contragentPhoneNumber";
	public static final String contragentPhoneNumber_Field = "CONTRAGENTPHONENUMBER";
	public static final String contragentPhoneNumber_QFielld = "ENSERVICESOBJECT.CONTRAGENTPHONENUMBER";
	public static final String executorPhoneNumber_Attr = "executorPhoneNumber";
	public static final String executorPhoneNumber_Field = "EXECUTORPHONENUMBER";
	public static final String executorPhoneNumber_QFielld = "ENSERVICESOBJECT.EXECUTORPHONENUMBER";
	public static final String contragentObjectWork_Attr = "contragentObjectWork";
	public static final String contragentObjectWork_Field = "CONTRAGENTOBJECTWORK";
	public static final String contragentObjectWork_QFielld = "ENSERVICESOBJECT.CONTRAGENTOBJECTWORK";
	public static final String isNoPay_Attr = "isNoPay";
	public static final String isNoPay_Field = "ISNOPAY";
	public static final String isNoPay_QFielld = "ENSERVICESOBJECT.ISNOPAY";
	public static final String isCustomerMaterials_Attr = "isCustomerMaterials";
	public static final String isCustomerMaterials_Field = "ISCUSTOMERMATERIALS";
	public static final String isCustomerMaterials_QFielld = "ENSERVICESOBJECT.ISCUSTOMERMATERIALS";
	public static final String payDate_Attr = "payDate";
	public static final String payDate_Field = "PAYDATE";
	public static final String payDate_QFielld = "ENSERVICESOBJECT.PAYDATE";
	public static final String finPayFormCode_Attr = "finPayFormCode";
	public static final String finPayFormCode_Field = "FINPAYFORMCODE";
	public static final String finPayFormCode_QFielld = "ENSERVICESOBJECT.FINPAYFORMCODE";
	public static final String finPayFormName_Attr = "finPayFormName";
	public static final String finPayFormName_Field = "FINPAYFORMNAME";
	public static final String finPayFormName_QFielld = "ENSERVICESOBJECT.FINPAYFORMNAME";
	public static final String partnerId_Attr = "partnerId";
	public static final String partnerId_Field = "PARTNERID";
	public static final String partnerId_QFielld = "ENSERVICESOBJECT.PARTNERID";
	public static final String payDetail_Attr = "payDetail";
	public static final String payDetail_Field = "PAYDETAIL";
	public static final String payDetail_QFielld = "ENSERVICESOBJECT.PAYDETAIL";
	public static final String actTransferNumber_Attr = "actTransferNumber";
	public static final String actTransferNumber_Field = "ACTTRANSFERNUMBER";
	public static final String actTransferNumber_QFielld = "ENSERVICESOBJECT.ACTTRANSFERNUMBER";
	public static final String actTransferDate_Attr = "actTransferDate";
	public static final String actTransferDate_Field = "ACTTRANSFERDATE";
	public static final String actTransferDate_QFielld = "ENSERVICESOBJECT.ACTTRANSFERDATE";
	public static final String resposible_Attr = "resposible";
	public static final String resposible_Field = "RESPOSIBLE";
	public static final String resposible_QFielld = "ENSERVICESOBJECT.RESPOSIBLE";
	public static final String resposiblePosition_Attr = "resposiblePosition";
	public static final String resposiblePosition_Field = "RESPOSIBLEPOSITION";
	public static final String resposiblePosition_QFielld = "ENSERVICESOBJECT.RESPOSIBLEPOSITION";
	public static final String resposibleTabNumber_Attr = "resposibleTabNumber";
	public static final String resposibleTabNumber_Field = "RESPOSIBLETABNUMBER";
	public static final String resposibleTabNumber_QFielld = "ENSERVICESOBJECT.RESPOSIBLETABNUMBER";
	public static final String prevContractStatus_Attr = "prevContractStatus";
	public static final String prevContractStatus_Field = "PREVCONTRACTSTATUS";
	public static final String prevContractStatus_QFielld = "ENSERVICESOBJECT.PREVCONTRACTSTATUS";
	public static final String reconnectionTU_Attr = "reconnectionTU";
	public static final String reconnectionTU_Field = "RECONNECTIONTU";
	public static final String reconnectionTU_QFielld = "ENSERVICESOBJECT.RECONNECTIONTU";
	public static final String personalAccountCode_Attr = "personalAccountCode";
	public static final String personalAccountCode_Field = "PERSONALACCOUNTCODE";
	public static final String personalAccountCode_QFielld = "ENSERVICESOBJECT.PERSONALACCOUNTCODE";
	public static final String personalAccountNumber_Attr = "personalAccountNumber";
	public static final String personalAccountNumber_Field = "PERSONALACCOUNTNUMBER";
	public static final String personalAccountNumber_QFielld = "ENSERVICESOBJECT.PERSONALACCOUNTNUMBER";
	public static final String tabNumber_Attr = "tabNumber";
	public static final String tabNumber_Field = "TABNUMBER";
	public static final String tabNumber_QFielld = "ENSERVICESOBJECT.TABNUMBER";
	public static final String citiesList_Attr = "citiesList";
	public static final String citiesList_Field = "CITIESLIST";
	public static final String citiesList_QFielld = "ENSERVICESOBJECT.CITIESLIST";
	public static final String lineLength_Attr = "lineLength";
	public static final String lineLength_Field = "LINELENGTH";
	public static final String lineLength_QFielld = "ENSERVICESOBJECT.LINELENGTH";
	public static final String projectCode_Attr = "projectCode";
	public static final String projectCode_Field = "PROJECTCODE";
	public static final String projectCode_QFielld = "ENSERVICESOBJECT.PROJECTCODE";
	public static final String domain_info_Attr = "domain_info";
	public static final String domain_info_Field = "DOMAIN_INFO";
	public static final String domain_info_QFielld = "ENSERVICESOBJECT.DOMAIN_INFO";
	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "ENSERVICESOBJECT.MODIFY_TIME";
	public static final String cnPackCode_Attr = "cnPackCode";
	public static final String cnPackCode_Field = "CNPACKCODE";
	public static final String cnPackCode_QFielld = "ENSERVICESOBJECT.CNPACKCODE";
	public static final String dfPackCode_Attr = "dfPackCode";
	public static final String dfPackCode_Field = "DFPACKCODE";
	public static final String dfPackCode_QFielld = "ENSERVICESOBJECT.DFPACKCODE";
	public static final String countersZoneType_Attr = "countersZoneType";
	public static final String countersZoneType_Field = "COUNTERSZONETYPE";
	public static final String countersZoneType_QFielld = "ENSERVICESOBJECT.COUNTERSZONETYPE";
	public static final String axPartnerCode_Attr = "axPartnerCode";
	public static final String axPartnerCode_Field = "AXPARTNERCODE";
	public static final String axPartnerCode_QFielld = "ENSERVICESOBJECT.AXPARTNERCODE";
	public static final String axPartnerName_Attr = "axPartnerName";
	public static final String axPartnerName_Field = "AXPARTNERNAME";
	public static final String axPartnerName_QFielld = "ENSERVICESOBJECT.AXPARTNERNAME";
	public static final String axContractNumber_Attr = "axContractNumber";
	public static final String axContractNumber_Field = "AXCONTRACTNUMBER";
	public static final String axContractNumber_QFielld = "ENSERVICESOBJECT.AXCONTRACTNUMBER";
	public static final String axContractDate_Attr = "axContractDate";
	public static final String axContractDate_Field = "AXCONTRACTDATE";
	public static final String axContractDate_QFielld = "ENSERVICESOBJECT.AXCONTRACTDATE";
	public static final String axContractCode_Attr = "axContractCode";
	public static final String axContractCode_Field = "AXCONTRACTCODE";
	public static final String axContractCode_QFielld = "ENSERVICESOBJECT.AXCONTRACTCODE";
	public static final String axContractId_Attr = "axContractId";
	public static final String axContractId_Field = "AXCONTRACTID";
	public static final String axContractId_QFielld = "ENSERVICESOBJECT.AXCONTRACTID";
	public static final String axContractCommentGen_Attr = "axContractCommentGen";
	public static final String axContractCommentGen_Field = "AXCONTRACTCOMMENTGEN";
	public static final String axContractCommentGen_QFielld = "ENSERVICESOBJECT.AXCONTRACTCOMMENTGEN";
	public static final String projAgreeSumma_Attr = "projAgreeSumma";
	public static final String projAgreeSumma_Field = "PROJAGREESUMMA";
	public static final String projAgreeSumma_QFielld = "ENSERVICESOBJECT.PROJAGREESUMMA";
	public static final String topographySumma_Attr = "topographySumma";
	public static final String topographySumma_Field = "TOPOGRAPHYSUMMA";
	public static final String topographySumma_QFielld = "ENSERVICESOBJECT.TOPOGRAPHYSUMMA";
	public static final String createdFromSite_Attr = "createdFromSite";
	public static final String createdFromSite_Field = "CREATEDFROMSITE";
	public static final String createdFromSite_QFielld = "ENSERVICESOBJECT.CREATEDFROMSITE";
	public static final String term_Attr = "term";
	public static final String term_Field = "TERM";
	public static final String term_QFielld = "ENSERVICESOBJECT.TERM";
	public static final String regulation_Attr = "regulation";
	public static final String regulation_Field = "REGULATION";
	public static final String regulation_QFielld = "ENSERVICESOBJECT.REGULATION";
	public static final String boundaryDateWork_Attr = "boundaryDateWork";
	public static final String boundaryDateWork_Field = "BOUNDARYDATEWORK";
	public static final String boundaryDateWork_QFielld = "ENSERVICESOBJECT.BOUNDARYDATEWORK";
	public static final String countDayDelay_Attr = "countDayDelay";
	public static final String countDayDelay_Field = "COUNTDAYDELAY";
	public static final String countDayDelay_QFielld = "ENSERVICESOBJECT.COUNTDAYDELAY";
	public static final String factDateWork_Attr = "factDateWork";
	public static final String factDateWork_Field = "FACTDATEWORK";
	public static final String factDateWork_QFielld = "ENSERVICESOBJECT.FACTDATEWORK";
	public static final String calcSumsByCalculations_Attr = "calcSumsByCalculations";
	public static final String calcSumsByCalculations_Field = "CALCSUMSBYCALCULATIONS";
	public static final String calcSumsByCalculations_QFielld = "ENSERVICESOBJECT.CALCSUMSBYCALCULATIONS";
	public static final String codeEIC_Attr = "codeEIC";
	public static final String codeEIC_Field = "CODEEIC";
	public static final String codeEIC_QFielld = "ENSERVICESOBJECT.CODEEIC";
	public static final String personalAccountUid_Attr = "personalAccountUid";
	public static final String personalAccountUid_Field = "PERSONALACCOUNTUID";
	public static final String personalAccountUid_QFielld = "ENSERVICESOBJECT.PERSONALACCOUNTUID";
	public static final String customerMailingAddress_Attr = "customerMailingAddress";
	public static final String customerMailingAddress_Field = "CUSTOMERMAILINGADDRESS";
	public static final String customerMailingAddress_QFielld = "ENSERVICESOBJECT.CUSTOMERMAILINGADDRESS";
	public static final String powerGeneration_Attr = "powerGeneration";
	public static final String powerGeneration_Field = "POWERGENERATION";
	public static final String powerGeneration_QFielld = "ENSERVICESOBJECT.POWERGENERATION";
	public static final String postCode_Attr = "postCode";
	public static final String postCode_Field = "POSTCODE";
	public static final String postCode_QFielld = "ENSERVICESOBJECT.POSTCODE";
    public static final String customerEmail_Attr = "customerEmail";
    public static final String customerEmail_Field = "CUSTOMEREMAIL";
    public static final String customerEmail_QFielld = "ENSERVICESOBJECT.CUSTOMEREMAIL";
    public static final String demographicCode_Attr = "demographicCode";
    public static final String demographicCode_Field = "DEMOGRAPHICCODE";
    public static final String demographicCode_QFielld = "ENSERVICESOBJECT.DEMOGRAPHICCODE";
    public static final String ownershipRecordNumber_Attr = "ownershipRecordNumber";
    public static final String ownershipRecordNumber_Field = "OWNERSHIPRECORDNUMBER";
    public static final String ownershipRecordNumber_QFielld = "ENSERVICESOBJECT.OWNERSHIPRECORDNUMBER";
    public static final String realEstateRegNumber_Attr = "realEstateRegNumber";
    public static final String realEstateRegNumber_Field = "REALESTATEREGNUMBER";
    public static final String realEstateRegNumber_QFielld = "ENSERVICESOBJECT.REALESTATEREGNUMBER";

	public static final String department_Attr = "department";
	public static final String department_Field = "DEPARTMENTCODE";
	public static final String department_QFielld = "ENSERVICESOBJECT.DEPARTMENTCODE";
	public static final String element_Attr = "element";
	public static final String element_Field = "ELEMENTCODE";
	public static final String element_QFielld = "ENSERVICESOBJECT.ELEMENTCODE";
	public static final String contractStatusRef_Attr = "contractStatusRef";
	public static final String contractStatusRef_Field = "CONTRACTSTATUSREFCODE";
	public static final String contractStatusRef_QFielld = "ENSERVICESOBJECT.CONTRACTSTATUSREFCODE";
	public static final String contractTypeRef_Attr = "contractTypeRef";
	public static final String contractTypeRef_Field = "CONTRACTTYPEREFCODE";
	public static final String contractTypeRef_QFielld = "ENSERVICESOBJECT.CONTRACTTYPEREFCODE";
	public static final String contragentTypeRef_Attr = "contragentTypeRef";
	public static final String contragentTypeRef_Field = "CONTRAGENTTYPEREFCODE";
	public static final String contragentTypeRef_QFielld = "ENSERVICESOBJECT.CONTRAGENTTYPEREFCODE";
	public static final String billStatusRef_Attr = "billStatusRef";
	public static final String billStatusRef_Field = "BILLSTATUSREFCODE";
	public static final String billStatusRef_QFielld = "ENSERVICESOBJECT.BILLSTATUSREFCODE";
	public static final String warrantRef_Attr = "warrantRef";
	public static final String warrantRef_Field = "WARRANTREFCODE";
	public static final String warrantRef_QFielld = "ENSERVICESOBJECT.WARRANTREFCODE";
	public static final String statusRef_Attr = "statusRef";
	public static final String statusRef_Field = "STATUSREFCODE";
	public static final String statusRef_QFielld = "ENSERVICESOBJECT.STATUSREFCODE";
	public static final String techConObjects_Attr = "techConObjects";
	public static final String techConObjects_Field = "TECHCONOBJECTSCODE";
	public static final String techConObjects_QFielld = "ENSERVICESOBJECT.TECHCONOBJECTSCODE";
	public static final String contractKindRef_Attr = "contractKindRef";
	public static final String contractKindRef_Field = "CONTRACTKINDREFCODE";
	public static final String contractKindRef_QFielld = "ENSERVICESOBJECT.CONTRACTKINDREFCODE";
	public static final String cnSubsystemTypeRef_Attr = "cnSubsystemTypeRef";
	public static final String cnSubsystemTypeRef_Field = "CNSUBSYSTEMTYPEREFCODE";
	public static final String cnSubsystemTypeRef_QFielld = "ENSERVICESOBJECT.CNSUBSYSTEMTYPEREFCODE";
	public static final String calcTypeRef_Attr = "calcTypeRef";
	public static final String calcTypeRef_Field = "CALCTYPEREFCODE";
	public static final String calcTypeRef_QFielld = "ENSERVICESOBJECT.CALCTYPEREFCODE";
	public static final String siteRef_Attr = "siteRef";
	public static final String siteRef_Field = "SITEREFCODE";
	public static final String siteRef_QFielld = "ENSERVICESOBJECT.SITEREFCODE";
	public static final String generalContractRef_Attr = "generalContractRef";
	public static final String generalContractRef_Field = "GENERALCONTRACTREFCODE";
	public static final String generalContractRef_QFielld = "ENSERVICESOBJECT.GENERALCONTRACTREFCODE";
	public static final String actIncomeCreatMetodRef_Attr = "actIncomeCreatMetodRef";
	public static final String actIncomeCreatMetodRef_Field = "ACTINCOMECREATMETDRFCD";
	public static final String actIncomeCreatMetodRef_QFielld = "ENSERVICESOBJECT.ACTINCOMECREATMETDRFCD";

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

	public String getDomain_info() {
		return domain_info;
	}

	public void setDomain_info(String domain_info) {
		this.domain_info = domain_info;
	}

	public long getModify_time() {
		return modify_time;
	}

	public void setModify_time(long modify_time) {
		this.modify_time = modify_time;
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

	public Boolean getCalcSumsByCalculations() {
		return calcSumsByCalculations;
	}

	public void setCalcSumsByCalculations(Boolean calcSumsByCalculations) {
		this.calcSumsByCalculations = calcSumsByCalculations;
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


    public String getCustomerEmail(){
       return customerEmail;
    }
    
    public void setCustomerEmail(String customerEmail){
       this.customerEmail = customerEmail;
    } 

public String getDemographicCode(){
       return demographicCode;
    }
    
    public void setDemographicCode(String demographicCode){
       this.demographicCode = demographicCode;
    }


    public String getOwnershipRecordNumber(){
       return ownershipRecordNumber;
    }
    
    public void setOwnershipRecordNumber(String ownershipRecordNumber){
       this.ownershipRecordNumber = ownershipRecordNumber;
    }


    public String getRealEstateRegNumber(){
       return realEstateRegNumber;
    }
    
    public void setRealEstateRegNumber(String realEstateRegNumber){
       this.realEstateRegNumber = realEstateRegNumber;
    }

	public ENDepartment getDepartment() {
		return department;
	}

	public void setDepartment(ENDepartment department) {
		this.department = department;
	}

	public ENElement getElement() {
		return element;
	}

	public void setElement(ENElement element) {
		this.element = element;
	}

	public ENServicesContractStatusRef getContractStatusRef() {
		return contractStatusRef;
	}

	public void setContractStatusRef(ENServicesContractStatusRef contractStatusRef) {
		this.contractStatusRef = contractStatusRef;
	}

	public ENServicesContractTypeRef getContractTypeRef() {
		return contractTypeRef;
	}

	public void setContractTypeRef(ENServicesContractTypeRef contractTypeRef) {
		this.contractTypeRef = contractTypeRef;
	}

	public ENServicesContragentTypeRef getContragentTypeRef() {
		return contragentTypeRef;
	}

	public void setContragentTypeRef(ENServicesContragentTypeRef contragentTypeRef) {
		this.contragentTypeRef = contragentTypeRef;
	}

	public ENServicesBillStatusRef getBillStatusRef() {
		return billStatusRef;
	}

	public void setBillStatusRef(ENServicesBillStatusRef billStatusRef) {
		this.billStatusRef = billStatusRef;
	}

	public ENWarrantRef getWarrantRef() {
		return warrantRef;
	}

	public void setWarrantRef(ENWarrantRef warrantRef) {
		this.warrantRef = warrantRef;
	}

	public ENServicesObjectStatusRef getStatusRef() {
		return statusRef;
	}

	public void setStatusRef(ENServicesObjectStatusRef statusRef) {
		this.statusRef = statusRef;
	}

	public ENTechConditionsObjects getTechConObjects() {
		return techConObjects;
	}

	public void setTechConObjects(ENTechConditionsObjects techConObjects) {
		this.techConObjects = techConObjects;
	}

	public ENServicesContractKindRef getContractKindRef() {
		return contractKindRef;
	}

	public void setContractKindRef(ENServicesContractKindRef contractKindRef) {
		this.contractKindRef = contractKindRef;
	}

	public CNSubsystemTypeRef getCnSubsystemTypeRef() {
		return cnSubsystemTypeRef;
	}

	public void setCnSubsystemTypeRef(CNSubsystemTypeRef cnSubsystemTypeRef) {
		this.cnSubsystemTypeRef = cnSubsystemTypeRef;
	}

	public ENServicesObjectCalcTypeRef getCalcTypeRef() {
		return calcTypeRef;
	}

	public void setCalcTypeRef(ENServicesObjectCalcTypeRef calcTypeRef) {
		this.calcTypeRef = calcTypeRef;
	}

	public ENSiteRef getSiteRef() {
		return siteRef;
	}

	public void setSiteRef(ENSiteRef siteRef) {
		this.siteRef = siteRef;
	}

	public ENGeneralContractsRef getGeneralContractRef() {
		return generalContractRef;
	}

	public void setGeneralContractRef(ENGeneralContractsRef generalContractRef) {
		this.generalContractRef = generalContractRef;
	}

	public ENActIncomeCreatMetodRef getActIncomeCreatMetodRef() {
		return actIncomeCreatMetodRef;
	}

	public void setActIncomeCreatMetodRef(ENActIncomeCreatMetodRef actIncomeCreatMetodRef) {
		this.actIncomeCreatMetodRef = actIncomeCreatMetodRef;
	}

	public BigDecimal getTension_point() {
		return tension_point;
	}

	public void setTension_point(BigDecimal tension_point) {
		this.tension_point = tension_point;
	}

	public int getBaseStation() {
		return baseStation;
	}

	public void setBaseStation(int baseStation) {
		this.baseStation = baseStation;
	}

	public String getAxContractAccount() {
		return axContractAccount;
	}

	public void setAxContractAccount(String axContractAccount) {
		this.axContractAccount = axContractAccount;
	}

	public int getIsActive() {
		return isActive;
	}

	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}


} // end of ENServicesObjectValueObject
