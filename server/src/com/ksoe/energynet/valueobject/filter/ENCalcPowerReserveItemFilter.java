
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENCalcPowerReserveItem;

  /**
  * Filter for ENCalcPowerReserveItem;  
  * 	
  */

public class ENCalcPowerReserveItemFilter extends  ENCalcPowerReserveItem {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENCalcPowerReserveItemFilter()
   {
    code = Integer.MIN_VALUE; 
    modify_time = Long.MIN_VALUE;
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    calcPowerReserveRef.code = Integer.MIN_VALUE;
    so2nodeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENCalcPowerReserveItem

