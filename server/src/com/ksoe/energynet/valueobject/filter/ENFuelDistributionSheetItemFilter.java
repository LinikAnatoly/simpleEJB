
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENFuelDistributionSheetItem;

  /**
  * Filter for ENFuelDistributionSheetItem;  
  * 	
  */

public class ENFuelDistributionSheetItemFilter extends  ENFuelDistributionSheetItem {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENFuelDistributionSheetItemFilter()
   {
    code = Integer.MIN_VALUE; 
    decadeNumber = Integer.MIN_VALUE; 
    countGen = null; 
    count1 = null; 
    count2 = null; 
    count3 = null; 
    count4 = null; 
    count5 = null; 
    count6 = null; 
    count7 = null; 
    isConfirmed = Integer.MIN_VALUE; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    departmentRef.code = Integer.MIN_VALUE;
    fuelDistributionRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENFuelDistributionSheetItem

