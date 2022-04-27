
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENActPostingSpecCharacters;

  /**
  * Filter for ENActPostingSpecCharacters;  
  * 	
  */

public class ENActPostingSpecCharactersFilter extends  ENActPostingSpecCharacters {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENActPostingSpecCharactersFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    commentGen = null; 
   }

} // end of Filter for ENActPostingSpecCharacters

