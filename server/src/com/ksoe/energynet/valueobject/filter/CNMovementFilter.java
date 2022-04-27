
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.CNMovement;

  /**
  * Filter for CNMovement;  
  * 	
  */

public class CNMovementFilter extends  CNMovement {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public CNMovementFilter()
   {
    id = Integer.MIN_VALUE; 
    id_state = Integer.MIN_VALUE; 
    startdate = null; 
    note = null; 
    id_parent = Integer.MIN_VALUE; 
    id_user = Integer.MIN_VALUE; 
    realdate = null; 
    canceled = Integer.MIN_VALUE; 
    id_user_canceled = Integer.MIN_VALUE; 
    canceleddate = null; 
    cancelednote = null; 
    is_completed = Integer.MIN_VALUE; 
    id_movement_status = Integer.MIN_VALUE; 
    addnote = null; 
    read_status = Integer.MIN_VALUE; 
    id_user_read = Integer.MIN_VALUE; 
    read_date = null; 
    id_user_created = Integer.MIN_VALUE; 
    modifytime = null; 
    pastdate = null; 
    subsystemRef.code = Integer.MIN_VALUE;
    cnPackRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for CNMovement

