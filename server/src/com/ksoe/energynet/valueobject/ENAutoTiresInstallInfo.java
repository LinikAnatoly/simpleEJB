package com.ksoe.energynet.valueobject;

import java.io.Serializable;

public class ENAutoTiresInstallInfo implements Serializable {

	public String invNumber;
	public String gosNumber;
	public String transportMark;
	public String installPlaces;

	public String getInvNumber() {
		return invNumber;
	}
	public void setInvNumber(String invNumber) {
		this.invNumber = invNumber;
	}
	public String getGosNumber() {
		return gosNumber;
	}
	public void setGosNumber(String gosNumber) {
		this.gosNumber = gosNumber;
	}
	public String getTransportMark() {
		return transportMark;
	}
	public void setTransportMark(String transportMark) {
		this.transportMark = transportMark;
	}
	public String getInstallPlaces() {
		return installPlaces;
	}
	public void setInstallPlaces(String installPlaces) {
		this.installPlaces = installPlaces;
	}
}