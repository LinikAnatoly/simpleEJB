
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Mon Oct 05 15:21:12 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENPlanWorkMoveHistory;  	
  */

import java.io.Serializable;
import java.util.Date;


public class ENPlanWorkMoveHistoryShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public Date dateGen; 
    public int yearGen = Integer.MIN_VALUE; 
    public int monthGen = Integer.MIN_VALUE; 
    public String userGen; 
    public Date dateEdit; 
    public int reasonCode = Integer.MIN_VALUE; 
    public String reasonName; 
    public int planRefCode = Integer.MIN_VALUE; 
    public Date planRefDateGen; 
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
	
    public void setDateGen(Date aValue){
       dateGen = aValue;
    }
    public Date getDateGen(){
       return dateGen;
    }
	
    public void setYearGen(int aValue){
       yearGen = aValue;
    }
    public int getYearGen(){
       return yearGen;
    }
	
    public void setMonthGen(int aValue){
       monthGen = aValue;
    }
    public int getMonthGen(){
       return monthGen;
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
	

    public void setReasonCode(int aValue){
       reasonCode = aValue;
    }
    public int getReasonCode(){
       return reasonCode;
    }
	
    public void setReasonName(String aValue){
       reasonName = aValue;
    }
    public String getReasonName(){
       return reasonName;
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