//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENServicesObject2TechCondtnsServices;

/**
 * Filter for ENServicesObject2TechCondtnsServices;
 *
 */

public class ENServicesObject2TechCondtnsServicesFilter extends
        ENServicesObject2TechCondtnsServices {

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

    public ENServicesObject2TechCondtnsServicesFilter() {
        code = Integer.MIN_VALUE;
        techCondServRef.code = Integer.MIN_VALUE;
        servicesObjectRef.code = Integer.MIN_VALUE;
    }

} // end of Filter for ENServicesObject2TechCondtnsServices

