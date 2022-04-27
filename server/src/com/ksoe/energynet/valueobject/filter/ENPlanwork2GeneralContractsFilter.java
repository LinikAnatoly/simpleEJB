
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENPlanwork2GeneralContracts;

  /**
  * Filter for ENPlanwork2GeneralContracts;  
  * 	
  */

public class ENPlanwork2GeneralContractsFilter extends  ENPlanwork2GeneralContracts {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENPlanwork2GeneralContractsFilter()
   {
    code = Integer.MIN_VALUE; 
    userGen = null; 
    dateEdit = null; 
    generalContractRef.code = Integer.MIN_VALUE;
    planRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENPlanwork2GeneralContracts

