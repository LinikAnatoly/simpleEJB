
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTransportOrder2Travel;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENTransportOrder2TravelShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int transportorderCode = Integer.MIN_VALUE;
    public String transportorderNumbergen;
    public Date transportorderTimeStart;
    public Date transportorderTimeFinal;
    public Date transportorderDateStart;
    public Date transportorderDateFinal;
    public Date transportorderDateEdit;
    public String transportorderUserGen;
    public int travelsheetCode = Integer.MIN_VALUE;
    public String travelsheetNumberGen;
    public Date travelsheetDateStart;
    public Date travelsheetDateFinal;
    public BigDecimal travelsheetSpeedometerStart;
    public BigDecimal travelsheetSpeedometerFinal;
    public BigDecimal travelsheetFuelCounterStart;
    public BigDecimal travelsheetFuelCounterFinal;
    public Date travelsheetTimeStart;
    public Date travelsheetTimeFinal;
    public Date travelsheetDateEdit;
    public String travelsheetUserGen;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setTransportorderCode(int aValue){
       transportorderCode = aValue;
    }
    public int getTransportorderCode(){
       return transportorderCode;
    }

    public void setTransportorderNumbergen(String aValue){
       transportorderNumbergen = aValue;
    }
    public String getTransportorderNumbergen(){
       return transportorderNumbergen;
    }


    public void setTransportorderTimeStart(Date aValue){
       transportorderTimeStart = aValue;
    }
    public Date getTransportorderTimeStart(){
       return transportorderTimeStart;
    }


    public void setTransportorderTimeFinal(Date aValue){
       transportorderTimeFinal = aValue;
    }
    public Date getTransportorderTimeFinal(){
       return transportorderTimeFinal;
    }


    public void setTransportorderDateStart(Date aValue){
       transportorderDateStart = aValue;
    }
    public Date getTransportorderDateStart(){
       return transportorderDateStart;
    }


    public void setTransportorderDateFinal(Date aValue){
       transportorderDateFinal = aValue;
    }
    public Date getTransportorderDateFinal(){
       return transportorderDateFinal;
    }


    public void setTransportorderDateEdit(Date aValue){
       transportorderDateEdit = aValue;
    }
    public Date getTransportorderDateEdit(){
       return transportorderDateEdit;
    }

    public void setTransportorderUserGen(String aValue){
       transportorderUserGen = aValue;
    }
    public String getTransportorderUserGen(){
       return transportorderUserGen;
    }

    public void setTravelsheetCode(int aValue){
       travelsheetCode = aValue;
    }
    public int getTravelsheetCode(){
       return travelsheetCode;
    }

    public void setTravelsheetNumberGen(String aValue){
       travelsheetNumberGen = aValue;
    }
    public String getTravelsheetNumberGen(){
       return travelsheetNumberGen;
    }


    public void setTravelsheetDateStart(Date aValue){
       travelsheetDateStart = aValue;
    }
    public Date getTravelsheetDateStart(){
       return travelsheetDateStart;
    }


    public void setTravelsheetDateFinal(Date aValue){
       travelsheetDateFinal = aValue;
    }
    public Date getTravelsheetDateFinal(){
       return travelsheetDateFinal;
    }

    public void setTravelsheetSpeedometerStart(BigDecimal aValue){
       travelsheetSpeedometerStart = aValue;
    }
    public BigDecimal getTravelsheetSpeedometerStart(){
       return travelsheetSpeedometerStart;
    }

    public void setTravelsheetSpeedometerFinal(BigDecimal aValue){
       travelsheetSpeedometerFinal = aValue;
    }
    public BigDecimal getTravelsheetSpeedometerFinal(){
       return travelsheetSpeedometerFinal;
    }

    public void setTravelsheetFuelCounterStart(BigDecimal aValue){
       travelsheetFuelCounterStart = aValue;
    }
    public BigDecimal getTravelsheetFuelCounterStart(){
       return travelsheetFuelCounterStart;
    }

    public void setTravelsheetFuelCounterFinal(BigDecimal aValue){
       travelsheetFuelCounterFinal = aValue;
    }
    public BigDecimal getTravelsheetFuelCounterFinal(){
       return travelsheetFuelCounterFinal;
    }


    public void setTravelsheetTimeStart(Date aValue){
       travelsheetTimeStart = aValue;
    }
    public Date getTravelsheetTimeStart(){
       return travelsheetTimeStart;
    }


    public void setTravelsheetTimeFinal(Date aValue){
       travelsheetTimeFinal = aValue;
    }
    public Date getTravelsheetTimeFinal(){
       return travelsheetTimeFinal;
    }


    public void setTravelsheetDateEdit(Date aValue){
       travelsheetDateEdit = aValue;
    }
    public Date getTravelsheetDateEdit(){
       return travelsheetDateEdit;
    }

    public void setTravelsheetUserGen(String aValue){
       travelsheetUserGen = aValue;
    }
    public String getTravelsheetUserGen(){
       return travelsheetUserGen;
    }



}