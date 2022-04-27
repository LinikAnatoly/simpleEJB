
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENActIncome2ENAct;

  /**
  * Filter for ENActIncome2ENAct;  
  * 	
  */

public class ENActIncome2ENActFilter extends  ENActIncome2ENAct {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENActIncome2ENActFilter()
   {
    code = Integer.MIN_VALUE; 
    actIncomeRef.code = Integer.MIN_VALUE;
    actRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENActIncome2ENAct

