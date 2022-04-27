
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENServicesFactCalc;

  /**
  * Filter for ENServicesFactCalc;  
  * 	
  */

public class ENServicesFactCalcFilter extends  ENServicesFactCalc {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENServicesFactCalcFilter()
   {
    code = Integer.MIN_VALUE; 
    calcCost = null; 
    materialsCost = null; 
    transportCost = null; 
    deliveryCost = null; 
    sumGen = null; 
    vatSum = null; 
    totalSum = null; 
    sumCalc = null; 
    vatSumCalc = null; 
    totalSumCalc = null; 
    percentPrepay = null; 
    sumPrepay = null; 
    vatSumPrepay = null; 
    totalSumPrepay = null; 
    sumRest = null; 
    vatSumRest = null; 
    totalSumRest = null; 
    commentGen = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    servicesObjectRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENServicesFactCalc

