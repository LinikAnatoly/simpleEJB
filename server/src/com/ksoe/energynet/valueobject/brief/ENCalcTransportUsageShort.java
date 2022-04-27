
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENCalcTransportUsage;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENCalcTransportUsageShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int numberGen = Integer.MIN_VALUE;
    public String classificationTypeNumber;
    public String transportName;
    public BigDecimal normMachineHours;
    public BigDecimal normDistance;
    public BigDecimal priceMachineHours;
    public BigDecimal priceDistance;
    public BigDecimal costMachineHours;
    public BigDecimal costDistance;
    public BigDecimal costTotal;
    public String commentPriceDistance;
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
    public int tkTransportRefCode = Integer.MIN_VALUE;
    public String tkTransportRefName;
    public int plan2CTypeRefCode = Integer.MIN_VALUE;
    public BigDecimal plan2CTypeRefCountGen;
    public String plan2CTypeRefUserGen;
    public Date plan2CTypeRefDateEdit;

    public int tkTransportTypeRefCode = Integer.MIN_VALUE;
    public BigDecimal fuelPrice;
    public BigDecimal fuelByDistance;
    
    public BigDecimal getFuelPrice() {
		return fuelPrice;
	}

	public void setFuelPrice(BigDecimal fuelPrice) {
		this.fuelPrice = fuelPrice;
	}

	public int getTkTransportTypeRefCode() {
		return tkTransportTypeRefCode;
	}

	public void setTkTransportTypeRefCode(int tkTransportTypeRefCode) {
		this.tkTransportTypeRefCode = tkTransportTypeRefCode;
	}

	public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setNumberGen(int aValue){
       numberGen = aValue;
    }

    public int getNumberGen(){
       return numberGen;
    }
    public void setClassificationTypeNumber(String aValue){
       classificationTypeNumber = aValue;
    }

    public String getClassificationTypeNumber(){
       return classificationTypeNumber;
    }
    public void setTransportName(String aValue){
       transportName = aValue;
    }

    public String getTransportName(){
       return transportName;
    }
    public void setNormMachineHours(BigDecimal aValue){
       normMachineHours = aValue;
    }

    public BigDecimal getNormMachineHours(){
       return normMachineHours;
    }
    public void setNormDistance(BigDecimal aValue){
       normDistance = aValue;
    }

    public BigDecimal getNormDistance(){
       return normDistance;
    }
    public void setPriceMachineHours(BigDecimal aValue){
       priceMachineHours = aValue;
    }

    public BigDecimal getPriceMachineHours(){
       return priceMachineHours;
    }
    public void setPriceDistance(BigDecimal aValue){
       priceDistance = aValue;
    }

    public BigDecimal getPriceDistance(){
       return priceDistance;
    }
    public void setCostMachineHours(BigDecimal aValue){
       costMachineHours = aValue;
    }

    public BigDecimal getCostMachineHours(){
       return costMachineHours;
    }
    public void setCostDistance(BigDecimal aValue){
       costDistance = aValue;
    }

    public BigDecimal getCostDistance(){
       return costDistance;
    }
    public void setCostTotal(BigDecimal aValue){
       costTotal = aValue;
    }

    public BigDecimal getCostTotal(){
       return costTotal;
    }
    public void setCommentPriceDistance(String aValue){
       commentPriceDistance = aValue;
    }

    public String getCommentPriceDistance(){
       return commentPriceDistance;
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

    public void setTkTransportRefCode(int aValue){
       tkTransportRefCode = aValue;
    }
    public int getTkTransportRefCode(){
       return tkTransportRefCode;
    }

    public void setTkTransportRefName(String aValue){
       tkTransportRefName = aValue;
    }
    public String getTkTransportRefName(){
       return tkTransportRefName;
    }

    public void setPlan2CTypeRefCode(int aValue){
       plan2CTypeRefCode = aValue;
    }
    public int getPlan2CTypeRefCode(){
       return plan2CTypeRefCode;
    }

    public void setPlan2CTypeRefCountGen(BigDecimal aValue){
       plan2CTypeRefCountGen = aValue;
    }
    public BigDecimal getPlan2CTypeRefCountGen(){
       return plan2CTypeRefCountGen;
    }

    public void setPlan2CTypeRefUserGen(String aValue){
       plan2CTypeRefUserGen = aValue;
    }
    public String getPlan2CTypeRefUserGen(){
       return plan2CTypeRefUserGen;
    }


    public void setPlan2CTypeRefDateEdit(Date aValue){
       plan2CTypeRefDateEdit = aValue;
    }
    public Date getPlan2CTypeRefDateEdit(){
       return plan2CTypeRefDateEdit;
    }

	public BigDecimal getFuelByDistance() {
		return fuelByDistance;
	}

	public void setFuelByDistance(BigDecimal fuelByDistance) {
		this.fuelByDistance = fuelByDistance;
	}
}