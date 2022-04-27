
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENRegForSupplierItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENRegForSupplierItemShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String recordpointEic;
	public String customerUid;
	public Date datePlanned ;
	public Date dateComplete ;
	public String description;
	public String calcNumber;
	public String calcName;
	public BigDecimal costWithoutVAT;
	public BigDecimal costVAT;
	public BigDecimal costWithVAT;
	public int dhDisconnectionCode = Integer.MIN_VALUE;
	public String commentGen;
	public String userGen;
	public Date dateEdit ;
	public int registryRefCode = Integer.MIN_VALUE;
	public String registryRefNumberGen;
	public Date registryRefDateFrom;
	public Date registryRefDateTo;
	public int registryRefSupplierCode = Integer.MIN_VALUE;
	public String registryRefCommentGen;
	public String registryRefUserGen;
	public Date registryRefDateEdit;
	public int registryTypeRefCode = Integer.MIN_VALUE;
	public String registryTypeRefName;
	public String registryTypeRefDescription;
	public int initiatorRefCode = Integer.MIN_VALUE;
	public String initiatorRefName;
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
	public int factRefCode = Integer.MIN_VALUE;
	public Date factRefDateGen;
	public Date factRefDateStart;
	public Date factRefDateFinal;
	public int factRefYearGen = Integer.MIN_VALUE;
	public int factRefMonthGen = Integer.MIN_VALUE;
	public int factRefYearOriginal = Integer.MIN_VALUE;
	public int factRefMonthOriginal = Integer.MIN_VALUE;
	public String factRefUserGen;
	public Date factRefDateEdit;
	public String factRefWorkOrderNumber;
	public Date factRefDateWorkOrder;
	public String factRefPriConnectionNumber;
	public Date factRefDateEndPriConnection;
	public String factRefInvestWorksDescription;
	public int factRefServicesFSideFinId = Integer.MIN_VALUE;
	public String factRefServicesFSideCnNum;
	public BigDecimal factRefTotalTimeHours;
	public BigDecimal factRefTotalTimeDays;
	public String factRefInvestItemNumber;
	public int classificationTypeRefCode = Integer.MIN_VALUE;
	public String classificationTypeRefName;
	public String classificationTypeRefKod;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setRecordpointEic(String aValue){
		recordpointEic = aValue;
	}

	public String getRecordpointEic(){
		return recordpointEic;
	}

	public void setCustomerUid(String aValue){
		customerUid = aValue;
	}

	public String getCustomerUid(){
		return customerUid;
	}

	public void setDatePlanned(Date aValue){
		datePlanned = aValue;
	}

	public Date getDatePlanned(){
		return datePlanned;
	}

	public void setDateComplete(Date aValue){
		dateComplete = aValue;
	}

	public Date getDateComplete(){
		return dateComplete;
	}

	public void setDescription(String aValue){
		description = aValue;
	}

	public String getDescription(){
		return description;
	}

	public void setCalcNumber(String aValue){
		calcNumber = aValue;
	}

	public String getCalcNumber(){
		return calcNumber;
	}

	public void setCalcName(String aValue){
		calcName = aValue;
	}

	public String getCalcName(){
		return calcName;
	}

	public void setCostWithoutVAT(BigDecimal aValue){
		costWithoutVAT = aValue;
	}

	public BigDecimal getCostWithoutVAT(){
		return costWithoutVAT;
	}

	public void setCostVAT(BigDecimal aValue){
		costVAT = aValue;
	}

	public BigDecimal getCostVAT(){
		return costVAT;
	}

	public void setCostWithVAT(BigDecimal aValue){
		costWithVAT = aValue;
	}

	public BigDecimal getCostWithVAT(){
		return costWithVAT;
	}

	public void setDhDisconnectionCode(int aValue){
		dhDisconnectionCode = aValue;
	}

	public int getDhDisconnectionCode(){
		return dhDisconnectionCode;
	}

	public void setCommentGen(String aValue){
		commentGen = aValue;
	}

	public String getCommentGen(){
		return commentGen;
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


	public void setRegistryRefCode(int aValue){
		registryRefCode = aValue;
	}
	public int getRegistryRefCode(){
		return registryRefCode;
	}

	public void setRegistryRefNumberGen(String aValue){
		registryRefNumberGen = aValue;
	}
	public String getRegistryRefNumberGen(){
		return registryRefNumberGen;
	}

	public void setRegistryRefDateFrom(Date aValue){
		registryRefDateFrom = aValue;
	}
	public Date getRegistryRefDateFrom(){
		return registryRefDateFrom;
	}

	public void setRegistryRefDateTo(Date aValue){
		registryRefDateTo = aValue;
	}
	public Date getRegistryRefDateTo(){
		return registryRefDateTo;
	}

	public void setRegistryRefSupplierCode(int aValue){
		registryRefSupplierCode = aValue;
	}
	public int getRegistryRefSupplierCode(){
		return registryRefSupplierCode;
	}

	public void setRegistryRefCommentGen(String aValue){
		registryRefCommentGen = aValue;
	}
	public String getRegistryRefCommentGen(){
		return registryRefCommentGen;
	}

	public void setRegistryRefUserGen(String aValue){
		registryRefUserGen = aValue;
	}
	public String getRegistryRefUserGen(){
		return registryRefUserGen;
	}

	public void setRegistryRefDateEdit(Date aValue){
		registryRefDateEdit = aValue;
	}
	public Date getRegistryRefDateEdit(){
		return registryRefDateEdit;
	}

	public void setRegistryTypeRefCode(int aValue){
		registryTypeRefCode = aValue;
	}
	public int getRegistryTypeRefCode(){
		return registryTypeRefCode;
	}

	public void setRegistryTypeRefName(String aValue){
		registryTypeRefName = aValue;
	}
	public String getRegistryTypeRefName(){
		return registryTypeRefName;
	}

	public void setRegistryTypeRefDescription(String aValue){
		registryTypeRefDescription = aValue;
	}
	public String getRegistryTypeRefDescription(){
		return registryTypeRefDescription;
	}

	public void setInitiatorRefCode(int aValue){
		initiatorRefCode = aValue;
	}
	public int getInitiatorRefCode(){
		return initiatorRefCode;
	}

	public void setInitiatorRefName(String aValue){
		initiatorRefName = aValue;
	}
	public String getInitiatorRefName(){
		return initiatorRefName;
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

	public void setFactRefCode(int aValue){
		factRefCode = aValue;
	}
	public int getFactRefCode(){
		return factRefCode;
	}

	public void setFactRefDateGen(Date aValue){
		factRefDateGen = aValue;
	}
	public Date getFactRefDateGen(){
		return factRefDateGen;
	}

	public void setFactRefDateStart(Date aValue){
		factRefDateStart = aValue;
	}
	public Date getFactRefDateStart(){
		return factRefDateStart;
	}

	public void setFactRefDateFinal(Date aValue){
		factRefDateFinal = aValue;
	}
	public Date getFactRefDateFinal(){
		return factRefDateFinal;
	}

	public void setFactRefYearGen(int aValue){
		factRefYearGen = aValue;
	}
	public int getFactRefYearGen(){
		return factRefYearGen;
	}

	public void setFactRefMonthGen(int aValue){
		factRefMonthGen = aValue;
	}
	public int getFactRefMonthGen(){
		return factRefMonthGen;
	}

	public void setFactRefYearOriginal(int aValue){
		factRefYearOriginal = aValue;
	}
	public int getFactRefYearOriginal(){
		return factRefYearOriginal;
	}

	public void setFactRefMonthOriginal(int aValue){
		factRefMonthOriginal = aValue;
	}
	public int getFactRefMonthOriginal(){
		return factRefMonthOriginal;
	}

	public void setFactRefUserGen(String aValue){
		factRefUserGen = aValue;
	}
	public String getFactRefUserGen(){
		return factRefUserGen;
	}

	public void setFactRefDateEdit(Date aValue){
		factRefDateEdit = aValue;
	}
	public Date getFactRefDateEdit(){
		return factRefDateEdit;
	}

	public void setFactRefWorkOrderNumber(String aValue){
		factRefWorkOrderNumber = aValue;
	}
	public String getFactRefWorkOrderNumber(){
		return factRefWorkOrderNumber;
	}

	public void setFactRefDateWorkOrder(Date aValue){
		factRefDateWorkOrder = aValue;
	}
	public Date getFactRefDateWorkOrder(){
		return factRefDateWorkOrder;
	}

	public void setFactRefPriConnectionNumber(String aValue){
		factRefPriConnectionNumber = aValue;
	}
	public String getFactRefPriConnectionNumber(){
		return factRefPriConnectionNumber;
	}

	public void setFactRefDateEndPriConnection(Date aValue){
		factRefDateEndPriConnection = aValue;
	}
	public Date getFactRefDateEndPriConnection(){
		return factRefDateEndPriConnection;
	}

	public void setFactRefInvestWorksDescription(String aValue){
		factRefInvestWorksDescription = aValue;
	}
	public String getFactRefInvestWorksDescription(){
		return factRefInvestWorksDescription;
	}

	public void setFactRefServicesFSideFinId(int aValue){
		factRefServicesFSideFinId = aValue;
	}
	public int getFactRefServicesFSideFinId(){
		return factRefServicesFSideFinId;
	}

	public void setFactRefServicesFSideCnNum(String aValue){
		factRefServicesFSideCnNum = aValue;
	}
	public String getFactRefServicesFSideCnNum(){
		return factRefServicesFSideCnNum;
	}

	public void setFactRefTotalTimeHours(BigDecimal aValue){
		factRefTotalTimeHours = aValue;
	}
	public BigDecimal getFactRefTotalTimeHours(){
		return factRefTotalTimeHours;
	}

	public void setFactRefTotalTimeDays(BigDecimal aValue){
		factRefTotalTimeDays = aValue;
	}
	public BigDecimal getFactRefTotalTimeDays(){
		return factRefTotalTimeDays;
	}

	public void setFactRefInvestItemNumber(String aValue){
		factRefInvestItemNumber = aValue;
	}
	public String getFactRefInvestItemNumber(){
		return factRefInvestItemNumber;
	}

	public void setClassificationTypeRefCode(int aValue){
		classificationTypeRefCode = aValue;
	}
	public int getClassificationTypeRefCode(){
		return classificationTypeRefCode;
	}

	public void setClassificationTypeRefName(String aValue){
		classificationTypeRefName = aValue;
	}
	public String getClassificationTypeRefName(){
		return classificationTypeRefName;
	}

	public void setClassificationTypeRefKod(String aValue){
		classificationTypeRefKod = aValue;
	}
	public String getClassificationTypeRefKod(){
		return classificationTypeRefKod;
	}



}
