
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for RegulatoryAssetBase;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class RegulatoryAssetBaseShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String inventoryNumber;
	public String name;
	public Date incomeDate;
	public String documentNumber;
	public BigDecimal originalValue;
	public Boolean initial ;
	public String writeOffNumber;
	public Date writeOffDate ;
	public int groupRefCode = Integer.MIN_VALUE;
	public String groupRefNumber;
	public String groupRefName;
	public int usefulLife = Integer.MIN_VALUE;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getInventoryNumber() {
		return inventoryNumber;
	}

	public void setInventoryNumber(String inventoryNumber) {
		this.inventoryNumber = inventoryNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getIncomeDate() {
		return incomeDate;
	}

	public void setIncomeDate(Date incomeDate) {
		this.incomeDate = incomeDate;
	}
	
	public String getDocumentNumber() {
		return documentNumber;
	}

	public void setDocumentNumber(String documentNumber) {
		this.documentNumber = documentNumber;
	}

	public BigDecimal getOriginalValue() {
		return originalValue;
	}

	public void setOriginalValue(BigDecimal originalValue) {
		this.originalValue = originalValue;
	}


	public Boolean getInitial() {
		return initial;
	}

	public void setInitial(Boolean initial) {
		this.initial = initial;
	}
	
	public String getWriteOffNumber() {
		return writeOffNumber;
	}

	public void setWriteOffNumber(String writeOffNumber) {
		this.writeOffNumber = writeOffNumber;
	}

	public Date getWriteOffDate() {
		return writeOffDate;
	}

	public void setWriteOffDate(Date writeOffDate) {
		this.writeOffDate = writeOffDate;
	}


	public int getGroupRefCode(){
		return groupRefCode;
	}

	public void setGroupRefCode(int groupRefCode) {
		this.groupRefCode = groupRefCode;
	}

	public String getGroupRefNumber(){
		return groupRefNumber;
	}

	public void setGroupRefNumber(String groupRefNumber) {
		this.groupRefNumber = groupRefNumber;
	}

	public String getGroupRefName(){
		return groupRefName;
	}

	public void setGroupRefName(String groupRefName) {
		this.groupRefName = groupRefName;
	}

	public int getUsefulLife() {
		return usefulLife;
	}

	public void setUsefulLife(int value) {
		this.usefulLife = value;
	}



}
