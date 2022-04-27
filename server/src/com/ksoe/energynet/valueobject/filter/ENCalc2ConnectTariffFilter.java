//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENCalc2ConnectTariff;

/**
 * Filter for ENCalc2ConnectTariff;
 *
 */

public class ENCalc2ConnectTariffFilter extends ENCalc2ConnectTariff {

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

    public ENCalc2ConnectTariffFilter() {
        code = Integer.MIN_VALUE;
        power1Tariff = null;
        tariff1value = null;
        summa1Tariff = null;
        power2Tariff = null;
        tariff2value = null;
        summa2Tariff = null;
        summaTotal = null;
        userGen = null;
        dateEdit = null;
        modify_time = Long.MIN_VALUE;
        techCondServRef.code = Integer.MIN_VALUE;
        tariffEntry1Ref.code = Integer.MIN_VALUE;
        tariffEntry2Ref.code = Integer.MIN_VALUE;
    }

} // end of Filter for ENCalc2ConnectTariff

