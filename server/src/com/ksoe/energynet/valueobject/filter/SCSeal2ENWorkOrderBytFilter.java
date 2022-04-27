
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.SCSeal2ENWorkOrderByt;

  /**
  * Filter for SCSeal2ENWorkOrderByt;  
  * 	
  */

public class SCSeal2ENWorkOrderBytFilter extends  SCSeal2ENWorkOrderByt {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public SCSeal2ENWorkOrderBytFilter()
   {
    code = Integer.MIN_VALUE; 
    commentGen = null; 
    modify_time = Long.MIN_VALUE;
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    sealRef.code = Integer.MIN_VALUE;
    workOrderBytRef.code = Integer.MIN_VALUE;
    workOrderBytItemRef.code = Integer.MIN_VALUE;
    kindRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for SCSeal2ENWorkOrderByt

