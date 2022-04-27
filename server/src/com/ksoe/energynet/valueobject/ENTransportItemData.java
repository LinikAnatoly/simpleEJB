package com.ksoe.energynet.valueobject;

import java.io.Serializable;
import java.math.BigDecimal;

public class ENTransportItemData implements Serializable {
	
	public int trasnportRealCode = Integer.MIN_VALUE;
	public int trasnportCode = Integer.MIN_VALUE;
	public BigDecimal trasnportRealCount = new BigDecimal(0);
	public BigDecimal price = new BigDecimal(0);
	public BigDecimal rashodWork = new BigDecimal(0);
	public BigDecimal rashodProbeg = new BigDecimal(0);
	public int  kolvomest = Integer.MIN_VALUE; 
	public int transportType = Integer.MIN_VALUE;
	
	public int getTransportRealCode() {
		return trasnportRealCode;
	}
	public void setTransportRealCode(int trasnportRealCode) {
		this.trasnportRealCode = trasnportRealCode;
	}
	public BigDecimal getTrasnportRealCount() {
		return trasnportRealCount;
	}
	public void setTransportRealCount(BigDecimal trasnportRealCount) {
		this.trasnportRealCount = trasnportRealCount;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public BigDecimal getRashodProbeg() {
		return rashodProbeg;
	}
	public void setRashodProbeg(BigDecimal rashodProbeg) {
		this.rashodProbeg = rashodProbeg;
	}
	public BigDecimal getRashodWork() {
		return rashodWork;
	}
	public void setRashodWork(BigDecimal rashodWork) {
		this.rashodWork = rashodWork;
	}
	public int getKolvomest() {
		return kolvomest;
	}
	public void setKolvomest(int kolvomest) {
		this.kolvomest = kolvomest;
	}
	public int getTrasnportCode() {
		return trasnportCode;
	}
	public void setTrasnportCode(int trasnportCode) {
		this.trasnportCode = trasnportCode;
	}

}
