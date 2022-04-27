
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENAct;

  /**
  * Filter for ENAct;  
  * 	
  */

public class ENActFilter extends  ENAct {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENActFilter()
   {
    code = Integer.MIN_VALUE; 
    numberGen = null; 
    dateGen = null; 
    finMolCode = null; 
    finMolName = null; 
    finMechanicCode = null; 
    finMechanicName = null; 
    commentGen = null; 
    invNumber = null; 
    userGen = null; 
    dateEdit = null; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    dateAct = null; 
    molCodeObject = null; 
    checkedByAccountant = null; 
    statusRef.code = Integer.MIN_VALUE;
    element.code = Integer.MIN_VALUE;
    actTypeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENAct

