
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPlanWorkItem;

  /**
  * Filter for ENPlanWorkItem;
  *
  */

public class ENPlanWorkItemFilter extends  ENPlanWorkItem {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENPlanWorkItemFilter()
   {
    code = Integer.MIN_VALUE;
    countGen = null;
    commentGen = null;
    //workerCount = Integer.MIN_VALUE;
    userGen = null;
    dateEdit = null;
    modify_time = Long.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
    kartaRef.code = Integer.MIN_VALUE;
    //executor.code = Integer.MIN_VALUE;;
    timeGen = null;
   }

} // end of Filter for ENPlanWorkItem

