
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTravelSheetItem2TransportItem;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENTravelSheetItem2TransportItemShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int travelSheetItemRefCode = Integer.MIN_VALUE;
    public String travelSheetItemRefTravelFrom;
    public String travelSheetItemRefTravelTo;
    public Date travelSheetItemRefTimeStart;
    public Date travelSheetItemRefTimeFinal;
    public BigDecimal travelSheetItemRefSpeedometerStart;
    public BigDecimal travelSheetItemRefSpeedometerFinal;
    public BigDecimal travelSheetItemRefSumDistances;
    public BigDecimal travelSheetItemRefSumMachineHours;
    public Date travelSheetItemRefDateEdit;
    public String travelSheetItemRefUserGen;
    public int transportItemRefCode = Integer.MIN_VALUE;
    public BigDecimal transportItemRefCountWorkGen;
    public BigDecimal transportItemRefCountWorkFact;
    public BigDecimal transportItemRefPrice;
    public BigDecimal transportItemRefCost;
    public String transportItemRefUserGen;
    public Date transportItemRefDateEdit;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
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

    public void setTransportItemRefCode(int aValue){
       transportItemRefCode = aValue;
    }
    public int getTransportItemRefCode(){
       return transportItemRefCode;
    }

    public void setTransportItemRefCountWorkGen(BigDecimal aValue){
       transportItemRefCountWorkGen = aValue;
    }
    public BigDecimal getTransportItemRefCountWorkGen(){
       return transportItemRefCountWorkGen;
    }

    public void setTransportItemRefCountWorkFact(BigDecimal aValue){
       transportItemRefCountWorkFact = aValue;
    }
    public BigDecimal getTransportItemRefCountWorkFact(){
       return transportItemRefCountWorkFact;
    }

    public void setTransportItemRefPrice(BigDecimal aValue){
       transportItemRefPrice = aValue;
    }
    public BigDecimal getTransportItemRefPrice(){
       return transportItemRefPrice;
    }

    public void setTransportItemRefCost(BigDecimal aValue){
       transportItemRefCost = aValue;
    }
    public BigDecimal getTransportItemRefCost(){
       return transportItemRefCost;
    }

    public void setTransportItemRefUserGen(String aValue){
       transportItemRefUserGen = aValue;
    }
    public String getTransportItemRefUserGen(){
       return transportItemRefUserGen;
    }


    public void setTransportItemRefDateEdit(Date aValue){
       transportItemRefDateEdit = aValue;
    }
    public Date getTransportItemRefDateEdit(){
       return transportItemRefDateEdit;
    }



}