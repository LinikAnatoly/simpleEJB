
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENDeliveryTimePlan;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENDeliveryTimePlanShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public BigDecimal deliveryTimePlan; 
    public BigDecimal deliveryTimeFact; 
    public BigDecimal deliveryDistance; 
    public int planWorkRefCode = Integer.MIN_VALUE; 
    public Date planWorkRefDateGen; 
    public Date planWorkRefDateStart; 
    public Date planWorkRefDateFinal; 
    public int planWorkRefYearGen = Integer.MIN_VALUE; 
    public int planWorkRefMonthGen = Integer.MIN_VALUE; 
    public String planWorkRefUserGen; 
    public Date planWorkRefDateEdit; 
    public String planWorkRefWorkOrderNumber; 
    public Date planWorkRefDateWorkOrder; 
    public String planWorkRefPriConnectionNumber; 


    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	
    public void setDeliveryTimePlan(BigDecimal aValue){
       deliveryTimePlan = aValue;
    }
    public BigDecimal getDeliveryTimePlan(){
       return deliveryTimePlan;
    }
	
    public void setDeliveryTimeFact(BigDecimal aValue){
       deliveryTimeFact = aValue;
    }
    public BigDecimal getDeliveryTimeFact(){
       return deliveryTimeFact;
    }
	
    public void setDeliveryDistance(BigDecimal aValue){
       deliveryDistance = aValue;
    }
    public BigDecimal getDeliveryDistance(){
       return deliveryDistance;
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
	



}