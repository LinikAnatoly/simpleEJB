
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSettingForDFDecree;

  /**
  * Filter for ENSettingForDFDecree;  
  * 	
  */

public class ENSettingForDFDecreeFilter extends  ENSettingForDFDecree {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENSettingForDFDecreeFilter()
   {
    code = Integer.MIN_VALUE; 
    dfDocTypeCode = Integer.MIN_VALUE; 
    dfDocTypeName = null; 
    catalogCode = Integer.MIN_VALUE; 
    catalogName = null; 
    dfDocPrefixCode = Integer.MIN_VALUE; 
    dfDocPrefixName = null; 
    prefixSignerTabN = null; 
    prefixSignerFio = null; 
    prefixSignerPostInfo = null; 
    initiatorTabn = null; 
    initiatorFio = null; 
    initiatorPodrName = null; 
    initiatorPodrCode = Integer.MIN_VALUE; 
    designatedTabn = null; 
    designatedFio = null; 
    designatedpostInfo = null; 
    departmentRef.code = Integer.MIN_VALUE;
    responsRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENSettingForDFDecree

