
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENAccumulatorsDistance;

  /**
  * Filter for ENAccumulatorsDistance;  
  * 	
  */

public class ENAccumulatorsDistanceFilter extends  ENAccumulatorsDistance {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENAccumulatorsDistanceFilter()
   {
    code = Integer.MIN_VALUE; 
    recordDistance = null; 
    recordtDate = null; 
    accumulatorsRef.code = Integer.MIN_VALUE;
    transportRealRef.code = Integer.MIN_VALUE;
    travelSheetRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENAccumulatorsDistance

