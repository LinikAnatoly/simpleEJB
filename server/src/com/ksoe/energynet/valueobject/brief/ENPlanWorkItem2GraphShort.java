
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENPlanWorkItem2Graph;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENPlanWorkItem2GraphShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public Date dayWork ;
	public String userGen;
	public Date dateEdit ;
	public BigDecimal countgen;
	public int planWorkItemRefCode = Integer.MIN_VALUE;
	public BigDecimal planWorkItemRefCountGen;
	public BigDecimal planWorkItemRefTimeGen;
	public BigDecimal planWorkItemRefCostGen;
	public String planWorkItemRefUserGen;
	public Date planWorkItemRefDateEdit;
	public int planWorkRefCode = Integer.MIN_VALUE;
	public Date planWorkRefDateGen;
	public Date planWorkRefDateStart;
	public Date planWorkRefDateFinal;
	public int planWorkRefYearGen = Integer.MIN_VALUE;
	public int planWorkRefMonthGen = Integer.MIN_VALUE;
	public int planWorkRefYearOriginal = Integer.MIN_VALUE;
	public int planWorkRefMonthOriginal = Integer.MIN_VALUE;
	public String planWorkRefUserGen;
	public Date planWorkRefDateEdit;
	public String planWorkRefWorkOrderNumber;
	public Date planWorkRefDateWorkOrder;
	public String planWorkRefPriConnectionNumber;
	public Date planWorkRefDateEndPriConnection;
	public String planWorkRefInvestWorksDescription;
	public int planWorkRefServicesFSideFinId = Integer.MIN_VALUE;
	public String planWorkRefServicesFSideCnNum;
	public BigDecimal planWorkRefTotalTimeHours;
	public BigDecimal planWorkRefTotalTimeDays;
	public String planWorkRefInvestItemNumber;

	
	public String techkartNumber;
	public String tkTechcardName;
	public String tkMeasurementName;
	public BigDecimal enplanworkitemcountgen;
	public BigDecimal tktechcardnormoftime;
	public BigDecimal enplanworkitemtimegen;
	
	public String d1;
	public String d2;
	public String d3;
	public String d4;
	public String d5;
	public String d6;
	public String d7;
	public String d8;
	public String d9;
	public String d10;
	public String d11;
	public String d12;
	public String d13;
	public String d14;
	public String d15;
	public String d16;
	public String d17;
	public String d18;
	public String d19;
	public String d20;
	public String d21;
	public String d22;
	public String d23;
	public String d24;
	public String d25;
	public String d26;
	public String d27;
	public String d28;
	public String d29;
	public String d30;
	public String d31;
	public int lastdayinmonth;
	public String periodenplanwork;
	public BigDecimal possiblecountgen;
	
	public BigDecimal getPossiblecountgen() {
		return possiblecountgen;
	}

	public void setPossiblecountgen(BigDecimal possiblecountgen) {
		this.possiblecountgen = possiblecountgen;
	}

	public String getPeriodenplanwork() {
		return periodenplanwork;
	}

	public void setPeriodenplanwork(String periodenplanwork) {
		this.periodenplanwork = periodenplanwork;
	}

	public int getLastdayinmonth() {
		return lastdayinmonth;
	}

	public void setLastdayinmonth(int lastdayinmonth) {
		this.lastdayinmonth = lastdayinmonth;
	}

	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setDayWork(Date aValue){
		dayWork = aValue;
	}

	public Date getDayWork(){
		return dayWork;
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

	public void setCountgen(BigDecimal aValue){
		countgen = aValue;
	}

	public BigDecimal getCountgen(){
		return countgen;
	}


	public void setPlanWorkItemRefCode(int aValue){
		planWorkItemRefCode = aValue;
	}
	public int getPlanWorkItemRefCode(){
		return planWorkItemRefCode;
	}

	public void setPlanWorkItemRefCountGen(BigDecimal aValue){
		planWorkItemRefCountGen = aValue;
	}
	public BigDecimal getPlanWorkItemRefCountGen(){
		return planWorkItemRefCountGen;
	}

	public void setPlanWorkItemRefTimeGen(BigDecimal aValue){
		planWorkItemRefTimeGen = aValue;
	}
	public BigDecimal getPlanWorkItemRefTimeGen(){
		return planWorkItemRefTimeGen;
	}

	public void setPlanWorkItemRefCostGen(BigDecimal aValue){
		planWorkItemRefCostGen = aValue;
	}
	public BigDecimal getPlanWorkItemRefCostGen(){
		return planWorkItemRefCostGen;
	}

	public void setPlanWorkItemRefUserGen(String aValue){
		planWorkItemRefUserGen = aValue;
	}
	public String getPlanWorkItemRefUserGen(){
		return planWorkItemRefUserGen;
	}

	public void setPlanWorkItemRefDateEdit(Date aValue){
		planWorkItemRefDateEdit = aValue;
	}
	public Date getPlanWorkItemRefDateEdit(){
		return planWorkItemRefDateEdit;
	}

	public void setPlanWorkRefCode(int aValue){
		planWorkRefCode = aValue;
	}
	public int getPlanWorkRefCode(){
		return planWorkRefCode;
	}

	public void setPlanWorkRefDateGen(Date aValue){
		planWorkRefDateGen = aValue;
	}
	public Date getPlanWorkRefDateGen(){
		return planWorkRefDateGen;
	}

	public void setPlanWorkRefDateStart(Date aValue){
		planWorkRefDateStart = aValue;
	}
	public Date getPlanWorkRefDateStart(){
		return planWorkRefDateStart;
	}

	public void setPlanWorkRefDateFinal(Date aValue){
		planWorkRefDateFinal = aValue;
	}
	public Date getPlanWorkRefDateFinal(){
		return planWorkRefDateFinal;
	}

	public void setPlanWorkRefYearGen(int aValue){
		planWorkRefYearGen = aValue;
	}
	public int getPlanWorkRefYearGen(){
		return planWorkRefYearGen;
	}

	public void setPlanWorkRefMonthGen(int aValue){
		planWorkRefMonthGen = aValue;
	}
	public int getPlanWorkRefMonthGen(){
		return planWorkRefMonthGen;
	}

	public void setPlanWorkRefYearOriginal(int aValue){
		planWorkRefYearOriginal = aValue;
	}
	public int getPlanWorkRefYearOriginal(){
		return planWorkRefYearOriginal;
	}

	public void setPlanWorkRefMonthOriginal(int aValue){
		planWorkRefMonthOriginal = aValue;
	}
	public int getPlanWorkRefMonthOriginal(){
		return planWorkRefMonthOriginal;
	}

	public void setPlanWorkRefUserGen(String aValue){
		planWorkRefUserGen = aValue;
	}
	public String getPlanWorkRefUserGen(){
		return planWorkRefUserGen;
	}

	public void setPlanWorkRefDateEdit(Date aValue){
		planWorkRefDateEdit = aValue;
	}
	public Date getPlanWorkRefDateEdit(){
		return planWorkRefDateEdit;
	}

	public void setPlanWorkRefWorkOrderNumber(String aValue){
		planWorkRefWorkOrderNumber = aValue;
	}
	public String getPlanWorkRefWorkOrderNumber(){
		return planWorkRefWorkOrderNumber;
	}

	public void setPlanWorkRefDateWorkOrder(Date aValue){
		planWorkRefDateWorkOrder = aValue;
	}
	public Date getPlanWorkRefDateWorkOrder(){
		return planWorkRefDateWorkOrder;
	}

	public void setPlanWorkRefPriConnectionNumber(String aValue){
		planWorkRefPriConnectionNumber = aValue;
	}
	public String getPlanWorkRefPriConnectionNumber(){
		return planWorkRefPriConnectionNumber;
	}

	public void setPlanWorkRefDateEndPriConnection(Date aValue){
		planWorkRefDateEndPriConnection = aValue;
	}
	public Date getPlanWorkRefDateEndPriConnection(){
		return planWorkRefDateEndPriConnection;
	}

	public void setPlanWorkRefInvestWorksDescription(String aValue){
		planWorkRefInvestWorksDescription = aValue;
	}
	public String getPlanWorkRefInvestWorksDescription(){
		return planWorkRefInvestWorksDescription;
	}

	public void setPlanWorkRefServicesFSideFinId(int aValue){
		planWorkRefServicesFSideFinId = aValue;
	}
	public int getPlanWorkRefServicesFSideFinId(){
		return planWorkRefServicesFSideFinId;
	}

	public void setPlanWorkRefServicesFSideCnNum(String aValue){
		planWorkRefServicesFSideCnNum = aValue;
	}
	public String getPlanWorkRefServicesFSideCnNum(){
		return planWorkRefServicesFSideCnNum;
	}

	public void setPlanWorkRefTotalTimeHours(BigDecimal aValue){
		planWorkRefTotalTimeHours = aValue;
	}
	public BigDecimal getPlanWorkRefTotalTimeHours(){
		return planWorkRefTotalTimeHours;
	}

	public void setPlanWorkRefTotalTimeDays(BigDecimal aValue){
		planWorkRefTotalTimeDays = aValue;
	}
	public BigDecimal getPlanWorkRefTotalTimeDays(){
		return planWorkRefTotalTimeDays;
	}

	public void setPlanWorkRefInvestItemNumber(String aValue){
		planWorkRefInvestItemNumber = aValue;
	}
	public String getPlanWorkRefInvestItemNumber(){
		return planWorkRefInvestItemNumber;
	}

	public String getTechkartNumber() {
		return techkartNumber;
	}

	public void setTechkartNumber(String techkartNumber) {
		this.techkartNumber = techkartNumber;
	}

	public String getTkTechcardName() {
		return tkTechcardName;
	}

	public void setTkTechcardName(String tkTechcardName) {
		this.tkTechcardName = tkTechcardName;
	}

	public String getTkMeasurementName() {
		return tkMeasurementName;
	}

	public void setTkMeasurementName(String tkMeasurementName) {
		this.tkMeasurementName = tkMeasurementName;
	}

	public BigDecimal getEnplanworkitemcountgen() {
		return enplanworkitemcountgen;
	}

	public void setEnplanworkitemcountgen(BigDecimal enplanworkitemcountgen) {
		this.enplanworkitemcountgen = enplanworkitemcountgen;
	}

	public BigDecimal getTktechcardnormoftime() {
		return tktechcardnormoftime;
	}

	public void setTktechcardnormoftime(BigDecimal tktechcardnormoftime) {
		this.tktechcardnormoftime = tktechcardnormoftime;
	}

	public BigDecimal getEnplanworkitemtimegen() {
		return enplanworkitemtimegen;
	}

	public void setEnplanworkitemtimegen(BigDecimal enplanworkitemtimegen) {
		this.enplanworkitemtimegen = enplanworkitemtimegen;
	}

	public String getD1() {
		return d1;
	}

	public void setD1(String d1) {
		this.d1 = d1;
	}

	public String getD2() {
		return d2;
	}

	public void setD2(String d2) {
		this.d2 = d2;
	}

	public String getD3() {
		return d3;
	}

	public void setD3(String d3) {
		this.d3 = d3;
	}

	public String getD4() {
		return d4;
	}

	public void setD4(String d4) {
		this.d4 = d4;
	}

	public String getD5() {
		return d5;
	}

	public void setD5(String d5) {
		this.d5 = d5;
	}

	public String getD6() {
		return d6;
	}

	public void setD6(String d6) {
		this.d6 = d6;
	}

	public String getD7() {
		return d7;
	}

	public void setD7(String d7) {
		this.d7 = d7;
	}

	public String getD8() {
		return d8;
	}

	public void setD8(String d8) {
		this.d8 = d8;
	}

	public String getD9() {
		return d9;
	}

	public void setD9(String d9) {
		this.d9 = d9;
	}

	public String getD10() {
		return d10;
	}

	public void setD10(String d10) {
		this.d10 = d10;
	}

	public String getD11() {
		return d11;
	}

	public void setD11(String d11) {
		this.d11 = d11;
	}

	public String getD12() {
		return d12;
	}

	public void setD12(String d12) {
		this.d12 = d12;
	}

	public String getD13() {
		return d13;
	}

	public void setD13(String d13) {
		this.d13 = d13;
	}

	public String getD14() {
		return d14;
	}

	public void setD14(String d14) {
		this.d14 = d14;
	}

	public String getD15() {
		return d15;
	}

	public void setD15(String d15) {
		this.d15 = d15;
	}

	public String getD16() {
		return d16;
	}

	public void setD16(String d16) {
		this.d16 = d16;
	}

	public String getD17() {
		return d17;
	}

	public void setD17(String d17) {
		this.d17 = d17;
	}

	public String getD18() {
		return d18;
	}

	public void setD18(String d18) {
		this.d18 = d18;
	}

	public String getD19() {
		return d19;
	}

	public void setD19(String d19) {
		this.d19 = d19;
	}

	public String getD20() {
		return d20;
	}

	public void setD20(String d20) {
		this.d20 = d20;
	}

	public String getD21() {
		return d21;
	}

	public void setD21(String d21) {
		this.d21 = d21;
	}

	public String getD22() {
		return d22;
	}

	public void setD22(String d22) {
		this.d22 = d22;
	}

	public String getD23() {
		return d23;
	}

	public void setD23(String d23) {
		this.d23 = d23;
	}

	public String getD24() {
		return d24;
	}

	public void setD24(String d24) {
		this.d24 = d24;
	}

	public String getD25() {
		return d25;
	}

	public void setD25(String d25) {
		this.d25 = d25;
	}

	public String getD26() {
		return d26;
	}

	public void setD26(String d26) {
		this.d26 = d26;
	}

	public String getD27() {
		return d27;
	}

	public void setD27(String d27) {
		this.d27 = d27;
	}

	public String getD28() {
		return d28;
	}

	public void setD28(String d28) {
		this.d28 = d28;
	}

	public String getD29() {
		return d29;
	}

	public void setD29(String d29) {
		this.d29 = d29;
	}

	public String getD30() {
		return d30;
	}

	public void setD30(String d30) {
		this.d30 = d30;
	}

	public String getD31() {
		return d31;
	}

	public void setD31(String d31) {
		this.d31 = d31;
	}



}