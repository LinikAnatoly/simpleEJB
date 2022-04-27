//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENUnitedGroupConnections;

/**
 * Filter for ENUnitedGroupConnections;
 *
 */

public class ENUnitedGroupConnectionsFilter extends ENUnitedGroupConnections {

    public String conditionSQL;
    public String orderBySQL;

    public final String getConditionSQL() {
        return conditionSQL;
    }

    public final void setConditionSQL(String aValue) {
        conditionSQL = aValue;
    }

    public final String getOrderBySQL() {
        return orderBySQL;
    }

    public final void setOrderBySQL(String aValue) {
        orderBySQL = aValue;
    }

    public ENUnitedGroupConnectionsFilter() {
        code = Integer.MIN_VALUE;
        name = null;
        description = null;
    }

} // end of Filter for ENUnitedGroupConnections

