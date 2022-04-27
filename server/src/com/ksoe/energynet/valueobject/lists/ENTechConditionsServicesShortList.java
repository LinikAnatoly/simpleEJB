//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.lists;

/**
 * Short List for ENTechConditionsServices;
 */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENTechConditionsServicesShort;

public class ENTechConditionsServicesShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENTechConditionsServicesShort> list = new Vector<ENTechConditionsServicesShort>();

	public final int getTotalCount() {
		return totalCount;
	}

	public final void setTotalCount(int aValue) {
		totalCount = aValue;
	}

	public final Vector<ENTechConditionsServicesShort> getList() {
		return list;
	}

	public final void setList(Vector<ENTechConditionsServicesShort> aValue) {
		list = aValue;
	}

	public final com.ksoe.energynet.valueobject.brief.ENTechConditionsServicesShort get(
			int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null) ? 0 : list.size();
	}

} // end of List for ENTechConditionsServices

