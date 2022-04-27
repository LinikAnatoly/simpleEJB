//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENTechConditionsServices;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.CNSubsystemTypeRef;
import com.ksoe.energynet.valueobject.references.ENConnectionCalcTypeRef;
import com.ksoe.energynet.valueobject.references.ENConnectionKindRef;
import com.ksoe.energynet.valueobject.references.ENConnectionTariffEntryRef;
import com.ksoe.energynet.valueobject.references.ENGeneralContractsRef;
import com.ksoe.energynet.valueobject.references.ENTechCondResponsiblesRef;
import com.ksoe.energynet.valueobject.references.ENTechContragentTypeRef;
import com.ksoe.energynet.valueobject.references.ENWarrantRef;
import com.ksoe.netobjects.valueobject.references.ENLine04Ref;
import com.ksoe.netobjects.valueobject.references.ENLine10Ref;
import com.ksoe.netobjects.valueobject.references.ENLine150Ref;
import com.ksoe.netobjects.valueobject.references.ENLineCableRef;
import com.ksoe.netobjects.valueobject.references.ENSubstation04Ref;
import com.ksoe.netobjects.valueobject.references.ENSubstation150Ref;
import com.ksoe.netobjects.valueobject.references.ENTransformerRef;

public class ENTechConditionsServices implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String contractNumber;
	public Date contractDate;
	public String finContractNumber;
	public Date finContractDate;
	public String partnerName;
	public String partnerCode;
	public String finDocCode;
	public int finDocID = Integer.MIN_VALUE;
	public String finCommentGen;
	public BigDecimal tySummaGen;
	public BigDecimal tySummaVat;
	public BigDecimal tyServicesSumma;
	public BigDecimal tyServicesPower;
	public String commentServicesGen;
	public String userGen;
	public Date dateEdit;
	public int cnPackCode = Integer.MIN_VALUE;
	public String executionTerm;
	public int buildersArea = Integer.MIN_VALUE;
	public int baseStation = Integer.MIN_VALUE;
	public int smallArchFrm = Integer.MIN_VALUE;
	public Date contractDateFinal;
	public int isSea = Integer.MIN_VALUE;
	public int isDisconnectionNeeded = Integer.MIN_VALUE;
	public int isUse2Tariffs = Integer.MIN_VALUE;
	public String domain_info;
	public long modify_time = Long.MIN_VALUE;
	public ENElement element = new ENElement();
	public ENDepartment department = new ENDepartment();
	public ENWarrantRef warrantRef = new ENWarrantRef();
	public ENTechConditionsServicesStatus techCondServicesStatus = new ENTechConditionsServicesStatus();
	public ENTechConditionsServicesType techCondServicesType = new ENTechConditionsServicesType();
	public ENTechContragentForm contragentForm = new ENTechContragentForm();
	public ENTechCondResponsiblesRef techCondResponsiblesRef = new ENTechCondResponsiblesRef();
	public CNSubsystemTypeRef cnSubsystemTypeRef = new CNSubsystemTypeRef();
	public ENTechContragentTypeRef contragentTypeRef = new ENTechContragentTypeRef();
	public ENConnectionKindRef connectionKindRef = new ENConnectionKindRef();
	public ENConnectionTariffEntryRef tariffEntryRef = new ENConnectionTariffEntryRef();
	public ENConnectionCalcTypeRef calcTypeRef = new ENConnectionCalcTypeRef();
	public ENGeneralContractsRef generalContractRef = new ENGeneralContractsRef();
	public ENLine04Ref airLine04Ref = new ENLine04Ref();
	public ENLineCableRef cableLine04Ref = new ENLineCableRef();
	public ENTransformerRef trRef = new ENTransformerRef();
	public ENSubstation04Ref s04Ref = new ENSubstation04Ref();
	public ENLine10Ref airLine10Ref = new ENLine10Ref();
	public ENLineCableRef cableLine10Ref = new ENLineCableRef();
	public ENSubstation150Ref s35Ref = new ENSubstation150Ref();
	public ENLine150Ref airLine150Ref = new ENLine150Ref();
	public ENLineCableRef cableLine150Ref = new ENLineCableRef();
	public ENSubstation150Ref s150Ref = new ENSubstation150Ref();
	public static final String tableName = "ENTECHCONDITIONSSERVCS";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENTECHCONDITIONSSERVCS.CODE";
	public static final String contractNumber_Attr = "contractNumber";
	public static final String contractNumber_Field = "CONTRACTNUMBER";
	public static final String contractNumber_QFielld = "ENTECHCONDITIONSSERVCS.CONTRACTNUMBER";
	public static final String contractDate_Attr = "contractDate";
	public static final String contractDate_Field = "CONTRACTDATE";
	public static final String contractDate_QFielld = "ENTECHCONDITIONSSERVCS.CONTRACTDATE";
	public static final String finContractNumber_Attr = "finContractNumber";
	public static final String finContractNumber_Field = "FINCONTRACTNUMBER";
	public static final String finContractNumber_QFielld = "ENTECHCONDITIONSSERVCS.FINCONTRACTNUMBER";
	public static final String finContractDate_Attr = "finContractDate";
	public static final String finContractDate_Field = "FINCONTRACTDATE";
	public static final String finContractDate_QFielld = "ENTECHCONDITIONSSERVCS.FINCONTRACTDATE";
	public static final String partnerName_Attr = "partnerName";
	public static final String partnerName_Field = "PARTNERNAME";
	public static final String partnerName_QFielld = "ENTECHCONDITIONSSERVCS.PARTNERNAME";
	public static final String partnerCode_Attr = "partnerCode";
	public static final String partnerCode_Field = "PARTNERCODE";
	public static final String partnerCode_QFielld = "ENTECHCONDITIONSSERVCS.PARTNERCODE";
	public static final String finDocCode_Attr = "finDocCode";
	public static final String finDocCode_Field = "FINDOCCODE";
	public static final String finDocCode_QFielld = "ENTECHCONDITIONSSERVCS.FINDOCCODE";
	public static final String finDocID_Attr = "finDocID";
	public static final String finDocID_Field = "FINDOCID";
	public static final String finDocID_QFielld = "ENTECHCONDITIONSSERVCS.FINDOCID";
	public static final String finCommentGen_Attr = "finCommentGen";
	public static final String finCommentGen_Field = "FINCOMMENTGEN";
	public static final String finCommentGen_QFielld = "ENTECHCONDITIONSSERVCS.FINCOMMENTGEN";
	public static final String tySummaGen_Attr = "tySummaGen";
	public static final String tySummaGen_Field = "TYSUMMAGEN";
	public static final String tySummaGen_QFielld = "ENTECHCONDITIONSSERVCS.TYSUMMAGEN";
	public static final String tySummaVat_Attr = "tySummaVat";
	public static final String tySummaVat_Field = "TYSUMMAVAT";
	public static final String tySummaVat_QFielld = "ENTECHCONDITIONSSERVCS.TYSUMMAVAT";
	public static final String tyServicesSumma_Attr = "tyServicesSumma";
	public static final String tyServicesSumma_Field = "TYSERVICESSUMMA";
	public static final String tyServicesSumma_QFielld = "ENTECHCONDITIONSSERVCS.TYSERVICESSUMMA";
	public static final String tyServicesPower_Attr = "tyServicesPower";
	public static final String tyServicesPower_Field = "TYSERVICESPOWER";
	public static final String tyServicesPower_QFielld = "ENTECHCONDITIONSSERVCS.TYSERVICESPOWER";
	public static final String commentServicesGen_Attr = "commentServicesGen";
	public static final String commentServicesGen_Field = "COMMENTSERVICESGEN";
	public static final String commentServicesGen_QFielld = "ENTECHCONDITIONSSERVCS.COMMENTSERVICESGEN";
	public static final String userGen_Attr = "userGen";
	public static final String userGen_Field = "USERGEN";
	public static final String userGen_QFielld = "ENTECHCONDITIONSSERVCS.USERGEN";
	public static final String dateEdit_Attr = "dateEdit";
	public static final String dateEdit_Field = "DATEEDIT";
	public static final String dateEdit_QFielld = "ENTECHCONDITIONSSERVCS.DATEEDIT";
	public static final String cnPackCode_Attr = "cnPackCode";
	public static final String cnPackCode_Field = "CNPACKCODE";
	public static final String cnPackCode_QFielld = "ENTECHCONDITIONSSERVCS.CNPACKCODE";
	public static final String executionTerm_Attr = "executionTerm";
	public static final String executionTerm_Field = "EXECUTIONTERM";
	public static final String executionTerm_QFielld = "ENTECHCONDITIONSSERVCS.EXECUTIONTERM";
	public static final String buildersArea_Attr = "buildersArea";
	public static final String buildersArea_Field = "BUILDERSAREA";
	public static final String buildersArea_QFielld = "ENTECHCONDITIONSSERVCS.BUILDERSAREA";
	public static final String baseStation_Attr = "baseStation";
	public static final String baseStation_Field = "BASESTATION";
	public static final String baseStation_QFielld = "ENTECHCONDITIONSSERVCS.BASESTATION";
	public static final String smallArchFrm_Attr = "smallArchFrm";
	public static final String smallArchFrm_Field = "SMALLARCHFRM";
	public static final String smallArchFrm_QFielld = "ENTECHCONDITIONSSERVCS.SMALLARCHFRM";
	public static final String contractDateFinal_Attr = "contractDateFinal";
	public static final String contractDateFinal_Field = "CONTRACTDATEFINAL";
	public static final String contractDateFinal_QFielld = "ENTECHCONDITIONSSERVCS.CONTRACTDATEFINAL";
	public static final String isSea_Attr = "isSea";
	public static final String isSea_Field = "ISSEA";
	public static final String isSea_QFielld = "ENTECHCONDITIONSSERVCS.ISSEA";
	public static final String isDisconnectionNeeded_Attr = "isDisconnectionNeeded";
	public static final String isDisconnectionNeeded_Field = "ISDISCONNECTIONNEEDED";
	public static final String isDisconnectionNeeded_QFielld = "ENTECHCONDITIONSSERVCS.ISDISCONNECTIONNEEDED";
	public static final String isUse2Tariffs_Attr = "isUse2Tariffs";
	public static final String isUse2Tariffs_Field = "ISUSE2TARIFFS";
	public static final String isUse2Tariffs_QFielld = "ENTECHCONDITIONSSERVCS.ISUSE2TARIFFS";
	public static final String domain_info_Attr = "domain_info";
	public static final String domain_info_Field = "DOMAIN_INFO";
	public static final String domain_info_QFielld = "ENTECHCONDITIONSSERVCS.DOMAIN_INFO";
	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "ENTECHCONDITIONSSERVCS.MODIFY_TIME";
	public static final String element_Attr = "element";
	public static final String element_Field = "ELEMENTCODE";
	public static final String element_QFielld = "ENTECHCONDITIONSSERVCS.ELEMENTCODE";
	public static final String department_Attr = "department";
	public static final String department_Field = "DEPARTMENTCODE";
	public static final String department_QFielld = "ENTECHCONDITIONSSERVCS.DEPARTMENTCODE";
	public static final String warrantRef_Attr = "warrantRef";
	public static final String warrantRef_Field = "WARRANTREFCODE";
	public static final String warrantRef_QFielld = "ENTECHCONDITIONSSERVCS.WARRANTREFCODE";
	public static final String techCondServicesStatus_Attr = "techCondServicesStatus";
	public static final String techCondServicesStatus_Field = "TECHCONDSERVICESSTTSCD";
	public static final String techCondServicesStatus_QFielld = "ENTECHCONDITIONSSERVCS.TECHCONDSERVICESSTTSCD";
	public static final String techCondServicesType_Attr = "techCondServicesType";
	public static final String techCondServicesType_Field = "TECHCONDSERVICESTYPECD";
	public static final String techCondServicesType_QFielld = "ENTECHCONDITIONSSERVCS.TECHCONDSERVICESTYPECD";
	public static final String contragentForm_Attr = "contragentForm";
	public static final String contragentForm_Field = "CONTRAGENTFORMCODE";
	public static final String contragentForm_QFielld = "ENTECHCONDITIONSSERVCS.CONTRAGENTFORMCODE";
	public static final String techCondResponsiblesRef_Attr = "techCondResponsiblesRef";
	public static final String techCondResponsiblesRef_Field = "TECHCONDRESPONSBLSRFCD";
	public static final String techCondResponsiblesRef_QFielld = "ENTECHCONDITIONSSERVCS.TECHCONDRESPONSBLSRFCD";
	public static final String cnSubsystemTypeRef_Attr = "cnSubsystemTypeRef";
	public static final String cnSubsystemTypeRef_Field = "CNSUBSYSTEMTYPEREFCODE";
	public static final String cnSubsystemTypeRef_QFielld = "ENTECHCONDITIONSSERVCS.CNSUBSYSTEMTYPEREFCODE";
	public static final String contragentTypeRef_Attr = "contragentTypeRef";
	public static final String contragentTypeRef_Field = "CONTRAGENTTYPEREFCODE";
	public static final String contragentTypeRef_QFielld = "ENTECHCONDITIONSSERVCS.CONTRAGENTTYPEREFCODE";
	public static final String connectionKindRef_Attr = "connectionKindRef";
	public static final String connectionKindRef_Field = "CONNECTIONKINDREFCODE";
	public static final String connectionKindRef_QFielld = "ENTECHCONDITIONSSERVCS.CONNECTIONKINDREFCODE";
	public static final String tariffEntryRef_Attr = "tariffEntryRef";
	public static final String tariffEntryRef_Field = "TARIFFENTRYREFCODE";
	public static final String tariffEntryRef_QFielld = "ENTECHCONDITIONSSERVCS.TARIFFENTRYREFCODE";
	public static final String calcTypeRef_Attr = "calcTypeRef";
	public static final String calcTypeRef_Field = "CALCTYPEREFCODE";
	public static final String calcTypeRef_QFielld = "ENTECHCONDITIONSSERVCS.CALCTYPEREFCODE";
	public static final String generalContractRef_Attr = "generalContractRef";
	public static final String generalContractRef_Field = "GENERALCONTRACTREFCODE";
	public static final String generalContractRef_QFielld = "ENTECHCONDITIONSSERVCS.GENERALCONTRACTREFCODE";
	public static final String airLine04Ref_Attr = "airLine04Ref";
	public static final String airLine04Ref_Field = "AIRLINE04REFCODE";
	public static final String airLine04Ref_QFielld = "ENTECHCONDITIONSSERVCS.AIRLINE04REFCODE";
	public static final String cableLine04Ref_Attr = "cableLine04Ref";
	public static final String cableLine04Ref_Field = "CABLELINE04REFCODE";
	public static final String cableLine04Ref_QFielld = "ENTECHCONDITIONSSERVCS.CABLELINE04REFCODE";
	public static final String trRef_Attr = "trRef";
	public static final String trRef_Field = "TRREFCODE";
	public static final String trRef_QFielld = "ENTECHCONDITIONSSERVCS.TRREFCODE";
	public static final String s04Ref_Attr = "s04Ref";
	public static final String s04Ref_Field = "S04REFCODE";
	public static final String s04Ref_QFielld = "ENTECHCONDITIONSSERVCS.S04REFCODE";
	public static final String airLine10Ref_Attr = "airLine10Ref";
	public static final String airLine10Ref_Field = "AIRLINE10REFCODE";
	public static final String airLine10Ref_QFielld = "ENTECHCONDITIONSSERVCS.AIRLINE10REFCODE";
	public static final String cableLine10Ref_Attr = "cableLine10Ref";
	public static final String cableLine10Ref_Field = "CABLELINE10REFCODE";
	public static final String cableLine10Ref_QFielld = "ENTECHCONDITIONSSERVCS.CABLELINE10REFCODE";
	public static final String s35Ref_Attr = "s35Ref";
	public static final String s35Ref_Field = "S35REFCODE";
	public static final String s35Ref_QFielld = "ENTECHCONDITIONSSERVCS.S35REFCODE";
	public static final String airLine150Ref_Attr = "airLine150Ref";
	public static final String airLine150Ref_Field = "AIRLINE150REFCODE";
	public static final String airLine150Ref_QFielld = "ENTECHCONDITIONSSERVCS.AIRLINE150REFCODE";
	public static final String cableLine150Ref_Attr = "cableLine150Ref";
	public static final String cableLine150Ref_Field = "CABLELINE150REFCODE";
	public static final String cableLine150Ref_QFielld = "ENTECHCONDITIONSSERVCS.CABLELINE150REFCODE";
	public static final String s150Ref_Attr = "s150Ref";
	public static final String s150Ref_Field = "S150REFCODE";
	public static final String s150Ref_QFielld = "ENTECHCONDITIONSSERVCS.S150REFCODE";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setContractNumber(String aValue) {
		contractNumber = aValue;
	}

	public String getContractNumber() {
		return contractNumber;
	}

	public void setContractDate(Date aValue) {
		contractDate = aValue;
	}

	public Date getContractDate() {
		return contractDate;
	}

	public void setFinContractNumber(String aValue) {
		finContractNumber = aValue;
	}

	public String getFinContractNumber() {
		return finContractNumber;
	}

	public void setFinContractDate(Date aValue) {
		finContractDate = aValue;
	}

	public Date getFinContractDate() {
		return finContractDate;
	}

	public void setPartnerName(String aValue) {
		partnerName = aValue;
	}

	public String getPartnerName() {
		return partnerName;
	}

	public void setPartnerCode(String aValue) {
		partnerCode = aValue;
	}

	public String getPartnerCode() {
		return partnerCode;
	}

	public void setFinDocCode(String aValue) {
		finDocCode = aValue;
	}

	public String getFinDocCode() {
		return finDocCode;
	}

	public void setFinDocID(int aValue) {
		finDocID = aValue;
	}

	public int getFinDocID() {
		return finDocID;
	}

	public void setFinCommentGen(String aValue) {
		finCommentGen = aValue;
	}

	public String getFinCommentGen() {
		return finCommentGen;
	}

	public void setTySummaGen(BigDecimal aValue) {
		tySummaGen = aValue;
	}

	public BigDecimal getTySummaGen() {
		return tySummaGen;
	}

	public void setTySummaVat(BigDecimal aValue) {
		tySummaVat = aValue;
	}

	public BigDecimal getTySummaVat() {
		return tySummaVat;
	}

	public void setTyServicesSumma(BigDecimal aValue) {
		tyServicesSumma = aValue;
	}

	public BigDecimal getTyServicesSumma() {
		return tyServicesSumma;
	}

	public void setTyServicesPower(BigDecimal aValue) {
		tyServicesPower = aValue;
	}

	public BigDecimal getTyServicesPower() {
		return tyServicesPower;
	}

	public void setCommentServicesGen(String aValue) {
		commentServicesGen = aValue;
	}

	public String getCommentServicesGen() {
		return commentServicesGen;
	}

	public void setUserGen(String aValue) {
		userGen = aValue;
	}

	public String getUserGen() {
		return userGen;
	}

	public void setDateEdit(Date aValue) {
		dateEdit = aValue;
	}

	public Date getDateEdit() {
		return dateEdit;
	}

	public void setCnPackCode(int aValue) {
		cnPackCode = aValue;
	}

	public int getCnPackCode() {
		return cnPackCode;
	}

	public void setExecutionTerm(String aValue) {
		executionTerm = aValue;
	}

	public String getExecutionTerm() {
		return executionTerm;
	}

	public void setBuildersArea(int aValue) {
		buildersArea = aValue;
	}

	public int getBuildersArea() {
		return buildersArea;
	}

	public void setBaseStation(int aValue) {
		baseStation = aValue;
	}

	public int getBaseStation() {
		return baseStation;
	}

	public void setSmallArchFrm(int aValue) {
		smallArchFrm = aValue;
	}

	public int getSmallArchFrm() {
		return smallArchFrm;
	}

	public void setContractDateFinal(Date aValue) {
		contractDateFinal = aValue;
	}

	public Date getContractDateFinal() {
		return contractDateFinal;
	}

	public void setIsSea(int aValue) {
		isSea = aValue;
	}

	public int getIsSea() {
		return isSea;
	}

	public void setIsDisconnectionNeeded(int aValue) {
		isDisconnectionNeeded = aValue;
	}

	public int getIsDisconnectionNeeded() {
		return isDisconnectionNeeded;
	}

	public void setIsUse2Tariffs(int aValue) {
		isUse2Tariffs = aValue;
	}

	public int getIsUse2Tariffs() {
		return isUse2Tariffs;
	}

	public void setDomain_info(String aValue) {
		domain_info = aValue;
	}

	public String getDomain_info() {
		return domain_info;
	}

	public void setModify_time(long aValue) {
		modify_time = aValue;
	}

	public long getModify_time() {
		return modify_time;
	}

	public void setElement(ENElement aValue) {
		element = aValue;
	}

	public ENElement getElement() {
		return element;
	}

	public void setDepartment(ENDepartment aValue) {
		department = aValue;
	}

	public ENDepartment getDepartment() {
		return department;
	}

	public void setWarrantRef(ENWarrantRef aValue) {
		warrantRef = aValue;
	}

	public ENWarrantRef getWarrantRef() {
		return warrantRef;
	}

	public void setTechCondServicesStatus(ENTechConditionsServicesStatus aValue) {
		techCondServicesStatus = aValue;
	}

	public ENTechConditionsServicesStatus getTechCondServicesStatus() {
		return techCondServicesStatus;
	}

	public void setTechCondServicesType(ENTechConditionsServicesType aValue) {
		techCondServicesType = aValue;
	}

	public ENTechConditionsServicesType getTechCondServicesType() {
		return techCondServicesType;
	}

	public void setContragentForm(ENTechContragentForm aValue) {
		contragentForm = aValue;
	}

	public ENTechContragentForm getContragentForm() {
		return contragentForm;
	}

	public void setTechCondResponsiblesRef(ENTechCondResponsiblesRef aValue) {
		techCondResponsiblesRef = aValue;
	}

	public ENTechCondResponsiblesRef getTechCondResponsiblesRef() {
		return techCondResponsiblesRef;
	}

	public void setCnSubsystemTypeRef(CNSubsystemTypeRef aValue) {
		cnSubsystemTypeRef = aValue;
	}

	public CNSubsystemTypeRef getCnSubsystemTypeRef() {
		return cnSubsystemTypeRef;
	}

	public void setContragentTypeRef(ENTechContragentTypeRef aValue) {
		contragentTypeRef = aValue;
	}

	public ENTechContragentTypeRef getContragentTypeRef() {
		return contragentTypeRef;
	}

	public void setConnectionKindRef(ENConnectionKindRef aValue) {
		connectionKindRef = aValue;
	}

	public ENConnectionKindRef getConnectionKindRef() {
		return connectionKindRef;
	}

	public void setTariffEntryRef(ENConnectionTariffEntryRef aValue) {
		tariffEntryRef = aValue;
	}

	public ENConnectionTariffEntryRef getTariffEntryRef() {
		return tariffEntryRef;
	}

	public void setCalcTypeRef(ENConnectionCalcTypeRef aValue) {
		calcTypeRef = aValue;
	}

	public ENConnectionCalcTypeRef getCalcTypeRef() {
		return calcTypeRef;
	}

	public void setGeneralContractRef(ENGeneralContractsRef aValue) {
		generalContractRef = aValue;
	}

	public ENGeneralContractsRef getGeneralContractRef() {
		return generalContractRef;
	}

	public void setAirLine04Ref(ENLine04Ref aValue) {
		airLine04Ref = aValue;
	}

	public ENLine04Ref getAirLine04Ref() {
		return airLine04Ref;
	}

	public void setCableLine04Ref(ENLineCableRef aValue) {
		cableLine04Ref = aValue;
	}

	public ENLineCableRef getCableLine04Ref() {
		return cableLine04Ref;
	}

	public void setTrRef(ENTransformerRef aValue) {
		trRef = aValue;
	}

	public ENTransformerRef getTrRef() {
		return trRef;
	}

	public void setS04Ref(ENSubstation04Ref aValue) {
		s04Ref = aValue;
	}

	public ENSubstation04Ref getS04Ref() {
		return s04Ref;
	}

	public void setAirLine10Ref(ENLine10Ref aValue) {
		airLine10Ref = aValue;
	}

	public ENLine10Ref getAirLine10Ref() {
		return airLine10Ref;
	}

	public void setCableLine10Ref(ENLineCableRef aValue) {
		cableLine10Ref = aValue;
	}

	public ENLineCableRef getCableLine10Ref() {
		return cableLine10Ref;
	}

	public void setS35Ref(ENSubstation150Ref aValue) {
		s35Ref = aValue;
	}

	public ENSubstation150Ref getS35Ref() {
		return s35Ref;
	}

	public void setAirLine150Ref(ENLine150Ref aValue) {
		airLine150Ref = aValue;
	}

	public ENLine150Ref getAirLine150Ref() {
		return airLine150Ref;
	}

	public void setCableLine150Ref(ENLineCableRef aValue) {
		cableLine150Ref = aValue;
	}

	public ENLineCableRef getCableLine150Ref() {
		return cableLine150Ref;
	}

	public void setS150Ref(ENSubstation150Ref aValue) {
		s150Ref = aValue;
	}

	public ENSubstation150Ref getS150Ref() {
		return s150Ref;
	}

} // end of ENTechConditionsServicesValueObject

