
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPlanWork2CCDamageLog;

  /**
  * Filter for ENPlanWork2CCDamageLog;  
  * 	
  */

public class ENPlanWork2CCDamageLogFilter extends  ENPlanWork2CCDamageLog {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENPlanWork2CCDamageLogFilter()
   {
    code = Integer.MIN_VALUE; 
    modify_time = Long.MIN_VALUE;
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    ccDamageLogCode = Integer.MIN_VALUE; 
    newsPaperName = null; 
    newsPaperNumber = null; 
    datePubl = null; 
    dateBegin = null; 
    dateFinish = null; 
    needsApprovalByCustomer = Integer.MIN_VALUE; 
    planRef.code = Integer.MIN_VALUE;
    typeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENPlanWork2CCDamageLog

