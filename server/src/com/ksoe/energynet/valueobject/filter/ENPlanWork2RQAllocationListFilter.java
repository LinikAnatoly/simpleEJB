
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPlanWork2RQAllocationList;

  /**
  * Filter for ENPlanWork2RQAllocationList;  
  * 	
  */

public class ENPlanWork2RQAllocationListFilter extends  ENPlanWork2RQAllocationList {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENPlanWork2RQAllocationListFilter()
   {
    code = Integer.MIN_VALUE; 
    modify_time = Long.MIN_VALUE;
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    planRef.code = Integer.MIN_VALUE;
    allocListRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENPlanWork2RQAllocationList

