//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENUnitedGroup2TechCondServices;

/**
 * Filter for ENUnitedGroup2TechCondServices;
 *
 */

public class ENUnitedGroup2TechCondServicesFilter extends
        ENUnitedGroup2TechCondServices {

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

    public ENUnitedGroup2TechCondServicesFilter() {
        code = Integer.MIN_VALUE;
        costLines04Building = null;
        costLines04Building1 = null;
        costLines04Building2 = null;
        costLines04Building3 = null;
        costLines10Building = null;
        costLines10Building1 = null;
        costLines10Building2 = null;
        costLines10Building3 = null;
        costLines10Building4 = null;
        techCondServRef.code = Integer.MIN_VALUE;
        unitedGroupL04D1Ref.code = Integer.MIN_VALUE;
        unitedGroupL04D2Ref.code = Integer.MIN_VALUE;
        unitedGroupL04D3Ref.code = Integer.MIN_VALUE;
        unitedGroupTP04Ref.code = Integer.MIN_VALUE;
        unitedGroupL10D1Ref.code = Integer.MIN_VALUE;
        unitedGroupL10D2Ref.code = Integer.MIN_VALUE;
        unitedGroupL10D3Ref.code = Integer.MIN_VALUE;
        unitedGroupL10D4Ref.code = Integer.MIN_VALUE;
        unitedGroupPS35Ref.code = Integer.MIN_VALUE;
    }

} // end of Filter for ENUnitedGroup2TechCondServices

