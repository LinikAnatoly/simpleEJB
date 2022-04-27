
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENAverageCountPersonal;

  /**
  * Filter for ENAverageCountPersonal;  
  * 	
  */

public class ENAverageCountPersonalFilter extends  ENAverageCountPersonal {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENAverageCountPersonalFilter()
   {
    code = Integer.MIN_VALUE; 
    codePodr = null; 
    namePodr = null; 
    codeCeh = null; 
    nameCeh = null; 
    calculateDate = null; 
    dateEdit = null; 
    countGen = null; 
    personalVidId = null; 
    personalVidName = null; 
    userGen = null; 
    modify_time = Long.MIN_VALUE;
   }

} // end of Filter for ENAverageCountPersonal

