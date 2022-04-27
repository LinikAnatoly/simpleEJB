//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENActIncome;
 */

import java.io.Serializable;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENActIncomeStatusRef;
import com.ksoe.energynet.valueobject.references.ENGeneralContractsRef;

public class ENActIncome implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String numbergen;
	public Date dategen;
	public Date actDateStart;
	public Date actDateEnd;
	public String commentGen;
	public String contractNumber;
	public Date contractDate;
	public String partnername;
	public String partnerCode;
	public String finDocCode;
	public int finDocID = Integer.MIN_VALUE;
	public String domain_info;
	public long modify_time = Long.MIN_VALUE;
	public ENActIncomeStatusRef statusRef = new ENActIncomeStatusRef();
	public ENGeneralContractsRef generalContractRef = new ENGeneralContractsRef();
	public static final String tableName = "ENACTINCOME";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENACTINCOME.CODE";
	public static final String numbergen_Attr = "numbergen";
	public static final String numbergen_Field = "NUMBERGEN";
	public static final String numbergen_QFielld = "ENACTINCOME.NUMBERGEN";
	public static final String dategen_Attr = "dategen";
	public static final String dategen_Field = "DATEGEN";
	public static final String dategen_QFielld = "ENACTINCOME.DATEGEN";
	public static final String actDateStart_Attr = "actDateStart";
	public static final String actDateStart_Field = "ACTDATESTART";
	public static final String actDateStart_QFielld = "ENACTINCOME.ACTDATESTART";
	public static final String actDateEnd_Attr = "actDateEnd";
	public static final String actDateEnd_Field = "ACTDATEEND";
	public static final String actDateEnd_QFielld = "ENACTINCOME.ACTDATEEND";
	public static final String commentGen_Attr = "commentGen";
	public static final String commentGen_Field = "COMMENTGEN";
	public static final String commentGen_QFielld = "ENACTINCOME.COMMENTGEN";
	public static final String contractNumber_Attr = "contractNumber";
	public static final String contractNumber_Field = "CONTRACTNUMBER";
	public static final String contractNumber_QFielld = "ENACTINCOME.CONTRACTNUMBER";
	public static final String contractDate_Attr = "contractDate";
	public static final String contractDate_Field = "CONTRACTDATE";
	public static final String contractDate_QFielld = "ENACTINCOME.CONTRACTDATE";
	public static final String partnername_Attr = "partnername";
	public static final String partnername_Field = "PARTNERNAME";
	public static final String partnername_QFielld = "ENACTINCOME.PARTNERNAME";
	public static final String partnerCode_Attr = "partnerCode";
	public static final String partnerCode_Field = "PARTNERCODE";
	public static final String partnerCode_QFielld = "ENACTINCOME.PARTNERCODE";
	public static final String finDocCode_Attr = "finDocCode";
	public static final String finDocCode_Field = "FINDOCCODE";
	public static final String finDocCode_QFielld = "ENACTINCOME.FINDOCCODE";
	public static final String finDocID_Attr = "finDocID";
	public static final String finDocID_Field = "FINDOCID";
	public static final String finDocID_QFielld = "ENACTINCOME.FINDOCID";
	public static final String domain_info_Attr = "domain_info";
	public static final String domain_info_Field = "DOMAIN_INFO";
	public static final String domain_info_QFielld = "ENACTINCOME.DOMAIN_INFO";
	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "ENACTINCOME.MODIFY_TIME";
	public static final String statusRef_Attr = "statusRef";
	public static final String statusRef_Field = "STATUSREFCODE";
	public static final String statusRef_QFielld = "ENACTINCOME.STATUSREFCODE";
	public static final String generalContractRef_Attr = "generalContractRef";
	public static final String generalContractRef_Field = "GENERALCONTRACTREFCODE";
	public static final String generalContractRef_QFielld = "ENACTINCOME.GENERALCONTRACTREFCODE";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setNumbergen(String aValue) {
		numbergen = aValue;
	}

	public String getNumbergen() {
		return numbergen;
	}

	public void setDategen(Date aValue) {
		dategen = aValue;
	}

	public Date getDategen() {
		return dategen;
	}

	public void setActDateStart(Date aValue) {
		actDateStart = aValue;
	}

	public Date getActDateStart() {
		return actDateStart;
	}

	public void setActDateEnd(Date aValue) {
		actDateEnd = aValue;
	}

	public Date getActDateEnd() {
		return actDateEnd;
	}

	public void setCommentGen(String aValue) {
		commentGen = aValue;
	}

	public String getCommentGen() {
		return commentGen;
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

	public void setPartnername(String aValue) {
		partnername = aValue;
	}

	public String getPartnername() {
		return partnername;
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

	public void setStatusRef(ENActIncomeStatusRef aValue) {
		statusRef = aValue;
	}

	public ENActIncomeStatusRef getStatusRef() {
		return statusRef;
	}

	public void setGeneralContractRef(ENGeneralContractsRef aValue) {
		generalContractRef = aValue;
	}

	public ENGeneralContractsRef getGeneralContractRef() {
		return generalContractRef;
	}

} // end of ENActIncomeValueObject

