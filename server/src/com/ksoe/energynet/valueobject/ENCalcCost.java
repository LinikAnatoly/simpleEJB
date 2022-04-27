
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENCalcCost;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.references.ENPlanWork2ClassificationTypeRef;
import com.ksoe.energynet.valueobject.references.ENPlanWorkRef;

public class ENCalcCost implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  directExpenses; 
    public BigDecimal  salaryExpenses; 
    public BigDecimal  socialCharges; 
    public BigDecimal  productionExpenses; 
    public BigDecimal  totalExpenses; 
    public BigDecimal  normIncome; 
    public BigDecimal  calculationCost; 
    public long  modify_time = Long.MIN_VALUE;
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public ENPlanWork2ClassificationTypeRef plan2CTypeRef = new ENPlanWork2ClassificationTypeRef();
    public static final String tableName = "ENCALCCOST";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCALCCOST.CODE";
    public static final String directExpenses_Attr = "directExpenses";
    public static final String directExpenses_Field = "DIRECTEXPENSES";
    public static final String directExpenses_QFielld = "ENCALCCOST.DIRECTEXPENSES";
    public static final String salaryExpenses_Attr = "salaryExpenses";
    public static final String salaryExpenses_Field = "SALARYEXPENSES";
    public static final String salaryExpenses_QFielld = "ENCALCCOST.SALARYEXPENSES";
    public static final String socialCharges_Attr = "socialCharges";
    public static final String socialCharges_Field = "SOCIALCHARGES";
    public static final String socialCharges_QFielld = "ENCALCCOST.SOCIALCHARGES";
    public static final String productionExpenses_Attr = "productionExpenses";
    public static final String productionExpenses_Field = "PRODUCTIONEXPENSES";
    public static final String productionExpenses_QFielld = "ENCALCCOST.PRODUCTIONEXPENSES";
    public static final String totalExpenses_Attr = "totalExpenses";
    public static final String totalExpenses_Field = "TOTALEXPENSES";
    public static final String totalExpenses_QFielld = "ENCALCCOST.TOTALEXPENSES";
    public static final String normIncome_Attr = "normIncome";
    public static final String normIncome_Field = "NORMINCOME";
    public static final String normIncome_QFielld = "ENCALCCOST.NORMINCOME";
    public static final String calculationCost_Attr = "calculationCost";
    public static final String calculationCost_Field = "CALCULATIONCOST";
    public static final String calculationCost_QFielld = "ENCALCCOST.CALCULATIONCOST";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENCALCCOST.MODIFY_TIME";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENCALCCOST.PLANREFCODE";
    public static final String plan2CTypeRef_Attr = "plan2CTypeRef";
    public static final String plan2CTypeRef_Field = "PLAN2CTYPEREFCODE";
    public static final String  plan2CTypeRef_QFielld = "ENCALCCOST.PLAN2CTYPEREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setDirectExpenses(BigDecimal aValue){
       directExpenses = aValue;
    }

    public BigDecimal getDirectExpenses(){
       return directExpenses;
    }

    public void setSalaryExpenses(BigDecimal aValue){
       salaryExpenses = aValue;
    }

    public BigDecimal getSalaryExpenses(){
       return salaryExpenses;
    }

    public void setSocialCharges(BigDecimal aValue){
       socialCharges = aValue;
    }

    public BigDecimal getSocialCharges(){
       return socialCharges;
    }

    public void setProductionExpenses(BigDecimal aValue){
       productionExpenses = aValue;
    }

    public BigDecimal getProductionExpenses(){
       return productionExpenses;
    }

    public void setTotalExpenses(BigDecimal aValue){
       totalExpenses = aValue;
    }

    public BigDecimal getTotalExpenses(){
       return totalExpenses;
    }

    public void setNormIncome(BigDecimal aValue){
       normIncome = aValue;
    }

    public BigDecimal getNormIncome(){
       return normIncome;
    }

    public void setCalculationCost(BigDecimal aValue){
       calculationCost = aValue;
    }

    public BigDecimal getCalculationCost(){
       return calculationCost;
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

} // end of ENCalcCostValueObject

