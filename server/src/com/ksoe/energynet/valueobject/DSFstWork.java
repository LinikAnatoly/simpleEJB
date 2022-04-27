package com.ksoe.energynet.valueobject;

import java.text.DateFormat;
import java.util.Date;
import java.util.Vector;

public class DSFstWork {
	
	private int workCode = Integer.MIN_VALUE;
	
	private Date beginTime, endTime; 
	private Vector<String> tabNumbers;
	private int vehicleCode;
	private String driverTabNumber = null;
	
	public int getWorkCode() {
		return this.workCode;
	}
	
	public void setWorkCode(int value) {
		this.workCode = value;
	}

	public Date getBeginTime() {
		return this.beginTime;
	}

	public void setBeginTime(Date value) {
		this.beginTime = value;
	}

	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date value) {
		this.endTime = value;
	}

	public Vector<String> getTabNumbers() {
		return this.tabNumbers;
	}

	public void setTabNumbers(Vector<String> value) {
		this.tabNumbers = value;
	}

	public int getVehicleCode() {
		return this.vehicleCode;
	}

	public void setVehicleCode(int value) {
		this.vehicleCode = value;
	}

	public String getDriverTabNumber() {
		return this.driverTabNumber;
	}

	public void setDriverTabNumber(String value) {
		this.driverTabNumber = value;
	}
	
	public String toString() {
		return String.format("%s [%d, %s - %s, %s, %d, %s]"
				, DSFstWork.class.getName()
				, this.workCode
				, (this.beginTime != null) ? DateFormat.getDateTimeInstance().format(this.beginTime) : ""
				, (this.endTime != null) ? DateFormat.getDateTimeInstance().format(this.endTime) : ""
				, this.tabNumbers
				, this.vehicleCode
				, this.driverTabNumber);
	}
	
	public int hashCode() {
		return super.hashCode();
	}
}