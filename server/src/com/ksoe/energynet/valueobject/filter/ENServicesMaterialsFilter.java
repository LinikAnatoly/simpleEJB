
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENServicesMaterials;

  /**
  * Filter for ENServicesMaterials;  
  * 	
  */

public class ENServicesMaterialsFilter extends  ENServicesMaterials {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENServicesMaterialsFilter()
   {
    code = Integer.MIN_VALUE; 
    materialName = null; 
    measureUnitName = null; 
    priceGen = null; 
    countGen = null; 
    sumGen = null; 
    servicesCostRef.code = Integer.MIN_VALUE;
    calcMaterialsRef.code = Integer.MIN_VALUE;
    materialRef.code = Integer.MIN_VALUE;
    kartaRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENServicesMaterials

