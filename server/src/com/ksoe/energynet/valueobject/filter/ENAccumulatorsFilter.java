
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENAccumulators;

  /**
  * Filter for ENAccumulators;  
  * 	
  */

public class ENAccumulatorsFilter extends  ENAccumulators {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENAccumulatorsFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    typeName = null; 
    factory = null; 
    garageNumber = null; 
    yearProduction = null; 
    serialNumber = null; 
    receiptDate = null; 
    mileage = null; 
    mileageAll = null; 
    potencial = null; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    materialRef.code = Integer.MIN_VALUE;
    installStatusRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENAccumulators

