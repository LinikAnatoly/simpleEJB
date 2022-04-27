
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTransportRealRepair;

  /**
  * Filter for ENTransportRealRepair;  
  * 	
  */

public class ENTransportRealRepairFilter extends  ENTransportRealRepair {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTransportRealRepairFilter()
   {
    code = Integer.MIN_VALUE; 
    dateStart = null; 
    dateFinal = null; 
    userGen = null; 
    dateEdit = null; 
    commentGen = null; 
    realTransport.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENTransportRealRepair

