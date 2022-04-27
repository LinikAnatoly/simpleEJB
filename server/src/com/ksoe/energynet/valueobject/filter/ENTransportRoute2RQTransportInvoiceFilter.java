
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENTransportRoute2RQTransportInvoice;

  /**
  * Filter for ENTransportRoute2RQTransportInvoice;  
  * 	
  */

public class ENTransportRoute2RQTransportInvoiceFilter extends  ENTransportRoute2RQTransportInvoice {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENTransportRoute2RQTransportInvoiceFilter()
   {
    code = Integer.MIN_VALUE; 
    invoiceRef.code = Integer.MIN_VALUE;
    transportRouteRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENTransportRoute2RQTransportInvoice

