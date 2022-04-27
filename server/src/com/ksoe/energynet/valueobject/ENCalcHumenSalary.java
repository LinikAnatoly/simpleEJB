
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENCalcHumenSalary;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENPlanWorkRef;
    import  com.ksoe.energynet.valueobject.references.ENPlanWork2ClassificationTypeRef;
    import  com.ksoe.techcard.valueobject.references.TKPositionRef;

public class ENCalcHumenSalary implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE; 
    public int  numberGen = Integer.MIN_VALUE; 
    public String  classificationTypeNumber; 
    public String  positionName; 
    public BigDecimal  timeGenMonth; 
    public BigDecimal  timeGen; 
    public BigDecimal  salaryMonth; 
    public BigDecimal  priceHour; 
    public BigDecimal  salaryHour; 
    public BigDecimal  salaryBonus; 
    public BigDecimal  salarySurcharge; 
    public BigDecimal  salaryPremium; 
    public BigDecimal  salaryAdditional; 
    public BigDecimal  salaryTotalBonus; 
    public BigDecimal  salaryTotal; 
 public BigDecimal  percentBonus; 
    public BigDecimal  percentSurcharge; 
    public BigDecimal  percentPremium; 
    public BigDecimal  percentAdditional; 
    public long  modify_time = Long.MIN_VALUE;
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public ENPlanWork2ClassificationTypeRef plan2CTypeRef = new ENPlanWork2ClassificationTypeRef();
    public TKPositionRef positionRef = new TKPositionRef();
    public static final String tableName = "ENCALCHUMENSALARY";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCALCHUMENSALARY.CODE";
    public static final String numberGen_Attr = "numberGen";
    public static final String numberGen_Field = "NUMBERGEN";
    public static final String numberGen_QFielld = "ENCALCHUMENSALARY.NUMBERGEN";
    public static final String classificationTypeNumber_Attr = "classificationTypeNumber";
    public static final String classificationTypeNumber_Field = "CLASSIFICATIONTYPENUMBER";
    public static final String classificationTypeNumber_QFielld = "ENCALCHUMENSALARY.CLASSIFICATIONTYPENMBR";
    public static final String positionName_Attr = "positionName";
    public static final String positionName_Field = "POSITIONNAME";
    public static final String positionName_QFielld = "ENCALCHUMENSALARY.POSITIONNAME";
    public static final String timeGenMonth_Attr = "timeGenMonth";
    public static final String timeGenMonth_Field = "TIMEGENMONTH";
    public static final String timeGenMonth_QFielld = "ENCALCHUMENSALARY.TIMEGENMONTH";
    public static final String timeGen_Attr = "timeGen";
    public static final String timeGen_Field = "TIMEGEN";
    public static final String timeGen_QFielld = "ENCALCHUMENSALARY.TIMEGEN";
    public static final String salaryMonth_Attr = "salaryMonth";
    public static final String salaryMonth_Field = "SALARYMONTH";
    public static final String salaryMonth_QFielld = "ENCALCHUMENSALARY.SALARYMONTH";
    public static final String priceHour_Attr = "priceHour";
    public static final String priceHour_Field = "PRICEHOUR";
    public static final String priceHour_QFielld = "ENCALCHUMENSALARY.PRICEHOUR";
    public static final String salaryHour_Attr = "salaryHour";
    public static final String salaryHour_Field = "SALARYHOUR";
    public static final String salaryHour_QFielld = "ENCALCHUMENSALARY.SALARYHOUR";
    public static final String salaryBonus_Attr = "salaryBonus";
    public static final String salaryBonus_Field = "SALARYBONUS";
    public static final String salaryBonus_QFielld = "ENCALCHUMENSALARY.SALARYBONUS";
    public static final String salarySurcharge_Attr = "salarySurcharge";
    public static final String salarySurcharge_Field = "SALARYSURCHARGE";
    public static final String salarySurcharge_QFielld = "ENCALCHUMENSALARY.SALARYSURCHARGE";
    public static final String salaryPremium_Attr = "salaryPremium";
    public static final String salaryPremium_Field = "SALARYPREMIUM";
    public static final String salaryPremium_QFielld = "ENCALCHUMENSALARY.SALARYPREMIUM";
    public static final String salaryAdditional_Attr = "salaryAdditional";
    public static final String salaryAdditional_Field = "SALARYADDITIONAL";
    public static final String salaryAdditional_QFielld = "ENCALCHUMENSALARY.SALARYADDITIONAL";
    public static final String salaryTotalBonus_Attr = "salaryTotalBonus";
    public static final String salaryTotalBonus_Field = "SALARYTOTALBONUS";
    public static final String salaryTotalBonus_QFielld = "ENCALCHUMENSALARY.SALARYTOTALBONUS";
    public static final String salaryTotal_Attr = "salaryTotal";
    public static final String salaryTotal_Field = "SALARYTOTAL";
    public static final String salaryTotal_QFielld = "ENCALCHUMENSALARY.SALARYTOTAL";
public static final String percentBonus_Attr = "percentBonus";
    public static final String percentBonus_Field = "PERCENTBONUS";
    public static final String percentBonus_QFielld = "ENCALCHUMENSALARY.PERCENTBONUS";
    public static final String percentSurcharge_Attr = "percentSurcharge";
    public static final String percentSurcharge_Field = "PERCENTSURCHARGE";
    public static final String percentSurcharge_QFielld = "ENCALCHUMENSALARY.PERCENTSURCHARGE";
    public static final String percentPremium_Attr = "percentPremium";
    public static final String percentPremium_Field = "PERCENTPREMIUM";
    public static final String percentPremium_QFielld = "ENCALCHUMENSALARY.PERCENTPREMIUM";
    public static final String percentAdditional_Attr = "percentAdditional";
    public static final String percentAdditional_Field = "PERCENTADDITIONAL";
    public static final String percentAdditional_QFielld = "ENCALCHUMENSALARY.PERCENTADDITIONAL";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENCALCHUMENSALARY.MODIFY_TIME";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENCALCHUMENSALARY.PLANREFCODE";
    public static final String plan2CTypeRef_Attr = "plan2CTypeRef";
    public static final String plan2CTypeRef_Field = "PLAN2CTYPEREFCODE";
    public static final String  plan2CTypeRef_QFielld = "ENCALCHUMENSALARY.PLAN2CTYPEREFCODE";
    public static final String positionRef_Attr = "positionRef";
    public static final String positionRef_Field = "POSITIONREFCODE";
    public static final String  positionRef_QFielld = "ENCALCHUMENSALARY.POSITIONREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setNumberGen(int aValue){
       numberGen = aValue;
    }

    public int getNumberGen(){
       return numberGen;
    }


    public void setClassificationTypeNumber(String aValue){
       classificationTypeNumber = aValue;
    }

    public String getClassificationTypeNumber(){
       return classificationTypeNumber;
    }


    public void setPositionName(String aValue){
       positionName = aValue;
    }

    public String getPositionName(){
       return positionName;
    }


    public void setTimeGenMonth(BigDecimal aValue){
       timeGenMonth = aValue;
    }

    public BigDecimal getTimeGenMonth(){
       return timeGenMonth;
    }


    public void setTimeGen(BigDecimal aValue){
       timeGen = aValue;
    }

    public BigDecimal getTimeGen(){
       return timeGen;
    }


    public void setSalaryMonth(BigDecimal aValue){
       salaryMonth = aValue;
    }

    public BigDecimal getSalaryMonth(){
       return salaryMonth;
    }


    public void setPriceHour(BigDecimal aValue){
       priceHour = aValue;
    }

    public BigDecimal getPriceHour(){
       return priceHour;
    }


    public void setSalaryHour(BigDecimal aValue){
       salaryHour = aValue;
    }

    public BigDecimal getSalaryHour(){
       return salaryHour;
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


 public void setPercentBonus(BigDecimal aValue){
       percentBonus = aValue;
    }

    public BigDecimal getPercentBonus(){
       return percentBonus;
    }


    public void setPercentSurcharge(BigDecimal aValue){
       percentSurcharge = aValue;
    }

    public BigDecimal getPercentSurcharge(){
       return percentSurcharge;
    }


    public void setPercentPremium(BigDecimal aValue){
       percentPremium = aValue;
    }

    public BigDecimal getPercentPremium(){
       return percentPremium;
    }


    public void setPercentAdditional(BigDecimal aValue){
       percentAdditional = aValue;
    }

    public BigDecimal getPercentAdditional(){
       return percentAdditional;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setPlanRef(ENPlanWorkRef aValue){
       planRef = aValue;
    }

    public ENPlanWorkRef getPlanRef(){
       return planRef;
    }
    public void setPlan2CTypeRef(ENPlanWork2ClassificationTypeRef aValue){
       plan2CTypeRef = aValue;
    }

    public ENPlanWork2ClassificationTypeRef getPlan2CTypeRef(){
       return plan2CTypeRef;
    }
    public void setPositionRef(TKPositionRef aValue){
       positionRef = aValue;
    }

    public TKPositionRef getPositionRef(){
       return positionRef;
    }

} // end of ENCalcHumenSalaryValueObject

