
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTravelSheetItemDistance2TKFuelKoef;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENTravelSheetItemDistance2TKFuelKoefShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int travelSheetItemDistanceRefCode = Integer.MIN_VALUE;
    public BigDecimal travelSheetItemDistanceRefDistance;
    public BigDecimal travelSheetItemDistanceRefSumMachineHours;
    public BigDecimal travelSheetItemDistanceRefKoef;
    public int tkFuelKoefRefCode = Integer.MIN_VALUE;
    public BigDecimal tkFuelKoefRefKoef;
    public String tkFuelKoefRefName;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setTravelSheetItemDistanceRefCode(int aValue){
       travelSheetItemDistanceRefCode = aValue;
    }
    public int getTravelSheetItemDistanceRefCode(){
       return travelSheetItemDistanceRefCode;
    }

    public void setTravelSheetItemDistanceRefDistance(BigDecimal aValue){
       travelSheetItemDistanceRefDistance = aValue;
    }
    public BigDecimal getTravelSheetItemDistanceRefDistance(){
       return travelSheetItemDistanceRefDistance;
    }

    public void setTravelSheetItemDistanceRefSumMachineHours(BigDecimal aValue){
       travelSheetItemDistanceRefSumMachineHours = aValue;
    }
    public BigDecimal getTravelSheetItemDistanceRefSumMachineHours(){
       return travelSheetItemDistanceRefSumMachineHours;
    }

    public void setTravelSheetItemDistanceRefKoef(BigDecimal aValue){
       travelSheetItemDistanceRefKoef = aValue;
    }
    public BigDecimal getTravelSheetItemDistanceRefKoef(){
       return travelSheetItemDistanceRefKoef;
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