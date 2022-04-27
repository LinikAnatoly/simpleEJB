
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENContractItem;

  /**
  * Filter for ENContractItem;  
  * 	
  */

public class ENContractItemFilter extends  ENContractItem {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENContractItemFilter()
   {
    code = Integer.MIN_VALUE; 
    countGen = null; 
    price = null; 
    cost = null; 
    commentGen = null; 
    countReal = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    material.code = Integer.MIN_VALUE;
    contract.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENContractItem

