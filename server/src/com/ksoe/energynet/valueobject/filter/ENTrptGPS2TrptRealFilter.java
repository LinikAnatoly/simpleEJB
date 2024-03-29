
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTrptGPS2TrptReal;

  /**
  * Filter for ENTrptGPS2TrptReal;  
  * 	
  */

public class ENTrptGPS2TrptRealFilter extends  ENTrptGPS2TrptReal {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTrptGPS2TrptRealFilter()
   {
    code = Integer.MIN_VALUE; 
    codeTranpostGps = null; 
    realTransport.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENTrptGPS2TrptReal

