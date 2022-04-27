
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENEstimateItem2Plan;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENEstimateItem2PlanShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String userGen;
    public Date dateEdit ;
    public int estimateItemRefCode = Integer.MIN_VALUE;
    public BigDecimal estimateItemRefCountGen;
    public BigDecimal estimateItemRefCountFact;
    public BigDecimal estimateItemRefPrice;
    public BigDecimal estimateItemRefCost;
    public int estimateItemRefIsUseVAT = Integer.MIN_VALUE;
    public int estimateItemRefDeliveryTime = Integer.MIN_VALUE;
    public int estimateItemRefUseWorkTime = Integer.MIN_VALUE;
    public String estimateItemRefUserGen;
    public Date estimateItemRefDateEdit;
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
    public int typeRefCode = Integer.MIN_VALUE;
    public String typeRefName;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
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


    public void setEstimateItemRefCode(int aValue){
       estimateItemRefCode = aValue;
    }
    public int getEstimateItemRefCode(){
       return estimateItemRefCode;
    }

    public void setEstimateItemRefCountGen(BigDecimal aValue){
       estimateItemRefCountGen = aValue;
    }
    public BigDecimal getEstimateItemRefCountGen(){
       return estimateItemRefCountGen;
    }

    public void setEstimateItemRefCountFact(BigDecimal aValue){
       estimateItemRefCountFact = aValue;
    }
    public BigDecimal getEstimateItemRefCountFact(){
       return estimateItemRefCountFact;
    }

    public void setEstimateItemRefPrice(BigDecimal aValue){
       estimateItemRefPrice = aValue;
    }
    public BigDecimal getEstimateItemRefPrice(){
       return estimateItemRefPrice;
    }

    public void setEstimateItemRefCost(BigDecimal aValue){
       estimateItemRefCost = aValue;
    }
    public BigDecimal getEstimateItemRefCost(){
       return estimateItemRefCost;
    }

    public void setEstimateItemRefIsUseVAT(int aValue){
       estimateItemRefIsUseVAT = aValue;
    }
    public int getEstimateItemRefIsUseVAT(){
       return estimateItemRefIsUseVAT;
    }

    public void setEstimateItemRefDeliveryTime(int aValue){
       estimateItemRefDeliveryTime = aValue;
    }
    public int getEstimateItemRefDeliveryTime(){
       return estimateItemRefDeliveryTime;
    }

    public void setEstimateItemRefUseWorkTime(int aValue){
       estimateItemRefUseWorkTime = aValue;
    }
    public int getEstimateItemRefUseWorkTime(){
       return estimateItemRefUseWorkTime;
    }

    public void setEstimateItemRefUserGen(String aValue){
       estimateItemRefUserGen = aValue;
    }
    public String getEstimateItemRefUserGen(){
       return estimateItemRefUserGen;
    }


    public void setEstimateItemRefDateEdit(Date aValue){
       estimateItemRefDateEdit = aValue;
    }
    public Date getEstimateItemRefDateEdit(){
       return estimateItemRefDateEdit;
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

    public void setTypeRefCode(int aValue){
       typeRefCode = aValue;
    }
    public int getTypeRefCode(){
       return typeRefCode;
    }

    public void setTypeRefName(String aValue){
       typeRefName = aValue;
    }
    public String getTypeRefName(){
       return typeRefName;
    }



}