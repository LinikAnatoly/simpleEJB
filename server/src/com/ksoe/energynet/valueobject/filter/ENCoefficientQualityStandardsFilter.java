
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENCoefficientQualityStandards;

  /**
  * Filter for ENCoefficientQualityStandards;  
  * 	
  */

public class ENCoefficientQualityStandardsFilter extends  ENCoefficientQualityStandards {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENCoefficientQualityStandardsFilter()
   {
    code = Integer.MIN_VALUE; 
    summa = null; 
    coefficient = null; 
    dateGen = null; 
    finPodrCode = Integer.MIN_VALUE; 
    axOrgId = null; 
   }

} // end of Filter for ENCoefficientQualityStandards

