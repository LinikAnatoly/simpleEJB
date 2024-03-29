//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.references;

/**
 * References for ENDocAttachment2ENServicesObject;
 */

import java.io.Serializable;

public class ENDocAttachment2ENServicesObjectRef implements Serializable {
	public int code = Integer.MIN_VALUE;

	public static final String className = "com.ksoe.energynet.valueobject.ENDocAttachment2ENServicesObject";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

} // end of ENDocAttachment2ENServicesObjectRef

