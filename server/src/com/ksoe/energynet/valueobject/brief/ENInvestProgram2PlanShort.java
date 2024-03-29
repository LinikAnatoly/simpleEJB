
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENInvestProgram2Plan;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENInvestProgram2PlanShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String userAdd;
    public Date dateAdd ;
    public String userGen;
    public Date dateEdit ;
    public int investProgramRefCode = Integer.MIN_VALUE;
    public String investProgramRefName;
    public int investProgramRefYearGen = Integer.MIN_VALUE;
    public String investProgramRefCommentGen;
    public BigDecimal investProgramRefCountGen;
    public BigDecimal investProgramRefPrice;
    public BigDecimal investProgramRefSumGen;
    public BigDecimal investProgramRefQuarter1count;
    public BigDecimal investProgramRefQuarter1sum;
    public BigDecimal investProgramRefQuarter2count;
    public BigDecimal investProgramRefQuarter2sum;
    public BigDecimal investProgramRefQuarter3count;
    public BigDecimal investProgramRefQuarter3sum;
    public BigDecimal investProgramRefQuarter4count;
    public BigDecimal investProgramRefQuarter4sum;
    public String investProgramRefUserAdd;
    public Date investProgramRefDateAdd;
    public String investProgramRefUserGen;
    public Date investProgramRefDateEdit;
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

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setUserAdd(String aValue){
       userAdd = aValue;
    }

    public String getUserAdd(){
       return userAdd;
    }

    public void setDateAdd(Date aValue){
       dateAdd = aValue;
    }

    public Date getDateAdd(){
       return dateAdd;
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


    public void setInvestProgramRefCode(int aValue){
       investProgramRefCode = aValue;
    }
    public int getInvestProgramRefCode(){
       return investProgramRefCode;
    }

    public void setInvestProgramRefName(String aValue){
       investProgramRefName = aValue;
    }
    public String getInvestProgramRefName(){
       return investProgramRefName;
    }

    public void setInvestProgramRefYearGen(int aValue){
       investProgramRefYearGen = aValue;
    }
    public int getInvestProgramRefYearGen(){
       return investProgramRefYearGen;
    }

    public void setInvestProgramRefCommentGen(String aValue){
       investProgramRefCommentGen = aValue;
    }
    public String getInvestProgramRefCommentGen(){
       return investProgramRefCommentGen;
    }

    public void setInvestProgramRefCountGen(BigDecimal aValue){
       investProgramRefCountGen = aValue;
    }
    public BigDecimal getInvestProgramRefCountGen(){
       return investProgramRefCountGen;
    }

    public void setInvestProgramRefPrice(BigDecimal aValue){
       investProgramRefPrice = aValue;
    }
    public BigDecimal getInvestProgramRefPrice(){
       return investProgramRefPrice;
    }

    public void setInvestProgramRefSumGen(BigDecimal aValue){
       investProgramRefSumGen = aValue;
    }
    public BigDecimal getInvestProgramRefSumGen(){
       return investProgramRefSumGen;
    }

    public void setInvestProgramRefQuarter1count(BigDecimal aValue){
       investProgramRefQuarter1count = aValue;
    }
    public BigDecimal getInvestProgramRefQuarter1count(){
       return investProgramRefQuarter1count;
    }

    public void setInvestProgramRefQuarter1sum(BigDecimal aValue){
       investProgramRefQuarter1sum = aValue;
    }
    public BigDecimal getInvestProgramRefQuarter1sum(){
       return investProgramRefQuarter1sum;
    }

    public void setInvestProgramRefQuarter2count(BigDecimal aValue){
       investProgramRefQuarter2count = aValue;
    }
    public BigDecimal getInvestProgramRefQuarter2count(){
       return investProgramRefQuarter2count;
    }

    public void setInvestProgramRefQuarter2sum(BigDecimal aValue){
       investProgramRefQuarter2sum = aValue;
    }
    public BigDecimal getInvestProgramRefQuarter2sum(){
       return investProgramRefQuarter2sum;
    }

    public void setInvestProgramRefQuarter3count(BigDecimal aValue){
       investProgramRefQuarter3count = aValue;
    }
    public BigDecimal getInvestProgramRefQuarter3count(){
       return investProgramRefQuarter3count;
    }

    public void setInvestProgramRefQuarter3sum(BigDecimal aValue){
       investProgramRefQuarter3sum = aValue;
    }
    public BigDecimal getInvestProgramRefQuarter3sum(){
       return investProgramRefQuarter3sum;
    }

    public void setInvestProgramRefQuarter4count(BigDecimal aValue){
       investProgramRefQuarter4count = aValue;
    }
    public BigDecimal getInvestProgramRefQuarter4count(){
       return investProgramRefQuarter4count;
    }

    public void setInvestProgramRefQuarter4sum(BigDecimal aValue){
       investProgramRefQuarter4sum = aValue;
    }
    public BigDecimal getInvestProgramRefQuarter4sum(){
       return investProgramRefQuarter4sum;
    }

    public void setInvestProgramRefUserAdd(String aValue){
       investProgramRefUserAdd = aValue;
    }
    public String getInvestProgramRefUserAdd(){
       return investProgramRefUserAdd;
    }


    public void setInvestProgramRefDateAdd(Date aValue){
       investProgramRefDateAdd = aValue;
    }
    public Date getInvestProgramRefDateAdd(){
       return investProgramRefDateAdd;
    }

    public void setInvestProgramRefUserGen(String aValue){
       investProgramRefUserGen = aValue;
    }
    public String getInvestProgramRefUserGen(){
       return investProgramRefUserGen;
    }


    public void setInvestProgramRefDateEdit(Date aValue){
       investProgramRefDateEdit = aValue;
    }
    public Date getInvestProgramRefDateEdit(){
       return investProgramRefDateEdit;
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



}