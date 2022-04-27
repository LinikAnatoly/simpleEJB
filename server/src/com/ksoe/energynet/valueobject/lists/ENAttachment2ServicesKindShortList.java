//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.lists;

/**
 * Short List for ENAttachment2ServicesKind;
 */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENAttachment2ServicesKindShort;

public class ENAttachment2ServicesKindShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENAttachment2ServicesKindShort> list = new Vector<ENAttachment2ServicesKindShort>();

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

	public final com.ksoe.energynet.valueobject.brief.ENAttachment2ServicesKindShort get(
			int anIndex) {
		return (com.ksoe.energynet.valueobject.brief.ENAttachment2ServicesKindShort) list
				.get(anIndex);
	}

	public final int size() {
		return (list == null) ? 0 : list.size();
	}

} // end of List for ENAttachment2ServicesKind

