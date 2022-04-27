
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.FINDoc2MolData;

  /**
  * Filter for FINDoc2MolData;  
  * 	
  */

public class FINDoc2MolDataFilter extends  FINDoc2MolData {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public FINDoc2MolDataFilter()
   {
    code = Integer.MIN_VALUE; 
    finDocCode = Integer.MIN_VALUE; 
    finDocCode2 = Integer.MIN_VALUE; 
    axJournalId = null; 
    modify_time = Long.MIN_VALUE;
    molData.code = Integer.MIN_VALUE;
    finDocTypeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for FINDoc2MolData

