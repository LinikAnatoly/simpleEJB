//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENDocAttachmentStatus;
 */

import java.io.Serializable;

public class ENDocAttachmentStatus implements Serializable {

    public static final int ACTIVE = 0;
    public static final int DELETE = 1;
    public static final int CHANGED = 2;

	public int code = Integer.MIN_VALUE;
	public String name;
	public static final String tableName = "ENDOCATTACHMENTSTATUS";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENDOCATTACHMENTSTATUS.CODE";
	public static final String name_Attr = "name";
	public static final String name_Field = "NAME";
	public static final String name_QFielld = "ENDOCATTACHMENTSTATUS.NAME";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setName(String aValue) {
		name = aValue;
	}

	public String getName() {
		return name;
	}

} // end of ENDocAttachmentStatusValueObject

