
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENPlanWorkState;  	
  */

import java.io.Serializable;


public class ENPlanWorkStateShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public String name; 
    public String shortName; 


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
	
    public void setShortName(String aValue){
       shortName = aValue;
    }
    public String getShortName(){
       return shortName;
    }
	




}