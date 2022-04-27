//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENEstimateItem2Contract;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENGeneralContractsRef;
import com.ksoe.rqorder.valueobject.RQOrg;
import com.ksoe.rqorder.valueobject.RQPurchaseItem2EstimateItem;

public class ENEstimateItem2Contract implements Serializable {

	public int code = Integer.MIN_VALUE;
	public BigDecimal countFact;
	public String contractNumber;
	public Date contractDate;
	public String finDocCode;
	public int finDocID = Integer.MIN_VALUE;
	public String userGen;
	public Date dateEdit;
	public ENEstimateItem estimateItem = new ENEstimateItem();
	public RQOrg org = new RQOrg();
	public RQPurchaseItem2EstimateItem rqPurchItm2Estimate = new RQPurchaseItem2EstimateItem();
	public ENGeneralContractsRef generalContractRef = new ENGeneralContractsRef();
	public static final String tableName = "ENESTIMATEITEM2CONTRCT";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENESTIMATEITEM2CONTRCT.CODE";
	public static final String countFact_Attr = "countFact";
	public static final String countFact_Field = "COUNTFACT";
	public static final String countFact_QFielld = "ENESTIMATEITEM2CONTRCT.COUNTFACT";
	public static final String contractNumber_Attr = "contractNumber";
	public static final String contractNumber_Field = "CONTRACTNUMBER";
	public static final String contractNumber_QFielld = "ENESTIMATEITEM2CONTRCT.CONTRACTNUMBER";
	public static final String contractDate_Attr = "contractDate";
	public static final String contractDate_Field = "CONTRACTDATE";
	public static final String contractDate_QFielld = "ENESTIMATEITEM2CONTRCT.CONTRACTDATE";
	public static final String finDocCode_Attr = "finDocCode";
	public static final String finDocCode_Field = "FINDOCCODE";
	public static final String finDocCode_QFielld = "ENESTIMATEITEM2CONTRCT.FINDOCCODE";
	public static final String finDocID_Attr = "finDocID";
	public static final String finDocID_Field = "FINDOCID";
	public static final String finDocID_QFielld = "ENESTIMATEITEM2CONTRCT.FINDOCID";
	public static final String userGen_Attr = "userGen";
	public static final String userGen_Field = "USERGEN";
	public static final String userGen_QFielld = "ENESTIMATEITEM2CONTRCT.USERGEN";
	public static final String dateEdit_Attr = "dateEdit";
	public static final String dateEdit_Field = "DATEEDIT";
	public static final String dateEdit_QFielld = "ENESTIMATEITEM2CONTRCT.DATEEDIT";
	public static final String estimateItem_Attr = "estimateItem";
	public static final String estimateItem_Field = "ESTIMATEITEMCODE";
	public static final String estimateItem_QFielld = "ENESTIMATEITEM2CONTRCT.ESTIMATEITEMCODE";
	public static final String org_Attr = "org";
	public static final String org_Field = "ORGCODE";
	public static final String org_QFielld = "ENESTIMATEITEM2CONTRCT.ORGCODE";
	public static final String rqPurchItm2Estimate_Attr = "rqPurchItm2Estimate";
	public static final String rqPurchItm2Estimate_Field = "RQPURCHITM2ESTIMATECOD";
	public static final String rqPurchItm2Estimate_QFielld = "ENESTIMATEITEM2CONTRCT.RQPURCHITM2ESTIMATECOD";
	public static final String generalContractRef_Attr = "generalContractRef";
	public static final String generalContractRef_Field = "GENERALCONTRACTREFCODE";
	public static final String generalContractRef_QFielld = "ENESTIMATEITEM2CONTRCT.GENERALCONTRACTREFCODE";
	
	public static int purchaseitem—ode = Integer.MIN_VALUE;

	public void setPurchaseitem—ode(int aValue) {
		purchaseitem—ode = aValue;
	}
	
	public static int getPurchaseitemÒode() {
		return purchaseitem—ode;
	}

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setCountFact(BigDecimal aValue) {
		countFact = aValue;
	}

	public BigDecimal getCountFact() {
		return countFact;
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

	public void setEstimateItem(ENEstimateItem aValue) {
		estimateItem = aValue;
	}

	public ENEstimateItem getEstimateItem() {
		return estimateItem;
	}

	public void setOrg(RQOrg aValue) {
		org = aValue;
	}

	public RQOrg getOrg() {
		return org;
	}

	public void setRqPurchItm2Estimate(RQPurchaseItem2EstimateItem aValue) {
		rqPurchItm2Estimate = aValue;
	}

	public RQPurchaseItem2EstimateItem getRqPurchItm2Estimate() {
		return rqPurchItm2Estimate;
	}

	public void setGeneralContractRef(ENGeneralContractsRef aValue) {
		generalContractRef = aValue;
	}

	public ENGeneralContractsRef getGeneralContractRef() {
		return generalContractRef;
	}

} // end of ENEstimateItem2ContractValueObject

