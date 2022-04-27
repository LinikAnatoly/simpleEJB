//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.lists;

/**
 * Short List for ENEstimateItem;
 */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENEstimateItemShort;

public class ENEstimateItemShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENEstimateItemShort> list = new Vector<ENEstimateItemShort>();

	public final int getTotalCount() {
		return totalCount;
	}

	public final void setTotalCount(int aValue) {
		totalCount = aValue;
	}

	public final Vector<ENEstimateItemShort> getList() {
		return list;
	}

	public final void setList(Vector<ENEstimateItemShort> aValue) {
		list = aValue;
	}

	public final com.ksoe.energynet.valueobject.brief.ENEstimateItemShort get(
			int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null) ? 0 : list.size();
	}

} // end of List for ENEstimateItem

