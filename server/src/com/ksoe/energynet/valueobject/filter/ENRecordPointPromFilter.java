
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENRecordPointProm;

  /**
  * Filter for ENRecordPointProm;  
  * 	
  */

public class ENRecordPointPromFilter extends  ENRecordPointProm {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENRecordPointPromFilter()
   {
    code = Integer.MIN_VALUE; 
    accountNumber = null; 
    accountName = null; 
    accountCode = Integer.MIN_VALUE; 
    counterNumber = null; 
    recordPointName = null; 
    recordPointAddr = null; 
    recordPointKindName = null; 
    recordPointCode = Integer.MIN_VALUE; 
    feeder = null; 
    substation = null; 
    invNumber = null; 
    dayofcalculation = Integer.MIN_VALUE; 
    inspector = null; 
    datecontrol = null; 
    datetp = null; 
    dateCounterInst = null; 
    dateCounterCheck = null; 
    counterType = null; 
    classAccuracy = null; 
    checkperiod = null; 
    statuscode = Integer.MIN_VALUE; 
    phasity = null; 
    phone = null; 
    seal = null; 
    placecounter = null; 
    isworking = Integer.MIN_VALUE; 
    fiderCode = Integer.MIN_VALUE; 
    fiderName = null; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    counterCapacity = Integer.MIN_VALUE; 
    counterVoltageNominal = null; 
    counterDateProduct = null; 
    disablePlan = Integer.MIN_VALUE; 
    codeEIC = null; 
    tower = null; 
    feeder04 = null; 
    dateFirstConsumption = null; 
    contractDate = null; 
    ren.code = Integer.MIN_VALUE;
    element.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENRecordPointProm

