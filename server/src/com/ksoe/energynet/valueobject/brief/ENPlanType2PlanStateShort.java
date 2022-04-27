
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENPlanType2PlanState;  	
  */

import java.io.Serializable;


public class ENPlanType2PlanStateShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public int typeRefCode = Integer.MIN_VALUE; 
    public String typeRefName; 
    public String typeRefShortName; 
    public int stateRefCode = Integer.MIN_VALUE; 
    public String stateRefName; 
    public String stateRefShortName; 


    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	

    public void setTypeRefCode(int aValue){
       typeRefCode = aValue;
    }
    public int getTypeRefCode(){
       return typeRefCode;
    }
	
    public void setTypeRefName(String aValue){
       typeRefName = aValue;
    }
    public String getTypeRefName(){
       return typeRefName;
    }
	
    public void setTypeRefShortName(String aValue){
       typeRefShortName = aValue;
    }
    public String getTypeRefShortName(){
       return typeRefShortName;
    }
	
    public void setStateRefCode(int aValue){
       stateRefCode = aValue;
    }
    public int getStateRefCode(){
       return stateRefCode;
    }
	
    public void setStateRefName(String aValue){
       stateRefName = aValue;
    }
    public String getStateRefName(){
       return stateRefName;
    }
	
    public void setStateRefShortName(String aValue){
       stateRefShortName = aValue;
    }
    public String getStateRefShortName(){
       return stateRefShortName;
    }
	



}