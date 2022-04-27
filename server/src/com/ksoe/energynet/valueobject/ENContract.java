//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENContract;
 */

import java.io.Serializable;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENGeneralContractsRef;
import com.ksoe.rqorder.valueobject.RQOrg;
import com.ksoe.rqorder.valueobject.RQPurchaseItemTender;

public class ENContract implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String contractNumber;
	public Date contractDate;
	public Date contractEndDate;
	public String finDocCode;
	public int finDocID = Integer.MIN_VALUE;
	public String commentGen;
	public String userGen;
	public Date dateEdit;
	public long modify_time = Long.MIN_VALUE;
	public RQOrg org = new RQOrg();
	public ENContractType contractType = new ENContractType();
	public RQPurchaseItemTender purchaseItemTender = new RQPurchaseItemTender();
	public ENGeneralContractsRef generalContractRef = new ENGeneralContractsRef();
	public static final String tableName = "ENCONTRACT";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENCONTRACT.CODE";
	public static final String contractNumber_Attr = "contractNumber";
	public static final String contractNumber_Field = "CONTRACTNUMBER";
	public static final String contractNumber_QFielld = "ENCONTRACT.CONTRACTNUMBER";
	public static final String contractDate_Attr = "contractDate";
	public static final String contractDate_Field = "CONTRACTDATE";
	public static final String contractDate_QFielld = "ENCONTRACT.CONTRACTDATE";
	public static final String contractEndDate_Attr = "contractEndDate";
	public static final String contractEndDate_Field = "CONTRACTENDDATE";
	public static final String contractEndDate_QFielld = "ENCONTRACT.CONTRACTENDDATE";
	public static final String finDocCode_Attr = "finDocCode";
	public static final String finDocCode_Field = "FINDOCCODE";
	public static final String finDocCode_QFielld = "ENCONTRACT.FINDOCCODE";
	public static final String finDocID_Attr = "finDocID";
	public static final String finDocID_Field = "FINDOCID";
	public static final String finDocID_QFielld = "ENCONTRACT.FINDOCID";
	public static final String commentGen_Attr = "commentGen";
	public static final String commentGen_Field = "COMMENTGEN";
	public static final String commentGen_QFielld = "ENCONTRACT.COMMENTGEN";
	public static final String userGen_Attr = "userGen";
	public static final String userGen_Field = "USERGEN";
	public static final String userGen_QFielld = "ENCONTRACT.USERGEN";
	public static final String dateEdit_Attr = "dateEdit";
	public static final String dateEdit_Field = "DATEEDIT";
	public static final String dateEdit_QFielld = "ENCONTRACT.DATEEDIT";
	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "ENCONTRACT.MODIFY_TIME";
	public static final String org_Attr = "org";
	public static final String org_Field = "ORGCODE";
	public static final String org_QFielld = "ENCONTRACT.ORGCODE";
	public static final String contractType_Attr = "contractType";
	public static final String contractType_Field = "CONTRACTTYPECODE";
	public static final String contractType_QFielld = "ENCONTRACT.CONTRACTTYPECODE";
	public static final String purchaseItemTender_Attr = "purchaseItemTender";
	public static final String purchaseItemTender_Field = "PURCHASEITEMTENDERCODE";
	public static final String purchaseItemTender_QFielld = "ENCONTRACT.PURCHASEITEMTENDERCODE";
	public static final String generalContractRef_Attr = "generalContractRef";
	public static final String generalContractRef_Field = "GENERALCONTRACTREFCODE";
	public static final String generalContractRef_QFielld = "ENCONTRACT.GENERALCONTRACTREFCODE";

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

	public void setContractEndDate(Date aValue) {
		contractEndDate = aValue;
	}

	public Date getContractEndDate() {
		return contractEndDate;
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

	public void setOrg(RQOrg aValue) {
		org = aValue;
	}

	public RQOrg getOrg() {
		return org;
	}

	public void setContractType(ENContractType aValue) {
		contractType = aValue;
	}

	public ENContractType getContractType() {
		return contractType;
	}

	public void setPurchaseItemTender(RQPurchaseItemTender aValue) {
		purchaseItemTender = aValue;
	}

	public RQPurchaseItemTender getPurchaseItemTender() {
		return purchaseItemTender;
	}

	public void setGeneralContractRef(ENGeneralContractsRef aValue) {
		generalContractRef = aValue;
	}

	public ENGeneralContractsRef getGeneralContractRef() {
		return generalContractRef;
	}

} // end of ENContractValueObject

