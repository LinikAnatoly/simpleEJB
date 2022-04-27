//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.lists;

/**
 * Short List for ENOperativeObjectHistory;
 */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENOperativeObjectHistoryShort;

public class ENOperativeObjectHistoryShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENOperativeObjectHistoryShort> list = new Vector<ENOperativeObjectHistoryShort>();

	public final int getTotalCount() {
		return totalCount;
	}

	public final void setTotalCount(int aValue) {
		totalCount = aValue;
	}

	public final Vector<ENOperativeObjectHistoryShort> getList() {
		return list;
	}

	public final void setList(Vector<ENOperativeObjectHistoryShort> aValue) {
		list = aValue;
	}

	public final com.ksoe.energynet.valueobject.brief.ENOperativeObjectHistoryShort get(
			int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null) ? 0 : list.size();
	}

} // end of List for ENOperativeObjectHistory

