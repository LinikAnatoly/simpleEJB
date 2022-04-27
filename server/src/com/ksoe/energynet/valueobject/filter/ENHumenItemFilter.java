
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENHumenItem;

  /**
  * Filter for ENHumenItem;  
  * 	
  */

public class ENHumenItemFilter extends  ENHumenItem {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENHumenItemFilter()
   {
    code = Integer.MIN_VALUE; 
    countGen = null; 
    countFact = null; 
    countFactOriginal = null; 
    price = null; 
    cost = null; 
    commentGen = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
    planItemRef.code = Integer.MIN_VALUE;
    positionGen.code = Integer.MIN_VALUE;
    typeRef.code = Integer.MIN_VALUE;
    finWorker.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENHumenItem

