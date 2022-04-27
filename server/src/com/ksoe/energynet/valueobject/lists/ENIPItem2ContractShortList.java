//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.lists;

/**
 * Short List for ENIPItem2Contract;
 */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENIPItem2ContractShort;

public class ENIPItem2ContractShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENIPItem2ContractShort> list = new Vector<ENIPItem2ContractShort>();

	public final int getTotalCount() {
		return totalCount;
	}

	public final void setTotalCount(int aValue) {
		totalCount = aValue;
	}

	public final Vector<ENIPItem2ContractShort> getList() {
		return list;
	}

	public final void setList(Vector<ENIPItem2ContractShort> aValue) {
		list = aValue;
	}

	public final com.ksoe.energynet.valueobject.brief.ENIPItem2ContractShort get(
			int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null) ? 0 : list.size();
	}

} // end of List for ENIPItem2Contract

