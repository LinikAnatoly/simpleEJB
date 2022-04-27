//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.references;

/**
 * References for ENCalc2ConnectTariff;
 */

import java.io.Serializable;

public class ENCalc2ConnectTariffRef implements Serializable {
    public int code = Integer.MIN_VALUE;

    public static final String className = "com.ksoe.energynet.valueobject.ENCalc2ConnectTariff";

    public void setCode(int aValue) {
        code = aValue;
    }

    public int getCode() {
        return code;
    }

} // end of ENCalc2ConnectTariffRef

