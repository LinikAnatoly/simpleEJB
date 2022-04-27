
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENServicesHumenSalary;  	
  */

import java.math.BigDecimal;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesCostRef;
    import  com.ksoe.techcard.valueobject.references.TKCalcHumenSalaryRef;

public class ENServicesHumenSalary implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE;
    public String  positionName; 
    public BigDecimal  salaryHour; 
    public BigDecimal  timeGen; 
    public BigDecimal  salary; 
    public BigDecimal  salaryBonus; 
    public BigDecimal  salarySurcharge; 
    public BigDecimal  salaryPremium; 
    public BigDecimal  salaryAdditional; 
    public BigDecimal  salaryTotalBonus; 
    public BigDecimal  salaryTotal; 
    public ENServicesCostRef servicesCostRef = new ENServicesCostRef();
    public TKCalcHumenSalaryRef calcHumenSalaryRef = new TKCalcHumenSalaryRef();
    public static final String tableName = "ENSERVICESHUMENSALARY";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSERVICESHUMENSALARY.CODE";
    public static final String timeGen_Attr = "timeGen";
    public static final String timeGen_Field = "TIMEGEN";
    public static final String timeGen_QFielld = "ENSERVICESHUMENSALARY.TIMEGEN";
    public static final String salary_Attr = "salary";
    public static final String salary_Field = "SALARY";
    public static final String salary_QFielld = "ENSERVICESHUMENSALARY.SALARY";
    public static final String salaryBonus_Attr = "salaryBonus";
    public static final String salaryBonus_Field = "SALARYBONUS";
    public static final String salaryBonus_QFielld = "ENSERVICESHUMENSALARY.SALARYBONUS";
    public static final String salarySurcharge_Attr = "salarySurcharge";
    public static final String salarySurcharge_Field = "SALARYSURCHARGE";
    public static final String salarySurcharge_QFielld = "ENSERVICESHUMENSALARY.SALARYSURCHARGE";
    public static final String salaryPremium_Attr = "salaryPremium";
    public static final String salaryPremium_Field = "SALARYPREMIUM";
    public static final String salaryPremium_QFielld = "ENSERVICESHUMENSALARY.SALARYPREMIUM";
    public static final String salaryAdditional_Attr = "salaryAdditional";
    public static final String salaryAdditional_Field = "SALARYADDITIONAL";
    public static final String salaryAdditional_QFielld = "ENSERVICESHUMENSALARY.SALARYADDITIONAL";
    public static final String salaryTotalBonus_Attr = "salaryTotalBonus";
    public static final String salaryTotalBonus_Field = "SALARYTOTALBONUS";
    public static final String salaryTotalBonus_QFielld = "ENSERVICESHUMENSALARY.SALARYTOTALBONUS";
    public static final String salaryTotal_Attr = "salaryTotal";
    public static final String salaryTotal_Field = "SALARYTOTAL";
    public static final String salaryTotal_QFielld = "ENSERVICESHUMENSALARY.SALARYTOTAL";
    public static final String servicesCostRef_Attr = "servicesCostRef";
    public static final String servicesCostRef_Field = "SERVICESCOSTREFCODE";
    public static final String  servicesCostRef_QFielld = "ENSERVICESHUMENSALARY.SERVICESCOSTREFCODE";
    public static final String calcHumenSalaryRef_Attr = "calcHumenSalaryRef";
    public static final String calcHumenSalaryRef_Field = "CALCHUMENSALARYREFCODE";
    public static final String  calcHumenSalaryRef_QFielld = "ENSERVICESHUMENSALARY.CALCHUMENSALARYREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    
    public void setPositionName(String aValue){
        positionName = aValue;
     }

     public String getPositionName(){
        return positionName;
     }
     
     public void setSalaryHour(BigDecimal aValue){
         salaryHour = aValue;
      }

      public BigDecimal getSalaryHour(){
         return salaryHour;
      }


    public void setTimeGen(BigDecimal aValue){
       timeGen = aValue;
    }

    public BigDecimal getTimeGen(){
       return timeGen;
    }


    public void setSalary(BigDecimal aValue){
       salary = aValue;
    }

    public BigDecimal getSalary(){
       return salary;
    }


    public void setSalaryBonus(BigDecimal aValue){
       salaryBonus = aValue;
    }

    public BigDecimal getSalaryBonus(){
       return salaryBonus;
    }


    public void setSalarySurcharge(BigDecimal aValue){
       salarySurcharge = aValue;
    }

    public BigDecimal getSalarySurcharge(){
       return salarySurcharge;
    }


    public void setSalaryPremium(BigDecimal aValue){
       salaryPremium = aValue;
    }

    public BigDecimal getSalaryPremium(){
       return salaryPremium;
    }


    public void setSalaryAdditional(BigDecimal aValue){
       salaryAdditional = aValue;
    }

    public BigDecimal getSalaryAdditional(){
       return salaryAdditional;
    }


    public void setSalaryTotalBonus(BigDecimal aValue){
       salaryTotalBonus = aValue;
    }

    public BigDecimal getSalaryTotalBonus(){
       return salaryTotalBonus;
    }


    public void setSalaryTotal(BigDecimal aValue){
       salaryTotal = aValue;
    }

    public BigDecimal getSalaryTotal(){
       return salaryTotal;
    }

    public void setServicesCostRef(ENServicesCostRef aValue){
       servicesCostRef = aValue;
    }

    public ENServicesCostRef getServicesCostRef(){
       return servicesCostRef;
    }
    public void setCalcHumenSalaryRef(TKCalcHumenSalaryRef aValue){
       calcHumenSalaryRef = aValue;
    }

    public TKCalcHumenSalaryRef getCalcHumenSalaryRef(){
       return calcHumenSalaryRef;
    }

} // end of ENServicesHumenSalaryValueObject

