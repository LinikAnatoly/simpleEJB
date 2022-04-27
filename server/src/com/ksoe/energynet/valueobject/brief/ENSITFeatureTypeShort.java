
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENSITFeatureType;  	
  */

import java.io.Serializable;


public class ENSITFeatureTypeShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public String name; 
    public String desc; 


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
	
    public void setDesc(String aValue){
       desc = aValue;
    }
    public String getDesc(){
       return desc;
    }
	




}