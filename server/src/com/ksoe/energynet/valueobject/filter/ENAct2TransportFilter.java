
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENAct2Transport;

  /**
  * Filter for ENAct2Transport;  
  * 	
  */

public class ENAct2TransportFilter extends  ENAct2Transport {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENAct2TransportFilter()
   {
    code = Integer.MIN_VALUE; 
    invNumber = null; 
    name = null; 
    expense = null; 
    depreciationMonth = null; 
    depreciationHours = null; 
    timeWork = null; 
    paysWork = null; 
    repairCostsPerHour = null; 
    modify_time = Long.MIN_VALUE;
    actRef.code = Integer.MIN_VALUE;
    classificationTypeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENAct2Transport

