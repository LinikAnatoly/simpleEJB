
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.lists;

import java.io.Serializable;

/**
* Short List for ENActIncomeCreatMetod;
*/

import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENActIncomeCreatMetodShort;

public class ENActIncomeCreatMetodShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENActIncomeCreatMetodShort> list = new Vector<ENActIncomeCreatMetodShort>();

	public final int getTotalCount() {
		return totalCount;
	}

	public final void setTotalCount(int aValue) {
		totalCount = aValue;
	}

	public final Vector<ENActIncomeCreatMetodShort> getList() {
		return list;
	}

	public final void setList(Vector<ENActIncomeCreatMetodShort> aValue) {
		list = aValue;
	}

	public final com.ksoe.energynet.valueobject.brief.ENActIncomeCreatMetodShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null) ? 0 : list.size();
	}

} // end of List for ENActIncomeCreatMetod
