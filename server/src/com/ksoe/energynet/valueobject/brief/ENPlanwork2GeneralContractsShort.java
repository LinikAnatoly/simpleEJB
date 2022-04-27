
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENPlanwork2GeneralContracts;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENPlanwork2GeneralContractsShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String userGen;
	public Date dateEdit ;
	public int generalContractRefCode = Integer.MIN_VALUE;
	public int generalContractRefFinDocID = Integer.MIN_VALUE;
	public String generalContractRefFinDocCode;
	public String generalContractRefContractNumber;
	public Date generalContractRefContractDate;
	public String generalContractRefCommentGen;
	public int generalContractRefPartnerId = Integer.MIN_VALUE;
	public String generalContractRefPartnerCode;
	public String generalContractRefPartnerName;
	public Date generalContractRefContractRegDate;
	public Date generalContractRefContractStartDate;
	public Date generalContractRefContractEndDate;
	public String generalContractRefAxContractId;
	public String generalContractRefAxContractCode;
	public String generalContractRefAxContractNumber;
	public String generalContractRefAxContractAccount;
	public Date generalContractRefAxContractDate;
	public String generalContractRefAxContractCommentGen;
	public String generalContractRefAxContractGroupCode;
	public String generalContractRefAxPartnerCode;
	public String generalContractRefAxPartnerName;
	public String generalContractRefUserGen;
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


	public void setGeneralContractRefCode(int aValue){
		generalContractRefCode = aValue;
	}
	public int getGeneralContractRefCode(){
		return generalContractRefCode;
	}

	public void setGeneralContractRefFinDocID(int aValue){
		generalContractRefFinDocID = aValue;
	}
	public int getGeneralContractRefFinDocID(){
		return generalContractRefFinDocID;
	}

	public void setGeneralContractRefFinDocCode(String aValue){
		generalContractRefFinDocCode = aValue;
	}
	public String getGeneralContractRefFinDocCode(){
		return generalContractRefFinDocCode;
	}

	public void setGeneralContractRefContractNumber(String aValue){
		generalContractRefContractNumber = aValue;
	}
	public String getGeneralContractRefContractNumber(){
		return generalContractRefContractNumber;
	}

	public void setGeneralContractRefContractDate(Date aValue){
		generalContractRefContractDate = aValue;
	}
	public Date getGeneralContractRefContractDate(){
		return generalContractRefContractDate;
	}

	public void setGeneralContractRefCommentGen(String aValue){
		generalContractRefCommentGen = aValue;
	}
	public String getGeneralContractRefCommentGen(){
		return generalContractRefCommentGen;
	}

	public void setGeneralContractRefPartnerId(int aValue){
		generalContractRefPartnerId = aValue;
	}
	public int getGeneralContractRefPartnerId(){
		return generalContractRefPartnerId;
	}

	public void setGeneralContractRefPartnerCode(String aValue){
		generalContractRefPartnerCode = aValue;
	}
	public String getGeneralContractRefPartnerCode(){
		return generalContractRefPartnerCode;
	}

	public void setGeneralContractRefPartnerName(String aValue){
		generalContractRefPartnerName = aValue;
	}
	public String getGeneralContractRefPartnerName(){
		return generalContractRefPartnerName;
	}

	public void setGeneralContractRefContractRegDate(Date aValue){
		generalContractRefContractRegDate = aValue;
	}
	public Date getGeneralContractRefContractRegDate(){
		return generalContractRefContractRegDate;
	}

	public void setGeneralContractRefContractStartDate(Date aValue){
		generalContractRefContractStartDate = aValue;
	}
	public Date getGeneralContractRefContractStartDate(){
		return generalContractRefContractStartDate;
	}

	public void setGeneralContractRefContractEndDate(Date aValue){
		generalContractRefContractEndDate = aValue;
	}
	public Date getGeneralContractRefContractEndDate(){
		return generalContractRefContractEndDate;
	}

	public void setGeneralContractRefAxContractId(String aValue){
		generalContractRefAxContractId = aValue;
	}
	public String getGeneralContractRefAxContractId(){
		return generalContractRefAxContractId;
	}

	public void setGeneralContractRefAxContractCode(String aValue){
		generalContractRefAxContractCode = aValue;
	}
	public String getGeneralContractRefAxContractCode(){
		return generalContractRefAxContractCode;
	}

	public void setGeneralContractRefAxContractNumber(String aValue){
		generalContractRefAxContractNumber = aValue;
	}
	public String getGeneralContractRefAxContractNumber(){
		return generalContractRefAxContractNumber;
	}

	public void setGeneralContractRefAxContractAccount(String aValue){
		generalContractRefAxContractAccount = aValue;
	}
	public String getGeneralContractRefAxContractAccount(){
		return generalContractRefAxContractAccount;
	}

	public void setGeneralContractRefAxContractDate(Date aValue){
		generalContractRefAxContractDate = aValue;
	}
	public Date getGeneralContractRefAxContractDate(){
		return generalContractRefAxContractDate;
	}

	public void setGeneralContractRefAxContractCommentGen(String aValue){
		generalContractRefAxContractCommentGen = aValue;
	}
	public String getGeneralContractRefAxContractCommentGen(){
		return generalContractRefAxContractCommentGen;
	}

	public void setGeneralContractRefAxContractGroupCode(String aValue){
		generalContractRefAxContractGroupCode = aValue;
	}
	public String getGeneralContractRefAxContractGroupCode(){
		return generalContractRefAxContractGroupCode;
	}

	public void setGeneralContractRefAxPartnerCode(String aValue){
		generalContractRefAxPartnerCode = aValue;
	}
	public String getGeneralContractRefAxPartnerCode(){
		return generalContractRefAxPartnerCode;
	}

	public void setGeneralContractRefAxPartnerName(String aValue){
		generalContractRefAxPartnerName = aValue;
	}
	public String getGeneralContractRefAxPartnerName(){
		return generalContractRefAxPartnerName;
	}

	public void setGeneralContractRefUserGen(String aValue){
		generalContractRefUserGen = aValue;
	}
	public String getGeneralContractRefUserGen(){
		return generalContractRefUserGen;
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
