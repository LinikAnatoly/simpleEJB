
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.RegulatoryAssetBaseGroup;

  /**
  * Filter for RegulatoryAssetBaseGroup;  
  * 	
  */

public class RegulatoryAssetBaseGroupFilter extends  RegulatoryAssetBaseGroup {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public RegulatoryAssetBaseGroupFilter()
   {
    code = Integer.MIN_VALUE; 
    number = null; 
    name = null; 
    usefulLife = Integer.MIN_VALUE; 
    parentRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for RegulatoryAssetBaseGroup

