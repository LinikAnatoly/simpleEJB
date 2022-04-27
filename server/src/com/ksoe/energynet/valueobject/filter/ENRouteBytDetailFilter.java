
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENRouteBytDetail;

  /**
  * Filter for ENRouteBytDetail;  
  * 	
  */

public class ENRouteBytDetailFilter extends  ENRouteBytDetail {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENRouteBytDetailFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    numbergen = null; 
    routeCode = Integer.MIN_VALUE; 
    rpCode = Integer.MIN_VALUE; 
    rpName = null; 
    entryCode = Integer.MIN_VALUE; 
    statusCode = Integer.MIN_VALUE; 
    modify_time = Long.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
    element.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENRouteBytDetail

