
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.FinKodIst;

  /**
  * Filter for FinKodIst;  
  * 	
  */

public class FinKodIstFilter extends  FinKodIst {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public FinKodIstFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    value = Integer.MIN_VALUE; 
   }

} // end of Filter for FinKodIst

