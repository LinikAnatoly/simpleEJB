
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENMetrologyDevice;  	
  */

import java.io.Serializable;


public class ENMetrologyDeviceShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public String name; 
    public String buildNumber; 
    public String invNumber; 
    public String buhName; 
    public int deviceTypeCode = Integer.MIN_VALUE; 
    public String deviceTypeName; 
    public int elementCode = Integer.MIN_VALUE; 


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
	
    public void setBuildNumber(String aValue){
       buildNumber = aValue;
    }
    public String getBuildNumber(){
       return buildNumber;
    }
	
    public void setInvNumber(String aValue){
       invNumber = aValue;
    }
    public String getInvNumber(){
       return invNumber;
    }
	
    public void setBuhName(String aValue){
       buhName = aValue;
    }
    public String getBuhName(){
       return buhName;
    }
	

    public void setDeviceTypeCode(int aValue){
       deviceTypeCode = aValue;
    }
    public int getDeviceTypeCode(){
       return deviceTypeCode;
    }
	
    public void setDeviceTypeName(String aValue){
       deviceTypeName = aValue;
    }
    public String getDeviceTypeName(){
       return deviceTypeName;
    }
	
    public void setElementCode(int aValue){
       elementCode = aValue;
    }
    public int getElementCode(){
       return elementCode;
    }
	



}