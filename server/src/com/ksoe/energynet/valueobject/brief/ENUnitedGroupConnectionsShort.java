//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

/**
 * Short Object for ENUnitedGroupConnections;
 */

import java.io.Serializable;

public class ENUnitedGroupConnectionsShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String name;
    public String description;

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

    public void setDescription(String aValue) {
        description = aValue;
    }

    public String getDescription() {
        return description;
    }

}