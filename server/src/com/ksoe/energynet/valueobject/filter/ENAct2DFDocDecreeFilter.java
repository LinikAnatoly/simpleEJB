
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import com.ksoe.energynet.valueobject.ENAct2DFDocDecree;

  /**
  * Filter for ENAct2DFDocDecree;  
  * 	
  */

public class ENAct2DFDocDecreeFilter extends  ENAct2DFDocDecree {

  public String conditionSQL;
  public String orderBySQL;

  public final String getConditionSQL() {return conditionSQL;}
  public final void setConditionSQL(String aValue) {conditionSQL = aValue;}

  public final String getOrderBySQL() {return orderBySQL;}
  public final void setOrderBySQL(String aValue) {orderBySQL = aValue;}

  public ENAct2DFDocDecreeFilter()
   {
    code = Integer.MIN_VALUE; 
    commentGen = null; 
    userAdd = null; 
    dateAdd = null; 
    userGen = null; 
    dateEdit = null; 
    modify_time = Long.MIN_VALUE;
    specifications = null; 
    numberHours = Integer.MIN_VALUE; 
    DFDocDecreeCode = Integer.MIN_VALUE; 
    dfDocCode = Integer.MIN_VALUE; 
    responsFIO = null; 
    responsPosition = null; 
    responsGenitiveFIO = null; 
    responsGenitivePosition = null; 
    responsSurname = null; 
    responsSurnameGenitive = null; 
    responsName = null; 
    responsNameGenitive = null; 
    responsPatronimic = null; 
    responsPatronimicGenitive = null; 
    departmentName = null; 
    departmentNameGenitive = null; 
    actRef.code = Integer.MIN_VALUE;
   }

} // end of Filter for ENAct2DFDocDecree

