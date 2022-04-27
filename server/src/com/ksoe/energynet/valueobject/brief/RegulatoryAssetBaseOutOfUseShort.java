
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for RegulatoryAssetBaseOutOfUse;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class RegulatoryAssetBaseOutOfUseShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public Date dateStart ;
	public Date dateFinish ;
	public int assetRefCode = Integer.MIN_VALUE;
	public String assetRefInventoryNumber;
	public String assetRefName;
	public Date assetRefIncomeDate;
	public BigDecimal assetRefOriginalValue;
	public Boolean assetRefInitial;
	public Date assetRefWriteOffDate;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public Date getDateStart() {
		return dateStart;
	}

	public void setDateStart(Date dateStart) {
		this.dateStart = dateStart;
	}

	public Date getDateFinish() {
		return dateFinish;
	}

	public void setDateFinish(Date dateFinish) {
		this.dateFinish = dateFinish;
	}


	public int getAssetRefCode(){
		return assetRefCode;
	}

	public void setAssetRefCode(int assetRefCode) {
		this.assetRefCode = assetRefCode;
	}

	public String getAssetRefInventoryNumber(){
		return assetRefInventoryNumber;
	}

	public void setAssetRefInventoryNumber(String assetRefInventoryNumber) {
		this.assetRefInventoryNumber = assetRefInventoryNumber;
	}

	public String getAssetRefName(){
		return assetRefName;
	}

	public void setAssetRefName(String assetRefName) {
		this.assetRefName = assetRefName;
	}

	public Date getAssetRefIncomeDate(){
		return assetRefIncomeDate;
	}

	public void setAssetRefIncomeDate(Date assetRefIncomeDate) {
		this.assetRefIncomeDate = assetRefIncomeDate;
	}

	public BigDecimal getAssetRefOriginalValue(){
		return assetRefOriginalValue;
	}

	public void setAssetRefOriginalValue(BigDecimal assetRefOriginalValue) {
		this.assetRefOriginalValue = assetRefOriginalValue;
	}

	public Boolean getAssetRefInitial(){
		return assetRefInitial;
	}

	public void setAssetRefInitial(Boolean assetRefInitial) {
		this.assetRefInitial = assetRefInitial;
	}

	public Date getAssetRefWriteOffDate(){
		return assetRefWriteOffDate;
	}

	public void setAssetRefWriteOffDate(Date assetRefWriteOffDate) {
		this.assetRefWriteOffDate = assetRefWriteOffDate;
	}



}
