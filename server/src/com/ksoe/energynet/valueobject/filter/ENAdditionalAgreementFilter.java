
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENAdditionalAgreement;

  /**
  * Filter for ENAdditionalAgreement;  
  * 	
  */

public class ENAdditionalAgreementFilter extends  ENAdditionalAgreement {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENAdditionalAgreementFilter()
   {
    code = Integer.MIN_VALUE; 
    numberGen = null; 
    dateGen = null; 
    sumWithoutVAT = null; 
    sumVAT = null; 
    calcSumsByCalculations = null; 
    isSigned = null; 
    servicesobjectRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENAdditionalAgreement

