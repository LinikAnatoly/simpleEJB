
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTravelSheetItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENTravelSheetItemShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String travelFrom;
	public String travelTo;
	public Date timeStart ;
	public Date timeFinal ;
	public BigDecimal speedometerStart;
	public BigDecimal speedometerFinal;
	public BigDecimal fuelCounterStart;
	public BigDecimal fuelCounterFinal;
	public BigDecimal sumDistances;
	public BigDecimal sumMachineHours;
	public BigDecimal heatingTime;
	public BigDecimal rashodProbeg;
	public BigDecimal rashodWork;
	public BigDecimal transportKoef;
	public BigDecimal distanceByGPS;
	public BigDecimal hoursByGPS;
	public BigDecimal hoursInMotionByGPS;
	public BigDecimal hoursStopWorkByGPS;
	public BigDecimal hoursStopOffByGPS;
	public int travelOrder = Integer.MIN_VALUE;
	public Date dateEdit ;
	public String userGen;
	public int parentItemRefCode = Integer.MIN_VALUE;
	public String parentItemRefTravelFrom;
	public String parentItemRefTravelTo;
	public Date parentItemRefTimeStart;
	public Date parentItemRefTimeFinal;
	public BigDecimal parentItemRefSpeedometerStart;
	public BigDecimal parentItemRefSpeedometerFinal;
	public BigDecimal parentItemRefFuelCounterStart;
	public BigDecimal parentItemRefFuelCounterFinal;
	public BigDecimal parentItemRefSumDistances;
	public BigDecimal parentItemRefSumMachineHours;
	public BigDecimal parentItemRefHeatingTime;
	public BigDecimal parentItemRefRashodProbeg;
	public BigDecimal parentItemRefRashodWork;
	public BigDecimal parentItemRefTransportKoef;
	public BigDecimal parentItemRefDistanceByGPS;
	public BigDecimal parentItemRefHoursByGPS;
	public BigDecimal parentItemRefHoursInMotionByGPS;
	public BigDecimal parentItemRefHoursStopWorkByGPS;
	public BigDecimal parentItemRefHoursStopOffByGPS;
	public int parentItemRefTravelOrder = Integer.MIN_VALUE;
	public Date parentItemRefDateEdit;
	public String parentItemRefUserGen;
	public int travelSheetRefCode = Integer.MIN_VALUE;
	public String travelSheetRefNumberGen;
	public Date travelSheetRefDateStart;
	public Date travelSheetRefDateFinal;
	public BigDecimal travelSheetRefSpeedometerStart;
	public BigDecimal travelSheetRefSpeedometerFinal;
	public BigDecimal travelSheetRefFuelCounterStart;
	public BigDecimal travelSheetRefFuelCounterFinal;
	public Date travelSheetRefTimeStart;
	public Date travelSheetRefTimeFinal;
	public Date travelSheetRefDateEdit;
	public String travelSheetRefUserGen;
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
	public int kindRefCode = Integer.MIN_VALUE;
	public String kindRefName;
	public int statusRefCode = Integer.MIN_VALUE;
	public String statusRefName;

    //////////////////////////////
    public String workOrderNumber;
    
    public BigDecimal estimateCount;
    public BigDecimal finmaterialsCount;
    
    
    public BigDecimal getEstimateCount() {
		return estimateCount;
	}

	public void setEstimateCount(BigDecimal estimateCount) {
		this.estimateCount = estimateCount;
	}

	public BigDecimal getFinmaterialsCount() {
		return finmaterialsCount;
	}

	public void setFinmaterialsCount(BigDecimal finmaterialsCount) {
		this.finmaterialsCount = finmaterialsCount;
	}

	public String getWorkOrderNumber() {
		return workOrderNumber;
	}

	public void setWorkOrderNumber(String workOrderNumber) {
		this.workOrderNumber = workOrderNumber;
	}
 
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getTravelFrom() {
		return travelFrom;
	}

	public void setTravelFrom(String travelFrom) {
		this.travelFrom = travelFrom;
	}

	public String getTravelTo() {
		return travelTo;
	}

	public void setTravelTo(String travelTo) {
		this.travelTo = travelTo;
	}

	public Date getTimeStart() {
		return timeStart;
	}

	public void setTimeStart(Date timeStart) {
		this.timeStart = timeStart;
	}

	public Date getTimeFinal() {
		return timeFinal;
	}

	public void setTimeFinal(Date timeFinal) {
		this.timeFinal = timeFinal;
	}

	public BigDecimal getSpeedometerStart() {
		return speedometerStart;
	}

	public void setSpeedometerStart(BigDecimal speedometerStart) {
		this.speedometerStart = speedometerStart;
	}

	public BigDecimal getSpeedometerFinal() {
		return speedometerFinal;
	}

	public void setSpeedometerFinal(BigDecimal speedometerFinal) {
		this.speedometerFinal = speedometerFinal;
	}

	public BigDecimal getFuelCounterStart() {
		return fuelCounterStart;
	}

	public void setFuelCounterStart(BigDecimal fuelCounterStart) {
		this.fuelCounterStart = fuelCounterStart;
	}

	public BigDecimal getFuelCounterFinal() {
		return fuelCounterFinal;
	}

	public void setFuelCounterFinal(BigDecimal fuelCounterFinal) {
		this.fuelCounterFinal = fuelCounterFinal;
	}

	public BigDecimal getSumDistances() {
		return sumDistances;
	}

	public void setSumDistances(BigDecimal sumDistances) {
		this.sumDistances = sumDistances;
	}

	public BigDecimal getSumMachineHours() {
		return sumMachineHours;
	}

	public void setSumMachineHours(BigDecimal sumMachineHours) {
		this.sumMachineHours = sumMachineHours;
	}

	public BigDecimal getHeatingTime() {
		return heatingTime;
	}

	public void setHeatingTime(BigDecimal heatingTime) {
		this.heatingTime = heatingTime;
	}


	public BigDecimal getRashodProbeg() {
		return rashodProbeg;
	}

	public void setRashodProbeg(BigDecimal rashodProbeg) {
		this.rashodProbeg = rashodProbeg;
	}

	public BigDecimal getRashodWork() {
		return rashodWork;
	}

	public void setRashodWork(BigDecimal rashodWork) {
		this.rashodWork = rashodWork;
	}

	public BigDecimal getTransportKoef() {
		return transportKoef;
	}

	public void setTransportKoef(BigDecimal transportKoef) {
		this.transportKoef = transportKoef;
	}

	public BigDecimal getDistanceByGPS() {
		return distanceByGPS;
	}

	public void setDistanceByGPS(BigDecimal distanceByGPS) {
		this.distanceByGPS = distanceByGPS;
	}

	public BigDecimal getHoursByGPS() {
		return hoursByGPS;
	}

	public void setHoursByGPS(BigDecimal hoursByGPS) {
		this.hoursByGPS = hoursByGPS;
	}

	public BigDecimal getHoursInMotionByGPS() {
		return hoursInMotionByGPS;
	}

	public void setHoursInMotionByGPS(BigDecimal hoursInMotionByGPS) {
		this.hoursInMotionByGPS = hoursInMotionByGPS;
	}

	public BigDecimal getHoursStopWorkByGPS() {
		return hoursStopWorkByGPS;
	}

	public void setHoursStopWorkByGPS(BigDecimal hoursStopWorkByGPS) {
		this.hoursStopWorkByGPS = hoursStopWorkByGPS;
	}

	public BigDecimal getHoursStopOffByGPS() {
		return hoursStopOffByGPS;
	}

	public void setHoursStopOffByGPS(BigDecimal hoursStopOffByGPS) {
		this.hoursStopOffByGPS = hoursStopOffByGPS;
	}

	public int getTravelOrder() {
		return travelOrder;
	}

	public void setTravelOrder(int travelOrder) {
		this.travelOrder = travelOrder;
	}

	public Date getDateEdit() {
		return dateEdit;
	}

	public void setDateEdit(Date dateEdit) {
		this.dateEdit = dateEdit;
	}

	public String getUserGen() {
		return userGen;
	}

	public void setUserGen(String userGen) {
		this.userGen = userGen;
	}



	public int getParentItemRefCode(){
		return parentItemRefCode;
	}

	public void setParentItemRefCode(int parentItemRefCode) {
		this.parentItemRefCode = parentItemRefCode;
	}

	public String getParentItemRefTravelFrom(){
		return parentItemRefTravelFrom;
	}

	public void setParentItemRefTravelFrom(String parentItemRefTravelFrom) {
		this.parentItemRefTravelFrom = parentItemRefTravelFrom;
	}

	public String getParentItemRefTravelTo(){
		return parentItemRefTravelTo;
	}

	public void setParentItemRefTravelTo(String parentItemRefTravelTo) {
		this.parentItemRefTravelTo = parentItemRefTravelTo;
	}

	public Date getParentItemRefTimeStart(){
		return parentItemRefTimeStart;
	}

	public void setParentItemRefTimeStart(Date parentItemRefTimeStart) {
		this.parentItemRefTimeStart = parentItemRefTimeStart;
	}

	public Date getParentItemRefTimeFinal(){
		return parentItemRefTimeFinal;
	}

	public void setParentItemRefTimeFinal(Date parentItemRefTimeFinal) {
		this.parentItemRefTimeFinal = parentItemRefTimeFinal;
	}

	public BigDecimal getParentItemRefSpeedometerStart(){
		return parentItemRefSpeedometerStart;
	}

	public void setParentItemRefSpeedometerStart(BigDecimal parentItemRefSpeedometerStart) {
		this.parentItemRefSpeedometerStart = parentItemRefSpeedometerStart;
	}

	public BigDecimal getParentItemRefSpeedometerFinal(){
		return parentItemRefSpeedometerFinal;
	}

	public void setParentItemRefSpeedometerFinal(BigDecimal parentItemRefSpeedometerFinal) {
		this.parentItemRefSpeedometerFinal = parentItemRefSpeedometerFinal;
	}

	public BigDecimal getParentItemRefFuelCounterStart(){
		return parentItemRefFuelCounterStart;
	}

	public void setParentItemRefFuelCounterStart(BigDecimal parentItemRefFuelCounterStart) {
		this.parentItemRefFuelCounterStart = parentItemRefFuelCounterStart;
	}

	public BigDecimal getParentItemRefFuelCounterFinal(){
		return parentItemRefFuelCounterFinal;
	}

	public void setParentItemRefFuelCounterFinal(BigDecimal parentItemRefFuelCounterFinal) {
		this.parentItemRefFuelCounterFinal = parentItemRefFuelCounterFinal;
	}

	public BigDecimal getParentItemRefSumDistances(){
		return parentItemRefSumDistances;
	}

	public void setParentItemRefSumDistances(BigDecimal parentItemRefSumDistances) {
		this.parentItemRefSumDistances = parentItemRefSumDistances;
	}

	public BigDecimal getParentItemRefSumMachineHours(){
		return parentItemRefSumMachineHours;
	}

	public void setParentItemRefSumMachineHours(BigDecimal parentItemRefSumMachineHours) {
		this.parentItemRefSumMachineHours = parentItemRefSumMachineHours;
	}

	public BigDecimal getParentItemRefHeatingTime(){
		return parentItemRefHeatingTime;
	}

	public void setParentItemRefHeatingTime(BigDecimal parentItemRefHeatingTime) {
		this.parentItemRefHeatingTime = parentItemRefHeatingTime;
	}

	public BigDecimal getParentItemRefRashodProbeg(){
		return parentItemRefRashodProbeg;
	}

	public void setParentItemRefRashodProbeg(BigDecimal parentItemRefRashodProbeg) {
		this.parentItemRefRashodProbeg = parentItemRefRashodProbeg;
	}

	public BigDecimal getParentItemRefRashodWork(){
		return parentItemRefRashodWork;
	}

	public void setParentItemRefRashodWork(BigDecimal parentItemRefRashodWork) {
		this.parentItemRefRashodWork = parentItemRefRashodWork;
	}

	public BigDecimal getParentItemRefTransportKoef(){
		return parentItemRefTransportKoef;
	}

	public void setParentItemRefTransportKoef(BigDecimal parentItemRefTransportKoef) {
		this.parentItemRefTransportKoef = parentItemRefTransportKoef;
	}

	public BigDecimal getParentItemRefDistanceByGPS(){
		return parentItemRefDistanceByGPS;
	}

	public void setParentItemRefDistanceByGPS(BigDecimal parentItemRefDistanceByGPS) {
		this.parentItemRefDistanceByGPS = parentItemRefDistanceByGPS;
	}

	public BigDecimal getParentItemRefHoursByGPS(){
		return parentItemRefHoursByGPS;
	}

	public void setParentItemRefHoursByGPS(BigDecimal parentItemRefHoursByGPS) {
		this.parentItemRefHoursByGPS = parentItemRefHoursByGPS;
	}

	public BigDecimal getParentItemRefHoursInMotionByGPS(){
		return parentItemRefHoursInMotionByGPS;
	}

	public void setParentItemRefHoursInMotionByGPS(BigDecimal parentItemRefHoursInMotionByGPS) {
		this.parentItemRefHoursInMotionByGPS = parentItemRefHoursInMotionByGPS;
	}

	public BigDecimal getParentItemRefHoursStopWorkByGPS(){
		return parentItemRefHoursStopWorkByGPS;
	}

	public void setParentItemRefHoursStopWorkByGPS(BigDecimal parentItemRefHoursStopWorkByGPS) {
		this.parentItemRefHoursStopWorkByGPS = parentItemRefHoursStopWorkByGPS;
	}

	public BigDecimal getParentItemRefHoursStopOffByGPS(){
		return parentItemRefHoursStopOffByGPS;
	}

	public void setParentItemRefHoursStopOffByGPS(BigDecimal parentItemRefHoursStopOffByGPS) {
		this.parentItemRefHoursStopOffByGPS = parentItemRefHoursStopOffByGPS;
	}

	public int getParentItemRefTravelOrder(){
		return parentItemRefTravelOrder;
	}

	public void setParentItemRefTravelOrder(int parentItemRefTravelOrder) {
		this.parentItemRefTravelOrder = parentItemRefTravelOrder;
	}

	public Date getParentItemRefDateEdit(){
		return parentItemRefDateEdit;
	}

	public void setParentItemRefDateEdit(Date parentItemRefDateEdit) {
		this.parentItemRefDateEdit = parentItemRefDateEdit;
	}

	public String getParentItemRefUserGen(){
		return parentItemRefUserGen;
	}

	public void setParentItemRefUserGen(String parentItemRefUserGen) {
		this.parentItemRefUserGen = parentItemRefUserGen;
	}

	public int getTravelSheetRefCode(){
		return travelSheetRefCode;
	}

	public void setTravelSheetRefCode(int travelSheetRefCode) {
		this.travelSheetRefCode = travelSheetRefCode;
	}

	public String getTravelSheetRefNumberGen(){
		return travelSheetRefNumberGen;
	}

	public void setTravelSheetRefNumberGen(String travelSheetRefNumberGen) {
		this.travelSheetRefNumberGen = travelSheetRefNumberGen;
	}

	public Date getTravelSheetRefDateStart(){
		return travelSheetRefDateStart;
	}

	public void setTravelSheetRefDateStart(Date travelSheetRefDateStart) {
		this.travelSheetRefDateStart = travelSheetRefDateStart;
	}

	public Date getTravelSheetRefDateFinal(){
		return travelSheetRefDateFinal;
	}

	public void setTravelSheetRefDateFinal(Date travelSheetRefDateFinal) {
		this.travelSheetRefDateFinal = travelSheetRefDateFinal;
	}

	public BigDecimal getTravelSheetRefSpeedometerStart(){
		return travelSheetRefSpeedometerStart;
	}

	public void setTravelSheetRefSpeedometerStart(BigDecimal travelSheetRefSpeedometerStart) {
		this.travelSheetRefSpeedometerStart = travelSheetRefSpeedometerStart;
	}

	public BigDecimal getTravelSheetRefSpeedometerFinal(){
		return travelSheetRefSpeedometerFinal;
	}

	public void setTravelSheetRefSpeedometerFinal(BigDecimal travelSheetRefSpeedometerFinal) {
		this.travelSheetRefSpeedometerFinal = travelSheetRefSpeedometerFinal;
	}

	public BigDecimal getTravelSheetRefFuelCounterStart(){
		return travelSheetRefFuelCounterStart;
	}

	public void setTravelSheetRefFuelCounterStart(BigDecimal travelSheetRefFuelCounterStart) {
		this.travelSheetRefFuelCounterStart = travelSheetRefFuelCounterStart;
	}

	public BigDecimal getTravelSheetRefFuelCounterFinal(){
		return travelSheetRefFuelCounterFinal;
	}

	public void setTravelSheetRefFuelCounterFinal(BigDecimal travelSheetRefFuelCounterFinal) {
		this.travelSheetRefFuelCounterFinal = travelSheetRefFuelCounterFinal;
	}

	public Date getTravelSheetRefTimeStart(){
		return travelSheetRefTimeStart;
	}

	public void setTravelSheetRefTimeStart(Date travelSheetRefTimeStart) {
		this.travelSheetRefTimeStart = travelSheetRefTimeStart;
	}

	public Date getTravelSheetRefTimeFinal(){
		return travelSheetRefTimeFinal;
	}

	public void setTravelSheetRefTimeFinal(Date travelSheetRefTimeFinal) {
		this.travelSheetRefTimeFinal = travelSheetRefTimeFinal;
	}

	public Date getTravelSheetRefDateEdit(){
		return travelSheetRefDateEdit;
	}

	public void setTravelSheetRefDateEdit(Date travelSheetRefDateEdit) {
		this.travelSheetRefDateEdit = travelSheetRefDateEdit;
	}

	public String getTravelSheetRefUserGen(){
		return travelSheetRefUserGen;
	}

	public void setTravelSheetRefUserGen(String travelSheetRefUserGen) {
		this.travelSheetRefUserGen = travelSheetRefUserGen;
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

	public int getKindRefCode(){
		return kindRefCode;
	}

	public void setKindRefCode(int kindRefCode) {
		this.kindRefCode = kindRefCode;
	}

	public String getKindRefName(){
		return kindRefName;
	}

	public void setKindRefName(String kindRefName) {
		this.kindRefName = kindRefName;
	}

	public int getStatusRefCode(){
		return statusRefCode;
	}

	public void setStatusRefCode(int statusRefCode) {
		this.statusRefCode = statusRefCode;
	}

	public String getStatusRefName(){
		return statusRefName;
	}

	public void setStatusRefName(String statusRefName) {
		this.statusRefName = statusRefName;
	}



}
