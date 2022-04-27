
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENPlanInformCustomer;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENPlanInformCustomerShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public Date timeStart ;
	public Date timeFinal ;
	public String userAdd;
	public Date dateAdd ;
	public String userGen;
	public Date dateEdit ;
	public int isSent = Integer.MIN_VALUE;
	public int workOrderBytRefCode = Integer.MIN_VALUE;
	public String workOrderBytRefNumberGen;
	public Date workOrderBytRefDateGen;
	public String workOrderBytRefCommentGen;
	public Date workOrderBytRefDateAdd;
	public Date workOrderBytRefDateEdit;
	public String workOrderBytRefUserAdd;
	public String workOrderBytRefUserEdit;
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
	
	public String workOrderBytItemPhone;
	public String infoTime;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setTimeStart(Date aValue){
		timeStart = aValue;
	}

	public Date getTimeStart(){
		return timeStart;
	}

	public void setTimeFinal(Date aValue){
		timeFinal = aValue;
	}

	public Date getTimeFinal(){
		return timeFinal;
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

	public void setIsSent(int aValue){
		isSent = aValue;
	}

	public int getIsSent(){
		return isSent;
	}


	public void setWorkOrderBytRefCode(int aValue){
		workOrderBytRefCode = aValue;
	}
	public int getWorkOrderBytRefCode(){
		return workOrderBytRefCode;
	}

	public void setWorkOrderBytRefNumberGen(String aValue){
		workOrderBytRefNumberGen = aValue;
	}
	public String getWorkOrderBytRefNumberGen(){
		return workOrderBytRefNumberGen;
	}

	public void setWorkOrderBytRefDateGen(Date aValue){
		workOrderBytRefDateGen = aValue;
	}
	public Date getWorkOrderBytRefDateGen(){
		return workOrderBytRefDateGen;
	}

	public void setWorkOrderBytRefCommentGen(String aValue){
		workOrderBytRefCommentGen = aValue;
	}
	public String getWorkOrderBytRefCommentGen(){
		return workOrderBytRefCommentGen;
	}

	public void setWorkOrderBytRefDateAdd(Date aValue){
		workOrderBytRefDateAdd = aValue;
	}
	public Date getWorkOrderBytRefDateAdd(){
		return workOrderBytRefDateAdd;
	}

	public void setWorkOrderBytRefDateEdit(Date aValue){
		workOrderBytRefDateEdit = aValue;
	}
	public Date getWorkOrderBytRefDateEdit(){
		return workOrderBytRefDateEdit;
	}

	public void setWorkOrderBytRefUserAdd(String aValue){
		workOrderBytRefUserAdd = aValue;
	}
	public String getWorkOrderBytRefUserAdd(){
		return workOrderBytRefUserAdd;
	}

	public void setWorkOrderBytRefUserEdit(String aValue){
		workOrderBytRefUserEdit = aValue;
	}
	public String getWorkOrderBytRefUserEdit(){
		return workOrderBytRefUserEdit;
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

	public String getWorkOrderBytItemPhone() {
		return workOrderBytItemPhone;
	}

	public void setWorkOrderBytItemPhone(String workOrderBytItemPhone) {
		this.workOrderBytItemPhone = workOrderBytItemPhone;
	}

	public String getInfoTime() {
		return infoTime;
	}

	public void setInfoTime(String infoTime) {
		this.infoTime = infoTime;
	}



}