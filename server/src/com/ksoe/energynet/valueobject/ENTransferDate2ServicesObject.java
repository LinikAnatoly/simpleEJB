//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENTransferDate2ServicesObject;
 */

import java.io.Serializable;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENServicesObjectRef;

public class ENTransferDate2ServicesObject implements Serializable {

	public int code = Integer.MIN_VALUE;
	public Date issueDate;
	public Date returnDate;
	public String userGen;
	public Date dateEdit;
	public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
	public static final String tableName = "ENTRANSFERDT2SRVCSBJCT";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENTRANSFERDT2SRVCSBJCT.CODE";
	public static final String issueDate_Attr = "issueDate";
	public static final String issueDate_Field = "ISSUEDATE";
	public static final String issueDate_QFielld = "ENTRANSFERDT2SRVCSBJCT.ISSUEDATE";
	public static final String returnDate_Attr = "returnDate";
	public static final String returnDate_Field = "RETURNDATE";
	public static final String returnDate_QFielld = "ENTRANSFERDT2SRVCSBJCT.RETURNDATE";
	public static final String userGen_Attr = "userGen";
	public static final String userGen_Field = "USERGEN";
	public static final String userGen_QFielld = "ENTRANSFERDT2SRVCSBJCT.USERGEN";
	public static final String dateEdit_Attr = "dateEdit";
	public static final String dateEdit_Field = "DATEEDIT";
	public static final String dateEdit_QFielld = "ENTRANSFERDT2SRVCSBJCT.DATEEDIT";
	public static final String servicesObjectRef_Attr = "servicesObjectRef";
	public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
	public static final String servicesObjectRef_QFielld = "ENTRANSFERDT2SRVCSBJCT.SERVICESOBJECTREFCODE";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setIssueDate(Date aValue) {
		issueDate = aValue;
	}

	public Date getIssueDate() {
		return issueDate;
	}

	public void setReturnDate(Date aValue) {
		returnDate = aValue;
	}

	public Date getReturnDate() {
		return returnDate;
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

	public void setServicesObjectRef(ENServicesObjectRef aValue) {
		servicesObjectRef = aValue;
	}

	public ENServicesObjectRef getServicesObjectRef() {
		return servicesObjectRef;
	}

} // end of ENTransferDate2ServicesObjectValueObject

