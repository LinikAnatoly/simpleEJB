
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENExecutor;

  /**
  * Filter for ENExecutor;  
  * 	
  */

public class ENExecutorFilter extends  ENExecutor {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENExecutorFilter()
   {
    code = Integer.MIN_VALUE; 
    executorFio = null; 
    executorPhone = null; 
    executorEmail = null; 
    commentGen = null; 
    sheetTypeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENExecutor

