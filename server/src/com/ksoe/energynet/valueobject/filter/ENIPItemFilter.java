
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENIPItem;

  /**
  * Filter for ENIPItem;  
  * 	
  */

public class ENIPItemFilter extends  ENIPItem {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENIPItemFilter()
   {
    code = Integer.MIN_VALUE; 
    name = null; 
    buhName = null; 
    itemNumber = null; 
    invNumber = null; 
    isProjectDocument = Integer.MIN_VALUE; 
    financing = null; 
    commentGen = null; 
    countGen = null; 
    price = null; 
    sumGen = null; 
    quarter1count = null; 
    quarter1sum = null; 
    quarter2count = null; 
    quarter2sum = null; 
    quarter3count = null; 
    quarter3sum = null; 
    quarter4count = null; 
    quarter4sum = null; 
    countGenInside = null; 
    priceInside = null; 
    sumGenInside = null; 
    mm1countInside = null; 
    mm1sumInside = null; 
    mm2countInside = null; 
    mm2sumInside = null; 
    mm3countInside = null; 
    mm3sumInside = null; 
    mm4countInside = null; 
    mm4sumInside = null; 
    mm5countInside = null; 
    mm5sumInside = null; 
    mm6countInside = null; 
    mm6sumInside = null; 
    mm7countInside = null; 
    mm7sumInside = null; 
    mm8countInside = null; 
    mm8sumInside = null; 
    mm9countInside = null; 
    mm9sumInside = null; 
    mm10countInside = null; 
    mm10sumInside = null; 
    mm11countInside = null; 
    mm11sumInside = null; 
    mm12countInside = null; 
    mm12sumInside = null; 
    infoTenders = null; 
    modify_time = Long.MIN_VALUE;
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    measurement.code = Integer.MIN_VALUE;
    statusRef.code = Integer.MIN_VALUE;
    invGroupRef.code = Integer.MIN_VALUE;
    renRef.code = Integer.MIN_VALUE;
    purposeProgramRef.code = Integer.MIN_VALUE;
    ipRef.code = Integer.MIN_VALUE;
    parentRef.code = Integer.MIN_VALUE;
    methodExecWorkRef.code = Integer.MIN_VALUE;
    ipImplementTypeRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENIPItem

