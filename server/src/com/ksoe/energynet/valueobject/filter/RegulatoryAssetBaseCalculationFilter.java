
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.RegulatoryAssetBaseCalculation;

/**
 * Filter for RegulatoryAssetBaseCalculation;
 * 
 */

public class RegulatoryAssetBaseCalculationFilter extends RegulatoryAssetBaseCalculation {
	private static final long serialVersionUID = 1L;

	public RegulatoryAssetBaseFilter assetFilter;
	public RegulatoryAssetBasePartialWriteOffFilter partialWriteOffFilter;
	
	public BigDecimal originalValueFrom = null;
	public BigDecimal originalValueTo = null;

	public BigDecimal depreciationFrom = null;
	public BigDecimal depreciationTo = null;
	
	public BigDecimal residualValueFrom = null;
	public BigDecimal residualValueTo = null;
	
	public BigDecimal writtenOffValueFrom = null;
	public BigDecimal writtenOffValueTo = null;
	
	public int usefulLifeFrom = Integer.MIN_VALUE;
	public int usefulLifeTo = Integer.MIN_VALUE;
	
	public String conditionSQL;
	public String orderBySQL;

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
	
	public RegulatoryAssetBaseFilter getAssetFilter() {
		return assetFilter;
	}

	public void setAssetFilter(RegulatoryAssetBaseFilter assetFilter) {
		this.assetFilter = assetFilter;
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

	public BigDecimal getDepreciationFrom() {
		return depreciationFrom;
	}

	public void setDepreciationFrom(BigDecimal depreciationFrom) {
		this.depreciationFrom = depreciationFrom;
	}

	public BigDecimal getDepreciationTo() {
		return depreciationTo;
	}

	public void setDepreciationTo(BigDecimal depreciationTo) {
		this.depreciationTo = depreciationTo;
	}

	public BigDecimal getResidualValueFrom() {
		return residualValueFrom;
	}

	public void setResidualValueFrom(BigDecimal residualValueFrom) {
		this.residualValueFrom = residualValueFrom;
	}

	public BigDecimal getResidualValueTo() {
		return residualValueTo;
	}

	public void setResidualValueTo(BigDecimal residualValueTo) {
		this.residualValueTo = residualValueTo;
	}

	public BigDecimal getWrittenOffValueFrom() {
		return writtenOffValueFrom;
	}

	public void setWrittenOffValueFrom(BigDecimal writtenOffValueFrom) {
		this.writtenOffValueFrom = writtenOffValueFrom;
	}

	public BigDecimal getWrittenOffValueTo() {
		return writtenOffValueTo;
	}

	public void setWrittenOffValueTo(BigDecimal writtenOffValueTo) {
		this.writtenOffValueTo = writtenOffValueTo;
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

	public RegulatoryAssetBasePartialWriteOffFilter getPartialWriteOffFilter() {
		return partialWriteOffFilter;
	}

	public void setPartialWriteOffFilter(RegulatoryAssetBasePartialWriteOffFilter partialWriteOffFilter) {
		this.partialWriteOffFilter = partialWriteOffFilter;
	}

	public RegulatoryAssetBaseCalculationFilter() {
		code = Integer.MIN_VALUE;
		period = null;
		originalValue = null;
		depreciation = null;
		residualValue = null;
		this.writtenOffValue = null;
		assetRef.code = Integer.MIN_VALUE;
		this.assetFilter = null;
		this.partialWriteOffFilter = null;
		this.originalValueFrom = null;
		this.originalValueTo = null;
		this.residualValueFrom = null;
		this.residualValueTo = null;
		this.writtenOffValueFrom = null;
		this.writtenOffValueTo = null;
		this.depreciationFrom = null;
		this.depreciationTo = null;
	}

}
