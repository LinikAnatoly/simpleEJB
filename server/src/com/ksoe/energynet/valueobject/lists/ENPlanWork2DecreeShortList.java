//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.lists;

/**
 * Short List for ENPlanWork2Decree;
 */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENPlanWork2DecreeShort;

public class ENPlanWork2DecreeShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENPlanWork2DecreeShort> list = new Vector<ENPlanWork2DecreeShort>();

	public final int getTotalCount() {
		return totalCount;
	}

	public final void setTotalCount(int aValue) {
		totalCount = aValue;
	}

	public final Vector getList() {
		return list;
	}

	public final void setList(Vector aValue) {
		list = aValue;
	}

	public final com.ksoe.energynet.valueobject.brief.ENPlanWork2DecreeShort get(
			int anIndex) {
		return (com.ksoe.energynet.valueobject.brief.ENPlanWork2DecreeShort) list
				.get(anIndex);
	}

	public final int size() {
		return (list == null) ? 0 : list.size();
	}

} // end of List for ENPlanWork2Decree

