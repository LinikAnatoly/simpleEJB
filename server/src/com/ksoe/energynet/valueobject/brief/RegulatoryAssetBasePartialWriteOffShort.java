
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for RegulatoryAssetBasePartialWriteOff;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class RegulatoryAssetBasePartialWriteOffShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String writeOffNumber;
	public Date writeOffDate ;
	public BigDecimal value;
	public BigDecimal percentage;
	public int assetRefCode = Integer.MIN_VALUE;
	public String assetRefInventoryNumber;
	public String assetRefName;
	public Date assetRefIncomeDate;
	public BigDecimal assetRefOriginalValue;
	public Boolean assetRefInitial;
	public String assetRefWriteOffNumber;
	public Date assetRefWriteOffDate;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getWriteOffNumber() {
		return writeOffNumber;
	}

	public void setWriteOffNumber(String writeOffNumber) {
		this.writeOffNumber = writeOffNumber;
	}

	public Date getWriteOffDate() {
		return writeOffDate;
	}

	public void setWriteOffDate(Date writeOffDate) {
		this.writeOffDate = writeOffDate;
	}

	public BigDecimal getValue() {
		return value;
	}

	public void setValue(BigDecimal value) {
		this.value = value;
	}

	public BigDecimal getPercentage() {
		return percentage;
	}

	public void setPercentage(BigDecimal percentage) {
		this.percentage = percentage;
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

	public String getAssetRefWriteOffNumber() {
		return assetRefWriteOffNumber;
	}

	public void setAssetRefWriteOffNumber(String assetRefWriteOffNumber) {
		this.assetRefWriteOffNumber = assetRefWriteOffNumber;
	}

	public Date getAssetRefWriteOffDate(){
		return assetRefWriteOffDate;
	}

	public void setAssetRefWriteOffDate(Date assetRefWriteOffDate) {
		this.assetRefWriteOffDate = assetRefWriteOffDate;
	}



}
