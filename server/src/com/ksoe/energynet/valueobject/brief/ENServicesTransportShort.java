
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENServicesTransport;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENServicesTransportShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String transportName;
	public BigDecimal machineHoursCount;
	public BigDecimal distance;
	public BigDecimal costMachineHours;
	public BigDecimal costDistance;
	public BigDecimal costTotal;
	public int servicesCostRefCode = Integer.MIN_VALUE;
	public Date servicesCostRefDateGen;
	public BigDecimal servicesCostRefCalculationCost;
	public BigDecimal servicesCostRefCostWithoutVAT;
	public BigDecimal servicesCostRefCostVAT;
	public BigDecimal servicesCostRefCostWithVAT;
	public int calcTransportRefCode = Integer.MIN_VALUE;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}
	
	public void setTransportName(String aValue){
		transportName = aValue;
	}

	public String getTransportName(){
		return transportName;
	}

	public void setMachineHoursCount(BigDecimal aValue){
		machineHoursCount = aValue;
	}

	public BigDecimal getMachineHoursCount(){
		return machineHoursCount;
	}

	public void setDistance(BigDecimal aValue){
		distance = aValue;
	}

	public BigDecimal getDistance(){
		return distance;
	}

	public void setCostMachineHours(BigDecimal aValue){
		costMachineHours = aValue;
	}

	public BigDecimal getCostMachineHours(){
		return costMachineHours;
	}

	public void setCostDistance(BigDecimal aValue){
		costDistance = aValue;
	}

	public BigDecimal getCostDistance(){
		return costDistance;
	}

	public void setCostTotal(BigDecimal aValue){
		costTotal = aValue;
	}

	public BigDecimal getCostTotal(){
		return costTotal;
	}


	public void setServicesCostRefCode(int aValue){
		servicesCostRefCode = aValue;
	}
	public int getServicesCostRefCode(){
		return servicesCostRefCode;
	}

	public void setServicesCostRefDateGen(Date aValue){
		servicesCostRefDateGen = aValue;
	}
	public Date getServicesCostRefDateGen(){
		return servicesCostRefDateGen;
	}

	public void setServicesCostRefCalculationCost(BigDecimal aValue){
		servicesCostRefCalculationCost = aValue;
	}
	public BigDecimal getServicesCostRefCalculationCost(){
		return servicesCostRefCalculationCost;
	}

	public void setServicesCostRefCostWithoutVAT(BigDecimal aValue){
		servicesCostRefCostWithoutVAT = aValue;
	}
	public BigDecimal getServicesCostRefCostWithoutVAT(){
		return servicesCostRefCostWithoutVAT;
	}

	public void setServicesCostRefCostVAT(BigDecimal aValue){
		servicesCostRefCostVAT = aValue;
	}
	public BigDecimal getServicesCostRefCostVAT(){
		return servicesCostRefCostVAT;
	}

	public void setServicesCostRefCostWithVAT(BigDecimal aValue){
		servicesCostRefCostWithVAT = aValue;
	}
	public BigDecimal getServicesCostRefCostWithVAT(){
		return servicesCostRefCostWithVAT;
	}

	public void setCalcTransportRefCode(int aValue){
		calcTransportRefCode = aValue;
	}
	public int getCalcTransportRefCode(){
		return calcTransportRefCode;
	}



}