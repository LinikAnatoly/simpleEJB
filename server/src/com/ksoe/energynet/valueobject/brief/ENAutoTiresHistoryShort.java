
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENAutoTiresHistory;
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENAutoTiresHistoryShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public Date installDate ;
    public Date uninstallDate ;
    public BigDecimal distance;
    public String actInstallNumber;
    public String actUninstallNumber;
    public String replacementReason;
    public int tiresRefCode = Integer.MIN_VALUE;
    public String tiresRefTypeName;
    public String tiresRefGarageNumber;
    public String tiresRefSerialNumber;
    public String tiresRefFactory;
    public BigDecimal tiresRefPotencial;
    public BigDecimal tiresRefDistanceAll;
    public String tiresRefNominal;
    public int transportRealRefCode = Integer.MIN_VALUE;
    public int installPlacesRefCode = Integer.MIN_VALUE;
    public String installPlacesRefName;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setInstallDate(Date aValue){
       installDate = aValue;
    }

    public Date getInstallDate(){
       return installDate;
    }

    public void setUninstallDate(Date aValue){
       uninstallDate = aValue;
    }

    public Date getUninstallDate(){
       return uninstallDate;
    }
    public void setDistance(BigDecimal aValue){
       distance = aValue;
    }

    public BigDecimal getDistance(){
       return distance;
    }

    public void setActInstallNumber(String aValue){
    	actInstallNumber = aValue;
    }

    public String getActInstallNumber(){
       return actInstallNumber;
    }

    public void setActUninstallNumber(String aValue){
    	actUninstallNumber = aValue;
    }

    public String getActUninstallNumber(){
        return actUninstallNumber;
    }

    public void setReplacementReason(String aValue){
       replacementReason = aValue;
    }

    public String getReplacementReason(){
       return replacementReason;
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


    public void setInstallPlacesRefCode(int aValue){
       installPlacesRefCode = aValue;
    }
    public int getInstallPlacesRefCode(){
       return installPlacesRefCode;
    }

    public void setInstallPlacesRefName(String aValue){
       installPlacesRefName = aValue;
    }
    public String getInstallPlacesRefName(){
       return installPlacesRefName;
    }



}