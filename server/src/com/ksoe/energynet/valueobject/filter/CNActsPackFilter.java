
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.CNActsPack;

  /**
  * Filter for CNActsPack;  
  * 	
  */

public class CNActsPackFilter extends  CNActsPack {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public CNActsPackFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    address = null; 
    address_jur = null; 
    purpose = null; 
    business_type = null; 
    blank_number = null; 
    act_number = null; 
    act_date = null; 
    act_sum = null; 
    pay_date = null; 
    pay_sum = null; 
    is_ksoe = Integer.MIN_VALUE; 
    status = Integer.MIN_VALUE; 
    id_ren = Integer.MIN_VALUE; 
    renName = null; 
    id_pack_status = Integer.MIN_VALUE; 
    statusName = null; 
    id_waiting_status = Integer.MIN_VALUE; 
    waitingStatus = null; 
    subsystemRef.code = Integer.MIN_VALUE;
    dfPackRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for CNActsPack

