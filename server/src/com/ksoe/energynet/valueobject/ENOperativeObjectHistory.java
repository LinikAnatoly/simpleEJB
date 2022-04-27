//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENOperativeObjectHistory;
 */

import java.io.Serializable;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENGeneralContractsRef;
import com.ksoe.energynet.valueobject.references.ENOperativeObjectRef;

public class ENOperativeObjectHistory implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String contractNumber;
	public Date contractDate;
	public String name;
	public String partnerCode;
	public String finDocCode;
	public int finDocID = Integer.MIN_VALUE;
	public long modify_time = Long.MIN_VALUE;
	public ENOperativeObjectRef objectRef = new ENOperativeObjectRef();
	public ENGeneralContractsRef generalContractRef = new ENGeneralContractsRef();
	public static final String tableName = "ENOPERATIVEOBJECTHISTR";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENOPERATIVEOBJECTHISTR.CODE";
	public static final String contractNumber_Attr = "contractNumber";
	public static final String contractNumber_Field = "CONTRACTNUMBER";
	public static final String contractNumber_QFielld = "ENOPERATIVEOBJECTHISTR.CONTRACTNUMBER";
	public static final String contractDate_Attr = "contractDate";
	public static final String contractDate_Field = "CONTRACTDATE";
	public static final String contractDate_QFielld = "ENOPERATIVEOBJECTHISTR.CONTRACTDATE";
	public static final String name_Attr = "name";
	public static final String name_Field = "NAME";
	public static final String name_QFielld = "ENOPERATIVEOBJECTHISTR.NAME";
	public static final String partnerCode_Attr = "partnerCode";
	public static final String partnerCode_Field = "PARTNERCODE";
	public static final String partnerCode_QFielld = "ENOPERATIVEOBJECTHISTR.PARTNERCODE";
	public static final String finDocCode_Attr = "finDocCode";
	public static final String finDocCode_Field = "FINDOCCODE";
	public static final String finDocCode_QFielld = "ENOPERATIVEOBJECTHISTR.FINDOCCODE";
	public static final String finDocID_Attr = "finDocID";
	public static final String finDocID_Field = "FINDOCID";
	public static final String finDocID_QFielld = "ENOPERATIVEOBJECTHISTR.FINDOCID";
	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "ENOPERATIVEOBJECTHISTR.MODIFY_TIME";
	public static final String objectRef_Attr = "objectRef";
	public static final String objectRef_Field = "OBJECTREFCODE";
	public static final String objectRef_QFielld = "ENOPERATIVEOBJECTHISTR.OBJECTREFCODE";
	public static final String generalContractRef_Attr = "generalContractRef";
	public static final String generalContractRef_Field = "GENERALCONTRACTREFCODE";
	public static final String generalContractRef_QFielld = "ENOPERATIVEOBJECTHISTR.GENERALCONTRACTREFCODE";

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

	public void setName(String aValue) {
		name = aValue;
	}

	public String getName() {
		return name;
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

	public void setModify_time(long aValue) {
		modify_time = aValue;
	}

	public long getModify_time() {
		return modify_time;
	}

	public void setObjectRef(ENOperativeObjectRef aValue) {
		objectRef = aValue;
	}

	public ENOperativeObjectRef getObjectRef() {
		return objectRef;
	}

	public void setGeneralContractRef(ENGeneralContractsRef aValue) {
		generalContractRef = aValue;
	}

	public ENGeneralContractsRef getGeneralContractRef() {
		return generalContractRef;
	}

} // end of ENOperativeObjectHistoryValueObject

