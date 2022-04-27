
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENFuelCard;

  /**
  * Filter for ENFuelCard;  
  * 	
  */

public class ENFuelCardFilter extends  ENFuelCard {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENFuelCardFilter()
   {
    code = Integer.MIN_VALUE; 
    reg_id = null; 
    userGen = null; 
    dateEdit = null; 
    dateApply = null; 
    fuelType.code = Integer.MIN_VALUE;
    finWorker.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENFuelCard

