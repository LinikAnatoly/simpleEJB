
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Wed Sep 30 13:35:15 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENPlanWorkItem;
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENPlanWorkItemShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal countGen;
    public String userGen;
    public Date dateEdit;
    public int planRefCode = Integer.MIN_VALUE;
    public Date planRefDateGen;
    public int planRefYearGen = Integer.MIN_VALUE;
    public int planRefMonthGen = Integer.MIN_VALUE;
    public String planRefUserGen;
    public Date planRefDateEdit;


    public String measurementUnit;
    public String meter;

    public int kartaRefCode = Integer.MIN_VALUE;
    public String kartaRefName;
    public String kartaNum;

    public int oldPlanRefCode = Integer.MIN_VALUE;

    public BigDecimal normOfTime;

    public BigDecimal timeGen;

    public String sourceName;

    public BigDecimal costServicesFS;

    public String commentGen;

    public BigDecimal koef;

    public String statusName;

    public String getKartaNum() {
		return kartaNum;
	}
	public void setKartaNum(String kartaNum) {
		this.kartaNum = kartaNum;
	}
	public int getKartaRefCode() {
		return kartaRefCode;
	}
	public void setKartaRefCode(int kartaRefCode) {
		this.kartaRefCode = kartaRefCode;
	}
	public String getKartaRefName() {
		return kartaRefName;
	}
	public void setKartaRefName(String kartaRefName) {
		this.kartaRefName = kartaRefName;
	}
	public String getMeasurementUnit() {
		return measurementUnit;
	}
	public void setMeasurementUnit(String measurementUnit) {
		this.measurementUnit = measurementUnit;
	}
	public String getMeter() {
		return meter;
	}
	public void setMeter(String meter) {
		this.meter = meter;
	}
	public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }

    public void setCountGen(BigDecimal aValue){
       countGen = aValue;
    }
    public BigDecimal getCountGen(){
       return countGen;
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
	public BigDecimal getNormOfTime() {
		return normOfTime;
	}
	public void setNormOfTime(BigDecimal normOfTime) {
		this.normOfTime = normOfTime;
	}
	public String getsourceName() {
		return sourceName;
	}
	public void setsourceName(String sourceName) {
		this.sourceName = sourceName;
	}
	public String getSourceName() {
		return sourceName;
	}
	public void setSourceName(String sourceName) {
		this.sourceName = sourceName;
	}
	public BigDecimal getTimeGen() {
		return timeGen;
	}
	public void setTimeGen(BigDecimal timeGen) {
		this.timeGen = timeGen;
	}


	public final BigDecimal getCostServicesFS() {
		return costServicesFS;
	}

	public final void setCostServicesFS(BigDecimal costServicesFS) {
		this.costServicesFS = costServicesFS;
	}

	public final String getCommentGen() {
		return commentGen;
	}

	public final void setCommentGen(String commentGen) {
		this.commentGen = commentGen;
	}
	public BigDecimal getKoef() {
		return koef;
	}
	public void setKoef(BigDecimal koef) {
		this.koef = koef;
	}

	public final String getStatusName() {
		return statusName;
	}

	public final void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public void setOldPlanRefCode(int aValue){
		oldPlanRefCode = aValue;
	}
	public int getOldPlanRefCode(){
		return oldPlanRefCode;
	}

}