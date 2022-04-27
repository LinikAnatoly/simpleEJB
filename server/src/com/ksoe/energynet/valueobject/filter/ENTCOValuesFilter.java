
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTCOValues;

  /**
  * Filter for ENTCOValues;  
  * 	
  */

public class ENTCOValuesFilter extends  ENTCOValues {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTCOValuesFilter()
   {
    code = Integer.MIN_VALUE; 
    description = null; 
    techconditionsobjects.code = Integer.MIN_VALUE;
    tcoValuesType.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENTCOValues

