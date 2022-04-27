package com.ksoe.energynet.valueobject.brief;

import java.io.Serializable;
import java.math.BigDecimal;

public class ENPlanWorkItemForClosePlanShort implements Serializable {

	public int kartaRefCode = Integer.MIN_VALUE;
	public String kartaNum;
	public String kartaRefName;
	public BigDecimal monthPlanCountGen;
	public BigDecimal factCountGen;
	public BigDecimal npzCountGen;
	public BigDecimal possibleCountGen;
	public BigDecimal countFact;

	public int getKartaRefCode() {
		return kartaRefCode;
	}

	public void setKartaRefCode(int kartaRefCode) {
		this.kartaRefCode = kartaRefCode;
	}

	public String getKartaNum() {
		return kartaNum;
	}

	public void setKartaNum(String kartaNum) {
		this.kartaNum = kartaNum;
	}

	public String getKartaRefName() {
		return kartaRefName;
	}

	public void setKartaRefName(String kartaRefName) {
		this.kartaRefName = kartaRefName;
	}

	public BigDecimal getMonthPlanCountGen() {
		return monthPlanCountGen;
	}

	public void setMonthPlanCountGen(BigDecimal monthPlanCountGen) {
		this.monthPlanCountGen = monthPlanCountGen;
	}

	public BigDecimal getFactCountGen() {
		return factCountGen;
	}

	public void setFactCountGen(BigDecimal factCountGen) {
		this.factCountGen = factCountGen;
	}

	public BigDecimal getNpzCountGen() {
		return npzCountGen;
	}

	public void setNpzCountGen(BigDecimal npzCountGen) {
		this.npzCountGen = npzCountGen;
	}

	public BigDecimal getPossibleCountGen() {
		return possibleCountGen;
	}

	public void setPossibleCountGen(BigDecimal possibleCountGen) {
		this.possibleCountGen = possibleCountGen;
	}

	public BigDecimal getCountFact() {
		return countFact;
	}

	public void setCountFact(BigDecimal countFact) {
		this.countFact = countFact;
	}
}