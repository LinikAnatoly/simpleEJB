
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Mon Oct 05 15:21:12 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPlanWorkMoveHistory;

  /**
  * Filter for ENPlanWorkMoveHistory;  
  * 	
  */

public class ENPlanWorkMoveHistoryFilter extends  ENPlanWorkMoveHistory {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENPlanWorkMoveHistoryFilter()
   {
    code = Integer.MIN_VALUE; 
    dateGen = null; 
    yearGen = Integer.MIN_VALUE; 
    monthGen = Integer.MIN_VALUE; 
    commentGen = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    reason.code = Integer.MIN_VALUE;;
    planRef.code = Integer.MIN_VALUE;;
   }

} // end of Filter for ENPlanWorkMoveHistory

