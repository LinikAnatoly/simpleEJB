
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENCheckpoint;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENCheckpointShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String name;
    public int transportDepartmentRefCode = Integer.MIN_VALUE;
    public String transportDepartmentRefName;

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


    public void setTransportDepartmentRefCode(int aValue){
       transportDepartmentRefCode = aValue;
    }
    public int getTransportDepartmentRefCode(){
       return transportDepartmentRefCode;
    }

    public void setTransportDepartmentRefName(String aValue){
       transportDepartmentRefName = aValue;
    }
    public String getTransportDepartmentRefName(){
       return transportDepartmentRefName;
    }



}