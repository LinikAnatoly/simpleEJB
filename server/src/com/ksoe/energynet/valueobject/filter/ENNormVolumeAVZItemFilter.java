
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENNormVolumeAVZItem;

  /**
  * Filter for ENNormVolumeAVZItem;  
  * 	
  */

public class ENNormVolumeAVZItemFilter extends  ENNormVolumeAVZItem {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENNormVolumeAVZItemFilter()
   {
    code = Integer.MIN_VALUE; 
    countGen = null; 
    countRequired = null; 
    userGen = null; 
    dateEdit = null; 
    materialRef.code = Integer.MIN_VALUE;
    normativeVolumeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENNormVolumeAVZItem

