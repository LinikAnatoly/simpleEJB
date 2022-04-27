
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.lists;

/**
* Short List for FINMolData;  	
*/

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.FINMolDataShort;

public class FINMolDataShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<FINMolDataShort> list = new Vector<FINMolDataShort>();

	public final int getTotalCount() {
		return totalCount;
	}

	public final void setTotalCount(int aValue) {
		totalCount = aValue;
	}

	public final Vector<FINMolDataShort> getList() {
		return list;
	}

	public final void setList(Vector<FINMolDataShort> aValue) {
		list = aValue;
	}

	public final FINMolDataShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null) ? 0 : list.size();
	}

} // end of List for FINMolData
