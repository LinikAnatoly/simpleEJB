
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

import java.io.Serializable;
import java.util.Date;

public class ENPhotoFactShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String description;
	public Date dateFact;
	public String actNumber;
	public String personalAccount;
	public String personalAccountUid;
	public String customerFIO;
	public Date dateAdd;
	public Date dateEdit;
	public String userGen;
	public int renRefCode = Integer.MIN_VALUE;
	public String renRefName;
	public int workOrderBytRefCode = Integer.MIN_VALUE;
	public String workOrderBytRefNumberGen;
	public Date workOrderBytRefDateGen;
	public String workOrderBytRefCommentGen;
	public Date workOrderBytRefDateAdd;
	public Date workOrderBytRefDateEdit;
	public String workOrderBytRefUserAdd;
	public String workOrderBytRefUserEdit;

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setDescription(String aValue) {
		description = aValue;
	}

	public String getDescription() {
		return description;
	}

	public void setDateFact(Date aValue) {
		dateFact = aValue;
	}

	public Date getDateFact() {
		return dateFact;
	}

	public void setActNumber(String aValue) {
		actNumber = aValue;
	}

	public String getActNumber() {
		return actNumber;
	}

	public void setPersonalAccount(String aValue) {
		personalAccount = aValue;
	}

	public String getPersonalAccount() {
		return personalAccount;
	}

	public void setPersonalAccountUid(String aValue) {
		personalAccountUid = aValue;
	}

	public String getPersonalAccountUid() {
		return personalAccountUid;
	}

	public void setCustomerFIO(String aValue) {
		customerFIO = aValue;
	}

	public String getCustomerFIO() {
		return customerFIO;
	}

	public void setDateAdd(Date aValue) {
		dateAdd = aValue;
	}

	public Date getDateAdd() {
		return dateAdd;
	}

	public void setDateEdit(Date aValue) {
		dateEdit = aValue;
	}

	public Date getDateEdit() {
		return dateEdit;
	}

	public void setUserGen(String aValue) {
		userGen = aValue;
	}

	public String getUserGen() {
		return userGen;
	}

	public void setRenRefCode(int aValue) {
		renRefCode = aValue;
	}

	public int getRenRefCode() {
		return renRefCode;
	}

	public void setRenRefName(String aValue) {
		renRefName = aValue;
	}

	public String getRenRefName() {
		return renRefName;
	}

	public void setWorkOrderBytRefCode(int aValue) {
		workOrderBytRefCode = aValue;
	}

	public int getWorkOrderBytRefCode() {
		return workOrderBytRefCode;
	}

	public void setWorkOrderBytRefNumberGen(String aValue) {
		workOrderBytRefNumberGen = aValue;
	}

	public String getWorkOrderBytRefNumberGen() {
		return workOrderBytRefNumberGen;
	}

	public void setWorkOrderBytRefDateGen(Date aValue) {
		workOrderBytRefDateGen = aValue;
	}

	public Date getWorkOrderBytRefDateGen() {
		return workOrderBytRefDateGen;
	}

	public void setWorkOrderBytRefCommentGen(String aValue) {
		workOrderBytRefCommentGen = aValue;
	}

	public String getWorkOrderBytRefCommentGen() {
		return workOrderBytRefCommentGen;
	}

	public void setWorkOrderBytRefDateAdd(Date aValue) {
		workOrderBytRefDateAdd = aValue;
	}

	public Date getWorkOrderBytRefDateAdd() {
		return workOrderBytRefDateAdd;
	}

	public void setWorkOrderBytRefDateEdit(Date aValue) {
		workOrderBytRefDateEdit = aValue;
	}

	public Date getWorkOrderBytRefDateEdit() {
		return workOrderBytRefDateEdit;
	}

	public void setWorkOrderBytRefUserAdd(String aValue) {
		workOrderBytRefUserAdd = aValue;
	}

	public String getWorkOrderBytRefUserAdd() {
		return workOrderBytRefUserAdd;
	}

	public void setWorkOrderBytRefUserEdit(String aValue) {
		workOrderBytRefUserEdit = aValue;
	}

	public String getWorkOrderBytRefUserEdit() {
		return workOrderBytRefUserEdit;
	}

}