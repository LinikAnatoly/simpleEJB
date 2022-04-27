package com.ksoe.energynet.valueobject.brief;

import java.math.BigDecimal;

import com.ksoe.techcard.valueobject.brief.TKMaterialsShort;

public class ENMaterialsShort extends TKMaterialsShort{

	public BigDecimal sumCost = null;
	public BigDecimal countFact = null;
	
	public int purchaseItemRefCode = Integer.MIN_VALUE;
	
	
	public int getPurchaseItemRefCode() {
		return purchaseItemRefCode;
	}
	public void setPurchaseItemRefCode(int purchaseItemRefCode) {
		this.purchaseItemRefCode = purchaseItemRefCode;
	}
	public BigDecimal getCountFact() {
		return countFact;
	}
	public void setCountFact(BigDecimal countFact) {
		this.countFact = countFact;
	}
	public BigDecimal getSumCost() {
		return sumCost;
	}
	public void setSumCost(BigDecimal sumCost) {
		this.sumCost = sumCost;
	}
}
