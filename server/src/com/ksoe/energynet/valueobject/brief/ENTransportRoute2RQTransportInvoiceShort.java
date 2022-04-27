
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTransportRoute2RQTransportInvoice;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENTransportRoute2RQTransportInvoiceShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int invoiceRefCode = Integer.MIN_VALUE;
    public int transportRouteRefCode = Integer.MIN_VALUE;
    public BigDecimal transportRouteRefDistance;
    public BigDecimal transportRouteRefWeight;
    public BigDecimal transportRouteRefDistanceNew;
    public BigDecimal transportRouteRefSpeedometerStart;
    public BigDecimal transportRouteRefSpeedometerFinal;
    public Date transportRouteRefDateEdit;
    public String transportRouteRefUserGen;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setInvoiceRefCode(int aValue){
       invoiceRefCode = aValue;
    }
    public int getInvoiceRefCode(){
       return invoiceRefCode;
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