
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPlanWork2ClassificationType;

  /**
  * Filter for ENPlanWork2ClassificationType;  
  * 	
  */

public class ENPlanWork2ClassificationTypeFilter extends  ENPlanWork2ClassificationType {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENPlanWork2ClassificationTypeFilter()
   {
    code = Integer.MIN_VALUE; 
    countGen = null; 
    commentGen = null; 
    userGen = null; 
    dateEdit = null; 
    machineHours = null; 
    relocationKm = null; 
    transportationLoad = null; 
    isPrintOnKmOrMH = Integer.MIN_VALUE; 
    costWorksContractor = null; 
    dateGen = null; 
    timeStart = null; 
    timeFinal = null; 
    codeVirtualBrigade = Integer.MIN_VALUE; 
    isJobsByTime = Integer.MIN_VALUE; 
    isVisitClient = Integer.MIN_VALUE; 
    productionExpensesPercent = null; 
    administrativeExpensesPercent = null; 
    modify_time = Long.MIN_VALUE;
    servicePaymentKind = Integer.MIN_VALUE; 
    planRef.code = Integer.MIN_VALUE;
    classificationTypeRef.code = Integer.MIN_VALUE;
    connectionWorkTypeRef.code = Integer.MIN_VALUE;
    calcKindRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENPlanWork2ClassificationType

