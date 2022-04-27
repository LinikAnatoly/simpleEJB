
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENCalcHumenDelivery;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENCalcHumenDeliveryShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int numberGen = Integer.MIN_VALUE;
    public String classificationTypeNumber;
    public BigDecimal priceHour;
    public BigDecimal timeGen;
    public BigDecimal costGen;
    public BigDecimal chargeCostGen;
    public BigDecimal costTotal;
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
    public int plan2CTypeRefCode = Integer.MIN_VALUE;
    public BigDecimal plan2CTypeRefCountGen;
    public String plan2CTypeRefUserGen;
    public Date plan2CTypeRefDateEdit;

    public BigDecimal distance;
    
    public BigDecimal getDistance() {
		return distance;
	}

	public void setDistance(BigDecimal distance) {
		this.distance = distance;
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
    public void setPriceHour(BigDecimal aValue){
       priceHour = aValue;
    }

    public BigDecimal getPriceHour(){
       return priceHour;
    }
    public void setTimeGen(BigDecimal aValue){
       timeGen = aValue;
    }

    public BigDecimal getTimeGen(){
       return timeGen;
    }
    public void setCostGen(BigDecimal aValue){
       costGen = aValue;
    }

    public BigDecimal getCostGen(){
       return costGen;
    }
    public void setChargeCostGen(BigDecimal aValue){
       chargeCostGen = aValue;
    }

    public BigDecimal getChargeCostGen(){
       return chargeCostGen;
    }
    public void setCostTotal(BigDecimal aValue){
       costTotal = aValue;
    }

    public BigDecimal getCostTotal(){
       return costTotal;
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



}