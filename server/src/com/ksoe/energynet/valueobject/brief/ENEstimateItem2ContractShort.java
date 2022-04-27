//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

/**
 * Short Object for ENEstimateItem2Contract;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class ENEstimateItem2ContractShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public BigDecimal countFact;
	public String contractNumber;
	public Date contractDate;
	public String finDocCode;
	public int finDocID = Integer.MIN_VALUE;
	public String userGen;
	public Date dateEdit;
	public int estimateItemCode = Integer.MIN_VALUE;
	public BigDecimal estimateItemCountGen;
	public BigDecimal estimateItemCountFact;
	public BigDecimal estimateItemPrice;
	public BigDecimal estimateItemCost;
	public int estimateItemIsUseVAT = Integer.MIN_VALUE;
	public int estimateItemDeliveryTime = Integer.MIN_VALUE;
	public int estimateItemUseWorkTime = Integer.MIN_VALUE;
	public String estimateItemUserGen;
	public Date estimateItemDateEdit;
	public int orgCode = Integer.MIN_VALUE;
	public int rqPurchItm2EstimateCode = Integer.MIN_VALUE;
	public BigDecimal rqPurchItm2EstimateCountGen;
	public BigDecimal rqPurchItm2EstimateCountPurchase;
	public String rqPurchItm2EstimateStatusComment;
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

	/** ************************************* */
    // /// 27.03.14 NET-4345 Выбираем цену (без НДС) из позиции тендерного договора
	public BigDecimal priceByContract;
	// ///
	/** ************************************* */


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

	public void setEstimateItemCode(int aValue) {
		estimateItemCode = aValue;
	}

	public int getEstimateItemCode() {
		return estimateItemCode;
	}

	public void setEstimateItemCountGen(BigDecimal aValue) {
		estimateItemCountGen = aValue;
	}

	public BigDecimal getEstimateItemCountGen() {
		return estimateItemCountGen;
	}

	public void setEstimateItemCountFact(BigDecimal aValue) {
		estimateItemCountFact = aValue;
	}

	public BigDecimal getEstimateItemCountFact() {
		return estimateItemCountFact;
	}

	public void setEstimateItemPrice(BigDecimal aValue) {
		estimateItemPrice = aValue;
	}

	public BigDecimal getEstimateItemPrice() {
		return estimateItemPrice;
	}

	public void setEstimateItemCost(BigDecimal aValue) {
		estimateItemCost = aValue;
	}

	public BigDecimal getEstimateItemCost() {
		return estimateItemCost;
	}

	public void setEstimateItemIsUseVAT(int aValue) {
		estimateItemIsUseVAT = aValue;
	}

	public int getEstimateItemIsUseVAT() {
		return estimateItemIsUseVAT;
	}

	public void setEstimateItemDeliveryTime(int aValue) {
		estimateItemDeliveryTime = aValue;
	}

	public int getEstimateItemDeliveryTime() {
		return estimateItemDeliveryTime;
	}

	public void setEstimateItemUseWorkTime(int aValue) {
		estimateItemUseWorkTime = aValue;
	}

	public int getEstimateItemUseWorkTime() {
		return estimateItemUseWorkTime;
	}

	public void setEstimateItemUserGen(String aValue) {
		estimateItemUserGen = aValue;
	}

	public String getEstimateItemUserGen() {
		return estimateItemUserGen;
	}

	public void setEstimateItemDateEdit(Date aValue) {
		estimateItemDateEdit = aValue;
	}

	public Date getEstimateItemDateEdit() {
		return estimateItemDateEdit;
	}

	public void setOrgCode(int aValue) {
		orgCode = aValue;
	}

	public int getOrgCode() {
		return orgCode;
	}

	public void setRqPurchItm2EstimateCode(int aValue) {
		rqPurchItm2EstimateCode = aValue;
	}

	public int getRqPurchItm2EstimateCode() {
		return rqPurchItm2EstimateCode;
	}

	public void setRqPurchItm2EstimateCountGen(BigDecimal aValue) {
		rqPurchItm2EstimateCountGen = aValue;
	}

	public BigDecimal getRqPurchItm2EstimateCountGen() {
		return rqPurchItm2EstimateCountGen;
	}

	public void setRqPurchItm2EstimateCountPurchase(BigDecimal aValue) {
		rqPurchItm2EstimateCountPurchase = aValue;
	}

	public BigDecimal getRqPurchItm2EstimateCountPurchase() {
		return rqPurchItm2EstimateCountPurchase;
	}

	public void setRqPurchItm2EstimateStatusComment(String aValue) {
		rqPurchItm2EstimateStatusComment = aValue;
	}

	public String getRqPurchItm2EstimateStatusComment() {
		return rqPurchItm2EstimateStatusComment;
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

	public BigDecimal getPriceByContract() {
		return priceByContract;
	}

	public void setPriceByContract(BigDecimal priceByContract) {
		this.priceByContract = priceByContract;
	}

}