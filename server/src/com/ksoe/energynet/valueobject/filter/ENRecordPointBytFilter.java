
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENRecordPointByt;

  /**
  * Filter for ENRecordPointByt;  
  * 	
  */

public class ENRecordPointBytFilter extends  ENRecordPointByt {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENRecordPointBytFilter()
   {
    code = Integer.MIN_VALUE; 
    accountNumber = null; 
    contractDate = null; 
    name = null; 
    address = null; 
    commentGen = null; 
    rpCode = Integer.MIN_VALUE; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    invNumber = null; 
    serialNumber = null; 
    dateCounterInst = null; 
    dateCounterCheck = null; 
    counterType = null; 
    classAccuracy = null; 
    checkperiod = null; 
    statuscode = Integer.MIN_VALUE; 
    phasity = null; 
    datecheck = null; 
    checkperiod1 = null; 
    phone = null; 
    seal = null; 
    placecounter = null; 
    isworking = Integer.MIN_VALUE; 
    counterCapacity = Integer.MIN_VALUE; 
    counterVoltageNominal = null; 
    counterDateProduct = null; 
    areaType = Integer.MIN_VALUE; 
    fiderCode = Integer.MIN_VALUE; 
    fiderName = null; 
    disablePlan = Integer.MIN_VALUE; 
    codeEIC = null; 
    tower = null; 
    feeder04 = null; 
    dateFirstConsumption = null; 
    element.code = Integer.MIN_VALUE;
    siteRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENRecordPointByt

