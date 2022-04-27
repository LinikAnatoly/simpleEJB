//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENOperativeObject;
 */

import java.io.Serializable;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENGeneralContractsRef;

public class ENOperativeObject implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String name;
	public String commentGen;
	public String contractNumber;
	public Date contractDate;
	public String partnerCode;
	public String partnerName;
	public String finDocCode;
	public int finDocID = Integer.MIN_VALUE;
	public String domain_info;
	public long modify_time = Long.MIN_VALUE;
	public ENDepartment department = new ENDepartment();
	public ENElement element = new ENElement();
	public ENGeneralContractsRef generalContractRef = new ENGeneralContractsRef();
	public static final String tableName = "ENOPERATIVEOBJECT";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENOPERATIVEOBJECT.CODE";
	public static final String name_Attr = "name";
	public static final String name_Field = "NAME";
	public static final String name_QFielld = "ENOPERATIVEOBJECT.NAME";
	public static final String commentGen_Attr = "commentGen";
	public static final String commentGen_Field = "COMMENTGEN";
	public static final String commentGen_QFielld = "ENOPERATIVEOBJECT.COMMENTGEN";
	public static final String contractNumber_Attr = "contractNumber";
	public static final String contractNumber_Field = "CONTRACTNUMBER";
	public static final String contractNumber_QFielld = "ENOPERATIVEOBJECT.CONTRACTNUMBER";
	public static final String contractDate_Attr = "contractDate";
	public static final String contractDate_Field = "CONTRACTDATE";
	public static final String contractDate_QFielld = "ENOPERATIVEOBJECT.CONTRACTDATE";
	public static final String partnerCode_Attr = "partnerCode";
	public static final String partnerCode_Field = "PARTNERCODE";
	public static final String partnerCode_QFielld = "ENOPERATIVEOBJECT.PARTNERCODE";
	public static final String partnerName_Attr = "partnerName";
	public static final String partnerName_Field = "PARTNERNAME";
	public static final String partnerName_QFielld = "ENOPERATIVEOBJECT.PARTNERNAME";
	public static final String finDocCode_Attr = "finDocCode";
	public static final String finDocCode_Field = "FINDOCCODE";
	public static final String finDocCode_QFielld = "ENOPERATIVEOBJECT.FINDOCCODE";
	public static final String finDocID_Attr = "finDocID";
	public static final String finDocID_Field = "FINDOCID";
	public static final String finDocID_QFielld = "ENOPERATIVEOBJECT.FINDOCID";
	public static final String domain_info_Attr = "domain_info";
	public static final String domain_info_Field = "DOMAIN_INFO";
	public static final String domain_info_QFielld = "ENOPERATIVEOBJECT.DOMAIN_INFO";
	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "ENOPERATIVEOBJECT.MODIFY_TIME";
	public static final String department_Attr = "department";
	public static final String department_Field = "DEPARTMENTCODE";
	public static final String department_QFielld = "ENOPERATIVEOBJECT.DEPARTMENTCODE";
	public static final String element_Attr = "element";
	public static final String element_Field = "ELEMENTCODE";
	public static final String element_QFielld = "ENOPERATIVEOBJECT.ELEMENTCODE";
	public static final String generalContractRef_Attr = "generalContractRef";
	public static final String generalContractRef_Field = "GENERALCONTRACTREFCODE";
	public static final String generalContractRef_QFielld = "ENOPERATIVEOBJECT.GENERALCONTRACTREFCODE";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setName(String aValue) {
		name = aValue;
	}

	public String getName() {
		return name;
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

	public void setPartnerCode(String aValue) {
		partnerCode = aValue;
	}

	public String getPartnerCode() {
		return partnerCode;
	}

	public void setPartnerName(String aValue) {
		partnerName = aValue;
	}

	public String getPartnerName() {
		return partnerName;
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

	public void setDepartment(ENDepartment aValue) {
		department = aValue;
	}

	public ENDepartment getDepartment() {
		return department;
	}

	public void setElement(ENElement aValue) {
		element = aValue;
	}

	public ENElement getElement() {
		return element;
	}

	public void setGeneralContractRef(ENGeneralContractsRef aValue) {
		generalContractRef = aValue;
	}

	public ENGeneralContractsRef getGeneralContractRef() {
		return generalContractRef;
	}

} // end of ENOperativeObjectValueObject

