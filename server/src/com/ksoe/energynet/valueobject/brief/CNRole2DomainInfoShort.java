
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for CNRole2DomainInfo;  	
  */

import java.io.Serializable;


public class CNRole2DomainInfoShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public int domainCode = Integer.MIN_VALUE; 
    public int cnRoleCode = Integer.MIN_VALUE; 
    public int cnStartStateCode = Integer.MIN_VALUE; 
    public int subsystemRefCode = Integer.MIN_VALUE; 
    public String subsystemRefName; 


    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	
    public void setDomainCode(int aValue){
       domainCode = aValue;
    }
    public int getDomainCode(){
       return domainCode;
    }
	
    public void setCnRoleCode(int aValue){
       cnRoleCode = aValue;
    }
    public int getCnRoleCode(){
       return cnRoleCode;
    }
	
    public void setCnStartStateCode(int aValue){
       cnStartStateCode = aValue;
    }
    public int getCnStartStateCode(){
       return cnStartStateCode;
    }
	

    public void setSubsystemRefCode(int aValue){
       subsystemRefCode = aValue;
    }
    public int getSubsystemRefCode(){
       return subsystemRefCode;
    }
	
    public void setSubsystemRefName(String aValue){
       subsystemRefName = aValue;
    }
    public String getSubsystemRefName(){
       return subsystemRefName;
    }
	



}