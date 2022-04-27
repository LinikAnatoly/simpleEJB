package com.ksoe.energynet.valueobject.brief;

public class SCCounterDataShort extends SCCounterShort
{

	public int usageItemKind = Integer.MIN_VALUE;
	public int ozCode = Integer.MIN_VALUE;
	public int ozCount = Integer.MIN_VALUE;
	public int workOrderCode = Integer.MIN_VALUE;
	public String workOrderNumber;
	public int actCode = Integer.MIN_VALUE;
	
	public int planElementRefCode = Integer.MIN_VALUE;
	public int planStateRefCode = Integer.MIN_VALUE;
	public int planRefCode = Integer.MIN_VALUE;
	public int isChangeInZKU = Integer.MIN_VALUE;
	public int budgetRefCode = Integer.MIN_VALUE;
	
	//public String scCounterMolCode;
	
	public int getPlanRefCode() {
		return planRefCode;
	}
	public void setPlanRefCode(int planRefCode) {
		this.planRefCode = planRefCode;
	}
	/*
	public String getScCounterMolCode() {
		return scCounterMolCode;
	}
	public void setScCounterMolCode(String scCounterMolCode) {
		this.scCounterMolCode = scCounterMolCode;
	}
	*/
	public int getActCode() {
		return actCode;
	}
	public void setActCode(int actCode) {
		this.actCode = actCode;
	}
	public int getUsageItemKind() {
		return usageItemKind;
	}
	public void setUsageItemKind(int usageItemKind) {
		this.usageItemKind = usageItemKind;
	}
	public int getWorkOrderCode() {
		return workOrderCode;
	}
	public void setWorkOrderCode(int workOrderCode) {
		this.workOrderCode = workOrderCode;
	}
	public String getWorkOrderNumber() {
		return workOrderNumber;
	}
	public void setWorkOrderNumber(String workOrderNumber) {
		this.workOrderNumber = workOrderNumber;
	}
	public int getOzCode() {
		return ozCode;
	}
	public void setOzCode(int ozCode) {
		this.ozCode = ozCode;
	}
	public int getOzCount() {
		return ozCount;
	}
	public void setOzCount(int ozCount) {
		this.ozCount = ozCount;
	}
	public int getPlanElementRefCode() {
		return planElementRefCode;
	}
	public void setPlanElementRefCode(int planElementRefCode) {
		this.planElementRefCode = planElementRefCode;
	}
	public int getPlanStateRefCode() {
		return planStateRefCode;
	}
	public final int getIsChangeInZKU() {
		return isChangeInZKU;
	}
	public final void setIsChangeInZKU(int isChangeInZKU) {
		this.isChangeInZKU = isChangeInZKU;
	}
	public void setPlanStateRefCode(int planStateRefCode) {
		this.planStateRefCode = planStateRefCode;
	}
	
	public int getBudgetRefCode() {
		return this.budgetRefCode;
	}
	public void setBudgetRefCode(int value) {
		this.budgetRefCode = value;
	}
		
	
}
