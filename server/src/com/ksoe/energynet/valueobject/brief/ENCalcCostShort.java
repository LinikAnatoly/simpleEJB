
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENCalcCost;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENCalcCostShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal directExpenses;
    public BigDecimal salaryExpenses;
    public BigDecimal socialCharges;
    public BigDecimal productionExpenses;
    public BigDecimal totalExpenses;
    public BigDecimal normIncome;
    public BigDecimal calculationCost;
    public int planRefCode = Integer.MIN_VALUE;
    public Date planRefDateGen;
    public Date planRefDateStart;
    public Date planRefDateFinal;
    public int planRefYearGen = Integer.MIN_VALUE;
    public int planRefMonthGen = Integer.MIN_VALUE;
    public int planRefYearOriginal = Integer.MIN_VALUE;
    public int planRefMonthOriginal = Integer.MIN_VALUE;
    public String planRefUserGen;
    public Date planRefDateEdit;
    public String planRefWorkOrderNumber;
    public Date planRefDateWorkOrder;
    public String planRefPriConnectionNumber;
    public int plan2CTypeRefCode = Integer.MIN_VALUE;
    public BigDecimal plan2CTypeRefCountGen;
    public String plan2CTypeRefUserGen;
    public Date plan2CTypeRefDateEdit;

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


    public void setPlanRefCode(int aValue){
       planRefCode = aValue;
    }
    public int getPlanRefCode(){
       return planRefCode;
    }


    public void setPlanRefDateGen(Date aValue){
       planRefDateGen = aValue;
    }
    public Date getPlanRefDateGen(){
       return planRefDateGen;
    }


    public void setPlanRefDateStart(Date aValue){
       planRefDateStart = aValue;
    }
    public Date getPlanRefDateStart(){
       return planRefDateStart;
    }


    public void setPlanRefDateFinal(Date aValue){
       planRefDateFinal = aValue;
    }
    public Date getPlanRefDateFinal(){
       return planRefDateFinal;
    }

    public void setPlanRefYearGen(int aValue){
       planRefYearGen = aValue;
    }
    public int getPlanRefYearGen(){
       return planRefYearGen;
    }

    public void setPlanRefMonthGen(int aValue){
       planRefMonthGen = aValue;
    }
    public int getPlanRefMonthGen(){
       return planRefMonthGen;
    }

    public void setPlanRefYearOriginal(int aValue){
       planRefYearOriginal = aValue;
    }
    public int getPlanRefYearOriginal(){
       return planRefYearOriginal;
    }

    public void setPlanRefMonthOriginal(int aValue){
       planRefMonthOriginal = aValue;
    }
    public int getPlanRefMonthOriginal(){
       return planRefMonthOriginal;
    }

    public void setPlanRefUserGen(String aValue){
       planRefUserGen = aValue;
    }
    public String getPlanRefUserGen(){
       return planRefUserGen;
    }


    public void setPlanRefDateEdit(Date aValue){
       planRefDateEdit = aValue;
    }
    public Date getPlanRefDateEdit(){
       return planRefDateEdit;
    }

    public void setPlanRefWorkOrderNumber(String aValue){
       planRefWorkOrderNumber = aValue;
    }
    public String getPlanRefWorkOrderNumber(){
       return planRefWorkOrderNumber;
    }


    public void setPlanRefDateWorkOrder(Date aValue){
       planRefDateWorkOrder = aValue;
    }
    public Date getPlanRefDateWorkOrder(){
       return planRefDateWorkOrder;
    }

    public void setPlanRefPriConnectionNumber(String aValue){
       planRefPriConnectionNumber = aValue;
    }
    public String getPlanRefPriConnectionNumber(){
       return planRefPriConnectionNumber;
    }

    public void setPlan2CTypeRefCode(int aValue){
       plan2CTypeRefCode = aValue;
    }
    public int getPlan2CTypeRefCode(){
       return plan2CTypeRefCode;
    }

    public void setPlan2CTypeRefCountGen(BigDecimal aValue){
       plan2CTypeRefCountGen = aValue;
    }
    public BigDecimal getPlan2CTypeRefCountGen(){
       return plan2CTypeRefCountGen;
    }

    public void setPlan2CTypeRefUserGen(String aValue){
       plan2CTypeRefUserGen = aValue;
    }
    public String getPlan2CTypeRefUserGen(){
       return plan2CTypeRefUserGen;
    }


    public void setPlan2CTypeRefDateEdit(Date aValue){
       plan2CTypeRefDateEdit = aValue;
    }
    public Date getPlan2CTypeRefDateEdit(){
       return plan2CTypeRefDateEdit;
    }



}