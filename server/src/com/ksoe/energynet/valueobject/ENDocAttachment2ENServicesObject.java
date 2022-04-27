//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENDocAttachment2ENServicesObject;
 */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENAttachment2ServicesKindRef;
import com.ksoe.energynet.valueobject.references.ENDocAttachmentRef;
import com.ksoe.energynet.valueobject.references.ENServicesObjectRef;

public class ENDocAttachment2ENServicesObject implements Serializable {

	public int code = Integer.MIN_VALUE;
	public ENDocAttachmentRef docAttachmentRef = new ENDocAttachmentRef();
	public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
	public ENAttachment2ServicesKindRef kindRef = new ENAttachment2ServicesKindRef();
	public static final String tableName = "ENDCTTCHMNT2NSRVCSBJCT";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENDCTTCHMNT2NSRVCSBJCT.CODE";
	public static final String docAttachmentRef_Attr = "docAttachmentRef";
	public static final String docAttachmentRef_Field = "DOCATTACHMENTREFCODE";
	public static final String docAttachmentRef_QFielld = "ENDCTTCHMNT2NSRVCSBJCT.DOCATTACHMENTREFCODE";
	public static final String servicesObjectRef_Attr = "servicesObjectRef";
	public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
	public static final String servicesObjectRef_QFielld = "ENDCTTCHMNT2NSRVCSBJCT.SERVICESOBJECTREFCODE";
	public static final String kindRef_Attr = "kindRef";
	public static final String kindRef_Field = "KINDREFCODE";
	public static final String kindRef_QFielld = "ENDCTTCHMNT2NSRVCSBJCT.KINDREFCODE";

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

	public void setServicesObjectRef(ENServicesObjectRef aValue) {
		servicesObjectRef = aValue;
	}

	public ENServicesObjectRef getServicesObjectRef() {
		return servicesObjectRef;
	}

	public void setKindRef(ENAttachment2ServicesKindRef aValue) {
		kindRef = aValue;
	}

	public ENAttachment2ServicesKindRef getKindRef() {
		return kindRef;
	}

} // end of ENDocAttachment2ENServicesObjectValueObject

