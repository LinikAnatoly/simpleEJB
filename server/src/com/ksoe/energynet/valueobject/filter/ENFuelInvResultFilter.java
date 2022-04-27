
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENFuelInvResult;

  /**
  * Filter for ENFuelInvResult;  
  * 	
  */

public class ENFuelInvResultFilter extends  ENFuelInvResult {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENFuelInvResultFilter()
   {
    code = Integer.MIN_VALUE; 
    deltaCount = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    inventarizationRef.code = Integer.MIN_VALUE;
    fuelTypeRef.code = Integer.MIN_VALUE;
    typeRef.code = Integer.MIN_VALUE;
    fkorderitemRef.code = Integer.MIN_VALUE;
    estimateItemRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENFuelInvResult

