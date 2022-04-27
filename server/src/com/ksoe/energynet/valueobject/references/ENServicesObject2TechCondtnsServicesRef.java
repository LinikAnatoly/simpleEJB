//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.references;

/**
 * References for ENServicesObject2TechCondtnsServices;
 */

import java.io.Serializable;

public class ENServicesObject2TechCondtnsServicesRef implements Serializable {
    public int code = Integer.MIN_VALUE;

    public static final String className = "com.ksoe.energynet.valueobject.ENServicesObject2TechCondtnsServices";

    public void setCode(int aValue) {
        code = aValue;
    }

    public int getCode() {
        return code;
    }

} // end of ENServicesObject2TechCondtnsServicesRef

