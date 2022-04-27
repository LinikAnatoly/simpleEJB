
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for FinRenCode2FinRenCodeBase;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class FinRenCode2FinRenCodeBaseShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String finRenCode;
    public String finRenCodeOut;
    public int priority = Integer.MIN_VALUE;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setFinRenCode(String aValue){
       finRenCode = aValue;
    }

    public String getFinRenCode(){
       return finRenCode;
    }
    public void setFinRenCodeOut(String aValue){
       finRenCodeOut = aValue;
    }

    public String getFinRenCodeOut(){
       return finRenCodeOut;
    }
    public void setPriority(int aValue){
       priority = aValue;
    }

    public int getPriority(){
       return priority;
    }




}