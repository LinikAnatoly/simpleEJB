
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.RecordPointWF;

  /**
  * Filter for RecordPointWF;  
  * 	
  */

public class RecordPointWFFilter extends  RecordPointWF {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public RecordPointWFFilter()
   {
    code = Integer.MIN_VALUE; 
    accountnumber = null; 
    contractnumber = null; 
    contragentname = null; 
    contragentaddress = null; 
    contragentpassport = null; 
    contragentokpo = null; 
    cnpackcode = Integer.MIN_VALUE; 
    cnsubsystemtyperefcode = Integer.MIN_VALUE; 
    rencode = Integer.MIN_VALUE; 
    isbyt = Integer.MIN_VALUE; 
    phasityrefcode = Integer.MIN_VALUE; 
    contractdate = null; 
    techcondservicesrefcod = Integer.MIN_VALUE; 
    iscounterinst = Integer.MIN_VALUE; 
    rpcode = Integer.MIN_VALUE; 
    rpname = null; 
   }

} // end of Filter for RecordPointWF

