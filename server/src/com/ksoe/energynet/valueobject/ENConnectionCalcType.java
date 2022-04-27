//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENConnectionCalcType;
 */

import java.io.Serializable;

public class ENConnectionCalcType implements Serializable {

    /** Потужність за ТУ не перевищує резерв */
    public static final int NOT_ABOVE_RESERVE = 1;

    /** Потужність за ТУ перевищує резерв */
    public static final int ABOVE_RESERVE = 2;


    public int code = Integer.MIN_VALUE;
    public String name;
    public static final String tableName = "ENCONNECTIONCALCTYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCONNECTIONCALCTYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENCONNECTIONCALCTYPE.NAME";

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

} // end of ENConnectionCalcTypeValueObject

