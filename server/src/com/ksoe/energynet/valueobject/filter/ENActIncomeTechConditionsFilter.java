//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENActIncomeTechConditions;

/**
 * Filter for ENActIncomeTechConditions;
 *
 */

public class ENActIncomeTechConditionsFilter extends ENActIncomeTechConditions {

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

    public ENActIncomeTechConditionsFilter() {
        code = Integer.MIN_VALUE;
        numbergen = null;
        dategen = null;
        actDateStart = null;
        actDateEnd = null;
        summaGen = null;
        summaVat = null;
        commentGen = null;
        domain_info = null;
        modify_time = Long.MIN_VALUE;
        techCondServicesRef.code = Integer.MIN_VALUE;
        statusRef.code = Integer.MIN_VALUE;
        warrantRef.code = Integer.MIN_VALUE;
    }

} // end of Filter for ENActIncomeTechConditions

