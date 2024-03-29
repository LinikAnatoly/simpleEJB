//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.lists;

/**
 * Short List for ENContract;
 */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENContractShort;

public class ENContractShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENContractShort> list = new Vector<ENContractShort>();

	public final int getTotalCount() {
		return totalCount;
	}

	public final void setTotalCount(int aValue) {
		totalCount = aValue;
	}

	public final Vector<ENContractShort> getList() {
		return list;
	}

	public final void setList(Vector<ENContractShort> aValue) {
		list = aValue;
	}

	public final com.ksoe.energynet.valueobject.brief.ENContractShort get(
			int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null) ? 0 : list.size();
	}

} // end of List for ENContract

