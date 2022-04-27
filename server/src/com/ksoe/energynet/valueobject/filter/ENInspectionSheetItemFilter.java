
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENInspectionSheetItem;

  /**
  * Filter for ENInspectionSheetItem;  
  * 	
  */

public class ENInspectionSheetItemFilter extends  ENInspectionSheetItem {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENInspectionSheetItemFilter()
   {
    code = Integer.MIN_VALUE; 
    defectCode = null; 
    defectName = null; 
    commentGen = null; 
    isDetecting = Integer.MIN_VALUE; 
    countGen = null; 
    countDefects = null; 
    defectLength = null; 
    coefficientKi = null; 
    pointsPi = null; 
    weightXi = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    sheetRef.code = Integer.MIN_VALUE;
    classificationTypeRef.code = Integer.MIN_VALUE;
    elementRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENInspectionSheetItem

