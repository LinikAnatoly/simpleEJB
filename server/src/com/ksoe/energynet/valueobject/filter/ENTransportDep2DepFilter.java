
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTransportDep2Dep;

  /**
  * Filter for ENTransportDep2Dep;  
  * 	
  */

public class ENTransportDep2DepFilter extends  ENTransportDep2Dep {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTransportDep2DepFilter()
   {
    code = Integer.MIN_VALUE; 
    transportDepartment.code = Integer.MIN_VALUE;
    department.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENTransportDep2Dep

