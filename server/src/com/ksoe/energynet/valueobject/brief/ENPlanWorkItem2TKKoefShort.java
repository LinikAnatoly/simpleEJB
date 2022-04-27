
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENPlanWorkItem2TKKoef;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENPlanWorkItem2TKKoefShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public int sourceKoefCode = Integer.MIN_VALUE; 
    public String sourceKoefNum; 
    public String sourceKoefName; 
    public BigDecimal sourceKoefKoef; 
    public int planWorkItemRefCode = Integer.MIN_VALUE; 
    public BigDecimal planWorkItemRefCountGen; 
    public BigDecimal planWorkItemRefTimeGen; 
    public String planWorkItemRefUserGen; 
    public Date planWorkItemRefDateEdit; 
    
    public String budjname;
    public String enplanworkstatename;
    
    
    public String getBudjname() {
		return budjname;
	}
	public void setBudjname(String budjname) {
		this.budjname = budjname;
	}
	public String getEnplanworkstatename() {
		return enplanworkstatename;
	}
	public void setEnplanworkstatename(String enplanworkstatename) {
		this.enplanworkstatename = enplanworkstatename;
	}
	


    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	

    public void setSourceKoefCode(int aValue){
       sourceKoefCode = aValue;
    }
    public int getSourceKoefCode(){
       return sourceKoefCode;
    }
	
    public void setSourceKoefNum(String aValue){
       sourceKoefNum = aValue;
    }
    public String getSourceKoefNum(){
       return sourceKoefNum;
    }
	
    public void setSourceKoefName(String aValue){
       sourceKoefName = aValue;
    }
    public String getSourceKoefName(){
       return sourceKoefName;
    }
	
    public void setSourceKoefKoef(BigDecimal aValue){
       sourceKoefKoef = aValue;
    }
    public BigDecimal getSourceKoefKoef(){
       return sourceKoefKoef;
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
	



}