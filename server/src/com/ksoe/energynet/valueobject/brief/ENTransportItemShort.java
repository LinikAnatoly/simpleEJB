
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTransportItem;
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENTransportItemShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal distance;
    //public BigDecimal distanceTo;
    //public BigDecimal distanceAlong;
    //public BigDecimal distanceFrom;
    public BigDecimal countWorkGen;
    public BigDecimal countWorkFact;
    public BigDecimal price;
    public BigDecimal cost;
    public String userGen;
    public Date dateEdit;
    public BigDecimal distanceNorm;
    public int amountOfJourneys = Integer.MIN_VALUE;

    public int planRefCode = Integer.MIN_VALUE;
    public Date planRefDateGen;
    public Date planRefDateStart;
    public Date planRefDateFinal;
    public int planRefYearGen = Integer.MIN_VALUE;
    public int planRefMonthGen = Integer.MIN_VALUE;
    public String planRefUserGen;
    public Date planRefDateEdit;
    public int planItemRefCode = Integer.MIN_VALUE;
    public BigDecimal planItemRefCountGen;
    public String planItemRefUserGen;
    public Date planItemRefDateEdit;
    public int transportRealCode = Integer.MIN_VALUE;
    public int trailerTransportRealCode = Integer.MIN_VALUE;
    public String trailerTransportRealName;
    public String trailerTransportRealInvNumber;
    public String trailerTransportRealGosNumber;
    public int isUseTrailer = Integer.MIN_VALUE;


	public int transportCode = Integer.MIN_VALUE;
    public int manningTableCode = Integer.MIN_VALUE;
    public Date manningTableDateStart;
    public Date manningTableDateFinal;
    public int workerFactCode = Integer.MIN_VALUE;
    public String workerFactName;
    public String workerFactTabNumber;
    public int workerFactIsMol = Integer.MIN_VALUE;
    public int typeRefCode = Integer.MIN_VALUE;
    public String typeRefName;

    public int elementCode = Integer.MIN_VALUE;
    public String elementName;
    public String elementInvNumber;

    public int finWorkerCode = Integer.MIN_VALUE;
    public String finWorkerTabNumber;
    public String finWorkerName;
    public String finWorkerPositionName;
    public int finCode = Integer.MIN_VALUE;

    public String transportRealName;
    public String transportRealGosNumber;
    public String transportRealInvNumber;
    public String transportName;

    public int kartaRefCode = Integer.MIN_VALUE;
    public String kartaRefName;
    public String kartaNum;

    public int tktransportTypeCode = Integer.MIN_VALUE;
    public String tktransportTypeName;

    public BigDecimal distances;

    ////////////
    public int planRefFinExecutorCode = Integer.MIN_VALUE;
    public String planRefFinExecutorName;

    public String planRefMOLCode;
    public String planRefMOLName;
    /////////////

    ////////////
    public int planRefKindCode = Integer.MIN_VALUE;
    ////////

    public String planRefWorkOrderNumber;

    public int transportDepartmentCode = Integer.MIN_VALUE;
    public String transportDepartmentName;

    public String getPlanRefWorkOrderNumber() {
		return planRefWorkOrderNumber;
	}
	public void setPlanRefWorkOrderNumber(String planRefWorkOrderNumber) {
		this.planRefWorkOrderNumber = planRefWorkOrderNumber;
	}
	public int getTktransportTypeCode() {
		return tktransportTypeCode;
	}
	public void setTktransportTypeCode(int transportTypeCode) {
		this.tktransportTypeCode = transportTypeCode;
	}
	public String getTktransportTypeName() {
		return tktransportTypeName;
	}
	public void setTktransportTypeName(String transportTypeName) {
		this.tktransportTypeName = transportTypeName;
	}
	public String getTransportName() {
		return transportName;
	}
	public void setTransportName(String transportName) {
		this.transportName = transportName;
	}
	public String getTransportRealGosNumber() {
		return transportRealGosNumber;
	}
	public void setTransportRealGosNumber(String transportRealGosNumber) {
		this.transportRealGosNumber = transportRealGosNumber;
	}
	public String getTransportRealInvNumber() {
		return transportRealInvNumber;
	}
	public void setTransportRealInvNumber(String transportRealInvNumber) {
		this.transportRealInvNumber = transportRealInvNumber;
	}
	public String getTransportRealName() {
		return transportRealName;
	}
	public void setTransportRealName(String transportRealName) {
		this.transportRealName = transportRealName;
	}
	public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }

    public void setDistance(BigDecimal aValue){
        distance = aValue;
     }
     public BigDecimal getDistance(){
        return distance;
     }

/*
    public void setDistanceTo(BigDecimal aValue){
       distanceTo = aValue;
    }
    public BigDecimal getDistanceTo(){
       return distanceTo;
    }

    public void setDistanceAlong(BigDecimal aValue){
       distanceAlong = aValue;
    }
    public BigDecimal getDistanceAlong(){
       return distanceAlong;
    }

    public void setDistanceFrom(BigDecimal aValue){
       distanceFrom = aValue;
    }
    public BigDecimal getDistanceFrom(){
       return distanceFrom;
    }
*/

    public void setCountWorkGen(BigDecimal aValue){
       countWorkGen = aValue;
    }
    public BigDecimal getCountWorkGen(){
       return countWorkGen;
    }

    public void setCountWorkFact(BigDecimal aValue){
       countWorkFact = aValue;
    }
    public BigDecimal getCountWorkFact(){
       return countWorkFact;
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
    public void setDistanceNorm(BigDecimal aValue){
       distanceNorm = aValue;
    }

    public BigDecimal getDistanceNorm(){
       return distanceNorm;
    }
    public void setAmountOfJourneys(int aValue){
       amountOfJourneys = aValue;
    }

    public int getAmountOfJourneys(){
       return amountOfJourneys;
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

    public void setTransportRealCode(int aValue){
       transportRealCode = aValue;
    }
    public int getTransportRealCode(){
       return transportRealCode;
    }



 public void setTrailerTransportRealCode(int aValue){
       trailerTransportRealCode = aValue;
    }
    public int getTrailerTransportRealCode(){
       return trailerTransportRealCode;
    }

    public void setTrailerTransportRealName(String aValue){
       trailerTransportRealName = aValue;
    }
    public String getTrailerTransportRealName(){
       return trailerTransportRealName;
    }

    public void setTrailerTransportRealInvNumber(String aValue){
       trailerTransportRealInvNumber = aValue;
    }
    public String getTrailerTransportRealInvNumber(){
       return trailerTransportRealInvNumber;
    }

    public void setTrailerTransportRealGosNumber(String aValue){
       trailerTransportRealGosNumber = aValue;
    }
    public String getTrailerTransportRealGosNumber(){
       return trailerTransportRealGosNumber;
    }
    public void setTransportCode(int aValue){
       transportCode = aValue;
    }
    public int getTransportCode(){
       return transportCode;
    }

    public void setManningTableCode(int aValue){
       manningTableCode = aValue;
    }
    public int getManningTableCode(){
       return manningTableCode;
    }

    public void setManningTableDateStart(Date aValue){
       manningTableDateStart = aValue;
    }
    public Date getManningTableDateStart(){
       return manningTableDateStart;
    }

    public void setManningTableDateFinal(Date aValue){
       manningTableDateFinal = aValue;
    }
    public Date getManningTableDateFinal(){
       return manningTableDateFinal;
    }

    public void setWorkerFactCode(int aValue){
       workerFactCode = aValue;
    }
    public int getWorkerFactCode(){
       return workerFactCode;
    }

    public void setWorkerFactName(String aValue){
       workerFactName = aValue;
    }
    public String getWorkerFactName(){
       return workerFactName;
    }

    public void setWorkerFactTabNumber(String aValue){
       workerFactTabNumber = aValue;
    }
    public String getWorkerFactTabNumber(){
       return workerFactTabNumber;
    }

    public void setWorkerFactIsMol(int aValue){
       workerFactIsMol = aValue;
    }
    public int getWorkerFactIsMol(){
       return workerFactIsMol;
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
	public int getFinCode() {
		return finCode;
	}
	public void setFinCode(int finCode) {
		this.finCode = finCode;
	}
	public int getFinWorkerCode() {
		return finWorkerCode;
	}
	public void setFinWorkerCode(int finWorkerCode) {
		this.finWorkerCode = finWorkerCode;
	}
	public String getFinWorkerName() {
		return finWorkerName;
	}
	public void setFinWorkerName(String finWorkerName) {
		this.finWorkerName = finWorkerName;
	}
	public String getFinWorkerTabNumber() {
		return finWorkerTabNumber;
	}
	public void setFinWorkerTabNumber(String finWorkerTabNumber) {
		this.finWorkerTabNumber = finWorkerTabNumber;
	}
	public String getFinWorkerPositionName() {
		return finWorkerPositionName;
	}
	public void setFinWorkerPositionName(String finWrkerPositionName) {
		this.finWorkerPositionName = finWrkerPositionName;
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
	public String getElementInvNumber() {
		return elementInvNumber;
	}
	public void setElementInvNumber(String elementInvNumber) {
		this.elementInvNumber = elementInvNumber;
	}
	public String getElementName() {
		return elementName;
	}
	public void setElementName(String elementName) {
		this.elementName = elementName;
	}
	public BigDecimal getDistances() {
		return distances;
	}
	public void setDistances(BigDecimal distances) {
		this.distances = distances;
	}
	public int getElementCode() {
		return elementCode;
	}
	public void setElementCode(int elementCode) {
		this.elementCode = elementCode;
	}
	public int getPlanRefFinExecutorCode() {
		return planRefFinExecutorCode;
	}
	public void setPlanRefFinExecutorCode(int planRefFinExecutorCode) {
		this.planRefFinExecutorCode = planRefFinExecutorCode;
	}
	public String getPlanRefFinExecutorName() {
		return planRefFinExecutorName;
	}
	public void setPlanRefFinExecutorName(String planRefFinExecutorName) {
		this.planRefFinExecutorName = planRefFinExecutorName;
	}
	public String getPlanRefMOLCode() {
		return planRefMOLCode;
	}
	public void setPlanRefMOLCode(String planRefMOLCode) {
		this.planRefMOLCode = planRefMOLCode;
	}
	public String getPlanRefMOLName() {
		return planRefMOLName;
	}
	public void setPlanRefMOLName(String planRefMOLName) {
		this.planRefMOLName = planRefMOLName;
	}
	public int getPlanRefKindCode() {
		return planRefKindCode;
	}
	public void setPlanRefKindCode(int planRefKindCode) {
		this.planRefKindCode = planRefKindCode;
	}

	public int getIsUseTrailer() {
		return isUseTrailer;
	}
	public void setIsUseTrailer(int isUseTrailer) {
		this.isUseTrailer = isUseTrailer;
	}

	public void setTransportDepartmentCode(int aValue) {
		transportDepartmentCode = aValue;
	}

	public int getTransportDepartmentCode() {
		return transportDepartmentCode;
	}

	public void setTransportDepartmentName(String aValue) {
		transportDepartmentName = aValue;
	}

	public String getTransportDepartmentName() {
		return transportDepartmentName;
	}


}