//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.references;

/**
 * References for ENFuelSheetVolumesStatus;
 */

import java.io.Serializable;

public class ENFuelSheetVolumesStatusRef implements Serializable {
	public int code = Integer.MIN_VALUE;

	public static final String className = "com.ksoe.energynet.valueobject.ENFuelSheetVolumesStatus";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

} // end of ENFuelSheetVolumesStatusRef

