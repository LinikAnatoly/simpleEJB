
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTransportTemperature;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENTransportTemperatureShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal countGen;
    public Date dateGen ;
    public String userGen;
    public Date dateEdit ;
    public int transportDepartmentRefCode = Integer.MIN_VALUE;
    public String transportDepartmentRefName;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setCountGen(BigDecimal aValue){
       countGen = aValue;
    }

    public BigDecimal getCountGen(){
       return countGen;
    }

    public void setDateGen(Date aValue){
       dateGen = aValue;
    }

    public Date getDateGen(){
       return dateGen;
    }
    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }

    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
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