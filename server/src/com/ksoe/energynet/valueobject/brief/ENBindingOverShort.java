
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENBindingOver;  	
  */

import java.io.Serializable;
import java.util.Date;


public class ENBindingOverShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public String numberGen; 
    public Date dateGen; 
    public String itemText; 
    public String userGen; 
    public Date dateEdit; 
    public int organizationCode = Integer.MIN_VALUE; 
    public String organizationName; 
    public int planRefCode = Integer.MIN_VALUE; 
    public Date planRefDateGen; 
    public Date planRefDateStart; 
    public Date planRefDateFinal; 
    public int planRefYearGen = Integer.MIN_VALUE; 
    public int planRefMonthGen = Integer.MIN_VALUE; 
    public String planRefUserGen; 
    public Date planRefDateEdit; 
    public String planRefWorkOrderNumber; 
    public Date planRefDateWorkOrder; 
    public String planRefPriConnectionNumber; 


    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	
    public void setNumberGen(String aValue){
       numberGen = aValue;
    }
    public String getNumberGen(){
       return numberGen;
    }
	
    public void setDateGen(Date aValue){
       dateGen = aValue;
    }
    public Date getDateGen(){
       return dateGen;
    }
	
    public void setItemText(String aValue){
       itemText = aValue;
    }
    public String getItemText(){
       return itemText;
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
	

    public void setOrganizationCode(int aValue){
       organizationCode = aValue;
    }
    public int getOrganizationCode(){
       return organizationCode;
    }
	
    public void setOrganizationName(String aValue){
       organizationName = aValue;
    }
    public String getOrganizationName(){
       return organizationName;
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
	



}