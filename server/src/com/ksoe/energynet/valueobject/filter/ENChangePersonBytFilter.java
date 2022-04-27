
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENChangePersonByt;

  /**
  * Filter for ENChangePersonByt;  
  * 	
  */

public class ENChangePersonBytFilter extends  ENChangePersonByt {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENChangePersonBytFilter()
   {
    code = Integer.MIN_VALUE; 
    fio = null; 
    accountNumber = null; 
    packCode = Integer.MIN_VALUE; 
    registrationNumber = null; 
    registrationDate = null; 
    modify_time = Long.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENChangePersonByt

