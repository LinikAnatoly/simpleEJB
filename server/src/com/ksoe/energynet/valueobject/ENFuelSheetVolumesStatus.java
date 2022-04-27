//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENFuelSheetVolumesStatus;
 */

import java.io.Serializable;

public class ENFuelSheetVolumesStatus implements Serializable {

	/** Статус  - "Черновая" */
	public static final int DRAFT = 1;
	/** Статус  - "Утвержденная" */
	public static final int APPROVED = 2;

	public int code = Integer.MIN_VALUE;
	public String name;
	public static final String tableName = "ENFUELSHEETVOLUMESSTTS";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENFUELSHEETVOLUMESSTTS.CODE";
	public static final String name_Attr = "name";
	public static final String name_Field = "NAME";
	public static final String name_QFielld = "ENFUELSHEETVOLUMESSTTS.NAME";

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

} // end of ENFuelSheetVolumesStatusValueObject

