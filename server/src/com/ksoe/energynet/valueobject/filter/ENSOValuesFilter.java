
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import java.util.Vector;

import com.ksoe.energynet.valueobject.ENSOValues;

  /**
  * Filter for ENSOValues;  
  * 	
  */

public class ENSOValuesFilter extends  ENSOValues {

  public String conditionSQL;
  public String orderBySQL;
  public int[] soValuesTypes = null;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}
  
  public int[] getSoValuesTypes() {
	return soValuesTypes;
  }
  
  public void setSoValuesTypes(int[] values) {
	  this.soValuesTypes = values;
  }

  public ENSOValuesFilter()
   {
    code = Integer.MIN_VALUE; 
    dateVal = null; 
    strVal = null; 
    userGen = null; 
    dateEdit = null;
    modify_time = Long.MIN_VALUE;
    servicesobject.code = Integer.MIN_VALUE;
    soValuesType.code = Integer.MIN_VALUE;
    

    
   }

} // end of Filter for ENSOValues

