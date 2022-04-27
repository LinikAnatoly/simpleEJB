
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENServFromSide2PlanWork;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENServFromSide2PlanWorkShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public int servFromSideRefCode = Integer.MIN_VALUE;
	public String servFromSideRefContractNumber;
	public Date servFromSideRefContractDate;
	public String servFromSideRefName;
	public String servFromSideRefPartnerCode;
	public String servFromSideRefFinDocCode;
	public int servFromSideRefFinDocID = Integer.MIN_VALUE;
	public String servFromSideRefCommentGen;
	public String servFromSideRefUserGen;
	public Date servFromSideRefDateEdit;
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


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}


	public int getServFromSideRefCode(){
		return servFromSideRefCode;
	}

	public void setServFromSideRefCode(int servFromSideRefCode) {
		this.servFromSideRefCode = servFromSideRefCode;
	}

	public String getServFromSideRefContractNumber(){
		return servFromSideRefContractNumber;
	}

	public void setServFromSideRefContractNumber(String servFromSideRefContractNumber) {
		this.servFromSideRefContractNumber = servFromSideRefContractNumber;
	}

	public Date getServFromSideRefContractDate(){
		return servFromSideRefContractDate;
	}

	public void setServFromSideRefContractDate(Date servFromSideRefContractDate) {
		this.servFromSideRefContractDate = servFromSideRefContractDate;
	}

	public String getServFromSideRefName(){
		return servFromSideRefName;
	}

	public void setServFromSideRefName(String servFromSideRefName) {
		this.servFromSideRefName = servFromSideRefName;
	}

	public String getServFromSideRefPartnerCode(){
		return servFromSideRefPartnerCode;
	}

	public void setServFromSideRefPartnerCode(String servFromSideRefPartnerCode) {
		this.servFromSideRefPartnerCode = servFromSideRefPartnerCode;
	}

	public String getServFromSideRefFinDocCode(){
		return servFromSideRefFinDocCode;
	}

	public void setServFromSideRefFinDocCode(String servFromSideRefFinDocCode) {
		this.servFromSideRefFinDocCode = servFromSideRefFinDocCode;
	}

	public int getServFromSideRefFinDocID(){
		return servFromSideRefFinDocID;
	}

	public void setServFromSideRefFinDocID(int servFromSideRefFinDocID) {
		this.servFromSideRefFinDocID = servFromSideRefFinDocID;
	}

	public String getServFromSideRefCommentGen(){
		return servFromSideRefCommentGen;
	}

	public void setServFromSideRefCommentGen(String servFromSideRefCommentGen) {
		this.servFromSideRefCommentGen = servFromSideRefCommentGen;
	}

	public String getServFromSideRefUserGen(){
		return servFromSideRefUserGen;
	}

	public void setServFromSideRefUserGen(String servFromSideRefUserGen) {
		this.servFromSideRefUserGen = servFromSideRefUserGen;
	}

	public Date getServFromSideRefDateEdit(){
		return servFromSideRefDateEdit;
	}

	public void setServFromSideRefDateEdit(Date servFromSideRefDateEdit) {
		this.servFromSideRefDateEdit = servFromSideRefDateEdit;
	}

	public int getPlanRefCode(){
		return planRefCode;
	}

	public void setPlanRefCode(int planRefCode) {
		this.planRefCode = planRefCode;
	}

	public Date getPlanRefDateGen(){
		return planRefDateGen;
	}

	public void setPlanRefDateGen(Date planRefDateGen) {
		this.planRefDateGen = planRefDateGen;
	}

	public Date getPlanRefDateStart(){
		return planRefDateStart;
	}

	public void setPlanRefDateStart(Date planRefDateStart) {
		this.planRefDateStart = planRefDateStart;
	}

	public Date getPlanRefDateFinal(){
		return planRefDateFinal;
	}

	public void setPlanRefDateFinal(Date planRefDateFinal) {
		this.planRefDateFinal = planRefDateFinal;
	}

	public int getPlanRefYearGen(){
		return planRefYearGen;
	}

	public void setPlanRefYearGen(int planRefYearGen) {
		this.planRefYearGen = planRefYearGen;
	}

	public int getPlanRefMonthGen(){
		return planRefMonthGen;
	}

	public void setPlanRefMonthGen(int planRefMonthGen) {
		this.planRefMonthGen = planRefMonthGen;
	}

	public int getPlanRefYearOriginal(){
		return planRefYearOriginal;
	}

	public void setPlanRefYearOriginal(int planRefYearOriginal) {
		this.planRefYearOriginal = planRefYearOriginal;
	}

	public int getPlanRefMonthOriginal(){
		return planRefMonthOriginal;
	}

	public void setPlanRefMonthOriginal(int planRefMonthOriginal) {
		this.planRefMonthOriginal = planRefMonthOriginal;
	}

	public String getPlanRefUserGen(){
		return planRefUserGen;
	}

	public void setPlanRefUserGen(String planRefUserGen) {
		this.planRefUserGen = planRefUserGen;
	}

	public Date getPlanRefDateEdit(){
		return planRefDateEdit;
	}

	public void setPlanRefDateEdit(Date planRefDateEdit) {
		this.planRefDateEdit = planRefDateEdit;
	}

	public String getPlanRefWorkOrderNumber(){
		return planRefWorkOrderNumber;
	}

	public void setPlanRefWorkOrderNumber(String planRefWorkOrderNumber) {
		this.planRefWorkOrderNumber = planRefWorkOrderNumber;
	}

	public Date getPlanRefDateWorkOrder(){
		return planRefDateWorkOrder;
	}

	public void setPlanRefDateWorkOrder(Date planRefDateWorkOrder) {
		this.planRefDateWorkOrder = planRefDateWorkOrder;
	}

	public String getPlanRefPriConnectionNumber(){
		return planRefPriConnectionNumber;
	}

	public void setPlanRefPriConnectionNumber(String planRefPriConnectionNumber) {
		this.planRefPriConnectionNumber = planRefPriConnectionNumber;
	}

	public Date getPlanRefDateEndPriConnection(){
		return planRefDateEndPriConnection;
	}

	public void setPlanRefDateEndPriConnection(Date planRefDateEndPriConnection) {
		this.planRefDateEndPriConnection = planRefDateEndPriConnection;
	}

	public String getPlanRefInvestWorksDescription(){
		return planRefInvestWorksDescription;
	}

	public void setPlanRefInvestWorksDescription(String planRefInvestWorksDescription) {
		this.planRefInvestWorksDescription = planRefInvestWorksDescription;
	}

	public int getPlanRefServicesFSideFinId(){
		return planRefServicesFSideFinId;
	}

	public void setPlanRefServicesFSideFinId(int planRefServicesFSideFinId) {
		this.planRefServicesFSideFinId = planRefServicesFSideFinId;
	}

	public String getPlanRefServicesFSideCnNum(){
		return planRefServicesFSideCnNum;
	}

	public void setPlanRefServicesFSideCnNum(String planRefServicesFSideCnNum) {
		this.planRefServicesFSideCnNum = planRefServicesFSideCnNum;
	}

	public BigDecimal getPlanRefTotalTimeHours(){
		return planRefTotalTimeHours;
	}

	public void setPlanRefTotalTimeHours(BigDecimal planRefTotalTimeHours) {
		this.planRefTotalTimeHours = planRefTotalTimeHours;
	}

	public BigDecimal getPlanRefTotalTimeDays(){
		return planRefTotalTimeDays;
	}

	public void setPlanRefTotalTimeDays(BigDecimal planRefTotalTimeDays) {
		this.planRefTotalTimeDays = planRefTotalTimeDays;
	}

	public String getPlanRefInvestItemNumber(){
		return planRefInvestItemNumber;
	}

	public void setPlanRefInvestItemNumber(String planRefInvestItemNumber) {
		this.planRefInvestItemNumber = planRefInvestItemNumber;
	}



}
