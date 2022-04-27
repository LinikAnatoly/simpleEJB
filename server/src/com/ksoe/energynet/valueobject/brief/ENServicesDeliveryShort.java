
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENServicesDelivery;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENServicesDeliveryShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public BigDecimal timeGen;
	public BigDecimal costGen;
	public BigDecimal chargeCostGen;
	public BigDecimal costTotal;
	public int servicesCostRefCode = Integer.MIN_VALUE;
	public Date servicesCostRefDateGen;
	public BigDecimal servicesCostRefCalculationCost;
	public BigDecimal servicesCostRefCostWithoutVAT;
	public BigDecimal servicesCostRefCostVAT;
	public BigDecimal servicesCostRefCostWithVAT;
	public int calcDeliveryRefCode = Integer.MIN_VALUE;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setTimeGen(BigDecimal aValue){
		timeGen = aValue;
	}

	public BigDecimal getTimeGen(){
		return timeGen;
	}

	public void setCostGen(BigDecimal aValue){
		costGen = aValue;
	}

	public BigDecimal getCostGen(){
		return costGen;
	}

	public void setChargeCostGen(BigDecimal aValue){
		chargeCostGen = aValue;
	}

	public BigDecimal getChargeCostGen(){
		return chargeCostGen;
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

	public void setCalcDeliveryRefCode(int aValue){
		calcDeliveryRefCode = aValue;
	}
	public int getCalcDeliveryRefCode(){
		return calcDeliveryRefCode;
	}



}