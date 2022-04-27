package com.ksoe.energynet.valueobject;

public final class DSFstWorkResponse {
	
	private int planCode = Integer.MIN_VALUE;
	private String travelSheetNumber = null;
	
	public int getPlanCode() {
		return this.planCode;
	}
	public void setPlanCode(int value) {
		this.planCode = value;
	}
	public String getTravelSheetNumber() {
		return this.travelSheetNumber;
	}
	public void setTravelSheetNumber(String value) {
		this.travelSheetNumber = value;
	}

}
