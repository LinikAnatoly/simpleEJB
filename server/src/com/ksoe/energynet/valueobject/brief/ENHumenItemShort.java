
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENHumenItem;
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENHumenItemShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal countGen;
    public BigDecimal countFact;
    public BigDecimal countFactOriginal;
    public BigDecimal price;
    public BigDecimal cost;
    public String userGen;
    public Date dateEdit ;
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
    public int planItemRefCode = Integer.MIN_VALUE;
    public BigDecimal planItemRefCountGen;
    public BigDecimal planItemRefTimeGen;
    public BigDecimal planItemRefCostGen;
    public String planItemRefUserGen;
    public Date planItemRefDateEdit;
    public int positionGenCode = Integer.MIN_VALUE;
    public String positionGenName;
    public String positionGenSafetyGroup;
    public String positionGenRank;
    public String positionGenShortName;
    public int typeRefCode = Integer.MIN_VALUE;
    public String typeRefName;
    public int finWorkerCode = Integer.MIN_VALUE;
    public String finWorkerName;
    public String finWorkerTabNumber;
    public String finWorkerPositionName;
    public int finWorkerPositionCode = Integer.MIN_VALUE;
    public String finWorkerDepartmentName;
    public String finWorkerDepartmentCode;
    public BigDecimal finWorkerPriceGen;
    public int finWorkerCategor = Integer.MIN_VALUE;
    public int finWorkerFinCode = Integer.MIN_VALUE;
    public int finWorkerIsSentAssignment = Integer.MIN_VALUE;
    public BigDecimal finWorkerChargePercent;

    /** ********************************* */
    public int finCode = Integer.MIN_VALUE;
    public int kartaRefCode = Integer.MIN_VALUE;
    public String kartaRefName;
    public String kartaNum;
    public String humenItemCodesStr;
    /** ********************************* */

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setCountGen(BigDecimal aValue){
       countGen = aValue;
    }

    public BigDecimal getCountGen(){
       return countGen;
    }
    public void setCountFact(BigDecimal aValue){
       countFact = aValue;
    }

    public BigDecimal getCountFact(){
       return countFact;
    }
    public void setCountFactOriginal(BigDecimal aValue){
       countFactOriginal = aValue;
    }

    public BigDecimal getCountFactOriginal(){
       return countFactOriginal;
    }
    public void setPrice(BigDecimal aValue){
       price = aValue;
    }

    public BigDecimal getPrice(){
       return price;
    }
    public void setCost(BigDecimal aValue){
       cost = aValue;
    }

    public BigDecimal getCost(){
       return cost;
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

    public void setPlanItemRefCode(int aValue){
       planItemRefCode = aValue;
    }
    public int getPlanItemRefCode(){
       return planItemRefCode;
    }

    public void setPlanItemRefCountGen(BigDecimal aValue){
       planItemRefCountGen = aValue;
    }
    public BigDecimal getPlanItemRefCountGen(){
       return planItemRefCountGen;
    }

    public void setPlanItemRefTimeGen(BigDecimal aValue){
       planItemRefTimeGen = aValue;
    }
    public BigDecimal getPlanItemRefTimeGen(){
       return planItemRefTimeGen;
    }

    public void setPlanItemRefCostGen(BigDecimal aValue){
       planItemRefCostGen = aValue;
    }
    public BigDecimal getPlanItemRefCostGen(){
       return planItemRefCostGen;
    }

    public void setPlanItemRefUserGen(String aValue){
       planItemRefUserGen = aValue;
    }
    public String getPlanItemRefUserGen(){
       return planItemRefUserGen;
    }


    public void setPlanItemRefDateEdit(Date aValue){
       planItemRefDateEdit = aValue;
    }
    public Date getPlanItemRefDateEdit(){
       return planItemRefDateEdit;
    }

    public void setPositionGenCode(int aValue){
       positionGenCode = aValue;
    }
    public int getPositionGenCode(){
       return positionGenCode;
    }

    public void setPositionGenName(String aValue){
       positionGenName = aValue;
    }
    public String getPositionGenName(){
       return positionGenName;
    }

    public void setPositionGenSafetyGroup(String aValue){
       positionGenSafetyGroup = aValue;
    }
    public String getPositionGenSafetyGroup(){
       return positionGenSafetyGroup;
    }

    public void setPositionGenRank(String aValue){
       positionGenRank = aValue;
    }
    public String getPositionGenRank(){
       return positionGenRank;
    }

    public void setPositionGenShortName(String aValue){
       positionGenShortName = aValue;
    }
    public String getPositionGenShortName(){
       return positionGenShortName;
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

    public void setKartaRefCode(int aValue){
        kartaRefCode = aValue;
     }
     public int getKartaRefCode(){
        return kartaRefCode;
     }

     public void setKartaRefName(String aValue){
        kartaRefName = aValue;
     }
     public String getKartaRefName(){
        return kartaRefName;
     }
 	public String getKartaNum() {
 		return kartaNum;
 	}
 	public void setKartaNum(String kartaNum) {
 		this.kartaNum = kartaNum;
 	}

	public int getFinCode() {
		return finCode;
	}
	public void setFinCode(int finCode) {
		this.finCode = finCode;
	}


    public void setFinWorkerCode(int aValue){
       finWorkerCode = aValue;
    }
    public int getFinWorkerCode(){
       return finWorkerCode;
    }

    public void setFinWorkerName(String aValue){
       finWorkerName = aValue;
    }
    public String getFinWorkerName(){
       return finWorkerName;
    }

    public void setFinWorkerTabNumber(String aValue){
       finWorkerTabNumber = aValue;
    }
    public String getFinWorkerTabNumber(){
       return finWorkerTabNumber;
    }

    public void setFinWorkerPositionName(String aValue){
       finWorkerPositionName = aValue;
    }
    public String getFinWorkerPositionName(){
       return finWorkerPositionName;
    }

    public void setFinWorkerPositionCode(int aValue){
       finWorkerPositionCode = aValue;
    }
    public int getFinWorkerPositionCode(){
       return finWorkerPositionCode;
    }

    public void setFinWorkerDepartmentName(String aValue){
       finWorkerDepartmentName = aValue;
    }
    public String getFinWorkerDepartmentName(){
       return finWorkerDepartmentName;
    }

    public void setFinWorkerDepartmentCode(String aValue){
       finWorkerDepartmentCode = aValue;
    }
    public String getFinWorkerDepartmentCode(){
       return finWorkerDepartmentCode;
    }

    public void setFinWorkerPriceGen(BigDecimal aValue){
       finWorkerPriceGen = aValue;
    }
    public BigDecimal getFinWorkerPriceGen(){
       return finWorkerPriceGen;
    }

    public void setFinWorkerCategor(int aValue){
       finWorkerCategor = aValue;
    }
    public int getFinWorkerCategor(){
       return finWorkerCategor;
    }

    public void setFinWorkerFinCode(int aValue){
       finWorkerFinCode = aValue;
    }
    public int getFinWorkerFinCode(){
       return finWorkerFinCode;
    }

    public void setFinWorkerIsSentAssignment(int aValue){
       finWorkerIsSentAssignment = aValue;
    }

    public int getFinWorkerIsSentAssignment(){
       return finWorkerIsSentAssignment;
    }

    public void setFinWorkerChargePercent(BigDecimal aValue){
       finWorkerChargePercent = aValue;
    }

    public BigDecimal getFinWorkerChargePercent(){
       return finWorkerChargePercent;
    }

	public String getHumenItemCodesStr() {
		return humenItemCodesStr;
	}

	public void setHumenItemCodesStr(String humenItemCodesStr) {
		this.humenItemCodesStr = humenItemCodesStr;
	}

}