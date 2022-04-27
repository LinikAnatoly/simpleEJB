
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTechCondResponsibles2Dep;

  /**
  * Filter for ENTechCondResponsibles2Dep;  
  * 	
  */

public class ENTechCondResponsibles2DepFilter extends  ENTechCondResponsibles2Dep {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTechCondResponsibles2DepFilter()
   {
    code = Integer.MIN_VALUE; 
    techCondResponsiblesRef.code = Integer.MIN_VALUE;
    departmentRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENTechCondResponsibles2Dep

