
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENCalcContractTotal;

  /**
  * Filter for ENCalcContractTotal;  
  * 	
  */

public class ENCalcContractTotalFilter extends  ENCalcContractTotal {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENCalcContractTotalFilter()
   {
    code = Integer.MIN_VALUE; 
    costWithoutVAT = null; 
    costVAT = null; 
    totalCost = null; 
    modify_time = Long.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENCalcContractTotal

