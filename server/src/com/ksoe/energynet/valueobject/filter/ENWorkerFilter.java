
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENWorker;

  /**
  * Filter for ENWorker;  
  * 	
  */

public class ENWorkerFilter extends  ENWorker {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENWorkerFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    tabNumber = null; 
    isMol = Integer.MIN_VALUE; 
    finCode = Integer.MIN_VALUE; 
    commentGen = null; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    manningTable.code = Integer.MIN_VALUE;;
   }

} // end of Filter for ENWorker

