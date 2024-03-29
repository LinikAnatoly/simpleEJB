
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENElement2ActType;

  /**
  * Filter for ENElement2ActType;  
  * 	
  */

public class ENElement2ActTypeFilter extends  ENElement2ActType {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENElement2ActTypeFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    commentGen = null; 
   }

} // end of Filter for ENElement2ActType

