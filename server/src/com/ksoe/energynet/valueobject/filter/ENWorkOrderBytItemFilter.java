
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENWorkOrderBytItem;

  /**
  * Filter for ENWorkOrderBytItem;  
  * 	
  */

public class ENWorkOrderBytItemFilter extends  ENWorkOrderBytItem {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENWorkOrderBytItemFilter()
   {
    code = Integer.MIN_VALUE; 
    contractNumberServices = null; 
    accountNumber = null; 
    name = null; 
    customerName = null; 
    address = null; 
    invNumber = null; 
    serialNumber = null; 
    seal = null; 
    phone = null; 
    statuscode = Integer.MIN_VALUE; 
    rpCode = Integer.MIN_VALUE; 
    dateCounterInst = null; 
    dateCounterCheck = null; 
    counterType = null; 
    classAccuracy = null; 
    checkperiod = null; 
    rpStatusCode = Integer.MIN_VALUE; 
    phasity = null; 
    datecheck = null; 
    checkperiod1 = null; 
    placecounter = null; 
    rpIsWorking = Integer.MIN_VALUE; 
    recordPointName = null; 
    routeBytName = null; 
    routeBytNumbergen = null; 
    commentGen = null; 
    dateAdd = null; 
    dateEdit = null; 
    userAdd = null; 
    userEdit = null; 
    modify_time = Long.MIN_VALUE;
    factCode = Integer.MIN_VALUE; 
    counterCapacity = Integer.MIN_VALUE; 
    counterVoltageNominal = null; 
    counterDateProduct = null; 
    workOrderBytRef.code = Integer.MIN_VALUE;
    humenItemRef.code = Integer.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
    planItemRef.code = Integer.MIN_VALUE;
    finWorker.code = Integer.MIN_VALUE;
    recordPointBytRef.code = Integer.MIN_VALUE;
    recordPointPromRef.code = Integer.MIN_VALUE;
    routeBytRef.code = Integer.MIN_VALUE;
    servicesObjectRef.code = Integer.MIN_VALUE;
    scCounterRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENWorkOrderBytItem

