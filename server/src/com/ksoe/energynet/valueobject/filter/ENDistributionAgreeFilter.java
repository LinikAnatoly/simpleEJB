
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENDistributionAgree;

  /**
  * Filter for ENDistributionAgree;  
  * 	
  */

public class ENDistributionAgreeFilter extends  ENDistributionAgree {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENDistributionAgreeFilter()
   {
    code = Integer.MIN_VALUE; 
    numberGen = null; 
    dateGen = null; 
    eic = null; 
    objectname = null; 
    objectaddress = null; 
    power = null; 
    d2fusename = null; 
    d3countername = null; 
    d3countertype = null; 
    d3amperageratio = null; 
    d3voltageratio = null; 
    d3totalratio = null; 
    d3place = null; 
    d3voltageclass = null; 
    d3workmode = null; 
    d3tarifftype = null; 
    d3accountingtype = null; 
    d5feederlist = null; 
    d6reliabilitypue = null; 
    d6reliabilityguaranteed = null; 
    d6balancesupplier = null; 
    d6balanceclient = null; 
    d6responsibilitysupplier = null; 
    d6responsibilityclient = null; 
    d6balancelimit = null; 
    d7linesource = null; 
    d7attachment = null; 
    d8conditions = null; 
    d8transformertype = null; 
    d8voltagebh = null; 
    d8voltagehh = null; 
    d8lossesxx = null; 
    d8losseskz = null; 
    d8amperage = null; 
    d8voltagekz = null; 
    d8linelength = null; 
    d8liner = null; 
    d8linex = null; 
    d8hours = Integer.MIN_VALUE; 
    userGen = null; 
    modify_time = Long.MIN_VALUE;
    warrantRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENDistributionAgree

