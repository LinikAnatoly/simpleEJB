//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.references;

/**
 * References for FINContracts;
 */

import java.io.Serializable;

public class FINContractsRef implements Serializable {
	public int code = Integer.MIN_VALUE;

	public static final String className = "com.ksoe.energynet.valueobject.FINContracts";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

} // end of FINContractsRef

