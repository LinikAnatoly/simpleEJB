
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.SCUsageInput;

  /**
  * Filter for SCUsageInput;  
  * 	
  */

public class SCUsageInputFilter extends  SCUsageInput {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public SCUsageInputFilter()
   {
    code = Integer.MIN_VALUE; 
    numberDoc = null; 
    numberInt = Integer.MIN_VALUE; 
    dateGen = null; 
    dateStart = null; 
    dateFinal = null; 
    molCode = null; 
    molName = null; 
    commentGen = null; 
    dateEdit = null; 
    iszku = Integer.MIN_VALUE; 
    isprinted = Integer.MIN_VALUE; 
    molCodeCounter = null; 
    molNameCounter = null; 
    autoCreated = Integer.MIN_VALUE; 
    isDocsReceived = Integer.MIN_VALUE; 
    userGen = null; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    department.code = Integer.MIN_VALUE;
    statusRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for SCUsageInput

