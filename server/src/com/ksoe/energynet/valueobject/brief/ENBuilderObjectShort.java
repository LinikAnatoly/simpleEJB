
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENBuilderObject;  	
  */

import java.io.Serializable;


public class ENBuilderObjectShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public String invNumber; 
    public String name; 
    public String buhName; 
    public int yearBuild = Integer.MIN_VALUE; 
    public int yearWorkingStart = Integer.MIN_VALUE; 
    public String userGen; 
    public int objectTypeCode = Integer.MIN_VALUE; 
    public String objectTypeName; 
    public int elementCode = Integer.MIN_VALUE; 


    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	
    public void setInvNumber(String aValue){
       invNumber = aValue;
    }
    public String getInvNumber(){
       return invNumber;
    }
	
    public void setName(String aValue){
       name = aValue;
    }
    public String getName(){
       return name;
    }
	
    public void setBuhName(String aValue){
       buhName = aValue;
    }
    public String getBuhName(){
       return buhName;
    }
	
    public void setYearBuild(int aValue){
       yearBuild = aValue;
    }
    public int getYearBuild(){
       return yearBuild;
    }
	
    public void setYearWorkingStart(int aValue){
       yearWorkingStart = aValue;
    }
    public int getYearWorkingStart(){
       return yearWorkingStart;
    }
	
    public void setUserGen(String aValue){
       userGen = aValue;
    }
    public String getUserGen(){
       return userGen;
    }
	

    public void setObjectTypeCode(int aValue){
       objectTypeCode = aValue;
    }
    public int getObjectTypeCode(){
       return objectTypeCode;
    }
	
    public void setObjectTypeName(String aValue){
       objectTypeName = aValue;
    }
    public String getObjectTypeName(){
       return objectTypeName;
    }
	
    public void setElementCode(int aValue){
       elementCode = aValue;
    }
    public int getElementCode(){
       return elementCode;
    }
	



}