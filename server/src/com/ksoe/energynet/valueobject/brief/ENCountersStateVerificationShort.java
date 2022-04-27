
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENCountersStateVerification;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENCountersStateVerificationShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String invNumber;
	public String name;
	public String buildNumber;
	public BigDecimal priceGen;
	public String userAdd;
	public Date dateAdd ;
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
	public int actRefCode = Integer.MIN_VALUE;
	public String actRefNumberGen;
	public Date actRefDateGen;
	public int actRefFinDocCode = Integer.MIN_VALUE;
	public int actRefFinDocMechanicCode = Integer.MIN_VALUE;
	public String actRefFinMolName;
	public String actRefFinMechanicName;
	public String actRefInvNumber;
	public String actRefUserGen;
	public Date actRefDateEdit;
	public Date actRefDateAct;
	public String actRefMolCodeObject;
	public int fkOrderRefCode = Integer.MIN_VALUE;
	public String fkOrderRefNumberDoc;
	public Date fkOrderRefDateGen;
	public Date fkOrderRefDateShipment;
	public Date fkOrderRefDatePosting;
	public String fkOrderRefMolOutCode;
	public String fkOrderRefMolOutName;
	public String fkOrderRefMolInCode;
	public String fkOrderRefMolInName;
	public String fkOrderRefExpeditorCode;
	public String fkOrderRefExpeditorName;
	public String fkOrderRefWarrantNumber;
	public Date fkOrderRefWarrantDate;
	public String fkOrderRefWarrantFIO;
	public BigDecimal fkOrderRefSumWithoutNds;
	public BigDecimal fkOrderRefSumNds;
	public int fkOrderRefNdsPercent = Integer.MIN_VALUE;
	public Date fkOrderRefDateAdd;
	public String fkOrderRefUserAdd;
	public Date fkOrderRefDateEdit;
	public String fkOrderRefUserGen;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setInvNumber(String aValue){
		invNumber = aValue;
	}

	public String getInvNumber(){
		return invNumber;
	}

	public void setName(String aValue){
		name = aValue;
	}

	public String getName(){
		return name;
	}

	public void setBuildNumber(String aValue){
		buildNumber = aValue;
	}

	public String getBuildNumber(){
		return buildNumber;
	}

	public void setPriceGen(BigDecimal aValue){
		priceGen = aValue;
	}

	public BigDecimal getPriceGen(){
		return priceGen;
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

	public void setActRefCode(int aValue){
		actRefCode = aValue;
	}
	public int getActRefCode(){
		return actRefCode;
	}

	public void setActRefNumberGen(String aValue){
		actRefNumberGen = aValue;
	}
	public String getActRefNumberGen(){
		return actRefNumberGen;
	}

	public void setActRefDateGen(Date aValue){
		actRefDateGen = aValue;
	}
	public Date getActRefDateGen(){
		return actRefDateGen;
	}

	public void setActRefFinDocCode(int aValue){
		actRefFinDocCode = aValue;
	}
	public int getActRefFinDocCode(){
		return actRefFinDocCode;
	}

	public void setActRefFinDocMechanicCode(int aValue){
		actRefFinDocMechanicCode = aValue;
	}
	public int getActRefFinDocMechanicCode(){
		return actRefFinDocMechanicCode;
	}

	public void setActRefFinMolName(String aValue){
		actRefFinMolName = aValue;
	}
	public String getActRefFinMolName(){
		return actRefFinMolName;
	}

	public void setActRefFinMechanicName(String aValue){
		actRefFinMechanicName = aValue;
	}
	public String getActRefFinMechanicName(){
		return actRefFinMechanicName;
	}

	public void setActRefInvNumber(String aValue){
		actRefInvNumber = aValue;
	}
	public String getActRefInvNumber(){
		return actRefInvNumber;
	}

	public void setActRefUserGen(String aValue){
		actRefUserGen = aValue;
	}
	public String getActRefUserGen(){
		return actRefUserGen;
	}

	public void setActRefDateEdit(Date aValue){
		actRefDateEdit = aValue;
	}
	public Date getActRefDateEdit(){
		return actRefDateEdit;
	}

	public void setActRefDateAct(Date aValue){
		actRefDateAct = aValue;
	}
	public Date getActRefDateAct(){
		return actRefDateAct;
	}

	public void setActRefMolCodeObject(String aValue){
		actRefMolCodeObject = aValue;
	}
	public String getActRefMolCodeObject(){
		return actRefMolCodeObject;
	}

	public void setFkOrderRefCode(int aValue){
		fkOrderRefCode = aValue;
	}
	public int getFkOrderRefCode(){
		return fkOrderRefCode;
	}

	public void setFkOrderRefNumberDoc(String aValue){
		fkOrderRefNumberDoc = aValue;
	}
	public String getFkOrderRefNumberDoc(){
		return fkOrderRefNumberDoc;
	}

	public void setFkOrderRefDateGen(Date aValue){
		fkOrderRefDateGen = aValue;
	}
	public Date getFkOrderRefDateGen(){
		return fkOrderRefDateGen;
	}

	public void setFkOrderRefDateShipment(Date aValue){
		fkOrderRefDateShipment = aValue;
	}
	public Date getFkOrderRefDateShipment(){
		return fkOrderRefDateShipment;
	}

	public void setFkOrderRefDatePosting(Date aValue){
		fkOrderRefDatePosting = aValue;
	}
	public Date getFkOrderRefDatePosting(){
		return fkOrderRefDatePosting;
	}

	public void setFkOrderRefMolOutCode(String aValue){
		fkOrderRefMolOutCode = aValue;
	}
	public String getFkOrderRefMolOutCode(){
		return fkOrderRefMolOutCode;
	}

	public void setFkOrderRefMolOutName(String aValue){
		fkOrderRefMolOutName = aValue;
	}
	public String getFkOrderRefMolOutName(){
		return fkOrderRefMolOutName;
	}

	public void setFkOrderRefMolInCode(String aValue){
		fkOrderRefMolInCode = aValue;
	}
	public String getFkOrderRefMolInCode(){
		return fkOrderRefMolInCode;
	}

	public void setFkOrderRefMolInName(String aValue){
		fkOrderRefMolInName = aValue;
	}
	public String getFkOrderRefMolInName(){
		return fkOrderRefMolInName;
	}

	public void setFkOrderRefExpeditorCode(String aValue){
		fkOrderRefExpeditorCode = aValue;
	}
	public String getFkOrderRefExpeditorCode(){
		return fkOrderRefExpeditorCode;
	}

	public void setFkOrderRefExpeditorName(String aValue){
		fkOrderRefExpeditorName = aValue;
	}
	public String getFkOrderRefExpeditorName(){
		return fkOrderRefExpeditorName;
	}

	public void setFkOrderRefWarrantNumber(String aValue){
		fkOrderRefWarrantNumber = aValue;
	}
	public String getFkOrderRefWarrantNumber(){
		return fkOrderRefWarrantNumber;
	}

	public void setFkOrderRefWarrantDate(Date aValue){
		fkOrderRefWarrantDate = aValue;
	}
	public Date getFkOrderRefWarrantDate(){
		return fkOrderRefWarrantDate;
	}

	public void setFkOrderRefWarrantFIO(String aValue){
		fkOrderRefWarrantFIO = aValue;
	}
	public String getFkOrderRefWarrantFIO(){
		return fkOrderRefWarrantFIO;
	}

	public void setFkOrderRefSumWithoutNds(BigDecimal aValue){
		fkOrderRefSumWithoutNds = aValue;
	}
	public BigDecimal getFkOrderRefSumWithoutNds(){
		return fkOrderRefSumWithoutNds;
	}

	public void setFkOrderRefSumNds(BigDecimal aValue){
		fkOrderRefSumNds = aValue;
	}
	public BigDecimal getFkOrderRefSumNds(){
		return fkOrderRefSumNds;
	}

	public void setFkOrderRefNdsPercent(int aValue){
		fkOrderRefNdsPercent = aValue;
	}
	public int getFkOrderRefNdsPercent(){
		return fkOrderRefNdsPercent;
	}

	public void setFkOrderRefDateAdd(Date aValue){
		fkOrderRefDateAdd = aValue;
	}
	public Date getFkOrderRefDateAdd(){
		return fkOrderRefDateAdd;
	}

	public void setFkOrderRefUserAdd(String aValue){
		fkOrderRefUserAdd = aValue;
	}
	public String getFkOrderRefUserAdd(){
		return fkOrderRefUserAdd;
	}

	public void setFkOrderRefDateEdit(Date aValue){
		fkOrderRefDateEdit = aValue;
	}
	public Date getFkOrderRefDateEdit(){
		return fkOrderRefDateEdit;
	}

	public void setFkOrderRefUserGen(String aValue){
		fkOrderRefUserGen = aValue;
	}
	public String getFkOrderRefUserGen(){
		return fkOrderRefUserGen;
	}



}