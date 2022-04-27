
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENAct2CostRecovery;

  /**
  * Filter for ENAct2CostRecovery;  
  * 	
  */

public class ENAct2CostRecoveryFilter extends  ENAct2CostRecovery {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENAct2CostRecoveryFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    measureUnitName = null; 
    countGen = null; 
    price = null; 
    summa = null; 
    actRef.code = Integer.MIN_VALUE;
    classificationTypeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENAct2CostRecovery

