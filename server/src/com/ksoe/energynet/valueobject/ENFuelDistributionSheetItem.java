
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENFuelDistributionSheetItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENDepartmentRef;
    import  com.ksoe.energynet.valueobject.references.ENFuelDistributionSheetRef;

public class ENFuelDistributionSheetItem implements Serializable {

	public static final int CONFIRMED = 1;
	public static final int NOT_CONFIRMED = 0;
	
    public int  code = Integer.MIN_VALUE; 
    public int  decadeNumber = Integer.MIN_VALUE; 
    public BigDecimal  countGen; 
    public BigDecimal  count1; 
    public BigDecimal  count2; 
    public BigDecimal  count3; 
    public BigDecimal  count4; 
    public BigDecimal  count5; 
    public BigDecimal  count6; 
    public BigDecimal  count7; 
    public int  isConfirmed = Integer.MIN_VALUE; 
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public ENDepartmentRef departmentRef = new ENDepartmentRef();
    public ENFuelDistributionSheetRef fuelDistributionRef = new ENFuelDistributionSheetRef();
    public static final String tableName = "ENFUELDISTRIBUTINSHTTM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENFUELDISTRIBUTINSHTTM.CODE";
    public static final String decadeNumber_Attr = "decadeNumber";
    public static final String decadeNumber_Field = "DECADENUMBER";
    public static final String decadeNumber_QFielld = "ENFUELDISTRIBUTINSHTTM.DECADENUMBER";
    public static final String countGen_Attr = "countGen";
    public static final String countGen_Field = "COUNTGEN";
    public static final String countGen_QFielld = "ENFUELDISTRIBUTINSHTTM.COUNTGEN";
    public static final String count1_Attr = "count1";
    public static final String count1_Field = "COUNT1";
    public static final String count1_QFielld = "ENFUELDISTRIBUTINSHTTM.COUNT1";
    public static final String count2_Attr = "count2";
    public static final String count2_Field = "COUNT2";
    public static final String count2_QFielld = "ENFUELDISTRIBUTINSHTTM.COUNT2";
    public static final String count3_Attr = "count3";
    public static final String count3_Field = "COUNT3";
    public static final String count3_QFielld = "ENFUELDISTRIBUTINSHTTM.COUNT3";
    public static final String count4_Attr = "count4";
    public static final String count4_Field = "COUNT4";
    public static final String count4_QFielld = "ENFUELDISTRIBUTINSHTTM.COUNT4";
    public static final String count5_Attr = "count5";
    public static final String count5_Field = "COUNT5";
    public static final String count5_QFielld = "ENFUELDISTRIBUTINSHTTM.COUNT5";
    public static final String count6_Attr = "count6";
    public static final String count6_Field = "COUNT6";
    public static final String count6_QFielld = "ENFUELDISTRIBUTINSHTTM.COUNT6";
    public static final String count7_Attr = "count7";
    public static final String count7_Field = "COUNT7";
    public static final String count7_QFielld = "ENFUELDISTRIBUTINSHTTM.COUNT7";
    public static final String isConfirmed_Attr = "isConfirmed";
    public static final String isConfirmed_Field = "ISCONFIRMED";
    public static final String isConfirmed_QFielld = "ENFUELDISTRIBUTINSHTTM.ISCONFIRMED";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENFUELDISTRIBUTINSHTTM.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENFUELDISTRIBUTINSHTTM.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENFUELDISTRIBUTINSHTTM.MODIFY_TIME";
    public static final String departmentRef_Attr = "departmentRef";
    public static final String departmentRef_Field = "DEPARTMENTREFCODE";
    public static final String  departmentRef_QFielld = "ENFUELDISTRIBUTINSHTTM.DEPARTMENTREFCODE";
    public static final String fuelDistributionRef_Attr = "fuelDistributionRef";
    public static final String fuelDistributionRef_Field = "FUELDISTRIBUTIONREFCOD";
    public static final String  fuelDistributionRef_QFielld = "ENFUELDISTRIBUTINSHTTM.FUELDISTRIBUTIONREFCOD";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setDecadeNumber(int aValue){
       decadeNumber = aValue;
    }

    public int getDecadeNumber(){
       return decadeNumber;
    }

    public void setCountGen(BigDecimal aValue){
       countGen = aValue;
    }

    public BigDecimal getCountGen(){
       return countGen;
    }

    public void setCount1(BigDecimal aValue){
       count1 = aValue;
    }

    public BigDecimal getCount1(){
       return count1;
    }

    public void setCount2(BigDecimal aValue){
       count2 = aValue;
    }

    public BigDecimal getCount2(){
       return count2;
    }

    public void setCount3(BigDecimal aValue){
       count3 = aValue;
    }

    public BigDecimal getCount3(){
       return count3;
    }

    public void setCount4(BigDecimal aValue){
       count4 = aValue;
    }

    public BigDecimal getCount4(){
       return count4;
    }

    public void setCount5(BigDecimal aValue){
       count5 = aValue;
    }

    public BigDecimal getCount5(){
       return count5;
    }

    public void setCount6(BigDecimal aValue){
       count6 = aValue;
    }

    public BigDecimal getCount6(){
       return count6;
    }

    public void setCount7(BigDecimal aValue){
       count7 = aValue;
    }

    public BigDecimal getCount7(){
       return count7;
    }

    public void setIsConfirmed(int aValue){
       isConfirmed = aValue;
    }

    public int getIsConfirmed(){
       return isConfirmed;
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

    public void setDepartmentRef(ENDepartmentRef aValue){
       departmentRef = aValue;
    }

    public ENDepartmentRef getDepartmentRef(){
       return departmentRef;
    }
    public void setFuelDistributionRef(ENFuelDistributionSheetRef aValue){
       fuelDistributionRef = aValue;
    }

    public ENFuelDistributionSheetRef getFuelDistributionRef(){
       return fuelDistributionRef;
    }

} // end of ENFuelDistributionSheetItemValueObject

