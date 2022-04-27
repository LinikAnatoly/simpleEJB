
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENFuelDistributionSheet;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.techcard.valueobject.references.TKFuelTypeRef;

public class ENFuelDistributionSheet implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  monthGen = Integer.MIN_VALUE; 
    public int  yearGen = Integer.MIN_VALUE; 
    public BigDecimal  totalSum; 
    public BigDecimal  sum1; 
    public BigDecimal  sum2; 
    public BigDecimal  sum3; 
    public BigDecimal  sum4; 
    public BigDecimal  sum5; 
    public BigDecimal  sum6; 
    public BigDecimal  sum7; 
    public BigDecimal  sum1dec1; 
    public BigDecimal  sum2dec1; 
    public BigDecimal  sum3dec1; 
    public BigDecimal  sum4dec1; 
    public BigDecimal  sum5dec1; 
    public BigDecimal  sum6dec1; 
    public BigDecimal  sum7dec1; 
    public BigDecimal  sum1dec2; 
    public BigDecimal  sum2dec2; 
    public BigDecimal  sum3dec2; 
    public BigDecimal  sum4dec2; 
    public BigDecimal  sum5dec2; 
    public BigDecimal  sum6dec2; 
    public BigDecimal  sum7dec2; 
    public BigDecimal  sum1dec3; 
    public BigDecimal  sum2dec3; 
    public BigDecimal  sum3dec3; 
    public BigDecimal  sum4dec3; 
    public BigDecimal  sum5dec3; 
    public BigDecimal  sum6dec3; 
    public BigDecimal  sum7dec3; 
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public TKFuelTypeRef fuelTypeRef = new TKFuelTypeRef();
    public static final String tableName = "ENFUELDISTRIBUTIONSHET";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENFUELDISTRIBUTIONSHET.CODE";
    public static final String monthGen_Attr = "monthGen";
    public static final String monthGen_Field = "MONTHGEN";
    public static final String monthGen_QFielld = "ENFUELDISTRIBUTIONSHET.MONTHGEN";
    public static final String yearGen_Attr = "yearGen";
    public static final String yearGen_Field = "YEARGEN";
    public static final String yearGen_QFielld = "ENFUELDISTRIBUTIONSHET.YEARGEN";
    public static final String totalSum_Attr = "totalSum";
    public static final String totalSum_Field = "TOTALSUM";
    public static final String totalSum_QFielld = "ENFUELDISTRIBUTIONSHET.TOTALSUM";
    public static final String sum1_Attr = "sum1";
    public static final String sum1_Field = "SUM1";
    public static final String sum1_QFielld = "ENFUELDISTRIBUTIONSHET.SUM1";
    public static final String sum2_Attr = "sum2";
    public static final String sum2_Field = "SUM2";
    public static final String sum2_QFielld = "ENFUELDISTRIBUTIONSHET.SUM2";
    public static final String sum3_Attr = "sum3";
    public static final String sum3_Field = "SUM3";
    public static final String sum3_QFielld = "ENFUELDISTRIBUTIONSHET.SUM3";
    public static final String sum4_Attr = "sum4";
    public static final String sum4_Field = "SUM4";
    public static final String sum4_QFielld = "ENFUELDISTRIBUTIONSHET.SUM4";
    public static final String sum5_Attr = "sum5";
    public static final String sum5_Field = "SUM5";
    public static final String sum5_QFielld = "ENFUELDISTRIBUTIONSHET.SUM5";
    public static final String sum6_Attr = "sum6";
    public static final String sum6_Field = "SUM6";
    public static final String sum6_QFielld = "ENFUELDISTRIBUTIONSHET.SUM6";
    public static final String sum7_Attr = "sum7";
    public static final String sum7_Field = "SUM7";
    public static final String sum7_QFielld = "ENFUELDISTRIBUTIONSHET.SUM7";
    public static final String sum1dec1_Attr = "sum1dec1";
    public static final String sum1dec1_Field = "SUM1DEC1";
    public static final String sum1dec1_QFielld = "ENFUELDISTRIBUTIONSHET.SUM1DEC1";
    public static final String sum2dec1_Attr = "sum2dec1";
    public static final String sum2dec1_Field = "SUM2DEC1";
    public static final String sum2dec1_QFielld = "ENFUELDISTRIBUTIONSHET.SUM2DEC1";
    public static final String sum3dec1_Attr = "sum3dec1";
    public static final String sum3dec1_Field = "SUM3DEC1";
    public static final String sum3dec1_QFielld = "ENFUELDISTRIBUTIONSHET.SUM3DEC1";
    public static final String sum4dec1_Attr = "sum4dec1";
    public static final String sum4dec1_Field = "SUM4DEC1";
    public static final String sum4dec1_QFielld = "ENFUELDISTRIBUTIONSHET.SUM4DEC1";
    public static final String sum5dec1_Attr = "sum5dec1";
    public static final String sum5dec1_Field = "SUM5DEC1";
    public static final String sum5dec1_QFielld = "ENFUELDISTRIBUTIONSHET.SUM5DEC1";
    public static final String sum6dec1_Attr = "sum6dec1";
    public static final String sum6dec1_Field = "SUM6DEC1";
    public static final String sum6dec1_QFielld = "ENFUELDISTRIBUTIONSHET.SUM6DEC1";
    public static final String sum7dec1_Attr = "sum7dec1";
    public static final String sum7dec1_Field = "SUM7DEC1";
    public static final String sum7dec1_QFielld = "ENFUELDISTRIBUTIONSHET.SUM7DEC1";
    public static final String sum1dec2_Attr = "sum1dec2";
    public static final String sum1dec2_Field = "SUM1DEC2";
    public static final String sum1dec2_QFielld = "ENFUELDISTRIBUTIONSHET.SUM1DEC2";
    public static final String sum2dec2_Attr = "sum2dec2";
    public static final String sum2dec2_Field = "SUM2DEC2";
    public static final String sum2dec2_QFielld = "ENFUELDISTRIBUTIONSHET.SUM2DEC2";
    public static final String sum3dec2_Attr = "sum3dec2";
    public static final String sum3dec2_Field = "SUM3DEC2";
    public static final String sum3dec2_QFielld = "ENFUELDISTRIBUTIONSHET.SUM3DEC2";
    public static final String sum4dec2_Attr = "sum4dec2";
    public static final String sum4dec2_Field = "SUM4DEC2";
    public static final String sum4dec2_QFielld = "ENFUELDISTRIBUTIONSHET.SUM4DEC2";
    public static final String sum5dec2_Attr = "sum5dec2";
    public static final String sum5dec2_Field = "SUM5DEC2";
    public static final String sum5dec2_QFielld = "ENFUELDISTRIBUTIONSHET.SUM5DEC2";
    public static final String sum6dec2_Attr = "sum6dec2";
    public static final String sum6dec2_Field = "SUM6DEC2";
    public static final String sum6dec2_QFielld = "ENFUELDISTRIBUTIONSHET.SUM6DEC2";
    public static final String sum7dec2_Attr = "sum7dec2";
    public static final String sum7dec2_Field = "SUM7DEC2";
    public static final String sum7dec2_QFielld = "ENFUELDISTRIBUTIONSHET.SUM7DEC2";
    public static final String sum1dec3_Attr = "sum1dec3";
    public static final String sum1dec3_Field = "SUM1DEC3";
    public static final String sum1dec3_QFielld = "ENFUELDISTRIBUTIONSHET.SUM1DEC3";
    public static final String sum2dec3_Attr = "sum2dec3";
    public static final String sum2dec3_Field = "SUM2DEC3";
    public static final String sum2dec3_QFielld = "ENFUELDISTRIBUTIONSHET.SUM2DEC3";
    public static final String sum3dec3_Attr = "sum3dec3";
    public static final String sum3dec3_Field = "SUM3DEC3";
    public static final String sum3dec3_QFielld = "ENFUELDISTRIBUTIONSHET.SUM3DEC3";
    public static final String sum4dec3_Attr = "sum4dec3";
    public static final String sum4dec3_Field = "SUM4DEC3";
    public static final String sum4dec3_QFielld = "ENFUELDISTRIBUTIONSHET.SUM4DEC3";
    public static final String sum5dec3_Attr = "sum5dec3";
    public static final String sum5dec3_Field = "SUM5DEC3";
    public static final String sum5dec3_QFielld = "ENFUELDISTRIBUTIONSHET.SUM5DEC3";
    public static final String sum6dec3_Attr = "sum6dec3";
    public static final String sum6dec3_Field = "SUM6DEC3";
    public static final String sum6dec3_QFielld = "ENFUELDISTRIBUTIONSHET.SUM6DEC3";
    public static final String sum7dec3_Attr = "sum7dec3";
    public static final String sum7dec3_Field = "SUM7DEC3";
    public static final String sum7dec3_QFielld = "ENFUELDISTRIBUTIONSHET.SUM7DEC3";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENFUELDISTRIBUTIONSHET.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENFUELDISTRIBUTIONSHET.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENFUELDISTRIBUTIONSHET.MODIFY_TIME";
    public static final String fuelTypeRef_Attr = "fuelTypeRef";
    public static final String fuelTypeRef_Field = "FUELTYPEREFCODE";
    public static final String  fuelTypeRef_QFielld = "ENFUELDISTRIBUTIONSHET.FUELTYPEREFCODE";


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

    public void setSum1(BigDecimal aValue){
       sum1 = aValue;
    }

    public BigDecimal getSum1(){
       return sum1;
    }

    public void setSum2(BigDecimal aValue){
       sum2 = aValue;
    }

    public BigDecimal getSum2(){
       return sum2;
    }

    public void setSum3(BigDecimal aValue){
       sum3 = aValue;
    }

    public BigDecimal getSum3(){
       return sum3;
    }

    public void setSum4(BigDecimal aValue){
       sum4 = aValue;
    }

    public BigDecimal getSum4(){
       return sum4;
    }

    public void setSum5(BigDecimal aValue){
       sum5 = aValue;
    }

    public BigDecimal getSum5(){
       return sum5;
    }

    public void setSum6(BigDecimal aValue){
       sum6 = aValue;
    }

    public BigDecimal getSum6(){
       return sum6;
    }

    public void setSum7(BigDecimal aValue){
       sum7 = aValue;
    }

    public BigDecimal getSum7(){
       return sum7;
    }

    public void setSum1dec1(BigDecimal aValue){
       sum1dec1 = aValue;
    }

    public BigDecimal getSum1dec1(){
       return sum1dec1;
    }

    public void setSum2dec1(BigDecimal aValue){
       sum2dec1 = aValue;
    }

    public BigDecimal getSum2dec1(){
       return sum2dec1;
    }

    public void setSum3dec1(BigDecimal aValue){
       sum3dec1 = aValue;
    }

    public BigDecimal getSum3dec1(){
       return sum3dec1;
    }

    public void setSum4dec1(BigDecimal aValue){
       sum4dec1 = aValue;
    }

    public BigDecimal getSum4dec1(){
       return sum4dec1;
    }

    public void setSum5dec1(BigDecimal aValue){
       sum5dec1 = aValue;
    }

    public BigDecimal getSum5dec1(){
       return sum5dec1;
    }

    public void setSum6dec1(BigDecimal aValue){
       sum6dec1 = aValue;
    }

    public BigDecimal getSum6dec1(){
       return sum6dec1;
    }

    public void setSum7dec1(BigDecimal aValue){
       sum7dec1 = aValue;
    }

    public BigDecimal getSum7dec1(){
       return sum7dec1;
    }

    public void setSum1dec2(BigDecimal aValue){
       sum1dec2 = aValue;
    }

    public BigDecimal getSum1dec2(){
       return sum1dec2;
    }

    public void setSum2dec2(BigDecimal aValue){
       sum2dec2 = aValue;
    }

    public BigDecimal getSum2dec2(){
       return sum2dec2;
    }

    public void setSum3dec2(BigDecimal aValue){
       sum3dec2 = aValue;
    }

    public BigDecimal getSum3dec2(){
       return sum3dec2;
    }

    public void setSum4dec2(BigDecimal aValue){
       sum4dec2 = aValue;
    }

    public BigDecimal getSum4dec2(){
       return sum4dec2;
    }

    public void setSum5dec2(BigDecimal aValue){
       sum5dec2 = aValue;
    }

    public BigDecimal getSum5dec2(){
       return sum5dec2;
    }

    public void setSum6dec2(BigDecimal aValue){
       sum6dec2 = aValue;
    }

    public BigDecimal getSum6dec2(){
       return sum6dec2;
    }

    public void setSum7dec2(BigDecimal aValue){
       sum7dec2 = aValue;
    }

    public BigDecimal getSum7dec2(){
       return sum7dec2;
    }

    public void setSum1dec3(BigDecimal aValue){
       sum1dec3 = aValue;
    }

    public BigDecimal getSum1dec3(){
       return sum1dec3;
    }

    public void setSum2dec3(BigDecimal aValue){
       sum2dec3 = aValue;
    }

    public BigDecimal getSum2dec3(){
       return sum2dec3;
    }

    public void setSum3dec3(BigDecimal aValue){
       sum3dec3 = aValue;
    }

    public BigDecimal getSum3dec3(){
       return sum3dec3;
    }

    public void setSum4dec3(BigDecimal aValue){
       sum4dec3 = aValue;
    }

    public BigDecimal getSum4dec3(){
       return sum4dec3;
    }

    public void setSum5dec3(BigDecimal aValue){
       sum5dec3 = aValue;
    }

    public BigDecimal getSum5dec3(){
       return sum5dec3;
    }

    public void setSum6dec3(BigDecimal aValue){
       sum6dec3 = aValue;
    }

    public BigDecimal getSum6dec3(){
       return sum6dec3;
    }

    public void setSum7dec3(BigDecimal aValue){
       sum7dec3 = aValue;
    }

    public BigDecimal getSum7dec3(){
       return sum7dec3;
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

} // end of ENFuelDistributionSheetValueObject

