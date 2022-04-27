//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.lists;

/**
 * Short List for ENDocAttachment2ENServicesObject;
 */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENDocAttachment2ENServicesObjectShort;

public class ENDocAttachment2ENServicesObjectShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENDocAttachment2ENServicesObjectShort> list = new Vector<ENDocAttachment2ENServicesObjectShort>();

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

	public final com.ksoe.energynet.valueobject.brief.ENDocAttachment2ENServicesObjectShort get(
			int anIndex) {
		return (com.ksoe.energynet.valueobject.brief.ENDocAttachment2ENServicesObjectShort) list
				.get(anIndex);
	}

	public final int size() {
		return (list == null) ? 0 : list.size();
	}

} // end of List for ENDocAttachment2ENServicesObject

