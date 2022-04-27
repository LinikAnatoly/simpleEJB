
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENActIncomeServices;

  /**
  * Filter for ENActIncomeServices;  
  * 	
  */

public class ENActIncomeServicesFilter extends  ENActIncomeServices {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENActIncomeServicesFilter()
   {
    code = Integer.MIN_VALUE; 
    numberGen = null; 
    dateGen = null; 
    actDateStart = null; 
    actDateEnd = null; 
    summaGen = null; 
    summaVat = null; 
    commentGen = null; 
    dateAdd = null; 
    dateEdit = null; 
    userGen = null; 
    isManualSum = null; 
    servicesObjectRef.code = Integer.MIN_VALUE;
    statusRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENActIncomeServices

