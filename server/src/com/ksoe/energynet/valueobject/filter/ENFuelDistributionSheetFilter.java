
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENFuelDistributionSheet;

  /**
  * Filter for ENFuelDistributionSheet;  
  * 	
  */

public class ENFuelDistributionSheetFilter extends  ENFuelDistributionSheet {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENFuelDistributionSheetFilter()
   {
    code = Integer.MIN_VALUE; 
    monthGen = Integer.MIN_VALUE; 
    yearGen = Integer.MIN_VALUE; 
    totalSum = null; 
    sum1 = null; 
    sum2 = null; 
    sum3 = null; 
    sum4 = null; 
    sum5 = null; 
    sum6 = null; 
    sum7 = null; 
    sum1dec1 = null; 
    sum2dec1 = null; 
    sum3dec1 = null; 
    sum4dec1 = null; 
    sum5dec1 = null; 
    sum6dec1 = null; 
    sum7dec1 = null; 
    sum1dec2 = null; 
    sum2dec2 = null; 
    sum3dec2 = null; 
    sum4dec2 = null; 
    sum5dec2 = null; 
    sum6dec2 = null; 
    sum7dec2 = null; 
    sum1dec3 = null; 
    sum2dec3 = null; 
    sum3dec3 = null; 
    sum4dec3 = null; 
    sum5dec3 = null; 
    sum6dec3 = null; 
    sum7dec3 = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    fuelTypeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENFuelDistributionSheet

