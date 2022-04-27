//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENEstimateHistory;

/**
 * Filter for ENEstimateHistory;
 *
 */

public class ENEstimateHistoryFilter extends ENEstimateHistory {

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

    public ENEstimateHistoryFilter() {
        code = Integer.MIN_VALUE;
        countFact = null;
        historyTypeRef.code = Integer.MIN_VALUE;
        estimateItemRef.code = Integer.MIN_VALUE;
        rqOrderItemRef.code = Integer.MIN_VALUE;
        rqBillItemRef.code = Integer.MIN_VALUE;
        fkOrderItemRef.code = Integer.MIN_VALUE;
    }

} // end of Filter for ENEstimateHistory

