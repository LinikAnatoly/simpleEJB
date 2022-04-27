
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

import java.io.Serializable;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENWorkOrderBytRef;
import com.ksoe.energypro.valueobject.references.EPRenRef;

public class ENPhotoFact implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String description;
	public Date dateFact;
	public String actNumber;
	public String personalAccount;
	public String personalAccountUid;
	public int recordpointCode = Integer.MIN_VALUE;
	public String customerFIO;
	public Date dateAdd;
	public Date dateEdit;
	public String userGen;
	public EPRenRef renRef = new EPRenRef();
	public ENWorkOrderBytRef workOrderBytRef = new ENWorkOrderBytRef();
	public static final String tableName = "ENPHOTOFACT";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENPHOTOFACT.CODE";
	public static final String description_Attr = "description";
	public static final String description_Field = "DESCRIPTION";
	public static final String description_QFielld = "ENPHOTOFACT.DESCRIPTION";
	public static final String dateFact_Attr = "dateFact";
	public static final String dateFact_Field = "DATEFACT";
	public static final String dateFact_QFielld = "ENPHOTOFACT.DATEFACT";
	public static final String actNumber_Attr = "actNumber";
	public static final String actNumber_Field = "ACTNUMBER";
	public static final String actNumber_QFielld = "ENPHOTOFACT.ACTNUMBER";
	public static final String personalAccount_Attr = "personalAccount";
	public static final String personalAccount_Field = "PERSONALACCOUNT";
	public static final String personalAccount_QFielld = "ENPHOTOFACT.PERSONALACCOUNT";
	public static final String personalAccountUid_Attr = "personalAccountUid";
	public static final String personalAccountUid_Field = "PERSONALACCOUNTUID";
	public static final String personalAccountUid_QFielld = "ENPHOTOFACT.PERSONALACCOUNTUID";
	public static final String recordpointCode_Attr = "recordpointCode";
	public static final String recordpointCode_Field = "RECORDPOINTCODE";
	public static final String recordpointCode_QFielld = "ENPHOTOFACT.RECORDPOINTCODE";
	public static final String customerFIO_Attr = "customerFIO";
	public static final String customerFIO_Field = "CUSTOMERFIO";
	public static final String customerFIO_QFielld = "ENPHOTOFACT.CUSTOMERFIO";
	public static final String dateAdd_Attr = "dateAdd";
	public static final String dateAdd_Field = "DATEADD";
	public static final String dateAdd_QFielld = "ENPHOTOFACT.DATEADD";
	public static final String dateEdit_Attr = "dateEdit";
	public static final String dateEdit_Field = "DATEEDIT";
	public static final String dateEdit_QFielld = "ENPHOTOFACT.DATEEDIT";
	public static final String userGen_Attr = "userGen";
	public static final String userGen_Field = "USERGEN";
	public static final String userGen_QFielld = "ENPHOTOFACT.USERGEN";
	public static final String renRef_Attr = "renRef";
	public static final String renRef_Field = "RENREFCODE";
	public static final String renRef_QFielld = "ENPHOTOFACT.RENREFCODE";
	public static final String workOrderBytRef_Attr = "workOrderBytRef";
	public static final String workOrderBytRef_Field = "WORKORDERBYTREFCODE";
	public static final String workOrderBytRef_QFielld = "ENPHOTOFACT.WORKORDERBYTREFCODE";

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

	public void setRecordpointCode(int aValue) {
		recordpointCode = aValue;
	}

	public int getRecordpointCode() {
		return recordpointCode;
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

	public void setRenRef(EPRenRef aValue) {
		renRef = aValue;
	}

	public EPRenRef getRenRef() {
		return renRef;
	}

	public void setWorkOrderBytRef(ENWorkOrderBytRef aValue) {
		workOrderBytRef = aValue;
	}

	public ENWorkOrderBytRef getWorkOrderBytRef() {
		return workOrderBytRef;
	}

} // end of ENPhotoFactValueObject
