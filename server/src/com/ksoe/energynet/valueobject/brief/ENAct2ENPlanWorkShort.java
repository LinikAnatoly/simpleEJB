
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENAct2ENPlanWork;  	
  */

import java.io.Serializable;
import java.util.Date;


public class ENAct2ENPlanWorkShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public int actRefCode = Integer.MIN_VALUE; 
    public String actRefNumberGen; 
    public Date actRefDateGen; 
    public String actRefFinMolName; 
    public String actRefUserGen; 
    public Date actRefDateEdit; 
    public int planCode = Integer.MIN_VALUE; 
    public Date planDateGen; 
    public Date planDateStart; 
    public Date planDateFinal; 
    public int planYearGen = Integer.MIN_VALUE; 
    public int planMonthGen = Integer.MIN_VALUE; 
    public String planUserGen; 
    public Date planDateEdit; 

    public int typeCode = Integer.MIN_VALUE;
    public String typeName ;
    
    
    public int kindCode = Integer.MIN_VALUE; 
    public String kindName; 

    public int getKindCode() {
		return kindCode;
	}
	public void setKindCode(int kindCode) {
		this.kindCode = kindCode;
	}
	public String getKindName() {
		return kindName;
	}
	public void setKindName(String kindName) {
		this.kindName = kindName;
	}
	public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
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
	
    public void setActRefFinMolName(String aValue){
       actRefFinMolName = aValue;
    }
    public String getActRefFinMolName(){
       return actRefFinMolName;
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
	public int getTypeCode() {
		return typeCode;
	}
	public void setTypeCode(int typeCode) {
		this.typeCode = typeCode;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	




}