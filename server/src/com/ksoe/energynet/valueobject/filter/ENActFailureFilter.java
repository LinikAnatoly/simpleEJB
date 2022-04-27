
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENActFailure;

  /**
  * Filter for ENActFailure;  
  * 	
  */

public class ENActFailureFilter extends  ENActFailure {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENActFailureFilter()
   {
    code = Integer.MIN_VALUE; 
    numberGen = null; 
    dateAct = null; 
    commentGen = null; 
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    reasonRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENActFailure

