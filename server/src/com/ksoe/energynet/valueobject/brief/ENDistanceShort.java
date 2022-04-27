
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENDistance;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;


public class ENDistanceShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public BigDecimal distance; 
    public int typeRefCode = Integer.MIN_VALUE; 
    public String typeRefName; 
    public int roadTypeCode = Integer.MIN_VALUE; 
    public String roadTypeName; 
    public int transportItemRefCode = Integer.MIN_VALUE; 


    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	
    public void setDistance(BigDecimal aValue){
       distance = aValue;
    }
    public BigDecimal getDistance(){
       return distance;
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
	
    public void setRoadTypeCode(int aValue){
       roadTypeCode = aValue;
    }
    public int getRoadTypeCode(){
       return roadTypeCode;
    }
	
    public void setRoadTypeName(String aValue){
       roadTypeName = aValue;
    }
    public String getRoadTypeName(){
       return roadTypeName;
    }
	
    public void setTransportItemRefCode(int aValue){
       transportItemRefCode = aValue;
    }
    public int getTransportItemRefCode(){
       return transportItemRefCode;
    }
	



}