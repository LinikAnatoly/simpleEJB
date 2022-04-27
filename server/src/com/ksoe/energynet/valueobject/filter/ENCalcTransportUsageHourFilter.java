
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENCalcTransportUsageHour;

  /**
  * Filter for ENCalcTransportUsageHour;  
  * 	
  */

public class ENCalcTransportUsageHourFilter extends  ENCalcTransportUsageHour {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENCalcTransportUsageHourFilter()
   {
    code = Integer.MIN_VALUE; 
    salaryMonthDriver = null; 
    normWorkTimeMonth = null; 
    salaryHourDriver = null; 
    salaryChargeHourDriver = null; 
    salaryTotalHourDriver = null; 
    costMachine = null; 
    amortizationYearMachine = null; 
    amortizationHourMachine = null; 
    fuelExpensesMachine = null; 
    annualRepairCostsPercent = null; 
    annualRepairCosts = null; 
    repairCostsPerHour = null; 
    costTotalHourMachine = null; 
    productionCosts = null; 
    administrativeCosts = null; 
    profitRate = null; 
    costPerKilometer = null; 
    commentPerKilometer = null; 
    modify_time = Long.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
    tkTransportRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENCalcTransportUsageHour

