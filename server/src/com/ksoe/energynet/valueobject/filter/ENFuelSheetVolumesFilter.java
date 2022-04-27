
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENFuelSheetVolumes;

  /**
  * Filter for ENFuelSheetVolumes;  
  * 	
  */

public class ENFuelSheetVolumesFilter extends  ENFuelSheetVolumes {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENFuelSheetVolumesFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    dateGen = null; 
    startDate = null; 
    endDate = null; 
    fuelType = Integer.MIN_VALUE; 
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    statusRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENFuelSheetVolumes

