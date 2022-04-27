
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPlanGraphFinancingFuelItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENDepartmentRef;
    import  com.ksoe.energynet.valueobject.references.ENPlanGraphFinancingFuelRef;

public class ENPlanGraphFinancingFuelItem implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  totalSum; 
    public BigDecimal  sumDekada1; 
    public BigDecimal  sumDekada2; 
    public BigDecimal  sumDekada3; 
    public BigDecimal  countFuelSpent; 
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public ENDepartmentRef departmentRef = new ENDepartmentRef();
    public ENPlanGraphFinancingFuelRef planGraphRef = new ENPlanGraphFinancingFuelRef();
    public static final String tableName = "ENPLANGRAPHFINNCNGFLTM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPLANGRAPHFINNCNGFLTM.CODE";
    public static final String totalSum_Attr = "totalSum";
    public static final String totalSum_Field = "TOTALSUM";
    public static final String totalSum_QFielld = "ENPLANGRAPHFINNCNGFLTM.TOTALSUM";
    public static final String sumDekada1_Attr = "sumDekada1";
    public static final String sumDekada1_Field = "SUMDEKADA1";
    public static final String sumDekada1_QFielld = "ENPLANGRAPHFINNCNGFLTM.SUMDEKADA1";
    public static final String sumDekada2_Attr = "sumDekada2";
    public static final String sumDekada2_Field = "SUMDEKADA2";
    public static final String sumDekada2_QFielld = "ENPLANGRAPHFINNCNGFLTM.SUMDEKADA2";
    public static final String sumDekada3_Attr = "sumDekada3";
    public static final String sumDekada3_Field = "SUMDEKADA3";
    public static final String sumDekada3_QFielld = "ENPLANGRAPHFINNCNGFLTM.SUMDEKADA3";
    public static final String countFuelSpent_Attr = "countFuelSpent";
    public static final String countFuelSpent_Field = "COUNTFUELSPENT";
    public static final String countFuelSpent_QFielld = "ENPLANGRAPHFINNCNGFLTM.COUNTFUELSPENT";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENPLANGRAPHFINNCNGFLTM.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENPLANGRAPHFINNCNGFLTM.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENPLANGRAPHFINNCNGFLTM.MODIFY_TIME";
    public static final String departmentRef_Attr = "departmentRef";
    public static final String departmentRef_Field = "DEPARTMENTREFCODE";
    public static final String  departmentRef_QFielld = "ENPLANGRAPHFINNCNGFLTM.DEPARTMENTREFCODE";
    public static final String planGraphRef_Attr = "planGraphRef";
    public static final String planGraphRef_Field = "PLANGRAPHREFCODE";
    public static final String  planGraphRef_QFielld = "ENPLANGRAPHFINNCNGFLTM.PLANGRAPHREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setTotalSum(BigDecimal aValue){
       totalSum = aValue;
    }

    public BigDecimal getTotalSum(){
       return totalSum;
    }

    public void setSumDekada1(BigDecimal aValue){
       sumDekada1 = aValue;
    }

    public BigDecimal getSumDekada1(){
       return sumDekada1;
    }

    public void setSumDekada2(BigDecimal aValue){
       sumDekada2 = aValue;
    }

    public BigDecimal getSumDekada2(){
       return sumDekada2;
    }

    public void setSumDekada3(BigDecimal aValue){
       sumDekada3 = aValue;
    }

    public BigDecimal getSumDekada3(){
       return sumDekada3;
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

    public void setDepartmentRef(ENDepartmentRef aValue){
       departmentRef = aValue;
    }

    public ENDepartmentRef getDepartmentRef(){
       return departmentRef;
    }
    public void setPlanGraphRef(ENPlanGraphFinancingFuelRef aValue){
       planGraphRef = aValue;
    }

    public ENPlanGraphFinancingFuelRef getPlanGraphRef(){
       return planGraphRef;
    }

} // end of ENPlanGraphFinancingFuelItemValueObject

