
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENRoadTypeData;

  /**
  * Filter for ENRoadTypeData;  
  * 	
  */

public class ENRoadTypeDataFilter extends  ENRoadTypeData {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENRoadTypeDataFilter()
   {
    code = Integer.MIN_VALUE; 
    speed = null; 
    distance = null; 
    isWinter = Integer.MIN_VALUE; 
    coeff = null; 
    typeRef.code = Integer.MIN_VALUE;;
   }

} // end of Filter for ENRoadTypeData

