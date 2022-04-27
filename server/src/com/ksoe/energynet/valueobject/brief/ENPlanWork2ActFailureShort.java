
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENPlanWork2ActFailure;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENPlanWork2ActFailureShort implements Serializable {

    public int code = Integer.MIN_VALUE;
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
    public int actFailureRefCode = Integer.MIN_VALUE;
    public String actFailureRefNumberGen;
    public Date actFailureRefDateAct;
    public String actFailureRefCommentGen;
    public String actFailureRefUserAdd;
    public Date actFailureRefDateAdd;
    public String actFailureRefUserGen;
    public Date actFailureRefDateEdit;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
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

    public void setActFailureRefCode(int aValue){
       actFailureRefCode = aValue;
    }
    public int getActFailureRefCode(){
       return actFailureRefCode;
    }

    public void setActFailureRefNumberGen(String aValue){
       actFailureRefNumberGen = aValue;
    }
    public String getActFailureRefNumberGen(){
       return actFailureRefNumberGen;
    }


    public void setActFailureRefDateAct(Date aValue){
       actFailureRefDateAct = aValue;
    }
    public Date getActFailureRefDateAct(){
       return actFailureRefDateAct;
    }

    public void setActFailureRefCommentGen(String aValue){
       actFailureRefCommentGen = aValue;
    }
    public String getActFailureRefCommentGen(){
       return actFailureRefCommentGen;
    }

    public void setActFailureRefUserAdd(String aValue){
       actFailureRefUserAdd = aValue;
    }
    public String getActFailureRefUserAdd(){
       return actFailureRefUserAdd;
    }


    public void setActFailureRefDateAdd(Date aValue){
       actFailureRefDateAdd = aValue;
    }
    public Date getActFailureRefDateAdd(){
       return actFailureRefDateAdd;
    }

    public void setActFailureRefUserGen(String aValue){
       actFailureRefUserGen = aValue;
    }
    public String getActFailureRefUserGen(){
       return actFailureRefUserGen;
    }


    public void setActFailureRefDateEdit(Date aValue){
       actFailureRefDateEdit = aValue;
    }
    public Date getActFailureRefDateEdit(){
       return actFailureRefDateEdit;
    }



}