
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2009 SIT
// Generated at Wed Oct 07 17:21:43 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENPlanCorrectReason;  	
  */

import java.io.Serializable;


public class ENPlanCorrectReasonShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public String name; 


    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	
    public void setName(String aValue){
       name = aValue;
    }
    public String getName(){
       return name;
    }
	




}