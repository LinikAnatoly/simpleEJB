//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.lists;

/**
 * Short List for ENActIncome;
 */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENActIncomeShort;

public class ENActIncomeShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENActIncomeShort> list = new Vector<ENActIncomeShort>();

	public final int getTotalCount() {
		return totalCount;
	}

	public final void setTotalCount(int aValue) {
		totalCount = aValue;
	}

	public final Vector<ENActIncomeShort> getList() {
		return list;
	}

	public final void setList(Vector<ENActIncomeShort> aValue) {
		list = aValue;
	}

	public final com.ksoe.energynet.valueobject.brief.ENActIncomeShort get(
			int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null) ? 0 : list.size();
	}

} // end of List for ENActIncome

