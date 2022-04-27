//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.lists;

/**
 * Short List for ENSzBrigade;
 */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENSzBrigadeShort;

public class ENSzBrigadeShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENSzBrigadeShort> list = new Vector<ENSzBrigadeShort>();

	public final int getTotalCount() {
		return totalCount;
	}

	public final void setTotalCount(int aValue) {
		totalCount = aValue;
	}

	public final Vector<ENSzBrigadeShort> getList() {
		return list;
	}

	public final void setList(Vector<ENSzBrigadeShort> aValue) {
		list = aValue;
	}

	public final com.ksoe.energynet.valueobject.brief.ENSzBrigadeShort get(
			int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null) ? 0 : list.size();
	}

} // end of List for ENSzBrigade

