
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for CNPack2PlanWork;  	
  */

import java.io.Serializable;
import java.util.Date;


public class CNPack2PlanWorkShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public int packCode = Integer.MIN_VALUE; 
    public String commentGen; 
    public String userGen; 
    public Date dateEdit; 
    public int packTypeRefCode = Integer.MIN_VALUE; 
    public String packTypeRefName; 
    public int planRefCode = Integer.MIN_VALUE; 
    public Date planRefDateGen; 
    public Date planRefDateStart; 
    public Date planRefDateFinal; 
    public int planRefYearGen = Integer.MIN_VALUE; 
    public int planRefMonthGen = Integer.MIN_VALUE; 
    public String planRefUserGen; 
    public Date planRefDateEdit; 


    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	
    public void setPackCode(int aValue){
       packCode = aValue;
    }
    public int getPackCode(){
       return packCode;
    }
	
    public void setCommentGen(String aValue){
       commentGen = aValue;
    }
    public String getCommentGen(){
       return commentGen;
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
	

    public void setPackTypeRefCode(int aValue){
       packTypeRefCode = aValue;
    }
    public int getPackTypeRefCode(){
       return packTypeRefCode;
    }
	
    public void setPackTypeRefName(String aValue){
       packTypeRefName = aValue;
    }
    public String getPackTypeRefName(){
       return packTypeRefName;
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
	



}