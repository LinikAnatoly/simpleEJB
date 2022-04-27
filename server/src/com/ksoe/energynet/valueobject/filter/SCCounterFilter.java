
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.SCCounter;

  /**
  * Filter for SCCounter;  
  * 	
  */

public class SCCounterFilter extends  SCCounter {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public SCCounterFilter()
   {
    code = Integer.MIN_VALUE; 
    invNumber = null; 
    name = null; 
    buildNumber = null; 
    account = null; 
    departmetFKCode = null; 
    molCode = null; 
    dateIn = null; 
    dateBuild = null; 
    dateCheck = null; 
    cost = null; 
    scCode = Integer.MIN_VALUE; 
    counterType = null; 
    installOrderNumber = null; 
    reading = null; 
    dateEdit = null; 
    isliquid = Integer.MIN_VALUE; 
    costOld = null; 
    isMoveToZKU = Integer.MIN_VALUE; 
    invnumberzku = null; 
    namezku = null; 
    accountzku = null; 
    costzku = null; 
    sccodezku = Integer.MIN_VALUE; 
    elementcode = Integer.MIN_VALUE; 
    phasity = null; 
    costzku_b = null; 
    iszku = Integer.MIN_VALUE; 
    lschet = null; 
    placeust = null; 
    priconndoc = null; 
    priconndate = null; 
    checkperiod = null; 
    actInvitationNumber = null; 
    dateInvitation = null; 
    dateExpertise = null; 
    podrCodeZKU = null; 
    modify_time = Long.MIN_VALUE;
    statusRef.code = Integer.MIN_VALUE;
    estimateItemRef.code = Integer.MIN_VALUE;
    kindRef.code = Integer.MIN_VALUE;
    zoneRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for SCCounter

