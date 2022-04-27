
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENServicesCost;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.io.Serializable;

    import  com.ksoe.techcard.valueobject.references.TKCalcCostRef;
    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;
    import  com.ksoe.energynet.valueobject.references.ENPlanWorkRef;

public class ENServicesCost implements Serializable {

private static final long serialVersionUID = 1L;

    public transient List<ENServicesMaterials> materials = null;
    public transient BigDecimal distance = null; 

    public int  code = Integer.MIN_VALUE;
    public Date dateGen ;
    public BigDecimal  countGen; 
    public BigDecimal  materialExpenses; 
    public BigDecimal  transportExpenses; 
    public BigDecimal  deliveryCost; 
    public BigDecimal  salaryExpenses; 
    public BigDecimal  socialCharges; 
    public BigDecimal  directExpenses; 
    public BigDecimal  productionExpenses; 
    public BigDecimal  totalExpenses; 
    public BigDecimal  normIncome; 
    public BigDecimal  calculationCost; 
    public BigDecimal  costWithoutVAT; 
    public BigDecimal  costVAT; 
    public BigDecimal  costWithVAT; 
    public TKCalcCostRef tkCalcCostRef = new TKCalcCostRef();
    public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public static final String tableName = "ENSERVICESCOST";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSERVICESCOST.CODE";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENSERVICESCOST.DATEGEN";
    public static final String countGen_Attr = "countGen";
    public static final String countGen_Field = "COUNTGEN";
    public static final String countGen_QFielld = "ENSERVICESCOST.COUNTGEN";
    public static final String materialExpenses_Attr = "materialExpenses";
    public static final String materialExpenses_Field = "MATERIALEXPENSES";
    public static final String materialExpenses_QFielld = "ENSERVICESCOST.MATERIALEXPENSES";
    public static final String transportExpenses_Attr = "transportExpenses";
    public static final String transportExpenses_Field = "TRANSPORTEXPENSES";
    public static final String transportExpenses_QFielld = "ENSERVICESCOST.TRANSPORTEXPENSES";
    public static final String deliveryCost_Attr = "deliveryCost";
    public static final String deliveryCost_Field = "DELIVERYCOST";
    public static final String deliveryCost_QFielld = "ENSERVICESCOST.DELIVERYCOST";
    public static final String salaryExpenses_Attr = "salaryExpenses";
    public static final String salaryExpenses_Field = "SALARYEXPENSES";
    public static final String salaryExpenses_QFielld = "ENSERVICESCOST.SALARYEXPENSES";
    public static final String socialCharges_Attr = "socialCharges";
    public static final String socialCharges_Field = "SOCIALCHARGES";
    public static final String socialCharges_QFielld = "ENSERVICESCOST.SOCIALCHARGES";
    public static final String directExpenses_Attr = "directExpenses";
    public static final String directExpenses_Field = "DIRECTEXPENSES";
    public static final String directExpenses_QFielld = "ENSERVICESCOST.DIRECTEXPENSES";
    public static final String productionExpenses_Attr = "productionExpenses";
    public static final String productionExpenses_Field = "PRODUCTIONEXPENSES";
    public static final String productionExpenses_QFielld = "ENSERVICESCOST.PRODUCTIONEXPENSES";
    public static final String totalExpenses_Attr = "totalExpenses";
    public static final String totalExpenses_Field = "TOTALEXPENSES";
    public static final String totalExpenses_QFielld = "ENSERVICESCOST.TOTALEXPENSES";
    public static final String normIncome_Attr = "normIncome";
    public static final String normIncome_Field = "NORMINCOME";
    public static final String normIncome_QFielld = "ENSERVICESCOST.NORMINCOME";
    public static final String calculationCost_Attr = "calculationCost";
    public static final String calculationCost_Field = "CALCULATIONCOST";
    public static final String calculationCost_QFielld = "ENSERVICESCOST.CALCULATIONCOST";
    public static final String costWithoutVAT_Attr = "costWithoutVAT";
    public static final String costWithoutVAT_Field = "COSTWITHOUTVAT";
    public static final String costWithoutVAT_QFielld = "ENSERVICESCOST.COSTWITHOUTVAT";
    public static final String costVAT_Attr = "costVAT";
    public static final String costVAT_Field = "COSTVAT";
    public static final String costVAT_QFielld = "ENSERVICESCOST.COSTVAT";
    public static final String costWithVAT_Attr = "costWithVAT";
    public static final String costWithVAT_Field = "COSTWITHVAT";
    public static final String costWithVAT_QFielld = "ENSERVICESCOST.COSTWITHVAT";
    public static final String tkCalcCostRef_Attr = "tkCalcCostRef";
    public static final String tkCalcCostRef_Field = "TKCALCCOSTREFCODE";
    public static final String  tkCalcCostRef_QFielld = "ENSERVICESCOST.TKCALCCOSTREFCODE";
    public static final String servicesObjectRef_Attr = "servicesObjectRef";
    public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
    public static final String  servicesObjectRef_QFielld = "ENSERVICESCOST.SERVICESOBJECTREFCODE";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENSERVICESCOST.PLANREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setDateGen(Date aValue){
       dateGen = aValue;
    }

    public Date getDateGen(){
       return dateGen;
    }


    public void setCountGen(BigDecimal aValue){
       countGen = aValue;
    }

    public BigDecimal getCountGen(){
       return countGen;
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


    public void setDirectExpenses(BigDecimal aValue){
       directExpenses = aValue;
    }

    public BigDecimal getDirectExpenses(){
       return directExpenses;
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


    public void setCostWithVAT(BigDecimal aValue){
       costWithVAT = aValue;
    }

    public BigDecimal getCostWithVAT(){
       return costWithVAT;
    }

    public void setTkCalcCostRef(TKCalcCostRef aValue){
       tkCalcCostRef = aValue;
    }

    public TKCalcCostRef getTkCalcCostRef(){
       return tkCalcCostRef;
    }
    public void setServicesObjectRef(ENServicesObjectRef aValue){
       servicesObjectRef = aValue;
    }

    public ENServicesObjectRef getServicesObjectRef(){
       return servicesObjectRef;
    }
    public void setPlanRef(ENPlanWorkRef aValue){
       planRef = aValue;
    }

    public ENPlanWorkRef getPlanRef(){
       return planRef;
    }
    
    public static void checkENServicesCostOnNull(ENServicesCost servicesCost) {
    	if(servicesCost == null || servicesCost.code == Integer.MIN_VALUE) {
    		throw new java.lang.NullPointerException();
    	}
    }

} // end of ENServicesCostValueObject

