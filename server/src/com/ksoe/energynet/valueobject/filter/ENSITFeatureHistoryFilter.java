
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSITFeatureHistory;

  /**
  * Filter for ENSITFeatureHistory;  
  * 	
  */

public class ENSITFeatureHistoryFilter extends  ENSITFeatureHistory {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENSITFeatureHistoryFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    newvalue = null; 
    oldvalue = null; 
    dategen = null; 
    equipment.code = Integer.MIN_VALUE;;
    featureType.code = Integer.MIN_VALUE;;
   }

} // end of Filter for ENSITFeatureHistory

