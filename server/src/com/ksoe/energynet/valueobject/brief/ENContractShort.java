//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

/**
 * Short Object for ENContract;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class ENContractShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String contractNumber;
	public Date contractDate;
	public Date contractEndDate;
	public String finDocCode;
	public int finDocID = Integer.MIN_VALUE;
	public String userGen;
	public Date dateEdit;
	public int orgCode = Integer.MIN_VALUE;
	public int contractTypeCode = Integer.MIN_VALUE;
	public String contractTypeName;
	public int purchaseItemTenderCode = Integer.MIN_VALUE;
	public String purchaseItemTenderIdentid;
	public String purchaseItemTenderIdentid2;
	public String purchaseItemTenderPurchaseName;
	public String purchaseItemTenderFinancingSource;
	public BigDecimal purchaseItemTenderSumGenWithNds;
	public BigDecimal purchaseItemTenderSumFactWithNds;
	public int purchaseItemTenderTentativeYearGen = Integer.MIN_VALUE;
	public int purchaseItemTenderTentativeMonthGen = Integer.MIN_VALUE;
	public int purchaseItemTenderCountSymbolForGroup = Integer.MIN_VALUE;
	public String purchaseItemTenderCommentGen;
	public int generalContractRefCode = Integer.MIN_VALUE;
	public int generalContractRefFinDocID = Integer.MIN_VALUE;
	public String generalContractRefFinDocCode;
	public String generalContractRefContractNumber;
	public Date generalContractRefContractDate;
	public String generalContractRefCommentGen;
	public int generalContractRefPartnerId = Integer.MIN_VALUE;
	public String generalContractRefPartnerCode;
	public String generalContractRefPartnerName;
	public Date generalContractRefContractRegDate;
	public Date generalContractRefContractStartDate;
	public Date generalContractRefContractEndDate;
	public String generalContractRefAxContractId;
	public String generalContractRefAxContractCode;
	public String generalContractRefAxContractNumber;
	public String generalContractRefAxContractAccount;
	public Date generalContractRefAxContractDate;
	public String generalContractRefAxContractCommentGen;
	public String generalContractRefAxContractGroupCode;
	public String generalContractRefAxPartnerCode;
	public String generalContractRefAxPartnerName;
	public String generalContractRefUserGen;

	/** ******************* */
	public String orgName;
	/** ******************* */

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

	public void setOrgCode(int aValue) {
		orgCode = aValue;
	}

	public int getOrgCode() {
		return orgCode;
	}

	public void setContractTypeCode(int aValue) {
		contractTypeCode = aValue;
	}

	public int getContractTypeCode() {
		return contractTypeCode;
	}

	public void setContractTypeName(String aValue) {
		contractTypeName = aValue;
	}

	public String getContractTypeName() {
		return contractTypeName;
	}

	public void setPurchaseItemTenderCode(int aValue) {
		purchaseItemTenderCode = aValue;
	}

	public int getPurchaseItemTenderCode() {
		return purchaseItemTenderCode;
	}

	public void setPurchaseItemTenderIdentid(String aValue) {
		purchaseItemTenderIdentid = aValue;
	}

	public String getPurchaseItemTenderIdentid() {
		return purchaseItemTenderIdentid;
	}

	public void setPurchaseItemTenderIdentid2(String aValue) {
		purchaseItemTenderIdentid2 = aValue;
	}

	public String getPurchaseItemTenderIdentid2() {
		return purchaseItemTenderIdentid2;
	}

	public void setPurchaseItemTenderPurchaseName(String aValue) {
		purchaseItemTenderPurchaseName = aValue;
	}

	public String getPurchaseItemTenderPurchaseName() {
		return purchaseItemTenderPurchaseName;
	}

	public void setPurchaseItemTenderFinancingSource(String aValue) {
		purchaseItemTenderFinancingSource = aValue;
	}

	public String getPurchaseItemTenderFinancingSource() {
		return purchaseItemTenderFinancingSource;
	}

	public void setPurchaseItemTenderSumGenWithNds(BigDecimal aValue) {
		purchaseItemTenderSumGenWithNds = aValue;
	}

	public BigDecimal getPurchaseItemTenderSumGenWithNds() {
		return purchaseItemTenderSumGenWithNds;
	}

	public void setPurchaseItemTenderSumFactWithNds(BigDecimal aValue) {
		purchaseItemTenderSumFactWithNds = aValue;
	}

	public BigDecimal getPurchaseItemTenderSumFactWithNds() {
		return purchaseItemTenderSumFactWithNds;
	}

	public void setPurchaseItemTenderTentativeYearGen(int aValue) {
		purchaseItemTenderTentativeYearGen = aValue;
	}

	public int getPurchaseItemTenderTentativeYearGen() {
		return purchaseItemTenderTentativeYearGen;
	}

	public void setPurchaseItemTenderTentativeMonthGen(int aValue) {
		purchaseItemTenderTentativeMonthGen = aValue;
	}

	public int getPurchaseItemTenderTentativeMonthGen() {
		return purchaseItemTenderTentativeMonthGen;
	}

	public void setPurchaseItemTenderCountSymbolForGroup(int aValue) {
		purchaseItemTenderCountSymbolForGroup = aValue;
	}

	public int getPurchaseItemTenderCountSymbolForGroup() {
		return purchaseItemTenderCountSymbolForGroup;
	}

	public void setPurchaseItemTenderCommentGen(String aValue) {
		purchaseItemTenderCommentGen = aValue;
	}

	public String getPurchaseItemTenderCommentGen() {
		return purchaseItemTenderCommentGen;
	}

	public void setGeneralContractRefCode(int aValue) {
		generalContractRefCode = aValue;
	}

	public int getGeneralContractRefCode() {
		return generalContractRefCode;
	}

	public void setGeneralContractRefFinDocID(int aValue) {
		generalContractRefFinDocID = aValue;
	}

	public int getGeneralContractRefFinDocID() {
		return generalContractRefFinDocID;
	}

	public void setGeneralContractRefFinDocCode(String aValue) {
		generalContractRefFinDocCode = aValue;
	}

	public String getGeneralContractRefFinDocCode() {
		return generalContractRefFinDocCode;
	}

	public void setGeneralContractRefContractNumber(String aValue) {
		generalContractRefContractNumber = aValue;
	}

	public String getGeneralContractRefContractNumber() {
		return generalContractRefContractNumber;
	}

	public void setGeneralContractRefContractDate(Date aValue) {
		generalContractRefContractDate = aValue;
	}

	public Date getGeneralContractRefContractDate() {
		return generalContractRefContractDate;
	}

	public void setGeneralContractRefCommentGen(String aValue) {
		generalContractRefCommentGen = aValue;
	}

	public String getGeneralContractRefCommentGen() {
		return generalContractRefCommentGen;
	}

	public void setGeneralContractRefPartnerId(int aValue) {
		generalContractRefPartnerId = aValue;
	}

	public int getGeneralContractRefPartnerId() {
		return generalContractRefPartnerId;
	}

	public void setGeneralContractRefPartnerCode(String aValue) {
		generalContractRefPartnerCode = aValue;
	}

	public String getGeneralContractRefPartnerCode() {
		return generalContractRefPartnerCode;
	}

	public void setGeneralContractRefPartnerName(String aValue) {
		generalContractRefPartnerName = aValue;
	}

	public String getGeneralContractRefPartnerName() {
		return generalContractRefPartnerName;
	}

	public void setGeneralContractRefContractRegDate(Date aValue) {
		generalContractRefContractRegDate = aValue;
	}

	public Date getGeneralContractRefContractRegDate() {
		return generalContractRefContractRegDate;
	}

	public void setGeneralContractRefContractStartDate(Date aValue) {
		generalContractRefContractStartDate = aValue;
	}

	public Date getGeneralContractRefContractStartDate() {
		return generalContractRefContractStartDate;
	}

	public void setGeneralContractRefContractEndDate(Date aValue) {
		generalContractRefContractEndDate = aValue;
	}

	public Date getGeneralContractRefContractEndDate() {
		return generalContractRefContractEndDate;
	}

	public void setGeneralContractRefAxContractId(String aValue) {
		generalContractRefAxContractId = aValue;
	}

	public String getGeneralContractRefAxContractId() {
		return generalContractRefAxContractId;
	}

	public void setGeneralContractRefAxContractCode(String aValue) {
		generalContractRefAxContractCode = aValue;
	}

	public String getGeneralContractRefAxContractCode() {
		return generalContractRefAxContractCode;
	}

	public void setGeneralContractRefAxContractNumber(String aValue) {
		generalContractRefAxContractNumber = aValue;
	}

	public String getGeneralContractRefAxContractNumber() {
		return generalContractRefAxContractNumber;
	}

	public void setGeneralContractRefAxContractAccount(String aValue) {
		generalContractRefAxContractAccount = aValue;
	}

	public String getGeneralContractRefAxContractAccount() {
		return generalContractRefAxContractAccount;
	}

	public void setGeneralContractRefAxContractDate(Date aValue) {
		generalContractRefAxContractDate = aValue;
	}

	public Date getGeneralContractRefAxContractDate() {
		return generalContractRefAxContractDate;
	}

	public void setGeneralContractRefAxContractCommentGen(String aValue) {
		generalContractRefAxContractCommentGen = aValue;
	}

	public String getGeneralContractRefAxContractCommentGen() {
		return generalContractRefAxContractCommentGen;
	}

	public void setGeneralContractRefAxContractGroupCode(String aValue) {
		generalContractRefAxContractGroupCode = aValue;
	}

	public String getGeneralContractRefAxContractGroupCode() {
		return generalContractRefAxContractGroupCode;
	}

	public void setGeneralContractRefAxPartnerCode(String aValue) {
		generalContractRefAxPartnerCode = aValue;
	}

	public String getGeneralContractRefAxPartnerCode() {
		return generalContractRefAxPartnerCode;
	}

	public void setGeneralContractRefAxPartnerName(String aValue) {
		generalContractRefAxPartnerName = aValue;
	}

	public String getGeneralContractRefAxPartnerName() {
		return generalContractRefAxPartnerName;
	}

	public void setGeneralContractRefUserGen(String aValue) {
		generalContractRefUserGen = aValue;
	}

	public String getGeneralContractRefUserGen() {
		return generalContractRefUserGen;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

}