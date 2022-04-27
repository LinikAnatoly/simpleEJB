
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTravelSheetItemDistance;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENTravelSheetItemDistanceShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal distance;
    public BigDecimal sumMachineHours;
    public BigDecimal koef;
    public int travelSheetItemRefCode = Integer.MIN_VALUE;
    public String travelSheetItemRefTravelFrom;
    public String travelSheetItemRefTravelTo;
    public Date travelSheetItemRefTimeStart;
    public Date travelSheetItemRefTimeFinal;
    public BigDecimal travelSheetItemRefSpeedometerStart;
    public BigDecimal travelSheetItemRefSpeedometerFinal;
    public BigDecimal travelSheetItemRefFuelCounterStart;
    public BigDecimal travelSheetItemRefFuelCounterFinal;
    public BigDecimal travelSheetItemRefSumDistances;
    public BigDecimal travelSheetItemRefSumMachineHours;
    public Date travelSheetItemRefDateEdit;
    public String travelSheetItemRefUserGen;

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
    public void setSumMachineHours(BigDecimal aValue){
       sumMachineHours = aValue;
    }

    public BigDecimal getSumMachineHours(){
       return sumMachineHours;
    }
    public void setKoef(BigDecimal aValue){
       koef = aValue;
    }

    public BigDecimal getKoef(){
       return koef;
    }


    public void setTravelSheetItemRefCode(int aValue){
       travelSheetItemRefCode = aValue;
    }
    public int getTravelSheetItemRefCode(){
       return travelSheetItemRefCode;
    }

    public void setTravelSheetItemRefTravelFrom(String aValue){
       travelSheetItemRefTravelFrom = aValue;
    }
    public String getTravelSheetItemRefTravelFrom(){
       return travelSheetItemRefTravelFrom;
    }

    public void setTravelSheetItemRefTravelTo(String aValue){
       travelSheetItemRefTravelTo = aValue;
    }
    public String getTravelSheetItemRefTravelTo(){
       return travelSheetItemRefTravelTo;
    }


    public void setTravelSheetItemRefTimeStart(Date aValue){
       travelSheetItemRefTimeStart = aValue;
    }
    public Date getTravelSheetItemRefTimeStart(){
       return travelSheetItemRefTimeStart;
    }


    public void setTravelSheetItemRefTimeFinal(Date aValue){
       travelSheetItemRefTimeFinal = aValue;
    }
    public Date getTravelSheetItemRefTimeFinal(){
       return travelSheetItemRefTimeFinal;
    }

    public void setTravelSheetItemRefSpeedometerStart(BigDecimal aValue){
       travelSheetItemRefSpeedometerStart = aValue;
    }
    public BigDecimal getTravelSheetItemRefSpeedometerStart(){
       return travelSheetItemRefSpeedometerStart;
    }

    public void setTravelSheetItemRefSpeedometerFinal(BigDecimal aValue){
       travelSheetItemRefSpeedometerFinal = aValue;
    }
    public BigDecimal getTravelSheetItemRefSpeedometerFinal(){
       return travelSheetItemRefSpeedometerFinal;
    }

    public void setTravelSheetItemRefFuelCounterStart(BigDecimal aValue){
       travelSheetItemRefFuelCounterStart = aValue;
    }
    public BigDecimal getTravelSheetItemRefFuelCounterStart(){
       return travelSheetItemRefFuelCounterStart;
    }

    public void setTravelSheetItemRefFuelCounterFinal(BigDecimal aValue){
       travelSheetItemRefFuelCounterFinal = aValue;
    }
    public BigDecimal getTravelSheetItemRefFuelCounterFinal(){
       return travelSheetItemRefFuelCounterFinal;
    }

    public void setTravelSheetItemRefSumDistances(BigDecimal aValue){
       travelSheetItemRefSumDistances = aValue;
    }
    public BigDecimal getTravelSheetItemRefSumDistances(){
       return travelSheetItemRefSumDistances;
    }

    public void setTravelSheetItemRefSumMachineHours(BigDecimal aValue){
       travelSheetItemRefSumMachineHours = aValue;
    }
    public BigDecimal getTravelSheetItemRefSumMachineHours(){
       return travelSheetItemRefSumMachineHours;
    }


    public void setTravelSheetItemRefDateEdit(Date aValue){
       travelSheetItemRefDateEdit = aValue;
    }
    public Date getTravelSheetItemRefDateEdit(){
       return travelSheetItemRefDateEdit;
    }

    public void setTravelSheetItemRefUserGen(String aValue){
       travelSheetItemRefUserGen = aValue;
    }
    public String getTravelSheetItemRefUserGen(){
       return travelSheetItemRefUserGen;
    }



}