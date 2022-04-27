
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTransportRouteDistance2TKFuelKoef;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENTransportRouteDistance2TKFuelKoefShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int transportRouteDistanceRefCode = Integer.MIN_VALUE;
    public BigDecimal transportRouteDistanceRefDistance;
    public BigDecimal transportRouteDistanceRefKoef;
    public int tkFuelKoefRefCode = Integer.MIN_VALUE;
    public BigDecimal tkFuelKoefRefKoef;
    public String tkFuelKoefRefName;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setTransportRouteDistanceRefCode(int aValue){
       transportRouteDistanceRefCode = aValue;
    }
    public int getTransportRouteDistanceRefCode(){
       return transportRouteDistanceRefCode;
    }

    public void setTransportRouteDistanceRefDistance(BigDecimal aValue){
       transportRouteDistanceRefDistance = aValue;
    }
    public BigDecimal getTransportRouteDistanceRefDistance(){
       return transportRouteDistanceRefDistance;
    }

    public void setTransportRouteDistanceRefKoef(BigDecimal aValue){
       transportRouteDistanceRefKoef = aValue;
    }
    public BigDecimal getTransportRouteDistanceRefKoef(){
       return transportRouteDistanceRefKoef;
    }

    public void setTkFuelKoefRefCode(int aValue){
       tkFuelKoefRefCode = aValue;
    }
    public int getTkFuelKoefRefCode(){
       return tkFuelKoefRefCode;
    }

    public void setTkFuelKoefRefKoef(BigDecimal aValue){
       tkFuelKoefRefKoef = aValue;
    }
    public BigDecimal getTkFuelKoefRefKoef(){
       return tkFuelKoefRefKoef;
    }

    public void setTkFuelKoefRefName(String aValue){
       tkFuelKoefRefName = aValue;
    }
    public String getTkFuelKoefRefName(){
       return tkFuelKoefRefName;
    }



}