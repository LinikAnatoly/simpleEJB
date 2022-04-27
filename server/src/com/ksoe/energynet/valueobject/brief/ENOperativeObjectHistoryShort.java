//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

/**
 * Short Object for ENOperativeObjectHistory;
 */

import java.io.Serializable;
import java.util.Date;

public class ENOperativeObjectHistoryShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String contractNumber;
	public Date contractDate;
	public String name;
	public String partnerCode;
	public String finDocCode;
	public int finDocID = Integer.MIN_VALUE;
	public int objectRefCode = Integer.MIN_VALUE;
	public String objectRefName;
	public String objectRefContractNumber;
	public Date objectRefContractDate;
	public String objectRefPartnerCode;
	public String objectRefPartnerName;
	public String objectRefFinDocCode;
	public int objectRefFinDocID = Integer.MIN_VALUE;
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

	public void setObjectRefCode(int aValue) {
		objectRefCode = aValue;
	}

	public int getObjectRefCode() {
		return objectRefCode;
	}

	public void setObjectRefName(String aValue) {
		objectRefName = aValue;
	}

	public String getObjectRefName() {
		return objectRefName;
	}

	public void setObjectRefContractNumber(String aValue) {
		objectRefContractNumber = aValue;
	}

	public String getObjectRefContractNumber() {
		return objectRefContractNumber;
	}

	public void setObjectRefContractDate(Date aValue) {
		objectRefContractDate = aValue;
	}

	public Date getObjectRefContractDate() {
		return objectRefContractDate;
	}

	public void setObjectRefPartnerCode(String aValue) {
		objectRefPartnerCode = aValue;
	}

	public String getObjectRefPartnerCode() {
		return objectRefPartnerCode;
	}

	public void setObjectRefPartnerName(String aValue) {
		objectRefPartnerName = aValue;
	}

	public String getObjectRefPartnerName() {
		return objectRefPartnerName;
	}

	public void setObjectRefFinDocCode(String aValue) {
		objectRefFinDocCode = aValue;
	}

	public String getObjectRefFinDocCode() {
		return objectRefFinDocCode;
	}

	public void setObjectRefFinDocID(int aValue) {
		objectRefFinDocID = aValue;
	}

	public int getObjectRefFinDocID() {
		return objectRefFinDocID;
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