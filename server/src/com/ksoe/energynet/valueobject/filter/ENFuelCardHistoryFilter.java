
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENFuelCardHistory;

  /**
  * Filter for ENFuelCardHistory;  
  * 	
  */

public class ENFuelCardHistoryFilter extends  ENFuelCardHistory {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENFuelCardHistoryFilter()
   {
    code = Integer.MIN_VALUE; 
    dateStart = null; 
    dateFinal = null; 
    reg_id = null; 
    userGen = null; 
    dateEdit = null; 
    fuelType.code = Integer.MIN_VALUE;
    finWorker.code = Integer.MIN_VALUE;
    fuelCard.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENFuelCardHistory

