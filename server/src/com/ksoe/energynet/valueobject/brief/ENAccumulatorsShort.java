
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENAccumulators;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENAccumulatorsShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String name;
    public String typeName;
    public String factory;
    public String garageNumber;
    public String yearProduction;
    public String serialNumber;
    public Date receiptDate ;
    public BigDecimal mileage;
    public BigDecimal mileageAll;
    public BigDecimal potencial;
    public int materialRefCode = Integer.MIN_VALUE;
    public int installStatusRefCode = Integer.MIN_VALUE;
    public String installStatusRefName;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }
    public void setTypeName(String aValue){
       typeName = aValue;
    }

    public String getTypeName(){
       return typeName;
    }
    public void setFactory(String aValue){
       factory = aValue;
    }

    public String getFactory(){
       return factory;
    }
    public void setGarageNumber(String aValue){
       garageNumber = aValue;
    }

    public String getGarageNumber(){
       return garageNumber;
    }
    public void setYearProduction(String aValue){
       yearProduction = aValue;
    }

    public String getYearProduction(){
       return yearProduction;
    }
    public void setSerialNumber(String aValue){
       serialNumber = aValue;
    }

    public String getSerialNumber(){
       return serialNumber;
    }

    public void setReceiptDate(Date aValue){
       receiptDate = aValue;
    }

    public Date getReceiptDate(){
       return receiptDate;
    }
    public void setMileage(BigDecimal aValue){
       mileage = aValue;
    }

    public BigDecimal getMileage(){
       return mileage;
    }
    public void setMileageAll(BigDecimal aValue){
       mileageAll = aValue;
    }

    public BigDecimal getMileageAll(){
       return mileageAll;
    }
    public void setPotencial(BigDecimal aValue){
       potencial = aValue;
    }

    public BigDecimal getPotencial(){
       return potencial;
    }

    public void setMaterialRefCode(int aValue){
       materialRefCode = aValue;
    }
    public int getMaterialRefCode(){
       return materialRefCode;
    }


    public void setInstallStatusRefCode(int aValue){
       installStatusRefCode = aValue;
    }
    public int getInstallStatusRefCode(){
       return installStatusRefCode;
    }

    public void setInstallStatusRefName(String aValue){
       installStatusRefName = aValue;
    }
    public String getInstallStatusRefName(){
       return installStatusRefName;
    }



}