
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTransformerObject;

  /**
  * Filter for ENTransformerObject;
  *
  */

public class ENTransformerObjectFilter extends  ENTransformerObject {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTransformerObjectFilter()
   {
    code = Integer.MIN_VALUE;
    name = null;
    buildNumber = null;
    buildYear = Integer.MIN_VALUE;
    voltageHi = null;
    voltageLow = null;
    nomPower = null;
    buhName = null;
    invNumber = null;
    commentGen = null;
    domain_info = null;
    modify_time = Long.MIN_VALUE;
    transformerType.code = Integer.MIN_VALUE;;
    element.code = Integer.MIN_VALUE;;
   }

} // end of Filter for ENTransformerObject

