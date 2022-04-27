
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENActIncomServ2Prov;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENActIncomServ2ProvShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public int partId = Integer.MIN_VALUE;
	public Date datePosting ;
	public String voucher;
	public Date dateEdit ;
	public String userGen;
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


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setPartId(int aValue){
		partId = aValue;
	}

	public int getPartId(){
		return partId;
	}

	public void setDatePosting(Date aValue){
		datePosting = aValue;
	}

	public Date getDatePosting(){
		return datePosting;
	}

	public void setVoucher(String aValue){
		voucher = aValue;
	}

	public String getVoucher(){
		return voucher;
	}

	public void setDateEdit(Date aValue){
		dateEdit = aValue;
	}

	public Date getDateEdit(){
		return dateEdit;
	}

	public void setUserGen(String aValue){
		userGen = aValue;
	}

	public String getUserGen(){
		return userGen;
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



}