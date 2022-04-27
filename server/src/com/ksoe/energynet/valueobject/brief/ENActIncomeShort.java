//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

/**
 * Short Object for ENActIncome;
 */

import java.io.Serializable;
import java.util.Date;

public class ENActIncomeShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String numbergen;
	public Date dategen;
	public Date actDateStart;
	public Date actDateEnd;
	public String contractNumber;
	public Date contractDate;
	public String partnername;
	public String partnerCode;
	public String finDocCode;
	public int finDocID = Integer.MIN_VALUE;
	public int statusRefCode = Integer.MIN_VALUE;
	public String statusRefName;
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

	public void setStatusRefCode(int aValue) {
		statusRefCode = aValue;
	}

	public int getStatusRefCode() {
		return statusRefCode;
	}

	public void setStatusRefName(String aValue) {
		statusRefName = aValue;
	}

	public String getStatusRefName() {
		return statusRefName;
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

}