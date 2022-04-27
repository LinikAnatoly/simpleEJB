
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2022 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.RegulatoryAssetBaseFundingSource;

  /**
  * Filter for RegulatoryAssetBaseFundingSource;  
  * 	
  */

public class RegulatoryAssetBaseFundingSourceFilter extends  RegulatoryAssetBaseFundingSource {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public RegulatoryAssetBaseFundingSourceFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
   }

} // end of Filter for RegulatoryAssetBaseFundingSource

