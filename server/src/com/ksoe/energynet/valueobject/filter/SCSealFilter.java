
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.SCSeal;

  /**
  * Filter for SCSeal;  
  * 	
  */

public class SCSealFilter extends  SCSeal {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public SCSealFilter()
   {
    code = Integer.MIN_VALUE; 
    invNumber = null; 
    name = null; 
    buildNumber = null; 
    account = null; 
    departmetFKCode = null; 
    molCode = null; 
    molName = null; 
    dateIn = null; 
    dateBuild = null; 
    cost = null; 
    scCode = Integer.MIN_VALUE; 
    installOrderNumber = null; 
    costOld = null; 
    commentGen = null; 
    modify_time = Long.MIN_VALUE;
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    typeRef.code = Integer.MIN_VALUE;
    statusRef.code = Integer.MIN_VALUE;
    estimateItemRef.code = Integer.MIN_VALUE;
    lockTypeRef.code = Integer.MIN_VALUE;
    zoneRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for SCSeal

