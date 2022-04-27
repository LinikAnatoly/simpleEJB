
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENBuilding2ENact;

  /**
  * Filter for ENBuilding2ENact;  
  * 	
  */

public class ENBuilding2ENactFilter extends  ENBuilding2ENact {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENBuilding2ENactFilter()
   {
    code = Integer.MIN_VALUE; 
    sumGen = null; 
    sumNds = null; 
    isCalculationDate = Integer.MIN_VALUE; 
    finContractNumber = null; 
    finContractDate = null; 
    partnerName = null; 
    partnerCode = null; 
    isActFromEnergyNET = null; 
    actNumber = null; 
    actDate = null; 
    actRef.code = Integer.MIN_VALUE;
    ENBuildingRef.code = Integer.MIN_VALUE;
    ENBuilding2ActTypeWorkRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENBuilding2ENact

