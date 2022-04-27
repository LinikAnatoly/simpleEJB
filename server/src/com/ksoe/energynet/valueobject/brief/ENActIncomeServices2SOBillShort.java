
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENActIncomeServices2SOBill;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENActIncomeServices2SOBillShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public int actIncomeRefCode = Integer.MIN_VALUE;
	public String actIncomeRefNumberGen;
	public Date actIncomeRefDateGen;
	public Date actIncomeRefActDateStart;
	public Date actIncomeRefActDateEnd;
	public BigDecimal actIncomeRefSummaGen;
	public BigDecimal actIncomeRefSummaVat;
	public Date actIncomeRefDateAdd;
	public Date actIncomeRefDateEdit;
	public String actIncomeRefUserGen;
	public int soBillRefCode = Integer.MIN_VALUE;
	public Date soBillRefDateGen;
	public BigDecimal soBillRefSumTotal;
	public BigDecimal soBillRefSumGen;
	public BigDecimal soBillRefSumVat;
	public String soBillRefUserGen;
	public Date soBillRefDateEdit;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}


	public void setActIncomeRefCode(int aValue){
		actIncomeRefCode = aValue;
	}
	public int getActIncomeRefCode(){
		return actIncomeRefCode;
	}

	public void setActIncomeRefNumberGen(String aValue){
		actIncomeRefNumberGen = aValue;
	}
	public String getActIncomeRefNumberGen(){
		return actIncomeRefNumberGen;
	}

	public void setActIncomeRefDateGen(Date aValue){
		actIncomeRefDateGen = aValue;
	}
	public Date getActIncomeRefDateGen(){
		return actIncomeRefDateGen;
	}

	public void setActIncomeRefActDateStart(Date aValue){
		actIncomeRefActDateStart = aValue;
	}
	public Date getActIncomeRefActDateStart(){
		return actIncomeRefActDateStart;
	}

	public void setActIncomeRefActDateEnd(Date aValue){
		actIncomeRefActDateEnd = aValue;
	}
	public Date getActIncomeRefActDateEnd(){
		return actIncomeRefActDateEnd;
	}

	public void setActIncomeRefSummaGen(BigDecimal aValue){
		actIncomeRefSummaGen = aValue;
	}
	public BigDecimal getActIncomeRefSummaGen(){
		return actIncomeRefSummaGen;
	}

	public void setActIncomeRefSummaVat(BigDecimal aValue){
		actIncomeRefSummaVat = aValue;
	}
	public BigDecimal getActIncomeRefSummaVat(){
		return actIncomeRefSummaVat;
	}

	public void setActIncomeRefDateAdd(Date aValue){
		actIncomeRefDateAdd = aValue;
	}
	public Date getActIncomeRefDateAdd(){
		return actIncomeRefDateAdd;
	}

	public void setActIncomeRefDateEdit(Date aValue){
		actIncomeRefDateEdit = aValue;
	}
	public Date getActIncomeRefDateEdit(){
		return actIncomeRefDateEdit;
	}

	public void setActIncomeRefUserGen(String aValue){
		actIncomeRefUserGen = aValue;
	}
	public String getActIncomeRefUserGen(){
		return actIncomeRefUserGen;
	}

	public void setSoBillRefCode(int aValue){
		soBillRefCode = aValue;
	}
	public int getSoBillRefCode(){
		return soBillRefCode;
	}

	public void setSoBillRefDateGen(Date aValue){
		soBillRefDateGen = aValue;
	}
	public Date getSoBillRefDateGen(){
		return soBillRefDateGen;
	}

	public void setSoBillRefSumTotal(BigDecimal aValue){
		soBillRefSumTotal = aValue;
	}
	public BigDecimal getSoBillRefSumTotal(){
		return soBillRefSumTotal;
	}

	public void setSoBillRefSumGen(BigDecimal aValue){
		soBillRefSumGen = aValue;
	}
	public BigDecimal getSoBillRefSumGen(){
		return soBillRefSumGen;
	}

	public void setSoBillRefSumVat(BigDecimal aValue){
		soBillRefSumVat = aValue;
	}
	public BigDecimal getSoBillRefSumVat(){
		return soBillRefSumVat;
	}

	public void setSoBillRefUserGen(String aValue){
		soBillRefUserGen = aValue;
	}
	public String getSoBillRefUserGen(){
		return soBillRefUserGen;
	}

	public void setSoBillRefDateEdit(Date aValue){
		soBillRefDateEdit = aValue;
	}
	public Date getSoBillRefDateEdit(){
		return soBillRefDateEdit;
	}



}