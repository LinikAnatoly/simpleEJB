
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENDepartment;

  /**
  * Filter for ENDepartment;  
  * 	
  */

public class ENDepartmentFilter extends  ENDepartment {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENDepartmentFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    shortName = null; 
    isVirtual = Integer.MIN_VALUE; 
    dateStart = null; 
    dateFinal = null; 
    renCode = Integer.MIN_VALUE; 
    shpzBalans = null; 
    shpzFinId = Integer.MIN_VALUE; 
    kau_table_id_1884 = Integer.MIN_VALUE; 
    kau_1884 = null; 
    name_1884 = null; 
    hrmorganizationid = null; 
    domain_info = null; 
    modify_time = Long.MIN_VALUE;
    parentRef.code = Integer.MIN_VALUE;
    typeRef.code = Integer.MIN_VALUE;
    managementRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENDepartment

