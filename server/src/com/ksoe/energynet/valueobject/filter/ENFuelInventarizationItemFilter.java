
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENFuelInventarizationItem;

  /**
  * Filter for ENFuelInventarizationItem;  
  * 	
  */

public class ENFuelInventarizationItemFilter extends  ENFuelInventarizationItem {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENFuelInventarizationItemFilter()
   {
    code = Integer.MIN_VALUE; 
    countGen = null; 
    countFact = null; 
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    inventarizationRef.code = Integer.MIN_VALUE;
    fuelTypeRef.code = Integer.MIN_VALUE;
    transportRealRef.code = Integer.MIN_VALUE;
    travelSheetRef.code = Integer.MIN_VALUE;
    travelFuelTypeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENFuelInventarizationItem

