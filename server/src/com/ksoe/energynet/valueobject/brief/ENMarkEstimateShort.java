
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENMarkEstimate;
  */

import java.io.Serializable;


public class ENMarkEstimateShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String userName;
    public int markCode = Integer.MIN_VALUE;
    public String markName;
    public int estimateItemCode = Integer.MIN_VALUE;


    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }

    public void setUserName(String aValue){
       userName = aValue;
    }
    public String getUserName(){
       return userName;
    }

    public void setMarkCode(int aValue){
       markCode = aValue;
    }
    public int getMarkCode(){
       return markCode;
    }

    public void setMarkName(String aValue){
       markName = aValue;
    }
    public String getMarkName(){
       return markName;
    }

    public void setEstimateItemCode(int aValue){
       estimateItemCode = aValue;
    }
    public int getEstimateItemCode(){
       return estimateItemCode;
    }
}