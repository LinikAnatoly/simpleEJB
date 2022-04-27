
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENAct2FinKodIst;

  /**
  * Filter for ENAct2FinKodIst;  
  * 	
  */

public class ENAct2FinKodIstFilter extends  ENAct2FinKodIst {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENAct2FinKodIstFilter()
   {
    code = Integer.MIN_VALUE; 
    actRef.code = Integer.MIN_VALUE;
    kodIstRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENAct2FinKodIst

