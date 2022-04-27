
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENDocAttType2Action;

  /**
  * Filter for ENDocAttType2Action;  
  * 	
  */

public class ENDocAttType2ActionFilter extends  ENDocAttType2Action {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENDocAttType2ActionFilter()
   {
    code = Integer.MIN_VALUE; 
    typeRef.code = Integer.MIN_VALUE;
    actionRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENDocAttType2Action

