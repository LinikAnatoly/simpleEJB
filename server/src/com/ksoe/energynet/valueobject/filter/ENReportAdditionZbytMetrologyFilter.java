
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENReportAdditionZbytMetrology;

  /**
  * Filter for ENReportAdditionZbytMetrology;  
  * 	
  */

public class ENReportAdditionZbytMetrologyFilter extends  ENReportAdditionZbytMetrology {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENReportAdditionZbytMetrologyFilter()
   {
    code = Integer.MIN_VALUE; 
    workCode = null; 
    name = null; 
    isServices = Integer.MIN_VALUE; 
    zbytOrmetrology = null; 
    dateStart = null; 
    dateFinal = null; 
   }

} // end of Filter for ENReportAdditionZbytMetrology

