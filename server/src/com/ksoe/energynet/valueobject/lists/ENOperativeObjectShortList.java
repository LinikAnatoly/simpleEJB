//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.lists;

/**
 * Short List for ENOperativeObject;
 */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENOperativeObjectShort;

public class ENOperativeObjectShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENOperativeObjectShort> list = new Vector<ENOperativeObjectShort>();

	public final int getTotalCount() {
		return totalCount;
	}

	public final void setTotalCount(int aValue) {
		totalCount = aValue;
	}

	public final Vector<ENOperativeObjectShort> getList() {
		return list;
	}

	public final void setList(Vector<ENOperativeObjectShort> aValue) {
		list = aValue;
	}

	public final com.ksoe.energynet.valueobject.brief.ENOperativeObjectShort get(
			int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null) ? 0 : list.size();
	}

} // end of List for ENOperativeObject

