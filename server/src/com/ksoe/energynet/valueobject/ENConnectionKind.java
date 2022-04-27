//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENConnectionKind;
 */

import java.io.Serializable;

public class ENConnectionKind implements Serializable {

    /** загальні договори на приєднання */
    public static final int GENERAL_CONNECTION = 0;

    /** стандартне приєднання */
    public static final int STANDART = 1;

    /** нестандартне приєднання */
    public static final int NO_STANDART = 2;

    /** тип приєднання не визначено*/
    public static final int UNDEFINED = 3;

    /** нестандартне приєднання (під ключ) */
    public static final int READY_MADE = 4;



    public int code = Integer.MIN_VALUE;
    public String name;
    public static final String tableName = "ENCONNECTIONKIND";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCONNECTIONKIND.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENCONNECTIONKIND.NAME";

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

} // end of ENConnectionKindValueObject

