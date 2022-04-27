
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENBudgets2Nomenclatures;

  /**
  * Filter for ENBudgets2Nomenclatures;  
  * 	
  */

public class ENBudgets2NomenclaturesFilter extends  ENBudgets2Nomenclatures {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENBudgets2NomenclaturesFilter()
   {
    code = Integer.MIN_VALUE; 
    mat_id = Integer.MIN_VALUE; 
    nn = null; 
    mat_name = null; 
    budgetRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENBudgets2Nomenclatures

