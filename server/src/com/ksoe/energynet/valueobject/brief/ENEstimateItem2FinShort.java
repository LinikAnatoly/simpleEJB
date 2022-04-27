package com.ksoe.energynet.valueobject.brief;

import java.io.Serializable;
import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.FINMaterials;

public class ENEstimateItem2FinShort extends FINMaterials implements Serializable {

    public int  estimateCode = Integer.MIN_VALUE;
   
    public BigDecimal  estimateCountGen;
    public BigDecimal  estimateCountFact;
    
    public BigDecimal  estimatePrice;
    public BigDecimal  estimateCost;
    
    public int estimateTypeRefCode = Integer.MIN_VALUE;
    
    public int planRefCode = Integer.MIN_VALUE;
    public int planItemRefCode = Integer.MIN_VALUE;
    public BigDecimal planItemRefCountGen;

    public int materialRefCode = Integer.MIN_VALUE;
    public String materialRefName;

    public String measureType;

    public int kartaRefCode = Integer.MIN_VALUE;
    public String kartaRefName;
    public String kartaNum;
    
    public BigDecimal quantityFINMaterials;
    public BigDecimal suggestedQuantity;
    
    public int isobligatory = Integer.MIN_VALUE;
    
	public BigDecimal getSuggestedQuantity() {
		return suggestedQuantity;
	}
	public void setSuggestedQuantity(BigDecimal suggestedQuantity) {
		this.suggestedQuantity = suggestedQuantity;
	}
	public BigDecimal getQuantityFINMaterials() {
		return quantityFINMaterials;
	}
	public void setQuantityFINMaterials(BigDecimal quantityFINMaterials) {
		this.quantityFINMaterials = quantityFINMaterials;
	}
	public int getEstimateCode() {
		return estimateCode;
	}
	public void setEstimateCode(int estimateCode) {
		this.estimateCode = estimateCode;
	}
	public BigDecimal getEstimateCountFact() {
		return estimateCountFact;
	}
	public void setEstimateCountFact(BigDecimal estimateCountFact) {
		this.estimateCountFact = estimateCountFact;
	}
	public BigDecimal getEstimatePrice() {
		return estimatePrice;
	}
	public void setEstimatePrice(BigDecimal estimatePrice) {
		this.estimatePrice = estimatePrice;
	}
	public BigDecimal getEstimateCost() {
		return estimateCost;
	}
	public void setEstimateCost(BigDecimal estimateCost) {
		this.estimateCost = estimateCost;
	}
	public int getPlanRefCode() {
		return planRefCode;
	}
	public void setPlanRefCode(int planRefCode) {
		this.planRefCode = planRefCode;
	}
	public int getPlanItemRefCode() {
		return planItemRefCode;
	}
	public void setPlanItemRefCode(int planItemRefCode) {
		this.planItemRefCode = planItemRefCode;
	}
	public BigDecimal getPlanItemRefCountGen() {
		return planItemRefCountGen;
	}
	public void setPlanItemRefCountGen(BigDecimal planItemRefCountGen) {
		this.planItemRefCountGen = planItemRefCountGen;
	}
	public int getMaterialRefCode() {
		return materialRefCode;
	}
	public void setMaterialRefCode(int materialRefCode) {
		this.materialRefCode = materialRefCode;
	}
	public String getMaterialRefName() {
		return materialRefName;
	}
	public void setMaterialRefName(String materialRefName) {
		this.materialRefName = materialRefName;
	}
	public String getMeasureType() {
		return measureType;
	}
	public void setMeasureType(String measureType) {
		this.measureType = measureType;
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
	public String getKartaNum() {
		return kartaNum;
	}
	public void setKartaNum(String kartaNum) {
		this.kartaNum = kartaNum;
	}
	public BigDecimal getEstimateCountGen() {
		return estimateCountGen;
	}
	public void setEstimateCountGen(BigDecimal estimateCountGen) {
		this.estimateCountGen = estimateCountGen;
	}
	public int getEstimateTypeRefCode() {
		return estimateTypeRefCode;
	}
	public void setEstimateTypeRefCode(int estimateTypeRefCode) {
		this.estimateTypeRefCode = estimateTypeRefCode;
	}
	public int getIsobligatory() {
		return isobligatory;
	}
	public void setIsobligatory(int isobligatory) {
		this.isobligatory = isobligatory;
	}


}
