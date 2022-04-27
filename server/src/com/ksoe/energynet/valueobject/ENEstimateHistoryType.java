//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENEstimateHistoryType;
 */

import java.io.Serializable;

public class ENEstimateHistoryType implements Serializable {

    public static final int IN_RQORDER = 1;
    public static final int IN_RQBILL = 2;
    public static final int IN_FKORDER = 3;

    public int code = Integer.MIN_VALUE;
    public String name;
    public static final String tableName = "ENESTIMATEHISTORYTYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENESTIMATEHISTORYTYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENESTIMATEHISTORYTYPE.NAME";

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

} // end of ENEstimateHistoryTypeValueObject

