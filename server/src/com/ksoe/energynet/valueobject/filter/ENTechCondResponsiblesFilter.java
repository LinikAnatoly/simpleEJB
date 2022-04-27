
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTechCondResponsibles;

  /**
  * Filter for ENTechCondResponsibles;  
  * 	
  */

public class ENTechCondResponsiblesFilter extends  ENTechCondResponsibles {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTechCondResponsiblesFilter()
   {
    code = Integer.MIN_VALUE; 
    responsibleFIO = null; 
    responsibleTabNumber = Integer.MIN_VALUE; 
    responsiblePosition = null; 
    responsibleDepName = null; 
    responsibleDepCode = null; 
    responsiblePhone = null; 
    power = Integer.MIN_VALUE; 
   }

} // end of Filter for ENTechCondResponsibles

