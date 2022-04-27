//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENConnectionWorkType;
 */

import java.io.Serializable;

public class ENConnectionWorkType implements Serializable {

    /** Виготовлення та видача технічних умов */
    public static final int TU = 1;
    /** Узгодження проектно-кошторисної документації */
    public static final int AGREEMENT = 2;
    /** Підключення юридичних (побутових) споживачів */
    public static final int CONNECTIONS = 3;


    public int code = Integer.MIN_VALUE;
    public String name;
    public static final String tableName = "ENCONNECTIONWORKTYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCONNECTIONWORKTYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENCONNECTIONWORKTYPE.NAME";

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

} // end of ENConnectionWorkTypeValueObject

