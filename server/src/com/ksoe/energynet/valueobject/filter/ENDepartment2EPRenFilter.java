
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENDepartment2EPRen;

  /**
  * Filter for ENDepartment2EPRen;  
  * 	
  */

public class ENDepartment2EPRenFilter extends  ENDepartment2EPRen {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENDepartment2EPRenFilter()
   {
    code = Integer.MIN_VALUE; 
    billingServerIp = null; 
    billingServerJnpPort = null; 
    billingServerPort = null; 
    finRenCode = Integer.MIN_VALUE; 
    finCFOCode = null; 
    finServicesCode = null; 
    domainCode = Integer.MIN_VALUE; 
    departmentRef.code = Integer.MIN_VALUE;
    renRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENDepartment2EPRen

