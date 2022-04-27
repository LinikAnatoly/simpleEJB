
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENServicesHumenSalary;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENServicesHumenSalaryShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String positionName;
	public BigDecimal salaryHour;
	public BigDecimal timeGen;
	public BigDecimal salary;
	public BigDecimal salaryTotalBonus;
	public BigDecimal salaryTotal;
	public int servicesCostRefCode = Integer.MIN_VALUE;
	public Date servicesCostRefDateGen;
	public BigDecimal servicesCostRefCalculationCost;
	public BigDecimal servicesCostRefCostWithoutVAT;
	public BigDecimal servicesCostRefCostVAT;
	public BigDecimal servicesCostRefCostWithVAT;
	public int calcHumenSalaryRefCode = Integer.MIN_VALUE;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}
	
	public void setPositionName(String aValue){
		positionName = aValue;
	}

	public String getPositionName(){
		return positionName;
	}
	
	public void setSalaryHour(BigDecimal aValue){
		salaryHour = aValue;
	}

	public BigDecimal getSalaryHour(){
		return salaryHour;
	}

	public void setTimeGen(BigDecimal aValue){
		timeGen = aValue;
	}

	public BigDecimal getTimeGen(){
		return timeGen;
	}

	public void setSalary(BigDecimal aValue){
		salary = aValue;
	}

	public BigDecimal getSalary(){
		return salary;
	}





	public void setSalaryTotalBonus(BigDecimal aValue){
		salaryTotalBonus = aValue;
	}

	public BigDecimal getSalaryTotalBonus(){
		return salaryTotalBonus;
	}

	public void setSalaryTotal(BigDecimal aValue){
		salaryTotal = aValue;
	}

	public BigDecimal getSalaryTotal(){
		return salaryTotal;
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

	public void setCalcHumenSalaryRefCode(int aValue){
		calcHumenSalaryRefCode = aValue;
	}
	public int getCalcHumenSalaryRefCode(){
		return calcHumenSalaryRefCode;
	}



}