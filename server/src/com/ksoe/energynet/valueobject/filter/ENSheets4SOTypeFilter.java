
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSheets4SOType;

  /**
  * Filter for ENSheets4SOType;  
  * 	
  */

public class ENSheets4SOTypeFilter extends  ENSheets4SOType {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENSheets4SOTypeFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    nameForDfDoc = null; 
    dfDocNumMask = null; 
    dfDepartmentCode = Integer.MIN_VALUE; 
    executorFio = null; 
    executorPhone = null; 
    executorEmail = null; 
    reportPath = null; 
    reportFileName = null; 
    reportType = null; 
    commentGen = null; 
    signerRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENSheets4SOType

