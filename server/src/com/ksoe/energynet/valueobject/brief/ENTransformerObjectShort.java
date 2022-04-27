
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTransformerObject;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;


public class ENTransformerObjectShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public String name; 
    public String buildNumber; 
    public int buildYear = Integer.MIN_VALUE; 
    public BigDecimal voltageHi; 
    public BigDecimal voltageLow; 
    public BigDecimal nomPower; 
    public String buhName; 
    public String invNumber; 
    public int transformerTypeCode = Integer.MIN_VALUE; 
    public String transformerTypeName; 
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
	
    public void setBuildYear(int aValue){
       buildYear = aValue;
    }
    public int getBuildYear(){
       return buildYear;
    }
	
    public void setVoltageHi(BigDecimal aValue){
       voltageHi = aValue;
    }
    public BigDecimal getVoltageHi(){
       return voltageHi;
    }
	
    public void setVoltageLow(BigDecimal aValue){
       voltageLow = aValue;
    }
    public BigDecimal getVoltageLow(){
       return voltageLow;
    }
	
    public void setNomPower(BigDecimal aValue){
       nomPower = aValue;
    }
    public BigDecimal getNomPower(){
       return nomPower;
    }
	
    public void setBuhName(String aValue){
       buhName = aValue;
    }
    public String getBuhName(){
       return buhName;
    }
	
    public void setInvNumber(String aValue){
       invNumber = aValue;
    }
    public String getInvNumber(){
       return invNumber;
    }
	

    public void setTransformerTypeCode(int aValue){
       transformerTypeCode = aValue;
    }
    public int getTransformerTypeCode(){
       return transformerTypeCode;
    }
	
    public void setTransformerTypeName(String aValue){
       transformerTypeName = aValue;
    }
    public String getTransformerTypeName(){
       return transformerTypeName;
    }
	
    public void setElementCode(int aValue){
       elementCode = aValue;
    }
    public int getElementCode(){
       return elementCode;
    }
	



}