
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSettleType;

  /**
  * Filter for ENSettleType;  
  * 	
  */

public class ENSettleTypeFilter extends  ENSettleType {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENSettleTypeFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    coef = null; 
   }

} // end of Filter for ENSettleType

