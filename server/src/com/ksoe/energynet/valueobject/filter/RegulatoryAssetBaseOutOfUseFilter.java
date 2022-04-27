
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.RegulatoryAssetBaseOutOfUse;

  /**
  * Filter for RegulatoryAssetBaseOutOfUse;  
  * 	
  */

public class RegulatoryAssetBaseOutOfUseFilter extends  RegulatoryAssetBaseOutOfUse {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public RegulatoryAssetBaseOutOfUseFilter()
   {
    code = Integer.MIN_VALUE; 
    dateStart = null; 
    dateFinish = null; 
    assetRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for RegulatoryAssetBaseOutOfUse

