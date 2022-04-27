
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENIPItem2TKMaterials;

  /**
  * Filter for ENIPItem2TKMaterials;  
  * 	
  */

public class ENIPItem2TKMaterialsFilter extends  ENIPItem2TKMaterials {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENIPItem2TKMaterialsFilter()
   {
    code = Integer.MIN_VALUE; 
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    isMaterialForCount = Integer.MIN_VALUE; 
    ipItemRef.code = Integer.MIN_VALUE;
    materialRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENIPItem2TKMaterials

