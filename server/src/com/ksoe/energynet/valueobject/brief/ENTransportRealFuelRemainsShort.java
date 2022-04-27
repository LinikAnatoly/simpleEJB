
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTransportRealFuelRemains;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENTransportRealFuelRemainsShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public Date dateStart ;
    public Date dateFinal ;
    public BigDecimal countGenStart;
    public BigDecimal priceGenStart;
    public BigDecimal sumGenStart;
    public BigDecimal countGenIn;
    public BigDecimal priceGenIn;
    public BigDecimal sumGenIn;
    public BigDecimal countGenOut;
    public BigDecimal priceGenOut;
    public BigDecimal sumGenOut;
    public BigDecimal countGenFinal;
    public BigDecimal priceGenFinal;
    public BigDecimal sumGenFinal;
    public int fuelTypeRefCode = Integer.MIN_VALUE;
    public String fuelTypeRefName;
    public int realTransportCode = Integer.MIN_VALUE;
    public String realTransportName;
    public String realTransportInvNumber;
    public String realTransportGosNumber;
    public int travelSheetFuelTypeRefCode = Integer.MIN_VALUE;
    public String travelSheetFuelTypeRefName;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setDateStart(Date aValue){
       dateStart = aValue;
    }

    public Date getDateStart(){
       return dateStart;
    }

    public void setDateFinal(Date aValue){
       dateFinal = aValue;
    }

    public Date getDateFinal(){
       return dateFinal;
    }
    public void setCountGenStart(BigDecimal aValue){
       countGenStart = aValue;
    }

    public BigDecimal getCountGenStart(){
       return countGenStart;
    }
    public void setPriceGenStart(BigDecimal aValue){
       priceGenStart = aValue;
    }

    public BigDecimal getPriceGenStart(){
       return priceGenStart;
    }
    public void setSumGenStart(BigDecimal aValue){
       sumGenStart = aValue;
    }

    public BigDecimal getSumGenStart(){
       return sumGenStart;
    }
    public void setCountGenIn(BigDecimal aValue){
       countGenIn = aValue;
    }

    public BigDecimal getCountGenIn(){
       return countGenIn;
    }
    public void setPriceGenIn(BigDecimal aValue){
       priceGenIn = aValue;
    }

    public BigDecimal getPriceGenIn(){
       return priceGenIn;
    }
    public void setSumGenIn(BigDecimal aValue){
       sumGenIn = aValue;
    }

    public BigDecimal getSumGenIn(){
       return sumGenIn;
    }
    public void setCountGenOut(BigDecimal aValue){
       countGenOut = aValue;
    }

    public BigDecimal getCountGenOut(){
       return countGenOut;
    }
    public void setPriceGenOut(BigDecimal aValue){
       priceGenOut = aValue;
    }

    public BigDecimal getPriceGenOut(){
       return priceGenOut;
    }
    public void setSumGenOut(BigDecimal aValue){
       sumGenOut = aValue;
    }

    public BigDecimal getSumGenOut(){
       return sumGenOut;
    }
    public void setCountGenFinal(BigDecimal aValue){
       countGenFinal = aValue;
    }

    public BigDecimal getCountGenFinal(){
       return countGenFinal;
    }
    public void setPriceGenFinal(BigDecimal aValue){
       priceGenFinal = aValue;
    }

    public BigDecimal getPriceGenFinal(){
       return priceGenFinal;
    }
    public void setSumGenFinal(BigDecimal aValue){
       sumGenFinal = aValue;
    }

    public BigDecimal getSumGenFinal(){
       return sumGenFinal;
    }


    public void setFuelTypeRefCode(int aValue){
       fuelTypeRefCode = aValue;
    }
    public int getFuelTypeRefCode(){
       return fuelTypeRefCode;
    }

    public void setFuelTypeRefName(String aValue){
       fuelTypeRefName = aValue;
    }
    public String getFuelTypeRefName(){
       return fuelTypeRefName;
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

    public void setTravelSheetFuelTypeRefCode(int aValue){
    	travelSheetFuelTypeRefCode = aValue;
     }
     public int getTravelSheetFuelTypeRefCode(){
        return travelSheetFuelTypeRefCode;
     }

     public void setTravelSheetFuelTypeRefName(String aValue){
     	travelSheetFuelTypeRefName = aValue;
      }
      public String getTravelSheetFuelTypeRefName(){
         return travelSheetFuelTypeRefName;
      }



}