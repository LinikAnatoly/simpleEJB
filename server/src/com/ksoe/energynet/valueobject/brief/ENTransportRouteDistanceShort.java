
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTransportRouteDistance;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENTransportRouteDistanceShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal distance;
    public BigDecimal koef;
    public int transportRouteRefCode = Integer.MIN_VALUE;
    public BigDecimal transportRouteRefDistance;
    public BigDecimal transportRouteRefWeight;
    public BigDecimal transportRouteRefDistanceNew;
    public BigDecimal transportRouteRefSpeedometerStart;
    public BigDecimal transportRouteRefSpeedometerFinal;
    public BigDecimal transportRouteRefFuelCounterStart;
    public BigDecimal transportRouteRefFuelCounterFinal;
    public Date transportRouteRefDateEdit;
    public String transportRouteRefUserGen;

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
    public void setKoef(BigDecimal aValue){
       koef = aValue;
    }

    public BigDecimal getKoef(){
       return koef;
    }


    public void setTransportRouteRefCode(int aValue){
       transportRouteRefCode = aValue;
    }
    public int getTransportRouteRefCode(){
       return transportRouteRefCode;
    }

    public void setTransportRouteRefDistance(BigDecimal aValue){
       transportRouteRefDistance = aValue;
    }
    public BigDecimal getTransportRouteRefDistance(){
       return transportRouteRefDistance;
    }

    public void setTransportRouteRefWeight(BigDecimal aValue){
       transportRouteRefWeight = aValue;
    }
    public BigDecimal getTransportRouteRefWeight(){
       return transportRouteRefWeight;
    }

    public void setTransportRouteRefDistanceNew(BigDecimal aValue){
       transportRouteRefDistanceNew = aValue;
    }
    public BigDecimal getTransportRouteRefDistanceNew(){
       return transportRouteRefDistanceNew;
    }

    public void setTransportRouteRefSpeedometerStart(BigDecimal aValue){
       transportRouteRefSpeedometerStart = aValue;
    }
    public BigDecimal getTransportRouteRefSpeedometerStart(){
       return transportRouteRefSpeedometerStart;
    }

    public void setTransportRouteRefSpeedometerFinal(BigDecimal aValue){
       transportRouteRefSpeedometerFinal = aValue;
    }
    public BigDecimal getTransportRouteRefSpeedometerFinal(){
       return transportRouteRefSpeedometerFinal;
    }

    public void setTransportRouteRefFuelCounterStart(BigDecimal aValue){
       transportRouteRefFuelCounterStart = aValue;
    }
    public BigDecimal getTransportRouteRefFuelCounterStart(){
       return transportRouteRefFuelCounterStart;
    }

    public void setTransportRouteRefFuelCounterFinal(BigDecimal aValue){
       transportRouteRefFuelCounterFinal = aValue;
    }
    public BigDecimal getTransportRouteRefFuelCounterFinal(){
       return transportRouteRefFuelCounterFinal;
    }


    public void setTransportRouteRefDateEdit(Date aValue){
       transportRouteRefDateEdit = aValue;
    }
    public Date getTransportRouteRefDateEdit(){
       return transportRouteRefDateEdit;
    }

    public void setTransportRouteRefUserGen(String aValue){
       transportRouteRefUserGen = aValue;
    }
    public String getTransportRouteRefUserGen(){
       return transportRouteRefUserGen;
    }



}