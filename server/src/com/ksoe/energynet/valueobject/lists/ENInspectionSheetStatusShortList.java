
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.lists;

import java.io.Serializable;

/**
* Short List for ENInspectionSheetStatus;
*/

import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENInspectionSheetStatusShort;

public class ENInspectionSheetStatusShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENInspectionSheetStatusShort> list = new Vector<ENInspectionSheetStatusShort>();

	public final int getTotalCount() {
		return totalCount;
	}

	public final void setTotalCount(int aValue) {
		totalCount = aValue;
	}

	public final Vector<ENInspectionSheetStatusShort> getList() {
		return list;
	}

	public final void setList(Vector<ENInspectionSheetStatusShort> aValue) {
		list = aValue;
	}

	public final com.ksoe.energynet.valueobject.brief.ENInspectionSheetStatusShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null) ? 0 : list.size();
	}

} // end of List for ENInspectionSheetStatus
