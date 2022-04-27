
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTravelSheetFuelFill;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENTravelSheetFuelFillShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public Date timeGen ;
    public BigDecimal countGen;
    public Date timeReceived ;
    public int travelSheetRefCode = Integer.MIN_VALUE;
    public String travelSheetRefNumberGen;
    public Date travelSheetRefDateStart;
    public Date travelSheetRefDateFinal;
    public BigDecimal travelSheetRefSpeedometerStart;
    public BigDecimal travelSheetRefSpeedometerFinal;
    public BigDecimal travelSheetRefFuelCounterStart;
    public BigDecimal travelSheetRefFuelCounterFinal;
    public Date travelSheetRefTimeStart;
    public Date travelSheetRefTimeFinal;
    public Date travelSheetRefDateEdit;
    public String travelSheetRefUserGen;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setTimeGen(Date aValue){
       timeGen = aValue;
    }

    public Date getTimeGen(){
       return timeGen;
    }
    public void setCountGen(BigDecimal aValue){
       countGen = aValue;
    }

    public BigDecimal getCountGen(){
       return countGen;
    }

    public void setTimeReceived(Date aValue){
       timeReceived = aValue;
    }

    public Date getTimeReceived(){
       return timeReceived;
    }


    public void setTravelSheetRefCode(int aValue){
       travelSheetRefCode = aValue;
    }
    public int getTravelSheetRefCode(){
       return travelSheetRefCode;
    }

    public void setTravelSheetRefNumberGen(String aValue){
       travelSheetRefNumberGen = aValue;
    }
    public String getTravelSheetRefNumberGen(){
       return travelSheetRefNumberGen;
    }


    public void setTravelSheetRefDateStart(Date aValue){
       travelSheetRefDateStart = aValue;
    }
    public Date getTravelSheetRefDateStart(){
       return travelSheetRefDateStart;
    }


    public void setTravelSheetRefDateFinal(Date aValue){
       travelSheetRefDateFinal = aValue;
    }
    public Date getTravelSheetRefDateFinal(){
       return travelSheetRefDateFinal;
    }

    public void setTravelSheetRefSpeedometerStart(BigDecimal aValue){
       travelSheetRefSpeedometerStart = aValue;
    }
    public BigDecimal getTravelSheetRefSpeedometerStart(){
       return travelSheetRefSpeedometerStart;
    }

    public void setTravelSheetRefSpeedometerFinal(BigDecimal aValue){
       travelSheetRefSpeedometerFinal = aValue;
    }
    public BigDecimal getTravelSheetRefSpeedometerFinal(){
       return travelSheetRefSpeedometerFinal;
    }

    public void setTravelSheetRefFuelCounterStart(BigDecimal aValue){
       travelSheetRefFuelCounterStart = aValue;
    }
    public BigDecimal getTravelSheetRefFuelCounterStart(){
       return travelSheetRefFuelCounterStart;
    }

    public void setTravelSheetRefFuelCounterFinal(BigDecimal aValue){
       travelSheetRefFuelCounterFinal = aValue;
    }
    public BigDecimal getTravelSheetRefFuelCounterFinal(){
       return travelSheetRefFuelCounterFinal;
    }


    public void setTravelSheetRefTimeStart(Date aValue){
       travelSheetRefTimeStart = aValue;
    }
    public Date getTravelSheetRefTimeStart(){
       return travelSheetRefTimeStart;
    }


    public void setTravelSheetRefTimeFinal(Date aValue){
       travelSheetRefTimeFinal = aValue;
    }
    public Date getTravelSheetRefTimeFinal(){
       return travelSheetRefTimeFinal;
    }


    public void setTravelSheetRefDateEdit(Date aValue){
       travelSheetRefDateEdit = aValue;
    }
    public Date getTravelSheetRefDateEdit(){
       return travelSheetRefDateEdit;
    }

    public void setTravelSheetRefUserGen(String aValue){
       travelSheetRefUserGen = aValue;
    }
    public String getTravelSheetRefUserGen(){
       return travelSheetRefUserGen;
    }



}