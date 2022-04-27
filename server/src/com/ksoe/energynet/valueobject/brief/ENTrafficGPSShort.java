
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTrafficGPS;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENTrafficGPSShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public Date dateGen ;
    public BigDecimal sumKm;
    public BigDecimal sumFuel;
    public int realTransportCode = Integer.MIN_VALUE;
    public String realTransportName;
    public String realTransportInvNumber;
    public String realTransportGosNumber;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setDateGen(Date aValue){
       dateGen = aValue;
    }

    public Date getDateGen(){
       return dateGen;
    }
    public void setSumKm(BigDecimal aValue){
       sumKm = aValue;
    }

    public BigDecimal getSumKm(){
       return sumKm;
    }
    public void setSumFuel(BigDecimal aValue){
       sumFuel = aValue;
    }

    public BigDecimal getSumFuel(){
       return sumFuel;
    }


    public void setRealTransportCode(int aValue){
       realTransportCode = aValue;
    }
    public int getRealTransportCode(){
       return realTransportCode;
    }

    public void setRealTransportName(String aValue){
       realTransportName = aValue;
    }
    public String getRealTransportName(){
       return realTransportName;
    }

    public void setRealTransportInvNumber(String aValue){
       realTransportInvNumber = aValue;
    }
    public String getRealTransportInvNumber(){
       return realTransportInvNumber;
    }

    public void setRealTransportGosNumber(String aValue){
       realTransportGosNumber = aValue;
    }
    public String getRealTransportGosNumber(){
       return realTransportGosNumber;
    }



}