
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENIPItem2Plan;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENIPItem2PlanShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String userAdd;
	public Date dateAdd ;
	public String userGen;
	public Date dateEdit ;
	public int ipItemRefCode = Integer.MIN_VALUE;
	public String ipItemRefName;
	public String ipItemRefBuhName;
	public String ipItemRefItemNumber;
	public String ipItemRefInvNumber;
	public int ipItemRefIsProjectDocument = Integer.MIN_VALUE;
	public String ipItemRefFinancing;
	public String ipItemRefCommentGen;
	public BigDecimal ipItemRefCountGen;
	public BigDecimal ipItemRefPrice;
	public BigDecimal ipItemRefSumGen;
	public BigDecimal ipItemRefQuarter1count;
	public BigDecimal ipItemRefQuarter1sum;
	public BigDecimal ipItemRefQuarter2count;
	public BigDecimal ipItemRefQuarter2sum;
	public BigDecimal ipItemRefQuarter3count;
	public BigDecimal ipItemRefQuarter3sum;
	public BigDecimal ipItemRefQuarter4count;
	public BigDecimal ipItemRefQuarter4sum;
	public BigDecimal ipItemRefCountGenInside;
	public BigDecimal ipItemRefPriceInside;
	public BigDecimal ipItemRefSumGenInside;
	public BigDecimal ipItemRefMm1countInside;
	public BigDecimal ipItemRefMm1sumInside;
	public BigDecimal ipItemRefMm2countInside;
	public BigDecimal ipItemRefMm2sumInside;
	public BigDecimal ipItemRefMm3countInside;
	public BigDecimal ipItemRefMm3sumInside;
	public BigDecimal ipItemRefMm4countInside;
	public BigDecimal ipItemRefMm4sumInside;
	public BigDecimal ipItemRefMm5countInside;
	public BigDecimal ipItemRefMm5sumInside;
	public BigDecimal ipItemRefMm6countInside;
	public BigDecimal ipItemRefMm6sumInside;
	public BigDecimal ipItemRefMm7countInside;
	public BigDecimal ipItemRefMm7sumInside;
	public BigDecimal ipItemRefMm8countInside;
	public BigDecimal ipItemRefMm8sumInside;
	public BigDecimal ipItemRefMm9countInside;
	public BigDecimal ipItemRefMm9sumInside;
	public BigDecimal ipItemRefMm10countInside;
	public BigDecimal ipItemRefMm10sumInside;
	public BigDecimal ipItemRefMm11countInside;
	public BigDecimal ipItemRefMm11sumInside;
	public BigDecimal ipItemRefMm12countInside;
	public BigDecimal ipItemRefMm12sumInside;
	public String ipItemRefInfoTenders;
	public String ipItemRefUserAdd;
	public Date ipItemRefDateAdd;
	public String ipItemRefUserGen;
	public Date ipItemRefDateEdit;
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



	public void setIpItemRefCode(int aValue){
		ipItemRefCode = aValue;
	}
	public int getIpItemRefCode(){
		return ipItemRefCode;
	}

	public void setIpItemRefName(String aValue){
		ipItemRefName = aValue;
	}
	public String getIpItemRefName(){
		return ipItemRefName;
	}

	public void setIpItemRefBuhName(String aValue){
		ipItemRefBuhName = aValue;
	}
	public String getIpItemRefBuhName(){
		return ipItemRefBuhName;
	}

	public void setIpItemRefItemNumber(String aValue){
		ipItemRefItemNumber = aValue;
	}
	public String getIpItemRefItemNumber(){
		return ipItemRefItemNumber;
	}

	public void setIpItemRefInvNumber(String aValue){
		ipItemRefInvNumber = aValue;
	}
	public String getIpItemRefInvNumber(){
		return ipItemRefInvNumber;
	}

	public void setIpItemRefIsProjectDocument(int aValue){
		ipItemRefIsProjectDocument = aValue;
	}
	public int getIpItemRefIsProjectDocument(){
		return ipItemRefIsProjectDocument;
	}

	public void setIpItemRefFinancing(String aValue){
		ipItemRefFinancing = aValue;
	}
	public String getIpItemRefFinancing(){
		return ipItemRefFinancing;
	}

	public void setIpItemRefCommentGen(String aValue){
		ipItemRefCommentGen = aValue;
	}
	public String getIpItemRefCommentGen(){
		return ipItemRefCommentGen;
	}

	public void setIpItemRefCountGen(BigDecimal aValue){
		ipItemRefCountGen = aValue;
	}
	public BigDecimal getIpItemRefCountGen(){
		return ipItemRefCountGen;
	}

	public void setIpItemRefPrice(BigDecimal aValue){
		ipItemRefPrice = aValue;
	}
	public BigDecimal getIpItemRefPrice(){
		return ipItemRefPrice;
	}

	public void setIpItemRefSumGen(BigDecimal aValue){
		ipItemRefSumGen = aValue;
	}
	public BigDecimal getIpItemRefSumGen(){
		return ipItemRefSumGen;
	}

	public void setIpItemRefQuarter1count(BigDecimal aValue){
		ipItemRefQuarter1count = aValue;
	}
	public BigDecimal getIpItemRefQuarter1count(){
		return ipItemRefQuarter1count;
	}

	public void setIpItemRefQuarter1sum(BigDecimal aValue){
		ipItemRefQuarter1sum = aValue;
	}
	public BigDecimal getIpItemRefQuarter1sum(){
		return ipItemRefQuarter1sum;
	}

	public void setIpItemRefQuarter2count(BigDecimal aValue){
		ipItemRefQuarter2count = aValue;
	}
	public BigDecimal getIpItemRefQuarter2count(){
		return ipItemRefQuarter2count;
	}

	public void setIpItemRefQuarter2sum(BigDecimal aValue){
		ipItemRefQuarter2sum = aValue;
	}
	public BigDecimal getIpItemRefQuarter2sum(){
		return ipItemRefQuarter2sum;
	}

	public void setIpItemRefQuarter3count(BigDecimal aValue){
		ipItemRefQuarter3count = aValue;
	}
	public BigDecimal getIpItemRefQuarter3count(){
		return ipItemRefQuarter3count;
	}

	public void setIpItemRefQuarter3sum(BigDecimal aValue){
		ipItemRefQuarter3sum = aValue;
	}
	public BigDecimal getIpItemRefQuarter3sum(){
		return ipItemRefQuarter3sum;
	}

	public void setIpItemRefQuarter4count(BigDecimal aValue){
		ipItemRefQuarter4count = aValue;
	}
	public BigDecimal getIpItemRefQuarter4count(){
		return ipItemRefQuarter4count;
	}

	public void setIpItemRefQuarter4sum(BigDecimal aValue){
		ipItemRefQuarter4sum = aValue;
	}
	public BigDecimal getIpItemRefQuarter4sum(){
		return ipItemRefQuarter4sum;
	}

	public void setIpItemRefCountGenInside(BigDecimal aValue){
		ipItemRefCountGenInside = aValue;
	}
	public BigDecimal getIpItemRefCountGenInside(){
		return ipItemRefCountGenInside;
	}

	public void setIpItemRefPriceInside(BigDecimal aValue){
		ipItemRefPriceInside = aValue;
	}
	public BigDecimal getIpItemRefPriceInside(){
		return ipItemRefPriceInside;
	}

	public void setIpItemRefSumGenInside(BigDecimal aValue){
		ipItemRefSumGenInside = aValue;
	}
	public BigDecimal getIpItemRefSumGenInside(){
		return ipItemRefSumGenInside;
	}

	public void setIpItemRefMm1countInside(BigDecimal aValue){
		ipItemRefMm1countInside = aValue;
	}
	public BigDecimal getIpItemRefMm1countInside(){
		return ipItemRefMm1countInside;
	}

	public void setIpItemRefMm1sumInside(BigDecimal aValue){
		ipItemRefMm1sumInside = aValue;
	}
	public BigDecimal getIpItemRefMm1sumInside(){
		return ipItemRefMm1sumInside;
	}

	public void setIpItemRefMm2countInside(BigDecimal aValue){
		ipItemRefMm2countInside = aValue;
	}
	public BigDecimal getIpItemRefMm2countInside(){
		return ipItemRefMm2countInside;
	}

	public void setIpItemRefMm2sumInside(BigDecimal aValue){
		ipItemRefMm2sumInside = aValue;
	}
	public BigDecimal getIpItemRefMm2sumInside(){
		return ipItemRefMm2sumInside;
	}

	public void setIpItemRefMm3countInside(BigDecimal aValue){
		ipItemRefMm3countInside = aValue;
	}
	public BigDecimal getIpItemRefMm3countInside(){
		return ipItemRefMm3countInside;
	}

	public void setIpItemRefMm3sumInside(BigDecimal aValue){
		ipItemRefMm3sumInside = aValue;
	}
	public BigDecimal getIpItemRefMm3sumInside(){
		return ipItemRefMm3sumInside;
	}

	public void setIpItemRefMm4countInside(BigDecimal aValue){
		ipItemRefMm4countInside = aValue;
	}
	public BigDecimal getIpItemRefMm4countInside(){
		return ipItemRefMm4countInside;
	}

	public void setIpItemRefMm4sumInside(BigDecimal aValue){
		ipItemRefMm4sumInside = aValue;
	}
	public BigDecimal getIpItemRefMm4sumInside(){
		return ipItemRefMm4sumInside;
	}

	public void setIpItemRefMm5countInside(BigDecimal aValue){
		ipItemRefMm5countInside = aValue;
	}
	public BigDecimal getIpItemRefMm5countInside(){
		return ipItemRefMm5countInside;
	}

	public void setIpItemRefMm5sumInside(BigDecimal aValue){
		ipItemRefMm5sumInside = aValue;
	}
	public BigDecimal getIpItemRefMm5sumInside(){
		return ipItemRefMm5sumInside;
	}

	public void setIpItemRefMm6countInside(BigDecimal aValue){
		ipItemRefMm6countInside = aValue;
	}
	public BigDecimal getIpItemRefMm6countInside(){
		return ipItemRefMm6countInside;
	}

	public void setIpItemRefMm6sumInside(BigDecimal aValue){
		ipItemRefMm6sumInside = aValue;
	}
	public BigDecimal getIpItemRefMm6sumInside(){
		return ipItemRefMm6sumInside;
	}

	public void setIpItemRefMm7countInside(BigDecimal aValue){
		ipItemRefMm7countInside = aValue;
	}
	public BigDecimal getIpItemRefMm7countInside(){
		return ipItemRefMm7countInside;
	}

	public void setIpItemRefMm7sumInside(BigDecimal aValue){
		ipItemRefMm7sumInside = aValue;
	}
	public BigDecimal getIpItemRefMm7sumInside(){
		return ipItemRefMm7sumInside;
	}

	public void setIpItemRefMm8countInside(BigDecimal aValue){
		ipItemRefMm8countInside = aValue;
	}
	public BigDecimal getIpItemRefMm8countInside(){
		return ipItemRefMm8countInside;
	}

	public void setIpItemRefMm8sumInside(BigDecimal aValue){
		ipItemRefMm8sumInside = aValue;
	}
	public BigDecimal getIpItemRefMm8sumInside(){
		return ipItemRefMm8sumInside;
	}

	public void setIpItemRefMm9countInside(BigDecimal aValue){
		ipItemRefMm9countInside = aValue;
	}
	public BigDecimal getIpItemRefMm9countInside(){
		return ipItemRefMm9countInside;
	}

	public void setIpItemRefMm9sumInside(BigDecimal aValue){
		ipItemRefMm9sumInside = aValue;
	}
	public BigDecimal getIpItemRefMm9sumInside(){
		return ipItemRefMm9sumInside;
	}

	public void setIpItemRefMm10countInside(BigDecimal aValue){
		ipItemRefMm10countInside = aValue;
	}
	public BigDecimal getIpItemRefMm10countInside(){
		return ipItemRefMm10countInside;
	}

	public void setIpItemRefMm10sumInside(BigDecimal aValue){
		ipItemRefMm10sumInside = aValue;
	}
	public BigDecimal getIpItemRefMm10sumInside(){
		return ipItemRefMm10sumInside;
	}

	public void setIpItemRefMm11countInside(BigDecimal aValue){
		ipItemRefMm11countInside = aValue;
	}
	public BigDecimal getIpItemRefMm11countInside(){
		return ipItemRefMm11countInside;
	}

	public void setIpItemRefMm11sumInside(BigDecimal aValue){
		ipItemRefMm11sumInside = aValue;
	}
	public BigDecimal getIpItemRefMm11sumInside(){
		return ipItemRefMm11sumInside;
	}

	public void setIpItemRefMm12countInside(BigDecimal aValue){
		ipItemRefMm12countInside = aValue;
	}
	public BigDecimal getIpItemRefMm12countInside(){
		return ipItemRefMm12countInside;
	}

	public void setIpItemRefMm12sumInside(BigDecimal aValue){
		ipItemRefMm12sumInside = aValue;
	}
	public BigDecimal getIpItemRefMm12sumInside(){
		return ipItemRefMm12sumInside;
	}

	public void setIpItemRefInfoTenders(String aValue){
		ipItemRefInfoTenders = aValue;
	}
	public String getIpItemRefInfoTenders(){
		return ipItemRefInfoTenders;
	}

	public void setIpItemRefUserAdd(String aValue){
		ipItemRefUserAdd = aValue;
	}
	public String getIpItemRefUserAdd(){
		return ipItemRefUserAdd;
	}

	public void setIpItemRefDateAdd(Date aValue){
		ipItemRefDateAdd = aValue;
	}
	public Date getIpItemRefDateAdd(){
		return ipItemRefDateAdd;
	}

	public void setIpItemRefUserGen(String aValue){
		ipItemRefUserGen = aValue;
	}
	public String getIpItemRefUserGen(){
		return ipItemRefUserGen;
	}

	public void setIpItemRefDateEdit(Date aValue){
		ipItemRefDateEdit = aValue;
	}
	public Date getIpItemRefDateEdit(){
		return ipItemRefDateEdit;
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



}