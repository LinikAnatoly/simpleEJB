
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENAccess2Enelement;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENAccess2EnelementShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int isAccess = Integer.MIN_VALUE;
    public int elementRefCode = Integer.MIN_VALUE;
    public String name;
    public String buhName;
    public String invNumber;
    public String renName;
    
    

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setIsAccess(int aValue){
       isAccess = aValue;
    }

    public int getIsAccess(){
       return isAccess;
    }


    public void setElementRefCode(int aValue){
       elementRefCode = aValue;
    }
    public int getElementRefCode(){
       return elementRefCode;
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
     
     public void setInvNuber(String aValue){
         invNumber = aValue;
      }
     public String getInvNumber(){
         return invNumber;
      }
     public void setRenName(String aValue){
         renName = aValue;
      }
     public String getRenName(){
         return renName;
      }



}