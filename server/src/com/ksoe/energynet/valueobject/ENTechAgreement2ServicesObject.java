//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENTechAgreement2ServicesObject;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENGeneralContractsRef;
import com.ksoe.energynet.valueobject.references.ENServicesFromSideObjectRef;
import com.ksoe.energynet.valueobject.references.ENServicesObjectRef;
import com.ksoe.energynet.valueobject.references.ENTechAgr2SOKindRef;
import com.ksoe.energynet.valueobject.references.ENWarrantRef;

public class ENTechAgreement2ServicesObject implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String partnerName;
	public String partnerCode;
	public String partnerOkpo;
	public String bankName;
	public String bankMfo;
	public String bankRSchet;
	public String contractNumber;
	public Date contractDate;
	public String finDocCode;
	public int finDocID = Integer.MIN_VALUE;
	public String commentGen;
	public String objectName;
	public BigDecimal costWorks;
	public BigDecimal costWorksNDS;
	public String basisForAction;
	public String actNumber;
	public Date actDate;
	public String executorTaxType;
	public BigDecimal area;
	public String partnerPosition;
	public String partnerFIO;
    public String  partnerAddress; 
	public String userGen;
	public Date dateEdit;
	public long modify_time = Long.MIN_VALUE;
	public Date contractTerm;
	public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
	public ENWarrantRef agreementWarrantRef = new ENWarrantRef();
	public ENWarrantRef actWarrantRef = new ENWarrantRef();
	public ENServicesFromSideObjectRef servicesFromSideRef = new ENServicesFromSideObjectRef();
	public ENTechAgr2SOKindRef techAgrKindRef = new ENTechAgr2SOKindRef();
	public ENGeneralContractsRef generalContractRef = new ENGeneralContractsRef();
	public static final String tableName = "ENTECHAGRMNT2SRVCSBJCT";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENTECHAGRMNT2SRVCSBJCT.CODE";
	public static final String partnerName_Attr = "partnerName";
	public static final String partnerName_Field = "PARTNERNAME";
	public static final String partnerName_QFielld = "ENTECHAGRMNT2SRVCSBJCT.PARTNERNAME";
	public static final String partnerCode_Attr = "partnerCode";
	public static final String partnerCode_Field = "PARTNERCODE";
	public static final String partnerCode_QFielld = "ENTECHAGRMNT2SRVCSBJCT.PARTNERCODE";
	public static final String partnerOkpo_Attr = "partnerOkpo";
	public static final String partnerOkpo_Field = "PARTNEROKPO";
	public static final String partnerOkpo_QFielld = "ENTECHAGRMNT2SRVCSBJCT.PARTNEROKPO";
	public static final String bankName_Attr = "bankName";
	public static final String bankName_Field = "BANKNAME";
	public static final String bankName_QFielld = "ENTECHAGRMNT2SRVCSBJCT.BANKNAME";
	public static final String bankMfo_Attr = "bankMfo";
	public static final String bankMfo_Field = "BANKMFO";
	public static final String bankMfo_QFielld = "ENTECHAGRMNT2SRVCSBJCT.BANKMFO";
	public static final String bankRSchet_Attr = "bankRSchet";
	public static final String bankRSchet_Field = "BANKRSCHET";
	public static final String bankRSchet_QFielld = "ENTECHAGRMNT2SRVCSBJCT.BANKRSCHET";
	public static final String contractNumber_Attr = "contractNumber";
	public static final String contractNumber_Field = "CONTRACTNUMBER";
	public static final String contractNumber_QFielld = "ENTECHAGRMNT2SRVCSBJCT.CONTRACTNUMBER";
	public static final String contractDate_Attr = "contractDate";
	public static final String contractDate_Field = "CONTRACTDATE";
	public static final String contractDate_QFielld = "ENTECHAGRMNT2SRVCSBJCT.CONTRACTDATE";
	public static final String finDocCode_Attr = "finDocCode";
	public static final String finDocCode_Field = "FINDOCCODE";
	public static final String finDocCode_QFielld = "ENTECHAGRMNT2SRVCSBJCT.FINDOCCODE";
	public static final String finDocID_Attr = "finDocID";
	public static final String finDocID_Field = "FINDOCID";
	public static final String finDocID_QFielld = "ENTECHAGRMNT2SRVCSBJCT.FINDOCID";
	public static final String commentGen_Attr = "commentGen";
	public static final String commentGen_Field = "COMMENTGEN";
	public static final String commentGen_QFielld = "ENTECHAGRMNT2SRVCSBJCT.COMMENTGEN";
	public static final String objectName_Attr = "objectName";
	public static final String objectName_Field = "OBJECTNAME";
	public static final String objectName_QFielld = "ENTECHAGRMNT2SRVCSBJCT.OBJECTNAME";
	public static final String costWorks_Attr = "costWorks";
	public static final String costWorks_Field = "COSTWORKS";
	public static final String costWorks_QFielld = "ENTECHAGRMNT2SRVCSBJCT.COSTWORKS";
	public static final String costWorksNDS_Attr = "costWorksNDS";
	public static final String costWorksNDS_Field = "COSTWORKSNDS";
	public static final String costWorksNDS_QFielld = "ENTECHAGRMNT2SRVCSBJCT.COSTWORKSNDS";
	public static final String basisForAction_Attr = "basisForAction";
	public static final String basisForAction_Field = "BASISFORACTION";
	public static final String basisForAction_QFielld = "ENTECHAGRMNT2SRVCSBJCT.BASISFORACTION";
	public static final String actNumber_Attr = "actNumber";
	public static final String actNumber_Field = "ACTNUMBER";
	public static final String actNumber_QFielld = "ENTECHAGRMNT2SRVCSBJCT.ACTNUMBER";
	public static final String actDate_Attr = "actDate";
	public static final String actDate_Field = "ACTDATE";
	public static final String actDate_QFielld = "ENTECHAGRMNT2SRVCSBJCT.ACTDATE";
	public static final String executorTaxType_Attr = "executorTaxType";
	public static final String executorTaxType_Field = "EXECUTORTAXTYPE";
	public static final String executorTaxType_QFielld = "ENTECHAGRMNT2SRVCSBJCT.EXECUTORTAXTYPE";
	public static final String area_Attr = "area";
	public static final String area_Field = "AREA";
	public static final String area_QFielld = "ENTECHAGRMNT2SRVCSBJCT.AREA";
	public static final String partnerPosition_Attr = "partnerPosition";
	public static final String partnerPosition_Field = "PARTNERPOSITION";
	public static final String partnerPosition_QFielld = "ENTECHAGRMNT2SRVCSBJCT.PARTNERPOSITION";
	public static final String partnerFIO_Attr = "partnerFIO";
	public static final String partnerFIO_Field = "PARTNERFIO";
	public static final String partnerFIO_QFielld = "ENTECHAGRMNT2SRVCSBJCT.PARTNERFIO";
    public static final String partnerAddress_Attr = "partnerAddress";
    public static final String partnerAddress_Field = "PARTNERADDRESS";
    public static final String partnerAddress_QFielld = "ENTECHAGRMNT2SRVCSBJCT.PARTNERADDRESS";
	public static final String userGen_Attr = "userGen";
	public static final String userGen_Field = "USERGEN";
	public static final String userGen_QFielld = "ENTECHAGRMNT2SRVCSBJCT.USERGEN";
	public static final String dateEdit_Attr = "dateEdit";
	public static final String dateEdit_Field = "DATEEDIT";
	public static final String dateEdit_QFielld = "ENTECHAGRMNT2SRVCSBJCT.DATEEDIT";
	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "ENTECHAGRMNT2SRVCSBJCT.MODIFY_TIME";
	public static final String contractTerm_Attr = "contractTerm";
	public static final String contractTerm_Field = "CONTRACTTERM";
	public static final String contractTerm_QFielld = "ENTECHAGRMNT2SRVCSBJCT.CONTRACTTERM";
	public static final String servicesObjectRef_Attr = "servicesObjectRef";
	public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
	public static final String servicesObjectRef_QFielld = "ENTECHAGRMNT2SRVCSBJCT.SERVICESOBJECTREFCODE";
	public static final String agreementWarrantRef_Attr = "agreementWarrantRef";
	public static final String agreementWarrantRef_Field = "AGREEMENTWARRANTREFCOD";
	public static final String agreementWarrantRef_QFielld = "ENTECHAGRMNT2SRVCSBJCT.AGREEMENTWARRANTREFCOD";
	public static final String actWarrantRef_Attr = "actWarrantRef";
	public static final String actWarrantRef_Field = "ACTWARRANTREFCODE";
	public static final String actWarrantRef_QFielld = "ENTECHAGRMNT2SRVCSBJCT.ACTWARRANTREFCODE";
	public static final String servicesFromSideRef_Attr = "servicesFromSideRef";
	public static final String servicesFromSideRef_Field = "SERVICESFROMSIDEREFCOD";
	public static final String servicesFromSideRef_QFielld = "ENTECHAGRMNT2SRVCSBJCT.SERVICESFROMSIDEREFCOD";
	public static final String techAgrKindRef_Attr = "techAgrKindRef";
	public static final String techAgrKindRef_Field = "TECHAGRKINDREFCODE";
	public static final String techAgrKindRef_QFielld = "ENTECHAGRMNT2SRVCSBJCT.TECHAGRKINDREFCODE";
	public static final String generalContractRef_Attr = "generalContractRef";
	public static final String generalContractRef_Field = "GENERALCONTRACTREFCODE";
	public static final String generalContractRef_QFielld = "ENTECHAGRMNT2SRVCSBJCT.GENERALCONTRACTREFCODE";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
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

	public void setPartnerOkpo(String aValue) {
		partnerOkpo = aValue;
	}

	public String getPartnerOkpo() {
		return partnerOkpo;
	}

	public void setBankName(String aValue) {
		bankName = aValue;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankMfo(String aValue) {
		bankMfo = aValue;
	}

	public String getBankMfo() {
		return bankMfo;
	}

	public void setBankRSchet(String aValue) {
		bankRSchet = aValue;
	}

	public String getBankRSchet() {
		return bankRSchet;
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

	public void setCommentGen(String aValue) {
		commentGen = aValue;
	}

	public String getCommentGen() {
		return commentGen;
	}

	public void setObjectName(String aValue) {
		objectName = aValue;
	}

	public String getObjectName() {
		return objectName;
	}

	public void setCostWorks(BigDecimal aValue) {
		costWorks = aValue;
	}

	public BigDecimal getCostWorks() {
		return costWorks;
	}

	public void setCostWorksNDS(BigDecimal aValue) {
		costWorksNDS = aValue;
	}

	public BigDecimal getCostWorksNDS() {
		return costWorksNDS;
	}

	public void setBasisForAction(String aValue) {
		basisForAction = aValue;
	}

	public String getBasisForAction() {
		return basisForAction;
	}

	public void setActNumber(String aValue) {
		actNumber = aValue;
	}

	public String getActNumber() {
		return actNumber;
	}

	public void setActDate(Date aValue) {
		actDate = aValue;
	}

	public Date getActDate() {
		return actDate;
	}

	public void setExecutorTaxType(String aValue) {
		executorTaxType = aValue;
	}

	public String getExecutorTaxType() {
		return executorTaxType;
	}

	public void setArea(BigDecimal aValue) {
		area = aValue;
	}

	public BigDecimal getArea() {
		return area;
	}

	public void setPartnerPosition(String aValue) {
		partnerPosition = aValue;
	}

	public String getPartnerPosition() {
		return partnerPosition;
	}

	public void setPartnerFIO(String aValue) {
		partnerFIO = aValue;
	}

	public String getPartnerFIO() {
		return partnerFIO;
	}

    public void setPartnerAddress(String aValue){
       partnerAddress = aValue;
    }

    public String getPartnerAddress(){
       return partnerAddress;
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

	public void setModify_time(long aValue) {
		modify_time = aValue;
	}

	public long getModify_time() {
		return modify_time;
	}
	
	public void setContractTerm(Date aValue) {
		contractTerm = aValue;
	}

	public Date getContractTerm() {
		return contractTerm;
	}

	public void setServicesObjectRef(ENServicesObjectRef aValue) {
		servicesObjectRef = aValue;
	}

	public ENServicesObjectRef getServicesObjectRef() {
		return servicesObjectRef;
	}

	public void setAgreementWarrantRef(ENWarrantRef aValue) {
		agreementWarrantRef = aValue;
	}

	public ENWarrantRef getAgreementWarrantRef() {
		return agreementWarrantRef;
	}

	public void setActWarrantRef(ENWarrantRef aValue) {
		actWarrantRef = aValue;
	}

	public ENWarrantRef getActWarrantRef() {
		return actWarrantRef;
	}

	public void setServicesFromSideRef(ENServicesFromSideObjectRef aValue) {
		servicesFromSideRef = aValue;
	}

	public ENServicesFromSideObjectRef getServicesFromSideRef() {
		return servicesFromSideRef;
	}

	public void setTechAgrKindRef(ENTechAgr2SOKindRef aValue) {
		techAgrKindRef = aValue;
	}

	public ENTechAgr2SOKindRef getTechAgrKindRef() {
		return techAgrKindRef;
	}

	public void setGeneralContractRef(ENGeneralContractsRef aValue) {
		generalContractRef = aValue;
	}

	public ENGeneralContractsRef getGeneralContractRef() {
		return generalContractRef;
	}

} // end of ENTechAgreement2ServicesObjectValueObject

