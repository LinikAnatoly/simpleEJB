//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.references;

/**
 * References for ENIPItem2Plan;
 */

import java.io.Serializable;

public class ENIPItem2PlanRef implements Serializable {
    public int code = Integer.MIN_VALUE;

    public static final String className = "com.ksoe.energynet.valueobject.ENIPItem2Plan";

    public void setCode(int aValue) {
        code = aValue;
    }

    public int getCode() {
        return code;
    }

} // end of ENIPItem2PlanRef

