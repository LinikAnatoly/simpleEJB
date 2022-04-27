
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENCalcPowerReserve;

  /**
  * Filter for ENCalcPowerReserve;  
  * 	
  */

public class ENCalcPowerReserveFilter extends  ENCalcPowerReserve {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENCalcPowerReserveFilter()
   {
    code = Integer.MIN_VALUE; 
    modify_time = Long.MIN_VALUE;
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    servicesobjectRef.code = Integer.MIN_VALUE;
    gauge150Ref.code = Integer.MIN_VALUE;
    gaugeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENCalcPowerReserve

