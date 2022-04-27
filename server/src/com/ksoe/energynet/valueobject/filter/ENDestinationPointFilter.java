
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENDestinationPoint;

  /**
  * Filter for ENDestinationPoint;  
  * 	
  */

public class ENDestinationPointFilter extends  ENDestinationPoint {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENDestinationPointFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    commentGen = null; 
    dateEdit = null; 
    userGen = null; 
    modify_time = Long.MIN_VALUE;
    elementRef.code = Integer.MIN_VALUE;
    departmentRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENDestinationPoint

