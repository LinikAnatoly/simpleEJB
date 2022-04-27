
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.FinRenCode2FinRenCodeBase;

  /**
  * Filter for FinRenCode2FinRenCodeBase;  
  * 	
  */

public class FinRenCode2FinRenCodeBaseFilter extends  FinRenCode2FinRenCodeBase {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public FinRenCode2FinRenCodeBaseFilter()
   {
    code = Integer.MIN_VALUE; 
    finRenCode = null; 
    finRenCodeOut = null; 
    priority = Integer.MIN_VALUE; 
   }

} // end of Filter for FinRenCode2FinRenCodeBase

