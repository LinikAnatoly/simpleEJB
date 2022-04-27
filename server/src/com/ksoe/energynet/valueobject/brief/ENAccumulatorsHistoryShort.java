
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENAccumulatorsHistory;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENAccumulatorsHistoryShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public Date installDate ;
    public Date uninstallDate ;
    public BigDecimal distance;
    public String replacementReason;
    public int accumulatorsRefCode = Integer.MIN_VALUE;
    public String accumulatorsRefName;
    public String accumulatorsRefTypeName;
    public String accumulatorsRefFactory;
    public String accumulatorsRefGarageNumber;
    public String accumulatorsRefYearProduction;
    public String accumulatorsRefSerialNumber;
    public Date accumulatorsRefReceiptDate;
    public BigDecimal accumulatorsRefMileage;
    public BigDecimal accumulatorsRefMileageAll;
    public BigDecimal accumulatorsRefPotencial;
    public int transportRealRefCode = Integer.MIN_VALUE;

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
    public void setReplacementReason(String aValue){
       replacementReason = aValue;
    }

    public String getReplacementReason(){
       return replacementReason;
    }


    public void setAccumulatorsRefCode(int aValue){
       accumulatorsRefCode = aValue;
    }
    public int getAccumulatorsRefCode(){
       return accumulatorsRefCode;
    }

    public void setAccumulatorsRefName(String aValue){
       accumulatorsRefName = aValue;
    }
    public String getAccumulatorsRefName(){
       return accumulatorsRefName;
    }

    public void setAccumulatorsRefTypeName(String aValue){
       accumulatorsRefTypeName = aValue;
    }
    public String getAccumulatorsRefTypeName(){
       return accumulatorsRefTypeName;
    }

    public void setAccumulatorsRefFactory(String aValue){
       accumulatorsRefFactory = aValue;
    }
    public String getAccumulatorsRefFactory(){
       return accumulatorsRefFactory;
    }

    public void setAccumulatorsRefGarageNumber(String aValue){
       accumulatorsRefGarageNumber = aValue;
    }
    public String getAccumulatorsRefGarageNumber(){
       return accumulatorsRefGarageNumber;
    }

    public void setAccumulatorsRefYearProduction(String aValue){
       accumulatorsRefYearProduction = aValue;
    }
    public String getAccumulatorsRefYearProduction(){
       return accumulatorsRefYearProduction;
    }

    public void setAccumulatorsRefSerialNumber(String aValue){
       accumulatorsRefSerialNumber = aValue;
    }
    public String getAccumulatorsRefSerialNumber(){
       return accumulatorsRefSerialNumber;
    }


    public void setAccumulatorsRefReceiptDate(Date aValue){
       accumulatorsRefReceiptDate = aValue;
    }
    public Date getAccumulatorsRefReceiptDate(){
       return accumulatorsRefReceiptDate;
    }

    public void setAccumulatorsRefMileage(BigDecimal aValue){
       accumulatorsRefMileage = aValue;
    }
    public BigDecimal getAccumulatorsRefMileage(){
       return accumulatorsRefMileage;
    }

    public void setAccumulatorsRefMileageAll(BigDecimal aValue){
       accumulatorsRefMileageAll = aValue;
    }
    public BigDecimal getAccumulatorsRefMileageAll(){
       return accumulatorsRefMileageAll;
    }

    public void setAccumulatorsRefPotencial(BigDecimal aValue){
       accumulatorsRefPotencial = aValue;
    }
    public BigDecimal getAccumulatorsRefPotencial(){
       return accumulatorsRefPotencial;
    }
    public void setTransportRealRefCode(int aValue){
       transportRealRefCode = aValue;
    }
    public int getTransportRealRefCode(){
       return transportRealRefCode;
    }




}