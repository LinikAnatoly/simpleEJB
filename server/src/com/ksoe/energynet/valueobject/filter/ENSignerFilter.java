
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENSigner;

  /**
  * Filter for ENSigner;  
  * 	
  */

public class ENSignerFilter extends  ENSigner {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENSignerFilter()
   {
    code = Integer.MIN_VALUE; 
    signerPosition = null; 
    signerFio = null; 
    signatureImagePath = null; 
    commentGen = null; 
   }

} // end of Filter for ENSigner

