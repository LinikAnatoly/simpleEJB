
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENPlanGraphFinancingFuel;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENPlanGraphFinancingFuelShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int monthGen = Integer.MIN_VALUE;
    public int yearGen = Integer.MIN_VALUE;
    public BigDecimal totalSum;
    public BigDecimal koefDekada1;
    public BigDecimal koefDekada2;
    public BigDecimal koefDekada3;
    public BigDecimal countFuelSpent;
    public String userGen;
    public Date dateEdit ;
    public int fuelTypeRefCode = Integer.MIN_VALUE;
    public String fuelTypeRefName;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setMonthGen(int aValue){
       monthGen = aValue;
    }

    public int getMonthGen(){
       return monthGen;
    }
    public void setYearGen(int aValue){
       yearGen = aValue;
    }

    public int getYearGen(){
       return yearGen;
    }
    public void setTotalSum(BigDecimal aValue){
       totalSum = aValue;
    }

    public BigDecimal getTotalSum(){
       return totalSum;
    }
    public void setKoefDekada1(BigDecimal aValue){
       koefDekada1 = aValue;
    }

    public BigDecimal getKoefDekada1(){
       return koefDekada1;
    }
    public void setKoefDekada2(BigDecimal aValue){
       koefDekada2 = aValue;
    }

    public BigDecimal getKoefDekada2(){
       return koefDekada2;
    }
    public void setKoefDekada3(BigDecimal aValue){
       koefDekada3 = aValue;
    }

    public BigDecimal getKoefDekada3(){
       return koefDekada3;
    }
    public void setCountFuelSpent(BigDecimal aValue){
       countFuelSpent = aValue;
    }

    public BigDecimal getCountFuelSpent(){
       return countFuelSpent;
    }
    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }

    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
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



}