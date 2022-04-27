
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTransportRoute;
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENTransportRouteShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal distance;
    public BigDecimal weight;
    public BigDecimal distanceNew;
    public BigDecimal speedometerStart;
    public BigDecimal speedometerFinal;
    public BigDecimal fuelCounterStart;
    public BigDecimal fuelCounterFinal;
    public Date dateEdit ;
    public String userGen;
    public int elementInRefCode = Integer.MIN_VALUE;
    public int elementOutRefCode = Integer.MIN_VALUE;
    public int distanceRefCode = Integer.MIN_VALUE;
    public BigDecimal distanceRefDistance;
    public int distanceTypeRefCode = Integer.MIN_VALUE;
    public String distanceTypeRefName;
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
    public int parentRouteRefCode = Integer.MIN_VALUE;
    public BigDecimal parentRouteRefDistance;
    public BigDecimal parentRouteRefWeight;
    public BigDecimal parentRouteRefDistanceNew;
    public BigDecimal parentRouteRefSpeedometerStart;
    public BigDecimal parentRouteRefSpeedometerFinal;
    public BigDecimal parentRouteRefFuelCounterStart;
    public BigDecimal parentRouteRefFuelCounterFinal;
    public Date parentRouteRefDateEdit;
    public String parentRouteRefUserGen;

    public String destinationPointStart;
    public String destinationPointEnd;

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
    public void setWeight(BigDecimal aValue){
       weight = aValue;
    }

    public BigDecimal getWeight(){
       return weight;
    }
    public void setDistanceNew(BigDecimal aValue){
       distanceNew = aValue;
    }

    public BigDecimal getDistanceNew(){
       return distanceNew;
    }
    public void setSpeedometerStart(BigDecimal aValue){
       speedometerStart = aValue;
    }

    public BigDecimal getSpeedometerStart(){
       return speedometerStart;
    }
    public void setSpeedometerFinal(BigDecimal aValue){
       speedometerFinal = aValue;
    }

    public BigDecimal getSpeedometerFinal(){
       return speedometerFinal;
    }
    public void setFuelCounterStart(BigDecimal aValue){
       fuelCounterStart = aValue;
    }

    public BigDecimal getFuelCounterStart(){
       return fuelCounterStart;
    }
    public void setFuelCounterFinal(BigDecimal aValue){
       fuelCounterFinal = aValue;
    }

    public BigDecimal getFuelCounterFinal(){
       return fuelCounterFinal;
    }

    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }
    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }


    public void setElementInRefCode(int aValue){
       elementInRefCode = aValue;
    }
    public int getElementInRefCode(){
       return elementInRefCode;
    }

    public void setElementOutRefCode(int aValue){
       elementOutRefCode = aValue;
    }
    public int getElementOutRefCode(){
       return elementOutRefCode;
    }

    public void setDistanceRefCode(int aValue){
       distanceRefCode = aValue;
    }
    public int getDistanceRefCode(){
       return distanceRefCode;
    }

    public void setDistanceRefDistance(BigDecimal aValue){
       distanceRefDistance = aValue;
    }
    public BigDecimal getDistanceRefDistance(){
       return distanceRefDistance;
    }

    public void setDistanceTypeRefCode(int aValue){
       distanceTypeRefCode = aValue;
    }
    public int getDistanceTypeRefCode(){
       return distanceTypeRefCode;
    }

    public void setDistanceTypeRefName(String aValue){
       distanceTypeRefName = aValue;
    }
    public String getDistanceTypeRefName(){
       return distanceTypeRefName;
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

    public void setParentRouteRefCode(int aValue){
       parentRouteRefCode = aValue;
    }
    public int getParentRouteRefCode(){
       return parentRouteRefCode;
    }

    public void setParentRouteRefDistance(BigDecimal aValue){
       parentRouteRefDistance = aValue;
    }
    public BigDecimal getParentRouteRefDistance(){
       return parentRouteRefDistance;
    }

    public void setParentRouteRefWeight(BigDecimal aValue){
       parentRouteRefWeight = aValue;
    }
    public BigDecimal getParentRouteRefWeight(){
       return parentRouteRefWeight;
    }

    public void setParentRouteRefDistanceNew(BigDecimal aValue){
       parentRouteRefDistanceNew = aValue;
    }
    public BigDecimal getParentRouteRefDistanceNew(){
       return parentRouteRefDistanceNew;
    }

    public void setParentRouteRefSpeedometerStart(BigDecimal aValue){
       parentRouteRefSpeedometerStart = aValue;
    }
    public BigDecimal getParentRouteRefSpeedometerStart(){
       return parentRouteRefSpeedometerStart;
    }

    public void setParentRouteRefSpeedometerFinal(BigDecimal aValue){
       parentRouteRefSpeedometerFinal = aValue;
    }
    public BigDecimal getParentRouteRefSpeedometerFinal(){
       return parentRouteRefSpeedometerFinal;
    }

    public void setParentRouteRefFuelCounterStart(BigDecimal aValue){
       parentRouteRefFuelCounterStart = aValue;
    }
    public BigDecimal getParentRouteRefFuelCounterStart(){
       return parentRouteRefFuelCounterStart;
    }

    public void setParentRouteRefFuelCounterFinal(BigDecimal aValue){
       parentRouteRefFuelCounterFinal = aValue;
    }
    public BigDecimal getParentRouteRefFuelCounterFinal(){
       return parentRouteRefFuelCounterFinal;
    }


    public void setParentRouteRefDateEdit(Date aValue){
       parentRouteRefDateEdit = aValue;
    }
    public Date getParentRouteRefDateEdit(){
       return parentRouteRefDateEdit;
    }

    public void setParentRouteRefUserGen(String aValue){
       parentRouteRefUserGen = aValue;
    }
    public String getParentRouteRefUserGen(){
       return parentRouteRefUserGen;
    }

	public final String getDestinationPointStart() {
		return destinationPointStart;
	}

	public final void setDestinationPointStart(String destinationPointStart) {
		this.destinationPointStart = destinationPointStart;
	}

	public final String getDestinationPointEnd() {
		return destinationPointEnd;
	}

	public final void setDestinationPointEnd(String destinationPointEnd) {
		this.destinationPointEnd = destinationPointEnd;
	}



}