
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.filter;

import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.energynet.valueobject.RegulatoryAssetBasePartialWriteOff;

/**
 * Filter for RegulatoryAssetBasePartialWriteOff;
 * 
 */

public class RegulatoryAssetBasePartialWriteOffFilter extends RegulatoryAssetBasePartialWriteOff {

	public String conditionSQL;
	public String orderBySQL;

	public Date writeOffDateFrom = null;
	public Date writeOffDateTo = null;
	public BigDecimal valueFrom = null;
	public BigDecimal valueTo = null;
	public BigDecimal percentageFrom = null;
	public BigDecimal percentageTo = null;

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

	public BigDecimal getValueFrom() {
		return valueFrom;
	}

	public void setValueFrom(BigDecimal valueFrom) {
		this.valueFrom = valueFrom;
	}

	public BigDecimal getValueTo() {
		return valueTo;
	}

	public void setValueTo(BigDecimal valueTo) {
		this.valueTo = valueTo;
	}

	public BigDecimal getPercentageFrom() {
		return percentageFrom;
	}

	public void setPercentageFrom(BigDecimal percentageFrom) {
		this.percentageFrom = percentageFrom;
	}

	public BigDecimal getPercentageTo() {
		return percentageTo;
	}

	public void setPercentageTo(BigDecimal percentageTo) {
		this.percentageTo = percentageTo;
	}

	public RegulatoryAssetBasePartialWriteOffFilter() {
		code = Integer.MIN_VALUE;
		writeOffNumber = null;
		writeOffDate = null;
		value = null;
		percentage = null;
		assetRef.code = Integer.MIN_VALUE;
	}

} // end of Filter for RegulatoryAssetBasePartialWriteOff
