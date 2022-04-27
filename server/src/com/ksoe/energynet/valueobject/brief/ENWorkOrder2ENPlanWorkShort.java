
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENWorkOrder2ENPlanWork;  	
  */

import java.io.Serializable;
import java.util.Date;


public class ENWorkOrder2ENPlanWorkShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public int workOrderCode = Integer.MIN_VALUE; 
    public String workOrderWorkOrderNumber; 
    public Date workOrderDateGen; 
    public String workOrderFinMolName; 
    public String workOrderFinMechanicName; 
    public String workOrderUserGen; 
    public Date workOrderDateEdit; 
    public int planCode = Integer.MIN_VALUE; 
    public Date planDateGen; 
    public Date planDateStart; 
    public Date planDateFinal; 
    public int planYearGen = Integer.MIN_VALUE; 
    public int planMonthGen = Integer.MIN_VALUE; 
    public String planUserGen; 
    public Date planDateEdit; 
    public String planWorkOrderNumber; 
    public Date planDateWorkOrder; 
    public String planPriConnectionNumber; 


    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	

    public void setWorkOrderCode(int aValue){
       workOrderCode = aValue;
    }
    public int getWorkOrderCode(){
       return workOrderCode;
    }
	
    public void setWorkOrderWorkOrderNumber(String aValue){
       workOrderWorkOrderNumber = aValue;
    }
    public String getWorkOrderWorkOrderNumber(){
       return workOrderWorkOrderNumber;
    }
	
    public void setWorkOrderDateGen(Date aValue){
       workOrderDateGen = aValue;
    }
    public Date getWorkOrderDateGen(){
       return workOrderDateGen;
    }
	
    public void setWorkOrderFinMolName(String aValue){
       workOrderFinMolName = aValue;
    }
    public String getWorkOrderFinMolName(){
       return workOrderFinMolName;
    }
	
    public void setWorkOrderFinMechanicName(String aValue){
       workOrderFinMechanicName = aValue;
    }
    public String getWorkOrderFinMechanicName(){
       return workOrderFinMechanicName;
    }
	
    public void setWorkOrderUserGen(String aValue){
       workOrderUserGen = aValue;
    }
    public String getWorkOrderUserGen(){
       return workOrderUserGen;
    }
	
    public void setWorkOrderDateEdit(Date aValue){
       workOrderDateEdit = aValue;
    }
    public Date getWorkOrderDateEdit(){
       return workOrderDateEdit;
    }
	
    public void setPlanCode(int aValue){
       planCode = aValue;
    }
    public int getPlanCode(){
       return planCode;
    }
	
    public void setPlanDateGen(Date aValue){
       planDateGen = aValue;
    }
    public Date getPlanDateGen(){
       return planDateGen;
    }
	
    public void setPlanDateStart(Date aValue){
       planDateStart = aValue;
    }
    public Date getPlanDateStart(){
       return planDateStart;
    }
	
    public void setPlanDateFinal(Date aValue){
       planDateFinal = aValue;
    }
    public Date getPlanDateFinal(){
       return planDateFinal;
    }
	
    public void setPlanYearGen(int aValue){
       planYearGen = aValue;
    }
    public int getPlanYearGen(){
       return planYearGen;
    }
	
    public void setPlanMonthGen(int aValue){
       planMonthGen = aValue;
    }
    public int getPlanMonthGen(){
       return planMonthGen;
    }
	
    public void setPlanUserGen(String aValue){
       planUserGen = aValue;
    }
    public String getPlanUserGen(){
       return planUserGen;
    }
	
    public void setPlanDateEdit(Date aValue){
       planDateEdit = aValue;
    }
    public Date getPlanDateEdit(){
       return planDateEdit;
    }
	
    public void setPlanWorkOrderNumber(String aValue){
       planWorkOrderNumber = aValue;
    }
    public String getPlanWorkOrderNumber(){
       return planWorkOrderNumber;
    }
	
    public void setPlanDateWorkOrder(Date aValue){
       planDateWorkOrder = aValue;
    }
    public Date getPlanDateWorkOrder(){
       return planDateWorkOrder;
    }
	
    public void setPlanPriConnectionNumber(String aValue){
       planPriConnectionNumber = aValue;
    }
    public String getPlanPriConnectionNumber(){
       return planPriConnectionNumber;
    }
	



}