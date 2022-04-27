
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.lists;

/**
* Short List for FINDoc2MolData;  	
*/

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.FINDoc2MolDataShort;

public class FINDoc2MolDataShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<FINDoc2MolDataShort> list = new Vector<FINDoc2MolDataShort>();

	public final int getTotalCount() {
		return totalCount;
	}

	public final void setTotalCount(int aValue) {
		totalCount = aValue;
	}

	public final Vector<FINDoc2MolDataShort> getList() {
		return list;
	}

	public final void setList(Vector<FINDoc2MolDataShort> aValue) {
		list = aValue;
	}

	public final com.ksoe.energynet.valueobject.brief.FINDoc2MolDataShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null) ? 0 : list.size();
	}

} // end of List for FINDoc2MolData
