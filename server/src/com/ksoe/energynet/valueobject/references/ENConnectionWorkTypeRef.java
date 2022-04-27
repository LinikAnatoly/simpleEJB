//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.references;

/**
 * References for ENConnectionWorkType;
 */

import java.io.Serializable;

public class ENConnectionWorkTypeRef implements Serializable {
    public int code = Integer.MIN_VALUE;

    public static final String className = "com.ksoe.energynet.valueobject.ENConnectionWorkType";

    public void setCode(int aValue) {
        code = aValue;
    }

    public int getCode() {
        return code;
    }

} // end of ENConnectionWorkTypeRef

