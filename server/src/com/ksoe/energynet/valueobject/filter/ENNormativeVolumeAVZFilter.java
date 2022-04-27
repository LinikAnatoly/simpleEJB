
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENNormativeVolumeAVZ;

  /**
  * Filter for ENNormativeVolumeAVZ;  
  * 	
  */

public class ENNormativeVolumeAVZFilter extends  ENNormativeVolumeAVZ {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENNormativeVolumeAVZFilter()
   {
    code = Integer.MIN_VALUE; 
    userGen = null; 
    dateEdit = null; 
    rest_purpose_type_id = Integer.MIN_VALUE; 
    rest_purpose_type_name = null; 
    budgetRef.code = Integer.MIN_VALUE;
    departmentRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENNormativeVolumeAVZ

