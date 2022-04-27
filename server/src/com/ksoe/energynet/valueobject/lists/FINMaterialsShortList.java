//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.lists;

/**
 * Short List for FINMaterials;
 */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.FINMaterialsShort;

public class FINMaterialsShortList implements Serializable {

	public int totalCount = 0;
	public Vector<FINMaterialsShort> list = new Vector<FINMaterialsShort>();

	public final int getTotalCount() {
		return totalCount;
	}

	public final void setTotalCount(int aValue) {
		totalCount = aValue;
	}

	public final Vector<FINMaterialsShort> getList() {
		return list;
	}

	public final void setList(Vector<FINMaterialsShort> aValue) {
		list = aValue;
	}

	public final com.ksoe.energynet.valueobject.brief.FINMaterialsShort get(
			int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null) ? 0 : list.size();
	}

} // end of List for FINMaterials

