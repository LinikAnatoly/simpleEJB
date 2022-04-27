
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENAutoTiresDistance;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENAutoTiresDistanceShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal recordDistance;
    public Date recordtDate ;
    public int tiresRefCode = Integer.MIN_VALUE;
    public String tiresRefTypeName;
    public String tiresRefGarageNumber;
    public String tiresRefSerialNumber;
    public String tiresRefFactory;
    public BigDecimal tiresRefPotencial;
    public BigDecimal tiresRefDistanceAll;
    public String tiresRefNominal;
    public int transportRealRefCode = Integer.MIN_VALUE;
    public int travelSheetRefCode = Integer.MIN_VALUE;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setRecordDistance(BigDecimal aValue){
       recordDistance = aValue;
    }

    public BigDecimal getRecordDistance(){
       return recordDistance;
    }

    public void setRecordtDate(Date aValue){
       recordtDate = aValue;
    }

    public Date getRecordtDate(){
       return recordtDate;
    }


    public void setTiresRefCode(int aValue){
       tiresRefCode = aValue;
    }
    public int getTiresRefCode(){
       return tiresRefCode;
    }

    public void setTiresRefTypeName(String aValue){
       tiresRefTypeName = aValue;
    }
    public String getTiresRefTypeName(){
       return tiresRefTypeName;
    }

    public void setTiresRefGarageNumber(String aValue){
       tiresRefGarageNumber = aValue;
    }
    public String getTiresRefGarageNumber(){
       return tiresRefGarageNumber;
    }

    public void setTiresRefSerialNumber(String aValue){
       tiresRefSerialNumber = aValue;
    }
    public String getTiresRefSerialNumber(){
       return tiresRefSerialNumber;
    }

    public void setTiresRefFactory(String aValue){
       tiresRefFactory = aValue;
    }
    public String getTiresRefFactory(){
       return tiresRefFactory;
    }

    public void setTiresRefPotencial(BigDecimal aValue){
       tiresRefPotencial = aValue;
    }
    public BigDecimal getTiresRefPotencial(){
       return tiresRefPotencial;
    }

    public void setTiresRefDistanceAll(BigDecimal aValue){
       tiresRefDistanceAll = aValue;
    }
    public BigDecimal getTiresRefDistanceAll(){
       return tiresRefDistanceAll;
    }

    public void setTiresRefNominal(String aValue){
       tiresRefNominal = aValue;
    }
    public String getTiresRefNominal(){
       return tiresRefNominal;
    }
    public void setTransportRealRefCode(int aValue){
       transportRealRefCode = aValue;
    }
    public int getTransportRealRefCode(){
       return transportRealRefCode;
    }

    public void setTravelSheetRefCode(int aValue){
       travelSheetRefCode = aValue;
    }
    public int getTravelSheetRefCode(){
       return travelSheetRefCode;
    }




}