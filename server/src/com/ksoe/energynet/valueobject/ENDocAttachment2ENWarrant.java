
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENDocAttachmentRef;
import com.ksoe.energynet.valueobject.references.ENWarrantRef;

public class ENDocAttachment2ENWarrant implements Serializable {

	public int code = Integer.MIN_VALUE;
	public ENDocAttachmentRef docAttachmentRef = new ENDocAttachmentRef();
	public ENWarrantRef warrantRef = new ENWarrantRef();
	public static final String tableName = "ENDOCATTACHMENT2NWRRNT";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENDOCATTACHMENT2NWRRNT.CODE";
	public static final String docAttachmentRef_Attr = "docAttachmentRef";
	public static final String docAttachmentRef_Field = "DOCATTACHMENTREFCODE";
	public static final String docAttachmentRef_QFielld = "ENDOCATTACHMENT2NWRRNT.DOCATTACHMENTREFCODE";
	public static final String warrantRef_Attr = "warrantRef";
	public static final String warrantRef_Field = "WARRANTREFCODE";
	public static final String warrantRef_QFielld = "ENDOCATTACHMENT2NWRRNT.WARRANTREFCODE";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setDocAttachmentRef(ENDocAttachmentRef aValue) {
		docAttachmentRef = aValue;
	}

	public ENDocAttachmentRef getDocAttachmentRef() {
		return docAttachmentRef;
	}

	public void setWarrantRef(ENWarrantRef aValue) {
		warrantRef = aValue;
	}

	public ENWarrantRef getWarrantRef() {
		return warrantRef;
	}

} // end of ENDocAttachment2ENWarrantValueObject
