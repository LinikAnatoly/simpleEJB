
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTransportItem;

  /**
  * Filter for ENTransportItem;  
  * 	
  */

public class ENTransportItemFilter extends  ENTransportItem {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTransportItemFilter()
   {
    code = Integer.MIN_VALUE; 
    countWorkGen = null; 
    countWorkFact = null; 
    price = null; 
    cost = null; 
    numberList = null; 
    commentGen = null; 
    userGen = null; 
    dateEdit = null; 
    isUseTrailer = Integer.MIN_VALUE; 
    distanceNorm = null; 
    amountOfJourneys = Integer.MIN_VALUE; 
    modify_time = Long.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
    planItemRef.code = Integer.MIN_VALUE;
    transportReal.code = Integer.MIN_VALUE;
    trailerTransportReal.code = Integer.MIN_VALUE;
    transport.code = Integer.MIN_VALUE;
    typeRef.code = Integer.MIN_VALUE;
    tktransportType.code = Integer.MIN_VALUE;
    finWorker.code = Integer.MIN_VALUE;
    transportDepartment.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENTransportItem

