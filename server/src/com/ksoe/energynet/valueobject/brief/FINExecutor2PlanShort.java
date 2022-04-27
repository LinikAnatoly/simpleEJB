
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for FINExecutor2Plan;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class FINExecutor2PlanShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal percentLoad;
    public Date dateStart ;
    public Date dateFinal ;
    public BigDecimal totalTimeHours;
    public BigDecimal totalTimeDays;
    public BigDecimal totalTimeManHours;
    public BigDecimal deliveryTime;
    public String userGen;
    public Date dateEdit ;
    public int finExecutorTypeRefCode = Integer.MIN_VALUE;
    public String finExecutorTypeRefName;
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
    public Date planRefDateEndPriConnection;
    public String planRefInvestWorksDescription;
    public int planRefServicesFSideFinId = Integer.MIN_VALUE;
    public String planRefServicesFSideCnNum;
    public BigDecimal planRefTotalTimeHours;
    public BigDecimal planRefTotalTimeDays;
    public String planRefInvestItemNumber;
    public int finExecutorCode = Integer.MIN_VALUE;
    public String finExecutorName;
    public int finExecutorFinCode = Integer.MIN_VALUE;
    public String finExecutorFinTypeName;
    public int finExecutorFinTypeCode = Integer.MIN_VALUE;
    public String finExecutorFinKindName;
    public int finExecutorFinKindCode = Integer.MIN_VALUE;
    public String finExecutorFinCehName;
    public int finExecutorFinCehCode = Integer.MIN_VALUE;
    public String finExecutorAxOrgId;
    public String finExecutorAxParentOrgId;
    public String finExecutorAxParentOrgName;
    public int finExecutorAxOrgTypeId = Integer.MIN_VALUE;
    public String finExecutorAxOrgTypeName;
    public int budgetRefCode = Integer.MIN_VALUE;
    public String budgetRefShortName;
    public Date budgetRefDateStart;
    public Date budgetRefDateFinal;
    public int budgetRefRenCode = Integer.MIN_VALUE;
    public String budgetRefShpzBalans;
    public int budgetRefKau_table_id_1884 = Integer.MIN_VALUE;
    public String budgetRefKau_1884;
    public String budgetRefName_1884;
    public String budgetRefHrmorganizationid;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setPercentLoad(BigDecimal aValue){
       percentLoad = aValue;
    }

    public BigDecimal getPercentLoad(){
       return percentLoad;
    }

    public void setDateStart(Date aValue){
       dateStart = aValue;
    }

    public Date getDateStart(){
       return dateStart;
    }

    public void setDateFinal(Date aValue){
       dateFinal = aValue;
    }

    public Date getDateFinal(){
       return dateFinal;
    }
    public void setTotalTimeHours(BigDecimal aValue){
       totalTimeHours = aValue;
    }

    public BigDecimal getTotalTimeHours(){
       return totalTimeHours;
    }
    public void setTotalTimeDays(BigDecimal aValue){
       totalTimeDays = aValue;
    }

    public BigDecimal getTotalTimeDays(){
       return totalTimeDays;
    }
    public void setTotalTimeManHours(BigDecimal aValue){
       totalTimeManHours = aValue;
    }

    public BigDecimal getTotalTimeManHours(){
       return totalTimeManHours;
    }
    public void setDeliveryTime(BigDecimal aValue){
       deliveryTime = aValue;
    }

    public BigDecimal getDeliveryTime(){
       return deliveryTime;
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


    public void setFinExecutorTypeRefCode(int aValue){
       finExecutorTypeRefCode = aValue;
    }
    public int getFinExecutorTypeRefCode(){
       return finExecutorTypeRefCode;
    }

    public void setFinExecutorTypeRefName(String aValue){
       finExecutorTypeRefName = aValue;
    }
    public String getFinExecutorTypeRefName(){
       return finExecutorTypeRefName;
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


    public void setPlanRefDateEndPriConnection(Date aValue){
       planRefDateEndPriConnection = aValue;
    }
    public Date getPlanRefDateEndPriConnection(){
       return planRefDateEndPriConnection;
    }

    public void setPlanRefInvestWorksDescription(String aValue){
       planRefInvestWorksDescription = aValue;
    }
    public String getPlanRefInvestWorksDescription(){
       return planRefInvestWorksDescription;
    }

    public void setPlanRefServicesFSideFinId(int aValue){
       planRefServicesFSideFinId = aValue;
    }
    public int getPlanRefServicesFSideFinId(){
       return planRefServicesFSideFinId;
    }

    public void setPlanRefServicesFSideCnNum(String aValue){
       planRefServicesFSideCnNum = aValue;
    }
    public String getPlanRefServicesFSideCnNum(){
       return planRefServicesFSideCnNum;
    }

    public void setPlanRefTotalTimeHours(BigDecimal aValue){
       planRefTotalTimeHours = aValue;
    }
    public BigDecimal getPlanRefTotalTimeHours(){
       return planRefTotalTimeHours;
    }

    public void setPlanRefTotalTimeDays(BigDecimal aValue){
       planRefTotalTimeDays = aValue;
    }
    public BigDecimal getPlanRefTotalTimeDays(){
       return planRefTotalTimeDays;
    }

    public void setPlanRefInvestItemNumber(String aValue){
       planRefInvestItemNumber = aValue;
    }
    public String getPlanRefInvestItemNumber(){
       return planRefInvestItemNumber;
    }

    public void setFinExecutorCode(int aValue){
       finExecutorCode = aValue;
    }
    public int getFinExecutorCode(){
       return finExecutorCode;
    }

    public void setFinExecutorName(String aValue){
       finExecutorName = aValue;
    }
    public String getFinExecutorName(){
       return finExecutorName;
    }

    public void setFinExecutorFinCode(int aValue){
       finExecutorFinCode = aValue;
    }
    public int getFinExecutorFinCode(){
       return finExecutorFinCode;
    }

    public void setFinExecutorFinTypeName(String aValue){
       finExecutorFinTypeName = aValue;
    }
    public String getFinExecutorFinTypeName(){
       return finExecutorFinTypeName;
    }

    public void setFinExecutorFinTypeCode(int aValue){
       finExecutorFinTypeCode = aValue;
    }
    public int getFinExecutorFinTypeCode(){
       return finExecutorFinTypeCode;
    }

    public void setFinExecutorFinKindName(String aValue){
       finExecutorFinKindName = aValue;
    }
    public String getFinExecutorFinKindName(){
       return finExecutorFinKindName;
    }

    public void setFinExecutorFinKindCode(int aValue){
       finExecutorFinKindCode = aValue;
    }
    public int getFinExecutorFinKindCode(){
       return finExecutorFinKindCode;
    }

    public void setFinExecutorFinCehName(String aValue){
       finExecutorFinCehName = aValue;
    }
    public String getFinExecutorFinCehName(){
       return finExecutorFinCehName;
    }

    public void setFinExecutorFinCehCode(int aValue){
       finExecutorFinCehCode = aValue;
    }
    public int getFinExecutorFinCehCode(){
       return finExecutorFinCehCode;
    }

    public void setFinExecutorAxOrgId(String aValue){
       finExecutorAxOrgId = aValue;
    }
    public String getFinExecutorAxOrgId(){
       return finExecutorAxOrgId;
    }

    public void setFinExecutorAxParentOrgId(String aValue){
       finExecutorAxParentOrgId = aValue;
    }
    public String getFinExecutorAxParentOrgId(){
       return finExecutorAxParentOrgId;
    }

    public void setFinExecutorAxParentOrgName(String aValue){
       finExecutorAxParentOrgName = aValue;
    }
    public String getFinExecutorAxParentOrgName(){
       return finExecutorAxParentOrgName;
    }

    public void setFinExecutorAxOrgTypeId(int aValue){
       finExecutorAxOrgTypeId = aValue;
    }
    public int getFinExecutorAxOrgTypeId(){
       return finExecutorAxOrgTypeId;
    }

    public void setFinExecutorAxOrgTypeName(String aValue){
       finExecutorAxOrgTypeName = aValue;
    }
    public String getFinExecutorAxOrgTypeName(){
       return finExecutorAxOrgTypeName;
    }

    public void setBudgetRefCode(int aValue){
       budgetRefCode = aValue;
    }
    public int getBudgetRefCode(){
       return budgetRefCode;
    }

    public void setBudgetRefShortName(String aValue){
       budgetRefShortName = aValue;
    }
    public String getBudgetRefShortName(){
       return budgetRefShortName;
    }


    public void setBudgetRefDateStart(Date aValue){
       budgetRefDateStart = aValue;
    }
    public Date getBudgetRefDateStart(){
       return budgetRefDateStart;
    }


    public void setBudgetRefDateFinal(Date aValue){
       budgetRefDateFinal = aValue;
    }
    public Date getBudgetRefDateFinal(){
       return budgetRefDateFinal;
    }

    public void setBudgetRefRenCode(int aValue){
       budgetRefRenCode = aValue;
    }
    public int getBudgetRefRenCode(){
       return budgetRefRenCode;
    }

    public void setBudgetRefShpzBalans(String aValue){
       budgetRefShpzBalans = aValue;
    }
    public String getBudgetRefShpzBalans(){
       return budgetRefShpzBalans;
    }

    public void setBudgetRefKau_table_id_1884(int aValue){
       budgetRefKau_table_id_1884 = aValue;
    }
    public int getBudgetRefKau_table_id_1884(){
       return budgetRefKau_table_id_1884;
    }

    public void setBudgetRefKau_1884(String aValue){
       budgetRefKau_1884 = aValue;
    }
    public String getBudgetRefKau_1884(){
       return budgetRefKau_1884;
    }

    public void setBudgetRefName_1884(String aValue){
       budgetRefName_1884 = aValue;
    }
    public String getBudgetRefName_1884(){
       return budgetRefName_1884;
    }

    public void setBudgetRefHrmorganizationid(String aValue){
       budgetRefHrmorganizationid = aValue;
    }
    public String getBudgetRefHrmorganizationid(){
       return budgetRefHrmorganizationid;
    }



}