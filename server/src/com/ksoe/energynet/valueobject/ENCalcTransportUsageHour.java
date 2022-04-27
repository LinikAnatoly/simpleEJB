
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENCalcTransportUsageHour;  	
  */

import java.math.BigDecimal;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENPlanWorkRef;
    import  com.ksoe.techcard.valueobject.references.TKTransportRef;

public class ENCalcTransportUsageHour implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE;
    public BigDecimal  salaryMonthDriver; 
    public BigDecimal  normWorkTimeMonth; 
    public BigDecimal  salaryHourDriver; 
    public BigDecimal  salaryChargeHourDriver; 
    public BigDecimal  salaryTotalHourDriver; 
    public BigDecimal  costMachine; 
    public BigDecimal  amortizationYearMachine; 
    public BigDecimal  amortizationHourMachine; 
    public BigDecimal  fuelExpensesMachine; 
    public BigDecimal  annualRepairCostsPercent; 
    public BigDecimal  annualRepairCosts; 
    public BigDecimal  repairCostsPerHour; 
    public BigDecimal  costTotalHourMachine; 
    public BigDecimal  productionCosts; 
    public BigDecimal  administrativeCosts; 
    public BigDecimal  profitRate; 
    public BigDecimal  costPerKilometer; 
    public String  commentPerKilometer; 
    public long  modify_time = Long.MIN_VALUE;
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public TKTransportRef tkTransportRef = new TKTransportRef();
    public static final String tableName = "ENCALCTRANSPORTUSAGEHR";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCALCTRANSPORTUSAGEHR.CODE";
    public static final String salaryMonthDriver_Attr = "salaryMonthDriver";
    public static final String salaryMonthDriver_Field = "SALARYMONTHDRIVER";
    public static final String salaryMonthDriver_QFielld = "ENCALCTRANSPORTUSAGEHR.SALARYMONTHDRIVER";
    public static final String normWorkTimeMonth_Attr = "normWorkTimeMonth";
    public static final String normWorkTimeMonth_Field = "NORMWORKTIMEMONTH";
    public static final String normWorkTimeMonth_QFielld = "ENCALCTRANSPORTUSAGEHR.NORMWORKTIMEMONTH";
    public static final String salaryHourDriver_Attr = "salaryHourDriver";
    public static final String salaryHourDriver_Field = "SALARYHOURDRIVER";
    public static final String salaryHourDriver_QFielld = "ENCALCTRANSPORTUSAGEHR.SALARYHOURDRIVER";
    public static final String salaryChargeHourDriver_Attr = "salaryChargeHourDriver";
    public static final String salaryChargeHourDriver_Field = "SALARYCHARGEHOURDRIVER";
    public static final String salaryChargeHourDriver_QFielld = "ENCALCTRANSPORTUSAGEHR.SALARYCHARGEHOURDRIVER";
    public static final String salaryTotalHourDriver_Attr = "salaryTotalHourDriver";
    public static final String salaryTotalHourDriver_Field = "SALARYTOTALHOURDRIVER";
    public static final String salaryTotalHourDriver_QFielld = "ENCALCTRANSPORTUSAGEHR.SALARYTOTALHOURDRIVER";
    public static final String costMachine_Attr = "costMachine";
    public static final String costMachine_Field = "COSTMACHINE";
    public static final String costMachine_QFielld = "ENCALCTRANSPORTUSAGEHR.COSTMACHINE";
    public static final String amortizationYearMachine_Attr = "amortizationYearMachine";
    public static final String amortizationYearMachine_Field = "AMORTIZATIONYEARMACHINE";
    public static final String amortizationYearMachine_QFielld = "ENCALCTRANSPORTUSAGEHR.AMORTIZATIONYEARMACHIN";
    public static final String amortizationHourMachine_Attr = "amortizationHourMachine";
    public static final String amortizationHourMachine_Field = "AMORTIZATIONHOURMACHINE";
    public static final String amortizationHourMachine_QFielld = "ENCALCTRANSPORTUSAGEHR.AMORTIZATIONHOURMACHIN";
    public static final String fuelExpensesMachine_Attr = "fuelExpensesMachine";
    public static final String fuelExpensesMachine_Field = "FUELEXPENSESMACHINE";
    public static final String fuelExpensesMachine_QFielld = "ENCALCTRANSPORTUSAGEHR.FUELEXPENSESMACHINE";
    public static final String annualRepairCostsPercent_Attr = "annualRepairCostsPercent";
    public static final String annualRepairCostsPercent_Field = "ANNUALREPAIRCOSTSPERCENT";
    public static final String annualRepairCostsPercent_QFielld = "ENCALCTRANSPORTUSAGEHR.ANNUALREPAIRCOSTSPRCNT";
    public static final String annualRepairCosts_Attr = "annualRepairCosts";
    public static final String annualRepairCosts_Field = "ANNUALREPAIRCOSTS";
    public static final String annualRepairCosts_QFielld = "ENCALCTRANSPORTUSAGEHR.ANNUALREPAIRCOSTS";
    public static final String repairCostsPerHour_Attr = "repairCostsPerHour";
    public static final String repairCostsPerHour_Field = "REPAIRCOSTSPERHOUR";
    public static final String repairCostsPerHour_QFielld = "ENCALCTRANSPORTUSAGEHR.REPAIRCOSTSPERHOUR";
    public static final String costTotalHourMachine_Attr = "costTotalHourMachine";
    public static final String costTotalHourMachine_Field = "COSTTOTALHOURMACHINE";
    public static final String costTotalHourMachine_QFielld = "ENCALCTRANSPORTUSAGEHR.COSTTOTALHOURMACHINE";
    public static final String productionCosts_Attr = "productionCosts";
    public static final String productionCosts_Field = "PRODUCTIONCOSTS";
    public static final String productionCosts_QFielld = "ENCALCTRANSPORTUSAGEHR.PRODUCTIONCOSTS";
    public static final String administrativeCosts_Attr = "administrativeCosts";
    public static final String administrativeCosts_Field = "ADMINISTRATIVECOSTS";
    public static final String administrativeCosts_QFielld = "ENCALCTRANSPORTUSAGEHR.ADMINISTRATIVECOSTS";
    public static final String profitRate_Attr = "profitRate";
    public static final String profitRate_Field = "PROFITRATE";
    public static final String profitRate_QFielld = "ENCALCTRANSPORTUSAGEHR.PROFITRATE";
    public static final String costPerKilometer_Attr = "costPerKilometer";
    public static final String costPerKilometer_Field = "COSTPERKILOMETER";
    public static final String costPerKilometer_QFielld = "ENCALCTRANSPORTUSAGEHR.COSTPERKILOMETER";
    public static final String commentPerKilometer_Attr = "commentPerKilometer";
    public static final String commentPerKilometer_Field = "COMMENTPERKILOMETER";
    public static final String commentPerKilometer_QFielld = "ENCALCTRANSPORTUSAGEHR.COMMENTPERKILOMETER";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENCALCTRANSPORTUSAGEHR.MODIFY_TIME";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENCALCTRANSPORTUSAGEHR.PLANREFCODE";
    public static final String tkTransportRef_Attr = "tkTransportRef";
    public static final String tkTransportRef_Field = "TKTRANSPORTREFCODE";
    public static final String  tkTransportRef_QFielld = "ENCALCTRANSPORTUSAGEHR.TKTRANSPORTREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setSalaryMonthDriver(BigDecimal aValue){
       salaryMonthDriver = aValue;
    }

    public BigDecimal getSalaryMonthDriver(){
       return salaryMonthDriver;
    }


    public void setNormWorkTimeMonth(BigDecimal aValue){
       normWorkTimeMonth = aValue;
    }

    public BigDecimal getNormWorkTimeMonth(){
       return normWorkTimeMonth;
    }


    public void setSalaryHourDriver(BigDecimal aValue){
       salaryHourDriver = aValue;
    }

    public BigDecimal getSalaryHourDriver(){
       return salaryHourDriver;
    }


    public void setSalaryChargeHourDriver(BigDecimal aValue){
       salaryChargeHourDriver = aValue;
    }

    public BigDecimal getSalaryChargeHourDriver(){
       return salaryChargeHourDriver;
    }


    public void setSalaryTotalHourDriver(BigDecimal aValue){
       salaryTotalHourDriver = aValue;
    }

    public BigDecimal getSalaryTotalHourDriver(){
       return salaryTotalHourDriver;
    }


    public void setCostMachine(BigDecimal aValue){
       costMachine = aValue;
    }

    public BigDecimal getCostMachine(){
       return costMachine;
    }


    public void setAmortizationYearMachine(BigDecimal aValue){
       amortizationYearMachine = aValue;
    }

    public BigDecimal getAmortizationYearMachine(){
       return amortizationYearMachine;
    }


    public void setAmortizationHourMachine(BigDecimal aValue){
       amortizationHourMachine = aValue;
    }

    public BigDecimal getAmortizationHourMachine(){
       return amortizationHourMachine;
    }


    public void setFuelExpensesMachine(BigDecimal aValue){
       fuelExpensesMachine = aValue;
    }

    public BigDecimal getFuelExpensesMachine(){
       return fuelExpensesMachine;
    }


    public void setAnnualRepairCostsPercent(BigDecimal aValue){
       annualRepairCostsPercent = aValue;
    }

    public BigDecimal getAnnualRepairCostsPercent(){
       return annualRepairCostsPercent;
    }


    public void setAnnualRepairCosts(BigDecimal aValue){
       annualRepairCosts = aValue;
    }

    public BigDecimal getAnnualRepairCosts(){
       return annualRepairCosts;
    }


    public void setRepairCostsPerHour(BigDecimal aValue){
       repairCostsPerHour = aValue;
    }

    public BigDecimal getRepairCostsPerHour(){
       return repairCostsPerHour;
    }


    public void setCostTotalHourMachine(BigDecimal aValue){
       costTotalHourMachine = aValue;
    }

    public BigDecimal getCostTotalHourMachine(){
       return costTotalHourMachine;
    }


    public void setProductionCosts(BigDecimal aValue){
       productionCosts = aValue;
    }

    public BigDecimal getProductionCosts(){
       return productionCosts;
    }


    public void setAdministrativeCosts(BigDecimal aValue){
       administrativeCosts = aValue;
    }

    public BigDecimal getAdministrativeCosts(){
       return administrativeCosts;
    }


    public void setProfitRate(BigDecimal aValue){
       profitRate = aValue;
    }

    public BigDecimal getProfitRate(){
       return profitRate;
    }


    public void setCostPerKilometer(BigDecimal aValue){
       costPerKilometer = aValue;
    }

    public BigDecimal getCostPerKilometer(){
       return costPerKilometer;
    }


    public void setCommentPerKilometer(String aValue){
       commentPerKilometer = aValue;
    }

    public String getCommentPerKilometer(){
       return commentPerKilometer;
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
    public void setTkTransportRef(TKTransportRef aValue){
       tkTransportRef = aValue;
    }

    public TKTransportRef getTkTransportRef(){
       return tkTransportRef;
    }

} // end of ENCalcTransportUsageHourValueObject

