
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENWarrant;

  /**
  * Filter for ENWarrant;  
  * 	
  */

public class ENWarrantFilter extends  ENWarrant {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENWarrantFilter()
   {
    code = Integer.MIN_VALUE; 
    numbergen = null; 
    name = null; 
    dateStart = null; 
    dateFinal = null; 
    warrantFIO = null; 
    warrantShortFIO = null; 
    warrantPosition = null; 
    genitiveFIO = null; 
    genitivePosition = null; 
    personSurname = null; 
    personSurnameGenitive = null; 
    personName = null; 
    personNameGenitive = null; 
    personPatronimic = null; 
    personPatronimicGenitive = null; 
    passport = null; 
    address = null; 
    dateGen = null; 
    power = Integer.MIN_VALUE; 
    maxSum = null; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    departmentName = null; 
    departmentNameGenitive = null; 
    departmentRef.code = Integer.MIN_VALUE;
    warrantStatusRef.code = Integer.MIN_VALUE;
    warrantTypeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENWarrant

