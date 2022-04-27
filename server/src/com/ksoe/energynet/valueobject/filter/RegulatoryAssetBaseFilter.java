
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.energynet.valueobject.RegulatoryAssetBase;
import com.ksoe.energynet.valueobject.brief.RegulatoryAssetBaseGroupShort;

/**
 * Filter for RegulatoryAssetBase;
 * 
 */

public class RegulatoryAssetBaseFilter extends RegulatoryAssetBase {

	private static final long serialVersionUID = 1L;
	
	public String conditionSQL;
	public String orderBySQL;

	public Date incomeDateFrom = null;
	public Date incomeDateTo = null;

	public BigDecimal originalValueFrom = null;
	public BigDecimal originalValueTo = null;

	public int usefulLifeFrom = Integer.MIN_VALUE;
	public int usefulLifeTo = Integer.MIN_VALUE;
	
	public Date writeOffDateFrom = null;
	public Date writeOffDateTo = null;
	
    public int investitionProgramYearFrom = Integer.MIN_VALUE;
    public int investitionProgramYearTo = Integer.MIN_VALUE;
    
	public Date connectionDateFrom = null;
	public Date connectionDateTo = null;
	
	public int codeFrom = Integer.MIN_VALUE;
	public int codeTo = Integer.MIN_VALUE;
    
	public RegulatoryAssetBaseGroupShort[] groupsList = null;

	public final String getConditionSQL() {
		return conditionSQL;
	}

	public final void setConditionSQL(String aValue) {
		conditionSQL = aValue;
	}

	public final String getOrderBySQL() {
		return orderBySQL;
	}

	public final void setOrderBySQL(String aValue) {
		orderBySQL = aValue;
	}

	public Date getIncomeDateFrom() {
		return incomeDateFrom;
	}

	public void setIncomeDateFrom(Date incomeDateFrom) {
		this.incomeDateFrom = incomeDateFrom;
	}

	public Date getIncomeDateTo() {
		return incomeDateTo;
	}

	public void setIncomeDateTo(Date incomeDateTo) {
		this.incomeDateTo = incomeDateTo;
	}

	public BigDecimal getOriginalValueFrom() {
		return originalValueFrom;
	}

	public void setOriginalValueFrom(BigDecimal originalValueFrom) {
		this.originalValueFrom = originalValueFrom;
	}

	public BigDecimal getOriginalValueTo() {
		return originalValueTo;
	}

	public void setOriginalValueTo(BigDecimal originalValueTo) {
		this.originalValueTo = originalValueTo;
	}

	public int getUsefulLifeFrom() {
		return usefulLifeFrom;
	}

	public void setUsefulLifeFrom(int usefulLifeFrom) {
		this.usefulLifeFrom = usefulLifeFrom;
	}

	public int getUsefulLifeTo() {
		return usefulLifeTo;
	}

	public void setUsefulLifeTo(int usefulLifeTo) {
		this.usefulLifeTo = usefulLifeTo;
	}

	public Date getWriteOffDateFrom() {
		return writeOffDateFrom;
	}

	public void setWriteOffDateFrom(Date writeOffDateFrom) {
		this.writeOffDateFrom = writeOffDateFrom;
	}

	public Date getWriteOffDateTo() {
		return writeOffDateTo;
	}

	public void setWriteOffDateTo(Date writeOffDateTo) {
		this.writeOffDateTo = writeOffDateTo;
	}

	public RegulatoryAssetBaseGroupShort[] getGroupsList() {
		return groupsList;
	}

	public void setGroupsList(RegulatoryAssetBaseGroupShort[] groupsList) {
		this.groupsList = groupsList;
	}

	public int getInvestitionProgramYearFrom() {
		return investitionProgramYearFrom;
	}

	public void setInvestitionProgramYearFrom(int investitionProgramYearFrom) {
		this.investitionProgramYearFrom = investitionProgramYearFrom;
	}

	public int getInvestitionProgramYearTo() {
		return investitionProgramYearTo;
	}

	public void setInvestitionProgramYearTo(int investitionProgramYearTo) {
		this.investitionProgramYearTo = investitionProgramYearTo;
	}

	public Date getConnectionDateFrom() {
		return connectionDateFrom;
	}

	public void setConnectionDateFrom(Date connectionDateFrom) {
		this.connectionDateFrom = connectionDateFrom;
	}
	
	public Date getConnectionDateTo() {
		return connectionDateTo;
	}

	public void setConnectionDateTo(Date connectionDateTo) {
		this.connectionDateTo = connectionDateTo;
	}

	public int getCodeFrom() {
		return codeFrom;
	}

	public int getCodeTo() {
		return codeTo;
	}

	public void setCodeFrom(int codeFrom) {
		this.codeFrom = codeFrom;
	}

	public void setCodeTo(int codeTo) {
		this.codeTo = codeTo;
	}

	public RegulatoryAssetBaseFilter() {
	    code = Integer.MIN_VALUE; 
	    inventoryNumber = null; 
	    inventoryCode = Integer.MIN_VALUE; 
	    name = null; 
	    incomeDate = null;
	    documentNumber = null;
	    originalValue = null; 
	    usefulLife = Integer.MIN_VALUE; 
	    initial = null; 
	    writeOffNumber = null; 
	    writeOffDate = null; 
	    investition = null; 
	    investitionProgramName = null; 
	    investitionProgramYear = Integer.MIN_VALUE; 
	    investitionProgramCipher = null; 
	    connection = null; 
	    connectionNumber = null; 
	    connectionDate = null; 
	    connectionContragent = null; 
	    categoryCode = Integer.MIN_VALUE; 
	    parentRef.code = Integer.MIN_VALUE;
	    groupRef.code = Integer.MIN_VALUE;
	    fundingSourceRef.code = Integer.MIN_VALUE;
	    codeFrom = Integer.MIN_VALUE;
	    codeTo = Integer.MIN_VALUE;
	}

} // end of Filter for RegulatoryAssetBase
