
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENDestinationOrder;

  /**
  * Filter for ENDestinationOrder;  
  * 	
  */

public class ENDestinationOrderFilter extends  ENDestinationOrder {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENDestinationOrderFilter()
   {
    code = Integer.MIN_VALUE; 
    numberInOrder = Integer.MIN_VALUE; 
    commentGen = null; 
    modify_time = Long.MIN_VALUE;
    elementInRef.code = Integer.MIN_VALUE;
    elementOutRef.code = Integer.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENDestinationOrder

