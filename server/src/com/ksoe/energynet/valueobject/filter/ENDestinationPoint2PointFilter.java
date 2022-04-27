
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENDestinationPoint2Point;

  /**
  * Filter for ENDestinationPoint2Point;  
  * 	
  */

public class ENDestinationPoint2PointFilter extends  ENDestinationPoint2Point {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENDestinationPoint2PointFilter()
   {
    code = Integer.MIN_VALUE; 
    distance = null; 
    elementInRef.code = Integer.MIN_VALUE;
    elementOutRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENDestinationPoint2Point

