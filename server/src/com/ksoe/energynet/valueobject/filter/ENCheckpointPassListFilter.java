
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENCheckpointPassList;

  /**
  * Filter for ENCheckpointPassList;  
  * 	
  */

public class ENCheckpointPassListFilter extends  ENCheckpointPassList {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENCheckpointPassListFilter()
   {
    code = Integer.MIN_VALUE; 
    dateStart = null; 
    dateFinal = null; 
    modify_time = Long.MIN_VALUE;
    userGen = null; 
    dateEdit = null; 
    checkpointRef.code = Integer.MIN_VALUE;
    transportDepartmentRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENCheckpointPassList

