
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENBuilding2Commission;

  /**
  * Filter for ENBuilding2Commission;  
  * 	
  */

public class ENBuilding2CommissionFilter extends  ENBuilding2Commission {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENBuilding2CommissionFilter()
   {
    code = Integer.MIN_VALUE; 
    tabNumber = null; 
    FIO = null; 
    shortFIO = null; 
    positionName = null; 
    ENBuildingRef.code = Integer.MIN_VALUE;
    ENBuildingCommissionTypeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENBuilding2Commission

