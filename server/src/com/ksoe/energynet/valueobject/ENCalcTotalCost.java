
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENCalcTotalCost;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENPlanWorkRef;
    import  com.ksoe.energynet.valueobject.references.ENPlanWork2ClassificationTypeRef;

public class ENCalcTotalCost implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  calculationCost; 
    public BigDecimal  materialExpenses; 
    public BigDecimal  transportExpenses; 
    public BigDecimal  deliveryCost; 
    public BigDecimal  costWithoutVAT; 
    public BigDecimal  costVAT; 
    public BigDecimal  totalCost; 
    public BigDecimal  limitedSum; 
    public long  modify_time = Long.MIN_VALUE;
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public ENPlanWork2ClassificationTypeRef plan2CTypeRef = new ENPlanWork2ClassificationTypeRef();
    public static final String tableName = "ENCALCTOTALCOST";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCALCTOTALCOST.CODE";
    public static final String calculationCost_Attr = "calculationCost";
    public static final String calculationCost_Field = "CALCULATIONCOST";
    public static final String calculationCost_QFielld = "ENCALCTOTALCOST.CALCULATIONCOST";
    public static final String materialExpenses_Attr = "materialExpenses";
    public static final String materialExpenses_Field = "MATERIALEXPENSES";
    public static final String materialExpenses_QFielld = "ENCALCTOTALCOST.MATERIALEXPENSES";
    public static final String transportExpenses_Attr = "transportExpenses";
    public static final String transportExpenses_Field = "TRANSPORTEXPENSES";
    public static final String transportExpenses_QFielld = "ENCALCTOTALCOST.TRANSPORTEXPENSES";
    public static final String deliveryCost_Attr = "deliveryCost";
    public static final String deliveryCost_Field = "DELIVERYCOST";
    public static final String deliveryCost_QFielld = "ENCALCTOTALCOST.DELIVERYCOST";
    public static final String costWithoutVAT_Attr = "costWithoutVAT";
    public static final String costWithoutVAT_Field = "COSTWITHOUTVAT";
    public static final String costWithoutVAT_QFielld = "ENCALCTOTALCOST.COSTWITHOUTVAT";
    public static final String costVAT_Attr = "costVAT";
    public static final String costVAT_Field = "COSTVAT";
    public static final String costVAT_QFielld = "ENCALCTOTALCOST.COSTVAT";
    public static final String totalCost_Attr = "totalCost";
    public static final String totalCost_Field = "TOTALCOST";
    public static final String totalCost_QFielld = "ENCALCTOTALCOST.TOTALCOST";
    public static final String limitedSum_Attr = "limitedSum";
    public static final String limitedSum_Field = "LIMITEDSUM";
    public static final String limitedSum_QFielld = "ENCALCTOTALCOST.LIMITEDSUM";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENCALCTOTALCOST.MODIFY_TIME";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENCALCTOTALCOST.PLANREFCODE";
    public static final String plan2CTypeRef_Attr = "plan2CTypeRef";
    public static final String plan2CTypeRef_Field = "PLAN2CTYPEREFCODE";
    public static final String  plan2CTypeRef_QFielld = "ENCALCTOTALCOST.PLAN2CTYPEREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setCalculationCost(BigDecimal aValue){
       calculationCost = aValue;
    }

    public BigDecimal getCalculationCost(){
       return calculationCost;
    }


    public void setMaterialExpenses(BigDecimal aValue){
       materialExpenses = aValue;
    }

    public BigDecimal getMaterialExpenses(){
       return materialExpenses;
    }


    public void setTransportExpenses(BigDecimal aValue){
       transportExpenses = aValue;
    }

    public BigDecimal getTransportExpenses(){
       return transportExpenses;
    }


    public void setDeliveryCost(BigDecimal aValue){
       deliveryCost = aValue;
    }

    public BigDecimal getDeliveryCost(){
       return deliveryCost;
    }


    public void setCostWithoutVAT(BigDecimal aValue){
       costWithoutVAT = aValue;
    }

    public BigDecimal getCostWithoutVAT(){
       return costWithoutVAT;
    }


    public void setCostVAT(BigDecimal aValue){
       costVAT = aValue;
    }

    public BigDecimal getCostVAT(){
       return costVAT;
    }


    public void setTotalCost(BigDecimal aValue){
       totalCost = aValue;
    }

    public BigDecimal getTotalCost(){
       return totalCost;
    }


    public void setLimitedSum(BigDecimal aValue){
       limitedSum = aValue;
    }

    public BigDecimal getLimitedSum(){
       return limitedSum;
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

} // end of ENCalcTotalCostValueObject

