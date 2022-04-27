package com.ksoe.energynet.valueobject;

import java.io.Serializable;
import java.math.BigDecimal;

public class ENEstimateItemData implements Serializable {

	public int materialCode = Integer.MIN_VALUE;
	public BigDecimal materialCount = new BigDecimal(0);
	public BigDecimal price;
	public int countMonth = Integer.MIN_VALUE;
	public int isObligatory = Integer.MIN_VALUE;
	public int accountingTypeRefCode = Integer.MIN_VALUE;
	
	public int getAccountingTypeRefCode() {
		return accountingTypeRefCode;
	}
	public void setAccountingTypeRefCode(int accountingTypeRefCode) {
		this.accountingTypeRefCode = accountingTypeRefCode;
	}
	public int getMaterialCode() {
		return materialCode;
	}
	public void setMaterialCode(int materialCode) {
		this.materialCode = materialCode;
	}
	public BigDecimal getMaterialCount() {
		return materialCount;
	}
	public void setMaterialCount(BigDecimal materialCount) {
		this.materialCount = materialCount;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public int getCountMonth() {
		return countMonth;
	}

	public void setCountMonth(int countMonth) {
		this.countMonth = countMonth;
	}
	
	public int getIsObligatory() {
		return isObligatory;
	}
	public void setIsObligatory(int isObligatory) {
		this.isObligatory = isObligatory;
	}

}
