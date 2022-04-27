package com.ksoe.energynet.valueobject;

import java.util.Vector;
import java.util.Date;

public class DSFstWorkRequest {
	private int monthGen = Integer.MIN_VALUE;
	private int yearGen = Integer.MIN_VALUE;
	private int elementCode = Integer.MIN_VALUE;
	private int departmentCode = Integer.MIN_VALUE;
	private int planCode = Integer.MIN_VALUE;
	private String molCode = null;
	private String finExecutorCode = null;
	private Vector<DSFstWork> works = null;
	private Date transferStart;
	private Date transferFinish;
	private Date arrivingOnObjectTime;
	private Date departureFromObjectTime;
	private int vehicleCode = Integer.MIN_VALUE;
	private String driverNumber;

	public int getMonthGen() {
		return this.monthGen;
	}

	public void setMonthGen(int value) {
		this.monthGen = value;
	}

	public int getYearGen() {
		return this.yearGen;
	}

	public void setYearGen(int value) {
		this.yearGen = value;
	}

	public int getDepartmentCode() {
		return this.departmentCode;
	}

	public void setDepartmentCode(int value) {
		this.departmentCode = value;
	}

	public String getMolCode() {
		return this.molCode;
	}

	public void setMolCode(String value) {
		this.molCode = value;
	}

	public String getFinExecutorCode() {
		return this.finExecutorCode;
	}

	public void setFinExecutorCode(String value) {
		this.finExecutorCode = value;
	}
	
	public int getElementCode() {
		return this.elementCode;
	}

	public void setElementCode(int value) {
		this.elementCode = value;
	}
	
	public int getPlanCode() {
		return this.planCode;
	}

	public void setPlanCode(int value) {
		this.planCode = value;
	}
	
	public Vector<DSFstWork> getWorks() {
		return this.works;
	}
	
	public void setWorks(Vector<DSFstWork> value) {
		this.works = value;
	}

	public Date getTransferStart() {
		return this.transferStart;
	}
	
	public void setTransferStart(Date value) {
		this.transferStart = value;
	}
	
	public Date getTransferFinish() {
		return this.transferFinish;
	}
	
	public void setTransferFinish(Date value) {
		this.transferFinish = value;
	}
	
	public int getVehicleCode() {
		return this.vehicleCode;
	}
	
	public void setVehicleCode(int value) {
		this.vehicleCode = value;
	}
	
	public String getDriverNumber() {
		return this.driverNumber;
	}
	
	public void setDriverNumber(String value) {
		this.driverNumber = value;
	}
	
	public Date getArrivingOnObjectTime() {
		return this.arrivingOnObjectTime;
	}

	public void setArrivingOnObjectTime(Date value) {
		this.arrivingOnObjectTime = value;
	}

	public Date getDepartureFromObjectTime() {
		return this.departureFromObjectTime;
	}

	public void setDepartureFromObjectTime(Date value) {
		this.departureFromObjectTime = value;
	}
}
