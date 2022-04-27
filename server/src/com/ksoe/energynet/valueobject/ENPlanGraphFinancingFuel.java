
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPlanGraphFinancingFuel;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.techcard.valueobject.references.TKFuelTypeRef;

public class ENPlanGraphFinancingFuel implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  monthGen = Integer.MIN_VALUE; 
    public int  yearGen = Integer.MIN_VALUE; 
    public BigDecimal  totalSum; 
    public BigDecimal  koefDekada1; 
    public BigDecimal  koefDekada2; 
    public BigDecimal  koefDekada3; 
    public BigDecimal  countFuelSpent; 
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public TKFuelTypeRef fuelTypeRef = new TKFuelTypeRef();
    public static final String tableName = "ENPLANGRAPHFINANCINGFL";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPLANGRAPHFINANCINGFL.CODE";
    public static final String monthGen_Attr = "monthGen";
    public static final String monthGen_Field = "MONTHGEN";
    public static final String monthGen_QFielld = "ENPLANGRAPHFINANCINGFL.MONTHGEN";
    public static final String yearGen_Attr = "yearGen";
    public static final String yearGen_Field = "YEARGEN";
    public static final String yearGen_QFielld = "ENPLANGRAPHFINANCINGFL.YEARGEN";
    public static final String totalSum_Attr = "totalSum";
    public static final String totalSum_Field = "TOTALSUM";
    public static final String totalSum_QFielld = "ENPLANGRAPHFINANCINGFL.TOTALSUM";
    public static final String koefDekada1_Attr = "koefDekada1";
    public static final String koefDekada1_Field = "KOEFDEKADA1";
    public static final String koefDekada1_QFielld = "ENPLANGRAPHFINANCINGFL.KOEFDEKADA1";
    public static final String koefDekada2_Attr = "koefDekada2";
    public static final String koefDekada2_Field = "KOEFDEKADA2";
    public static final String koefDekada2_QFielld = "ENPLANGRAPHFINANCINGFL.KOEFDEKADA2";
    public static final String koefDekada3_Attr = "koefDekada3";
    public static final String koefDekada3_Field = "KOEFDEKADA3";
    public static final String koefDekada3_QFielld = "ENPLANGRAPHFINANCINGFL.KOEFDEKADA3";
    public static final String countFuelSpent_Attr = "countFuelSpent";
    public static final String countFuelSpent_Field = "COUNTFUELSPENT";
    public static final String countFuelSpent_QFielld = "ENPLANGRAPHFINANCINGFL.COUNTFUELSPENT";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENPLANGRAPHFINANCINGFL.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENPLANGRAPHFINANCINGFL.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENPLANGRAPHFINANCINGFL.MODIFY_TIME";
    public static final String fuelTypeRef_Attr = "fuelTypeRef";
    public static final String fuelTypeRef_Field = "FUELTYPEREFCODE";
    public static final String  fuelTypeRef_QFielld = "ENPLANGRAPHFINANCINGFL.FUELTYPEREFCODE";


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

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setFuelTypeRef(TKFuelTypeRef aValue){
       fuelTypeRef = aValue;
    }

    public TKFuelTypeRef getFuelTypeRef(){
       return fuelTypeRef;
    }

} // end of ENPlanGraphFinancingFuelValueObject

