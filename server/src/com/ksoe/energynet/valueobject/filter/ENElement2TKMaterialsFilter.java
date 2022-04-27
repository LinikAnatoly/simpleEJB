
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENElement2TKMaterials;

  /**
  * Filter for ENElement2TKMaterials;  
  * 	
  */

public class ENElement2TKMaterialsFilter extends  ENElement2TKMaterials {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENElement2TKMaterialsFilter()
   {
    code = Integer.MIN_VALUE; 
    materialRef.code = Integer.MIN_VALUE;
    elementRef.code = Integer.MIN_VALUE;
    typeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENElement2TKMaterials

