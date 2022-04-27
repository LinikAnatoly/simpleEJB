//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENIPItem2Contract;
 */

import java.io.Serializable;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENGeneralContractsRef;
import com.ksoe.energynet.valueobject.references.ENIPItemRef;

public class ENIPItem2Contract implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String contractNumber;
	public Date contractDate;
	public String finDocCode;
	public int finDocID = Integer.MIN_VALUE;
	public int orgId = Integer.MIN_VALUE;
	public String orgName;
	public String orgUkrName;
	public String orgCode;
	public ENIPItemRef ipItemRef = new ENIPItemRef();
	public ENGeneralContractsRef generalContractRef = new ENGeneralContractsRef();
	public static final String tableName = "ENIPITEM2CONTRACT";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENIPITEM2CONTRACT.CODE";
	public static final String contractNumber_Attr = "contractNumber";
	public static final String contractNumber_Field = "CONTRACTNUMBER";
	public static final String contractNumber_QFielld = "ENIPITEM2CONTRACT.CONTRACTNUMBER";
	public static final String contractDate_Attr = "contractDate";
	public static final String contractDate_Field = "CONTRACTDATE";
	public static final String contractDate_QFielld = "ENIPITEM2CONTRACT.CONTRACTDATE";
	public static final String finDocCode_Attr = "finDocCode";
	public static final String finDocCode_Field = "FINDOCCODE";
	public static final String finDocCode_QFielld = "ENIPITEM2CONTRACT.FINDOCCODE";
	public static final String finDocID_Attr = "finDocID";
	public static final String finDocID_Field = "FINDOCID";
	public static final String finDocID_QFielld = "ENIPITEM2CONTRACT.FINDOCID";
	public static final String orgId_Attr = "orgId";
	public static final String orgId_Field = "ORGID";
	public static final String orgId_QFielld = "ENIPITEM2CONTRACT.ORGID";
	public static final String orgName_Attr = "orgName";
	public static final String orgName_Field = "ORGNAME";
	public static final String orgName_QFielld = "ENIPITEM2CONTRACT.ORGNAME";
	public static final String orgUkrName_Attr = "orgUkrName";
	public static final String orgUkrName_Field = "ORGUKRNAME";
	public static final String orgUkrName_QFielld = "ENIPITEM2CONTRACT.ORGUKRNAME";
	public static final String orgCode_Attr = "orgCode";
	public static final String orgCode_Field = "ORGCODE";
	public static final String orgCode_QFielld = "ENIPITEM2CONTRACT.ORGCODE";
	public static final String ipItemRef_Attr = "ipItemRef";
	public static final String ipItemRef_Field = "IPITEMREFCODE";
	public static final String ipItemRef_QFielld = "ENIPITEM2CONTRACT.IPITEMREFCODE";
	public static final String generalContractRef_Attr = "generalContractRef";
	public static final String generalContractRef_Field = "GENERALCONTRACTREFCODE";
	public static final String generalContractRef_QFielld = "ENIPITEM2CONTRACT.GENERALCONTRACTREFCODE";

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

	public void setOrgId(int aValue) {
		orgId = aValue;
	}

	public int getOrgId() {
		return orgId;
	}

	public void setOrgName(String aValue) {
		orgName = aValue;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgUkrName(String aValue) {
		orgUkrName = aValue;
	}

	public String getOrgUkrName() {
		return orgUkrName;
	}

	public void setOrgCode(String aValue) {
		orgCode = aValue;
	}

	public String getOrgCode() {
		return orgCode;
	}

	public void setIpItemRef(ENIPItemRef aValue) {
		ipItemRef = aValue;
	}

	public ENIPItemRef getIpItemRef() {
		return ipItemRef;
	}

	public void setGeneralContractRef(ENGeneralContractsRef aValue) {
		generalContractRef = aValue;
	}

	public ENGeneralContractsRef getGeneralContractRef() {
		return generalContractRef;
	}

} // end of ENIPItem2ContractValueObject

