
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTravelSheetFuel2FINMaterials;

  /**
  * Filter for ENTravelSheetFuel2FINMaterials;  
  * 	
  */

public class ENTravelSheetFuel2FINMaterialsFilter extends  ENTravelSheetFuel2FINMaterials {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTravelSheetFuel2FINMaterialsFilter()
   {
    code = Integer.MIN_VALUE; 
    modify_time = Long.MIN_VALUE;
    userGen = null; 
    dateEdit = null; 
    travelSheetFuelRef.code = Integer.MIN_VALUE;
    finMaterialsRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENTravelSheetFuel2FINMaterials

