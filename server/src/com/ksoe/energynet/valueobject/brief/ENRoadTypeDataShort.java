
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENRoadTypeData;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;


public class ENRoadTypeDataShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public BigDecimal speed; 
    public BigDecimal distance; 
    public int isWinter = Integer.MIN_VALUE; 
    public BigDecimal coeff; 
    public int typeRefCode = Integer.MIN_VALUE; 
    public String typeRefName; 


    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	
    public void setSpeed(BigDecimal aValue){
       speed = aValue;
    }
    public BigDecimal getSpeed(){
       return speed;
    }
	
    public void setDistance(BigDecimal aValue){
       distance = aValue;
    }
    public BigDecimal getDistance(){
       return distance;
    }
	
    public void setIsWinter(int aValue){
       isWinter = aValue;
    }
    public int getIsWinter(){
       return isWinter;
    }
	
    public void setCoeff(BigDecimal aValue){
       coeff = aValue;
    }
    public BigDecimal getCoeff(){
       return coeff;
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
	



}