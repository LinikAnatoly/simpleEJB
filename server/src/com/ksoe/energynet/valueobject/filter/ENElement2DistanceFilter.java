
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENElement2Distance;

  /**
  * Filter for ENElement2Distance;  
  * 	
  */

public class ENElement2DistanceFilter extends  ENElement2Distance {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENElement2DistanceFilter()
   {
    code = Integer.MIN_VALUE; 
    distance = null; 
    elementRef.code = Integer.MIN_VALUE;
    transportDepartment.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENElement2Distance

