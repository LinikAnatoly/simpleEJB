
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.lists;

import java.io.Serializable;

/**
* Short List for ENInspectionSheet;
*/

import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENInspectionSheetShort;

public class ENInspectionSheetShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENInspectionSheetShort> list = new Vector<ENInspectionSheetShort>();

	public final int getTotalCount() {
		return totalCount;
	}

	public final void setTotalCount(int aValue) {
		totalCount = aValue;
	}

	public final Vector<ENInspectionSheetShort> getList() {
		return list;
	}

	public final void setList(Vector<ENInspectionSheetShort> aValue) {
		list = aValue;
	}

	public final com.ksoe.energynet.valueobject.brief.ENInspectionSheetShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null) ? 0 : list.size();
	}

} // end of List for ENInspectionSheet
