//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.references;

/**
 * References for ENUnitedGroup2TechCondServices;
 */

import java.io.Serializable;

public class ENUnitedGroup2TechCondServicesRef implements Serializable {
    public int code = Integer.MIN_VALUE;

    public static final String className = "com.ksoe.energynet.valueobject.ENUnitedGroup2TechCondServices";

    public void setCode(int aValue) {
        code = aValue;
    }

    public int getCode() {
        return code;
    }

} // end of ENUnitedGroup2TechCondServicesRef

