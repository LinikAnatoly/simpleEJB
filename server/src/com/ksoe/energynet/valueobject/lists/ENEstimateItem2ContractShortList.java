//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.lists;

/**
 * Short List for ENEstimateItem2Contract;
 */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENEstimateItem2ContractShort;

public class ENEstimateItem2ContractShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENEstimateItem2ContractShort> list = new Vector<ENEstimateItem2ContractShort>();

	public final int getTotalCount() {
		return totalCount;
	}

	public final void setTotalCount(int aValue) {
		totalCount = aValue;
	}

	public final Vector<ENEstimateItem2ContractShort> getList() {
		return list;
	}

	public final void setList(Vector<ENEstimateItem2ContractShort> aValue) {
		list = aValue;
	}

	public final com.ksoe.energynet.valueobject.brief.ENEstimateItem2ContractShort get(
			int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null) ? 0 : list.size();
	}

} // end of List for ENEstimateItem2Contract

