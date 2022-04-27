
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPlanProject;

  /**
  * Filter for ENPlanProject;  
  * 	
  */

public class ENPlanProjectFilter extends  ENPlanProject {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENPlanProjectFilter()
   {
    code = Integer.MIN_VALUE; 
    numberProject = null; 
    projectCipher = null; 
    projectName = null; 
    userGen = null; 
    dateEdit = null; 
    planRef.code = Integer.MIN_VALUE;
    projectWorkRef.code = Integer.MIN_VALUE;
    voltagenominal.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENPlanProject

