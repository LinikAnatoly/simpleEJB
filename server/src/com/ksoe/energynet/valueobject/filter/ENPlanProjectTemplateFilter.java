
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPlanProjectTemplate;

  /**
  * Filter for ENPlanProjectTemplate;  
  * 	
  */

public class ENPlanProjectTemplateFilter extends  ENPlanProjectTemplate {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENPlanProjectTemplateFilter()
   {
    code = Integer.MIN_VALUE; 
    tag = null; 
    elementName = null; 
    elementcode = Integer.MIN_VALUE; 
    userGen = null; 
    dateEdit = null; 
    planRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENPlanProjectTemplate

