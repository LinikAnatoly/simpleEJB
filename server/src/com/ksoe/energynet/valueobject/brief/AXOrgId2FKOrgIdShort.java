
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for AXOrgId2FKOrgId;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class AXOrgId2FKOrgIdShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String axOrgId;
    public String axName;
    public String fkOrgId;
    public String fkName;


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setAxOrgId(String aValue){
       axOrgId = aValue;
    }

    public String getAxOrgId(){
       return axOrgId;
    }

    public void setAxName(String aValue){
       axName = aValue;
    }

    public String getAxName(){
       return axName;
    }

    public void setFkOrgId(String aValue){
       fkOrgId = aValue;
    }

    public String getFkOrgId(){
       return fkOrgId;
    }

    public void setFkName(String aValue){
       fkName = aValue;
    }

    public String getFkName(){
       return fkName;
    }




}