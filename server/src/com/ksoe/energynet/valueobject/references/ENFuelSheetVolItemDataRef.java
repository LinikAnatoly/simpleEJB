//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.references;

/**
 * References for ENFuelSheetVolItemData;
 */

import java.io.Serializable;

public class ENFuelSheetVolItemDataRef implements Serializable {
	public int code = Integer.MIN_VALUE;

	public static final String className = "com.ksoe.energynet.valueobject.ENFuelSheetVolItemData";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

} // end of ENFuelSheetVolItemDataRef

