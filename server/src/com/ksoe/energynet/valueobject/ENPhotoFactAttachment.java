
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENDocAttachmentRef;
import com.ksoe.energynet.valueobject.references.ENPhotoFactRef;

public class ENPhotoFactAttachment implements Serializable {

	public int code = Integer.MIN_VALUE;
	public ENDocAttachmentRef docAttachmentRef = new ENDocAttachmentRef();
	public ENPhotoFactRef photoFactRef = new ENPhotoFactRef();
	public static final String tableName = "ENPHOTOFACTATTACHMENT";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENPHOTOFACTATTACHMENT.CODE";
	public static final String docAttachmentRef_Attr = "docAttachmentRef";
	public static final String docAttachmentRef_Field = "DOCATTACHMENTREFCODE";
	public static final String docAttachmentRef_QFielld = "ENPHOTOFACTATTACHMENT.DOCATTACHMENTREFCODE";
	public static final String photoFactRef_Attr = "photoFactRef";
	public static final String photoFactRef_Field = "PHOTOFACTREFCODE";
	public static final String photoFactRef_QFielld = "ENPHOTOFACTATTACHMENT.PHOTOFACTREFCODE";

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

	public void setPhotoFactRef(ENPhotoFactRef aValue) {
		photoFactRef = aValue;
	}

	public ENPhotoFactRef getPhotoFactRef() {
		return photoFactRef;
	}

} // end of ENPhotoFactAttachmentValueObject
