//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENIPItem2Plan;

/**
 * Filter for ENIPItem2Plan;
 *
 */

public class ENIPItem2PlanFilter extends ENIPItem2Plan {

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

    public ENIPItem2PlanFilter() {
        code = Integer.MIN_VALUE;
        userAdd = null;
        dateAdd = null;
        userGen = null;
        dateEdit = null;
        modify_time = Long.MIN_VALUE;
        ipItemRef.code = Integer.MIN_VALUE;
        planRef.code = Integer.MIN_VALUE;
    }

} // end of Filter for ENIPItem2Plan

