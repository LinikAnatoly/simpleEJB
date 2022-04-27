
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENNomenclaturesOperative;

  /**
  * Filter for ENNomenclaturesOperative;  
  * 	
  */

public class ENNomenclaturesOperativeFilter extends  ENNomenclaturesOperative {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENNomenclaturesOperativeFilter()
   {
    code = Integer.MIN_VALUE; 
    id = Integer.MIN_VALUE; 
    nn = null; 
    bal_sch = null; 
    name = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
   }

} // end of Filter for ENNomenclaturesOperative

