
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPlanWorkENAct2OSData;

  /**
  * Filter for ENPlanWorkENAct2OSData;  
  * 	
  */

public class ENPlanWorkENAct2OSDataFilter extends  ENPlanWorkENAct2OSData {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENPlanWorkENAct2OSDataFilter()
   {
    code = Integer.MIN_VALUE; 
    num_un = Integer.MIN_VALUE; 
    num_unWriteOff = Integer.MIN_VALUE; 
    kod_inv = null; 
    kod_vid = null; 
    kod_subsch_b = null; 
    name_inv = null; 
    kod_ist = null; 
    name_ist = null; 
    sumBuhWriteOZ = null; 
    sumStCurrentN = null; 
    sumIznCurrentB = null; 
    sumIznCurrentN = null; 
    typeWriteOff = Integer.MIN_VALUE; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    planWorkRef.code = Integer.MIN_VALUE;
    actRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENPlanWorkENAct2OSData

