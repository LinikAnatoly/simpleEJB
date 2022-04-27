
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENCheckpointPassListItem;

  /**
  * Filter for ENCheckpointPassListItem;  
  * 	
  */

public class ENCheckpointPassListItemFilter extends  ENCheckpointPassListItem {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENCheckpointPassListItemFilter()
   {
    code = Integer.MIN_VALUE; 
    dateEvent = null; 
    modify_time = Long.MIN_VALUE;
    userGen = null; 
    dateEdit = null; 
    transportRealRef.code = Integer.MIN_VALUE;
    checkpointPassListRef.code = Integer.MIN_VALUE;
    eventTypeRef.code = Integer.MIN_VALUE;
    travelSheetRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENCheckpointPassListItem

